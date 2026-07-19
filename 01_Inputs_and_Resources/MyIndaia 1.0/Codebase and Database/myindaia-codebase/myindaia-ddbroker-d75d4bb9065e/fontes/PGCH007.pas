unit PGCH007;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Buttons, ExtCtrls, StdCtrls, Mask, Grids, DBGrids,
  DBCGrids, ComCtrls, doslib;

type
  Tfrm_Impressao_Cheque = class(TForm)
    pnl_cadastro: TPanel;
    btn_imprime: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_imprime: TMenuItem;
    mi_sair: TMenuItem;
    SpeedButton1: TSpeedButton;
    btn_sair: TSpeedButton;
    pnl_emissao: TPanel;
    dbgrdSolicCheque: TDBGrid;
    lblBancos: TLabel;
    lbl_nr_cheque_ini: TLabel;
    msk_nr_cheque: TMaskEdit;
    lblCheques: TLabel;
    DBCtrlGrid1: TDBCtrlGrid;
    dbchkbox_emitir: TDBCheckBox;
    dbtxt_nr_solic_ch: TDBText;
    dbtxt_favorecido: TDBText;
    dbtxt_vl_solic_: TDBText;
    dbtxt_status: TDBText;
    lbl_nr_solic: TLabel;
    lbl_favorecido: TLabel;
    lbl_vl_solic: TLabel;
    lbl_status: TLabel;
    lbl_emitir: TLabel;
    Mensagem: TStatusBar;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    dbtxt_nr_cheque: TDBText;
    Label3: TLabel;
    Cidade: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_imprimeClick(Sender: TObject);
    procedure Dados(Copia : Boolean );
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Txt : TextFile;
  frm_Impressao_Cheque: Tfrm_Impressao_Cheque;
  str_cr, saida, str_extenso : string;
  Tamanho, Contador : Byte;
  Nr_cheque : Longint;
implementation

{$R *.DFM}
uses GSMLIB, PGGP001, PGGP017, PGCH008;

procedure Tfrm_Impressao_Cheque.FormCreate(Sender: TObject);
begin
  { Cria o DataModule de Dados de Emissão }
  Application.CreateForm(Tdatm_impressao_cheque, datm_impressao_cheque );

  with datm_impressao_cheque do
  begin
    tbl_status_solic_ch_.Open;
    tbl_status_item_solic_ch_.Open;
    tbl_status_ch_.Open;
    tbl_parametro_.Open;

    Cidade.SimpleText := 'Cidade: ' + str_nm_cidade;

    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;

    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;

    qry_solic_usuarios_.Close;
    qry_solic_usuarios_.ParamByName('DT_HOJE').AsString    := FormatDateTime('dd/mm/yyyy', dt_server);
    qry_solic_usuarios_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_solic_usuarios_.ParamByName('CD_CARGO').AsString   := str_cd_cargo;
    qry_solic_usuarios_.Prepare;
    qry_solic_usuarios_.Open;

    qry_solic_banco_.Close;
    qry_solic_banco_.Prepare;
    qry_solic_banco_.Open;

    qry_solic_ch_.Close;
    qry_solic_ch_.Prepare;
    qry_solic_ch_.Open;

  end;
end;

procedure Tfrm_Impressao_Cheque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_impressao_cheque do
  begin
    tbl_status_solic_ch_.Close;
    tbl_status_item_solic_ch_.Close;
    tbl_status_ch_.Close;
    qry_favorecido_.Close;
    qry_banco_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_Impressao_Cheque.btn_sairClick(Sender: TObject);
begin
  if datm_impressao_cheque.qry_solic_ch_.State in [dsEdit] then
     datm_impressao_cheque.qry_solic_ch_.Post;
  Close;
end;

procedure Tfrm_Impressao_Cheque.btn_imprimeClick(Sender: TObject);
var
  cNomeTxt : String;
begin
  if Trim(msk_nr_cheque.Text) = '' then
  begin
    BoxMensagem('Selecione o nº inicial do cheque!', 3);
    msk_nr_cheque.SetFocus;
    Exit;
  end;

  Mensagem.SimpleText := 'Gerando Arquivo de Cheques...';
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  Nr_cheque := StrToInt(msk_nr_cheque.Text);
  str_cr := #13#10;
  {Localiza banco}
  Localiza(datm_impressao_cheque.qry_banco_,
           datm_impressao_cheque.qry_solic_banco_CD_BANCO.AsString, 'CD_BANCO');
  datm_impressao_cheque.qry_solic_ch_.First;
  with datm_impressao_cheque do
  begin
    while Not ( qry_solic_ch_.EOF ) do
    begin
      if qry_solic_ch_IN_EMITIR.AsString = '1' then
      begin
        if Not qry_banco_FORMCONT.AsBoolean then
        begin
          BoxMensagem('Prepare o Cheque nº '+FormatFloat('000000', Nr_cheque), 3);
        end;
        { Montar o nome do Arquivo }
        cNomeTxt := cDir_Risc + '\CHEQUE.TXT';
        { Variável global de controle do Pascal }
        FileMode := 2;
        try
          AssignFile( Txt, cNomeTxt );
          ReWrite( Txt );
        except
          Mensagem.SimpleText := 'Erro na criação do Arquivo.';
          Exit
        end;
        Dados(False);
        {Atualizando Número e Status do Cheque}
        if Not ( qry_solic_ch_.State in [dsEdit] ) then qry_solic_ch_.Edit;
        {Se emitido então fica reemitido}
        if qry_solic_ch_CD_STATUS_CHEQUE.AsString = '1' then
           qry_solic_ch_CD_STATUS_CHEQUE.AsString := '2';
        {Se solicitado então fica emitido}
        if qry_solic_ch_CD_STATUS_CHEQUE.AsString = '0' then
           qry_solic_ch_CD_STATUS_CHEQUE.AsString := '1';
        qry_solic_ch_NR_CHEQUE.AsString := FormatFloat('000000', Nr_cheque);
        Nr_cheque := Nr_cheque + 1;
        {Se não possuir formulário contínuo com cópias carbonadas, emitir a folha de
         cópia de Cheque da S. Magalhães}
        if Not qry_banco_FORMCONT.AsBoolean then
        begin
          Dados(True);
        end;
        CloseFile( Txt );
        qry_solic_ch_IN_EMITIR.AsString := '0';
        qry_solic_ch_.Post;
        Mensagem.SimpleText := 'Arquivo gerado com sucesso.';
        CopyFileLpt1( cNomeTxt, 'LPT1' );
      end
      else
      begin
        if (qry_solic_ch_CD_STATUS_CHEQUE.AsString = '0') then
        begin
          if Not ( qry_solic_ch_.State in [dsEdit] ) then
            qry_solic_ch_.Edit;
          qry_solic_ch_IN_EMITIR.AsString := '1';
        end;
      end;
      datm_impressao_cheque.qry_solic_ch_.Next;
    end;
  end;
  Screen.Cursor := crDefault;
  Application.ProcessMessages;
  Mensagem.SimpleText := 'Fim da impressão dos Cheques';
end;

procedure Tfrm_Impressao_Cheque.Dados(Copia : Boolean);
begin
  try
    with datm_impressao_cheque do
    begin
      {Inicializa}
              { ESC @ ESC x n ESC M EXP ESC C 0 n ESC 0 ESC (  t  3 0 1 25 0 ESC t  1}
      saida := #27#64#27#120#1#27#77#18#27#67#0#3#27#48#27#40#116#3#0#1#25#0#27#116#1;
      Write( Txt, Saida );
      if Copia then
      begin
        saida := SaltaLinhas(8);
        Write( Txt, Saida );
      end;
      saida := SaltaLinhas(qry_banco_LVALOR.AsInteger - 1);
      Write( Txt, Saida );
      {Valor}
      saida := Space( qry_banco_CVALOR.AsInteger ) +
               FormatFloat('###,###,###,##0.00', qry_solic_ch_VL_SOLIC_CH.AsFloat );
      saida := saida + SaltaLinhas(qry_banco_LEXTENSO.AsInteger - qry_banco_LVALOR.AsInteger);
      Write( Txt, saida );
      {Extenso}
      {Determinando tamanho máximo do extenso}
      str_extenso := Extenso(qry_solic_ch_VL_SOLIC_CH.AsFloat);
      Tamanho := 80 - qry_banco_CEXTENSO.AsInteger;
      if Length( str_extenso ) <= Tamanho then
      begin
        saida := Space( qry_banco_CEXTENSO.AsInteger ) + str_extenso;
        saida := saida + SaltaLinhas(qry_banco_LFAVOR.AsInteger - qry_banco_LEXTENSO.AsInteger);
      end
      else
      begin
        Contador := 0;
        while Copy(str_extenso, (Tamanho - Contador), 1) <> ' ' do
        begin
          Contador := Contador + 1;
        end;
        saida := Space( qry_banco_CEXTENSO.AsInteger ) +
                 Space( Contador ) + Copy(str_extenso, 1, (Tamanho - Contador) );
        saida := saida + SaltaLinhas(qry_banco_LEXTENSO2.AsInteger - qry_banco_LEXTENSO.AsInteger);
        saida := saida + Space( qry_banco_CEXTENSO2.AsInteger ) +
                 Copy(str_extenso, (Tamanho - Contador), Length(str_extenso) );
        saida := saida + SaltaLinhas(qry_banco_LFAVOR.AsInteger - qry_banco_LEXTENSO2.AsInteger);
      end;
      Write( Txt, Saida );

      saida := Space( qry_banco_CFAVOR.AsInteger ) +
               UpperCase(qry_solic_ch_lookfavorecido.AsString);
      saida := saida + SaltaLinhas(qry_banco_LCIDADE.AsInteger - qry_banco_LFAVOR.AsInteger);
      Write( Txt, Saida );

      {Cidade + '  ' + Dia + ' ' + Mes + ' ' + Ano }
      saida := Space( datm_impressao_cheque.qry_banco_CCIDADE.AsInteger ) +
               UpperCase(Trim(str_nm_cidade) ) +
               Space( ( ( datm_impressao_cheque.qry_banco_CDIA.AsInteger -
                            datm_impressao_cheque.qry_banco_CCIDADE.AsInteger) -
               Length( Trim(str_nm_cidade) ) ) );
      saida := saida + FormatDateTime('dd', dt_server) +
                       Space( ( ( datm_impressao_cheque.qry_banco_CMES.AsInteger -
                            datm_impressao_cheque.qry_banco_CDIA.AsInteger) - 2 ) );
      saida := saida + UpperCase(ameses[StrToInt(FormatDateTime('mm', dt_server) ) ] ) +
                       Space( ( ( datm_impressao_cheque.qry_banco_CANO.AsInteger -
                            datm_impressao_cheque.qry_banco_CMES.AsInteger) -
                          Length( Trim( ameses[StrToInt(FormatDateTime('mm', dt_server) ) ] ) ) ) );
      case StrToInt(qry_banco_ANOMASK.AsString) of
        9999: saida := saida + FormatDateTime('yyyy', dt_server);
        99: saida := saida + FormatDateTime('yy', dt_server);
        9:  saida := saida + Copy(FormatDateTime('yy', dt_server), 2, 1);
      end;
      Write( Txt, Saida );

      if Copia then
      begin
        saida := SaltaLinhas(qry_banco_LCHEQUE.AsInteger - qry_banco_LCIDADE.AsInteger - 8);
        saida := saida + Space(qry_banco_CCHEQUE.AsInteger) +
                 qry_solic_ch_NR_CHEQUE.AsString +
                 Space( ( (qry_banco_CBANCO.AsInteger - qry_banco_CCHEQUE.AsInteger ) - 6) ) +
                       UpperCase(Trim(qry_banco_AP_BANCO.AsString) );
        Write( Txt, Saida );
      end;

      saida := #12;
      Write( Txt, Saida );
      saida := #27#67#0#6;
      Write( Txt, Saida );
    end;
  except
    Mensagem.SimpleText := 'Erro na geração do Arquivo de Cheques';
    datm_impressao_cheque.qry_solic_ch_.Close;
    CloseFile( Txt );
    Exit
  end;
end;

procedure Tfrm_Impressao_Cheque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

end.


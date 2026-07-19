unit PGCH016;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, ComCtrls, Menus, doslib, DB, Printers,
  Funcoes;

type
  Tfrm_cheque_avulso = class(TForm)
    pnl_financeiro: TPanel;
    btn_sair: TSpeedButton;
    btn_imprimir: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_imprime: TMenuItem;
    mi_sair: TMenuItem;
    pnl_emissao: TPanel;
    lbl_banco_fatur: TLabel;
    btn_cd_banco: TSpeedButton;
    lbl_favorecido: TLabel;
    btn_co_favorecido: TSpeedButton;
    edt_valor: TEdit;
    Label1: TLabel;
    edt_local: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Mensagem: TStatusBar;
    edt_nm_banco: TEdit;
    msk_cd_banco: TMaskEdit;
    edt_nm_favorecido: TEdit;
    msk_cd_favorecido: TMaskEdit;
    msk_data: TDateTimePicker;
    procedure btn_imprimirClick(Sender: TObject);
    procedure GeraArquivoCheque;
    procedure btn_sairClick(Sender: TObject);
    procedure mi_sairClick(Sender: TObject);
    procedure btn_cd_bancoClick(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure Dados(Copia : Boolean);
    procedure msk_cd_bancoExit(Sender: TObject);
    procedure msk_cd_favorecidoExit(Sender: TObject);
    procedure edt_valorEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edt_valorExit(Sender: TObject);
    function habilita_printer:boolean;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_cd_bancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    l_valor:string;
    function Tira_Ponto(Str:String):String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cheque_avulso: Tfrm_cheque_avulso;

implementation

uses PGGP001, GSMLIB, PGCH017, PGSM041, PGSM090;

{$R *.DFM}

Var  Txt : TextFile;
     str_cr, saida, str_extenso:string;
     Tamanho, contador:integer;

procedure Tfrm_cheque_avulso.btn_imprimirClick(Sender: TObject);
var
  cNomeTxt : String;
begin
  if Not habilita_printer then
  begin
    BoxMensagem('Dados insuficientes para emissão do cheque!', 2);
    Exit;
  end;

  Mensagem.SimpleText := 'Gerando Arquivo de Cheques...';
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  cNomeTxt := cDir_Risc + '\CHEQUE.TXT';
  FileMode := 2;

  try
    AssignFile( Txt, cNomeTxt );
//    AssignPrn(Txt);
    ReWrite( Txt );
  except
    Mensagem.SimpleText := 'Erro na criação do Arquivo.';
    Exit
  end;

  GeraArquivoCheque();

  CopyFileLpt1( cNomeTxt, 'LPT1' );

  Screen.Cursor := crDefault;
  Application.ProcessMessages;
  Mensagem.SimpleText := 'Arquivo gerado com sucesso.';
  msk_cd_favorecido.SetFocus;

end;

procedure Tfrm_cheque_avulso.GeraArquivoCheque;
begin
  str_cr := #13#10;
  {Localiza banco}
  with datm_cheque_avulso.qry_banco_ do
  begin
    Prepare;
    ParamByName('CD_BANCO').AsString:= msk_cd_banco.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Banco não encontrado!',2);
      msk_cd_banco.SetFocus;
      close;
      Exit;
    end;
  end;
  {Inicializa}
  saida := #27#64#27#120#1#27#77#18#27#67#0#3#27#48;
  Write( Txt, Saida );
  Dados(False);
  saida := #27#67#0#6;
  Write( Txt, Saida );

  {Se não possuir formulário contínuo com cópias carbonadas, emitir a folha de
   cópia de Cheque da S. Magalhães}
  if Not datm_cheque_avulso.qry_banco_FORMCONT.AsBoolean then
     Dados(True);

  CloseFile( Txt );
  Mensagem.SimpleText := 'Arquivo gerado com sucesso.';
  datm_cheque_avulso.qry_banco_.Close;
end;

procedure Tfrm_cheque_avulso.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_cheque_avulso.mi_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_cheque_avulso.btn_cd_bancoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);
  With frm_banco Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    msk_cd_banco.text:= Cons_OnLine_Texto;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1206';
  msk_cd_bancoExit(nil);
end;

procedure Tfrm_cheque_avulso.btn_co_favorecidoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2208';
  Application.CreateForm(Tfrm_favor, frm_favor);
  With frm_favor Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    msk_cd_favorecido.text:= Cons_OnLine_Texto;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1206';
  msk_cd_favorecidoExit(nil);
end;

procedure Tfrm_cheque_avulso.Dados(Copia : Boolean);
begin
  try
    with datm_cheque_avulso do
    begin
      if Copia then
      begin
        saida := SaltaLinhas(8);
        Write( Txt, Saida );
      end;
      saida := SaltaLinhas(qry_banco_LVALOR.AsInteger - 1);
      Write( Txt, Saida );
      {Valor}
      if Trim( edt_valor.Text ) <> '' then
         saida := Space( qry_banco_CVALOR.AsInteger ) +
                  FormatFloat('###,###,###,##0.00', StrToFloat(Tira_Ponto(edt_valor.Text) ));
      saida := saida + SaltaLinhas(qry_banco_LEXTENSO.AsInteger - qry_banco_LVALOR.AsInteger);
      Write( Txt, saida );
      {Extenso}
      {Determinando tamanho máximo do extenso}
      if Trim( edt_valor.Text ) <> '' then
         str_extenso := Extenso(StrToFloat(Tira_Ponto(edt_valor.Text) ))
      else
         str_extenso := '';
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
               UpperCase(edt_nm_favorecido.text);
      saida := saida + SaltaLinhas(qry_banco_LCIDADE.AsInteger - qry_banco_LFAVOR.AsInteger);
      Write( Txt, Saida );

      {Cidade + '  ' + Dia + ' ' + Mes + ' ' + Ano }
      saida := Space( datm_cheque_avulso.qry_banco_CCIDADE.AsInteger ) +
               Trim( edt_local.Text ) +
               Space( ( ( datm_cheque_avulso.qry_banco_CDIA.AsInteger -
                          datm_cheque_avulso.qry_banco_CCIDADE.AsInteger) -
                          Length( Trim( edt_local.Text ) ) ) );
      saida := saida + FormatDateTime('dd', msk_data.Date ) +
                       Space( ( ( datm_cheque_avulso.qry_banco_CMES.AsInteger -
                            datm_cheque_avulso.qry_banco_CDIA.AsInteger) - 2 ) );
      saida := saida + UpperCase(ameses[StrToInt(FormatDateTime('mm', msk_data.Date ) ) ] ) +
                       Space( ( ( datm_cheque_avulso.qry_banco_CANO.AsInteger -
                            datm_cheque_avulso.qry_banco_CMES.AsInteger) -
                          Length( Trim( ameses[StrToInt(FormatDateTime('mm', msk_data.Date ) ) ] ) ) ) );
      case StrToInt(qry_banco_ANOMASK.AsString) of
        9999: saida := saida + FormatDateTime('yyyy', msk_data.Date );
        99: saida := saida + FormatDateTime('yy', msk_data.Date );
        9:  saida := saida + Copy(FormatDateTime('yy', msk_data.Date ), 2, 1);
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
    end;
  except
    Mensagem.SimpleText := 'Erro na geração do Arquivo de Cheques';
    CloseFile( Txt );
    Exit
  end;
end;


procedure Tfrm_cheque_avulso.msk_cd_bancoExit(Sender: TObject);
begin
  if Trim(msk_cd_banco.Text) = '' then
  begin
    BoxMensagem('Campo Código do Banco deve ser preenchido!', 2);
    msk_cd_banco.SetFocus;
    Exit;
  end;
  try
    msk_cd_banco.text:= StrZero(StrToInt(Trim(msk_cd_banco.text)),3);
  except
    on EConvertError do
    begin
      BoxMensagem('Código do Banco Inválido!',2);
      msk_cd_banco.SetFocus;
      exit;
    end;
  end;
  with datm_cheque_avulso.qry_banco_ do
  begin
    Prepare;
    ParamByName('CD_BANCO').AsString:= msk_cd_banco.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Banco não encontrado!',2);
      msk_cd_banco.SetFocus;
      close;
    end else
    begin
      if FieldByName('IN_ATIVO').AsString = '1' then
         edt_nm_banco.text:= FieldByName('NM_BANCO').AsString
      else
      begin
        BoxMensagem('Banco não esta Ativo!',2);
        msk_cd_banco.SetFocus;
        close;
      end;
      Close;
    end;
  end;
end;

procedure Tfrm_cheque_avulso.msk_cd_favorecidoExit(Sender: TObject);
begin
  if msk_cd_favorecido.Text = '' then
  begin
    BoxMensagem('Campo Código do Banco deve ser preenchido!', 2);
    msk_cd_favorecido.SetFocus;
    exit;
  end;
  try
    msk_cd_favorecido.text:= StrZero(StrToInt(Trim(msk_cd_favorecido.text)),5);
  except
  on EConvertError do
    begin
//      BoxMensagem('Código do Favorecido Inválido!',2);
//      msk_cd_favorecido.SetFocus;
      exit;
    end;
  end;
  with datm_cheque_avulso.qry_favorecido_ do
  begin
    Prepare;
    ParamByName('CD_FAVORECIDO').AsString:= msk_cd_favorecido.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Favorecido não encontrado!',2);
      msk_cd_favorecido.SetFocus;
      close;
    end else edt_nm_favorecido.text:= FieldByName('NM_FAVORECIDO').AsString;
    Close;
  end;
end;

procedure Tfrm_cheque_avulso.edt_valorEnter(Sender: TObject);
begin
  edt_valor.Text := l_valor;
end;

procedure Tfrm_cheque_avulso.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_cheque_avulso, datm_cheque_avulso);
  l_valor := '';
end;

procedure Tfrm_cheque_avulso.edt_valorExit(Sender: TObject);
begin
  if Trim( edt_valor.Text ) <> '' then
  begin
     edt_valor.Text := Tira_Ponto(edt_valor.Text);
     try
       edt_valor.Text := FormatFloat('#0,.00', StrToCurr(edt_valor.Text));
     except
       on EConvertError do
       begin
         BoxMensagem('Valor inválido',2);
         edt_valor.SetFocus;
         edt_valor.SelectAll;
         exit;
       end;
    end;
    l_valor := edt_valor.Text;
  end;
end;

function Tfrm_cheque_avulso.habilita_printer:boolean;
begin
  habilita_printer := True;
  if Trim( msk_cd_banco.Text )        = ''       then habilita_printer := False;
  if ( Trim( msk_cd_favorecido.Text ) = '' ) and
     ( Trim( edt_nm_favorecido.Text ) = '' )     then habilita_printer := False;
  if Trim( edt_local.Text )           = ''       then habilita_printer := False;
  if msk_data.Date                    = 0        then habilita_printer := False;
end;

procedure Tfrm_cheque_avulso.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_cheque_avulso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_cheque_avulso.Free;
  Action:= caFree;
end;

procedure Tfrm_cheque_avulso.msk_cd_bancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_banco then btn_cd_bancoClick(nil);
    if Sender = msk_cd_favorecido then btn_co_favorecidoClick(nil);
  end;

end;

function Tfrm_cheque_avulso.Tira_Ponto(Str:String):String;
begin
  While Pos('.',Str) <> 0 do
    delete(str, Pos('.',Str), 1);
  Tira_Ponto:= Str;
end;

procedure Tfrm_cheque_avulso.FormShow(Sender: TObject);
begin
  with datm_cheque_avulso do
  begin
    tbl_parametro_.Open;
    if Trim(tbl_parametro_CD_BANCO_CHEQUE.AsString) <> '' then
       msk_cd_banco.Text := Trim(tbl_parametro_CD_BANCO_CHEQUE.AsString);
    if Trim(str_nm_cidade) <> '' then
       edt_local.Text    := Trim(str_nm_cidade);
    msk_data.Date        := dt_server;
    msk_cd_banco.SetFocus;
  end;
end;

end.

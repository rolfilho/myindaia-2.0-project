unit PGSD002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask, ExtCtrls, DBTables, Db, UCRPE32, Buttons, Funcoes;

type
  Tfrm_relatorio_extrato_honorarios = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    msk_mes_ano: TMaskEdit;
    Mensagem: TStatusBar;
    btn_imprimir: TButton;
    btn_fechar: TButton;
    Bevel1: TBevel;
    rg_dezena: TRadioGroup;
    crp_sda: TCrpe;
    lbl_cd_unid_neg: TLabel;
    edt_nm_unid_neg: TEdit;
    btn_cd_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function Ult_Dia_Mes(mes, ano: word): String;
    { Private declarations }
  public
    { Public declarations }
    cd_unidade : String[2];
    nr_processo : String[11];
  end;

var
  frm_relatorio_extrato_honorarios: Tfrm_relatorio_extrato_honorarios;

implementation

uses PGGP001, GSMLIB, PGSM018, PGSD008, PGGP017;

{$R *.DFM}

procedure Tfrm_relatorio_extrato_honorarios.btn_imprimirClick(Sender: TObject);
var
  Ano, Mes, Dez, NrIdentificador : Integer;
begin
  Ano := StrToInt( Copy( msk_mes_ano.Text, 3, 4 ) );
  Mes := StrToInt( Copy( msk_mes_ano.Text, 1, 2 ) );
  Dez := rg_dezena.ItemIndex + 1;

  Mensagem.SimpleText := 'Gerando a impressão do relatório ...';
  Application.ProcessMessages;

  Screen.cursor := crHourGlass;

  with crp_sda do
  begin
    Connect := 'DSN=BROKER; UID=' + str_nm_admin + '; PWD=' + str_nm_senha + '; DSQ=BROKER';
  end;

  Application.ProcessMessages;
  with crp_sda, datm_relatorio_extrato_honorarios do
  begin
    ReportName  := cDir_Rpt + '\CRSDA001.RPT';
    ReportTitle := 'Relatório de Honorários ('+ Copy( msk_mes_ano.Text, 1, 2 ) + '/' + Copy( msk_mes_ano.Text, 3, 4 ) + ')';
    try
      datm_main.db_broker.StartTransaction;
      CloseStoredProc( sp_rel_sda_extrato );
      sp_rel_sda_extrato.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
      sp_rel_sda_extrato.ParamByName('@mes').AsInteger        := Mes;
      sp_rel_sda_extrato.ParamByName('@ano').AsInteger        := Ano;
      sp_rel_sda_extrato.ParamByName('@dez').AsInteger        := Dez;
      ExecStoredProc(sp_rel_sda_extrato);
      NrIdentificador := sp_rel_sda_extrato.ParamByName('@nr_identificador').AsInteger;
      CloseStoredProc(sp_rel_sda_extrato);

      datm_main.db_broker.Commit;

      Formulas[0] := 'NrIdentificador = ' + IntToStr( NrIdentificador );
      Formulas[1] := 'Dezena = ' + QuotedStr( IntToStr( ( rg_dezena.ItemIndex + 1 ) ) );

      Execute;

      ApagaDados( 'TREL_SDA_EXTRATO', NrIdentificador );

    except
      Screen.Cursor := crDefault;
      Mensagem.SimpleText := 'Erro na geração do relatório.';
      if datm_main.db_broker.InTransaction then
         datm_main.db_broker.Rollback;
      Exit;
    end;
  end;

  Screen.Cursor := crDefault;

  Mensagem.SimpleText := 'Relatório gerado com sucesso.';
end;

procedure Tfrm_relatorio_extrato_honorarios.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_relatorio_extrato_honorarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  crp_sda.Free;
  Action := caFree;
end;

function Tfrm_relatorio_extrato_honorarios.Ult_Dia_Mes(mes, ano: word): String;
var DtAuxiliar: TDateTime;
    Dia: Word;
begin
  if mes = 12
  then DtAuxiliar:= EncodeDate(ano + 1, 1, 1) - 1
  else DtAuxiliar:= EncodeDate(ano, mes + 1, 1) - 1;
  DecodeDate(DtAuxiliar, Ano, Mes, Dia);
  if dia < 10
  then Ult_Dia_Mes:= '0' + IntToStr(Dia)
  else Ult_Dia_Mes:= IntToStr(Dia);
end;


procedure Tfrm_relatorio_extrato_honorarios.msk_cd_unid_negKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(nil);
  end;
end;

procedure Tfrm_relatorio_extrato_honorarios.msk_cd_unid_negExit(
  Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Text := 'Todas';
    Exit;
  end;

  ValCodEdt(msk_cd_unid_neg);
  with datm_relatorio_extrato_honorarios.qry_unid_neg_ do
  begin
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Unidade não encontrada!', 2 );
      msk_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
      msk_cd_unid_neg.SetFocus;
    end
    else
    begin
      edt_nm_unid_neg.Text := FieldByName('AP_UNID_NEG').AsString;
    end;
    Close;
  end;
end;

procedure Tfrm_relatorio_extrato_honorarios.btn_cd_unid_negClick(
  Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    msk_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_relatorio_extrato_honorarios.FormCreate(Sender: TObject);
begin
 { Inicializa o Data Module para Itens}
  Application.CreateForm( Tdatm_relatorio_extrato_honorarios, datm_relatorio_extrato_honorarios );
end;

procedure Tfrm_relatorio_extrato_honorarios.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_mes_ano.SetFocus;
end;

end.

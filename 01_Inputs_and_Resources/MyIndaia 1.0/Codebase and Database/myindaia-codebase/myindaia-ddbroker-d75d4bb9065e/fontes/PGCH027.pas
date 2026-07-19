unit PGCH027;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCRPE32, StdCtrls, Mask, Buttons;

type
  Tfrm_imp_ir = class(TForm)
    crp_ir: TCrpe;
    lbl_cd_coligada: TLabel;
    btn_cd_coligada: TSpeedButton;
    msk_cd_coligada: TMaskEdit;
    edt_nm_coligada: TEdit;
    lbl_favorecido: TLabel;
    btn_co_favorecido: TSpeedButton;
    edt_nm_favorecido: TEdit;
    msk_cd_favorecido: TMaskEdit;
    btn_iniciar: TButton;
    btn_fechar: TButton;
    Label7: TLabel;
    msk_ano: TMaskEdit;
    Label1: TLabel;
    btn_co_recol: TSpeedButton;
    msk_cd_recol: TMaskEdit;
    edt_nm_natureza: TEdit;
    lbl_data: TLabel;
    msk_data: TMaskEdit;
    procedure btn_cd_coligadaClick(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure msk_cd_coligadaExit(Sender: TObject);
    procedure msk_cd_favorecidoExit(Sender: TObject);
    procedure btn_iniciarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_anoExit(Sender: TObject);
    procedure msk_cd_recolExit(Sender: TObject);
    procedure btn_co_recolClick(Sender: TObject);
    procedure msk_dataExit(Sender: TObject);
    procedure msk_cd_coligadaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    str_cd_layout : String[1];
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_imp_ir: Tfrm_imp_ir;

implementation

uses PGGP001, PGSM090, PGSM096, PGSM148, GSMLIB, PGGP017, PGCH028;

{$R *.DFM}

procedure Tfrm_imp_ir.btn_cd_coligadaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo              := 14;
  datm_consulta_padrao.Tabela.DatabaseName := 'DBBROKER';
  datm_consulta_padrao.Tabela.TableName    := 'TCOLIGADA';

  datm_consulta_padrao.Tabela.Filtered     := False;
  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.st_modificar         := True; // st_modificar;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' Coligada ';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_coligada.Text := frm_consulta_padrao.Cons_OnLine_Texto;
  msk_cd_coligadaExit(nil);
end;

procedure Tfrm_imp_ir.btn_co_favorecidoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Favor, frm_Favor);
  With frm_Favor Do
  Begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_Favor.Cons_OnLine_Texto := msk_cd_favorecido.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_favorecido.Text := frm_Favor.Cons_OnLine_Texto;
  end;
  msk_cd_favorecidoExit(nil);
  msk_cd_favorecido.SetFocus;
end;

procedure Tfrm_imp_ir.msk_cd_coligadaExit(Sender: TObject);
begin
  edt_nm_coligada.Clear;
  if msk_cd_coligada.text = '' then
  begin
    edt_nm_coligada.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_coligada);
  With datm_imp_ir.qry_coligada_ Do
  begin
    ParamByName('CD_COLIGADA').AsString := msk_cd_coligada.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem(' Coligada não encontrada!',2);
      msk_cd_coligada.Clear;
      edt_nm_coligada.Clear;
      msk_cd_coligada.SetFocus;
    end
    else edt_nm_coligada.Text:= FieldByName('NM_COLIGADA').AsString;
    Close;
  end;
end;

procedure Tfrm_imp_ir.msk_cd_favorecidoExit(Sender: TObject);
begin
  edt_nm_favorecido.Clear;
  if msk_cd_favorecido.text = '' then
  begin
    edt_nm_favorecido.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_favorecido);
  With datm_imp_ir.qry_favorecido_ Do
  begin
    Close;
    ParamByName('CD_FAVORECIDO').AsString := msk_cd_favorecido.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem('Favorecido não encontrado!',2);
      msk_cd_favorecido.Clear;
      edt_nm_favorecido.Clear;
      msk_cd_favorecido.SetFocus;
    end
    else edt_nm_favorecido.Text:= FieldByName('NM_FAVORECIDO').AsString;
    Close;
  end;
end;

procedure Tfrm_imp_ir.btn_iniciarClick(Sender: TObject);
begin
  if Trim(msk_cd_coligada.Text) = '' then
  begin
    BoxMensagem('Informe uma Coligada!', 2);
    msk_cd_coligada.SetFocus;
    Exit;
  end;

  if Trim(msk_cd_recol.Text) = '' then
  begin
    BoxMensagem('Informe um Recolhimento!', 2);
    msk_cd_recol.SetFocus;
    Exit;
  end;

  if Trim(msk_ano.Text) = '' then
  begin
    BoxMensagem('Informe o ano!', 2);
    msk_ano.SetFocus;
    Exit;
  end;

  if msk_data.Text = '  /  /    ' then
  begin
    BoxMensagem('Informe a Data de Emissão!', 2);
    msk_data.SetFocus;
    Exit;
  end;

  With crp_ir Do
  begin
    Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    if str_cd_layout = '1' then
       ReportName  := cDir_Rpt + '\CRIR002.RPT'
    else
       ReportName  := cDir_Rpt + '\CRIR003.RPT';
    Formulas[0] := 'Coligada = "'+ msk_cd_coligada.Text + '"';
    Formulas[1] := 'Favorecido = "'+ Trim( msk_cd_favorecido.Text ) + '"';
    Formulas[2] := 'Ano = "'+ Trim( msk_ano.Text ) + '"';
    Formulas[3] := 'Recolhimento = "'+ Trim( msk_cd_recol.Text ) + '"';
    Formulas[4] := 'DataEmissao = "'+ Trim( msk_data.Text ) + '"';
    Execute;
  end;
end;

procedure Tfrm_imp_ir.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_imp_ir.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_imp_ir do
  begin
    if qry_favorecido_.Active then qry_favorecido_.Close;
    if qry_coligada_.Active then qry_coligada_.Close;
    if qry_cd_recol_.Active then qry_cd_recol_.Close;
    Free;
  end;
  action:= cafree;
end;

procedure Tfrm_imp_ir.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_imp_ir, datm_imp_ir);
end;

procedure Tfrm_imp_ir.FormShow(Sender: TObject);
begin
  Caption := 'Emissão do Informe de Rendimentos';
end;

procedure Tfrm_imp_ir.msk_anoExit(Sender: TObject);
begin
  try
    if Trim(msk_ano.text) <> '' then StrToInt(msk_ano.text);
  except
    on EConvertError do
    begin
      BoxMensagem('Ano inválido!',2);
      msk_ano.Setfocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_imp_ir.msk_cd_recolExit(Sender: TObject);
begin
  edt_nm_natureza.Clear;
  if msk_cd_recol.text = '' then
  begin
    edt_nm_natureza.Text := '';
    Exit;
  end;
  ValCodEdt(msk_cd_recol);
  With datm_imp_ir.qry_cd_recol_ Do
  begin
    ParamByName('CD_RECOL').AsString := msk_cd_recol.Text;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem(' Recolhimento não encontrada!',2);
      msk_cd_recol.Clear;
      edt_nm_natureza.Clear;
      msk_cd_recol.SetFocus;
    end
    else
    begin
      edt_nm_natureza.Text:= FieldByName('NM_NATUREZA').AsString;
      str_cd_layout := FieldByName('CD_LAYOUT_IR').AsString;
    end;
    Close;
  end;
end;

procedure Tfrm_imp_ir.btn_co_recolClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo              := 18;
  datm_consulta_padrao.Tabela.DatabaseName := 'DBBROKER';
  datm_consulta_padrao.Tabela.TableName    := 'TCD_RECOL_IR';

  datm_consulta_padrao.Tabela.Filtered     := False;
  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.st_modificar         := True; // st_modificar;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' Recolhimento de I.R. ';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_recol.Text := frm_consulta_padrao.Cons_OnLine_Texto;
  msk_cd_recolExit(nil);
end;

procedure Tfrm_imp_ir.msk_dataExit(Sender: TObject);
begin
  try
    if msk_data.Text <> '  /  /    ' then StrToDate( msk_data.text );
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_data.Clear;
      msk_data.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_imp_ir.msk_cd_coligadaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_coligada then btn_cd_coligadaClick(nil);
    if Sender = msk_cd_recol then btn_co_recolClick(nil);
    if Sender = msk_cd_favorecido then btn_co_favorecidoClick(nil);
  end;
end;

end.

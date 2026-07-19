unit PGPE035;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Mask, Funcoes;

type
  Tfrm_exp_impr_cert_seg = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    msk_nr_processo: TMaskEdit;
    msk_cd_unid_neg: TMaskEdit;
    Ok_btn: TBitBtn;
    Retorna: TBitBtn;
    btn_co_proc_new: TSpeedButton;
    edt_nm_unid_neg: TEdit;
    btn_cd_unid_neg: TSpeedButton;
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure RetornaClick(Sender: TObject);
    procedure Ok_btnClick(Sender: TObject);
    procedure btn_co_proc_newClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    str_nr_proc_exp : String[18];
    str_cd_unid_neg_exp : String[2];
  end;

var
  frm_exp_impr_cert_seg: Tfrm_exp_impr_cert_seg;
  ReportFileName : String;
  ReportPath : String;

implementation

uses PGPE036, GSMLIB, PGGP001, PGSM018, PGSM136, PGGP025;

{$R *.DFM}


procedure Tfrm_exp_impr_cert_seg.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_exp_impr_cert_seg do
    begin
      if Tunid.Active then
         Tunid.Close;
      TUnid.Sql.Clear ;
      TUnid.Sql.Add('select cd_unid_neg, nm_unid_neg from tunid_neg '+
                      'where cd_unid_neg = "' + msk_cd_unid_neg.Text + '" ');
      Tunid.Open;
      if TUnid.Eof then
      begin
        BoxMensagem('Unidade de Negócio não cadastrada!', 2);
        msk_cd_unid_neg.SetFocus;
      end;
      edt_nm_unid_neg.Text := tunid.FieldByName('NM_UNID_NEG').AsString;
    end;
  end;
end;

procedure Tfrm_exp_impr_cert_seg.RetornaClick(Sender: TObject);
begin
  Self.Close;
end;

procedure Tfrm_exp_impr_cert_seg.Ok_btnClick(Sender: TObject);
begin
  if not ConfereNF(msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text) then Exit;
  try
    with datm_exp_impr_cert_seg do
    begin
      Tprocesso.Close;
      Tprocesso.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      Tprocesso.Prepare;
      Tprocesso.Open;

      Tparametros.Close;
      TParametros.Open;

      // Filtra Processo
      Tproc.Close;
      Tproc.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      Tproc.Prepare;
      Tproc.Open;

      // Filtra Agente de Seguro
      TAgenteSeg.Close;
      TAgenteSeg.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      TAgenteSeg.Prepare;
      TAgenteSeg.Open ;

      ReportFileName := cDir_RPT + '\CertSeguro';
      TCartaCred.Close;
      TCartaCred.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
      TCartaCred.Prepare;
      TCartaCred.Open;
      if Not TCartaCred.EOF then
        ReportFileName := ReportFileName + 'CartaCred';
      ReportFileName := ReportFileName + '.rtm';

      ppReport.Reset;
      ppReport.Template.FileName := ReportPath + ReportFileName;
      ppReport.Template.LoadFromFile;
      ppReport.Template.FileName := ReportPath + ReportFileName;
      ppReport.Print;

      TParametros.Close;
    end;
  finally
  end;
end;

procedure Tfrm_exp_impr_cert_seg.btn_co_proc_newClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_exp,frm_consulta_exp);
  frm_consulta_exp.str_cd_unid := frm_exp_impr_cert_seg.msk_cd_unid_neg.Text;
  frm_consulta_exp.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_exp.Nr_Processo <> '') then
    msk_nr_processo.Text := copy( frm_consulta_exp.Nr_Processo, 5, 14 );
end;

procedure Tfrm_exp_impr_cert_seg.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_exp_impr_cert_seg, datm_exp_impr_cert_seg );
end;

procedure Tfrm_exp_impr_cert_seg.FormShow(Sender: TObject);
begin
  if Trim( str_cd_unid_neg_exp ) <> '' then
    msk_cd_unid_neg.Text := str_cd_unid_neg_exp
  else
    msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_nr_processo.SetFocus;

  if Trim( str_nr_proc_exp ) <> '' then
  begin
    msk_nr_processo.Text := str_nr_proc_exp;
    Ok_btn.SetFocus;
  end;
end;

procedure Tfrm_exp_impr_cert_seg.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_nr_processo        then btn_co_proc_newClick(nil);
    if Sender = msk_cd_unid_neg        then btn_cd_unid_negClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
    end;
  end;
end;

procedure Tfrm_exp_impr_cert_seg.btn_cd_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
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

procedure Tfrm_exp_impr_cert_seg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_exp_impr_cert_seg do
  begin
    TUnid.Close;
    TProcesso.Close;
    TParametros.Close;
    TProc.Close;
    TAgenteSeg.Close;
    TCartaCred.Close;
    Free;
  end;

  Action := caFree;
end;

end.

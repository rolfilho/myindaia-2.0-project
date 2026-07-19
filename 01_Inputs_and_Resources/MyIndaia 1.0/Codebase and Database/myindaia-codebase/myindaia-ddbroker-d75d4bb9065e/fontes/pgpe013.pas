unit PGPE013;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Mask, Buttons, ExtCtrls, Menus, Funcoes;

type
  Tfrm_pe_consulta_itens = class(TForm)
    lbl_nr_processo: TLabel;
    btn_nr_processo: TSpeedButton;
    mskedt_nr_processo: TMaskEdit;
    dbgrd_consulta_itens: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    main_cons_itens: TMainMenu;
    mi_sair: TMenuItem;
    pnl_pe_consulta: TPanel;
    lbl_cd_unid_neg: TLabel;
    mskedt_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_cd_unid_neg: TSpeedButton;
    procedure btn_nr_processoClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mskedt_nr_processoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mskedt_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mi_sairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mskedt_cd_unid_negExit(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pe_consulta_itens: Tfrm_pe_consulta_itens;
  NR_PROC_CONSULTA : String[18];

implementation

  uses PGSM018, PGGP015, PGGP001, PGGP003, GSMLIB, PGSM010,
  PGSM096, PGPE014, PGGP023;

{$R *.DFM}

procedure Tfrm_pe_consulta_itens.btn_nr_processoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_consulta_pe, frm_consulta_pe);
  frm_consulta_pe.str_cd_unid := frm_pe_consulta_itens.mskedt_cd_unid_neg.Text;
  frm_consulta_pe.ShowModal;
  mskedt_nr_processo.Text := NR_PROC_CONSULTA;

end;

procedure Tfrm_pe_consulta_itens.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_pe_consulta_itens.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_pe_Consulta_Itens, datm_pe_Consulta_Itens );
end;

procedure Tfrm_pe_consulta_itens.mskedt_nr_processoExit(Sender: TObject);
begin

  with datm_pe_consulta_itens do
  begin

    if mskedt_nr_processo.Text <> '' then
    begin
      qry_pe_itens_.Close;
      qry_pe_itens_.ParamByName('NR_PROCESSO').AsString := mskedt_nr_processo.Text;
      qry_pe_itens_.ParamByName('CD_UNID_NEG').AsString := mskedt_cd_unid_neg.Text;
      qry_pe_itens_.Prepare;
      qry_pe_itens_.Open;
      if Trim(qry_pe_itens_NR_PROCESSO.AsString) = '' then
      begin
        qry_pe_itens_.Close;
        MessageDlg('Não há Itens para este Processo !!', mtError, [mbOk], 0);
        mskedt_nr_processo.Text := '';
        mskedt_nr_processo.Setfocus;
        Exit;
      end;
    end
    else
    begin
      Exit;
    end;
  end;

  str_nr_processo := mskedt_nr_processo.Text;

end;

procedure Tfrm_pe_consulta_itens.FormShow(Sender: TObject);
begin
  mskedt_nr_processo.Text := '';

  mskedt_cd_unid_neg.Text := str_cd_unid_neg;
  mskedt_cd_unid_negExit(nil);

  mskedt_nr_processo.SetFocus;
end;

procedure Tfrm_pe_consulta_itens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_pe_consulta_itens do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_pe_itens_.Close;

    Free;
  end;
  Action := caFree
end;

procedure Tfrm_pe_consulta_itens.mskedt_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
    if Sender = mskedt_nr_processo then btn_nr_processoClick(nil);
  if Key = 9 then
    mskedt_nr_processoExit(nil);
  if Key = 27 then
    btn_fecharClick(nil);

end;




procedure Tfrm_pe_consulta_itens.mi_sairClick(Sender: TObject);
begin
  btn_fecharClick(nil);
end;

procedure Tfrm_pe_consulta_itens.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then btn_fecharClick(nil);
end;


procedure Tfrm_pe_consulta_itens.mskedt_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if mskedt_cd_unid_neg.text = '' then Exit;
  ValCodEdt(mskedt_cd_unid_neg);
  with datm_pe_consulta_itens do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := mskedt_cd_unid_neg.Text;
    qry_unid_neg_.Open;
    if Trim(qry_unid_neg_CD_UNID_NEG.AsString) = '' then
    begin
      BoxMensagem('Unidade não encontrada!',2);
      mskedt_cd_unid_neg.Clear;
      edt_nm_unid_neg.Clear;
    end
    else edt_nm_unid_neg.Text:= qry_unid_neg_.FieldByName('AP_UNID_NEG').AsString;
  end;

end;

procedure Tfrm_pe_consulta_itens.btn_cd_unid_negClick(Sender: TObject);
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
    mskedt_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    mskedt_cd_unid_negExit(nil);
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      mskedt_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    end;
  end;
  mskedt_cd_unid_negExit(nil);

end;

end.

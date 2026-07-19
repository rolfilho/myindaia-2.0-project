unit PGPE009;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  Tfrm_pe_duplica = class(TForm)
    pnl_duplica: TPanel;
    lbl_processo: TLabel;
    Label1: TLabel;
    edt_novo_processo: TEdit;
    btn_ok: TBitBtn;
    btn_cancela: TBitBtn;
    btn_nr_processo: TSpeedButton;
    msk_nr_processo: TMaskEdit;
    procedure edt_novo_processoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_novo_processoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pe_duplica: Tfrm_pe_duplica;

implementation

{$R *.DFM}

uses gsmlib, pgpe010, PGPE004, PGGP023, pggp001, PGPE002;


procedure Tfrm_pe_duplica.edt_novo_processoChange(Sender: TObject);
begin
  If Trim(edt_novo_processo.Text) <> '' then
     btn_ok.Enabled := True
  else
     btn_ok.Enabled := False;

end;

procedure Tfrm_pe_duplica.FormShow(Sender: TObject);
begin
  with datm_pe_duplica do
  begin
    qry_pe_.Close;
    qry_pe_.ParamByName('NR_PROCESSO').AsString := datm_pe.qry_pe_NR_PROCESSO.AsString;
    qry_pe_.ParamByName('CD_UNID_NEG').AsString := frm_pe.msk_cd_unid_neg.Text;
    qry_pe_.Prepare;
    qry_pe_.Open;
  end;

  msk_nr_processo.Text := datm_pe_duplica.qry_pe_NR_PROCESSO.AsString;
  edt_novo_processo.SetFocus;

end;

procedure Tfrm_pe_duplica.FormCreate(Sender: TObject);
begin

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_pe_duplica, datm_pe_duplica );

end;


procedure Tfrm_pe_duplica.btn_nr_processoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_pe,frm_consulta_pe);
  frm_consulta_pe.str_cd_unid := frm_pe.msk_cd_unid_neg.Text;
  frm_consulta_pe.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_pe.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := frm_consulta_pe.Nr_Processo;
    msk_nr_processoExit(nil);
  end;

end;

procedure Tfrm_pe_duplica.msk_nr_processoExit(Sender: TObject);
begin
  if msk_nr_processo.Text <> '' then
  begin
    with datm_pe_duplica do
    begin
      qry_pe_.Close;
      qry_pe_.ParamByName('NR_PROCESSO').AsString := msk_nr_processo.Text;
      qry_pe_.ParamByName('CD_UNID_NEG').AsString := frm_pe.msk_cd_unid_neg.Text;
      qry_pe_.Prepare;
      qry_pe_.Open;

      if qry_pe_.EOF then
      begin
        BoxMensagem( 'Pedido de Exportação inexistente, digite novamente !!', 3 );
        msk_nr_processo.Text := '';
        msk_nr_processo.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_pe_duplica.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
     if Sender = msk_nr_processo then btn_nr_processoClick(nil);
end;

procedure Tfrm_pe_duplica.edt_novo_processoExit(Sender: TObject);
begin
  if edt_novo_processo.Text <> '' then
  begin
    with datm_pe_duplica do
    begin
      qry_pe_.Close;
      qry_pe_.ParamByName('NR_PROCESSO').AsString := edt_novo_processo.Text;
      qry_pe_.ParamByName('CD_UNID_NEG').AsString := frm_pe.msk_cd_unid_neg.Text;
      qry_pe_.Prepare;
      qry_pe_.Open;

      if not (qry_pe_.EOF) then
      begin
        BoxMensagem( 'Pedido de Exportação já existente !!', 3 );
        edt_novo_processo.Text := '';
        edt_novo_processo.SetFocus;
        btn_ok.Enabled := False;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_pe_duplica.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;

end;

end.

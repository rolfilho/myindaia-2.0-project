unit PGSM250;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Buttons, ExtCtrls, StdCtrls, ppViewr, RXCtrls, RxCalc,
  RXDice, Mask, ToolEdit, RXLookup, DBCGrids, ComCtrls, Funcoes, PGGP017;

type
  Tfrm_lembrete_po = class(TForm)
    btn_cancelar: TSpeedButton;
    Bevel2: TBevel;
    btn_adiar: TSpeedButton;
    pnl_sel: TGroupBox;
    cbo_hora: TComboBox;
    tvw_po: TTreeView;
    btn_encolhe: TSpeedButton;
    btn_expande: TSpeedButton;
    btn_print: TSpeedButton;
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_adiarClick(Sender: TObject);
    procedure btn_expandeClick(Sender: TObject);
    procedure btn_encolheClick(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
    procedure tvw_poDblClick(Sender: TObject);

  private
    { Private declarations }
    procedure CarregaArvore;
  public
    { Public declarations }
  end;

var
  frm_lembrete_po: Tfrm_lembrete_po;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGSM251, PGPO001, PGPO018;

procedure Tfrm_lembrete_po.btn_cancelarClick(Sender: TObject);
begin
  btn_cancelar.Tag := 1;
  if btn_cancelar.Enabled then
  begin
    Application.ProcessMessages;
    frm_lembrete_po.FormStyle := fsNormal;
    if BoxMensagem( 'Deseja cancelar aviso?', 1 ) then
    begin
      frm_main.btn_aviso.Hide;
      frm_lembrete_po.Hide;
    end
    else
      frm_lembrete_po.FormStyle := fsStayOnTop;
    Application.ProcessMessages;
  end;
  btn_cancelar.Tag := 0;
end;

procedure Tfrm_lembrete_po.FormShow(Sender: TObject);
begin
  if ( btn_cancelar.Tag = 1 ) or ( btn_adiar.Tag = 1 ) then
  begin
    btn_adiar.Tag := 0;
    Exit;
  end;
  btn_cancelar.Tag := 0;
  btn_adiar.Tag    := 0;
  frm_main.btn_aviso.Hide;
  Caption := 'Olá ' + str_nm_usuario + ', existem avisos pra você!';
  with datm_lembrete_po do
  begin
    qry_aviso_.Close;
    qry_aviso_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_aviso_.Prepare;
    qry_aviso_.Open;
    CarregaArvore;
  end;
end;

procedure Tfrm_lembrete_po.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_lembrete_po, datm_lembrete_po );
  datm_lembrete_po.ppRepLembrete_po.Template.FileName := cDir_RPT + '\RBPO001.rtm';
  datm_lembrete_po.ppRepLembrete_po.Template.LoadFromFile;
end;

procedure Tfrm_lembrete_po.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_lembrete_po.qry_aviso_.Close;
  datm_lembrete_po.Free;
  Action := caFree;
end;

procedure Tfrm_lembrete_po.btn_adiarClick(Sender: TObject);
begin
  btn_adiar.Tag := 1;
  with datm_lembrete_po do
  begin
    case ( cbo_hora.ItemIndex ) + 1 of
      0: tmr_lembrete_po.Interval :=  1800000;
      1: tmr_lembrete_po.Interval :=  3600000;
      2: tmr_lembrete_po.Interval :=  7200000;
      3: tmr_lembrete_po.Interval := 14400000;
      4: tmr_lembrete_po.Interval := 28800000;
    end;
    tmr_lembrete_po.Enabled       := True;
    frm_main.btn_aviso.Show;
    frm_lembrete_po.Hide;
  end;
end;

procedure Tfrm_lembrete_po.CarregaArvore;
var nr_po : String[18];
begin
  Application.ProcessMessages;
  with datm_lembrete_po do
  begin
    nr_po := '';
    qry_aviso_.First;
    while Not qry_aviso_.EOF do
    begin
      {P.O}
      if nr_po <> qry_aviso_NR_PROCESSO.AsString then
      begin
        tvw_po.Items.Add( nil, qry_aviso_NR_PROCESSO.AsString );
        tvw_po.Items.AddChild( tvw_po.Items[tvw_po.Items.Count-1], qry_aviso_CD_EVENTO.AsString + ' - ' +
                                                                   qry_aviso_NM_EVENTO.AsString + ' - ' +
                                                                   FormatDateTime( FData, qry_aviso_DT_LIMITE.AsDateTime ) );
      end
      else
        tvw_po.Items.Add( tvw_po.Items[tvw_po.Items.Count-1], qry_aviso_CD_EVENTO.AsString + ' - ' +
                                                              qry_aviso_NM_EVENTO.AsString + ' - ' +
                                                              FormatDateTime( FData, qry_aviso_DT_LIMITE.AsDateTime ) );

      nr_po := qry_aviso_NR_PROCESSO.AsString;

      qry_aviso_.Next;
    end;
  end;
end;

procedure Tfrm_lembrete_po.btn_expandeClick(Sender: TObject);
begin
  tvw_po.FullExpand;
end;

procedure Tfrm_lembrete_po.btn_encolheClick(Sender: TObject);
begin
  tvw_po.FullCollapse;
end;

procedure Tfrm_lembrete_po.btn_printClick(Sender: TObject);
begin
  with datm_lembrete_po do
  begin
    ppRepLembrete_po.Print;
  end;
end;

procedure Tfrm_lembrete_po.tvw_poDblClick(Sender: TObject);
var
  Arv, ArvPai : TTreeNode;
begin
  Arv := tvw_po.Selected;
  ArvPai := Arv.Parent;
  if ArvPai <> nil then
  begin
    if Not VerIntegridade then Exit;
    vStr_cd_modulo := '18';
    str_cd_rotina := '1807';
    str_cd_mod    := vStr_cd_modulo;
    str_cd_rot    := str_cd_rotina;
    Application.CreateForm(Tfrm_po_flp, frm_po_flp);
    nr_processo_po := ArvPai.Text;
    frm_po_flp.pesq_cd_evento := Copy( Arv.Text, 1, 3 );
    frm_po_flp.ShowModal;
  end
  else
  begin
    if Not VerIntegridade then Exit;
    vStr_cd_modulo := '18';
    str_cd_rotina := '1801';
    str_cd_mod    := vStr_cd_modulo;
    str_cd_rot    := str_cd_rotina;
    Application.CreateForm(Tfrm_PO, frm_PO);
    nr_processo_po := Arv.Text;
    frm_PO.ShowModal;
  end;
end;

end.


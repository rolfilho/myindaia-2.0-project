unit uDispRemessa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Mask, DBCtrls, Grids, DBGrids, ComCtrls, Menus,
  Buttons, ExtCtrls, ConsOnlineEx;

type
  Tfrm_disp_remessa = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    MainMenu1: TMainMenu;
    mi_incluir: TMenuItem;
    mi_Salvar: TMenuItem;
    mi_Cancelar: TMenuItem;
    mi_Excluir: TMenuItem;
    mi_Sair: TMenuItem;
    pgctrl_disp_remessa: TPageControl;
    ts_lista: TTabSheet;
    ts_dados: TTabSheet;
    DBGrid1: TDBGrid;
    dbedt_dt_disp: TDBEdit;
    dbedt_vl_disp: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    qry_disp_remessa_: TQuery;
    ds_disp_remessa: TDataSource;
    qry_disp_remessa_DT_DISP: TDateTimeField;
    qry_disp_remessa_VL_DISP: TFloatField;
    qry_disp_remessa_VL_UTILIZADO: TFloatField;
    qry_disp_remessa_CD_BANCO: TStringField;
    qry_disp_remessa_NM_BANCO: TStringField;
    Update_disp: TUpdateSQL;
    dbedt_cd_bco: TDBEdit;
    dbedt_nm_bco: TDBEdit;
    Label4: TLabel;
    btn_co_bco_ag: TSpeedButton;
    qry_disp_remessa_calc_saldo: TFloatField;
    Panel1: TPanel;
    edt_tt_saldo: TEdit;
    Label5: TLabel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    shp1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure dbedt_dt_dispExit(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure qry_disp_remessa_AfterDelete(DataSet: TDataSet);
    procedure qry_disp_remessa_AfterPost(DataSet: TDataSet);
    procedure btn_co_bco_agClick(Sender: TObject);
    procedure dbedt_cd_bcoExit(Sender: TObject);
    procedure dbedt_vl_dispChange(Sender: TObject);
    procedure qry_disp_remessa_CalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cb_ordemChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_cd_bcoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    a_str_indices : Array[0..3] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    { Public declarations }
  end;

var
  frm_disp_remessa: Tfrm_disp_remessa;

implementation

uses GSMLIB, PGGP017, PGGP001, PGSM041, Funcoes;

{$R *.DFM}

procedure Tfrm_disp_remessa.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_disp_remessa.Cancelar;
begin
 if qry_disp_remessa_.State in [dsEdit,dsInsert] then
    qry_disp_remessa_.Cancel;
 btn_mi(st_incluir,false, false, st_excluir);   

end;

function Tfrm_disp_remessa.Consiste: Boolean;
begin
 consiste:=true;

 if pgctrl_disp_remessa.ActivePage = ts_dados then
   begin
    if qry_disp_remessa_DT_DISP.AsString  = '' then
      begin
       Boxmensagem('Deve ser preenchido a Data',2);
       dbedt_dt_disp.SetFocus;
       Consiste:=false;
       Exit;
      end;

    if not(qry_disp_remessa_VL_DISP.AsFloat  > 0) then
      begin
       Boxmensagem('Deve ser preenchido o valor disponível',2);
       dbedt_vl_disp.SetFocus;
       Consiste:=false;
       Exit;
      end;
    if (dbedt_cd_bco.text = '') then
      begin
       Boxmensagem('Deve ser preenchido o Banco',2);
       dbedt_cd_bco.SetFocus;
       Consiste:=false;
       Exit;
      end;
   end;
end;

procedure Tfrm_disp_remessa.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  { Inicializa o Data Module para Via de Transporte}

 pgctrl_disp_remessa.ActivePage := ts_lista;

 ds_disp_remessa.AutoEdit := st_modificar;
 qry_disp_remessa_.Close;
 qry_disp_remessa_.Prepare;
 qry_disp_remessa_.Open;

  a_str_indices[0] := 'CD_BANCO';
  a_str_indices[1] := 'NM_BANCO';
  a_str_indices[2] := 'VL_DISP';
  a_str_indices[3] := 'VL_UTILIZADO';


  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

  With Tquery.Create(Application) do
   begin
    DAtaBaseName:='DBBROKER';
    Sql.Add('SELECT SUM(VL_DISP), SUM(VL_UTILIZADO) FROM TDISP_REMESSA ');
    Open;

    edt_tt_saldo.text:= FormatFloat('0.00', Fields[0].AsFloat - Fields[1].AsFloat);
    Free;
   end;

end;

function Tfrm_disp_remessa.Grava: Boolean;
begin
try
  datm_main.db_broker.StartTransaction;
    If ( qry_disp_remessa_.State in [dsInsert, dsEdit] ) then
    begin
      qry_disp_remessa_.Post;
    end;
    datm_main.db_broker.Commit;
    Grava := True;

    With Tquery.Create(Application) do
     begin
      DAtaBaseName:='DBBROKER';
      Sql.Add('SELECT SUM(VL_DISP), SUM(VL_UTILIZADO) FROM TDISP_REMESSA ');
      Open;

      edt_tt_saldo.text:= FormatFloat('0.00', Fields[0].AsFloat - Fields[1].AsFloat);
      Free;
     end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      qry_disp_remessa_.Cancel;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );

end;

function Tfrm_disp_remessa.VerAlt: Boolean;
begin

end;

procedure Tfrm_disp_remessa.btn_salvarClick(Sender: TObject);
begin
  if not consiste then exit;
  if not Grava then exit;
  dbnvg.Enabled := True;
  edt_chave.Enabled := True;
  cb_ordem.Enabled := True;
end;

procedure Tfrm_disp_remessa.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  dbnvg.Enabled := True;
  edt_chave.Enabled := True;
  cb_ordem.Enabled := True;
end;

procedure Tfrm_disp_remessa.btn_incluirClick(Sender: TObject);
begin

 pgctrl_disp_remessa.ActivePage := ts_dados;

 qry_disp_remessa_.DisableControls;
 qry_disp_remessa_.Cancel;
 qry_disp_remessa_.Append;
 qry_disp_remessa_.EnableControls;

 dbedt_dt_disp.SetFocus;

 qry_disp_remessa_DT_DISP.AsDatetime   := dt_server;

 qry_disp_remessa_VL_UTILIZADO.AsFloat := 0;

 dbnvg.Enabled := False;
 edt_chave.Enabled := False;
 cb_ordem.Enabled := False;

 btn_mi(false,st_modificar, st_modificar, false);
end;

procedure Tfrm_disp_remessa.dbedt_dt_dispExit(Sender: TObject);
begin
  if not(qry_disp_remessa_.State in [dsEdit,dsInsert]) then exit;

   if dbedt_dt_disp.Text <> '  /  /    ' then
    begin
     with TQuery.Create(Application) do
      begin
       DataBasename:='DBBROKER';
       Sql.Add('SELECT DT_DISP FROM TDISP_REMESSA WHERE DT_DISP = ');
       Sql.Add(' CONVERT(DATETIME,"'+dbedt_dt_disp.Text+'",103)');
       Open;
       if Fields[0].AsString <> '' then
        begin
         Boxmensagem('Para esta data já existe uma valor disponível',2);
         dbedt_dt_disp.SetFocus;
         exit;
        end;
       Free;
      end;
    end;
end;

procedure Tfrm_disp_remessa.btn_sairClick(Sender: TObject);
begin

Close;
end;

procedure Tfrm_disp_remessa.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta Disponibilidade será excluída! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    qry_disp_remessa_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      qry_disp_remessa_.Cancel;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_disp_remessa.qry_disp_remessa_AfterDelete(
  DataSet: TDataSet);
begin
qry_disp_remessa_.ApplyUpdates;
end;

procedure Tfrm_disp_remessa.qry_disp_remessa_AfterPost(DataSet: TDataSet);
begin
qry_disp_remessa_.ApplyUpdates;
end;

procedure Tfrm_disp_remessa.btn_co_bco_agClick(Sender: TObject);
begin
{  vstr_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);

  with frm_banco do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if frm_banco.Cons_OnLine_Texto <> '' then
   begin
   if Not ( qry_disp_remessa_.State in [dsEdit, dsInsert] ) and
         ( st_modificar ) then
        qry_disp_remessa_.Edit;
    qry_disp_remessa_CD_BANCO.AsString:=frm_banco.Cons_OnLine_Texto;
    dbedt_cd_bcoExit(sender);
   end;  }

   if Sender is TSpeedButton then begin
    if not ( qry_disp_remessa_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
     qry_disp_remessa_.Edit;
    qry_disp_remessa_CD_BANCO.AsString := ConsultaOnlineEx('TBANCO', 'Bancos', ['CD_BANCO', 'NM_BANCO'], ['Código', 'Descrição'], 'CD_BANCO', nil, 1, qry_disp_remessa_CD_BANCO.AsString);
  end else begin
    if qry_disp_remessa_.State in [dsEdit, dsInsert] then
      btn_mi(false,st_modificar, st_modificar, false);
    dbedt_nm_bco.Text := ConsultaLookUp('TBANCO', 'CD_BANCO', dbedt_cd_bco.Text, 'NM_BANCO');
  end;
end;

procedure Tfrm_disp_remessa.dbedt_cd_bcoExit(Sender: TObject);
begin
{ if not(qry_disp_remessa_.State in [dsEdit, dsInsert]) then exit;

 if dbedt_cd_bco.text <> '' then
  begin
  ValidCodigo(dbedt_cd_bco);
  With Tquery.Create(Application) do
   begin
    DataBaseName:='DBBROKER';
    Sql.Add('SELECT NM_BANCO FROM TBANCO WHERE CD_BANCO = "'+dbedt_cd_bco.text+'"');
    Open;
    if recordcount > 0 then
    begin
     qry_disp_remessa_NM_BANCO.AsString:=Fields[0].AsString;
    end
    else
     begin
     BoxMensagem('Código do Banco Inválido!',2);
     dbedt_cd_bco.SetFocus;
     dbedt_nm_bco.text:='';
     exit;
    end;
    Free;
   end;
  end
  else dbedt_nm_bco.text:=''; }

  if not(qry_disp_remessa_.State in [dsEdit, dsInsert]) then exit;
  if dbedt_cd_bco.text <> '' then begin
    dbedt_cd_bco.Text := Copy('000', 1, 3 - Length( dbedt_cd_bco.Text)) +  dbedt_cd_bco.Text;
    qry_disp_remessa_NM_BANCO.AsString := ConsultaLookUp('TBANCO', 'CD_BANCO', dbedt_cd_bco.Text, 'NM_BANCO');
    if qry_disp_remessa_NM_BANCO.AsString = '' then begin
      ShowMessage('Código do Banco Inválido!');
      dbedt_cd_bco.SetFocus;
      dbedt_nm_bco.text:='';
      exit;
    end;
  end else
    dbedt_nm_bco.text:='';


end;

procedure Tfrm_disp_remessa.dbedt_vl_dispChange(Sender: TObject);
begin
if qry_disp_remessa_.State in [dsEdit, dsInsert] then
    btn_mi(false,st_modificar, st_modificar, false);
end;

procedure Tfrm_disp_remessa.qry_disp_remessa_CalcFields(DataSet: TDataSet);
begin
  qry_disp_remessa_calc_saldo.AsFloat:=  qry_disp_remessa_VL_DISP.AsFloat - qry_disp_remessa_VL_UTILIZADO.AsFloat ;
end;

procedure Tfrm_disp_remessa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_disp_remessa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_disp_remessa_.Close;
  Action := caFree;
end;

procedure Tfrm_disp_remessa.cb_ordemChange(Sender: TObject);
begin
  edt_chave.Text := '';
  qry_disp_remessa_.Close;
  if cb_ordem.ItemIndex = 1 then
    qry_disp_remessa_.SQL[4] := 'B.' + a_str_indices[cb_ordem.ItemIndex]
  else
    qry_disp_remessa_.SQL[4] := 'D.' + a_str_indices[cb_ordem.ItemIndex];
  qry_disp_remessa_.Prepare;
  qry_disp_remessa_.Open;
  edt_chave.SetFocus;
end;

procedure Tfrm_disp_remessa.edt_chaveChange(Sender: TObject);
begin
  Localiza(qry_disp_remessa_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_disp_remessa.FormShow(Sender: TObject);
begin
  shp1.Brush.Color := clPnlClaroBroker;
  pnl_cadastro.Color := clMenuBroker;
end;

procedure Tfrm_disp_remessa.dbedt_cd_bcoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then btn_co_bco_agClick(btn_co_bco_ag);
end;

end.

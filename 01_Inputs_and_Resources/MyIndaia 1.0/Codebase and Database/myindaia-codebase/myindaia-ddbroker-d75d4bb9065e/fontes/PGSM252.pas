unit PGSM252;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Mask, Db, DBCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, ToolEdit, RXDBCtrl, DBTables, dbcgrids;

type
  Tfrm_at_basf = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_at_basf: TPanel;
    lbl_area: TLabel;
    btn_co_area: TSpeedButton;
    dbedt_cd_area: TDBEdit;
    dbedt_nm_area: TEdit;
    dbedt_nr_pedido: TDBEdit;
    Label1: TLabel;
    dblckpbox_via_transp: TDBLookupComboBox;
    dblckpbox_tp_at_basf: TDBLookupComboBox;
    pgctrl_at_desp: TPageControl;
    dbg_cadastro: TDBGrid;
    btn_imp: TSpeedButton;
    mi_imprimir: TMenuItem;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Shape2: TShape;
    Shape1: TShape;
    Shape3: TShape;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBCtrlGrid1: TDBCtrlGrid;
    DBEdit1: TDBEdit;
    DBText1: TDBText;
    dsDatas: TDataSource;
    qryDatas: TQuery;
    qryDatasNR_PEDIDO: TStringField;
    qryDatasDT_PEDIDO: TDateTimeField;
    qryDatasTipoData: TStringField;
    qryDatasIN_TRANSMISSAO: TStringField;
    qryDatasIN_FOLLOWUP: TStringField;
    qryDatasIN_REVISAO_FAT: TStringField;
    qryDatasIN_DEMURRAGE: TStringField;
    qryDatasIN_CHEC_DOC: TStringField;
    Label2: TLabel;
    Shape4: TShape;
    Label3: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    pnlDatas: TPanel;
    Panel2: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Label4: TLabel;
    dsPedidoAtual: TDataSource;
    qryPedidoAtual: TQuery;
    DBDateEdit1: TDBDateEdit;
    Shape7: TShape;
    Shape8: TShape;
    qryPedidoAtualNR_PEDIDO: TStringField;
    qryPedidoAtualCD_AREA: TStringField;
    qryPedidoAtualTP_AT_BASF: TStringField;
    qryPedidoAtualCD_VIA_TRANSP: TStringField;
    qryPedidoAtualDT_PEDIDO: TDateTimeField;
    qryPedidoAtualIN_TRANSMISSAO: TStringField;
    qryPedidoAtualIN_FOLLOWUP: TStringField;
    qryPedidoAtualVL_TRANSMISSAO: TFloatField;
    qryPedidoAtualVL_FOLLOWUP: TFloatField;
    qryPedidoAtualIN_REVISAO_FAT: TStringField;
    qryPedidoAtualIN_DEMURRAGE: TStringField;
    qryPedidoAtualIN_ENT_BASF: TStringField;
    qryPedidoAtualIN_ENT_BSG: TStringField;
    qryPedidoAtualIN_CHEC_DOC: TStringField;
    qryPedidoAtualVL_REVISAO_FAT: TFloatField;
    qryPedidoAtualVL_DEMURRAGE: TFloatField;
    qryPedidoAtualVL_ENT_BASF: TFloatField;
    qryPedidoAtualVL_ENT_BSG: TFloatField;
    qryPedidoAtualVL_CHEC_DOC: TFloatField;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure pgctrl_at_despChange(Sender: TObject);
    procedure pgctrl_at_despChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_nr_pedidoChange(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure dbedt_cd_areaExit(Sender: TObject);
    procedure dbedt_cd_areaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_impClick(Sender: TObject);
    procedure qryDatasCalcFields(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);

  private
    { Private declarations }
    a_str_indices : Array[0..1] Of String[60];
    a_str_indices2 : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir, lNaoConsiste : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure CodExits;
    procedure VerificaDetalhes;

  public
    { Public declarations }
    NrPedidoAnt : String[15];
    vTemPedidoBranco : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    procedure VerAtBasf;
  end;

var
  frm_at_basf: Tfrm_at_basf;

implementation

uses PGGP001, PGGP017, GSMLIB, PGSM212, PGSM253, PGRE004, Funcoes, ConsOnLineEx;

{$R *.DFM}
procedure Tfrm_at_basf.btn_incluirClick(Sender: TObject);
begin
  SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := False;
  SpeedButton3.Enabled := False;
  SpeedButton4.Enabled := False;
  with datm_at_basf do
  begin
    if qryPedidoAtual.State in [dsInactive] then
       qryPedidoAtual.Open;

    qryPedidoAtual.DisableControls;
//    qryPedidoAtual.Cancel;
    qryPedidoAtual.Insert;
    qryPedidoAtual.EnableControls;
    qryPedidoAtualCD_VIA_TRANSP.AsString  := '01';
//    qryPedidoAtualDT_PEDIDO.AsDateTime    := dt_server;
    qryPedidoAtualIN_TRANSMISSAO.AsString := '0';
    qryPedidoAtualIN_FOLLOWUP.AsString    := '0';
    qryPedidoAtualIN_REVISAO_FAT.AsString := '0';
    qryPedidoAtualIN_DEMURRAGE.AsString   := '0';
    qryPedidoAtualIN_CHEC_DOC.AsString    := '0';
    qryPedidoAtualTP_AT_BASF.AsString     := '0';

    pgctrl_at_desp.ActivePage := ts_dados_basicos;
    pnl_at_basf.Enabled       := True;
    dbedt_nr_pedido.SetFocus;
  end;

  btn_mi( False, True, True, False );
  qryDatas.Close;
end;

procedure Tfrm_at_basf.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
  SpeedButton1.Enabled := True;
  SpeedButton2.Enabled := True;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  qryDatas.Prepare;
  qryDatas.Open;
end;

procedure Tfrm_at_basf.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  SpeedButton1.Enabled := True;
  SpeedButton2.Enabled := True;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  qryDatas.Prepare;
  qryDatas.Open;
end;

procedure Tfrm_at_basf.btn_excluirClick(Sender: TObject);
begin
  with datm_at_basf do
  begin
    if BoxMensagem( 'Este Pedido será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      qryPedidoAtual.Delete;
//      qryPedidoAtual.ApplyUpdates;
      datm_main.db_broker.Commit;
      qry_lista_.Close;
      qry_lista_.Prepare;
      qry_lista_.Open;
      VerAtBasf;
    except
      on E: Exception do
      begin
        TrataErro(E);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_at_basf.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

function Tfrm_at_basf.Consiste : Boolean;
begin
  Consiste := True;

  with datm_at_basf do
  begin
    if ( qryPedidoAtual.State in [dsInsert, dsEdit] ) then
    begin
      if Not lNaoConsiste then
      begin
        {Nº Pedido}
        if Trim( dbedt_nr_pedido.Text ) = '' then
        begin
          BoxMensagem( 'Campo Nº Pedido deve ser preenchido!', 2 );
          pgctrl_at_desp.ActivePage := ts_dados_basicos;
          dbedt_nr_pedido.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      {Área}
      ValidCodigo( dbedt_cd_area );
      if dbedt_cd_area.Text <> '' then
      begin
        if dbedt_nm_area.Text = '' then
        begin
          BoxMensagem( 'Código da Área inválido!', 2 );
          pgctrl_at_desp.ActivePage := ts_dados_basicos;
          dbedt_cd_area.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if Not lNaoConsiste then
      begin
        if dbedt_nm_area.Text = '' then
        begin
          BoxMensagem( 'Campo Área deve ser preenchido!', 2 );
          pgctrl_at_desp.ActivePage := ts_dados_basicos;
          dbedt_cd_area.SetFocus;
          Consiste := False;
          Exit;
        end;

        {Tipo}
        if qryPedidoAtualTP_AT_BASF.AsString = '0' then
        begin
          BoxMensagem( 'Campo Tipo deve ser preenchido!', 2 );
          pgctrl_at_desp.ActivePage := ts_dados_basicos;
          dblckpbox_tp_at_basf.SetFocus;
          Consiste := False;
          Exit;
        end;

        {Data}
//        if dbedt_dt_pedido.Text = '  /  /    ' then
//        begin
//          BoxMensagem( 'Campo Data deve ser preenchido!', 2 );
//          pgctrl_at_desp.ActivePage := ts_dados_basicos;
//          dbedt_dt_pedido.SetFocus;
//          Consiste := False;
//          Exit;
//        end;
      end;
    end;
  end;
end;

function Tfrm_at_basf.Grava;
begin
  Grava := False;

  with datm_at_basf do
  begin
    if pgctrl_at_desp.ActivePage = ts_dados_basicos then
    begin
      NrPedidoAnt := qryPedidoAtualNR_PEDIDO.AsString;
      qryPedidoAtual.Post;
      Grava := True;
      qry_lista_.Close;
      qry_lista_.Prepare;
      qry_lista_.Open;
      qry_lista_.Locate('NR_PEDIDO', NrPedidoAnt, [loCaseInsensitive] );
      VerAtBasf;
    end;
  end;

  btn_mi( st_incluir, False, False, st_excluir );
end;

function Tfrm_at_basf.VerAlt : Boolean;
begin
  VerAlt := True;

  if ( ( qryPedidoAtual.State in [dsEdit] ) and st_modificar ) or
     ( qryPedidoAtual.State in [dsInsert] ) then
  begin
    if BoxMensagem( 'Cadastro de Pedidos foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      if Not Consiste then
      begin
        VerAlt := False;
        Exit;
      end;
      if Not Grava then
      begin
        VerAlt := False;
        Exit;
      end;
    end
    else
      Cancelar;
  end;
end;

procedure Tfrm_at_basf.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_at_basf.edt_chaveChange(Sender: TObject);
begin
  try
    with datm_at_basf do
    begin
      case cb_ordem.ItemIndex of
        0: Localiza( qry_lista_, edt_chave.Text, a_str_indices2[cb_ordem.ItemIndex] );
      else
        qry_lista_.Locate( a_str_indices2[cb_ordem.ItemIndex], edt_chave.Text, [loCaseInsensitive] );
      end;
    end;
  except
  end;
end;

procedure Tfrm_at_basf.edt_chaveKeyDown(Sender: TObject;var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_at_basf.cb_ordemClick(Sender: TObject);
begin
  with datm_at_basf do
  begin
    Pesquisa := qryPedidoAtualNR_PEDIDO.AsString;

    edt_chave.Text := '';
    qry_lista_.Close;
    qry_lista_.SQL[11] := a_str_indices[cb_ordem.ItemIndex];
    qry_lista_.Prepare;
    qry_lista_.Open;
    Localiza( qry_lista_, Pesquisa, a_str_indices2[0] );
    edt_chave.SetFocus;
  end;
end;

procedure Tfrm_at_basf.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := qryPedidoAtualNR_PEDIDO.AsString;
    except
      try
        Cons_OnLine_Texto := qryPedidoAtualNR_PEDIDO.AsString;
      except
        BoxMensagem( 'Não consegui retornar Nº Pedido!', 2 );
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_at_basf.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_at_basf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_at_basf do
    begin
      qryPedidoAtual.Close;
      qry_via_transp_broker_.Close;
      qry_tp_at_basf_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_at_basf.FormCreate(Sender: TObject);
begin
 { Inicializa o Data Module para Atendimento BASF}
  Application.CreateForm( Tdatm_at_basf, datm_at_basf );
end;

procedure Tfrm_at_basf.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_at_basf.FormShow(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  pgctrl_at_desp.ActivePage := ts_lista;
  edt_chave.SetFocus;
  with datm_at_basf do
  begin
    ds_at_basf.AutoEdit := st_modificar;

    qry_via_transp_broker_.Close;
    qry_via_transp_broker_.Prepare;
    qry_via_transp_broker_.Open;

    qry_tp_at_basf_.Close;
    qry_tp_at_basf_.Prepare;
    qry_tp_at_basf_.Open;

    qry_lista_.Close;
    qry_lista_.SQL[11] := 'T1.NR_PEDIDO';
    qry_lista_.Prepare;
    qry_lista_.Open;
  end;
  a_str_indices[0]  := 'T1.NR_PEDIDO';
//  a_str_indices[1]  := 'B.DT_PEDIDO DESC, B.NR_PEDIDO';

  a_str_indices2[0] := 'NR_PEDIDO';
//  a_str_indices2[1] := 'DT_PEDIDO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Nº Pedido');
//    Items.Add('Data');
//    ItemIndex := 1;
    ItemIndex := 0;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

  Shape3.Brush.Color := clPnlClaroBroker;
  Shape4.Brush.Color := clMenuBroker;
  Shape5.Brush.Color := clPnlClaroBroker;
  pnl_cadastro.Color := clMenuBroker;

  btn_mi( True, False, False, True );
 
end;

procedure Tfrm_at_basf.Cancelar;
begin
  with datm_at_basf do
  begin
    try
      if qryPedidoAtual.State in [dsInsert, dsEdit] then
      begin
        qryPedidoAtual.Cancel;
        VerAtBasf;
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end;
end;

procedure Tfrm_at_basf.VerAtBasf;
begin
//  pnl_at_basf.Enabled := ( Not ( qryPedidoAtual.State in [dsInactive] ) );
end;

procedure Tfrm_at_basf.pgctrl_at_despChange(Sender: TObject);
begin
  if ( pgctrl_at_desp.ActivePage = ts_lista ) then
  begin
    qryPedidoAtual.Close;
    qryDatas.Close;
    dbnvg.Enabled     := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled  := True;
  end
  else
  begin
    qryPedidoAtual.Open;
    qryDatas.Open;
    dbnvg.Enabled     := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled  := False;
  end;
end;

procedure Tfrm_at_basf.pgctrl_at_despChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_at_basf.dbedt_nr_pedidoChange(Sender: TObject);
begin
  if ( qryPedidoAtual.State in [ dsInsert, dsEdit ] ) then
  begin
    if pnlDatas.Visible then
      btn_mi( False, False, False, False )
    else
      btn_mi( False, True, True, False );
  end;
end;

procedure Tfrm_at_basf.btn_co_areaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(qryPedidoAtual) then exit;
    qryPedidoAtualCD_AREA.AsString := ConsultaOnLineEx('TAREA','Áreas',['CD_AREA','NM_AREA'],['Código','Nome'],'CD_AREA',nil)
  end else
    dbedt_nm_area.Text := ConsultaLookUP('TAREA','CD_AREA',qryPedidoAtualCD_AREA.AsString,'NM_AREA')
end;

procedure Tfrm_at_basf.dbedt_cd_areaExit(Sender: TObject);
begin
  CodExits;
end;
procedure Tfrm_at_basf.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_at_basf.dbedt_cd_areaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_area then btn_co_areaClick(nil);
  end;
end;

procedure Tfrm_at_basf.btn_impClick(Sender: TObject);
begin
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1817';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm( Tfrm_sel_unid_cli_imp_area, frm_sel_unid_cli_imp_area );
  frm_sel_unid_cli_imp_area.tp_rel     := 2;
  frm_sel_unid_cli_imp_area.ComPeriodo := True;
  frm_sel_unid_cli_imp_area.ShowModal;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1816';
end;


procedure Tfrm_at_basf.qryDatasCalcFields(DataSet: TDataSet);
begin
  if qryDatas.FieldByName('IN_TRANSMISSAO').AsString = '1' then
    qryDatas.FieldByName('TipoData').AsString := 'Data de Transmissão';
  if qryDatas.FieldByName('IN_FOLLOWUP').AsString = '1' then
    qryDatas.FieldByName('TipoData').AsString := 'Data de FollowUp';
  if qryDatas.FieldByName('IN_REVISAO_FAT').AsString = '1' then
    qryDatas.FieldByName('TipoData').AsString := 'Data de Revisão de Fatura';
  if qryDatas.FieldByName('IN_DEMURRAGE').AsString = '1' then
    qryDatas.FieldByName('TipoData').AsString := 'Data de Demurrage';
  if qryDatas.FieldByName('IN_CHEC_DOC').AsString = '1' then
    qryDatas.FieldByName('TipoData').AsString := 'Data de Checagem Documental';
end;

procedure Tfrm_at_basf.SpeedButton1Click(Sender: TObject);
begin
  btn_mi( False, False, False, False );
  pnlDatas.Visible := True;
  SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := True;
  SpeedButton3.Enabled := True;
  VerificaDetalhes;
end;

procedure Tfrm_at_basf.VerificaDetalhes;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TAT_BASF WHERE IN_TRANSMISSAO = ''1'' AND NR_PEDIDO = ''' + dbedt_nr_pedido.text + '''');
    Open;
    RadioButton1.Enabled := ( Fields[0].AsInteger = 0 );
    Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TAT_BASF WHERE IN_FOLLOWUP = ''1'' AND NR_PEDIDO = ''' + dbedt_nr_pedido.text + '''');
    Open;
    RadioButton2.Enabled := ( Fields[0].AsInteger = 0 );
    Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TAT_BASF WHERE IN_REVISAO_FAT = ''1'' AND NR_PEDIDO = ''' + dbedt_nr_pedido.text + '''');
    Open;
    RadioButton3.Enabled := ( Fields[0].AsInteger = 0 );
    Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TAT_BASF WHERE IN_DEMURRAGE = ''1'' AND NR_PEDIDO = ''' + dbedt_nr_pedido.text + '''');
    Open;
    RadioButton4.Enabled := ( Fields[0].AsInteger = 0 );
    Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TAT_BASF WHERE IN_CHEC_DOC = ''1'' AND NR_PEDIDO = ''' + dbedt_nr_pedido.text + '''');
    Open;
    RadioButton5.Enabled := ( Fields[0].AsInteger = 0 );
    Close;

    vTemPedidoBranco := ( (RadioButton1.Enabled) and (RadioButton2.Enabled) and (RadioButton3.Enabled) and
                          (RadioButton4.Enabled) and (RadioButton5.Enabled) );

    if not (RadioButton1.Enabled) and not (RadioButton2.Enabled) and not (RadioButton3.Enabled) and not (RadioButton4.Enabled) and not (RadioButton5.Enabled) then
    begin
      ShowMessage('Você já cadastrou os 5 tipos possíveis.');
      pnlDatas.Visible := False;
      btn_mi( True, False, False, True );
      SpeedButton1.Enabled := True;
      SpeedButton2.Enabled := False;
      SpeedButton3.Enabled := False;
    end;

    Free;
  end;
end;

procedure Tfrm_at_basf.SpeedButton2Click(Sender: TObject);
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    if vTemPedidoBranco then
    begin
      SQL.Add('UPDATE TAT_BASF SET DT_PEDIDO      = :DT_PEDIDO,');
      SQL.Add('                    IN_TRANSMISSAO = ''' + IIF(RadioButton1.Checked,'1','0') + ''',');
      SQL.Add('                    IN_FOLLOWUP    = ''' + IIF(RadioButton2.Checked,'1','0') + ''',');
      SQL.Add('                    IN_REVISAO_FAT = ''' + IIF(RadioButton3.Checked,'1','0') + ''',');
      SQL.Add('                    IN_DEMURRAGE   = ''' + IIF(RadioButton4.Checked,'1','0') + ''',');
      SQL.Add('                    IN_CHEC_DOC    = ''' + IIF(RadioButton5.Checked,'1','0') + '''');
      SQL.Add(' WHERE NR_PEDIDO = ''' + dbedt_nr_pedido.Text + '''');
    end
    else
    begin
      SQL.Add('INSERT INTO TAT_BASF VALUES (:NR_PEDIDO, :CD_AREA, :TP_AT_BASF, :CD_VIA_TRANSP, :DT_PEDIDO, :IN_TRANSMISSAO,');
      SQL.Add('                             :IN_FOLLOWUP, :VL_TRANSMISSAO, :VL_FOLLOWUP, :IN_REVISAO_FAT, :IN_DEMURRAGE,');
      SQL.Add('                             :IN_ENT_BASF, :IN_ENT_BSG, :IN_CHEC_DOC, :VL_REVISAO_FAT, :VL_DEMURRAGE, :VL_ENT_BASF,');
      SQL.Add('                             :VL_ENT_BSG, :VL_CHEC_DOC)');
      ParamByName('NR_PEDIDO').AsString       := qryPedidoAtual.FieldByName('NR_PEDIDO').AsString;
      ParamByName('CD_AREA').AsString         := qryPedidoAtual.FieldByName('CD_AREA').AsString;
      ParamByName('TP_AT_BASF').AsString      := qryPedidoAtual.FieldByName('TP_AT_BASF').AsString;
      ParamByName('CD_VIA_TRANSP').AsString   := qryPedidoAtual.FieldByName('CD_VIA_TRANSP').AsString;
      ParamByName('IN_TRANSMISSAO').AsString  := IIF(RadioButton1.Checked,'1','0');
      ParamByName('IN_FOLLOWUP').AsString     := IIF(RadioButton2.Checked,'1','0');
      ParamByName('IN_REVISAO_FAT').AsString  := IIF(RadioButton3.Checked,'1','0');
      ParamByName('IN_DEMURRAGE').AsString    := IIF(RadioButton4.Checked,'1','0');
      ParamByName('IN_ENT_BASF').AsString     := '0';
      ParamByName('IN_ENT_BSG').AsString      := '0';
      ParamByName('IN_CHEC_DOC').AsString     := IIF(RadioButton5.Checked,'1','0');
      ParamByName('VL_TRANSMISSAO').AsFloat   := IIF(RadioButton1.Checked,StrToFloat( FastLookup( 'TTP_AT_BASF', qryPedidoAtualTP_AT_BASF, 'TP_AT_BASF', 'VL_TRANSMISSAO', '' ) ),0);
      ParamByName('VL_FOLLOWUP').AsFloat      := IIF(RadioButton2.Checked,StrToFloat( FastLookup( 'TTP_AT_BASF', qryPedidoAtualTP_AT_BASF, 'TP_AT_BASF', 'VL_FOLLOWUP', '' ) ),0);
      ParamByName('VL_REVISAO_FAT').AsFloat   := IIF(RadioButton3.Checked,StrToFloat( FastLookup( 'TTP_AT_BASF', qryPedidoAtualTP_AT_BASF, 'TP_AT_BASF', 'VL_REVISAO_FAT', '' ) ),0);
      ParamByName('VL_DEMURRAGE').AsFloat     := IIF(RadioButton4.Checked,StrToFloat( FastLookup( 'TTP_AT_BASF', qryPedidoAtualTP_AT_BASF, 'TP_AT_BASF', 'VL_DEMURRAGE', '' ) ),0);
      ParamByName('VL_ENT_BASF').AsFloat      := 0;
      ParamByName('VL_ENT_BSG').AsFloat       := 0;
      ParamByName('VL_CHEC_DOC').AsFloat      := IIF(RadioButton5.Checked,StrToFloat( FastLookup( 'TTP_AT_BASF', qryPedidoAtualTP_AT_BASF, 'TP_AT_BASF', 'VL_CHEC_DOC', '' ) ),0);
    end;
    ParamByName('DT_PEDIDO').AsDateTime := DBDateEdit1.Date;
    ExecSQL;
    Free;
  end;
  pnlDatas.Visible := False;
  SpeedButton1.Enabled := True;
  SpeedButton2.Enabled := False;
  SpeedButton3.Enabled := False;
  qryDatas.Close;
  qryDatas.Prepare;
  qryDatas.Open;
  NrPedidoAnt := qryPedidoAtualNR_PEDIDO.AsString;
  datm_at_basf.qry_lista_.Close;
  datm_at_basf.qry_lista_.Prepare;
  datm_at_basf.qry_lista_.Open;
  datm_at_basf.qry_lista_.Locate('NR_PEDIDO', NrPedidoAnt, [loCaseInsensitive] );
  btn_mi( True, False, False, True );
end;

procedure Tfrm_at_basf.SpeedButton3Click(Sender: TObject);
begin
  pnlDatas.Visible := False;
  SpeedButton1.Enabled := True;
  SpeedButton2.Enabled := False;
  SpeedButton3.Enabled := False;
  btn_mi( True, False, False, True );
end;

procedure Tfrm_at_basf.SpeedButton4Click(Sender: TObject);
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('DELETE FROM TAT_BASF WHERE NR_PEDIDO = ''' + dbedt_nr_pedido.Text + '''');
    if qryDatasIN_TRANSMISSAO.AsString = '1' then
      SQL.Add(' AND IN_TRANSMISSAO = ''1''');
    if qryDatasIN_FOLLOWUP.AsString = '1' then
      SQL.Add(' AND IN_FOLLOWUP = ''1''');
    if qryDatasIN_REVISAO_FAT.AsString = '1' then
      SQL.Add(' AND IN_REVISAO_FAT = ''1''');
    if qryDatasIN_DEMURRAGE.AsString = '1' then
      SQL.Add(' AND IN_DEMURRAGE = ''1''');
    if qryDatasIN_CHEC_DOC.AsString = '1' then
      SQL.Add(' AND IN_CHEC_DOC = ''1''');
    ExecSQL;
    Free;
  end;
  qryDatas.Close;
  qryDatas.Prepare;
  qryDatas.Open;
  NrPedidoAnt := qryPedidoAtualNR_PEDIDO.AsString;
  datm_at_basf.qry_lista_.Close;
  datm_at_basf.qry_lista_.Prepare;
  datm_at_basf.qry_lista_.Open;
  datm_at_basf.qry_lista_.Locate('NR_PEDIDO', NrPedidoAnt, [loCaseInsensitive] );
  btn_mi( True, False, False, True );
end;

end.



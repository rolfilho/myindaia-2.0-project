unit PGSM048;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBTables, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, ToolEdit, CurrEdit, RXDBCtrl, RxGrdCpt;

type
  Tfrm_moeda = class(TForm)
    pgctrl_moeda: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    lbl_cd_moeda: TLabel;
    lbl_nm_moeda: TLabel;
    lblAtivo: TLabel;
    dbedt_cd_moeda: TDBEdit;
    dbedt_nm_moeda: TDBEdit;
    dblkpcbox_ativo: TDBLookupComboBox;
    ts_taxa_cambio: TTabSheet;
    pgctrl_taxa_cambio: TPageControl;
    ts_lista2: TTabSheet;
    lbl_moeda: TLabel;
    dbg_contatos: TDBGrid;
    dbedt_cd_moeda2: TDBEdit;
    dbedt_nm_moeda2: TDBEdit;
    ts_dados_basicos2: TTabSheet;
    Panel1: TPanel;
    lbl_dt_inicio_vig: TLabel;
    lbl_dt_termino_vig: TLabel;
    lbl_tx_cambio: TLabel;
    lbl_moeda2: TLabel;
    dbedt_dt_inicio_vig: TDBEdit;
    dbedt_dt_termino_vig: TDBEdit;
    dbedt_tx_cambio: TDBEdit;
    dbedt_cd_moeda3: TDBEdit;
    dbedt_nm_moeda3: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    lbl_via_transp_siscomex: TLabel;
    dbedt_cd_moeda_scx: TDBEdit;
    dbedt_nm_moeda_scx: TDBEdit;
    btn_co_moeda_scx: TSpeedButton;
    lbl_sigla: TLabel;
    dbedt_ap_moeda: TDBEdit;
    PageControl1: TPageControl;
    tbsht_port: TTabSheet;
    tbsht_ingles: TTabSheet;
    tbsht_espanhol: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    dbedt_nm_moeda_sing: TDBEdit;
    Label3: TLabel;
    dbedt_nm_moeda_plural: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dbedt_nm_cent_sing: TDBEdit;
    Label6: TLabel;
    dbedt_nm_cent_plural: TDBEdit;
    Label7: TLabel;
    dbedt_nm_moeda_sing_ing: TDBEdit;
    dbedt_nm_cent_sing_ing: TDBEdit;
    Label8: TLabel;
    dbedt_nm_cent_plural_ing: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    dbedt_nm_moeda_plural_ing: TDBEdit;
    Label11: TLabel;
    dbedt_nm_moeda_sing_esp: TDBEdit;
    dbedt_nm_cent_sing_esp: TDBEdit;
    Label12: TLabel;
    dbedt_nm_cent_plural_esp: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    dbedt_nm_moeda_plural_esp: TDBEdit;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    ts_taxa_frete: TTabSheet;
    pgctrlTaxaFrete: TPageControl;
    tsListaFrete: TTabSheet;
    lbl1: TLabel;
    dbgrd1: TDBGrid;
    dbedt1: TDBEdit;
    dbedt2: TDBEdit;
    tsDadosBasicosFrete: TTabSheet;
    pnl1: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    dbedt3: TDBEdit;
    dbedt4: TDBEdit;
    dbedt5: TDBEdit;
    dbedt6: TDBEdit;
    dbedt7: TDBEdit;
    Label15: TLabel;
    DBEdit1: TDBEdit;
    Label16: TLabel;
    DBEdit2: TDBEdit;
    shp1: TShape;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_moedaChange(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_cd_moedaExit(Sender: TObject);
    procedure dbedt_nm_moedaChange(Sender: TObject);
    procedure dbedt_cd_moeda_scxExit(Sender: TObject);
    procedure btn_co_moeda_scxClick(Sender: TObject);
    procedure dbedt_dt_inicio_vigChange(Sender: TObject);
    procedure dbedt_tx_cambioExit(Sender: TObject);
    procedure dbedt_dt_termino_vigExit(Sender: TObject);
    procedure dbedt_dt_inicio_vigExit(Sender: TObject);
    procedure pgctrl_moedaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_moeda_scxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt3Exit(Sender: TObject);
    procedure dbedt4Exit(Sender: TObject);
    procedure dbedt3Change(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure dbedt3Enter(Sender: TObject);
  private
    OnChanging: Boolean;
    a_str_indices : Array[0..2] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    lcd_moeda_scx, lap_moeda, lnm_moeda, ldt_inicio, ldt_termino : Boolean;
    vDtIni: TDateTime;
    vMudouData: Boolean;
    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    procedure Cancelar;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure AjustaCambio;
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_Online_Texto : String;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String );
  end;

var
  frm_moeda: Tfrm_moeda;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM049, PGSM096, PGSM148, ConsOnlineEx;

procedure Tfrm_moeda.AjustaCambio;
begin
 with datm_moeda do
 begin
  if qry_moeda_broker_.State <> dsInactive then
  begin
     qry_conv_cambio_.Close;
     qry_conv_cambio_.ParamByName('CD_MOEDA').asString := qry_moeda_broker_CD_MOEDA.asString;
     qry_conv_cambio_.Open;
  end;
  if ( qry_conv_cambio_.RecordCount = 0 ) and ( qry_taxa_cambio_.RecordCount > 0 ) then
  begin
     qry_taxa_cambio_.Last;
     qry_conv_cambio_.Append;
     qry_conv_cambio_Codigo.asString := qry_taxa_cambio_CD_MOEDA.asString;
     qry_conv_cambio_Descricao.asString := qry_taxa_cambio_LookMoeda.AsString;
     qry_conv_cambio_Taxa_Conversao.asString := FormatFloat('#0,.000000', qry_taxa_cambio_TX_CAMBIO.asFloat );
     qry_conv_cambio_Vigencia_Fim_Taxa.AsString := FormatDateTime('dd/mm/yyyy', qry_taxa_cambio_DT_TERMINO_VIGENCIA.asDatetime );
     qry_conv_cambio_Vigencia_Inicio_Taxa.AsString := FormatDateTime('dd/mm/yyyy', qry_taxa_cambio_DT_INICIO_VIGENCIA.asDateTime );
     qry_conv_cambio_.Post;
     qry_taxa_cambio_.First;
  end
  else if ( qry_conv_cambio_.RecordCount > 0 ) and ( qry_taxa_cambio_.RecordCount > 0 ) then
  begin
     qry_taxa_cambio_.Last;
     qry_conv_cambio_.Edit;
     qry_conv_cambio_Descricao.asString := qry_taxa_cambio_LookMoeda.AsString;
     qry_conv_cambio_Taxa_Conversao.asString := FormatFloat('#0,.000000', qry_taxa_cambio_TX_CAMBIO.asFloat );
     qry_conv_cambio_Vigencia_Fim_Taxa.AsString := FormatDateTime('dd/mm/yyyy', qry_taxa_cambio_DT_TERMINO_VIGENCIA.asDatetime );
     qry_conv_cambio_Vigencia_Inicio_Taxa.AsString := FormatDateTime('dd/mm/yyyy', qry_taxa_cambio_DT_INICIO_VIGENCIA.asDateTime );
     qry_conv_cambio_.Post;
     qry_taxa_cambio_.First;
  end
  else if ( qry_taxa_cambio_.RecordCount = 0 ) and ( qry_conv_cambio_.RecordCount > 0 ) then
    qry_conv_cambio_.Delete;
 end;
end;

procedure Tfrm_moeda.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  lap_moeda    := False;
  lnm_moeda    := False;
  ldt_inicio   := False;
  ldt_termino  := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  // Inicializa o Data Module para Moedas
  Application.CreateForm( Tdatm_moeda, datm_moeda );

  with datm_moeda do
  begin
    ds_moeda.AutoEdit := st_modificar;
    ds_taxa_cambio.AutoEdit := st_modificar;
    tbl_yesno_.Open;

    qry_moeda_scx_.Close;
    qry_moeda_scx_.Prepare;
    qry_moeda_scx_.Open;

    qry_moeda_broker_.SQL[2] := 'NM_MOEDA';
    qry_moeda_broker_.Prepare;
    qry_moeda_broker_.Open;

    qry_conv_cambio_.Close;
    qry_conv_cambio_.ParamByName('CD_MOEDA').asString := qry_moeda_broker_CD_MOEDA.asString; 
    qry_conv_cambio_.Open;

    qry_taxa_cambio_.DisableControls;
    qry_taxa_cambio_.Close;
    qry_taxa_cambio_.ParamByName('CD_MOEDA').AsString := qry_moeda_broker_CD_MOEDA.AsString;
    qry_taxa_cambio_.Prepare;
    qry_taxa_cambio_.Open;
    qry_taxa_cambio_.EnableControls;

    qryTaxaFrete.DisableControls;
    qryTaxaFrete.Close;
    qryTaxaFrete.ParamByName('CD_MOEDA').AsString := qry_moeda_broker_CD_MOEDA.AsString;
    qryTaxaFrete.Prepare;
    qryTaxaFrete.Open;
    qryTaxaFrete.EnableControls;

  end;

  a_str_indices[0] := 'CD_MOEDA';
  a_str_indices[1] := 'NM_MOEDA';
  a_str_indices[2] := 'AP_MOEDA';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    Items.Add('Sigla');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_moeda.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_moeda.ActivePage := ts_lista;
  pgctrl_taxa_cambio.ActivePage := ts_lista2;
  pgctrlTaxaFrete.ActivePage := tsListaFrete;
  edt_chave.SetFocus;
end;

procedure Tfrm_moeda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_moeda.tbl_yesno_.Close;
  datm_moeda.qry_moeda_scx_.Close;
  datm_moeda.qry_taxa_cambio_.Close;
  datm_moeda.qryTaxaFrete.Close;
  datm_moeda.qry_moeda_broker_.Close;
  datm_moeda.qry_conv_cambio_.Close;
//  datm_moeda.Destroy;
  datm_moeda.Free;
  Action := caFree;
end;

procedure Tfrm_moeda.pgctrl_moedaChange(Sender: TObject);
begin
  OnChanging := False;

  if ldt_termino then
  begin
    ldt_termino := False;
    pgctrl_moeda.ActivePage := ts_taxa_cambio;
    pgctrl_taxa_cambio.ActivePage := ts_dados_basicos2;
    dbedt_dt_termino_vig.SetFocus;
    Exit;
  end;

  if ldt_inicio then
  begin
    ldt_inicio := False;
    pgctrl_moeda.ActivePage := ts_taxa_cambio;
    pgctrl_taxa_cambio.ActivePage := ts_dados_basicos2;
    dbedt_dt_inicio_vig.SetFocus;
    Exit;
  end;

  if lnm_moeda then
  begin
    lnm_moeda := False;
    pgctrl_moeda.ActivePage := ts_dados_basicos;
    dbedt_nm_moeda.SetFocus;
    Exit;
  end;

  if lap_moeda then
  begin
    lap_moeda := False;
    pgctrl_moeda.ActivePage := ts_dados_basicos;
    dbedt_ap_moeda.SetFocus;
    Exit;
  end;

  if lcd_moeda_scx then
  begin
    lcd_moeda_scx := False;
    pgctrl_moeda.ActivePage := ts_dados_basicos;
    dbedt_cd_moeda_scx.SetFocus;
    Exit;
  end;

  if (pgctrl_moeda.ActivePage=ts_lista) or
     (pgctrl_moeda.ActivePage=ts_dados_basicos) then
     dbnvg.DataSource := datm_moeda.ds_moeda
  else if (pgctrl_moeda.ActivePage = ts_taxa_cambio) then
     dbnvg.DataSource := datm_moeda.ds_taxa_cambio
  else if (pgctrl_moeda.ActivePage = ts_taxa_frete) then
     dbnvg.DataSource := datm_moeda.dsTaxaFrete;

  if (pgctrl_moeda.ActivePage = ts_lista ) or
     ((pgctrl_moeda.ActivePage = ts_taxa_cambio ) and
      (pgctrl_taxa_cambio.ActivePage = ts_lista2 ) ) or
     ((pgctrl_moeda.ActivePage = ts_taxa_frete ) and
      (pgctrlTaxaFrete.ActivePage = tsListaFrete ) )      then
  begin
    dbnvg.Enabled := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled := True;
  end
  else
  begin
    dbnvg.Enabled := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
  end;

  if (pgctrl_moeda.ActivePage=ts_dados_basicos) then
  begin
    dbedt_cd_moeda.ReadOnly := True;
    dbedt_nm_moeda.SetFocus;
  end;

  if (pgctrl_moeda.ActivePage = ts_taxa_frete )  and (pgctrlTaxaFrete.ActivePage = tsListaFrete ) then
    datm_moeda.qryTaxaFrete.Locate('CD_MOEDA;DT_INICIO', VarArrayOf([datm_moeda.qry_moeda_broker_CD_MOEDA.AsString, FormatDateTime('dd/mm/yyyy', now)]), [loCaseInsensitive]);
  if (pgctrl_moeda.ActivePage = ts_taxa_cambio ) and (pgctrl_taxa_cambio.ActivePage = ts_lista2 ) then
      datm_moeda.qry_taxa_cambio_.Locate('CD_MOEDA;DT_INICIO_VIGENCIA', VarArrayOf([datm_moeda.qry_moeda_broker_CD_MOEDA.AsString, FormatDateTime('dd/mm/yyyy', now)]), [loCaseInsensitive]);
end;

procedure Tfrm_moeda.btn_incluirClick(Sender: TObject);
begin
  if ( pgctrl_moeda.ActivePage = ts_dados_basicos ) or
     ( pgctrl_moeda.ActivePage = ts_lista ) then
  begin
    btn_incluir.Enabled := False;
    mi_incluir.Enabled  := False;
    btn_excluir.Enabled := False;
    mi_excluir.Enabled  := False;

    with datm_moeda do
    begin
      qry_moeda_broker_.DisableControls;
      qry_moeda_broker_.Cancel;
      qry_moeda_broker_.Append;
      qry_moeda_broker_.EnableControls;
      qry_moeda_broker_IN_ATIVO.AsString := '1';
    end;
    pgctrl_moeda.ActivePage := ts_dados_basicos;
    dbedt_cd_moeda.ReadOnly := False;
    dbedt_cd_moeda.SetFocus;
  end
  else if ( pgctrl_moeda.ActivePage = ts_taxa_cambio ) then//Taxa de Câmbio
  begin
    btn_incluir.Enabled := False;
    mi_incluir.Enabled  := False;
    btn_excluir.Enabled := False;
    mi_excluir.Enabled  := False;

    with datm_moeda do
    begin
      if qry_moeda_broker_.RecordCount = 0  then
      begin
         BoxMensagem('Selecione uma Moeda!', 2);
         pgctrl_moeda.ActivePage := ts_lista;
         Cancelar;
         Exit
      end;
      qry_taxa_cambio_.DisableControls;
      qry_taxa_cambio_.Cancel;
      qry_taxa_cambio_.Append;
      qry_taxa_cambio_.EnableControls;
      qry_taxa_cambio_CD_MOEDA.AsString := qry_moeda_broker_CD_MOEDA.AsString;
      qry_taxa_cambio_TX_CAMBIO.AsFloat := 0;
    end;
    pgctrl_taxa_cambio.ActivePage := ts_dados_basicos2;
    dbedt_dt_inicio_vig.SetFocus;
  end
  else if ( pgctrl_moeda.ActivePage = ts_taxa_frete ) then//Taxa de Frete
  begin
    btn_incluir.Enabled := False;
    mi_incluir.Enabled  := False;
    btn_excluir.Enabled := False;
    mi_excluir.Enabled  := False;

    with datm_moeda do
    begin
      if qry_moeda_broker_.RecordCount = 0  then
      begin
         BoxMensagem('Selecione uma Moeda!', 2);
         pgctrl_moeda.ActivePage := ts_lista;
         Cancelar;
         Exit
      end;
      qryTaxaFrete.DisableControls;
      qryTaxaFrete.Cancel;
      qryTaxaFrete.Append;
      qryTaxaFrete.EnableControls;
      qryTaxaFreteCD_MOEDA.AsString := qry_moeda_broker_CD_MOEDA.AsString;
      qryTaxaFreteVL_TAXA.AsFloat := 0;
      qryTaxaFreteVL_COMPRA.AsFloat := 0;
      qryTaxaFreteVL_TAXA_UTIL.AsFloat := StrToFloat(ConsultaLookupSQL('SELECT VL_PC_PROTEC_CAMBIAL FROM TPARAMETROS','VL_PC_PROTEC_CAMBIAL'));
      vDtIni := now;
    end;
    pgctrlTaxaFrete.ActivePage := tsDadosBasicosFrete;
    dbedt3.SetFocus;
  end
end;

procedure Tfrm_moeda.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_moeda.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_moeda.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_moeda.Cancelar;
begin
  try
    if ( pgctrl_moeda.ActivePage = ts_dados_basicos ) or
       ( pgctrl_moeda.ActivePage = ts_lista ) then
    begin
      //Moeda
      if datm_moeda.qry_moeda_broker_.State in [dsInsert, dsEdit] then
         datm_moeda.qry_moeda_broker_.Cancel;
      pgctrl_moeda.ActivePage := ts_dados_basicos;
      dbedt_cd_moeda.SetFocus
    end else if ( pgctrl_moeda.ActivePage = ts_taxa_cambio ) then
    begin
      //Taxa de Câmbio
      if datm_moeda.qry_taxa_cambio_.State in [dsInsert, dsEdit] then
         datm_moeda.qry_taxa_cambio_.Cancel;
      pgctrl_taxa_cambio.ActivePage := ts_dados_basicos2;
      dbedt_dt_inicio_vig.SetFocus;
    end else if ( pgctrl_moeda.ActivePage = ts_taxa_frete ) then
    begin
      //Taxa de Frete
      if datm_moeda.qryTaxaFrete.State in [dsInsert, dsEdit] then
         datm_moeda.qryTaxaFrete.Cancel;
      pgctrlTaxaFrete.ActivePage := tsDadosBasicosFrete;
      dbedt3.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_moeda.btn_excluirClick(Sender: TObject);
begin
  if ( pgctrl_moeda.ActivePage = ts_dados_basicos ) or
     ( pgctrl_moeda.ActivePage = ts_lista ) then
  begin
    if BoxMensagem( 'Esta Moeda será excluída! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_moeda.qry_moeda_broker_.Delete;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_moeda.qry_moeda_broker_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_moeda.ActivePage := ts_lista;
  end
  else if ( pgctrl_moeda.ActivePage = ts_taxa_cambio ) then
  begin
    if datm_moeda.qry_taxa_cambio_.RecordCount = 0 then Exit;
    if BoxMensagem( 'Esta Taxa de Câmbio será excluída! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_moeda.qry_taxa_cambio_.Delete;
      datm_main.db_broker.Commit;
      AjustaCambio;
    except
      on E: Exception do
      begin
        datm_moeda.qry_taxa_cambio_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_taxa_cambio.ActivePage := ts_lista2;
  end
  else if ( pgctrl_moeda.ActivePage = ts_taxa_frete ) then
  begin
    if datm_moeda.qryTaxaFrete.RecordCount = 0 then Exit;
    if BoxMensagem( 'Esta Taxa de Câmbio será excluída! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_moeda.qryTaxaFrete.Delete;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_moeda.qryTaxaFrete.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_taxa_cambio.ActivePage := tsListaFrete;
  end;
end;

procedure Tfrm_moeda.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_moeda.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_moeda.qry_moeda_broker_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_moeda.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_moeda.qry_moeda_broker_CD_MOEDA.AsString;
  // Apaga o campo de pesquisa 
  edt_chave.Text := '';
  datm_moeda.qry_moeda_broker_.Close;
  datm_moeda.qry_moeda_broker_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_moeda.qry_moeda_broker_.Open;
  Localiza(datm_moeda.qry_moeda_broker_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_moeda.dbedt_cd_moedaExit(Sender: TObject);
begin
  If datm_moeda.qry_moeda_broker_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_moeda );
end;

procedure Tfrm_moeda.dbedt_nm_moedaChange(Sender: TObject);
begin
 If ( datm_moeda.qry_moeda_broker_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_moeda.dbedt_cd_moeda_scxExit(Sender: TObject);
begin
  if Not OnChanging then
  begin
    Consiste;
    lcd_moeda_scx := False;
  end;
end;

procedure Tfrm_moeda.btn_co_moeda_scxClick(Sender: TObject);
begin
  Consulta_On_line( 'TMOEDA', datm_moeda.qry_moeda_broker_CD_MOEDA_SCX, 'Moedas' );
end;

procedure Tfrm_moeda.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String );
begin

  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo           := 1;
  datm_consulta_padrao.Tabela.TableName := cNomeTabela;
  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine       := fCampo;
  frm_consulta_padrao.st_modificar      := st_modificar;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_moeda.dbedt_dt_inicio_vigChange(Sender: TObject);
begin
 If ( datm_moeda.qry_taxa_cambio_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_moeda.dbedt_tx_cambioExit(Sender: TObject);
begin
  if dbedt_tx_cambio.Text = '' then dbedt_tx_cambio.Text := '0';
end;

procedure Tfrm_moeda.dbedt_dt_termino_vigExit(Sender: TObject);
begin
  if datm_moeda.qry_taxa_cambio_.State in [dsBrowse, dsInactive] then Exit;
  if dbedt_dt_termino_vig.Text = '  /  /    ' then datm_moeda.qry_taxa_cambio_DT_TERMINO_VIGENCIA.ASVariant := null;
  if (datm_moeda.qry_taxa_cambio_DT_INICIO_VIGENCIA.IsNull) or (datm_moeda.qry_taxa_cambio_DT_TERMINO_VIGENCIA.IsNull) then Exit;
  if datm_moeda.qry_taxa_cambio_DT_INICIO_VIGENCIA.AsDateTime >
     datm_moeda.qry_taxa_cambio_DT_TERMINO_VIGENCIA.AsDateTime then
  begin
    MessageDlg('Data de Término da Vigência deve ser igual ou superior a Data de Início da Vigência!',
       mtError, [mbOk], 0);
    dbedt_dt_termino_vig.SetFocus;
  end;
end;

procedure Tfrm_moeda.dbedt_dt_inicio_vigExit(Sender: TObject);
begin
  if datm_moeda.qry_taxa_cambio_.State in [dsBrowse, dsInactive] then Exit;
  if dbedt_dt_inicio_vig.Text = '  /  /    ' then datm_moeda.qry_taxa_cambio_DT_INICIO_VIGENCIA.AsVariant := null;
  if (datm_moeda.qry_taxa_cambio_DT_INICIO_VIGENCIA.IsNull) or (datm_moeda.qry_taxa_cambio_DT_TERMINO_VIGENCIA.IsNull) then Exit;
  if datm_moeda.qry_taxa_cambio_DT_INICIO_VIGENCIA.AsDateTime >
     datm_moeda.qry_taxa_cambio_DT_TERMINO_VIGENCIA.AsDateTime then
  begin
    MessageDlg('Data de Início da Vigência deve ser igual ou inferior a Data de Término da Vigência!',
       mtError, [mbOk], 0);
    dbedt_dt_inicio_vig.SetFocus;
  end;
end;

function Tfrm_moeda.Consiste : Boolean;
begin
  Consiste := True;
  if ( pgctrl_moeda.ActivePage = ts_dados_basicos ) or
     ( pgctrl_moeda.ActivePage = ts_lista ) then
  begin
    //Descrição da moeda
    if dbedt_nm_moeda.Text = '' then
    begin
      BoxMensagem('Campo Descrição deve ser preenchido!', 2);
      pgctrl_moeda.ActivePage := ts_dados_basicos;
      dbedt_nm_moeda.SetFocus;
      lnm_moeda := True;
      Consiste := False;
      Exit;
    end;

    //Sigla da moeda
    if dbedt_ap_moeda.Text = '' then
    begin
      BoxMensagem('Campo Sigla deve ser preenchido!', 2);
      pgctrl_moeda.ActivePage := ts_dados_basicos;
      dbedt_ap_moeda.SetFocus;
      lap_moeda := True;
      Consiste := False;
      Exit;
    end;

    //Código da Moeda no Siscomex
    If Not ( datm_moeda.qry_moeda_broker_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_moeda_scx );
    if dbedt_cd_moeda_scx.Text <> '' Then
    begin
      if dbedt_nm_moeda_scx.Text = '' Then
      begin
        BoxMensagem('Código da Moeda do SISCOMEX inválido!',2);
        pgctrl_moeda.ActivePage := ts_dados_basicos;
        dbedt_cd_moeda_scx.SetFocus;
        lcd_moeda_scx := True;
        Consiste := False;
        Exit;
      end;
    end;
  end
  else //Taxa Câmbio
  begin
    //Data Início da Vigência Nulo
    if datm_moeda.qry_taxa_cambio_DT_INICIO_VIGENCIA.IsNull then
    begin
      BoxMensagem('Campo Data Início da Vigência deve ser preenchido!', 2);
      pgctrl_taxa_cambio.ActivePage := ts_dados_basicos2;
      dbedt_dt_inicio_vig.SetFocus;
      ldt_inicio := True;
      Consiste := False;
      Exit;
    end;
    //Data Término da Vigência Nulo
    if datm_moeda.qry_taxa_cambio_DT_TERMINO_VIGENCIA.IsNull then
    begin
      BoxMensagem('Campo Data Término da Vigência deve ser preenchido!', 2);
      pgctrl_taxa_cambio.ActivePage := ts_dados_basicos2;
      dbedt_dt_termino_vig.SetFocus;
      ldt_termino := True;
      Consiste := False;
      Exit;
    end;

    //Data Início da Vigência ou Data Término da Vigência
    //pertencente a um período já existente para esta moeda (cambio e frete)
    with datm_moeda do begin
      if pgctrl_moeda.ActivePage = ts_taxa_cambio then begin
        if qry_taxa_cambio_.State in [dsEdit] then begin {alteração - utiliza qry_consiste_alt_ com TTAXA_CAMBIO}
          qry_consist_alt_.Close;
          qry_consist_alt_.SQL.Clear;
          qry_consist_alt_.SQL.Add('SELECT CD_MOEDA FROM TTAXA_CAMBIO ');
          qry_consist_alt_.SQL.Add(' WHERE ( ( :DT_INICIO_VIG  BETWEEN DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA ) ');
          qry_consist_alt_.SQL.Add('    OR (   :DT_TERMINO_VIG BETWEEN DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA ) ) ');
          qry_consist_alt_.SQL.Add('   AND CD_MOEDA = :CD_MOEDA ');
          qry_consist_alt_.SQL.Add('   AND DT_INICIO_VIGENCIA <> :INICIO ');
          qry_consist_alt_.SQL.Add('   AND DT_TERMINO_VIGENCIA <> :TERMINO ');
          qry_consist_alt_.ParamByName('CD_MOEDA').AsString := qry_moeda_broker_CD_MOEDA.AsString;
          qry_consist_alt_.ParamByName('INICIO').AsDate := dt_inicio;
          qry_consist_alt_.ParamByName('TERMINO').AsDate := dt_termino;
          qry_consist_alt_.ParamByName('DT_INICIO_VIG').AsString := dbedt_dt_inicio_vig.text;
          qry_consist_alt_.ParamByName('DT_TERMINO_VIG').AsString := dbedt_dt_termino_vig.text;
          qry_consist_alt_.Prepare;
          qry_consist_alt_.Open;
          if qry_consist_alt_.RecordCount > 0 then
          begin
            BoxMensagem( 'Datas compreendem um período já existente!', 2);
            dbedt_dt_inicio_vig.SetFocus;
            ldt_inicio := True;
            Consiste := False;
            Exit;
          end;
        end else begin {inclusão - utiliza qry_consiste_inc_ com TTAXA_CAMBIO}
          qry_consist_inc_.Close;
          qry_consist_inc_.SQL.Clear;
          qry_consist_inc_.SQL.Add('SELECT CD_MOEDA FROM TTAXA_CAMBIO ');
          qry_consist_inc_.SQL.Add(' WHERE (( :DT_INICIO_VIG  BETWEEN DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA ) ');
          qry_consist_inc_.SQL.Add('    OR (  :DT_TERMINO_VIG BETWEEN DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA ) ) ');
          qry_consist_inc_.SQL.Add('   AND CD_MOEDA = :CD_MOEDA ');
          qry_consist_inc_.ParamByName('CD_MOEDA').AsString := qry_moeda_broker_CD_MOEDA.AsString;
          qry_consist_inc_.ParamByName('DT_INICIO_VIG').AsString  := dbedt_dt_inicio_vig.text;
          qry_consist_inc_.ParamByName('DT_TERMINO_VIG').AsString := dbedt_dt_termino_vig.text;
          qry_consist_inc_.Prepare;
          qry_consist_inc_.Open;
          if qry_consist_inc_.RecordCount > 0 then
          begin
            BoxMensagem( 'Datas compreendem um período já existente!', 2);
            dbedt_dt_inicio_vig.SetFocus;
            ldt_inicio := True;
            Consiste := False;
            Exit;
          end;
        end;
        pgctrl_taxa_cambio.ActivePage := ts_dados_basicos2;
        dbedt_dt_inicio_vig.SetFocus;
      end else if (pgctrl_moeda.ActivePage = ts_taxa_frete) then begin
        dbedt3Exit(dbedt3);
        if vMudouData then begin
          qry_consist_inc_.Close;
          qry_consist_inc_.SQL.Clear;
          qry_consist_inc_.SQL.Add('SELECT CD_MOEDA FROM TTAXA_FRETE ');
          qry_consist_inc_.SQL.Add(' WHERE ( :DT_INICIO_VIG  = DT_INICIO ) ');
          qry_consist_inc_.SQL.Add('   AND CD_MOEDA = :CD_MOEDA ');
          qry_consist_inc_.ParamByName('CD_MOEDA').AsString := qry_moeda_broker_CD_MOEDA.AsString;
          qry_consist_inc_.ParamByName('DT_INICIO_VIG').AsString  := dbedt3.text;
          qry_consist_inc_.Prepare;
          qry_consist_inc_.Open;
          if qry_consist_inc_.RecordCount > 0 then begin
            BoxMensagem( 'Datas compreendem um período já existente!', 2);
            dbedt3.SetFocus;
            dbedt3.Text := DateToStr(vDtIni);
            ldt_inicio := True;
            Consiste := False;
            Exit;
          end;
          pgctrltaxaFrete.ActivePage := tsdadosbasicosFrete;
        end else
          Consiste := True;
      end;
    end;
  end;
end;

function Tfrm_moeda.Grava : Boolean;
var cd_moeda : String[3];
dt_inicio_vig, dt_termino_vig : TDateTime;
begin
  cd_moeda := '';
  if ( pgctrl_moeda.ActivePage = ts_dados_basicos ) or
     ( pgctrl_moeda.ActivePage = ts_lista ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      If ( datm_moeda.qry_moeda_broker_.State in [dsInsert, dsEdit] ) then
      begin
        datm_moeda.qry_moeda_broker_.Post;
        Pesquisa := datm_moeda.qry_moeda_broker_CD_MOEDA.AsString;
        datm_moeda.qry_moeda_broker_.Close;
        datm_moeda.qry_moeda_broker_.Prepare;
        datm_moeda.qry_moeda_broker_.Open;
        Localiza(datm_moeda.qry_moeda_broker_, Pesquisa, a_str_indices[0] );
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_moeda.qry_moeda_broker_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end
  else if ( pgctrl_moeda.ActivePage = ts_taxa_cambio ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      If ( datm_moeda.qry_taxa_cambio_.State in [dsInsert, dsEdit] ) then
      begin
        with datm_moeda do
        begin
          qry_taxa_cambio_.Post;
          cd_moeda       := qry_taxa_cambio_CD_MOEDA.AsString;
          dt_inicio_vig  := qry_taxa_cambio_DT_INICIO_VIGENCIA.AsDateTime;
          dt_termino_vig := qry_taxa_cambio_DT_TERMINO_VIGENCIA.AsDateTime;
          qry_taxa_cambio_.Close;
          qry_taxa_cambio_.Prepare;
          qry_taxa_cambio_.Open;
          qry_taxa_cambio_.Locate('CD_MOEDA;DT_INICIO_VIGENCIA;DT_TERMINO_VIGENCIA',VarArrayOf ([cd_moeda, dt_inicio_vig, dt_termino_vig]), [loCaseInsensitive]);
        end;
      end;
      datm_main.db_broker.Commit;
      if BoxMensagem( 'Deseja utilizar esta taxa para cálculos oficiais da DI?',1 ) then AjustaCambio;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_moeda.qry_taxa_cambio_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end
  else if ( pgctrl_moeda.ActivePage = ts_taxa_frete ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      If ( datm_moeda.qryTaxaFrete.State in [dsInsert, dsEdit] ) then
      begin
        with datm_moeda do
        begin
          qryTaxaFrete.Post;
          cd_moeda       := qryTaxaFreteCD_MOEDA.AsString;
          dt_inicio_vig  := qryTaxaFreteDT_INICIO.AsDateTime;
          dt_inicio      := qryTaxaFreteDT_INICIO.AsDateTime;
          dt_termino_vig := qryTaxaFreteDT_FIM.AsDateTime;
          qryTaxaFrete.Close;
          qryTaxaFrete.ParamByName('CD_MOEDA').AsString := cd_moeda;
          qryTaxaFrete.Prepare;
          qryTaxaFrete.Open;
          qryTaxaFrete.Locate('CD_MOEDA;DT_INICIO', VarArrayOf([cd_moeda, dt_inicio_vig]), [loCaseInsensitive]);
        end;
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_moeda.qryTaxaFrete.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_moeda.pgctrl_moedaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

procedure Tfrm_moeda.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      if Not (TTable(Cons_OnLine.DataSet).State in [dsEdit, dsInsert]) then
         TTable(Cons_OnLine.DataSet).Edit;
      Cons_OnLine.AsString := datm_moeda.qry_moeda_broker_CD_MOEDA.AsString;
    except
       try
         Cons_Online_Texto := datm_moeda.qry_moeda_broker_CD_MOEDA.AsString;
       except
         BoxMensagem('Não consegui retornar Código da Moeda!', 2);
       end;
    end;
    Close;
  end;
end;

procedure Tfrm_moeda.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

function Tfrm_moeda.Veralt;
begin
  Veralt := True;
  if ( pgctrl_moeda.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( datm_moeda.qry_moeda_broker_.State in [dsEdit] ) and st_modificar ) or
       ( datm_moeda.qry_moeda_broker_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Moedas foi alterada.' + #13#10 +
         'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          Veralt := False;
          Exit;
        end;
        if Not Grava then
        begin
          Veralt := False;
          Exit;
        end;
      end
      else
        Cancelar;
    end;
  end
  else if ( pgctrl_moeda.ActivePage = ts_taxa_cambio ) then
  begin
    if ( ( datm_moeda.qry_taxa_cambio_.State in [dsEdit] ) and st_modificar ) or
       ( datm_moeda.qry_taxa_cambio_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Taxas de Câmbio foi alterado.' + #13#10 +
         'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          Veralt := False;
          Exit;
        end;
        if Not Grava then
        begin
          Veralt := False;
          Exit;
        end;
      end
      else
        Cancelar;
    end;
  end
  else if ( pgctrl_moeda.ActivePage = ts_taxa_frete ) then
  begin
    if ( ( datm_moeda.qryTaxaFrete.State in [dsEdit] ) and st_modificar ) or
       ( datm_moeda.qryTaxaFrete.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Taxas de Frete foi alterado.' + #13#10 +
         'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          Veralt := False;
          Exit;
        end;
        if Not Grava then
        begin
          Veralt := False;
          Exit;
        end;
      end
      else
        Cancelar;
    end;
  end;
end;

procedure Tfrm_moeda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_moeda.dbedt_cd_moeda_scxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_moeda_scx then btn_co_moeda_scxClick(nil);
  end;
end;

procedure Tfrm_moeda.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_moeda.dbedt3Exit(Sender: TObject);
begin
  if datm_moeda.qryTaxaFrete.State  in [dsBrowse, dsInactive] then Exit;
  if dbedt3.Text = '  /  /    ' then datm_moeda.qryTaxaFreteDT_INICIO.AsVariant := null;
  vMudouData := (StrToDate(dbedt3.Text) <> vDtIni) or (datm_moeda.qryTaxaFrete.State  = dsInsert);

  {  if (datm_moeda.qryTaxaFreteDT_INICIO.IsNull) or (datm_moeda.qryTaxaFreteDT_FIM.IsNull) then Exit;
  if datm_moeda.qryTaxaFreteDT_INICIO.AsDateTime > datm_moeda.qryTaxaFreteDT_FIM.AsDateTime then
  begin
    MessageDlg('Data de Início da Vigência deve ser igual ou inferior a Data de Término da Vigência!',
       mtError, [mbOk], 0);
    dbedt3.SetFocus;
  end; }
end;

procedure Tfrm_moeda.dbedt4Exit(Sender: TObject);
begin
  if datm_moeda.qryTaxaFrete.State in [dsBrowse, dsInactive] then Exit;
  if dbedt4.Text = '  /  /    ' then datm_moeda.qryTaxaFreteDT_FIM.ASVariant := null;
  if (datm_moeda.qryTaxaFreteDT_INICIO.IsNull) or (datm_moeda.qryTaxaFreteDT_FIM.IsNull) then Exit;
  if datm_moeda.qryTaxaFreteDT_INICIO.AsDateTime > datm_moeda.qryTaxaFreteDT_FIM.AsDateTime then
  begin
    MessageDlg('Data de Término da Vigência deve ser igual ou superior a Data de Início da Vigência!',
       mtError, [mbOk], 0);
    dbedt4.SetFocus;
  end;
end;

procedure Tfrm_moeda.dbedt3Change(Sender: TObject);
begin
  If ( datm_moeda.qryTaxaFrete.State in [ dsInsert, dsEdit ] ) then
    Btn_Mi( False, True, True, False );
end;

procedure Tfrm_moeda.DBEdit2Exit(Sender: TObject);
begin
  // se a taxa oficial e a proteção cambial forem preenchidos, calcula a taxa indaiá
  if ( DBEdit2.Text <> '' ) and ( DBEdit1.Text <> '' ) and ( datm_moeda.qryTaxaFrete.State in [dsInsert, dsEdit] ) then
    datm_moeda.qryTaxaFreteVL_TAXA.AsFloat := datm_moeda.qryTaxaFreteVL_COMPRA.AsFloat +
                                              ( datm_moeda.qryTaxaFreteVL_COMPRA.AsFloat *
                                                ( datm_moeda.qryTaxaFreteVL_TAXA_UTIL.AsFloat / 100 ) );
end;

procedure Tfrm_moeda.dbedt3Enter(Sender: TObject);
begin
  vDtIni := datm_moeda.qryTaxaFreteDT_INICIO.ASDateTime;
end;

end.

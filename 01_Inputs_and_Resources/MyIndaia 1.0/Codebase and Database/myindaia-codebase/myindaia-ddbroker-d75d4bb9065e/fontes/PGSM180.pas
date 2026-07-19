unit PGSM180;

interface

uses
  Windows, SysUtils, Classes, Variants, Graphics, Controls, Dialogs,
  Menus, StdCtrls, Grids,  Buttons, Mask, ExtCtrls, ComCtrls, Forms,
  DB, DBTables, DBCtrls, DBGrids, ConsOnLineEx;

type
  Tfrm_familia_prod = class(TForm)
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvgr_familia_prod: TDBNavigator;
    qry_familia_prod_: TQuery;
    ds_familia_prod: TDataSource;
    pnl_pesquisa: TPanel;
    lbl_chave: TLabel;
    lbl_ordem: TLabel;
    edt_chave: TEdit;
    cbb_ordem: TComboBox;
    ds_familia_pais: TDataSource;
    ds_familia_docs: TDataSource;
    qry_familia_pais_: TQuery;
    qry_familia_docs_: TQuery;
    qry_familia_prod_CD_FAMILIA_PROD: TStringField;
    qry_familia_prod_NM_FAMILIA_PROD: TStringField;
    qry_familia_prod_CD_PRODUTO: TStringField;
    qry_familia_prod_CD_EXPORTADOR: TStringField;
    qry_familia_prod_IN_ATIVO: TStringField;
    qry_familia_pais_CD_FAMILIA_PROD: TStringField;
    qry_familia_pais_CD_PAIS: TStringField;
    qry_familia_docs_CD_FAMILIA_PROD: TStringField;
    qry_familia_docs_CD_PAIS: TStringField;
    qry_familia_docs_CD_DOCUMENTO: TStringField;
    qry_familia_docs_TP_LOCAL: TStringField;
    qry_familia_docs_TX_INSTRUCAO: TMemoField;
    qry_familia_prod_calc_in_ativo: TStringField;
    qry_familia_prod_CD_UNID_NEG: TStringField;
    qry_familia_prod_calc_nm_exportador: TStringField;
    qry_familia_prod_calc_nm_unid_neg: TStringField;
    qry_familia_prod_calc_nm_produto: TStringField;
    qry_familia_docs_calc_nm_documento: TStringField;
    qry_familia_prod_CD_USUARIO: TStringField;
    qry_familia_prod_DT_ALTERACAO: TDateTimeField;
    qry_familia_prod_calc_nm_usuario: TStringField;
    qry_familia_pais_NR_DIA_PERFORMACE: TIntegerField;
    qry_familia_docs_CD_USUARIO: TStringField;
    qry_familia_docs_DT_ALTERACAO: TDateTimeField;
    qry_familia_docs_calc_nm_usuario: TStringField;
    qry_familia_pais_CD_USUARIO: TStringField;
    qry_familia_pais_DT_ALTERACAO: TDateTimeField;
    pgctrl_familia_prod: TPageControl;
    ts_lista: TTabSheet;
    dbgrd_familia_prod: TDBGrid;
    ts_dados_basicos: TTabSheet;
    lbl_codigo: TLabel;
    lbl_descricao: TLabel;
    lbl_exportador: TLabel;
    btn_co_exportador: TSpeedButton;
    lbl_cd_produto: TLabel;
    btn_co_produto: TSpeedButton;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    bvl_alteracao: TBevel;
    lbl_alt_back: TLabel;
    lbl_alt_up: TLabel;
    lbl_usuario_back: TLabel;
    lbl_data_back: TLabel;
    dbedt_cd_familia_prod: TDBEdit;
    dbedt_nm_familia_prod: TDBEdit;
    edt_nm_produto: TEdit;
    edt_nm_exportador: TEdit;
    dbedt_cd_produto: TDBEdit;
    dbedt_cd_exportador: TDBEdit;
    dbchk_in_ativo: TDBCheckBox;
    dbedt_cd_unid_neg: TDBEdit;
    edt_nm_unid_neg: TEdit;
    dbedt_nm_usuario: TDBEdit;
    dbedt_dt_alteracao: TDBEdit;
    ts_paisdoc: TTabSheet;
    pgctrl_paisdoc: TPageControl;
    ts_lista_docs: TTabSheet;
    bvl_lista_docspais: TBevel;
    lbl_pais_1: TLabel;
    btn_co_pais_lista: TSpeedButton;
    dbgrd_docs: TDBGrid;
    edt_nm_pais_lista: TEdit;
    medt_cd_pais_lista: TMaskEdit;
    ts_dados_basico_docs: TTabSheet;
    bvl_basico_docspais: TBevel;
    lbl_instrucao: TLabel;
    lbl_doc: TLabel;
    btn_co_doc: TSpeedButton;
    lbl_local: TLabel;
    bvl_alt_doc: TBevel;
    lbl_alt_doc_down: TLabel;
    lbl_alt_doc_up: TLabel;
    lbl_user_doc_down: TLabel;
    lbl_user_doc_up: TLabel;
    lbl_data_doc_down: TLabel;
    lbl_data_doc_up: TLabel;
    dbmmo_doc: TDBMemo;
    edt_nm_doc: TEdit;
    dbedt_cd_doc: TDBEdit;
    dbrgrp_tp_local: TDBRadioGroup;
    dbedt_user_doc: TDBEdit;
    dbedt_data_doc: TDBEdit;
    qry_familia_pais_CD_IMPORTADOR: TStringField;
    qry_familia_docs_CD_IMPORTADOR: TStringField;
    qry_familia_docs_NR_SEQUENCIAL: TIntegerField;
    qry_familia_pais_NR_SEQUENCIAL: TIntegerField;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    edt_nm_importador_lista: TEdit;
    medt_cd_importador_lista: TMaskEdit;
    qry_familia_pais_calc_nm_importador: TStringField;
    btn_importar: TBitBtn;
    pnl_import: TPanel;
    Shape1: TShape;
    Panel1: TPanel;
    medt_importador_origem: TMaskEdit;
    edt_importador_origem: TEdit;
    btn_importador_origem: TSpeedButton;
    btn_pais_origem: TSpeedButton;
    edt_pais_origem: TEdit;
    medt_pais_origem: TMaskEdit;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    SpeedButton4: TSpeedButton;
    btn_ok_origem: TBitBtn;
    btn_familia_origem: TSpeedButton;
    Label7: TLabel;
    edt_familia_origem: TEdit;
    medt_familia_origem: TMaskEdit;
    qry_familia_pais_calc_nm_pais: TStringField;
    upd_familia_pais_: TUpdateSQL;
    tbsPais: TTabSheet;
    bvl_basico: TBevel;
    lbl_pais: TLabel;
    btn_co_pais: TSpeedButton;
    lbl_nr_dia_performace: TLabel;
    lbl_dias: TLabel;
    spd_importador: TSpeedButton;
    Label1: TLabel;
    dbgrd_pais: TDBGrid;
    edt_nm_pais: TEdit;
    dbedt_cd_pais: TDBEdit;
    dbedt_nr_dia_performace: TDBEdit;
    dbedt_cd_importador: TDBEdit;
    edt_nm_importador: TEdit;
    bvl_paises: TBevel;
    mmo_infos: TMemo;
    lblArea: TLabel;
    btnArea: TSpeedButton;
    edtArea: TEdit;
    dbedtArea: TDBEdit;
    qry_familia_prod_CD_AREA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cbb_ordemClick(Sender: TObject);
    procedure pgctrl_familia_prodChange(Sender: TObject);
    procedure pgctrl_familia_prodChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_paisdocChange(Sender: TObject);
    procedure pgctrl_paisdocChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbgrd_familia_prodDblClick(Sender: TObject);
    procedure dbgrd_familia_prodKeyPress(Sender: TObject; var Key: Char);
    procedure qry_familia_prod_CalcFields(DataSet: TDataSet);
    procedure dbedt_cd_familia_prodExit(Sender: TObject);
    procedure dbedt_cd_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure dbgrd_paisDblClick(Sender: TObject);
    procedure dbedt_cd_paisExit(Sender: TObject);
    procedure btn_co_paisClick(Sender: TObject);
    procedure dbedt_cd_docExit(Sender: TObject);
    procedure btn_co_docClick(Sender: TObject);
    procedure btn_co_pais_listaClick(Sender: TObject);
    procedure medt_cd_pais_listaEnter(Sender: TObject);
    procedure medt_cd_pais_listaExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure qry_familia_pais_CalcFields(DataSet: TDataSet);
    procedure qry_familia_docs_CalcFields(DataSet: TDataSet);
    procedure qry_familia_prod_AfterScroll(DataSet: TDataSet);
    procedure qry_familia_prod_BeforeEdit(DataSet: TDataSet);
    procedure qry_familia_pais_BeforeEdit(DataSet: TDataSet);
    procedure qry_familia_docs_BeforeEdit(DataSet: TDataSet);
    procedure qry_familia_prod_AfterPost(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure qry_familia_prod_BeforeInsert(DataSet: TDataSet);
    procedure qry_familia_pais_AfterPost(DataSet: TDataSet);
    procedure qry_familia_docs_AfterPost(DataSet: TDataSet);
    procedure spd_importadorClick(Sender: TObject);
    procedure dbedt_cd_importadorExit(Sender: TObject);
    procedure dbedt_cd_importadorChange(Sender: TObject);
    procedure medt_cd_importador_listaChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_importarClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btn_pais_origemClick(Sender: TObject);
    procedure btn_importador_origemClick(Sender: TObject);
    procedure medt_importador_origemChange(Sender: TObject);
    procedure btn_ok_origemClick(Sender: TObject);
    procedure btn_familia_origemClick(Sender: TObject);
    procedure btnAreaClick(Sender: TObject);
  private
    a_str_indices : Array[0..1] of String[60];
    cd_familia_prod, cd_pais_prod, cd_doc_prod, cd_importador_prod : String;
    st_modificar, st_incluir, st_excluir : boolean;
    procedure btn_mi( i, s, c, e : Boolean );
    procedure btn_mi_pais( i, s, c, e : Boolean );
    procedure Cancelar;
    procedure CancelarPais;
    procedure CancelarDocs;
    function Grava       : Boolean;
    function Consiste    : Boolean;
    function VerAlt      : Boolean;
    function GravaPais   : Boolean;
    function ConsistePais: Boolean;
    function VerAltPais  : Boolean;
    function GravaDocs   : Boolean;
    function ConsisteDocs: Boolean;
    function VerAltDocs  : Boolean;
  public
    lNaoConsiste : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_familia_prod: Tfrm_familia_prod;

implementation

uses GSMLIB, PGGP001, PGGP017;

{$R *.DFM}

procedure Tfrm_familia_prod.btn_mi( i, s, c, e : Boolean );
begin
  btn_incluir.Enabled  := i;  mi_incluir.Enabled  := i;
  btn_salvar.Enabled   := s;  mi_salvar.Enabled   := s;
  btn_cancelar.Enabled := c;  mi_cancelar.Enabled := c;
  btn_excluir.Enabled  := e;  mi_excluir.Enabled  := e;
end;

procedure Tfrm_familia_prod.btn_mi_pais( i, s, c, e : Boolean );
begin
  {btn_incluir_pais.Enabled  := i;
  btn_salvar_pais.Enabled   := s;
  btn_cancelar_pais.Enabled := c;
  btn_excluir_pais.Enabled  := e;}
  btn_mi(i, s, c, e);
end;

procedure Tfrm_familia_prod.Cancelar;
begin
  try
    if qry_familia_prod_.State in [dsInsert, dsEdit] then
    begin
      qry_familia_prod_.Cancel;
      pgctrl_familia_prod.ActivePage := ts_dados_basicos;
      dbedt_nm_familia_prod.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  
  btn_mi( st_incluir, False, False, st_excluir );
  btn_mi_pais(st_incluir, False, False, st_excluir);
end;

function Tfrm_familia_prod.Grava;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( qry_familia_prod_.State in [dsInsert, dsEdit] ) then
    begin
      cd_familia_prod := qry_familia_prod_CD_FAMILIA_PROD.AsString;
      qry_familia_prod_CD_USUARIO.AsString     := str_cd_usuario;
      qry_familia_prod_DT_ALTERACAO.AsDateTime := Now();
      qry_familia_prod_.Post;

      qry_familia_prod_.Close;
      qry_familia_prod_.Prepare;
      qry_familia_prod_.Open;

      qry_familia_prod_.Locate( 'CD_FAMILIA_PROD', cd_familia_prod, [loCaseInsensitive] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      qry_familia_prod_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;

  btn_mi( st_incluir, False, False, st_excluir );
  btn_mi_pais(st_incluir, False, False, False);
end;

function Tfrm_familia_prod.Consiste : Boolean;
begin
  Consiste := True;

  {Código}
  if Not lNaoConsiste then
  begin
    if dbedt_cd_familia_prod.Text = '' then
    begin
      BoxMensagem('Campo Código da Família de Produtos deve ser preenchido!', 2);
      dbedt_cd_familia_prod.SetFocus;
      Consiste := False;
      Exit;
    end;

    {Descrição}
    if dbedt_nm_familia_prod.Text = '' then
    begin
      BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
      dbedt_nm_familia_prod.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  {Unidade Neg.}
  if qry_familia_prod_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_unid_neg );

  if dbedt_cd_unid_neg.Text <> '' then
  begin
    if edt_nm_unid_neg.Text = '' then
    begin
      BoxMensagem('Código da Unidade de Negociação inválido!', 2);
      pgctrl_familia_prod.ActivePage := ts_dados_basicos;
      dbedt_cd_unid_neg.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  {Produto}
  if qry_familia_prod_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_produto );

  if dbedt_cd_produto.Text <> '' then
  begin
    if edt_nm_produto.Text = '' then
    begin
      BoxMensagem('Código do Produto inválido!', 2);
      pgctrl_familia_prod.ActivePage := ts_dados_basicos;
      dbedt_cd_produto.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  {Exportador}
  if qry_familia_prod_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_exportador );

  if dbedt_cd_exportador.Text <> '' then
  begin
    if edt_nm_exportador.Text = '' then
    begin
      BoxMensagem('Código do Exportador inválido!', 2);
      pgctrl_familia_prod.ActivePage := ts_dados_basicos;
      dbedt_cd_exportador.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
end;

function Tfrm_familia_prod.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( qry_familia_prod_.State in [dsEdit] ) and st_modificar ) or
     ( qry_familia_prod_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Família de Produtos foi alterado.' + #13#10 +
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

procedure Tfrm_familia_prod.FormCreate(Sender: TObject);
begin
  a_str_indices[0] := 'CD_FAMILIA_PROD';
  a_str_indices[1] := 'NM_FAMILIA_PROD';

  with cbb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  ds_familia_prod.AutoEdit := st_modificar;
  ds_familia_pais.AutoEdit := st_modificar;
  ds_familia_docs.AutoEdit := st_modificar;

  btn_mi(st_incluir, False, False, st_excluir);
  btn_mi_pais(st_incluir, False, False, st_excluir);

  pnl_cadastro.Color := clMenuBroker;
end;

procedure Tfrm_familia_prod.FormShow(Sender: TObject);
begin
  //posiciona na página correta
  pgctrl_familia_prod.ActivePage := ts_lista;

  //Abre tabelas
  qry_familia_prod_.Close;
  qry_familia_prod_.SQL[7] := 'NM_FAMILIA_PROD';
  qry_familia_prod_.Prepare;
  qry_familia_prod_.Open;

  if qry_familia_prod_.IsEmpty then
  begin
    ts_paisdoc.TabVisible := False;
  end
  else
  begin
    qry_familia_pais_.Close;
    qry_familia_pais_.ParamByName('cd_familia_prod').AsString := qry_familia_prod_CD_FAMILIA_PROD.AsString;
    qry_familia_pais_.Prepare;
    qry_familia_pais_.Open;

    if qry_familia_pais_.IsEmpty then
    begin
      btn_mi_pais(st_incluir, False, False, False);
      ts_paisdoc.TabVisible := False;
      spd_importador.Enabled := False;
    end
    else
    begin
      btn_mi_pais(st_incluir, False, False, st_excluir);
      ts_paisdoc.TabVisible := True;
      spd_importador.Enabled := True;

      qry_familia_docs_.Close;
      qry_familia_docs_.ParamByName('cd_familia_prod').AsString := qry_familia_pais_CD_FAMILIA_PROD.AsString;
      qry_familia_docs_.ParamByName('nr_sequencial').AsInteger := qry_familia_pais_NR_SEQUENCIAL.AsInteger;
      qry_familia_docs_.Prepare;
      qry_familia_docs_.Open;
    end;
  end;

  edt_chave.SetFocus;
end;

procedure Tfrm_familia_prod.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //se o ESC for pressionado, fecha o form
  if Key = #27 then Close;
end;

procedure Tfrm_familia_prod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //fecha tabelas
  if VerAlt and VerAltPais and VerAltDocs then
  begin
    qry_familia_docs_.Close;
    qry_familia_pais_.Close;
    qry_familia_prod_.Close;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_familia_prod.btn_incluirClick(Sender: TObject);
begin
  //Inclui um registro
  if pgctrl_familia_prod.ActivePage = ts_lista then
  begin
    pgctrl_familia_prod.ActivePage := ts_dados_basicos;
    btn_incluirClick(nil);
  end;

  if pgctrl_familia_prod.ActivePage = ts_dados_basicos then
  begin
    qry_familia_prod_.DisableControls;
    qry_familia_prod_.Cancel;
    qry_familia_prod_.Append;
    qry_familia_prod_.EnableControls;
    qry_familia_prod_IN_ATIVO.AsString := '1';
    
    dbedt_cd_familia_prod.ReadOnly := False;
    dbedt_cd_familia_prod.Color    := clWindow;
    dbedt_cd_familia_prod.TabStop  := True;
    dbedt_cd_familia_prod.SetFocus;

    btn_mi(False, True, True, False);
    btn_mi_pais(False, False, False, False);
  end;

  if pgctrl_familia_prod.ActivePage = tbsPais then
  begin
    qry_familia_pais_.DisableControls;
    qry_familia_pais_.Cancel;
    qry_familia_pais_.Append;
    qry_familia_pais_.EnableControls;
    qry_familia_pais_CD_FAMILIA_PROD.AsString := qry_familia_prod_CD_FAMILIA_PROD.AsString;

    btn_co_pais.Enabled    := True;
    dbedt_cd_pais.ReadOnly := False;
    dbedt_cd_pais.Color    := clWindow;
    dbedt_cd_pais.TabStop  := True;
    dbedt_cd_pais.SetFocus;

    btn_mi(False, False, False, False);
    btn_mi_pais( False, True, True, False );
  end;

  if pgctrl_familia_prod.ActivePage = ts_paisdoc then
  begin
    if pgctrl_paisdoc.ActivePage = ts_lista_docs then
    begin
      pgctrl_paisdoc.ActivePage := ts_dados_basico_docs;
      btn_incluirClick(nil);
    end;

    if pgctrl_paisdoc.ActivePage = ts_dados_basico_docs then
    begin
      qry_familia_docs_.DisableControls;
      qry_familia_docs_.Cancel;
      qry_familia_docs_.Append;
      qry_familia_docs_.EnableControls;
      qry_familia_docs_CD_FAMILIA_PROD.AsString := qry_familia_pais_CD_FAMILIA_PROD.AsString;
      qry_familia_docs_NR_SEQUENCIAL.AsInteger  := qry_familia_pais_NR_SEQUENCIAL.AsInteger;
      qry_familia_docs_TP_LOCAL.AsString := '0';

      dbedt_cd_doc.ReadOnly := False;
      dbedt_cd_doc.Color    := clWindow;
      dbedt_cd_doc.TabStop  := True;
      dbedt_cd_doc.SetFocus;

      btn_mi(False, True, True, False);
    end;
  end;
end;

procedure Tfrm_familia_prod.btn_salvarClick(Sender: TObject);
begin
  //Salva um registro alterado ou nova inclusão
  ActiveControl := nil;
  if pgctrl_familia_prod.ActivePage = ts_dados_basicos then
  begin
    if Not Consiste then Exit;
    if Not Grava then Exit;
  end;

  if pgctrl_familia_prod.ActivePage = tbsPais then
  begin
    if not ConsistePais then Exit;
    if not GravaPais then Exit;
  end;

  if pgctrl_familia_prod.ActivePage = ts_paisdoc then
  begin
    if pgctrl_paisdoc.ActivePage = ts_dados_basico_docs then
    begin
      if Not ConsisteDocs then Exit;
      if Not GravaDocs then Exit;
    end;
  end;
end;

procedure Tfrm_familia_prod.btn_cancelarClick(Sender: TObject);
begin
  //Cancela um registro alterado ou nova inclusão
  if pgctrl_familia_prod.ActivePage = ts_dados_basicos then
  begin
    Cancelar;
  end;

  if pgctrl_familia_prod.ActivePage = tbsPais then
    CancelarPais;

  if pgctrl_familia_prod.ActivePage = ts_paisdoc then
  begin
    if pgctrl_paisdoc.ActivePage = ts_dados_basico_docs then
    begin
      CancelarDocs;
    end;
  end;
end;

procedure Tfrm_familia_prod.btn_excluirClick(Sender: TObject);
begin
  //Exclui um registro
  if pgctrl_familia_prod.ActivePage = ts_lista then
  begin
    if BoxMensagem( 'Esta Família de Produtos será excluída!' + #13#10 +
                    'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;

        with TQuery.Create(Application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQl.Add('DELETE FROM TFAMILIA_DOCS' );
          SQl.Add('WHERE CD_FAMILIA_PROD = '+ QuotedStr( Trim(dbedt_cd_familia_prod.Text) ) );
          ExecSQL;

          SQL.Clear;
          SQl.Add('DELETE FROM TFAMILIA_PAIS' );
          SQl.Add('WHERE CD_FAMILIA_PROD = '+ QuotedStr( Trim(dbedt_cd_familia_prod.Text) ) );
          ExecSQL;
          Free;
        end;
        qry_familia_prod_.Delete;

        datm_main.db_broker.Commit;
        pgctrl_familia_prod.ActivePage := ts_lista;
      except
        on E: Exception do
        begin
          qry_familia_prod_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
  end;

  if pgctrl_familia_prod.ActivePage = ts_dados_basicos then
  begin
    pgctrl_familia_prod.ActivePage := ts_lista;
    btn_excluirClick(nil);
  end;

  if pgctrl_familia_prod.ActivePage = tbsPais then
  begin
    if BoxMensagem('Este País será excluídao da Família de Produto!'#13'Confirma exclusão?', 1) then
      try
        datm_main.db_broker.StartTransaction;

        with TQuery.Create(Application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQl.Add('DELETE FROM TFAMILIA_DOCS' );
          SQl.Add('WHERE CD_FAMILIA_PROD = '+ QuotedStr( Trim(dbedt_cd_familia_prod.Text) ) );
          SQL.Add('  AND NR_SEQUENCIAL = '+ qry_familia_pais_NR_SEQUENCIAL.AsString );
          ExecSQL;
          Free;
        end;
        qry_familia_pais_.Delete;

        datm_main.db_broker.Commit;
        pgctrl_familia_prod.ActivePage := ts_dados_basicos;
      except
        on E: Exception do
        begin
          qry_familia_pais_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
  end;

  if pgctrl_familia_prod.ActivePage = ts_paisdoc then
  begin
    if pgctrl_paisdoc.ActivePage = ts_lista_docs then
    begin
      if BoxMensagem( 'Esta Instrução de Documento será excluída!' + #13#10 +
                      'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;

        qry_familia_docs_.Delete;

        datm_main.db_broker.Commit;

        if qry_familia_docs_.IsEmpty then
          pgctrl_familia_prod.ActivePage := ts_lista
        else
          pgctrl_paisdoc.ActivePage := ts_lista_docs;
      except
        on E: Exception do
        begin
          qry_familia_prod_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;

  if pgctrl_familia_prod.ActivePage = ts_paisdoc then
  begin
    if pgctrl_paisdoc.ActivePage = ts_dados_basico_docs then
    begin
      pgctrl_paisdoc.ActivePage := ts_lista_docs;
      btn_excluirClick(nil);
    end;
  end;
end;

procedure Tfrm_familia_prod.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_familia_prod.edt_chaveChange(Sender: TObject);
begin
  Localiza( qry_familia_prod_, edt_chave.Text, a_str_indices[cbb_ordem.ItemIndex] );
end;

procedure Tfrm_familia_prod.cbb_ordemClick(Sender: TObject);
begin
  cd_familia_prod := qry_familia_prod_CD_FAMILIA_PROD.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  qry_familia_prod_.Close;
  qry_familia_prod_.SQL[7] := a_str_indices[cbb_ordem.ItemIndex];
  qry_familia_prod_.Prepare;
  qry_familia_prod_.Open;
  Localiza( qry_familia_prod_, cd_familia_prod, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_familia_prod.pgctrl_familia_prodChange(Sender: TObject);
begin
  if pgctrl_familia_prod.ActivePage = ts_lista then
  begin
    dbnvgr_familia_prod.Enabled    := True;
    dbnvgr_familia_prod.DataSource := ds_familia_prod;
    lbl_chave.Enabled := True;
    edt_chave.Enabled := True;
    lbl_ordem.Enabled := True;
    cbb_ordem.Enabled := True;

    if qry_familia_prod_.IsEmpty then
      btn_mi_pais(st_incluir, False, False, False)
    else
      btn_mi_pais(st_incluir, False, False, st_excluir);
  end;

  if pgctrl_familia_prod.ActivePage = ts_dados_basicos then
  begin
    if qry_familia_prod_.IsEmpty then
    begin
      btn_co_pais.Enabled    := False;
      dbedt_cd_pais.ReadOnly := True;
      dbedt_cd_pais.Color    := clMenu;
      dbedt_cd_pais.TabStop  := False;
    end
    else
      dbgrd_pais.Enabled := True;

    qry_familia_pais_.Close;
    qry_familia_pais_.ParamByName('cd_familia_prod').AsString := qry_familia_prod_CD_FAMILIA_PROD.AsString;
    qry_familia_pais_.Prepare;
    qry_familia_pais_.Open;

    if qry_familia_pais_.IsEmpty then
    begin
      btn_mi_pais(st_incluir, False, False, False);
      ts_paisdoc.TabVisible := False;
      spd_importador.Enabled := False;
    end
    else
    begin
      btn_mi_pais(st_incluir, False, False, st_excluir);
      ts_paisdoc.TabVisible := True;
      spd_importador.Enabled := True;
    end;

    dbnvgr_familia_prod.Enabled := False;
    lbl_chave.Enabled := False;
    edt_chave.Enabled := False;
    lbl_ordem.Enabled := False;
    cbb_ordem.Enabled := False;
  end;

  if pgctrl_familia_prod.ActivePage = ts_paisdoc then
  begin
    pgctrl_paisdoc.ActivePage := ts_lista_docs;

    qry_familia_docs_.Close;
    qry_familia_docs_.ParamByName('cd_familia_prod').AsString := qry_familia_pais_CD_FAMILIA_PROD.AsString;
    qry_familia_docs_.ParamByName('nr_sequencial').AsInteger := qry_familia_pais_NR_SEQUENCIAL.AsInteger;
    qry_familia_docs_.Prepare;
    qry_familia_docs_.Open;

    medt_cd_pais_lista.Text := qry_familia_pais_CD_PAIS.AsString;
    medt_cd_importador_lista.Text := qry_familia_pais_CD_IMPORTADOR.AsString;

    //medt_cd_pais_listaExit(nil);

    dbnvgr_familia_prod.Enabled    := True;
    dbnvgr_familia_prod.DataSource := ds_familia_docs;
    lbl_chave.Enabled := False;
    edt_chave.Enabled := False;
    lbl_ordem.Enabled := False;
    cbb_ordem.Enabled := False;
  end;
end;

procedure Tfrm_familia_prod.pgctrl_familia_prodChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
  AllowChange := VerAltPais;
  AllowChange := VerAltDocs;
end;

procedure Tfrm_familia_prod.pgctrl_paisdocChange(Sender: TObject);
begin
  if pgctrl_paisdoc.ActivePage = ts_lista_docs then
  begin
    if qry_familia_docs_.IsEmpty then
      btn_mi_pais(st_incluir, False, False, False)
    else
      btn_mi_pais(st_incluir, False, False, st_excluir);
  end;

  if pgctrl_paisdoc.ActivePage = ts_dados_basico_docs then
  begin
    //
  end;
end;

procedure Tfrm_familia_prod.pgctrl_paisdocChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAltDocs;
end;

procedure Tfrm_familia_prod.dbgrd_familia_prodDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := qry_familia_prod_CD_FAMILIA_PROD.AsString;
    except
      try
        Cons_Online_Texto := qry_familia_prod_CD_FAMILIA_PROD.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código da Família de Produtos!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_familia_prod.dbgrd_familia_prodKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then dbgrd_familia_prodDblClick(nil);
end;

procedure Tfrm_familia_prod.qry_familia_prod_CalcFields(DataSet: TDataSet);
begin
  {Exibe o IN_ATIVO com um Check}
  qry_familia_prod_.FieldByName('calc_in_ativo').AsString := '';
  if ( qry_familia_prod_.FieldByName('IN_ATIVO').AsString = '1' ) then
    qry_familia_prod_.FieldByName('calc_in_ativo').AsString := 'ü';

  {Unid. Neg.}
  qry_familia_prod_.FieldByName('calc_nm_unid_neg').AsString :=
    ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',qry_familia_prod_.FieldByName('CD_UNID_NEG').AsString,'AP_UNID_NEG');

  {Produto}
  qry_familia_prod_.FieldByName('calc_nm_produto').AsString :=
    ConsultaLookUP('TPRODUTO','CD_PRODUTO',qry_familia_prod_.FieldByName('CD_PRODUTO').AsString,'NM_PRODUTO');

  {Exportador}
  if qry_familia_prod_.FieldByName('CD_PRODUTO').AsString = '01' then
    qry_familia_prod_.FieldByName('calc_nm_exportador').AsString :=
      ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',qry_familia_prod_.FieldByName('CD_EXPORTADOR').AsString,'NM_EMPRESA');

  if qry_familia_prod_.FieldByName('CD_PRODUTO').AsString = '02' then
    qry_familia_prod_.FieldByName('calc_nm_exportador').AsString :=
      ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',qry_familia_prod_.FieldByName('CD_EXPORTADOR').AsString,'NM_EMPRESA');

  {Usuário}
  qry_familia_prod_.FieldByName('calc_nm_usuario').AsString :=
    ConsultaLookUP('TUSUARIO','CD_USUARIO',qry_familia_prod_.FieldByName('CD_USUARIO').AsString,'NM_USUARIO');
end;

procedure Tfrm_familia_prod.dbedt_cd_familia_prodExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;

  if TDBEdit(Sender).Name = 'dbedt_cd_familia_prod' then
  begin
    {Verifica se o código já foi cadastrado}
    if ds_familia_prod.State in [dsInsert] then
    begin
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('SELECT CD_FAMILIA_PROD ');
        SQL.Add('FROM TFAMILIA_PROD ( NOLOCK) ');
        SQL.Add('WHERE CD_FAMILIA_PROD = '+ QuotedStr(dbedt_cd_familia_prod.Text) );
        Open;
        if not IsEmpty then
        begin
          MessageDlg('Já existe uma Família de Mercadoria com esse código cadastrado!', mtInformation, [mbOk], 0);
          dbedt_cd_familia_prod.SetFocus;
          Exit;
        end;
        Close;
        Free;
      end;
    end;
  end;
end;

procedure Tfrm_familia_prod.dbedt_cd_produtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_unid_neg   then btn_co_unid_negClick(nil);
    if Sender = dbedt_cd_produto    then btn_co_produtoClick(nil);
    if Sender = dbedt_cd_exportador then btn_co_exportadorClick(nil);
    if Sender = dbedt_cd_pais       then btn_co_paisClick(nil);
    if Sender = medt_cd_pais_lista  then btn_co_pais_listaClick(nil);
    if Sender = dbedt_cd_doc        then btn_co_docClick(nil);
    if Sender = dbedtArea           then btnAreaClick(nil);
  end;
end;

procedure Tfrm_familia_prod.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qry_familia_prod_) then exit;
    if (Sender as TSpeedButton).Enabled Then
      dbedt_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','NM_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', dbedt_cd_produto.Text,'NM_PRODUTO');
end;

procedure Tfrm_familia_prod.btn_co_exportadorClick(Sender: TObject);
begin
  //quando for importação o exportador é uma empresa estrangeira
  if ( dbedt_cd_produto.Text = '01' ) or ( qry_familia_prod_CD_PRODUTO.AsString = '01' ) then
  begin
    if Sender is TSpeedButton then
    begin
      if not PoeEmEdicao(qry_familia_prod_) then exit;
      if (Sender as TSpeedButton).Enabled Then
        qry_familia_prod_CD_EXPORTADOR.AsString := ConsultaOnLineEx('TEMPRESA_EST','Exportador',['CD_EMPRESA','NM_EMPRESA'],['Código','Descrição'],'CD_EMPRESA',frm_main.mi_cad_emp_nac)
    end
    else
      edt_nm_exportador.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',dbedt_cd_exportador.Text,'NM_EMPRESA');

    Exit;
  end;
  //quando for exportação o exportador é uma empresa nacional
  if ( dbedt_cd_produto.Text = '02' ) or ( qry_familia_prod_CD_PRODUTO.AsString = '02' ) then
  begin
    if Sender is TSpeedButton then
    begin
      if not PoeEmEdicao(qry_familia_prod_) then exit;
      if (Sender as TSpeedButton).Enabled Then
        qry_familia_prod_CD_EXPORTADOR.AsString := ConsultaOnLineEx('TEMPRESA_NAC','Exportador',['CD_EMPRESA','NM_EMPRESA'],['Código','Descrição'],'CD_EMPRESA',frm_main.mi_cad_emp_est)
    end
    else
      edt_nm_exportador.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',dbedt_cd_exportador.Text,'NM_EMPRESA');

    Exit;
  end;
  //produto inválido
  if ( dbedt_cd_produto.Text = '' ) or ( qry_familia_prod_CD_PRODUTO.AsString = '' ) then
  begin
    MessageDlg('Antes de selecionar o exportador, escolha um produto.', mtInformation, [mbOk], 0);
    dbedt_cd_exportador.Clear;
    dbedt_cd_produto.SetFocus;
    Exit;
  end;
end;

function Tfrm_familia_prod.GravaPais: Boolean;
var
  maximo_seq : Integer;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( qry_familia_pais_.State in [dsInsert, dsEdit] ) then
    begin
      cd_familia_prod := qry_familia_pais_CD_FAMILIA_PROD.AsString;
      cd_pais_prod    := qry_familia_pais_CD_PAIS.AsString;
      cd_importador_prod:= qry_familia_pais_CD_IMPORTADOR.AsString;
      if qry_familia_pais_.State = dsInsert then
      begin
        with TQuery.Create(Application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add('SELECT MAX(NR_SEQUENCIAL) AS MAXIMO ');
          SQL.Add('FROM TFAMILIA_PAIS ( NOLOCK) ');
          Open;
          maximo_seq := FieldByName('MAXIMO').asInteger;
          Close;
        end;
        qry_familia_pais_NR_SEQUENCIAL.AsInteger := maximo_seq + 1;
      end;
      qry_familia_pais_.Post;
      //atualiza o usuario e a data de alteração
      if Not ( qry_familia_prod_.State in [dsEdit] ) then
      begin
        qry_familia_prod_.Edit;
        qry_familia_prod_CD_USUARIO.AsString     := str_cd_usuario;
        qry_familia_prod_DT_ALTERACAO.AsDateTime := Now();

        qry_familia_prod_.Post;
      end;

      qry_familia_pais_.Close;
      qry_familia_pais_.ParamByName('cd_familia_prod').AsString := cd_familia_prod;
      qry_familia_pais_.Prepare;
      qry_familia_pais_.Open;

      qry_familia_pais_.Locate( 'CD_FAMILIA_PROD;CD_PAIS;CD_IMPORTADOR', VarArrayOf([cd_familia_prod,cd_pais_prod, cd_importador_prod]), [loCaseInsensitive] );

      ts_paisdoc.TabVisible := True;
    end;
    datm_main.db_broker.Commit;
    GravaPais := True;
  except
    on E: Exception do
    begin
      qry_familia_pais_.Cancel;
      qry_familia_prod_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      GravaPais := False;
    end;
  end;


  btn_co_pais.Enabled   := False;

  btn_mi(st_incluir, False, False, st_excluir);
  btn_mi_pais(st_incluir, False, False, st_excluir);
end;

procedure Tfrm_familia_prod.CancelarPais;
begin
  try
    if qry_familia_pais_.State in [dsInsert, dsEdit] then
    begin
      qry_familia_pais_.Cancel;
      pgctrl_familia_prod.ActivePage := ts_dados_basicos;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;

  btn_co_pais.Enabled    := False;
  dbedt_cd_pais.ReadOnly := True;
  dbedt_cd_pais.Color    := clMenu;
  dbedt_cd_pais.TabStop  := False;

  btn_mi(st_incluir, False, False, st_excluir);
  btn_mi_pais( st_incluir, False, False, st_excluir );
end;

function Tfrm_familia_prod.ConsistePais: Boolean;
begin
  ConsistePais := True;

  {Consiste País}
  if qry_familia_pais_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_pais );

  if dbedt_cd_pais.Text <> '' then
  begin
    if edt_nm_pais.Text = '' then
    begin
      BoxMensagem('Código do País inválido!', 2);
      pgctrl_familia_prod.ActivePage := ts_dados_basicos;
      dbedt_cd_pais.SetFocus;
      ConsistePais := False;
      Exit;
    end;
  end;
end;

function Tfrm_familia_prod.VerAltPais : Boolean;
begin
  VerAltPais := True;
  if ( ( qry_familia_pais_.State in [dsEdit] ) and st_modificar ) or
     ( qry_familia_pais_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Família de Produtos foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      if Not ConsistePais then
      begin
        VerAltPais := False;
        Exit;
      end;
      if Not GravaPais then
      begin
        VerAltPais := False;
        Exit;
      end;
    end
    else
      Cancelar;
  end;
end;

procedure Tfrm_familia_prod.dbgrd_paisDblClick(Sender: TObject);
begin
  if not qry_familia_pais_.IsEmpty then
  begin
    ts_paisdoc.TabVisible := True;
    spd_importador.Enabled := True;

    qry_familia_docs_.Close;
    qry_familia_docs_.ParamByName('cd_familia_prod').AsString := qry_familia_pais_CD_FAMILIA_PROD.AsString;
    qry_familia_docs_.ParamByName('nr_sequencial').AsInteger := qry_familia_pais_NR_SEQUENCIAL.AsInteger;
    qry_familia_docs_.Prepare;
    qry_familia_docs_.Open;

    pgctrl_familia_prod.ActivePage := ts_paisdoc;
  end;
end;

procedure Tfrm_familia_prod.dbedt_cd_paisExit(Sender: TObject);
begin
  lNaoConsiste := True;
  ConsistePais;
  lNaoConsiste := False;
end;

procedure Tfrm_familia_prod.btn_co_paisClick(Sender: TObject);
var
  pais_antigo, pais_escolhido : String;
begin
  if Sender is TSpeedButton then
  begin
    pais_antigo := qry_familia_pais_CD_PAIS.AsString;
    if not PoeEmEdicao(qry_familia_pais_) then exit;
    If (Sender as TSpeedButton).Enabled Then
    begin
      pais_escolhido := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil);
      if pais_escolhido = '' then
        pais_escolhido := pais_antigo;
      qry_familia_pais_CD_PAIS.AsString := pais_escolhido;
      if pais_escolhido <> pais_antigo then
        qry_familia_pais_CD_IMPORTADOR.AsString := '';
    end;
  end
  else
    edt_nm_pais.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais.Text,'DESCRICAO');
  if edt_nm_pais.Text <> '' then
    spd_importador.Enabled := True
  else
    spd_importador.Enabled := False;
end;

function Tfrm_familia_prod.GravaDocs: Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( qry_familia_docs_.State in [dsInsert, dsEdit] ) then
    begin
      cd_familia_prod := qry_familia_docs_CD_FAMILIA_PROD.AsString;
      cd_pais_prod    := medt_cd_pais_lista.Text;
      cd_doc_prod     := qry_familia_docs_CD_DOCUMENTO.AsString;
      cd_importador_prod := medt_cd_importador_lista.Text;
      qry_familia_docs_CD_IMPORTADOR.AsString  := cd_importador_prod;
      qry_familia_docs_CD_PAIS.AsString  := cd_pais_prod;
      qry_familia_docs_NR_SEQUENCIAL.AsInteger := qry_familia_pais_NR_SEQUENCIAL.AsInteger;
      qry_familia_docs_CD_USUARIO.AsString     := str_cd_usuario;
      qry_familia_docs_DT_ALTERACAO.AsDateTime := Now();
      qry_familia_docs_.Post;
      //atualiza o usuario e a data de alteração produto
      if Not ( qry_familia_prod_.State in [dsEdit] ) then
      begin
        qry_familia_prod_.Edit;
        qry_familia_prod_CD_USUARIO.AsString     := str_cd_usuario;
        qry_familia_prod_DT_ALTERACAO.AsDateTime := Now();
        qry_familia_prod_.Post;
      end;
      //atualiza o usuario e a data de alteração produtoXpais
      if Not ( qry_familia_pais_.State in [dsEdit] ) then
      begin
        qry_familia_pais_.Edit;
        qry_familia_pais_CD_USUARIO.AsString     := str_cd_usuario;
        qry_familia_pais_DT_ALTERACAO.AsDateTime := Now();
        qry_familia_pais_.Post;
      end;

      qry_familia_docs_.Close;
      qry_familia_docs_.ParamByName('cd_familia_prod').AsString := cd_familia_prod;
      qry_familia_docs_.ParamByName('nr_sequencial').AsInteger := qry_familia_pais_NR_SEQUENCIAL.AsInteger;
      qry_familia_docs_.Prepare;
      qry_familia_docs_.Open;

      qry_familia_docs_.Locate( 'CD_FAMILIA_PROD;CD_PAIS;CD_IMPORTADOR;CD_DOCUMENTO', VarArrayOf([cd_familia_prod,cd_pais_prod, cd_importador_prod, cd_doc_prod]), [loCaseInsensitive] );
    end;
    datm_main.db_broker.Commit;
    GravaDocs := True;
  except
    on E: Exception do
    begin
      qry_familia_docs_.Cancel;
      qry_familia_prod_.Cancel;
      qry_familia_pais_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      GravaDocs := False;
    end;
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

function Tfrm_familia_prod.ConsisteDocs: Boolean;
begin
  ConsisteDocs := True;

  {Documento}
  if qry_familia_docs_.State in [dsInsert, dsEdit] then
     ValidCodigo( dbedt_cd_doc );

  if dbedt_cd_doc.Text <> '' then
  begin
    if edt_nm_doc.Text = '' then
    begin
      BoxMensagem('Código do Produto inválido!', 2);
      pgctrl_familia_prod.ActivePage := ts_dados_basico_docs;
      dbedt_cd_doc.SetFocus;
      ConsisteDocs := False;
      Exit;
    end;
  end;

  {Texto}
  if Not lNaoConsiste then
  begin
    if dbmmo_doc.Text = '' then
    begin
      BoxMensagem('Instrução do Documento deve ser preenchido!', 2);
      dbmmo_doc.SetFocus;
      ConsisteDocs := False;
      Exit;
    end;
  end;
end;

function Tfrm_familia_prod.VerAltDocs : Boolean;
begin
  VerAltDocs := True;
  if ( ( qry_familia_docs_.State in [dsEdit] ) and st_modificar ) or
     ( qry_familia_docs_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Família de Produtos foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      if Not ConsisteDocs then
      begin
        VerAltDocs := False;
        Exit;
      end;
      if Not GravaDocs then
      begin
        VerAltDocs := False;
        Exit;
      end;
    end
    else
      Cancelar;
  end;
end;

procedure Tfrm_familia_prod.CancelarDocs;
begin
  try
    if qry_familia_docs_.State in [dsInsert, dsEdit] then
    begin
      qry_familia_docs_.Cancel;
      pgctrl_familia_prod.ActivePage := ts_dados_basicos;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;

  btn_mi(st_incluir, False, False, st_excluir);
end;

procedure Tfrm_familia_prod.dbedt_cd_docExit(Sender: TObject);
begin
  lNaoConsiste := True;
  ConsisteDocs;
  lNaoConsiste := False;
end;

procedure Tfrm_familia_prod.btn_co_docClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qry_familia_prod_) then Exit;
    if (Sender as TSpeedButton).Enabled Then
      dbedt_cd_doc.Text := ConsultaOnLineExSQL(
        'SELECT D.CODIGO, D.DESCRICAO, U.AP_UNID_NEG, P.NM_PRODUTO '+
        'FROM TTP_DOCUMENTO D ( NOLOCK ), TUNID_NEG U ( NOLOCK ), TPRODUTO P ( NOLOCK )'+
        'WHERE D.CD_UNID_NEG = U.CD_UNID_NEG'+
        '  AND D.CD_PRODUTO  = P.CD_PRODUTO'+
        '  AND D.CD_UNID_NEG = '+ QuotedStr(qry_familia_prod_CD_UNID_NEG.AsString) +
        '  AND D.CD_PRODUTO  = '+ QuotedStr(qry_familia_prod_CD_PRODUTO.AsString) ,
        'Tipo de Documentos',
        ['CODIGO','DESCRICAO','NM_UNID_NEG','NM_PRODUTO'],
        ['Cód.','Descrição(Documento)','Unid. Neg.','Produto'],
        'CODIGO',frm_main.mi_cad_documento
      );
  end
  else
    edt_nm_doc.Text := ConsultaLookUPSQL(
      'SELECT DESCRICAO '+
      'FROM TTP_DOCUMENTO ( NOLOCK )'+
      'WHERE CD_UNID_NEG = '+ QuotedStr(qry_familia_prod_CD_UNID_NEG.AsString) +
      '  AND CD_PRODUTO  = '+ QuotedStr(qry_familia_prod_CD_PRODUTO.AsString) +
      '  AND CODIGO = '+ QuotedStr(dbedt_cd_doc.Text),'DESCRICAO'
    );
end;

procedure Tfrm_familia_prod.btn_co_pais_listaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    medt_cd_pais_lista.Text := ConsultaOnLineExSQL(
      'SELECT CODIGO, DESCRICAO '+
      'FROM TPAIS P ( NOLOCK ), TFAMILIA_PAIS F ( NOLOCK ) '+
      'WHERE P.CODIGO = F.CD_PAIS '+
      '  AND F.CD_FAMILIA_PROD = '+ QuotedStr(qry_familia_prod_CD_FAMILIA_PROD.AsString),
      'Países da Familia de Produto '+ qry_familia_prod_CD_FAMILIA_PROD.AsString,
      ['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil
    );
    medt_cd_pais_listaExit(nil);
  end
  else
    edt_nm_pais_lista.Text := ConsultaLookUPSQL(
      'SELECT DESCRICAO '+
      'FROM TPAIS P ( NOLOCK ), TFAMILIA_PAIS F ( NOLOCK ) '+
      'WHERE P.CODIGO = F.CD_PAIS '+
      '  AND F.CD_FAMILIA_PROD = '+ QuotedStr(qry_familia_prod_CD_FAMILIA_PROD.AsString) +
      '  AND F.CD_PAIS = '+ QuotedStr(medt_cd_pais_lista.Text),
      'DESCRICAO');
end;

procedure Tfrm_familia_prod.medt_cd_pais_listaEnter(Sender: TObject);
begin
  medt_cd_pais_lista.Clear;
end;

procedure Tfrm_familia_prod.medt_cd_pais_listaExit(Sender: TObject);
begin
  if edt_nm_pais_lista.Text = '' then
  begin
    MessageDlg('País não encontrado. Selecione um país cadastrado para esta Família de Produtos.', mtInformation, [mbOK], 0);

    medt_cd_pais_lista.SetFocus;
    btn_mi(False, False, False, False);
  end
  else
  begin
    cd_familia_prod := qry_familia_pais_CD_FAMILIA_PROD.AsString;
    cd_pais_prod    := medt_cd_pais_lista.Text;

    qry_familia_docs_.Close;
    qry_familia_docs_.ParamByName('cd_familia_prod').AsString := cd_familia_prod;
    qry_familia_docs_.ParamByName('nr_sequencial').AsInteger  := qry_familia_pais_NR_SEQUENCIAL.AsInteger;;
    qry_familia_docs_.Prepare;
    qry_familia_docs_.Open;

    qry_familia_pais_.Locate( 'CD_FAMILIA_PROD;CD_PAIS', VarArrayOf([cd_familia_prod,cd_pais_prod]), [loCaseInsensitive] );

    dbgrd_docs.SetFocus;
    btn_mi(st_incluir, False, False, st_excluir);
  end;
end;

procedure Tfrm_familia_prod.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qry_familia_prod_) then Exit;
    if (Sender as TSpeedButton).Enabled Then
      dbedt_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unid. Neg.',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg);
  end
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', dbedt_cd_unid_neg.Text,'NM_UNID_NEG');
end;

procedure Tfrm_familia_prod.qry_familia_pais_CalcFields(DataSet: TDataSet);
begin
{
  qry_familia_pais_.FieldByName('calc_nm_pais').AsString :=
    ConsultaLookUP('TPAIS','CODIGO',qry_familia_pais_.FieldByName('CD_PAIS').AsString,'DESCRICAO');
}
    qry_familia_pais_.FieldByName('calc_nm_importador').AsString :=
    ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',qry_familia_pais_.FieldByName('CD_IMPORTADOR').AsString,'NM_EMPRESA');
end;

procedure Tfrm_familia_prod.qry_familia_docs_CalcFields(DataSet: TDataSet);
begin
  qry_familia_docs_.FieldByName('calc_nm_documento').AsString := ConsultaLookUPSQL(
    'SELECT DESCRICAO '+
    'FROM TTP_DOCUMENTO ( NOLOCK )'+
    'WHERE CD_UNID_NEG = '+ QuotedStr(qry_familia_prod_CD_UNID_NEG.AsString) +
    '  AND CD_PRODUTO  = '+ QuotedStr(qry_familia_prod_CD_PRODUTO.AsString) +
    '  AND CODIGO = '+ QuotedStr(qry_familia_docs_CD_DOCUMENTO.AsString),'DESCRICAO'
  );
  
  {Usuário}
  qry_familia_docs_.FieldByName('calc_nm_usuario').AsString :=
    ConsultaLookUP('TUSUARIO','CD_USUARIO',qry_familia_docs_.FieldByName('CD_USUARIO').AsString,'NM_USUARIO');
end;

procedure Tfrm_familia_prod.qry_familia_prod_AfterScroll(
  DataSet: TDataSet);
begin
  qry_familia_pais_.Close;
  qry_familia_pais_.ParamByName('cd_familia_prod').AsString := qry_familia_prod_CD_FAMILIA_PROD.AsString;
  qry_familia_pais_.Prepare;
  qry_familia_pais_.Open;

  if qry_familia_pais_.IsEmpty then
  begin
    ts_paisdoc.TabVisible := False;
    spd_importador.Enabled := False;
  end
  else
  begin
    ts_paisdoc.TabVisible := True;
    spd_importador.Enabled := True;
  end;
end;

procedure Tfrm_familia_prod.qry_familia_prod_BeforeEdit(DataSet: TDataSet);
begin
  btn_mi(False, True, True, False);
end;

procedure Tfrm_familia_prod.qry_familia_pais_BeforeEdit(DataSet: TDataSet);
begin
  btn_mi_pais(False, True, True, False);
end;

procedure Tfrm_familia_prod.qry_familia_docs_BeforeEdit(DataSet: TDataSet);
begin
  btn_mi(False, True, True, False);
end;

procedure Tfrm_familia_prod.qry_familia_prod_AfterPost(DataSet: TDataSet);
begin
  dbedt_cd_familia_prod.ReadOnly := True;
  dbedt_cd_familia_prod.Color    := clMenu;
  dbedt_cd_familia_prod.TabStop  := False;
end;

procedure Tfrm_familia_prod.FormResize(Sender: TObject);
begin
  pnl_pesquisa.Left := ( frm_familia_prod.Width - pnl_pesquisa.Width - 8);
  btn_sair.Left := ( pnl_pesquisa.Left - btn_sair.Width - 2);
  dbnvgr_familia_prod.Left := ( btn_sair.Left - dbnvgr_familia_prod.Width - 10);
end;

procedure Tfrm_familia_prod.qry_familia_prod_BeforeInsert(
  DataSet: TDataSet);
begin
  qry_familia_pais_.Close;
end;

procedure Tfrm_familia_prod.qry_familia_pais_AfterPost(DataSet: TDataSet);
begin
  btn_co_pais.Enabled    := False;
  dbedt_cd_pais.ReadOnly := True;
  dbedt_cd_pais.Color    := clMenu;
  dbedt_cd_pais.TabStop  := False;
  qry_familia_pais_.ApplyUpdates;
end;

procedure Tfrm_familia_prod.qry_familia_docs_AfterPost(DataSet: TDataSet);
begin
  dbedt_cd_doc.ReadOnly := True;
  dbedt_cd_doc.Color    := clMenu;
  dbedt_cd_doc.TabStop  := False;
end;

procedure Tfrm_familia_prod.spd_importadorClick(Sender: TObject);
var
  importador_escolhido : String;
  importador_antigo : String;
begin
  importador_antigo := qry_familia_pais_CD_IMPORTADOR.AsString;
  importador_escolhido := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NM_EMPRESA, END_EMPRESA, END_CIDADE FROM TEMPRESA_EST WHERE CD_PAIS ='''+ qry_familia_pais_CD_PAIS.AsString +'''','Importadores',['CD_EMPRESA','NM_EMPRESA','END_EMPRESA','END_CIDADE'],['Código','Nome','Endereço','Cidade'],'CD_EMPRESA',nil);

  if importador_escolhido = '' then
    importador_escolhido := importador_antigo;

  if importador_escolhido <> qry_familia_pais_CD_IMPORTADOR.AsString then
  begin
    qry_familia_pais_.Edit;
    qry_familia_pais_CD_IMPORTADOR.AsString := importador_escolhido;
  end;
end;

procedure Tfrm_familia_prod.dbedt_cd_importadorExit(Sender: TObject);
begin
  edt_nm_importador.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',dbedt_cd_importador.Text,'NM_EMPRESA');
end;

procedure Tfrm_familia_prod.dbedt_cd_importadorChange(Sender: TObject);
begin
  edt_nm_importador.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',dbedt_cd_importador.Text,'NM_EMPRESA');
end;

procedure Tfrm_familia_prod.medt_cd_importador_listaChange(
  Sender: TObject);
begin
  edt_nm_importador_lista.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',medt_cd_importador_lista.Text,'NM_EMPRESA');
end;

procedure Tfrm_familia_prod.SpeedButton1Click(Sender: TObject);
begin
  medt_cd_importador_lista.Text := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NM_EMPRESA, END_EMPRESA, END_CIDADE FROM TEMPRESA_EST WHERE CD_PAIS ='''+ medt_cd_pais_lista.Text +'''','Importadores',['CD_EMPRESA','NM_EMPRESA','END_EMPRESA','END_CIDADE'],['Código','Nome','Endereço','Cidade'],'CD_EMPRESA',nil);
end;

procedure Tfrm_familia_prod.btn_importarClick(Sender: TObject);
begin
  pnl_import.Visible := True;
  pgctrl_familia_prod.Enabled := False;
  pnl_cadastro.Enabled := False;
end;

procedure Tfrm_familia_prod.SpeedButton4Click(Sender: TObject);
begin
  medt_familia_origem.Text := '';
  medt_pais_origem.Text := '';
  medt_importador_origem.Text := '';
  medt_pais_origem.Enabled := False;
  btn_pais_origem.Enabled := False;
  medt_importador_origem.Enabled := False;
  btn_importador_origem.Enabled := False;
  pnl_import.Visible := False;
  pgctrl_familia_prod.Enabled := True;
  pnl_cadastro.Enabled := True;
end;

procedure Tfrm_familia_prod.btn_pais_origemClick(Sender: TObject);
var pais_antigo, pais_escolhido : String;
begin
  if Sender is TSpeedButton then
  begin
    pais_antigo := medt_pais_origem.Text;
    pais_escolhido := ConsultaOnLineExSQL(
      'SELECT DISTINCT P.CODIGO, P.DESCRICAO '+
      ' FROM TFAMILIA_DOCS FP '+
      ' INNER JOIN TPAIS P ON (P.CODIGO = FP.CD_PAIS) '+
      'WHERE FP.CD_FAMILIA_PROD = '''+ medt_familia_origem.Text +'''',
      'Países',
      ['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil
    );
    if pais_escolhido = '' then
      pais_escolhido := pais_antigo;
    medt_pais_origem.Text := pais_escolhido;
  end
  else
  begin
    edt_pais_origem.Text := ConsultaLookUPSQL(
      'SELECT DESCRICAO '+
      'FROM TPAIS  '+
      'WHERE CODIGO = '+ QuotedStr(medt_pais_origem.Text),
      'DESCRICAO');
    if  edt_pais_origem.Text <> '' Then
    begin
      medt_importador_origem.Enabled := True;
      btn_importador_origem.Enabled  := True;
    end
    else
    begin
      medt_importador_origem.Enabled := False;
      btn_importador_origem.Enabled  := False;
    end;
  end;
  //btn_ok_origem.SetFocus;
end;

procedure Tfrm_familia_prod.btn_importador_origemClick(Sender: TObject);
var
  importador_antigo, importador_escolhido : String;
begin
  importador_antigo := medt_importador_origem.Text;
  importador_escolhido := ConsultaOnLineExSQL(
      'SELECT DISTINCT CD_EMPRESA, NM_EMPRESA, END_EMPRESA, END_CIDADE '+
      ' FROM TFAMILIA_DOCS FP '+
      ' INNER JOIN TEMPRESA_EST E ON (E.CD_EMPRESA = FP.CD_IMPORTADOR) '+
      ' WHERE FP.CD_FAMILIA_PROD = '''+ medt_familia_origem.Text +'''' +
      ' AND FP.CD_PAIS = ''' + medt_pais_origem.Text + '''',
      'Importadores',['CD_EMPRESA','NM_EMPRESA','END_EMPRESA','END_CIDADE'],['Código','Nome','Endereço','Cidade'],'CD_EMPRESA',nil
    );
   if importador_escolhido = '' then
     importador_escolhido := importador_antigo;

   medt_importador_origem.Text:= importador_escolhido;
end;

procedure Tfrm_familia_prod.medt_importador_origemChange(Sender: TObject);
begin
  edt_importador_origem.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',medt_importador_origem.Text,'NM_EMPRESA');
  if  (edt_pais_origem.Text <> '') and (edt_importador_origem.Text <> '') and (edt_familia_origem.Text <> '') Then
    btn_ok_origem.Enabled := True
  else
    btn_ok_origem.Enabled := False;
  //btn_ok_origem.SetFocus;
end;

procedure Tfrm_familia_prod.btn_ok_origemClick(Sender: TObject);
begin
  if MessageDlg('As informações serão perdidas.'+#13+'Deseja realmente continuar?',mtConfirmation,[mbOK,mbCancel],0) = mrOK then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQl.Add('DELETE FROM TFAMILIA_DOCS' );
      SQl.Add('WHERE CD_FAMILIA_PROD = '+ QuotedStr( Trim(dbedt_cd_familia_prod.Text) ) );
      SQL.Add('  AND NR_SEQUENCIAL = '+ qry_familia_pais_NR_SEQUENCIAL.AsString );
      ExecSQL;
      SQL.Clear;
      SQl.Add(' INSERT INTO TFAMILIA_DOCS ');
      SQl.Add(' (CD_FAMILIA_PROD, CD_DOCUMENTO, TP_LOCAL, TX_INSTRUCAO, CD_USUARIO, DT_ALTERACAO, NR_SEQUENCIAL, CD_PAIS, CD_IMPORTADOR) ');
      SQl.Add(' SELECT ');
      SQl.Add(' '''+ qry_familia_pais_CD_FAMILIA_PROD.AsString +''', CD_DOCUMENTO, TP_LOCAL, TX_INSTRUCAO, CD_USUARIO, DT_ALTERACAO,' + qry_familia_pais_NR_SEQUENCIAL.AsString + ','''+qry_familia_pais_CD_PAIS.AsString+''','''+qry_familia_pais_CD_IMPORTADOR.AsString+'''');
      SQl.Add(' FROM TFAMILIA_DOCS ');
      SQl.Add(' WHERE CD_FAMILIA_PROD = '''+ medt_familia_origem.Text +'''');
      SQl.Add(' AND CD_PAIS = ''' + medt_pais_origem.Text + '''');
      SQl.Add(' AND CD_IMPORTADOR = '''+ medt_importador_origem.Text +'''');
      ExecSQL;
      Free;
      qry_familia_docs_.Close;
      qry_familia_docs_.ParamByName('cd_familia_prod').AsString := qry_familia_pais_CD_FAMILIA_PROD.AsString;
      qry_familia_docs_.ParamByName('nr_sequencial').AsInteger  := qry_familia_pais_NR_SEQUENCIAL.AsInteger;
      qry_familia_docs_.Prepare;
      qry_familia_docs_.Open;
    end;
  end;
  SpeedButton4.Click();
end;

procedure Tfrm_familia_prod.btn_familia_origemClick(Sender: TObject);
var
  familia_escolhido, familia_antigo : String;
begin
  if Sender is TSpeedButton then
  begin
    familia_antigo := medt_familia_origem.Text;
    familia_escolhido := ConsultaOnLineExSQL(
      'SELECT DISTINCT P.CD_FAMILIA_PROD AS CODIGO, P.NM_FAMILIA_PROD AS DESCRICAO '+
      ' FROM TFAMILIA_PROD P '+
      ' INNER JOIN TFAMILIA_DOCS D ON (D.CD_FAMILIA_PROD = P.CD_FAMILIA_PROD) ',
      'Família de Produtos',
      ['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil
    );
    if familia_escolhido = '' then
      familia_escolhido := familia_antigo;
    medt_familia_origem.Text := familia_escolhido;
    if familia_escolhido <> familia_antigo then
    begin
      medt_pais_origem.Text := '';
      medt_importador_origem.Text := '';
    end;
  end
  else
  begin
    edt_familia_origem.Text := ConsultaLookUPSQL(
      'SELECT NM_FAMILIA_PROD AS DESCRICAO '+
      ' FROM TFAMILIA_PROD '+
      ' WHERE CD_FAMILIA_PROD = '+ QuotedStr(medt_familia_origem.Text),
      'DESCRICAO');
    if  edt_familia_origem.Text <> '' Then
    begin
      medt_pais_origem.Enabled := True;
      btn_pais_origem.Enabled := True;
    end
    else
    begin
      medt_pais_origem.Enabled := False;
      btn_pais_origem.Enabled := False;
    end;
  end;
  //btn_ok_origem.SetFocus;
end;

procedure Tfrm_familia_prod.btnAreaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qry_familia_prod_) then exit;
    if (Sender as TSpeedButton).Enabled Then
      dbedtArea.Text := ConsultaOnLineEx('TAREA','Área',['CD_AREA','NM_AREA'],['Código','Descrição'],'CD_AREA',nil);
  end
  else
    edtArea.Text := ConsultaLookUP('TAREA','CD_AREA', dbedtArea.Text,'NM_AREA');
end;

end.

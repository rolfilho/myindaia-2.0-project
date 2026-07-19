unit PGSM064;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, DBCtrls, Mask, Buttons, Grids, DBGrids, ComCtrls, StdCtrls,
  ExtCtrls, DB, DBTables, variants, ToolEdit, RXDBCtrl, Funcoes, AppEvnts;

type
  Tfrm_amz = class(TForm)
    pgctrl_amz: TPageControl;
    ts_lista: TTabSheet;
    pnl_btn_amz: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    ts_dados_basicos: TTabSheet;
    pnl_amz: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_ativo: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    btn_co_setor: TSpeedButton;
    btn_co_recinto: TSpeedButton;
    btn_co_unidade: TSpeedButton;
    btn_co_urf: TSpeedButton;
    Label11: TLabel;
    dbedt_cd_amz: TDBEdit;
    dbedt_nm_amz: TDBEdit;
    dblkpcbox_ativo_amz: TDBLookupComboBox;
    dbedt_nm_sigla: TDBEdit;
    dbedt_cd_setor: TDBEdit;
    dbedt_cd_recinto: TDBEdit;
    dbedt_cd_urf: TDBEdit;
    dbedt_cd_unid_neg: TDBEdit;
    dblkpcbox_nm_setor: TEdit;
    dblkpcbox_nm_urf: TEdit;
    dblkpcbox_nm_recinto: TEdit;
    dblkpcbox_nm_unidade: TEdit;
    dblkpcbox_margem: TDBLookupComboBox;
    dblkpcbox_tp_taxa: TDBLookupComboBox;
    Panel2: TPanel;
    dbchkbox_estocagem: TDBCheckBox;
    dbchkbox_atracacao: TDBCheckBox;
    dbchkbox_descarga: TDBCheckBox;
    dbg_amz: TDBGrid;
    dbedt_nm_sigla_compl: TDBEdit;
    dbedt_nm_local_desp: TDBEdit;
    dbedt_cd_uf: TDBEdit;
    lbl_local_desp: TLabel;
    lbl_uf: TLabel;
    lbl_taxa: TLabel;
    dbedt_cd_taxa: TDBEdit;
    dbedt_nm_taxa: TEdit;
    btn_co_taxa: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    ts_tabela: TTabSheet;
    pgctrl_tab: TPageControl;
    ts_lista_tab: TTabSheet;
    Label12: TLabel;
    Label26: TLabel;
    DBGrid1: TDBGrid;
    dbedt_cd_amz2: TDBEdit;
    dbedt_nm_amz2: TDBEdit;
    ts_dados_basicos_tab: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    dbedt_nm_tab: TDBEdit;
    dbedt_cd_amz3: TDBEdit;
    dbedt_cd_tab: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    dbck_in_sabdom: TDBCheckBox;
    dbck_in_feriado: TDBCheckBox;
    dbedt_nm_amz3: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    ts_periodo: TTabSheet;
    Label22: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    dbedt_cd_amz4: TDBEdit;
    DBGrid2: TDBGrid;
    dbedt_cd_tab2: TDBEdit;
    dbedt_nm_amz4: TDBEdit;
    dbedt_nm_tab2: TDBEdit;
    Label34: TLabel;
    Label35: TLabel;
    btn_co_cidade: TSpeedButton;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    DBEdit1: TDBEdit;
    dbedt_cd_cidade: TDBEdit;
    dbedt_nm_cidade: TEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    dbedt_cnpj_amz: TDBEdit;
    PnlDados: TPanel;
    Nr_periodo: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    dbed_nr_periodo: TDBEdit;
    dbed_qt_dias: TDBEdit;
    dbed_percentual: TDBEdit;
    dbed_tx_adicional: TDBEdit;
    GroupBox1: TGroupBox;
    dbedt_dt_emissao_li: TDBDateEdit;
    Label31: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label33: TLabel;
    Label40: TLabel;
    BtnTpCntr: TSpeedButton;
    EditTpCntr: TDBEdit;
    EditNmTpCntr: TEdit;
    Label41: TLabel;
    DBEdit3: TDBEdit;
    ts_despesas: TTabSheet;
    pgctrl_despesas: TPageControl;
    ts_despesas_lista: TTabSheet;
    ts_despesas_config: TTabSheet;
    lbl1: TLabel;
    dbgrdDespesas: TDBGrid;
    dsDespesasBasicas: TDataSource;
    qryDespesasBasicas: TQuery;
    shp2: TShape;
    qryDespesasBasicasCD_ARMAZEM: TStringField;
    qryDespesasBasicasCD_ITEM: TStringField;
    qryDespesasBasicasCD_DESPESA_BASICA: TIntegerField;
    qryDespesasBasicasTX_VALOR_LIMITE: TStringField;
    qryDespesasBasicasCD_MARGEM: TStringField;
    qryDespesasBasicasQT_DIAS: TIntegerField;
    qryDespesasBasicasTX_TIPO_CALCULO: TStringField;
    qryDespesasBasicasVL_DESP_CIF: TStringField;
    qryDespesasBasicasVL_DESP_VALOR: TStringField;
    lbl4: TLabel;
    dbedtCdItem: TDBEdit;
    lbl6: TLabel;
    edt_valor_inicial: TEdit;
    lbl8: TLabel;
    dbedtQtdDias: TDBEdit;
    lbl10: TLabel;
    dbedtValorPrincipal: TDBEdit;
    lbl11: TLabel;
    dbedtCntr20: TDBEdit;
    lbl12: TLabel;
    dbedtCntr40: TDBEdit;
    qryDespesasBasicasTX_DESCRICAO_DESPESA: TStringField;
    qryDespesasBasicasTX_PERIODO: TStringField;
    lbl3: TLabel;
    dbedtDescDesp: TDBEdit;
    lbl5: TLabel;
    edt_periodo: TEdit;
    shp3: TShape;
    edtNmItem: TEdit;
    btnCoItem: TSpeedButton;
    dbrgrpMargem: TDBRadioGroup;
    dbrgrpCalculo: TDBRadioGroup;
    shp4: TShape;
    updDespesasBasicas: TUpdateSQL;
    qryDespesasBasicasNM_ITEM: TStringField;
    qryDespesasBasicasNM_MARGEM: TStringField;
    img2: TImage;
    img1: TImage;
    chk_emdiante: TCheckBox;
    shp5: TShape;
    edt_valor_final: TEdit;
    lbl7: TLabel;
    shp6: TShape;
    tsTabelas: TTabSheet;
    shp1: TShape;
    lbl2: TLabel;
    edtCdArmazem: TEdit;
    edtNmArmazem: TEdit;
    shp7: TShape;
    dbgrdTabelas: TDBGrid;
    dsTabelas: TDataSource;
    qryTabelas: TQuery;
    pnlDadosTabelas: TPanel;
    shp8: TShape;
    lbl9: TLabel;
    shp9: TShape;
    qryTabelasCD_ARMAZEM: TStringField;
    qryTabelasCD_TABELA: TIntegerField;
    qryTabelasDT_VALIDADE: TDateTimeField;
    lbl15: TLabel;
    dbedtDescTabela: TDBEdit;
    lbl16: TLabel;
    dbedtDtValidade: TDBEdit;
    qryTabelasTX_DESCRICAO_TABELA: TStringField;
    qryDespesasBasicasCD_TABELA: TIntegerField;
    dbrgrpCalcular: TDBRadioGroup;
    dbrgrpDespesa: TDBRadioGroup;
    qryDespesasBasicasIN_POR_DIA: TStringField;
    qryDespesasBasicasTP_REGISTRO: TStringField;
    qryTabelasIN_ATIVO: TStringField;
    pmAtivo: TPopupMenu;
    mi_ativar: TMenuItem;
    qryTabelascalcAtivo: TStringField;
    DesativarestaTabela1: TMenuItem;
    qryTabelasCD_USUARIO_ATIVACAO: TStringField;
    qryTabelascalcUsuario: TStringField;
    dbrgrpTpTamanho: TDBRadioGroup;
    qryDespesasBasicasTP_TAMANHO: TStringField;
    qryDespesasBasicasVL_PRINCIPAL: TFloatField;
    qryDespesasBasicasVL_MINIMO_20: TFloatField;
    qryDespesasBasicasVL_MINIMO_40: TFloatField;
    qryDespesasBasicasIN_MARGEM: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure btn_co_urfClick(Sender: TObject);
    procedure btn_co_recintoClick(Sender: TObject);
    procedure btn_co_setorClick(Sender: TObject);
    procedure btn_co_unidadeClick(Sender: TObject);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
    procedure dbedt_nm_amzChange(Sender: TObject);
    procedure pgctrl_amzChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_amzDblClick(Sender: TObject);
    procedure dbg_amzKeyPress(Sender: TObject; var Key: Char);
    procedure pgctrl_amzChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btn_co_taxaClick(Sender: TObject);
    procedure dbedt_cd_taxaExit(Sender: TObject);
    procedure dbedt_cd_urfExit(Sender: TObject);
    procedure dbedt_cd_recintoExit(Sender: TObject);
    procedure dbedt_cd_setorExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_urfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgctrl_tabChange(Sender: TObject);
    procedure BtnTpCntrClick(Sender: TObject);
    procedure btn_co_cidadeClick(Sender: TObject);
    procedure btnCoItemClick(Sender: TObject);
    procedure qryDespesasBasicasAfterPost(DataSet: TDataSet);
    procedure qryDespesasBasicasAfterDelete(DataSet: TDataSet);
    procedure qryDespesasBasicasAfterScroll(DataSet: TDataSet);
    procedure mi_ativarClick(Sender: TObject);
    procedure qryTabelasCalcFields(DataSet: TDataSet);
    procedure dbedtCdItemExit(Sender: TObject);
    procedure dbedtDtValidadeExit(Sender: TObject);
    procedure pgctrl_despesasChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure DesativarestaTabela1Click(Sender: TObject);
    procedure pgctrl_despesasChange(Sender: TObject);
    procedure img1Click(Sender: TObject);
    procedure edt_valor_inicialExit(Sender: TObject);
    procedure edt_valor_finalExit(Sender: TObject);
    procedure dbrgrpCalcularChange(Sender: TObject);
    procedure dbedtDescDespChange(Sender: TObject);
    procedure edt_periodoEnter(Sender: TObject);
    procedure edt_periodoExit(Sender: TObject);
    procedure dsDespesasBasicasDataChange(Sender: TObject; Field: TField);

  private
    a_str_indices : Array[0..2] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
//    lnm_amz, lcd_urf, lcd_unid_neg, lcd_recinto, lcd_setor : boolean;
//    lNaoConsiste : boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    function PodeDeletarTabela: Boolean;
    function LancaCdDespesa: integer;
    procedure DeletarDespesas;
    procedure CamposIN_POR_DIA;
    procedure Cancelar;
    procedure DeletarDespesaNosClientes;
    procedure InserirDespesaNosClientes;
    function UltimaDespesaBasica(pCdArmazem: string): Integer;

  public
    { Public declarations }
    str_armazem : String;
    lCons_OnLine, lCons_OnLine2 : Boolean;
    str_tx_armazenagem : String[1];
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto, vStrOld  : String;
    lDI_Armazem: Boolean;
    qry_di_CD_URF_DESPACHO : TStringField;
    qry_di_CD_URF_ENTR_CARGA : TStringField;
    qry_di_CD_SETOR_ARMAZENAM : TStringField;
    qry_di_CD_RECINTO_ALFAND : TStringField;
    tbl_Armazem_: TDataSet;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure VerificaCampoTaxa;
  end;

var
  frm_amz: Tfrm_amz;

implementation

uses GSMLIB,  PGSM063, PGGP001, PGSM096, PGGP017, PGSM018, PGSM081, PGSM083,
     PGSM148, PGDI018, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_amz.FormCreate(Sender: TObject);
begin
  { Cria o DataModule do Armazem }
  lDI_Armazem:= False;

  Application.CreateForm(Tdatm_amz, datm_amz );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  dbnvg.Enabled := True;
  edt_chave.Enabled := True;
  cb_ordem.Enabled := True;

  with datm_amz do
  begin
    qry_recinto_setores_importacao_.Close;
    qry_recinto_setores_importacao_.Prepare;
    qry_recinto_setores_importacao_.Open;
    tbl_yesno_.Open;
    qry_amz_.SQL[2] := 'NM_ARMAZEM';
    qry_amz_.Prepare;
    qry_amz_.Open;
    qry_arm_tabela_.Open;
    qry_arm_tab_periodo_.Open;


  end;

  a_str_indices[0] := 'CD_ARMAZEM';
  a_str_indices[1] := 'NM_ARMAZEM';
  a_str_indices[2] := 'NM_SIGLA';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    Items.Add('Sigla');
    ItemIndex := 1;
  end;
  vStr_cd_modulo:='22';
  str_cd_rotina:='2209';

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_amz.ds_amz.AutoEdit         := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;
end;

function Tfrm_amz.UltimaDespesaBasica(pCdArmazem : string) : Integer;
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT MAX(CD_DESPESA_BASICA) FROM TARMAZEM_DESPESAS_BASICAS');
    SQL.Add(' WHERE CD_ARMAZEM = ''' + pCdArmazem + '''');
    Open;
    Result := Fields[0].AsInteger;
    Close;
    Free;
  end;
end;

procedure Tfrm_amz.btn_incluirClick(Sender: TObject);
begin
   btn_incluir.Enabled  := False;
   mi_incluir.Enabled   := False;
   btn_excluir.Enabled  := False;
   mi_excluir.Enabled   := False;
   btn_salvar.Enabled   := True;
   mi_salvar.Enabled    := True;
   btn_cancelar.Enabled := True;
   mi_cancelar.Enabled  := True;
   with datm_amz do
   begin
     if (pgctrl_amz.ActivePage = ts_lista) or (pgctrl_amz.ActivePage = ts_dados_basicos) then
     begin
       pgctrl_amz.ActivePage:=ts_dados_basicos;
       qry_amz_.DisableControls;
       qry_amz_.Cancel;
       qry_amz_.Append;
       qry_amz_.EnableControls;
       qry_ult_amz_.Open;

       qry_amz_CD_ARMAZEM.AsString := UltCod( qry_ult_amz_, qry_ult_amz_ULTIMO );
       qry_amz_IN_ATIVO.AsString  := '1';
       qry_amz_IN_DESCARGA.AsString  := '0';
       qry_amz_IN_ESTOCAGEM.AsString  := '0';
       qry_amz_IN_ATRACACAO.AsString  := '0';
       qry_amz_IN_ATRACACAO.AsString  := '0';

       qry_amz_CD_MARGEM.AsString  := 'D';
       qry_amz_TP_TAXA.AsString  := '1';
       dbedt_nm_amz.SetFocus;
     end
     else if (pgctrl_amz.ActivePage = ts_despesas) then
     begin
       if pgctrl_despesas.ActivePage = tsTabelas then
       begin
         qryTabelas.Insert;
         qryTabelasCD_ARMAZEM.AsString := qry_amz_CD_ARMAZEM.AsString;
         qryTabelasCD_TABELA.AsInteger := StrToInt(ConsultaLookUp('TARMAZEM_TABELAS_BASICAS','CD_ARMAZEM',qry_amz_CD_ARMAZEM.AsString,'ISNULL(MAX(CD_TABELA),0)')) + 1;
         pnlDadosTabelas.Visible := True;
         dbedtDescTabela.SetFocus;
       end else begin
         if qryTabelasCD_TABELA.AsString = '' then
         begin
           Application.MessageBox('Não existe Armazém relacionado a esta despesa.'
             + #13#10 + 'Inclua Armazém antes de tentar incluir despesa!',
             'Erro ao incluir Despesa', MB_OK + MB_ICONSTOP);
           Exit;
         end else begin
           qryDespesasBasicas.Insert;
           dbrgrpMargem.Value := 'E';
           dbrgrpCalcular.Value := '0';
           dbrgrpDespesa.Value := 'CO';
           dbrgrpCalculo.Value := '%CIF';
           qryDespesasBasicasCD_ARMAZEM.AsString         := qry_amz_CD_ARMAZEM.AsString;
           qryDespesasBasicasCD_DESPESA_BASICA.AsInteger := UltimaDespesaBasica(qry_amz_CD_ARMAZEM.AsString) + 1;
           qryDespesasBasicasCD_TABELA.AsInteger         := qryTabelasCD_TABELA.AsInteger;
           pgctrl_despesas.ActivePage := ts_despesas_config;
           dbedtDescDesp.SetFocus;
         end;
       end;
     end
     else if (pgctrl_tab.ActivePage = ts_lista_tab) or (pgctrl_tab.ActivePage = ts_dados_basicos_tab) then
     begin
       pgctrl_tab.ActivePage:=ts_dados_basicos_tab;
       qry_arm_tabela_.DisableControls;
       qry_arm_tabela_.Cancel;
       qry_arm_tabela_.Append;
       qry_arm_tabela_.EnableControls;
       qry_ult_arm_tabela_.close;
       qry_ult_arm_tabela_.parambyname('CD_ARMAZEM').AsString := qry_amz_CD_ARMAZEM.AsString;
       qry_ult_arm_tabela_.Open;

       qry_arm_tabela_CD_ARMAZEM.AsString := qry_amz_CD_ARMAZEM.AsString;

       qry_padrao_tab_.close;
       qry_padrao_tab_.parambyname('CD_ARMAZEM').AsString := qry_amz_CD_ARMAZEM.AsString;
       qry_padrao_tab_.open;

       if qry_padrao_tab_.recordcount > 0 then
         qry_arm_tabela_IN_PADRAO.AsString  := '0'
       else
         qry_arm_tabela_IN_PADRAO.AsString  := '1';
       qry_padrao_tab_.close;

       qry_arm_tabela_IN_ATIVO.AsString    := '1';
       qry_arm_tabela_IN_SABDOM.AsString   := '0';
       qry_arm_tabela_IN_FERIADO.AsString  := '0';
       qry_arm_tabela_CD_TABELA.AsString  := strzero(strtoint(qry_ult_arm_tabela_ULTIMO.AsString)+ 1,3);
       qry_arm_tabela_DT_VIGENCIA_INI.AsDateTime := Date;


       qry_ult_arm_tabela_.Close;
       dbedt_nm_tab.SetFocus;
     end
     else if (pgctrl_tab.ActivePage = ts_periodo)then
     begin
       pgctrl_tab.ActivePage:=ts_periodo;
       qry_arm_tab_periodo_.DisableControls;
       qry_arm_tab_periodo_.Cancel;
       qry_arm_tab_periodo_.Append;
       qry_arm_tab_periodo_.EnableControls;

       qry_ult_arm_tab_periodo_.close;
       qry_ult_arm_tab_periodo_.parambyname('CD_ARMAZEM').AsString := qry_amz_CD_ARMAZEM.AsString;
       qry_ult_arm_tab_periodo_.parambyname('CD_TABELA').AsString := qry_arm_tabela_CD_TABELA.AsString;
       qry_ult_arm_tab_periodo_.Open;

       qry_arm_tab_periodo_CD_ARMAZEM.AsString := qry_amz_CD_ARMAZEM.AsString;
       qry_arm_tab_periodo_CD_TABELA.AsString := qry_arm_tabela_CD_TABELA.AsString;


       qry_arm_tab_periodo_NR_PERIODO.AsInteger  := qry_ult_arm_tab_periodo_ULTIMO.AsInteger + 1;

       qry_ult_arm_tab_periodo_.Close;

       PnlDados.Enabled := True;
       dbed_qt_dias.SetFocus;
     end;
   end;
end;

procedure Tfrm_amz.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_amz.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  VerificaCampoTaxa;
end;

procedure Tfrm_amz.Cancelar;
begin
  try
    if datm_amz.qry_amz_.State in [dsInsert, dsEdit] then
    begin
      datm_amz.qry_amz_.Cancel;
      pgctrl_amz.ActivePage := ts_dados_basicos;
      PnlDados.Enabled := Not(datm_amz.qry_arm_tab_periodo_.IsEmpty);
      dbedt_nm_amz.SetFocus;
    end;

    if ( qryDespesasBasicas.State in [dsInsert, dsEdit] ) then
    begin
      qryDespesasBasicas.Cancel;
      VerificaCamposTag(frm_amz, [ts_despesas_config]);
    end;

    if pgctrl_despesas.ActivePage = tsTabelas then
    begin
      if ( qryTabelas.State in [dsInsert, dsEdit] ) then
      begin
        qryTabelas.Cancel;
        VerificaCamposTag(frm_amz, [pnlDadosTabelas]);
        pnlDadosTabelas.Visible := False;
      end;
    end;

  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_amz.btn_excluirClick(Sender: TObject);
var
  cd_tabela : String;
begin
  if (pgctrl_amz.ActivePage = ts_lista) or (pgctrl_amz.ActivePage = ts_dados_basicos) then
  begin
    if BoxMensagem( 'Este armazém será excluído! Confirma exclusão?', 1 ) Then
    begin
      if datm_amz.qry_arm_tabela_.recordcount > 0 then
      begin
        BoxMensagem( 'Existe Tabela para esse armazém! Exclusão cancelada!', 2 );
        Exit;
      end
      else
      begin
        try
          datm_main.db_broker.StartTransaction;
          datm_amz.qry_amz_.Delete;
          datm_main.db_broker.Commit;
          pgctrl_amz.ActivePage:=ts_lista;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            datm_amz.qry_amz_.cancel;
            TrataErro(E);
          end;
        end;
      end;
    end;
  end
  else if (pgctrl_amz.ActivePage = ts_despesas) then
  begin
    if BoxMensagem( 'Deseja realmente excluir o registro ?', 1 ) Then
    begin
      try
        datm_main.db_broker.StartTransaction;
        if pgctrl_despesas.ActivePage = tsTabelas then begin
          if (qryTabelas.RecordCount > 0) and (Application.MessageBox('Deseja realmente excluir a Tabela?' + #13#10 + 'Isso apagará também as despesas relacionadas a ela!', 'Confirma Exclusão', MB_YESNO + MB_ICONQUESTION) = mrYes) then
          begin
            if PodeDeletarTabela then begin
              DeletarDespesas;
              qryTabelas.Delete;
            end;
          end;
        end else begin
          if (qryDespesasBasicas.RecordCount > 0) and (Application.MessageBox('Deseja realmente excluir esta despesa?' , 'Confirma Exclusão', MB_YESNO + MB_ICONQUESTION) = mrYes) then begin
            DeletarDespesaNosClientes;
            qryDespesasBasicas.Delete;
          end;
        end;

        datm_main.db_broker.Commit;
        pgctrl_amz.ActivePage:=ts_despesas;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          qryDespesasBasicas.cancel;
          TrataErro(E);
        end;
    end;
  end
  else if (pgctrl_tab.ActivePage = ts_lista_tab) or (pgctrl_tab.ActivePage = ts_dados_basicos_tab) then
  begin
    if BoxMensagem( 'Este Tabela do Armazém será excluída! Confirma exclusão?', 1 ) Then
    begin
      try
        datm_main.db_broker.StartTransaction;
        cd_tabela := datm_amz.qry_arm_tabela_CD_TABELA.AsString;
        datm_amz.qry_arm_tabela_.Delete;
        datm_amz.qry_delete_periodos_.parambyname('CD_ARMAZEM').AsString := datm_amz.qry_amz_CD_ARMAZEM.AsString;
        datm_amz.qry_delete_periodos_.parambyname('CD_TABELA').AsString := cd_tabela;
        datm_amz.qry_delete_periodos_.ExecSql;
        datm_main.db_broker.Commit;
        pgctrl_tab.ActivePage:=ts_lista_tab;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          datm_amz.qry_arm_tabela_.cancel;
          TrataErro(E);
        end;
      end;
    end;
  end
  else if (pgctrl_tab.ActivePage = ts_periodo) then
  begin
    if BoxMensagem( 'Este Período da Tabela do Armazém será excluída! Confirma exclusão?', 1 ) Then
    begin
      try
        datm_main.db_broker.StartTransaction;
        datm_amz.qry_arm_tab_periodo_.Delete;
        datm_main.db_broker.Commit;
        pgctrl_tab.ActivePage:=ts_periodo;
        PnlDados.Enabled := Not(datm_amz.qry_arm_tab_periodo_.IsEmpty)
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          datm_amz.qry_arm_tab_periodo_.cancel;
          TrataErro(E);
        end;
      end;
    end;
  end;
end;
end;

procedure Tfrm_amz.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_amz.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_amz.qry_amz_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_amz.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_amz.qry_amz_CD_ARMAZEM.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_amz.qry_amz_.Close;
  datm_amz.qry_amz_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_amz.qry_amz_.Prepare;
  datm_amz.qry_amz_.Open;
  Localiza(datm_amz.qry_amz_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_amz.btn_co_urfClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    If Not PoeEmEdicao(datm_amz.qry_amz_) Then exit;
      datm_amz.qry_amz_CD_URF.AsString := ConsultaOnLineEx('TURF','Unidade da Receita Federal',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_urf)
  End
  Else
    dblkpcbox_nm_urf.Text := ConsultaLookUP('TURF','CODIGO',dbedt_cd_urf.Text,'DESCRICAO');
end;

procedure Tfrm_amz.btn_co_recintoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_amz.qry_amz_) Then
      Exit;
    if dbedt_cd_urf.text <> '' then
      datm_amz.qry_amz_CD_RECINTO.AsString := ConsultaOnLineExSQL('SELECT * FROM TREC_ALFANDEGADO WHERE COD_ORGAO_REC = "' + datm_amz.qry_amz_CD_URF.AsString + '"',
                                                                  'Recinto Alfandegado', ['CODIGO', 'DESCRICAO'], ['Código', 'Descrição'], 'CODIGO', nil)
    Else
      BoxMensagem( 'URF de Despacho não informada.', 3 );
  end
  else
    dblkpcbox_nm_recinto.Text := ConsultaLookUPSQL('SELECT * FROM TREC_ALFANDEGADO WHERE CODIGO = "' + dbedt_cd_recinto.Text + '"','DESCRICAO');
end;

procedure Tfrm_amz.btn_co_setorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_amz.qry_amz_) Then
      Exit;
    datm_amz.qry_amz_CD_SETOR.AsString := ConsultaOnLineExSQL('SELECT * FROM TRECINTO_SETORES_IMPORTACAO WHERE ORGAO = "' + datm_amz.qry_amz_CD_URF.AsString + '" and RECINTO = "' + datm_amz.qry_amz_CD_RECINTO.AsString + '"',
                                                                'Recinto x Setores de Importação', ['SETOR', 'NOME'], ['Setor', 'Nome'], 'SETOR', nil);
  end
  else
    dblkpcbox_nm_setor.Text := ConsultaLookUPSQL('SELECT * FROM TRECINTO_SETORES_IMPORTACAO WHERE ORGAO = "' + datm_amz.qry_amz_CD_URF.AsString + '" and RECINTO = "' + datm_amz.qry_amz_CD_RECINTO.AsString + '" and SETOR = "' + dbedt_cd_setor.Text + '"','NOME');
end;

procedure Tfrm_amz.btn_co_unidadeClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    If Not PoeEmEdicao(datm_amz.qry_amz_) Then exit;
      datm_amz.qry_amz_CD_UNID_NEG.AsString := ConsultaOnLineEx('TUNID_NEG','Unidades',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg)
  End
  Else
    dblkpcbox_nm_unidade.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',dbedt_cd_unid_neg.Text,'NM_UNID_NEG');
end;

procedure Tfrm_amz.dbedt_cd_unid_negExit(Sender: TObject);
begin
  Consiste;
end;

function Tfrm_amz.Consiste;
begin

  Consiste := True;

  if dbedt_nm_amz.Text = '' then
  begin
    BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
    dbedt_nm_amz.SetFocus;
    Consiste := False;
    exit;
  end;

  if dbedt_cd_unid_neg.Text <> '' then
  begin
    if ( datm_amz.qry_amz_.State in [dsInsert,dsEdit] ) then ValidCodigo( dbedt_cd_unid_neg );
    if dblkpcbox_nm_unidade.Text = '' then
    begin
      BoxMensagem('Campo ''Cód. Unidade'' inválido!', 2);
      dbedt_cd_unid_neg.SetFocus;
      Consiste := False;
      Exit;
    end;                                  
  end;

  if ( datm_amz.qry_amz_.State in [dsInsert,dsEdit] ) then
  begin
    if dbedt_cd_urf.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_urf );
    end;

    if dbedt_cd_recinto.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_recinto );
    end;

    if dbedt_cd_setor.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_setor );
    end;
  end;

{--- verificação de Campos Obrigatórios (Tabelas) -----------------------------}
  if pgctrl_amz.ActivePage = ts_despesas then begin
    Case pgctrl_despesas.ActivePageIndex of
      0: if not VerificaCamposTag(frm_amz, [pnlDadosTabelas]) then Consiste := False;
      2: if not VerificaCamposTag(frm_amz, [ts_despesas_config]) then Consiste := False;
    end;
  end;
end;

procedure Tfrm_amz.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

function Tfrm_amz.Grava;
var
   Pesquisa, Pesquisa2, Pesquisa3 : string;
begin
  Grava:= false;
  if pgctrl_amz.ActivePage =  ts_dados_basicos then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_amz.qry_amz_.State in [dsInsert, dsEdit] ) then
      begin
        pesquisa:=dbedt_cd_amz.Text;
        datm_amz.qry_amz_.Post;
        datm_amz.qry_amz_.Close;
        datm_amz.qry_amz_.Open;
        datm_amz.qry_amz_.Locate('CD_ARMAZEM', Pesquisa, [loCaseInsensitive]);
      end;
      datm_main.db_broker.Commit;
      Grava:=True;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_amz.qry_amz_.cancel;
        Grava:=False;
        TrataErro(E);
      end;
    end;
  end
  else if pgctrl_amz.ActivePage = ts_despesas then
  begin
    try
      datm_main.db_broker.StartTransaction;

      if pgctrl_despesas.ActivePage = tsTabelas then
      begin
        qryTabelas.Post;
        pnlDadosTabelas.Visible := False;
        qryTabelas.Close;
        qryTabelas.Open;
      end else begin
        if ( qryDespesasBasicas.State in [dsInsert, dsEdit] ) then
        begin
          if chk_emdiante.Checked then
            qryDespesasBasicasTX_PERIODO.AsString := edt_periodo.Text + '...'
          else qryDespesasBasicasTX_PERIODO.AsString := edt_periodo.Text;
          if Trim(edt_valor_inicial.Text) = '' then edt_valor_inicial.Text := '...';
          if Trim(edt_valor_final.Text)   = '' then edt_valor_final.Text   := '...';
          qryDespesasBasicasTX_VALOR_LIMITE.AsString := edt_valor_inicial.Text + '/' + edt_valor_final.Text;
          if qryDespesasBasicas.State in [dsInsert] then qryDespesasBasicasCD_DESPESA_BASICA.AsInteger := LancaCdDespesa;
          qryDespesasBasicasIN_POR_DIA.AsString := dbrgrpCalcular.Value;
          qryDespesasBasicasTP_REGISTRO.AsString := dbrgrpDespesa.Value;
          qryDespesasBasicasTX_TIPO_CALCULO.AsString := dbrgrpCalculo.Value;
          if qryDespesasBasicas.State = dsInsert then begin
            qryDespesasBasicas.Post;
            InserirDespesaNosClientes;
          end else
            qryDespesasBasicas.Post;
          qryDespesasBasicas.Close;
          qryDespesasBasicas.Open;
          pgctrl_despesas.ActivePage := ts_despesas_lista;
        end;
      end;

      datm_main.db_broker.Commit;
      Grava:=True;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        qryDespesasBasicas.cancel;
        Grava:=False;
        TrataErro(E);
      end;
    end;
  end
  else if pgctrl_tab.ActivePage =  ts_dados_basicos_tab then
  Begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_amz.qry_arm_tabela_.State in [dsInsert, dsEdit] ) then
      begin
        pesquisa:=dbedt_cd_amz2.Text;
        pesquisa2:= dbedt_cd_tab.Text;
        datm_amz.qry_padrao_tab_.close;
        datm_amz.qry_padrao_tab_.parambyname('CD_ARMAZEM').AsString := datm_amz.qry_amz_CD_ARMAZEM.AsString;
        datm_amz.qry_padrao_tab_.open;

        if datm_amz.qry_padrao_tab_.recordcount > 0 then
          datm_amz.qry_arm_tabela_IN_PADRAO.AsString  := '0'
        else
          datm_amz.qry_arm_tabela_IN_PADRAO.AsString  := '1';
        datm_amz.qry_padrao_tab_.close;


        datm_amz.qry_arm_tabela_.Post;
        datm_amz.qry_arm_tabela_.Close;
        datm_amz.qry_arm_tabela_.Open;
        datm_amz.qry_arm_tabela_.Locate('CD_ARMAZEM;CD_TABELA', VarArrayOf ([pesquisa, pesquisa2]) , [loCaseInsensitive]);

      end;
      datm_main.db_broker.Commit;
      Grava:=True;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_amz.qry_arm_tabela_.cancel;
        Grava:=False;
        TrataErro(E);
      end;
    end;
  end
  else if pgctrl_tab.ActivePage =  ts_periodo then
  Begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_amz.qry_arm_tab_periodo_.State in [dsInsert, dsEdit] ) then
      begin
        pesquisa:=  dbedt_cd_amz3.Text;
        pesquisa2:= dbedt_cd_tab2.Text;
        pesquisa3:= dbed_nr_periodo.text;


        datm_amz.qry_arm_tab_periodo_.Post;
        datm_amz.qry_arm_tab_periodo_.Close;
        datm_amz.qry_arm_tab_periodo_.Open;
        datm_amz.qry_arm_tab_periodo_.Locate('CD_ARMAZEM;CD_TABELA;NR_PERIODO', VarArrayOf ([pesquisa, pesquisa2,pesquisa3]) , [loCaseInsensitive]);

      end;
      datm_main.db_broker.Commit;
      Grava:=True;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_amz.qry_arm_tab_periodo_.cancel;
        Grava:=False;
        TrataErro(E);
      end;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
{  try
    datm_main.db_broker.StartTransaction;
    if ( datm_amz.qry_amz_.State in [dsInsert, dsEdit] ) then
    begin
      pesquisa:=dbedt_cd_amz.Text;
      datm_amz.qry_amz_.Post;
      datm_amz.qry_amz_.Close;
      datm_amz.qry_amz_.Open;
      datm_amz.qry_amz_.Locate('CD_ARMAZEM', Pesquisa, [loCaseInsensitive]);

    end;
    datm_main.db_broker.Commit;
    Grava:=True;
  except
    on E: Exception do
    begin
      datm_amz.qry_amz_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );}
end;

procedure Tfrm_amz.dbedt_nm_amzChange(Sender: TObject);
begin
  VerificaCampoTaxa;
end;

procedure Tfrm_amz.pgctrl_amzChange(Sender: TObject);
begin
  edt_chave.Enabled := (pgctrl_amz.ActivePage = ts_lista );
  cb_ordem.Enabled  := (pgctrl_amz.ActivePage = ts_lista );

  if (pgctrl_amz.ActivePage = ts_despesas)    then
  begin
    edtCdArmazem.Text := datm_amz.qry_amz_CD_ARMAZEM.AsString;
    edtNmArmazem.Text := datm_amz.qry_amz_NM_ARMAZEM.AsString;
    qryTabelas.Open;
    qryDespesasBasicas.Open;
    pgctrl_despesas.ActivePageIndex := 0;
    dbnvg.DataSource := dsTabelas;
  end;

  if (pgctrl_amz.ActivePage = ts_lista) or (pgctrl_amz.ActivePage = ts_dados_basicos)   then
    dbnvg.DataSource := datm_amz.ds_amz
  else if (pgctrl_tab.ActivePage = ts_lista_tab) or (pgctrl_tab.ActivePage = ts_dados_basicos_tab)   then
    dbnvg.DataSource := datm_amz.ds_arm_tabela
  else if (pgctrl_tab.ActivePage = ts_periodo)    then
    dbnvg.DataSource := datm_amz.ds_arm_tab_periodo

end;

procedure Tfrm_amz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_amz.qry_amz_.Close;
  datm_amz.qry_arm_tabela_.Close;
  datm_amz.qry_arm_tab_periodo_.Close;
  datm_amz.tbl_yesno_.Close;
  datm_amz.free;
  Action := caFree;
end;

procedure Tfrm_amz.dbg_amzDblClick(Sender: TObject);
begin
  If lDI_Armazem then
    try
      If Not ( qry_di_CD_URF_DESPACHO.DataSet.State in [dsEdit, dsInsert] )
      Then qry_di_CD_URF_DESPACHO.DataSet.Edit;
      qry_di_CD_URF_DESPACHO.AsString := datm_amz.qry_amz_CD_URF.AsString;
      qry_di_CD_SETOR_ARMAZENAM.AsString := datm_amz.qry_amz_CD_SETOR.AsString;
      qry_di_CD_RECINTO_ALFAND.AsString := datm_amz.qry_amz_CD_RECINTO.AsString;
      If qry_di_CD_URF_ENTR_CARGA.AsString = '' Then
         qry_di_CD_URF_ENTR_CARGA.AsString := datm_amz.qry_amz_CD_URF.AsString;

      if datm_amz.qry_amz_NM_SIGLA.AsString <> '' then
        with tbl_Armazem_ do
        begin
          BeforeDelete:= nil;
          while RecordCount > 0
          do Delete;
          BeforeDelete:= datm_DI_Capa.qry_di_BeforeDelete;
          Insert;
          FieldByName('NR_PROCESSO').AsString:= str_nr_processo;
          FieldByName('NM_ARMAZEM_CARGA').AsString:= datm_amz.qry_amz_NM_SIGLA.AsString;
          Post;
        end;
      Close;
      exit;
    except
      {.}
    end;

  If lCons_OnLine Then
  begin
    try
      if Not (TTable(Cons_OnLine.DataSet).State in [dsEdit, dsInsert]) then
         TTable(Cons_OnLine.DataSet).Edit;
      Cons_OnLine.AsString := datm_amz.qry_amz_CD_ARMAZEM.AsString;
    except
      try
        Cons_Online_Texto := datm_amz.qry_amz_CD_ARMAZEM.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do Armazém !', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_amz.dbg_amzKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_amzDblClick(Sender);
end;

procedure Tfrm_amz.pgctrl_amzChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_amz.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_amz.qry_amz_.State in [dsEdit] ) and st_modificar ) or
     ( datm_amz.qry_amz_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Armazém foi alterado.' + #13#10 +
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


procedure Tfrm_amz.btn_co_taxaClick(Sender: TObject);
begin
   if dblkpcbox_tp_taxa.Text='ARMAZÉM' then
   begin
      if Sender is TSpeedButton then
      Begin
        If Not PoeEmEdicao(datm_amz.qry_amz_) Then exit;
          datm_amz.qry_amz_CD_TAXA.AsString := ConsultaOnLineEx('TTAXA_ARMAZENAGEM','Taxas',['CD_TAXA','NM_DESCRICAO'],['Código','Descrição'],'CD_TAXA',frm_main.mi_tx_amz)
      End
      Else
        dbedt_nm_taxa.Text := ConsultaLookUP('TTAXA_ARMAZENAGEM','CD_TAXA',dbedt_cd_taxa.Text,'NM_DESCRICAO');
   end;

   if dblkpcbox_tp_taxa.Text='TRA' then
   begin
     if Sender is TSpeedButton then
     Begin
       If Not PoeEmEdicao(datm_amz.qry_amz_) Then exit;
         datm_amz.qry_amz_CD_TAXA.AsString := ConsultaOnLineEx('TTAXA_TRA','Taxas',['CD_TAXA_TRA','NM_DESCRICAO'],['Código','Descrição'],'CD_TAXA_TRA',frm_main.mi_tx_tra)
     End
     Else
       dbedt_nm_taxa.Text := ConsultaLookUP('TTAXA_TRA','CD_TAXA_TRA',dbedt_cd_taxa.Text,'NM_DESCRICAO');
   end;
end;

procedure Tfrm_amz.dbedt_cd_taxaExit(Sender: TObject);
begin
  if not ( datm_amz.qry_amz_.State in [dsEdit] )
         and ( st_modificar ) then datm_amz.qry_amz_.Edit
  else
  if not ( datm_amz.qry_amz_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_taxa );
  if dbedt_cd_taxa.Text <> '' then
  begin
    if dbedt_nm_taxa.Text = '' then
    begin
      BoxMensagem('Código de taxa inválido!',2);
      dbedt_cd_taxa.SetFocus;
    end;
  end;

end;

procedure Tfrm_amz.dbedt_cd_urfExit(Sender: TObject);
begin
  Consiste;
  if ( (length( dbedt_cd_urf.text ) <> 0) and ( dbedt_cd_urf.Text <> '0000000' )) and ( length( dblkpcbox_nm_urf.text ) = 0 ) then
  begin
    BoxMensagem ('Código de URF inválido.',2);
    dbedt_cd_urf.SetFocus;
  end;
end;

procedure Tfrm_amz.dbedt_cd_recintoExit(Sender: TObject);
begin
  Consiste;
  if ( (length( dbedt_cd_recinto.text ) <> 0) and ( dbedt_cd_recinto.Text <> '0000' )) and ( length( dblkpcbox_nm_recinto.text ) = 0 ) then
  begin
    BoxMensagem ('Código de recinto inválido.',2);
    dbedt_cd_recinto.SetFocus;
  end;
end;

procedure Tfrm_amz.dbedt_cd_setorExit(Sender: TObject);
begin
  Consiste;
  if ( (length( dbedt_cd_setor.text ) <> 0) and ( dbedt_cd_setor.Text <> '000' )) and ( length( dblkpcbox_nm_setor.text ) = 0 ) then
  begin
    BoxMensagem ('Código de setor inválido.',2);
    dbedt_cd_setor.SetFocus;
  end;
end;

procedure Tfrm_amz.VerificaCampoTaxa;
begin
   if (dblkpcbox_tp_taxa.Text='ARMAZÉM') or (dblkpcbox_tp_taxa.Text='TRA') then
   begin
      {dbedt_cd_taxa.Visible:=True;
      dbedt_nm_taxa.Visible:=True;
      btn_co_taxa.Visible:=True;
      lbl_taxa.Visible:=True;
      if dblkpcbox_tp_taxa.Text='ARMAZÉM' then
         dbedt_nm_taxa.DataField:='look_nm_tx_amg';
      if dblkpcbox_tp_taxa.Text='TRA' then
         dbedt_nm_taxa.DataField:='look_nm_tx_tra';
      }
   end
   else
   begin
      dbedt_cd_taxa.Visible:=False;
      dbedt_nm_taxa.Visible:=False;
      btn_co_taxa.Visible:=False;
      lbl_taxa.Visible:=False;
   end;
end;

procedure Tfrm_amz.FormShow(Sender: TObject);
begin
  pnl_btn_amz.Color := clMenuBroker;
  shp3.Brush.Color  := clMenuBroker;
  shp4.Brush.Color  := clPnlClaroBroker;
  dbrgrpMargem.Color     := clPnlClaroBroker;
  dbrgrpCalcular.Color     := clPnlClaroBroker;
  dbrgrpDespesa.Color     := clPnlClaroBroker;
  dbrgrpTpTamanho.Color := clPnlClaroBroker;

  pgctrl_amz.ActivePage:=ts_lista;
  if (lCons_OnLine) and (str_tx_armazenagem = '4') then
  begin
    datm_amz.qry_amz_.Close;
    datm_amz.qry_amz_.sql[2] := ('WHERE TP_TAXA = "4" ');
    datm_amz.qry_amz_.Open;
  end;
  if lCons_OnLine2 then
  begin
     if str_armazem <> '' then
        datm_amz.qry_amz_.locate('CD_ARMAZEM', str_armazem, [loCaseInsensitive] );
     pgctrl_amz.ActivePage := ts_tabela;
  end
  else
  begin
    pgctrl_amz.ActivePage:=ts_lista;
    edt_chave.SetFocus;
  end;
end;

procedure Tfrm_amz.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_amz.dbedt_cd_urfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = dbedt_cd_urf      then btn_co_urfClick(btn_co_urf);
    if Sender = dbedt_cd_recinto  then btn_co_recintoClick(btn_co_recinto);
    if Sender = dbedt_cd_setor    then btn_co_setorClick(btn_co_setor);
    if Sender = dbedt_cd_unid_neg then btn_co_unidadeClick(btn_co_unidade);
    if Sender = dbedt_cd_taxa     then btn_co_taxaClick(btn_co_taxa);
    if Sender = dbedt_cd_cidade   then btn_co_cidadeClick(btn_co_cidade);
    if Sender = EditTpCntr        then BtnTpCntrClick(BtnTpCntr);
    if Sender = dbedtCdItem       then btnCoItemClick(btnCoItem);
  end;
end;

procedure Tfrm_amz.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_amzDblClick(nil);
end;

procedure Tfrm_amz.pgctrl_tabChange(Sender: TObject);
begin
  if (pgctrl_tab.ActivePage = ts_lista_tab) or (pgctrl_tab.ActivePage = ts_dados_basicos_tab)   then
    dbnvg.DataSource := datm_amz.ds_arm_tabela;
  if (pgctrl_tab.ActivePage = ts_periodo) then
  Begin
    dbnvg.DataSource := datm_amz.ds_arm_tab_periodo;
    PnlDados.Enabled := Not(datm_amz.qry_arm_tab_periodo_.IsEmpty);
  End;
end;

procedure Tfrm_amz.BtnTpCntrClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    If Not PoeEmEdicao(datm_amz.qry_arm_tabela_) Then exit;
      datm_amz.qry_arm_tabela_TP_CNTR.AsString := ConsultaOnLineEx('TTP_CNTR','Contaniers',['TP_CNTR','NM_TP_CNTR'],['Código','Descrição'],'TP_CNTR',nil);//frm_main.mi_cad_conteiners);
  End Else
    EditNmTpCntr.Text := ConsultaLookUP('TTP_CNTR','TP_CNTR',EditTpCntr.Text,'NM_TP_CNTR');
end;

procedure Tfrm_amz.btn_co_cidadeClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    If Not PoeEmEdicao(datm_amz.qry_amz_) Then exit;
      datm_amz.qry_amz_CD_CIDADE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local de Embarque',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_local_emb)
  End
  Else
    dbedt_nm_cidade.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_cidade.Text,'DESCRICAO');
end;

procedure Tfrm_amz.btnCoItemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(qryDespesasBasicas) Then exit;
      qryDespesasBasicasCD_ITEM.AsString := ConsultaOnLineEx('TITEM','Itens',['CD_ITEM','NM_ITEM'],['Código','Descrição'],'CD_ITEM',nil)
  end
  else
    edtNmItem.Text := ConsultaLookUP('TITEM','CD_ITEM',qryDespesasBasicasCD_ITEM.AsString,'NM_ITEM');
end;

procedure Tfrm_amz.qryDespesasBasicasAfterPost(DataSet: TDataSet);
begin
  qryDespesasBasicas.ApplyUpdates;
end;

procedure Tfrm_amz.qryDespesasBasicasAfterDelete(DataSet: TDataSet);
begin
  qryDespesasBasicas.ApplyUpdates;
end;

procedure Tfrm_amz.qryDespesasBasicasAfterScroll(DataSet: TDataSet);
begin
  CamposIN_POR_DIA;

  edt_periodo.Text       := Copy(qryDespesasBasicasTX_PERIODO.AsString,1,1);
  chk_emdiante.Checked   := ( Pos('...',qryDespesasBasicasTX_PERIODO.AsString) > 0 );
  edt_valor_inicial.Text := Trim(Copy(qryDespesasBasicasTX_VALOR_LIMITE.AsString,0,Pos('/',qryDespesasBasicasTX_VALOR_LIMITE.AsString)-1));
  edt_valor_final.Text   := Trim(Copy(qryDespesasBasicasTX_VALOR_LIMITE.AsString,Pos('/',qryDespesasBasicasTX_VALOR_LIMITE.AsString)+1,Length(qryDespesasBasicasTX_VALOR_LIMITE.AsString)));
end;

procedure Tfrm_amz.mi_ativarClick(Sender: TObject);
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('UPDATE TARMAZEM_TABELAS_BASICAS SET IN_ATIVO = ''1'', CD_USUARIO_ATIVACAO = ''' + str_cd_usuario + ''' ');
    SQL.Add(' WHERE CD_TABELA = ''' + qryTabelasCD_TABELA.AsString + ''' AND CD_ARMAZEM = ''' +  Trim(edtCdArmazem.Text) + ''' ');
    try
      ExecSQL;
    except
      Application.MessageBox('Erro ao ativar Tabela', 'Erro - Atualização', MB_OK + MB_ICONERROR);
      Exit;
    end;
    Free;
  end;

  qryTabelas.Close;
  qryTabelas.Prepare;
  qryTabelas.Open;

end;

procedure Tfrm_amz.qryTabelasCalcFields(DataSet: TDataSet);
begin
  if qryTabelasIN_ATIVO.AsString = '1' then
    qryTabelascalcAtivo.AsString := 'ü'
  else
    qryTabelascalcAtivo.AsString := '';

  qryTabelascalcUsuario.AsString := ConsultaLookUp('TUSUARIO', 'CD_USUARIO', qryTabelasCD_USUARIO_ATIVACAO.AsString , 'NM_USUARIO');  
end;

procedure Tfrm_amz.dbedtCdItemExit(Sender: TObject);
begin
  dbedtCdItem.Text := Copy('000', 1, 3 - Length(dbedtCdItem.text)) + dbedtCdItem.text;
  edtNmItem.Text := ConsultaLookUP('TITEM', 'CD_ITEM', dbedtCdItem.Text, 'NM_ITEM');
end;

procedure Tfrm_amz.dbedtDtValidadeExit(Sender: TObject);
begin
  try
    StrToDate(dbedtDtValidade.Text);
  except
    Application.MessageBox('Data Inválida!', 'Erro - Conversão', MB_OK + MB_ICONSTOP);
    dbedtDtValidade.Clear;
    dbedtDtValidade.SetFocus;
  end;
end;

procedure Tfrm_amz.pgctrl_despesasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := ((qryDespesasBasicas.State in [dsBrowse, dsInactive]) and
                  (qryTabelas.State in [dsBrowse, dsInactive]));

  if not AllowChange then
  begin
    btn_mi(false, True, true, false);
    if qryTabelas.State in [dsInsert, dsEdit] then
      if Application.MessageBox('O Cadastro de Tabelas foi alterado!' + #13#10 +'Deseja Salvar as alterações??', 'Modificação', MB_YESNO + MB_ICONQUESTION) = IDYES  then
         btn_salvarClick(btn_salvar)
      else
         btn_cancelarClick(btn_cancelar);
    if qryDespesasBasicas.State in [dsInsert, dsEdit] then
      if Application.MessageBox('O Cadastro de Tabelas foi alterado!' + #13#10 +'Deseja Salvar as alterações??', 'Modificação', MB_YESNO + MB_ICONQUESTION) = IDYES  then
         btn_salvarClick(btn_salvar)
      else
         btn_cancelarClick(btn_cancelar);
  end
  else
    btn_mi(true, false, false, true);



end;

function TFrm_amz.PodeDeletarTabela: Boolean;
begin
  with TQuery.Create(application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.CLear;
    SQL.Add('SELECT COUNT(CD_TABELA_ORIGEM) FROM TARMAZEM_TABELAS_CLIENTE (NOLOCK) ');
    SQL.Add(' WHERE CD_TABELA_ORIGEM = ''' + qryTabelasCD_TABELA.AsString + ''' ');
    Prepare;
    Open;
    if Fields[0].AsInteger = 0 then
    begin
      if ConsultaLookUp('TARMAZEM_TABELAS_BASICAS', 'CD_TABELA', qryTabelasCD_TABELA.AsString, 'IN_ATIVO') = '1' then
      begin
        Application.MessageBox('Esta Tabela está ativa! ' + #13#10 +  'Desative-a antes de excluir...', 'Exclusão de Tabelas', MB_OK +  MB_ICONSTOP);
        Result := False;
      end else
        Result := true;
    end else begin
      Application.MessageBox(Pchar('Esta Tabela não pode ser excluída pois ' + chr(13) + 'já existe cliente utilizando-a!'), 'Exclusão de Tabelas', 0);
      Result := False;
    end;

    Free;
  end;

end;

procedure Tfrm_amz.DesativarestaTabela1Click(Sender: TObject);
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('UPDATE TARMAZEM_TABELAS_BASICAS SET IN_ATIVO = ''0'', CD_USUARIO_ATIVACAO = ''' + str_cd_usuario + ''' ');
    SQL.Add(' WHERE CD_TABELA = ''' + qryTabelasCD_TABELA.AsString + ''' AND CD_ARMAZEM = ''' +  Trim(edtCdArmazem.Text) + ''' ');
    try
      ExecSQL;
    except
      Application.MessageBox('Erro ao ativar Tabela', 'Erro - Atualização', MB_OK + MB_ICONERROR);
      Exit;
    end;
    Free;
  end;

  qryTabelas.Close;
  qryTabelas.Prepare;
  qryTabelas.Open;

end;

procedure TFrm_amz.DeletarDespesas;
begin
  with TQuery.Create(application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.CLear;
    SQL.Add('DELETE FROM TARMAZEM_DESPESAS_BASICAS');
    SQL.Add('WHERE CD_ARMAZEM = ''' + qryTabelasCD_ARMAZEM.AsString + ''' AND ');
    SQL.Add('      CD_TABELA  = ''' + qryTabelasCD_TABELA.AsString + ''' ');
    try
      ExecSQL;
    except
      Application.MessageBox('Erro ao excluir despesas relacionadas a essa tabela', 'Exclusão de Despesas', MB_OK + MB_ICONSTOP);
    end;
    Free;
  end;

end;


procedure Tfrm_amz.pgctrl_despesasChange(Sender: TObject);
begin
 case pgctrl_despesas.ActivePageIndex of
     0: dbnvg.DataSource := dsTabelas;
   1,2: dbnvg.DataSource := dsDespesasBasicas;
  end;

end;

procedure TFrm_amz.CamposIN_POR_DIA;
begin
  if dbrgrpCalcular.ItemIndex = 1 then
  begin
    edt_periodo.Enabled := False;
    edt_periodo.Text := '1';

    edt_periodo.Tag := 0;
    chk_emdiante.Enabled := false;
    chk_emdiante.Checked := false;
    edt_valor_inicial.Enabled := False;
    edt_valor_inicial.Clear;
    edt_valor_final.Enabled := False;
    edt_valor_final.Clear;
    dbedtQtdDias.Enabled := false;
    dbedtQtdDias.Tag := 0;
  end else begin
    edt_periodo.Enabled := true;
    edt_periodo.Tag := 666;
    chk_emdiante.Enabled := true;
    edt_valor_inicial.Enabled := true;
    edt_valor_final.Enabled := True;
    dbedtQtdDias.Enabled := true;
    dbedtQtdDias.Tag := 666;
  end;
end;

procedure Tfrm_amz.img1Click(Sender: TObject);
var Mem: TMemo;
    Invisivel: boolean;
begin
  Mem := TMemo.Create(Application);
  Mem.Color := clInfoBk;
  Mem.Text  := 'Nesse campo é colocado o período para esses valores.' + #13#10 +
               'Caso você queira colocar esses valor para o período 1, 2 ou 3 em diante,' + #13#10 +
               'basta clicar em " em diante ".'   ;
  Mem.Height := 75;
  Mem.Width  := 275;
  Mem.Top    := img1.Top + 20;
  Mem.Left   := img1.Left + 20;
  Mem.Ctl3d := False;

  if not Invisivel then
  begin
    Mem.Visible := false;
    Mem.Free;
    Invisivel := False;
  end else begin
    Mem.Visible := True;
    Invisivel := true;
  end;
end;

procedure Tfrm_amz.edt_valor_inicialExit(Sender: TObject);
begin
 edt_valor_inicial.Text := TiraPonto(TiraVirg(edt_valor_inicial.Text));
 edt_periodoExit(edt_valor_inicial);
end;

procedure Tfrm_amz.edt_valor_finalExit(Sender: TObject);
begin
  edt_valor_final.Text := TiraPonto(TiraVirg(edt_valor_final.Text));
  edt_periodoExit(edt_valor_final);
end;

function TFrm_amz.LancaCdDespesa: integer;
var vMaximo: Integer;
begin
  with TQuery.Create(application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.CLear;
    SQL.Add('SELECT ISNULL(MAX(CD_DESPESA_BASICA), 0) FROM TARMAZEM_DESPESAS_BASICAS (NOLOCK)');
    SQL.Add(' WHERE CD_ARMAZEM = '''+ qryDespesasBasicasCD_ARMAZEM.AsString +''' AND');
    SQL.Add('       CD_TABELA  = '''+ qryDespesasBasicasCD_TABELA.AsString +''' ');
    Prepare;
    Open;
    vMaximo := Fields[0].AsInteger;
    Free;
  end;
  Result := vMaximo + 1;
end;

procedure Tfrm_amz.dbrgrpCalcularChange(Sender: TObject);
begin
  CamposIN_POR_DIA;
end;

procedure Tfrm_amz.dbedtDescDespChange(Sender: TObject);
begin
//  if qryDespesasBasicas.State in [dsbrowse, dsInactive] then
//  begin
//    qryDespesasBasicas.Edit;
//    btn_mi(False, true, True, False);
//  end;
end;

procedure Tfrm_amz.edt_periodoEnter(Sender: TObject);
begin
  vStrOld := TEdit(Sender).Text;
end;

procedure Tfrm_amz.edt_periodoExit(Sender: TObject);
begin
  if TEdit(Sender).Text <> vStrOld then
  begin
    qryDespesasBasicas.Edit;
    btn_mi(false, true, True, false);
  end; 
end;

procedure Tfrm_amz.dsDespesasBasicasDataChange(Sender: TObject;
  Field: TField);
begin
  if qryDespesasBasicas.State = dsEdit then btn_mi(false, true, true, false);
end;

procedure Tfrm_amz.DeletarDespesaNosClientes;
var qry: TQuery;
begin
  qry:= TQuery.Create(application);
  with qry do begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('SELECT CD_CLIENTE, CD_TABELA FROM TARMAZEM_TABELAS_CLIENTE (NOLOCK) ');
    SQL.Add(' WHERE CD_ARMAZEM = "' + qryDespesasBasicasCD_ARMAZEM.AsString + '" ');
    SQL.Add('   AND CD_TABELA_ORIGEM  = "' + qryDespesasBasicasCD_TABELA.AsString + '" ');
    Open;
    while not qry.Eof do begin
      with TQuery.Create(application) do begin
        DataBaseName := 'DBBROKER';
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TARMAZEM_DESPESAS_CLIENTE  ');
        SQL.Add(' WHERE CD_ARMAZEM = "' + qryDespesasBasicasCD_ARMAZEM.AsString + '" ');
        SQL.Add('   AND ISNULL(CD_ITEM, "") = "' + qryDespesasBasicasCD_ITEM.AsString + '" ');
        SQL.Add('   AND ISNULL(TX_VALOR_LIMITE, "") = "' + qryDespesasBasicasTX_VALOR_LIMITE.AsString + '" ');
        SQL.Add('   AND ISNULL(CD_MARGEM, "") = "' + qryDespesasBasicasCD_MARGEM.AsString + '" ');
        SQL.Add('   AND ISNULL(TX_PERIODO, "") = "' + qryDespesasBasicasTX_PERIODO.AsString + '" ');
        SQL.Add('   AND ISNULL(QT_DIAS, "") = "' + qryDespesasBasicasQT_DIAS.AsString + '" ');
        SQL.Add('   AND ISNULL(TX_TIPO_CALCULO, "") = "' + qryDespesasBasicasTX_TIPO_CALCULO.AsString + '" ');
        SQL.Add('   AND ISNULL(VL_PRINCIPAL, "") = "' + qryDespesasBasicasVL_PRINCIPAL.AsString + '" ');
        SQL.Add('   AND ISNULL(VL_MINIMO_20, "") = "' + qryDespesasBasicasVL_MINIMO_20.AsString + '" ');
        SQL.Add('   AND ISNULL(VL_MINIMO_40, "") = "' + qryDespesasBasicasVL_MINIMO_40.AsString + '" ');
        SQL.Add('   AND ISNULL(VL_DESP_CIF, "") = "' + qryDespesasBasicasVL_DESP_CIF.AsString + '" ');
        SQL.Add('   AND ISNULL(VL_DESP_VALOR, "") = "' + qryDespesasBasicasVL_DESP_VALOR.AsString + '" ');
        SQL.Add('   AND ISNULL(IN_POR_DIA, "") = "' + qryDespesasBasicasIN_POR_DIA.AsString + '" ');
        SQL.Add('   AND ISNULL(TP_REGISTRO, "") = "' + qryDespesasBasicasTP_REGISTRO.AsString + '" ');
        SQL.Add('   AND ISNULL(TP_TAMANHO, "") = "' + qryDespesasBasicasTP_TAMANHO.AsString + '" ');
        SQL.Add('   AND CD_TABELA = "' + qry.Fields[1].AsString + '" ');
        SQL.Add('   AND CD_CLIENTE = "' + qry.Fields[0].AsString + '" ');
        //ShowMessage(SQL.Text);
        ExecSQL;
        Free;
      end;
      qry.Next;
    end;
    qry.Free;
  end;
end;

procedure Tfrm_amz.InserirDespesaNosClientes;
var qry: TQuery;
    vCdDesp: Integer;
begin
  qry:= TQuery.Create(application);
  with qry do begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('SELECT CD_CLIENTE, CD_TABELA FROM TARMAZEM_TABELAS_CLIENTE (NOLOCK) ');
    SQL.Add(' WHERE CD_ARMAZEM = "' + qryDespesasBasicasCD_ARMAZEM.AsString + '" ');
    SQL.Add('   AND CD_TABELA_ORIGEM  = "' + qryDespesasBasicasCD_TABELA.AsString + '" ');
    Open;
    while not qry.Eof do begin
      with TQuery.Create(application) do begin
        DataBaseName := 'DBBROKER';
        Close;
        SQL.Clear;
        SQL.Add('SELECT ISNULL(MAX(CD_DESPESA), 0) + 1 AS DESPESA FROM TARMAZEM_DESPESAS_CLIENTE (NOLOCK) ');
        SQL.Add(' WHERE CD_ARMAZEM = "' + qryDespesasBasicasCD_ARMAZEM.AsString + '" ');
        SQL.Add('   AND CD_CLIENTE = "' + qry.Fields[0].AsString + '" ');
        SQL.Add('   AND CD_TABELA  = "' + qry.Fields[1].AsString + '" ');
        Open;
        vCdDesp := Fields[0].AsInteger;
        Close;
        SQL.Clear;
        SQL.Add(' INSERT INTO TARMAZEM_DESPESAS_CLIENTE (CD_ARMAZEM, CD_ITEM, CD_CLIENTE, CD_DESPESA, ');
        SQL.Add('             TX_DESCRICAO_DESPESA, TX_VALOR_LIMITE, CD_MARGEM, TX_PERIODO, QT_DIAS, TX_TIPO_CALCULO, ');
        SQL.Add('             VL_PRINCIPAL, VL_MINIMO_20, VL_MINIMO_40, VL_DESP_CIF, VL_DESP_VALOR, CD_TABELA, ');
        SQL.Add('             IN_POR_DIA, TP_REGISTRO, TP_TAMANHO, IN_MARGEM) ');
        SQL.Add(' SELECT CD_ARMAZEM, CD_ITEM, "' + qry.Fields[0].AsString + '", "' + IntToStr(VCdDesp) + '", TX_DESCRICAO_DESPESA, TX_VALOR_LIMITE, ');
        SQL.Add('        CD_MARGEM, TX_PERIODO, QT_DIAS, TX_TIPO_CALCULO, VL_PRINCIPAL, VL_MINIMO_20, ');
        SQL.Add('        VL_MINIMO_40, VL_DESP_CIF, VL_DESP_VALOR, "' + qry.Fields[1].AsString + '", IN_POR_DIA, TP_REGISTRO, TP_TAMANHO, IN_MARGEM ');
        SQL.Add('  FROM TARMAZEM_DESPESAS_BASICAS ');
        SQL.Add(' WHERE CD_ARMAZEM = "' + qryDespesasBasicasCD_ARMAZEM.AsString + '" ');
        SQL.Add('   AND CD_TABELA  = "' + qryDespesasBasicasCD_TABELA.AsString + '" ');
        SQL.Add('   AND CD_DESPESA_BASICA = "' + qryDespesasBasicasCD_DESPESA_BASICA.AsString + '" ' );
        SQL.Add('   AND CD_ITEM = "' + qryDespesasBasicasCD_ITEM.AsString + '" ');
        //ShowMessage(SQL.Text);
        ExecSQL;
        Free;
      end;
      qry.Next;
    end;
    qry.Free;
  end;
end;

end.


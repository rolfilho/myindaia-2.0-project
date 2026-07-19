unit PGSM103;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, DBTables, Funcoes, KrComunication;

type
  Tfrm_emp_est = class(TForm)
    pgctrl_emp_est: TPageControl;
    ts_lista: TTabSheet;
    dbg_emp_est: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_cnt: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_ativo: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btn_co_emp_est: TSpeedButton;
    dbedt_cd_empresa: TDBEdit;
    dbedt_nm_empresa: TDBEdit;
    dblkpcbox_ativo_emp_est: TDBLookupComboBox;
    dbedt_cd_pais: TDBEdit;
    dbedt_nm_pais: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label5: TLabel;
    dbedt_ap_empresa: TDBEdit;
    Label6: TLabel;
    dbedt_END_EMPRESA: TDBEdit;
    Label9: TLabel;
    dbedt_END_NUMERO: TDBEdit;
    Label10: TLabel;
    dbedt_END_COMPL: TDBEdit;
    Label11: TLabel;
    dbedt_END_CIDADE: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    dbedt_NR_TELEFONE: TDBEdit;
    Label14: TLabel;
    dbedt_NR_FAX: TDBEdit;
    Label15: TLabel;
    dbedt_DT_INCLUSAO: TDBEdit;
    pnl_escolha: TPanel;
    dbchkbox_in_agente: TDBCheckBox;
    dbchkbox_in_banco: TDBCheckBox;
    dbchkbox_in_importador: TDBCheckBox;
    dbchkbox_in_seguradora: TDBCheckBox;
    ts_observacao: TTabSheet;
    pnl_obs: TPanel;
    dbm_obs_agente: TDBMemo;
    btn_co_obs_agente: TSpeedButton;
    lbl_agente: TLabel;
    lbl_importador: TLabel;
    dbm_obs_imp: TDBMemo;
    btn_co_obs_imp: TSpeedButton;
    lbl_banco: TLabel;
    dbm_obs_banco: TDBMemo;
    btn_co_obs_banco: TSpeedButton;
    dbm_obs_seg: TDBMemo;
    lbl_seguradora: TLabel;
    btn_co_obs_seg: TSpeedButton;
    Label16: TLabel;
    dbedt_cd_cliente: TDBEdit;
    dbchkbox_in_exportador: TDBCheckBox;
    Label17: TLabel;
    dbedt_nm_contato: TDBEdit;
    dbchkbox_in_comprador: TDBCheckBox;
    dbedt_ESTADO: TDBEdit;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dbgrdGrupos: TDBGrid;
    Label18: TLabel;
    DBText1: TDBText;
    Shape1: TShape;
    lbl1: TLabel;
    Label19: TLabel;
    pnlStatusBusca: TPanel;
    Label20: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Label21: TLabel;
    Panel2: TPanel;
    lbl_cd_produto: TLabel;
    btn_co_produto: TSpeedButton;
    edt_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    Shape4: TShape;
    lbl2: TLabel;
    dbedtRUC: TDBEdit;
    SpeedButton1: TSpeedButton;
    DBEdit1: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    dbedtCUIT: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Panel3: TPanel;
    Shape5: TShape;
    Label24: TLabel;
    chk_estrangeira: TCheckBox;
    ts_Integracoes: TTabSheet;
    GroupBox1: TGroupBox;
    btnExcluirFiespImportador: TSpeedButton;
    btnCancelarFiespImportador: TSpeedButton;
    btnSalvarFiespImportador: TSpeedButton;
    btnIncluirFiespImportador: TSpeedButton;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    btnExcluirFiespInterveniente: TSpeedButton;
    btnCancelarFiespInterveniente: TSpeedButton;
    btnSalvarFiespInterveniente: TSpeedButton;
    btnIncluirFiespInterveniente: TSpeedButton;
    DBGrid2: TDBGrid;
    dbet_CodigoImportador: TDBEdit;
    dbetNomeImportador: TDBEdit;
    btnImportador: TSpeedButton;
    Label25: TLabel;
    Label26: TLabel;
    dbet_FiespIdImportador: TDBEdit;
    Label27: TLabel;
    dbet_CodigoInterveniente: TDBEdit;
    Label28: TLabel;
    Label29: TLabel;
    dbed_NomeInterveniente: TDBEdit;
    btnInterveniente: TSpeedButton;
    Label30: TLabel;
    dbet_FiespIdInterveniente: TDBEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ts_ClienteOperadorEstrangeiro: TTabSheet;
    GroupBox3: TGroupBox;
    btnExcluirOpeEstrangeiro: TSpeedButton;
    btnCancelarOpeEstrangeiro: TSpeedButton;
    btnSalvarOpeEstrangeiro: TSpeedButton;
    btnIncluirOpeEstrangeiro: TSpeedButton;
    btnRaizCNPJCliente: TSpeedButton;
    lblNomeRaizCNPJ: TLabel;
    lblRaizCNPJ: TLabel;
    Label33: TLabel;
    DBGrid3: TDBGrid;
    edtRaizCNPJ: TDBEdit;
    edtCodOpeEstrangeiro: TDBEdit;
    edtNomeClienteRaizCNPJ: TDBEdit;
    Label31: TLabel;
    dbedtNR_VERSAO_OPE_ESTRANGEIRO: TDBEdit;
    procedure btn_co_emp_estClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_emp_estChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedt_nm_empresaChange(Sender: TObject);
    procedure dbg_emp_estDblClick(Sender: TObject);
    procedure pgctrl_emp_estChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbg_emp_estKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_paisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_paisExit(Sender: TObject);
    procedure dbchkbox_in_agenteClick(Sender: TObject);
    procedure dbchkbox_in_bancoClick(Sender: TObject);
    procedure dbchkbox_in_importadorClick(Sender: TObject);
    procedure dbchkbox_in_seguradoraClick(Sender: TObject);
    procedure btn_co_obs_agenteClick(Sender: TObject);
    procedure btn_co_obs_bancoClick(Sender: TObject);
    procedure btn_co_obs_impClick(Sender: TObject);
    procedure btn_co_obs_segClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_ESTADOChange(Sender: TObject);
    procedure dbgrdGruposDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cb_ordemChange(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure chk_estrangeiraClick(Sender: TObject);
    procedure btnIncluirFiespImportadorClick(Sender: TObject);
    procedure btnImportadorClick(Sender: TObject);
    procedure btnIntervenienteClick(Sender: TObject);
    procedure dbet_CodigoImportadorExit(Sender: TObject);
    procedure dbet_CodigoImportadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSalvarFiespImportadorClick(Sender: TObject);
    procedure btnCancelarFiespImportadorClick(Sender: TObject);
    procedure btnExcluirFiespImportadorClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnIncluirFiespIntervenienteClick(Sender: TObject);
    procedure btnSalvarFiespIntervenienteClick(Sender: TObject);
    procedure btnCancelarFiespIntervenienteClick(Sender: TObject);
    procedure btnExcluirFiespIntervenienteClick(Sender: TObject);
    procedure dbet_CodigoIntervenienteExit(Sender: TObject);
    procedure dbet_CodigoIntervenienteKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure btnRaizCNPJClienteClick(Sender: TObject);
    procedure btnIncluirOpeEstrangeiroClick(Sender: TObject);
    procedure btnSalvarOpeEstrangeiroClick(Sender: TObject);
    procedure btnCancelarOpeEstrangeiroClick(Sender: TObject);
    procedure btnExcluirOpeEstrangeiroClick(Sender: TObject);
    procedure edtRaizCNPJKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    a_str_indices : Array[0..2] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir: Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure HabilitaBotoesFiespImportador;
    procedure HabilitaBotoesFiespInterveniente;
    procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
    procedure HabilitaBotoesClientesRaizCNPJ( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  public
    lCons_OnLine : Boolean;
    lFiltered : Boolean;
    nTipoEmpresa : Integer;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
  end;

var
  frm_emp_est: Tfrm_emp_est;

implementation

uses PGSM095, PGGP001, GSMLIB, PGSM096, PGSM148, PGGP017, PGSM006, PGPE021, ConsOnLineEx,
  KrUtil, KrDialog;

{$R *.DFM}


procedure Tfrm_emp_est.btn_co_emp_estClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    If (Sender as TSpeedButton).Enabled Then begin
      if datm_emp_est.qry_emp_est_.State in [dsBrowse, dsInactive] then datm_emp_est.qry_emp_est_.Edit;
      datm_emp_est.qry_emp_est_CD_PAIS.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_pais,1, dbedt_cd_pais.text);
    end;
  end
  else
   dbedt_nm_pais.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais.Text,'DESCRICAO');
end;

procedure Tfrm_emp_est.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin

  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo := nCodigo;
  datm_consulta_padrao.Tabela.TableName := cNomeTabela;

  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine := fCampo;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

end;

procedure Tfrm_emp_est.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_emp_est do
  begin
    qry_emp_est_.DisableControls;
    qry_emp_est_.Cancel;
    qry_emp_est_.Append;
    qry_emp_est_.EnableControls;
    qry_ult_emp_est_.Open;
    pgctrl_emp_est.ActivePage:=ts_dados_basicos;
    qry_emp_est_.FieldByName('CD_EMPRESA').AsString := UltCod( qry_ult_emp_est_, qry_ult_emp_est_ULTIMO );
    qry_emp_est_.FieldByName('IN_ATIVO').AsString  := '1';

    qry_emp_est_IN_AGENTE.AsBoolean     := False;
    qry_emp_est_IN_BANCO.AsBoolean      := False;
    qry_emp_est_IN_EXPORTADOR.AsBoolean := False;
    qry_emp_est_IN_IMPORTADOR.AsBoolean := False;
    qry_emp_est_IN_SEGURADORA.AsBoolean := False;
    qry_emp_est_IN_COMPRADOR.AsBoolean  := False;

    if datm_emp_est.qryEmpEstGrupo.state = dsInactive then
      datm_emp_est.qryEmpEstGrupo.Open;
  end;

  dbedt_nm_empresa.SetFocus;

end;

procedure Tfrm_emp_est.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_emp_est.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_emp_est.Cancelar;
begin
  try
    if datm_emp_est.qry_emp_est_.State in [dsInsert, dsEdit] then
    begin
//      // excluindo da tempresa_est_grupo
//      with TQuery.Create(application) do
//      begin
//        Databasename := 'DBBROKER';
//        SQL.Clear;
//        SQL.Add('DELETE FROM TEMPRESA_EST_GRUPO WHERE CD_EMPRESA = ''' + datm_emp_est.qry_emp_est_CD_EMPRESA.AsString + '''');
//        ExecSQL;
//        Free;
//      end;
      datm_emp_est.qry_emp_est_.Cancel;
      pgctrl_emp_est.ActivePage := ts_dados_basicos;
      dbedt_nm_empresa.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_emp_est.btn_excluirClick(Sender: TObject);
var
  Arquivo, Pesquisa : String;
begin
  if BoxMensagem( 'Esta Empresa Estrangeira será excluída! Confirma exclusão?', 1 ) Then
  try
    Screen.Cursor := crHourGlass;
    // Deleta no banco NovaNota.GDB - exportador
    Arquivo := cDir_Rpt + '\AtualizaBanco.EXE ' + '3' + ' ' + '02' + ' ' + datm_emp_est.qry_emp_est_CD_EMPRESA.AsString;
    //WinExec(PChar(Arquivo), SW_SHOW); // Não executa mais - Michel - 08/11/2011

    Arquivo := cDir_Rpt + '\AtualizaBanco.EXE ' + '3' + ' ' + '04' + ' ' + datm_emp_est.qry_emp_est_CD_EMPRESA.AsString;
    //WinExec(PChar(Arquivo), SW_SHOW); // Não executa mais - Michel - 08/11/2011
    Pesquisa := datm_emp_est.qry_emp_est_CD_EMPRESA.AsString;
    datm_main.db_broker.StartTransaction;
        // excluindo da tempresa_est_grupo
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('DELETE FROM TEMPRESA_EST_GRUPO WHERE CD_EMPRESA = ''' + datm_emp_est.qry_emp_est_CD_EMPRESA.AsString + '''');
      ExecSQL;
      SQL.Clear;
      SQL.Add('DELETE FROM MYINDAIA.DBO.TEMPRESA_EST_GRUPO WHERE CD_EMPRESA = ''' + datm_emp_est.qry_emp_est_CD_EMPRESA.AsString + '''');
      ExecSQL;
      Free;
    end;

    datm_emp_est.qry_emp_est_.Delete;
    datm_main.db_broker.Commit;

    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' DELETE FROM MYINDAIA.DBO.TEMPRESA_EST WHERE CD_EMPRESA = ''' + Pesquisa  + ''' ');
      ExecSQL;
      Free;
    end;

    datm_emp_est.qry_lista_.Close;
    datm_emp_est.qry_lista_.ParamByName('PRODUTO').AsString := msk_cd_produto.Text;
    datm_emp_est.qry_lista_.Prepare;
    datm_emp_est.qry_lista_.Open;

    pgctrl_emp_est.ActivePage:=ts_lista;
    dbnvg.Enabled := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled := True;

  except
    on E: Exception do
    begin
      datm_emp_est.qry_emp_est_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  Screen.Cursor := crArrow;

end;

procedure Tfrm_emp_est.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_emp_est.edt_chaveChange(Sender: TObject);
begin
  if cb_ordem.ItemIndex = 1 then
  begin
    datm_emp_est.qry_lista_.SQL.Strings[2] := 'WHERE (NM_EMPRESA LIKE "%' + edt_chave.Text + '%"';
    datm_emp_est.qry_lista_.Close;
    datm_emp_est.qry_lista_.ParamByName('PRODUTO').AsString := msk_cd_produto.Text;
    datm_emp_est.qry_lista_.Open;
  end else
    Localiza(datm_emp_est.qry_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_emp_est.cb_ordemClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;

  Pesquisa := datm_emp_est.qry_lista_CD_empresa.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_emp_est.qry_lista_.Close;
  datm_emp_est.qry_lista_.SQL[21] := a_str_indices[cb_ordem.ItemIndex];
  datm_emp_est.qry_lista_.ParamByName('PRODUTO').AsString := msk_cd_produto.Text;
  datm_emp_est.qry_lista_.Open;
  Localiza(datm_emp_est.qry_lista_, Pesquisa, a_str_indices[0] );

  Screen.Cursor := crArrow;

  edt_chave.SetFocus;
end;

procedure Tfrm_emp_est.pgctrl_emp_estChange(Sender: TObject);
begin
  if (pgctrl_emp_est.ActivePage = ts_lista ) then
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
    datm_emp_est.qryEmpEstGrupo.Close;
    datm_emp_est.qryEmpEstGrupo.Open;
  end;

  if pgctrl_emp_est.ActivePage <> ts_lista then
  begin
    dbchkbox_in_agenteClick(nil);
    dbchkbox_in_bancoClick(nil);
    dbchkbox_in_importadorClick(nil);
    dbchkbox_in_seguradoraClick(nil);
  end;
  if pgctrl_emp_est.ActivePage = ts_Integracoes then
  begin
    datm_emp_est.qryFiespImportador.Close;
    datm_emp_est.qryFiespImportador.ParamByName('CD_EMPRESA').AsString := datm_emp_est.qry_emp_est_CD_EMPRESA.AsString;
    datm_emp_est.qryFiespImportador.Prepare;
    datm_emp_est.qryFiespImportador.Open;
    datm_emp_est.qryFiespInterveniente.Close;
    datm_emp_est.qryFiespInterveniente.ParamByName('CD_EMPRESA').AsString := datm_emp_est.qry_emp_est_CD_EMPRESA.AsString;
    datm_emp_est.qryFiespInterveniente.Prepare;
    datm_emp_est.qryFiespInterveniente.Open;
  end;
  if pgctrl_emp_est.ActivePage = ts_ClienteOperadorEstrangeiro then
  begin
    datm_emp_est.qryClientesRaizCNPJ.Close;
    datm_emp_est.qryClientesRaizCNPJ.ParamByName('CD_EMPRESA_EST').AsString := datm_emp_est.qry_emp_est_CD_EMPRESA.AsString;
    datm_emp_est.qryClientesRaizCNPJ.Prepare;
    datm_emp_est.qryClientesRaizCNPJ.Open;
  end;

end;

procedure Tfrm_emp_est.FormCreate(Sender: TObject);
begin
  { Cria o DataModule da Emp Est }

  Application.CreateForm(Tdatm_emp_est, datm_emp_est );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  lFiltered    := False;
  nTipoEmpresa := 0;

  with datm_emp_est do
  begin
    tbl_yesno_.Open;

    qry_lista_.SQL[21] := 'NM_EMPRESA';
    datm_emp_est.qry_lista_.ParamByName('PRODUTO').AsString := msk_cd_produto.Text;
    qry_lista_.Prepare;
    qry_lista_.Open;
  end;

  a_str_indices[0] := 'CD_EMPRESA';
  a_str_indices[1] := 'NM_EMPRESA';
  a_str_indices[2] := 'NR_CLIENTE'; 

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    Items.Add('Cód. no Cliente');
    ItemIndex := 1;
  end;
  vStr_cd_modulo:='22';
  str_cd_rotina:='2203';

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;

end;

function Tfrm_emp_est.Grava;
var
  Codigo, Acao, Arquivo, codigo_empresa : String;
begin
  with datm_emp_est do
  begin
    try
      datm_main.db_broker.StartTransaction;

      Screen.Cursor := crHourGlass;

      Codigo := qry_emp_est_CD_EMPRESA.AsString;

      if ( datm_emp_est.qry_emp_est_.State in [dsInsert, dsEdit] ) then
      begin

        if datm_emp_est.qry_emp_est_.State in [dsInsert] then
          Acao := '1'         // inclui
        else
          Acao := '2';         // atualiza

        codigo_empresa := datm_emp_est.qry_emp_est_CD_EMPRESA.AsString;

        datm_emp_est.qry_emp_est_.Post;
        {
        // Inclui/Altera no banco NovaNota.GDB - exportador
        Arquivo := cDir_Rpt + '\AtualizaBanco.EXE ' + Acao + ' ' + '02' + ' ' + codigo_empresa;
        WinExec(PChar(Arquivo), SW_SHOW);

        Arquivo := cDir_Rpt + '\AtualizaBanco.EXE ' + Acao + ' ' + '04' + ' ' + codigo_empresa;
        WinExec(PChar(Arquivo), SW_SHOW);
        }
      end;

      datm_main.db_broker.Commit;

      with TQuery.Create(application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add(' DELETE FROM MYINDAIA.DBO.TEMPRESA_EST WHERE CD_EMPRESA = ''' + codigo_empresa  + ''' ');
          ExecSQL;
          SQL.Clear;
          SQL.Add(' INSERT INTO MYINDAIA.DBO.TEMPRESA_EST (  ');
          SQL.Add(' CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, CD_PAIS, IN_AGENTE, IN_BANCO, IN_IMPORTADOR, IN_SEGURADORA, ');
          SQL.Add(' IN_EXPORTADOR, NR_CLIENTE, NM_CONTATO, IN_COMPRADOR, CGC_EMPRESA, IN_PO_TRANS, IN_ATIVO, END_EMPRESA,');
          SQL.Add(' END_COMPL, END_NUMERO, END_CIDADE, END_ESTADO ) ');
          SQL.Add(' SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, CD_PAIS, IN_AGENTE, IN_BANCO, IN_IMPORTADOR, IN_SEGURADORA, ');
          SQL.Add(' IN_EXPORTADOR, NR_CLIENTE, NM_CONTATO, IN_COMPRADOR, CGC_EMPRESA, IN_PO_TRANS, IN_ATIVO, END_EMPRESA, ');
          SQL.Add(' END_COMPL, END_NUMERO, END_CIDADE, END_ESTADO ');
          SQL.Add(' FROM TEMPRESA_EST ( NOLOCK ) WHERE IN_ATIVO = ''1'' AND CD_EMPRESA = ''' + codigo_empresa + ''' ');
          ExecSQL;
          SQL.Clear;
          SQL.Add(' DELETE FROM MYINDAIA.DBO.TEMPRESA_EST_GRUPO WHERE CD_EMPRESA = ''' + codigo_empresa  + ''' ');
          ExecSQL;
          SQL.Clear;
          SQL.Add(' INSERT INTO MYINDAIA.DBO.TEMPRESA_EST_GRUPO (CD_EMPRESA, CD_GRUPO) ');
          SQL.Add(' SELECT CD_EMPRESA, CD_GRUPO ');
          SQL.Add(' FROM TEMPRESA_EST_GRUPO ( NOLOCK ) WHERE CD_EMPRESA = ''' + codigo_empresa + ''' ');
          ExecSQL;
          Free;
        end;

      qry_lista_.Close;
      datm_emp_est.qry_lista_.ParamByName('PRODUTO').AsString := msk_cd_produto.Text;
      qry_lista_.Prepare;
      qry_lista_.Open;
      qry_lista_.Locate( 'CD_EMPRESA', Codigo, [loCaseInsensitive] );

      Grava  := True;
    except
      on E: Exception do
      begin
        datm_emp_est.qry_emp_est_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
    Btn_Mi(st_incluir, False, False, st_excluir );

    Screen.Cursor := crArrow;
  end;
end;

function Tfrm_emp_est.consiste;
var
  Pesquisa : String;
begin
  if datm_emp_est.qryEmpEstGrupo.State in [dsEdit] then datm_emp_est.qryEmpEstGrupo.Post;

  // nao permitir salvar como Fornecedor e Cliente, tem q ser um ou outro
  if ( dbchkbox_in_exportador.Checked ) and ( dbchkbox_in_importador.Checked ) then
  begin
    BoxMensagem('Não é possível salvar essa empresa como Fornecedor e Cliente ao mesmo tempo.' + #10#13 +
                'Caso seja necessário, ela deverá ser cadastrada novamente !', 2);
    Consiste := False;
    Exit;
  end;

  if datm_emp_est.qryEmpEstGrupo.isEmpty then
  begin
    BoxMensagem('Antes de salvar, é obrigatório incluir pelo menos um grupo de cliente para esse registro', 2);
    Consiste := False;
    Exit;
  end;

  if ( Trim(dbedt_cd_cliente.Text) = '' )  and
     ( StrToInt(ConsultaLookupSQL('SELECT COUNT(*) BLABLA FROM TEMPRESA_EST_GRUPO WHERE CD_EMPRESA = ''' + dbedt_cd_empresa.text + ''' AND CD_GRUPO IN (''002'',''028'', ''083'', ''923'', ''329'')','BLABLA')) > 0 ) then
  begin
    BoxMensagem('É obrigatório o preenchimento do campo "Cód. no Cliente" para este grupo.', 2);
    Consiste := False;
    Exit;
  end;

  if dbedt_nm_empresa.Text = '' then
  begin
    BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
    dbedt_nm_empresa.SetFocus;
    Consiste := False;
    Exit;
  end;

  if dbedt_ap_empresa.Text = '' then
  begin
    BoxMensagem( 'Campo ''Apelido'' deve ser preenchido!', 2 );
    dbedt_ap_empresa.SetFocus;
    Consiste := False;
    Exit;
  end;
  Consiste := True;
end;

procedure Tfrm_emp_est.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_emp_est.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_emp_est.qry_lista_.Close;
  datm_emp_est.qry_emp_est_.Close;
  datm_emp_est.tbl_yesno_.Close;
  datm_emp_est.Free;
  Action := caFree;
end;


procedure Tfrm_emp_est.dbedt_nm_empresaChange(Sender: TObject);
begin
  if ( datm_emp_est.qry_emp_est_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_emp_est.dbg_emp_estDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      if Not (TTable(Cons_OnLine.DataSet).State in [dsEdit, dsInsert]) then
         TTable(Cons_OnLine.DataSet).Edit;
      Cons_OnLine.AsString := datm_emp_est.qry_emp_est_CD_EMPRESA.AsString;
    except
      try
        Cons_Online_Texto := datm_emp_est.qry_emp_est_CD_EMPRESA.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código da Empresa !', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_emp_est.pgctrl_emp_estChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
//  if ( StrToInt( ConsultaLookupSQL('SELECT COUNT(*) BLABLA FROM TEMPRESA_EST_GRUPO WHERE CD_EMPRESA = ''' + datm_emp_est.qry_emp_est_CD_EMPRESA.AsString + ''' AND CD_GRUPO IN (''028'',''002'')','BLABLA')) > 0 ) and
//     ( Trim(datm_emp_est.qry_emp_est_NR_CLIENTE.AsString) = '' ) and
//     ( pgctrl_emp_est.ActivePage = ts_dados_basicos ) then
//  begin
//    AllowChange := False;
//    Application.MessageBox('Essa empresa necessita da informação no campo "Cód. no Cliente".',
//      'Código Externo', MB_OK + MB_ICONINFORMATION);
//  end;
end;

function Tfrm_emp_est.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_emp_est.qry_emp_est_.State in [dsEdit] ) and st_modificar ) or
     ( datm_emp_est.qry_emp_est_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Empresa Estrangeira foi alterado.' + #13#10 +
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

procedure Tfrm_emp_est.dbg_emp_estKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_emp_estDblClick(Sender);
end;

procedure Tfrm_emp_est.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_emp_est.dbedt_cd_paisKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = VK_F5 then
  begin
    if Sender = dbedt_cd_pais then btn_co_emp_estClick(btn_co_emp_est);
  end;
end;

procedure Tfrm_emp_est.dbedt_cd_paisExit(Sender: TObject);
begin
  if ( length( dbedt_cd_pais.Text ) <> 0 ) and ( dbedt_cd_pais.Text <> '000' ) then
  begin
    if length( dbedt_nm_pais.text ) = 0 then
    begin
      BoxMensagem('Código do país inválido.',2);
      dbedt_cd_pais.SetFocus;
    end;
  end;
end;

procedure Tfrm_emp_est.dbchkbox_in_agenteClick(Sender: TObject);
begin
  dbedt_nm_empresaChange(nil);
  if dbchkbox_in_agente.Checked then
  begin
    lbl_agente.Enabled := True;
    btn_co_obs_agente.Enabled := True;
    dbm_obs_agente.Enabled := True;
    dbm_obs_agente.TabStop := True;
  end
  else
  begin
    lbl_agente.Enabled := False;
    btn_co_obs_agente.Enabled := False;
    dbm_obs_agente.Enabled := False;
    dbm_obs_agente.TabStop := False;
    dbm_obs_agente.Text := ''
  end;
end;

procedure Tfrm_emp_est.dbchkbox_in_bancoClick(Sender: TObject);
begin
  dbedt_nm_empresaChange(nil);
  if dbchkbox_in_banco.Checked then
  begin
    lbl_banco.Enabled := True;
    btn_co_obs_banco.Enabled := True;
    dbm_obs_banco.Enabled := True;
    dbm_obs_banco.TabStop := True;
  end
  else
  begin
    lbl_banco.Enabled := False;
    btn_co_obs_banco.Enabled := False;
    dbm_obs_banco.Enabled := False;
    dbm_obs_banco.TabStop := False;
    dbm_obs_banco.Text := ''
  end;
end;

procedure Tfrm_emp_est.dbchkbox_in_importadorClick(Sender: TObject);
begin
  dbedt_nm_empresaChange(nil);
  if dbchkbox_in_importador.Checked then
  begin
    lbl_importador.Enabled := True;
    btn_co_obs_imp.Enabled := True;
    dbm_obs_imp.Enabled := True;
    dbm_obs_imp.TabStop := True;
  end
  else
  begin
    lbl_importador.Enabled := False;
    btn_co_obs_imp.Enabled := False;
    dbm_obs_imp.Enabled := False;
    dbm_obs_imp.TabStop := False;
    dbm_obs_imp.Text := ''
  end;
end;

procedure Tfrm_emp_est.dbchkbox_in_seguradoraClick(Sender: TObject);
begin
  dbedt_nm_empresaChange(nil);
  if dbchkbox_in_seguradora.Checked then
  begin
    lbl_seguradora.Enabled := True;
    btn_co_obs_seg.Enabled := True;
    dbm_obs_seg.Enabled := True;
    dbm_obs_seg.TabStop := True;
  end
  else
  begin
    lbl_seguradora.Enabled := False;
    btn_co_obs_seg.Enabled := False;
    dbm_obs_seg.Enabled := False;
    dbm_obs_seg.TabStop := False;
    dbm_obs_seg.Text := ''
  end;
end;

procedure Tfrm_emp_est.btn_co_obs_agenteClick(Sender: TObject);
begin
  with datm_emp_est Do
  begin
    Application.CreateForm(Tfrm_observacoes, frm_observacoes );
    frm_observacoes.Cons_OnLine := datm_emp_est.qry_emp_est_TX_OBS_AGENTE;
    With frm_observacoes Do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
  end;

end;

procedure Tfrm_emp_est.btn_co_obs_bancoClick(Sender: TObject);
begin
  with datm_emp_est Do
  begin
    Application.CreateForm(Tfrm_observacoes, frm_observacoes );
    frm_observacoes.Cons_OnLine := datm_emp_est.qry_emp_est_TX_OBS_BANCO;
    With frm_observacoes Do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
  end;

end;

procedure Tfrm_emp_est.btn_co_obs_impClick(Sender: TObject);
begin
  with datm_emp_est Do
  begin
    Application.CreateForm(Tfrm_observacoes, frm_observacoes );
    frm_observacoes.Cons_OnLine := datm_emp_est.qry_emp_est_TX_OBS_IMP;
    With frm_observacoes Do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
  end;

end;

procedure Tfrm_emp_est.btn_co_obs_segClick(Sender: TObject);
begin
  with datm_emp_est Do
  begin
    Application.CreateForm(Tfrm_observacoes, frm_observacoes );
    frm_observacoes.Cons_OnLine := datm_emp_est.qry_emp_est_TX_OBS_SEG;
    With frm_observacoes Do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
  end;

end;

procedure Tfrm_emp_est.FormShow(Sender: TObject);
begin
  with datm_emp_est do
  begin
    if lFiltered then
    begin
      qry_lista_.Close;

      if nTipoEmpresa = 1 then     // Importador
         qry_lista_.Filter   := 'IN_IMPORTADOR = 1';
      if nTipoEmpresa = 2 then     // Agente
         qry_lista_.Filter   := 'IN_AGENTE = 1';
      if nTipoEmpresa = 3 then     // Banco
         qry_lista_.Filter   := 'IN_BANCO = 1';

      qry_lista_.Filtered := True;
      qry_lista_.SQL[21] := 'NM_EMPRESA';
      datm_emp_est.qry_lista_.ParamByName('PRODUTO').AsString := msk_cd_produto.Text;
      qry_lista_.Prepare;
      qry_lista_.Open;
    end;

    qry_emp_est_.Close;
    qry_emp_est_.Prepare;
    qry_emp_est_.Open;

    ds_emp_est.AutoEdit := st_modificar;
  end;
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_emp_est.ActivePage := ts_lista;
  edt_chave.SetFocus;
  msk_cd_produto.Text := str_cd_produto;
end;

procedure Tfrm_emp_est.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_emp_estDblClick(nil);
end;

procedure Tfrm_emp_est.dbedt_ESTADOChange(Sender: TObject);
begin
  if ( datm_emp_est.qry_emp_est_.State in [ dsInsert, dsEdit ] ) then
    Btn_Mi( False, True, True, False );
end;

procedure Tfrm_emp_est.dbgrdGruposDblClick(Sender: TObject);
begin
  if datm_emp_est.qryEmpEstGrupo.state = dsBrowse then
    PoeEmEdicao(datm_emp_est.qryEmpEstGrupo);
  datm_emp_est.qryEmpEstGrupo.FieldByName('CD_GRUPO').AsString := ConsultaOnLineEx('TGRUPO','Grupos',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO');
end;

procedure Tfrm_emp_est.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//  if ( StrToInt( ConsultaLookupSQL('SELECT COUNT(*) BLABLA FROM TEMPRESA_EST_GRUPO WHERE CD_EMPRESA = ''' + datm_emp_est.qry_emp_est_CD_EMPRESA.AsString + ''' AND CD_GRUPO IN (''028'',''002'')','BLABLA')) > 0 ) and
//     ( Trim(datm_emp_est.qry_emp_est_NR_CLIENTE.AsString) = '' ) then
//  begin
//    CanClose := False;
//    Application.MessageBox('Essa empresa necessita da informação no campo "Cód. no Cliente".',
//      'Código Externo', MB_OK + MB_ICONINFORMATION);
//  end;
end;

procedure Tfrm_emp_est.cb_ordemChange(Sender: TObject);
begin
  pnlStatusBusca.Visible := ( cb_ordem.ItemIndex = 1 );
  datm_emp_est.qry_lista_.SQL.Strings[2] := ' WHERE (1=1';
  datm_emp_est.qry_lista_.Close;
  datm_emp_est.qry_lista_.ParamByName('PRODUTO').AsString := msk_cd_produto.Text;
  datm_emp_est.qry_lista_.Open;
end;

procedure Tfrm_emp_est.btn_co_produtoClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto, 1, msk_cd_produto.Text);
    msk_cd_produtoExit(nil);
  End Else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure Tfrm_emp_est.msk_cd_produtoExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_produto );
  if ConsultaLookupSQL('SELECT COUNT(*) BLABLA FROM TUSUARIO_HABILITACAO WHERE CD_USUARIO=''' + STR_CD_USUARIO + ''' and CD_PRODUTO = ''' + msk_cd_produto.Text + ''' AND IN_ATIVO=''1''','BLABLA') = '0' then
  begin
    BoxMensagem('Usuário não tem acesso a esse produto',2);
    msk_cd_produto.Text := str_cd_produto;
    Exit;
  end;
  datm_emp_est.qry_lista_.Close;
  datm_emp_est.qry_lista_.ParamByName('PRODUTO').AsString := msk_cd_produto.Text;
  datm_emp_est.qry_lista_.Open;
end;

procedure Tfrm_emp_est.msk_cd_produtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_F5 then
  begin
    if Sender = msk_cd_produto then btn_co_produtoClick(btn_co_produto);
  end;
end;

procedure Tfrm_emp_est.SpeedButton1Click(Sender: TObject);
var
  vCodEmpresa : string;

  function DeParaPais(const vNm_pais : string) : string;
  begin
    if vNm_Pais = 'ALEMANHA' then
      Result := '023'
    else if vNm_Pais = 'ANGOLA' then
      Result := '040'
    else if vNm_Pais = 'ARGENTINA' then
      Result := '063'
    else if vNm_Pais = 'BOLIVIA' then
      Result := '097'
    else if vNm_Pais = 'COLOMBIA' then
      Result := '169'
    else if vNm_Pais = 'CONGO' then
      Result := '177'
    else if vNm_Pais = 'EQUADOR' then
      Result := '239'
    else if vNm_Pais = 'ESPANHA' then
      Result := '245'
    else if vNm_Pais = 'FRANCA' then
      Result := '275'
    else if vNm_Pais = 'GHANA' then
      Result := '289'
    else if vNm_Pais = 'INDIA' then
      Result := '361'
    else if vNm_Pais = 'INGLATERRA' then
      Result := '628'
    else if vNm_Pais = 'ITALIA' then
      Result := '386'
    else if vNm_Pais = 'JAPAO' then
      Result := '399'
    else if vNm_Pais = 'MALASIA' then
      Result := '455'
    else if vNm_Pais = 'MEXICO' then
      Result := '493'
    else if vNm_Pais = 'NIGERIA' then
      Result := '528'
    else if vNm_Pais = 'PARAGUAI' then
      Result := '586'
    else if vNm_Pais = 'PERU' then
      Result := '589'
    else if vNm_Pais = 'TAILANDIA' then
      Result := '776'
    else if vNm_Pais = 'TRINIDAD & TOBAGO' then
      Result := '815'
    else if vNm_Pais = 'URUGUAI' then
      Result := '845'
    else if vNm_Pais = 'VENEZUELA' then
      Result := '850';
  end;
begin
  datm_emp_est.qryEmpEstGrupo.Open;
  with tQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    Close;                 //INDAIA10.BROKER.dbo.
    SQL.Add('SELECT * FROM cliente');
    Prepare;
    Open;
    while not eof do
    begin
      datm_emp_est.qry_emp_est_.Insert;
      vCodEmpresa := UltCod( datm_emp_est.qry_ult_emp_est_, datm_emp_est.qry_ult_emp_est_ULTIMO );

      datm_emp_est.qry_emp_est_.FieldByName('CD_EMPRESA').AsString     := vCodEmpresa;
      datm_emp_est.qry_emp_est_.FieldByName('IN_ATIVO').AsString       := '1';
      datm_emp_est.qry_emp_est_.FieldByName('IN_IMPORTADOR').AsBoolean := True;
      datm_emp_est.qry_emp_est_.FieldByName('NR_CLIENTE').AsString    := Fields.Fields[0].AsString; //codigo

      datm_emp_est.qry_emp_est_.FieldByName('NM_EMPRESA').AsString    := Fields.Fields[1].AsString; //razao social
      datm_emp_est.qry_emp_est_.FieldByName('AP_EMPRESA').AsString    := Fields.Fields[2].AsString; //nome reduzido

      datm_emp_est.qry_emp_est_.FieldByName('CD_PAIS').AsString       := DeParaPais(UpperCase(Fields.Fields[3].AsString)); //país
      datm_emp_est.qry_emp_est_.FieldByName('END_EMPRESA').AsString   := Fields.Fields[4].AsString; //endereco
      datm_emp_est.qry_emp_est_.FieldByName('END_NUMERO').AsString    := Fields.Fields[5].AsString; //num
      datm_emp_est.qry_emp_est_.FieldByName('END_COMPL').AsString     := Fields.Fields[6].AsString; //comple
      datm_emp_est.qry_emp_est_.FieldByName('END_CIDADE').AsString    := Fields.Fields[7].AsString; //cidade
      datm_emp_est.qry_emp_est_.FieldByName('END_ESTADO').AsString    := Fields.Fields[8].AsString; //estado
      datm_emp_est.qry_emp_est_.FieldByName('NR_TELEFONE').AsString   := Fields.Fields[9].AsString; //telefone
      datm_emp_est.qry_emp_est_.FieldByName('DT_INCLUSAO').AsDateTime := dt_server;
      datm_emp_est.qry_emp_est_.Post;

      datm_emp_est.qryEmpEstGrupo.Insert;
      datm_emp_est.qryEmpEstGrupoCD_EMPRESA.AsString := vCodEmpresa;
      datm_emp_est.qryEmpEstGrupoCD_GRUPO.AsString   := '497';
      datm_emp_est.qryEmpEstGrupo.Post;

      Next;
    end;
  end;
end;

procedure Tfrm_emp_est.DBCheckBox1Click(Sender: TObject);
begin
  if ( datm_emp_est.qry_emp_est_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_emp_est.chk_estrangeiraClick(Sender: TObject);
begin
  with datm_emp_est do begin
    qry_lista_.Close;
    if chk_estrangeira.Checked then
       qry_lista_.ParamByName('IN_ATIVO').AsString   := 'X'
    else
       qry_lista_.ParamByName('IN_ATIVO').Value   := Null ;
    qry_lista_.Prepare;
    qry_lista_.Open;
  end;
end;

procedure Tfrm_emp_est.HabilitaBotoesFiespImportador;
begin
  btnIncluirFiespImportador.Enabled := not btnIncluirFiespImportador.Enabled;
  btnSalvarFiespImportador.Enabled := not btnSalvarFiespImportador.Enabled;
  btnCancelarFiespImportador.Enabled := not btnCancelarFiespImportador.Enabled;
  btnExcluirFiespImportador.Enabled := not btnExcluirFiespImportador.Enabled;
end;

procedure Tfrm_emp_est.HabilitaBotoesFiespInterveniente;
begin
  btnIncluirFiespInterveniente.Enabled := not btnIncluirFiespInterveniente.Enabled;
  btnSalvarFiespInterveniente.Enabled := not btnSalvarFiespInterveniente.Enabled;
  btnCancelarFiespInterveniente.Enabled := not btnCancelarFiespInterveniente.Enabled;
  btnExcluirFiespInterveniente.Enabled := not btnExcluirFiespInterveniente.Enabled;
end;

procedure Tfrm_emp_est.btnImportadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if (Sender as TSpeedButton).Enabled Then
    begin
      if datm_emp_est.qryFiespImportador.State in [dsBrowse, dsInactive] then
        btnIncluirFiespImportador.Click;
      datm_emp_est.qryFiespImportadorCD_EMPRESA_NAC.AsString := ConsultaOnLineEx('TEMPRESA_NAC','Empresas',['CD_EMPRESA','NM_EMPRESA','CGC_EMPRESA'],['Código','Nome', 'CNPJ'],'CD_EMPRESA',nil,1, dbet_CodigoImportador.text);
    end;
  end
  else
    if Length(dbetNomeImportador.Text)=5 then
      dbetNomeImportador.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',dbet_CodigoImportador.Text,'NM_EMPRESA');
end;

procedure Tfrm_emp_est.btnIntervenienteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if (Sender as TSpeedButton).Enabled then
    begin
      if datm_emp_est.qryFiespInterveniente.State in [dsBrowse, dsInactive] then
        btnIncluirFiespInterveniente.Click;
      datm_emp_est.qryFiespIntervenienteCD_EMPRESA_NAC.AsString := ConsultaOnLineEx('TEMPRESA_NAC','Empresas',['CD_EMPRESA','NM_EMPRESA','CGC_EMPRESA'],['Código','Nome', 'CNPJ'],'CD_EMPRESA',nil,1, dbet_CodigoInterveniente.text);
    end;
  end
  else
   if Length(dbed_NomeInterveniente.Text)=5 then
     dbed_NomeInterveniente.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',dbet_CodigoInterveniente.Text,'NM_EMPRESA');
end;

procedure Tfrm_emp_est.dbet_CodigoImportadorExit(Sender: TObject);
begin
  if (Length(dbet_CodigoImportador.Text ) <> 0 ) and ( dbet_CodigoImportador.Text <> '00000' ) then
  begin
    if length( dbet_CodigoImportador.text ) = 0 then
    begin
      BoxMensagem('Código da importador inválido.',2);
      dbet_CodigoImportador.SetFocus;
    end;
  end;
end;

procedure Tfrm_emp_est.dbet_CodigoImportadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_F5 then
  begin
    if Sender = dbet_CodigoImportador then
      btnImportadorClick(btnImportador);
  end;
end;

procedure Tfrm_emp_est.btnIncluirFiespImportadorClick(Sender: TObject);
begin
  if datm_emp_est.qryFiespImportador.State in [dsEdit, dsInsert] then
    Reject('Antes de prosseguir você deve Salvar ou Cancelar as alterações no registro principal.');

  HabilitaBotoesFiespImportador;
  //datm_emp_est.qryFiespImportador.Open;
  datm_emp_est.qryFiespImportador.Append;
  datm_emp_est.qryFiespImportadorCD_EMPRESA_EST.AsString := datm_emp_est.qry_emp_est_CD_EMPRESA.AsString;
end;

procedure Tfrm_emp_est.btnSalvarFiespImportadorClick(Sender: TObject);
begin
  HabilitaBotoesFiespImportador;
  datm_emp_est.qryFiespImportador.Post;
  datm_emp_est.qryFiespImportador.ApplyUpdates;
end;

procedure Tfrm_emp_est.btnCancelarFiespImportadorClick(Sender: TObject);
begin
  HabilitaBotoesFiespImportador;
  datm_emp_est.qryFiespImportador.Cancel;
end;

procedure Tfrm_emp_est.btnExcluirFiespImportadorClick(Sender: TObject);
begin
  datm_emp_est.qryFiespImportador.Delete;
  datm_emp_est.qryFiespImportador.ApplyUpdates;
end;

procedure Tfrm_emp_est.SpeedButton2Click(Sender: TObject);
var
  CNPJ: string;
begin
  if (dbet_CodigoImportador.Text='') and (dbetNomeImportador.Text='') then
    Reject('Você deve informar um Importador antes.');
  CNPJ := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',dbet_CodigoImportador.Text,'CGC_EMPRESA');
  ExecAndWaitRun(GetCODFullPath,
    '/Consulta /Importador /Classe Tfrm_emp_est /Form "Empresa Estrangeira" /CNPJ '+CNPJ,
    'TFormList', 'Lista', SW_SHOW);
end;

procedure Tfrm_emp_est.SpeedButton3Click(Sender: TObject);
var
  CNPJ: string;
begin
  if (dbet_CodigoInterveniente.Text='') and (dbed_NomeInterveniente.Text='') then
    Reject('Você deve informar um Interveniente antes.');
  CNPJ := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',dbet_CodigoInterveniente.Text,'CGC_EMPRESA');
  ExecAndWaitRun(GetCODFullPath,
    '/Consulta /Interveniente /Classe Tfrm_emp_est /Form "Empresa Estrangeira" /CNPJ '+CNPJ,
    'TFormList', 'Lista', SW_SHOW);
end;

procedure Tfrm_emp_est.WMCopyData(var Msg: TWMCopyData);
var
  s: string;
begin
  if Msg.CopyDataStruct.dwData = 0 then
  begin
    s := PChar(Msg.CopyDataStruct.lpData);
    datm_emp_est.qryFiespImportadorFIESP_ID.AsString := s;
  end
  else if Msg.CopyDataStruct.dwData = 1 then
  begin
    s := PChar(Msg.CopyDataStruct.lpData);
    datm_emp_est.qryFiespIntervenienteFIESP_ID.AsString := s;
  end
  else
  begin
    msg.Result := 0;
    Reject('Tipo de dados não suportado!');
  end;
  msg.Result := 1;
end;

procedure Tfrm_emp_est.btnIncluirFiespIntervenienteClick(Sender: TObject);
begin
  if datm_emp_est.qryFiespImportador.State in [dsEdit, dsInsert] then
    Reject('Antes de prosseguir você deve Salvar ou Cancelar as alterações no registro principal.');

  HabilitaBotoesFiespInterveniente;
  datm_emp_est.qryFiespInterveniente.Open;
  datm_emp_est.qryFiespInterveniente.Append;
  datm_emp_est.qryFiespIntervenienteCD_EMPRESA_EST.AsString := datm_emp_est.qry_emp_est_CD_EMPRESA.AsString;
end;

procedure Tfrm_emp_est.btnSalvarFiespIntervenienteClick(Sender: TObject);
begin
  HabilitaBotoesFiespInterveniente;
  datm_emp_est.qryFiespInterveniente.Post;
  datm_emp_est.qryFiespInterveniente.ApplyUpdates;
end;

procedure Tfrm_emp_est.btnCancelarFiespIntervenienteClick(Sender: TObject);
begin
  HabilitaBotoesFiespInterveniente;
  datm_emp_est.qryFiespInterveniente.Cancel;
end;

procedure Tfrm_emp_est.btnExcluirFiespIntervenienteClick(Sender: TObject);
begin
  datm_emp_est.qryFiespInterveniente.Delete;
  datm_emp_est.qryFiespInterveniente.ApplyUpdates;
end;

procedure Tfrm_emp_est.dbet_CodigoIntervenienteExit(Sender: TObject);
begin
  if (Length(dbet_CodigoInterveniente.Text ) <> 0 ) and ( dbet_CodigoInterveniente.Text <> '00000' ) then
  begin
    if length( dbet_CodigoInterveniente.text ) = 0 then
    begin
      BoxMensagem('Código da Interveniente inválido.',2);
      dbet_CodigoInterveniente.SetFocus;
    end;
  end;
end;

procedure Tfrm_emp_est.dbet_CodigoIntervenienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_F5 then
  begin
    if Sender = dbet_CodigoInterveniente then
      btnIntervenienteClick(btnInterveniente);
  end;
end;

procedure Tfrm_emp_est.btnRaizCNPJClienteClick(Sender: TObject);
var
  vRaizCNPJ: String;
begin
  if Sender is TSpeedButton then begin
    if (Sender as TSpeedButton).Enabled Then
    begin
      if datm_emp_est.qryClientesRaizCNPJ.State in [dsBrowse, dsInactive] then
        btnIncluirOpeEstrangeiro.Click;
      vRaizCNPJ := ConsultaOnLineEx('TEMPRESA_NAC','Empresas',['CD_EMPRESA','NM_EMPRESA','CGC_EMPRESA'],['Código','Nome', 'CNPJ'],'CGC_EMPRESA',nil,1, edtRaizCNPJ.text);
      datm_emp_est.qryClientesRaizCNPJRAIZ_CNPJ.AsString := Copy(vRaizCNPJ, 1, 8);
      edtNomeClienteRaizCNPJ.Text := ConsultaLookUPSQL('SELECT TOP 1 NM_EMPRESA FROM TEMPRESA_NAC WHERE SUBSTRING(CGC_EMPRESA, 1, 8) = '+ QuotedStr(datm_emp_est.qryClientesRaizCNPJRAIZ_CNPJ.AsString),'NM_EMPRESA');      
    end;
  end
  else
    edtNomeClienteRaizCNPJ.Text := ConsultaLookUPSQL('SELECT TOP 1 NM_EMPRESA FROM TEMPRESA_NAC WHERE SUBSTRING(CGC_EMPRESA, 1, 8) = '+ QuotedStr(datm_emp_est.qryClientesRaizCNPJRAIZ_CNPJ.AsString),'NM_EMPRESA');
end;

procedure Tfrm_emp_est.btnIncluirOpeEstrangeiroClick(Sender: TObject);
begin
  if datm_emp_est.qryClientesRaizCNPJ.State in [dsEdit, dsInsert] then
    Reject('Antes de prosseguir você deve Salvar ou Cancelar as alterações no registro principal.');

  HabilitaBotoesClientesRaizCNPJ(False, True, True, false);
  datm_emp_est.qryClientesRaizCNPJ.Open;
  datm_emp_est.qryClientesRaizCNPJ.Append;
  datm_emp_est.qryClientesRaizCNPJCD_EMPRESA_EST.AsString := datm_emp_est.qry_emp_est_CD_EMPRESA.AsString;
end;

procedure Tfrm_emp_est.btnSalvarOpeEstrangeiroClick(Sender: TObject);
begin
  HabilitaBotoesClientesRaizCNPJ(True, False, False, true);
  datm_emp_est.qryClientesRaizCNPJ.Post;
  datm_emp_est.qryClientesRaizCNPJ.ApplyUpdates;
end;

procedure Tfrm_emp_est.btnCancelarOpeEstrangeiroClick(Sender: TObject);
begin
  HabilitaBotoesClientesRaizCNPJ(True, False, False, true);
  datm_emp_est.qryClientesRaizCNPJ.Cancel;
end;

procedure Tfrm_emp_est.HabilitaBotoesClientesRaizCNPJ( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btnIncluirOpeEstrangeiro.Enabled := Inc;
  btnSalvarOpeEstrangeiro.Enabled := Salv;
  btnCancelarOpeEstrangeiro.Enabled := Canc;
  btnExcluirOpeEstrangeiro.Enabled := Exc;
end;

procedure Tfrm_emp_est.btnExcluirOpeEstrangeiroClick(Sender: TObject);
begin
  datm_emp_est.qryClientesRaizCNPJ.Delete;
  datm_emp_est.qryClientesRaizCNPJ.ApplyUpdates;
end;

procedure Tfrm_emp_est.edtRaizCNPJKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = VK_F5 then
  begin
    if Sender = edtRaizCNPJ then
      btnRaizCNPJClienteClick(btnRaizCNPJCliente);
  end;
end;

end.

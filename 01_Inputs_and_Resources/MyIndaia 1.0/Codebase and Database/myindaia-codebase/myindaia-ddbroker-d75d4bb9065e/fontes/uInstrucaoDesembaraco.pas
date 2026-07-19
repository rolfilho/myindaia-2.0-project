unit uInstrucaoDesembaraco;
       
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Mask, Grids, DBGrids, ComCtrls,
  Menus, Buttons, dbcgrids, DB, DBTables, ConsOnLineEx, PGGP001, PGGP017, ComObj,
  IdMessage, IdSMTP, StrUtils;

type
  TFrm_InstrucaoDesembaraco = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_Instr: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    Label3: TLabel;
    lbl_dt_inclusao: TLabel;
    dbedt_cd_grupo: TDBEdit;
    dbedt_dt_inclusao: TDBEdit;
    ts_Itens: TTabSheet;
    ChkAutorizado: TDBCheckBox;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    Shape3: TShape;
    Panel5: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBText2: TDBText;
    DBText4: TDBText;
    DBText3: TDBText;
    PnlIncItens: TPanel;
    panel33: TPanel;
    Panel3: TPanel;
    GridItens: TDBGrid;
    Panel4: TPanel;
    btnSalvarPedido: TSpeedButton;
    btnCancelarPedido: TSpeedButton;
    Panel6: TPanel;
    Label4: TLabel;
    EditNrPedido: TEdit;
    ChkTodos: TCheckBox;
    Label9: TLabel;
    EditDtAutorizacao: TDBEdit;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    Label11: TLabel;
    btn_co_cliente: TSpeedButton;
    edt_nm_cliente: TEdit;
    lbl_cd_cliente: TLabel;
    dbedt_cd_cliente: TDBEdit;
    EditUsuarioAutorizou: TEdit;
    LblProcesso: TLabel;
    DBText5: TDBText;
    BtnImprimir: TSpeedButton;
    dbedtCodigoAnalista: TDBEdit;
    lblAnalista: TLabel;
    edtNomeAnalista: TEdit;
    btnConsultaAnalista: TSpeedButton;
    Label13: TLabel;
    BtnConsultaEmbarcacaoItemParcial: TSpeedButton;
    EditNavioParcial: TDBEdit;
    EditNavioParcialDesc: TEdit;
    Label14: TLabel;
    EditNumBL: TDBEdit;
    BvlProcesso: TBevel;
    BtnDatas: TSpeedButton;
    pnlOpcoes: TPanel;
    chkUltimos30Dias: TCheckBox;
    chkExibeAutorizados: TCheckBox;
    pnlDespesas: TPanel;
    DBGrid1: TDBGrid;
    Label12: TLabel;
    Label15: TLabel;
    dbmemObservacoes: TDBMemo;
    procedure btn_incluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure btnSalvarPedidoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure EditNrPedidoExit(Sender: TObject);
    procedure EditNrPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ChkTodosClick(Sender: TObject);
    procedure GridItensCellClick(Column: TColumn);
    procedure ChkAutorizadoClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure dbedt_cd_clienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_clienteExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EditCdUsuarioAutorizouChange(Sender: TObject);
    procedure cb_ordemChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure btnConsultaAnalistaClick(Sender: TObject);
    procedure dbedtCodigoAnalistaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnImprimirClick(Sender: TObject);
    procedure BtnConsultaEmbarcacaoItemParcialClick(Sender: TObject);
    procedure EditNavioParcialExit(Sender: TObject);
    procedure EditNavioParcialKeyPress(Sender: TObject; var Key: Char);
    procedure BtnDatasClick(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure chkUltimos30DiasClick(Sender: TObject);
    procedure chkExibeAutorizadosClick(Sender: TObject);
    procedure dbg_cadastroDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure pgctrl_InstrChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
    Pesquisa: string;
    st_modificar, st_incluir, st_excluir: Boolean;
    function Consiste: Boolean;
    function Grava: Boolean;
    function VerificaItensRepetidos : Boolean;
    procedure Cancelar;
    procedure AtualizaGridItens;
    procedure AtualizaTPO_Item(const cItemJaUtilizado : string; cTodos, cLimpaDados : Boolean);
    procedure EnviaEmail;
    procedure GeraExcel(pMostraPlanilha : Boolean);
    procedure LimpaFlagsTPOItem(const cIdCodigo : string);
    function VerificaNumLI(const pNumPedido : string; const pNumItem : string) : string;
  public
    procedure btn_mi(Inc: Boolean; Salv: Boolean; Canc: Boolean; Exc: Boolean);
  end;

var
  Frm_InstrucaoDesembaraco: TFrm_InstrucaoDesembaraco;

implementation

{$R *.dfm}

uses                                            
  Funcoes, GSMLIB, uDatm_InstrucaoDesembaraco, uInstrucaoDesembaracoDatas,
  Math;

procedure TFrm_InstrucaoDesembaraco.btn_incluirClick(Sender: TObject);
begin
  if pgctrl_Instr.ActivePageIndex in [0,1] then //lista ou dados básicos
  begin
    with Datm_InstrDesemb do
    begin
      qry_InstrucaoDesemb.DisableControls;
      qry_InstrucaoDesemb.Cancel;
      qry_InstrucaoDesemb.Append;
      qry_InstrucaoDesemb.EnableControls;
      qry_InstrucaoDesemb.FieldByName('DT_CRIACAO').AsDateTime  := Date;
      qry_InstrucaoDesemb.FieldByName('CD_USUARIO').AsString    := str_cd_usuario;
      qry_InstrucaoDesemb.FieldByName('IN_AUTORIZADO').AsString := '0';

      pgctrl_Instr.ActivePage := ts_dados_basicos;
      qry_InstrucaoDesemb.AfterScroll(qry_InstrucaoDesemb);
      dbedt_cd_cliente.SetFocus;
    end;
  end;

  if pgctrl_Instr.ActivePage = ts_Itens then
  begin
    //Só é possível incluir itens se a instr.desemb. não foi autorizada
    if Datm_InstrDesemb.qry_InstrucaoDesemb.FieldByName('IN_AUTORIZADO').AsString = '0' then
    begin
      btn_mi(False, False, False, False);
      btn_sair.Enabled := False;

      Datm_InstrDesemb.qry_ItensPedido.Close;
      PnlIncItens.Visible := True;
      EditNrPedido.Text   := '';
      EditNrPedido.SetFocus;
    end
    else
      BoxMensagem('Não é possível incluir mais itens pois esta Instrução de Desembaraço já foi autorizada !', 3);
  end;
end;

procedure TFrm_InstrucaoDesembaraco.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled := Inc; mi_incluir.Enabled := Inc;
  btn_excluir.Enabled := Exc; mi_excluir.Enabled := Exc;
  btn_salvar.Enabled := Salv; mi_salvar.Enabled := Salv;
  btn_Cancelar.Enabled := Canc; mi_Cancelar.Enabled := Canc;
end;

procedure TFrm_InstrucaoDesembaraco.FormCreate(Sender: TObject);
begin
 { Inicializa o Data Module para Grupo}
  Application.CreateForm(TDatm_InstrDesemb, Datm_InstrDesemb);

  st_incluir := False;
  st_modificar := False;
  st_excluir := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  pgctrl_Instr.ActivePage := ts_lista;

  DBCtrlGrid1.Color  := clPnlClaroBroker;
  Panel1.Color       := clPnlClaroBroker;
  pnl_cadastro.Color := clMenuBroker;


  Btn_Mi(st_incluir, False, False, st_excluir);

  cb_ordem.ItemIndex := 0;
end;

procedure TFrm_InstrucaoDesembaraco.btnCancelarPedidoClick(Sender: TObject);
begin
  PnlIncItens.Visible := False;
  Btn_Mi(st_incluir, False, False, st_excluir);
  btn_sair.Enabled := True;
end;

procedure TFrm_InstrucaoDesembaraco.btnSalvarPedidoClick(Sender: TObject);
begin
  if GridItens.SelectedRows.Count <> 0 then
  begin
    ActiveControl       := nil;
    Datm_InstrDesemb.qry_ItensPedido.First;
    while not Datm_InstrDesemb.qry_ItensPedido.Eof do
    begin
      if GridItens.SelectedRows.CurrentRowSelected then  //Se estiver selecionado então inclui na tabela
      begin
        with Datm_InstrDesemb, Datm_InstrDesemb.qry_ItensInstrucaoDesemb do
        begin
          if VerificaItensRepetidos then
          begin
            datm_main.db_broker.StartTransaction;
            Insert;
            FieldByName('ID_CODIGO').AsString     := qry_InstrucaoDesembID_CODIGO.AsString;
            FieldByName('NR_REFERENCIA').AsString := qry_ItensPedido.FieldByName('NR_PROCESSO').AsString;
            FieldByName('NR_ITEM_PO').AsString    := qry_ItensPedido.FieldByName('NR_ITEM_CLIENTE').AsString;
            FieldByName('NR_PARCIAL').AsInteger   := qry_ItensPedido.FieldByName('NR_PARCIAL').AsInteger;
            FieldByName('DT_INCLUSAO').AsDateTime := Date;
            Post;

            //Atualiza Flag na tpo_item como item já utilizado em uma instrução de desembaraço
            AtualizaTPO_Item('1', False, False);

            datm_main.db_broker.Commit;
            qry_ItensInstrucaoDesemb.Close;
            qry_ItensInstrucaoDesemb.Open;
          end
          else
          begin
            BoxMensagem('O pedido "' + qry_ItensPedido.FieldByName('NR_PROCESSO').AsString + '", Item "' +
                                       qry_ItensPedido.FieldByName('NR_ITEM_CLIENTE').AsString + '" com a Parcial "' +
                                       qry_ItensPedido.FieldByName('NR_PARCIAL').AsString + '" já está sendo utilizado em outro Processo de Desembaraço !',3);
            Exit;
          end;
        end;
      end;
      Datm_InstrDesemb.qry_ItensPedido.Next;
    end;
    Btn_Mi(st_incluir, False, False, st_excluir);
    btn_sair.Enabled := True;

    PnlIncItens.Visible := False;
    ChkTodos.Checked    := False;
  end
  else
  begin
    BoxMensagem('Selecione um Item !',2);
    GridItens.SetFocus;
  end;
end;

procedure TFrm_InstrucaoDesembaraco.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
  begin
    if PnlIncItens.Visible then
      btnCancelarPedido.Click
    else
      btn_sair.Click;
  end;
end;

procedure TFrm_InstrucaoDesembaraco.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_InstrucaoDesembaraco.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if not Consiste then
    Exit;
  if not Grava then
    Exit;
end;

function TFrm_InstrucaoDesembaraco.Consiste: Boolean;
begin
  if pgctrl_Instr.ActivePageIndex = 1 then //lista ou dados básicos
  begin
    if Trim(edt_nm_cliente.Text) = '' then
    begin
      BoxMensagem('O campo "Cliente" deve ser preenchido !',2);
      pgctrl_Instr.ActivePage := ts_dados_basicos;
      dbedt_cd_cliente.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
  Consiste := True;
end;

function TFrm_InstrucaoDesembaraco.Grava: Boolean;
var
  FlagEnviaEmail : Boolean;
  vCod           : string;
begin
  FlagEnviaEmail := False;
  if pgctrl_Instr.ActivePageIndex = 1 then //lista ou dados básicos
  begin
    try
      datm_main.db_broker.StartTransaction;
      if (Datm_InstrDesemb.qry_InstrucaoDesemb.State in [dsInsert, dsEdit]) then
      begin
        if ChkAutorizado.Checked then
        begin
          Datm_InstrDesemb.qry_InstrucaoDesembDT_AUTORIZACAO.AsDateTime       := Date;
          Datm_InstrDesemb.qry_InstrucaoDesembCD_USUARIO_AUTORIZACAO.AsString := str_cd_usuario;
          FlagEnviaEmail := True;
        end
        else
        begin
          EditDtAutorizacao.Text := '';
          Datm_InstrDesemb.qry_InstrucaoDesembCD_USUARIO_AUTORIZACAO.AsString := '';
        end;

        if Datm_InstrDesemb.qry_InstrucaoDesemb.State = dsInsert then
        begin
          vCod := ConsultaLookUPSQL(' SELECT RIGHT(''00000000'' + CONVERT(VARCHAR, ISNULL(MAX(SUBSTRING(ISNULL(ID_CODIGO, ''0''), 3, 8)) +1, ''1'')), 8) CONT ' +
                                    ' FROM TINSTRUCAO_DESEMBARACO                                                                                             ' +
                                    ' WHERE RIGHT(RTRIM(ID_CODIGO), 2) = RIGHT(CONVERT(VARCHAR, YEAR(GETDATE())), 2)                                          ', 'CONT');
          vCod := IIF(vCod = '00000000','00000001',vCod);
          Datm_InstrDesemb.qry_InstrucaoDesemb.FieldByName('ID_CODIGO').AsString     := 'ID' + vCod + '-' + FormatDateTime('YY', dt_server);
        end;
        
        Datm_InstrDesemb.qry_InstrucaoDesemb.Post;
        if FlagEnviaEmail then
          EnviaEmail;
        Pesquisa := Datm_InstrDesemb.qry_InstrucaoDesemb.FieldByName('ID_CODIGO').AsString;
        Datm_InstrDesemb.qry_InstrucaoDesemb.Close;
        Datm_InstrDesemb.qry_InstrucaoDesemb.Prepare;
        Datm_InstrDesemb.qry_InstrucaoDesemb.Open;
        Datm_InstrDesemb.qry_InstrucaoDesemb.Locate('ID_CODIGO',Pesquisa,[]);
        //Atualiza todos os itens da instrução de desembaraço com o Nº BL e Navio
        AtualizaTPO_Item('',True, False);
      end;

      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        Datm_InstrDesemb.qry_InstrucaoDesemb.Cancel;
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
    Btn_Mi(st_incluir, False, False, st_excluir);
  end
  else if pgctrl_Instr.ActivePageIndex = 2 then //Itens
  begin
    try
      datm_main.db_broker.StartTransaction;
      {if (datm_grupo.QryGrupoItem.State in [dsInsert, dsEdit]) then
      begin
        datm_grupo.QryGrupoItem.Post;
        datm_grupo.QryGrupoItem.Close;
        datm_grupo.QryGrupoItem.Open;
      end;}
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        {datm_grupo.QryGrupoItem.Cancel;
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;}
        TrataErro(E);
        Grava := False;
      end;
    end;
    Btn_Mi(st_incluir, False, False, st_excluir);
  end;
end;


procedure TFrm_InstrucaoDesembaraco.Cancelar;
begin
  if pgctrl_Instr.ActivePageIndex = 1 then //dados básicos
  begin
    try
      if Datm_InstrDesemb.qry_InstrucaoDesemb.State in [dsInsert, dsEdit] then
      begin
        Datm_InstrDesemb.qry_InstrucaoDesemb.Cancel;
        pgctrl_Instr.ActivePage := ts_dados_basicos;
      end;
    except
      BoxMensagem('Erro - cancelamento da operação. Tente cancelar novamente.', 2);
    end;
  end
  else if pgctrl_Instr.ActivePageIndex = 2 then //Pedidos/Itens/Parciais
  begin                            
    try
      if Datm_InstrDesemb.qry_InstrucaoDesemb.State in [dsInsert, dsEdit] then
      begin
        //Datm_InstrDesemb.QryGrupoItem.Cancel;
        pgctrl_Instr.ActivePage := ts_Itens;
      end;
    except
      BoxMensagem('Erro - cancelamento da operação. Tente cancelar novamente.', 2);
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir);
end;



procedure TFrm_InstrucaoDesembaraco.btn_excluirClick(Sender: TObject);
begin
  if pgctrl_Instr.ActivePageIndex in [0,1] then //dados básicos
  begin
    if not Datm_InstrDesemb.qry_InstrucaoDesemb.IsEmpty then
    begin
      if Datm_InstrDesemb.qry_InstrucaoDesemb.FieldByName('IN_AUTORIZADO').AsString <> '1' then
      begin
        if BoxMensagem('Esta Instrução de Desembaraço será excluída!' + #13#10 + 'Confirma exclusão?', 1) then
        try
          datm_main.db_broker.StartTransaction;
  
          LimpaFlagsTPOItem(Datm_InstrDesemb.qry_InstrucaoDesemb.FieldByName('ID_CODIGO').AsString);
          Dsql('TINSTRUCAO_DESEMBARACO_PEDIDO','ID_CODIGO = ''' + Datm_InstrDesemb.qry_InstrucaoDesemb.FieldByName('ID_CODIGO').AsString + '''');
          Datm_InstrDesemb.qry_InstrucaoDesemb.Delete;

          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            Datm_InstrDesemb.qry_InstrucaoDesemb.Cancel;
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
      end                                                                        
      else
        BoxMensagem('Esta Instrução de Desembaraço já está autorizada e não pode ser excluída !', 3);
    end
    else
      BoxMensagem('Não existe Instruções de Desembaraço para serem excluídas', 3);
    pgctrl_Instr.ActivePage := ts_lista;
  end
  else if pgctrl_Instr.ActivePageIndex = 2 then //Itens
  begin
    if not Datm_InstrDesemb.qry_ItensInstrucaoDesemb.IsEmpty then
    begin
      if Datm_InstrDesemb.qry_InstrucaoDesemb.FieldByName('IN_AUTORIZADO').AsString = '0' then
      begin
        if BoxMensagem('Este item da Instrução de Desembaraço será excluído!' + #13#10 + 'Confirma exclusão?', 1) then
        begin
          try
            datm_main.db_broker.StartTransaction;
            //Atualiza Flag na tpo_item como item já utilizado em uma instrução de desembaraço
            AtualizaTPO_Item('0', False, True);

            Datm_InstrDesemb.qry_ItensInstrucaoDesemb.Delete;
            datm_main.db_broker.Commit;
          except
            on E: Exception do
            begin
              Datm_InstrDesemb.qry_ItensInstrucaoDesemb.Cancel;
              if datm_main.db_broker.InTransaction then
                datm_main.db_broker.Rollback;
              TrataErro(E);
            end;
          end;
        end;
      end
      else
        BoxMensagem('Não é possível excluir um item pois a Instrução de Desembaraço já foi autorizada !', 3);
      pgctrl_Instr.ActivePage := ts_Itens;
    end
    else
      BoxMensagem('Não existe itens para serem excluídos', 3);
  end;
end;

procedure TFrm_InstrucaoDesembaraco.EditNrPedidoExit(Sender: TObject);
begin
  AtualizaGridItens;
end;

procedure TFrm_InstrucaoDesembaraco.EditNrPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_Return then
    AtualizaGridItens;
end;

procedure TFrm_InstrucaoDesembaraco.AtualizaGridItens;
begin
  if EditNrPedido.Text <> '' then
  begin
    with Datm_InstrDesemb do
    begin
      qry_ItensPedido.Close;
      if ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                           ' FROM TPO ' +
                           ' WHERE NR_PROCESSO = ' + QuotedStr(EditNrPedido.Text) +
                           '   AND CD_EMPRESA = ' + QuotedStr(dbedt_cd_cliente.Text), 'QTD') = '0' then
        MessageDlg('Pedido não encontrado para este cliente.', mtInformation, [mbOk], 0)
      else if ConsultaLookUPSQL(' SELECT RTRIM(CD_EXPORTADOR) AS CD_EXPORTADOR ' +
                                ' FROM TPO ' +
                                ' WHERE NR_PROCESSO = ' + QuotedStr(EditNrPedido.Text) +
                                '   AND CD_EMPRESA = ' + QuotedStr(dbedt_cd_cliente.Text), 'CD_EXPORTADOR') = '' then
        MessageDlg('Exportador não preenchido para o pedido.', mtInformation, [mbOk], 0)
      else
      begin
        if (ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                              ' FROM TINSTRUCAO_DESEMBARACO_PEDIDO ' +
                              ' WHERE ID_CODIGO = ' + QuotedStr(Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString), 'QTD') <> '0') and
           (ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                              ' FROM TPO ' +
                              ' WHERE NR_PROCESSO = ' + QuotedStr(EditNrPedido.Text) +
                              '   AND CD_AREA IN (SELECT PO.CD_AREA ' +
                              '                   FROM TINSTRUCAO_DESEMBARACO_PEDIDO IDP INNER JOIN TPO PO ON PO.NR_PROCESSO = IDP.NR_REFERENCIA ' +
                              '                   WHERE ID_CODIGO = ' + QuotedStr(Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString) + ')', 'QTD') = '0') then
           MessageDlg('A Área para o pedido informado é diferente da Área dos pedidos já incluídos nesta Instrução.', mtInformation, [mbOk], 0)
        else
        begin
          if ConsultaLookUPSQL(' SELECT CD_ANALISTA_COMISSARIA ' +
                               ' FROM TPROCESSO ' +
                               ' WHERE NR_REFERENCIA = ' + QuotedStr(EditNrPedido.Text) +
                               '   AND CD_CLIENTE    = ' + QuotedStr(Datm_InstrDesemb.qry_InstrucaoDesembCD_CLIENTE.AsString), 'CD_ANALISTA_COMISSARIA') <> Datm_InstrDesemb.qry_InstrucaoDesembCD_USUARIO.AsString then
            MessageDlg('O Analista do Pedido é diferente do Usuário da Instrução.', mtInformation, [mbOk], 0)
          else
          begin
            qry_ItensPedido.ParamByName('NR_PEDIDO').AsString  := EditNrPedido.Text;
            qry_ItensPedido.ParamByName('CD_EMPRESA').AsString := dbedt_cd_cliente.Text;
            qry_ItensPedido.ParamByName('CD_GRUPO').AsString   := ConsultaLookUp('TEMPRESA_NAC', 'CD_EMPRESA', qry_InstrucaoDesembCD_CLIENTE.AsString, 'CD_GRUPO');
            qry_ItensPedido.Open;
            ChkTodos.Enabled := not(qry_ItensPedido.IsEmpty);
            if qry_ItensPedido.IsEmpty then
            begin
              BoxMensagem('Não existem itens para o pedido digitado !', 2);
              EditNrPedido.Text := '';
              EditNrPedido.SetFocus;
              EditNrPedido.SelectAll;
              ChkTodos.Checked := False;
            end; // Sem itens
          end; // Mesmo usuário do Pedido e da Instrução
        end; // Área diferente da dos pedidos incluidos na instrução
      end; // else
    end; // Exportador não preechido
  end; // Pedido não encontrado
end;

procedure TFrm_InstrucaoDesembaraco.ChkTodosClick(Sender: TObject);
begin
  Datm_InstrDesemb.qry_ItensPedido.First;
  while not Datm_InstrDesemb.qry_ItensPedido.Eof do
  begin
    GridItens.SelectedRows.CurrentRowSelected := ChkTodos.Checked;
    Datm_InstrDesemb.qry_ItensPedido.Next;
  end;
end;

procedure TFrm_InstrucaoDesembaraco.GridItensCellClick(Column: TColumn);
begin
  ChkTodos.Checked := False;
end;

procedure TFrm_InstrucaoDesembaraco.ChkAutorizadoClick(Sender: TObject);
begin
  if (Datm_InstrDesemb.qry_InstrucaoDesemb.State in [dsInsert, dsEdit]) then
  begin
    Btn_Mi(False, True, True, False);
    if ChkAutorizado.Checked then
    begin
      Datm_InstrDesemb.qry_InstrucaoDesembDT_AUTORIZACAO.AsDateTime       := Date;
      Datm_InstrDesemb.qry_InstrucaoDesembCD_USUARIO_AUTORIZACAO.AsString := str_cd_usuario;
      EditUsuarioAutorizou.Text := ConsultaLookUp('TUSUARIO', 'CD_USUARIO', str_cd_usuario, 'NM_USUARIO');
    end
    else
    begin
      EditDtAutorizacao.Text    := '';
      EditUsuarioAutorizou.Text := '';
    end;
  end;
end;

procedure TFrm_InstrucaoDesembaraco.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFrm_InstrucaoDesembaraco.btn_co_clienteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(Datm_InstrDesemb.qry_InstrucaoDesemb) then
      if (Sender as TSpeedButton).Enabled then
        Datm_InstrDesemb.qry_InstrucaoDesembCD_CLIENTE.AsString := ConsultaOnLineEx('TEMPRESA_NAC', 'Cliente',
           ['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA'], ['Código', 'Descrição', 'Apelido', 'CNPJ', 'Endereço'],
           'CD_EMPRESA', frm_main.mi_cad_emp_nac, 1 ,dbedt_cd_cliente.text);
  end
  else
    edt_nm_cliente.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', dbedt_cd_cliente.Text, 'NM_EMPRESA')
end;

procedure TFrm_InstrucaoDesembaraco.dbedt_cd_clienteKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_cliente then
      btn_co_clienteClick(btn_co_cliente);
  end;
end;

procedure TFrm_InstrucaoDesembaraco.dbedt_cd_clienteExit(Sender: TObject);
begin
  ValidCodigo(dbedt_cd_cliente);
end;

procedure TFrm_InstrucaoDesembaraco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Datm_InstrDesemb.Free;
  Action := caFree;
end;

procedure TFrm_InstrucaoDesembaraco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := not(PnlIncItens.Visible);
end;

procedure TFrm_InstrucaoDesembaraco.AtualizaTPO_Item(const cItemJaUtilizado : string; cTodos,
  cLimpaDados : Boolean);

  procedure UpdateTPO_Item;
  begin
    with TQuery.Create(Application)do
    begin
      DatabaseName := 'DBBROKER';
      Sql.Add('UPDATE TPO_ITEM');
      Sql.Add('SET');
      if cItemJaUtilizado <> '' then
        Sql.Add('  IN_UTILIZADO_INSTR_DESEMB =:IN_UTILIZADO_INSTR_DESEMB, ');
      Sql.Add('  ID_CODIGO_INSTR_DESEMB    =:ID_CODIGO_INSTR_DESEMB, ');
      Sql.Add('  NR_CONHECIMENTO           =:NR_CONHECIMENTO, ');
      Sql.Add('  CD_EMBARCACAO             =:CD_EMBARCACAO ');
      Sql.Add('WHERE');
      Sql.Add('   NR_PROCESSO     =:NR_PROCESSO and');
      Sql.Add('   NR_ITEM_CLIENTE =:NR_ITEM_CLIENTE and');
      Sql.Add('   NR_PARCIAL      =:NR_PARCIAL');

      if cItemJaUtilizado <> '' then
        ParamByName('IN_UTILIZADO_INSTR_DESEMB').AsString := cItemJaUtilizado;
      ParamByName('ID_CODIGO_INSTR_DESEMB').AsString      := IIF(not(cLimpaDados),Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString,'');
      ParamByName('NR_CONHECIMENTO').AsString             := IIF(not(cLimpaDados),EditNumBL.Text, '');
      ParamByName('CD_EMBARCACAO').AsString               := IIF(not(cLimpaDados),EditNavioParcial.Text, '');

      ParamByName('NR_PROCESSO').AsString                 := Datm_InstrDesemb.qry_ItensInstrucaoDesemb.FieldByName('NR_REFERENCIA').AsString;
      ParamByName('NR_ITEM_CLIENTE').AsString             := Datm_InstrDesemb.qry_ItensInstrucaoDesemb.FieldByName('NR_ITEM_PO').AsString;
      ParamByName('NR_PARCIAL').AsInteger                 := Datm_InstrDesemb.qry_ItensInstrucaoDesemb.FieldByName('NR_PARCIAL').AsInteger;

      ExecSql;
      Free;
    end;
  end;

begin
  with Datm_InstrDesemb do
  begin
    if not qry_ItensInstrucaoDesemb.IsEmpty then
    begin
      if cTodos then
      begin
        qry_ItensInstrucaoDesemb.First;
        while not qry_ItensInstrucaoDesemb.Eof do
        begin
          UpdateTPO_Item;
          qry_ItensInstrucaoDesemb.Next;
        end;
      end
      else
        UpdateTPO_Item;
    end;
  end;
end;


procedure TFrm_InstrucaoDesembaraco.EditCdUsuarioAutorizouChange(Sender: TObject);
begin
  EditUsuarioAutorizou.Text := ConsultaLookUp('TUSUARIO', 'CD_USUARIO', Datm_InstrDesemb.qry_InstrucaoDesembCD_USUARIO_AUTORIZACAO.AsString, 'NM_USUARIO');
end;

procedure TFrm_InstrucaoDesembaraco.cb_ordemChange(Sender: TObject);
begin
  // Trocar para a ordem selecionada
  case cb_ordem.ItemIndex of
    0 : Datm_InstrDesemb.qry_InstrucaoDesemb.SQL[Datm_InstrDesemb.qry_InstrucaoDesemb.Sql.Count-1] := 'ORDER BY RIGHT(RTRIM(ID_CODIGO), 2), ID_CODIGO';
    1 : Datm_InstrDesemb.qry_InstrucaoDesemb.SQL[Datm_InstrDesemb.qry_InstrucaoDesemb.Sql.Count-1] := 'ORDER BY D.AP_EMPRESA';
    2 : Datm_InstrDesemb.qry_InstrucaoDesemb.SQL[Datm_InstrDesemb.qry_InstrucaoDesemb.Sql.Count-1] := 'ORDER BY A.DT_CRIACAO';
  end;
  Datm_InstrDesemb.qry_InstrucaoDesemb.Open;
end;

procedure TFrm_InstrucaoDesembaraco.edt_chaveChange(Sender: TObject);
begin
  // Procurar conforme chave escolhida
  case cb_ordem.ItemIndex of
    0: Datm_InstrDesemb.qry_InstrucaoDesemb.Locate('ID_CODIGO' ,edt_chave.Text,[loPartialKey,loCaseInsensitive]);
    1: Datm_InstrDesemb.qry_InstrucaoDesemb.Locate('AP_EMPRESA',edt_chave.Text,[loPartialKey,loCaseInsensitive]);
    2: begin
         if length(edt_chave.Text) = 10 then //data completa DD/MM/YYYY
           Datm_InstrDesemb.qry_InstrucaoDesemb.Locate('DT_CRIACAO',edt_chave.Text,[loPartialKey,loCaseInsensitive]);
       end;
  end;

end;

procedure TFrm_InstrucaoDesembaraco.btnConsultaAnalistaClick(
  Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(Datm_InstrDesemb.qry_InstrucaoDesemb) then
      Datm_InstrDesemb.qry_InstrucaoDesembCD_RESPONSAVEL.AsString := ConsultaOnLineExSQL(
         'SELECT CD_USUARIO, NM_USUARIO, NM_EMAIL FROM TUSUARIO (NOLOCK) WHERE CD_CARGO <> ''040''',
         'Analistas Indaiá', ['CD_USUARIO', 'NM_USUARIO', 'NM_EMAIL'], ['Código', 'Nome', 'Email'],
         'CD_USUARIO', nil, Datm_InstrDesemb.qry_InstrucaoDesembCD_RESPONSAVEL.AsString);
  end
  else
    edtNomeAnalista.Text := ConsultaLookup('TUSUARIO', 'CD_USUARIO', dbedtCodigoAnalista.Text, 'NM_USUARIO');
end;

procedure TFrm_InstrucaoDesembaraco.dbedtCodigoAnalistaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedtCodigoAnalista then
      btnConsultaAnalistaClick(btnConsultaAnalista);

    if Sender   = EditNavioParcial           then
      BtnConsultaEmbarcacaoItemParcialClick(BtnConsultaEmbarcacaoItemParcial);
  end;
end;

procedure TFrm_InstrucaoDesembaraco.GeraExcel(pMostraPlanilha : Boolean);
var
  Excel, xlWorkB, oSheet: OleVariant;
  vContGeradas, vContFechadas, vContDeclinadas, vCorLinha,
  Linha, I,J, vContEfetuados, vContPropostas : Integer;
  vCondPagto, vContatos,a : string;

  procedure PintaBordas(vCol,vLinha : Integer);
  begin
    //TOP
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$00000008].Weight := $00000002;
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$00000008].Color  := clBlack;

    //Right
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$0000000A].Weight := $00000002;
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$0000000A].Color  := clBlack;

    //Left
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$00000007].Weight := $00000002;
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$00000007].Color  := clBlack;

    //Bottom
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$00000009].Weight := $00000002;
    oSheet.Cells[ vLinha, vCol ].Borders.Item[$00000009].Color  := clBlack;
  end;
begin
  try
    Excel := CreateOLEObject('Excel.Application');
    xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\InstrucaoDesembaraco.XLS' );
    Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\InstrucaoDesembaraco_' + Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString + '.XLS');
    oSheet := Excel.WorkBooks[1].Worksheets[1];
  except
    Application.MessageBox('Verifique se a planilha já está aberta. Salve-a e feche-a!', 'Erro na criação da Planilha.', MB_OK + MB_ICONERROR) ;
    Exit;
  end;

  // Código abaixo incluido por Michel em 08/06/2010 para inserir na planilha as despesas e as observações
  oSheet.Cells[ 29, 3 ].Value  := StringReplace(Datm_InstrDesemb.qry_InstrucaoDesembTX_OBSERVACOES.AsString, #13, '', [rfReplaceAll]);
  oSheet.Rows[29].AutoFit;

  with TQuery.Create(Application)do
  begin
    DatabaseName := 'DBBROKER';
    // Código abaixo incluido por Michel em 08/06/2010 para inserir na planilha as despesas e as observações
    SQL.Add('SELECT NM_ITEM, NR_FATURA, VL_ITEM');
    SQL.Add('FROM TINSTRUCAO_DESEMBARACO_DESPESAS');
    SQL.Add('WHERE ID_CODIGO = :ID_CODIGO');

    ParamByName('ID_CODIGO').AsString := Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString;
    try
      Open;
    except
      on E: Exception do
      begin
        Application.MessageBox(PAnsiChar('Erro executando a consulta das despesas.'#13'Mensagem original: ''' + E.Message + '''.'), 'Erro na criação da Planilha.', MB_OK + MB_ICONERROR) ;
        Excel.Quit;
        Exit;
      end;
    end;

    Linha := 25;
    First;
    while not Eof do
    begin
      oSheet.Cells[ Linha, 1 ].EntireRow.Insert;
      if FieldByName('NR_FATURA').AsString = '' then
        oSheet.Cells[ Linha, 3 ].Value  := FieldByName('NM_ITEM').AsString
      else
        oSheet.Cells[ Linha, 3 ].Value  := FieldByName('NM_ITEM').AsString + ' (Invoice: ' + FieldByName('NR_FATURA').AsString + ')';
      oSheet.Cells[ Linha, 8 ].Value  := FieldByName('VL_ITEM').AsFloat;
      Next;
    end;

    Close;
    SQL.Clear;
    Sql.Add('SELECT DISTINCT RTRIM(U.NM_USUARIO) AS NM_USUARIO');
    Sql.Add('FROM TINSTRUCAO_DESEMBARACO ID');
    Sql.Add('   INNER JOIN TINSTRUCAO_DESEMBARACO_PEDIDO IDP ON IDP.ID_CODIGO = ID.ID_CODIGO');
    Sql.Add('   INNER JOIN TESTAGIO_PROCESSO EP ON EP.NR_REFERENCIA = IDP.NR_REFERENCIA');
    Sql.Add('                                  AND EP.CD_EMPRESA    = ID.CD_CLIENTE');
    Sql.Add('   INNER JOIN TPROCESSO P ON P.NR_PROCESSO = EP.NR_PROCESSO_ADM');
    Sql.Add('   INNER JOIN TUSUARIO U ON U.CD_USUARIO = P.CD_ANALISTA_CLIENTE');
    Sql.Add('WHERE ID.ID_CODIGO = :ID_CODIGO');
    Sql.Add('ORDER BY U.NM_USUARIO');
    ParamByName('ID_CODIGO').AsString := Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString;
    Open;
    First;
    vContatos := '';
    while not Eof do
    begin
      vContatos := vContatos + ', ' + FieldByName('NM_USUARIO').AsString;
      Next;
    end;
    System.Delete(vContatos, 1, 2);
    oSheet.Cells[18, 4].Value := vContatos;

    Close;
    SQL.Clear;
    //
    Sql.Add(' SELECT S.CD_VIA_TRANSPORTE, PO.CD_IMPORTADOR, PO.CD_EXPORTADOR, PO.CD_FABRICANTE, PO.CD_AREA, PO.CD_INCOTERM,                                                     ');
    Sql.Add('PO.IN_ENTREPOSTO, PO.CD_SERVICO, P.NR_CONHECIMENTO, P.CD_ANALISTA_COMISSARIA, POI.IN_NECESSITA_LI,POI.IN_DRAWBACK,                                                 ');
    Sql.Add('POI.NR_PROCESSO, POI.NR_ITEM, POI.NR_ITEM_CLIENTE, POI.QT_INICIAL, POI.CD_UNID_MEDIDA, POI.CD_NCM_SH,                                                              ');
    Sql.Add('POI.NR_CONHECIMENTO, POI.IN_NECESSITA_LI, EN.AP_EMPRESA AP_IMPORTADOR, EE.AP_EMPRESA AP_EXPORTADOR,                                                                ');
    Sql.Add(' UM.NM_SIGLA, U.AP_USUARIO, VT.NM_VIA_TRANSP, A.NM_AREA, P.CD_INCOTERM, INC.DESCRICAO DESC_INCOTERM,                                                               ');
    Sql.Add(' POI.CD_MERCADORIA, POI.VL_TOTAL, POI.NR_FATURA, TP.NM_PEDIDO, EEF.AP_EMPRESA AP_FABRICANTE,                     ');
    Sql.Add(' P.DIAS_CONDICAO_PAGTO, P.CONDICAO_PAGTO, IDP.NR_PARCIAL, EE.NR_CLIENTE, EN.CD_EMPRESA CD_IMPORTADOR,');
    Sql.Add(' POI.CD_FABRICANTE CD_FABRICANTE_ITEM ,');
    Sql.Add('(case ISNULL(POI.CD_MERC_FORNEC,'''') when '''' then TM.AP_MERCADORIA ');
    Sql.Add(' else RTRIM(TM.AP_MERCADORIA)+"-"+ ISNULL(POI.CD_MERC_FORNEC,'''') END) AS MERCADORIA_FORNECEDOR,');
    Sql.Add(' (SELECT REPLACE(master.dbo.RowConcat(distinct ');
    Sql.Add('     CASE WHEN ISNULL(TP.NM_PEDIDO, '''') = '''' THEN "*" ');
    Sql.Add('       ELSE LTRIM(RTRIM( TP.NM_PEDIDO)) +" - "+ LTRIM(RTRIM(POI.NR_PROCESSO))END), "*," , '''') AS TIPO_MATERIAL1                                                   ');
    Sql.Add(' FROM TINSTRUCAO_DESEMBARACO_PEDIDO  IDP1 (NOLOCK)  ');
    Sql.Add('  INNER JOIN TINSTRUCAO_DESEMBARACO ID  (NOLOCK) ON ID.ID_CODIGO = IDP1.ID_CODIGO                                                                                   ');
    Sql.Add('  INNER JOIN TPO_ITEM               POI (NOLOCK) ON POI.NR_PROCESSO     = IDP1.NR_REFERENCIA                                                                        ');
    Sql.Add('                                               AND POI.NR_ITEM_CLIENTE = IDP1.NR_ITEM_PO AND POI.NR_PARCIAL = IDP1.NR_PARCIAL AND POI.CD_EMPRESA = ID.CD_CLIENTE    ');
    Sql.Add(' INNER JOIN TPROCESSO              P   (NOLOCK) ON P.NR_REFERENCIA = POI.NR_PROCESSO AND P.CD_CLIENTE = POI.CD_EMPRESA   ');
    Sql.Add(' LEFT  JOIN TTP_PEDIDO             TP  (NOLOCK) ON TP.CD_PEDIDO = P.CD_TP_PEDIDO ');
    Sql.Add(' WHERE IDP1.ID_CODIGO  = IDP.ID_CODIGO  ');
    Sql.Add('  AND P.IN_CANCELADO = "0") AS TIPO_MATERIAL ');
    Sql.Add(' FROM TINSTRUCAO_DESEMBARACO_PEDIDO   IDP (NOLOCK)');
    Sql.Add('  INNER JOIN TINSTRUCAO_DESEMBARACO ID  (NOLOCK) ON ID.ID_CODIGO = IDP.ID_CODIGO  ');
    Sql.Add('  INNER JOIN TPO_ITEM               POI (NOLOCK) ON POI.NR_PROCESSO     = IDP.NR_REFERENCIA ');
    Sql.Add('                                             AND POI.NR_ITEM_CLIENTE = IDP.NR_ITEM_PO ');
    Sql.Add('                                            AND POI.NR_PARCIAL      = IDP.NR_PARCIAL ');
    Sql.Add('                                           AND POI.CD_EMPRESA      = ID.CD_CLIENTE ');
    Sql.Add('  INNER JOIN TMERCADORIA            TM           ON TM.CD_MERCADORIA=POI.CD_MERCADORIA');
    Sql.Add('INNER JOIN TPO                    PO  (NOLOCK) ON PO.NR_PROCESSO = POI.NR_PROCESSO');
    Sql.Add('                                               AND PO.CD_EMPRESA  = POI.CD_EMPRESA ');
    Sql.Add('  INNER JOIN TPROCESSO              P   (NOLOCK) ON P.NR_REFERENCIA = POI.NR_PROCESSO ');
    Sql.Add('                                                AND P.CD_CLIENTE    = POI.CD_EMPRESA ');
    Sql.Add(' INNER JOIN TEMPRESA_NAC           EN  (NOLOCK) ON EN.CD_EMPRESA = PO.CD_IMPORTADOR ');
    Sql.Add(' INNER JOIN TEMPRESA_EST           EE  (NOLOCK) ON EE.CD_EMPRESA = PO.CD_EXPORTADOR');
    Sql.Add('  INNER JOIN TUNID_MEDIDA_BROKER    UM  (NOLOCK) ON UM.CD_UNID_MEDIDA = POI.CD_UNID_MEDIDA ');
    Sql.Add(' LEFT  JOIN TUSUARIO               U   (NOLOCK) ON U.CD_USUARIO = P.CD_ANALISTA_COMISSARIA ');
    Sql.Add(' INNER JOIN TSERVICO               S   (NOLOCK) ON S.CD_SERVICO = PO.CD_SERVICO ');
    Sql.Add(' INNER JOIN TVIA_TRANSP_BROKER     VT  (NOLOCK) ON VT.CD_VIA_TRANSP = S.CD_VIA_TRANSPORTE ');
    Sql.Add(' INNER JOIN TAREA                  A   (NOLOCK) ON A.CD_AREA = P.CD_AREA ');
    Sql.Add(' LEFT  JOIN TINCOTERMS_VENDA       INC (NOLOCK) ON INC.CODIGO = P.CD_INCOTERM ');
    Sql.Add(' LEFT  JOIN TTP_PEDIDO             TP  (NOLOCK) ON TP.CD_PEDIDO = P.CD_TP_PEDIDO  ');
    Sql.Add('   LEFT  JOIN TEMPRESA_EST           EEF (NOLOCK) ON EEF.CD_EMPRESA = POI.CD_FABRICANTE  ');
    Sql.Add(' WHERE IDP.ID_CODIGO  = :ID_CODIGO  ');
    Sql.Add('  AND P.IN_CANCELADO = "0" ');

    ParamByName('ID_CODIGO').AsString := Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString;
    {
    Sql.Add('SELECT S.CD_VIA_TRANSPORTE, PO.CD_IMPORTADOR, PO.CD_EXPORTADOR, PO.CD_FABRICANTE, PO.CD_AREA, PO.CD_INCOTERM, ');
    Sql.Add('       PO.IN_ENTREPOSTO, PO.CD_SERVICO, P.NR_CONHECIMENTO, P.CD_ANALISTA_COMISSARIA, POI.IN_NECESSITA_LI,POI.IN_DRAWBACK,     ');
    Sql.Add('       POI.NR_PROCESSO, POI.NR_ITEM, POI.NR_ITEM_CLIENTE, POI.QT_INICIAL, POI.CD_UNID_MEDIDA, POI.CD_NCM_SH,  ');
    Sql.Add('       POI.NR_CONHECIMENTO, POI.IN_NECESSITA_LI, EN.AP_EMPRESA AP_IMPORTADOR, EE.AP_EMPRESA AP_EXPORTADOR,    ');
    Sql.Add('       UM.NM_SIGLA, U.AP_USUARIO, VT.NM_VIA_TRANSP, A.NM_AREA, P.CD_INCOTERM, INC.DESCRICAO DESC_INCOTERM,    ');
    Sql.Add('       POI.CD_MERCADORIA, POI.VL_TOTAL, POI.NR_FATURA, TP.NM_PEDIDO, EEF.AP_EMPRESA AP_FABRICANTE,            ');
    Sql.Add('       P.DIAS_CONDICAO_PAGTO, P.CONDICAO_PAGTO, IDP.NR_PARCIAL, EE.NR_CLIENTE, EN.CD_EMPRESA CD_IMPORTADOR,   ');
    Sql.Add('       POI.CD_FABRICANTE CD_FABRICANTE_ITEM                                                                   ');
    Sql.Add('FROM TINSTRUCAO_DESEMBARACO_PEDIDO   IDP (NOLOCK)                                                             ');
    Sql.Add('   INNER JOIN TINSTRUCAO_DESEMBARACO ID  (NOLOCK) ON ID.ID_CODIGO = IDP.ID_CODIGO                             ');
    Sql.Add('   INNER JOIN TPO_ITEM               POI (NOLOCK) ON POI.NR_PROCESSO     = IDP.NR_REFERENCIA                  ');
    Sql.Add('                                                 AND POI.NR_ITEM_CLIENTE = IDP.NR_ITEM_PO                     ');
    Sql.Add('                                                 AND POI.NR_PARCIAL      = IDP.NR_PARCIAL                     ');
    Sql.Add('                                                 AND POI.CD_EMPRESA      = ID.CD_CLIENTE                      ');
    Sql.Add('   INNER JOIN TPO                    PO  (NOLOCK) ON PO.NR_PROCESSO = POI.NR_PROCESSO                         ');
    Sql.Add('                                                 AND PO.CD_EMPRESA  = POI.CD_EMPRESA                          ');
    Sql.Add('   INNER JOIN TPROCESSO              P   (NOLOCK) ON P.NR_REFERENCIA = POI.NR_PROCESSO                        ');
    Sql.Add('                                                 AND P.CD_CLIENTE    = POI.CD_EMPRESA                         ');
    Sql.Add('   INNER JOIN TEMPRESA_NAC           EN  (NOLOCK) ON EN.CD_EMPRESA = PO.CD_IMPORTADOR                         ');
    Sql.Add('   INNER JOIN TEMPRESA_EST           EE  (NOLOCK) ON EE.CD_EMPRESA = PO.CD_EXPORTADOR                         ');
    Sql.Add('   INNER JOIN TUNID_MEDIDA_BROKER    UM  (NOLOCK) ON UM.CD_UNID_MEDIDA = POI.CD_UNID_MEDIDA                   ');
    Sql.Add('   LEFT  JOIN TUSUARIO               U   (NOLOCK) ON U.CD_USUARIO = P.CD_ANALISTA_COMISSARIA                  ');
    Sql.Add('   INNER JOIN TSERVICO               S   (NOLOCK) ON S.CD_SERVICO = PO.CD_SERVICO                             ');
    Sql.Add('   INNER JOIN TVIA_TRANSP_BROKER     VT  (NOLOCK) ON VT.CD_VIA_TRANSP = S.CD_VIA_TRANSPORTE                   ');
    Sql.Add('   INNER JOIN TAREA                  A   (NOLOCK) ON A.CD_AREA = P.CD_AREA                                    ');
    Sql.Add('   LEFT  JOIN TINCOTERMS_VENDA       INC (NOLOCK) ON INC.CODIGO = P.CD_INCOTERM                               ');
    Sql.Add('   LEFT  JOIN TTP_PEDIDO             TP  (NOLOCK) ON TP.CD_PEDIDO = P.CD_TP_PEDIDO                            ');
    Sql.Add('   LEFT  JOIN TEMPRESA_EST           EEF (NOLOCK) ON EEF.CD_EMPRESA = POI.CD_FABRICANTE                       ');
    Sql.Add('WHERE IDP.ID_CODIGO  = :ID_CODIGO                                                                             ');
    Sql.Add('  AND P.IN_CANCELADO = "0"                                                                                    '); }

    try
      Open;
    except
      on E: Exception do
      begin
        Application.MessageBox(PAnsiChar('Erro executando a consulta.'#13'Mensagem original: ''' + E.Message + '''.'), 'Erro na criação da Planilha.', MB_OK + MB_ICONERROR) ;
        Excel.Quit;
        Exit;
      end;
    end;

    try
      if FieldByName('CONDICAO_PAGTO').AsString      = 'E' then
        vCondPagto := 'INVOICE - Especial'
      else if FieldByName('CONDICAO_PAGTO').AsString = 'R' then
        vCondPagto := 'Registro da DI'
      else if FieldByName('CONDICAO_PAGTO').AsString = 'C' then
        vCondPagto := 'Conhecimento Embarque'
      else if FieldByName('CONDICAO_PAGTO').AsString = 'I' then
        vCondPagto := 'INVOICE'
      else if FieldByName('CONDICAO_PAGTO').AsString = 'P' then
        vCondPagto := 'PROFORMA'
      else if FieldByName('CONDICAO_PAGTO').AsString = 'A' then
        vCondPagto := 'ANTECIPADO'
      else if FieldByName('CONDICAO_PAGTO').AsString = 'V' then
        vCondPagto := 'A Vista';

      if (FieldByName('DIAS_CONDICAO_PAGTO').AsString = '') and (FieldByName('CONDICAO_PAGTO').AsString = '') then
        vCondPagto := 'Sem cobertura cambial'
      else if (FieldByName('DIAS_CONDICAO_PAGTO').AsString <> '') then
        vCondPagto := FieldByName('DIAS_CONDICAO_PAGTO').AsString + ' dias do(a) ' + vCondPagto;


      oSheet.Cells[2, 2].Value := 'Instrução de Desembaraço - ' + Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString; //Título

      oSheet.Cells[ 5, 4].Value := FieldByName('NM_VIA_TRANSP').AsString;  // Modalidade
      oSheet.Cells[ 6, 4].Value := FieldByName('AP_EXPORTADOR').AsString;  // Exportador
      oSheet.Cells[ 7, 4].Value := FieldByName('CD_EXPORTADOR').AsString;  // Exportador (Cód MyIndaia)
      oSheet.Cells[ 8, 4].Value := FieldByName('NR_CLIENTE').AsString;     // Exportador (Cód Cliente)
      oSheet.Cells[ 9, 4].Value := FieldByName('CD_IMPORTADOR').AsString + ' - ' + FieldByName('AP_IMPORTADOR').AsString;  // Importador
      oSheet.Cells[10, 4].Value := vCondPagto;   //Fechamento de cambio
      oSheet.Cells[11, 4].Value := FieldByName('DESC_INCOTERM').AsString;  //Incoterm
      oSheet.Cells[12, 4].Value := IfThen(FieldByName('IN_NECESSITA_LI').AsBoolean, 'Sim', 'Não'); //Necessidade de LI
      oSheet.Cells[13, 4].Value := IfThen(FieldByName('IN_ENTREPOSTO').AsBoolean, 'Sim', 'Não'); //Entreposto
      //oSheet.Cells[14, 4].Value := FieldByName('NM_PEDIDO').AsString;
      oSheet.Cells[14, 4].Value := FieldByName('TIPO_MATERIAL').AsString;//tipos de material
      oSheet.Cells[15, 4].Value := FieldByName('NM_AREA').AsString; //Area
      oSheet.Cells[16, 4].Value := FieldByName('AP_USUARIO').AsString;//Analista
      oSheet.Cells[17, 4].Value := EditNumBL.Text;  //FieldByName('NR_CONHECIMENTO').AsString; //BL

      Linha := 22;
      First;
      while not Eof do
      begin
        oSheet.Cells[ Linha, 1 ].EntireRow.Insert;
        oSheet.Cells[ Linha, 3 ].Value  := FieldByName('NR_PROCESSO').AsString;
        oSheet.Cells[ Linha, 4 ].Value  := FieldByName('NR_ITEM_CLIENTE').AsString + ' (' + FieldByName('NR_PARCIAL').AsString + ')';
        oSheet.Cells[ Linha, 5 ].Value  := FieldByName('QT_INICIAL').AsFloat;
        oSheet.Cells[ Linha, 6 ].Value  := FieldByName('NM_SIGLA').AsString;
        oSheet.Cells[ Linha, 7 ].Value  := FieldByName('CD_MERCADORIA').AsString;
        oSheet.Cells[ Linha, 8 ].Value  := FieldByName('VL_TOTAL').AsFloat;
        oSheet.Cells[ Linha, 9 ].Value  := FieldByName('CD_FABRICANTE_ITEM').AsString + ' - ' + FieldByName('AP_FABRICANTE').AsString;
        oSheet.Cells[ Linha, 10 ].Value := FieldByName('NR_FATURA').AsString;
        oSheet.Cells[ Linha, 11 ].Value := VerificaNumLI(FieldByName('NR_PROCESSO').AsString, FieldByName('NR_ITEM_CLIENTE').AsString);//'Num-LI';
        if  trim(FieldByName('IN_DRAWBACK').AsString)='1' then
        begin
          oSheet.Cells[ Linha, 12 ].Value := 'Sim';
        end
        else
        begin
          oSheet.Cells[ Linha, 12 ].Value := 'Não';
        end;
        oSheet.Cells[ Linha, 13 ].Value  := FieldByName('MERCADORIA_FORNECEDOR').AsString;
        Next;
      end;
      Excel.ActiveWorkBook.Save;
    finally
      // Linha abaixo comentada por estar dentro do FINALLY e sempre vai mostrar como erro, mesmo quando não houver - Michel - 09/06/2010
      //Application.MessageBox('Verifique se a planilha já está aberta. Salve-a e feche-a!', 'Erro na criação da Planilha.', MB_OK + MB_ICONERROR) ;
      if pMostraPlanilha then
        Excel.Visible := True
      else
        Excel.Quit;
    end;
    Close;
    Free;
  end;
end;

procedure TFrm_InstrucaoDesembaraco.EnviaEmail;
var
  {IdMessage1: TIdMessage;
  IdSMTP1   : TIdSMTP;
  NewText   : TIdText;}
  vTo       : String;
  ArquivoPai: String;
  QtdPai    : Integer;
  PathDig   : String;
  Cliente   : String;
  Modal     : String;
  Assunto   : String;
  Body: TStrings;
begin
{---envia e-mail para o Responsável pelo Desembaraço--------------------}
  {IdMessage1 := TIdMessage.Create(application);
  IdSMTP1    := TIdSMTP.Create(application);
  NewText    := TIdText.Create(IdMessage1.MessageParts);}
  Body := TStringList.Create;

  Datm_InstrDesemb.qry_Arquivos.Close;
  Datm_InstrDesemb.qry_Arquivos.ParamByName('NR_PROCESSO').AsString := Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString;
  Datm_InstrDesemb.qry_Arquivos.ParamByName('CD_CARGO').AsString    := str_cd_cargo;
  Datm_InstrDesemb.qry_Arquivos.Open;

  PathDig := ConsultaLookUP('TPARAMETROS', '"BLABLA"', 'BLABLA', 'PATH_DIGITALIZACAO');
  if PathDig[Length(PathDig)] <> '\' then
    PathDig := PathDig + '\';
  PathDig := PathDig + 'TPROCESSO\' + Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString + '\';

  if Trim(Datm_InstrDesemb.qry_InstrucaoDesembCD_CLIENTE.AsString) = '' then
    Cliente := ''
  else
    Cliente := Trim(ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', Datm_InstrDesemb.qry_InstrucaoDesembCD_CLIENTE.AsString, 'NM_EMPRESA'));
  if Trim(Datm_InstrDesemb.qry_InstrucaoDesembCD_EMBARCACAO.AsString) = '' then
    Modal := ''
  else
    Modal   := ConsultaLookUPSQL(' SELECT CASE NM_EMBARCACAO ' +
                                 '            WHEN ''AEREO''       THEN ''Aéreo'' ' +
                                 '            WHEN ''RODOVIARIO''  THEN ''Rodoviário'' ' +
                                 '            WHEN ''FLUVIAL''     THEN ''Fluvial'' ' +
                                 '            WHEN ''FERROVIARIO'' THEN ''Ferroviário'' ' +
                                 '        ELSE ''Marítimo'' ' +
                                 '        END AS MODAL ' +
                                 ' FROM TEMBARCACAO ' +
                                 ' WHERE CD_EMBARCACAO = ''' + Datm_InstrDesemb.qry_InstrucaoDesembCD_EMBARCACAO.AsString + '''', 'MODAL');
  Assunto := '[MyIndaiaMail] Nova Instrução de Desembaraço Autorizada :' + Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString;
  if Cliente <> '' then
    Assunto := Assunto + ' / Cliente: ' + Cliente;
  if Modal <> '' then
    Assunto := Assunto + ' / Modal: ' + Modal;

  //with NewText do
  begin
    //ContentType:='text/HTML';
    Body.Add('<html>');
    Body.Add('<body>');
    Body.Add('Segue planilha em anexo');
    Body.Add('<br><br>');
    Body.Add('<b>Instrução: </b>' + Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString);
    if Cliente <> '' then
    begin
      Body.Add('<br>');
      Body.Add('<b>Cliente: </b>' + Cliente);
    end;
    if Cliente <> '' then
    begin
      Body.Add('<br>');
      Body.Add('<b>Modal: </b>' + Modal);
    end;
    Body.Add('<br><br>');

    if not Datm_InstrDesemb.qry_Arquivos.Eof then
    begin
      Body.Add('<br>');
      Body.Add('<b>Arquivos Digitalizados:</b>');
      Body.Add('<br>');
      ArquivoPai := '';
      Datm_InstrDesemb.qry_Arquivos.First;
      while not Datm_InstrDesemb.qry_Arquivos.Eof do
      begin
        if (Datm_InstrDesemb.qry_ArquivosNM_ARQUIVO_PAI.AsString <> '') and (ArquivoPai <> '') then
        begin
          Inc(QtdPai);
          Body.Add('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="' + PathDig + Datm_InstrDesemb.qry_ArquivosNM_ARQUIVO.AsString +
             '">' + ArquivoPai + ' Parte ' + FormatFloat('00', QtdPai) + '</a>');
        end
        else
        begin
          Qtdpai := 1;
          Body.Add('<a href="' + PathDig + Datm_InstrDesemb.qry_ArquivosNM_ARQUIVO.AsString + '">' +
             Datm_InstrDesemb.qry_ArquivosNM_DESCRICAO.AsString + '</a>');
          ArquivoPai := Datm_InstrDesemb.qry_ArquivosNM_DESCRICAO.AsString;
        end;
        Body.Add('<br>');
        Datm_InstrDesemb.qry_Arquivos.Next;
      end;
      Body.Add('<br><br>');
    end;

    Body.Add('Este é um email gerado automaticamente pelo MyIndaiá.');
    Body.Add(' Dúvidas: <a href="mailto:myindaia@myindaia.com.br">myindaia@myindaia.com.br</a>');
    Body.Add('');

    Body.Add('</body>');
    Body.Add('</html>');

    vTo := Trim(ConsultaLookUp('TUSUARIO', 'CD_USUARIO', Datm_InstrDesemb.qry_InstrucaoDesembCD_RESPONSAVEL.AsString, 'NM_EMAIL')) +
       ';' + Trim(ConsultaLookUp('TUSUARIO', 'CD_USUARIO', str_cd_usuario, 'NM_EMAIL'));
  end;

  {NewText := TIdText.Create(IdMessage1.MessageParts);
  NewText.ContentType := 'text/plain';}

  if FileExists(cDir_RPT + '\InstrucaoDesembaraco_' + Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString + '.XLS') then
    DeleteFile(cDir_RPT + '\InstrucaoDesembaraco_' + Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString + '.XLS');
  GeraExcel(False);
  //TIdAttachment.Create(IdMessage1.MessageParts, cDir_RPT + '\InstrucaoDesembaraco_' + Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString + '.XLS');

  {with IdMessage1 do
  begin
    From.Text                 := Trim(ConsultaLookUp('TUSUARIO', 'CD_USUARIO', str_cd_usuario, 'NM_EMAIL'));
    ReplyTo.EMailAddresses    := From.Text;
    //if AnsiIndexStr(Datm_InstrDesemb.qry_InstrucaoDesembCD_EMBARCACAO.AsString, ['0263', '2102']) >= 0 then
    //  Recipients.EMailAddresses := vTo
    //else
      Recipients.EMailAddresses := 'registro03@myindaia.com.br;' + vTo;
    Subject := Assunto;
  end;

  IdSMTP1.Host := 'mail.indaialogistica.com.br';
  IdSMTP1.Port := 25;
  IdSMTP1.Connect;
  try
    IdSMTP1.Send(IdMessage1)
  except
    ShowMessage('O e-mail não foi enviado pois o endereço de e-mail estava incorreto!');
  end;
  IdSMTP1.Disconnect;
  IdMessage1.MessageParts.Clear;
  IdMessage1.Clear;}
  if not GSMLIB.EnviaEmailHtmlDe(Assunto, Body.Text, 'registro03@myindaia.com.br;' + vTo,
     Trim(ConsultaLookUp('TUSUARIO', 'CD_USUARIO', str_cd_usuario, 'NM_EMAIL')),
     [cDir_RPT + '\InstrucaoDesembaraco_' + Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString + '.XLS']) then
    ShowMessage('O e-mail não foi enviado pois o endereço de e-mail estava incorreto!');
  Body.Free;
end;

procedure TFrm_InstrucaoDesembaraco.BtnImprimirClick(Sender: TObject);
begin
  GeraExcel(True);
end;

procedure TFrm_InstrucaoDesembaraco.BtnConsultaEmbarcacaoItemParcialClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if (Sender as TSpeedButton).Enabled then
    begin
      if PoeEmEdicao(Datm_InstrDesemb.qry_InstrucaoDesemb) then
        Datm_InstrDesemb.qry_InstrucaoDesembCD_EMBARCACAO.AsString := ConsultaOnLineEx('TEMBARCACAO', 'Embarcação', ['CD_EMBARCACAO', 'NM_EMBARCACAO'],
           ['Código', 'Nome'], 'CD_EMBARCACAO', nil, 1, Datm_InstrDesemb.qry_InstrucaoDesembCD_EMBARCACAO.AsString);
    end
  end
  else
    EditNavioParcialDesc.Text := ConsultaLookUP('TEMBARCACAO', 'CD_EMBARCACAO', EditNavioParcial.Text, 'NM_EMBARCACAO');
end;

procedure TFrm_InstrucaoDesembaraco.EditNavioParcialExit(Sender: TObject);
begin
  if EditNavioParcial.Text <> '' then
    EditNavioParcial.Text := FStrZero(EditNavioParcial.Text, 4);
end;

procedure TFrm_InstrucaoDesembaraco.EditNavioParcialKeyPress(
  Sender: TObject; var Key: Char);
begin
  if not ( IsNumeric(Key) ) and ( Key <> chr(VK_RETURN) ) and ( Key <> chr(VK_BACK) ) then
    Key := #0;
end;


function TFrm_InstrucaoDesembaraco.VerificaItensRepetidos: Boolean;
begin
  with TQuery.Create(Application)do
  begin
    DatabaseName := 'DBBROKER';
    Sql.Add('SELECT COUNT(*) CONT');
    Sql.Add('FROM TINSTRUCAO_DESEMBARACO_PEDIDO IDP INNER JOIN TINSTRUCAO_DESEMBARACO ID ON ID.ID_CODIGO = IDP.ID_CODIGO');
    Sql.Add('WHERE IDP.ID_CODIGO    <> :ID_CODIGO');
    Sql.Add('  AND IDP.NR_REFERENCIA = :NR_REFERENCIA');
    Sql.Add('  AND IDP.NR_ITEM_PO    = :NR_ITEM_PO');
    Sql.Add('  AND IDP.NR_PARCIAL    = :NR_PARCIAL');
    Sql.Add('  AND ID.CD_CLIENTE     = :CD_CLIENTE');
    ParamByName('ID_CODIGO').AsString     := Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString;
    ParamByName('NR_REFERENCIA').AsString := Datm_InstrDesemb.qry_ItensPedidoNR_PROCESSO.AsString;
    ParamByName('NR_ITEM_PO').AsString    := Datm_InstrDesemb.qry_ItensPedidoNR_ITEM_CLIENTE.AsString;
    ParamByName('NR_PARCIAL').AsString    := Datm_InstrDesemb.qry_ItensPedidoNR_PARCIAL.AsString;
    ParamByName('CD_CLIENTE').AsString    := Datm_InstrDesemb.qry_ItensPedidoCD_EMPRESA.AsString;
    Open;
    Result := FieldByName('CONT').AsInteger = 0;
  end;
end;

procedure TFrm_InstrucaoDesembaraco.BtnDatasClick(Sender: TObject);
begin
  Application.CreateForm(TFrmInstrucaoDesembaracoDatas, FrmInstrucaoDesembaracoDatas);
  FrmInstrucaoDesembaracoDatas.AlimentaTabMemoria(Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString);
  FrmInstrucaoDesembaracoDatas.IdCodInstrucao := Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString;
  FrmInstrucaoDesembaracoDatas.ShowModal;
  FrmInstrucaoDesembaracoDatas.Release;
end;

procedure TFrm_InstrucaoDesembaraco.LimpaFlagsTPOItem(
  const cIdCodigo: string);
begin
  with TQuery.Create(Application) do
  begin
    Databasename := 'DBBROKER';
    Sql.Clear;
    Sql.Add('UPDATE A SET');
	  Sql.Add('   IN_UTILIZADO_INSTR_DESEMB = NULL,');
		Sql.Add('   ID_CODIGO_INSTR_DESEMB = NULL');
    Sql.Add('FROM TPO_ITEM A, TINSTRUCAO_DESEMBARACO_PEDIDO B');
    Sql.Add('WHERE');
    Sql.Add('  A.NR_PROCESSO = NR_REFERENCIA AND');
    Sql.Add('  A.NR_ITEM_CLIENTE = NR_ITEM_PO ANd');
    Sql.Add('  A.NR_PARCIAL = B.NR_PARCIAL AND');
    Sql.Add('  B.ID_CODIGO =:ID_CODIGO');
    ParamByName('ID_CODIGO').AsString := cIdCodigo;
    ExecSql;
    Free;
  end;
end;

function TFrm_InstrucaoDesembaraco.VerificaNumLI(const pNumPedido : string; const pNumItem : string) : string;
var
  pNr_Processo : string;
begin
  with TQuery.Create(Application)do
  begin
    DataBaseName := 'DBBROKER';
    Sql.Clear;
    Sql.Add('SELECT P.NR_PROCESSO, S.IN_LI');
    Sql.Add('FROM TREF_CLIENTE REF, TPROCESSO P, TSERVICO S');
    Sql.Add('WHERE');
    Sql.Add('  REF.CD_REFERENCIA =:CD_REFERENCIA AND REF.NR_ITEM_PO =:NR_ITEM_PO AND');
    Sql.Add('  P.NR_PROCESSO = REF.NR_PROCESSO AND');
    Sql.Add('  S.CD_SERVICO  = P.CD_SERVICO	  AND');
    Sql.Add('  S.IN_LI = ''1''');
    ParamByName('CD_REFERENCIA').AsString := pNumPedido;
    ParamByName('NR_ITEM_PO').AsString    := pNumItem;
    Open;
    if FieldByName('IN_LI').AsString = '1' then
    begin
      pNr_Processo := FieldByName('NR_PROCESSO').AsString;
      Close;
      Sql.Clear;
      Sql.Add('SELECT NR_REGISTRO_LI FROM TLICENCA_IMPORTACAO WHERE NR_PROCESSO LIKE :NR_PROCESSO ');
      ParamByName('NR_PROCESSO').AsString := '%' + pNr_Processo + '%';
      Open;
      Result := FieldByName('NR_REGISTRO_LI').AsString;
    end
    else
      Result := '';
    Free;
  end;
end;

procedure TFrm_InstrucaoDesembaraco.dbg_cadastroDblClick(Sender: TObject);
begin
  GeraExcel(True);
end;

procedure TFrm_InstrucaoDesembaraco.chkUltimos30DiasClick(Sender: TObject);
begin
  if Datm_InstrDesemb.qry_InstrucaoDesemb.Active then
    Datm_InstrDesemb.qry_InstrucaoDesemb.Close;
  Datm_InstrDesemb.qry_InstrucaoDesemb.ParamByName('IN_30_DIAS').AsInteger := Abs(Integer(chkUltimos30Dias.Checked));
  Datm_InstrDesemb.qry_InstrucaoDesemb.Open;
end;

procedure TFrm_InstrucaoDesembaraco.chkExibeAutorizadosClick(
  Sender: TObject);
begin
  if Datm_InstrDesemb.qry_InstrucaoDesemb.Active then
    Datm_InstrDesemb.qry_InstrucaoDesemb.Close;
  Datm_InstrDesemb.qry_InstrucaoDesemb.ParamByName('IN_AUTORIZADO').AsInteger := Abs(Integer(chkUltimos30Dias.Checked));
  Datm_InstrDesemb.qry_InstrucaoDesemb.Open;
end;

procedure TFrm_InstrucaoDesembaraco.dbg_cadastroDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Datm_InstrDesemb.qry_InstrucaoDesembIN_AUTORIZADO.AsString = '1') then
  begin
    dbg_cadastro.Canvas.Brush.Color := $00D1FCC2;
    dbg_cadastro.Canvas.Font.Color := clBlack;
    dbg_cadastro.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Column.Field.AsString);
  end
  else
  begin
    dbg_cadastro.Canvas.Brush.Color := clWhite;
    dbg_cadastro.Canvas.Font.Color := clBlack;
    dbg_cadastro.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Column.Field.AsString);
  end
end;

procedure TFrm_InstrucaoDesembaraco.pgctrl_InstrChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := not btn_salvar.Enabled;
  if btn_salvar.Enabled then
  begin
    AllowChange := True;
    case MessageDlg('As informações não foram salvas.'#13'Deseja salvá-las agora?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: btn_salvar.Click;
      mrNo : btn_cancelar.Click;
      mrCancel: AllowChange := False;
    end;
  end;
end;

end.






            


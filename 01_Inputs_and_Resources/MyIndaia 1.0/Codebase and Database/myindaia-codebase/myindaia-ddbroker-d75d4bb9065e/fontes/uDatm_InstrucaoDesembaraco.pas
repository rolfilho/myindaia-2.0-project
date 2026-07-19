unit uDatm_InstrucaoDesembaraco;

interface

uses
  SysUtils, Classes, DB, DBTables, Graphics;

type
  TDatm_InstrDesemb = class(TDataModule)
    qry_InstrucaoDesemb: TQuery;
    qry_InstrucaoDesembID_CODIGO: TStringField;
    qry_InstrucaoDesembCD_USUARIO: TStringField;
    qry_InstrucaoDesembDT_CRIACAO: TDateTimeField;
    qry_InstrucaoDesembIN_AUTORIZADO: TStringField;
    dts_InstrucaoDesemb: TDataSource;
    dts_ItensInstrucaoDesemb: TDataSource;
    qry_ItensInstrucaoDesemb: TQuery;
    updInstrucaoDesemb: TUpdateSQL;
    updItensInstrucaoDesemb: TUpdateSQL;
    dtsItensPedido: TDataSource;
    qry_ItensPedido: TQuery;
    qry_ItensInstrucaoDesembID_CODIGO: TStringField;
    qry_ItensInstrucaoDesembNR_REFERENCIA: TStringField;        
    qry_ItensInstrucaoDesembNR_ITEM_PO: TStringField;
    qry_ItensInstrucaoDesembNR_PARCIAL: TIntegerField;
    qry_ItensInstrucaoDesembDT_INCLUSAO: TDateTimeField;
    qry_ItensPedidoNR_PROCESSO: TStringField;
    qry_ItensPedidoNR_ITEM_CLIENTE: TStringField;
    qry_ItensPedidoNR_PARCIAL: TIntegerField;
    qry_ItensPedidoQT_DISPONIVEL: TFloatField;
    qry_ItensPedidoCD_UNID_MEDIDA: TStringField;
    qry_ItensPedidoCD_MERCADORIA: TStringField;
    qry_ItensPedidoAP_MERCADORIA: TStringField;
    qry_ItensPedidoNM_SIGLA: TStringField;
    qry_InstrucaoDesembCD_USUARIO_AUTORIZACAO: TStringField;
    qry_InstrucaoDesembDT_AUTORIZACAO: TDateTimeField;
    qry_InstrucaoDesembNM_USUARIO: TStringField;
    qry_InstrucaoDesembNM_USUARIO_AUTORIZACAO: TStringField;
    qry_InstrucaoDesembNR_PROCESSO: TStringField;
    qry_InstrucaoDesembCD_CLIENTE: TStringField;
    qry_InstrucaoDesembAP_EMPRESA: TStringField;
    qry_InstrucaoDesembcalcNR_PROCESSO: TStringField;
    qry_InstrucaoDesembCD_RESPONSAVEL: TStringField;
    qry_InstrucaoDesembCD_EMBARCACAO: TStringField;
    qry_InstrucaoDesembNR_CONHECIMENTO: TStringField;
    qry_ItensPedidoCD_EMPRESA: TStringField;
    qry_Arquivos: TQuery;
    qry_ArquivosNM_DESCRICAO: TStringField;
    qry_ArquivosNM_ARQUIVO: TStringField;
    qry_ArquivosNM_ARQUIVO_PAI: TStringField;
    qryDespesas: TQuery;
    updDespesas: TUpdateSQL;
    dsDespesas: TDataSource;
    qry_InstrucaoDesembCD_EMPRESA: TStringField;
    qry_InstrucaoDesembTX_OBSERVACOES: TStringField;
    qryDespesasID_CODIGO: TStringField;
    qryDespesasNM_ITEM: TStringField;
    qryDespesasNR_FATURA: TStringField;
    qryDespesasVL_ITEM: TFloatField;
    qry_ItensPedidoNR_FATURA: TStringField;
    qryDespesasLUP_NR_FATURA: TStringField;
    dsFaturas: TDataSource;
    qryFaturas: TQuery;
    qryFaturasNR_FATURA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qry_InstrucaoDesembAfterPost(DataSet: TDataSet);
    procedure qry_InstrucaoDesembAfterInsert(DataSet: TDataSet);
    procedure qry_InstrucaoDesembAfterScroll(DataSet: TDataSet);
    procedure qry_InstrucaoDesembCalcFields(DataSet: TDataSet);
    procedure qryDespesasAfterInsert(DataSet: TDataSet);
    procedure qryDespesasAfterOpen(DataSet: TDataSet);
    procedure qryDespesasAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Datm_InstrDesemb: TDatm_InstrDesemb;

implementation

uses uInstrucaoDesembaraco;

{$R *.dfm}

procedure TDatm_InstrDesemb.DataModuleCreate(Sender: TObject);
begin
  qry_InstrucaoDesemb.Open;
  qry_ItensInstrucaoDesemb.Open;
  qryDespesas.Open;
end;

procedure TDatm_InstrDesemb.qry_InstrucaoDesembAfterPost(
  DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure TDatm_InstrDesemb.qry_InstrucaoDesembAfterInsert(
  DataSet: TDataSet);
begin
  Frm_InstrucaoDesembaraco.Btn_Mi(False, True, True, False);
end;

procedure TDatm_InstrDesemb.qry_InstrucaoDesembAfterScroll(
  DataSet: TDataSet);
begin
  qryDespesas.Close;
  qryDespesas.ParamByName('ID_CODIGO').AsString := qry_InstrucaoDesembID_CODIGO.AsString;
  qryDespesas.Open;
  
  Frm_InstrucaoDesembaraco.ChkAutorizado.Enabled    := not(qry_ItensInstrucaoDesemb.IsEmpty);

  if qry_InstrucaoDesembIN_AUTORIZADO.AsString = '1' then  //se estiver autorizado
  begin
    Frm_InstrucaoDesembaraco.ChkAutorizado.Enabled := qry_InstrucaoDesembNR_PROCESSO.AsString = '';

    dsDespesas.AutoEdit := False;

    Frm_InstrucaoDesembaraco.dbedt_cd_cliente.Enabled := False;
    Frm_InstrucaoDesembaraco.btn_co_cliente.Enabled   := False;
    Frm_InstrucaoDesembaraco.dbedt_cd_cliente.Color   := clMenu;
    Frm_InstrucaoDesembaraco.dbmemObservacoes.Enabled := False;
  end
  else
  begin
    dsDespesas.AutoEdit := True;

    Frm_InstrucaoDesembaraco.dbedt_cd_cliente.Enabled := True;
    Frm_InstrucaoDesembaraco.btn_co_cliente.Enabled   := True;
    Frm_InstrucaoDesembaraco.dbedt_cd_cliente.Color   := clWindow;
    Frm_InstrucaoDesembaraco.dbmemObservacoes.Enabled := True;
  end;

  with Frm_InstrucaoDesembaraco do
  begin
    LblProcesso.Visible       := qry_InstrucaoDesembNR_PROCESSO.AsString <> '';
    EditUsuarioAutorizou.Text := qry_InstrucaoDesembNM_USUARIO_AUTORIZACAO.AsString;
    BvlProcesso.Visible       := Frm_InstrucaoDesembaraco.LblProcesso.Visible;
    //BtnImprimir.Enabled := qry_InstrucaoDesembIN_AUTORIZADO.AsString = '1';
    // Comentado acima para o botão ficar habilitado sempre de modo que o usuário possa gerar a planilha para conferir os totais - Michel - 24/03/2011

    dbedtCodigoAnalista.Enabled              := qry_InstrucaoDesembNR_PROCESSO.AsString = '';
    btnConsultaAnalista.Enabled              := qry_InstrucaoDesembNR_PROCESSO.AsString = '';
    EditNavioParcial.Enabled                 := qry_InstrucaoDesembNR_PROCESSO.AsString = '';
    BtnConsultaEmbarcacaoItemParcial.Enabled := qry_InstrucaoDesembNR_PROCESSO.AsString = '';
    EditNumBL.Enabled                        := qry_InstrucaoDesembNR_PROCESSO.AsString = '';

    if qry_InstrucaoDesembNR_PROCESSO.AsString = '' then
    begin
      dbedtCodigoAnalista.Color := clWindow;
      EditNavioParcial.Color    := clWindow;
      EditNumBL.Color           := clWindow;
    end
    else
    begin
      dbedtCodigoAnalista.Color := clMenu;
      EditNavioParcial.Color    := clMenu;
      EditNumBL.Color           := clMenu;
    end;
  end;
end;

procedure TDatm_InstrDesemb.qry_InstrucaoDesembCalcFields(
  DataSet: TDataSet);
begin
  qry_InstrucaoDesembcalcNR_PROCESSO.AsString := Copy( qry_InstrucaoDesembNR_PROCESSO.AsString, 5, 14 );
end;

procedure TDatm_InstrDesemb.qryDespesasAfterInsert(DataSet: TDataSet);
begin
  qryDespesasID_CODIGO.AsString := qry_InstrucaoDesembID_CODIGO.AsString; 
end;

procedure TDatm_InstrDesemb.qryDespesasAfterOpen(DataSet: TDataSet);
begin
  Datm_InstrDesemb.qryFaturas.Close;
  Datm_InstrDesemb.qryFaturas.ParamByName('ID_CODIGO').AsString  := Datm_InstrDesemb.qry_InstrucaoDesembID_CODIGO.AsString;
  Datm_InstrDesemb.qryFaturas.ParamByName('CD_EMPRESA').AsString := Datm_InstrDesemb.qry_InstrucaoDesembCD_CLIENTE.AsString;
  Datm_InstrDesemb.qryFaturas.Open;
end;

procedure TDatm_InstrDesemb.qryDespesasAfterClose(DataSet: TDataSet);
begin
  Datm_InstrDesemb.qryFaturas.Close;
end;

end.

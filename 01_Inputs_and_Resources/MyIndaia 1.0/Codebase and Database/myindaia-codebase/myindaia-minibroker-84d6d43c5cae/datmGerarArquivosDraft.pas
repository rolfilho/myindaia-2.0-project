unit DmGerarArquivosDraft;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdtmGerarArquivosDraft = class(TDataModule)
    qryDraftBL_: TFDQuery;
    dspDraftBL_: TDataSetProvider;
    cdsDraftBL_: TClientDataSet;
    dsDraftBL_: TDataSource;
    dsDraftBLItens_: TDataSource;
    cdsDraftBLItens_: TClientDataSet;
    dspDraftBLItens_: TDataSetProvider;
    qryDraftBLItens_: TFDQuery;
    qryDraftBL_NR_PROCESSO: TStringField;
    qryDraftBL_NR_AMEND: TIntegerField;
    qryDraftBL_DT_CRIACAO: TSQLTimeStampField;
    qryDraftBL_NM_USUARIO: TStringField;
    qryDraftBL_DT_ENVIO_DRAFT: TSQLTimeStampField;
    qryDraftBL_CD_ENVIO_INTTRA: TStringField;
    qryDraftBL_DS_EMAIL_INDAIA: TStringField;
    qryDraftBL_CLIENTE_NOME: TStringField;
    qryDraftBL_CLIENTE_ENDERECO_COMPLETO: TStringField;
    qryDraftBL_AGENTE_NOME: TStringField;
    qryDraftBL_BOOKING_ARMADOR: TStringField;
    qryDraftBL_CONSIG_NOME: TStringField;
    qryDraftBL_CONSIG_ENDERECO_COMPLETO: TStringField;
    qryDraftBL_NOTIFY1_NOME: TStringField;
    qryDraftBL_NOTIFY1_ENDERECO_COMPLETO: TStringField;
    qryDraftBL_NOTIFY2_NOME: TStringField;
    qryDraftBL_NOTIFY2_ENDERECO_COMPLETO: TStringField;
    qryDraftBL_DS_COLLECT_PREPAID: TStringField;
    qryDraftBL_NM_LOCAL_PGMTO_TAXAS: TStringField;
    qryDraftBL_DS_TAXAS: TStringField;
    qryDraftBL_DS_MOVIMENTO: TStringField;
    qryDraftBL_VIAGEM_NAVIO: TStringField;
    qryDraftBL_LOCAL_EMBARQUE: TStringField;
    qryDraftBL_LOCAL_DESEMBARQUE: TStringField;
    qryDraftBL_REFERENCIA_INDAIA: TStringField;
    qryDraftBL_REFERENCIA_EMBARQUE: TStringField;
    qryDraftBL_CD_RUC: TStringField;
    qryDraftBL_COMENTARIO: TStringField;
    qryDraftBL_QT_CNTR: TIntegerField;
    qryDraftBL_QT_EMBALAGENS: TIntegerField;
    qryDraftBL_QT_PESO: TFMTBCDField;
    qryDraftBL_VL_CUBAGEM: TFMTBCDField;
    cdsDraftBL_NR_PROCESSO: TStringField;
    cdsDraftBL_NR_AMEND: TIntegerField;
    cdsDraftBL_DT_CRIACAO: TSQLTimeStampField;
    cdsDraftBL_NM_USUARIO: TStringField;
    cdsDraftBL_DT_ENVIO_DRAFT: TSQLTimeStampField;
    cdsDraftBL_CD_ENVIO_INTTRA: TStringField;
    cdsDraftBL_DS_EMAIL_INDAIA: TStringField;
    cdsDraftBL_CLIENTE_NOME: TStringField;
    cdsDraftBL_CLIENTE_ENDERECO_COMPLETO: TStringField;
    cdsDraftBL_AGENTE_NOME: TStringField;
    cdsDraftBL_BOOKING_ARMADOR: TStringField;
    cdsDraftBL_CONSIG_NOME: TStringField;
    cdsDraftBL_CONSIG_ENDERECO_COMPLETO: TStringField;
    cdsDraftBL_NOTIFY1_NOME: TStringField;
    cdsDraftBL_NOTIFY1_ENDERECO_COMPLETO: TStringField;
    cdsDraftBL_NOTIFY2_NOME: TStringField;
    cdsDraftBL_NOTIFY2_ENDERECO_COMPLETO: TStringField;
    cdsDraftBL_DS_COLLECT_PREPAID: TStringField;
    cdsDraftBL_NM_LOCAL_PGMTO_TAXAS: TStringField;
    cdsDraftBL_DS_TAXAS: TStringField;
    cdsDraftBL_DS_MOVIMENTO: TStringField;
    cdsDraftBL_VIAGEM_NAVIO: TStringField;
    cdsDraftBL_LOCAL_EMBARQUE: TStringField;
    cdsDraftBL_LOCAL_DESEMBARQUE: TStringField;
    cdsDraftBL_REFERENCIA_INDAIA: TStringField;
    cdsDraftBL_REFERENCIA_EMBARQUE: TStringField;
    cdsDraftBL_CD_RUC: TStringField;
    cdsDraftBL_COMENTARIO: TStringField;
    cdsDraftBL_QT_CNTR: TIntegerField;
    cdsDraftBL_QT_EMBALAGENS: TIntegerField;
    cdsDraftBL_QT_PESO: TFMTBCDField;
    cdsDraftBL_VL_CUBAGEM: TFMTBCDField;
    qryDraftBLItens_NR_PROCESSO: TStringField;
    qryDraftBLItens_NR_AMEND: TIntegerField;
    qryDraftBLItens_NR_ITEM: TIntegerField;
    qryDraftBLItens_MERCADORIA: TStringField;
    qryDraftBLItens_EMBALAGEM: TStringField;
    qryDraftBLItens_TIPO_EMBALAGEM: TStringField;
    qryDraftBLItens_MARCACAO_VOLUMES: TStringField;
    qryDraftBLItens_VL_CUBAGEM_MERC: TBCDField;
    qryDraftBLItens_VL_EMBALAGEM_MERC: TIntegerField;
    qryDraftBLItens_VL_PESO_BRUTO_MERC: TBCDField;
    qryDraftBLItens_DESCRICAO_CONTRAINER: TStringField;
    cdsDraftBLItens_NR_PROCESSO: TStringField;
    cdsDraftBLItens_NR_AMEND: TIntegerField;
    cdsDraftBLItens_NR_ITEM: TIntegerField;
    cdsDraftBLItens_MERCADORIA: TStringField;
    cdsDraftBLItens_EMBALAGEM: TStringField;
    cdsDraftBLItens_TIPO_EMBALAGEM: TStringField;
    cdsDraftBLItens_MARCACAO_VOLUMES: TStringField;
    cdsDraftBLItens_VL_CUBAGEM_MERC: TBCDField;
    cdsDraftBLItens_VL_EMBALAGEM_MERC: TIntegerField;
    cdsDraftBLItens_VL_PESO_BRUTO_MERC: TBCDField;
    cdsDraftBLItens_DESCRICAO_CONTRAINER: TStringField;
    qryDraftBLItens_NR_CNTR: TStringField;
    cdsDraftBLItens_NR_CNTR: TStringField;
    qryComentarios: TFDQuery;
    qryComentariosNR_PROCESSO: TStringField;
    qryComentariosNR_AMEND: TIntegerField;
    qryComentariosNR_COMENTARIO: TIntegerField;
    qryComentariosCD_TP_COMENTARIO: TStringField;
    qryComentariosDS_COMENTARIO: TStringField;
    qryContainer: TFDQuery;
    qryContainerNR_PROCESSO: TStringField;
    qryContainerNR_CNTR: TStringField;
    qryContainerNR_LACRE: TStringField;
    qryContainerNR_LACRE_SIF: TStringField;
    qryContainerNM_TP_CNTR: TStringField;
    qryContainerCD_ISO: TStringField;
    qryContainerDS_TEMPERATURA: TStringField;
    qryContainerTARA_CNTR: TBCDField;
    qryContainerVL_CUBAGEM: TBCDField;
    qryContainerDS_CARGA: TMemoField;
    qryContainerCD_NCM: TStringField;
    qryContainerCD_EMBALAGEM: TStringField;
    qryContainerDS_EMBALAGEM: TStringField;
    qryContainerQT_EMBALAGEM: TIntegerField;
    qryContainerQT_PESO_BRUTO: TBCDField;
    qryDraft: TFDQuery;
    dspDraft: TDataSetProvider;
    cdsDraft: TClientDataSet;
    dtsDraft: TDataSource;
    dtsContainer: TDataSource;
    cdsContainer: TClientDataSet;
    dspContainer: TDataSetProvider;
    cdsComentarios: TClientDataSet;
    dspComentarios: TDataSetProvider;
    dtsComentarios: TDataSource;
    cdsContainerNR_PROCESSO: TStringField;
    cdsContainerNR_CNTR: TStringField;
    cdsContainerNR_LACRE: TStringField;
    cdsContainerNR_LACRE_SIF: TStringField;
    cdsContainerNM_TP_CNTR: TStringField;
    cdsContainerCD_ISO: TStringField;
    cdsContainerDS_TEMPERATURA: TStringField;
    cdsContainerTARA_CNTR: TBCDField;
    cdsContainerVL_CUBAGEM: TBCDField;
    cdsContainerDS_CARGA: TMemoField;
    cdsContainerCD_NCM: TStringField;
    cdsContainerCD_EMBALAGEM: TStringField;
    cdsContainerDS_EMBALAGEM: TStringField;
    cdsContainerQT_EMBALAGEM: TIntegerField;
    cdsContainerQT_PESO_BRUTO: TBCDField;
    cdsComentariosNR_PROCESSO: TStringField;
    cdsComentariosNR_AMEND: TIntegerField;
    cdsComentariosNR_COMENTARIO: TIntegerField;
    cdsComentariosCD_TP_COMENTARIO: TStringField;
    cdsComentariosDS_COMENTARIO: TStringField;
    qryDraftNR_PROCESSO: TStringField;
    qryDraftCD_REFERENCIA: TStringField;
    qryDraftNR_AMEND: TIntegerField;
    qryDraftCD_RUC: TStringField;
    qryDraftDS_EMAIL_INDAIA: TStringField;
    qryDraftCLIENTE_NOME: TStringField;
    qryDraftCLIENTE_ENDERECO: TStringField;
    qryDraftCLIENTE_CIDADE: TStringField;
    qryDraftCLIENTE_CEP: TStringField;
    qryDraftCLIENTE_ESTADO: TStringField;
    qryDraftCLIENTE_PAIS_COD: TStringField;
    qryDraftCLIENTE_CNPJ: TStringField;
    qryDraftCLIENTE_END_COMPLETO: TStringField;
    qryDraftAGENTE_NOME: TStringField;
    qryDraftAGENTE_CD_INTTRA: TStringField;
    qryDraftAGENTE_ENDERECO: TStringField;
    qryDraftAGENTE_CIDADE: TStringField;
    qryDraftAGENTE_CEP: TStringField;
    qryDraftAGENTE_ESTADO: TStringField;
    qryDraftAGENTE_PAIS_COD: TStringField;
    qryDraftCONSIG_NOME: TStringField;
    qryDraftCONSIG_ENDERECO: TStringField;
    qryDraftCONSIG_CIDADE: TStringField;
    qryDraftCONSIG_CEP: TStringField;
    qryDraftCONSIG_ESTADO: TStringField;
    qryDraftCONSIG_PAIS_COD: TStringField;
    qryDraftCONSIG_END_NUMERO: TStringField;
    qryDraftCONSIG_END_COMPL: TStringField;
    qryDraftCONSIG_NR_TELEFONE: TStringField;
    qryDraftCONSIG_NR_FAX: TStringField;
    qryDraftCONSIG_NR_RUC: TStringField;
    qryDraftCONSIG_NR_NIT: TStringField;
    qryDraftCONSIG_NR_CUIT: TStringField;
    qryDraftCONSIG_END_COMPLETO: TStringField;
    qryDraftNOTIFY1_NOME: TStringField;
    qryDraftNOTIFY1_ENDERECO: TStringField;
    qryDraftNOTIFY1_CIDADE: TStringField;
    qryDraftNOTIFY1_CEP: TStringField;
    qryDraftNOTIFY1_ESTADO: TStringField;
    qryDraftNOTIFY1_PAIS_COD: TStringField;
    qryDraftNOTIFY1_END_NUMERO: TStringField;
    qryDraftNOTIFY1_END_COMPL: TStringField;
    qryDraftNOTIFY1_NR_TELEFONE: TStringField;
    qryDraftNOTIFY1_NR_FAX: TStringField;
    qryDraftNOTIFY1_NR_RUC: TStringField;
    qryDraftNOTIFY1_NR_NIT: TStringField;
    qryDraftNOTIFY1_NR_CUIT: TStringField;
    qryDraftNOTIFY1_END_COMPLETO: TStringField;
    qryDraftNOTIFY2_NOME: TStringField;
    qryDraftNOTIFY2_ENDERECO: TStringField;
    qryDraftNOTIFY2_CIDADE: TStringField;
    qryDraftNOTIFY2_CEP: TStringField;
    qryDraftNOTIFY2_ESTADO: TStringField;
    qryDraftNOTIFY2_PAIS_COD: TStringField;
    qryDraftNOTIFY2_END_NUMERO: TStringField;
    qryDraftNOTIFY2_END_COMPL: TStringField;
    qryDraftNOTIFY2_NR_TELEFONE: TStringField;
    qryDraftNOTIFY2_NR_FAX: TStringField;
    qryDraftNOTIFY2_NR_RUC: TStringField;
    qryDraftNOTIFY2_NR_NIT: TStringField;
    qryDraftNOTIFY2_NR_CUIT: TStringField;
    qryDraftNOTIFY2_END_COMPLETO: TStringField;
    qryDraftCD_COLLECT_PREPAID: TStringField;
    qryDraftCD_TIPO_PGMTO_TAXAS: TIntegerField;
    qryDraftIN_PGMTO_ABROAD: TStringField;
    qryDraftNM_LOCAL_PGMTO_TAXAS: TStringField;
    qryDraftCD_TIPO_MOVIMENTO: TIntegerField;
    qryDraftBOOKING_ARMADOR: TStringField;
    qryDraftREFERENCIA_EMBARQUE: TStringField;
    qryDraftNM_NAVIO: TStringField;
    qryDraftNR_VIAGEM: TStringField;
    qryDraftLOCAL_EMBARQUE: TStringField;
    qryDraftLOCAL_EMBARQUE_SIGLA: TStringField;
    qryDraftLOCAL_DESEMBARQUE: TStringField;
    qryDraftLOCAL_DESEMBARQUE_SIGLA: TStringField;
    qryDraftLOCAL_DESEMBARQUE_PAIS_COD: TStringField;
    qryDraftLOCAL_ENTREGA: TStringField;
    qryDraftLOCAL_ENTREGA_SIGLA: TStringField;
    qryDraftLOCAL_ENTREGA_PAIS_COD: TStringField;
    qryDraftMARCACAO_VOLUMES: TStringField;
    qryDraftLOCAL_LIBERACAO_BL_COD: TStringField;
    qryDraftLOCAL_LIBERACAO_BL_NOME: TStringField;
    qryDraftLOCAL_LIBERACAO_BL_PAIS: TStringField;
    qryDraftMOVIMENTO_DESCRICAO: TStringField;
    cdsDraftNR_PROCESSO: TStringField;
    cdsDraftCD_REFERENCIA: TStringField;
    cdsDraftNR_AMEND: TIntegerField;
    cdsDraftCD_RUC: TStringField;
    cdsDraftDS_EMAIL_INDAIA: TStringField;
    cdsDraftCLIENTE_NOME: TStringField;
    cdsDraftCLIENTE_ENDERECO: TStringField;
    cdsDraftCLIENTE_CIDADE: TStringField;
    cdsDraftCLIENTE_CEP: TStringField;
    cdsDraftCLIENTE_ESTADO: TStringField;
    cdsDraftCLIENTE_PAIS_COD: TStringField;
    cdsDraftCLIENTE_CNPJ: TStringField;
    cdsDraftCLIENTE_END_COMPLETO: TStringField;
    cdsDraftAGENTE_NOME: TStringField;
    cdsDraftAGENTE_CD_INTTRA: TStringField;
    cdsDraftAGENTE_ENDERECO: TStringField;
    cdsDraftAGENTE_CIDADE: TStringField;
    cdsDraftAGENTE_CEP: TStringField;
    cdsDraftAGENTE_ESTADO: TStringField;
    cdsDraftAGENTE_PAIS_COD: TStringField;
    cdsDraftCONSIG_NOME: TStringField;
    cdsDraftCONSIG_ENDERECO: TStringField;
    cdsDraftCONSIG_CIDADE: TStringField;
    cdsDraftCONSIG_CEP: TStringField;
    cdsDraftCONSIG_ESTADO: TStringField;
    cdsDraftCONSIG_PAIS_COD: TStringField;
    cdsDraftCONSIG_END_NUMERO: TStringField;
    cdsDraftCONSIG_END_COMPL: TStringField;
    cdsDraftCONSIG_NR_TELEFONE: TStringField;
    cdsDraftCONSIG_NR_FAX: TStringField;
    cdsDraftCONSIG_NR_RUC: TStringField;
    cdsDraftCONSIG_NR_NIT: TStringField;
    cdsDraftCONSIG_NR_CUIT: TStringField;
    cdsDraftCONSIG_END_COMPLETO: TStringField;
    cdsDraftNOTIFY1_NOME: TStringField;
    cdsDraftNOTIFY1_ENDERECO: TStringField;
    cdsDraftNOTIFY1_CIDADE: TStringField;
    cdsDraftNOTIFY1_CEP: TStringField;
    cdsDraftNOTIFY1_ESTADO: TStringField;
    cdsDraftNOTIFY1_PAIS_COD: TStringField;
    cdsDraftNOTIFY1_END_NUMERO: TStringField;
    cdsDraftNOTIFY1_END_COMPL: TStringField;
    cdsDraftNOTIFY1_NR_TELEFONE: TStringField;
    cdsDraftNOTIFY1_NR_FAX: TStringField;
    cdsDraftNOTIFY1_NR_RUC: TStringField;
    cdsDraftNOTIFY1_NR_NIT: TStringField;
    cdsDraftNOTIFY1_NR_CUIT: TStringField;
    cdsDraftNOTIFY1_END_COMPLETO: TStringField;
    cdsDraftNOTIFY2_NOME: TStringField;
    cdsDraftNOTIFY2_ENDERECO: TStringField;
    cdsDraftNOTIFY2_CIDADE: TStringField;
    cdsDraftNOTIFY2_CEP: TStringField;
    cdsDraftNOTIFY2_ESTADO: TStringField;
    cdsDraftNOTIFY2_PAIS_COD: TStringField;
    cdsDraftNOTIFY2_END_NUMERO: TStringField;
    cdsDraftNOTIFY2_END_COMPL: TStringField;
    cdsDraftNOTIFY2_NR_TELEFONE: TStringField;
    cdsDraftNOTIFY2_NR_FAX: TStringField;
    cdsDraftNOTIFY2_NR_RUC: TStringField;
    cdsDraftNOTIFY2_NR_NIT: TStringField;
    cdsDraftNOTIFY2_NR_CUIT: TStringField;
    cdsDraftNOTIFY2_END_COMPLETO: TStringField;
    cdsDraftCD_COLLECT_PREPAID: TStringField;
    cdsDraftCD_TIPO_PGMTO_TAXAS: TIntegerField;
    cdsDraftIN_PGMTO_ABROAD: TStringField;
    cdsDraftNM_LOCAL_PGMTO_TAXAS: TStringField;
    cdsDraftCD_TIPO_MOVIMENTO: TIntegerField;
    cdsDraftBOOKING_ARMADOR: TStringField;
    cdsDraftREFERENCIA_EMBARQUE: TStringField;
    cdsDraftNM_NAVIO: TStringField;
    cdsDraftNR_VIAGEM: TStringField;
    cdsDraftLOCAL_EMBARQUE: TStringField;
    cdsDraftLOCAL_EMBARQUE_SIGLA: TStringField;
    cdsDraftLOCAL_DESEMBARQUE: TStringField;
    cdsDraftLOCAL_DESEMBARQUE_SIGLA: TStringField;
    cdsDraftLOCAL_DESEMBARQUE_PAIS_COD: TStringField;
    cdsDraftLOCAL_ENTREGA: TStringField;
    cdsDraftLOCAL_ENTREGA_SIGLA: TStringField;
    cdsDraftLOCAL_ENTREGA_PAIS_COD: TStringField;
    cdsDraftMARCACAO_VOLUMES: TStringField;
    cdsDraftLOCAL_LIBERACAO_BL_COD: TStringField;
    cdsDraftLOCAL_LIBERACAO_BL_NOME: TStringField;
    cdsDraftLOCAL_LIBERACAO_BL_PAIS: TStringField;
    cdsDraftMOVIMENTO_DESCRICAO: TStringField;
    qryDraftLOCAL_LIBERACAO_BL_ID: TStringField;
    cdsDraftLOCAL_LIBERACAO_BL_ID: TStringField;
    qryDraftTIPO_FRETE_DESCRICAO: TStringField;
    qryDraftPGTO_TAXA_DESCRICAO: TStringField;
    cdsDraftTIPO_FRETE_DESCRICAO: TStringField;
    cdsDraftPGTO_TAXA_DESCRICAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function AbrirQueryImpressaoDraftBL(processo : string; amend : integer) : integer;
    function AbrirQueryImpressaoDraftBLItens(processo : string; amend : integer) : integer;
    procedure FecharQueriesImpressaoDraftBL;
  end;

var
  dtmGerarArquivosDraft: TdtmGerarArquivosDraft;

implementation

uses
  ConnectionModule;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TdtmGerarArquivosDraft.AbrirQueryImpressaoDraftBL(processo : string; amend : integer) : integer;
begin
  if qryDraft.State <> dsInactive then
    qryDraft.close;

  if cdsDraft.State <> dsInactive then
    cdsDraft.close;

  qryDraft.paramByName('NR_PROCESSO').value := processo;
  qryDraft.paramByName('NR_AMEND').value    := amend;
  cdsDraft.open;

  result := cdsDraft.recordCount;
end;

function TdtmGerarArquivosDraft.AbrirQueryImpressaoDraftBLItens(processo : string; amend : integer) : integer;
begin
  if qryContainer.State <> dsInactive then
    qryContainer.close;

  if cdsContainer.State <> dsInactive then
    cdsContainer.close;

  qryContainer.paramByName('NR_PROCESSO').value := processo;
  qryContainer.paramByName('NR_AMEND').value    := amend;
  cdsContainer.open;

  result := cdsContainer.recordCount;
end;

procedure TdtmGerarArquivosDraft.FecharQueriesImpressaoDraftBL;
begin
  qryDraft.close;
  cdsDraft.close;
  qryContainer.Close;
  cdsContainer.Close;
end;

end.


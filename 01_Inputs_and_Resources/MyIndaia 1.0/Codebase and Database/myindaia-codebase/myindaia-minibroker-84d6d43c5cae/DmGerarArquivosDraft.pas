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
    qryDraftBL: TFDQuery;
    dspDraftBL: TDataSetProvider;
    cdsDraftBL: TClientDataSet;
    dsDraftBL: TDataSource;
    dsDraftBLItens_: TDataSource;
    cdsDraftBLItens_: TClientDataSet;
    dspDraftBLItens_: TDataSetProvider;
    qryDraftBLItens_: TFDQuery;
    qryDraftBLNR_PROCESSO: TStringField;
    qryDraftBLNR_AMEND: TIntegerField;
    qryDraftBLDT_CRIACAO: TSQLTimeStampField;
    qryDraftBLNM_USUARIO: TStringField;
    qryDraftBLDT_ENVIO_DRAFT: TSQLTimeStampField;
    qryDraftBLCD_ENVIO_INTTRA: TStringField;
    qryDraftBLDS_EMAIL_INDAIA: TStringField;
    qryDraftBLCLIENTE_NOME: TStringField;
    qryDraftBLCLIENTE_ENDERECO_COMPLETO: TStringField;
    qryDraftBLAGENTE_NOME: TStringField;
    qryDraftBLBOOKING_ARMADOR: TStringField;
    qryDraftBLCONSIG_NOME: TStringField;
    qryDraftBLCONSIG_ENDERECO_COMPLETO: TStringField;
    qryDraftBLNOTIFY1_NOME: TStringField;
    qryDraftBLNOTIFY1_ENDERECO_COMPLETO: TStringField;
    qryDraftBLNOTIFY2_NOME: TStringField;
    qryDraftBLNOTIFY2_ENDERECO_COMPLETO: TStringField;
    qryDraftBLDS_COLLECT_PREPAID: TStringField;
    qryDraftBLNM_LOCAL_PGMTO_TAXAS: TStringField;
    qryDraftBLDS_TAXAS: TStringField;
    qryDraftBLDS_MOVIMENTO: TStringField;
    qryDraftBLVIAGEM_NAVIO: TStringField;
    qryDraftBLLOCAL_EMBARQUE: TStringField;
    qryDraftBLLOCAL_DESEMBARQUE: TStringField;
    qryDraftBLREFERENCIA_INDAIA: TStringField;
    qryDraftBLREFERENCIA_EMBARQUE: TStringField;
    qryDraftBLCD_RUC: TStringField;
    qryDraftBLCOMENTARIO: TStringField;
    qryDraftBLQT_CNTR: TIntegerField;
    qryDraftBLQT_EMBALAGENS: TIntegerField;
    qryDraftBLQT_PESO: TFMTBCDField;
    qryDraftBLVL_CUBAGEM: TFMTBCDField;
    cdsDraftBLNR_PROCESSO: TStringField;
    cdsDraftBLNR_AMEND: TIntegerField;
    cdsDraftBLDT_CRIACAO: TSQLTimeStampField;
    cdsDraftBLNM_USUARIO: TStringField;
    cdsDraftBLDT_ENVIO_DRAFT: TSQLTimeStampField;
    cdsDraftBLCD_ENVIO_INTTRA: TStringField;
    cdsDraftBLDS_EMAIL_INDAIA: TStringField;
    cdsDraftBLCLIENTE_NOME: TStringField;
    cdsDraftBLCLIENTE_ENDERECO_COMPLETO: TStringField;
    cdsDraftBLAGENTE_NOME: TStringField;
    cdsDraftBLBOOKING_ARMADOR: TStringField;
    cdsDraftBLCONSIG_NOME: TStringField;
    cdsDraftBLCONSIG_ENDERECO_COMPLETO: TStringField;
    cdsDraftBLNOTIFY1_NOME: TStringField;
    cdsDraftBLNOTIFY1_ENDERECO_COMPLETO: TStringField;
    cdsDraftBLNOTIFY2_NOME: TStringField;
    cdsDraftBLNOTIFY2_ENDERECO_COMPLETO: TStringField;
    cdsDraftBLDS_COLLECT_PREPAID: TStringField;
    cdsDraftBLNM_LOCAL_PGMTO_TAXAS: TStringField;
    cdsDraftBLDS_TAXAS: TStringField;
    cdsDraftBLDS_MOVIMENTO: TStringField;
    cdsDraftBLVIAGEM_NAVIO: TStringField;
    cdsDraftBLLOCAL_EMBARQUE: TStringField;
    cdsDraftBLLOCAL_DESEMBARQUE: TStringField;
    cdsDraftBLREFERENCIA_INDAIA: TStringField;
    cdsDraftBLREFERENCIA_EMBARQUE: TStringField;
    cdsDraftBLCD_RUC: TStringField;
    cdsDraftBLCOMENTARIO: TStringField;
    cdsDraftBLQT_CNTR: TIntegerField;
    cdsDraftBLQT_EMBALAGENS: TIntegerField;
    cdsDraftBLQT_PESO: TFMTBCDField;
    cdsDraftBLVL_CUBAGEM: TFMTBCDField;
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
    qryContainerCD_NCM: TStringField;
    qryContainerCD_EMBALAGEM: TStringField;
    qryContainerDS_EMBALAGEM: TStringField;
    qryContainerQT_EMBALAGEM: TIntegerField;
    qryContainerQT_PESO_BRUTO: TBCDField;
    qryDraft: TFDQuery;
    dtsDraft: TDataSource;
    dtsContainer: TDataSource;
    dtsComentarios: TDataSource;
    qryContainerDS_CARGA: TMemoField;
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
    qryDraftTIPO_FRETE_DESCRICAO: TStringField;
    qryDraftCD_TIPO_PGMTO_TAXAS: TIntegerField;
    qryDraftPGTO_TAXA_DESCRICAO: TStringField;
    qryDraftIN_PGMTO_ABROAD: TStringField;
    qryDraftNM_LOCAL_PGMTO_TAXAS: TStringField;
    qryDraftCD_TIPO_MOVIMENTO: TIntegerField;
    qryDraftMOVIMENTO_DESCRICAO: TStringField;
    qryDraftBOOKING_ARMADOR: TStringField;
    qryDraftREFERENCIA_EMBARQUE: TStringField;
    qryDraftNM_NAVIO: TStringField;
    qryDraftNR_VIAGEM: TStringField;
    qryDraftLOCAL_EMBARQUE: TStringField;
    qryDraftLOCAL_EMBARQUE_SIGLA: TStringField;
    qryDraftLOCAL_EMBARQUE_ID: TStringField;
    qryDraftLOCAL_DESEMBARQUE: TStringField;
    qryDraftLOCAL_DESEMBARQUE_SIGLA: TStringField;
    qryDraftLOCAL_DESEMBARQUE_PAIS: TStringField;
    qryDraftLOCAL_DESEMBARQUE_ID: TStringField;
    qryDraftLOCAL_ENTREGA: TStringField;
    qryDraftLOCAL_ENTREGA_SIGLA: TStringField;
    qryDraftLOCAL_ENTREGA_PAIS: TStringField;
    qryDraftLOCAL_ENTREGA_ID: TStringField;
    qryDraftMARCACAO_VOLUMES: TStringField;
    qryDraftLOCAL_LIBERACAO_BL_COD: TStringField;
    qryDraftLOCAL_LIBERACAO_BL_NOME: TStringField;
    qryDraftLOCAL_LIBERACAO_BL_PAIS: TStringField;
    qryDraftLOCAL_LIBERACAO_BL_ID: TStringField;
    qryDraftLOCAL_DELIVERY: TStringField;
    qryContainerNR_LINHA: TLargeintField;
    qryContainerNM_TIPO_CONTAINER: TStringField;
    qryDraftLOCAL_RECEIPT: TStringField;
    qryComentariosTP_DESCRICAO: TStringField;
    qryDraftCLIENTE_PAIS: TStringField;
    qryDraftManifestFilerStatus: TStringField;
    qryDraftManifestFilingCountryCode: TStringField;
    qryDraftManifestFilingCountry: TStringField;
    qryDraftServiceType: TStringField;
    qryDraftTransportStage: TStringField;
    qryDraftTransportMode: TStringField;
    qryDraftEquipmentSupplier: TStringField;
    qryDraftSealingParty: TStringField;
    qryDraftVIAGEM_NAVIO: TStringField;
    qryDraftCD_ENVIO_INTTRA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function AbrirQueryImpressaoDraftBL(processo : string; amend : integer) : integer;
    function AbrirQueryImpressaoDraftBLItens(processo : string; amend : integer) : integer;
    procedure AbrirQueryImpressaoDraftBLComentarios(processo: string; amend: integer);
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

  qryDraft.paramByName('NR_PROCESSO').value := processo;
  qryDraft.paramByName('NR_AMEND').value    := amend;
  qryDraft.open;

//  result := qryDraft.recordCount;
end;

function TdtmGerarArquivosDraft.AbrirQueryImpressaoDraftBLItens(processo : string; amend : integer) : integer;
begin
  if qryContainer.State <> dsInactive then
    qryContainer.close;

  qryContainer.paramByName('NR_PROCESSO').value := processo;
  qryContainer.paramByName('NR_AMEND').value    := amend;
  qryContainer.open;

//  result := qryContainer.recordCount;
end;

procedure TdtmGerarArquivosDraft.AbrirQueryImpressaoDraftBLComentarios(processo : string; amend : integer);
begin
  if qryContainer.State <> dsInactive then
    qryContainer.close;

  qryComentarios.ParamByName('NR_PROCESSO').AsString := processo;
  qryComentarios.ParamByName('NR_amend').AsInteger := amend;
  qryComentarios.Open;
end;

procedure TdtmGerarArquivosDraft.FecharQueriesImpressaoDraftBL;
begin
  qryDraft.close;
  qryContainer.Close;
end;

end.


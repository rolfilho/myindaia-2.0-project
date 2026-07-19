unit Conexao;

interface

uses
  SysUtils, Classes, Variants, DBXMSSQL, DB, SqlExpr, DBXCommon, DBClient,
  FMTBcd, Provider, MaskUtils, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdAttachmentFile, IdText, StrUtils, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

const
  ID_TABELA = 1652005462;

type
  TdtmMyConsultaLiLote = class(TDataModule)
    FDConnection1: TFDConnection;
    qryConsultaLI: TFDQuery;
    qryConsultaLINR_PROCESSO: TStringField;
    qryConsultaLINR_LI: TStringField;
    qryConsultaLIDT_REGISTRO: TSQLTimeStampField;
    qryConsultaLIDT_DEFERIMENTO: TSQLTimeStampField;
    qryConsultaLIDT_VENCTO: TSQLTimeStampField;
    qryConsultaLIIN_SUBSTITUIDA: TStringField;
    qryConsultaLINR_SUBSTITUIDA: TStringField;
    qryConsultaLIIN_CANCELADO: TStringField;
    qryConsultaLITX_OBS_CANC: TMemoField;
    qryConsultaLIIN_UTILIZADO: TStringField;
    qryConsultaLIIN_SEM_REPRESENTACAO: TStringField;
    qryConsultaLIIN_LI_PRE_JA_EMBARCADO: TStringField;
    qryConsultaLIDT_CONSULTA_SCX: TSQLTimeStampField;
    qryConsultaLIIN_FILA_RECUPERAR: TStringField;
    qryConsultaLINR_INMETRO: TIntegerField;
    qryConsultaLINUMERO_IP_BRI: TStringField;
    qryConsultaLIDATA_SOLICI_PRORROGACAO: TSQLTimeStampField;
    qryConsultaLICD_POSTO_ANVISA: TIntegerField;
    qryConsultaLINR_PROCESSO_ANVISA: TStringField;
    qryConsultaLINR_EXPEDIENTE_ANVISA: TStringField;
    qryConsultaLIIN_PRE_EMBARQUE: TStringField;
    qryConsultaLIDT_SOLICITACAO: TSQLTimeStampField;
    qryConsultaLINM_EMISSOR: TStringField;
    qryConsultaLIQT_ITENS: TIntegerField;
    qryConsultaLIDT_APTO_FIN_DOSSIE: TSQLTimeStampField;
    qryConsultaLIDT_FIN_DOSSIE: TSQLTimeStampField;
    qryConsultaLINR_DOSSIE: TStringField;
    qryConsultaLIDT_DOCTOS_DOSSIE: TSQLTimeStampField;
    qryConsultaLIDT_EMISSAO_GRU: TSQLTimeStampField;
    qryConsultaLINR_TRANSACAO_GRU: TStringField;
    qryConsultaLIDT_PGMTO_GRU: TSQLTimeStampField;
    qryConsultaLIDT_PROTOCOLO_GRU: TSQLTimeStampField;
    qryConsultaLICD_CANAL: TStringField;
    qryConsultaLICD_USUARIO_EMISSOR: TStringField;
    qryConsultaLINR_DOSSIE_POS: TStringField;
    qryConsultaLICD_UNID_NEG: TStringField;
    qryConsultaLILI_FORMATADA: TStringField;
    qryConsultaLINM_EMAIL: TStringField;
    qryConsultaLINM_EMPRESA: TStringField;
    qryConsultaLINM_EMAIL_CONSULTA_LI: TStringField;
    qryConsultaStatusLi: TFDQuery;
    qryConsultaStatusLiNR_PROCESSO: TStringField;
    qryConsultaStatusLiNR_LI: TStringField;
    qryConsultaStatusLiDT_STATUS: TSQLTimeStampField;
    qryConsultaStatusLiTX_STATUS: TStringField;
    qryConsultaStatusLiTX_DIR_EXTRATO: TStringField;
    qryConsultaStatusLiCD_ORGAO_ANUENTE: TStringField;
    qryConsultaStatusLiDT_CONSULTA: TSQLTimeStampField;
    qryConsultaStatusLiDT_STATUS_EFETIVA: TSQLTimeStampField;
    qryConsultaStatusLiTX_OBS: TMemoField;
    qryConsultaStatusLiDS_TRATAMENTO_ADM: TMemoField;
    qryConsultaStatusLiDS_ANDAMENTO_ANUENCIA: TMemoField;
    qryConsultaStatusLiDT_VALIDADE_DESPACHO: TSQLTimeStampField;
    qryConsultaStatusLiDT_VALIDADE_EMBARQUE: TSQLTimeStampField;
    qryConsultaStatusLiIN_EMAIL_ENVIADO: TStringField;
    qryProcessosStatusLi: TFDQuery;
    qryConsultaStatusLiDATA_STATUS: TStringField;
    qryProcessosStatusLiNR_PROCESSO: TStringField;
    qryUpdateDtNovoStatus: TFDQuery;
  private

  public

  end;

var
  dtmMyConsultaLiLote: TdtmMyConsultaLiLote;

implementation

uses
  Funcoes;

{$R *.dfm}

end.

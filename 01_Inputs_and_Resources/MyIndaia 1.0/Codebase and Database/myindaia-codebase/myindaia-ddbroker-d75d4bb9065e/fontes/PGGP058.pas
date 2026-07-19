(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGGP058.PAS - datm_ajuste_impressao_nf_serv

AUTOR: Leandro Stipanich

DATA: 31/01/2002

Manutenção: Leandro Stipanich

Data: 08/10/2001 - Ajuste de Impressão de Nota Fiscal de Serviço
*************************************************************************************************)

unit PGGP058;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_ajuste_impressao_nf_serv = class(TDataModule)
    qry_ajuste_impressao_: TQuery;
    qry_unidade_: TQuery;
    qry_unidade_CD_UNID_NEG: TStringField;
    qry_unidade_NM_UNID_NEG: TStringField;
    ds_ajuste_impressao: TDataSource;
    qry_lista_: TQuery;
    ds_lista: TDataSource;
    qry_lista_CD_UNID_NEG: TStringField;
    qry_lista_NM_UNID_NEG: TStringField;
    qry_ajuste_impressao_CD_UNID_NEG: TStringField;
    qry_ajuste_impressao_LookUnidNeg: TStringField;
    qry_ajuste_impressao_L_EMISSAO: TStringField;
    qry_ajuste_impressao_C_EMISSAO: TStringField;
    qry_ajuste_impressao_C_VENCIMENTO: TStringField;
    qry_ajuste_impressao_L_N_REFERENCIA: TStringField;
    qry_ajuste_impressao_C_N_REFERENCIA: TStringField;
    qry_ajuste_impressao_L_RAZAO_SOCIAL: TStringField;
    qry_ajuste_impressao_C_RAZAO_SOCIAL: TStringField;
    qry_ajuste_impressao_C_CODIGO: TStringField;
    qry_ajuste_impressao_L_ENDERECO: TStringField;
    qry_ajuste_impressao_C_ENDERECO: TStringField;
    qry_ajuste_impressao_L_MUNICIPIO: TStringField;
    qry_ajuste_impressao_C_MUNICIPIO: TStringField;
    qry_ajuste_impressao_C_BAIRRO: TStringField;
    qry_ajuste_impressao_C_UF: TStringField;
    qry_ajuste_impressao_C_CEP: TStringField;
    qry_ajuste_impressao_L_CNPJ: TStringField;
    qry_ajuste_impressao_C_CNPJ: TStringField;
    qry_ajuste_impressao_C_IE: TStringField;
    qry_ajuste_impressao_L_AREA: TStringField;
    qry_ajuste_impressao_C_AREA: TStringField;
    qry_ajuste_impressao_C_ANALISTA: TStringField;
    qry_ajuste_impressao_L_S_REFERENCIA: TStringField;
    qry_ajuste_impressao_C_S_REFERENCIA: TStringField;
    qry_ajuste_impressao_L_NAT_DESPACHO: TStringField;
    qry_ajuste_impressao_C_NAT_DESPACHO: TStringField;
    qry_ajuste_impressao_C_MODAL: TStringField;
    qry_ajuste_impressao_L_VEICULO: TStringField;
    qry_ajuste_impressao_C_VEICULO: TStringField;
    qry_ajuste_impressao_C_ORIGEM: TStringField;
    qry_ajuste_impressao_C_DESTINO: TStringField;
    qry_ajuste_impressao_L_VOLUMES: TStringField;
    qry_ajuste_impressao_C_VOLUMES: TStringField;
    qry_ajuste_impressao_C_PESO_BRUTO: TStringField;
    qry_ajuste_impressao_C_PESO_LIQUIDO: TStringField;
    qry_ajuste_impressao_L_VALOR_FOB: TStringField;
    qry_ajuste_impressao_C_VALOR_FOB: TStringField;
    qry_ajuste_impressao_C_VALOR_CIF: TStringField;
    qry_ajuste_impressao_L_DI: TStringField;
    qry_ajuste_impressao_C_DI: TStringField;
    qry_ajuste_impressao_NR_LINHAS: TIntegerField;
    qry_ajuste_impressao_L_DESCRICAO: TStringField;
    qry_ajuste_impressao_C_DESCRICAO: TStringField;
    qry_ajuste_impressao_C_CLIENTE: TStringField;
    qry_ajuste_impressao_C_INDAIA: TStringField;
    qry_ajuste_impressao_C_SERVICOS: TStringField;
    qry_ajuste_impressao_L_OBS: TStringField;
    qry_ajuste_impressao_C_OBS: TStringField;
    qry_ajuste_impressao_L_NAO_TRIBUTAVEL: TStringField;
    qry_ajuste_impressao_C_NAO_TRIBUTAVEL: TStringField;
    qry_ajuste_impressao_C_SUB_TOTAL_TRIBUTAVEL: TStringField;
    qry_ajuste_impressao_L_COMISSAO: TStringField;
    qry_ajuste_impressao_C_COMISSAO: TStringField;
    qry_ajuste_impressao_L_TOTAL_GERAL: TStringField;
    qry_ajuste_impressao_C_TOTAL_GERAL: TStringField;
    qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL: TStringField;
    qry_ajuste_impressao_C_TOTAL_TRIBUTAVEL: TStringField;
    qry_ajuste_impressao_L_ISS: TStringField;
    qry_ajuste_impressao_C_ISS: TStringField;
    qry_ajuste_impressao_L_IRRF: TStringField;
    qry_ajuste_impressao_C_IRRF: TStringField;
    qry_ajuste_impressao_NR_ULT_NF_SERV: TStringField;
    qry_ajuste_impressao_C_COFINS: TStringField;
    qry_ajuste_impressao_L_COFINS: TStringField;
    procedure qry_lista_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ajuste_impressao_nf_serv: Tdatm_ajuste_impressao_nf_serv;

implementation

{$R *.DFM}

procedure Tdatm_ajuste_impressao_nf_serv.qry_lista_AfterScroll(DataSet: TDataSet);
begin
  qry_ajuste_impressao_.Close;
  qry_ajuste_impressao_.ParamByName('CD_UNID_NEG').AsString := qry_lista_CD_UNID_NEG.AsString;
  qry_ajuste_impressao_.Prepare;
  qry_ajuste_impressao_.Open;
end;

end.

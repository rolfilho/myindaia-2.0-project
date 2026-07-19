unit PGCH030;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_sel_unid_cli_mes_ano = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_grupo_DT_INCLUSAO: TDateTimeField;
    qry_grupo_IN_ATIVO: TStringField;
    qry_mapa_seg_: TQuery;
    qry_ref_cli_: TQuery;
    qry_ref_cli_CD_REFERENCIA: TStringField;
    ds_mapa_seg: TDataSource;
    qry_faturas_: TQuery;
    qry_faturas_NR_DCTO_INSTRUCAO: TStringField;
    qry_moeda_: TQuery;
    qry_moeda_CD_MOEDA: TStringField;
    qry_moeda_NM_MOEDA: TStringField;
    qry_moeda_AP_MOEDA: TStringField;
    qry_mapa_seg_NR_PROCESSO: TStringField;
    qry_mapa_seg_CD_UNID_NEG: TStringField;
    qry_mapa_seg_CD_CLIENTE: TStringField;
    qry_mapa_seg_NR_VOO: TStringField;
    qry_mapa_seg_NR_CONHECIMENTO: TStringField;
    qry_mapa_seg_CD_MOEDA_MLE: TStringField;
    qry_mapa_seg_CD_MOEDA_FRETE: TStringField;
    qry_mapa_seg_VL_MLE_MNEG: TFloatField;
    qry_mapa_seg_VL_FRETE_PREPAID_MNEG: TFloatField;
    qry_mapa_seg_VL_FRETE_COLLECT_MNEG: TFloatField;
    qry_mapa_seg_VL_FRETE_TNAC_MNEG: TFloatField;
    qry_mapa_seg_NM_EMPRESA: TStringField;
    qry_mapa_seg_NM_EMBARCACAO: TStringField;
    qry_mapa_seg_NM_PAIS: TStringField;
    qry_mapa_seg_DT_EMBARQUE: TStringField;
    qry_mapa_seg_LookMoedaMLE: TStringField;
    qry_mapa_seg_LookMoedaFrete: TStringField;
    qry_itens_dm_: TQuery;
    qry_itens_dm_CD_ITEM: TStringField;
    qry_dm_: TQuery;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_dm_CalcNrProcesso: TStringField;
    qry_itens_dm_NM_APELIDO: TStringField;
    qry_dm_NR_PROCESSO: TStringField;
    qry_dm_CD_ITEM: TStringField;
    qry_dm_VL_ITEM: TFloatField;
    qry_processo_CalcNrProcesso: TStringField;
    ds_processo: TDataSource;
    qry_processo_DT_DESEMB: TDateTimeField;
    qry_processo_DT_CHEGADA: TDateTimeField;
    qry_processo_DT_RECEB_DOC: TDateTimeField;
    qry_processo_CD_VIA_TRANSPORTE: TStringField;
    qry_tot_proc_: TQuery;
    qry_tot_proc_TOT_PROC: TIntegerField;
    qry_fob_us_: TQuery;
    qry_fob_us_NR_PROCESSO: TStringField;
    qry_fob_us_VL_MLE_MN: TFloatField;
    qry_fob_us_TX_DOLAR: TFloatField;
    qry_fob_us_CalcValorFOB: TFloatField;
    procedure qry_processo_CalcFields(DataSet: TDataSet);
    procedure qry_fob_us_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_unid_cli_mes_ano: Tdatm_sel_unid_cli_mes_ano;

implementation

{$R *.DFM}

uses GSMLIB;

procedure Tdatm_sel_unid_cli_mes_ano.qry_processo_CalcFields(DataSet: TDataSet);
begin
  qry_processo_CalcNrProcesso.AsString := Copy(qry_processo_NR_PROCESSO.AsString,5,14);
                                          //Copy( qry_processo_NR_PROCESSO.AsString, 5, 2 ) + '/' +
                                          //Copy( qry_processo_NR_PROCESSO.AsString, 7, 4 ) + '-' +
                                          //Copy( qry_processo_NR_PROCESSO.AsString, 11, 1 );
end;

procedure Tdatm_sel_unid_cli_mes_ano.qry_fob_us_CalcFields( DataSet: TDataSet );
begin
  if qry_fob_us_TX_DOLAR.AsFloat = 0 then
     qry_fob_us_CalcValorFOB.AsFloat := 0
  else
     qry_fob_us_CalcValorFOB.AsFloat :=
        Arredondar( ( qry_fob_us_VL_MLE_MN.AsFloat / qry_fob_us_TX_DOLAR.AsFloat ), 2 );
end;


end.

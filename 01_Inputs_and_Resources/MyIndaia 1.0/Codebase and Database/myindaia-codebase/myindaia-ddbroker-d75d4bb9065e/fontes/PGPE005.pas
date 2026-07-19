unit PGPE005;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, DBIProcs;

type
  Tdatm_pe_capa = class(TDataModule)
    ds_pe: TDataSource;
    qry_pe_: TQuery;
    qry_pais_: TQuery;
    qry_urf_: TQuery;
    qry_moeda_: TQuery;
    ds_via_transporte: TDataSource;
    qry_via_transporte_: TQuery;
    qry_via_transporte_CD_VIA_TRANSPORTE: TStringField;
    qry_via_transporte_NM_VIA_TRANSPORTE: TStringField;
    qry_emp_est_: TQuery;
    ds_emp_est: TDataSource;
    qry_local_embarque_: TQuery;
    qry_local_embarque_CODIGO: TStringField;
    qry_local_embarque_DESCRICAO: TStringField;
    qry_local_embarque_CD_UNID_NEG_LOCAL: TStringField;
    qry_despachante_: TQuery;
    qry_despachante_CD_DESPACHANTE: TStringField;
    qry_despachante_NM_DESPACHANTE: TStringField;
    qry_despachante_AP_DESPACHANTE: TStringField;
    ds_despachante: TDataSource;
    qry_ag_: TQuery;
    ds_ag: TDataSource;
    qry_forma_pagto_: TQuery;
    qry_forma_pagto_CODIGO: TStringField;
    qry_forma_pagto_DESCRICAO: TStringField;
    qry_lingua_: TQuery;
    qry_lingua_CODIGO: TStringField;
    qry_lingua_DESCRICAO: TStringField;
    qry_tp_frete_: TQuery;
    qry_tp_frete_CODIGO: TStringField;
    qry_tp_frete_DESCRICAO: TStringField;
    qry_tp_pessoa_exp_: TQuery;
    qry_tp_pessoa_exp_CODIGO: TStringField;
    qry_tp_pessoa_exp_DESCRICAO: TStringField;
    ds_tp_frete: TDataSource;
    ds_tp_pessoa_exp: TDataSource;
    ds_lingua: TDataSource;
    ds_forma_pagto: TDataSource;
    qry_exec_sp_: TQuery;
    qry_pe_NR_PROCESSO: TStringField;
    qry_pe_CD_EXPORTADOR: TStringField;
    qry_pe_CD_IMPORTADOR: TStringField;
    qry_pe_CD_DESPACHANTE: TStringField;
    qry_pe_CD_AGENTE: TStringField;
    qry_pe_CD_INCOTERM: TStringField;
    qry_pe_CD_PAIS_DESTINO: TStringField;
    qry_pe_CD_MOEDA: TStringField;
    qry_pe_CD_VIA_TRANSPORTE: TStringField;
    qry_pe_CD_SEGURADORA: TStringField;
    qry_pe_CD_REPRESENTANTE: TStringField;
    qry_pe_CD_LOCAL_ORIGEM: TStringField;
    qry_pe_CD_LOCAL_DESTINO: TStringField;
    qry_pe_CD_URF_DESPACHO: TStringField;
    qry_pe_CD_URF_DESTINO: TStringField;
    qry_pe_CD_TERMO_PAGTO: TStringField;
    qry_pe_CD_FORMA_PAGTO: TStringField;
    qry_pe_CD_LINGUA_PEDIDO: TStringField;
    qry_pe_CD_TIPO_FRETE: TStringField;
    qry_pe_CD_USUARIO: TStringField;
    qry_pe_CD_CARTA_CREDITO: TStringField;
    qry_pe_CD_INST_NEGOC: TStringField;
    qry_pe_CD_CONSIGNATARIO: TStringField;
    qry_pe_CD_NOTIFY1: TStringField;
    qry_pe_CD_NOTIFY2: TStringField;
    qry_pe_DT_REGISTRO_PEDIDO: TDateTimeField;
    qry_pe_DT_FATURA: TDateTimeField;
    qry_pe_IN_DRAWBACK: TBooleanField;
    qry_pe_NR_LI: TStringField;
    qry_pe_NR_FATURA: TStringField;
    qry_pe_VL_FRETE: TFloatField;
    qry_pe_VL_SEGURO: TFloatField;
    qry_pe_VL_PESO_BRUTO: TFloatField;
    qry_pe_VL_PESO_LIQUIDO: TFloatField;
    qry_pe_VL_DESCONTO: TFloatField;
    qry_pe_VL_COMISSAO_PERCENT: TFloatField;
    qry_pe_VL_TOT_ORIGEM: TFloatField;
    qry_pe_VL_TOT_CUBAGEM: TFloatField;
    qry_pe_VL_TOT_FOB: TFloatField;
    qry_pe_VL_TOT_COM_AGENTE: TFloatField;
    qry_pe_VL_TOT_QTDE_PROD: TFloatField;
    qry_pe_VL_TOT_QTDE_EMBALAGEM: TFloatField;
    qry_pe_VL_TOT_MCV: TFloatField;
    qry_pe_VL_TX_CAMBIO: TFloatField;
    qry_pe_VL_TOT_CONTAINER: TFloatField;
    qry_pe_VL_TOT_PALLETS: TFloatField;
    qry_pe_VL_TOT_EXW: TFloatField;
    qry_pe_TX_INF_EMBALAGEM: TMemoField;
    qry_pe_TX_MARCACAO_VOLUME: TMemoField;
    qry_pe_TX_DECL_EXPORTADOR: TMemoField;
    qry_pe_TX_DECL_ADICIONAL: TMemoField;
    qry_pe_TX_TERMO_PAGTO: TMemoField;
    qry_pe_CD_TRANSPORTADORA: TStringField;
    qry_pe_TP_CONSIGNATARIO: TStringField;
    qry_pe_TP_NOTIFY1: TStringField;
    qry_pe_TP_NOTIFY2: TStringField;
    qry_pe_LookURFDespacho: TStringField;
    qry_pe_LookURFEmbarque: TStringField;
    qry_pe_LookNmMoeda: TStringField;
    qry_pe_LookNmPais: TStringField;
    qry_pe_LookNmLocalOrigem: TStringField;
    qry_pe_LookNmLocalDestino: TStringField;
    qry_pe_LookNmDespachante: TStringField;
    qry_pe_LookNmAgente: TStringField;
    qry_emp_est_CD_EMPRESA: TStringField;
    qry_emp_est_NM_EMPRESA: TStringField;
    qry_emp_est_AP_EMPRESA: TStringField;
    ds_incoterms: TDataSource;
    qry_incoterms_: TQuery;
    qry_incoterms_CODIGO: TStringField;
    qry_incoterms_DESCRICAO: TStringField;
    qry_incoterms_SINAL: TStringField;
    qry_pe_LookNmIncoterm: TStringField;
    qry_transp_itl_: TQuery;
    qry_transp_itl_CODIGO: TStringField;
    qry_transp_itl_DESCRICAO: TStringField;
    ds_transp_itl: TDataSource;
    qry_pe_LookNmTransportadora: TStringField;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    ds_banco: TDataSource;
    qry_moeda_CODIGO: TStringField;
    qry_moeda_DESCRICAO: TStringField;
    qry_pais_CODIGO: TStringField;
    qry_pais_DESCRICAO: TStringField;
    qry_urf_CODIGO: TStringField;
    qry_urf_DESCRICAO: TStringField;
    qry_inst_negoc_: TQuery;
    ds_inst_negoc: TDataSource;
    qry_inst_negoc_CD_INST_NEGOC: TStringField;
    qry_inst_negoc_NM_INST_NEGOC: TStringField;
    qry_pe_LookNmInstNeg: TStringField;
    qry_termo_pagto_: TQuery;
    ds_termo_pagto: TDataSource;
    qry_termo_pagto_CD_TERMO_PAGTO: TStringField;
    qry_termo_pagto_NM_TERMO_PAGTO: TStringField;
    qry_pe_LookNmTermoPagto: TStringField;
    qry_ag_CD_AGENTE: TStringField;
    qry_ag_NM_AGENTE: TStringField;
    qry_emp_nac_: TQuery;
    ds_emp_nac: TDataSource;
    qry_emp_nac_NM_EMPRESA: TStringField;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_nm_consig_: TQuery;
    ds_nm_consig: TDataSource;
    qry_pe_CalcNmConsignatario: TStringField;
    qry_pe_CalcNmNotify1: TStringField;
    qry_pe_CalcNmNotify2: TStringField;
    qry_nm_notify1_: TQuery;
    ds_nm_notify1: TDataSource;
    qry_nm_notify2_: TQuery;
    ds_nm_notify2: TDataSource;
    qry_pe_CD_UNID_NEG: TStringField;
    qry_pe_QT_TOTAL_ITENS: TStringField;
    qry_pe_IN_SELECIONADO: TStringField;
    qry_pe_IN_MONTADO: TStringField;
    qry_pe_LookNmExportador: TStringField;
    qry_pe_LookNmRepresentante: TStringField;
    qry_pe_LookNmSeguradora: TStringField;
    qry_pe_LookNmImportador: TStringField;
    qry_pe_itens_: TQuery;
    procedure qry_pe_BeforeEdit(DataSet: TDataSet);
    procedure VerificaEstado(Habilita : Boolean);
    procedure qry_pe_BeforeInsert(DataSet: TDataSet);
    procedure qry_pe_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pe_capa: Tdatm_pe_capa;

implementation

{$R *.DFM}
uses GSMLIB, PGGP001, PGGP017, PGPE001;

procedure Tdatm_pe_capa.VerificaEstado(Habilita : Boolean);
begin
  frm_PE_capa.btn_salvar.Enabled   := Habilita;
  frm_PE_capa.btn_cancelar.Enabled := Habilita;
  frm_PE_capa.mi_salvar.Enabled    := Habilita;
  frm_PE_capa.mi_cancelar.Enabled  := Habilita;
  frm_PE_Capa.mi_excluir.Enabled   := not Habilita;
  frm_PE_Capa.btn_excluir.Enabled  := not Habilita;
end;

procedure Tdatm_pe_capa.qry_pe_BeforeEdit(DataSet: TDataSet);
begin
   VerificaEstado( True );
end;

procedure Tdatm_pe_capa.qry_pe_BeforeInsert(DataSet: TDataSet);
begin
   VerificaEstado( True );
end;

procedure Tdatm_pe_capa.qry_pe_CalcFields(DataSet: TDataSet);
begin
  {Consignatário}
  if Not qry_pe_TP_CONSIGNATARIO.IsNull then
  begin
    qry_nm_consig_.Close;
    qry_nm_consig_.SQL.Clear;
    case StrToInt( qry_pe_TP_CONSIGNATARIO.AsString ) of
      {Importador}
      0 : begin
            qry_nm_consig_.SQL.Add( 'SELECT NM_EMPRESA NM_CONSIGNATARIO FROM TEMPRESA_EST WHERE IN_ATIVO = "1" AND ' +
                                    'IN_IMPORTADOR = "1" AND CD_EMPRESA = "' + qry_pe_CD_CONSIGNATARIO.AsString + '"');
          end ;
      {Agente}
      1 : begin
            qry_nm_consig_.SQL.Add( 'SELECT NM_EMPRESA NM_CONSIGNATARIO FROM TEMPRESA_EST WHERE IN_ATIVO = "1" AND ' +
                                    'IN_AGENTE = "1" AND CD_EMPRESA = "' + qry_pe_CD_CONSIGNATARIO.AsString + '"');
          end ;
      {Transportadora}
      2 : begin
            qry_nm_consig_.SQL.Add( 'SELECT DESCRICAO NM_CONSIGNATARIO FROM TTRANSPORTADOR_ITL WHERE CODIGO = "' +
                                    qry_pe_CD_CONSIGNATARIO.AsString + '"');
          end ;
      {Banco}
      3 : begin
            qry_nm_consig_.SQL.Add( 'SELECT NM_EMPRESA NM_CONSIGNATARIO FROM TEMPRESA_EST WHERE IN_ATIVO = "1" AND ' +
                                    'IN_BANCO = "1" AND CD_EMPRESA = "' + qry_pe_CD_CONSIGNATARIO.AsString + '"');
          end ;
      {Despachante}
      4 : begin
            qry_nm_consig_.SQL.Add( 'SELECT NM_DESPACHANTE NM_CONSIGNATARIO FROM TDESPACHANTE WHERE IN_ATIVO = "1" AND CD_DESPACHANTE = "' +
                                    qry_pe_CD_CONSIGNATARIO.AsString + '"');
          end ;
    end;
    qry_nm_consig_.Prepare;
    qry_nm_consig_.Open;
    frm_pe_capa.dbedt_nm_consignatario.Text := qry_nm_consig_.FieldByName('NM_CONSIGNATARIO').AsString;
    qry_pe_CalcNmConsignatario.AsString     := qry_nm_consig_.FieldByName('NM_CONSIGNATARIO').AsString;
    qry_nm_consig_.Close;
  end;

  {Notify1}
  if Not qry_pe_TP_NOTIFY1.IsNull then
  begin
    qry_nm_notify1_.Close;
    qry_nm_notify1_.SQL.Clear;
    case StrToInt( qry_pe_TP_NOTIFY1.AsString ) of
      {Importador}
      0 : begin
            qry_nm_notify1_.SQL.Add( 'SELECT NM_EMPRESA NM_NOTIFY1 FROM TEMPRESA_EST WHERE IN_ATIVO = "1" AND ' +
                                     'IN_IMPORTADOR = "1" AND CD_EMPRESA = "' + qry_pe_CD_NOTIFY1.AsString + '"');
          end ;
      {Agente}
      1 : begin
            qry_nm_notify1_.SQL.Add( 'SELECT NM_EMPRESA NM_NOTIFY1 FROM TEMPRESA_EST WHERE IN_ATIVO = "1" AND ' +
                                     'IN_AGENTE = "1" AND CD_EMPRESA = "' + qry_pe_CD_NOTIFY1.AsString + '"');
          end ;
      {Transportadora}
      2 : begin
            qry_nm_notify1_.SQL.Add( 'SELECT DESCRICAO NM_NOTIFY1 FROM TTRANSPORTADOR_ITL WHERE CODIGO = "' +
                                    qry_pe_CD_NOTIFY1.AsString + '"');
          end ;
      {Banco}
      3 : begin
            qry_nm_notify1_.SQL.Add( 'SELECT NM_EMPRESA NM_NOTIFY1 FROM TEMPRESA_EST WHERE IN_ATIVO = "1" AND ' +
                                     'IN_BANCO = "1" AND CD_EMPRESA = "' + qry_pe_CD_NOTIFY1.AsString + '"');
          end ;
      {Despachante}
      4 : begin
            qry_nm_notify1_.SQL.Add( 'SELECT NM_DESPACHANTE NM_NOTIFY1 FROM TDESPACHANTE WHERE IN_ATIVO = "1" AND CD_DESPACHANTE = "' +
                                    qry_pe_CD_NOTIFY1.AsString + '"');
          end ;
    end;
    qry_nm_notify1_.Prepare;
    qry_nm_notify1_.Open;
    frm_pe_capa.dbedt_nm_notificado1.Text := qry_nm_notify1_.FieldByName('NM_NOTIFY1').AsString;
    qry_pe_CalcNmNotify1.AsString         := qry_nm_notify1_.FieldByName('NM_NOTIFY1').AsString;
    qry_nm_notify1_.Close;
  end;

  {Notify2}
  if Not qry_pe_TP_NOTIFY2.IsNull then
  begin
    qry_nm_notify2_.Close;
    qry_nm_notify2_.SQL.Clear;
    case StrToInt( qry_pe_TP_NOTIFY2.AsString ) of
      {Importador}
      0 : begin
            qry_nm_notify2_.SQL.Add( 'SELECT NM_EMPRESA NM_NOTIFY2 FROM TEMPRESA_EST WHERE IN_ATIVO = "1" AND ' +
                                     'IN_IMPORTADOR = "1" AND CD_EMPRESA = "' + qry_pe_CD_NOTIFY2.AsString + '"');
          end ;
      {Agente}
      1 : begin
            qry_nm_notify2_.SQL.Add( 'SELECT NM_EMPRESA NM_NOTIFY2 FROM TEMPRESA_EST WHERE IN_ATIVO = "1" AND ' +
                                     'IN_AGENTE = "1" AND CD_EMPRESA = "' + qry_pe_CD_NOTIFY2.AsString + '"');
          end ;
      {Transportadora}
      2 : begin
            qry_nm_notify2_.SQL.Add( 'SELECT DESCRICAO NM_NOTIFY2 FROM TTRANSPORTADOR_ITL WHERE CODIGO = "' +
                                    qry_pe_CD_NOTIFY2.AsString + '"');
          end ;
      {Banco}
      3 : begin
            qry_nm_notify2_.SQL.Add( 'SELECT NM_EMPRESA NM_NOTIFY2 FROM TEMPRESA_EST WHERE IN_ATIVO = "1" AND '+
                                     'IN_BANCO = "1" AND CD_EMPRESA = "' + qry_pe_CD_NOTIFY2.AsString + '"');
          end ;
      {Despachante}
      4 : begin
            qry_nm_notify2_.SQL.Add( 'SELECT NM_DESPACHANTE NM_NOTIFY2 FROM TDESPACHANTE WHERE IN_ATIVO = "1" AND CD_DESPACHANTE = "' +
                                    qry_pe_CD_NOTIFY2.AsString + '"');
          end ;
    end;
    qry_nm_notify2_.Prepare;
    qry_nm_notify2_.Open;
    frm_pe_capa.dbedt_nm_notificado2.Text := qry_nm_notify2_.FieldByName('NM_NOTIFY2').AsString;
    qry_pe_CalcNmNotify2.AsString         := qry_nm_notify2_.FieldByName('NM_NOTIFY2').AsString;
    qry_nm_notify2_.Close;
  end;
end;




end.

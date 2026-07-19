(*************************************************************************************************
Sistema: Entreposto - Pro-Forma DA

PROGRAMA: PGEN002.PAS - datm_da - Pro-Forma DA

AUTOR: Leandro Stipanich

DATA: 01/10/2002

Manutenção: Leandro Stipanich
*************************************************************************************************)
unit PGEN002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db,
  DBTables;

type
  Tdatm_da = class(TDataModule)
    qry_processo_: TQuery;
    qry_da_: TQuery;
    ds_da: TDataSource;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_yes_no_: TQuery;
    qry_yes_no_CD_YESNO: TStringField;
    qry_yes_no_TX_YESNO: TStringField;
    qry_unid_neg_: TQuery;
    qry_produto_: TQuery;
    qry_lista_merc_: TQuery;
    ds_lista_merc: TDataSource;
    qry_ref_: TQuery;
    ds_ref: TDataSource;
    qry_usuario_habilitacao_: TQuery;
    qry_lista_ref_: TQuery;
    ds_lista_ref: TDataSource;
    qry_lote_: TQuery;
    ds_lote: TDataSource;
    qry_lista_lote_: TQuery;
    ds_lista_lote: TDataSource;
    us_da: TUpdateSQL;
    us_ref: TUpdateSQL;
    us_lote: TUpdateSQL;
    qry_da_NR_PROCESSO: TStringField;
    qry_da_TX_MERCADORIA: TMemoField;
    qry_da_CD_EMBARCACAO: TStringField;
    qry_da_NR_VIAGEM: TStringField;
    qry_da_CD_ARMAZEM_ATRACACAO: TStringField;
    qry_da_CD_ARMAZEM_DESCARGA: TStringField;
    qry_da_NR_CONHECIMENTO: TStringField;
    qry_da_NR_CONHECIMENTO_MASTER: TStringField;
    qry_da_DT_CONHECIMENTO: TDateTimeField;
    qry_da_CD_LOCAL_EMBARQUE: TStringField;
    qry_da_CD_LOCAL_DESEMBARQUE: TStringField;
    qry_da_IN_ENTREPOSTO: TStringField;
    qry_da_CD_AGENTE: TStringField;
    qry_da_CD_TRANSPORTADOR: TStringField;
    qry_da_CD_INCOTERM: TStringField;
    qry_da_CD_MOEDA_MLE: TStringField;
    qry_da_VL_MLE_MNEG: TFloatField;
    qry_da_IN_EMBUT_FRT_ITENS: TStringField;
    qry_da_TP_FRETE: TStringField;
    qry_da_CD_MOEDA_FRETE: TStringField;
    qry_da_VL_FRETE_MNEG: TFloatField;
    qry_da_IN_EMBUT_SEG_ITENS: TStringField;
    qry_da_CD_MOEDA_SEGURO: TStringField;
    qry_da_VL_SEGURO_MNEG: TFloatField;
    qry_da_NR_DA: TStringField;
    qry_da_DT_DA: TDateTimeField;
    qry_lista_merc_CD_MERCADORIA: TStringField;
    qry_lista_merc_AP_MERCADORIA: TStringField;
    qry_lista_merc_AP_MOEDA: TStringField;
    qry_lista_ref_NR_REF: TStringField;
    qry_lista_ref_AP_MOEDA: TStringField;
    qry_lista_lote_NR_LOTE: TStringField;
    qry_merc_: TQuery;
    ds_merc: TDataSource;
    qry_merc_CD_MERCADORIA: TStringField;
    qry_merc_AP_MERCADORIA: TStringField;
    qry_merc_CD_AREA: TStringField;
    qry_merc_NM_AREA: TStringField;
    qry_merc_CD_PROPRIETARIO: TStringField;
    qry_merc_NM_PROPRIETARIO: TStringField;
    qry_merc_CD_EMBALAGEM_SCX: TStringField;
    qry_merc_NM_EMBALAGEM: TStringField;
    qry_merc_PL_MERCADORIA: TFloatField;
    qry_ref_NR_PROCESSO: TStringField;
    qry_ref_NR_REF: TStringField;
    qry_ref_CD_MERCADORIA: TStringField;
    qry_ref_IN_CERT_ANALISE: TStringField;
    qry_ref_CD_UNID_MEDIDA: TStringField;
    qry_ref_VL_UNITARIO: TFloatField;
    qry_ref_CD_MOEDA_MLE: TStringField;
    qry_ref_VL_FRETE_MNEG: TFloatField;
    qry_ref_IN_EMBUT_FRT_ITENS: TStringField;
    qry_ref_VL_SEGURO_MNEG: TFloatField;
    qry_ref_IN_EMBUT_SEG_ITENS: TStringField;
    qry_ref_VL_MLE_MNEG: TFloatField;
    qry_ref_VL_MLE_DOLAR: TFloatField;
    qry_ref_TX_MLE: TFloatField;
    qry_ref_TX_DOLAR: TFloatField;
    qry_lote_NR_PROCESSO: TStringField;
    qry_lote_NR_REF: TStringField;
    qry_lote_CD_MERCADORIA: TStringField;
    qry_lote_NR_LOTE: TStringField;
    qry_lote_DT_FABRICACAO: TDateTimeField;
    qry_lote_DT_VALIDADE: TDateTimeField;
    qry_lote_TX_AVARIA: TMemoField;
    qry_da_vencto_: TQuery;
    ds_da_vencto: TDataSource;
    us_da_vencto: TUpdateSQL;
    qry_lista_da_vencto_: TQuery;
    ds_lista_da_vencto: TDataSource;
    qry_lista_da_vencto_NR_PROCESSO: TStringField;
    qry_lista_da_vencto_DT_VENCTO_DA: TDateTimeField;
    qry_lista_da_vencto_NR_PROTOCOLO: TStringField;
    qry_lista_da_vencto_DT_PROTOCOLO: TDateTimeField;
    qry_lista_da_vencto_DT_DEFERIMENTO: TDateTimeField;
    qry_da_vencto_NR_PROCESSO: TStringField;
    qry_da_vencto_DT_VENCTO_DA: TDateTimeField;
    qry_da_vencto_NR_PROTOCOLO: TStringField;
    qry_da_vencto_DT_PROTOCOLO: TDateTimeField;
    qry_da_vencto_DT_DEFERIMENTO: TDateTimeField;
    qry_da_lib_avaria_: TQuery;
    ds_da_lib_avaria: TDataSource;
    us_da_lib_avaria: TUpdateSQL;
    qry_lista_da_lib_avaria_: TQuery;
    ds_lista_da_lib_avaria: TDataSource;
    qry_lista_da_lib_avaria_DT_LIB: TDateTimeField;
    qry_lista_da_lib_avaria_CD_USUARIO_LIB: TStringField;
    qry_lista_da_lib_avaria_NM_USUARIO: TStringField;
    qry_lista_da_lib_avaria_QT_LIB: TIntegerField;
    qry_da_lib_avaria_NR_PROCESSO: TStringField;
    qry_da_lib_avaria_NR_REF: TStringField;
    qry_da_lib_avaria_CD_MERCADORIA: TStringField;
    qry_da_lib_avaria_NR_LOTE: TStringField;
    qry_da_lib_avaria_DT_LIB: TDateTimeField;
    qry_da_lib_avaria_QT_LIB: TIntegerField;
    qry_da_lib_avaria_CD_USUARIO_LIB: TStringField;
    qry_da_lib_avaria_TX_MOTIVO_LIB: TMemoField;
    qry_lista_ref_QT_REF: TIntegerField;
    qry_local_: TQuery;
    qry_armazem_: TQuery;
    qry_embarcacao_: TQuery;
    qry_viagem_: TQuery;
    qry_incoterm_: TQuery;
    qry_agente_: TQuery;
    qry_transp_itl_: TQuery;
    qry_moeda_: TQuery;
    qry_tp_frete_: TQuery;
    qry_tp_frete_CD_TP_FRETE: TStringField;
    qry_tp_frete_NM_TP_FRETE: TStringField;
    qry_mercadoria_: TQuery;
    qry_unid_medida_: TQuery;
    qry_usuario_: TQuery;
    qry_da_LookLocalEmbarque: TStringField;
    qry_da_LookLocalDesembarque: TStringField;
    qry_da_LookArmazemAtracacao: TStringField;
    qry_da_LookArmazemDescarga: TStringField;
    qry_da_LookEmbarcacao: TStringField;
    qry_da_LookAgente: TStringField;
    qry_da_LookTransportador: TStringField;
    qry_da_LookMoedaMLE: TStringField;
    qry_da_LookMoedaFrete: TStringField;
    qry_da_LookMoedaSeguro: TStringField;
    qry_tp_cntr_: TQuery;
    qry_tp_cntr_CODIGO: TStringField;
    qry_tp_cntr_DESCRICAO: TStringField;
    qry_da_LookTpFrete: TStringField;
    qry_merc_CD_MATERIAL: TStringField;
    qry_ref_LookMercadoria: TStringField;
    qry_ref_LookUnidMedida: TStringField;
    qry_ref_LookMoedaMLE: TStringField;
    qry_da_lib_avaria_LookUsuario: TStringField;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_da_LookIncoterm: TStringField;
    qry_processo_IN_PRODUCAO: TStringField;
    qry_lista_ref_NR_PROCESSO: TStringField;
    qry_lista_ref_CD_MERCADORIA: TStringField;
    qry_lista_lote_NR_PROCESSO: TStringField;
    qry_lista_lote_CD_MERCADORIA: TStringField;
    qry_lista_lote_NR_REF: TStringField;
    qry_lista_da_lib_avaria_NR_PROCESSO: TStringField;
    qry_lista_da_lib_avaria_CD_MERCADORIA: TStringField;
    qry_lista_da_lib_avaria_NR_REF: TStringField;
    qry_lista_da_lib_avaria_NR_LOTE: TStringField;
    qry_da_DT_VENCTO_DA: TDateTimeField;
    qry_tot_merc_: TQuery;
    qry_tot_ref_: TQuery;
    qry_tot_lote_: TQuery;
    qry_tot_lib_avaria_: TQuery;
    qry_tot_ref_VL_TOT_REF: TIntegerField;
    qry_tot_lote_VL_TOT_LOTE: TIntegerField;
    qry_tot_lib_avaria_VL_TOT_LIB: TIntegerField;
    ds_tot_merc: TDataSource;
    ds_tot_ref: TDataSource;
    ds_tot_lote: TDataSource;
    ds_tot_lib_avaria: TDataSource;
    qry_ref_QT_REF: TIntegerField;
    qry_lista_lote_QT_LOTE: TIntegerField;
    qry_lote_QT_LOTE: TIntegerField;
    qry_lote_QT_AVARIA: TIntegerField;
    qry_lote_QT_AVARIA_LIB: TIntegerField;
    qry_lote_QT_DISPONIVEL: TIntegerField;
    qry_lote_QT_NAC: TIntegerField;
    qry_lote_QT_AG_DESEMB: TIntegerField;
    qry_lote_QT_TRANSITO: TIntegerField;
    qry_existe_di_: TQuery;
    qry_existe_di_EXISTEDI: TIntegerField;
    qry_lista_merc_QT_REF: TIntegerField;
    qry_tot_merc_VL_TOT_QT_REF: TIntegerField;
    qry_da_CD_TIPO_BASE_SEGURO: TStringField;
    qry_da_PC_SEGURO_MLE: TFloatField;
    qry_da_VL_MLD_MNEG: TFloatField;
    qry_da_DT_CALCULO: TDateTimeField;
    qry_da_TX_MLE: TFloatField;
    qry_da_TX_FRETE: TFloatField;
    qry_da_TX_SEGURO: TFloatField;
    qry_da_TX_DOLAR: TFloatField;
    qry_ref_VL_MLD_MNEG: TFloatField;
    qry_merc_CD_UN_MED_COMERC: TStringField;
    qry_vencto_: TQuery;
    qry_vencto_NR_DA: TStringField;
    qry_vencto_DT_VENCTO_DA: TDateTimeField;
    ds_vencto: TDataSource;
    qry_da_VL_MLE_DOLAR: TFloatField;
    qry_da_VL_MLD_DOLAR: TFloatField;
    qry_lista_merc_VL_MLD_MNEG: TFloatField;
    qry_lista_merc_VL_MLD_DOLAR: TFloatField;
    qry_tot_merc_VL_TOT_MLD_DOLAR: TFloatField;
    qry_lista_ref_VL_MLD_MNEG: TFloatField;
    qry_lista_ref_VL_MLD_DOLAR: TFloatField;
    qry_tot_ref_VL_TOT_MLD_DOLAR: TFloatField;
    qry_ref_VL_MLD_DOLAR: TFloatField;
    qry_lote_QT_AG_DESOVA: TIntegerField;
    qry_lote_QT_FISICA: TIntegerField;
    qry_lote_QT_AG_REGISTRO: TIntegerField;
    qry_lista_merc_PL_REF: TFloatField;
    qry_tot_merc_PL_REF: TFloatField;
    qry_lista_ref_PL_REF: TFloatField;
    qry_tot_ref_PL_REF: TFloatField;
    qry_ref_PL_REF: TFloatField;
    qry_lista_lote_PL_LOTE: TFloatField;
    qry_tot_lote_PL_LOTE: TFloatField;
    qry_lote_PL_UNIT: TFloatField;
    qry_lote_PL_LOTE: TFloatField;
    qry_lote_PL_AVARIA: TFloatField;
    qry_lote_PL_AVARIA_LIB: TFloatField;
    qry_lote_PL_DISPONIVEL: TFloatField;
    qry_lote_PL_NAC: TFloatField;
    qry_lote_PL_AG_DESEMB: TFloatField;
    qry_lote_PL_AG_DESOVA: TFloatField;
    qry_lote_PL_TRANSITO: TFloatField;
    qry_lote_PL_FISICA: TFloatField;
    qry_lote_PL_AG_REGISTRO: TFloatField;
    qry_tot_lib_avaria_PL_LIB: TFloatField;
    qry_da_lib_avaria_PL_LIB: TFloatField;
    qry_lista_da_lib_avaria_PL_LIB: TFloatField;
    qry_consiste_avaria_: TQuery;
    qry_consiste_avaria_QT_LIB: TIntegerField;
    qry_tp_local_etiq_: TQuery;
    qry_tp_local_etiq_TP_LOCAL_ETIQ: TStringField;
    qry_tp_local_etiq_NM_LOCAL_ETIQ: TStringField;
    qry_lote_IN_ETIQ_FABR: TStringField;
    qry_lote_IN_ETIQ_VALID: TStringField;
    qry_lote_TP_LOCAL_ETIQ_FABR: TStringField;
    qry_lote_TP_LOCAL_ETIQ_VALID: TStringField;
    qry_lote_IN_SOLIC_ETIQ_FABR: TStringField;
    qry_lote_IN_SOLIC_ETIQ_VALID: TStringField;
    qry_lote_IN_REVALIDADO: TStringField;
    qry_lote_DT_VALIDADE_ANT: TDateTimeField;
    qry_lote_LookLocalEtiqFabr: TStringField;
    qry_lote_LookLocalEtiqValid: TStringField;
    qry_ref_NM_MERCADORIA: TMemoField;
    qry_ref_ALIQUOTA_II: TStringField;
    qry_ref_ALIQUOTA_IPI: TStringField;
    qry_merc_NM_MERCADORIA: TMemoField;
    qry_merc_ALIQUOTA_II: TStringField;
    qry_merc_ALIQUOTA_IPI: TStringField;
    qry_param_: TQuery;
    qry_vencto_TP_CTRL_VENCTO: TStringField;
    qry_ent_navio_: TQuery;
    qry_ent_navio_DT_ENT_NAVIO: TDateTimeField;
    qry_lote_PL_AVARIA_PEND: TFloatField;
    sp_atz_da_lote: TStoredProc;
    procedure qry_processo_AfterOpen(DataSet: TDataSet);
    procedure qry_rel_processo_BeforeOpen(DataSet: TDataSet);
    procedure qry_processo_AfterScroll(DataSet: TDataSet);
    procedure qry_da_PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qry_da_CalcFields(DataSet: TDataSet);
    procedure qry_da_AfterScroll(DataSet: TDataSet);
    procedure qry_ref_CalcFields(DataSet: TDataSet);
    procedure qry_da_lib_avaria_CalcFields(DataSet: TDataSet);
    procedure qry_lista_merc_AfterScroll(DataSet: TDataSet);
    procedure qry_lista_ref_AfterScroll(DataSet: TDataSet);
    procedure qry_lista_lote_AfterScroll(DataSet: TDataSet);
    procedure qry_lista_da_lib_avaria_AfterScroll(DataSet: TDataSet);
    procedure qry_lista_da_vencto_AfterScroll(DataSet: TDataSet);
    procedure qry_ref_CD_MERCADORIAChange(Sender: TField);
    procedure qry_lote_QT_LOTEChange(Sender: TField);
    procedure qry_ref_UpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qry_da_UpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qry_lote_UpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qry_da_lib_avaria_UpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure qry_da_vencto_UpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure qry_lote_CalcFields(DataSet: TDataSet);
    procedure qry_lote_AfterScroll(DataSet: TDataSet);
    procedure qry_lote_AfterPost(DataSet: TDataSet);
    procedure qry_lote_AfterDelete(DataSet: TDataSet);
    procedure qry_lote_NR_LOTEChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_da: Tdatm_da;

implementation

uses GSMLIB, PGGP001, PGGP017, PGEN001;

{$R *.DFM}

procedure Tdatm_da.qry_processo_AfterOpen(DataSet: TDataSet);
begin
  Screen.Cursor := crDefault;

  with frm_da do
  begin
    qry_da_.Close;

    VerDA;
  end;
end;

procedure Tdatm_da.qry_rel_processo_BeforeOpen(DataSet: TDataSet);
begin
  Screen.Cursor:=crHourGlass;
end;

procedure Tdatm_da.qry_processo_AfterScroll(DataSet: TDataSet);
begin
  with frm_da do
  begin
    qry_da_.Close;
    qry_da_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
    qry_da_.Prepare;
    qry_da_.Open;

    VerDA;

    if ( qry_processo_IN_LIBERADO.AsString = '0' ) or
       ( qry_processo_IN_CANCELADO.AsString = '1' ) then
    begin
      if ( qry_processo_IN_CANCELADO.AsString = '1' ) then
        BoxMensagem('Este processo está cancelado!', 2)
      else
        if ( qry_processo_IN_LIBERADO.AsString = '0' ) then
          BoxMensagem('Este processo não está liberado!', 2);
      ts_da.Enabled := False;
    end
    else
    begin
      ts_da.Enabled := True;
    end;

    if ( pgctrl_da.ActivePage = ts_ref ) or
       ( pgctrl_da.ActivePage = ts_lote ) or
       ( pgctrl_da.ActivePage = ts_lib_avaria ) or
       ( pgctrl_da.ActivePage = ts_vencto ) then
       btn_mi( st_incluir, False, False, st_excluir )
    else if ( pgctrl_da.ActivePage = ts_da ) then
       btn_mi( False, False, False, st_excluir )
    else
       btn_mi( False, False, False, False );

    HabilitaTela;
  end;
end;

procedure Tdatm_da.qry_da_PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
   TrataErro(E);
end;

procedure Tdatm_da.qry_da_CalcFields(DataSet: TDataSet);
begin
  {Local Embarque}
  qry_da_LookLocalEmbarque.AsString := Lookup( qry_local_, qry_da_CD_LOCAL_EMBARQUE, 'CD_LOCAL', 'NM_LOCAL' );
  {Local Desembarque}
  qry_da_LookLocalDesembarque.AsString := Lookup( qry_local_, qry_da_CD_LOCAL_DESEMBARQUE, 'CD_LOCAL', 'NM_LOCAL' );
  {Armazém Atracação }
  qry_da_LookArmazemAtracacao.AsString := Lookup( qry_armazem_, qry_da_CD_ARMAZEM_ATRACACAO, 'CD_ARMAZEM', 'NM_ARMAZEM' );
  {Armazém Descarga}
  qry_da_LookArmazemDescarga.AsString := Lookup( qry_armazem_, qry_da_CD_ARMAZEM_DESCARGA, 'CD_ARMAZEM', 'NM_ARMAZEM' );
  {Embarcação}
  qry_da_LookEmbarcacao.AsString := Lookup( qry_embarcacao_, qry_da_CD_EMBARCACAO, 'CD_EMBARCACAO', 'NM_EMBARCACAO' );
  {Incoterm}
  qry_da_LookIncoterm.AsString := Lookup( qry_incoterm_, qry_da_CD_INCOTERM, 'CD_INCOTERM', 'NM_INCOTERM' );
  {Agente}
  qry_da_LookAgente.AsString := Lookup( qry_agente_, qry_da_CD_AGENTE, 'CD_AGENTE', 'NM_AGENTE' );
  {Transportador Internacional}
  qry_da_LookTransportador.AsString := Lookup( qry_transp_itl_, qry_da_CD_TRANSPORTADOR, 'CD_TRANSP_ITL', 'NM_TRANSP_ITL' );
  {Moeda MLE}
  qry_da_LookMoedaMLE.AsString := Lookup( qry_moeda_, qry_da_CD_MOEDA_MLE, 'CD_MOEDA', 'AP_MOEDA' );
  {Moeda Frete}
  qry_da_LookMoedaFrete.AsString := Lookup( qry_moeda_, qry_da_CD_MOEDA_FRETE, 'CD_MOEDA', 'AP_MOEDA' );
  {Moeda Seguro}
  qry_da_LookMoedaSeguro.AsString := Lookup( qry_moeda_, qry_da_CD_MOEDA_SEGURO, 'CD_MOEDA', 'AP_MOEDA' );
end;

procedure Tdatm_da.qry_da_AfterScroll(DataSet: TDataSet);
begin
  qry_existe_di_.Close;
  qry_existe_di_.ParamByName('NR_PROCESSO').AsString := qry_da_NR_PROCESSO.AsString;
  qry_existe_di_.Prepare;
  qry_existe_di_.Open;

  frm_da.VerDA;

  qry_lista_merc_.Close;
  qry_lista_merc_.ParamByName('NR_PROCESSO').AsString := qry_da_NR_PROCESSO.AsString;
  qry_lista_merc_.Prepare;
  qry_lista_merc_.Open;

  qry_lista_da_vencto_.Close;
  qry_lista_da_vencto_.ParamByName('NR_PROCESSO').AsString := qry_da_NR_PROCESSO.AsString;
  qry_lista_da_vencto_.Prepare;
  qry_lista_da_vencto_.Open;

  with frm_da do
  begin
    if ( qry_da_PC_SEGURO_MLE.AsFloat > 0 ) then
    begin
      dbedt_vl_seguro_mneg.ReadOnly := True;
      dbedt_vl_seguro_mneg.Color    := clMenu;
      dbedt_vl_seguro_mneg.TabStop  := False;
    end
    else
    begin
      dbedt_vl_seguro_mneg.ReadOnly := False;
      dbedt_vl_seguro_mneg.Color    := clWindow;
      dbedt_vl_seguro_mneg.TabStop  := True;
    end;

    HabilitaTela;
  end;
end;

procedure Tdatm_da.qry_ref_CalcFields(DataSet: TDataSet);
begin
  {Mercadoria}
  qry_ref_LookMercadoria.AsString := Lookup( qry_mercadoria_, qry_ref_CD_MERCADORIA, 'CD_MERCADORIA', 'AP_MERCADORIA' );
  {Unidade de Medida}
  qry_ref_LookUnidMedida.AsString := Lookup( qry_unid_medida_, qry_ref_CD_UNID_MEDIDA, 'CD_UNID_MEDIDA', 'NM_UNID_MEDIDA' );
  {Moeda MLE}
  qry_ref_LookMoedaMLE.AsString   := Lookup( qry_moeda_, qry_ref_CD_MOEDA_MLE, 'CD_MOEDA', 'AP_MOEDA' );
end;

procedure Tdatm_da.qry_da_lib_avaria_CalcFields(DataSet: TDataSet);
begin
  {Usuário}
  qry_da_lib_avaria_LookUsuario.AsString   := Lookup( qry_usuario_, qry_da_lib_avaria_CD_USUARIO_LIB, 'CD_USUARIO', 'NM_USUARIO' );
end;

procedure Tdatm_da.qry_lista_merc_AfterScroll(DataSet: TDataSet);
begin
  qry_tot_merc_.Close;
  qry_tot_merc_.ParamByName('NR_PROCESSO').AsString := qry_da_NR_PROCESSO.AsString;
  qry_tot_merc_.Prepare;
  qry_tot_merc_.Open;

  qry_merc_.Close;
  qry_merc_.ParamByName('CD_MERCADORIA').AsString := qry_lista_merc_CD_MERCADORIA.AsString;
  qry_merc_.Prepare;
  qry_merc_.Open;

  qry_lista_ref_.Close;
  qry_lista_ref_.ParamByName('NR_PROCESSO').AsString   := qry_da_NR_PROCESSO.AsString;
  qry_lista_ref_.ParamByName('CD_MERCADORIA').AsString := qry_lista_merc_CD_MERCADORIA.AsString;
  qry_lista_ref_.Prepare;
  qry_lista_ref_.Open;

  frm_da.HabilitaTela;
end;

procedure Tdatm_da.qry_lista_ref_AfterScroll(DataSet: TDataSet);
begin
  qry_tot_ref_.Close;
  qry_tot_ref_.ParamByName('NR_PROCESSO').AsString   := qry_da_NR_PROCESSO.AsString;
  qry_tot_ref_.ParamByName('CD_MERCADORIA').AsString := qry_lista_merc_CD_MERCADORIA.AsString;
  qry_tot_ref_.Prepare;
  qry_tot_ref_.Open;

  qry_ref_.Close;
  qry_ref_.ParamByName('NR_PROCESSO').AsString   := qry_lista_ref_NR_PROCESSO.AsString;
  qry_ref_.ParamByName('CD_MERCADORIA').AsString := qry_lista_ref_CD_MERCADORIA.AsString;
  qry_ref_.ParamByName('NR_REF').AsString        := qry_lista_ref_NR_REF.AsString;
  qry_ref_.Prepare;
  qry_ref_.Open;

  qry_lista_lote_.Close;
  qry_lista_lote_.ParamByName('NR_PROCESSO').AsString   := qry_lista_ref_NR_PROCESSO.AsString;
  qry_lista_lote_.ParamByName('CD_MERCADORIA').AsString := qry_lista_ref_CD_MERCADORIA.AsString;
  qry_lista_lote_.ParamByName('NR_REF').AsString        := qry_lista_ref_NR_REF.AsString;
  qry_lista_lote_.Prepare;
  qry_lista_lote_.Open;

  frm_da.HabilitaTela;
end;

procedure Tdatm_da.qry_lista_lote_AfterScroll(DataSet: TDataSet);
begin
  qry_tot_lote_.Close;
  qry_tot_lote_.ParamByName('NR_PROCESSO').AsString   := qry_lista_ref_NR_PROCESSO.AsString;
  qry_tot_lote_.ParamByName('CD_MERCADORIA').AsString := qry_lista_ref_CD_MERCADORIA.AsString;
  qry_tot_lote_.ParamByName('NR_REF').AsString        := qry_lista_ref_NR_REF.AsString;
  qry_tot_lote_.Prepare;
  qry_tot_lote_.Open;

  qry_lote_.Close;
  qry_lote_.ParamByName('NR_PROCESSO').AsString   := qry_lista_lote_NR_PROCESSO.AsString;
  qry_lote_.ParamByName('CD_MERCADORIA').AsString := qry_lista_lote_CD_MERCADORIA.AsString;
  qry_lote_.ParamByName('NR_REF').AsString        := qry_lista_lote_NR_REF.AsString;
  qry_lote_.ParamByName('NR_LOTE').AsString       := qry_lista_lote_NR_LOTE.AsString;
  qry_lote_.Prepare;
  qry_lote_.Open;

  qry_lista_da_lib_avaria_.Close;
  qry_lista_da_lib_avaria_.ParamByName('NR_PROCESSO').AsString   := qry_lista_lote_NR_PROCESSO.AsString;
  qry_lista_da_lib_avaria_.ParamByName('CD_MERCADORIA').AsString := qry_lista_lote_CD_MERCADORIA.AsString;
  qry_lista_da_lib_avaria_.ParamByName('NR_REF').AsString        := qry_lista_lote_NR_REF.AsString;
  qry_lista_da_lib_avaria_.ParamByName('NR_LOTE').AsString       := qry_lista_lote_NR_LOTE.AsString;
  qry_lista_da_lib_avaria_.Prepare;
  qry_lista_da_lib_avaria_.Open;

  frm_da.HabilitaTela;
end;

procedure Tdatm_da.qry_lista_da_lib_avaria_AfterScroll(DataSet: TDataSet);
begin
  qry_tot_lib_avaria_.Close;
  qry_tot_lib_avaria_.ParamByName('NR_PROCESSO').AsString   := qry_lista_lote_NR_PROCESSO.AsString;
  qry_tot_lib_avaria_.ParamByName('CD_MERCADORIA').AsString := qry_lista_lote_CD_MERCADORIA.AsString;
  qry_tot_lib_avaria_.ParamByName('NR_REF').AsString        := qry_lista_lote_NR_REF.AsString;
  qry_tot_lib_avaria_.ParamByName('NR_LOTE').AsString       := qry_lista_lote_NR_LOTE.AsString;
  qry_tot_lib_avaria_.Prepare;
  qry_tot_lib_avaria_.Open;

  qry_da_lib_avaria_.Close;
  qry_da_lib_avaria_.ParamByName('NR_PROCESSO').AsString   := qry_lista_da_lib_avaria_NR_PROCESSO.AsString;
  qry_da_lib_avaria_.ParamByName('CD_MERCADORIA').AsString := qry_lista_da_lib_avaria_CD_MERCADORIA.AsString;
  qry_da_lib_avaria_.ParamByName('NR_REF').AsString        := qry_lista_da_lib_avaria_NR_REF.AsString;
  qry_da_lib_avaria_.ParamByName('NR_LOTE').AsString       := qry_lista_da_lib_avaria_NR_LOTE.AsString;
  qry_da_lib_avaria_.ParamByName('DT_LIB').AsDateTime      := qry_lista_da_lib_avaria_DT_LIB.AsDateTime;
  qry_da_lib_avaria_.Prepare;
  qry_da_lib_avaria_.Open;

  qry_lote_.Close;
  qry_lote_.Prepare;
  qry_lote_.Open;

  frm_da.HabilitaTela;
end;

procedure Tdatm_da.qry_lista_da_vencto_AfterScroll(DataSet: TDataSet);
begin
  qry_da_vencto_.Close;
  qry_da_vencto_.ParamByName('NR_PROCESSO').AsString    := qry_lista_da_vencto_NR_PROCESSO.AsString;
  qry_da_vencto_.ParamByName('DT_VENCTO_DA').AsDateTime := qry_lista_da_vencto_DT_VENCTO_DA.AsDateTime;
  qry_da_vencto_.Prepare;
  qry_da_vencto_.Open;

  qry_vencto_.Close;
  qry_vencto_.ParamByName('NR_PROCESSO').AsString := qry_da_NR_PROCESSO.AsString;
  qry_vencto_.Prepare;
  qry_vencto_.Open;

  qry_ent_navio_.Close;
  qry_ent_navio_.ParamByName('NR_PROCESSO').AsString := qry_da_NR_PROCESSO.AsString;
  qry_ent_navio_.Prepare;
  qry_ent_navio_.Open;

  frm_da.HabilitaTela;
end;

procedure Tdatm_da.qry_ref_CD_MERCADORIAChange(Sender: TField);
begin
  qry_merc_.Close;
  qry_merc_.ParamByName('CD_MERCADORIA').AsString := qry_ref_CD_MERCADORIA.AsString;
  qry_merc_.Prepare;
  qry_merc_.Open;
  qry_ref_.FieldByName('CD_UNID_MEDIDA').AsString := qry_merc_CD_UN_MED_COMERC.AsString;
  qry_ref_.FieldByName('ALIQUOTA_II').AsString := qry_merc_ALIQUOTA_II.AsString;
  qry_ref_.FieldByName('ALIQUOTA_IPI').AsString := qry_merc_ALIQUOTA_IPI.AsString;
  qry_ref_.FieldByName('NM_MERCADORIA').Assign(qry_merc_NM_MERCADORIA);
end;

procedure Tdatm_da.qry_lote_QT_LOTEChange(Sender: TField);
begin
  qry_lote_.FieldByName('PL_LOTE').AsFloat := Arredondar( ( qry_lote_PL_UNIT.AsFloat *
                                                            qry_lote_QT_LOTE.AsInteger ), 5 );
end;

procedure Tdatm_da.qry_ref_UpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  TrataErro( E );
end;

procedure Tdatm_da.qry_da_UpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  TrataErro( E );
end;

procedure Tdatm_da.qry_lote_UpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  TrataErro( E );
end;

procedure Tdatm_da.qry_da_lib_avaria_UpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  TrataErro( E );
end;

procedure Tdatm_da.qry_da_vencto_UpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  TrataErro( E );
end;

procedure Tdatm_da.qry_lote_CalcFields(DataSet: TDataSet);
begin
  qry_lote_PL_AVARIA_PEND.AsFloat := qry_lote_PL_AVARIA.AsFloat -
                                     qry_lote_PL_AVARIA_LIB.AsFloat;
end;

procedure Tdatm_da.qry_lote_AfterScroll(DataSet: TDataSet);
begin
  with frm_da do
  begin
    if ( qry_lote_QT_AVARIA.AsInteger = qry_lote_QT_AVARIA_LIB.AsInteger ) and
       ( qry_lote_QT_AVARIA.AsInteger <> 0 ) then
    begin
      dbedt_qt_avaria.Color    := clMenu;
      dbedt_qt_avaria.TabStop  := False;
      dbedt_qt_avaria.ReadOnly := True;
    end
    else
    begin
      dbedt_qt_avaria.Color    := clWindow;
      dbedt_qt_avaria.TabStop  := True;
      dbedt_qt_avaria.ReadOnly := False;
    end;

    if qry_lote_IN_ETIQ_FABR.AsString = '0' then
    begin
      lbl_local_etiq_fabr.Enabled        := False;
      dblckpbox_local_etiq_fabr.Enabled  := False;
      dblckpbox_local_etiq_fabr.Color    := clMenu;
      dbchkbox_solic_etiq_fabr.Enabled   := True;
    end
    else
    begin
      lbl_local_etiq_fabr.Enabled        := True;
      dblckpbox_local_etiq_fabr.Enabled  := True;
      dblckpbox_local_etiq_fabr.Color    := clWindow;
      dbchkbox_solic_etiq_fabr.Enabled   := False;
    end;

    if qry_lote_IN_ETIQ_VALID.AsString = '0' then
    begin
      lbl_local_etiq_valid.Enabled       := False;
      dblckpbox_local_etiq_valid.Enabled := False;
      dblckpbox_local_etiq_valid.Color   := clMenu;
      dbchkbox_solic_etiq_valid.Enabled  := True;
    end
    else
    begin
      lbl_local_etiq_valid.Enabled       := True;
      dblckpbox_local_etiq_valid.Enabled := True;
      dblckpbox_local_etiq_valid.Color   := clWindow;
      dbchkbox_solic_etiq_valid.Enabled  := False;
    end;
  end;
end;

procedure Tdatm_da.qry_lote_AfterPost(DataSet: TDataSet);
begin
  CloseStoredProc( sp_atz_da_lote );
  sp_atz_da_lote.ParamByName('@nr_processo').AsString := qry_da_NR_PROCESSO.AsString;
  sp_atz_da_lote.ParamByName('@cd_evento').AsString   := 'X';
  ExecStoredProc( sp_atz_da_lote );
  CloseStoredProc( sp_atz_da_lote );
end;

procedure Tdatm_da.qry_lote_AfterDelete(DataSet: TDataSet);
begin
  CloseStoredProc( sp_atz_da_lote );
  sp_atz_da_lote.ParamByName('@nr_processo').AsString := qry_da_NR_PROCESSO.AsString;
  sp_atz_da_lote.ParamByName('@cd_evento').AsString   := 'X';
  ExecStoredProc( sp_atz_da_lote );
  CloseStoredProc( sp_atz_da_lote );
end;

procedure Tdatm_da.qry_lote_NR_LOTEChange(Sender: TField);
begin
  qry_lote_.FieldByName('PL_UNIT').AsFloat := qry_merc_PL_MERCADORIA.AsFloat;
end;

end.

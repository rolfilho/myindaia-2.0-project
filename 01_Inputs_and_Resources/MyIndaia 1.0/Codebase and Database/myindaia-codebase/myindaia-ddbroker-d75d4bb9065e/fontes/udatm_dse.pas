unit udatm_dse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBTables, Db, ByHLLAPI;

type
  Tdatm_dse = class(TDataModule)
    qry_dse: TQuery;
    ds_dse: TDataSource;
    upd_dse: TUpdateSQL;
    qry_dse_item: TQuery;
    ds_dse_item: TDataSource;
    upd_dse_item: TUpdateSQL;
    qry_tp_exp: TQuery;
    ds_tp_exp: TDataSource;
    qry_tp_natureza: TQuery;
    ds_tp_natureza: TDataSource;
    qry_tp_naturezaCODIGO: TStringField;
    qry_tp_naturezaDESCRICAO: TStringField;
    qry_tp_expCODIGO: TStringField;
    qry_tp_expDESCRICAO: TStringField;
    qry_dseNR_PROCESSO: TStringField;
    qry_dseNR_DSE: TStringField;
    qry_dseCD_EXPORTADOR: TStringField;
    qry_dseCD_URF_DESPACHO: TStringField;
    qry_dseCD_URF_EMBARQUE: TStringField;
    qry_dseIN_CARGA_ARMAZ: TStringField;
    qry_dseTP_COURRIER: TStringField;
    qry_dseCD_CNPJ_COURRIER: TStringField;
    qry_dseCD_PAIS_FINAL: TStringField;
    qry_dseCD_IDENT_VEICULO: TStringField;
    qry_dseVL_PESO_BRUTO: TFloatField;
    qry_dseCD_MOEDA: TStringField;
    qry_dseVL_TOTAL_MOEDA: TFloatField;
    qry_dseDT_ABERTURA_DSE: TDateTimeField;
    qry_dseDT_REGISTRO_DSE: TDateTimeField;
    qry_dse_itemID_ITEM: TIntegerField;
    qry_dse_itemNR_PROCESSO: TStringField;
    qry_dse_itemCD_NCM: TStringField;
    qry_dse_itemCD_DESTAQUE_NCM: TStringField;
    qry_dse_itemQT_UNID_MED_ESTATISTICA: TFloatField;
    qry_dse_itemCD_UNID_MED_COMERCIALIZADA: TStringField;
    qry_dse_itemVL_PESO_LIQUIDO: TFloatField;
    qry_dse_itemVL_TOTAL_ITEM: TFloatField;
    qry_dse_itemTX_DESC_MERCADORIA_L1: TStringField;
    qry_dse_itemTX_DESC_MERCADORIA_L2: TStringField;
    qry_dse_itemTX_DESC_MERCADORIA_L3: TStringField;
    qry_dseLK_NM_EXPORTADOR: TStringField;
    qry_dseLK_TP_EXPORTADOR: TStringField;
    qry_dseLK_NATUREZA: TStringField;
    qry_dseLK_URF_DESPACHO: TStringField;
    qry_dseLK_URF_EMBARQUE: TStringField;
    qry_dseLK_PAIS: TStringField;
    qry_dseLK_VIA_TRANSPORTE: TStringField;
    qry_dseLK_MOEDA: TStringField;
    qry_dse_itemLK_CD_NCM: TStringField;
    qry_dse_itemLK_UNIDADE_MEDIDA: TStringField;
    qry_dseLK_AP_MOEDA: TStringField;
    qry_dseCNPJ_EXPORTADOR: TStringField;
    qry_dse_itemCALC_VL_ACUMULADO: TFloatField;
    qry_dse_itemCALC_PESO_ACUMULADO: TFloatField;
    qry_dse_itemITEM_DE_TOTAL: TStringField;
    qry_dseCALC_NR_PROCESSO: TStringField;
    qry_dse_itemCALC_NR_PROCESSO: TStringField;
    sp_exclui_dse: TStoredProc;
    qry_dseTP_EXPORTADOR: TStringField;
    qry_dseCD_VIA_TRANSPORTE: TStringField;
    qry_dse_itemMAXIMO: TIntegerField;
    sp_inclui_dse: TStoredProc;
    qry_dse_itemMINIMO: TIntegerField;
    qry_dse_itemCALC_NR_ATUAL: TStringField;
    qry_dse_itemVL_TOTAL_ACUMULADO: TFloatField;
    qry_dse_itemVL_PESO_ACUMULADO: TFloatField;
    ByHLLAPI: TByHLLAPI;
    qry_trans_DSE: TQuery;
    qry_trans_DSENR_PROCESSO: TStringField;
    qry_trans_DSENR_DSE: TStringField;
    qry_trans_DSECD_EXPORTADOR: TStringField;
    qry_trans_DSETP_EXPORTADOR: TStringField;
    qry_trans_DSECD_NATUREZA: TStringField;
    qry_trans_DSECD_URF_DESPACHO: TStringField;
    qry_trans_DSECD_URF_EMBARQUE: TStringField;
    qry_trans_DSEIN_CARGA_ARMAZ: TStringField;
    qry_trans_DSETP_COURRIER: TStringField;
    qry_trans_DSECD_CNPJ_COURRIER: TStringField;
    qry_trans_DSECD_PAIS_FINAL: TStringField;
    qry_trans_DSECD_VIA_TRANSPORTE: TStringField;
    qry_trans_DSECD_IDENT_VEICULO: TStringField;
    qry_trans_DSEVL_PESO_BRUTO: TFloatField;
    qry_trans_DSECD_MOEDA: TStringField;
    qry_trans_DSEVL_TOTAL_MOEDA: TFloatField;
    qry_trans_DSEDT_ABERTURA_DSE: TDateTimeField;
    qry_trans_DSEDT_REGISTRO_DSE: TDateTimeField;
    qry_trans_DSECALC_CNPJ_EXP: TStringField;
    qry_dse_volume: TQuery;
    ds_dse_volume: TDataSource;
    upd_dse_volume: TUpdateSQL;
    qry_dseNR_DIE: TStringField;
    qry_dseNR_DSIE: TStringField;
    qry_dseDIAS: TIntegerField;
    qry_dseNR_DI: TStringField;
    qry_dseCD_UL_EMISSAO_DI: TStringField;
    qry_dseDT_EMISSAO_DI: TDateTimeField;
    qry_dseNR_DSI: TStringField;
    qry_dseCD_UL_EMISSAO_DSI: TStringField;
    qry_dseDT_EMISSAO_DSI: TDateTimeField;
    qry_dseVL_QTD_TOTAL: TFloatField;
    qry_dseSTR_RECINTO: TStringField;
    qry_dseSTR_SETOR: TStringField;
    qry_dseIN_OUTROS_DOC: TStringField;
    qry_dseIN_INF_PRES_CARGA: TStringField;
    qry_dseSTR_USUARIO: TStringField;
    qry_dseTX_DOC_INSTRUTIVOS: TMemoField;
    qry_dseTX_INF_COMPLEMENTARES: TMemoField;
    qry_dseTX_SITUACAO_DSE: TMemoField;
    qry_dse_itemQT_COMERCIALIZADA: TFloatField;
    qry_dse_volumeNR_PROCESSO: TStringField;
    qry_dse_volumeNR_SEQUENCIA: TIntegerField;
    qry_dse_volumeCD_ESPECIE: TStringField;
    qry_dse_volumeVL_QUANTIDADE: TFloatField;
    qry_dse_volumeTX_MARCA: TStringField;
    qry_dse_volumeCALC_NM_ESPECIE: TStringField;
    qry_dseLK_UL_DI: TStringField;
    qry_dseLK_UL_DSI: TStringField;
    qry_dseCD_NATUREZA: TStringField;
    sp_atualiza_dse: TStoredProc;
    qry_trans_DSENR_DIE: TStringField;
    qry_trans_DSENR_DSIE: TStringField;
    qry_trans_DSEDIAS: TIntegerField;
    qry_trans_DSENR_DI: TStringField;
    qry_trans_DSECD_UL_EMISSAO_DI: TStringField;
    qry_trans_DSEDT_EMISSAO_DI: TDateTimeField;
    qry_trans_DSENR_DSI: TStringField;
    qry_trans_DSECD_UL_EMISSAO_DSI: TStringField;
    qry_trans_DSEDT_EMISSAO_DSI: TDateTimeField;
    qry_trans_DSEVL_QTD_TOTAL: TFloatField;
    qry_trans_DSESTR_RECINTO: TStringField;
    qry_trans_DSESTR_SETOR: TStringField;
    qry_trans_DSEIN_OUTROS_DOC: TStringField;
    qry_trans_DSEIN_INF_PRES_CARGA: TStringField;
    qry_trans_DSESTR_USUARIO: TStringField;
    qry_trans_DSETX_DOC_INSTRUTIVOS: TMemoField;
    qry_trans_DSETX_INF_COMPLEMENTARES: TMemoField;
    qry_trans_DSETX_SITUACAO_DSE: TMemoField;
    qry_dseCALC_SITUACAO: TStringField;
    procedure qry_dseCalcFields(DataSet: TDataSet);
    procedure qry_dse_itemCalcFields(DataSet: TDataSet);
    procedure qry_dseAfterOpen(DataSet: TDataSet);
    procedure HabilitaBotoes;
    procedure ds_dseStateChange(Sender: TObject);
    procedure ds_dse_itemStateChange(Sender: TObject);
    procedure qry_dseAfterPost(DataSet: TDataSet);
    procedure qry_dse_itemAfterPost(DataSet: TDataSet);
    function  ExisteProcesso(pPROCESSO:string):Boolean;
    procedure qry_dseAfterInsert(DataSet: TDataSet);
    procedure qry_dseAfterEdit(DataSet: TDataSet);
    procedure qry_dse_itemAfterInsert(DataSet: TDataSet);
    procedure qry_dse_itemAfterEdit(DataSet: TDataSet);
    procedure qry_dseAfterCancel(DataSet: TDataSet);
    function  ID:integer;
    function  ID_VOL:integer;
    procedure qry_dse_itemAfterScroll(DataSet: TDataSet);
    procedure ds_dseDataChange(Sender: TObject; Field: TField);
    procedure qry_dse_volumeAfterDelete(DataSet: TDataSet);
    procedure qry_dse_volumeCalcFields(DataSet: TDataSet);
    procedure qry_dse_volumeAfterInsert(DataSet: TDataSet);
    procedure qry_trans_DSECalcFields(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    tp_op_dse : string;
    tp_op_dse_item : string;
  end;

var
  datm_dse: Tdatm_dse;

implementation

uses ConsOnLineEx, ufrm_dse, Funcoes;//PGGP017;



{$R *.DFM}

procedure Tdatm_dse.qry_dseCalcFields(DataSet: TDataSet);
begin
  qry_dse.FieldByName('LK_NM_EXPORTADOR').AsString  :=  ConsultaLookUP('TEMPRESA_NAC'         , 'CD_EMPRESA'        , qry_dse.FieldByName('CD_EXPORTADOR').AsString     , 'NM_EMPRESA'       );
  qry_dse.FieldByName('CNPJ_EXPORTADOR').AsString   :=  ConsultaLookUP('TEMPRESA_NAC'         , 'CD_EMPRESA'        , qry_dse.FieldByName('CD_EXPORTADOR').AsString     , 'CGC_EMPRESA'      );
  qry_dse.FieldByName('LK_TP_EXPORTADOR').AsString  :=  ConsultaLookUP('TTP_EXPORTADOR'       , 'CODIGO'            , qry_dse.FieldByName('TP_EXPORTADOR').AsString     , 'DESCRICAO'        );
  qry_dse.FieldByName('LK_NATUREZA').AsString       :=  ConsultaLookUP('TTP_NATUREZA_OPERACAO_EXP', 'CODIGO'            , qry_dse.FieldByName('CD_NATUREZA').AsString       , 'DESCRICAO'        );
  qry_dse.FieldByName('LK_URF_DESPACHO').AsString   :=  ConsultaLookUP('TURF'                 , 'CODIGO'            , qry_dse.FieldByName('CD_URF_DESPACHO').AsString   , 'DESCRICAO'        );
  qry_dse.FieldByName('LK_URF_EMBARQUE').AsString   :=  ConsultaLookUP('TURF'                 , 'CODIGO'            , qry_dse.FieldByName('CD_URF_EMBARQUE').AsString   , 'DESCRICAO'        );
  qry_dse.FieldByName('LK_PAIS').AsString           :=  ConsultaLookUP('TPAIS_BROKER'         , 'CD_PAIS'           , qry_dse.FieldByName('CD_PAIS_FINAL').AsString     , 'NM_PAIS'          );
  qry_dse.FieldByName('LK_VIA_TRANSPORTE').AsString :=  ConsultaLookUP('TVIA_TRANSPORTE'      , 'CD_VIA_TRANSPORTE' , qry_dse.FieldByName('CD_VIA_TRANSPORTE').AsString , 'NM_VIA_TRANSPORTE');
  qry_dse.FieldByName('LK_MOEDA').AsString          :=  ConsultaLookUP('TMOEDA_BROKER'        , 'CD_MOEDA'          , qry_dse.FieldByName('CD_MOEDA').AsString          , 'NM_MOEDA'         );
  qry_dse.FieldByName('LK_AP_MOEDA').AsString       :=  ConsultaLookUP('TMOEDA_BROKER'        , 'CD_MOEDA'          , qry_dse.FieldByName('CD_MOEDA').AsString          , 'AP_MOEDA'         );
  qry_dse.FieldByName('CALC_NR_PROCESSO').AsString  :=  copy(qry_dse.FieldByName('NR_PROCESSO').AsString,5,14);
  qry_dse.FieldByName('LK_UL_DI').AsString          :=  ConsultaLookUP('TURF'                 , 'CODIGO'            , qry_dse.FieldByName('CD_UL_EMISSAO_DI').AsString  , 'DESCRICAO'        );
  qry_dse.FieldByName('LK_UL_DSI').AsString         :=  ConsultaLookUP('TURF'                 , 'CODIGO'            , qry_dse.FieldByName('CD_UL_EMISSAO_DSI').AsString , 'DESCRICAO'        );
  qry_dse.FieldByName('CALC_SITUACAO').AsString     :=  copy(qry_dse.FieldByName('TX_SITUACAO_DSE').AsString,1,60);

end;

procedure Tdatm_dse.qry_dse_itemCalcFields(DataSet: TDataSet);
begin
  qry_dse_item.FieldByName('LK_CD_NCM').AsString          :=  ConsultaLookUP('TNCM'                , 'CODIGO' , copy(qry_dse_item.FieldByName('CD_NCM').AsString,1,8)                    , 'DESCRICAO' );
  qry_dse_item.FieldByName('LK_UNIDADE_MEDIDA').AsString  :=  ConsultaLookUP('TUNID_MEDIDA_BROKER' , 'CD_UNID_MEDIDA' , qry_dse_item.FieldByName('CD_UNID_MED_COMERCIALIZADA').AsString  , 'NM_UNID_MEDIDA' );
  qry_dse_item.FieldByName('CALC_NR_PROCESSO').AsString   :=  copy(qry_dse_item.FieldByName('NR_PROCESSO').AsString,5,14);
  qry_dse_item.FieldByName('CALC_NR_ATUAL').AsString      :=   inttostr(qry_dse_item.RecordCount);
end;

procedure Tdatm_dse.qry_dseAfterOpen(DataSet: TDataSet);
begin
  qry_dse_item.Close;
  qry_dse_item.ParamByName('NR_PROCESSO').AsString := qry_dse.FieldByName('NR_PROCESSO').AsString;
  qry_dse_item.Prepare;
  qry_dse_item.Open;

  qry_dse_volume.Close;
  qry_dse_volume.ParamByName('NR_PROCESSO').AsString := qry_dse.FieldByName('NR_PROCESSO').AsString;
  qry_dse_volume.Prepare;
  qry_dse_volume.Open;


  HabilitaBotoes;
  try    frm_dse.Registros.Caption :=  '( '+FStrZero(inttostr(qry_dse_item.FieldByName('ATUAL').AsInteger ),3)+ '/' +FStrZero(inttostr(qry_dse_item.FieldByName('MAXIMO').AsInteger),3)+' )';
  except frm_dse.Registros.Caption :=  '( 000/000 )';
  end;

end;

procedure Tdatm_dse.HabilitaBotoes;
var Hab:Boolean;
begin


  if (frm_dse.pgDSE.ActivePage = frm_dse.ts_dados) or (frm_dse.pgDSE.ActivePage = frm_dse.ts_lista) then
     begin
     frm_dse.btn_salvar.Enabled     :=      (qry_dse.State in [dsEdit, dsInsert]);
     frm_dse.btn_cancelar.Enabled   :=      (qry_dse.State in [dsEdit, dsInsert]);
     frm_dse.btn_incluir.Enabled    :=  not (qry_dse.State in [dsEdit, dsInsert]);
     frm_dse.btn_excluir.Enabled    := (not (qry_dse.State in [dsEdit, dsInsert])) and (not qry_dse.IsEmpty);
     frm_dse.btn_transmitir.Enabled := (not (qry_dse.State in [dsEdit, dsInsert]))          and
                                       (not qry_dse.IsEmpty)                                and
                                       (trim(qry_dse.FieldByName('NR_DSE').AsString) = '')  and
                                       (frm_dse.pgDSE.ActivePage = frm_dse.ts_lista);
     frm_dse.btn_consulta.Enabled   :=  not (qry_dse.State in [dsEdit, dsInsert]);
     frm_dse.btn_sair.Enabled       :=  not (qry_dse.State in [dsEdit, dsInsert]);
     frm_dse.noteNavegacao.Visible  :=  not (qry_dse.State in [dsEdit, dsInsert]);
     end;

  if frm_dse.pgDSE.ActivePage = frm_dse.ts_ncm then
     begin
     frm_dse.btn_salvar.Enabled     :=      (qry_dse_item.State in [dsEdit, dsInsert]);
     frm_dse.btn_cancelar.Enabled   :=      (qry_dse_item.State in [dsEdit, dsInsert]);
     frm_dse.btn_incluir.Enabled    :=  not (qry_dse_item.State in [dsEdit, dsInsert]);
     frm_dse.btn_excluir.Enabled    := (not (qry_dse_item.State in [dsEdit, dsInsert])) and (not qry_dse_item.IsEmpty);
     frm_dse.btn_transmitir.Enabled := false;
     frm_dse.btn_consulta.Enabled   :=  not (qry_dse_item.State in [dsEdit, dsInsert]);
     frm_dse.btn_sair.Enabled       :=  not (qry_dse_item.State in [dsEdit, dsInsert]);
     frm_dse.noteNavegacao.Enabled  :=  not (qry_dse_item.State in [dsEdit, dsInsert]);
     end;

  if frm_dse.pgDSE.ActivePage = frm_dse.ts_complementares then
     begin
     frm_dse.btn_salvar.Enabled     :=      (qry_dse.State in [dsEdit, dsInsert]);
     frm_dse.btn_cancelar.Enabled   :=      (qry_dse.State in [dsEdit, dsInsert]);
     frm_dse.btn_incluir.Enabled    := false;
     frm_dse.btn_excluir.Enabled    := false;
     frm_dse.btn_transmitir.Enabled := false;
     frm_dse.btn_consulta.Enabled   := false;
     frm_dse.btn_sair.Enabled       :=  (not (qry_dse.State in [dsEdit, dsInsert])) and (not (qry_dse_volume.State in [dsEdit, dsInsert]));
     frm_dse.noteNavegacao.Enabled  :=  (not (qry_dse.State in [dsEdit, dsInsert])) and (not (qry_dse_volume.State in [dsEdit, dsInsert]));

     Hab := (trim(datm_dse.qry_dse.FieldByName('NR_DSE').AsString) = '');

     frm_dse.btn4_salvar.Enabled     :=      (qry_dse_volume.State in [dsEdit, dsInsert]) and ( Hab );
     frm_dse.btn4_cancelar.Enabled   :=      (qry_dse_volume.State in [dsEdit, dsInsert]) and ( Hab );
     frm_dse.btn4_incluir.Enabled    := (not (qry_dse_volume.State in [dsEdit, dsInsert])) and ( Hab );
     frm_dse.btn4_excluir.Enabled    := (not (qry_dse_volume.State in [dsEdit, dsInsert])) and (not qry_dse_volume.IsEmpty) and ( Hab );
     end;
end;

procedure Tdatm_dse.ds_dseStateChange(Sender: TObject);
begin
  HabilitaBotoes;
end;

procedure Tdatm_dse.ds_dse_itemStateChange(Sender: TObject);
begin
  HabilitaBotoes;
end;

procedure Tdatm_dse.qry_dseAfterPost(DataSet: TDataSet);
begin
  tp_op_dse := '';
  qry_dse.ApplyUpdates;
end;

procedure Tdatm_dse.qry_dse_itemAfterPost(DataSet: TDataSet);
begin
  qry_dse_item.ApplyUpdates;
  qry_dse_item.Close;
  qry_dse_item.ParamByName('NR_PROCESSO').AsString := qry_dse.FieldByName('NR_PROCESSO').AsString;
  qry_dse_item.Prepare;
  qry_dse_item.Open;
  HabilitaBotoes;
end;


{ Verifica se o processo já existe na tabela de DSE ---------------------------}
function Tdatm_dse.ExisteProcesso(pPROCESSO:string):Boolean;
begin
  with TQuery.Create(Application) do
  begin
    Close;
    DataBaseName := 'DBBROKER';
    SQL.Add('SELECT COUNT(*) AS CT FROM TDSE WHERE NR_PROCESSO = '+QuotedStr(pPROCESSO));
    Prepare;
    Open;
    Result := (FieldByName('CT').AsInteger > 0);
    Close;
  end;
end;


procedure Tdatm_dse.qry_dseAfterInsert(DataSet: TDataSet);
begin
  tp_op_dse := 'I';
end;

procedure Tdatm_dse.qry_dseAfterEdit(DataSet: TDataSet);
begin
  tp_op_dse := 'E';
end;

procedure Tdatm_dse.qry_dse_itemAfterInsert(DataSet: TDataSet);
begin
  tp_op_dse_item := 'I';
  qry_dse_item.FieldByName('NR_PROCESSO').AsString := qry_dse.FieldByName('NR_PROCESSO').AsString;
  qry_dse_item.FieldByName('ID_ITEM').AsInteger := ID;
end;

procedure Tdatm_dse.qry_dse_itemAfterEdit(DataSet: TDataSet);
begin
  tp_op_dse_item := 'E';

end;

procedure Tdatm_dse.qry_dseAfterCancel(DataSet: TDataSet);
begin
  tp_op_dse := '';
end;

function Tdatm_dse.ID:integer;
begin
  with TQuery.Create(Application) do
  begin
    Close;
    DataBaseName := 'DBBROKER';
    SQL.Add('SELECT ISNULL(MAX(ID_ITEM),0) CODIGO FROM TDSE_ITEM WHERE NR_PROCESSO = '+QuotedStr( qry_dse.FieldByName('NR_PROCESSO').AsString) );
    Prepare;
    Open;
    Result := FieldByName('CODIGO').AsInteger+1;
    Close;
  end;
end;

function Tdatm_dse.ID_VOL:integer;
begin
  with TQuery.Create(Application) do
  begin
    Close;
    DataBaseName := 'DBBROKER';
    SQL.Add('SELECT ISNULL(MAX(NR_SEQUENCIA),0) CODIGO FROM TDSE_VOLUMES WHERE NR_PROCESSO = '+QuotedStr( qry_dse.FieldByName('NR_PROCESSO').AsString) );
    Prepare;
    Open;
    Result := FieldByName('CODIGO').AsInteger+1;
    Close;
  end;
end;


procedure Tdatm_dse.qry_dse_itemAfterScroll(DataSet: TDataSet);
begin
  try    frm_dse.Registros.Caption :=  '( '+FStrZero(inttostr(qry_dse_item.FieldByName('ATUAL').AsInteger ),3)+ '/' +FStrZero(inttostr(qry_dse_item.FieldByName('MAXIMO').AsInteger),3)+' )';
  except frm_dse.Registros.Caption :=  '( 000/000 )';
  end;
end;

procedure Tdatm_dse.ds_dseDataChange(Sender: TObject; Field: TField);
begin
  if not (ds_dse.State in [dsEdit, dsInsert]) then frm_dse.HabilitaEdicao;
end;

procedure Tdatm_dse.qry_dse_volumeAfterDelete(DataSet: TDataSet);
begin
  qry_dse_volume.ApplyUpdates;
  qry_dse_volume.Close;
  qry_dse_volume.ParamByName('NR_PROCESSO').AsString := qry_dse.FieldByName('NR_PROCESSO').AsString;
  qry_dse_volume.Prepare;
  qry_dse_volume.Open;
  HabilitaBotoes;
end;

procedure Tdatm_dse.qry_dse_volumeCalcFields(DataSet: TDataSet);
begin
  qry_dse_volume.FieldByName('CALC_NM_ESPECIE').AsString  :=  ConsultaLookUP('TTP_EMBALAGEM', 'CODIGO', qry_dse_volume.FieldByName('CD_ESPECIE').AsString, 'DESCRICAO'  );

end;

procedure Tdatm_dse.qry_dse_volumeAfterInsert(DataSet: TDataSet);
begin
//  tp_op_dse_item := 'I';
  qry_dse_volume.FieldByName('NR_PROCESSO').AsString := qry_dse.FieldByName('NR_PROCESSO').AsString;
  qry_dse_volume.FieldByName('NR_SEQUENCIA').AsInteger := ID_VOL;
end;

procedure Tdatm_dse.qry_trans_DSECalcFields(DataSet: TDataSet);
begin
  qry_trans_DSE.FieldByName('CALC_CNPJ_EXP').AsString   :=  ConsultaLookUP('TEMPRESA_NAC'         , 'CD_EMPRESA'        , qry_trans_DSE.FieldByName('CD_EXPORTADOR').AsString     , 'CGC_EMPRESA'      );
end;

end.

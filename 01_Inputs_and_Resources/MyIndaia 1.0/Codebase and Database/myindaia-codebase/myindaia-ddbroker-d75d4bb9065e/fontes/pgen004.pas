(*************************************************************************************************
Sistema: Entreposto - Nacionalização

PROGRAMA: PGEN004.PAS - datm_nac - Nacionalização

AUTOR: Leandro Stipanich

DATA: 01/10/2002

Manutenção: Carlos Buss
*************************************************************************************************)
unit PGEN004;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_nac = class(TDataModule)
    qry_nac_: TQuery;
    ds_nac: TDataSource;
    qry_lista_nac_item_: TQuery;
    ds_lista_nac_item: TDataSource;
    qry_nac_item_: TQuery;
    ds_nac_item: TDataSource;
    qry_nac_NR_PROCESSO: TStringField;
    qry_nac_CD_COMPRADOR: TStringField;
    qry_nac_IN_NAC_EXTERNA: TStringField;
    qry_nac_IN_EXPORTACAO: TStringField;
    qry_nac_IN_IMP_DIRETA: TStringField;
    qry_nac_CD_MOEDA_MLE: TStringField;
    qry_nac_VL_MLE_MNEG: TFloatField;
    qry_lista_nac_item_NR_REF: TStringField;
    qry_lista_nac_item_CD_MERCADORIA: TStringField;
    qry_lista_nac_item_AP_MERCADORIA: TStringField;
    qry_lista_nac_item_CD_MATERIAL: TStringField;
    qry_lista_nac_item_NR_LOTE: TStringField;
    qry_nac_item_NR_PROCESSO: TStringField;
    qry_nac_item_NR_PROCESSO_DA: TStringField;
    qry_nac_item_NR_REF: TStringField;
    qry_nac_item_CD_MERCADORIA: TStringField;
    qry_nac_item_NR_LOTE: TStringField;
    qry_nac_item_QT_NAC: TIntegerField;
    qry_nac_item_VL_MLE_MNEG: TFloatField;
    qry_nac_item_CD_MOEDA_MLE: TStringField;
    us_nac: TUpdateSQL;
    us_nac_item: TUpdateSQL;
    qry_nac_LookMoedaMLE: TStringField;
    qry_nac_NR_DI: TStringField;
    qry_nac_DT_DI: TDateTimeField;
    qry_nac_LookComprador: TStringField;
    qry_nac_item_LookMoedaMLE: TStringField;
    qry_nac_item_LookMercadoria: TStringField;
    qry_lote_: TQuery;
    qry_mercadoria_: TQuery;
    qry_unid_neg_: TQuery;
    qry_produto_: TQuery;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_IN_PRODUCAO: TStringField;
    qry_nac_VL_MLE_DOLAR: TFloatField;
    qry_nac_VL_MLD_MNEG: TFloatField;
    qry_nac_VL_MLD_DOLAR: TFloatField;
    qry_lista_nac_item_VL_MLD_MNEG: TFloatField;
    qry_lista_nac_item_PL_NAC: TFloatField;
    qry_lista_ret_merc_: TQuery;
    ds_lista_ret_merc: TDataSource;
    qry_ret_merc_: TQuery;
    ds_ret_merc: TDataSource;
    us_ret_merc: TUpdateSQL;
    qry_lista_ret_merc_NR_PROCESSO: TStringField;
    qry_lista_ret_merc_NR_REF: TStringField;
    qry_lista_ret_merc_CD_MERCADORIA: TStringField;
    qry_lista_ret_merc_NR_LOTE: TStringField;
    qry_lista_ret_merc_DT_RET: TDateTimeField;
    qry_lista_ret_merc_QT_RET: TIntegerField;
    qry_ret_merc_NR_PROCESSO: TStringField;
    qry_ret_merc_NR_REF: TStringField;
    qry_ret_merc_CD_MERCADORIA: TStringField;
    qry_ret_merc_NR_LOTE: TStringField;
    qry_ret_merc_DT_RET: TDateTimeField;
    qry_ret_merc_QT_RET: TIntegerField;
    qry_ret_merc_LookMercadoria: TStringField;
    qry_existe_di_: TQuery;
    qry_existe_di_EXISTEDI: TIntegerField;
    qry_consiste_ret_: TQuery;
    qry_consiste_ret_QT_RET: TIntegerField;
    qry_merc_: TQuery;
    ds_merc: TDataSource;
    qry_merc_CD_MERCADORIA: TStringField;
    qry_merc_AP_MERCADORIA: TStringField;
    qry_merc_CD_AREA: TStringField;
    qry_merc_NM_AREA: TStringField;
    qry_merc_CD_PROPRIETARIO: TStringField;
    qry_merc_CD_MATERIAL: TStringField;
    qry_merc_NM_PROPRIETARIO: TStringField;
    qry_merc_CD_EMBALAGEM_SCX: TStringField;
    qry_merc_NM_EMBALAGEM: TStringField;
    qry_merc_PL_MERCADORIA: TFloatField;
    qry_merc_CD_UN_MED_COMERC: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_nac_DT_CALCULO: TDateTimeField;
    qry_ref_cliente_: TQuery;
    qry_ref_cliente_NR_PROCESSO: TStringField;
    qry_ref_cliente_CD_REFERENCIA: TStringField;
    qry_ref_cliente_CD_REF_EXP: TStringField;
    ds_ref_cliente: TDataSource;
    qry_nac_item_PL_NAC: TFloatField;
    qry_nac_item_VL_MLD_MNEG: TFloatField;
    qry_nac_item_VL_MLE_DOLAR: TFloatField;
    qry_nac_item_VL_MLD_DOLAR: TFloatField;
    qry_nac_item_VL_UNITARIO: TFloatField;
    qry_nac_item_TX_MLE: TFloatField;
    qry_nac_item_TX_DOLAR: TFloatField;
    qry_nac_item_LookNrDA: TStringField;
    qry_nac_item_PL_UNIT: TFloatField;
    qry_comprador_: TQuery;
    qry_moeda_: TQuery;
    qry_da_: TQuery;
    qry_tot_nac_item_: TQuery;
    qry_tot_ret_merc_: TQuery;
    qry_tot_nac_item_PL_TOT_NAC: TFloatField;
    qry_ret_merc_NR_PROCESSO_DA: TStringField;
    ds_tot_ret_merc: TDataSource;
    ds_tot_nac_item: TDataSource;
    qry_tot_ret_merc_QT_TOT_RET: TIntegerField;
    qry_lista_nac_item_NR_PROCESSO: TStringField;
    qry_lista_nac_item_NR_PROCESSO_DA: TStringField;
    qry_lista_ret_merc_NR_PROCESSO_DA: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_nac_item_LookDtDA: TDateField;
    qry_nac_item_LookMoedaFrete: TStringField;
    qry_nac_item_CD_MOEDA_FRETE: TStringField;
    qry_nac_item_VL_FRETE_MNEG: TFloatField;
    qry_nac_item_IN_EMBUT_FRT_ITENS: TStringField;
    qry_nac_CD_INCOTERM: TStringField;
    qry_incoterm_: TQuery;
    qry_nac_LookIncoterm: TStringField;
    qry_nac_DT_VENDA: TDateTimeField;
    qry_lista_ret_merc_PL_RET: TFloatField;
    qry_ret_merc_PL_RET: TFloatField;
    qry_tot_ret_merc_PL_TOT_RET: TFloatField;
    qry_comprador_est_: TQuery;
    qry_nac_item_LookMaterial: TStringField;
    qry_tot_ret_merc_CalcQtAgRetirada: TIntegerField;
    qry_tot_ret_merc_CalcPlAgRetirada: TFloatField;
    qry_tot_nac_item_VL_TOT_MLD_MNEG: TFloatField;
    qry_ref_cliente_NR_SEQUENCIA: TStringField;
    procedure qry_nac_CalcFields(DataSet: TDataSet);
    procedure qry_nac_item_CalcFields(DataSet: TDataSet);
    procedure qry_nac_AfterScroll(DataSet: TDataSet);
    procedure qry_lista_nac_item_AfterScroll(DataSet: TDataSet);
    procedure qry_lista_ret_merc_AfterScroll(DataSet: TDataSet);
    procedure qry_nac_item_QT_NACChange(Sender: TField);
    procedure qry_nac_item_CD_MERCADORIAChange(Sender: TField);
    procedure qry_tot_ret_merc_CalcFields(DataSet: TDataSet);
    procedure qry_ret_merc_QT_RETChange(Sender: TField);
    procedure qry_nac_item_BeforeEdit(DataSet: TDataSet);
    procedure qry_nac_IN_EXPORTACAOChange(Sender: TField);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_nac: Tdatm_nac;

implementation

uses GSMLIB, PGGP001, PGGP017, PGEN003;

{$R *.DFM}

procedure Tdatm_nac.qry_nac_CalcFields(DataSet: TDataSet);
begin
  {Comprador}
  if qry_nac_IN_EXPORTACAO.AsString = '1' then
    qry_nac_LookComprador.AsString := Lookup( qry_comprador_est_, qry_nac_CD_COMPRADOR, 'CD_COMPRADOR', 'NM_COMPRADOR' )
  else
    qry_nac_LookComprador.AsString := Lookup( qry_comprador_, qry_nac_CD_COMPRADOR, 'CD_COMPRADOR', 'NM_COMPRADOR' );
  {Moeda MLE}
  qry_nac_LookMoedaMLE.AsString := Lookup( qry_moeda_, qry_nac_CD_MOEDA_MLE, 'CD_MOEDA', 'AP_MOEDA' );
  {Incoterm}
  qry_nac_LookIncoterm.AsString := Lookup( qry_incoterm_, qry_nac_CD_INCOTERM, 'CD_INCOTERM', 'NM_INCOTERM' );
end;

procedure Tdatm_nac.qry_nac_item_CalcFields(DataSet: TDataSet);
begin
  {Mercadoria}
  qry_nac_item_LookMercadoria.AsString := Lookup( qry_mercadoria_, qry_nac_item_CD_MERCADORIA, 'CD_MERCADORIA', 'AP_MERCADORIA' );
  {Material}
  qry_nac_item_LookMaterial.AsString   := Lookup( qry_mercadoria_, qry_nac_item_CD_MERCADORIA, 'CD_MERCADORIA', 'CD_MATERIAL' );
  {Moeda MLE}
  qry_nac_item_LookMoedaMLE.AsString   := Lookup( qry_moeda_, qry_nac_item_CD_MOEDA_MLE, 'CD_MOEDA', 'AP_MOEDA' );
  {Moeda Frete}
  qry_nac_item_LookMoedaFrete.AsString := Lookup( qry_moeda_, qry_nac_item_CD_MOEDA_FRETE, 'CD_MOEDA', 'AP_MOEDA' );
  {Nº DA}
  if Trim( Trim( frm_nac.msk_cd_unid_neg.Text ) +
//           Trim( frm_nac.msk_cd_produto.Text ) +
           '01' +
           qry_nac_item_NR_PROCESSO_DA.AsString ) <> '' then
  begin
    qry_da_.Close;
    qry_da_.ParamByName( 'NR_PROCESSO' ).AsString := Trim( Trim( frm_nac.msk_cd_unid_neg.Text ) +
//                                                           Trim( frm_nac.msk_cd_produto.Text ) +
                                                           '01' +
                                                           qry_nac_item_NR_PROCESSO_DA.AsString );
    qry_da_.Prepare;
    qry_da_.Open;
    if qry_da_.RecordCount > 0 then
    begin
      qry_nac_item_LookNrDA.AsString   := Trim( qry_da_.FieldByName( 'NR_DI' ).AsString );
      qry_nac_item_LookDtDA.AsDateTime := qry_da_.FieldByName( 'DT_DI' ).AsDateTime;
    end
    else
    begin
      qry_nac_item_LookNrDA.AsString   := '';
      qry_nac_item_LookDtDA.AsVariant  := null;
    end;
    qry_da_.Close;
  end
  else
  begin
    qry_nac_item_LookNrDA.AsString     := '';
    qry_nac_item_LookDtDA.AsVariant    := null;
  end;
end;

procedure Tdatm_nac.qry_nac_AfterScroll(DataSet: TDataSet);
begin
  qry_existe_di_.Close;
  qry_existe_di_.ParamByName('NR_PROCESSO').AsString := qry_nac_NR_PROCESSO.AsString;
  qry_existe_di_.Prepare;
  qry_existe_di_.Open;

  frm_nac.VerNac;

  qry_lista_nac_item_.Close;
  qry_lista_nac_item_.ParamByName('NR_PROCESSO').AsString := qry_nac_NR_PROCESSO.AsString;
  qry_lista_nac_item_.Prepare;
  qry_lista_nac_item_.Open;

  qry_ref_cliente_.Close;
  qry_ref_cliente_.ParamByName('NR_PROCESSO').AsString := qry_nac_NR_PROCESSO.AsString;
  qry_ref_cliente_.Prepare;
  qry_ref_cliente_.Open;
end;

procedure Tdatm_nac.qry_lista_nac_item_AfterScroll(DataSet: TDataSet);
begin
  qry_merc_.Close;
  qry_merc_.ParamByName('CD_MERCADORIA').AsString := qry_lista_nac_item_CD_MERCADORIA.AsString;
  qry_merc_.Prepare;
  qry_merc_.Open;

  qry_tot_nac_item_.Close;
  qry_tot_nac_item_.ParamByName('NR_PROCESSO').AsString   := qry_nac_NR_PROCESSO.AsString;
  qry_tot_nac_item_.Prepare;
  qry_tot_nac_item_.Open;

  qry_nac_item_.Close;
  qry_nac_item_.ParamByName('NR_PROCESSO').AsString    := qry_lista_nac_item_NR_PROCESSO.AsString;
  qry_nac_item_.ParamByName('NR_PROCESSO_DA').AsString := qry_lista_nac_item_NR_PROCESSO_DA.AsString;
  qry_nac_item_.ParamByName('CD_MERCADORIA').AsString  := qry_lista_nac_item_CD_MERCADORIA.AsString;
  qry_nac_item_.ParamByName('NR_REF').AsString         := qry_lista_nac_item_NR_REF.AsString;
  qry_nac_item_.ParamByName('NR_LOTE').AsString        := qry_lista_nac_item_NR_LOTE.AsString;
  qry_nac_item_.Prepare;
  qry_nac_item_.Open;

  qry_lista_ret_merc_.Close;
  qry_lista_ret_merc_.ParamByName('NR_PROCESSO').AsString    := qry_lista_nac_item_NR_PROCESSO.AsString;
  qry_lista_ret_merc_.ParamByName('NR_PROCESSO_DA').AsString := qry_lista_nac_item_NR_PROCESSO_DA.AsString;
  qry_lista_ret_merc_.ParamByName('CD_MERCADORIA').AsString  := qry_lista_nac_item_CD_MERCADORIA.AsString;
  qry_lista_ret_merc_.ParamByName('NR_REF').AsString         := qry_lista_nac_item_NR_REF.AsString;
  qry_lista_ret_merc_.ParamByName('NR_LOTE').AsString        := qry_lista_nac_item_NR_LOTE.AsString;
  qry_lista_ret_merc_.Prepare;
  qry_lista_ret_merc_.Open;
end;

procedure Tdatm_nac.qry_lista_ret_merc_AfterScroll(DataSet: TDataSet);
begin
  qry_tot_ret_merc_.Close;
  qry_tot_ret_merc_.ParamByName('NR_PROCESSO').AsString    := qry_lista_ret_merc_NR_PROCESSO.AsString;
  qry_tot_ret_merc_.ParamByName('NR_PROCESSO_DA').AsString := qry_lista_ret_merc_NR_PROCESSO_DA.AsString;
  qry_tot_ret_merc_.ParamByName('CD_MERCADORIA').AsString  := qry_lista_ret_merc_CD_MERCADORIA.AsString;
  qry_tot_ret_merc_.ParamByName('NR_REF').AsString         := qry_lista_ret_merc_NR_REF.AsString;
  qry_tot_ret_merc_.ParamByName('NR_LOTE').AsString        := qry_lista_ret_merc_NR_LOTE.AsString;
  qry_tot_ret_merc_.Prepare;
  qry_tot_ret_merc_.Open;

  qry_ret_merc_.Close;
  qry_ret_merc_.ParamByName('NR_PROCESSO').AsString    := qry_lista_ret_merc_NR_PROCESSO.AsString;
  qry_ret_merc_.ParamByName('NR_PROCESSO_DA').AsString := qry_lista_ret_merc_NR_PROCESSO_DA.AsString;
  qry_ret_merc_.ParamByName('CD_MERCADORIA').AsString  := qry_lista_ret_merc_CD_MERCADORIA.AsString;
  qry_ret_merc_.ParamByName('NR_REF').AsString         := qry_lista_ret_merc_NR_REF.AsString;
  qry_ret_merc_.ParamByName('NR_LOTE').AsString        := qry_lista_ret_merc_NR_LOTE.AsString;
  qry_ret_merc_.ParamByName('DT_RET').AsDateTime       := qry_lista_ret_merc_DT_RET.AsDateTime;
  qry_ret_merc_.Prepare;
  qry_ret_merc_.Open;
end;

procedure Tdatm_nac.qry_nac_item_QT_NACChange(Sender: TField);
begin
  qry_nac_item_.FieldByName('PL_NAC').AsFloat := Arredondar( ( qry_nac_item_PL_UNIT.AsFloat *
                                                               qry_nac_item_QT_NAC.AsInteger ), 5 );
end;

procedure Tdatm_nac.qry_nac_item_CD_MERCADORIAChange(Sender: TField);
begin
  qry_merc_.Close;
  qry_merc_.ParamByName('CD_MERCADORIA').AsString := qry_nac_item_CD_MERCADORIA.AsString;
  qry_merc_.Prepare;
  qry_merc_.Open;
  if ( qry_nac_item_PL_UNIT.AsFloat = 0 ) or
     ( qry_nac_item_PL_UNIT.IsNull ) then
  begin
    qry_nac_item_PL_UNIT.AsFloat := qry_merc_PL_MERCADORIA.AsFloat;
  end;
end;

procedure Tdatm_nac.qry_tot_ret_merc_CalcFields(DataSet: TDataSet);
begin
  qry_tot_ret_merc_CalcQtAgRetirada.AsInteger := qry_nac_item_QT_NAC.AsInteger - qry_tot_ret_merc_QT_TOT_RET.AsInteger;
  qry_tot_ret_merc_CalcPlAgRetirada.AsInteger := qry_nac_item_PL_NAC.AsInteger - qry_tot_ret_merc_PL_TOT_RET.AsInteger;
end;

procedure Tdatm_nac.qry_ret_merc_QT_RETChange(Sender: TField);
begin
  qry_ret_merc_PL_RET.AsFloat := MyRound( qry_ret_merc_QT_RET.AsFloat *
                                          qry_nac_item_PL_UNIT.AsFloat, 5 );
end;

procedure Tdatm_nac.qry_nac_item_BeforeEdit(DataSet: TDataSet);
begin
  with frm_nac do
  begin
    if qt_nac <> '0' then
      qt_nac := Trim( dbedt_qt_nac.Text );
    if qt_nac = '' then
      qt_nac := '0';
  end;
end;

procedure Tdatm_nac.qry_nac_IN_EXPORTACAOChange(Sender: TField);
begin
  if frm_nac.dbchkbox_exportacao.Checked then
    qry_nac_LookComprador.AsString := Lookup( qry_comprador_est_, qry_nac_CD_COMPRADOR, 'CD_COMPRADOR', 'NM_COMPRADOR' )
  else
    qry_nac_LookComprador.AsString := Lookup( qry_comprador_, qry_nac_CD_COMPRADOR, 'CD_COMPRADOR', 'NM_COMPRADOR' );
    //andré
end;

end.

unit PGPG022;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppCtrls, RxGIF,
  ppPrnabl, ppClass, ppBands, ppCache, ppProd, ppReport, ppParameter,
  ppStrtch, ppSubRpt, ppMemo, ppVar;

type
  Tdatm_sel_unid_cli_grupo_item = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_grupo_item_: TQuery;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_grupo_DT_INCLUSAO: TDateTimeField;
    qry_grupo_IN_ATIVO: TStringField;
    sp_rel_pagto_pend: TStoredProc;
    sp_rel_pagto_razao: TStoredProc;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    sp_rel_resumo_fat: TStoredProc;
    qry_trel_erro_resumo_fat_: TQuery;
    qry_trel_erro_resumo_fat_NR_IDENTIFICADOR: TIntegerField;
    qry_trel_erro_resumo_fat_CD_ITEM: TStringField;
    qry_trel_erro_resumo_fat_NM_DESPESA: TStringField;
    qry_trel_erro_resumo_fat_CD_UNID_NEG: TStringField;
    sp_rel_resumo_fat_itens: TStoredProc;
    qry_pagto_pendente_: TQuery;
    ds_pagto_pendente: TDataSource;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    qry_pagto_pendente_SALDO: TFloatField;
    qry_pagto_pendente_CD_GRUPO: TStringField;
    qry_pagto_pendente_CD_CLIENTE: TStringField;
    
    qry_pagto_pendente_NR_PROCESSO: TStringField;
    qry_pagto_pendente_NM_EMPRESA: TStringField;
    qry_pagto_pendente_CD_ITEM: TStringField;
    qry_pagto_pendente_NM_ITEM: TStringField;
    qry_pagto_pendente_NM_GRUPO: TStringField;
    qry_pagto_pendente_DATA: TStringField;
    qry_pagto_pendente_NR_CHEQUE: TStringField;
    qry_pagto_pendente_AP_BANCO: TStringField;
    BDERel_PagtoPendente: TppBDEPipeline;
    qry_adiantamento_pend_: TQuery;
    ppHeaderBand1: TppHeaderBand;
    ppLabel3: TppLabel;
    ppImage1: TppImage;
    ppLine2: TppLine;
    ppShape1: TppShape;
    ppLabel12: TppLabel;
    ppLabel4: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine4: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel13: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel11: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLine3: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape2: TppShape;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel10: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel8: TppLabel;
    ppDBText1: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel9: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    qry_adiantamento_pend_NR_PROCESSO: TStringField;
    qry_adiantamento_pend_VALOR_NUM: TFloatField;
    ds_adiantamento_pend: TDataSource;
    ppDBText12: TppDBText;
    ppLabel15: TppLabel;
    ppDBText13: TppDBText;
    qry_adiantamento_pend_CD_CLIENTE: TStringField;
    qry_adiantamento_pend_NM_EMPRESA: TStringField;
    BDERel_AdiantPendente: TppBDEPipeline;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppShape3: TppShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_unid_cli_grupo_item: Tdatm_sel_unid_cli_grupo_item;

implementation

{$R *.DFM}


























end.

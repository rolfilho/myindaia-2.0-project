{Importante: cada RTM tem seu respectivo ppReport
e isso não deve ser alterado. Ao incluir um novo
relatório, observe os anteriores e siga o mesmo
padrão, tanto no fonte, como nos nomes dos
componentes. Kleber 23/12/2005}


unit PGPE032;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppClass, ppProd, ppReport, ppEndUsr, ppDB, ppComm, ppRelatv,
  ppCache, ppDBPipe, ppDBBDE, Db, DBTables, ppModule, daDatMod, ppStrtch,
  ppMemo, ppCtrls, ppPrnabl, ppVar, ppSubRpt, ppRegion, ppParameter,
  raCodMod;

type


  Tdatm_exp_impr_cert_orig = class(TDataModule)
    //-------------Data Sources
    Dts_Unid: TDataSource;
    Dts_Exp: TDataSource;
    Dts_Imp: TDataSource;
    Dts_consig: TDataSource;
    Dts_ViaTr: TDataSource;
    Dts_Local1: TDataSource;
    Dts_Local2: TDataSource;
    Dts_Pais1: TDataSource;
    Dts_Proc: TDataSource;
    Dts_Pais2: TDataSource;
    Dts_ProcI: TDataSource;
    Dts_Processo: TDataSource;
    Dts_ProcI1: TDataSource;
    Dts_ProcI2: TDataSource;
    Dts_Normas: TDataSource;
    Dts_Pais3: TDataSource;
    Dts_Processo_Re: TDataSource;
    Dts_DtEmbarque: TDataSource;
    Dts_GrupoNCM: TDataSource;
    Dts_Fabr: TDataSource;
    Dts_Proc_FormA: TDataSource;
    dts_obs_ace39: TDataSource;
    Dts_Carta: TDataSource;
    //-----------------Querys
    TUnid: TQuery;
    TExp: TQuery;
    TImp: TQuery;
    TData_embarque: Tquery;
    TConsig: TQuery;
    TViaTr: TQuery;
    TLocal1: TQuery;
    TLocal2: TQuery;
    TPais1: TQuery;
    TPais2: TQuery;
    TProc: TQuery;
    TProcI: TQuery;
    TProcesso: TQuery;
    TProcI1: TQuery;
    TProcI2: TQuery;
    TNormas: TQuery;
    TPais3: TQuery;
    TProcesso_Re: TQuery;
    qry_parametros_: TQuery;
    qry_exec_sp_: TQuery;
    TProc_FormA: TQuery;
    TGrupoNCM: TQuery;
    Tobs_ace39: TQuery;
    TFabr: TQuery;
    TCarta_Cred: TQuery;
    TSoma_Itens: TQuery;
    //--------------------BDE´s
    ppBDE_Exp: TppBDEPipeline;
    ppBDE_Imp: TppBDEPipeline;
    ppBDE_Consig: TppBDEPipeline;
    ppBDE_ViaTr: TppBDEPipeline;
    ppBDE_Local1: TppBDEPipeline;
    ppBDE_Local2: TppBDEPipeline;
    ppBDE_Pais1: TppBDEPipeline;
    ppBDE_Pais2: TppBDEPipeline;
    ppBDE_Proc: TppBDEPipeline;
    ppBDE_ProcI: TppBDEPipeline;
    ppBDE_Processo: TppBDEPipeline;
    ppBDE_ProcI1: TppBDEPipeline;
    ppBDE_ProcI2: TppBDEPipeline;
    ppBDE_Normas: TppBDEPipeline;
    ppBDE_Pais3: TppBDEPipeline;
    ppBDE_Processo_Re: TppBDEPipeline;
    ppBDE_DtEmbarque: TppBDEPipeline;
    ppBDE_Carta: TppBDEPipeline;
    ppBDE_Proc_FormA: TppBDEPipeline;
    ppBDE_GrupoNCM: TppBDEPipeline;
    ppBDE_Fabr: TppBDEPipeline;
    ppBDE_obs_ace39: TppBDEPipeline;
    //--------------das querys
    TViaTrCD_VIA_TRANSP: TStringField;
    TViaTrNM_VIA_TRANSP: TStringField;
    TViaTrCD_VIA_TRANSP_SISCOMEX: TStringField;
    TViaTrIN_ATIVO: TStringField;
    TViaTrCalcAcordo: TStringField;
    TViaTrCalcNmVia: TStringField;
    qry_parametros_CD_LOCAL_EMISSAO_SP: TStringField;
    qry_parametros_TP_NCM: TStringField;
    qry_parametros_TP_NALADI: TStringField;
    TUnidcd_unid_neg: TStringField;
    TUnidnm_unid_neg: TStringField;
    TSoma_ItensRESULT: TIntegerField;
    sp_atz_evento: TStoredProc;
    ace18_parametro: TppParameterList;
    TExpCODIGO: TStringField;
    TExpNOME: TStringField;
    TExpPP_NOME: TStringField;
    TExpAP_EMPRESA: TStringField;
    TExpCGC_EMPRESA: TStringField;
    TExpENDERECO_NUM: TStringField;
    TExpEND_CIDADE_UF_CEP: TStringField;
    TExpEND_CIDADE: TStringField;
    TExpEND_CEP: TStringField;
    TExpEND_BAIRRO: TStringField;
    TExpEND_ESTADO: TStringField;
    TExpNR_TELEFONE: TStringField;
    TExpNR_FAX: TStringField;
    TExpcalc_nome: TStringField;
    TProcNR_PROCESSO: TStringField;
    TProcNR_PROC_RES: TStringField;
    TProcCalcNrProcesso: TStringField;
    TProcNR_FATURA: TStringField;
    TProcDT_FATURA: TDateTimeField;
    TProcCD_ACORDO: TStringField;
    TProcDT_REGISTRO_PEDIDO: TDateTimeField;
    TProcCD_AGENTE: TStringField;
    TProcCD_TRANSPORTADORA: TStringField;
    TProcCD_VIA_TRANSPORTE: TStringField;
    TProcVL_PESO_BRUTO: TFloatField;
    TProcVL_PESO_LIQUIDO: TFloatField;
    TProcVL_TOT_COM_AGENTE: TFloatField;
    TProcCD_LINGUA_PEDIDO: TStringField;
    TProcTX_OBSERVACAO: TMemoField;
    TProcTX_DECL_ADICIONAL: TMemoField;
    TProcTX_MARCACAO_VOLUME: TMemoField;
    TProcTX_INF_EMBALAGEM: TMemoField;
    TProcTX_MERCADORIA_BL: TMemoField;
    TProcTX_CRIT_ORIG_FORM_A: TMemoField;
    TProcCD_EXPORTADOR: TStringField;
    TProcCD_FABRICANTE: TStringField;
    TProcCD_IMPORTADOR: TStringField;
    TProcTP_CONSIGNATARIO: TStringField;
    TProcCD_CONSIGNATARIO: TStringField;
    TProcCD_LOCAL_ORIGEM: TStringField;
    TProcCD_LOCAL_DESTINO: TStringField;
    TProcCD_PAIS_DESTINO: TStringField;
    TProcNM_TRANSPORTADORA: TStringField;
    TProcCD_PAIS_ORIGEM: TStringField;
    TProcCD_PAIS_DESTINO_1: TStringField;
    TProcNM_LOCAL_ORIGEM_DATA: TStringField;
    TProcPP: TStringField;
    TProcPP_NOME: TStringField;
    TProcCD_LOCAL_EMISSAO: TStringField;
    TProcNM_VIA_TRANSP: TStringField;
    TProcORIGEM: TStringField;
    TProcDESTINO: TStringField;
    TProcDT_FATURA_ING: TStringField;
    TProcDT_EMBARQUE: TDateTimeField;
    TProcDT_ATUAL_EXTENSO: TStringField;
    TProcDT_ATUAL_EXTENSO_ANO: TStringField;
    TProcDATA_ATUAL: TStringField;
    TProccalc_nome: TStringField;
    //designer
    ppDesigner: TppDesigner;
    //relatório ACE18
    ACE18: TppReport;
    ace18_header: TppHeaderBand;
    ace18_dbt1: TppDBText;
    ace18_dbt2: TppDBText;
    ace18_dbt3: TppDBText;
    ace18_dbt4: TppDBText;
    ace18_dbt6: TppDBText;
    ace18_dbt8: TppDBText;
    ace18_dbt9: TppDBText;
    ace18_dbt10: TppDBText;
    ace18_dbt11: TppDBText;
    ace18_dbt12: TppDBText;
    ace18_dbt5: TppDBText;
    ace18_dbt7: TppDBText;
    ace18_sub1: TppSubReport;
    ace18_detail: TppChildReport;
    ace18_detail1: TppDetailBand;
    ace18_sub1_dbt1: TppDBText;
    ace18_sub1_dbt2: TppDBText;
    ace18_sub1_dbt3: TppDBMemo;
    ace18_sub1_dbt4: TppDBText;
    ace18_sub1_dbt5: TppDBText;
    ace18_sub2: TppSubReport;
    ace18_child: TppChildReport;
    ace18_child1: TppDetailBand;
    ace18_sub2_dbt1: TppDBText;
    ace18_sub2_dbt2: TppDBText;
    ace18_child_group: TppGroup;
    ace18_child_group_header: TppGroupHeaderBand;
    ace18_child_group_footer: TppGroupFooterBand;
    ace18_dbt14: TppLabel;
    ace18_dbt15: TppDBText;
    ace18_dbt13: TppDBText;
    ace18_detail2: TppDetailBand;
    //relatório ACE18CartaCred
    ACE18CartaCred: TppReport;
    ace18C_header: TppHeaderBand;
    ace18C_dbt9: TppDBText;
    ace18C_dbt10: TppDBText;
    ace18C_dbt11: TppDBText;
    ace18C_dbt12: TppDBText;
    ace18C_dbt13: TppDBText;
    ace18C_sub1: TppSubReport;
    ace18C_child1: TppChildReport;
    ace18C_detail1: TppDetailBand;
    ace18C_dbt17: TppDBText;
    ace18C_dbt18: TppDBText;
    ace18C_memo1: TppDBMemo;
    ace18C_dbt19: TppDBText;
    ace18C_sub2: TppSubReport;
    ace18C_child2: TppChildReport;
    ace18C_detail2: TppDetailBand;
    ace18C_dbt20: TppDBText;
    ace18C_dbt21: TppDBText;
    ace18C_sub2_child1_group1: TppGroup;
    ace18C_group1_header: TppGroupHeaderBand;
    ace18C_group1_footer: TppGroupFooterBand;
    ace18C_dbt15: TppLabel;
    ace18C_dbt16: TppDBText;
    ace18C_dbt14: TppDBText;
    ace18C_detail: TppDetailBand;
    ace18C_parametro: TppParameterList;
    //relatório ACE18-SP
    ACE18_SP: TppReport;
    ace18SP_header: TppHeaderBand;
    ace18SP_dbt1: TppDBText;
    ace18SP_dbt2: TppDBText;
    ace18SP_dbt3: TppDBText;
    ace18SP_dbt4: TppDBText;
    ace18SP_dbt5: TppDBText;
    ace18SP_dbt6: TppDBText;
    ace18SP_dbt7: TppDBText;
    ace18SP_dbt8: TppDBText;
    ace18SP_dbt9: TppDBText;
    ace18SP_dbt10: TppDBText;
    ace18SP_dbt11: TppDBText;
    ace18SP_dbt13: TppDBText;
    ace18SP_sub1: TppSubReport;
    ace18SP_child1: TppChildReport;
    ace18SP_detail1: TppDetailBand;
    ace18SP_dbt15: TppDBText;
    ace18SP_dbt16: TppDBText;
    ace18SP_memo1: TppDBMemo;
    ace18SP_dbt17: TppDBText;
    ace18SP_dbt18: TppDBText;
    ace18SP_sub2: TppSubReport;
    ace18SP_child2: TppChildReport;
    ace18SP_detail2: TppDetailBand;
    ace18SP_dbt19: TppDBText;
    ace18SP_dbt20: TppDBText;
    ace18SP_group2: TppGroup;
    ace18SP_group2_header: TppGroupHeaderBand;
    ace18SP_group2_footer: TppGroupFooterBand;
    ace18SP_lbl1: TppLabel;
    ace18SP_dbt14: TppDBText;
    ace18SP_dbt12: TppDBText;
    ace18SP_detail: TppDetailBand;
    ace18SP_parametro: TppParameterList;
    ace18CartaCred_SP: TppReport;
    //relatório ACE18CartaCred-SP
    ace18CSP_header: TppHeaderBand;
    ace18CSP_dbt11: TppDBText;
    ace18CSP_dbt12: TppDBText;
    ace18CSP_dbt13: TppDBText;
    ace18CSP_dbt14: TppDBText;
    ace18CSP_dbt2: TppDBText;
    ace18CSP_sub1: TppSubReport;
    ace18CSP_child1: TppChildReport;
    ace18CSP_detail1: TppDetailBand;
    ace18CSP_dbt15: TppDBText;
    ace18CSP_dbt16: TppDBText;
    ace18CSP_memo1: TppDBMemo;
    ace18CSP_dbt17: TppDBText;
    ace18CSP_dbt18: TppDBText;
    ace18CSP_sub2: TppSubReport;
    ace18CSP_child2: TppChildReport;
    ace18CSP_detail2: TppDetailBand;
    ace18CSP_dbt19: TppDBText;
    ace18CSP_dbt20: TppDBText;
    ace18CSP_group: TppGroup;
    ace18CSP_group_header: TppGroupHeaderBand;
    ace18CSP_group_footer: TppGroupFooterBand;
    ace18CSP_lbl1: TppLabel;
    ace18CSP_dbt5: TppDBText;
    ace18CSP_dbt7: TppDBText;
    ace18CSP_detail: TppDetailBand;
    ace18CSP_parametro: TppParameterList;
    //Relatório ACE35
    ACE35: TppReport;
    ace35_parametro: TppParameterList;
    ACE35CartaCred: TppReport;
    ace35_header: TppHeaderBand;
    ace35_dbt13: TppDBText;
    ace35_dbt14: TppDBText;
    ace35_dbt15: TppDBText;
    ace35_dbt11: TppDBText;
    ace35_dbt12: TppDBText;
    ace35_dbt1: TppDBText;
    ace35_dbt2: TppDBText;
    ace35_dbt3: TppDBText;
    ace35_dbt4: TppDBText;
    ace35_dbt5: TppDBText;
    ace35_sub1: TppSubReport;
    ace35_child1: TppChildReport;
    ace35_detail1: TppDetailBand;
    ace35_dbt16: TppDBText;
    ace35_dbt17: TppDBText;
    ace35_memo2: TppDBMemo;
    ace35_dbt18: TppDBText;
    ace35_dbt19: TppDBText;
    ace35_sub2: TppSubReport;
    ace35_child2: TppChildReport;
    ace35_detail2: TppDetailBand;
    ace35_dbt20: TppDBText;
    ace35_dbt21: TppDBText;
    ace35_group: TppGroup;
    ace35_group_header: TppGroupHeaderBand;
    ace35_group_footer: TppGroupFooterBand;
    ace35_memo1: TppDBMemo;
    ace35_lbl1: TppLabel;
    ace35_dbt6: TppDBText;
    ace35_dbt7: TppDBText;
    ace35_dbt8: TppDBText;
    ace35_dbt9: TppDBText;
    ace35_dbt10: TppDBText;
    ace35_detail: TppDetailBand;
    //Relatório ACE35CartaCred
    ace35C_header: TppHeaderBand;
    ace35C_dbt15: TppDBText;
    ace35C_dbt12: TppDBText;
    ace35C_dbt1: TppDBText;
    ace35C_dbt2: TppDBText;
    ace35C_dbt3: TppDBText;
    ace35C_sub1: TppSubReport;
    ace35C_child1: TppChildReport;
    ace35C_detail1: TppDetailBand;
    ace35C_dbt16: TppDBText;
    ace35C_dbt17: TppDBText;
    ace35C_memo2: TppDBMemo;
    ace35C_dbt18: TppDBText;
    ace35C_dbt19: TppDBText;
    ace35C_sub2: TppSubReport;
    ace35C_child2: TppChildReport;
    ace35C_detail2: TppDetailBand;
    ace35C_dbt20: TppDBText;
    ace35C_dbt21: TppDBText;
    ace35C_group: TppGroup;
    ace35C_group_header: TppGroupHeaderBand;
    ace35C_group_footer: TppGroupFooterBand;
    ace35C_memo1: TppDBMemo;
    ace35C_lbl1: TppLabel;
    ace35C_dbt7: TppDBText;
    ace35C_dbt8: TppDBText;
    ace35C_detail: TppDetailBand;
    ace35C_parametro: TppParameterList;
    //Relatório ACE35-SP
    ACE35_SP: TppReport;
    ace35SP_header: TppHeaderBand;
    ace35SP_dbt1: TppDBText;
    ace35SP_dbt6: TppDBText;
    ace35SP_dbt9: TppDBText;
    ace35SP_dbt10: TppDBText;
    ace35SP_dbt11: TppDBText;
    ace35SP_dbt12: TppDBText;
    ace35SP_dbt13: TppDBText;
    ace35SP_dbt14: TppDBText;
    ace35SP_dbt15: TppDBText;
    ace35SP_dbt2: TppDBText;
    ace35SP_sub1: TppSubReport;
    ace35SP_child1: TppChildReport;
    ace35SP_detail1: TppDetailBand;
    ace35SP_dbt16: TppDBText;
    ace35SP_dbt17: TppDBText;
    ace35SP_memo2: TppDBMemo;
    ace35SP_dbt18: TppDBText;
    ace35SP_dbt19: TppDBText;
    ace35SP_sub2: TppSubReport;
    ace35SP_child2: TppChildReport;
    ace35SP_detail2: TppDetailBand;
    ace35SP_dbt20: TppDBText;
    ace35SP_dbt21: TppDBText;
    ace35SP_group: TppGroup;
    ace35SP_group_header: TppGroupHeaderBand;
    ace35SP_group_footer: TppGroupFooterBand;
    ace35SP_memo1: TppDBMemo;
    ace35SP_lbl1: TppLabel;
    ace35SP_dbt3: TppDBText;
    ace35SP_dbt4: TppDBText;
    ace35SP_dbt5: TppDBText;
    ace35SP_dbt7: TppDBText;
    ace35SP_dbt8: TppDBText;
    ace35SP_detail: TppDetailBand;
    ace35SP_parametro: TppParameterList;
    //relatório ACE35CartaCred-SP
    ACE35CartaCred_SP: TppReport;
    ace35CSP_header: TppHeaderBand;
    ace35CSP_dbt9: TppDBText;
    ace35CSP_dbt10: TppDBText;
    ace35CSP_dbt11: TppDBText;
    ace35CSP_dbt12: TppDBText;
    ace35CSP_dbt13: TppDBText;
    ace35CSP_sub1: TppSubReport;
    ace35CSP_child1: TppChildReport;
    ace35CSP_detail1: TppDetailBand;
    ace35CSP_dbt16: TppDBText;
    ace35CSP_dbt17: TppDBText;
    ace35CSP_memo2: TppDBMemo;
    ace35CSP_dbt18: TppDBText;
    ace35CSP_dbt19: TppDBText;
    ace35CSP_sub2: TppSubReport;
    ace35CSP_child2: TppChildReport;
    ace35CSP_detail2: TppDetailBand;
    ace35CSP_dbt20: TppDBText;
    ace35CSP_dbt21: TppDBText;
    ace35CSP_group: TppGroup;
    ace35CSP_group_header: TppGroupHeaderBand;
    ace35CSP_group_footer: TppGroupFooterBand;
    ace35CSP_memo1: TppDBMemo;
    ace35CSP_lbl1: TppLabel;
    ace35CSP_dbt3: TppDBText;
    ace35CSP_dbt4: TppDBText;
    ace35CSP_detail: TppDetailBand;
    //Relatório ACE36
    ACE36: TppReport;
    ace36_header: TppHeaderBand;
    ace36_dbt1: TppDBText;
    ace36_dbt6: TppDBText;
    ace36_dbt9: TppDBText;
    ace36_dbt10: TppDBText;
    ace36_dbt11: TppDBText;
    ace36_dbt12: TppDBText;
    ace36_dbt13: TppDBText;
    ace36_dbt14: TppDBText;
    ace36_dbt15: TppDBText;
    ace36_dbt2: TppDBText;
    ace36_sub1: TppSubReport;
    ace36_child1: TppChildReport;
    ace36_detail1: TppDetailBand;
    ace36_dbt16: TppDBText;
    ace36_dbt17: TppDBText;
    ace36_memo2: TppDBMemo;
    ace36_dbt18: TppDBText;
    ace36_dbt19: TppDBText;
    ace36_sub2: TppSubReport;
    ace36_child2: TppChildReport;
    ace36_detail2: TppDetailBand;
    ace36_dbt20: TppDBText;
    ace36_dbt21: TppDBText;
    ace36_group: TppGroup;
    ace36_group_header: TppGroupHeaderBand;
    ace36_group_footer: TppGroupFooterBand;
    ace36_memo1: TppDBMemo;
    ace36_lbl1: TppLabel;
    ace36_dbt3: TppDBText;
    ace36_dbt4: TppDBText;
    ace36_dbt5: TppDBText;
    ace36_dbt7: TppDBText;
    ace36_dbt8: TppDBText;
    ace36_detail: TppDetailBand;
    ace36_parametro: TppParameterList;
    //Relatório ACE36CartaCred
    ACE36CartaCred: TppReport;
    ace36C_header: TppHeaderBand;
    ace36C_dbt9: TppDBText;
    ace36C_dbt10: TppDBText;
    ace36C_dbt11: TppDBText;
    ace36C_dbt12: TppDBText;
    ace36C_dbt13: TppDBText;
    ace36C_sub1: TppSubReport;
    ace36C_child1: TppChildReport;
    ace36C_detail1: TppDetailBand;
    ace36C_dbt16: TppDBText;
    ace36C_dbt17: TppDBText;
    ace36C_memo2: TppDBMemo;
    ace36C_dbt18: TppDBText;
    ace36C_dbt19: TppDBText;
    ace36C_sub2: TppSubReport;
    ace36C_child2: TppChildReport;
    ace36C_detail2: TppDetailBand;
    ace36C_dbt20: TppDBText;
    ace36C_dbt21: TppDBText;
    ace36C_group: TppGroup;
    ace36C_group_header: TppGroupHeaderBand;
    ace36C_group_footer: TppGroupFooterBand;
    ace36C_memo1: TppDBMemo;
    ace36C_lbl1: TppLabel;
    ace36C_dbt3: TppDBText;
    ace36C_dbt4: TppDBText;
    ace36C_detail: TppDetailBand;
    ace36C_parametro: TppParameterList;
    //Relatório ACE36 SP
    ACE36_SP: TppReport;
    ace36SP_parametro: TppParameterList;
    ace36SP_header: TppHeaderBand;
    ace36SP_dbt1: TppDBText;
    ace36SP_dbt2: TppDBText;
    ace36SP_dbt3: TppDBText;
    ace36SP_dbt4: TppDBText;
    ace36SP_dbt5: TppDBText;
    ace36SP_dbt6: TppDBText;
    ace36SP_dbt7: TppDBText;
    ace36SP_dbt8: TppDBText;
    ace36SP_dbt9: TppDBText;
    ace36SP_dbt10: TppDBText;
    ace36SP_sub1: TppSubReport;
    ace36SP_child1: TppChildReport;
    ace36SP_detail1: TppDetailBand;
    ace36SP_dbt16: TppDBText;
    ace36SP_dbt17: TppDBText;
    ace36SP_memo2: TppDBMemo;
    ace36SP_dbt18: TppDBText;
    ace36SP_dbt19: TppDBText;
    ace36SP_sub2: TppSubReport;
    ace36SP_child2: TppChildReport;
    ace36SP_detail2: TppDetailBand;
    ace36SP_dbt20: TppDBText;
    ace36SP_memo3: TppDBMemo;
    ace36SP_group: TppGroup;
    ace36SP_group_header: TppGroupHeaderBand;
    ace36SP_group_footer: TppGroupFooterBand;
    ace36SP_memo1: TppDBMemo;
    ace36SP_lbl1: TppLabel;
    ace36SP_dbt11: TppDBText;
    ace36SP_dbt12: TppDBText;
    ace36SP_dbt13: TppDBText;
    ace36SP_dbt14: TppDBText;
    ace36SP_dbt15: TppDBText;
    ace36SP_detail: TppDetailBand;
    //Relatório ACE36 CartaCred SP
    ACE36CartaCred_SP: TppReport;
    ace36CSP_parametro: TppParameterList;
    ace36CSP_header: TppHeaderBand;
    ace36CSP_dbt3: TppDBText;
    ace36CSP_dbt4: TppDBText;
    ace36CSP_dbt5: TppDBText;
    ace36CSP_dbt6: TppDBText;
    ace36CSP_dbt7: TppDBText;
    ace36CSP_sub1: TppSubReport;
    ace36CSP_child1: TppChildReport;
    ace36CSP_detail1: TppDetailBand;
    ace36CSP_dbt16: TppDBText;
    ace36CSP_dbt17: TppDBText;
    ace36CSP_memo2: TppDBMemo;
    ace36CSP_dbt18: TppDBText;
    ace36CSP_dbt19: TppDBText;
    ace36CSP_sub2: TppSubReport;
    ace36CSP_child2: TppChildReport;
    ace36CSP_detail2: TppDetailBand;
    ace36CSP_dbt20: TppDBText;
    ace36CSP_memo3: TppDBMemo;
    ace36CSP_group: TppGroup;
    ace36CSP_group_header: TppGroupHeaderBand;
    ace36CSP_group_footer: TppGroupFooterBand;
    ace36CSP_memo1: TppDBMemo;
    ace36CSP_lbl1: TppLabel;
    ace36CSP_dbt11: TppDBText;
    ace36CSP_dbt12: TppDBText;
    ace36CSP_detail: TppDetailBand;
    //Relatório ACE59
    ACE59: TppReport;
    ace59_parametro: TppParameterList;
    ace59_header: TppHeaderBand;
    ace59_dbt1: TppDBText;
    ace59_dbt2: TppDBText;
    ace59_dbt3: TppDBText;
    ace59_dbt4: TppDBText;
    ace59_dbt5: TppDBText;
    ace59_dbt7: TppDBText;
    ace59_dbt8: TppDBText;
    ace59_dbt9: TppDBText;
    ace59_dbt10: TppDBText;
    ace59_dbt11: TppDBText;
    ace59_sub1: TppSubReport;
    ace59_child1: TppChildReport;
    ace59_detail1: TppDetailBand;
    ace59_dbt15: TppDBText;
    ace59_dbt16: TppDBText;
    ace59_memo1: TppDBMemo;
    ace59_dbt17: TppDBText;
    ace59_dbt18: TppDBText;
    ace59_cadeModule: TraCodeModule;
    ace59_sub2: TppSubReport;
    ace59_child2: TppChildReport;
    ace59_detail2: TppDetailBand;
    ace59_dbt19: TppDBText;
    ace59_dbt20: TppDBText;
    ace59_group: TppGroup;
    ace59_group_header: TppGroupHeaderBand;
    ace59_group_footer: TppGroupFooterBand;
    ace59_dlbl2: TppLabel;
    ace59_dbt12: TppDBText;
    ace59_dbt14: TppDBText;
    ace59_lbl1: TppLabel;
    ace59_dbt6: TppDBText;
    ace59_dbt13: TppDBText;
    ace59_detail: TppDetailBand;
    ace35CSP_parametro: TppParameterList;
    //Relatório ACE59 CartaCred
    ACE59CartaCred: TppReport;
    ace59C_parametro: TppParameterList;
    ace59C_header: TppHeaderBand;
    ace59C_dbt7: TppDBText;
    ace59C_dbt8: TppDBText;
    ace59C_dbt9: TppDBText;
    ace59C_dbt10: TppDBText;
    ace59C_sub1: TppSubReport;
    ace59C_child1: TppChildReport;
    ace59C_detail1: TppDetailBand;
    ace59C_dbt16: TppDBText;
    ace59C_dbt17: TppDBText;
    ace59C_memo1: TppDBMemo;
    ace59C_dbt18: TppDBText;
    ace59C_dbt19: TppDBText;
    ace59C_CodeModule: TraCodeModule;
    ace59C_sub2: TppSubReport;
    ace59C_child2: TppChildReport;
    ace59C_detail2: TppDetailBand;
    ace59C_dbt20: TppDBText;
    ace59C_dbt21: TppDBText;
    ace59C_group: TppGroup;
    group_header: TppGroupHeaderBand;
    ace59C_group_footer: TppGroupFooterBand;
    ace59C_lbl1: TppLabel;
    ace59C_dbt12: TppDBText;
    ace59C_dbt14: TppDBText;
    ace59C_dbt15: TppLabel;
    ace59C_dbt6: TppDBText;
    ace59C_dbt13: TppDBText;
    ace59C_detail: TppDetailBand;
    //Relatório Aladi
    Aladi: TppReport;
    aladi_parametro: TppParameterList;
    aladi_header: TppHeaderBand;
    aladi_dbt2: TppDBText;
    aladi_memo1: TppDBMemo;
    aladi_dbt3: TppDBText;
    aladi_dbt4: TppDBText;
    aladi_dbt5: TppDBText;
    aladi_dbt6: TppDBText;
    aladi_sub2: TppSubReport;
    aladi_child2: TppChildReport;
    aladi_header2: TppHeaderBand;
    aladi_detail2: TppDetailBand;
    aladi_memo3: TppDBMemo;
    aladi_memo4: TppDBMemo;
    aladi_sub1: TppSubReport;
    aladi_child1: TppChildReport;
    aladi_detail1: TppDetailBand;
    aladi_dbt7: TppDBText;
    aladi_dbt8: TppDBText;
    aladi_memo2: TppDBMemo;
    aladi_dbt1: TppDBText;
    aladi_detail: TppDetailBand;
    //Relatório Aladi CartaCred
    AladiCartaCred: TppReport;
    aladiC_parametro: TppParameterList;
    aladiC_header: TppHeaderBand;
    aladiC_dbt2: TppDBText;
    aladiC_memo1: TppDBMemo;
    aladiC_dbt3: TppDBText;
    aladiC_dbt4: TppDBText;
    aladiC_dbt5: TppDBText;
    aladiC_dbt6: TppDBText;
    aladiC_sub2: TppSubReport;
    aladiC_child2: TppChildReport;
    aladiC_header2: TppHeaderBand;
    aladiC_detail2: TppDetailBand;
    aladiC_memo3: TppDBMemo;
    aladiC_memo4: TppDBMemo;
    aladiC_sub1: TppSubReport;
    aladiC_child1: TppChildReport;
    aladiC_detail1: TppDetailBand;
    aladiC_dbt7: TppDBText;
    aladiC_dbt8: TppDBText;
    aladiC_memo2: TppDBMemo;
    aladiC_dbt1: TppDBText;
    aladiC_detail: TppDetailBand;
    //Relatório Aladi SP
    Aladi_SP: TppReport;
    aladiSP_parametro: TppParameterList;
    aladiSP_header: TppHeaderBand;
    aladiSP_dbt2: TppDBText;
    aladiSP_memo1: TppDBMemo;
    aladiSP_dbt3: TppDBText;
    aladiSP_dbt4: TppDBText;
    aladiSP_dbt5: TppDBText;
    aladiSP_dbt6: TppDBText;
    aladiSP_sub2: TppSubReport;
    aladiSP_child2: TppChildReport;
    aladiSP_header2: TppHeaderBand;
    aladiSP_detail2: TppDetailBand;
    aladiSP_memo3: TppDBMemo;
    aladiSP_memo4: TppDBMemo;
    aladiSP_sub1: TppSubReport;
    aladiSP_child1: TppChildReport;
    aladiSP_detail1: TppDetailBand;
    aladiSP_dbt7: TppDBText;
    aladiSP_dbt8: TppDBText;
    aladiSP_memo2: TppDBMemo;
    aladiSP_dbt1: TppDBText;
    aladiSP_detail: TppDetailBand;
    //Relatório Aladi CartaCred SP
    AladiCartaCred_SP: TppReport;
    aladiCSP_parametro: TppParameterList;
    aladiCSP_header: TppHeaderBand;
    aladiCSP_dbt2: TppDBText;
    aladiCSP_memo1: TppDBMemo;
    aladiCSP_dbt3: TppDBText;
    aladiCSP_dbt4: TppDBText;
    aladiCSP_dbt5: TppDBText;
    aladiCSP_dbt6: TppDBText;
    aladiCSP_sub2: TppSubReport;
    aladiCSP_child2: TppChildReport;
    aladiCSP_header2: TppHeaderBand;
    aladiCSP_detail2: TppDetailBand;
    aladiCSP_memo3: TppDBMemo;
    aladiCSP_memo4: TppDBMemo;
    aladiCSP_sub1: TppSubReport;
    aladiCSP_child1: TppChildReport;
    aladiCSP_detail1: TppDetailBand;
    aladiCSP_dbt7: TppDBText;
    aladiCSP_dbt8: TppDBText;
    aladiCSP_memo2: TppDBMemo;
    aladiCSP_dbt1: TppDBText;
    aladiCSP_detail: TppDetailBand;
    //Relatório Aladi Peru
    AladiP: TppReport;
    aladip_parametro: TppParameterList;
    aladip_header: TppHeaderBand;
    aladip_dbt2: TppDBText;
    aladip_dbt3: TppDBText;
    aladip_dbt4: TppDBText;
    aladip_dbt5: TppDBText;
    aladip_dbt6: TppDBText;
    aladip_sub2: TppSubReport;
    aladip_child2: TppChildReport;
    aladip_header2: TppHeaderBand;
    aladip_detail2: TppDetailBand;
    aladip_memo2: TppDBMemo;
    aladip_memo3: TppDBMemo;
    aladip_sub1: TppSubReport;
    aladip_child1: TppChildReport;
    aladip_detail1: TppDetailBand;
    aladip_dbt7: TppDBText;
    aladip_dbt8: TppDBText;
    aladip_memo1: TppDBMemo;
    aladip_dbt1: TppDBText;
    aladip_sub3: TppSubReport;
    aladip_child3: TppChildReport;
    aladip_titulo3: TppTitleBand;
    aladip_detail3: TppDetailBand;
    aladip_dbt9: TppDBText;
    aladip_sumario3: TppSummaryBand;
    aladip_detail: TppDetailBand;
    //Relatório Aladi Peru CartaCred
    AladiPCartaCred: TppReport;
    aladiPC_parametro: TppParameterList;
    aladiPC_header: TppHeaderBand;
    aladiPC_dbt2: TppDBText;
    aladiPC_dbt3: TppDBText;
    aladiPC_dbt4: TppDBText;
    aladiPC_dbt5: TppDBText;
    aladiPC_dbt6: TppDBText;
    aladiPC_sub2: TppSubReport;
    aladiPC_child2: TppChildReport;
    aladiPC_header2: TppHeaderBand;
    aladiPC_detail2: TppDetailBand;
    aladiPC_memo2: TppDBMemo;
    aladiPC_memo3: TppDBMemo;
    aladiPC_sub1: TppSubReport;
    aladiPC_child1: TppChildReport;
    aladiPC_detail1: TppDetailBand;
    aladiPC_dbt7: TppDBText;
    aladiPC_dbt8: TppDBText;
    aladiPC_memo1: TppDBMemo;
    aladiPC_dbt1: TppDBText;
    aladiPC_sub3: TppSubReport;
    aladiPC_child3: TppChildReport;
    aladiPC_titulo3: TppTitleBand;
    aladiPC_detail3: TppDetailBand;
    aladiPC_dbt9: TppDBText;
    aladiPC_sumario3: TppSummaryBand;
    aladiPC_detail: TppDetailBand;
    //Relatório Peru SP
    AladiP_SP: TppReport;
    aladiPSP_parametro: TppParameterList;
    aladiPSP_header: TppHeaderBand;
    aladiPSP_dbt2: TppDBText;
    aladiPSP_dbt3: TppDBText;
    aladiPSP_dbt4: TppDBText;
    aladiPSP_dbt5: TppDBText;
    aladiPSP_dbt6: TppDBText;
    aladiPSP_sub2: TppSubReport;
    aladiPSP_child2: TppChildReport;
    aladiPSP_header2: TppHeaderBand;
    aladiPSP_detail2: TppDetailBand;
    aladiPSP_memo2: TppDBMemo;
    aladiPSP_memo3: TppDBMemo;
    aladiPSP_sub1: TppSubReport;
    aladiPSP_child1: TppChildReport;
    aladiPSP_detail1: TppDetailBand;
    aladiPSP_dbt7: TppDBText;
    aladiPSP_dbt8: TppDBText;
    aladiPSP_memo1: TppDBMemo;
    aladiPSP_dbt1: TppDBText;
    aladiPSP_sub3: TppSubReport;
    aladiPSP_child3: TppChildReport;
    aladiPSP_titulo3: TppTitleBand;
    aladiPSP_detail3: TppDetailBand;
    aladiPSP_dbt9: TppDBText;
    aladiPSP_sumario3: TppSummaryBand;
    aladiPSP_detail: TppDetailBand;
    //Relatório Aladi Peru CartaCred SP
    AladiPCartaCred_SP: TppReport;
    aladiPCSP_parametro: TppParameterList;
    aladiPCSP_header: TppHeaderBand;
    aladiPCSP_dbt2: TppDBText;
    aladiPCSP_dbt3: TppDBText;
    aladiPCSP_dbt4: TppDBText;
    aladiPCSP_dbt5: TppDBText;
    aladiPCSP_dbt6: TppDBText;
    aladiPCSP_sub2: TppSubReport;
    aladiPCSP_child2: TppChildReport;
    aladiPCSP_header2: TppHeaderBand;
    aladiPCSP_detail2: TppDetailBand;
    aladiPCSP_memo2: TppDBMemo;
    aladiPCSP_memo3: TppDBMemo;
    aladiPCSP_sub1: TppSubReport;
    aladiPCSP_child1: TppChildReport;
    aladiPCSP_detail1: TppDetailBand;
    aladiPCSP_dbt7: TppDBText;
    aladiPCSP_dbt8: TppDBText;
    aladiPCSP_memo1: TppDBMemo;
    aladiPCSP_dbt1: TppDBText;
    aladiPCSP_sub3: TppSubReport;
    aladiPCSP_child3: TppChildReport;
    aladiPCSP_titulo3: TppTitleBand;
    aladiPCSP_detail3: TppDetailBand;
    aladiPCSP_dbt9: TppDBText;
    aladiPCSP_sumario3: TppSummaryBand;
    aladiPCSP_detail: TppDetailBand;
    //Relatório Comum
    Comum: TppReport;
    Comum_parametro: TppParameterList;
    Comum_header: TppHeaderBand;
    Comum_dbt3: TppDBText;
    Comum_dbt4: TppDBText;
    Comum_dbt5: TppDBText;
    Comum_dbt6: TppDBText;
    Comum_memo1: TppDBMemo;
    Comum_dbt7: TppDBText;
    Comum_dbt8: TppDBText;
    Comum_dbt9: TppDBText;
    Comum_dbt10: TppDBText;
    Comum_dbt11: TppDBText;
    Comum_dbt12: TppDBText;
    Comum_memo2: TppDBMemo;
    Comum_dbt13: TppDBText;
    Comum_lbl3: TppLabel;
    Comum_memo3: TppDBMemo;
    Comum_lbl2: TppLabel;
    Comum_dbt2: TppDBText;
    Comum_dbt1: TppDBText;
    Comum_lbl1: TppLabel;
    Comum_detail: TppDetailBand;
    Comum_footer: TppFooterBand;
    //Relatório Comum CartaCred
    ComumCartaCred: TppReport;
    ComumC_parametro: TppParameterList;
    ComumC_header: TppHeaderBand;
    ComumC_dbt3: TppDBText;
    ComumC_dbt4: TppDBText;
    ComumC_dbt5: TppDBText;
    ComumC_dbt6: TppDBText;
    ComumC_dbt7: TppDBText;
    ComumC_memo2: TppDBMemo;
    ComumC_dbt8: TppDBText;
    ComumC_lbl3: TppLabel;
    ComumC_memo3: TppDBMemo;
    ComumC_lbl2: TppLabel;
    ComumC_dbt2: TppDBText;
    ComumC_dbt1: TppDBText;
    ComumC_lbl1: TppLabel;
    ComumC_memo1: TppDBMemo;
    ComumC_memo4: TppDBMemo;
    ComumC_detail: TppDetailBand;
    ComumC_footer: TppFooterBand;
    //Relatório Form A
    FormA: TppReport;
    ppParameterList1: TppParameterList;
    ppBandFormA: TppHeaderBand;
    ppRegDiv: TppRegion;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText3: TppDBText;
    ppLabel1: TppLabel;
    ppLabel6: TppLabel;
    ppOrigem: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppRegExp: TppRegion;
    ppDBText1: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText2: TppDBText;
    ppCNPJExp: TppDBText;
    ppSubMain: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand1: TppDetailBand;
    ppRegRE: TppRegion;
    ppSubRE: TppSubReport;
    ppChildReport2: TppChildReport;
    ppDetailBandRE: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText5: TppDBText;
    ppDBText15: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText11: TppDBText;
    ppLabel4: TppLabel;
    ppRegNCM: TppRegion;
    ppSubNCM: TppSubReport;
    ppChildReport3: TppChildReport;
    ppDetailBandNCM: TppDetailBand;
    ppDBText9: TppDBText;
    ppVarOrdem: TppVariable;
    ppDBMemo5: TppDBMemo;
    ppDBMemo3: TppDBMemo;
    ppDBText12: TppDBText;
    ppLabel13: TppLabel;
    ppDBText16: TppDBText;
    ppDBMDataFaturaIng: TppDBMemo;
    ppdbtxt_dt_conhecimento: TppDBText;
    ppdbtxt_nm_transportadora: TppDBText;
    ppdbtxt_nr_conhecimento: TppDBText;
    ppdbtxt_PaisDestino: TppDBText;
    ppPagina: TppSystemVariable;
    ppRegConsig: TppRegion;
    ppDBMemo18: TppDBMemo;
    ppDetailBandMerc: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    // Relatório FormA CartaCred
    FormACartaCred: TppReport;
    ppParameterList2: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppRegion1: TppRegion;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    ppDBText13: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText14: TppDBText;
    ppDBMemo4: TppDBMemo;
    ppRegion2: TppRegion;
    ppDBText19: TppDBText;
    ppSubReport18: TppSubReport;
    ppChildReport4: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppRegion3: TppRegion;
    ppSubReport1: TppSubReport;
    ppChildReport5: TppChildReport;
    ppDetailBand24: TppDetailBand;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppLabel5: TppLabel;
    ppRegion4: TppRegion;
    ppSubReport2: TppSubReport;
    ppChildReport6: TppChildReport;
    ppDetailBand25: TppDetailBand;
    ppDBText28: TppDBText;
    ppVariable1: TppVariable;
    ppDBMemo7: TppDBMemo;
    ppDBMemo8: TppDBMemo;
    ppDBText29: TppDBText;
    ppLabel7: TppLabel;
    ppDBText30: TppDBText;
    ppDBMemo9: TppDBMemo;
    ppDBMemo39: TppDBMemo;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText200: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppDBText201: TppDBText;
    ppDBText202: TppDBText;
    ppRegion5: TppRegion;
    ppDetailBand3: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    //logo BASF
    aladi_logo: TppImage;
    aladiC_logo: TppImage;
    aladiSP_logo: TppImage;
    aladiCSP_logo: TppImage;
    aladip_logo: TppImage;
    aladiPC_logo: TppImage;
    aladiPSP_logo: TppImage;
    aladiPCSP_logo: TppImage;
    ppDBMemo10: TppDBMemo;
    ppDBMemo11: TppDBMemo;
    ppDBMemo12: TppDBMemo;
    ppDBMemo13: TppDBMemo;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText37: TppDBText;
    ppDBMemo14: TppDBMemo;
    ppDBMemo15: TppDBMemo;
    ppDBText38: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBMemo16: TppDBMemo;
    ppDBMemo17: TppDBMemo;
    ppDBMemo19: TppDBMemo;
    ppDBMemo20: TppDBMemo;
    ppDBMemo21: TppDBMemo;
    ppBDE_CartappField44: TppField;
    ppDBMemo22: TppDBMemo;
    ppDBMemo23: TppDBMemo;
    ppDBMemo24: TppDBMemo;
    ppDBMemo25: TppDBMemo;
    ppDBMemo26: TppDBMemo;
    ppDBMemo27: TppDBMemo;
    ppDBMemo28: TppDBMemo;
    ppDBMemo6: TppDBMemo;
    ppDBMemo29: TppDBMemo;
    ppDBMemo30: TppDBMemo;
    ppDBMemo31: TppDBMemo;
    ppDBMemo32: TppDBMemo;
    ppDBMemo33: TppDBMemo;
    ppDBMemo34: TppDBMemo;
    ppDBMemo35: TppDBMemo;
    ppDBMemo36: TppDBMemo;
    ppDBMemo37: TppDBMemo;
    ACE36Fiesp: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText36: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppSubReport3: TppSubReport;
    ppChildReport7: TppChildReport;
    ppDetailBand4: TppDetailBand;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBMemo38: TppDBMemo;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppSubReport4: TppSubReport;
    ppChildReport8: TppChildReport;
    ppDetailBand5: TppDetailBand;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBMemo40: TppDBMemo;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDetailBand6: TppDetailBand;
    ppParameterList3: TppParameterList;
    ACE35Fiesp: TppReport;
    ppParameterList4: TppParameterList;
    ppHeaderBand3: TppHeaderBand;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppSubReport5: TppSubReport;
    ppChildReport9: TppChildReport;
    ppDetailBand7: TppDetailBand;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBMemo41: TppDBMemo;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppSubReport6: TppSubReport;
    ppChildReport10: TppChildReport;
    ppDetailBand8: TppDetailBand;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBMemo42: TppDBMemo;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDetailBand9: TppDetailBand;
    ACE18Fiesp: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppSubReport7: TppSubReport;
    ppChildReport11: TppChildReport;
    ppDetailBand10: TppDetailBand;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppDBMemo43: TppDBMemo;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppSubReport8: TppSubReport;
    ppChildReport12: TppChildReport;
    ppDetailBand11: TppDetailBand;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel10: TppLabel;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBMemo44: TppDBMemo;
    ppDBText98: TppDBText;
    ppDetailBand12: TppDetailBand;
    ppParameterList5: TppParameterList;
    //procedures
    procedure TViaTrCalcFields(DataSet: TDataSet);
    procedure ppVarOrdemCalc(Sender: TObject; var Value: Variant);
    procedure ace18_headerBeforePrint(Sender: TObject);
    procedure TExpCalcFields(DataSet: TDataSet);
    procedure TProcCalcFields(DataSet: TDataSet);
    procedure ace18CSP_headerBeforePrint(Sender: TObject);
    procedure ace35CSP_headerBeforePrint(Sender: TObject);
    procedure ace36_headerBeforePrint(Sender: TObject);
    procedure ace36C_headerBeforePrint(Sender: TObject);
    procedure ace36CSP_headerBeforePrint(Sender: TObject);
    procedure aladiCSP_headerBeforePrint(Sender: TObject);
    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);


    procedure pBeforePrintAce18CartaSP(Sender: TObject);
    procedure pBeforePrintAce18CartaSP_2(Sender: TObject);

    procedure pBeforePrintAce18SP(Sender: TObject);
    procedure pBeforePrintAce18SP_2(Sender: TObject);

    procedure pBeforePrintAce18(Sender: TObject);
    procedure pBeforePrintAce18_2(Sender: TObject);

    procedure pBeforePrintAce18Fiesp(Sender: TObject);
    procedure pBeforePrintAce18Fiesp_2(Sender: TObject);

    procedure pBeforePrintAce18Carta(Sender: TObject);
    procedure pBeforePrintAce18Carta_2(Sender: TObject);

    procedure pBeforePrintAce35(Sender: TObject);
    procedure pBeforePrintAce35_2(Sender: TObject);

    procedure pBeforePrintAce35Fiesp(Sender: TObject);
    procedure pBeforePrintAce35Fiesp_2(Sender: TObject);

    procedure pBeforePrintAce35SP(Sender: TObject);
    procedure pBeforePrintAce35SP_2(Sender: TObject);

    procedure pBeforePrintAce35Carta(Sender: TObject);
    procedure pBeforePrintAce35Carta_2(Sender: TObject);

    procedure pBeforePrintAce35CartaSP(Sender: TObject);
    procedure pBeforePrintAce35CartaSP_2(Sender: TObject);

    procedure pBeforePrintAce36(Sender: TObject);
    procedure pBeforePrintAce36_2(Sender: TObject);

    procedure pBeforePrintAce36Fiesp(Sender: TObject);
    procedure pBeforePrintAce36Fiesp_2(Sender: TObject);

    procedure pBeforePrintAce36CartaCred(Sender: TObject);
    procedure pBeforePrintAce36CartaCred_2(Sender: TObject);

    procedure pBeforePrintAce36SP(Sender: TObject);
    procedure pBeforePrintAce36SP_2(Sender: TObject);

    procedure pBeforePrintAce36CartaSP(Sender: TObject);
    procedure pBeforePrintAce36CartaSP_2(Sender: TObject);

    procedure pBeforePrintAce59(Sender: TObject);
    procedure pBeforePrintAce59_2(Sender: TObject);

    procedure pBeforePrintAce59Carta(Sender: TObject);
    procedure pBeforePrintAce59Carta_2(Sender: TObject);

    procedure pBeforePrintAladi(Sender: TObject);
    procedure pBeforePrintAladi_2(Sender: TObject);

    procedure pBeforePrintAladiCarta(Sender: TObject);
    procedure pBeforePrintAladiCarta_2(Sender: TObject);

    procedure pBeforePrintAladiSP(Sender: TObject);
    procedure pBeforePrintAladiSP_2(Sender: TObject);

    procedure pBeforePrintAladiCartaSP(Sender: TObject);
    procedure pBeforePrintAladiCartaSP_2(Sender: TObject);

    procedure pBeforePrintAladiPeru(Sender: TObject);
    procedure pBeforePrintAladiPeru_2(Sender: TObject);

    procedure pBeforePrintAladiPeruCarta(Sender: TObject);
    procedure pBeforePrintAladiPeruCarta_2(Sender: TObject);

    procedure pBeforePrintAladiPeruSP(Sender: TObject);
    procedure pBeforePrintAladiPeruSP_2(Sender: TObject);

    procedure pBeforePrintAladiPeruCartaSP(Sender: TObject);
    procedure pBeforePrintAladiPeruCartaSP_2(Sender: TObject);

    procedure pBeforePrintComum(Sender: TObject);
    procedure pBeforePrintComum_2(Sender: TObject);

    procedure pBeforePrintComumCarta(Sender: TObject);
    procedure pBeforePrintComumCarta_2(Sender: TObject);

    procedure pBeforePrintFormA(Sender: TObject);
    procedure pBeforePrintFormA_2(Sender: TObject);

    procedure pBeforePrintFormACarta(Sender: TObject);
    procedure pBeforePrintFormACarta_2(Sender: TObject);



  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  datm_exp_impr_cert_orig: Tdatm_exp_impr_cert_orig;

implementation

{$R *.DFM}

uses pgpe031, PGSM990;


//----------------------------------------------campos calculados gerais (início)
procedure Tdatm_exp_impr_cert_orig.TViaTrCalcFields(DataSet: TDataSet);
begin
  // Identifica a Via de Transporte do processo
  if TViaTr.FieldByName('CD_VIA_TRANSP').AsString = '01' then   // Maritima
     TViaTrCalcNmVia.AsString := 'MARÍTIMO';
  if TViaTr.FieldByName('CD_VIA_TRANSP').AsString = '02' then   // Fluvial
     TViaTrCalcNmVia.AsString := 'FLUVIAL';
  if TViaTr.FieldByName('CD_VIA_TRANSP').AsString = '03' then   // Lacustre
     TViaTrCalcNmVia.AsString := 'LACUSTRE';
  if TViaTr.FieldByName('CD_VIA_TRANSP').AsString = '04' then   // Aereo
     TViaTrCalcNmVia.AsString := 'AÉREO';
  if TViaTr.FieldByName('CD_VIA_TRANSP').AsString = '05' then   // Postal
     TViaTrCalcNmVia.AsString := 'POSTAL';
  if TViaTr.FieldByName('CD_VIA_TRANSP').AsString = '06' then   // Ferroviario
     TViaTrCalcNmVia.AsString := 'FERROVIÁRIO';
  if TViaTr.FieldByName('CD_VIA_TRANSP').AsString = '07' then   // Rodoviario
     TViaTrCalcNmVia.AsString := 'RODOVIÁRIO';
  if TViaTr.FieldByName('CD_VIA_TRANSP').AsString = '08' then   // Tubo Conduto
     TViaTrCalcNmVia.AsString := 'TUBO CONDUTO';
  if TViaTr.FieldByName('CD_VIA_TRANSP').AsString = '09' then   // Meios Proprios
     TViaTrCalcNmVia.AsString := 'MEIOS PRÓPRIOS';

  if ( Copy( ReportFileName, 1, 6 ) = '\Ace39' ) then TViaTrCalcAcordo.AsString := 'ACE 39';
  if ( Copy( ReportFileName, 1, 6 ) = '\Ace43' ) then TViaTrCalcAcordo.AsString := 'ACE 43';
  if ( Copy( ReportFileName, 1, 6 ) = '\Ace53' ) then TViaTrCalcAcordo.AsString := 'ACE 53';
  if ( Copy( ReportFileName, 1, 7 ) = '\Par-04') then TViaTrCalcAcordo.AsString := 'PAR-04';
end;

//calcula o nome do importador
procedure Tdatm_exp_impr_cert_orig.TExpCalcFields(DataSet: TDataSet);
begin
  if Pos('(', TExp.FieldByName('PP_NOME').AsString) <> 0 then
     TExp.FieldByName('calc_nome').AsString :=  Copy(TExp.FieldByName('PP_NOME').AsString, 1, Pos('(', TExp.FieldByName('PP_NOME').AsString) - 1)
  else
     TExp.FieldByName('calc_nome').AsString :=  TExp.FieldByName('PP_NOME').AsString;
end;

//calcula o nome do importador
procedure Tdatm_exp_impr_cert_orig.TProcCalcFields(DataSet: TDataSet);
begin
  if Pos( '(' , TProc.FieldByName('PP_NOME').AsString ) <> 0 then
     TProc.FieldByName('calc_nome').AsString :=  Copy(TProc.FieldByName('PP_NOME').AsString, 1, Pos('(', Tproc.FieldByName('PP_NOME').AsString) - 1)
  else
     TProc.FieldByName('calc_nome').AsString :=  TProc.FieldByName('PP_NOME').AsString;
end;
//----------------------------------------------campos calculados gerais (final)

//----------------------------------------------campos calculados formA (início)
procedure Tdatm_exp_impr_cert_orig.ppVarOrdemCalc(Sender: TObject;
  var Value: Variant);
begin
//  ppVarOrdem.Value := ppVarOrdem.Value + 1;
  TppVariable(Frm_impressao.FindComponent('ppVarOrdem')).Value := TppVariable(Frm_impressao.FindComponent('ppVarOrdem')).Value + 1;
end;
//----------------------------campos calculados do FormA (final)

//----------------------------campos calculados do FormA CartaCred (início)
procedure Tdatm_exp_impr_cert_orig.ppVariable1Calc(Sender: TObject;
  var Value: Variant);
begin
//  ppVariable1.Value := ppVariable1.Value + 1;
  TppVariable(Frm_impressao.FindComponent('ppVariable1')).Value := TppVariable(Frm_impressao.FindComponent('ppVariable1')).Value + 1;
end;
//----------------------------campos calculados do FormA CartaCred (final)

//----------------------------programação da quebra de ordem do ACE 18 (início)
procedure Tdatm_exp_impr_cert_orig.ace18_headerBeforePrint(Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    ace18_detail1.PrintCount := 5;
    ace18_child1.PrintCount  := 5;
  end
  else
  begin
    ace18_detail1.PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    ace18_child1.PrintCount  := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.ace18CSP_headerBeforePrint(
  Sender: TObject);
begin
end;
//----------------------------programação da quebra de ordem do ACE 18 (final)


//----------------------------programação da quebra de ordem do ACE 35 (início)
procedure Tdatm_exp_impr_cert_orig.ace35CSP_headerBeforePrint(
  Sender: TObject);
begin
end;
//----------------------------programação da quebra de ordem do ACE 35 (final)


//----------------------------programação da quebra de ordem do ACE 36 (início)
procedure Tdatm_exp_impr_cert_orig.ace36_headerBeforePrint(
  Sender: TObject);
begin
{  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    ace36_detail1.PrintCount := 5;
    ace36_detail2.PrintCount  := 5;
  end
  else
  begin
    ace36_detail1.PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    ace36_detail2.PrintCount  := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;}
end;

procedure Tdatm_exp_impr_cert_orig.ace36C_headerBeforePrint(
  Sender: TObject);
begin
{  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    ace36C_detail1.PrintCount := 5;
    ace36C_detail2.PrintCount  := 5;
  end
  else
  begin
    ace36C_detail1.PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    ace36C_detail2.PrintCount  := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;}
end;

procedure Tdatm_exp_impr_cert_orig.ace36CSP_headerBeforePrint(
  Sender: TObject);
begin
end;
//----------------------------programação da quebra de ordem do ACE 36 (final)

procedure Tdatm_exp_impr_cert_orig.aladiCSP_headerBeforePrint(
  Sender: TObject);
begin
end;
//----------------------------programação da quebra de ordem do Aladi (final)


procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce36(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ace36_header')).BeforePrint := pBeforePrintAce36_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce36_2(Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_impressao.FindComponent('ace36_detail1')).PrintCount := 5;
    TppDetailBand(Frm_impressao.FindComponent('ace36_detail2')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_impressao.FindComponent('ace36_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_impressao.FindComponent('ace36_detail2')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce36Fiesp(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ppHeaderBand2')).BeforePrint := pBeforePrintAce36Fiesp_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce36Fiesp_2(Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_impressao.FindComponent('ppDetailBand4')).PrintCount := 5;
    TppDetailBand(Frm_impressao.FindComponent('ppDetailBand5')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_impressao.FindComponent('ppDetailBand4')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_impressao.FindComponent('ppDetailBand5')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;


procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce36CartaCred(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ace36C_header')).BeforePrint := pBeforePrintAce36CartaCred_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce36CartaCred_2(Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace36C_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('ace36C_detail2')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace36C_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('ace36C_detail2')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;


procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce18(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ace18_header')).BeforePrint := pBeforePrintAce18_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce18Fiesp(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ppHeaderBand4')).BeforePrint := pBeforePrintAce18Fiesp_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce18_2(Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace18_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('ace18_child1')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace18_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('ace18_child1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce18Fiesp_2(
  Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ppDetailBand10')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('ppDetailBand11')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ppDetailBand10')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('ppDetailBand11')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce18Carta(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ace18C_header')).BeforePrint := pBeforePrintAce18Carta_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce18Carta_2(
  Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace18C_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('ace18C_detail2')).PrintCount  := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace18C_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('ace18C_detail2')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce18SP(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ace18SP_header')).BeforePrint := pBeforePrintAce18SP_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce18SP_2(Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace18SP_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('ace18SP_detail2')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace18SP_detail1')).PrintCount := StrToInt( Frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('ace18SP_detail2')).PrintCount := StrToInt( Frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce18CartaSP(
  Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ace18CSP_header')).BeforePrint := pBeforePrintAce18CartaSP_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce18CartaSP_2(
  Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace18CSP_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('ace18CSP_detail2')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace18CSP_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('ace18CSP_detail2')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce35(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ace35_header')).BeforePrint := pBeforePrintAce35_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce35_2(Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace35_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('ace35_detail2')).PrintCount  := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace35_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('ace35_detail2')).PrintCount  := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce35Fiesp(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ppHeaderBand3')).BeforePrint := pBeforePrintAce35Fiesp_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce35Fiesp_2(
  Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ppDetailBand7')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('ppDetailBand8')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ppDetailBand7')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('ppDetailBand8')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce35SP(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ace35SP_header')).BeforePrint := pBeforePrintAce35SP_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce35SP_2(Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace35SP_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('ace35SP_detail2')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace35SP_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('ace35SP_detail2')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce35Carta(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ace35C_header')).BeforePrint := pBeforePrintAce35Carta_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce35Carta_2(
  Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace35C_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('ace35C_detail2')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace35C_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('ace35C_detail2')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce35CartaSP(
  Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ace35CSP_header')).BeforePrint := pBeforePrintAce35CartaSP_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce35CartaSP_2(
  Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace35CSP_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('ace35CSP_detail2')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace35CSP_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('ace35CSP_detail2')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce36SP(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ace36SP_header')).BeforePrint := pBeforePrintAce36SP_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce36SP_2(Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace36SP_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('ace36SP_detail2')).PrintCount := 5;
  end                                          
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace36SP_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('ace36SP_detail2')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce36CartaSP(
  Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ace36CSP_header')).BeforePrint := pBeforePrintAce36CartaSP_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce36CartaSP_2(
  Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace36CSP_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('ace36CSP_detail2')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace36CSP_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('ace36CSP_detail2')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce59(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ace59_header')).BeforePrint := pBeforePrintAce59_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce59_2(Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace59_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('ace59_detail2')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace59_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('ace59_detail2')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce59Carta(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ace59C_header')).BeforePrint := pBeforePrintAce59Carta_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAce59Carta_2(
  Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace59C_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('ace59C_detail2')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('ace59C_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('ace59C_detail2')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladi(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('aladi_header')).BeforePrint := pBeforePrintAladi_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladi_2(Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('aladi_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('aladi_detail2')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('aladi_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('aladi_detail2')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladiCarta(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('aladiC_header')).BeforePrint := pBeforePrintAladiCarta_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladiCarta_2(
  Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('aladiC_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('aladiC_detail2')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('aladiC_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('aladiC_detail2')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladiCartaSP(
  Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('aladiCSP_header')).BeforePrint := pBeforePrintAladiCartaSP_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladiCartaSP_2(
  Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppDetailBand(Frm_Impressao.FindComponent('aladiCSP_detail1')).PrintCount := 5;
    TppDetailBand(Frm_Impressao.FindComponent('aladiCSP_detail2')).PrintCount := 5;
  end
  else
  begin
    TppDetailBand(Frm_Impressao.FindComponent('aladiCSP_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppDetailBand(Frm_Impressao.FindComponent('aladiCSP_detail2')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladiSP(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('aladiSP_header')).BeforePrint := pBeforePrintAladiSP_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladiSP_2(Sender: TObject);
begin
  if TProc.FieldByName('CD_PAIS_DESTINO').AsString = '589' then    // Peru
  begin
    TppHeaderBand(Frm_impressao.FindComponent('aladiSP_detail1')).PrintCount := 5;
    TppHeaderBand(Frm_impressao.FindComponent('aladiSP_detail2')).PrintCount := 5;
  end
  else
  begin
    TppHeaderBand(Frm_impressao.FindComponent('aladiSP_detail1')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
    TppHeaderBand(Frm_impressao.FindComponent('aladiSP_detail2')).PrintCount := StrToInt( frm_exp_impr_cert_orig.msk_nr_ordem.Text );
  end;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladiPeru(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('aladip_header')).BeforePrint := pBeforePrintAladiPeru_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladiPeru_2(
  Sender: TObject);
begin
//
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladiPeruCarta(
  Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('aladiPC_header')).BeforePrint := pBeforePrintAladiPeruCarta_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladiPeruCarta_2(
  Sender: TObject);
begin
//
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladiPeruSP(
  Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('aladiPSP_header')).BeforePrint := pBeforePrintAladiPeruSP_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladiPeruSP_2(
  Sender: TObject);
begin
//
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladiPeruCartaSP(
  Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('aladiPCSP_header')).BeforePrint := pBeforePrintAladiPeruCartaSP_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintAladiPeruCartaSP_2(
  Sender: TObject);
begin
//
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintComum(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('Comum_header')).BeforePrint := pBeforePrintComum_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintComum_2(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintComumCarta(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ComumC_header')).BeforePrint := pBeforePrintComumCarta_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintComumCarta_2(
  Sender: TObject);
begin
//
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintFormA(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ppBandFormA')).BeforePrint := pBeforePrintFormA_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintFormA_2(Sender: TObject);
begin
  //if TppSystemVariable(Frm_impressao.FindComponent('ppPagina')).Text = '4' then
  //if tppLabel(Frm_impressao.FindComponent('ppPagina')).Text = '4' then
  if ppPagina.Text = '4' then
  begin
    ppRegExp.Top := 100;
    ppRegDiv.Top := 1356;
    ppRegNCM.Top := 2825;
    ppRegRE.Top  := 5394;
  end
  else
  begin
    ppRegExp.Top := 125;
    ppRegDiv.Top := 1381;
    ppRegNCM.Top := 2850;
    ppRegRE.Top  := 5419;
  end;

  ppCNPJExp.Visible  := ppPagina.Text <> '1' ;
  ppOrigem.Visible   := ppPagina.Text <> '1' ;
  ppSubRE.Visible := ppPagina.Text <> '1' ;


  ppdbtxt_nr_conhecimento.Visible   := ppPagina.Text <> '1';
  ppdbtxt_dt_conhecimento.Visible   := ppPagina.Text <> '1';
  ppdbtxt_nm_transportadora.Visible := ppPagina.Text <> '1';
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintFormACarta(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ppHeaderBand1')).BeforePrint := pBeforePrintFormACarta_2;
end;

procedure Tdatm_exp_impr_cert_orig.pBeforePrintFormACarta_2(
  Sender: TObject);
begin
  if ppSystemVariable1.Text = '4' then
  begin
    TppRegion(Frm_impressao.FindComponent('ppRegion2')).Top := 100;
    TppRegion(Frm_impressao.FindComponent('ppRegion1')).Top := 1356;
    TppRegion(Frm_impressao.FindComponent('ppRegion4')).Top := 2825;
    TppRegion(Frm_impressao.FindComponent('ppRegion3')).Top := 5394;
  end
  else
  begin
    TppRegion(Frm_impressao.FindComponent('ppRegion2')).Top := 125;
    TppRegion(Frm_impressao.FindComponent('ppRegion1')).Top := 1381;
    TppRegion(Frm_impressao.FindComponent('ppRegion4')).Top := 2850;
    TppRegion(Frm_impressao.FindComponent('ppRegion3')).Top := 5419;
  end;
  TppDBText(Frm_impressao.FindComponent('ppDBText19')).Visible   := ( ppSystemVariable1.Text <> '1' );
  TppDBText(Frm_impressao.FindComponent('ppDBText14')).Visible   := ( ppSystemVariable1.Text <> '1' );
  TppDBText(Frm_impressao.FindComponent('ppSubReport1')).Visible := ( ppSystemVariable1.Text <> '1' );

  TppDBText(Frm_impressao.FindComponent('ppDBText33')).Visible   := ( ppSystemVariable1.Text <> '1' );
  TppDBText(Frm_impressao.FindComponent('ppDBText31')).Visible   := ( ppSystemVariable1.Text <> '1' );
  TppDBText(Frm_impressao.FindComponent('ppDBText32')).Visible   := ( ppSystemVariable1.Text <> '1' );
end;

end.





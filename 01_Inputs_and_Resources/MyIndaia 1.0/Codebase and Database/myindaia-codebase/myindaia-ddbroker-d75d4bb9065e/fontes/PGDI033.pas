unit PGDI033;

interface

uses                                                       
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppModule, daDatMod, ppCtrls, ppPrnabl, ppClass, ppBands,
  ppDB, ppCache, ppDBPipe, ppDBBDE, ppEndUsr, ppComm, ppRelatv, ppProd,
  ppReport, ppVar, ppRegion, ppStrtch, ppMemo, ppSubRpt, raCodMod,
  ppParameter, jpeg,ConsOnLineEx, ExtCtrls,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tdatm_DI_Resumo = class(TDataModule)
    qry_resumo_di_: TQuery;
    ds_resumo_di: TDataSource;
    ppReport: TppReport;
    ppDesigner: TppDesigner;
    ppBDEPipeline: TppBDEPipeline;
    qry_resumo_di_CD_INCOTERM: TStringField;
    qry_resumo_di_CD_MOEDA_FRETE: TStringField;
    qry_resumo_di_CD_MOEDA_MLE: TStringField;
    qry_resumo_di_PB_CARGA: TFloatField;
    qry_resumo_di_PL_CARGA: TFloatField;
    qry_resumo_di_QT_ADICOES: TIntegerField;
    qry_resumo_di_VL_TOT_DESPS_MN: TFloatField;
    qry_resumo_di_VL_TOT_DESPS_MNEG: TFloatField;
    qry_resumo_di_VL_TOT_MLE_MNEG: TFloatField;
    qry_resumo_di_VL_TOT_SEGURO_MNEG: TFloatField;
    qry_resumo_di_VL_TOTAL_FRETE_MN: TFloatField;
    qry_resumo_di_VL_TOTAL_MLE_MN: TFloatField;
    qry_resumo_di_VL_TOTAL_SEG_MN: TFloatField;
    qry_resumo_di_VL_TOTAL_II: TFloatField;
    qry_resumo_di_VL_TOTAL_IPI: TFloatField;
    qry_resumo_di_VL_TOTAL_AD: TFloatField;
    qry_resumo_di_TX_MLE: TFloatField;
    qry_resumo_di_TX_FRETE: TFloatField;
    qry_resumo_di_TX_SEGURO: TFloatField;
    qry_resumo_di_TX_DOLAR: TFloatField;
    qry_resumo_di_VL_TOTAL_ACRESCIMOS_MN: TFloatField;
    qry_resumo_di_VL_TOTAL_DEDUCOES_MN: TFloatField;
    qry_resumo_di_VL_TOT_ICMS: TFloatField;
    qry_resumo_di_VL_SDA: TFloatField;
    qry_resumo_di_VL_CONTR_ASSIST: TFloatField;
    qry_resumo_di_VL_TRIBUTO_PAGO: TFloatField;
    qry_resumo_di_CD_RECEITA_PGTO: TStringField;
    qry_resumo_di_IN_EMBUT_FRT_ITENS: TBooleanField;
    qry_resumo_di_IN_EMBUT_SEG_ITENS: TBooleanField;
    qry_resumo_di_VL_CIF_DOLAR: TFloatField;
    qry_resumo_di_VL_CIF_MN: TFloatField;
    qry_resumo_di_CD_EMPRESA: TStringField;
    qry_resumo_di_NM_EMPRESA: TStringField;
    qry_resumo_di_VL_FRETE_MOEDA: TFloatField;
    qry_resumo_di_VL_PIS: TFloatField;
    qry_resumo_di_VL_COFINS: TFloatField;
    qry_resumo_di_VL_TOTAL_TRIBUTOS: TFloatField;
    qry_resumo_di_NR_PROCESSO: TStringField;
    qry_resumo_di_VL_TOT_FRT_COLLECT: TFloatField;
    qry_resumo_di_DT_CALCULO: TDateTimeField;
    qry_resumo_di_Calc_VL_FRETE_MNEG: TFloatField;
    qry_resumo_di_Calc_CIF: TFloatField;
    qry_resumo_di_Calc_NR_PROCESSO: TStringField;
    qry_resumo_di_VL_FRETE_TNAC_MNEG: TFloatField;
    qry_resumo_di_VL_TOT_FRT_PREPAID: TFloatField;
    qry_resumo_di_VL_TOT_DESPS_MN_1: TFloatField;
    qry_resumo_di_VL_TOT_DESPS_MNEG_1: TFloatField;
    qry_resumo_di_VL_TOT_MLE_MNEG_1: TFloatField;
    qry_resumo_di_VL_TOT_SEGURO_MNEG_1: TFloatField;
    qry_resumo_di_VL_BASE_CALC_ICMS: TFloatField;
    qry_resumo_di_CD_MOEDA_SEGURO: TStringField;
    qry_resumo_di_NM_MOEDA_FRETE: TStringField;
    qry_resumo_di_NM_MOEDA_MLE: TStringField;
    qry_resumo_di_NM_MOEDA_SEGURO: TStringField;
    qry_resumo_di_CD_SERVICO: TStringField;
    qry_resumo_di_NM_SERVICO: TStringField;
    qry_resumo_di_RECINTO: TStringField;
    qry_resumo_di_APLICACAO: TStringField;
    qry_resumo_di_NM_EMBARCACAO: TStringField;
    qry_resumo_di_DT_CHEG_NAVIO: TDateTimeField;
    qry_resumo_di_NM_TRANSP_ROD: TStringField;
    qryAliquotas: TQuery;
    dtsAliquotas: TDataSource;
    ppBDEPipelineAliquota: TppBDEPipeline;
    ppParameterList1: TppParameterList;
    qryAux: TQuery;
    qry_resumo_di_VL_ICMS_A_RECOLHER_AFRMM: TFloatField;
    qry_resumo_di_NR_PROCESSO_COMPLETO: TStringField;
    qry_resumo_di_CD_AREA: TStringField;
    qry_resumo_di_NM_AREA: TStringField;
    qryAliquotasNR_ADICAO: TStringField;
    qryAliquotasPC_ICMS: TFloatField;
    qryAliquotasCD_CFOP: TStringField;
    qry_resumo_di_CD_VIA_TRANSP_CARG: TStringField;
    qryCntrEmbalagem: TQuery;
    dsCntrEmbalagem: TDataSource;
    ppBDEPipelineCntrEmbalagem: TppBDEPipeline;
    qryCntrEmbalagemNR_PROCESSO: TStringField;
    qryCntrEmbalagemNR_PROCESSO_COMPLETO: TStringField;
    qryCntrEmbalagemTITULO: TStringField;
    qryCntrEmbalagemQTD: TFloatField;
    qry_resumo_di_VL_FUNDO_POBREZA: TFloatField;
    qry_resumo_di_IN_FUNDO_POBREZA: TStringField;
    qryAliquotasPC_FUNDO_POBREZA_RJ: TFloatField;
    qryAliquotasIN_FUNDO_POBREZA: TStringField;
    qryPedidos: TQuery;
    dsPedidos: TDataSource;
    ppBDEPipelinePedidos: TppBDEPipeline;
    qryPedidosREFERENCIAS: TStringField;
    qry_resumo_di_VL_IMPOSTOS: TFloatField;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText13: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppLabel43: TppLabel;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppLabel49: TppLabel;
    ppMemo1: TppMemo;
    ppMemo2: TppMemo;
    ppMemo3: TppMemo;
    ppLabel50: TppLabel;
    ppDBText50: TppDBText;
    ppLabel51: TppLabel;
    ppDBText51: TppDBText;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppShape3: TppShape;
    ppDBText39: TppDBText;
    ppDBText52: TppDBText;
    ppLine11: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape2: TppShape;
    ppDBText55: TppDBText;
    ppLabel53: TppLabel;
    ppLine10: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel52: TppLabel;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppLabel54: TppLabel;
    ppDBText56: TppDBText;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppDBText57: TppDBText;
    ppLabel56: TppLabel;
    ppFooterBand1: TppFooterBand;
    ppNumPag: TppSystemVariable;
    ppTotPag: TppSystemVariable;
    ppLabel34: TppLabel;
    ppLabel38: TppLabel;
    ppLabel42: TppLabel;
    ppVarRodapeEsq: TppVariable;
    ppLine2: TppLine;
    qry_resumo_di_VL_BASE_CALC_ICMS_AFRMM: TFloatField;
    qry_resumo_di_IN_MARINHA_MERCANTE_ICMS: TStringField;
    fltfld_resumo_di_VL_ICMS_ACRESCIMOS: TFloatField;
    qry_resumo_di_CD_REF_OUTROS: TStringField;
    ppDBText58: TppDBText;
    ppLabel55: TppLabel;
    ppDBText59: TppDBText;
    qry_resumo_di_CD_GRUPO: TStringField;
    raCodeModule2: TraCodeModule;
    raCodeModule1: TraCodeModule;
    ppLabel57: TppLabel;
    ppDBText60: TppDBText;
    ppBDEPipelineppVL_TOTAL_AFRMM: TppField;
    qry_resumo_di_VL_TOTAL_AFRMM: TFloatField;
    procedure qry_resumo_di_CalcFields(DataSet: TDataSet);
    procedure ppVarRodapeEsqCalc(Sender: TObject; var Value: Variant);
    procedure qry_resumo_di_AfterOpen(DataSet: TDataSet);
    procedure qry_resumo_di_BeforeClose(DataSet: TDataSet);
    private
      pAliqAdicao1, pAliqAdicao2, pAliqAdicao3, pAliqAdicao4, pAliqAdicao5, pAliqAdicao6: string;
    procedure LimpaMemos;
  public
    { Public declarations }
  end;

  // Panel criado para verificar a largura do texto - Michel - 10/01/2012
  TCanvasPanel = class(TPanel)
  public
    property Canvas;
  end;

var
  datm_DI_Resumo: Tdatm_DI_Resumo;

implementation

{$R *.DFM}

uses PGRE002, PGGP001, GSMLIB, StrUtils, PGDI032;

procedure Tdatm_DI_Resumo.qry_resumo_di_CalcFields(DataSet: TDataSet);
begin
  qry_resumo_di_Calc_VL_FRETE_MNEG.AsFloat := ( qry_resumo_di_VL_TOT_FRT_COLLECT.AsFloat +
                                              qry_resumo_di_VL_TOT_FRT_PREPAID.AsFloat ) -
                                              qry_resumo_di_VL_FRETE_TNAC_MNEG.AsFloat;
  qry_resumo_di_Calc_CIF.AsFloat := qry_resumo_di_VL_TOTAL_MLE_MN.AsFloat +
                                    qry_resumo_di_VL_TOT_DESPS_MN.AsFloat +
                                    qry_resumo_di_VL_TOTAL_ACRESCIMOS_MN.AsFloat +
                                    qry_resumo_di_VL_TOTAL_DEDUCOES_MN.AsFloat;

  if Not qry_resumo_di_IN_EMBUT_FRT_ITENS.AsBoolean then
     qry_resumo_di_Calc_CIF.AsFloat := qry_resumo_di_Calc_CIF.AsFloat +
                                       qry_resumo_di_VL_TOTAL_FRETE_MN.AsFloat;

  if Not qry_resumo_di_IN_EMBUT_SEG_ITENS.AsBoolean then
     qry_resumo_di_Calc_CIF.AsFloat := qry_resumo_di_Calc_CIF.AsFloat +
                                       qry_resumo_di_VL_TOTAL_SEG_MN.AsFloat;
                                 

  qry_resumo_di_Calc_NR_PROCESSO.AsString := qry_resumo_di_NR_PROCESSO.AsString;

  LimpaMemos;
  // Os Loops abaixo foram incluídos porque a fonte estava aparecendo diferente quando havia menos de 23 items no Memo - Michel - 15/05/2009
  ppMemo1.Lines.Add(pAliqAdicao1);
  while ppMemo1.Lines.Count < 23 do
    ppMemo1.Lines.Add('');
  ppMemo2.Lines.Add(pAliqAdicao2);
  while ppMemo2.Lines.Count < 23 do
    ppMemo2.Lines.Add('');
  ppMemo3.Lines.Add(pAliqAdicao3);
  while ppMemo3.Lines.Count < 23 do
    ppMemo3.Lines.Add('');
  //ppMemo4.Lines.Add(pAliqAdicao4);
  //while ppMemo4.Lines.Count < 23 do
  //  ppMemo4.Lines.Add('');
  //ppMemo5.Lines.Add(pAliqAdicao5);
  //ppMemo6.Lines.Add(pAliqAdicao6);
end;

procedure Tdatm_DI_Resumo.LimpaMemos;
begin
  ppMemo1.Lines.Clear;
  ppMemo2.Lines.Clear;
  ppMemo3.Lines.Clear;
  //ppMemo4.Lines.Clear;
  //ppMemo5.Lines.Clear;
  //ppMemo6.Lines.Clear;
end;

procedure Tdatm_DI_Resumo.ppVarRodapeEsqCalc(Sender: TObject;
var Value: Variant);
begin
  ppVarRodapeEsq.AsString := Space(2) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
end;


procedure Tdatm_DI_Resumo.qry_resumo_di_AfterOpen(DataSet: TDataSet);
const
  _CANVAS_WIDTH = 200;   // Michel - 10/01/2012
var
  ContReg : Integer;
  via : string;
begin
  ContReg := 0;
  qryAliquotas.Close;
  qryAliquotas.ParamByName('NR_PROCESSO').AsString := qry_resumo_di_NR_PROCESSO_COMPLETO.AsString;
  qryAliquotas.Open;

  qryCntrEmbalagem.ParamByName('NR_PROCESSO').AsString := qry_resumo_di_NR_PROCESSO_COMPLETO.AsString;
  qryCntrEmbalagem.Open;

  qryPedidos.Close;
  qryPedidos.ParamByName('NR_PROCESSO').AsString := qry_resumo_di_NR_PROCESSO_COMPLETO.AsString;

  //////////////////////////////////////////////////////////////////////////////////////////////
  //      Caso o número de adições cause um 'overflow' no RowConcat, ele remonta a query sem
  //      o número do item do pedido, para não estourar o RowConcat.
  //                                Eric,      10:29h        15/02/2012
  //
   with qryPedidos do
     begin
        try
          qryPedidos.Open;
        except
          SQL.Clear;
          SQL.Add('SELECT MASTER.DBO.ROWCONCATLEFT(DISTINCT RTRIM(RC.CD_REFERENCIA) + '', '') AS REFERENCIAS');
          SQL.Add('FROM TREF_CLIENTE RC');
          SQL.Add('INNER JOIN TPROCESSO P ON P.NR_PROCESSO = RC.NR_PROCESSO');
          SQL.Add('INNER JOIN TGRUPO    G ON G.CD_GRUPO    = P.CD_GRUPO');
          SQL.Add('WHERE RC.NR_PROCESSO = :NR_PROCESSO');
          SQL.Add('AND RC.TP_REFERENCIA = ''01''');
          ParamByName('NR_PROCESSO').AsString := qry_resumo_di_NR_PROCESSO_COMPLETO.AsString;
          Open;
        end;
    end;
  //////////////////////////////////////////////////////////////////////////////////////////////

  LimpaMemos;
  pAliqAdicao1 := '';
  pAliqAdicao2 := '';
  pAliqAdicao3 := '';
  pAliqAdicao4 := '';
  pAliqAdicao5 := '';
  pAliqAdicao6 := '';

  // Panel criado para verificar a largura do texto - Michel - 10/01/2012
  with TCanvasPanel.Create(frm_DI_Resumo) do
  begin
    Parent := frm_DI_Resumo;
    Visible := False;
    Canvas.Font.Assign(ppMemo1.Font);
    try
      while not qryAliquotas.Eof do     //FERNANDA 09/01/2012 (O_00124/11)  LEVANDO INFORMAÇÃO/DESCRIÇÃO DA DI PARA CAPA DA DI.
      begin
        via:= ConsultaLookUP('TCFOP', 'CD_CFOP', StringReplace(qryAliquotasCD_CFOP.AsString, '.', '', []), 'NM_CFOP') ;    //StringReplace(Substituindo . , por nada)

        if qryAliquotasIN_FUNDO_POBREZA.AsString = '1' then
          via := qryAliquotasNR_ADICAO.AsString + ' - ' +
             'ICMS: ' + FormatFloat('#,##0.00', qryAliquotasPC_ICMS.AsFloat) + '% /FECP: ' + FormatFloat('#,##0.00', qryAliquotasPC_FUNDO_POBREZA_RJ.AsFloat) + '% /CFOP: ' + qryAliquotasCD_CFOP.AsString + ' ' + via
        else
          via := qryAliquotasNR_ADICAO.AsString + ' - ' +
             'ICMS: ' + FormatFloat('#,##0.00', qryAliquotasPC_ICMS.AsFloat) + '% /CFOP: ' + qryAliquotasCD_CFOP.AsString + ' ' + via;

        // Loop para verificar o tamanho máximo do texto para a fonte do Memo - Michel - 10/01/2012
        while Canvas.TextWidth(via) > _CANVAS_WIDTH do
          via := Copy(via, 1, Length(via) - 1);   // pega o texto (aplicação do produto) 1ªletra e vai alocando dentro do objeto(Memo) e qdo atingir sua largura permitida ele vai "cortando" o texto (-1). Antes eu havia usado via := AnsiMidStr(via,1,31); no texto do 1 até a posição 31

        if ContReg < 23 then  // ADIÇÕES NO MEMO
          pAliqAdicao1 := pAliqAdicao1 + via + #13
        else if ContReg < 46 then
          pAliqAdicao2 := pAliqAdicao2 + via + #13
        else if ContReg < 69 then
          pAliqAdicao3 := pAliqAdicao3 + via + #13
        {else if ContReg < 92 then
        begin
            via:= ConsultaLookUP('tcfop','cd_cfop',StringReplace(qryAliquotasCD_CFOP.AsString,'.','',[]),'NM_CFOP') ;    //StringReplace(Substituindo . , por nada)
            via := AnsiMidStr(via,1,31);
          if qryAliquotasIN_FUNDO_POBREZA.AsString = '1' then
            pAliqAdicao4 := pAliqAdicao4 + qryAliquotasNR_ADICAO.AsString + ' - ' +
               'ICMS: ' + FormatFloat('#,##0.00', qryAliquotasPC_ICMS.AsFloat) + '% /FECP: ' + FormatFloat('#,##0.00', qryAliquotasPC_FUNDO_POBREZA_RJ.AsFloat) + '% /CFOP: ' + qryAliquotasCD_CFOP.AsString + #13
          else
            pAliqAdicao4 := pAliqAdicao4 + qryAliquotasNR_ADICAO.AsString + ' - ' +
               'ICMS: ' + FormatFloat('#,##0.00', qryAliquotasPC_ICMS.AsFloat) + '% /CFOP: ' + qryAliquotasCD_CFOP.AsString + via + #13;
        end
        else if ContReg < 115 then
        begin
          if qryAliquotasIN_FUNDO_POBREZA.AsString = '1' then
            pAliqAdicao5 := pAliqAdicao5 + qryAliquotasNR_ADICAO.AsString + ' - ' +
               'ICMS: ' + FormatFloat('#,##0.00', qryAliquotasPC_ICMS.AsFloat) + '% /FECP: ' + FormatFloat('#,##0.00', qryAliquotasPC_FUNDO_POBREZA_RJ.AsFloat) + '% /CFOP: ' + qryAliquotasCD_CFOP.AsString + #13
          else
            pAliqAdicao5 := pAliqAdicao5 + qryAliquotasNR_ADICAO.AsString + ' - ' +
               'ICMS: ' + FormatFloat('#,##0.00', qryAliquotasPC_ICMS.AsFloat) + '% /CFOP: ' + qryAliquotasCD_CFOP.AsString + #13;
        end
        else if ContReg < 138 then
        begin
          if qryAliquotasIN_FUNDO_POBREZA.AsString = '1' then
            pAliqAdicao6 := pAliqAdicao6 + qryAliquotasNR_ADICAO.AsString + ' - ' +
               'ICMS: ' + FormatFloat('#,##0.00', qryAliquotasPC_ICMS.AsFloat) + '% /FECP: ' + FormatFloat('#,##0.00', qryAliquotasPC_FUNDO_POBREZA_RJ.AsFloat) + '% /CFOP: ' + qryAliquotasCD_CFOP.AsString + #13
          else
            pAliqAdicao6 := pAliqAdicao6 + qryAliquotasNR_ADICAO.AsString + ' - ' +
               'ICMS: ' + FormatFloat('#,##0.00', qryAliquotasPC_ICMS.AsFloat) + '% /CFOP: ' + qryAliquotasCD_CFOP.AsString + #13;
        end};
        qryAliquotas.Next;
        Inc(ContReg);
      end;
    finally
      Free;
    end;
  end;
end;

procedure Tdatm_DI_Resumo.qry_resumo_di_BeforeClose(DataSet: TDataSet);
begin
  if qryCntrEmbalagem.Active then
    qryCntrEmbalagem.Close;
end;

end.

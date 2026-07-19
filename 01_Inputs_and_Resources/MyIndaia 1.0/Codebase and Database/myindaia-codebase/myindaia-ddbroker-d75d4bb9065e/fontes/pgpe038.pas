unit PGPE038;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppClass, ppProd, ppReport, ppEndUsr, ppDB, ppComm, ppRelatv,
  ppCache, ppDBPipe, ppDBBDE, Db, DBTables, ppModule, daDatMod, ppStrtch,
  ppMemo, ppCtrls, ppPrnabl, ppVar, ppRegion, ppSubRpt, TXtraDev,
  ppParameter, daDataModule, raCodMod;

type
  Tdatm_exp_impr_instr_emb = class(TDataModule)
    ppDesigner: TppDesigner;
    ppRepInstEmb: TppReport;
    Tunid: TQuery;
    Dts_Unid: TDataSource;
    Texp: TQuery;
    Dts_Exp: TDataSource;
    TImp: TQuery;
    Dts_Imp: TDataSource;
    Tconsig: TQuery;
    Dts_consig: TDataSource;
    ppBDE_Exp: TppBDEPipeline;
    ppBDE_Imp: TppBDEPipeline;
    ppBDE_Consig: TppBDEPipeline;
    TViaTr: TQuery;
    Dts_ViaTr: TDataSource;
    ppBDE_ViaTr: TppBDEPipeline;
    TLocal1: TQuery;
    Dts_Local1: TDataSource;
    ppBDE_Local1: TppBDEPipeline;
    TLocal2: TQuery;
    Dts_Local2: TDataSource;
    ppBDE_Local2: TppBDEPipeline;
    Tpais1: TQuery;
    Dts_Pais1: TDataSource;
    ppBDE_Pais1: TppBDEPipeline;
    TAgente: TQuery;
    Dts_Agente: TDataSource;
    ppBDE_Agente: TppBDEPipeline;
    TProc: TQuery;
    Dts_Proc: TDataSource;
    TProcI: TQuery;
    Dts_ProcI: TDataSource;
    TNotf1: TQuery;
    Dts_Notf1: TDataSource;
    ppBDE_Proc: TppBDEPipeline;
    ppBDE_ProcI: TppBDEPipeline;
    ppBDE_Notf1: TppBDEPipeline;
    TNotf2: TQuery;
    Dts_Notf2: TDataSource;
    ppBDE_Notf2: TppBDEPipeline;
    TProcesso: TQuery;
    Dts_Processo: TDataSource;
    ppBDE_Processo: TppBDEPipeline;
    TRE: TQuery;
    Dts_RE: TDataSource;
    ppBDE_Unid: TppBDEPipeline;
    TDesp: TQuery;
    Dts_Desp: TDataSource;
    ppBDE_Desp: TppBDEPipeline;
    TReferencia: TQuery;
    Dts_Ref: TDataSource;
    ppBDE_Ref: TppBDEPipeline;
    TNF: TQuery;
    Dts_NF: TDataSource;
    TProcCalcRE: TStringField;
    TProcCalcNF: TStringField;
    TProcCalcTipo_Frete: TStringField;
    TProcCalcTotal: TStringField;
    TProcCalcCorpo_Conhec: TStringField;
    TProcCalcPais_Origem: TStringField;
    Tpais3: TQuery;
    TPais2: TQuery;
    Dts_Pais3: TDataSource;
    Dts_Pais2: TDataSource;
    ppBDE_Pais2: TppBDEPipeline;
    ppBDE_Pais3: TppBDEPipeline;
    TLocal3: TQuery;
    Dts_Local3: TDataSource;
    ppBDE_Local3: TppBDEPipeline;
    qry_proc_exp_: TQuery;
    TEmb: TQuery;
    Dts_Emb: TDataSource;
    ppBDE_Emb: TppBDEPipeline;
    ppBDE_RE: TppBDEPipeline;
    TProcessoNR_PROCESSO: TStringField;
    TProcessoCD_UNID_NEG: TStringField;
    TProcessoCD_PRODUTO: TStringField;
    TProcessoCD_PAIS_ORIGEM: TStringField;
    TProcessoTX_MERCADORIA: TMemoField;
    TProcessoNR_DDE: TStringField;
    TProcessoCD_EMBARCACAO: TStringField;
    TProcessoNM_ANALISTA_COMISSARIA: TStringField;
    TCartaCred: TQuery;
    TCartaCredNR_PROCESSO: TStringField;
    TCartaCredTX_IMPORTADOR: TMemoField;
    TCartaCredTX_EXPORTADOR: TMemoField;
    TCartaCredTX_CONSIGNATARIO: TMemoField;
    TCartaCredTX_NOTIFY1: TMemoField;
    TCartaCredTX_NOTIFY2: TMemoField;
    TCartaCredTX_DOCTO: TMemoField;
    TCartaCredTX_COPIA: TMemoField;
    TCartaCredTX_SAQUE: TMemoField;
    TCartaCredNM_UNID_MED_PL: TStringField;
    TCartaCredNM_UNID_MED_PB: TStringField;
    TCartaCredNM_LOCAL_DESTINO: TStringField;
    TCartaCredNM_LOCAL_ORIGEM: TStringField;
    TCartaCredNM_PAIS_DESTINO: TStringField;
    TCartaCredNM_PAIS_ORIGEM: TStringField;
    TCartaCredTX_TERMO_PAGTO: TMemoField;
    Dts_CartaCred: TDataSource;
    ppBDE_CartaCred: TppBDEPipeline;
    TProcCD_EXPORTADOR: TStringField;
    TProcCD_IMPORTADOR: TStringField;
    TProcTP_CONSIGNATARIO: TStringField;
    TProcCD_CONSIGNATARIO: TStringField;
    TProcCD_AGENTE: TStringField;
    TProcCD_VIA_TRANSPORTE: TStringField;
    TProcTP_NOTIFY1: TStringField;
    TProcCD_NOTIFY1: TStringField;
    TProcCD_TIPO_FRETE: TStringField;
    TProcTP_NOTIFY2: TStringField;
    TProcCD_NOTIFY2: TStringField;
    TProcCD_LOCAL_ORIGEM: TStringField;
    TProcCD_LOCAL_DESTINO: TStringField;
    TProcCD_CARTA_CREDITO: TStringField;
    TProcVL_FRETE: TFloatField;
    TProcVL_TOT_FOB: TFloatField;
    TProcVL_PESO_BRUTO: TFloatField;
    TProcVL_PESO_LIQUIDO: TFloatField;
    TProcVL_TOT_CONTAINER: TFloatField;
    TProcVL_TOT_PALLETS: TFloatField;
    TProcVL_TOT_QTDE_EMBALAGEM: TFloatField;
    TProcTX_MARCACAO_VOLUME: TMemoField;
    TProcCD_LINGUA_PEDIDO: TStringField;
    TProcVL_TOT_CUBAGEM: TFloatField;
    TProcTX_DECL_ADICIONAL: TMemoField;
    TProcTX_DECL_ADIC_INST_EMB: TMemoField;
    TProcVL_TOT_CUBAGEM_1: TFloatField;
    TProcCD_PAIS_ORIGEM: TStringField;
    TProcNM_PAIS_PORT: TStringField;
    TProcNM_PAIS_ING: TStringField;
    TProcNM_PAIS_ESP: TStringField;
    TProcCD_INCOTERM: TStringField;
    TProcCD_PAIS_ORIG: TStringField;
    TProcNR_FATURA: TStringField;
    TProcCD_PAIS_DESTINO: TStringField;
    TProcDATA_FATURA: TStringField;
    TProcIN_REFERENCIA_FAT_INST: TStringField;
    TProcCD_NCM: TStringField;
    TProcNR_PROCESSO: TStringField;
    TProcCalcNrProcesso: TStringField;
    TProcCD_UNID_NEG: TStringField;
    TProcTX_INF_EMBALAGEM: TMemoField;
    TProccalcNCM: TStringField;
    ppParameterList1: TppParameterList;
    TProcVL_TOT_MCV: TFloatField;
    TProcSIGLA_MOEDA: TStringField;
    TProcVL_SEGURO: TFloatField;
    TProcVL_TOT_EXW: TFloatField;
    TProcVL_ACRESCIMO: TFloatField;
    TProcVL_DESCONTO: TFloatField;
    TImpCODIGO: TStringField;
    TImpNOME: TStringField;
    TImpENDERECO_NUM: TStringField;
    TImpCIDADE_PAIS: TStringField;
    TImpNR_CLIENTE: TStringField;
    TImpCD_PAIS: TStringField;
    TImpNR_TELEFONE: TStringField;
    TImpNR_FAX: TStringField;
    TImpNR_RUC: TStringField;
    TImpNR_NIT: TStringField;
    TconsigCODIGO: TStringField;
    TconsigNOME: TStringField;
    TconsigENDERECO_NUM: TStringField;
    TconsigCIDADE_PAIS: TStringField;
    TconsigNR_TELEFONE: TStringField;
    TconsigNR_FAX: TStringField;
    TconsigNR_RUC: TStringField;
    TconsigNR_NIT: TStringField;
    TNotf1CODIGO: TStringField;
    TNotf1NOME: TStringField;
    TNotf1ENDERECO_NUM: TStringField;
    TNotf1CIDADE_PAIS: TStringField;
    TNotf1NR_TELEFONE: TStringField;
    TNotf1NR_FAX: TStringField;
    TNotf1NR_RUC: TStringField;
    TNotf1NR_NIT: TStringField;
    TNotf2CODIGO: TStringField;
    TNotf2NOME: TStringField;
    TNotf2ENDERECO_NUM: TStringField;
    TNotf2CIDADE_PAIS: TStringField;
    qryItensPO: TQuery;
    dsItensPO: TDataSource;
    ppBDE_ItensPO: TppBDEPipeline;
    qryItensPONR_PROCESSO: TStringField;
    qryItensPOTX_INF_EMBALAGEM: TMemoField;
    qryItensPOTX_MARCACAO_VOLUME: TMemoField;
    qryItensPOTX_MERCADORIA: TMemoField;
    TImpNR_CUIT: TStringField;
    TNotf1NR_CUIT: TStringField;
    TconsigNR_CUIT: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppDBText65: TppDBText;
    ppShape9: TppShape;
    ppDBText62: TppDBText;
    ppDBText71: TppDBText;
    ppShape16: TppShape;
    ppDBText60: TppDBText;
    ppDBText70: TppDBText;
    ppDBText72: TppDBText;
    ppRegion1: TppRegion;
    ppAgente: TppLabel;
    ppDBText16: TppDBText;
    ppLabel4: TppLabel;
    ppDBMemo4: TppDBMemo;
    ppSubReport2: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppDBText68: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppLine3: TppLine;
    ppRegion2: TppRegion;
    ppLabel19: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppDBText66: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppDBMemo2: TppDBMemo;
    ppDBMDeclAdicInstEmb: TppDBMemo;
    ppDBMDeclAdic: TppDBMemo;
    ppLine6: TppLine;
    ppDBText22: TppDBText;
    ppDBText13: TppDBText;
    ppDBText32: TppDBText;
    ppDBMRefCli: TppDBMemo;
    ppShape1: TppShape;
    ppShape15: TppShape;
    ppShape14: TppShape;
    ppShape19: TppShape;
    ppShape17: TppShape;
    ppShape4: TppShape;
    ppDBMemo1: TppDBMemo;
    ppPesoLiq: TppLabel;
    ppDBText33: TppDBText;
    ppPesoBruto: TppLabel;
    ppDBText34: TppDBText;
    ppViaTransp: TppLabel;
    ppDBText36: TppDBText;
    ppMarcas: TppLabel;
    ppLocalOrigem: TppLabel;
    ppDBText42: TppDBText;
    ppLocalDestino: TppLabel;
    ppDBText43: TppDBText;
    ppDBText59: TppDBText;
    ppDBText63: TppDBText;
    ppDBText67: TppDBText;
    ppNotificado2: TppLabel;
    ppLabel21: TppLabel;
    ppDBText38: TppDBText;
    ppFrete: TppDBText;
    ppLabel5: TppLabel;
    ppReferencia: TppLabel;
    ppImportador: TppLabel;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppConsignatario: TppLabel;
    ppDBText61: TppDBText;
    ppNotificado1: TppLabel;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText49: TppDBText;
    ppShpShip: TppShape;
    pp: TppLabel;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppDBText17: TppDBText;
    ppLabel6: TppLabel;
    ppDBText20: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText6: TppDBText;
    ppInstrucao: TppLabel;
    ppDespachante: TppLabel;
    ppPaisOrigem: TppLabel;
    ppDBText19: TppDBText;
    ppDBText10: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBText7: TppDBText;
    ppLabel3: TppLabel;
    ppDBText18: TppDBText;
    ppDBText30: TppDBText;
    ppDBText15: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText29: TppDBText;
    ppDBText9: TppDBText;
    ppCubagem: TppLabel;
    ppLine2: TppLine;
    ppDBText5: TppDBText;
    ppDBText12: TppDBText;
    ppNumPagina: TppSystemVariable;
    ppDBText21: TppDBText;
    ppPagina: TppSystemVariable;
    ppRegPag1: TppRegion;
    ppLabel2: TppLabel;
    ppDBText31: TppDBText;
    SubRE: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppDBText3: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppDBText4: TppDBText;
    ppDBText35: TppDBText;
    ppimg_logo_instemb: TppImage;
    ppLabel7: TppLabel;
    ppDBText28: TppDBText;
    ppDBText37: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppLabel1: TppLabel;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText27: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText64: TppDBText;
    ppDBText69: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppDBText14: TppDBText;
    ppLine8: TppLine;
    ppLine1: TppLine;
    ppPageStyle2: TppPageStyle;
    ppDBText75: TppDBText;
    TNotf1CONTATO_NOTIFY: TStringField;
    procedure TProcCalcFields(DataSet: TDataSet);
    procedure ppSummaryBand1BeforePrint(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_exp_impr_instr_emb: Tdatm_exp_impr_instr_emb;

implementation

{$R *.DFM}

uses pgpe037;

procedure Tdatm_exp_impr_instr_emb.TProcCalcFields(DataSet: TDataSet);
var
  cRE : String;
  cNF : String;

begin
  with frm_exp_impr_instr_emb do
  begin
    TRE.Close;
    TRE.ParamByName( 'NR_PROCESSO' ).AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.text;
    TRE.Prepare;
    TRE.Open;

    cRE := '';
    while Not ( TRE.EOF ) do
    begin
      cRE := cRE + Copy( TRE.FieldByName('NR_RE').AsString, 1,2 ) + '/' +
                   Copy( TRE.FieldByName('NR_RE').AsString, 3,7 ) + '-' +
                   Copy( TRE.FieldByName('NR_RE').AsString, 10,3 )+ ', ';
      TRE.Next;

      if TRE.Eof then
      begin
        cRE := Trim( cRE );
        cRE := Copy( cRE, 1, Length( cRE ) - 1 );
      end;
    end;

    TPRocCalcRE.AsString := cRE;

    TNF.Close;
    TNF.ParamByName( 'NR_PROCESSO' ).AsString := msk_cd_unid_neg.Text + '02' + msk_nr_processo.Text;
    TNF.Prepare;
    TNF.Open;

    cNF := '';
    while Not ( TNF.EOF ) do
    begin
      cNF := cNF + TNF.FieldByName('NR_NF').AsString + ', ';
      TNF.Next;

      if TNF.Eof then
      begin
        cNF := Trim( cNF );
        cNF := Copy( cNF, 1, Length( cNF ) - 1 );
      end;
    end;

    TPRocCalcNF.AsString := cNF;

    if Tproc.FieldByName('NR_PROCESSO').AsString = frm_exp_impr_instr_emb.msk_cd_unid_neg.Text + '02' + frm_exp_impr_instr_emb.msk_nr_processo.text then
    begin
      //traz todos os NCMs diferentes do processo
      TProc.FieldByName('calcNCM').AsString := '';
      with TQuery.Create(application) do begin
        DataBaseName := 'DBBroker';
        Close;
        SQL.Clear;
        SQL.Add('SELECT DISTINCT SUBSTRING( CD_NCM, 1, 4 ) + "." + SUBSTRING( CD_NCM, 5, 2 ) + "." + SUBSTRING( CD_NCM, 7, 2 ) AS CD_NCM');
        SQL.Add('  FROM TPROCESSO_EXP_ITEM (NOLOCK) WHERE NR_PROCESSO = "' + Tproc.FieldByName('NR_PROCESSO').AsString + '" ');
        Open;
        if not isEmpty then begin
          TProc.FieldByName('calcNCM').AsString := 'NCM: ';
          while not Eof do begin
            TProc.FieldByName('calcNCM').AsString := TProc.FieldByName('calcNCM').AsString + Fields[0].AsString + ' / ';
            Next;
          end;
        end;
        TProc.FieldByName('calcNCM').AsString := Copy(TProc.FieldByName('calcNCM').AsString, 1, Length(TProc.FieldByName('calcNCM').AsString) - 2);
        Free;
      end;




      if ( TprocCalcTotal.AsString = '' ) then
      begin
        if ( Tproc.FieldByName('CD_VIA_TRANSPORTE').AsString = '04' ) or
           ( Tproc.FieldByName('CD_VIA_TRANSPORTE').AsString = '07' ) then
           TprocCalcTotal.AsString := 'TOTAL FCA'
        else
           TprocCalcTotal.AsString  := 'TOTAL FOB';

        if Trim( TProcCD_INCOTERM.AsString ) = 'EXW' then
          TprocCalcTotal.AsString  := 'TOTAL EXW';
      end;

      if ( TprocCalcCorpo_Conhec.AsString = '' ) and
         ( TprocCalcPais_Origem.AsString = '' ) and
         ( TprocCalcTipo_Frete.AsString = '' ) then
      begin
        if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '1' then       // Ingles
        begin
          TprocCalcCorpo_Conhec.AsString  := 'CONSTAR NO CORPO DO CONHECIMENTO : CLEAN ON BOARD';
          TprocCalcPais_Origem.AsString   := Tproc.FieldByName('NM_PAIS_ING').AsString;

          if Tproc.FieldByName('CD_TIPO_FRETE').AsString = '1' then
             TprocCalcTipo_Frete.AsString  := 'FREIGHT PREPAID'
          else
             TprocCalcTipo_Frete.AsString  := 'FREIGHT COLLECT';
        end
        else if Tproc.FieldByName('CD_LINGUA_PEDIDO').AsString = '2' then  // Espanhol
        begin
          TprocCalcCorpo_Conhec.AsString := 'CONSTAR NO CORPO DO CONHECIMENTO : LIMPIO A BORDO';
          TprocCalcPais_Origem.AsString  := Tproc.FieldByName('NM_PAIS_ESP').AsString;

          if Tproc.FieldByName('CD_TIPO_FRETE').AsString = '1' then
             TprocCalcTipo_Frete.AsString := 'FLETE PAGADO'
          else
             TprocCalcTipo_Frete.AsString := 'FLETE PAGADERO EN DESTINO';
        end
        else
        begin
          TprocCalcCorpo_Conhec.AsString := 'CONSTAR NO CORPO DO CONHECIMENTO : ';
          TprocCalcPais_Origem.AsString  := Tproc.FieldByName('NM_PAIS_PORT').AsString;

          if Tproc.FieldByName('CD_TIPO_FRETE').AsString = '1' then        // Portugues
             TprocCalcTipo_Frete.AsString := 'FRETE PREPAID'
          else
             TprocCalcTipo_Frete.AsString := 'FRETE COLLECT';
        end;
      end;
//      TprocCalcNrProcesso.AsString  := Copy( Tproc.FieldByName('NR_PROCESSO').AsString,5,14 );
    end;
  end;
end;

procedure Tdatm_exp_impr_instr_emb.ppSummaryBand1BeforePrint(Sender: TObject);
begin
  qry_proc_exp_.Close;
  qry_proc_exp_.ParamByName('NR_PROCESSO').AsString := frm_exp_impr_instr_emb.msk_cd_unid_neg.Text + '02' +
                                                       frm_exp_impr_instr_emb.msk_nr_processo.Text;
  qry_proc_exp_.Prepare;
  qry_proc_exp_.Open;
  ppDBMDeclAdic.Visible := ( qry_proc_exp_.FieldByName('IN_DECL_AD_INSTR_EMB').AsString = '1' );
  qry_proc_exp_.Close;
end;

procedure Tdatm_exp_impr_instr_emb.ppHeaderBand1BeforePrint(Sender: TObject);
begin
  qry_proc_exp_.Close;
  qry_proc_exp_.ParamByName('NR_PROCESSO').AsString := frm_exp_impr_instr_emb.msk_cd_unid_neg.Text + '02' +
                                                       frm_exp_impr_instr_emb.msk_nr_processo.Text;
  qry_proc_exp_.Prepare;
  qry_proc_exp_.Open;
  ppDBMDeclAdic.Visible := ( qry_proc_exp_.FieldByName('IN_DECL_AD_INSTR_EMB').AsString = '1' );
  qry_proc_exp_.Close;

  if ReportFileName = '\InstEmbI.rtm' then
  begin
    if ppPagina.Text = '1' then
    begin
      ppRegPag1.Visible := True;
    end
    else
    begin
      ppRegPag1.Visible := False;
    end;
  end;
end;




end.

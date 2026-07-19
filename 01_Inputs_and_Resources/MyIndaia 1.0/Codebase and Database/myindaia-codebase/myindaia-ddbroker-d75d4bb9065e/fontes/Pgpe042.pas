unit PGPE042;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppClass, ppProd, ppReport, ppEndUsr, ppDB, ppComm, ppRelatv,
  ppCache, ppDBPipe, ppDBBDE, Db, DBTables, ppModule, daDatMod, ppStrtch,
  ppMemo, ppCtrls, ppPrnabl, ppVar, TXtraDev;

type
  Tdatm_exp_impr_saque = class(TDataModule)
    ppDesigner: TppDesigner;
    ppReport: TppReport;
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
    TPara: TQuery;
    Dts_Para: TDataSource;
    ppBDE_Para: TppBDEPipeline;
    TProc: TQuery;
    Dts_Proc: TDataSource;
    TProcS: TQuery;
    Dts_ProcS: TDataSource;
    TNotf1: TQuery;
    Dts_Notf1: TDataSource;
    ppBDE_Proc: TppBDEPipeline;
    ppBDE_ProcS: TppBDEPipeline;
    ppBDE_Notf1: TppBDEPipeline;
    Tnotf2: TQuery;
    Dts_Notf2: TDataSource;
    ppBDE_Notf2: TppBDEPipeline;
    Tprocesso: TQuery;
    Dts_Processo: TDataSource;
    ppBDE_Processo: TppBDEPipeline;
    Tunidcd_unid_neg: TStringField;
    Tunidnm_unid_neg: TStringField;
    ppBDE_Unid: TppBDEPipeline;
    TCondP: TQuery;
    Dts_Condp: TDataSource;
    ppBDE_CondP: TppBDEPipeline;
    TMoeda: TQuery;
    Dts_Moeda: TDataSource;
    ppBDE_Moeda: TppBDEPipeline;
    TVerif_Saque: TQuery;
    TProcSCalcTotalExtenso: TStringField;
    TProcSVL_TOT_SAQUE: TFloatField;
    TProcSCD_TERMO_PAGTO: TStringField;
    TProcSTX_VALUE: TMemoField;
    TProcSTP_EMPRESA_PAGTO: TStringField;
    TProcSNM_MOEDA_SING: TStringField;
    TProcSNM_MOEDA_PLURAL: TStringField;
    TProcSNM_CENTAVOS_SING: TStringField;
    TProcSNM_CENTAVOS_PLURAL: TStringField;
    TProcSDT_INICIAL: TStringField;
    TBanco: TQuery;
    Dts_Banco: TDataSource;
    ppBDE_Banco: TppBDEPipeline;
    TProcSDT_VCTO_SAQUE: TStringField;
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
    TProcSNR_PROCESSO: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppShape6: TppShape;
    ppLabel12: TppLabel;
    ppDBText3: TppDBText;
    ppLabel13: TppLabel;
    ppDBText4: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    pplblTop: TppLabel;
    pplblBillTop: TppLabel;
    ppDBText8: TppDBText;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppNome: TppDBText;
    ppEndereco: TppDBText;
    ppCidPais: TppDBText;
    ppDBText13: TppDBText;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine2: TppLine;
    ppDBText5: TppDBText;
    ppLine9: TppLine;
    ppLine21: TppLine;
    ppImage2: TppImage;
    ppDBText23: TppDBText;
    ppdbtxt_dt_inicial: TppDBText;
    ppDBText25: TppDBText;
    pplblNumTop: TppLabel;
    ppLine20: TppLine;
    ppLine23: TppLine;
    ppdbm_termo_pagto: TppDBMemo;
    pplblExt1Top: TppLabel;
    pplblExt2Top: TppLabel;
    pplblValue1Top: TppLabel;
    pplblValue2Top: TppLabel;
    ppSaque: TppDBMemo;
    ppDetailBand1: TppDetailBand;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel7: TppLabel;
    ppDBText11: TppDBText;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    pplblBottom: TppLabel;
    pplblBillBottom: TppLabel;
    ppDBText12: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppNome2: TppDBText;
    ppEndereco2: TppDBText;
    ppCidPais2: TppDBText;
    ppDBText19: TppDBText;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppDBText20: TppDBText;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppImage1: TppImage;
    ppDBText21: TppDBText;
    ppdbtxt_dt_inicial2: TppDBText;
    ppDBText26: TppDBText;
    pplblNumBottom: TppLabel;
    ppLine22: TppLine;
    ppdbm_termo_pagto2: TppDBMemo;
    pplblExt1Bottom: TppLabel;
    pplblExt2Bottom: TppLabel;
    pplblValue1Bottom: TppLabel;
    ppLine15: TppLine;
    pplblValue2Bottom: TppLabel;
    ppLine24: TppLine;
    ppSaque2: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    procedure TProcSCalcFields(DataSet: TDataSet);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_exp_impr_saque: Tdatm_exp_impr_saque;

implementation

uses Extenso, PGPE041, ByNumExtenso;

{$R *.DFM}

procedure Tdatm_exp_impr_saque.TProcSCalcFields(DataSet: TDataSet);
begin
  with datm_exp_impr_saque do
  begin
    TProcSCalcTotalExtenso.AsString := ' **** ' + StringReplace(UpperCase(
         IMoneyInWords( TProcS.FieldByName('VL_TOT_SAQUE').AsFloat,
                        TProcS.FieldByName('NM_MOEDA_SING').AsString,
                        TProcS.FieldByName('NM_MOEDA_PLURAL').AsString,
                        TProcS.FieldByName('NM_CENTAVOS_SING').AsString,
                        TProcS.FieldByName('NM_CENTAVOS_PLURAL').AsString )), ' AND ', ' ', [rfReplaceAll]) + ' **** ';       //   SUBSTITUINDO AND POR '' ESPAÇO.
  end;
end;

procedure Tdatm_exp_impr_saque.ppHeaderBand1BeforePrint(Sender: TObject);
var Ext1, Ext2, Value1, Value2 : String;
i : Byte;
begin
  //Extenso
  Ext1 := TProcSCalcTotalExtenso.AsString;

  if Trim( Ext1[71] ) = '' then
  begin
    Ext1 := Copy( TProcSCalcTotalExtenso.AsString, 1, 70 );
    Ext2 := Copy( TProcSCalcTotalExtenso.AsString, 71, ( Length( Trim( TProcSCalcTotalExtenso.AsString ) ) - 1 ) );
  end
  else
  begin
    i := 70;
    while i > 0 do
    begin
      if Trim( Ext1[i] ) = '' then
      begin
        Ext1 := Copy( TProcSCalcTotalExtenso.AsString, 1, i - 1 );
        Ext2 := Copy( TProcSCalcTotalExtenso.AsString, i + 1, ( Length( Trim( TProcSCalcTotalExtenso.AsString ) ) - 1 ) );
        break;
      end;
      i := i + 1;
    end;
  end;

  pplblExt1Top.Caption    := Ext1;
  pplblExt1Bottom.Caption := Ext1;
  pplblExt2Top.Caption    := Ext2;
  pplblExt2Bottom.Caption := Ext2;

  //Value
  Value1 := TProcSTX_VALUE.AsString;
  if Trim( Value1[71] ) = '' then
  begin
    Value1 := Copy( TProcSTX_VALUE.AsString, 1, 70 );
    Value2 := Copy( TProcSTX_VALUE.AsString, 71, ( Length( Trim( TProcSTX_VALUE.AsString ) ) - 1 ) );
  end
  else
  begin
    i := 70;
    while i > 0 do
    begin
      if Trim( Value1[i] ) = '' then
      begin
        Value1 := Copy( TProcSTX_VALUE.AsString, 1, i - 1 );
        Value2 := Copy( TProcSTX_VALUE.AsString, i + 1, ( Length( Trim( TProcSTX_VALUE.AsString ) ) - 1 ) );
        break;
      end;
      i := i + 1;
    end;
  end;

  pplblValue1Top.Caption    := Value1;
  pplblValue1Bottom.Caption := Value1;
  pplblValue2Top.Caption    := Value2;
  pplblValue2Bottom.Caption := Value2;

  if frm_exp_impr_saque.Modelo.ItemIndex = 0 then
  begin
    pplblTop.Caption        := '(Second and third';
    pplblBottom.Caption     := '(First and third';
    pplblBillTop.Caption    := 'sight pay this First Bill of Exchange';
    pplblBillBottom.Caption := 'sight pay this Second Bill of Exchange';
    pplblNumTop.Caption     := '1';
    pplblNumBottom.Caption  := '2';
  end
  else
  begin
    pplblTop.Caption        := '(First and second';
    pplblBottom.Caption     := '(Second and third';
    pplblBillTop.Caption    := 'sight pay this Third Bill of Exchange';
    pplblBillBottom.Caption := 'sight pay this First Bill of Exchange';
    pplblNumTop.Caption     := '3';
    pplblNumBottom.Caption  := 'Copy';
  end;
  pplblTop.Caption          := pplblTop.Caption + ' unpaid) to the order of';
  pplblBottom.Caption       := pplblBottom.Caption + ' unpaid) to the order of';
  if ( TProcSDT_INICIAL.IsNull ) or ( Trim( TProcSDT_INICIAL.AsString ) = '0th,' ) then
  begin
    ppdbtxt_dt_inicial.Visible  := False;
    ppdbtxt_dt_inicial2.Visible := False;
  end
  else
  begin
    ppdbtxt_dt_inicial.Visible  := True;
    ppdbtxt_dt_inicial2.Visible := True;
  end;

  //To
  TCartaCred.Close;
  TCartaCred.ParamByName('NR_PROCESSO').AsString := TProcesso.FieldByName('NR_PROCESSO').AsString;
  TCartaCred.Prepare;
  TCartaCred.Open;
  if Not TCartaCred.EOF then
  begin
    ppSaque.Visible     := True;
    ppSaque2.Visible    := True;
    ppSaque.Left        := ppNome.Left;
    ppSaque2.Left       := ppNome2.Left;
    ppSaque.Width       := ppEndereco.Width;
    ppSaque2.Width      := ppEndereco2.Width;

    ppNome.Visible      := False;
    ppNome2.Visible     := False;
    ppEndereco.Visible  := False;
    ppEndereco2.Visible := False;
    ppCidPais.Visible   := False;
    ppCidPais2.Visible  := False;

  end
  else
  begin
    ppSaque.Visible     := False;
    ppSaque2.Visible    := False;

    ppNome.Visible      := True;
    ppNome2.Visible     := True;
    ppEndereco.Visible  := True;
    ppEndereco2.Visible := True;
    ppCidPais.Visible   := True;
    ppCidPais2.Visible  := True;

  end;

end;

end.

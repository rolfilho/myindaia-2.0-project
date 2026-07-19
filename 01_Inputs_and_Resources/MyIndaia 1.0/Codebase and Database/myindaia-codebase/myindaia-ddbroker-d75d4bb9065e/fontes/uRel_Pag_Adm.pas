unit uRel_Pag_Adm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolEdit, StdCtrls, Mask, Buttons, ExtCtrls, ComObj, DBTables,
  Gauges;

type
  Tfrm_Rel_Pag_Adm = class(TForm)
    Panel1: TPanel;
    lbl_periodo: TLabel;
    lbl_a: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    btn_co_unid: TSpeedButton;
    btn_co_banco: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_banco: TMaskEdit;
    edt_nm_banco: TEdit;
    dteInicio: TDateEdit;
    dteFim: TDateEdit;
    gpbTipoPeriodo: TGroupBox;
    rdbEmissao: TRadioButton;
    rdbVencimento: TRadioButton;
    rdbPagamento: TRadioButton;
    btn_imprimir: TButton;
    btn_sair: TButton;
    pnlAndamento: TPanel;
    ggAndamento: TGauge;
    Label2: TLabel;
    Label4: TLabel;
    procedure btn_co_unidClick(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure GeraExcel;
  public
    { Public declarations }
  end;

var
  frm_Rel_Pag_Adm: Tfrm_Rel_Pag_Adm;

implementation

uses
  ConsOnLineEx, Funcoes, PGGP017;

{$R *.dfm}

const
  xlNone              = -4142;
  xlContinuous        = 1;
  xlThin              = 2;
  xlDiagonalDown      = 5;
  xlDiagonalUp        = 6;
  xlEdgeLeft          = 7;
  xlEdgeTop           = 8;
  xlEdgeBottom        = 9;
  xlEdgeRight         = 10;
  xlInsideVertical    = 11;
  xlInsideHorizontal  = 12;

  xlAutomatic         = -4105;
  xlSolid             = 1;
  xlThemeColorAccent1 = 5;

function Todos(AValor: String): Boolean;
begin
  while (AValor <> '') and (AValor[1] in ['X', 'x', '0', ' ']) do
    Delete(AValor, 1, 1);
  Result := AValor = '';
end;

{ Tfrm_Rel_Pag_Adm }

procedure Tfrm_Rel_Pag_Adm.btn_co_unidClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG', 'Unidade', ['CD_UNID_NEG', 'NM_UNID_NEG'], ['Código', 'Nome'], 'CD_UNID_NEG', nil)
  else if Todos(msk_cd_unid_neg.Text) then
    edt_nm_unid_neg.Text := 'Todas'
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text, 'NM_UNID_NEG');
end;

procedure Tfrm_Rel_Pag_Adm.btn_co_bancoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_banco.Text := ConsultaOnLineEx('TBANCO', 'Banco', ['CD_BANCO', 'AP_BANCO'], ['Código', 'Descrição'], 'CD_BANCO', nil)
  else if Todos(msk_cd_banco.Text) then
    edt_nm_banco.Text := 'Todos'
  else
    edt_nm_banco.Text := ConsultaLookUP('TBANCO', 'CD_BANCO', msk_cd_banco.Text, 'NM_BANCO');
end;

procedure Tfrm_Rel_Pag_Adm.FormCreate(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_neg.OnChange(msk_cd_unid_neg);
  dteInicio.Date := Date -30;
  dteFim.Date := Date;
  pnlAndamento.SendToBack;
end;

procedure Tfrm_Rel_Pag_Adm.btn_imprimirClick(Sender: TObject);
var
  DataInicial, DataFinal: String;
begin
  if edt_nm_unid_neg.Text = '' then
  begin
    msk_cd_unid_neg.SetFocus;
    MessageDlg('Unidade de Negócio inválida.', mtInformation, [mbOk], 0);
  end
  else if edt_nm_banco.Text = '' then
  begin
    msk_cd_banco.SetFocus;
    MessageDlg('Banco inválido.', mtInformation, [mbOk], 0);
  end
  else if dteInicio.Text = '' then
  begin
    dteInicio.SetFocus;
    MessageDlg('Data Inicial inválida.', mtInformation, [mbOk], 0);
  end
  else if dteFim.Text = '' then
  begin
    dteFim.SetFocus;
    MessageDlg('Data Final inválida.', mtInformation, [mbOk], 0);
  end
  else
  begin
    if (dteInicio.Date > dteFim.Date) then
    begin
      DataInicial := dteInicio.Text;
      DataFinal := dteFim.Text;
      dteInicio.Text := DataFinal;
      dteFim.Text := DataInicial;
    end;

    GeraExcel;
  end;
end;

procedure Tfrm_Rel_Pag_Adm.GeraExcel;
var
  ExcelApp, WorkBook, Sheet: OleVariant;
  Linha: Integer;
  DT_PAGAMENTO, NM_FAVORECIDO, NM_FORNECEDOR, CD_CT_CONTABIL, NM_CT_CONTABIL,
  NR_NOTA, DT_EMISSAO_DOC, DT_VENCIMENTO, VL_IR, VL_INSS, VL_PISCOFINS, VL_ISS, VL_LIQUIDO: String;
  Data: TDateTime;

  procedure PintarBordas(ARange: OleVariant; AThemeColor: Integer; ATintAndShade: Double);
  begin
    ARange.Borders[xlDiagonalDown].LineStyle := xlNone;
    ARange.Borders[xlDiagonalUp].LineStyle := xlNone;
    ARange.Borders[xlEdgeLeft].LineStyle := xlContinuous;
    ARange.Borders[xlEdgeLeft].ThemeColor := AThemeColor;
    ARange.Borders[xlEdgeLeft].TintAndShade := ATintAndShade;
    ARange.Borders[xlEdgeLeft].Weight := xlThin;
    ARange.Borders[xlEdgeTop].LineStyle := xlContinuous;
    ARange.Borders[xlEdgeTop].ThemeColor := AThemeColor;
    ARange.Borders[xlEdgeTop].TintAndShade := ATintAndShade;
    ARange.Borders[xlEdgeTop].Weight := xlThin;
    ARange.Borders[xlEdgeBottom].LineStyle := xlContinuous;
    ARange.Borders[xlEdgeBottom].ThemeColor := AThemeColor;
    ARange.Borders[xlEdgeBottom].TintAndShade := ATintAndShade;
    ARange.Borders[xlEdgeBottom].Weight := xlThin;
    ARange.Borders[xlEdgeRight].LineStyle := xlContinuous;
    ARange.Borders[xlEdgeRight].ThemeColor := AThemeColor;
    ARange.Borders[xlEdgeRight].TintAndShade := ATintAndShade;
    ARange.Borders[xlEdgeRight].Weight := xlThin;
    ARange.Borders[xlInsideVertical].LineStyle := xlContinuous;
    ARange.Borders[xlInsideVertical].ThemeColor := AThemeColor;
    ARange.Borders[xlInsideVertical].TintAndShade := ATintAndShade;
    ARange.Borders[xlInsideVertical].Weight := xlThin;
    ARange.Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    ARange.Borders[xlInsideHorizontal].ThemeColor := AThemeColor;
    ARange.Borders[xlInsideHorizontal].TintAndShade := ATintAndShade;
    ARange.Borders[xlInsideHorizontal].Weight := xlThin;
  end;

  procedure PintarBordasCinza(ARange: OleVariant);
  begin
    PintarBordas(ARange, 1, -0.249977111117893);
  end;
begin
  try
    ggAndamento.MaxValue := 100;
    ggAndamento.Progress := 0;
    pnlAndamento.BringToFront;
    Application.ProcessMessages;
    
    ExcelApp := CreateOLEObject('Excel.Application');
    WorkBook := ExcelApp.Workbooks.Open('H:\DDBroker\XLS\Rel_Pag_Adm.xlsx');
    Workbook.SaveAs('C:\DDBroker\RPA' + FormatDateTime('yyyymmdd', Now) + '_' + str_cd_usuario + '.xlsx');
    Sheet    := WorkBook.Sheets[1];

    Sheet.Range['B1'].Value := msk_cd_unid_neg.Text + ' - ' + edt_nm_unid_neg.Text;
    Sheet.Range['C2'].Value := msk_cd_banco.Text + ' - ' + edt_nm_banco.Text;

    with TQuery.Create(Self) do
      try
        DataBaseName := 'DBBROKER';
        SQL.Add('SELECT CONVERT(VARCHAR, A.DT_PAGAMENTO, 103) AS DT_PAGAMENTO,');
        SQL.Add('       FA.CD_FAVORECIDO,');
        SQL.Add('       FA.NM_FAVORECIDO,');
        SQL.Add('       FO.CD_FAVORECIDO AS CD_FORNECEDOR,');
        SQL.Add('       FO.NM_FAVORECIDO AS NM_FORNECEDOR,');
        SQL.Add('       C.CD_CT_CONTABIL,');
        SQL.Add('       C.NM_CT_CONTABIL,');
        SQL.Add('       A.NR_TITULO AS NR_NOTA,');
        SQL.Add('       CONVERT(VARCHAR, A.DT_EMISSAO_DOC, 103) AS DT_EMISSAO_DOC,');
        SQL.Add('       CONVERT(VARCHAR, A.DT_VENCIMENTO, 103) AS DT_VENCIMENTO,');
        SQL.Add('       ISNULL(A.VL_IR, 0) AS VL_IR,');
        SQL.Add('       ISNULL(A.VL_INSS, 0) AS VL_INSS,');
        SQL.Add('       ISNULL(A.VL_PISCOFINS, 0) AS VL_PISCOFINS,');
        SQL.Add('       ISNULL(A.VL_ISS, 0) AS VL_ISS,');
        SQL.Add('       A.VL_LIQUIDO,');
        SQL.Add('       CL.CD_CT_CONTABIL AS CD_CT_CONTABIL_ITEM,');
        SQL.Add('       CL.CD_RATEIO,');
        SQL.Add('       TR.NM_RATEIO,');
        SQL.Add('       CL.VL_LANCAMENTO,');
        SQL.Add('       CONVERT(VARCHAR(4000), CL.NM_HISTORICO) AS NM_HISTORICO,');
        SQL.Add('       DENSE_RANK() OVER(ORDER BY A.DT_VENCIMENTO, A.NR_CTAAPAGAR, A.VL_LIQUIDO, CL.CD_CT_CONTABIL, CL.CD_RATEIO, TR.NM_RATEIO, CL.VL_LANCAMENTO, CONVERT(VARCHAR(MAX), CL.NM_HISTORICO)) AS NR_ORDEM');
        SQL.Add('FROM TCTAAPAGAR              A  (NOLOCK)');
        SQL.Add('   LEFT JOIN TFAVORECIDO     FO (NOLOCK) ON A.CD_FORNECEDOR = FO.CD_FAVORECIDO');
        SQL.Add('   LEFT JOIN TFAVORECIDO     FA (NOLOCK) ON A.CD_FAVORECIDO = FA.CD_FAVORECIDO');
        SQL.Add('   LEFT JOIN TCT_CONTABIL    C  (NOLOCK) ON C.CD_CT_CONTABIL = FA.CD_CT_CONTABIL AND C.ANO_CONTA = YEAR(A.DT_CTAAPAGAR)');
        SQL.Add('   -- Itens');
        SQL.Add('   LEFT JOIN TCTAAPAGAR_LANC CL (NOLOCK) ON CL.CD_UNID_NEG = A.CD_UNID_NEG AND CL.DT_CTAAPAGAR = A.DT_CTAAPAGAR  AND CL.NR_CTAAPAGAR = A.NR_CTAAPAGAR');
        SQL.Add('   LEFT JOIN TRATEIO         TR (NOLOCK) ON TR.CD_RATEIO = CL.CD_RATEIO');
        if rdbEmissao.Checked then
          SQL.Add('WHERE A.DT_EMISSAO_DOC BETWEEN CONVERT(DATETIME, ' + QuotedStr(dteInicio.Text) + ', 103) AND CONVERT(DATETIME, ' + QuotedStr(dteFim.Text) + ', 103)')
        else if rdbVencimento.Checked then
          SQL.Add('WHERE A.DT_VENCIMENTO BETWEEN CONVERT(DATETIME, ' + QuotedStr(dteInicio.Text) + ', 103) AND CONVERT(DATETIME, ' + QuotedStr(dteFim.Text) + ', 103)')
        else
          SQL.Add('WHERE A.DT_PAGAMENTO BETWEEN CONVERT(DATETIME, ' + QuotedStr(dteInicio.Text) + ', 103) AND CONVERT(DATETIME, ' + QuotedStr(dteFim.Text) + ', 103)');
        if not Todos(msk_cd_unid_neg.Text) then
          SQL.Add('  AND A.CD_UNID_NEG = ' + QuotedStr(msk_cd_unid_neg.Text));
        if not Todos(msk_cd_banco.Text) then
          SQL.Add('  AND A.CD_BANCO    = ' + QuotedStr(msk_cd_banco.Text));
        SQL.Add('ORDER BY NR_ORDEM');
        Open;
        Last;
        ggAndamento.MaxValue := FieldByName('NR_ORDEM').AsInteger;
        First;

        Linha := 4;
        while not Eof do
        begin
          PintarBordasCinza(Sheet.Range['C' + IntToStr(Linha) + ':' + 'O' + IntToStr(Linha)]);

          if SameText(Trim(FieldByName('NM_CT_CONTABIL').AsString), 'ATENÇÃO - AGUARDANDO CONTA DEFINITIVA') then
          begin
            Sheet.Range['C' + IntToStr(Linha) + ':T' + IntToStr(Linha)].Interior.Pattern := xlSolid;
            Sheet.Range['C' + IntToStr(Linha) + ':T' + IntToStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
            Sheet.Range['C' + IntToStr(Linha) + ':T' + IntToStr(Linha)].Interior.ThemeColor := xlThemeColorAccent1;
            Sheet.Range['C' + IntToStr(Linha) + ':T' + IntToStr(Linha)].Interior.TintAndShade := 0.799981688894314;
            Sheet.Range['C' + IntToStr(Linha) + ':T' + IntToStr(Linha)].Interior.PatternTintAndShade := 0;
          end;

          if TryStrToDate(FieldByName('DT_PAGAMENTO').AsString, Data) then
            Sheet.Range['C' + IntToStr(Linha)].Value := Data;
          Sheet.Range['D' + IntToStr(Linha)].Value := FieldByName('NM_FAVORECIDO').AsString;
          Sheet.Range['E' + IntToStr(Linha)].Value := FieldByName('NM_FORNECEDOR').AsString;
          Sheet.Range['F' + IntToStr(Linha)].Value := FieldByName('CD_CT_CONTABIL').AsString;
          Sheet.Range['G' + IntToStr(Linha)].Value := FieldByName('NM_CT_CONTABIL').AsString;
          Sheet.Range['H' + IntToStr(Linha)].Value := FieldByName('NR_NOTA').AsString;
          if TryStrToDate(FieldByName('DT_EMISSAO_DOC').AsString, Data) then
            Sheet.Range['I' + IntToStr(Linha)].Value := Data;
          if TryStrToDate(FieldByName('DT_VENCIMENTO').AsString, Data) then
            Sheet.Range['J' + IntToStr(Linha)].Value := Data;
          Sheet.Range['K' + IntToStr(Linha)].Value := FieldByName('VL_IR').AsFloat;
          Sheet.Range['L' + IntToStr(Linha)].Value := FieldByName('VL_INSS').AsFloat;
          Sheet.Range['M' + IntToStr(Linha)].Value := FieldByName('VL_PISCOFINS').AsFloat;
          Sheet.Range['N' + IntToStr(Linha)].Value := FieldByName('VL_ISS').AsFloat;
          Sheet.Range['O' + IntToStr(Linha)].Value := FieldByName('VL_LIQUIDO').AsFloat;

          DT_PAGAMENTO   := FieldByName('DT_PAGAMENTO').AsString;
          NM_FAVORECIDO  := FieldByName('NM_FAVORECIDO').AsString;
          NM_FORNECEDOR  := FieldByName('NM_FORNECEDOR').AsString;
          CD_CT_CONTABIL := FieldByName('CD_CT_CONTABIL').AsString;
          NM_CT_CONTABIL := FieldByName('NM_CT_CONTABIL').AsString;
          NR_NOTA        := FieldByName('NR_NOTA').AsString;
          DT_EMISSAO_DOC := FieldByName('DT_EMISSAO_DOC').AsString;
          DT_VENCIMENTO  := FieldByName('DT_VENCIMENTO').AsString;
          VL_IR          := FieldByName('VL_IR').AsString;
          VL_INSS        := FieldByName('VL_INSS').AsString;
          VL_PISCOFINS   := FieldByName('VL_PISCOFINS').AsString;
          VL_ISS         := FieldByName('VL_ISS').AsString;
          VL_LIQUIDO     := FieldByName('VL_LIQUIDO').AsString;

          while (not Eof) and SameText(DT_PAGAMENTO, FieldByName('DT_PAGAMENTO').AsString) and
                              SameText(NM_FAVORECIDO, FieldByName('NM_FAVORECIDO').AsString) and
                              SameText(NM_FORNECEDOR, FieldByName('NM_FORNECEDOR').AsString) and
                              SameText(CD_CT_CONTABIL, FieldByName('CD_CT_CONTABIL').AsString) and
                              SameText(NM_CT_CONTABIL, FieldByName('NM_CT_CONTABIL').AsString) and
                              SameText(NR_NOTA, FieldByName('NR_NOTA').AsString) and
                              SameText(DT_EMISSAO_DOC, FieldByName('DT_EMISSAO_DOC').AsString) and
                              SameText(DT_VENCIMENTO, FieldByName('DT_VENCIMENTO').AsString) and
                              SameText(VL_IR, FieldByName('VL_IR').AsString) and
                              SameText(VL_INSS, FieldByName('VL_INSS').AsString) and
                              SameText(VL_PISCOFINS, FieldByName('VL_PISCOFINS').AsString) and
                              SameText(VL_ISS, FieldByName('VL_ISS').AsString) and
                              SameText(VL_LIQUIDO, FieldByName('VL_LIQUIDO').AsString) do
          begin
            PintarBordasCinza(Sheet.Range['P' + IntToStr(Linha) + ':' + 'T' + IntToStr(Linha)]);
            Sheet.Range['P' + IntToStr(Linha)].Value := FieldByName('CD_CT_CONTABIL_ITEM').AsString;
            Sheet.Range['Q' + IntToStr(Linha)].Value := FieldByName('CD_RATEIO').AsString;
            Sheet.Range['R' + IntToStr(Linha)].Value := FieldByName('NM_RATEIO').AsString;
            Sheet.Range['S' + IntToStr(Linha)].Value := FieldByName('VL_LANCAMENTO').AsFloat;
            Sheet.Range['T' + IntToStr(Linha)].Value := StringReplace(FieldByName('NM_HISTORICO').AsString, #13, #10, [rfReplaceAll]);

            Inc(Linha);
            Next;
            ggAndamento.Progress := Linha -3;
            Application.ProcessMessages;
          end;
        end;
      finally
        Free;
      end;

      Workbook.Save;
      ShowMessage('Planilha gerada com sucesso.');
      pnlAndamento.SendToBack;
      ExcelApp.Visible := True;
  except
    on E: Exception do
    begin
      MessageDlg('Erro preenchendo a planilha.'#13 + E.Message, mtError, [mbOk], 0);
      pnlAndamento.SendToBack;
      ExcelApp.Visible := True;
    end;
  end;
end;

procedure Tfrm_Rel_Pag_Adm.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Rel_Pag_Adm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.

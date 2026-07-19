unit uGerarDrawback;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, DBTables, Buttons, ActiveX, ExcelXP, Excel2000,
  StdCtrls;

type
  Tfrm_gera_drawback = class(TForm)
    pnl_tabelas: TPanel;
    dbgrd_result_exp: TDBGrid;
    Panel1: TPanel;
    btn_geradrawback: TSpeedButton;
    btn_sair: TSpeedButton;
    dbgrd_result_imp: TDBGrid;
    qry_result_exp: TQuery;
    qry_result_imp: TQuery;
    ds_result_imp: TDataSource;
    ds_result_exp: TDataSource;
    qry_result_expCD_MERCADORIA: TStringField;
    qry_result_expNR_LAUDO: TStringField;
    qry_result_expNR_RE: TStringField;
    qry_result_expDT_EMBARQUE: TStringField;
    qry_result_expCD_NCM_SH: TStringField;
    qry_result_expPL_MERCADORIA: TFloatField;
    qry_result_expQT_MERCADORIA: TFloatField;
    qry_result_expCD_UN_MEDIDA: TStringField;
    qry_result_expVL_MLE_ITEM: TFloatField;
    qry_result_expCD_MOEDA: TStringField;
    qry_result_expVL_MLE_MNEG: TFloatField;
    qry_result_expPC_COMISSAO: TFloatField;
    qry_result_expVL_COMISSAO: TFloatField;
    qry_result_expVL_MLE_ITEM_MN: TFloatField;
    qry_result_expVL_ENQUADRAMENTO: TFloatField;
    upd_result_exp: TUpdateSQL;
    upd_result_imp: TUpdateSQL;
    edtEmpresaNac: TEdit;
    edtNmEmpresa: TEdit;
    btnConsulta: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_excluir: TSpeedButton;
    qry_result_expPL_MERCADORIA_ORIGINAL: TFloatField;
    qry_result_expQT_MERCADORIA_ORIGINAL: TFloatField;
    qry_result_expVL_MLE_ITEM_ORIGINAL: TFloatField;
    qry_result_impCD_MERCADORIA: TStringField;
    qry_result_impNR_LAUDO: TStringField;
    qry_result_impCD_MAT_PRI: TStringField;
    qry_result_impNR_DI: TStringField;
    qry_result_impNR_ADICAO: TStringField;
    qry_result_impNR_ITEM: TStringField;
    qry_result_impDT_REGISTRO_DI: TStringField;
    qry_result_impDT_DESEMBARACO: TStringField;
    qry_result_impCD_NCM_SH: TStringField;
    qry_result_impDESCRICAO: TStringField;
    qry_result_impPL_MERCADORIA: TFloatField;
    qry_result_impQT_MERCADORIA: TFloatField;
    qry_result_impCD_UN_MEDIDA: TStringField;
    qry_result_impVL_MLE_ITEM: TFloatField;
    qry_result_impCD_MOEDA: TStringField;
    qry_result_impVL_MLE_MNEG: TFloatField;
    qry_result_impVL_FRETE_MNEG: TFloatField;
    qry_result_impVL_SEGURO_MNEG: TFloatField;
    qry_result_impVL_TAXA_X: TFloatField;
    qry_result_impVL_TAXA_DOLAR: TFloatField;
    qry_result_impPL_MERCADORIA_ORIGINAL: TFloatField;
    qry_result_impQT_MERCADORIA_ORIGINAL: TFloatField;
    qry_result_impVL_MLE_ITEM_ORIGINAL: TFloatField;
    qry_result_expDESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_geradrawbackClick(Sender: TObject);
    procedure edtEmpresaNacChange(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure edtEmpresaNacExit(Sender: TObject);
    procedure edtEmpresaNacKeyPress(Sender: TObject; var Key: Char);
    procedure dbgrd_result_impDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgrd_result_expDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btn_salvarClick(Sender: TObject);
    procedure dbgrd_result_impCellClick(Column: TColumn);
    procedure dbgrd_result_expCellClick(Column: TColumn);
    procedure ds_result_expDataChange(Sender: TObject; Field: TField);
    procedure btn_cancelar_matpriClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure ds_result_impDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_gera_drawback: Tfrm_gera_drawback;
  vPalavrasChave,
  vCodMercadoria,
  vCodLaudo,
  vCodMatPrima,
  vTipo : string;


implementation

uses
  PGGP017, ConsOnlineEx, MaskUtils, StrUtils;

{$R *.dfm}

function DeParaUnidMedida(Param : string): string;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT RTRIM(CD_EXTERNO) AS CD_EXTERNO, RTRIM(CD_DDBROKER) AS CD_DDBROKER');
    SQL.Add('FROM TDE_PARA WHERE CD_TABELA = ''16''');
    SQL.Add('AND CD_DDBROKER ='+QuotedStr(Trim(Param)));
    Open;
    Result := FieldbyName('CD_EXTERNO').AsString;
    Close;
    Free;
  end;
end;

function DeParaMoeda(Param : string): string;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT TOP 1 RTRIM(ISNULL(AP_MOEDA, ''N/A'')) AS SIGLA');
    SQL.Add('FROM TMOEDA_BROKER');
    SQL.Add('WHERE CD_MOEDA = '+QuotedStr(Trim(Param)));
    Open;
    Result := FieldbyName('SIGLA').AsString;
    Close;
    Free;
  end;
end;

procedure Tfrm_gera_drawback.FormShow(Sender: TObject);
begin
    If vTipo = 'IMP' then
    begin
      dbgrd_result_exp.Visible := False;
      dbgrd_result_imp.Visible := True;
      qry_result_exp.Close;
      qry_result_imp.Close;
      qry_result_imp.ParamByName('CD_MAT_PRI').AsString    := vCodMatPrima;
      qry_result_imp.ParambyName('CD_MERCADORIA').AsString := vCodMercadoria;
      qry_result_imp.ParamByName('NR_LAUDO').AsString      := vCodLaudo;
      qry_result_imp.Open;
      //qry_result_imp.Edit;
    end
    Else
    If vTipo = 'EXP' then
    begin
      dbgrd_result_exp.Visible := True;
      dbgrd_result_imp.Visible := False;
      qry_result_exp.Close;
      qry_result_imp.Close;
      qry_result_exp.ParambyName('CD_MERCADORIA').AsString := vCodMercadoria;
      qry_result_exp.ParamByName('NR_LAUDO').AsString      := vCodLaudo;
      qry_result_exp.Open;
      //qry_result_exp.Edit;
    end;
end;

procedure Tfrm_gera_drawback.btn_sairClick(Sender: TObject);
begin
   frm_gera_drawback.Close;
end;

procedure Tfrm_gera_drawback.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     If datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
end;

procedure Tfrm_gera_drawback.btn_geradrawbackClick(Sender: TObject);
type
  TTotais  = record
     PesoKG           : Double;
     Quantidade       : Double;
     UnidMedida       : String;
     VMLE             : Double;
     Moeda            : String;
     ValorTotalUSD    : Double;
     ValorFrete       : Double;
     ValorSeguro      : Double;
     TTPesoKG         : Double;
     TTQuantidade     : Double;
     TTVMLE           : Double;
     TTValorTotalUSD  : Double;
     TTValorFrete     : Double;
     TTValorSeguro    : Double;
  end;

  TTotaisExp  = record
     PesoKG               : Double;
     Quantidade           : Double;
     UnidMedida           : String;
     VMLE                 : Double;
     Moeda                : String;
     ValorTotalUSD        : Double;
     ValorPCComissao      : Double;
     ValorComissao        : Double;
     ValorFOB             : Double;
     ValorEnquadramento   : Double;
     TTPesoKG             : Double;
     TTQuantidade         : Double;
     TTVMLE               : Double;
     TTValorTotalUSD      : Double;
     TTValorPCComissao    : Double;
     TTValorComissao      : Double;
     TTValorFOB           : Double;
     TTValorEnquadramento : Double;
  end;


var
  ExcelApp : TExcelApplication;
  ExcelWB  : TExcelWorkbook;
  ExcelWS  : TExcelWorksheet;
  vCaminho, vNmEmpresa, vCNPJ, vRE, vDtEmbarque,
  vNCM, vDescricao, vUnidMedida, vMoeda, vNumeroDI, vCodMoeda, NovaMoeda : string;

  vPesoKG, vQuantidade, vVMLE, vValorTotalUSD, vFreteUSD, vSeguroUSD, vPcComissao, vVlComissao, vFOB, vEnquadramento,
  vTotPesoKg, vTotQuantidade, vTotVMLE, vTotValorTotalUSD, vTotFreteUSD, vTotSeguroUSD, vTotPcComissao, vTotVlComissao,
  vTotFOB, vTotEnquadramento : Double;

  Pagina, Linha, QuebraLinha, I, I2, vBordaInicial, vBordaFinal : integer;
  SQL : TStrings;
  PalavrasChave : TStringList;
  Totais  : array of TTotais;
  TotaisExp : array of TTotaisExp;


begin
  if Trim(edtNmEmpresa.Text) = '' then
  begin
    Showmessage('Você deve incluir uma empresa nacional antes de prosseguir.');
    Exit;
  end
  else
  begin

  if FindWindow('XLMAIN',nil) <> 0  then begin
     MessageDlg('Favor fechar todas as janelas do Excel antes de continuar.'+#13#10+'Caso não haja nenhuma janela do Excel aberta e o erro continue ocorrendo, entre em contato com o departamento de TI.', mtError, [mbOk], 0);
     Exit;
  end;

    try
      ExcelApp := TExcelApplication.Create(nil);
      ExcelWB  := TExcelWorkbook.Create(nil);
      ExcelWS  := TExcelWorksheet.Create(nil);

      ExcelApp.Visible[1] := False;

      vNmEmpresa := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', Trim(edtEmpresaNac.Text), 'NM_EMPRESA');
      vCNPJ      := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', Trim(edtEmpresaNac.Text), 'CGC_EMPRESA');
      vCNPJ      := FormatMaskText('00.000.000/0000-00;0', vCNPJ);

      if vTipo = 'IMP' then
        begin
         vCaminho := 'H:\DDBroker\Modelo_RUD_IMPO.xls';
          If qry_result_imp.State in [dsEdit] then
             qry_result_imp.Post;

         // qry_result_imp.Close;
        end
      else if vTipo = 'EXP' then
        begin
         vCaminho := 'H:\DDBroker\Modelo_RUD_EXPO.xls';
          If qry_result_exp.State in [dsEdit] then
             qry_result_exp.Post;

          //qry_result_exp.Close;
        end
      else
      begin
         Showmessage('Ocorreu um erro. Não foi possível abrir a tabela. Por favor, tente novamente.');
         FreeAndNil(ExcelWS);
         FreeAndNil(ExcelWB);
         FreeAndNil(ExcelApp);
         Exit;
      end;

      ExcelWB.ConnectTo(ExcelApp.Workbooks.Open(vCaminho, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0));
      ExcelWS.ConnectTo(ExcelWB.Sheets.Item[1] As ExcelWorksheet);
      ExcelWS.Range['A2','A2'].Value2 := 'Empresa: ' + vNmEmpresa + ' CNPJ: ' + vCNPJ;
      Pagina := 1;

      if vTipo = 'IMP' then
      begin                  
        try
          datm_main.db_broker.StartTransaction;

          PalavrasChave := TStringList.Create;


          ExtractStrings([';'],[],PChar(vPalavrasChave), PalavrasChave);
          qry_result_imp.DisableControls;
          qry_result_imp.Close;
          SQL := qry_result_imp.SQL;
          Linha := 5;

          for I := 0 to PalavrasChave.Count-1 do
          begin
            qry_result_imp.SQL.Text := 'SELECT * FROM TLAUDO_TECNICO_IMP ' +
                                       'WHERE CD_MERCADORIA = :CD_MERCADORIA ' +
                                       'AND NR_LAUDO = :NR_LAUDO ' +
                                       'AND CD_MAT_PRI = :CD_MAT_PRI  ' +
                                       'AND DESCRICAO LIKE ''%'+PalavrasChave.Strings[I]+'%''' +
                                       'ORDER BY CD_MOEDA, CD_NCM_SH, CD_UN_MEDIDA';

            qry_result_imp.ParambyName('CD_MERCADORIA').AsString := vCodMercadoria;
            qry_result_imp.ParamByName('NR_LAUDO').AsString      := vCodLaudo;
            qry_result_imp.ParamByName('CD_MAT_PRI').AsString    := vCodMatPrima;
            qry_result_imp.Open;

            while not qry_result_imp.Eof do
            begin
              vMoeda := qry_result_impCD_MOEDA.AsString;
              NovaMoeda := 'N';

              If High(Totais) = -1 then
              begin
                SetLength(Totais, High(Totais)+2);
                Totais[0].Moeda := vMoeda;
              end
              else If High(Totais) >= 0 then
              begin
                I2 := 0;

                for I2 := 0 to High(Totais) do
                begin
                  If Totais[I2].Moeda <> vMoeda then
                    begin
                      If (NovaMoeda <> 'NN') and (I2 <> High(Totais)) then
                         NovaMoeda := 'S'
                      Else
                      If (NovaMoeda <> 'NN') and (I2 = High(Totais)) Then
                         NovaMoeda := 'SS';
                    end
                    else
                    begin
                         NovaMoeda := 'NN';
                    end;
                end;

                If NovaMoeda = 'SS' then
                begin
                  SetLength(Totais, High(Totais)+2);
                  Totais[High(Totais)].Moeda := vMoeda;
                end;

              end;

              qry_result_imp.Next;
            end;


          end;

          for I := 0 to PalavrasChave.Count-1 do
          begin
            qry_result_imp.SQL.Text := 'SELECT * FROM TLAUDO_TECNICO_IMP ' +
                                       'WHERE CD_MERCADORIA = :CD_MERCADORIA ' +
                                       'AND NR_LAUDO = :NR_LAUDO ' +
                                       'AND CD_MAT_PRI = :CD_MAT_PRI  ' +
                                       'AND DESCRICAO LIKE ''%'+PalavrasChave.Strings[I]+'%''' +
                                       'ORDER BY CD_MOEDA, CD_NCM_SH, CD_UN_MEDIDA';

            qry_result_imp.ParambyName('CD_MERCADORIA').AsString := vCodMercadoria;
            qry_result_imp.ParamByName('NR_LAUDO').AsString      := vCodLaudo;
            qry_result_imp.ParamByName('CD_MAT_PRI').AsString    := vCodMatPrima;
            qry_result_imp.Open;
            qry_result_imp.First;
            vMoeda := qry_result_impCD_MOEDA.AsString;
            vCodMoeda := qry_result_impCD_MOEDA.AsString;
            vBordaInicial := Linha;

            while not qry_result_imp.Eof do
            begin
              If vCodMoeda = qry_result_impCD_MOEDA.AsString then
                begin
                  if QuebraLinha = 13 then
                  begin
                    vBordaFinal := Linha - 1;
                    ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.LineStyle := xlContinuous;
                    ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.ColorIndex := 0;
                    ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.Weight := xlThin;

                    If vBordaInicial <> 5 Then
                    begin
                      ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaInicial+1), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaInicial+1)].Borders[xlInsideVertical].LineStyle := xlNone;
                      ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaInicial+1), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaInicial+1)].Borders[xlInsideHorizontal].LineStyle := xlNone;
                    end;

                    //Teste Sub-total (NÃO ESQUECER DE REMOVER!!)

                    {vBordaFinal := Linha-1;
                    ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.LineStyle := xlContinuous;
                    ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.ColorIndex := 0;
                    ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.Weight := xlThin;

                    ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].HorizontalAlignment := xlCenter;
                    ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].VerticalAlignment := xlCenter;
                    ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Orientation := 0;
                    ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].AddIndent := False;
                    ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].IndentLevel := 0;
                    ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ShrinkToFit := False;
                    ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ReadingOrder := xlContext;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].MergeCells := False;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Merge(EmptyParam);
                    ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Value2 := 'SUBTOTAL';
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Pattern := xlSolid;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Color := 10092543;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Font.Bold := True;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.LineStyle := xlContinuous;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.ColorIndex := 0;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.Weight := xlMedium;

                    ExcelWS.Cells.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := vPesoKG;
                    ExcelWS.Cells.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := vQuantidade;
                    ExcelWS.Cells.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := vUnidMedida;
                    ExcelWS.Cells.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := vVMLE;
                    ExcelWS.Cells.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := vMoeda;
                    ExcelWS.Cells.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := vValorTotalUSD;
                    ExcelWS.Cells.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := vFreteUSD;
                    ExcelWS.Cells.Range['P'+InttoStr(Linha), 'P'+InttoStr(Linha)].Value2 := vSeguroUSD;

                    Linha := Linha + 1;
                    QuebraLinha := QuebraLinha + 1;
                    qry_result_imp.Delete;
                    qry_result_imp.First;
                    vCodMoeda := qry_result_impCD_MOEDA.AsString;

                    vTotPesoKg        := vTotPesoKg + vPesoKG;
                    vTotQuantidade    := vTotQuantidade + vQuantidade;
                    vTotVMLE          := vTotVMLE + vVMLE;
                    vTotValorTotalUSD := vTotValorTotalUSD + vValorTotalUSD;
                    vTotFreteUSD      := vTotFreteUSD + vFreteUSD;
                    vTotSeguroUSD     := vTotSeguroUSD + vSeguroUSD;

                    vPesoKG        := 0;
                    vQuantidade    := 0;
                    vVMLE          := 0;
                    vValorTotalUSD := 0;
                    vFreteUSD      := 0;
                    vSeguroUSD     := 0;}

                    //Teste Sub-total (NÃO ESQUECER DE REMOVER!!)

                    QuebraLinha := 0;
                    Linha := Linha + 21;
                    Pagina := Pagina + 1;
                    ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3)].HorizontalAlignment := xlCenter;
                    ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3)].VerticalAlignment := xlCenter;
                    ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3)].Orientation := 0;
                    ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3)].AddIndent := False;
                    ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3)].IndentLevel := 0;
                    ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3)].ShrinkToFit := False;
                    ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+3)].ReadingOrder := xlContext;

                    ExcelWS.Cells.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1)].MergeCells := True;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1)].Merge(EmptyParam);
                    vBordaInicial := Linha;
                    ExcelWS.Range['A'+InttoStr(Linha),'A'+InttoStr(Linha)].Value2 := 'Pagina '+InttoStr(Pagina)+'                                                                                                                                                    RELATÓRIO DE IMPORTAÇÃO DE DRAWBACK ';
                    Linha := Linha + 1;
                    ExcelWS.Range['A'+InttoStr(Linha),'A'+InttoStr(Linha)].Value2 := 'Empresa: ' + vNmEmpresa + ' CNPJ: ' + vCNPJ;
                    Linha := Linha + 1;

                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Pattern := xlSolid;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Color := 10092543;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Font.Bold := True;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.LineStyle := xlContinuous;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.ColorIndex := 0;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.Weight := xlMedium;

                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha)+':M'+InttoStr(Linha+1)].Borders[xlInsideVertical].LineStyle := xlNone;
                    ExcelWS.Cells.Range['A'+InttoStr(Linha)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha)+':M'+InttoStr(Linha+1)].Borders[xlInsideHorizontal].LineStyle := xlNone;

                    ExcelWS.Range['A'+InttoStr(Linha),'A'+InttoStr(Linha)].Value2 := 'DI original'+#10+'nº';
                    ExcelWS.Range['B'+InttoStr(Linha),'B'+InttoStr(Linha)].Value2 := 'Nº '+#10+'Adição';
                    ExcelWS.Range['C'+InttoStr(Linha),'C'+InttoStr(Linha)].Value2 := 'DI '+#10+'nº';
                    ExcelWS.Range['D'+InttoStr(Linha),'D'+InttoStr(Linha)].Value2 := 'Nº '+#10+'Adição';
                    ExcelWS.Range['E'+InttoStr(Linha),'E'+InttoStr(Linha)].Value2 := 'Data do '+#10+'Registro da DI';
                    ExcelWS.Range['F'+InttoStr(Linha),'F'+InttoStr(Linha)].Value2 := 'Data '+#10+'Desembaraço';
                    ExcelWS.Range['G'+InttoStr(Linha),'G'+InttoStr(Linha)].Value2 := 'NCM';
                    ExcelWS.Range['H'+InttoStr(Linha),'H'+InttoStr(Linha)].Value2 := 'Descrição da'+#10+'Mercadoria';
                    ExcelWS.Range['I'+InttoStr(Linha),'I'+InttoStr(Linha)].Value2 := 'Peso em'+#10+'KG';
                    ExcelWS.Range['J'+InttoStr(Linha),'J'+InttoStr(Linha)].Value2 := 'Qtd.';
                    ExcelWS.Range['K'+InttoStr(Linha),'K'+InttoStr(Linha)].Value2 := 'Unid.'+#10+'Medida';
                    ExcelWS.Range['L'+InttoStr(Linha),'L'+InttoStr(Linha)].Value2 := 'V.M.L.E';
                    ExcelWS.Range['M'+InttoStr(Linha),'M'+InttoStr(Linha)].Value2 := 'Moeda'+#10+'V.M.L.E';
                    ExcelWS.Range['N'+InttoStr(Linha),'N'+InttoStr(Linha)].Value2 := 'Valor'+#10'Total US$';
                    ExcelWS.Range['O'+InttoStr(Linha),'O'+InttoStr(Linha)].Value2 := 'Frete'+#10+'USD';
                    ExcelWS.Range['P'+InttoStr(Linha),'P'+InttoStr(Linha)].Value2 := 'Seguro'+#10+'USD';
                    ExcelWS.Range['Q'+InttoStr(Linha),'Q'+InttoStr(Linha)].Value2 := 'Taxa';
                    ExcelWS.Range['Q'+InttoStr(Linha+1),'Q'+InttoStr(Linha+1)].Value2 := 'X';
                    ExcelWS.Range['R'+InttoStr(Linha+1),'R'+InttoStr(Linha+1)].Value2 := 'USD';
                    Linha := Linha + 1;


                    ExcelWS.Range['A'+InttoStr(Linha), 'A'+InttoStr(Linha)].Value2 := FormatMaskText('00/0000000-0;0', qry_result_impNR_DI.AsString);
                    ExcelWS.Range['B'+InttoStr(Linha), 'B'+InttoStr(Linha)].Value2 := qry_result_impNR_ADICAO.AsString;
                    ExcelWS.Range['C'+InttoStr(Linha), 'C'+InttoStr(Linha)].Value2 := FormatMaskText('00/0000000-0;0', qry_result_impNR_DI.AsString);
                    ExcelWS.Range['D'+InttoStr(Linha), 'D'+InttoStr(Linha)].Value2 := qry_result_impNR_ADICAO.AsString;
                    ExcelWS.Range['E'+InttoStr(Linha), 'E'+InttoStr(Linha)].Value2 := FormatMaskText('00/00/0000;0', qry_result_impDT_REGISTRO_DI.AsString);
                    ExcelWS.Range['F'+InttoStr(Linha), 'F'+InttoStr(Linha)].Value2 := FormatMaskText('00/00/0000;0', qry_result_impDT_DESEMBARACO.AsString);
                    ExcelWS.Range['G'+InttoStr(Linha), 'G'+InttoStr(Linha)].Value2 := qry_result_impCD_NCM_SH.AsString;
                    ExcelWS.Range['H'+InttoStr(Linha), 'H'+InttoStr(Linha)].Value2 := qry_result_impDESCRICAO.AsString;
                    ExcelWS.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := qry_result_impPL_MERCADORIA.AsString;
                    ExcelWS.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := qry_result_impQT_MERCADORIA.AsString;
                    ExcelWS.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := qry_result_impCD_UN_MEDIDA.AsString;
                    ExcelWS.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := qry_result_impVL_MLE_ITEM.AsFloat;
                    ExcelWS.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := DeParaMoeda(qry_result_impCD_MOEDA.AsString);
                    ExcelWS.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := qry_result_impVL_MLE_MNEG.AsFloat;
                    ExcelWS.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := qry_result_impVL_FRETE_MNEG.AsFloat;
                    ExcelWS.Range['P'+InttoStr(Linha), 'P'+InttoStr(Linha)].Value2 := qry_result_impVL_SEGURO_MNEG.AsFloat;
                    ExcelWS.Range['Q'+InttoStr(Linha), 'Q'+InttoStr(Linha)].Value2 := qry_result_impVL_TAXA_X.AsFloat;
                    ExcelWS.Range['R'+InttoStr(Linha), 'R'+InttoStr(Linha)].Value2 := qry_result_impVL_TAXA_DOLAR.AsFloat;

                    vPesoKG        := vPesoKG + qry_result_impPL_MERCADORIA.AsFloat;
                    vQuantidade    := vQuantidade + qry_result_impQT_MERCADORIA.AsFloat;
                    vVMLE          := vVMLE + qry_result_impVL_MLE_ITEM.AsFloat;
                    vValorTotalUSD := vValorTotalUSD + qry_result_impVL_MLE_MNEG.AsFloat;
                    vFreteUSD      := vFreteUSD + qry_result_impVL_FRETE_MNEG.AsFloat;
                    vSeguroUSD     := vSeguroUSD + qry_result_impVL_SEGURO_MNEG.AsFloat;
                    vUnidMedida    := qry_result_impCD_UN_MEDIDA.AsString;
                    vMoeda         := DeParaMoeda(qry_result_impCD_MOEDA.AsString);

                    Linha := Linha + 1;
                    QuebraLinha := QuebraLinha + 1;
                  end
                  else
                  begin
                    ExcelWS.Range['A'+InttoStr(Linha), 'A'+InttoStr(Linha)].Value2 := FormatMaskText('00/0000000-0;0', qry_result_impNR_DI.AsString);
                    ExcelWS.Range['B'+InttoStr(Linha), 'B'+InttoStr(Linha)].Value2 := qry_result_impNR_ADICAO.AsString;
                    ExcelWS.Range['C'+InttoStr(Linha), 'C'+InttoStr(Linha)].Value2 := FormatMaskText('00/0000000-0;0', qry_result_impNR_DI.AsString);
                    ExcelWS.Range['D'+InttoStr(Linha), 'D'+InttoStr(Linha)].Value2 := qry_result_impNR_ADICAO.AsString;
                    ExcelWS.Range['E'+InttoStr(Linha), 'E'+InttoStr(Linha)].Value2 := FormatMaskText('00/00/0000;0', qry_result_impDT_REGISTRO_DI.AsString);
                    ExcelWS.Range['F'+InttoStr(Linha), 'F'+InttoStr(Linha)].Value2 := FormatMaskText('00/00/0000;0', qry_result_impDT_DESEMBARACO.AsString);
                    ExcelWS.Range['G'+InttoStr(Linha), 'G'+InttoStr(Linha)].Value2 := qry_result_impCD_NCM_SH.AsString;
                    ExcelWS.Range['H'+InttoStr(Linha), 'H'+InttoStr(Linha)].Value2 := qry_result_impDESCRICAO.AsString;
                    ExcelWS.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := qry_result_impPL_MERCADORIA.AsFloat;
                    ExcelWS.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := qry_result_impQT_MERCADORIA.AsFloat;
                    ExcelWS.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := qry_result_impCD_UN_MEDIDA.AsString;
                    ExcelWS.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := qry_result_impVL_MLE_ITEM.AsFloat;
                    ExcelWS.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := DeParaMoeda(qry_result_impCD_MOEDA.AsString);
                    ExcelWS.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := qry_result_impVL_MLE_MNEG.AsFloat;
                    ExcelWS.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := qry_result_impVL_FRETE_MNEG.AsFloat;
                    ExcelWS.Range['P'+InttoStr(Linha), 'P'+InttoStr(Linha)].Value2 := qry_result_impVL_SEGURO_MNEG.AsFloat;
                    ExcelWS.Range['Q'+InttoStr(Linha), 'Q'+InttoStr(Linha)].Value2 := qry_result_impVL_TAXA_X.AsFloat;
                    ExcelWS.Range['R'+InttoStr(Linha), 'R'+InttoStr(Linha)].Value2 := qry_result_impVL_TAXA_DOLAR.AsFloat;

                    vPesoKG        := vPesoKG + qry_result_impPL_MERCADORIA.AsFloat;
                    vQuantidade    := vQuantidade + qry_result_impQT_MERCADORIA.AsFloat;
                    vVMLE          := vVMLE + qry_result_impVL_MLE_ITEM.AsFloat;
                    vValorTotalUSD := vValorTotalUSD + qry_result_impVL_MLE_MNEG.AsFloat;
                    vFreteUSD      := vFreteUSD + qry_result_impVL_FRETE_MNEG.AsFloat;
                    vSeguroUSD     := vSeguroUSD + qry_result_impVL_SEGURO_MNEG.AsFloat;
                    vUnidMedida    := qry_result_impCD_UN_MEDIDA.AsString;
                    vMoeda         := DeParaMoeda(qry_result_impCD_MOEDA.AsString);

                    {vTotPesoKg        := vTotPesoKg + vPesoKG;
                    vTotQuantidade    := vTotQuantidade + vQuantidade;
                    vTotVMLE          := vTotVMLE + vVMLE;
                    vTotValorTotalUSD := vTotValorTotalUSD + vValorTotalUSD;
                    vTotFreteUSD      := vTotFreteUSD + vFreteUSD;
                    vTotSeguroUSD     := vTotSeguroUSD + vSeguroUSD;}

                    Linha := Linha + 1;
                    QuebraLinha := QuebraLinha + 1;
                  end;

                  for I2 := 0 to High(Totais) do
                  begin
                    If Totais[I2].Moeda = vCodMoeda then
                    begin
                       Totais[I2].PesoKG        := qry_result_impPL_MERCADORIA.AsFloat;
                       Totais[I2].Quantidade    := qry_result_impQT_MERCADORIA.AsFloat;
                       Totais[I2].UnidMedida    := qry_result_impCD_UN_MEDIDA.AsString;
                       Totais[I2].VMLE          := qry_result_impVL_MLE_ITEM.AsFloat;
                       Totais[I2].ValorTotalUSD := qry_result_impVL_MLE_MNEG.AsFloat;
                       Totais[I2].ValorFrete    := qry_result_impVL_FRETE_MNEG.AsFloat;
                       Totais[I2].ValorSeguro   := qry_result_impVL_SEGURO_MNEG.AsFloat;

                       Totais[I2].TTPesoKG        := Totais[I2].TTPesoKG        + qry_result_impPL_MERCADORIA.AsFloat;
                       Totais[I2].TTQuantidade    := Totais[I2].TTQuantidade    + qry_result_impQT_MERCADORIA.AsFloat;
                       Totais[I2].TTVMLE          := Totais[I2].TTVMLE          + qry_result_impVL_MLE_ITEM.AsFloat;
                       Totais[I2].TTValorTotalUSD := Totais[I2].TTValorTotalUSD + qry_result_impVL_MLE_MNEG.AsFloat;
                       Totais[I2].TTValorFrete    := Totais[I2].TTValorFrete    + qry_result_impVL_FRETE_MNEG.AsFloat;
                       Totais[I2].TTValorSeguro   := Totais[I2].TTValorSeguro   + qry_result_impVL_SEGURO_MNEG.AsFloat;

                    end;
                  end;
                  qry_result_imp.Next;
                  {qry_result_imp.Delete;
                  qry_result_imp.First;}
                end
              else
              begin
                vBordaFinal := Linha-1;
                ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.LineStyle := xlContinuous;
                ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.ColorIndex := 0;
                ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':R'+InttoStr(vBordaFinal)].Borders.Weight := xlThin;

                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].HorizontalAlignment := xlCenter;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].VerticalAlignment := xlCenter;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Orientation := 0;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].AddIndent := False;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].IndentLevel := 0;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ShrinkToFit := False;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ReadingOrder := xlContext;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].MergeCells := False;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Merge(EmptyParam);
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Value2 := 'SUBTOTAL';
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Pattern := xlSolid;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Color := 10092543;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Font.Bold := True;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.LineStyle := xlContinuous;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.ColorIndex := 0;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.Weight := xlMedium;

                ExcelWS.Cells.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := vPesoKG;
                ExcelWS.Cells.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := vQuantidade;
                ExcelWS.Cells.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := vUnidMedida;
                ExcelWS.Cells.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := vVMLE;
                ExcelWS.Cells.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := vMoeda;
                ExcelWS.Cells.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := vValorTotalUSD;
                ExcelWS.Cells.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := vFreteUSD;
                ExcelWS.Cells.Range['P'+InttoStr(Linha), 'P'+InttoStr(Linha)].Value2 := vSeguroUSD;

                Linha := Linha + 1;
                QuebraLinha := QuebraLinha + 1;
                {qry_result_imp.Delete;
                qry_result_imp.First;}
                qry_result_imp.Next;
                vCodMoeda := qry_result_impCD_MOEDA.AsString;

                vTotPesoKg        := vTotPesoKg + vPesoKG;
                vTotQuantidade    := vTotQuantidade + vQuantidade;
                vTotVMLE          := vTotVMLE + vVMLE;
                vTotValorTotalUSD := vTotValorTotalUSD + vValorTotalUSD;
                vTotFreteUSD      := vTotFreteUSD + vFreteUSD;
                vTotSeguroUSD     := vTotSeguroUSD + vSeguroUSD;

                vPesoKG        := 0;
                vQuantidade    := 0;
                vVMLE          := 0;
                vValorTotalUSD := 0;
                vFreteUSD      := 0;
                vSeguroUSD     := 0;
              end;

            end;

            vBordaFinal := Linha-1;

            If qry_result_imp.RecordCount > 0 then
            begin
              ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].HorizontalAlignment := xlCenter;
              ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].VerticalAlignment := xlCenter;
              ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Orientation := 0;
              ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].AddIndent := False;
              ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].IndentLevel := 0;
              ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ShrinkToFit := False;
              ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ReadingOrder := xlContext;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].MergeCells := False;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Merge(EmptyParam);
              ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Value2 := 'TOTAL';
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Pattern := xlSolid;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Interior.Color := 10092543;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Font.Bold := True;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.LineStyle := xlContinuous;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.ColorIndex := 0;
              ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha)].Borders.Weight := xlMedium;

              ExcelWS.Cells.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := vPesoKG;
              ExcelWS.Cells.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := vQuantidade;
              ExcelWS.Cells.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := vUnidMedida;
              ExcelWS.Cells.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := vVMLE;
              ExcelWS.Cells.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := vMoeda;
              ExcelWS.Cells.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := vValorTotalUSD;
              ExcelWS.Cells.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := vFreteUSD;
              ExcelWS.Cells.Range['P'+InttoStr(Linha), 'P'+InttoStr(Linha)].Value2 := vSeguroUSD;

              Linha := Linha + 1;

              vTotPesoKg        := vTotPesoKg + vPesoKG;
              vTotQuantidade    := vTotQuantidade + vQuantidade;
              vTotVMLE          := vTotVMLE + vVMLE;
              vTotValorTotalUSD := vTotValorTotalUSD + vValorTotalUSD;
              vTotFreteUSD      := vTotFreteUSD + vFreteUSD;
              vTotSeguroUSD     := vTotSeguroUSD + vSeguroUSD;

              vPesoKG        := 0;
              vQuantidade    := 0;
              vVMLE          := 0;
              vValorTotalUSD := 0;
              vFreteUSD      := 0;
              vSeguroUSD     := 0;
              vBordaInicial  := Linha;

            end;
          end;

          // Insere a linha 'Total Geral', incluindo a somatória de todos os valores, discernindo as moedas.

          ExcelWS.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].HorizontalAlignment := xlCenter;
          ExcelWS.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].VerticalAlignment := xlCenter;
          ExcelWS.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Orientation := 0;
          ExcelWS.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].AddIndent := False;
          ExcelWS.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].IndentLevel := 0;
          ExcelWS.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].ShrinkToFit := False;
          ExcelWS.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].ReadingOrder := xlContext;

          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Interior.Pattern := xlSolid;
          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Interior.PatternColorIndex := xlAutomatic;
          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Interior.Color := 10092543;
          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Font.Bold := True;
          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Borders.LineStyle := xlContinuous;
          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Borders.ColorIndex := 0;
          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Borders.Weight := xlMedium;

          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha+High(Totais))].MergeCells := False;
          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha+High(Totais)), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
          ExcelWS.Cells.Range['I'+InttoStr(Linha)+':I'+InttoStr(Linha+High(Totais)), 'I'+InttoStr(Linha)+':I'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
          ExcelWS.Cells.Range['J'+InttoStr(Linha)+':J'+InttoStr(Linha+High(Totais)), 'J'+InttoStr(Linha)+':J'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
          ExcelWS.Cells.Range['K'+InttoStr(Linha)+':K'+InttoStr(Linha+High(Totais)), 'K'+InttoStr(Linha)+':K'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
          ExcelWS.Cells.Range['N'+InttoStr(Linha)+':N'+InttoStr(Linha+High(Totais)), 'N'+InttoStr(Linha)+':N'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
          ExcelWS.Cells.Range['O'+InttoStr(Linha)+':O'+InttoStr(Linha+High(Totais)), 'O'+InttoStr(Linha)+':O'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
          ExcelWS.Cells.Range['P'+InttoStr(Linha)+':P'+InttoStr(Linha+High(Totais)), 'P'+InttoStr(Linha)+':P'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
          ExcelWS.Cells.Range['Q'+InttoStr(Linha)+':Q'+InttoStr(Linha+High(Totais)), 'Q'+InttoStr(Linha)+':Q'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);
          ExcelWS.Cells.Range['R'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais)), 'R'+InttoStr(Linha)+':R'+InttoStr(Linha+High(Totais))].Merge(EmptyParam);

          ExcelWS.Range['A'+InttoStr(Linha)+':A'+InttoStr(Linha), 'A'+InttoStr(Linha)+':A'+InttoStr(Linha)].Value2 := 'TOTAL GERAL';

          for I := 0 to High(Totais) do
          begin
            ExcelWS.Cells.Range['L'+InttoStr(Linha+I), 'L'+InttoStr(Linha+I)].Value2 := Totais[I].TTVMLE;
            ExcelWS.Cells.Range['M'+InttoStr(Linha+I), 'M'+InttoStr(Linha+I)].Value2 := DeParaMoeda(Totais[I].Moeda);
          end;
          ExcelWS.Cells.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := vTotPesoKG;
          ExcelWS.Cells.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := vTotQuantidade;
          ExcelWS.Cells.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := DeParaUnidMedida(qry_result_impCD_UN_MEDIDA.AsString);
          ExcelWS.Cells.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := vTotValorTotalUSD;
          ExcelWS.Cells.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := vTotFreteUSD;
          ExcelWS.Cells.Range['P'+InttoStr(Linha), 'P'+InttoStr(Linha)].Value2 := vTotSeguroUSD;

          datm_main.db_broker.Rollback;
        except
          If datm_main.db_broker.InTransaction then
             datm_main.db_broker.Rollback;

          ExcelApp.Visible[1] := True;
          ExcelWS.Disconnect;
          ExcelWB.Disconnect;
          ExcelApp.Disconnect;
          FreeAndNil(ExcelWS);
          FreeAndNil(ExcelWB);
          FreeAndNil(ExcelApp);

          qry_result_imp.Close;
          qry_result_imp.SQL := SQL;

          qry_result_imp.ParamByName('CD_MERCADORIA').AsString := vCodMercadoria;
          qry_result_imp.ParamByName('NR_LAUDO').AsString      := vCodLaudo;
          qry_result_imp.ParamByName('CD_MAT_PRI').AsString    := vCodMatPrima;

          qry_result_imp.Open;

        If qry_result_imp.State in [dsBrowse] then
           qry_result_imp.Edit;

          MessageDlg('Ocorreu um erro! Por favor, tente novamente', mtError, [mbOK], 0); 

          qry_result_imp.EnableControls;

        end;
      end
      else
      if vTipo = 'EXP' then
      begin
        try
          datm_main.db_broker.StartTransaction;

          PalavrasChave := TStringList.Create;


          ExtractStrings([';'],[],PChar(vPalavrasChave), PalavrasChave);
          qry_result_exp.DisableControls;
          //qry_result_exp.Close;
          SQL := qry_result_exp.SQL;
          Linha := 5;

          with TQuery.Create(Application) do
          begin
            Databasename := 'DBBROKER';

            SQL.Text := 'SELECT * FROM TLAUDO_TECNICO_EXP ' +
                        'WHERE CD_MERCADORIA = :CD_MERCADORIA ' +
                        'AND NR_LAUDO = :NR_LAUDO ' +
                        'ORDER BY CD_MOEDA, CD_NCM_SH, CD_UN_MEDIDA';

            ParambyName('CD_MERCADORIA').AsString := vCodMercadoria;
            ParamByName('NR_LAUDO').AsString      := vCodLaudo;
            Open;

            while not Eof do
            begin
              vMoeda := FieldbyName('CD_MOEDA').AsString;
              NovaMoeda := 'N';

              If High(TotaisExp) = -1 then
              begin
                SetLength(TotaisExp, High(TotaisExp)+2);
                TotaisExp[0].Moeda := vMoeda;
              end
              else If High(TotaisExp) >= 0 then
              begin
                I2 := 0;

                for I2 := 0 to High(TotaisExp) do
                begin
                  If TotaisExp[I2].Moeda <> vMoeda then
                  begin
                    If (NovaMoeda <> 'NN') and (I2 <> High(TotaisExp)) then
                       NovaMoeda := 'S'
                    Else
                    If (NovaMoeda <> 'NN') and (I2 = High(TotaisExp)) Then
                       NovaMoeda := 'SS';
                  end
                  else
                  begin
                    NovaMoeda := 'NN';
                  end;
                end;

                If NovaMoeda = 'SS' then
                begin
                  SetLength(TotaisExp, High(TotaisExp)+2);
                  TotaisExp[High(TotaisExp)].Moeda := vMoeda;
                end;

              end;

              Next;
            end;
          end;

          // Início da leitura do SQL

            {qry_result_exp.SQL.Text := 'SELECT * FROM TLAUDO_TECNICO_EXP ' +
                                       'WHERE CD_MERCADORIA = :CD_MERCADORIA ' +
                                       'AND NR_LAUDO = :NR_LAUDO ' +
                                       'ORDER BY CD_MOEDA, CD_NCM_SH, CD_UN_MEDIDA';

            qry_result_exp.ParambyName('CD_MERCADORIA').AsString := vCodMercadoria;
            qry_result_exp.ParamByName('NR_LAUDO').AsString      := vCodLaudo;
            qry_result_exp.Open;
            qry_result_exp.First;}
                                                             
            qry_result_exp.First;
            vMoeda := qry_result_expCD_MOEDA.AsString;
            vCodMoeda := qry_result_expCD_MOEDA.AsString;
            vBordaInicial := Linha;
            vNCM := qry_result_expCD_NCM_SH.AsString;
            vUnidMedida := qry_result_expCD_UN_MEDIDA.AsString;

          while not qry_result_exp.Eof do
          begin
            while (vNCM = qry_result_expCD_NCM_SH.AsString) do
            begin                                                 
              if QuebraLinha = 16 then
              begin
                vBordaFinal := Linha - 1;

                ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal)].Borders.LineStyle := xlContinuous;
                ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal)].Borders.ColorIndex := 0;
                ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal)].Borders.Weight := xlThin;

                //Teste Sub-Total (NÃO ESQUECER DE REMOVER!!)

                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].HorizontalAlignment := xlCenter;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].VerticalAlignment := xlCenter;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Orientation := 0;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].AddIndent := False;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].IndentLevel := 0;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ShrinkToFit := False;
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ReadingOrder := xlContext;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha)].MergeCells := False;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha)].Merge(EmptyParam);
                ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Value2 := 'Sub-Total';
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.Pattern := xlSolid;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.Color := 10092543;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Font.Bold := True;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.LineStyle := xlContinuous;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.ColorIndex := 0;
                ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.Weight := xlMedium;

                ExcelWS.Range['F'+InttoStr(Linha)+':F'+InttoStr(Linha), 'F'+InttoStr(Linha)+':F'+InttoStr(Linha)].HorizontalAlignment := xlRight;
                ExcelWS.Range['F'+InttoStr(Linha)+':F'+InttoStr(Linha), 'F'+InttoStr(Linha)+':F'+InttoStr(Linha)].VerticalAlignment := xlCenter;
                ExcelWS.Range['G'+InttoStr(Linha)+':G'+InttoStr(Linha), 'G'+InttoStr(Linha)+':G'+InttoStr(Linha)].HorizontalAlignment := xlRight;
                ExcelWS.Range['G'+InttoStr(Linha)+':G'+InttoStr(Linha), 'G'+InttoStr(Linha)+':G'+InttoStr(Linha)].VerticalAlignment := xlCenter;

                ExcelWS.Cells.Range['F'+InttoStr(Linha), 'F'+InttoStr(Linha)].Value2 := vPesoKG;
                ExcelWS.Cells.Range['G'+InttoStr(Linha), 'G'+InttoStr(Linha)].Value2 := vQuantidade;
                ExcelWS.Cells.Range['H'+InttoStr(Linha), 'H'+InttoStr(Linha)].Value2 := vUnidMedida;
                ExcelWS.Cells.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := vVMLE;
                ExcelWS.Cells.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := vMoeda;
                ExcelWS.Cells.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := vValorTotalUSD;
                ExcelWS.Cells.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := vPcComissao;
                ExcelWS.Cells.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := vVlComissao;
                ExcelWS.Cells.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := vFOB;
                ExcelWS.Cells.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := vEnquadramento;

                If (vNCM <> qry_result_expCD_NCM_SH.AsString) then
                   vNCM := qry_result_expCD_NCM_SH.AsString
                else
                if (vUnidMedida <> qry_result_expCD_UN_MEDIDA.AsString) then
                   vUnidMedida := qry_result_expCD_UN_MEDIDA.AsString;

                Linha := Linha + 1;

                vTotPesoKg        := vTotPesoKG + vPesoKG;
                vTotQuantidade    := vTotQuantidade + vQuantidade;
                vTotVMLE          := vTotVMLE + vVMLE;
                vTotValorTotalUSD := vTotValorTotalUSD + vValorTotalUSD;
                vTotPcComissao    := vTotPcComissao + vPcComissao;
                vTotVlComissao    := vTotVlComissao + vVlComissao;
                vTotFOB           := vTotFOB + vFOB;
                vTotEnquadramento := vTotEnquadramento + vEnquadramento;

                vPesoKG        := 0;
                vQuantidade    := 0;
                vVMLE          := 0;
                vValorTotalUSD := 0;
                vPcComissao    := 0;
                vVlComissao    := 0;
                vFOB           := 0;
                vEnquadramento := 0;

                //Teste Sub-Total (NÃO ESQUECER DE REMOVER!!)

                Linha := Linha + 1;
                QuebraLinha := QuebraLinha + 1;
                If not qry_result_exp.EOF then
                begin
                  {qry_result_exp.Delete;
                  qry_result_exp.First;}
                  qry_result_exp.Next;

                  ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal)].Borders.LineStyle := xlContinuous;
                  ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal)].Borders.ColorIndex := 0;
                  ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaFinal)].Borders.Weight := xlThin;

                  If vBordaInicial <> 5 Then
                  begin
                    ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaInicial+1), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaInicial+1)].Borders[xlInsideVertical].LineStyle := xlNone;
                    ExcelWS.Cells.Range['A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaInicial+1), 'A'+InttoStr(vBordaInicial)+':O'+InttoStr(vBordaInicial+1)].Borders[xlInsideHorizontal].LineStyle := xlNone;
                  end;
                                
                  QuebraLinha := 0;
                  Linha := Linha + 21;
                  Pagina := Pagina + 1;
                  ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2)].HorizontalAlignment := xlCenter;
                  ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2)].VerticalAlignment := xlCenter;
                  ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2)].Orientation := 0;
                  ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2)].AddIndent := False;
                  ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2)].IndentLevel := 0;
                  ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2)].ShrinkToFit := False;
                  ExcelWS.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+2)].ReadingOrder := xlContext;

                  ExcelWS.Cells.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1)].MergeCells := True;
                  ExcelWS.Cells.Range['A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha+1)+':M'+InttoStr(Linha+1)].Merge(EmptyParam);
                  vBordaInicial := Linha;
                  ExcelWS.Cells.Range['A'+InttoStr(Linha)+':F'+InttoStr(Linha), 'A'+InttoStr(Linha)+':F'+InttoStr(Linha)].Merge(EmptyParam);
                  ExcelWS.Range['A'+InttoStr(Linha),'A'+InttoStr(Linha)].Value2 := 'Pagina '+InttoStr(Pagina)+'                                                                                                                                                    RELATÓRIO DE EXPORTAÇÃO DE DRAWBACK ';
                  Linha := Linha + 1;
                  ExcelWS.Cells.Range['A'+InttoStr(Linha)+':K'+InttoStr(Linha), 'A'+InttoStr(Linha)+':K'+InttoStr(Linha)].Merge(EmptyParam);
                  ExcelWS.Range['A'+InttoStr(Linha),'A'+InttoStr(Linha)].Value2 := 'Empresa: ' + vNmEmpresa + ' CNPJ: ' + vCNPJ;
                  Linha := Linha + 1;

                  ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.Pattern := xlSolid;
                  ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
                  ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.Color := 10092543;
                  ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Font.Bold := True;
                  ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.LineStyle := xlContinuous;
                  ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.ColorIndex := 0;
                  ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.Weight := xlMedium;

                  {ExcelWS.Cells.Range['A'+InttoStr(Linha)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha)+':M'+InttoStr(Linha+1)].Borders[xlInsideVertical].LineStyle := xlNone;
                  ExcelWS.Cells.Range['A'+InttoStr(Linha)+':M'+InttoStr(Linha+1), 'A'+InttoStr(Linha)+':M'+InttoStr(Linha+1)].Borders[xlInsideHorizontal].LineStyle := xlNone;}

                  {ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+1), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+1)].Borders[xlEdgeTop].LineStyle := xlMedium;
                  ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+1), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+1)].Borders[xlEdgeBottom].LineStyle := xlMedium;
                  ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+1), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+1)].Borders[xlEdgeLeft].LineStyle := xlMedium;
                  ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+1), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+1)].Borders[xlEdgeRight].LineStyle := xlMedium;}

                  ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.Weight := xlMedium;

                  ExcelWS.Range['A'+InttoStr(Linha),'A'+InttoStr(Linha)].Value2 := 'RE';
                  ExcelWS.Range['B'+InttoStr(Linha),'B'+InttoStr(Linha)].Value2 := 'Data de'+#10+'Embarque';
                  ExcelWS.Range['C'+InttoStr(Linha),'C'+InttoStr(Linha)].Value2 := 'NCM';
                  ExcelWS.Range['E'+InttoStr(Linha),'E'+InttoStr(Linha)].Value2 := 'Descrição da'+#10+'Mercadoria';
                  ExcelWS.Range['F'+InttoStr(Linha),'F'+InttoStr(Linha)].Value2 := 'Peso em'+#10+'KG';
                  ExcelWS.Range['G'+InttoStr(Linha),'G'+InttoStr(Linha)].Value2 := 'Quantidade';
                  ExcelWS.Range['H'+InttoStr(Linha),'H'+InttoStr(Linha)].Value2 := 'Unid.'+#10+'Medida';
                  ExcelWS.Range['I'+InttoStr(Linha),'I'+InttoStr(Linha)].Value2 := 'V.M.L.E';
                  ExcelWS.Range['J'+InttoStr(Linha),'J'+InttoStr(Linha)].Value2 := 'Moeda'+#10+'V.M.L.E';
                  ExcelWS.Range['K'+InttoStr(Linha),'K'+InttoStr(Linha)].Value2 := 'Valor'+#10+'Total US$';
                  ExcelWS.Range['L'+InttoStr(Linha),'L'+InttoStr(Linha)].Value2 := '%'+#10+'Comissão';
                  ExcelWS.Range['M'+InttoStr(Linha),'M'+InttoStr(Linha)].Value2 := 'Valor'+#10+'Comissão';
                  ExcelWS.Range['N'+InttoStr(Linha),'N'+InttoStr(Linha)].Value2 := 'FOB'+#10+'Líquido';
                  ExcelWS.Range['O'+InttoStr(Linha),'O'+InttoStr(Linha)].Value2 := 'Enquadramento';
                  Linha := Linha + 1;

                  ExcelWS.Range['A'+InttoStr(Linha), 'A'+InttoStr(Linha)].Value2 := FormatMaskText('00/0000000-0;0', qry_result_expNR_RE.AsString);
                  ExcelWS.Range['B'+InttoStr(Linha), 'B'+InttoStr(Linha)].Value2 := FormatMaskText('00/00/0000;0', qry_result_expDT_EMBARQUE.AsString);
                  ExcelWS.Range['C'+InttoStr(Linha), 'C'+InttoStr(Linha)].Value2 := qry_result_expCD_NCM_SH.AsString;
                  ExcelWS.Range['E'+InttoStr(Linha), 'E'+InttoStr(Linha)].Value2 := qry_result_expDESCRICAO.AsString;
                  ExcelWS.Range['F'+InttoStr(Linha), 'F'+InttoStr(Linha)].Value2 := qry_result_expPL_MERCADORIA.AsFloat;
                  ExcelWS.Range['G'+InttoStr(Linha), 'G'+InttoStr(Linha)].Value2 := qry_result_expQT_MERCADORIA.AsFloat;
                  ExcelWS.Range['H'+InttoStr(Linha), 'H'+InttoStr(Linha)].Value2 := qry_result_expCD_UN_MEDIDA.AsString;
                  ExcelWS.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := qry_result_expVL_MLE_ITEM.AsFloat;
                  ExcelWS.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := DeParaMoeda(qry_result_expCD_MOEDA.AsString);
                  ExcelWS.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := qry_result_expVL_MLE_MNEG.AsFloat;
                  ExcelWS.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := qry_result_expPC_COMISSAO.AsFloat;
                  ExcelWS.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := qry_result_expVL_COMISSAO.AsFloat;
                  ExcelWS.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := qry_result_expVL_MLE_ITEM_MN.AsFloat;
                  ExcelWS.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := qry_result_expVL_ENQUADRAMENTO.AsFloat;

                  vPesoKG        := vPesoKG + qry_result_expPL_MERCADORIA.AsFloat;
                  vQuantidade    := vQuantidade + qry_result_expQT_MERCADORIA.AsFloat;
                  vVMLE          := vVMLE + qry_result_expVL_MLE_ITEM.AsFloat;
                  vValorTotalUSD := vValorTotalUSD + qry_result_expVL_MLE_MNEG.AsFloat;
                  vPcComissao    := vPcComissao + qry_result_expPC_COMISSAO.AsFloat;
                  vVlComissao    := vVlComissao + qry_result_expVL_COMISSAO.AsFloat;
                  vUnidMedida    := qry_result_expCD_UN_MEDIDA.AsString;
                  vMoeda         := DeParaMoeda(qry_result_expCD_MOEDA.AsString);
                  vFOB           := vFOB + qry_result_expVL_MLE_ITEM_MN.AsFloat;
                  vEnquadramento := vEnquadramento + qry_result_expVL_ENQUADRAMENTO.AsFloat;

                  Linha := Linha + 1;
                  QuebraLinha := QuebraLinha + 1;
                end
                else
                  Break;         
              end
              else
              begin
                ExcelWS.Range['A'+InttoStr(Linha), 'A'+InttoStr(Linha)].Value2 := FormatMaskText('00/0000000-0;0', qry_result_expNR_RE.AsString);
                ExcelWS.Range['B'+InttoStr(Linha), 'B'+InttoStr(Linha)].Value2 := FormatMaskText('00/00/0000;0', qry_result_expDT_EMBARQUE.AsString);
                ExcelWS.Range['C'+InttoStr(Linha), 'C'+InttoStr(Linha)].Value2 := qry_result_expCD_NCM_SH.AsString;
                ExcelWS.Range['E'+InttoStr(Linha), 'E'+InttoStr(Linha)].Value2 := qry_result_expDESCRICAO.AsString;
                ExcelWS.Range['F'+InttoStr(Linha), 'F'+InttoStr(Linha)].Value2 := qry_result_expPL_MERCADORIA.AsFloat;
                ExcelWS.Range['G'+InttoStr(Linha), 'G'+InttoStr(Linha)].Value2 := qry_result_expQT_MERCADORIA.AsFloat;
                ExcelWS.Range['H'+InttoStr(Linha), 'H'+InttoStr(Linha)].Value2 := qry_result_expCD_UN_MEDIDA.AsString;
                ExcelWS.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := qry_result_expVL_MLE_ITEM.AsFloat;
                ExcelWS.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := DeParaMoeda(qry_result_expCD_MOEDA.AsString);
                ExcelWS.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := qry_result_expVL_MLE_MNEG.AsFloat;
                ExcelWS.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := qry_result_expPC_COMISSAO.AsFloat;
                ExcelWS.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := qry_result_expVL_COMISSAO.AsFloat;
                ExcelWS.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := qry_result_expVL_MLE_ITEM_MN.AsFloat;
                ExcelWS.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := qry_result_expVL_ENQUADRAMENTO.AsFloat;

                vPesoKG        := vPesoKG + qry_result_expPL_MERCADORIA.AsFloat;
                vQuantidade    := vQuantidade + qry_result_expQT_MERCADORIA.AsFloat;
                vVMLE          := vVMLE + qry_result_expVL_MLE_ITEM.AsFloat;
                vValorTotalUSD := vValorTotalUSD + qry_result_expVL_MLE_MNEG.AsFloat;
                vPcComissao    := vPcComissao + qry_result_expPC_COMISSAO.AsFloat;
                vVlComissao    := vVlComissao + qry_result_expVL_COMISSAO.AsFloat;
                vUnidMedida    := qry_result_expCD_UN_MEDIDA.AsString;
                vMoeda         := DeParaMoeda(qry_result_expCD_MOEDA.AsString);
                vFOB           := vFOB + qry_result_ExpVL_MLE_ITEM_MN.AsFloat;
                vEnquadramento := vEnquadramento + qry_result_expVL_ENQUADRAMENTO.AsFloat;

                Linha := Linha + 1;
                QuebraLinha := QuebraLinha + 1;
              end;

              for I2 := 0 to High(TotaisExp) do
              begin
                If TotaisExp[I2].Moeda = vCodMoeda then
                begin
                  TotaisExp[I2].PesoKG             := qry_result_expPL_MERCADORIA.AsFloat;
                  TotaisExp[I2].Quantidade         := qry_result_expQT_MERCADORIA.AsFloat;
                  TotaisExp[I2].UnidMedida         := qry_result_expCD_UN_MEDIDA.AsString;
                  TotaisExp[I2].VMLE               := qry_result_expVL_MLE_ITEM.AsFloat;
                  TotaisExp[I2].ValorTotalUSD      := qry_result_expVL_MLE_MNEG.AsFloat;
                  TotaisExp[I2].ValorComissao      := qry_result_expVL_COMISSAO.AsFloat;
                  TotaisExp[I2].ValorPCComissao    := qry_result_expPC_COMISSAO.AsFloat;
                  TotaisExp[I2].ValorFOB           := qry_result_expVL_MLE_ITEM_MN.AsFloat;
                  TotaisExp[I2].ValorEnquadramento := qry_result_expVL_ENQUADRAMENTO.AsFloat;

                  TotaisExp[I2].TTPesoKG             := TotaisExp[I2].TTPesoKG             + qry_result_expPL_MERCADORIA.AsFloat;
                  TotaisExp[I2].TTQuantidade         := TotaisExp[I2].TTQuantidade         + qry_result_expQT_MERCADORIA.AsFloat;
                  TotaisExp[I2].TTVMLE               := TotaisExp[I2].TTVMLE               + qry_result_expVL_MLE_ITEM.AsFloat;
                  TotaisExp[I2].TTValorTotalUSD      := TotaisExp[I2].TTValorTotalUSD      + qry_result_expVL_MLE_MNEG.AsFloat;
                  TotaisExp[I2].TTValorComissao      := TotaisExp[I2].TTValorComissao      + qry_result_expVL_COMISSAO.AsFloat;
                  TotaisExp[I2].TTValorPcComissao    := TotaisExp[I2].TTValorPcComissao    + qry_result_expPC_COMISSAO.AsFloat;
                  TotaisExp[I2].TTValorFOB           := TotaisExp[I2].TTValorFOB           + qry_result_expVL_MLE_ITEM_MN.AsFloat;
                  TotaisExp[I2].TTValorEnquadramento := TotaisExp[I2].TTValorEnquadramento + qry_result_expVL_ENQUADRAMENTO.AsFloat;
                end;
              end;
                
              If not qry_result_exp.Eof then
              begin
                {qry_result_exp.Delete;
                qry_result_exp.First;}
                qry_result_exp.Next;
              end
              else
                Break;
            end;

            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].HorizontalAlignment := xlCenter;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].VerticalAlignment := xlCenter;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Orientation := 0;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].AddIndent := False;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].IndentLevel := 0;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ShrinkToFit := False;
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].ReadingOrder := xlContext;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha)].MergeCells := False;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha)].Merge(EmptyParam);
            ExcelWS.Range['A'+InttoStr(Linha)+':H'+InttoStr(Linha), 'A'+InttoStr(Linha)+':H'+InttoStr(Linha)].Value2 := 'Sub-Total';
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.Pattern := xlSolid;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.PatternColorIndex := xlAutomatic;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Interior.Color := 10092543;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Font.Bold := True;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.LineStyle := xlContinuous;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.ColorIndex := 0;
            ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha)].Borders.Weight := xlMedium;

            ExcelWS.Range['F'+InttoStr(Linha)+':F'+InttoStr(Linha), 'F'+InttoStr(Linha)+':F'+InttoStr(Linha)].HorizontalAlignment := xlRight;
            ExcelWS.Range['F'+InttoStr(Linha)+':F'+InttoStr(Linha), 'F'+InttoStr(Linha)+':F'+InttoStr(Linha)].VerticalAlignment := xlCenter;
            ExcelWS.Range['G'+InttoStr(Linha)+':G'+InttoStr(Linha), 'G'+InttoStr(Linha)+':G'+InttoStr(Linha)].HorizontalAlignment := xlRight;
            ExcelWS.Range['G'+InttoStr(Linha)+':G'+InttoStr(Linha), 'G'+InttoStr(Linha)+':G'+InttoStr(Linha)].VerticalAlignment := xlCenter;

            ExcelWS.Cells.Range['F'+InttoStr(Linha), 'F'+InttoStr(Linha)].Value2 := vPesoKG;
            ExcelWS.Cells.Range['G'+InttoStr(Linha), 'G'+InttoStr(Linha)].Value2 := vQuantidade;
            ExcelWS.Cells.Range['H'+InttoStr(Linha), 'H'+InttoStr(Linha)].Value2 := vUnidMedida;
            ExcelWS.Cells.Range['I'+InttoStr(Linha), 'I'+InttoStr(Linha)].Value2 := vVMLE;
            ExcelWS.Cells.Range['J'+InttoStr(Linha), 'J'+InttoStr(Linha)].Value2 := vMoeda;
            ExcelWS.Cells.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := vValorTotalUSD;
            ExcelWS.Cells.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := vPcComissao;
            ExcelWS.Cells.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := vVlComissao;
            ExcelWS.Cells.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := vFOB;
            ExcelWS.Cells.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := vEnquadramento;

            If (vNCM <> qry_result_expCD_NCM_SH.AsString) then
               vNCM := qry_result_expCD_NCM_SH.AsString
            else
            if (vUnidMedida <> qry_result_expCD_UN_MEDIDA.AsString) then
               vUnidMedida := qry_result_expCD_UN_MEDIDA.AsString;

            Linha := Linha + 1;

            vTotPesoKg        := vTotPesoKG + vPesoKG;
            vTotQuantidade    := vTotQuantidade + vQuantidade;
            vTotVMLE          := vTotVMLE + vVMLE;
            vTotValorTotalUSD := vTotValorTotalUSD + vValorTotalUSD;
            vTotPcComissao    := vTotPcComissao + vPcComissao;
            vTotVlComissao    := vTotVlComissao + vVlComissao;
            vTotFOB           := vTotFOB + vFOB;
            vTotEnquadramento := vTotEnquadramento + vEnquadramento;

            vPesoKG        := 0;
            vQuantidade    := 0;
            vVMLE          := 0;
            vValorTotalUSD := 0;
            vPcComissao    := 0;
            vVlComissao    := 0;
            vFOB           := 0;
            vEnquadramento := 0;

          end;

          // Insere a linha 'Total Geral', incluindo a somatória de todos os valores, discernindo as moedas.

          ExcelWS.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp))].HorizontalAlignment := xlCenter;
          ExcelWS.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp))].VerticalAlignment := xlCenter;
          ExcelWS.Range['F'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'F'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].HorizontalAlignment := xlRight;
          ExcelWS.Range['F'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'F'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].VerticalAlignment := xlCenter;

          ExcelWS.Range['H'+InttoStr(Linha)+':H'+InttoStr(Linha+High(TotaisExp)), 'H'+InttoStr(Linha)+':H'+InttoStr(Linha+High(TotaisExp))].HorizontalAlignment := xlCenter;
          ExcelWS.Range['J'+InttoStr(Linha)+':J'+InttoStr(Linha+High(TotaisExp)), 'J'+InttoStr(Linha)+':J'+InttoStr(Linha+High(TotaisExp))].HorizontalAlignment := xlCenter;
          ExcelWS.Range['L'+InttoStr(Linha)+':L'+InttoStr(Linha+High(TotaisExp)), 'L'+InttoStr(Linha)+':L'+InttoStr(Linha+High(TotaisExp))].HorizontalAlignment := xlCenter;
          ExcelWS.Range['O'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'O'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].HorizontalAlignment := xlCenter;

          ExcelWS.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Orientation := 0;
          ExcelWS.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].AddIndent := False;
          ExcelWS.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].IndentLevel := 0;
          ExcelWS.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].ShrinkToFit := False;
          ExcelWS.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].ReadingOrder := xlContext;

          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Interior.Pattern := xlSolid;
          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Interior.PatternColorIndex := xlAutomatic;
          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Interior.Color := 10092543;
          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Font.Bold := True;
          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Borders.LineStyle := xlContinuous;
          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Borders.ColorIndex := 0;
          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Borders.Weight := xlMedium;

          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp))].MergeCells := False;
          ExcelWS.Cells.Range['A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp)), 'A'+InttoStr(Linha)+':E'+InttoStr(Linha+High(TotaisExp))].Merge(EmptyParam);
          ExcelWS.Cells.Range['I'+InttoStr(Linha)+':I'+InttoStr(Linha+High(TotaisExp)), 'I'+InttoStr(Linha)+':I'+InttoStr(Linha+High(TotaisExp))].Merge(EmptyParam);
          ExcelWS.Cells.Range['J'+InttoStr(Linha)+':J'+InttoStr(Linha+High(TotaisExp)), 'J'+InttoStr(Linha)+':J'+InttoStr(Linha+High(TotaisExp))].Merge(EmptyParam);
          ExcelWS.Cells.Range['K'+InttoStr(Linha)+':K'+InttoStr(Linha+High(TotaisExp)), 'K'+InttoStr(Linha)+':K'+InttoStr(Linha+High(TotaisExp))].Merge(EmptyParam);
          ExcelWS.Cells.Range['N'+InttoStr(Linha)+':N'+InttoStr(Linha+High(TotaisExp)), 'N'+InttoStr(Linha)+':N'+InttoStr(Linha+High(TotaisExp))].Merge(EmptyParam);
          ExcelWS.Cells.Range['O'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp)), 'O'+InttoStr(Linha)+':O'+InttoStr(Linha+High(TotaisExp))].Merge(EmptyParam);
          ExcelWS.Cells.Range['P'+InttoStr(Linha)+':P'+InttoStr(Linha+High(TotaisExp)), 'P'+InttoStr(Linha)+':P'+InttoStr(Linha+High(TotaisExp))].Merge(EmptyParam);

          ExcelWS.Range['A'+InttoStr(Linha)+':A'+InttoStr(Linha), 'A'+InttoStr(Linha)+':A'+InttoStr(Linha)].Value2 := 'TOTAL GERAL';

          for I := 0 to High(TotaisExp) do
          begin
            ExcelWS.Cells.Range['I'+InttoStr(Linha+I), 'I'+InttoStr(Linha+I)].Value2 := TotaisExp[I].TTVMLE;
            ExcelWS.Cells.Range['J'+InttoStr(Linha+I), 'J'+InttoStr(Linha+I)].Value2 := DeParaMoeda(TotaisExp[I].Moeda);

          end;

          ExcelWS.Cells.Range['F'+InttoStr(Linha), 'F'+InttoStr(Linha)].Value2 := vTotPesoKG;
          ExcelWS.Cells.Range['G'+InttoStr(Linha), 'G'+InttoStr(Linha)].Value2 := vTotQuantidade;
          ExcelWS.Cells.Range['H'+InttoStr(Linha), 'H'+InttoStr(Linha)].Value2 := DeParaUnidMedida(qry_result_expCD_UN_MEDIDA.AsString);
          ExcelWS.Cells.Range['K'+InttoStr(Linha), 'K'+InttoStr(Linha)].Value2 := vTotValorTotalUSD;
          ExcelWS.Cells.Range['L'+InttoStr(Linha), 'L'+InttoStr(Linha)].Value2 := vTotPcComissao;
          ExcelWS.Cells.Range['M'+InttoStr(Linha), 'M'+InttoStr(Linha)].Value2 := vTotVlComissao;
          ExcelWS.Cells.Range['N'+InttoStr(Linha), 'N'+InttoStr(Linha)].Value2 := vTotFOB;
          ExcelWS.Cells.Range['O'+InttoStr(Linha), 'O'+InttoStr(Linha)].Value2 := vTotEnquadramento;

          datm_main.db_broker.Rollback;
        except
          If datm_main.db_broker.InTransaction then
             datm_main.db_broker.Rollback;

        end;
      end;


      ExcelApp.Visible[1] := True;
      ExcelWS.Disconnect;
      ExcelWB.Disconnect;
      ExcelApp.Disconnect;
      FreeAndNil(ExcelWS);
      FreeAndNil(ExcelWB);
      FreeAndNil(ExcelApp);

      If vTipo = 'IMP' then
      begin
        qry_result_imp.Close;
        qry_result_imp.SQL := SQL;

        qry_result_imp.ParamByName('CD_MERCADORIA').AsString := vCodMercadoria;
        qry_result_imp.ParamByName('NR_LAUDO').AsString      := vCodLaudo;
        qry_result_imp.ParamByName('CD_MAT_PRI').AsString    := vCodMatPrima;

        qry_result_imp.Open;

      If qry_result_imp.State in [dsBrowse] then
         qry_result_imp.Edit;

        qry_result_imp.EnableControls;
      end
      else
      If vTipo = 'EXP' then
      begin
        qry_result_exp.Close;
        qry_result_exp.SQL := SQL;
        qry_result_exp.ParamByName('CD_MERCADORIA').AsString := vCodMercadoria;
        qry_result_exp.ParamByName('NR_LAUDO').AsString      := vCodLaudo;

        qry_result_exp.Open;

        If qry_result_exp.State in [dsBrowse] then
           qry_result_exp.Edit;

        qry_result_exp.EnableControls;
      end;

    except

     If datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;

      ExcelApp.Visible[1] := True;
      ExcelWS.Disconnect;
      ExcelWB.Disconnect;
      ExcelApp.Disconnect;
      FreeAndNil(ExcelWS);
      FreeAndNil(ExcelWB);
      FreeAndNil(ExcelApp);

      If vTipo = 'IMP' then
      begin
        qry_result_imp.Close;
        qry_result_imp.SQL := SQL;

        qry_result_imp.ParamByName('CD_MERCADORIA').AsString := vCodMercadoria;
        qry_result_imp.ParamByName('NR_LAUDO').AsString      := vCodLaudo;
        qry_result_imp.ParamByName('CD_MAT_PRI').AsString    := vCodMatPrima;

        qry_result_imp.Open;

      If qry_result_imp.State in [dsBrowse] then
         qry_result_imp.Edit;

        MessageDlg('Ocorreu um erro! Por favor, tente novamente', mtError, [mbOK], 0);

        qry_result_imp.EnableControls;
      end
      else
      If vTipo = 'EXP' then
      begin
        qry_result_exp.Close;
        qry_result_exp.SQL := SQL;

        qry_result_exp.ParamByName('CD_MERCADORIA').AsString := vCodMercadoria;
        qry_result_exp.ParamByName('NR_LAUDO').AsString      := vCodLaudo;

        qry_result_exp.Open;

      If qry_result_exp.State in [dsBrowse] then
         qry_result_exp.Edit;

        MessageDlg('Ocorreu um erro! Por favor, tente novamente', mtError, [mbOK], 0);

        qry_result_exp.EnableControls;
      end;

    end;
  end;
end;

procedure Tfrm_gera_drawback.edtEmpresaNacChange(Sender: TObject);
begin
   If Trim(ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', Trim(edtEmpresaNac.Text) ,'NM_EMPRESA')) <> '' then
      edtNmEmpresa.Text := Trim(ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', Trim(edtEmpresaNac.Text) ,'NM_EMPRESA'))
   else
      edtNmEmpresa.Text := '';


end;

procedure Tfrm_gera_drawback.btnConsultaClick(Sender: TObject);
begin
  edtEmpresaNac.Text := ConsultaOnLineEx('TEMPRESA_NAC','Empresa Nacional',['CD_EMPRESA','NM_EMPRESA'],['Código da Empresa','Nome da Empresa'],'CD_EMPRESA',nil);
end;

procedure Tfrm_gera_drawback.edtEmpresaNacExit(Sender: TObject);
begin
    If Trim(edtEmpresaNac.Text) <> '' then
    begin
      edtEmpresaNac.Text := FormatFloat('00000', StrtoFloat(edtEmpresaNac.Text));
    end;
end;

procedure Tfrm_gera_drawback.edtEmpresaNacKeyPress(Sender: TObject;
  var Key: Char);
begin
   If not (Key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', #8]) then
      Abort;
      
end;

procedure Tfrm_gera_drawback.dbgrd_result_impDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with dbgrd_result_imp do
  begin
    if (gdSelected in state) then
      begin
        Canvas.Brush.Color := clNavy;
        Canvas.Font.Color  := clWhite;
      end;
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure Tfrm_gera_drawback.dbgrd_result_expDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with dbgrd_result_exp do
  begin
    if (gdSelected in state) then
      begin
        Canvas.Brush.Color := clNavy;
        Canvas.Font.Color  := clWhite;
      end;
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure Tfrm_gera_drawback.btn_salvarClick(Sender: TObject);
begin
  If vTipo = 'EXP' Then
  begin
    If not (qry_result_exp.State in [dsInactive, dsInsert]) then
    begin
      If MessageDlg('Atenção: As alterações feitas serão salvas permanentemente nos laudos.'+#13#10
                   +'Você tem certeza de que deseja fazer isso?', mtWarning, [mbYes, mbNo], 0) = mrYes
      then

        try
          qry_result_exp.ApplyUpdates;
        except
          Showmessage('Ocorreu um erro. Por favor, tente novamente.'+#13#10+'Caso o erro persista, entre em contato com o departamento de TI.');
        end;
          btn_salvar.Enabled := False;
    end;
  end
  else
  If vTipo = 'IMP' then
  begin
    If not (qry_result_imp.State in [dsInactive, dsInsert]) then
    begin
      If MessageDlg('Atenção: As alterações feitas serão salvas permanentemente nos laudos.'+#13#10
                   +'Você tem certeza de que deseja fazer isso?', mtWarning, [mbYes, mbNo], 0) = mrYes
      then

        try
          qry_result_imp.ApplyUpdates;
        except
          Showmessage('Ocorreu um erro. Por favor, tente novamente.'+#13#10+'Caso o erro persista, entre em contato com o departamento de TI.');
        end;
          btn_salvar.Enabled := False;
    end;
  end;

end;

procedure Tfrm_gera_drawback.dbgrd_result_impCellClick(Column: TColumn);
begin
   If not (qry_result_imp.State in [dsInactive]) then
    begin
      If qry_result_imp.RecordCount = 0 then
         btn_excluir.Enabled := False
      Else
         btn_excluir.Enabled := True;  
    end;
end;

procedure Tfrm_gera_drawback.dbgrd_result_expCellClick(Column: TColumn);
begin
  If not (qry_result_exp.State in [dsInactive]) then
  begin
    If qry_result_exp.RecordCount = 0 then
      btn_excluir.Enabled := False
    Else
      btn_excluir.Enabled := True;
  end;
end;

procedure Tfrm_gera_drawback.ds_result_expDataChange(Sender: TObject;
  Field: TField);
begin
  If qry_result_exp.State in [dsEdit] then
    begin
      btn_salvar.Enabled  := True;
    end;
end;

procedure Tfrm_gera_drawback.btn_cancelar_matpriClick(Sender: TObject);
begin
  qry_result_exp.Cancel;
end;

procedure Tfrm_gera_drawback.btn_excluirClick(Sender: TObject);
begin
   If vTipo = 'EXP' then
   begin
     If MessageDlg('Você tem certeza de que deseja excluir este item?', mtWarning, [mbYes, mbNo], 0 ) = mrYes then
       begin
         qry_result_exp.Delete;
         btn_salvar.Enabled := True;

         If qry_result_exp.EOF then
           btn_excluir.Enabled := False;
       end;
   end
   else
   If vTipo = 'IMP' then
   begin
     If MessageDlg('Você tem certeza de que deseja excluir este item?', mtWarning, [mbYes, mbNo], 0 ) = mrYes then
       begin
         qry_result_imp.Delete;
         btn_salvar.Enabled := True;

         If qry_result_imp.EOF then
           btn_excluir.Enabled := False;
       end;
   end;
end;

procedure Tfrm_gera_drawback.ds_result_impDataChange(Sender: TObject;
  Field: TField);
begin
  If qry_result_imp.State in [dsEdit] then
    begin
      btn_salvar.Enabled  := True;
    end;
end;

end.

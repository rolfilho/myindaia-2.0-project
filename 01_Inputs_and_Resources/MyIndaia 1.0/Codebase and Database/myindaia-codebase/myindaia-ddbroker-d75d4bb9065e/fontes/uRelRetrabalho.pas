unit uRelRetrabalho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, FileText,
  Dialogs, Buttons, StdCtrls, Mask, ToolEdit, ExtCtrls, ConsOnlineEx, Funcoes,
  ComObj, DBTables, ComCtrls;
         
type
  TFrmRelRetrabalho = class(TForm)
    PnlBotoes: TPanel;
    btn_sair: TBitBtn;                                        
    BtnGerar: TBitBtn;
    Panel1: TPanel;
    msk_dt_inicio: TDateEdit;
    msk_dt_fim: TDateEdit;
    lbl_periodo: TLabel;
    lbl_a: TLabel;
    lblGrupo: TLabel;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    btn_co_grupo: TSpeedButton;
    PB: TProgressBar;
    LblCarregando: TLabel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_produto: TSpeedButton;
    edt_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    lbl1: TLabel;
    msk_nr_processo: TMaskEdit;
    lbl_processo: TLabel;
    btn_co_processo: TSpeedButton;
    Label1: TLabel;
    msk_cd_celula: TMaskEdit;
    edt_nm_celula: TEdit;
    btn_co_celula: TSpeedButton;
    Label2: TLabel;
    btn_co_evento: TSpeedButton;
    msk_cd_evento: TMaskEdit;
    edt_nm_evento: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    msk_dt_inicio_e314: TDateEdit;
    msk_dt_fim_e314: TDateEdit;
    Label5: TLabel;
    Label6: TLabel;
    msk_dt_inicio_e132: TDateEdit;
    msk_dt_fim_e132: TDateEdit;
    lblModal: TLabel;
    btn_co_modal: TSpeedButton;
    msk_cd_modal: TMaskEdit;
    edt_nm_modal: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure BtnGerarClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure btn_co_celulaClick(Sender: TObject);
    procedure btn_co_eventoClick(Sender: TObject);
    procedure btn_co_modalClick(Sender: TObject);
  private
    procedure GeraExcel;
    procedure GeraLinhaAzul;
  public
    tp_rel : Byte;
  end;

var
  FrmRelRetrabalho: TFrmRelRetrabalho;

implementation

uses PGGP001, DB;

const
  xlNone             = -4142;
  xlContinuous       =     1;
  xlThin             =     2;
  xlDiagonalDown     =     5;
  xlDiagonalUp       =     6;
  xlEdgeLeft         =     7;
  xlEdgeTop          =     8;
  xlEdgeBottom       =     9;
  xlEdgeRight        =    10;
  xlInsideVertical   =    11;
  xlInsideHorizontal =    12;

{$R *.dfm}

procedure TFrmRelRetrabalho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Datm_InstrDesemb.Free;
  Action := caFree;
end;

procedure TFrmRelRetrabalho.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelRetrabalho.btn_co_grupoClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    msk_cd_grupo.Text := ConsultaOnLineEx('TGRUPO','Grupo de Empresas',['CD_GRUPO','NM_GRUPO'],['Código','Descrição'],'CD_GRUPO', frm_main.mi_cad_cli, 1, msk_cd_grupo.Text)
  else if Trim(msk_cd_grupo.Text) = '' then
    edt_nm_grupo.Text := 'Todos'
  else
    edt_nm_grupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', msk_cd_grupo.Text,'NM_GRUPO');
end;

procedure TFrmRelRetrabalho.msk_cd_grupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_celula then btn_co_celulaClick(btn_co_celula);
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = msk_cd_produto then btn_co_produtoClick(btn_co_produto);
    if Sender = msk_cd_grupo then btn_co_grupoClick(btn_co_grupo);
    if Sender = msk_cd_evento then btn_co_eventoClick(btn_co_evento);
    if Sender = msk_nr_processo then btn_co_processoClick(btn_co_processo);
    if Sender = msk_cd_modal then btn_co_modalClick(btn_co_modal);
  end;
end;

procedure TFrmRelRetrabalho.msk_cd_grupoExit(Sender: TObject);
begin
  ValCodEdt(msk_cd_grupo);
end;

procedure TFrmRelRetrabalho.GeraExcel;
var
  ExcelApp, WorkBook, Sheet, Range: OleVariant;
  Linha: Integer;
  vQuery: TQuery;
begin
  try
    try
      vQuery := TQuery.Create(Application);

      vQuery.DatabaseName := 'DBBROKER';

      vQuery.SQL.Add('DECLARE @CD_CELULA   CHAR(2)  = :CD_CELULA');
      vQuery.SQL.Add('DECLARE @CD_UNID_NEG CHAR(2)  = :CD_UNID_NEG');
      vQuery.SQL.Add('DECLARE @CD_PRODUTO  CHAR(2)  = :CD_PRODUTO');
      vQuery.SQL.Add('DECLARE @CD_GRUPO    CHAR(3)  = :CD_GRUPO');
      vQuery.SQL.Add('DECLARE @CD_EVENTO   CHAR(3)  = :CD_EVENTO');
      vQuery.SQL.Add('DECLARE @DT_INICIAL  CHAR(10) = :DT_INICIAL');
      vQuery.SQL.Add('DECLARE @DT_FINAL    CHAR(10) = :DT_FINAL');
      vQuery.SQL.Add('DECLARE @DT_INICIAL_E314  CHAR(10) = :DT_INICIAL_E314');
      vQuery.SQL.Add('DECLARE @DT_FINAL_E314    CHAR(10) = :DT_FINAL_E314');
      vQuery.SQL.Add('DECLARE @DT_INICIAL_E132  CHAR(10) = :DT_INICIAL_E132');
      vQuery.SQL.Add('DECLARE @DT_FINAL_E132    CHAR(10) = :DT_FINAL_E132');
      vQuery.SQL.Add('DECLARE @NR_PROCESSO CHAR(18) = :NR_PROCESSO');
      vQuery.SQL.Add('DECLARE @CD_VIA_TRANSPORTE CHAR(2) = :CD_VIA_TRANSPORTE');
      vQuery.SQL.Add('');
      vQuery.SQL.Add('SELECT DISTINCT ISNULL(RTRIM(CL.CD_CELULA) + '' - '' + RTRIM(CL.NM_CELULA), '''') AS [Célula Atendimento],');
      vQuery.SQL.Add('                ISNULL(RTRIM(GR.NM_GRUPO), '''') AS [Grupo Cliente],');
      vQuery.SQL.Add('                ISNULL(RTRIM(FE.NR_PROCESSO), '''') AS [Processo],');
      vQuery.SQL.Add('                ISNULL(RTRIM(FE.CD_ETAPA), '''') AS [Cód. Etapa],');
      vQuery.SQL.Add('                ISNULL(RTRIM(ET.NM_ETAPA), '''') AS [Etapa],');
      vQuery.SQL.Add('                ISNULL(RTRIM(ET.CD_EVENTO), '''') AS [Cód. Evento],');
      vQuery.SQL.Add('                ISNULL(RTRIM(EV.NM_EVENTO), '''') AS [Evento],');
      vQuery.SQL.Add('                ISNULL(CONVERT(VARCHAR, FE.DT_ALTERACAO, 103), '''') AS [Data Retrabalho],');
      vQuery.SQL.Add('                ISNULL(CONVERT(VARCHAR, FE.DT_ALTERACAO, 108), '''') AS [Hora Retrabalho],');
      vQuery.SQL.Add('                ISNULL(RTRIM(UE.NM_USUARIO), '''') AS [Nome Usuário],');
      vQuery.SQL.Add('                ISNULL(RTRIM(EM.NM_EMPRESA), '''') AS [Cliente],');
      vQuery.SQL.Add('                ISNULL(RTRIM(AG.NM_AGENTE), '''') AS [Armador],');
      vQuery.SQL.Add('                ISNULL(RTRIM(TR.NM_TRANSP_ROD), '''') AS [Transportador],');
//        vQuery.SQL.Add('                MASTER.DBO.FN_RETIRA_CARACTER(MASTER.DBO.ROWCONCATLEFT(DISTINCT ISNULL(RTRIM(RF.CD_REFERENCIA), '''') + '', ''), '', '') AS [Referencia],');
      vQuery.SQL.Add(' Cast(ISNULL(STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK) WHERE R.NR_PROCESSO   = PR.NR_PROCESSO ');
      vQuery.SQL.Add('            AND R.TP_REFERENCIA = ( CASE WHEN PR.CD_PRODUTO=''01'' THEN ''01'' ELSE ''08'' END ) FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300)) AS [Referencia], ');

      vQuery.SQL.Add(' Cast(ISNULL(STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK) WHERE R.NR_PROCESSO   = PR.NR_PROCESSO ');
      vQuery.SQL.Add('            AND R.TP_REFERENCIA = ( CASE WHEN PR.CD_PRODUTO=''01'' THEN ''01'' ELSE ''01'' END ) FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300)) AS [Pedido], ');

      vQuery.SQL.Add('                ISNULL(RTRIM(AR.NM_AREA), '''') AS [Área],');
      vQuery.SQL.Add('                ISNULL(RTRIM(VT.NM_VIA_TRANSPORTE), '''') AS [Via de Transporte],');
      vQuery.SQL.Add('                ISNULL(RTRIM(UA.NM_USUARIO), '''') AS [Atendente],');
      vQuery.SQL.Add('                ISNULL(RTRIM(PD.DESCRICAO), '''') AS [País de Destino],');
      vQuery.SQL.Add('                ISNULL(RTRIM(PO.DESCRICAO), '''') AS [Pais de Origem]');
      vQuery.SQL.Add('FROM TFOLLOWUP_ETAPA           FE (NOLOCK)');
      vQuery.SQL.Add('   INNER JOIN TETAPA           ET (NOLOCK) ON ET.CD_ETAPA = FE.CD_ETAPA');
      vQuery.SQL.Add('   INNER JOIN TPROCESSO        PR (NOLOCK) ON PR.NR_PROCESSO = FE.NR_PROCESSO');
      vQuery.SQL.Add('   LEFT  JOIN TCELULA          CL (NOLOCK) ON CL.CD_CELULA = PR.CD_CELULA');
      vQuery.SQL.Add('   INNER JOIN TEMPRESA_NAC     EM (NOLOCK) ON EM.CD_EMPRESA = PR.CD_CLIENTE');
      vQuery.SQL.Add('   INNER JOIN TGRUPO           GR (NOLOCK) ON GR.CD_GRUPO = EM.CD_GRUPO');
     vQuery.SQL.Add('   LEFT  JOIN TEVENTO          EV (NOLOCK) ON EV.CD_EVENTO = ET.CD_EVENTO');
      vQuery.SQL.Add('   LEFT  JOIN TUSUARIO         UE (NOLOCK) ON UE.CD_USUARIO = FE.CD_USUARIO');
      vQuery.SQL.Add('   LEFT  JOIN TAGENTE          AG (NOLOCK) ON AG.CD_AGENTE = PR.CD_AGENTE');
      vQuery.SQL.Add('   LEFT  JOIN TTRANSP_ROD      TR (NOLOCK) ON TR.CD_TRANSP_ROD = PR.CD_TRANSP_NAC');
//        vQuery.SQL.Add('   LEFT  JOIN TREF_CLIENTE     RF (NOLOCK) ON RF.NR_PROCESSO = FE.NR_PROCESSO AND RF.TP_REFERENCIA = CASE PR.CD_PRODUTO');
//        vQuery.SQL.Add('                                                                                                         WHEN ''01'' THEN GR.TP_PEDIDO_BUSCA_IMP');
//        vQuery.SQL.Add('                                                                                                     ELSE GR.TP_PEDIDO_BUSCA');
//        vQuery.SQL.Add('                                                                                                     END');
      vQuery.SQL.Add('   INNER JOIN TAREA            AR (NOLOCK) ON AR.CD_AREA = PR.CD_AREA');
      vQuery.SQL.Add('   LEFT  JOIN VW_SERVICO_GERAL SV (NOLOCK) ON SV.CD_SERVICO = PR.CD_SERVICO');
      vQuery.SQL.Add('   LEFT  JOIN TVIA_TRANSPORTE  VT (NOLOCK) ON VT.CD_VIA_TRANSPORTE = SV.CD_VIA_TRANSPORTE');
      vQuery.SQL.Add('   LEFT  JOIN TUSUARIO         UA (NOLOCK) ON UA.CD_USUARIO = CL.CD_ANALISTA');
      vQuery.SQL.Add('   LEFT  JOIN TPAIS            PD (NOLOCK) ON PD.CODIGO = PR.CD_PAIS_DESTINO');
      vQuery.SQL.Add('   LEFT  JOIN TPAIS            PO (NOLOCK) ON PO.CODIGO = PR.CD_PAIS_ORIGEM');
      vQuery.SQL.Add('   LEFT  JOIN TFOLLOWUP        E314 (NOLOCK) ON E314.NR_PROCESSO = PR.NR_PROCESSO AND E314.CD_EVENTO = ''314''');
      vQuery.SQL.Add('   LEFT  JOIN TFOLLOWUP        E132 (NOLOCK) ON E132.NR_PROCESSO = PR.NR_PROCESSO AND E132.CD_EVENTO = ''132''');
      vQuery.SQL.Add('WHERE ET.IN_RETRABALHO  = ''1''');
      vQuery.SQL.Add('  AND @CD_CELULA IN ('''', PR.CD_CELULA)');
      vQuery.SQL.Add('  AND @CD_UNID_NEG IN ('''', PR.CD_UNID_NEG)');
      vQuery.SQL.Add('  AND @CD_PRODUTO IN ('''', PR.CD_PRODUTO)');
      vQuery.SQL.Add('  AND @CD_GRUPO IN ('''', EM.CD_GRUPO)');
      vQuery.SQL.Add('  AND @CD_EVENTO IN ('''', ET.CD_EVENTO)');
      vQuery.SQL.Add('  AND @CD_VIA_TRANSPORTE IN ('''', VT.CD_VIA_TRANSPORTE)');


      if (msk_dt_inicio.date <> 0) and (msk_dt_fim.date <> 0) then
        vQuery.SQL.Add('  AND FE.DT_ALTERACAO BETWEEN CONVERT (DATETIME, @DT_INICIAL, 103) AND CONVERT (DATETIME, @DT_FINAL, 103) + CONVERT(DATETIME, ''23:59:59'', 108)');
      if (msk_dt_inicio_e314.date <> 0) and (msk_dt_fim_e314.date <> 0) then
        vQuery.SQL.Add('  AND E314.DT_REALIZACAO BETWEEN CONVERT (DATETIME, @DT_INICIAL_E314, 103) AND CONVERT (DATETIME, @DT_FINAL_E314, 103) + CONVERT(DATETIME, ''23:59:59'', 108)');
      if (msk_dt_inicio_e132.date <> 0) and (msk_dt_fim_e132.date <> 0) then
        vQuery.SQL.Add('  AND E132.DT_REALIZACAO BETWEEN CONVERT (DATETIME, @DT_INICIAL_E132, 103) AND CONVERT (DATETIME, @DT_FINAL_E132, 103) + CONVERT(DATETIME, ''23:59:59'', 108)');

      vQuery.SQL.Add('  AND @NR_PROCESSO IN ('''', PR.NR_PROCESSO)');
      vQuery.SQL.Add('GROUP BY CL.CD_CELULA, CL.NM_CELULA, GR.NM_GRUPO, FE.NR_PROCESSO, FE.CD_ETAPA, ET.NM_ETAPA, ET.CD_EVENTO, EV.NM_EVENTO,');
      vQuery.SQL.Add('         CONVERT(VARCHAR, FE.DT_ALTERACAO, 103), CONVERT(VARCHAR, FE.DT_ALTERACAO, 108), UE.NM_USUARIO, EM.NM_EMPRESA,');
      vQuery.SQL.Add('         AG.NM_AGENTE, TR.NM_TRANSP_ROD, AR.NM_AREA, VT.NM_VIA_TRANSPORTE, UA.NM_USUARIO, PD.DESCRICAO, PO.DESCRICAO, PR.CD_PRODUTO, PR.NR_PROCESSO');
      vQuery.SQL.Add('ORDER BY [Cód. Etapa], [Processo]');

      vQuery.ParamByName('CD_CELULA').AsString   := msk_cd_celula.Text;
      vQuery.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      vQuery.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
      vQuery.ParamByName('CD_GRUPO').AsString    := msk_cd_grupo.Text;
      vQuery.ParamByName('CD_EVENTO').AsString   := msk_cd_evento.Text;
      vQuery.ParamByName('DT_INICIAL').AsString  := msk_dt_inicio.Text;
      vQuery.ParamByName('DT_FINAL').AsString    := msk_dt_fim.Text;
      vQuery.ParamByName('DT_INICIAL_E314').AsString  := msk_dt_inicio_e314.Text;
      vQuery.ParamByName('DT_FINAL_E314').AsString    := msk_dt_fim_e314.Text;
      vQuery.ParamByName('DT_INICIAL_E132').AsString  := msk_dt_inicio_e132.Text;
      vQuery.ParamByName('DT_FINAL_E132').AsString  := msk_dt_fim_e132.Text;
      vQuery.ParamByName('NR_PROCESSO').AsString := msk_nr_processo.Text;
      vQuery.ParamByName('CD_VIA_TRANSPORTE').AsString := msk_cd_modal.Text;

      vQuery.Open;
      vQuery.Last;
      PB.Max := vQuery.RecordCount;
      if vQuery.RecordCount > 0 then
      begin
        ExcelApp := CreateOLEObject('Excel.Application');
        WorkBook := ExcelApp.Workbooks.Open(cDir_RPT + '\RetrabalhosNovo.xls');
        if FileExists(cDir_RPT + '\RetrabalhosNovo_' + msk_cd_grupo.Text + '.xls') then
          DeleteFile(cDir_RPT + '\RetrabalhosNovo_' + msk_cd_grupo.Text + '.xls');
        WorkBook.SaveAs(cDir_RPT + '\RetrabalhosNovo_' + msk_cd_grupo.Text + '.xls');
        Sheet := WorkBook.Worksheets[1];
        ExcelApp.Visible := True;

        Sheet.Cells[2, 5].Value := 'Célula: ' + Trim(msk_cd_celula.Text) + ' - ' + Trim(edt_nm_celula.Text);
        Sheet.Cells[3, 5].Value := 'Unidade: ' + Trim(msk_cd_unid_neg.Text) + ' - ' + Trim(edt_nm_unid_neg.Text);
        Sheet.Cells[4, 5].Value := 'Produto: ' + Trim(msk_cd_produto.Text) + ' - ' + Trim(edt_nm_produto.Text);
        Sheet.Cells[5, 5].Value := 'Grupo: ' + Trim(msk_cd_grupo.Text) + ' - ' + Trim(edt_nm_grupo.Text);
        Sheet.Cells[6, 5].Value := 'Evento: ' + Trim(msk_cd_evento.Text) + ' - ' + Trim(edt_nm_evento.Text);
        Sheet.Cells[7, 5].Value := 'Período: ' + Trim(msk_dt_inicio.Text) + ' a ' + Trim(msk_dt_fim.Text);
        Sheet.Cells[8, 5].Value := 'Processo: ' + Trim(msk_nr_processo.Text);

        PB.Visible            := True;
        LblCarregando.Visible := True;
        Linha                 := 11;
        vQuery.First;

        Application.ProcessMessages;
        while not vQuery.Eof do
        begin
          Sheet.Cells[Linha,  1].Value := vQuery.Fields[ 0].AsString;
          Sheet.Cells[Linha,  2].Value := vQuery.Fields[ 1].AsString;
          Sheet.Cells[Linha,  3].Value := vQuery.Fields[ 2].AsString;
          Sheet.Cells[Linha,  4].Value := vQuery.Fields[ 3].AsString;
          Sheet.Cells[Linha,  5].Value := vQuery.Fields[ 4].AsString;
          Sheet.Cells[Linha,  6].Value := vQuery.Fields[ 5].AsString;
          Sheet.Cells[Linha,  7].Value := vQuery.Fields[ 6].AsString;
          Sheet.Cells[Linha,  8].Value := vQuery.Fields[ 7].AsDateTime;
          Sheet.Cells[Linha,  9].Value := vQuery.Fields[ 8].AsDateTime;
          Sheet.Cells[Linha, 10].Value := vQuery.Fields[ 9].AsString;
          Sheet.Cells[Linha, 11].Value := vQuery.Fields[10].AsString;
          Sheet.Cells[Linha, 12].Value := vQuery.Fields[11].AsString;
          Sheet.Cells[Linha, 13].Value := vQuery.Fields[12].AsString;
          Sheet.Cells[Linha, 14].Value := vQuery.Fields[13].AsString;
          Sheet.Cells[Linha, 15].Value := vQuery.Fields[14].AsString;
          Sheet.Cells[Linha, 16].Value := vQuery.Fields[15].AsString;
          Sheet.Cells[Linha, 17].Value := vQuery.Fields[16].AsString;
          Sheet.Cells[Linha, 18].Value := vQuery.Fields[17].AsString;
          Sheet.Cells[Linha, 19].Value := vQuery.Fields[18].AsString;
          Sheet.Cells[Linha, 20].Value := vQuery.Fields[19].AsString;

          Range := Sheet.Range['A' + IntToStr(Linha) + ':T' + IntToStr(Linha)];
          Range.Borders[xlDiagonalDown].LineStyle := xlNone;
          Range.Borders[xlDiagonalUp].LineStyle := xlNone;
          Range.Borders[xlEdgeLeft].LineStyle := xlContinuous;
          Range.Borders[xlEdgeLeft].ThemeColor := 1;
          Range.Borders[xlEdgeLeft].TintAndShade := -0.249977111117893;
          Range.Borders[xlEdgeLeft].Weight := xlThin;
          Range.Borders[xlEdgeTop].LineStyle := xlContinuous;
          Range.Borders[xlEdgeTop].ThemeColor := 1;
          Range.Borders[xlEdgeTop].TintAndShade := -0.249977111117893;
          Range.Borders[xlEdgeTop].Weight := xlThin;
          Range.Borders[xlEdgeBottom].LineStyle := xlContinuous;
          Range.Borders[xlEdgeBottom].ThemeColor := 1;
          Range.Borders[xlEdgeBottom].TintAndShade := -0.249977111117893;
          Range.Borders[xlEdgeBottom].Weight := xlThin;
          Range.Borders[xlEdgeRight].LineStyle := xlContinuous;
          Range.Borders[xlEdgeRight].ThemeColor := 1;
          Range.Borders[xlEdgeRight].TintAndShade := -0.249977111117893;
          Range.Borders[xlEdgeRight].Weight := xlThin;
          Range.Borders[xlInsideVertical].LineStyle := xlContinuous;
          Range.Borders[xlInsideVertical].ThemeColor := 1;
          Range.Borders[xlInsideVertical].TintAndShade := -0.249977111117893;
          Range.Borders[xlInsideVertical].Weight := xlThin;
          Range.Borders[xlInsideHorizontal].LineStyle := xlContinuous;
          Range.Borders[xlInsideHorizontal].ThemeColor := 1;
          Range.Borders[xlInsideHorizontal].TintAndShade := -0.249977111117893;
          Range.Borders[xlInsideHorizontal].Weight := xlThin;

          Inc(Linha);
          PB.Position := PB.Position + 1;
          vQuery.Next;
        end;
        Close;
        WorkBook.Save;
      end
      else
        BoxMensagem('Não há registros no período informado.', 3);
      vQuery.Free;
    finally
      LblCarregando.Visible := False;
      PB.Visible            := False;
      PB.Position           := 0;
    end;
  except
    Application.MessageBox('Verifique se a planilha já está aberta. Salve-a e feche-a!', 'Erro na criação da Planilha.', MB_OK + MB_ICONERROR) ;
    Exit;
  end;
end;

procedure TFrmRelRetrabalho.BtnGerarClick(Sender: TObject);
begin
  if tp_rel <> 1 then
  begin
    if (Trim(msk_cd_unid_neg.Text) = '') then
    begin
      BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;

    if (Trim(msk_cd_produto.Text) = '') then
    begin
      BoxMensagem( 'Informe um Produto!', 2 );
      msk_cd_produto.SetFocus;
      Exit;
    end;
  end;

  if msk_dt_inicio.Date <> 0 then
    if msk_dt_fim.Date = 0 then
    begin
      BoxMensagem( 'Informe a Data Final do período!', 2 );
      msk_dt_fim.SetFocus;
      Exit;
    end;

  case tp_rel of
    1: GeraExcel;
    2: begin
        if (msk_dt_inicio.Date = 0) or (msk_dt_fim.Date = 0)  then
        begin
          BoxMensagem( 'Informe o Periodo Analisado!', 2 );
          msk_dt_fim.SetFocus;
          Exit;
        end
        else
         GeraLinhaAzul;
       end;
  end;
end;

procedure TFrmRelRetrabalho.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negociação',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  else if Trim(msk_cd_unid_neg.Text) = '' then
    edt_nm_unid_neg.Text := 'Todas'
  else
    edt_nm_unid_neg.Text := ConsultaLookUp('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure TFrmRelRetrabalho.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Unidade de Negociação',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  else if Trim(msk_cd_produto.Text) = '' then
    edt_nm_produto.Text := 'Todos'
  else
    edt_nm_produto.Text := ConsultaLookUp('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'NM_PRODUTO');
end;

procedure TFrmRelRetrabalho.msk_cd_produtoExit(Sender: TObject);
begin
  ValCodEdt(msk_cd_produto);
end;

procedure TFrmRelRetrabalho.msk_cd_unid_negExit(Sender: TObject);
begin
  ValCodEdt(msk_cd_unid_neg);
end;

procedure TFrmRelRetrabalho.FormShow(Sender: TObject);
begin
  msk_dt_inicio.Date := dt_server;
  msk_dt_fim.Date    := dt_server;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);

  case tp_rel of
  1: FrmRelRetrabalho.Caption := 'Relação de Retrabalhos';
  2: begin
       FrmRelRetrabalho.Caption := 'Linha Azul';
       msk_nr_processo.Visible := False;
       btn_co_processo.Visible := False;
       lbl_processo.Visible := False;
     end;
  end;

  if tp_rel = 1 then
  begin
    msk_cd_celula.Enabled := True;
    msk_cd_celula.Color   := clWindow;
    msk_cd_evento.Enabled := True;
    msk_cd_evento.Color   := clWindow;
    msk_cd_modal.Enabled := True;
    msk_cd_modal.Color   := clWindow;
    ActiveControl := msk_cd_celula;
  end;
end;

procedure TFrmRelRetrabalho.btn_co_processoClick(Sender: TObject);
var
  vListAux : TStringList;
  processo : String;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT RTRIM(SUBSTRING(PR.NR_PROCESSO, 1, 18)) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  if msk_cd_grupo.Text <> '' then
    vListAux.Add('  AND PR.CD_GRUPO  = ''' + msk_cd_grupo.Text + '''');
  processo := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;

  msk_nr_processo.Text := processo;
end;

procedure TFrmRelRetrabalho.GeraLinhaAzul;
var
  Arquivo : TextFile;
  Caminho : String;
  vQuery : TQuery;
begin
  vQuery := TQuery.Create(Application);
  try
    vQuery.DatabaseName := 'DBBROKER';
    vQuery.SQL.Clear;
    vQuery.SQL.Add(' SELECT DI.NR_DECLARACAO_IMP, AI.NR_ADICAO, DM.NR_ITEM AS DETALHE, DM.NR_PROC_PO, DM.NR_ITEM_PO,');
    vQuery.SQL.Add('        ISNULL((SELECT TOP 1 RIGHT( ''000000'' + RTRIM(NR_NOTA),6) FROM TPROCESSO_NF NF ');
    vQuery.SQL.Add('        WHERE NF.NR_PROCESSO = DM.NR_PROCESSO AND NF.VL_NOTA IS NOT NULL ORDER BY NR_NOTA ASC), ''000000'') AS NR_NOTA,');
    vQuery.SQL.Add('        ISNULL((SELECT TOP 1 CONVERT(VARCHAR, DT_NOTA, 103) FROM TPROCESSO_NF NF ');
    vQuery.SQL.Add('        WHERE NF.NR_PROCESSO = DM.NR_PROCESSO AND NF.VL_NOTA IS NOT NULL ORDER BY NR_NOTA ASC), ''000000'') AS DT_NOTA ');
    vQuery.SQL.Add(' FROM TDECLARACAO_IMPORTACAO DI ');
    vQuery.SQL.Add('   INNER JOIN TADICAO_DE_IMPORTACAO AI ON AI.NR_PROCESSO = DI.NR_PROCESSO ');
    vQuery.SQL.Add('   INNER JOIN TDETALHE_MERCADORIA   DM ON DM.NR_PROCESSO = AI.NR_PROCESSO AND DM.NR_ADICAO = AI.NR_ADICAO ');
    vQuery.SQL.Add('   INNER JOIN TPROCESSO             P  ON P.NR_PROCESSO  = DI.NR_PROCESSO ');
    vQuery.SQL.Add('   INNER JOIN TFOLLOWUP             F  ON F.NR_PROCESSO  = DI.NR_PROCESSO AND F.CD_EVENTO = ''021'' ');
    vQuery.SQL.Add(' WHERE F.DT_REALIZACAO BETWEEN CONVERT (DATETIME, :DT_INI, 103) AND CONVERT (DATETIME,  :DT_FIM, 103)');
    if msk_cd_unid_neg.Text  <> '' then
      vQuery.SQL.Add('  AND P.CD_UNID_NEG = :CD_UNID_NEG ');
    if msk_cd_produto.Text  <> '' then
      vQuery.SQL.Add('  AND P.CD_PRODUTO  = :CD_PRODUTO ');
    if msk_cd_grupo.Text    <> '' then
      vQuery.SQL.Add('  AND P.CD_GRUPO   = :CD_GRUPO ');
    vQuery.SQL.Add('   AND DI.NR_PROCESSO IN (SELECT NR_PROCESSO FROM TPROCESSO_NF NF WHERE NF.VL_NOTA IS NOT NULL) ');
    vQuery.SQL.Add(' ORDER BY DM.NR_PROC_PO, DM.NR_ITEM_PO, DI.NR_DECLARACAO_IMP, AI.NR_ADICAO ');

    vQuery.ParamByName('DT_INI').AsDateTime    := msk_dt_inicio.Date;
    vQuery.ParamByName('DT_FIM').AsDateTime    := msk_dt_fim.Date;
    if msk_cd_unid_neg.Text <> '' then
      vQuery.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    if msk_cd_produto.Text  <> '' then
      vQuery.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    if msk_cd_grupo.Text    <> '' then
      vQuery.ParamByName('CD_GRUPO').AsString    := msk_cd_grupo.Text;
    vQuery.Open;

    if vQuery.RecordCount > 0 then
    try
      Caminho := cDir_Rpt + '\Linha_Azul.txt';
      AssignFile(Arquivo, Caminho);
      ReWrite(Arquivo);
      PB.Visible            := True;
      LblCarregando.Visible := True;
      LblCarregando.Refresh;

      While not vQuery.EOF do
      begin
        PB.Position := PB.Position + 1;
        Writeln(Arquivo, vQuery.FieldByName('NR_DECLARACAO_IMP').AsString + ';' + vQuery.FieldByName('NR_ADICAO').AsString + ';' + vQuery.FieldByName('DETALHE').AsString + ';' +
                       vQuery.FieldByName('NR_PROC_PO').AsString + ';' + vQuery.FieldByName('NR_ITEM_PO').AsString + ';' + vQuery.FieldByName('NR_NOTA').AsString + ';' +
                       vQuery.FieldByName('DT_NOTA').AsString);
        Flush(Arquivo);
        vQuery.Next;
      end;
      CloseFile(Arquivo);
      vQuery.Free;
      LblCarregando.Visible := False;
      PB.Visible            := False;
      PB.Position           := 0;
    except
      Application.MessageBox('Erro na criação do Arquivo. Contate o TI!', 'Erro na criação do Arquivo.', MB_OK + MB_ICONERROR) ;
      Exit;
    end
    else
      BoxMensagem('Não há registros no período informado.', 3);
  finally
    freeandnil(vQuery)
  end;
end;

procedure TFrmRelRetrabalho.btn_co_celulaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_celula.Text := ConsultaOnLineEx('TCELULA', 'Célula', ['CD_CELULA', 'NM_CELULA'], ['Código', 'Nome'], 'CD_CELULA', nil)
  else if Trim(msk_cd_celula.Text) = '' then
    edt_nm_celula.Text := 'Todas'
  else
    edt_nm_celula.Text := ConsultaLookUp('TCELULA', 'CD_CELULA', msk_cd_celula.Text, 'NM_CELULA');
end;

procedure TFrmRelRetrabalho.btn_co_eventoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_evento.Text := ConsultaOnLineEx('TEVENTO', 'Eventos', ['CD_EVENTO', 'NM_EVENTO'], ['Código', 'Nome'], 'CD_EVENTO', nil)
  else if Trim(msk_cd_evento.Text) = '' then
    edt_nm_evento.Text := 'Todos'
  else
    edt_nm_evento.Text := ConsultaLookUp('TEVENTO', 'CD_EVENTO', msk_cd_evento.Text, 'NM_EVENTO');
end;

procedure TFrmRelRetrabalho.btn_co_modalClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_modal.Text := ConsultaOnLineEx('TVIA_TRANSPORTE', 'Serviços', ['CD_VIA_TRANSPORTE', 'NM_VIA_TRANSPORTE'], ['Código', 'Nome'], 'CD_VIA_TRANSPORTE', nil)
  else if Trim(msk_cd_modal.Text) = '' then
    edt_nm_modal.Text := 'Todos'
  else
    edt_nm_modal.Text := ConsultaLookUp('TVIA_TRANSPORTE', 'CD_VIA_TRANSPORTE', msk_cd_modal.Text, 'NM_VIA_TRANSPORTE');
end;

end.







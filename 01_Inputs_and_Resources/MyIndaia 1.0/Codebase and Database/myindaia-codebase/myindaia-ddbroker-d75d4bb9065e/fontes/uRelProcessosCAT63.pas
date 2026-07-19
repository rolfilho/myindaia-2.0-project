unit uRelProcessosCAT63;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, DB, DBTAbles, ComObj, ExcelXp;

type
  TfrmRelProcessosCAT63 = class(TForm)
    Panel1: TPanel;
    Shape2: TShape;
    Shape1: TShape;
    Label2: TLabel;
    Label3: TLabel;
    btn_cd_empresa: TSpeedButton;
    lbl_cd_cliente: TLabel;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    Label4: TLabel;
    btn_geraplanilha: TButton;
    btn_fechar: TButton;                                  
    mskedt_periodo_final: TMaskEdit;
    mskedt_periodo_inicial: TMaskEdit;
    mskedt_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    mskedt_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    Panel2: TPanel;
    Shape3: TShape;
    Shape4: TShape;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    SpeedButton3: TSpeedButton;
    Label8: TLabel;
    Button2: TButton;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Edit2: TEdit;
    Button1: TButton;
    Edit1: TEdit;
    chkICMSEmitido: TCheckBox;
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    tp_rel : char;
    procedure RelatorioCAT63;
    { Private declarations }
  public
    procedure CriaRelatorio (tiporelatorio : char);
    { Public declarations }
  end;

var
  frmRelProcessosCAT63: TfrmRelProcessosCAT63;

implementation

{$R *.dfm}

uses Funcoes, ConsOnLineEx;

procedure TfrmRelProcessosCAT63.RelatorioCAT63;

  function MontaStrNFeCFOP( pProcesso : string ; pTipo : Integer ) : String;
  var
    vStrAux, vUltimo : String;
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT * FROM TPROCESSO_NF WHERE NR_PROCESSO = ''' + pProcesso + '''');
      if pTipo = 1 then
        SQL.Add('ORDER BY NR_NOTA')
      else SQL.Add('ORDER BY CD_CFOP');
      Open;
      First;
      vUltimo := 'BLÁBLÁBLÁ';
      while not EOF do
      begin
        if pTipo = 1 then
        begin
          if Trim(FieldByName('NR_NOTA').AsString) <> '' then
          begin
            if vUltimo <> FieldByName('NR_NOTA').AsString then
            begin
              vStrAux := vStrAux + ' - ' + FieldByName('NR_NOTA').AsString;
              vUltimo := FieldByName('NR_NOTA').AsString;
            end;
          end;
        end
        else if pTipo = 2 then
        begin
          if Trim(FieldByName('CD_CFOP').AsString) <> '' then
          begin
            if vUltimo <> FieldByName('CD_CFOP').AsString then
            begin
              vStrAux := vStrAux + ' - ' + Trim(Copy(FieldByName('CD_CFOP').AsString,1,1)+'.'+Copy(FieldByName('CD_CFOP').AsString,2,Length(FieldByName('CD_CFOP').AsString)));
              vUltimo := FieldByName('CD_CFOP').AsString;
            end;
          end;
        end
        else
        begin
          if Trim(FieldByName('VL_NOTA').AsString) <> '' then
          begin
            if vUltimo <> FieldByName('VL_NOTA').AsString then
            begin
              vStrAux := vStrAux + ' - R$ ' + FieldByName('VL_NOTA').AsString;
              vUltimo := FieldByName('VL_NOTA').AsString;
            end;
          end;
        end;
        Next;
      end;
      Close;
      Free;
    end;
    Result := Trim(Copy(vStrAux,3,Length(vStrAux)));
  end;

var
  nLinha: integer;
  Excel, xlWorkB, oSheet : OleVariant;
  vInicioRange, vFimRange : Integer;
  vProcessoRange, vUltimaAdicao : String;
  vSomaICMS : Real;
  vColor : Integer;
const
  xlCenter = $00000002;  // alinhamento vertical = centro
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('  SELECT DI.NR_PROCESSO, DM.NR_ADICAO, DM.NR_PROC_PO, DM.NR_ITEM_PO,                                                                                           ');
    SQL.Add('         DI.CD_IMPORTADOR, EN.NM_EMPRESA, DI.DT_REGISTRO_DI, DI.NR_DECLARACAO_IMP, AI.VL_ICMS_CALCULADO, DM.CD_MERCADORIA, ME.AP_MERCADORIA                    ');
    // Query alterada por Michel em 12/05/2009 para não validar sempre o campo de emissão de CAT63 e para comparar a data do Followup ao invés da data de registro da DI
    if tp_rel = '0' then   // instrução que retona os registros que tem permissão de CAT e ja tem a Exoneração e a GARE emitidas.
    begin
      SQL.Add('  FROM TDECLARACAO_IMPORTACAO DI, TFOLLOWUP FU , TPROCESSO_STATUS_ICMS SI, TADICAO_DE_IMPORTACAO AI, TDETALHE_MERCADORIA DM, TEMPRESA_NAC EN, TMERCADORIA ME ');
      SQL.Add('  WHERE FU.NR_PROCESSO = DI.NR_PROCESSO                                                                                                                      ');
      SQL.Add('    AND FU.CD_EVENTO = "021"                                                                                                                                 ');
      SQL.Add('    AND SI.NR_PROCESSO = DI.NR_PROCESSO                                                                                                                      ');
      if chkICMSEmitido.Checked then
        SQL.Add('    AND SI.IN_ICMS_EMITIDO = "2"                                                                                                                           ');
      SQL.Add('    AND AI.NR_PROCESSO = DI.NR_PROCESSO                                                                                                                      ');
      SQL.Add('    AND AI.IN_PERMITE_CAT63 = "1"                                                                                                                            ');
    end
    else
    begin
      SQL.Add('  FROM TDECLARACAO_IMPORTACAO DI, TFOLLOWUP FU , TADICAO_DE_IMPORTACAO AI, TDETALHE_MERCADORIA DM, TEMPRESA_NAC EN, TMERCADORIA ME                           ');
      SQL.Add('  WHERE FU.NR_PROCESSO        = DI.NR_PROCESSO                                                                                                               ');
      SQL.Add('    AND FU.CD_EVENTO          = "021"                                                                                                                        ');
      SQL.Add('    AND AI.NR_PROCESSO        = DI.NR_PROCESSO                                                                                                               ');
      SQL.Add('    AND AI.CD_TRIBUTACAO_ICMS = "5"                                                                                                                          ');
      SQL.Add('    AND AI.CD_FUND_LEGAL_ICMS = "074"                                                                                                                        ');
    end;
      SQL.Add('    AND DM.NR_PROCESSO   = DI.NR_PROCESSO                                                                                                                    ');
      SQL.Add('    AND DM.NR_ADICAO     = AI.NR_ADICAO                                                                                                                      ');
      SQL.Add('    AND EN.CD_EMPRESA    = DI.CD_IMPORTADOR                                                                                                                  ');
      SQL.Add('    AND ME.CD_MERCADORIA = DM.CD_MERCADORIA                                                                                                                  ');
      SQL.Add('    AND FU.DT_REALIZACAO BETWEEN CONVERT(DATETIME, :DATAINICIO, 103) AND CONVERT(DATETIME, :DATAFIM, 103)                                                    ');
      SQL.Add('    AND LEFT(DI.NR_PROCESSO, 2) = :UNIDADE                                                                                                                   ');
      //SQL.Add('    AND DT_REGISTRO_DI IS NOT NULL                                                                                                                           ');

      SQL.Add('GROUP BY DI.NR_PROCESSO, DM.NR_ADICAO, DM.NR_PROC_PO, DM.NR_ITEM_PO, DI.CD_IMPORTADOR, EN.NM_EMPRESA, DI.DT_REGISTRO_DI, DI.NR_DECLARACAO_IMP, AI.VL_ICMS_CALCULADO, DM.CD_MERCADORIA, ME.AP_MERCADORIA');
    // parametros
    ParamByName('DATAINICIO').AsString := MaskEdit2.Text;
    ParamByName('DATAFIM').AsString    := MaskEdit1.Text;
    ParamByName('UNIDADE').AsString    := Edit1.Text;
    // abre a tabela e verifica se contém dados para exibir
    Open;
    First;
    if IsEmpty then
      ShowMessage('Não há dados para exibir')
    else begin
      // se retornar algum registro
      try
        // abre o RELATORIOCAT63.XLS e salva como RELATORIOCAT63 + DATA_ATUAL
        Excel := CreateOLEObject('Excel.Application');
        xlWorkB := Excel.Workbooks.Open( 'C:\DDBROKER\RELATORIOCAT63.XLS' );
        Excel.ActiveWorkBook.SaveAs( 'C:\DDBROKER\RELATORIOCAT63_' + Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');
        // evita que retornem mensagens de alerta de merge, como " as celulas que vc esta tentando mesclar contem valores... "
        Excel.DisplayAlerts := False;
        oSheet := Excel.WorkBooks[1].Worksheets[1];
      except
        ShowMessage('Erro na criação da Planilha.');
        Exit;
      end;

      nLinha := 8;
      // variaveis de controle de range para mesclar, sempre que mudar o processo ele refaz as variaveis para controlar o merge
      vInicioRange := 9;
      vFimRange := 9;
      vProcessoRange := FieldByName('NR_PROCESSO').AsString;  // primeiro processo da instrução acima
      vUltimaAdicao  := '';  // primeira adição do processo
//      vSomaICMS := vSomaICMS + FieldByName('VL_ICMS_CALCULADO').AsFloat;

      // apresenta o período selecionado na tela, no relatório
      oSheet.Cells[ 03, 11 ].Value := Trim(MaskEdit2.Text + ' - ' + MaskEdit1.Text);
      if tp_rel = '1' then // qdo for tipo suspenso incluir coluna com o valor total da nota
      begin
        oSheet.Cells[ 6, 12 ].Interior.ColorIndex := 49;
        oSheet.Cells[ 7, 12 ].Interior.ColorIndex := 49;
        oSheet.Cells[ 2, 4 ].value := 'Relação de Pedidos com ICMS SUSPENSO';
        oSheet.Cells[ 10, 12 ].Interior.ColorIndex := 49;
      end;
      while not EOF do
      begin
        // insere uma linha em branco, para que vá empurrando a linha de totais para baixo, mantendo as formulas todas da planilha original, a RELATORIOCAT63
        if tp_rel = '0' then // qdo for tipo suspenso incluir coluna com o valor total da nota
          oSheet.Range['A'+IntToStr(nLinha+1), 'K'+IntToStr(nLinha+1)].Insert
        else
          oSheet.Range['A'+IntToStr(nLinha+1), 'L'+IntToStr(nLinha+1)].Insert;
        nLinha := nLinha + 1;
        oSheet.Cells[ nLinha, 01 ].value  := FieldByName('NR_PROC_PO').AsString;
        oSheet.Cells[ nLinha, 02 ].value  := FieldByName('NR_ITEM_PO').AsString;
        oSheet.Cells[ nLinha, 03 ].value  := Copy(FieldByName('NR_PROCESSO').AsString,5,11);
        oSheet.Cells[ nLinha, 04 ].value  := ' ' + FieldByName('CD_MERCADORIA').AsString;
        oSheet.Cells[ nLinha, 05 ].value  := FieldByName('AP_MERCADORIA').AsString;
        oSheet.Cells[ nLinha, 06 ].value  := FieldByName('NM_EMPRESA').AsString;
        oSheet.Cells[ nLinha, 07 ].value  := Trim(Copy(FieldByName('NR_DECLARACAO_IMP').AsString,1,2)+'/'+Copy(FieldByName('NR_DECLARACAO_IMP').AsString,3,Length(FieldByName('NR_DECLARACAO_IMP').AsString)));
        oSheet.Cells[ nLinha, 08 ].value  := ' ' + Trim(Copy(FieldByName('DT_REGISTRO_DI').AsString,1,2)+'/'+Copy(FieldByName('DT_REGISTRO_DI').AsString,3,2)+'/'+Copy(FieldByName('DT_REGISTRO_DI').AsString,5,4));
        // acumula o valor do ICMS para que mostre apenas o total das adições na nona coluna da planilha
        if vUltimaAdicao <> FieldByName('NR_ADICAO').AsString then
        begin
          vSomaICMS := vSomaICMS + FieldByName('VL_ICMS_CALCULADO').AsFloat;
          vUltimaAdicao := FieldByName('NR_ADICAO').AsString;  // primeiro processo da instrução acima
        end;
        // montar string com todas as NFs do processo, e claro, mesclar...
        oSheet.Cells[ nLinha, 10 ].value  := ' ' + MontaStrNFeCFOP(FieldByName('NR_PROCESSO').AsString,1);
        // montar string com todos os CFOPs do processo, e claro, mesclar...
        oSheet.Cells[ nLinha, 11 ].value  := ' ' + MontaStrNFeCFOP(FieldByName('NR_PROCESSO').AsString,2);
        if tp_rel = '1' then // qdo for tipo suspenso incluir coluna com o valor total da nota
          oSheet.Cells[ nLinha, 12 ].value  := ' ' + MontaStrNFeCFOP(FieldByName('NR_PROCESSO').AsString,3);
        Next;
        // se trocar o processo ou for o ultimo registro, ele aplica o merge desse ultimo processo, mesclando as celulas de algumas das colunas
        if ( vProcessoRange <> FieldByName('NR_PROCESSO').AsString ) or ( EOF ) then
        begin
          if vColor = 34 then
            vColor := 35
          else vColor := 34;
          oSheet.Cells[ vInicioRange, 09 ].value  := vSomaICMS;
          vSomaICMS := 0;
          vUltimaAdicao  := '';  // primeiro processo da instrução acima
          oSheet.Range['C'+IntToStr(vInicioRange), 'C'+IntToStr(vFimRange)].Merge;
          oSheet.Range['C'+IntToStr(vInicioRange), 'C'+IntToStr(vFimRange)].VerticalAlignment := xlCenter;
          oSheet.Range['F'+IntToStr(vInicioRange), 'F'+IntToStr(vFimRange)].Merge;
          oSheet.Range['F'+IntToStr(vInicioRange), 'F'+IntToStr(vFimRange)].VerticalAlignment := xlCenter;
          oSheet.Range['G'+IntToStr(vInicioRange), 'G'+IntToStr(vFimRange)].Merge;
          oSheet.Range['G'+IntToStr(vInicioRange), 'G'+IntToStr(vFimRange)].VerticalAlignment := xlCenter;
          oSheet.Range['H'+IntToStr(vInicioRange), 'H'+IntToStr(vFimRange)].Merge;
          oSheet.Range['H'+IntToStr(vInicioRange), 'H'+IntToStr(vFimRange)].VerticalAlignment := xlCenter;
          oSheet.Range['I'+IntToStr(vInicioRange), 'I'+IntToStr(vFimRange)].Merge;
          oSheet.Range['I'+IntToStr(vInicioRange), 'I'+IntToStr(vFimRange)].VerticalAlignment := xlCenter;
          oSheet.Range['J'+IntToStr(vInicioRange), 'J'+IntToStr(vFimRange)].Merge;
          oSheet.Range['J'+IntToStr(vInicioRange), 'J'+IntToStr(vFimRange)].VerticalAlignment := xlCenter;
          oSheet.Range['K'+IntToStr(vInicioRange), 'K'+IntToStr(vFimRange)].Merge;
          oSheet.Range['K'+IntToStr(vInicioRange), 'K'+IntToStr(vFimRange)].VerticalAlignment := xlCenter;
          oSheet.Range['L'+IntToStr(vInicioRange), 'L'+IntToStr(vFimRange)].Merge;
          oSheet.Range['L'+IntToStr(vInicioRange), 'L'+IntToStr(vFimRange)].VerticalAlignment := xlCenter;
          // muda a cor da seleção de celulas por processo
          if tp_rel = '0' then
            oSheet.Range['A'+IntToStr(vInicioRange), 'K'+IntToStr(vFimRange)].Interior.ColorIndex := vColor
          else
            oSheet.Range['A'+IntToStr(vInicioRange), 'L'+IntToStr(vFimRange)].Interior.ColorIndex := vColor;
          vProcessoRange := FieldByName('NR_PROCESSO').AsString;
          vInicioRange := nLinha + 1;
          vFimRange := vInicioRange;
        end else begin
          // ou então incrementa a variavel vFimRange com + 1, aumentando a mescla de celulas, até que o processo mude.
          vFimRange := vFimRange + 1;
        end;
      end;
      oSheet.Range['L1', 'L' + IntToStr(vFimRange)].Columns.AutoFit;
      oSheet.Rows[ 8 ].Delete;
      oSheet.Rows[ vInicioRange - 1 ].Delete;

      Screen.Cursor := crDefault;
      Excel.Visible := True;
      ShowMessage('Planilha gerada com sucesso');
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
    end;
    Close;
    Free;
  end;
end;

procedure TfrmRelProcessosCAT63.SpeedButton3Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
    Edit1.Text := ConsultaOnLineEx('TUNID_NEG', 'Unidades', ['CD_UNID_NEG','NM_UNID_NEG'], ['Código','Nome'], 'CD_UNID_NEG', nil)
  else
    Edit2.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', Edit1.Text, 'NM_UNID_NEG');
end;

procedure TfrmRelProcessosCAT63.Edit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_F5 then
    SpeedButton3Click(SpeedButton3);
end;

procedure TfrmRelProcessosCAT63.Button1Click(Sender: TObject);
begin
  RelatorioCAT63;
end;

procedure TfrmRelProcessosCAT63.CriaRelatorio(tiporelatorio: char);
begin
  tp_rel := tiporelatorio;
  if tp_rel = '0' then
    label8.Caption := 'Relatório de processos CAT63'
  else
    label8.Caption := 'Relatório de processos ICMS SUSPENSO';
  chkICMSEmitido.Visible := (tp_rel = '0');
  ShowModal;
end;

end.

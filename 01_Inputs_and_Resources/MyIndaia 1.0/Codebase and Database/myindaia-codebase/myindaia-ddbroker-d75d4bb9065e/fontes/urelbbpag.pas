unit uRelBBPag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, Buttons, ExtCtrls, Db, DBTables, ComObj, ExcelXp,
  DBCtrls;

type
  Tfrm_RelBBPag = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    lbl_cd_cliente: TLabel;
    lbl_cd_unid_neg: TLabel;
    Panel2: TPanel;
    Shape3: TShape;
    Shape4: TShape;
    Label1: TLabel;
    Label5: TLabel;
    lblUnidNeg: TLabel;
    lblTitulo: TLabel;
    edt_nm_unid_neg: TEdit;
    lblTipo: TLabel;
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    cbTipo: TComboBox;
    btnGerar: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    btn_co_unid_neg: TSpeedButton;
    sp_loop_campo: TStoredProc;
    Label2: TLabel;
    cbTipoDetino: TComboBox;
    procedure cbTipoChange(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGerarClick(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RelBBPagNumerarios;
    procedure RelBBPag_Pagamentos;
  end;

var
  frm_RelBBPag: Tfrm_RelBBPag;

implementation

Uses ConsOnLineEx, GSMLIB, PGGP001, PGGP017;

{$R *.dfm}

procedure Tfrm_RelBBPag.cbTipoChange(Sender: TObject);
begin
  lblTitulo.Caption := 'Relatório de ' + cbTipo.Text;
end;

procedure Tfrm_RelBBPag.msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_grupo    then btn_co_grupoClick(nil);
  end
end;

procedure Tfrm_RelBBPag.btn_co_grupoClick(Sender: TObject);
begin
  if (Sender is TMaskEdit) and (msk_cd_grupo.Text <> '') then msk_cd_grupo.Text :=  FStrZero(msk_cd_grupo.Text, 3);
  if Sender is TSpeedButton then
    msk_cd_grupo.Text := ConsultaOnLineEx('TGRUPO', 'Grupos', ['CD_GRUPO','NM_GRUPO'], ['Código','Nome'], 'CD_GRUPO', nil)
  else edt_nm_grupo.Text := ConsultaLookUP('TGRUPO', 'CD_GRUPO', msk_cd_grupo.Text, 'NM_GRUPO');
  if msk_cd_grupo.Text = '' then edt_nm_grupo.Text := 'Todos';
end;

procedure Tfrm_RelBBPag.btn_co_unid_negClick(Sender: TObject);
begin
  if (Sender is TMaskEdit) and (msk_cd_unid_neg.Text <> '') then msk_cd_unid_neg.Text :=  FStrZero(msk_cd_unid_neg.Text, 2);
  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG', 'Unidades', ['CD_UNID_NEG','NM_UNID_NEG'], ['Código','Nome'], 'CD_UNID_NEG', nil)
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text, 'NM_UNID_NEG');
  if msk_cd_unid_neg.Text = '' then edt_nm_unid_neg.Text := 'Todos';
end;

procedure Tfrm_RelBBPag.btnGerarClick(Sender: TObject);
begin
  if cbTipo.ItemIndex <> -1 then
  case cbTipo.ItemIndex of
    0: RelBBPAgNumerarios;
    1: RelBBPAg_Pagamentos;
  end;
end;

procedure Tfrm_RelBBPag.RelBBPagNumerarios;
var
  Excel, xlWorkB, oSheet : OleVariant;
  vLinha : Integer;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Add('  SELECT P.NR_PROCESSO, PA.DESCRICAO NM_PAIS, I.NM_ITEM, NI.VL_SOLICITADO, NI.VL_SOLICITADO VL_ITEM,');
    SQL.Add('   (SELECT SUM(NI.VL_SOLICITADO) FROM TNUMERARIO_NOTIFICA_ITEM NI');
    SQL.Add(' 			WHERE NI.NR_PROCESSO = NN.NR_PROCESSO AND NI.NR_SOLICITACAO = NN.NR_SOLICITACAO) VL_NUMERARIO');
    SQL.Add('  FROM TPROCESSO P');
    SQL.Add('    INNER JOIN TPAIS PA ON PA.CODIGO = P.CD_PAIS_DESTINO');
    SQL.Add('    INNER JOIN TNUMERARIO_NOTIFICA NN ON NN.NR_PROCESSO = P.NR_PROCESSO');
    SQL.Add('    INNER JOIN TNUMERARIO_NOTIFICA_ITEM NI ON NI.NR_PROCESSO = NN.NR_PROCESSO AND NI.NR_SOLICITACAO = NN.NR_SOLICITACAO');
    SQL.Add('    INNER JOIN TITEM I ON I.CD_ITEM = NI.CD_ITEM');
    SQL.Add(' WHERE (P.CD_UNID_NEG = :CD_UNID_NEG OR ( :CD_UNID_NEG = '''' ) )');
    SQL.Add('   AND (P.CD_GRUPO	  = :CD_GRUPO OR ( :CD_GRUPO = '''' ) )');
    SQL.Add('   AND NN.DT_EMISSAO BETWEEN :DT_INI AND :DT_FIM');
    if cbTipoDetino.ItemIndex <> 0 then
      SQL.Add(' AND NI.TP_DESTINO = ' + IntToStr(cbTipoDetino.ItemIndex -1) + '');
    Close;
    ParamByName('CD_UNID_NEG').AsString:= msk_cd_unid_neg.Text;
    ParamByName('CD_GRUPO').AsString   := msk_cd_grupo.Text;
    ParamByName('DT_INI').AsDateTime := msk_dt_inicio.DateTime;
    ParamByName('DT_FIM').AsDateTime := msk_dt_fim.DateTime;
    Open;

    if RecordCount > 0 then
    try
    begin
      Excel := CreateOleObject('Excel.Application');
      xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\Relatório BBPAG-Numerario.XLS' );
      Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\Relatório BBPAG-Numerario' + Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');
      oSheet := Excel.Workbooks[1].WorkSheets[1];
      oSheet.Cells[3,  4].Value := edt_nm_unid_neg.Text;
      oSheet.Cells[5,  4].Value := edt_nm_grupo.Text;
      oSheet.Cells[6,  3].Value := 'Período: ' + FormatDateTime('dd/mm/yyyy', msk_dt_inicio.Date) + ' a ' + FormatDateTime('dd/mm/yyyy', msk_dt_fim.DateTime);

      vLinha := 8;
      while not EOF do
      begin
        oSheet.Cells[vLinha, 1].Value := FieldByName('NR_PROCESSO').AsString;
        oSheet.Cells[vLinha, 2].Value := FieldByName('NM_PAIS').AsString;
        oSheet.Cells[vLinha, 3].Value := FieldByName('VL_NUMERARIO').AsFloat;
        oSheet.Cells[vLinha, 4].Value := FieldByName('NM_ITEM').AsString;
        oSheet.Cells[vLinha, 5].Value := FieldByName('VL_ITEM').AsFloat;
        vLinha := vLinha + 1;
        Next;
      end;
    end;
      Screen.Cursor := crDefault;
      Excel.Visible := True;
      ShowMessage('Planilha gerada com sucesso');
      Screen.Cursor := crDefault;
      Application.ProcessMessages;

    except
      ShowMessage('Erro na criação da Planilha.');
      Excel.Quit;
      Free;
      Exit;
    end
    else
      BoxMensagem('Não há registros para os filtros selecionados.', 3);
  end;
end;

procedure Tfrm_RelBBPag.RelBBPag_Pagamentos;
var
  Excel, xlWorkB, oSheet : OleVariant;
  vLinha : Integer;
  vCdreferencia, vNrProcesso : String;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Add(' SELECT P.NR_PROCESSO, CONVERT(VARCHAR, SP.DT_PAGTO, 103) DT_PAGTO, I.NM_ITEM, ISNULL(SP.VL_PAGTO, 0) VL_PAGTO, ');
    SQL.Add('   ISNULL(SUM(SP.VL_BBPAG), 0) VL_BBPAG');
    SQL.Add('  FROM TPROCESSO P');
    SQL.Add('    INNER JOIN TSOLIC_PAGTO SP ON SP.NR_PROCESSO = P.NR_PROCESSO');
    SQL.Add('    LEFT JOIN TNUMERARIO_NOTIFICA_ITEM NI ON NI.NR_PROCESSO = P.NR_PROCESSO AND NI.CD_ITEM = SP.CD_ITEM AND NI.IN_CANCELADO = ''0'' ');
    SQL.Add('    INNER JOIN TITEM I ON I.CD_ITEM = SP.CD_ITEM');
    SQL.Add(' WHERE (P.CD_UNID_NEG = :CD_UNID_NEG OR ( :CD_UNID_NEG = '''' ) )');
    SQL.Add('   AND (P.CD_GRUPO	  = :CD_GRUPO OR ( :CD_GRUPO = '''' ) )');
    SQL.Add('   AND SP.DT_PAGTO BETWEEN :DT_INI AND :DT_FIM');
    SQL.Add('   AND ISNULL(SP.DT_CANCELAMENTO, '''') = ''''');
    if cbTipoDetino.ItemIndex <> 0 then
      SQL.Add(' AND SP.TP_DESTINO = ' + IntToStr(cbTipoDetino.ItemIndex -1) + '');
    SQL.Add(' GROUP BY P.NR_PROCESSO, CONVERT(VARCHAR, SP.DT_PAGTO, 103), I.NM_ITEM, SP.VL_PAGTO');
    Close;
    ParamByName('CD_UNID_NEG').AsString:= msk_cd_unid_neg.Text;
    ParamByName('CD_GRUPO').AsString   := msk_cd_grupo.Text;
    ParamByName('DT_INI').AsDateTime := msk_dt_inicio.DateTime;
    ParamByName('DT_FIM').AsDateTime := msk_dt_fim.DateTime;
    Open;

    if RecordCount > 0 then
    try
    begin
      Excel := CreateOleObject('Excel.Application');
      xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\Relatório BBPAG-Pagto.XLS' );
      Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\Relatório BBPAG-Pagto' + Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');
      oSheet := Excel.Workbooks[1].WorkSheets[1];
      oSheet.Cells[3,  4].Value := edt_nm_unid_neg.Text;
      oSheet.Cells[5,  4].Value := edt_nm_grupo.Text;
      oSheet.Cells[6,  3].Value := 'Período: ' + FormatDateTime('dd/mm/yyyy', msk_dt_inicio.Date) + ' a ' + FormatDateTime('dd/mm/yyyy', msk_dt_fim.DateTime);

      vLinha := 8;
      while not EOF do
      begin
        vNrProcesso := FieldByName('NR_PROCESSO').AsString;
        with sp_loop_campo do
        begin
          CloseStoredProc(sp_loop_campo);
          ParamByName('@CAMPO').AsString := 'CD_REFERENCIA';
          ParamByName('@TABELA').AsString := 'TREF_CLIENTE';
          ParamByName('@WHERE').AsString := 'NR_PROCESSO = '''+ vNrProcesso + ''' AND TP_REFERENCIA = ''01'' ';
          ExecStoredProc(sp_loop_campo);
          vCdreferencia := ParamByName('@Retorno').AsString;
          CloseStoredProc(sp_loop_campo);
        end;
        oSheet.Cells[vLinha, 1].Value := vNrProcesso;
        oSheet.Cells[vLinha, 2].Value := FieldByName('DT_PAGTO').AsString;
        oSheet.Cells[vLinha, 3].Value := vCdreferencia;
        oSheet.Cells[vLinha, 4].Value := FieldByName('NM_ITEM').AsString;
        oSheet.Cells[vLinha, 5].Value := FieldByName('VL_BBPAG').AsFloat;
        oSheet.Cells[vLinha, 6].Value := FieldByName('VL_PAGTO').AsFloat;
{        if FieldByName('VL_SOLICITADO').AsFloat = 0 then
          oSheet.Range['A' +IntToStr(vLinha) +':F' +IntToStr(vLinha)].Font.ColorIndex := 3;}
        vLinha := vLinha + 1;
        Next;
      end;
      Screen.Cursor := crDefault;
      Excel.Visible := True;
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
    end;

    except
      ShowMessage('Erro na criação da Planilha.');
      Excel.Quit;
      Free;
      Exit;
    end
    else
      BoxMensagem('Não há registros para os filtros selecionados.', 3);
  end;
end;


end.

(*************************************************************************************************

//Sistema: DD Broker - Indaiá Logística

//PROGRAMA: PGFT009.PAS - Filtro por processo

//AUTOR: Leandro Stipanich

//DATA: dd/mm/yyyy

//Manutenção: Leandro Stipanich

/Data: 14/09/2001
*************************************************************************************************)
unit PGFT009;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, UCRPE32, ShellAPI, Funcoes, ExcelXP, ComOBJ,
  DBTables;

type
  Tfrm_sel_processo = class(TForm)
    Panel1: TPanel;
    lbl_processo: TLabel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    btn_imprimir: TButton;
    btn_sair: TButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    crp_processo: TCrpe;
    msk_nr_processo: TMaskEdit;
    lbl_despachante: TLabel;
    msk_cd_despachante: TMaskEdit;
    edt_nm_despachante: TEdit;
    btn_co_despachante: TSpeedButton;
    Shape1: TShape;
    btn_co_processo: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GeraPlanCusto(nr_processo : String);
    procedure btn_co_despachanteClick(Sender: TObject);
    procedure msk_cd_despachanteExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    str_cd_relatorio : String;
    {1 - Excluído}
    {5 : Relação de PO´s por Processos}
    c1: String;
    p1, p2, p3: Array[0..1024] of Char;
    pAux : PChar;
  end;

var
  frm_sel_processo: Tfrm_sel_processo;

implementation

{$R *.DFM}

uses GSMLIB, FILETEXT, PGGP001, PGGP017, PGFT010, PGSM010, PGSM018, PGGP015, PGSM136,
  PGSM046;

var
  Arquivo : TFileText;

procedure Tfrm_sel_processo.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_processo.msk_cd_unid_negExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_sel_processo do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '"';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
      end
      else
      begin
        BoxMensagem('Unidade de Negócio não cadastrada!', 2);
        msk_cd_unid_neg.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;
end;

procedure Tfrm_sel_processo.msk_cd_produtoExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_sel_processo do
    begin
      qry_produto_.Close;
      qry_produto_.SQL[2] := 'WHERE CD_PRODUTO = "' + msk_cd_produto.Text + '"';
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.RecordCount > 0 then
      begin
        edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
      end
      else
      begin
        BoxMensagem('Produto não cadastrado!', 2);
        msk_cd_produto.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_produto.Text := '';
  end;
end;

procedure Tfrm_sel_processo.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sel_processo do
  begin
    Application.CreateForm(Tfrm_unidade, frm_unidade );
    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_negExit(nil);
    end;
  end;
end;

procedure Tfrm_sel_processo.btn_co_produtoClick(Sender: TObject);
begin
  with datm_sel_processo do
  begin
    Application.CreateForm(Tfrm_produto, frm_produto );
    with frm_produto do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_produto.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
      msk_cd_produtoExit(nil);
    end;
  end;
end;

procedure Tfrm_sel_processo.btn_imprimirClick(Sender: TObject);
var
  nr_identity: Integer;
  //vExcel: TExcelApplication;
  //vWorkBook: ExcelWorkbook;
  //vSheet: Excel97.ExcelWorksheet;
  vExcel, vWorkBook, vSheet: OleVariant;
  Linha, I: Integer;
begin
  nr_identity := 0;
  if Trim( msk_cd_unid_neg.Text ) = '' then
  begin
    BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if Trim( msk_cd_produto.Text ) = '' then
  begin
    BoxMensagem( 'Informe um Produto!', 2 );
    msk_cd_produto.SetFocus;
    Exit;
  end;

  if Trim( msk_nr_processo.Text ) = '' then
  begin
    BoxMensagem( 'Campo Nº processo deve ser preenchido!', 2 );
    msk_nr_processo.SetFocus;
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  if StrToInt( str_cd_relatorio ) in [2, 7] then
  begin
    with crp_processo do
    begin
      Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      case StrToInt(str_cd_relatorio) of
        2: ReportName  := cDir_Rpt + '\CRGI009.RPT';
        7: ReportName  := cDir_Rpt + '\CRPE005.RPT';
      end;

      ReportTitle := Caption + ' [ ' + msk_nr_processo.Text + ' ]';
      if str_cd_relatorio = '2' then
        ParamFields[0] := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text )
      else
        Formulas[0] := 'Processo = "' + Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text ) + '"';
      Execute;
    end;
  end
  else
  if StrtoInt(str_cd_relatorio) = 4 then
  begin
    datm_main.db_broker.StartTransaction;
    with datm_sel_processo do
    begin
      try
        CloseStoredProc( sp_imprime_itens );
        sp_imprime_itens.ParamByName('@cd_unidade').AsString  := Trim( msk_cd_unid_neg.Text );
        sp_imprime_itens.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
        sp_imprime_itens.ParamByName('@nr_processo').AsString := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
        ExecStoredProc( sp_imprime_itens );
        nr_identity := sp_imprime_itens.ParamByName('@nr_identificador').AsInteger;
        CloseStoredProc( sp_imprime_itens );
        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then
        begin
           datm_main.db_broker.Rollback;
           Exit;
        end;
      end;
      with crp_processo do
      begin
        Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
        ReportName  := cDir_Rpt + '\CRDI002.RPT';
        Formulas[0] := 'nr_identificador = ' + InttoStr( nr_identity );
        Execute;
      end;

      with qry_limpa_aux_ do
      begin
        Close;
        ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identity;
        ExecSQL;
        Close;
      end;
    end;
  end
  else
  if StrtoInt(str_cd_relatorio) = 5 then
  begin
    datm_main.db_broker.StartTransaction;
    with datm_sel_processo do
    begin
      try
        CloseStoredProc( sp_rel_processo_po );
        sp_rel_processo_po.ParamByName('@nr_processo').AsString := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
        ExecStoredProc( sp_rel_processo_po );
        nr_identity := sp_rel_processo_po.ParamByName('@nr_identificador').AsInteger;
        CloseStoredProc( sp_rel_processo_po );
        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then
        begin
          datm_main.db_broker.Rollback;
          Exit;
        end;
      end;
      with crp_processo do
      begin
        Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
        ReportTitle := 'PO´s po Processo - ' + msk_nr_processo.Text;
        ReportName  := cDir_Rpt + '\CRPO003.RPT';
        Formulas[0] := 'NrIdentificador = ' + InttoStr( nr_identity );
        Execute;
      end;

      with datm_sel_processo.qry_limpa_ do
      begin
        Close;
        ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identity;
        ExecSQL;
        Close;
      end;
    end;
  end
  else if ( str_cd_relatorio ) = '6' then
  begin
    datm_main.db_broker.StartTransaction;
    with datm_sel_processo do
    begin
      try
        CloseStoredProc( sp_cont_emb );
        datm_sel_processo.sp_cont_emb.ParamByName('@nr_processo').AsString := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
        ExecStoredProc( sp_cont_emb );
        nr_identity := datm_sel_processo.sp_cont_emb.ParamByName('@nr_identificador').AsInteger;
        CloseStoredProc( sp_cont_emb );
        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then
        begin
          datm_main.db_broker.Rollback;
          Exit;
        end;
      end;

    end;

    with crp_processo do
    begin
      Connect     := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      ReportName  := cDir_Rpt + '\CRFT040.RPT';
      Formulas[0] := 'Nr_Identificador = ' + IntToStr( nr_identity );
      Formulas[1] := 'Despachante = "' + datm_sel_processo.qry_despachante_NM_DESPACHANTE.asString + '"';
      Execute;
    end;

    with datm_sel_processo.qry_del_cont_emb_ do
    begin
      try
        Close;
        ParamByName('NR_IDENTIFICADOR').Value := nr_identity;
        Open;
      except
      end;
    end;
  end
  else
  if ( str_cd_relatorio ) = '8' then
  begin
    with datm_sel_processo do
    begin
      qry_conhecimento_.Close;
      qry_conhecimento_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                               Trim( msk_cd_produto.Text ) +
                                                               Trim( msk_nr_processo.Text );
      qry_conhecimento_.Prepare;
      qry_conhecimento_.Open;

      qry_lote_.Close;
      qry_lote_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                       Trim( msk_cd_produto.Text ) +
                                                       Trim( msk_nr_processo.Text );
      qry_lote_.Prepare;
      qry_lote_.Open;

      qry_cntr_.Close;
      qry_cntr_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                       Trim( msk_cd_produto.Text ) +
                                                       Trim( msk_nr_processo.Text );
      qry_cntr_.Prepare;
      qry_cntr_.Open;

      qry_dados_clientes_.Close;
      qry_dados_clientes_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                                 Trim( msk_cd_produto.Text ) +
                                                                 Trim( msk_nr_processo.Text );
      qry_dados_clientes_.Prepare;
      qry_dados_clientes_.Open;

      qry_end_unid_.Close;
      qry_end_unid_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
      qry_end_unid_.Prepare;
      qry_end_unid_.Open;

      ppsSolic_Desova.Template.FileName := cDir_RPT + '\RBENT001.RTM';
      ppsSolic_Desova.Print;
    end;
  end
  else
  if ( str_cd_relatorio ) = '9' then
  begin
    with datm_sel_processo do
    begin
      qry_conhecimento_.Close;
      qry_conhecimento_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                               Trim( msk_cd_produto.Text ) +
                                                               Trim( msk_nr_processo.Text );
      qry_conhecimento_.Prepare;
      qry_conhecimento_.Open;

      qry_cntr_.Close;
      qry_cntr_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                       Trim( msk_cd_produto.Text ) +
                                                       Trim( msk_nr_processo.Text );
      qry_cntr_.Prepare;
      qry_cntr_.Open;

      qry_dados_clientes_.Close;
      qry_dados_clientes_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                                 Trim( msk_cd_produto.Text ) +
                                                                 Trim( msk_nr_processo.Text );
      qry_dados_clientes_.Prepare;
      qry_dados_clientes_.Open;

      qry_end_unid_.Close;
      qry_end_unid_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
      qry_end_unid_.Prepare;
      qry_end_unid_.Open;

      ppsSolic_Desunit.Template.FileName := cDir_RPT + '\RBENT002.RTM';
      ppsSolic_Desunit.Print;
    end;
  end
  else
  if ( str_cd_relatorio ) = '10' then
  begin
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' SELECT SUBSTRING(PE.NR_PROCESSO,5,15) AS NR_PROCESSO ,PE.NR_PROCESSO AS NR_PROCESSO2, ''CDE-''+ SUBSTRING(PE.NR_FATURA, 3,4)+''-''+SUBSTRING(PE.NR_FATURA, 8,3) AS FATURA, ');
      SQL.Add(' ISNULL(SUBSTRING(RE.NR_RE_SISCOMEX,1,11)+RIGHT(''000''+CONVERT(VARCHAR,RA.CD_RE_ANEXO),3),''-'') AS NR_RE, ');
      SQL.Add(' SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+SUBSTRING(EN.CGC_EMPRESA,13,2) AS CNPJ_CLIENTE, ');
      SQL.Add(' CASE RE.IN_NOVOEX                      ');
      SQL.Add('     WHEN 0 THEN RA.TX_DESC_MERCADORIA ');
      SQL.Add(' ELSE (SELECT MASTER.DBO.ROWCONCAT(LTRIM(RTRIM(ISNULL(TX_MERCADORIA_ITEM,''-'')))+''|'')  FROM TRE_ANEXO_PURO RAU (NOLOCK) ');
      SQL.Add(' WHERE RAU.NR_PROCESSO = RA.NR_PROCESSO AND RAU.NR_PROCESSO_COMPLEMENTO = RA.NR_PROCESSO_COMPLEMENTO AND RAU.CD_RE_ANEXO = RA.CD_RE_ANEXO) ');
      SQL.Add(' END AS NM_MERCADORIA, ');
      SQL.Add(' CONVERT(DECIMAL(28,3),RA.QT_UNIDADE_COMERCIAL) AS QT_MERCADORIA, ');
      SQL.Add(' (SELECT MASTER.DBO.ROWCONCAT(LTRIM(RTRIM(ISNULL(NR_NF,''-'')))+'''') FROM TPROCESSO_EXP_NF (NOLOCK) WHERE NR_PROCESSO = RE.NR_PROCESSO AND NR_RE = REPLACE(REPLACE(RE.NR_RE_SISCOMEX,''/'',''''),''-'','''')) AS NOTA_FISCAL ');
      SQL.Add(' FROM TPROCESSO PR (NOLOCK) ');
      SQL.Add('   LEFT JOIN TPROCESSO_EXP_PEDIDO PE (NOLOCK) ON PE.NR_PROCESSO = PR.NR_PROCESSO  ');
      SQL.Add('   LEFT JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = PR.CD_CLIENTE  ');
      SQL.Add('   LEFT JOIN TRE_CAPA RE (NOLOCK) ON RE.NR_PROCESSO = PE.NR_PROCESSO AND RE.NR_OUTRA_REF = PE.NR_FATURA ');
      SQL.Add('   LEFT JOIN TRE_ANEXO RA (NOLOCK) ON RA.NR_PROCESSO = PE.NR_PROCESSO AND RA.NR_PROCESSO_COMPLEMENTO = RE.NR_PROCESSO_COMPLEMENTO');
      SQL.Add(' WHERE PE.NR_PROCESSO = '''+ msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text +''' ');
      SQL.Add(' ORDER BY PE.NR_PROCESSO ');
      Open;
      Linha := 4;
      if EOF then
      begin
        Close;
        Free;
        Exit;
      end;
      try
        vExcel := CreateOLEObject('Excel.Application');
        vWorkBook := vExcel.Workbooks.Open(cDir_RPT + '\REL_ANEXOS.XLS');
        vSheet := vExcel.WorkBooks[1].Worksheets[1];
      except
        MessageDlg('Erro ao abrir o arquivo ''' + cDir_Rpt + '\REL_ANEXOS.XLS''.'#13 +
              'Verifique se o arquivo existe e se não está sendo utilizado.', mtError, [mbOk], 0);
        vExcel.Quit;
        Exit;
      end;
      while not EOF do
      begin
        try
          vSheet.Range['A' + IntToStr(Linha), 'A' + IntToStr(Linha)].Value := FieldByName('NR_PROCESSO').asString;
          vSheet.Range['B' + IntToStr(Linha), 'B' + IntToStr(Linha)].Value := FieldByName('CNPJ_CLIENTE').asString;
          vSheet.Range['C' + IntToStr(Linha), 'C' + IntToStr(Linha)].Value := FieldByName('FATURA').asString;
          vSheet.Range['D' + IntToStr(Linha), 'D' + IntToStr(Linha)].Value := FieldByName('NR_RE').asString;
          for I:=1 to 10 do
            if Trim(ExtractWord(i,FieldByName('NM_MERCADORIA').asString,'|')) <> '' then
              vSheet.Range['E' + IntToStr(Linha), 'E' + IntToStr(Linha)].Value := vSheet.Range['E' + IntToStr(Linha), 'E' + IntToStr(Linha)].Value + iif(i=1,'',#10) + ExtractWord(i,FieldByName('NM_MERCADORIA').asString,'|');
          //vSheet.Range['D' + IntToStr(Linha), 'D' + IntToStr(Linha)].Value := StringReplace(FieldByName('NM_MERCADORIA').asString,'|',#10,[rfReplaceAll]);
          //vSheet.Range['D' + IntToStr(Linha), 'D' + IntToStr(Linha)].RowHeight := 12.75;
          vSheet.Range['F' + IntToStr(Linha), 'F' + IntToStr(Linha)].Value := FormataFloat('0.000',FieldByName('QT_MERCADORIA').AsFloat);
          vSheet.Range['G' + IntToStr(Linha), 'G' + IntToStr(Linha)].Value := stringReplace(FieldByName('NOTA_FISCAL').AsString,',',#10,[rfReplaceAll]);
          Inc(Linha);
          Next;
        except
        on E: Exception do
          MessageDlg('Erro preenchendo o arquivo.'#13 + E.Message, mtError, [mbOk], 0);
        end;
      end;
      Close;
      Free;
      vExcel.Workbooks[1].SaveAs(cDir_RPT + '\REL_ANEXOS'+ msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text+StringReplace( StringReplace(DatetimeTostr(now),'/','',[rfReplaceAll]) , ':','',[rfReplaceAll])+'.XLS');
      vExcel.Visible := True;
    end;
  end
  else
  begin
    //GeraPlanCusto( msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text );
    GeraPlanCusto( msk_nr_processo.Text );
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sel_processo.FormShow(Sender: TObject);
begin
  case StrToInt(str_cd_relatorio) of
    2 : Caption := 'Espelho do Processo';
    3 : Caption := 'Planilha de Custos';
    4 : Caption := 'Impressão de itens/processo';
    5 : Caption := 'Processo x PO´s';
    6 : Caption := 'Controle de Embalagens';
    7 : Caption := 'Controle de Descargas';
    8 : Caption := 'Solicitação de Desova';
    9 : Caption := 'Solicitação de Desunitização';
    10: Caption := 'Relatório de Anexos';
  end;

  lbl_despachante.Visible    := str_cd_relatorio = '6';
  msk_cd_despachante.Visible := str_cd_relatorio = '6';
  edt_nm_despachante.Visible := str_cd_relatorio = '6';
  btn_co_despachante.Visible := str_cd_relatorio = '6';

  if str_cd_relatorio = '3' then
  begin
    btn_imprimir.Caption := '&Gerar';
  end
  else
  begin
    btn_imprimir.Caption := '&Imprimir';
  end;

  with datm_sel_processo do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_unid_neg_.Prepare;
    qry_produto_.Prepare;
    qry_processo_.Prepare;
    qry_unid_neg_.Open;
    qry_produto_.Open;
  end;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  if str_cd_relatorio = '10' then
     msk_cd_produto.Text := '02';
  msk_cd_produtoExit(nil);
  msk_nr_processo.SetFocus;
  if str_cd_relatorio = '6' then
    msk_cd_despachante.SetFocus;
end;

procedure Tfrm_sel_processo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_sel_processo do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_processo_.Close;
    Free;
  end;
  crp_processo.Free;
  Action := caFree;
end;

procedure Tfrm_sel_processo.FormCreate(Sender: TObject);
begin
 { Inicializa o Data Module para Seleção de Recebimento}
  Application.CreateForm( Tdatm_sel_processo, datm_sel_processo );
end;

procedure Tfrm_sel_processo.btn_co_processoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo,frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := Copy(frm_consulta_processo.Nr_Processo,5,14);
    msk_nr_processoExit(nil);
  end;
end;

procedure Tfrm_sel_processo.msk_nr_processoExit(Sender: TObject);
begin
  if msk_nr_processo.Text <> '' then
  begin
    with datm_sel_processo do
    begin
      qry_processo_.Close;
      datm_sel_processo.qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text +  msk_cd_produto.Text +
         msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount = 0 then
      begin
        msk_nr_processo.Text := '';
        BoxMensagem('Processo não cadastrado ou não liberado para esta Unidade/Produto!', 2);
        msk_nr_processo.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_sel_processo.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg    then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto     then btn_co_produtoClick(nil);
    if Sender = msk_nr_processo    then btn_co_processoClick(nil);
    if Sender = msk_cd_despachante then btn_co_despachanteClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_cd_unid_neg.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
      msk_cd_unid_negExit(nil);
      msk_cd_produto.Text := Copy( frm_pesq_proc.PesqNrProcesso, 3, 2 );
      msk_cd_produtoExit(nil);
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_sel_processo.GeraPlanCusto(nr_processo : String);
var
  Enter   : String[2];
  i: integer;
  qt_item, qt_arm, qt_desp_despacho, vl_icms : Double;
  str_faturas, str_unidade, str_nao_outros, str_ref, str_qt, str_peso, str_vmle,
  str_conjugado, str_conjugado_final, str_material, str_item : String;
begin
  Screen.Cursor    := crHourGlass;
  Enter            := #13#10;
  qt_item          := 0;
  qt_arm           := 0;
  qt_desp_despacho := 0;
  str_faturas      := '';
  str_unidade      := '';
  str_nao_outros   := '';
  str_ref          := '';
  str_qt           := '';
  str_vmle         := '';
  str_peso         := '';
  str_material     := '';
  str_item         := '';

  with datm_sel_processo do
  begin
    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;

    str_nao_outros := '("' +
                      qry_param_CD_ITEM_FRETE_AEREO.AsString + '","' +
                      qry_param_CD_ITEM_FRETE_MAR.AsString + '","' +
                      qry_param_CD_ITEM_II.AsString + '","' +
                      qry_param_CD_ITEM_IPI.AsString + '","' +
                      qry_param_CD_ITEM_ICMS.AsString + '","' +
                      qry_param_CD_ITEM_SDA.AsString + '","' +
                      qry_param_CD_ITEM_IR.AsString + '","' +
                      qry_param_CD_ITEM_COMISSAO.AsString + '"';

    qry_pais_.Close;
    qry_pais_.Prepare;
    qry_pais_.Open;

    qry_via_transp_.Close;
    qry_via_transp_.Prepare;
    qry_via_transp_.Open;

    qry_di_.Close;
    qry_di_.Prepare;
    qry_di_.Open;

    qry_adicao_.Close;
    qry_adicao_.Prepare;
    qry_adicao_.Open;

    qry_item_di_.Close;
    qry_item_di_.Prepare;
    qry_item_di_.Open;

    qry_faturas_.Close;
    qry_faturas_.Prepare;
    qry_faturas_.Open;

    Arquivo := TFileText.Create;
    Arquivo.Name := cDir_Rpt + '\DCI.TXT';
    Arquivo.CreateFile;

    c1 := '';
    {N/Referencia, S/Referencia, Material, Item}
    c1 := c1 + '"' + qry_processo_NR_PROCESSO.AsString;
                     //Copy( qry_processo_NR_PROCESSO.AsString, 1, 4 ) + '-' +
                     //Copy( qry_processo_NR_PROCESSO.AsString, 5, 2 ) + '/' +
                     //Copy( qry_processo_NR_PROCESSO.AsString, 7, 4 ) + '-' +
                     //Copy( qry_processo_NR_PROCESSO.AsString, 11, 1 ) + '"';

    c1 := c1 + Enter + Enter + Enter + Enter;
    {Fornecedor}
    c1 := c1 + qry_adicao_NM_FORN_ESTR.AsString + Enter;
    {Pais}
    c1 := c1 + qry_adicao_LookPais.AsString + Enter;
    {Unidade, Quantidade}
    qry_item_di_.First;
    if Not qry_item_di_.EOF then str_unidade := qry_item_di_CD_UN_MED_COMERC.AsString;
    while Not qry_item_di_.EOF do
    begin
      qt_item := qt_item + qry_item_di_QT_MERC_UN_COMERC.AsFloat;
      if ( qry_item_di_CD_UN_MED_COMERC.IsNull ) or
         ( Trim( qry_item_di_CD_UN_MED_COMERC.AsString ) = '' ) or
         ( qry_item_di_CD_UN_MED_COMERC.AsString <> str_unidade ) then
      begin
        str_unidade   := '';
      end
      else
      begin
        str_unidade := qry_item_di_CD_UN_MED_COMERC.AsString;
      end;
      qry_item_di_.Next;
    end;
    qry_unid_medida_.Close;
    qry_unid_medida_.ParamByName('CD_UNID_MEDIDA').AsString := str_unidade;
    qry_unid_medida_.Prepare;
    qry_unid_medida_.Open;
    if qry_unid_medida_.RecordCount > 0 then
    begin
      str_unidade := qry_unid_medida_NM_UNID_MEDIDA.AsString;
    end;
    qry_unid_medida_.Close;
    c1 := c1 + str_unidade + Enter + FormatFloat( '0.00', qt_item ) + Enter;
    {Peso Liquido}
    c1 := c1 + FormatFloat( '0.00', qry_di_PL_CARGA.AsFloat ) + Enter;
    {Fat. Com. Nr., Fat.Com.Dt., Localidade NF, NF Nr., NF. Dt.}
    qry_faturas_.First;
    while Not qry_faturas_.EOF do
    begin
      str_faturas := str_faturas + qry_faturas_NR_DCTO_INSTRUCAO.AsString + '/';
      qry_faturas_.Next;
    end;
    if str_faturas <> '' then str_faturas := Copy( str_faturas, 1, Length( str_faturas ) - 1);
    c1 := c1 + str_faturas + Enter + Enter + Enter + Enter + Enter;
    StrPCopy( p1, c1);
    Arquivo.Write( p1 );
    c1 := '';
    {Modalidade}
    c1 := c1 + qry_di_LookViaTransp.AsString + Enter;
    {D.I. Nr.}
    if Trim( qry_di_NR_DECLARACAO_IMP.AsString ) <> '' then
    begin
      c1 := c1 + Copy( qry_di_NR_DECLARACAO_IMP.AsString, 1, 2 ) + '/' +
                 Copy( qry_di_NR_DECLARACAO_IMP.AsString, 3, 7 ) + '-' +
                 Copy( qry_di_NR_DECLARACAO_IMP.AsString, 10, 1 );
    end;
    c1 := c1 + Enter;
    {D.I. Dt.}
    c1 := c1 + Copy( qry_di_DT_REGISTRO_DI.AsString, 1, 2 ) + '/' +
               Copy( qry_di_DT_REGISTRO_DI.AsString, 3, 2 ) + '/' +
               Copy( qry_di_DT_REGISTRO_DI.AsString, 5, 4 ) + Enter;
    {Taxa US$}
    c1 := c1 + FormatFloat( '0.0000000', qry_di_TX_DOLAR.AsFloat ) + Enter;
    {Moeda FOB}
    c1 := c1 + qry_di_LookMoedaMLE.AsString + Enter;
    {FOB}
    c1 := c1 + FormatFloat( '0.00', qry_di_VL_TOT_MLE_MNEG.AsFloat ) + Enter;
    {Taxa FOB}
    c1 := c1 + FormatFloat( '0.0000000', qry_di_TX_MLE.AsFloat ) + Enter;
    {Frete Collect}
    c1 := c1 + FormatFloat( '0.00', Arredondar( (qry_di_VL_TOT_FRT_COLLECT.AsFloat * qry_di_TX_FRETE.AsFloat), 2 ) ) + Enter;
    {Moeda Frete}
    if qry_di_VL_TOT_FRT_PREPAID.AsFloat = 0 then
      c1 := c1 + Enter
    else
      c1 := c1 + qry_di_LookMoedaFrete.AsString + Enter;
    {Frete Prepaid}
    c1 := c1 + FormatFloat( '0.00', Arredondar( (qry_di_VL_TOT_FRT_PREPAID.AsFloat * qry_di_TX_FRETE.AsFloat), 2 ) ) + Enter;
    {Taxa Frete}
    if qry_di_VL_TOT_FRT_PREPAID.AsFloat = 0 then
      c1 := c1 + Enter
    else
      c1 := c1 + FormatFloat( '0.0000000', qry_di_TX_FRETE.AsFloat ) + Enter;
    {Dif. Frete}
    c1 := c1 + Enter;
    StrPCopy( p1, c1);
    Arquivo.Write( p1 );
    c1 := '';
    {Moeda Seguro}
    if qry_di_VL_TOT_SEGURO_MNEG.AsFloat = 0 then
      c1 := c1 + Enter
    else
      c1 := c1 + qry_di_LookMoedaSeguro.AsString + Enter;
    {Seguro}
    c1 := c1 + FormatFloat( '0.00', qry_di_VL_TOT_SEGURO_MNEG.AsFloat ) + Enter;
    {Taxa Seguro}
    if qry_di_VL_TOT_SEGURO_MNEG.AsFloat = 0 then
      c1 := c1 + Enter
    else
      c1 := c1 + FormatFloat( '0.0000000', qry_di_TX_SEGURO.AsFloat ) + Enter;
    {CIF}
    c1 := c1 + FormatFloat( '0.00', qry_processo_VL_CIF_MN.AsFloat ) + Enter;
    {II}
    qry_fat_cc_.Close;
    qry_fat_cc_.ParamByName('CD_ITEM').AsString := qry_param_CD_ITEM_II.AsString;
    qry_fat_cc_.Prepare;
    qry_fat_cc_.Open;
    if qry_fat_cc_VL_ITEM.AsFloat = 0 then
      c1 := c1 + FormatFloat( '0.00', qry_di_VL_TOTAL_II.AsFloat ) + Enter
    else
      c1 := c1 + FormatFloat( '0.00', qry_fat_cc_VL_ITEM.AsFloat ) + Enter;
    qry_fat_cc_.Close;
    {IPI}
    qry_fat_cc_.Close;
    qry_fat_cc_.ParamByName('CD_ITEM').AsString := qry_param_CD_ITEM_IPI.AsString;
    qry_fat_cc_.Prepare;
    qry_fat_cc_.Open;
    if qry_fat_cc_VL_ITEM.AsFloat = 0 then
      c1 := c1 + FormatFloat( '0.00', qry_di_VL_TOTAL_IPI.AsFloat ) + Enter
    else
      c1 := c1 + FormatFloat( '0.00', qry_fat_cc_VL_ITEM.AsFloat ) + Enter;
    qry_fat_cc_.Close;
    {ICMS}
    qry_fat_cc_.Close;
    qry_fat_cc_.ParamByName('CD_ITEM').AsString := qry_param_CD_ITEM_ICMS.AsString;
    qry_fat_cc_.Prepare;
    qry_fat_cc_.Open;
    vl_icms := qry_fat_cc_VL_ITEM.AsFloat;
    if vl_icms = 0 then
      vl_icms := qry_di_VL_TOT_ICMS.AsFloat;
    c1 := c1 + FormatFloat( '0.00', vl_icms ) + Enter;
    qry_fat_cc_.Close;
    {SDA}
    qry_fat_cc_.Close;
    qry_fat_cc_.ParamByName('CD_ITEM').AsString := qry_param_CD_ITEM_SDA.AsString;
    qry_fat_cc_.Prepare;
    qry_fat_cc_.Open;
    c1 := c1 + FormatFloat( '0.00', qry_fat_cc_VL_ITEM.AsFloat ) + Enter;
    qry_fat_cc_.Close;

    {Armazenagem - calculando}
    qry_grupo_item_.Close;
    qry_grupo_item_.ParamByName('CD_GRUPO_ITEM').AsString := qry_param_CD_GRP_ITEM_ARM.AsString;
    qry_grupo_item_.Prepare;
    qry_grupo_item_.Open;

    qry_grupo_item_item_.Close;
    qry_grupo_item_item_.Prepare;
    qry_grupo_item_item_.Open;
    qry_grupo_item_item_.First;
    while Not qry_grupo_item_item_.EOF do
    begin
      qry_fat_cc_.Close;
      qry_fat_cc_.ParamByName('CD_ITEM').AsString := qry_grupo_item_item_CD_ITEM.AsString;
      qry_fat_cc_.Prepare;
      qry_fat_cc_.Open;
      qt_arm := qt_arm + qry_fat_cc_VL_ITEM.AsFloat;
      qry_fat_cc_.Close;
      if Pos( qry_grupo_item_item_CD_ITEM.AsString, str_nao_outros ) = 0 then
      begin
        str_nao_outros := str_nao_outros + ',"' + qry_grupo_item_item_CD_ITEM.AsString + '"';
      end;
      qry_grupo_item_item_.Next;
    end;

    {Capatazias - calculando}
    qry_grupo_item_.Close;
    qry_grupo_item_.ParamByName('CD_GRUPO_ITEM').AsString := qry_param_CD_GRP_ITEM_CAP.AsString;
    qry_grupo_item_.Prepare;
    qry_grupo_item_.Open;

    qry_grupo_item_item_.Close;
    qry_grupo_item_item_.Prepare;
    qry_grupo_item_item_.Open;
    qry_grupo_item_item_.First;
    while Not qry_grupo_item_item_.EOF do
    begin
      qry_fat_cc_.Close;
      qry_fat_cc_.ParamByName('CD_ITEM').AsString := qry_grupo_item_item_CD_ITEM.AsString;
      qry_fat_cc_.Prepare;
      qry_fat_cc_.Open;
      qt_arm := qt_arm + qry_fat_cc_VL_ITEM.AsFloat;
      qry_fat_cc_.Close;
      if Pos( qry_grupo_item_item_CD_ITEM.AsString, str_nao_outros ) = 0 then
      begin
        str_nao_outros := str_nao_outros + ',"' + qry_grupo_item_item_CD_ITEM.AsString + '"';
      end;
      qry_grupo_item_item_.Next;
    end;

    {Desp. Despacho - calculando}
    qry_grupo_item_.Close;
    qry_grupo_item_.ParamByName('CD_GRUPO_ITEM').AsString := qry_param_CD_GRP_ITEM_DESP_DESPACHO.AsString;
    qry_grupo_item_.Prepare;
    qry_grupo_item_.Open;

    qry_grupo_item_item_.Close;
    qry_grupo_item_item_.Prepare;
    qry_grupo_item_item_.Open;
    qry_grupo_item_item_.First;
    while Not qry_grupo_item_item_.EOF do
    begin
      qry_fat_cc_.Close;
      qry_fat_cc_.ParamByName('CD_ITEM').AsString := qry_grupo_item_item_CD_ITEM.AsString;
      qry_fat_cc_.Prepare;
      qry_fat_cc_.Open;
      qt_desp_despacho := qt_desp_despacho + qry_fat_cc_VL_ITEM.AsFloat;
      qry_fat_cc_.Close;
      if Pos( qry_grupo_item_item_CD_ITEM.AsString, str_nao_outros ) = 0 then
      begin
        str_nao_outros := str_nao_outros + ',"' + qry_grupo_item_item_CD_ITEM.AsString + '"';
      end;
      qry_grupo_item_item_.Next;
    end;

    {Armazenagem}
    c1 := c1 + FormatFloat( '0.00', qt_arm ) + Enter;
    qry_grupo_item_.Close;
    qry_grupo_item_item_.Close;

    {Outros, Agenc. DECEX}
    str_nao_outros := str_nao_outros + ')';
    qry_outros_.Close;
    {ATENÇÃO PARA ESTES NÚMEROS CASO HAJA ALTERAÇÃO NA DECLARAÇÃO SQL DO OBJETO TQUERY}
    qry_outros_.SQL[15] := str_nao_outros;
    qry_outros_.Prepare;
    qry_outros_.Open;
//    if qry_outros_.RecordCount > 0 then
//    begin
//      c1 := c1 + FormatFloat( '0.00', qry_outros_VL_OUTROS.AsFloat );
//    end;
    c1 := c1 + Enter + Enter;

    {Desp. Despacho}
    qt_desp_despacho := qt_desp_despacho + qry_outros_VL_OUTROS.AsFloat;
    c1 := c1 + FormatFloat( '0.00', qt_desp_despacho ) + Enter;
    qry_grupo_item_.Close;
    qry_grupo_item_item_.Close;

    {Frete Int'l Collect}
    if qry_di_CD_VIA_TRANSP_CARG.AsString = '01' then
    begin
      qry_fat_cc_.Close;
      qry_fat_cc_.ParamByName('CD_ITEM').AsString := qry_param_CD_ITEM_FRETE_MAR.AsString;
      qry_fat_cc_.Prepare;
      qry_fat_cc_.Open;
    end
    else
    begin
      qry_fat_cc_.Close;
      qry_fat_cc_.ParamByName('CD_ITEM').AsString := qry_param_CD_ITEM_FRETE_AEREO.AsString;
      qry_fat_cc_.Prepare;
      qry_fat_cc_.Open;
    end;
    c1 := c1 + FormatFloat( '0.00', qry_fat_cc_VL_ITEM.AsFloat ) + Enter;
    qry_fat_cc_.Close;

    {Comissão, LI, Aditivo, Frete Interno, IPI a Recuperar}
    qry_fat_cc_.Close;
    qry_fat_cc_.ParamByName('CD_ITEM').AsString := qry_param_CD_ITEM_COMISSAO.AsString;
    qry_fat_cc_.Prepare;
    qry_fat_cc_.Open;
    c1 := c1 + FormatFloat( '0.00', qry_fat_cc_VL_ITEM.AsFloat );
    c1 := c1 + Enter + Enter + Enter + Enter + Enter;
    qry_fat_cc_.Close;

    {ICMS a Recuperar}
    c1 := c1 + FormatFloat( '0.00', ( vl_icms * (-1) ) ) + Enter;

    {IR, Banco, Observação, Rateio}
    qry_fat_cc_.Close;
    qry_fat_cc_.ParamByName('CD_ITEM').AsString := datm_sel_processo.qry_param_CD_ITEM_IR.AsString;
    qry_fat_cc_.Prepare;
    qry_fat_cc_.Open;
    c1 := c1 + FormatFloat( '0.00', qry_fat_cc_VL_ITEM.AsFloat );
    c1 := c1 + Enter + Enter + Enter + Enter;
    qry_fat_cc_.Close;
    StrPCopy( p1, c1);
    Arquivo.Write( p1 );
    c1 := '';
    qry_ref_cliente_.Close;
    qry_ref_cliente_.Prepare;
    qry_ref_cliente_.Open;
    qry_ref_cliente_.First;
    qry_ref_cliente_lww_.Close;
    qry_ref_cliente_lww_.Prepare;
    qry_ref_cliente_lww_.Open;
    qry_ref_cliente_lww_.First;
    while Not qry_ref_cliente_lww_.EOF do
    begin
      {S/Referência}
      str_ref  := str_ref  + Trim( qry_ref_cliente_CD_REFERENCIA.AsString ) + ';';
      {Quantidade}
      str_qt   := str_qt   + FormatFloat( '#0.00', qry_ref_cliente_lww_QT_MERCADORIA.AsFloat ) + ';';
      {FOB}
      str_vmle := str_vmle + FormatFloat( '#0.00', qry_ref_cliente_lww_VL_MLE_MN.AsFloat ) + ';';
      {Peso Liquido}
      str_peso := str_peso + FormatFloat( '#0.000', qry_ref_cliente_lww_PL_REFERENCIA.AsFloat ) + ';';
      {Material}
      str_material := str_material + qry_ref_cliente_lww_NM_MERCADORIA.AsString + ';';
      {Item}
      str_item := str_item + qry_ref_cliente_lww_CD_MERCADORIA.AsString + ';';

      qry_ref_cliente_lww_.Next;
      qry_ref_cliente_.Next;
    end;
    str_ref      := str_ref      + Enter;
    str_qt       := str_qt       + Enter;
    str_vmle     := str_vmle     + Enter;
    str_peso     := str_peso     + Enter;
    str_material := str_material + Enter;
    str_item     := str_item     + Enter;
    c1 := c1 + ';;' + str_ref + ';;' + str_qt + ';;' + str_vmle + ';;' + str_peso;
    StrPCopy( p1, c1);
    Arquivo.Write( p1 );
    c1 := '';

    {Conjugado com - processamento}
    str_conjugado_final := ';;';
    qry_ref_cliente_.First;
    while Not qry_ref_cliente_.EOF do
    begin
      {Retira a Referência atual}
      str_conjugado := '';
      if Pos( Trim( qry_ref_cliente_CD_REFERENCIA.AsString ), str_ref ) = 1 then
        str_conjugado := Copy( str_ref, Length( Trim( qry_ref_cliente_CD_REFERENCIA.AsString ) ) + 2,
                         Length( str_ref ) - ( Length( Trim( qry_ref_cliente_CD_REFERENCIA.AsString ) ) ) - 4 )
      else
        str_conjugado := Copy( str_ref, 1,
                               Pos( Trim( qry_ref_cliente_CD_REFERENCIA.AsString ), str_ref ) - 1 ) +
                         Copy( str_ref ,
                               Pos( Trim( qry_ref_cliente_CD_REFERENCIA.AsString ), str_ref ) +
                                   ( Length( Trim( qry_ref_cliente_CD_REFERENCIA.AsString ) ) + 1 ),
                               Length( str_ref ) -
                               ( Length( Trim( qry_ref_cliente_CD_REFERENCIA.AsString ) ) )  -
                                 Pos( Trim( qry_ref_cliente_CD_REFERENCIA.AsString ), str_ref ) - 3 );
      for i := 1 to Length(str_conjugado) do
      begin
        if str_conjugado[i] = ';' then str_conjugado[i] := ','
      end;
      str_conjugado_final := str_conjugado_final + str_conjugado + ';';
      qry_ref_cliente_.Next;
    end;

    {Conjugado com, Data Contábil}
    c1 := str_conjugado_final + Enter + Enter;
    StrPCopy( p1, c1);
    Arquivo.Write( p1 );

    {Material}
    c1 := ';;' + str_material + ';;' + str_item;
    StrPCopy( p1, c1);
    Arquivo.Write( p1 );

    qry_param_.Close;
    qry_pais_.Close;
    qry_via_transp_.Close;
    qry_grupo_item_.Close;
    qry_grupo_item_item_.Close;
    qry_di_.Close;
    qry_adicao_.Close;
    qry_item_di_.Close;
    qry_faturas_.Close;

    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    Arquivo.Close;
    Arquivo.Free;

    if BoxMensagem('Planilha Gerada com sucesso!' + Enter +
                   'Deseja abrir planilha no Excel?' , 1) then
       ShellExecute( Application.Handle, 'Open', 'EXCEL.EXE', PChar( cDir_Rpt + '\LWW_GSM.XLS' ), '', SW_MAXIMIZE );
    end;
end;



procedure Tfrm_sel_processo.btn_co_despachanteClick(Sender: TObject);
begin
  with datm_sel_processo do
  begin
    Application.CreateForm(Tfrm_despachante, frm_despachante );
    with frm_despachante do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_despachante.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_despachante.Text := frm_despachante.Cons_OnLine_Texto;
      msk_cd_despachanteExit(nil);
    end;
  end;
end;

procedure Tfrm_sel_processo.msk_cd_despachanteExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_despachante );
  if msk_cd_despachante.Text <> '' then
  begin
    with datm_sel_processo do
    begin
      qry_despachante_.Close;
      qry_despachante_.SQL.Clear;
      qry_despachante_.SQL.Add( 'SELECT NM_DESPACHANTE FROM TDESPACHANTE WHERE CD_DESPACHANTE = "' + msk_cd_despachante.Text + '"' );
      qry_despachante_.Prepare;
      qry_despachante_.Open;
      if qry_despachante_.RecordCount > 0 then
        edt_nm_despachante.Text := qry_despachante_NM_DESPACHANTE.AsString
      else
      begin
        BoxMensagem('Despachante não cadastrado!', 2);
        msk_cd_despachante.SetFocus;
      end
    end;
  end
  else edt_nm_despachante.Text := '';
end;

end.

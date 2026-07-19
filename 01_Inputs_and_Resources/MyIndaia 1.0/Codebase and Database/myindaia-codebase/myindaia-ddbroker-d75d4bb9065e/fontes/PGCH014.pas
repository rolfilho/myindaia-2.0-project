unit PGCH014;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, UCRPE32, ComCtrls, ShellApi, dbtables, Funcoes,
  ComObj, ConsOnlineEx, Grids, DBGrids ;

type
  Tfrm_sel_unid_prod = class(TForm)
    Panel1: TPanel;
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
    crp_unid_prod: TCrpe;
    lbl_periodo: TLabel;
    lbl_a: TLabel;
    lbl_cd_cliente: TLabel;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    btn_co_cliente: TSpeedButton;
    mem_field: TMemo;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    msk_nr_cheque: TMaskEdit;
    lbl_prefixo: TLabel;
    msk_cd_prefixo: TMaskEdit;
    msk_dt_inicio: TDateTimePicker;
    msk_dt_fim: TDateTimePicker;
    chk_excel: TCheckBox;
    lbl_relatorio: TLabel;
    msk_nr_relatorio: TMaskEdit;
    lbl_cd_fornecedor: TLabel;
    btn_co_fornecedor: TSpeedButton;
    msk_cd_fornecedor: TMaskEdit;
    edt_nm_fornecedor: TEdit;
    chk_arquivo: TCheckBox;
    lbl_cd_area: TLabel;
    btn_co_area: TSpeedButton;
    msk_cd_area: TMaskEdit;
    edt_nm_area: TEdit;
    msk_sg_grupo_area: TMaskEdit;
    lbl_cd_grupo_area: TLabel;
    Shape1: TShape;
    chkVenc: TCheckBox;
    chkDev: TCheckBox;
    chkCred: TCheckBox;
    gbReferencias: TGroupBox;
    lb1: TListBox;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    lb2: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    msk_cd_modal: TMaskEdit;
    edt_nm_modal: TEdit;
    btn_co_modal: TSpeedButton;
    Lbl_modal: TLabel;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_nr_chequeExit(Sender: TObject);
    procedure chk_excelClick(Sender: TObject);
    procedure ImprimeExcel;
    procedure btn_co_fornecedorClick(Sender: TObject);
    procedure msk_cd_fornecedorExit(Sender: TObject);
    procedure msk_cd_areaExit(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure msk_sg_grupo_areaExit(Sender: TObject);
    procedure faturamento_consolidado(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure lb1DblClick(Sender: TObject);
    procedure lb2DblClick(Sender: TObject);
    procedure btn_co_modalClick(Sender: TObject);
    procedure msk_cd_modalChange(Sender: TObject);
  private
    c1:  String;
    p1: Array[0..1024] of Char;
    Itens : Array[1..4] of String[3];
  public
    tp_rel : Byte;
    ComPeriodo : Boolean;
    procedure GeraArquivoRelEstDesp( nr_identificador: Integer );
    procedure GeraArquivoRelEstMercadoria( nr_identificador: Integer );
    procedure GeraValoresPendentes;
    // 8, 13 e 14 Excluídos
    (* 15 - Estatístico de Mercadorias
      16 - Faturamento - Pagamentos do Cliente
      17 - Estatístico - Armazenagem/Demurrage
      18 - Estatístico - Cntr x Valor CIF
      19 - Liquidação - Saldos Pendentes
      20 - Estatístico - Armazenagem X Prefixo
      21 - Faturamento - Relação de Saldos
      22 - Liquidação - Relação de Liquidações
      23 - Estatístico - Despesas
      24 - Herdado em frm_sel_unid_cont
      25 - Demurrage - Estatístico
      26 - Rentabilidade de Processos
      27 - Demonstrativo de Contas Correntes
      28 - Lead Time de PO
      29 - Estatístico - Qtde de Contêineres
      30 - PO - Relatório de Previsto/Embarcado
      31 - PO - Relatório Gerencial Nível de Serviço
      32 - PO - Relatório de Embarque
      34 - Financeiro - Saldo de Clientes*)
  end;

var
  Saida    : String;
  Txt      : TextFile;
  cNomeTxt : String;
  NomeTxt, str_cr: String;
  ArquivoTXT: TextFile;
  frm_sel_unid_prod: Tfrm_sel_unid_prod;
  nr_identificador: integer;

implementation

{$R *.DFM}

uses FILETEXT, GSMLIB, PGGP001, PGGP017, PGCH015, PGSM010, PGSM018, PGSM024,
     PGSM119, PGSM103, PGSM095, PGSM104, pgsm212, PGSM990;

var
   Arquivo : TFileText;

procedure Tfrm_sel_unid_prod.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_unid_prod.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    if tp_rel in [2, 3, 5, 6, 7, 9, 11, 15, 16, 17, 18, 19, 20, 21, 22, 23, 25, 26, 27, 29, 31, 33, 34,36] then edt_nm_unid_neg.Text := 'Todas'
    else edt_nm_unid_neg.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_sel_unid_prod do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
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

procedure Tfrm_sel_unid_prod.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.text = '' then
  begin
    if tp_rel in [2, 5, 6, 7, 9, 11, 16, 17, 18, 19, 20, 21, 22, 23, 25, 26, 27, 29, 31, 34,36] then edt_nm_produto.Text := 'Todos'
    else edt_nm_produto.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_sel_unid_prod do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
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

procedure Tfrm_sel_unid_prod.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sel_unid_prod do
  begin
    Application.CreateForm(Tfrm_unidade, frm_unidade );
    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
      msk_cd_unid_negExit(nil);
    end;
  end;
end;

procedure Tfrm_sel_unid_prod.btn_co_produtoClick(Sender: TObject);
begin
  with datm_sel_unid_prod Do
  begin
    Application.CreateForm(Tfrm_produto, frm_produto );
    with frm_produto do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_produto.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
      msk_cd_produtoExit(nil);
    end;
  end;
end;


procedure Tfrm_sel_unid_prod.btn_imprimirClick(Sender: TObject);
var
  Linha, Cont: Byte;
  MemoMatList, MemoObsList : TStringList;
  datainicio, datafim, linha_01, linha_02, texto_periodo, vReferencias : String;
  nr_registros, vl_dolar : double;
  dt_atual, dt_anterior : String;
  cont_reg_00, cont_reg_01, nLinha, vCorAux, i: integer;
  Excel, xlWorkB, oSheet: OleVariant;
  vQryCred, vQryDev, vQryRec, vQryDevVenc, vQryNum, vQryDesp, vQryDespVenc, vQryAux, vQryAux2, vQryAux3: TQuery;
  vUnidade, vProduto, vGrupo: string;
  vNum, vDesp, vCred, vDev, vRec, vDevVenc, vTotNum, vTotDesp, vTotCred, vTotDev, vTotRec, vTotDevVenc: real;
  vMedia :integer;

begin
  nr_identificador := 0;

  if ( Trim( msk_cd_unid_neg.Text ) = '' ) and ( tp_rel in [1, 10] ) then
  begin
    BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if ( Trim( msk_cd_produto.Text ) = '' ) and ( tp_rel in [1, 4, 10, 15] )  then
  begin
    BoxMensagem( 'Informe um Produto!', 2 );
    msk_cd_produto.SetFocus;
    Exit;
  end;

  if ( ( Trim( msk_cd_cliente.Text ) = '' ) and ( Trim( msk_cd_grupo.Text ) = '' ) ) and ( tp_rel in [5, 10, 23, 26, 27, 28, 30, 31, 32] ) then
  begin
    BoxMensagem( 'Informe um Cliente ou Grupo!', 2 );
    msk_cd_cliente.SetFocus;
    Exit;
  end;

  if Not ( tp_rel in [5, 10, 12, 19] ) then
  begin
    if ( tp_rel <> 8 ) and ( tp_rel <> 9 ) then
    begin
      if msk_dt_inicio.Date = 0 then
      begin
        if ComPeriodo then BoxMensagem( 'Informe uma data de início para seleção!', 2 )
        else BoxMensagem( 'Informe uma data para seleção!', 2 );
        msk_dt_inicio.SetFocus;
        Exit;
      end;
    end;

    if ComPeriodo then
    begin
      if ( msk_dt_fim.Date = 0 ) then
      begin
        BoxMensagem( 'Informe uma data final para seleção!', 2 );
        msk_dt_fim.SetFocus;
        Exit;
      end;

      if ( msk_dt_inicio.Date > msk_dt_fim.Date ) then
      begin
        BoxMensagem( 'Data final deve ser maior ou igual a data inicial!', 2 );
        msk_dt_inicio.SetFocus;
        Exit;
      end;
    end;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  with crp_unid_prod do
  begin
    if Not ( tp_rel in [23, 25] ) then
    begin
      if ( tp_rel in [1, 3, 4, 6, 7, 8, 9, 11, 12, 16, 17, 18, {19,} 20, 21, 22, 26, 27, 28, 31] ) then
      begin
        Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      end
      else
      begin
        Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      end;
    end;

    case tp_rel of
      1: begin
           ReportName  := cDir_Rpt + '\CRNM001.RPT';
           ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' ]';
           Formulas[0] := 'DataSelecao = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) );
           Formulas[1] := 'Produto = "'+ msk_cd_produto.Text + '"';
           Formulas[2] := 'Unidade = "'+ msk_cd_unid_neg.Text + '"';
           Formulas[3] := 'NmUnidade = "'+ edt_nm_unid_neg.Text + '"';
           Formulas[4] := 'NmProduto = "'+ edt_nm_produto.Text + '"';
         end;
      2: begin
           ReportName  := cDir_Rpt + '\CRFT012.RPT';
           if msk_dt_inicio.Date = msk_dt_fim.Date then
              ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' ]'
           else
              ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) + ' ]';
           Formulas[0] := 'DataIni = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) );
           Formulas[1] := 'DataFim = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) );
           Formulas[2] := 'Produto = "'+ msk_cd_produto.Text + '"';
           Formulas[3] := 'Unidade = "'+ msk_cd_unid_neg.Text + '"';
           Formulas[4] := 'Grupo = "'+ msk_cd_grupo.Text + '"';
           Formulas[5] := 'Cliente = "'+ msk_cd_cliente.Text + '"';
         end;
      3: begin
           ReportName  := cDir_Rpt + '\CRFT014.RPT';
           if msk_dt_inicio.Date = msk_dt_fim.Date then
              ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' ]'
           else
              ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) + ' ]';
           Formulas[0] := 'DataIni = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) );
           Formulas[1] := 'DataFim = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) );
           Formulas[2] := 'Produto = "'+ msk_cd_produto.Text + '"';
           Formulas[3] := 'Unidade = "'+ msk_cd_unid_neg.Text + '"';
           Formulas[4] := 'Grupo = "'+ msk_cd_grupo.Text + '"';
           Formulas[5] := 'Cliente = "'+ msk_cd_cliente.Text + '"';
           datm_sel_unid_prod.qry_param_.Close;
           datm_sel_unid_prod.qry_param_.Prepare;
           datm_sel_unid_prod.qry_param_.Open;
           Formulas[6] := 'CD_ITEM_COMISSAO = "'+ datm_sel_unid_prod.qry_param_CD_ITEM_COMISSAO.AsString + '"';
           datm_sel_unid_prod.qry_param_.Close;
         end;
      4: begin
           ReportName  := cDir_Rpt + '\CRFT016.RPT';
           if msk_dt_inicio.Date = msk_dt_fim.Date then
              ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' ]'
           else
              ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) + ' ]';
           Formulas[0] := 'DataIni = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) );
           Formulas[1] := 'DataFim = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) );
           Formulas[2] := 'Produto = "'+ msk_cd_produto.Text + '"';
           Formulas[3] := 'Unidade = "'+ msk_cd_unid_neg.Text + '"';
           Formulas[4] := 'Grupo = "'+ msk_cd_grupo.Text + '"';
           Formulas[5] := 'Cliente = "'+ msk_cd_cliente.Text + '"';
           datm_sel_unid_prod.qry_param_.Close;
           datm_sel_unid_prod.qry_param_.Prepare;
           datm_sel_unid_prod.qry_param_.Open;
           Formulas[6] := 'CD_ITEM_COMISSAO = "'+ datm_sel_unid_prod.qry_param_CD_ITEM_COMISSAO.AsString + '"';
           Formulas[7] := 'CD_ITEM_EXPED = "'+ datm_sel_unid_prod.qry_param_CD_ITEM_EXPED.AsString + '"';
           datm_sel_unid_prod.qry_param_.Close;
         end;
      5: begin
           with datm_sel_unid_prod do
           begin
             qry_ord_ref_cli_.Close;
             qry_ord_ref_cli_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
             qry_ord_ref_cli_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
             qry_ord_ref_cli_.ParamByName('CD_GRUPO').AsString    := msk_cd_grupo.Text;
             qry_ord_ref_cli_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
             qry_ord_ref_cli_.Prepare;
             qry_ord_ref_cli_.Open;

             qry_flp_plan_.Close;
             qry_ref_cli_.Close;
             qry_embalagem_.Close;
             qry_li_.Close;
             qry_exp_.Close;

             qry_flp_plan_.Prepare;
             qry_ref_cli_.Prepare;
             qry_embalagem_.Prepare;
             qry_li_.Prepare;
             qry_exp_.Prepare;

             qry_flp_plan_.Open;
             qry_ref_cli_.Open;
             qry_embalagem_.Open;
             qry_li_.Open;
             qry_exp_.Open;

             Arquivo := TFileText.Create;
             Arquivo.Name := cDir_Risc + '\FLP.TXT';
             Arquivo.CreateFile;
             c1 := 'N/REFERENCIA;P.O.;EXPORTADOR;MATERIAL;QUANTIDADE;NAVIO/VOO;ETD;ETA;B/L;';
             c1 := c1 + 'LI;DT.DI;P.DES;OBSERVACOES' + Space(50) +
                   FormatDateTime('dd/mm/yyyy', Date) + ' ' + FormatDateTime('hh:mm', Time) + #13#10;
             StrPCopy( p1, c1);
             Arquivo.Write( p1 );
             qry_ord_ref_cli_.First;
             while Not qry_ord_ref_cli_.EOF do
             begin
               Cont := qry_ref_cli_.RecordCount;
               if qry_embalagem_.RecordCount > Cont then
                  Cont := qry_embalagem_.RecordCount;

               // Verificando Material
               // Verificando Obs
               MemoMatList := TStringList.Create;
               MemoObsList := TStringList.Create;
               try
                 mem_field.Lines.Assign( qry_flp_plan_TX_MERCADORIA );
                 MemoMatList.AddStrings( mem_field.Lines );
                 if MemoMatList.Count > Cont then Cont := MemoMatList.Count;

                 if qry_flp_plan_DT_DESEMB.IsNull then
                 begin
                   mem_field.Lines.Assign( qry_flp_plan_TX_OBSERVACOES );
                   MemoObsList.AddStrings( mem_field.Lines );
                 end
                 else
                 begin
                   MemoObsList.Add( 'D E S E M B A R A Ç A D O' );
                 end;
                 if MemoObsList.Count > Cont then Cont := MemoObsList.Count;

                 Linha := 1;
                 while True do
                 begin
                   c1 := '';
                   if Not qry_flp_plan_.EOF then
                     c1 := qry_flp_plan_NR_PROCESSO.AsString + ';'
                   else
                     c1 := c1 + ';';

                   if Not qry_ref_cli_.EOF then
                     c1 := c1 + qry_ref_cli_CD_REFERENCIA.AsString + ';'
                   else
                     c1 := c1 + ';';

                   if Not qry_exp_.EOF then
                     c1 := c1 + qry_exp_NM_FORN_ESTR.AsString +';'
                   else
                     c1 := c1 + ';';

                   if Linha <= MemoMatList.Count then
                     c1 := c1 + MemoMatList.Strings[Linha - 1] + ';'
                   else
                     c1 := c1 + ';';

                   if Not qry_embalagem_.EOF then
                   begin
                      if qry_embalagem_QT_EMBALAGEM.AsInteger > 1 then
                         c1 := c1 + IntToStr( qry_embalagem_QT_EMBALAGEM.AsInteger ) + ' ' +
                               qry_embalagem_descricao.AsString
                      else
                         c1 := c1 + IntToStr( qry_embalagem_QT_EMBALAGEM.AsInteger ) + ' ' +
                               qry_embalagem_descricao.AsString;
                   end;
                   c1 := c1 + ';';

                   if Not qry_flp_plan_.EOF then
                   begin
                     if ( Not qry_flp_plan_NR_VOO.IsNull ) and
                        ( Trim( qry_flp_plan_NR_VOO.AsString ) <> '' ) then
                       c1 := c1 + qry_flp_plan_NR_VOO.AsString + ';'
                     else
                       c1 := c1 + qry_flp_plan_NM_EMBARCACAO.AsString + ';';
                   end
                   else
                     c1 := c1 + ';';

                   StrPCopy( p1, c1);
                   Arquivo.Write( p1 );

                   c1 := '';
                   if Not qry_flp_plan_.EOF then
                   begin
                     if qry_flp_plan_DT_ETD.IsNull then
                       c1 := c1 + ';'
                     else
                       c1 := c1 + FormatDateTime('dd/mm', qry_flp_plan_DT_ETD.AsDateTime ) + ';';

                     if qry_flp_plan_DT_CHEGADA.IsNull then
                       if qry_flp_plan_DT_PREV_CHEGADA.IsNull then
                         c1 := c1 + ';'
                       else
                         c1 := c1 + FormatDateTime('dd/mm', qry_flp_plan_DT_PREV_CHEGADA.AsDateTime ) + '-E;'
                     else
                        c1 := c1 + FormatDateTime('dd/mm', qry_flp_plan_DT_CHEGADA.AsDateTime ) + ';';

                     if qry_flp_plan_NR_CONHECIMENTO.IsNull then
                       c1 := c1 + 'N;'
                     else
                       c1 := c1 + 'S;';

                     if not qry_li_.EOF then
                       if qry_li_TOT_LI.AsInteger > 0 then
                         c1 := c1 + 'S;'
                       else
                         c1 := c1 + 'N;'
                     else
                       c1 := c1 + ';';

                     if qry_flp_plan_DT_REG_DI.IsNull then
                        c1 := c1 + ';'
                     else
                        c1 := c1 + FormatDateTime('dd/mm', qry_flp_plan_DT_REG_DI.AsDateTime ) + ';';

                     if qry_flp_plan_DT_PREV_DESEMB.IsNull then
                        c1 := c1 + ';'
                     else
                        c1 := c1 + FormatDateTime('dd/mm', qry_flp_plan_DT_PREV_DESEMB.AsDateTime ) + ';';

                   end
                   else c1 := c1 + ';;;;;;';
                   StrPCopy( p1, c1);
                   Arquivo.Write( p1 );

                   c1 := '';
                   if Linha <= MemoObsList.Count then c1 := c1 + '"' + MemoObsList.Strings[Linha - 1] + '"';
                   c1 := c1 + ';';
                   c1 := c1 + #13#10;
                   StrPCopy( p1, c1);
                   Arquivo.Write( p1 );

                   // Mover Arquivos
                   qry_flp_plan_.Next;
                   qry_embalagem_.Next;
                   qry_exp_.Next;
                   qry_ref_cli_.Next;

                   Linha := Linha + 1;
                   if Linha > Cont then Break;
                 end;
               finally
                 MemoMatList.Free;
                 MemoObsList.Free;
               end;
               qry_ord_ref_cli_.Next;
             end;

             qry_ord_ref_cli_.Close;
             c1 := 'FIM';
             StrPCopy( p1, c1);
             Arquivo.Write( p1 );

             Arquivo.Close;
             Arquivo.Free;

             // Fim da Geração da planilha
             BoxMensagem('Planilha gerada com sucesso!', 3);
           end;
        end;
      6: begin
           with datm_sel_unid_prod do
           begin
             try
               datm_main.db_broker.StartTransaction;
               CloseStoredProc(sp_tot_serv_cli_periodo);
               if Trim( msk_cd_unid_neg.Text ) = '' then
                 sp_tot_serv_cli_periodo.ParamByName('@cd_unid_neg').AsString := 'X'
               else
                 sp_tot_serv_cli_periodo.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
               if Trim( msk_cd_produto.Text ) = '' then
                 sp_tot_serv_cli_periodo.ParamByName('@cd_produto').AsString  := 'X'
               else
                 sp_tot_serv_cli_periodo.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;

                 sp_tot_serv_cli_periodo.ParamByName('@DT_INI').AsDate        := msk_dt_inicio.Date;
                 sp_tot_serv_cli_periodo.ParamByName('@DT_FIM').AsDate        := msk_dt_fim.Date;

               if Trim( msk_cd_area.Text ) = '' then
                 sp_tot_serv_cli_periodo.ParamByName('@CD_AREA').AsString := 'X'
               else
                 sp_tot_serv_cli_periodo.ParamByName('@CD_AREA').AsString := msk_cd_area.Text;
               if Trim( msk_cd_grupo.Text ) = '' then
                 sp_tot_serv_cli_periodo.ParamByName('@CD_GRUPO').AsString  := 'X'
               else
                 sp_tot_serv_cli_periodo.ParamByName('@CD_GRUPO').AsString  := msk_cd_grupo.Text;
               if Trim( msk_cd_cliente.Text ) = '' then
                 sp_tot_serv_cli_periodo.ParamByName('@cd_cliente').AsString  := 'X'
               else
                 sp_tot_serv_cli_periodo.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
              ExecStoredProc(sp_tot_serv_cli_periodo);

               ReportName  := cDir_Rpt + '\CRES006.RPT';
               if msk_dt_inicio.Date = msk_dt_fim.Date then
                  ReportTitle := Caption + ' no dia [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' ]'
               else
                  ReportTitle := Caption + ' no período [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) + ' ]';
               Formulas[0] := 'Identificador = ' + IntToStr( sp_tot_serv_cli_periodo.ParamByName('@NR_IDENTIFICADOR').AsInteger );
               if msk_cd_unid_neg.Text = '' then
                  Formulas[1] := 'Unidade = "Unidade: Todas"'
               else
                 Formulas[1] := 'Unidade = '+ QuotedStr( edt_nm_unid_neg.Text );

               if msk_cd_produto.Text = '' then
                  Formulas[2] := 'Produto = "Produto: Todos"'
               else
                  Formulas[2] := 'Produto = "'+ edt_nm_produto.Text + '"';
               Formulas[3] := 'Legenda = "'+ sp_tot_serv_cli_periodo.ParamByName('@LEGENDA').AsString + '"';

               CloseStoredProc(sp_tot_serv_cli_periodo);
               datm_main.db_broker.Commit;
             except
               on E: Exception do
               begin
                 if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                 TrataErro(E);
                 Exit;
               end;
             end;
           end;
         end;

      7: begin
           with datm_sel_unid_prod do
           begin
             ReportName  := cDir_Rpt + '\CRES007.RPT';
             if msk_dt_inicio.Date = msk_dt_fim.Date then
                ReportTitle := Caption + ' no dia [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' ]'
             else
                ReportTitle := Caption + ' no período [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) + ' ]';
             Formulas[0]  := 'DataIni = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) );
             Formulas[1]  := 'DataFim = '+ DataCrystal( FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) );
             Formulas[2]  := 'Unidade = '+ QuotedStr( msk_cd_unid_neg.Text );
             Formulas[3]  := 'Produto = '+ QuotedStr( msk_cd_produto.Text );
             Formulas[4]  := 'Grupo = '+ QuotedStr( msk_cd_grupo.Text );
             Formulas[5]  := 'Cliente = '+ QuotedStr( msk_cd_cliente.Text );
             Formulas[6]  := 'Area = '+ QuotedStr( msk_cd_area.Text );
           end;
         end;
      9: begin
           with datm_sel_unid_prod do
           begin
             ReportName  := cDir_Rpt + '\CRGI017.RPT';
             CloseStoredProc( sp_rel_desp_pagto );
             if Trim( msk_cd_cliente.Text ) = '' then
               sp_rel_desp_pagto.ParamByName('@cd_unid_neg').AsString   := 'X'
             else
               sp_rel_desp_pagto.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
             if Trim( msk_cd_cliente.Text ) = '' then
               sp_rel_desp_pagto.ParamByName('@cd_produto').AsString    := 'X'
             else
               sp_rel_desp_pagto.ParamByName('@cd_produto').AsString    := msk_cd_produto.Text;
             ExecStoredProc( sp_rel_desp_pagto );
             nr_identificador := sp_rel_desp_pagto.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_desp_pagto );
           end;
         end;
      10: begin
            with datm_sel_unid_prod do
            begin
              screen.Cursor := crHourGlass;
              Application.ProcessMessages;
              CloseStoredProc( sp_andamento_ );
              sp_andamento_.ParamByName('@cd_cliente').asString := msk_cd_cliente.text;
              sp_andamento_.ParamByName('@cd_grupo').asString   := msk_cd_grupo.text;
              sp_andamento_.ParamByName('@cd_produto').asString := msk_cd_produto.text;
              sp_andamento_.ParamByName('@cd_unidade').asString := msk_cd_unid_neg.text;
              ExecStoredProc( sp_andamento_ );
              nr_identificador := sp_andamento_.ParamByName('@nr_identificador').AsInteger;
              CloseStoredProc( sp_andamento_ );
              screen.Cursor := crNo;
              Application.ProcessMessages;
            end;
      end;
      11: begin
            with datm_sel_unid_prod do
            begin
              ReportName  := cDir_Rpt + '\CRGI019.RPT';

              CloseStoredProc( sp_rel_num_nao_rec );
              if Trim( msk_cd_unid_neg.Text ) = '' then
                sp_rel_num_nao_rec.ParamByName('@cd_unid_neg').AsString := 'X'
              else
                sp_rel_num_nao_rec.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
              if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_num_nao_rec.ParamByName('@cd_produto').AsString  := 'X'
              else
                sp_rel_num_nao_rec.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
              if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_num_nao_rec.ParamByName('@cd_grupo').AsString  := 'X'
              else
                sp_rel_num_nao_rec.ParamByName('@cd_grupo').AsString  := msk_cd_grupo.Text;
              if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_num_nao_rec.ParamByName('@cd_cliente').AsString  := 'X'
              else
                sp_rel_num_nao_rec.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;

              sp_rel_num_nao_rec.ParamByName('@DT_INI').AsDate          := msk_dt_inicio.Date;
              sp_rel_num_nao_rec.ParamByName('@DT_FIM').AsDate          := msk_dt_fim.Date;

              ExecStoredProc( sp_rel_num_nao_rec );
              nr_identificador := sp_rel_num_nao_rec.ParamByName('@nr_identificador').AsInteger;
              CloseStoredProc( sp_rel_num_nao_rec );
            end;
          end;
      12: begin
            with datm_sel_unid_prod do
            begin
              ReportName  := cDir_Rpt + '\CRGI020.RPT';
              CloseStoredProc( sp_rel_ctrl_demurrage );
              if Trim( msk_cd_unid_neg.Text ) = '' then
                sp_rel_ctrl_demurrage.ParamByName('@cd_unid_neg').AsString   := 'X'
              else
                sp_rel_ctrl_demurrage.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
              if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_ctrl_demurrage.ParamByName('@cd_produto').AsString    := 'X'
              else
                sp_rel_ctrl_demurrage.ParamByName('@cd_produto').AsString    := msk_cd_produto.Text;
              if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_ctrl_demurrage.ParamByName('@cd_grupo').AsString      := 'X'
              else
                sp_rel_ctrl_demurrage.ParamByName('@cd_grupo').AsString      := msk_cd_grupo.Text;
              if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_ctrl_demurrage.ParamByName('@cd_cliente').AsString    := 'X'
              else
                sp_rel_ctrl_demurrage.ParamByName('@cd_cliente').AsString    := msk_cd_cliente.Text;
              ExecStoredProc( sp_rel_ctrl_demurrage );
              nr_identificador := sp_rel_ctrl_demurrage.ParamByName('@nr_identificador').AsInteger;
              CloseStoredProc( sp_rel_ctrl_demurrage );
            end;
          end;
      13: begin
            with datm_sel_unid_prod do
            begin
              ReportName  := cDir_Rpt + '\CRPG006.RPT';
              CloseStoredProc( sp_rel_req_pagto );
              sp_rel_req_pagto.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;
              if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_req_pagto.ParamByName('@cd_produto').AsString := 'X'
              else
                sp_rel_req_pagto.ParamByName('@cd_produto').AsString := msk_cd_produto.Text;
              if Trim( msk_nr_cheque.Text ) = '' then
                sp_rel_req_pagto.ParamByName('@nr_docto').AsString     := 'X'
              else
                sp_rel_req_pagto.ParamByName('@nr_docto').AsString     := msk_nr_cheque.Text;
              sp_rel_req_pagto.ParamByName('@dt_pagto').AsDate         := msk_dt_inicio.Date;
              ExecStoredProc( sp_rel_req_pagto );
              nr_identificador := sp_rel_req_pagto.ParamByName('@nr_identificador').AsInteger;
              CloseStoredProc( sp_rel_req_pagto );
            end;
          end;
      14: begin // Faturas Pendentes de emissão de boletos
            Screen.Cursor := crHourGlass;
            Application.ProcessMessages;

            Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
            ReportName  := cDir_Rpt + '\CRFT044.RPT';

            // Rodar Procedure
            with datm_sel_unid_prod do
            begin
              CloseStoredProc( sp_rel_fat_pend_boleto );
              if Trim( msk_cd_unid_neg.Text ) = '' then
                 sp_rel_fat_pend_boleto.ParamByName('@cd_unid_neg').AsString := 'X'
              else
                 sp_rel_fat_pend_boleto.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
              if Trim( msk_cd_produto.Text ) = '' then
                 sp_rel_fat_pend_boleto.ParamByName('@cd_produto').AsString := 'X'
              else
                 sp_rel_fat_pend_boleto.ParamByName('@cd_produto').AsString := Trim( msk_cd_produto.Text );
              if Trim( msk_cd_grupo.Text ) = '' then
                 sp_rel_fat_pend_boleto.ParamByName('@cd_grupo').AsString := 'X'
              else
                 sp_rel_fat_pend_boleto.ParamByName('@cd_grupo').AsString := Trim( msk_cd_grupo.Text );
              if Trim( msk_cd_cliente.Text ) = '' then
                 sp_rel_fat_pend_boleto.ParamByName('@cd_cliente').AsString := 'X'
              else
                 sp_rel_fat_pend_boleto.ParamByName('@cd_cliente').AsString := Trim( msk_cd_cliente.Text );

              sp_rel_fat_pend_boleto.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
              sp_rel_fat_pend_boleto.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
              ExecStoredProc( sp_rel_fat_pend_boleto );
              nr_identificador := sp_rel_fat_pend_boleto.ParamByName('@nr_identificador').AsInteger;
              CloseStoredProc( sp_rel_fat_pend_boleto );
            end;

            Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );

            if msk_dt_inicio.Date = msk_dt_fim.Date then
              ReportTitle := Trim( Caption ) + ' - ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date )
            else
              ReportTitle := Trim( Caption ) + ' - ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date );

            Screen.Cursor := crDefault;
            Application.ProcessMessages;
          end;
      15: begin
           with datm_sel_unid_prod do
           begin
             // ReportName  := cDir_Rpt + '\CRES012.RPT';
             CloseStoredProc( sp_rel_est_mercadoria );
             if Trim( msk_cd_unid_neg.Text ) = '' then
                sp_rel_est_mercadoria.ParamByName('@cd_unid_neg').AsString := 'X'
             else
                sp_rel_est_mercadoria.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
             if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_est_mercadoria.ParamByName('@cd_produto').AsString  := 'X'
             else
                sp_rel_est_mercadoria.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
             if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_est_mercadoria.ParamByName('@cd_grupo').AsString    := 'X'
             else
                sp_rel_est_mercadoria.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_est_mercadoria.ParamByName('@cd_cliente').AsString  := 'X'
             else
                sp_rel_est_mercadoria.ParamByName('@cd_cliente').AsString  := Trim( msk_cd_cliente.Text );
             sp_rel_est_mercadoria.ParamByName('@dt_inicio').AsDate        := msk_dt_inicio.Date;
             sp_rel_est_mercadoria.ParamByName('@dt_fim').AsDate           := msk_dt_fim.Date;
             ExecStoredProc( sp_rel_est_mercadoria );
             nr_identificador := sp_rel_est_mercadoria.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_est_mercadoria );

             GeraArquivoRelEstMercadoria( nr_identificador );
           end;
         end;
      16: begin
           with datm_sel_unid_prod do
           begin
             ReportName  := cDir_Rpt + '\CRFT020.RPT';
             if msk_dt_inicio.Date = msk_dt_fim.Date then
                ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' ]'
             else
                ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) + ' ]';
             CloseStoredProc( sp_rel_fat_pago_cli );
             if Trim( msk_cd_unid_neg.Text ) = '' then
                sp_rel_fat_pago_cli.ParamByName('@cd_unid_neg').AsString := 'X'
             else
                sp_rel_fat_pago_cli.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
             if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_fat_pago_cli.ParamByName('@cd_produto').AsString  := 'X'
             else
                sp_rel_fat_pago_cli.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
             if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_fat_pago_cli.ParamByName('@cd_grupo').AsString    := 'X'
             else
                sp_rel_fat_pago_cli.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_fat_pago_cli.ParamByName('@cd_cliente').AsString  := 'X'
             else
                sp_rel_fat_pago_cli.ParamByName('@cd_cliente').AsString  := Trim( msk_cd_cliente.Text );
             sp_rel_fat_pago_cli.ParamByName('@dt_inicio').AsDate        := msk_dt_inicio.Date;
             sp_rel_fat_pago_cli.ParamByName('@dt_fim').AsDate           := msk_dt_fim.Date;
             ExecStoredProc( sp_rel_fat_pago_cli );
             nr_identificador := sp_rel_fat_pago_cli.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_fat_pago_cli );
           end;
         end;
      17: begin
           with datm_sel_unid_prod do
           begin
             ReportName  := cDir_Rpt + '\CRES014.RPT';
             if msk_dt_inicio.Date = msk_dt_fim.Date then
                ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' ]'
             else
                ReportTitle := Caption + ' [ ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_inicio.Date ) + ' a ' + FormatDateTime( 'dd/mm/yyyy', msk_dt_fim.Date ) + ' ]';
             CloseStoredProc( sp_rel_est_arm_demurrage );
             if Trim( msk_cd_unid_neg.Text ) = '' then
                sp_rel_est_arm_demurrage.ParamByName('@cd_unid_neg').AsString := 'X'
             else
                sp_rel_est_arm_demurrage.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
             if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_est_arm_demurrage.ParamByName('@cd_produto').AsString  := 'X'
             else
                sp_rel_est_arm_demurrage.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
             if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_est_arm_demurrage.ParamByName('@cd_grupo').AsString    := 'X'
             else
                sp_rel_est_arm_demurrage.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_est_arm_demurrage.ParamByName('@cd_cliente').AsString  := 'X'
             else
                sp_rel_est_arm_demurrage.ParamByName('@cd_cliente').AsString  := Trim( msk_cd_cliente.Text );
             sp_rel_est_arm_demurrage.ParamByName('@dt_inicio').AsDate        := msk_dt_inicio.Date;
             sp_rel_est_arm_demurrage.ParamByName('@dt_fim').AsDate           := msk_dt_fim.Date;
             ExecStoredProc( sp_rel_est_arm_demurrage );
             nr_identificador := sp_rel_est_arm_demurrage.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_est_arm_demurrage );
           end;
         end;
      18: begin
            with datm_sel_unid_prod do
            begin
              ReportName  := cDir_Rpt + '\CRES015.RPT';
              CloseStoredProc( sp_rel_est_cntr_vl_cif );
              if Trim( msk_cd_unid_neg.Text ) = '' then
                sp_rel_est_cntr_vl_cif.ParamByName('@cd_unid_neg').AsString  := 'X'
              else
                sp_rel_est_cntr_vl_cif.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;
              if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_est_cntr_vl_cif.ParamByName('@cd_produto').AsString   := 'X'
              else
                sp_rel_est_cntr_vl_cif.ParamByName('@cd_produto').AsString   := msk_cd_produto.Text;
              if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_est_cntr_vl_cif.ParamByName('@cd_grupo').AsString     := 'X'
              else
                sp_rel_est_cntr_vl_cif.ParamByName('@cd_grupo').AsString     := msk_cd_grupo.Text;
              if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_est_cntr_vl_cif.ParamByName('@cd_cliente').AsString   := 'X'
              else
                sp_rel_est_cntr_vl_cif.ParamByName('@cd_cliente').AsString   := msk_cd_cliente.Text;
              sp_rel_est_cntr_vl_cif.ParamByName('@dt_ini').AsDate           := msk_dt_inicio.Date;
              sp_rel_est_cntr_vl_cif.ParamByName('@dt_fim').AsDate           := msk_dt_fim.Date;
              ExecStoredProc( sp_rel_est_cntr_vl_cif );
              nr_identificador := sp_rel_est_cntr_vl_cif.ParamByName('@nr_identificador').AsInteger;
              CloseStoredProc( sp_rel_est_cntr_vl_cif );
            end;
          end;
      19: begin     // SALDO PENDENTE
            for i := 0 to lb2.items.Count - 1 do
              vReferencias := vReferencias + (''''+ lb2.items[i]+''',');
            vReferencias := Copy(vReferencias, 1, length(vReferencias) -1);
            vReferencias := ConsultaLookUPSQL('SELECT master.dbo.RowConcat(''''+CD_REFERENCIA+'''') REFERENCIA FROM TTP_REFERENCIA WHERE NM_REFERENCIA in ('+vReferencias+')', 'REFERENCIA');
            with datm_sel_unid_prod do
            begin
              with qry_saldo_pendente_ do
              begin
                Close;
                SQL.Clear;
                SQL.Add(' SELECT P.CD_GRUPO, G.NM_GRUPO, P.CD_CLIENTE, EM.NM_EMPRESA, U.AP_UNID_NEG, PROD.NM_PRODUTO,');
                SQL.Add('   SUBSTRING(FP.NR_PROCESSO, 5, 10) PROCESSO,');
                SQL.Add('   (SELECT master.dbo.RowConcat( Distinct (RTRIM(REF.CD_REFERENCIA))) FROM TREF_CLIENTE REF (NOLOCK)');
                SQL.Add('    WHERE REF.NR_PROCESSO = P.NR_PROCESSO AND REF.TP_REFERENCIA IN ('+vReferencias+')) Pedido,');
                SQL.Add('   F.DT_FATURA, F.NR_NOTA_FATURA NR_SOLICITACAO, F.DT_VENCTO_FATURA, FP.VL_FATURA, FP.DT_LIQUIDACAO, FP.VL_LIQUIDACAO,');
                SQL.Add('   CASE FAT.CD_ITEM WHEN ''995'' THEN FP.VL_FATURA - (FP.VL_LIQUIDACAO * -1)');
                SQL.Add(' 		   ELSE FP.VL_FATURA + FP.VL_LIQUIDACAO END as Saldo,');
                SQL.Add('   DATEDIFF( day, F.DT_VENCTO_FATURA, GETDATE()) as ''Dias  Atrasado'', ');
                SQL.Add('   (SELECT SUM(CASE F822.IN_RESTITUI WHEN ''0'' THEN F822.VL_ITEM ELSE (F822.VL_ITEM * (-1)) END)) AS COMISSAO');
                SQL.Add(' FROM TS_FATURA F (NOLOCK)');
                SQL.Add('   INNER JOIN TS_FATURA_PROCESSO FP (NOLOCK) ON FP.NR_SOLICITACAO = F.NR_SOLICITACAO AND FP.CD_UNID_NEG = F.CD_UNID_NEG AND FP.CD_PRODUTO = F.CD_PRODUTO');
                SQL.Add('   INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = FP.NR_PROCESSO');
                SQL.Add('   INNER JOIN TEMPRESA_NAC EM (NOLOCK) ON EM.CD_EMPRESA = P.CD_CLIENTE');
                SQL.Add('   INNER JOIN TGRUPO G (NOLOCK) ON G.CD_GRUPO = EM.CD_GRUPO');
                SQL.Add('   INNER JOIN TUNID_NEG U (NOLOCK) ON U.CD_UNID_NEG = F.CD_UNID_NEG');
                SQL.Add('   INNER JOIN TPRODUTO PROD (NOLOCK) ON PROD.CD_PRODUTO = F.CD_PRODUTO');
                SQL.Add('   INNER JOIN TFATURAMENTO_CC FAT (NOLOCK)ON FAT.NR_SOLIC_FAT = F.NR_SOLICITACAO AND FAT.CD_UNID_NEG = F.CD_UNID_NEG AND FAT.CD_PRODUTO = F.CD_PRODUTO AND IN_RESTITUI = ''0'' AND CD_ITEM IN (''995'', ''996'') AND FAT.NR_PROCESSO = FP.NR_PROCESSO');
                SQL.Add('   LEFT JOIN TFATURAMENTO_CC F822 (NOLOCK)ON F822.NR_SOLIC_FAT = F.NR_SOLICITACAO AND F822.CD_UNID_NEG = F.CD_UNID_NEG AND F822.CD_PRODUTO = F.CD_PRODUTO AND F822.CD_ITEM = ''822'' AND FAT.NR_PROCESSO = FP.NR_PROCESSO ');
                SQL.Add('   INNER JOIN TSERVICO S (NOLOCK) ON S.CD_SERVICO = P.CD_SERVICO AND S.TP_SERVICO = ''0'' ');
                SQL.Add(' WHERE P.IN_CANCELADO = ''0'' ');
                SQL.Add('   AND F.IN_CANCELADO = ''0'' ');
                SQL.Add('   AND FP.IN_LIQUIDADO = ''0'' ');
                SQL.Add('   AND F.CD_PRODUTO NOT IN (''03'', ''10'') ');
                SQL.Add('   AND ABS(F.VL_FATURA) <> ABS(F.VL_LIQUIDACAO)');

                qry_tot_saldo_pendente.Close;
                qry_tot_saldo_pendente.SQL.Clear;
                qry_tot_saldo_pendente.SQL.Add('SELECT U.AP_UNID_NEG, PROD.NM_PRODUTO,');
                qry_tot_saldo_pendente.SQL.Add('  SUM( ROUND( ISNULL( FP.VL_FATURA, 0 ), 2 ) ) AS VL_FATURA,');
                qry_tot_saldo_pendente.SQL.Add('  SUM( ROUND( ISNULL( FP.VL_LIQUIDACAO, 0 ), 2 ) ) AS VL_LIQUIDACAO,');
                qry_tot_saldo_pendente.SQL.Add('  ROUND(SUM( ROUND( ROUND( ISNULL( FP.VL_FATURA, 0 ), 2 ), 2 ) + ROUND( ROUND( ISNULL( FP.VL_LIQUIDACAO, 0 ), 2 ), 2 ) ), 2 ) AS VL_SALDO_PENDENTE');
                qry_tot_saldo_pendente.SQL.Add(' FROM   TS_FATURA F (NOLOCK)');
                qry_tot_saldo_pendente.SQL.Add('  INNER JOIN TS_FATURA_PROCESSO FP (NOLOCK) ON FP.NR_SOLICITACAO = F.NR_SOLICITACAO AND FP.CD_UNID_NEG = F.CD_UNID_NEG AND FP.CD_PRODUTO = F.CD_PRODUTO');
                qry_tot_saldo_pendente.SQL.Add('  INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = FP.NR_PROCESSO');
                qry_tot_saldo_pendente.SQL.Add('  INNER JOIN TUNID_NEG U (NOLOCK) ON U.CD_UNID_NEG = F.CD_UNID_NEG');
                qry_tot_saldo_pendente.SQL.Add('  INNER JOIN TPRODUTO PROD (NOLOCK) ON PROD.CD_PRODUTO = F.CD_PRODUTO');
                qry_tot_saldo_pendente.SQL.Add('  INNER JOIN TSERVICO S (NOLOCK) ON S.CD_SERVICO = P.CD_SERVICO AND S.TP_SERVICO = ''0'' ');
                qry_tot_saldo_pendente.SQL.Add(' WHERE F.IN_CANCELADO = ''0'' ');
                qry_tot_saldo_pendente.SQL.Add('   AND FP.IN_LIQUIDADO = ''0'' ');
                qry_tot_saldo_pendente.SQL.Add('   AND F.CD_PRODUTO NOT IN (''03'', ''10'') ');
                qry_tot_saldo_pendente.SQL.Add('  AND ABS(F.VL_FATURA) <> ABS(F.VL_LIQUIDACAO)');

                if Trim( msk_cd_unid_neg.Text ) <> '' then
                begin
                  SQL.Add('   AND F.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' ');
                  qry_tot_saldo_pendente.SQL.Add('  AND F.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' ');
                end;
                if Trim( msk_cd_produto.Text) <> '' then
                begin
                  SQL.Add('   AND F.CD_PRODUTO = ''' + msk_cd_produto.Text + ''' ');
                  qry_tot_saldo_pendente.SQL.Add('  AND F.CD_PRODUTO = ''' + msk_cd_produto.Text + ''' ');
                end;
                if Trim( msk_cd_grupo.Text ) <> '' then
                begin
                  SQL.Add('   AND P.CD_GRUPO = ''' + msk_cd_grupo.Text + ''' ');
                  qry_tot_saldo_pendente.SQL.Add('  AND P.CD_GRUPO = ''' + msk_cd_grupo.Text + ''' ');
                end;
                if Trim( msk_cd_cliente.Text ) <> '' then
                begin
                  SQL.Add('   AND P.CD_CLIENTE = ''' + msk_cd_cliente.Text + ''' ');
                  qry_tot_saldo_pendente.SQL.Add('  AND P.CD_CLIENTE = ''' + msk_cd_cliente.Text + ''' ');
                end;
                if (chkVenc.Checked) then
                begin
                  SQL.Add('  AND (F.DT_VENCTO_FATURA < GETDATE())');
                  qry_tot_saldo_pendente.SQL.Add('  AND (F.DT_VENCTO_FATURA < GETDATE())');
                end;
                if (chkCred.Checked) and (chkDev.Checked = False) then
                begin
                  SQL.Add('   AND F.VL_FATURA > F.VL_LIQUIDACAO');
                  qry_tot_saldo_pendente.SQL.Add('  AND F.VL_FATURA > F.VL_LIQUIDACAO');
                end;
                if (chkCred.Checked = False) and (chkDev.Checked) then
                begin
                  SQL.Add('   AND F.VL_FATURA < F.VL_LIQUIDACAO');
                  qry_tot_saldo_pendente.SQL.Add('  AND F.VL_FATURA < F.VL_LIQUIDACAO');
                end;

                SQL.Add(' GROUP BY P.CD_GRUPO, P.CD_CLIENTE, P.CD_UNID_NEG, P.CD_PRODUTO, FP.NR_PROCESSO, P.NR_PROCESSO, G.NM_GRUPO, EM.NM_EMPRESA, FAT.CD_ITEM,');
                SQL.Add(' F.DT_FATURA, F.NR_NOTA_FATURA, F.DT_VENCTO_FATURA, FP.VL_FATURA, FP.DT_LIQUIDACAO, FP.VL_LIQUIDACAO, U.AP_UNID_NEG, PROD.NM_PRODUTO');
                SQL.Add(' ORDER BY G.NM_GRUPO, EM.NM_EMPRESA, P.CD_CLIENTE, P.CD_UNID_NEG, P.CD_PRODUTO,  FP.NR_PROCESSO');

                qry_tot_saldo_pendente.SQL.Add('  GROUP BY F.CD_UNID_NEG, F.CD_PRODUTO, U.AP_UNID_NEG, PROD.NM_PRODUTO');
                qry_tot_saldo_pendente.SQL.Add('  ORDER BY F.CD_UNID_NEG, F.CD_PRODUTO');

                qry_tot_saldo_pendente.Prepare;
                qry_tot_saldo_pendente.Open;
                Prepare;
                Open;
              end;
              if qry_saldo_pendente_.RecordCount = 0 then
              begin
                BoxMensagem( 'Não existem dados que atendam ao filtro especificado!', 2 );
                Exit;
              end
              else
              begin
                //chama o form de impressão!!
                Application.CreateForm(TFrm_impressao, Frm_impressao );
                frm_impressao.cd_unid_neg   := msk_cd_unid_neg.Text;
                frm_impressao.cd_produto    := msk_cd_produto.Text;
                frm_impressao.cd_via_transp := '';
                frm_impressao.cd_modulo     := '1402';
                frm_impressao.cd_grupo      := msk_cd_grupo.Text;
                frm_impressao.cd_emp_nac    := msk_cd_cliente.Text;
                frm_impressao.vApenas_email := false;
                frm_impressao.ShowModal;
                frm_impressao.Release;

{                ppRep.Template.FileName := cDir_RPT + '\Rel_SaldoPendente.RTM';
                ppRep.Template.LoadFromFile;
                ppRep.AllowPrintToFile  := True;
                ppRep.Print;}
              end;
              qry_saldo_pendente_.Close;
              qry_tot_saldo_pendente.Close;
            end;
            EXIT;
          end;
{             ReportName  := cDir_Rpt + '\CRLQ002.RPT';
             CloseStoredProc( sp_rel_liq_saldos_pendentes );
             if Trim( msk_cd_unid_neg.Text ) = '' then
               sp_rel_liq_saldos_pendentes.ParamByName('@cd_unid_neg').AsString := 'X'
             else
               sp_rel_liq_saldos_pendentes.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
             if Trim( msk_cd_produto.Text ) = '' then
               sp_rel_liq_saldos_pendentes.ParamByName('@cd_produto').AsString  := 'X'
             else
               sp_rel_liq_saldos_pendentes.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
             if Trim( msk_cd_grupo.Text ) = '' then
               sp_rel_liq_saldos_pendentes.ParamByName('@cd_grupo').AsString    := 'X'
             else
               sp_rel_liq_saldos_pendentes.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
               sp_rel_liq_saldos_pendentes.ParamByName('@cd_cliente').AsString  := 'X'
             else
               sp_rel_liq_saldos_pendentes.ParamByName('@cd_cliente').AsString  := Trim( msk_cd_cliente.Text );
             if chkVenc.Checked then
               sp_rel_liq_saldos_pendentes.ParamByName('@inVenc').AsString  := '1'
             else
               sp_rel_liq_saldos_pendentes.ParamByName('@inVenc').AsString  := '0';
             if chkCred.Checked then
               sp_rel_liq_saldos_pendentes.ParamByName('@inCredor').AsString  := '1'
             else
               sp_rel_liq_saldos_pendentes.ParamByName('@inCredor').AsString  := '0';
             if chkDev.Checked then
               sp_rel_liq_saldos_pendentes.ParamByName('@inDevedor').AsString  := '1'
             else
               sp_rel_liq_saldos_pendentes.ParamByName('@inDevedor').AsString  := '0';

             ExecStoredProc( sp_rel_liq_saldos_pendentes );
             nr_identificador := sp_rel_liq_saldos_pendentes.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_liq_saldos_pendentes );}
      20: begin
            with datm_sel_unid_prod do
            begin
              ReportName  := cDir_Rpt + '\CRES016.RPT';
              CloseStoredProc( sp_rel_est_arm_prefixo );
              if Trim( msk_cd_unid_neg.Text ) = '' then
                sp_rel_est_arm_prefixo.ParamByName('@cd_unid_neg').AsString := 'X'
              else
                sp_rel_est_arm_prefixo.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
              if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_est_arm_prefixo.ParamByName('@cd_produto').AsString  := 'X'
              else
                sp_rel_est_arm_prefixo.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
              if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_est_arm_prefixo.ParamByName('@cd_grupo').AsString    := 'X'
              else
                sp_rel_est_arm_prefixo.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
              if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_est_arm_prefixo.ParamByName('@cd_cliente').AsString  := 'X'
              else
                sp_rel_est_arm_prefixo.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
              if Trim( msk_cd_prefixo.Text ) = '' then
                sp_rel_est_arm_prefixo.ParamByName('@cd_prefixo').AsString  := 'X'
              else
                sp_rel_est_arm_prefixo.ParamByName('@cd_prefixo').AsString  := msk_cd_prefixo.Text;
              sp_rel_est_arm_prefixo.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
              sp_rel_est_arm_prefixo.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
              ExecStoredProc( sp_rel_est_arm_prefixo );
              nr_identificador := sp_rel_est_arm_prefixo.ParamByName('@nr_identificador').AsInteger;
              CloseStoredProc( sp_rel_est_arm_prefixo );
            end;
          end;
      21: begin
            with datm_sel_unid_prod do
            begin
              ReportName  := cDir_Rpt + '\CRFT024.RPT';
              CloseStoredProc( sp_rel_fat_saldos );
              if Trim( msk_cd_unid_neg.Text ) = '' then
                sp_rel_fat_saldos.ParamByName('@cd_unid_neg').AsString := 'X'
              else
                sp_rel_fat_saldos.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
              if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_fat_saldos.ParamByName('@cd_produto').AsString  := 'X'
              else
                sp_rel_fat_saldos.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
              if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_fat_saldos.ParamByName('@cd_grupo').AsString    := 'X'
              else
                sp_rel_fat_saldos.ParamByName('@cd_grupo').AsString    := msk_cd_grupo.Text;
              if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_fat_saldos.ParamByName('@cd_cliente').AsString  := 'X'
              else
                sp_rel_fat_saldos.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
              sp_rel_fat_saldos.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
              sp_rel_fat_saldos.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
              ExecStoredProc( sp_rel_fat_saldos );
              nr_identificador := sp_rel_fat_saldos.ParamByName('@nr_identificador').AsInteger;
              CloseStoredProc( sp_rel_fat_saldos );
            end;
          end;
      22: begin
             with datm_sel_unid_prod do
             begin
               ReportName  := cDir_Rpt + '\CRLQ004.RPT';
               CloseStoredProc( sp_rel_liquidacao );
               if Trim( msk_cd_unid_neg.Text ) = '' then
                 sp_rel_liquidacao.ParamByName('@cd_unid_neg').AsString := 'X'
               else
                 sp_rel_liquidacao.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
               if Trim( msk_cd_produto.Text ) = '' then
                 sp_rel_liquidacao.ParamByName('@cd_produto').AsString  := 'X'
               else
                 sp_rel_liquidacao.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
               if Trim( msk_cd_grupo.Text ) = '' then
                 sp_rel_liquidacao.ParamByName('@cd_grupo').AsString    := 'X'
               else
                 sp_rel_liquidacao.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
               if Trim( msk_cd_cliente.Text ) = '' then
                 sp_rel_liquidacao.ParamByName('@cd_cliente').AsString  := 'X'
               else
                 sp_rel_liquidacao.ParamByName('@cd_cliente').AsString  := Trim( msk_cd_cliente.Text );
               sp_rel_liquidacao.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
               sp_rel_liquidacao.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
               ExecStoredProc( sp_rel_liquidacao );
               nr_identificador := sp_rel_liquidacao.ParamByName('@nr_identificador').AsInteger;
               CloseStoredProc( sp_rel_liquidacao );
             end;
          end;
      23: begin
             with datm_sel_unid_prod do
             begin
               CloseStoredProc( sp_rel_est_desp );
               if Trim( msk_cd_unid_neg.Text ) = '' then
                 sp_rel_est_desp.ParamByName('@cd_unid_neg').AsString := 'X'
               else
                 sp_rel_est_desp.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
               if Trim( msk_cd_produto.Text ) = '' then
                 sp_rel_est_desp.ParamByName('@cd_produto').AsString  := 'X'
               else
                 sp_rel_est_desp.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
               if Trim( msk_cd_grupo.Text ) = '' then
                 sp_rel_est_desp.ParamByName('@cd_grupo').AsString    := 'X'
               else
                 sp_rel_est_desp.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
               if Trim( msk_cd_cliente.Text ) = '' then
                 sp_rel_est_desp.ParamByName('@cd_cliente').AsString  := 'X'
               else
                 sp_rel_est_desp.ParamByName('@cd_cliente').AsString  := Trim( msk_cd_cliente.Text );
               sp_rel_est_desp.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
               sp_rel_est_desp.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
               ExecStoredProc( sp_rel_est_desp );
               nr_identificador := sp_rel_est_desp.ParamByName('@nr_identificador').AsInteger;
               CloseStoredProc( sp_rel_est_desp );

               GeraArquivoRelEstDesp( nr_identificador );
             end;
         end;
      24: begin
            // Herdado em frm_sel_unid_cont
          end;

      25: begin
            with datm_sel_unid_prod do
            begin
              try
                datm_main.db_broker.StartTransaction;
                CloseStoredProc( sp_rel_dem_estatistico );
                if Trim( msk_cd_unid_neg.Text ) = '' then
                  sp_rel_dem_estatistico.ParamByName('@cd_unid_neg').AsString   := 'X'
                else
                  sp_rel_dem_estatistico.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
                if Trim( msk_cd_produto.Text ) = '' then
                  sp_rel_dem_estatistico.ParamByName('@cd_produto').AsString    := 'X'
                else
                  sp_rel_dem_estatistico.ParamByName('@cd_produto').AsString    := msk_cd_produto.Text;
                if Trim( msk_cd_grupo.Text ) = '' then
                  sp_rel_dem_estatistico.ParamByName('@cd_grupo').AsString      := 'X'
                else
                  sp_rel_dem_estatistico.ParamByName('@cd_grupo').AsString      := msk_cd_grupo.Text;
                if Trim( msk_cd_cliente.Text ) = '' then
                  sp_rel_dem_estatistico.ParamByName('@cd_cliente').AsString    := 'X'
                else
                  sp_rel_dem_estatistico.ParamByName('@cd_cliente').AsString    := msk_cd_cliente.Text;
                sp_rel_dem_estatistico.ParamByName('@dt_inicio').AsDateTime     := msk_dt_inicio.Date;
                sp_rel_dem_estatistico.ParamByName('@dt_fim').AsDateTime        := msk_dt_fim.Date;
                ExecStoredProc( sp_rel_dem_estatistico );
                nr_identificador := sp_rel_dem_estatistico.ParamByName('@nr_identificador').AsInteger;
                CloseStoredProc( sp_rel_dem_estatistico );

                qry_rel_dem_est_.Close;
                qry_rel_dem_est_.ParamByName('NR_IDENTIFICADOR').AsInteger      := nr_identificador;
                qry_rel_dem_est_.Prepare;
                qry_rel_dem_est_.Open;

                ppRelSelUnidProd.Template.FileName         := cDir_RPT + '\RBDEM002.RTM';
                ppRelSelUnidProd.Template.LoadFromFile;
                ppRelSelUnidProd.AllowPrintToFile          := True;
                ppRelSelUnidProd.PrinterSetup.DocumentName := Caption;
                ppRelSelUnidProd.TextFileName              := cDir_RPT + '\Relatorio Estatistico de Demurrage.PDF';
                if chk_arquivo.Checked then
                begin
                  ppRelSelUnidProd.DeviceType              := 'PDFFile';
                end
                else
                begin
                  if chk_excel.Checked then
                  begin
                    ImprimeExcel;
                  end
                  else
                  begin
                    ppRelSelUnidProd.DeviceType := 'Screen';
                  end;
                end;
                datm_main.db_broker.Commit;
                ppRelSelUnidProd.Print;
              except
                on E: Exception do
                begin
                  if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                  TrataErro(E);
                end;
              end;
            end;
          end;

      26: begin
            with datm_sel_unid_prod do
            begin
              try
                datm_main.db_broker.StartTransaction;
                CloseStoredProc( sp_rel_rent_proc );
                if Trim( msk_cd_unid_neg.Text ) = '' then
                  sp_rel_rent_proc.ParamByName('@cd_unid_neg').AsString   := 'X'
                else
                  sp_rel_rent_proc.ParamByName('@cd_unid_neg').AsString   := msk_cd_unid_neg.Text;
                if Trim( msk_cd_produto.Text ) = '' then
                  sp_rel_rent_proc.ParamByName('@cd_produto').AsString    := 'X'
                else
                  sp_rel_rent_proc.ParamByName('@cd_produto').AsString    := msk_cd_produto.Text;
                if Trim( msk_cd_grupo.Text ) = '' then
                  sp_rel_rent_proc.ParamByName('@cd_grupo').AsString      := 'X'
                else
                  sp_rel_rent_proc.ParamByName('@cd_grupo').AsString      := msk_cd_grupo.Text;
                if Trim( msk_cd_cliente.Text ) = '' then
                  sp_rel_rent_proc.ParamByName('@cd_cliente').AsString    := 'X'
                else
                  sp_rel_rent_proc.ParamByName('@cd_cliente').AsString    := msk_cd_cliente.Text;
                sp_rel_rent_proc.ParamByName('@dt_inicio').AsDateTime     := msk_dt_inicio.Date;
                sp_rel_rent_proc.ParamByName('@dt_fim').AsDateTime        := msk_dt_fim.Date;
                ExecStoredProc( sp_rel_rent_proc );
                nr_identificador := sp_rel_rent_proc.ParamByName('@nr_identificador').AsInteger;
                CloseStoredProc( sp_rel_rent_proc );
                datm_main.db_broker.Commit;

                qry_rel_rent_proc_capa_.Close;
                qry_rel_rent_proc_capa_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                qry_rel_rent_proc_capa_.Prepare;
                qry_rel_rent_proc_capa_.Open;

                if qry_rel_rent_proc_capa_.EOF then
                begin
                  BoxMensagem('Impressão de Rentabilidade de Processo vazia!', 2);
                  msk_cd_unid_neg.Text;
                  Exit
                end
                else
                begin
                  qry_rel_rent_proc_item_.Close;
                  qry_rel_rent_proc_item_.Prepare;
                  qry_rel_rent_proc_item_.Open;

                  qry_rel_rent_proc_capa_pedido_.Close;
                  qry_rel_rent_proc_capa_pedido_.Prepare;
                  qry_rel_rent_proc_capa_pedido_.Open;

                  qry_sum_coluna_rent_proc_.Close;
                  qry_sum_coluna_rent_proc_.Prepare;
                  qry_sum_coluna_rent_proc_.Open;

                  qry_tot_coluna_rent_proc_.Close;
                  qry_tot_coluna_rent_proc_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                  qry_tot_coluna_rent_proc_.Prepare;
                  qry_tot_coluna_rent_proc_.Open;

                  ppRelSelUnidProd.Template.FileName         := cDir_RPT + '\RBFAT002.RTM';
                  ppRelSelUnidProd.Template.LoadFromFile;
                  ppRelSelUnidProd.AllowPrintToFile          := True;
                  ppRelSelUnidProd.TextFileName              := cDir_Rpt + '\RBFAT002.PDF';
                  ppRelSelUnidProd.PrinterSetup.DocumentName := Caption;
                  if chk_arquivo.Checked then
                    ppRelSelUnidProd.DeviceType              := 'PDFFile'
                  else
                   ppRelSelUnidProd.DeviceType              := 'Screen';
                  ppRelSelUnidProd.Print;
                end;
              except
                on E: Exception do
                begin
                  if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                  TrataErro(E);
                end;
              end;
            end;
          end;

      27: begin
            with datm_sel_unid_prod do
            begin
              Screen.Cursor := crHourGlass;
              Application.ProcessMessages;

              ReportName  := cDir_Rpt + '\CRFI014.RPT';
              // Rodar Procedure
              CloseStoredProc( sp_rel_demo_cc );
              if Trim( msk_cd_unid_neg.Text ) = '' then
                sp_rel_demo_cc.ParamByName('@cd_unid_neg').AsString  := 'X'
              else
                sp_rel_demo_cc.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;
              if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_demo_cc.ParamByName('@cd_produto').AsString   := 'X'
              else
                sp_rel_demo_cc.ParamByName('@cd_produto').AsString   := msk_cd_produto.Text;
              if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_demo_cc.ParamByName('@cd_grupo').AsString     := 'X'
              else
                sp_rel_demo_cc.ParamByName('@cd_grupo').AsString     := Trim( msk_cd_grupo.Text );
              if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_demo_cc.ParamByName('@cd_cliente').AsString   := 'X'
              else
                sp_rel_demo_cc.ParamByName('@cd_cliente').AsString   := Trim( msk_cd_cliente.Text );
              sp_rel_demo_cc.ParamByName('@dt_inicio').AsDate        := msk_dt_inicio.Date;
              sp_rel_demo_cc.ParamByName('@dt_fim').AsDate           := msk_dt_fim.Date;
              sp_rel_demo_cc.ParamByName('@nr_relatorio').AsString   := Trim( msk_nr_relatorio.Text );
              sp_rel_demo_cc.ParamByName('@cd_usuario').AsString     := Trim( str_cd_usuario );
              ExecStoredProc( sp_rel_demo_cc );
              nr_identificador := sp_rel_demo_cc.ParamByName('@nr_identificador').AsInteger;
              CloseStoredProc( sp_rel_demo_cc );
            end;
            if Trim( edt_nm_grupo.Text ) <> '' then
              Formulas[0] := 'NomeCliente = "'+ Trim( edt_nm_grupo.Text ) + '"'
            else
              Formulas[0] := 'NomeCliente = "'+ Trim( edt_nm_cliente.Text ) + '"';
            Formulas[1] := 'NomeUnidade = "'+ edt_nm_unid_neg.Text + '"';
            Formulas[2] := 'NrIdentificador = ' + IntToStr( nr_identificador );

            Screen.Cursor := crDefault;
            Application.ProcessMessages;
          end;

      28: begin  // RELATÓRIO LEAD TIME PO
            with datm_sel_unid_prod do
            begin
              Screen.Cursor := crHourGlass;
              Application.ProcessMessages;
              try
                datm_main.db_broker.StartTransaction;
                // Rodar Procedure
                CloseStoredProc( sp_rel_lead_time_po );
                sp_rel_lead_time_po.ParamByName('@dt_inicio').AsDate            := msk_dt_inicio.Date;
                sp_rel_lead_time_po.ParamByName('@dt_fim').AsDate               := msk_dt_fim.Date;
                if Trim( msk_cd_fornecedor.Text ) = '' then
                  sp_rel_lead_time_po.ParamByName('@cd_fornecedor').AsString    := 'X'
                else
                  sp_rel_lead_time_po.ParamByName('@cd_fornecedor').AsString    := Trim( msk_cd_fornecedor.Text );
                if Trim( msk_cd_cliente.Text ) = '' then
                  sp_rel_lead_time_po.ParamByName('@cd_cliente').AsString       := 'X'
                else
                  sp_rel_lead_time_po.ParamByName('@cd_cliente').AsString       := Trim( msk_cd_cliente.Text );
                if Trim( msk_cd_grupo.Text ) = '' then
                  sp_rel_lead_time_po.ParamByName('@cd_grupo').AsString         := 'X'
                else
                  sp_rel_lead_time_po.ParamByName('@cd_grupo').AsString         := Trim( msk_cd_grupo.Text );
                ExecStoredProc( sp_rel_lead_time_po );
                nr_identificador := sp_rel_lead_time_po.ParamByName('@nr_identificador').AsInteger;
                CloseStoredProc( sp_rel_lead_time_po );
                datm_main.db_broker.Commit;

                qry_rel_lead_time_po_.Close;
                qry_rel_lead_time_po_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                qry_rel_lead_time_po_.Prepare;
                qry_rel_lead_time_po_.Open;

                Screen.Cursor := crDefault;
                Application.ProcessMessages;

                if qry_rel_lead_time_po_.RecordCount = 0 then
                begin
                  BoxMensagem('Impressão de Lead Time PO vazia!', 2);
                  msk_cd_cliente.Text;
                  Exit
                end
                else
                begin
                  ppRelSelUnidProd.Template.FileName := cDir_RPT + '\RBLT001.RTM';
                  ppRelSelUnidProd.Template.LoadFromFile;
                  ppRelSelUnidProd.AllowPrintToFile := True;
                  ppRelSelUnidProd.PrinterSetup.DocumentName := Caption;
                  ppRelSelUnidProd.TextFileName     := cDir_Rpt + '\RBLT001.PDF';
                  if chk_arquivo.Checked then
                    ppRelSelUnidProd.DeviceType     := 'PDFFile'
                  else
                    ppRelSelUnidProd.DeviceType     := 'Screen';
                  ppRelSelUnidProd.Print;
                  qry_rel_lead_time_po_.Close;
                end;
              except
                on E: Exception do
                begin
                  if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                  TrataErro(E);
                end;
              end;
            end;
          end;
      29: begin  // Estatístico Qtde de Contêineres
            with datm_sel_unid_prod do
            begin
              Screen.Cursor := crHourGlass;
              Application.ProcessMessages;
              try
                datm_main.db_broker.StartTransaction;
                // Rodar Procedure
                CloseStoredProc( sp_rel_est_qt_cntr );
                if Trim( msk_cd_unid_neg.Text ) = '' then
                  sp_rel_est_qt_cntr.ParamByName('@cd_unid_neg').AsString := 'X'
                else
                  sp_rel_est_qt_cntr.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
                if Trim( msk_cd_produto.Text ) = '' then
                  sp_rel_est_qt_cntr.ParamByName('@cd_produto').AsString  := 'X'
                else
                  sp_rel_est_qt_cntr.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
                if Trim( msk_cd_grupo.Text ) = '' then
                  sp_rel_est_qt_cntr.ParamByName('@cd_grupo').AsString    := 'X'
                else
                  sp_rel_est_qt_cntr.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
                if Trim( msk_cd_cliente.Text ) = '' then
                  sp_rel_est_qt_cntr.ParamByName('@cd_cliente').AsString  := 'X'
                else
                  sp_rel_est_qt_cntr.ParamByName('@cd_cliente').AsString  := Trim( msk_cd_cliente.Text );
                if Trim( msk_cd_area.Text ) = '' then
                  sp_rel_est_qt_cntr.ParamByName('@cd_area').AsString     := 'X'
                else
                  sp_rel_est_qt_cntr.ParamByName('@cd_area').AsString     := Trim( msk_cd_area.Text );
                if Trim( msk_sg_grupo_area.Text ) = '' then
                  sp_rel_est_qt_cntr.ParamByName('@cd_grupo_area').AsString     := 'X'
                else
                  sp_rel_est_qt_cntr.ParamByName('@cd_grupo_area').AsString     := Trim( msk_sg_grupo_area.Text );
                sp_rel_est_qt_cntr.ParamByName('@dt_inicio').AsDate       := msk_dt_inicio.Date;
                sp_rel_est_qt_cntr.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
                ExecStoredProc( sp_rel_est_qt_cntr );
                nr_identificador := sp_rel_est_qt_cntr.ParamByName('@nr_identificador').AsInteger;
                CloseStoredProc( sp_rel_est_qt_cntr );

                datm_main.db_broker.Commit;

                qry_rel_est_qt_cntr_.Close;
                qry_rel_est_qt_cntr_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                qry_rel_est_qt_cntr_.Prepare;
                qry_rel_est_qt_cntr_.Open;

                Screen.Cursor := crDefault;
                Application.ProcessMessages;

                if qry_rel_est_qt_cntr_.RecordCount = 0 then
                begin
                  BoxMensagem( 'Não existem dados que atendam ao filtro especificado!', 2 );
                  msk_dt_inicio.SetFocus;
                  Exit
                end
                else
                begin
                  ppRelSelUnidProd.Template.FileName         := cDir_RPT + '\RBEST002.RTM';
                  ppRelSelUnidProd.Template.LoadFromFile;
                  ppRelSelUnidProd.AllowPrintToFile          := True;
                  ppRelSelUnidProd.TextFileName              := cDir_Rpt + '\RBEST002.PDF';
                  ppRelSelUnidProd.PrinterSetup.DocumentName := Caption;
                  ppTitle.Caption := 'Qtde de Cntr: ' +
                                     FormatDateTime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_inicio.Date ) + ' a ' +
                                     FormatDateTime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_fim.Date );

                  if ( Trim( msk_cd_produto.Text ) = '01' ) or ( Trim( msk_cd_produto.Text ) = '03' ) then
                    ppTitle.Caption := ppTitle.Caption + ' - Importação';
                  if ( Trim( msk_cd_produto.Text ) = '02' ) or ( Trim( msk_cd_produto.Text ) = '10' ) then
                    ppTitle.Caption := ppTitle.Caption + ' - Exportação';
                  if ( Trim( msk_cd_produto.Text ) = '' ) then
                    ppTitle.Caption := ppTitle.Caption + ' - Importação/Exportação';

                  if ( Trim (msk_cd_area.Text) <> '' ) then
                    ppTitle.Caption := ppTitle.Caption + ' - Área [ ' + edt_nm_area.Text + ' ] '
                  else
                    if ( Trim (msk_sg_grupo_area.Text) <> '' ) then
                      ppTitle.Caption := ppTitle.Caption + ' - Grupo [ ' + msk_sg_grupo_area.Text + ' ] ';



                  if chk_arquivo.Checked then
                    ppRelSelUnidProd.DeviceType              := 'PDFFile'
                  else
                    ppRelSelUnidProd.DeviceType              := 'Screen';
                  ppRelSelUnidProd.Print;
                  qry_rel_est_qt_cntr_.Close;
                end;
              except
                on E: Exception do
                begin
                  if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                  TrataErro(E);
                end;
              end;
            end;
          end;
      30: begin  // PO - Relatório de Previsto/Embarcado
            with datm_sel_unid_prod do
            begin
              Screen.Cursor := crHourGlass;
              Application.ProcessMessages;
              try
                datm_main.db_broker.StartTransaction;
                // Rodar Procedure
                CloseStoredProc( sp_rel_po_emb );
                if Trim( msk_cd_grupo.Text ) = '' then
                  sp_rel_po_emb.ParamByName('@cd_grupo').AsString    := 'X'
                else
                  sp_rel_po_emb.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
                if Trim( msk_cd_cliente.Text ) = '' then
                  sp_rel_po_emb.ParamByName('@cd_cliente').AsString  := 'X'
                else
                  sp_rel_po_emb.ParamByName('@cd_cliente').AsString  := Trim( msk_cd_cliente.Text );
                sp_rel_po_emb.ParamByName('@dt_ini').AsDate          := msk_dt_inicio.Date;
                sp_rel_po_emb.ParamByName('@dt_fim').AsDate          := msk_dt_fim.Date;
                ExecStoredProc( sp_rel_po_emb );
                nr_identificador := sp_rel_po_emb.ParamByName('@nr_identificador').AsInteger;
                CloseStoredProc( sp_rel_po_emb );

                datm_main.db_broker.Commit;

                qry_rel_po_emb_.Close;
                qry_rel_po_emb_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                qry_rel_po_emb_.Prepare;
                qry_rel_po_emb_.Open;

                qry_rel_po_emb_graf_.Close;
                qry_rel_po_emb_graf_.Prepare;
                qry_rel_po_emb_graf_.Open;

                Screen.Cursor := crDefault;
                Application.ProcessMessages;

                if qry_rel_po_emb_.RecordCount = 0 then
                begin
                  BoxMensagem( 'Não existem dados que atendam ao filtro especificado!', 2 );
                  msk_dt_inicio.SetFocus;
                  Exit
                end
                else
                begin
                  ppRelSelUnidProd.Template.FileName         := cDir_RPT + '\RBPO002.RTM';
                  ppRelSelUnidProd.Template.LoadFromFile;
                  ppRelSelUnidProd.AllowPrintToFile          := True;
                  ppRelSelUnidProd.TextFileName              := cDir_Rpt + '\RBPO002.PDF';
                  ppRelSelUnidProd.PrinterSetup.DocumentName := Caption;
                  ppTitle.Caption := 'Relação de Embarques: ' +
                                     FormatDateTime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_inicio.Date ) + ' a ' +
                                     FormatDateTime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_fim.Date );
                  if chk_arquivo.Checked then
                    ppRelSelUnidProd.DeviceType              := 'PDFFile'
                  else
                    ppRelSelUnidProd.DeviceType              := 'Screen';
                  ppRelSelUnidProd.Print;
                  qry_rel_po_emb_.Close;
                end;
              except
                on E: Exception do
                begin
                  if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                  TrataErro(E);
                end;
              end;
            end;
          end;
      31: begin  // RELATÓRIO GERENCIAL NIVEL DE SERVIÇO
            with datm_sel_unid_prod do
            begin
              Screen.Cursor := crHourGlass;
              Application.ProcessMessages;
              try
                datm_main.db_broker.StartTransaction;
                // Rodar Procedure
                CloseStoredProc( sp_rel_nivel_servico_po );
                sp_rel_nivel_servico_po.ParamByName('@dt_inicio').AsDate            := msk_dt_inicio.Date;
                sp_rel_nivel_servico_po.ParamByName('@dt_fim').AsDate               := msk_dt_fim.Date;
                if Trim( msk_cd_fornecedor.Text ) = '' then
                  sp_rel_nivel_servico_po.ParamByName('@cd_fornecedor').AsString    := 'X'
                else
                  sp_rel_nivel_servico_po.ParamByName('@cd_fornecedor').AsString    := Trim( msk_cd_fornecedor.Text );
                if Trim( msk_cd_cliente.Text ) = '' then
                  sp_rel_nivel_servico_po.ParamByName('@cd_cliente').AsString       := 'X'
                else
                  sp_rel_nivel_servico_po.ParamByName('@cd_cliente').AsString       := Trim( msk_cd_cliente.Text );
                if Trim( msk_cd_grupo.Text ) = '' then
                  sp_rel_nivel_servico_po.ParamByName('@cd_grupo').AsString         := 'X'
                else
                  sp_rel_nivel_servico_po.ParamByName('@cd_grupo').AsString         := Trim( msk_cd_grupo.Text );
                ExecStoredProc( sp_rel_nivel_servico_po );
                nr_identificador := sp_rel_nivel_servico_po.ParamByName('@nr_identificador').AsInteger;
                CloseStoredProc( sp_rel_nivel_servico_po );
                datm_main.db_broker.Commit;

                qry_rel_nivel_servico_.Close;
                qry_rel_nivel_servico_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                qry_rel_nivel_servico_.Prepare;
                qry_rel_nivel_servico_.Open;

                qry_nivel_servico_po_graf_bar_.Close;
                qry_nivel_servico_po_graf_bar_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                qry_nivel_servico_po_graf_bar_.Prepare;
                qry_nivel_servico_po_graf_bar_.Open;

                Screen.Cursor := crDefault;
                Application.ProcessMessages;

                if qry_rel_nivel_servico_.RecordCount = 0 then
                begin
                  BoxMensagem('Impressão de Nível de Serviço vazia!', 2);
                  msk_cd_cliente.Text;
                  Exit
                end
                else
                begin
                  ppRelSelUnidProd.Template.FileName := cDir_RPT + '\RBPO003.RTM';
                  ppRelSelUnidProd.Template.LoadFromFile;
                  ppRelSelUnidProd.AllowPrintToFile := True;
                  ppRelSelUnidProd.PrinterSetup.DocumentName := Caption;
                  ppRelSelUnidProd.TextFileName     := cDir_Rpt + '\RBPO003.PDF';
                  if chk_arquivo.Checked then
                    ppRelSelUnidProd.DeviceType     := 'PDFFile'
                  else
                    ppRelSelUnidProd.DeviceType     := 'Screen';
                  ppRelSelUnidProd.Print;
                  qry_rel_nivel_servico_.Close;
                  qry_nivel_servico_po_graf_bar_.Close;
                end;
              except
                on E: Exception do
                begin
                  if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                  TrataErro(E);
                end;
              end;
            end;
          end;
      32: begin  // PO - Relatório de Embarque
            with datm_sel_unid_prod do
            begin
              Screen.Cursor := crHourGlass;
              Application.ProcessMessages;
              try
                datm_main.db_broker.StartTransaction;
                // Rodar Procedure
                datainicio := Copy(datetostr(msk_dt_inicio.Date), 4,7);
                datafim := Copy(datetostr(msk_dt_fim.Date),4,7);
                CloseStoredProc( sp_rel_po_emb_web );
                if Trim( msk_cd_grupo.Text ) = '' then
                  sp_rel_po_emb_web.ParamByName('@cd_grupo').AsString    := 'X'
                else
                  sp_rel_po_emb_web.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
                if Trim( msk_cd_cliente.Text ) = '' then
                  sp_rel_po_emb_web.ParamByName('@cd_cliente').AsString  := 'X'
                else
                  sp_rel_po_emb_web.ParamByName('@cd_cliente').AsString  := Trim( msk_cd_cliente.Text );
                sp_rel_po_emb_web.ParamByName('@dt_ini').AsDateTime      := msk_dt_inicio.Date;
                sp_rel_po_emb_web.ParamByName('@dt_fim').AsDateTime      := msk_dt_fim.Date;
                ExecStoredProc( sp_rel_po_emb_web );
                nr_identificador := sp_rel_po_emb_web.ParamByName('@nr_identificador').AsInteger;
                CloseStoredProc( sp_rel_po_emb_web );

                datm_main.db_broker.Commit;

                qry_trel_po_emb_web_.Close;
                qry_trel_po_emb_web_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                qry_trel_po_emb_web_.Prepare;
                qry_trel_po_emb_web_.Open;

                Screen.Cursor := crDefault;
                Application.ProcessMessages;

                if qry_trel_po_emb_web_.RecordCount = 0 then
                begin
                  BoxMensagem( 'Não existem dados que atendam ao filtro especificado!', 2 );
                  msk_dt_inicio.SetFocus;
                  Exit
                end
                else
                begin
                  // Series1.Clear;
                  qry_trel_po_emb_web_graf_.Close;
                  qry_trel_po_emb_web_graf_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                  qry_trel_po_emb_web_graf_.Prepare;
                  qry_trel_po_emb_web_graf_.Open;

                  qry_graf1_.Close;
                  qry_graf1_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                  qry_graf1_.Prepare;
                  qry_graf1_.Open;

                  qry_graf2_.Close;
                  qry_graf2_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                  qry_graf2_.Prepare;
                  qry_graf2_.Open;

                  qry_graf3_.Close;
                  qry_graf3_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                  qry_graf3_.Prepare;
                  qry_graf3_.Open;
                  (*
                  qry_trel_po_emb_web_graf_.First;
                  repeat
                    With Series1 do
                    Begin
                      if TRIM( qry_trel_po_emb_web_graf_AP_MERCADORIA.Value ) = 'Lupranat T80' then
                        AddPie( qry_trel_po_emb_web_graf_QT_MERCADORIA.AsFloat,qry_trel_po_emb_web_graf_AP_MERC_ANO.asString, clRed   );

                      if TRIM( qry_trel_po_emb_web_graf_AP_MERCADORIA.Value ) = 'PLURACOL 1385' then
                        AddPie( qry_trel_po_emb_web_graf_QT_MERCADORIA.AsFloat,qry_trel_po_emb_web_graf_AP_MERC_ANO.asString, clBlue   );

                      if TRIM( qry_trel_po_emb_web_graf_AP_MERCADORIA.Value ) = 'PLURACOL 538 POLYOL' then
                        AddPie( qry_trel_po_emb_web_graf_QT_MERCADORIA.AsFloat,qry_trel_po_emb_web_graf_AP_MERC_ANO.asString, clYellow   );
                    end;
                    qry_trel_po_emb_web_.Next;
                  until ( qry_trel_po_emb_web_.EOF );
                  *)

                  ppRelSelUnidProd.Template.FileName         := cDir_RPT + '\RBPO007.RTM';
                  ppRelSelUnidProd.Template.LoadFromFile;
                  ppRelSelUnidProd.AllowPrintToFile          := True;
                  ppRelSelUnidProd.TextFileName              := cDir_Rpt + '\RBPO007.PDF';
                  ppRelSelUnidProd.PrinterSetup.DocumentName := Caption;
                  ppTitle.Caption := 'Relação de Embarques: ' +
                                     FormatDateTime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_inicio.Date ) + ' a ' +
                                     FormatDateTime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_fim.Date );
                  (*
                  With Series1 do
                  Begin
                    Clear ;
                    AddPie( 20,'Fatia Azul',    clBlue   );
                    AddPie( 30,'Fatia Verde',   clGreen  );
                    AddPie(150,'Fatia Vermelha',clRed    );
                    AddPie( 45,'Fatia Amarela', clYellow );
                  end;
                  *)

                  if chk_arquivo.Checked then
                    ppRelSelUnidProd.DeviceType              := 'PDFFile'
                  else
                    ppRelSelUnidProd.DeviceType              := 'Screen';

                  ppRelSelUnidProd.Print;
                  qry_rel_po_emb_.Close;
                end;
              except
                on E: Exception do
                begin
                  if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                  TrataErro(E);
                end;
              end;
            end;
          end;
      33: begin  // Previsão de Po's à Nacionalizar
            with datm_sel_unid_prod do
            begin
              Screen.Cursor := crHourGlass;
              Application.ProcessMessages;
              try
                datm_main.db_broker.StartTransaction;
                // Rodar Procedure
                CloseStoredProc( sp_rel_previsao_po_nacionalizar );

                if Trim( msk_cd_unid_neg.Text ) = '' then
                  sp_rel_previsao_po_nacionalizar.ParamByName('@cd_unid_neg').AsString    := 'X'
                else
                  sp_rel_previsao_po_nacionalizar.ParamByName('@cd_unid_neg').AsString    := Trim( msk_cd_unid_neg.Text );
                if Trim( msk_cd_grupo.Text ) = '' then
                  sp_rel_previsao_po_nacionalizar.ParamByName('@cd_grupo').AsString    := 'X'
                else
                  sp_rel_previsao_po_nacionalizar.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );

                if Trim( msk_cd_cliente.Text ) = '' then
                  sp_rel_previsao_po_nacionalizar.ParamByName('@cd_cliente').AsString  := 'X'
                else
                  sp_rel_previsao_po_nacionalizar.ParamByName('@cd_cliente').AsString  := Trim( msk_cd_cliente.Text );

                if Trim( msk_cd_area.Text ) = '' then
                  sp_rel_previsao_po_nacionalizar.ParamByName('@cd_area').AsString  := 'X'
                else
                  sp_rel_previsao_po_nacionalizar.ParamByName('@cd_area').AsString  := Trim( msk_cd_area.Text );

                sp_rel_previsao_po_nacionalizar.ParamByName('@dt_inicio').AsDateTime    := msk_dt_inicio.Date;
                sp_rel_previsao_po_nacionalizar.ParamByName('@dt_final').AsDateTime     := msk_dt_fim.Date;

                ExecStoredProc( sp_rel_previsao_po_nacionalizar );
                nr_identificador := sp_rel_previsao_po_nacionalizar.ParamByName('@nr_identificador').AsInteger;
                nr_registros     := sp_rel_previsao_po_nacionalizar.ParamByName('@nr_registros').AsSmallInt;
                CloseStoredProc( sp_rel_previsao_po_nacionalizar );

                datm_main.db_broker.Commit;

                Screen.Cursor := crDefault;
                Application.ProcessMessages;

                // Monta o relatório em txt
                if nr_registros = 0 then
                begin
                  BoxMensagem('Não existem dados que atendam ao filtro especificado!', 2);
                  msk_cd_grupo.SetFocus;
                  exit;
                end
                else
                begin
                  // Cotação do dólar do dia
                  with TQuery.Create(Application) do
                  begin
                    DataBaseName := 'DBBROKER';
                    Close;
                    SQL.Clear;
                    SQL.Add('SELECT TX_CAMBIO '   +
                            '  FROM TTAXA_CAMBIO' +
                            ' WHERE ( CONVERT( CHAR(10), DT_INICIO_VIGENCIA, 120 ) <= CONVERT( CHAR(10),GETDATE(), 120 )    AND' +
                            '       CONVERT( CHAR(10), GETDATE(), 120 ) <= CONVERT( CHAR(10),DT_TERMINO_VIGENCIA, 120 ) ) AND'   +
                            '       CD_MOEDA = "220"');
                    Prepare;
                    Open;
                    vl_dolar := MyRound( FieldByName('TX_CAMBIO').AsFloat, 3 );
                    Free;
                  end;

                  Arquivo := TFileText.Create;
                  Arquivo.Name := cDir_Risc + '\RPPN.TXT';
                  Arquivo.CreateFile;

                  // Criando o cabeçalho do relatorio para o excel -> não nacionalizados
                  linha_01 := 'Relatório de Previsão das PO''s a serem nacionalizadas'+ #13#10 + #13#10;
                  StrPCopy( p1, linha_01 );
                  Arquivo.Write( p1 );
                  linha_01 := 'Nr. PO;Nr. do Item da PO;Vl. Mercadoria (Dólar); Vl. Mercadoria (Real);Previsão de Impostos;;;;;;;;;' +
                              'Dt. Prev. Nacionalização;Dt. Nacionalização;'+ #13#10;
                  linha_02 := ';;;;%;II;%;IPI;%;PIS;%;COFINS;ICMS;;;'+ #13#10;
                  StrPCopy( p1, linha_01 );
                  Arquivo.Write( p1 );
                  StrPCopy( p1, linha_02 );
                  Arquivo.Write( p1 );

                  // Selecionando todos os registros que as po´s não estão nacionalizadas
                  with qry_prev_po_nacion_ do
                  begin
                    Close;
                    SQL.Clear;
                    SQL.Add('SELECT NR_REFERENCIA, NR_ITEM_CLIENTE, ISNULL(VL_MERC_DOLAR, 0) AS VL_MERC_DOLAR,');
                    SQL.Add('  ISNULL( VL_MERC_REAL, 0 ) AS VL_MERC_REAL, ISNULL(VL_ALIQ_II, 0) AS VL_ALIQ_II,');
                    SQL.Add('  ISNULL( VL_II, 0 ) AS VL_II, ISNULL(VL_ALIQ_IPI, 0) AS VL_ALIQ_IPI,');
                    SQL.Add('  ISNULL( VL_IPI, 0 ) AS VL_IPI, ISNULL(VL_ICMS, 0) AS VL_ICMS,');
                    SQL.Add('  ISNULL( DT_PREV_NACION, NULL ) AS DT_PREV_NACION, ISNULL( DT_NACIONALIZACAO, "" ) AS DT_NACIONALIZACAO,');
                    SQL.Add('  ISNULL( VL_ALIQ_PIS, 0 ) AS VL_ALIQ_PIS, ISNULL( VL_PIS, 0 ) AS VL_PIS,');
                    SQL.Add('  ISNULL( VL_ALIQ_COFINS, 0 ) AS VL_ALIQ_COFINS, ISNULL( VL_COFINS, 0 ) AS VL_COFINS');
                    SQL.Add('FROM TREL_PREV_PO_NACION ( NOLOCK ) ');
                    SQL.Add('WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR');
                    SQL.Add('  AND ISNULL(DT_NACIONALIZACAO, "") = ""');
                    SQL.Add('  AND IN_MOEDA_NEG = "1"');
                    SQL.Add(' ORDER BY DT_PREV_NACION DESC');
                    ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                    Prepare;
                    Open;
                  end;

                  if qry_prev_po_nacion_.RecordCount <> 0 then
                  begin
                    cont_reg_00 := qry_prev_po_nacion_.RecordCount;
                    cont_reg_01 := 0;
                    qry_prev_po_nacion_.First;
                    dt_atual := FormatDateTime( 'DD/MM/YYYY', qry_prev_po_nacion_DT_PREV_NACION.AsDateTime );
                    while not qry_prev_po_nacion_.EOF do
                    begin
                      linha_01 := qry_prev_po_nacion_NR_REFERENCIA.AsString                                   + ';' + //COLUNA 1
                                  qry_prev_po_nacion_NR_ITEM_CLIENTE.AsString                                 + ';' + //COLUNA 2
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_MERC_DOLAR.AsFloat, 2 ) )        + ';' + //COLUNA 3
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_MERC_REAL.AsFloat, 2 ) )         + ';' + //COLUNA 4
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_ALIQ_II.AsFloat, 2 ) )           + ';' + //COLUNA 5
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_II.AsFloat, 2 ) )                + ';' + //COLUNA 6
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_ALIQ_IPI.AsFloat, 2 ) )          + ';' + //COLUNA 7
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_IPI.AsFloat, 2 ) )               + ';' + //COLUNA 8
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_ALIQ_PIS.AsFloat, 2 ) )          + ';' + //COLUNA 9
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_PIS.AsFloat, 2 ) )               + ';' + //COLUNA 10
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_ALIQ_COFINS.AsFloat, 2 ) )       + ';' + //COLUNA 11
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_COFINS.AsFloat, 2 ) )            + ';' + //COLUNA 12
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_ICMS.AsFloat, 2 ) )              + ';' + //COLUNA 13
                                  FormatDateTime('DD/MM/YYYY', qry_prev_po_nacion_DT_PREV_NACION.AsDateTime ) + ';' + //COLUNA 14
                                  ' '                                                                         + ';' + //COLUNA 15
                                  #13#10 ;

                      StrPCopy( p1, linha_01 );
                      Arquivo.Write( p1 );
                      dt_anterior := FormatDateTime( 'DD/MM/YYYY', qry_prev_po_nacion_DT_PREV_NACION.AsDateTime );
                      qry_prev_po_nacion_.Next;
                      cont_reg_01 := cont_reg_01 + 1;
                      dt_atual := FormatDateTime( 'DD/MM/YYYY', qry_prev_po_nacion_DT_PREV_NACION.AsDateTime );
                      if ( dt_atual <> dt_anterior ) or (  cont_reg_01 = cont_reg_00 ) then
                      begin
                        with qry_prev_po_nacion_subtotais_ do
                        begin
                          Close;
                          SQL.Clear;
                          SQL.Add('SELECT ISNULL( SUM( VL_MERC_DOLAR ), 0 ) AS VL_DOLAR,');
                          SQL.Add('  ISNULL( SUM( VL_MERC_REAL  ), 0 ) AS VL_REAL,');
                          SQL.Add('  ISNULL( SUM( VL_II ), 0 )         AS VL_II,');
                          SQL.Add('  ISNULL( SUM( VL_IPI ), 0 )        AS VL_IPI,');
                          SQL.Add('  ISNULL( SUM( VL_PIS  ), 0 )       AS VL_PIS,');
                          SQL.Add('  ISNULL( SUM( VL_COFINS ), 0 )     AS VL_COFINS,');
                          SQL.Add('  ISNULL( SUM( VL_ICMS ), 0 )       AS VL_ICMS');
                          SQL.Add('FROM TREL_PREV_PO_NACION ( NOLOCK )');
                          SQL.Add('WHERE NR_IDENTIFICADOR =  :NR_IDENTIFICADOR');
                          SQL.Add('  AND CONVERT( char(10),  DT_PREV_NACION, 103 ) = :DT_PREV_NACION');
                          SQL.Add('  AND ISNULL(DT_NACIONALIZACAO, "") = ""');
                          SQL.Add('  AND IN_MOEDA_NEG = "1"');
                          ParamByName('DT_PREV_NACION').AsString    := dt_anterior;
                          ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                          Prepare;
                          Open;
                          First;
                        end;
                        linha_02 := #13#10 + 'SubTotal :;;' +                                                            //COLUNA 1
                                    FloatToStr( MyRound( qry_prev_po_nacion_subtotais_VL_DOLAR.AsFloat, 2 ) ) + ';'   +  //COLUNA 3
                                    FloatToStr( MyRound( qry_prev_po_nacion_subtotais_VL_REAL.AsFloat, 2 ) )  + ';;'  +  //COLUNA 4
                                    FloatToStr( MyRound( qry_prev_po_nacion_subtotais_VL_II.AsFloat, 2 ) )    + ';;'  +  //COLUNA 6
                                    FloatToStr( MyRound( qry_prev_po_nacion_subtotais_VL_IPI.AsFloat, 2 ) )   + ';;'  +  //COLUNA 8
                                    FloatToStr( MyRound( qry_prev_po_nacion_subtotais_VL_PIS.AsFloat, 2 ) )   + ';;'  +  //COLUNA 10
                                    FloatToStr( MyRound( qry_prev_po_nacion_subtotais_VL_COFINS.AsFloat, 2 ) )+ ';'   +  //COLUNA 12
                                    FloatToStr( MyRound( qry_prev_po_nacion_subtotais_VL_ICMS.AsFloat, 2 ) )  + ';;;' +  //COLUNA 13
                                    #13#10 + #13#10;
                         StrPCopy( p1, linha_02 );
                         Arquivo.Write( p1 );
                         dt_anterior := FormatDateTime( 'DD/MM/YYYY', qry_prev_po_nacion_DT_PREV_NACION.AsDateTime );
                      end;
                    end;
                    // Fim do cabeçalho do relatorio para o excel -> não nacionalizados

                    // Rodapé dos registros que as po´s não estão nacionalizadas
                    with qry_prev_po_nacion_totais_ do
                    begin
                      Close;
                      SQL.Clear;
                      SQL.Add('SELECT COUNT( NR_REFERENCIA ) AS REFERENCIAS,');
                      SQL.Add('  ISNULL( SUM( VL_MERC_DOLAR ), 0 ) AS VL_DOLAR,');
                      SQL.Add('  ISNULL( SUM( VL_MERC_REAL  ), 0 ) AS VL_REAL,');
                      SQL.Add('  ISNULL( SUM( VL_II ), 0 ) AS VL_II,');
                      SQL.Add('  ISNULL( SUM( VL_IPI ), 0 ) AS VL_IPI,');
                      SQL.Add('  ISNULL( SUM( VL_ICMS ), 0 ) AS VL_ICMS,');
                      SQL.Add('  ISNULL( SUM( VL_PIS  ), 0 ) AS VL_PIS,');
                      SQL.Add('  ISNULL( SUM( VL_COFINS ), 0 ) AS VL_COFINS');
                      SQL.Add('FROM TREL_PREV_PO_NACION ( NOLOCK )');
                      SQL.Add('WHERE NR_IDENTIFICADOR =  :NR_IDENTIFICADOR');
                      SQL.Add('  AND ISNULL(DT_NACIONALIZACAO, "") = ""');
                      SQL.Add('  AND IN_MOEDA_NEG = "1"');
                      ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                      Prepare;
                      Open;
                    end;
                    linha_01 := #13#10 +
                                'Qtde de Po''s : ' + qry_prev_po_nacion_totais_REFERENCIAS.AsString + ';;' +
                                                     FloatToStr( MyRound( qry_prev_po_nacion_totais_VL_DOLAR.AsFloat, 2 ) )   + ';'   +
                                                     FloatToStr( MyRound( qry_prev_po_nacion_totais_VL_REAL.AsFloat, 2 ) )    + ';;'  +
                                                     FloatToStr( MyRound( qry_prev_po_nacion_totais_VL_II.AsFloat, 2 ) )      + ';;'  +
                                                     FloatToStr( MyRound( qry_prev_po_nacion_totais_VL_IPI.AsFloat, 2 ) )     + ';;'  +
                                                     FloatToStr( MyRound( qry_prev_po_nacion_totais_VL_PIS.AsFloat, 2 ) )     + ';;'  +
                                                     FloatToStr( MyRound( qry_prev_po_nacion_totais_VL_COFINS.AsFloat, 2 ) )  + ';'  +
                                                     FloatToStr( MyRound( qry_prev_po_nacion_totais_VL_ICMS.AsFloat, 2 ) )    + ';;;' +
                                                     #13#10 + #13#10;
                    StrPCopy( p1, linha_01 );
                    Arquivo.Write( p1 );
                  end;
                  // Fim do rodapé dos registros que as po´s não estão nacionalizadas

                  // Criando o cabeçalho do relatorio para o excel -> nacionalizados
                  linha_01 := #13#10 + #13#10 + #13#10 +
                              'Relatório de PO''s nacionalizadas'+ #13#10 + #13#10;
                  StrPCopy( p1, linha_01 );
                  Arquivo.Write( p1 );
                  linha_01 := 'Nr. PO;Nr. do Item da PO;Vl. Mercadoria (Dólar); Vl. Mercadoria (Real);Previsão de Impostos;;;;;;;;;' +
                              'Dt. Prev. Nacionalização;Dt. Nacionalização;'+ #13#10;
                  linha_02 := ';;;;%;II;%;IPI;%;PIS;%;COFINS;ICMS;;;'+ #13#10;
                  StrPCopy( p1, linha_01 );
                  Arquivo.Write( p1 );
                  StrPCopy( p1, linha_02 );
                  Arquivo.Write( p1 );

                  // Selecionando todos os registros que as po´s estão nacionalizadas
                  with qry_prev_po_nacion_ do
                  begin
                    Close;
                    SQL.Clear;
                    SQL.Add('SELECT NR_REFERENCIA, NR_ITEM_CLIENTE, ISNULL(VL_MERC_DOLAR, 0) AS VL_MERC_DOLAR,');
                    SQL.Add('  ISNULL( VL_MERC_REAL, 0 ) AS VL_MERC_REAL, ISNULL(VL_ALIQ_II, 0) AS VL_ALIQ_II,');
                    SQL.Add('  ISNULL( VL_II, 0 ) AS VL_II, ISNULL(VL_ALIQ_IPI, 0) AS VL_ALIQ_IPI,');
                    SQL.Add('  ISNULL( VL_IPI, 0 ) AS VL_IPI, ISNULL(VL_ICMS, 0) AS VL_ICMS,');
                    SQL.Add('  ISNULL( DT_PREV_NACION, NULL ) AS DT_PREV_NACION, ISNULL( DT_NACIONALIZACAO, "" ) AS DT_NACIONALIZACAO,');
                    SQL.Add('  ISNULL( VL_ALIQ_PIS, 0 ) AS VL_ALIQ_PIS, ISNULL( VL_PIS, 0 ) AS VL_PIS,');
                    SQL.Add('  ISNULL( VL_ALIQ_COFINS, 0 ) AS VL_ALIQ_COFINS, ISNULL( VL_COFINS, 0 ) AS VL_COFINS');
                    SQL.Add('FROM TREL_PREV_PO_NACION ( NOLOCK )');
                    SQL.Add('WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR');
                    SQL.Add('  AND ISNULL(DT_NACIONALIZACAO, "") <> ""');
                    SQL.Add('  AND CONVERT( char(10), DT_NACIONALIZACAO, 120 ) <= CONVERT( CHAR(10),GETDATE(), 120 )');
                    SQL.Add('  AND IN_MOEDA_NEG = "1"');
                    SQL.Add('ORDER BY DT_PREV_NACION DESC');
                    ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                    Prepare;
                    Open;
                  end;

                  if qry_prev_po_nacion_.RecordCount <> 0 then
                  begin
                    cont_reg_00 := qry_prev_po_nacion_.RecordCount;
                    cont_reg_01 := 0;
                    qry_prev_po_nacion_.First;
                    dt_atual := FormatDateTime( 'DD/MM/YYYY', qry_prev_po_nacion_DT_PREV_NACION.AsDateTime );
                    while not qry_prev_po_nacion_.EOF do
                    begin
                      linha_01 := qry_prev_po_nacion_NR_REFERENCIA.AsString                                        + ';' +
                                  qry_prev_po_nacion_NR_ITEM_CLIENTE.AsString                                            + ';' +
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_MERC_DOLAR.AsFloat, 2 ) )           + ';' +
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_MERC_REAL.AsFloat, 2 ) )            + ';' +
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_ALIQ_II.AsFloat, 2 ) )              + ';' +
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_II.AsFloat, 2 ) )                   + ';' +
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_ALIQ_IPI.AsFloat, 2 ) )             + ';' +
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_IPI.AsFloat, 2 ) )                  + ';' +
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_ALIQ_PIS.AsFloat, 2 ) )             + ';' +
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_PIS.AsFloat, 2 ) )                  + ';' +
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_ALIQ_COFINS.AsFloat, 2 ) )          + ';' +
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_COFINS.AsFloat, 2 ) )               + ';' +
                                  FloatToStr( MyRound( qry_prev_po_nacion_VL_ICMS.AsFloat, 2 ) )                 + ';' +
                                  FormatDateTime('DD/MM/YYYY', qry_prev_po_nacion_DT_PREV_NACION.AsDateTime )    + ';' +
                                  FormatDateTime('DD/MM/YYYY', qry_prev_po_nacion_DT_NACIONALIZACAO.AsDateTime ) + ';' +
                                  #13#10 ;
                      StrPCopy( p1, linha_01 );
                      Arquivo.Write( p1 );
                      dt_anterior := FormatDateTime( 'DD/MM/YYYY', qry_prev_po_nacion_DT_PREV_NACION.AsDateTime );
                      qry_prev_po_nacion_.Next;
                      cont_reg_01 := cont_reg_01 + 1;
                      dt_atual := FormatDateTime( 'DD/MM/YYYY', qry_prev_po_nacion_DT_PREV_NACION.AsDateTime );
                      if ( dt_atual <> dt_anterior ) or (  cont_reg_01 = cont_reg_00 ) then
                      begin
                        with qry_prev_po_nacion_subtotais_ do
                        begin
                          Close;
                          SQL.Clear;
                          SQL.Add('SELECT ISNULL( SUM( VL_MERC_DOLAR ), 0 ) AS VL_DOLAR,');
                          SQL.Add('  ISNULL( SUM( VL_MERC_REAL  ), 0 ) AS VL_REAL,');
                          SQL.Add('  ISNULL( SUM( VL_II ), 0 ) AS VL_II,');
                          SQL.Add('  ISNULL( SUM( VL_IPI ), 0 ) AS VL_IPI,');
                          SQL.Add('  ISNULL( SUM( VL_PIS  ), 0 ) AS VL_PIS,');
                          SQL.Add('  ISNULL( SUM( VL_COFINS ), 0 ) AS VL_COFINS,');
                          SQL.Add('  ISNULL( SUM( VL_ICMS ), 0 ) AS VL_ICMS');
                          SQL.Add('FROM TREL_PREV_PO_NACION ( NOLOCK )');
                          SQL.Add('WHERE NR_IDENTIFICADOR =  :NR_IDENTIFICADOR');
                          SQL.Add('  AND CONVERT( char(10),  DT_PREV_NACION, 103 ) = :DT_PREV_NACION');
                          SQL.Add('  AND ISNULL(DT_NACIONALIZACAO, "") <> "" ');
                          SQL.Add('  AND CONVERT( char(10), DT_NACIONALIZACAO, 120 ) <= CONVERT( CHAR(10),GETDATE(), 120 )');
                          SQL.Add('  AND IN_MOEDA_NEG = "1"');
                          ParamByName('DT_PREV_NACION').AsString    := dt_anterior;
                          ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                          Prepare;
                          Open;
                        end;
                        linha_02 := #13#10 + 'SubTotal :;;' +
                                    FloatToStr( MyRound( qry_prev_po_nacion_subtotais_VL_DOLAR.AsFloat, 2 ) )  + ';'   +
                                    FloatToStr( MyRound( qry_prev_po_nacion_subtotais_VL_REAL.AsFloat, 2 ) )   + ';;'  +
                                    FloatToStr( MyRound( qry_prev_po_nacion_subtotais_VL_II.AsFloat, 2 ) )     + ';;'  +
                                    FloatToStr( MyRound( qry_prev_po_nacion_subtotais_VL_IPI.AsFloat, 2 ) )    + ';;'  +
                                    FloatToStr( MyRound( qry_prev_po_nacion_subtotais_VL_PIS.AsFloat, 2 ) )    + ';;'  +
                                    FloatToStr( MyRound( qry_prev_po_nacion_subtotais_VL_COFINS.AsFloat, 2 ) ) + ';'   +
                                    FloatToStr( MyRound( qry_prev_po_nacion_subtotais_VL_ICMS.AsFloat, 2 ) )   + ';;;' +
                                    #13#10 + #13#10;
                                    StrPCopy( p1, linha_02 );
                         Arquivo.Write( p1 );
                         dt_anterior := FormatDateTime( 'DD/MM/YYYY', qry_prev_po_nacion_DT_PREV_NACION.AsDateTime );
                      end;
                    end;
                    // Fim do cabeçalho do relatorio para o excel -> nacionalizados

                    // Rodapé dos registros que as po´s estão nacionalizadas
                    with qry_prev_po_nacion_totais_ do
                    begin
                      Close;
                      SQL.Clear;
                      SQL.Add('SELECT COUNT( NR_REFERENCIA ) AS REFERENCIAS,');
                      SQL.Add('  ISNULL( SUM( VL_MERC_DOLAR ), 0 ) AS VL_DOLAR,');
                      SQL.Add('  ISNULL( SUM( VL_MERC_REAL  ), 0 ) AS VL_REAL,');
                      SQL.Add('  ISNULL( SUM( VL_II ), 0 ) AS VL_II,');
                      SQL.Add('  ISNULL( SUM( VL_IPI ), 0 ) AS VL_IPI,');
                      SQL.Add('  ISNULL( SUM( VL_PIS  ), 0 ) AS VL_PIS,');
                      SQL.Add('  ISNULL( SUM( VL_COFINS ), 0 ) AS VL_COFINS,');
                      SQL.Add('  ISNULL( SUM( VL_ICMS ), 0 ) AS VL_ICMS');
                      SQL.Add('FROM TREL_PREV_PO_NACION ( NOLOCK )');
                      SQL.Add('WHERE NR_IDENTIFICADOR =  :NR_IDENTIFICADOR');
                      SQL.Add('  AND ISNULL(DT_NACIONALIZACAO, "") <> ""');
                      SQL.Add('  AND CONVERT( char(10), DT_NACIONALIZACAO, 120 ) <= CONVERT( CHAR(10),GETDATE(), 120 )');
                      SQL.Add('  AND IN_MOEDA_NEG = "1"');
                      ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
                      Prepare;
                      Open;
                    end;
                    linha_01 := #13#10 +
                                'Qtde de Po''s : ' + qry_prev_po_nacion_totais_REFERENCIAS.AsString + ';;' +
                                                              FloatToStr( MyRound( qry_prev_po_nacion_totais_VL_DOLAR.AsFloat, 2 ) )   + ';'   +
                                                              FloatToStr( MyRound( qry_prev_po_nacion_totais_VL_REAL.AsFloat, 2 ) )    + ';;'  +
                                                              FloatToStr( MyRound( qry_prev_po_nacion_totais_VL_II.AsFloat, 2 ) )      + ';;'  +
                                                              FloatToStr( MyRound( qry_prev_po_nacion_totais_VL_IPI.AsFloat, 2 ) )     + ';;'   +
                                                              FloatToStr( MyRound( qry_prev_po_nacion_totais_VL_PIS.AsFloat, 2 ) )     + ';;'  +
                                                              FloatToStr( MyRound( qry_prev_po_nacion_totais_VL_COFINS.AsFloat, 2 ) )  + ';'  +
                                                              FloatToStr( MyRound( qry_prev_po_nacion_totais_VL_ICMS.AsFloat, 2 ) )    + ';;;' +
                                                              #13#10 + #13#10;
                    StrPCopy( p1, linha_01 );
                    Arquivo.Write( p1 );
                  end;
                  // Fim do rodapé dos registros que as po´s estão nacionalizadas

                  if msk_dt_inicio.Date = msk_dt_fim.Date then
                    texto_periodo := 'Período : ;;;' + FormatDateTime('DD/MM/YYYY', msk_dt_inicio.Date)
                  else
                    texto_periodo := 'Período : ;;;' + FormatDateTime('DD/MM/YYYY', msk_dt_inicio.Date) + ' a ' + FormatDateTime('DD/MM/YYYY', msk_dt_fim.Date);

                  linha_01 := #13#10 + #13#10 +
                              'Data de Geraçao do Relatório : ' + FormatDateTime('DD/MM/YYYY', dt_server ) + #13#10 +
                              texto_periodo + #13#10 +
                              'Taxa de Conversão :;;;' + FloatToStr( vl_dolar ) + #13#10;

                  StrPCopy( p1, linha_01 );
                  Arquivo.Write( p1 );
                  linha_02 := 'Cálculo do ICMS :;;;BASE ICMS = CIF + II + IPI + TAXA SISCOMEX + PIS + COFINS' + #13#10 +
                              ' ;;;ICMS = ( BASE / (1 - ( ALIQ / 100 )) * ALIQ ) / 100' + #13#10 +
                              'Obs.: É utilizado 5 dias da abertura da PO para a informação da data de previsão de nacionalização;;;;;;;' + #13#10;
                  StrPCopy( p1, linha_02 );
                  Arquivo.Write( p1 );

                  Arquivo.Close;
                  Arquivo.Free;

                  //Fim da Geração da planilha
                  BoxMensagem('Planilha gerada com sucesso!', 3);
                  ShellExecute( Application.Handle, 'Open', 'EXCEL.EXE', PChar( cDir_Rpt + '\RPPN.XLS' ), '', SW_MAXIMIZE );
                end;

              except
                on E: Exception do
                begin
                  if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                  TrataErro(E);
                end;
              end;
            end;
          end;
    34: begin //saldo de clientes
           with datm_sel_unid_prod do
           begin
             try
               //1. Saldo Credor
               CloseStoredProc( sp_rel_liq_saldos_pendentes );
               if Trim( msk_cd_unid_neg.Text ) = '' then
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_unid_neg').AsString := 'X'
               else
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
               if Trim( msk_cd_produto.Text ) = '' then
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_produto').AsString  := 'X'
               else
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
               if Trim( msk_cd_grupo.Text ) = '' then
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_grupo').AsString    := 'X'
               else
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
               sp_rel_liq_saldos_pendentes.ParamByName('@cd_cliente').AsString  := 'X';
               sp_rel_liq_saldos_pendentes.ParamByName('@inVenc').AsString  := '0';
               sp_rel_liq_saldos_pendentes.ParamByName('@inCredor').AsString  := '1';
               sp_rel_liq_saldos_pendentes.ParamByName('@inDevedor').AsString  := '0';

               ExecStoredProc( sp_rel_liq_saldos_pendentes );
               nr_identificador := sp_rel_liq_saldos_pendentes.ParamByName('@nr_identificador').AsInteger;
               CloseStoredProc( sp_rel_liq_saldos_pendentes );

               vQryCred := TQuery.Create(application);
               vQryCred.DataBaseName := 'DBBroker';
               vQryCred.Close;
               vQryCred.SQL.Clear;
               vQryCred.SQL.Add('SELECT SUM(VL_SALDO_PENDENTE), CD_GRUPO FROM TREL_LIQ_SALDOS_PENDENTES ');
               vQryCred.SQL.Add(' WHERE NR_IDENTIFICADOR = ' + IntToStr(nr_identificador) + ' GROUP BY CD_GRUPO');
               vQryCred.Open;

               ApagaDados('TREL_LIQ_SALDOS_PENDENTES', nr_identificador);
               ApagaDados('TREL_LIQ_SALDOS_PENDENTES_TOTAIS', nr_identificador);


               //2. saldo devedor após o vencimento
               CloseStoredProc( sp_rel_liq_saldos_pendentes );
               if Trim( msk_cd_unid_neg.Text ) = '' then
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_unid_neg').AsString := 'X'
               else
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
               if Trim( msk_cd_produto.Text ) = '' then
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_produto').AsString  := 'X'
               else
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
               if Trim( msk_cd_grupo.Text ) = '' then
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_grupo').AsString    := 'X'
               else
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
               sp_rel_liq_saldos_pendentes.ParamByName('@cd_cliente').AsString  := 'X';
               sp_rel_liq_saldos_pendentes.ParamByName('@inVenc').AsString  := '1';
               sp_rel_liq_saldos_pendentes.ParamByName('@inCredor').AsString  := '0';
               sp_rel_liq_saldos_pendentes.ParamByName('@inDevedor').AsString  := '1';

               ExecStoredProc( sp_rel_liq_saldos_pendentes );
               nr_identificador := sp_rel_liq_saldos_pendentes.ParamByName('@nr_identificador').AsInteger;
               CloseStoredProc( sp_rel_liq_saldos_pendentes );

               vQryDevVenc := TQuery.Create(application);
               vQryDevVenc.DataBaseName := 'DBBroker';
               vQryDevVenc.Close;
               vQryDevVenc.SQL.Clear;
               vQryDevVenc.SQL.Add('SELECT SUM(VL_SALDO_PENDENTE), CD_GRUPO, SUM(NR_DIAS_VENC_EMISSAO)/COUNT(*) FROM TREL_LIQ_SALDOS_PENDENTES ');
               vQryDevVenc.SQL.Add(' WHERE NR_IDENTIFICADOR = ' + IntToStr(nr_identificador) + ' GROUP BY CD_GRUPO');
               vQryDevVenc.Open;

               ApagaDados('TREL_LIQ_SALDOS_PENDENTES', nr_identificador);
               ApagaDados('TREL_LIQ_SALDOS_PENDENTES_TOTAIS', nr_identificador);


               //2. saldo devedor
               CloseStoredProc( sp_rel_liq_saldos_pendentes );
               if Trim( msk_cd_unid_neg.Text ) = '' then
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_unid_neg').AsString := 'X'
               else
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_unid_neg').AsString := Trim( msk_cd_unid_neg.Text );
               if Trim( msk_cd_produto.Text ) = '' then
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_produto').AsString  := 'X'
               else
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
               if Trim( msk_cd_grupo.Text ) = '' then
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_grupo').AsString    := 'X'
               else
                 sp_rel_liq_saldos_pendentes.ParamByName('@cd_grupo').AsString    := Trim( msk_cd_grupo.Text );
               sp_rel_liq_saldos_pendentes.ParamByName('@cd_cliente').AsString  := 'X';
               sp_rel_liq_saldos_pendentes.ParamByName('@inVenc').AsString  := '0';
               sp_rel_liq_saldos_pendentes.ParamByName('@inCredor').AsString  := '0';
               sp_rel_liq_saldos_pendentes.ParamByName('@inDevedor').AsString  := '1';

               ExecStoredProc( sp_rel_liq_saldos_pendentes );
               nr_identificador := sp_rel_liq_saldos_pendentes.ParamByName('@nr_identificador').AsInteger;
               CloseStoredProc( sp_rel_liq_saldos_pendentes );

               vQryDev := TQuery.Create(application);
               vQryDev.DataBaseName := 'DBBroker';
               vQryDev.Close;
               vQryDev.SQL.Clear;
               vQryDev.SQL.Add('SELECT SUM(VL_SALDO_PENDENTE), CD_GRUPO FROM TREL_LIQ_SALDOS_PENDENTES ');
               vQryDev.SQL.Add(' WHERE NR_IDENTIFICADOR = ' + IntToStr(nr_identificador) + ' GROUP BY CD_GRUPO');
               vQryDev.Open;

               {vQryRec := TQuery.Create(application);
               vQryRec.DataBaseName := 'DBBroker';
               vQryRec.Close;
               vQryRec.SQL.Clear;}

               vQryAux3 := TQuery.Create(application);
               vQryAux3.DataBaseName := 'DBBroker';
               vQryAux3.Close;
               vQryAux3.SQL.Clear;

               if Trim( msk_cd_unid_neg.Text ) = '' then
                 vUnidade := 'X'
               else
                 vUnidade := Trim( msk_cd_unid_neg.Text );
               if Trim( msk_cd_produto.Text ) = '' then
                 vProduto  := 'X'
               else
                 vProduto := Trim( msk_cd_produto.Text );
               if Trim( msk_cd_grupo.Text ) = '' then
                 vGrupo := 'X'
               else
                 vGrupo := Trim( msk_cd_grupo.Text );


               vQryAux := TQuery.Create(application);
               vQryAux.DataBaseName := 'DBBroker';
               vQryAux.Close;
               vQryAux.SQL.Clear;
               vQryAux.SQL.Text :=
                'SELECT CD_ITEM_SALDO_CRE,       ' + //0
                '       CD_ITEM_SALDO_DEB,       ' + //1
                '       CD_ITEM_RECEB_SD,        ' + //2
                '       CD_ITEM_PAGTO_SD,        ' + //3
                '       CD_ITEM_EXT_RECEB,       ' + //4
                '       CD_ITEM_EXT_PAGTO,       ' + //5
                '       CD_ITEM_NAO_FAT,         ' + //6
                '       CD_ITEM_PAGO_CLI,        ' + //7
                '       CD_ITEM_RECEB_NUM,       ' + //8
                '       CD_ITEM_DEVOL_NUM,       ' + //9
                '       CD_ITEM_EXTOR_NUM,       ' + //10
                '       CD_ITEM_IR,              ' + //11
                '       CD_ITEM_COFINS_RETENCAO, ' + //12
                '       CD_ITEM_COMISSAO,        ' + //13
                '       CD_ITEM_PIS_COFINS       ' + //14
                'FROM TPARAMETROS (NOLOCK) ';
                vQryAux.Open;

               //numerário
               vQryNum := TQuery.Create(application);
               vQryNum.DataBaseName := 'DBBroker';
               vQryNum.Close;
               vQryNum.SQL.Clear;
               vQrynum.SQL.Text :=
                'SELECT ROUND(SUM(CASE F.IN_RESTITUI ' +
                '                    WHEN "0" THEN ISNULL(CASE F.CD_ITEM ' +
                '                                           WHEN "' + vQryAux.Fields[8].AsString + '" THEN ISNULL( F.VL_ITEM, 0 ) + ISNULL( VL_IR, 0 ) - ISNULL( VL_ASSIST, 0 ) ' +
                '                                           ELSE ( ISNULL( F.VL_ITEM, 0 ) + ISNULL( VL_IR, 0 ) - ISNULL( VL_ASSIST, 0 ) ) * ( -1 ) ' +
                '                                          END , 0) ' +
                '                    WHEN "1" THEN ISNULL(CASE F.CD_ITEM ' +
                '                                           WHEN "' + vQryAux.Fields[8].AsString + '" THEN ( ISNULL( F.VL_ITEM, 0 ) + ISNULL( VL_IR, 0 ) - ISNULL( VL_ASSIST, 0 ) ) * ( -1 ) ' +
                '                                           ELSE ISNULL( F.VL_ITEM, 0 ) + ISNULL( VL_IR, 0 ) - ISNULL( VL_ASSIST, 0 ) ' +
                '                                          END , 0) ' +
                '                  END), 2), E.CD_GRUPO ' +
                'FROM   TFATURAMENTO_CC F (NOLOCK), ' +
                '       TPROCESSO P (NOLOCK), ' +
                '       TEMPRESA_NAC E (NOLOCK), ' +
                '       TS_FATURA FAT (NOLOCK), ' +
                '       TGRUPO_ITEM_ITEM G (NOLOCK), ' +
                '       TITEM I (NOLOCK) ' +
                'WHERE  F.NR_PROCESSO = P.NR_PROCESSO AND ' +
                '       P.CD_CLIENTE = E.CD_EMPRESA AND ' +
                '       F.CD_UNID_NEG *= FAT.CD_UNID_NEG AND ' +
                '       F.CD_PRODUTO *= FAT.CD_PRODUTO AND ' +
                '       F.NR_SOLIC_FAT *= FAT.NR_SOLICITACAO AND ' +
                '       F.CD_ITEM = G.CD_ITEM AND ' +
                '       F.CD_ITEM = I.CD_ITEM AND ' +
                '       F.IN_FATURADO = "0" AND ' +
                '       P.IN_CANCELADO = "0" AND ' +
                '       F.IN_CANCELADO = "0" AND ' +
                '       I.IN_TRIBUTAVEL = "0" AND ' +
                '       ISNULL( F.CD_ITEM_NAO_FAT, "" ) <> "*" AND ' +
                '       ( ( E.CD_GRUPO = "' + vGrupo + '" ) OR ( "' + vGrupo + '" = "X" ) ) AND ' +
                '       ( ( P.CD_UNID_NEG = "' + vUnidade + '") OR ("' + vUnidade + '" = "X") ) AND ' +
                '       ( ( P.CD_PRODUTO = "' + vProduto + '" ) OR ( "' + vProduto + '" = "X" ) ) AND ' +
                '       F.CD_ITEM IN ("' + vQryAux.Fields[8].AsString + '", "' + vQryAux.Fields[9].AsString + '", "' + vQryAux.Fields[10].AsString + '") ' +
                'GROUP BY E.CD_GRUPO ';
               vQryNum.Open;

               //despesa - obs: alterna o in_restitui para trazer negativo os valores!
               vQryDesp := TQuery.Create(application);
               vQryDesp.DataBaseName := 'DBBroker';
               vQryDesp.Close;
               vQryDesp.SQL.Clear;
               vQryDesp.SQL.Text :=
                'SELECT ROUND(SUM(ISNULL(CASE IN_RESTITUI ' +
                '                    WHEN "1" THEN ISNULL( F.VL_ITEM, 0 ) + ISNULL( VL_IR, 0 ) - ISNULL( VL_ASSIST, 0 ) ' +
                '                    WHEN "0" THEN ( ISNULL( F.VL_ITEM, 0 ) + ISNULL( VL_IR, 0 ) - ISNULL( VL_ASSIST, 0 ) ) * ( -1 ) ' +
                '                  END , 0)), 2), E.CD_GRUPO ' +
                'FROM   TFATURAMENTO_CC F (NOLOCK), ' +
                '       TPROCESSO P (NOLOCK), ' +
                '       TEMPRESA_NAC E (NOLOCK), ' +
                '       TS_FATURA FAT (NOLOCK), ' +
                '       TGRUPO_ITEM_ITEM G (NOLOCK), ' +
                '       TITEM I (NOLOCK) ' +
                'WHERE  F.NR_PROCESSO = P.NR_PROCESSO AND ' +
                '       P.CD_CLIENTE = E.CD_EMPRESA AND ' +
                '       F.CD_UNID_NEG *= FAT.CD_UNID_NEG AND ' +
                '       F.CD_PRODUTO *= FAT.CD_PRODUTO AND ' +
                '       F.NR_SOLIC_FAT *= FAT.NR_SOLICITACAO AND ' +
                '       F.CD_ITEM = G.CD_ITEM AND ' +
                '       F.CD_ITEM = I.CD_ITEM AND ' +
                '       F.IN_FATURADO = "0" AND ' +
                '       P.IN_CANCELADO = "0" AND ' +
                '       F.IN_CANCELADO = "0" AND ' +
                '       I.IN_TRIBUTAVEL = "0" AND ' +
                '       ISNULL( F.CD_ITEM_NAO_FAT, "" ) <> "*" AND ' +
                '       ( ( E.CD_GRUPO = "' + vGrupo + '" ) OR ( "' + vGrupo + '" = "X" ) ) AND ' +
                '       ( ( P.CD_UNID_NEG = "' + vUnidade + '") OR ("' + vUnidade + '" = "X") ) AND ' +
                '       ( ( P.CD_PRODUTO = "' + vProduto + '" ) OR ( "' + vProduto + '" = "X" ) ) AND ' +
                '       F.CD_ITEM NOT IN ( "' + vQryAux.Fields[0].AsString + '", "' + vQryAux.Fields[1].AsString + '", "' + vQryAux.Fields[2].AsString + '", ' +
                '                          "' + vQryAux.Fields[3].AsString + '", "' + vQryAux.Fields[4].AsString + '", "' + vQryAux.Fields[5].AsString + '", ' +
                '                          "' + vQryAux.Fields[6].AsString + '", "' + vQryAux.Fields[7].AsString + '", "' + vQryAux.Fields[8].AsString + '", ' +
                '                          "' + vQryAux.Fields[9].AsString + '", "' + vQryAux.Fields[10].AsString + '" ) ' +
                'GROUP BY E.CD_GRUPO ';
               vQryDesp.Open;


               if (vQryNum.IsEmpty) and (vQryDesp.IsEmpty) and (vQryCred.IsEmpty) and (vQryDev.IsEmpty) then
               begin
                 ShowMessage('Não há dados para exibir!');
                 Exit;
               end;
               vQryAux2 := TQuery.Create(application);
               vQryAux2.DataBaseName := 'DBBroker';
               vQryAux2.Close;
               vQryAux2.SQL.Clear;
               vQryAux2.SQL.Add('SELECT CD_GRUPO, NM_GRUPO FROM TGRUPO (NOLOCK) ');
               if vGrupo <> 'X' then
                 vQryAux2.SQL.Add('WHERE CD_GRUPO = "' + VGrupo + '" ');
               vQryAux2.SQL.Add('ORDER BY NM_GRUPO');
               vQryAux2.Open;

               //criar excel
               try
                 Excel := CreateOLEObject('Excel.Application');
                 xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\saldo_cliente.XLS' );
                 Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\saldo_cliente_' +
                 Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');
                 oSheet := Excel.WorkBooks[1].Worksheets[1];
               except
                 Application.MessageBox('Verifique se a planilha já está aberta. Salve-a e feche-a!', 'Erro na criação da Planilha.', MB_OK + MB_ICONERROR) ;
                 Exit;
               end;

               if vUnidade <> 'X' then
                 oSheet.Cells[ 03, 03 ].value := ConsultaLookUp('TUNID_NEG', 'CD_UNID_NEG', vUnidade, 'AP_UNID_NEG');
               if vProduto <> 'X' then
                 oSheet.Cells[ 04, 03 ].value := ConsultaLookUp('TPRODUTO', 'CD_PRODUTO', vProduto, 'NM_PRODUTO');
               if vgrupo <> 'X'   then
                 oSheet.Cells[ 05, 03 ].value := ConsultaLookUp('TGRUPO', 'CD_GRUPO', vGrupo, 'NM_GRUPO');
               nLinha := 9;
               vCorAux     := 34;
               vTotNum     := 0;
               vTotCred    := 0;
               vTotDesp    := 0;
               vTotDev     := 0;
               vTotDevVenc := 0;
               vTotRec     := 0;
               while not vQryAux2.Eof do
               begin
                 vNum     := 0;
                 vCred    := 0;
                 vDesp    := 0;
                 vDev     := 0;
                 vDevVenc := 0;
                 vRec     := 0;
                 vMedia   := 0;

                 if vQryDevVenc.Locate('CD_GRUPO', vQryAux2.Fields[0].AsString, [])  then
                 begin
                   vDevVenc := vQryDevVenc.Fields[0].AsFloat;
                   vMedia := vQryDevVenc.Fields[2].AsInteger;
                 end;

                 if vQryNum.Locate('CD_GRUPO', vQryAux2.Fields[0].AsString, [])  then
                   vNum := vQryNum.Fields[0].AsFloat;
                 if vQryCred.Locate('CD_GRUPO', vQryAux2.Fields[0].AsString, []) then
                   vCred := vQryCred.Fields[0].AsFloat;
                 if vQryDesp.Locate('CD_GRUPO', vQryAux2.Fields[0].AsString, []) then
                   vDesp := vQryDesp.Fields[0].AsFloat;

                 if vQryDev.Locate('CD_GRUPO', vQryAux2.Fields[0].AsString, [])  then
                 begin
                   vDev := vQryDev.Fields[0].AsFloat;

                   //calcula honorários
                   //Foi alterada a forma de cálculo dos honorários =>> para melhorar problema de lentidão - Rodrigo Capra - 04875/08

                   {vQryRec.Close;
                   vQryRec.SQL.Clear;
                   vQryRec.SQL.Add('SELECT ISNULL(VL_SALDO_PENDENTE, 0), CD_GRUPO, CD_UNID_NEG, CD_PRODUTO, NR_PROCESSO, NR_SOLICITACAO FROM TREL_LIQ_SALDOS_PENDENTES ');
                   vQryRec.SQL.Add(' WHERE NR_IDENTIFICADOR = ' + IntToStr(nr_identificador) + ' AND CD_GRUPO = "' + vQryAux2.Fields[0].AsString + '" ');
                   vQryRec.Open;}

                   //while abaixo é um grande ponto de Lentidão !
//                   while not vQryRec.Eof do
                   begin
                     vQryAux3.Close;
                     vQryAux3.SQL.Clear;
                     vQryAux3.SQL.Text :=
                     'SELECT ISNULL(C.VL_SALDO_PENDENTE,0), ISNULL( ROUND( ' + //       SUM( ' + eu
                     '       CASE IN_RESTITUI '    +
                     '         WHEN "0" THEN ( ISNULL( FI.VL_ITEM, 0 ) + ISNULL( FI.VL_ASSIST, 0 ) - ISNULL( FI.VL_IR, 0 ) ) '        +
                     '         WHEN "1" THEN ( ISNULL( FI.VL_ITEM, 0 ) + ISNULL( FI.VL_ASSIST, 0 ) - ISNULL( FI.VL_IR, 0 ) ) * (-1) ' +
                     '       END, 2 ), 0 ) ' +
                     'FROM   TFATURAMENTO_CC FI, TITEM I (NOLOCK) ' +
                    ', TREL_LIQ_SALDOS_PENDENTES  C ' +
                     'WHERE  ' +
                     '       C.NR_IDENTIFICADOR = ' + IntToStr(nr_identificador) + ' and C.CD_GRUPO = "' + vQryAux2.Fields[0].AsString + '" AND ' + //eu
                     '       FI.NR_SOLIC_FAT = C.NR_SOLICITACAO AND      FI.NR_PROCESSO = C.NR_PROCESSO AND ' +                                     //eu
                     '       FI.CD_UNID_NEG = C.CD_UNID_NEG     AND      FI.CD_PRODUTO  = C.CD_UNID_NEG  AND ' +                                    //eu
                     '       FI.CD_ITEM = I.CD_ITEM AND ' +
                     '       FI.IN_CANCELADO = "0" AND ' +
                     '       FI.IN_FATURADO = "1" AND ' +
//                     '       FI.CD_UNID_NEG = "'  + vQryRec.Fields[2].AsString   + '"    AND ' +
//                     '       FI.CD_PRODUTO = "'   + vQryRec.Fields[3].AsString   + '"    AND ' +
//                     '       FI.NR_SOLIC_FAT = "' + vQryRec.Fields[5].AsString   + '"    AND ' +
                     '       (((I.IN_TRIBUTAVEL = "1") AND ' +
                     '         (ISNULL( FI.CD_ITEM_NAO_FAT, "" ) <> "*") AND ' +
                     '         (FI.CD_ITEM NOT IN ( "' + vQryAux.Fields[0].AsString + '", "' + vQryAux.Fields[1].AsString + '", "' + vQryAux.Fields[2].AsString + '", ' +
                     '                              "' + vQryAux.Fields[3].AsString +  '", "' + vQryAux.Fields[4].AsString +  '", "' + vQryAux.Fields[5].AsString +  '", ' +
                     '                              "' + vQryAux.Fields[6].AsString +  '", "' + vQryAux.Fields[7].AsString +  '", "' + vQryAux.Fields[8].AsString +  '", ' +
                     '                              "' + vQryAux.Fields[9].AsString +  '", "' + vQryAux.Fields[10].AsString + '", "' + vQryAux.Fields[11].AsString + '", ' +
                     '                              "' + vQryAux.Fields[12].AsString + '", "' + vQryAux.Fields[13].AsString + '", "' + vQryAux.Fields[14].AsString + '" ))) ' +
                     '       OR (FI.CD_ITEM = "' + vQryAux.Fields[13].AsString + '")) ';

                     vQryAux3.Open;

                     {if ((vQryRec.Fields[0].AsFloat)*(-1)) > vQryAux3.Fields[0].AsFloat then
                       vRec := vRec + vQryAux3.Fields[0].AsFloat         FORMA ANTIGA
                     else
                       vRec := vRec + (vQryRec.Fields[0].AsFloat)*(-1);}

                     while not vQryAux3.eof do
                     begin
                       if ((vQryAux3.Fields[0].AsFloat)*(-1)) > vQryAux3.Fields[1].AsFloat then
                         vRec := vRec + vQryAux3.Fields[1].AsFloat
                       else
                         vRec := vRec + (vQryAux3.Fields[0].AsFloat)*(-1);
                       vQryAux3.Next;
                     end;
                     //vQryRec.Next;
                   end;
                 end;


                 //lança linha no excel
                 if vNum + vCred + vDesp + vDev + vDevVenc <> 0 then
                 begin
                   oSheet.Cells[ nLinha, 01 ].value := ConsultaLookUp('TGRUPO', 'CD_GRUPO', vQryAux2.Fields[0].AsString, 'NM_GRUPO');
                   oSheet.Cells[ nLinha, 02 ].value := vNum;
                   vTotNum := vTotNum + VNum;
                   oSheet.Cells[ nLinha, 03 ].value := vDesp;
                   vTotDesp := vTotDesp + vDesp;
                   oSheet.Cells[ nLinha, 04 ].value := '= B' + IntToStr(nLinha) + ' + C' + IntToStr(nLinha);
                   oSheet.Cells[ nLinha, 05 ].value := vCred;
                   vTotCred := vTotCred + vCred;
                   oSheet.Cells[ nLinha, 06 ].value := vDev;
                   vTotDev := vTotDev + vDev;
                   oSheet.Cells[ nLinha, 07 ].value := '= E' + IntToStr(nLinha) + ' + F' + IntToStr(nLinha);
                   oSheet.Cells[ nLinha, 08 ].value := '= B' + IntToStr(nLinha) + ' + C' + IntToStr(nLinha) + ' + E' + IntToStr(nLinha) + ' + F' + IntToStr(nLinha);
                   oSheet.Cells[ nLinha, 9 ].value := vRec;
                   vTotRec := vtotRec + vRec;
                   oSheet.Cells[ nLinha, 10 ].value := vDevVenc;
                   oSheet.Cells[ nLinha, 11 ].value := vMedia;
                   vTotDevVenc := vTotDevVenc + vDevVenc;

                   if vCorAux = 34 then
                     vCorAux := 35
                   else
                     vCorAux := 34;
                   oSheet.Cells[ nLinha, 01 ].Interior.ColorIndex := vCorAux;
                   oSheet.Cells[ nLinha, 02 ].Interior.ColorIndex := vCorAux;
                   oSheet.Cells[ nLinha, 03 ].Interior.ColorIndex := vCorAux;
                   oSheet.Cells[ nLinha, 04 ].Interior.ColorIndex := vCorAux;
                   oSheet.Cells[ nLinha, 05 ].Interior.ColorIndex := vCorAux;
                   oSheet.Cells[ nLinha, 06 ].Interior.ColorIndex := vCorAux;
                   oSheet.Cells[ nLinha, 07 ].Interior.ColorIndex := vCorAux;
                   oSheet.Cells[ nLinha, 08 ].Interior.ColorIndex := vCorAux;
                   oSheet.Cells[ nLinha, 09 ].Interior.ColorIndex := vCorAux;
                   oSheet.Cells[ nLinha, 10 ].Interior.ColorIndex := vCorAux;
                   oSheet.Cells[ nLinha, 11 ].Interior.ColorIndex := vCorAux;

                   oSheet.Cells[ nLinha, 02 ].Font.Bold := False;
                   oSheet.Cells[ nLinha, 03 ].Font.Bold := False;
                   oSheet.Cells[ nLinha, 05 ].Font.Bold := False;
                   oSheet.Cells[ nLinha, 06 ].Font.Bold := False;
                   oSheet.Cells[ nLinha, 09 ].Font.Bold := False;
                   oSheet.Cells[ nLinha, 10 ].Font.Bold := False;
                   oSheet.Cells[ nLinha, 11 ].Font.Bold := False;


                   nLinha := nLinha + 1;
                 end;

                 oSheet.Cells[ nLinha, 01 ].value := ' TOTAL';
                 oSheet.Cells[ nLinha, 02 ].value := vTotNum;
                 oSheet.Cells[ nLinha, 03 ].value := vTotDesp;
                 oSheet.Cells[ nLinha, 04 ].value := '= B' + IntToStr(nLinha) + ' + C' + IntToStr(nLinha);
                 oSheet.Cells[ nLinha, 05 ].value := vTotCred;
                 oSheet.Cells[ nLinha, 06 ].value := vTotDev;
                 oSheet.Cells[ nLinha, 07 ].value := '= E' + IntToStr(nLinha) + ' + F' + IntToStr(nLinha);
                 oSheet.Cells[ nLinha, 08 ].value := '= B' + IntToStr(nLinha) + ' + C' + IntToStr(nLinha) + ' + E' + IntToStr(nLinha) + ' + F' + IntToStr(nLinha);
                 oSheet.Cells[ nLinha, 09 ].value := vTotRec;
                 oSheet.Cells[ nLinha, 10 ].value := vTotDevVenc;

                 oSheet.Cells[ nLinha, 01 ].Font.Bold := True;
                 oSheet.Cells[ nLinha, 02 ].Font.Bold := True;
                 oSheet.Cells[ nLinha, 03 ].Font.Bold := True;
                 oSheet.Cells[ nLinha, 04 ].Font.Bold := True;
                 oSheet.Cells[ nLinha, 05 ].Font.Bold := True;
                 oSheet.Cells[ nLinha, 06 ].Font.Bold := True;
                 oSheet.Cells[ nLinha, 07 ].Font.Bold := True;
                 oSheet.Cells[ nLinha, 08 ].Font.Bold := True;
                 oSheet.Cells[ nLinha, 09 ].Font.Bold := True;
                 oSheet.Cells[ nLinha, 10 ].Font.Bold := True;


                 vQryAux2.next;
               end;

               vQryAux.Close;
               vQryAux2.Close;
               vQryAux3.Close;
               //vQryRec.Close;
               vQryDesp.Close;
               vQryDev.Close;
               vQryDevVenc.Close;
               vQryNum.Close;
               vQryCred.Close;
               ApagaDados('TREL_LIQ_SALDOS_PENDENTES', nr_identificador);
               ApagaDados('TREL_LIQ_SALDOS_PENDENTES_TOTAIS', nr_identificador);

               Excel.Visible := true;
             finally
               vQryAux.Free;
               vQryAux2.Free;
               vQryAux3.Free;
               //vQryRec.Free;
               vQryDesp.Free;
               vQryDev.Free;
               vQryDevVenc.Free;
               vQryNum.Free;
               vQryCred.Free;
             end;
           end;
         end;
    35:  begin
           faturamento_consolidado(nil);
           exit;
         end;
    36:  begin
           GeraValoresPendentes;
         end;


  end; // end case

  if tp_rel in [9, 11, 12, 16, 17, 18, {19,} 20, 21, 22] then Formulas[0] := 'NrIdentificador = ' + Trim( IntToStr( nr_identificador ) );

  if tp_rel = 21 then
  begin
    if Trim( edt_nm_grupo.Text ) <> '' then
      Formulas[1] := 'NomeCliente = "'+ Trim( edt_nm_grupo.Text ) + '"'
    else
      Formulas[1] := 'NomeCliente = "'+ Trim( edt_nm_cliente.Text ) + '"';
    Formulas[2] := 'NomeUnidade = "'+ edt_nm_unid_neg.Text + '"';
  end;

  if Not ( tp_rel in [5, 15, 23, 25, 26, 28, 29, 30, 31, 32, 33,34,36] ) then Execute;

  with datm_sel_unid_prod do
    begin
      if tp_rel in [9, 10, 11, 12, 15, 16, 17, 18, {19,} 20, 21, 22, 23, 25, 26, 27, 28, 29, 30, 31, 32, 33] then
      begin
        if tp_rel = 9 then
          ApagaDados( 'TREL_DESP_PAGTO', nr_identificador );
        if tp_rel = 10 then
          ApagaDados( 'TAUX_ANDAMENTO', nr_identificador );
{        if tp_rel = 11 then
          ApagaDados( 'TREL_NUMERARIO', nr_identificador );}
        if tp_rel = 12 then
          ApagaDados( 'TREL_CTRL_DEMURRAGE', nr_identificador );
        if tp_rel in [15] then
        begin
          ApagaDados( 'TREL_EST_MERCADORIA', nr_identificador );
          ApagaDados( 'TREL_EST_MERCADORIA_RE', nr_identificador );
        end;
        if tp_rel in [16] then
          ApagaDados( 'TREL_FAT_PAGO_CLI', nr_identificador );
        if tp_rel in [17] then
          ApagaDados( 'TREL_EST_ARM_DEMURRAGE', nr_identificador );
        if tp_rel in [18] then
        begin
          ApagaDados( 'TREL_EST_CNTR_VL_CIF', nr_identificador );
          ApagaDados( 'TREL_EST_CNTR_VL_CIF_MERC', nr_identificador );
        end;
        {if tp_rel in [19] then
        begin
          ApagaDados( 'TREL_LIQ_SALDOS_PENDENTES', nr_identificador );
          ApagaDados( 'TREL_LIQ_SALDOS_PENDENTES_TOTAIS', nr_identificador );
        end;}
        if tp_rel in [20] then
          ApagaDados( 'TREL_EST_ARM_PREFIXO', nr_identificador );
        if tp_rel in [21] then
          ApagaDados( 'TREL_FAT_SALDOS', nr_identificador );
        if tp_rel in [22] then
        begin
          ApagaDados( 'TREL_LIQUIDACAO', nr_identificador );
          ApagaDados( 'TREL_LIQUIDACAO_FATURAS', nr_identificador );
        end;
        if tp_rel in [23] then
        begin
          ApagaDados( 'TREL_EST_DESP', nr_identificador );
          ApagaDados( 'TREL_EST_DESP_ITEM', nr_identificador );
        end;
        if tp_rel in [25] then
        begin
          ApagaDados( 'TREL_DEM_EST', nr_identificador );
        end;
        if tp_rel in [26] then  // INICIO RENTABILIDADE DE PROCESSOS
        begin
          ApagaDados( 'TREL_RENT_PROC_CAPA', nr_identificador );
          ApagaDados( 'TAUX_REL_RENT_PROC', nr_identificador );
          ApagaDados( 'TREL_RENT_PROC_ITEM', nr_identificador );  // FIM RENTABILIDADE DE PROCESSOS

        end;
        if tp_rel in [27] then  // Demonstrativo de Conta Corrente
        begin
          ApagaDados( 'TREL_DEMO_CC', nr_identificador );
        end;
        if tp_rel in [28] then  // LEAD TIME PO
        begin
          ApagaDados( 'TREL_LEAD_TIME_PO', nr_identificador );
        end;
        if tp_rel in [29] then  // Estatístico Qtde de Conteineres
        begin
          ApagaDados( 'TREL_EST_QT_CNTR', nr_identificador );
        end;
        if tp_rel in [30] then  // PO - Previsto/Embarcados
        begin
          ApagaDados( 'TREL_PO_EMB', nr_identificador );
        end;
        if tp_rel in [31] then  // RELATORIO GERENCIAL NIVEL DE SERVIÇO
        begin
          ApagaDados( 'TREL_NIVEL_SERVICO_PO', nr_identificador );
        end;
        if tp_rel in [32] then  // RELATORIO GERENCIAL NIVEL DE SERVIÇO
        begin
          ApagaDados( 'TREL_PO_EMB_WEB', nr_identificador );
        end;
        if tp_rel in [33] then  // RELATORIO PREVISÃO DE PO'S A SEREM NACIONALIZADAS
        begin
          ApagaDados( 'TREL_PREV_PO_NACION', nr_identificador );
        end;
      end;
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sel_unid_prod.FormShow(Sender: TObject);
begin
  msk_dt_inicio.Date := dt_server;
  msk_dt_fim.Date    := dt_server;

  if ComPeriodo then
    lbl_periodo.Caption := 'Selecione um período:';

  if tp_rel in [11] then
  begin
    lblgrupo.Visible       := True;
    msk_cd_grupo.Visible   := True;
    edt_nm_grupo.Visible   := True;
    btn_co_grupo.Visible   := True;

    lbl_cd_cliente.Visible := True;
    msk_cd_cliente.Visible := True;
    edt_nm_cliente.Visible := True;
    btn_co_cliente.Visible := True;
{    lbl_cd_cliente.Top     := 90;
    msk_cd_cliente.Top     := 103;
    edt_nm_cliente.Top     := 103;
    btn_co_cliente.Top     := 102;}

    msk_dt_inicio.Date     := dt_server;
  end
  else
  begin
    if tp_rel in [8, 9, 10, 12, 19] then
    begin
      lbl_periodo.Visible   := False;
      msk_dt_inicio.Visible := False;
    end
    else
    begin
      if Not tp_rel in [5, 14, 15, 16] then
      begin
        lbl_periodo.Caption := 'Selecione uma data:';
        msk_dt_inicio.Date  := dt_server;
      end;
    end;
  end;

  case tp_rel of
    1 : Caption := 'Relação de Recebimentos de Numerário';
    2 : begin
          Caption := 'Movimento Estatístico';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
        end;
    3 : begin
          Caption := 'Comissão por Processo (FATURA) ';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
        end;
    4 : begin
          Caption := 'Comparativo Comissão por Fatura ';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
        end;
    5 : begin
          Caption := 'Follow-Up - Planilha';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
          msk_dt_inicio.Visible  := False;
          lbl_periodo.Visible    := False;
        end;
 6, 7 : begin
          if tp_rel = 6 then
            Caption := 'Totais de Tipo de Serviço por Cliente'
          else
            Caption := 'Totais de Tipo de Serviço por Cliente - Analítico';

          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
          lbl_cd_area.Visible    := True;
          msk_cd_area.Visible    := True;
          edt_nm_area.Visible    := True;
          btn_co_area.Visible    := True;
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible    := True;
          edt_nm_grupo.Visible    := True;
          btn_co_grupo.Visible    := True;

          lbl_cd_area.Top        := lbl_cd_fornecedor.Top;
          msk_cd_area.Top        := msk_cd_fornecedor.Top;
          edt_nm_area.Top        := edt_nm_fornecedor.Top;
          btn_co_area.Top        := btn_co_fornecedor.Top;

          msk_cd_grupo.TabOrder    := msk_cd_produto.TabOrder + 1;
          msk_cd_cliente.TabOrder  := msk_cd_grupo.TabOrder + 1;
          msk_cd_area.TabOrder     := msk_cd_cliente.TabOrder + 1;
          msk_dt_inicio.TabOrder   := msk_cd_area.TabOrder + 1;
          msk_dt_fim.TabOrder      := msk_dt_inicio.TabOrder + 1;
        end;
    9 : Caption := 'Despachos para Pagamento';
    10: begin
          Caption := 'Andamento por último evento realizado';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
          msk_cd_grupo.SetFocus;
        end;
    11: Caption := 'Numerário não Recebido';
    12: begin
          Caption := 'Controle de Demurrage';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
        end;
    13: begin
          Caption := 'Relatório de Requisição de Pagamentos';
          lblGrupo.Visible       := True;
          lblGrupo.Caption       := 'N.º Cheque';
          msk_cd_grupo.Visible   := False;
          msk_nr_cheque.Visible  := True;
          edt_nm_grupo.Visible   := False;
          btn_co_grupo.Visible   := False;
          lbl_cd_cliente.Visible := False;
          msk_cd_cliente.Visible := False;
          edt_nm_cliente.Visible := False;
          btn_co_cliente.Visible := False;
          // Alinhar
          msk_nr_cheque.Top      := msk_cd_grupo.Top;
          msk_nr_cheque.Left     := msk_cd_grupo.Left;
          lbl_periodo.Top        := lbl_cd_cliente.Top;
          msk_dt_inicio.Top      := msk_cd_cliente.Top;
        end;
    14: begin
          Caption := 'Rel. de Faturas Pendentes de Boleto';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
        end;
    15: begin
          Caption := 'Rel. Estatístico de Mercadorias';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
        end;
    16: begin
          Caption := 'Rel. Pagamentos do Cliente';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
        end;
    17: begin
          Caption := 'Rel. Armazenagem / Demurrage';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
        end;
    18: begin
          Caption := 'Rel. Cntr x Valor CIF';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
        end;
    19: begin
          Caption := 'Rel. Saldos Pendentes';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
          chkVenc.Visible := True;
          chkDev.Visible := True;
          chkCred.Visible := True;
          datm_sel_unid_prod.qryReferencia.Open;
          datm_sel_unid_prod.qryReferencia.First;
          while not datm_sel_unid_prod.qryReferencia.Eof do
          begin
            lb1.Items.Add(datm_sel_unid_prod.qryReferenciaNM_REFERENCIA.AsString);
            datm_sel_unid_prod.qryReferencia.Next;
          end;
          datm_sel_unid_prod.qryReferencia.Close;
          gbReferencias.Left := 14;
          gbReferencias.Top := 255;
          gbReferencias.Visible := True;
        end;
    20: begin
          Caption := 'Rel. Armazenagem X Prefixo';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
          lbl_prefixo.Visible    := True;
          msk_cd_prefixo.Visible := True;
        end;
    21: begin
          Caption := 'Relação de Saldos';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
        end;
    22: begin
          Caption := 'Relação de Liquidações';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
        end;
    23: begin
          Caption := 'Relação de Despesas';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
        end;
    24: begin
          // Herdado em frm_sel_unid_cont
        end;
    25: begin
          Caption := 'Rel. Demurrage - Estatístico';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
          chk_arquivo.Visible    := True;
          chk_excel.Visible      := True;
        end;
    26: begin
          Caption := 'Rentabilidade de Processos';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_cd_cliente.Visible := True;
          msk_cd_cliente.Visible := True;
          edt_nm_cliente.Visible := True;
          btn_co_cliente.Visible := True;
          chk_arquivo.Visible    := True;
        end;
    27: begin
           Caption := 'Demonstrativo de Contas Correntes';
           lblGrupo.Visible       := True;
           msk_cd_grupo.Visible   := True;
           edt_nm_grupo.Visible   := True;
           btn_co_grupo.Visible   := True;
           lbl_cd_cliente.Visible := True;
           msk_cd_cliente.Visible := True;
           edt_nm_cliente.Visible := True;
           btn_co_cliente.Visible := True;
           lbl_periodo.Caption      := 'Selecione um período:';
           lbl_a.Visible            := True;
           msk_dt_fim.Visible       := True;
           lbl_relatorio.Visible    := True;
           msk_nr_relatorio.Visible := True;

           lbl_relatorio.Left       := lbl_prefixo.Left;
           msk_nr_relatorio.Left    := msk_cd_prefixo.Left;

           msk_cd_unid_neg.Text     := str_cd_unid_neg;
           msk_cd_unid_negExit(nil);

           with datm_sel_unid_prod.qry_ult_relat_ do
           begin
             Close;
             Prepare;
             Open;
             if Eof then
             begin
               msk_nr_relatorio.Text := '1/' + Copy( FormatDateTime( 'yyyy', Date ), 3, 2 )
             end
             else
             begin
               msk_nr_relatorio.Text := Trim( IntToStr( FieldByName('NUM_RELAT').AsInteger + 1 ) ) + '/' + Copy( FormatDateTime( 'yyyy', Date ), 3, 2);
             end;
           end;
           msk_cd_grupo.SetFocus;
        end;
 28,31: begin
          if tp_rel = 28 then
            Caption := 'Lead Time PO'
          else
            Caption := 'Relatório Gerencial Nível de Serviço';
          lblGrupo.Visible          := True;
          msk_cd_grupo.Visible      := True;
          edt_nm_grupo.Visible      := True;
          btn_co_grupo.Visible      := True;
          lbl_cd_cliente.Visible    := True;
          msk_cd_cliente.Visible    := True;
          edt_nm_cliente.Visible    := True;
          btn_co_cliente.Visible    := True;
          lbl_cd_fornecedor.Visible := True;
          msk_cd_fornecedor.Visible := True;
          edt_nm_fornecedor.Visible := True;
          btn_co_fornecedor.Visible := True;
          lbl_periodo.Caption       := 'Selecione um período:';
          lbl_a.Visible             := True;
          msk_dt_inicio.Visible     := True;
          msk_dt_fim.Visible        := True;
          chk_arquivo.Visible       := True;
          chk_excel.Visible         := False;
          lbl_unid_neg.Visible      := False;
          msk_cd_unid_neg.Visible   := False;
          edt_nm_unid_neg.Visible   := False;
          btn_co_unid_neg.Visible   := False;
          lbl_produto.Visible       := False;
          msk_cd_produto.Visible    := False;
          edt_nm_produto.Visible    := False;
          btn_co_produto.Visible    := False;

          lbl_periodo.Top           := lbl_cd_cliente.Top + 12;
          msk_dt_inicio.Top         := msk_cd_cliente.Top + 12;
          lbl_a.Top                 := msk_cd_cliente.Top + 16;
          msk_dt_fim.Top            := msk_cd_cliente.Top + 12;
          chk_arquivo.Top           := msk_dt_inicio.Top + 29;

          lbl_cd_fornecedor.Top     := lblGrupo.Top;
          msk_cd_fornecedor.Top     := msk_cd_grupo.Top;
          edt_nm_fornecedor.Top     := edt_nm_grupo.Top;
          btn_co_fornecedor.Top     := btn_co_grupo.Top;
          lblGrupo.Top              := lbl_unid_neg.Top;
          msk_cd_grupo.Top          := msk_cd_unid_neg.Top;
          edt_nm_grupo.Top          := edt_nm_unid_neg.Top;
          btn_co_grupo.Top          := btn_co_unid_neg.Top;
          lbl_cd_cliente.Top        := lbl_produto.Top;
          msk_cd_cliente.Top        := msk_cd_produto.Top;
          edt_nm_cliente.Top        := edt_nm_produto.Top;
          btn_co_cliente.Top        := btn_co_produto.Top;

          msk_cd_grupo.SetFocus;
          msk_dt_inicio.TabOrder     := msk_cd_fornecedor.TabOrder + 1;
          msk_dt_fim.TabOrder        := msk_dt_inicio.TabOrder + 1;
          chk_arquivo.TabOrder       := msk_dt_fim.TabOrder + 1;
        end;
    29: begin
          Caption := 'Quantidade de Contêineres';

          lblGrupo.Visible           := True;
          msk_cd_grupo.Visible       := True;
          edt_nm_grupo.Visible       := True;
          btn_co_grupo.Visible       := True;
          lbl_cd_cliente.Visible     := True;
          msk_cd_cliente.Visible     := True;
          edt_nm_cliente.Visible     := True;
          btn_co_cliente.Visible     := True;
          chk_arquivo.Visible        := True;
          lbl_cd_area.Visible        := True;
          msk_cd_area.Visible        := True;
          edt_nm_area.Visible        := True;
          btn_co_area.Visible        := True;
          msk_sg_grupo_area.Visible  := True;
          lbl_cd_grupo_area.Visible  := True;

          lbl_cd_area.Top            := lbl_cd_fornecedor.Top;
          lbl_cd_grupo_area.Top      := lbl_cd_fornecedor.Top;
          msk_cd_area.Top            := msk_cd_fornecedor.Top;
          edt_nm_area.Top            := msk_cd_fornecedor.Top;
          btn_co_area.Top            := msk_cd_fornecedor.Top;
          msk_sg_grupo_area.Top      := msk_cd_fornecedor.Top;

          msk_cd_area.TabOrder       := msk_cd_cliente.TabOrder + 1;
          msk_sg_grupo_area.TabOrder := msk_cd_area.TabOrder + 1;
          msk_dt_inicio.TabOrder     := msk_sg_grupo_area.TabOrder + 1;
          msk_dt_fim.TabOrder        := msk_dt_inicio.TabOrder + 1;

          msk_cd_area.TabOrder       := msk_cd_cliente.TabOrder + 1;
          msk_sg_grupo_area.TabOrder := msk_cd_area.TabOrder + 1;

        end;
    30: begin
          Caption := 'PO - Previstos/Embarcados';
          lblGrupo.Visible          := True;
          msk_cd_grupo.Visible      := True;
          edt_nm_grupo.Visible      := True;
          btn_co_grupo.Visible      := True;
          lbl_cd_cliente.Visible    := True;
          msk_cd_cliente.Visible    := True;
          edt_nm_cliente.Visible    := True;
          btn_co_cliente.Visible    := True;
          lbl_periodo.Caption       := 'Selecione um período:';
          lbl_a.Visible             := True;
          msk_dt_inicio.Visible     := True;
          msk_dt_fim.Visible        := True;
          chk_arquivo.Visible       := True;
          chk_excel.Visible         := False;
          lbl_unid_neg.Visible      := False;
          msk_cd_unid_neg.Visible   := False;
          edt_nm_unid_neg.Visible   := False;
          btn_co_unid_neg.Visible   := False;
          lbl_produto.Visible       := False;
          msk_cd_produto.Visible    := False;
          edt_nm_produto.Visible    := False;
          btn_co_produto.Visible    := False;

          lblGrupo.Top              := lbl_unid_neg.Top;
          msk_cd_grupo.Top          := msk_cd_unid_neg.Top;
          edt_nm_grupo.Top          := edt_nm_unid_neg.Top;
          btn_co_grupo.Top          := btn_co_unid_neg.Top;
          lbl_cd_cliente.Top        := lbl_produto.Top;
          msk_cd_cliente.Top        := msk_cd_produto.Top;
          edt_nm_cliente.Top        := edt_nm_produto.Top;
          btn_co_cliente.Top        := btn_co_produto.Top;
          lbl_periodo.Top           := lbl_cd_fornecedor.Top;
          msk_dt_inicio.Top         := msk_cd_fornecedor.Top;
          lbl_a.Top                 := msk_cd_fornecedor.Top;
          msk_dt_fim.Top            := msk_cd_fornecedor.Top;
          chk_arquivo.Top           := msk_dt_inicio.Top + 29;

          msk_cd_grupo.SetFocus;
          msk_dt_inicio.TabOrder     := msk_cd_fornecedor.TabOrder + 1;
          msk_dt_fim.TabOrder        := msk_dt_inicio.TabOrder + 1;
          chk_arquivo.TabOrder       := msk_dt_fim.TabOrder + 1;
        end;
    32: begin
          Caption := 'PO - Embarques';
          lblGrupo.Visible          := True;
          msk_cd_grupo.Visible      := True;
          edt_nm_grupo.Visible      := True;
          btn_co_grupo.Visible      := True;
          lbl_cd_cliente.Visible    := True;
          msk_cd_cliente.Visible    := True;
          edt_nm_cliente.Visible    := True;
          btn_co_cliente.Visible    := True;
          lbl_periodo.Caption       := 'Selecione um período:';
          lbl_a.Visible             := True;
          msk_dt_inicio.Visible     := True;
          msk_dt_fim.Visible        := True;
          chk_arquivo.Visible       := True;
          chk_excel.Visible         := False;
          lbl_unid_neg.Visible      := False;
          msk_cd_unid_neg.Visible   := False;
          edt_nm_unid_neg.Visible   := False;
          btn_co_unid_neg.Visible   := False;
          lbl_produto.Visible       := False;
          msk_cd_produto.Visible    := False;
          edt_nm_produto.Visible    := False;
          btn_co_produto.Visible    := False;

          lblGrupo.Top              := lbl_unid_neg.Top;
          msk_cd_grupo.Top          := msk_cd_unid_neg.Top;
          edt_nm_grupo.Top          := edt_nm_unid_neg.Top;
          btn_co_grupo.Top          := btn_co_unid_neg.Top;
          lbl_cd_cliente.Top        := lbl_produto.Top;
          msk_cd_cliente.Top        := msk_cd_produto.Top;
          edt_nm_cliente.Top        := edt_nm_produto.Top;
          btn_co_cliente.Top        := btn_co_produto.Top;
          lbl_periodo.Top           := lbl_cd_fornecedor.Top;
          msk_dt_inicio.Top         := msk_cd_fornecedor.Top;
          lbl_a.Top                 := msk_cd_fornecedor.Top;
          msk_dt_fim.Top            := msk_cd_fornecedor.Top;
          chk_arquivo.Top           := msk_dt_inicio.Top + 29;

          msk_cd_grupo.SetFocus;
          msk_dt_inicio.TabOrder     := msk_cd_fornecedor.TabOrder + 1;
          msk_dt_fim.TabOrder        := msk_dt_inicio.TabOrder + 1;
          chk_arquivo.TabOrder       := msk_dt_fim.TabOrder + 1;
        end;
    33: begin
          Caption := 'Relatório de Previsão de PO a Nacionalizar';
          lbl_unid_neg.Visible       := True;
          msk_cd_unid_neg.Visible    := True;
          edt_nm_unid_neg.Visible    := True;
          btn_co_unid_neg.Visible    := True;
          lblGrupo.Visible           := True;
          msk_cd_grupo.Visible       := True;
          edt_nm_grupo.Visible       := True;
          btn_co_grupo.Visible       := True;
          lbl_cd_cliente.Visible     := True;
          msk_cd_cliente.Visible     := True;
          edt_nm_cliente.Visible     := True;
          btn_co_cliente.Visible     := True;
          lbl_cd_area.Visible        := True;
          msk_cd_area.Visible        := True;
          edt_nm_area.Visible        := True;
          btn_co_area.Visible        := True;

          lbl_produto.Visible        := False;
          msk_cd_produto.Visible     := False;
          edt_nm_produto.Visible     := False;
          btn_co_produto.Visible     := False;


          lblGrupo.Top               := lbl_unid_neg.Top    + 40;
          msk_cd_grupo.Top           := msk_cd_unid_neg.Top + 40;
          edt_nm_grupo.Top           := edt_nm_unid_neg.Top + 40;
          btn_co_grupo.Top           := btn_co_unid_neg.Top + 40;
          lbl_cd_cliente.Top         := lblGrupo.Top     + 40;
          msk_cd_cliente.Top         := msk_cd_grupo.Top + 40;
          edt_nm_cliente.Top         := edt_nm_grupo.Top + 40;
          btn_co_cliente.Top         := btn_co_grupo.Top + 40;
          lbl_cd_area.Top            := lbl_cd_cliente.Top + 40;
          msk_cd_area.Top            := msk_cd_cliente.Top + 40;
          edt_nm_area.Top            := edt_nm_cliente.Top + 40;
          btn_co_area.Top            := btn_co_cliente.Top + 40;

          msk_cd_unid_neg.TabOrder   := 0;
          msk_cd_grupo.TabOrder      := 1;
          msk_cd_cliente.TabOrder    := 2;
          msk_cd_area.TabOrder       := 3;

          msk_dt_inicio.Date         := StrToDate( FormatDatetime('DD/MM/YYYY', date() - 180 ) );
        end;
    34: begin
          Caption := 'Rel. Saldo Clientes';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          msk_dt_inicio.Visible  := False;
          lbl_periodo.Visible    := False;
        end;
    35: begin
          Caption := 'Rel. Faturamentos Consolidados';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_periodo.Caption    := 'Selecione um período:';
          msk_dt_inicio.Visible  := True;
          lbl_a.Visible          := True;
          msk_dt_fim.Visible     := True;
          ComPeriodo             := True;
        end;
    36: begin
          Caption := 'Rel. Valores Pendentes';
          lblGrupo.Visible       := True;
          msk_cd_grupo.Visible   := True;
          edt_nm_grupo.Visible   := True;
          btn_co_grupo.Visible   := True;
          lbl_periodo.Caption    := 'Selecione um período:';
          msk_dt_inicio.Visible  := True;
          lbl_a.Visible          := True;
          msk_dt_fim.Visible     := True;
          ComPeriodo             := True;
          lbl_periodo.Top        := 163;
          msk_dt_inicio.Top      := 176;
          msk_dt_fim.Top         := 176;
          lbl_a.Top              := 176;
          frm_sel_unid_prod.Width := 415;
          edt_nm_modal.Visible    :=True;
          btn_co_modal.Visible    :=true;
          msk_cd_modal.Visible    :=true;
          Lbl_modal.Visible       :=true;

        end;
  end;

  with datm_sel_unid_prod do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_unid_neg_.Prepare;
    qry_produto_.Prepare;
    qry_unid_neg_.Open;
    qry_produto_.Open;
  end;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);

  lbl_a.Visible        := ComPeriodo;
  msk_dt_fim.Visible   := ComPeriodo;

  if tp_rel in [28, 31, 29, 33] then
  begin
    msk_dt_inicio.TabOrder     := msk_cd_fornecedor.TabOrder + 1;
  end
  else
  begin
    if ( msk_cd_cliente.Visible ) and ( tp_rel <> 6 ) and ( tp_rel <> 7 ) then
      msk_dt_inicio.TabOrder := msk_cd_cliente.TabOrder + 1;
  end;

  if msk_cd_prefixo.Visible then
  begin
    msk_cd_prefixo.TabOrder  := msk_dt_inicio.TabOrder + 1;
  end;

  if ( tp_rel <> 6 ) and ( tp_rel <> 7 ) then
    msk_dt_fim.TabOrder        := msk_dt_inicio.TabOrder + 1;
end;

procedure Tfrm_sel_unid_prod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tp_rel <> 34 then
    crp_unid_prod.Free;


  with datm_sel_unid_prod do
  begin
    qry_grupo_.Close;
    qry_cliente_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_empresa_est_.Close;
    qry_empresa_nac_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_sel_unid_prod.FormCreate(Sender: TObject);
begin
  // Inicializa o Data Module para Seleção de Relatórios
  Application.CreateForm( Tdatm_sel_unid_prod, datm_sel_unid_prod );
end;

procedure Tfrm_sel_unid_prod.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.text = '' then
  begin
    if (tp_rel = 5) or (tp_rel = 29) then edt_nm_cliente.Text := ''
    else edt_nm_cliente.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_cliente );
  tp_rel := tp_rel;
  if ( tp_rel <> 28 ) and ( tp_rel <> 31 ) then
  begin
    with datm_sel_unid_prod.qry_cliente_ do
    begin
      ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
      Prepare;
      Open;
      if RecordCount = 0 then
      begin
        BoxMensagem( 'Cliente não encontrado!', 2 );
        msk_cd_cliente.Clear;
        edt_nm_cliente.Clear;
        msk_cd_cliente.SetFocus;
      end
      else
      begin
        if tp_rel in [21, 27] then
          edt_nm_cliente.Text:= FieldByName('NM_EMPRESA').AsString
        else
          edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
      end;
    Close;
    end;
  end
  else
  begin
    with datm_sel_unid_prod.qry_empresa_nac_ do
    begin
      close;
      ParamByName('CD_EMPRESA').AsString := msk_cd_cliente.Text;
      Prepare;
      Open;
      if RecordCount = 0 then
      begin
        BoxMensagem( 'Cliente não encontrado!', 2 );
        msk_cd_cliente.Clear;
        edt_nm_cliente.Clear;
        msk_cd_cliente.SetFocus;
      end
      else
      begin
        if tp_rel in [28, 31] then
          edt_nm_cliente.Text:= FieldByName('NM_EMPRESA').AsString;
      end;
      close;
    end;
  end;
end;

procedure Tfrm_sel_unid_prod.btn_co_clienteClick(Sender: TObject);
begin
  if tp_rel in [28, 31] then
  begin
    Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);
    with frm_cliente_co do
    begin
      Caption := Caption;
      frm_cliente_co.Cons_OnLine_Texto := msk_cd_cliente.Text;
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
      msk_cd_cliente.Text := frm_cliente_co.Cons_OnLine_Texto;
    end;
  end
  else
  begin
    Application.CreateForm(Tfrm_cliente, frm_cliente);
    with frm_cliente do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      frm_cliente.Cons_OnLine_Texto := msk_cd_cliente.Text;
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
      msk_cd_cliente.Text := frm_cliente.Cons_OnLine_Texto;
    end;
  end;
  msk_cd_clienteExit(nil);
  msk_cd_cliente.SetFocus;
end;

procedure Tfrm_sel_unid_prod.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg   then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto    then btn_co_produtoClick(nil);
    if Sender = msk_cd_grupo      then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente    then btn_co_clienteClick(nil);
    if Sender = msk_cd_fornecedor then btn_co_fornecedorClick(nil);
    if Sender = msk_cd_area       then btn_co_areaClick(nil);
  end;
end;

procedure Tfrm_sel_unid_prod.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  with frm_grupo do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if frm_grupo.Cons_OnLine_Texto <> '' then msk_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
  end;
  msk_cd_grupoExit(nil);
end;

procedure Tfrm_sel_unid_prod.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then
  begin
    if tp_rel in [5] then edt_nm_grupo.Text := ''
    else edt_nm_grupo.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_grupo );
  with datm_sel_unid_prod.qry_grupo_ do
  begin
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Grupo de Clientes não encontrado!', 2 );
      msk_cd_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end
    else edt_nm_grupo.Text := FieldByName('NM_GRUPO').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_unid_prod.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text = '' then
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    msk_cd_cliente.TabStop := True;
    btn_co_cliente.Enabled := True;
  end
  else
  begin
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    msk_cd_cliente.Enabled := False;
    msk_cd_cliente.TabStop := False;
    btn_co_cliente.Enabled := False;
  end;
end;

procedure Tfrm_sel_unid_prod.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.text = '' then
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    msk_cd_grupo.TabStop := True;
    btn_co_grupo.Enabled := True;
  end
  else
  begin
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    msk_cd_grupo.Enabled := False;
    msk_cd_grupo.TabStop := False;
    btn_co_grupo.Enabled := False;
  end;
end;

procedure Tfrm_sel_unid_prod.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Close;
end;

procedure Tfrm_sel_unid_prod.msk_nr_chequeExit(Sender: TObject);
begin
  ValCodEdt( msk_nr_cheque );
end;

procedure Tfrm_sel_unid_prod.GeraArquivoRelEstMercadoria( nr_identificador: Integer );
var
  rel_cd_unid_neg : String[02];
begin
  Application.ProcessMessages;
  with datm_sel_unid_prod do
  begin
    if Trim( msk_cd_produto.Text ) = '01' then
      cNomeTxt := cDir_Rpt + '\REL_EST_MERC_IMP.TXT'
    else
      cNomeTxt := cDir_Rpt + '\REL_EST_MERC_EXP.TXT';
    FileMode := 2;
    try
      AssignFile( Txt, cNomeTxt );
      ReWrite( Txt );
    except
      BoxMensagem( 'Erro na criação do Arquivo!', 2 );
      Exit;
    end;

    Saida := 'RELAÇÃO ESTATÍSTICA DE MERCADORIAS' + #13#10;
    Write( Txt, Saida );
    if Trim( msk_cd_produto.Text ) = '01' then
    begin
      qry_rel_est_mercadoria_imp_.Close;
      qry_rel_est_mercadoria_imp_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      qry_rel_est_mercadoria_imp_.Prepare;
      qry_rel_est_mercadoria_imp_.Open;

      Saida := qry_rel_est_mercadoria_imp_NM_UNID_NEG.AsString + #13#10 + 'Importação' + #13#10;
      Write( Txt, Saida );
      Saida := 'Cliente;N.C.M.;Cód.;Mercadoria;Nº DI;Dt. Registro DI; Nº Embarque;Peso Líquido;Qtde.;';
      Write( Txt, Saida );
      Saida := 'Nº Adição;Ato Drawback;Moeda;FOB;Moeda;Frete;Moeda;Seguro;Reg. Trib. II;Aliq. II;Valor II;';
      Write( Txt, Saida );
      Saida := 'Reg. Trib. IPI;Aliq. IPI; Valor IPI;Reg. Trib. ICMS;Aliq. ICMS; Valor ICMS;Exportador;País de Origem;Área;Moedas/Taxas' + #13#10;
      Write( Txt, Saida );
      rel_cd_unid_neg := qry_rel_est_mercadoria_imp_CD_UNID_NEG.AsString;
      qry_rel_est_mercadoria_imp_.First;
      while Not qry_rel_est_mercadoria_imp_.EOF do
      begin
        // Unid. Negócio
        if rel_cd_unid_neg <> qry_rel_est_mercadoria_imp_CD_UNID_NEG.AsString then
        begin
          Saida := qry_rel_est_mercadoria_imp_NM_UNID_NEG.AsString + #13#10 + 'Importação' + #13#10;
          Write( Txt, Saida );
        end;
        // Cliente
        Saida := qry_rel_est_mercadoria_imp_NM_CLIENTE.AsString + ';';;
        Write( Txt, Saida );
        // NCM
        Saida := Copy( qry_rel_est_mercadoria_imp_CD_NCM_SH.AsString, 1, 4 ) + '.' +
                 Copy( qry_rel_est_mercadoria_imp_CD_NCM_SH.AsString, 5, 2 ) + '.' +
                 Copy( qry_rel_est_mercadoria_imp_CD_NCM_SH.AsString, 7, 2 );
        if Copy( qry_rel_est_mercadoria_imp_CD_NCM_SH.AsString, 9, 3 ) <> '' then
           Saida := Saida + '-' + Copy( qry_rel_est_mercadoria_imp_CD_NCM_SH.AsString, 9, 3 );
        Saida := Saida + ';';
        Write( Txt, Saida );
        // Cód Mercadoria
        Saida := Trim( qry_rel_est_mercadoria_imp_CD_MERCADORIA.AsString ) + ';';
        Write( Txt, Saida );
        // Descrição da Mercadoria
        Saida := Trim( qry_rel_est_mercadoria_imp_AP_MERCADORIA.AsString ) + ';';
        Write( Txt, Saida );
        // Nº DI
        Saida := '';
        if Trim( qry_rel_est_mercadoria_imp_NR_DI.AsString ) <> '' then
           Saida := Saida + Copy( qry_rel_est_mercadoria_imp_NR_DI.AsString, 1, 2 ) + '/' +
                    Copy( qry_rel_est_mercadoria_imp_NR_DI.AsString, 3, 7 ) + '-' +
                    Copy( qry_rel_est_mercadoria_imp_NR_DI.AsString, 10, 1 );
        Saida := Saida + ';';
        Write( Txt, Saida );
        // Dt. Registro DI
        Saida := '';
        if Not qry_rel_est_mercadoria_imp_DT_REGISTRO_DI.IsNull then
           Saida := Saida + FormatDateTime( 'dd/mm/yyyy', qry_rel_est_mercadoria_imp_DT_REGISTRO_DI.AsDateTime );
        Saida := Saida + ';';
        Write( Txt, Saida );
        // Nº Embarque
        Saida := '';
        if ( Trim( qry_rel_est_mercadoria_imp_NR_PEDIDO.AsString ) <> '' ) and
           ( Trim( qry_rel_est_mercadoria_imp_NR_PEDIDO.AsString ) <> 'X' ) then
        begin
          Saida := Saida + Trim( qry_rel_est_mercadoria_imp_NR_PEDIDO.AsString );
          if ( Trim( qry_rel_est_mercadoria_imp_NR_ITEM_PEDIDO.AsString ) <> '' ) and
             ( Trim( qry_rel_est_mercadoria_imp_NR_ITEM_PEDIDO.AsString ) <> 'X' ) then
             Saida := Saida + '/' + Trim( IntToStr( StrToInt( Trim( qry_rel_est_mercadoria_imp_NR_ITEM_PEDIDO.AsString ) ) ) )
          else
             Saida := Saida + '/1';
          Saida := Saida + ';';
        end
        else
           Saida := Saida + ';';
        Write( Txt, Saida );
        // Peso Líquido
        Saida := FormatFloat( '#0,.00', qry_rel_est_mercadoria_imp_VL_PESO_LIQUIDO.AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        // Qtde.
        Saida := FormataFloat( '#0,.00', qry_rel_est_mercadoria_imp_VL_QTDE.AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Nº Adição}
        Saida := '';
        if Trim( qry_rel_est_mercadoria_imp_NR_ADICAO.AsString ) <> '' then
           Saida := Saida + qry_rel_est_mercadoria_imp_NR_ADICAO.AsString;
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Ato Drawback}
        Saida := '';
        if ( Trim( qry_rel_est_mercadoria_imp_NR_ATO_DRAWBACK.AsString ) <> '' ) and
           ( Trim( qry_rel_est_mercadoria_imp_NR_ATO_DRAWBACK.AsString ) <> 'X' ) then
           Saida := Saida + qry_rel_est_mercadoria_imp_NR_ATO_DRAWBACK.AsString;
        Saida := Saida + ';';
        Write( Txt, Saida );
        {FOB}
        Saida := Trim( qry_rel_est_mercadoria_imp_AP_MOEDA_MLE.AsString ) + ';';
        Saida := Saida + FormatFloat( '#0,.00', qry_rel_est_mercadoria_imp_VL_FOB.AsFloat ) + ';';;
        {Frete}
        Saida := Saida + Trim( qry_rel_est_mercadoria_imp_AP_MOEDA_FRETE.AsString ) + ';';
        Saida := Saida + FormatFloat( '#0,.00', qry_rel_est_mercadoria_imp_VL_FRETE.AsFloat ) + ';';;
        {Seguro}
        Saida := Saida + Trim( qry_rel_est_mercadoria_imp_AP_MOEDA_SEGURO.AsString ) + ';';
        Saida := Saida + FormatFloat( '#0,.00', qry_rel_est_mercadoria_imp_VL_SEGURO.AsFloat ) + ';';;
        Write( Txt, Saida );
        {Reg. Trib. I.I.}
        Saida := '';
        if Trim( qry_rel_est_mercadoria_imp_NM_REG_TRIB_II.AsString ) <> '' then
           Saida := Saida + Trim( qry_rel_est_mercadoria_imp_NM_REG_TRIB_II.AsString );
        Saida := Saida + ';';
        {Alíq. I.I.}
        Saida := Saida + FormatFloat( '#0,.00', qry_rel_est_mercadoria_imp_VL_ALIQ_II.AsFloat );
        Saida := Saida + ';';
        {Valor I.I.}
        Saida := Saida + FormatFloat( '#0,.00', qry_rel_est_mercadoria_imp_VL_II.AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Reg. Trib. I.P.I.}
        Saida := '';
        if Trim( qry_rel_est_mercadoria_imp_NM_REG_TRIB_IPI.AsString ) <> '' then
           Saida := Saida + Trim( qry_rel_est_mercadoria_imp_NM_REG_TRIB_IPI.AsString );
        Saida := Saida + ';';
        {Alíq. I.P.I.}
        Saida := Saida + FormatFloat( '#0,.00', qry_rel_est_mercadoria_imp_VL_ALIQ_IPI.AsFloat );
        Saida := Saida + ';';
        {Valor I.P.I.}
        Saida := Saida + FormatFloat( '#0,.00', qry_rel_est_mercadoria_imp_VL_IPI.AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Reg. Trib. I.C.M.S.}
        Saida := '';
        if Trim( qry_rel_est_mercadoria_imp_NM_REG_TRIB_ICMS.AsString ) <> '' then
           Saida := Saida + Trim( qry_rel_est_mercadoria_imp_NM_REG_TRIB_ICMS.AsString );
        Saida := Saida + ';';
        {Alíq. I.C.M.S.}
        Saida := Saida + FormatFloat( '#0,.00', qry_rel_est_mercadoria_imp_VL_ALIQ_ICMS.AsFloat );
        Saida := Saida + ';';
        {Valor I.C.M.S.}
        Saida := Saida + FormatFloat( '#0,.00', qry_rel_est_mercadoria_imp_VL_ICMS.AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Exportador}
        Saida := '';
        if Trim( qry_rel_est_mercadoria_imp_NM_EXPORTADOR.AsString ) <> '' then
           Saida := Saida + Trim( qry_rel_est_mercadoria_imp_NM_EXPORTADOR.AsString );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {País de Origem}
        Saida := '';
        if Trim( qry_rel_est_mercadoria_imp_NM_PAIS_ORIGEM.AsString ) <> '' then
           Saida := Saida + Trim( qry_rel_est_mercadoria_imp_NM_PAIS_ORIGEM.AsString );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Área}
        Saida := '';
        if Trim( qry_rel_est_mercadoria_imp_NM_AREA.AsString ) <> '' then
           Saida := Saida + Trim( qry_rel_est_mercadoria_imp_NM_AREA.AsString );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Moedas/Taxas}
        Saida := 'US$;' + FormatFloat( '#0,.0000000', qry_rel_est_mercadoria_imp_TX_CAMBIO_DOLAR.AsFloat );
        if ( Trim( qry_rel_est_mercadoria_imp_CD_MOEDA_MLE.AsString ) <> '' ) and
           ( Trim( qry_rel_est_mercadoria_imp_CD_MOEDA_MLE.AsString ) <> '220' ) then
        begin
          Saida := Saida + ';' + Trim( qry_rel_est_mercadoria_imp_AP_MOEDA_MLE.AsString ) + ';' +
                           FormatFloat( '#0,.0000000', qry_rel_est_mercadoria_imp_TX_CAMBIO_MLE.AsFloat );
        end;
        if ( Trim( qry_rel_est_mercadoria_imp_CD_MOEDA_FRETE.AsString ) <> '' ) and
           ( Trim( qry_rel_est_mercadoria_imp_CD_MOEDA_FRETE.AsString ) <> '220' ) and
           ( qry_rel_est_mercadoria_imp_CD_MOEDA_MLE.AsString <>
             qry_rel_est_mercadoria_imp_CD_MOEDA_FRETE.AsString ) then
        begin
          Saida := Saida + ';' + Trim( qry_rel_est_mercadoria_imp_AP_MOEDA_FRETE.AsString ) + ';' +
                           FormatFloat( '#0,.0000000', qry_rel_est_mercadoria_imp_TX_CAMBIO_FRETE.AsFloat );
        end;
        if ( Trim( qry_rel_est_mercadoria_imp_CD_MOEDA_SEGURO.AsString ) <> '' ) and
           ( Trim( qry_rel_est_mercadoria_imp_CD_MOEDA_SEGURO.AsString ) <> '220' ) and
           ( qry_rel_est_mercadoria_imp_CD_MOEDA_MLE.AsString <>
             qry_rel_est_mercadoria_imp_CD_MOEDA_SEGURO.AsString ) and
           ( qry_rel_est_mercadoria_imp_CD_MOEDA_FRETE.AsString <>
             qry_rel_est_mercadoria_imp_CD_MOEDA_SEGURO.AsString ) then
        begin
          Saida := Saida + ';' + Trim( qry_rel_est_mercadoria_imp_AP_MOEDA_SEGURO.AsString ) + ';' +
                           FormatFloat( '#0,.0000000', qry_rel_est_mercadoria_imp_TX_CAMBIO_SEGURO.AsFloat );
        end;
        Saida := Saida + #13#10;
        Write( Txt, Saida );

        rel_cd_unid_neg   := qry_rel_est_mercadoria_imp_CD_UNID_NEG.AsString;

        qry_rel_est_mercadoria_imp_.Next;
      end;
      qry_rel_est_mercadoria_imp_.Close;
    end
    else
    begin
      qry_rel_est_mercadoria_exp_.Close;
      qry_rel_est_mercadoria_exp_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      qry_rel_est_mercadoria_exp_.Prepare;
      qry_rel_est_mercadoria_exp_.Open;

      Saida := qry_rel_est_mercadoria_exp_NM_UNID_NEG.AsString + #13#10 + 'Exportação' + #13#10;
      Write( Txt, Saida );
      Saida := 'Cliente;N.C.M.;Cód.;Mercadoria;Peso Líquido;Qtde.;FOB;Com. Agente;Enquad. Op.;;RE;Dt.Embarque;Ato Concessório;País Destino;Área;Moedas/Taxas' + #13#10;
      Write( Txt, Saida );
      rel_cd_unid_neg := qry_rel_est_mercadoria_exp_CD_UNID_NEG.AsString;
      qry_rel_est_mercadoria_exp_.First;
      while Not qry_rel_est_mercadoria_exp_.EOF do
      begin
        {Unid. Negócio}
        if rel_cd_unid_neg <> qry_rel_est_mercadoria_exp_CD_UNID_NEG.AsString then
        begin
          Saida := qry_rel_est_mercadoria_exp_NM_UNID_NEG.AsString + #13#10 + 'Exportação' + #13#10;
          Write( Txt, Saida );
        end;
        {Cliente}
        Saida := qry_rel_est_mercadoria_exp_NM_CLIENTE.AsString + ';';;
        Write( Txt, Saida );
        {NCM}
        if ( Trim( qry_rel_est_mercadoria_exp_CD_NCM_SH.AsString ) = '' ) or
           ( Trim( qry_rel_est_mercadoria_exp_CD_NCM_SH.AsString ) = 'X' ) then
          Saida := 'X'
        else
          Saida := Copy( qry_rel_est_mercadoria_exp_CD_NCM_SH.AsString, 1, 4 ) + '.' +
                   Copy( qry_rel_est_mercadoria_exp_CD_NCM_SH.AsString, 5, 2 ) + '.' +
                   Copy( qry_rel_est_mercadoria_exp_CD_NCM_SH.AsString, 7, 2 );
        if Copy( qry_rel_est_mercadoria_exp_CD_NCM_SH.AsString, 9, 3 ) <> '' then
           Saida := Saida + '-' + Copy( qry_rel_est_mercadoria_exp_CD_NCM_SH.AsString, 9, 3 );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Cód Mercadoria}
        Saida := Trim( qry_rel_est_mercadoria_exp_CD_MERCADORIA.AsString ) + ';';
        Write( Txt, Saida );
        {Descrição da Mercadoria}
        Saida := Trim( qry_rel_est_mercadoria_exp_AP_MERCADORIA.AsString ) + ';';
        Write( Txt, Saida );
        {Peso Líquido}
        Saida := FormatFloat( '#0,.00', qry_rel_est_mercadoria_exp_VL_PESO_LIQUIDO.AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Qtde.}
        Saida := FormatFloat( '#0,.00', qry_rel_est_mercadoria_exp_VL_QTDE.AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {FOB}
        Saida := FormatFloat( '#0,.00', qry_rel_est_mercadoria_exp_VL_FOB.AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Comissão do Agente}
        Saida := FormatFloat( '#0,.00', qry_rel_est_mercadoria_exp_VL_COM_AGENTE.AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Enquadramento da Operação}
        Saida := '';
        if ( Trim( qry_rel_est_mercadoria_exp_CD_ENQUAD_OP.AsString ) <> '' ) and
           ( Trim( qry_rel_est_mercadoria_exp_CD_ENQUAD_OP.AsString ) <> 'X' ) then
        begin
          Saida := Saida + Trim( qry_rel_est_mercadoria_exp_CD_ENQUAD_OP.AsString ) + ';' +
                           Trim( qry_rel_est_mercadoria_exp_NM_ENQUAD_OP.AsString );
        end
        else
          Saida := Saida + ';';
        Saida := Saida + ';';
        Write( Txt, Saida );
        {RE}
        Saida := '';
        if ( Trim( qry_rel_est_mercadoria_exp_NR_RE.AsString ) <> '' ) and
           ( Trim( qry_rel_est_mercadoria_exp_NR_RE.AsString ) <> 'X' ) then
        begin
           Saida := Saida + Copy( qry_rel_est_mercadoria_exp_NR_RE.AsString, 1, 2 ) + '/' +
                            Copy( qry_rel_est_mercadoria_exp_NR_RE.AsString, 3, 7 ) + '-';
           if ( Trim( qry_rel_est_mercadoria_exp_NR_ANEXO.AsString ) <> '' ) and
              ( Trim( qry_rel_est_mercadoria_exp_NR_ANEXO.AsString ) <> 'X' ) then
              Saida := Saida + qry_rel_est_mercadoria_exp_NR_ANEXO.AsString
           else
              Saida := Saida + Copy( qry_rel_est_mercadoria_exp_NR_RE.AsString, 10, 3 );
        end;
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Dt. Embarque}
        Saida := '';
        if Not qry_rel_est_mercadoria_exp_DT_EMBARQUE.IsNull then
           Saida := Saida + FormatDateTime( 'dd/mm/yyyy', qry_rel_est_mercadoria_exp_DT_EMBARQUE.AsDateTime );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Ato Concessório}
        Saida := '';
        if ( Trim( qry_rel_est_mercadoria_exp_NR_ATO_DRAWBACK.AsString ) <> '' ) and
           ( Trim( qry_rel_est_mercadoria_exp_NR_ATO_DRAWBACK.AsString ) <> 'X' ) then
           Saida := Saida + qry_rel_est_mercadoria_exp_NR_ATO_DRAWBACK.AsString;
        Saida := Saida + ';';
        Write( Txt, Saida );
        {País de Destino}
        Saida := '';
        if Trim( qry_rel_est_mercadoria_exp_NM_PAIS_DESTINO.AsString ) <> '' then
           Saida := Saida + Trim( qry_rel_est_mercadoria_exp_NM_PAIS_DESTINO.AsString );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Área}
        Saida := '';
        if Trim( qry_rel_est_mercadoria_exp_NM_AREA.AsString ) <> '' then
           Saida := Saida + Trim( qry_rel_est_mercadoria_exp_NM_AREA.AsString );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Moedas/Taxas}
        Saida := 'US$;' + FormatFloat( '#0,.0000000', qry_rel_est_mercadoria_exp_TX_CAMBIO_DOLAR.AsFloat );
        if ( Trim( qry_rel_est_mercadoria_exp_CD_MOEDA_MLE.AsString ) <> '' ) and
           ( Trim( qry_rel_est_mercadoria_exp_CD_MOEDA_MLE.AsString ) <> '220' ) then
        begin
          Saida := Saida + ';' + Trim( qry_rel_est_mercadoria_exp_AP_MOEDA_MLE.AsString ) + ';' +
                           FormatFloat( '#0,.0000000', qry_rel_est_mercadoria_exp_TX_CAMBIO_MLE.AsFloat );
        end;
        Saida := Saida + #13#10;
        Write( Txt, Saida );

        rel_cd_unid_neg   := qry_rel_est_mercadoria_exp_CD_UNID_NEG.AsString;

        qry_rel_est_mercadoria_exp_.Next;
      end;
      qry_rel_est_mercadoria_exp_.Close;
    end;

    CloseFile( Txt );

    {Fim da Geração do Arquivo}
    BoxMensagem('Arquivo gerado com sucesso!', 3 );
  end;
end;

procedure Tfrm_sel_unid_prod.GeraArquivoRelEstDesp( nr_identificador: Integer );
var
  rel_cd_unid_neg : String[2];
  rel_cd_produto  : String[2];
  rel_nr_processo : String[18];
  i : Byte;
begin
  Application.ProcessMessages;
  Itens[1] := str_cd_item_ii;
  Itens[2] := str_cd_item_ipi;
  Itens[3] := str_cd_item_icms;
  Itens[4] := str_cd_item_siscomex;

  with datm_sel_unid_prod do
  begin
    cNomeTxt := cDir_Rpt + '\REL_EST_DESP.TXT';
    FileMode := 2;
    try
      AssignFile( Txt, cNomeTxt );
      ReWrite( Txt );
    except
      BoxMensagem( 'Erro na criação do Arquivo!', 2 );
      Exit;
    end;

    for i := 1 to 7 do
    begin
      Saida := #13#10;
      Write( Txt, Saida );
    end;

    Saida := 'RELAÇÃO DE DESPESAS' + #13#10;
    Write( Txt, Saida );

    qry_rel_est_desp_.Close;
    qry_rel_est_desp_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
    qry_rel_est_desp_.Prepare;
    qry_rel_est_desp_.Open;

    Saida := 'Unidade: ' + qry_rel_est_desp_.FieldByName('NM_UNID_NEG').AsString + #13#10 +
             'Produto: ' + qry_rel_est_desp_.FieldByName('NM_PRODUTO').AsString + #13#10;
    if Trim( msk_cd_grupo.Text ) <> '' then
    begin
      Saida := Saida + 'Grupo: ' + Trim( edt_nm_grupo.Text ) + #13#10#13#10;
    end;
    if Trim( msk_cd_cliente.Text ) <> '' then
    begin
      Saida := Saida + 'Cliente: ' + Trim( edt_nm_cliente.Text ) + #13#10#13#10;
    end;
    Write( Txt, Saida );
    Saida := 'Processo;Qtde;Volume;Peso Líquido;Peso Bruto;Material;Arm. Atracação;Porto;Origem;Mod. Frete Internacional;Cobrança;Valor FOB Moeda;Valor Frete Moeda;Valor Seguro Moeda;Valor FOB R$;Valor CIF R$;I.I.;IPI;ICMS;Tx. Siscomex;Frete R$;';
    Write( Txt, Saida );

    qry_itens_rel_est_desp_.Close;
    qry_itens_rel_est_desp_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
    qry_itens_rel_est_desp_.Prepare;
    qry_itens_rel_est_desp_.Open;
    qry_itens_rel_est_desp_.First;
    while Not qry_itens_rel_est_desp_.EOF do
    begin
      Saida := Trim( qry_itens_rel_est_desp_.FieldByName('NM_ITEM').AsString ) + ';';
      Write( Txt, Saida );
      qry_itens_rel_est_desp_.Next;
    end;
    qry_itens_rel_est_desp_.Close;
    Saida := 'Total Despesas;Custos Logísticos;Custos Logísticos + Impostos;Valor CIF + Impostos;% Custos Logísticos X FOB;% Custos Logísticos + Impostos X FOB;% Despesas X CIF + Impostos;Custos Logísticos / Peso Líquido;FIM' + #13#10;
    Write( Txt, Saida );

    rel_cd_unid_neg := qry_rel_est_desp_.FieldByName('CD_UNID_NEG').AsString;
    rel_cd_produto  := qry_rel_est_desp_.FieldByName('CD_PRODUTO').AsString;
    rel_nr_processo := '';
    qry_rel_est_desp_.First;
    while Not qry_rel_est_desp_.EOF do
    begin
      {Unid. Negócio}
      if rel_cd_unid_neg <> qry_rel_est_desp_.FieldByName('CD_UNID_NEG').AsString then
      begin
        Saida := 'Unidade: ' + Trim( qry_rel_est_desp_.FieldByName('NM_UNID_NEG').AsString ) + #13#10;
        Write( Txt, Saida );
      end;
      {Produto}
      if rel_cd_produto <> qry_rel_est_desp_.FieldByName('CD_PRODUTO').AsString then
      begin
        Saida := 'Produto: ' + Trim( qry_rel_est_desp_.FieldByName('NM_PRODUTO').AsString ) + #13#10;
        Write( Txt, Saida );
      end;
      {Processo}
      Saida := Trim( qry_rel_est_desp_.FieldByName('NR_PROCESSO').AsString ) + ';';
      Write( Txt, Saida );
      {Qtde}
      Saida := Trim( IntToStr( qry_rel_est_desp_.FieldByName('VL_QTDE').AsInteger ) ) + ';';
      Write( Txt, Saida );
      {Volume}
      Saida := Trim( qry_rel_est_desp_.FieldByName('NM_ESPECIE').AsString ) + ';';
      Write( Txt, Saida );

      // Imprime detalhes do processo na 1º carga solta
      if rel_nr_processo <> qry_rel_est_desp_.FieldByName('NR_PROCESSO').AsString then
      begin
        {Peso Líquido}
        Saida := FormatFloat( '#0,.00', qry_rel_est_desp_.FieldByName('VL_PESO_LIQUIDO').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Peso Bruto}
        Saida := FormatFloat( '#0,.00', qry_rel_est_desp_.FieldByName('VL_PESO_BRUTO').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Material}
        Saida := Trim( qry_rel_est_desp_.FieldByName('AP_MERCADORIA').AsString ) + ';';
        Write( Txt, Saida );
        {Armazém de Atracação}
        Saida := Trim( qry_rel_est_desp_.FieldByName('NM_ARMAZEM_ATRACACAO').AsString ) + ';';
        Write( Txt, Saida );
        {Porto}
        Saida := Trim( qry_rel_est_desp_.FieldByName('NM_LOCAL_EMBARQUE').AsString ) + ';';
        Write( Txt, Saida );
        {Origem}
        Saida := Trim( qry_rel_est_desp_.FieldByName('NM_PAIS_ORIGEM').AsString ) + ';';
        Write( Txt, Saida );
        {Mod. Frete Internacional}
        Saida := Trim( qry_rel_est_desp_.FieldByName('NM_VIA_TRANSP').AsString ) + ';';
        Write( Txt, Saida );
        {Cobrança}
        Saida := Trim( qry_rel_est_desp_.FieldByName('NM_CAMBIO').AsString ) + ';';
        Write( Txt, Saida );
        {Valor FOB Moeda}
        Saida := FormatFloat( '#0,.00', qry_rel_est_desp_.FieldByName('VL_MLE_MNEG').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Valor Frete Moeda}
        Saida := FormatFloat( '#0,.00', qry_rel_est_desp_.FieldByName('VL_FRETE_MNEG').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Valor Seguro Moeda}
        Saida := FormatFloat( '#0,.00', qry_rel_est_desp_.FieldByName('VL_SEGURO_MNEG').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Valor FOB R$}
        Saida := FormatFloat( '#0,.00', qry_rel_est_desp_.FieldByName('VL_MLE_MN').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Valor CIF R$}
        Saida := FormatFloat( '#0,.00', qry_rel_est_desp_.FieldByName('VL_CIF_MN').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );

        {Despesas}
        {Impostos}
        for i := Low( Itens ) to High( Itens ) do
        begin
          qry_rel_est_desp_item_.Close;
          qry_rel_est_desp_item_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
          qry_rel_est_desp_item_.ParamByName('NR_PROCESSO').AsString       := qry_rel_est_desp_.FieldByName('NR_PROCESSO').AsString;
          qry_rel_est_desp_item_.ParamByName('CD_ITEM').AsString           := Itens[i];
          qry_rel_est_desp_item_.Prepare;
          qry_rel_est_desp_item_.Open;
          if qry_rel_est_desp_item_.RecordCount > 0 then
          begin
            Saida := FormatFloat( '#0,.00', qry_rel_est_desp_item_.FieldByName('VL_ITEM').AsFloat );
            Saida := Saida + ';';
          end
          else
          begin
            Saida := ';';
          end;
          Write( Txt, Saida );
        end;
        {Frete R$}
        Saida := FormatFloat( '#0,.00', qry_rel_est_desp_.FieldByName('VL_FRETE_MN').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Outras Despesas}
        qry_itens_rel_est_desp_.Close;
        qry_itens_rel_est_desp_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_itens_rel_est_desp_.Prepare;
        qry_itens_rel_est_desp_.Open;
        qry_itens_rel_est_desp_.First;
        while Not qry_itens_rel_est_desp_.EOF do
        begin
          qry_rel_est_desp_item_.Close;
          qry_rel_est_desp_item_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
          qry_rel_est_desp_item_.ParamByName('NR_PROCESSO').AsString       := qry_rel_est_desp_.FieldByName('NR_PROCESSO').AsString;
          qry_rel_est_desp_item_.ParamByName('CD_ITEM').AsString           := qry_itens_rel_est_desp_.FieldByName('CD_ITEM').AsString;
          qry_rel_est_desp_item_.Prepare;
          qry_rel_est_desp_item_.Open;
          if qry_rel_est_desp_item_.RecordCount > 0 then
          begin
            Saida := FormatFloat( '#0,.00', qry_rel_est_desp_item_.FieldByName('VL_ITEM').AsFloat );
            Saida := Saida + ';';
          end
          else
          begin
            Saida := ';';
          end;
          Write( Txt, Saida );

          qry_itens_rel_est_desp_.Next;
        end;
        qry_itens_rel_est_desp_.Close;

        {Total das Despesas}
        Saida := FormatFloat( '#0,.00', qry_rel_est_desp_.FieldByName('VL_DESP').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Despesas + Frete}{Custos Logísticos}
        Saida := FormatFloat( '#0,.00', qry_rel_est_desp_.FieldByName('VL_DESP_FRETE').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Despesas + Frete + Impostos}{Custos Logísticos + Impostos}
        Saida := FormatFloat( '#0,.00', qry_rel_est_desp_.FieldByName('VL_DESP_FRETE_IMP').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Valor CIF + Impostos}
        Saida := FormatFloat( '#0,.00', qry_rel_est_desp_.FieldByName('VL_CIF_IMP').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {% Despesas + Frete X FOB}{Custos Logísticos X FOB}
        Saida := FormatFloat( '#0,.00', qry_rel_est_desp_.FieldByName('VL_PERC_DESP_CIF').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {% Despesas + Frete + Impostos X FOB}{Custos Logísticos + Impostos X FOB}
        Saida := FormatFloat( '#0,.00', qry_rel_est_desp_.FieldByName('VL_PERC_DESP_FRETE_IMP_FOB').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {% Despesas X CIF + Impostos}
        Saida := FormatFloat( '#0,.00', qry_rel_est_desp_.FieldByName('VL_PERC_DESP_CIF_IMP').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
        {Despesa + Frete / Peso Líquido}{Custos Logísticos / Peso Líquido}
        Saida := FormatFloat( '#0,.00000', qry_rel_est_desp_.FieldByName('VL_DESP_FRETE_PESO_LIQ').AsFloat );
        Saida := Saida + ';';
        Write( Txt, Saida );
      end;
      Saida := #13#10;
      Write( Txt, Saida );

      rel_cd_unid_neg := qry_rel_est_desp_.FieldByName('CD_UNID_NEG').AsString;
      rel_cd_produto  := qry_rel_est_desp_.FieldByName('CD_PRODUTO').AsString;
      rel_nr_processo := qry_rel_est_desp_.FieldByName('NR_PROCESSO').AsString;

      qry_rel_est_desp_.Next;
    end;
    qry_rel_est_desp_.Close;

    CloseFile( Txt );

    {Fim da Geração do Arquivo}
    ShellExecute( Application.Handle, 'Open', 'EXCEL.EXE', PChar( cDir_Rpt + '\REL_EST_DESP.XLS' ), '', SW_MAXIMIZE );
  end;
end;

procedure Tfrm_sel_unid_prod.chk_excelClick(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure Tfrm_sel_unid_prod.ImprimeExcel;
var
  VCLIENTE : String;

begin
  str_cr := #13#10;

  NomeTxt := cDir_Rpt + '\ESTDEM.TXT';
  FileMode := 1;

  AssignFile( ArquivoTXT, NomeTxt );
  ReWrite ( ArquivoTXT );

  with datm_sel_unid_prod do
  begin
    qry_excel_.Close;
    qry_excel_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
    qry_excel_.Prepare;
    qry_excel_.Open;

    Saida := ';;;RELATÓRIO ESTATÍSTICO DEMURRAGE' + str_cr + str_cr;
    Write ( ArquivoTXT, Saida );

    VCLIENTE := ' ';

    Saida := 'REFERÊNCIA;ÁREA;MERCADORIA;TRANSPORTADORA;CONTÊINER;DATA ENT FÁBRICA;DT ENT NF TRANSP;CARGA SOLTA' + str_cr;
    Write ( ArquivoTXT, Saida );

    while Not qry_excel_.EOF do
    begin
      if qry_excel_.FieldByName('NM_CLIENTE').AsString <> VCLIENTE then
      begin
        VCLIENTE := qry_excel_.FieldByName('NM_CLIENTE').AsString;
        Saida := ' ' + str_cr ;
        Write ( ArquivoTXT, Saida );
        Saida := 'CLIENTE: ' + qry_excel_.FieldByName('NM_CLIENTE').AsString + str_cr ;
        Write ( ArquivoTXT, Saida );
      end;

      Saida := qry_excel_.FieldByName('CD_REFERENCIA').AsString + ';';
      Saida := Saida + qry_excel_.FieldByName('NM_AREA').AsString + ';';
      Saida := Saida + Copy( qry_excel_.FieldByName('TX_MERCADORIA').AsString, 1, 5 ) + ';';
      Saida := Saida + qry_excel_.FieldByName('NM_TRANSP_NAC').AsString + ';';
      Saida := Saida + qry_excel_.FieldByName('CalcCNTR').AsString + ';';
      Saida := Saida + FormatDateTime( 'dd/mm/yyyy', qry_excel_.FieldByName('DT_ENTREGA_FABRICA').AsDateTime ) + ';';
      Saida := Saida + FormatDateTime( 'dd/mm/yyyy', qry_excel_.FieldByName('DT_ENVIO_NF_TRANSP').AsDateTime ) + ';';
      Saida := Saida + FormatFloat( '#0,.00', qry_excel_.FieldByName('VL_QTDE').AsFloat ) + ';';
      Saida := Saida + qry_excel_.FieldByName('NM_ESPECIE').AsString  + str_cr;
      Write ( ArquivoTXT, Saida );
      qry_excel_.Next;
    end;
    qry_excel_.Close;
  end;

  CloseFile( ArquivoTXT );

  Screen.Cursor := crDefault;

  ShellExecute( Application.Handle, 'Open', 'EXCEL.EXE', PChar( cDir_Rpt + '\EstDem.XLS' ), '', SW_MAXIMIZE );
end;



procedure Tfrm_sel_unid_prod.btn_co_fornecedorClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  with frm_emp_est do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_emp_est.Cons_OnLine_Texto := msk_cd_fornecedor.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_fornecedor.Text := frm_emp_est.Cons_OnLine_Texto;
  end;
  msk_cd_fornecedorExit(nil);
  msk_cd_fornecedor.SetFocus;
end;

procedure Tfrm_sel_unid_prod.msk_cd_fornecedorExit(Sender: TObject);
begin
  edt_nm_fornecedor.Clear;
  if msk_cd_fornecedor.text = '' then
  begin
    if Not tp_rel in [28, 31] then edt_nm_fornecedor.Text := ''
    else edt_nm_fornecedor.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_fornecedor );
  with datm_sel_unid_prod.qry_empresa_est_ do
  begin
    close;
    ParamByName('CD_EMPRESA').AsString := msk_cd_fornecedor.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Fornecedor não encontrado!', 2 );
      msk_cd_fornecedor.Clear;
      edt_nm_fornecedor.Clear;
    end
    else
    begin
      if tp_rel in [28, 31] then
         edt_nm_fornecedor.Text:= FieldByName('NM_EMPRESA').AsString;
    end;
    Close;
  end;
end;


procedure Tfrm_sel_unid_prod.msk_cd_areaExit(Sender: TObject);
begin
  if msk_cd_area.text = '' then
  begin
    if tp_rel in [6, 7, 29, 33] then edt_nm_area.Text := 'Todos'
    else edt_nm_area.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_area );
  if msk_cd_area.Text <> '' then
    edt_nm_area.Text := FastEdit( 'TAREA', msk_cd_area, 'CD_AREA', 'NM_AREA' );
  if Trim( edt_nm_area.Text ) = '' then
  begin
    BoxMensagem('Área não cadastrada!', 2);
    msk_cd_area.SetFocus;
  end;
end;

procedure Tfrm_sel_unid_prod.btn_co_areaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_area, frm_area);
  with frm_area do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_area.Cons_OnLine_Texto := msk_cd_area.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_area.Text := frm_area.Cons_OnLine_Texto;
  end;
  msk_cd_areaExit(nil);
  msk_cd_area.SetFocus;
end;


procedure Tfrm_sel_unid_prod.msk_sg_grupo_areaExit(Sender: TObject);
begin
if msk_sg_grupo_area.Text <> '' then
  begin
    with datm_sel_unid_prod.qry_grupo_area_ do
      begin
      Close;
      sql.Clear;
      sql.Add('select nm_grupo from tarea where (nm_grupo = '+ QuotedStr(msk_sg_grupo_area.text) +')');
      Prepare;
      Open;
      if Eof then
      begin
        BoxMensagem( 'Grupo não encontrado!', 2 );
        msk_sg_grupo_area.Clear;
        msk_sg_grupo_area.SetFocus;
      end;
      Close;
    end;
  end;
end;

procedure Tfrm_sel_unid_prod.faturamento_consolidado(Sender: TObject);
var vCount, vTotal, vTotal_pagto, vTotal_lanc, vSoma_total_lanc : Real;
    nr_rel, vSoma_Arm, vSoma_hon, vSoma_frete, vSoma_rod, vSoma_banc, vSoma_cofins, vSoma_irrf, vSoma_total, vSoma_adiant, vSoma_pagto : Real;
    Excel, xlWorkB, oSheet : OleVariant;
begin // Faturamento Consolidado
  vTotal        := 0;
  vTotal_lanc   := 0;
  vTotal_pagto  := 0;
  vSoma_pagto   := 0;
  vSoma_total_lanc := 0;
  nr_rel := StrToFloat(ConsultaLookUPSQL('SELECT NR_REL_FAT_CONSOLIDADO FROM TGRUPO WHERE CD_GRUPO = ''' + msk_cd_grupo.Text + ''' ', 'NR_REL_FAT_CONSOLIDADO')) + 1;

  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Add('SELECT P.NR_PROCESSO AS PROCESSO, FP.NR_SOLICITACAO AS SOLICITACAO,');
    SQL.Add('  E.NR_FATURA AS CDE,');

    SQL.Add('  (SELECT SUM((CONVERT( DECIMAL(16,2), CASE IN_RESTITUI WHEN ''1'' THEN F_ARM.VL_ITEM * -1 ELSE F_ARM.VL_ITEM END)))');
    SQL.Add('       FROM TFATURAMENTO_CC F_ARM, TITEM IA');
    SQL.Add('       WHERE IA.CD_ITEM = F_ARM.CD_ITEM AND IA.TP_ITEM_SGA = ''1'' AND F_ARM.NR_SOLIC_FAT = FP.NR_SOLICITACAO AND F_ARM.NR_PROCESSO = P.NR_PROCESSO AND F_ARM.IN_CANCELADO = ''0'') AS ARMAZENAGEM,');

    SQL.Add('  (SELECT SUM((CONVERT( DECIMAL(16,2), CASE IN_RESTITUI WHEN ''1'' THEN F_HONOR.VL_ITEM * -1 ELSE F_HONOR.VL_ITEM END)))');
    SQL.Add('       FROM TFATURAMENTO_CC F_HONOR, TITEM IA');
    SQL.Add('       WHERE IA.CD_ITEM = F_HONOR.CD_ITEM AND IA.TP_ITEM_SGA = ''2'' AND F_HONOR.NR_SOLIC_FAT = FP.NR_SOLICITACAO AND F_HONOR.NR_PROCESSO = P.NR_PROCESSO AND F_HONOR.IN_CANCELADO = ''0'') AS HONORARIOS,');

    SQL.Add('  (SELECT SUM((CONVERT( DECIMAL(16,2), CASE IN_RESTITUI WHEN ''1'' THEN F_REEMB.VL_ITEM * -1 ELSE F_REEMB.VL_ITEM END)))');
    SQL.Add('       FROM TFATURAMENTO_CC F_REEMB, TITEM IA');
    SQL.Add('       WHERE IA.CD_ITEM = F_REEMB.CD_ITEM AND IA.TP_ITEM_SGA = ''3'' AND F_REEMB.NR_SOLIC_FAT = FP.NR_SOLICITACAO AND F_REEMB.NR_PROCESSO = P.NR_PROCESSO AND F_REEMB.IN_CANCELADO = ''0'') AS FRETE_REEMB,');

    SQL.Add('  (SELECT SUM((CONVERT( DECIMAL(16,2), CASE IN_RESTITUI WHEN ''1'' THEN F_RODOV.VL_ITEM * -1 ELSE F_RODOV.VL_ITEM END)))');
    SQL.Add('       FROM TFATURAMENTO_CC F_RODOV, TITEM IA');
    SQL.Add('       WHERE IA.CD_ITEM = F_RODOV.CD_ITEM AND IA.TP_ITEM_SGA = ''4'' AND F_RODOV.NR_SOLIC_FAT = FP.NR_SOLICITACAO AND F_RODOV.NR_PROCESSO = P.NR_PROCESSO AND F_RODOV.IN_CANCELADO = ''0'') AS FRETE_RODOV,');

    SQL.Add('  (SELECT SUM(( CONVERT( DECIMAL(16,2), CASE F_BANC.IN_RESTITUI WHEN ''1'' THEN F_BANC.VL_ITEM * -1 ELSE F_BANC.VL_ITEM END)))');
    SQL.Add('       FROM TFATURAMENTO_CC F_BANC, TITEM IA');
    SQL.Add('       WHERE IA.CD_ITEM = F_BANC.CD_ITEM AND IA.TP_ITEM_SGA = ''5'' AND F_BANC.NR_SOLIC_FAT = FP.NR_SOLICITACAO AND F_BANC.NR_PROCESSO = P.NR_PROCESSO) AS DESP_BANC,');

    SQL.Add('  (SELECT SUM((CONVERT (DECIMAL(16,2), CASE F_COF.IN_RESTITUI WHEN ''1'' THEN F_COF.VL_ITEM * -1 ELSE F_COF.VL_ITEM END)))');
    SQL.Add('       FROM TFATURAMENTO_CC F_COF');
    SQL.Add('       WHERE F_COF.CD_ITEM = ''578'' AND F_COF.NR_SOLIC_FAT = FP.NR_SOLICITACAO AND F_COF.NR_PROCESSO = P.NR_PROCESSO AND F_COF.NR_SOLIC_FAT = FP.NR_SOLICITACAO) AS PIS_COFINS,');

    SQL.Add('   (SELECT SUM((CONVERT (DECIMAL(16,2), CASE F_IRRF.IN_RESTITUI WHEN ''1'' THEN F_IRRF.VL_ITEM * -1 ELSE F_IRRF.VL_ITEM END)))');
    SQL.Add('   	  FROM TFATURAMENTO_CC F_IRRF');
    SQL.Add('   	  WHERE F_IRRF.CD_ITEM = ''994'' AND F_IRRF.NR_SOLIC_FAT = FP.NR_SOLICITACAO AND F_IRRF.NR_PROCESSO = P.NR_PROCESSO) AS IRRF,');

    SQL.Add('   (SELECT SUM((CONVERT (DECIMAL(16,2), CASE F_AD.IN_RESTITUI WHEN ''1'' THEN F_AD.VL_ITEM * -1 ELSE F_AD.VL_ITEM END)))');
    SQL.Add('       FROM TFATURAMENTO_CC F_AD');
    SQL.Add('   	  WHERE F_AD.CD_ITEM = ''991'' AND F_AD.NR_SOLIC_FAT = FP.NR_SOLICITACAO AND F_AD.NR_PROCESSO = P.NR_PROCESSO) AS ADIANTAMENTO,');

    SQL.Add('   (SELECT SUM((CONVERT (DECIMAL(16,2),');
    SQL.Add('   	    CASE F_TOT_PAGTO.IN_RESTITUI');
    SQL.Add('   	      WHEN ''1'' THEN (CASE F_TOT_PAGTO.CD_ITEM WHEN ''996'' THEN F_TOT_PAGTO.VL_ITEM * -1');
    SQL.Add('   	  	    						   WHEN ''995'' THEN F_TOT_PAGTO.VL_ITEM END) * -1');
    SQL.Add('   	    ELSE (CASE F_TOT_PAGTO.CD_ITEM WHEN ''996'' THEN F_TOT_PAGTO.VL_ITEM * -1');
    SQL.Add('   	  		    	WHEN ''995'' THEN F_TOT_PAGTO.VL_ITEM END)END)))');
    SQL.Add('       FROM TFATURAMENTO_CC F_TOT_PAGTO');
    SQL.Add('       WHERE F_TOT_PAGTO.CD_ITEM in (''996'', ''995'') AND F_TOT_PAGTO.NR_SOLIC_FAT = FP.NR_SOLICITACAO AND F_TOT_PAGTO.NR_PROCESSO = P.NR_PROCESSO) AS TOTAL_PAGTO');

    SQL.Add(' FROM TPROCESSO P');
    SQL.Add(' INNER JOIN TPROCESSO_EXP E ON E.NR_PROCESSO = P.NR_PROCESSO');
    SQL.Add(' INNER JOIN TS_FATURA_PROCESSO FP ON FP.NR_PROCESSO = P.NR_PROCESSO');
    SQL.Add(' INNER JOIN TS_FATURA FAT ON FAT.NR_SOLICITACAO = FP.NR_SOLICITACAO AND FAT.CD_UNID_NEG = P.CD_UNID_NEG AND FAT.CD_PRODUTO = P.CD_PRODUTO');
    SQL.Add(' WHERE P.CD_GRUPO =:CD_GRUPO');
    SQL.Add('  AND P.CD_UNID_NEG =:CD_UNID_NEG');
    SQL.Add('  AND P.CD_PRODUTO =:CD_PRODUTO');
    SQL.Add('  AND FAT.DT_FATURA BETWEEN :DT_INI AND :DT_FIM');
    SQL.Add('  AND FAT.IN_CALCULADO = ''1'' ');
    SQL.Add('  AND FAT.IN_CANCELADO = ''0'' ');
    SQL.Add(' GROUP BY P.NR_PROCESSO, E.NR_FATURA, FP.NR_SOLICITACAO');
    ParamByName('CD_GRUPO').AsString    := msk_cd_grupo.Text;
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    ParamByName('DT_INI').AsDateTime := msk_dt_inicio.DateTime;
    ParamByName('DT_FIM').AsDateTime := msk_dt_fim.DateTime;
    Open;
    First;
    if not isempty then
    begin
      Excel := CreateOleObject('Excel.Application');
      xlWorkB := Excel.Workbooks.Open( cDir_Rpt + '\REL_FAT_CONSOLIDADO.xls' );
      Excel.ActiveWorkBook.SaveAs( cDir_Rpt + '\REL_FAT_CONSOLIDADO_' + Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.xls' );
      osheet := Excel.WorkBooks[1].Worksheets[1];
      vCount := 2;
      while not EOF do
      begin
        oSheet.Cells[8,  vCount].Value := FieldByName('PROCESSO').AsString;
        oSheet.Cells[9,  vCount].Value := FieldByName('CDE').AsString;
        oSheet.Cells[10, vCount].Value := FieldByName('ARMAZENAGEM').AsFloat;
        oSheet.Cells[11, vCount].Value := FieldByName('HONORARIOS').AsFloat;
        oSheet.Cells[12, vCount].Value := FieldByName('FRETE_REEMB').AsFloat;
        oSheet.Cells[13, vCount].Value := FieldByName('FRETE_RODOV').AsFloat;
        oSheet.Cells[14, vCount].Value := FieldByName('DESP_BANC').AsFloat;
        oSheet.Cells[16, vCount].Value := FieldByName('PIS_COFINS').AsFloat;
        oSheet.Cells[17, vCount].Value := FieldByName('IRRF').AsFloat;
        oSheet.Cells[19, vCount].Value := FieldByName('ADIANTAMENTO').AsFloat;

      //calcula e insere totais
        vTotal        := FieldByName('ARMAZENAGEM').AsFloat + FieldByName('HONORARIOS').AsFloat + FieldByName('FRETE_REEMB').AsFloat +
                         FieldByName('FRETE_RODOV').AsFloat + FieldByName('DESP_BANC').AsFloat;
        vTotal_lanc   := vTotal - (FieldByName('PIS_COFINS').AsFloat + FieldByName('IRRF').AsFloat);
        vTotal_pagto  := vTotal_lanc - FieldByName('ADIANTAMENTO').AsFloat;

        oSheet.Cells[15, vCount].Value := vTotal;
        oSheet.Cells[18, vCount].Value := vTotal_lanc;
        oSheet.Cells[20, vCount].Value := vTotal_pagto;

      // calcula soma dos totais

        vCount := vCount + 1;
        vSoma_arm    := vSoma_Arm    + FieldByName('ARMAZENAGEM').AsFloat;
        vSoma_hon    := vSoma_hon    + FieldByName('HONORARIOS').AsFloat;
        vSoma_frete  := vSoma_frete  + FieldByName('FRETE_REEMB').AsFloat;
        vSoma_rod    := vSoma_rod    + FieldByName('FRETE_RODOV').AsFloat;
        vSoma_banc   := vSoma_banc   + FieldByName('DESP_BANC').AsFloat;
        vSoma_cofins := vSoma_cofins + FieldByName('PIS_COFINS').AsFloat;
        vSoma_irrf   := vSoma_irrf   + FieldByName('IRRF').AsFloat;
        vSoma_total  := vSoma_total  + vTotal;
        vSoma_total_lanc  := vSoma_total_lanc  + vTotal_lanc;
        vSoma_adiant := vSoma_adiant + FieldByName('ADIANTAMENTO').AsFloat;
        vSoma_pagto  := vSoma_pagto  + vTotal_pagto;

        Next;
      end;
      oSheet.Cells[8, vCount].Value := 'TOTAL';
      oSheet.Cells[8, vCount].Interior.ColorIndex := 11; // pinta de azul
      oSheet.Cells[8, vCount].Font.Bold := True;
      oSheet.Cells[8, vCount].Font.ColorIndex := 2;

      oSheet.Cells[9,  vCount].Value := '-----';
      oSheet.Cells[10, vCount].Value := vSoma_arm;
      oSheet.Cells[11, vCount].Value := vSoma_hon;
      oSheet.Cells[12, vCount].Value := vSoma_frete;
      oSheet.Cells[13, vCount].Value := vSoma_rod;
      oSheet.Cells[14, vCount].Value := vSoma_banc;
      oSheet.Cells[15, vCount].Value := vSoma_total;
      oSheet.Cells[16, vCount].Value := vSoma_cofins;
      oSheet.Cells[17, vCount].Value := vSoma_irrf;
      oSheet.Cells[18, vCount].Value := vSoma_total_lanc;
      oSheet.Cells[19, vCount].Value := vSoma_adiant;
      oSheet.Cells[20, vCount].Value := vSoma_pagto;

      //Preenche cabeçalho
      oSheet.Cells[3,  3].Value := edt_nm_unid_neg.Text;
      oSheet.Cells[4,  3].Value := edt_nm_produto.Text;
      oSheet.Cells[5,  3].Value := edt_nm_grupo.Text;
      oSheet.Cells[6,  3].Value := FormatDateTime('dd/mm/yyyy', msk_dt_inicio.Date) + ' a ' + FormatDateTime('dd/mm/yyyy', msk_dt_fim.DateTime);
      oSheet.Cells[7,  3].Value := nr_rel;

      // Atualiza numeração do relatório no cadastro do grupo
      FastExecSQL(' UPDATE TGRUPO SET NR_REL_FAT_CONSOLIDADO = ''' + FloatToStr(nr_rel) + ''' WHERE CD_GRUPO = ''' + msk_cd_grupo.Text + ''' ');

      while vCount > 1 do
      begin
        oSheet.Cells[vCount,  vCount].ColumnWidth := 12;
        vCount := vCount - 1;
      end;

    Excel.Visible := True;
    end
    else
      Showmessage('Relatório não possui registros');
      Free;
    end;
    exit;
end;
procedure Tfrm_sel_unid_prod.GeraValoresPendentes;
var Excel, xlWorkB, oSheet : OleVariant;
    vLinha :Integer;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Add('  SELECT TVT.NM_VIA_TRANSPORTE,E.NM_EMPRESA, FAV.NM_FAVORECIDO, FT.NR_PROCESSO, CONVERT(VARCHAR, FT.DT_LANCAMENTO, 103) DT_LANCAMENTO,');
    SQL.Add('    FT.CD_ITEM, I.NM_ITEM, FT.NR_SOLIC_FAT ,');
    SQL.Add('    SUM(CASE IN_RESTITUI WHEN 1 THEN FT.VL_ITEM * -1 ELSE FT.VL_ITEM END) VL_ITEM,');
    SQL.Add('    (SELECT COUNT(*) FROM TS_FATURA_PROCESSO FP WHERE FP.NR_PROCESSO = FT.NR_PROCESSO) FATURA_PROCESSO,');
    SQL.Add('    CASE ISNULL(F.TP_TIPO_FAT, ''0'') WHEN ''F'' THEN ''Fatura não Impressa'' WHEN ''N'' THEN ''Nota de Débito não Impressa'' WHEN ''0'' THEN ''Despesa não Solicitada'' END TIPO,');
    SQL.Add('    (SELECT CONVERT(VARCHAR, DT_PREVISTA, 103) FROM TFOLLOWUP WHERE CD_EVENTO = ''088'' AND NR_PROCESSO = FT.NR_PROCESSO) as DESEMB_PRE,');
    SQL.Add('    (SELECT CONVERT(VARCHAR, DT_REALIZACAO, 103) FROM TFOLLOWUP WHERE CD_EVENTO = ''088'' AND NR_PROCESSO = FT.NR_PROCESSO) as DESEMB_RE,');
    SQL.Add('    (SELECT CONVERT(VARCHAR, DT_PREVISTA, 103) FROM TFOLLOWUP WHERE CD_EVENTO = ''132'' AND NR_PROCESSO = FT.NR_PROCESSO) as EMB_PRE,');
    SQL.Add('    (SELECT CONVERT(VARCHAR, DT_REALIZACAO, 103) FROM TFOLLOWUP WHERE CD_EVENTO = ''132'' AND NR_PROCESSO = FT.NR_PROCESSO) as EMB_RE,');
    SQL.Add('    (SELECT CONVERT(VARCHAR, DT_PREVISTA, 103) FROM TFOLLOWUP WHERE CD_EVENTO = ''114'' AND NR_PROCESSO = FT.NR_PROCESSO) as ENVIO_FAT_PRE,');
    SQL.Add('    (SELECT CONVERT(VARCHAR, DT_REALIZACAO, 103) FROM TFOLLOWUP WHERE CD_EVENTO = ''114'' AND NR_PROCESSO = FT.NR_PROCESSO) as ENVIO_FAT_RE');
    SQL.Add('  FROM TFATURAMENTO_CC FT');
    SQL.Add('  INNER JOIN TPROCESSO P ON P.NR_PROCESSO = FT.NR_PROCESSO');
    SQL.Add('  LEFT JOIN TSERVICO TS ON TS.CD_SERVICO = P.CD_SERVICO  ');
    SQL.Add('  LEFT JOIN TVIA_TRANSPORTE TVT ON TVT.CD_VIA_TRANSPORTE = TS.CD_VIA_TRANSPORTE');
    SQL.Add('  LEFT JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_CLIENTE');
    SQL.Add('  LEFT JOIN TFAVORECIDO FAV ON FT.CD_FAVORECIDO = FAV.CD_FAVORECIDO');
    SQL.Add('  LEFT JOIN TS_FATURA F ON FT.NR_SOLIC_FAT = F.NR_SOLICITACAO AND FT.CD_UNID_NEG = F.CD_UNID_NEG AND FT.CD_PRODUTO = F.CD_PRODUTO');
    SQL.Add('  INNER JOIN TITEM I ON I.CD_ITEM = FT.CD_ITEM');
    SQL.Add('  WHERE FT.CD_ITEM NOT IN (''998'',''997'',''995'',''996'',''988'')');
    SQL.Add('  AND ((P.CD_GRUPO =:CD_GRUPO) OR (:CD_GRUPO = ''''))');
    SQL.Add('  AND ((P.CD_UNID_NEG =:CD_UNID_NEG) OR (:CD_UNID_NEG = ''''))');
    SQL.Add('  AND ((P.CD_PRODUTO =:CD_PRODUTO) OR (:CD_PRODUTO = ''''))');
    SQL.Add('  AND ((TS.CD_VIA_TRANSPORTE =:CD_VIA_TRANSPORTE) OR (:CD_VIA_TRANSPORTE = ''''))');
    SQL.Add('  AND DT_LANCAMENTO BETWEEN :DT_INI AND :DT_FIM');
    SQL.Add('    AND FT.IN_CANCELADO = ''0''');
    SQL.Add('    AND P.IN_CANCELADO = ''0''');
    SQL.Add('    AND FT.CD_FORMA_PAGTO <> ''S''');
    SQL.Add('    AND ((ISNULL(FT.NR_SOLIC_FAT, '''') = '''') OR ((F.IN_LIQUIDADO = ''0'') AND F.IN_CANCELADO = ''0'' AND (ISNULL(F.NR_NOTA_FATURA, '''') = '''' ) AND (ISNULL(F.VL_FATURA, 0) <> 0)))');
    SQL.Add('  GROUP BY TVT.NM_VIA_TRANSPORTE,E.NM_EMPRESA, FAV.NM_FAVORECIDO, FT.NR_PROCESSO, FT.DT_LANCAMENTO, FT.CD_ITEM, I.NM_ITEM, F.TP_TIPO_FAT, FT.NR_SOLIC_FAT');
    SQL.Add('  HAVING SUM(CASE IN_RESTITUI WHEN 1 THEN FT.VL_ITEM * -1 ELSE FT.VL_ITEM END) <> 0');
    SQL.Add('  ORDER BY E.NM_EMPRESA, FAV.NM_FAVORECIDO, FT.NR_PROCESSO, DT_LANCAMENTO, FT.VL_ITEM');
    ParamByName('CD_GRUPO').AsString    := msk_cd_grupo.Text;
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    ParamByName('CD_VIA_TRANSPORTE').AsString := msk_cd_modal.Text;
    ParamByName('DT_INI').AsDateTime := msk_dt_inicio.DateTime;
    ParamByName('DT_FIM').AsDateTime := msk_dt_fim.DateTime;
    Open;
    First;
    if not IsEmpty then
    begin
      Excel := CreateOleObject('Excel.Application');
      xlWorkB := Excel.Workbooks.Open( cDir_Rpt + '\REL_VALORES_PENDENTES.xls' );
      Excel.ActiveWorkBook.SaveAs( cDir_Rpt + '\REL_VALORES_PENDENTES' + Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.xls' );
      osheet := Excel.WorkBooks[1].Worksheets[1];
      vLinha := 8;

      //CABEÇALHO
      oSheet.Cells[3, 3].Value := edt_nm_unid_neg.Text;
      oSheet.Cells[4, 3].Value := edt_nm_produto.Text;
      oSheet.Cells[5, 3].Value := edt_nm_grupo.Text;
      oSheet.Cells[6, 2].Value := 'Período : ' + FormatDateTime('DD/MM/YYYY', msk_dt_inicio.Date) + ' a ' + FormatDateTime('DD/MM/YYYY', msk_dt_fim.Date);

      while not EOF do
      begin
        oSheet.Cells[vLinha, 1].Value := FieldByName('NM_EMPRESA').AsString;;
        oSheet.Cells[vLinha, 2].Value := FieldByName('NM_FAVORECIDO').AsString;
        oSheet.Cells[vLinha, 3].Value := FieldByName('NR_PROCESSO').AsString;
        oSheet.Cells[vLinha, 4].Value := FieldByName('CD_ITEM').AsString + ' - ' + FieldByName('NM_ITEM').AsString;
        oSheet.Cells[vLinha, 5].Value := FieldByName('VL_ITEM').AsFloat;
        oSheet.Cells[vLinha, 6].Value := FieldByName('DT_LANCAMENTO').AsString;
        if FieldByName('FATURA_PROCESSO').AsInteger > 0 then
          oSheet.Cells[vLinha, 7].Value := 'Despesa Pós Faturamento'
        else
          oSheet.Cells[vLinha, 7].Value := FieldByName('TIPO').AsString;
        oSheet.Cells[vLinha, 8].Value := FieldByName('DESEMB_PRE').AsString;
        oSheet.Cells[vLinha, 9].Value := FieldByName('DESEMB_RE').AsString;
        oSheet.Cells[vLinha, 10].Value := FieldByName('EMB_PRE').AsString;
        oSheet.Cells[vLinha, 11].Value := FieldByName('EMB_RE').AsString;
        oSheet.Cells[vLinha, 12].Value := FieldByName('ENVIO_FAT_PRE').AsString;
        oSheet.Cells[vLinha, 13].Value := FieldByName('ENVIO_FAT_RE').AsString;
        oSheet.Cells[vLinha, 14].Value := FieldByName('NM_VIA_TRANSPORTE').AsString;
        vLinha := vLinha + 1;
        Next;
      end;
    Excel.Visible := True;
    end
    else
      Showmessage('Relatório não possui registros');
    Free;
  end;
end;

procedure Tfrm_sel_unid_prod.btn4Click(Sender: TObject);
var i : Integer;
begin
  if ((lb1.items.Count > 0) and (lb1.ItemIndex = -1)) then
  begin
    for i := 0 to lb1.items.Count - 1 do
    begin
      lb2.Items.Add(lb1.items[0]);
      lb1.Items.Delete(0);
    end;
  end
  else if lb1.ItemIndex > -1 then
  begin
    lb2.Items.Add(lb1.items[lb1.ItemIndex]);
    lb1.Items.Delete(lb1.ItemIndex);
  end;
end;

procedure Tfrm_sel_unid_prod.btn5Click(Sender: TObject);
var i : Integer;
begin
  if ((lb2.items.Count > 0) and (lb2.ItemIndex = -1)) then
  begin
    for i := 0 to lb2.items.Count - 1 do
    begin
      lb1.Items.Add(lb2.items[0]);
      lb2.Items.Delete(0);
    end;
  end
  else if lb2.ItemIndex > -1 then
  begin
    lb1.Items.Add(lb2.items[lb2.ItemIndex]);
    lb2.Items.Delete(lb2.ItemIndex);
  end;
end;

procedure Tfrm_sel_unid_prod.lb1DblClick(Sender: TObject);
begin
  frm_sel_unid_prod.btn4.Click;
end;

procedure Tfrm_sel_unid_prod.lb2DblClick(Sender: TObject);
begin
  frm_sel_unid_prod.btn5.Click;
end;

procedure Tfrm_sel_unid_prod.btn_co_modalClick(Sender: TObject);
begin
 msk_cd_modal.text:= ConsultaOnLineEx('TVIA_TRANSPORTE', 'Modal', ['CD_VIA_TRANSPORTE', 'NM_VIA_TRANSPORTE'], ['Código','Descrição'],'CD_VIA_TRANSPORTE',nil, 1, msk_cd_modal.text);
end;

procedure Tfrm_sel_unid_prod.msk_cd_modalChange(Sender: TObject);
begin
  edt_nm_modal.Text:=ConsultaLookUP('TVIA_TRANSPORTE','CD_VIA_TRANSPORTE',msk_cd_modal.text,'NM_VIA_TRANSPORTE');
end;

end.

unit PGPG021;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, UCRPE32, ComCtrls, ToolEdit, Funcoes, ConsOnLineEx,
  ADODB;

type
  Tfrm_sel_unid_cli_grupo_item = class(TForm)
    Panel1: TPanel;
    crp_unid_prod: TCrpe;
    pnlUnidade: TPanel;
    lbl_unid_neg: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    pnlProduto: TPanel;
    lbl1: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    pnlOutros: TPanel;
    lbl_grupo_item: TLabel;
    btn_co_grupo_item: TSpeedButton;
    lbl_periodo: TLabel;
    lbl_a: TLabel;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    lbl_analista_comissaria: TLabel;
    btn_co_analista_comissaria: TSpeedButton;
    btn_imprimir: TButton;
    btn_sair: TButton;
    msk_cd_grupo_item: TMaskEdit;
    edt_nm_grupo_item: TEdit;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    msk_cd_analista_comissaria: TMaskEdit;
    edt_nm_analista_comissaria: TEdit;
    msk_dt_inicio: TDateEdit;
    msk_dt_fim: TDateEdit;
    chk_pendentes: TCheckBox;
    chk_refcli: TCheckBox;
    chk_desemb: TCheckBox;
    chk_despesas: TCheckBox;
    btn_itens_erro: TButton;
    chk_resumido: TCheckBox;
    chkFaturados: TCheckBox;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_grupo_itemExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_grupo_itemClick(Sender: TObject);
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
    procedure msk_cd_analista_comissariaExit(Sender: TObject);
    procedure btn_co_analista_comissariaClick(Sender: TObject);
    procedure btn_itens_erroClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
  private
  public
    tp_rel : Byte;
    ComPeriodo : Boolean;
    //procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer ); 
    // 1 - Pagamentos Pendentes 
    // 2 - Razão 
    // 3 - Resumo do Faturamento
    // 5 - Detalhe do Faturamento 
  end;

var
  Saida    : String;
  Txt      : TextFile;
  cNomeTxt : String;
  nr_identificador : integer;
  frm_sel_unid_cli_grupo_item: Tfrm_sel_unid_cli_grupo_item;


implementation

{$R *.DFM}

uses FILETEXT, GSMLIB, PGGP001, PGGP017, PGPG022, PGSM016, PGSM018, PGSM024,
     PGSM119, PGSM238, PGSM096, PGSM148, PGSM990, DBTables;

procedure Tfrm_sel_unid_cli_grupo_item.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_unid_cli_grupo_item.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
    if tp_rel in [1] then edt_nm_unid_neg.Text := 'Todas'
    else edt_nm_unid_neg.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_sel_unid_cli_grupo_item do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('NM_UNID_NEG').AsString;
      end
      else
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada!', 2 );
        msk_cd_unid_neg.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_unid_neg.Text := '';
  end;
end;

procedure Tfrm_sel_unid_cli_grupo_item.msk_cd_grupo_itemExit(Sender: TObject);
begin
  if msk_cd_grupo_item.text = '' then
  begin
    if tp_rel in [1, 2] then edt_nm_grupo_item.Text := 'Todos'
    else edt_nm_grupo_item.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_grupo_item );
  if msk_cd_grupo_item.Text <> '' then
  begin
    with datm_sel_unid_cli_grupo_item.qry_grupo_item_ do
    begin
      Close;
      ParamByName('CD_GRUPO_ITEM').AsString := Trim( msk_cd_grupo_item.Text );
      Prepare;
      Open;
      if RecordCount > 0 then
      begin
        edt_nm_grupo_item.Text := FieldByName('NM_GRUPO_ITEM').AsString;
      end
      else
      begin
        BoxMensagem('Grupo de Item não cadastrado!', 2);
        msk_cd_grupo_item.SetFocus;
      end
    end;
  end
  else
  begin
    edt_nm_grupo_item.Text := '';
  end;
end;

procedure Tfrm_sel_unid_cli_grupo_item.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sel_unid_cli_grupo_item do
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

procedure Tfrm_sel_unid_cli_grupo_item.btn_co_grupo_itemClick(Sender: TObject);
begin
  with datm_sel_unid_cli_grupo_item do
  begin
    Application.CreateForm( Tfrm_grupo_item, frm_grupo_item );
    with frm_grupo_item do
    Begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_grupo_item.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_grupo_item.Text := frm_grupo_item.Cons_OnLine_Texto;
      msk_cd_grupo_itemExit(nil);
    end;
  end;
end;

procedure Tfrm_sel_unid_cli_grupo_item.btn_imprimirClick(Sender: TObject);
begin
  if tp_rel in [3,5] then
  begin
    if Trim( msk_cd_unid_neg.Text ) = '' then
    begin
      BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;
  end;

  if msk_dt_inicio.Date = 0 then
  begin
    if ComPeriodo then BoxMensagem( 'Informe uma data de início para seleção!', 2 )
    else BoxMensagem( 'Informe uma data para seleção!', 2 );
    msk_dt_inicio.SetFocus;
    Exit;
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
      msk_dt_fim.Date := 0;
      msk_dt_inicio.SetFocus;
      Exit;
    end;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  with crp_unid_prod do
  begin
    case tp_rel of
      1: begin
           with datm_sel_unid_cli_grupo_item do
           begin
             with qry_pagto_pendente_ do
             begin
               Close;
               SQL.Clear;
               SQL.Add('  SELECT SUM(A) AS SALDO, A.CD_GRUPO, A.CD_CLIENTE, A.NR_PROCESSO, A.NM_EMPRESA, A.CD_ITEM, A.NM_ITEM, A.NM_GRUPO,');
               SQL.Add('    (SELECT TOP 1 CONVERT(VARCHAR, FAT1.DT_LANCAMENTO, 103)');
               SQL.Add('    		FROM TFATURAMENTO_CC FAT1');
               SQL.Add('    		WHERE FAT1.NR_PROCESSO = A.NR_PROCESSO AND FAT1.CD_ITEM = A.CD_ITEM AND FAT1.IN_RESTITUI = 0 AND FAT1.IN_FATURADO = 0');
               SQL.Add('    		ORDER BY FAT1.DT_LANCAMENTO DESC ) AS  DATA,');
               SQL.Add('    (SELECT TOP 1 NR_CHEQUE');
               SQL.Add('    	  FROM TFATURAMENTO_CC FAT1');
               SQL.Add('    		WHERE FAT1.NR_PROCESSO = A.NR_PROCESSO AND FAT1.CD_ITEM = A.CD_ITEM AND FAT1.IN_RESTITUI = 0 AND FAT1.IN_FATURADO = 0');
               SQL.Add('    		ORDER BY FAT1.DT_LANCAMENTO DESC) AS  NR_CHEQUE,');
               SQL.Add('    (SELECT TOP 1 AP_BANCO');
               SQL.Add('    		FROM TFATURAMENTO_CC FAT1, TBANCO B');
               SQL.Add('    		WHERE FAT1.NR_PROCESSO = A.NR_PROCESSO AND FAT1.CD_BANCO = B.CD_BANCO AND FAT1.CD_ITEM = A.CD_ITEM');
               SQL.Add('    			  AND FAT1.IN_RESTITUI = 0 AND FAT1.IN_FATURADO = 0');
               SQL.Add('    		ORDER BY FAT1.DT_LANCAMENTO DESC ) AS AP_BANCO');
               SQL.Add('  FROM  (SELECT SUM(FAT.VL_ITEM) A, FAT.NR_PROCESSO AS NR_PROCESSO , G.NM_GRUPO, P.CD_GRUPO,');
               SQL.Add('     				  P.CD_CLIENTE, EM.NM_EMPRESA, FAT.CD_ITEM, I.NM_ITEM');
               SQL.Add('         FROM TFATURAMENTO_CC FAT (NOLOCK)');
               SQL.Add('           INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = FAT.NR_PROCESSO');
               SQL.Add('           INNER JOIN TEMPRESA_NAC EM (NOLOCK) ON EM.CD_EMPRESA = P.CD_CLIENTE');
               SQL.Add('           INNER JOIN TGRUPO G (NOLOCK) ON G.CD_GRUPO = EM.CD_GRUPO');
               SQL.Add('           INNER JOIN TITEM I (NOLOCK) ON I.CD_ITEM = FAT.CD_ITEM');
               SQL.Add('         WHERE FAT.NR_PROCESSO in ( SELECT NR_PROCESSO FROM TFATURAMENTO_CC B where IN_FATURADO = 1 )');
               SQL.Add('           AND FAT.IN_FATURADO = 0');
               SQL.Add('           AND FAT.IN_RESTITUI = 0');
               SQL.Add('           AND FAT.IN_CANCELADO = 0');
               SQL.Add('           AND FAT.CD_ITEM NOT IN (''991'', ''992'', ''993'', ''995'', ''996'', ''997'', ''998'')');
               SQL.Add('           AND FAT.DT_LANCAMENTO BETWEEN :DT_INICIO AND :DT_FIM');

               if msk_cd_unid_neg.Text <> '' then
                 SQL.Add('    AND P.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' ');
               if msk_cd_produto.Text <> '' then
                 SQL.Add('    AND P.CD_PRODUTO = ''' + msk_cd_produto.Text + ''' ');
               if msk_cd_grupo.Text <> '' then
                 SQL.Add('    AND P.CD_GRUPO = ''' + msk_cd_grupo.Text + ''' ');
               if msk_cd_cliente.Text <> '' then
                 SQL.Add('    AND P.CD_CLIENTE = ''' + msk_cd_cliente.Text + ''' ');
               if msk_cd_analista_comissaria.Text <> '' then
                 SQL.Add('    AND P.CD_ANALISTA_COMISSARIA = ''' + msk_cd_analista_comissaria.Text + ''' ');


               SQL.Add('    GROUP BY P.CD_GRUPO, P.CD_CLIENTE, FAT.NR_PROCESSO, EM.NM_EMPRESA, FAT.CD_ITEM, I.NM_ITEM, G.NM_GRUPO, FAT.CD_BANCO');
               SQL.Add('  UNION ALL');
               SQL.Add('    SELECT SUM(FAT.VL_ITEM)* -1 A, FAT.NR_PROCESSO AS NR_PROCESSO , G.NM_GRUPO, P.CD_GRUPO,');
               SQL.Add('      P.CD_CLIENTE, EM.NM_EMPRESA, FAT.CD_ITEM, I.NM_ITEM');
               SQL.Add('    FROM TFATURAMENTO_CC FAT (NOLOCK)');
               SQL.Add('      INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = FAT.NR_PROCESSO');
               SQL.Add('      INNER JOIN TEMPRESA_NAC EM (NOLOCK) ON EM.CD_EMPRESA = P.CD_CLIENTE');
               SQL.Add('      INNER JOIN TGRUPO G (NOLOCK) ON G.CD_GRUPO = EM.CD_GRUPO');
               SQL.Add('      INNER JOIN TITEM I (NOLOCK) ON I.CD_ITEM = FAT.CD_ITEM');
               SQL.Add('    WHERE FAT.NR_PROCESSO in ( SELECT NR_PROCESSO FROM TFATURAMENTO_CC B where IN_FATURADO = 1 )');
               SQL.Add('      AND FAT.IN_FATURADO = 0');
               SQL.Add('      AND FAT.IN_RESTITUI = 1');
               SQL.Add('      AND FAT.IN_CANCELADO = 0');
               SQL.Add('      AND FAT.CD_ITEM NOT IN (''991'', ''992'', ''993'', ''995'', ''996'', ''997'', ''998'')');
               SQL.Add('      AND FAT.DT_LANCAMENTO BETWEEN :DT_INICIO AND :DT_FIM');


               if msk_cd_unid_neg.Text <> '' then
                 SQL.Add('    AND P.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' ');
               if msk_cd_produto.Text <> '' then
                 SQL.Add('    AND P.CD_PRODUTO = ''' + msk_cd_produto.Text + ''' ');
               if msk_cd_grupo.Text <> '' then
                 SQL.Add('    AND P.CD_GRUPO = ''' + msk_cd_grupo.Text + ''' ');
               if msk_cd_cliente.Text <> '' then
                 SQL.Add('    AND P.CD_CLIENTE = ''' + msk_cd_cliente.Text + ''' ');
               if msk_cd_analista_comissaria.Text <> '' then
                 SQL.Add('    AND P.CD_ANALISTA_COMISSARIA = ''' + msk_cd_analista_comissaria.Text + ''' ');

               SQL.Add('      		GROUP BY P.CD_GRUPO, P.CD_CLIENTE, FAT.NR_PROCESSO, EM.NM_EMPRESA, FAT.CD_ITEM, I.NM_ITEM, G.NM_GRUPO, FAT.CD_BANCO) A');
               SQL.Add('    GROUP BY A.CD_GRUPO, A.CD_CLIENTE, A.NR_PROCESSO, A.NM_EMPRESA, A.CD_ITEM, A.NM_ITEM, A.NM_GRUPO');
               SQL.Add('  HAVING SUM(A) <> 0');
               SQL.Add('  ORDER BY A.NM_GRUPO, A.CD_CLIENTE, A.NM_EMPRESA, A.NR_PROCESSO, A.CD_ITEM');
               ParamByName('DT_INICIO').AsDate := msk_dt_inicio.Date;
               ParamByName('DT_FIM').AsDate := msk_dt_fim.Date;
               Open;
             end;
             // Adiantamento de Numerário
             with qry_adiantamento_pend_ do
             begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT FAT.NR_PROCESSO AS NR_PROCESSO, ROUND (SUM (ROUND (FAT.VL_ITEM, 2)) - SUM (ROUND(FAT2.VL_ITEM, 2) ), 2) AS VALOR_NUM,');
               SQL.Add('   P.CD_CLIENTE, EM.NM_EMPRESA');
               SQL.Add(' FROM TFATURAMENTO_CC FAT');
               SQL.Add('   LEFT JOIN TFATURAMENTO_CC FAT2 ON FAT2.NR_PROCESSO = FAT.NR_PROCESSO');
               SQL.Add('   INNER JOIN TPROCESSO P ON P.NR_PROCESSO = FAT.NR_PROCESSO');
               SQL.Add('   INNER JOIN TEMPRESA_NAC EM ON EM.CD_EMPRESA = P.CD_CLIENTE');
               SQL.Add(' WHERE FAT.CD_ITEM = ''991'' AND FAT2.CD_ITEM IN (''992'', ''993'')');
               SQL.Add('   AND FAT.IN_FATURADO = 0 AND FAT2.IN_FATURADO = 0');
               SQL.Add('   AND FAT.DT_LANCAMENTO BETWEEN :DT_INICIO AND :DT_FIM');
               if msk_cd_unid_neg.Text <> '' then
                 SQL.Add('    AND P.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' ');
               if msk_cd_produto.Text <> '' then
                 SQL.Add('    AND P.CD_PRODUTO = ''' + msk_cd_produto.Text + ''' ');
               if msk_cd_grupo.Text <> '' then
                 SQL.Add('    AND P.CD_GRUPO = ''' + msk_cd_grupo.Text + ''' ');
               if msk_cd_cliente.Text <> '' then
                 SQL.Add('    AND P.CD_CLIENTE = ''' + msk_cd_cliente.Text + ''' ');
               if msk_cd_analista_comissaria.Text <> '' then
                 SQL.Add('    AND P.CD_ANALISTA_COMISSARIA = ''' + msk_cd_analista_comissaria.Text + ''' ');
               SQL.Add(' GROUP BY P.CD_CLIENTE, EM.NM_EMPRESA, FAT.NR_PROCESSO');
               SQL.Add(' HAVING SUM (ROUND (FAT.VL_ITEM, 2)) - SUM (ROUND( FAT2.VL_ITEM, 2) ) <> 0');
               SQL.Add(' ORDER BY EM.NM_EMPRESA, P.CD_CLIENTE, FAT.NR_PROCESSO');
               ParamByName('DT_INICIO').AsDate := msk_dt_inicio.Date;
               ParamByName('DT_FIM').AsDate := msk_dt_fim.Date;
               Open;
             end;

             if qry_pagto_pendente_.RecordCount = 0 then
             begin
               BoxMensagem( 'Não existem dados que atendam ao filtro especificado!', 2 );
               Exit;;
             end
             else
             begin
               //chama o form de impressão!!
               Application.CreateForm(TFrm_impressao, Frm_impressao);
               frm_impressao.cd_unid_neg   := msk_cd_unid_neg.Text;
               frm_impressao.cd_produto    := msk_cd_produto.Text;
               frm_impressao.cd_via_transp := '';
               frm_impressao.cd_modulo     := '2610';
               frm_impressao.cd_grupo      := msk_cd_grupo.Text;
               frm_impressao.cd_emp_nac    := msk_cd_cliente.Text;
               frm_impressao.vApenas_email := false;
               frm_impressao.ShowModal;
               frm_impressao.Release;
             end;
           end;
         end;


           {Screen.Cursor := crHourGlass;
           Application.ProcessMessages;

           if chk_resumido.Checked then
             ReportName  := cDir_Rpt + '\CRFI025.RPT'
           else
             ReportName  := cDir_Rpt + '\CRFI017.RPT';
           with datm_sel_unid_cli_grupo_item do
           begin
             CloseStoredProc( sp_rel_pagto_pend );

             sp_rel_pagto_pend.ParamByName('@dt_inicio').AsDate      := msk_dt_inicio.Date;
             sp_rel_pagto_pend.ParamByName('@dt_fim').AsDate         := msk_dt_fim.Date;

             // Alterado para atender a N unidades - Michel 14/10/2008
             if Trim(msk_cd_unid_neg.Text) = '' then
               sp_rel_pagto_pend.ParamByName('@cd_unid_neg').AsString  := 'X'
             else
                sp_rel_pagto_pend.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;
             if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_pagto_pend.ParamByName('@cd_grupo').AsString  := 'X'
             else
                sp_rel_pagto_pend.ParamByName('@cd_grupo').AsString  := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_produto.Text ) = '' then
                sp_rel_pagto_pend.ParamByName('@cd_produto').AsString  := 'X'
             else
                sp_rel_pagto_pend.ParamByName('@cd_produto').AsString  := Trim( msk_cd_produto.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_pagto_pend.ParamByName('@cd_cliente').AsString := 'X'
             else
                sp_rel_pagto_pend.ParamByName('@cd_cliente').AsString := Trim( msk_cd_cliente.Text );
             if Trim( msk_cd_grupo_item.Text ) = '' then
                sp_rel_pagto_pend.ParamByName('@cd_grupo_item').AsString  := 'X'
             else
                sp_rel_pagto_pend.ParamByName('@cd_grupo_item').AsString  := Trim( msk_cd_grupo_item.Text );
             if Trim( msk_cd_analista_comissaria.Text ) = '' then
                sp_rel_pagto_pend.ParamByName('@cd_analista_comissaria').AsString  := 'X'
             else
                sp_rel_pagto_pend.ParamByName('@cd_analista_comissaria').AsString  := Trim( msk_cd_analista_comissaria.Text );
             if chk_pendentes.Checked then
                sp_rel_pagto_pend.ParamByName('@in_pendentes').AsString  := '1'
             else
                sp_rel_pagto_pend.ParamByName('@in_pendentes').AsString  := '0';
             if chk_desemb.Checked then
                sp_rel_pagto_pend.ParamByName('@in_desemb').AsString     := '1'
             else
                sp_rel_pagto_pend.ParamByName('@in_desemb').AsString     := '0';

              //Rodrigo Capra
              sp_rel_pagto_pend.ParamByName('@in_faturado').AsString     := IIF(chkFaturados.Checked, '1', '0');


             ExecStoredProc( sp_rel_pagto_pend );
             nr_identificador := sp_rel_pagto_pend.ParamByName('@nr_identificador').AsInteger;
             if sp_rel_pagto_pend.ParamByName('Result').AsString <> '1' then
             begin
               CloseStoredProc( sp_rel_pagto_pend );
               Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );
               if Not chk_resumido.Checked then
               begin
                 if chk_refcli.Checked then
                   Formulas[1] := 'RefCli = "1"'
                 else
                   Formulas[1] := 'RefCli = "0"';
                 if chk_despesas.Checked then
                   Formulas[2] := 'OcultarDespesas = "1"'
                 else
                   Formulas[2] := 'OcultarDespesas = "0"';
               end;

               if msk_dt_inicio.Date = msk_dt_fim.Date then
                 ReportTitle := Trim( Caption ) + ' - ' + FormatDateTime( FData, msk_dt_inicio.Date )
               else
                 ReportTitle := Trim( Caption ) + ' - ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' a ' +
                                                          FormatDateTime( FData, msk_dt_fim.Date );
               if ( Trim( edt_nm_analista_comissaria.Text ) <> 'Todos' ) and
                  ( Trim( edt_nm_analista_comissaria.Text ) <> '' ) then
                 ReportTitle := ReportTitle + ' - ' + Trim( edt_nm_analista_comissaria.Text );

               Screen.Cursor := crDefault;
               Application.ProcessMessages;

               Execute;
             end
             else
             begin
               CloseStoredProc( sp_rel_pagto_pend );
               btn_imprimir.Visible   := false;
               btn_itens_erro.Visible := True;
               btn_itens_erro.Top     := 163;
               btn_itens_erro.Left    := 237;
               BoxMensagem('Não foi impresso o Resumo de Faturamento!'+ #13#10 +'Itens sem Grupo!', 2);
             end;
             ApagaDados( 'TREL_PAGTO_PEND', nr_identificador );
           end;
         end;}
      2: begin
           Screen.Cursor := crHourGlass;
           Application.ProcessMessages;
           with datm_sel_unid_cli_grupo_item do
           begin
             CloseStoredProc( sp_rel_pagto_razao );
             sp_rel_pagto_razao.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;
             sp_rel_pagto_razao.ParamByName('@dt_inicio').AsDate      := msk_dt_inicio.Date;
             sp_rel_pagto_razao.ParamByName('@dt_fim').AsDate         := msk_dt_fim.Date;
             if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_pagto_razao.ParamByName('@cd_grupo').AsString  := 'X'
             else
                sp_rel_pagto_razao.ParamByName('@cd_grupo').AsString  := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_pagto_razao.ParamByName('@cd_cliente').AsString := 'X'
             else
                sp_rel_pagto_razao.ParamByName('@cd_cliente').AsString := Trim( msk_cd_cliente.Text );
             if Trim( msk_cd_grupo_item.Text ) = '' then
                sp_rel_pagto_razao.ParamByName('@cd_grupo_item').AsString  := 'X'
             else
                sp_rel_pagto_razao.ParamByName('@cd_grupo_item').AsString  := Trim( msk_cd_grupo_item.Text );
             ExecStoredProc( sp_rel_pagto_razao );
             nr_identificador := sp_rel_pagto_razao.ParamByName('@nr_identificador').AsInteger;
             CloseStoredProc( sp_rel_pagto_razao );
           end;

           Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
           ReportName  := cDir_Rpt + '\CRPG007.RPT';
           Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );
           if msk_dt_inicio.Date = msk_dt_fim.Date then
             ReportTitle := Trim( Caption ) + ' - ' + FormatDateTime( FData, msk_dt_inicio.Date )
           else
             ReportTitle := Trim( Caption ) + ' - ' + FormatDateTime( FData, msk_dt_inicio.Date ) + ' a ' +
                                                      FormatDateTime( FData, msk_dt_fim.Date );

           Screen.Cursor := crDefault;
           Application.ProcessMessages;

           Execute;

           ApagaDados( 'TREL_PAGTO_RAZAO', nr_identificador );
         end;

      3: begin
           Screen.Cursor := crHourGlass;
           Application.ProcessMessages;
           // Rodar Procedure
           with datm_sel_unid_cli_grupo_item do
           begin
             CloseStoredProc( sp_rel_resumo_fat );
             sp_rel_resumo_fat.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;
             sp_rel_resumo_fat.ParamByName('@dt_inicio').AsDate      := msk_dt_inicio.Date;
             sp_rel_resumo_fat.ParamByName('@dt_fim').AsDate         := msk_dt_fim.Date;
             if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_resumo_fat.ParamByName('@cd_grupo').AsString  := 'X'
             else
                sp_rel_resumo_fat.ParamByName('@cd_grupo').AsString  := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_resumo_fat.ParamByName('@cd_cliente').AsString := 'X'
             else
                sp_rel_resumo_fat.ParamByName('@cd_cliente').AsString := Trim( msk_cd_cliente.Text );
             if Trim( msk_cd_grupo_item.Text ) = '' then
                sp_rel_resumo_fat.ParamByName('@cd_grupo_item').AsString  := 'X'
             else
                sp_rel_resumo_fat.ParamByName('@cd_grupo_item').AsString  := Trim( msk_cd_grupo_item.Text );
             ExecStoredProc( sp_rel_resumo_fat );
             nr_identificador := sp_rel_resumo_fat.ParamByName('@nr_identificador').AsInteger;
           end;        
           Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
           ReportName  := cDir_Rpt + '\CRFI016.RPT';
           if datm_sel_unid_cli_grupo_item.sp_rel_resumo_fat.ParamByName('Result').AsString <> '1' then
           begin
             CloseStoredProc( datm_sel_unid_cli_grupo_item.sp_rel_resumo_fat );
             Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );
             Formulas[1] := 'DataInicial = "' + FormatDateTime( FData, msk_dt_inicio.Date ) + '"';
             Formulas[2] := 'DataFinal = "' + FormatDateTime( FData, msk_dt_fim.Date ) + '"';
             if Trim( msk_cd_grupo.Text ) <> '' then
             begin
               ReportTitle := Trim( Caption ) + ' - GRUPO: ' + edt_nm_grupo.Text
             end
             else if Trim( msk_cd_cliente.Text ) <> '' then
             begin
               ReportTitle := Trim( Caption ) + ' - CLIENTE: ' + edt_nm_cliente.Text;
             end
             else ReportTitle := Trim( Caption );
             Screen.Cursor := crDefault;
             Application.ProcessMessages;
             Execute;
           end
           else
           begin
             CloseStoredProc( datm_sel_unid_cli_grupo_item.sp_rel_resumo_fat );
             btn_imprimir.Visible   := false;
             btn_itens_erro.Visible := true;
             btn_itens_erro.Top     := 163;
             btn_itens_erro.Left    := 237;
             BoxMensagem('Não foi possível imprimir Resumo de Faturamento!'+ #13#10 +'Itens sem Grupo!', 2);
           end;
           ApagaDados( 'TREL_RESUMO_FAT', nr_identificador );
           ApagaDados( 'TREL_RESUMO_FAT_TOTAIS', nr_identificador );
           ApagaDados( 'TREL_RESUMO_FAT_REC_TOTAIS', nr_identificador );
         end;
      5: begin
           Screen.Cursor := crHourGlass;
           Application.ProcessMessages;
           // Rodar Procedure
           with datm_sel_unid_cli_grupo_item do
           begin
             CloseStoredProc( sp_rel_resumo_fat_itens );
             sp_rel_resumo_fat_itens.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;
             sp_rel_resumo_fat_itens.ParamByName('@dt_inicio').AsDate      := msk_dt_inicio.Date;
             sp_rel_resumo_fat_itens.ParamByName('@dt_fim').AsDate         := msk_dt_fim.Date;
             if Trim( msk_cd_grupo.Text ) = '' then
                sp_rel_resumo_fat_itens.ParamByName('@cd_grupo').AsString  := 'X'
             else
                sp_rel_resumo_fat_itens.ParamByName('@cd_grupo').AsString  := Trim( msk_cd_grupo.Text );
             if Trim( msk_cd_cliente.Text ) = '' then
                sp_rel_resumo_fat_itens.ParamByName('@cd_cliente').AsString := 'X'
             else
                sp_rel_resumo_fat_itens.ParamByName('@cd_cliente').AsString := Trim( msk_cd_cliente.Text );
             if Trim( msk_cd_grupo_item.Text ) = '' then
                sp_rel_resumo_fat_itens.ParamByName('@cd_grupo_item').AsString  := 'X'
             else
                sp_rel_resumo_fat_itens.ParamByName('@cd_grupo_item').AsString  := Trim( msk_cd_grupo_item.Text );
             ExecStoredProc( sp_rel_resumo_fat_itens );
             nr_identificador := sp_rel_resumo_fat_itens.ParamByName('@nr_identificador').AsInteger;
           end;

           Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
           ReportName  := cDir_Rpt + '\CRFI016ITENS.RPT';
           
           if datm_sel_unid_cli_grupo_item.sp_rel_resumo_fat_itens.ParamByName('Result').AsString <> '1' then
           begin
             CloseStoredProc( datm_sel_unid_cli_grupo_item.sp_rel_resumo_fat_itens );
             Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );
             Formulas[1] := 'DataInicial = "' + FormatDateTime( FData, msk_dt_inicio.Date ) + '"';
             Formulas[2] := 'DataFinal = "' + FormatDateTime( FData, msk_dt_fim.Date ) + '"';
             if Trim( msk_cd_grupo.Text ) <> '' then
             begin
               ReportTitle := Trim( Caption ) + ' - GRUPO: ' + edt_nm_grupo.Text
             end
             else if Trim( msk_cd_cliente.Text ) <> '' then
             begin
               ReportTitle := Trim( Caption ) + ' - CLIENTE: ' + edt_nm_cliente.Text;
             end
             else ReportTitle := Trim( Caption );

             Screen.Cursor := crDefault;
             Application.ProcessMessages;

             Execute;
            end
            else
            begin
             CloseStoredProc( datm_sel_unid_cli_grupo_item.sp_rel_resumo_fat_itens );
             btn_imprimir.Visible := false;
             btn_itens_erro.Visible := true;
             btn_itens_erro.Top := 295;
             btn_itens_erro.Left := 93;
             BoxMensagem('Não foi possível imprimir Resumo de Faturamento!'+ #13#10 +'Itens sem Grupo!', 2);
            end;
            ApagaDados( 'TREL_RESUMO_FAT_ITENS', nr_identificador );
            ApagaDados( 'TREL_RESUMO_FAT_TOTAIS', nr_identificador );
            ApagaDados( 'TREL_RESUMO_FAT_REC_TOTAIS', nr_identificador );
         end;

    end; // end case
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sel_unid_cli_grupo_item.FormShow(Sender: TObject);
begin
  if ComPeriodo then
    lbl_periodo.Caption := 'Selecione um período:';

  case tp_rel of
    1 : begin
          Caption := 'Pagamentos Pendentes';
          lbl_periodo.Caption    := 'Selecione um período:';
          lbl_a.Visible          := True;
          msk_dt_fim.Visible     := True;
          pnlProduto.Visible := true;
          lbl_analista_comissaria.Visible    := True;
          msk_cd_analista_comissaria.Visible := True;
          edt_nm_analista_comissaria.Visible := True;
          btn_co_analista_comissaria.Visible := True;
          lbl_grupo_item.Visible             := False;
          msk_cd_grupo_item.Visible          := False;
          edt_nm_grupo_item.Visible          := False;
          btn_co_grupo_item.Visible          := False;
          chk_pendentes.Visible              := False;
          chk_desemb.Visible                 := False;
          chk_resumido.Visible               := False;
          chk_refcli.Visible                 := False;
          chk_despesas.Visible               := False;
          chkFaturados.Visible               := False;
        end;
    2 : begin
          Caption := 'Razão';
          lbl_periodo.Caption                := 'Selecione um período:';
          lbl_a.Visible                      := True;
          pnlProduto.Visible := false;
          msk_dt_fim.Visible                 := True;
          lbl_analista_comissaria.Visible    := False;
          msk_cd_analista_comissaria.Visible := False;
          edt_nm_analista_comissaria.Visible := False;
          btn_co_analista_comissaria.Visible := False;
        end;
    3 : begin
          Caption := 'Resumo do Faturamento';
          lbl_periodo.Caption                := 'Selecione um período:';
          lbl_a.Visible                      := True;
          pnlProduto.Visible := false;
          msk_dt_fim.Visible                 := True;
          lbl_analista_comissaria.Visible    := False;
          msk_cd_analista_comissaria.Visible := False;
          edt_nm_analista_comissaria.Visible := False;
          btn_co_analista_comissaria.Visible := False;

          msk_cd_unid_neg.Text               := str_cd_unid_neg;
          msk_cd_unid_negExit(nil);
        end;
    4 : begin
          Caption := 'Pagamentos Pendentes';
          lbl_periodo.Caption    := 'Selecione um período:';
          lbl_a.Visible          := True;
          msk_dt_fim.Visible     := True;
          lbl_analista_comissaria.Visible    := True;
          msk_cd_analista_comissaria.Visible := True;
          edt_nm_analista_comissaria.Visible := True;
          btn_co_analista_comissaria.Visible := True;
          chk_pendentes.Visible              := True;
          chk_desemb.Visible                 := True;
          chk_resumido.Visible               := True;
          chk_refcli.Visible                 := True;
          chk_despesas.Visible               := True;
        end;
    5 : begin
          Caption := 'Detalhe do Faturamento';
          lbl_periodo.Caption                := 'Selecione um período:';
          lbl_a.Visible                      := True;
          pnlProduto.Visible := false;
          msk_dt_fim.Visible                 := True;
          lbl_analista_comissaria.Visible    := False;
          msk_cd_analista_comissaria.Visible := False;
          edt_nm_analista_comissaria.Visible := False;
          btn_co_analista_comissaria.Visible := False;

          msk_cd_unid_neg.Text               := str_cd_unid_neg;
          msk_cd_unid_negExit(nil);
        end;

  end;

  with datm_sel_unid_cli_grupo_item do
  begin
    qry_unid_neg_.Close;
    qry_grupo_item_.Close;
    qry_grupo_.Close;
    qry_cliente_.Close;
    qry_unid_neg_.Prepare;
    qry_grupo_item_.Prepare;
    qry_grupo_.Prepare;
    qry_cliente_.Prepare;
    qry_unid_neg_.Open;
    qry_grupo_item_.Open;
    qry_grupo_.Open;
    qry_cliente_.Open;
  end;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);

  lbl_a.Visible        := ComPeriodo;
  msk_dt_fim.Visible   := ComPeriodo;
end;

procedure Tfrm_sel_unid_cli_grupo_item.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  crp_unid_prod.Free;
  with datm_sel_unid_cli_grupo_item do
  begin
    qry_grupo_.Close;
    qry_cliente_.Close;
    qry_unid_neg_.Close;
    qry_grupo_item_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_sel_unid_cli_grupo_item.FormCreate(Sender: TObject);
begin
  // Inicializa o Data Module para Seleção de Relatórios
  Application.CreateForm( Tdatm_sel_unid_cli_grupo_item, datm_sel_unid_cli_grupo_item );
end;

procedure Tfrm_sel_unid_cli_grupo_item.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.Text = '' then
  begin
    edt_nm_cliente.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_cliente );
  with datm_sel_unid_cli_grupo_item.qry_cliente_ do
  begin
    Close;
    ParamByName('CD_CLIENTE').AsString := Trim( msk_cd_cliente.Text );
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
      edt_nm_cliente.Text:= FieldByName('AP_EMPRESA').AsString;
    end;
    Close;
  end;
end;

procedure Tfrm_sel_unid_cli_grupo_item.btn_co_clienteClick(Sender: TObject);
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
  msk_cd_clienteExit(nil);
  msk_cd_cliente.SetFocus;
end;

procedure Tfrm_sel_unid_cli_grupo_item.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg            then btn_co_unid_negClick(nil);
    if Sender = msk_cd_grupo               then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente             then btn_co_clienteClick(nil);
    if Sender = msk_cd_grupo_item          then btn_co_grupo_itemClick(nil);
    if Sender = msk_cd_analista_comissaria then btn_co_analista_comissariaClick(nil);
    if Sender = msk_cd_produto             then btn_co_produtoClick(btn_co_produto);
  end;
end;

procedure Tfrm_sel_unid_cli_grupo_item.btn_co_grupoClick(Sender: TObject);
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

procedure Tfrm_sel_unid_cli_grupo_item.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then
  begin
    edt_nm_grupo.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_grupo);
  with datm_sel_unid_cli_grupo_item.qry_grupo_ do
  begin
    Close;
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Grupo de Clientes não encontrado!', 2 );
      msk_cd_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end
    else edt_nm_grupo.Text:= FieldByName('NM_GRUPO').AsString;
    Close;
  end;
end;

procedure Tfrm_sel_unid_cli_grupo_item.msk_cd_grupoChange(Sender: TObject);
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

procedure Tfrm_sel_unid_cli_grupo_item.msk_cd_clienteChange(Sender: TObject);
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

procedure Tfrm_sel_unid_cli_grupo_item.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Close;
end;


procedure Tfrm_sel_unid_cli_grupo_item.msk_cd_analista_comissariaExit(
  Sender: TObject);
begin
  edt_nm_analista_comissaria.Clear;
  if msk_cd_analista_comissaria.Text = '' then
  begin
    edt_nm_analista_comissaria.Text := 'Todos';
    Exit;
  end;
  ValCodEdt( msk_cd_analista_comissaria );
  with datm_sel_unid_cli_grupo_item.qry_usuario_ do
  begin
    Close;
    ParamByName('CD_USUARIO').AsString := Trim( msk_cd_analista_comissaria.Text );
    Prepare;
    Open;
    if RecordCount = 0 then
    begin
      BoxMensagem( 'Analista Comissária não encontrado!', 2 );
      msk_cd_analista_comissaria.Clear;
      edt_nm_analista_comissaria.Clear;
      msk_cd_analista_comissaria.SetFocus;
    end
    else
    begin
      edt_nm_analista_comissaria.Text:= FieldByName('NM_USUARIO').AsString;
    end;
    Close;
  end;
end;

procedure Tfrm_sel_unid_cli_grupo_item.btn_co_analista_comissariaClick(
  Sender: TObject);
begin
  Application.CreateForm( Tfrm_usuario, frm_usuario );
  with frm_usuario do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_usuario.Cons_OnLine_Texto := msk_cd_analista_comissaria.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_analista_comissaria.Text := frm_usuario.Cons_OnLine_Texto;
  end;
  msk_cd_analista_comissariaExit(nil);
  msk_cd_analista_comissaria.SetFocus;
end;

(*
procedure Tfrm_sel_unid_cli_grupo_item.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo           := nCodigo;
  datm_consulta_padrao.Tabela.TableName := cNomeTabela;

  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine       := fCampo;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end; *)

procedure Tfrm_sel_unid_cli_grupo_item.btn_itens_erroClick(
  Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  with datm_sel_unid_cli_grupo_item do
  begin
    if ( tp_rel = 1 ) or ( tp_rel = 3 ) or ( tp_rel = 5 ) then
    begin
      qry_trel_erro_resumo_fat_.Close;
      qry_trel_erro_resumo_fat_.ParamByName('NR_IDENTIFICADOR').asInteger := nr_identificador;
      qry_trel_erro_resumo_fat_.Prepare;
      qry_trel_erro_resumo_fat_.Open;
    end;

    vListAux.Add('SELECT NR_IDENTIFICADOR, CD_ITEM, CD_UNID_NEG, NM_DESPESA');
    vListAux.Add('       FROM TREL_ERRO_RESUMO_FAT ');
    vListAux.Add('GROUP BY NR_IDENTIFICADOR, CD_ITEM, CD_UNID_NEG, NM_DESPESA');

    case tp_rel of
      1,2,3 : ConsultaOnLineExSQLList(vListAux,'Grupos sem Item',['NR_IDENTIFICADOR', 'CD_ITEM', 'CD_UNID_NEG', 'NM_DESPESA'],['Nº Identificador', 'Cód. Item', 'Cód. Unid.', 'Descrição do Item'],'NR_IDENTIFICADOR',nil);
    end;
  end;
  btn_imprimir.Visible := true;
  btn_itens_erro.Visible := false;
  ApagaDados( 'TREL_ERRO_RESUMO_FAT', nr_identificador );
end;

procedure Tfrm_sel_unid_cli_grupo_item.msk_cd_produtoExit(Sender: TObject);
begin
  edt_nm_produto.Clear;
  if msk_cd_produto.Text = '' then
  begin
    edt_nm_produto.Text := 'Todos';
    Exit;
  end;
  msk_cd_produto.Text := Copy('00', 1, 2 - Length(msk_cd_produto.Text)) + msk_cd_produto.text;
  edt_nm_produto.Text := ConsultaLookUp('TPRODUTO', 'CD_PRODUTO', msk_cd_produto.Text, 'NM_PRODUTO');

end;

procedure Tfrm_sel_unid_cli_grupo_item.btn_co_produtoClick(
  Sender: TObject);
begin
  msk_cd_produto.Text :=  ConsultaOnlineEx('TPRODUTO', 'Produtos', ['CD_PRODUTO', 'NM_PRODUTO'], ['Código', 'Nome'], 'CD_PRODUTO');
  msk_cd_produtoExit(msk_cd_produto);
end;

end.

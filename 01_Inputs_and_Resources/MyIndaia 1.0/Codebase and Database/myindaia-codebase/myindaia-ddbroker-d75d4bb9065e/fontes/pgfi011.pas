unit PGFI011;
                            
interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, DBTables, StdCtrls, Mask, ExtCtrls, UCRPE32, Grids, DBGrids, ShellApi, Funcoes,
  ComObj, DateUtils, ConsOnLineEx, ExcelXP, ToolEdit;

type
  Tfrm_sel_unid_prod_fin = class(TForm)
    Panel1: TPanel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    msk_dt_atual: TMaskEdit;
    btn_imprimir: TButton;
    btn_sair: TButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    crp_unid_prod: TCrpe;
    msk_dt_pagto: TMaskEdit;
    lbl_nr_relatorio: TLabel;
    msk_nr_relatorio: TMaskEdit;
    lbl_tab_juros: TLabel;
    msk_cd_moeda_juros: TMaskEdit;
    lbl_atual: TLabel;
    lbl_pagto: TLabel;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    edt_nm_cid_cliente: TEdit;
    btn_juros: TButton;
    dbg_juros: TDBGrid;
    edt_nm_moeda_juros: TEdit;
    chk_excel: TCheckBox;
    rg_data: TRadioGroup;
    chkSaldo: TCheckBox;
    procedure GeraTabJuros;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_dt_atualExit(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure msk_dt_pagtoExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure btn_jurosClick(Sender: TObject);
  private
    nr_identificador: integer;
    procedure GeraTxtExcel;
    procedure GeraDemCliente( nr_identificador : Integer );
    procedure GeraRecLiq( nr_identificador : Integer );
  public
    tp_rel : Byte;
    in_juros : Boolean;
    altura : Integer;
    // tp_rel
    // 1 - Reembolso Financeiro
    // 2 - Demonstrativo para clientes
    // 3 - Receitas Liquidadas
    // 4 - Fluxo de Caixa Operacional
  end;

var
  frm_sel_unid_prod_fin: Tfrm_sel_unid_prod_fin;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGFI012, PGSM010, PGSM018, PGSM024, PGSM119, FileText;

procedure Tfrm_sel_unid_prod_fin.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sel_unid_prod_fin.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.text = '' then
  begin
    if tp_rel in [1, 2, 3, 4, 5,6] then edt_nm_unid_neg.Text := 'Todas'
    else edt_nm_unid_neg.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_sel_unid_prod_fin do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '"';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if Not qry_unid_neg_.EOF then
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

procedure Tfrm_sel_unid_prod_fin.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text = '' then
  begin
    if tp_rel in [1, 2, 3, 4, 5,6] then edt_nm_produto.Text := 'Todos'
    else edt_nm_produto.Text := '';
    Exit;
  end;
  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_sel_unid_prod_fin do
    begin
      qry_produto_.Close;
      qry_produto_.SQL[2] := 'WHERE CD_PRODUTO = "' + msk_cd_produto.Text + '"';
      qry_produto_.Prepare;
      qry_produto_.Open;
      if Not qry_produto_.EOF then
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

procedure Tfrm_sel_unid_prod_fin.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sel_unid_prod_fin do
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

procedure Tfrm_sel_unid_prod_fin.btn_co_produtoClick(Sender: TObject);
begin
  with datm_sel_unid_prod_fin do
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

{$HINTS OFF}
procedure Tfrm_sel_unid_prod_fin.msk_dt_atualExit(Sender: TObject);
begin
end;
{$HINTS ON}

procedure Tfrm_sel_unid_prod_fin.btn_imprimirClick(Sender: TObject);
var vQryAdiant, vQryFatRec, vQryFatDev, vQryPagto, vQryPagto2, vQrySaldo, vQryAux, vQryTransf: TQuery;
    vDtReg: TDatetime;
    x, y, w, vDiferencaDias, nColuna, nLinhaAux: integer;
    vCdBanco: string[3];
    Excel, xlWorkB, oSheet: OleVariant;
    saldo_inicial, vPagtoAux, saldo_total, saldo : real;
    vSaldoI, vAdiant, vFatRec, vPgtoOp, vFatDev, vTransE, vTransS: string;
    vLinha275, vLinha274, vLinhaAux: Integer;

  function ColExcel(col: integer): string;
    const vLetra: array [0..26] of string = ('','A','B','C','D','E','F','G','H','I','J','K',
                                              'L','M','N','O','P','Q','R','S','T','U','V',
                                              'W','X','Y','Z');
  begin
    Result := vletra[col div 26];
    Result := Result + vletra[col mod 26];
    //trata exceção , a letra z
    if vLetra[(col - 1) mod 26] = 'Y' then
       Result := vletra[(col - 1) div 26] + 'Z';
  end;
begin
  nr_identificador := 0;

  if ( Trim(msk_cd_unid_neg.Text) = '' ) and ( Not ( tp_rel in [1, 3, 4, 5,6] ) ) then
  begin
    BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if ( Trim(msk_cd_produto.Text) = '' ) and ( Not ( tp_rel in [1, 3, 4, 5,6] ) ) then
  begin
    BoxMensagem( 'Informe um Produto!', 2 );
    msk_cd_produto.SetFocus;
    Exit;
  end;

  if ( ( Trim(msk_cd_cliente.Text) = '' ) and ( Trim(msk_cd_grupo.Text) = '' ) ) and ( tp_rel in [1,6] ) then
  begin
    BoxMensagem( 'Informe um Cliente ou Grupo!', 2 );
    msk_cd_cliente.SetFocus;
    Exit;
  end;

  if tp_rel in [1,6] then
  begin
    if msk_dt_atual.Text = '  /  /    ' then
    begin
      BoxMensagem( 'Informe uma data para Reembolso Financeiro!', 2 );
      Exit;
    end;

    if msk_dt_pagto.Text = '  /  /    ' then
    begin
      BoxMensagem( 'Informe uma data para Pagamento!', 2 );
      msk_dt_pagto.SetFocus;
      Exit;
    end;

    if Trim( msk_nr_relatorio.Text ) = '' then
    begin
      BoxMensagem( 'Informe um número para o relatório!', 2 );
      msk_nr_relatorio.SetFocus;
      Exit;
    end;

    if Trim( msk_cd_moeda_juros.Text ) = '' then
    begin
      BoxMensagem( 'Tabela de Juros não parametrizada para o Grupo/Cliente ou' + #13#10 +
                   'possui mais de uma tabela. Verifique cadastro do Cliente!', 2 );
      Exit;
    end;

  end;

  if tp_rel in [2, 3, 4, 5] then
  begin
    if msk_dt_atual.Text = '  /  /    ' then
    begin
      BoxMensagem( 'Informe uma Data Inicial!', 2 );
      Exit;
    end;

    if msk_dt_pagto.Text = '  /  /    ' then
    begin
      BoxMensagem( 'Informe uma Data Final!', 2 );
      msk_dt_pagto.SetFocus;
      Exit;
    end;
  end;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  with crp_unid_prod do
  begin
    case tp_rel of
      1: begin
           with datm_sel_unid_prod_fin do
           begin
             if frm_sel_unid_prod_fin.Height < 400 then // Não exibiu juros
             begin
               GeraTabJuros;
             end;
             CloseStoredProc( sp_rel_fin );
             sp_rel_fin.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;
             if Trim( msk_cd_produto.Text ) = '' then
               sp_rel_fin.ParamByName('@cd_produto').AsString   := 'X'
             else
               sp_rel_fin.ParamByName('@cd_produto').AsString   := msk_cd_produto.Text;

             if Trim( msk_cd_grupo.Text ) = '' then
               sp_rel_fin.ParamByName('@cd_grupo').AsString     := 'X'
             else
               sp_rel_fin.ParamByName('@cd_grupo').AsString     := msk_cd_grupo.Text;

             if Trim( msk_cd_cliente.Text ) = '' then
               sp_rel_fin.ParamByName('@cd_cliente').AsString   := 'X'
             else
               sp_rel_fin.ParamByName('@cd_cliente').AsString   := msk_cd_cliente.Text;

             sp_rel_fin.ParamByName('@dt_atual').AsDateTime     := StrToDate( msk_dt_atual.Text );
             sp_rel_fin.ParamByName('@nr_relatorio').AsString   := msk_nr_relatorio.Text;
             sp_rel_fin.ParamByName('@nr_ano').AsString         := Copy( msk_dt_atual.Text, 7, 4 );

             sp_rel_fin.ParamByName('@cd_moeda_juros').AsString := msk_cd_moeda_juros.Text;

             ExecStoredProc( sp_rel_fin );
             nr_identificador := sp_rel_fin.ParamByName('@nr_identificador').AsInteger;
             if sp_rel_fin.ParamByName('Result').AsInteger > 0 then
             begin
               BoxMensagem('ATENÇÃO!! Existem inconsistências no relatório!!' + #13#10 +
                   'Processo: ' + sp_rel_fin.ParamByName('@erro').AsString, 2 );
             end;
             CloseStoredProc( sp_rel_fin );
           end;
         end;
      2: begin
           with datm_sel_unid_prod_fin do
           begin
             CloseStoredProc( sp_rel_dem_cliente );
             if Trim( msk_cd_unid_neg.Text ) = '' then
               sp_rel_dem_cliente.ParamByName('@cd_unid_neg').AsString := 'X'
             else
               sp_rel_dem_cliente.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
             if Trim( msk_cd_produto.Text ) = '' then
               sp_rel_dem_cliente.ParamByName('@cd_produto').AsString := 'X'
             else
               sp_rel_dem_cliente.ParamByName('@cd_produto').AsString := msk_cd_produto.Text;

             if Trim( msk_cd_grupo.Text ) = '' then
               sp_rel_dem_cliente.ParamByName('@cd_grupo').AsString   := 'X'
             else
               sp_rel_dem_cliente.ParamByName('@cd_grupo').AsString   := msk_cd_grupo.Text;

             if Trim( msk_cd_cliente.Text ) = '' then
               sp_rel_dem_cliente.ParamByName('@cd_cliente').AsString := 'X'
             else
               sp_rel_dem_cliente.ParamByName('@cd_cliente').AsString := msk_cd_cliente.Text;

             sp_rel_dem_cliente.ParamByName('@dt_inicio').AsDateTime  := StrToDate( msk_dt_atual.Text );
             sp_rel_dem_cliente.ParamByName('@dt_fim').AsDateTime       := StrToDate( msk_dt_pagto.Text );

             ExecStoredProc( sp_rel_dem_cliente );
             nr_identificador := sp_rel_dem_cliente.ParamByName('@nr_identificador').AsInteger;
             if sp_rel_dem_cliente.ParamByName('Result').AsInteger > 0 then
             begin
               BoxMensagem('Não há informações para esse filtro', 2 );
             end;
             CloseStoredProc( sp_rel_dem_cliente );
           end;
         end;
      3: begin
           with datm_sel_unid_prod_fin do
           begin
             CloseStoredProc( sp_rel_rec_liq );
             if Trim( msk_cd_unid_neg.Text ) = '' then
               sp_rel_rec_liq.ParamByName('@cd_unid_neg').AsString := 'X'
             else
               sp_rel_rec_liq.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
             if Trim( msk_cd_produto.Text ) = '' then
               sp_rel_rec_liq.ParamByName('@cd_produto').AsString := 'X'
             else
               sp_rel_rec_liq.ParamByName('@cd_produto').AsString := msk_cd_produto.Text;

             if Trim( msk_cd_grupo.Text ) = '' then
               sp_rel_rec_liq.ParamByName('@cd_grupo').AsString   := 'X'
             else
               sp_rel_rec_liq.ParamByName('@cd_grupo').AsString   := msk_cd_grupo.Text;

             if Trim( msk_cd_cliente.Text ) = '' then
               sp_rel_rec_liq.ParamByName('@cd_cliente').AsString := 'X'
             else
               sp_rel_rec_liq.ParamByName('@cd_cliente').AsString := msk_cd_cliente.Text;

             sp_rel_rec_liq.ParamByName('@dt_inicial').AsDateTime  := StrToDate( msk_dt_atual.Text );
             sp_rel_rec_liq.ParamByName('@dt_final').AsDateTime       := StrToDate( msk_dt_pagto.Text );

             ExecStoredProc( sp_rel_rec_liq );
             nr_identificador := sp_rel_rec_liq.ParamByName('@nr_identificador').AsInteger;
             if sp_rel_rec_liq.ParamByName('Result').AsInteger > 0 then
             begin
               BoxMensagem('Não há informações para esse filtro', 2 );
             end;
             CloseStoredProc( sp_rel_rec_liq );
           end;
         end;
      4: begin


            vQryAdiant := TQuery.Create(application);
            vQryAdiant.DataBaseName := 'DBBROKER';
            vQryAdiant.SQL.Clear;
            vQryAdiant.SQL.Add('SELECT SUM(CASE F.IN_RESTITUI ');
            vQryAdiant.SQL.Add('             WHEN "1" THEN (CASE F.CD_ITEM ');
            vQryAdiant.SQL.Add('                             WHEN "991" THEN VL_ITEM * (-1)');
            vQryAdiant.SQL.Add('                             ELSE VL_ITEM ');
            vQryAdiant.SQL.Add('                           END) ');
            vQryAdiant.SQL.Add('             ELSE (CASE F.CD_ITEM ');
            vQryAdiant.SQL.Add('                    WHEN "991" THEN VL_ITEM ');
            vQryAdiant.SQL.Add('                    ELSE VL_ITEM * (-1) ');
            vQryAdiant.SQL.Add('                  END) ');
            vQryAdiant.SQL.Add('            END), ');
            vQryAdiant.SQL.Add('       DT_LANCAMENTO, F.CD_BANCO ');
            vQryAdiant.SQL.Add('  FROM TFATURAMENTO_CC F (NOLOCK) ');
            vQryAdiant.SQL.Add(' INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = F.NR_PROCESSO ');
            vQryAdiant.SQL.Add(' WHERE F.CD_ITEM IN ("991", "992", "993") ');
            vQryAdiant.SQL.Add('   AND F.DT_LANCAMENTO BETWEEN CONVERT(DATETIME,"' + msk_dt_atual.Text + '", 103) AND CONVERT(DATETIME, "' + msk_dt_pagto.Text + '", 103) ');
            vQryAdiant.SQL.Add('   AND ISNULL(F.IN_CANCELADO, "0") = "0" ');
            vQryAdiant.SQL.Add('   ');
            if Trim(msk_cd_unid_neg.Text) <> '' then
            begin
              vQryAdiant.SQL.Add('   AND P.CD_UNID_NEG = "' + Trim(msk_cd_unid_neg.Text) + '" ');
              if msk_cd_unid_neg.Text = '02' then  //Rodrigo Capra 30/11/2007
                vQryAdiant.SQL.Add('   and F.CD_BANCO in (''331'',''330'')');
            end;
            if Trim(msk_cd_produto.Text) <> '' then
              vQryAdiant.SQL.Add('   AND P.CD_PRODUTO = "'+ Trim(msk_cd_produto.Text) +'" ');
            if Trim(msk_cd_cliente.Text) <> '' then
              vQryAdiant.SQL.Add('   AND P.CD_CLIENTE = "' + Trim(msk_cd_cliente.Text) + '" ')
            else if Trim(msk_cd_grupo.Text) <> '' then
              vQryAdiant.SQL.Add('   AND P.CD_CLIENTE IN (SELECT CD_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_GRUPO = "'+ Trim(msk_cd_grupo.Text) +'") ');
            vQryAdiant.SQL.Add(' GROUP BY F.DT_LANCAMENTO, F.CD_BANCO ');
            vQryAdiant.SQL.Add(' ORDER BY F.DT_LANCAMENTO, F.CD_BANCO');
            vQryAdiant.Open;

            vQryFatRec := TQuery.Create(application);
            vQryFatRec.DataBaseName := 'DBBROKER';
            vQryFatRec.SQL.Clear;
            vQryFatRec.SQL.Add('SELECT SUM(CASE F.IN_RESTITUI ');
            vQryFatRec.SQL.Add('             WHEN "1" THEN (CASE F.CD_ITEM ');
            vQryFatRec.SQL.Add('                             WHEN "998" THEN VL_ITEM * (-1)');
            vQryFatRec.SQL.Add('                             ELSE VL_ITEM ');
            vQryFatRec.SQL.Add('                           END) ');
            vQryFatRec.SQL.Add('             ELSE (CASE F.CD_ITEM ');
            vQryFatRec.SQL.Add('                     WHEN "998" THEN VL_ITEM ');
            vQryFatRec.SQL.Add('                     ELSE VL_ITEM * (-1) ');
            vQryFatRec.SQL.Add('                   END) ');
            vQryFatRec.SQL.Add('           END), ');
            vQryFatRec.SQL.Add('       DT_LANCAMENTO, F.CD_BANCO ');
            vQryFatRec.SQL.Add('  FROM TFATURAMENTO_CC F (NOLOCK) ');
            vQryFatRec.SQL.Add(' INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = F.NR_PROCESSO ');
            vQryFatRec.SQL.Add(' WHERE F.CD_ITEM IN ("998", "988") ');
            vQryFatRec.SQL.Add('   AND F.DT_LANCAMENTO BETWEEN CONVERT(DATETIME,"' + msk_dt_atual.Text + '", 103) AND CONVERT(DATETIME, "' + msk_dt_pagto.Text + '", 103) ');
            vQryFatRec.SQL.Add('   AND ISNULL(F.IN_CANCELADO, "0") = "0" ');
            if Trim(msk_cd_unid_neg.Text) <> '' then
            begin
              vQryFatRec.SQL.Add('   AND P.CD_UNID_NEG = "' + Trim(msk_cd_unid_neg.Text) + '" ');
              if msk_cd_unid_neg.Text = '02' then  //Rodrigo Capra 30/11/2007
                vQryFatRec.SQL.Add('   and F.CD_BANCO in (''331'',''330'')');
            end;
            if Trim(msk_cd_produto.Text) <> '' then
              vQryFatRec.SQL.Add('   AND P.CD_PRODUTO = "'+ Trim(msk_cd_produto.Text) +'" ');
            if Trim(msk_cd_cliente.Text) <> '' then
              vQryFatRec.SQL.Add('   AND P.CD_CLIENTE = "' + Trim(msk_cd_cliente.Text) + '" ')
            else if Trim(msk_cd_grupo.Text) <> '' then
              vQryFatRec.SQL.Add('   AND P.CD_CLIENTE IN (SELECT CD_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_GRUPO = "'+ Trim(msk_cd_grupo.Text) +'") ');
            vQryFatRec.SQL.Add(' GROUP BY F.DT_LANCAMENTO, F.CD_BANCO ');
            vQryFatRec.SQL.Add(' ORDER BY F.DT_LANCAMENTO, F.CD_BANCO');
            vQryFatRec.Open;

            vQryPagto := TQuery.Create(application);
            vQryPagto.DataBaseName := 'DBBROKER';
            vQryPagto.SQL.Clear;
            vQryPagto.SQL.Add('SELECT SUM(CASE C.TP_NATUREZA ');
            vQryPagto.SQL.Add('                WHEN "D" THEN VL_LANCAMENTO ');
            vQryPagto.SQL.Add('                WHEN "C" THEN VL_LANCAMENTO*(-1) ');
            vQryPagto.SQL.Add('           END), ');
            vQryPagto.SQL.Add('        C.DT_MOVIMENTO, C.CD_BANCO ');
            vQryPagto.SQL.Add('  FROM TCAIXA C (NOLOCK) ');
            vQryPagto.SQL.Add(' INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = C.NR_PROCESSO ');
            vQryPagto.SQL.Add(' WHERE C.DT_MOVIMENTO BETWEEN CONVERT(DATETIME,"' + msk_dt_atual.Text + '", 103) AND CONVERT(DATETIME, "' + msk_dt_pagto.Text + '", 103) ');
            vQryPagto.SQL.Add('   AND (     (C.TP_PROCEDENCIA = "1") ');
            vQryPagto.SQL.Add('          OR (     (C.TP_PROCEDENCIA = "0") ');
            vQryPagto.SQL.Add('              AND (C.TP_LANCAMENTO = "F"))) ');
            vQryPagto.SQL.Add('   AND ISNULL(C.IN_CANCELADO, "0") = "0" ');
            vQryPagto.SQL.Add('   AND C.CD_ITEM NOT IN ("987", "997","992") ');
            if Trim(msk_cd_unid_neg.Text) <> '' then
            begin
              vQryPagto.SQL.Add('   AND P.CD_UNID_NEG = "' + Trim(msk_cd_unid_neg.Text) + '" ');
              if msk_cd_unid_neg.Text = '02' then  //Rodrigo Capra 30/11/2007
                vQryPagto.SQL.Add('   and C.CD_BANCO in (''331'',''330'')');
            end;
            if Trim(msk_cd_produto.Text) <> '' then
              vQryPagto.SQL.Add('   AND P.CD_PRODUTO = "'+ Trim(msk_cd_produto.Text) +'" ');
            if Trim(msk_cd_cliente.Text) <> '' then
              vQryPagto.SQL.Add('   AND P.CD_CLIENTE = "' + Trim(msk_cd_cliente.Text) + '" ')
            else if Trim(msk_cd_grupo.Text) <> '' then
              vQryPagto.SQL.Add('   AND P.CD_CLIENTE IN (SELECT CD_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_GRUPO = "'+ Trim(msk_cd_grupo.Text) +'") ');
            vQryPagto.SQL.Add(' GROUP BY C.DT_MOVIMENTO, C.CD_BANCO ');
            vQryPagto.SQL.Add(' ORDER BY C.DT_MOVIMENTO, C.CD_BANCO ');
            vQryPagto.Open;

            //despesas bancárias e financeiras importantes para o saldo do fluxo!
            vQryPagto2 := TQuery.Create(application);
            vQryPagto2.DataBaseName := 'DBBROKER';
            vQryPagto2.SQL.Clear;
            vQryPagto2.SQL.Add('SELECT SUM(CASE C.TP_NATUREZA ');
            vQryPagto2.SQL.Add('                WHEN "D" THEN VL_LANCAMENTO ');
            vQryPagto2.SQL.Add('                WHEN "C" THEN VL_LANCAMENTO*(-1) ');
            vQryPagto2.SQL.Add('           END), ');
            vQryPagto2.SQL.Add('        C.DT_MOVIMENTO, C.CD_BANCO ');
            vQryPagto2.SQL.Add('  FROM TCAIXA C (NOLOCK) ');
            vQryPagto2.SQL.Add(' WHERE C.DT_MOVIMENTO BETWEEN CONVERT(DATETIME,"' + msk_dt_atual.Text + '", 103) AND CONVERT(DATETIME, "' + msk_dt_pagto.Text + '", 103) ');
            vQryPagto2.SQL.Add('   AND ISNULL(C.IN_CANCELADO, "0") = "0" ');
            vQryPagto2.SQL.Add('   AND C.CD_CT_CONTABIL IN (SELECT CD_CT_CONTABIL FROM TCT_CONTABIL WHERE IN_FLUXO_CAIXA_FLUXO = "1")');
            vQryPagto2.SQL.Add('   AND C.CD_BANCO IN (SELECT CD_BANCO FROM TBANCO (NOLOCK) WHERE IN_BCO_FLUXO_OP = "1") ');
            vQryPagto2.SQL.Add('   AND ISNULL(C.NR_PROCESSO, "") = "" ');
            if Trim(msk_cd_unid_neg.Text) <> '' then
            begin
              vQryPagto2.SQL.Add('   AND C.CD_UNID_NEG = "' + Trim(msk_cd_unid_neg.Text) + '" ');
              if msk_cd_unid_neg.Text = '02' then  //Rodrigo Capra 30/11/2007
                vQryPagto2.SQL.Add('   and C.CD_BANCO in (''331'',''330'')');
            end;
            vQryPagto2.SQL.Add(' GROUP BY C.DT_MOVIMENTO, C.CD_BANCO ');
            vQryPagto2.SQL.Add(' ORDER BY C.DT_MOVIMENTO, C.CD_BANCO ');
            vQryPagto2.Open;

            vQryFatDev := TQuery.Create(application);
            vQryFatDev.DataBaseName := 'DBBROKER';
            vQryFatDev.SQL.Clear;
            vQryFatDev.SQL.Add('SELECT SUM(CASE F.IN_RESTITUI ');
            vQryFatDev.SQL.Add('             WHEN "1" THEN (CASE F.CD_ITEM ');
            vQryFatDev.SQL.Add('                             WHEN "997" THEN VL_ITEM * (-1)');
            vQryFatDev.SQL.Add('                             ELSE VL_ITEM ');
            vQryFatDev.SQL.Add('                           END) ');
            vQryFatDev.SQL.Add('             ELSE (CASE F.CD_ITEM ');
            vQryFatDev.SQL.Add('                     WHEN "997" THEN VL_ITEM ');
            vQryFatDev.SQL.Add('                     ELSE VL_ITEM * (-1) ');
            vQryFatDev.SQL.Add('                   END) ');
            vQryFatDev.SQL.Add('           END), ');
            vQryFatDev.SQL.Add('       DT_LANCAMENTO, F.CD_BANCO ');
            vQryFatDev.SQL.Add('  FROM TFATURAMENTO_CC F (NOLOCK) ');
            vQryFatDev.SQL.Add(' INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = F.NR_PROCESSO ');
            vQryFatDev.SQL.Add(' WHERE F.CD_ITEM IN ("997", "987") ');
            vQryFatDev.SQL.Add('   AND F.DT_LANCAMENTO BETWEEN CONVERT(DATETIME,"' + msk_dt_atual.Text + '", 103) AND CONVERT(DATETIME, "' + msk_dt_pagto.Text + '", 103) ');
            vQryFatDev.SQL.Add('   AND ISNULL(F.IN_CANCELADO, "0") = "0" ');
            if Trim(msk_cd_unid_neg.Text) <> '' then
            begin
              vQryFatDev.SQL.Add('   AND P.CD_UNID_NEG = "' + Trim(msk_cd_unid_neg.Text) + '" ');
              if msk_cd_unid_neg.Text = '02' then  //Rodrigo Capra 30/11/2007
                vQryFatDev.SQL.Add('   and F.CD_BANCO in (''331'',''330'')');
            end;
            if Trim(msk_cd_produto.Text) <> '' then
              vQryFatDev.SQL.Add('   AND P.CD_PRODUTO = "'+ Trim(msk_cd_produto.Text) +'" ');
            if Trim(msk_cd_cliente.Text) <> '' then
              vQryFatDev.SQL.Add('   AND P.CD_CLIENTE = "' + Trim(msk_cd_cliente.Text) + '" ')
            else if Trim(msk_cd_grupo.Text) <> '' then
              vQryFatDev.SQL.Add('   AND P.CD_CLIENTE IN (SELECT CD_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_GRUPO = "'+ Trim(msk_cd_grupo.Text) +'") ');
            vQryFatDev.SQL.Add(' GROUP BY F.DT_LANCAMENTO, F.CD_BANCO ');
            vQryFatDev.SQL.Add(' ORDER BY F.DT_LANCAMENTO, F.CD_BANCO');
            vQryFatDev.Open;



            vQrySaldo := TQuery.Create(application);
            vQrySaldo.DataBaseName := 'DBBROKER';
            vQrySaldo.SQL.Clear;

            if (vQryAdiant.IsEmpty)  and
               (vQryFatRec.IsEmpty)  and
               (vQryPagto.IsEmpty)   and
               (vQryPagto2.IsEmpty)  and
               (vQryFatDev.IsEmpty)  then
            begin
              ShowMessage('Não há dados para exibir')
            end else begin
              try
                Excel := CreateOLEObject('Excel.Application');
                xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\FLUXOOP.XLS' );
                Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\FLUXOOP_' +
                Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');
                vDiferencaDias := ( DaysBetween( StrToDate( msk_dt_pagto.Text ), StrToDate( msk_dt_atual.Text ) ) ) + 1;
              except
                ShowMessage('Erro na criação da Planilha.');
                Free;
                Exit;
              end;

              oSheet := Excel.WorkBooks[1].Worksheets[2]; //fluxo por banco
              nLinhaAux := 2;

              // transferências entre bancos

              vQryTransf := TQuery.Create(application);
              vQryTransf.DataBaseName := 'DBBROKER';
              vQryTransf.SQL.Clear;
              vQryTransf.SQL.Add('SELECT SUM(C.VL_LANCAMENTO), C.CD_BANCO, C.TP_NATUREZA, C.DT_MOVIMENTO FROM TCAIXA C ');
              vQryTransf.SQL.Add(' WHERE C.CD_BANCO IN (SELECT CD_BANCO FROM TBANCO (NOLOCK) WHERE IN_BCO_FLUXO_OP = "1") ');
              vQryTransf.SQL.Add('   AND CD_CT_CONTABIL IN ( SELECT CD_CT_CONTABIL FROM TCT_CONTABIL WHERE IN_FLUXO_CAIXA_BANCO = "1")');
              vQryTransf.SQL.Add('   AND C.DT_MOVIMENTO BETWEEN CONVERT(DATETIME,"' + msk_dt_atual.Text + '", 103) AND CONVERT(DATETIME, "' + msk_dt_pagto.Text + '", 103) ');
              vQryTransf.SQL.Add('   AND C.TP_LANCAMENTO = "C" AND ISNULL(C.IN_CANCELADO, "0") = "0" ');
              vQryTransf.SQL.Add(' GROUP BY C.DT_MOVIMENTO, C.CD_BANCO, C.TP_NATUREZA ');
              vQryTransf.Open;

              vQryAux := TQuery.Create(application);
              vQryAux.DataBaseName := 'DBBROKER';
              vQryAux.SQL.Clear;

              //Rodrigo Capra 30/11/2007    Unidade 02, pegar somente bancos 330,331
              if Trim(msk_cd_unid_neg.Text) <> '' then
              begin
                if msk_cd_unid_neg.Text = '01' then
                  vQryAux.SQL.Add('SELECT CD_BANCO FROM TBANCO (NOLOCK) WHERE IN_BCO_FLUXO_OP = "1"')
                else if msk_cd_unid_neg.Text = '02' then
                  vQryAux.SQL.Add('SELECT CD_BANCO FROM TBANCO (NOLOCK) WHERE CD_BANCO IN (''330'',''331'')');
              end;
              vQryAux.Open;

              vLinhaAux := 0;
              vLinha274 := -1;
              vLinha275 := -1;

              while not vQryAux.Eof do
              begin
                vCdBanco := vQryAux.Fields[0].AsString;
                vDtReg := StrToDate( msk_dt_atual.Text );


                //a pedido da Vanessa Paulella que não quer a soma dos bancos 275 e 274 no total do Fluxo, serão retirados na marra (20/09/2007)
                if vCdBanco = '274' then
                  vLinha274 := vLinhaAux;
                if vCdBanco = '275' then
                  vLinha275 := vLinhaAux;
                vLinhaAux := vLinhaAux + 1;


                oSheet := Excel.WorkBooks[1].Worksheets[2];
                vQrySaldo.Close;
                vQrySaldo.SQL.Clear;
                vQrySaldo.SQL.Add('SELECT ISNULL(SUM(ISNULL(VL_SALDO_ANT,0)), 0) AS VL_SALDO ');
                vQrySaldo.SQL.Add('  FROM TCAIXA_SALDOS (NOLOCK) ');
                vQrySaldo.SQL.Add(' WHERE CD_CT_CAIXA IN (SELECT CD_CONTA FROM TCONTA_CAIXA (NOLOCK) WHERE  CD_BANCO = "' + vCdBanco + '" ) ');
                vQrySaldo.SQL.Add('   AND CD_UNID_NEG =  "' + Trim(msk_cd_unid_neg.Text) + '"  ');
                vQrySaldo.SQL.Add('   AND DT_MOVIMENTO = CONVERT(DATETIME, "' + msk_dt_atual.Text + '" ,103)  ');
                vQrySaldo.Open;
                saldo_inicial := 0;
                saldo_inicial := vQrySaldo.Fields[0].AsFloat;
                nColuna := 2;
                //colore a primeira coluna
                oSheet.Cells[ nLinhaAux ,      1].Interior.ColorIndex := 11;  // azul escuro
                oSheet.Cells[ nLinhaAux +  1,  1].Interior.ColorIndex := 11;  // azul escuro
                oSheet.Cells[ nLinhaAux +  13, 1].Interior.ColorIndex := 11;  // azul escuro
                oSheet.Cells[ nLinhaAux +  14, 1].Interior.ColorIndex := 11;  // azul escuro
                oSheet.Cells[ nLinhaAux ,      1].Font.ColorIndex := 2;  // branco
                oSheet.Cells[ nLinhaAux +  14, 1].Font.ColorIndex := 2;  // branco

                oSheet.Cells[ nLinhaAux +  3,  1].Interior.ColorIndex := 34;  // azul claro
                oSheet.Cells[ nLinhaAux +  5,  1].Interior.ColorIndex := 34;  // azul claro
                oSheet.Cells[ nLinhaAux +  7,  1].Interior.ColorIndex := 34;  // azul claro
                oSheet.Cells[ nLinhaAux +  9,  1].Interior.ColorIndex := 34;  // azul claro
                oSheet.Cells[ nLinhaAux + 11,  1].Interior.ColorIndex := 34;  // azul claro

                oSheet.Cells[ nLinhaAux +  2,  1].Interior.ColorIndex := 35;  // verde claro
                oSheet.Cells[ nLinhaAux +  4,  1].Interior.ColorIndex := 35;  // verde claro
                oSheet.Cells[ nLinhaAux +  6,  1].Interior.ColorIndex := 35;  // verde claro
                oSheet.Cells[ nLinhaAux +  8,  1].Interior.ColorIndex := 35;  // verde claro
                oSheet.Cells[ nLinhaAux +  10, 1].Interior.ColorIndex := 35;  // verde claro
                oSheet.Cells[ nLinhaAux +  12, 1].Interior.ColorIndex := 35;  // verde claro

                oSheet.Cells[ nLinhaAux +  15, 1 ].Interior.ColorIndex := 2;  // branco

                oSheet.Cells[ nLinhaAux , 1].value := ' ' + ConsultaLookUP('TBANCO', 'CD_BANCO', vCdBanco, 'NM_BANCO') + ' ';
                oSheet.Cells[ nLinhaAux + 2 , 1].value := ' 1.SALDO INICIAL';
                oSheet.Cells[ nLinhaAux + 3 , 1].value := ' 2. ENTRADAS';
                oSheet.Cells[ nLinhaAux + 4 , 1].value := '      Transferência entre Bancos' ;
                oSheet.Cells[ nLinhaAux + 5 , 1].value := '      Adiantamento de Numerário' ;
                oSheet.Cells[ nLinhaAux + 6 , 1].value := '      Saldo de Faturas Recebidas' ;
                oSheet.Cells[ nLinhaAux + 7 , 1].value := '      Total' ;
                oSheet.Cells[ nLinhaAux + 8 , 1].value := ' 3. SAÍDAS' ;
                oSheet.Cells[ nLinhaAux + 9 , 1].value := '      Transferência entre Bancos' ;
                oSheet.Cells[ nLinhaAux + 10, 1].value := '      Pagamentos Operacionais' ;
                oSheet.Cells[ nLinhaAux + 11, 1].value := '      Saldo de Faturas devolvidas' ;
                oSheet.Cells[ nLinhaAux + 12, 1].value := '      Total' ;
                oSheet.Cells[ nLinhaAux + 14, 1].value := ' 4. SALDO FINAL (1 + 2 + (- 3)):';



                for x := 1 to vDiferencaDias do
                begin
                  vPagtoAux := 0;
                  //colore as celulas necessarias (fundo e fonte)
                  oSheet.Cells[ nLinhaAux ,      nColuna ].Interior.ColorIndex := 11;  // azul escuro
                  oSheet.Cells[ nLinhaAux +  1,  nColuna ].Interior.ColorIndex := 11;  // azul escuro
                  oSheet.Cells[ nLinhaAux +  13, nColuna ].Interior.ColorIndex := 11;  // azul escuro
                  oSheet.Cells[ nLinhaAux +  14, nColuna ].Interior.ColorIndex := 11;  // azul escuro
                  oSheet.Cells[ nLinhaAux ,      nColuna ].Font.ColorIndex := 2;  // branco
                  oSheet.Cells[ nLinhaAux +  14, nColuna ].Font.ColorIndex := 2;  // branco

                  oSheet.Cells[ nLinhaAux +  3,  nColuna ].Interior.ColorIndex := 34;  // azul claro
                  oSheet.Cells[ nLinhaAux +  5,  nColuna ].Interior.ColorIndex := 34;  // azul claro
                  oSheet.Cells[ nLinhaAux +  7, nColuna ].Interior.ColorIndex := 34;  // azul claro
                  oSheet.Cells[ nLinhaAux +  9, nColuna ].Interior.ColorIndex := 34;  // azul claro
                  oSheet.Cells[ nLinhaAux + 11, nColuna ].Interior.ColorIndex := 34;  // azul claro

                  oSheet.Cells[ nLinhaAux +  2,  nColuna ].Interior.ColorIndex := 35;  // verde claro
                  oSheet.Cells[ nLinhaAux +  4,  nColuna ].Interior.ColorIndex := 35;  // verde claro
                  oSheet.Cells[ nLinhaAux +  6,  nColuna ].Interior.ColorIndex := 35;  // verde claro
                  oSheet.Cells[ nLinhaAux +  8,  nColuna ].Interior.ColorIndex := 35;  // verde claro
                  oSheet.Cells[ nLinhaAux +  10,  nColuna ].Interior.ColorIndex := 35;  // verde claro
                  oSheet.Cells[ nLinhaAux +  12,  nColuna ].Interior.ColorIndex := 35;  // verde claro

                  oSheet.Cells[ nLinhaAux +  15, nColuna ].Interior.ColorIndex := 2;  // branco


                  oSheet.Cells[ nLinhaAux ,  nColuna ].value := ' ' + Copy( DateToSTR( vDtReg ), 1, 2 ) + ' ';

                  //entradas - transferencias
                  vQryTransf.First;
                  if vQryTransf.Locate('DT_MOVIMENTO;CD_BANCO;TP_NATUREZA', VarArrayOf([vDtReg, vCdBanco, 'C']), [loCaseInsensitive]) then
                    oSheet.Cells[ nLinhaAux +  4, nColuna].Value :=  vQryTransf.Fields[0].AsFloat
                  else
                    oSheet.Cells[ nLinhaAux +  4, nColuna].Value := '0';
                  //dados do adiantamento
                  vQryAdiant.First;
                  if vQryAdiant.Locate('DT_LANCAMENTO;CD_BANCO', VarArrayOf([vDtReg, vCdBanco]), [loCaseInsensitive]) then
                    oSheet.Cells[ nLinhaAux +  5, nColuna ].value := vQryAdiant.Fields[0].AsFloat
                  else
                    oSheet.Cells[ nLinhaAux +  5, nColuna ].value := '0';
                  //dados de Fatura Recebidas
                  vQryFatRec.First;
                   if vQryFatRec.Locate('DT_LANCAMENTO;CD_BANCO', VarArrayOf([vDtReg, vCdBanco]), [loCaseInsensitive]) then
                      oSheet.Cells[ nLinhaAux +  6, nColuna ].value := vQryFatRec.Fields[0].AsFloat
                  else
                      oSheet.Cells[ nLinhaAux +  6, nColuna ].value := '0';

                  //saidas - transferências entre bancos
                  vQryTransf.First;
                  if vQryTransf.Locate('DT_MOVIMENTO;CD_BANCO;TP_NATUREZA', VarArrayOf([vDtReg, vCdBanco, 'D']), [loCaseInsensitive]) then
                    oSheet.Cells[ nLinhaAux + 9, nColuna].Value :=  vQryTransf.Fields[0].AsFloat
                  else
                    oSheet.Cells[ nLinhaAux + 9, nColuna].Value := '0';

                  //dados do Pagamentos Operacionais
                  vQryPagto.First;
                  if vQryPagto.Locate('DT_MOVIMENTO;CD_BANCO', VarArrayOf([vDtReg, vCdBanco]), [loCaseInsensitive]) then vPagtoAux := vQryPagto.Fields[0].AsFloat;
                  vQryPagto2.First;
                  if vQryPagto2.Locate('DT_MOVIMENTO;CD_BANCO', VarArrayOf([vDtReg, vCdBanco]), [loCaseInsensitive]) then vPagtoAux := vPagtoAux + vQryPagto2.Fields[0].AsFloat;
                  oSheet.Cells[ nLinhaAux + 10, nColuna ].value := vPagtoAux;

                  //dados do Faturas Devolvidas
                  vQryFatDev.First;
                  if vQryFatDev.Locate('DT_LANCAMENTO;CD_BANCO', VarArrayOf([vDtReg, vCdBanco]), [loCaseInsensitive]) then
                    oSheet.Cells[ nLinhaAux + 11, nColuna ].value := vQryFatDev.Fields[0].AsFloat
                  else
                    oSheet.Cells[ nLinhaAux + 11, nColuna ].value := '0';
                  //passa formula dos totais
                  if vDtReg = StrToDate(msk_dt_atual.text) then
                    osheet.Cells[ nLinhaAux +  2, nColuna ].Value := saldo_inicial
                  else
                    osheet.Cells[ nLinhaAux +  2, nColuna ].Value := '= ' + ColExcel(nColuna - 1) + IntToStr(nLinhaAux + 14);



                  oSheet.Cells[ nLinhaAux +  7,  nColuna ].value := '= ' + ColExcel(nColuna) + IntToStr(nLinhaAux + 4) + '+' + ColExcel(nColuna) + IntToStr(nLinhaAux + 5)  + '+' + ColExcel(nColuna) + IntToStr(nLinhaAux + 6 );
                  oSheet.Cells[ nLinhaAux +  12, nColuna ].value := '= ' + ColExcel(nColuna) + IntToStr(nLinhaAux + 9) + '+' + ColExcel(nColuna) + IntToStr(nLinhaAux + 10) + '+' + ColExcel(nColuna) + IntToStr(nLinhaAux + 11);
                  oSheet.Cells[ nLinhaAux +  14, nColuna ].value := '= (' + ColExcel(nColuna) + IntToStr(nLinhaAux + 2) + '+' + ColExcel(nColuna) + IntToStr(nLinhaAux + 7) + ')-' + ColExcel(nColuna) + IntToStr(nLinhaAux + 12);
                  vDtReg := vDtReg + 1;
                  nColuna := nColuna + 1;
                end;
                nLinhaAux := nLinhaAux + 16;

                vQryAux.Next;
              end;



              oSheet := Excel.WorkBooks[1].Worksheets[1];

              // nome do relatório
              oSheet.Cells[ 02, 02 ].Font.Bold := True;
              oSheet.Cells[ 02, 02 ].value := 'Fluxo de Caixa Operacional - Período de  ' + msk_dt_atual.Text + '  à  ' + msk_dt_pagto.Text;
              // filtros da planilha
              oSheet.Cells[ 03, 03 ].value := edt_nm_unid_neg.text;
              oSheet.Cells[ 04, 03 ].value := edt_nm_produto.text;
              if msk_cd_grupo.text <> '' then begin
                oSheet.Cells[ 05, 02 ].value := 'Grupo Cliente:';
                oSheet.Cells[ 05, 03 ].value := edt_nm_grupo.text;
              end else begin
                oSheet.Cells[ 05, 02 ].value := 'Cliente:';
                oSheet.Cells[ 05, 03 ].value := edt_nm_cliente.text;
                if msk_cd_cliente.Text = '' then oSheet.Cells[ 06, 03 ].value := 'Todos';
              end;
              oSheet.Cells[ 06, 03 ].value := ConsultaLookUP('TUSUARIO','CD_USUARIO',str_cd_usuario,'AP_USUARIO') + '  em  ' +  DateToStr( date() ) + ' - ' + TimeToStr( time() );

              vDtReg := StrToDate( msk_dt_atual.Text );
              saldo_inicial := vQrySaldo.Fields[0].AsFloat;
              nColuna := 2;
              w := 0;
              for x := 1 to vDiferencaDias do
              begin
                //colore as celulas necessarias (fundo e fonte)
                oSheet.Cells[ 8,  nColuna ].Interior.ColorIndex := 11;  // azul escuro
                oSheet.Cells[ 10, nColuna ].Interior.ColorIndex := 11;  // azul escuro
                oSheet.Cells[ 11, nColuna ].Interior.ColorIndex := 11;  // azul escuro
                oSheet.Cells[ 18, nColuna ].Interior.ColorIndex := 11;  // azul escuro
                oSheet.Cells[ 25, nColuna ].Interior.ColorIndex := 11;  // azul escuro
                oSheet.Cells[ 9,  nColuna ].Font.ColorIndex := 2;  // branco
                oSheet.Cells[ 10, nColuna ].Font.ColorIndex := 2;  // branco
                oSheet.Cells[ 11, nColuna ].Font.ColorIndex := 2;  // branco
                oSheet.Cells[ 18, nColuna ].Font.ColorIndex := 2;  // branco
                oSheet.Cells[ 25, nColuna ].Font.ColorIndex := 2;  // branco
                oSheet.Cells[ 12, nColuna ].Interior.ColorIndex := 34;  // azul claro
                oSheet.Cells[ 14, nColuna ].Interior.ColorIndex := 34;  // azul claro
                oSheet.Cells[ 16, nColuna ].Interior.ColorIndex := 34;  // azul claro
                oSheet.Cells[ 19, nColuna ].Interior.ColorIndex := 34;  // azul claro
                oSheet.Cells[ 21, nColuna ].Interior.ColorIndex := 34;  // azul claro
                oSheet.Cells[ 23, nColuna ].Interior.ColorIndex := 34;  // azul claro
                oSheet.Cells[ 9,  nColuna ].Interior.ColorIndex := 35;  // verde claro
                oSheet.Cells[ 13, nColuna ].Interior.ColorIndex := 35;  // verde claro
                oSheet.Cells[ 15, nColuna ].Interior.ColorIndex := 35;  // verde claro
                oSheet.Cells[ 17, nColuna ].Interior.ColorIndex := 35;  // verde claro
                oSheet.Cells[ 20, nColuna ].Interior.ColorIndex := 35;  // verde claro
                oSheet.Cells[ 22, nColuna ].Interior.ColorIndex := 35;  // verde claro
                oSheet.Cells[ 24, nColuna ].Interior.ColorIndex := 35;  // verde claro
                oSheet.Cells[ 8,  nColuna ].value := ' ' + Copy( DateToSTR( vDtReg ), 1, 2 ) + ' ';


                vSaldoI := '= ';
                vAdiant := '= ';
                vFatRec := '= ';
                vPgtoOp := '= ';
                vFatDev := '= ';
                vTransE := '= ';
                vTransS := '= ';
                for y := 0 to vQryAux.RecordCount - 1 do begin
                  //fórmulas para gerar o Fluxo Total
                  if (y <> vLinha274) and (y <> vLinha275) then begin
                    vSaldoI := vSaldoI + '''por Banco''!' + ColExcel(nColuna) + IntToStr((y*16) + 4) + '+';
                    vTransE := vTransE + '''por Banco''!' + ColExcel(nColuna) + IntToStr((y*16) + 6) + '+';
                    vAdiant := vAdiant + '''por Banco''!' + ColExcel(nColuna) + IntToStr((y*16) + 7) + '+';
                    vFatRec := vFatRec + '''por Banco''!' + ColExcel(nColuna) + IntToStr((y*16) + 8) + '+';
                    vTransS := vTransS + '''por Banco''!' + ColExcel(nColuna) + IntToStr((y*16) + 11) + '+';
                    vPgtoOp := vPgtoOp + '''por Banco''!' + ColExcel(nColuna) + IntToStr((y*16) + 12) + '+';
                    vFatDev := vFatDev + '''por Banco''!' + ColExcel(nColuna) + IntToStr((y*16) + 13) + '+';
                  end;
                end;
                vSaldoI := Copy( vSaldoI , 1, Length(vSaldoI) - 1);
                vAdiant := Copy( vAdiant , 1, Length(vAdiant) - 1);
                vFatRec := Copy( vFatRec , 1, Length(vFatRec) - 1);
                vTransE := Copy( vTransE , 1, Length(vTransE) - 1);
                vTransS := Copy( vTransS , 1, Length(vTransS) - 1);
                vPgtoOp := Copy( vPgtoOp , 1, Length(vPgtoOp) - 1);
                vFatDev := Copy( vFatDev , 1, Length(vFatDev) - 1);


                //saldo
                osheet.Cells[ 10, nColuna ].Value := vSaldoI;
                //transferências entre bancos - entrada
                oSheet.Cells[ 13, nColuna ].value := vTransE;
                //adiantamento
                oSheet.Cells[ 14, nColuna ].value := vAdiant;
                //faturas recebidas
                oSheet.Cells[ 15, nColuna ].value := vFatRec;
                //transferências entre bancos - saídas
                oSheet.Cells[ 20, nColuna ].value := vTransS;
                //Pagtos Operacionais
                oSheet.Cells[ 21, nColuna ].value := vPgtoOp;
                //faturas devolvidas
                oSheet.Cells[ 22, nColuna ].value := vFatDev;
                //totais
                oSheet.Cells[ 16, nColuna ].value := '= ' + ColExcel(nColuna) + '13+' + ColExcel(nColuna) + '14+' + ColExcel(nColuna) + '15';
                oSheet.Cells[ 23, nColuna ].value := '= ' + ColExcel(nColuna) + '20+' + ColExcel(nColuna) + '21+' + ColExcel(nColuna) + '22';
                oSheet.Cells[ 25, nColuna ].value := '= (' + ColExcel(nColuna) + '10+' + ColExcel(nColuna) + '16)-' + ColExcel(nColuna) + '23';


                vDtReg := vDtReg + 1;
                nColuna := nColuna + 1;
                w := w + 1;
              end;


              Excel.Visible := True;

              // Envia msg de sucesso
              ShowMessage('Planilha gerada com sucesso');
            end;
            vQryAdiant.Close;
            vQryFatRec.Close;
            vQryFatDev.Close;
            vQryPagto.Close;
            vQryAdiant.Free;
            vQryFatRec.Free;
            vQryFatDev.Free;
            vQryPagto.Free;
            vQrySaldo.Free;
            ApagaDados( 'TREL_REC_LIQ', nr_identificador );
         end;
      5: begin
            // IMPORTANTE: NO SELECT NO CAMPO RELACIONADO AS DESPESAS, FOI CONSIDERADO A PEDIDO DA DELAINE QUE QUANDO NO FATURAMENTO EXISTIR O ITEM 513
            // IGNORE TODAS AS OUTRAS DESPESAS E CONSIDERE APENAS COMO DESPESA O ITEM 513 E COMO RECEITA O ITEM 822 (COMISSÃO)
            with datm_sel_unid_prod_fin.qry_rel_recebiveis_ do
            begin
              Close;
              ParamByName('CD_UNID_NEG').AsString:= msk_cd_unid_neg.Text;
              ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
              ParamByName('CD_GRUPO').AsString   := msk_cd_grupo.Text;
              ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;

              Case rg_data.ItemIndex of
                0:  SQL[42] := ' AND (F.DT_FATURA BETWEEN :DT_INI AND :DT_FIM)';
                1:  SQL[42] := ' AND (F.DT_VENCTO_FATURA BETWEEN :DT_INI AND :DT_FIM)';
                2:  SQL[42] := ' AND ((SELECT TOP 1 FAT.DT_LANCAMENTO FROM TFATURAMENTO_CC FAT (NOLOCK)'+
                                     'WHERE FAT.NR_PROCESSO = P.NR_PROCESSO AND FAT.NR_SOLIC_FAT = F.NR_SOLICITACAO AND FAT.CD_ITEM = ''991'' AND IN_CANCELADO = 0'+
                                     'ORDER BY FAT.DT_LANCAMENTO DESC) BETWEEN :DT_INI AND :DT_FIM)';
              end;
              ParamByName('DT_INI').AsDateTime := StrToDate(msk_dt_atual.text);
              ParamByName('DT_FIM').AsDateTime := StrToDate(msk_dt_pagto.text);
              Open;
              if RecordCount > 0 then
              begin
                try
                  Excel := CreateOleObject('Excel.Application');
                  xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\Recebiveis.XLS' );
                  Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\Recebiveis' + Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');
                  oSheet := Excel.Workbooks[1].WorkSheets[1];

                  oSheet.Cells[ 3, 4 ].Value := IIF(edt_nm_unid_neg.Text = '', 'Todas', edt_nm_unid_neg.Text);
                  oSheet.Cells[ 4, 4 ].Value := IIF(edt_nm_produto.Text = '', 'Todas', edt_nm_produto.Text);
                  oSheet.Cells[ 5, 4 ].Value := IIF(msk_cd_cliente.Text = '', 'Todos', msk_cd_cliente.Text);
                  oSheet.Cells[ 6, 4 ].Value := IIF(edt_nm_grupo.Text = '', 'Todos', edt_nm_grupo.Text);
                  nLinhaAux := 9;
                  saldo_total := 0;

                  while not EOF DO
                  begin
//                    saldo := Arredondar((FieldByName('ADTO_NUM').AsFloat + FieldByName('IMPOSTOS').AsFloat) - (FieldByName('RECEITAS').AsFloat + FieldByName('DESPESAS').AsFloat),2); // (Numerário, Impostos) - (Comissão e Receitas, Despesas)
                    saldo := (Arredondar(FieldByName('ADTO_NUM').AsFloat,2) + Arredondar(FieldByName('IMPOSTOS').AsFloat,2)) - (Arredondar(FieldByName('RECEITAS').AsFloat,2) + Arredondar(FieldByName('DESPESAS').AsFloat,2)); // (Numerário, Impostos) - (Comissão e Receitas, Despesas)
                    if (saldo <> 0) or ((saldo = 0) and (chkSaldo.Checked = False)) then
                    begin
                      oSheet.Cells[ nLinhaAux,  1].value := FieldByName('NM_EMPRESA').AsString;
                      oSheet.Cells[ nLinhaAux,  2].value := FieldByName('NR_PROCESSO').AsString;
                      oSheet.Cells[ nLinhaAux,  3].value := FieldByName('CD_REFERENCIA').AsString;
                      oSheet.Cells[ nLinhaAux,  4].value := FieldByName('NR_NOTA').AsString;
                      oSheet.Cells[ nLinhaAux,  5].value := FieldByName('DT_FATURA').AsString;
                      oSheet.Cells[ nLinhaAux,  6].value := FieldByName('DT_VENCTO_FATURA').AsString;
                      oSheet.Cells[ nLinhaAux,  7].value := FieldByName('DT_ADTO_NUM').AsString;
                      oSheet.Cells[ nLinhaAux,  8].value := FieldByName('DT_LIQUIDACAO').AsString;
                      oSheet.Cells[ nLinhaAux,  9].value := FieldByName('VL_LIQUIDACAO').AsFloat;
                      oSheet.Cells[ nLinhaAux, 10].value := FieldByName('ADTO_NUM').AsFloat;
                      oSheet.Cells[ nLinhaAux, 11].value := FieldByName('IMPOSTOS').AsFloat;
                      oSheet.Cells[ nLinhaAux, 12].value := FieldByName('RECEITAS').AsFloat;
                      oSheet.Cells[ nLinhaAux, 13].value := FieldByName('DESPESAS').AsFloat;
                      oSheet.Cells[ nLinhaAux, 14].value := saldo;
                      saldo_total := saldo_total + saldo;
                      nLinhaAux := nLinhaAux + 1;
                    end;
                      Next;
                  end;
                  // Totalizador
                  oSheet.Cells[ nLinhaAux, 13 ].value := 'TOTAL';
                  oSheet.Cells[ nLinhaAux, 13 ].Font.Bold := True;
                  oSheet.Cells[ nLinhaAux, 13 ].Font.Size := 12;
                  oSheet.Cells[ nLinhaAux, 13 ].Font.ColorIndex := 2;
                  oSheet.Cells[ nLinhaAux, 13 ].Interior.ColorIndex := 49;
                  oSheet.Cells[ nLinhaAux, 14 ].value := saldo_total;
                  oSheet.Cells[ nLinhaAux, 14 ].Font.Bold := True;
                  Excel.Visible := True;
                except
                  ShowMessage('Erro na criação da Planilha.');
                  Excel.Quit;
                  Free;
                  Exit;
                end;
              end
              else
                BoxMensagem('Não há registros para os filtros selecionados.', 3);

            end;
         end;
      6: begin
           with datm_sel_unid_prod_fin do
           begin
             if frm_sel_unid_prod_fin.Height < 400 then // Não exibiu juros
             begin
               GeraTabJuros;
             end;
             CloseStoredProc( sp_rel_fin );
             sp_rel_fin.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;
             if Trim( msk_cd_produto.Text ) = '' then
               sp_rel_fin.ParamByName('@cd_produto').AsString   := 'X'
             else
               sp_rel_fin.ParamByName('@cd_produto').AsString   := msk_cd_produto.Text;

             if Trim( msk_cd_grupo.Text ) = '' then
               sp_rel_fin.ParamByName('@cd_grupo').AsString     := 'X'
             else
               sp_rel_fin.ParamByName('@cd_grupo').AsString     := msk_cd_grupo.Text;

             if Trim( msk_cd_cliente.Text ) = '' then
               sp_rel_fin.ParamByName('@cd_cliente').AsString   := 'X'
             else
               sp_rel_fin.ParamByName('@cd_cliente').AsString   := msk_cd_cliente.Text;

             sp_rel_fin.ParamByName('@dt_atual').AsDateTime     := StrToDate( msk_dt_atual.Text );
             sp_rel_fin.ParamByName('@nr_relatorio').AsString   := msk_nr_relatorio.Text;
             sp_rel_fin.ParamByName('@nr_ano').AsString         := Copy( msk_dt_atual.Text, 7, 4 );

             sp_rel_fin.ParamByName('@cd_moeda_juros').AsString := msk_cd_moeda_juros.Text;

             ExecStoredProc( sp_rel_fin );
             nr_identificador := sp_rel_fin.ParamByName('@nr_identificador').AsInteger;
             if sp_rel_fin.ParamByName('Result').AsInteger > 0 then
             begin
               BoxMensagem('ATENÇÃO!! Existem inconsistências no relatório!!' + #13#10 +
                   'Processo: ' + sp_rel_fin.ParamByName('@erro').AsString, 2 );
             end;
             CloseStoredProc( sp_rel_fin );
           end;
         end;
    end; // end case

    if tp_rel in [1,6] then
    begin
      if chk_excel.Checked then
      begin
        GeraTxtExcel;
      end
      else
      begin
        //Totais
        datm_sel_unid_prod_fin.qry_rel_fin_totais_.Close;
        datm_sel_unid_prod_fin.qry_rel_fin_totais_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        datm_sel_unid_prod_fin.qry_rel_fin_totais_.Prepare;
        datm_sel_unid_prod_fin.qry_rel_fin_totais_.Open;

        Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
        if tp_rel in [1] then
        begin
          ReportName := cDir_Rpt + '\CRFI010.RPT';
          Formulas[0] := 'NrIdentificador = ' + Trim( IntToStr( nr_identificador ) );
          if edt_nm_grupo.Text <> '' then
          begin
            Formulas[1] := 'Importador = "' + Trim( edt_nm_grupo.Text ) + '"';
            Formulas[2] := 'CidImportador = ""';
          end
          else
          begin
            Formulas[1] := 'Importador = "' + Trim( edt_nm_cliente.Text ) + '"';
            Formulas[2] := 'CidImportador = "' + Trim( edt_nm_cid_cliente.Text ) + '"';
          end;
          Formulas[3] := 'DtAtual = "' + Trim( msk_dt_atual.Text ) + '"';
          Formulas[4] := 'DtPagto = "' + Trim( msk_dt_pagto.Text ) + '"';
          Formulas[5] := 'NrRelatorio = "' + Trim( msk_nr_relatorio.Text ) + '"';
          Formulas[6] := 'MoedaJuros = "' + Trim( msk_cd_moeda_juros.Text ) + '"';
          Formulas[7] := 'ValorCom = "' + FormatFloat( '#0,.00', datm_sel_unid_prod_fin.qry_rel_fin_totais_.FieldByName('VL_COMISSAO').AsFloat ) + '"';
        end
        else
          ReportName := cDir_Rpt + '\CRFI026.RPT';

      end;

    end;
    if tp_rel in [2] then
    begin
      GeraDemCliente( nr_identificador );
    end;
    if tp_rel in [3] then
    begin
      GeraRecLiq(nr_identificador);
    end;

    case tp_rel of
      1,6: begin
           if Not chk_excel.Checked then Execute;
           ApagaDados( 'TREL_FIN_DESP', nr_identificador );
           ApagaDados( 'TREL_FIN_RESUMO', nr_identificador );
         end;
      2: begin
           ApagaDados( 'TREL_DEM_CLIENTE', nr_identificador );
         end;
      3: begin
           ApagaDados( 'TREL_REC_LIQ', nr_identificador );
         end;
     end;
    (*if tp_rel in [1] then
    begin
      if Not chk_excel.Checked then Execute;
      ApagaDados( 'TREL_FIN_DESP', nr_identificador );
      ApagaDados( 'TREL_FIN_RESUMO', nr_identificador );
    end;*)
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_sel_unid_prod_fin.FormShow(Sender: TObject);
begin
  if tp_rel = 1 then
  begin
    frm_sel_unid_prod_fin.Left := ( ( Screen.Width - frm_sel_unid_prod_fin.Width ) div 2 );

    altura := frm_sel_unid_prod_fin.Height;
  end;

  if in_juros then Exit;

  case tp_rel of
    1 : Caption := 'Relatório de Reembolso Financeiro';
    2 : begin
          Caption := 'Relatório de Demonstrativo para Clientes';
          Panel1.Width := 410;
          frm_sel_unid_prod_fin.Width := 418;
          btn_imprimir.Left := 134;
          btn_imprimir.Top := 219;
          btn_sair.Left := 230;
          btn_sair.Top := 219;
          lbl_pagto.Left := 123;
          msk_dt_pagto.Left := 123;
          lbl_atual.Caption := 'Data Inicial';
          lbl_pagto.Caption := 'Data Final';
          btn_juros.Visible := False;
          msk_cd_moeda_juros.Visible := False;
          edt_nm_moeda_juros.Visible := False;
          lbl_tab_juros.Visible := False;
          lbl_nr_relatorio.Visible := False;
          msk_nr_relatorio.Visible := False;
          chk_excel.Visible := False;
          chkSaldo.Visible  := False;
          rg_data.Visible := False;
        end;
    3 : begin
          Caption := 'Relatório de Receitas Liquidadas';
          Panel1.Width := 410;
          frm_sel_unid_prod_fin.Width := 418;
          btn_imprimir.Left := 134;
          btn_imprimir.Top := 219;
          btn_sair.Left := 230;
          btn_sair.Top := 219;
          lbl_pagto.Left := 123;
          msk_dt_pagto.Left := 123;
          lbl_atual.Caption := 'Data Inicial';
          lbl_pagto.Caption := 'Data Final';
          btn_juros.Visible := False;
          msk_cd_moeda_juros.Visible := False;
          edt_nm_moeda_juros.Visible := False;
          lbl_tab_juros.Visible := False;
          lbl_nr_relatorio.Visible := False;
          msk_nr_relatorio.Visible := False;
          chk_excel.Visible := False;
          chkSaldo.Visible  := False;
          rg_data.Visible := False;
        end;
    4 : begin
          Caption := 'Fluxo de Caixa Operacional';
          Panel1.Width := 410;
          frm_sel_unid_prod_fin.Width := 418;
          btn_imprimir.Left := 134;
          btn_imprimir.Top := 219;
          btn_sair.Left := 230;
          btn_sair.Top := 219;
          lbl_pagto.Left := 123;
          msk_dt_pagto.Left := 123;
          lbl_atual.Caption := 'Data Inicial';
          lbl_pagto.Caption := 'Data Final';
          btn_juros.Visible := False;
          msk_cd_moeda_juros.Visible := False;
          edt_nm_moeda_juros.Visible := False;
          lbl_tab_juros.Visible := False;
          lbl_nr_relatorio.Visible := False;
          msk_nr_relatorio.Visible := False;
          chk_excel.Visible := False;
          chkSaldo.Visible  := False;
          rg_data.Visible := False;
        end;
    5 : begin
          Caption := 'Relatório de Valores Recebíveis';
          Panel1.Width := 410;
          frm_sel_unid_prod_fin.Width := 418;
          btn_imprimir.Left := 134;
          btn_imprimir.Top := 219;
          btn_sair.Left := 230;
          btn_sair.Top := 219;
          lbl_pagto.Left := 100;
          msk_dt_pagto.Left := 100;
          lbl_atual.Caption := 'Data Inicial';
          lbl_pagto.Caption := 'Data Final';
          btn_juros.Visible := False;
          msk_cd_moeda_juros.Visible := False;
          edt_nm_moeda_juros.Visible := False;
          lbl_tab_juros.Visible := False;
          lbl_nr_relatorio.Visible := False;
          msk_nr_relatorio.Visible := False;
          chk_excel.Visible := False;
          rg_data.Visible := true;
          rg_data.Top := 195;
          btn_imprimir.Left := 220;
          btn_sair.Left := 297;
          chkSaldo.Left := 185;
          chkSaldo.Top  := 168;
        end;
    6 : begin
          Caption := 'Relatório de Referencias Basf';
          chk_excel.Visible := False;
        end;
      end;

  with datm_sel_unid_prod_fin do
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

  if tp_rel = 1 then
    if msk_cd_grupo.Enabled then msk_cd_grupo.SetFocus;
end;


procedure Tfrm_sel_unid_prod_fin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_sel_unid_prod_fin do
  begin
    qry_grupo_.Close;
    qry_cliente_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_ult_relat_grupo_.Close;
    qry_ult_relat_cli_.Close;
    Free;
  end;
  crp_unid_prod.Free;
  Action := caFree;
end;


procedure Tfrm_sel_unid_prod_fin.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_sel_unid_prod_fin, datm_sel_unid_prod_fin );
  if tp_rel = 1 then
    frm_sel_unid_prod_fin.Top    := frm_main.Top;
  frm_sel_unid_prod_fin.Height := frm_sel_unid_prod_fin.Height - 200;
  in_juros := False;
end;


procedure Tfrm_sel_unid_prod_fin.msk_dt_pagtoExit(Sender: TObject);
begin
  try
    if msk_dt_pagto.Text <> '  /  /    ' then StrToDate(msk_dt_pagto.Text);
  except
    on EConvertError do
    begin
      BoxMensagem( 'Data Inválida!', 2 );
      msk_dt_pagto.Clear;
    end;
  end;
end;


procedure Tfrm_sel_unid_prod_fin.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
    if Sender = msk_cd_grupo    then btn_co_grupoClick(nil);
    if Sender = msk_cd_cliente  then btn_co_clienteClick(nil);
  end;
end;


procedure Tfrm_sel_unid_prod_fin.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.text = '' then
  begin
    if tp_rel = 1 then
    begin
      edt_nm_cliente.Text := '';
      edt_nm_cid_cliente.Text := '';
    end
    else edt_nm_cliente.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_cliente);
  with datm_sel_unid_prod_fin do
  begin
    qry_cliente_.Close;
    qry_cliente_.ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    qry_cliente_.Prepare;
    qry_cliente_.Open;
    if qry_cliente_.EOF then
    begin
      BoxMensagem( 'Cliente não encontrado!', 2 );
      msk_cd_cliente.Clear;
      edt_nm_cliente.Clear;
      msk_cd_cliente.SetFocus;
    end
    else
    begin
      edt_nm_cliente.Text := qry_cliente_.FieldByName('AP_EMPRESA').AsString;

    if tp_rel in [3,5] then
    begin
      qry_cliente_.Close;
      Exit;
    end;

      // Nº Relatório por Grupo
      with datm_sel_unid_prod_fin.qry_ult_relat_cli_ do
      begin
        Close;
        ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
        ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
        ParamByName('NR_ANO').AsString      := FormatDateTime( 'yyyy', dt_server );
        Prepare;
        Open;
        if EOF or FieldByName('NR_RELATORIO').IsNull then
        begin
          BoxMensagem( 'Relatório não cadastrado para este cliente!', 2 );
          Exit;
        end
        else
        begin
          msk_nr_relatorio.Text := FieldByName('NR_RELATORIO').AsString;
          msk_dt_atual.Text     := FormatDateTime( 'dd/mm/yyyy', FieldByName('DT_EMISSAO').AsDateTime );
          msk_dt_pagto.Text     := FormatDateTime( 'dd/mm/yyyy', FieldByName('DT_EMISSAO').AsDateTime + 1 );
        end;
        Close;
      end;

      // Verifica a existência de mais de uma Tabela de Juros cadastrada
      msk_cd_moeda_juros.Text := '';
      edt_nm_moeda_juros.Text := '';
      qry_tab_juros_cli_.Close;
      qry_tab_juros_cli_.ParamByName('CD_GRUPO').AsString   := '';
      qry_tab_juros_cli_.ParamByName('CD_EMPRESA').AsString := msk_cd_cliente.Text;
      qry_tab_juros_cli_.Prepare;
      qry_tab_juros_cli_.Open;
      if Not qry_tab_juros_cli_.EOF then
      begin
        msk_cd_moeda_juros.Text := qry_tab_juros_cli_.FieldByName('CD_MOEDA_JUROS').AsString;
        edt_nm_moeda_juros.Text := qry_tab_juros_cli_.FieldByName('NM_MOEDA_JUROS').AsString;
      end;
    end;
    qry_cliente_.Close;
  end;
end;


procedure Tfrm_sel_unid_prod_fin.btn_co_clienteClick(Sender: TObject);
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


procedure Tfrm_sel_unid_prod_fin.btn_co_grupoClick(Sender: TObject);
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


procedure Tfrm_sel_unid_prod_fin.msk_cd_grupoExit(Sender: TObject);
begin
  edt_nm_grupo.Clear;
  if msk_cd_grupo.Text = '' then
  begin
    if tp_rel in [1,6] then edt_nm_grupo.Text := ''
    else edt_nm_grupo.Text := 'Todos';
    Exit;
  end;
  ValCodEdt(msk_cd_grupo);
  with datm_sel_unid_prod_fin.qry_grupo_ do
  begin
    Close;
    ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
    Prepare;
    Open;
    if EOF then
    begin
      BoxMensagem('Grupo de Clientes não encontrado!',2);
      msk_cd_grupo.Clear;
      msk_cd_grupo.SetFocus;
    end
    else
    begin
      edt_nm_grupo.Text := FieldByName('NM_GRUPO').AsString;

      // Nº Relatório por Grupo
      if tp_rel in [1,6] then
      begin
        with datm_sel_unid_prod_fin.qry_ult_relat_grupo_ do
        begin
          Close;
          ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
          ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
          ParamByName('CD_GRUPO').AsString    := msk_cd_grupo.Text;
          ParamByName('NR_ANO').AsString      := FormatDateTime( 'yyyy', dt_server );
          Prepare;
          Open;
          if EOF or FieldByName('NR_RELATORIO').IsNull then
          begin
            BoxMensagem( 'Relatório não cadastrado para este grupo!', 2 );
            Exit;
          end
          else
          begin
            msk_nr_relatorio.Text := FieldByName('NR_RELATORIO').AsString;
            msk_dt_atual.Text     := FormatDateTime( 'dd/mm/yyyy', FieldByName('DT_EMISSAO').AsDateTime );
            msk_dt_pagto.Text     := FormatDateTime( 'dd/mm/yyyy', FieldByName('DT_EMISSAO').AsDateTime + 1 );
          end;
          Close;
        end;
      end;

      // Verifica a existência de mais de uma Tabela de Juros cadastrada
      with datm_sel_unid_prod_fin, datm_sel_unid_prod_fin.qry_tot_tab_juros_cli_ do
      begin
        Close;
        ParamByName('CD_GRUPO').AsString := msk_cd_grupo.Text;
        Prepare;
        Open;
        if Not EOF then
        begin
          msk_cd_moeda_juros.Text := '';
          edt_nm_moeda_juros.Text := '';
          if ( FieldByName('TOT_MOEDA').AsInteger >= 1 ) then
          begin
            qry_tab_juros_cli_.Close;
            qry_tab_juros_cli_.ParamByName('CD_GRUPO').AsString   := msk_cd_grupo.Text;
            qry_tab_juros_cli_.ParamByName('CD_EMPRESA').AsString := '';
            qry_tab_juros_cli_.Prepare;
            qry_tab_juros_cli_.Open;
            if Not qry_tab_juros_cli_.EOF then
            begin
              msk_cd_moeda_juros.Text := qry_tab_juros_cli_.FieldByName('CD_MOEDA_JUROS').AsString;
              edt_nm_moeda_juros.Text := qry_tab_juros_cli_.FieldByName('NM_MOEDA_JUROS').AsString;
            end;
          end;
        end;
        Close;
      end;
    end;
    Close;
  end;
end;


procedure Tfrm_sel_unid_prod_fin.msk_cd_grupoChange(Sender: TObject);
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


procedure Tfrm_sel_unid_prod_fin.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.Text = '' then
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


procedure Tfrm_sel_unid_prod_fin.GeraTabJuros;
begin
  with datm_sel_unid_prod_fin do
  begin
    CloseStoredProc( sp_fin_gera_tab_juros );
    sp_fin_gera_tab_juros.ParamByName('@cd_unid_neg').AsString  := msk_cd_unid_neg.Text;

    if Trim( msk_cd_produto.Text ) = '' then
      sp_fin_gera_tab_juros.ParamByName('@cd_produto').AsString   := 'X'
    else
      sp_fin_gera_tab_juros.ParamByName('@cd_produto').AsString   := msk_cd_produto.Text;

    if Trim( msk_cd_grupo.Text ) = '' then
      sp_fin_gera_tab_juros.ParamByName('@cd_grupo').AsString     := 'X'
    else
      sp_fin_gera_tab_juros.ParamByName('@cd_grupo').AsString     := msk_cd_grupo.Text;

    if Trim( msk_cd_cliente.Text ) = '' then
      sp_fin_gera_tab_juros.ParamByName('@cd_cliente').AsString   := 'X'
    else
      sp_fin_gera_tab_juros.ParamByName('@cd_cliente').AsString   := msk_cd_cliente.Text;

    sp_fin_gera_tab_juros.ParamByName('@dt_atual').AsDateTime     := StrToDate( msk_dt_atual.Text );
    sp_fin_gera_tab_juros.ParamByName('@dt_final').AsDateTime     := StrToDate( msk_dt_atual.Text );
    sp_fin_gera_tab_juros.ParamByName('@cd_moeda_juros').AsString := msk_cd_moeda_juros.Text;
    sp_fin_gera_tab_juros.ParamByName('@in_rel_reemb').AsString   := '1';

    ExecStoredProc( sp_fin_gera_tab_juros );
    CloseStoredProc( sp_fin_gera_tab_juros );
  end;
end;


procedure Tfrm_sel_unid_prod_fin.btn_jurosClick(Sender: TObject);
begin
  if Trim( msk_cd_moeda_juros.Text ) = '' then
  begin
    BoxMensagem( 'Tabela de Juros não parametrizada para o Grupo/Cliente ou' + #13#10 +
                 'possui mais de uma tabela. Verifique cadastro do Cliente!', 2 );
    Exit;
  end;

  if frm_sel_unid_prod_fin.Height < 400 then
  begin
    in_juros := True;
    btn_juros.Caption := '&Juros    <<';
    frm_sel_unid_prod_fin.Height := frm_main.Height;
    frm_sel_unid_prod_fin.Refresh;
    GeraTabJuros;
    with datm_sel_unid_prod_fin.qry_juros_ do
    begin
      Close;
      ParamByName('CD_MOEDA_JUROS').AsString := msk_cd_moeda_juros.Text;
      Prepare;
      Open;
    end;
  end
  else
  begin
    in_juros := False;
    datm_sel_unid_prod_fin.qry_juros_.Close;
    btn_juros.Caption := '&Juros    >>';
    frm_sel_unid_prod_fin.Height := altura;
    frm_sel_unid_prod_fin.Refresh;
  end;
end;


procedure Tfrm_sel_unid_prod_fin.GeraTxtExcel;
var
  ArqDesp : TFileText;
  c1 : String;
  p1: Array[0..1024] of Char;
  Enter   : String[2];
  Contador : Byte;
  PrimPag : Boolean;
  TotPag : Integer;
  TotAntecipado, TotComissao, TotItem, TotCPMF, TotReembolso : Double;
begin
  Enter := #13#10;
  with datm_sel_unid_prod_fin do
  begin
    try
      ArqDesp      := TFileText.Create;
      ArqDesp.Name := cDir_Rpt + '\BASF.TXT';
      ArqDesp.CreateFile;

      // Cabeçalho
      c1 := '';
      qry_tot_desp_.Close;
      qry_tot_desp_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      qry_tot_desp_.Prepare;
      qry_tot_desp_.Open;
      if qry_tot_desp_.RecordCount > 0 then
      begin
        c1 := c1 + IntToStr( qry_tot_desp_.FieldByName('TOT_LINHAS_DESP').AsInteger );
        if qry_tot_desp_.FieldByName('TOT_LINHAS_DESP').AsInteger <= 36 then
        begin
          c1 := c1 + ';0';
        end
        else
        begin
          TotPag := qry_tot_desp_.FieldByName('TOT_LINHAS_DESP').AsInteger - 36;
          TotPag := ( TotPag div 34 );
          if ( ( qry_tot_desp_.FieldByName('TOT_LINHAS_DESP').AsInteger - 36 ) mod 34 ) <> 0 then TotPag := TotPag + 1;
          c1 := c1 + ';' + IntToStr( TotPag );
        end;
      end
      else
        c1 := c1 + ';';
      c1 := c1 + ';';
      qry_tot_desp_.Close;

      qry_tot_resumo_.Close;
      qry_tot_resumo_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      qry_tot_resumo_.Prepare;
      qry_tot_resumo_.Open;
      if qry_tot_resumo_.RecordCount > 0 then
      begin
        c1 := c1 + IntToStr( qry_tot_resumo_.FieldByName('TOT_LINHAS_RESUMO').AsInteger + 1 );
        if qry_tot_resumo_.FieldByName('TOT_LINHAS_RESUMO').AsInteger <= 31 then
        begin
          c1 := c1 + ';0';
        end
        else
        begin
          TotPag := qry_tot_resumo_.FieldByName('TOT_LINHAS_RESUMO').AsInteger - 31;
          TotPag := ( TotPag div 36 );
          if ( ( qry_tot_resumo_.FieldByName('TOT_LINHAS_RESUMO').AsInteger - 31 ) mod 36 ) <> 0 then TotPag := TotPag + 1;
          c1 := c1 + ';' + IntToStr( TotPag );
        end;
      end
      else
        c1 := c1 + ';';
      c1 := c1 + ';';
      qry_tot_resumo_.Close;

      qry_tot_juros_.Close;
      qry_tot_juros_.ParamByName('CD_MOEDA_JUROS').AsString := msk_cd_moeda_juros.Text;
      qry_tot_juros_.Prepare;
      qry_tot_juros_.Open;
      if qry_tot_juros_.RecordCount > 0 then
      begin
        c1 := c1 + IntToStr( qry_tot_juros_.FieldByName('TOT_LINHAS_JUROS').AsInteger );
        if qry_tot_juros_.FieldByName('TOT_LINHAS_JUROS').AsInteger <= 37 then
        begin
          c1 := c1 + ';0';
        end
        else
        begin
          TotPag := qry_tot_juros_.FieldByName('TOT_LINHAS_JUROS').AsInteger - 37;
          TotPag := ( TotPag div 38 );
          if ( ( qry_tot_juros_.FieldByName('TOT_LINHAS_JUROS').AsInteger - 37 ) mod 38 )  <> 0 then TotPag := TotPag + 1;
          c1 := c1 + ';' + IntToStr( TotPag );
        end;
      end
      else
        c1 := c1 + ';';
      c1 := c1 + ';' + Trim( msk_nr_relatorio.Text ) + ';' + Copy( msk_dt_atual.Text, 7, 4 ) + ';';
      StrPCopy( p1, c1);
      ArqDesp.Write( p1 );

      if Trim( msk_cd_grupo.Text ) <> '' then c1 := Trim( Copy( edt_nm_grupo.Text, 7, 15 ) )
      else c1 := Trim( Copy( edt_nm_cliente.Text, 7, 15 ) );
      c1 := c1 + Enter;
      StrPCopy( p1, c1);
      ArqDesp.Write( p1 );

      qry_tot_juros_.Close;
      c1 := ';;A;;;;;;RELATÓRIO Nº ' + msk_nr_relatorio.Text + '/' + Copy( msk_dt_atual.Text, 7, 4 ) +
            ' DE:;' +  msk_dt_atual.Text + Enter + ';;';
      if Trim( msk_cd_grupo.Text ) <> '' then c1 := c1 + Trim( edt_nm_grupo.Text )
      else c1 := c1 + Trim( edt_nm_cliente.Text );
      c1 := c1 + ';;;;;;REEMBOLSO FINANCEIRO ATÉ:;' + msk_dt_atual.Text + Enter +
                 ';;;;;;;;DATA DE PAGAMENTO:;' + msk_dt_pagto.Text + Enter + Enter +
                 'PEDIDO;NAVIO;PROCESSO;FATURA;ITEM;VALOR;C.P.M.F.;PAGTO;DIAS;REEMBOLSO;AREA' + Enter;
      StrPCopy( p1, c1);
      ArqDesp.Write( p1 );

      // Despesas
      Contador      := 0;
      PrimPag       := True;
      TotAntecipado := 0;
      TotComissao   := 0;
      TotItem       := 0;
      TotCPMF       := 0;
      TotReembolso  := 0;
      qry_rel_fin_desp_.Close;
      qry_rel_fin_desp_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      qry_rel_fin_desp_.Prepare;
      qry_rel_fin_desp_.Open;
      qry_rel_fin_desp_.First;
      while Not qry_rel_fin_desp_.EOF do
      begin
        if MyRound( qry_rel_fin_desp_.FieldByName('VL_ITEM').AsFloat, 2 ) > 0 then
        begin
          c1 := Trim( qry_rel_fin_desp_.FieldByName('CD_REFERENCIA').AsString ) + ';';
          c1 := c1 + Trim( qry_rel_fin_desp_.FieldByName('NM_EMBARCACAO').AsString ) + ';';
          c1 := c1 + Copy( Trim( qry_rel_fin_desp_.FieldByName('NR_PROCESSO').AsString ), 5, 14 ) + ';';
          c1 := c1 + Trim( qry_rel_fin_desp_.FieldByName('NR_FATURA').AsString ) + ';';
          c1 := c1 + Trim( qry_rel_fin_desp_.FieldByName('NM_ITEM').AsString ) + ';';
          c1 := c1 + FormatFloat( '#0,.00', qry_rel_fin_desp_.FieldByName('VL_ITEM').AsFloat ) + ';';
          c1 := c1 + FormatFloat( '#0,.00', qry_rel_fin_desp_.FieldByName('VL_CPMF').AsFloat ) + ';';
          c1 := c1 + Formatdatetime( 'dd/mm/yyyy', qry_rel_fin_desp_.FieldByName('DT_PAGTO').AsDateTime ) + ';';
          c1 := c1 + IntToStr( qry_rel_fin_desp_.FieldByName('NR_DIAS').AsInteger ) + ';';
          c1 := c1 + FormatFloat( '#0,.00', qry_rel_fin_desp_.FieldByName('VL_REEMBOLSO').AsFloat ) + ';';
          c1 := c1 + Trim( qry_rel_fin_desp_.FieldByName('NM_AREA').AsString ) + ';';
          c1 := c1 + Enter;
          StrPCopy( p1, c1);
          ArqDesp.Write( p1 );

          TotItem      := TotItem + qry_rel_fin_desp_.FieldByName('VL_ITEM').AsFloat;
          TotCPMF      := TotCPMF + qry_rel_fin_desp_.FieldByName('VL_CPMF').AsFloat;
          TotReembolso := TotReembolso + qry_rel_fin_desp_.FieldByName('VL_REEMBOLSO').AsFloat;
          Contador := Contador + 1;
          if ( Contador = 36 ) and PrimPag then
          begin
            c1 := ';SOMA OU TOTAL A TRANSPORTAR;;;;' +
                  FormatFloat( '#0,.00', TotItem ) + ';' +
                  FormatFloat( '#0,.00', TotCPMF ) + ';' + ';;' +
                  FormatFloat( '#0,.00', TotReembolso ) + ';' + Enter +
                  'CRFI010;Emitido em ' + FormatDateTime( 'dd/mm/yyyy',Date ) + ' às ' +
                  FormatDateTime( 'hh:mm:ss', Time ) + Enter + Enter;
            StrPCopy( p1, c1);
            ArqDesp.Write( p1 );

            if Not qry_rel_fin_desp_.EOF then
            begin
              c1 := Enter + Enter + Enter + Enter + Enter + Enter;
              PrimPag := False;
              Contador := 0;
              c1 := c1 + ';TRANSPORTE;;;;' +
                    FormatFloat( '#0,.00', TotItem ) + ';' +
                    FormatFloat( '#0,.00', TotCPMF ) + ';' + ';;' +
                    FormatFloat( '#0,.00', TotReembolso ) + ';' + Enter;
              StrPCopy( p1, c1);
              ArqDesp.Write( p1 );
            end;
          end;
        end;

        if ( Contador = 34 ) and ( Not PrimPag ) then
        begin
          c1 := ';SOMA OU TOTAL A TRANSPORTAR;;;;' +
                FormatFloat( '#0,.00', TotItem ) + ';' +
                FormatFloat( '#0,.00', TotCPMF ) + ';' + ';;' +
                FormatFloat( '#0,.00', TotReembolso ) + ';' + Enter +
                'CRFI010;Emitido em ' + FormatDateTime( 'dd/mm/yyyy',Date ) + ' às ' +
                FormatDateTime( 'hh:mm:ss', Time ) + Enter + Enter;
          StrPCopy( p1, c1);
          ArqDesp.Write( p1 );

          qry_rel_fin_desp_.Next;
          if Not qry_rel_fin_desp_.EOF then
          begin
            c1 := Enter + Enter + Enter + Enter + Enter + Enter;
            PrimPag := False;
            Contador := 0;
            c1 := c1 + ';TRANSPORTE;;;;' +
                  FormatFloat( '#0,.00', TotItem ) + ';' +
                  FormatFloat( '#0,.00', TotCPMF ) + ';' + ';;' +
                  FormatFloat( '#0,.00', TotReembolso ) + ';' + Enter;
            StrPCopy( p1, c1);
            ArqDesp.Write( p1 );
          end;
        end
        else
        begin
          qry_rel_fin_desp_.Next;
        end;
      end;
      qry_rel_fin_desp_.Close;

      c1 := '';
      if ( Contador < 36 ) and PrimPag then
      begin
        while Contador <= 34 do
        begin
          c1 := c1 + Enter;
          Contador := Contador + 1;
        end;
        StrPCopy( p1, c1);
        ArqDesp.Write( p1 );

        c1 := ';SOMA OU TOTAL A TRANSPORTAR;;;;' +
              FormatFloat( '#0,.00', TotItem ) + ';' +
              FormatFloat( '#0,.00', TotCPMF ) + ';' + ';;' +
              FormatFloat( '#0,.00', TotReembolso ) + ';' + Enter +
              'CRFI010;Emitido em ' + FormatDateTime( 'dd/mm/yyyy',Date ) + ' às ' +
              FormatDateTime( 'hh:mm:ss', Time ) + Enter + Enter;
        StrPCopy( p1, c1);
        ArqDesp.Write( p1 );

        c1 := 'CRFI010;Emitido em ' + FormatDateTime( 'dd/mm/yyyy',Date ) + ' às ' +
              FormatDateTime( 'hh:mm:ss', Time ) + Enter;
        StrPCopy( p1, c1);
        ArqDesp.Write( p1 );
      end;
      c1 := '';
      if ( Contador < 34 ) and ( Not PrimPag ) then
      begin
        while Contador <= 33 do
        begin
          c1 := c1 + Enter;
          Contador := Contador + 1;
        end;
        StrPCopy( p1, c1);
        ArqDesp.Write( p1 );

        c1 := ';SOMA OU TOTAL A TRANSPORTAR;;;;' +
              FormatFloat( '#0,.00', TotItem ) + ';' +
              FormatFloat( '#0,.00', TotCPMF ) + ';' + ';;' +
              FormatFloat( '#0,.00', TotReembolso ) + ';' + Enter +
              'CRFI010;Emitido em ' + FormatDateTime( 'dd/mm/yyyy',Date ) + ' às ' +
              FormatDateTime( 'hh:mm:ss', Time ) + Enter;
        StrPCopy( p1, c1);
        ArqDesp.Write( p1 );
      end;

      // Totais
      qry_rel_fin_totais_.Close;
      qry_rel_fin_totais_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      qry_rel_fin_totais_.Prepare;
      qry_rel_fin_totais_.Open;
      if qry_rel_fin_totais_.RecordCount > 0 then
      begin
        c1 := Enter + Enter + Enter + Enter + Enter + Enter +
        ';SOMA;;R$;' + FormatFloat( '#0,.00', qry_rel_fin_totais_.FieldByName('VL_SOMA').AsFloat ) + ';' + Enter;
        c1 := c1 + ';C.P.M.F.;;R$;' + FormatFloat( '#0,.00', qry_rel_fin_totais_.FieldByName('VL_CPMF').AsFloat ) + ';' + Enter;
        c1 := c1 + ';COMISSÃO;;R$;' + FormatFloat( '#0,.00', qry_rel_fin_totais_.FieldByName('VL_COMISSAO').AsFloat ) + ';' + Enter;
        c1 := c1 + ';SUB-TOTAL;;R$;' + FormatFloat( '#0,.00', qry_rel_fin_totais_.FieldByName('VL_SUB_TOTAL').AsFloat ) + ';' + Enter;
        c1 := c1 + ';REEMBOLSO DESPESAS FINANCEIRAS;;R$;' + FormatFloat( '#0,.00', qry_rel_fin_totais_.FieldByName('VL_REEMBOLSO').AsFloat ) + ';' + Enter;
        c1 := c1 + ';TOTAL;;R$;' + FormatFloat( '#0,.00', qry_rel_fin_totais_.FieldByName('VL_TOTAL').AsFloat ) + ';' + Enter;
        c1 := c1 + Enter;
        Contador := 1;
        while Contador <= 30 do
        begin
          c1 := c1 + Enter;
          Contador := Contador + 1;
        end;
        StrPCopy( p1, c1);
        ArqDesp.Write( p1 );

        c1 := 'CRFI010;Emitido em ' + FormatDateTime( 'dd/mm/yyyy',Date ) + ' às ' +
              FormatDateTime( 'hh:mm:ss', Time ) + Enter;

        StrPCopy( p1, c1);
        ArqDesp.Write( p1 );
      end;
      qry_rel_fin_totais_.Close;

      // Resumo
      c1 := ';;;RESUMO' + Enter + ';;;( TOTAL DE CADA PEDIDO ) ' +
            Enter + Enter + ';;;VALORES' + Enter + 'PEDIDO;FATURA;ANTECIPADO;N/PAGTO;C.P.M.F.;REEMBOLSO;COMISSÃO' + Enter;
      StrPCopy( p1, c1);
      ArqDesp.Write( p1 );

      qry_rel_fin_resumo_.Close;
      qry_rel_fin_resumo_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
      qry_rel_fin_resumo_.Prepare;
      qry_rel_fin_resumo_.Open;
      qry_rel_fin_resumo_.First;
      while Not qry_rel_fin_resumo_.EOF do
      begin
        c1 := Trim( qry_rel_fin_resumo_.FieldByName('CD_REFERENCIA').AsString ) + ';';
        c1 := c1 + Trim( qry_rel_fin_resumo_.FieldByName('NR_FATURA').AsString ) + ';';
        c1 := c1 + FormatFloat( '#0,.00', qry_rel_fin_resumo_.FieldByName('VL_ANTECIPADO').AsFloat ) + ';';
        c1 := c1 + FormatFloat( '#0,.00', qry_rel_fin_resumo_.FieldByName('VL_ITEM').AsFloat ) + ';';
        c1 := c1 + FormatFloat( '#0,.00', qry_rel_fin_resumo_.FieldByName('VL_CPMF').AsFloat ) + ';';
        c1 := c1 + FormatFloat( '#0,.00', qry_rel_fin_resumo_.FieldByName('VL_REEMBOLSO').AsFloat ) + ';';
        c1 := c1 + FormatFloat( '#0,.00', qry_rel_fin_resumo_.FieldByName('VL_COMISSAO').AsFloat ) + ';';
        c1 := c1 + Enter;
        StrPCopy( p1, c1);
        ArqDesp.Write( p1 );
        TotAntecipado := TotAntecipado + qry_rel_fin_resumo_.FieldByName('VL_ANTECIPADO').AsFloat;
        TotComissao   := TotComissao + qry_rel_fin_resumo_.FieldByName('VL_COMISSAO').AsFloat;

        qry_rel_fin_resumo_.Next;
      end;
      qry_rel_fin_resumo_.Close;

      c1 := ';;' +
              FormatFloat( '#0,.00', TotAntecipado ) + ';' +
              FormatFloat( '#0,.00', TotItem ) + ';' +
              FormatFloat( '#0,.00', TotCPMF ) + ';' +
              FormatFloat( '#0,.00', TotReembolso ) + ';' +
              FormatFloat( '#0,.00', TotComissao ) + ';' + Enter;
        StrPCopy( p1, c1);
        ArqDesp.Write( p1 );

      // Juros
      c1 := ';ÍNDICES' + Enter + 'DATA;VALOR;JUROS;ACUMULADO' + Enter;
      StrPCopy( p1, c1);
      ArqDesp.Write( p1 );

      qry_rel_fin_juros_.Close;
      qry_rel_fin_juros_.ParamByName('CD_MOEDA_JUROS').AsString := msk_cd_moeda_juros.Text;
      qry_rel_fin_juros_.Prepare;
      qry_rel_fin_juros_.Open;
      while Not qry_rel_fin_juros_.EOF do
      begin
        c1 := FormatDateTime( 'dd/mm/yyyy', qry_rel_fin_juros_.FieldByName('DT_JUROS').AsDateTime ) + ';';
        c1 := c1 + FormatFloat( '#0,.0000', qry_rel_fin_juros_.FieldByName('VL_INDICE').AsFloat ) + ';';
        c1 := c1 + FormatFloat( '#0,.0000000', qry_rel_fin_juros_.FieldByName('VL_JUROS').AsFloat ) + ';';
        c1 := c1 + FormatFloat( '#0,.0000000', qry_rel_fin_juros_.FieldByName('VL_ACUMULADO').AsFloat ) + ';';
        c1 := c1 + Enter;

        StrPCopy( p1, c1);
        ArqDesp.Write( p1 );

        qry_rel_fin_juros_.Next;
      end;
      qry_rel_fin_juros_.Close;

      ArqDesp.Close;
      ArqDesp.Free;

      ShellExecute( Application.Handle, 'Open', 'EXCEL.EXE', PChar( cDir_Rpt + '\BASF.XLS' ), '', SW_MAXIMIZE );

    except
      BoxMensagem( 'Falha na geração do arquivo!', 2 );

    end;
  end;
end;


procedure Tfrm_sel_unid_prod_fin.GeraDemCliente( nr_identificador : Integer );
var
  Excel, xlWorkB, oSheet: OleVariant;
  nLinha, cabec : Integer;
begin

  Application.ProcessMessages;
  with datm_sel_unid_prod_fin do
  begin
    try
     Excel := CreateOLEObject('Excel.Application');

      xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_DEM_CLIENTE.XLS' );

      Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_DEM_CLIENTE_' +
      Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

      oSheet := Excel.WorkBooks[1].Worksheets[1];
    except
      begin
        BoxMensagem('Erro na criação da Planilha.', 2) ;
        Exit;
      end
    end;

    //filtros da planilha
    oSheet.Cells[ 02, 04 ].value := 'Unidade : ' + edt_nm_unid_neg.text;
    oSheet.Cells[ 02, 04 ].Font.Bold := True;

    if Trim( msk_cd_grupo.Text ) <> '' then
      oSheet.Cells[ 03, 04 ].value := 'Grupo : ' + edt_nm_grupo.text
    else
      oSheet.Cells[ 03, 04 ].value := 'Cliente : ' + edt_nm_cliente.text;

    oSheet.Cells[ 03, 04 ].Font.Bold := True;
    oSheet.Cells[ 04, 04 ].value := 'Demonstrativo para Clientes' ;
    oSheet.Cells[ 04, 04 ].Font.Bold := True;

    nLinha := 10;
    // Alimenta a planilha

    //Importação
    qry_rel_dem_cliente_.Close;
    qry_rel_dem_cliente_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
    qry_rel_dem_cliente_.Prepare;
    qry_rel_dem_cliente_.Open;

    if Not qry_rel_dem_cliente_.EOF then
    begin
      if cabec = 0 then
      begin
        nLinha := nLinha + 1;
        oSheet.Cells[ nLinha, 01 ].value := 'IMPORTAÇÃO';
        nLinha := nLinha + 1;
        oSheet.Cells[ nLinha, 04 ].value := 'Remessas';
        oSheet.Cells[ nLinha, 06 ].value := 'Pagamentos';
        nLinha := nLinha + 1;
        oSheet.Cells[ nLinha, 01 ].value := 'N/Registro';
        oSheet.Cells[ nLinha, 02 ].value := 'S/Pedido';
        oSheet.Cells[ nLinha, 03 ].value := 'S.P.E.';
        oSheet.Cells[ nLinha, 04 ].value := 'Data';
        oSheet.Cells[ nLinha, 05 ].value := 'Valor Remessa';
        oSheet.Cells[ nLinha, 06 ].value := 'Valor / Despesas';
        cabec := 1;
      end;
      while not qry_rel_dem_cliente_.EOF do
      begin

      nLinha := nLinha + 1;
      oSheet.Cells[ nLinha, 1 ].value := qry_rel_dem_cliente_NR_PROCESSO.AsString;
      oSheet.Cells[ nLinha, 2 ].value := qry_rel_dem_cliente_CD_REFERENCIA.AsString;
      oSheet.Cells[ nLinha, 4 ].value := qry_rel_dem_cliente_DT_REMESSA.AsDateTime;
      oSheet.Cells[ nLinha, 5 ].value := qry_rel_dem_cliente_VL_REMESSA.AsFloat;
      oSheet.Cells[ nLinha, 6 ].value := qry_rel_dem_cliente_VL_DESPESA.AsFloat;

      qry_rel_dem_cliente_.next;
      end;
    end;
    cabec := 0;
    qry_rel_dem_cliente_.close;

    //Exportação
    qry_rel_dem_cliente_exp_.Close;
    qry_rel_dem_cliente_exp_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
    qry_rel_dem_cliente_exp_.Prepare;
    qry_rel_dem_cliente_exp_.Open;


    if Not qry_rel_dem_cliente_exp_.EOF then
    begin
      if cabec = 0 then
      begin
        nLinha := nLinha + 1;
        oSheet.Cells[ nLinha, 01 ].value := 'EXPORTAÇÃO';

        nLinha := nLinha + 1;
        oSheet.Cells[ nLinha, 04 ].value := 'Remessas';
        oSheet.Cells[ nLinha, 06 ].value := 'Pagamentos';
        nLinha := nLinha + 1;
        oSheet.Cells[ nLinha, 01 ].value := 'N/Registro';
        oSheet.Cells[ nLinha, 02 ].value := 'S/Pedido';
        oSheet.Cells[ nLinha, 03 ].value := 'S.P.E.';
        oSheet.Cells[ nLinha, 04 ].value := 'Data';
        oSheet.Cells[ nLinha, 05 ].value := 'Valor Remessa';
        oSheet.Cells[ nLinha, 06 ].value := 'Valor / Despesas';
        cabec := 1;
      end;
      while not qry_rel_dem_cliente_exp_.EOF do
      begin

      nLinha := nLinha + 1;
      oSheet.Cells[ nLinha, 1 ].value := qry_rel_dem_cliente_exp_NR_PROCESSO.AsString;
      oSheet.Cells[ nLinha, 2 ].value := qry_rel_dem_cliente_exp_CD_REFERENCIA.AsString;
      oSheet.Cells[ nLinha, 4 ].value := qry_rel_dem_cliente_exp_DT_REMESSA.AsDateTime;
      oSheet.Cells[ nLinha, 5 ].value := qry_rel_dem_cliente_exp_VL_REMESSA.AsFloat;
      oSheet.Cells[ nLinha, 6 ].value := qry_rel_dem_cliente_exp_VL_DESPESA.AsFloat;
      qry_rel_dem_cliente_.next;
      end;
    end;
    qry_rel_dem_cliente_.close;

    Screen.Cursor := crDefault;

    Excel.Visible := True;

    // Envia msg de sucesso
    ShowMessage('Planilha gerada com sucesso');

    Screen.Cursor := crDefault;
    Application.ProcessMessages;
  end;

end;

procedure Tfrm_sel_unid_prod_fin.GeraRecLiq( nr_identificador : Integer );
var
  Excel, xlWorkB, oSheet: OleVariant;
  nLinha : Integer;
  cd_grupo, nm_grupo : String;
  VlReceita, VlReceitaTot, VlSaldo, VlSaldoTot : Double;
begin
  Application.ProcessMessages;
  with datm_sel_unid_prod_fin do
  begin
    try
     Excel := CreateOLEObject('Excel.Application');

      xlWorkB := Excel.Workbooks.Open( cDir_RPT + '\REL_REC_LIQ.XLS' );

      Excel.ActiveWorkBook.SaveAs(cDir_RPT + '\REL_REC_LIQ_' +
      Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.XLS');

      oSheet := Excel.WorkBooks[1].Worksheets[1];
    except
      begin
        BoxMensagem('Erro na criação da Planilha.', 2) ;
        Exit;
      end
    end;

    //filtros da planilha
    oSheet.Cells[ 02, 03 ].value := 'Unidade : ' + ConsultaLookUp('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.text, 'AP_UNID_NEG');
    oSheet.Cells[ 02, 03 ].Font.Bold := True;
    if Trim( msk_cd_produto.Text ) <> '' then
    begin
      oSheet.Cells[ 03, 03 ].value := 'Produto : ' + edt_nm_produto.text;
      oSheet.Cells[ 03, 03 ].Font.Bold := True;
    end;

    if Trim( msk_cd_grupo.Text ) <> '' then
      oSheet.Cells[ 04, 03 ].value := 'Grupo : ' + edt_nm_grupo.text
    else
      oSheet.Cells[ 04, 03 ].value := 'Cliente : ' + edt_nm_cliente.text;
    oSheet.Cells[ 04, 03 ].Font.Bold := True;

    oSheet.Cells[ 05, 03 ].value := 'Período : ' + msk_dt_atual.text + '  à  ' +  msk_dt_pagto.text;
    oSheet.Cells[ 05, 03 ].Font.Bold := True;
    oSheet.Cells[ 06, 03 ].value := 'Receitas Liquidadas' ;
    oSheet.Cells[ 06, 03 ].Font.Bold := True;

    nLinha := 10;
    // Alimenta a planilha

    //Importação
    qry_rel_rec_liq_.Close;
    qry_rel_rec_liq_.ParamByName('NR_IDENTIFICADOR').AsInteger := nr_identificador;
    qry_rel_rec_liq_.Prepare;
    qry_rel_rec_liq_.Open;

    VlReceitaTot := 0;
    VlSaldoTot := 0;
    VlReceita := 0;
    VlSaldo := 0;
    if Not qry_rel_rec_liq_.EOF then                      
    begin
      nLinha := nLinha + 1;
      if Trim( msk_cd_grupo.Text ) <> '' then
        oSheet.Cells[ nLinha, 01 ].value := 'Grupo'
      else
        oSheet.Cells[ nLinha, 01 ].value := 'Cliente';
      oSheet.Cells[ nLinha, 02 ].value := 'Receita';
      oSheet.Cells[ nLinha, 03 ].value := 'Saldo Operacional';

      cd_grupo := qry_rel_rec_liq_CD_GRUPO.AsString;
      nm_grupo := qry_rel_rec_liq_NM_CLIENTE.AsString;
      while not qry_rel_rec_liq_.EOF do
      begin
        nLinha := nLinha + 1;
        if cd_grupo <> qry_rel_rec_liq_CD_GRUPO.AsString then
        begin
          cd_grupo := qry_rel_rec_liq_CD_GRUPO.AsString;
          oSheet.Cells[ nLinha, 01 ].value := 'Total ' + nm_grupo;
          nm_grupo := qry_rel_rec_liq_NM_CLIENTE.AsString;
          oSheet.Cells[ nLinha, 01 ].Font.Bold := True;
          oSheet.Cells[ nLinha, 2 ].value := VlReceita;
          oSheet.Cells[ nLinha, 3 ].value := VlSaldo;
          VlReceitaTot := VlReceitaTot + VlReceita;
          VlSaldoTot := VlSaldoTot + VlSaldo;
          VlReceita := 0;
          VlSaldo := 0;
          nLinha := nLinha + 2;
        end;

        if Trim( msk_cd_grupo.Text ) <> '' then
          oSheet.Cells[ nLinha, 1 ].value := qry_rel_rec_liq_NM_GRUPO.AsString
        else
          oSheet.Cells[ nLinha, 1 ].value := qry_rel_rec_liq_NM_CLIENTE.AsString;

        oSheet.Cells[ nLinha, 2 ].value := qry_rel_rec_liq_VL_RECEITA.AsFloat;
        VlReceita := VlReceita + qry_rel_rec_liq_VL_RECEITA.AsFloat;

        oSheet.Cells[ nLinha, 3 ].value := qry_rel_rec_liq_VL_SALDO.AsFloat;
        VlSaldo := VlSaldo + qry_rel_rec_liq_VL_SALDO.AsFloat;

        qry_rel_rec_liq_.next;
      end;
      nLinha := nLinha + 1;
      oSheet.Cells[ nLinha, 01 ].value := 'Total ' + nm_grupo;
      oSheet.Cells[ nLinha, 01 ].Font.Bold := True;
      oSheet.Cells[ nLinha, 2 ].value := VlReceita;
      oSheet.Cells[ nLinha, 3 ].value := VlSaldo;
      VlReceitaTot := VlReceitaTot + VlReceita;
      VlSaldoTot := VlSaldoTot + VlSaldo;

    end;
    qry_rel_rec_liq_.close;

    nLinha := nLinha + 2;
    oSheet.Cells[ nLinha, 1 ].value := 'TOTAL RECEITAS LIQUIDADAS';
    oSheet.Cells[ nLinha, 1 ].Font.Bold := True;
    oSheet.Cells[ nLinha, 2 ].value := VlReceitaTot;
    oSheet.Cells[ nLinha, 3 ].value := VlSaldoTot;

    Screen.Cursor := crDefault;

    Excel.Visible := True;

    // Envia msg de sucesso
    ShowMessage('Planilha gerada com sucesso');

    Screen.Cursor := crDefault;
    Application.ProcessMessages;
  end;
end;
//ANDRÉ 21/07/2010
end.

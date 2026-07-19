(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGFT005.PAS - Formulário - Impressão de Fatura/Nota Fiscal de Serviço
DATA: 01/01/1999
Manutenção Data: 30/08/2006
*************************************************************************************************)

unit PGFT005;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, UCRPE32, DBCtrls, DBCGrids, Grids,
  DBGrids, Menus, DosLib, ComCtrls, DBTables, RAWPrinter, Printers, Funcoes,
  ConsOnlineEx, StrUtils, IdMessage, IdSmtp;

type
  Tfrm_sel_fat = class(TForm)
    Panel1: TPanel;
    lbl_data: TLabel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;

    msk_data: TMaskEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    pnl_cadastro: TPanel;
    btn_imprimir: TSpeedButton;
    btn_sair: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_imprime: TMenuItem;
    mi_sair: TMenuItem;
    crp_fat: TCrpe;
    msk_nr_fat: TMaskEdit;
    Label2: TLabel;
    lbl_tipo_nf_serv: TLabel;
    cbo_tipo_nf_serv: TComboBox;
    pgctrl_sel_fat: TPageControl;
    ts_sol: TTabSheet;
    dbgrdSol: TDBGrid;
    dbgrd_proc: TDBGrid;
    ts_adm: TTabSheet;
    dbgrd_adm: TDBGrid;
    btn_desmarca_todas: TSpeedButton;
    btn_marca_todas: TSpeedButton;
    mi_marca_todas: TMenuItem;
    mi_desmarca_todas: TMenuItem;
    lbl_nr_solicitacao: TLabel;
    msk_nr_solicitacao: TMaskEdit;
    lbl_nr_nf: TLabel;
    msk_nr_nf: TMaskEdit;
    lbl_nr_ndc: TLabel;
    msk_nr_ndc: TMaskEdit;                                                                                                          
    lbl_nr_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    msk_cd_referencia: TMaskEdit;
    lbl_cd_referencia: TLabel;
    chk_inc_canc: TCheckBox;
    btn_preview_rateio_desp: TSpeedButton;
    mi_preview_rateio_desp: TMenuItem;
    mmNf: TMemo;
    qry_nf2: TQuery;
    qry_nf2C1: TIntegerField;
    qry_nf2C2: TIntegerField;
    qry_nf2C3: TStringField;
    qry_nf2C5: TStringField;
    qry_nf2C6: TIntegerField;
    qry_nf2C7: TIntegerField;
    qry_nf2C8: TStringField;
    qry_nf2C9: TStringField;
    qry_nf2C10: TStringField;
    qry_nf2C11: TStringField;
    qry_nf2C12: TStringField;
    qry_nf2C13: TStringField;
    qry_nf2C14: TStringField;
    qry_nf2C15: TStringField;
    qry_nf2C16: TStringField;
    qry_nf2C17: TStringField;
    qry_nf2C18: TStringField;
    qry_nf2C19: TStringField;
    qry_nf2C20: TStringField;
    qry_nf2C21: TStringField;
    qry_nf2C22: TStringField;
    qry_nf2C23: TStringField;
    qry_nf2C24: TStringField;
    qry_nf2C25: TStringField;
    qry_nf2C26: TStringField;
    qry_nf2C27: TStringField;
    qry_nf2C28: TStringField;
    qry_nf2C29: TStringField;
    qry_nf2C30: TStringField;
    qry_nf2C31: TFloatField;
    qry_nf2C32: TIntegerField;
    qry_nf2C33: TIntegerField;
    qry_nf2C34: TIntegerField;
    qry_nf2C35: TFloatField;
    qry_nf2C36: TFloatField;
    qry_nf2C37: TIntegerField;
    qry_nf2C38: TFloatField;
    qry_nf2C39: TFloatField;
    qry_nf2C40: TIntegerField;
    qry_nf2C41: TFloatField;
    qry_nf2C42: TIntegerField;
    qry_nf2C43: TStringField;
    qry_nf2C44: TStringField;
    qry_nf2C45: TStringField;
    qry_nf2C46: TStringField;
    qry_nf2C47: TStringField;
    qry_nf2C48: TStringField;
    qry_nf2C49: TStringField;
    qry_nf1: TQuery;
    qry_nf1C1: TIntegerField;
    qry_nf1C2: TStringField;
    qry_nf1C3: TStringField;
    qry_nf1C4: TStringField;
    qry_nf1C5: TStringField;
    qry_nf1C6: TStringField;
    qry_nf1C7: TStringField;
    qry_nf2C4: TStringField;
    msk_data_fim: TMaskEdit;
    Label1: TLabel;
    pnlResumo: TPanel;
    mmResumo: TMemo;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    btnGeratxt: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_dataExit(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    function  Consiste : Boolean;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure msk_nr_fatChange(Sender: TObject);
    procedure msk_dataEnter(Sender: TObject);
    procedure cbo_tipo_nf_servChange(Sender: TObject);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure dbgrdSolKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_nr_solicitacaoEnter(Sender: TObject);
    procedure msk_nr_nfEnter(Sender: TObject);
    procedure msk_nr_ndcEnter(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure msk_cd_referenciaEnter(Sender: TObject);
    procedure msk_nr_solicitacaoExit(Sender: TObject);
    procedure msk_nr_nfExit(Sender: TObject);
    procedure msk_nr_ndcExit(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_cd_referenciaExit(Sender: TObject);
    procedure chk_inc_cancExit(Sender: TObject);
    procedure chk_inc_cancClick(Sender: TObject);
    procedure btn_preview_rateio_despClick(Sender: TObject);
    function VporPDecimal(Valor:String):String;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnGeratxtClick(Sender: TObject);
  private
    function Gera_Arquivo_SERVICO : Boolean;
    procedure GeraCabecNFServ( tp_nota : Integer );
    procedure GeraRodapeNFServ;
    procedure Gera_Cabec2;
    procedure ValorNumerario;
  public
    tp_tipo_fat   : String;
    model_fat     : String;
    PreviewFatura : Boolean;
  end;

var
  frm_sel_fat: Tfrm_sel_fat;
  nr_docto_nota : String[6];
  nr_ult_nota : String[6];
  nr_ult_nota_fat : String[6];
  nr_ult_nota_adm : String[6];
  nr_ult_fat : Integer;
  nr_ult_nf_serv : Integer;
  nr_ult_nf_serv_fat : Integer;
  nr_ult_nf_serv_adm : Integer;
  Saida : String;
  Txt : TextFile;
  st_unid_neg, st_prod : String[2];
  st_nr_solicitacao, st_nr_nf, st_nr_ndc, st_nr_processo, st_cd_referencia, vReferencias: String;
  nLinhas : Integer;
  nTotal, VlSubTotal, VlComissao, VlIRRF, VlISS, VlNumerario, VlOutros,
  VlSaldoCredor, VlSaldoDevedor, VlCIF, VlCIFMN, VlNum : Double;
  str_cr, str_proc : String;
  cDescr1, cDescr2, cDocs : TStringlist;
  lEntrou, lMaisProc : Boolean;
  dt_fatura, cControla, cControla2, cTexto : String;
  nMult : Integer;
  nTotDesp : Integer;
  vl_total_nota, vl_total_ir, vl_aliq_ir, vl_tot_iss : Double;
  cNomeTxt : String;
  lPInicial : Boolean;
  lPulo : Boolean;
implementation

{$R *.DFM}

uses GSMLIB, FILETEXT, PGGP001, PGGP017, PGFT006, PGSM010, PGSM018, uIntegraNotaBasf, PGSM990;

procedure Tfrm_sel_fat.btn_sairClick(Sender: TObject);
begin
  if datm_sel_fat.qry_fat_sol_.State in [dsInsert, dsEdit] then datm_sel_fat.qry_fat_sol_.Post;
  Close;
end;

procedure Tfrm_sel_fat.msk_cd_unid_negExit(Sender: TObject);
var nN1, nN2, nN3, Code : Integer;
begin
  if Trim( msk_cd_unid_neg.Text ) = st_unid_neg then Exit;
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_sel_fat do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '"';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;

        if ( tp_tipo_fat = 'F' ) then  // Fatura Despesa
        begin
          qry_ult_fat_.Close;
          qry_ult_fat_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
          qry_ult_fat_.Prepare;
          qry_ult_fat_.Open;
          if ( qry_ult_fat_.RecordCount = 0 ) or ( qry_ult_fat_NR_ULT_FATURA.AsString = '' ) then
          begin
            qry_ult_fat_unid_.Close;
            qry_ult_fat_unid_.ParamByName( 'CD_UNID_NEG' ).AsString := msk_cd_unid_neg.Text;
            qry_ult_fat_unid_.Prepare;
            qry_ult_fat_unid_.Open;

            msk_nr_fat.Text := qry_ult_fat_unid_NR_NOTA_FATURA.AsString;
          end
          else
          begin
            if qry_ult_fat_NR_ULT_FATURA.AsString <> '' then
               msk_nr_fat.Text := Replicate( '0', 6 - Length( IntToStr( StrToInt( qry_ult_fat_NR_ULT_FATURA.AsString ) + 1 ) ) ) +
                                  IntToStr( StrToInt( qry_ult_fat_NR_ULT_FATURA.AsString ) + 1 )
            else
               msk_nr_fat.Text := '000001';
          end;
        end;

        if ( tp_tipo_fat = 'D' ) or ( tp_tipo_fat = 'C' ) then  // Demonstrativo Despesas / Demonstrativo Despesas Complementar
        begin
          qry_ult_dem_.Close;
          qry_ult_dem_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
          qry_ult_dem_.Prepare;
          qry_ult_dem_.Open;
          if ( qry_ult_dem_.RecordCount = 0 ) then
          begin
            msk_nr_fat.Text := '000001';
          end
          else
          begin
            if qry_ult_dem_NR_ULT_DEM.AsString <> '' then
               msk_nr_fat.Text := Replicate( '0', 6 - Length( IntToStr( StrToInt( qry_ult_dem_NR_ULT_DEM.AsString ) + 1 ) ) ) +
                                  IntToStr( StrToInt( qry_ult_dem_NR_ULT_DEM.AsString ) + 1 )
            else
               msk_nr_fat.Text := '000001';
          end;
        end;

        if tp_tipo_fat = 'N' then // Nota de Crédito/Débito
        begin
          nr_ult_nota := '';
          qry_ult_nota_fat_.Close;
          qry_ult_nota_fat_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
          qry_ult_nota_fat_.Prepare;
          qry_ult_nota_fat_.Open;
          if Not qry_ult_nota_fat_.EOF then
             nr_ult_nota_fat := IntToStr( StrToInt( qry_ult_nota_fat_NR_NOTA_FAT.AsString ) )
          else
             nr_ult_nota_fat := '';
          qry_ult_nota_fat_.Close;
          FastExecSQL(' UPDATE TAJUSTE_IMPRESSAO_NF_SERV_INDAIA SET NR_ULT_NOTA_DEB = '''+nr_ult_nota_fat+''' WHERE CD_UNID_NEG = '''+Trim( msk_cd_unid_neg.Text )+''' ');

          qry_ult_nota_adm_.Close;
          qry_ult_nota_adm_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
          qry_ult_nota_adm_.Prepare;
          qry_ult_nota_adm_.Open;
          if Not qry_ult_nota_adm_.EOF then
          begin
            if Trim( qry_ult_nota_adm_NR_NOTA_ADM.AsString ) <> '' then
              nr_ult_nota_adm := IntToStr( StrToInt( qry_ult_nota_adm_NR_NOTA_ADM.AsString ) )
            else
              nr_ult_nota_adm := '';
          end
          else
          begin
            nr_ult_nota_adm := '';
          end;
          qry_ult_nota_adm_.Close;

          Val( nr_ult_nota, nN1, Code );
          Val( nr_ult_nota_fat, nN2, Code );
          Val( nr_ult_nota_adm, nN3, Code );

          nr_docto_nota := nr_ult_nota_adm;
          if ( nN1 > nN2 ) and ( nN1 > nN3 ) then
             nr_docto_nota := nr_ult_nota;

          if ( nN2 > nN1 ) and ( nN2 > nN3 ) then
             nr_docto_nota := nr_ult_nota_fat;

          if nr_docto_nota = '' then nr_docto_nota := '0';

          if ( Trim( nr_docto_nota ) <> '' ) then nr_docto_nota := IntToStr( StrToInt( nr_docto_nota ) + 1 );
          nr_docto_nota := Replicate( '0' , 6 - Length( Trim( nr_docto_nota ) ) ) + Trim( nr_docto_nota );

          msk_nr_fat.Text := nr_docto_nota;
        end
        else
        if tp_tipo_fat = 'S' then
          btnGeratxt.Visible := msk_cd_unid_neg.Text = '02';
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
  msk_dataExit(nil);
end;

procedure Tfrm_sel_fat.msk_cd_produtoExit(Sender: TObject);
begin
  if Trim( msk_cd_produto.Text ) = st_prod then Exit;
  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_sel_fat do
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
  msk_dataExit(nil);
end;

procedure Tfrm_sel_fat.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_sel_fat do
  begin
    Application.CreateForm( Tfrm_unidade, frm_unidade );
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

procedure Tfrm_sel_fat.btn_co_produtoClick(Sender: TObject);
begin
  with datm_sel_fat do
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
procedure Tfrm_sel_fat.msk_dataExit(Sender: TObject);
var
  dt_selecao : TDateTime;
begin
  with datm_sel_fat do
  begin
    if pgctrl_sel_fat.ActivePage = ts_sol then
    begin
      qry_grd_sol_.Close;
      qry_grd_sol_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_grd_sol_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
      try
        dt_selecao := StrToDate(msk_data.Text);
        qry_grd_sol_.ParamByName('DT_FATURA_INI').AsDate     := dt_selecao;
        qry_grd_sol_.ParamByName('DT_FATURA_FIM').AsDate     := StrToDate(msk_data_fim.Text);
      except
        qry_grd_sol_.ParamByName('DT_FATURA_INI').Clear;
        qry_grd_sol_.ParamByName('DT_FATURA_FIM').Clear;
      end;
      qry_grd_sol_.ParamByName('TP_TIPO_FAT').AsString := tp_tipo_fat;
      if PreviewFatura then
      begin
        qry_grd_sol_.ParamByName('NR_SOLICITACAO').AsString := Trim( msk_nr_solicitacao.Text );
        qry_grd_sol_.ParamByName('NR_NF').AsString          := Trim( msk_nr_nf.Text );
        if Trim( msk_nr_processo.Text ) <> '' then
           qry_grd_sol_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                               Trim( msk_cd_produto.Text ) +
                                                               Trim( msk_nr_processo.Text )
        else
           qry_grd_sol_.ParamByName('NR_PROCESSO').AsString := '';
        qry_grd_sol_.ParamByName('CD_REFERENCIA').AsString  := Trim( msk_cd_referencia.Text );
        if chk_inc_canc.Checked then
           qry_grd_sol_.ParamByName('IN_CANCELADO').AsString := 'X'
        else
           qry_grd_sol_.ParamByName('IN_CANCELADO').AsString := '';
      end
      else
      begin
        qry_grd_sol_.ParamByName('NR_SOLICITACAO').AsString := '';
        qry_grd_sol_.ParamByName('NR_NF').AsString          := '';
        qry_grd_sol_.ParamByName('NR_PROCESSO').AsString    := '';
        qry_grd_sol_.ParamByName('CD_REFERENCIA').AsString  := '';
        qry_grd_sol_.ParamByName('IN_CANCELADO').AsString   := '';
      end;

      if frm_sel_fat.tp_tipo_fat = 'F' then
      begin
        qry_grd_sol_.SQL[35] := ' AND ((SELECT COUNT(F1.CD_ITEM) FROM TS_FATURA_PROCESSO_ITEM F1 INNER JOIN TITEM I ON I.CD_ITEM = F1.CD_ITEM AND I.IN_TRIBUTAVEL = ''1''';
        qry_grd_sol_.SQL[36] := ' WHERE F.CD_UNID_NEG = F1.CD_UNID_NEG AND F.CD_PRODUTO = F1.CD_PRODUTO  AND F.NR_SOLICITACAO = F1.NR_SOLICITACAO) = 0)';
      end
      else
      begin
        qry_grd_sol_.SQL[35] := '';
        qry_grd_sol_.SQL[36] := '';
      end;

      qry_grd_sol_.ParamByName('NR_NOTA_FATURA').AsString := Trim( msk_nr_ndc.Text );
      qry_grd_sol_.Prepare;
      qry_grd_sol_.Open;

      qry_fat_sol_.Close;
      qry_fat_sol_.Prepare;
      qry_fat_sol_.Open;

      qry_processo_.Close;
      qry_processo_.Prepare;
      qry_processo_.Open;
    end
    else
    begin
      dt_selecao := StrToDate(msk_data.Text);

      qry_grd_adm_.Close;
      qry_grd_adm_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_grd_adm_.ParamByName('DT_PAGTO').AsDate      := dt_selecao;
      qry_grd_adm_.Prepare;
      qry_grd_adm_.Open;

      qry_fav_adm_.Close;
      qry_fav_adm_.Prepare;
      qry_fav_adm_.Open;
    end
  end;
end;
{$HINTS ON}

procedure Tfrm_sel_fat.btn_imprimirClick(Sender: TObject);
var
  i : Integer;
  nr_identificador : Integer;
  str_cd_itens, nr_processo : String;
  dt_desemb : TDateTime;
  VlComissao : Double;
  vCNPJUnidade : String;
begin
  nr_identificador := 0;

  if Not Consiste then Exit;

  with datm_sel_fat, crp_fat do
  begin
    if Trim( msk_cd_unid_neg.Text ) = '' then
    begin
      BoxMensagem( 'Informe a Unidade de Negócio!', 2 );
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;

    if ( tp_tipo_fat = 'F' ) or ( tp_tipo_fat = 'N' ) or ( tp_tipo_fat = 'B' ) or
       ( ( tp_tipo_fat = 'S' ) and ( cbo_tipo_nf_serv.ItemIndex = 0 ) ) then
    begin
      if Trim( msk_cd_produto.Text ) = '' then
      begin
        BoxMensagem( 'Informe o Produto!', 2 );
        Exit;
      end;
    end;

    if ( ( tp_tipo_fat = 'F' ) or ( tp_tipo_fat = 'D' ) or ( tp_tipo_fat = 'C' ) ) and ( Trim( msk_nr_fat.Text ) = '' ) then
    begin
      BoxMensagem( 'Informe o nº da Fatura!', 2 );
      Exit;
    end;

    if ( tp_tipo_fat = 'N' ) and ( Trim( msk_nr_fat.Text ) = '' ) then
    begin
      BoxMensagem( 'Informe o nº da Nota de Débito/Crédito!', 2 );
      Exit;
    end;

    if PreviewFatura then
    begin
      try
        datm_main.db_broker.StartTransaction;
        for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
        begin
          TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
          qry_fat_sol_.Close;
          qry_fat_sol_.Prepare;
          qry_fat_sol_.Open;
          with datm_sel_fat do
          begin
            CloseStoredProc( sp_rel_prev_fat );
            with sp_rel_prev_fat do
            begin
              ParamByName('@CD_UNID_NEG').AsString    := msk_cd_unid_neg.Text;
              ParamByName('@CD_PRODUTO').AsString     := msk_cd_produto.Text;
              ParamByName('@NR_SOLICITACAO').AsString := qry_fat_sol_NR_SOLICITACAO.AsString;
            end;
            ExecStoredProc( sp_rel_prev_fat );
            nr_identificador := sp_rel_prev_fat.ParamByName('@nr_identificador').AsInteger;
            CloseStoredProc( sp_rel_prev_fat );
          end;
        end;
        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        if ( tp_tipo_fat = 'D' ) or ( tp_tipo_fat = 'C' ) or ( tp_tipo_fat = 'F' ) then
           BoxMensagem( 'Erro ao tentar imprimir faturas!', 2 )
        else
           BoxMensagem( 'Erro ao tentar imprimir Notas!', 2 );
        Exit;
      end;

      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;

      Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      ReportName  := cDir_Rpt + '\CRFT023.RPT';
      Formulas[0] := 'NrIdentificador = ' + Trim( IntToStr( nr_identificador ) );
      Execute;

      ApagaDados( 'TTEMP_PREV_FAT_PROC', nr_identificador );
      ApagaDados( 'TTEMP_PREV_FAT_ITEM', nr_identificador );

      Screen.Cursor := crDefault;
    end
    else
    begin
      vCNPJUnidade := ConsultaLookUPSQL(' SELECT CGC_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG = '''+msk_cd_unid_neg.Text+''' ', 'CGC_UNID_NEG');
      // Fatura/Demonstrativo/Nota
      if ( tp_tipo_fat = 'F' ) or ( tp_tipo_fat = 'D' ) or ( tp_tipo_fat = 'C' ) or ( tp_tipo_fat = 'N' ) then
      begin
        msk_cd_unid_neg.SetFocus;
        try
          datm_main.db_broker.StartTransaction;
          if dbgrdSol.SelectedRows.Count > 0 then
          begin
            for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
            begin
              TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
              qry_fat_sol_.Close;
              qry_fat_sol_.Prepare;
              qry_fat_sol_.Open;

              if Not ( qry_fat_sol_.State in [dsInsert, dsEdit] ) then qry_fat_sol_.Edit;
              if ( qry_fat_sol_NR_NOTA_FATURA.AsString = '' ) or qry_fat_sol_NR_NOTA_FATURA.IsNull then
              begin
                qry_fat_sol_NR_NOTA_FATURA.AsString := Replicate( '0', 6 - Length( Trim( IntToStr( nr_ult_fat ) ) ) ) +
                                                       Trim( IntToStr( nr_ult_fat ) );
                nr_ult_fat := nr_ult_fat + 1;
              end;
              qry_fat_sol_IN_SELECIONADO.AsString  := '1';
              qry_fat_sol_CD_USUARIO_IMP.AsString  := str_cd_usuario;
              qry_fat_sol_.Post;
            end;
          end;

          datm_main.db_broker.Commit;
        except
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          if ( tp_tipo_fat = 'D' ) or ( tp_tipo_fat = 'C' ) or ( tp_tipo_fat = 'F' ) then
             BoxMensagem( 'Erro ao tentar imprimir faturas!', 2 )
          else
             BoxMensagem( 'Erro ao tentar imprimir Notas!', 2 );
          Exit;
        end;


        if model_fat = 'W' then
        begin
          // Seleciona processo da solicitação
          with TQuery.Create(Application) do
          begin
            DataBaseName := 'DBBROKER';
            Sql.Clear;
            Sql.Add('SELECT NR_PROCESSO AS NR_PROCESSO FROM TFATURAMENTO_CC (NOLOCK) ');
            Sql.Add('WHERE NR_SOLIC_FAT = :NR_SOLIC_FAT');
            Sql.Add('AND CD_UNID_NEG = :CD_UNID_NEG');
            Sql.Add('AND CD_PRODUTO = :CD_PRODUTO');
            ParamByName('NR_SOLIC_FAT').AsString := datm_sel_fat.qry_grd_sol_NR_SOLICITACAO.AsString;
            ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
            ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
            Prepare;
            Open;
            if RecordCount <> 0 then
              nr_processo :=  Fields[0].AsString;
            Close;
          end;

          // Seleciona as despesas
          nr_identificador := 0;
          CloseStoredProc( sp_rel_regs );
          with sp_rel_regs do
          begin
            ParamByName('@NR_PROCESSO').AsString := nr_processo;
            ParamByName('@NR_SOLIC_FAT').AsString := datm_sel_fat.qry_grd_sol_NR_SOLICITACAO.AsString;
          end;
          ExecStoredProc( sp_rel_regs );
          nr_identificador := sp_rel_regs.ParamByName('@nr_identificador').AsInteger;
          CloseStoredProc( sp_rel_regs );
        end;

        if tp_tipo_fat = 'N' then
        begin
          if dbgrdSol.SelectedRows.Count > 0 then
          begin
            for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
            begin
              TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
              FastExecSQL(' UPDATE TS_FATURA SET IN_SELECIONADO = ''1'', CD_USUARIO_SELECIONADO =  '''+str_cd_usuario+''''+
                          ' WHERE NR_SOLICITACAO  = '''+datm_sel_fat.qry_grd_sol_NR_SOLICITACAO.AsString+''' '+
                          '       AND CD_UNID_NEG = '''+msk_cd_unid_neg.Text+''' '+
                          '       AND CD_PRODUTO  = '''+msk_cd_produto.Text+''' ');
              FastExecSQL(' UPDATE TAJUSTE_IMPRESSAO_NF_SERV_INDAIA SET NR_ULT_NOTA_DEB = '''+ nr_ult_nota_fat+''''+
                          ' WHERE CGC_UNID_NEG = '''+vCNPJUnidade+''' ' );
            end;
          end;
          qry_NotaDebCred.Close;
          qry_NotaDebCred.ParamByName('CD_USUARIO_SELECIONADO').AsString := str_cd_usuario;
          qry_NotaDebCred.Open;
          Application.CreateForm(TFrm_impressao, Frm_impressao );
          frm_impressao.cd_unid_neg   := '';
          frm_impressao.cd_produto    := '';
          frm_impressao.cd_via_transp := '';
          frm_impressao.cd_modulo     := '1105';
          Frm_impressao.cd_grupo      := '';
          frm_impressao.vApenas_email := false;
          frm_impressao.ShowModal;
          frm_impressao.Release;
          qry_NotaDebCred.Close;

          if dbgrdSol.SelectedRows.Count > 0 then
          begin
            for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
            begin
              TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
              FastExecSQL(' UPDATE TS_FATURA SET IN_SELECIONADO = ''0'', CD_USUARIO_SELECIONADO = NULL'+
                          ' WHERE NR_SOLICITACAO  = '''+datm_sel_fat.qry_grd_sol_NR_SOLICITACAO.AsString+''' '+
                          '       AND CD_UNID_NEG = '''+msk_cd_unid_neg.Text+''' '+
                          '       AND CD_PRODUTO  = '''+msk_cd_produto.Text+''' ');
            end;
          end;
        end
        else
        begin
          Connect     := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
          Formulas[0] := 'UnidNeg = "'+ msk_cd_unid_neg.Text + '"';
          Formulas[1] := 'Produto = "'+ msk_cd_produto.Text + '"';
          Formulas[2] := 'DataFatura = '+ DataCrystal( FormatDateTime( FData, datm_sel_fat.qry_grd_sol_DT_FATURA.AsDateTime ) );
          Formulas[3] := 'Usuario = "'+ str_cd_usuario + '"';

          if ( model_fat = 'W' ) then
          begin
            Formulas[4] := 'NrIdent = ' + Trim( IntToStr( nr_identificador ) );
          end;

          if ( tp_tipo_fat = 'F' ) and ( model_fat <> 'W' ) then
          begin
            // Após 31/05/2006 imprime pelo novo RPT
            if datm_sel_fat.qry_grd_sol_DT_FATURA.AsDateTime < StrToDate( '31/05/2006' ) then
              ReportName  := cDir_Rpt + '\CRFT033.RPT'
            else
            begin
              ValorNumerario;
              if ((msk_cd_produto.Text = '02') and (StrToInt(ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', datm_sel_fat.qry_fat_proc_NR_PROCESSO.AsString, 'CD_GRUPO')) in [2, 8,13])) then
                ReportName  := cDir_Rpt + '\CRFT051BASF.RPT'
              else
                ReportName  := cDir_Rpt + '\CRFT051.RPT';
            end;
          end
          else
          begin
            if ( tp_tipo_fat = 'D' ) then      // Demonstrativo Despesa
            begin
              if msk_cd_produto.text = '01' then
              begin
                // Seleciona a comissão
                with TQuery.Create(Application) do
                begin
                  DataBaseName := 'DBBROKER';
                  Sql.Clear;
                  Sql.Add('SELECT R.VL_NUM_TAXA AS VL_NUM_TAXA FROM TPROCESSO P (NOLOCK), ');
                  Sql.Add(' TS_FATURA_PROCESSO FP (NOLOCK), TRECEITAS_IMP R (NOLOCK) ');
                  Sql.Add(' WHERE FP.NR_PROCESSO = P.NR_PROCESSO AND P.CD_CLIENTE = R.CD_CLIENTE ');
                  Sql.Add(' AND P.CD_UNID_NEG = R.CD_UNID_NE     G AND P.CD_PRODUTO = R.CD_PRODUTO ');
                  Sql.Add(' AND P.CD_SERVICO = R.CD_SERVICO AND R.CD_ITEM = ''822'' ');
                  Sql.Add(' AND R.CD_REGIME_TRIB = ''0'' ');
                  Sql.Add(' AND FP.NR_SOLICITACAO = :NR_SOLICITACAO');
                  Sql.Add(' AND FP.CD_UNID_NEG = :CD_UNID_NEG');
                  Sql.Add(' AND FP.CD_PRODUTO = :CD_PRODUTO');
                  ParamByName('NR_SOLICITACAO').AsString := datm_sel_fat.qry_grd_sol_NR_SOLICITACAO.AsString;
                  ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
                  ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
                  Prepare;
                  Open;
                  VlComissao := 0;
                  if RecordCount <> 0 then
                    VlComissao :=  Fields[0].AsFloat;
                  Close;
                end;
                Formulas[4] := 'Comissao = "' + Trim( VporPDecimal( FloatToStr(VlComissao) ) ) + '"';
                ReportName  := cDir_Rpt + '\CRFT047.RPT';
              end
              else
                ReportName  := cDir_Rpt + '\CRFT048.RPT'
            end
            else
            begin
              if ( tp_tipo_fat = 'C' ) then   // Demonstrativo Despesa Complementar
              begin
                if msk_cd_produto.text = '01' then
                  ReportName  := cDir_Rpt + '\CRFT049.RPT'
                else
                  ReportName  := cDir_Rpt + '\CRFT050.RPT'
                end
              else
              begin
                if ( tp_tipo_fat = 'F' ) and ( model_fat = 'W' ) then  // Fatura Despesa - NOVA
                begin
                  ValorNumerario;
                  if msk_cd_produto.text = '01' then
                    ReportName  := cDir_Rpt + '\CRFT053.RPT'
                  else
                    ReportName  := cDir_Rpt + '\CRFT054.RPT';
                end
              end
            end
          end;
          Execute;
        end;

        ApagaDados( 'TREL_REGS', nr_identificador );

        try
          datm_main.db_broker.StartTransaction;
          if dbgrdSol.SelectedRows.Count > 0 then
          begin
            for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
            begin
              TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
              qry_fat_sol_.Close;
              qry_fat_sol_.Prepare;
              qry_fat_sol_.Open;
              CloseStoredProc( sp_nf_serv_op );
              with sp_nf_serv_op do
              begin
                ParamByName('@cd_unid_neg').AsString    := qry_fat_sol_CD_UNID_NEG.AsString;
                ParamByName('@cd_produto').AsString     := qry_fat_sol_CD_PRODUTO.AsString;
                ParamByName('@nr_solicitacao').AsString := qry_fat_sol_NR_SOLICITACAO.AsString;
              end;
              ExecStoredProc( sp_nf_serv_op );
              CloseStoredProc( sp_nf_serv_op );

              if Not ( qry_fat_sol_.State in [dsInsert, dsEdit] ) then qry_fat_sol_.Edit;
              qry_fat_sol_DT_IMPRESSAO.AsDateTime := dt_server;
              qry_fat_sol_IN_IMPRESSO.AsString    := '1';
              qry_fat_sol_IN_SELECIONADO.AsString := '0';
              qry_fat_sol_CD_USUARIO_IMP.AsString := '';
              qry_fat_sol_.Post;

              qry_atz_dados_.SQL.Clear;
              qry_atz_dados_.SQL.Add( 'UPDATE TNF_SERV_OP SET CD_EMISSOR = "" WHERE CD_EMISSOR = "' + str_cd_usuario + '"' );
              qry_atz_dados_.Prepare;
              qry_atz_dados_.ExecSQL;

              if ( tp_tipo_fat = 'D' ) or ( tp_tipo_fat = 'C' ) or ( tp_tipo_fat = 'F' ) then
              begin
                //Realiza eventos da emissão da fatura
                qry_fat_proc_.First;
                while Not qry_fat_proc_.EOF do
                begin
                  CloseStoredProc(sp_atz_evento);
                  sp_atz_evento.ParamByName('@NR_PROCESSO').AsString     := qry_fat_proc_NR_PROCESSO.AsString;
                  sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString   := 'CD_EV_ENVIO_FAT';
                  sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := StrToDate( FormatDateTime( 'dd/mm/yyyy', dt_server ) );
                  ExecStoredProc(sp_atz_evento);
                  CloseStoredProc(sp_atz_evento);
                  qry_fat_proc_.Next;
                end;
                qry_fat_proc_.First;
              end
              {else
              if ( tp_tipo_fat = 'N' ) then
              begin
                //Realiza eventos da emissão da fatura
                qry_fat_proc_.First;
                while Not qry_fat_proc_.EOF do
                begin
                  if ConsultaLookUpSQL('SELECT COUNT(*) AS CONT FROM TFOLLOWUP (NOLOCK) ' +
                     ' WHERE NR_PROCESSO = ''' + Trim(qry_fat_proc_NR_PROCESSO.AsString) + ''' AND ' +
                     '       CD_EVENTO   = ''092'' AND IN_APLICAVEL = ''1'' AND ISNULL(DT_REALIZACAO , '''') = '''' ', 'CONT') <> '0' then begin
                    FastExecSQL('UPDATE TFOLLOWUP SET DT_REALIZACAO = CONVERT(DATETIME, ''' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + ''', 103), ' +
                                '                     CD_RESP_REALIZACAO = ISNULL( ''' + str_cd_usuario + ''', ''0000'' ), ' +
                                '                     DT_INSPECAO        = CONVERT(DATETIME, ''' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + ''', 103), ' +
                                '                     CD_RESP_INSPECAO   = ISNULL( ''' + str_cd_usuario + ''', ''0000'' ), ' +
                                '                     CD_RESULT_INSPECAO = ''C'' ' +
                                ' WHERE NR_PROCESSO = ''' + Trim(qry_fat_proc_NR_PROCESSO.AsString) + ''' AND ' +
                                '       CD_EVENTO   = ''092'' AND IN_APLICAVEL = ''1'' AND ISNULL(DT_REALIZACAO , '''') = '''' ');
                    FastExecSQL('   EXEC sp_atz_followup ''' + Trim(qry_fat_proc_NR_PROCESSO.AsString) + ''' ');
                  end;
                  qry_fat_proc_.Next;
                end;
                qry_fat_proc_.First;
              end;}
            end;
          end;
          datm_main.db_broker.Commit;
        except
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          if ( tp_tipo_fat = 'D' ) or ( tp_tipo_fat = 'C' ) or ( tp_tipo_fat = 'F' ) then
             BoxMensagem( 'Erro ao tentar imprimir faturas!', 2 )
          else
             BoxMensagem( 'Erro ao tentar imprimir Notas!', 2 );
          Exit;
        end;
        msk_nr_fat.Text := Replicate( '0', 6 - Length( Trim( IntToStr( nr_ult_fat ) ) ) ) +
                           Trim( IntToStr( nr_ult_fat ) );

        qry_grd_sol_.Close;
        qry_grd_sol_.Prepare;
        qry_grd_sol_.Open;

        Exit;
      end;

      // Nota Fiscal
      if tp_tipo_fat = 'S' then
      begin
        qry_param_.Close;
        qry_param_.Prepare;
        qry_param_.Open;
        vl_aliq_ir := qry_param_VL_ALIQ_IR.AsFloat;
        cNomeTxt := cDir_Rpt + '\NFSERV' + str_cd_usuario + '.TXT';
        try
          AssignFile( Txt, cNomeTxt );
          // AssignPrn( Txt );
          ReWrite( Txt );
        except
          BoxMensagem( 'Erro na criação do Arquivo !', 3 );
          Exit;
        end;
        qry_param_.Close;

        Gera_Arquivo_SERVICO;

      end; // Fim Nota Fiscal
    end;
  end;
end;


procedure Tfrm_sel_fat.FormShow(Sender: TObject);
var nN1, nN2, nN3, Code : Integer;
begin
  pgctrl_sel_fat.ActivePage := ts_sol;
  st_unid_neg               := '';
  st_prod                   := '';
  dt_fatura                 := '';
  ts_adm.TabVisible         := False;
  msk_data.Text := FormatDateTime('dd/mm/yyyy', dt_server);
  msk_data_fim.Text := FormatDateTime('dd/mm/yyyy', dt_server);  
  
  model_fat := '';
  if frm_sel_fat.tp_tipo_fat = 'W' then
  begin
    model_fat := 'W';
    tp_tipo_fat := 'F';
  end;

  if frm_sel_fat.tp_tipo_fat = 'B' then
     Caption := 'Relação de Faturas para emissão de boletos'
  else if frm_sel_fat.tp_tipo_fat = 'S' then
     Caption := 'Relação de Notas Fiscais'
  else if frm_sel_fat.tp_tipo_fat = 'N' then
     Caption := 'Relação de Notas Crédito/Débito'
  else if frm_sel_fat.tp_tipo_fat = 'D' then
     Caption := 'Demonstrativo de Despesas'
  else if frm_sel_fat.tp_tipo_fat = 'C' then
     Caption := 'Demonstrativo de Despesas Complementar'
  else
     Caption := 'Relação de Faturas';

  with datm_sel_fat do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_ult_nf_serv_adm_.Close;
    qry_ult_nf_serv_fat_.Close;
    qry_unid_neg_.Prepare;
    qry_produto_.Prepare;
    qry_unid_neg_.Open;
    qry_produto_.Open;

    // Colocado nessa posição na versão 5.00.00
    msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_unid_negExit(nil);
    msk_cd_produto.Text  := str_cd_produto;
    msk_cd_produtoExit(nil);

    if ( tp_tipo_fat = 'F' ) then   // Fatura Despesa
    begin
      qry_ult_fat_.Close;
      qry_ult_fat_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_ult_fat_.Prepare;
      qry_ult_fat_.Open;

      msk_nr_fat.Text := Replicate( '0', 6 - Length( IntToStr( StrToInt( qry_ult_fat_NR_ULT_FATURA.AsString ) + 1 ) ) ) +
                         IntToStr( StrToInt( qry_ult_fat_NR_ULT_FATURA.AsString ) + 1 );
      if Trim( msk_nr_fat.Text ) <> '' then nr_ult_fat := StrToInt( msk_nr_fat.Text );
    end
    else
    begin
      if tp_tipo_fat = 'S' then
      begin
        // ABRIR TEMPORARIAMENTE
        msk_nr_fat.TabStop  := True;
        msk_nr_fat.ReadOnly := False;
        msk_nr_fat.Color    := clWindow;

        // Verifica primeiro na Fatura
        qry_ult_nf_serv_fat_.Open;
        if qry_ult_nf_serv_fat_.EOF then
           nr_ult_nf_serv_fat := 1
        else
           if Trim( ( Replicate( '0', 6 - Length( IntToStr( StrToInt( qry_ult_nf_serv_fat_NR_ULT_NF_SERV.AsString ) + 1 ) ) ) +
                                IntToStr( StrToInt( qry_ult_nf_serv_fat_NR_ULT_NF_SERV.AsString ) + 1 ) ) ) <> '' then
              nr_ult_nf_serv_fat := StrToInt( Trim( ( Replicate( '0', 6 - Length( IntToStr( StrToInt( qry_ult_nf_serv_fat_NR_ULT_NF_SERV.AsString ) + 1 ) ) ) +
                                                                 IntToStr( StrToInt( qry_ult_nf_serv_fat_NR_ULT_NF_SERV.AsString ) + 1 ) ) ) );
        // Verifica depois em Movimentos Admnistrativos
        qry_ult_nf_serv_adm_.Open;
        if qry_ult_nf_serv_adm_.EOF then
           nr_ult_nf_serv_adm := 1
        else
           if Trim( ( Replicate( '0', 6 - Length( IntToStr( StrToInt( qry_ult_nf_serv_adm_NR_ULT_NF_SERV.AsString ) + 1 ) ) ) +
                                IntToStr( StrToInt( qry_ult_nf_serv_adm_NR_ULT_NF_SERV.AsString ) + 1 ) ) ) <> '' then
              nr_ult_nf_serv_adm := StrToInt( Trim( ( Replicate( '0', 6 - Length( IntToStr( StrToInt( qry_ult_nf_serv_adm_NR_ULT_NF_SERV.AsString ) + 1 ) ) ) +
                                                                 IntToStr( StrToInt( qry_ult_nf_serv_adm_NR_ULT_NF_SERV.AsString ) + 1 ) ) ) );
        if nr_ult_nf_serv_fat > nr_ult_nf_serv_adm then
        begin
          msk_nr_fat.Text := Replicate( '0', 6 - Length( IntToStr( StrToInt( qry_ult_nf_serv_fat_NR_ULT_NF_SERV.AsString ) + 1 ) ) ) +
                             IntToStr( StrToInt( qry_ult_nf_serv_fat_NR_ULT_NF_SERV.AsString ) + 1 );
          nr_ult_nf_serv := nr_ult_nf_serv_fat;
        end
        else
        begin
          msk_nr_fat.Text := Replicate( '0', 6 - Length( IntToStr( StrToInt( qry_ult_nf_serv_adm_NR_ULT_NF_SERV.AsString ) + 1 ) ) ) +
                             IntToStr( StrToInt( qry_ult_nf_serv_adm_NR_ULT_NF_SERV.AsString ) + 1 );
          nr_ult_nf_serv := nr_ult_nf_serv_adm;
        end;
      end
      else
      begin
        if tp_tipo_fat = 'N' then // Nota de Crédito/Débito
        begin
          qry_param_.Close;
          qry_param_.Prepare;
          qry_param_.Open;
          nr_ult_nota := IntToStr( StrToInt( qry_param_NR_ULT_NOTA.AsString ) );
          qry_param_.Close;

          qry_ult_nota_fat_.Close;
          qry_ult_nota_fat_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
          qry_ult_nota_fat_.Prepare;
          qry_ult_nota_fat_.Open;
          if Not qry_ult_nota_fat_.EOF then
             nr_ult_nota_fat := IntToStr( StrToInt( qry_ult_nota_fat_NR_NOTA_FAT.AsString ) )
          else
             nr_ult_nota_fat := '';
          qry_ult_nota_fat_.Close;
          FastExecSQL(' UPDATE TAJUSTE_IMPRESSAO_NF_SERV_INDAIA SET NR_ULT_NOTA_DEB = '''+nr_ult_nota_fat+''' WHERE CD_UNID_NEG = '''+Trim( msk_cd_unid_neg.Text )+''' ');

          qry_ult_nota_adm_.Close;
          qry_ult_nota_adm_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
          qry_ult_nota_adm_.Prepare;
          qry_ult_nota_adm_.Open;
          if Not qry_ult_nota_adm_.EOF then
          begin
            if Trim( qry_ult_nota_adm_NR_NOTA_ADM.AsString ) <> '' then
               nr_ult_nota_adm := IntToStr( StrToInt( qry_ult_nota_adm_NR_NOTA_ADM.AsString ) )
          end
          else
          begin
            nr_ult_nota_adm := '';
          end;
          qry_ult_nota_adm_.Close;

          Val( nr_ult_nota, nN1, Code );
          Val( nr_ult_nota_fat, nN2, Code );
          Val( nr_ult_nota_adm, nN3, Code );

          nr_docto_nota := nr_ult_nota_adm;
          if ( nN1 > nN2 ) and ( nN1 > nN3 ) then
             nr_docto_nota := nr_ult_nota;

          if ( nN2 > nN1 ) and ( nN2 > nN3 ) then
             nr_docto_nota := nr_ult_nota_fat;

          if ( Trim( nr_docto_nota ) <> '' ) then nr_docto_nota := IntToStr( StrToInt( nr_docto_nota ) + 1 );
          nr_docto_nota := Replicate( '0' , 6 - Length( Trim( nr_docto_nota ) ) ) + Trim( nr_docto_nota );

          msk_nr_fat.Text := nr_docto_nota;
        end
        else
        begin
          if ( tp_tipo_fat = 'D' ) or ( tp_tipo_fat = 'C' ) then  // Demonstrativo de Despesas / Demonstrativo de Despesas Complementar
          begin
            qry_ult_dem_.Close;
            qry_ult_dem_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
            qry_ult_dem_.Prepare;
            qry_ult_dem_.Open;

            msk_nr_fat.Text := Replicate( '0', 6 - Length( IntToStr( StrToInt( qry_ult_dem_NR_ULT_DEM.AsString ) + 1 ) ) ) +
                               IntToStr( StrToInt( qry_ult_dem_NR_ULT_DEM.AsString ) + 1 );
            if Trim( msk_nr_fat.Text ) <> '' then nr_ult_fat := StrToInt( msk_nr_fat.Text );

          end;
        end;
      end;
    end;

    if frm_sel_fat.tp_tipo_fat = 'S' then
    begin
      lbl_tipo_nf_serv.Visible := True;
      cbo_tipo_nf_serv.Visible := True;
      cbo_tipo_nf_serv.ItemIndex := 0;
    end;

    lbl_tipo_nf_serv.Visible := ( frm_sel_fat.tp_tipo_fat = 'S' );

    // Modo Preview
    lbl_nr_solicitacao.Visible := PreviewFatura;
    lbl_nr_nf.Visible          := PreviewFatura;
    lbl_nr_processo.Visible    := PreviewFatura;
    lbl_cd_referencia.Visible  := PreviewFatura;
    msk_nr_solicitacao.Visible := PreviewFatura;
    msk_nr_nf.Visible          := PreviewFatura;
    msk_nr_processo.Visible    := PreviewFatura;
    msk_cd_referencia.Visible  := PreviewFatura;
    chk_inc_canc.Visible       := PreviewFatura;
    if Not PreviewFatura then
    begin
      lbl_nr_ndc.Left          := lbl_tipo_nf_serv.Left;
      msk_nr_ndc.Left          := cbo_tipo_nf_serv.Left;
    end;
  end;
end;

procedure Tfrm_sel_fat.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var empresa, unidade, produto, data : String;
begin
  with datm_sel_fat do
  begin
    data    := frm_sel_fat.msk_data.text;
    unidade := qry_fat_sol_.FieldByName('CD_UNID_NEG').asString;
    produto := qry_fat_sol_.FieldByname('CD_PRODUTO').asString;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_grd_sol_.Close;
    qry_fat_sol_.Close;
    qry_fat_proc_.Close;
    qry_processo_.Close;
    empresa := qry_cliente_CD_EMPRESA.asString;
    qry_cliente_.Close;
    qry_di_.Close;
    qry_fat_cc_.Close;
    Free;
  end;
  crp_fat.Free;
  Action := caFree;
end;

procedure Tfrm_sel_fat.FormCreate(Sender: TObject);
begin
  // Inicializa o Data Module para Seleção de Recebimento
  Application.CreateForm( Tdatm_sel_fat, datm_sel_fat );
end;

function Tfrm_sel_fat.Consiste : Boolean;
begin
  Consiste := True;
  if Trim( msk_cd_unid_neg.Text ) = '' then
  begin
    BoxMensagem( 'Informe uma Unidade de Negócio!', 2 );
    msk_cd_unid_neg.SetFocus;
    Consiste := False;
  end;

  if Trim( msk_cd_produto.Text ) = '' then
  begin
    BoxMensagem( 'Informe um Produto!', 2 );
    msk_cd_produto.SetFocus;
    Consiste := False;
  end;

end;

procedure Tfrm_sel_fat.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_sel_fat.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg     then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto      then btn_co_produtoClick(nil);
  end;
end;

procedure Tfrm_sel_fat.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_sel_fat.msk_cd_produtoEnter(Sender: TObject);
begin
  st_prod := msk_cd_produto.Text;
end;

function Tfrm_sel_fat.Gera_Arquivo_SERVICO : Boolean;
var nCont, nN  : integer;
    n1, n2, n3, i : integer;
    cNumeroDI  : string;
begin
  // Modelo da Indaiá Logística
  Gera_Arquivo_SERVICO := True;

  lMaisProc := False;

  with datm_sel_fat do
  begin

     str_cr := #13#10;

    if pgctrl_sel_fat.ActivePage = ts_sol then // Nota Fiscal proveniente de fatura
    begin
      try
        datm_main.db_broker.StartTransaction;
        if ( Trim( msk_nr_fat.Text ) = '' ) then msk_nr_fat.Text := '0';
        if nr_ult_nf_serv <> StrToInt( Trim( msk_nr_fat.Text ) ) then
           nr_ult_nf_serv := StrToInt( Trim( msk_nr_fat.Text ) );

        lPInicial := True;
        lPulo := True;
        if dbgrdSol.SelectedRows.Count > 0 then
        begin
          for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
          begin
            TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));

            qry_fat_sol_.Close;
            qry_fat_sol_.Prepare;
            qry_fat_sol_.Open;

            if Not ( qry_fat_sol_.State in [dsInsert, dsEdit] ) then qry_fat_sol_.Edit;

            qry_fat_sol_NR_NF_SERV.AsString   := Replicate( '0', 6 - Length( Trim( IntToStr( nr_ult_nf_serv ) ) ) ) +
                                                 Trim( IntToStr( nr_ult_nf_serv ) );
            nr_ult_nf_serv := nr_ult_nf_serv + 1;

            qry_fat_sol_IN_IMP_NF_SERV.AsString := '1';
            qry_fat_sol_DT_NF_SERV.AsDateTime   := Date;
            qry_fat_sol_.Post;

            // Imprimir Nota Fiscal
            GeraCabecNFServ(1);
            // Somar comissão dos Processos
            qry_tot_comissao_fat_.Close;
            qry_tot_comissao_fat_.ParamByName('CD_UNID_NEG').AsString  := qry_fat_sol_CD_UNID_NEG.AsString;
            qry_tot_comissao_fat_.ParamByName('CD_PRODUTO').AsString   := qry_fat_sol_CD_PRODUTO.AsString;
            qry_tot_comissao_fat_.ParamByName('NR_SOLIC_FAT').AsString := datm_sel_fat.qry_fat_sol_NR_SOLICITACAO.AsString;
            qry_tot_comissao_fat_.Prepare;
            qry_tot_comissao_fat_.Open;
            if qry_tot_comissao_fat_.EOF then
              vl_total_nota := 0
            else
              vl_total_nota := qry_tot_comissao_fat_VL_COMISSAO.AsFloat;


            if qry_fat_sol_TP_TIPO_FAT.AsString = 'F' then
            begin
              saida := Space( 13 ) + 'FATURA Nº ' + qry_grd_sol_NR_NOTA_FATURA.AsString +
                     Space( 70 - Length( 'FATURA Nº ' + qry_grd_sol_NR_NOTA_FATURA.AsString ) ) +
                     FormataFloat( '###,##0.00', vl_total_nota );
            end
            else
              saida := Space( 13 ) + 'NOTA DÉB.Nº ' + qry_grd_sol_NR_NOTA_FATURA.AsString +
                       Space( 70 - Length( 'NOTA DÉB.Nº ' + qry_grd_sol_NR_NOTA_FATURA.AsString ) ) +
                       FormataFloat( '###,##0.00', vl_total_nota );
            Write( Txt, Saida );

            saida := str_cr + str_cr;
            Write( Txt, Saida );

            saida := Space( 13 ) + 'Serviço de Desembaraço Aduaneiro';
            Write( Txt, Saida );

            qry_ir_in_fat_.Close;
            qry_ir_in_fat_.ParamByName( 'CD_UNID_NEG' ).AsString := qry_fat_sol_CD_UNID_NEG.AsString;
            qry_ir_in_fat_.ParamByName( 'CD_PRODUTO' ).AsString  := qry_fat_sol_CD_PRODUTO.AsString;
            qry_ir_in_fat_.ParamByName( 'CD_CLIENTE' ).AsString  := qry_fat_proc_CD_CLIENTE.AsString;
            qry_ir_in_fat_.Prepare;
            qry_ir_in_fat_.Open;

            qry_iss_.Close;
            qry_iss_.ParamByName( 'NR_PROCESSO' ).AsString  := qry_fat_proc_NR_PROCESSO.AsString;
            qry_iss_.ParamByName( 'NR_SOLIC_FAT').AsString  := qry_fat_sol_NR_SOLICITACAO.AsString;
            qry_iss_.Prepare;
            qry_iss_.Open;

            vl_tot_iss := qry_iss_.FieldByName('VL_ITEM').AsFloat;
            //alterado valor do IR para ser a partir do total da nota, não apenas da comissão (Kleber - 28/08/2007) a pedido de Carlos Buss
            vl_total_ir := Arredondar( ( ( (vl_total_nota + vl_tot_iss) * vl_aliq_ir ) / 100 ), 2 );

            saida := str_cr + str_cr + str_cr + str_cr + str_cr +
                     str_cr + str_cr + str_cr + str_cr + str_cr +
                     str_cr;
            Write( Txt, Saida );

            GeraRodapeNFServ;

            qry_iss_.Close;
          end;
          msk_nr_fat.Text := Replicate( '0', 6 - Length( IntToStr( nr_ult_nf_serv ) ) ) + IntToStr( nr_ult_nf_serv );
          Saida := #12;
          Write( Txt, Saida );
        end;
        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        BoxMensagem( 'Erro ao tentar imprimir Nota Fiscal!', 2 );
        CloseFile( Txt );
        Exit;
      end;
      CloseFile( Txt );

      CopyFileLpt1( cNomeTxt, 'LPT1' );

      btn_desmarca_todasClick(nil);

      qry_grd_sol_.Close;
      qry_grd_sol_.Prepare;
      qry_grd_sol_.Open;

      screen.Cursor := crDefault;
      Application.ProcessMessages;

    end
    else // Nota Fiscal proveniente de Nota
    begin
      try
        datm_main.db_broker.StartTransaction;
        if ( Trim( msk_nr_fat.Text ) = '' ) then msk_nr_fat.Text := '0';
        if nr_ult_nf_serv <> StrToInt( Trim( msk_nr_fat.Text ) ) then
           nr_ult_nf_serv := StrToInt( Trim( msk_nr_fat.Text ) );
        if dbgrd_adm.SelectedRows.Count > 0 then
        begin
          for i := 0 to dbgrd_adm.SelectedRows.Count - 1 do
          begin
            TTable(dbgrd_adm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_adm.SelectedRows[i]));
            qry_atz_adm_.Close;
            qry_atz_adm_.ParamByName('NR_DOCTO').AsString   := qry_grd_adm_NR_DOCTO.AsString;
            qry_atz_adm_.ParamByName('NR_NF_SERV').AsString := Replicate( '0', 6 - Length( Trim( IntToStr( nr_ult_nf_serv ) ) ) ) +
                                                               Trim( IntToStr( nr_ult_nf_serv ) );
            qry_atz_adm_.ExecSQL;
            qry_fav_adm_.Close;
            qry_fav_adm_.Prepare;
            qry_fav_adm_.Open;
            nr_ult_nf_serv := nr_ult_nf_serv + 1;
            // Imprimir Nota Fiscal
            GeraCabecNFServ(2);
            // Somar Notas de Débito
            vl_total_nota := qry_grd_adm_VL_NOTA.AsFloat;
            vl_total_ir := Arredondar( ( ( vl_total_nota * vl_aliq_ir ) / 100 ), 2 );
            saida := Space( 13 ) + 'NOTA DE DÉBITO Nº ' + qry_grd_adm_NR_DOCTO.AsString +
                     Space( 74 - Length( 'NOTA DE DÉBITO Nº ' + qry_grd_adm_NR_DOCTO.AsString ) ) +
                     FormataFloat( '###,##0.00', vl_total_nota );
            Write( Txt, Saida );
            saida := str_cr + str_cr + str_cr + str_cr + str_cr +
                     str_cr + str_cr + str_cr + str_cr + str_cr +
                     str_cr + str_cr + str_cr + str_cr;
            Write( Txt, Saida );

            GeraRodapeNFServ;
          end;
          msk_nr_fat.Text := Replicate( '0', 6 - Length( IntToStr( nr_ult_nf_serv ) ) ) + IntToStr( nr_ult_nf_serv );
        end;
        datm_main.db_broker.Commit;

      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        BoxMensagem( 'Erro ao tentar imprimir Nota Fiscal!', 2 );
        Exit;
      end;

      CloseFile( Txt );
      CopyFileLpt1( cNomeTxt, 'LPT1' );
      btn_desmarca_todasClick(nil);

      qry_grd_adm_.Close;
      qry_grd_adm_.Prepare;
      qry_grd_adm_.Open;
    end;

    Exit;

    qry_ret_proc_.Close;
    qry_ret_proc_.ParamByName('NR_SOLIC_FAT').AsString := qry_fat_sol_NR_SOLICITACAO.AsString;
    qry_ret_proc_.Prepare;
    qry_ret_proc_.Open;

    Gera_Cabec2;

    nCont      := 0;
    VlComissao := 0;
    VlIRRF      := 0;
    cNumeroDI  := '';

    qry_ret_proc_.First;
    while not (qry_ret_proc_.EOF) do
    begin
      nCont := nCont + 1;
      qry_di_.Close;
      qry_di_.UnPrepare;
      qry_di_.ParamByName('NR_PROCESSO').AsString := qry_ret_proc_NR_PROCESSO.AsString;
      qry_di_.Prepare;
      qry_di_.Open;

      cNumeroDI := cNumeroDI + str_cr + Space(25) + 'REF. D.I. ' + Copy( qry_di_NR_DECLARACAO_IMP.AsString, 1,2) + '/' +
                   Copy( qry_di_NR_DECLARACAO_IMP.AsString, 3,7) + '-' + Copy( qry_di_NR_DECLARACAO_IMP.AsString,10,1);

      qry_ret_proc_.Next;
    end;

    with datm_sel_fat do
    begin
      // Despesas
      qry_fat_cc_.First;
      while not (qry_fat_cc_.EOF) do
      begin
        // Comissao
        if qry_fat_cc_CD_ITEM.Asstring = '822' then
           VlComissao := VlComissao + qry_fat_cc_VL_ITEM.AsFloat;
        // IRRF
        if qry_fat_cc_CD_ITEM.Asstring = '994' then
           VlIRRF     := VlIRRF     + qry_fat_cc_VL_ITEM.AsFloat;

        qry_fat_cc_.Next;
      end;
    end;

    n1 := 12 - Length( FormataFloat('########0.00', VlComissao ));
    n2 := 12 - Length( FormataFloat('########0.00', VlIRRF ));
    n3 := 12 - Length( FormataFloat('########0.00', VlComissao + VlIRRF ));

    Saida := str_cr + str_cr + str_cr + str_cr + Space(25) + 'SERVICOS PRESTADOS COM DESEMBARACO DE MERCADORIAS ' + Space(46) +
             FormataFloat('########0.00', VlComissao );
    Write( Txt, Saida );

    Saida := cNumeroDI;
    Write( Txt, Saida );

    nCont := 24 - nCont;

    for nN := 1 to nCont do
    begin
      Saida := str_cr;
      Write( Txt, Saida );
    end;

    Saida := Space(115) + Space(n1) + FormataFloat('########0.00', VlComissao );
    Write( Txt, Saida );

    Saida := str_cr + Space(115) + Space(n2) + FormataFloat('########0.00', VlIRRF );
    Write( Txt, Saida );

    Saida := str_cr + str_cr + Space(20) + 'DATA EMISSÃO : ' + DateToStr(Date) + Space(70) +
                               Space(n3) + FormataFloat('########0.00', VlComissao + VlIRRF );
    Write( Txt, Saida );
  end;
end;


procedure Tfrm_sel_fat.Gera_Cabec2;
begin
  with datm_sel_fat do
  begin
    Saida := #15 + #27 + 'C' + #51;
    Write( Txt, Saida );

    // Nome Empresa + Numero da Solicitacao
    Saida := str_cr + str_cr + str_cr + str_cr + str_cr + str_cr + str_cr + str_cr + Space(25) +
             FStrSpace( qry_cliente_NM_EMPRESA.AsString, 50 );
    Write( Txt, Saida );

    // Endereco + Numero
    Saida := str_cr + Space(25) + Trim( qry_cliente_END_EMPRESA.AsString ) + Space(10) + qry_cliente_END_NUMERO.AsString + Space( 5 ) + qry_cliente_END_BAIRRO.AsString;
    Write( Txt, Saida );

    // Cidade + UF + CEP
    Saida := str_cr + Space(25) + FStrSpace( Trim( qry_cliente_END_CIDADE.AsString ),63)  + Space(5) +
                                                   qry_cliente_END_UF.AsString + Space(12) +
                                                   Copy( qry_cliente_END_CEP.AsString,1,5) + '-' +
                                                   Copy( qry_cliente_END_CEP.AsString,6,3);
    Write( Txt, Saida );

    // CGC + Processo
    Saida := str_cr + str_cr + Space(25) + Copy( qry_cliente_CGC_EMPRESA.AsString,1,2) + '.' +
                                           Copy( qry_cliente_CGC_EMPRESA.AsString,3,3) + '.' +
                                           Copy( qry_cliente_CGC_EMPRESA.AsString,6,3) + '/' +
                                           Copy( qry_cliente_CGC_EMPRESA.AsString,9,4) + '-' +
                                           Copy( qry_cliente_CGC_EMPRESA.AsString,13,2) +
                               Space(50) + qry_cliente_IE_EMPRESA.AsString;
    Write( Txt, Saida );
  end;

end;

procedure Tfrm_sel_fat.msk_nr_fatChange(Sender: TObject);
begin
  if Trim( msk_nr_fat.Text ) <> '' then nr_ult_fat := StrToInt( msk_nr_fat.Text );
end;

procedure Tfrm_sel_fat.msk_dataEnter(Sender: TObject);
begin
  dt_fatura := msk_data.Text;
end;

procedure Tfrm_sel_fat.cbo_tipo_nf_servChange(Sender: TObject);
begin
  dt_fatura := '';
  if cbo_tipo_nf_serv.ItemIndex = 0 then // Fatura
  begin
    ts_sol.TabVisible         := True;
    ts_adm.TabVisible         := False;
    pgctrl_sel_fat.ActivePage := ts_sol;
    lbl_produto.Visible       := True;
    msk_cd_produto.Visible    := True;
    edt_nm_produto.Visible    := True;
    btn_co_produto.Visible    := True;
  end
  else
  begin
    ts_sol.TabVisible         := False;
    ts_adm.TabVisible         := True;
    pgctrl_sel_fat.ActivePage := ts_adm;
    lbl_produto.Visible       := False;
    msk_cd_produto.Visible    := False;
    edt_nm_produto.Visible    := False;
    btn_co_produto.Visible    := False;
  end;
  msk_dataExit(nil);
end;

procedure Tfrm_sel_fat.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := False;
  mi_marca_todas.Visible     := False;
  btn_desmarca_todas.Visible := True;
  mi_desmarca_todas.Visible  := True;
  btn_desmarca_todas.Left    := btn_marca_todas.Left;
  if pgctrl_sel_fat.ActivePage = ts_sol then // Nota Fiscal proveniente de fatura
  begin
    datm_sel_fat.qry_grd_sol_.First;
    for i := 0 to datm_sel_fat.qry_grd_sol_.RecordCount - 1 do
    begin
      dbgrdSol.SelectedRows.CurrentRowSelected := True;
      datm_sel_fat.qry_grd_sol_.Next;
    end;
  end
  else
  begin
    datm_sel_fat.qry_grd_adm_.First;
    for i := 0 to datm_sel_fat.qry_grd_adm_.RecordCount - 1 do
    begin
      dbgrd_adm.SelectedRows.CurrentRowSelected := True;
      datm_sel_fat.qry_grd_adm_.Next;
    end;
  end;
end;

procedure Tfrm_sel_fat.btn_desmarca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := True;
  mi_marca_todas.Visible     := True;
  btn_desmarca_todas.Visible := False;
  mi_desmarca_todas.Visible  := False;
  if pgctrl_sel_fat.ActivePage = ts_sol then // Nota Fiscal proveniente de fatura
  begin
    if dbgrdSol.SelectedRows.Count > 0 then
       TTable( dbgrdSol.DataSource.DataSet ).GotoBookMark( TBookMark( dbgrdSol.SelectedRows[0] ) );
    for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
    begin
      dbgrdSol.SelectedRows.CurrentRowSelected := False;
      if dbgrdSol.SelectedRows.Count > 0 then
        TTable( dbgrdSol.DataSource.DataSet ).GotoBookMark( TBookMark( dbgrdSol.SelectedRows[0] ) )
      else Break;
    end;
  end
  else
  begin
    if dbgrd_adm.SelectedRows.Count > 0 then
       TTable( dbgrd_adm.DataSource.DataSet ).GotoBookMark( TBookMark( dbgrd_adm.SelectedRows[0] ) );
    for i := 0 to dbgrd_adm.SelectedRows.Count - 1 do
    begin
      dbgrd_adm.SelectedRows.CurrentRowSelected := False;
      if dbgrd_adm.SelectedRows.Count > 0 then
        TTable( dbgrd_adm.DataSource.DataSet ).GotoBookMark( TBookMark( dbgrd_adm.SelectedRows[0] ) )
      else Break;
    end;
  end;
end;

procedure Tfrm_sel_fat.dbgrdSolKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
  begin
    if dbgrdSol.SelectedRows.CurrentRowSelected then
       dbgrdSol.SelectedRows.CurrentRowSelected := False
    else
       dbgrdSol.SelectedRows.CurrentRowSelected := True;
  end;
end;

procedure Tfrm_sel_fat.GeraCabecNFServ( tp_nota : Integer);
begin
  with datm_sel_fat do
  begin
    // ESC @ ESC x n ESC M EXP ESC C 0 n ESC 0 ESC (  t  3 0 1 25 0 ESC t  1
    // saida := #27#64#27#120#1#27#77#18#27#67#0#3#27#48#27#40#116#3#0#1#25#0#27#116#1
    // Inicializa
            // ESC @ ESC x n ESC M EXP ESC C 0 n ESC 0 ESC (  t  3 0 1 25 0 ESC t  1

    saida := #27#64#27#120#1#27#107#1#27#77#18#27#67#0#6#27#50#27#79#27#40#116#3#0#1#25#0#27#116#1;
    Write( Txt, Saida );

    saida  := str_cr + str_cr + str_cr + str_cr + str_cr;
    Write( Txt, Saida );

    // Data da Emissão
    saida := Space( 54 ) + msk_data.Text;
    Write( Txt, Saida + str_cr + str_cr );

    qry_cliente_representante_.Close;
    qry_cliente_representante_.ParamByName('CD_CLIENTE').asString       := qry_fat_proc_CD_CLIENTE.asString;
    qry_cliente_representante_.ParamByName('CD_UNID_NEG').asString      := qry_fat_proc_CD_UNID_NEG.asString;
    qry_cliente_representante_.ParamByName('CD_PRODUTO').asString       := qry_fat_proc_CD_PRODUTO.asString;
    qry_cliente_representante_.ParamByName('CD_SERVICO').asString       := qry_fat_proc_CD_SERVICO.asString;
    qry_cliente_representante_.ParamByName('CD_REPRESENTANTE').asString := qry_fat_proc_CD_REPRESENTANTE.asString;
    qry_cliente_representante_.Prepare;
    qry_cliente_representante_.Open;

    // Nome
    if tp_nota = 1 then
       saida := Space( 13 ) + qry_fat_proc_NM_EMPRESA.AsString
    else if tp_nota = 2 then
       saida := Space( 13 ) + qry_fav_adm_NM_FAVORECIDO.AsString;
    Write( Txt, Saida + str_cr  );

    // Endereço
    if tp_nota = 1 then
       saida := Space( 13 ) + qry_fat_proc_END_EMPRESA.AsString
    else if tp_nota = 2 then
       saida := Space( 13 ) + qry_fav_adm_END_FAVORECIDO.AsString;
    Write( Txt, Saida + str_cr  );

    // Município + Estado
    if tp_nota = 1 then
       saida := Space( 13 ) + Trim( qry_fat_proc_END_CIDADE.AsString ) + Space( 53 - Length( Trim( qry_fat_proc_END_CIDADE.AsString ) ) ) +
                qry_fat_proc_END_UF.AsString
    else if tp_nota = 2 then
       saida := Space( 13 ) + Trim( qry_fav_adm_END_CIDADE.AsString ) + Space( 53 - Length( Trim( qry_fav_adm_END_CIDADE.AsString ) ) ) +
                qry_fav_adm_END_UF.AsString;
    Write( Txt, Saida + str_cr  );

    // CNPJ + Inscrição Estadual
    if tp_nota = 1 then
      Saida := Space( 13 ) + Copy( qry_fat_proc_CGC_EMPRESA.AsString, 1, 2 ) + '.' +
                             Copy( qry_fat_proc_CGC_EMPRESA.AsString, 3, 3 ) + '.' +
                             Copy( qry_fat_proc_CGC_EMPRESA.AsString, 6, 3 ) + '/' +
                             Copy( qry_fat_proc_CGC_EMPRESA.AsString, 9, 4 ) + '-' +
                             Copy( qry_fat_proc_CGC_EMPRESA.AsString,13 ,2 ) +
                             Space( 30 ) +
                             Copy( qry_fat_proc_IE_EMPRESA.AsString, 1, 3 ) + '.' +
                             Copy( qry_fat_proc_IE_EMPRESA.AsString, 4, 3 ) + '.' +
                             Copy( qry_fat_proc_IE_EMPRESA.AsString, 7, 3 ) + '.' +
                             Copy( qry_fat_proc_IE_EMPRESA.AsString,10, 3 )
    else if tp_nota = 2 then
       Saida := Space( 13 ) + Copy( qry_fav_adm_CGC_EMPRESA.AsString, 1, 2 ) + '.' +
                              Copy( qry_fav_adm_CGC_EMPRESA.AsString, 3, 3 ) + '.' +
                              Copy( qry_fav_adm_CGC_EMPRESA.AsString, 6, 3 ) + '/' +
                              Copy( qry_fav_adm_CGC_EMPRESA.AsString, 9, 4 ) + '-' +
                              Copy( qry_fav_adm_CGC_EMPRESA.AsString,13, 2 ) +
                              Space( 30 ) +
                              Copy( qry_fav_adm_IE_EMPRESA.AsString, 1, 3 ) + '.' +
                              Copy( qry_fav_adm_IE_EMPRESA.AsString, 4, 3 ) + '.' +
                              Copy( qry_fav_adm_IE_EMPRESA.AsString, 7, 3 ) + '.' +
                              Copy( qry_fav_adm_IE_EMPRESA.AsString,10, 3 );
    Write( Txt, Saida + str_cr + str_cr + str_cr + str_cr );
  end;
end;


procedure Tfrm_sel_fat.GeraRodapeNFServ;
begin
  Saida := str_cr;
  Write( Txt, Saida);
  if vl_tot_iss > 0 then
  begin
    saida := Space( 6 ) + ' I.R. Retido na fonte ( ' + FormataFloat( '#0.00', vl_aliq_ir ) + '% ) R$ ' +
             FormataFloat( '###,##0.00', vl_total_ir ) + Space( 4 ) + 'I.S.S. ' +
             FormataFloat( '###,##0.00', vl_tot_iss ) + Space( 19 ) +
             FormataFloat( '###,##0.00', vl_total_nota );
  end
  else
  begin
    saida := Space( 6 ) + ' I.R. Retido na fonte ( ' + FormataFloat( '#0.00', vl_aliq_ir ) + '% ) R$ ' +
             FormataFloat( '###,##0.00', vl_total_ir ) + Space( 37 ) + FormataFloat( '###,##0.00', vl_total_nota );
  end;
  Write( Txt, Saida );
  // Write( Txt, Saida + str_cr + str_cr + str_cr + str_cr );

  Saida := str_cr;
  Write( Txt, Saida + str_cr + str_cr + str_cr );

  (*
  saida := Space( 87 ) + FormataFloat( '###,##0.00', vl_total_nota );
  Write( Txt, Saida + str_cr);

  saida := Space( 6 ) + ' I.R. Retido na fonte ( ' + FormataFloat( '#0.00', vl_aliq_ir ) + '% ) R$ ' +
           FormataFloat( '###,##0.00', vl_total_ir );
  Write( Txt, Saida + str_cr + str_cr + str_cr );
  *)

  vl_total_nota := vl_total_nota + vl_tot_iss;

  saida := Space( 83 ) + FormataFloat( '###,##0.00', vl_total_nota );
  Write( Txt, Saida );

  Saida := str_cr;
  Write( Txt, saida + str_cr + str_cr + str_cr);

  // saida := #12;
  // Write( Txt, Saida );
  // saida := #27#67#0#6;

  saida := #67#0#6;
  Write( Txt, Saida );
end;

procedure Tfrm_sel_fat.msk_nr_solicitacaoEnter(Sender: TObject);
begin
  st_nr_solicitacao := msk_nr_solicitacao.Text;
end;

procedure Tfrm_sel_fat.msk_nr_nfEnter(Sender: TObject);
begin
  st_nr_nf := msk_nr_nf.Text;
end;

procedure Tfrm_sel_fat.msk_nr_ndcEnter(Sender: TObject);
begin
  st_nr_ndc := msk_nr_ndc.Text;
end;

procedure Tfrm_sel_fat.msk_nr_processoEnter(Sender: TObject);
begin
  st_nr_processo := msk_nr_processo.Text;
end;

procedure Tfrm_sel_fat.msk_cd_referenciaEnter(Sender: TObject);
begin
  st_cd_referencia := msk_cd_referencia.Text;
end;

procedure Tfrm_sel_fat.msk_nr_solicitacaoExit(Sender: TObject);
begin
  if Trim( msk_nr_solicitacao.Text ) = st_nr_solicitacao then Exit;
  msk_dataExit(nil);
end;

procedure Tfrm_sel_fat.msk_nr_nfExit(Sender: TObject);
begin
  if Trim( msk_nr_nf.Text ) = st_nr_nf then Exit;
  msk_dataExit(nil);
end;

procedure Tfrm_sel_fat.msk_nr_ndcExit(Sender: TObject);
begin
  if Trim( msk_nr_ndc.Text ) = st_nr_ndc then Exit;
  dt_fatura := '';
  ValCodEdt( msk_nr_ndc );
  msk_dataExit(nil);
end;

procedure Tfrm_sel_fat.msk_nr_processoExit(Sender: TObject);
begin
  if Trim( msk_nr_processo.Text ) = st_nr_processo then Exit;
  msk_dataExit(nil);
end;

procedure Tfrm_sel_fat.msk_cd_referenciaExit(Sender: TObject);
begin
  if Trim( msk_cd_referencia.Text ) = st_cd_referencia then Exit;
  msk_dataExit(nil);
end;

procedure Tfrm_sel_fat.chk_inc_cancExit(Sender: TObject);
begin
  msk_dataExit(nil);
end;

procedure Tfrm_sel_fat.chk_inc_cancClick(Sender: TObject);
begin
  msk_dataExit(nil);
end;

procedure Tfrm_sel_fat.btn_preview_rateio_despClick(Sender: TObject);
var
  i : Integer;
begin
  if Not Consiste then Exit;

  with datm_sel_fat do
  begin
    if Trim( msk_cd_unid_neg.Text ) = '' then
    begin
      BoxMensagem( 'Informe a Unidade de Negócio!', 2 );
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;

    if cbo_tipo_nf_serv.ItemIndex in [0, 1] then
    begin
      if Trim( msk_cd_produto.Text ) = '' then
      begin
        BoxMensagem( 'Informe o Produto!', 2 );
        Exit;
      end;
    end;

    if ( msk_cd_produto.Text = '01' ) or ( msk_cd_produto.Text = '03' ) then
    begin
      try
        if dbgrdSol.SelectedRows.Count <> 0 then
        begin
          datm_main.db_broker.StartTransaction;
          for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
          begin
            TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
            with datm_sel_fat do
            begin
              CloseStoredProc( sp_fat_atz_rateio_imp );
              with sp_fat_atz_rateio_imp do
              begin
                ParamByName('@cd_usuario').AsString     := str_cd_usuario;
                ParamByName('@cd_unid_neg').AsString    := msk_cd_unid_neg.Text;
                ParamByName('@cd_produto').AsString     := msk_cd_produto.Text;
                ParamByName('@nr_solicitacao').AsString := qry_grd_sol_NR_SOLICITACAO.AsString;
              end;
              ExecStoredProc( sp_fat_atz_rateio_imp );
              CloseStoredProc( sp_fat_atz_rateio_imp );
            end;
          end;
          datm_main.db_broker.Commit;

          if sp_fat_atz_rateio_imp.ParamByName('Result').AsInteger > 0 then
            ExibeErro( 'sp_fat_rateio_imp', sp_fat_atz_rateio_imp.ParamByName('Result').AsInteger, '', 0.0 )
          else
          begin
            qry_fat_calculo_rateio_despesas_.Close;
            qry_fat_calculo_rateio_despesas_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
            qry_fat_calculo_rateio_despesas_.Open;

            if qry_fat_calculo_rateio_despesas_.RecordCount=0 then
            begin
              BoxMensagem( 'Impressão de Rateio de Despesas vazia!', 2 );
              Exit
            end
            else
            begin
              qry_num_rateio_.Close;
              qry_num_rateio_.ParamByName('NR_SOLICITACAO').AsString := qry_fat_calculo_rateio_despesas_NR_SOLICITACAO.AsString;
              qry_num_rateio_.ParamByName('CD_PRODUTO').AsString := qry_fat_calculo_rateio_despesas_CD_PRODUTO.AsString;
              qry_num_rateio_.Open;

              qry_sum_fat_calc_rat_desp_.Close;
              qry_sum_fat_calc_rat_desp_.Prepare;
              qry_sum_fat_calc_rat_desp_.Open;

              ppRelFatCalculoRateioDesp.DeviceType := 'Screen';
              ppRelFatCalculoRateioDesp.Template.FileName := cDir_RPT + '\RBFAT003.RTM';
              ppRelFatCalculoRateioDesp.PrinterSetup.DocumentName := Caption;
              ppTitle.Caption := 'Rateio de Despesas - Nº ' + qry_fat_calculo_rateio_despesas_NR_NOTA_FATURA.AsString;
              ppRelFatCalculoRateioDesp.Print;

              Cria_SQL( 'UPDATE TFAT_CALCULO_RATEIO_DESP SET CD_USUARIO = NULL WHERE CD_USUARIO = ' + QuotedStr( str_cd_usuario ) );
              qry_num_rateio_.Close;
            end;
          end;
        end
        else BoxMensagem( 'Selecione um Nº de Solicitação!', 2 );
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        BoxMensagem( 'Erro ao tentar imprimir Rateio de Despesas!', 2 );
        Exit;
      end;
    end;

    if ( msk_cd_produto.Text = '02' ) or ( msk_cd_produto.Text = '10' ) then
    begin
      try
        if dbgrdSol.SelectedRows.Count <> 0 then
        begin
          datm_main.db_broker.StartTransaction;
          for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
          begin
            TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
            with datm_sel_fat do
            begin
              CloseStoredProc( sp_fat_atz_rateio_exp );
              with sp_fat_atz_rateio_exp do
              begin
                ParamByName('@cd_usuario').AsString     := str_cd_usuario;
                ParamByName('@cd_unid_neg').AsString    := msk_cd_unid_neg.Text;
                ParamByName('@cd_produto').AsString     := msk_cd_produto.Text;
                ParamByName('@nr_solicitacao').AsString := qry_grd_sol_NR_SOLICITACAO.AsString;
              end;
              ExecStoredProc( sp_fat_atz_rateio_exp );
              CloseStoredProc( sp_fat_atz_rateio_exp );
            end;
          end;
          datm_main.db_broker.Commit;

          if sp_fat_atz_rateio_exp.ParamByName('Result').AsInteger > 0 then
            ExibeErro( 'sp_fat_rateio_exp', sp_fat_atz_rateio_exp.ParamByName('Result').AsInteger, '', 0.0 )
          else
          begin
            qry_fat_calculo_rateio_despesas_.Close;
            qry_fat_calculo_rateio_despesas_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
            qry_fat_calculo_rateio_despesas_.Open;

            if qry_fat_calculo_rateio_despesas_.RecordCount=0 then
            begin
              BoxMensagem( 'Impressão de Rateio de Despesas vazia!', 2 );
              Exit
            end
            else
            begin
              qry_num_rateio_.Close;
              qry_num_rateio_.ParamByName('NR_SOLICITACAO').AsString := qry_fat_calculo_rateio_despesas_NR_SOLICITACAO.AsString;
              qry_num_rateio_.ParamByName('CD_PRODUTO').AsString := qry_fat_calculo_rateio_despesas_CD_PRODUTO.AsString;
              qry_num_rateio_.Open;

              qry_sum_fat_calc_rat_desp_.Close;
              qry_sum_fat_calc_rat_desp_.Prepare;
              qry_sum_fat_calc_rat_desp_.Open;

              ppRelFatCalculoRateioDesp.DeviceType := 'Screen';
              ppRelFatCalculoRateioDesp.Template.FileName := cDir_RPT + '\RBFAT003.RTM';
              ppRelFatCalculoRateioDesp.PrinterSetup.DocumentName := Caption;
              ppRelFatCalculoRateioDesp.Print;

              Cria_SQL( 'UPDATE TFAT_CALCULO_RATEIO_DESP SET CD_USUARIO = NULL WHERE CD_USUARIO = ' + QuotedStr( str_cd_usuario ) );
              qry_num_rateio_.Close;
            end;
          end;
        end
        else BoxMensagem( 'Selecione um Nº de Solicitação!', 2 );
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        BoxMensagem( 'Erro ao tentar imprimir Rateio de Despesas!', 2 );
        Exit;
      end;
    end;
  end;

end;

procedure Tfrm_sel_fat.ValorNumerario;
var
  VlReceb, VlDevol : Double;
begin
  VlDevol := 0;
  VlReceb := 0;
  VlNum   := 0;

  With TQuery.Create( Application ) do
  begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('SELECT ( ( SUM(ISNULL( F.VL_ITEM, 0 ) ) + SUM(ISNULL( F.VL_ASSIST, 0 ) ) ) - SUM(ISNULL( F.VL_IR, 0 )) ) AS NUMERARIO FROM TFATURAMENTO_CC F (NOLOCK), ');
    SQL.Add('TS_FATURA_PROCESSO FP (NOLOCK) WHERE FP.NR_PROCESSO = F.NR_PROCESSO ');
    SQL.Add(' AND F.CD_ITEM = :CD_ITEM AND FP.NR_SOLICITACAO = :NR_SOLICITACAO ');
    SQL.Add('AND FP.CD_UNID_NEG = :CD_UNID_NEG AND FP.CD_PRODUTO = :CD_PRODUTO ');
    ParamByName('CD_ITEM').AsString := '991';
    ParamByName('NR_SOLICITACAO').AsString := datm_sel_fat.qry_grd_sol_NR_SOLICITACAO.AsString;;
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    Open;
    VlReceb := Fields[0].AsFloat;
    Close;
    SQL.Clear;
    SQL.Add('SELECT ( ( SUM(ISNULL( F.VL_ITEM, 0 )) + SUM(ISNULL( F.VL_ASSIST, 0 )) ) - SUM(ISNULL( F.VL_IR, 0 )) ) AS NUMERARIO FROM TFATURAMENTO_CC F (NOLOCK), ');
    SQL.Add('TS_FATURA_PROCESSO FP (NOLOCK) WHERE FP.NR_PROCESSO = F.NR_PROCESSO ');
    SQL.Add(' AND F.CD_ITEM IN ( :CD_ITEM, :CD_ITEM1 ) AND FP.NR_SOLICITACAO = :NR_SOLICITACAO AND');
    SQL.Add(' FP.CD_UNID_NEG = :CD_UNID_NEG AND FP.CD_PRODUTO = :CD_PRODUTO ');
    ParamByName('CD_ITEM').AsString := '992';
    ParamByName('CD_ITEM1').AsString := '993';
    ParamByName('NR_SOLICITACAO').AsString := datm_sel_fat.qry_grd_sol_NR_SOLICITACAO.AsString;;
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    Open;
    VlDevol := Fields[0].AsFloat;
    Close;
    Free;
  end;
  VlNum := VlReceb - VlDevol;

  //Atualiza Tabela com valor
  With TQuery.Create( Application ) do
  begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('UPDATE TS_FATURA_PROCESSO');
    SQL.Add('SET VL_NUMERARIO = :VL_NUMERARIO');
    SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO AND NR_SOLICITACAO = :NR_SOLICITACAO');
    SQL.Add('AND CD_UNID_NEG = :CD_UNID_NEG AND CD_PRODUTO = :CD_PRODUTO ');
    ParamByName('VL_NUMERARIO').AsFloat := VlNum;
    ParamByName('NR_PROCESSO').AsString := datm_sel_fat.qry_fat_proc_NR_PROCESSO.AsString;;
    ParamByName('NR_SOLICITACAO').AsString := datm_sel_fat.qry_grd_sol_NR_SOLICITACAO.AsString;;
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    ExecSql;
    Free;
  end;
end;


function Tfrm_sel_fat.VporPDecimal(Valor:String):String;
var decimal : string;
begin
  // Coloca as casas decimais na string
  decimal := Valor;
  if Pos( ',', Valor ) <= 0 then
    decimal := Valor + ',00'
  else
  begin
    if length(Valor) - ( Pos( ',', Valor ) ) = 1 then
      decimal := Valor + '0'
    else
      decimal := Valor;
  end;

  // Coloca o ponto de milhar na string
  if length(decimal) > 6 then
    VporPDecimal := Copy( decimal, 1, length(decimal) - 6 ) + '.' + Copy ( decimal,( length(decimal) - 5 )  , 6 )
  else
    VporPDecimal := decimal;
end;

procedure Tfrm_sel_fat.BitBtn1Click(Sender: TObject);
begin
  pnlResumo.Visible := False;
  mmResumo.Lines.Text;
  Panel1.Enabled := True;
end;

procedure Tfrm_sel_fat.BitBtn3Click(Sender: TObject);
var
  vArquivo : String;
  vTotLinhas, vTotServicos, vTotDeducoes, vTotDescontosCond, vTotDescontosIncCond : Double;
  i : Integer;
begin
  mmNf.Lines.Clear;
  //LINHA 1
  vTotLinhas := 0;
  vTotServicos := 0;
  vTotDeducoes := 0;
  vTotDescontosCond := 0;
  vTotDescontosIncCond := 0;

  with qry_nf1 do
  begin
    Close;
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Open;
    mmNf.Lines.add(FieldByName('C1').AsString + FieldByName('C2').AsString + FieldByName('C3').AsString + FStrZero(FieldByName('C4').AsString, 14) +
                   FStrZero(FieldByName('C5').AsString, 15) + FieldByName('C6').AsString + FieldByName('C7').AsString);
  end;
  //LINHA 2
  for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
  begin
    TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
    with qry_nf2 do
    begin
      Close;
      Open;
      ParamByName('CD_UNID_NEG').AsString    := msk_cd_unid_neg.Text;
      ParamByName('CD_PRODUTO').AsString     := msk_cd_produto.Text;
      ParamByName('NR_SOLICITACAO').AsString := datm_sel_fat.qry_fat_sol_NR_SOLICITACAO.AsString;
      mmNf.Lines.add(
      FieldByName('C1').AsString + FieldByName('C2').AsString + FStrSpace(FieldByName('C3').AsString, 5) +
      FStrZero(FieldByName('C4').AsString, 15) + FieldByName('C5').AsString + FieldByName('C6').AsString +
      FieldByName('C7').AsString + FStrZero(FieldByName('C8').AsString, 14) + FStrSpace(FieldByName('C9').AsString, 15) +
      FStrZero(FieldByName('C10').AsString, 15) + FStrSpace(FieldByName('C11').AsString, 115) + FStrSpace(FieldByName('C12').AsString, 3) +
      FStrSpace(FieldByName('C13').AsString, 125) + FStrSpace(FieldByName('C14').AsString, 10) + FStrSpace(FieldByName('C15').AsString, 60) +
      FStrSpace(FieldByName('C16').AsString, 72) + FStrSpace(FieldByName('C17').AsString, 50) + FStrSpace(FieldByName('C18').AsString, 2) +
      FStrZero(FieldByName('C19').AsString, 8) + FStrSpace(FieldByName('C20').AsString, 11) + FStrSpace(FieldByName('C21').AsString, 80) +
      FieldByName('C22').AsString + FStrSpace(FieldByName('C23').AsString, 50) + FieldByName('C24').AsString +
      FieldByName('C25').AsString + FieldByName('C26').AsString + FieldByName('C27').AsString +
      FieldByName('C28').AsString + FieldByName('C29').AsString + FieldByName('C30').AsString +
      FStrZero(StringReplace(FormatFloat('#0.00', FieldByName('C31').AsFloat), ',', '', [rfReplaceAll]), 15) +
      FStrZero(StringReplace(FormatFloat('#0.00', FieldByName('C32').AsFloat), ',', '', [rfReplaceAll]), 15) +
      FStrZero(StringReplace(FormatFloat('#0.00', FieldByName('C33').AsFloat), ',', '', [rfReplaceAll]), 15) +
      FStrZero(StringReplace(FormatFloat('#0.00', FieldByName('C34').AsFloat), ',', '', [rfReplaceAll]), 15) +
      FStrZero(StringReplace(FormatFloat('#0.00', FieldByName('C35').AsFloat), ',', '', [rfReplaceAll]), 15) +
      FStrZero(StringReplace(FormatFloat('#0.00', FieldByName('C36').AsFloat), ',', '', [rfReplaceAll]), 15) +
      FStrZero(StringReplace(FormatFloat('#0.00', FieldByName('C37').AsFloat), ',', '', [rfReplaceAll]), 15) +
      FStrZero(StringReplace(FormatFloat('#0.00', FieldByName('C38').AsFloat), ',', '', [rfReplaceAll]), 15) +
      FStrZero(StringReplace(FormatFloat('#0.00', FieldByName('C39').AsFloat), ',', '', [rfReplaceAll]), 15) +
      FStrZero(StringReplace(FormatFloat('#0.00', FieldByName('C40').AsFloat), ',', '', [rfReplaceAll]), 15) +
      FStrZero(StringReplace(FormatFloat('#0.00', FieldByName('C41').AsFloat), ',', '', [rfReplaceAll]), 15) + FieldByName('C42').AsString +  FieldByName('C43').AsString +
      FStrSpace(FieldByName('C44').AsString, 15)  + FStrSpace(FieldByName('C45').AsString, 15) + FStrSpace(FieldByName('C46').AsString, 5) +
      FStrZero(FieldByName('C47').AsString, 15) + FStrSpace(FieldByName('C48').AsString, 30) + FieldByName('C49').AsString);
      vTotServicos := vTotServicos + FieldByName('C31').AsFloat;
      vTotDeducoes := vTotDeducoes + FieldByName('C32').AsFloat;
      vTotDescontosCond    := vTotDescontosCond + FieldByName('C33').AsFloat;
      vTotDescontosIncCond := vTotDescontosIncCond + FieldByName('C34').AsFloat;
      vTotLinhas := vTotLinhas + qry_nf2.RecordCount;
    end;
  end;
  mmNf.Lines.add( '90'+ FStrZero(StringReplace(FloatToStr(vTotLinhas), '.', '', [rfReplaceAll]), 8) +
  FStrZero(StringReplace(FormatFloat('#0.00', vTotServicos), ',', '', [rfReplaceAll]), 15) +
  FStrZero(StringReplace(FormatFloat('#0.00', vTotDeducoes), ',', '', [rfReplaceAll]), 15) +
  FStrZero(StringReplace(FormatFloat('#0.00', vTotDescontosCond), ',', '', [rfReplaceAll]), 15) +
  FStrZero(StringReplace(FormatFloat('#0.00', vTotDescontosIncCond), ',', '', [rfReplaceAll]), 15));

  vArquivo := 'C:\NFE_'+ Copy(DateToStr(DATE()), 1, 2) + Copy(DateToStr(DATE()), 4, 2) + Copy(DateToStr(DATE()), 7, 4) + '.txt';
  mmNf.Lines.SaveToFile(vArquivo);
  EnviaEmail('[MyIndaiáWeb] NFE Rio', '<font face="Courier New" Size="2pt">' + StringReplace(StringReplace(StringReplace(mmResumo.Lines.Text, #13, '', [rfReplaceAll]), #10, '<br>', [rfReplaceAll]), ' ', '&nbsp;', [rfReplaceAll]) + '</font>',  'nfecarioca@myindaia.com.br');
  pnlResumo.Visible := False;
  mmResumo.Lines.Clear;
  Panel1.Enabled := True;
  ShowMessage('Arquivo gerado em: '+vArquivo);
end;


procedure Tfrm_sel_fat.btnGeratxtClick(Sender: TObject);
var i : Integer;
begin
  if dbgrdSol.SelectedRows.Count > 0 then
  begin
    mmResumo.Lines.Clear;
    pnlResumo.Visible := True;
    Panel1.Enabled := False;
    for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
    begin
      TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
      with qry_nf2 do
      begin
        Close;       
        ParamByName('CD_UNID_NEG').AsString    := msk_cd_unid_neg.Text;
        ParamByName('CD_PRODUTO').AsString     := msk_cd_produto.Text;
        ParamByName('NR_SOLICITACAO').AsString := datm_sel_fat.qry_fat_sol_NR_SOLICITACAO.AsString;
        Open;
        mmResumo.Lines.Add('-----------------------------------------------------------------------------');
        mmResumo.Lines.Add('Cliente: '+FieldByName('C11').AsString+ ' ( CNPJ: '+FieldByName('C8').AsString+' )');
        mmResumo.Lines.Add('-----------------------------------------------------------------------------');
        mmResumo.Lines.Add(FieldByName('C49').AsString);
        mmResumo.Lines.Add('Retenção de COFINS:    ' + RightStr(StringOfChar(' ', 20) + FormatFloat('#0,.00', FieldByName('C35').AsFloat), 10));
        mmResumo.Lines.Add('Retenção de CSLL:      ' + RightStr(StringOfChar(' ', 20) + FormatFloat('#0,.00', FieldByName('C36').AsFloat), 10));
        mmResumo.Lines.Add('Retenção de INSS:      ' + RightStr(StringOfChar(' ', 20) + FormatFloat('#0,.00', FieldByName('C37').AsFloat), 10));
        mmResumo.Lines.Add('Retenção de IRPJ:      ' + RightStr(StringOfChar(' ', 20) + FormatFloat('#0,.00', FieldByName('C38').AsFloat), 10));
        mmResumo.Lines.Add('Retenção de PIS:       ' + RightStr(StringOfChar(' ', 20) + FormatFloat('#0,.00', FieldByName('C39').AsFloat), 10));
        mmResumo.Lines.Add('Valor do ISS:          ' + RightStr(StringOfChar(' ', 20) + FormatFloat('#0,.00', FieldByName('C41').AsFloat), 10));
        mmResumo.Lines.Add('Valor Total da Nota:  ' + RightStr(StringOfChar(' ', 20) + FormatFloat('#0,.00', FieldByName('C31').AsFloat), 10));
        mmResumo.Lines.Add('');
      end;
    end;
  end;
end;

end.

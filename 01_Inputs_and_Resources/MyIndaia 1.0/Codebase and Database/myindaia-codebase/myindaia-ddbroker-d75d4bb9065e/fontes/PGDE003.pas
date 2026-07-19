(*************************************************************************************************
Sistema: Controle de Demurrage
PROGRAMA: PGDE003.PAS - frm_dem_fat - Faturas
AUTOR: Leandro Stipanich
DATA: 15/07/2002
Manutenção: 
*************************************************************************************************)
unit PGDE003;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, ToolEdit, RXDBCtrl, Funcoes;

type
  Tfrm_dem_fat = class(TForm)
    pgctrl_dem_fat: TPageControl;
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    ts_cntr: TTabSheet;
    dbgrd_fat_cntr: TDBGrid;
    lbl_dt_fim: TLabel;
    dblckpbox_parcial: TDBLookupComboBox;
    lbl_parcial: TLabel;
    lbl_dias_cobrados: TLabel;
    dbedt_nr_dias_cobrados: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_proc_cntr: TMenuItem;
    mi_sair: TMenuItem;
    btn_cntr: TSpeedButton;
    lbl_dias_corridos: TLabel;
    dbedt_dt_dias_corridos: TDBEdit;
    lbl_nr_fatura: TLabel;
    msk_nr_fatura: TMaskEdit;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_nr_cntr: TLabel;
    dbedt_nr_cntr: TDBEdit;
    lbl_processo: TLabel;
    btn_co_processo: TSpeedButton;
    lbl_vl_diaria: TLabel;
    dbedt_vl_diaria: TDBEdit;
    lbl_vl_fatura: TLabel;
    dbedt_vl_fatura_mn: TDBEdit;
    lbl_vl_desconto: TLabel;
    dbedt_vl_desconto: TDBEdit;
    lbl_vl_deposito: TLabel;
    dbedt_vl_deposito: TDBEdit;
    lbl_vl_total: TLabel;
    dbedt_vl_total: TDBEdit;
    lbl_vl_fatura_mneg: TLabel;
    dbedt_vl_fatura_mneg: TDBEdit;
    Label2: TLabel;
    dbedt_tx_fatura: TDBEdit;
    lbl_moeda: TLabel;
    btn_co_moeda: TSpeedButton;
    dbedt_cd_moeda: TDBEdit;
    dbedt_nm_moeda: TDBEdit;
    lbl_dt_inicio: TLabel;
    lbl_nr_fatura1: TLabel;
    dbedt_nr_fat_cntr: TDBEdit;
    lbl_nr_processo: TLabel;
    msk_nr_processo2: TMaskEdit;
    btn_co_processo2: TSpeedButton;
    lbl_cd_produto: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    lbl_nr_cntr2: TLabel;
    msk_nr_cntr: TMaskEdit;
    msk_nr_processo: TMaskEdit;
    dbedt_dt_inicio: TDBDateEdit;
    dbedt_dt_fim: TDBDateEdit;
    ts_fat: TTabSheet;
    Label1: TLabel;
    dbedt_vl_desconto_mneg: TDBEdit;
    Label3: TLabel;
    dbedt_vl_acrescimo: TDBEdit;
    Label4: TLabel;
    dbedt_vl_acrescimo_mneg: TDBEdit;
    Label5: TLabel;
    dbedt_nr_fat: TDBEdit;
    dbgrd_fat: TDBGrid;
    Label6: TLabel;
    dbedt_dt_vencto: TDBDateEdit;
    Label7: TLabel;
    dbedt_vl_fatura: TDBEdit;
    Label8: TLabel;
    dbedt_vl_desc: TDBEdit;
    Label9: TLabel;
    dbedt_vl_acresc: TDBEdit;
    Label10: TLabel;
    dbedt_vl_dep: TDBEdit;
    Label11: TLabel;
    pnl_tot_fat: TPanel;
    lbl_tot_fat: TLabel;
    dbtxt_vl_tot_fatura: TDBText;
    Panel1: TPanel;
    Label12: TLabel;
    DBText1: TDBText;
    Label13: TLabel;
    dbedt_nr_periodo: TDBEdit;
    Label14: TLabel;
    dblckpbox_tp_fat_dem: TDBLookupComboBox;
    ChkInDispute: TDBCheckBox;
    dbedt_vl_dispute: TDBEdit;
    MemObsDispute: TDBMemo;
    Label15: TLabel;
    dbedt_vl_tot_fatura: TDBEdit;
    Label16: TLabel;
    procedure btn_sairClick(Sender: TObject);
    procedure pgctrl_dem_fatChange(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_incluirClick(Sender: TObject);
    procedure dbn_refBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure btn_excluirClick(Sender: TObject);
    procedure pgctrl_dem_fatChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_nr_fat_cntrChange(Sender: TObject);
    procedure btn_proc_realizaClick(Sender: TObject);
    procedure btn_co_faturaClick(Sender: TObject);
    procedure msk_nr_faturaExit(Sender: TObject);
    procedure msk_nr_faturaEnter(Sender: TObject);
    procedure msk_nr_faturaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbedt_nr_fatExit(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processo2Enter(Sender: TObject);
    procedure msk_nr_processo2Exit(Sender: TObject);
    procedure msk_nr_cntrExit(Sender: TObject);
    procedure msk_nr_cntrEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_processo2Click(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure dbedt_nr_processoExit(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure dbedt_nr_cntrExit(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure dbedt_cd_moedaExit(Sender: TObject);
    procedure dbedt_nr_dias_cobradosExit(Sender: TObject);
    procedure dblckpbox_parcialClick(Sender: TObject);
    procedure dbedt_nr_fat_cntrExit(Sender: TObject);
    procedure dbedt_nr_fatChange(Sender: TObject);
    procedure dbedt_nr_periodoExit(Sender: TObject);
    procedure btn_cntrClick(Sender: TObject);
  private
    st_modulo, st_rotina : String;
    lAbertura, lNaoConsiste : Boolean;
    cd_unid_neg_proc, cd_produto_proc : String[2];
    var_nr_proc2 : String[14];
    var_nr_cntr : String[20];

    function Grava : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
    procedure CodExits;
    procedure Abertura;
    function  VerUnidNegProduto : Boolean;

  public
    var_nr_fatura : String[14];
    var_nr_proc : String[18];
    st_modificar, st_incluir, st_excluir : Boolean;
    pesq_nr_fatura, pesq_nr_cntr, pesq_cd_unid_neg : String;
    lCons_OnLine : Boolean;
    Cons_OnLine  : TStringField;
    Cons_OnLine_Texto : String;
    function VerFatura : Boolean;
    procedure btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
    procedure VerFat;
  end;

var
  frm_dem_fat: Tfrm_dem_fat;

implementation

uses GSMLIB, PGGP001, PGDE004, PGSM010, PGGP017, PGSM018, PGSM048, PGSM136, PGGP015;
{$R *.DFM}

procedure Tfrm_dem_fat.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
  str_cd_rotina_atalho := '';
end;

procedure Tfrm_dem_fat.pgctrl_dem_fatChange(Sender: TObject);
begin
  btn_mi(False, False, False, False );

  with datm_dem_fat do
  begin
    if ( pgctrl_dem_fat.ActivePage = ts_fat ) then
       btn_mi( ( st_incluir and ts_fat.Enabled ), False, False, ( st_excluir and ts_fat.Enabled ) );

    if ( pgctrl_dem_fat.ActivePage = ts_cntr ) then
       btn_mi( ( st_incluir and ts_cntr.Enabled ), False, False, ( st_excluir and ts_cntr.Enabled ) );

    //DBNAVIGATOR
    dbnvg.Enabled := True;

    if ( pgctrl_dem_fat.ActivePage = ts_fat ) then
       dbnvg.DataSource := ds_fat;
    if ( pgctrl_dem_fat.ActivePage = ts_cntr ) then
       dbnvg.DataSource := ds_fat_cntr;
  end;
end;

procedure Tfrm_dem_fat.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_dem_fat.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_dem_fat.Cancelar;
begin
  with datm_dem_fat do
  begin
    try
      if pgctrl_dem_fat.ActivePage = ts_fat then
      begin
        if qry_fat_.State in [dsInsert, dsEdit] then
        begin
          qry_fat_.Cancel;
        end;
      end;
      if pgctrl_dem_fat.ActivePage = ts_cntr then
      begin
        if qry_fat_cntr_.State in [dsInsert, dsEdit] then
        begin
          qry_fat_cntr_.Cancel;
          msk_nr_processo.Text := '';
        end;
      end;
      VerFat;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;

    btn_mi( st_incluir, False, False, st_excluir )
  end;
end;

procedure Tfrm_dem_fat.dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  btn_mi( False, False, False, False );
end;

function Tfrm_dem_fat.Consiste;
begin
  with datm_dem_fat do
  begin
    Consiste := True;
    //**************************************************************************
    //Consistências de Fatura
    if pgctrl_dem_fat.ActivePage = ts_fat then
    begin
      if ( Not ( datm_dem_fat.qry_fat_.State in [dsInsert, dsEdit] ) ) then Exit;
      //Unidade de Negócio
      if Not lNaoConsiste then
      begin
        if msk_cd_unid_neg.Text = '' then
        begin
          BoxMensagem( 'Campo Unidade de Negócio deve ser preenchido!', 2 );
          msk_cd_unid_neg.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      //Nº Fatura
      if Not lNaoConsiste then
      begin
        if dbedt_nr_fat.Text = '' then
        begin
          BoxMensagem( 'Campo Nº Fatura deve ser preenchido!', 2 );
          pgctrl_dem_fat.ActivePage := ts_fat;
          dbedt_nr_fat.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      //Data Vencimento
      if Not lNaoConsiste then
      begin
        if dbedt_dt_vencto.Text = '  /  /    ' then
        begin
          BoxMensagem( 'Campo Dt. Vencimento deve ser preenchido!', 2 );
          pgctrl_dem_fat.ActivePage := ts_fat;
          dbedt_dt_vencto.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      //Valor
      if Not lNaoConsiste then
      begin
        if dbedt_vl_tot_fatura.Text = '' then
        begin
          BoxMensagem( 'Campo Vl. Total deve ser preenchido!', 2 );
          pgctrl_dem_fat.ActivePage := ts_fat;
          dbedt_vl_tot_fatura.SetFocus;
          Consiste := False;
          Exit;
        end
        else
        begin
          if qry_fat_VL_FATURA_TOTAL.AsFloat <= 0 then
          begin
            BoxMensagem( 'Campo Vl. Total deve ser maior que zero!', 2 );
            pgctrl_dem_fat.ActivePage := ts_fat;
            dbedt_vl_tot_fatura.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;

    //Consistências de Contêiner
    if pgctrl_dem_fat.ActivePage = ts_cntr then
    begin
      if ( Not ( datm_dem_fat.qry_fat_cntr_.State in [dsInsert, dsEdit] ) ) then Exit;
      //Unidade de Negócio
      if Not lNaoConsiste then
      begin
        if msk_cd_unid_neg.Text = '' then
        begin
          BoxMensagem( 'Campo Unidade de Negócio deve ser preenchido!', 2 );
          msk_cd_unid_neg.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      //Nº Fatura
      if Not lNaoConsiste then
      begin
        if dbedt_nr_fat_cntr.Text = '' then
        begin
          BoxMensagem( 'Campo Nº Fatura deve ser preenchido!', 2 );
          pgctrl_dem_fat.ActivePage := ts_cntr;
          dbedt_nr_fat_cntr.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if ( dbedt_nr_fat.Text <> dbedt_nr_fat_cntr.Text ) then
      begin
        BoxMensagem( 'Capa da Fatura não cadastrada ou não selecionada!', 2 );
        pgctrl_dem_fat.ActivePage := ts_cntr;
        dbedt_nr_fat_cntr.SetFocus;
        Consiste := False;
        Exit;
      end;

      //Nº Cntr
      if Not lNaoConsiste then
      begin
        if dbedt_nr_cntr.Text = '' then
        begin
          BoxMensagem( 'Campo Nº Contêiner deve ser preenchido!', 2 );
          pgctrl_dem_fat.ActivePage := ts_cntr;
          dbedt_nr_cntr.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      //Nº Processo
      if Not lNaoConsiste then
      begin
        if msk_nr_processo.Text = '' then
        begin
          BoxMensagem( 'Campo Nº Processo deve ser preenchido!', 2 );
          pgctrl_dem_fat.ActivePage := ts_cntr;
          msk_nr_processo.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      //Período
      ValidCodigo( dbedt_nr_periodo );

      //Dias Cobrados
      if Trim( dbedt_nr_dias_cobrados.Text ) <> '' then
      begin
        if qry_fat_cntr_IN_PARCIAL.AsString = '0' then
        begin
          if StrToInt( Trim( dbedt_nr_dias_cobrados.Text ) ) > qry_fat_cntr_CalcDiasCobrar.AsInteger then
          begin
            BoxMensagem( 'Fatura deve conter ' + IntToStr( qry_fat_cntr_CalcDiasCobrar.AsInteger ) +
                         ' dias a cobrar!', 2 );
            pgctrl_dem_fat.ActivePage := ts_cntr;
            dbedt_nr_dias_cobrados.SetFocus;
            Consiste := False;
            Exit;
          end;

          if Not lNaoConsiste then
          begin
            if StrToInt( Trim( dbedt_nr_dias_cobrados.Text ) ) < qry_fat_cntr_CalcDiasCobrar.AsInteger then
            begin
              BoxMensagem( 'Fatura deve conter ' + IntToStr( qry_fat_cntr_CalcDiasCobrar.AsInteger ) +
                           ' dias a cobrar!', 3 );
            end;
          end;
        end
        else
        begin
          if Not lNaoConsiste then
          begin
            qry_dias_.Close;
            qry_dias_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
            qry_dias_.ParamByName('NR_FATURA').AsString   := qry_fat_cntr_NR_FATURA.AsString;
            qry_dias_.ParamByName('NR_PROCESSO').AsString := qry_fat_cntr_NR_PROCESSO.AsString;
            qry_dias_.ParamByName('NR_CNTR').AsString     := qry_fat_cntr_NR_CNTR.AsString;
            qry_dias_.Prepare;
            qry_dias_.Open;
            if ( StrToInt( Trim( dbedt_nr_dias_cobrados.Text ) ) + qry_dias_NR_DIAS_COBRADOS.AsInteger ) >
               qry_fat_cntr_CalcDiasCobrar.AsInteger then
            begin
              BoxMensagem( 'A Soma dos dias das Faturas Parcias devem conter ' + IntToStr( qry_fat_cntr_CalcDiasCobrar.AsInteger ) +
                           ' dias a cobrar!', 2 );
              pgctrl_dem_fat.ActivePage := ts_cntr;
              dbedt_nr_dias_cobrados.SetFocus;
              Consiste := False;
              qry_dias_.Close;
              Exit;
            end;
            qry_dias_.Close;
          end;
        end;
      end;

      if Trim( msk_nr_processo.Text ) <> '' then
      begin
        qry_processo_.Close;
        qry_processo_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                             Trim( msk_cd_produto.Text ) +
                                                             Trim( msk_nr_processo.Text );
        qry_processo_.Prepare;
        qry_processo_.Open;
        if qry_processo_.EOF then
        begin
          qry_processo_.Close;
          BoxMensagem( 'Processo não encontrado! Digite novamente!', 2 );
          Consiste := False;
          msk_nr_processo.SetFocus;
          Exit;
        end;

        if qry_processo_IN_CANCELADO.AsString = '1' then
        begin
          qry_processo_.Close;
          BoxMensagem( 'Processo Cancelado! Digite novamente!', 2 );
          Consiste := False;
          msk_nr_processo.SetFocus;
          Exit;
        end;

        if qry_processo_IN_LIBERADO.AsString = '0' then
        begin
          qry_processo_.Close;
          BoxMensagem( 'Processo não está liberado! Digite novamente!', 2 );
          Consiste := False;
          msk_nr_processo.SetFocus;
          Exit;
        end;

        if qry_processo_IN_PRODUCAO.AsString = '0' then
        begin
          qry_processo_.Close;
          BoxMensagem( 'Processo não está na produção! Digite novamente!', 2 );
          Consiste := False;
          msk_nr_processo.SetFocus;
          Exit;
        end;
        qry_processo_.Close;
      end;

      //Processo X Cntr
      if ( Trim( msk_nr_processo.Text ) <> '' ) and
         ( Trim( dbedt_nr_cntr.Text ) <> '' ) then
      begin
        qry_proc_cntr_.Close;
        qry_proc_cntr_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                              Trim( msk_cd_produto.Text ) +
                                                              Trim( msk_nr_processo.Text );
        qry_proc_cntr_.ParamByName('NR_CNTR').AsString     := Trim( dbedt_nr_cntr.Text );
        qry_proc_cntr_.Prepare;
        qry_proc_cntr_.Open;
        if qry_proc_cntr_.EOF then
        begin
          qry_proc_cntr_.Close;
          BoxMensagem( 'Processo X Cntr não cadastrado!', 2 );
          Consiste := False;
          msk_nr_processo.SetFocus;
          Exit;
        end;
        qry_proc_cntr_.Close;
      end;

      //Moeda
      ValidCodigo( dbedt_cd_moeda );
      if dbedt_cd_moeda.Text <> '' Then
      begin
        if dbedt_nm_moeda.Text = '' Then
        begin
          BoxMensagem( 'Código da Moeda inválido!', 2 );
          pgctrl_dem_fat.ActivePage := ts_cntr;
          dbedt_cd_moeda.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      qry_vl_total_.Close;
      qry_vl_total_.ParamByName('CD_UNID_NEG').AsString := qry_fat_cntr_CD_UNID_NEG.AsString;
      qry_vl_total_.ParamByName('NR_CNTR').AsString     := qry_fat_cntr_NR_CNTR.AsString;
      qry_vl_total_.ParamByName('NR_FATURA').AsString   := qry_fat_cntr_NR_FATURA.AsString;
      qry_vl_total_.ParamByName('NR_PROCESSO').AsString := qry_fat_cntr_NR_PROCESSO.AsString;
      qry_vl_total_.ParamByName('NR_PERIODO').AsString  := qry_fat_cntr_NR_PERIODO.AsString;
      qry_vl_total_.Prepare;
      qry_vl_total_.Open;
      if ( Arredondar( ( Arredondar( qry_vl_total_VL_TOTAL.AsFloat, 2 ) +  Arredondar( StrToFloat( dbedt_vl_total.Text ), 2 ) ), 2 ) >
         Arredondar( qry_fat_VL_FATURA_TOTAL.AsFloat, 2 ) ) then
      begin
        BoxMensagem( 'Soma dos Valores ultrapassa Valor da Fatura!', 2 );
        pgctrl_dem_fat.ActivePage := ts_cntr;
        dbedt_vl_fatura_mn.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_dem_fat.FormClose(Sender: TObject;
   var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_dem_fat do
    begin
      qry_yes_no_.Close;
      qry_unid_neg_.Close;
      qry_fat_.Close;
      qry_fat_cntr_.Close;

      Destroy;
      Action := caFree;
    end;
  end
  else
    Action := caNone;
end;

procedure Tfrm_dem_fat.btn_incluirClick(Sender: TObject);
begin
  with datm_dem_fat do
  begin
    if pgctrl_dem_fat.ActivePage = ts_fat then
    begin
      if qry_fat_.State in [dsInsert] then
         qry_fat_.Cancel;
      if qry_fat_.State in [dsInactive] then
      begin
        if Trim( msk_nr_fatura.Text ) <> '' then
          qry_fat_.ParamByName('NR_FATURA').AsString := Trim( msk_nr_fatura.Text )
        else
          qry_fat_.ParamByName('NR_FATURA').AsString := 'X';
        qry_fat_.Prepare;
        qry_fat_.Open;
      end;

      qry_fat_.Append;
      qry_fat_CD_UNID_NEG.AsString := Trim( msk_cd_unid_neg.Text );
      qry_fat_IN_FATURADO.AsString := '0';
      qry_fat_IN_RECIBO.AsString   := '0';
      if Trim( msk_nr_fatura.Text ) <> '' then
        qry_fat_NR_FATURA.AsString := Trim( msk_nr_fatura.Text );
      pgctrl_dem_fat.Enabled := True;
      dbedt_nr_fat.SetFocus;
    end;

    if pgctrl_dem_fat.ActivePage = ts_cntr then
    begin
      if qry_fat_cntr_.State in [dsInsert] then
         qry_fat_cntr_.Cancel;
      if qry_fat_cntr_.State in [dsInactive] then
      begin
        if Trim( msk_nr_fatura.Text ) <> '' then
          qry_fat_cntr_.ParamByName('NR_FATURA').AsString   := Trim( msk_nr_fatura.Text )
        else
          qry_fat_cntr_.ParamByName('NR_FATURA').AsString   := 'X';
        if Trim( msk_nr_processo.Text ) <> '' then
          qry_fat_cntr_.ParamByName('NR_PROCESSO').AsString := Trim( msk_nr_processo.Text )
        else
          qry_fat_cntr_.ParamByName('NR_PROCESSO').AsString := 'X';
        if Trim( msk_nr_cntr.Text ) <> '' then
          qry_fat_cntr_.ParamByName('NR_CNTR').AsString     := Trim( msk_nr_cntr.Text )
        else
          qry_fat_cntr_.ParamByName('NR_CNTR').AsString     := 'X';
        qry_fat_cntr_.Prepare;
        qry_fat_cntr_.Open;
      end;

      dbedt_nr_fat_cntr.ReadOnly         := False;
      qry_fat_cntr_.Append;
      qry_fat_cntr_CD_UNID_NEG.AsString  := Trim( msk_cd_unid_neg.Text );
      qry_fat_cntr_NR_PERIODO.AsString   := '001';
      qry_fat_cntr_IN_PARCIAL.AsString   := '0';
      qry_fat_cntr_NR_FATURA.AsString    := qry_fat_NR_FATURA.AsString;
      if Trim( msk_nr_processo.Text ) <> '' then
        msk_nr_processo.Text := Trim( msk_nr_processo2.Text )
      else
        msk_nr_processo.Text := '';
      if Trim( msk_nr_cntr.Text ) <> '' then
        qry_fat_cntr_NR_CNTR.AsString := Trim( msk_nr_cntr.Text );
      pgctrl_dem_fat.Enabled := True;
      dbedt_nr_fat_cntr.SetFocus;
    end;
  end;

  btn_mi( False, True, True, False );
end;

procedure Tfrm_dem_fat.dbn_refBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  btn_mi( False, False, False, False );
end;

procedure Tfrm_dem_fat.btn_excluirClick(Sender: TObject);
begin
  with datm_dem_fat do
  begin
    if pgctrl_dem_fat.ActivePage = ts_fat then
    begin
      if BoxMensagem( 'Esta Fatura será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        qry_fat_.Delete;
        qry_lista_fat_.Close;
        qry_lista_fat_.Prepare;
        qry_lista_fat_.Open;
        
        qry_lista_cntr_.Close;
        qry_lista_cntr_.Prepare;
        qry_lista_cntr_.Open;
        VerFat;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_dem_fat.qry_fat_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    if pgctrl_dem_fat.ActivePage = ts_cntr then
    begin
      if BoxMensagem( 'Este Contêiner será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        datm_dem_fat.qry_fat_cntr_.Delete;
        msk_nr_processo.Text := '';
        qry_lista_cntr_.Close;
        qry_lista_cntr_.Prepare;
        qry_lista_cntr_.Open;
        VerFat;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_dem_fat.qry_fat_cntr_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;
end;

procedure Tfrm_dem_fat.btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
begin
  btn_incluir.Enabled  := i;  mi_incluir.Enabled   := i;
  btn_salvar.Enabled   := s;  mi_salvar.Enabled    := s;
  btn_Cancelar.Enabled := c;  mi_Cancelar.Enabled  := c;
  btn_excluir.Enabled  := e;  mi_excluir.Enabled   := e;
end;

procedure Tfrm_dem_fat.pgctrl_dem_fatChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_dem_fat.VerAlt : Boolean;
begin
  VerAlt := True;
  with datm_dem_fat do
  begin
    if ( pgctrl_dem_fat.ActivePage = ts_fat ) then
    begin
      if qry_fat_.State in [dsEdit, dsInsert] then
      begin
        if BoxMensagem( 'Cadastro de Faturas foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
        begin
          if Not Consiste then
          begin
            VerAlt := False;
            Exit;
          end;
          if Not Grava then
          begin
            VerAlt := False;
            Exit;
          end;
        end
        else
          Cancelar;
      end;
    end;

    if ( pgctrl_dem_fat.ActivePage = ts_cntr ) then
    begin
      if qry_fat_cntr_.State in [dsEdit, dsInsert] then
      begin
        if BoxMensagem( 'Cadastro de Contêiners foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
        begin
          if Not Consiste then
          begin
            VerAlt := False;
            Exit;
          end;
          if Not Grava then
          begin
            VerAlt := False;
            Exit;
          end;
        end
        else
          Cancelar;
      end;
    end;
  end;
end;

procedure Tfrm_dem_fat.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_dem_fat.VerFat;
begin
  with datm_dem_fat do
  begin
    if Not ( qry_fat_.State in [dsInactive] ) then
    begin
      if Not ( qry_fat_.EOF ) then
      begin
        dbedt_nr_fat.ReadOnly := False;
      end
      else
      begin
        dbedt_nr_fat.ReadOnly := True;
      end;
    end;

    if Not ( qry_fat_cntr_.State in [dsInactive] ) then
    begin
      if Not ( qry_fat_cntr_.EOF ) then
      begin
        dbedt_nr_fat_cntr.ReadOnly := False;
      end
      else
      begin
        dbedt_nr_fat_cntr.ReadOnly := True;
      end;
    end;
  end;
end;

function Tfrm_dem_fat.Grava : Boolean;
var
  NrFatAnt, NrProcessoAnt, NrCntrAnt  : String;
begin
  Grava := True;
  with datm_dem_fat do
  begin
    if ( pgctrl_dem_fat.ActivePage = ts_fat ) then
    begin
      try
        datm_main.db_broker.StartTransaction;

        NrFatAnt := qry_fat_NR_FATURA.AsString;
        if qry_fat_.State in [ dsInsert, dsEdit ] then
        begin
          qry_fat_.Post;
          qry_lista_fat_.Close;
          qry_lista_fat_.ParamByName('NR_FATURA').AsString   := NrFatAnt;
          qry_lista_fat_.ParamByName('NR_PROCESSO').AsString := '';
          qry_lista_fat_.ParamByName('NR_CNTR').AsString     := '';
          qry_lista_fat_.Prepare;
          qry_lista_fat_.Open;
          qry_lista_fat_.Locate('NR_FATURA', NrFatAnt, [loCaseInsensitive] );
          VerFat;
        end;

        datm_main.db_broker.Commit;
        Grava := True;
      except
        on E: Exception do
        begin
          qry_fat_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Grava := False;
        end;
      end;
    end;

    if ( pgctrl_dem_fat.ActivePage = ts_cntr ) then
    begin
      try
        datm_main.db_broker.StartTransaction;

        NrFatAnt      := qry_fat_cntr_NR_FATURA.AsString;
        NrCntrAnt     := qry_fat_cntr_NR_CNTR.AsString;
        NrProcessoAnt := qry_fat_cntr_NR_PROCESSO.AsString;

        if qry_fat_cntr_.State in [ dsInsert, dsEdit ] then
        begin
          qry_fat_cntr_.Post;
          qry_lista_cntr_.Close;
          qry_lista_cntr_.ParamByName('NR_FATURA').AsString   := NrFatAnt;
          qry_lista_cntr_.ParamByName('NR_PROCESSO').AsString := '';
          qry_lista_cntr_.ParamByName('NR_CNTR').AsString     := '';
          qry_lista_cntr_.Prepare;
          qry_lista_cntr_.Open;
          qry_lista_cntr_.Locate('NR_FATURA;NR_CNTR;NR_PROCESSO',
            VarArrayOf([NrFatAnt,NrCntrAnt,NrProcessoAnt]),[loCaseInsensitive] );
          VerFat;
        end;

        datm_main.db_broker.Commit;
        Grava := True;
      except
        on E: Exception do
        begin
          qry_fat_cntr_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Grava := False;
        end;
      end;
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end;
end;

procedure Tfrm_dem_fat.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    str_cd_rotina_atalho := '';
    Close;
  end;
end;

procedure Tfrm_dem_fat.Abertura;
begin
  with datm_dem_fat do
  begin
    if lAbertura then
    begin
      msk_nr_fatura.Text := '';
      msk_nr_cntr.Text   := '';
      var_nr_fatura      := '';
      var_nr_cntr        := '';
    end;
  end;

  VerFatura;

  datm_dem_fat.ds_fat.AutoEdit := st_modificar;
end;

procedure Tfrm_dem_fat.dbedt_nr_fat_cntrChange(Sender: TObject);
begin
  if Not lAbertura then
  begin
    if ( datm_dem_fat.qry_fat_cntr_.State in [ dsInsert, dsEdit ] ) then
       btn_mi(False, True, True, False);
  end;
end;

procedure Tfrm_dem_fat.btn_proc_realizaClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0110';

  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_dem_fat.btn_co_faturaClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm( Tfrm_consulta_processo, frm_consulta_processo );
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if ( frm_consulta_processo.Nr_Processo <> '' ) then
  begin
    //rever
    msk_nr_fatura.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
    msk_nr_faturaExit(nil);
  end;
end;

procedure Tfrm_dem_fat.msk_nr_faturaExit(Sender: TObject);
begin
  with datm_dem_fat do
  begin
    if Trim( msk_nr_fatura.Text ) <> '' then
    begin
      if Not VerFatura then
      begin
        msk_nr_fatura.SetFocus;
        Exit;
      end;
    end;
  end;
end;

function Tfrm_dem_fat.VerFatura;
begin
  VerFatura := True;
  if ( ( Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo2.Text ) ) = var_nr_proc2 ) and
     ( Trim( msk_nr_fatura.Text ) = var_nr_fatura ) and
     ( Trim( msk_nr_cntr.Text ) = var_nr_cntr ) then Exit;

  with datm_dem_fat do
  begin
    if Trim( msk_nr_processo2.Text ) <> '' then
    begin
      qry_processo_.Close;
      qry_processo_.UnPrepare;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                           Trim( msk_cd_produto.Text ) +
                                                           Trim( msk_nr_processo2.Text );
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.EOF then
      begin
        qry_processo_.Close;
        BoxMensagem( 'Processo não encontrado! Digite novamente!', 2 );
        VerFatura := False;
        Exit;
      end;

      if qry_processo_IN_CANCELADO.AsString = '1' then
      begin
        qry_processo_.Close;
        BoxMensagem( 'Processo Cancelado! Digite novamente!', 2 );
        VerFatura := False;
        Exit;
      end;

      if qry_processo_IN_LIBERADO.AsString = '0' then
      begin
        qry_processo_.Close;
        BoxMensagem( 'Processo não está liberado! Digite novamente!', 2 );
        VerFatura := False;
        Exit;
      end;

      if qry_processo_IN_PRODUCAO.AsString = '0' then
      begin
        qry_processo_.Close;
        BoxMensagem( 'Processo não está na produção! Digite novamente!', 2 );
        VerFatura := False;
        Exit;
      end;
    end;

    //Fatura
    qry_lista_fat_.Close;
    qry_lista_fat_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    if ( Trim( msk_nr_fatura.Text ) <> '' ) then
      qry_lista_fat_.ParamByName('NR_FATURA').AsString := Trim( msk_nr_fatura.Text )
    else
      qry_lista_fat_.ParamByName('NR_FATURA').AsString := '';
    if ( Trim( msk_nr_cntr.Text ) <> '' ) then
      qry_lista_fat_.ParamByName('NR_CNTR').AsString := Trim( msk_nr_cntr.Text )
    else
      qry_lista_fat_.ParamByName('NR_CNTR').AsString := '';
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and
       ( Trim( msk_cd_produto.Text ) <> '' ) and
       ( Trim( msk_nr_processo2.Text ) <> '' ) then
      qry_lista_fat_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                            Trim( msk_cd_produto.Text ) +
                                                            Trim( msk_nr_processo2.Text )
    else
      qry_lista_fat_.ParamByName('NR_PROCESSO').AsString := '';
    qry_lista_fat_.Prepare;
    if ( qry_lista_fat_.ParamByName('NR_FATURA').AsString <> '' ) or
       ( qry_lista_fat_.ParamByName('NR_CNTR').AsString <> '' ) or
       ( qry_lista_fat_.ParamByName('NR_PROCESSO').AsString <> '' ) then
      qry_lista_fat_.Open;

    //Contêineres
    qry_lista_cntr_.Close;
    qry_lista_cntr_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and
       ( Trim( msk_cd_produto.Text ) <> '' ) and
       ( Trim( msk_nr_processo2.Text ) <> '' ) then
      qry_lista_cntr_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                             Trim( msk_cd_produto.Text ) +
                                                             Trim( msk_nr_processo2.Text )
    else
      qry_lista_cntr_.ParamByName('NR_PROCESSO').AsString := '';
    if ( Trim( msk_nr_fatura.Text ) <> '' ) then
      qry_lista_cntr_.ParamByName('NR_FATURA').AsString := Trim( msk_nr_fatura.Text )
    else
      qry_lista_cntr_.ParamByName('NR_FATURA').AsString := '';
    if ( Trim( msk_nr_cntr.Text ) <> '' ) then
      qry_lista_cntr_.ParamByName('NR_CNTR').AsString := Trim( msk_nr_cntr.Text )
    else
      qry_lista_cntr_.ParamByName('NR_CNTR').AsString := '';
    qry_lista_cntr_.Prepare;
    if ( qry_lista_cntr_.ParamByName('NR_FATURA').AsString <> '' ) or
       ( qry_lista_cntr_.ParamByName('NR_CNTR').AsString <> '' ) or
       ( qry_lista_cntr_.ParamByName('NR_PROCESSO').AsString <> '' ) then
      qry_lista_cntr_.Open;
  end;
end;

procedure Tfrm_dem_fat.msk_nr_faturaEnter(Sender: TObject);
begin
  var_nr_fatura := Trim( msk_nr_fatura.Text );
end;

procedure Tfrm_dem_fat.msk_nr_faturaChange(Sender: TObject);
begin
  if datm_dem_fat.qry_fat_cntr_.Active then
     datm_dem_fat.qry_fat_cntr_.Close;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_dem_fat.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_dem_fat, datm_dem_fat );
end;

procedure Tfrm_dem_fat.dbedt_nr_fatExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_dem_fat.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg_proc := msk_cd_unid_neg.Text;
end;

procedure Tfrm_dem_fat.msk_cd_unid_negExit(Sender: TObject);
begin
  with datm_dem_fat do
  begin
    if cd_unid_neg_proc = msk_cd_unid_neg.Text then Exit;
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_unid_neg );
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if ( qry_unid_neg_.EOF ) then
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada ou Usuário sem direitos de acesso!', 2 );
        msk_cd_unid_neg.Text  := '';
        edt_nm_unid_neg.Text  := '';
        msk_nr_processo2.Text := '';
        msk_cd_unid_neg.SetFocus;
        qry_unid_neg_.Close;
        Exit;
      end
      else
      begin
        if VerUnidNegProduto then
          edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('NM_UNID_NEG').AsString;
      end;
    end;
    qry_unid_neg_.Close;
  end;
end;

procedure Tfrm_dem_fat.btn_co_unid_negClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);

  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_dem_fat.FormShow(Sender: TObject);
begin
  // Rotinas de FormCreate
  st_modulo     := vStr_cd_modulo;
  st_rotina     := str_cd_rotina;
  var_nr_proc   := '';
  var_nr_proc2  := '';
  var_nr_fatura := '';
  var_nr_cntr   := '';

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );

  // Fim Rotinas de FormCreate

  pgctrl_dem_fat.ActivePage := ts_fat;

  with datm_dem_fat do
  begin
    qry_yes_no_.Close;
    qry_yes_no_.Prepare;
    qry_yes_no_.Open;
  end;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);

  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);

  lAbertura := True;
  Abertura;
  lAbertura := False;

  lNaoConsiste              := False;

  btn_mi( st_incluir, False, False, st_excluir );

  msk_nr_fatura.SetFocus;
end;

procedure Tfrm_dem_fat.msk_nr_processo2Enter(Sender: TObject);
begin
  var_nr_proc2 := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo2.Text );
end;

procedure Tfrm_dem_fat.msk_nr_processo2Exit(Sender: TObject);
begin
  with datm_dem_fat do
  begin
    if Trim( msk_nr_processo2.Text ) <> '' then
    begin
      if Not VerFatura then
      begin
        pgctrl_dem_fat.Enabled := False;
        msk_nr_processo2.SetFocus;
        Exit;
      end
      else
      begin
        pgctrl_dem_fat.Enabled := True;
        pgctrl_dem_fat.SetFocus;
      end;
    end
    else
    begin
      pgctrl_dem_fat.Enabled := Not qry_fat_cntr_.EOF;
    end;
  end;
end;

procedure Tfrm_dem_fat.msk_nr_cntrExit(Sender: TObject);
begin
  with datm_dem_fat do
  begin
    if Trim( msk_nr_cntr.Text ) <> '' then
    begin
      if Not VerFatura then
      begin
        msk_nr_cntr.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_dem_fat.msk_nr_cntrEnter(Sender: TObject);
begin
  var_nr_cntr := Trim( msk_nr_cntr.Text );
end;

procedure Tfrm_dem_fat.msk_cd_produtoEnter(Sender: TObject);
begin
  cd_produto_proc := msk_cd_produto.Text;
end;

procedure Tfrm_dem_fat.msk_cd_produtoExit(Sender: TObject);
begin
  with datm_dem_fat do
  begin
    if cd_unid_neg_proc = msk_cd_unid_neg.Text then Exit;
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_unid_neg );
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if ( qry_unid_neg_.EOF ) then
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada ou Usuário sem direitos de acesso!', 2 );
        msk_cd_unid_neg.Text  := '';
        edt_nm_unid_neg.Text  := '';
        msk_nr_processo2.Text := '';
        msk_cd_unid_neg.SetFocus;
        qry_unid_neg_.Close;
        Exit;
      end
      else
      begin
        if VerUnidNegProduto then
          edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('NM_UNID_NEG').AsString;
      end;
    end;
    qry_unid_neg_.Close;
  end;
end;

procedure Tfrm_dem_fat.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg  then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto   then btn_co_produtoClick(nil);
    if Sender = msk_nr_processo2 then btn_co_processo2Click(nil);
    if Sender = msk_nr_processo  then btn_co_processoClick(nil);
  end;

  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo2 ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo2.Text := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processo2Exit(nil);
    end;
  end;

  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.msk_nr_cntr.Text := dbedt_nr_cntr.Text;
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

function Tfrm_dem_fat.VerUnidNegProduto : Boolean;
var
  nr_processo : String;
begin
  with datm_dem_fat do
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;

    VerUnidNegProduto := True;
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) <> '' ) then
    begin
      // abre queries
      qry_usuario_habilitacao_.Close;
      qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_usuario_habilitacao_.Prepare;
      qry_usuario_habilitacao_.Open;
      if Not qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([ Trim( msk_cd_unid_neg.Text ), Trim( msk_cd_produto.Text )]), [loCaseInsensitive]) then
      begin
        BoxMensagem( 'Unidade x Produto não encontrado ou sem habilitação para o usuário!', 2 );
        edt_nm_unid_neg.Text        := '';
        edt_nm_produto.Text         := '';
        msk_nr_processo2.Text       := '';
        VerUnidNegProduto           := False;
      end
      else
      begin
        Screen.Cursor := crHourGlass;
        Application.ProcessMessages;
        edt_nm_unid_neg.Text := qry_usuario_habilitacao_.FieldByName('AP_UNID_NEG').AsString;
        edt_nm_produto.Text  := qry_usuario_habilitacao_.FieldByName('AP_PRODUTO').AsString;
        nr_processo          := qry_processo_NR_PROCESSO.AsString;

        qry_processo_.Close;
        qry_processo_.ParamByName('NR_PROCESSO').asString := nr_processo;
        qry_processo_.Prepare;
        qry_processo_.Open;

        Screen.Cursor := crDefault;
        Application.ProcessMessages;
      end;
    end
    else
       edt_nm_unid_neg.Text := '';

    Screen.Cursor := crDefault;
    Application.ProcessMessages;
  end;
end;

procedure Tfrm_dem_fat.btn_co_produtoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_produto, frm_produto);

  with frm_produto do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
  msk_cd_produtoExit(nil);
end;

procedure Tfrm_dem_fat.btn_co_processo2Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm( Tfrm_consulta_processo, frm_consulta_processo );
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if ( frm_consulta_processo.Nr_Processo <> '' ) then
  begin
    msk_nr_processo2.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
    msk_nr_processo2Exit(nil);
  end;
end;

procedure Tfrm_dem_fat.btn_co_processoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm( Tfrm_consulta_processo, frm_consulta_processo );
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if ( frm_consulta_processo.Nr_Processo <> '' ) then
  begin
    msk_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
    msk_nr_processoExit(nil);
  end;
end;

procedure Tfrm_dem_fat.dbedt_nr_processoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_dem_fat.msk_nr_processoExit(Sender: TObject);
begin
  with datm_dem_fat do
  begin
    CodExits;
    if qry_fat_cntr_.State in [dsEdit, dsInsert] then
    begin
      qry_fat_cntr_NR_PROCESSO.AsString := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) +
                                      Trim( msk_nr_processo.Text );
    end;
  end;
end;

procedure Tfrm_dem_fat.msk_nr_processoChange(Sender: TObject);
begin
  if var_nr_proc = '' then Exit;
  if ( Not ( datm_dem_fat.qry_fat_cntr_.State in [dsInsert, dsEdit] ) ) and ( datm_dem_fat.qry_fat_cntr_.Active ) then
    datm_dem_fat.qry_fat_cntr_.Edit;
  dbedt_nr_fat_cntrChange(nil);
end;

procedure Tfrm_dem_fat.msk_nr_processoEnter(Sender: TObject);
begin
  var_nr_proc := Trim( msk_nr_processo.Text );
end;

procedure Tfrm_dem_fat.dbedt_nr_cntrExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_dem_fat.btn_co_moedaClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_moeda, frm_moeda );
  frm_moeda.Cons_OnLine := datm_dem_fat.qry_fat_cntr_CD_MOEDA_FATURA;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_dem_fat.qry_fat_cntr_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
      datm_dem_fat.qry_fat_cntr_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_dem_fat do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  dbedt_cd_moedaExit(Sender);
end;

procedure Tfrm_dem_fat.dbedt_cd_moedaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_dem_fat.dbedt_nr_dias_cobradosExit(Sender: TObject);
begin
  CodExits;
  with datm_dem_fat do
  begin
    if Trim( dbedt_nr_dias_cobrados.Text ) <> '' then
    begin
      if ( StrToInt( Trim( dbedt_nr_dias_cobrados.Text ) ) < qry_fat_cntr_CalcDiasCobrar.AsInteger ) and
         ( qry_fat_cntr_IN_PARCIAL.AsString = '0' ) then
      begin
        BoxMensagem( 'Fatura deve conter ' + IntToStr( qry_fat_cntr_CalcDiasCobrar.AsInteger ) +
                     ' dias a cobrar!', 3 );
      end;
    end;
  end;
end;

procedure Tfrm_dem_fat.dblckpbox_parcialClick(Sender: TObject);
begin
  dbedt_nr_fat_cntrChange(nil);
  with datm_dem_fat do
  begin
    if qry_fat_cntr_IN_PARCIAL.AsString = '1' then
    begin
      dbedt_dt_inicio.Enabled  := True;
      dbedt_dt_inicio.TabStop  := True;
      dbedt_dt_inicio.ReadOnly := False;
      dbedt_dt_inicio.Color    := clWindow;

      dbedt_dt_fim.Enabled     := True;
      dbedt_dt_fim.TabStop     := True;
      dbedt_dt_fim.ReadOnly    := False;
      dbedt_dt_fim.Color       := clWindow;
    end
    else
    begin
      dbedt_dt_inicio.Enabled  := False;
      dbedt_dt_inicio.TabStop  := False;
      dbedt_dt_inicio.ReadOnly := True;
      dbedt_dt_inicio.Color    := clMenu;

      dbedt_dt_fim.Enabled     := False;
      dbedt_dt_fim.TabStop     := False;
      dbedt_dt_fim.ReadOnly    := True;
      dbedt_dt_fim.Color       := clMenu;
    end;
  end;
end;

procedure Tfrm_dem_fat.dbedt_nr_fat_cntrExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_dem_fat.dbedt_nr_fatChange(Sender: TObject);
begin
  if Not lAbertura then
  begin
    if ( datm_dem_fat.qry_fat_.State in [ dsInsert, dsEdit ] ) then
       btn_mi(False, True, True, False);
  end;
end;

procedure Tfrm_dem_fat.dbedt_nr_periodoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_dem_fat.btn_cntrClick(Sender: TObject);
begin
  with datm_dem_fat do
  begin
    str_cd_rotina_atalho := '0126';

    str_nr_processo := qry_fat_cntr_NR_PROCESSO.AsString;
    str_nr_cntr     := qry_fat_cntr_NR_CNTR.AsString;

    if Not VerAlt then Exit;
    Close;
  end;
end;


end.


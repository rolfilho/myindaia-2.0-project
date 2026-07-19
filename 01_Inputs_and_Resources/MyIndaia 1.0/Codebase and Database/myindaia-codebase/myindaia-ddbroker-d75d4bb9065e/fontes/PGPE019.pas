(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGPE019.PAS - Processo de Exportação - Itens
Manutenção:
Data:
*************************************************************************************************)
unit PGPE019;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolEdit, StdCtrls, DBCtrls, Db, DBTables, ExtCtrls, Menus, Mask,
  ComCtrls, Buttons, RXDBCtrl, Funcoes, ConsOnLineEx,
  FormsLog, Grids, DBGrids; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;
  
type
  Tfrm_exp_itens = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_novo_item: TSpeedButton;
    btn_capa_exp: TSpeedButton;
    btn_excluir: TSpeedButton;
    menu_manut_cadastro: TMainMenu;
    mi_novo_item: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    btn_duplicar: TSpeedButton;
    mi_excluir: TMenuItem;
    pgctrl_Item: TPageControl;
    ts_item1: TTabSheet;
    mi_duplicar: TMenuItem;
    btn_calculo: TSpeedButton;
    ts_embalagem: TTabSheet;
    mi_calcular: TMenuItem;
    btn_manut_proc: TSpeedButton;
    mi_manut_proc: TMenuItem;
    btn_repassa_ncm_naladi_doc: TSpeedButton;
    Label6: TLabel;
    Label17: TLabel;
    DBNavigator: TDBNavigator;
    dbedt_nm_item_inicial_li: TDBEdit;
    dbedt_item_final_li: TDBEdit;
    btn_re: TSpeedButton;
    mi_re: TMenuItem;
    shpPesquisa: TShape;
    bvlMercadoria: TBevel;
    Label35: TLabel;
    btn_co_mercadoria: TSpeedButton;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    btn_co_unid_medida: TSpeedButton;
    btn_co_naladi: TSpeedButton;
    btn_co_ncm: TSpeedButton;
    Label43: TLabel;
    Label44: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    lbl_norma: TLabel;
    btn_co_normas: TSpeedButton;
    Label8: TLabel;
    lbl_fabr_prod: TLabel;
    btn_co_fabr_item: TSpeedButton;
    lbl_pais: TLabel;
    btn_co_pais_origem: TSpeedButton;
    Label11: TLabel;
    lbl_ncm_doc: TLabel;
    btn_co_ncm_doc: TSpeedButton;
    lbl_naladi_doc: TLabel;
    btn_co_naladi_doc: TSpeedButton;
    btn_co_acordo: TSpeedButton;
    lbl_anexo: TLabel;
    lbl_ato_concessorio: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    dbrdgrp_fabr_expo: TDBRadioGroup;
    dbedt_qt_mercadoria: TDBEdit;
    dbedt_vl_unitario: TDBEdit;
    dbedt_vl_mle: TDBEdit;
    dbedt_cd_ncm: TDBEdit;
    dbedt_cd_naladi: TDBEdit;
    dbedt_peso_liquido: TDBEdit;
    dbedt_vl_mcv: TDBEdit;
    edt_nm_mercadoria: TEdit;
    dbedt_nr_ped_imp: TDBEdit;
    dbm_descr_mercadoria: TDBMemo;
    dbedt_vl_exw: TDBEdit;
    dbedt_peso_liq_total: TDBEdit;
    dbedt_peso_bruto_total: TDBEdit;
    dbedt_nr_pedido: TDBEdit;
    dbedt_cd_pais_origem: TDBEdit;
    dbedt_nr_anexo: TDBEdit;
    dbedt_nr_ato_concessorio: TDBEdit;
    dbedt_dt_remessa: TDBDateEdit;
    dbedt_cd_acordo: TDBEdit;
    dbedt_cd_unid_medida: TDBEdit;
    dbedt_cd_naladi_doc: TDBEdit;
    dbedt_cd_ncm_doc: TDBEdit;
    dbedt_cd_mercadoria: TDBEdit;
    dbedt_cd_norma: TDBEdit;
    dbedt_cd_fabr_item: TDBEdit;
    DBEdit3: TDBEdit;
    dbedt_vl_fretei: TDBEdit;
    bvlLinha1: TBevel;
    bvlLinha2: TBevel;
    shpTotais: TShape;
    shpNavigator: TShape;
    bvlEmbalagem: TBevel;
    Label13: TLabel;
    Label16: TLabel;
    btn_co_embalagem: TSpeedButton;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label4: TLabel;
    btn_co_emb_sup: TSpeedButton;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label58: TLabel;
    Label57: TLabel;
    Label62: TLabel;
    Label12: TLabel;
    dbedt_nr_processo_emb: TDBEdit;
    dbedt_classif_embal: TDBEdit;
    dbedt_qt_por_embalagem: TDBEdit;
    dbedt_qt_de_emb: TDBEdit;
    dbedt_vl_por_emb: TDBEdit;
    dbedt_cd_embalagem: TDBEdit;
    dbedt_class_emb_sup: TDBEdit;
    dbedt_qt_por_emb_sup: TDBEdit;
    dbedt_qt_de_emb_sup: TDBEdit;
    dbedt_vl_por_emb_sub: TDBEdit;
    dbedt_cd_emb_sup: TDBEdit;
    dbedt_peso_emb: TDBEdit;
    dbedt_alt_emb: TDBEdit;
    dbedt_larg_emb: TDBEdit;
    dbedt_compr_emb: TDBEdit;
    dbedt_vl_cubagem: TDBEdit;
    dbedtNmEmbPacking: TDBEdit;
    bvlLinha4: TBevel;
    bvlLinha5: TBevel;
    bvlLinha6: TBevel;
    edt_nm_ncm_doc: TEdit;
    edt_nm_naladi_doc: TEdit;
    dbedtNrSeqNCMDoc: TDBEdit;
    dbedtNrSeqNALADIDoc: TDBEdit;
    edt_nm_unid_medida: TEdit;
    edt_nm_acordo: TEdit;
    edt_nm_norma: TEdit;
    edt_nm_fabr_item: TEdit;
    edt_nm_pais_origem: TEdit;
    edt_nm_embalagem: TEdit;
    edt_nm_emb_sup: TEdit;
    dbedt_nr_processo: TDBEdit;
    Label15: TLabel;
    dbedt_nr_nf: TDBEdit;
    btnCoNF: TSpeedButton;
    dbedt_cd_sulf_ncm: TDBEdit;
    Label22: TLabel;
    dbedt_cd_unid_medida_estat: TDBEdit;
    edt_nm_unidade_medida_estat: TEdit;
    btn_co_cd_unid_medida_estat: TSpeedButton;
    dbedt_qt_unid_medida_estat: TDBEdit;
    Label23: TLabel;
    Label63: TLabel;
    dbedtCFOP: TDBEdit;
    edtCFOP: TEdit;
    btn_co_cd_cfop: TSpeedButton;
    tbsLotes: TTabSheet;
    dbgLotes: TDBGrid;
    dbedtCD_LOTE: TDBEdit;
    dbedtDT_FABRICACAO: TDBEdit;
    dbedtDT_VENCIMENTO: TDBEdit;
    dbedtQT_MERCADORIA: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    dbedtQT_PESO_LIQ: TDBEdit;
    Label29: TLabel;
    dbedtQT_PESO_BRUTO: TDBEdit;
    dbedtCHAVE_NOTA: TDBEdit;
    Label30: TLabel;
    Bevel1: TBevel;
    tbContainers: TTabSheet;
    dbgrd_cntr: TDBGrid;
    dbedtQtMercadoria: TDBEdit;
    Label103: TLabel;
    dbedtPesoBruto: TDBEdit;
    lblTemp: TLabel;
    Label31: TLabel;
    dbcbContainer: TDBLookupComboBox;
    Label32: TLabel;
    dbedtVolume: TDBEdit;
    btnCarregarTotais: TBitBtn;
    Label33: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_novo_itemClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_capa_expClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_co_mercadoriaClick(Sender: TObject);
    procedure dbedt_cd_mercadoriaExit(Sender: TObject);
    procedure btn_duplicarClick(Sender: TObject);
    procedure dbedt_vl_unitarioEnter(Sender: TObject);
    procedure dbedt_vl_itemEnter(Sender: TObject);
    procedure dbedt_cd_mercadoriaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbedt_vl_unitarioExit(Sender: TObject);
    procedure dbedt_qt_mercadoriaEnter(Sender: TObject);
    procedure btn_co_ncmClick(Sender: TObject);
    procedure btn_co_naladiClick(Sender: TObject);
    procedure btn_co_unid_medidaClick(Sender: TObject);
    procedure btn_co_embalagemClick(Sender: TObject);
    procedure dbedt_cd_ncmExit(Sender: TObject);
    procedure dbedt_cd_unid_medidaExit(Sender: TObject);
    procedure dbedt_cd_embalagemExit(Sender: TObject);
    procedure dbedt_qt_por_embalagemExit(Sender: TObject);
    procedure dbedt_alt_embExit(Sender: TObject);
    procedure dbedt_peso_liquidoExit(Sender: TObject);
    procedure dbedt_qt_mercadoriaExit(Sender: TObject);
    procedure btn_calculoClick(Sender: TObject);
    procedure dbedt_qt_por_emb_supExit(Sender: TObject);
    procedure btn_co_emb_supClick(Sender: TObject);
    procedure btn_co_normasClick(Sender: TObject);
    procedure btn_co_fabr_itemClick(Sender: TObject);
    procedure dbrdgrp_fabr_expoChange(Sender: TObject);
    procedure btn_co_pais_origemClick(Sender: TObject);
    procedure dbedt_cd_ncm_docExit(Sender: TObject);
    procedure dbedt_cd_naladi_docExit(Sender: TObject);
    procedure btn_co_ncm_docClick(Sender: TObject);
    procedure btn_co_naladi_docClick(Sender: TObject);
    procedure dbedt_cd_acordoExit(Sender: TObject);
    procedure btn_co_acordoClick(Sender: TObject);
    procedure btn_manut_procClick(Sender: TObject);
    procedure btn_repassa_ncm_naladi_docClick(Sender: TObject);
    procedure btn_reClick(Sender: TObject);
    procedure dbedt_nr_ped_impExit(Sender: TObject);
    procedure dbedtNrSeqNCMDocChange(Sender: TObject);
    procedure dbedtNrSeqNALADIDocChange(Sender: TObject);
    procedure dbedt_nr_nfChange(Sender: TObject);
    procedure btnCoNFClick(Sender: TObject);
    procedure dbedt_cd_unid_medida_estatChange(Sender: TObject);
    procedure dbedt_cd_unid_medida_estatExit(Sender: TObject);
    procedure dbedtCFOPChange(Sender: TObject);
    procedure btn_co_cd_cfopClick(Sender: TObject);
    procedure pgctrl_ItemChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_ItemChange(Sender: TObject);
    procedure btnCarregarTotaisClick(Sender: TObject);
  private
    vAlterouNF: Boolean;
    function VerAlt            : Boolean;
    function Grava             : Boolean;
    function Consiste : Boolean;
    procedure Cancelar;
    procedure CodExits;
    procedure Desabilita_Entrada;
    procedure Habilita_Entrada;
    procedure GravaNCMsProcesso;
    function ValidaContainer : boolean;    
  public
    vl_old, vl_new, vl2_old, vl2_new   : double;
    nr_adicao, nr_item                 : string[3];
    lNaoConsiste, in_LI_Montada, in_abrindo_itens, lCalculo : Boolean;
    lCons_OnLine, lHabilita_NCM_DOC, lHabilita_NALADI_DOC : Boolean;
    nr_seq_ncm, nr_seq_naladi, nr_seq_ncm_doc, nr_seq_naladi_doc : Integer;
  end;

var
  frm_exp_itens: Tfrm_exp_itens;

implementation

uses GSMLIB, PGGP001, PGGP017, PGPE018, PGPE020, PGPE022, PGSM200, PGSM204,
  uExpMontaRe, uReCapa, dReCapa;{, PGGP018, PGGP033, PGPO002 }
{$R *.DFM}

procedure Tfrm_exp_itens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Screen.Cursor := crArrow;

  with datm_exp_itens do
  begin
    if ( Not ( lCalculo ) ) and ( qry_exp_itens_.RecordCount <> 0 ) then
    begin
      // A linha abaixo foi substituida pelo calculo, pois criavam o RE sem calcular e ficcavam com valores zerados - Michel - 23/01/2009
      //BoxMensagem( 'Processo deverá ser calculado !!', 3 );
      btn_calculoClick(btn_calculo);
      frm_exp_itens.SetFocus;
      Screen.Cursor := crDefault;
      Exit;
    end;

    if VerAlt then
    begin
      nr_processo_gestao := qry_exp_itens_NR_PROCESSO.AsString;

      qry_exp_.Close;
      qry_exp_itens_.Close;
      qry_mercadoria_.Close;
      qry_emp_nac_.Close;
      qry_ncm_.Close;
      qry_naladi_.Close;
      qry_embalagem_.Close;
      qry_acordo_normas_.Close;
      qry_merc_acordo_pais_.Close;
      qry_total_itens_.Close;
      qry_ncm_doc_.Close;
      qry_naladish_doc_.Close;

      Free;
      Action := caFree;
    end
    else
    begin
      Action := caNone;
      Exit;
    end;
  end;
end;

procedure Tfrm_exp_itens.btn_sairClick(Sender: TObject);
begin
  pgctrl_Item.SetFocus;
  if ( Not (lCalculo) ) and ( datm_exp_itens.qry_exp_itens_.RecordCount <> 0 ) then
  begin
    // A linha abaixo foi substituida pelo calculo, pois criavam o RE sem calcular e ficcavam com valores zerados - Michel - 23/01/2009
    //BoxMensagem( 'Processo deverá ser calculado !!', 3 );
    btn_calculoClick(btn_calculo);
    frm_exp_itens.SetFocus;
    Exit;
  end;
  str_cd_rotina_atalho := '';
  Close;
end;

procedure Tfrm_exp_itens.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  with datm_exp_itens do
  begin
    Screen.Cursor := crHourGlass;
    lCalculo := True;

    if not (bCriando) then
    begin
      if datm_exp.qry_exp_NR_PROCESSO.AsString <> '' then
        str_nr_processo := datm_exp.qry_exp_NR_PROCESSO.AsString;
    end;
    Caption := Trim( frm_exp_itens.Caption ) + ' [ ' + Copy( Trim( str_nr_processo ),5,14 ) + ' ] ';

    qry_exp_.Close;
    qry_exp_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
    qry_exp_.Open;

    qryProcContainer.close;
    cdsProcContainer.close;
    qryProcContainer.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qryProcContainer.open;
    cdsProcContainer.open;

    qry_exp_itens_.Close;
    qry_exp_itens_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
    qry_exp_itens_.Open;

    qry_exp_itens_.first;

    if qry_exp_itens_.EOF then
    begin
      Desabilita_Entrada;
      btn_novo_item.Enabled := True;
      mi_novo_item.Enabled  := True;
      btn_capa_exp.Enabled  := True;
    end
    else
    begin
      Habilita_Entrada;
      btn_salvar.Enabled   := False;
      mi_salvar.Enabled    := False;
      btn_cancelar.Enabled := False;
      mi_cancelar.Enabled  := False;
      mi_excluir.Enabled   := True;
      mi_duplicar.Enabled  := True;
      mi_novo_item.Enabled := True;

      if dbedt_cd_acordo.Text <> '' then
      begin
        lbl_norma.Enabled      := True;
        dbedt_cd_norma.Enabled := True;
        btn_co_normas.Enabled  := True;
      end
      else
      begin
        lbl_norma.Enabled      := False;
        dbedt_cd_norma.Enabled := False;
        btn_co_normas.Enabled  := False;
        dbedt_cd_norma.Text    := '';
        edt_nm_norma.Text      := '';
      end;
    end;
    btn_sair.Enabled       := True;
    pgctrl_Item.ActivePage := ts_item1;

    Screen.Cursor := crArrow;
  end;
end;

procedure Tfrm_exp_itens.btn_novo_itemClick(Sender: TObject);
begin
  if (pgctrl_Item.ActivePage = ts_item1) or (pgctrl_Item.ActivePage = ts_embalagem) then
  begin
    with datm_exp_itens do
    begin
      Habilita_entrada;
      lCalculo := False;

      qry_exp_itens_.Insert;
      qry_exp_itens_NR_PROCESSO.AsString := str_nr_processo;
      NullToZero( qry_exp_itens_QT_MERCADORIA     );
      NullToZero( qry_exp_itens_VL_UNITARIO       );
      NullToZero( qry_exp_itens_VL_PESO_LIQ_UNIT  );
      NullToZero( qry_exp_itens_QT_POR_EMB        );
      NullToZero( qry_exp_itens_QT_EMBALAGEM      );
      NullToZero( qry_exp_itens_VL_POR_EMB        );
      NullToZero( qry_exp_itens_VL_COMPRIMENTO_EMB);
      NullToZero( qry_exp_itens_VL_LARGURA_EMB    );
      NullToZero( qry_exp_itens_VL_ALTURA_EMB     );
      NullToZero( qry_exp_itens_VL_PESO_EMB       );
      NullToZero( qry_exp_itens_VL_TOT_PESO_LIQ   );
      NullToZero( qry_exp_itens_VL_TOT_PESO_BRUTO );
      NullToZero( qry_exp_itens_VL_CUBAGEM        );
      NullToZero( qry_exp_itens_VL_MLE            );
      NullToZero( qry_exp_itens_VL_MCV            );

      if (qry_exp_IN_FABR_EXPO.AsString = '1') or (qry_exp_IN_FABR_EXPO.AsString = '2') or (qry_exp_IN_FABR_EXPO.AsString = '3') then
      begin
        qry_exp_itens_CD_FABR_EXPO.AsString := qry_exp_IN_FABR_EXPO.AsString;
        if qry_exp_IN_FABR_EXPO.AsString = '2' then
        begin
          if Trim(qry_exp_CD_FABRICANTE.AsString) <> '' then
             qry_exp_itens_CD_FABRICANTE.AsString := qry_exp_CD_FABRICANTE.AsString;
        end;
        if (qry_exp_IN_FABR_EXPO.AsString = '2') or (qry_exp_IN_FABR_EXPO.AsString = '3') then
        begin
          if Trim(qry_exp_CD_PAIS_ORIGEM.AsString) <> '' then
             qry_exp_itens_CD_PAIS_ORIGEM.AsString := qry_exp_CD_PAIS_ORIGEM.AsString;
        end;
      end;
    end;

    pgctrl_Item.ActivePage := ts_item1;
    dbedt_nr_ped_imp.SetFocus;
  end
  else
  if pgctrl_Item.ActivePage = tbsLotes then
  begin
    datm_exp_itens.qryLotes.Insert;
    btn_cancelar.enabled  := true;
    mi_cancelar.enabled   := true;
    btn_salvar.Enabled    := true;
    mi_salvar.Enabled     := true;
  end
  else
  if pgctrl_Item.ActivePage = tbContainers then
  begin
    datm_exp_itens.qry_Exp_Itens_Cntr.Insert; 
    btn_cancelar.enabled  := true;
    mi_cancelar.enabled   := true;
    btn_salvar.Enabled    := true;
    mi_salvar.Enabled     := true;
  end;

  btn_novo_item.Enabled := False;
  mi_novo_item.Enabled  := False;
  btn_duplicar.Enabled  := False;
  mi_duplicar.Enabled   := False;
  btn_excluir.Enabled   := False;
  mi_excluir.Enabled    := False;
  btn_capa_exp.Enabled  := False;
  btn_calculo.Enabled   := False;

  lbl_norma.Enabled      := False;
  dbedt_cd_norma.Enabled := False;
  btn_co_normas.Enabled  := False;
  DBNavigator.Enabled    := False;
end;

procedure Tfrm_exp_itens.btn_salvarClick(Sender: TObject);
var
  Code : Integer;
  nNum : Double;
begin
  ActiveControl := nil;
  if not (pgctrl_Item.ActivePage = tbsLotes) then
  begin     
    if strToFloat(tiraponto(dbedt_qt_mercadoria.Text))= 0 then
    begin
      BoxMensagem('Quantidade Inválida !',2);
      pgctrl_Item.ActivePage := ts_item1;
      ActiveControl := nil;
      dbedt_qt_mercadoria.SetFocus;
      Exit;
    end;
    if dbedt_vl_unitario.Text = '' then
    begin
      BoxMensagem('Valor Unitário Inválido !',2);
      pgctrl_Item.ActivePage := ts_item1;
      dbedt_vl_unitario.SetFocus;
      Exit;
    end;
  end;

  if Not Consiste then
    Exit;
  if Not Grava    then
    Exit;

  vAlterouNF := False;
end;

function Tfrm_exp_itens.Grava;
begin
  Grava := True;
  try
    with datm_exp_itens do
    begin
      qry_exp_itens_.DisableControls;
      qryLotes.DisableControls;
      qry_Exp_Itens_Cntr.DisableControls;


      if (pgctrl_Item.ActivePage = ts_item1) or (pgctrl_Item.ActivePage = ts_embalagem) then
      begin
        datm_main.db_broker.StartTransaction;

        if qry_exp_itens_.State in [dsInsert] then
        begin
          if not (qry_exp_.State in [dsInsert,dsEdit]) then
            qry_exp_.Edit;

          qry_total_itens_.Close;
          qry_total_itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
          qry_total_itens_.Open;

          if qry_total_itens_TOTAL.AsFloat > 0 then
          begin
            qry_exp_QT_TOTAL_ITENS.AsString := StrZero( qry_total_itens_TOTAL.AsFloat + 1, 3 );     // Quantidade Total dos Itens
            qry_exp_itens_NR_ITEM.AsString  := StrZero( qry_total_itens_TOTAL.AsFloat + 1, 3 );     // Numero do Item
          end
          else
          begin
            qry_exp_QT_TOTAL_ITENS.AsString := '001';               // Quantidade Total dos Itens
            qry_exp_itens_NR_ITEM.AsString  := '001';               // Numero do Item
          end;
          qry_total_itens_.Close;
          qry_exp_.Post;
        end;

        if qry_exp_itens_.State in [dsEdit,dsInsert] then
        begin
          qry_exp_itens_VL_MLE.AsFloat := qry_exp_itens_VL_TOT_ITEM.AsFloat;
          qry_exp_itens_VL_MCV.AsFloat := qry_exp_itens_VL_TOT_ITEM.AsFloat;
          if (qry_exp_itens_VL_PESO_LIQ_UNIT.AsFloat = 0) and (qry_exp_itens_VL_TOT_PESO_LIQ.AsFloat <> 0) then
            qry_exp_itens_VL_PESO_LIQ_UNIT.AsFloat := qry_exp_itens_VL_TOT_PESO_LIQ.AsFloat / qry_exp_itens_QT_MERCADORIA.AsFloat;

          qry_exp_itens_.Post;
          nr_item := qry_exp_itens_NR_ITEM.AsString;
        end;

        datm_main.db_broker.Commit;

        GravaNCMsProcesso;

        qry_exp_itens_.Close;
        qry_exp_itens_.Open;
        qry_exp_itens_.Locate('NR_PROCESSO;NR_ITEM', VarArrayOf([str_nr_processo, nr_item]), [loCaseInsensitive]);
      end
      else
      if pgctrl_Item.ActivePage = tbsLotes then
      begin
        datm_main.db_broker.StartTransaction;

        if datm_exp_itens.qryLotes.State in [dsEdit,dsInsert] then
          datm_exp_itens.qryLotes.post;

        datm_main.db_broker.Commit;

        datm_exp_itens.qryLotes.Close;
        datm_exp_itens.qryLotes.Open;
      end
      else
      if pgctrl_Item.ActivePage = tbContainers then
      begin
        if datm_exp_itens.qry_Exp_Itens_Cntr.State in [dsEdit,dsInsert] then
        begin
          if  datm_exp_itens.qry_Exp_Itens_CntrNR_CONTR.asstring <> '' then
          begin
            datm_main.db_broker.StartTransaction;
            datm_exp_itens.qry_Exp_Itens_Cntr.post;
            datm_main.db_broker.Commit;
            datm_exp_itens.qry_Exp_Itens_Cntr.Close;
            datm_exp_itens.qry_Exp_Itens_Cntr.Open;
          end;
        end;
      end;

      btn_novo_item.enabled := True;
      mi_novo_item.enabled  := True;
      btn_salvar.enabled    := False;
      mi_salvar.enabled     := False;
      btn_cancelar.enabled  := False;
      mi_cancelar.enabled   := False;
      btn_excluir.enabled   := True;
      mi_excluir.enabled    := True;
      btn_capa_exp.Enabled  := True;
      btn_duplicar.Enabled  := True;
      mi_duplicar.Enabled   := True;
      btn_calculo.Enabled   := True;

      DBnavigator.Enabled   := True;

      if dbedt_cd_acordo.Text <> '' then
      begin
        lbl_norma.Enabled      := True;
        dbedt_cd_norma.Enabled := True;
        btn_co_normas.Enabled  := True;
      end
      else
      begin
        lbl_norma.Enabled      := False;
        dbedt_cd_norma.Enabled := False;
        btn_co_normas.Enabled  := False;
        dbedt_cd_norma.Text    := '';
        edt_nm_norma.Text      := '';
      end;

      qry_exp_itens_.EnableControls;
      qryLotes.EnableControls;
      qry_Exp_Itens_Cntr.EnableControls;
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;

      TrataErro(E);
      Grava    := False;
      lCalculo := True;
    end;
  end;

  pgctrl_Item.SetFocus;
end;

procedure Tfrm_exp_itens.GravaNCMsProcesso;
var
  ListaNcm: String;
  qryAux: TQuery;
begin
  qryAux := TQuery.Create(Self);
  try
    qryAux.DatabaseName := 'DBBROKER';
    qryAux.SQL.Text     := ' SELECT DISTINCT CD_NCM     '+
                           '   FROM TPROCESSO_EXP_ITEM  '+
                           '  WHERE NR_PROCESSO = '+ QuotedStr(str_nr_processo) +
                           '    AND ISNULL(CD_NCM,'''') <> ''''';
    qryAux.Open;

    while not qryAux.Eof do
    begin
     ListaNcm := ListaNcm + ';' + qryAux.FieldByName('CD_NCM').AsString;
     qryAux.Next;
    end;
    ListaNcm := Copy(ListaNcm, 2, Length(ListaNcm) - 1)
  finally
    FreeAndNil(qryAux);
  end;

  if ListaNcm <> '' then
    FastExecSQL('UPDATE TPROCESSO            ' +
                '   SET TX_NCM     = :TX_NCM ' +
                'WHERE NR_PROCESSO = :NR_PROCESSO',
                [ListaNcm,str_nr_processo] )
end;

procedure Tfrm_exp_itens.btn_cancelarClick(Sender: TObject);
begin
  if not (pgctrl_Item.ActivePage = tbsLotes) then
  begin
    ActiveControl := nil;
    Cancelar;

    if datm_exp_itens.qry_exp_itens_NR_PROCESSO.AsString <> '' then
    begin
      btn_excluir.Enabled   := True;
      mi_excluir.Enabled    := True;
      btn_duplicar.Enabled  := True;
      mi_duplicar.Enabled   := True;
      btn_calculo.Enabled   := True;

      if dbedt_cd_acordo.Text <> '' then
      begin
        lbl_norma.Enabled      := True;
        dbedt_cd_norma.Enabled := True;
        btn_co_normas.Enabled  := True;
      end
      else
      begin
        lbl_norma.Enabled      := False;
        dbedt_cd_norma.Enabled := False;
        btn_co_normas.Enabled  := False;
        dbedt_cd_norma.Text    := '';
        edt_nm_norma.Text      := '';
      end;
      lCalculo := False;
    end
    else
    begin
      Desabilita_Entrada;
      lCalculo := True;
    end;
  end
  else
  begin
    Cancelar;
  end;
end;

procedure Tfrm_exp_itens.btn_excluirClick(Sender: TObject);
begin

  if (pgctrl_Item.ActivePage = ts_item1) or (pgctrl_Item.ActivePage = ts_embalagem) then
  begin
    with datm_exp_itens do
    begin
      if BoxMensagem( 'Este item será excluído! Confirma exclusão?', 1 ) then
      begin
        nr_item := qry_exp_itens_NR_ITEM.AsString;

        qry_exp_itens_.Close;
        qry_exp_.Close;

        lCalculo := False;

        try
          datm_main.db_broker.StartTransaction;

          qry_exec_sp_.SQL.Clear;
          qry_exec_sp_.SQL.Add( 'EXEC sp_exp_apaga_renum_itens "' + str_nr_processo + '","' + nr_item + '"' );
          qry_exec_sp_.ExecSQL;

          qry_exec_sp_.SQL.Clear;
          qry_exec_sp_.SQL.Add( 'EXEC sp_exp_calcula "' + str_nr_processo + '"' );
          qry_exec_sp_.ExecSQL;

          datm_main.db_broker.Commit;
        Except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;

        qry_exp_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
        qry_exp_.Open;

        qry_exp_itens_.Open;
        qry_exp_itens_.Locate('NR_PROCESSO', str_nr_processo, []);

        btn_duplicar.Enabled := True;
        mi_duplicar.Enabled  := True;

        if qry_exp_itens_.EOF then
        begin
          Desabilita_Entrada;
          btn_sair.Enabled      := True;
          mi_sair.Enabled       := True;
          btn_capa_exp.Enabled  := True;
          btn_novo_item.Enabled := True;
          mi_novo_item.Enabled  := True;
          btn_duplicar.Enabled  := False;
          mi_duplicar.Enabled   := False;
        end;
      end;
    end
  end
  else
  if pgctrl_Item.ActivePage = tbsLotes then
  begin
    if not datm_exp_itens.qrylotes.eof then
    begin
      if BoxMensagem( 'Este lote será excluído! Confirma exclusão?', 1 ) then
      begin
        datm_exp_itens.qryLotes.delete;

        datm_exp_itens.qryLotes.Close;
        datm_exp_itens.qryLotes.ParamByName('CD_FORNECIMENTO').AsString := datm_exp_itens.qry_exp_itens_NR_PEDIDO_IMP.asString;
        datm_exp_itens.qryLotes.ParamByName('CD_GRUPO').AsString        := datm_exp_itens.qryGrupoProcessoCD_GRUPO.asString;
        datm_exp_itens.qryLotes.ParamByName('CD_MERCADORIA').AsString   := datm_exp_itens.qry_exp_itens_CD_MERCADORIA.asString;
        datm_exp_itens.qryLotes.Prepare;
        datm_exp_itens.qryLotes.Open;

      end;
    end;
  end
  else
  if pgctrl_Item.ActivePage = tbContainers then
  begin
    if not datm_exp_itens.qry_Exp_Itens_Cntr.eof then
    begin
      if BoxMensagem( 'Esta quantidade será excluída! Confirma exclusão?', 1 ) then
      begin
        datm_exp_itens.qry_Exp_Itens_Cntr.delete;

        datm_exp_itens.qry_Exp_Itens_Cntr.Close;
        datm_exp_itens.qry_Exp_Itens_Cntr.ParamByName('NR_PROCESSO').AsString   := datm_exp_itens.qry_exp_itens_NR_PROCESSO.asString;
        datm_exp_itens.qry_Exp_Itens_Cntr.ParamByName('NR_ITEM').AsString       := datm_exp_itens.qry_exp_itens_NR_ITEM.asString;
        datm_exp_itens.qry_Exp_Itens_Cntr.Prepare;
        datm_exp_itens.qry_Exp_Itens_Cntr.Open;

      end;
    end;
  end;
end;

procedure Tfrm_exp_itens.btn_capa_expClick(Sender: TObject);
begin
  If not (lCalculo) then
  begin
    // A linha abaixo foi substituida pelo calculo, pois criavam o RE sem calcular e ficcavam com valores zerados - Michel - 23/01/2009
    //BoxMensagem( 'Processo deverá ser calculado !!', 3 );
    btn_calculoClick(btn_calculo);
    frm_exp_itens.SetFocus;
    exit;
  end;
  Frm_exp.i_seletor := 1;
  btn_sairClick(nil);
end;

procedure Tfrm_exp_itens.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_exp_itens, datm_exp_itens );

  with datm_exp_itens do begin
    qry_embalagem_.Close;
    qry_embalagem_.Open;

    qry_emp_nac_.Close;
    qry_emp_nac_.Open;
  end;

  with TQuery.Create(Application) do begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('SELECT TP_NCM, TP_NALADI FROM TPARAMETROS (NOLOCK)');
    Open;

    lHabilita_NCM_DOC    := (Fields[0].AsString <> '0');
    lHabilita_NALADI_DOC := (Fields[1].AsString <> '0');

    Close;
    Free;
  end;
end;

procedure Tfrm_exp_itens.btn_co_mercadoriaClick(Sender: TObject);
var
  vFiltro, vExportador, vGrupo : string;
begin
  with datm_exp_itens do
  begin
    if Sender is TSpeedButton then
    begin
      if not PoeEmEdicao(qry_exp_itens_) then
        Exit;
      vExportador := qry_exp_CD_EXPORTADOR.AsString;
      vGrupo  := ConsultaLookup('TEMPRESA_NAC', 'CD_EMPRESA', vExportador, 'CD_GRUPO');
      vFiltro := 'IN_ATIVO = ''1'' AND ( ( CD_EXPORTADOR = ''' + vExportador + ''' AND ''' + vExportador + ''' <> '''' ) OR ( CD_GRUPO = ''' + vGrupo + ''' AND ''' + vGrupo + ''' <> '''') )';
      qry_exp_itens_CD_MERCADORIA.AsString := ConsultaOnLineExFiltro(
        'TMERCADORIA_EXP','Mercadorias',['CD_MERCADORIA','AP_MERCADORIA','CD_NCM_SH'],['Código','Nome','NCM'],'CD_MERCADORIA',vFiltro,frm_main.mi_cad_merc_exp);
      dbedt_cd_mercadoriaExit(nil);
    end
    else
    begin
      edt_nm_mercadoria.Text := ConsultaLookUPSQL('select AP_MERCADORIA from TMERCADORIA_EXP (NOLOCK) where IN_ATIVO = ''1'' and CD_MERCADORIA = ''' + dbedt_cd_mercadoria.Text + '''','AP_MERCADORIA');
      //edt_nm_mercadoria.Text := ConsultaLookUP ('TMERCADORIA_EXP','CD_MERCADORIA',dbedt_cd_mercadoria.Text,'AP_MERCADORIA');
    end;

    if not (qry_exp_itens_QT_MERCADORIA.IsNull) or not (qry_exp_itens_VL_UNITARIO.IsNull) then
      if qry_exp_itens_.State in [dsEdit,dsInsert] then
        if Arredondar( qry_exp_itens_QT_MERCADORIA.AsFloat * qry_exp_itens_VL_UNITARIO.AsFloat, 2 ) <> qry_exp_itens_VL_TOT_ITEM.AsFloat then
          qry_exp_itens_VL_TOT_ITEM.AsFloat := Arredondar( qry_exp_itens_QT_MERCADORIA.AsFloat * qry_exp_itens_VL_UNITARIO.AsFloat, 2 );
  end;
end;

procedure Tfrm_exp_itens.dbedt_cd_mercadoriaExit(Sender: TObject);
var
  vGrupo : string;
begin
  with datm_exp_itens do
  begin
    qry_mercadoria_.Close;

    vGrupo := ConsultaLookup('TEMPRESA_NAC', 'CD_EMPRESA', qry_exp_CD_EXPORTADOR.AsString, 'CD_GRUPO');

    if vGrupo = '' then
    begin
      if dbedt_cd_mercadoria.Text <> '' then
        qry_mercadoria_.SQL[3] := 'AND CD_EXPORTADOR = "' + qry_exp_CD_EXPORTADOR.AsString + '"'
      else
        qry_mercadoria_.SQL[3] := '';
    end
    else
    begin
      if dbedt_cd_mercadoria.Text <> '' then
        qry_mercadoria_.SQL[3] := 'AND (CD_EXPORTADOR = "' + qry_exp_CD_EXPORTADOR.AsString + '" OR ' + 'CD_GRUPO = "' + vGrupo + '")'
      else
        qry_mercadoria_.SQL[3] := '';
    end;



    if Trim(dbedt_cd_mercadoria.Text) <> '' then
    begin
      qry_mercadoria_.ParamByName('CD_MERCADORIA').AsString := dbedt_cd_mercadoria.Text;
      qry_mercadoria_.Open;
      qry_mercadoria_.Locate( 'CD_MERCADORIA', dbedt_cd_mercadoria.Text, [] );

      if ((Trim( qry_exp_itens_CD_PAIS_ORIGEM.AsString) = '') or qry_exp_itens_CD_PAIS_ORIGEM.IsNull) then
      begin
        // Verifica total de Normas para o País de Destino Final
        qry_tot_acordo_norma_.Close;
        qry_tot_acordo_norma_.ParamByName('CD_PAIS').AsString       := qry_exp_CD_PAIS_DESTINO.AsString;
        qry_tot_acordo_norma_.ParamByName('CD_MERCADORIA').AsString := dbedt_cd_mercadoria.Text;
        qry_tot_acordo_norma_.Open;
        if qry_tot_acordo_norma_.FieldByName('TOT_ACORDO_NORMA').AsInteger > 1 then begin
          BoxMensagem( 'Existe mais de uma Norma cadastrada para a Mercadoria no País de Destino Final!', 2 );
          dbedt_cd_mercadoria.SetFocus;
          Exit;
        end;
      end;

      if Not qry_mercadoria_.EOF then
      begin
        edt_nm_mercadoria.Text := qry_mercadoria_AP_MERCADORIA.AsString;

        if ( qry_exp_itens_.State in [dsInsert, dsEdit]) then
        begin
          dbedt_qt_por_embalagem.Color    := clWindow;
          dbedt_vl_por_emb.Color          := clWindow;
          dbedt_qt_por_embalagem.ReadOnly := False;
          dbedt_vl_por_emb.ReadOnly       := False;
          dbedt_qt_por_embalagem.TabStop  := True;
          dbedt_vl_por_emb.TabStop        := True;

          if qry_exp_itens_VL_UNITARIO.AsFloat = 0 then
            qry_exp_itens_VL_UNITARIO.AsFloat := qry_mercadoria_VL_UNITARIO.AsFloat;

          if ( qry_exp_itens_VL_PESO_LIQ_UNIT.AsFloat = 0 ) then
          begin
            qry_exp_itens_VL_PESO_LIQ_UNIT.AsFloat := qry_mercadoria_PL_MERCADORIA.AsFloat;
            if qry_exp_itens_QT_MERCADORIA.AsFloat > 0 then
              qry_exp_itens_VL_TOT_PESO_LIQ.AsFloat := Arredondar(qry_exp_itens_QT_MERCADORIA.AsFloat * qry_mercadoria_PL_MERCADORIA.AsFloat, 2 ); //qtde * peso unitario
          end;

          if qry_exp_itens_VL_TOT_ITEM.AsFloat = 0 then
            qry_exp_itens_VL_TOT_ITEM.AsFloat := (qry_mercadoria_VL_UNITARIO.AsFloat * qry_exp_itens_QT_MERCADORIA.AsFloat);

          if qry_exp_itens_CD_UNID_MEDIDA.AsString = '' then
            qry_exp_itens_CD_UNID_MEDIDA.AsString := qry_mercadoria_CD_UN_MED_COMERC.AsString;

          if qry_exp_itens_CD_NCM.AsString = '' then
            qry_exp_itens_CD_NCM.AsString := qry_mercadoria_CD_NCM_SH.AsString;

          //by Carlos - 27/07/2010
          if qry_exp_itens_CD_SULF_NCM.AsString = '' then
            qry_exp_itens_CD_SULF_NCM.AsString := qry_mercadoria_CD_SULF_NCM.AsString;


          if qry_exp_itens_CD_NALADI_SH.AsString = '' then
            qry_exp_itens_CD_NALADI_SH.AsString := qry_mercadoria_CD_NALADI_SH.AsString;

          // Mercadoria x Acordo
          qry_merc_acordo_norma_.Close;
          qry_merc_acordo_norma_.ParamByName('CD_PAIS').AsString       := qry_exp_CD_PAIS_DESTINO.AsString;
          qry_merc_acordo_norma_.ParamByName('CD_MERCADORIA').AsString := dbedt_cd_mercadoria.Text;
          qry_merc_acordo_norma_.Open;
          if qry_merc_acordo_norma_CD_MERCADORIA.AsString <> '' then
          begin
            qry_exp_itens_CD_NCM_DOC.AsString      := qry_merc_acordo_norma_CD_NCM_DOC.AsString;
            qry_exp_itens_NR_SEQ_NCM_DOC.AsInteger := qry_merc_acordo_norma_NR_SEQ_NCM.AsInteger;

            qry_exp_itens_CD_NALADI_DOC.AsString      := qry_merc_acordo_norma_CD_NALADI_SH_DOC.AsString;
            qry_exp_itens_NR_SEQ_NALADI_DOC.AsInteger := qry_merc_acordo_norma_NR_SEQ_NALADI.AsInteger;

            qry_exp_itens_CD_ACORDO.AsString := qry_merc_acordo_norma_CD_ACORDO.AsString;

            qry_exp_itens_CD_NORMAS.AsString := qry_merc_acordo_norma_CD_NORMA.AsString;

            qry_exp_itens_TX_MERCADORIA.AsString := qry_merc_acordo_norma_TX_MERCADORIA.AsString;
          end
          else
          begin
            if qry_exp_itens_TX_MERCADORIA.AsString = '' then
               qry_exp_itens_TX_MERCADORIA.Assign( qry_mercadoria_NM_MERCADORIA );
          end;

          if qry_exp_itens_CD_EMBALAGEM.AsString = '' then
            qry_exp_itens_CD_EMBALAGEM.AsString := qry_mercadoria_CD_EMBALAGEM.AsString;

          qry_embalagem_.Locate( 'CD_EMBALAGEM', qry_mercadoria_CD_EMBALAGEM.AsString, [] );
          if qry_embalagem_CD_EMBALAGEM.AsString = qry_mercadoria_CD_EMBALAGEM.AsString then
          begin
            if qry_exp_itens_CD_EMBALAGEM_SUP.AsString = '' then
               qry_exp_itens_CD_EMBALAGEM_SUP.AsString := qry_embalagem_CD_EMBALAGEM_SUP.AsString;

            if qry_exp_itens_QT_POR_EMB_SUP.AsFloat = 0 then
               qry_exp_itens_QT_POR_EMB_SUP.AsFloat := qry_embalagem_QT_EMBALAGEM_SUP.AsFloat;
          end;

          if qry_exp_itens_CD_UNID_MEDIDA.AsString <> '103' then
          begin
            if qry_exp_itens_QT_POR_EMB.AsFloat = 0 then
               qry_exp_itens_QT_POR_EMB.AsFloat := qry_mercadoria_QT_POR_EMBALAGEM.AsFloat;
          end
          else
          begin
            dbedt_qt_por_embalagem.Color    := clWindow;
            dbedt_vl_por_emb.Color          := clWindow;
            dbedt_qt_por_embalagem.ReadOnly := False;
            dbedt_vl_por_emb.ReadOnly       := False;
            dbedt_qt_por_embalagem.TabStop  := True;
            dbedt_vl_por_emb.TabStop        := True;
          end;

          if qry_exp_itens_VL_TOT_ITEM.AsFloat = 0 then
             qry_exp_itens_VL_TOT_ITEM.AsFloat := qry_exp_itens_QT_MERCADORIA.AsFloat * qry_exp_itens_VL_UNITARIO.AsFloat;

          if qry_exp_itens_VL_POR_EMB.AsFloat = 0 then
             qry_exp_itens_VL_POR_EMB.AsFloat := qry_exp_itens_QT_MERCADORIA.AsFloat * qry_exp_itens_QT_POR_EMB.AsFloat;

          if (Trim(qry_exp_itens_CD_FABR_EXPO.AsString) = '') or (qry_exp_itens_.State in [dsInsert]) then
            qry_exp_itens_CD_FABR_EXPO.AsString := qry_mercadoria_CD_FABR_EXPO.AsString;

          if qry_exp_itens_CD_FABR_EXPO.AsString = '2' then
            if Trim(qry_exp_itens_CD_FABRICANTE.AsString) = '' then
               qry_exp_itens_CD_FABRICANTE.AsString := qry_mercadoria_CD_FABRICANTE.AsString;

          if (qry_exp_itens_CD_FABR_EXPO.AsString = '2') or (qry_exp_itens_CD_FABR_EXPO.AsString = '3') then
            qry_exp_itens_CD_PAIS_ORIGEM.AsString := qry_mercadoria_CD_PAIS_ORIGEM.AsString;
        end;
      end
      else
      begin
//        BoxMensagem( 'Mercadoria não cadastrada para este cliente!', 2 );
        pgctrl_Item.ActivePage := ts_item1;
//        dbedt_cd_mercadoria.SetFocus;
      end;


      qry_mercadoria_.Close;
      qry_merc_acordo_norma_.Close;
    end;
  end;

  //Carlos - verifica se existe somente um acordo e o adiciona 
  if dbedt_cd_mercadoria.Text<>'' then
     if datm_exp_itens.ds_exp_itens.State in [dsInsert,dsEdit] then begin
        with TQuery.Create(Application) do begin
          DatabaseName := 'DBBROKER';
          Close;
          SQL.Clear;
          SQL.Add(' select CD_ACORDO,CD_NORMA from tmerc_exp_acordo (NOLOCK) ');
          SQL.Add(' WHERE CD_MERCADORIA = '+''''+dbedt_cd_mercadoria.Text+'''');
          Open;
          if recordcount=1 then begin
             datm_exp_itens.qry_exp_itens_CD_ACORDO.AsString:=Fields[0].AsString;
             datm_exp_itens.qry_exp_itens_CD_NORMAS.AsString:=Fields[1].AsString;
          end;
          close;
          Free;
        end;
     end;


end;

procedure Tfrm_exp_itens.btn_duplicarClick(Sender: TObject);
var
  NR_PROCESSO, NR_PEDIDO_IMP :string [18];
  NR_SEQ_NCM, NR_SEQ_NALADI, NR_SEQ_NCM_DOC, NR_SEQ_NALADI_DOC : Integer;
  CD_MERCADORIA        : string[15];
  CD_NCM               : string[11];
  CD_NALADI_SH         : string[8];
  CD_ACORDO            : string[10];
  CD_NCM_DOC, CD_NALADI_DOC : string[8];
  CD_UNID_MEDIDA, CD_PAIS_ORIGEM : string[3];
  CD_EMBALAGEM, CD_EMB_SUP : string[4];
  CD_CLASSIF_EMBALAGEM, CD_CLASSIF_EMBALAGEM_SUP : string[30];
  CD_FABR_EXPO         : string[1];
  CD_FABRICANTE        : string[5];
  CD_EMB_CLIENTE, CD_NORMAS : string[10];
  QT_POR_EMB, QT_EMBALAGEM, QT_MERCADORIA, VL_POR_EMB, VL_UNITARIO, VL_PESO_LIQ_UNIT, VL_COMPRIMENTO_EMB,
  VL_LARGURA_EMB, VL_ALTURA_EMB, VL_PESO_EMB, VL_TOT_ITEM, VL_TOT_PESO_LIQ, VL_TOT_PESO_BRUTO, VL_CUBAGEM,
  VL_MLE, VL_MCV, QT_POR_EMB_SUP, QT_EMBALAGEM_SUP, VL_POR_EMB_SUP : double;
  TX_MERC    :AnsiString;
  NR_PEDIDO : string[18];
begin
  try
    datm_main.db_broker.StartTransaction;                   // Inicializou transacao

    with datm_exp_itens do begin
      NR_PROCESSO           := qry_exp_itens_NR_PROCESSO.AsString;
      NR_PEDIDO_IMP         := qry_exp_itens_NR_PEDIDO_IMP.AsString;
      CD_MERCADORIA         := qry_exp_itens_CD_MERCADORIA.AsString;
      CD_NCM                := qry_exp_itens_CD_NCM.AsString;
      CD_NALADI_SH          := qry_exp_itens_CD_NALADI_SH.AsString;
      CD_UNID_MEDIDA        := qry_exp_itens_CD_UNID_MEDIDA.AsString;
      CD_EMBALAGEM          := qry_exp_itens_CD_EMBALAGEM.AsString;
      CD_CLASSIF_EMBALAGEM  := qry_exp_itens_CD_CLASSIF_EMBALAGEM.AsString;
      CD_FABR_EXPO          := qry_exp_itens_CD_FABR_EXPO.AsString;
      QT_POR_EMB            := qry_exp_itens_QT_POR_EMB.AsFloat;
      QT_EMBALAGEM          := qry_exp_itens_QT_EMBALAGEM.AsFloat;
      QT_MERCADORIA         := qry_exp_itens_QT_MERCADORIA.AsFloat;
      VL_POR_EMB            := qry_exp_itens_VL_POR_EMB.AsFloat;
      VL_UNITARIO           := qry_exp_itens_VL_UNITARIO.AsFloat;
      VL_PESO_LIQ_UNIT      := qry_exp_itens_VL_PESO_LIQ_UNIT.AsFloat;
      VL_COMPRIMENTO_EMB    := qry_exp_itens_VL_COMPRIMENTO_EMB.AsFloat;
      VL_LARGURA_EMB        := qry_exp_itens_VL_LARGURA_EMB.AsFloat;
      VL_ALTURA_EMB         := qry_exp_itens_VL_ALTURA_EMB.AsFloat;
      VL_PESO_EMB           := qry_exp_itens_VL_PESO_EMB.AsFloat;
      VL_TOT_ITEM           := qry_exp_itens_VL_TOT_ITEM.AsFloat;
      VL_TOT_PESO_LIQ       := qry_exp_itens_VL_TOT_PESO_LIQ.AsFloat;
      VL_TOT_PESO_BRUTO     := qry_exp_itens_VL_TOT_PESO_BRUTO.AsFloat;
      VL_CUBAGEM            := qry_exp_itens_VL_CUBAGEM.AsFloat;
      VL_MLE                := qry_exp_itens_VL_MLE.AsFloat;
      VL_MCV                := qry_exp_itens_VL_MCV.AsFloat;
      TX_MERC               := qry_exp_itens_TX_MERCADORIA.AsString;
      CD_EMB_SUP            := qry_exp_itens_CD_EMBALAGEM_SUP.AsString;
      QT_POR_EMB_SUP        := qry_exp_itens_QT_POR_EMB_SUP.AsFloat;
      CD_EMB_CLIENTE        := qry_exp_itens_CD_EMBALAGEM_CLIENTE.AsString;
      CD_CLASSIF_EMBALAGEM_SUP := qry_exp_itens_CD_CLASSIF_EMBALAGEM_SUP.AsString;
      QT_EMBALAGEM_SUP      := qry_exp_itens_QT_EMBALAGEM_SUP.AsFloat;
      VL_POR_EMB_SUP        := qry_exp_itens_VL_POR_EMB_SUP.AsFloat;
      CD_NORMAS             := qry_exp_itens_CD_NORMAS.AsString;
      CD_FABRICANTE         := qry_exp_itens_CD_FABRICANTE.AsString;
      NR_PEDIDO             := qry_exp_itens_NR_PEDIDO.AsString;
      CD_PAIS_ORIGEM        := qry_exp_itens_CD_PAIS_ORIGEM.AsString;
      CD_ACORDO             := qry_exp_itens_CD_ACORDO.AsString;
      CD_NCM_DOC            := qry_exp_itens_CD_NCM_DOC.AsString;
      CD_NALADI_DOC         := qry_exp_itens_CD_NALADI_DOC.AsString;
      NR_SEQ_NCM            := qry_exp_itens_NR_SEQ_NCM.AsInteger;
      NR_SEQ_NALADI         := qry_exp_itens_NR_SEQ_NALADI.AsInteger;
      NR_SEQ_NCM_DOC        := qry_exp_itens_NR_SEQ_NCM_DOC.AsInteger;
      NR_SEQ_NALADI_DOC     := qry_exp_itens_NR_SEQ_NALADI_DOC.AsInteger;

      qry_exp_itens_.Insert;
      qry_exp_itens_NR_PROCESSO.AsString          := NR_PROCESSO;
      qry_exp_itens_NR_PEDIDO_IMP.AsString        := NR_PEDIDO_IMP;
      qry_exp_itens_CD_MERCADORIA.AsString        := CD_MERCADORIA;
      qry_exp_itens_CD_NCM.AsString               := CD_NCM;
      qry_exp_itens_CD_NALADI_SH.AsString         := CD_NALADI_SH;
      qry_exp_itens_CD_UNID_MEDIDA.AsString       := CD_UNID_MEDIDA;
      qry_exp_itens_CD_EMBALAGEM.AsString         := CD_EMBALAGEM;
      qry_exp_itens_CD_CLASSIF_EMBALAGEM.AsString := CD_CLASSIF_EMBALAGEM;
      qry_exp_itens_CD_FABR_EXPO.AsString         := CD_FABR_EXPO;
      qry_exp_itens_QT_POR_EMB.AsFloat            := QT_POR_EMB;
      qry_exp_itens_QT_EMBALAGEM.AsFloat          := QT_EMBALAGEM;
      qry_exp_itens_QT_MERCADORIA.AsFloat         := QT_MERCADORIA;
      qry_exp_itens_VL_POR_EMB.AsFloat            := VL_POR_EMB;
      qry_exp_itens_VL_UNITARIO.AsFloat           := VL_UNITARIO;
      qry_exp_itens_VL_PESO_LIQ_UNIT.AsFloat      := VL_PESO_LIQ_UNIT;
      qry_exp_itens_VL_COMPRIMENTO_EMB.AsFloat    := VL_COMPRIMENTO_EMB;
      qry_exp_itens_VL_LARGURA_EMB.AsFloat        := VL_LARGURA_EMB;
      qry_exp_itens_VL_ALTURA_EMB.AsFloat         := VL_ALTURA_EMB;
      qry_exp_itens_VL_PESO_EMB.AsFloat           := VL_PESO_EMB;
      qry_exp_itens_VL_TOT_ITEM.AsFloat           := VL_TOT_ITEM;
      qry_exp_itens_VL_TOT_PESO_LIQ.AsFloat       := VL_TOT_PESO_LIQ;
      qry_exp_itens_VL_TOT_PESO_BRUTO.AsFloat     := VL_TOT_PESO_BRUTO;
      qry_exp_itens_VL_CUBAGEM.AsFloat            := VL_CUBAGEM;
      qry_exp_itens_VL_MLE.AsFloat                := VL_MLE;
      qry_exp_itens_VL_MCV.AsFloat                := VL_MCV;
      qry_exp_itens_TX_MERCADORIA.AsString        := TX_MERC;
      qry_exp_itens_CD_EMBALAGEM_SUP.AsString     := CD_EMB_SUP;
      qry_exp_itens_QT_POR_EMB_SUP.AsFloat        := QT_POR_EMB_SUP;
      qry_exp_itens_CD_EMBALAGEM_CLIENTE.AsString := CD_EMB_CLIENTE;
      qry_exp_itens_CD_CLASSIF_EMBALAGEM_SUP.AsString := CD_CLASSIF_EMBALAGEM_SUP;
      qry_exp_itens_QT_EMBALAGEM_SUP.AsFloat      := QT_EMBALAGEM_SUP;
      qry_exp_itens_VL_POR_EMB_SUP.AsFloat        := VL_POR_EMB_SUP;
      qry_exp_itens_CD_NORMAS.AsString            := CD_NORMAS;
      qry_exp_itens_CD_FABRICANTE.AsString        := CD_FABRICANTE;
      qry_exp_itens_NR_PEDIDO.AsString            := NR_PEDIDO;
      qry_exp_itens_CD_PAIS_ORIGEM.AsString       := CD_PAIS_ORIGEM;
      qry_exp_itens_CD_ACORDO.AsString            := CD_ACORDO;
      qry_exp_itens_CD_NCM_DOC.AsString           := CD_NCM_DOC;
      qry_exp_itens_CD_NALADI_DOC.AsString        := CD_NALADI_DOC;
      qry_exp_itens_NR_SEQ_NCM.AsInteger          := NR_SEQ_NCM;
      qry_exp_itens_NR_SEQ_NALADI.AsInteger       := NR_SEQ_NALADI;
      qry_exp_itens_NR_SEQ_NCM_DOC.AsInteger      := NR_SEQ_NCM_DOC;
      qry_exp_itens_NR_SEQ_NALADI_DOC.AsInteger   := NR_SEQ_NALADI_DOC;

      if qry_exp_itens_.State in [dsInsert] then
      begin
        qry_exp_.Close;
        qry_exp_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
        qry_exp_.Open;

        if not (qry_exp_.State in [dsInsert,dsEdit]) then qry_exp_.Edit;

        qry_total_itens_.Close;
        qry_total_itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
        qry_total_itens_.Open;

        if qry_total_itens_TOTAL.AsFloat > 0 then begin
          qry_exp_QT_TOTAL_ITENS.AsString := StrZero( qry_total_itens_TOTAL.AsFloat + 1, 3 );     // Quantidade Total dos Itens
          qry_exp_itens_NR_ITEM.AsString  := StrZero( qry_total_itens_TOTAL.AsFloat + 1, 3 );     // Numero do Item
        end
        else begin
          qry_exp_QT_TOTAL_ITENS.AsString := '001';               // Quantidade Total dos Itens
          qry_exp_itens_NR_ITEM.AsString  := '001';               // Numero do Item
        end;
        qry_total_itens_.Close;
        qry_exp_.Post;
      end;

      if qry_exp_itens_.State in [dsEdit,dsInsert] then
      begin
        qry_exp_itens_.Post;
        nr_item := qry_exp_itens_NR_ITEM.AsString;
      end;

      datm_main.db_broker.Commit;

      qry_exp_itens_.Close;
      qry_exp_itens_.Open;
      qry_exp_itens_.Locate('NR_PROCESSO;NR_ITEM', VarArrayOf ([str_nr_processo, nr_item]), [loCaseInsensitive]);

      btn_salvar.Enabled     := False;
      mi_salvar.Enabled      := False;
      btn_cancelar.Enabled   := False;
      mi_cancelar.Enabled    := False;
      btn_novo_item.Enabled  := True;
      mi_novo_item.Enabled   := True;
      btn_duplicar.Enabled   := True;
      mi_duplicar.Enabled    := True;
      btn_calculo.Enabled    := True;

      lCalculo := False;
    end;
  except
    on E: Exception do begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      lCalculo := True;
    end;
  end;
end;

function Tfrm_exp_itens.Consiste : Boolean;
var
teste:Integer;
begin
  Consiste := True;

  if (pgctrl_Item.ActivePage = ts_item1) or (pgctrl_Item.ActivePage = ts_embalagem) then
  begin
    with datm_exp_itens do
    begin
      if qry_exp_itens_.State in [dsInsert, dsEdit] then
      begin
        // Mercadoria
        if (dbedt_cd_mercadoria.Text <> '') and ( edt_nm_mercadoria.Text = '' ) then
        begin
          BoxMensagem( 'Código da Mercadoria inválido !', 2 );
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_mercadoria.SetFocus;
          Consiste := False;
          Exit;
        end;
        // NCM
        if dbedt_cd_ncm.Text <> '' then
        begin
          qry_ncm_.Close;
          qry_ncm_.ParamByName('CODIGO').AsString := dbedt_cd_ncm.Text;
          qry_ncm_.Open;

          if ( qry_ncm_CODIGO.AsString <> Trim(dbedt_cd_ncm.Text) ) then
          begin
            BoxMensagem( 'Código do NCM inválido !', 2 );
            pgctrl_Item.ActivePage := ts_item1;
            dbedt_cd_ncm.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        // NALADI
        if dbedt_cd_naladi.Text <> '' then
        begin
          qry_naladi_.Close;
          qry_naladi_.ParamByName('CODIGO').AsString := dbedt_cd_naladi.Text;
          qry_naladi_.Open;

          if ( qry_naladi_CODIGO.AsString <> Trim(dbedt_cd_naladi.Text) ) then
          begin
            BoxMensagem( 'Código do Naladi inválido !', 2 );
            pgctrl_Item.ActivePage := ts_item1;
            dbedt_cd_naladi.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        // NCM - Documentos
        if (Trim(dbedt_cd_ncm_doc.Text) <> '') and (edt_nm_ncm_doc.Text = '') then
        begin
          BoxMensagem( 'Código do NCM (Documentos) inválido !', 2 );
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_ncm_doc.SetFocus;
          Consiste := False;
          Exit;
        end;
         //NALADI/SH - Documentos
        if (Trim(dbedt_cd_naladi_doc.Text) <> '') and (edt_nm_naladi_doc.Text = '') then
        begin
          BoxMensagem( 'Código do NALADI (Documentos) inválido !', 2 );
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_naladi_doc.SetFocus;
          Consiste := False;
          Exit;
        end;
        // Unidade Medida
        ValidCodigo( dbedt_cd_unid_medida );
        if (dbedt_cd_unid_medida.Text <> '') and (edt_nm_unid_medida.Text = '') then
        begin
          BoxMensagem('Código da Unidade de Medida inválido !',2);
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_unid_medida.SetFocus;
          Consiste := False;
          Exit;
        end;
        //Acordo
        if (Trim(dbedt_cd_acordo.Text) <> '') and (trim(edt_nm_acordo.Text) = '') then
        begin
          BoxMensagem('Código do Acordo inválido !',2);
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_acordo.SetFocus;
          Consiste := False;
          Exit;
        end;
        //Normas
        if (Trim(dbedt_cd_acordo.Text) <> '') and (Trim( dbedt_cd_norma.Text ) <> '') then
        begin
          qry_acordo_normas_.Close;
          qry_acordo_normas_.ParamByName('CD_ACORDO').AsString := datm_exp_itens.qry_exp_itens_CD_ACORDO.AsString;
          qry_acordo_normas_.ParamByName('CD_NORMA').AsString  := dbedt_cd_norma.Text;
          qry_acordo_normas_.Open;

          if dbedt_cd_norma.Text = '' then
          begin
            BoxMensagem('Código da Norma inválido !',2);
            pgctrl_Item.ActivePage := ts_item1;
            dbedt_cd_norma.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        if ((Trim( qry_exp_itens_CD_PAIS_ORIGEM.AsString ) = '') or qry_exp_itens_CD_PAIS_ORIGEM.IsNull) then
        begin
          //Verifica total de Normas para o País de Destino Final
          qry_tot_acordo_norma_.Close;
          qry_tot_acordo_norma_.ParamByName('CD_PAIS').AsString       := qry_exp_CD_PAIS_DESTINO.AsString;
          qry_tot_acordo_norma_.ParamByName('CD_MERCADORIA').AsString := dbedt_cd_mercadoria.Text;
          qry_tot_acordo_norma_.Open;
          if qry_tot_acordo_norma_.FieldByName('TOT_ACORDO_NORMA').AsInteger > 1 then
          begin
            BoxMensagem( 'Existe mais de uma Norma cadastrada para a Mercadoria no País de Destino Final!', 2 );
            pgctrl_Item.ActivePage := ts_item1;
            dbedt_cd_mercadoria.SetFocus;
            Consiste := False;
            Exit;
          end;
          //Acordo/Norma/País
          if (dbedt_cd_acordo.Text<>'') and (dbedt_cd_norma.Text<>'') then
          begin
             qry_merc_acordo_pais_.Close;
             qry_merc_acordo_pais_.ParamByName('CD_ACORDO').AsString     := dbedt_cd_acordo.Text;
             qry_merc_acordo_pais_.ParamByName('CD_NORMA').AsString      := dbedt_cd_norma.Text;
             qry_merc_acordo_pais_.ParamByName('CD_PAIS').AsString       := qry_exp_CD_PAIS_DESTINO.AsString;
             qry_merc_acordo_pais_.ParamByName('CD_MERCADORIA').AsString := dbedt_cd_mercadoria.Text;
             qry_merc_acordo_pais_.Open;
             qry_merc_acordo_pais_.First;
             teste:=qry_merc_acordo_pais_.RecordCount;

             if teste=0 then
             begin
               BoxMensagem( 'Acordo/Norma não cadastrado para esta Mercadoria!', 2 );
               pgctrl_Item.ActivePage := ts_item1;
               dbedt_cd_acordo.SetFocus;
               Consiste := False;
               Exit;
             end;
          end;
        end;
        //Fabricante
        ValidCodigo( dbedt_cd_fabr_item );
        if (dbedt_cd_fabr_item.Text <> '') and (edt_nm_fabr_item.Text = '') then
        begin
          BoxMensagem('Código do Fabricante/Produtor inválido !',2);
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_fabr_item.SetFocus;
          Consiste := False;
          Exit;
        end
        else
        begin
          qry_emp_nac_.Locate('CD_EMPRESA', dbedt_cd_fabr_item.Text, [loCaseInsensitive]);
          if qry_exp_itens_CD_PAIS_ORIGEM.AsString = '' then
            if qry_emp_nac_CD_EMPRESA.AsString = dbedt_cd_fabr_item.Text then
              qry_exp_itens_CD_PAIS_ORIGEM.AsString := '105';
        end;
        //País de Origem
        ValidCodigo( dbedt_cd_pais_origem );
        if (dbedt_cd_pais_origem.Text <> '') and (edt_nm_pais_origem.Text = '') then
        begin
          BoxMensagem( 'Código do País de Origem inválido !', 2 );
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_pais_origem.SetFocus;
          Consiste := False;
          Exit;
        end;
        //Embalagem
        ValidCodigo( dbedt_cd_embalagem );
        if (dbedt_cd_embalagem.Text <> '') and (edt_nm_embalagem.Text = '') then
        begin
          BoxMensagem('Código da Embalagem inválido !',2);
          pgctrl_Item.ActivePage := ts_embalagem;
          dbedt_cd_embalagem.SetFocus;
          Consiste := False;
          Exit;
        end
        else
        begin
          qry_embalagem_.Locate( 'CD_EMBALAGEM', qry_exp_itens_CD_EMBALAGEM.AsString, [] );
          if qry_embalagem_CD_EMBALAGEM.AsString = qry_exp_itens_CD_EMBALAGEM.AsString then
          begin
            if qry_exp_itens_CD_EMBALAGEM_SUP.AsString = '' then
              qry_exp_itens_CD_EMBALAGEM_SUP.AsString := qry_embalagem_CD_EMBALAGEM_SUP.AsString;

            if qry_exp_itens_QT_POR_EMB_SUP.AsFloat = 0 then
              qry_exp_itens_QT_POR_EMB_SUP.AsFloat := qry_embalagem_QT_EMBALAGEM_SUP.AsFloat;
          end;
        end;
        //Embalagem Superior
        ValidCodigo( dbedt_cd_emb_sup );
        if (dbedt_cd_emb_sup.Text <> '') and (edt_nm_emb_sup.Text = '') then
        begin
          BoxMensagem( 'Código da Embalagem Superior inválido !', 2 );
          pgctrl_Item.ActivePage := ts_embalagem;
          dbedt_cd_emb_sup.SetFocus;
          Consiste := False;
          Exit;
        end;
        if (vAlterouNF) and (Trim(dbedt_nr_nf.Text) <> '') then
        begin
          if StrToIntDef(ConsultaLookUpSQL('SELECT COUNT(*) AS CONT FROM TPROCESSO_EXP_NF (NOLOCK) ' +
                                           ' WHERE NR_PROCESSO = "' + qry_exp_NR_PROCESSO.AsString +
                                           '" AND NR_NF = "' + Trim(dbedt_nr_nf.Text) + '" ', 'CONT'), 0) = 0 then
          begin
            BoxMensagem('Esta Nota Fiscal não está relacionada neste processo! Verifique as Notas deste processo!', 2 );
            pgctrl_Item.ActivePage := ts_item1;
            dbedt_nr_nf.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;
  end
  else
  if pgctrl_Item.ActivePage = tbContainers then
  begin
    if  datm_exp_itens.qry_Exp_Itens_CntrNR_CONTR.asstring = '' then
    begin
      consiste := false;
      ShowMessage('Selecione um container.');
      exit;
    end;
    consiste := ValidaContainer;
  end;
end;

function Tfrm_exp_itens.ValidaContainer : boolean;
var OldCntr, NewCntr : string;
cntr_existente : boolean;
begin
  result := true;
  if (datm_exp_itens.qry_Exp_Itens_Cntr.state  = dsEdit) and not VarIsNull(datm_exp_itens.qry_Exp_Itens_CntrNR_CONTR.OldValue) then
  begin
    OldCntr := Trim(datm_exp_itens.qry_Exp_Itens_CntrNR_CONTR.OldValue);
    NewCntr := Trim(datm_exp_itens.qry_Exp_Itens_CntrNR_CONTR.NewValue);
  end
  else
  begin
    OldCntr := '';
    NewCntr :=datm_exp_itens.qry_Exp_Itens_CntrNR_CONTR.AsString;
  end;

  if (OldCntr <> NewCntr) or (OldCntr = '') then
  begin
   //verifica se o container já existe.
   with TQuery.Create(Application) do
   begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQl.Add(' select count(*) from TPROCESSO_EXP_ITEM_CONTAINER (NOLOCK) ');
      SQl.Add(' where NR_PROCESSO= :NR_PROCESSO AND NR_CONTR= :NR_CONTR AND NR_ITEM = :NR_ITEM ');
      ParamByName('NR_CONTR').AsString      := NewCntr;
      ParamByName('NR_PROCESSO').AsString   := datm_exp_itens.qry_exp_itens_NR_PROCESSO.asString;
      ParamByName('NR_ITEM').AsString       := datm_exp_itens.qry_exp_itens_NR_ITEM.asString;
      Open;
      cntr_existente:=( fields[0].AsInteger > 0 );
      close;
      Free;
   end;
   if  cntr_existente then
   begin
    showmessage('Container Já Cadastrado!!!');
    result := false;
   end;
  end;
end;

procedure Tfrm_exp_itens.CodExits;
begin
//  lNaoConsiste  := True;
//  Consiste;
//  lNaoConsiste  := False;
end;

function Tfrm_exp_itens.VerAlt;
begin
  VerAlt := True;

  if (pgctrl_Item.ActivePage = ts_item1) or (pgctrl_Item.ActivePage = ts_embalagem) then
  begin
    if ( ( datm_exp_itens.qry_exp_itens_.State in [dsEdit] ) ) or
         ( datm_exp_itens.qry_exp_itens_.State in [dsInsert] ) then
    begin
      if BoxMensagem('O Item do Processo foi alterado! ' + #13#10 +
                     'Deseja salvar as alterações?', 1) then
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
  end
  else
  if pgctrl_Item.ActivePage = tbsLotes then
  begin
    if ( ( datm_exp_itens.qryLotes.State in [dsEdit] ) ) or
         ( datm_exp_itens.qryLotes.State in [dsInsert] ) then
    begin
      if BoxMensagem('O lote do item foi alterado! ' + #13#10 +
                     'Deseja salvar as alterações?', 1) then
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

procedure Tfrm_exp_itens.Cancelar;
begin
  if datm_exp_itens.qry_exp_itens_.State in [dsEdit,dsInsert] then
    datm_exp_itens.qry_exp_itens_.Cancel;

  if datm_exp_itens.qryLotes.State in [dsEdit,dsInsert] then
    datm_exp_itens.qryLotes.Cancel;

  if datm_exp_itens.qry_Exp_Itens_Cntr.State in [dsEdit,dsInsert] then
    datm_exp_itens.qry_Exp_Itens_Cntr.Cancel;

  btn_novo_item.Enabled := True;
  mi_novo_item.Enabled  := True;
  btn_salvar.Enabled    := False;
  mi_salvar.Enabled     := False;
  btn_cancelar.Enabled  := False;
  mi_cancelar.Enabled   := False;
  btn_sair.Enabled      := True;
  mi_sair.Enabled       := True;
  btn_capa_exp.Enabled  := True;

  DbNavigator.Enabled   := True;
  pgctrl_Item.SetFocus;
end;

procedure Tfrm_exp_itens.Desabilita_Entrada;
var
  i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TLabel )            then TLabel( Components[i] ).Enabled            := False;
    if ( Components[i] is TSpeedButton )      then TSpeedButton( Components[i] ).Enabled      := False;
    if ( Components[i] is TDBEdit )           then TDBEdit( Components[i] ).Enabled           := False;
    if ( Components[i] is TDBRadioGroup )     then TDBRadioGroup( Components[i] ).Enabled     := False;
    if ( Components[i] is TRadioButton )      then TRadioButton( Components[i] ).Enabled      := False;
    if ( Components[i] is TDBCheckBox )       then TDBCheckBox( Components[i] ).Enabled       := False;
    if ( Components[i] is TDBMemo )           then TDBMemo( Components[i] ).Enabled           := False;
    if ( Components[i] is TDBLookupComboBox ) then TDBLookupComboBox( Components[i] ).Enabled := False;
  end;

  dbedt_nr_processo.Enabled := True ;
  mi_novo_item.Enabled      := False;
  mi_salvar.Enabled         := False;
  mi_excluir.Enabled        := False;
  mi_cancelar.Enabled       := False;
end;

procedure Tfrm_exp_itens.Habilita_Entrada;
var
  i : integer;
begin
  for i := 0 to componentcount - 1 do begin
    if ( Components[i] is TLabel )            then TLabel( Components[i] ).Enabled            := True;
    if ( Components[i] is TSpeedButton )      then TSpeedButton( Components[i] ).Enabled      := True;
    if ( Components[i] is TDBEdit )           then TDBEdit( Components[i] ).Enabled           := True;
    if ( Components[i] is TDBRadioGroup )     then TDBRadioGroup( Components[i] ).Enabled     := True;
    if ( Components[i] is TRadioButton )      then TRadioButton( Components[i] ).Enabled      := True;
    if ( Components[i] is TDBCheckBox )       then TDBCheckBox( Components[i] ).Enabled       := True;
    if ( Components[i] is TDBMemo )           then TDBMemo( Components[i] ).Enabled           := True;
    if ( Components[i] is TDBLookupComboBox ) then TDBLookupComboBox( Components[i] ).Enabled := True;
  end;

  if dbrdgrp_fabr_expo.Value <> '0' then begin
    lbl_fabr_prod.Enabled      := False;
    dbedt_cd_fabr_item.Enabled := False;
    btn_co_fabr_item.Enabled   := False;
    dbedt_cd_fabr_item.TabStop := False;
    lbl_pais.Enabled           := False;
    dbedt_cd_pais_origem.Enabled := False;
    dbedt_cd_pais_origem.TabStop := False;
    btn_co_pais_origem.Enabled := False;
  end;

  if not (lHabilita_NCM_DOC) then begin
    lbl_ncm_doc.Enabled      := False;
    dbedt_cd_ncm_doc.Enabled := False;
    btn_co_ncm_doc.Enabled   := False;
  end
  else begin
    lbl_ncm_doc.Enabled      := True;
    dbedt_cd_ncm_doc.Enabled := True;
    btn_co_ncm_doc.Enabled   := True;
  end;

  if not (lHabilita_NALADI_DOC) then begin
    lbl_naladi_doc.Enabled      := False;
    dbedt_cd_naladi_doc.Enabled := False;
    btn_co_naladi_doc.Enabled   := False;
  end
  else begin
    lbl_naladi_doc.Enabled      := True;
    dbedt_cd_naladi_doc.Enabled := True;
    btn_co_naladi_doc.Enabled   := True;
  end;
end;

procedure Tfrm_exp_itens.dbedt_vl_unitarioEnter(Sender: TObject);
begin
  vl_old := datm_exp_itens.qry_exp_itens_VL_UNITARIO.AsFloat;
end;

procedure Tfrm_exp_itens.dbedt_vl_itemEnter(Sender: TObject);
begin
  with datm_exp_itens do begin
    if qry_exp_itens_VL_TOT_ITEM.AsFloat = 0 then
      qry_exp_itens_VL_TOT_ITEM.AsFloat := Arredondar( qry_exp_itens_QT_MERCADORIA.AsFloat * qry_exp_itens_VL_UNITARIO.AsFloat, 2 );
  end;
end;

procedure Tfrm_exp_itens.dbedt_cd_mercadoriaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = dbedt_cd_ncm               then btn_co_ncmClick(nil);
    if Sender = dbedt_cd_naladi            then btn_co_naladiClick(nil);
    if Sender = dbedt_cd_unid_medida       then btn_co_unid_medidaClick(nil);
    if Sender = dbedt_cd_embalagem         then btn_co_embalagemClick(btn_co_embalagem);
    if Sender = dbedt_cd_emb_sup           then btn_co_emb_supClick(btn_co_emb_sup);
    if Sender = dbedt_cd_mercadoria        then btn_co_mercadoriaClick(btn_co_mercadoria);
    if Sender = dbedt_cd_norma             then btn_co_normasClick(nil);
    if Sender = dbedt_cd_fabr_item         then btn_co_fabr_itemClick(nil);
    if Sender = dbedt_cd_pais_origem       then btn_co_pais_origemClick(btn_co_pais_origem);
    if Sender = dbedt_cd_ncm_doc           then btn_co_ncm_docClick(nil);
    if Sender = dbedt_cd_naladi_doc        then btn_co_naladi_docClick(nil);
    if Sender = dbedt_cd_acordo            then btn_co_acordoClick(nil);
    if Sender = dbedt_cd_unid_medida_estat then btn_co_cd_unid_medida_estat.Click;
  end;
end;

procedure Tfrm_exp_itens.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then btn_sairClick(nil);
end;

procedure Tfrm_exp_itens.dbedt_vl_unitarioExit(Sender: TObject);
begin
  with datm_exp_itens do begin
    if qry_exp_itens_.State in [dsEdit,dsInsert] then
      if ( qry_exp_itens_VL_UNITARIO.AsFloat <> vl_old ) then
        qry_exp_itens_VL_TOT_ITEM.AsFloat := qry_exp_itens_VL_UNITARIO.AsFloat * qry_exp_itens_QT_MERCADORIA.AsFloat;
  end;
end;

procedure Tfrm_exp_itens.dbedt_qt_mercadoriaEnter(Sender: TObject);
begin
 vl_old := datm_exp_itens.qry_exp_itens_QT_MERCADORIA.AsFloat;

end;

procedure Tfrm_exp_itens.btn_co_ncmClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if Not PoeEmEdicao(datm_exp_itens.qry_exp_itens_) then Exit;
    if (Sender as TSpeedButton).Enabled then begin
      datm_exp_itens.qry_exp_itens_CD_NCM.AsString      := ConsultaOnLineEx('TNCM','NCM´s',['CODIGO','DESCRICAO'],['Código','NCM'],'CODIGO');
      dbedt_cd_ncmExit(nil);
    end;
  end;
end;

procedure Tfrm_exp_itens.btn_co_naladiClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if Not PoeEmEdicao(datm_exp_itens.qry_exp_itens_) then Exit;
    if (Sender as TSpeedButton).Enabled then begin
      datm_exp_itens.qry_exp_itens_CD_NALADI_SH.AsString := ConsultaOnLineEx('TNALADISH','NALADI - SH',['CODIGO','DESCRICAO'],['Código','NALADI - SH'],'CODIGO');
      dbedt_cd_ncmExit(nil);
    end;
  end;
end;

procedure Tfrm_exp_itens.btn_co_unid_medidaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_exp_itens.qry_exp_itens_) then exit;
    if (Sender as TSpeedButton).Enabled then begin
      datm_exp_itens.qry_exp_itens_CD_UNID_MEDIDA.AsString := ConsultaOnLineEx('TUNID_MEDIDA_BROKER','Unidades de Medida',['CD_UNID_MEDIDA','NM_UNID_MEDIDA'],['Código','Unidade'],'CD_UNID_MEDIDA');
      dbedt_cd_unid_medidaExit(nil);
    end;
  end
  else edt_nm_unid_medida.Text := ConsultaLookUP('TUNID_MEDIDA_BROKER','CD_UNID_MEDIDA',dbedt_cd_unid_medida.Text,'NM_UNID_MEDIDA');
end;

procedure Tfrm_exp_itens.btn_co_embalagemClick(Sender: TObject);
var cdMerc : string;
begin
 // if trim(dbedt_cd_embalagem.Text) <> '' then
 // begin
    if Sender is TSpeedButton then
    begin
      if not PoeEmEdicao(datm_exp_itens.qry_exp_itens_) then
        exit;

      if (Sender as TSpeedButton).Enabled then
      begin
        cdMerc := ConsultaOnLineEx('TEMBALAGEM','Embalagem',['CD_EMBALAGEM','NM_EMBALAGEM_P'],['Código','Nome'],'CD_EMBALAGEM',frm_main.mi_cad_embal);
        if cdMerc <> '' then
        begin
          datm_exp_itens.qry_exp_itens_CD_EMBALAGEM.AsString := cdMerc;
          dbedt_cd_embalagemExit(nil);
        end;
      end;
    end
    else
      edt_nm_embalagem.Text := ConsultaLookUP('TEMBALAGEM','CD_EMBALAGEM',dbedt_cd_embalagem.Text,'NM_EMBALAGEM_P');
//  end;
end;

procedure Tfrm_exp_itens.dbedt_cd_ncmExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_exp_itens.dbedt_cd_unid_medidaExit(Sender: TObject);
begin
  CodExits;

  if datm_exp_itens.qry_exp_itens_.State in [dsEdit,dsInsert] then begin
    if dbedt_cd_unid_medida.Text = '103' then begin
      if datm_exp_itens.qry_exp_itens_QT_EMBALAGEM.AsFloat = 0 then begin
        datm_exp_itens.qry_exp_itens_QT_EMBALAGEM.AsFloat := datm_exp_itens.qry_exp_itens_QT_MERCADORIA.AsFloat;
        dbedt_qt_por_emb_supExit(nil);
      end;
      dbedt_qt_por_embalagem.Color    := clMenu;
      dbedt_vl_por_emb.Color          := clMenu;
      dbedt_qt_por_embalagem.ReadOnly := True;
      dbedt_vl_por_emb.ReadOnly       := True;
      dbedt_qt_por_embalagem.TabStop  := False;
      dbedt_vl_por_emb.TabStop        := False;
    end;
  end;
end;

procedure Tfrm_exp_itens.dbedt_cd_embalagemExit(Sender: TObject);
begin
  ValidCodigo( dbedt_cd_embalagem );
  with datm_exp_itens do
  begin
    qry_embal_.Close;
    qry_embal_.ParamByName('CD_EMBALAGEM').AsString := dbedt_cd_embalagem.Text;
    qry_embal_.Open;

    if not (ds_exp_itens.State in [dsEdit]) then
      qry_exp_itens_.Edit;

    qry_exp_itens_CD_CLASSIF_EMBALAGEM.AsString := datm_exp_itens.qry_embal_CD_EMBALAGEM_CLIENTE.AsString;
    qry_exp_itens_QT_EMBALAGEM.AsFloat          := datm_exp_itens.qry_embal_QT_MERC_EMB.AsFloat;
    qry_exp_itens_VL_COMPRIMENTO_EMB.AsFloat    := datm_exp_itens.qry_embal_NR_COMPRIMENTO.AsFloat;
    qry_exp_itens_VL_LARGURA_EMB.AsFloat        := datm_exp_itens.qry_embal_NR_LARGURA.AsFloat;
    qry_exp_itens_VL_ALTURA_EMB.AsFloat         := datm_exp_itens.qry_embal_NR_ALTURA.AsFloat;
    qry_exp_itens_VL_PESO_EMB.AsFloat           := datm_exp_itens.qry_embal_NR_PESO.AsFloat;
  end;
  CodExits;
end;

procedure Tfrm_exp_itens.dbedt_qt_por_embalagemExit(Sender: TObject);
var
  nNum1, nNum2, nNum3 : Double;
begin
  with datm_exp_itens do
  begin
    if not (qry_exp_itens_.State in [dsEdit,dsInsert]) then Exit;

    nNum1 := StrToFloat( TiraPonto(dbedt_qt_mercadoria.Text) );
    nNum2 := StrToFloat( TiraPonto(dbedt_qt_por_embalagem.Text) );

    if nNum2 = 1 then
      if nNum1 <> 0 then qry_exp_itens_QT_EMBALAGEM.AsFloat := qry_exp_itens_QT_MERCADORIA.AsFloat;

    if (nNum1 = 0) or (nNum2 = 0) then Exit;

    if dbedt_cd_unid_medida.Text <> '103' then
    begin
      //Quantidade de Embalagens
      if Int( nNum1 / nNum2 ) > 0 then
        qry_exp_itens_QT_EMBALAGEM.AsFloat := Int( nNum1 / nNum2 )
      else
        qry_exp_itens_QT_EMBALAGEM.AsFloat := 1;
    end;

    nNum3 := StrToFloat( TiraPonto(dbedt_vl_unitario.Text) );
    if ( nNum3 = 0 ) then Exit;
    //Valor por Embalagem
    qry_exp_itens_VL_POR_EMB.AsFloat := nNum3 * nNum2;
    // Valor total do Item
    qry_exp_itens_VL_TOT_ITEM.AsFloat := nNum1 * nNum3;
  end;
end;

procedure Tfrm_exp_itens.dbedt_alt_embExit(Sender: TObject);
var
  nNum1, nNum2, nNum3, nNum4 : Double;
begin
  // Cubagem
  If datm_exp_itens.qry_exp_itens_.State in [dsEdit,dsInsert] then
  begin
    nNum1 := StrToFloat( TiraPonto(dbedt_compr_emb.Text) );
    nNum2 := StrToFloat( TiraPonto(dbedt_larg_emb.Text) );
    nNum3 := StrToFloat( TiraPonto(dbedt_alt_emb.Text) );
    nNum4 := StrToFloat( TiraPonto(dbedt_qt_de_emb.Text) );

    If (nNum1 = 0) or (nNum2 = 0) or (nNum3 = 0) or (nNum4 = 0) then Exit;

    nNum1 := StrToFloat( TiraPonto(dbedt_compr_emb.Text) ) * StrToFloat( TiraPonto(dbedt_larg_emb.Text) ) *
             StrToFloat( TiraPonto(dbedt_alt_emb.Text) ) * StrToFloat( TiraPonto(dbedt_qt_de_emb.Text) );

    datm_exp_itens.qry_exp_itens_VL_CUBAGEM.AsFloat := nNum1;
  end;
end;

procedure Tfrm_exp_itens.dbedt_peso_liquidoExit(Sender: TObject);
var
  nNum1, nNum2 : Double;
begin
  If datm_exp_itens.qry_exp_itens_.State in [dsEdit,dsInsert] then begin
    nNum1 := StrToFloat( TiraPonto(dbedt_qt_mercadoria.Text) );
    nNum2 := StrToFloat( TiraPonto(dbedt_peso_liquido.Text) );

    If (nNum1 = 0) or (nNum2 = 0) then Exit;
    datm_exp_itens.qry_exp_itens_VL_TOT_PESO_LIQ.AsFloat := nNum1 * nNum2;
  end;
end;

procedure Tfrm_exp_itens.dbedt_qt_mercadoriaExit(Sender: TObject);
var
  nNum1, nNum2 : Double;
begin
  with datm_exp_itens do begin
    if qry_exp_itens_.State in [dsEdit, dsInsert] then begin
      if qry_exp_itens_QT_MERCADORIA.AsFloat <> vl_old then begin
        qry_exp_itens_VL_TOT_ITEM.AsFloat := qry_exp_itens_QT_MERCADORIA.AsFloat * qry_exp_itens_VL_UNITARIO.AsFloat;

        nNum1 := StrToFloat( TiraPonto(dbedt_qt_mercadoria.Text) );
        nNum2 := StrToFloat( TiraPonto(dbedt_qt_por_embalagem.Text) );

        if (dbedt_cd_unid_medida.Text = '103') and (nNum1 <> 0) then begin
          qry_exp_itens_QT_EMBALAGEM.AsFloat := qry_exp_itens_QT_MERCADORIA.AsFloat;
          dbedt_qt_por_emb_supExit(nil);
        end;

        If (nNum1 = 0) or (nNum2 = 0) then Exit;
        // Quantidade de Embalagens
        if dbedt_cd_unid_medida.Text <> '103' then
          if Int( nNum1 / nNum2 ) > 0 then
            qry_exp_itens_QT_EMBALAGEM.AsFloat := Int( nNum1 / nNum2 )
          else
            qry_exp_itens_QT_EMBALAGEM.AsFloat := 1;

        dbedt_qt_por_embalagemExit(nil);
        dbedt_qt_por_emb_supExit(nil);
        // Total do Peso Liquido
        nNum1 := StrToFloat( TiraPonto(dbedt_qt_mercadoria.Text) );
        nNum2 := StrToFloat( TiraPonto(dbedt_peso_liquido.Text) );
        If (nNum1 = 0) or (nNum2 = 0) then Exit;

        qry_exp_itens_VL_TOT_PESO_LIQ.AsFloat := nNum1 * nNum2;
      end;
    end;
  end;
end;

procedure Tfrm_exp_itens.btn_calculoClick(Sender: TObject);
begin
  lCalculo := True;

  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Add(' SELECT COUNT(*)                    ');
    SQL.Add(' FROM   TPROCESSO_EXP_ITEM (NOLOCK) ');
    SQL.Add(' WHERE  NR_PROCESSO = :NR_PROCESSO  ');
    SQL.Add('   AND ISNULL(NR_PEDIDO, "") = ""   ');
    ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    Open;
    if Fields[0].AsInteger > 0 then
    begin
      MessageDlg('Há ítens sem preenchimento do campo "Pedido do Imp./Fatura".'#13'Preencha e tente novamente.',
         mtError, [mbOk], 0);
      Close;
      Free;
      Exit;
    end;
    Close;
    Free;
  end;

  with datm_exp_itens do
  begin
    nr_item := qry_exp_itens_NR_ITEM.AsString;

    qry_exp_itens_.Close;
    qry_exp_.Close;

    try
      datm_main.db_broker.StartTransaction;

      CloseStoredProc(sp_exp_calcula);
      sp_exp_calcula.ParamByName('@nr_processo').AsString := str_nr_processo;
      ExecStoredProc(sp_exp_calcula);
      if sp_exp_calcula.ParamByName('Result').AsString = '1' then
        BoxMensagem( 'Peso Líquido deve ser menor ou igual ao Peso Bruto!', 2 );
      CloseStoredProc(sp_exp_calcula);

      datm_main.db_broker.Commit;
    except
      on E: Exception do begin
        frm_exp_itens.btn_cancelarClick(nil);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        lCalculo := True;
      end;
    end;

    qry_exp_.Close;
    qry_exp_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_exp_.Open;

    qry_exp_itens_.Close;
    qry_exp_itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_exp_itens_.Open;

    qry_exp_itens_.Locate('NR_PROCESSO;NR_ITEM', VarArrayOf ([str_nr_processo, nr_item]), [loCaseInsensitive]);
  end;
end;

procedure Tfrm_exp_itens.dbedt_qt_por_emb_supExit(Sender: TObject);
var
  nNum1, nNum2, nNum3 : Double;
begin
  with datm_exp_Itens do begin
    if Not ( qry_exp_itens_.State in [dsEdit,dsInsert] ) then Exit;

    if Trim( dbedt_cd_emb_sup.Text ) = '' then Exit;

    nNum1 := StrToFloat( TiraPonto( dbedt_qt_de_emb.Text ) );
    nNum2 := StrToFloat( TiraPonto( dbedt_qt_por_emb_sup.Text ) );
    if ( nNum1 = 0 ) or ( nNum2 = 0 ) then Exit;
    // Quantidade de Embalagens
    if Int( nNum1 * nNum2 ) > 0 then begin
      qry_exp_itens_QT_EMBALAGEM_SUP.AsFloat := Int( nNum1 / nNum2 );

      if Int( nNum1 / nNum2 ) <> ( nNum1 / nNum2 ) then
        qry_exp_itens_QT_EMBALAGEM_SUP.AsFloat := Int( nNum1 / nNum2 ) + 1;

      if qry_exp_itens_QT_EMBALAGEM_SUP.AsFloat <= 0 then
        qry_exp_itens_QT_EMBALAGEM_SUP.AsFloat := 1
    end
    else qry_exp_itens_QT_EMBALAGEM_SUP.AsFloat := 1;

    nNum3 := StrToFloat( TiraPonto( dbedt_vl_unitario.Text ) );
    if ( nNum3 = 0 ) then Exit;
    // Valor por Embalagem
    qry_exp_itens_VL_POR_EMB_SUP.AsFloat := nNum3 * (qry_exp_itens_VL_POR_EMB.AsFloat * qry_exp_itens_QT_EMBALAGEM_SUP.AsFloat );
  end;
end;

procedure Tfrm_exp_itens.btn_co_emb_supClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_exp_itens.qry_exp_itens_) then Exit;
    if (Sender as TSpeedButton).Enabled Then
      datm_exp_itens.qry_exp_itens_CD_EMBALAGEM_SUP.AsString := ConsultaOnLineEx('TEMBALAGEM','Embalagem Superior',['CD_EMBALAGEM','NM_EMBALAGEM_S'],['Código','Nome'],'CD_EMBALAGEM',frm_main.mi_cad_embal)
  end
  else edt_nm_emb_sup.Text := ConsultaLookUP('TEMBALAGEM','CD_EMBALAGEM',dbedt_cd_emb_sup.Text,'NM_EMBALAGEM_S');
end;

procedure Tfrm_exp_itens.btn_co_normasClick(Sender: TObject);
var
nCD_NORMA:String;
begin
  with datm_exp_itens do begin
    if Sender is TSpeedButton then begin
      if Not PoeEmEdicao(datm_exp_itens.qry_exp_itens_) Then Exit;
      if qry_exp_itens_CD_ACORDO.AsString <> '' then
        if (Sender as TSpeedButton).Enabled Then
          nCD_NORMA:= ConsultaOnLineExSQL(
            ' SELECT N.CODIGO, N.NM_DESCRICAO FROM TNORMAS N (NOLOCK), TMERC_EXP_ACORDO mea (NOLOCK) ' +
            ' WHERE N.CODIGO = mea.CD_NORMA ' +
            ' and mea.CD_MERCADORIA = '+''''+dbedt_cd_mercadoria.Text+''''+
            ' and mea.CD_ACORDO = '+''''+dbedt_cd_acordo.Text+'''' ,
            'Normas',['CODIGO', 'NM_DESCRICAO'],['Código', 'Descrição'], 'CODIGO');

         if nCD_NORMA<>'' then
            qry_exp_itens_CD_NORMAS.AsString := nCD_NORMA;   
    end else
      edt_nm_norma.Text := ConsultaLookUPSQL(
        'SELECT N.NM_DESCRICAO FROM TNORMAS N (NOLOCK) ' +
        'WHERE  IN_ATIVO = ''1'' ' +
        '  AND N.CODIGO  = '''+ dbedt_cd_norma.Text +''' ', 'NM_DESCRICAO');

  end;


end;

procedure Tfrm_exp_itens.btn_co_fabr_itemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if Not PoeEmEdicao(datm_exp_itens.qry_exp_itens_) Then Exit;
    if (Sender as TSpeedButton).Enabled Then
      datm_exp_itens.qry_exp_itens_CD_FABRICANTE.AsString := ConsultaOnLineEx('TEMPRESA_NAC', 'Fabricante/Produtor', ['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA','CGC_EMPRESA','END_EMPRESA'],['Código','Descrição','Apelido','CNPJ','Endereço'], 'CD_EMPRESA');
  end
  else edt_nm_fabr_item.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', datm_exp_itens.qry_exp_itens_CD_FABRICANTE.AsString, 'AP_EMPRESA');
end;

procedure Tfrm_exp_itens.dbrdgrp_fabr_expoChange(Sender: TObject);
begin
  with datm_exp_itens do begin
    if qry_exp_itens_.State in [dsEdit,dsInsert] then begin
      if (dbrdgrp_fabr_expo.Value = '1') then begin
        qry_exp_itens_CD_FABRICANTE.AsString  := '';
        qry_exp_itens_CD_PAIS_ORIGEM.AsString := '';
        dbedt_cd_fabr_item.Text   := '';
        edt_nm_fabr_item.Text     := '';
        dbedt_cd_pais_origem.Text := '';
        edt_nm_pais_origem.Text   := '';
      end
      else
      if (dbrdgrp_fabr_expo.Value = '2') then begin
        qry_exp_itens_CD_FABRICANTE.AsString := '';
        dbedt_cd_fabr_item.Text   := '';
        edt_nm_fabr_item.Text     := '';
      end;
    end;

    if (dbrdgrp_fabr_expo.Value = '2') or (dbrdgrp_fabr_expo.Value = '0') then begin
      lbl_pais.Enabled             := True;
      dbedt_cd_pais_origem.Enabled := True;
      btn_co_pais_origem.Enabled   := True;
      dbedt_cd_pais_origem.TabStop := True;
    end;

    if dbrdgrp_fabr_expo.Value = '0' then begin
      lbl_fabr_prod.Enabled      := True;
      dbedt_cd_fabr_item.Enabled := True;
      btn_co_fabr_item.Enabled   := True;
      dbedt_cd_fabr_item.TabStop := True;
    end
    else
    if dbrdgrp_fabr_expo.Value = '2' then begin
      lbl_fabr_prod.Enabled      := False;
      dbedt_cd_fabr_item.Enabled := False;
      btn_co_fabr_item.Enabled   := False;
      dbedt_cd_fabr_item.TabStop := False;
    end
    else begin
      dbedt_cd_fabr_item.Text      := '';
      edt_nm_fabr_item.Text        := '';
      lbl_fabr_prod.Enabled        := False;
   //   dbedt_cd_fabr_item.Enabled   := False;
   //   btn_co_fabr_item.Enabled     := False;
  //    dbedt_cd_fabr_item.TabStop   := False;
      dbedt_cd_pais_origem.Text    := '';
      edt_nm_pais_origem.Text      := '';
      lbl_pais.Enabled             := False;
      dbedt_cd_pais_origem.Enabled := False;
      btn_co_pais_origem.Enabled   := False;
      dbedt_cd_pais_origem.TabStop := False;
    end;
  end;
end;

procedure Tfrm_exp_itens.btn_co_pais_origemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if Not PoeEmEdicao(datm_exp_itens.qry_exp_itens_) Then Exit;
    if (Sender as TSpeedButton).Enabled Then
      datm_exp_itens.qry_exp_itens_CD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS', 'País de Origem', ['CODIGO', 'DESCRICAO'], ['Código', 'País'], 'CODIGO');
  end
  else edt_nm_pais_origem.Text := ConsultaLookUP('TPAIS', 'CODIGO', dbedt_cd_pais_origem.Text, 'DESCRICAO');
end;

procedure Tfrm_exp_itens.dbedt_cd_ncm_docExit(Sender: TObject);
begin
  with datm_exp_itens do begin
    if qry_exp_itens_NR_SEQ_NCM_DOC.IsNull then begin
      if Not ( qry_exp_itens_.State in [dsEdit, dsInsert] ) then qry_exp_itens_.Edit;
      qry_exp_itens_NR_SEQ_NCM_DOC.AsInteger := 1;
    end;
  end;
  CodExits;
end;

procedure Tfrm_exp_itens.dbedt_cd_naladi_docExit(Sender: TObject);
begin
  with datm_exp_itens do begin
    if qry_exp_itens_NR_SEQ_NALADI_DOC.IsNull then begin
      if Not ( qry_exp_itens_.State in [dsEdit, dsInsert] ) then qry_exp_itens_.Edit;
      qry_exp_itens_NR_SEQ_NALADI_DOC.AsInteger := 1;
    end;
  end;
  CodExits;
end;

procedure Tfrm_exp_itens.btn_co_ncm_docClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_ncm_exp, frm_ncm_exp );
  frm_ncm_exp.Cons_OnLine    := datm_exp_itens.qry_exp_itens_CD_NCM_DOC;
  frm_ncm_exp.Cons_OnLineSeq := datm_exp_itens.qry_exp_itens_NR_SEQ_NCM_DOC;
  with frm_ncm_exp do begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_exp_itens.qry_exp_itens_.State in [dsEdit, dsInsert] ) then
       datm_exp_itens.qry_exp_itens_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  dbedt_cd_ncm_docExit(nil);
end;

procedure Tfrm_exp_itens.btn_co_naladi_docClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_naladi_sh_exp, frm_naladi_sh_exp );
  frm_naladi_sh_exp.Cons_OnLine    := datm_exp_itens.qry_exp_itens_CD_NALADI_DOC;
  frm_naladi_sh_exp.Cons_OnLineSeq := datm_exp_itens.qry_exp_itens_NR_SEQ_NALADI_DOC;
  with frm_naladi_sh_exp do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_exp_itens.qry_exp_itens_.State in [dsEdit, dsInsert] ) then
       datm_exp_itens.qry_exp_itens_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  dbedt_cd_naladi_docExit(nil);
end;

procedure Tfrm_exp_itens.dbedt_cd_acordoExit(Sender: TObject);
begin
  CodExits;
  if dbedt_cd_acordo.Text <> '' then begin
    lbl_norma.Enabled      := True;
    dbedt_cd_norma.Enabled := True;
    btn_co_normas.Enabled  := True;
  end
  else begin
    lbl_norma.Enabled      := False;
    dbedt_cd_norma.Enabled := False;
    btn_co_normas.Enabled  := False;
    dbedt_cd_norma.Text    := '';
    edt_nm_norma.Text      := '';
  end;
end;

procedure Tfrm_exp_itens.btn_co_acordoClick(Sender: TObject);
var
nCD_ACORDO:String;
begin
  if Sender is TSpeedButton then begin
    if Not PoeEmEdicao(datm_exp_itens.qry_exp_itens_) Then Exit;

    if (Sender as TSpeedButton).Enabled Then begin
        nCD_ACORDO:= ConsultaOnLineExSQL(
            ' select DISTINCT mea.CD_ACORDO from tmerc_exp_acordo mea (NOLOCK) ' +
            ' JOIN TACORDO_PAIS ap (NOLOCK) ON ap.CD_ACORDO=mea.CD_ACORDO ' +
            ' WHERE mea.CD_MERCADORIA = '+''''+dbedt_cd_mercadoria.Text+''''+
            ' AND ap.CD_PAIS = '+''''+datm_exp_itens.qry_exp_CD_PAIS_DESTINO.AsString+'''' ,
            ' Acordos',['CD_ACORDO'],['ACORDO  '], 'CD_ACORDO');

        if nCD_ACORDO<>'' then
           datm_exp_itens.qry_exp_itens_CD_ACORDO.AsString := nCD_ACORDO;

      dbedt_cd_acordoExit(nil);
    end;
  end else edt_nm_acordo.Text := dbedt_cd_acordo.Text; // ConsultaLookUPSQL(  'Select CD_ACORDO from TMERC_EXP_ACORDO where CD_MERCADORIA = '+''''+dbedt_cd_mercadoria.Text+'''', 'CD_ACORDO');

end;

procedure Tfrm_exp_itens.btn_manut_procClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0102';

  pgctrl_Item.SetFocus;
  if ( Not (lCalculo) ) and ( datm_exp_itens.qry_exp_itens_.RecordCount <> 0 ) then
  begin
    // A linha abaixo foi substituida pelo calculo, pois criavam o RE sem calcular e ficcavam com valores zerados - Michel - 23/01/2009
    //BoxMensagem( 'Processo deverá ser calculado !!', 3 );
    btn_calculoClick(btn_calculo);
    frm_exp_itens.SetFocus;
    Exit;
  end;
  frm_exp.i_seletor := 3;
  Close;
end;

procedure Tfrm_exp_itens.btn_repassa_ncm_naladi_docClick(Sender: TObject);
begin
  lCalculo := True;
  with datm_exp_itens do begin
    nr_item := qry_exp_itens_NR_ITEM.AsString;

    qry_exp_itens_.Close;
    qry_exp_.Close;

    try
      datm_main.db_broker.StartTransaction;

      CloseStoredProc(sp_exp_repassa_ncm_naladi_doc);
      sp_exp_repassa_ncm_naladi_doc.ParamByName('@nr_processo').AsString := str_nr_processo;
      ExecStoredProc(sp_exp_repassa_ncm_naladi_doc);
      CloseStoredProc(sp_exp_repassa_ncm_naladi_doc);

      datm_main.db_broker.Commit;
    except
      on E: Exception do begin
        frm_exp_itens.btn_cancelarClick(nil);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        lCalculo := True;
      end;
    end;

    qry_exp_.Close;
    qry_exp_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_exp_.Open;

    qry_exp_itens_.Close;
    qry_exp_itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_exp_itens_.Open;

    qry_exp_itens_.Locate('NR_PROCESSO;NR_ITEM', VarArrayOf ([str_nr_processo, nr_item]), [loCaseInsensitive]);
  end;
end;

procedure Tfrm_exp_itens.btn_reClick(Sender: TObject);
begin
  with tQuery.Create(application) do begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Add('SELECT IN_MONTADO FROM TPROCESSO_EXP (NOLOCK) WHERE NR_PROCESSO = ' + QuotedStr(datm_exp.qry_exp_NR_PROCESSO.AsString));
    Open;
    str_nr_processo := datm_exp.qry_exp_NR_PROCESSO.AsString;
    if (Fields[0].AsString = '0') or (Fields[0].IsNull) then begin
      if not VerIntegridade then Exit;
      vStr_cd_modulo := '20';
      str_cd_rotina := '2012';
      str_cd_mod := vStr_cd_modulo;
      str_cd_rot := str_cd_rotina;
      Application.CreateForm(Tfrm_exp_monta_re, frm_exp_monta_re);
      frm_exp_monta_re.ShowModal;
    end
    else begin
      if not VerIntegridade then Exit;
      vStr_cd_modulo := '20';
      str_cd_rotina := '2017';
      str_cd_mod := vStr_cd_modulo;
      str_cd_rot := str_cd_rotina;
      Application.CreateForm(Tdatm_re_capa, datm_re_capa);
      Application.CreateForm(Tfrm_re_capa, frm_re_capa);
      frm_re_capa.ShowModal;
    end;
    Free;
  end;
end;

procedure Tfrm_exp_itens.dbedt_nr_ped_impExit(Sender: TObject);
begin
  with TQuery.Create(Application) do begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT DT_REMESSA FROM TPROCESSO_EXP_ITEM (NOLOCK)');
    SQL.Add('WHERE NR_PROCESSO   = '''+ datm_exp_itens.qry_exp_itens_NR_PROCESSO.AsString +''' ');
    SQL.Add('  AND NR_PEDIDO_IMP = '''+ datm_exp_itens.qry_exp_itens_NR_PEDIDO_IMP.AsString +''' ');
    Open;

    if not IsEmpty then dbedt_dt_remessa.Date := Fields[0].AsDateTime;
    Close;
    Free;
  end;
end;

procedure Tfrm_exp_itens.dbedtNrSeqNCMDocChange(Sender: TObject);
begin
  with datm_exp_itens do begin
    qry_ncm_doc_.Close;
    qry_ncm_doc_.ParamByName('CODIGO').AsString  := qry_exp_itens_CD_NCM_DOC.AsString;
    qry_ncm_doc_.ParamByName('NR_SEQ').AsInteger := qry_exp_itens_NR_SEQ_NCM_DOC.AsInteger;
    qry_ncm_doc_.Open;
    edt_nm_ncm_doc.Text := qry_ncm_doc_DESCRICAO.AsString;
  end;
end;

procedure Tfrm_exp_itens.dbedtNrSeqNALADIDocChange(Sender: TObject);
begin
  with datm_exp_itens do begin
    qry_naladish_doc_.Close;
    qry_naladish_doc_.ParamByName('CODIGO').AsString  := qry_exp_itens_CD_NALADI_DOC.AsString;
    qry_naladish_doc_.ParamByName('NR_SEQ').AsInteger := qry_exp_itens_NR_SEQ_NALADI_DOC.AsInteger;
    qry_naladish_doc_.Open;
    edt_nm_naladi_doc.Text := qry_naladish_doc_DESCRICAO.AsString;
  end;
end;

procedure Tfrm_exp_itens.dbedt_nr_nfChange(Sender: TObject);
begin
  vAlterouNF := true;
end;

procedure Tfrm_exp_itens.btnCoNFClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if Not PoeEmEdicao(datm_exp_itens.qry_exp_itens_) Then Exit;
    if (Sender as TSpeedButton).Enabled Then
      datm_exp_itens.qry_exp_itens_NR_NF.AsString  := ConsultaOnLineExFiltro('TPROCESSO_EXP_NF', 'Notas Fiscais',['NR_NF','DT_NOTA', 'VL_NOTA'],['Número','Data', 'Valor'],'NR_NF', ' NR_PROCESSO = "' + datm_exp_itens.qry_exp_NR_PROCESSO.AsString + '" ', nil, datm_exp_itens.qry_exp_itens_NR_NF.AsString, 0);
  end;
end;

procedure Tfrm_exp_itens.dbedt_cd_unid_medida_estatChange(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_exp_itens.qry_exp_itens_) then
      Exit;
    if (Sender as TSpeedButton).Enabled then
    begin
      datm_exp_itens.qry_exp_itens_CD_UNID_MEDIDA_ESTAT.AsString := ConsultaOnLineEx('TUNID_MEDIDA_BROKER', 'Unidades de Medida', ['CD_UNID_MEDIDA', 'NM_UNID_MEDIDA'], ['Código', 'Unidade'], 'CD_UNID_MEDIDA');
      dbedt_cd_unid_medidaExit(nil);
    end;
  end
  else
    edt_nm_unidade_medida_estat.Text := ConsultaLookUP('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA', dbedt_cd_unid_medida_estat.Text, 'NM_UNID_MEDIDA');
end;

procedure Tfrm_exp_itens.dbedt_cd_unid_medida_estatExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_exp_itens.dbedtCFOPChange(Sender: TObject);
begin
  if Trim(dbedtCFOP.Text) = '' then
    edtCFOP.Text := ''
  else
    edtCFOP.Text := ConsultaLookUP('TCFOP', 'CD_CFOP', Trim(dbedtCFOP.Text), 'NM_CFOP');
end;

procedure Tfrm_exp_itens.btn_co_cd_cfopClick(Sender: TObject);
var
  vCFOP: String;
begin
  vCFOP := StringReplace(ConsultaOnLineExSQL('SELECT LEFT(CD_CFOP, 1) + "." + RIGHT(CD_CFOP, 3) AS CD_CFOP, NM_CFOP ' +
                                             'FROM TCFOP (NOLOCK) ',
       'CFOP', ['CD_CFOP', 'NM_CFOP'], ['Código', 'Descrição'], 'CD_CFOP'), '.', '', [rfReplaceAll]);
  if vCFOP <> datm_exp_itens.qry_exp_itens_CD_CFOP.AsString then
  begin
    if not(datm_exp_itens.qry_exp_itens_.State in [dsEdit, dsInsert]) then
      datm_exp_itens.qry_exp_itens_.Edit;
    datm_exp_itens.qry_exp_itens_CD_CFOP.AsString := vCFOP;
  end;
end;

procedure Tfrm_exp_itens.pgctrl_ItemChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  ActiveControl := nil;
  AllowChange := VerAlt;
end;

procedure Tfrm_exp_itens.pgctrl_ItemChange(Sender: TObject);
begin
  if pgctrl_Item.ActivePage = tbsLotes then
  begin
     btn_novo_item.hint := 'Novo Lote';
     btn_excluir.hint   := 'Excluir Lote';

     if datm_exp_itens.qrylotes.EOF then
     begin
        btn_excluir.Enabled   := False;
        mi_excluir.Enabled    := False;
     end
     else
     begin
        btn_excluir.Enabled   := true;
        mi_excluir.Enabled    := true;
     end;
  end
  else
  begin
     btn_novo_item.hint := 'Novo Item';
     btn_excluir.hint   := 'Excluir Item';
     btn_excluir.Enabled   := true;
     mi_excluir.Enabled    := true;
  end;
end;

procedure Tfrm_exp_itens.btnCarregarTotaisClick(Sender: TObject);
begin
  if not (datm_exp_itens.qry_Exp_Itens_Cntr.state in [dsinsert, dsedit]) then
    datm_exp_itens.qry_Exp_Itens_Cntr.edit;

  datm_exp_itens.qry_Exp_Itens_CntrNR_CONTR.value        :=  datm_exp_itens.qry_exp_itens_NR_CONTAINER_PEDIDO.asstring;
  datm_exp_itens.qry_Exp_Itens_CntrQT_MERCADORIA.value   :=  datm_exp_itens.qry_exp_itens_QT_MERCADORIA.asfloat;
  datm_exp_itens.qry_Exp_Itens_CntrQT_PESO_BRUTO.value   :=  datm_exp_itens.qry_exp_itens_VL_TOT_PESO_BRUTO.asFloat;
  datm_exp_itens.qry_Exp_Itens_CntrVL_CUBAGEM.value      :=  datm_exp_itens.qry_exp_itens_VL_CUBAGEM.asFloat;
end;

end.

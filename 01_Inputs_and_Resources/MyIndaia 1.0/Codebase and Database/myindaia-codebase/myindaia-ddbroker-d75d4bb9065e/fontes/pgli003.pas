unit PGLI003;

interface

uses
  Windows, Messages, SysUtils, StrUtils, StdCtrls, Buttons, Menus, DBCtrls,
  ExtCtrls, Mask, Controls, ComCtrls, Variants, Classes, Graphics, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, Funcoes, ConsOnLineEx;

type
  Tfrm_LI_Itens = class(TForm)
    menu_manut_cadastro: TMainMenu;
    mi_novo: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_Item: TPageControl;
    ts_item1: TTabSheet;
    lbl_mercadoria: TLabel;
    lbl_pais_origem: TLabel;
    btn_co_pais_aquisicao: TSpeedButton;
    lbl_pais_aquisicao: TLabel;
    btn_co_pais_origem: TSpeedButton;
    lbl_exportador: TLabel;
    lbl_fabricante: TLabel;
    btn_co_exportador: TSpeedButton;
    btn_co_fabricante: TSpeedButton;
    btn_co_produto: TSpeedButton;
    lbl_unid_medida: TLabel;
    lbl_qt_mercadoria: TLabel;
    lbl_vl_unitario: TLabel;
    lbl_vl_item: TLabel;
    lbl_cd_ncm: TLabel;
    lbl_unid_med_estat: TLabel;
    lbl_qt_unid_estat: TLabel;
    lbl_cd_naladi_sh: TLabel;
    btn_co_unid_med: TSpeedButton;
    btn_co_naladi_sh: TSpeedButton;
    btn_co_ncm: TSpeedButton;
    lbl_peso_liquido: TLabel;
    dbrgrp_fabr_expo: TDBRadioGroup;
    dbedt_cd_mercadoria: TDBEdit;
    dbedt_cd_pais_origem: TDBEdit;
    dbedt_cd_pais_aquisicao: TDBEdit;
    dbedt_cd_exportador: TDBEdit;
    dbedt_cd_fabricante: TDBEdit;
    dbm_descricao_mercadoria: TDBMemo;
    dbedt_cd_unid_comercial: TDBEdit;
    dbedt_qt_mercadoria: TDBEdit;
    dbedt_vl_unitario: TDBEdit;
    dbedt_vl_item: TDBEdit;
    dbedt_cd_ncm: TDBEdit;
    dbedt_qt_unid_estat: TDBEdit;
    dbedt_cd_naladi_sh: TDBEdit;
    dbedt_peso_liq: TDBEdit;
    lbl_vl_unitario_mcv: TLabel;
    dbedt_vl_unitario_mcv: TDBEdit;
    lbl_destaque: TLabel;
    dbedt_destaque: TDBEdit;
    dbedt_nm_mercadoria: TEdit;
    dbedt_nm_unidade: TEdit;
    dbedt_nm_exportador: TEdit;
    dbedt_nm_fabricante: TEdit;
    dbedt_nm_pais_aquisicao: TEdit;
    dbedt_nm_pais_origem: TEdit;
    edt_unid_med_estat: TEdit;
    mi_excluir: TMenuItem;
    mi_calculo: TMenuItem;
    lbl_numero: TLabel;
    dbedt_cd_numero_ato: TDBEdit;
    lbl_regime: TLabel;
    lbl_fund_legal: TLabel;
    btn_co_regime_tributacao: TSpeedButton;
    btn_co_fund_legal: TSpeedButton;
    dbedt_cd_regime_tributacao: TDBEdit;
    dbedt_cd_fund_legal: TDBEdit;
    dbedt_nm_regime_tributacao: TEdit;
    dbedt_nm_fund_legal: TEdit;
    bvl_mercadoria: TBevel;
    rbtn_sistema_drawback1: TRadioButton;
    rbtn_sistema_drawback2: TRadioButton;
    rbtn_sistema_drawback3: TRadioButton;
    dbedt_nr_item_drawback: TDBEdit;
    dbedt_qt_produto_drawback: TDBEdit;
    dbedt_vl_produto_drawback: TDBEdit;
    lbl_nr_item_drawback: TLabel;
    lbl_qt_produto: TLabel;
    lbl_vl_produto_drawback: TLabel;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_novo: TSpeedButton;
    btn_capa_li: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_monta_li: TSpeedButton;
    btn_calculo: TSpeedButton;
    dbnvgr_li_itens: TDBNavigator;
    dbedt_item_atual: TDBEdit;
    dbedt_item_total: TDBEdit;
    mi_duplica: TMenuItem;
    mi_monta_li: TMenuItem;
    mi_capa_li: TMenuItem;
    btn_duplica: TSpeedButton;
    lbl_nr_referencia: TLabel;
    dbedt_nr_po: TDBEdit;
    dbedt_nr_item_po: TDBEdit;
    lbl_info_drawback: TLabel;
    shp_mercadoria: TShape;
    shp_sistema_drawback: TShape;
    lbl_sistema_drawback: TLabel;
    shp_info_drawback: TShape;
    btn_trans_LI: TSpeedButton;
    btnFabricante: TBitBtn;
    btnExportador: TBitBtn;
    btnFabriExpo: TBitBtn;
    btnQtdUnidEstatIgual: TBitBtn;
    rgpDrawback: TDBRadioGroup;
    btnRatearPeso: TSpeedButton;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    dbedtvl_total_mle_sem_frete: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbedtvl_rat_frete: TDBEdit;
    editItem: TEdit;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_duplicaClick(Sender: TObject);
    procedure btn_monta_liClick(Sender: TObject);
    procedure btn_calculoClick(Sender: TObject);
    procedure btn_capa_liClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_co_unid_medClick(Sender: TObject);
    procedure btn_co_pais_origemClick(Sender: TObject);
    procedure btn_co_pais_aquisicaoClick(Sender: TObject);
    procedure btn_co_ncmClick(Sender: TObject);
    procedure btn_co_naladi_shClick(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure btn_co_fabricanteClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_fund_legalClick(Sender: TObject);
    procedure btn_co_regime_tributacaoClick(Sender: TObject);
    procedure dbedt_cd_mercadoriaExit(Sender: TObject);
    procedure dbedt_peso_liqEnter(Sender: TObject);
    procedure dbedt_cd_ncmExit(Sender: TObject);
    procedure dbedt_cd_unid_comercialExit(Sender: TObject);
    procedure dbedt_nm_unidadeExit(Sender: TObject);
    procedure dbedt_nm_mercadoriaExit(Sender: TObject);
    procedure dbedt_cd_exportadorExit(Sender: TObject);
    procedure dbedt_cd_fabricanteExit(Sender: TObject);
    procedure dbedt_cd_pais_aquisicaoExit(Sender: TObject);
    procedure dbedt_cd_pais_origemExit(Sender: TObject);
    procedure dbedt_cd_naladi_shExit(Sender: TObject);
    procedure dbedt_vl_itemEnter(Sender: TObject);
    procedure dbrgrp_fabr_expoChange(Sender: TObject);
    procedure dbm_descricao_mercadoriaExit(Sender: TObject);
    procedure dbedt_cd_mercadoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_qt_mercadoriaChange(Sender: TObject);
    procedure pgctrl_ItemChange(Sender: TObject);
    procedure pgctrl_ItemChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dbedt_cd_regime_tributacaoExit(Sender: TObject);
    procedure dbedt_cd_fund_legalExit(Sender: TObject);
    procedure dbedt_nr_poKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_nr_item_poExit(Sender: TObject);
    procedure rbtn_sistema_drawbackClick(Sender: TObject);
    procedure dbedt_qt_mercadoriaExit(Sender: TObject);
    procedure btn_trans_LIClick(Sender: TObject);
    procedure btnQtdUnidEstatIgualClick(Sender: TObject);
    procedure btnExportadorClick(Sender: TObject);
    procedure btnFabricanteClick(Sender: TObject);
    procedure btnFabriExpoClick(Sender: TObject);
    procedure rgpDrawbackChange(Sender: TObject);
    procedure rgpDrawbackClick(Sender: TObject);
    procedure btnRatearPesoClick(Sender: TObject);
    procedure dbedt_item_atualChange(Sender: TObject);
    procedure editItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editItemKeyPress(Sender: TObject; var Key: Char);
    procedure editItemKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    function VerAlt  : Boolean;
    function Grava   : Boolean;
    function Consiste: Boolean;
    function MercadoriaHabilitada(pImportador: String): Boolean;

    procedure ValidaRegime( nControla : Byte );
    procedure Cancelar;
    procedure CodExits;
    procedure Habilita_Entrada;
    procedure Desabilita_Entrada;
    procedure Verifica_Capa;
    procedure HabilitaDrawback;
  public
    { Public declarations }
    nr_item: string[3];
    lNaoConsiste, in_abrindo_itens: Boolean;
    vEmScroll : Boolean;

    procedure btn_mi(i, s, c, e, d, m, o: Boolean);
  end;

var
  frm_LI_Itens: Tfrm_LI_Itens;

implementation

uses GSMLIB, PGGP001, PGGP017, PGLI002, PGLI004, PGLI006, PGLI007, PGLI008;

{$R *.DFM}

procedure Tfrm_LI_Itens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Verifica_Capa;

  if VerAlt then
  begin
    with datm_LI_Itens do
    begin
      { Fecha todas as tabelas }
      qry_unid_medida_.Close;
      tbl_ncm_.Close;
      tbl_naladi_sh_.Close;
      qry_li_nve_.Close;
      qry_li_itens_.Close;
      qry_li_.Close;

      Free;
      Action := caFree;
      {
      if frm_LI.in_montada then
      begin
        datm_LI.qry_LI_.Close;
        datm_LI.qry_LI_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
        datm_LI.qry_LI_.SQL[5] := 'OR NR_PROCESSO LIKE"' + Copy( str_nr_processo,1,14 ) + '%"';
        datm_LI.qry_LI_.Prepare;
        datm_LI.qry_LI_.Open;
      end;
      }
    end;
  end
  else
    Action := caNone;
end;

procedure Tfrm_LI_Itens.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_LI_Itens.FormShow(Sender: TObject);
var
  nNum, Code : Integer;
begin
  with datm_LI_Itens do
  begin
    qry_reg_trib_.Close;
    qry_reg_trib_.Prepare;
    qry_reg_trib_.Open;

    if Trim( str_nr_processo ) = '' then 
      str_nr_processo := Trim( datm_li.qry_li_NR_PROCESSO.AsString );
    Caption := 'Licença de Importação [ ' + Copy( str_nr_processo, 5, 16 ) + ' ] ';
    in_abrindo_itens := False;

    qry_LI_.Close;
    qry_LI_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
    qry_LI_.Prepare;
    qry_LI_.Open;

    qry_li_itens_.Close;
    qry_li_itens_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
    qry_li_itens_.Prepare;
    qry_li_itens_.Open;

    Val( qry_li_QT_TOTAL_ITEM.AsString, nNum, Code );

    if frm_li.in_montada then
    begin
      dbedt_cd_regime_tributacaoExit(nil);
      if frm_li.in_retificar then
      begin
        Habilita_Entrada;
        btn_mi(True, False, False, True, True, True, True);
      end
      else
        Desabilita_Entrada;
    end
    else
    begin
      if nNum = 0 then
      begin
        Desabilita_Entrada;
        btn_mi(True, False, False, False, False, False, False);
      end
      else
      begin
        Habilita_Entrada;
        btn_mi(True, False, False, True, True, True, True);
        dbedt_cd_regime_tributacaoExit(nil);
      end;
    end;

    btn_sair.Enabled    := True;
    mi_sair.Enabled     := True;
    btn_capa_li.Enabled := True;
    mi_capa_li.Enabled  := True;

    pgctrl_Item.ActivePage := ts_item1;
  end;
  HabilitaDrawback;  
end;

procedure Tfrm_LI_Itens.btn_novoClick(Sender: TObject);
begin
  with datm_LI_Itens do
  begin
    if pgctrl_Item.ActivePage = ts_item1 then
    begin
      qry_li_Itens_.Close;
      qry_li_Itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_li_Itens_.Prepare;
      qry_li_Itens_.Open;

      Habilita_Entrada;

      qry_li_itens_.Append;
      qry_li_itens_NR_PROCESSO.AsString := str_nr_processo;

      NullToZero( qry_LI_Itens_QT_MERC_UN_COMERC );
      NullToZero( qry_LI_Itens_VL_UNIT_MLE       );
      NullToZero( qry_LI_Itens_VL_TOTAL_MLE      );
      NullToZero( qry_LI_Itens_PL_MERCADORIA     );
      NullToZero( qry_LI_Itens_VL_UNIT_MCV       );
      NullToZero( qry_LI_Itens_QT_MERC_UN_ESTAT  );

      dbedt_cd_mercadoria.SetFocus;
    end;
  end;

  btn_mi(False, True, True, False, False, False, False);
  dbnvgr_li_itens.Enabled := False;
end;

procedure Tfrm_LI_Itens.btn_salvarClick(Sender: TObject);
begin
  {Quantidade}
  if Trim( dbedt_qt_mercadoria.Text ) = '' then
  begin
    MessageDlg('Quantidade Inválida !',mtError,[mbOK],0);
    pgctrl_Item.ActivePage := ts_item1;
    dbedt_qt_mercadoria.SetFocus;
    Exit;
  end;

  {Vlr. Unitario}
  if Trim( dbedt_vl_unitario.Text ) = '' then
  begin
    MessageDlg('Valor Unitário Inválido !',mtError,[mbOK],0);
    pgctrl_Item.ActivePage := ts_item1;
    dbedt_vl_unitario.SetFocus;
    Exit;
  end;

  {Nr. da PO}
  if Trim(dbedt_nr_po.Text) = '' then
  begin
    MessageDlg('É necessário informar o número da PO.',mtError,[mbOK],0);
    pgctrl_Item.ActivePage := ts_item1;
    dbedt_nr_po.SetFocus;
    Exit;
  end;

  {Nr. do item da PO}
  if Trim(dbedt_nr_item_po.Text) = '' then
  begin
    MessageDlg('É necessário informar o número do Item Cliente.',mtError,[mbOK],0);
    pgctrl_Item.ActivePage := ts_item1;
    dbedt_nr_item_po.SetFocus;
    Exit;
  end;

  if (Trim(dbedt_peso_liq.Text) <> '') and (Trim(dbedt_cd_ncm.Text) <> '')  then
    dbedt_cd_ncmExit(nil);

  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

function Tfrm_LI_Itens.Grava;
var
  i : Integer;
begin
  Grava := True;

  try
    with datm_LI_Itens do
    begin
      datm_main.db_broker.StartTransaction;

      if pgctrl_Item.ActivePage = ts_item1 then
      begin
        if not (qry_li_.State in [dsEdit]) then qry_li_.Edit;

        if qry_li_itens_.State in [dsInsert] then
        begin
          if not (qry_li_QT_TOTAL_ITEM.IsNull) then
          begin
            i := StrToInt( qry_li_QT_TOTAL_ITEM.AsString );
            i := i + 1;

            qry_li_QT_TOTAL_ITEM.AsString := StrZero( i, 3 ); // Quantidade Total dos Itens
            qry_li_itens_NR_ITEM.AsString := StrZero( i, 3 ); // Numero do Item
          end
          else
          begin
            qry_li_QT_TOTAL_ITEM.AsString := '001';           // Quantidade Total dos Itens
            qry_li_itens_NR_ITEM.AsString := '001';           // Numero do Item
          end;
        end;

        if qry_li_itens_.State in [dsEdit,dsInsert] then
        begin
          qry_li_.Post;
          qry_li_itens_.Post;

          nr_item := qry_li_itens_NR_ITEM.AsString;

          qry_li_itens_.Close;
          qry_li_itens_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
          qry_li_itens_.Prepare;
          qry_li_itens_.Open;
          qry_li_itens_.Locate('NR_PROCESSO;NR_ITEM', VarArrayOf ([str_nr_processo, nr_item]), [loCaseInsensitive]);
        end;
      end;
      datm_main.db_broker.Commit;
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;

  if pgctrl_Item.ActivePage = ts_item1 then
  begin
    if datm_LI_Itens.qry_li_itens_.IsEmpty then
    begin
      btn_mi(True, False, False, False, False, False, False);
      dbnvgr_li_itens.Enabled := False;
    end
    else
    begin
      btn_mi(True, False, False, True, True, True, True);
      dbnvgr_li_itens.Enabled := True;
    end;
  end;
end;

procedure Tfrm_LI_Itens.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_LI_Itens.dbedt_cd_ncmExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_Itens.btn_excluirClick(Sender: TObject);
begin
  with datm_LI_Itens do
  begin
    if not ( frm_LI.in_montada ) then
    begin
      if BoxMensagem( 'Este item será excluído! Confirma exclusão?', 1 ) then
      begin
        nr_item := qry_li_itens_NR_ITEM.AsString;

        qry_li_.Close;
        qry_li_itens_.Close;

        try
          datm_main.db_broker.StartTransaction;

          CloseStoredProc( sp_li_apaga_renum_itens );

          { Apaga e renumera itens }
          sp_li_apaga_renum_itens.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
          sp_li_apaga_renum_itens.ParamByName('@NR_ITEM').AsString     := nr_item;

          ExecStoredProc( sp_li_apaga_renum_itens );
          CloseStoredProc( sp_li_apaga_renum_itens );

          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;

        rbtn_sistema_drawback1.Checked := False;
        rbtn_sistema_drawback2.Checked := False;
        rbtn_sistema_drawback3.Checked := False;

        qry_li_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
        qry_li_.Prepare;
        qry_li_.Open;

        qry_li_itens_.Prepare;
        qry_li_itens_.Open;
        qry_li_itens_.Locate('NR_PROCESSO', str_nr_processo, []);

        if qry_li_itens_.IsEmpty then
        begin
          btn_mi(True, False, False, False, False, False, False);
          dbnvgr_li_itens.Enabled := False;
        end
        else
        begin
          btn_mi(True, False, False, True, True, True, True);
          dbnvgr_li_itens.Enabled := True;
        end;
      end;
    end
  end;
end;

procedure Tfrm_LI_Itens.btn_capa_liClick(Sender: TObject);
begin
  Close;
  frm_LI.i_seletor := 1;
end;

procedure Tfrm_LI_Itens.btn_co_unid_medClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    If Not PoeEmEdicao(datm_LI_itens.qry_li_itens_) Then Exit;
    datm_LI_itens.qry_li_itens_CD_UN_MED_COMERC.AsString := ConsultaOnLineEx('TUNID_MEDIDA_BROKER','Unidade de Medida',['CD_UNID_MEDIDA','NM_UNID_MEDIDA'],['Código','Descrição'],'CD_UNID_MEDIDA',frm_main.mi_cad_unid_medida);
  End
  else
    dbedt_nm_unidade.Text := ConsultaLookUP('TUNID_MEDIDA_BROKER','CD_UNID_MEDIDA',dbedt_cd_unid_comercial.Text,'NM_UNID_MEDIDA');
end;

procedure Tfrm_LI_Itens.btn_co_pais_origemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    If Not PoeEmEdicao(datm_LI_itens.qry_li_itens_) Then Exit;
    datm_LI_itens.qry_li_itens_CD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS','País',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_pais);
  End
  else
    dbedt_nm_pais_origem.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_origem.Text,'DESCRICAO');
end;

procedure Tfrm_LI_Itens.btn_co_pais_aquisicaoClick(Sender: TObject);
begin
  If Sender is TSpeedButton Then
  Begin
    If Not PoeEmEdicao(datm_LI_itens.qry_li_itens_) Then Exit;
    datm_LI_itens.qry_li_itens_CD_PAIS_AQUISICAO.AsString := ConsultaOnLineEx('TPAIS','País',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_pais);
  End
  Else
    dbedt_nm_pais_aquisicao.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_aquisicao.Text,'DESCRICAO');
end;

procedure Tfrm_LI_Itens.btn_co_ncmClick(Sender: TObject);
begin
  If Not PoeEmEdicao(datm_LI_itens.qry_li_itens_) Then Exit;
  datm_LI_itens.qry_li_itens_CD_NCM_SH.AsString := ConsultaOnLineEx('TNCM','NCM/SH',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil)
end;

procedure Tfrm_LI_Itens.btn_co_naladi_shClick(Sender: TObject);
begin
  If Not PoeEmEdicao(datm_LI_itens.qry_li_itens_) Then Exit;
  datm_LI_itens.qry_li_itens_CD_NALADI_SH.AsString := ConsultaOnLineEx('TNALADISH','NALADI',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil)
end;

procedure Tfrm_LI_Itens.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_LI_Itens, datm_LI_Itens );
end;

procedure Tfrm_LI_Itens.btn_co_produtoClick(Sender: TObject);
Var
  vImportador, vGrupo, vFiltro : String;
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_LI_Itens.qry_li_itens_) then
      exit;
      
    vImportador := datm_li_itens.qry_li_CD_IMPORTADOR.AsString;
    vGrupo      := ConsultaLookup('TEMPRESA_NAC', 'CD_EMPRESA', vImportador, 'CD_GRUPO');
    vFiltro := '( ( CD_IMPORTADOR = ''' + vImportador + ''' AND ''' + vImportador + ''' <> '''' ) OR ( CD_GRUPO = ''' + vGrupo + ''' AND ''' + vGrupo + ''' <> '''') )';
    datm_LI_Itens.qry_li_itens_CD_MERCADORIA.AsString := ConsultaOnLineExFiltro('TMERCADORIA','Mercadorias',['CD_MERCADORIA','AP_MERCADORIA', 'CD_NCM_SH', 'CD_AREA', 'CONVERT(DECIMAL(16,2),VL_UNITARIO)'],['Código','Nome', 'NCM', 'Área', 'Valor Unitário'],'CD_MERCADORIA',vFiltro,frm_main.mi_cad_merc)
  end
  else
  begin
    dbedt_nm_mercadoria.Text      := ConsultaLookUP('TMERCADORIA','CD_MERCADORIA',dbedt_cd_mercadoria.Text,'AP_MERCADORIA');

    if (datm_LI_Itens.qry_li_itens_.State in [dsInsert, dsEdit]) then
    begin
      datm_LI_Itens.qry_li_itens_CD_UN_MED_COMERC.AsString := ConsultaLookUP('TMERCADORIA','CD_MERCADORIA',dbedt_cd_mercadoria.Text,'CD_UN_MED_COMERC');
      datm_LI_Itens.qry_li_itens_CD_NCM_SH.AsString        := ConsultaLookUP('TMERCADORIA','CD_MERCADORIA',dbedt_cd_mercadoria.Text,'CD_NCM_SH');
      datm_LI_Itens.qry_li_itens_TX_DESC_DET_MERC.AsString := ConsultaLookUP('TMERCADORIA','CD_MERCADORIA',dbedt_cd_mercadoria.Text,'NM_MERCADORIA');
    end;
  end;
end;

procedure Tfrm_LI_Itens.dbedt_cd_mercadoriaExit(Sender: TObject);
begin
  if (dbedt_cd_mercadoria.Text <> '') and (dbedt_nm_mercadoria.text = '') then
  begin
    BoxMensagem('Mercadoria não cadastrada.', 2);
    dbedt_cd_mercadoria.SetFocus;
  end
  else
  if (dbedt_cd_mercadoria.Text <> '') and (dbedt_nm_mercadoria.text <> '') then
  begin
    if Application.MessageBox('Deseja trazer o fabricante e o país de origem originais do item ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION+mb_DefButton2) = mrYes then
    begin
        if not (datm_LI_Itens.qry_li_itens_.State in [dsEdit]) then
          datm_LI_Itens.qry_li_itens_.Edit;
        datm_LI_Itens.qry_li_itens_CD_FABRICANTE.AsString    := ConsultaLookUP('TMERCADORIA','CD_MERCADORIA',dbedt_cd_mercadoria.Text,'CD_FABRICANTE');
        datm_LI_Itens.qry_li_itens_CD_PAIS_ORIGEM.AsString   := ConsultaLookUP('TMERCADORIA','CD_MERCADORIA',dbedt_cd_mercadoria.Text,'CD_PAIS_ORIGEM');
    end;
  end;

end;

function TFrm_LI_Itens.MercadoriaHabilitada(pImportador : String) : Boolean;
begin
  with TQuery.Create(application) do
  begin
    Result := False;
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT CD_MERCADORIA FROM TMERCADORIA');
    SQL.Add('WHERE  CD_IMPORTADOR = :IMPORTADOR OR CD_GRUPO = (SELECT CD_GRUPO FROM TEMPRESA_NAC WHERE CD_EMPRESA = :IMPORTADOR) OR');
    SQL.Add('       CD_MERCADORIA IN (SELECT CD_MERCADORIA FROM TMERCADORIA_IMPORTADOR WHERE CD_IMPORTADOR = :IMPORTADOR) OR');
    SQL.Add('       CD_MERCADORIA IN (SELECT CD_MERCADORIA FROM TMERCADORIA_GRUPO WHERE CD_GRUPO IN (SELECT CD_GRUPO FROM TEMPRESA_NAC WHERE CD_EMPRESA = :IMPORTADOR))');
    SQL.Add('ORDER BY');
    SQL.Add('CD_MERCADORIA');
    ParamByName('IMPORTADOR').AsString := pImportador;
    Prepare;
    Open;
    if Locate('CD_MERCADORIA',dbedt_cd_mercadoria.Text,[loCaseInsensitive]) then
      Result := True;
    Close;
    Free;
  end;
end;

{var Filter_Grupo : String;
begin
  if Consiste then
  begin
    with datm_LI_Itens do
    begin
      qry_mercadoria_.Close;

      if Not ( tbl_empresa_nac_.Active) then
        tbl_empresa_nac_.Open;
      if tbl_empresa_nac_.FindKey([qry_li_CD_IMPORTADOR.AsString]) then
         Filter_Grupo := tbl_empresa_nac_CD_GRUPO.AsString
      else
         Filter_Grupo := '';

      if Filter_Grupo = '' then
      begin
        if dbedt_cd_mercadoria.Text <> '' then
        begin
          qry_mercadoria_.SQL[3] :=
          'AND CD_IMPORTADOR = "' + qry_li_CD_IMPORTADOR.AsString + '"';
        end
        else
        begin
          qry_mercadoria_.SQL[3] := '';
        end;
      end
      else
      begin
        if dbedt_cd_mercadoria.Text <> '' then
        begin
          qry_mercadoria_.SQL[3] :=
          'AND ( CD_IMPORTADOR = "' + qry_li_CD_IMPORTADOR.AsString + '" OR '+
          'CD_GRUPO = "' + Filter_Grupo + '")';
        end
        else
        begin
          qry_mercadoria_.SQL[3] := '';
        end;
      end;

      if dbedt_cd_mercadoria.Text <> '' then
      begin
        qry_mercadoria_.ParamByName('CD_MERCADORIA').AsString := dbedt_cd_mercadoria.Text;
        qry_mercadoria_.Prepare;
        qry_mercadoria_.Open;

        if qry_mercadoria_.EOF then
        begin
          BoxMensagem('Mercadoria não cadastrada para este cliente!', 2);
          ActiveControl.SetFocus;
        end
        else
        begin
          if Not ( frm_li.in_montada) then
          begin
            if ( Trim( qry_li_itens_TX_DESC_DET_MERC.AsString ) = '' ) and
               ( Trim( qry_mercadoria_NM_MERCADORIA.AsString ) <> '' ) then
            begin
              if Not ( qry_li_itens_.State in [dsInsert, dsEdit]) then qry_li_itens_.Edit;
              qry_li_itens_TX_DESC_DET_MERC.AsString := qry_mercadoria_NM_MERCADORIA.AsString;
            end;

            if qry_li_itens_VL_UNIT_MLE.AsFloat = 0 then
            begin
              if Not ( qry_li_itens_.State in [dsInsert, dsEdit]) then qry_li_itens_.Edit;
              qry_li_itens_VL_UNIT_MLE.AsFloat := qry_mercadoria_VL_UNITARIO.AsFloat;
            end;

            if ( qry_li_itens_PL_MERCADORIA.AsFloat = 0 ) and
               ( qry_li_itens_QT_MERC_UN_COMERC.AsFloat > 0 ) then
            begin
              if Not ( qry_li_itens_.State in [dsInsert, dsEdit]) then qry_li_itens_.Edit;
              qry_li_itens_PL_MERCADORIA.AsFloat := Arredondar( qry_li_itens_QT_MERC_UN_COMERC.AsFloat *
                                                                qry_mercadoria_PL_MERCADORIA.AsFloat, 2 ); //qtde * peso unitario
            end;

            if qry_li_itens_VL_TOTAL_MLE.AsFloat = 0 then
            begin
              if Not ( qry_li_itens_.State in [dsInsert, dsEdit]) then qry_li_itens_.Edit;
              qry_li_itens_VL_TOTAL_MLE.AsFloat := ( qry_mercadoria_VL_UNITARIO.AsFloat *
                                                     qry_li_itens_QT_MERC_UN_COMERC.AsFloat );
            end;

            if ( Trim( qry_li_itens_CD_UN_MED_COMERC.AsString ) = '' ) and
               ( Trim( qry_mercadoria_CD_UN_MED_COMERC.AsString ) <> '' ) then
            begin
              if Not ( qry_li_itens_.State in [dsInsert, dsEdit]) then qry_li_itens_.Edit;
              qry_li_itens_CD_UN_MED_COMERC.AsString := qry_mercadoria_CD_UN_MED_COMERC.AsString;
            end;

            if ( Trim( qry_li_itens_CD_NCM_SH.AsString ) = '' ) and
               ( Trim( qry_mercadoria_CD_NCM_SH.AsString ) <> '' ) then
            begin
              if Not ( qry_li_itens_.State in [dsInsert, dsEdit]) then qry_li_itens_.Edit;
              qry_li_itens_CD_NCM_SH.AsString := qry_mercadoria_CD_NCM_SH.AsString;
            end;

            if ( Trim( qry_li_itens_CD_NALADI_SH.AsString ) = '' ) and
               ( Trim( qry_mercadoria_CD_NALADI_SH.AsString ) <> '' ) then
            begin
              if Not ( qry_li_itens_.State in [dsInsert, dsEdit]) then qry_li_itens_.Edit;
              qry_li_itens_CD_NALADI_SH.AsString := qry_mercadoria_CD_NALADI_SH.AsString;
            end;

            if ( Trim( qry_li_itens_CD_EXPORTADOR.AsString ) = '' ) and
               ( Trim( qry_mercadoria_CD_EXPORTADOR.AsString ) <> '' ) then
            begin
              if Not ( qry_li_itens_.State in [dsInsert, dsEdit]) then qry_li_itens_.Edit;
              qry_li_itens_CD_EXPORTADOR.AsString := qry_mercadoria_CD_EXPORTADOR.AsString;
            end;

            if ( Trim( qry_li_itens_CD_PAIS_AQUISICAO.AsString ) = '' ) and
               ( Trim( qry_mercadoria_CD_PAIS_AQUISICAO.AsString ) <> '' ) then
            begin
              if Not ( qry_li_itens_.State in [dsInsert, dsEdit]) then qry_li_itens_.Edit;
              qry_li_itens_CD_PAIS_AQUISICAO.AsString := qry_mercadoria_CD_PAIS_AQUISICAO.AsString;
            end;

            if ( Trim( qry_li_itens_CD_PAIS_ORIGEM.AsString ) = '' ) and
               ( Trim( qry_mercadoria_CD_PAIS_ORIGEM.AsString ) <> '' ) then
            begin
              if Not ( qry_li_itens_.State in [dsInsert, dsEdit]) then qry_li_itens_.Edit;
              qry_li_itens_CD_PAIS_ORIGEM.AsString := qry_mercadoria_CD_PAIS_ORIGEM.AsString;
            end;

            if ( Trim( qry_li_itens_CD_FABR_EXPO.AsString ) = '' ) and
               ( Trim( qry_mercadoria_CD_FABR_EXPO.AsString ) <> '' ) then
            begin
              if Not ( qry_li_itens_.State in [dsInsert, dsEdit]) then qry_li_itens_.Edit;
              qry_li_itens_CD_FABR_EXPO.AsString := qry_mercadoria_CD_FABR_EXPO.AsString;
            end;

            if qry_li_itens_CD_FABR_EXPO.AsString = '2' then
            begin
              if Not ( qry_li_itens_.State in [dsInsert, dsEdit]) then qry_li_itens_.Edit;
              if qry_li_itens_CD_FABRICANTE.AsString = '' then
                 qry_li_itens_CD_FABRICANTE.AsString := qry_mercadoria_CD_FABRICANTE.AsString;
            end;

            Copia_NVE;

          end;
        end;
        qry_mercadoria_.Close;
      end;
    end;
  end;
end;
}
procedure Tfrm_LI_Itens.btn_duplicaClick(Sender: TObject);
var
  NR_PROCESSO          :string [18];
  NR_DESTAQUE_NCM      :string [3];
  CD_IMPORTADOR        :string [5];
  CD_EXPORTADOR        :string [5];
  CD_FABR_EXPO         :string [1];
  CD_FABRICANTE        :string [5];
  CD_MERCADORIA        :string [30];
  CD_NALADI_SH         :string [8];
  CD_NCM_SH            :string [11];
  CD_PAIS_AQUISICAO    :string [3];
  CD_PAIS_ORIGEM       :string [3];
  CD_PAIS_PROCEDENCIA  :string [3];
  CD_UN_MED_COMERC     :string [3];
  CD_UN_MED_ESTAT      :string [3];
  NR_ITEM              :string [3];
  CD_REG_TRIB          :string [1];
  CD_FUND_LEGAL        :string [2];
  NR_ATO_DRAWBACK      :string [13];
  IN_DRAWBACK_AUTO     :string [1];
  NR_ITEM_DRAWBACK     :string [3];

  TX_DESC_DET_MERC     :AnsiString;

  PL_MERCADORIA, QT_MERC_UN_COMERC, QT_MERC_UN_ESTAT, VL_UNIT_MLE, VL_TOTAL_MLE, VL_UNIT_MCV, QT_PRODUTO_DRAWBACK, VL_PRODUTO_DRAWBACK : Double;

  no_tot_item : String[3];

  j : Integer;
begin
  try
    datm_main.db_broker.StartTransaction;                   // Inicializou transacao

    with datm_LI_Itens do
    begin
      NR_PROCESSO         := qry_LI_itens_NR_PROCESSO.AsString;
      NR_DESTAQUE_NCM     := qry_LI_itens_NR_DESTAQUE_NCM.AsString;
      CD_IMPORTADOR       := qry_LI_itens_CD_IMPORTADOR.AsString;
      CD_EXPORTADOR       := qry_LI_itens_CD_EXPORTADOR.AsString;
      CD_FABR_EXPO        := qry_LI_itens_CD_FABR_EXPO.AsString;
      CD_FABRICANTE       := qry_LI_itens_CD_FABRICANTE.AsString;
      CD_MERCADORIA       := qry_LI_itens_CD_MERCADORIA.AsString;
      CD_NALADI_SH        := qry_LI_itens_CD_NALADI_SH.AsString;
      CD_NCM_SH           := qry_LI_itens_CD_NCM_SH.AsString;
      CD_PAIS_AQUISICAO   := qry_LI_itens_CD_PAIS_AQUISICAO.AsString;
      CD_PAIS_ORIGEM      := qry_LI_itens_CD_PAIS_ORIGEM.AsString;
      CD_PAIS_PROCEDENCIA := qry_LI_itens_CD_PAIS_PROCEDENCIA.AsString;
      CD_UN_MED_COMERC    := qry_LI_itens_CD_UN_MED_COMERC.AsString;
      CD_UN_MED_ESTAT     := qry_LI_itens_CD_UN_MED_ESTAT.AsString;
      PL_MERCADORIA       := qry_LI_itens_PL_MERCADORIA.AsFloat;
      QT_MERC_UN_COMERC   := qry_LI_itens_QT_MERC_UN_COMERC.AsFloat;
      QT_MERC_UN_ESTAT    := qry_LI_itens_QT_MERC_UN_ESTAT.AsFloat;
      TX_DESC_DET_MERC    := qry_LI_itens_TX_DESC_DET_MERC.AsString;
      VL_UNIT_MLE         := qry_LI_itens_VL_UNIT_MLE.AsFloat;
      VL_TOTAL_MLE        := qry_LI_itens_VL_TOTAL_MLE.AsFloat;
      VL_UNIT_MCV         := qry_LI_itens_VL_UNIT_MCV.AsFloat;
      NR_ITEM             := qry_li_itens_NR_ITEM.AsString;
      CD_REG_TRIB         := qry_li_itens_CD_REGIME_TRIBUTACAO.AsString;
      CD_FUND_LEGAL       := qry_li_itens_CD_FUND_LEGAL.AsString;
      NR_ATO_DRAWBACK     := qry_li_itens_NR_ATO_DRAWBACK.AsString;
      IN_DRAWBACK_AUTO    := qry_li_itens_IN_DRAWBACK_AUTOMATICO.AsString;
      NR_ITEM_DRAWBACK    := qry_li_itens_NR_ITEM_DRAWBACK.AsString;
      QT_PRODUTO_DRAWBACK := qry_li_itens_QT_PRODUTO_DRAWBACK.AsFloat;
      VL_PRODUTO_DRAWBACK := qry_li_itens_VL_PRODUTO_DRAWBACK.AsFloat;

      qry_li_itens_.Append;

      qry_LI_itens_NR_PROCESSO.AsString            := NR_PROCESSO;
      qry_LI_itens_NR_DESTAQUE_NCM.AsString        := NR_DESTAQUE_NCM;
      qry_LI_itens_CD_IMPORTADOR.AsString          := CD_IMPORTADOR;
      qry_LI_itens_CD_EXPORTADOR.AsString          := CD_EXPORTADOR;
      qry_LI_itens_CD_FABR_EXPO.AsString           := CD_FABR_EXPO;
      qry_LI_itens_CD_FABRICANTE.AsString          := CD_FABRICANTE;
      qry_LI_itens_CD_MERCADORIA.AsString          := CD_MERCADORIA;
      qry_LI_itens_CD_NALADI_SH.AsString           := CD_NALADI_SH;
      qry_LI_itens_CD_NCM_SH.AsString              := CD_NCM_SH;
      qry_LI_itens_CD_PAIS_AQUISICAO.AsString      := CD_PAIS_AQUISICAO;
      qry_LI_itens_CD_PAIS_ORIGEM.AsString         := CD_PAIS_ORIGEM;
      qry_LI_itens_CD_PAIS_PROCEDENCIA.AsString    := CD_PAIS_PROCEDENCIA;
      qry_LI_itens_CD_UN_MED_COMERC.AsString       := CD_UN_MED_COMERC;
      qry_LI_itens_CD_UN_MED_ESTAT.AsString        := CD_UN_MED_ESTAT;
      qry_LI_itens_PL_MERCADORIA.AsFloat           := PL_MERCADORIA;
      qry_LI_itens_QT_MERC_UN_COMERC.AsFloat       := QT_MERC_UN_COMERC;
      qry_LI_itens_QT_MERC_UN_ESTAT.AsFloat        := QT_MERC_UN_ESTAT;
      qry_LI_itens_TX_DESC_DET_MERC.AsString       := TX_DESC_DET_MERC;
      qry_LI_itens_VL_UNIT_MLE.AsFloat             := VL_UNIT_MLE;
      qry_LI_itens_VL_TOTAL_MLE.AsFloat            := VL_TOTAL_MLE;
      qry_LI_itens_VL_UNIT_MCV.AsFloat             := VL_UNIT_MCV;
      qry_li_itens_CD_REGIME_TRIBUTACAO.AsString   := CD_REG_TRIB;
      qry_li_itens_CD_FUND_LEGAL.AsString          := CD_FUND_LEGAL;
      qry_li_itens_NR_ATO_DRAWBACK.AsString        := NR_ATO_DRAWBACK;
      qry_li_itens_IN_DRAWBACK_AUTOMATICO.AsString := IN_DRAWBACK_AUTO;
      qry_li_itens_NR_ITEM_DRAWBACK.AsString       := NR_ITEM_DRAWBACK;
      qry_li_itens_QT_PRODUTO_DRAWBACK.AsFloat     := QT_PRODUTO_DRAWBACK;
      qry_li_itens_VL_PRODUTO_DRAWBACK.AsFloat     := VL_PRODUTO_DRAWBACK;

      no_tot_item := qry_li_QT_TOTAL_ITEM.AsString;

      j := StrToInt( no_tot_item ) + 1;
      no_tot_item := StrZero( j, 3 );

      qry_li_.Edit;
      qry_li_QT_TOTAL_ITEM.AsString := no_tot_item;
      qry_li_itens_NR_ITEM.AsString := no_tot_item;

      qry_li_.Post;
      qry_li_itens_.Post;

      qry_li_.Close;
      qry_li_itens_.Close;
      qry_li_nve_.Close;

      CloseStoredProc( sp_li_dupl_nve );

      sp_li_dupl_nve.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
      sp_li_dupl_nve.ParamByName('@NR_ITEM').AsString     := nr_item;
      sp_li_dupl_nve.ParamByName('@NR_ITEM_NEW').AsString := no_tot_item;

      ExecStoredProc( sp_li_dupl_nve );
      CloseStoredProc( sp_li_dupl_nve );

      qry_LI_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
      qry_LI_.Prepare;
      qry_LI_.Open;

      qry_LI_Itens_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
      qry_LI_Itens_.Prepare;
      qry_LI_Itens_.Open;
      qry_LI_Itens_.Locate('NR_PROCESSO;NR_ITEM', VarArrayOf ([str_nr_processo, no_tot_item]), [loCaseInsensitive]);

      datm_main.db_broker.Commit;
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  if datm_LI_Itens.qry_li_itens_.IsEmpty then
  begin
    btn_mi(True, False, False, False, False, False, False);
    dbnvgr_li_itens.Enabled := False;
  end
  else
  begin
    btn_mi(True, False, False, True, True, True, True);
    dbnvgr_li_itens.Enabled := True;
  end;
end;

procedure Tfrm_LI_Itens.dbedt_cd_unid_comercialExit(Sender: TObject);
begin
  CodExits;
end;

function Tfrm_LI_Itens.Consiste : Boolean;
var
  str_cd_ncm_c8 : String[8];
begin
  Consiste := True;
  with datm_LI_Itens do
  begin
    if qry_li_itens_.State in [dsInsert, dsEdit] then
    begin
      {Mercadoria}
      if dbedt_cd_mercadoria.Text <> '' then
        if Trim( dbedt_nm_mercadoria.Text ) = '' then
        begin
          MessageDlg('Código da Mercadoria inválido !',mtError,[mbOK],0);
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_mercadoria.SetFocus;
          Consiste := False;
          Exit;
        end;

      {Unidade Medida}
      ValidCodigo( dbedt_cd_unid_comercial );
      if dbedt_cd_unid_comercial.Text <> '' then
        if Trim( dbedt_nm_unidade.Text ) = '' then
        begin
          BoxMensagem('Código da Unidade de Medida inválido !',2);
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_unid_comercial.SetFocus;
          Consiste := False;
          Exit;
        end;

      { NCM }
      if tbl_ncm_.FindKey([ qry_li_itens_CD_NCM_SH.AsString ]) then
         if qry_unid_medida_.Locate('CD_UNID_MEDIDA', tbl_ncm_UNIDADE_MEDIDA.AsString, []) then
            edt_unid_med_estat.Text := qry_unid_medida_NM_UNID_MEDIDA.AsString;

      str_cd_ncm_c8 := Copy( qry_li_itens_CD_NCM_SH.AsString, 1, 8 );
      if ( Trim( str_cd_ncm_c8 ) <> '' ) and
         ( Not tbl_ncm_UNIDADE_MEDIDA.IsNull ) and
         ( Not qry_li_itens_CD_UN_MED_COMERC.IsNull ) then
      begin
        // Bloco abaixo comentado por Michel para manter o valor digitado em qry_li_itens_QT_MERC_UN_ESTAT - 31/10/2008
        {//Rodrigo Capra  -  12/06/2008  -  Linhas debaixo comentadas por mim tb.
        if ( edt_unid_med_estat.Text = 'QUILOGRAMA LIQUIDO' ) or ( dbedt_nm_unidade.Text = 'KG') then
          qry_li_itens_QT_MERC_UN_ESTAT.AsFloat := StrToFloat(TiraPonto(dbedt_qt_mercadoria.Text))
        else
          qry_li_itens_QT_MERC_UN_ESTAT.AsFloat := 0;

{        if ( edt_unid_med_estat.Text = 'QUILOGRAMA LIQUIDO' ) or ( edt_unid_med_estat.Text <> dbedt_nm_unidade.Text ) or
           ( dbedt_nm_unidade.Text = 'KG') then
          qry_li_itens_QT_MERC_UN_ESTAT.AsFloat := StrToFloat( TiraPonto(dbedt_peso_liq.Text) )
        else
          qry_li_itens_QT_MERC_UN_ESTAT.AsFloat := StrToFloat( TiraPonto(dbedt_qt_mercadoria.Text) ); }
      end;

      {Regime Tributação}
      ValidCodigo( dbedt_cd_regime_tributacao );
      if dbedt_cd_regime_tributacao.Text <> '' then
        if Trim( dbedt_nm_regime_tributacao.Text ) = '' then
        begin
          BoxMensagem('Código do Regime de Tributação inválido!',2);
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_regime_tributacao.SetFocus;
          Consiste := False;
          Exit;
        end;

      {Fundamento Legal} {
      qry_fund_legal_.Close;
      qry_fund_legal_.ParamByName('CD_REGIME_TRIB').AsString := dbedt_cd_regime_tributacao.Text;
      qry_fund_legal_.Prepare;
      qry_fund_legal_.Open;
      }
      ValidCodigo( dbedt_cd_fund_legal );
      if dbedt_cd_fund_legal.Text <> '' then
        if ( Trim( dbedt_nm_fund_legal.Text ) = '' ) and ( Trim(dbedt_nm_regime_tributacao.Text) = '' ) then
        begin
          BoxMensagem('Código do Fundamento Legal inválido!',2);
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_fund_legal.SetFocus;
          Consiste := False;
          Exit;
        end;

      {Exportador}
      ValidCodigo( dbedt_cd_exportador );
      if dbedt_cd_exportador.Text <> '' then
        if Trim( dbedt_nm_exportador.Text ) = '' then
        begin
          BoxMensagem('Código do Fornecedor inválido !',2);
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_exportador.SetFocus;
          Consiste := False;
          Exit;
        end;

      {Pais de Aquisicao}
      ValidCodigo( dbedt_cd_pais_aquisicao );
      if dbedt_cd_pais_aquisicao.Text <> '' then
        if Trim( dbedt_nm_pais_aquisicao.Text ) = '' then
        begin
          BoxMensagem('Código do País de Aquisição inválido !',2);
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_pais_aquisicao.SetFocus;
          Consiste := False;
          Exit;
        end;

      {Fabricante}
      ValidCodigo( dbedt_cd_fabricante );
      if dbedt_cd_fabricante.Text <> '' then
        if ( Trim( dbedt_nm_fabricante.Text ) = '' ) and ( dbrgrp_fabr_expo.ItemIndex = 1 ) then
        begin
          BoxMensagem('Código do Fabricante / Produtor inválido !',2);
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_fabricante.SetFocus;
          Consiste := False;
          Exit;
        end;

      {Pais de Origem}
      ValidCodigo( dbedt_cd_pais_origem );
      if dbedt_cd_pais_origem.Text <> '' then
        if ( Trim( dbedt_nm_pais_origem.Text ) = '' ) and ( dbrgrp_fabr_expo.ItemIndex = 1 ) then
        begin
          BoxMensagem('Código do País de Origem inválido !',2);
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_pais_origem.SetFocus;
          Consiste := False;
          Exit;
        end;
    end;
  end;
end;

procedure Tfrm_LI_itens.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_LI_Itens.dbedt_nm_unidadeExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_Itens.dbedt_nm_mercadoriaExit(Sender: TObject);
begin
  CodExits;
end;

function Tfrm_LI_itens.VerAlt;
begin
  VerAlt := True;

  if pgctrl_Item.ActivePage = ts_item1 then
  begin
    if ( datm_LI_Itens.qry_li_itens_.State in [dsInsert, dsEdit] ) and ( not frm_LI.in_montada ) then
    begin
      if BoxMensagem('O Item da LI foi alterado! ' + #13#10 +
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
    end
  end;
end;

procedure Tfrm_LI_Itens.Cancelar;
begin
  with datm_LI_Itens do
  begin
    if qry_li_.State       in [dsEdit,dsInsert] then qry_li_.Cancel;
    if qry_li_itens_.State in [dsEdit,dsInsert] then qry_li_itens_.Cancel;
    if qry_li_nve_.State   in [dsEdit,dsInsert] then qry_li_nve_.Cancel;
    dbnvgr_li_itens.Enabled := True;
    if datm_main.db_broker.InTransaction then
      datm_main.db_broker.Rollback;
    FormShow(nil);
    qry_li_itens_.Locate('NR_PROCESSO;NR_ITEM', VarArrayOf ([str_nr_processo, nr_item]), [loCaseInsensitive]);
  end;
end;

procedure Tfrm_LI_Itens.dbedt_cd_exportadorExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_Itens.dbedt_cd_fabricanteExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_Itens.dbedt_cd_pais_aquisicaoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_Itens.dbedt_cd_pais_origemExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_Itens.btn_co_exportadorClick(Sender: TObject);
var
  vSqlTxt : string;
begin
  if Sender is TSpeedButton then
  Begin
    If Not PoeEmEdicao(datm_LI_itens.qry_li_itens_) Then Exit;
    vSqlTxt := 'SELECT CD_EMPRESA, NM_EMPRESA, END_EMPRESA, ' +
               '  ( SELECT DESCRICAO FROM TPAIS ( NOLOCK ) WHERE CODIGO = TEMPRESA_EST.CD_PAIS ) AS NM_PAIS ' +
               'FROM TEMPRESA_EST ( NOLOCK )';
    datm_LI_itens.qry_li_itens_CD_EXPORTADOR.AsString :=
        ConsultaOnLineExSQL(vSqlTxt,'Empresa',['CD_EMPRESA','NM_EMPRESA','END_EMPRESA','NM_PAIS'],['Código','Descrição','Endereço','País'],'CD_EMPRESA',frm_main.mi_cad_emp_est);
  End
  Else
  Begin
    dbedt_nm_exportador.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',dbedt_cd_exportador.Text,'NM_EMPRESA');
    If datm_LI_itens.qry_li_itens_.State in [dsEdit, dsInsert] Then
    Begin
      If datm_LI_itens.tbl_empresa_est_.FindKey([ dbedt_cd_exportador.Text ]) Then
        datm_LI_itens.qry_li_itens_CD_PAIS_AQUISICAO.AsString := datm_LI_itens.tbl_empresa_est_CD_PAIS.AsString;
    End;
  End;
end;

procedure Tfrm_LI_Itens.btn_co_fabricanteClick(Sender: TObject);
var
  vSqlTxt : string;
begin
  if Sender is TSpeedButton then
  Begin
    If Not PoeEmEdicao(datm_LI_itens.qry_li_itens_) Then Exit;
    vSqlTxt := 'SELECT CD_EMPRESA, NM_EMPRESA, END_EMPRESA, ' +
               '  ( SELECT DESCRICAO FROM TPAIS ( NOLOCK ) WHERE CODIGO = TEMPRESA_EST.CD_PAIS ) AS NM_PAIS ' +
               'FROM TEMPRESA_EST ( NOLOCK )';
    datm_LI_itens.qry_li_itens_CD_FABRICANTE.AsString :=
        ConsultaOnLineExSQL(vSqlTxt,'Fabricante',['CD_EMPRESA','NM_EMPRESA','END_EMPRESA','NM_PAIS'],['Código','Descrição','Endereço','País'],'CD_EMPRESA',frm_main.mi_cad_emp_est);
  end
  else
  Begin
    dbedt_nm_fabricante.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',dbedt_cd_fabricante.Text,'NM_EMPRESA');
    If datm_LI_itens.qry_li_itens_.State in [dsEdit, dsInsert] Then
    Begin
      If datm_LI_itens.tbl_empresa_est_.FindKey([ dbedt_cd_fabricante.Text ]) Then
        datm_LI_itens.qry_li_itens_CD_PAIS_ORIGEM.AsString := datm_LI_itens.tbl_empresa_est_CD_PAIS.AsString;
    End;
  End;
end;

procedure Tfrm_LI_Itens.dbedt_cd_naladi_shExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_Itens.Habilita_Entrada;
var
  i : integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if ( Components[i] is TSpeedButton ) then
      TSpeedButton( Components[i] ).Enabled  := True;
    if ( Components[i] is TDBEdit ) then
      TDBEdit( Components[i] ).Enabled       := True;
    if ( Components[i] is TDBRadioGroup ) then
      TDBRadioGroup( Components[i] ).Enabled := True;
    if ( Components[i] is TRadioButton ) then
      TRadioButton( Components[i] ).Enabled  := True;
    if ( Components[i] is TDBMemo ) then
      TDBMemo( Components[i] ).Enabled       := True;
    if ( Components[i] is TDBCheckBox ) then
      TDBCheckBox( Components[i] ).Enabled   := True;
  end;
  btn_trans_LI.Enabled := (datm_LI_Itens.qry_li_IN_MONTADA.AsString = '1') and (not (datm_LI_Itens.qry_li_itens_.State in [dsEdit, dsInsert]));
end;

procedure Tfrm_LI_Itens.Desabilita_Entrada;
var
  i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TSpeedButton ) then
      TSpeedButton( Components[i] ).Enabled  := False;
    if ( Components[i] is TDBEdit ) then
      TDBEdit( Components[i] ).Enabled       := False;
    if ( Components[i] is TDBRadioGroup ) then
      TDBRadioGroup( Components[i] ).Enabled := False;
    if ( Components[i] is TRadioButton ) then
      TRadioButton( Components[i] ).Enabled  := False;
    if ( Components[i] is TDBMemo ) then
      TDBMemo( Components[i] ).Enabled       := False;
    if ( Components[i] is TDBCheckBox ) then
      TDBCheckBox( Components[i] ).Enabled   := False;
  end;
  btn_trans_LI.Enabled := (datm_LI_Itens.qry_li_IN_MONTADA.AsString = '1') and (not (datm_LI_Itens.qry_li_itens_.State in [dsEdit, dsInsert]));
end;

procedure Tfrm_LI_Itens.dbedt_peso_liqEnter(Sender: TObject);
begin
  with datm_LI_Itens do
  begin
    if ( qry_li_itens_PL_MERCADORIA.AsFloat = 0) then
    begin
      if Not ( qry_li_itens_.State in [dsInsert, dsEdit] ) then
        qry_li_itens_.Edit;
      if ( dbedt_nm_unidade.Text = 'QUILOGRAMA LIQUIDO' ) and ( edt_unid_med_estat.Text = 'QUILOGRAMA LIQUIDO' ) then
        qry_li_itens_PL_MERCADORIA.AsFloat := qry_li_itens_QT_MERC_UN_COMERC.AsFloat
      else if edt_unid_med_estat.Text = 'QUILOGRAMA LIQUIDO' then
        qry_li_itens_PL_MERCADORIA.AsFloat := qry_li_itens_QT_MERC_UN_ESTAT.AsFloat;
    end;
  end;
end;

procedure Tfrm_LI_Itens.dbedt_vl_itemEnter(Sender: TObject);
begin
  with datm_LI_Itens do
  begin
    if qry_li_itens_.state in [dsInsert, dsEdit] then
      qry_li_itens_VL_TOTAL_MLE.AsFloat := Arredondar( qry_li_itens_QT_MERC_UN_COMERC.AsFloat * qry_li_itens_VL_UNIT_MLE.AsFloat, 5 );
  end;
end;

procedure Tfrm_LI_Itens.dbrgrp_fabr_expoChange(Sender: TObject);
begin
  case dbrgrp_fabr_expo.ItemIndex of
    0:
    begin
      if datm_LI_Itens.qry_li_itens_.State in [dsEdit,dsInsert] then
      begin
        datm_LI_Itens.qry_li_itens_CD_FABRICANTE.AsString  := '';
        datm_LI_Itens.qry_li_itens_CD_PAIS_ORIGEM.AsString := '';
      end;
      dbedt_cd_fabricante.ReadOnly  := True;
      dbedt_cd_fabricante.Color     := clMenu;
      dbedt_cd_fabricante.TabStop   := False;
      btn_co_fabricante.Enabled     := False;
      dbedt_cd_pais_origem.ReadOnly := True;
      dbedt_cd_pais_origem.Color    := clMenu;
      dbedt_cd_pais_origem.TabStop  := False;
      btn_co_pais_origem.Enabled    := False;
    end;
    1:
    begin
      dbedt_cd_fabricante.ReadOnly  := False;
      dbedt_cd_fabricante.color     := clWindow;
      dbedt_cd_fabricante.TabStop   := True;
      btn_co_fabricante.Enabled     := True;
      dbedt_cd_pais_origem.ReadOnly := False;
      dbedt_cd_pais_origem.Color    := clWindow;
      dbedt_cd_pais_origem.TabStop  := True;
      btn_co_pais_origem.Enabled    := True;
    end;
    2:
    begin
      if datm_LI_Itens.qry_li_itens_.State in [dsEdit,dsInsert] then
      begin
        datm_LI_Itens.qry_li_itens_CD_FABRICANTE.AsString  := '';
        datm_LI_Itens.qry_li_itens_CD_PAIS_ORIGEM.AsString := '';
      end;
      dbedt_cd_fabricante.ReadOnly  := True;
      dbedt_cd_fabricante.color     := clMenu;
      dbedt_cd_fabricante.TabStop   := False;
      btn_co_fabricante.Enabled     := False;
      dbedt_cd_pais_origem.ReadOnly := False;
      dbedt_cd_pais_origem.Color    := clWindow;
      dbedt_cd_pais_origem.TabStop  := True;
      btn_co_pais_origem.Enabled    := True;
    end;
  end;
end;

procedure Tfrm_LI_Itens.dbm_descricao_mercadoriaExit(Sender: TObject);
begin
  if dbrgrp_fabr_expo.ItemIndex = -1 then
    dbrgrp_fabr_expo.ItemIndex := 0;
end;

procedure Tfrm_LI_Itens.dbedt_cd_mercadoriaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = dbedt_cd_mercadoria        then btn_co_produtoClick(btn_co_produto);
    if Sender = dbedt_cd_unid_comercial    then btn_co_unid_medClick(btn_co_unid_med);
    if Sender = dbedt_cd_ncm               then btn_co_ncmClick(btn_co_ncm);
    if Sender = dbedt_cd_naladi_sh         then btn_co_naladi_shClick(btn_co_naladi_sh);
    if Sender = dbedt_cd_exportador        then btn_co_exportadorClick(btn_co_exportador);
    if Sender = dbedt_cd_fabricante        then btn_co_fabricanteClick(btn_co_fabricante);
    if Sender = dbedt_cd_pais_origem       then btn_co_pais_origemClick(btn_co_pais_origem);
    if Sender = dbedt_cd_pais_aquisicao    then btn_co_pais_aquisicaoClick(btn_co_pais_aquisicao);
    if Sender = dbedt_cd_regime_tributacao then btn_co_regime_tributacaoClick(btn_co_regime_tributacao);
    if Sender = dbedt_cd_fund_legal        then btn_co_fund_legalClick(btn_co_fund_legal);
  end;
end;

procedure Tfrm_LI_Itens.dbedt_qt_mercadoriaChange(Sender: TObject);
begin
{  with datm_LI_Itens do
  begin
    if not (qry_li_itens_QT_MERC_UN_COMERC.IsNull) then
      if not (qry_li_itens_VL_UNIT_MLE.IsNull) then
        if qry_li_itens_.State in [dsEdit,dsInsert] then
          if Arredondar( qry_li_itens_QT_MERC_UN_COMERC.AsFloat *
                         qry_li_itens_VL_UNIT_MLE.AsFloat, 2 ) <> qry_li_itens_VL_TOTAL_MLE.AsFloat then
            qry_li_itens_VL_TOTAL_MLE.AsFloat :=
                Arredondar( qry_li_itens_QT_MERC_UN_COMERC.AsFloat *
                            qry_li_itens_VL_UNIT_MLE.AsFloat, 2 );
  end;}
end;

procedure Tfrm_LI_Itens.btn_monta_liClick(Sender: TObject);
var
  nNum, Code : Integer;
  nr_item : String;
begin
  Verifica_Capa; {esta função esta com os comandos desabilitados}

  if ( frm_LI.in_montada ) then
  begin
    BoxMensagem( 'LI já está montada !', 3 );
    Exit;
  end;

  with datm_LI_Itens do
  begin
    Val( qry_li_QT_TOTAL_ITEM.AsString, nNum, Code );

    if ( qry_li_QT_TOTAL_ITEM.IsNull ) or ( nNum = 0) then
    begin
      BoxMensagem( 'LI não possui itens !', 3 );
      Exit;
    end;

    if BoxMensagem( 'Deseja montar LI ?', 1 ) then
    begin
      nr_item := qry_li_itens_NR_ITEM.AsString;
      qry_li_itens_.Close;
      qry_li_.Close;

      try
        datm_main.db_broker.StartTransaction;

        CloseStoredProc( sp_li_monta_li );
        sp_li_monta_li.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        ExecStoredProc( sp_li_monta_li );
        case sp_li_monta_li.ParamByName('Result').AsInteger of
          1: begin
               if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
               BoxMensagem('Valor Total da Mercadoria diferente!', 2);
               datm_LI_Itens.qry_li_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
               datm_LI_Itens.qry_li_.Prepare;
               datm_LI_Itens.qry_li_.Open;
               datm_LI_Itens.qry_li_itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
               datm_LI_Itens.qry_li_itens_.Prepare;
               datm_LI_Itens.qry_li_itens_.Open;
               Exit;
             end;
          2: begin
               if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
               BoxMensagem('Total do Peso Liquido é diferente !', 2);
               datm_LI_Itens.qry_li_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
               datm_LI_Itens.qry_li_.Prepare;
               datm_LI_Itens.qry_li_.Open;
               datm_LI_Itens.qry_li_itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
               datm_LI_Itens.qry_li_itens_.Prepare;
               datm_LI_Itens.qry_li_itens_.Open;
               Exit;
             end;
          3: begin
               if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
               BoxMensagem('Total da Quantidade é diferente!', 2);
               datm_LI_Itens.qry_li_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
               datm_LI_Itens.qry_li_.Prepare;
               datm_LI_Itens.qry_li_.Open;
               datm_LI_Itens.qry_li_itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
               datm_LI_Itens.qry_li_itens_.Prepare;
               datm_LI_Itens.qry_li_itens_.Open;
               Exit;
             end;
        end;
        CloseStoredProc( sp_li_monta_li );
        datm_main.db_broker.Commit;

        frm_LI.in_montada   := True;
        frm_LI.in_atualizar := True;

        btn_sairClick(nil);

        frm_LI.msk_nr_processoExit(nil);
      Except
         on E: Exception do
         begin
           if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
           TrataErro(E);
         end;
      end;
    end;
  end;
end;

procedure Tfrm_LI_Itens.Verifica_Capa;
{
var
  nValor_Total, nPeso_Liq, nQtde : Double;}

begin
{  nValor_Total  := 0;
  nPeso_Liq     := 0;
  nQtde         := 0;}

  if Not( frm_LI.in_montada ) then
  begin

    with datm_LI_Itens do
    begin
      if (btn_salvar.Enabled) and (btn_cancelar.Enabled) then Exit;

      {
      if qry_li_itens_.RecordCount > 0 then
      begin

        qry_li_itens_.First;

        while not (qry_li_itens_.EOF) and
              (qry_li_itens_NR_PROCESSO.AsString = str_nr_processo) do
        begin
          nValor_Total := nValor_Total + qry_li_itens_VL_TOTAL_MLE.AsFloat;
          nPeso_Liq    := nPeso_Liq + qry_li_itens_PL_MERCADORIA.AsFloat;
          nQtde        := nQtde + qry_li_itens_QT_MERC_UN_COMERC.AsFloat;

          qry_li_itens_.Next;
        end;

        if nValor_total <> datm_LI_Itens.qry_li_VL_TOTAL_MOEDA.AsFloat then
        begin
          if qry_li_VL_TOTAL_MOEDA.AsFloat <> 0 then
          begin
            if BoxMensagem( 'Valor Total da Mercadoria diferente !' + #13+#10 + 'Repassa os valores para Capa ?', 1 ) then
            begin
              qry_li_.Edit;
              qry_li_VL_TOTAL_MOEDA.AsFloat := nValor_total;
              qry_li_.Post;
            end;
          end
          else
          begin
            qry_li_.Edit;
            qry_li_VL_TOTAL_MOEDA.AsFloat := nValor_total;
            qry_li_.Post;
          end;
        end;

        if nPeso_Liq <> datm_LI_Itens.qry_li_QT_TOTAL_PES_LIQ.AsFloat then
        begin
          if qry_li_QT_TOTAL_PES_LIQ.AsFloat <> 0 then
          begin
            if BoxMensagem( 'Total do Peso Liquido é diferente !' + #13+#10 + 'Repassa os valores para Capa ?', 1 ) then
            begin
              qry_li_.Edit;
              qry_li_QT_TOTAL_PES_LIQ.AsFloat := nPeso_Liq;
              qry_li_.Post;
            end;
          end
          else
          begin
            qry_li_.Edit;
            qry_li_QT_TOTAL_PES_LIQ.AsFloat := nPeso_Liq;
            qry_li_.Post;
          end;
        end;

        if nQtde <> datm_LI_Itens.qry_li_QT_MED_ESTATISTICA.AsFloat then
        begin
          if qry_li_QT_MED_ESTATISTICA.AsFloat <> 0 then
          begin
             if BoxMensagem( 'Total da Quantidade é diferente!' + #13+#10 + 'Repassa os valores para Capa?', 1 ) then
             begin
               qry_li_.Edit;
               qry_li_QT_MED_ESTATISTICA.AsFloat := nQtde;
               qry_li_.Post;
             end;
          end
          else
          begin
            qry_li_.Edit;
            qry_li_QT_MED_ESTATISTICA.AsFloat := nQtde;
            qry_li_.Post;
          end;
        end;
      end;
      }
    end;
  end
end;

procedure Tfrm_LI_Itens.pgctrl_ItemChange(Sender: TObject);
begin
  //Mercadoria
  if pgctrl_Item.ActivePage = ts_item1 then
  begin
  end;
end;

procedure Tfrm_LI_Itens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

procedure Tfrm_LI_Itens.pgctrl_ItemChanging(Sender: TObject; var AllowChange: Boolean);
var
  nNum, Code : Integer;
begin
  if datm_LI_Itens.qry_li_IN_MONTADA.AsString = '1' then Exit;

  if ( pgctrl_Item.ActivePage = ts_item1 ) and (dbedt_qt_mercadoria.Enabled) then
  begin
    {Quantidade}
    Val( dbedt_qt_mercadoria.Text, nNum, Code );
    if nNum = 0 then
    begin
      BoxMensagem('Quantidade Inválida !',2);
      pgctrl_Item.ActivePage := ts_item1;
      dbedt_qt_mercadoria.SetFocus;
      AllowChange := False;
      Exit;
    end;

    {Vlr. Unitario}
    //Val( dbedt_vl_unitario.Text, nNum, Code );
    if dbedt_vl_unitario.Text = '' then
    begin
      BoxMensagem('Valor Unitário Inválido !',2);
      pgctrl_Item.ActivePage := ts_item1;
      dbedt_vl_unitario.SetFocus;
      AllowChange := False;
      Exit;
    end;

    if datm_li_itens.qry_li_itens_.RecordCount = 0 then
    begin
      AllowChange := False;
      Exit;
    end;
  end;

  if Not Consiste then
  begin
    AllowChange := False;
    Exit;
  end;

  if Not Grava then
  begin
    AllowChange := False;
    Exit;
  end;
end;

procedure Tfrm_LI_Itens.btn_calculoClick(Sender: TObject);
var
  nNum, Code : Integer;
  nr_item : String;
begin
  with datm_LI_Itens do
  begin
    Val( qry_li_QT_TOTAL_ITEM.AsString, nNum, Code );

    if ( qry_li_QT_TOTAL_ITEM.IsNull ) or ( nNum = 0) then
    begin
      BoxMensagem( 'LI não possui itens!', 3 );
      Exit;
    end;

    try
      datm_main.db_broker.StartTransaction;
      nr_item := qry_li_itens_NR_ITEM.AsString;

      if qry_li_itens_.State in [dsInsert, dsEdit] then qry_li_itens_.Post;

      CloseStoredProc( sp_li_calculo );
      sp_li_calculo.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
      ExecStoredProc( sp_li_calculo );

      case sp_li_calculo.ParamByName('Result').AsInteger of
        1: begin
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
             BoxMensagem( 'Valor Total da Mercadoria é diferente!', 2 );
             Exit;
           end;
        2: begin
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
             BoxMensagem( 'Total do Peso Liquido é diferente !', 2 );
             Exit;
           end;
        3: begin
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
             BoxMensagem( 'Total da Quantidade é diferente!', 2 );
             Exit;
           end;
        4: begin
             BoxMensagem( 'Valor do frete maior que o valor da mercadoria.', 2 );
           end;           
      end;

        CloseStoredProc( sp_li_calculo );
        datm_main.db_broker.Commit;

        BoxMensagem( 'Cálculo concluído com sucesso!' , 3);

        qry_li_itens_.Close;
        qry_li_itens_.Prepare;
        qry_li_itens_.Open;
        qry_li_itens_.Locate( 'NR_PROCESSO;NR_ITEM',
                              VarArrayOf ([str_nr_processo, nr_item]),
                              [loCaseInsensitive] );
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_LI_Itens.btn_co_regime_tributacaoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  Begin
    If Not PoeEmEdicao(datm_LI_itens.qry_li_itens_) Then Exit;
    datm_LI_itens.qry_li_itens_CD_REGIME_TRIBUTACAO.AsString := ConsultaOnLineEx('TREG_TRIBUTARIO','Regime Tributário',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil);
  End
  else
    dbedt_nm_regime_tributacao.Text := ConsultaLookUP('TREG_TRIBUTARIO','CODIGO',dbedt_cd_regime_tributacao.Text,'DESCRICAO');
end;

procedure Tfrm_LI_Itens.dbedt_cd_regime_tributacaoExit(Sender: TObject);
begin
  if dbedt_cd_regime_tributacao.Text <> '' then
  begin
    ValidaRegime( StrToInt( dbedt_cd_regime_tributacao.Text ) );
  end;
  CodExits;
  //if dbedt_cd_regime_tributacao.Text = '1' then dbedt_destaque.SetFocus;
end;

procedure Tfrm_LI_Itens.dbedt_cd_fund_legalExit(Sender: TObject);
begin
  if ( ( datm_LI_Itens.qry_li_itens_.FieldByName('CD_REGIME_TRIBUTACAO').AsString = '3' ) or
       ( datm_LI_Itens.qry_li_itens_.FieldByName('CD_REGIME_TRIBUTACAO').AsString = '5' ) ) and
     ( datm_LI_Itens.qry_li_itens_.FieldByName('CD_FUND_LEGAL').AsString = '16' ) then
  begin
    //dbedt_cd_numero_ato.Enabled     := True;
    //dbedt_cd_numero_ato.Color       := clWindow;
    //dbedt_cd_numero_ato.ReadOnly    := False;
  end
  else
  begin
    //dbedt_cd_numero_ato.Enabled     := False;
    //dbedt_cd_numero_ato.Color       := clMenu;
    //dbedt_cd_numero_ato.ReadOnly    := True;
    if datm_LI_Itens.qry_li_itens_.State in [dsInsert,dsEdit] then
    begin
      datm_LI_Itens.qry_li_itens_.FieldByName('NR_ATO_DRAWBACK').AsString  := '';
    end;
  end;
  If datm_LI_itens.qry_li_itens_CD_REGIME_TRIBUTACAO.AsString <> '' Then
    CodExits;
end;

procedure Tfrm_LI_Itens.btn_co_fund_legalClick(Sender: TObject);
begin
  If datm_LI_itens.qry_li_itens_CD_REGIME_TRIBUTACAO.AsString <> '' Then
  Begin
    If Sender is TSpeedButton Then
    Begin
      If Not PoeEmEdicao(datm_LI_itens.qry_li_itens_) Then Exit;
      datm_li_itens.qry_li_itens_CD_FUND_LEGAL.AsString := ConsultaOnLineExSQL('SELECT CODIGO, DESCRICAO FROM TFUND_LEG_REG_TRIBUT WHERE CODIGO IN ( SELECT CD_FUND_LEGAL FROM TTP_FUND_LEGAL T WHERE CD_REGIME_TRIB = "' + dbedt_cd_regime_tributacao.Text + '")','Fundamento Legal',['CODIGO','DESCRICAO'],['Codigo','Descrição'],'CODIGO',nil);
    End
    Else
      dbedt_nm_fund_legal.Text := ConsultaLookUP('TFUND_LEG_REG_TRIBUT','CODIGO',dbedt_cd_fund_legal.Text,'DESCRICAO');
  End;
end;

procedure Tfrm_LI_Itens.ValidaRegime( nControla : Byte );
begin
  {Fundamento Legal}
  if nControla in [1] then
  begin
    if datm_LI_Itens.qry_li_itens_.State in [dsInsert,dsEdit] then
    begin
      datm_LI_Itens.qry_li_itens_.FieldByName('CD_FUND_LEGAL').AsString          := '';
      datm_LI_Itens.qry_li_itens_.FieldByName('NR_ATO_DRAWBACK').AsString        := '';
      datm_LI_Itens.qry_li_itens_.FieldByName('IN_DRAWBACK_AUTOMATICO').AsString := '0';
    end;

    btn_co_fund_legal.Enabled      := False;

    dbedt_cd_fund_legal.Enabled    := False;
    dbedt_cd_fund_legal.Color      := clMenu;
    dbedt_cd_fund_legal.ReadOnly   := True;

    //dbedt_cd_numero_ato.Enabled    := False;
    //dbedt_cd_numero_ato.Color      := clMenu;
    //dbedt_cd_numero_ato.Readonly   := True;
  end;

  if nControla in [2..6] then
  begin
    btn_co_fund_legal.Enabled      := True;

    dbedt_cd_fund_legal.Enabled    := True;
    dbedt_cd_fund_legal.Color      := clWindow;
    dbedt_cd_fund_legal.ReadOnly   := False;

    //dbedt_cd_numero_ato.Enabled    := True;
    //dbedt_cd_numero_ato.Color      := clWindow;
    //dbedt_cd_numero_ato.Readonly   := False;
  end;
end;

procedure Tfrm_LI_Itens.btn_mi(i, s, c, e, d, m, o: Boolean);
begin
  btn_novo.Enabled       := i;  mi_novo.Enabled     := i;
  btn_salvar.Enabled     := s;  mi_salvar.Enabled   := s;
  btn_cancelar.Enabled   := c;  mi_cancelar.Enabled := c;
  btn_excluir.Enabled    := e;  mi_excluir.Enabled  := e;
  btn_duplica.Enabled    := d;  mi_duplica.Enabled  := d;
  btn_monta_li.Enabled   := m;  mi_monta_li.Enabled := m;
  btn_calculo.Enabled    := o;  mi_calculo.Enabled  := o;
  btnRatearPeso.Enabled  := o;

  btn_trans_LI.Enabled := (datm_LI_Itens.qry_li_IN_MONTADA.AsString = '1') and
     (not (datm_LI_Itens.qry_li_itens_.State in [dsEdit, dsInsert]));
end;

procedure Tfrm_LI_Itens.dbedt_nr_poKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ConsultaLookup('TEMPRESA_NAC', 'CD_EMPRESA', ConsultaLookUp('TPROCESSO','NR_PROCESSO',Copy(datm_li_itens.qry_li_NR_PROCESSO.Text,1,14),'CD_CLIENTE'), 'IN_REF_ACEITA_BARRA') = '0' then
    if ( Key = '/' ) then
      Key := #0;
end;

procedure Tfrm_LI_Itens.dbedt_nr_item_poExit(Sender: TObject);
begin
  with datm_LI_Itens do
  begin
    if ds_li_itens.State in [dsInsert, dsEdit] then
      qry_li_itens_.FieldByName('NR_ITEM_PO').AsString :=
          Copy('0000', 1, 4-Length(Trim(qry_li_itens_.FieldByName('NR_ITEM_PO').AsString))) +
          Trim(qry_li_itens_.FieldByName('NR_ITEM_PO').AsString);
  end;
end;

procedure Tfrm_LI_Itens.HabilitaDrawback;
  procedure HabilitaNumeroAto(Value: Boolean);
  begin
    lbl_numero.Enabled := Value;
    dbedt_cd_numero_ato.Clear;
    dbedt_cd_numero_ato.Enabled := Value;
    dbedt_cd_numero_ato.ReadOnly := not Value;
    if Value then
      dbedt_cd_numero_ato.Color := clWindow
    else
      dbedt_cd_numero_ato.Color := clMenu;
  end;
  procedure HabilitaNumeroItem(Value: Boolean);
  begin
    lbl_nr_item_drawback.Enabled := Value;
    dbedt_nr_item_drawback.Enabled := Value;
    if Value then
      dbedt_nr_item_drawback.Color := clWindow
    else
      dbedt_nr_item_drawback.Color := clMenu;
  end;
begin
  case rgpDrawback.ItemIndex of
    0:
    begin
      HabilitaNumeroAto(False);
      HabilitaNumeroItem(False);
    end;
    1:
    begin
      HabilitaNumeroAto(True);
      HabilitaNumeroItem(True);
      dbedt_cd_numero_ato.MaxLength := 11;
      dbedt_nr_item_drawback.MaxLength := 3;
    end;
    2:
    begin
      HabilitaNumeroAto(True);
      HabilitaNumeroItem(True);
      dbedt_cd_numero_ato.MaxLength := 11;
      dbedt_nr_item_drawback.MaxLength := 3;
    end;
    3:
    begin
      HabilitaNumeroAto(True);
      HabilitaNumeroItem(True);
      dbedt_cd_numero_ato.MaxLength := 13;
      dbedt_nr_item_drawback.MaxLength := 3;
    end;
    4:
    begin
      HabilitaNumeroAto(True);
      HabilitaNumeroItem(True);
      dbedt_cd_numero_ato.MaxLength := 13;
      dbedt_nr_item_drawback.MaxLength := 3;
    end;

  else
    begin
      HabilitaNumeroAto(False);
      HabilitaNumeroItem(False)
    end;
  end;
end;

procedure Tfrm_LI_Itens.rbtn_sistema_drawbackClick(Sender: TObject);
begin
  with datm_LI_Itens do
  begin
    if ( TRadioButton(Sender).Name = 'rbtn_sistema_drawback1' ) or ( TRadioButton(Sender).Name = 'rbtn_sistema_drawback2' ) then
    begin
      lbl_info_drawback.Enabled          := True;

      //dbedt_nr_item_drawback.Clear;
      //dbedt_nr_item_drawback.Enabled     := True;
      //dbedt_nr_item_drawback.Color       := clWindow;
      //dbedt_nr_item_drawback.ReadOnly    := False;

      dbedt_qt_produto_drawback.Clear;
      dbedt_qt_produto_drawback.Enabled  := True;
      dbedt_qt_produto_drawback.Color    := clWindow;
      dbedt_qt_produto_drawback.ReadOnly := False;

      dbedt_vl_produto_drawback.Clear;
      dbedt_vl_produto_drawback.Enabled  := True;
      dbedt_vl_produto_drawback.Color    := clWindow;
      dbedt_vl_produto_drawback.ReadOnly := False;
    end;

    if TRadioButton(Sender).Name = 'rbtn_sistema_drawback3' then
    begin
      lbl_info_drawback.Enabled          := False;

      //dbedt_nr_item_drawback.Clear;
      //dbedt_nr_item_drawback.Enabled     := False;
      //dbedt_nr_item_drawback.Color       := clMenu;
      //dbedt_nr_item_drawback.ReadOnly    := True;

      dbedt_qt_produto_drawback.Clear;
      dbedt_qt_produto_drawback.Enabled  := False;
      dbedt_qt_produto_drawback.Color    := clMenu;
      dbedt_qt_produto_drawback.ReadOnly := True;

      dbedt_vl_produto_drawback.Clear;
      dbedt_vl_produto_drawback.Enabled  := False;
      dbedt_vl_produto_drawback.Color    := clMenu;
      dbedt_vl_produto_drawback.ReadOnly := True;
    end;
  end;
end;

procedure Tfrm_LI_Itens.dbedt_qt_mercadoriaExit(Sender: TObject);
begin
  with datm_LI_Itens do
  begin
    if ds_li_itens.State in [dsInsert, dsEdit] then
      qry_li_itens_VL_TOTAL_MLE.AsFloat := Arredondar( qry_li_itens_QT_MERC_UN_COMERC.AsFloat * qry_li_itens_VL_UNIT_MLE.AsFloat, 5 );
  end;  
end;

procedure Tfrm_LI_Itens.btn_trans_LIClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_trans_li, frm_trans_li);
  datm_trans_li.qry_li_lista_.ParamByName('NR_PROCESSO').AsString := datm_LI_Itens.qry_li_itens_NR_PROCESSO.AsString;
  frm_trans_LI.msk_cd_unid_neg.Text := Copy(datm_LI_Itens.qry_li_itens_NR_PROCESSO.AsString, 1, 2);
  frm_trans_LI.msk_cd_unid_negExit(frm_trans_LI.msk_cd_unid_neg);
  //frm_trans_LI.msk_cd_unid_neg.Enabled := False;
  //frm_trans_LI.btn_cd_unid_neg.Enabled := False;
  frm_trans_LI.ShowModal;
  FreeAndNil(frm_trans_LI);
end;

procedure Tfrm_LI_Itens.btnQtdUnidEstatIgualClick(Sender: TObject);
begin
  if MessageDlg('ATENÇÃO: Deseja atualizar o campo  Quant. na Unid. Estatística de todos os itens da LI ' + Trim(datm_LI_Itens.qry_li_itens_NR_PROCESSO.AsString)  + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' UPDATE DM                                                  ');
      SQL.Add(' SET QT_MERC_UN_ESTAT = CASE WHEN UNIDADE_MEDIDA IN (''010'', ''100'', ''156'', ''157'', ''158'', ''159'', ''161'', ''163'', ''177'', ''178'', ''183'', ''191'', ''203'', ''208'') ');
      SQL.Add('                            THEN PL_MERCADORIA              ');
      SQL.Add('                       ELSE QT_MERC_UN_COMERC               ');
      SQL.Add('                       END                                  ');
      SQL.Add('FROM TLICENCA_ITENS DM                                      ');
      SQL.Add('   LEFT JOIN TNCM NCM ON NCM.CODIGO = LEFT(DM.CD_NCM_SH, 8) ');
      SQL.Add(' WHERE NR_PROCESSO = :NR_PROCESSO                           ');
      //SQL.Add('UPDATE TLICENCA_ITENS SET QT_MERC_UN_ESTAT = CASE CD_UN_MED_COMERC WHEN ''010'' THEN PL_MERCADORIA ELSE QT_MERC_UN_COMERC END WHERE NR_PROCESSO = :NR_PROCESSO');
      ParamByName('NR_PROCESSO').AsString := datm_LI_Itens.qry_li_itens_NR_PROCESSO.AsString;
      ExecSQL;
      Free;
      datm_LI_Itens.qry_li_itens_.Close;
      datm_LI_Itens.qry_li_itens_.Open;
    end;
  end;
end;

procedure Tfrm_LI_Itens.btnExportadorClick(Sender: TObject);
begin
  if MessageDlg('ATENÇÃO: Deseja atualizar o campo  Exportador de todos os itens da LI ' + Trim(datm_LI_Itens.qry_li_itens_NR_PROCESSO.AsString)  + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TLICENCA_ITENS SET CD_EXPORTADOR = :CD_EXPORTADOR WHERE NR_PROCESSO = :NR_PROCESSO');
      ParamByName('CD_EXPORTADOR').AsString := dbedt_cd_exportador.Text;
      ParamByName('NR_PROCESSO').AsString   := datm_LI_Itens.qry_li_itens_NR_PROCESSO.AsString;
      ExecSQL;
      Free;
      datm_LI_Itens.qry_li_itens_.Close;
      datm_LI_Itens.qry_li_itens_.Open;
    end;
  end;
end;

procedure Tfrm_LI_Itens.btnFabricanteClick(Sender: TObject);
begin
  if MessageDlg('ATENÇÃO: Deseja atualizar o campo  Fabricante de todos os itens da LI ' + Trim(datm_LI_Itens.qry_li_itens_NR_PROCESSO.AsString)  + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TLICENCA_ITENS SET CD_FABRICANTE = :CD_FABRICANTE WHERE NR_PROCESSO = :NR_PROCESSO');
      ParamByName('CD_FABRICANTE').AsString := dbedt_cd_fabricante.Text;
      ParamByName('NR_PROCESSO').AsString := datm_LI_Itens.qry_li_itens_NR_PROCESSO.AsString;
      ExecSQL;
      Free;
      datm_LI_Itens.qry_li_itens_.Close;
      datm_LI_Itens.qry_li_itens_.Open;
    end;
  end;
end;

procedure Tfrm_LI_Itens.btnFabriExpoClick(Sender: TObject);
begin
  if MessageDlg('ATENÇÃO: Deseja atualizar esta informação em todos os itens da LI ' + Trim(datm_LI_Itens.qry_li_itens_NR_PROCESSO.AsString)  + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TLICENCA_ITENS SET CD_FABR_EXPO = :CD_FABR_EXPO WHERE NR_PROCESSO = :NR_PROCESSO');
      ParamByName('CD_FABR_EXPO').AsString := dbrgrp_fabr_expo.Value;
      ParamByName('NR_PROCESSO').AsString  := datm_LI_Itens.qry_li_itens_NR_PROCESSO.AsString;
      ExecSQL;
      Free;
      datm_LI_Itens.qry_li_itens_.Close;
      datm_LI_Itens.qry_li_itens_.Open;
    end;
  end;
end;

procedure Tfrm_LI_Itens.rgpDrawbackChange(Sender: TObject);
begin
  HabilitaDrawback;
end;

procedure Tfrm_LI_Itens.rgpDrawbackClick(Sender: TObject);
begin
  HabilitaDrawback;
end;

procedure Tfrm_LI_Itens.btnRatearPesoClick(Sender: TObject);
var
  ResultadoUp :Integer;
  bmItem : TBookmark;
begin
  if datm_LI_Itens.qry_li_itens_.State in [dsEdit,dsInsert] then
  begin
    ShowMessage('Salve as alterações antes de ratear o peso.');
  end
  else
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBroker';
      SQL.Clear;
      SQL.text :=  ' SELECT B.NR_PROCESSO                                                    '+
                   '   FROM TLICENCA_IMPORTACAO A (NOLOCK)                                   '+
                   '   JOIN TLICENCA_ITENS      B (NOLOCK) ON B.NR_PROCESSO = A.NR_PROCESSO  '+
                   '  WHERE A.NR_PROCESSO = '+ QuotedStr(datm_LI_Itens.qry_li_itens_NR_PROCESSO.AsString);
      Open;
      if IsEmpty then
      begin
        ShowMessage('LI não possui itens cadastrados.');
      end
      else
      begin
        SQL.Clear;
        SQL.text := '   DECLARE @TAB TABLE (                                                                   ' + sLineBreak +
                    '   NR_PROCESSO CHAR(18),                                                                  ' + sLineBreak +
                    '   NR_ITEM CHAR(3),                                                                       ' + sLineBreak +
                    '   PESO_LIQ_RATEADO DECIMAL(15,3)                                                         ' + sLineBreak +
                    '                                                                                          ' + sLineBreak +
                    '   )                                                                                      ' + sLineBreak +
                    '    INSERT INTO @TAB                                                                      ' + sLineBreak +
                    '    SELECT A.NR_PROCESSO,                                                                 ' + sLineBreak +
                    '           B.NR_ITEM,                                                                     ' + sLineBreak +
                    '           CAST(( (A.QT_TOTAL_PES_LIQ /                                                   ' + sLineBreak +
                    '           (SUM(B.QT_MERC_UN_COMERC) OVER(PARTITION BY A.NR_PROCESSO))) *                 ' + sLineBreak +
                    '           B.QT_MERC_UN_COMERC) AS DECIMAL(15,3))  AS   PESO_LIQ_RATEADO                  ' + sLineBreak +
                    '      FROM TLICENCA_IMPORTACAO A (NOLOCK)                                                 ' + sLineBreak +
                    '      JOIN TLICENCA_ITENS      B (NOLOCK) ON B.NR_PROCESSO = A.NR_PROCESSO                ' + sLineBreak +
                    '      WHERE A.NR_PROCESSO = '+ QuotedStr(datm_LI_Itens.qry_li_itens_NR_PROCESSO.AsString)   + sLineBreak +
                    '                                                                                          ' + sLineBreak +
                    '   UPDATE TLICENCA_ITENS                                                                  ' + sLineBreak +
                    '      SET PL_MERCADORIA = C.PESO_LIQ_RATEADO                                              ' + sLineBreak +
                    '     FROM TLICENCA_IMPORTACAO A (NOLOCK)                                                  ' + sLineBreak +
                    '     JOIN TLICENCA_ITENS      B (NOLOCK) ON B.NR_PROCESSO = A.NR_PROCESSO                 ' + sLineBreak +
                    '     JOIN @TAB                C          ON C.NR_PROCESSO = B.NR_PROCESSO                 ' + sLineBreak +
                    '                                        AND C.NR_ITEM     = B.NR_ITEM                     ' + sLineBreak ;
                    
        execSql;
        ResultadoUp := rowsaffected;
        if ResultadoUp > 0 then
        begin
          ShowMessage('Itens atualizados!');

          bmItem := datm_LI_Itens.qry_li_itens_.getbookmark;
          datm_LI_Itens.qry_li_itens_.Close;
          datm_LI_Itens.qry_li_itens_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
          datm_LI_Itens.qry_li_itens_.Prepare;
          datm_LI_Itens.qry_li_itens_.Open;
          datm_LI_Itens.qry_li_itens_.gotoBookMark(bmItem);
          datm_LI_Itens.qry_li_itens_.freeBookMark(bmItem);
        end
        else
          ShowMessage('Erro ao atualizar itens.');
      end;

      Free;
    end;
  end;

end;

procedure Tfrm_LI_Itens.dbedt_item_atualChange(Sender: TObject);
begin
  editItem.text := dbedt_item_atual.text;
end;

procedure Tfrm_LI_Itens.editItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if btn_salvar.enabled then
    if (Key = VK_DELETE) then
      Key := 0;
end;

procedure Tfrm_LI_Itens.editItemKeyPress(Sender: TObject; var Key: Char);
begin
  if btn_salvar.enabled then
    key :=#0
  else
  If not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure Tfrm_LI_Itens.editItemKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if length(editItem.text) = 3 then
  begin
    if not btn_salvar.enabled then
    begin
      if (datm_LI_Itens.qry_li_itens_.State in [dsBrowse]) then
        if datm_LI_Itens.qry_li_itens_NR_ITEM.asString <> editItem.text then
         datm_LI_Itens.qry_li_itens_.Locate('NR_PROCESSO; NR_ITEM',
                                            VarArrayOf ([datm_li.qry_li_NR_PROCESSO.AsString,
                                                         editItem.text]),
                                           [loCaseInsensitive])
    end;
  end;
end;

end.

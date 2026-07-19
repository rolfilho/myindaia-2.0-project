UNIT PGPE003;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Menus, Buttons, ComCtrls, Grids,
  DBGrids, Db, DBTables, DBCGrids, PGGP001, Funcoes;

type
  Tfrm_pe_itens = class(TForm)
    Panel1: TPanel;
    Bevel11: TBevel;
    Label6: TLabel;
    Label17: TLabel;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_novo_item: TSpeedButton;
    btn_capa_pe: TSpeedButton;
    btn_duplicar: TSpeedButton;
    btn_excluir: TSpeedButton;
    DBNavigator: TDBNavigator;
    dbedt_nm_item_inicial: TDBEdit;
    dbedt_item_final_li: TDBEdit;
    pgctrl_Item: TPageControl;
    ts_item1: TTabSheet;
    pnl_item: TPanel;
    Label29: TLabel;
    SpeedButton1: TSpeedButton;
    Label32: TLabel;
    SpeedButton2: TSpeedButton;
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
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label8: TLabel;
    lbl_fabr_prod: TLabel;
    btn_co_fabr_item: TSpeedButton;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    dbrdgrp_fabr_expo: TDBRadioGroup;
    dbedt_cd_mercadoria: TDBEdit;
    dbedt_cd_unid_medida: TDBEdit;
    dbedt_qt_mercadoria: TDBEdit;
    dbedt_vl_unitario: TDBEdit;
    dbedt_vl_mle: TDBEdit;
    dbedt_cd_ncm: TDBEdit;
    dbedt_cd_naladi: TDBEdit;
    dbedt_peso_liquido: TDBEdit;
    dbedt_vl_mcv: TDBEdit;
    dbedt_nm_mercadoria: TDBEdit;
    dbedt_nm_unid_medida: TDBEdit;
    dbedt_nr_processo: TDBEdit;
    dbedt_nr_ped_imp: TDBEdit;
    dbm_descr_mercadoria: TDBMemo;
    Panel4: TPanel;
    dbedt_compr_emb: TDBEdit;
    dbedt_larg_emb: TDBEdit;
    dbedt_alt_emb: TDBEdit;
    dbedt_peso_emb: TDBEdit;
    dbedt_vl_exw: TDBEdit;
    dbedt_peso_liq_total: TDBEdit;
    dbedt_peso_bruto_total: TDBEdit;
    dbedt_vl_cubagem: TDBEdit;
    dbedt_nr_pedido: TDBEdit;
    dbedt_cd_fabr_item: TDBEdit;
    dbedt_nm_fabr_item: TDBEdit;
    ts_embalagem: TTabSheet;
    pnl_embalagem: TPanel;
    Label1: TLabel;
    SpeedButton3: TSpeedButton;
    Label2: TLabel;
    SpeedButton4: TSpeedButton;
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
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    dbedt_nr_processo_emb: TDBEdit;
    dbedt_nm_embalagem: TDBEdit;
    dbedt_classif_embal: TDBEdit;
    dbedt_qt_por_embalagem: TDBEdit;
    dbedt_qt_de_emb: TDBEdit;
    dbedt_vl_por_emb: TDBEdit;
    Panel2: TPanel;
    dbedt_cd_embalagem: TDBEdit;
    dbedt_nm_emb_sup: TDBEdit;
    dbedt_class_emb_sup: TDBEdit;
    dbedt_qt_por_emb_sup: TDBEdit;
    dbedt_qt_de_emb_sup: TDBEdit;
    dbedt_vl_por_emb_sub: TDBEdit;
    dbedt_cd_emb_sup: TDBEdit;
    menu_manut_cadastro: TMainMenu;
    mi_novo_item: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_duplicar: TMenuItem;
    mi_sair: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_novo_itemClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_capa_peClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_co_mercadoriaClick(Sender: TObject);
    procedure dbedt_cd_mercadoriaExit(Sender: TObject);
    procedure btn_duplicarClick(Sender: TObject);
    procedure dbedt_vl_unitarioEnter(Sender: TObject);
    procedure dbedt_vl_itemEnter(Sender: TObject);
    procedure dbedt_cd_mercadoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgctrl_ItemChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_vl_unitarioExit(Sender: TObject);
    procedure dbedt_qt_mercadoriaEnter(Sender: TObject);
    procedure btn_co_ncmClick(Sender: TObject);
    procedure btn_co_naladiClick(Sender: TObject);
    procedure btn_co_unid_medidaClick(Sender: TObject);
    procedure btn_co_embalagemClick(Sender: TObject);
    procedure dbedt_cd_ncmExit(Sender: TObject);
    procedure dbedt_cd_naladiExit(Sender: TObject);
    procedure dbedt_cd_unid_medidaExit(Sender: TObject);
    procedure dbedt_cd_embalagemExit(Sender: TObject);
    procedure dbedt_cd_mercadoriaChange(Sender: TObject);
    procedure dbedt_qt_por_embalagemExit(Sender: TObject);
    procedure dbedt_alt_embExit(Sender: TObject);
    procedure dbedt_peso_liquidoExit(Sender: TObject);
    procedure dbedt_qt_mercadoriaExit(Sender: TObject);
    procedure btn_co_emb_supClick(Sender: TObject);
    procedure dbedt_cd_emb_supExit(Sender: TObject);
    procedure dbedt_qt_por_emb_supExit(Sender: TObject);
    procedure btn_co_fabr_itemClick(Sender: TObject);
    procedure dbedt_cd_fabr_itemExit(Sender: TObject);
    procedure dbrdgrp_fabr_expoChange(Sender: TObject);

  private
    { Private declarations }
    function VerAlt            : Boolean;
    function Grava             : Boolean;
    function Consiste : Boolean;

    procedure Cancelar;
    procedure CodExits;
    procedure Desabilita_Entrada;
    procedure Habilita_Entrada;
    procedure Verifica_Capa;

  public
    vl_old, vl_new, vl2_old, vl2_new   : double;
    nr_adicao, nr_item                 : string[3];
    lNaoConsiste, in_LI_Montada, in_abrindo_itens    : Boolean;
    { Public declarations }
  end;

var
  frm_pe_itens: Tfrm_pe_itens;

implementation

uses GSMLIB, PGPE002, PGPE006, PGPE004, PGGP017, PGSM184, PGSM185;

{$R *.DFM}


procedure Tfrm_pe_itens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Screen.Cursor := crArrow;

  Verifica_Capa;

  if VerAlt then
  begin
    with datm_PE_Itens do
    begin
      qry_pe_.Close;
      qry_pe_itens_.Close;
      qry_mercadoria_lookup_.Close;
      qry_emp_nac_.Close;
      qry_ncm_.Close;
      qry_naladi_.Close;
      qry_mercadoria_.Close;
      qry_unid_medida_.Close;

      Free;
      Action := caFree;
    end;
  end
  else
    Action := caNone;

end;

procedure Tfrm_pe_itens.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_pe_itens.FormShow(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;

  If not (bCriando) = True then
  begin
    If datm_PE.qry_pe_NR_PROCESSO.AsString <> '' then
       str_nr_processo := datm_PE.qry_pe_NR_PROCESSO.AsString;
  end;

  Frm_PE_Itens.Caption := Trim( Frm_PE_itens.Caption ) + ' [ ' + Trim( str_nr_processo ) + ' ] ';

  datm_PE_Itens.qry_mercadoria_lookup_.Close;
  datm_PE_Itens.qry_mercadoria_lookup_.Prepare;
  datm_PE_Itens.qry_mercadoria_lookup_.Open;

  datm_PE_Itens.qry_pe_.Close;
  datm_PE_Itens.qry_pe_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
  datm_PE_Itens.qry_pe_.ParamByName('CD_UNID_NEG').AsString:= frm_pe.msk_cd_unid_neg.Text;
  datm_PE_Itens.qry_pe_.Prepare;
  datm_PE_Itens.qry_pe_.Open;

  datm_PE_Itens.qry_pe_itens_.Close;
  datm_PE_Itens.qry_pe_itens_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
  datm_PE_Itens.qry_pe_itens_.ParamByName('CD_UNID_NEG').AsString:= frm_pe.msk_cd_unid_neg.Text;
  datm_PE_Itens.qry_pe_itens_.Prepare;
  datm_PE_Itens.qry_pe_itens_.Open;


  If datm_PE_Itens.qry_pe_itens_.EOF then
  begin
    Desabilita_Entrada;
    btn_novo_item.Enabled := True;
    mi_novo_item.Enabled  := True;
    btn_capa_pe.Enabled   := True;
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
  end;

  btn_sair.Enabled       := True;
  pgctrl_Item.ActivePage := ts_item1;

  Screen.Cursor := crArrow;
end;

procedure Tfrm_pe_itens.btn_novo_itemClick(Sender: TObject);
begin

  with datm_PE_Itens do
  begin
    qry_pe_Itens_.Close;
    qry_pe_Itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_pe_Itens_.ParamByName('CD_UNID_NEG').AsString := frm_pe.msk_cd_unid_neg.Text;
    qry_pe_Itens_.Prepare;
    qry_pe_Itens_.Open;

    Habilita_entrada;

    qry_pe_itens_.Append;
    qry_pe_itens_NR_PROCESSO.AsString := str_nr_processo;
    qry_pe_itens_CD_UNID_NEG.AsString := frm_pe.msk_cd_unid_neg.Text;

    NullToZero( datm_pe_itens.qry_pe_itens_QT_MERCADORIA     );
    NullToZero( datm_pe_itens.qry_pe_itens_VL_UNITARIO       );
    NullToZero( datm_pe_itens.qry_pe_itens_VL_PESO_LIQ_UNIT  );
    NullToZero( datm_pe_itens.qry_pe_itens_QT_POR_EMB        );
    NullToZero( datm_pe_itens.qry_pe_itens_QT_EMBALAGEM      );
    NullToZero( datm_pe_itens.qry_pe_itens_VL_POR_EMB        );
    NullToZero( datm_pe_itens.qry_pe_itens_VL_COMPRIMENTO_EMB);
    NullToZero( datm_pe_itens.qry_pe_itens_VL_LARGURA_EMB    );
    NullToZero( datm_pe_itens.qry_pe_itens_VL_ALTURA_EMB     );
    NullToZero( datm_pe_itens.qry_pe_itens_VL_PESO_EMB       );
    NullToZero( datm_pe_itens.qry_pe_itens_VL_TOT_PESO_LIQ   );
    NullToZero( datm_pe_itens.qry_pe_itens_VL_TOT_PESO_BRUTO );
    NullToZero( datm_pe_itens.qry_pe_itens_VL_CUBAGEM        );
    NullToZero( datm_pe_itens.qry_pe_itens_VL_MLE            );
    NullToZero( datm_pe_itens.qry_pe_itens_VL_MCV            );

    DBNavigator.Enabled   := True;
  end;

  btn_novo_item.Enabled := False;
  mi_novo_item.Enabled  := False;
  btn_duplicar.Enabled  := False;
  mi_duplicar.Enabled   := False;
  btn_excluir.Enabled   := False;
  mi_excluir.Enabled    := False;
  btn_capa_pe.Enabled   := False;

  dbedt_nr_ped_imp.SetFocus;

end;

procedure Tfrm_pe_itens.btn_salvarClick(Sender: TObject);
var
  Code : Integer;
  nNum : Double;

begin

  {Quantidade}
  Val( dbedt_qt_mercadoria.Text, nNum, Code );
  if nNum = 0 then
  begin
    ActiveControl := nil;
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

  if Not Consiste then Exit;
  if Not Grava    then Exit;

end;

function Tfrm_pe_itens.Grava;
var
  i : Integer;

begin
  Grava := True;
  try
    with datm_PE_Itens do
    begin
      datm_main.db_broker.StartTransaction;

      If qry_pe_itens_NR_PROCESSO.AsString = '' then
         qry_pe_itens_NR_PROCESSO.AsString := str_nr_processo;

      if qry_pe_itens_.State in [dsInsert] then
      begin
        If not (qry_pe_.State in [dsEdit]) then
           qry_pe_.Edit;

        if not (qry_pe_QT_TOTAL_ITENS.IsNull) then
        begin
          i := StrToInt( qry_pe_QT_TOTAL_ITENS.AsString );
          i := i + 1;

          qry_pe_QT_TOTAL_ITENS.AsString := StrZero( i, 3 );     // Quantidade Total dos Itens
          qry_pe_itens_NR_ITEM.AsString  := StrZero( i, 3 );     // Numero do Item
        end
        else
        begin
          qry_pe_QT_TOTAL_ITENS.AsString := '001';               // Quantidade Total dos Itens
          qry_pe_itens_NR_ITEM.AsString  := '001';               // Numero do Item
        end;
        qry_pe_.Post;
      end;

      if qry_pe_itens_.State in [dsEdit,dsInsert] then
      begin
        qry_pe_itens_VL_MLE.AsFloat := qry_pe_itens_VL_TOT_ITEM.AsFloat;
        qry_pe_itens_VL_MCV.AsFloat := qry_pe_itens_VL_TOT_ITEM.AsFloat;

        qry_pe_itens_.Post;
        nr_item := qry_pe_itens_NR_ITEM.AsString;
      end;

      datm_main.db_broker.Commit;

      qry_pe_itens_.Close;
      qry_pe_itens_.Prepare;
      qry_pe_itens_.Open;
      qry_pe_itens_.Locate('NR_PROCESSO;NR_ITEM', VarArrayOf ([str_nr_processo, nr_item]), [loCaseInsensitive]);
      
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;

  btn_excluir.enabled   := True;
  mi_excluir.enabled    := True;
  btn_novo_item.enabled := True;
  mi_novo_item.enabled  := True;
  btn_capa_pe.Enabled   := True;
  btn_duplicar.Enabled  := True;
  mi_duplicar.Enabled   := True;

  btn_salvar.enabled    := False;
  mi_salvar.enabled     := False;
  btn_cancelar.enabled  := False;
  mi_cancelar.enabled   := False;

  DBnavigator.Enabled   := True;

  pgctrl_Item.SetFocus;

end;


procedure Tfrm_pe_itens.btn_cancelarClick(Sender: TObject);
begin

  Cancelar;


  if not (datm_PE_Itens.qry_pe_itens_.EOF) then
  begin
    btn_excluir.Enabled   := True;
    mi_excluir.Enabled    := True;
    btn_duplicar.Enabled  := True;
    mi_duplicar.Enabled   := True;
  end
  else
    Desabilita_Entrada;

  btn_salvar.Enabled        := False;
  mi_salvar.Enabled         := False;
  btn_cancelar.Enabled      := False;
  mi_cancelar.Enabled       := False;

  btn_sair.Enabled    := True;
  mi_sair.Enabled     := True;
  btn_capa_pe.Enabled := True;
  btn_novo_item.Enabled := True;
  mi_novo_item.Enabled  := True;

  btn_capa_pe.Enabled   := True;

  DbNavigator.Enabled   := True;
end;

procedure Tfrm_pe_itens.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este item será excluído! Confirma exclusão?', 1 ) then
  begin
    nr_item := datm_PE_Itens.qry_pe_itens_NR_ITEM.AsString;

    datm_PE_Itens.qry_pe_itens_.Close;
    datm_PE_Itens.qry_pe_.Close;

    with datm_PE_Itens do
    begin
      try
        datm_main.db_broker.StartTransaction;

        datm_pe_itens.qry_exec_sp_.SQL.Clear;
        datm_pe_itens.qry_exec_sp_.SQL.Add( 'EXEC sp_pe_apaga_renum_itens "' + str_nr_processo + '","' + nr_item + '","' + frm_pe.msk_cd_unid_neg.Text + '"' );
        datm_pe_itens.qry_exec_sp_.ExecSQL;

        datm_main.db_broker.Commit;
      Except
        on E: Exception do
           begin
             if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
             TrataErro(E);
           end;
      end;

      qry_pe_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
      qry_pe_.ParamByName('CD_UNID_NEG').AsString:= frm_pe.msk_cd_unid_neg.Text;
      qry_pe_.Prepare;
      qry_pe_.Open;

      qry_pe_itens_.Close;
      qry_pe_itens_.Prepare;
      qry_pe_itens_.Open;
      qry_pe_itens_.Locate('NR_PROCESSO', str_nr_processo, []);

      if not (qry_pe_itens_.EOF) then
      begin
        btn_duplicar.Enabled := True;
        mi_duplicar.Enabled  := True;
      end
      else
      begin
        Desabilita_Entrada;
        btn_sair.Enabled      := True;
        mi_sair.Enabled       := True;
        btn_capa_pe.Enabled   := True;
        btn_novo_item.Enabled := True;
        mi_novo_item.Enabled  := True;
        mi_duplicar.Enabled   := False;
      end;
    end;
  end
end;

procedure Tfrm_pe_itens.btn_capa_peClick(Sender: TObject);
begin
  Close;
  Frm_PE.i_seletor := 1;
end;

procedure Tfrm_pe_itens.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;
  Application.CreateForm( Tdatm_PE_Itens, datm_PE_Itens );
end;

procedure Tfrm_pe_itens.btn_co_mercadoriaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_mercadoria_exp, frm_mercadoria_exp);

  with datm_mercadoria_exp do
  begin
    qry_lista_.Close;
    CloseStoredProc( sp_mercadoria_exp_ );
    sp_mercadoria_exp_.ParamByName('@cd_exportador').AsString := datm_pe_itens.qry_pe_CD_EXPORTADOR.AsString;
    sp_mercadoria_exp_.ParamByName('@cd_grupo').asString := '';
    ExecStoredProc( sp_mercadoria_exp_ );
    frm_mercadoria_exp.nr_identificador := sp_mercadoria_exp_.ParamByName('@nr_identificador').asInteger;
    CloseStoredProc( sp_mercadoria_exp_ );
    qry_lista_.ParamByName('NR_IDENTIFICADOR').asInteger := frm_mercadoria_exp.nr_identificador;
    qry_lista_.Prepare;
    qry_lista_.Open;
  end;

  frm_mercadoria_exp.cImportador := datm_PE_Itens.qry_pe_CD_EXPORTADOR.AsString;
  datm_mercadoria_exp.tbl_empresa_nac_.Open;
  if datm_mercadoria_exp.tbl_empresa_nac_.FindKey([frm_mercadoria_exp.cImportador]) then
    frm_mercadoria_exp.cGrupo := datm_mercadoria_exp.tbl_empresa_nac_CD_GRUPO.AsString;

  frm_mercadoria_exp.Cons_OnLine := datm_PE_Itens.qry_pe_itens_CD_MERCADORIA;
  with frm_mercadoria_exp do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_PE_Itens.qry_pe_itens_.State in [dsEdit, dsInsert] ) then
             datm_PE_Itens.qry_pe_itens_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;

  if dbedt_cd_mercadoria.Visible then dbedt_cd_mercadoriaExit(Sender);

end;

procedure Tfrm_pe_itens.dbedt_cd_mercadoriaExit(Sender: TObject);
var Filter_Grupo : String;

begin
  datm_PE_Itens.qry_mercadoria_.Close;

  if Not (datm_PE_Itens.qry_emp_nac_.Active) then
    datm_PE_Itens.qry_emp_nac_.Open;
  if datm_PE_itens.qry_emp_nac_.Locate('CD_EMPRESA', datm_PE_Itens.qry_pe_CD_EXPORTADOR.AsString, [] ) then
     Filter_Grupo := datm_PE_Itens.qry_emp_nac_CD_GRUPO.AsString
  else
     Filter_Grupo := '';

  if Filter_Grupo = '' then
  begin
    if dbedt_cd_mercadoria.Text <> '' then
       datm_PE_Itens.qry_mercadoria_.SQL[3] := 'AND CD_EXPORTADOR = "'+datm_PE_Itens.qry_pe_CD_EXPORTADOR.AsString + '"'
    else
       datm_PE_Itens.qry_mercadoria_.SQL[3] := '';
  end
  else
  begin
    if dbedt_cd_mercadoria.Text <> '' then
       datm_PE_Itens.qry_mercadoria_.SQL[3] := 'AND CD_EXPORTADOR = "'+datm_PE_Itens.qry_pe_CD_EXPORTADOR.AsString + '" OR '+
                                               'CD_GRUPO = "'+Filter_Grupo + '"'
    else
       datm_PE_Itens.qry_mercadoria_.SQL[3] := '';
  end;

  (*
  if Trim(dbedt_cd_mercadoria.Text) <> '' then
  begin

    datm_PE_Itens.qry_mercadoria_.ParamByName('CD_MERCADORIA').AsString := dbedt_cd_mercadoria.Text;
    datm_PE_Itens.qry_mercadoria_.Prepare;
    datm_PE_Itens.qry_mercadoria_.Open;
    datm_PE_Itens.qry_mercadoria_.Locate( 'CD_MERCADORIA', dbedt_cd_mercadoria.Text, [] );

    if not datm_PE_Itens.qry_mercadoria_.EOF then
    begin
      if ( datm_PE_Itens.qry_pe_itens_.State in [dsInsert, dsEdit]) then
      begin

        dbedt_qt_por_embalagem.Color    := clWindow;
        dbedt_vl_por_emb.Color          := clWindow;
        dbedt_qt_por_embalagem.ReadOnly := False;
        dbedt_vl_por_emb.ReadOnly       := False;
        dbedt_qt_por_embalagem.TabStop  := True;
        dbedt_vl_por_emb.TabStop        := True;

        if datm_PE_Itens.qry_pe_itens_VL_UNITARIO.AsFloat = 0 then
           datm_PE_Itens.qry_pe_itens_VL_UNITARIO.AsFloat := datm_PE_Itens.qry_mercadoria_VL_UNITARIO.AsFloat;

        if ( datm_PE_Itens.qry_pe_itens_VL_PESO_LIQ_UNIT.AsFloat = 0 ) then
        begin
          datm_PE_Itens.qry_pe_itens_VL_PESO_LIQ_UNIT.AsFloat := datm_PE_Itens.qry_mercadoria_PL_MERCADORIA.AsFloat;
          if datm_PE_Itens.qry_pe_itens_QT_MERCADORIA.AsFloat > 0 then
             datm_PE_Itens.qry_pe_itens_VL_TOT_PESO_LIQ.AsFloat := Arredondar( datm_PE_Itens.qry_pe_itens_QT_MERCADORIA.AsFloat *
                                                                               datm_PE_Itens.qry_mercadoria_PL_MERCADORIA.AsFloat, 2 ); //qtde * peso unitario
        end;

        if datm_PE_Itens.qry_pe_itens_VL_TOT_ITEM.AsFloat = 0 then
           datm_PE_Itens.qry_pe_itens_VL_TOT_ITEM.AsFloat := ( datm_PE_Itens.qry_mercadoria_VL_UNITARIO.AsFloat *
                                                              datm_PE_Itens.qry_pe_itens_QT_MERCADORIA.AsFloat );

        if datm_PE_Itens.qry_pe_itens_CD_UNID_MEDIDA.AsString = '' then
           datm_PE_Itens.qry_pe_itens_CD_UNID_MEDIDA.AsString := datm_PE_Itens.qry_mercadoria_CD_UN_MED_COMERC.AsString;

        if datm_PE_Itens.qry_pe_itens_CD_NCM.AsString = '' then
           datm_PE_Itens.qry_pe_itens_CD_NCM.AsString := datm_PE_Itens.qry_mercadoria_CD_NCM_SH.AsString;

        if datm_PE_Itens.qry_pe_itens_CD_NALADI_SH.AsString = '' then
           datm_PE_Itens.qry_pe_itens_CD_NALADI_SH.AsString := datm_PE_Itens.qry_mercadoria_CD_NALADI_SH.AsString;

        if datm_PE_Itens.qry_pe_itens_TX_MERCADORIA.AsString = '' then
           datm_PE_Itens.qry_pe_itens_TX_MERCADORIA.Assign( datm_PE_Itens.qry_mercadoria_NM_MERCADORIA );

        if datm_PE_Itens.qry_pe_itens_CD_EMBALAGEM.AsString = '' then
        begin
          datm_PE_Itens.qry_pe_itens_CD_EMBALAGEM.AsString := datm_PE_Itens.qry_mercadoria_CD_EMBALAGEM.AsString;

          datm_PE_Itens.qry_embalagem_.Locate( 'CD_EMBALAGEM', datm_PE_Itens.qry_mercadoria_CD_EMBALAGEM.AsString, [] );
          if datm_PE_Itens.qry_embalagem_CD_EMBALAGEM.AsString = datm_PE_Itens.qry_mercadoria_CD_EMBALAGEM.AsString then
          begin
            if datm_PE_Itens.qry_pe_itens_CD_EMBALAGEM_SUP.AsString = '' then
               datm_PE_Itens.qry_pe_itens_CD_EMBALAGEM_SUP.AsString := datm_PE_Itens.qry_embalagem_CD_EMBALAGEM_SUP.AsString;

            if datm_PE_Itens.qry_pe_itens_QT_POR_EMB_SUP.AsFloat = 0 then
               datm_PE_Itens.qry_pe_itens_QT_POR_EMB_SUP.AsFloat := datm_PE_Itens.qry_embalagem_QT_EMBALAGEM_SUP.AsFloat;

          end;
        end;

        if datm_PE_Itens.qry_pe_itens_CD_UNID_MEDIDA.AsString <> '103' then
        begin
          if datm_PE_Itens.qry_pe_itens_QT_POR_EMB.AsFloat = 0 then
             datm_PE_Itens.qry_pe_itens_QT_POR_EMB.AsFloat := datm_PE_Itens.qry_mercadoria_QT_POR_EMBALAGEM.AsFloat;
        end
        else
        begin
          dbedt_qt_por_embalagem.Color    := clMenu;
          dbedt_vl_por_emb.Color          := clMenu;
          dbedt_qt_por_embalagem.ReadOnly := True;
          dbedt_vl_por_emb.ReadOnly       := True;
          dbedt_qt_por_embalagem.TabStop  := False;
          dbedt_vl_por_emb.TabStop        := False;
        end;

        if datm_PE_Itens.qry_pe_itens_VL_TOT_ITEM.AsFloat = 0 then
           datm_PE_Itens.qry_pe_itens_VL_TOT_ITEM.AsFloat := datm_PE_Itens.qry_pe_itens_QT_MERCADORIA.AsFloat *
                                                             datm_PE_Itens.qry_pe_itens_VL_UNITARIO.AsFloat;

        if datm_PE_Itens.qry_pe_itens_VL_POR_EMB.AsFloat = 0 then
           datm_PE_Itens.qry_pe_itens_VL_POR_EMB.AsFloat := datm_PE_Itens.qry_pe_itens_QT_MERCADORIA.AsFloat *
                                                            datm_PE_Itens.qry_pe_itens_QT_POR_EMB.AsFloat;

        if datm_PE_Itens.qry_pe_itens_TX_MERCADORIA.AsString = '' then
        begin
          if datm_PE_Itens.qry_pe_CD_LINGUA_PEDIDO.AsString = '1' then
             datm_PE_Itens.qry_pe_itens_TX_MERCADORIA.Assign( datm_PE_Itens.qry_mercadoria_TX_DESC_INGLES )
          else if datm_PE_Itens.qry_pe_CD_LINGUA_PEDIDO.AsString = '2' then
             datm_PE_Itens.qry_pe_itens_TX_MERCADORIA.Assign( datm_PE_Itens.qry_mercadoria_TX_DESC_ESP )
           else
             datm_PE_Itens.qry_pe_itens_TX_MERCADORIA.Assign( datm_PE_Itens.qry_mercadoria_NM_MERCADORIA );
        end;

        if datm_PE_Itens.qry_pe_itens_CD_FABR_EXPO.IsNull then
        begin
           datm_PE_Itens.qry_pe_itens_CD_FABR_EXPO.AsString := datm_PE_Itens.qry_mercadoria_CD_FABR_EXPO.AsString;

           if datm_PE_Itens.qry_pe_itens_CD_FABR_EXPO.AsString = '2' then
           begin
             if datm_PE_Itens.qry_pe_itens_CD_FABRICANTE.IsNull then
                datm_PE_Itens.qry_pe_itens_CD_FABRICANTE.AsString := datm_PE_Itens.qry_mercadoria_CD_FABRICANTE.AsString;
           end;
        end;
      end;
    end

    else
    begin
      BoxMensagem('Mercadoria não cadastrada para este cliente!', 2);
      pgctrl_Item.ActivePage := ts_item1;
      dbedt_cd_mercadoria.SetFocus;
    end;

    datm_pe_itens.qry_mercadoria_.Close;

  end;
    *)
end;


procedure Tfrm_pe_itens.btn_duplicarClick(Sender: TObject);
var
  NR_PROCESSO, NR_PEDIDO_IMP :string [18];
  CD_MERCADORIA        : string[15];
  CD_NCM               : string[11];
  CD_NALADI_SH         : string[8];
  CD_UNID_MEDIDA       : string[3];
  CD_UNID_NEG          : string[2];
  CD_EMBALAGEM, CD_EMB_SUP : string[4];
  CD_CLASSIF_EMBALAGEM, CD_CLASSIF_EMBALAGEM_SUP : string[30];
  CD_FABR_EXPO         : string[1];
  CD_EMB_CLIENTE       : string[10];
  QT_POR_EMB, QT_EMBALAGEM, QT_MERCADORIA, VL_POR_EMB, VL_UNITARIO, VL_PESO_LIQ_UNIT, VL_COMPRIMENTO_EMB,
  VL_LARGURA_EMB, VL_ALTURA_EMB, VL_PESO_EMB, VL_TOT_ITEM, VL_TOT_PESO_LIQ, VL_TOT_PESO_BRUTO, VL_CUBAGEM,
  VL_MLE, VL_MCV, QT_POR_EMB_SUP, QT_EMBALAGEM_SUP, VL_POR_EMB_SUP : double;
  TX_MERC    :AnsiString;

  no_tot_item : String[3];

  j : Integer;

begin

  try
    datm_main.db_broker.StartTransaction;                   // Inicializou transacao

    with datm_PE_Itens do
    begin

      NR_PROCESSO           := qry_pe_itens_NR_PROCESSO.AsString;
      CD_UNID_NEG           := qry_pe_itens_CD_UNID_NEG.AsString;
      NR_PEDIDO_IMP         := qry_pe_itens_NR_PEDIDO_IMP.AsString;
      CD_MERCADORIA         := qry_pe_itens_CD_MERCADORIA.AsString;
      CD_NCM                := qry_pe_itens_CD_NCM.AsString;
      CD_NALADI_SH          := qry_pe_itens_CD_NALADI_SH.AsString;
      CD_UNID_MEDIDA        := qry_pe_itens_CD_UNID_MEDIDA.AsString;
      CD_EMBALAGEM          := qry_pe_itens_CD_EMBALAGEM.AsString;
      CD_CLASSIF_EMBALAGEM  := qry_pe_itens_CD_CLASSIF_EMBALAGEM.AsString;
      CD_FABR_EXPO          := qry_pe_itens_CD_FABR_EXPO.AsString;
      QT_POR_EMB            := qry_pe_itens_QT_POR_EMB.AsFloat;
      QT_EMBALAGEM          := qry_pe_itens_QT_EMBALAGEM.AsFloat;
      QT_MERCADORIA         := qry_pe_itens_QT_MERCADORIA.AsFloat;
      VL_POR_EMB            := qry_pe_itens_VL_POR_EMB.AsFloat;
      VL_UNITARIO           := qry_pe_itens_VL_UNITARIO.AsFloat;
      VL_PESO_LIQ_UNIT      := qry_pe_itens_VL_PESO_LIQ_UNIT.AsFloat;
      VL_COMPRIMENTO_EMB    := qry_pe_itens_VL_COMPRIMENTO_EMB.AsFloat;
      VL_LARGURA_EMB        := qry_pe_itens_VL_LARGURA_EMB.AsFloat;
      VL_ALTURA_EMB         := qry_pe_itens_VL_ALTURA_EMB.AsFloat;
      VL_PESO_EMB           := qry_pe_itens_VL_PESO_EMB.AsFloat;
      VL_TOT_ITEM           := qry_pe_itens_VL_TOT_ITEM.AsFloat;
      VL_TOT_PESO_LIQ       := qry_pe_itens_VL_TOT_PESO_LIQ.AsFloat;
      VL_TOT_PESO_BRUTO     := qry_pe_itens_VL_TOT_PESO_BRUTO.AsFloat;
      VL_CUBAGEM            := qry_pe_itens_VL_CUBAGEM.AsFloat;
      VL_MLE                := qry_pe_itens_VL_MLE.AsFloat;
      VL_MCV                := qry_pe_itens_VL_MCV.AsFloat;
      TX_MERC               := qry_pe_itens_TX_MERCADORIA.AsString;
      CD_EMB_SUP            := qry_pe_itens_CD_EMBALAGEM_SUP.AsString;
      QT_POR_EMB_SUP        := qry_pe_itens_QT_POR_EMB_SUP.AsFloat;
      CD_EMB_CLIENTE        := qry_pe_itens_CD_EMBALAGEM_CLIENTE.AsString;
      CD_CLASSIF_EMBALAGEM_SUP := qry_pe_itens_CD_CLASSIF_EMBALAGEM_SUP.AsString;
      QT_EMBALAGEM_SUP      := qry_pe_itens_QT_EMBALAGEM_SUP.AsFloat;
      VL_POR_EMB_SUP        := qry_pe_itens_VL_POR_EMB_SUP.AsFloat;

      qry_pe_itens_.Append;

      qry_pe_itens_NR_PROCESSO.AsString          := NR_PROCESSO;
      qry_pe_itens_CD_UNID_NEG.AsString          := CD_UNID_NEG;
      qry_pe_itens_NR_PEDIDO_IMP.AsString        := NR_PEDIDO_IMP;
      qry_pe_itens_CD_MERCADORIA.AsString        := CD_MERCADORIA;
      qry_pe_itens_CD_NCM.AsString               := CD_NCM;
      qry_pe_itens_CD_NALADI_SH.AsString         := CD_NALADI_SH;
      qry_pe_itens_CD_UNID_MEDIDA.AsString       := CD_UNID_MEDIDA;
      qry_pe_itens_CD_EMBALAGEM.AsString         := CD_EMBALAGEM;
      qry_pe_itens_CD_CLASSIF_EMBALAGEM.AsString := CD_CLASSIF_EMBALAGEM;
      qry_pe_itens_CD_FABR_EXPO.AsString         := CD_FABR_EXPO;
      qry_pe_itens_QT_POR_EMB.AsFloat            := QT_POR_EMB;
      qry_pe_itens_QT_EMBALAGEM.AsFloat          := QT_EMBALAGEM;
      qry_pe_itens_QT_MERCADORIA.AsFloat         := QT_MERCADORIA;
      qry_pe_itens_VL_POR_EMB.AsFloat            := VL_POR_EMB;
      qry_pe_itens_VL_UNITARIO.AsFloat           := VL_UNITARIO;
      qry_pe_itens_VL_PESO_LIQ_UNIT.AsFloat      := VL_PESO_LIQ_UNIT;
      qry_pe_itens_VL_COMPRIMENTO_EMB.AsFloat    := VL_COMPRIMENTO_EMB;
      qry_pe_itens_VL_LARGURA_EMB.AsFloat        := VL_LARGURA_EMB;
      qry_pe_itens_VL_ALTURA_EMB.AsFloat         := VL_ALTURA_EMB;
      qry_pe_itens_VL_PESO_EMB.AsFloat           := VL_PESO_EMB;
      qry_pe_itens_VL_TOT_ITEM.AsFloat           := VL_TOT_ITEM;
      qry_pe_itens_VL_TOT_PESO_LIQ.AsFloat       := VL_TOT_PESO_LIQ;
      qry_pe_itens_VL_TOT_PESO_BRUTO.AsFloat     := VL_TOT_PESO_BRUTO;
      qry_pe_itens_VL_CUBAGEM.AsFloat            := VL_CUBAGEM;
      qry_pe_itens_VL_MLE.AsFloat                := VL_MLE;
      qry_pe_itens_VL_MCV.AsFloat                := VL_MCV;
      qry_pe_itens_TX_MERCADORIA.AsString        := TX_MERC;
      qry_pe_itens_CD_EMBALAGEM_SUP.AsString     := CD_EMB_SUP;
      qry_pe_itens_QT_POR_EMB_SUP.AsFloat        := QT_POR_EMB_SUP;
      qry_pe_itens_CD_EMBALAGEM_CLIENTE.AsString := CD_EMB_CLIENTE;
      qry_pe_itens_CD_CLASSIF_EMBALAGEM_SUP.AsString := CD_CLASSIF_EMBALAGEM_SUP;
      qry_pe_itens_QT_EMBALAGEM_SUP.AsFloat      := QT_EMBALAGEM_SUP;
      qry_pe_itens_VL_POR_EMB_SUP.AsFloat        := VL_POR_EMB_SUP;

      no_tot_item := qry_pe_QT_TOTAL_ITENS.AsString;
      j := StrToInt( no_tot_item ) + 1;
      no_tot_item := StrZero( j, 3 );

      qry_pe_.Edit;
      qry_pe_QT_TOTAL_ITENS.AsString := no_tot_item;
      qry_pe_itens_NR_ITEM.AsString  := no_tot_item;

      qry_pe_.Post;
      qry_pe_itens_.Post;

      qry_pe_.Close;
      qry_pe_itens_.Close;

      qry_pe_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
      qry_pe_.Prepare;
      qry_pe_.Open;

      qry_pe_Itens_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
      qry_pe_Itens_.Prepare;
      qry_pe_Itens_.Open;
      qry_pe_Itens_.Locate('NR_PROCESSO;NR_ITEM', VarArrayOf ([str_nr_processo, no_tot_item]), [loCaseInsensitive]);

      datm_main.db_broker.Commit;

      btn_salvar.Enabled     := False;
      mi_salvar.Enabled      := False;
      btn_cancelar.Enabled   := False;
      mi_cancelar.Enabled    := False;
      btn_novo_item.Enabled  := True;
      mi_novo_item.Enabled   := True;
    end;

  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

function Tfrm_pe_itens.Consiste : Boolean;
begin
  Consiste := True;

  if datm_PE_Itens.qry_pe_itens_.State in [dsInsert, dsEdit] then
  begin

    {NCM}
    if dbedt_cd_ncm.Text <> '' then
    begin
      If Not lNaoConsiste then
      begin
        datm_pe_itens.qry_ncm_.Close;
        datm_pe_itens.qry_ncm_.ParamByName('CODIGO').AsString := dbedt_cd_ncm.Text;
        datm_pe_itens.qry_ncm_.Prepare;
        datm_pe_itens.qry_ncm_.Open;

        if ( datm_pe_itens.qry_ncm_CODIGO.AsString <> Trim(dbedt_cd_ncm.Text) ) then
        begin
          BoxMensagem('Código do NCM inválido !',2);
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_ncm.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    {NALADI}
    if dbedt_cd_naladi.Text <> '' then
    begin
      If Not lNaoConsiste then
      begin
        datm_pe_itens.qry_naladi_.Close;
        datm_pe_itens.qry_naladi_.ParamByName('CODIGO').AsString := dbedt_cd_naladi.Text;
        datm_pe_itens.qry_naladi_.Prepare;
        datm_pe_itens.qry_naladi_.Open;

        if ( datm_pe_itens.qry_naladi_CODIGO.AsString <> Trim(dbedt_cd_naladi.Text) ) then
        begin
          BoxMensagem('Código do Naladi inválido !',2);
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_naladi.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    {Unidade Medida}
    ValidCodigo( dbedt_cd_unid_medida );
    if dbedt_cd_unid_medida.Text <> '' then
    begin
      If Not lNaoConsiste then
      begin
        if ( dbedt_nm_unid_medida.Text = '' ) then
        begin
          BoxMensagem('Código da Unidade de Medida inválido !',2);
          pgctrl_Item.ActivePage := ts_item1;
          dbedt_cd_unid_medida.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    {Fabricante / Produtor}
    if dbedt_cd_fabr_item.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_fabr_item );
      if ( dbedt_nm_fabr_item.Text = '' ) then
      begin
        BoxMensagem('Código do Fabricante / Produtor inválido !',2);
        pgctrl_Item.ActivePage := ts_item1;
        dbedt_cd_fabr_item.SetFocus;
        Consiste := False;
        Exit;
      end
    end;

    {Embalagem}
    ValidCodigo( dbedt_cd_embalagem );
    if dbedt_cd_embalagem.Text <> '' then
    begin
      if Not lNaoConsiste then
      begin
        if ( dbedt_nm_embalagem.Text = '' ) then
        begin
          BoxMensagem('Código da Embalagem inválido !',2);
          pgctrl_Item.ActivePage := ts_embalagem;
          dbedt_cd_embalagem.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      with datm_pe_itens do
      begin
        qry_embalagem_.Locate( 'CD_EMBALAGEM', qry_pe_itens_CD_EMBALAGEM.AsString, [] );
        if qry_embalagem_CD_EMBALAGEM.AsString = qry_pe_itens_CD_EMBALAGEM.AsString then
        begin
          if qry_pe_itens_CD_EMBALAGEM_SUP.AsString = '' then
             qry_pe_itens_CD_EMBALAGEM_SUP.AsString := qry_embalagem_CD_EMBALAGEM_SUP.AsString;

          if qry_pe_itens_QT_POR_EMB_SUP.AsFloat = 0 then
             qry_pe_itens_QT_POR_EMB_SUP.AsFloat := qry_embalagem_QT_EMBALAGEM_SUP.AsFloat;
        end;
      end;
    end;

    {Embalagem Superior}
    ValidCodigo( dbedt_cd_emb_sup );
    if dbedt_cd_emb_sup.Text <> '' then
    begin
      If Not lNaoConsiste then
      begin
        if ( dbedt_nm_emb_sup.Text = '' ) then
        begin
          BoxMensagem('Código da Embalagem Superior inválido !',2);
          pgctrl_Item.ActivePage := ts_embalagem;
          dbedt_cd_emb_sup.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

  end;
end;


procedure Tfrm_pe_itens.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;


function Tfrm_pe_itens.VerAlt;
begin
  VerAlt := True;

  if pgctrl_Item.ActivePage = ts_item1 then
  begin
    if ( ( datm_PE_Itens.qry_pe_itens_.State in [dsEdit] ) {and st_modificar} ) or
         ( datm_PE_Itens.qry_pe_itens_.State in [dsInsert] ) then
    begin
      if BoxMensagem('O Item do PE foi alterado! ' + #13#10 +
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

procedure Tfrm_pe_itens.Cancelar;
begin
  with datm_PE_Itens do
  begin
    if qry_pe_.State          in [dsEdit,dsInsert] then qry_pe_.Cancel;
    if qry_pe_itens_.State    in [dsEdit,dsInsert] then qry_pe_itens_.Cancel;
  end;
end;


procedure Tfrm_pe_itens.Desabilita_Entrada;
var i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TLabel ) then
       TLabel( Components[i] ).Enabled        := False;
    if ( Components[i] is TSpeedButton ) then
       TSpeedButton( Components[i] ).Enabled  := False;
    if ( Components[i] is TDBEdit ) then
       TDBEdit( Components[i] ).Enabled       := False;
    if ( Components[i] is TDBRadioGroup ) then
       TDBRadioGroup( Components[i] ).Enabled := False;
    if ( Components[i] is TRadioButton ) then
       TRadioButton( Components[i] ).Enabled  := False;
    if ( Components[i] is TDBCheckBox ) then
       TDBCheckBox( Components[i] ).Enabled   := False;
    if ( Components[i] is TDBLookupComboBox ) then
       TDBLookupComboBox( Components[i] ).Enabled := False;
    if ( Components[i] is TDBMemo ) then
       TDBMemo( Components[i] ).Enabled       := False;
  end;

  dbedt_nr_processo.Enabled := True;
  
  mi_novo_item.Enabled  := False;
  mi_salvar.Enabled     := False;
  mi_excluir.Enabled    := False;
  mi_cancelar.Enabled   := False;
end;

procedure Tfrm_pe_itens.Habilita_Entrada;
var i : integer;
begin

  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TLabel ) then
       TLabel( Components[i] ).Enabled        := True;
    if ( Components[i] is TSpeedButton ) then
       TSpeedButton( Components[i] ).Enabled  := True;
    if ( Components[i] is TDBEdit ) then
       TDBEdit( Components[i] ).Enabled       := True;
    if ( Components[i] is TDBRadioGroup ) then
       TDBRadioGroup( Components[i] ).Enabled := True;
    if ( Components[i] is TRadioButton ) then
       TRadioButton( Components[i] ).Enabled  := True;
    if ( Components[i] is TDBCheckBox ) then
       TDBCheckBox( Components[i] ).Enabled   := True;
    if ( Components[i] is TDBLookupComboBox ) then
       TDBLookupComboBox( Components[i] ).Enabled := True;
    if ( Components[i] is TDBMemo ) then
       TDBMemo( Components[i] ).Enabled       := True;
  end;

  if dbrdgrp_fabr_expo.Value <> '2' then
  begin
    lbl_fabr_prod.Enabled      := False;
    dbedt_cd_fabr_item.Enabled := False;
    dbedt_nm_fabr_item.Enabled := False;
    btn_co_fabr_item.Enabled   := False;
    dbedt_cd_fabr_item.TabStop := False;
  end;

end;

procedure Tfrm_pe_itens.dbedt_vl_unitarioEnter(Sender: TObject);
begin
  vl_old := datm_PE_Itens.qry_pe_itens_VL_UNITARIO.AsFloat;
end;

procedure Tfrm_pe_itens.dbedt_vl_itemEnter(Sender: TObject);
begin
  if datm_PE_Itens.qry_pe_itens_VL_TOT_ITEM.AsFloat = 0 then
  begin
    datm_PE_Itens.qry_pe_itens_VL_TOT_ITEM.AsFloat :=
                  Arredondar( datm_PE_Itens.qry_pe_itens_QT_MERCADORIA.AsFloat *
                              datm_PE_Itens.qry_pe_itens_VL_UNITARIO.AsFloat, 2 );
  end;
end;

procedure Tfrm_pe_itens.dbedt_cd_mercadoriaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = dbedt_cd_ncm            then btn_co_ncmClick(nil);
    if Sender = dbedt_cd_naladi         then btn_co_naladiClick(nil);
    if Sender = dbedt_cd_unid_medida    then btn_co_unid_medidaClick(nil);
    if Sender = dbedt_cd_embalagem      then btn_co_embalagemClick(nil);
    if Sender = dbedt_cd_emb_sup        then btn_co_emb_supClick(nil);
    if Sender = dbedt_cd_mercadoria     then btn_co_mercadoriaClick(nil);
    if Sender = dbedt_cd_fabr_item      then btn_co_fabr_itemClick(nil);
  end;

end;

procedure Tfrm_pe_itens.Verifica_Capa;
var
  nVlProd, nVlEmb, nVlCub, nVlPL, nVlExw : Double;

begin
  nVlProd := 0;
  nVlEmb  := 0;
  nVlCub  := 0;
  nVlPL   := 0;
  nVlExw  := 0;

  with datm_PE_Itens do
  begin
    if (btn_salvar.Enabled) and (btn_cancelar.Enabled) then Exit;

    if not (qry_pe_itens_.EOF) then
    begin

      qry_pe_itens_.First;

      while not (qry_pe_itens_.EOF) and
            (qry_pe_itens_NR_PROCESSO.AsString = str_nr_processo) do
      begin
        nVlProd := nVlProd + qry_pe_itens_QT_MERCADORIA.AsFloat;
        nVlEmb  := nVlEmb + qry_pe_itens_QT_EMBALAGEM.AsFloat;
        nVlCub  := nVlCub + qry_pe_itens_VL_CUBAGEM.AsFloat;
        nVlPL   := nVLPL + qry_pe_itens_VL_TOT_PESO_LIQ.AsFloat;
        nVlExw  := nVlExw + qry_pe_itens_VL_TOT_ITEM.AsFloat;

        qry_pe_itens_.Next;
      end;

      qry_pe_.Edit;
      qry_pe_VL_TOT_QTDE_PROD.AsFloat := nVlProd;
      qry_pe_VL_TOT_QTDE_EMBALAGEM.AsFloat := nVlEmb;
      qry_pe_VL_TOT_CUBAGEM.AsFloat := nVlCub;
      qry_pe_VL_PESO_LIQUIDO.AsFloat := nVlPL;
      qry_pe_VL_TOT_EXW.AsFloat := nVlExw;
      qry_pe_VL_TOT_FOB.AsFloat := nVlExw;
      qry_pe_VL_TOT_MCV.AsFloat := nVlExw + qry_pe_VL_FRETE.AsFloat + qry_pe_VL_SEGURO.AsFloat;
      qry_pe_.Post;

    end;
  end;

end;

procedure Tfrm_pe_itens.pgctrl_ItemChange(Sender: TObject);
begin
{
  if pgctrl_Item.ActivePage = ts_item1 then
  begin
    DBnavigator.Enabled  := True;
    btn_duplicar.Enabled := True;
    mi_duplicar.Enabled  := True;
    btn_excluir.Enabled  := True;
    mi_excluir.Enabled   := True;
  end;
}
end;

procedure Tfrm_pe_itens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

procedure Tfrm_pe_itens.dbedt_vl_unitarioExit(Sender: TObject);
begin
  if ( datm_PE_Itens.qry_pe_itens_VL_UNITARIO.AsFloat <> vl_old ) then
  begin
    datm_PE_Itens.qry_pe_itens_VL_TOT_ITEM.AsFloat := datm_PE_Itens.qry_pe_itens_VL_UNITARIO.AsFloat *
                                                      datm_PE_Itens.qry_pe_itens_QT_MERCADORIA.AsFloat;
  end

end;

procedure Tfrm_pe_itens.dbedt_qt_mercadoriaEnter(Sender: TObject);
begin
  vl_old := datm_pe_Itens.qry_pe_itens_QT_MERCADORIA.AsFloat;
end;


procedure Tfrm_pe_itens.btn_co_ncmClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TNCM',
                datm_pe_itens.qry_pe_itens_CD_NCM,
                'NCM', 1, '', 'TQuery');
  dbedt_cd_ncmExit(nil);
end;

procedure Tfrm_pe_itens.btn_co_naladiClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TNALADISH',
                datm_PE_Itens.qry_pe_itens_CD_NALADI_SH,
                'NALADI/SH', 1, '', 'TQuery');
  dbedt_cd_naladiExit(nil);
end;

procedure Tfrm_pe_itens.btn_co_unid_medidaClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TUNID_MEDIDA_BROKER',
                datm_PE_Itens.qry_pe_itens_CD_UNID_MEDIDA,
                'Unidade de Medida', 32, '', 'TQuery');
  dbedt_cd_unid_medidaExit(nil);
end;

procedure Tfrm_pe_itens.btn_co_embalagemClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TEMBALAGEM',
                datm_PE_Itens.qry_pe_itens_CD_EMBALAGEM,
                'Embalagem', 43, '', 'TQuery');
  dbedt_cd_embalagemExit(nil);
end;

procedure Tfrm_pe_itens.dbedt_cd_ncmExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_itens.dbedt_cd_naladiExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_itens.dbedt_cd_unid_medidaExit(Sender: TObject);
begin
  CodExits;

  if datm_pe_itens.qry_pe_itens_.State in [dsEdit,dsInsert] then
  begin
    if dbedt_cd_unid_medida.Text = '103' then
    begin
      if datm_pe_itens.qry_pe_itens_QT_EMBALAGEM.AsFloat = 0 then
      begin
        datm_pe_itens.qry_pe_itens_QT_EMBALAGEM.AsFloat := datm_pe_itens.qry_pe_itens_QT_MERCADORIA.AsFloat;
        dbedt_qt_por_emb_supExit(nil);
      end;

      dbedt_qt_por_embalagem.Color := clMenu;
      dbedt_vl_por_emb.Color       := clMenu;
      dbedt_qt_por_embalagem.ReadOnly := True;
      dbedt_vl_por_emb.ReadOnly       := True;
      dbedt_qt_por_embalagem.TabStop  := False;
      dbedt_vl_por_emb.TabStop        := False;
    end;
  end;
end;

procedure Tfrm_pe_itens.dbedt_cd_embalagemExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_itens.dbedt_cd_mercadoriaChange(Sender: TObject);
begin
  with datm_PE_Itens do
  begin
    if not (datm_PE_Itens.qry_pe_itens_QT_MERCADORIA.IsNull) then
       if not (datm_PE_Itens.qry_pe_itens_VL_UNITARIO.IsNull) then
          if datm_PE_Itens.qry_pe_itens_.State in [dsEdit,dsInsert] then
             if Arredondar( datm_PE_Itens.qry_pe_itens_QT_MERCADORIA.AsFloat *
                            datm_PE_Itens.qry_pe_itens_VL_UNITARIO.AsFloat, 2 ) <> datm_PE_Itens.qry_pe_itens_VL_TOT_ITEM.AsFloat then
                datm_PE_Itens.qry_pe_itens_VL_TOT_ITEM.AsFloat :=
                       Arredondar( datm_PE_Itens.qry_pe_itens_QT_MERCADORIA.AsFloat *
                                   datm_PE_Itens.qry_pe_itens_VL_UNITARIO.AsFloat, 2 );
  end;
end;


procedure Tfrm_pe_itens.dbedt_qt_por_embalagemExit(Sender: TObject);
var
  nNum1, nNum2, nNum3 : Double;

begin

  with datm_PE_Itens do
  begin
    if not (qry_pe_itens_.State in [dsEdit,dsInsert]) then
       exit;

    nNum1 := StrToFloat( TiraPonto(dbedt_qt_mercadoria.Text) );
    nNum2 := StrToFloat( TiraPonto(dbedt_qt_por_embalagem.Text) );

    if nNum2 = 1  then
       if nNum1 <>  0 then
          qry_pe_itens_QT_EMBALAGEM.AsFloat := qry_pe_itens_QT_MERCADORIA.AsFloat;

    if ( nNum1 = 0 ) or ( nNum2 = 0 ) then
       Exit;

    if dbedt_cd_unid_medida.Text <> '103' then
    begin
      {Quantidade de Embalagens}
      if Int( nNum1 / nNum2 ) > 0 then
         qry_pe_itens_QT_EMBALAGEM.AsFloat := Int( nNum1 / nNum2 )
      else
         qry_pe_itens_QT_EMBALAGEM.AsFloat := 1;
    end;

    nNum3 := StrToFloat( TiraPonto(dbedt_vl_unitario.Text) );
    if ( nNum3 = 0 ) then
       Exit;

    {Valor por Embalagem}
    qry_pe_itens_VL_POR_EMB.AsFloat := nNum3 * nNum2;

    {Valor total do Item}
    qry_pe_itens_VL_TOT_ITEM.AsFloat := nNum1 * nNum3;
  end;
end;

procedure Tfrm_pe_itens.dbedt_alt_embExit(Sender: TObject);
var
  nNum1, nNum2, nNum3, nNum4 : Double;

begin

  {Cubagem}
  If datm_pe_itens.qry_pe_itens_.State in [dsEdit,dsInsert] then
  begin
    nNum1 := StrToFloat( TiraPonto(dbedt_compr_emb.Text) );
    nNum2 := StrToFloat( TiraPonto(dbedt_larg_emb.Text) );
    nNum3 := StrToFloat( TiraPonto(dbedt_alt_emb.Text) );
    nNum4 := StrToFloat( TiraPonto(dbedt_qt_de_emb.Text) );

    If (nNum1 = 0) or (nNum2 = 0) or (nNum3 = 0) or (nNum4 = 0) then
       exit;

    nNum1 := StrToFloat( TiraPonto(dbedt_compr_emb.Text) ) * StrToFloat( TiraPonto(dbedt_larg_emb.Text) ) *
             StrToFloat( TiraPonto(dbedt_alt_emb.Text) ) * StrToFloat( TiraPonto(dbedt_qt_de_emb.Text) );

    datm_pe_itens.qry_pe_itens_VL_CUBAGEM.AsFloat := nNum1;
  end;
end;

procedure Tfrm_pe_itens.dbedt_peso_liquidoExit(Sender: TObject);
var
  nNum1, nNum2 : Double;

begin
  If datm_pe_itens.qry_pe_itens_.State in [dsEdit,dsInsert] then
  begin
    nNum1 := StrToFloat( TiraPonto(dbedt_qt_mercadoria.Text) );
    nNum2 := StrToFloat( TiraPonto(dbedt_peso_liquido.Text) );

    If (nNum1 = 0) or (nNum2 = 0) then
       exit;

    datm_pe_itens.qry_pe_itens_VL_TOT_PESO_LIQ.AsFloat := nNum1 * nNum2;
  end;
end;

procedure Tfrm_pe_itens.dbedt_qt_mercadoriaExit(Sender: TObject);
var
  nNum1, nNum2 : Double;

begin
  if ( datm_PE_Itens.qry_pe_itens_QT_MERCADORIA.AsFloat <> vl_old ) then
  begin
    datm_PE_Itens.qry_pe_itens_VL_TOT_ITEM.AsFloat := datm_PE_Itens.qry_pe_itens_QT_MERCADORIA.AsFloat *
                                                      datm_PE_Itens.qry_pe_itens_VL_UNITARIO.AsFloat;

    nNum1 := StrToFloat( TiraPonto(dbedt_qt_mercadoria.Text) );
    nNum2 := StrToFloat( TiraPonto(dbedt_qt_por_embalagem.Text) );

    if dbedt_cd_unid_medida.Text = '103' then
    begin
      if nNum1 <> 0 then
      begin
        datm_pe_itens.qry_pe_itens_QT_EMBALAGEM.AsFloat := datm_pe_itens.qry_pe_itens_QT_MERCADORIA.AsFloat;
        dbedt_qt_por_emb_supExit(nil);
      end;
    end;

    If (nNum1 = 0) or (nNum2 = 0) then
       exit;

    {Quantidade de Embalagens}
    if dbedt_cd_unid_medida.Text <> '103' then
    begin
      If Int( nNum1 / nNum2 ) > 0 then
         datm_pe_itens.qry_pe_itens_QT_EMBALAGEM.AsFloat := Int( nNum1 / nNum2 )
      else
         datm_pe_itens.qry_pe_itens_QT_EMBALAGEM.AsFloat := 1;
    end;

    dbedt_qt_por_embalagemExit(nil);
    dbedt_qt_por_emb_supExit(nil);

    {Total do Peso Liquido}
    nNum1 := StrToFloat( TiraPonto(dbedt_qt_mercadoria.Text) );
    nNum2 := StrToFloat( TiraPonto(dbedt_peso_liquido.Text) );
    If (nNum1 = 0) or (nNum2 = 0) then
       exit;

    datm_pe_itens.qry_pe_itens_VL_TOT_PESO_LIQ.AsFloat := nNum1 * nNum2;
  end;
end;






procedure Tfrm_pe_itens.btn_co_emb_supClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TEMBALAGEM',
                datm_PE_Itens.qry_pe_itens_CD_EMBALAGEM_SUP,
                'Embalagem', 43, '', 'TQuery');
  dbedt_cd_emb_supExit(nil);
end;

procedure Tfrm_pe_itens.dbedt_cd_emb_supExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_itens.dbedt_qt_por_emb_supExit(Sender: TObject);
var
  nNum1, nNum2, nNum3 : Double;
begin
  with datm_PE_Itens do
  begin
    if Not ( qry_pe_itens_.State in [dsEdit,dsInsert] ) then
       Exit;

    if Trim( dbedt_cd_emb_sup.Text ) = '' then
       Exit;

    nNum1 := StrToFloat( TiraPonto( dbedt_qt_de_emb.Text ) );
    nNum2 := StrToFloat( TiraPonto( dbedt_qt_por_emb_sup.Text ) );
    if ( nNum1 = 0 ) or ( nNum2 = 0 ) then
       Exit;

    {Quantidade de Embalagens}
    if Int( nNum1 * nNum2 ) > 0 then
    begin
      qry_pe_itens_QT_EMBALAGEM_SUP.AsFloat := Int( nNum1 / nNum2 );

      if Int( nNum1 / nNum2 ) <> ( nNum1 / nNum2 ) then
         qry_pe_itens_QT_EMBALAGEM_SUP.AsFloat := Int( nNum1 / nNum2 ) + 1;

      if qry_pe_itens_QT_EMBALAGEM_SUP.AsFloat <= 0 then
         qry_pe_itens_QT_EMBALAGEM_SUP.AsFloat := 1
    end
    else
       qry_pe_itens_QT_EMBALAGEM_SUP.AsFloat := 1;

    nNum3 := StrToFloat( TiraPonto(dbedt_vl_unitario.Text) );
    if ( nNum3 = 0 ) then
       Exit;

    {Valor por Embalagem}
    qry_pe_itens_VL_POR_EMB_SUP.AsFloat := nNum3 * ( qry_pe_itens_VL_POR_EMB.AsFloat * qry_pe_itens_QT_EMBALAGEM_SUP.AsFloat );
  end;
end;

procedure Tfrm_pe_itens.btn_co_fabr_itemClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TEMPRESA_EST',
                datm_pe_itens.qry_pe_itens_CD_FABRICANTE,
                'Fabricante / Produtor', 38, '', 'TQuery');
  dbedt_cd_fabr_itemExit(nil);
end;

procedure Tfrm_pe_itens.dbedt_cd_fabr_itemExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_itens.dbrdgrp_fabr_expoChange(Sender: TObject);
begin
  if datm_pe_itens.qry_pe_itens_.State in [dsEdit,dsInsert] then
  begin
    if dbrdgrp_fabr_expo.Value = '2' then
    begin
      lbl_fabr_prod.Enabled      := True;
      dbedt_cd_fabr_item.Enabled := True;
      dbedt_nm_fabr_item.Enabled := True;
      btn_co_fabr_item.Enabled   := True;
      dbedt_cd_fabr_item.TabStop := True;
    end
    else
    begin
      dbedt_cd_fabr_item.Text    := '';
      dbedt_nm_fabr_item.Text    := '';
      lbl_fabr_prod.Enabled      := False;
      dbedt_cd_fabr_item.Enabled := False;
      dbedt_nm_fabr_item.Enabled := False;
      btn_co_fabr_item.Enabled   := False;
      dbedt_cd_fabr_item.TabStop := False;
    end;
  end;

end;

end.

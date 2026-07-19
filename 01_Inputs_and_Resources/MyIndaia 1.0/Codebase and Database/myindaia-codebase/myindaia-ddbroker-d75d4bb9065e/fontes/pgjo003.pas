UNIT pgli003;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Menus, Buttons, ComCtrls, Grids,
  DBGrids, Db, DBTables, DBCGrids, PGGP001;

type
  Tfrm_LI_Itens = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_novo_item: TSpeedButton;
    Bevel11: TBevel;
    Label6: TLabel;
    DBNavigator: TDBNavigator;
    dbedt_nm_item_inicial_li: TDBEdit;
    dbedt_item_final_li: TDBEdit;
    Label17: TLabel;
    btn_capa_li: TSpeedButton;
    btn_excluir: TSpeedButton;
    menu_manut_cadastro: TMainMenu;
    mi_novo_item: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    btn_duplica: TSpeedButton;
    pgctrl_Item: TPageControl;
    ts_item1: TTabSheet;
    Label20: TLabel;
    Label21: TLabel;
    btn_co_pais_aquisicao: TSpeedButton;
    Label22: TLabel;
    btn_co_pais_origem: TSpeedButton;
    Label23: TLabel;
    Label24: TLabel;
    btn_co_exportador: TSpeedButton;
    btn_co_fabricante: TSpeedButton;
    btn_co_produto: TSpeedButton;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    btn_co_unid_med: TSpeedButton;
    btn_co_naladi_sh: TSpeedButton;
    btn_co_ncm: TSpeedButton;
    Label36: TLabel;
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
    ts_item2_li: TTabSheet;
    Label4: TLabel;
    dbedt_cd_ncm2: TDBEdit;
    dbedt_nm_ncm: TDBEdit;
    dbg_nve: TDBGrid;
    Label1: TLabel;
    dbedt_vl_unitario_mcv: TDBEdit;
    lbl_Destaque: TLabel;
    dbedt_destaque: TDBEdit;
    dbedt_nm_mercadoria: TDBEdit;
    dbedt_nm_unidade: TDBEdit;
    dbedt_nm_exportador: TDBEdit;
    dbedt_nm_fabricante: TDBEdit;
    dbedt_nm_pais_aquisicao: TDBEdit;
    dbedt_nm_pais_origem: TDBEdit;
    edt_unid_med_estat: TEdit;
    mi_excluir: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_novo_itemClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbedt_vl_unitario_liEnter(Sender: TObject);
    procedure dbedt_vl_unitario_liExit(Sender: TObject);
    procedure dbedt_peso_liqEnter(Sender: TObject);
    procedure dbedt_peso_liq_liExit(Sender: TObject);
    procedure dbedt_pc_desconto_liEnter(Sender: TObject);
    procedure dbedt_cd_ncmExit(Sender: TObject);
    procedure dbedt_qt_mercadoria_liChange(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_capa_liClick(Sender: TObject);
    procedure btn_adicao_diClick(Sender: TObject);
    procedure btn_co_unid_medClick(Sender: TObject);
    procedure btn_co_exportador_liClick(Sender: TObject);
    procedure btn_co_fabricante_liClick(Sender: TObject);
    procedure btn_co_pais_origemClick(Sender: TObject);
    procedure btn_co_pais_aquisicaoClick(Sender: TObject);
    procedure btn_co_ncmClick(Sender: TObject);
    procedure btn_co_naladi_shClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure dbedt_cd_mercadoriaExit(Sender: TObject);
    procedure btn_duplicaClick(Sender: TObject);
    procedure dbedt_cd_unid_comercialExit(Sender: TObject);
    procedure dbedt_cd_exportador_liExit(Sender: TObject);
    procedure dbedt_cd_fabricante_liExit(Sender: TObject);
    procedure dbedt_cd_pais_aquisicao_liExit(Sender: TObject);
    procedure dbedt_cd_pais_origem_liExit(Sender: TObject);
    procedure dbedt_cd_naladi_sh_liExit(Sender: TObject);
    procedure dbedt_nm_unidadeExit(Sender: TObject);
    procedure dbedt_nm_mercadoriaExit(Sender: TObject);
    procedure dbedt_cd_exportadorExit(Sender: TObject);
    procedure dbedt_cd_fabricanteExit(Sender: TObject);
    procedure dbedt_cd_pais_aquisicaoExit(Sender: TObject);
    procedure dbedt_cd_pais_origemExit(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure btn_co_fabricanteClick(Sender: TObject);
    procedure dbedt_cd_naladi_shExit(Sender: TObject);
    procedure dbedt_vl_unitarioEnter(Sender: TObject);
    procedure dbedt_vl_itemEnter(Sender: TObject);
    procedure dbrgrp_fabr_expoChange(Sender: TObject);
    procedure dbedt_peso_liqExit(Sender: TObject);
    procedure dbm_descricao_mercadoriaExit(Sender: TObject);
    procedure dbedt_cd_mercadoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_qt_mercadoriaChange(Sender: TObject);
    procedure dbedt_qt_mercadoria_liEnter(Sender: TObject);

  private
    { Private declarations }
    function VerAlt            : Boolean;
    function Grava             : Boolean;
    function Consiste : Boolean;

    procedure Cancelar;
    procedure CodExits;
    procedure Desabilita_Entrada;
    procedure Habilita_Entrada;

  public
    vl_old, vl_new, vl2_old, vl2_new   : double;
    nr_adicao, nr_item                 : string[3];
    lNaoConsiste, in_LI_Montada, in_abrindo_itens    : Boolean;
    { Public declarations }
    procedure SalvaDadosNaoGravados;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
  end;

var
  frm_LI_Itens: Tfrm_LI_Itens;

implementation

uses GSMLIB, PGDI020, PGSM012, PGSM096, PGGP017, PGSM103, PGDI003, PGSM117, PGSM118,
  PGLI006, PGLI001, PGLI002, PGLI005;

{$R *.DFM}


procedure Tfrm_LI_Itens.SalvaDadosNaoGravados;
begin
  {
  if datm_DI_Itens.qry_ad_itens_.State in [dsEdit,dsInsert] then
  begin
    if datm_DI_Itens.qry_ad_itens_NR_ITEM.AsString = '***' then datm_DI_Itens.qry_ad_itens_.Cancel
    else datm_DI_Itens.qry_ad_itens_.Post;
  end;
  }
end;

procedure Tfrm_LI_Itens.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin

  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo := nCodigo;
  frm_consulta_padrao.Tabela.TableName := cNomeTabela;

  frm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine := fCampo;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

end;



procedure Tfrm_LI_Itens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_LI_Itens do
    begin
      { Fecha todas as tabelas }
      qry_unid_medida_.Close;
      tbl_ncm_.Close;
      tbl_naladi_sh_.Close;

      qry_li_.Close;
      qry_li_itens_.Close;

      Free;
      Action := caFree;
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
Var
  nNum, Code : Integer;
begin

  frm_LI_Itens.Caption := Trim( frm_LI_itens.Caption ) + ' [ ' + Trim( Copy( str_nr_processo, 5, 14 ) ) + ' ] ';
  in_abrindo_itens := False;

  datm_LI_Itens.qry_LI_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
  datm_LI_Itens.qry_LI_.Prepare;
  datm_LI_Itens.qry_LI_.Open;

  Val( datm_LI_Itens.qry_li_QT_TOTAL_ITEM.AsString, nNum, Code );

  if in_LI_Montada then
    begin
      {}
    end
  else
    if nNum = 0 then
       Desabilita_Entrada
    else
      begin
        Habilita_Entrada;
        btn_salvar.Enabled   := False;
        btn_cancelar.Enabled := False;
        mi_salvar.Enabled    := False;
        mi_cancelar.Enabled  := False;
      end;

  with datm_LI_Itens do
  begin
    qry_unid_medida_.Close;
    qry_unid_medida_.Prepare;
    qry_unid_medida_.Open;
    tbl_ncm_.Close;
    tbl_ncm_.Open;
    tbl_naladi_sh_.Close;
    tbl_naladi_sh_.Open;
  end;

  datm_LI_Itens.qry_li_itens_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
  datm_LI_Itens.qry_li_itens_.Prepare;
  datm_LI_Itens.qry_li_itens_.Open;

  btn_novo_item.Enabled := True;

  if datm_li_itens.qry_li_itens_.RecordCount > 0 then
     btn_duplica.Enabled := True
  else
     btn_duplica.Enabled := False;

  btn_sair.Enabled       := True;

end;

procedure Tfrm_LI_Itens.btn_novo_itemClick(Sender: TObject);
begin

  datm_LI_Itens.qry_li_Itens_.Close;
  datm_LI_Itens.qry_li_Itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  datm_LI_Itens.qry_li_Itens_.Prepare;
  datm_LI_Itens.qry_li_Itens_.Open;

  Habilita_entrada;

  with datm_LI_Itens do
  begin
    qry_li_itens_.Append;
    qry_li_itens_NR_PROCESSO.AsString       := str_nr_processo;

    NullToZero( qry_LI_Itens_QT_MERC_UN_COMERC );
    NullToZero( qry_LI_Itens_VL_UNIT_MLE       );
    NullToZero( qry_LI_Itens_VL_TOTAL_MLE      );
    NullToZero( qry_LI_Itens_PL_MERCADORIA     );
    NullToZero( qry_LI_Itens_VL_UNIT_MCV       );
    NullToZero( qry_LI_Itens_QT_MERC_UN_ESTAT  );
  end;

  btn_novo_item.Enabled := False;
  mi_novo_item.Enabled  := False;
  btn_duplica.Enabled   := False;
  btn_capa_li.Enabled   := False;
  btn_excluir.Enabled   := False;
  mi_excluir.enabled    := False;

  DBNavigator.Enabled   := False;

end;

procedure Tfrm_LI_Itens.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava    then Exit;

end;

function Tfrm_LI_Itens.Grava;
var
  i : Integer;
begin
  Grava := True;
  try
    datm_main.db_broker.StartTransaction;
    with datm_LI_Itens do
    begin

      if qry_li_itens_.State in [dsInsert] then
      begin

        if not (qry_li_.State in [dsEdit]) then datm_LI_Itens.qry_li_.Edit;

        if not qry_li_QT_TOTAL_ITEM.IsNull then
           begin
             i := StrToInt( qry_li_QT_TOTAL_ITEM.AsString );
             i := i + 1;

             qry_li_QT_TOTAL_ITEM.AsString := StrZero( i, 3 );          // Quantidade Total dos Itens
             qry_li_itens_NR_ITEM.AsString := StrZero( i, 3 );          // Numero do Item
           end
        else
           begin
             qry_li_QT_TOTAL_ITEM.AsString := '001';                    // Quantidade Total dos Itens
             qry_li_itens_NR_ITEM.AsString := '001';                    // Numero do Item
           end;
      end;

      datm_LI_Itens.qry_li_.Edit;
      
      if qry_li_itens_.State in [dsEdit,dsInsert] then
      begin
        qry_li_.Post;
        qry_li_itens_.Post;

        nr_item := qry_li_itens_NR_ITEM.AsString;

        qry_li_itens_.Close;
        qry_li_itens_.Prepare;
        qry_li_itens_.Open;
        qry_li_itens_.Locate('NR_PROCESSO;NR_ITEM', VarArrayOf ([str_nr_processo, nr_item]), [loCaseInsensitive]);

        datm_main.db_broker.Commit;
      end;
    end;

  except
    on E: Exception do
    begin
      TrataErro(E);
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      Grava := False;
    end;
  end;

  btn_salvar.enabled    := False;
  mi_salvar.enabled     := False;
  btn_cancelar.enabled  := False;
  mi_cancelar.enabled   := False;
  btn_novo_item.enabled := True;
  mi_novo_item.enabled  := True;
  btn_excluir.enabled   := True;
  mi_excluir.enabled    := True;
  btn_duplica.Enabled   := True;
  btn_capa_li.Enabled   := True;

  DBnavigator.Enabled   := True;

end;


procedure Tfrm_LI_Itens.btn_cancelarClick(Sender: TObject);
begin

  datm_LI_Itens.qry_li_.Cancel;
  datm_LI_Itens.qry_li_itens_.Cancel;

  if Not in_LI_Montada then
  begin
    btn_novo_item.Enabled := True;
    mi_novo_item.Enabled  := True;
    DbNavigator.Enabled   := True;
    btn_excluir.Enabled   := True;
    mi_excluir.Enabled    := True;
    btn_duplica.Enabled   := True;
    btn_capa_li.Enabled   := True;
  end;

  btn_salvar.Enabled        := False;
  btn_cancelar.Enabled      := False;
  mi_salvar.Enabled         := False;
  mi_cancelar.Enabled       := False;

  Cancelar;
end;

procedure Tfrm_LI_Itens.dbedt_vl_unitario_liEnter(Sender: TObject);
begin
  vl_old := datm_LI_Itens.qry_li_itens_VL_UNIT_MLE.AsFloat;
end;

procedure Tfrm_LI_Itens.dbedt_vl_unitario_liExit(Sender: TObject);
begin
  if ( datm_LI_Itens.qry_li_itens_VL_UNIT_MLE.AsFloat <> vl_old ) then
  begin
    // Caso esteja alterando o valor recalcula
    datm_LI_Itens.qry_li_itens_VL_TOTAL_MLE.AsFloat := 0;
  end
end;

procedure Tfrm_LI_Itens.dbedt_qt_mercadoria_liEnter(Sender: TObject);
begin
  vl_old := datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat;
end;


procedure Tfrm_LI_Itens.dbedt_peso_liq_liExit(Sender: TObject);
begin
  if ( datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat <> vl_old ) and ( datm_DI_Itens.qry_ad_itens_CD_TIPO_CALCULO_ITEM.AsInteger = 4 ) then
  begin
    {
    // Caso esteja alterando o valor recalcula
    datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat := 0;
    dbedt_vl_itemEnter(Sender);
    }
  end
end;

procedure Tfrm_LI_Itens.dbedt_pc_desconto_liEnter(Sender: TObject);
begin
  vl_old := datm_DI_Itens.qry_ad_itens_PC_DESCONTO_MERC.AsFloat;
end;


procedure Tfrm_LI_Itens.dbedt_cd_ncmExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_Itens.dbedt_qt_mercadoria_liChange(Sender: TObject);
begin

  if Showing then
  begin
    if datm_LI_Itens.qry_li_itens_.Modified then
    begin
      btn_novo_item.Enabled := False;
      btn_duplica.Enabled   := False;
      btn_salvar.Enabled    := True;
      btn_cancelar.Enabled  := True;
      mi_novo_item.Enabled  := False;
      mi_salvar.Enabled     := True;
      mi_cancelar.Enabled   := True;
    end
    else
    begin
      if Not in_LI_Montada then
      begin
        btn_duplica.Enabled   := True;
        btn_novo_item.Enabled := True;
        mi_novo_item.Enabled  := True;
      end;
      btn_salvar.Enabled      := False;
      btn_cancelar.Enabled    := False;
      mi_salvar.Enabled       := False;
      mi_cancelar.Enabled     := False;
    end;
  end;
end;

procedure Tfrm_LI_Itens.btn_excluirClick(Sender: TObject);
begin

  If not in_LI_Montada then
  begin
     if BoxMensagem( 'Este item será excluído! Confirma exclusão?', 1 ) then
     begin
       nr_item := datm_LI_Itens.qry_li_itens_NR_ITEM.AsString;
       datm_LI_Itens.qry_li_itens_.Close;
       datm_LI_Itens.qry_li_.Close;
       with datm_LI_Itens do
       begin
           try
             datm_main.db_broker.StartTransaction;

             CloseStoredProc( sp_li_apaga_renum_itens );

             { Apaga e renumera itens }
             sp_li_apaga_renum_itens.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
             sp_li_apaga_renum_itens.ParamByName('@NR_ITEM').AsString := nr_item;

             ExecStoredProc( sp_li_apaga_renum_itens );
             CloseStoredProc( sp_li_apaga_renum_itens );

             datm_main.db_broker.Commit;
           Except
             on E: Exception do
             begin
               TrataErro(E);
               if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
             end;
           end;

         qry_li_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
         qry_li_.Prepare;
         qry_li_.Open;

         qry_li_itens_.Close;
         qry_li_itens_.Prepare;
         qry_li_itens_.Open;
         qry_li_itens_.Locate('NR_PROCESSO', str_nr_processo, []);

         if qry_li_itens_.RecordCount > 0 then btn_duplica.Enabled := True;
       end;
     end
  else
     BoxMensagem( 'Este item não pode ser excluído!', 3 )
  end;
end;

procedure Tfrm_LI_Itens.btn_capa_liClick(Sender: TObject);
begin
  Close;
  frm_LI.i_seletor := 1;
end;

procedure Tfrm_LI_Itens.btn_adicao_diClick(Sender: TObject);
begin
  if datm_DI_Itens.qry_di_QT_ADICOES.AsFloat <= 0 then
  begin
    BoxMensagem('Não existem adições' + #10#13 + 'para este processo!', 3);
    Exit;
  end;

  SalvaDadosNaoGravados;
  close;
end;


procedure Tfrm_LI_Itens.btn_co_unid_medClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TUNID_MEDIDA',
                datm_LI_itens.qry_li_itens_CD_UN_MED_COMERC,
                'Unidade de Medida', 1, '');
  dbedt_cd_unid_comercialExit(nil);

end;

procedure Tfrm_LI_Itens.btn_co_exportador_liClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  frm_emp_est.Cons_OnLine := datm_LI_Itens.qry_li_itens_CD_EXPORTADOR;
  with frm_emp_est do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_LI_Itens.qry_li_itens_.State in [dsEdit, dsInsert] ) then datm_LI_Itens.qry_li_itens_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_LI_Itens.btn_co_fabricante_liClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  frm_emp_est.Cons_OnLine := datm_LI_Itens.qry_li_itens_CD_FABRICANTE;
  with frm_emp_est do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_LI_Itens.qry_li_itens_.State in [dsEdit, dsInsert] ) then datm_LI_Itens.qry_li_itens_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_LI_Itens.btn_co_pais_origemClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TPAIS',
                datm_LI_itens.qry_li_itens_CD_PAIS_ORIGEM,
                'País', 1, '');
  dbedt_cd_pais_origemExit(nil)
end;

procedure Tfrm_LI_Itens.btn_co_pais_aquisicaoClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TPAIS',
                datm_LI_itens.qry_li_itens_CD_PAIS_AQUISICAO,
                'País', 1, '');
  dbedt_cd_pais_aquisicaoExit(nil)
end;

procedure Tfrm_LI_Itens.btn_co_ncmClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TNCM',
                datm_LI_itens.qry_li_itens_CD_NCM_SH,
                'NCM', 1, '');
  dbedt_cd_ncmExit(nil)
end;

procedure Tfrm_LI_Itens.btn_co_naladi_shClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TNALADISH',
                datm_LI_itens.qry_li_itens_CD_NALADI_SH,
                'NALADI', 1, '');
  dbedt_cd_naladi_shexit(nil);
end;


procedure Tfrm_LI_Itens.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;
  Application.CreateForm( Tdatm_LI_Itens, datm_LI_Itens );

end;

procedure Tfrm_LI_Itens.btn_co_produtoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_mercadoria, frm_mercadoria);

  datm_mercadoria.qry_lista_.Close;
  datm_mercadoria.qry_lista_.Filter := 'CD_IMPORTADOR = '+datm_LI_Itens.qry_li_CD_IMPORTADOR.AsString;
  datm_mercadoria.qry_lista_.Filtered := True;
  datm_mercadoria.qry_lista_.Prepare;
  datm_mercadoria.qry_lista_.Open;

  frm_mercadoria.cImportador := datm_LI_Itens.qry_li_CD_IMPORTADOR.AsString;
  datm_mercadoria.tbl_empresa_nac_.Open;
  if datm_mercadoria.tbl_empresa_nac_.FindKey([frm_mercadoria.cImportador]) then
    frm_mercadoria.cGrupo := datm_mercadoria.tbl_empresa_nac_CD_GRUPO.AsString;

  frm_mercadoria.Cons_OnLine := datm_LI_Itens.qry_li_itens_CD_MERCADORIA;
  with frm_mercadoria do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_LI_Itens.qry_li_itens_.State in [dsEdit, dsInsert] ) then
             datm_LI_Itens.qry_li_itens_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;

  if dbedt_cd_mercadoria.Visible then dbedt_cd_mercadoriaExit(Sender);

end;

procedure Tfrm_LI_Itens.dbedt_cd_mercadoriaExit(Sender: TObject);
var Filter_Grupo : String;

begin

  if consiste then
  begin
    datm_LI_Itens.tbl_mercadoria_.Close;

    if Not datm_LI_Itens.tbl_empresa_nac_.Active then
      datm_LI_Itens.tbl_empresa_nac_.Open;
    if datm_LI_Itens.tbl_empresa_nac_.FindKey([datm_LI_Itens.qry_li_CD_IMPORTADOR.AsString]) then
       Filter_Grupo := datm_LI_Itens.tbl_empresa_nac_CD_GRUPO.AsString
    else
       Filter_Grupo := '';

    if Filter_Grupo = '' then
    begin
      if dbedt_cd_mercadoria.Text <> '' then datm_LI_Itens.tbl_mercadoria_.Filter :=
      'CD_IMPORTADOR = '+datm_LI_Itens.qry_li_CD_IMPORTADOR.AsString
      else datm_LI_Itens.tbl_mercadoria_.Filter := '';
    end
    else
    begin
      if dbedt_cd_mercadoria.Text <> '' then datm_LI_Itens.tbl_mercadoria_.Filter :=
      'CD_IMPORTADOR = '+datm_LI_Itens.qry_li_CD_IMPORTADOR.AsString + ' OR '+
      'CD_GRUPO = '+Filter_Grupo
      else datm_LI_Itens.tbl_mercadoria_.Filter := '';
    end;

    datm_LI_Itens.tbl_mercadoria_.Filtered := True;
    datm_LI_Itens.tbl_mercadoria_.Open;

    if dbedt_cd_mercadoria.Text <> '' then
    begin
      if Not datm_LI_Itens.tbl_mercadoria_.FindKey([dbedt_cd_mercadoria.Text]) then
      begin
        BoxMensagem('Mercadoria não cadastrada para este cliente!', 2);
        ActiveControl.SetFocus;
      end
      else
      begin
        if Not in_LI_Montada then
        begin
          if Not ( datm_LI_Itens.qry_li_itens_.State in [dsInsert, dsEdit]) then
             datm_LI_Itens.qry_li_itens_.Edit;

          if datm_LI_Itens.qry_li_itens_VL_UNIT_MLE.AsFloat = 0 then
             datm_LI_Itens.qry_li_itens_VL_UNIT_MLE.AsFloat := datm_LI_Itens.tbl_mercadoria_VL_UNITARIO.AsFloat;

          if ( datm_LI_Itens.qry_li_itens_PL_MERCADORIA.AsFloat = 0 ) and
             ( datm_LI_Itens.qry_li_itens_QT_MERC_UN_COMERC.AsFloat > 0 ) then
             datm_LI_Itens.qry_li_itens_PL_MERCADORIA.AsFloat := Arredondar( datm_LI_Itens.qry_li_itens_QT_MERC_UN_COMERC.AsFloat *
                                                                             datm_LI_Itens.tbl_mercadoria_PL_MERCADORIA.AsFloat, 2 ); //qtde * peso unitario

          if datm_LI_Itens.qry_li_itens_VL_TOTAL_MLE.AsFloat = 0 then
             datm_LI_Itens.qry_li_itens_VL_TOTAL_MLE.AsFloat := ( datm_LI_Itens.tbl_mercadoria_VL_UNITARIO.AsFloat *
                                                                datm_LI_Itens.qry_li_itens_QT_MERC_UN_COMERC.AsFloat );

          if datm_LI_Itens.qry_li_itens_CD_UN_MED_COMERC.AsString = '' then
             datm_LI_Itens.qry_li_itens_CD_UN_MED_COMERC.AsString := datm_LI_Itens.tbl_mercadoria_CD_UN_MED_COMERC.AsString;

          if datm_LI_Itens.qry_li_itens_CD_NCM_SH.AsString = '' then
             datm_LI_Itens.qry_li_itens_CD_NCM_SH.AsString := datm_LI_Itens.tbl_mercadoria_CD_NCM_SH.AsString;

          if datm_LI_Itens.qry_li_itens_CD_NALADI_SH.AsString = '' then
             datm_LI_Itens.qry_li_itens_CD_NALADI_SH.AsString := datm_LI_Itens.tbl_mercadoria_CD_NALADI_SH.AsString;

          if datm_LI_Itens.qry_li_itens_CD_EXPORTADOR.AsString = '' then
             datm_LI_Itens.qry_li_itens_CD_EXPORTADOR.AsString := datm_LI_Itens.tbl_mercadoria_CD_EXPORTADOR.AsString;

          if datm_LI_Itens.qry_li_itens_CD_PAIS_AQUISICAO.AsString = '' then
             datm_LI_Itens.qry_li_itens_CD_PAIS_AQUISICAO.AsString := datm_LI_Itens.tbl_mercadoria_CD_PAIS_AQUISICAO.AsString;

          if datm_LI_Itens.qry_li_itens_CD_PAIS_ORIGEM.AsString = '' then
             datm_LI_Itens.qry_li_itens_CD_PAIS_ORIGEM.AsString := datm_LI_Itens.tbl_mercadoria_CD_PAIS_ORIGEM.AsString;

          if datm_LI_Itens.qry_li_itens_CD_FABR_EXPO.AsString = '' then
             begin
               datm_LI_Itens.qry_li_itens_CD_FABR_EXPO.AsString := datm_LI_Itens.tbl_mercadoria_CD_FABR_EXPO.AsString;
             end;

          if datm_LI_Itens.qry_li_itens_CD_FABR_EXPO.AsString = '2' then
             if datm_LI_Itens.qry_li_itens_CD_FABRICANTE.AsString = '' then
                datm_LI_Itens.qry_li_itens_CD_FABRICANTE.AsString := datm_LI_Itens.tbl_mercadoria_CD_FABRICANTE.AsString;

        end;
      end;
    end;
  end;
end;


procedure Tfrm_LI_Itens.btn_duplicaClick(Sender: TObject);
var
  NR_PROCESSO          :string [18];
  NR_DESTAQUE_NCM      :string [3];
  CD_IMPORTADOR        :string [5];
  CD_EXPORTADOR        :string [5];
  CD_FABR_EXPO         :string [1];
  CD_FABRICANTE        :string [5];
  CD_MERCADORIA        :string [15];
  CD_NALADI_SH         :string [8];
  CD_NCM_SH            :string [11];
  CD_PAIS_AQUISICAO    :string [3];
  CD_PAIS_ORIGEM       :string [3];
  CD_PAIS_PROCEDENCIA  :string [3];
  CD_UN_MED_COMERC     :string [2];
  CD_UN_MED_ESTAT      :string [2];

  TX_DESC_DET_MERC     :AnsiString;

  PL_MERCADORIA, QT_MERC_UN_COMERC, QT_MERC_UN_ESTAT, VL_UNIT_MLE, VL_TOTAL_MLE, VL_UNIT_MCV : Double;

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

      qry_li_itens_.Append;

      qry_LI_itens_NR_PROCESSO.AsString         := NR_PROCESSO;
      qry_LI_itens_NR_DESTAQUE_NCM.AsString     := NR_DESTAQUE_NCM;
      qry_LI_itens_CD_IMPORTADOR.AsString       := CD_IMPORTADOR;
      qry_LI_itens_CD_EXPORTADOR.AsString       := CD_EXPORTADOR;
      qry_LI_itens_CD_FABR_EXPO.AsString        := CD_FABR_EXPO;
      qry_LI_itens_CD_FABRICANTE.AsString       := CD_FABRICANTE;
      qry_LI_itens_CD_MERCADORIA.AsString       := CD_MERCADORIA;
      qry_LI_itens_CD_NALADI_SH.AsString        := CD_NALADI_SH;
      qry_LI_itens_CD_NCM_SH.AsString           := CD_NCM_SH;
      qry_LI_itens_CD_PAIS_AQUISICAO.AsString   := CD_PAIS_AQUISICAO;
      qry_LI_itens_CD_PAIS_ORIGEM.AsString      := CD_PAIS_ORIGEM;
      qry_LI_itens_CD_PAIS_PROCEDENCIA.AsString := CD_PAIS_PROCEDENCIA;
      qry_LI_itens_CD_UN_MED_COMERC.AsString    := CD_UN_MED_COMERC;
      qry_LI_itens_CD_UN_MED_ESTAT.AsString     := CD_UN_MED_ESTAT;
      qry_LI_itens_PL_MERCADORIA.AsFloat        := PL_MERCADORIA;
      qry_LI_itens_QT_MERC_UN_COMERC.AsFloat    := QT_MERC_UN_COMERC;
      qry_LI_itens_QT_MERC_UN_ESTAT.AsFloat     := QT_MERC_UN_ESTAT;
      qry_LI_itens_TX_DESC_DET_MERC.AsString    := TX_DESC_DET_MERC;
      qry_LI_itens_VL_UNIT_MLE.AsFloat          := VL_UNIT_MLE;
      qry_LI_itens_VL_TOTAL_MLE.AsFloat         := VL_TOTAL_MLE;
      qry_LI_itens_VL_UNIT_MCV.AsFloat          := VL_UNIT_MCV;

      no_tot_item := qry_li_QT_TOTAL_ITEM.AsString;

      j := StrToInt( no_tot_item ) + 1;
      no_tot_item := StrZero( j, 3 );

      qry_li_.Edit;
      qry_li_QT_TOTAL_ITEM.AsString     := no_tot_item;
      qry_li_itens_NR_ITEM.AsString     := no_tot_item;

      qry_li_.Post;
      qry_li_itens_.Post;

      qry_li_.Close;
      qry_li_itens_.Close;

      qry_LI_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
      qry_LI_.Prepare;
      qry_LI_.Open;

      qry_LI_Itens_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
      qry_LI_Itens_.Prepare;
      qry_LI_Itens_.Open;
      qry_LI_Itens_.Locate('NR_PROCESSO;NR_ITEM', VarArrayOf ([str_nr_processo, no_tot_item]), [loCaseInsensitive]);

      datm_main.db_broker.Commit;

      btn_salvar.Enabled     := False;
      btn_cancelar.Enabled   := False;
      btn_novo_item.Enabled  := True;
      mi_salvar.Enabled      := False;
      mi_cancelar.Enabled    := False;
      mi_novo_item.Enabled   := True

    end;

  except
    on E: Exception do
    begin
      TrataErro(E);
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
    end;
  end;

end;


procedure Tfrm_LI_Itens.dbedt_cd_unid_comercialExit(Sender: TObject);
begin
  CodExits;
  If dbedt_cd_unid_comercial.Text = '10' then
     begin
       dbedt_qt_unid_estat.Text := dbedt_peso_liq.Text;
       dbedt_qt_unid_estat.TabStop := False;
       dbedt_qt_unid_estat.ReadOnly := True;
       dbedt_qt_unid_estat.Color := clMenu;

       edt_unid_med_estat.Text := datm_LI_Itens.qry_li_itens_LookUnidMedida.Text;

     end
  else if dbedt_cd_unid_comercial.Text = '11' then
     begin
       dbedt_qt_unid_estat.TabStop := True;
       dbedt_qt_unid_estat.ReadOnly := False;
       dbedt_qt_unid_estat.Color := clWindow;

       edt_unid_med_estat.Text := '';

     end
  else
     begin
       dbedt_qt_unid_estat.TabStop := True;
       dbedt_qt_unid_estat.ReadOnly := False;
       dbedt_qt_unid_estat.Color := clWindow;
     end;


end;

procedure Tfrm_LI_Itens.dbedt_cd_exportador_liExit(Sender: TObject);
begin
  if datm_LI_Itens.qry_li_itens_.Modified then
  ValidCodigo(dbedt_cd_exportador);
end;

procedure Tfrm_LI_Itens.dbedt_cd_fabricante_liExit(Sender: TObject);
begin
  if datm_LI_Itens.qry_li_itens_.Modified then
  ValidCodigo(dbedt_cd_fabricante);
end;

procedure Tfrm_LI_Itens.dbedt_cd_pais_aquisicao_liExit(Sender: TObject);
begin
  if datm_LI_Itens.qry_li_itens_.Modified then
  ValidCodigo(dbedt_cd_pais_aquisicao);
end;

procedure Tfrm_LI_Itens.dbedt_cd_pais_origem_liExit(Sender: TObject);
begin
  if datm_LI_Itens.qry_li_itens_.Modified then
  ValidCodigo(dbedt_cd_pais_origem);
end;



procedure Tfrm_LI_Itens.dbedt_cd_naladi_sh_liExit(Sender: TObject);
begin
  if Trim(dbedt_cd_naladi_sh.Text) = '' then Exit;
  if Not datm_LI_Itens.tbl_naladi_sh_.FindKey([ Trim(dbedt_cd_naladi_sh.Text) ]) then
  begin
     if Not in_abrindo_itens then BoxMensagem( 'NALADI/SH não Cadastrada', 3 );
  end;

end;


function Tfrm_LI_Itens.Consiste : Boolean;
var
  str_cd_ncm_c8 : string[8];

begin
  Consiste := True;

  if datm_LI_Itens.qry_li_itens_.State in [dsInsert, dsEdit] then
  begin
    {Mercadoria}
    if dbedt_cd_mercadoria.Text <> '' then
    begin
      if ( dbedt_nm_mercadoria.Text = '' ) then
      begin
        BoxMensagem('Código da Mercadoria inválido!',2);
        pgctrl_Item.ActivePage := ts_item1;
        dbedt_cd_mercadoria.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Unidade Medida}
    ValidCodigo( dbedt_cd_unid_comercial );
    if dbedt_cd_unid_comercial.Text <> '' then
    begin
      if ( dbedt_nm_unidade.Text = '' ) then
      begin
        BoxMensagem('Código da Unidade de Medida inválido!',2);
        pgctrl_Item.ActivePage := ts_item1;
        dbedt_cd_unid_comercial.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    { NCM }
    if datm_LI_Itens.tbl_ncm_.FindKey([ datm_LI_Itens.qry_li_itens_CD_NCM_SH.AsString ]) then
       if datm_LI_Itens.qry_unid_medida_.Locate('CODIGO', Copy( datm_LI_Itens.tbl_ncm_UNIDADE_MEDIDA.AsString, 1, 2 ), []) then
          edt_unid_med_estat.Text := datm_LI_Itens.qry_unid_medida_DESCRICAO.AsString;

    str_cd_ncm_c8 := copy( datm_LI_Itens.qry_li_itens_CD_NCM_SH.AsString, 1, 8 );
    if Trim(str_cd_ncm_c8) <> '' then
    Begin
      if (StrToInt( Copy( datm_LI_Itens.tbl_ncm_UNIDADE_MEDIDA.AsString, 1, 2 )) =
         StrToInt( datm_LI_Itens.qry_li_itens_CD_UN_MED_COMERC.AsString ) ) and
         (datm_LI_Itens.qry_li_itens_QT_MERC_UN_ESTAT.AsFloat = 0 ) then
      begin
         datm_LI_Itens.qry_li_itens_QT_MERC_UN_ESTAT.AsFloat := datm_LI_Itens.qry_li_itens_QT_MERC_UN_COMERC.AsFloat;
      end;
    end;

    {Exportador}
    ValidCodigo( dbedt_cd_exportador );
    if dbedt_cd_exportador.Text <> '' then
    begin
      if ( dbedt_nm_exportador.Text = '' ) then
      begin
        BoxMensagem('Código do Fornecedor inválido!',2);
        pgctrl_Item.ActivePage := ts_item1;
        dbedt_cd_exportador.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Pais de Aquisicao}
    ValidCodigo( dbedt_cd_pais_aquisicao );
    if dbedt_cd_pais_aquisicao.Text <> '' then
    begin
      if ( dbedt_nm_pais_aquisicao.Text = '' ) then
      begin
        BoxMensagem('Código do País de Aquisição inválido!',2);
        pgctrl_Item.ActivePage := ts_item1;
        dbedt_cd_pais_aquisicao.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Fabricante}
    ValidCodigo( dbedt_cd_fabricante );
    if dbedt_cd_fabricante.Text <> '' then
    begin
      if ( dbedt_nm_fabricante.Text = '' ) then
      begin
        BoxMensagem('Código do Fabricante / Produtor inválido!',2);
        pgctrl_Item.ActivePage := ts_item1;
        dbedt_cd_fabricante.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    {Pais de Origem}
    ValidCodigo( dbedt_cd_pais_origem );
    if dbedt_cd_pais_origem.Text <> '' then
    begin
      if ( dbedt_nm_pais_origem.Text = '' ) then
      begin
        BoxMensagem('Código do País de Origem inválido!',2);
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

  if ( ( datm_LI_Itens.qry_li_itens_.State in [dsEdit] ) {and st_modificar} ) or
       ( datm_LI_Itens.qry_li_itens_.State in [dsInsert] ) then
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
  end;
end;

procedure Tfrm_LI_Itens.Cancelar;
begin
  with datm_LI_Itens do
  begin
    if qry_li_.State          in [dsEdit,dsInsert] then qry_li_.Cancel;
    if qry_li_itens_.State    in [dsEdit,dsInsert] then qry_li_itens_.Cancel;
    if qry_unid_medida_.State in [dsEdit,dsInsert] then qry_unid_medida_.Cancel;
    if tbl_pais_.State        in [dsEdit,dsInsert] then tbl_pais_.Cancel;
    if tbl_ncm_.State         in [dsEdit,dsInsert] then tbl_ncm_.Cancel;
    if tbl_mercadoria_.State  in [dsEdit,dsInsert] then tbl_mercadoria_.Cancel;
    if tbl_naladi_sh_.State   in [dsEdit,dsInsert] then tbl_naladi_sh_.Cancel;
    if tbl_empresa_est_.State in [dsEdit,dsInsert] then tbl_empresa_est_.Cancel;
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
begin
  Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  frm_emp_est.Cons_OnLine := datm_LI_Itens.qry_li_itens_CD_EXPORTADOR;
  with frm_emp_est do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_LI_Itens.qry_li_itens_.State in [dsEdit, dsInsert] ) then datm_LI_Itens.qry_li_itens_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_LI_Itens.btn_co_fabricanteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  frm_emp_est.Cons_OnLine := datm_li_Itens.qry_li_itens_CD_FABRICANTE;
  with frm_emp_est do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_LI_Itens.qry_li_itens_.State in [dsEdit, dsInsert] ) then datm_LI_Itens.qry_li_itens_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;

end;

procedure Tfrm_LI_Itens.dbedt_cd_naladi_shExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_LI_Itens.Desabilita_Entrada;
var i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TSpeedButton ) then
       TSpeedButton( Components[i] ).Enabled  := False;
    if ( Components[i] is TDBEdit ) then
       TDBEdit( Components[i] ).Enabled       := False;
    if ( Components[i] is TDBRadioGroup ) then
       TDBRadioGroup( Components[i] ).Enabled := False;
    if ( Components[i] is TDBMemo ) then
       TDBMemo( Components[i] ).Enabled       := False;
  end;

end;

procedure Tfrm_LI_Itens.Habilita_Entrada;
var i : integer;
begin

  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TSpeedButton ) then
       TSpeedButton( Components[i] ).Enabled  := True;
    if ( Components[i] is TDBEdit ) then
       TDBEdit( Components[i] ).Enabled       := True;
    if ( Components[i] is TDBRadioGroup ) then
       TDBRadioGroup( Components[i] ).Enabled := True;
    if ( Components[i] is TDBMemo ) then
       TDBMemo( Components[i] ).Enabled       := True;
  end;

end;

procedure Tfrm_LI_Itens.dbedt_peso_liqEnter(Sender: TObject);
begin
  vl_old := datm_LI_Itens.qry_li_itens_PL_MERCADORIA.AsFloat;
  if (datm_LI_Itens.qry_li_itens_PL_MERCADORIA.AsFloat = 0) then
    if dbedt_nm_unidade.Text = 'QUILOGRAMA LIQUIDO' then
       datm_LI_Itens.qry_li_itens_PL_MERCADORIA.AsFloat := datm_LI_Itens.qry_li_itens_QT_MERC_UN_COMERC.AsFloat
    else
      if edt_unid_med_estat.Text = 'QUILOGRAMA LIQUIDO' then
         datm_LI_Itens.qry_li_itens_PL_MERCADORIA.AsFloat := datm_LI_Itens.qry_li_itens_QT_MERC_UN_ESTAT.AsFloat

end;

procedure Tfrm_LI_Itens.dbedt_vl_unitarioEnter(Sender: TObject);
begin
  vl_old := datm_LI_Itens.qry_li_itens_VL_UNIT_MLE.AsFloat;
end;

procedure Tfrm_LI_Itens.dbedt_vl_itemEnter(Sender: TObject);
begin
  if datm_LI_Itens.qry_li_itens_VL_TOTAL_MLE.AsFloat = 0 then
  begin
    datm_LI_Itens.qry_li_itens_VL_TOTAL_MLE.AsFloat :=
                  Arredondar( datm_LI_Itens.qry_li_itens_QT_MERC_UN_COMERC.AsFloat *
                              datm_LI_Itens.qry_li_itens_VL_UNIT_MLE.AsFloat, 2 );
  end;
end;

procedure Tfrm_LI_Itens.dbrgrp_fabr_expoChange(Sender: TObject);
begin

  dbedt_cd_pais_origem.ReadOnly := False;
  dbedt_cd_pais_origem.Color    := clWindow;
  dbedt_cd_pais_origem.TabStop  := True;
  btn_co_pais_origem.Enabled    := True;

  case dbrgrp_fabr_expo.ItemIndex of
    0:
    begin
      if datm_LI_Itens.qry_li_itens_.State in [dsEdit,dsInsert] then
         datm_LI_Itens.qry_li_itens_CD_FABRICANTE.AsString := '';
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
         datm_LI_Itens.qry_li_itens_CD_FABRICANTE.AsString := '';
      dbedt_cd_fabricante.ReadOnly  := True;
      dbedt_cd_fabricante.color     := clMenu;
      dbedt_cd_fabricante.TabStop   := False;
      btn_co_fabricante.Enabled     := False;
    end;
  end;

end;

procedure Tfrm_LI_Itens.dbedt_peso_liqExit(Sender: TObject);
begin
  If dbedt_cd_unid_comercial.Text = '10' then
     begin
       dbedt_qt_unid_estat.Text := dbedt_peso_liq.Text;
       dbedt_qt_unid_estat.TabStop := False;
       dbedt_qt_unid_estat.ReadOnly := True;
       dbedt_qt_unid_estat.Color := clMenu;

       edt_unid_med_estat.Text := datm_LI_Itens.qry_li_itens_LookUnidMedida.Text;

     end

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
    if Sender = dbedt_cd_mercadoria     then btn_co_produtoClick(nil);
    if Sender = dbedt_cd_unid_comercial then btn_co_unid_medClick(nil);
    if Sender = dbedt_cd_ncm            then btn_co_ncmClick(nil);
    if Sender = dbedt_cd_naladi_sh      then btn_co_naladi_shClick(nil);
    if Sender = dbedt_cd_exportador     then btn_co_exportadorClick(nil);
    if Sender = dbedt_cd_pais_aquisicao then btn_co_pais_aquisicaoClick(nil);
    if Sender = dbedt_cd_fabricante     then btn_co_fabricanteClick(nil);
    if Sender = dbedt_cd_pais_origem    then btn_co_pais_origemClick(nil);
  end;

end;

procedure Tfrm_LI_Itens.dbedt_qt_mercadoriaChange(Sender: TObject);
begin
  with datm_LI_Itens do
  begin
    if not datm_LI_Itens.qry_li_itens_QT_MERC_UN_COMERC.IsNull then
       if not datm_LI_Itens.qry_li_itens_VL_UNIT_MLE.IsNull then
          if datm_LI_Itens.qry_li_itens_.State in [dsEdit,dsInsert] then
             if Arredondar( datm_LI_Itens.qry_li_itens_QT_MERC_UN_COMERC.AsFloat *
                            datm_LI_Itens.qry_li_itens_VL_UNIT_MLE.AsFloat, 2 ) <> datm_LI_Itens.qry_li_itens_VL_TOTAL_MLE.AsFloat then
                datm_LI_Itens.qry_li_itens_VL_TOTAL_MLE.AsFloat :=
                       Arredondar( datm_LI_Itens.qry_li_itens_QT_MERC_UN_COMERC.AsFloat *
                                   datm_LI_Itens.qry_li_itens_VL_UNIT_MLE.AsFloat, 2 );
  end;
end;

end.



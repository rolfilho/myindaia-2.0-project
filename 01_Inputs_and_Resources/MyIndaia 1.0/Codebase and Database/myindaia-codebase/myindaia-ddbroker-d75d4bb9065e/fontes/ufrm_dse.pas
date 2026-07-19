unit ufrm_dse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, Grids, DBGrids, ComCtrls, DBTables,
  DB, RXCtrls, RXDBCtrl, RxDBComb;

type
  Tfrm_dse = class(TForm)
    pgDSE: TPageControl;
    ts_lista: TTabSheet;
    dbgrd_principal: TDBGrid;
    Panel5: TPanel;
    Label51: TLabel;
    btn1_unid_neg: TSpeedButton;
    btn1_produto: TSpeedButton;
    Label52: TLabel;
    edt1_cd_unid_neg: TEdit;
    edt1_cd_produto: TMaskEdit;
    ts_dados: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btn2_exportador: TSpeedButton;
    Label14: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    btn2_nr_processo: TSpeedButton;
    edt2_nr_processo: TDBEdit;
    edt2_nr_despacho: TDBEdit;
    edt2_cd_exportador: TDBEdit;
    ts_ncm: TTabSheet;
    Shape15: TShape;
    Shape10: TShape;
    Label25: TLabel;
    SpeedButton4: TSpeedButton;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Shape11: TShape;
    Label13: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label36: TLabel;
    btn3_ncm: TSpeedButton;
    Label37: TLabel;
    btn3_unid_med: TSpeedButton;
    DBGrid3: TDBGrid;
    DBEdit23: TDBEdit;
    Edit9: TEdit;
    edt3_pesoliquido: TDBEdit;
    edt3_cd_unid_med: TDBEdit;
    edt3_valor_acumulado: TDBEdit;
    edt3_qtd: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit18: TDBEdit;
    edt3_cd_ncm: TDBEdit;
    edt3_destaquencm: TDBEdit;
    Panel1: TPanel;
    btn_incluir: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    Shape1: TShape;
    btn_transmitir: TSpeedButton;
    btn_consulta: TSpeedButton;
    noteNavegacao: TNotebook;
    Label71: TLabel;
    Label72: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Shape24: TShape;
    Label53: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    edt2_cd_tpexportador: TDBEdit;
    edt2_nm_tpexportador: TDBEdit;
    btn2_tpexportador: TSpeedButton;
    edt2_cd_urfdespacho: TDBEdit;
    edt2_nm_urfdespacho: TDBEdit;
    btn2_urfdespacho: TSpeedButton;
    edt2_cd_urfembarque: TDBEdit;
    edt2_nm_urfembarque: TDBEdit;
    btn2_urfembarque: TSpeedButton;
    btn2_natureza: TSpeedButton;
    edt2_nm_natureza: TDBEdit;
    edt2_cd_natureza: TDBEdit;
    Label32: TLabel;
    edt2_tpcourrier: TDBComboBox;
    edt2_cd_paisdestino: TDBEdit;
    edt2_nm_paisdestino: TDBEdit;
    btn2_paisdestino: TSpeedButton;
    edt2_cd_via: TDBEdit;
    edt2_nm_via: TDBEdit;
    btn2_via: TSpeedButton;
    pnl_cnpj: TPanel;
    lbl_cnpj: TLabel;
    btn2_cnpj_courrier: TSpeedButton;
    Label2: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label42: TLabel;
    edt2_identificador: TDBEdit;
    edt2_totalpesobruto: TDBEdit;
    edt2_cd_moeda: TDBEdit;
    edt2_totalmoeda: TDBEdit;
    edt2_nm_moeda: TDBEdit;
    btn2_moeda: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    edt3_peso_acumulado: TDBEdit;
    Label10: TLabel;
    pnl_navitem: TPanel;
    Shape5: TShape;
    nav3_itens: TDBNavigator;
    edt3_valor: TDBEdit;
    edt3_linha1: TDBEdit;
    edt3_linha2: TDBEdit;
    edt3_linha3: TDBEdit;
    edt2_nm_exportador: TDBEdit;
    edt2_cnpj_exportador: TDBEdit;
    edt2_cnpj_courrier: TDBEdit;
    edt1_nm_unid_neg: TEdit;
    edt3_nm_unid_med: TDBEdit;
    edt3_nm_ncm: TDBEdit;
    Registros: TLabel;
    edt1_nm_produto: TEdit;
    ts_complementares: TTabSheet;
    Label30: TLabel;
    Label45: TLabel;
    Shape12: TShape;
    Shape13: TShape;
    edt4_tx_doc_instrutivos: TDBMemo;
    Label31: TLabel;
    Label33: TLabel;
    edt4_tx_inf_complementares: TDBMemo;
    dbgrd_volumes: TDBGrid;
    edt2_carga_armaz: TRxDBComboBox;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    edt2_die: TDBEdit;
    edt2_dine: TDBEdit;
    edt2_dsine: TDBEdit;
    edt2_cd_ul_dsine: TDBEdit;
    edt2_cd_ul_dine: TDBEdit;
    edt2_dsie: TDBEdit;
    edt2_dt_dsine: TDBEdit;
    edt2_dt_dine: TDBEdit;
    edt2_dias: TDBEdit;
    btn2_ul_dsine: TSpeedButton;
    btn2_ul_dine: TSpeedButton;
    Label49: TLabel;
    edt2_qtd_total: TDBEdit;
    Label50: TLabel;
    edt2_recinto: TDBEdit;
    Label55: TLabel;
    Label58: TLabel;
    edt2_usuario: TDBEdit;
    edt2_setor: TDBEdit;
    Label59: TLabel;
    Label60: TLabel;
    edt2_doc_inf: TRxDBComboBox;
    edt2_inf_pres_carga: TRxDBComboBox;
    edt2_nm_ul_dsine: TDBEdit;
    edt2_nm_ul_dine: TDBEdit;
    btn4_incluir: TSpeedButton;
    btn4_salvar: TSpeedButton;
    btn4_cancelar: TSpeedButton;
    btn4_excluir: TSpeedButton;
    Shape2: TShape;
    Shape7: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape6: TShape;
    Label61: TLabel;
    edt3_qtd_comerc: TDBEdit;
    edt2_status: TDBMemo;
    Label54: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBMemo1: TDBMemo;
    Label62: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label29: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBMemo2: TDBMemo;
    Label63: TLabel;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn2_exportadorClick(Sender: TObject);
    procedure btn2_tpexportadorClick(Sender: TObject);
    procedure btn2_naturezaClick(Sender: TObject);
    procedure btn2_urfdespachoClick(Sender: TObject);
    procedure btn2_urfembarqueClick(Sender: TObject);
    procedure btn2_paisdestinoClick(Sender: TObject);
    procedure btn2_viaClick(Sender: TObject);
    procedure btn2_moedaClick(Sender: TObject);
    procedure edt2_cd_exportadorExit(Sender: TObject);
    procedure btn3_ncmClick(Sender: TObject);
    procedure btn3_unid_medClick(Sender: TObject);
    procedure edt1_cd_unid_negKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure btn1_unid_negClick(Sender: TObject);
    procedure btn1_produtoClick(Sender: TObject);
    procedure btn2_cnpj_courrierClick(Sender: TObject);
    procedure edt2_tpcourrierChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    function  ValidaCampos:Boolean;
    procedure btn2_nr_processoClick(Sender: TObject);
    procedure edt2_nr_processoExit(Sender: TObject);
    procedure AbreTabelaDSE;
    procedure sp_inclui_dse(pPROCESSO:string);
    procedure btn_consultaClick(Sender: TObject);
    procedure pgDSEChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure sp_exclui_dse(pPROCESSO:string);
    procedure HabilitaEdicao;
    procedure btn4_incluir_volClick(Sender: TObject);
    procedure btn4_excluir_volClick(Sender: TObject);
    procedure btn2_ul_dineClick(Sender: TObject);
    procedure btn2_ul_dsineClick(Sender: TObject);
    procedure btn4_incluirClick(Sender: TObject);
    procedure btn4_salvarClick(Sender: TObject);
    procedure btn4_cancelarClick(Sender: TObject);
    procedure btn4_excluirClick(Sender: TObject);
    procedure dbgrd_volumesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pgDSEChange(Sender: TObject);
    procedure VerificaNatureza;
    procedure btn_transmitirClick(Sender: TObject);
    function  ConsisteEnvioDSE : Boolean;
    procedure edt2_statusMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_dse: Tfrm_dse;

implementation

uses udatm_dse, ConsOnLineEx, dDDE, FuncoesExport, Funcoes, PGGP017;//, PGGP017;

{$R *.DFM}

procedure Tfrm_dse.btn_incluirClick(Sender: TObject);
begin

if (trim(edt1_nm_unid_neg.Text) = '') then
   begin
   Application.MessageBox('Unidade de Negócio inválida!','DDBroker',MB_OK+MB_ICONERROR);
   pgDSE.ActivePageIndex := 0;
   edt1_cd_unid_neg.SetFocus;
   edt1_cd_unid_neg.SelectAll;
   Exit;
   end;
if (trim(edt1_nm_produto.Text) = '') then
   begin
   Application.MessageBox('Produto inválido!','DDBroker',MB_OK+MB_ICONERROR);
   pgDSE.ActivePageIndex := 0;
   edt1_cd_produto.SetFocus;
   edt1_cd_produto.SelectAll;
   Exit;
   end;



  case pgDSE.ActivePageIndex of
    {Lista -------------------}
    0: begin
       pgDSE.ActivePageIndex := 1;
       datm_dse.qry_dse.Insert;
       edt2_nr_processo.SetFocus;
       end;
    {Dados Globais -----------}
    1,3: begin
       datm_dse.qry_dse.Insert;
       IF pgDSE.ActivePageIndex = 0 THEN edt2_nr_processo.SetFocus;
       IF pgDSE.ActivePageIndex = 3 THEN edt4_tx_doc_instrutivos.SetFocus;       
       end;
    {NCM(s) de Despacho-------}
    2: begin
       datm_dse.qry_dse_item.Insert;
       edt3_cd_ncm.SetFocus;
       end;
  end;
  HabilitaEdicao;
end;

procedure Tfrm_dse.btn2_exportadorClick(Sender: TObject);
begin
  if not (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then datm_dse.qry_dse.Edit;
  {Exportador -----------------------------------------------------------------}
  datm_dse.qry_dse.FieldByName('CD_EXPORTADOR').AsString :=  ConsultaOnLineExSQL(
                                                   'SELECT CD_EMPRESA, NM_EMPRESA, CGC_EMPRESA FROM TEMPRESA_NAC WHERE IN_ATIVO = "1"',
                                                   'Exportadores'               ,
                                                   ['CD_EMPRESA','NM_EMPRESA']  ,
                                                   ['Código','Nome']            ,
                                                   'CD_EMPRESA');
  edt2_cd_exportadorExit(edt2_cd_exportador);
end;

procedure Tfrm_dse.btn2_tpexportadorClick(Sender: TObject);
begin
  if not (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then datm_dse.qry_dse.Edit;
  {Tipo de Exportador ---------------------------------------------------------}
  datm_dse.qry_dse.FieldByName('TP_EXPORTADOR').AsString := ConsultaOnLineExSQL(
                                                   'SELECT CODIGO, DESCRICAO FROM TTP_EXPORTADOR',
                                                   'Tipos de Exportadores'      ,
                                                   ['CODIGO','DESCRICAO']       ,
                                                   ['Código','Descrição']       ,
                                                   'CODIGO' );
  edt2_cd_exportadorExit(edt2_cd_tpexportador);
end;

procedure Tfrm_dse.btn2_naturezaClick(Sender: TObject);
begin
  if not (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then datm_dse.qry_dse.Edit;
  {Natureza da Operação -------------------------------------------------------}
  datm_dse.qry_dse.FieldByName('CD_NATUREZA').AsString :=  ConsultaOnLineExSQL(
                                                   'SELECT CODIGO, DESCRICAO FROM TTP_NATUREZA_OPERACAO_EXP',
                                                   'Natureza da Operação'       ,
                                                   ['CODIGO','DESCRICAO']       ,
                                                   ['Código','Descrição']       ,
                                                   'CODIGO' );
  edt2_cd_exportadorExit(edt2_cd_natureza);
end;

procedure Tfrm_dse.btn2_urfdespachoClick(Sender: TObject);
begin
  if not (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then datm_dse.qry_dse.Edit;
  {URF Despacho ---------------------------------------------------------------}
  datm_dse.qry_dse.FieldByName('CD_URF_DESPACHO').AsString :=  ConsultaOnLineExSQL(
                                                   'SELECT CODIGO, DESCRICAO FROM TURF',
                                                   'URF de Despacho'            ,
                                                   ['CODIGO','DESCRICAO']       ,
                                                   ['Código','Descrição']       ,
                                                   'CODIGO' );
  edt2_cd_exportadorExit(edt2_cd_urfdespacho);
end;

procedure Tfrm_dse.btn2_urfembarqueClick(Sender: TObject);
begin
  if not (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then datm_dse.qry_dse.Edit;
  {URF Embarque ---------------------------------------------------------------}
  datm_dse.qry_dse.FieldByName('CD_URF_EMBARQUE').AsString :=  ConsultaOnLineExSQL(
                                                   'SELECT CODIGO, DESCRICAO FROM TURF',
                                                   'URF de Despacho'            ,
                                                   ['CODIGO','DESCRICAO']       ,
                                                   ['Código','Descrição']       ,
                                                   'CODIGO' );
  edt2_cd_exportadorExit(edt2_cd_urfembarque);
end;

procedure Tfrm_dse.btn2_paisdestinoClick(Sender: TObject);
begin
  if not (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then datm_dse.qry_dse.Edit;
  {País -----------------------------------------------------------------------}
  datm_dse.qry_dse.FieldByName('CD_PAIS_FINAL').AsString :=  ConsultaOnLineExSQL(
                                                   'SELECT CD_PAIS, NM_PAIS FROM TPAIS_BROKER',
                                                   'País Destino Final'         ,
                                                   ['CD_PAIS','NM_PAIS']        ,
                                                   ['Código' ,'Nome']            ,
                                                   'CD_PAIS' );
  edt2_cd_exportadorExit(edt2_cd_paisdestino);
end;

procedure Tfrm_dse.btn2_viaClick(Sender: TObject);
begin
  if not (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then datm_dse.qry_dse.Edit;
  {Via de Transporte ----------------------------------------------------------}
  datm_dse.qry_dse.FieldByName('CD_VIA_TRANSPORTE').AsString :=  ConsultaOnLineExSQL(
                                                   'SELECT CD_VIA_TRANSPORTE, NM_VIA_TRANSPORTE FROM TVIA_TRANSPORTE',
                                                   'Via de Transporte'                        ,
                                                   ['CD_VIA_TRANSPORTE','NM_VIA_TRANSPORTE']  ,
                                                   ['Código','Nome']                          ,
                                                   'CD_VIA_TRANSPORTE');
  edt2_cd_exportadorExit(edt2_cd_via);
end;

procedure Tfrm_dse.btn2_moedaClick(Sender: TObject);
begin
  if not (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then datm_dse.qry_dse.Edit;
  {Moeda ----------------------------------------------------------------------}
  datm_dse.qry_dse.FieldByName('CD_MOEDA').AsString :=  ConsultaOnLineExSQL(
                                                   'SELECT CD_MOEDA, NM_MOEDA, AP_MOEDA FROM TMOEDA_BROKER WHERE IN_ATIVO = "1"',
                                                   'Moeda da Transação'         ,
                                                   ['CD_MOEDA','NM_MOEDA']      ,
                                                   ['Código'  ,'Nome']            ,
                                                   'CD_MOEDA' );
  edt2_cd_exportadorExit(edt2_cd_moeda);
end;

procedure Tfrm_dse.edt2_cd_exportadorExit(Sender: TObject);
begin

  if sender = edt1_cd_unid_neg     then   begin
                                          if trim(edt1_cd_unid_neg.Text) <> '' then begin
                                          edt1_cd_unid_neg.Text := FStrZero(edt1_cd_unid_neg.Text, 2);
                                          edt1_nm_unid_neg.Text :=  ConsultaLookUP('TUNID_NEG' , 'CD_UNID_NEG' , edt1_cd_unid_neg.Text , 'NM_UNID_NEG' );
                                          AbreTabelaDSE;
                                          end;
                                          end;

  if sender = edt1_cd_produto      then   begin
                                          if trim(edt1_cd_produto.Text) <> '' then begin
                                          edt1_cd_produto.Text := FStrZero(edt1_cd_produto.Text, 2);
                                          edt1_nm_produto.Text :=  ConsultaLookUP('TPRODUTO'   , 'CD_PRODUTO'  , edt1_cd_produto.Text  , 'NM_PRODUTO'  );
                                          AbreTabelaDSE;
                                          end;
                                          end;

  if not (
     ((pgDSE.ActivePage = ts_dados) and (datm_dse.qry_dse.State      in [dsInsert, dsEdit])) or
     ((pgDSE.ActivePage = ts_ncm)   and (datm_dse.qry_dse_item.State in [dsInsert, dsEdit])) ) then Exit;

  if sender = edt2_cd_exportador   then   begin
                                          if trim(edt2_cd_exportador.Text) <> '' then begin
                                          datm_dse.qry_dse.FieldByName('CD_EXPORTADOR').AsString     := FStrZero(datm_dse.qry_dse.FieldByName('CD_EXPORTADOR').AsString    , 5);
//                                          edt2_cd_tpexportador.setfocus;
                                          end;
                                          end;

  if sender = edt2_cd_tpexportador then   begin
                                          if trim(edt2_cd_tpexportador.Text) <> '' then begin
                                          datm_dse.qry_dse.FieldByName('TP_EXPORTADOR').AsString     := FStrZero(datm_dse.qry_dse.FieldByName('TP_EXPORTADOR').AsString    , 2);
//                                          edt2_cd_natureza.SetFocus;
                                          end;
                                          end;

  if sender = edt2_cd_natureza     then   begin
                                          if trim(edt2_cd_natureza.Text) <> '' then begin
                                          datm_dse.qry_dse.FieldByName('CD_NATUREZA').AsString       := FStrZero(datm_dse.qry_dse.FieldByName('CD_NATUREZA').AsString      , 2);
                                          VerificaNatureza;
//                                          edt2_cd_urfdespacho.SetFocus;
                                          end;
                                          end;

  if sender = edt2_cd_urfdespacho  then   begin
                                          if trim(edt2_cd_urfdespacho.Text) <> '' then begin
                                          datm_dse.qry_dse.FieldByName('CD_URF_DESPACHO').AsString   := FStrZero(datm_dse.qry_dse.FieldByName('CD_URF_DESPACHO').AsString  , 7);
//                                          edt2_cd_urfembarque.SetFocus;
                                          end;
                                          end;

  if sender = edt2_cd_ul_dine      then   begin
                                          if trim(edt2_cd_ul_dine.Text) <> '' then begin
                                          datm_dse.qry_dse.FieldByName('CD_UL_EMISSAO_DI').AsString   := FStrZero(datm_dse.qry_dse.FieldByName('CD_UL_EMISSAO_DI').AsString  , 7);
//                                          edt2_cd_urfembarque.SetFocus;
                                          end;
                                          end;

  if sender = edt2_cd_ul_dsine     then   begin
                                          if trim(edt2_cd_ul_dsine.Text) <> '' then begin
                                          datm_dse.qry_dse.FieldByName('CD_UL_EMISSAO_DSI').AsString   := FStrZero(datm_dse.qry_dse.FieldByName('CD_UL_EMISSAO_DSI').AsString  , 7);
//                                          edt2_cd_urfembarque.SetFocus;
                                          end;
                                          end;



  if sender = edt2_cd_urfembarque  then   begin
                                          if trim(edt2_cd_urfembarque.Text) <> '' then begin
                                          datm_dse.qry_dse.FieldByName('CD_URF_EMBARQUE').AsString   := FStrZero(datm_dse.qry_dse.FieldByName('CD_URF_EMBARQUE').AsString  , 7);
//                                          edt2_carga_armaz.SetFocus;
                                          end;
                                          end;

  if sender = edt2_cd_paisdestino  then   begin
                                          if trim(edt2_cd_paisdestino.Text) <> '' then begin
                                          datm_dse.qry_dse.FieldByName('CD_PAIS_FINAL').AsString     := FStrZero(datm_dse.qry_dse.FieldByName('CD_PAIS_FINAL').AsString    , 3);
//                                          edt2_cd_via.SetFocus;
                                          end;
                                          end;

  if sender = edt2_cd_via          then   begin
                                          if trim(edt2_cd_via.Text) <> '' then begin
                                          datm_dse.qry_dse.FieldByName('CD_VIA_TRANSPORTE').AsString := FStrZero(datm_dse.qry_dse.FieldByName('CD_VIA_TRANSPORTE').AsString, 2);
//                                          edt2_identificador.SetFocus;
                                          end;
                                          end;

  if sender = edt2_cd_moeda        then   begin
                                          if trim(edt2_cd_moeda.Text) <> '' then begin
                                          datm_dse.qry_dse.FieldByName('CD_MOEDA').AsString          := FStrZero(datm_dse.qry_dse.FieldByName('CD_MOEDA').AsString         , 3);
//                                          edt2_totalmoeda.SetFocus;
                                          end;
                                          end;

  if sender = edt3_cd_ncm          then   begin
                                          if trim(edt3_cd_ncm.Text) <> '' then begin
                                          datm_dse.qry_dse_item.FieldByName('CD_NCM').AsString       := FStrZero(datm_dse.qry_dse_item.FieldByName('CD_NCM').AsString      , 8);
//                                          edt3_destaquencm.SetFocus;
                                          end;
                                          end;

  if sender = edt3_cd_unid_med     then   begin
                                          if trim(edt3_cd_unid_med.Text) <> '' then begin
                                          datm_dse.qry_dse_item.FieldByName('CD_UNID_MED_COMERCIALIZADA').AsString := FStrZero(datm_dse.qry_dse_item.FieldByName('CD_UNID_MED_COMERCIALIZADA').AsString , 2);
//                                          edt3_pesoliquido.SetFocus;
                                          end;
                                          end;

end;

procedure Tfrm_dse.btn3_ncmClick(Sender: TObject);
var cd_ncm:string;
begin
  if not (datm_dse.qry_dse_item.State in [dsEdit, dsInsert]) then datm_dse.qry_dse_item.Edit;
  {Codigo NCM -----------------------------------------------------------------}
  datm_dse.qry_dse_item.FieldByName('CD_NCM').AsString := ConsultaOnLineExSQL(
                                                   'SELECT CODIGO, DESCRICAO FROM TNCM',
                                                   'NCM'                        ,
                                                   ['CODIGO','DESCRICAO']       ,
                                                   ['Código','Descrição']       ,
                                                   'CODIGO' );
  edt2_cd_exportadorExit(edt3_cd_ncm);
end;

procedure Tfrm_dse.btn3_unid_medClick(Sender: TObject);
begin
  if not (datm_dse.qry_dse_item.State in [dsEdit, dsInsert]) then datm_dse.qry_dse_item.Edit;
  {Unidade de Medida ----------------------------------------------------------}
  datm_dse.qry_dse_item.FieldByName('CD_UNID_MED_COMERCIALIZADA').AsString :=  ConsultaOnLineExSQL(
                                                   'SELECT CD_UNID_MEDIDA, NM_UNID_MEDIDA FROM TUNID_MEDIDA_BROKER WHERE IN_ATIVO = "1"'  ,
                                                   'Unidade de Medida Comercializada'  ,
                                                   ['CD_UNID_MEDIDA','NM_UNID_MEDIDA'] ,
                                                   ['Código','Descrição']              ,
                                                   'CD_UNID_MEDIDA' );
  edt2_cd_exportadorExit(edt3_cd_unid_med);
end;

procedure Tfrm_dse.edt1_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_F5 then
     begin
     if sender = edt1_cd_unid_neg     then btn1_unid_negClick(nil)      else
     if sender = edt1_cd_produto      then btn1_produtoClick(nil)       else
     if sender = edt2_nr_processo     then btn2_nr_processoClick(nil)   else
     if sender = edt2_cd_exportador   then btn2_exportadorClick(nil)    else
     if sender = edt2_cd_tpexportador then btn2_tpexportadorClick(nil)  else
     if sender = edt2_cd_natureza     then btn2_naturezaClick(nil)      else
     if sender = edt2_cd_urfdespacho  then btn2_urfdespachoClick(nil)   else
     if sender = edt2_cd_urfembarque  then btn2_urfembarqueClick(nil)   else
     if sender = edt2_cnpj_courrier   then btn2_cnpj_courrierClick(nil) else
     if sender = edt2_cd_paisdestino  then btn2_paisdestinoClick(nil)   else
     if sender = edt2_cd_via          then btn2_viaClick(nil)           else
     if sender = edt2_cd_moeda        then btn2_moedaClick(nil)         else
     if sender = edt3_cd_ncm          then btn3_ncmClick(nil)           else

     if sender = edt2_cd_ul_dine      then btn2_ul_dineClick(nil)       else
     if sender = edt2_cd_ul_dsine     then btn2_ul_dsineClick(nil)      else

     if sender = edt3_cd_unid_med     then btn3_unid_medClick(nil)      ;
     end;

end;

procedure Tfrm_dse.btn1_unid_negClick(Sender: TObject);
begin
  {Unidade de Negócio ---------------------------------------------------------}
  edt1_cd_unid_neg.Text :=  ConsultaOnLineExSQL(   'SELECT CD_UNID_NEG, NM_UNID_NEG, AP_UNID_NEG, CGC_UNID_NEG FROM TUNID_NEG WHERE IN_ATIVO = "1"',
                                                   'Unidade de Negócio'        ,
                                                   ['CD_UNID_NEG','NM_UNID_NEG','CGC_UNID_NEG'] ,
                                                   ['Código','Nome','CNPJ']    ,
                                                   'CD_UNID_NEG' );
  edt2_cd_exportadorExit(edt1_cd_unid_neg);
end;

procedure Tfrm_dse.btn1_produtoClick(Sender: TObject);
begin
  {Produto --------------------------------------------------------------------}
  edt1_cd_produto.Text :=  ConsultaOnLineExSQL(  'SELECT CD_PRODUTO, NM_PRODUTO, AP_PRODUTO FROM TPRODUTO WHERE IN_ATIVO = "1"',
                                                   'Produtos'        ,
                                                   ['CD_PRODUTO','NM_PRODUTO','AP_PRODUTO'] ,
                                                   ['Código','Nome','Apelido']    ,
                                                   'CD_PRODUTO' );
  edt2_cd_exportadorExit(edt1_cd_produto);
end;

procedure Tfrm_dse.btn2_cnpj_courrierClick(Sender: TObject);
begin
  if not (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then datm_dse.qry_dse.Edit;
  {CNPJ Courrier --------------------------------------------------------------}
  datm_dse.qry_dse.FieldByName('CD_CNPJ_COURRIER').AsString := ConsultaOnLineExSQL(
                                                   'SELECT CODIGO, DESCRICAO, APELIDO, CGC_TRANSPORTADOR FROM TTRANSPORTADOR_ITL ',
                                                   'Courrier'                       ,
                                                   ['CODIGO','DESCRICAO','APELIDO', 'CGC_TRANSPORTADOR'] ,
                                                   ['Código','Descrição','Apelido', 'CNPJ'] ,
                                                   'CGC_TRANSPORTADOR' );
end;

procedure Tfrm_dse.edt2_tpcourrierChange(Sender: TObject);
begin
   pnl_cnpj.Visible   := NOT (trim(edt2_tpcourrier.Text) = '');
   
   {Quando o tipo do exportador for Courrier terá habilitado o botão de consulta
    buscando os cnpj's da tabela de TRANSPORTADOR_ITL.

    Quando for postal o usuário se obrigará a digitar o CNPJ sem consulta, pois
    não sabemos de qual tabela fazer a consulta.                               }

   btn2_cnpj_courrier.Visible  := NOT (copy(edt2_tpcourrier.Text,1,1) = 'P');

   if (copy(edt2_tpcourrier.Text,1,1) = 'C') then lbl_cnpj.Caption := 'CNPJ Courrier';
   if (copy(edt2_tpcourrier.Text,1,1) = 'P') then lbl_cnpj.Caption := 'CNPJ Postal'  ;
   if not pnl_cnpj.Visible then datm_dse.qry_dse.FieldByName('CD_CNPJ_COURRIER').AsString := '';
end;

procedure Tfrm_dse.FormShow(Sender: TObject);
begin
  edt_chave.Text        := '';
  cb_ordem.ItemIndex    := -1;
  edt1_cd_unid_neg.Text := str_cd_unid_neg;
  edt1_cd_produto.Text  := str_cd_produto;
  edt2_cd_exportadorExit(edt1_cd_unid_neg);
  edt2_cd_exportadorExit(edt1_cd_produto);
  AbreTabelaDSE;
end;

procedure Tfrm_dse.btn_salvarClick(Sender: TObject);
begin
  case pgDSE.ActivePageIndex of
    {Lista -------------------}
    0: begin
       end;
    {Dados Globais -----------}
    1,3: begin
       if ValidaCampos then datm_dse.qry_dse.Post;
       end;
    {NCM(s) de Despacho-------}
    2: begin
       if ValidaCampos then datm_dse.qry_dse_item.Post;
       end;
  end;
end;

procedure Tfrm_dse.btn_cancelarClick(Sender: TObject);
begin
  case pgDSE.ActivePageIndex of
    {Lista -------------------}
    0: begin
       end;
    {Dados Globais -----------}
    1,3: begin
       datm_dse.qry_dse.Cancel;
       end;
    {NCM(s) de Despacho-------}
    2: begin
       datm_dse.qry_dse_item.Cancel;
       end;
  end;
end;

procedure Tfrm_dse.btn_excluirClick(Sender: TObject);
begin
  case pgDSE.ActivePageIndex of
    {Lista -------------------}
    0: begin
       pgDSE.ActivePage := ts_lista;
       Application.ProcessMessages;
       if (Application.MessageBox('Confirma exclusão ?','DDBroker',MB_YESNO+MB_ICONQUESTION) = ID_YES) then
           begin
           frm_dse.sp_exclui_dse(datm_dse.qry_dse.FieldByName('NR_PROCESSO').AsString);
           AbreTabelaDSE;
           end;
       end;
    {Dados Globais -----------}
  1,3: begin

       if (Application.MessageBox('Confirma exclusão ?','DDBroker',MB_YESNO+MB_ICONQUESTION) = ID_YES) then
           begin
           frm_dse.sp_exclui_dse(datm_dse.qry_dse.FieldByName('NR_PROCESSO').AsString);
           AbreTabelaDSE;
           end;
       end;
    {NCM(s) de Despacho-------}
    2: begin
       if Application.MessageBox('Confirma exclusão ?','DDBroker',MB_YESNO+MB_ICONQUESTION) = ID_YES then datm_dse.qry_dse_item.Delete;
       end;
  end;
end;

procedure Tfrm_dse.btn_sairClick(Sender: TObject);
begin
Close;
end;


{Verifica a consistencia dos campos antes de confirmar a inclusão/alteração ---}
{------------------------------------------------------------------------------}
function Tfrm_dse.ValidaCampos:Boolean;
begin
  Result := True;
  case pgDSE.ActivePageIndex of
       {Lista ----------------}
    0: begin
       end;
       {Dados Globais --------}
    1: begin
         if ((pnl_cnpj.Visible) and (datm_dse.qry_dse.FieldByName('CD_CNPJ_COURRIER').AsString = '')) then begin
            Application.MessageBox(PChar(lbl_cnpj.Caption+' não pode ser nulo.'),'DDBroker',MB_OK+MB_ICONERROR);
            edt2_cnpj_courrier.SetFocus;
            Result := False;
         end;
       end;
       {NCM(s) de Despacho----}
    2: begin
       end;
  end;
end;

procedure Tfrm_dse.btn2_nr_processoClick(Sender: TObject);
var nr_processo, mPROCESSO : string;
begin
  if not (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then datm_dse.qry_dse.Edit; 
  {Processo -------------------------------------------------------------------}
  nr_processo          :=
  ConsultaOnLineExSQL(   'SELECT SUBSTRING(NR_PROCESSO, 5, 14) AS NR_PROCESSO, CD_CLIENTE,' +
                         '(SELECT AP_EMPRESA FROM TEMPRESA_NAC CL WHERE CL.CD_EMPRESA = PR.CD_CLIENTE) AS NM_CLIENTE,' +
                         'CD_SERVICO, (SELECT NM_SERVICO FROM TSERVICO SV WHERE SV.CD_SERVICO = PR.CD_SERVICO) AS NM_SERVICO,' +
                         'DT_ABERTURA, CD_EMBARCACAO, (SELECT NM_EMBARCACAO FROM TEMBARCACAO EB WHERE EB.CD_EMBARCACAO = PR.CD_EMBARCACAO) AS NM_EMBARCACAO,' +
                         'NR_CONHECIMENTO, NR_CONHECIMENTO_MASTER, NR_DI, NR_MANIFESTO, NR_PROC_REF FROM TPROCESSO PR ' +
                         'WHERE CD_UNID_NEG = ' + QuotedStr(edt1_cd_unid_neg.Text) +
                         ' AND   CD_PRODUTO = ' + QuotedStr(edt1_cd_produto.Text ) + ' AND IN_CANCELADO = ''0'' ORDER BY SUBSTRING(NR_PROCESSO,13,2) DESC, SUBSTRING(NR_PROCESSO,5,2), NR_PROCESSO DESC','Manutenção do Processo',
                        ['NR_PROCESSO' ,'CD_CLIENTE'  ,'NM_CLIENTE','CD_SERVICO'  ,'NM_SERVICO','DT_ABERTURA', 'CD_EMBARCACAO'  ,'NM_EMBARCACAO','NR_CONHECIMENTO' ,'NR_CONHECIMENTO_MASTER' ,'NR_DI','NR_MANIFESTO', 'NR_PROC_REF' ],
                        ['Nr. Processo','Cod. Cliente','Cliente'   ,'Cod. Serviço','Serviço'   ,'Data de Abertura','Cod. Embarcação','Embarcação'   ,'Nr. Conhecimento','Nr. Conhecimento Master','DI'   ,'Nr. Manifesto', 'Nr. da Referência'],
                         'NR_PROCESSO');
//  datm_dse.qry_dse.FieldByName('NR_PROCESSO').AsString :=  edt1_cd_unid_neg.Text + edt1_cd_produto.Text + nr_processo;
  mPROCESSO := edt1_cd_unid_neg.Text + edt1_cd_produto.Text + nr_processo;
  if datm_dse.ExisteProcesso(mPROCESSO) then
     begin
     datm_dse.qry_dse.Cancel;
     datm_dse.qry_dse.Locate('NR_PROCESSO',mPROCESSO,[]);
     datm_dse.qry_dse.Edit;
     end
  else
     begin
     datm_dse.qry_dse.Cancel;
     sp_inclui_dse(mPROCESSO);
     AbreTabelaDSE;
     datm_dse.qry_dse.Locate('NR_PROCESSO',mPROCESSO,[]);
     datm_dse.qry_dse.Edit;
     end;
  edt2_nr_despacho.SetFocus;
end;

procedure Tfrm_dse.edt2_nr_processoExit(Sender: TObject);
var mPROCESSO : string;
begin
if datm_dse.tp_op_dse = '' then exit;

if edt2_nr_processo.Text <> '' then
  begin
  mPROCESSO := edt1_cd_unid_neg.Text + edt1_cd_produto.Text + edt2_nr_processo.Text;
  if datm_dse.ExisteProcesso(mPROCESSO) then
     begin
     if (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then datm_dse.qry_dse.Cancel;
     datm_dse.qry_dse.Locate('NR_PROCESSO',mPROCESSO,[]);
    // Application.MessageBox('Já existe DSE para o processo selecionado.','DDBroker',MB_OK+MB_ICONERROR);
     datm_dse.qry_dse.Edit;
     datm_dse.qry_dse.FieldByName('DT_ABERTURA_DSE').AsDateTime := Date;
     end
  else
     begin
     if (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then datm_dse.qry_dse.Cancel;
     sp_inclui_dse(mPROCESSO);
     datm_dse.qry_dse.Edit;
     end;
  end;
  edt2_nr_despacho.SetFocus;
  
end;

procedure Tfrm_dse.AbreTabelaDSE;
begin
  with datm_dse do
   begin
   qry_dse.Close;
   qry_dse.ParamByName('CD_UNID_NEG').AsString := edt1_cd_unid_neg.Text;
   qry_dse.ParamByName('CD_PRODUTO').AsString  := edt1_cd_produto.Text;
   qry_dse.Prepare;
   qry_dse.Open;
   qry_dse_item.Open;
   end;
end;

{Inclui a DSE trazendo os dados que já houverem na tprocesso_exp --------------}
procedure Tfrm_dse.sp_inclui_dse(pPROCESSO:string);
begin
  with datm_dse do
  begin
  try
    if Not datm_main.db_broker.Connected then datm_main.db_broker.Connected := True;
    datm_main.db_broker.StartTransaction;
    CloseStoredProc(sp_inclui_dse);
    sp_inclui_dse.ParamByName('@NR_PROCESSO').AsString := pPROCESSO;
    ExecStoredProc(sp_inclui_dse);
    CloseStoredProc(sp_inclui_dse);
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
    TrataErro(E);
    end;
  end;

  end;
end;



procedure Tfrm_dse.btn_consultaClick(Sender: TObject);
begin
  AbreTabelaDSE;
end;

procedure Tfrm_dse.pgDSEChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if ( pgDSE.ActivePage = ts_dados )            then AllowChange := not (datm_dse.qry_dse.State in [dsEdit, dsInsert]);
  if ( pgDSE.ActivePage = ts_ncm   )            then AllowChange := not (datm_dse.qry_dse_item.State in [dsEdit, dsInsert]);
  if ( pgDSE.ActivePage = ts_complementares   ) then AllowChange := not (datm_dse.qry_dse_volume.State in [dsEdit, dsInsert]);

  if ((AllowChange) and (pgDSE.ActivePage = ts_complementares)) then AllowChange := not (datm_dse.qry_dse.State in [dsEdit, dsInsert]);

  if not AllowChange then
    MessageDlg('Você está com o registro em modo de edição. Favor gravar ou cancelar antes de mudar de guia.', mtInformation, [mbOk], 0)
  else
    datm_dse.HabilitaBotoes;
end;

procedure Tfrm_dse.FormCreate(Sender: TObject);
begin
  pgDSE.ActivePageIndex := 0;
end;


{Exclui a DSE e todos seus itens ----------------------------------------------}
procedure Tfrm_dse.sp_exclui_dse(pPROCESSO:string);
begin
  with datm_dse do
  begin
  try
    if Not datm_main.db_broker.Connected then datm_main.db_broker.Connected := True;
    datm_main.db_broker.StartTransaction;
    CloseStoredProc(sp_exclui_dse);
    sp_exclui_dse.ParamByName('@NR_PROCESSO').AsString := pPROCESSO;
    ExecStoredProc(sp_exclui_dse);
    CloseStoredProc(sp_exclui_dse);
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
    TrataErro(E);
    end;
  end;

  end;
end;



{Habilita/Desabilita os campos para edição ------------------------------------}
procedure Tfrm_dse.HabilitaEdicao;
var Hab : Boolean;
begin
  if (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then
     begin
     Hab := False;
     end
  else
     begin
     Hab := not (trim(datm_dse.qry_dse.FieldByName('NR_DSE').AsString) = '');
     end;




  {Dados Globais -------------------------}
  edt2_nr_processo.ReadOnly     := Hab;
  edt2_cd_exportador.ReadOnly   := Hab;
  edt2_nr_despacho.ReadOnly     := Hab;
  edt2_cd_tpexportador.ReadOnly := Hab;
  edt2_cd_natureza.ReadOnly     := Hab;
  edt2_cd_urfdespacho.ReadOnly  := Hab;
  edt2_cd_urfembarque.ReadOnly  := Hab;
  edt2_carga_armaz.ReadOnly     := Hab;
  edt2_tpcourrier.ReadOnly      := Hab;
  edt2_cnpj_courrier.ReadOnly   := Hab;
  edt2_cd_paisdestino.ReadOnly  := Hab;
  edt2_cd_via.ReadOnly          := Hab;
  edt2_identificador.ReadOnly   := Hab;
  edt2_totalpesobruto.ReadOnly  := Hab;
  edt2_cd_moeda.ReadOnly        := Hab;
  edt2_totalmoeda.ReadOnly      := Hab;

  edt2_die.ReadOnly             := Hab;
  edt2_dsie.ReadOnly            := Hab;
  edt2_dias.ReadOnly            := Hab;

  edt2_dine.ReadOnly            := Hab;
  edt2_cd_ul_dine.ReadOnly      := Hab;
  edt2_dt_dine.ReadOnly         := Hab;

  edt2_dsine.ReadOnly           := Hab;
  edt2_cd_ul_dsine.ReadOnly     := Hab;
  edt2_dt_dsine.ReadOnly        := Hab;

  edt2_qtd_total.ReadOnly       := Hab;
  edt2_recinto.ReadOnly         := Hab;
  edt2_setor.ReadOnly           := Hab;
  edt2_usuario.ReadOnly         := Hab;
  edt2_doc_inf.ReadOnly         := Hab;
  edt2_inf_pres_carga.ReadOnly  := Hab;

  btn2_ul_dine.Enabled          := Not Hab;
  btn2_ul_dsine.Enabled         := Not Hab;


  btn2_nr_processo.Enabled      := not Hab;
  btn2_exportador.Enabled       := not Hab;
  btn2_tpexportador.Enabled     := not Hab;
  btn2_natureza.Enabled         := not Hab;
  btn2_urfdespacho.Enabled      := not Hab;
  btn2_urfembarque.Enabled      := not Hab;
  btn2_cnpj_courrier.Enabled    := not Hab;
  btn2_paisdestino.Enabled      := not Hab;
  btn2_via.Enabled              := not Hab;
  btn2_moeda.Enabled            := not Hab;

  if Hab then
     begin
     edt2_nr_processo.Color     := clSilver;
     edt2_cd_exportador.Color   := clSilver;
     edt2_nr_despacho.Color     := clSilver;
     edt2_cd_tpexportador.Color := clBtnFace;
     edt2_cd_natureza.Color     := clBtnFace;
     edt2_cd_urfdespacho.Color  := clBtnFace;
     edt2_cd_urfembarque.Color  := clBtnFace;
     edt2_tpcourrier.Color      := clBtnFace;
     edt2_cnpj_courrier.Color   := clBtnFace;
     edt2_cd_paisdestino.Color  := clBtnFace;
     edt2_cd_via.Color          := clBtnFace;
     edt2_identificador.Color   := clBtnFace;
     edt2_totalpesobruto.Color  := clBtnFace;
     edt2_cd_moeda.Color        := clBtnFace;
     edt2_totalmoeda.Color      := clBtnFace;
     edt2_carga_armaz.Color     := clBtnFace;

     edt2_die.Color             := clBtnFace;
     edt2_dsie.Color            := clBtnFace;
     edt2_dias.Color            := clBtnFace;
     edt2_dine.Color            := clBtnFace;
     edt2_cd_ul_dine.Color      := clBtnFace;
     edt2_dt_dine.Color         := clBtnFace;
     edt2_dsine.Color           := clBtnFace;
     edt2_cd_ul_dsine.Color     := clBtnFace;
     edt2_dt_dsine.Color        := clBtnFace;
     edt2_qtd_total.Color       := clBtnFace;
     edt2_recinto.Color         := clBtnFace;
     edt2_setor.Color           := clBtnFace;
     edt2_usuario.Color         := clBtnFace;
     edt2_doc_inf.Color         := clBtnFace;
     edt2_inf_pres_carga.Color  := clBtnFace;
     end
  else
     begin
     edt2_nr_processo.Color     := clWindow;
     edt2_cd_exportador.Color   := clWindow;
     edt2_nr_despacho.Color     := clWindow;
     edt2_cd_tpexportador.Color := clWindow;
     edt2_cd_natureza.Color     := clWindow;
     edt2_cd_urfdespacho.Color  := clWindow;
     edt2_cd_urfembarque.Color  := clWindow;
     edt2_tpcourrier.Color      := clWindow;
     edt2_cnpj_courrier.Color   := clWindow;
     edt2_cd_paisdestino.Color  := clWindow;
     edt2_cd_via.Color          := clWindow;
     edt2_identificador.Color   := clWindow;
     edt2_totalpesobruto.Color  := clWindow;
     edt2_cd_moeda.Color        := clWindow;
     edt2_totalmoeda.Color      := clWindow;
     edt2_carga_armaz.Color     := clWindow;

     edt2_die.Color             := clWindow;
     edt2_dsie.Color            := clWindow;
     edt2_dias.Color            := clWindow;
     edt2_dine.Color            := clWindow;
     edt2_cd_ul_dine.Color      := clWindow;
     edt2_dt_dine.Color         := clWindow;
     edt2_dsine.Color           := clWindow;
     edt2_cd_ul_dsine.Color     := clWindow;
     edt2_dt_dsine.Color        := clWindow;
     edt2_qtd_total.Color       := clWindow;
     edt2_recinto.Color         := clWindow;
     edt2_setor.Color           := clWindow;
     edt2_usuario.Color         := clWindow;
     edt2_doc_inf.Color         := clWindow;
     edt2_inf_pres_carga.Color  := clWindow;
     end;

  {NCM de Despacho -----------------------}
  edt3_cd_ncm.ReadOnly          := Hab;
  edt3_destaquencm.ReadOnly     := Hab;
  edt3_qtd.ReadOnly             := Hab;
  edt3_cd_unid_med.ReadOnly     := Hab;
  edt3_pesoliquido.ReadOnly     := Hab;
  edt3_valor.ReadOnly           := Hab;
  edt3_linha1.ReadOnly          := Hab;
  edt3_linha2.ReadOnly          := Hab;
  edt3_linha3.ReadOnly          := Hab;
  edt3_qtd_comerc.ReadOnly      := Hab;
  btn3_ncm.Enabled              := not Hab;
  btn3_unid_med.Enabled         := not Hab;
  if Hab then
     begin
     edt3_cd_ncm.Color          := clBtnFace;
     edt3_destaquencm.Color     := clBtnFace;
     edt3_qtd.Color             := clBtnFace;
     edt3_cd_unid_med.Color     := clBtnFace;
     edt3_pesoliquido.Color     := clBtnFace;
     edt3_valor.Color           := clBtnFace;
     edt3_linha1.Color          := clBtnFace;
     edt3_linha2.Color          := clBtnFace;
     edt3_linha3.Color          := clBtnFace;
     edt3_qtd_comerc.Color      := clBtnFace;
     end
  else
     begin
     edt3_qtd_comerc.Color      := clWindow;
     edt3_cd_ncm.Color          := clWindow;
     edt3_destaquencm.Color     := clWindow;
     edt3_qtd.Color             := clWindow;
     edt3_cd_unid_med.Color     := clWindow;
     edt3_pesoliquido.Color     := clWindow;
     edt3_valor.Color           := clWindow;
     edt3_linha1.Color          := clWindow;
     edt3_linha2.Color          := clWindow;
     edt3_linha3.Color          := clWindow;
     end;

  {Dados Complementares ------------------------ }
  edt4_tx_doc_instrutivos.ReadOnly    := Hab;
  edt4_tx_inf_complementares.ReadOnly := Hab;
  dbgrd_volumes.ReadOnly              := Hab;

//  btn4_incluir.Enabled                := Not Hab;
//  btn4_salvar.Enabled                 := Not Hab;
//  btn4_cancelar.Enabled               := Not Hab;
//  btn4_excluir.Enabled                := Not Hab;


  dbgrd_volumes.Enabled               := Not Hab;

  if Hab then
     begin
     edt4_tx_doc_instrutivos.Color    := clBtnFace;
     edt4_tx_inf_complementares.Color := clBtnFace;
     end
  else
     begin
     edt4_tx_doc_instrutivos.Color    := clWindow;
     edt4_tx_inf_complementares.Color := clWindow;
     end;

  VerificaNatureza;
end;



procedure Tfrm_dse.btn4_incluir_volClick(Sender: TObject);
begin
  datm_dse.qry_dse_volume.Append;
end;

procedure Tfrm_dse.btn4_excluir_volClick(Sender: TObject);
begin
  if (Application.MessageBox('Confirma exclusão do volume ?','DDBroker',MB_YESNO+MB_ICONQUESTION) = ID_YES) then
     begin
     datm_dse.qry_dse_volume.Delete;
     end;

end;

procedure Tfrm_dse.btn2_ul_dineClick(Sender: TObject);
begin
  if not (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then datm_dse.qry_dse.Edit;
  {UL EMISSÃO DI --------------------------------------------------------------}
  datm_dse.qry_dse.FieldByName('CD_UL_EMISSAO_DI').AsString :=  ConsultaOnLineExSQL(
                                                   'SELECT CODIGO, DESCRICAO FROM TURF',
                                                   'URF de Despacho'            ,
                                                   ['CODIGO','DESCRICAO']       ,
                                                   ['Código','Descrição']       ,
                                                   'CODIGO' );
  edt2_cd_exportadorExit(edt2_cd_ul_dine);
end;

procedure Tfrm_dse.btn2_ul_dsineClick(Sender: TObject);
begin
  if not (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then datm_dse.qry_dse.Edit;
  {UL EMISSÃO DI --------------------------------------------------------------}
  datm_dse.qry_dse.FieldByName('CD_UL_EMISSAO_DSI').AsString :=  ConsultaOnLineExSQL(
                                                   'SELECT CODIGO, DESCRICAO FROM TURF',
                                                   'URF de Despacho'            ,
                                                   ['CODIGO','DESCRICAO']       ,
                                                   ['Código','Descrição']       ,
                                                   'CODIGO') ;
  edt2_cd_exportadorExit(edt2_cd_ul_dsine);
end;

procedure Tfrm_dse.btn4_incluirClick(Sender: TObject);
begin
  datm_dse.qry_dse_volume.Insert;
  dbgrd_volumes.SetFocus;
end;

procedure Tfrm_dse.btn4_salvarClick(Sender: TObject);
begin
  datm_dse.qry_dse_volume.Post;
end;

procedure Tfrm_dse.btn4_cancelarClick(Sender: TObject);
begin
  datm_dse.qry_dse_volume.Cancel;
end;

procedure Tfrm_dse.btn4_excluirClick(Sender: TObject);
begin
if not datm_dse.qry_dse_volume.IsEmpty then
  begin
  if Application.MessageBox('Confirma exclusão do volume ?','DDBroker',MB_YESNO+MB_ICONQUESTION) = ID_YES then
     begin
     datm_dse.qry_dse_volume.Delete
     end;
  end
else
  begin
  btn4_excluir.Enabled := False;
  end;

end;

procedure Tfrm_dse.dbgrd_volumesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if (datm_dse.qry_dse_volume.State in [dsEdit, dsInsert]) and
    ((Key = vk_Tab) or (Key = vk_Down) or (Key = vk_Up) or (Key = vk_Prior) or (Key = vk_Next)) then
     begin
     Key := 0;
     end;
end;

procedure Tfrm_dse.pgDSEChange(Sender: TObject);
begin
  datm_dse.HabilitaBotoes;
end;


procedure Tfrm_dse.VerificaNatureza;
var Hab : boolean;
begin
  Hab := False;
  Hab := (datm_dse.qry_dse.FieldByName('CD_NATUREZA').AsString = '61');

  edt2_die.ReadOnly             := not Hab;
  edt2_dsie.ReadOnly            := not Hab;

  edt2_dine.ReadOnly            := not Hab;
  edt2_cd_ul_dine.ReadOnly      := not Hab;
  edt2_dt_dine.ReadOnly         := not Hab;

  edt2_dsine.ReadOnly           := not Hab;
  edt2_cd_ul_dsine.ReadOnly     := not Hab;
  edt2_dt_dsine.ReadOnly        := not Hab;

  if not Hab then
     begin
     if (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then
         begin
         datm_dse.qry_dseNR_DIE.AsString            := '';
         datm_dse.qry_dseNR_DSIE.AsString           := '';
         datm_dse.qry_dseNR_DI.AsString             := '';
         datm_dse.qry_dseCD_UL_EMISSAO_DI.AsString  := '';
         datm_dse.qry_dseDT_EMISSAO_DI.AsString     := '';
         datm_dse.qry_dseNR_DSI.AsString            := '';
         datm_dse.qry_dseCD_UL_EMISSAO_DSI.AsString := '';
         datm_dse.qry_dseDT_EMISSAO_DSI.AsString    := '';
         end;

     edt2_die.Color             := clBtnFace;
     edt2_dsie.Color            := clBtnFace;
     edt2_dine.Color            := clBtnFace;
     edt2_cd_ul_dine.Color      := clBtnFace;
     edt2_dt_dine.Color         := clBtnFace;
     edt2_dsine.Color           := clBtnFace;
     edt2_cd_ul_dsine.Color     := clBtnFace;
     edt2_dt_dsine.Color        := clBtnFace;
     end
  else
     begin
     edt2_die.Color             := clWindow;
     edt2_dsie.Color            := clWindow;
     edt2_dine.Color            := clWindow;
     edt2_cd_ul_dine.Color      := clWindow;
     edt2_dt_dine.Color         := clWindow;
     edt2_dsine.Color           := clWindow;
     edt2_cd_ul_dsine.Color     := clWindow;
     edt2_dt_dsine.Color        := clWindow;
     end;

  Hab := ((datm_dse.qry_dse.FieldByName('CD_NATUREZA').AsString = '43') or
          (datm_dse.qry_dse.FieldByName('CD_NATUREZA').AsString = '44') or
          (datm_dse.qry_dse.FieldByName('CD_NATUREZA').AsString = '45'));


  edt2_dias.ReadOnly            := not Hab;

  if Hab then
     begin
     edt2_dias.Color            := clWindow;
     end
  else
     begin
     if (datm_dse.qry_dse.State in [dsEdit, dsInsert]) then
         begin
         datm_dse.qry_dseDIAS.IsNull;
         end;
     edt2_dias.Color            := clBtnFace;
     end;

end;


procedure Tfrm_dse.btn_transmitirClick(Sender: TObject);
var
  vFileName, posicao : String;
  ClickedOK :Boolean;
begin


  if dbgrd_principal.SelectedRows.Count < 1 then begin
    pgDSE.ActivePage := ts_lista;  
    MessageDlg('Selecione um processo na listagem, para que seja registrada a DSE.', mtInformation, [mbOK], 0);
    exit;
  end;

  if not ConsisteEnvioDSE then begin
//    MessageDlg('Existem inconsistencias no preenchimento da sua DDE.' + #10#13 + 'Dessa forma o Broker não permite que a DSE seja transmitido.', mtInformation, [mbOK], 0);
    exit;
  end;

  vFileName := copy(StringReplace(datm_dse.qry_dse.FieldByName('NR_PROCESSO').AsString, '-', '', [rfReplaceAll]), 5, 6);

  if (Trim(vFileName) = '') then begin
    Exit;
  end;
  //troca da tabela TACESSO_SCX_EXP pela view VW_DESPACHANTE_CLIENTE - carlos 17/09/2009
  if not (TransmiteDSE( vFileName, ConsultaOnLineExFILTRO('VW_DESPACHANTE_CLIENTE','Escolha o Usuário',['CD_ACESSO','NM_USUARIO','CPF_USUARIO'],['Código','Usuário','CPF'],'CD_ACESSO','TIPO="RE" AND CD_EMPRESA="'+datm_dse.qry_dse.FieldByName('CD_EXPORTADOR').AsString +'"' , nil,'' ))) then begin
    MessageDlg('Ocorreu um erro na geração do arquivo.' + #10#13 + 'Favor informar o ocorrido ao suporte.', mtError, [mbOK], 0);
    exit;
  end;

  posicao := datm_dse.qry_dse.FieldByName('NR_PROCESSO').AsString;
  datm_dse.qry_dse.DisableControls;
  datm_dse.qry_dse.Close;
  datm_dse.qry_dse.Open;
  datm_dse.qry_dse.Locate('NR_PROCESSO',posicao,[]);
  datm_dse.qry_dse.EnableControls;
  Application.MessageBox('Processo Concluído!', 'Mensagem', MB_OK+MB_ICONINFORMATION);
  btn_consultaClick(self);  
end;


function Tfrm_dse.ConsisteEnvioDSE : Boolean;
var
  mTOT_VAL_ITENS : Currency;
  mTOT_PES_ITENS : Currency;
  mTOT_VAL       : Currency;
  mTOT_PES       : Currency;
  mTOT_QTD       : Currency;
  mTOT_QTD_ITENS : Currency;
  mQTD_COMERCIAL : Currency;
begin
  Result := True;
  with TQuery.Create(application) do begin
       DatabaseName := 'DBBROKER';
       SQL.Text := ' SELECT                            '+
                   '   VL_PESO_BRUTO  AS "TOT_PESO"  , '+
                   '   VL_TOTAL_MOEDA AS "TOT_VALOR" , '+
                   '   VL_QTD_TOTAL   AS "TOT_QTD"   , '+
                   '   (SELECT MIN(I.QT_COMERCIALIZADA) FROM TDSE_ITEM    I WHERE I.NR_PROCESSO = NR_PROCESSO) AS "QTD_UNID_COMERC",'+
                   '   (SELECT SUM(I.VL_PESO_LIQUIDO)   FROM TDSE_ITEM    I WHERE I.NR_PROCESSO = NR_PROCESSO) AS "TOT_PESO_ITENS", '+
                   '   (SELECT SUM(I.VL_TOTAL_ITEM)     FROM TDSE_ITEM    I WHERE I.NR_PROCESSO = NR_PROCESSO) AS "TOT_VALOR_ITENS",'+
                   '   (SELECT SUM(V.VL_QUANTIDADE)     FROM TDSE_VOLUMES V WHERE V.NR_PROCESSO = NR_PROCESSO) AS "TOT_QTD_ITENS"   '+
                   ' FROM TDSE WHERE NR_PROCESSO = '+QuotedStr(datm_dse.qry_dse.FieldByName('NR_PROCESSO').AsString);
       Open;
       mTOT_PES_ITENS := FieldByName('TOT_PESO_ITENS' ).AsFloat;
       mTOT_VAL_ITENS := FieldByName('TOT_VALOR_ITENS').AsFloat;
       mTOT_QTD_ITENS := FieldByName('TOT_QTD_ITENS').AsFloat;
       mTOT_VAL       := FieldByName('TOT_VALOR').AsFloat;
       mTOT_PES       := FieldByName('TOT_PESO' ).AsFloat;
       mTOT_QTD       := FieldByName('TOT_QTD'  ).AsFloat;
       mQTD_COMERCIAL := FieldByName('QTD_UNID_COMERC'  ).AsFloat;
       Close;
  end;

  if (mTOT_VAL <> mTOT_VAL_ITENS) then begin
     Result := False;
     Application.MessageBox('A DSE não pode ser transmitida.'+#13+'O Valor da capa é diferente do valor da soma dos itens.','DDBroker',MB_OK+MB_ICONERROR);
     pgDSE.ActivePage := ts_dados;
     edt2_totalmoeda.SetFocus;
     Exit;
  end;

  if (mTOT_QTD <> mTOT_QTD_ITENS ) then begin
     Result := False;
     Application.MessageBox('A DSE não pode ser transmitida.'+#13+'O Valor total dos volumes é diferente da soma dos volumes','DDBroker',MB_OK+MB_ICONERROR);
     pgDSE.ActivePage := ts_dados;
     edt2_qtd_total.SetFocus;
     Exit;
  end;

  if (mQTD_COMERCIAL = 0) then begin
     Result := False;
     Application.MessageBox('A DSE não pode ser transmitida.'+#13+'A quantidade na unidade comercializada não pode ser zero','DDBRoker',MB_OK+MB_ICONERROR);
     pgDSE.ActivePage := ts_ncm;
     edt3_qtd_comerc.SetFocus;
     Exit;
  end;

end;

procedure Tfrm_dse.edt2_statusMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  edt2_status.ShowHint := False;
  if trim(edt2_status.Text) <> '' then begin
  edt2_status.ShowHint := True;
  edt2_status.Hint := edt2_status.Text
  end;
end;

end.

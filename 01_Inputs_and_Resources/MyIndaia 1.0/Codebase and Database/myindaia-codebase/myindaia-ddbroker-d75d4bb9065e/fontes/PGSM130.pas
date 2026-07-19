(*************************************************************************************************
Sistema: DD Broker - Bysoft
PROGRAMA: PGSM130.PAS - Form Abertura do Processo
AUTOR: BYSOFT
DATA: dd/mm/yyyy
Manutenção: Carla Regina Castelo

Data: 18/09/2002 -  Mudança de apresentar somente o nº da fatura, para optar por outros documentos.
                    Tela mais rápida, pois abria todos os processos.
Data : 21/08/2008 - Inclusão do campo Instrução de Desembaraço - Rodrigo Capra
*************************************************************************************************)

unit PGSM130;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Grids, DBGrids, Mask, DBCtrls, ComCtrls, Buttons, ExtCtrls,
  Db, DBTables, RxMemDS, Spin, ExcelXP, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter;

// Componentes para os fatores
type
  TPanelFator = class(TPanel)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TLabelFator = class(TLabel)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TEditFator = class(TEdit)
  private
    FFieldName: String;
    FTableName: String;
    FKeyFieldName: String;
    FResultFieldName: String;
    procedure DoOnExit(Sender: TObject);
    function GetValue: String;
    procedure SetValue(const Value: String);
  public
    constructor Create(AOwner: TComponent); override;
    property FieldName: String read FFieldName write FFieldName;
    property TableName: String read FTableName write FTableName;
    property KeyFieldName: String read FKeyFieldName write FKeyFieldName;
    property ResultFieldName: String read FResultFieldName write FResultFieldName;
    property Value: String read GetValue write SetValue;
  end;

  TFloatFator = class(TEdit)
  private
    FFieldName: String;
    FOnKeyPress: TKeyPressEvent;
    function GetValue: Double;
    procedure SetValue(const Value: Double);
    procedure DoOnKeyPress(Sender: TObject; var Key: Char);
  public
    constructor Create(AOwner: TComponent); override;
    property FieldName: String read FFieldName write FFieldName;
    property Value: Double read GetValue write SetValue;
    property OnKeyPress: TKeyPressEvent read FOnKeyPress write FOnKeyPress;
  end;

  TIntegerFator = class(TEdit)
  private
    FFieldName: String;
    FOnKeyPress: TKeyPressEvent;
    function GetValue: Integer;
    procedure SetValue(const Value: Integer);
    procedure DoOnKeyPress(Sender: TObject; var Key: Char);
  public
    constructor Create(AOwner: TComponent); override;
    property FieldName: String read FFieldName write FFieldName;
    property Value: Integer read GetValue write SetValue;
    property OnKeyPress: TKeyPressEvent read FOnKeyPress write FOnKeyPress;
  end;

  TDateTimeFator = class(TMaskEdit)
  private
    FFieldName: String;
    function GetValue: TDateTime;
    procedure SetValue(const Value: TDateTime);
  public
    constructor Create(AOwner: TComponent); override;
    property FieldName: String read FFieldName write FFieldName;
    property Value: TDateTime read GetValue write SetValue;
  end;

  TMemoFator = class(TMemo)
  private
    FFieldName: String;
    function GetValue: String;
    procedure SetValue(const Value: String);
  public
    constructor Create(AOwner: TComponent); override;
    property FieldName: String read FFieldName write FFieldName;
    property Value: String read GetValue write SetValue;
  end;

  TCheckBoxFator = class(TCheckBox)
  private
    FTrueValue: Char;
    FFalseValue: Char;
    FFieldName: String;
    function GetValue: Char;
    procedure SetValue(const Value: Char);
  public
    constructor Create(AOwner: TComponent); override;
    property TrueValue: Char read FTrueValue write FTrueValue;
    property FalseValue: Char read FFalseValue write FFalseValue;
    property FieldName: String read FFieldName write FFieldName;
    property Value: Char read GetValue write SetValue;
  end;

  TEditLookupFator = class(TEdit)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TSpeedButtonFator = class(TSpeedButton)
  private
    FLookupSQL: String;
    procedure DoOnClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent; AGlyph: TBitMap; ANumGlphs: Integer); reintroduce;
    property LookupSQL: String read FLookupSQL write FLookupSQL;
  end;

type
  Tfrm_abre_proc = class(TForm)
    pnl_manut_cadastro: TPanel;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_incluir: TSpeedButton;
    menu_manut: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    btn_manut_proc: TSpeedButton;
    mi_manut_proc: TMenuItem;
    btn_proc_realiza: TSpeedButton;
    mi_proc_realiza: TMenuItem;
    btn_instr_embarque: TSpeedButton;
    mi_instr_embarque: TMenuItem;
    btn_pedido: TSpeedButton;
    mi_pedido: TMenuItem;
    edt_nm_usuario: TEdit;
    Bevel1: TBevel;
    lbl_nm_usuario: TLabel;
    pnl_duplica_proc: TPanel;
    btn_co_processo_fonte: TSpeedButton;
    chkbox_dup: TCheckBox;
    msk_nr_processo_fonte: TMaskEdit;
    pnlUnidProd: TPanel;
    Shape1: TShape;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_cd_produto: TLabel;
    btn_co_produto: TSpeedButton;
    lbl_nr_processo: TLabel;
    edt_nm_unid_neg: TEdit;
    edt_nm_produto: TEdit;
    msk_nr_processo: TMaskEdit;
    msk_cd_unid_neg: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    Label15: TLabel;
    spin_seq_processo: TSpinButton;
    msk_seq_processo: TMaskEdit;
    pnlCliServ: TPanel;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    lbl_cd_servico: TLabel;
    btn_co_servico: TSpeedButton;
    Label21: TLabel;
    edt_nm_cliente: TEdit;
    edt_nm_servico: TEdit;
    msk_cd_cliente: TMaskEdit;
    msk_cd_servico: TMaskEdit;
    eQtdProc: TEdit;
    pgcDadosFatores: TPageControl;
    tsDados: TTabSheet;
    tsFatores: TTabSheet;
    pnl_desembaraco: TPanel;
    Shape4: TShape;
    Shape3: TShape;
    Label1: TLabel;
    lbl_area: TLabel;
    btn_co_area: TSpeedButton;
    lbl_li: TLabel;
    Label34: TLabel;
    Label33: TLabel;
    lbl_fat: TLabel;
    lbl_entreposto: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    btn_co_celula: TSpeedButton;
    Label18: TLabel;
    lblEstufagem1: TLabel;
    Label2: TLabel;
    Btn_InstrucaoDesemb: TSpeedButton;
    edt_nm_area: TEdit;
    msk_nr_conhecimento: TMaskEdit;
    msk_nr_conhecimento_master: TMaskEdit;
    grdRef: TStringGrid;
    grdLI: TStringGrid;
    DBGrid_Doc: TDBGrid;
    dbgrid_conhec_vinc: TDBGrid;
    checbx_proc_vinc_ag: TCheckBox;
    cbbox_entreposto: TComboBox;
    edt_nm_analrc: TEdit;
    msk_cd_analrc: TMaskEdit;
    edt_nm_celula: TEdit;
    msk_cd_celula: TMaskEdit;
    cbbEstufagem1: TComboBox;
    EditInstrucaoDesemb: TMaskEdit;
    msk_cd_area: TMaskEdit;
    pnl_exp: TPanel;
    btn_co_cotacao: TSpeedButton;
    lb_ag_exp: TLabel;
    btn_co_ag_exp: TSpeedButton;
    lb_cia_amrador_exp: TLabel;
    btn_co_cia_exp: TSpeedButton;
    btn_co_arm_exp: TSpeedButton;
    Label8: TLabel;
    btn_co_origem_exp: TSpeedButton;
    lb_tp_comercial_exp: TLabel;
    btn_prop_exp: TSpeedButton;
    btn_co_destino_exp: TSpeedButton;
    Label10: TLabel;
    Label3: TLabel;
    lblEstufagem3: TLabel;
    edt_nm_ag_exp: TEdit;
    edt_nm_arm_exp: TEdit;
    edt_nm_destino_exp: TEdit;
    edt_nm_origem_exp: TEdit;
    edt_nm_cia_exp: TEdit;
    dgrp_tp_processo: TRadioGroup;
    msk_ref_exp: TMaskEdit;
    msk_cd_origem_exp: TMaskEdit;
    msk_cd_destino_exp: TMaskEdit;
    msk_cd_cia_exp: TMaskEdit;
    msk_cd_arm_exp: TMaskEdit;
    msk_cd_ag_exp: TMaskEdit;
    rdgroup_tp_comercial: TRadioGroup;
    msk_prop_exp: TMaskEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    btn_co_unid_vinc_exp: TSpeedButton;
    Label9: TLabel;
    btn_co_prod_vinc_exp: TSpeedButton;
    btn_proc_vinc_exp: TSpeedButton;
    Label11: TLabel;
    Shape2: TShape;
    edt_nm_unid_vinc: TEdit;
    edt_nm_prod_vinc: TEdit;
    msk_cd_unid_vinc: TMaskEdit;
    msk_cd_prod_vinc: TMaskEdit;
    msk_proc_vinc_exp: TMaskEdit;
    chkbx_proc_vinc_exp: TCheckBox;
    cbbEstufagem3: TComboBox;
    pnl_imp: TPanel;
    shp2: TShape;
    lb_ag: TLabel;
    btn_co_agente: TSpeedButton;
    lb_cia_amrador: TLabel;
    btn_co_cia: TSpeedButton;
    btn_co_armador: TSpeedButton;
    Label5: TLabel;
    btn_co_origem: TSpeedButton;
    Label6: TLabel;
    btn_co_destino: TSpeedButton;
    btn_co_cot_imp: TSpeedButton;
    lblEstufagem2: TLabel;
    Shape5: TShape;
    lbl1: TLabel;
    Shape6: TShape;
    Label19: TLabel;
    Label20: TLabel;
    edt_nm_agente: TEdit;
    edt_nm_cia: TEdit;
    edt_nm_armador: TEdit;
    edt_nm_origem: TEdit;
    edt_nm_destino: TEdit;
    rd_group_tp_proc: TRadioGroup;
    msk_cd_origem: TMaskEdit;
    msk_cd_destino: TMaskEdit;
    msk_cd_cia: TMaskEdit;
    msk_cd_armador: TMaskEdit;
    msk_cd_agente: TMaskEdit;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    btn_co_unid_vinc_imp: TSpeedButton;
    Label13: TLabel;
    btn_co_prod_vinc_imp: TSpeedButton;
    btn_proc_vinc_imp: TSpeedButton;
    Label14: TLabel;
    shp1: TShape;
    edt_nm_unid_vinc_imp: TEdit;
    edt_nm_prod_vinc_imp: TEdit;
    msk_cd_unid_vinc_imp: TMaskEdit;
    msk_cd_prod_vinc_imp: TMaskEdit;
    msk_proc_vinc_imp: TMaskEdit;
    chkbx_proc_vinc_imp: TCheckBox;
    cbbEstufagem2: TComboBox;
    msk_proposta: TMaskEdit;
    grdRefFIImp: TStringGrid;
    scbFatores: TScrollBox;
    tsFollowup: TTabSheet;
    tsBid: TTabSheet;
    pnlBid: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    dbDestNest: TDBEdit;
    dbCdDestNest: TDBEdit;
    dbCdPort: TDBEdit;
    dbPort: TDBEdit;
    dbCdCity: TDBEdit;
    dbCity: TDBEdit;
    cxGrid1DBTableView1CONTRACT_ID: TcxGridDBColumn;
    cxGrid1DBTableView1CARRIER: TcxGridDBColumn;
    cxGrid1DBTableView1COMMODITY: TcxGridDBColumn;
    cxGrid1DBTableView1AREA: TcxGridDBColumn;
    cxGrid1DBTableView1UNIQUE_IDENTIFIER: TcxGridDBColumn;
    cxGrid1DBTableView1ORIGIN_SERVICE: TcxGridDBColumn;
    cxGrid1DBTableView1DESTINATION_SERVICE: TcxGridDBColumn;
    cxGrid1DBTableView1CD_ORIG_COUNTRY: TcxGridDBColumn;
    cxGrid1DBTableView1ORIG_COUNTRY: TcxGridDBColumn;
    cxGrid1DBTableView1CD_DEST_COUNTRY: TcxGridDBColumn;
    cxGrid1DBTableView1DEST_COUNTRY: TcxGridDBColumn;
    cxGrid1DBTableView1CD_ORIGIN_CITY: TcxGridDBColumn;
    cxGrid1DBTableView1ORIGIN_CITY: TcxGridDBColumn;
    cxGrid1DBTableView1CD_DEST_CITY: TcxGridDBColumn;
    cxGrid1DBTableView1DEST_CITY: TcxGridDBColumn;
    cxGrid1DBTableView1CD_PORT_LOAD: TcxGridDBColumn;
    cxGrid1DBTableView1PORT_LOAD: TcxGridDBColumn;
    cxGrid1DBTableView1CD_PORT_DISCHARGE: TcxGridDBColumn;
    cxGrid1DBTableView1PORT_DISCHARGE: TcxGridDBColumn;
    cxGrid1DBTableView1CD_EQUIPMENT: TcxGridDBColumn;
    cxGrid1DBTableView1EQUIPMENT: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL_PRICE: TcxGridDBColumn;
    cxGrid1DBTableView1PRICE_CURRENCY: TcxGridDBColumn;
    cxGrid1DBTableView1BASE_RATE: TcxGridDBColumn;
    cxGrid1DBTableView1BASE_RATE_CURRENCY: TcxGridDBColumn;
    cxGrid1DBTableView1TRANSIT_TIME: TcxGridDBColumn;
    cxGrid1DBTableView1CD_DEST_NEST: TcxGridDBColumn;
    cxGrid1DBTableView1DEST_NEST: TcxGridDBColumn;
    cxGrid1DBTableView1CD_ORIG_NEST: TcxGridDBColumn;
    cxGrid1DBTableView1ORIG_NEST: TcxGridDBColumn;
    cxGrid1DBTableView1PRODUCT: TcxGridDBColumn;
    cxGrid1DBTableView1SHIPPING_TERMS: TcxGridDBColumn;
    cxGrid1DBTableView1TRAFFIC_TYPE: TcxGridDBColumn;
    cxGrid1DBTableView1CARRIER_AWARD: TcxGridDBColumn;
    cxGrid1DBTableView1CARRIER_ALLOCATION: TcxGridDBColumn;
    cxGrid1DBTableView1CD_CARRIER: TcxGridDBColumn;
    dbCdAgente: TDBEdit;
    dbAgente: TDBEdit;
    Label25: TLabel;
    pnlRepresentante: TPanel;
    Label17: TLabel;
    msk_cd_representante: TMaskEdit;
    edt_nm_representante: TEdit;
    btn_co_representante: TSpeedButton;
    pnlLocalDesembarque: TPanel;
    Label26: TLabel;
    btn_co_local_desembarque: TSpeedButton;
    msk_cd_local_desembarque: TMaskEdit;
    edt_nm_local_desembarque: TEdit;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure msk_cd_servicoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_servicoClick(Sender: TObject);
    procedure btn_co_processo_fonteClick(Sender: TObject);
    procedure chkbox_dupClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_manut_procClick(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processo_fonteExit(Sender: TObject);
    procedure grdRefKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdRefSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure grdLIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdLISetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure grdFatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdFatSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure msk_cd_areaExit(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure btn_proc_realizaClick(Sender: TObject);
    procedure btn_prepararClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_unid_negChange(Sender: TObject);
    procedure msk_cd_produtoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure habilita_campos(Hab: Boolean);
    procedure btn_co_propostaClick(Sender: TObject);
    procedure msk_propostaExit(Sender: TObject);
    procedure btn_co_origemClick(Sender: TObject);
    procedure btn_co_agenteClick(Sender: TObject);
    procedure msk_cd_agenteExit(Sender: TObject);
    procedure btn_co_destinoClick(Sender: TObject);
    procedure msk_cd_origemExit(Sender: TObject);
    procedure msk_cd_destinoExit(Sender: TObject);
    procedure msk_cd_armadorExit(Sender: TObject);
    procedure msk_cd_ciaExit(Sender: TObject);
    procedure btn_co_armadorClick(Sender: TObject);
    procedure btn_co_ciaClick(Sender: TObject);
    procedure btn_instr_embarqueClick(Sender: TObject);
    procedure visualiza_paineis(tp_servico, tp_produto: string);
    procedure dgrp_tp_processoClick(Sender: TObject);
    procedure btn_co_ag_expClick(Sender: TObject);
    procedure btn_co_destino_expClick(Sender: TObject);
    procedure btn_co_origem_expClick(Sender: TObject);
    procedure btn_co_arm_expClick(Sender: TObject);
    procedure btn_co_cia_expClick(Sender: TObject);
    procedure btn_prop_expClick(Sender: TObject);
    procedure msk_cd_origem_expExit(Sender: TObject);
    procedure msk_cd_destino_expExit(Sender: TObject);
    procedure msk_cd_arm_expExit(Sender: TObject);
    procedure msk_cd_cia_expExit(Sender: TObject);
    procedure msk_prop_expExit(Sender: TObject);
    procedure msk_cd_ag_expExit(Sender: TObject);
    procedure rd_group_tp_procClick(Sender: TObject);
    procedure btn_pedidoClick(Sender: TObject);
    procedure insere_mercadoria_despesa(nr_cotacao, nr_processo: string);
    procedure rdgroup_tp_comercialClick(Sender: TObject);
    procedure btn_co_cotacaoClick(Sender: TObject);
    procedure btn_co_cot_impClick(Sender: TObject);
    procedure rdgroup_tp_comerc_impClick(Sender: TObject);
    procedure msk_cd_unid_vincExit(Sender: TObject);
    procedure msk_cd_prod_vincExit(Sender: TObject);
    procedure btn_co_unid_vinc_expClick(Sender: TObject);
    procedure btn_co_prod_vinc_expClick(Sender: TObject);
    procedure chkbx_proc_vinc_expClick(Sender: TObject);
    procedure btn_proc_vinc_expClick(Sender: TObject);
    procedure msk_proc_vinc_expExit(Sender: TObject);
    procedure chkbx_proc_vinc_impClick(Sender: TObject);
    procedure msk_cd_unid_vinc_impExit(Sender: TObject);
    procedure msk_cd_prod_vinc_impExit(Sender: TObject);
    procedure msk_proc_vinc_impExit(Sender: TObject);
    procedure btn_co_unid_vinc_impClick(Sender: TObject);
    procedure btn_co_prod_vinc_impClick(Sender: TObject);
    procedure btn_proc_vinc_impClick(Sender: TObject);
    procedure checbx_proc_vinc_agClick(Sender: TObject);
    procedure btn_co_celulaClick(Sender: TObject);
    procedure msk_cd_celulaExit(Sender: TObject);
    procedure grdRefKeyPress(Sender: TObject; var Key: Char);
    procedure grdRefExit(Sender: TObject);
    procedure grdRefSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdRefFIImpSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure grdRefFIImpExit(Sender: TObject);
    procedure grdRefFIImpKeyPress(Sender: TObject; var Key: Char);
    procedure grdRefFIImpSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure grdRefFIImpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_servicoChange(Sender: TObject);
    procedure Btn_InstrucaoDesembClick(Sender: TObject);
    procedure AtualizaInstrucaoDesembaraco(const pNrprocesso : string);
    procedure EditInstrucaoDesembExit(Sender: TObject);
    procedure msk_cd_unid_negKeyPress(Sender: TObject; var Key: Char);
    procedure eQtdProcExit(Sender: TObject);
    procedure spin_seq_processoDownClick(Sender: TObject);
    procedure spin_seq_processoUpClick(Sender: TObject);
    procedure eQtdProcKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure pgcDadosFatoresChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cxGrid1DBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1Click(Sender: TObject);
    procedure cxGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure msk_cd_representanteExit(Sender: TObject);
    procedure msk_cd_local_desembarqueExit(Sender: TObject);
    procedure btn_co_representanteClick(Sender: TObject);
    procedure btn_co_local_desembarqueClick(Sender: TObject);
  private
    nr_processo_destino       : string[18];
    cd_prefixo, in_inside_sda : string;
    FlagConsisteParcial       : Boolean;
    nr_processo_lote          : TStringList;
    { Private declarations }
    function Grava: Boolean;
    function Consiste: Boolean;
    function ConsisteFatores: Boolean;
    procedure LimpaGrids;
    procedure AbreTabelas;
    procedure FechaTabelas;
    procedure VerificaGestao(vGrdRef: TStringGrid);
    function PO2Manutencao(pPO, pCliente : String) : Boolean;
    function VerificaInstrucao(const vCdInstrucao: string): Boolean;
    procedure AtualizaGridRefCliente;
    procedure AtualizaGridDocsEmbarque;
    procedure AtualizaFatores;
    procedure GravaFatores(AProcesso: String);
  public
    nr_identificador: Integer;
    in_comercial, vColuna2: Boolean;
    function ShowModal(ASimulacao: Boolean = False): Integer;
  end;

var
  frm_abre_proc: Tfrm_abre_proc;
  st_entrada, str_Centro_custo: string;
  cotacao: Boolean;
implementation

uses PGGP001, PGSM131, PGGP017, GSMLIB, PGSM018, PGSM010, PGSM104, PGSM022,
  PGGP015, PGGP018, PGSM026, PGSM136, PGSM212, PGGA003, ConsOnLineEx,
  PGSM242, uAg, PGSM249, PGSM019, uInstrucaoEmbarque, uPedidoInstrucao,
  uPortos, PGSM044, Funcoes, uFollowUp, StrUtils, ComObj, ServicoNovo,
  DateUtils;

{$R *.DFM}

{ TPanelFator }

constructor TPanelFator.Create(AOwner: TComponent);
begin
  inherited;
  ParentColor := True;
  BevelInner  := bvNone;
  BevelOuter  := bvNone;
  BorderStyle := bsNone;
  Height      := 25 + 7;
end;

{ TLabelFator }

constructor TLabelFator.Create(AOwner: TComponent);
begin
  inherited;
  Top        := 10;
  Left       := 5;
  Font.Style := [fsBold];
end;

{ TEditFator }

procedure TEditFator.DoOnExit(Sender: TObject);
begin
  if (Sender is TEditFator) and (TEditFator(Sender).TableName <> '') and (TEditFator(Sender).KeyFieldName <> '') and
     (TEditFator(Sender).ResultFieldName <> '') and (TEditFator(Sender).Parent.ComponentCount > 2) and (TEditFator(Sender).Parent.Components[2] is TEditLookupFator) then
    if Trim(TEditFator(Sender).Text) = '' then
      TEditLookupFator(TEditFator(Sender).Parent.Components[2]).Text := ''
    else
      TEditLookupFator(TEditFator(Sender).Parent.Components[2]).Text := ConsultaLookUPSQL(' SELECT ' + TEditFator(Sender).ResultFieldName +
                                                                                          ' FROM ' + TEditFator(Sender).TableName +
                                                                                          ' WHERE ' + TEditFator(Sender).KeyFieldName + ' = ' + QuotedStr(TEditFator(Sender).Value), TEditFator(Sender).ResultFieldName);
end;

constructor TEditFator.Create(AOwner: TComponent);
begin
  inherited;
  Color           := clWindow;
  FieldName       := '';
  TableName       := '';
  KeyFieldName    := '';
  ResultFieldName := '';
  Width           := 40;
  Top             := 7;
  OnExit          := DoOnExit;
end;

function TEditFator.GetValue: String;
begin
  Result := Text;
end;

procedure TEditFator.SetValue(const Value: String);
begin
  Text := Value;
end;

{ TFloatFator }

constructor TFloatFator.Create(AOwner: TComponent);
begin
  inherited;
  Color           := clWindow;
  FieldName       := '';
  Width           := 40;
  Top             := 7;
  inherited OnKeyPress := DoOnKeyPress;
end;

procedure TFloatFator.DoOnKeyPress(Sender: TObject; var Key: Char);
begin
  if Assigned(FOnKeyPress) then
    FOnKeyPress(Sender, Key);
  if not (Key in ['0'..'9', ',', #8]) then
    Key := #0;
end;

function TFloatFator.GetValue: Double;
begin
  Result := StrToFloat(Text);
end;

procedure TFloatFator.SetValue(const Value: Double);
begin
  Text := FloatToStr(Value);
end;

{ TDateTimeFator }

constructor TDateTimeFator.Create(AOwner: TComponent);
begin
  inherited;
  //Width     := 111;
  //EditMask  := '00/00/0000 99:99:99;1;_';
  Width     := 65;
  EditMask  := '00/00/0000;1;_';
  FieldName := '';
  Top       := 7;
end;

function TDateTimeFator.GetValue: TDateTime;
begin
  Result := StrToDate(Text);
end;

procedure TDateTimeFator.SetValue(const Value: TDateTime);
begin
  Text := DateToStr(Value);
end;

{ TIntegerFator }

constructor TIntegerFator.Create(AOwner: TComponent);
begin
  inherited;
  Color           := clWindow;
  FieldName       := '';
  Width           := 40;
  Top             := 7;
  inherited OnKeyPress := DoOnKeyPress;
end;

procedure TIntegerFator.DoOnKeyPress(Sender: TObject; var Key: Char);
begin
  if Assigned(FOnKeyPress) then
    FOnKeyPress(Sender, Key);
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

function TIntegerFator.GetValue: Integer;
begin
  Result := StrToInt(Text);
end;

procedure TIntegerFator.SetValue(const Value: Integer);
begin
  Text := IntToStr(Value);
end;

{ TMemoFator }

constructor TMemoFator.Create(AOwner: TComponent);
begin
  inherited;
  FieldName := '';
  Height    := 48;
  Anchors   := [akLeft, akTop, akRight];
  Top       := 7;
end;

function TMemoFator.GetValue: String;
begin
  Result := Text;
end;

procedure TMemoFator.SetValue(const Value: String);
begin
  Text := Value;
end;

{ TCheckBoxFator }

constructor TCheckBoxFator.Create(AOwner: TComponent);
begin
  inherited;
  FieldName  := '';
  AutoSize   := False;
  Caption    := '';
  Width      := Height;
  TrueValue  := '1';
  FalseValue := '0';
  Top        := 10;
end;

function TCheckBoxFator.GetValue: Char;
begin
  if Checked then
    Result := TrueValue
  else
    Result := FalseValue;
end;

procedure TCheckBoxFator.SetValue(const Value: Char);
begin
  Checked := SameText(Value, TrueValue);
end;

{ TEditLookupFator }

constructor TEditLookupFator.Create(AOwner: TComponent);
begin
  inherited;
  ParentColor := True;
  ReadOnly    := True;
  Width       := 150;
  Top         := 7;
  TabStop     := False;
end;

{ TSpeedButtonFator }

procedure TSpeedButtonFator.DoOnClick(Sender: TObject);
var
  S: string;
begin
  if (Sender is TSpeedButtonFator) and (TSpeedButtonFator(Sender).LookupSQL <> '') then
  begin
    S := ConsultaOnLineExSQL(TSpeedButtonFator(Sender).LookupSQL, TLabelFator(TSpeedButtonFator(Sender).Parent.Components[0]).Caption,
       ['CODIGO', 'DESCRICAO'], ['Código', 'Descrição'], 'CODIGO', nil, TEditFator(TSpeedButtonFator(Sender).Parent.Components[1]).Text);
    if Trim(S) <> '' then
    begin
      TEditFator(TSpeedButtonFator(Sender).Parent.Components[1]).Text := S;
      TEditFator(TSpeedButtonFator(Sender).Parent.Components[1]).OnExit(TEditFator(TSpeedButtonFator(Sender).Parent.Components[1]));
    end;
  end;
end;

constructor TSpeedButtonFator.Create(AOwner: TComponent; AGlyph: TBitMap; ANumGlphs: Integer);
begin
  inherited Create(AOwner);
  //Caption   := '...';
  Caption   := '';
  Top       := 7;
  LookupSQL := '';
  OnClick := DoOnClick;

  if AGlyph <> nil then
    Glyph.Assign(AGlyph);
  NumGlyphs := ANumGlphs;
  Flat := True;
end;


{ Tfrm_abre_proc }

procedure Tfrm_abre_proc.btn_salvarClick(Sender: TObject);
var
  flt_nr_processo             : Double;
  bAchouProcesso              : Boolean;
  nQtdProc                    : Integer;
  I: Integer;
  TemRef: Boolean;
  gCD_RESTRICAO, gIN_LIBERADO, gIN_ROUTING : String;
begin
{  if (pnlBid.visible = true) and ((dbCdDestNest.text = '') or (dbCdPort.text = '') or (dbCdCity.text= '') or (dbCdAgente.Text='') ) and (msk_cd_produto.Text = '02')  then
  begin
    showmessage('Existe dados Bid em branco!');
    Exit;
  end;   }

  if strToInt(eQtdProc.Text) > 1 then
    if (MessageDlg('Serão Abertos '+eQtdProc.Text+' processos com as mesmas informações abaixo '+#13+
                   'DESEJA PROSSEGUIR  ? ' , mtConfirmation, [mbYes,mbNo], 0)=mrNo) then
      Exit;


  //verifica se existe algumas informações não compartilhaveis para abrir em lote - by carlos
  if (Trim(msk_cd_servico.Text) <> '19') and (EditInstrucaoDesemb.Text<>'') or (GrdRef.Cells[1,0]<>'') or (GrdLI.Cells[1,0]<>'') or ( datm_abre_proc.qry_doc_inst_temp_.RecordCount>0 )then
    if strToInt(eQtdProc.Text) > 1 then
      if (MessageDlg('Não será possivel criar os processos em lote devido ao preenchimento de informações não comuns entre eles, tais como: '+#13+
                     'ID, LI, PEDIDO ou DOCUMENTO EMBARQUE'+#13+
                     'DESEJA PROSSEGUIR E CRIAR SOMENTE UM UNICO PROCESSO ? ' , mtError, [mbYes,mbNo], 0)=mrYes) then
        eQtdProc.Text:='1'
      else
        Abort;

  // Não abrir para produto 01 e 02 se não houver pelo menos uma referência - Michel - 16/10/2013
  {if (msk_cd_produto.Text = '01') or (msk_cd_produto.Text = '02') then
  begin
    TemRef := False;
    I := 0;
    while (I < grdRef.RowCount) and not TemRef do
    begin
      TemRef := Trim(grdRef.Cells[1, I]) <> '';
      Inc(I);
    end;

    if not TemRef then
    begin
      MessageDlg('É necessário informar algum Pedido.', mtError, [mbOk], 0);
      grdRef.SetFocus;
      Exit;
    end;
  end;}

  pnlCliServ.Enabled := False;
  with datm_abre_proc do
  begin
    nr_processo_destino := '';
    if (chkbox_dup.Checked) then
    begin
      qry_proc_aux_.Close;
      qry_proc_aux_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo_fonte.Text;
      qry_proc_aux_.Prepare;
      qry_proc_aux_.Open;

      bAchouProcesso := not qry_proc_aux_.EOF;

      if (Trim(msk_nr_processo_fonte.Text) <> '') and bAchouProcesso then
      begin
        Screen.Cursor := crHourGlass;

        qry_ult_processo_.Close;
        qry_ult_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + Copy(msk_nr_processo_fonte.Text, 1, 2);
        qry_ult_processo_.ParamByName('INICIO').AsDate := StrToDate('01/01/' + FormatDateTime('YYYY', Date));
        qry_ult_processo_.ParamByName('FIM').AsDate := StrToDate('31/12/' + FormatDateTime('YYYY', Date));
        qry_ult_processo_.Open;

        // Até 2013 o processo é constituído de 4 dígitos, a partir de 2014 é constituído de 6 dígitos
        if YearOf(Date) < 2014 then
        begin
          if (qry_ult_processo_ULTIMO.IsNull) or (Copy(qry_ult_processo_ULTIMO.AsString, 8, 4) = '') then
            flt_nr_processo := StrToFloat('0001')
          else
            flt_nr_processo := StrToFloat(Copy(qry_ult_processo_ULTIMO.AsString, 8, 4)) + 1;

          nr_processo_destino := msk_cd_unid_neg.Text + msk_cd_produto.Text + Copy(qry_ult_processo_ULTIMO.AsString, 5, 3) +
             FormatFloat('0000', flt_nr_processo) + '-' + FormatDateTime('YY', dt_server);
        end
        else
        begin
          if (qry_ult_processo_ULTIMO.IsNull) or (Copy(qry_ult_processo_ULTIMO.AsString, 8, 6) = '') then
            flt_nr_processo := 1
          else
            flt_nr_processo := StrToFloat(Copy(qry_ult_processo_ULTIMO.AsString, 8, 6)) + 1;

          nr_processo_destino := msk_cd_unid_neg.Text + msk_cd_produto.Text + Copy(qry_ult_processo_ULTIMO.AsString, 5, 3) +
             FormatFloat('000000', flt_nr_processo) + '-' + FormatDateTime('YY', dt_server);
        end;

        if not Consiste then Exit;

        try
          if not datm_abre_proc.Simulacao then
            datm_main.db_broker.StartTransaction;
          CloseStoredProc(sp_duplica_processo);
          sp_duplica_processo.ParamByName('@NR_PROCESSO_FONTE').AsString :=
            msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo_fonte.Text;
          sp_duplica_processo.ParamByName('@NR_PROCESSO_DESTINO').AsString :=
            nr_processo_destino;
          ExecStoredProc(sp_duplica_processo);
          if not datm_abre_proc.Simulacao then
            datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            qry_processo_.Cancel;
            qry_processo_.Append;
            CloseStoredProc(sp_duplica_processo);
            TrataErro(E);
            Exit;
          end;
        end;

        if sp_duplica_processo.ParamByName('Result').AsString = '0' then
        begin
          msk_nr_processo.Text := Copy(nr_processo_destino, 5, 14);
          mi_incluir.Enabled := false;
          mi_salvar.Enabled := False;
          mi_cancelar.Enabled := False;
          btn_incluir.Enabled := false;
          btn_salvar.Enabled := False;
          btn_cancelar.Enabled := False;

          msk_cd_unid_neg.Enabled    := False;
          msk_cd_produto.Enabled     := False;
          msk_cd_cliente.Enabled     := False;
          msk_cd_servico.Enabled     := False;
          msk_cd_area.Enabled        := False;
          msk_cd_agente.Enabled      := False;
          msk_cd_destino.Enabled     := False;
          msk_cd_origem.Enabled      := False;
          msk_cd_armador.Enabled     := False;
          msk_cd_cia.Enabled         := False;
          msk_cd_ag_exp.Enabled      := False;
          msk_cd_destino_exp.Enabled := False;
          msk_cd_origem_exp.Enabled  := False;
          msk_cd_arm_exp.Enabled     := False;
          msk_cd_cia_exp.Enabled     := False;

          btn_co_unid_neg.Enabled    := False;
          btn_co_produto.Enabled     := False;
          btn_co_cliente.Enabled     := False;
          btn_co_servico.Enabled     := False;
          btn_co_area.Enabled        := False;
          btn_co_agente.enabled      := False;
          btn_co_origem.Enabled      := False;
          btn_co_destino.Enabled     := False;
          btn_co_armador.Enabled     := False;
          btn_co_cia.Enabled         := False;
          btn_co_origem_exp.Enabled  := False;
          btn_co_destino_exp.Enabled := False;
          btn_co_cia_exp.Enabled     := False;
          btn_co_arm_exp.Enabled     := False;
          btn_co_ag_exp.Enabled      := False;

          CloseStoredProc(sp_duplica_processo);
          Screen.Cursor := crDefault;
        end
        else
        begin
          qry_processo_.Cancel;
          qry_processo_.Insert;
          CloseStoredProc(sp_duplica_processo);
          Exit;
        end;
      end
      else
      begin
        BoxMensagem('É necessário escolher um Processo existente para poder duplicar!', 2);
        Exit;
      end
    end
    else
    begin
      if not Consiste then
        Exit;

//      if not Grava then
//        Exit;

      // abertura em lote de processos - by carlos - 29/08/2011
      gCD_RESTRICAO := datm_abre_proc.qry_processo_CD_RESTRICAO.AsString;
      gIN_LIBERADO  := datm_abre_proc.qry_processo_IN_LIBERADO.AsString;
      gIN_ROUTING   := datm_abre_proc.qry_processo_IN_ROUTING.AsString;
      nQtdProc      := strToInt(eQtdProc.Text);

      while ( nQtdProc > 0 ) and Grava do begin
        if ( nQtdProc > 1)  then begin
           datm_abre_proc.qry_processo_.Cancel;
           datm_abre_proc.qry_processo_.Insert;
           datm_abre_proc.qry_processo_IN_ROUTING.AsString   := gIN_ROUTING;
           datm_abre_proc.qry_processo_IN_LIBERADO.AsString  := gIN_LIBERADO;
           datm_abre_proc.qry_processo_CD_RESTRICAO.AsString := gCD_RESTRICAO;
        end;
        dec(nQtdProc);
      end;
      msk_nr_processo.Text:=nr_processo_lote[0];

      //Possibilita a inclusão de outros processos sem sair da tela - Rodrigo Capra - 04/01/2007
      msk_cd_unid_neg.Enabled := True;
      msk_cd_produto.Enabled := True;
      btn_incluir.Enabled := True;
      mi_incluir.Enabled := True;

      // by Carlos 11/06/2010
      pnl_desembaraco.Visible := False;
      pnl_imp.Visible := False;
      pnl_exp.Visible := False;

    end
  end;
  if datm_abre_proc.Simulacao then
  begin
     frm_followup.medt_cd_unid_neg.Text := msk_cd_unid_neg.Text;
     frm_followup.medt_cd_produto.Text  := msk_cd_produto.Text;
     frm_followup.medt_nr_processo.Text := msk_nr_processo.Text;
     frm_followup.medt_nr_processoExit(nil);

    if datm_main.db_broker.InTransaction then
      datm_main.db_broker.Rollback;
    pgcDadosFatores.ActivePage := tsFollowup;
  end;
end;

function Tfrm_abre_proc.Grava: Boolean;
var
  flt_nr_processo : Double;
  I: Byte;
  nr_proc, str_processo_vinculado: string[18];
  vInFlagLI : string[1];
  PathOrig, PathDest,LocalEntregaCntr: String;
  SR: TSearchRec;
  S: String;
  NrHouse, NrMaster: String;
begin
  Screen.Cursor := crHourGlass;
  try
    {// Atualizar a data do Servidor - Michel - 13/01/2010
    CloseStoredProc(datm_main.sp_data_hora_server);
    ExecStoredProc(datm_main.sp_data_hora_server);
    dt_server := datm_main.sp_data_hora_server.ParamByName('@dt_nt_server').AsDateTime;
    hr_server := dt_server;
    dt_server := StrToDate(DateToStr(dt_server));
    CloseStoredProc(datm_main.sp_data_hora_server);}
    with datm_main do
    begin
      try
        CloseStoredProc(sp_data_hora_server);
        ExecStoredProc(sp_data_hora_server);
        dt_server := sp_data_hora_server.ParamByName('@dt_nt_server').AsDateTime;
        hr_server := dt_server;
        dt_server := StrToDate(DateToStr(dt_server));
        CloseStoredProc(sp_data_hora_server);
      except
        on E: Exception do
        begin
          TrataErro(E);
          dt_server := Date;
          hr_server := Time;
        end;
      end;
    end;
    // Atualiza a data no form principal se for diferente da data atual - Michel - 13/01/2010
    if frm_main.lbl_data_atual.Caption <> DateToStr(dt_server) then
      frm_main.lbl_data_atual.Caption := DateToStr(dt_server);

    str_processo_vinculado := '';
    // Pega o número do proximo processo desta unid.neg x produto
    with datm_abre_proc do
    begin
      qry_ult_processo_.Close;
      qry_ult_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + cd_prefixo;
      qry_ult_processo_.ParamByName('INICIO').AsDate := StrToDate('01/01/' + FormatDateTime('YYYY', Date));
      qry_ult_processo_.ParamByName('FIM').AsDate := StrToDate('31/12/' + FormatDateTime('YYYY', Date));
      qry_ult_processo_.Prepare;
      qry_ult_processo_.Open;

      // Até 2013 o processo é constituído de 4 dígitos, a partir de 2014 é constituído de 6 dígitos
      if YearOf(Date) < 2014 then
      begin
        if (qry_ult_processo_ULTIMO.IsNull) or (Copy(qry_ult_processo_ULTIMO.AsString, 8, 4) = '') then
          flt_nr_processo := StrToFloat('0001')
        else
          flt_nr_processo := StrToFloat(Copy(qry_ult_processo_ULTIMO.AsString, 8, 4)) + 1;

        nr_proc := msk_cd_unid_neg.Text + msk_cd_produto.Text + cd_prefixo + '-' +
           FormatFloat('0000', flt_nr_processo) + '-' + FormatDateTime('YY', dt_server);
      end
      else
      begin
        if (qry_ult_processo_ULTIMO.IsNull) or (Copy(qry_ult_processo_ULTIMO.AsString, 8, 6) = '') then
          flt_nr_processo := 1
        else
          flt_nr_processo := StrToFloat(Copy(qry_ult_processo_ULTIMO.AsString, 8, 6)) + 1;

        nr_proc := msk_cd_unid_neg.Text + msk_cd_produto.Text + cd_prefixo + '-' +
           FormatFloat('000000', flt_nr_processo) + '-' + FormatDateTime('YY', dt_server);
      end;

      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := Trim(msk_cd_unid_neg.Text);
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;

      qry_processo_NR_PROCESSO.AsString            := nr_proc;
      qry_processo_CD_UNID_NEG.AsString            := msk_cd_unid_neg.Text;
      qry_processo_CD_PRODUTO.AsString             := msk_cd_produto.Text;
      qry_processo_CD_CLIENTE.AsString             := msk_cd_cliente.Text;
      qry_processo_DT_ABERTURA.AsDateTime          := dt_server;
      qry_processo_CD_USUARIO.AsString             := str_cd_usuario;
      if GetServicoNovo then
        qry_processo_CD_SERVICO.AsInteger          := StrToInt(Trim(msk_cd_servico.Text))
      else
        qry_processo_CD_SERVICO.AsString           := msk_cd_servico.Text;
      qry_processo_CD_CT_LUCRO.AsString            := str_centro_custo;
      qry_processo_CD_CELULA.AsString              := msk_cd_celula.Text;
      qry_processo_CD_ANALISTA_COMISSARIA.AsString := msk_cd_analrc.Text;
      qry_processo_IN_ENTREPOSTO.AsString          := IIF(cbbox_entreposto.Text = 'SIM','1','0');

      
      //Ocorrencia Carolina Nascimento - BID NESTLÉ
 {     if (ConsultaLookUPSQL('SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = ''' + msk_cd_cliente.Text + ''' ', 'CD_GRUPO')='155')
      AND ((msk_cd_servico.TEXT='710') or (Trim(msk_cd_servico.TEXT) = '2'))
      AND (msk_cd_produto.TEXT='02')  then
      begin
        qry_processo_CD_PAIS_DESTINO.asstring:= dbCdDestNest.text;
        qry_processo_CD_LOCAL_DESEMBARQUE.asstring:= dbCdPort.text;
        qry_processo_CD_LOCAL_EMBARQUE.asstring:= dbCdCity.text;
        qry_processo_CD_AGENTE.asstring:= dbCdAgente.text;
      end;        }


      qry_processo_NR_CONHECIMENTO.AsString        := msk_nr_conhecimento.Text;
      qry_processo_NR_CONHECIMENTO_MASTER.AsString := msk_nr_conhecimento_master.Text;
      qry_processo_CD_AREA.AsString                := msk_cd_area.Text;
      qry_processo_ID_CODIGO_INSTR_DESEMB.AsString := EditInstrucaoDesemb.Text;

      //se o comercial estiver abrindo o processo ainda não será enviado para o operacional
      qry_processo_IN_PEDIDO.AsString := IIF(in_comercial,'2','0');

      if rd_group_tp_proc.ItemIndex = 0 then
        qry_processo_TP_PROCESSO.AsString := '0';
      if rd_group_tp_proc.ItemIndex = 1 then
        qry_processo_TP_PROCESSO.AsString := '1';



      if (qry_produto_TP_PRODUTO.AsString = '02') and (qry_servico_TP_SERVICO.AsString = '1') then
      begin
        if dgrp_tp_processo.ItemIndex = 0 then
          qry_processo_TP_PROCESSO.AsString := '0';
        if dgrp_tp_processo.ItemIndex = 1 then
          qry_processo_TP_PROCESSO.AsString := '1';

        qry_processo_NR_PROPOSTA.AsString := msk_prop_exp.text;
        qry_processo_CD_AGENTE.AsString := msk_cd_ag_exp.Text;
        qry_processo_CD_ORIGEM.AsString := msk_cd_origem_exp.Text;
        qry_processo_CD_DESTINO.AsString := msk_cd_destino_exp.Text;
        qry_processo_CD_ARMADOR.AsString := msk_cd_arm_exp.Text;
        qry_processo_CD_CIA_TRANSP.AsString := msk_cd_cia_exp.Text;
        qry_processo_REF_CLIENTE.AsString := msk_ref_exp.Text;
        if cbbEstufagem3.Text = 'FCL' then
          qry_processo_TP_ESTUFAGEM.AsString := '1'
        else if cbbEstufagem3.Text = 'LCL' then
          qry_processo_TP_ESTUFAGEM.AsString := '0'
        else  if cbbEstufagem3.Text = 'Carga Solta' then
          qry_processo_TP_ESTUFAGEM.AsString := '2';

        if (chkbx_proc_vinc_exp.Checked = true) then
          str_processo_vinculado := msk_cd_unid_vinc.text + msk_cd_prod_vinc.text + msk_proc_vinc_exp.text;
      end;

      if (qry_produto_TP_PRODUTO.AsString = '01') and (qry_servico_TP_SERVICO.AsString = '1') then
      begin
        qry_processo_NR_PROPOSTA.AsString   := msk_proposta.text;
        qry_processo_CD_AGENTE.AsString     := msk_cd_agente.Text;
        qry_processo_CD_ORIGEM.AsString     := msk_cd_origem.Text;
        qry_processo_CD_DESTINO.AsString    := msk_cd_destino.Text;
        qry_processo_CD_ARMADOR.AsString    := msk_cd_armador.Text;
        qry_processo_CD_CIA_TRANSP.AsString := msk_cd_cia.Text;
        if cbbEstufagem2.Text = 'FCL' then
          qry_processo_TP_ESTUFAGEM.AsString := '1'
        else if cbbEstufagem2.Text = 'LCL' then
          qry_processo_TP_ESTUFAGEM.AsString := '0'
        else  if cbbEstufagem2.Text = 'Carga Solta' then
          qry_processo_TP_ESTUFAGEM.AsString := '2';

        if (chkbx_proc_vinc_imp.Checked = true) then
          str_processo_vinculado := msk_cd_unid_vinc_imp.text + msk_cd_prod_vinc_imp.text + msk_proc_vinc_imp.text;
      end;

      //comentado por agatha nigro 13/03/2018
     // if (qry_produto_TP_PRODUTO.AsString = '01') then
    //  begin
        qry_processo_CD_REPRESENTANTE.AsString     := msk_cd_representante.Text;
        qry_processo_CD_LOCAL_DESEMBARQUE.AsString := msk_cd_local_desembarque.Text;
    //  end;

      if (qry_servico_TP_SERVICO.AsString = '0') then
      begin
        if cbbEstufagem1.Text = 'FCL' then
          qry_processo_TP_ESTUFAGEM.AsString := '1'
        else if cbbEstufagem1.Text = 'LCL' then
          qry_processo_TP_ESTUFAGEM.AsString := '0'
        else if cbbEstufagem1.Text = 'Carga Solta' then
          qry_processo_TP_ESTUFAGEM.AsString := '2';
      end;


      if qry_processo_NR_PROPOSTA.AsString = '' then
        qry_processo_IN_ROUTING.AsString := '0'
      else
        qry_processo_IN_ROUTING.AsString := '1';

      if Trim(msk_cd_produto.Text) = '01' then
        qry_processo_CD_PAIS_DESTINO.AsString := qry_unid_neg_CD_PAIS.AsString
      else if Trim(msk_cd_produto.Text) = '02' then
        qry_processo_CD_PAIS_ORIGEM.AsString  := qry_unid_neg_CD_PAIS.AsString;

      qry_unid_neg_.Close;
      qry_unid_neg_.UnPrepare;


      if not datm_abre_proc.Simulacao then
        datm_main.db_broker.StartTransaction;
      vInFlagLI := ConsultaLookUP('TSERVICO', 'CD_SERVICO', msk_cd_servico.text, 'IN_LI');
      qry_processo_CD_STATUS_SDA.AsString := '0';
      if qry_servico_TP_SERVICO.AsString = '0' then
      begin
        if checbx_proc_vinc_ag.Checked = true then
          str_processo_vinculado := qry_conhec_vincNR_PROCESSO.AsString;

        // Referências
        qry_ref_cli_.Close;
        qry_ref_cli_.SQL[2] := 'NR_PROCESSO=:NR_PROCESSO';
        qry_ref_cli_.parambyname('NR_PROCESSO').AsString := nr_proc;
        qry_ref_cli_.Open;
        if EditInstrucaoDesemb.Text = '' then  //Usuário digitou as Referências no Grid
        begin
          for i := 0 to (grdRef.RowCount - 1) do
          begin
            grdRef.Row := i;
            if Trim(grdRef.Cells[1, grdRef.Row]) <> '' then
            begin
              qry_ref_cli_.Insert;
              qry_ref_cli_IN_FLAG_LI.AsString    := vInFlagLI;
              qry_ref_cli_NR_PROCESSO.AsString   := nr_proc;
              qry_ref_cli_NR_SEQUENCIA.AsString  := UltCod(qry_ult_ref_cli_, qry_ult_ref_cli_ULTIMO);
              qry_ref_cli_CD_REFERENCIA.AsString := Trim(grdRef.Cells[1, grdRef.Row]);
              qry_ref_cli_CD_EMPRESA.AsString    := msk_cd_cliente.Text; // Michel - 14/01/2010
              qry_ref_cli_NR_ITEM_PO.AsString    := Copy('0000',1,4-Length(Trim(grdRef.Cells[2, grdRef.Row])))+ Trim(grdRef.Cells[2, grdRef.Row]);
              qry_ref_cli_CD_AREA.AsString       := msk_cd_area.Text;
              qry_ref_cli_TP_REFERENCIA.AsString := '01';
              qry_ref_cli_NR_PARCIAL.AsInteger   := IIF(vInFlagLI = '0',1,0);
              if FlagConsisteParcial then  //Se o Pedido/Item já existir então incluir com a parcial + 1 !!!
                qry_ref_cli_NR_PARCIAL.AsString  := ConsultaLookUPSQL('SELECT ISNULL(MAX(NR_PARCIAL)+1, 1) NR_PARCIAL ' +
                                                                      'FROM TREF_CLIENTE ' +
                                                                      'WHERE CD_REFERENCIA = ''' + qry_ref_cli_CD_REFERENCIA.AsString + ''' ' +
                                                                      '  AND CD_EMPRESA = ''' + msk_cd_cliente.Text + ''' ' +
                                                                      '  AND NR_ITEM_PO      = ''' + qry_ref_cli_NR_ITEM_PO.AsString    + '''', 'NR_PARCIAL');

              // repassa os dados do Pedido para a Manutenção, caso exista pedido para essa referencia.
              if grdRef.Row = 0 then
                if not PO2Manutencao(qry_ref_cli_CD_REFERENCIA.AsString, qry_ref_cli_CD_EMPRESA.AsString) then
                  ShowMessage('Ocorreu um erro ao repassar os dados do Pedido para a Manutenção' + #10#13 + 'Informe o suporte tecnico do MyIndaiá');
              qry_ref_cli_.Post;
            end;
          end;
        end
        else
        begin
          with TQuery.Create(Application)do
          begin
            DatabaseName  := 'DBBROKER';

            //Alterada a query abaixo, pois nem sempre retornava algum valor, e acabava por deixar o número do B/L em branco, mesmo
            // que o B/L tivesse sido recuperado da ID na tela de abertura.               Eric     05/09/2012;

            {SQL.Add('SELECT P.NR_HOUSE, P.NR_MASTER, P.NR_MANIFESTO');
            SQL.Add('FROM TINSTRUCAO_DESEMBARACO_PEDIDO IDP');
            SQL.Add('   INNER JOIN TPO P ON P.NR_PROCESSO = IDP.NR_REFERENCIA');}

            SQL.Add('SELECT ISNULL(ID.NR_CONHECIMENTO, P.NR_CONHECIMENTO) AS NR_CONHECIMENTO ,P.NR_CONHECIMENTO_MASTER, P.NR_MANIFESTO');
            SQL.Add('FROM TINSTRUCAO_DESEMBARACO_PEDIDO IDP');
            SQL.Add('INNER JOIN TINSTRUCAO_DESEMBARACO ID ON ID.ID_CODIGO = IDP.ID_CODIGO');
            SQL.Add('INNER JOIN TPROCESSO P ON P.NR_REFERENCIA = IDP.NR_REFERENCIA');
            SQL.Add('WHERE IDP.ID_CODIGO = :ID_CODIGO');
            SQL.Add('  AND P.CD_CLIENTE = :CD_CLIENTE');
            ParamByName('ID_CODIGO').AsString := datm_abre_proc.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString;
            ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
            Open;
            datm_abre_proc.qry_processo_NR_CONHECIMENTO.AsString        := FieldByName('NR_CONHECIMENTO').AsString;
            datm_abre_proc.qry_processo_NR_CONHECIMENTO_MASTER.AsString := FieldByName('NR_CONHECIMENTO_MASTER').AsString;
            datm_abre_proc.qry_processo_NR_MANIFESTO.AsString           := FieldByName('NR_MANIFESTO').AsString;
            Close;

            SQL.Clear;
            Sql.Add('SELECT IDP.NR_REFERENCIA, ID.CD_CLIENTE, IDP.NR_ITEM_PO, IDP.NR_PARCIAL');
            Sql.Add('FROM TINSTRUCAO_DESEMBARACO_PEDIDO IDP');
            Sql.Add('   INNER JOIN TINSTRUCAO_DESEMBARACO ID ON ID.ID_CODIGO = IDP.ID_CODIGO');
            Sql.Add('WHERE IDP.ID_CODIGO = :ID_CODIGO'); // Michel - 14/01/2010
            ParamByName('ID_CODIGO').AsString := datm_abre_proc.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString;
            Open;

            S := Trim(ConsultaLookUP('TINSTRUCAO_DESEMBARACO', 'ID_CODIGO', EditInstrucaoDesemb.Text, 'ID_CLIENTE'));
            if S <> '' then
            begin
              qry_ref_cli_.Insert;
              qry_ref_cli_IN_FLAG_LI.AsString  := ConsultaLookUP('TSERVICO', 'CD_SERVICO', msk_cd_servico.text, 'IN_LI');
              qry_ref_cli_NR_PROCESSO.AsString   := nr_proc;
              qry_ref_cli_NR_SEQUENCIA.AsString  := UltCod(qry_ult_ref_cli_, qry_ult_ref_cli_ULTIMO);
              qry_ref_cli_CD_REFERENCIA.AsString := S;
              qry_ref_cli_CD_EMPRESA.AsString    := msk_cd_cliente.Text; // Michel - 14/01/2010
              qry_ref_cli_CD_AREA.AsString       := msk_cd_area.Text;
              qry_ref_cli_TP_REFERENCIA.AsString := '04';
              qry_ref_cli_.Post;
            end;

            while not Eof do
            begin
              qry_ref_cli_.Insert;

              qry_ref_cli_IN_FLAG_LI.AsString    := ConsultaLookUP('TSERVICO', 'CD_SERVICO', msk_cd_servico.text, 'IN_LI');
              qry_ref_cli_NR_PROCESSO.AsString   := nr_proc;
              qry_ref_cli_NR_SEQUENCIA.AsString  := UltCod(qry_ult_ref_cli_, qry_ult_ref_cli_ULTIMO);
              qry_ref_cli_CD_REFERENCIA.AsString := FieldByName('NR_REFERENCIA').AsString;
              qry_ref_cli_CD_EMPRESA.AsString    := FieldByName('CD_CLIENTE').AsString; // Michel - 14/01/2010
              qry_ref_cli_NR_ITEM_PO.AsString    := FieldByName('NR_ITEM_PO').AsString;
              qry_ref_cli_NR_PARCIAL.AsInteger   := FieldByName('NR_PARCIAL').AsInteger;
              qry_ref_cli_CD_AREA.AsString       := msk_cd_area.Text;
              qry_ref_cli_TP_REFERENCIA.AsString := '01';

              qry_ref_cli_.Post;

              Next;
            end;

            Close;
            SQL.Clear;
            SQL.Add('SELECT TOP 1 POI.NR_PLANTA');
            SQL.Add('FROM TINSTRUCAO_DESEMBARACO_PEDIDO IDP');
            SQL.Add('   INNER JOIN TPO_ITEM POI ON POI.NR_PROCESSO = IDP.NR_REFERENCIA AND POI.NR_ITEM_CLIENTE = IDP.NR_ITEM_PO AND POI.NR_PARCIAL = IDP.NR_PARCIAL');
            SQL.Add('WHERE IDP.ID_CODIGO = :ID_CODIGO');
            ParamByName('ID_CODIGO').AsString := EditInstrucaoDesemb.Text;
            Open;
            if SameText(Trim(Fields[0].AsString), 'S821') then
              LocalEntregaCntr := '3290640'
            else
              LocalEntregaCntr := '';

            Close;

            SQL.Clear;
            SQL.Add('SELECT DISTINCT ISNULL(PC.NR_CNTR, POI.NR_CNTR) AS NR_CNTR, POI.TP_CNTR');
            SQL.Add('FROM TPO_ITEM POI');
            SQL.Add('   INNER JOIN TINSTRUCAO_DESEMBARACO_PEDIDO IDP ON IDP.NR_REFERENCIA = POI.NR_PROCESSO');
            SQL.Add('                                               AND IDP.NR_ITEM_PO = POI.NR_ITEM_CLIENTE');
            SQL.Add('                                               AND IDP.NR_PARCIAL = POI.NR_PARCIAL');
            SQL.Add('   LEFT  JOIN TPO_ITEM_CONTAINER PC ON PC.NR_PROCESSO = POI.NR_PROCESSO');
            SQL.Add('                                   AND PC.NR_ITEM_CLIENTE = POI.NR_ITEM_CLIENTE');
            SQL.Add('                                   AND PC.NR_PARCIAL = POI.NR_PARCIAL');
            SQL.Add('                                   AND PC.CD_EMPRESA = POI.CD_EMPRESA');
            SQL.Add('WHERE IDP.ID_CODIGO = :ID_CODIGO');
            SQL.Add('  AND ISNULL(POI.NR_CNTR, "") <> ""');
            ParamByName('ID_CODIGO').AsString := datm_abre_proc.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString;
            Open;
            First;
            while not Eof do
            begin
              FastExecSQL('INSERT INTO TPROCESSO_CNTR(NR_PROCESSO, NR_CNTR, IN_DESOVA, IN_DEMURRAGE, TP_CNTR, CD_LOCAL_ENTREGA) ' +
                          'VALUES(:NR_PROCESSO, :NR_CNTR, 0, 0, :TP_CNTR, :CD_LOCAL_ENTREGA)',
                          [nr_proc, FieldByName('NR_CNTR').AsString, FieldByName('TP_CNTR').AsString, LocalEntregaCntr]);
              Next;
            end;

            Free;
          end;
        end;
        qry_ref_cli_.Close;

        // LI
        qry_li_.Close;
        qry_li_.SQL[2] := 'NR_PROCESSO <> ""';
        qry_li_.Prepare;
        qry_li_.Open;
        for i := 0 to (grdLI.RowCount - 1) do
        begin
          grdLI.Row := i;
          if Trim(grdli.Cells[grdli.Col, grdli.Row]) <> '' then
          begin
            qry_li_.Append;
            qry_li_NR_PROCESSO.AsString := nr_proc;
            qry_li_NR_LI.AsString := Trim(grdLI.Cells[grdLI.Col, grdLI.Row]);
            qry_li_.Post;
          end;
        end;
        qry_li_.Close;
        // Nº Fatura Comercial
        qry_doc_instrucao_.Close;
        qry_doc_instrucao_.Open;
        qry_doc_inst_temp_.first;
        while not qry_doc_inst_temp_.Eof do
        begin
          qry_doc_instrucao_.Append;
          qry_doc_instrucao_NR_PROCESSO.AsString := nr_proc;

          CloseStoredProc(sp_ult_sequencia);
          sp_ult_sequencia.ParamByName('@IDENTIFICADOR').AsString := '2';
          sp_ult_sequencia.ParamByName('@CHAVE').AsString := nr_proc;
          ExecStoredProc(sp_ult_sequencia);
          qry_doc_instrucao_NR_SEQUENCIA.AsInteger := sp_ult_sequencia.ParamByName('@NR_SEQUENCIA').AsInteger;
          CloseStoredProc(sp_ult_sequencia);

          qry_doc_instrucao_CD_TIPO_DCTO_INSTR.AsString := qry_doc_inst_temp_CD_TIPO_DCTO_INSTR.AsString;
          qry_doc_instrucao_NR_DCTO_INSTRUCAO.AsString  := qry_doc_inst_temp_NR_DCTO_INSTRUCAO.AsString;
          if qry_doc_inst_temp_DT_DOCUMENTO.value<>0 then
             qry_doc_instrucao_DT_FATURA.AsDateTime := qry_doc_inst_temp_DT_DOCUMENTO.AsDateTime;
          qry_doc_instrucao_.Post;
          qry_doc_inst_temp_.next;
        end;
        qry_apaga_temp_.parambyname('NR_IDENTIFICADOR').AsInteger := nr_identificador;
        qry_apaga_temp_.execsql;
        qry_doc_instrucao_.Close;
      end
      else if qry_servico_TP_SERVICO.AsString = '1' then
      begin
        // Referências
        qry_ref_cli_.Close;
        qry_ref_cli_.SQL[2] := 'NR_PROCESSO=:NR_PROCESSO';
        qry_ref_cli_.parambyname('NR_PROCESSO').AsString := nr_proc;
        qry_ref_cli_.Open;
        for i := 0 to (grdRefFIImp.RowCount - 1) do
        begin
          grdRefFIImp.Row := i;
          if Trim(grdRefFIImp.Cells[1, grdRefFIImp.Row]) <> '' then
          begin
            qry_ref_cli_.Insert;
            qry_ref_cli_IN_FLAG_LI.AsString    := vInFlagLI;
            qry_ref_cli_NR_PROCESSO.AsString   := nr_proc;
            qry_ref_cli_NR_SEQUENCIA.AsString  := UltCod(qry_ult_ref_cli_, qry_ult_ref_cli_ULTIMO);
            qry_ref_cli_CD_REFERENCIA.AsString := Trim(grdRefFIImp.Cells[1, grdRefFIImp.Row]);
            qry_ref_cli_CD_EMPRESA.AsString    := msk_cd_cliente.Text; // Michel - 15/01/2010
            qry_ref_cli_NR_ITEM_PO.AsString    := Copy('0000',1,4-Length(Trim(grdRefFIImp.Cells[2, grdRefFIImp.Row])))+ Trim(grdRefFIImp.Cells[2, grdRefFIImp.Row]);
            qry_ref_cli_CD_AREA.AsString       := msk_cd_area.Text;
            qry_ref_cli_TP_REFERENCIA.AsString := '01';
            qry_ref_cli_NR_PARCIAL.AsInteger   := IIF(vInFlagLI = '0',1,0);
            if FlagConsisteParcial then //Se o Pedido/Item já existir então incluir com a parcial + 1 !!!
              qry_ref_cli_NR_PARCIAL.AsString  := ConsultaLookUPSQL('SELECT MAX(NR_PARCIAL)+1 NR_PARCIAL FROM TREF_CLIENTE '        +
                                                                    'WHERE CD_REFERENCIA   = ''' + qry_ref_cli_CD_REFERENCIA.AsString + '''' +
                                                                    '  AND CD_EMPRESA      = ''' + qry_ref_cli_CD_EMPRESA.AsString + '''' +
                                                                    '  AND NR_ITEM_PO      = ''' + qry_ref_cli_NR_ITEM_PO.AsString    + '''', 'NR_PARCIAL');
            qry_ref_cli_.Post;
          end;
        end;
        qry_ref_cli_.Close;
      end;
      // integracao contabil
      if in_integracao_contabil = '1' then
      begin
        with Datm_main do
        begin
          // BUSCA CONTA CONTABIL PARA CLIENTE
        end;
      end;
      qry_processo_CD_LOCAL_CONSOLIDACAO.AsString := qry_processo_CD_ORIGEM.Asstring;
      // Grava processo
      qry_processo_.Post;

      // Copiar os Arquivos da Instrução para o Processo - Michel - 02/03/2010
      if Trim(EditInstrucaoDesemb.Text) <> '' then
      begin
        with TQuery.Create(Self) do
        begin
          DatabaseName  := 'DBBROKER';
          SQL.Add('INSERT INTO TPROCESSO_DOCTOS(NR_PROCESSO, CD_TIPO_DOCTO, NM_DESCRICAO, NM_ARQUIVO, CD_USUARIO_CRIACAO,');
          SQL.Add('   DT_CRIACAO, CD_USUARIO_ALT, DT_ALT, IN_ATIVO, NM_ARQUIVO_PAI, NM_MOTIVO_ALTERACAO, ID_TABELA)');
          SQL.Add('SELECT :NR_PROCESSO, CD_TIPO_DOCTO, NM_DESCRICAO, NM_ARQUIVO,  CD_USUARIO_CRIACAO,');
          SQL.Add('   DT_CRIACAO, CD_USUARIO_ALT, DT_ALT, IN_ATIVO, NM_ARQUIVO_PAI, NM_MOTIVO_ALTERACAO, (SELECT OBJECT_ID FROM SYS.TABLES WHERE NAME = ''TPROCESSO'')');
          SQL.Add('FROM TPROCESSO_DOCTOS');
          SQL.Add('WHERE NR_PROCESSO = :ID_CODIGO');
          SQL.Add('  AND ID_TABELA   = (SELECT OBJECT_ID FROM SYS.TABLES WHERE NAME = ''TINSTRUCAO_DESEMBARACO'')');
          ParamByName('NR_PROCESSO').AsString := nr_proc;
          ParamByName('ID_CODIGO').AsString   := Trim(EditInstrucaoDesemb.Text);
          ExecSQL;

          SQL.Clear;
          SQL.Add('UPDATE P');
          SQL.Add('SET CD_MOEDA_FRETE        = ID.CD_MOEDA_FRETE,');
          SQL.Add('    VL_FRETE_PREPAID_MNEG = ID.VL_FRETE_PREPAID_MNEG,');
          SQL.Add('    VL_FRETE_COLLECT_MNEG = ID.VL_FRETE_COLLECT_MNEG,');
          SQL.Add('    CD_MOEDA_SEGURO       = ID.CD_MOEDA_SEGURO,');
          SQL.Add('    VL_SEGURO_MNEG        = ID.VL_SEGURO_MNEG,');
          SQL.Add('    CD_LOCAL_EMBARQUE     = ID.CD_LOCAL_EMBARQUE,');
          SQL.Add('    DT_CONHECIMENTO       = ID.DT_CONHECIMENTO,');
          SQL.Add('    DT_EMBARQUE           = ID.DT_EMBARQUE,');
          SQL.Add('    DIAS_CONDICAO_PAGTO   = ID.DIAS_CONDICAO_PAGTO,');
          SQL.Add('    CONDICAO_PAGTO        = ID.CONDICAO_PAGTO,');
          SQL.Add('    CD_INCOTERM           = ID.CD_INCOTERM,');
          SQL.Add('    CD_AGENTE             = ID.CD_AGENTE,');
          SQL.Add('    TP_FRETE              = ID.CD_TIPO_FRETE,');
          SQL.Add('    CD_EMBARCACAO         = ID.CD_EMBARCACAO');
          SQL.Add('FROM TPROCESSO P, TINSTRUCAO_DESEMBARACO ID');
          SQL.Add('WHERE P.NR_PROCESSO = :NR_PROCESSO');
          SQL.Add('  AND ID.ID_CODIGO  = :ID_CODIGO');
          ParamByName('NR_PROCESSO').AsString := nr_proc;
          ParamByName('ID_CODIGO').AsString   := Trim(EditInstrucaoDesemb.Text);
          ExecSQL;

          PathOrig := ConsultaLookUP('TPARAMETROS', '"BLABLA"', 'BLABLA', 'PATH_DIGITALIZACAO');
          if PathOrig[Length(PathOrig)] <> '\' then
            PathOrig := PathOrig + '\';
          PathDest := PathOrig + 'TPROCESSO\' + nr_proc + '\';
          //PathDest := 'C:\DIGITALIZACAO\TPROCESSO\' + nr_proc + '\';  // Essa linha é apenas para teste
          PathOrig := PathOrig + 'TPROCESSO\' + EditInstrucaoDesemb.Text + '\';
          ForceDirectories(PathDest);
          SysUtils.FindFirst(PathOrig + '*.*', faAnyFile, SR);
          repeat
            if SR.Attr and faDirectory <> faDirectory then
              CopyFile(PAnsiChar(PathOrig + SR.Name), PAnsiChar(PathDest + SR.Name), False);
          until SysUtils.FindNext(SR) <> 0;

          Free;
        end;
      end;

      GravaFatores(nr_proc);

      CloseStoredProc(sp_follow_up);
      sp_follow_up.ParamByName('@NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      if GetServicoNovo then
        sp_follow_up.ParamByName('@CD_SERVICO').AsInteger := StrToInt(Trim(msk_cd_servico.text))
      else
        sp_follow_up.ParamByName('@CD_SERVICO').AsString  := msk_cd_servico.Text;
      ExecStoredProc(sp_follow_up);
      CloseStoredProc(sp_follow_up);

      // Atualizar o evento 022 (Observações) com as observações digitadas na Instrução de Desembaraço - Michel - 19/12/2011
      if Trim(EditInstrucaoDesemb.Text) <> '' then
        with TQuery.Create(Self) do
        begin
          DatabaseName  := 'DBBROKER';
          SQL.Clear;
          SQL.Add('UPDATE F');
          SQL.Add('SET TX_OBS = I.TX_OBSERVACOES');
          SQL.Add('FROM TFOLLOWUP F, TINSTRUCAO_DESEMBARACO I');
          SQL.Add('WHERE I.ID_CODIGO = :ID_CODIGO');
          SQL.Add('  AND F.NR_PROCESSO = :NR_PROCESSO');
          SQL.Add('  AND F.CD_EVENTO = ''022''');
          ParamByName('NR_PROCESSO').AsString := nr_proc;
          ParamByName('ID_CODIGO').AsString   := Trim(EditInstrucaoDesemb.Text);
          ExecSQL;
          Free;
        end;

      CloseStoredProc(sp_atz_evento);
      sp_atz_evento.ParamByName('@NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString := 'CD_EV_ABRE_PROC';  //003
      //sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := StrToDate(FormatDateTime('dd/mm/yyyy', dt_server));
      // Comentado acima e utilizando abaixo para incluir a hora da abertura no evento - Michel - 10/09/2012
      sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := hr_server;
      ExecStoredProc(sp_atz_evento);

      //Rodrigo Capra 02/05/2008
      CloseStoredProc(sp_atz_evento);
      sp_atz_evento.ParamByName('@NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString := 'CD_EV_DIG_DI';  //022
      //sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := StrToDate(FormatDateTime('dd/mm/yyyy', dt_server));
      // Comentado acima e utilizando abaixo para incluir a hora da abertura no evento - Michel - 10/09/2012
      sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := hr_server;
      ExecStoredProc(sp_atz_evento);

      CloseStoredProc(sp_atz_evento);


      if (str_processo_vinculado <> '') and (qry_servico_TP_SERVICO.AsString = '0') then
      begin
        CloseStoredProc(sp_vincula_processo);
        sp_vincula_processo.ParamByName('@nr_processo').AsString  := qry_processo_NR_PROCESSO.AsString;
        sp_vincula_processo.ParamByName('@nr_proc_vinc').AsString := str_processo_vinculado;
        ExecStoredProc(sp_vincula_processo);
        CloseStoredProc(sp_vincula_processo);
      end;

      if (str_processo_vinculado <> '') and (qry_servico_TP_SERVICO.AsString = '1') then
      begin
        CloseStoredProc(sp_vincula_processo);
        sp_vincula_processo.ParamByName('@nr_processo').AsString  := str_processo_vinculado;
        sp_vincula_processo.ParamByName('@nr_proc_vinc').AsString := qry_processo_NR_PROCESSO.AsString;
        ExecStoredProc(sp_vincula_processo);
        CloseStoredProc(sp_vincula_processo);
      end;

      if EditInstrucaoDesemb.Text <> '' then
      begin
        //Atualiza a tabela "TINSTRUCAO_DESEMBARACO" com o número de processo que foi vinculado
        AtualizaInstrucaoDesembaraco(qry_processo_NR_PROCESSO.AsString);
      end;

      // Inserir referência Pedido padrão - Michel - 03/09/2014
      FastExecSQL('EXEC SP_CRIA_REF_CLIENTE_PADRAO :NR_PROCESSO', [qry_processo_NR_PROCESSO.AsString]);

      if not datm_abre_proc.Simulacao then
        datm_main.db_broker.Commit;


      Grava := True;
      msk_nr_processo.Text := Copy(qry_processo_NR_PROCESSO.AsString, 5, 14);
      nr_processo_lote.Add(msk_nr_processo.Text);
    end;

    mi_incluir.Enabled         := False;
    mi_salvar.Enabled          := False;
    mi_cancelar.Enabled        := False;
    btn_incluir.Enabled        := False;
    btn_salvar.Enabled         := False;
    btn_cancelar.Enabled       := False;

    msk_cd_unid_neg.Enabled    := False;
    msk_cd_produto.Enabled     := False;
    msk_cd_cliente.Enabled     := False;
    msk_cd_servico.Enabled     := False;
    msk_cd_area.Enabled        := False;
    msk_cd_agente.Enabled      := False;
    msk_cd_destino.Enabled     := False;
    msk_cd_origem.Enabled      := False;
    msk_cd_cia.Enabled         := False;
    msk_cd_armador.Enabled     := False;
    msk_cd_ag_exp.Enabled      := False;
    msk_cd_destino_exp.Enabled := False;
    msk_cd_origem_exp.Enabled  := False;
    msk_cd_arm_exp.Enabled     := False;
    msk_cd_cia_exp.Enabled     := False;

    btn_co_unid_neg.Enabled    := False;
    btn_co_produto.Enabled     := False;
    btn_co_cliente.Enabled     := False;
    btn_co_servico.Enabled     := False;
    btn_co_area.Enabled        := False;
    btn_co_agente.enabled      := False;
    btn_co_origem.Enabled      := False;
    btn_co_destino.Enabled     := False;
    btn_co_origem_exp.Enabled  := False;
    btn_co_destino_exp.Enabled := False;
    btn_co_cia_exp.Enabled     := False;
    btn_co_arm_exp.Enabled     := False;
    btn_co_ag_exp.Enabled      := False;

  except
    on E: Exception do
    begin
      with datm_abre_proc do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;

        // Apaga os arquivos se tiverem sido copiados - Michel - 02/03/2010
        if PathDest <> '' then
        begin
          FindFirst(PathDest + '*.*', faAnyFile, SR);
          repeat
            if SR.Attr and faDirectory <> faDirectory then
            begin
              SetFileAttributes(PAnsiChar(PathDest + SR.Name), 0);
              DeleteFile(PathDest + SR.Name);
            end;
          until FindNext(SR) <> 0;
        end;

        TrataErro(E);
        qry_processo_.Cancel;
        qry_processo_.Append;
        Grava := False;

        msk_nr_processo.Text       := '';
        mi_incluir.Enabled         := False;
        mi_salvar.Enabled          := True;
        mi_cancelar.Enabled        := True;
        btn_incluir.Enabled        := FAlse;
        btn_salvar.Enabled         := True;
        btn_cancelar.Enabled       := True;

        msk_cd_unid_neg.Enabled    := True;
        msk_cd_produto.Enabled     := True;
        msk_cd_cliente.Enabled     := True;
        msk_cd_servico.Enabled     := True;
        msk_cd_area.Enabled        := True;
        msk_cd_agente.Enabled      := True;
        msk_cd_destino.Enabled     := True;
        msk_cd_origem.Enabled      := True;
        msk_cd_armador.Enabled     := True;
        msk_cd_ag_exp.Enabled      := True;
        msk_cd_ag_exp.Enabled      := True;
        msk_cd_destino_exp.Enabled := True;
        msk_cd_origem_exp.Enabled  := True;
        msk_cd_arm_exp.Enabled     := True;
        msk_cd_cia_exp.Enabled     := True;

        btn_co_unid_neg.Enabled    := True;
        btn_co_produto.Enabled     := True;
        btn_co_cliente.Enabled     := True;
        btn_co_servico.Enabled     := True;
        btn_co_area.Enabled        := True;
        btn_co_agente.enabled      := True;
        btn_co_origem.Enabled      := True;
        btn_co_destino.Enabled     := True;
        btn_co_origem_exp.Enabled  := True;
        btn_co_destino_exp.Enabled := True;
        btn_co_cia_exp.Enabled     := True;
        btn_co_arm_exp.Enabled     := True;
        btn_co_ag_exp.Enabled      := True;
      end;
    end;
  end;
  Screen.Cursor := crDefault;
end;

function Tfrm_abre_proc.PO2Manutencao(pPO, pCliente : String) : Boolean;
begin
  try
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear; //migra os dados da capa da PO
      SQL.Add('SELECT CD_IMPORTADOR, CD_LOCAL_EMBARQUE, CD_LOCAL_DESEMBARQUE, CD_PAIS_PROCEDENCIA,');
      SQL.Add('  CD_TIPO_FRETE, CD_MOEDA_FRETE, CD_INCOTERM, VL_FRETE_PREPAID, VL_FRETE_COLLECT');
      SQL.Add('FROM TPO ( NOLOCK )');
      SQL.Add('WHERE NR_PROCESSO = '+ QuotedStr(pPO));
      SQL.Add('  AND CD_EMPRESA  = ' + QuotedStr(pCliente)); // Michel - 15/01/2010
      Open;
      if not IsEmpty then // Michel - 15/01/2010
        begin
        with datm_abre_proc do
        begin
          if qry_processo_CD_CLIENTE.AsString <> Fields[0].AsString then
            MessageDlg('O Importador(Cliente) da PO não é o mesmo que o cliente informado no processo.', mtInformation, [mbOk], 0);
          //Local de embarque
          if qry_processo_CD_LOCAL_EMBARQUE.IsNull then
            qry_processo_CD_LOCAL_EMBARQUE.AsString := Fields[1].AsString;
          //Local desembarque
          if qry_processo_CD_LOCAL_DESEMBARQUE.IsNull then
            qry_processo_CD_LOCAL_DESEMBARQUE.AsString := Fields[2].AsString;
          //País de Origem/Procedência
          if qry_processo_CD_PAIS_ORIGEM.IsNull then
            qry_processo_CD_PAIS_ORIGEM.AsString := Fields[3].AsString;
          //Tipo de frete
          if qry_processo_TP_FRETE.IsNull then
            qry_processo_TP_FRETE.AsString := Fields[4].AsString;
          //Moeda do frete
          if qry_processo_CD_MOEDA_FRETE.IsNull then
            qry_processo_CD_MOEDA_FRETE.AsString := Fields[5].AsString;
          //Incoterm
          if qry_processo_CD_INCOTERM.IsNull then
            qry_processo_CD_INCOTERM.AsString := Fields[6].AsString;
          //repassa os valores
          if qry_processo_VL_FRETE_COLLECT_MNEG.IsNull then
            qry_processo_VL_FRETE_COLLECT_MNEG.AsFloat := Fields[7].AsFloat
          else
            qry_processo_VL_FRETE_COLLECT_MNEG.AsFloat := qry_processo_VL_FRETE_COLLECT_MNEG.AsFloat + Fields[7].AsFloat;

          if qry_processo_VL_FRETE_PREPAID_MNEG.IsNull then
            qry_processo_VL_FRETE_PREPAID_MNEG.AsFloat := Fields[8].AsFloat
          else
            qry_processo_VL_FRETE_PREPAID_MNEG.AsFloat := qry_processo_VL_FRETE_PREPAID_MNEG.AsFloat + Fields[8].AsFloat;
        end;
      end; // if not IsEmpty
      Close;
      Free;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

procedure Tfrm_abre_proc.btn_incluirClick(Sender: TObject);
begin
  pnlCliServ.Enabled := True;
  Label15.Visible := False;

//  if msk_cd_cliente.CanFocus then
//     msk_cd_cliente.SetFocus;
  eQtdProc.Text:='1'; //by carlos - 29/08/2011
  msk_seq_processo.Text:='1º';
  nr_processo_lote.Clear;

  mi_incluir.Enabled := False;
  mi_salvar.Enabled := True;
  mi_cancelar.Enabled := True;
  btn_incluir.Enabled := False;
  btn_salvar.Enabled := True;
  btn_cancelar.Enabled := True;
  DBGrid_Doc.Enabled := True;
  cotacao := false;
  pnl_desembaraco.Visible := False;
  pnl_imp.Visible := False;
  pnl_exp.Visible := False;
  if chkbox_dup.Checked then
  begin
    msk_cd_unid_neg.Enabled := False;
    msk_cd_produto.Enabled  := False;
    msk_cd_cliente.Enabled  := False;
    msk_cd_servico.Enabled  := False;

    btn_co_unid_neg.Enabled := False;
    btn_co_produto.Enabled  := False;
    btn_co_cliente.Enabled  := False;
    btn_co_servico.Enabled  := False;
    DBGrid_Doc.Enabled      := False;

    datm_abre_proc.qry_processo_.Cancel;
    datm_abre_proc.qry_processo_.Insert;
    datm_abre_proc.qry_processo_IN_ROUTING.aSsTRING := '0';

    msk_nr_processo.Text            := '';
    msk_nr_processo_fonte.Text      := '';
    msk_cd_cliente.Text             := '';
    msk_cd_clienteExit(nil);
    msk_cd_servico.Text             := '';
    msk_cd_servicoExit(nil);
    msk_nr_conhecimento.Text        := '';
    msk_nr_conhecimento_master.Text := '';
    msk_nr_processo_fonte.SetFocus;
    msk_cd_agente.Text              := '';
    msk_cd_origem.Text              := '';
    edt_nm_origem.Text              := '';
    edt_nm_agente.Text              := '';
    msk_cd_cia.Text                 := '';
    msk_cd_armador.Text             := '';
    edt_nm_armador.Text             := '';
    edt_nm_cia.Text                 := '';
    msk_cd_destino.Text             := '';
    edt_nm_destino.Text             := '';
    msk_proposta.Text               := '';
    msk_cd_ag_exp.Text              := '';
    msk_cd_destino_exp.Text         := '';
    msk_cd_origem_exp.Text          := '';
    msk_cd_arm_exp.Text             := '';
    msk_cd_cia_exp.Text             := '';
    msk_prop_exp.Text               := '';
    edt_nm_origem_exp.Text          := '';
    edt_nm_destino_exp.Text         := '';
    edt_nm_ag_exp.Text              := '';
    edt_nm_arm_exp.Text             := '';
    edt_nm_arm_exp.Text             := '';
    EditInstrucaoDesemb.Text        := '';
    Habilita_campos(False);
    LimpaGrids;
  end
  else
  begin
    msk_cd_unid_neg.Enabled    := True;
    msk_cd_produto.Enabled     := True;
    msk_cd_cliente.Enabled     := True;
    msk_cd_servico.Enabled     := True;
    msk_cd_agente.Enabled      := True;
    msk_cd_origem.Enabled      := True;
    edt_nm_origem.Enabled      := True;
    edt_nm_agente.Enabled      := True;
    msk_cd_cia.Enabled         := True;
    msk_cd_armador.Enabled     := True;
    edt_nm_armador.Enabled     := True;
    edt_nm_cia.Enabled         := True;
    msk_cd_destino.Enabled     := True;
    edt_nm_destino.Enabled     := True;
    msk_proposta.Enabled       := True;
    msk_cd_ag_exp.Enabled      := True;
    msk_cd_destino_exp.Enabled := True;
    msk_cd_origem_exp.Enabled  := True;
    msk_cd_arm_exp.Enabled     := True;
    msk_cd_cia_exp.Enabled     := True;
    msk_prop_exp.Enabled       := True;

    btn_co_unid_neg.Enabled    := True;
    btn_co_produto.Enabled     := True;
    btn_co_cliente.Enabled     := True;
    btn_co_servico.Enabled     := True;
    DBGrid_Doc.Enabled         := True;

    datm_abre_proc.qry_processo_.Cancel;
    datm_abre_proc.qry_processo_.Insert;
    msk_nr_processo.Text := '';
    msk_cd_cliente.Text := '';
    msk_cd_clienteExit(nil);
    msk_cd_servico.Text := '';
    msk_cd_servicoExit(nil);
    msk_nr_conhecimento.Text := '';
    msk_nr_conhecimento_master.Text := '';

    msk_cd_agente.Text       := '';
    msk_cd_origem.Text       := '';
    edt_nm_origem.Text       := '';
    edt_nm_agente.Text       := '';
    msk_cd_cia.Text          := '';
    msk_cd_armador.Text      := '';
    edt_nm_armador.Text      := '';
    edt_nm_cia.Text          := '';
    msk_cd_destino.Text      := '';
    edt_nm_destino.Text      := '';
    msk_proposta.Text        := '';
    msk_cd_ag_exp.Text       := '';
    msk_cd_destino_exp.Text  := '';
    msk_cd_origem_exp.Text   := '';
    msk_cd_arm_exp.Text      := '';
    msk_cd_cia_exp.Text      := '';
    msk_prop_exp.Text        := '';
    edt_nm_origem_exp.Text   := '';
    edt_nm_destino_exp.Text  := '';
    edt_nm_ag_exp.Text       := '';
    edt_nm_arm_exp.Text      := '';
    edt_nm_arm_exp.Text      := '';
    EditInstrucaoDesemb.Text := '';

    chkbx_proc_vinc_exp.Checked  := False;
    msk_cd_unid_vinc.Enabled     := False;
    msk_cd_unid_vinc.text        := '';
    edt_nm_unid_vinc.text        := '';

    msk_cd_prod_vinc.Enabled     := False;
    msk_cd_prod_vinc.Text        := '';
    edt_nm_prod_vinc.Text        := '';

    msk_proc_vinc_exp.Enabled    := False;
    msk_proc_vinc_exp.Text       := '';

    btn_proc_vinc_exp.Enabled    := False;
    btn_co_prod_vinc_exp.Enabled := False;
    btn_co_unid_vinc_exp.Enabled := False;

    chkbx_proc_vinc_imp.Checked  := False;

    msk_cd_unid_vinc_imp.Enabled := False;
    msk_cd_unid_vinc_imp.text    := '';
    edt_nm_unid_vinc_imp.text    := '';

    msk_cd_prod_vinc_imp.Enabled := False;
    msk_cd_prod_vinc_imp.Text    := '';
    edt_nm_prod_vinc_imp.Text    := '';

    msk_proc_vinc_imp.Enabled    := False;
    msk_proc_vinc_imp.Text       := '';

    btn_proc_vinc_imp.Enabled    := False;
    btn_co_prod_vinc_imp.Enabled := False;
    btn_co_unid_vinc_imp.Enabled := False;

    LimpaGrids;

    btn_co_armador.Visible        := False;
    msk_cd_armador.Visible        := False;
    edt_nm_armador.Visible        := False;
    btn_co_cia.Visible            := True;
    msk_cd_cia.Visible            := True;
    edt_nm_cia.Visible            := True;
    msk_cd_agente.Visible         := True;
    edt_nm_agente.Visible         := True;
    rd_group_tp_proc.ItemIndex    := 1;
    lb_cia_amrador.Caption        := 'Companhia';

    dgrp_tp_processo.ItemIndex     := 1;
    rdgroup_tp_comercial.ItemIndex := 0;
    msk_cd_ag_exp.Visible          := True;
    edt_nm_ag_exp.Visible          := True;
    Habilita_campos(True);

//    msk_cd_cliente.SetFocus;

    pgcDadosFatores.ActivePage := tsDados;

    if eQtdProc.CanFocus then
      eQtdProc.SetFocus
    else
      msk_cd_cliente.SetFocus;
  end;
  msk_cd_unid_neg.Enabled          := False;
  msk_cd_produto.Enabled           := False;
  btn_co_unid_neg.Enabled          := False;
  btn_co_produto.Enabled           := False;
  with datm_abre_proc do
  begin
    //tbl_doc_instr_emb_.open;
    qry_doc_inst_temp_.close;
    qry_doc_inst_temp_.open;
    qry_doc_inst_temp_.Insert;
    qry_ult_doc_inst_temp_.close;
    qry_ult_doc_inst_temp_.open;
    nr_identificador := (qry_ult_doc_inst_temp_ULTIMO.AsInteger + 1);
    qry_ult_doc_inst_temp_.close;
    qry_doc_inst_temp_NR_IDENTIFICADOR.AsInteger := Nr_Identificador;
  end;

end;

procedure Tfrm_abre_proc.btn_cancelarClick(Sender: TObject);
begin
  pnlCliServ.Enabled := False;
  try
    if datm_abre_proc.qry_processo_.State in [dsInsert, dsEdit] then
    begin
      datm_abre_proc.qry_processo_.Cancel;
    end;
  except
    BoxMensagem('Erro - cancelamento da operação. Tente cancelar novamente.', 2);
  end;
  cotacao := false;
  mi_incluir.Enabled      := True;
  mi_salvar.Enabled       := False;
  mi_cancelar.Enabled     := False;
  btn_incluir.Enabled     := True;
  btn_salvar.Enabled      := False;
  btn_cancelar.Enabled    := False;

  msk_cd_unid_neg.Enabled := True;
  msk_cd_produto.Enabled  := True;
  msk_cd_cliente.Enabled  := True;
  msk_cd_servico.Enabled  := True;

  btn_co_unid_neg.Enabled := True;
  btn_co_produto.Enabled  := True;
  btn_co_cliente.Enabled  := True;
  btn_co_servico.Enabled  := True;


  Habilita_campos(True);
  chkbx_proc_vinc_expClick(nil);
  chkbx_proc_vinc_impClick(nil);

  pnl_desembaraco.Visible := False;
  pnl_imp.Visible         := False;
  pnl_exp.Visible         := False;

  msk_cd_unid_neg.Enabled := True;
  msk_cd_produto.Enabled  := True;

  if Assigned(Self.OnActivate) then
    Self.OnActivate := nil;
end;

procedure Tfrm_abre_proc.btn_sairClick(Sender: TObject);
begin
  btn_cancelarClick(nil);
  nr_processo_gestao := '';
  st_entrada := '';
  Close;
end;

procedure Tfrm_abre_proc.FormCreate(Sender: TObject);
begin
  vstr_cd_modulo := '01';
  str_cd_rotina := '0108';

  //  Cria o DataModule do Processo
  Application.CreateForm(Tdatm_abre_proc, datm_abre_proc);
  cotacao := false;
  in_comercial := false;
  mi_incluir.Enabled := False;
  mi_salvar.Enabled := True;
  mi_cancelar.Enabled := True;
  btn_incluir.Enabled := False;
  btn_salvar.Enabled := True;
  btn_cancelar.Enabled := True;

  msk_cd_unid_neg.Enabled := True;
  msk_cd_produto.Enabled := True;
  msk_cd_cliente.Enabled := True;
  msk_cd_servico.Enabled := True;

  btn_co_unid_neg.Enabled := True;
  btn_co_produto.Enabled := True;
  btn_co_cliente.Enabled := True;
  btn_co_servico.Enabled := True;

  // Mostra usuario
  edt_nm_usuario.Text := str_ap_usuario;

  with datm_abre_proc do
  begin
    //  traz a unidade e o produto padrao do usuario
    qry_traz_default_.Close;
    qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_traz_default_.Prepare;
    qry_traz_default_.Open;

    //  traz as habilitacoes para o usuario
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_usuario_habilitacao_.Prepare;
    qry_usuario_habilitacao_.Open;

    //  atribui códigos defaults de unidade e produto
    msk_cd_unid_neg.Text := qry_traz_default_CD_UNID_NEG.AsString;
    msk_cd_produto.Text  := qry_traz_default_CD_PRODUTO.AsString;

    //  localiza a unidade x produto
    qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text]), [loCaseInsensitive]);
    edt_nm_unid_neg.Text := qry_usuario_habilitacao_look_nm_unid_neg.AsString;
    edt_nm_produto.Text := qry_usuario_habilitacao_look_nm_produto.AsString;
    msk_cd_produtoExit(nil);

    // abre processo (a tabela)
    qry_processo_.Close;
    qry_processo_.Prepare;
    qry_processo_.Open;

    // já inicializa indentando
    qry_processo_.Cancel;
    qry_processo_.Append;

    tbl_doc_instr_emb_.open;

    qry_doc_inst_temp_.close;
    qry_doc_inst_temp_.open;
    qry_doc_inst_temp_.append;
  end;
  pnl_desembaraco.Visible := false;
  pnl_imp.Visible := false;
  pnl_exp.Visible := false;
  Application.ProcessMessages;
  nr_processo_lote:=TStringList.Create;
end;

function Tfrm_abre_proc.Consiste;
var
  bAchouHabilitacaoCliente, bAchouUnidadeProduto, bAchouServicoCliente, bPropostaVencida, bCredencVencido, bAnvisaVencida :Boolean;
  dt_hoje: TDate;
  i: Byte;
  vRefClienteHabilitacao : Integer;
  vTexto,vTitulo: string;
  in_restricao: string[1];
begin
  with datm_abre_proc do
  begin
    // garante o exit em todos os campos
    msk_cd_unid_negExit(nil);
    msk_cd_produtoExit(nil);
    msk_cd_clienteExit(nil);
    msk_cd_servicoExit(nil);
    msk_cd_representanteExit(nil);
    msk_cd_local_desembarqueExit(nil);
    AbreTabelas;
    // Procura e posiciona
    bAchouHabilitacaoCliente := not qry_cliente_habilitacao_.EOF;
    bAchouUnidadeProduto := qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text]), [loCaseInsensitive]);
    bAchouServicoCliente := not qry_cliente_servico_.EOF;
    // Faz consistência básica
    if (Trim(msk_cd_unid_neg.Text) = '') then
    begin
      BoxMensagem('Campo "Cód. Unid. Neg." deve ser preenchido!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_unid_neg.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (Trim(msk_cd_produto.Text) = '') then
    begin
      BoxMensagem('Campo "Cód. Produto" deve ser preenchido!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_produto.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (Trim(msk_cd_cliente.Text) = '') then
    begin
      BoxMensagem('Campo "Cód. Cliente" deve ser preenchido!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_cliente.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (Trim(msk_cd_servico.Text) = '') then
    begin
      BoxMensagem('Campo "Cód. Serviço" deve ser preenchido!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_servico.SetFocus;
      Consiste := False;
      Exit;
    end;

    if not bAchouHabilitacaoCliente then
    begin
      BoxMensagem('Cliente inexistente ou sem habilitação para essa unidade x produto!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_cliente.SetFocus;
      Consiste := False;
      Exit;
    end;
    if not bAchouUnidadeProduto then
    begin
      BoxMensagem('Produto inexistente ou sem habilitação para esta unidade!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_produto.SetFocus;
      Consiste := False;
      Exit;
    end;
    if not (bAchouServicoCliente) then
    begin
      BoxMensagem('Serviço inexistente ou sem habilitação para o cliente!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_servico.SetFocus;
      Consiste := False;
      Exit;
    end;
    // Libera ou nao e atribui código de pendência
    in_restricao := '';
    qry_empresa_.close;
    qry_empresa_.parambyname('CD_EMPRESA').AsString := msk_cd_cliente.text;
    qry_empresa_.open;
    in_restricao := qry_empresa_IN_RESTRICAO.AsString;
    if (qry_empresa_CGC_EMPRESA.AsString = '') and (qry_empresa_CPF_EMPRESA.AsString = '') then
    begin
      Boxmensagem('Este cliente não possui CNPJ/CPF. Abertura de Processo não permitida', 2);
      Consiste := False;
      Exit;
    end;
    qry_empresa_.close;
    if (msk_cd_ag_exp.text = '') and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '02') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') then
    begin
      BoxMensagem('Deve ser inserido um Agente para abrir o Processo!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_ag_exp.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (msk_cd_cia_exp.text = '') and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '02') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') and (datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04') then
    begin
      BoxMensagem('Deve ser inserido um Companhia para abrir o Processo!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_cia_exp.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (msk_cd_arm_exp.text = '') and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '02') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') and (datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01') then
    begin
      BoxMensagem('Deve ser inserido um Armador para abrir o Processo!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_arm_exp.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (msk_cd_origem_exp.text = '') and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '02') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') then
    begin
      BoxMensagem('Deve ser inserido a Origem para abrir o Processo!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_origem_exp.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (msk_cd_destino_exp.text = '') and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '02') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') then
    begin
      BoxMensagem('Deve ser inserido a Destino para abrir o Processo!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_destino_exp.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (msk_proc_vinc_exp.text = '') and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '02') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') and (chkbx_proc_vinc_exp.Checked = true) then
    begin
      BoxMensagem('Deve ser inserido um Processo Vinculado!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_proc_vinc_exp.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (cbbEstufagem3.Text = '') and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '02') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') then
    begin
      BoxMensagem('Deve ser inserido um Tipo de Estufagem!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      cbbEstufagem3.SetFocus;
      Consiste := False;
      Exit;
    end;
    //fim exportacao

    //importacao
    if (msk_cd_agente.text = '') and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '01') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') then
    begin
      BoxMensagem('Deve ser inserido um Agente para abrir o Processo!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_agente.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (msk_cd_cia.text = '') and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '01') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') and (datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04') then
    begin
      BoxMensagem('Deve ser inserido um Companhia para abrir o Processo!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_cia.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (msk_cd_armador.text = '') and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '01') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') and (datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01') then
    begin
      BoxMensagem('Deve ser inserido um Armador para abrir o Processo!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_armador.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (msk_cd_origem.text = '') and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '01') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') then
    begin
      BoxMensagem('Deve ser inserido a Origem para abrir o Processo!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_origem.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (msk_cd_destino.text = '') and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '01') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') then
    begin
      BoxMensagem('Deve ser inserido a Destino para abrir o Processo!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_destino.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (msk_proc_vinc_imp.text = '') and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '01') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') and (chkbx_proc_vinc_imp.Checked = true) then
    begin
      BoxMensagem('Deve ser inserido um Processo Vinculado!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_proc_vinc_imp.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (cbbEstufagem2.Text = '') and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '01') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') then
    begin
      BoxMensagem('Deve ser inserido um Tipo de Estufagem!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      cbbEstufagem2.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (msk_cd_representante.Text = '')
    {and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '01')}   //comentado por agatha nigro 13/03/2018
    then
    begin
      BoxMensagem('Deve ser inserido um Representante!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_representante.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (msk_cd_local_desembarque.Text = '') and (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '01') then
    begin
      BoxMensagem('Deve ser inserido um Local de Desembarque!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_local_desembarque.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '01') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') then
    begin
      // Referências
      vRefClienteHabilitacao := RefClienteHabilitacao(msk_cd_unid_neg.Text, msk_cd_produto.Text, msk_cd_cliente.Text, 1);
      for i := 0 to (grdRefFIImp.RowCount - 1) do
      begin
        grdRefFIImp.Row := i;
        // verifica se ja existe em outro processo
        qry_ref_cli_.Close;
        qry_ref_cli_.SQL[2] := 'CD_REFERENCIA = "' + Trim(grdRefFIImp.Cells[1, grdRefFIImp.Row]) + '" AND CD_EMPRESA = "' + msk_cd_cliente.Text + '" AND NR_ITEM_PO = "' + Trim(grdRefFIImp.Cells[2, grdRefFIImp.Row]) + '" AND TP_REFERENCIA = "' + '01' + '"';
        qry_ref_cli_.Prepare;
        qry_ref_cli_.Open;
        if not qry_ref_cli_.EOF then
        begin
          if Trim(grdRefFIImp.Cells[1, grdRefFIImp.Row]) <> '' then
          begin
            if not BoxMensagem('Atenção! Referência "' + grdRefFIImp.Cells[1, grdRefFIImp.Row] + '" existente no processo: ' + Copy(qry_ref_cli_NR_PROCESSO.AsString, 5, 14) +
              #13#10 + 'Confirma?', 1) then
            begin
              Consiste := False;
              Exit;
            end;
          end;
        end;
        // verifica se o tamanho esta correto, desde que o cliente necessite essa verificação ( TCLIENTE_HABILITACAO )
        if vRefClienteHabilitacao > 0 then
        begin
          if ( Length(Trim(grdRefFIImp.Cells[1, grdRefFIImp.Row])) <> vRefClienteHabilitacao ) and ( Length(Trim(grdRefFIImp.Cells[1, grdRefFIImp.Row])) > 0 ) then
          begin
            MessageDlg('As referencias para esse cliente devem ter ' + IntToStr(vRefClienteHabilitacao) + ' caracteres. Verifique se suas referências foram digitadas corretamente.', mtError, [mbOK], 0);
            Consiste := False;
            Exit;
          end;
        end;
        // verifica se o item do cliente digitado existe no pedido digitado (para o último pois os outros já foram consistidos)
        //if i = grdRefFIImp.RowCount - 1 then
        //  VerificaGestao(grdRefFIImp);
      end;
    end;
    // fim importacao ag

    if Trim(EditInstrucaoDesemb.Text) <> '' then
    begin
      if not VerificaInstrucao(EditInstrucaoDesemb.Text) then
      begin
        BoxMensagem('Instrução de Desembaraço inválida!', 2);
        pgcDadosFatores.ActivePage := tsDados;
        EditInstrucaoDesemb.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if (cbbEstufagem1.Text = '') and  (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '0') then
    begin
      BoxMensagem('Deve ser inserido um Tipo de Estufagem!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      cbbEstufagem1.SetFocus;
      Consiste := False;
      Exit;
    end;

    if (checbx_proc_vinc_ag.Checked = true) and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '0') and (datm_abre_proc.qry_conhec_vinc.Recordcount = 0) then
    begin
      BoxMensagem('Não existe Processo para ser vinculado!', 2);
      pgcDadosFatores.ActivePage := tsDados;
      checbx_proc_vinc_ag.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '02') and (datm_abre_proc.qry_servico_TP_SERVICO.AsString = '1') and (datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04') then
      datm_abre_proc.verifica_qtde_conhecimento(msk_cd_cia_exp.text);
    cd_prefixo := qry_cliente_servico_CD_PREFIXO.AsString;
    in_inside_sda := qry_cliente_servico_IN_INCIDE_SDA.AsString;
    if (Trim(qry_cliente_servico_CD_PREFIXO.AsString) = '') or (qry_cliente_servico_CD_PREFIXO.IsNull) then
    begin
      BoxMensagem('Prefixo para abertura do processo não cadastrado!' + #13#10 + 'Consulte habilitação do cliente!', 2);
      msk_cd_servico.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (qry_cliente_servico_IN_ATIVO.AsString = '0') then
    begin
      BoxMensagem('Este serviço para o cliente está desativado, você não conseguirá abrir esse processo', 2);
      msk_cd_servico.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (qry_cliente_habilitacao_IN_ATIVO.AsString = '0') then
    begin
      BoxMensagem('Habilitação para o cliente está desativada, você não conseguirá abrir esse processo', 2);
      msk_cd_cliente.SetFocus;
      Consiste := False;
      Exit;
    end;
    if (qry_usuario_habilitacao_IN_ATIVO.AsString = '0') then
    begin
      BoxMensagem('Habilitação da unidade x produto está desativada, você não conseguirá abrir esse processo', 2);
      msk_cd_unid_neg.SetFocus;
      Consiste := False;
      Exit;
    end
    else
    begin
      // Nº Conhecimento -  by Carlos (checar o produto tambem) 29/06/2010
      if Trim(msk_nr_conhecimento.Text) <> '' then
      begin
        qry_conhecimento_.Close;
        qry_conhecimento_.ParamByName('NR_CONHECIMENTO').AsString := Trim(msk_nr_conhecimento.Text);
        qry_conhecimento_.ParamByName('CD_PRODUTO').AsString      := Trim(msk_cd_produto.Text);
        qry_conhecimento_.Prepare;
        qry_conhecimento_.Open;
        if not qry_conhecimento_.EOF then
          if not BoxMensagem('Nº Conhecimento "' + Trim(msk_nr_conhecimento.Text) + '" existente no processo: ' + qry_conhecimento_NR_PROCESSO.AsString + #13#10 + 'Deseja continuar ? ', 1) then
          begin
            pgcDadosFatores.ActivePage := tsDados;
            msk_nr_conhecimento.SetFocus;
            Consiste := False;
            Exit;
          end;
      end;
      // Nº Conhecimento Master -  by Carlos (checar o produto tambem) 29/06/2010
      if Trim(msk_nr_conhecimento_master.Text) <> '' then
      begin
        qry_conhecimento_master_.Close;
        qry_conhecimento_master_.ParamByName('NR_CONHECIMENTO_MASTER').AsString := Trim(msk_nr_conhecimento_master.Text);
        qry_conhecimento_master_.ParamByName('CD_PRODUTO').AsString             := Trim(msk_cd_produto.Text);
        qry_conhecimento_master_.Prepare;
        qry_conhecimento_master_.Open;
        if not qry_conhecimento_master_.EOF then
          if not BoxMensagem('Atenção! Nº Conhecimento Master"' + Trim(msk_nr_conhecimento_master.Text) + '" existente no processo: ' + qry_conhecimento_master_NR_PROCESSO.AsString + #13#10 + 'Deseja continuar ? ', 1) then
          begin
            pgcDadosFatores.ActivePage := tsDados;
            msk_nr_conhecimento_master.SetFocus;
            Consiste := False;
            Exit;
          end;
      end;
      // Referências
      FlagConsisteParcial := False;
      vRefClienteHabilitacao := RefClienteHabilitacao(msk_cd_unid_neg.Text, msk_cd_produto.Text, msk_cd_cliente.Text, 1);
      for i := 0 to (grdRef.RowCount - 1) do
      begin
        grdRef.Row := i;
        // verifica se ja existe em outro processo
        qry_ref_cli_.Close;
        qry_ref_cli_.SQL[2] := 'CD_REFERENCIA = ''' + Trim(grdRef.Cells[1, grdRef.Row]) + ''' AND ' +
                               'CD_EMPRESA = ''' + msk_cd_cliente.Text + ''' AND ' +
                               'NR_ITEM_PO = ''' + Trim(grdRef.Cells[2, grdRef.Row]) + ''' AND ' +
                               'TP_REFERENCIA = ''' + '01' + ''' AND ( SUBSTRING(NR_PROCESSO,5,2) <> ''DT'' AND SUBSTRING(NR_PROCESSO,5,2) <> ''IE'')';
        qry_ref_cli_.Prepare;
        qry_ref_cli_.Open;
        if not qry_ref_cli_.EOF then
        begin
          if Trim(grdRef.Cells[1, grdRef.Row]) <> '' then
          begin
            {if not BoxMensagem('Atenção! Referência "' + grdRef.Cells[1, grdRef.Row] + '" existente no processo: ' + Copy(qry_ref_cli_NR_PROCESSO.AsString, 5, 14) +
              #13#10 + 'Confirma?', 1) then
            begin
              Consiste := False;
              Exit;
            end;}
            if (Trim(EditInstrucaoDesemb.Text) = '') and
               not BoxMensagem('Este Pedido/item já está sendo utilizado no processo : ' + Copy(qry_ref_cli_NR_PROCESSO.AsString, 5, 14) + #13 +
                               'Deseja utilizá-lo novamente ? ' + #13 +
                               'Neste caso o sistema irá criar automaticamente uma segunda parcial.',1) then
            begin
              Consiste := False;
              Exit;
            end
            else
              FlagConsisteParcial := True;
          end;
        end;
        // verifica se o tamanho esta correto, desde que o cliente necessite essa verificação ( TCLIENTE_HABILITACAO )
        if vRefClienteHabilitacao > 0 then
        begin
          if ( Length(Trim(grdRef.Cells[1, grdRef.Row])) <> vRefClienteHabilitacao ) and ( Length(Trim(grdRef.Cells[1, grdRef.Row])) > 0 ) then
          begin
            MessageDlg('As referencias para esse cliente devem ter ' + IntToStr(vRefClienteHabilitacao) + ' caracteres. Verifique se suas referências foram digitadas corretamente.', mtError, [mbOK], 0);
            Consiste := False;
            Exit;
          end;
        end;
        // verifica se o item do cliente digitado existe no pedido digitado
        //if i = grdRef.RowCount - 1 then
        //  VerificaGestao(grdRef);
      end;
      if msk_cd_produto.Text = '01' then
      begin
        // LI's
        for i := 0 to (grdLI.RowCount - 1) do
        begin
          grdLI.Row := i;
          if Trim(grdLI.Cells[grdLI.Col, grdLI.Row]) <> '' then
          begin
            qry_li_.Close;
            qry_li_.SQL[2] := 'NR_LI = "' + Trim(grdLI.Cells[grdLI.Col, grdLI.Row]) + '"';
            qry_li_.Prepare;
            qry_li_.Open;
            if not qry_li_.EOF then
            begin
              if not BoxMensagem('LI "' + grdLI.Cells[grdLI.Col, grdLI.Row] + '" existente no processo: ' +
                Copy(qry_li_NR_PROCESSO.AsString, 5, 14) + #13#10 +
                'Confirma?', 1) then
              begin
                Consiste := False;
                Exit;
              end;
            end;
          end;
        end;
        // Documentos
        qry_doc_inst_temp_.first;
        if (qry_doc_inst_temp_CD_TIPO_DCTO_INSTR.AsString = '') and (qry_servico_TP_SERVICO.AsString = '0') then
        begin
          if not BoxMensagem('Atenção! Não foram informados Documentos para este processo!' + #13#10 + 'Deseja continuar ? ', 1)then
          begin
            Consiste := False;
            Exit;
          end;
        end
        else
        begin
          while not qry_doc_inst_temp_.eof do
          begin
           if qry_doc_inst_temp_NR_DCTO_INSTRUCAO.AsString = '' then
           begin
            vTitulo := 'blablabla';
           end
           else
           begin
           vTitulo:= qry_doc_inst_temp_NR_DCTO_INSTRUCAO.AsString;
           end;

           if qry_doc_inst_temp_CD_TIPO_DCTO_INSTR.AsString = '' then
           begin
            vTexto:= 'blablabla';
           end
           else
           begin
            vTexto:= qry_doc_inst_temp_CD_TIPO_DCTO_INSTR.AsString;
           end;

            qry_local_docs_.close;
            qry_local_docs_.parambyname('CD_TIPO_DCTO_INSTR').AsString := vTexto ;
            qry_local_docs_.parambyname('NR_DCTO_INSTRUCAO').AsString := vTitulo ;
            qry_local_docs_.open;
            if qry_local_docs_.recordcount > 0 then
            begin
              if not BoxMensagem('Documento: "' + qry_local_docs_DESCRICAO.AsString + ' - ' + qry_local_docs_NR_DCTO_INSTRUCAO.AsString +
                '" existente no processo: ' +
                Copy(qry_local_docs_NR_PROCESSO.AsString, 5, 14) + #13#10 +
                'Confirma?', 1) then
              begin
                qry_local_docs_.close;
                Consiste := False;
                Exit;
              end;
            end;
            qry_local_docs_.close;
            qry_doc_inst_temp_.next;
          end;
        end;
        Consiste := True;
        qry_processo_IN_LIBERADO.AsString := '1';
      end;

      //Verifica se processo será liberado ou não!!
      // Atribui data de hoje
      dt_hoje := StrToDate(FormatDateTime('dd/mm/yyyy', dt_server));
      //bPropostaVencida := (((qry_cliente_servico_DT_CAPTACAO.Value + qry_cliente_servico_PZ_PROPOSTA.Value) < dt_hoje) and (qry_cliente_servico_PZ_PROPOSTA.Value <> 0)) or (qry_cliente_servico_DT_CAPTACAO.IsNull);
      bCredencVencido  := (qry_cliente_habilitacao_DT_VALID_CRED_RF.Value < dt_hoje);
      //bAnvisaVencida   := (qry_cliente_habilitacao_DT_VALID_ANVISA.Value < dt_hoje) and not ((qry_cliente_habilitacao_DT_VALID_ANVISA.IsNull) or (qry_cliente_habilitacao_DT_VALID_ANVISA.AsString = ''));
      // Alterado por Michel para verificar datas apenas para os produtos 01 e 02 - 21/11/2011
      if (qry_servico_TP_SERVICO.AsString = '0') and ((msk_cd_produto.Text = '01') or (msk_cd_produto.Text = '02')) then
      begin
        //1. tudo bloqueado
        if (in_restricao = '1') and (bPropostaVencida) and (bCredencVencido) and (bAnvisaVencida) then
        begin
          if not Application.MessageBox('Existe restrição ao cliente e as datas de Proposta, Credenciamento e Anvisa estão vencidas!' +
                                        ' Registrar mesmo assim?', 'Liberação de Processo', MB_YESNO + MB_ICONWARNING) = mrYes then
          begin
            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_CD_RESTRICAO.AsString := 'F';
            qry_processo_IN_LIBERADO.AsString := '0';
          end;
        end
        //2. tudo bloqueado menos anvisa
        else if (in_restricao = '1') and (bPropostaVencida) and (bCredencVencido) then
        begin
          if not Application.MessageBox('Existe restrição ao cliente e as datas de Proposta e Credenciamento estão vencidas!' +
                                        ' Registrar mesmo assim?', 'Liberação de Processo', MB_YESNO + MB_ICONWARNING) = mrYes then
          begin
            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_CD_RESTRICAO.AsString := '7';
            qry_processo_IN_LIBERADO.AsString := '0';
          end;
        end
        //3. tudo bloqueado menos credenciamento
        else if (in_restricao = '1') and (bPropostaVencida) and (bAnvisaVencida) then
        begin
          if not Application.MessageBox('Existe restrição ao cliente e as datas de Proposta e Anvisa estão vencidas!' +
                                        ' Registrar mesmo assim?', 'Liberação de Processo', MB_YESNO + MB_ICONWARNING) = mrYes then
          begin

            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_CD_RESTRICAO.AsString := 'C';
            qry_processo_IN_LIBERADO.AsString := '0';
          end;
        end
        //4. tudo bloqueado menos proposta
        else if (in_restricao = '1') and (bAnvisaVencida) and (bCredencVencido) then
        begin
          if not Application.MessageBox('Existe restrição ao cliente e as datas de Credenciamento e Anvisa estão vencidas!' +
                                        ' Registrar mesmo assim?', 'Liberação de Processo', MB_YESNO + MB_ICONWARNING) = mrYes then
          begin
            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_CD_RESTRICAO.AsString := 'D';
            qry_processo_IN_LIBERADO.AsString := '0';
          end;
        end
        //5. tudo bloqueado menos restrição
        else if (bPropostaVencida) and (bAnvisaVencida) and (bCredencVencido) then
        begin
          if not Application.MessageBox('As datas de Credenciamento, Proposta e Anvisa estão vencidas!' +
                                        ' Registrar mesmo assim?', 'Liberação de Processo', MB_YESNO + MB_ICONWARNING) = mrYes then
          begin
            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_CD_RESTRICAO.AsString := 'E';
            qry_processo_IN_LIBERADO.AsString := '0';
          end;
        end
        //6. restrição e proposta
        else if (in_restricao = '1') and (bPropostaVencida) then
        begin
          if not Application.MessageBox('Existe restrição ao cliente e a data de Proposta está vencida!' +
                                        ' Registrar mesmo assim?', 'Liberação de Processo', MB_YESNO + MB_ICONWARNING) = mrYes then
          begin
            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_CD_RESTRICAO.AsString := '4';
            qry_processo_IN_LIBERADO.AsString := '0';
          end;
        end
        //7. restrição e credenciamento
        else if (in_restricao = '1') and (bCredencVencido) then
        begin
          if not Application.MessageBox('Existe restrição ao cliente e a data de Credenciamento está vencida!' +
                                        ' Registrar mesmo assim?', 'Liberação de Processo', MB_YESNO + MB_ICONWARNING) = mrYes then
          begin
            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_CD_RESTRICAO.AsString := '5';
            qry_processo_IN_LIBERADO.AsString := '0';
          end;
        end
        //8. restrição e Anvisa
        else if (in_restricao = '1') and (bAnvisaVencida) then
        begin
          if not Application.MessageBox('Existe restrição ao cliente e a data de Procuração Anvisa está vencida!' +
                                        ' Registrar mesmo assim?', 'Liberação de Processo', MB_YESNO + MB_ICONWARNING) = mrYes then
          begin
            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_CD_RESTRICAO.AsString := '9';
            qry_processo_IN_LIBERADO.AsString := '0';
          end;
        end
        //9. Proposta e Anvisa
        else if (bPropostaVencida) and (bAnvisaVencida) then
        begin
          if not Application.MessageBox('As datas de Proposta e Anvisa estão vencidas!' +
                                        ' Registrar mesmo assim?', 'Liberação de Processo', MB_YESNO + MB_ICONWARNING) = mrYes then
          begin
            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_CD_RESTRICAO.AsString := 'B';
            qry_processo_IN_LIBERADO.AsString := '0';
          end;
        end
        //10. Proposta e Credenciamento
        else if (bPropostaVencida) and (bCredencVencido) then
        begin
          if not Application.MessageBox('As datas de Credenciamento e Proposta estão vencidas!' +
                                        ' Registrar mesmo assim?', 'Liberação de Processo', MB_YESNO + MB_ICONWARNING) = mrYes then
          begin
            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_CD_RESTRICAO.AsString := '6';
            qry_processo_IN_LIBERADO.AsString := '0';
          end;
        end
        //11. Credenciamento e Anvisa
        else if (bAnvisaVencida) and (bCredencVencido) then
        begin
          if not Application.MessageBox('As datas de Credenciamento e Anvisa estão vencidas!' +
                                        ' Registrar mesmo assim?', 'Liberação de Processo', MB_YESNO + MB_ICONWARNING) = mrYes then
          begin
            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_CD_RESTRICAO.AsString := 'A';
            qry_processo_IN_LIBERADO.AsString := '0';
          end;
        end
        //12. Anvisa
        else if (bAnvisaVencida) then
        begin
          if not Application.MessageBox('A data de Procuração Anvisa está vencida!' +
                                        ' Registrar mesmo assim?', 'Liberação de Processo', MB_YESNO + MB_ICONWARNING) = mrYes then
          begin
            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_CD_RESTRICAO.AsString := '8';
            qry_processo_IN_LIBERADO.AsString := '0';
          end;
        end
        //13. Proposta
        else if (bPropostaVencida) then
        begin
          if not Application.MessageBox('A data de Proposta está vencida!' +
                                        ' Registrar mesmo assim?', 'Liberação de Processo', MB_YESNO + MB_ICONWARNING) = mrYes then
          begin
            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_CD_RESTRICAO.AsString := '2';
            qry_processo_IN_LIBERADO.AsString := '0';
          end;
        end
        //14. Credenciamento
        else if (bCredencVencido) then
        begin
          if not Application.MessageBox('A data de Credenciamento está vencida!' +
                                        ' Registrar mesmo assim?', 'Liberação de Processo', MB_YESNO + MB_ICONWARNING) = mrYes then
          begin
            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_CD_RESTRICAO.AsString := '3';
            qry_processo_IN_LIBERADO.AsString := '0';
          end;
        end
        //15. Restrição
        else if (in_restricao = '1') then
        begin
          if not Application.MessageBox('Existe restrição ao cliente!' +
                                        ' Registrar mesmo assim?', 'Liberação de Processo', MB_YESNO + MB_ICONWARNING) = mrYes then
          begin
            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_CD_RESTRICAO.AsString := '1';
            qry_processo_IN_LIBERADO.AsString := '0';
          end;
        end
        else
        begin
          qry_processo_CD_RESTRICAO.AsString := '0'; //  nenhuma pendência
          qry_processo_IN_LIBERADO.AsString := '1'; //  processo liberado
        end;
      end
      else // Caso não seja produto 01 nem 02, então ele não tem restrição - Michel - 21/11/2011
      begin
        qry_processo_CD_RESTRICAO.AsString := '0'; //  nenhuma pendência
        qry_processo_IN_LIBERADO.AsString := '1';
      end;

      FechaTabelas;
    end;
  end;
    Consiste := True;
     // Cód País Origem
 {   if msk_cd_pais.Text <> '' then
    begin
      if edt_nm_pais.Text = '' then
      begin
        BoxMensagem( 'Código do País de Origem inválido!', 2 );
        msk_cd_pais.SetFocus;
        Consiste := False;
        Exit;
      end
      else if  consultalookUP('TSERVICO', 'CD_SERVICO', msk_cd_servico.text, 'IN_ALADI') = '1' then
      begin
        if consultalookUP('TPAIS_BROKER', 'CD_PAIS', msk_cd_pais.text, 'IN_ALADI') = '0' then
        begin
          BoxMensagem( 'País de Origem não habilitado para serviço de Aladi!', 2 );
          msk_cd_pais.SetFocus;
          Consiste := False;
          Exit;
        end;
      end
      else if  consultalookUP('TSERVICO', 'CD_SERVICO', msk_cd_servico.text, 'IN_FUMIGACAO') = '1' then
      begin
        if consultalookUP('TPAIS_BROKER', 'CD_PAIS', msk_cd_pais.text, 'IN_FUMIGACAO') = '0' then
        begin
          BoxMensagem( 'País de Origem não habilitado para serviço de Fumigação!', 2 );
          msk_cd_pais.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
    if (msk_cd_pais.Text = '') and (msk_cd_produto.text = '01') then
    begin
      BoxMensagem('Deve ser inserido o País de Destino para abrir o Processo!', 2);
      msk_cd_pais.SetFocus;
      Consiste := false;
      Exit;
    end; }

  Result := ConsisteFatores;

end;

procedure Tfrm_abre_proc.msk_cd_produtoExit(Sender: TObject);
//var
  // nNumero : Double;
  // bAchou  : Boolean;
begin
  //ValCodEdt(msk_cd_produto); // Comentado porque foi incluido no KeyPress - Michel - 04/03/2010
  // Novas validações - Michel - 04/03/2010
  if edt_nm_produto.Text = '' then
  begin
    if Sender <> nil then
      MessageDlg('É necessário digitar um Produto válido.', mtInformation, [mbOk], 0);
    if msk_cd_produto.Enabled then
      msk_cd_produto.SetFocus;
  end
  else
  begin
    if Length(msk_cd_produto.Text) = 1 then
      msk_cd_produto.Text := '0' + msk_cd_produto.Text;
    if ConsultaLookUPSQL(' SELECT CD_PRODUTO' +
                         ' FROM TPRODUTO ' +
                         ' WHERE CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO ' +
                         '                      FROM TUSUARIO_HABILITACAO ' +
                         '                      WHERE CD_USUARIO = ' + QuotedStr(str_cd_usuario) +
                         '                        AND IN_ATIVO   = ''1''' +
                         '                        AND CD_PRODUTO = ' + QuotedStr(msk_cd_produto.Text) + ') ' +
                         '   AND IN_ATIVO = ''1''', 'CD_PRODUTO') <> msk_cd_produto.Text then
    begin
      if Sender <> nil then
        MessageDlg('Produto inválido ou você não tem habilitação para este Produto.', mtInformation, [mbOk], 0);
      if msk_cd_produto.Enabled then
        msk_cd_produto.SetFocus;
    end;
  end;
  if (Pos('Exp', edt_nm_produto.Text) > 0) or (Pos('exp', edt_nm_produto.Text) > 0) then
  begin
    grdLI.Enabled := false;
    lbl_li.Enabled := false;
  end
  else
  begin
    grdLI.Enabled := true;
    lbl_li.Enabled := true;
  end;
  if (msk_cd_unid_neg.Text <> '') and (msk_cd_produto.Text <> '') then
  begin
    pnlCliServ.Visible := True;
  end;
//  visualiza_paineis(datm_abre_proc.qry_servico_TP_SERVICO.AsString, datm_abre_proc.qry_produto_TP_PRODUTO.AsString);
(*  with datm_abre_proc do
  begin
    msk_cd_unid_neg.Text   := Trim(msk_cd_unid_neg.Text);
    nNumero                := StrToFloat(msk_cd_unid_neg.Text);
    msk_cd_unid_neg.Text   := StrZero( nNumero, msk_cd_unid_neg.MaxLength );
    msk_cd_produto.Text    := Trim(msk_cd_produto.Text);
    nNumero                := StrToFloat(msk_cd_produto.Text);
    msk_cd_produto.Text    := StrZero( nNumero, msk_cd_produto.MaxLength );
    if ( msk_cd_unid_neg.Text <> '' ) and ( msk_cd_produto.Text = '' ) then
    begin
      edt_nm_produto.Text    := '';
      bAchou                 := qry_usuario_habilitacao_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive]);
      if Not (bAchou) then
      begin
        BoxMensagem('Unidade não encontrada, sem habilitação ou desativado!', 2);
        msk_cd_unid_neg.Text := '';
        edt_nm_unid_neg.Text := '';
        msk_cd_unid_neg.SetFocus;
      end
      else edt_nm_unid_neg.Text := qry_usuario_habilitacao_look_nm_unid_neg.AsString;
    end;

    if ( msk_cd_unid_neg.Text = '' ) and ( msk_cd_produto.Text <> '' ) then
    begin
      edt_nm_unid_neg.Text   := '';
      bAchou                 := qry_usuario_habilitacao_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive]);
      if Not (bAchou) then
      begin
        BoxMensagem('Produto não encontrado, sem habilitação ou desativado!', 2);
        msk_cd_produto.Text  := '';
        edt_nm_produto.Text  := '';
        msk_cd_produto.SetFocus;
      end
      else edt_nm_produto.Text  := qry_usuario_habilitacao_look_nm_produto.AsString;
    end;

    if ( msk_cd_unid_neg.Text <> '' ) and ( msk_cd_produto.Text <> '' ) then
    begin
      msk_cd_unid_neg.Text   := Trim(msk_cd_unid_neg.Text);
      nNumero                := StrToFloat(msk_cd_unid_neg.Text);
      msk_cd_unid_neg.Text   := StrZero( nNumero, msk_cd_unid_neg.MaxLength );
      bAchou                 := qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text]), [loCaseInsensitive]);
      if Not (bAchou) then
      begin
        BoxMensagem('Unidade x Produto não encontrada, sem habilitação ou desativado!', 2);
        msk_cd_unid_neg.Text := '';
        edt_nm_unid_neg.Text := '';
        msk_cd_produto.Text  := '';
        edt_nm_produto.Text  := '';
        msk_cd_unid_neg.SetFocus;
      end
      else
      begin
        edt_nm_unid_neg.Text := qry_usuario_habilitacao_look_nm_unid_neg.AsString;
        edt_nm_produto.Text  := qry_usuario_habilitacao_look_nm_produto.AsString;
        lbl_li.Visible       := ( msk_cd_produto.Text = '01' );
        //lbl_fat.Visible      := ( msk_cd_produto.Text = '01' );
        grdLI.Visible        := ( msk_cd_produto.Text = '01' );
        //grdFat.Visible       := ( msk_cd_produto.Text = '01' );
      end;
    end;

    if ( msk_cd_unid_neg.Text = '' ) and ( msk_cd_produto.Text = '' ) then
    begin
      edt_nm_unid_neg.Text := '';
      edt_nm_produto.Text  := '';
    end;

    FechaTabelas;
  end;*)
end;

procedure Tfrm_abre_proc.msk_cd_clienteExit(Sender: TObject);
var
 //  nNumero : Double;
  bAchou: Boolean;
begin
  with datm_abre_proc do
  begin
    if Trim(msk_cd_cliente.Text) <> '' then
    begin
  //     msk_cd_cliente.Text    := Trim( msk_cd_cliente.Text );
    //   nNumero                := StrToFloat( msk_cd_cliente.Text );
      //ValCodEdt(msk_cd_cliente); // Comentado porque foi incluido no KeyPress - Michel - 04/03/2010

      if Length(Trim(msk_cd_cliente.Text)) < 5 then
        msk_cd_cliente.Text := RightStr('0000' + Trim(msk_cd_cliente.Text), 5);

      if Trim(msk_cd_servico.Text) <> '' then
        if GetServicoNovo then
          msk_cd_servico.Text := IntToStr(StrToInt(Trim(msk_cd_servico.Text)))
        else
        begin
          msk_cd_servico.Text := Trim(msk_cd_servico.Text);
          msk_cd_servico.Text := StrZero(StrToFloat(msk_cd_servico.Text), msk_cd_servico.MaxLength);
        end;

      qry_cliente_habilitacao_.Close;
      qry_cliente_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_cliente_habilitacao_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      qry_cliente_habilitacao_.ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
      qry_cliente_habilitacao_.Open;

      bAchou := not qry_cliente_habilitacao_.EOF;

      if not (bAchou) and (msk_cd_cliente.Text <> '') then
      begin
        if Sender <> nil then
          BoxMensagem('Cliente não encontrado ou sem habilitação para essa unidade x produto!', 2);
        edt_nm_cliente.Text := '';
        if msk_cd_cliente.Enabled then
          msk_cd_cliente.SetFocus;
      end
      else
        if qry_cliente_habilitacao_.FieldByName('CD_GRUPO').AsString = '' then
        begin
          if Sender <> nil then
            BoxMensagem('Cliente não possuiu um grupo cadastrado!', 2);
          edt_nm_cliente.Text := '';
          msk_cd_cliente.Text := '';
          btn_cancelar.Click;
        end
      else
      begin
        edt_nm_cliente.Text := qry_cliente_habilitacao_NM_EMPRESA.AsString;
        if (msk_cd_servico.Text <> '') and (ConsultaLookUPSQL(' SELECT CD_SERVICO ' +
                                                              ' FROM TCLIENTE_SERVICO ' +
                                                              ' WHERE CD_CLIENTE  = ' + QuotedStr(msk_cd_cliente.Text) +
                                                              '   AND CD_UNID_NEG = ' + QuotedStr(msk_cd_unid_neg.Text) +
                                                              '   AND CD_PRODUTO  = ' + QuotedStr(msk_cd_produto.Text) +
                                                              '   AND CD_SERVICO  = ' + IfThen(GetServicoNovo, msk_cd_servico.Text, QuotedStr(msk_cd_servico.Text)) +
                                                              '   AND IN_ATIVO    = ''1''', 'CD_SERVICO') = '') then
        begin
          msk_cd_servico.Text := '';
          edt_nm_servico.Text := '';
        end;
      end;

      qry_cliente_habilitacao_.Close;
      AtualizaFatores;
    end
    else
      edt_nm_cliente.Text := '';
  end;
  {
  IF (ConsultaLookUPSQL('SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = ''' + msk_cd_cliente.Text + ''' ', 'CD_GRUPO')='155')
      AND ((msk_cd_servico.TEXT='710') or (Trim(msk_cd_servico.TEXT) = '2'))
      AND (msk_cd_produto.TEXT='02')  then
  begin
    pnlBid.Visible:=True;
  end
  else
  BEGIN
    datm_abre_proc.qry_BID_Nestle.Close;
    pnlBid.Visible:=False;
  end;
 }
end;

procedure Tfrm_abre_proc.msk_cd_servicoExit(Sender: TObject);
var
  nNumero: Double;
  bAchouServico, bAchou: Boolean;

begin
  with datm_abre_proc do
  begin
    if msk_cd_servico.Text <> '' then
    begin
      if GetServicoNovo then
        msk_cd_servico.Text := IntToStr(StrToInt(Trim(msk_cd_servico.Text)))
      else
      begin
        msk_cd_servico.Text := Trim(msk_cd_servico.Text);
        nNumero := StrToFloat(msk_cd_servico.Text);
        msk_cd_servico.Text := StrZero(nNumero, msk_cd_servico.MaxLength);
      end;
      if not qry_servico_.Active then
      begin
        qry_servico_.Close;
        qry_servico_.Prepare;
        qry_servico_.Open;
      end;
      if GetServicoNovo then
        bAchouServico := qry_servico_.Locate('CD_SERVICO', StrToInt(msk_cd_servico.Text), [loCaseInsensitive])
      else
        bAchouServico := qry_servico_.Locate('CD_SERVICO', msk_cd_servico.Text, [loCaseInsensitive]);
      case strtoint(msk_cd_unid_neg.text) of
        1: str_centro_custo := qry_servico_CD_CT_CUSTO_1.AsString;
        2: str_centro_custo := qry_servico_CD_CT_CUSTO_2.AsString;
        3: str_centro_custo := qry_servico_CD_CT_CUSTO_3.AsString;
        4: str_centro_custo := qry_servico_CD_CT_CUSTO_4.AsString;
        5: str_centro_custo := qry_servico_CD_CT_CUSTO_5.AsString;
        6: str_centro_custo := qry_servico_CD_CT_CUSTO_6.AsString;
        7: str_centro_custo := qry_servico_CD_CT_CUSTO_7.AsString;
        8: str_centro_custo := qry_servico_CD_CT_CUSTO_8.AsString;
        9: str_centro_custo := qry_servico_CD_CT_CUSTO_9.AsString;
        10: str_centro_custo := qry_servico_CD_CT_CUSTO_10.AsString;
      else
        str_centro_custo := ''
      end;

      if (bAchouServico) and (qry_servico_IN_ATIVO.AsString = '1') then
      begin
        qry_cliente_servico_.Close;
        qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
        qry_cliente_servico_.ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
        if GetServicoNovo then
          qry_cliente_servico_.ParamByName('CD_SERVICO').AsInteger := StrToint(Trim(msk_cd_servico.Text))
        else
          qry_cliente_servico_.ParamByName('CD_SERVICO').AsString := msk_cd_servico.Text;
        qry_cliente_servico_.Prepare;
        qry_cliente_servico_.Open;

        bAchou := not qry_cliente_servico_.EOF;

        if not (bAchou) and (msk_cd_servico.Text <> '') then
        begin
          BoxMensagem('Servico não encontrado ou sem habilitação para esse cliente!', 2);
          edt_nm_servico.Text := '';
          if msk_cd_servico.Enabled then
            msk_cd_servico.SetFocus;
          exit;
        end
        else
        begin
          edt_nm_servico.Text := qry_cliente_servico_look_nm_servico.AsString;

          visualiza_paineis(qry_servico_TP_SERVICO.AsString, datm_abre_proc.qry_produto_TP_PRODUTO.AsString);

          if qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then //via aerea
          begin
               //importacao
            btn_co_armador.Visible := false;
            msk_cd_armador.Visible := false;
            edt_nm_armador.Visible := false;
            btn_co_cia.Visible := true;
            msk_cd_cia.Visible := true;
            edt_nm_cia.Visible := true;
            lb_cia_amrador.Caption := 'Companhia';
               //exportacao
            btn_co_arm_exp.Visible := false;
            msk_cd_arm_exp.Visible := false;
            edt_nm_arm_exp.Visible := false;
            btn_co_cia_exp.Visible := true;
            msk_cd_cia_exp.Visible := true;
            edt_nm_cia_exp.Visible := true;
            lb_cia_amrador_exp.Caption := 'Companhia';
                 //desembaraco
                  // msk_nr_conhecimento_master.EditMask:='000\-0000\-0000;1;_';
                  // msk_nr_conhecimento.EditMask:='0000\-0000\-000;1;_';


          end;
          if qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then //via maritima
          begin
               //importacao
            btn_co_armador.Visible := true;
            msk_cd_armador.Visible := true;
            edt_nm_armador.Visible := true;
            btn_co_cia.Visible := false;
            msk_cd_cia.Visible := false;
            edt_nm_cia.Visible := false;
            lb_cia_amrador.Caption := 'Armador';
               //exportacao
            btn_co_arm_exp.Visible := true;
            msk_cd_arm_exp.Visible := true;
            edt_nm_arm_exp.Visible := true;
            btn_co_cia_exp.Visible := false;
            msk_cd_cia_exp.Visible := false;
            edt_nm_cia_exp.Visible := false;
            lb_cia_amrador_exp.Caption := 'Armador';
                //desembaraco
            msk_nr_conhecimento_master.EditMask := '';
            msk_nr_conhecimento_master.MaxLength := 30;
            msk_nr_conhecimento.EditMask := '';
            msk_nr_conhecimento.MaxLength := 30;
          end;

        end;
        qry_cliente_servico_.Close;
        qry_cliente_servico_.UnPrepare;

        //Desabilita campos de Instrução de desembaraço caso o serviço exija LI
        EditInstrucaoDesemb.Enabled := qry_servico_IN_LI.AsString = '0';
        Btn_InstrucaoDesemb.Enabled := qry_servico_IN_LI.AsString = '0';
        grdRef.Enabled              := True;
        AtualizaFatores;
      end
      else
      begin
        BoxMensagem('Esse Serviço não está ativo!', 2);
        edt_nm_servico.Text := '';
        if msk_cd_servico.Enabled then
          msk_cd_servico.SetFocus;
      end;
    end
    else
      edt_nm_servico.Text := '';
      
    {IF (ConsultaLookUPSQL('SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = ''' + msk_cd_cliente.Text + ''' ', 'CD_GRUPO')='155')
      AND ((msk_cd_servico.TEXT='710') or (Trim(msk_cd_servico.TEXT) = '2'))
      AND (msk_cd_produto.TEXT='02')  then
    begin
      pnlBid.Visible:=True;
    end
    else
    begin
      datm_abre_proc.qry_BID_Nestle.Close;
      pnlBid.Visible:=False;
    end; }
  end;   
end;

procedure Tfrm_abre_proc.FormClose(Sender: TObject; var Action: TCloseAction);
var via: string;
begin
  with datm_abre_proc do
  begin
    if qry_processo_.State in [dsinsert] then
      qry_processo_.Cancel;

    (* cd_unid_neg_gestao := msk_cd_unid_neg.Text;
    cd_prod_gestao     := msk_cd_produto.Text;

    if (chkbox_dup.Checked) or (nr_processo_destino <> '') then
      nr_processo_gestao := nr_processo_destino
    else
      nr_processo_gestao := qry_processo_NR_PROCESSO.AsString;*)

    if st_entrada = '' then
    begin
      cd_unid_neg_gestao := '';
      cd_prod_gestao := '';
      nr_processo_gestao := '';
    end;


    via := qry_servico_CD_VIA_TRANSPORTE.AsString;

    qry_processo_.Close;
    qry_empresa_.Close;
    qry_cliente_habilitacao_.Close;
    qry_cliente_servico_.Close;
    qry_usuario_habilitacao_.Close;
    qry_produto_.Close;
    qry_unid_neg_.Close;
    qry_unidade_.Close;
    qry_unid_neg_produto_.Close;
    qry_traz_default_.Close;
    qry_ult_processo_.Close;
    qry_servico_.Close;
    qry_area_.Close;
    tbl_yesno_.Close;
    tbl_doc_instr_emb_.Close;
    qry_doc_inst_temp_.close;
  end;
  datm_abre_proc.Free;
  Action := caFree;
  if st_entrada = '3' then
  begin
    vstr_cd_modulo := '30';
    str_cd_rotina := '3001';
    Application.CreateForm(TFrm_Instrucao_Embarque, Frm_Instrucao_Embarque);
    with Frm_Instrucao_Embarque do
    begin
      lCons_OnLine := True;
      via_transp := via;
      pgctrl_instrucao_embarque.ActivePage := ts_dados_basicos;
      frm_instrucao_embarque.via_transp := '04';
      frm_instrucao_embarque.Caption := 'Envio de Instrução - Aéreo';
      ts_lista.Tabvisible := false;
      Pesquisa := nr_processo_gestao;
      ShowModal;
      lCons_OnLine := False;
    end;
  end;

  if st_entrada = '4' then
  begin
    vstr_cd_modulo := '30';
    str_cd_rotina := '3002';
    Application.CreateForm(TFrm_Instrucao_Embarque, Frm_Instrucao_Embarque);
    with Frm_Instrucao_Embarque do
    begin
      lCons_OnLine := True;
      via_transp := via;
      pgctrl_instrucao_embarque.ActivePage := ts_dados_basicos;
      frm_instrucao_embarque.via_transp := '01';
      frm_instrucao_embarque.Caption := 'Envio de Instrução - Marítimo';
      ts_lista.Tabvisible := false;
      Pesquisa := nr_processo_gestao;
      ShowModal;
      lCons_OnLine := False;
    end;
  end;

  if st_entrada = '5' then
  begin
    vstr_cd_modulo := '32';
    str_cd_rotina := '3201';
    Application.CreateForm(TFrm_Pedido_Instrucao, Frm_pedido_Instrucao);
    with Frm_pedido_Instrucao do
    begin
      lCons_OnLine := True;
      via_transp := via;

      Frm_pedido_Instrucao.edt_nm_unid.text := frm_abre_proc.edt_nm_unid_neg.text;
      Frm_pedido_Instrucao.msk_cd_unid.text := frm_abre_proc.msk_cd_unid_neg.text;
      Frm_pedido_Instrucao.edt_nm_produto.text := frm_abre_proc.edt_nm_produto.text;
      Frm_pedido_Instrucao.msk_cd_produto.text := frm_abre_proc.msk_cd_produto.text;

        //  pgctrl_instrucao_embarque.ActivePage:=ts_dados_basicos;
       //   frm_instrucao_embarque.via_transp:='01';
        //  frm_instrucao_embarque.Caption:='Envio de Instrução - Marítimo';
       //   ts_lista.Tabvisible:=false;
      if frm_abre_proc.in_comercial then
      begin
        Frm_pedido_Instrucao.in_comerc := True;
           //  Frm_pedido_Instrucao.btn_liberar.Visible := false;
      end;

      Pesquisa := nr_processo_gestao;
      ShowModal;
      lCons_OnLine := False;
    end;
  end;

  if st_entrada = '6' then
  begin
    vstr_cd_modulo := '32';
    str_cd_rotina := '3201';
    Application.CreateForm(TFrm_Pedido_Instrucao, Frm_pedido_Instrucao);
    with Frm_pedido_Instrucao do
    begin
      lCons_OnLine := True;
      via_transp := via;

      Frm_pedido_Instrucao.edt_nm_unid.text := frm_abre_proc.edt_nm_unid_neg.text;
      Frm_pedido_Instrucao.msk_cd_unid.text := frm_abre_proc.msk_cd_unid_neg.text;
      Frm_pedido_Instrucao.edt_nm_produto.text := frm_abre_proc.edt_nm_produto.text;
      Frm_pedido_Instrucao.msk_cd_produto.text := frm_abre_proc.msk_cd_produto.text;

      Frm_pedido_Instrucao.via_transp := '01';
      Pesquisa := nr_processo_gestao;
      if frm_abre_proc.in_comercial then
      begin
        Frm_pedido_Instrucao.in_comerc := True;
            // Frm_pedido_Instrucao.btn_liberar.Visible := false;
      end;
      ShowModal;
      lCons_OnLine := False;
    end;
  end;

  if st_entrada = '1' then
  begin
    vstr_cd_modulo := '01';
    str_cd_rotina := '0110';
    Application.CreateForm(tfrm_followup, frm_followup);
    frm_followup.pesq_cd_unid_neg := Copy(nr_processo_gestao, 1, 2);
    frm_followup.pesq_cd_prod := Copy(nr_processo_gestao, 3, 2);
    frm_followup.pesq_nr_proc := nr_processo_gestao;
    frm_followup.ShowModal;
  end;
  if st_entrada = '0' then
  begin
    nr_processo_gestao := msk_cd_unid_neg.text + msk_cd_produto.text + msk_nr_processo.text;
  end;
end;

procedure Tfrm_abre_proc.btn_co_unid_negClick(Sender: TObject);
begin
(* str_cd_modulo        := '23';
  str_cd_rotina        := '2301';

  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    lCons_OnLine       := True;
    Caption            := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine       := False;
  end;
  msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
  str_cd_modulo        := '01';
  str_cd_rotina        := '0102';

  msk_cd_produtoExit(nil); *)

  {if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then Exit;
  datm_abre_proc.qry_processo_CD_UNID_NEG.AsString := ConsultaOnLineEx('TUNID_NEG', 'Unidades de Negócio', ['CD_UNID_NEG', 'NM_UNID_NEG'], ['Código', 'Unidade'], 'CD_UNID_NEG',nil);
  datm_abre_proc.qry_processo_CD_UNID_NEG.AsString := ConsultaOnLineExSQL(' SELECT CD_UNID_NEG, NM_UNID_NEG ' +
                                                                          ' FROM TUNID_NEG ' +
                                                                          ' WHERE CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG ' +
                                                                          '                       FROM TUSUARIO_HABILITACAO ' +
                                                                          '                       WHERE CD_USUARIO = ' + QuotedStr(str_cd_usuario) + ')',
     'Unidades de Negócio', ['CD_UNID_NEG', 'NM_UNID_NEG'], ['Código', 'Unidade'], 'CD_UNID_NEG', nil, msk_cd_unid_neg.Text);
  msk_cd_unid_neg.Text := datm_abre_proc.qry_processo_CD_UNID_NEG.AsString;}

  // Alterado a consulta acima pela consulta abaixo - Michel - 04/03/2010
  msk_cd_unid_neg.Text := ConsultaOnLineExSQL(' SELECT CD_UNID_NEG, NM_UNID_NEG ' +
                                              ' FROM TUNID_NEG ' +
                                              ' WHERE CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG ' +
                                              '                       FROM TUSUARIO_HABILITACAO ' +
                                              '                       WHERE CD_USUARIO = ' + QuotedStr(str_cd_usuario) +
                                              '                         AND IN_ATIVO = ''1'') ' +
                                              '   AND IN_ATIVO = ''1''',
     'Unidades de Negócio', ['CD_UNID_NEG', 'NM_UNID_NEG'], ['Código', 'Unidade'], 'CD_UNID_NEG', nil, msk_cd_unid_neg.Text);
  msk_cd_unid_negExit(msk_cd_unid_neg);
end;

procedure Tfrm_abre_proc.btn_co_produtoClick(Sender: TObject);
begin
(*  str_cd_modulo        := '23';
  str_cd_rotina        := '2302';

  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    lCons_OnLine       := True;
    Caption            := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine       := False;
  end;
  msk_cd_produto.Text  := frm_produto.Cons_OnLine_Texto;
  str_cd_modulo        := '01';
  str_cd_rotina        := '0102';

  msk_cd_produtoExit(nil); *)

  {if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then Exit;
  datm_abre_proc.qry_processo_CD_PRODUTO.AsString := ConsultaOnLineEx('TPRODUTO', 'Produtos', ['CD_PRODUTO', 'NM_PRODUTO'], ['Código', 'Unidade'], 'CD_PRODUTO',nil);
  msk_cd_produto.Text := datm_abre_proc.qry_processo_CD_PRODUTO.AsString;}

  // Alterado a consulta acima pela consulta abaixo - Michel - 04/03/2010
  msk_cd_produto.Text := ConsultaOnLineExSQL(' SELECT CD_PRODUTO, NM_PRODUTO ' +
                                             ' FROM TPRODUTO ' +
                                             ' WHERE CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO ' +
                                             '                      FROM TUSUARIO_HABILITACAO ' +
                                             '                      WHERE CD_USUARIO =' + QuotedStr(str_cd_usuario) +
                                             '                        AND IN_ATIVO = ''1'') ' +
                                             '   AND IN_ATIVO = ''1''',
     'Produtos', ['CD_PRODUTO', 'NM_PRODUTO'], ['Código', 'Unidade'], 'CD_PRODUTO', nil, msk_cd_produto.Text);
  msk_cd_produtoExit(msk_cd_produto);
end;

procedure Tfrm_abre_proc.btn_co_clienteClick(Sender: TObject);
begin
(*  msk_cd_cliente.Text :=ConsultaOnLineExSQL('SELECT NM_EMPRESA, CD_EMPRESA, CGC_EMPRESA FROM TEMPRESA_NAC  WHERE IN_ATIVO = "1" ORDER BY NM_EMPRESA','Cliente',
                      ['NM_EMPRESA' ,'CD_EMPRESA'],
                      ['Cliente','Cod. Cliente'],
                      'CD_EMPRESA');

  msk_cd_clienteExit(nil);*)
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then Exit;
//  datm_abre_proc.qry_processo_CD_CLIENTE.AsString := ConsultaOnLineEx('TEMPRESA_NAC', 'Clientes', ['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA','CGC_EMPRESA','END_EMPRESA'],['Código','Descrição','Apelido','CNPJ','Endereço'], 'CD_EMPRESA',nil,0);
  datm_abre_proc.qry_processo_CD_CLIENTE.AsString := ConsultaOnLineExSQL(' SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, CGC_EMPRESA, END_EMPRESA ' +
                                                                         ' FROM TEMPRESA_NAC EN (NOLOCK) ' +
                                                                         '    INNER JOIN TCLIENTE_HABILITACAO CH (NOLOCK) ON CH.CD_CLIENTE = EN.CD_EMPRESA ' +
                                                                         ' WHERE EN.IN_ATIVO    = ''1''' +
                                                                         '   AND CH.CD_UNID_NEG = ' + QuotedStr(msk_cd_unid_neg.Text) +
                                                                         '   AND CH.CD_PRODUTO  = ' + QuotedStr(msk_cd_produto.Text) +
                                                                         '   AND CH.IN_ATIVO    = ''1''',
     'Clientes', ['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA'],['Código', 'Descrição', 'Apelido', 'CNPJ', 'Endereço'], 'CD_EMPRESA', nil, msk_cd_cliente.Text);
  msk_cd_cliente.Text := datm_abre_proc.qry_processo_CD_CLIENTE.AsString;
end;

procedure Tfrm_abre_proc.btn_co_servicoClick(Sender: TObject);
begin
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then
    Exit;
  datm_abre_proc.qry_processo_CD_SERVICO.AsString := ConsultaOnLineExSQL(' SELECT CD_SERVICO, NM_SERVICO ' +
                                                                         ' FROM TSERVICO P ' +
                                                                         ' WHERE (P.IN_ATIVO = ''1'') ' +
                                                                         '   AND P.CD_SERVICO IN (SELECT S.CD_SERVICO ' +
                                                                         '                        FROM TCLIENTE_SERVICO S ' +
                                                                         '                        WHERE  S.CD_CLIENTE  = ''' + msk_cd_cliente.Text + ''' ' +
                                                                         '                          AND S.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' ' +
                                                                         '                          AND CD_PRODUTO    = ''' + msk_cd_produto.Text + ''' ' +
                                                                         '                          AND S.IN_ATIVO = ''1'' )',
     'Seviços', ['CD_SERVICO', 'NM_SERVICO'], ['Código', 'Descrição'], 'CD_SERVICO', nil, msk_cd_servico.Text);
  msk_cd_servico.Text := datm_abre_proc.qry_processo_CD_SERVICO.AsString;

(*  str_cd_modulo := '23';
  str_cd_rotina := '2303';

  Application.CreateForm(Tfrm_servico, frm_servico);
  with datm_servico.qry_servico_ do
  begin
    Close;
    Sql.Clear;
    RequestLive := False;
    Sql.Text := 'SELECT * ' +
      'FROM   TSERVICO P WHERE ( P.IN_ATIVO = "1" ) AND ' +
      'P.CD_SERVICO IN ( SELECT S.CD_SERVICO ' +
      'FROM   TCLIENTE_SERVICO S ' +
      'WHERE  S.CD_CLIENTE  = :CD_CLIENTE  AND ' +
      'S.CD_UNID_NEG = :CD_UNID_NEG AND ' +
      'CD_PRODUTO    = :CD_PRODUTO  AND ' +
      'S.IN_ATIVO = "1" )' +
      'ORDER BY NM_SERVICO';
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.text;
    ParamByName('CD_PRODUTO').AsString := msk_cd_produto.text;
    Prepare;
    Open;
  end;
  with frm_servico do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_servico.Text := frm_servico.Cons_OnLine_Texto;
  str_cd_modulo := '01';
  str_cd_rotina := '0102';*)

  msk_cd_servicoExit(nil);
end;

procedure Tfrm_abre_proc.btn_co_processo_fonteClick(Sender: TObject);
begin
  with datm_abre_proc do
  begin
    Screen.Cursor := crHourGlass;
    Application.CreateForm(Tfrm_consulta_processo, frm_consulta_processo);
    frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
    frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
    frm_consulta_processo.ShowModal;

    Screen.Cursor := crHourGlass;

    Application.ProcessMessages;

    if (frm_consulta_processo.Nr_Processo <> '') then
    begin
      msk_nr_processo_fonte.Text := Copy(frm_consulta_processo.Nr_Processo, 5, 14);
      msk_nr_processo_fonteExit(nil);
    end;
  end;
end;

procedure Tfrm_abre_proc.chkbox_dupClick(Sender: TObject);
begin
  msk_nr_processo_fonte.Enabled := chkbox_dup.Checked;
  btn_co_processo_fonte.Enabled := chkbox_dup.Checked;

  msk_cd_unid_neg.Enabled := not chkbox_dup.Checked;
  msk_cd_produto.Enabled := not chkbox_dup.Checked;
  msk_cd_cliente.Enabled := not chkbox_dup.Checked;
  msk_cd_servico.Enabled := not chkbox_dup.Checked;

  btn_co_unid_neg.Enabled := not chkbox_dup.Checked;
  btn_co_produto.Enabled := not chkbox_dup.Checked;
  btn_co_cliente.Enabled := not chkbox_dup.Checked;
  btn_co_servico.Enabled := not chkbox_dup.Checked;
end;

procedure Tfrm_abre_proc.msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_nr_processo_fonte then btn_co_processo_fonteClick(nil);
    if Sender = msk_cd_unid_neg       then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto        then btn_co_produtoClick(nil);
    if Sender = msk_cd_cliente        then btn_co_clienteClick(nil);
    if Sender = msk_cd_servico        then btn_co_servicoClick(nil);
    if Sender = msk_cd_area           then btn_co_areaClick(nil);
    if Sender = msk_cd_celula         then btn_co_celulaClick(btn_co_celula);
    if Sender = msk_cd_agente         then btn_co_agenteClick(nil);
    if Sender = msk_cd_origem         then btn_co_origemClick(nil);
    if Sender = msk_cd_destino        then btn_co_destinoClick(nil);
    if Sender = msk_cd_unid_vinc      then msk_cd_unid_vincExit(nil);
    if Sender = msk_cd_prod_vinc      then msk_cd_prod_vincExit(nil);
    if Sender = msk_cd_unid_vinc_imp  then btn_co_unid_vinc_impClick(nil);
    if Sender = msk_cd_prod_vinc_imp  then btn_co_prod_vinc_impClick(nil);
    if Sender = msk_proc_vinc_imp     then btn_proc_vinc_impClick(nil);
    if Sender = msk_proc_vinc_exp     then btn_proc_vinc_expClick(nil);
    if (Sender = msk_proposta)        then btn_co_cot_impClick(nil);
    if Sender = msk_cd_origem_exp     then btn_co_origem_expClick(nil);
    if Sender = msk_cd_destino_exp    then btn_co_destino_expClick(nil);
    if Sender = msk_cd_arm_exp        then btn_co_arm_expClick(nil);
    if Sender = msk_cd_cia_exp        then btn_co_cia_expClick(nil);
    if Sender = msk_cd_ag_exp         then btn_co_ag_expClick(nil);
    if (Sender = msk_prop_exp)        and (rdgroup_tp_comercial.ItemIndex = 0) then btn_prop_expClick(nil);
    if (Sender = msk_prop_exp)        and (rdgroup_tp_comercial.ItemIndex = 1) then btn_co_cotacaoClick(nil);
    if Sender = EditInstrucaoDesemb        then Btn_InstrucaoDesembClick(Btn_InstrucaoDesemb);
    if Sender = msk_cd_representante       then Btn_InstrucaoDesembClick(Btn_InstrucaoDesemb);
    if Sender = msk_cd_local_desembarque   then Btn_InstrucaoDesembClick(Btn_InstrucaoDesemb);
  end;
  if (Key = VK_F8) and (Sender = msk_nr_processo_fonte) then
  begin
    Application.CreateForm(Tfrm_pesq_proc, frm_pesq_proc);
    frm_pesq_proc.ShowModal;
    if (frm_pesq_proc.PesqNrProcesso <> '') then
    begin
      msk_nr_processo_fonte.Text := Copy(frm_pesq_proc.PesqNrProcesso, 5, 14);
      msk_nr_processo_fonteExit(nil);
    end;
  end;
end;

procedure Tfrm_abre_proc.btn_manut_procClick(Sender: TObject);
begin
  vstr_cd_modulo := '01';
  str_cd_rotina := '0102';
  str_cd_rotina_atalho := '0102';
  st_entrada := '0';
  Close;
 // btn_sairClick(nil);
end;

procedure Tfrm_abre_proc.msk_nr_processoChange(Sender: TObject);
begin
  btn_manut_proc.Enabled := Trim(msk_nr_processo.Text) <> '';
  mi_manut_proc.Enabled := Trim(msk_nr_processo.Text) <> '';
  btn_proc_realiza.Enabled := Trim(msk_nr_processo.Text) <> '';
  mi_proc_realiza.Enabled := Trim(msk_nr_processo.Text) <> '';
  btn_instr_embarque.Enabled := Trim(msk_nr_processo.Text) <> '';
  mi_instr_embarque.Enabled := Trim(msk_nr_processo.Text) <> '';
  mi_pedido.Enabled := Trim(msk_nr_processo.Text) <> '';
  btn_pedido.Enabled := Trim(msk_nr_processo.Text) <> '';
end;

procedure Tfrm_abre_proc.FormShow(Sender: TObject);
var i : integer;
begin
  for i := pgcDadosFatores.PageCount -1 downto 0 do
  begin
    if pgcDadosFatores.pages[i].Name = 'tsBid' then
    begin
      pgcDadosFatores.pages[i].TabVisible := false;
      break;
    end;
  end;

  pgcDadosFatores.ActivePage := tsDados;

  btn_manut_proc.Visible := frm_main.mi_manutencao_processo.Visible and not datm_abre_proc.Simulacao;
  mi_manut_proc.Visible := frm_main.mi_manutencao_processo.Visible and not datm_abre_proc.Simulacao;
  btn_proc_realiza.Visible := frm_main.mi_realizacao_processo.Visible and not datm_abre_proc.Simulacao;
  mi_proc_realiza.Visible := frm_main.mi_realizacao_processo.Visible and not datm_abre_proc.Simulacao;

 // if mi_manut_proc.Visible   then mi_manut_proc.ShortCut := TextToShortCut('F2');
 // if mi_proc_realiza.Visible then mi_proc_realiza.ShortCut := TextToShortCut('Ctrl+F2');
  grdRef.ColWidths[0] := 10;
  grdRef.ColWidths[1] := 120;
  grdRef.ColWidths[2] := 40;

  grdRefFIImp.ColWidths[0] := 10;
  grdRefFIImp.ColWidths[1] := 120;
  grdRefFIImp.ColWidths[2] := 40;

//  grdFat.ColWidths[0]    := 10;
  grdLI.ColWidths[0] := 10;

  with datm_abre_proc do
  begin
    qry_cliente_habilitacao_.Close;
    qry_cliente_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_cliente_habilitacao_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    qry_cliente_habilitacao_.ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    qry_cliente_habilitacao_.Open;
  end;

//  if not in_comercial then
//  begin
     // rdgroup_tp_comerc_imp.Columns:=3;  //modulo de abertura de processo operacinal pelo comercial
    //rdgroup_tp_comerc_imp.Items.Add('No Routing Order');
//  end;
//  if in_abre_proc_exp = '0' then
//  begin
     //rdgroup_tp_comercial.Columns:=3;
//    rdgroup_tp_comercial.Items.Add('No Routing Order');
//  end;
end;

procedure Tfrm_abre_proc.msk_nr_processo_fonteExit(Sender: TObject);
begin
  with datm_abre_proc do
  begin
    qry_proc_aux_.Close;
    qry_proc_aux_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo_fonte.Text;
    qry_proc_aux_.Prepare;
    qry_proc_aux_.Open;
    if not qry_proc_aux_.EOF then
    begin
      msk_cd_cliente.Text := qry_proc_aux_CD_CLIENTE.AsString;
      msk_cd_clienteExit(nil);
      msk_cd_servico.Text := qry_proc_aux_CD_SERVICO.AsString;
      msk_cd_servicoExit(nil);
      msk_nr_conhecimento.Text := '';
      msk_nr_conhecimento_master.Text := '';
      LimpaGrids;
    end
    else BoxMensagem('Processo não existe!', 2);
    qry_proc_aux_.Close;
  end;
end;

procedure Tfrm_abre_proc.grdRefKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 40) and (grdRef.Row = (grdRef.RowCount - 1)) and
    (grdRef.Cells[1, grdRef.Row] <> '') then
  begin
//    VerificaGestao(grdRef);
    grdRef.RowCount := grdRef.RowCount + 1;
  end;
  if (Key = 38) and (grdRef.Row = (grdRef.RowCount - 1)) and (grdRef.Cells[1, grdRef.Row] = '') then
  begin
    if grdRef.RowCount <> 1 then
        grdRef.RowCount := grdRef.RowCount - 1;
    grdRef.Row := (grdRef.RowCount - 1);
  end;
  Application.ProcessMessages;
end;

procedure Tfrm_abre_proc.grdRefSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
begin
  if Length(grdRef.Cells[ACol, ARow]) > 16 then
    grdRef.Cells[ACol, ARow] := Copy(grdRef.Cells[ACol, ARow], 1, 15);
end;

procedure Tfrm_abre_proc.grdLIKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 40) and (grdLI.Row = (grdLI.RowCount - 1)) and
    (grdLI.Cells[grdLI.Col, grdLI.Row] <> '') then
  begin
    grdLI.RowCount := grdLI.RowCount + 1;
  end;
  if (Key = 38) and (grdLI.Row = (grdLI.RowCount - 1)) and
    (grdLI.Cells[grdLI.Col, grdLI.Row] = '') then
  begin
    if grdLI.RowCount <> 1 then
      grdLI.RowCount := grdLI.RowCount - 1;
    grdLI.Row := (grdLI.RowCount - 1);
  end;
  Application.ProcessMessages;
end;

procedure Tfrm_abre_proc.grdLISetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
begin
  if Length(grdLI.Cells[ACol, ARow]) > 10 then
  begin
    grdLI.Cells[ACol, ARow] := Copy(grdLI.Cells[ACol, ARow], 1, 10);
  end;
end;

procedure Tfrm_abre_proc.grdFatKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
(*  if ( Key = 40 ) and ( grdFat.Row = ( grdFat.RowCount - 1 ) ) and
     ( grdFat.Cells[grdFat.Col, grdFat.Row] <> '' ) then
  begin
    grdFat.RowCount := grdFat.RowCount + 1;
  end;
  if ( Key = 38 ) and ( grdFat.Row = ( grdFat.RowCount - 1 ) ) and
     ( grdFat.Cells[grdFat.Col, grdFat.Row] = '' ) then
  begin
    if grdFat.RowCount <> 1 then
       grdFat.RowCount := grdFat.RowCount - 1;
    grdFat.Row := ( grdFat.RowCount - 1 );
  end;
  Application.ProcessMessages; *)
end;

procedure Tfrm_abre_proc.grdFatSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
begin
 // if Length( grdFat.Cells[ACol, ARow] ) > 25 then
 // begin
  //  grdFat.Cells[ACol, ARow] := Copy( grdFat.Cells[ACol, ARow], 1, 25 );
  //end;
end;

procedure Tfrm_abre_proc.LimpaGrids;
var
  i: Byte;
begin
  for i := 0 to (grdLI.RowCount - 1) do
  begin
    grdLI.Row := i;
    grdli.Cells[grdli.Col, grdli.Row] := '';
  end;
  grdLI.RowCount := 1;

 // for i := 0 to ( grdFat.RowCount - 1 ) do
//  begin
 //   grdFat.Row := i;
  //  grdFat.Cells[grdFat.Col, grdFat.Row] := '';
 // end;
//  grdFat.RowCount := 1;

  for i := 0 to (grdRef.RowCount - 1) do
  begin
    grdRef.Row := i;
    grdRef.Cells[1, grdRef.Row] := '';
    grdRef.Cells[2, grdRef.Row] := '';
  end;
  grdRef.RowCount := 1;

  for i := 0 to (grdRefFIImp.RowCount - 1) do
  begin
    grdRefFIImp.Row := i;
    grdRefFIImp.Cells[1, grdRefFIImp.Row] := '';
    grdRefFIImp.Cells[2, grdRefFIImp.Row] := '';
  end;
  grdRefFIImp.RowCount := 1;

end;

procedure Tfrm_abre_proc.msk_cd_areaExit(Sender: TObject);
begin
  with datm_abre_proc do
  begin
    if msk_cd_area.Text <> '' then
    begin
      ValCodEdt(msk_cd_area);
      qry_area_.Close;
      qry_area_.ParamByName('CD_AREA').AsString := msk_cd_area.Text;
      qry_area_.Prepare;
      qry_area_.Open;

      if not qry_area_.EOF then
        edt_nm_area.Text := qry_area_NM_AREA.AsString
      else
      begin
        BoxMensagem('Essa Área não está cadastrada!', 2);
        edt_nm_area.Text := '';
        if msk_cd_area.Enabled then
        begin
          pgcDadosFatores.ActivePage := tsDados;
          msk_cd_area.SetFocus;
        end;
      end;

      qry_area_.Close;
      qry_area_.UnPrepare;
    end
    else edt_nm_area.Text := '';
  end;
end;

procedure Tfrm_abre_proc.btn_co_areaClick(Sender: TObject);
begin
  with datm_abre_proc do
  begin
    Application.CreateForm(Tfrm_area, frm_area);
    with frm_area do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_area.Cons_OnLine_Texto <> '') then
    begin
      msk_cd_area.Text := frm_area.Cons_OnLine_Texto;
      msk_cd_areaExit(Sender);
    end;
  end;
end;

procedure Tfrm_abre_proc.btn_proc_realizaClick(Sender: TObject);
begin
 (* str_cd_modulo := '01';
  str_cd_rotina := '0110';

  if datm_abre_proc.qry_processo_IN_LIBERADO.AsString='0' then
    begin
     BoxMensagem('Este processo precisa ser liberado!',2);
     st_entrada:='';
     exit;
    end;
  if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
     st_entrada:='3';

  if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
      st_entrada:='4';


  nr_processo_gestao := msk_cd_unid_neg.text + msk_cd_produto.text + msk_nr_processo.text;
  close; *)

  vstr_cd_modulo := '01';
  str_cd_rotina := '0110';
  st_entrada := '1';
  nr_processo_gestao := msk_cd_unid_neg.text + msk_cd_produto.text + msk_nr_processo.text;
  close;
//  btn_sairClick(nil);
end;

procedure Tfrm_abre_proc.AbreTabelas;
begin
  with datm_abre_proc do
  begin
    // abre cliente x habilitação
    qry_cliente_habilitacao_.Close;
    qry_cliente_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_cliente_habilitacao_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    qry_cliente_habilitacao_.ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    qry_cliente_habilitacao_.Prepare;
    qry_cliente_habilitacao_.Open;

    // abre cliente x serviço 
    qry_cliente_servico_.Close;
    qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    qry_cliente_servico_.ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    if GetServicoNovo then
      qry_cliente_servico_.ParamByName('CD_SERVICO').AsInteger := StrToInt(Trim(msk_cd_servico.text))
    else
      qry_cliente_servico_.ParamByName('CD_SERVICO').AsString  := msk_cd_servico.Text;
    qry_cliente_servico_.Prepare;
    qry_cliente_servico_.Open;

  end;
end;

procedure Tfrm_abre_proc.FechaTabelas;
begin
  with datm_abre_proc do
  begin
    // fecha cliente x habilitação 
    qry_cliente_habilitacao_.Close;
    qry_cliente_habilitacao_.UnPrepare;

    // fecha cliente x serviço 
    qry_cliente_servico_.Close;
    qry_cliente_servico_.UnPrepare;
  end;
end;


procedure Tfrm_abre_proc.btn_prepararClick(Sender: TObject);
begin
  vstr_cd_modulo := '18';
  str_cd_rotina := '1802';

  btn_sairClick(nil);
end;

procedure Tfrm_abre_proc.msk_cd_unid_negExit(Sender: TObject);
begin
  //ValCodEdt(msk_cd_unid_neg); // Comentado porque foi incluido no KeyPress - Michel - 04/03/2010
  // Novas validações - Michel - 04/03/2010
  if edt_nm_unid_neg.Text = '' then
  begin
    if Sender <> nil then
      MessageDlg('É necessário digitar uma Unidade de Negócio válida.', mtInformation, [mbOk], 0);
    if msk_cd_unid_neg.Enabled then
      msk_cd_unid_neg.SetFocus;
  end
  else
  begin
    if Length(msk_cd_unid_neg.Text) = 1 then
      msk_cd_unid_neg.Text := '0' + msk_cd_unid_neg.Text;
    if ConsultaLookUPSQL(' SELECT CD_UNID_NEG' +
                         ' FROM TUNID_NEG ' +
                         ' WHERE CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG ' +
                         '                       FROM TUSUARIO_HABILITACAO ' +
                         '                       WHERE CD_USUARIO  = ' + QuotedStr(str_cd_usuario) +
                         '                         AND IN_ATIVO    = ''1''' +
                         '                         AND CD_UNID_NEG = ' + QuotedStr(msk_cd_unid_neg.Text) + ') ' +
                         '   AND IN_ATIVO = ''1''', 'CD_UNID_NEG') <> msk_cd_unid_neg.Text then
    begin
      if Sender <> nil then
        MessageDlg('Unidade de Negócio inválida ou você não tem habilitação para esta Unidade de Negócio.', mtInformation, [mbOk], 0);
      if msk_cd_unid_neg.Enabled then
        msk_cd_unid_neg.SetFocus;
    end;
  end;
end;

procedure Tfrm_abre_proc.msk_cd_unid_negChange(Sender: TObject);
begin
  edt_nm_unid_neg.Text := ConsultaLookUp('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text, 'NM_UNID_NEG');
end;

procedure Tfrm_abre_proc.msk_cd_produtoChange(Sender: TObject);
begin
  edt_nm_produto.Text := ConsultaLookUp('TPRODUTO', 'CD_PRODUTO', msk_cd_produto.Text, 'NM_PRODUTO');
  datm_abre_proc.qry_produto_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive, loPartialKey]);

  {COMENTADO POR AGATHA NIGRO  130032018}
 // pnlRepresentante.Visible := msk_cd_produto.Text = '01';
 // pnlLocalDesembarque.Visible := pnlRepresentante.Visible;
end;

procedure Tfrm_abre_proc.msk_cd_clienteChange(Sender: TObject);
begin
  edt_nm_cliente.Text := ConsultaLookUp('TEMPRESA_NAC', 'CD_EMPRESA', msk_cd_cliente.Text, 'NM_EMPRESA');
  if Trim(edt_nm_cliente.Text) <> '' then
    SetServicoNovo(msk_cd_cliente.Text, msk_cd_produto.Text, datm_abre_proc);
end;

procedure Tfrm_abre_proc.habilita_campos(Hab: Boolean);
begin
// se a proposta for inserida então os campos abaixos ficam desabilitados
// quando se passo o valor false é pq o processo é um agenciamento

  msk_cd_unid_neg.Enabled    := Hab;
  btn_co_unid_neg.Visible    := Hab;
  msk_cd_produto.Enabled     := Hab;
  btn_co_produto.Visible     := Hab;
  msk_cd_cliente.Enabled     := Hab;
  btn_co_cliente.Visible     := Hab;
  msk_cd_servico.Enabled     := Hab;
  btn_co_servico.Visible     := Hab;
  msk_cd_area.Visible        := Hab;
  edt_nm_area.Visible        := Hab;
  btn_co_area.Visible        := Hab;
  lbl_area.Visible           := Hab;

  Self.Update;

  msk_cd_agente.Enabled      := Hab;
  btn_co_agente.Visible      := Hab;
  msk_cd_destino.Enabled     := Hab;
  msk_cd_origem.Enabled      := Hab;
  btn_co_origem.Enabled      := Hab;
  btn_co_destino.Enabled     := Hab;
  btn_co_armador.Enabled     := Hab;
  btn_co_cia.Enabled         := Hab;
  msk_cd_armador.Enabled     := Hab;
  msk_cd_cia.Enabled         := Hab;
  msk_cd_ag_exp.Enabled      := Hab;
  msk_cd_destino_exp.Enabled := Hab;
  msk_cd_origem_exp.Enabled  := Hab;
  msk_cd_arm_exp.Enabled     := Hab;
  msk_cd_cia_exp.Enabled     := Hab;
  msk_prop_exp.Enabled       := Hab;

  btn_co_origem_exp.Visible  := Hab;
  btn_co_destino_exp.Visible := Hab;
  btn_co_cia_exp.Visible     := Hab;
  btn_co_arm_exp.Visible     := Hab;
  btn_co_ag_exp.Visible      := Hab;

  btn_co_unid_neg.Enabled    := Hab;
  btn_co_produto.Enabled     := Hab;
  btn_co_cliente.Enabled     := Hab;
  btn_co_servico.Enabled     := Hab;
  btn_co_area.Enabled        := Hab;
  btn_co_agente.enabled      := Hab;
  btn_co_origem.Enabled      := Hab;
  btn_co_destino.Enabled     := Hab;
  btn_co_origem_exp.Enabled  := Hab;
  btn_co_destino_exp.Enabled := Hab;
  btn_co_cia_exp.Enabled     := Hab;
  btn_co_arm_exp.Enabled     := Hab;
  btn_co_ag_exp.Enabled      := Hab;
end;

procedure Tfrm_abre_proc.btn_co_propostaClick(Sender: TObject);
var
  transp : String;
begin  //Proposta Importação - Finalmente
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then Exit;
  if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
    transp := ' AND (TPF.CD_CIA_TRANSP = ' + quotedstr(msk_cd_cia.text) + ')';
  if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
    transp := ' AND (TPF.CD_ARMADOR = ' + quotedstr(msk_cd_armador.text) + ')';
  transp := transp + 'AND (TPF.CD_AGENTE = ' + quotedstr(msk_cd_agente.text) + ')';
  datm_abre_proc.qry_processo_NR_PROPOSTA.AsString := ConsultaOnLineExSQL('SELECT DISTINCT TP.NR_PROPOSTA PROPOSTA FROM TPROPOSTA TP, TPROPOSTA_ITEM TPI, TPROPOSTA_FRETE TPF ' +
    ' WHERE (TP.NR_PROPOSTA = TPI.NR_PROPOSTA) AND (TP.DT_VALIDADE >= CONVERT(DATETIME,'+datetostr(dt_server)+',103)) AND (TPI.NR_PROPOSTA = TPF.NR_PROPOSTA AND TPI.CD_SERVICO = TPF.CD_SERVICO) AND (TP.CD_EMPRESA = '+quotedstr(msk_cd_cliente.text)+') AND (TPI.CD_SERVICO = ' + quotedstr(msk_cd_servico.text) + ') AND (TPI.CD_PRODUTO=' + quotedstr(msk_cd_produto.text) + ')' +
      ' AND (TPI.CD_UNID_NEG = ' + quotedstr(msk_cd_unid_neg.text) + ') AND (TPF.CD_ORIGEM = '+quotedstr(msk_cd_origem.text) + ') AND TP.CD_STATUS IN ("0", "1") AND (TPF.CD_DESTINO = ' + quotedstr(msk_cd_destino.text) + ') '+transp,'Propostas/Cotação',['TP.NR_PROPOSTA'], ['Proposta'],'PROPOSTA',nil);

  msk_proposta.Text := datm_abre_proc.qry_processo_NR_PROPOSTA.AsString;
  msk_propostaExit(Sender);
end;

procedure Tfrm_abre_proc.msk_propostaExit(Sender: TObject);
var transp: string;
begin
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then
    exit;
  if msk_proposta.text <> '' then
  begin
    with datm_abre_proc do
    begin
      datm_abre_proc.qry_cotacao_.Close;
      datm_abre_proc.qry_cotacao_.SQL.Clear;
      datm_abre_proc.qry_cotacao_.Params.Clear;
      datm_abre_proc.qry_cotacao_.SQL.Text := 'SELECT TP.NR_PROPOSTA, TPF.CD_MOEDA, TP.TP_PROPOSTA, TPI.VL_FRETE_VENDA, TPI.VL_FRETE_CUSTO, TPI.OTHER_VENDA,' + #13 +
                                              '       TPI.CD_INCOTERM,TPF.CD_TAB_FRETE,TPF.CD_TAB_FRETE_COMPRA, TP.PESO_TAXADO, TPI.VL_VENDA, TPI.VL_CUSTO, TPI.OTHER_CUSTO,' + #13 +
                                              '       TPI.VL_CHARGEABLE, TPI.VL_PESO_TON, TPI.VL_PESO_KG, TPI.TP_ESTUFAGEM, TPI.QTDE_VOL , TPI.VL_CUBAGEM,TPI.VL_CUSTO' + #13 +
                                              '  FROM TPROPOSTA TP, TPROPOSTA_ITEM TPI, TPROPOSTA_FRETE TPF' + #13 +
                                              ' WHERE (TP.NR_PROPOSTA = TPI.NR_PROPOSTA)' + #13 +
                                              '   AND (TP.DT_VALIDADE >= CONVERT(DATETIME,'+datetostr(dt_server)+',103))' + #13 +
                                              '   AND (TPI.NR_PROPOSTA = TPF.NR_PROPOSTA)' + #13 +
                                              '   AND (TP.CD_EMPRESA  = ''' + msk_cd_cliente.Text  + ''')' + #13 +
                                              '   AND (TP.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''')' + #13 +
                                              '   AND (TP.NR_PROPOSTA = ''' + msk_proposta.Text    + ''')' + #13 +
                                              '   AND (TP.TP_PROPOSTA = ''1'')';

      datm_abre_proc.qry_cotacao_.Prepare;
      datm_abre_proc.qry_cotacao_.Open;
      if not datm_abre_proc.qry_cotacao_.IsEmpty then
      begin
        cotacao := true;
        msk_cd_origem.Text  := ConsultaLookupSQL('SELECT CD_ORIGEM FROM TPROPOSTA_FRETE WHERE NR_PROPOSTA = ''' + msk_proposta.Text + '''','CD_ORIGEM');
        msk_cd_destino.Text := ConsultaLookupSQL('SELECT CD_DESTINO FROM TPROPOSTA_FRETE WHERE NR_PROPOSTA = ''' + msk_proposta.Text + '''','CD_DESTINO');
        msk_cd_armador.Text := ConsultaLookupSQL('SELECT CD_ARMADOR FROM TPROPOSTA_FRETE WHERE NR_PROPOSTA = ''' + msk_proposta.Text + '''','CD_ARMADOR');
        msk_cd_agente.Text  := ConsultaLookupSQL('SELECT CD_AGENTE FROM TPROPOSTA_FRETE WHERE NR_PROPOSTA = ''' + msk_proposta.Text + '''','CD_AGENTE');
        msk_cd_origemExit(nil);
        msk_cd_destinoExit(nil);
        msk_cd_armadorExit(nil);
        msk_cd_agenteExit(nil);
        datm_abre_proc.qry_processo_CD_INCOTERM.AsString    := datm_abre_proc.qry_cotacao_CD_INCOTERM.AsString;
        qry_processo_CD_TAB_FRETE_VENDA.AsString            := qry_cotacao_CD_TAB_FRETE.AsString;
        datm_abre_proc.qry_processo_CD_MOEDA_FRETE.AsString := datm_abre_proc.qry_cotacao_CD_MOEDA.AsString;
        datm_abre_proc.qry_processo_IN_ROUTING.aSsTRING     := '1';
        datm_abre_proc.qry_processo_VL_OTHER_CHARGE.AsFloat := datm_abre_proc.qry_cotacao_OTHER_VENDA.AsFloat;
        datm_abre_proc.qry_processo_CHARGEABLE.AsFloat      := datm_abre_proc.qry_cotacao_VL_CHARGEABLE.AsFloat;
        datm_abre_proc.qry_processo_VL_TARIFA_FRETE.AsFloat := datm_abre_proc.qry_cotacao_VL_VENDA.Asfloat;
        datm_abre_proc.qry_processo_VL_FRETE.AsFloat        := datm_abre_proc.qry_cotacao_VL_FRETE_VENDA.AsFloat;
        datm_abre_proc.qry_processo_VL_HOUSE.AsFloat        := datm_abre_proc.qry_cotacao_VL_FRETE_VENDA.AsFloat + datm_abre_proc.qry_cotacao_OTHER_VENDA.AsFloat;
        datm_abre_proc.qry_processo_QTD_VOLUME.AsFloat      := datm_abre_proc.qry_cotacao_QTDE_VOL.AsFloat;
        datm_abre_proc.qry_processo_TP_ESTUFAGEM.AsString   := datm_abre_proc.qry_cotacao_TP_ESTUFAGEM.AsString;
        datm_abre_proc.qry_processo_QTD_VOLUME.AsFloat      := datm_abre_proc.qry_cotacao_QTDE_VOL.AsFloat;
        datm_abre_proc.qry_processo_CHARGEABLE.AsFloat      := datm_abre_proc.qry_cotacao_VL_CHARGEABLE.AsFloat;
        datm_abre_proc.qry_processo_CUBAGEM.AsFloat         := datm_abre_proc.qry_cotacao_VL_CUBAGEM.AsFloat;
        datm_abre_proc.qry_processo_VL_RATEIO.AsFloat       := datm_abre_proc.qry_cotacao_VL_CUSTO.AsFloat;
        if datm_abre_proc.qry_cotacao_TP_ESTUFAGEM.ASString  = '1' then
          cbbEstufagem2.ItemIndex := cbbEstufagem2.Items.IndexOf('FCL')
        else if datm_abre_proc.qry_cotacao_TP_ESTUFAGEM.ASString  = '0' then
          cbbEstufagem2.ItemIndex := cbbEstufagem2.Items.IndexOf('LCL')
        else if datm_abre_proc.qry_cotacao_TP_ESTUFAGEM.ASString  = '2' then
          cbbEstufagem2.ItemIndex := cbbEstufagem2.Items.IndexOf('Carga Solta');

        if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
          datm_abre_proc.qry_processo_VL_PESO_BRUTO.AsFloat := datm_abre_proc.qry_cotacao_VL_PESO_KG.Asfloat
        else datm_abre_proc.qry_processo_VL_PESO_BRUTO.AsFloat := datm_abre_proc.qry_cotacao_VL_PESO_TON.Asfloat;
        if (datm_abre_proc.qry_cotacao_CD_INCOTERM.AsString = 'CIP') or (datm_abre_proc.qry_cotacao_CD_INCOTERM.AsString = 'CIF') or
           (datm_abre_proc.qry_cotacao_CD_INCOTERM.AsString = 'CPT') or (datm_abre_proc.qry_cotacao_CD_INCOTERM.AsString = 'DDP') or
           (datm_abre_proc.qry_cotacao_CD_INCOTERM.AsString = 'DDU') or (datm_abre_proc.qry_cotacao_CD_INCOTERM.AsString = 'DEQ') or
           (datm_abre_proc.qry_cotacao_CD_INCOTERM.AsString = 'DES') or (datm_abre_proc.qry_cotacao_CD_INCOTERM.AsString = 'CFR') then //prepaid
          datm_abre_proc.qry_processo_TP_FRETE.AsString := '1'
        else datm_abre_proc.qry_processo_TP_FRETE.AsString := '0';
        habilita_campos(false);
      end
      else
      begin
        BoxMensagem('Cotação inválida ou não aprovada!', 2);
        qry_processo_CD_INCOTERM.AsString := '';
        qry_processo_CD_TAB_FRETE_VENDA.AsString := '';
        qry_processo_CD_TAB_FRETE_COMPRA.AsString := '';
        qry_processo_CD_MOEDA_FRETE.AsString := '';
        qry_processo_TP_CARGA.AsString := '';
        qry_processo_IN_ROUTING.aSsTRING := '';
//         msk_prop_exp.SetFocus;
        habilita_campos(true);
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_abre_proc.btn_co_origemClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
  str_cd_rotina := '2267';

  Application.CreateForm(TFrm_portos, Frm_portos);
  with Frm_portos do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
      in_porto := false;
    if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
      in_porto := true;
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_origem.Text := Frm_portos.Cons_OnLine_Texto;
  vstr_cd_modulo := '01';
  str_cd_rotina := '0102';

  msk_cd_origemExit(nil);
end;

procedure Tfrm_abre_proc.btn_co_agenteClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
  str_cd_rotina := '2229';

  Application.CreateForm(Tfrm_ag, frm_ag);
  with frm_ag do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    tp_ag := true;
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_agente.Text := frm_ag.Cons_OnLine_Texto;
  vstr_cd_modulo := '01';
  str_cd_rotina := '0102';

  msk_cd_agenteExit(nil);
end;

procedure Tfrm_abre_proc.msk_cd_agenteExit(Sender: TObject);
begin
  if msk_cd_agente.text <> '' then
  begin
    ValCodEdt(msk_cd_agente);
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT NM_AGENTE FROM TAGENTE WHERE TP_AG = "1" AND  CD_AGENTE = "' + msk_cd_agente.text + '"');
      Open;
      if (recordCount > 0) then
      begin
        if (msk_cd_agente.text = '0000') then
        begin
          BoxMensagem('Este Agente é exclusivo para Processo Direto!', 2);
          edt_nm_agente.text := '';
          msk_cd_agente.text := '';
          exit;
        end;
        edt_nm_agente.text := fields[0].AsString;
      end
      else
      begin
        BoxMensagem('Código do Agente inválido!', 2);
        edt_nm_agente.text := '';
        msk_cd_agente.text := '';
      end;
    end;
  end else edt_nm_agente.text := '';
end;

procedure Tfrm_abre_proc.btn_co_destinoClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
  str_cd_rotina := '2267';

  Application.CreateForm(TFrm_portos, Frm_portos);
  with Frm_portos do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
      in_porto := false;
    if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
      in_porto := true;
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_destino.Text := Frm_portos.Cons_OnLine_Texto;
  vstr_cd_modulo := '01';
  str_cd_rotina := '0102';

  msk_cd_destinoExit(nil);
end;

procedure Tfrm_abre_proc.msk_cd_origemExit(Sender: TObject);
begin
  if msk_cd_origem.text <> '' then
  begin
    ValCodEdt(msk_cd_origem);
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "' + msk_cd_origem.text + '"');
      if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
        Sql.Add(' AND TP_PORTO = "0"');
      if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
        Sql.Add(' AND TP_PORTO = "1"');
      Open;
      if recordCount > 0 then
        edt_nm_origem.text := fields[0].AsString
      else
      begin
        BoxMensagem('Código do Porto inválido!', 2);
        msk_cd_origem.text := '';
        edt_nm_origem.text := '';
      end;
    end;
  end else edt_nm_origem.text := '';
end;

procedure Tfrm_abre_proc.msk_cd_destinoExit(Sender: TObject);
begin
  if msk_cd_destino.text <> '' then
  begin
    ValCodEdt(msk_cd_destino);
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "' + msk_cd_destino.text + '"');
      if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
        Sql.Add(' AND TP_PORTO = "0"');
      if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
        Sql.Add(' AND TP_PORTO = "1"');
      Open;
      if recordCount > 0 then
        edt_nm_destino.text := fields[0].AsString
      else
      begin
        BoxMensagem('Código do Porto inválido!', 2);
        msk_cd_destino.text := '';
        edt_nm_destino.text := '';
      end;
    end;
  end else edt_nm_destino.text := '';

end;

procedure Tfrm_abre_proc.msk_cd_armadorExit(Sender: TObject);
begin
  if msk_cd_armador.text <> '' then
  begin
    ValCodEdt(msk_cd_armador);
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE TP_TRANSPORTADOR = "1" AND CODIGO = "' + msk_cd_armador.text + '"');
      Open;
      if recordCount > 0 then
        edt_nm_armador.text := fields[0].AsString
      else
      begin
        BoxMensagem('Código do Armador inválido!', 2);
        msk_cd_armador.text := '';
        edt_nm_armador.text := '';
      end;
    end;
  end else edt_nm_armador.text := '';
end;

procedure Tfrm_abre_proc.msk_cd_ciaExit(Sender: TObject);
begin
  if msk_cd_cia.text <> '' then
  begin
    ValCodEdt(msk_cd_cia);
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE  TP_TRANSPORTADOR = "0" AND CODIGO = "' + msk_cd_cia.text + '"');
      Open;
      if recordCount > 0 then
        edt_nm_cia.text := fields[0].AsString
      else
      begin
        BoxMensagem('Código do Companhia inválido!', 2);
        msk_cd_cia.text := '';
        edt_nm_cia.text := '';
      end;
    end;
  end else edt_nm_cia.text := '';
end;

procedure Tfrm_abre_proc.btn_co_armadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_abre_proc.qry_processo_) then exit;
    If (Sender as TSpeedButton).Enabled Then
    begin
      datm_abre_proc.qry_processo_CD_ARMADOR.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Armador',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl);
      msk_cd_armador.Text := datm_abre_proc.qry_processo_CD_ARMADOR.AsString;
    end;
  end
  else
    edt_nm_armador.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',msk_cd_armador.Text,'DESCRICAO');
(*  vstr_cd_modulo := '22';
  str_cd_rotina := '2270';

  Application.CreateForm(Tfrm_transportador_itl, frm_transportador_itl);
  with frm_transportador_itl do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    dbgoup_tp_transp.Enabled := false;
    in_maritima := true;
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_armador.Text := frm_transportador_itl.Cons_OnLine_Texto;
  vstr_cd_modulo := '01';
  str_cd_rotina := '0102'; *)
  msk_cd_armadorExit(nil);
end;

procedure Tfrm_abre_proc.btn_co_ciaClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
  str_cd_rotina := '2207';

  Application.CreateForm(Tfrm_transportador_itl, frm_transportador_itl);
  with frm_transportador_itl do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    dbgoup_tp_transp.Enabled := false;
    in_aerea := true;
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_cia.Text := frm_transportador_itl.Cons_OnLine_Texto;
  vstr_cd_modulo  := '01';
  str_cd_rotina := '0102';

  msk_cd_ciaExit(nil);
end;

procedure Tfrm_abre_proc.btn_instr_embarqueClick(Sender: TObject);
begin
  vstr_cd_modulo := '30';
  str_cd_rotina := '3001';
  if datm_abre_proc.qry_processo_IN_LIBERADO.AsString = '0' then
  begin
    BoxMensagem('Este processo precisa ser liberado!', 2);
    st_entrada := '';
    exit;
  end;
  if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
    st_entrada := '3';

  if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
    st_entrada := '4';
  nr_processo_gestao := msk_cd_unid_neg.text + msk_cd_produto.text + msk_nr_processo.text;
  close;
end;

procedure Tfrm_abre_proc.visualiza_paineis(tp_servico, tp_produto: string);
begin
  if tp_produto = '01' then //importacao
  begin
    if tp_servico = '1' then //agenciamento
    begin
      pnl_desembaraco.SendToBack;
      pnl_imp.BringToFront;
      pnl_exp.SendToBack;
      pnl_imp.Visible := true;
      btn_instr_embarque.Visible := true and not datm_abre_proc.Simulacao;
      btn_proc_realiza.Visible := false and not datm_abre_proc.Simulacao;
      btn_manut_proc.Visible := false and not datm_abre_proc.Simulacao;
      btn_pedido.Visible := false and not datm_abre_proc.Simulacao;
      mi_pedido.Visible := false and not datm_abre_proc.Simulacao;
      mi_manut_proc.Visible := false and not datm_abre_proc.Simulacao;
      mi_proc_realiza.Visible := false and not datm_abre_proc.Simulacao;
      mi_instr_embarque.Visible := true and not datm_abre_proc.Simulacao;
    end else //if tp_servico = '0' then //desembaraco
    begin
      pnl_desembaraco.BringToFront;
      pnl_imp.SendToBack;
      pnl_exp.SendToBack;
      pnl_desembaraco.Visible := true;
      btn_instr_embarque.Visible := false and not datm_abre_proc.Simulacao;
      btn_proc_realiza.Visible := true and not datm_abre_proc.Simulacao;
      btn_manut_proc.Visible := true and not datm_abre_proc.Simulacao;
      btn_pedido.Visible := false and not datm_abre_proc.Simulacao;
      mi_pedido.Visible := false and not datm_abre_proc.Simulacao;
      mi_manut_proc.Visible := true and not datm_abre_proc.Simulacao;
      mi_proc_realiza.Visible := true and not datm_abre_proc.Simulacao;
      mi_instr_embarque.Visible := false and not datm_abre_proc.Simulacao;
      { by carlos em 11/06/2010 } 
      if msk_cd_area.Enabled=false then
         msk_cd_area.Enabled:=true;

      pgcDadosFatores.ActivePage := tsDados;
      msk_cd_area.SetFocus;
    end;
  end;

  if tp_produto = '02' then //exportacao
  begin
    if tp_servico = '1' then //agenciamento
    begin
      pnl_desembaraco.SendToBack;
      pnl_imp.SendToBack;
      pnl_exp.BringToFront;
      pnl_exp.Visible := true;
      btn_instr_embarque.Visible := false and not datm_abre_proc.Simulacao;
      btn_proc_realiza.Visible := false and not datm_abre_proc.Simulacao;
      btn_manut_proc.Visible := false and not datm_abre_proc.Simulacao;
      btn_pedido.Visible := true and not datm_abre_proc.Simulacao;
      mi_pedido.Visible := true and not datm_abre_proc.Simulacao;
      mi_manut_proc.Visible := false and not datm_abre_proc.Simulacao;
      mi_proc_realiza.Visible := false and not datm_abre_proc.Simulacao;
      mi_instr_embarque.Visible := False and not datm_abre_proc.Simulacao;
    end else //if tp_servico = '0' then //desembaraco
    begin
      pnl_desembaraco.BringToFront;
      pnl_imp.SendToBack;
      pnl_exp.SendToBack;
      pnl_desembaraco.Visible := true;
      btn_instr_embarque.Visible := false and not datm_abre_proc.Simulacao;
      btn_proc_realiza.Visible := true and not datm_abre_proc.Simulacao;
      btn_manut_proc.Visible := true and not datm_abre_proc.Simulacao;
      btn_pedido.Visible := false and not datm_abre_proc.Simulacao;
      mi_pedido.Visible := false and not datm_abre_proc.Simulacao;
      mi_manut_proc.Visible := true and not datm_abre_proc.Simulacao;
      mi_proc_realiza.Visible := true and not datm_abre_proc.Simulacao;
      mi_instr_embarque.Visible := false and not datm_abre_proc.Simulacao;
    end;
  end;

  if tp_produto = '03' then //ambos
  begin
    if tp_servico <> '1' then //desembaraco
    begin
      pnl_desembaraco.BringToFront;
      pnl_imp.SendToBack;
      pnl_exp.SendToBack;
      pnl_desembaraco.Visible := true;
    end;
  end;
end;

procedure Tfrm_abre_proc.dgrp_tp_processoClick(Sender: TObject);
begin
  if dgrp_tp_processo.ItemIndex = 0 then
  begin
    msk_cd_ag_exp.Text := '0000';
    edt_nm_ag_exp.text := 'AGENTE DIRETO';
    msk_cd_ag_exp.Visible := false;
    edt_nm_ag_exp.Visible := false;
    btn_co_ag_exp.Visible := false;
    lb_ag_exp.Visible := false;
  end
  else
  begin
    msk_cd_ag_exp.Text := ' ';
    edt_nm_ag_exp.text := ' ';
    msk_cd_ag_exp.Visible := true;
    edt_nm_ag_exp.Visible := true;
    btn_co_ag_exp.Visible := true;
    lb_ag_exp.Visible := true;
  end;

end;

procedure Tfrm_abre_proc.btn_co_ag_expClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
  str_cd_rotina := '2229';

  Application.CreateForm(Tfrm_ag, frm_ag);
  with frm_ag do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    tp_ag := true;
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_ag_exp.Text := frm_ag.Cons_OnLine_Texto;
  vstr_cd_modulo := '01';
  str_cd_rotina := '0102';

  msk_cd_ag_expExit(nil);

end;

procedure Tfrm_abre_proc.btn_co_destino_expClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
  str_cd_rotina := '2267';

  Application.CreateForm(TFrm_portos, Frm_portos);
  with Frm_portos do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
      in_porto := false;
    if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
      in_porto := true;
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_destino_exp.Text := Frm_portos.Cons_OnLine_Texto;
  vstr_cd_modulo := '01';
  str_cd_rotina := '0102';

  msk_cd_destino_expExit(nil);

end;

procedure Tfrm_abre_proc.btn_co_origem_expClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
  str_cd_rotina := '2267';

  Application.CreateForm(TFrm_portos, Frm_portos);
  with Frm_portos do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
      in_porto := false;
    if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
      in_porto := true;
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_origem_exp.Text := Frm_portos.Cons_OnLine_Texto;
  vstr_cd_modulo := '01';
  str_cd_rotina := '0102';

  msk_cd_origem_expExit(nil);

end;

procedure Tfrm_abre_proc.btn_co_arm_expClick(Sender: TObject);
begin
 if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_abre_proc.qry_processo_) then exit;
    If (Sender as TSpeedButton).Enabled Then
    begin
      datm_abre_proc.qry_processo_CD_ARMADOR.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Armador',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl);
      msk_cd_arm_exp.Text := datm_abre_proc.qry_processo_CD_ARMADOR.AsString;
    end;
  end
  else
    edt_nm_cia_exp.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',msk_cd_arm_exp.Text,'DESCRICAO');
  msk_cd_arm_expExit(nil);

(*  vstr_cd_modulo := '22';
  str_cd_rotina := '2270';
  Application.CreateForm(Tfrm_transportador_itl, frm_transportador_itl);
  with frm_transportador_itl do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    dbgoup_tp_transp.Enabled := false;
    in_maritima := true;
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_arm_exp.Text := frm_transportador_itl.Cons_OnLine_Texto;
  vstr_cd_modulo := '01';
  str_cd_rotina := '0102'; *)
end;

procedure Tfrm_abre_proc.btn_co_cia_expClick(Sender: TObject);
begin
 if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_abre_proc.qry_processo_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_abre_proc.qry_processo_CD_ARMADOR.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Armador',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl);
  end
  else
    edt_nm_cia_exp.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',msk_cd_arm_exp.Text,'DESCRICAO');
(*  vstr_cd_modulo := '22';
  str_cd_rotina := '2207';
  Application.CreateForm(Tfrm_transportador_itl, frm_transportador_itl);
  with frm_transportador_itl do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    dbgoup_tp_transp.Enabled := false;
    in_aerea := true;
    ShowModal;
    lCons_OnLine := False;
  end;
  msk_cd_cia_exp.Text := frm_transportador_itl.Cons_OnLine_Texto;
  vstr_cd_modulo := '01';
  str_cd_rotina := '0102'; *)

  msk_cd_cia_expExit(nil);
end;

procedure Tfrm_abre_proc.btn_prop_expClick(Sender: TObject);
var transp : string;
begin
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then
    Exit;
  if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
    transp := ' AND (TT.CD_CIA_TRANSP_TAB_FRETE = ' + quotedstr(msk_cd_cia_exp.text) + ')';
  if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
    transp := ' AND (TT.CD_ARMADOR = ' + quotedstr(msk_cd_arm_exp.text) + ')';

  if GetServicoNovo then
    datm_abre_proc.qry_processo_NR_PROPOSTA.AsString := ConsultaOnLineExSQL('SELECT DISTINCT TP.NR_PROPOSTA PROPOSTA' +
      ' FROM TPROPOSTA TP, TPROPOSTA_ITEM TPI, TPROPOSTA_FRETE  TPF,TTAB_FRETE TT ' +
      '  WHERE (TP.NR_PROPOSTA = TPI.NR_PROPOSTA) AND (TP.CD_STATUS= ''0'' AND TP.DT_VALIDADE >= CONVERT(DATETIME,' + datetostr(dt_server) + ',103)) AND ' +
      ' (TPI.NR_PROPOSTA = TPF.NR_PROPOSTA AND TPI.CD_SERVICO = TPF.CD_SERVICO) AND   ' +
      ' (TP.CD_EMPRESA = ' + quotedstr(msk_cd_cliente.text) + ') AND (TPI.CD_SERVICO = ' + quotedstr(IntToStr(StrToInt(Trim(msk_cd_servico.text)))) + ') AND (TPI.CD_PRODUTO=' + quotedstr(msk_cd_produto.text) + ')' +
      ' AND (TPI.CD_UNID_NEG = ' + quotedstr(msk_cd_unid_neg.text) + ') AND (TT.CD_TAB_FRETE = TPF.CD_TAB_FRETE)  ' + transp +
      ' AND (TPF.CD_ORIGEM = ' + quotedstr(msk_cd_origem_exp.text) + ') AND (TPF.CD_DESTINO = ' + quotedstr(msk_cd_destino_exp.text) + ') ' +
      ' AND (TT.CD_AGENTE_TAB_FRETE = ' + quotedstr(msk_cd_ag_exp.text) + ')',
      'Propostas',['TP.NR_PROPOSTA'],['Proposta'],'PROPOSTA',nil)
  else
    datm_abre_proc.qry_processo_NR_PROPOSTA.AsString := ConsultaOnLineExSQL('SELECT DISTINCT TP.NR_PROPOSTA PROPOSTA' +
      ' FROM TPROPOSTA TP, TPROPOSTA_ITEM TPI, TPROPOSTA_FRETE  TPF,TTAB_FRETE TT ' +
      '  WHERE (TP.NR_PROPOSTA = TPI.NR_PROPOSTA) AND (TP.CD_STATUS= ''0'' AND TP.DT_VALIDADE >= CONVERT(DATETIME,' + datetostr(dt_server) + ',103)) AND ' +
      ' (TPI.NR_PROPOSTA = TPF.NR_PROPOSTA AND TPI.CD_SERVICO = TPF.CD_SERVICO) AND   ' +
      ' (TP.CD_EMPRESA = ' + quotedstr(msk_cd_cliente.text) + ') AND (TPI.CD_SERVICO = ' + quotedstr(msk_cd_servico.text) + ') AND (TPI.CD_PRODUTO=' + quotedstr(msk_cd_produto.text) + ')' +
      ' AND (TPI.CD_UNID_NEG = ' + quotedstr(msk_cd_unid_neg.text) + ') AND (TT.CD_TAB_FRETE = TPF.CD_TAB_FRETE)  ' + transp +
      ' AND (TPF.CD_ORIGEM = ' + quotedstr(msk_cd_origem_exp.text) + ') AND (TPF.CD_DESTINO = ' + quotedstr(msk_cd_destino_exp.text) + ') ' +
      ' AND (TT.CD_AGENTE_TAB_FRETE = ' + quotedstr(msk_cd_ag_exp.text) + ')',
      'Propostas',['TP.NR_PROPOSTA'],['Proposta'],'PROPOSTA',nil);

  msk_prop_exp.Text := datm_abre_proc.qry_processo_NR_PROPOSTA.AsString;
  msk_prop_expExit(Sender);

end;

procedure Tfrm_abre_proc.msk_cd_origem_expExit(Sender: TObject);
begin
  if msk_cd_origem_exp.text <> '' then
  begin
    ValCodEdt(msk_cd_origem_exp);
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "' + msk_cd_origem_exp.text + '"');
      if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
        Sql.Add(' AND TP_PORTO = "0"');
      if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
        Sql.Add(' AND TP_PORTO = "1"');
      Open;
      if recordCount > 0 then
        edt_nm_origem_exp.text := fields[0].AsString
      else
      begin
        BoxMensagem('Código do Porto inválido!', 2);
        edt_nm_origem_exp.text := '';
        msk_cd_origem_exp.text := '';
      end;
    end;
  end
  else edt_nm_origem_exp.text := '';
end;

procedure Tfrm_abre_proc.msk_cd_destino_expExit(Sender: TObject);
begin
  if msk_cd_destino_exp.text <> '' then
  begin
    ValCodEdt(msk_cd_destino_exp);
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "' + msk_cd_destino_exp.text + '"');
      if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
        Sql.Add(' AND TP_PORTO = "0"');
      if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
        Sql.Add(' AND TP_PORTO = "1"');
      Open;
      if recordCount > 0 then
        edt_nm_destino_exp.text := fields[0].AsString
      else
      begin
        BoxMensagem('Código do Porto inválido!', 2);
        edt_nm_destino_exp.text := '';
        msk_cd_destino_exp.text := '';
      end;
    end;
  end
  else edt_nm_destino_exp.text := '';
end;

procedure Tfrm_abre_proc.msk_cd_arm_expExit(Sender: TObject);
begin
  if msk_cd_arm_exp.text <> '' then
  begin
    ValCodEdt(msk_cd_arm_exp);
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE TP_TRANSPORTADOR = "1" AND CODIGO = "' + msk_cd_arm_exp.text + '"');
      Open;
      if not IsEmpty then
        edt_nm_arm_exp.text := fields[0].AsString
      else
      begin
        BoxMensagem('Código do Armador inválido!', 2);
        edt_nm_arm_exp.text := '';
        msk_cd_arm_exp.text := '';
      end;
    end;
  end
  else edt_nm_arm_exp.text := '';

end;

procedure Tfrm_abre_proc.msk_cd_cia_expExit(Sender: TObject);
begin
  if msk_cd_cia_exp.text <> '' then
  begin
    ValCodEdt(msk_cd_cia_exp);
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE TP_TRANSPORTADOR = "0" AND CODIGO = "' + msk_cd_cia_exp.text + '"');
      Open;
      if recordCount > 0 then
        edt_nm_cia_exp.text := fields[0].AsString
      else
      begin
        BoxMensagem('Código do Companhia inválido!', 2);
        edt_nm_cia_exp.text := '';
        msk_cd_cia_exp.text := '';
      end;
    end;
  end
  else edt_nm_cia_exp.text := '';

end;

procedure Tfrm_abre_proc.msk_prop_expExit(Sender: TObject);
var transp: string;
begin

  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then exit;

  if msk_prop_exp.text <> '' then
  begin
    if rdgroup_tp_comercial.ItemIndex = 1 then
    begin
      with datm_abre_proc do
      begin
        if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
          transp := ' AND (TPF.CD_CIA_TRANSP = ' + quotedstr(msk_cd_cia_exp.text) + ')';
        if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
          transp := ' AND (TPF.CD_ARMADOR = ' + quotedstr(msk_cd_arm_exp.text) + ')';

        qry_cotacao_.Close;
        qry_cotacao_.ParamByName('DT_VENCTO').AsString := datetostr(dt_server);
        qry_cotacao_.ParamByName('NR_PROPOSTA').AsString := msk_prop_exp.TEXT;
        qry_cotacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.TEXT;
        qry_cotacao_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.TEXT;
        qry_cotacao_.ParamByName('CD_EMPRESA').AsString := msk_cd_cliente.TEXT;
        qry_cotacao_.ParamByName('CD_ORIGEM').AsString := msk_cd_origem_exp.TEXT;
        qry_cotacao_.ParamByName('CD_DESTINO').AsString := msk_cd_destino_exp.TEXT;
        if GetServicoNovo then
          qry_cotacao_.ParamByName('CD_SERVICO').AsInteger := StrToInt(Trim(msk_cd_servico.text))
        else
          qry_cotacao_.ParamByName('CD_SERVICO').AsString  := msk_cd_servico.TEXT;
        qry_cotacao_.ParamByName('CD_AGENTE').AsString := msk_cd_ag_exp.TEXT;
        qry_cotacao_.Sql[10] := transp;
        qry_cotacao_.Prepare;
        qry_cotacao_.Open;
        if qry_cotacao_.RecordCount > 0 then
        begin
          cotacao := true;
          qry_processo_CD_INCOTERM.AsString := qry_cotacao_CD_INCOTERM.AsString;
          qry_processo_CD_TAB_FRETE_VENDA.AsString := qry_cotacao_CD_TAB_FRETE.AsString;
          qry_processo_CD_MOEDA_FRETE.AsString := qry_cotacao_CD_MOEDA.AsString;
          qry_processo_IN_ROUTING.aSsTRING := '1';
          qry_processo_VL_OTHER_CHARGE.AsFloat := qry_cotacao_OTHER_VENDA.AsFloat;
          qry_processo_CHARGEABLE.AsFloat := qry_cotacao_VL_CHARGEABLE.AsFloat;
          qry_processo_VL_TARIFA_FRETE.AsFloat := qry_cotacao_VL_VENDA.Asfloat;
          qry_processo_VL_FRETE.AsFloat := qry_cotacao_VL_FRETE_VENDA.AsFloat;
          qry_processo_VL_HOUSE.AsFloat := qry_cotacao_VL_FRETE_VENDA.AsFloat + qry_cotacao_OTHER_VENDA.AsFloat;
          //qry_processo_TP_ESTUFAGEM.AsString := qry_cotacao_TP_ESTUFAGEM.AsString;

          if datm_abre_proc.qry_cotacao_TP_ESTUFAGEM.ASString  = '1' then
            cbbEstufagem3.ItemIndex := cbbEstufagem3.Items.IndexOf('FCL')
          else if datm_abre_proc.qry_cotacao_TP_ESTUFAGEM.ASString  = '0' then
            cbbEstufagem3.ItemIndex := cbbEstufagem3.Items.IndexOf('LCL')
          else if datm_abre_proc.qry_cotacao_TP_ESTUFAGEM.ASString  = '2' then
            cbbEstufagem3.ItemIndex := cbbEstufagem3.Items.IndexOf('Carga Solta');

          qry_processo_VL_RATEIO.AsFloat := qry_cotacao_VL_CUSTO.AsFloat;
          if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
            qry_processo_VL_PESO_BRUTO.AsFloat := qry_cotacao_VL_PESO_KG.AsFloat;
          if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
            qry_processo_VL_PESO_BRUTO.AsFloat := qry_cotacao_VL_PESO_TON.AsFloat;


          qry_processo_QTD_VOLUME.AsFloat := qry_cotacao_QTDE_VOL.AsFloat;
          qry_processo_CUBAGEM.AsFloat := qry_cotacao_VL_CUBAGEM.AsFloat;
          qry_processo_CHARGEABLE.AsFloat := qry_cotacao_VL_CHARGEABLE.AsFloat;

          if (qry_cotacao_CD_INCOTERM.AsString = 'CIP') or (qry_cotacao_CD_INCOTERM.AsString = 'CIF') or
            (qry_cotacao_CD_INCOTERM.AsString = 'CPT') or (qry_cotacao_CD_INCOTERM.AsString = 'DDP') or
            (qry_cotacao_CD_INCOTERM.AsString = 'DDU') or (qry_cotacao_CD_INCOTERM.AsString = 'DEQ') or
            (qry_cotacao_CD_INCOTERM.AsString = 'DES') or (qry_cotacao_CD_INCOTERM.AsString = 'CFR') then //prepaid
            qry_processo_TP_FRETE.AsString := '1'
          else qry_processo_TP_FRETE.AsString := '0';

          habilita_campos(false);
        end
        else
        begin
          BoxMensagem('Cotação inválida ou não aprovada!', 2);
          qry_processo_CD_INCOTERM.AsString := '';
          qry_processo_CD_TAB_FRETE_VENDA.AsString := '';
          qry_processo_CD_TAB_FRETE_COMPRA.AsString := '';
          qry_processo_CD_MOEDA_FRETE.AsString := '';
          qry_processo_TP_CARGA.AsString := '';
          qry_processo_IN_ROUTING.aSsTRING := '';

          qry_processo_VL_OTHER_CHARGE.AsFloat := 0;
          qry_processo_CHARGEABLE.AsFloat := 0;
          qry_processo_VL_TARIFA_FRETE.AsFloat := 0;
          qry_processo_VL_FRETE.AsFloat := 0;
          qry_processo_VL_HOUSE.AsFloat := 0;
          qry_processo_TP_ESTUFAGEM.AsString := '';
          qry_processo_VL_RATEIO.AsFloat := 0;
          qry_processo_VL_PESO_BRUTO.AsFloat := 0;
          qry_processo_VL_PESO_BRUTO.AsFloat := 0;
          qry_processo_QTD_VOLUME.AsFloat := 0;
          qry_processo_CUBAGEM.AsFloat := 0;
          qry_processo_CHARGEABLE.AsFloat := 0;

          pgcDadosFatores.ActivePage := tsDados;
          msk_prop_exp.SetFocus;
          habilita_campos(true);
        end;

      end;

    end
    else
    begin
      cotacao := false;
      with datm_abre_proc do
      begin
        if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
          transp := ' AND (TPF.CD_CIA_TRANSP= ' + quotedstr(msk_cd_cia_exp.text) + ')';
        if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
          transp := ' AND (TPF.CD_ARMADOR = ' + quotedstr(msk_cd_arm_exp.text) + ')';

        transp := transp + 'AND (TPF.CD_AGENTE= ' + quotedstr(msk_cd_ag_exp.text) + ')';

        qry_proposta_.Close;
        qry_proposta_.ParamByName('DT_VENCTO').AsString := datetostr(dt_server);
        qry_proposta_.ParamByName('NR_PROPOSTA').AsString := msk_prop_exp.TEXT;
        qry_proposta_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.TEXT;
        qry_proposta_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.TEXT;
        qry_proposta_.ParamByName('CD_EMPRESA').AsString := msk_cd_cliente.TEXT;
        qry_proposta_.ParamByName('CD_ORIGEM').AsString := msk_cd_origem_exp.TEXT;
        qry_proposta_.ParamByName('CD_DESTINO').AsString := msk_cd_destino_exp.TEXT;
        if GetServicoNovo then
          qry_proposta_.ParamByName('CD_SERVICO').AsInteger := StrToInt(Trim(msk_cd_servico.text))
        else
          qry_proposta_.ParamByName('CD_SERVICO').AsString  := msk_cd_servico.TEXT;
        qry_proposta_.Sql[10] := transp;
        qry_proposta_.Prepare;
        qry_proposta_.Open;
        if qry_proposta_.RecordCount > 0 then
        begin
          qry_processo_CD_INCOTERM.AsString := qry_proposta_CD_INCOTERM.AsString;
          qry_processo_CD_TAB_FRETE_VENDA.AsString := qry_proposta_CD_TAB_FRETE.AsString;
          qry_processo_CD_MOEDA_FRETE.AsString := qry_proposta_CD_MOEDA.AsString;
          qry_processo_TP_CARGA.AsString := qry_proposta_TP_CARGA.AsString;
          qry_processo_IN_ROUTING.aSsTRING := '1';
          qry_processo_VL_OTHER_CHARGE.AsFloat := qry_proposta_OTHER_VENDA.AsFloat;
          qry_processo_CHARGEABLE.AsFloat := qry_proposta_PESO_TAXADO.AsFloat;

          if (qry_proposta_CD_INCOTERM.AsString = 'CIP') or (qry_proposta_CD_INCOTERM.AsString = 'CIF') or
            (qry_proposta_CD_INCOTERM.AsString = 'CPT') or (qry_proposta_CD_INCOTERM.AsString = 'DDP') or
            (qry_proposta_CD_INCOTERM.AsString = 'DDU') or (qry_proposta_CD_INCOTERM.AsString = 'DEQ') or
            (qry_proposta_CD_INCOTERM.AsString = 'DES') or (qry_proposta_CD_INCOTERM.AsString = 'CFR') then //prepaid
            qry_processo_TP_FRETE.AsString := '1'
          else qry_processo_TP_FRETE.AsString := '0';

          habilita_campos(false);
        end
        else
        begin
          BoxMensagem('Proposta inválida ou não aprovada!', 2);
          qry_processo_CD_INCOTERM.AsString := '';
          qry_processo_CD_TAB_FRETE_VENDA.AsString := '';
          qry_processo_CD_TAB_FRETE_COMPRA.AsString := '';
          qry_processo_CD_MOEDA_FRETE.AsString := '';
          qry_processo_TP_CARGA.AsString := '';
          qry_processo_IN_ROUTING.aSsTRING := '';
          qry_processo_VL_OTHER_CHARGE.AsFloat := 0;
          qry_processo_CHARGEABLE.AsFloat := 0;
          qry_processo_VL_TARIFA_FRETE.AsFloat := 0;
          qry_processo_VL_FRETE.AsFloat := 0;
          qry_processo_VL_HOUSE.AsFloat := 0;
          qry_processo_TP_ESTUFAGEM.AsString := '';
          qry_processo_VL_RATEIO.AsFloat := 0;
          qry_processo_VL_PESO_BRUTO.AsFloat := 0;
          qry_processo_VL_PESO_BRUTO.AsFloat := 0;
          qry_processo_QTD_VOLUME.AsFloat := 0;
          qry_processo_CUBAGEM.AsFloat := 0;
          qry_processo_CHARGEABLE.AsFloat := 0;

          pgcDadosFatores.ActivePage := tsDados;
          msk_prop_exp.SetFocus;
          habilita_campos(true);
        end;

      end;
    end;
  end;
end;

procedure Tfrm_abre_proc.msk_cd_ag_expExit(Sender: TObject);
begin
  if msk_cd_ag_exp.text <> '' then
  begin
    ValCodEdt(msk_cd_ag_exp);
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT NM_AGENTE FROM TAGENTE WHERE TP_AG = "1" AND CD_AGENTE = "' + msk_cd_ag_exp.text + '"');
      Open;
      if recordCount > 0 then
      begin
        if (msk_cd_ag_exp.text = '0000') then
        begin
          BoxMensagem('Este Agente é exclusivo para Processo Direto!', 2);
          edt_nm_ag_exp.text := '';
          msk_cd_ag_exp.text := '';
          exit;
        end;
        edt_nm_ag_exp.text := fields[0].AsString;
      end
      else
      begin
        BoxMensagem('Código do Agente inválido!', 2);
        msk_cd_ag_exp.text := '';
        edt_nm_ag_exp.text := '';
      end;
    end;
  end
  else edt_nm_ag_exp.text := '';

end;

procedure Tfrm_abre_proc.rd_group_tp_procClick(Sender: TObject);
begin
  if rd_group_tp_proc.ItemIndex = 0 then
  begin
    msk_cd_agente.Visible := false;
    edt_nm_agente.Visible := false;
    lb_ag.Visible := false;
    btn_co_agente.Visible := false;
    msk_cd_agente.text := '0000';
    edt_nm_agente.text := 'AGENTE DIRETO';
  end;
  if rd_group_tp_proc.ItemIndex = 1 then
  begin
    msk_cd_agente.Visible := true;
    edt_nm_agente.Visible := true;
    lb_ag.Visible := true;
    btn_co_agente.Visible := true;
    msk_cd_agente.text := '';
    edt_nm_agente.text := '';
  end;


end;

procedure Tfrm_abre_proc.btn_pedidoClick(Sender: TObject);
begin

  vstr_cd_modulo := '30';
  str_cd_rotina := '3001';
  if datm_abre_proc.qry_processo_IN_LIBERADO.AsString = '0' then
  begin
    BoxMensagem('Este processo precisa ser liberado!', 2);
    st_entrada := '';
    exit;
  end;
  if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
    st_entrada := '5';
  if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
    st_entrada := '6';

 // if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
   //   st_entrada:='4';


  nr_processo_gestao := msk_cd_unid_neg.text + msk_cd_produto.text + msk_nr_processo.text;
  close;

end;

procedure Tfrm_abre_proc.insere_mercadoria_despesa(nr_cotacao,
  nr_processo: string);
var Mercadoria: TQuery;
  i, cons_cubagem: real;
begin
  i := 1;
  with TQuery.Create(Application) do
  begin
    DataBasename := 'DBBROKER';
    Sql.Clear;
    Sql.Add('SELECT ISNULL(CONSTANTE_CUBAGEM,1) FROM TVIA_TRANSP_BROKER NOLOCK WHERE CD_VIA_TRANSP = "' + datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString + '"');
    Open;
    cons_cubagem := Fields[0].AsFloat;
    Free;
  end;

  Mercadoria := TQuery.Create(Application);
  Mercadoria.DAtaBaseName := 'DBBROKER';
  Mercadoria.Sql.Clear;
  Mercadoria.Sql.Add('SELECT TP_CNTR,TP_ESTUFAGEM, VL_LARGURA, VL_COMPR, VL_ALTURA, VL_PESO_KG, VL_PESO_TON,');
  Mercadoria.Sql.Add('QTD_VOLUMES, VL_CUBAGEM_M3, VL_VENDA, VL_CUSTO FROM TPROPOSTA_MERCADORIA WHERE ');
  Mercadoria.Sql.Add(' NR_PROPOSTA = "' + nr_cotacao + '"');
  Mercadoria.Open;

  if (datm_abre_proc.qry_produto_TP_PRODUTO.AsString = '02') and
    (datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01') and
    (datm_abre_proc.qry_processo_TP_ESTUFAGEM.AsString = '1') then
  begin
    while not (Mercadoria.EOF) do
    begin
      with TQuery.CReate(Application) do
      begin
        DataBaseName := 'DBBROKER';
        Sql.clear;
        Sql.Add('INSERT INTO TPROCESSO_CNTR (NR_PROCESSO, CODIGO, TP_CNTR,VL_PESO_TON, VL_VENDA, VL_CUSTO_TOTAL, VL_CUBAGEM)');
        Sql.Add('VALUES (:NR_PROCESSO, :CODIGO, :TP_CNTR, :VL_PESO_TON, :VL_VENDA, :VL_CUSTO_TOTAL, :VL_CUBAGEM)');
        Params[0].AsString := nr_processo;
        Params[1].AsString := formatfloat('000', i);
        Params[2].AsString := Mercadoria.Fields[0].AsString;
        Params[3].AsFloat := Mercadoria.Fields[6].AsFloat;
        Params[4].AsFloat := Mercadoria.Fields[9].AsFloat;
        Params[5].AsFloat := Mercadoria.Fields[10].AsFloat;
        Params[6].AsFloat := Mercadoria.Fields[8].AsFloat;
        ExecSql;
        Free;
      end;
      I := I + 1;
      Mercadoria.Next;
    end;
  end
  else
  begin
    while not (Mercadoria.EOF) do
    begin
      with TQuery.CReate(Application) do
      begin
        DataBaseName := 'DBBROKER';
        Sql.clear;
        Sql.Add('INSERT INTO TINSTRUCAO_CARGA (NR_PROCESSO, CD_CARGA, QTDE, VL_COMPR, VL_LARG, VL_ALT, PESO_KG, ');
        Sql.Add('CUBAGEM_VENDA, PESO_VOLUMETRICO, CD_VIA_TRANSP,TP_ESTUFAGEM, TP_EMBALAGEM, TP_CNTR, PESO_TON, VL_VENDA, ');
        Sql.Add('VL_COMPRA) VALUES (:NR_PROCESSO, :CD_CARGA, :QTDE, :VL_COMPR, :VL_LARG, :VL_ALT, :PESO_KG, :CUBAGEM_VENDA,');
        Sql.Add(' :PESO_VOLUMETRICO, :CD_VIA_TRANSP,:TP_ESTUFAGEM, :TP_EMBALAGEM, :TP_CNTR, :PESO_TON, :VL_VENDA,:VL_COMPRA)');
        Params[0].AsString := nr_processo;
        Params[1].AsString := formatfloat('000', i);
        Params[2].AsFloat := Mercadoria.Fields[7].AsFloat;
        Params[3].AsFloat := Mercadoria.Fields[3].AsFloat;
        Params[4].AsFloat := Mercadoria.Fields[2].AsFloat;
        Params[5].AsFloat := Mercadoria.Fields[4].AsFloat;
        Params[6].AsFloat := Mercadoria.Fields[5].AsFloat;
        Params[7].AsFloat := cons_cubagem;
        Params[8].AsFloat := Mercadoria.Fields[8].AsFloat / cons_cubagem;
        Params[9].AsString := datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString;
        Params[10].AsString := datm_abre_proc.qry_processo_TP_ESTUFAGEM.AsString;
        Params[11].AsString := '';
        Params[12].AsString := Mercadoria.Fields[0].AsString;
        Params[13].AsFloat := Mercadoria.Fields[6].AsFloat;
        Params[14].Asfloat := Mercadoria.Fields[9].AsFloat;
        Params[15].Asfloat := Mercadoria.Fields[10].AsFloat; ;
        ExecSql;
        Free;
      end;
      I := I + 1;
      Mercadoria.Next;
    end;
  end;

  cotacao := false;
end;

procedure Tfrm_abre_proc.rdgroup_tp_comercialClick(Sender: TObject);
begin
  msk_prop_exp.Enabled := true;
  btn_co_cotacao.Enabled := true;
  btn_prop_exp.Enabled := true;
  if rdgroup_tp_comercial.ItemIndex = 0 then
  begin
    btn_co_cotacao.Visible := false;
    btn_prop_exp.Visible := true;
    lb_tp_comercial_exp.Caption := 'Proposta';
  end;
  if rdgroup_tp_comercial.ItemIndex = 1 then
  begin
    btn_co_cotacao.Visible := true;
    btn_prop_exp.Visible := false;
    lb_tp_comercial_exp.Caption := 'Cotação';
  end;

  if rdgroup_tp_comercial.ItemIndex = 2 then
  begin
    msk_prop_exp.Text := '';
    btn_co_cotacao.Enabled := false;
    btn_prop_exp.Enabled := false;
    msk_prop_exp.Enabled := false;
    if datm_abre_proc.qry_processo_.State = dsEdit then
    begin
      datm_abre_proc.qry_processo_CD_INCOTERM.AsString := '';
      datm_abre_proc.qry_processo_CD_TAB_FRETE_VENDA.AsString := '';
      datm_abre_proc.qry_processo_CD_TAB_FRETE_COMPRA.AsString := '';
      datm_abre_proc.qry_processo_CD_MOEDA_FRETE.AsString := '';
      datm_abre_proc.qry_processo_TP_CARGA.AsString := '';
      datm_abre_proc.qry_processo_IN_ROUTING.aSsTRING := '';
      datm_abre_proc.qry_processo_VL_OTHER_CHARGE.AsFloat := 0;
      datm_abre_proc.qry_processo_CHARGEABLE.AsFloat := 0;
      datm_abre_proc.qry_processo_VL_TARIFA_FRETE.AsFloat := 0;
      datm_abre_proc.qry_processo_VL_FRETE.AsFloat := 0;
      datm_abre_proc.qry_processo_VL_HOUSE.AsFloat := 0;
      datm_abre_proc.qry_processo_TP_ESTUFAGEM.AsString := '';
      datm_abre_proc.qry_processo_VL_RATEIO.AsFloat := 0;
      datm_abre_proc.qry_processo_VL_PESO_BRUTO.AsFloat := 0;
      datm_abre_proc.qry_processo_VL_PESO_BRUTO.AsFloat := 0;
      datm_abre_proc.qry_processo_QTD_VOLUME.AsFloat := 0;
      datm_abre_proc.qry_processo_CUBAGEM.AsFloat := 0;
      datm_abre_proc.qry_processo_CHARGEABLE.AsFloat := 0;
    end;
  end;

end;

procedure Tfrm_abre_proc.btn_co_cotacaoClick(Sender: TObject);
var transp: string;
begin
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then Exit;
  if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '04' then
    transp := ' AND (TPF.CD_CIA_TRANSP = ' + quotedstr(msk_cd_cia_exp.text) + ')';
  if datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString = '01' then
    transp := ' AND (TPF.CD_ARMADOR = ' + quotedstr(msk_cd_arm_exp.text) + ')';
  if GetServicoNovo then
    datm_abre_proc.qry_processo_NR_PROPOSTA.AsString := ConsultaOnLineExSQL('SELECT DISTINCT TP.NR_PROPOSTA PROPOSTA' +
      ' FROM TPROPOSTA TP, TPROPOSTA_ITEM TPI, TPROPOSTA_FRETE  TPF ' +
      '  WHERE (TP.NR_PROPOSTA = TPI.NR_PROPOSTA) AND (TP.CD_STATUS= "0" AND TP.DT_VALIDADE >=  CONVERT(DATETIME,' + datetostr(dt_server) + ',103)) AND ' +
      ' (TPI.NR_PROPOSTA = TPF.NR_PROPOSTA AND TPI.CD_SERVICO = TPF.CD_SERVICO) AND   ' +
      ' (TP.CD_EMPRESA = ' + quotedstr(msk_cd_cliente.text) + ') AND (TPI.CD_SERVICO = ' + quotedstr(IntToStr(StrToInt(Trim(msk_cd_servico.text)))) + ') AND (TPI.CD_PRODUTO=' + quotedstr(msk_cd_produto.text) + ')' +
      ' AND (TPI.CD_UNID_NEG = ' + quotedstr(msk_cd_unid_neg.text) + ') ' + transp +
      ' AND (TPF.CD_ORIGEM = ' + quotedstr(msk_cd_origem_exp.text) + ') AND (TPF.CD_DESTINO = ' + quotedstr(msk_cd_destino_exp.text) + ') ' +
      ' AND (TPF.CD_AGENTE= ' + quotedstr(msk_cd_ag_exp.text) + ')',
      'Cotações',['NR_PROPOSTA'],['Cotação'],'PROPOSTA',nil)
  else
    datm_abre_proc.qry_processo_NR_PROPOSTA.AsString := ConsultaOnLineExSQL('SELECT DISTINCT TP.NR_PROPOSTA PROPOSTA' +
      ' FROM TPROPOSTA TP, TPROPOSTA_ITEM TPI, TPROPOSTA_FRETE  TPF ' +
      '  WHERE (TP.NR_PROPOSTA = TPI.NR_PROPOSTA) AND (TP.CD_STATUS= "0" AND TP.DT_VALIDADE >=  CONVERT(DATETIME,' + datetostr(dt_server) + ',103)) AND ' +
      ' (TPI.NR_PROPOSTA = TPF.NR_PROPOSTA AND TPI.CD_SERVICO = TPF.CD_SERVICO) AND   ' +
      ' (TP.CD_EMPRESA = ' + quotedstr(msk_cd_cliente.text) + ') AND (TPI.CD_SERVICO = ' + quotedstr(msk_cd_servico.text) + ') AND (TPI.CD_PRODUTO=' + quotedstr(msk_cd_produto.text) + ')' +
      ' AND (TPI.CD_UNID_NEG = ' + quotedstr(msk_cd_unid_neg.text) + ') ' + transp +
      ' AND (TPF.CD_ORIGEM = ' + quotedstr(msk_cd_origem_exp.text) + ') AND (TPF.CD_DESTINO = ' + quotedstr(msk_cd_destino_exp.text) + ') ' +
      ' AND (TPF.CD_AGENTE= ' + quotedstr(msk_cd_ag_exp.text) + ')',
      'Cotações',['NR_PROPOSTA'],['Cotação'],'PROPOSTA',nil);

  msk_prop_exp.Text := datm_abre_proc.qry_processo_NR_PROPOSTA.AsString;
  msk_prop_expExit(Sender);

end;

procedure Tfrm_abre_proc.btn_co_cot_impClick(Sender: TObject);
begin
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then Exit;
  datm_abre_proc.qry_processo_NR_PROPOSTA.AsString :=
       ConsultaOnLineExSQL('SELECT DISTINCT TP.NR_PROPOSTA PROPOSTA, ORI.NM_PORTO ORIGEM, DES.NM_PORTO DESTINO' +
                           '  FROM TPROPOSTA TP, TPROPOSTA_ITEM TPI, TPROPOSTA_FRETE  TPF, TPORTO ORI, TPORTO DES ' +
                           ' WHERE (TP.NR_PROPOSTA = TPI.NR_PROPOSTA) ' +
                           '   AND (TPI.NR_PROPOSTA = TPF.NR_PROPOSTA ) ' +
                           '   AND (ORI.CD_PORTO    =* TPF.CD_ORIGEM) ' +
                           '   AND (DES.CD_PORTO    =* TPF.CD_DESTINO) ' +
                           '   AND (TP.CD_EMPRESA   = ' + quotedstr(msk_cd_cliente.text)  + ') ' +
                           '   AND (TPI.CD_PRODUTO  = ' + quotedstr(msk_cd_produto.text)  + ') ' +
                           '   AND (TPI.CD_UNID_NEG = ' + quotedstr(msk_cd_unid_neg.text) + ') ' +
                           '   AND TP.TP_PROPOSTA = "1" AND TP.CD_STATUS IN ("0", "1") ',
                           'Cotações',['TP.NR_PROPOSTA','ORI.NM_PORTO','DES.NM_PORTO'],['Cotação','Origem','Destino'],'PROPOSTA',nil);
  msk_proposta.Text := datm_abre_proc.qry_processo_NR_PROPOSTA.AsString;
  msk_propostaExit(Sender);
end;

procedure Tfrm_abre_proc.rdgroup_tp_comerc_impClick(Sender: TObject);
begin
  btn_co_cot_imp.Enabled := true;
//  btn_co_proposta.Enabled := true;
  msk_proposta.Enabled := true;
//  if rdgroup_tp_comerc_imp.ItemIndex = 0 then
//  begin
//    btn_co_cot_imp.Visible := false;
//    btn_co_proposta.Visible := true;
//    lb_tp_comercial_imp.Caption := 'Proposta';
//  end;
//  if rdgroup_tp_comerc_imp.ItemIndex = 1 then
//  begin
    btn_co_cot_imp.Visible := true;
//    btn_co_proposta.Visible := false;
//    lb_tp_comercial_imp.Caption := 'Cotação';
//  end;

(*  if rdgroup_tp_comerc_imp.ItemIndex = 2 then
  begin
    msk_proposta.text := '';
    btn_co_cot_imp.Enabled := false;
    btn_co_proposta.Enabled := false;
    msk_proposta.Enabled := false;
    if datm_abre_proc.qry_processo_.State = dsEdit then
    begin
      datm_abre_proc.qry_processo_CD_INCOTERM.AsString := '';
      datm_abre_proc.qry_processo_CD_TAB_FRETE_VENDA.AsString := '';
      datm_abre_proc.qry_processo_CD_TAB_FRETE_COMPRA.AsString := '';
      datm_abre_proc.qry_processo_CD_MOEDA_FRETE.AsString := '';
      datm_abre_proc.qry_processo_TP_CARGA.AsString := '';
      datm_abre_proc.qry_processo_IN_ROUTING.aSsTRING := '';
      datm_abre_proc.qry_processo_VL_OTHER_CHARGE.AsFloat := 0;
      datm_abre_proc.qry_processo_CHARGEABLE.AsFloat := 0;
      datm_abre_proc.qry_processo_VL_TARIFA_FRETE.AsFloat := 0;
      datm_abre_proc.qry_processo_VL_FRETE.AsFloat := 0;
      datm_abre_proc.qry_processo_VL_HOUSE.AsFloat := 0;
      datm_abre_proc.qry_processo_TP_ESTUFAGEM.AsString := '';
      datm_abre_proc.qry_processo_VL_RATEIO.AsFloat := 0;
      datm_abre_proc.qry_processo_VL_PESO_BRUTO.AsFloat := 0;
      datm_abre_proc.qry_processo_VL_PESO_BRUTO.AsFloat := 0;
      datm_abre_proc.qry_processo_QTD_VOLUME.AsFloat := 0;
      datm_abre_proc.qry_processo_CUBAGEM.AsFloat := 0;
      datm_abre_proc.qry_processo_CHARGEABLE.AsFloat := 0;
    end;

  end;*)


end;

procedure Tfrm_abre_proc.msk_cd_unid_vincExit(Sender: TObject);
begin
  if msk_cd_unid_vinc.text <> '' then
  begin
    ValCodEdt(msk_cd_unid_vinc);
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG = "' + msk_cd_unid_vinc.text + '"');
      Open;
      if recordCount > 0 then
        edt_nm_unid_vinc.text := fields[0].AsString
      else
      begin
        BoxMensagem('Código da Unidade de Negócio inválida!', 2);
        edt_nm_unid_vinc.text := '';
        msk_cd_unid_vinc.text := '';
      end;
    end;
  end
  else edt_nm_unid_vinc.text := '';

end;

procedure Tfrm_abre_proc.msk_cd_prod_vincExit(Sender: TObject);
begin
  if msk_cd_prod_vinc.text <> '' then
  begin
    ValCodEdt(msk_cd_prod_vinc);
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO = "' + msk_cd_prod_vinc.text + '"');
      Open;
      if recordCount > 0 then
        edt_nm_prod_vinc.text := fields[0].AsString
      else
      begin
        BoxMensagem('Código do Produto inválido!', 2);
        edt_nm_prod_vinc.text := '';
        msk_cd_prod_vinc.text := '';
      end;
    end;
  end
  else edt_nm_prod_vinc.text := '';
end;

procedure Tfrm_abre_proc.btn_co_unid_vinc_expClick(Sender: TObject);
begin
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then Exit;
  msk_cd_unid_vinc.Text := ConsultaOnLineEx('TUNID_NEG', 'Unidades de Negócio', ['CD_UNID_NEG', 'NM_UNID_NEG'], ['Código', 'Unidade'], 'CD_UNID_NEG',nil);
  msk_cd_unid_vincExit(nil);

end;

procedure Tfrm_abre_proc.btn_co_prod_vinc_expClick(Sender: TObject);
begin
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then Exit;
  msk_cd_prod_vinc.Text := ConsultaOnLineEx('TPRODUTO', 'Produtos', ['CD_PRODUTO', 'NM_PRODUTO'], ['Código', 'Unidade'], 'CD_PRODUTO',nil);
  msk_cd_prod_vincExit(nil);

end;

procedure Tfrm_abre_proc.chkbx_proc_vinc_expClick(Sender: TObject);
begin
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) or
    (chkbx_proc_vinc_exp.Checked = false) then
  begin
    chkbx_proc_vinc_exp.Checked := false;

    msk_cd_unid_vinc.Enabled := false;
    msk_cd_unid_vinc.text := '';
    edt_nm_unid_vinc.text := '';

    msk_cd_prod_vinc.Enabled := false;
    msk_cd_prod_vinc.Text := '';
    edt_nm_prod_vinc.Text := '';

    msk_proc_vinc_exp.Enabled := false;
    msk_proc_vinc_exp.Text := '';

    btn_proc_vinc_exp.Enabled := false;
    btn_co_prod_vinc_exp.Enabled := false;
    btn_co_unid_vinc_exp.Enabled := false;
  end
  else
 //if (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then
  begin
    msk_cd_unid_vinc.Enabled := true;
    msk_cd_prod_vinc.Enabled := true;
    msk_proc_vinc_exp.Enabled := true;
    btn_proc_vinc_exp.Enabled := true;
    btn_co_prod_vinc_exp.Enabled := true;
    btn_co_unid_vinc_exp.Enabled := true;
  end;
end;

procedure Tfrm_abre_proc.btn_proc_vinc_expClick(Sender: TObject);
var processo_vinc: string[12];
begin
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then Exit;

  processo_vinc := ConsultaOnLineExSQL('SELECT SUBSTRING(TP.NR_PROCESSO,5,12) AS NR_PROCESSO, TP.CD_CLIENTE,' +
    ' (SELECT TE.NM_EMPRESA FROM TEMPRESA_NAC TE WHERE TE.CD_EMPRESA = TP.CD_CLIENTE) NM_CLIENTE, TP.CD_SERVICO, ' +
    ' TS.NM_SERVICO ' +
    ' FROM TPROCESSO TP, TSERVICO TS  WHERE ' +
    ' TP.CD_UNID_NEG = ' + quotedstr(msk_cd_unid_vinc.text) + ' AND TP.CD_PRODUTO = ' + quotedstr(msk_cd_prod_vinc.text) +
    ' AND TP.CD_CLIENTE = ' + quotedstr(msk_cd_cliente.text) +
    ' AND TP.CD_SERVICO = TS.CD_SERVICO AND TS.TP_SERVICO = "0" AND ' +
    ' TS.CD_VIA_TRANSPORTE=' + quotedstr(datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString),
    'Processos - Vinculação',
    ['NR_PROCESSO', 'CD_CLIENTE', 'NM_EMPRESA', 'CD_SERVICO', 'NM_SERVICO'],
    ['Processos', 'Cód.', 'Cliente', 'Cód.', 'Serviço'],
    'NR_PROCESSO',nil);
  msk_proc_vinc_exp.text := processo_vinc; //copy(processo_vinc, 5,10);
  msk_proc_vinc_expExit(Sender);

end;

procedure Tfrm_abre_proc.msk_proc_vinc_expExit(Sender: TObject);
var proc_vinc: string[18];
begin
  if msk_proc_vinc_exp.text <> '' then
  begin
    proc_vinc := msk_cd_unid_vinc.text + msk_cd_prod_vinc.text + msk_proc_vinc_exp.text;
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT TP.NR_PROCESSO FROM TPROCESSO TP, TSERVICO TS WHERE TP.NR_PROCESSO = "' + proc_vinc + '"');
      Sql.Add(' AND TP.CD_CLIENTE = "' + msk_cd_cliente.text + '" ');
      Sql.Add(' AND TP.CD_SERVICO = TS.CD_SERVICO AND TS.TP_SERVICO = "0" AND TP.IN_LIBERADO = "1" ');
      Sql.Add(' AND TS.CD_VIA_TRANSPORTE = "' + datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString + '"');
      Open;
      if RecordCount = 0 then
      begin
        BoxMensagem('Processo inválido!', 2);
        msk_proc_vinc_exp.SetFocus;
      end;
    end;
  end;
end;

procedure Tfrm_abre_proc.chkbx_proc_vinc_impClick(Sender: TObject);
begin
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) or
    (chkbx_proc_vinc_imp.Checked = false) then
  begin
    chkbx_proc_vinc_imp.Checked := false;

    msk_cd_unid_vinc_imp.Enabled := false;
    msk_cd_unid_vinc_imp.text := '';
    edt_nm_unid_vinc_imp.text := '';

    msk_cd_prod_vinc_imp.Enabled := false;
    msk_cd_prod_vinc_imp.Text := '';
    edt_nm_prod_vinc_imp.Text := '';

    msk_proc_vinc_imp.Enabled := false;
    msk_proc_vinc_imp.Text := '';

    btn_proc_vinc_imp.Enabled := false;
    btn_co_prod_vinc_imp.Enabled := false;
    btn_co_unid_vinc_imp.Enabled := false;
  end
  else
//if (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then
  begin
    msk_cd_unid_vinc_imp.Enabled := true;
    msk_cd_prod_vinc_imp.Enabled := true;
    msk_proc_vinc_imp.Enabled := true;
    btn_proc_vinc_imp.Enabled := true;
    btn_co_prod_vinc_imp.Enabled := true;
    btn_co_unid_vinc_imp.Enabled := true;
  end;
end;

procedure Tfrm_abre_proc.msk_cd_unid_vinc_impExit(Sender: TObject);
begin
  if msk_cd_unid_vinc_imp.text <> '' then
  begin
    ValCodEdt(msk_cd_unid_vinc_imp);
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG = "' + msk_cd_unid_vinc_imp.text + '"');
      Open;
      if recordCount > 0 then
        edt_nm_unid_vinc_imp.text := fields[0].AsString
      else
      begin
        BoxMensagem('Código da Unidade de Negócio inválida!', 2);
        edt_nm_unid_vinc_imp.text := '';
        msk_cd_unid_vinc_imp.text := '';
      end;
    end;
  end
  else edt_nm_unid_vinc_imp.text := '';

end;

procedure Tfrm_abre_proc.msk_cd_prod_vinc_impExit(Sender: TObject);
begin
  if msk_cd_prod_vinc_imp.text <> '' then
  begin
    ValCodEdt(msk_cd_prod_vinc_imp);
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO = "' + msk_cd_prod_vinc_imp.text + '"');
      Open;
      if recordCount > 0 then
        edt_nm_prod_vinc_imp.text := fields[0].AsString
      else
      begin
        BoxMensagem('Código do Produto inválido!', 2);
        edt_nm_prod_vinc_imp.text := '';
        msk_cd_prod_vinc_imp.text := '';
      end;
    end;
  end
  else edt_nm_prod_vinc_imp.text := '';

end;

procedure Tfrm_abre_proc.msk_proc_vinc_impExit(Sender: TObject);
var proc_vinc: string[18];
begin
  if msk_proc_vinc_imp.text <> '' then
  begin
    proc_vinc := msk_cd_unid_vinc_imp.text + msk_cd_prod_vinc_imp.text + msk_proc_vinc_imp.text;
    with Tquery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT TP.NR_PROCESSO FROM TPROCESSO TP, TSERVICO TS WHERE TP.NR_PROCESSO = "' + proc_vinc + '"');
      Sql.Add(' AND TP.CD_CLIENTE = "' + msk_cd_cliente.text + '" ');
      Sql.Add(' AND TP.CD_SERVICO = TS.CD_SERVICO AND TS.TP_SERVICO = "0" AND TP.IN_LIBERADO = "1" ');
      Sql.Add(' AND TS.CD_VIA_TRANSPORTE = "' + datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString + '"');
      Open;
      if RecordCount = 0 then
      begin
        BoxMensagem('Processo inválido!', 2);
        msk_proc_vinc_imp.SetFocus;
      end;
    end;
  end;
end;

procedure Tfrm_abre_proc.btn_co_unid_vinc_impClick(Sender: TObject);
begin
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then Exit;
  msk_cd_unid_vinc_imp.Text := ConsultaOnLineEx('TUNID_NEG', 'Unidades de Negócio', ['CD_UNID_NEG', 'NM_UNID_NEG'], ['Código', 'Unidade'], 'CD_UNID_NEG',nil);
  msk_cd_unid_vinc_impExit(nil);
end;

procedure Tfrm_abre_proc.btn_co_prod_vinc_impClick(Sender: TObject);
begin
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then Exit;
  msk_cd_prod_vinc_imp.Text := ConsultaOnLineEx('TPRODUTO', 'Produtos', ['CD_PRODUTO', 'NM_PRODUTO'], ['Código', 'Unidade'], 'CD_PRODUTO',nil);
  msk_cd_prod_vinc_impExit(nil);
end;

procedure Tfrm_abre_proc.btn_proc_vinc_impClick(Sender: TObject);
var processo_vinc: string[12];
begin
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then Exit;

  processo_vinc := ConsultaOnLineExSQL('SELECT SUBSTRING(TP.NR_PROCESSO,5,12) AS NR_PROCESSO, TP.CD_CLIENTE,' +
    ' (SELECT TE.NM_EMPRESA FROM TEMPRESA_NAC TE WHERE TE.CD_EMPRESA = TP.CD_CLIENTE) NM_CLIENTE, TP.CD_SERVICO, ' +
    ' TS.NM_SERVICO ' +
    ' FROM TPROCESSO TP, TSERVICO TS WHERE  ' +
    ' TP.CD_UNID_NEG = ' + quotedstr(msk_cd_unid_vinc_imp.text) + ' AND TP.CD_PRODUTO = ' + quotedstr(msk_cd_prod_vinc_imp.text) +
    ' AND TP.CD_CLIENTE = ' + quotedstr(msk_cd_cliente.text) +
    ' AND TP.CD_SERVICO = TS.CD_SERVICO AND TS.TP_SERVICO = "0" AND ' +
    ' TS.CD_VIA_TRANSPORTE=' + quotedstr(datm_abre_proc.qry_servico_CD_VIA_TRANSPORTE.AsString),
    'Processos - Vinculação',
    ['NR_PROCESSO', 'CD_CLIENTE', 'NM_EMPRESA', 'CD_SERVICO', 'NM_SERVICO'],
    ['Processos', 'Cód.', 'Cliente', 'Cód.', 'Serviço'],
    'NR_PROCESSO',nil);
  msk_proc_vinc_imp.text := processo_vinc; //copy(processo_vinc, 5,10);
  msk_proc_vinc_impExit(Sender);

end;

procedure Tfrm_abre_proc.checbx_proc_vinc_agClick(Sender: TObject);
begin
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) or
    (checbx_proc_vinc_ag.Checked = false) then
  begin
    datm_abre_proc.qry_conhec_vinc.Close;
    dbgrid_conhec_vinc.color := clMenu;
  end
  else
  begin
    datm_abre_proc.qry_conhec_vinc.Close;

    if (msk_nr_conhecimento.Text <> '') and (msk_nr_conhecimento_master.Text <> '') then
    begin
      datm_abre_proc.qry_conhec_vinc.Sql[4] := ' TH.NR_MASTER=:NR_MASTER ';
      datm_abre_proc.qry_conhec_vinc.Sql[5] := ' AND TH.NR_HOUSE=:NR_HOUSE ';
      datm_abre_proc.qry_conhec_vinc.ParamByname('NR_HOUSE').AsString := msk_nr_conhecimento.Text;
      datm_abre_proc.qry_conhec_vinc.ParamByname('NR_MASTER').AsString := msk_nr_conhecimento_master.Text;
    end;

    if (msk_nr_conhecimento.Text <> '') and (msk_nr_conhecimento_master.Text = '') then
    begin
      datm_abre_proc.qry_conhec_vinc.Sql[4] := ' ';
      datm_abre_proc.qry_conhec_vinc.Sql[5] := ' TH.NR_HOUSE=:NR_HOUSE';
      datm_abre_proc.qry_conhec_vinc.ParamByname('NR_HOUSE').AsString := msk_nr_conhecimento.Text;
    end;

    if (msk_nr_conhecimento.Text = '') and (msk_nr_conhecimento_master.Text <> '') then
    begin
      datm_abre_proc.qry_conhec_vinc.Sql[4] := ' TH.NR_MASTER=:NR_MASTER ';
      datm_abre_proc.qry_conhec_vinc.Sql[5] := ' ';
      datm_abre_proc.qry_conhec_vinc.ParamByname('NR_MASTER').AsString := msk_nr_conhecimento_master.Text;
    end;

    if (msk_nr_conhecimento.Text = '') and (msk_nr_conhecimento_master.Text = '') then
    begin
      boxmensagem('Deve ser preenchido o Conhecimento!', 2);
      checbx_proc_vinc_ag.Checked := false;
      exit;
    end;

    datm_abre_proc.qry_conhec_vinc.Sql[6] := ' AND ISNULL(TP.NR_PROCESSO_VINC,"") = ""';

    datm_abre_proc.qry_conhec_vinc.Prepare;
    datm_abre_proc.qry_conhec_vinc.Open;
    dbgrid_conhec_vinc.color := clWindow;
  end;
end;

procedure Tfrm_abre_proc.btn_co_celulaClick(Sender: TObject);
begin
  with datm_abre_proc do
  begin
    Application.CreateForm( Tfrm_celula, frm_celula );
    with frm_celula do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if ( frm_celula.Cons_OnLine_Texto <> '' ) then
    begin
      msk_cd_celula.Text := frm_celula.Cons_OnLine_Texto;
      msk_cd_celulaExit(Sender);
    end;
  end;
end;

procedure Tfrm_abre_proc.msk_cd_celulaExit(Sender: TObject);
begin
  with datm_abre_proc do
  begin
    if msk_cd_celula.Text <> '' then
    begin
      ValCodEdt( msk_cd_celula );
      qry_celula_.Close;
      qry_celula_.ParamByName('CD_CELULA').AsString := Trim( msk_cd_celula.Text );
      qry_celula_.Prepare;
      qry_celula_.Open;
      if qry_celula_.RecordCount > 0 then
      begin
        edt_nm_celula.Text := qry_celula_.FieldByName('NM_CELULA').AsString;
        msk_cd_analrc.Text := qry_celula_.FieldByName('CD_ANALISTA').AsString;
        edt_nm_analrc.Text := qry_celula_.FieldByName('NM_ANALISTA').AsString;
      end
      else
      begin
        BoxMensagem( 'Esta Célula não está cadastrada!', 2 );
        edt_nm_celula.Text := '';
        msk_cd_analrc.Text := '';
        edt_nm_analrc.Text := '';
        if msk_cd_celula.Enabled then
        begin
          pgcDadosFatores.ActivePage := tsDados;
          msk_cd_celula.SetFocus;
        end;
      end;
    end
    else
    begin
      edt_nm_celula.Text := '';
      msk_cd_analrc.Text := '';
      edt_nm_analrc.Text := '';
    end;
  end;
end;

procedure Tfrm_abre_proc.grdRefKeyPress(Sender: TObject; var Key: Char);
begin
  if vColuna2 then
  begin
    if not ( IsNumeric(Key) ) and ( Key <> chr(VK_RETURN) ) and ( Key <> chr(VK_BACK) ) then
      Key := #0;
  end
  else
  begin
    if ( Key = ' ' ) then
      Key := #0;
    if ( Key = ',' ) then
      Key := #0;
    // se não aceitar barra na referencia, segundo a TCLIENTE_HABILITACAO
    if RefClienteHabilitacao(msk_cd_unid_neg.Text, msk_cd_produto.Text, msk_cd_cliente.Text, 0) = 0 then
      if ( Key = '/' ) then
        Key := #0;
  end;
end;

procedure Tfrm_abre_proc.grdRefExit(Sender: TObject);
var
  i : Integer;
begin
{  for i := 0 to grdRef.RowCount - 1 do
  begin
    grdRef.Cells[2, i] := Copy('0000',1,4-Length(Trim(grdRef.Cells[2, i]))) + Trim(grdRef.Cells[2, i]);
    if i = grdRef.RowCount - 1 then

  end;}
  VerificaGestao(grdRef);
end;

procedure TFrm_abre_proc.VerificaGestao(vGrdRef: TStringGrid);
var
  InLI: String;
begin
  if GetServicoNovo then
    InLI := ConsultaLookUP('TSERVICO_NOVO', 'CD_SERVICO', msk_cd_servico.text, 'IN_LI')
  else
    InLI := ConsultaLookUP('TSERVICO', 'CD_SERVICO', msk_cd_servico.text, 'IN_LI');
  if InLI <> '1' then  //Flag Necessita LI
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) FROM TPO_ITEM');
      SQL.Add('WHERE NR_PROCESSO = ''' + Trim(vgrdRef.Cells[1, vgrdRef.RowCount - 1]) + '''');
      SQL.Add('  AND CD_EMPRESA  = ''' + msk_cd_cliente.Text + '''');
      SQL.Add('  AND ISNULL(IN_UTILIZADO_INSTR_DESEMB,'''') <> ''1''');
      Open;
      if Fields[0].AsInteger <> 0 then
      begin
        BoxMensagem('Atenção, o pedido "' + Trim(vgrdRef.Cells[1, vgrdRef.RowCount - 1]) + '" possui administração de pedido e portanto deve ser escolhida uma instrução de desembaraço',3);
        pgcDadosFatores.ActivePage := tsDados;
        EditInstrucaoDesemb.SetFocus;
        vgrdRef.Cells[1, vgrdRef.RowCount - 1] := '';
        vgrdRef.Cells[2, vgrdRef.RowCount - 1] := '';
        vgrdRef.RowCount                       := vgrdRef.RowCount - 1;
        vgrdRef.Row                            :=(vgrdRef.RowCount - 1);
      end;
      Close;
      Free;
    end;
  end;

  {vgrdRef.Cells[2, vgrdRef.RowCount - 1] := Copy('0000',1,4-Length(Trim(vgrdRef.Cells[2, vgrdRef.RowCount - 1]))) + Trim(vgrdRef.Cells[2, vgrdRef.RowCount - 1]);
  //verifica sempre última linha pois verifica a cada inserção
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TPO_ITEM WHERE NR_PROCESSO = ''' + Trim(vgrdRef.Cells[1, vgrdRef.RowCount - 1]) + ''' AND NR_ITEM_CLIENTE = ''' + Trim(vgrdRef.Cells[2, vgrdRef.RowCount - 1]) + '''');
    Open;
    if Fields[0].AsInteger = 0 then
    begin
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) FROM TESTAGIO_PROCESSO (NOLOCK) WHERE NR_REFERENCIA = ''' + Trim(vgrdRef.Cells[1, vgrdRef.RowCount - 1]) + ''' AND ISNULL(NR_PROCESSO_ADM, '''') <> '''' ');
      Open;
      if Fields[0].AsInteger > 0 then
      begin
        Application.MessageBox(Pchar('A T E N Ç Ã O ! Não existe o Item de Cliente "' + Trim(vgrdRef.Cells[2, vgrdRef.RowCount - 1]) + '" para o pedido "' + Trim(vgrdRef.Cells[1, vgrdRef.RowCount - 1]) + '".' + #10#13 +
                           'Continuando a inclusão desse Pedido/Item inexistente nesse processo, você estará induzindo o sistema a futuros problemas.' + #10#13 +
                           'Verifique Nr. Item Cliente e tente novamente!'), 'Pedido/Item inexistente no sistema!', MB_OK + MB_ICONERROR);

        vgrdRef.Cells[1, vgrdRef.RowCount - 1] := '';
        vgrdRef.Cells[2, vgrdRef.RowCount - 1] := '';
        vgrdRef.RowCount := vgrdRef.RowCount - 1;
        vgrdRef.Row := (vgrdRef.RowCount - 1);
      end;
      Close;
    end;
    Close;
    Free;
  end;}
end;

procedure Tfrm_abre_proc.grdRefSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var i : Integer;
begin
  vColuna2 := (ACol = 2);
  for i := 0 to grdRef.RowCount - 1 do
    grdRef.Cells[2, i] := Copy('0000',1,4-Length(Trim(grdRef.Cells[2, i]))) + Trim(grdRef.Cells[2, i]);
end;

procedure Tfrm_abre_proc.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    btn_sairClick(nil);
//  if (Shift = ([ssCtrl])) and (Key = Key_N) then
//    mi_incluir.Click;
//    btn_incluir.Click;
end;

procedure Tfrm_abre_proc.grdRefFIImpSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var i : Integer;
begin
  vColuna2 := (ACol = 2);
  for i := 0 to grdRefFIImp.RowCount - 1 do
    grdRefFIImp.Cells[2, i] := Copy('0000',1,4-Length(Trim(grdRefFIImp.Cells[2, i]))) + Trim(grdRefFIImp.Cells[2, i]);
end;

procedure Tfrm_abre_proc.grdRefFIImpExit(Sender: TObject);
var i : Integer;
begin
  for i := 0 to grdRefFIImp.RowCount - 1 do
  begin
    grdRefFIImp.Cells[2, i] := Copy('0000',1,4-Length(Trim(grdRefFIImp.Cells[2, i]))) + Trim(grdRefFIImp.Cells[2, i]);
    if i = grdRefFIImp.RowCount - 1 then VerificaGestao(grdRefFIImp);
  end;
end;

procedure Tfrm_abre_proc.grdRefFIImpKeyPress(Sender: TObject;
  var Key: Char);
begin
  if vColuna2 then
  begin
    if not ( IsNumeric(Key) ) and ( Key <> chr(VK_RETURN) ) and ( Key <> chr(VK_BACK) ) then
      Key := #0;
  end
  else
  begin
    if ( Key = ' ' ) then
      Key := #0;
    if ( Key = ',' ) then
      Key := #0;
    // se não aceitar barra na referencia, segundo a TCLIENTE_HABILITACAO
    if RefClienteHabilitacao(msk_cd_unid_neg.Text, msk_cd_produto.Text, msk_cd_cliente.Text, 0) = 0 then
      if ( Key = '/' ) then
        Key := #0;
  end;
end;

procedure Tfrm_abre_proc.grdRefFIImpSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  if Length(grdRefFIImp.Cells[ACol, ARow]) > 15 then
  begin
    grdRefFIImp.Cells[ACol, ARow] := Copy(grdRefFIImp.Cells[ACol, ARow], 1, 15);
  end;
end;

procedure Tfrm_abre_proc.grdRefFIImpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 40) and (grdRefFIImp.Row = (grdRefFIImp.RowCount - 1)) and
    (grdRefFIImp.Cells[1, grdRefFIImp.Row] <> '') then
  begin
    VerificaGestao(grdRefFIImp);
    grdRefFIImp.RowCount := grdRefFIImp.RowCount + 1;
  end;
  if (Key = 38) and (grdRefFIImp.Row = (grdRefFIImp.RowCount - 1)) and (grdRefFIImp.Cells[1, grdRefFIImp.Row] = '') then
  begin
    if grdRefFIImp.RowCount <> 1 then
      grdRefFIImp.RowCount := grdRefFIImp.RowCount - 1;
    grdRefFIImp.Row := (grdRefFIImp.RowCount - 1);
  end;
  Application.ProcessMessages;
end;

procedure Tfrm_abre_proc.msk_cd_servicoChange(Sender: TObject);
var vViaTransp: string[2];
begin
  if GetServicoNovo then
    vViaTransp := ConsultaLookUp('TSERVICO_NOVO', 'CD_SERVICO', msk_cd_servico.Text, 'CD_VIA_TRANSPORTE')
  else
    vViaTransp := ConsultaLookUp('TSERVICO', 'CD_SERVICO', msk_cd_servico.Text, 'CD_VIA_TRANSPORTE');
  if vViaTransp <> '' then
  begin
    cbbEstufagem1.Items.Clear;
    cbbEstufagem2.Items.Clear;
    cbbEstufagem3.Items.Clear;
    if ConsultaLookUp('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', vViaTransp, 'IN_FCL') = '1' then
    begin
      cbbEstufagem1.Items.Add('FCL');
      cbbEstufagem2.Items.Add('FCL');
      cbbEstufagem3.Items.Add('FCL');
    end;
    if ConsultaLookUp('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', vViaTransp, 'IN_LCL') = '1' then
    begin
      cbbEstufagem1.Items.Add('LCL');
      cbbEstufagem2.Items.Add('LCL');
      cbbEstufagem3.Items.Add('LCL');
    end;
    if ConsultaLookUp('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', vViaTransp, 'IN_CS') = '1' then
    begin
      cbbEstufagem1.Items.Add('Carga Solta');
      cbbEstufagem2.Items.Add('Carga Solta');
      cbbEstufagem3.Items.Add('Carga Solta');
    end;
    cbbEstufagem1.ItemIndex := -1;
    cbbEstufagem2.ItemIndex := -1;
    cbbEstufagem3.ItemIndex := -1;
  end;

{  IF (ConsultaLookUPSQL('SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = ''' + msk_cd_cliente.Text + ''' ', 'CD_GRUPO')='155')
    AND ((msk_cd_servico.TEXT='710') or (Trim(msk_cd_servico.TEXT) = '2'))
      AND (msk_cd_produto.TEXT='02')  then
  begin
    pnlBid.Visible:=True;
    if not (datm_abre_proc.qry_BID_Nestle.State in [dsEdit,dsInsert])  then
    begin
      datm_abre_proc.qry_BID_Nestle.Close;
      datm_abre_proc.qry_BID_Nestle.open;
    end;
  end
  else
  begin
    pnlBid.Visible:=false;
    datm_abre_proc.qry_BID_Nestle.Close;
   end;
   }
end;

procedure Tfrm_abre_proc.Btn_InstrucaoDesembClick(Sender: TObject);
begin
  if not (datm_abre_proc.qry_processo_.State in [dsEdit, dsInsert]) then
    Exit;
  datm_abre_proc.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString :=
                ConsultaOnLineExSQL('SELECT C.NR_REFERENCIA, C.NR_ITEM_PO, A.ID_CLIENTE, A.ID_CODIGO, DT_CRIACAO, B.AP_EMPRESA, A.DT_AUTORIZACAO ' +
                                    'FROM TINSTRUCAO_DESEMBARACO A, TEMPRESA_NAC B, TINSTRUCAO_DESEMBARACO_PEDIDO C '                  +
                                    'WHERE '                                                                      +
                                    '  C.ID_CODIGO = A.ID_CODIGO AND B.CD_EMPRESA = A.CD_CLIENTE AND ISNULL(NR_PROCESSO,'''') = '''' AND '     +
                                    '   B.CD_EMPRESA = ''' + msk_cd_cliente.Text +  ''' ',
                                 //   '   C.CD_USUARIO = A.CD_USUARIO_AUTORIZACAO AND'                              +
                                 //   '   A.IN_AUTORIZADO = ''1''',
                                    'Instruções de Embarque',
                                    ['NR_REFERENCIA','NR_ITEM_PO', 'ID_CODIGO', 'DT_CRIACAO', 'AP_EMPRESA', 'DT_AUTORIZACAO','A.ID_CLIENTE'],
                                    ['Referencia', 'Item', 'Pedido', 'Cód. Instr. Embarque'   , 'Dt. Criação', 'Cliente', 'Dt. Autorização' ], 'ID_CODIGO', nil);
  EditInstrucaoDesemb.Text := datm_abre_proc.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString;
  EditInstrucaoDesembExit(EditInstrucaoDesemb);
  //AtualizaGridRefCliente;
  //AtualizaGridDocsEmbarque;
end;

procedure Tfrm_abre_proc.AtualizaInstrucaoDesembaraco(const pNrprocesso : string);
begin
  Usql('TINSTRUCAO_DESEMBARACO','NR_PROCESSO  = ''' + pNrprocesso + '''', 'ID_CODIGO = ''' + EditInstrucaoDesemb.Text + '''');
end;

procedure Tfrm_abre_proc.AtualizaGridRefCliente;
var
  vQryItens : TQuery;
  vNrSeq    : string;
  I         : Integer;
begin
  try
    I := 0;
    vQryItens  := TQuery.Create(Application);
    vQryItens.DatabaseName  := 'DBBROKER';

    vQryItens.Sql.Add('SELECT NR_REFERENCIA, NR_ITEM_PO');
    vQryItens.Sql.Add('FROM TINSTRUCAO_DESEMBARACO_PEDIDO');
    vQryItens.Sql.Add('WHERE');
    vQryItens.Sql.Add('    ID_CODIGO =:ID_CODIGO');
    vQryItens.ParamByName('ID_CODIGO').AsString := EditInstrucaoDesemb.Text;
    vQryItens.Open;
    vQryItens.First;
    if not vQryItens.IsEmpty then
    begin
      grdRef.RowCount := vQryItens.RecordCount;
      while not vQryItens.Eof do
      begin
        grdRef.Cells[1,I] := vQryItens.FieldByName('NR_REFERENCIA').AsString;
        grdRef.Cells[2,I] := vQryItens.FieldByName('NR_ITEM_PO').AsString;
        I                 := I + 1;
        vQryItens.Next;
      end;
      grdRef.Enabled      := False;
    end
    else
    begin
      grdRef.Rowcount     := 0;
      grdRef.Cells[1,0]   := '';
      grdRef.Cells[2,0]   := '';
      grdRef.Enabled      := True;
    end;
  finally
    vQryItens.Free;
  end;
end;


function Tfrm_abre_proc.VerificaInstrucao(const vCdInstrucao : string) : Boolean;
begin
  with TQuery.Create(Application)do
  begin
    DatabaseName := 'DBBROKER';
    Sql.Add('select ID_CODIGO');
    Sql.Add('from TINSTRUCAO_DESEMBARACO A, TEMPRESA_NAC B');
    Sql.Add('where');
    Sql.Add('     B.CD_EMPRESA = A.CD_CLIENTE AND ISNULL(NR_PROCESSO,'''') = '''' AND');
    Sql.Add('     B.CD_EMPRESA =:CD_EMPRESA AND ');
    Sql.Add('     A.IN_AUTORIZADO = ''1'' and A.ID_CODIGO =:ID_CODIGO');
    ParamByName('CD_EMPRESA').AsString := msk_cd_cliente.Text;
    ParamByName('ID_CODIGO').AsString  := vCdInstrucao;
    Open;
    Result := not(IsEmpty);
    Free;
  end;
end;

procedure Tfrm_abre_proc.EditInstrucaoDesembExit(Sender: TObject);
var
  S: String;
begin
  if EditInstrucaoDesemb.Text <> '' then
  begin
    if datm_abre_proc.qry_intrucao_desemb.Active then
      datm_abre_proc.qry_intrucao_desemb.Close;
    datm_abre_proc.qry_intrucao_desemb.ParamByName('ID_CODIGO').AsString := EditInstrucaoDesemb.Text;
    datm_abre_proc.qry_intrucao_desemb.Open;
    if datm_abre_proc.qry_intrucao_desemb.IsEmpty then
    begin
      if EditInstrucaoDesemb.CanFocus then
      begin
        MessageDlg('Instrução não cadastrada.', mtError, [mbOk], 0);
        pgcDadosFatores.ActivePage := tsDados;
        EditInstrucaoDesemb.SetFocus;
      end;
    end
    else if datm_abre_proc.qry_intrucao_desembIN_AUTORIZADO.AsString <> '1' then
    begin
      if EditInstrucaoDesemb.CanFocus then
      begin
        MessageDlg('A Instrução ainda não foi autorizada.', mtError, [mbOk], 0);
        pgcDadosFatores.ActivePage := tsDados;
        EditInstrucaoDesemb.SetFocus;
      end;
    end
    else if datm_abre_proc.qry_intrucao_desembCD_CLIENTE.AsString <> msk_cd_cliente.Text then
    begin
      if EditInstrucaoDesemb.CanFocus then
      begin
        MessageDlg('O Cliente da Instrução é diferente do informado para este processo.', mtError, [mbOk], 0);
        pgcDadosFatores.ActivePage := tsDados;
        EditInstrucaoDesemb.SetFocus;
      end;
    end
    else
    begin
      AtualizaGridRefCliente;
      AtualizaGridDocsEmbarque;
      msk_cd_area.Text := ConsultaLookUPSQL(' SELECT TOP 1 PO.CD_AREA ' +
                                            ' FROM TINSTRUCAO_DESEMBARACO_PEDIDO IDP (NOLOCK) INNER JOIN TPO PO (NOLOCK) ON PO.NR_PROCESSO = IDP.NR_REFERENCIA ' +
                                            ' WHERE ID_CODIGO = ' + QuotedStr(EditInstrucaoDesemb.Text), 'CD_AREA');
      S := ConsultaLookUPSQL(' SELECT NR_CONHECIMENTO ' +
                             ' FROM TINSTRUCAO_DESEMBARACO IDP (NOLOCK) ' +
                             ' WHERE ID_CODIGO = ' + QuotedStr(EditInstrucaoDesemb.Text), 'NR_CONHECIMENTO');
      if Trim(S) <> '' then
        msk_nr_conhecimento.Text := S;
    end;
  end;
end;

procedure Tfrm_abre_proc.AtualizaGridDocsEmbarque;
var
  vUltSeq : Integer;
begin
  with TQuery.Create(Application)do
  begin
    DatabaseName  := 'DBBROKER';
    Sql.Add('SELECT DISTINCT ID.NR_CONHECIMENTO, NR_FATURA, DT_FATURA');
    Sql.Add('FROM TINSTRUCAO_DESEMBARACO ID, TINSTRUCAO_DESEMBARACO_PEDIDO IP, TPO_ITEM POI');
    Sql.Add('WHERE');
    Sql.Add('    IP.ID_CODIGO        = :ID_CODIGO AND');
    Sql.Add('    ID.ID_CODIGO        = IP.ID_CODIGO AND'); // Michel - 14/01/2010
    Sql.Add('    POI.NR_PROCESSO     = IP.NR_REFERENCIA AND');
    Sql.Add('    POI.CD_EMPRESA      = ID.CD_CLIENTE AND');  // Michel - 14/01/2010
    Sql.Add('    POI.NR_ITEM_CLIENTE = IP.NR_ITEM_PO AND');
    Sql.Add('    POI.NR_PARCIAL      =  IP.NR_PARCIAL');
    ParamByName('ID_CODIGO').AsString := datm_abre_proc.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString;
    Open;
    msk_nr_conhecimento.Text := FieldByName('NR_CONHECIMENTO').AsString;
    vUltSeq := StrToInt(ConsultaLookUPSQL('select ISNULL(MAX(NR_SEQUENCIA),''0'') SEQ FROM TDOCUMENTO_INSTRUCAO_TEMP where NR_IDENTIFICADOR = ''2''','SEQ'));


    datm_abre_proc.qry_doc_inst_temp_.First;
    while not datm_abre_proc.qry_doc_inst_temp_.Eof do
      datm_abre_proc.qry_doc_inst_temp_.Delete;


    while not Eof do
    begin
      Inc(vUltSeq);
      datm_abre_proc.qry_doc_inst_temp_.Insert;
      datm_abre_proc.qry_doc_inst_temp_NR_IDENTIFICADOR.AsInteger  := 2;
      datm_abre_proc.qry_doc_inst_temp_NR_SEQUENCIA.AsInteger      := vUltSeq;
      datm_abre_proc.qry_doc_inst_temp_CD_TIPO_DCTO_INSTR.AsString := '01';
      datm_abre_proc.qry_doc_inst_temp_NR_DCTO_INSTRUCAO.AsString  := FieldByName('NR_FATURA').AsString;
      datm_abre_proc.qry_doc_inst_temp_DT_DOCUMENTO.AsDateTime     := FieldByName('DT_FATURA').AsDateTime;
      datm_abre_proc.qry_doc_inst_temp_.Post;
      Next;
    end;
  end;
end;

procedure Tfrm_abre_proc.msk_cd_unid_negKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) then
    Key := #0;
end;

procedure Tfrm_abre_proc.eQtdProcExit(Sender: TObject);
begin
  if (eQtdProc.Text='') or (strToInt(eQtdProc.Text) < 1) then
     eQtdProc.Text:='1';

  if strToInt(eQtdProc.Text)>15 then begin
     ShowMessage('Limite máximo para abertura de processos em lote é 15');
     eQtdProc.Text:='15';
  end;

  {IF (ConsultaLookUPSQL('SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = ''' + msk_cd_cliente.Text + ''' ', 'CD_GRUPO')='155')
    AND ((msk_cd_servico.TEXT='710') or (Trim(msk_cd_servico.TEXT) = '2'))
      AND (msk_cd_produto.TEXT='02')  then
  begin
    pnlBid.Visible:=True;
    if not (datm_abre_proc.qry_BID_Nestle.State in [dsEdit,dsInsert])  then
    begin
      datm_abre_proc.qry_BID_Nestle.Close;
      datm_abre_proc.qry_BID_Nestle.open;
    end;
  end
  else
  begin
    pnlBid.Visible:=false;
    datm_abre_proc.qry_BID_Nestle.Close;
   end;
   }
end;

procedure Tfrm_abre_proc.spin_seq_processoDownClick(Sender: TObject);
var
nSeq_Proc:Integer;
begin
  if nr_processo_lote.Count<1 then exit;

  nSeq_Proc:=strToInt(StringReplace(msk_seq_processo.Text,'º','',[]))-1;
  if nSeq_Proc<1 then
     nSeq_Proc:=1;

  msk_seq_processo.Text:=inttoStr(nSeq_Proc)+'º';
  msk_nr_processo.Text :=nr_processo_lote[nSeq_Proc-1];
end;

procedure Tfrm_abre_proc.spin_seq_processoUpClick(Sender: TObject);
var
nSeq_Proc:Integer;
begin
  if nr_processo_lote.Count<1 then exit;
  
  nSeq_Proc:=strToInt(StringReplace(msk_seq_processo.Text,'º','',[]))+1;

  if nSeq_Proc>nr_processo_lote.Count then
     nSeq_Proc:=nr_processo_lote.Count;

  msk_seq_processo.Text:=inttoStr(nSeq_Proc)+'º';
  msk_nr_processo.Text :=nr_processo_lote[nSeq_Proc-1];  
end;

procedure Tfrm_abre_proc.eQtdProcKeyPress(Sender: TObject; var Key: Char);
begin
  //somente numeros
  if not( Key in ['0'..'9',#8,#13,#27]) then begin
     ShowMessage('Digite Somente numeros.');
     abort;
  end;

end;

procedure Tfrm_abre_proc.AtualizaFatores;
var
  Servico: Integer;

  procedure DestroiFatores;
  begin
    while scbFatores.ComponentCount > 0 do
      scbFatores.Components[0].Free;
    while scbFatores.ControlCount > 0 do
      scbFatores.Controls[0].Free;
  end;
  procedure CriaFatores;
  var
    W, L, T: Integer;
    I, I2: Integer;
    Pnl: TPanelFator;
  begin
    T := 0;
    with datm_abre_proc do
    begin
      I := 0;
      while not qryFatores.Eof do
      begin
        Pnl             := TPanelFator.Create(scbFatores);
        Pnl.Parent      := scbFatores;
        Pnl.Tag         := I;
        Pnl.Top         := T;

        // Label
        with TLabelFator.Create(Pnl) do
        begin
          Parent     := Pnl;
          Caption    := Trim(qryFatoresNM_FATOR_CAMPO.AsString) + ':';
        end;

        // Edit para o campo digitável
        qryCamposProcesso.First;
        if qryCamposProcesso.Locate('FIELD_NAME', Trim(qryFatoresNM_CAMPO_PROCESSO.AsString), [loCaseInsensitive]) then
        begin
          // Flags
          if ((SameText(qryCamposProcessoTYPE_NAME.AsString, 'CHAR') or SameText(qryCamposProcessoTYPE_NAME.AsString, 'VARCHAR')) and (qryCamposProcessoFIELD_SIZE.AsInteger = 1)) or
             SameText(qryCamposProcessoTYPE_NAME.AsString, 'BIT') then
          begin
            with TCheckBoxFator.Create(Pnl) do
            begin
              Parent    := Pnl;
              FieldName := Trim(qryFatoresNM_CAMPO_PROCESSO.AsString);
              Left      := Pnl.Controls[0].Left + Pnl.Controls[0].Width + 5;
            end;
          end
          // Float
          else if SameText(qryCamposProcessoTYPE_NAME.AsString, 'FLOAT') then
          begin
            with TFloatFator.Create(Pnl) do
            begin
              Parent    := Pnl;
              FieldName := Trim(qryFatoresNM_CAMPO_PROCESSO.AsString);
              Left      := Pnl.Controls[0].Left + Pnl.Controls[0].Width + 5;
            end;
          end
          // Integer
          else if SameText(qryCamposProcessoTYPE_NAME.AsString, 'INT') then
          begin
            with TIntegerFator.Create(Pnl) do
            begin
              Parent    := Pnl;
              FieldName := Trim(qryFatoresNM_CAMPO_PROCESSO.AsString);
              Left      := Pnl.Controls[0].Left + Pnl.Controls[0].Width + 5;
            end;
          end
          // Data
          else if SameText(qryCamposProcessoTYPE_NAME.AsString, 'DATETIME') then
          begin
            with TDateTimeFator.Create(Pnl) do
            begin
              Parent    := Pnl;
              FieldName := Trim(qryFatoresNM_CAMPO_PROCESSO.AsString);
              Left      := Pnl.Controls[0].Left + Pnl.Controls[0].Width + 5;
            end;
          end
          // Texto
          else if (SameText(qryCamposProcessoTYPE_NAME.AsString, 'CHAR') or SameText(qryCamposProcessoTYPE_NAME.AsString, 'VARCHAR')) and (qryCamposProcessoFIELD_SIZE.AsInteger > 30) or
            SameText(qryCamposProcessoTYPE_NAME.AsString, 'TEXT') then
          begin
            with TMemoFator.Create(Pnl) do
            begin
              Parent     := Pnl;
              FieldName  := Trim(qryFatoresNM_CAMPO_PROCESSO.AsString);
              Left       := Pnl.Controls[0].Left + Pnl.Controls[0].Width + 5;
              Width      := Pnl.ClientWidth - Left - 5;
              Pnl.Height := Height + Top + 2;
              if not SameText(qryCamposProcessoTYPE_NAME.AsString, 'TEXT') then
                MaxLength  := qryCamposProcessoFIELD_SIZE.AsInteger;
            end;
          end
          // Códigos
          else
          begin
            with TEditFator.Create(Pnl) do
            begin
              Parent          := Pnl;
              FieldName       := Trim(qryFatoresNM_CAMPO_PROCESSO.AsString);
              Left            := Pnl.Controls[0].Left + Pnl.Controls[0].Width + 5;
              KeyFieldName    := qryFatoresNM_LOOKUP_CAMPO_CHAVE.AsString;
              TableName       := qryFatoresNM_LOOKUP_TABELA.AsString;
              ResultFieldName := qryFatoresNM_LOOKUP_CAMPO_RETORNO.AsString;
              MaxLength       := qryCamposProcessoFIELD_SIZE.AsInteger;
            end;
          end;

          // Edit para o Lookup
          if Trim(qryFatoresNM_LOOKUP_TABELA.AsString) <> '' then
          begin
            with TEditLookupFator.Create(Pnl) do
            begin
              Parent      := Pnl;
              Left        := Pnl.Controls[1].Left + Pnl.Controls[1].Width + 5;
            end;
          end;

          // SpeedButton para o Lookup
          if Trim(qryFatoresNM_LOOKUP_SQL.AsString) <> '' then
            with TSpeedButtonFator.Create(Pnl, frm_abre_proc.btn_co_unid_neg.Glyph, 2) do
            begin
              Parent    := Pnl;
              Left      := Pnl.Controls[Pnl.ControlCount - 1].Left + Pnl.Controls[Pnl.ControlCount - 1].Width + 2;
              LookupSQL := qryFatoresNM_LOOKUP_SQL.AsString;
            end;
        end;

        Pnl.Width := TControl(Pnl.Components[Pnl.ComponentCount-1]).Left + TControl(Pnl.Components[Pnl.ComponentCount-1]).Width + 1;

        if I mod 2 = 1 then
          if Pnl.Height >= TControl(scbFatores.Components[scbFatores.ComponentCount - 2]).Height then
            T := T + Pnl.Height + 2
          else
            T := T + TControl(scbFatores.Components[scbFatores.ComponentCount - 2]).Height + 2;

        qryFatores.Next;
        Inc(I);
      end;
      // Ajustar as posições
      L := 0;
      for I := 0 to scbFatores.ComponentCount -1 do
        if (scbFatores.Components[I].Tag mod 2 = 0) and (L < TControl(scbFatores.Components[I].Components[1]).Left) then
          L := TControl(scbFatores.Components[I].Components[1]).Left;
      for I := 0 to scbFatores.ComponentCount -1 do
        if (scbFatores.Components[I].Tag mod 2 = 0) and (TControl(scbFatores.Components[I].Components[1]).Left < L) then
        begin
          TControl(scbFatores.Components[I].Components[1]).Left := L;
          if scbFatores.Components[I].Components[1] is TMemoFator then
            TControl(scbFatores.Components[I].Components[1]).Width := TControl(scbFatores.Components[I]).ClientWidth - TControl(scbFatores.Components[I].Components[1]).Left - 3;
          for I2 := 2 to scbFatores.Components[I].ComponentCount - 1 do
            TControl(scbFatores.Components[I].Components[I2]).Left := TControl(scbFatores.Components[I].Components[I2-1]).Left + TControl(scbFatores.Components[I].Components[I2-1]).Width + 3;
          TPanel(scbFatores.Components[I]).Width := TControl(scbFatores.Components[I].Components[scbFatores.Components[I].ComponentCount-1]).Left + TControl(scbFatores.Components[I].Components[scbFatores.Components[I].ComponentCount-1]).Width + 1;
        end;

      L := 0;
      for I := 0 to scbFatores.ComponentCount -1 do
        if (scbFatores.Components[I].Tag mod 2 = 1) and (L < TControl(scbFatores.Components[I].Components[1]).Left) then
          L := TControl(scbFatores.Components[I].Components[1]).Left;
      for I := 0 to scbFatores.ComponentCount -1 do
        if (scbFatores.Components[I].Tag mod 2 = 1) and (TControl(scbFatores.Components[I].Components[1]).Left < L) then
        begin
          TControl(scbFatores.Components[I].Components[1]).Left := L;
          if scbFatores.Components[I].Components[1] is TMemoFator then
            TControl(scbFatores.Components[I].Components[1]).Width := TControl(scbFatores.Components[I]).Width - TControl(scbFatores.Components[I].Components[1]).Left - 3;
          for I2 := 2 to scbFatores.Components[I].ComponentCount - 1 do
            TControl(scbFatores.Components[I].Components[I2]).Left := TControl(scbFatores.Components[I].Components[I2-1]).Left + TControl(scbFatores.Components[I].Components[I2-1]).Width + 3;
          TPanel(scbFatores.Components[I]).Width := TControl(scbFatores.Components[I].Components[scbFatores.Components[I].ComponentCount-1]).Left + TControl(scbFatores.Components[I].Components[scbFatores.Components[I].ComponentCount-1]).Width + 1;
        end;

      // Igualar as larguras
      W := 0;
      for I := 0 to scbFatores.ComponentCount -1 do
        if (scbFatores.Components[I].Tag mod 2 = 0) and (W < TControl(scbFatores.Components[I]).Width) then
          W := TControl(scbFatores.Components[I]).Width;
      for I := 0 to scbFatores.ComponentCount -1 do
        if (scbFatores.Components[I].Tag mod 2 = 0) and (TControl(scbFatores.Components[I]).Width < W) then
          TControl(scbFatores.Components[I]).Width := W;

      W := 0;
      for I := 0 to scbFatores.ComponentCount -1 do
        if (scbFatores.Components[I].Tag mod 2 = 1) and (W < TControl(scbFatores.Components[I]).Width) then
          W := TControl(scbFatores.Components[I]).Width;
      for I := 0 to scbFatores.ComponentCount -1 do
        if (scbFatores.Components[I].Tag mod 2 = 1) and (TControl(scbFatores.Components[I]).Width < W) then
          TControl(scbFatores.Components[I]).Width := W;

      // Verificar o LEFT para os componentes da direita
      L := 0;
      for I := 0 to scbFatores.ComponentCount - 1 do
        if (scbFatores.Components[I].Tag mod 2 = 0) and (L < TPanel(scbFatores.Components[I]).Left + TPanel(scbFatores.Components[I]).Width) then
          L := TPanel(scbFatores.Components[I]).Left + TPanel(scbFatores.Components[I]).Width;
      for I := 0 to scbFatores.ComponentCount - 1 do
        if (scbFatores.Components[I].Tag mod 2 = 1) then
          TPanel(scbFatores.Components[I]).Left := L + 2;
    end;
  end;
begin
  if (Trim(msk_cd_unid_neg.Text) = '') or (Trim(msk_cd_produto.Text) = '') or (Trim(msk_cd_cliente.Text) = '') then
    DestroiFatores
  else
  begin
    with datm_abre_proc do
    begin
      if not TryStrToInt(msk_cd_servico.Text, Servico) then
        Servico := 0;
      if (not qryFatores.Active) or (qryFatores.ParamByName('CD_UNID_NEG').AsString <> msk_cd_unid_neg.Text) or
         (qryFatores.ParamByName('CD_PRODUTO').AsString <> msk_cd_produto.Text) or (qryFatores.ParamByName('CD_EMPRESA').AsString <> msk_cd_cliente.Text) or
         (qryFatores.ParamByName('CD_SERVICO').AsInteger <> Servico) then
      begin
        DestroiFatores;
        if qryFatores.Active then
          qryFatores.Close;
        qryFatores.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qryFatores.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
        qryFatores.ParamByName('CD_EMPRESA').AsString  := msk_cd_cliente.Text;
        if TryStrToInt(msk_cd_servico.Text, Servico) then
          qryFatores.ParamByName('CD_SERVICO').AsInteger := Servico
        else
          qryFatores.ParamByName('CD_SERVICO').AsInteger := 0;
        qryFatores.Open;
        CriaFatores;
      end;
    end;
  end;
end;

function Tfrm_abre_proc.ConsisteFatores: Boolean;
var
  I: Integer;
begin
  I := 1;
  Result := True;
  while I < scbFatores.ComponentCount do
  begin
    if (scbFatores.Components[I] is TDBEdit) and (Trim(TDBEdit(scbFatores.Components[I]).Text) = '') then
    begin
      Result := False;
      MessageDlg('É necessário preencher o fator ''' + TLabel(scbFatores.Components[I-1]).Caption + '''.', mtInformation, [mbOK], 0);
      pgcDadosFatores.ActivePage := tsFatores;
      TDBEdit(scbFatores.Components[I]).SetFocus;
      Break;
    end;
    Inc(I);
  end;
end;

procedure Tfrm_abre_proc.GravaFatores(AProcesso: String);
var
  I: Integer;
  Query: TQuery;
begin
  // Montar Script
  if scbFatores.ComponentCount > 0 then
  begin
    Query := TQuery.Create(nil);
    try
      Query.DatabaseName := 'DBBROKER';
      Query.SQL.Add('UPDATE TPROCESSO');

      for I := 0 to scbFatores.ComponentCount - 1 do
        if scbFatores.Components[I].Components[1] is TCheckBoxFator then
          Query.SQL.Add('    ' + TCheckBoxFator(scbFatores.Components[I].Components[1]).FieldName + ' = :' + TCheckBoxFator(scbFatores.Components[I].Components[1]).FieldName + ',')
        else if scbFatores.Components[I].Components[1] is TFloatFator then
          Query.SQL.Add('    ' + TFloatFator(scbFatores.Components[I].Components[1]).FieldName + ' = :' + TFloatFator(scbFatores.Components[I].Components[1]).FieldName + ',')
        else if scbFatores.Components[I].Components[1] is TIntegerFator then
          Query.SQL.Add('    ' + TIntegerFator(scbFatores.Components[I].Components[1]).FieldName + ' = :' + TIntegerFator(scbFatores.Components[I].Components[1]).FieldName + ',')
        else if scbFatores.Components[I].Components[1] is TDateTimeFator then
          Query.SQL.Add('    ' + TDateTimeFator(scbFatores.Components[I].Components[1]).FieldName + ' = :' + TDateTimeFator(scbFatores.Components[I].Components[1]).FieldName + ',')
        else if (scbFatores.Components[I].Components[1] is TMemoFator) and (TMemoFator(scbFatores.Components[I].Components[1]).Text <> '') then
          Query.SQL.Add('    ' + TMemoFator(scbFatores.Components[I].Components[1]).FieldName + ' = :' + TMemoFator(scbFatores.Components[I].Components[1]).FieldName + ',')
        else if (scbFatores.Components[I].Components[1] is TEditFator) and (TEditFator(scbFatores.Components[I].Components[1]).Text <> '') then
          Query.SQL.Add('    ' + TEditFator(scbFatores.Components[I].Components[1]).FieldName + ' = :' + TEditFator(scbFatores.Components[I].Components[1]).FieldName + ',');

      Query.SQL[1] := 'SET ' + Trim(Query.SQL[1]);
      Query.SQL[Query.SQL.Count - 1] := Copy(Query.SQL[Query.SQL.Count - 1], 1, Length(Query.SQL[Query.SQL.Count - 1]) - 1);
      Query.SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
      for I := 0 to scbFatores.ComponentCount - 1 do
        // Flags
        if scbFatores.Components[I].Components[1] is TCheckBoxFator then
          Query.ParamByName(TCheckBoxFator(scbFatores.Components[I].Components[1]).FieldName).AsString := TCheckBoxFator(scbFatores.Components[I].Components[1]).Value
        // Float
        else if scbFatores.Components[I].Components[1] is TFloatFator then
          Query.ParamByName(TFloatFator(scbFatores.Components[I].Components[1]).FieldName).AsFloat := TFloatFator(scbFatores.Components[I].Components[1]).Value
        // Integer
        else if scbFatores.Components[I].Components[1] is TIntegerFator then
          Query.ParamByName(TIntegerFator(scbFatores.Components[I].Components[1]).FieldName).AsInteger := TIntegerFator(scbFatores.Components[I].Components[1]).Value
        // Data
        else if scbFatores.Components[I].Components[1] is TDateTimeFator then
          Query.ParamByName(TDateTimeFator(scbFatores.Components[I].Components[1]).FieldName).AsDateTime := TDateTimeFator(scbFatores.Components[I].Components[1]).Value
        // Texto
        else if (scbFatores.Components[I].Components[1] is TMemoFator) and (TMemoFator(scbFatores.Components[I].Components[1]).Text <> '') then
          Query.ParamByName(TMemoFator(scbFatores.Components[I].Components[1]).FieldName).AsMemo := TMemoFator(scbFatores.Components[I].Components[1]).Value
        // Códigos
        else if (scbFatores.Components[I].Components[1] is TEditFator) and (TEditFator(scbFatores.Components[I].Components[1]).Text <> '') then
          Query.ParamByName(TEditFator(scbFatores.Components[I].Components[1]).FieldName).AsString := TEditFator(scbFatores.Components[I].Components[1]).Value;
      Query.ParamByName('NR_PROCESSO').AsString := AProcesso;
      Query.ExecSQL;
    finally
      FreeAndNil(Query);
    end;
  end;
end;

function Tfrm_abre_proc.ShowModal(ASimulacao: Boolean): Integer;
begin
  if (not ASimulacao) and ((str_cd_cargo = '001') or (ConsultaLookUPSQL('SELECT COUNT(*) AS QTD ' +
                                                                        ' FROM TCARGO ' +
                                                                        ' WHERE IN_ATIVO = "1" ' +
                                                                        '   AND NM_CARGO LIKE "%GERENTE%" ' +
                                                                        '   AND CD_CARGO = "' + str_cd_cargo + '"', 'QTD') <> '0')) then
    ASimulacao := MessageDlg('Deseja abrir como simulação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
  datm_abre_proc.Simulacao := ASimulacao;
  btn_manut_proc.Visible     := not ASimulacao;
  btn_proc_realiza.Visible   := not ASimulacao;
  btn_instr_embarque.Visible := not ASimulacao;
  btn_pedido.Visible         := not ASimulacao;
  mi_manut_proc.Visible      := not ASimulacao;
  mi_proc_realiza.Visible    := not ASimulacao;
  mi_instr_embarque.Visible  := not ASimulacao;
  mi_pedido.Visible          := not ASimulacao;

  tsFollowup.TabVisible      := ASimulacao;
  if ASimulacao then
  begin
    Application.CreateForm(Tfrm_followup, frm_followup);
    frm_followup.pnl1.Parent := tsFollowup;
    frm_followup.qryFollowUp.UpdateObject := nil;
    frm_followup.dbgrdFup.ReadOnly := True;
    frm_followup.dbgrdFup.OnDblClick := nil;
    frm_followup.dbgrdFup.OnKeyDown := nil;
    frm_followup.dbgrdFup.OnKeyPress := nil;
    frm_followup.dbgrdFup.OnKeyUp := nil;
    //frm_followup.dbgrdFup.PopupMenu := popFollowup;
    pnlCliServ.Height := 40;
  end
  else
    pnlCliServ.Height := 65;
  eQtdProc.Enabled := not ASimulacao;
  Result := inherited ShowModal;
end;

procedure Tfrm_abre_proc.FormDestroy(Sender: TObject);
begin
  if datm_abre_proc.Simulacao then
    FreeAndNil(frm_followup);
end;

procedure Tfrm_abre_proc.pgcDadosFatoresChange(Sender: TObject);
begin
  {IF (ConsultaLookUPSQL('SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = ''' + msk_cd_cliente.Text + ''' ', 'CD_GRUPO')='155')
      AND ((msk_cd_servico.TEXT='710') or (msk_cd_produto.TEXT='2'))  THEN
  begin
    pnlBid.Visible:=True;
  end
  else
  BEGIN
    datm_abre_proc.qry_BID_Nestle.Close;
    pnlBid.Visible:=False;
  end;}
end;

procedure Tfrm_abre_proc.Button1Click(Sender: TObject);
var
  i : Integer;
  status:string;
begin
  //showmessage(datm_abre_proc.qry_BID_NestleCD_DEST_COUNTRY.AsString) ;
end;

procedure Tfrm_abre_proc.cxGrid1DBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  {if key in [vk_up,vk_down] then
  begin
    msk_cd_pais_destino.Text:= datm_abre_proc.qry_BID_NestleCD_DEST_NEST.AsString;
    msk_cd_local_desembarque.Text:= datm_abre_proc.qry_BID_NestleCD_PORT_DISCHARGE.AsString;
    msk_cd_local_embarque.Text:= datm_abre_proc.qry_BID_NestleCD_ORIGIN_CITY.AsString;

    edt_cd_pais_destino.Text:= datm_abre_proc.qry_BID_NestleDEST_NEST.AsString;
    edt_cd_local_desembarque.Text:= datm_abre_proc.qry_BID_NestlePORT_DISCHARGE.AsString;
    edt_cd_local_embarque.Text:= datm_abre_proc.qry_BID_NestleORIGIN_CITY.AsString;
  end;     }

end;

procedure Tfrm_abre_proc.cxGrid1Click(Sender: TObject);
begin
  //if  not (datm_abre_proc.qry_BID_Nestle.State in [dsEdit,dsInsert]) then
  //  datm_abre_proc.qry_BID_Nestle.Edit;
end;

procedure Tfrm_abre_proc.cxGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //if  not (datm_abre_proc.qry_BID_Nestle.State in [dsEdit,dsInsert]) then
  //  datm_abre_proc.qry_BID_Nestle.Edit;
end;

procedure Tfrm_abre_proc.msk_cd_representanteExit(Sender: TObject);
begin
  with datm_abre_proc do
  begin
    if msk_cd_representante.Text <> '' then
    begin
      ValCodEdt(msk_cd_representante);
      qry_Representante.Close;
      qry_Representante.ParamByName('CD_CLIENTE').AsString       := msk_cd_cliente.Text;
      qry_Representante.ParamByName('CD_UNID_NEG').AsString      := msk_cd_unid_neg.Text;
      qry_Representante.ParamByName('CD_PRODUTO').AsString       := msk_cd_produto.Text;
      qry_Representante.ParamByName('CD_SERVICO').AsString       := Trim(msk_cd_servico.Text);
      qry_Representante.ParamByName('CD_REPRESENTANTE').AsString := msk_cd_representante.Text;
      qry_Representante.Prepare;
      qry_Representante.Open;

      if not qry_Representante.EOF then
        edt_nm_representante.Text := qry_RepresentanteNM_EMPRESA.AsString
      else
      begin
        BoxMensagem('Esse Representante não está cadastrado para Unidade/Produto/Cliente/Serviço!', 2);
        edt_nm_representante.Text := '';
        if msk_cd_representante.Enabled then
        begin
          pgcDadosFatores.ActivePage := tsDados;
          msk_cd_representante.SetFocus;
        end;
      end;

      qry_Representante.Close;
      qry_Representante.UnPrepare;
    end
    else
      edt_nm_representante.Text := '';
  end;
end;

procedure Tfrm_abre_proc.msk_cd_local_desembarqueExit(Sender: TObject);
begin
  with datm_abre_proc do
  begin
    if msk_cd_local_desembarque.Text <> '' then
    begin
      ValCodEdt(msk_cd_local_desembarque);
      qry_LocalEmbarque.Close;
      qry_LocalEmbarque.ParamByName('CODIGO').AsString := msk_cd_local_desembarque.Text;
      qry_LocalEmbarque.Prepare;
      qry_LocalEmbarque.Open;

      if not qry_LocalEmbarque.EOF then
        edt_nm_local_desembarque.Text := qry_LocalEmbarqueDESCRICAO.AsString
      else
      begin
        BoxMensagem('Esse Local não está cadastrado!', 2);
        edt_nm_local_desembarque.Text := '';
        if msk_cd_local_desembarque.Enabled then
        begin
          pgcDadosFatores.ActivePage := tsDados;
          msk_cd_local_desembarque.SetFocus;
        end;
      end;

      qry_LocalEmbarque.Close;
      qry_LocalEmbarque.UnPrepare;
    end
    else
      edt_nm_local_desembarque.Text := '';
  end;
end;

procedure Tfrm_abre_proc.btn_co_representanteClick(Sender: TObject);
begin
  msk_cd_representante.Text := ConsultaOnLineExSQL(' SELECT EN.CD_EMPRESA, EN.NM_EMPRESA ' +
                                                   ' FROM TCLIENTE_REPRESENTANTE CR ' +
                                                   '    INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = CR.CD_REPRESENTANTE ' +
                                                   ' WHERE CR.CD_CLIENTE = :CD_CLIENTE ' +
                                                   '   AND CR.CD_UNID_NEG = :CD_UNID_NEG ' +
                                                   '   AND CR.CD_PRODUTO = :CD_PRODUTO ' +
                                                   '   AND CR.CD_SERVICO = :CD_SERVICO ' +
                                                   '   AND ISNULL(EN.IN_REPRESENTANTE, ''0'') = ''1''',
     'Representantes', ['CD_EMPRESA', 'NM_EMPRESA'], ['Código', 'Nome'], 'CD_EMPRESA',
     [msk_cd_cliente.Text, msk_cd_unid_neg.Text, msk_cd_produto.Text, Trim(msk_cd_servico.Text)], nil, msk_cd_representante.Text);
  msk_cd_representanteExit(msk_cd_representante);
end;

procedure Tfrm_abre_proc.btn_co_local_desembarqueClick(Sender: TObject);
begin
  msk_cd_local_desembarque.Text := ConsultaOnLineExSQL(' SELECT CODIGO, DESCRICAO, CD_UF ' +
                                                       ' FROM TLOCAL_EMBARQUE',
     'Local de Desembarque', ['CODIGO', 'DESCRICAO', 'CD_UF'], ['Código', 'Nome', 'UF'], 'CODIGO', [], nil, msk_cd_local_desembarque.Text);
  msk_cd_local_desembarqueExit(msk_cd_local_desembarque);
end;

end.





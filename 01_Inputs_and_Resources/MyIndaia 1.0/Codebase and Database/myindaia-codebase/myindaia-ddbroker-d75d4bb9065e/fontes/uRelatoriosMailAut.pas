unit uRelatoriosMailAut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons, ToolEdit, Mask, Grids,
  DBGrids, ComCtrls, dbcgrids, Menus, StrUtils, AppEvnts, RXShell, DateUtil, DB, DBTables, Funcoes,
  Spin, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  Tfrm_relatorios_mail_aut = class(TForm)
    pgctrl_documento: TPageControl;
    ts_lista: TTabSheet;
    DBGrid1: TDBGrid;
    ts_dados: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    dbedt_descricao: TDBEdit;
    file_path: TFilenameEdit;
    pnl_btn_ag: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Bevel1: TBevel;
    Label7: TLabel;
    nb_config: TNotebook;
    Panel1: TPanel;
    Label8: TLabel;
    Shape1: TShape;
    ts_usuarios: TTabSheet;
    Panel2: TPanel;
    Label9: TLabel;
    DBText2: TDBText;
    DBGrid2: TDBGrid;
    Edit5: TEdit;
    Edit6: TEdit;
    SpeedButton1: TSpeedButton;
    Label12: TLabel;
    SpeedButton2: TSpeedButton;
    Edit7: TEdit;
    DBEdit2: TDBEdit;
    menu_manut_cadastro: TMainMenu;
    mi_novo: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Panel3: TPanel;
    Panel4: TPanel;
    Shape3: TShape;
    DBCheckBox1: TDBCheckBox;
    Shape4: TShape;
    Label13: TLabel;
    Label14: TLabel;
    SpeedButton3: TSpeedButton;
    Label15: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    SpeedButton4: TSpeedButton;
    Label16: TLabel;
    Edit4: TEdit;
    Edit8: TEdit;
    Label17: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    SpeedButton5: TSpeedButton;
    Label18: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    SpeedButton6: TSpeedButton;
    popGridUsuarios: TPopupMenu;
    Aplicarhorriosparatodososusurios1: TMenuItem;
    SpeedButton7: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SpeedButton8: TSpeedButton;
    Label21: TLabel;
    SpeedButton9: TSpeedButton;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Label22: TLabel;
    SpeedButton10: TSpeedButton;
    Edit19: TEdit;
    Edit20: TEdit;
    Label23: TLabel;
    SpeedButton11: TSpeedButton;
    Edit21: TEdit;
    Edit22: TEdit;
    Label24: TLabel;
    SpeedButton12: TSpeedButton;
    Edit23: TEdit;
    Edit24: TEdit;
    Label25: TLabel;
    SpeedButton13: TSpeedButton;
    Edit25: TEdit;
    Edit26: TEdit;
    SpeedButton14: TSpeedButton;
    Label28: TLabel;
    Label29: TLabel;
    SpeedButton15: TSpeedButton;
    Label30: TLabel;
    SpeedButton16: TSpeedButton;
    Label31: TLabel;
    SpeedButton17: TSpeedButton;
    Label32: TLabel;
    SpeedButton18: TSpeedButton;
    Label33: TLabel;
    SpeedButton19: TSpeedButton;
    Label34: TLabel;
    SpeedButton20: TSpeedButton;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    SpeedButton21: TSpeedButton;
    Label26: TLabel;
    Label35: TLabel;
    SpeedButton22: TSpeedButton;
    Label36: TLabel;
    SpeedButton23: TSpeedButton;
    Label37: TLabel;
    SpeedButton24: TSpeedButton;
    Label38: TLabel;
    SpeedButton25: TSpeedButton;
    Label39: TLabel;
    SpeedButton26: TSpeedButton;
    Label40: TLabel;
    SpeedButton27: TSpeedButton;
    Edit41: TEdit;
    Edit42: TEdit;
    Edit43: TEdit;
    Edit44: TEdit;
    Edit45: TEdit;
    Edit46: TEdit;
    Edit47: TEdit;
    Edit48: TEdit;
    Edit49: TEdit;
    Edit50: TEdit;
    Edit51: TEdit;
    Edit52: TEdit;
    Edit53: TEdit;
    Edit54: TEdit;
    pnlCampos: TPanel;
    Shape2: TShape;
    btn_co_usuario: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    Edit2: TEdit;
    edt_horarios: TEdit;
    MaskEdit1: TMaskEdit;
    DBEdit3: TDBEdit;
    Shape5: TShape;
    DBText1: TDBText;
    Label27: TLabel;
    SpeedButton30: TSpeedButton;
    Label44: TLabel;
    SpeedButton31: TSpeedButton;
    Label45: TLabel;
    Edit59: TEdit;
    Edit60: TEdit;
    Edit61: TEdit;
    Edit62: TEdit;
    Label41: TLabel;
    Edit63: TEdit;
    Edit64: TEdit;
    SpeedButton32: TSpeedButton;
    Label47: TLabel;
    Edit67: TEdit;
    Edit68: TEdit;
    SpeedButton34: TSpeedButton;
    SpeedButton28: TSpeedButton;
    Label43: TLabel;
    SpeedButton29: TSpeedButton;
    Label46: TLabel;
    Edit55: TEdit;
    Edit56: TEdit;
    Edit57: TEdit;
    Edit58: TEdit;
    Label48: TLabel;
    Edit65: TEdit;
    Edit66: TEdit;
    SpeedButton33: TSpeedButton;
    Label49: TLabel;
    Edit69: TEdit;
    Edit70: TEdit;
    SpeedButton35: TSpeedButton;
    Label42: TLabel;
    Edit71: TEdit;
    Edit72: TEdit;
    SpeedButton36: TSpeedButton;
    Label50: TLabel;
    Edit73: TEdit;
    Edit74: TEdit;
    SpeedButton37: TSpeedButton;
    Panel5: TPanel;
    lstDisponiveis: TListBox;
    Panel6: TPanel;
    lstSelecionados: TListBox;
    Label51: TLabel;
    Label52: TLabel;
    Shape6: TShape;
    Shape7: TShape;
    SpeedButton38: TSpeedButton;
    SpeedButton39: TSpeedButton;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    pnlNomeAmigavel: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Edit79: TEdit;
    Label57: TLabel;
    Label58: TLabel;
    popSelecionados: TPopupMenu;
    InserirCampoLookup1: TMenuItem;
    CortarResultado1: TMenuItem;
    Deletar1: TMenuItem;
    N1: TMenuItem;
    pnlLookup: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    pnlSubstring: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Edit80: TEdit;
    Edit81: TEdit;
    Edit82: TEdit;
    Tabela: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Edit83: TEdit;
    Label62: TLabel;
    Edit84: TEdit;
    btnReconfiguraTudo: TSpeedButton;
    lbl1: TLabel;
    btn1: TSpeedButton;
    lbl2: TLabel;
    btn2: TSpeedButton;
    ed1: TEdit;
    ed2: TEdit;
    ed3: TEdit;
    ed4: TEdit;
    lbl3: TLabel;
    btn3: TSpeedButton;
    lbl4: TLabel;
    btn4: TSpeedButton;
    ed5: TEdit;
    ed6: TEdit;
    ed7: TEdit;
    ed8: TEdit;
    lbl5: TLabel;
    btn5: TSpeedButton;
    lbl6: TLabel;
    btn6: TSpeedButton;
    ed9: TEdit;
    ed10: TEdit;
    ed11: TEdit;
    ed12: TEdit;
    lbl12: TLabel;
    ed13: TEdit;
    ed14: TEdit;
    btn7: TSpeedButton;
    lbl8: TLabel;
    ed15: TEdit;
    ed16: TEdit;
    btn8: TSpeedButton;
    lbl9: TLabel;
    ed17: TEdit;
    ed18: TEdit;
    btn9: TSpeedButton;
    lbl10: TLabel;
    ed19: TEdit;
    ed20: TEdit;
    btn10: TSpeedButton;
    lbl11: TLabel;
    ed21: TEdit;
    ed22: TEdit;
    btn11: TSpeedButton;
    DefinircomoChaveparaLookUp1: TMenuItem;
    ed23: TEdit;
    lbl7: TLabel;
    Moverpcima1: TMenuItem;
    Moverpbaixo1: TMenuItem;
    nbTipoConfig: TNotebook;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Edit75: TEdit;
    Edit76: TEdit;
    Edit77: TEdit;
    Edit78: TEdit;
    mmo1: TMemo;
    lbl15: TLabel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    lbl13: TLabel;
    lbl14: TLabel;
    btn12: TSpeedButton;
    btn13: TSpeedButton;
    ed26: TEdit;
    ed27: TEdit;
    ed24: TEdit;
    ed25: TEdit;
    lbl17: TLabel;
    btn14: TSpeedButton;
    lbl18: TLabel;
    btn15: TSpeedButton;
    lbl19: TLabel;
    btn16: TSpeedButton;
    lbl20: TLabel;
    btn17: TSpeedButton;
    lbl21: TLabel;
    btn18: TSpeedButton;
    lbl22: TLabel;
    btn19: TSpeedButton;
    ed28: TEdit;
    ed29: TEdit;
    ed30: TEdit;
    ed31: TEdit;
    ed32: TEdit;
    ed33: TEdit;
    ed34: TEdit;
    ed35: TEdit;
    ed36: TEdit;
    ed37: TEdit;
    ed38: TEdit;
    ed39: TEdit;
    lbl16: TLabel;
    ed40: TEdit;
    ed41: TEdit;
    btn20: TSpeedButton;
    lbl23: TLabel;
    btn21: TSpeedButton;
    lbl24: TLabel;
    btn22: TSpeedButton;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    Label2: TLabel;
    Edit85: TEdit;
    Edit86: TEdit;
    SpeedButton40: TSpeedButton;
    Label63: TLabel;
    Edit87: TEdit;
    Edit88: TEdit;
    SpeedButton41: TSpeedButton;
    Label64: TLabel;
    Edit89: TEdit;
    Edit90: TEdit;
    SpeedButton42: TSpeedButton;
    chk1: TCheckBox;
    chk2: TCheckBox;
    chk3: TCheckBox;
    Label65: TLabel;
    SpeedButton43: TSpeedButton;
    Edit91: TEdit;
    Edit92: TEdit;
    Label66: TLabel;
    SpeedButton44: TSpeedButton;
    Edit93: TEdit;
    Edit94: TEdit;
    Shape12: TShape;
    Label67: TLabel;
    Label69: TLabel;
    Edit95: TEdit;
    Edit96: TEdit;
    SpeedButton45: TSpeedButton;
    Label70: TLabel;
    Edit97: TEdit;
    Edit98: TEdit;
    SpeedButton46: TSpeedButton;
    Label71: TLabel;
    Edit99: TEdit;
    Edit100: TEdit;
    Label72: TLabel;
    Edit101: TEdit;
    Edit102: TEdit;
    SpeedButton47: TSpeedButton;
    SpeedButton48: TSpeedButton;
    SpinEdit1: TSpinEdit;
    Label73: TLabel;
    Label74: TLabel;
    Memo1: TMemo;
    SpeedButton50: TSpeedButton;
    Label76: TLabel;
    Edit107: TEdit;
    Edit108: TEdit;
    SpeedButton52: TSpeedButton;
    Label68: TLabel;
    Edit104: TEdit;
    SpeedButton49: TSpeedButton;
    SpeedButton53: TSpeedButton;
    Edit109: TEdit;
    Edit110: TEdit;
    Label77: TLabel;
    Label75: TLabel;
    Edit105: TEdit;
    Edit106: TEdit;
    SpeedButton51: TSpeedButton;
    Edit111: TEdit;
    Label78: TLabel;
    Edit112: TEdit;
    SpeedButton54: TSpeedButton;
    Edit103: TEdit;
    Shape13: TShape;
    Shape14: TShape;
    Panel7: TPanel;
    rdQuebra2: TRadioButton;
    rdQuebra1: TRadioButton;
    rdQuebra0: TRadioButton;
    Panel14: TPanel;
    rdOrdena1: TRadioButton;
    rdOrdena0: TRadioButton;
    Label79: TLabel;
    SpeedButton55: TSpeedButton;
    Edit113: TEdit;
    Edit114: TEdit;
    Label80: TLabel;
    Edit115: TEdit;
    Edit116: TEdit;
    SpeedButton56: TSpeedButton;
    chkEspecifico: TCheckBox;
    Label81: TLabel;
    SpeedButton57: TSpeedButton;
    Label82: TLabel;
    SpeedButton58: TSpeedButton;
    Edit117: TEdit;
    Edit118: TEdit;
    Edit119: TEdit;
    Edit120: TEdit;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Edit121: TEdit;
    Edit122: TEdit;
    SpeedButton59: TSpeedButton;
    Label86: TLabel;
    dbedtModal: TDBEdit;
    Edit123: TEdit;
    SpeedButton60: TSpeedButton;
    Label87: TLabel;
    SpeedButton61: TSpeedButton;
    dbedtIdioma: TDBEdit;
    Edit124: TEdit;
    Edit125: TEdit;
    Edit126: TEdit;
    SpeedButton62: TSpeedButton;
    Label88: TLabel;
    lblSql: TLabel;
    mmSql: TMemo;
    Label89: TLabel;
    Label90: TLabel;
    Edit127: TEdit;
    Edit128: TEdit;
    Edit129: TEdit;
    Edit130: TEdit;
    SpeedButton63: TSpeedButton;
    SpeedButton64: TSpeedButton;
    Edit131: TEdit;
    Edit132: TEdit;
    Label91: TLabel;
    SpeedButton65: TSpeedButton;
    Label92: TLabel;
    Edit133: TEdit;
    Edit134: TEdit;
    SpeedButton66: TSpeedButton;
    Label93: TLabel;
    Edit135: TEdit;
    Edit136: TEdit;
    SpeedButton67: TSpeedButton;
    chkAtendente: TCheckBox;
    chkContato: TCheckBox;
    IdHTTP1: TIdHTTP;
    Label94: TLabel;
    Edit137: TEdit;
    Edit138: TEdit;
    SpeedButton68: TSpeedButton;
    Label95: TLabel;
    Edit139: TEdit;
    Edit140: TEdit;
    SpeedButton69: TSpeedButton;
    Label96: TLabel;
    Edit141: TEdit;
    Edit142: TEdit;
    SpeedButton71: TSpeedButton;
    Label98: TLabel;
    Edit144: TEdit;
    SpeedButton72: TSpeedButton;
    Edit145: TEdit;
    Edit146: TEdit;
    Label99: TLabel;
    Edit147: TEdit;
    SpeedButton73: TSpeedButton;
    chkTransportador: TCheckBox;
    Label111: TLabel;
    edtCdCliente: TEdit;
    edtNmCliente: TEdit;
    SpeedButton79: TSpeedButton;
    Label110: TLabel;
    edtCdArea: TEdit;
    edtNmArea: TEdit;
    SpeedButton75: TSpeedButton;
    Label97: TLabel;
    Memo2: TMemo;
    SpeedButton70: TSpeedButton;
    Label101: TLabel;
    Edit143: TEdit;
    Edit148: TEdit;
    SpeedButton74: TSpeedButton;
    Label102: TLabel;
    Edit149: TEdit;
    Edit150: TEdit;
    Label103: TLabel;
    Edit151: TEdit;
    Edit152: TEdit;
    SpeedButton77: TSpeedButton;
    Label100: TLabel;
    Edit153: TEdit;
    Edit154: TEdit;
    SpeedButton78: TSpeedButton;
    Label112: TLabel;
    edt_E06_Cod_Cliente: TEdit;
    edt_E06_Nome_Cliente: TEdit;
    btn_E06_Cliente: TSpeedButton;
    Label113: TLabel;
    edt_E06_Cod_Tranp_Merc: TEdit;
    edt_E06_Nome_Tranp_Merc: TEdit;
    btn_E06_Tranp_Merc: TSpeedButton;
    Label104: TLabel;
    Memo3: TMemo;
    SpeedButton76: TSpeedButton;
    Label115: TLabel;
    edt_DFF_CD_UNID_NEG: TEdit;
    edt_DFF_NM_UNID_NEG: TEdit;
    btn_DFF_UNID_NEG: TSpeedButton;
    Label116: TLabel;
    edt_DFF_CD_PRODUTO: TEdit;
    edt_DFF_NM_PRODUTO: TEdit;
    Label117: TLabel;
    edt_DFF_CD_GRUPO: TEdit;
    edt_DFF_NM_GRUPO: TEdit;
    btn_DFF_GRUPO: TSpeedButton;
    Label118: TLabel;
    edt_DFF_CD_CLIENTE: TEdit;
    edt_DFF_NM_CLIENTE: TEdit;
    btn_DFF_CLIENTE: TSpeedButton;
    Label119: TLabel;
    edt_DFT_CD_UNID_NEG: TEdit;
    edt_DFT_NM_UNID_NEG: TEdit;
    btn_DFT_UNID_NEG: TSpeedButton;
    Label120: TLabel;
    edt_DFT_CD_PRODUTO: TEdit;
    edt_DFT_NM_PRODUTO: TEdit;
    Label121: TLabel;
    edt_DFT_CD_GRUPO: TEdit;
    edt_DFT_NM_GRUPO: TEdit;
    btn_DFT_GRUPO: TSpeedButton;
    Label122: TLabel;
    edt_DFT_CD_TRANSPORTADOR: TEdit;
    edt_DFT_NM_TRANSPORTADOR: TEdit;
    btn_DFT_TRANSPORTADOR: TSpeedButton;
    Label123: TLabel;
    btn_DFJ_UNID_NEG: TSpeedButton;
    Label124: TLabel;
    Label125: TLabel;
    btn_DFJ_GRUPO: TSpeedButton;
    edt_DFJ_CD_UNID_NEG: TEdit;
    edt_DFJ_NM_UNID_NEG: TEdit;
    edt_DFJ_CD_PRODUTO: TEdit;
    edt_DFJ_NM_PRODUTO: TEdit;
    edt_DFJ_CD_GRUPO: TEdit;
    edt_DFJ_NM_GRUPO: TEdit;
    Label126: TLabel;
    edt_FDT_CD_UNID_NEG: TEdit;
    edt_FDT_NM_UNID_NEG: TEdit;
    btn_FDT_UNID_NEG: TSpeedButton;
    Label127: TLabel;
    Label128: TLabel;
    edt_FDT_CD_GRUPO: TEdit;
    edt_FDT_NM_GRUPO: TEdit;
    btn_FDT_GRUPO: TSpeedButton;
    Label129: TLabel;
    edt_FDT_CD_CLIENTE: TEdit;
    edt_FDT_NM_CLIENTE: TEdit;
    btn_FDT_CLIENTE: TSpeedButton;
    lblFDTTransportador: TLabel;
    edt_FDT_CD_TRANSPORTADOR: TEdit;
    edt_FDT_NM_TRANSPORTADOR: TEdit;
    btn_FDT_TRANSPORTADOR: TSpeedButton;
    edt_FDT_CD_PRODUTO: TEdit;
    edt_FDT_NM_PRODUTO: TEdit;
    dbchkIN_SABADO: TDBCheckBox;
    dbchkIN_DOMINGO: TDBCheckBox;
    Label130: TLabel;
    btn_DFA_UNID_NEG: TSpeedButton;
    Label131: TLabel;
    Label132: TLabel;
    btn_DFA_GRUPO: TSpeedButton;
    edt_DFA_CD_UNID_NEG: TEdit;
    edt_DFA_NM_UNID_NEG: TEdit;
    edt_DFA_CD_PRODUTO: TEdit;
    edt_DFA_NM_PRODUTO: TEdit;
    edt_DFA_CD_GRUPO: TEdit;
    edt_DFA_NM_GRUPO: TEdit;
    Label134: TLabel;
    edt_DFA_CD_CLIENTE: TEdit;
    edt_DFA_NM_CLIENTE: TEdit;
    edt_DFA_CLIENTE: TSpeedButton;
    Label133: TLabel;
    edt_DFA_CD_ARMADOR: TEdit;
    edt_DFA_NM_ARMADOR: TEdit;
    edt_DFA_ARMADOR: TSpeedButton;
    Label136: TLabel;
    btn_DF0_UNID_NEG: TSpeedButton;
    Label137: TLabel;
    Label138: TLabel;
    btn_DF0_GRUPO: TSpeedButton;
    edt_DF0_CD_UNID_NEG: TEdit;
    edt_DF0_CD_PRODUTO: TEdit;
    edt_DF0_NM_PRODUTO: TEdit;
    edt_DF0_CD_GRUPO: TEdit;
    edt_DF0_NM_GRUPO: TEdit;
    Label139: TLabel;
    edt_DF0_CD_CLIENTE: TEdit;
    edt_DF0_NM_CLIENTE: TEdit;
    btn_DF0_CLIENTE: TSpeedButton;
    Label141: TLabel;
    edt_DF0_CD_TERMINAL: TEdit;
    edt_DF0_NM_TERMINAL: TEdit;
    btn_DF0_TERMINAL: TSpeedButton;
    edt_DF0_NM_UNID_NEG: TEdit;
    Label135: TLabel;
    SpeedButton80: TSpeedButton;
    Label140: TLabel;
    Label142: TLabel;
    SpeedButton81: TSpeedButton;
    Label143: TLabel;
    SpeedButton82: TSpeedButton;
    Label144: TLabel;
    SpeedButton83: TSpeedButton;
    Label145: TLabel;
    SpeedButton84: TSpeedButton;
    Label146: TLabel;
    SpeedButton85: TSpeedButton;
    Edit155: TEdit;
    Edit156: TEdit;
    Edit157: TEdit;
    Edit158: TEdit;
    Edit159: TEdit;
    Edit160: TEdit;
    Edit161: TEdit;
    Edit162: TEdit;
    Edit163: TEdit;
    Edit164: TEdit;
    Edit165: TEdit;
    Edit166: TEdit;
    Memo4: TMemo;
    Panel15: TPanel;
    Label1: TLabel;
    Label114: TLabel;
    Label147: TLabel;
    edt_chave: TEdit;
    edtDescricao: TEdit;
    btnPesquisar: TBitBtn;
    chk_ativo_disparo: TCheckBox;
    pnlEdi: TPanel;
    Label107: TLabel;
    btn_EDI_GRUPO: TSpeedButton;
    Label105: TLabel;
    btn_EDI_EVENTO: TSpeedButton;
    Label106: TLabel;
    btn_EDI_PRODUTO: TSpeedButton;
    edt_EDI_NM_GRUPO: TEdit;
    edt_EDI_CD_GRUPO: TEdit;
    rg_EDI_extensao: TRadioGroup;
    edt_edi_extensao: TEdit;
    rg_EDI_envio: TRadioGroup;
    edt_EDI_path: TEdit;
    edt_EDI_CD_EVENTO: TEdit;
    edt_EDI_NM_EVENTO: TEdit;
    edt_EDI_CD_PRODUTO: TEdit;
    edt_EDI_NM_PRODUTO: TEdit;
    GroupBox1: TGroupBox;
    Label108: TLabel;
    Label109: TLabel;
    dbVAR_ARQ: TDBEdit;
    chkEnviarParaDigitalizacao: TCheckBox;
    pnlTipoArquivo: TPanel;
    edtTPDocto: TEdit;
    edtDocumento: TEdit;
    spTpArquivo: TSpeedButton;
    Label148: TLabel;
    dbmCorpoEmail: TDBMemo;
    Label149: TLabel;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_co_usuarioClick(Sender: TObject);
    procedure pgctrl_documentoChange(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Aplicarhorriosparatodososusurios1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure dbnvgClick(Sender: TObject; Button: TNavigateBtn);
    procedure SpeedButton30Click(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure Edit75Exit(Sender: TObject);
    procedure SpeedButton38Click(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure Edit76Exit(Sender: TObject);
    procedure Edit79KeyPress(Sender: TObject; var Key: Char);
    procedure lstDisponiveisDblClick(Sender: TObject);
    procedure lstSelecionadosDblClick(Sender: TObject);
    procedure CortarResultado1Click(Sender: TObject);
    procedure InserirCampoLookup1Click(Sender: TObject);
    procedure Edit80KeyPress(Sender: TObject; var Key: Char);
    procedure Edit83KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure edt_chaveChange(Sender: TObject);
    procedure btnReconfiguraTudoClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure DefinircomoChaveparaLookUp1Click(Sender: TObject);
    procedure Moverpcima1Click(Sender: TObject);
    procedure Moverpbaixo1Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure btn20Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure btn16Click(Sender: TObject);
    procedure btn17Click(Sender: TObject);
    procedure btn19Click(Sender: TObject);
    procedure btn21Click(Sender: TObject);
    procedure btn22Click(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure SpeedButton41Click(Sender: TObject);
    procedure SpeedButton42Click(Sender: TObject);
    procedure pgctrl_documentoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure SpeedButton43Click(Sender: TObject);
    procedure SpeedButton44Click(Sender: TObject);
    procedure SpeedButton45Click(Sender: TObject);
    procedure Edit_Exit(Sender: TObject);
    procedure Edit97Change(Sender: TObject);
    procedure SpeedButton49Click(Sender: TObject);
    procedure SpeedButton53Click(Sender: TObject);
    procedure SpeedButton48Click(Sender: TObject);
    procedure SpeedButton47Click(Sender: TObject);
    procedure SpeedButton51Click(Sender: TObject);
    procedure SpeedButton54Click(Sender: TObject);
    procedure SpeedButton52Click(Sender: TObject);
    procedure SpeedButton50Click(Sender: TObject);
    procedure rdQuebra0MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton55Click(Sender: TObject);
    procedure SpeedButton56Click(Sender: TObject);
    procedure SpeedButton57Click(Sender: TObject);
    procedure SpeedButton58Click(Sender: TObject);
    procedure mmo1Change(Sender: TObject);
    procedure nb_configPageChanged(Sender: TObject);
    procedure file_pathButtonClick(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure SpeedButton60Click(Sender: TObject);
    procedure dbedtModalExit(Sender: TObject);
    procedure SpeedButton61Click(Sender: TObject);
    procedure SpeedButton62Click(Sender: TObject);
    procedure Edit125Exit(Sender: TObject);
    procedure mmSqlChange(Sender: TObject);
    procedure SpeedButton63Click(Sender: TObject);
    procedure SpeedButton64Click(Sender: TObject);
    procedure SpeedButton65Click(Sender: TObject);
    procedure SpeedButton66Click(Sender: TObject);
    procedure SpeedButton67Click(Sender: TObject);
    procedure Edit135Change(Sender: TObject);
    procedure pnl_btn_agDblClick(Sender: TObject);
    procedure SpeedButton68Click(Sender: TObject);
    procedure SpeedButton69Click(Sender: TObject);
    procedure SpeedButton71Click(Sender: TObject);
    procedure SpeedButton70Click(Sender: TObject);
    procedure Edit144Change(Sender: TObject);
    procedure Edit146Change(Sender: TObject);
    procedure SpeedButton74Click(Sender: TObject);
    procedure SpeedButton77Click(Sender: TObject);
    procedure SpeedButton78Click(Sender: TObject);
    procedure SpeedButton76Click(Sender: TObject);
    procedure Edit153Exit(Sender: TObject);
    procedure habilita_botoes(Sender: TObject);
    procedure rg_EDI_extensaoClick(Sender: TObject);
    procedure rg_EDI_envioClick(Sender: TObject);
    procedure btn_EDI_GRUPOClick(Sender: TObject);
    procedure btn_EDI_EVENTOClick(Sender: TObject);
    procedure btn_EDI_PRODUTOClick(Sender: TObject);
    procedure edtCdAreaChange(Sender: TObject);
    procedure edtCdClienteChange(Sender: TObject);
    procedure btn_E06_ClienteClick(Sender: TObject);
    procedure btn_E06_Tranp_MercClick(Sender: TObject);
    procedure btn_DFF_UNID_NEGClick(Sender: TObject);
    procedure btn_DFF_GRUPOClick(Sender: TObject);
    procedure btn_DFF_CLIENTEClick(Sender: TObject);
    procedure btn_DFT_UNID_NEGClick(Sender: TObject);
    procedure btn_DFT_GRUPOClick(Sender: TObject);
    procedure btn_DFT_TRANSPORTADORClick(Sender: TObject);
    procedure edt_DFJ_CD_UNID_NEGChange(Sender: TObject);
    procedure edt_DFJ_CD_GRUPOChange(Sender: TObject);
    procedure btn_FDT_UNID_NEGClick(Sender: TObject);
    procedure btn_FDT_GRUPOClick(Sender: TObject);
    procedure btn_FDT_TRANSPORTADORClick(Sender: TObject);
    procedure btn_FDT_CLIENTEClick(Sender: TObject);
    procedure btn_DFA_UNID_NEGClick(Sender: TObject);
    procedure btn_DFA_GRUPOClick(Sender: TObject);
    procedure edt_DFA_CLIENTEClick(Sender: TObject);
    procedure edt_DFA_ARMADORClick(Sender: TObject);
    procedure btn_DF0_TERMINALClick(Sender: TObject);
    procedure btn_DF0_GRUPOClick(Sender: TObject);
    procedure btn_DF0_UNID_NEGClick(Sender: TObject);
    procedure btn_DF0_CLIENTEClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure chk_ativo_disparoClick(Sender: TObject);
    procedure spTpArquivoClick(Sender: TObject);
    procedure chkEnviarParaDigitalizacaoClick(Sender: TObject);
    procedure edtTPDoctoKeyPress(Sender: TObject; var Key: Char);
  private

    QueryFiltrada : Boolean;
    procedure PreparaAgendaEDI(pUsuario : String);
    procedure CompletaCodigo(var pEdit: TEdit);
    procedure HabilitaPaineis;
    procedure RemoverFiltro;
    procedure HabilitaPanelTipoDoc;
    procedure ConfiguraParametroAtivo(somenteAtivo : boolean);

    { Private declarations }
  public
    vStrSelecionados, vStrSubstring, vOrdenadoPor, vStrConsultaOnLine : string;
    procedure AtualizaNB;
    { Public declarations }
  end;

var
  frm_relatorios_mail_aut: Tfrm_relatorios_mail_aut;

implementation

{$R *.dfm}

uses dRelatoriosMailAut, ConsOnLineEx, PGGP001, GSMLIB, PGGP017;

procedure Tfrm_relatorios_mail_aut.btn_incluirClick(Sender: TObject);
begin
  RemoverFiltro;
  with datm_relatorios_mail_aut do
  begin
    if (pgctrl_documento.ActivePage = ts_lista) or (pgctrl_documento.ActivePage = ts_dados) then
    begin
      pgctrl_documento.ActivePage := ts_dados;
      dbedt_descricao.SetFocus;

      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('SELECT MAX(CD_RELATORIO) + 1 FROM TRELATORIOS_MAIL_AUT');
        Open;
        qry_relatorios_mail_aut_.Insert;
        qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString   := FStrZero(Fields[0].AsString,5);
        qry_relatorios_mail_aut_.FieldByName('IN_ATIVO').AsString       := '0';
        qry_relatorios_mail_aut_.FieldByName('IN_FIMDESEMANA').AsString := '0';
        Close;
        Free;
      end;
    end
    else
    if pgctrl_documento.ActivePage = ts_usuarios then
    begin
      Shape2.SendToBack;
      DBEdit3.Enabled := True;
      btn_co_usuario.Enabled := True;
      DBEdit3.SetFocus;
      qry_relatorios_mail_aut_usuarios_.Insert;

      if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'IVP' then
      begin
        MaskEdit1.Enabled := False;
        edt_horarios.Enabled := False;
      end;
    end;
  end;
end;

procedure Tfrm_relatorios_mail_aut.PreparaAgendaEDI(pUsuario : String);
var
  i : Integer;
  vTipoEDI : string;
begin
  with datm_relatorios_mail_aut do
  begin
    if (qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'IVP') or (qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'IVL') then
      Exit;

    // verifica se o relatório está ativo ou não
    if qry_relatorios_mail_aut_.FieldByName('IN_ATIVO').AsString = '1' then
    begin
      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        // limpa todas as entradas na agenda para esse relatório, reconfigurando-a por inteiro
        SQL.Clear;
        if pUsuario <> '' then
        begin
          SQL.Add('DELETE FROM TFILA_AGENDA');
          SQL.Add('WHERE NM_PATH_EDI LIKE ''%CD_RELATORIO="' + qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '"%''');
          SQL.Add('AND NM_PATH_EDI LIKE ''%CD_USUARIO="' + pUsuario + '"%''');
        end else
          SQL.Add('DELETE FROM TFILA_AGENDA WHERE NM_PATH_EDI LIKE ''%CD_RELATORIO="' + qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '"%''');
        ExecSQL;
        // começa a varrer a tabela de usuarios para inserir os registros de agenda na TFILA_AGENDA
        qry_relatorios_mail_aut_usuarios_.Close;
        qry_relatorios_mail_aut_usuarios_.ParamByName('CD_RELATORIO').AsString := qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString;
        qry_relatorios_mail_aut_usuarios_.Prepare;
        qry_relatorios_mail_aut_usuarios_.Open;
        qry_relatorios_mail_aut_usuarios_.First;
        while not qry_relatorios_mail_aut_usuarios_.EOF do
        begin
          if ( pUsuario = '' ) or ( pUsuario = qry_relatorios_mail_aut_usuarios_.FieldByName('CD_USUARIO').AsString ) then
          begin
            for i := 1 to ContaOcorrencias(qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString,'/') do
            begin
              // insere na TFILA_AGENDA passando o numero do relatorio e o usuario.
              SQL.Clear;

              if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E01' then
                 vTipoEDI := 'C'
              else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'EDI' then
                 vTipoEDI := 'E'
              else
                 vTipoEDI := 'M';

              if StrToTime(ExtractWord(i,qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString,'/')) > StrToTime(FormatDateTime('hh:nn',now)) then
                SQL.Add('INSERT INTO TFILA_AGENDA VALUES (''' + ConsultaLookupSQL('SELECT MAX(CD_AGENDA) + 1 AS CD_AGENDA FROM TFILA_AGENDA', 'CD_AGENDA') + ''',''' + vTipoEDI + ''',''CD_RELATORIO="' + qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '"/CD_USUARIO="' + qry_relatorios_mail_aut_usuarios_.FieldByName('CD_USUARIO').AsString + '"/'',''1'','''',''24'',''' + ExtractWord(i,qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString,'/') + ''',''H'',''00:00'',GETDATE()-1)')
              else SQL.Add('INSERT INTO TFILA_AGENDA VALUES (''' + ConsultaLookupSQL('SELECT MAX(CD_AGENDA) + 1 AS CD_AGENDA FROM TFILA_AGENDA', 'CD_AGENDA') + ''',''' + vTipoEDI + ''',''CD_RELATORIO="' + qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '"/CD_USUARIO="' + qry_relatorios_mail_aut_usuarios_.FieldByName('CD_USUARIO').AsString + '"/'',''1'','''',''24'',''' + ExtractWord(i,qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString,'/') + ''',''H'',''00:00'',GETDATE())');

              ExecSQL;
            end;
          end;
          qry_relatorios_mail_aut_usuarios_.Next;
        end;
        Free;
      end;
    end else begin
      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        // caso fique inativo, ele exclui da tabela TFILA_AGENDA, para que o EDI não mais envie mails sobre esse relatório
        SQL.Clear;
        SQL.Add('DELETE FROM TFILA_AGENDA WHERE NM_PATH_EDI LIKE ''%CD_RELATORIO="' + qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '"%''');
        ExecSQL;
        Free;
      end;
    end;
  end;
end;

procedure Tfrm_relatorios_mail_aut.btn_salvarClick(Sender: TObject);
var
  vStrAux, in_email_atendente,in_email_contato,in_email_transportador : string;
  i : Integer;
  vNivel : string;
begin

  for i:=0 to ContaOcorrencias(edt_horarios.Text, '/') - 1 do
  begin
    try
      StrToTime(ExtractWord(i+1,edt_horarios.Text,'/'));
    except
      BoxMensagem('Existem datas inválidas no campo "Horários de Envio". Favor verificar.',3);
      Exit;
    end;
  end;
  if dbEdit2.Text='EDI' then  begin
     if file_path.Text='' then begin
        ShowMessage('Informe o Documento modelo de integração');
        file_path.SetFocus;
        exit;
     end;
     if datm_relatorios_mail_aut.qry_relatorios_mail_aut_VARIAVEL_CARTAS_CONFIG.AsString='' then begin
        ShowMessage('Informe o nome da variavel para construção do nome do arquivo EDI a ser gerado');
        dbVAR_ARQ.SetFocus;
        exit;
     end;
  end;


  with datm_relatorios_mail_aut do
  begin
    if (pgctrl_documento.ActivePage = ts_lista) or (pgctrl_documento.ActivePage = ts_dados) then
    begin
      qry_relatorios_mail_aut_IN_GRAVAR_DIGITALIZACAO.AsBoolean :=false;
      
      //limpar quando não for tipo EDI
      qry_relatorios_mail_aut_CD_TP_DOCTO_GRAVAR.AsString       :='';
      qry_relatorios_mail_aut_TX_MODELO.AsString                := file_path.Text;

      if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '001' then
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Edit5.Text  + '/' + Edit3.Text + '/'
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '002' then
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Edit8.Text  + '/' + Edit9.Text + '/' + Edit11.Text + '/' + Edit71.Text + '/' + Edit73.Text + '/' + Edt2.Text + '/' + Edt4.Text + '/'+ Edit127.Text + '/'+Edit128.Text + '/'+Edit133.Text + '/'
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '003' then
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Edit14.Text + '/' + Edit17.Text + '/' + Edit18.Text + '/' + Edit20.Text + '/' + Edit22.Text + '/' + Edit24.Text + '/' + Edit26.Text + '/' + ed2.Text + '/' + ed4.Text + '/'
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '004' then
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Edit28.Text + '/' + Edit31.Text + '/' + Edit32.Text + '/' + Edit34.Text + '/' + Edit36.Text + '/' + Edit38.Text + '/' + Edit40.Text + '/' + ed6.Text + '/' + ed8.Text + '/'
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '005' then
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Edit42.Text + '/' + Edit45.Text + '/' + Edit46.Text + '/' + Edit48.Text + '/' + Edit50.Text + '/' + Edit52.Text + '/' + Edit54.Text + '/' + ed10.Text + '/' + ed12.Text + '/'
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '006' then
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Edit60.Text + '/' + Edit62.Text + '/' + Edit67.Text + '/' + Edit63.Text + '/'
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '007' then
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Edit56.Text + '/' + Edit58.Text + '/' + Edit69.Text + '/' + Edit65.Text + '/'
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '008' then
      begin
        if rb1.Checked then // modo facil
        begin
          qry_relatorios_mail_aut_.Post;
          vStrSelecionados := '';
          for i := 0 to LstSelecionados.Items.Count - 1 do
          begin
            if Trim(LstSelecionados.Items.Strings[i]) <> '' then
            begin
              if vStrSelecionados = '' then
                vStrSelecionados := LstSelecionados.Items.Strings[i]
              else vStrSelecionados := vStrSelecionados + ';' + LstSelecionados.Items.Strings[i];
            end;
          end;
          if vStrSelecionados <> '' then
            vStrSelecionados := vStrSelecionados + ';';
          with TQuery.Create(Application) do
          begin
            DatabaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('UPDATE TRELATORIOS_MAIL_AUT SET TX_CONFIGURACAO = ''' + StringReplace(('0/' + Ed24.Text + '/' + Ed25.Text + '/' + Edit75.Text + '/' + Edit76.Text + '/' + Edit77.Text + '/' + Edit78.Text + '/' + vStrSelecionados + '/'),'''','"',[rfReplaceAll]) + '''');
            SQL.Add(' WHERE CD_RELATORIO = ''' + qry_relatorios_mail_aut_CD_RELATORIO.AsString + '''');
            ExecSQL;
            Free;
          end;
        end else begin
          qry_relatorios_mail_aut_.Post;
          with TQuery.Create(Application) do
          begin
            DatabaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('UPDATE TRELATORIOS_MAIL_AUT SET TX_CONFIGURACAO = ''' + StringReplace(('1/' + Ed24.Text + '/' + Ed25.Text + '/' + mmo1.Lines.Text + '/'),'''','"',[rfReplaceAll]) + '''');
            SQL.Add(' WHERE CD_RELATORIO = ''' + qry_relatorios_mail_aut_CD_RELATORIO.AsString + '''');
            ExecSQL;
            Free;
          end;
        end;
      end
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'IVP' then
      begin
        if chkEspecifico.Checked then
          qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString    :=  Ed13.Text + '/' + Ed15.Text + '/' + Ed17.Text + '/' + Ed19.Text + '/' + Ed21.Text + '/' + Edit114.Text + '/' + Edit115.Text + '/'+'1/'
        else qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Ed13.Text + '/' + Ed15.Text + '/' + Ed17.Text + '/' + Ed19.Text + '/' + Ed21.Text + '/' + Edit114.Text + '/' + Edit115.Text + '/'+'0/';
      end
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'IVL' then
      begin
          qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString    :=  Edit144.Text + '/' + Edit146.Text + '/';
      end
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'EDI' then // Integração Automatica - by carlos 05/12/2011
      begin
        if edt_EDI_extensao.Text='' then
           edt_EDI_extensao.Text:='XXX';
        if rg_EDI_envio.ItemIndex=0 then
           edt_EDI_path.Text:=''
        else
           if edt_EDI_path.Text='' then
              edt_EDI_path.Text:='C:\';

        edt_EDI_path.Text:=StringReplace(edt_EDI_path.Text,'/','\',[rfReplaceAll]);


        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString          := edt_EDI_CD_GRUPO.Text   + '/' +
                                                                     edt_EDI_CD_PRODUTO.Text + '/' +
                                                                     edt_EDI_CD_EVENTO.Text  + '/' +
                                                                     IntToStr(rg_EDI_extensao.ItemIndex)+ '/' +
                                                                     edt_edi_extensao.Text + '/' +
                                                                     IntToStr(rg_EDI_envio.ItemIndex) + '/' +
                                                                     edt_EDI_path.Text + '/';

        qry_relatorios_mail_aut_IN_GRAVAR_DIGITALIZACAO.AsBoolean := chkEnviarParaDigitalizacao.checked;
        qry_relatorios_mail_aut_CD_TP_DOCTO_GRAVAR.AsString       := edtTPDocto.text;
      end
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E01' then
        begin
          if chkAtendente.Checked     then in_email_atendente     :='1' else in_email_atendente     :='0';
          if chkContato.Checked       then in_email_contato       :='1' else in_email_contato       :='0';
          if chkTransportador.Checked then in_email_transportador :='1' else in_email_transportador :='0';

          qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Ed40.Text + '/' + Ed29.Text + '/' + Ed31.Text + '/' + Ed33.Text + '/' + Ed35.Text + '/' + Ed37.Text + '/' + Ed39.Text + '/' + Edit121.Text + '/'+mmSql.Lines.Text+ '/'+ Edit135.Text + '/'+ in_email_atendente + '/'+ in_email_contato + '/'+ in_email_transportador + '/';
          qry_relatorios_mail_aut_TX_MODELO.AsString := file_path.Text;
//          if dbedtModal.Text = '' then
//            dbedtModal.Text := '10';
        end
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E02' then
      begin
        if chk1.Checked then vNivel := vNivel + '1';
        if chk2.Checked then vNivel := vNivel + '2';
        if chk3.Checked then vNivel := vNivel + '3';
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Edit85.Text + '/' + Edit87.Text + '/' + vNivel + '/' + Edit89.Text + '/' + Edit92.Text + '/' + Edit94.Text + '/' + Edit125.Text + '/' + Edit131.Text + '/'+ Edit133.Text + '/';
      end
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E03' then // ponto de controle - clientes
      begin
        if Copy(Memo1.Text,Length(Trim(Memo1.Text)),1) <> ';' then
          Memo1.Text := Memo1.Text + ';';
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Edit95.Text + '/' + Edit97.Text + '/' + Edit103.Text + '/' + Edit110.Text + '/' + SpinEdit1.Text + '/' + Memo1.Text + '/';
      end
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E04' then // ponto de controle - status
      begin
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Edit99.Text + '/' + Edit101.Text + '/' + Edit105.Text + '/' + Edit111.Text + '/' + Edit107.Text + '/';
        if rdQuebra0.Checked then
          qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString + '0/'
        else if rdQuebra1.Checked then
          qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString + '1/'
        else if rdQuebra2.Checked then
          qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString + '2/';
        if rdOrdena0.Checked then
          qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString + '0/'
        else if rdOrdena1.Checked then
          qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString + '1/';
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString + Edit118.Text + '/' + Edit120.Text + '/';
      end
      else if (qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E05') or
              (qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E08') or
              (qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E09') or
              (qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E10') or
              (qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E11') or
              (qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E18')
              then // ponto de controle - clientes
      begin
        if Copy(Memo2.Text,Length(Trim(Memo2.Text)),1) <> ';' then
          Memo2.Text := Memo2.Text + ';';
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Edit137.Text + '/' + Edit139.Text + '/' + Edit141.Text + '/' + edtCdCliente.Text + '/' + edtCdArea.Text + '/' + Memo2.Text + '/';
      end
      else if (qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E06') or
              (qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E07') or // followup Daily - clientes
              (qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E14') or  // followup Daily - Basf
              (qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E15') then // followup Daily - Purina
      begin
        if (edit153.Text='') or (edit154.Text='') then begin
           ShowMessage('importador Inválido!!!');
           exit;
        end;
        with TQuery.Create(nil) do begin
           DatabaseName := 'DBBROKER';
           SQL.Clear;
           SQL.Add(' select Isnull(P.CD_IDIOMA_PADRAO,"9") ');
           SQL.Add(' from TEMPRESA_EST E (NOLOCK) ');
           SQL.Add(' JOIN TPAIS        P (NOLOCK) ON E.CD_PAIS=P.CODIGO ');
           SQL.Add(' where e.CD_EMPRESA="'+edit153.Text+'"');
           Open;
           if ( fields[0].AsString <> '0') and (fields[0].AsString<>'1') and  (fields[0].AsString<>'2')
           then begin
              ShowMessage('Idioma Padrão do País não Cadastrado !!! --> '+fields[0].AsString);
              Edit153.Text:='';
              Edit153.SetFocus;
              exit;
           end;
           Close;
           Free;
        end;

        if Copy(Memo3.Text,Length(Trim(Memo3.Text)),1) <> ';' then
          Memo3.Text := Memo3.Text + ';';
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Edit143.Text + '/' + Edit149.Text + '/' + Edit151.Text + '/'+ Edit153.Text + '/'  + Memo3.Text + '/' +
           edt_E06_Cod_Cliente.Text + '/' + edt_E06_Cod_Tranp_Merc.Text + '/'; // Dois campos incluídos novos para filtrar por Planta e Transportador (Nestlé) - Michel - 20/06/2013
      end
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'DFF' then
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := edt_DFF_CD_UNID_NEG.Text + '/' + edt_DFF_CD_PRODUTO.Text + '/' + edt_DFF_CD_GRUPO.Text + '/' + edt_DFF_CD_CLIENTE.Text + '/'
      else if (qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'DFT') or (qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'DFM') then
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := edt_DFT_CD_UNID_NEG.Text + '/' + edt_DFT_CD_PRODUTO.Text + '/' + edt_DFT_CD_GRUPO.Text + '/' + edt_DFT_CD_TRANSPORTADOR.Text + '/'
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'DFA' then
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := edt_DFA_CD_UNID_NEG.Text + '/' + edt_DFA_CD_PRODUTO.Text + '/' + edt_DFA_CD_GRUPO.Text + '/' + edt_DFA_CD_CLIENTE.Text + '/' + edt_DFA_CD_ARMADOR.Text + '/'
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'DF0' then
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := edt_DF0_CD_UNID_NEG.Text + '/' + edt_DF0_CD_PRODUTO.Text + '/' + edt_DF0_CD_GRUPO.Text + '/' + edt_DF0_CD_CLIENTE.Text + '/' + edt_DF0_CD_TERMINAL.Text + '/'
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'DFJ' then
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := edt_DFJ_CD_UNID_NEG.Text + '/' + edt_DFJ_CD_PRODUTO.Text + '/' + edt_DFJ_CD_GRUPO.Text + '/'
      else if qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'FDT' then
        qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := edt_FDT_CD_UNID_NEG.Text + '/' + edt_FDT_CD_PRODUTO.Text + '/' + edt_FDT_CD_GRUPO.Text + '/' + edt_FDT_CD_CLIENTE.Text + '/' + edt_FDT_CD_TRANSPORTADOR.Text + '/';

      if qry_relatorios_mail_aut_.state in [dsEdit, dsInsert] then
        qry_relatorios_mail_aut_.Post;

      PreparaAgendaEDI('');

      vStrAux := qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString;
      qry_relatorios_mail_aut_.Close;
      qry_relatorios_mail_aut_.sql.text := GetSqlRelatorios;

      chk_ativo_disparo.OnClick := nil;
      chk_ativo_disparo.Checked := false;
      chk_ativo_disparo.OnClick := chk_ativo_disparoClick;

      ConfiguraParametroAtivo(false);
      qry_relatorios_mail_aut_.Prepare;
      qry_relatorios_mail_aut_.Open;
      qry_relatorios_mail_aut_.Locate('CD_RELATORIO',vStrAux,[]);
    end
    else if pgctrl_documento.ActivePage = ts_usuarios then
    begin
      qry_relatorios_mail_aut_usuarios_CD_RELATORIO.AsString      := qry_relatorios_mail_aut_CD_RELATORIO.AsString;
      qry_relatorios_mail_aut_usuarios_TX_HORARIOS_ENVIO.AsString := edt_horarios.Text;
      qry_relatorios_mail_aut_usuarios_.Post;

      PreparaAgendaEDI(qry_relatorios_mail_aut_usuarios_.FieldByName('CD_USUARIO').AsString);

      DBEdit3.Enabled := False;
      btn_co_usuario.Enabled := False;

      qry_relatorios_mail_aut_usuarios_.Close;
      qry_relatorios_mail_aut_usuarios_.ParamByName('CD_RELATORIO').AsString := qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString;
      qry_relatorios_mail_aut_usuarios_.Prepare;
      qry_relatorios_mail_aut_usuarios_.Open;
    end;
  end;
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton2Click(Sender: TObject);
var strCD_TIPO_RELATORIO:String;
begin
  if Sender is TSpeedButton then
  begin
    strCD_TIPO_RELATORIO:=ConsultaOnLineEx('TTP_RELATORIOS_MAIL_AUT','Tipos de Relatórios',['CD_TIPO_RELATORIO','NM_TIPO_RELATORIO'],['Código','Nome'],'CD_TIPO_RELATORIO',nil);
    if pgctrl_documento.TabIndex = 1 then
    begin
      if strCD_TIPO_RELATORIO='E01' then
      begin
         ShowMessage('Este tipo de alerta (E01) foi desativado desse modulo e deverá ser lançado'
                    +#13+'no cadastro de grupos de clientes na aba denominada "DISPARO AUTOMATICO EMAIL".');
         exit;
      end;
    end;
    
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString := strCD_TIPO_RELATORIO;

    if pgctrl_documento.TabIndex = 1 then
    begin
      if dbEdit2.Text='E01' then
      begin
         ShowMessage('Este tipo de alerta (E01) foi desativado desse modulo e deverá ser lançado'
                     +#13+'no cadastro de grupos de clientes na aba denominada "DISPARO AUTOMATICO EMAIL".');
         btn_cancelar.Click;
         exit;
      end;
    end;

  end
  else
    Edit7.Text := ConsultaLookUP('TTP_RELATORIOS_MAIL_AUT','CD_TIPO_RELATORIO', DBEdit2.Text,'NM_TIPO_RELATORIO');

  habilitaPaineis;
end;

procedure Tfrm_relatorios_mail_aut.AtualizaNB;
var
  i : Integer;
  in_email_atendente,in_email_contato,in_email_transportador:String;
begin
  Edit5.Clear;   Edit3.Clear;   Edit8.Clear;   Edit9.Clear;   Edit11.Clear;  Edit71.Clear;  Edit73.Clear;
  Edit14.Clear;  Edit17.Clear;  Edit18.Clear;  Edit20.Clear;  Edit22.Clear;  Edit24.Clear;  Edit26.Clear;
  Edit28.Clear;  Edit31.Clear;  Edit32.Clear;  Edit34.Clear;  Edit36.Clear;  Edit38.Clear;  Edit40.Clear;
  Edit42.Clear;  Edit45.Clear;  Edit46.Clear;  Edit48.Clear;  Edit50.Clear;  Edit52.Clear;  Edit54.Clear;
  Edit60.Clear;  Edit62.Clear;  Edit67.Clear;  Edit63.Clear;  Edit56.Clear;  Edit58.Clear;  Edit69.Clear;
  Edit65.Clear;  Edit75.Clear;  Edit76.Clear;  Edit77.Clear;  Edit78.Clear;  Ed2.Clear;     Ed4.Clear;
  Ed6.Clear;     Ed8.Clear;     Ed10.Clear;    Ed12.Clear;    Ed13.Clear;    Ed15.Clear;    Ed17.Clear;
  Ed19.Clear;    Ed21.Clear;    edt2.Clear;    edt4.Clear;    Edit85.Clear;  Edit86.Clear;  Edit87.Clear;
  Edit88.Clear;  Edit89.Clear;  Edit90.Clear;  Edit91.Clear;  Edit92.Clear;  Edit95.Clear;  Edit96.Clear;
  Edit97.Clear;  Edit98.Clear;  Edit103.Clear; Edit104.Clear; Edit110.Clear; Edit109.Clear; Edit99.Clear;
  Edit100.Clear; Edit101.Clear; Edit102.Clear; Edit105.Clear; Edit106.Clear; Edit107.Clear; Edit108.Clear;
  Edit111.Clear; Edit112.Clear; Edit133.Clear; Edit137.Clear; Edit139.Clear; Edit141.Clear; edtCdCliente.Clear; edtCdArea.Clear;
  edt_EDI_CD_GRUPO.Clear; edt_EDI_CD_EVENTO.Clear;  edt_edi_extensao.Clear;  edt_EDI_path.Clear;
  edt_DFF_CD_UNID_NEG.Clear; edt_DFF_CD_GRUPO.Clear; edt_DFF_CD_CLIENTE.Clear;
  edt_DFT_CD_UNID_NEG.Clear; edt_DFT_CD_GRUPO.Clear; edt_DFT_CD_TRANSPORTADOR.Clear;
  edt_DFJ_CD_UNID_NEG.Clear; edt_DFJ_CD_GRUPO.Clear; 
                          
  rg_EDI_extensao.ItemIndex := 0;
  rg_EDI_envio.ItemIndex    := 0;

  chk1.Checked              := False;
  chk2.Checked              := False;
  chk3.Checked              := False;
  chkAtendente.Checked      := False;
  chkContato.Checked        := False;
  chkTransportador.Checked  := False;
  mmSql.Clear;
  mmSql.Visible             := False;
  lblSql.Visible            := False;

  if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '001' then
  begin
    Edit5.Text  := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit3.Text  := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '002' then
  begin
    Edit8.Text  := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit9.Text  := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit11.Text := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit71.Text := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit73.Text := ExtractWord(5,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt2.Text   := ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt4.Text   := ExtractWord(7,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edit127.Text := ExtractWord(8,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edit128.Text := ExtractWord(9,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edit133.Text := ExtractWord(10,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '003' then
  begin
    Edit14.Text := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit17.Text := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit18.Text := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit20.Text := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit22.Text := ExtractWord(5,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit24.Text := ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit26.Text := ExtractWord(7,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed2.Text    := ExtractWord(8,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed4.Text    := ExtractWord(9,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '004' then
  begin
    Edit28.Text := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit31.Text := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit32.Text := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit34.Text := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit36.Text := ExtractWord(5,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit38.Text := ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit40.Text := ExtractWord(7,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed6.Text    := ExtractWord(8,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed8.Text    := ExtractWord(9,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '005' then
  begin
    Edit42.Text := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit45.Text := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit46.Text := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit48.Text := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit50.Text := ExtractWord(5,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit52.Text := ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit54.Text := ExtractWord(7,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed10.Text   := ExtractWord(8,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed12.Text   := ExtractWord(9,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '006' then
  begin
    Edit60.Text := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit62.Text := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit67.Text := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit63.Text := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '007' then
  begin
    Edit56.Text := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit58.Text := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit69.Text := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit65.Text := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = '008' then
  begin
    if ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/') = '0' then
    begin
      rb1.Checked := True;
      Ed24.Text   := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
      Ed25.Text   := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
      Edit75.Text := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
      Edit76.Text := ExtractWord(5,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
      Edit77.Text := ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
      Edit78.Text := ExtractWord(7,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
      LstSelecionados.Items.Clear;
      for i := 1 to ContaOcorrencias(ExtractWord(7,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/'),';') + 1 do
        LstSelecionados.Items.Add(ExtractWord(i,ExtractWord(7,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/'),';'));
      lstDisponiveis.Items.Clear;
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('SELECT SC.NAME');
        SQL.Add('  FROM SYSOBJECTS SO, SYSCOLUMNS SC');
        SQL.Add(' WHERE SO.NAME = ''' + Edit75.Text + '''');
        SQL.Add('   AND SC.ID = SO.ID');
        Open;
        while not EOF do
        begin
          lstDisponiveis.Items.Add(Fields[0].AsString);
          Next;
        end;
        Close;
        Free;
      end;
    end else begin
      rb2.Checked     := True;
      Ed24.Text       := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
      Ed25.Text       := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
      mmo1.Lines.Text := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    end;
  end else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'IVP' then
  begin
    Ed13.Text := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed15.Text := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed17.Text := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed19.Text := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed21.Text := ExtractWord(5,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit114.Text := ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit115.Text := ExtractWord(7,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    chkEspecifico.Checked := ( ExtractWord(8,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/') = '1' );

  end else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'IVL' then
  begin
    Edit144.Text := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit146.Text := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'EDI' then
  begin
    edt_EDI_CD_GRUPO.Text     :=          ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_EDI_CD_PRODUTO.Text   :=          ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_EDI_CD_EVENTO.Text    :=          ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    rg_EDI_extensao.ItemIndex := strToInt(ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/'));
    edt_edi_extensao.Text     :=          ExtractWord(5,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    rg_EDI_envio.ItemIndex    := strToInt(ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/'));
    edt_EDI_path.Text         :=          ExtractWord(7,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    chkEnviarParaDigitalizacao.checked := datm_relatorios_mail_aut.qry_relatorios_mail_aut_IN_GRAVAR_DIGITALIZACAO.asBoolean;
    edtTPDocto.text := datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TP_DOCTO_GRAVAR.AsString;
    HabilitaPanelTipoDoc;    
  end else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E01' then
  begin
    Ed40.Text := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed29.Text := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed31.Text := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed33.Text := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed35.Text := ExtractWord(5,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed37.Text := ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Ed39.Text := ExtractWord(7,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit121.Text := ExtractWord(8,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    mmSql.Lines.Text := ExtractWord(9,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit135.Text := ExtractWord(10,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    in_email_atendente     := ExtractWord(11,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    in_email_contato       := ExtractWord(12,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    in_email_transportador := ExtractWord(13,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    chkAtendente.Checked      := (in_email_atendente='1');
    chkContato.Checked        := (in_email_contato  ='1');
    chkTransportador.Checked  := (in_email_transportador ='1');
    mmSql.Visible := True;
    lblSql.Visible := True;
  end else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E02' then
  begin
    Edit85.Text  := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit87.Text  := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    chk1.Checked := ( Pos('1',ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/')) > 0 );
    chk2.Checked := ( Pos('2',ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/')) > 0 );
    chk3.Checked := ( Pos('3',ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/')) > 0 );
    Edit89.Text  := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit92.Text  := ExtractWord(5,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit94.Text  := ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit125.Text := ExtractWord(7,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit131.Text := ExtractWord(8,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E03' then // ponto de controle - clientes
  begin
    Edit95.Text       := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit97.Text       := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit103.Text      := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit110.Text      := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    SpinEdit1.Text    := ExtractWord(5,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Memo1.Text        := ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E04' then // ponto de controle - status
  begin
    Edit99.Text       := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit101.Text      := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit105.Text      := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit111.Text      := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit107.Text      := ExtractWord(5,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    rdQuebra0.Checked := ( ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/') = '0' );
    rdQuebra1.Checked := ( ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/') = '1' );
    rdQuebra2.Checked := ( ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/') = '2' );
    rdOrdena0.Checked := ( ExtractWord(7,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/') = '0' );
    rdOrdena1.Checked := ( ExtractWord(7,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/') = '1' );
    Edit118.Text      := ExtractWord(8,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit120.Text      := ExtractWord(9,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end else if (datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E05') or
              (datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E08') or
              (datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E09') or
              (datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E10') or
              (datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E11') or
              (datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E18')
              then // FollowUp - clientes ( by Carlos 23/08/2010 )
  begin
    Edit137.Text      := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit139.Text      := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit141.Text      := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edtCdCliente.Text := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edtCdArea.Text    := ExtractWord(5,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Memo2.Text        := ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end else if (datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E06') or
              (datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E07') or // FollowUp Daily ( by Carlos 07/12/2010 )
              (datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E14') or  // FollowUp Daily - Basf
              (datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E15') then // FollowUp Daily - Purina
  begin
    Edit143.Text                := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit149.Text                := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit151.Text                := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Edit153.Text                := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    Memo3.Text                  := ExtractWord(5,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_E06_Cod_Cliente.Text    := ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_E06_Cod_Tranp_Merc.Text := ExtractWord(7,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end
  else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'DFF' then
  begin
    edt_DFF_CD_UNID_NEG.Text := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_DFF_CD_PRODUTO.Text  := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_DFF_CD_GRUPO.Text    := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_DFF_CD_CLIENTE.Text  := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end
  else if (datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'DFT') or
          (datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'DFM') then
  begin
    edt_DFT_CD_UNID_NEG.Text       := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_DFT_CD_PRODUTO.Text        := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_DFT_CD_GRUPO.Text          := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_DFT_CD_TRANSPORTADOR.Text  := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end
  else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'DFA' then
  begin
    edt_DFA_CD_UNID_NEG.Text       := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString, '/');
    edt_DFA_CD_PRODUTO.Text        := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString, '/');
    edt_DFA_CD_GRUPO.Text          := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString, '/');
    edt_DFA_CD_CLIENTE.Text        := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString, '/');
    edt_DFA_CD_ARMADOR.Text        := ExtractWord(5,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString, '/');
  end
  else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'DF0' then
  begin
    edt_DF0_CD_UNID_NEG.Text       := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString, '/');
    edt_DF0_CD_PRODUTO.Text        := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString, '/');
    edt_DF0_CD_GRUPO.Text          := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString, '/');
    edt_DF0_CD_CLIENTE.Text        := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString, '/');
    edt_DF0_CD_TERMINAL.Text       := ExtractWord(6,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString, '/');
  end
  else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'DFJ' then
  begin
    edt_DFJ_CD_UNID_NEG.Text       := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_DFJ_CD_PRODUTO.Text        := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_DFJ_CD_GRUPO.Text          := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end
  else if datm_relatorios_mail_aut.qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'FDT' then
  begin
    edt_FDT_CD_UNID_NEG.Text       := ExtractWord(1,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_FDT_CD_PRODUTO.Text        := ExtractWord(2,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_FDT_CD_GRUPO.Text          := ExtractWord(3,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_FDT_CD_CLIENTE.Text        := ExtractWord(4,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
    edt_FDT_CD_TRANSPORTADOR.Text  := ExtractWord(5,datm_relatorios_mail_aut.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString,'/');
  end;
end;

procedure Tfrm_relatorios_mail_aut.FormShow(Sender: TObject);
begin
  QueryFiltrada := false;
  pgctrl_documento.ActivePage := ts_lista;

  if datm_relatorios_mail_aut = nil then
    Application.CreateForm(Tdatm_relatorios_mail_aut, datm_relatorios_mail_aut);

  datm_relatorios_mail_aut.qry_relatorios_mail_aut_.close;
  datm_relatorios_mail_aut.qry_relatorios_mail_aut_.sql.text := datm_relatorios_mail_aut.GetSqlRelatorios;
  ConfiguraParametroAtivo(true);
  datm_relatorios_mail_aut.qry_relatorios_mail_aut_.Open;

  pnl_btn_ag.Color := clMenuBroker;
  panel1.Color     := clPnlClaroBroker;
  panel2.Color     := clPnlClaroBroker;
  Shape2.BringToFront;
  Shape3.Brush.Color := clPnlClaroBroker;
  DBCheckBox1.Color  := clPnlClaroBroker;
  Shape4.Brush.Color := clMenuBroker;
  Shape8.Brush.Color := clMenuBroker;
  Shape9.Brush.Color := clMenuBroker;
  Shape10.Brush.Color := clPnlClaroBroker;
  vOrdenadoPor := 'CD_RELATORIO';

end;

procedure Tfrm_relatorios_mail_aut.DBEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_);
  if Key = VK_F5 then
  begin
    if Sender = Edit5   then SpeedButton1Click(SpeedButton1);
    if Sender = Edit3   then SpeedButton3Click(SpeedButton3);
    if Sender = Edit8   then SpeedButton4Click(SpeedButton4);
    if Sender = Edit9   then SpeedButton5Click(SpeedButton5);
    if Sender = Edit11  then SpeedButton6Click(SpeedButton6);
    if Sender = Edit71  then SpeedButton36Click(SpeedButton36);
    if Sender = Edit73  then SpeedButton37Click(SpeedButton37);
    if Sender = Edit14  then SpeedButton7Click(SpeedButton7);
    if Sender = Edit17  then SpeedButton8Click(SpeedButton8);
    if Sender = Edit18  then SpeedButton9Click(SpeedButton9);
    if Sender = Edit20  then SpeedButton10Click(SpeedButton10);
    if Sender = Edit22  then SpeedButton11Click(SpeedButton11);
    if Sender = Edit24  then SpeedButton12Click(SpeedButton12);
    if Sender = Edit26  then SpeedButton13Click(SpeedButton13);
    if Sender = Edit28  then SpeedButton14Click(SpeedButton14);
    if Sender = Edit31  then SpeedButton15Click(SpeedButton15);
    if Sender = Edit32  then SpeedButton16Click(SpeedButton16);
    if Sender = Edit34  then SpeedButton17Click(SpeedButton17);
    if Sender = Edit36  then SpeedButton18Click(SpeedButton18);
    if Sender = Edit38  then SpeedButton19Click(SpeedButton19);
    if Sender = Edit40  then SpeedButton20Click(SpeedButton20);
    if Sender = Edit42  then SpeedButton21Click(SpeedButton21);
    if Sender = Edit45  then SpeedButton22Click(SpeedButton22);
    if Sender = Edit46  then SpeedButton23Click(SpeedButton23);
    if Sender = Edit48  then SpeedButton24Click(SpeedButton24);
    if Sender = Edit50  then SpeedButton25Click(SpeedButton25);
    if Sender = Edit52  then SpeedButton26Click(SpeedButton26);
    if Sender = Edit54  then SpeedButton27Click(SpeedButton27);
    if Sender = Edit60  then SpeedButton30Click(SpeedButton30);
    if Sender = Edit62  then SpeedButton31Click(SpeedButton31);
    if Sender = Edit67  then SpeedButton34Click(SpeedButton34);
    if Sender = Edit63  then SpeedButton32Click(SpeedButton32);
    if Sender = Edit56  then SpeedButton28Click(SpeedButton28);
    if Sender = Edit58  then SpeedButton29Click(SpeedButton29);
    if Sender = Edit69  then SpeedButton35Click(SpeedButton35);
    if Sender = Edit65  then SpeedButton33Click(SpeedButton33);
    if Sender = Ed2     then Btn1Click(Btn1);
    if Sender = Ed4     then Btn2Click(Btn2);
    if Sender = Ed6     then Btn1Click(Btn3);
    if Sender = Ed8     then Btn4Click(Btn2);
    if Sender = Ed10    then Btn1Click(Btn5);
    if Sender = Ed12    then Btn6Click(Btn2);
    if Sender = Ed13    then Btn7Click(Btn7);
    if Sender = Ed15    then Btn8Click(Btn8);
    if Sender = Ed17    then Btn9Click(Btn9);
    if Sender = Ed19    then Btn10Click(Btn10);
    if Sender = Ed21    then Btn11Click(Btn11);
    if Sender = DBEdit2 then SpeedButton2Click(SpeedButton2);
    if Sender = Edt2    then btn21Click(btn21);
    if Sender = Edt4    then btn22Click(btn22);
    if Sender = ed24    then btn12Click(btn12);
    if Sender = ed25    then btn13Click(btn13);
    if Sender = ed40    then btn20Click(btn20);
    if Sender = ed29    then btn14Click(btn14);
    if Sender = ed31    then btn15Click(btn15);
    if Sender = ed33    then btn16Click(btn16);
    if Sender = ed35    then btn17Click(btn17);
    if Sender = ed37    then btn1Click(btn18);
    if Sender = ed39    then btn19Click(btn19);
    if Sender = Edit89  then SpeedButton42Click(SpeedButton42);
    if Sender = Edit92  then SpeedButton43Click(SpeedButton43);
    if Sender = Edit94  then SpeedButton44Click(SpeedButton44);
    if Sender = dbedtModal  then SpeedButton60Click(SpeedButton60);
    if Sender = dbedtIdioma then SpeedButton61Click(SpeedButton61);
    if Sender = Edit125  then SpeedButton62Click(SpeedButton62);
    if Sender = Edit127  then SpeedButton63Click(SpeedButton63);
    if Sender = Edit128  then SpeedButton64Click(SpeedButton64);
    if Sender = Edit132  then SpeedButton65Click(SpeedButton64);
    if Sender = Edit133  then SpeedButton66Click(SpeedButton66);
    if Sender = Edit135  then SpeedButton67Click(SpeedButton67);
    if Sender = edtCdArea then SpeedButton75.Click;
    if Sender = edtCdCliente then SpeedButton79.Click;
    if Sender = edt_E06_Cod_Cliente then btn_E06_Cliente.Click;
    if Sender = edt_E06_Cod_Tranp_Merc then btn_E06_Tranp_Merc.Click;
  end;
end;

procedure Tfrm_relatorios_mail_aut.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_relatorios_mail_aut.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_relatorios_mail_aut.Free;
  datm_relatorios_mail_aut := nil;
  Action := caFree;
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton1Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit5.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
    Edit6.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Edit5.Text,'NM_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = CHR(Vk_RETURN) then
  begin
    try
      StrToTime(MaskEdit1.Text);
      edt_horarios.Text := edt_horarios.Text + MaskEdit1.Text + '/';
    except
      BoxMensagem('A data digitada não é válida. Favor verificar.',3)
    end;
    MaskEdit1.Clear;
    MaskEdit1.SetFocus;
  end;
end;

procedure Tfrm_relatorios_mail_aut.btn_excluirClick(Sender: TObject);
begin
  with datm_relatorios_mail_aut do
  begin
    if (pgctrl_documento.ActivePage = ts_lista) or (pgctrl_documento.ActivePage = ts_dados) then
    begin
      if Application.MessageBox('Deseja realmente excluir o relatório selecionado?', 'Exclusão', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
      begin
        if not qry_relatorios_mail_aut_usuarios_.IsEmpty then
          BoxMensagem('Existem usuários cadastrados para esse alerta. Nâo é possível excluir.',3)
        else
        begin
          qry_relatorios_mail_aut_.Delete;
          pgctrl_documento.ActivePage := ts_lista;
          btn_incluir.Enabled         := true
        end;
      end;
    end
    else
    if pgctrl_documento.ActivePage = ts_usuarios then
    begin
      if Application.MessageBox('Deseja realmente excluir o usuário selecionado?', 'Exclusão', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
      begin
        with TQuery.Create(application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add('DELETE FROM TFILA_AGENDA');
          SQL.Add('WHERE NM_PATH_EDI LIKE ''%CD_RELATORIO="' + qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '"%''');
          SQL.Add('AND NM_PATH_EDI LIKE ''%CD_USUARIO="' + qry_relatorios_mail_aut_usuarios_.FieldByName('CD_USUARIO').AsString + '"%''');
          ExecSQL;
          Free;
        end;
        qry_relatorios_mail_aut_usuarios_.Delete;
      end;
    end;
  end;
end;

procedure Tfrm_relatorios_mail_aut.btn_cancelarClick(Sender: TObject);
begin
  with datm_relatorios_mail_aut do
  begin
    if (pgctrl_documento.ActivePage = ts_lista) or (pgctrl_documento.ActivePage = ts_dados) then
    begin
      qry_relatorios_mail_aut_.Cancel;
      AtualizaNB;
    end
    else if pgctrl_documento.ActivePage = ts_usuarios then
    begin
      qry_relatorios_mail_aut_usuarios_.Cancel;
      DBEdit3.Enabled := False;
      btn_co_usuario.Enabled := False;
    end;
  end;
end;

procedure Tfrm_relatorios_mail_aut.btn_co_usuarioClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    DBEdit3.Text := ConsultaOnLineEx('TUSUARIO','Usuários',['CD_USUARIO','NM_USUARIO','NM_EMAIL'],['Código','Nome','Email'],'CD_USUARIO',nil)
  else Edit2.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', DBEdit3.Text,'NM_USUARIO');
end;

procedure Tfrm_relatorios_mail_aut.pgctrl_documentoChange(Sender: TObject);
begin
  with datm_relatorios_mail_aut do
  begin
    if pgctrl_documento.ActivePage = ts_usuarios then
    begin
      qry_relatorios_mail_aut_usuarios_.Close;
      qry_relatorios_mail_aut_usuarios_.ParamByName('CD_RELATORIO').AsString := qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString;
      qry_relatorios_mail_aut_usuarios_.Prepare;
      qry_relatorios_mail_aut_usuarios_.Open;
    end;
  end;
  if pgctrl_documento.ActivePage = ts_dados then
    HabilitaPaineis;
    
  if (pgctrl_documento.ActivePage = ts_lista) OR (pgctrl_documento.ActivePage = ts_usuarios)  then
    btn_incluir.Enabled := true
  else
    btn_incluir.Enabled := false;
end;

procedure Tfrm_relatorios_mail_aut.DBEdit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_usuarios_);
  if Key = VK_F5 then
    if Sender = DBEdit3 then
       btn_co_usuarioClick(btn_co_usuario);
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton6Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit11.Text := ConsultaOnLineEx('TEVENTO','Eventos',['CD_EVENTO','NM_EVENTO'],['Código','Nome'],'CD_EVENTO',nil)
  end else
    Edit12.Text := ConsultaLookUP('TEVENTO','CD_EVENTO', Edit11.Text,'NM_EVENTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton3Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit3.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end else
    Edit1.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Edit3.Text,'NM_PRODUTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton4Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit8.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
    Edit4.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Edit8.Text,'NM_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton5Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit9.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end else
    Edit10.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Edit9.Text,'NM_PRODUTO');
end;

procedure Tfrm_relatorios_mail_aut.Aplicarhorriosparatodososusurios1Click(
  Sender: TObject);
var
  resultado : TModalResult;
begin
  resultado := MessageDlg('Deseja aplicar os horários desse usuário para todos os usuários desse relatório ?' + #13#10 +
                '"Sim" para todos.' + #13#10 +
                '"Não" apenas para os que estão com horários em branco.' + #13#10 +
                '"Cancel" para não copiar horários.', mtConfirmation, [mbYes,mbNo,mbCancel], 0);

  if (resultado = 6) then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TRELATORIOS_MAIL_AUT_USUARIOS SET TX_HORARIOS_ENVIO = ''' + datm_relatorios_mail_aut.qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString + ''' WHERE CD_RELATORIO = ''' + datm_relatorios_mail_aut.qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '''');
      ExecSQL;
      Free;
    end;
  end else if (resultado = 7) then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TRELATORIOS_MAIL_AUT_USUARIOS SET TX_HORARIOS_ENVIO = ''' + datm_relatorios_mail_aut.qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString + ''' WHERE CD_RELATORIO = ''' + datm_relatorios_mail_aut.qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '''');
      SQL.Add('AND LTRIM(RTRIM(TX_HORARIOS_ENVIO)) = ''''');
      ExecSQL;
      Free;
    end;
  end;
  with datm_relatorios_mail_aut do
  begin
    qry_relatorios_mail_aut_usuarios_.Close;
    qry_relatorios_mail_aut_usuarios_.ParamByName('CD_RELATORIO').AsString := qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString;
    qry_relatorios_mail_aut_usuarios_.Prepare;
    qry_relatorios_mail_aut_usuarios_.Open;
  end;
  PreparaAgendaEDI('');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton7Click(Sender: TObject);
begin
  // testeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit14.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
    Edit13.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Edit14.Text,'NM_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton8Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit17.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end else
    Edit15.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Edit17.Text,'NM_PRODUTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton9Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit18.Text := ConsultaOnLineEx('TEVENTO','Eventos',['CD_EVENTO','NM_EVENTO'],['Código','Nome'],'CD_EVENTO',nil)
  end else
    Edit16.Text := ConsultaLookUP('TEVENTO','CD_EVENTO', Edit18.Text,'NM_EVENTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton10Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit20.Text := ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil)
  end else
    Edit19.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', Edit20.Text,'NM_EMPRESA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton11Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit22.Text := ConsultaOnLineEx('TGRUPO','Clientes',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO',nil)
  end else
    Edit21.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', Edit22.Text,'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton12Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit24.Text := ConsultaLookup('TAREA','NM_AREA',ConsultaOnLineExSQL('SELECT NM_GRUPO FROM TAREA GROUP BY NM_GRUPO','Áreas',['NM_GRUPO'],['Nome'],'NM_GRUPO',nil),'CD_AREA');
  end else
    Edit23.Text := ConsultaLookUP('TAREA','CD_AREA', Edit24.Text,'NM_AREA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton13Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
    begin
      if Edit23.Text <> '' then
        Edit26.Text := ConsultaOnLineExSQL('SELECT CD_AREA, NM_AREA FROM TAREA WHERE NM_GRUPO = ''' + Edit23.Text + '''','Sub-areas',['CD_AREA','NM_AREA'],['Código','Nome'],'CD_AREA',nil)
      else Edit26.Text := ConsultaOnLineEx('TAREA','Áreas',['CD_AREA','NM_AREA','NM_GRUPO'],['Código','Nome','Grupo'],'CD_AREA',nil);
    end
  end else
    Edit25.Text := ConsultaLookUP('TAREA','CD_AREA', Edit26.Text,'NM_AREA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton14Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit28.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
    Edit27.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Edit28.Text,'NM_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton15Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit31.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end else
    Edit29.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Edit31.Text,'NM_PRODUTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton16Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit32.Text := ConsultaOnLineEx('TEVENTO','Eventos',['CD_EVENTO','NM_EVENTO'],['Código','Nome'],'CD_EVENTO',nil)
  end else
    Edit30.Text := ConsultaLookUP('TEVENTO','CD_EVENTO', Edit32.Text,'NM_EVENTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton17Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit34.Text := ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil)
  end else
    Edit33.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', Edit34.Text,'NM_EMPRESA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton18Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit36.Text := ConsultaOnLineEx('TGRUPO','Clientes',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO',nil)
  end else
    Edit35.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', Edit36.Text,'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton19Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit38.Text := ConsultaLookup('TAREA','NM_AREA',ConsultaOnLineExSQL('SELECT NM_GRUPO FROM TAREA GROUP BY NM_GRUPO','Áreas',['NM_GRUPO'],['Nome'],'NM_GRUPO',nil),'CD_AREA');
  end else
    Edit37.Text := ConsultaLookUP('TAREA','CD_AREA', Edit38.Text,'NM_AREA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton20Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
    begin
      if Edit38.Text <> '' then
        Edit40.Text := ConsultaOnLineExSQL('SELECT CD_AREA, NM_AREA FROM TAREA WHERE NM_GRUPO = ''' + Edit38.Text + '''','Sub-areas',['CD_AREA','NM_AREA'],['Código','Nome'],'CD_AREA',nil)
      else Edit40.Text := ConsultaOnLineEx('TAREA','Áreas',['CD_AREA','NM_AREA','NM_GRUPO'],['Código','Nome','Grupo'],'CD_AREA',nil);
    end
  end else
    Edit39.Text := ConsultaLookUP('TAREA','CD_AREA', Edit40.Text,'NM_AREA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton21Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit42.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
    Edit41.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Edit42.Text,'NM_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton22Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit45.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end else
    Edit43.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Edit45.Text,'NM_PRODUTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton23Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit46.Text := ConsultaOnLineEx('TEVENTO','Eventos',['CD_EVENTO','NM_EVENTO'],['Código','Nome'],'CD_EVENTO',nil)
  end else
    Edit44.Text := ConsultaLookUP('TEVENTO','CD_EVENTO', Edit46.Text,'NM_EVENTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton24Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit48.Text := ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil)
  end else
    Edit47.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', Edit48.Text,'NM_EMPRESA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton25Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit50.Text := ConsultaOnLineEx('TGRUPO','Clientes',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO',nil)
  end else
    Edit49.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', Edit50.Text,'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton26Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit52.Text := ConsultaLookup('TAREA','NM_AREA',ConsultaOnLineExSQL('SELECT NM_GRUPO FROM TAREA GROUP BY NM_GRUPO','Áreas',['NM_GRUPO'],['Nome'],'NM_GRUPO',nil),'CD_AREA');
  end else
    Edit51.Text := ConsultaLookUP('TAREA','CD_AREA', Edit52.Text,'NM_AREA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton27Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
    begin
      if Edit52.Text <> '' then
        Edit54.Text := ConsultaOnLineExSQL('SELECT CD_AREA, NM_AREA FROM TAREA WHERE NM_GRUPO = ''' + Edit52.Text + '''','Sub-areas',['CD_AREA','NM_AREA'],['Código','Nome'],'CD_AREA',nil)
      else Edit54.Text := ConsultaOnLineEx('TAREA','Áreas',['CD_AREA','NM_AREA','NM_GRUPO'],['Código','Nome','Grupo'],'CD_AREA',nil);
    end
  end else
    Edit53.Text := ConsultaLookUP('TAREA','CD_AREA', Edit54.Text,'NM_AREA');
end;

procedure Tfrm_relatorios_mail_aut.dbnvgClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  pgctrl_documentoChange(nil);
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton30Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit60.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
    Edit59.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Edit60.Text,'NM_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton31Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit62.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end else
    Edit61.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Edit62.Text,'NM_PRODUTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton34Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit67.Text := ConsultaOnLineEx('TEVENTO','Eventos',['CD_EVENTO','NM_EVENTO'],['Código','Nome'],'CD_EVENTO',nil)
  end else
    Edit68.Text := ConsultaLookUP('TEVENTO','CD_EVENTO', Edit67.Text,'NM_EVENTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton32Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit63.Text := ConsultaOnLineEx('TARMAZEM','Armazém de Descarga',['CD_ARMAZEM','NM_ARMAZEM'],['Código','Nome'],'CD_ARMAZEM',nil)
  end else
    Edit64.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM', Edit63.Text,'NM_ARMAZEM');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton28Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit56.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
    Edit55.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Edit56.Text,'NM_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton29Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit58.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end else
    Edit57.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Edit58.Text,'NM_PRODUTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton35Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit69.Text := ConsultaOnLineEx('TEVENTO','Eventos',['CD_EVENTO','NM_EVENTO'],['Código','Nome'],'CD_EVENTO',nil)
  end else
    Edit70.Text := ConsultaLookUP('TEVENTO','CD_EVENTO', Edit69.Text,'NM_EVENTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton33Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit65.Text := ConsultaOnLineEx('TAGENTE','Agentes',['CD_AGENTE','NM_AGENTE'],['Código','Nome'],'CD_AGENTE',nil)
  end else
    Edit66.Text := ConsultaLookUP('TAGENTE','CD_AGENTE', Edit65.Text,'NM_AGENTE');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton36Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit71.Text := ConsultaLookup('TAREA','NM_AREA',ConsultaOnLineExSQL('SELECT NM_GRUPO FROM TAREA GROUP BY NM_GRUPO','Áreas',['NM_GRUPO'],['Nome'],'NM_GRUPO',nil),'CD_AREA');
  end else
    Edit72.Text := ConsultaLookUP('TAREA','CD_AREA', Edit71.Text,'NM_AREA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton37Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
    begin
      if Edit72.Text <> '' then
        Edit73.Text := ConsultaOnLineExSQL('SELECT CD_AREA, NM_AREA FROM TAREA WHERE NM_GRUPO = ''' + Edit72.Text + '''','Sub-areas',['CD_AREA','NM_AREA'],['Código','Nome'],'CD_AREA',nil)
      else Edit73.Text := ConsultaOnLineEx('TAREA','Áreas',['CD_AREA','NM_AREA','NM_GRUPO'],['Código','Nome','Grupo'],'CD_AREA',nil);
    end;
  end else
    Edit74.Text := ConsultaLookUP('TAREA','CD_AREA', Edit73.Text,'NM_AREA');
end;

procedure Tfrm_relatorios_mail_aut.Edit75Exit(Sender: TObject);
begin
  lstDisponiveis.Items.Clear;
  lstSelecionados.Items.Clear;
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT SC.NAME');
    SQL.Add('  FROM SYSOBJECTS SO, SYSCOLUMNS SC');
    SQL.Add(' WHERE SO.NAME = ''' + Edit75.Text + '''');
    SQL.Add('   AND SC.ID = SO.ID');
    Open;
    while not EOF do
    begin
      lstDisponiveis.Items.Add(Fields[0].AsString);
      Next;
    end;
    Close;
    Free;
  end;
  PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_);
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton38Click(Sender: TObject);
begin
  pnlNomeAmigavel.Visible := True;
  Edit79.SetFocus;
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton39Click(Sender: TObject);
var i : Integer;
begin
  LstSelecionados.Items.Delete(LstSelecionados.ItemIndex);
  vStrSelecionados := '';
  for i := 0 to lstSelecionados.Items.Count - 1 do
    vStrSelecionados := vStrSelecionados + ' ' + lstSelecionados.Items.Strings[i];
  lstDisponiveis.Items.Clear;
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT SC.NAME');
    SQL.Add('  FROM SYSOBJECTS SO, SYSCOLUMNS SC');
    SQL.Add(' WHERE SO.NAME = ''' + Edit75.Text + '''');
    SQL.Add('   AND SC.ID = SO.ID');
    Open;
    while not EOF do
    begin
//      if Pos(Fields[0].AsString,vStrSelecionados) = 0 then
        lstDisponiveis.Items.Add(Fields[0].AsString);
      Next;
    end;
    Close;
    Free;
  end;
  vStrSelecionados := '';
//  LstDisponiveis.Items.Add(LstSelecionados.Items.Strings[LstSelecionados.ItemIndex]);
end;

procedure Tfrm_relatorios_mail_aut.Edit76Exit(Sender: TObject);
begin
(*  if Edit76.Text = '' then
    Exit;
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT SC.XTYPE');
    SQL.Add('   FROM SYSOBJECTS SO, SYSCOLUMNS SC');
    SQL.Add('WHERE SO.NAME = ''' + Edit75.Text + '''');
    SQL.Add('       AND SC.ID = SO.ID');
    SQL.Add('       AND SC.NAME = ''' + Edit76.Text + '''');
    Open;
    if Fields[0].AsInteger <> 61 then
    begin
      BoxMensagem('Esse tipo de relatório só aceita campos que contenham uma data para a filtragem.',3);
      Edit76.Clear;
      Edit76.SetFocus;
    end;
    Close;
    Free;
  end;*)
    //PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_);
end;

procedure Tfrm_relatorios_mail_aut.Edit79KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(vk_return) then
  begin
    if ( Trim(vStrSubstring) = '' ) and ( Trim(vStrConsultaOnLine) = '' ) then
    begin
      LstSelecionados.Items.Add(LstDisponiveis.Items.Strings[LstDisponiveis.ItemIndex] + ' ''' + Edit79.Text + '''');
//      LstDisponiveis.Items.Delete(LstDisponiveis.ItemIndex);
    end
    else begin
      if Trim(vStrSubstring) <> '' then
        LstSelecionados.Items.Strings[LstSelecionados.ItemIndex] := Trim(vStrSubstring) + ' ''' + Edit79.Text + ''''
      else LstSelecionados.Items.Strings[LstSelecionados.ItemIndex] := Trim(vStrConsultaOnLine) + ' ''' + Edit79.Text + '''';
    end;
    vStrSubstring := '';
    vStrConsultaOnLine := '';
    Edit79.Clear;
    PnlNomeAmigavel.Visible := False;
  end;
end;

procedure Tfrm_relatorios_mail_aut.lstDisponiveisDblClick(Sender: TObject);
begin
  SpeedButton38Click(nil);
end;

procedure Tfrm_relatorios_mail_aut.lstSelecionadosDblClick(
  Sender: TObject);
begin
  SpeedButton39Click(nil);
end;

procedure Tfrm_relatorios_mail_aut.CortarResultado1Click(Sender: TObject);
begin
  pnlSubstring.Visible := True;
end;

procedure Tfrm_relatorios_mail_aut.InserirCampoLookup1Click(
  Sender: TObject);
begin
  pnlLookup.Visible := True;
end;

procedure Tfrm_relatorios_mail_aut.Edit80KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = chr(vk_return) then
  begin
    if (Trim(Edit80.Text) = '') or (Trim(Edit81.Text) = '') or (Trim(Edit82.Text) = '') then
      Exit;
    vStrConsultaOnLine := '*cons*('+Edit80.Text+'|'+Edit81.Text+'|'+ExtractWord(1,LstSelecionados.Items.Strings[LstSelecionados.ItemIndex],' ')+'|'+Edit82.Text+'|'+Ed23.Text+'|)';
    LstSelecionados.Items.Strings[LstSelecionados.ItemIndex] := vStrConsultaOnLine;
    pnlLookup.Visible := False;
    pnlNomeAmigavel.Visible := True;
  end;
end;

procedure Tfrm_relatorios_mail_aut.Edit83KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(vk_return) then
  begin
    if (Trim(Edit83.Text) = '') or (Trim(Edit84.Text) = '') then
      Exit;
    vStrSubstring := 'SUBSTRING('+ExtractWord(1,LstSelecionados.Items.Strings[LstSelecionados.ItemIndex],' ')+','+Trim(Edit83.Text)+','+Trim(Edit84.Text)+')';
// LstSelecionados.Items.Strings[LstSelecionados.ItemIndex]
    pnlSubstring.Visible := False;
    pnlNomeAmigavel.Visible := True;
  end;
end;

procedure Tfrm_relatorios_mail_aut.CompletaCodigo(var pEdit : TEdit);
var
  vStrAux : string;
  i : Integer;
begin
  if Length(pEdit.Text) = 0 then Exit;
  for i:=0 to pEdit.MaxLength-1-Length(pEdit.Text) do
    vStrAux := vStrAux + '0';
  pEdit.Text := vStrAux + pEdit.Text;
end;

procedure Tfrm_relatorios_mail_aut.DBEdit2Exit(Sender: TObject);
begin
  ValidCodigo(TDBEdit(Sender));
end;

procedure Tfrm_relatorios_mail_aut.DBGrid1TitleClick(Column: TColumn);
var
  i : Integer;
begin
  if Column.Title.Caption <> 'Ativo' then
  begin
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.Close;
//    if Column.Title.Caption <> 'Evento' then
      datm_relatorios_mail_aut.qry_relatorios_mail_aut_.SQL.Strings[datm_relatorios_mail_aut.qry_relatorios_mail_aut_.SQL.Count-1] := 'ORDER BY ' + Column.FieldName;
//    else
//    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.SQL.Strings[datm_relatorios_mail_aut.qry_relatorios_mail_aut_.SQL.Count-1] := 'ORDER BY SUBSTRING(TX_CONFIGURACAO,7,3)';
    for i:=0 to DBGrid1.Columns.Count-1 do
      DBGrid1.Columns[i].Color := clWindow;
      
    Column.Color := $00EBFFE6;
    vOrdenadoPor := Column.FieldName;

    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.Prepare;
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.Open;
  end;
end;

procedure Tfrm_relatorios_mail_aut.edt_chaveChange(Sender: TObject);
begin
  datm_relatorios_mail_aut.qry_relatorios_mail_aut_.Locate({vOrdenadoPor} 'CD_RELATORIO', edt_chave.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure Tfrm_relatorios_mail_aut.btnReconfiguraTudoClick(
  Sender: TObject);
var i : Integer;
begin
  if Application.MessageBox('Deseja realmente refazer toda a fila da agenda do EDI ?', 
    'Tem certeza?', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
    Exit;
  with datm_relatorios_mail_aut do
  begin
    qry_relatorios_mail_aut_.First;
    while not qry_relatorios_mail_aut_.EOF do
    begin
      if ( qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'IVP' ) or
         ( qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'IVN' ) or
         ( qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'IVL' ) or
         ( qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E01' ) or
         ( qry_relatorios_mail_aut_CD_TIPO_RELATORIO.AsString = 'E02' ) then
      begin
        qry_relatorios_mail_aut_.Next;
        Continue;
      end;

      // verifica se o relatório está ativo ou não
      if qry_relatorios_mail_aut_.FieldByName('IN_ATIVO').AsString = '1' then
      begin
        with TQuery.Create(application) do
        begin
          DatabaseName := 'DBBROKER';
          // limpa todas as entradas na agenda para esse relatório, reconfigurando-a por inteiro
          SQL.Clear;
          SQL.Add('DELETE FROM TFILA_AGENDA WHERE NM_PATH_EDI LIKE ''%CD_RELATORIO="' + qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '"%''');
          ExecSQL;
          // começa a varrer a tabela de usuarios para inserir os registros de agenda na TFILA_AGENDA
          qry_relatorios_mail_aut_usuarios_.Close;
          qry_relatorios_mail_aut_usuarios_.ParamByName('CD_RELATORIO').AsString := qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString;
          qry_relatorios_mail_aut_usuarios_.Prepare;
          qry_relatorios_mail_aut_usuarios_.Open;
          qry_relatorios_mail_aut_usuarios_.First;
          while not qry_relatorios_mail_aut_usuarios_.EOF do
          begin
            for i := 1 to ContaOcorrencias(qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString,'/') do
            begin
              // insere na TFILA_AGENDA passando o numero do relatorio e o usuario.
              SQL.Clear;
              if StrToTime(ExtractWord(i,qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString,'/')) > StrToTime(FormatDateTime('hh:nn',now)) then
                SQL.Add('INSERT INTO TFILA_AGENDA VALUES (''' + ConsultaLookupSQL('SELECT MAX(CD_AGENDA) + 1 AS CD_AGENDA FROM TFILA_AGENDA', 'CD_AGENDA') + ''',''M'',''CD_RELATORIO="' + qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '"/CD_USUARIO="' + qry_relatorios_mail_aut_usuarios_.FieldByName('CD_USUARIO').AsString + '"/'',''1'','''',''24'',''' + ExtractWord(i,qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString,'/') + ''',''H'',''00:00'',GETDATE()-1)')
              else SQL.Add('INSERT INTO TFILA_AGENDA VALUES (''' + ConsultaLookupSQL('SELECT MAX(CD_AGENDA) + 1 AS CD_AGENDA FROM TFILA_AGENDA', 'CD_AGENDA') + ''',''M'',''CD_RELATORIO="' + qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '"/CD_USUARIO="' + qry_relatorios_mail_aut_usuarios_.FieldByName('CD_USUARIO').AsString + '"/'',''1'','''',''24'',''' + ExtractWord(i,qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString,'/') + ''',''H'',''00:00'',GETDATE())');
              ExecSQL;
            end;
            qry_relatorios_mail_aut_usuarios_.Next;
          end;
          Free;
        end;
      end else begin
        with TQuery.Create(application) do
        begin
          DatabaseName := 'DBBROKER';
          // caso fique inativo, ele exclui da tabela TFILA_AGENDA, para que o EDI não mais envie mails sobre esse relatório
          SQL.Clear;
          SQL.Add('DELETE FROM TFILA_AGENDA WHERE NM_PATH_EDI LIKE ''%CD_RELATORIO="' + qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '"%''');
          ExecSQL;
          Free;
        end;
      end;
      qry_relatorios_mail_aut_.Next;
    end;
  end;
end;

procedure Tfrm_relatorios_mail_aut.btn2Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Ed4.Text := ConsultaOnLineEx('TUSUARIO','Usuários',['CD_USUARIO','NM_USUARIO'],['Código','Nome'],'CD_USUARIO',nil);
  end else Ed3.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', Ed4.Text,'NM_USUARIO');
end;

procedure Tfrm_relatorios_mail_aut.btn1Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Ed2.Text := ConsultaOnLineEx('TUSUARIO','Usuários',['CD_USUARIO','NM_USUARIO'],['Código','Nome'],'CD_USUARIO',nil);
  end else Ed1.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', Ed2.Text,'NM_USUARIO');
end;

procedure Tfrm_relatorios_mail_aut.DBEdit3Exit(Sender: TObject);
begin
  if Edit2.Text = '' then
  begin
    BoxMensagem('Usuário não cadastrado.',3);
    DBEdit3.SetFocus;
  end;
end;

procedure Tfrm_relatorios_mail_aut.btn4Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Ed8.Text := ConsultaOnLineEx('TUSUARIO','Usuários',['CD_USUARIO','NM_USUARIO'],['Código','Nome'],'CD_USUARIO',nil);
  end else Ed7.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', Ed8.Text,'NM_USUARIO');
end;

procedure Tfrm_relatorios_mail_aut.btn6Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Ed12.Text := ConsultaOnLineEx('TUSUARIO','Usuários',['CD_USUARIO','NM_USUARIO'],['Código','Nome'],'CD_USUARIO',nil);
  end else Ed11.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', Ed12.Text,'NM_USUARIO');
end;

procedure Tfrm_relatorios_mail_aut.btn7Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Ed13.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
    Ed14.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Ed13.Text,'NM_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.btn8Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Ed15.Text := ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil)
  end else
    Ed16.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', Ed15.Text,'NM_EMPRESA');
end;

procedure Tfrm_relatorios_mail_aut.btn9Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Ed17.Text := ConsultaOnLineEx('TGRUPO','Clientes',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO',nil)
  end else
    Ed18.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', Ed17.Text,'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.btn10Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Ed19.Text := ConsultaLookup('TAREA','NM_AREA',ConsultaOnLineExSQL('SELECT NM_GRUPO FROM TAREA GROUP BY NM_GRUPO','Áreas',['NM_GRUPO'],['Nome'],'NM_GRUPO',nil),'CD_AREA');
  end else
    Ed20.Text := ConsultaLookUP('TAREA','CD_AREA', Ed19.Text,'NM_AREA');
end;

procedure Tfrm_relatorios_mail_aut.btn11Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
    begin
      if Ed19.Text <> '' then
        Ed21.Text := ConsultaOnLineExSQL('SELECT CD_AREA, NM_AREA FROM TAREA WHERE NM_GRUPO = ''' + Edit52.Text + '''','Sub-areas',['CD_AREA','NM_AREA'],['Código','Nome'],'CD_AREA',nil)
      else Ed21.Text := ConsultaOnLineEx('TAREA','Áreas',['CD_AREA','NM_AREA','NM_GRUPO'],['Código','Nome','Grupo'],'CD_AREA',nil);
    end
  end else
    Ed22.Text := ConsultaLookUP('TAREA','CD_AREA', Ed21.Text,'NM_AREA');
end;

procedure Tfrm_relatorios_mail_aut.DefinircomoChaveparaLookUp1Click(
  Sender: TObject);
begin
  LstSelecionados.Items.Strings[LstSelecionados.ItemIndex] := '#' + LstSelecionados.Items.Strings[LstSelecionados.ItemIndex];
end;

procedure Tfrm_relatorios_mail_aut.Moverpcima1Click(Sender: TObject);
begin
  LstSelecionados.Items.Move(LstSelecionados.ItemIndex,LstSelecionados.ItemIndex-1);
end;

procedure Tfrm_relatorios_mail_aut.Moverpbaixo1Click(Sender: TObject);
begin
  LstSelecionados.Items.Move(LstSelecionados.ItemIndex,LstSelecionados.ItemIndex+1);
end;

procedure Tfrm_relatorios_mail_aut.btn12Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Ed24.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
    Ed26.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Ed24.Text,'NM_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.btn13Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Ed25.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end else
    Ed27.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Ed25.Text,'NM_PRODUTO');
end;

procedure Tfrm_relatorios_mail_aut.rb1Click(Sender: TObject);
begin
  if rb1.Checked then
    nbTipoConfig.ActivePage := '0';
end;

procedure Tfrm_relatorios_mail_aut.rb2Click(Sender: TObject);
begin
  if rb2.Checked then
    nbTipoConfig.ActivePage := '1';
end;

procedure Tfrm_relatorios_mail_aut.btn20Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Ed40.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
    Ed41.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Ed40.Text,'NM_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.btn14Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Ed29.Text := ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil)
  end else
    Ed28.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', ed29.Text,'NM_EMPRESA');
end;

procedure Tfrm_relatorios_mail_aut.btn15Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      ed31.Text := ConsultaOnLineEx('TGRUPO','Clientes',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO',nil)
  end else
    ed30.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', ed31.Text,'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.btn16Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      ed33.Text := ConsultaLookup('TAREA','NM_AREA',ConsultaOnLineExSQL('SELECT NM_GRUPO FROM TAREA GROUP BY NM_GRUPO','Áreas',['NM_GRUPO'],['Nome'],'NM_GRUPO',nil),'CD_AREA');
  end else
    ed32.Text := ConsultaLookUP('TAREA','CD_AREA', ed33.Text,'NM_AREA');
end;

procedure Tfrm_relatorios_mail_aut.btn17Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
    begin
      if ed33.Text <> '' then
        ed35.Text := ConsultaOnLineExSQL('SELECT CD_AREA, NM_AREA FROM TAREA WHERE NM_GRUPO = ''' + ed33.Text + '''','Sub-areas',['CD_AREA','NM_AREA'],['Código','Nome'],'CD_AREA',nil)
      else ed35.Text := ConsultaOnLineEx('TAREA','Áreas',['CD_AREA','NM_AREA','NM_GRUPO'],['Código','Nome','Grupo'],'CD_AREA',nil);
    end
  end else
    ed34.Text := ConsultaLookUP('TAREA','CD_AREA', ed35.Text,'NM_AREA');
end;

procedure Tfrm_relatorios_mail_aut.btn19Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Ed39.Text := ConsultaOnLineEx('TUSUARIO','Usuários',['CD_USUARIO','NM_USUARIO'],['Código','Nome'],'CD_USUARIO',nil);
  end else Ed38.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', Ed39.Text,'NM_USUARIO');
end;

procedure Tfrm_relatorios_mail_aut.btn21Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edt2.Text := ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil)
  end else
    Edt1.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', Edt2.Text,'NM_EMPRESA');
end;

procedure Tfrm_relatorios_mail_aut.btn22Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edt4.Text := ConsultaOnLineEx('TGRUPO','Clientes',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO',nil)
  end else
    Edt3.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', Edt4.Text,'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton40Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit85.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
    Edit86.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Edit85.Text,'NM_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton41Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit87.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end else
    Edit88.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Edit87.Text,'NM_PRODUTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton42Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit89.Text := ConsultaOnLineEx('TGRUPO','Clientes',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO',nil)
  end else
    Edit90.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', Edit89.Text,'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.pgctrl_documentoChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  RemoverFiltro;

  AllowChange := (datm_relatorios_mail_aut.qry_relatorios_mail_aut_.State          in [dsBrowse, dsInactive]) and
                 (datm_relatorios_mail_aut.qry_relatorios_mail_aut_usuarios_.State in [dsBrowse, dsInactive]);


  if not AllowChange then begin
    if datm_relatorios_mail_aut.qry_relatorios_mail_aut_.State in [dsEdit, dsInsert] then begin
      if Application.MessageBox('O cadastro de relatórios sofreu alteração? Deseja Salvar?', 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrYes then
        btn_salvarClick(btn_salvar)
      else
        btn_cancelarClick(btn_cancelar);
    end;
    if datm_relatorios_mail_aut.qry_relatorios_mail_aut_usuarios_.State in [dsEdit, dsInsert] then begin
      if Application.MessageBox('O cadastro de Usuários sofreu alteração? Deseja Salvar?', 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrYes then
        btn_salvarClick(btn_salvar)
      else
        btn_cancelarClick(btn_cancelar);
    end;
  end;
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton43Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit92.Text := ConsultaOnLineEx('TTP_PEDIDO','Tipos de Pedido',['CD_PEDIDO','NM_PEDIDO'],['Código','Nome'],'CD_PEDIDO',nil)
  end else
    Edit91.Text := ConsultaLookUP('TTP_PEDIDO','CD_PEDIDO', Edit92.Text,'NM_PEDIDO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton44Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit94.Text := ConsultaOnLineEx('TCELULA','Células',['CD_CELULA','NM_CELULA'],['Código','Nome'],'CD_CELULA',nil)
  end else
    Edit93.Text := ConsultaLookUP('TCELULA','CD_CELULA', Edit94.Text,'NM_CELULA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton45Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit95.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
    Edit96.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Edit95.Text,'NM_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.Edit_Exit(Sender: TObject);
begin
  CompletaCodigo(TEdit(Sender));
end;

procedure Tfrm_relatorios_mail_aut.Edit97Change(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit97.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end else
    Edit98.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Edit97.Text,'NM_PRODUTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton49Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit103.Text := ConsultaOnLineEx('TGRUPO','Clientes',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO',nil)
  end else
    Edit104.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', Edit103.Text,'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton53Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit110.Text := ConsultaOnLineEx('TCELULA','Células',['CD_CELULA','NM_CELULA'],['Código','Nome'],'CD_CELULA',nil)
  end else
    Edit109.Text := ConsultaLookUP('TCELULA','CD_CELULA', Edit110.Text,'NM_CELULA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton48Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit99.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
    Edit100.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Edit99.Text,'NM_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton47Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit101.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end else
    Edit102.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Edit101.Text,'NM_PRODUTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton51Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit105.Text := ConsultaOnLineEx('TGRUPO','Clientes',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO',nil)
  end else
    Edit106.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', Edit105.Text,'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton54Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit111.Text := ConsultaOnLineEx('TCELULA','Células',['CD_CELULA','NM_CELULA'],['Código','Nome'],'CD_CELULA',nil)
  end else
    Edit112.Text := ConsultaLookUP('TCELULA','CD_CELULA', Edit111.Text,'NM_CELULA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton52Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit107.Text := ConsultaOnLineEx('TEVENTO','Eventos',['CD_EVENTO','NM_EVENTO'],['Código','Nome'],'CD_EVENTO',nil)
  end else
    Edit108.Text := ConsultaLookUP('TEVENTO','CD_EVENTO', Edit107.Text,'NM_EVENTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton50Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
    begin
      if Copy(Memo1.Text,Length(Trim(Memo1.Text)),1) = ';' then
        Memo1.Text := Memo1.Text + ConsultaOnLineEx('TEVENTO','Eventos',['CD_EVENTO','NM_EVENTO'],['Código','Nome'],'CD_EVENTO',nil) + ';'
      else Memo1.Text := Memo1.Text + ';' + ConsultaOnLineEx('TEVENTO','Eventos',['CD_EVENTO','NM_EVENTO'],['Código','Nome'],'CD_EVENTO',nil) + ';'
    end;
  end;
end;

procedure Tfrm_relatorios_mail_aut.rdQuebra0MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_);
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton55Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit114.Text := ConsultaOnLineEx('TVIA_TRANSP_BROKER','Vias de Transporte',['CD_VIA_TRANSP','NM_VIA_TRANSP'],['Código','Descrição'],'CD_VIA_TRANSP',nil)
  end else
    Edit113.Text := ConsultaLookUP('TVIA_TRANSP_BROKER','CD_VIA_TRANSP', Edit114.Text,'NM_VIA_TRANSP');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton56Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit115.Text := ConsultaOnLineEx('TCELULA','Células',['CD_CELULA','NM_CELULA'],['Código','Nome'],'CD_CELULA',nil)
  end else
    Edit116.Text := ConsultaLookUP('TCELULA','CD_CELULA', Edit115.Text,'NM_CELULA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton57Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit118.Text := ConsultaLookup('TAREA','NM_AREA',ConsultaOnLineExSQL('SELECT NM_GRUPO FROM TAREA GROUP BY NM_GRUPO','Áreas',['NM_GRUPO'],['Nome'],'NM_GRUPO',nil),'CD_AREA');
  end else
    Edit117.Text := ConsultaLookUP('TAREA','CD_AREA', Edit118.Text,'NM_AREA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton58Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
    begin
      if Edit118.Text <> '' then
        Edit120.Text := ConsultaOnLineExSQL('SELECT CD_AREA, NM_AREA FROM TAREA WHERE NM_GRUPO = ''' + Edit118.Text + '''','Sub-areas',['CD_AREA','NM_AREA'],['Código','Nome'],'CD_AREA',nil)
      else Edit120.Text := ConsultaOnLineEx('TAREA','Áreas',['CD_AREA','NM_AREA','NM_GRUPO'],['Código','Nome','Grupo'],'CD_AREA',nil);
    end
  end else
    Edit119.Text := ConsultaLookUP('TAREA','CD_AREA', Edit120.Text,'NM_AREA');
end;

procedure Tfrm_relatorios_mail_aut.mmo1Change(Sender: TObject);
begin
  if mmo1.Focused then
    PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_);
end;

procedure Tfrm_relatorios_mail_aut.nb_configPageChanged(Sender: TObject);
begin
  Label6.Visible    := (nb_config.ActivePage = 'E01') or  (nb_config.ActivePage = 'EDI');
  file_path.Visible := (nb_config.ActivePage = 'E01') or  (nb_config.ActivePage = 'EDI');
  lblSql.Visible    :=  nb_config.ActivePage = 'E01';
  mmSql.Visible     :=  nb_config.ActivePage = 'E01';
end;

procedure Tfrm_relatorios_mail_aut.file_pathButtonClick(Sender: TObject);
begin
  PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_);
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton59Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit121.Text := ConsultaOnLineEx('TEVENTO', 'Eventos', ['CD_EVENTO', 'NM_EVENTO'], ['Código', 'Nome'], 'CD_EVENTO', nil)
  end else
    Edit122.Text := ConsultaLookUP('TEVENTO','CD_EVENTO', Edit121.Text,'NM_EVENTO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton60Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      dbedtModal.Text := ConsultaOnLineEx('TVIA_TRANSP_BROKER', 'Modais', ['CD_VIA_TRANSP', 'NM_VIA_TRANSP'], ['Código', 'Nome'], 'CD_VIA_TRANSP', nil)
  end
  else
    Edit123.Text := ConsultaLookUP('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP',  dbedtModal.Text ,'NM_VIA_TRANSP');
end;

procedure Tfrm_relatorios_mail_aut.dbedtModalExit(Sender: TObject);
begin
  CompletaCodigo(TEdit(Sender));
//  if dbedtModal.Text = '' then
//    dbedtModal.Text := '10';
  Edit123.Text := ConsultaLookUP('TVIA_TRANSP_BROKER','CD_VIA_TRANSP', dbedtModal.Text,'NM_VIA_TRANSP');
end;
procedure Tfrm_relatorios_mail_aut.SpeedButton61Click(Sender: TObject);
begin
  If Sender is TSpeedButton Then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      dbedtIdioma.Text := ConsultaOnLineEx('TIDIOMA', 'Idioma', ['CODIGO', 'DESCRICAO'], ['Código', 'Descrição'], 'CODIGO', nil, 1, dbedtIdioma.Text);
  end
  else Edit124.Text := ConsultaLookUP('TIDIOMA', 'CODIGO',  dbedtIdioma.Text ,'DESCRICAO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton62Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit125.Text := ConsultaOnLineEx('TVIA_TRANSP_BROKER', 'Modais', ['CD_VIA_TRANSP', 'NM_VIA_TRANSP'], ['Código', 'Nome'], 'CD_VIA_TRANSP', nil)
  end
  else
    Edit126.Text := ConsultaLookUP('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP',  Edit125.Text ,'NM_VIA_TRANSP');
end;

procedure Tfrm_relatorios_mail_aut.Edit125Exit(Sender: TObject);
begin
  CompletaCodigo(TEdit(Sender));
//  if Edit125.Text = '' then
//    Edit125.Text := '10';
  Edit126.Text := ConsultaLookUP('TVIA_TRANSP_BROKER','CD_VIA_TRANSP', Edit125.Text,'NM_VIA_TRANSP');
end;

procedure Tfrm_relatorios_mail_aut.mmSqlChange(Sender: TObject);
begin
  if mmSql.Focused then
    PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_);
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton63Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit127.Text := ConsultaOnLineEx('TUSUARIO','Usuários',['CD_USUARIO','NM_USUARIO'],['Código','Nome'],'CD_USUARIO',nil)
  end else
    Edit129.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', Edit127.Text,'NM_USUARIO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton64Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit128.Text := ConsultaOnLineEx('TCELULA','Células',['CD_CELULA','NM_CELULA'],['Código','Nome'],'CD_CELULA',nil)
  end else
    Edit130.Text := ConsultaLookUP('TCELULA','CD_CELULA', Edit128.Text,'NM_CELULA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton65Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit131.Text := ConsultaOnLineEx('TUSUARIO','Usuários',['CD_USUARIO','NM_USUARIO'],['Código','Nome'],'CD_USUARIO',nil)
  end else
    Edit132.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', Edit131.Text,'NM_USUARIO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton66Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit133.Text := ConsultaOnLineEx('TVIA_TRANSP_BROKER', 'Modais', ['CD_VIA_TRANSP', 'NM_VIA_TRANSP'], ['Código', 'Nome'], 'CD_VIA_TRANSP', nil)
  end else
    Edit134.Text := ConsultaLookUP('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP',  Edit125.Text ,'NM_VIA_TRANSP');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton67Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit135.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end else
    Edit136.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Edit135.Text,'NM_PRODUTO');

end;

procedure Tfrm_relatorios_mail_aut.Edit135Change(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit135.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end else
    Edit136.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Edit135.Text,'NM_PRODUTO');

end;

procedure Tfrm_relatorios_mail_aut.pnl_btn_agDblClick(Sender: TObject);
begin
//IdHTTP1.URL.URLEncode('http://www.myindaiaweb.com.br/docs_novo/0101im-1010-10/teste.pdf');

end;

procedure Tfrm_relatorios_mail_aut.SpeedButton68Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit137.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
    Edit138.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Edit137.Text,'AP_UNID_NEG');

end;

procedure Tfrm_relatorios_mail_aut.SpeedButton69Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit139.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end else
    Edit140.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Edit139.Text,'NM_PRODUTO');

end;

procedure Tfrm_relatorios_mail_aut.SpeedButton71Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit141.Text := ConsultaOnLineEx('TGRUPO','Clientes',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO',nil)
  end else
    Edit142.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', Edit141.Text,'NM_GRUPO');

end;

procedure Tfrm_relatorios_mail_aut.SpeedButton70Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
    begin
      if Copy(Memo2.Text,Length(Trim(Memo2.Text)),1) = ';' then
        Memo2.Text := Memo2.Text + ConsultaOnLineEx('TEVENTO','Eventos',['CD_EVENTO','NM_EVENTO'],['Código','Nome'],'CD_EVENTO',nil) + ';'
      else Memo2.Text := Memo2.Text + ';' + ConsultaOnLineEx('TEVENTO','Eventos',['CD_EVENTO','NM_EVENTO'],['Código','Nome'],'CD_EVENTO',nil) + ';'
    end;
  end;

end;

procedure Tfrm_relatorios_mail_aut.Edit144Change(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit144.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
      Edit145.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Edit144.Text,'AP_UNID_NEG');

end;

procedure Tfrm_relatorios_mail_aut.Edit146Change(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit146.Text := ConsultaOnLineEx('TGRUPO','Clientes',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO',nil)
  end else
    Edit147.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', Edit146.Text,'NM_GRUPO');

end;

procedure Tfrm_relatorios_mail_aut.SpeedButton74Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit143.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end else
    Edit148.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Edit143.Text,'AP_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton77Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit151.Text := ConsultaOnLineEx('TGRUPO','Clientes',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO',nil)
  end else
    Edit152.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', Edit151.Text,'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton78Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      Edit153.Text := ConsultaOnLineEx('TEMPRESA_EST','Importadores',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil)
  end else
    Edit154.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA', Edit153.Text,'NM_EMPRESA');
end;

procedure Tfrm_relatorios_mail_aut.SpeedButton76Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
    begin
      if Copy(Memo3.Text,Length(Trim(Memo3.Text)),1) = ';' then
        Memo3.Text := Memo3.Text + ConsultaOnLineEx('TEVENTO','Eventos',['CD_EVENTO','NM_EVENTO'],['Código','Nome'],'CD_EVENTO',nil) + ';'
      else Memo3.Text := Memo3.Text + ';' + ConsultaOnLineEx('TEVENTO','Eventos',['CD_EVENTO','NM_EVENTO'],['Código','Nome'],'CD_EVENTO',nil) + ';'
    end;
  end;

end;

procedure Tfrm_relatorios_mail_aut.Edit153Exit(Sender: TObject);
begin
  CompletaCodigo(TEdit(Sender));
end;

procedure Tfrm_relatorios_mail_aut.habilita_botoes(Sender: TObject);
begin
   if (pgctrl_documento.ActivePage=ts_dados) then
     PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_);

end;

procedure Tfrm_relatorios_mail_aut.rg_EDI_extensaoClick(Sender: TObject);
begin
  edt_edi_extensao.Visible:=(rg_EDI_extensao.ItemIndex=(rg_EDI_extensao.Items.Count-1));
  if rg_EDI_extensao.ItemIndex=rg_EDI_extensao.Items.Count-1 then
     edt_EDI_extensao.Text:=''
  else
     edt_EDI_extensao.Text:=rg_EDI_extensao.Items[rg_EDI_extensao.ItemIndex];

end;

procedure Tfrm_relatorios_mail_aut.rg_EDI_envioClick(Sender: TObject);
begin
  edt_edi_path.Visible:=(rg_EDI_envio.ItemIndex<>0);
end;

procedure Tfrm_relatorios_mail_aut.btn_EDI_GRUPOClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_EDI_CD_GRUPO.Text := ConsultaOnLineEx('TGRUPO','Clientes',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO',nil)
  end else
    edt_EDI_NM_GRUPO.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', edt_EDI_CD_GRUPO.Text,'NM_GRUPO');

end;

procedure Tfrm_relatorios_mail_aut.btn_EDI_EVENTOClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_EDI_CD_EVENTO.Text := ConsultaOnLineEx('TEVENTO', 'Eventos', ['CD_EVENTO', 'NM_EVENTO'], ['Código', 'Nome'], 'CD_EVENTO', nil)
  end else
    edt_EDI_NM_EVENTO.Text := ConsultaLookUP('TEVENTO','CD_EVENTO', edt_EDI_CD_EVENTO.Text,'NM_EVENTO');

end;

procedure Tfrm_relatorios_mail_aut.btn_EDI_PRODUTOClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_EDI_CD_PRODUTO.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end else
    edt_EDI_NM_PRODUTO.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', edt_EDI_CD_PRODUTO.Text,'NM_PRODUTO');

end;

procedure Tfrm_relatorios_mail_aut.edtCdAreaChange(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edtCdArea.Text := ConsultaOnLineEx('TAREA', 'Área', ['CD_AREA', 'NM_AREA'], ['Código', 'Nome'], 'CD_AREA', nil)
  end
  else
    edtNmArea.Text := ConsultaLookUP('TAREA', 'CD_AREA', edtCdArea.Text, 'NM_AREA');
end;

procedure Tfrm_relatorios_mail_aut.edtCdClienteChange(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edtCdCliente.Text := ConsultaOnLineEx('TEMPRESA_NAC', 'Cliente', ['CD_EMPRESA', 'NM_EMPRESA'], ['Código', 'Nome'], 'CD_EMPRESA', nil)
  end
  else
    edtNmCliente.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edtCdCliente.Text, 'NM_EMPRESA');
end;

procedure Tfrm_relatorios_mail_aut.btn_E06_ClienteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_E06_Cod_Cliente.Text := ConsultaOnLineEx('TEMPRESA_NAC', 'Clientes', ['CD_EMPRESA', 'NM_EMPRESA'], ['Código', 'Nome'], 'CD_EMPRESA', nil)
  end
  else
    edt_E06_Nome_Cliente.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_E06_Cod_Cliente.Text, 'NM_EMPRESA');
end;

procedure Tfrm_relatorios_mail_aut.btn_E06_Tranp_MercClick(Sender: TObject);
var
  SL: TStringList;
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
    begin
      SL := TStringList.Create;
      try
        SL.Add('SELECT DISTINCT T.CD_TRANSP_ROD, T.NM_TRANSP_ROD');
        SL.Add('FROM TTRANSP_ROD T (NOLOCK)');
        if Trim(edt_E06_Cod_Cliente.Text) <> '' then
          SL.Add('   INNER JOIN TCLIENTE_TRANSPORTADOR CT (NOLOCK) ON CT.CD_TRANSP = T.CD_TRANSP_ROD ');
        SL.Add('WHERE T.IN_ATIVO = "1"');
        if Trim(edt_E06_Cod_Cliente.Text) <> '' then
        begin
          SL.Add('  AND CT.CD_CLIENTE = "' + edt_E06_Cod_Cliente.Text + '"');
          if Trim(Edit149.Text) <> '' then
            SL.Add('  AND CT.CD_PRODUTO = "' + Edit149.Text + '"');
          if Trim(Edit143.Text) <> '' then
            SL.Add('  AND CT.CD_UNID_NEG = "' + Edit143.Text + '"');
          SL.Add('  AND CT.IN_ATIVO = "1"');
        end;
        edt_E06_Cod_Tranp_Merc.Text := ConsultaOnLineExSQL(SL.Text, 'Transportadores', ['CD_TRANSP_ROD', 'NM_TRANSP_ROD'], ['Código', 'Nome'], 'CD_TRANSP_ROD', nil);
      finally
        FreeAndNil(SL);
      end;
    end;
  end
  else
    edt_E06_Nome_Tranp_Merc.Text := ConsultaLookUP('TTRANSP_ROD', 'CD_TRANSP_ROD', edt_E06_Cod_Tranp_Merc.Text, 'NM_TRANSP_ROD');
end;

procedure Tfrm_relatorios_mail_aut.btn_DFF_UNID_NEGClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_DFF_CD_UNID_NEG.Text := ConsultaOnLineEx('TUNID_NEG', 'Unidades de Negócio', ['CD_UNID_NEG', 'AP_UNID_NEG'], ['Código', 'Nome'], 'CD_UNID_NEG', nil)
  end
  else
    edt_DFF_NM_UNID_NEG.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', edt_DFF_CD_UNID_NEG.Text, 'AP_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.btn_DFF_GRUPOClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_DFF_CD_GRUPO.Text := ConsultaOnLineEx('TGRUPO', 'Grupos', ['CD_GRUPO', 'NM_GRUPO'], ['Código', 'Nome'], 'CD_GRUPO', nil)
  end
  else
    edt_DFF_NM_GRUPO.Text := ConsultaLookUP('TGRUPO', 'CD_GRUPO', edt_DFF_CD_GRUPO.Text, 'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.btn_DFF_CLIENTEClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_DFF_CD_CLIENTE.Text := ConsultaOnLineEx('TEMPRESA_NAC', 'Clientes', ['CD_EMPRESA', 'NM_EMPRESA'], ['Código', 'Nome'], 'CD_EMPRESA', nil)
  end
  else
    edt_DFF_NM_CLIENTE.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_DFF_CD_CLIENTE.Text, 'NM_EMPRESA');
end;

procedure Tfrm_relatorios_mail_aut.btn_DFT_UNID_NEGClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_DFT_CD_UNID_NEG.Text := ConsultaOnLineEx('TUNID_NEG', 'Unidades de Negócio', ['CD_UNID_NEG', 'AP_UNID_NEG'], ['Código', 'Nome'], 'CD_UNID_NEG', nil)
  end
  else
    edt_DFT_NM_UNID_NEG.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', edt_DFT_CD_UNID_NEG.Text,'AP_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.btn_DFT_GRUPOClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_DFT_CD_GRUPO.Text := ConsultaOnLineEx('TGRUPO', 'Grupos', ['CD_GRUPO', 'NM_GRUPO'], ['Código', 'Nome'], 'CD_GRUPO', nil)
  end
  else
    edt_DFT_NM_GRUPO.Text := ConsultaLookUP('TGRUPO', 'CD_GRUPO', edt_DFT_CD_GRUPO.Text, 'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.btn_DFT_TRANSPORTADORClick(Sender: TObject);
var
  SL: TStringList;
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
    begin
      SL := TStringList.Create;
      try
        SL.Add('SELECT DISTINCT T.CD_TRANSP_ROD, T.NM_TRANSP_ROD');
        SL.Add('FROM TTRANSP_ROD T (NOLOCK)');
        if Trim(edt_DFT_CD_GRUPO.Text) <> '' then
        begin
          SL.Add('   INNER JOIN TCLIENTE_TRANSPORTADOR CT (NOLOCK) ON CT.CD_TRANSP = T.CD_TRANSP_ROD ');
          SL.Add('   INNER JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = CT.CD_CLIENTE ');
          SL.Add('   INNER JOIN TGRUPO G (NOLOCK) ON G.CD_GRUPO = EN.CD_GRUPO ');
        end;
        SL.Add('WHERE T.IN_ATIVO = "1"');
        if Trim(edt_DFT_CD_GRUPO.Text) <> '' then
        begin
          SL.Add('  AND G.CD_GRUPO = "' + edt_DFT_CD_GRUPO.Text + '"');
          if Trim(edt_DFT_CD_PRODUTO.Text) <> '' then
            SL.Add('  AND CT.CD_PRODUTO = "' + edt_DFT_CD_PRODUTO.Text + '"');
          if Trim(edt_DFT_CD_UNID_NEG.Text) <> '' then
            SL.Add('  AND CT.CD_UNID_NEG = "' + edt_DFT_CD_UNID_NEG.Text + '"');
          SL.Add('  AND CT.IN_ATIVO = "1"');
        end;
        edt_DFT_CD_TRANSPORTADOR.Text := ConsultaOnLineExSQL(SL.Text, 'Transportadores', ['CD_TRANSP_ROD', 'NM_TRANSP_ROD'], ['Código', 'Nome'], 'CD_TRANSP_ROD', nil);
      finally
        FreeAndNil(SL);
      end;
    end;
  end
  else
    edt_DFT_NM_TRANSPORTADOR.Text := ConsultaLookUP('TTRANSP_ROD', 'CD_TRANSP_ROD', edt_DFT_CD_TRANSPORTADOR.Text, 'NM_TRANSP_ROD');
end;

procedure Tfrm_relatorios_mail_aut.edt_DFJ_CD_UNID_NEGChange(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_DFJ_CD_UNID_NEG.Text := ConsultaOnLineEx('TUNID_NEG', 'Unidades de Negócio', ['CD_UNID_NEG', 'AP_UNID_NEG'], ['Código', 'Nome'], 'CD_UNID_NEG', nil)
  end
  else
    edt_DFJ_NM_UNID_NEG.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', edt_DFJ_CD_UNID_NEG.Text,'AP_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.edt_DFJ_CD_GRUPOChange(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_DFJ_CD_GRUPO.Text := ConsultaOnLineEx('TGRUPO', 'Grupos', ['CD_GRUPO', 'NM_GRUPO'], ['Código', 'Nome'], 'CD_GRUPO', nil)
  end
  else
    edt_DFJ_NM_GRUPO.Text := ConsultaLookUP('TGRUPO', 'CD_GRUPO', edt_DFJ_CD_GRUPO.Text, 'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.btn_FDT_UNID_NEGClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_FDT_CD_UNID_NEG.Text := ConsultaOnLineEx('TUNID_NEG', 'Unidades de Negócio', ['CD_UNID_NEG', 'AP_UNID_NEG'], ['Código', 'Nome'], 'CD_UNID_NEG', nil)
  end
  else
    edt_FDT_NM_UNID_NEG.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', edt_FDT_CD_UNID_NEG.Text,'AP_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.btn_FDT_GRUPOClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_FDT_CD_GRUPO.Text := ConsultaOnLineEx('TGRUPO', 'Grupos', ['CD_GRUPO', 'NM_GRUPO'], ['Código', 'Nome'], 'CD_GRUPO', nil)
  end
  else
    edt_FDT_NM_GRUPO.Text := ConsultaLookUP('TGRUPO', 'CD_GRUPO', edt_FDT_CD_GRUPO.Text, 'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.btn_FDT_TRANSPORTADORClick(Sender: TObject);
var
  SL: TStringList;
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
    begin
      SL := TStringList.Create;
      try
        SL.Add('SELECT DISTINCT T.CD_TRANSP_ROD, T.NM_TRANSP_ROD');
        SL.Add('FROM TTRANSP_ROD T (NOLOCK)');
        if Trim(edt_FDT_CD_CLIENTE.Text) <> '' then
          SL.Add('   INNER JOIN TCLIENTE_TRANSPORTADOR CT (NOLOCK) ON CT.CD_TRANSP = T.CD_TRANSP_ROD ')
        else if Trim(edt_FDT_CD_GRUPO.Text) <> '' then
        begin
          SL.Add('   INNER JOIN TCLIENTE_TRANSPORTADOR CT (NOLOCK) ON CT.CD_TRANSP = T.CD_TRANSP_ROD ');
          SL.Add('   INNER JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = CT.CD_CLIENTE ');
          SL.Add('   INNER JOIN TGRUPO G (NOLOCK) ON G.CD_GRUPO = EN.CD_GRUPO ');
        end;
        SL.Add('WHERE T.IN_ATIVO = "1"');
        if (Trim(edt_FDT_CD_GRUPO.Text) <> '') or (Trim(edt_FDT_CD_CLIENTE.Text) <> '') then
        begin
          if Trim(edt_FDT_CD_CLIENTE.Text) <> '' then
            SL.Add('  AND CT.CD_CLIENTE = "' + edt_FDT_CD_CLIENTE.Text + '"')
          else
            SL.Add('  AND G.CD_GRUPO = "' + edt_FDT_CD_GRUPO.Text + '"');
          if Trim(edt_FDT_CD_PRODUTO.Text) <> '' then
            SL.Add('  AND CT.CD_PRODUTO = "' + edt_FDT_CD_PRODUTO.Text + '"');
          if Trim(edt_FDT_CD_UNID_NEG.Text) <> '' then
            SL.Add('  AND CT.CD_UNID_NEG = "' + edt_FDT_CD_UNID_NEG.Text + '"');
          SL.Add('  AND CT.IN_ATIVO = "1"');
        end;
        edt_FDT_CD_TRANSPORTADOR.Text := ConsultaOnLineExSQL(SL.Text, 'Transportadores', ['CD_TRANSP_ROD', 'NM_TRANSP_ROD'], ['Código', 'Nome'], 'CD_TRANSP_ROD', nil);
      finally
        FreeAndNil(SL);
      end;
    end;
  end
  else
    edt_DFT_NM_TRANSPORTADOR.Text := ConsultaLookUP('TTRANSP_ROD', 'CD_TRANSP_ROD', edt_DFT_CD_TRANSPORTADOR.Text, 'NM_TRANSP_ROD');
end;

procedure Tfrm_relatorios_mail_aut.btn_FDT_CLIENTEClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_FDT_CD_CLIENTE.Text := ConsultaOnLineEx('TEMPRESA_NAC', 'Clientes', ['CD_EMPRESA', 'NM_EMPRESA'], ['Código', 'Nome'], 'CD_EMPRESA', nil)
  end
  else
    edt_FDT_NM_CLIENTE.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_FDT_CD_CLIENTE.Text, 'NM_EMPRESA');
end;

procedure Tfrm_relatorios_mail_aut.btn_DFA_UNID_NEGClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_DFA_CD_UNID_NEG.Text := ConsultaOnLineEx('TUNID_NEG', 'Unidades de Negócio', ['CD_UNID_NEG', 'AP_UNID_NEG'], ['Código', 'Nome'], 'CD_UNID_NEG', nil)
  end
  else
    edt_DFA_NM_UNID_NEG.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', edt_DFA_CD_UNID_NEG.Text,'AP_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.btn_DFA_GRUPOClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_DFA_CD_GRUPO.Text := ConsultaOnLineEx('TGRUPO', 'Grupos', ['CD_GRUPO', 'NM_GRUPO'], ['Código', 'Nome'], 'CD_GRUPO', nil)
  end
  else
    edt_DFA_NM_GRUPO.Text := ConsultaLookUP('TGRUPO', 'CD_GRUPO', edt_DFA_CD_GRUPO.Text, 'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.edt_DFA_CLIENTEClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_DFA_CD_CLIENTE.Text := ConsultaOnLineEx('TEMPRESA_NAC', 'Clientes', ['CD_EMPRESA', 'NM_EMPRESA'], ['Código', 'Nome'], 'CD_EMPRESA', nil)
  end
  else
    edt_DFA_NM_CLIENTE.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_DFA_CD_CLIENTE.Text, 'NM_EMPRESA');
end;

procedure Tfrm_relatorios_mail_aut.edt_DFA_ARMADORClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_DFA_CD_ARMADOR.Text := ConsultaOnLineEx('TAGENTE', 'Agentes', ['CD_AGENTE', 'NM_AGENTE'], ['Código', 'Nome'], 'CD_AGENTE', nil)
  end
  else
    edt_DFA_NM_ARMADOR.Text := ConsultaLookUP('TAGENTE', 'CD_AGENTE', edt_DFA_CD_ARMADOR.Text, 'NM_AGENTE');
end;

procedure Tfrm_relatorios_mail_aut.btn_DF0_TERMINALClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_DF0_CD_TERMINAL.Text := ConsultaOnLineEx('TARMAZEM', 'Grupos', ['CD_ARMAZEM', 'NM_ARMAZEM'], ['Código', 'Nome'], 'CD_ARMAZEM', nil)
  end
  else
    edt_DF0_NM_TERMINAL.Text := ConsultaLookUP('TARMAZEM', 'CD_ARMAZEM', edt_DF0_CD_TERMINAL.Text, 'NM_ARMAZEM');
end;

procedure Tfrm_relatorios_mail_aut.btn_DF0_GRUPOClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_DF0_CD_GRUPO.Text := ConsultaOnLineEx('TGRUPO', 'Grupos', ['CD_GRUPO', 'NM_GRUPO'], ['Código', 'Nome'], 'CD_GRUPO', nil)
  end
  else
    edt_DF0_NM_GRUPO.Text := ConsultaLookUP('TGRUPO', 'CD_GRUPO', edt_DF0_CD_GRUPO.Text, 'NM_GRUPO');
end;

procedure Tfrm_relatorios_mail_aut.btn_DF0_UNID_NEGClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_DF0_CD_UNID_NEG.Text := ConsultaOnLineEx('TUNID_NEG', 'Unidades de Negócio', ['CD_UNID_NEG', 'AP_UNID_NEG'], ['Código', 'Nome'], 'CD_UNID_NEG', nil)
  end
  else
    edt_DF0_NM_UNID_NEG.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', edt_DF0_CD_UNID_NEG.Text,'AP_UNID_NEG');
end;

procedure Tfrm_relatorios_mail_aut.btn_DF0_CLIENTEClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_relatorios_mail_aut.qry_relatorios_mail_aut_) then
      edt_DF0_CD_CLIENTE.Text := ConsultaOnLineEx('TEMPRESA_NAC', 'Clientes', ['CD_EMPRESA', 'NM_EMPRESA'], ['Código', 'Nome'], 'CD_EMPRESA', nil)
  end
  else
    edt_DF0_NM_CLIENTE.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_DF0_CD_CLIENTE.Text, 'NM_EMPRESA');
end;



procedure Tfrm_relatorios_mail_aut.btnPesquisarClick(Sender: TObject);
var
  filtro : string;
  codigo : string;
begin
  if {(edt_chave.text <> '') or} (edtDescricao.text <> '') then
  begin
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.DisableControls;
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.close;
    

    filtro := '';
    if (edtDescricao.text <> '') then
      filtro := ' AND NM_RELATORIO LIKE '+QuotedStr('%' + edtDescricao.text + '%');

    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.sql.text := datm_relatorios_mail_aut.GetSqlRelatorios;
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.SQL.Strings[datm_relatorios_mail_aut.qry_relatorios_mail_aut_.SQL.Count-2] := filtro;

    ConfiguraParametroAtivo(chk_ativo_disparo.checked);
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.open;
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.EnableControls;
    QueryFiltrada := true;
  end
  else
  begin
    codigo :=  datm_relatorios_mail_aut.qry_relatorios_mail_aut_.fieldByName('CD_RELATORIO').asstring;
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.DisableControls;
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.close;
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.sql.text := datm_relatorios_mail_aut.GetSqlRelatorios;
    ConfiguraParametroAtivo(chk_ativo_disparo.checked);
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.open;
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.Locate({vOrdenadoPor} 'CD_RELATORIO', codigo, [loPartialKey, loCaseInsensitive]);
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.EnableControls;
    QueryFiltrada := false;
  end;
end;

procedure Tfrm_relatorios_mail_aut.HabilitaPaineis;
begin
    if dbEdit2.Text='EDI' then
       panel1.Visible:=false
    else
       panel1.Visible:=True;

    if DBEdit2.Text = '009' then
      nb_config.ActivePage := '008'
    else
    if (DBEdit2.text = 'E07') or (DBEdit2.text = 'E14') or (DBEdit2.text = 'E15') then
      nb_config.ActivePage := 'E06'
    else
    if (DBEdit2.text = 'E08') or (DBEdit2.text = 'E09') OR  (DBEdit2.text = 'E10')  OR  (DBEdit2.text = 'E11')  OR  (DBEdit2.text = 'E18')  then
      nb_config.ActivePage := 'E05'
    else
    if (DBEdit2.text = 'E16') or (DBEdit2.text = 'E17')  then
      nb_config.ActivePage := 'IVN'
    else
      nb_config.ActivePage := DBEdit2.Text;
end;

procedure Tfrm_relatorios_mail_aut.RemoverFiltro;
begin
  if pgctrl_documento.TabIndex = 0 then
  begin
    if QueryFiltrada then
    begin
      edtDescricao.Text := '';
      btnPesquisar.click;
    end;
  end;
end;
procedure Tfrm_relatorios_mail_aut.chk_ativo_disparoClick(Sender: TObject);
begin
  datm_relatorios_mail_aut.qry_relatorios_mail_aut_.Close;
  ConfiguraParametroAtivo(chk_ativo_disparo.checked);
  datm_relatorios_mail_aut.qry_relatorios_mail_aut_.Open;
end;

procedure Tfrm_relatorios_mail_aut.spTpArquivoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If (Sender as TSpeedButton).Enabled Then
      edtTPDocto.Text := ConsultaOnLineEx('TTP_DOCTO_DIGITALIZADO','Tipo Documento',
                                          ['CD_TIPO_DOCTO', 'NM_TIPO_DOCTO'],
                                          ['Código', 'Documento'],
                                          'CD_TIPO_DOCTO',nil)
  end
  else
    edtDocumento.Text := ConsultaLookUP('TTP_DOCTO_DIGITALIZADO','CD_TIPO_DOCTO', edtTPDocto.Text  ,'NM_TIPO_DOCTO');
end;

procedure Tfrm_relatorios_mail_aut.chkEnviarParaDigitalizacaoClick(Sender: TObject);
begin
  HabilitaPanelTipoDoc;
end;

procedure Tfrm_relatorios_mail_aut.edtTPDoctoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['1','2','3','4','5','6','7','8','9','0']) then
    key :=#0;
end;

procedure Tfrm_relatorios_mail_aut.HabilitaPanelTipoDoc;
begin
  pnlTipoArquivo.Enabled := chkEnviarParaDigitalizacao.checked;

  if not pnlTipoArquivo.enabled then
    edtTPDocto.color :=  clBtnFace
  else
    edtTPDocto.color :=  clWindow;
end;

procedure Tfrm_relatorios_mail_aut.ConfiguraParametroAtivo(somenteAtivo : boolean);
var Ativo : String;
begin
    if somenteAtivo then
      Ativo := '1'
    else
      Ativo := '';
      
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.ParamByName('ATIVO').DataType   := ftString;
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.ParamByName('ATIVO').ParamType  := ptInput;
    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.ParamByName('ATIVO').size       := 1;

    datm_relatorios_mail_aut.qry_relatorios_mail_aut_.ParamByName('ATIVO').AsString   := Ativo;
end;

end.

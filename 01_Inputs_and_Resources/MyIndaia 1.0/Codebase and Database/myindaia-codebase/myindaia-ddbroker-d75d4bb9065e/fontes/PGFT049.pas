(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGFT049.PAS - Formulário - Nota Fiscal de Serviço/Fatura ==> Indaiá
DATA: 29/01/2002
Manutenção:
*************************************************************************************************)

unit PGFT049;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, StdCtrls, Mask, ExtCtrls, UCRPE32, DBCtrls, DBCGrids, Grids, DateUtils,
  DBGrids, Menus, DosLib, ComCtrls, DBTables, RAWPrinter, Funcoes, RxGIF,
  ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppMemo, ppParameter,
  ppSubRpt, ppRegion, jpeg, ConsOnlineEx, StrUtils, ppVar;

type
  Tfrm_nf_serv = class(TForm)
    Panel1: TPanel;
    pnl_cadastro: TPanel;
    btn_imprimir: TSpeedButton;
    btn_sair: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_imprime: TMenuItem;
    mi_sair: TMenuItem;
    crp_nf_serv: TCrpe;
    pgctrl_nf_serv: TPageControl;
    ts_sol: TTabSheet;
    dbgrdSol: TDBGrid;
    dbgrd_proc: TDBGrid;
    ts_adm: TTabSheet;
    dbgrd_adm: TDBGrid;
    btn_desmarca_todas: TSpeedButton;
    btn_marca_todas: TSpeedButton;
    mi_marca_todas: TMenuItem;
    mi_desmarca_todas: TMenuItem;
    ts_obs: TTabSheet;
    btn_salvar: TSpeedButton;
    mi_salvar: TMenuItem;
    btn_cancelar: TSpeedButton;
    mi_cancelar: TMenuItem;
    btn_co_obs: TSpeedButton;
    mem_obs: TMemo;
    btn_preview: TSpeedButton;
    mi_preview: TMenuItem;
    btn_preview_rateio_desp: TSpeedButton;
    NotaFiscal1: TMenuItem;
    RateiodeDespesas1: TMenuItem;
    ppReport1: TppReport;
    btnPrev: TSpeedButton;
    qryNF: TQuery;
    dsNF: TDataSource;
    qryNFcalcUNEnd: TStringField;
    qryNFcalcUNBairro: TStringField;
    qryNFcalcUNIE: TStringField;
    qryNFcalcUNFax: TStringField;
    qryNFcalcEmissao: TStringField;
    qryNFcalcENEnd: TStringField;
    qryNFcalcENIE: TStringField;
    qryNFcalcNrDocto: TStringField;
    qryNFcalcCol1: TStringField;
    qryNFcalcCol2: TStringField;
    qryNFCD_UNID_NEG: TStringField;
    qryNFCD_PRODUTO: TStringField;
    qryNFNR_SOLICITACAO: TStringField;
    qryNFNR_PROCESSO: TStringField;
    qryNFNR_PROC: TStringField;
    qryNFDT_EMISSAO: TDateTimeField;
    qryNFDT_VENCIMENTO: TDateTimeField;
    qryNFNR_RELATORIO: TStringField;
    qryNFNR_ANO: TStringField;
    qryNFNM_REFERENCIA: TStringField;
    qryNFNM_NAT_DESPACHO: TStringField;
    qryNFNM_VEICULO: TStringField;
    qryNFQT_EMBALAGEM: TIntegerField;
    qryNFVL_PESO_BRUTO: TFloatField;
    qryNFVL_PESO_LIQUIDO: TFloatField;
    qryNFVL_FOB: TFloatField;
    qryNFVL_CIF: TFloatField;
    qryNFNR_DI: TStringField;
    qryNFVL_TOT_NAO_TRIBUTAVEL: TFloatField;
    qryNFVL_SUB_TOT_TRIBUTAVEL: TFloatField;
    qryNFVL_COMISSAO: TFloatField;
    qryNFVL_TOT_GERAL: TFloatField;
    qryNFVL_TOT_TRIBUTAVEL: TFloatField;
    qryNFVL_IR: TFloatField;
    qryNFVL_ISS: TFloatField;
    qryNFCD_EMISSOR: TStringField;
    qryNFIN_QUADRO_TOTAL: TStringField;
    qryNFTX_HISTORICO: TMemoField;
    qryNFNM_ESPECIE: TStringField;
    qryNFTX_OBS: TMemoField;
    qryNFVL_RETENCAO: TFloatField;
    qryNFNM_VIA: TStringField;
    qryNFCNPJ_UNID: TStringField;
    qryNFEND_UNID_NEG: TStringField;
    qryNFEND_NUMERO: TStringField;
    qryNFEND_BAIRRO: TStringField;
    qryNFEND_CIDADE: TStringField;
    qryNFEND_UF: TStringField;
    qryNFIE_UNID_NEG: TStringField;
    qryNFIM_UNID_NEG: TStringField;
    qryNFFONE_UNID: TStringField;
    qryNFEND_CEP: TStringField;
    qryNFNR_FAX1: TStringField;
    qryNFNR_FAX2: TStringField;
    qryNFCLI: TStringField;
    qryNFCLI_END: TStringField;
    qryNFCLI_NUM: TStringField;
    qryNFCLI_CID: TStringField;
    qryNFCLI_BAIRRO: TStringField;
    qryNFCLI_UF: TStringField;
    qryNFCLI_CEP: TStringField;
    qryNFCNPJ_EMP: TStringField;
    qryNFIE_EMPRESA: TStringField;
    qryNFNM_AREA: TStringField;
    qryNFNM_CONTATO: TStringField;
    qryNFNM_VIA_TRANSP: TStringField;
    qryNFORIGEM: TStringField;
    qryNFDESTINO: TStringField;
    qryNFTP_TIPO_FAT: TStringField;
    qryNFNR_NF_SERV: TStringField;
    qryNFNM_EMPRESA: TStringField;
    qryNFIN_EXP_NF: TStringField;
    qryNFAREA: TStringField;
    qryNFCALC_RETENCAO: TFloatField;
    BDENF: TppBDEPipeline;
    BDENumerario: TppBDEPipeline;
    qryNFTP_VIA: TStringField;
    ppParameterList1: TppParameterList;
    qryNFCD_ITEM: TStringField;
    qryNFNM_ITEM: TStringField;
    qryNFVL_ITEM: TFloatField;
    qryNFIN_COLUNA: TStringField;
    qryNFNR_ORDEM_FAT: TIntegerField;
    qryNFCALCITEM: TStringField;
    qryNFVLCLIENTE: TFloatField;
    qryNFVLINDAIA: TFloatField;
    qryNFVLSERVICO: TFloatField;
    qryNFVOLUME: TStringField;
    dsNumerario: TDataSource;
    qryNumerario: TQuery;
    qryNumerarioCD_UNID_NEG: TStringField;
    qryNumerarioCD_PRODUTO: TStringField;
    qryNumerarioNR_SOLICITACAO: TStringField;
    qryNumerarioVL_NUM: TFloatField;
    qryNumerarioDT_NUM: TDateTimeField;
    qryNumerarioNR_FP: TStringField;
    qryNumerarioFP: TStringField;
    qryNFVL_TOT_NUM: TFloatField;
    qryNFNM_IR: TStringField;
    qryNFNM_SALDO: TStringField;
    qryNFVL_SALDO: TFloatField;
    qryNFNM_RETENCAO: TStringField;
    qryNFCALC_RETENCAO2: TFloatField;
    qryNFNM_COFINS_PREVIEW: TStringField;
    btnImp: TSpeedButton;
    pnl: TPanel;
    lbl_data: TLabel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    lbl_nr_nf_ini: TLabel;
    lbl_tipo_nf_serv: TLabel;
    lbl_nr_solicitacao: TLabel;
    lbl_nr_nf: TLabel;
    lbl_nr_processo: TLabel;
    lbl_cd_referencia: TLabel;
    lbl_nr_ndc: TLabel;
    msk_data: TMaskEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_nr_nf_ini: TMaskEdit;
    cbo_tipo_nf_serv: TComboBox;
    msk_nr_solicitacao: TMaskEdit;
    msk_nr_nf: TMaskEdit;
    msk_nr_processo: TMaskEdit;
    msk_cd_referencia: TMaskEdit;
    chk_inc_canc: TCheckBox;
    msk_nr_ndc: TMaskEdit;
    qryNFPREVIEW: TStringField;
    qryNFVL_IR_RETIDO: TFloatField;
    qryNFVL_COFINS_RETIDO: TFloatField;
    SpeedButton1: TSpeedButton;
    qryNotasSG: TQuery;
    Label1: TLabel;
    qryNotasSGNR_SOLICITACAO: TStringField;
    qryNotasSGCD_UNID_NEG: TStringField;
    qryNotasSGCD_PRODUTO: TStringField;
    lblStatus: TLabel;
    Shape1: TShape;
    Panel2: TPanel;
    Label2: TLabel;
    edtAnoNotaSG: TEdit;
    ComboBox1: TComboBox;
    Label3: TLabel;
    qry_processos: TQuery;
    qry_processosNR_PROCESSO: TStringField;
    qryNFTOTAL: TFloatField;
    BDENFppField96: TppField;
    qryNFNM_AGENTE: TStringField;
    BDENFppField97: TppField;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppFooterBand1: TppFooterBand;
    SubNumerario: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppDBText52: TppDBText;
    ppLabel47: TppLabel;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppOBS: TppDBMemo;
    RegSoma1: TppRegion;
    ppLabel56: TppLabel;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText55: TppDBText;
    RegISS: TppRegion;
    ppLabel60: TppLabel;
    ppDBText60: TppDBText;
    RegSoma2: TppRegion;
    ppLabel64: TppLabel;
    ppDBText61: TppDBText;
    ppDBText63: TppDBText;
    ppDBText65: TppDBText;
    ppLine47: TppLine;
    ppPageStyle1: TppPageStyle;
    ppImage3: TppImage;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLabel4: TppLabel;
    ppLine18: TppLine;
    ppLine21: TppLine;
    ppLine29: TppLine;
    ppLine22: TppLine;
    ppLine30: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppDBText56: TppDBText;
    ppImage5: TppImage;
    ppImage4: TppImage;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText37: TppDBText;
    ppLabel46: TppLabel;
    ppLabel57: TppLabel;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppLabel58: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel23: TppLabel;
    ppDBText59: TppDBText;
    qryNFLBL_EXPORTADOR: TStringField;
    qryNFNM_EXPORTADOR: TStringField;
    BDENFppField98: TppField;
    BDENFppField99: TppField;
    ppDBText62: TppDBText;
    ppDBText64: TppDBText;
    qryNFDT_DESEMBARACAO: TStringField;
    BDENFppField100: TppField;
    ppDBText66: TppDBText;

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
    procedure msk_nr_nf_iniChange(Sender: TObject);
    procedure msk_dataEnter(Sender: TObject);
    procedure cbo_tipo_nf_servChange(Sender: TObject);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure dbgrdSolKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_nr_solicitacaoEnter(Sender: TObject);
    procedure msk_nr_nfEnter(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure msk_cd_referenciaEnter(Sender: TObject);
    procedure msk_nr_solicitacaoExit(Sender: TObject);
    procedure msk_nr_nfExit(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_cd_referenciaExit(Sender: TObject);
    procedure chk_inc_cancExit(Sender: TObject);
    procedure pgctrl_nf_servChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure mem_obsChange(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure pgctrl_nf_servChange(Sender: TObject);
    procedure btn_co_obsClick(Sender: TObject);
    procedure chk_inc_cancClick(Sender: TObject);
    procedure btn_previewClick(Sender: TObject);
    procedure dbgrd_admKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_preview_rateio_despClick(Sender: TObject);
    procedure msk_nr_ndcEnter(Sender: TObject);
    procedure msk_nr_ndcExit(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure qryNFCalcFields(DataSet: TDataSet);
    procedure btnImpClick(Sender: TObject);
    procedure msk_cd_unid_negChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);


  private
    impressora : String;
    st_unid_neg, st_prod : String[2];
    st_nr_solicitacao, st_nr_nf, st_nr_processo, st_cd_referencia, st_nr_ndc: String;
    str_cr : String;
    lMaisProc : Boolean;
    dt_fatura : String;
    lPulo : Boolean;
    nr_ult_nf_serv : Integer;
    procedure AbreNFServ;
    procedure Cancelar;
    procedure CarregaObs;
    function UltNrNF : String;
    function VerAlt : Boolean;
    function Grava    : Boolean;
    function Gera_Arquivo_SERVICO : Boolean;
    procedure GeraNFOp;
    procedure GeraNFAdm;
    procedure btn_mi( Salv : Boolean; Canc : Boolean );
    procedure pBeforePrint(Sender: TObject);
    procedure pBeforePrint2(Sender: TObject);
    procedure pBeforePrint3(Sender: TObject);
    procedure ConsistePreviewFatura;
    procedure RetemImpostos ( nr_processo : string);
  public
  end;

var
  frm_nf_serv: Tfrm_nf_serv;
  Device, Driver, Port : String;
  DevMode :THandle;



implementation

{$R *.DFM}

uses GSMLIB, FILETEXT, PGGP001, PGGP017, PGFT050, PGSM010, PGSM018, PGSM174, WinSpool,
  PGSM990;

procedure Tfrm_nf_serv.btn_sairClick(Sender: TObject);
begin
  if datm_nf_serv.qry_fat_sol_.State in [dsInsert, dsEdit] then datm_nf_serv.qry_fat_sol_.Post;
  Close;
end;

procedure Tfrm_nf_serv.msk_cd_unid_negExit(Sender: TObject);
begin
  if Trim( msk_cd_unid_neg.Text ) = st_unid_neg then Exit;
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text <> '' then
  begin
    with datm_nf_serv do
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '"';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
        msk_nr_nf_ini.Text   := UltNrNF;
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
    AbreNFServ;
end;

procedure Tfrm_nf_serv.msk_cd_produtoExit(Sender: TObject);
begin
  if trim(msk_nr_nf_ini.Text) <> '' then msk_nr_nf_ini.Text  := StrZero( StrToInt( msk_nr_nf_ini.Text ), msk_nr_nf_ini.MaxLength );

  if Trim( msk_cd_produto.Text ) = st_prod then Exit;
  ValCodEdt( msk_cd_produto );
  if msk_cd_produto.Text <> '' then
  begin
    with datm_nf_serv do
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
  AbreNFServ;
end;

procedure Tfrm_nf_serv.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_nf_serv do
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

procedure Tfrm_nf_serv.btn_co_produtoClick(Sender: TObject);
begin
  with datm_nf_serv do
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
procedure Tfrm_nf_serv.msk_dataExit(Sender: TObject);
begin
  if dt_fatura = msk_data.Text then Exit;
  try
    if msk_data.Text <> '  /  /    ' then StrToDate( msk_data.Text);
  except
    on EConvertError do
    begin
      BoxMensagem( 'Data Inválida!', 2 );
      msk_data.Clear;
    end;
  end;
  AbreNFServ;
end;
{$HINTS ON}

procedure Tfrm_nf_serv.btn_imprimirClick(Sender: TObject);
begin
  //rotina antiga de preview (24/09/2007)
  //botão invisível

  if Not Consiste then Exit;

  with datm_nf_serv, crp_nf_serv do
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

    if Trim( msk_cd_unid_neg.Text ) = '01' then
    begin
      impressora := VerImp;
      if impressora = '' then Exit;
    end;

    Gera_Arquivo_SERVICO;
  end;
end;

procedure Tfrm_nf_serv.FormShow(Sender: TObject);
begin
  pgctrl_nf_serv.ActivePage := ts_sol;
  st_unid_neg               := '';
  st_prod                   := '';
  dt_fatura                 := '';
  ts_adm.TabVisible         := False;
  ts_obs.TabVisible         := False;
  msk_data.Text             := FormatDateTime('dd/mm/yyyy', dt_server);
  Caption := 'Emissão da N.F. Serviço/Fatura';

  with datm_nf_serv do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_unid_neg_.Prepare;
    qry_produto_.Prepare;
    qry_unid_neg_.Open;
    qry_produto_.Open;

    lbl_nr_nf_ini.Visible := True;
    msk_nr_nf_ini.Visible := True;

    //ABRIR TEMPORARIAMENTE
//    msk_nr_nf_ini.TabStop  := True;
//    msk_nr_nf_ini.ReadOnly := False;
//    msk_nr_nf_ini.Color    := clWindow;

    msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_unid_negExit(nil);
    msk_cd_produto.Text  := str_cd_produto;
    msk_cd_produtoExit(nil);

    lbl_tipo_nf_serv.Visible := True;
    cbo_tipo_nf_serv.Visible := True;
    cbo_tipo_nf_serv.ItemIndex := 0;

    msk_nr_nf_ini.Text := UltNrNF;

    AbreNFServ;
  end;
end;

procedure Tfrm_nf_serv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_nf_serv do
  begin
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_grd_sol_.Close;
    qry_fat_sol_.Close;
    qry_fat_proc_.Close;
    Free;
  end;
  crp_nf_serv.Free;
  Action := caFree;
end;

procedure Tfrm_nf_serv.FormCreate(Sender: TObject);
begin
 // Inicializa o Data Module para Seleção de Recebimento
  Application.CreateForm( Tdatm_nf_serv, datm_nf_serv );
end;

function Tfrm_nf_serv.Consiste : Boolean;
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

procedure Tfrm_nf_serv.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_nf_serv.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto  then btn_co_produtoClick(nil);
    if Sender = mem_obs         then btn_co_obsClick(nil);
  end;
end;

procedure Tfrm_nf_serv.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_nf_serv.msk_cd_produtoEnter(Sender: TObject);
begin
  st_prod := msk_cd_produto.Text;
end;

function Tfrm_nf_serv.Gera_Arquivo_SERVICO : Boolean;
var
  i : integer;
begin
  //Modelo da Comissária Indaiá
  Gera_Arquivo_SERVICO := True;

  lMaisProc := False;

  with datm_nf_serv do
  begin
    str_cr := #13#10;

    if pgctrl_nf_serv.ActivePage = ts_sol then //Nota Fiscal proveniente de fatura
    begin
      try
        datm_main.db_broker.StartTransaction;

        if ( Trim( msk_nr_nf_ini.Text ) = '' ) then msk_nr_nf_ini.Text := '000000';
        nr_ult_nf_serv := StrToInt( Trim( msk_nr_nf_ini.Text ) );

        lPulo := True;
        if dbgrdSol.SelectedRows.Count > 0 then
        begin
          for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
          begin
            TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));

            CloseStoredProc( sp_nf_serv_op );
            with sp_nf_serv_op do
            begin
              ParamByName('@cd_unid_neg').AsString    := msk_cd_unid_neg.Text;
              ParamByName('@cd_produto').AsString     := msk_cd_produto.Text;
              ParamByName('@nr_solicitacao').AsString := qry_grd_sol_NR_SOLICITACAO.AsString;
            end;
            ExecStoredProc( sp_nf_serv_op );
            CloseStoredProc( sp_nf_serv_op );
            (*
            // Grava nº da nota na TNF_RETENCAO
            qry_nota_retencao_.Close;
            qry_nota_retencao_.Prepare;
            qry_nota_retencao_.Open;

            if Not ( qry_nota_retencao_.State in [dsInsert, dsEdit] ) then qry_nota_retencao_.Edit;
            qry_nota_retencao_NR_NOTA.AsString     := Replicate( '0', 6 - Length( Trim( IntToStr( nr_ult_nf_serv ) ) ) ) +
                                                   Trim( IntToStr( nr_ult_nf_serv ) );
            qry_nota_retencao_.Post;
            qry_nota_retencao_.Close;
             *)
            // Grava nº da nota na TNF_RETENCAO acumuladas
            (*
            qry_nota_retencao_acum_.Close;
            qry_nota_retencao_acum_.Prepare;
            qry_nota_retencao_acum_.Open;

            if Not ( qry_nota_retencao_acum_.State in [dsInsert, dsEdit] ) then qry_nota_retencao_acum_.Edit;
            qry_nota_retencao_acum_NR_NOTA_ACUMULADA.AsString     := Replicate( '0', 6 - Length( Trim( IntToStr( nr_ult_nf_serv ) ) ) ) +
                                                        Trim( IntToStr( nr_ult_nf_serv ) );
            qry_nota_retencao_acum_.Post;
            qry_nota_retencao_acum_.Close;
             *)
            qry_fat_sol_.Close;
            qry_fat_sol_.Prepare;
            qry_fat_sol_.Open;


            if Not ( qry_fat_sol_.State in [dsInsert, dsEdit] ) then qry_fat_sol_.Edit;

            qry_fat_sol_NR_NF_SERV.AsString     := Replicate( '0', 6 - Length( Trim( IntToStr( nr_ult_nf_serv ) ) ) ) +
                                                   Trim( IntToStr( nr_ult_nf_serv ) );
            qry_fat_sol_NR_NOTA_FATURA.AsString := qry_fat_sol_NR_NF_SERV.AsString;

            nr_ult_nf_serv := nr_ult_nf_serv + 1;

            qry_fat_sol_IN_IMP_NF_SERV.AsString := '1';
            qry_fat_sol_DT_NF_SERV.AsDateTime   := dt_server;
            qry_fat_sol_.Post;


            //Realizar Evento
            if qry_fat_sol_TP_TIPO_FAT.AsString = 'F' then
            begin
              CloseStoredProc(sp_atz_evento);
              sp_atz_evento.ParamByName('@NR_PROCESSO').AsString     := qry_fat_proc_NR_PROCESSO.AsString;
              sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString   := 'CD_EV_ENVIO_FAT';
              sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := qry_fat_sol_DT_FATURA.AsDateTime;
              ExecStoredProc(sp_atz_evento);
              CloseStoredProc(sp_atz_evento);
            end;

            if i = ( dbgrdSol.SelectedRows.Count - 1 ) then lPulo := False;

              //Imprimir Nota Fiscal
            if Trim( msk_cd_unid_neg.Text ) = '01' then
            begin
              GeraNFOp;
            end;
          end;

          if Trim( msk_cd_unid_neg.Text ) = '02' then
          begin
            with crp_nf_serv do
            begin
              Connect        := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
              ReportName     := cDir_Rpt + '\CRNF003.RPT';
              ParamFields[0] := Trim( str_cd_usuario );
              Execute;
            end;

            qry_ajuste_impressao_.Close;
            qry_ajuste_impressao_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
            qry_ajuste_impressao_.Prepare;
            qry_ajuste_impressao_.Open;
            if qry_ajuste_impressao_.RecordCount = 0 then
            begin
              BoxMensagem( 'Ajuste de Impressão não cadastrado!', 2 );
              qry_ajuste_impressao_.Close;
              Exit;
            end;

            qry_ajuste_impressao_.Edit;
            qry_ajuste_impressao_NR_ULT_NF_SERV.AsString := qry_fat_sol_NR_NF_SERV.AsString;
            qry_ajuste_impressao_.Post;
          end;

          with datm_nf_serv.qry_atz_dados_ do
          begin
            SQL.Clear;
            SQL.Add( 'UPDATE TNF_SERV_OP SET CD_EMISSOR = "" WHERE CD_EMISSOR = "' + str_cd_usuario + '"' );
            Prepare;
            ExecSQL;
          end;

        end;
        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        BoxMensagem( 'Erro ao tentar imprimir Nota Fiscal!', 2 );
        Exit;
      end;

      btn_desmarca_todasClick(nil);

      msk_nr_nf_ini.Text := Replicate( '0', 6 - Length( Trim( IntToStr( nr_ult_nf_serv ) ) ) ) +
                                                Trim( IntToStr( nr_ult_nf_serv ) );

      qry_grd_sol_.Close;
      qry_grd_sol_.Prepare;
      qry_grd_sol_.Open;

    end
    else //Nota Fiscal proveniente de Nota
    begin
      try
        datm_main.db_broker.StartTransaction;

        if ( Trim( msk_nr_nf_ini.Text ) = '' ) then msk_nr_nf_ini.Text := '000000';
        nr_ult_nf_serv := StrToInt( Trim( msk_nr_nf_ini.Text ) );

        lPulo := True;
        if dbgrd_adm.SelectedRows.Count > 0 then
        begin
          for i := 0 to dbgrd_adm.SelectedRows.Count - 1 do
          begin
            TTable(dbgrd_adm.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_adm.SelectedRows[i]));

            CloseStoredProc( sp_nf_serv_adm );
            with sp_nf_serv_adm do
            begin
              ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
              ParamByName('@nr_docto').AsString    := qry_grd_adm_NR_DOCTO.AsString;
            end;
            ExecStoredProc( sp_nf_serv_adm );
            CloseStoredProc( sp_nf_serv_adm );

            qry_atz_adm_.Close;
            qry_atz_adm_.ParamByName('NR_DOCTO').AsString   := qry_grd_adm_NR_DOCTO.AsString;
            qry_atz_adm_.ParamByName('NR_NF_SERV').AsString := Replicate( '0', 6 - Length( Trim( IntToStr( nr_ult_nf_serv ) ) ) ) +
                                                               Trim( IntToStr( nr_ult_nf_serv ) );
            qry_atz_adm_.ExecSQL;

            qry_fav_adm_.Close;
            qry_fav_adm_.Prepare;
            qry_fav_adm_.Open;

            nr_ult_nf_serv := nr_ult_nf_serv + 1;

            if i = ( dbgrd_adm.SelectedRows.Count - 1 ) then lPulo := False;

            //Imprimir Nota Fiscal
            GeraNFAdm;
          end;

          with datm_nf_serv.qry_atz_dados_ do
          begin
            SQL.Clear;
            SQL.Add( 'UPDATE TNF_SERV_ADM SET CD_EMISSOR = "" WHERE CD_EMISSOR = "' + str_cd_usuario + '"' );
            Prepare;
            ExecSQL;
          end;

        end;
        datm_main.db_broker.Commit;

      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        BoxMensagem( 'Erro ao tentar imprimir Nota Fiscal!', 2 );
        Exit;
      end;

      btn_desmarca_todasClick(nil);

      qry_grd_adm_.Close;
      qry_grd_adm_.Prepare;
      qry_grd_adm_.Open;
    end;
  end;

  Screen.Cursor := crDefault;
  Application.ProcessMessages;

  msk_nr_nf_ini.Text := UltNrNF;
end;

procedure Tfrm_nf_serv.msk_nr_nf_iniChange(Sender: TObject);
begin
  if Trim( msk_nr_nf_ini.Text ) <> '' then nr_ult_nf_serv := StrToInt( msk_nr_nf_ini.Text );
end;

procedure Tfrm_nf_serv.msk_dataEnter(Sender: TObject);
begin
  dt_fatura := msk_data.Text;
end;

procedure Tfrm_nf_serv.cbo_tipo_nf_servChange(Sender: TObject);
begin
  dt_fatura := '';
  if ( cbo_tipo_nf_serv.ItemIndex = 0 ) or ( cbo_tipo_nf_serv.ItemIndex = 1 ) then //Fatura/Nota Op.
  begin
    ts_sol.TabVisible          := True;
    ts_adm.TabVisible          := False;
    if cbo_tipo_nf_serv.ItemIndex = 0 then
    begin
       ts_obs.TabVisible          := False;
    end
    else
    begin
       ts_obs.TabVisible          := True;
    end;
    pgctrl_nf_serv.ActivePage  := ts_sol;
    lbl_produto.Visible        := True;
    msk_cd_produto.Visible     := True;
    edt_nm_produto.Visible     := True;
    btn_co_produto.Visible     := True;
    lbl_nr_solicitacao.Visible := True;
    msk_nr_solicitacao.Visible := True;
    lbl_nr_nf.Visible          := True;
    msk_nr_nf.Visible          := True;
    lbl_nr_processo.Visible    := True;
    msk_nr_processo.Visible    := True;
    lbl_cd_referencia.Visible  := True;
    msk_cd_referencia.Visible  := True;
    chk_inc_canc.Visible       := True;
  end
  else
  begin
    ts_sol.TabVisible          := False;
    ts_adm.TabVisible          := True;
    ts_obs.TabVisible          := True;
    pgctrl_nf_serv.ActivePage  := ts_adm;
    lbl_produto.Visible        := False;
    msk_cd_produto.Visible     := False;
    edt_nm_produto.Visible     := False;
    btn_co_produto.Visible     := False;
    lbl_nr_solicitacao.Visible := False;
    msk_nr_solicitacao.Visible := False;
    lbl_nr_nf.Visible          := False;
    msk_nr_nf.Visible          := False;
    lbl_nr_processo.Visible    := False;
    msk_nr_processo.Visible    := False;
    lbl_cd_referencia.Visible  := False;
    msk_cd_referencia.Visible  := False;
    chk_inc_canc.Visible       := False;
  end;
  AbreNFServ;
end;

procedure Tfrm_nf_serv.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := False;
  mi_marca_todas.Visible     := False;
  btn_desmarca_todas.Visible := True;
  mi_desmarca_todas.Visible  := True;
  btn_desmarca_todas.Left    := btn_marca_todas.Left;
  if pgctrl_nf_serv.ActivePage = ts_sol then //Nota Fiscal proveniente de fatura
  begin
    datm_nf_serv.qry_grd_sol_.First;
    for i := 0 to datm_nf_serv.qry_grd_sol_.RecordCount - 1 do
    begin
      dbgrdSol.SelectedRows.CurrentRowSelected := True;
      datm_nf_serv.qry_grd_sol_.Next;
    end;
  end
  else
  begin
    datm_nf_serv.qry_grd_adm_.First;
    for i := 0 to datm_nf_serv.qry_grd_adm_.RecordCount - 1 do
    begin
      dbgrd_adm.SelectedRows.CurrentRowSelected := True;
      datm_nf_serv.qry_grd_adm_.Next;
    end;
  end;
end;

procedure Tfrm_nf_serv.btn_desmarca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := True;
  mi_marca_todas.Visible     := True;
  btn_desmarca_todas.Visible := False;
  mi_desmarca_todas.Visible  := False;
  if pgctrl_nf_serv.ActivePage = ts_sol then //Nota Fiscal proveniente de fatura
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

procedure Tfrm_nf_serv.dbgrdSolKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_nf_serv.msk_nr_solicitacaoEnter(Sender: TObject);
begin
  st_nr_solicitacao := msk_nr_solicitacao.Text;
end;

procedure Tfrm_nf_serv.msk_nr_nfEnter(Sender: TObject);
begin
  st_nr_nf := msk_nr_nf.Text;
end;

procedure Tfrm_nf_serv.msk_nr_processoEnter(Sender: TObject);
begin
  st_nr_processo := msk_nr_processo.Text;
end;

procedure Tfrm_nf_serv.msk_cd_referenciaEnter(Sender: TObject);
begin
  st_cd_referencia := msk_cd_referencia.Text;
end;

procedure Tfrm_nf_serv.msk_nr_solicitacaoExit(Sender: TObject);
begin
  if Trim( msk_nr_solicitacao.Text ) = st_nr_solicitacao then Exit;
  AbreNFServ;
end;

procedure Tfrm_nf_serv.msk_nr_nfExit(Sender: TObject);
begin
  if Trim( msk_nr_nf.Text ) = st_nr_nf then Exit;
    AbreNFServ;
end;

procedure Tfrm_nf_serv.msk_nr_processoExit(Sender: TObject);
begin
  if Trim( msk_nr_processo.Text ) = st_nr_processo then Exit;
  AbreNFServ;
end;

procedure Tfrm_nf_serv.msk_cd_referenciaExit(Sender: TObject);
begin
  if Trim( msk_cd_referencia.Text ) = st_cd_referencia then Exit;
  AbreNFServ;
end;

procedure Tfrm_nf_serv.chk_inc_cancExit(Sender: TObject);
begin
  AbreNFServ;
end;

procedure Tfrm_nf_serv.pgctrl_nf_servChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_nf_serv.UltNrNf : String;
begin
  //Esta rotina somente lê o último nº da N.F. e traz para a tela -
  //A gravação ficará por conta de um trigger em TS_FATURA p/ TAJUSTE_IMPRESSAO_NF_SERVICO_INDAIA
  with datm_nf_serv do
  begin
    // Verifica Nº da Última N.F.
    qry_ult_nf_.Close;
    qry_ult_nf_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_ult_nf_.Prepare;
    qry_ult_nf_.Open;
    if qry_ult_nf_.EOF then
       UltNrNf := '000001'
    else
       if Trim( ( Replicate( '0', 6 - Length( IntToStr( StrToInt( qry_ult_nf_NR_ULT_NF_SERV.AsString ) + 1 ) ) ) +
                            IntToStr( StrToInt( qry_ult_nf_NR_ULT_NF_SERV.AsString ) + 1 ) ) ) <> '' then
          UltNrNf := Trim( ( Replicate( '0', 6 - Length( IntToStr( StrToInt( qry_ult_nf_NR_ULT_NF_SERV.AsString ) + 1 ) ) ) +
                     IntToStr( StrToInt( qry_ult_nf_NR_ULT_NF_SERV.AsString ) + 1 ) ) );
  end;
end;

function Tfrm_nf_serv.VerAlt : Boolean;
begin
  VerAlt := True;
  if pgctrl_nf_serv.ActivePage = ts_obs then
  begin
    if btn_salvar.Enabled then
    begin
      if BoxMensagem('Observação da Nota Fiscal foi alterada.' + #13#10 +
         'Deseja salvar as alterações?', 1) then
      begin
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

procedure Tfrm_nf_serv.mem_obsChange(Sender: TObject);
begin
  btn_mi( True, True );
end;

procedure Tfrm_nf_serv.btn_mi( Salv : Boolean; Canc : Boolean );
begin
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
  cbo_tipo_nf_serv.Enabled := Not Salv;
  msk_cd_unid_neg.Enabled  := Not Salv;
  btn_co_unid_neg.Enabled  := Not Salv;
  msk_data.Enabled         := Not Salv;
//  msk_nr_nf_ini.Enabled    := Not Salv;
end;

procedure Tfrm_nf_serv.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  Grava;
end;

procedure Tfrm_nf_serv.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_nf_serv.Cancelar;
begin
  CarregaObs;
  Btn_Mi( False, False );
end;

function Tfrm_nf_serv.Grava : Boolean;
var
  tx_obs : AnsiString;
begin
  with datm_nf_serv do
  begin
    tx_obs := mem_obs.Text;

    try
      datm_main.db_broker.StartTransaction;
      qry_obs_ts_fatura_.Close;
      qry_obs_ts_fatura_.Prepare;
      qry_obs_ts_fatura_.Open;
      while Not qry_obs_ts_fatura_.EOF do
      begin
        qry_obs_ts_fatura_.Edit;
        qry_obs_ts_fatura_TX_OBS.AsString := tx_obs;
        qry_obs_ts_fatura_.Post;
        qry_obs_ts_fatura_.Next;
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
    on E: Exception do
      begin
        datm_nf_serv.qry_obs_ts_fatura_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;

  Btn_Mi( False, False );
end;

procedure Tfrm_nf_serv.CarregaObs;
begin
  with datm_nf_serv do
  begin
    qry_obs_ts_fatura_.Close;
    qry_obs_ts_fatura_.Prepare;
    qry_obs_ts_fatura_.Open;
    qry_obs_ts_fatura_.First;
    mem_obs.Text := qry_obs_ts_fatura_TX_OBS.AsString;
    qry_obs_ts_fatura_.Close;
  end;
  Btn_Mi( False, False );
end;

procedure Tfrm_nf_serv.pgctrl_nf_servChange(Sender: TObject);
begin
  CarregaObs;
end;

procedure Tfrm_nf_serv.btn_co_obsClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_hist_padrao, frm_hist_padrao );
  with frm_hist_padrao do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_hist_padrao.Cons_OnLineMemo_Texto := mem_obs.Lines;
    lCons_OnLineMemo := True;
    ShowModal;
    lCons_OnLineMemo := False;
  end;
  mem_obs.SetFocus;
end;

procedure Tfrm_nf_serv.AbreNFServ;
var
  dt_selecao : TDateTime;
begin
  with datm_nf_serv do
  begin
    if pgctrl_nf_serv.ActivePage = ts_sol then
    begin
      qry_grd_sol_.Close;
      qry_grd_sol_.ParamByName('CD_UNID_NEG').AsString     := msk_cd_unid_neg.Text;
      qry_grd_sol_.ParamByName('CD_PRODUTO').AsString      := msk_cd_produto.Text;
      try
        dt_selecao := StrToDate( msk_data.Text );
        qry_grd_sol_.ParamByName('DT_FATURA').AsDate       := dt_selecao;
      except
        qry_grd_sol_.ParamByName('DT_FATURA').Clear;
      end;
      if ( cbo_tipo_nf_serv.ItemIndex = 0 ) then //Fatura
         qry_grd_sol_.ParamByName('TP_TIPO_FAT').AsString  := 'F'
      else if ( cbo_tipo_nf_serv.ItemIndex = 1 ) then //Nota Op.
         qry_grd_sol_.ParamByName('TP_TIPO_FAT').AsString  := 'N';
      qry_grd_sol_.ParamByName('NR_SOLICITACAO').AsString  := Trim( msk_nr_solicitacao.Text );
      qry_grd_sol_.ParamByName('NR_NF').AsString           := Trim( msk_nr_nf.Text );
      qry_grd_sol_.ParamByName('NR_NOTA_FATURA').AsString  := Trim( msk_nr_ndc.Text );
      if Trim( msk_nr_processo.Text ) <> '' then
         qry_grd_sol_.ParamByName('NR_PROCESSO').AsString  := Trim( msk_cd_unid_neg.Text ) +
                                                              Trim( msk_cd_produto.Text ) +
                                                              Trim( msk_nr_processo.Text )
      else
         qry_grd_sol_.ParamByName('NR_PROCESSO').AsString  := '';
      qry_grd_sol_.ParamByName('CD_REFERENCIA').AsString   := Trim( msk_cd_referencia.Text );
      if chk_inc_canc.Checked then
         qry_grd_sol_.ParamByName('IN_CANCELADO').AsString := 'X'
      else
         qry_grd_sol_.ParamByName('IN_CANCELADO').AsString := '';
      qry_grd_sol_.Prepare;
      qry_grd_sol_.Open;

      qry_fat_sol_.Close;
      qry_fat_sol_.Prepare;
      qry_fat_sol_.Open;

      qry_fat_proc_.Close;
      qry_fat_proc_.Prepare;
      qry_fat_proc_.Open;
    end
    else
    begin
      qry_grd_adm_.Close;
      qry_grd_adm_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      try
        dt_selecao := StrToDate( msk_data.Text );
        qry_grd_adm_.ParamByName('DT_PAGTO').AsDate    := dt_selecao;
      except
        qry_grd_adm_.ParamByName('DT_PAGTO').Clear;
      end;
      qry_grd_adm_.Prepare;
      qry_grd_adm_.Open;

      qry_fav_adm_.Close;
      qry_fav_adm_.Prepare;
      qry_fav_adm_.Open;
    end
  end;
end;

procedure Tfrm_nf_serv.chk_inc_cancClick(Sender: TObject);
begin
  AbreNFServ;
end;

procedure Tfrm_nf_serv.btn_previewClick(Sender: TObject);
var
  i : Integer;
begin
  //rotina antiga de preview (24/09/2007)
  //botão invisível

  if Not Consiste then Exit;

  with datm_nf_serv, crp_nf_serv do
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

    try
      datm_main.db_broker.StartTransaction;
      if cbo_tipo_nf_serv.ItemIndex in [0, 1] then //Op.
      begin
        for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
        begin
          TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
          with datm_nf_serv do
          begin
            CloseStoredProc( sp_nf_serv_op );
            with sp_nf_serv_op do
            begin
              ParamByName('@cd_unid_neg').AsString    := msk_cd_unid_neg.Text;
              ParamByName('@cd_produto').AsString     := msk_cd_produto.Text;
              ParamByName('@nr_solicitacao').AsString := qry_grd_sol_NR_SOLICITACAO.AsString;
            end;
            ExecStoredProc( sp_nf_serv_op );
            CloseStoredProc( sp_nf_serv_op );
          end;
        end;
      end
      else
      begin //Adm
        for i := 0 to dbgrd_adm.SelectedRows.Count - 1 do
        begin
          TTable( dbgrd_adm.DataSource.DataSet ).GotoBookMark( TBookMark( dbgrd_adm.SelectedRows[i] ) );
          with datm_nf_serv do
          begin
            CloseStoredProc( sp_nf_serv_adm );
            with sp_nf_serv_adm do
            begin
              ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
              ParamByName('@nr_docto').AsString    := qry_grd_adm_NR_DOCTO.AsString;
            end;
            ExecStoredProc( sp_nf_serv_adm );
            CloseStoredProc( sp_nf_serv_adm );
          end;
        end;
      end;
      datm_main.db_broker.Commit;
    except
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      BoxMensagem( 'Erro ao tentar imprimir Nota Fiscal!', 2 );
      Exit;
    end;

    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;

    if cbo_tipo_nf_serv.ItemIndex in [0, 1] then //Op.
    begin
      Connect        := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      ReportName     := cDir_Rpt + '\CRNF001.RPT';
      ParamFields[0] := Trim( str_cd_usuario );
      Execute;

      with datm_nf_serv.qry_atz_dados_ do
      begin
        SQL.Clear;
        SQL.Add( 'UPDATE TNF_SERV_OP SET CD_EMISSOR = "" WHERE CD_EMISSOR = "' + str_cd_usuario + '"' );
        Prepare;
        ExecSQL;
      end;
    end
    else
    begin
      Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      ReportName  := cDir_Rpt + '\CRNF002.RPT';
      ParamFields[0] := Trim( str_cd_usuario );
      Execute;

      with datm_nf_serv.qry_atz_dados_ do
      begin
        SQL.Clear;
        SQL.Add( 'UPDATE TNF_SERV_ADM SET CD_EMISSOR = "" WHERE CD_EMISSOR = "' + str_cd_usuario + '"' );
        Prepare;
        ExecSQL;
      end;
    end;
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_nf_serv.dbgrd_admKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
  begin
    if dbgrd_adm.SelectedRows.CurrentRowSelected then
       dbgrd_adm.SelectedRows.CurrentRowSelected := False
    else
       dbgrd_adm.SelectedRows.CurrentRowSelected := True;
  end;
end;

{$HINTS OFF}
procedure Tfrm_nf_serv.GeraNFOp;
var
  cControla, cAdiciona, cMoedaNac, cNmISS, Ret1, Ret2 : String;
  nN, nMult, nCaracteres, nEspaco, nLinhas, nLinhasRefcli, nObs : Integer;
  lEntrou, lNaoTrib, lComissao, lTotGeral, lTrib, lISS, lIRRF, lRetencao: Boolean;
  cHist1, cHist2, cRefCli1, cRefCli2, cObs1, cObs2 : TStringlist;
  nCliente, nIndaia, nServicos : Double;
  val_cofins : Double;
  val_pis : Double;
  linha_total: integer;
  NM_Retencao : String;
begin
  linha_total := 0;
  cMoedaNac   := 'R$ ';
  with datm_nf_serv do
  begin
    qry_ajuste_impressao_.Close;
    qry_ajuste_impressao_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_ajuste_impressao_.Prepare;
    qry_ajuste_impressao_.Open;
    if qry_ajuste_impressao_.RecordCount = 0 then
    begin
      BoxMensagem( 'Ajuste de Impressão não cadastrado!', 2 );
      qry_ajuste_impressao_.Close;
      Exit;
    end;

    qry_ajuste_impressao_.Edit;
    qry_ajuste_impressao_NR_ULT_NF_SERV.AsString := qry_fat_sol_NR_NF_SERV.AsString;
    qry_ajuste_impressao_.Post;

    qry_nf_serv_op_.Close;
    qry_nf_serv_op_.ParamByName('CD_UNID_NEG').AsString    := msk_cd_unid_neg.Text;
    qry_nf_serv_op_.ParamByName('CD_PRODUTO').AsString     := msk_cd_produto.Text;
    qry_nf_serv_op_.ParamByName('NR_SOLICITACAO').AsString := qry_grd_sol_NR_SOLICITACAO.AsString;
    qry_nf_serv_op_.Prepare;
    qry_nf_serv_op_.Open;

    rp_nf.PrinterName := impressora;
    //rp_nf.SetToDefaultPrinter;
    rp_nf.BeginDoc;
    rp_nf.Say( 01, 01, #27#64#27#120#0#18#27#80#27#67#0#12#27#50#27#40#116#3#0#1#25#0 );
    //Draft - Não condensado - 10cpi - 12" - Espaçamento de linha de 1/6" - Tab. Car.

    // Emissão, Nº Relatório/Ano
    if qry_nf_serv_op_NR_RELATORIO.AsString <> '' then
    begin
      rp_nf.Say( StrToInt( qry_ajuste_impressao_L_EMISSAO.AsString ),
                 StrToInt( qry_ajuste_impressao_C_EMISSAO.AsString ),
                 FormatDateTime( 'dd/mm/yyyy', qry_nf_serv_op_DT_EMISSAO.AsDateTime ) + ' R:' +
                 Copy( qry_nf_serv_op_NR_RELATORIO.AsString, 2, 2 ) + '/' + Copy( qry_nf_serv_op_NR_ANO.AsString, 3, 2 ) );
    end
    else
    begin
      rp_nf.Say( StrToInt( qry_ajuste_impressao_L_EMISSAO.AsString ),
                 StrToInt( qry_ajuste_impressao_C_EMISSAO.AsString ),
                 Space( 4 ) + FormatDateTime( 'dd/mm/yyyy', qry_nf_serv_op_DT_EMISSAO.AsDateTime ) );
    end;
    //Vencimento
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_EMISSAO.AsString ),
               StrToInt( qry_ajuste_impressao_C_VENCIMENTO.AsString ),
               FormatDateTime( 'dd/mm/yyyy', qry_nf_serv_op_DT_VENCIMENTO.AsDateTime ) );
    //N/Referência
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_N_REFERENCIA.AsString ),
               StrToInt( qry_ajuste_impressao_C_N_REFERENCIA.AsString ),
               #27#69 + Copy( qry_nf_serv_op_NR_PROCESSO.AsString, 5, 14 ) + #27#70 );
    //Dados do cliente
    //Razão Social
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_RAZAO_SOCIAL.AsString ),
               StrToInt( qry_ajuste_impressao_C_RAZAO_SOCIAL.AsString ),
               qry_nf_serv_op_NM_EMPRESA.AsString );
    //Endereço
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_ENDERECO.AsString ),
               StrToInt( qry_ajuste_impressao_C_ENDERECO.AsString ),
               Trim( qry_nf_serv_op_END_EMPRESA.AsString ) + ', ' +
               Trim( qry_nf_serv_op_END_NUMERO.AsString ) );
    //Município
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_MUNICIPIO.AsString ),
               StrToInt( qry_ajuste_impressao_C_MUNICIPIO.AsString ),
               Trim( qry_nf_serv_op_END_CIDADE.AsString ) );
    //Bairro
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_MUNICIPIO.AsString ),
               StrToInt( qry_ajuste_impressao_C_BAIRRO.AsString ),
               Trim( Copy( qry_nf_serv_op_END_BAIRRO.AsString, 1, 15 ) ) );
    //UF
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_MUNICIPIO.AsString ),
               StrToInt( qry_ajuste_impressao_C_UF.AsString ),
               Trim( qry_nf_serv_op_END_UF.AsString ) );
    //CEP
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_MUNICIPIO.AsString ),
               StrToInt( qry_ajuste_impressao_C_CEP.AsString ),
               Copy( qry_nf_serv_op_END_CEP.AsString, 1, 5 ) + '-' +
               Copy( qry_nf_serv_op_END_CEP.AsString, 6, 3 ) );
    //C.N.P.J.
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_CNPJ.AsString ),
               StrToInt( qry_ajuste_impressao_C_CNPJ.AsString ),
               Copy( qry_nf_serv_op_CGC_EMPRESA.AsString,  1, 2 ) + '.' +
               Copy( qry_nf_serv_op_CGC_EMPRESA.AsString,  3, 3 ) + '.' +
               Copy( qry_nf_serv_op_CGC_EMPRESA.AsString,  6, 3 ) + '/' +
               Copy( qry_nf_serv_op_CGC_EMPRESA.AsString,  9, 4 ) + '-' +
               Copy( qry_nf_serv_op_CGC_EMPRESA.AsString, 13, 2 ) );
    //Inscr.Est
    if ( UpperCase( qry_nf_serv_op_IE_EMPRESA.AsString ) <> 'ISENTO' ) and
       ( UpperCase( qry_nf_serv_op_IE_EMPRESA.AsString ) <> 'ISENTA' ) then
       rp_nf.Say( StrToInt( qry_ajuste_impressao_L_CNPJ.AsString ),
                  StrToInt( qry_ajuste_impressao_C_IE.AsString ),
                  Copy( qry_nf_serv_op_IE_EMPRESA.AsString,  1, 3 ) + '.' +
                  Copy( qry_nf_serv_op_IE_EMPRESA.AsString,  4, 3 ) + '.' +
                  Copy( qry_nf_serv_op_IE_EMPRESA.AsString,  7, 3 ) + '.' +
                  Copy( qry_nf_serv_op_IE_EMPRESA.AsString, 10, 3 ) )
    else
       rp_nf.Say( StrToInt( qry_ajuste_impressao_L_CNPJ.AsString ),
                  StrToInt( qry_ajuste_impressao_C_IE.AsString ),
                  Trim( qry_nf_serv_op_IE_EMPRESA.AsString ) );
    //Dados do Processo
    //Área
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_AREA.AsString ),
               StrToInt( qry_ajuste_impressao_C_AREA.AsString ),
               Trim( qry_nf_serv_op_NM_AREA.AsString ) );
    //Analista
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_AREA.AsString ),
               StrToInt( qry_ajuste_impressao_C_ANALISTA.AsString ),
               Trim( qry_nf_serv_op_NM_ANALISTA.AsString ) );
    //S/Referência
    cRefCli1 := TStringList.Create;
    cRefCli2 := TStringList.Create;
    cRefCli1.Add( qry_nf_serv_op_NM_REFERENCIA.AsString );

    nMult         := 0;
    nEspaco       := 0;
    nCaracteres   := 1;
    cControla     := '';
    lEntrou       := True;
    nLinhasRefcli := 0;

    for nN := 1 to Length( cRefCli1.Text ) do
    begin
      lEntrou := False;
      if ( Copy( cRefCli1.Text, nN, 1 ) <> #0 ) then
      begin
        if ( Copy( cRefCli1.Text, nN, 1 ) <> #13 ) and ( Copy( cRefCli1.Text, nN + 1, 1 ) <> #10 ) then
           cControla := cControla + Copy( cRefCli1.Text, nN, 1 );

        if ( Copy( cRefCli1.Text, nN, 1 ) = #32 ) or
           ( ( Copy( cRefcli1.Text, nN, 1 ) = #13 ) and ( Copy( cRefCli1.Text, nN + 1, 1 ) = #10 ) ) then
           nEspaco := nCaracteres;

        if ( Copy( cRefCli1.Text, nN, 1 ) = #10 ) and ( Copy( cRefCli1.Text, nN - 1, 1 ) = #13 ) then
           cControla := Copy( cControla, 1, Length( cControla ) - 1 );

        if ( nMult = 66 ) and ( Trim( cControla ) <> '' ) or
           ( Copy( cRefCli1.Text, nN, 1 ) = #13 ) and ( Copy( cRefCli1.Text, nN + 1, 1 ) = #10 ) then
        begin
          nLinhasRefcli := nLinhasRefcli + 1;
          if nLinhasRefcli <= 3 then
          begin
            if nLinhasRefcli = 3 then
            begin
              cRefCli2.Add( Trim( Copy( cControla, 1, nEspaco ) ) + '...' );
            end
            else
            begin
              if Length( Trim( cControla ) ) < 66 then
                 cRefCli2.Add( cControla )
              else
                 cRefCli2.Add( Copy( cControla, 1, nEspaco ) );
            end;
            if Length( Trim( cControla ) ) < 66 then
              cControla   := ''
            else
              cControla   := Copy( cControla, nEspaco + 1, Length( cControla ) - 1 );
            nCaracteres := Length( Trim( cControla ) );
            nMult       := nCaracteres - 1;
            lEntrou     := True;
          end;
        end;
      end;
      nMult       := nMult + 1;
      nCaracteres := nCaracteres + 1;
    end;
    if Not ( lEntrou ) and ( Trim( cControla ) <> '' ) and ( nLinhasRefcli <= 3 ) then
       cRefCli2.Add( cControla );

    if cRefCli2.Count > 0  then
    begin
      rp_nf.MemoSay( StrToInt( qry_ajuste_impressao_L_S_REFERENCIA.AsString ),
                     StrToInt( qry_ajuste_impressao_C_S_REFERENCIA.AsString ),
                     cRefCli2 );
    end;

    //Natureza do Despacho
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_NAT_DESPACHO.AsString ),
               StrToInt( qry_ajuste_impressao_C_NAT_DESPACHO.AsString ),
               Trim( qry_nf_serv_op_NM_NAT_DESPACHO.AsString ) );
    //Modal
    if qry_nf_serv_op_CD_VIA_TRANSP.AsString <> '10' then
    begin
      rp_nf.Say( StrToInt( qry_ajuste_impressao_L_NAT_DESPACHO.AsString ),
                 StrToInt( qry_ajuste_impressao_C_MODAL.AsString ),
                 Trim( qry_nf_serv_op_NM_VIA_TRANSP.AsString ) );
    end;
    //Veículo
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_VEICULO.AsString ),
               StrToInt( qry_ajuste_impressao_C_VEICULO.AsString ),
               Trim( qry_nf_serv_op_NM_VEICULO.AsString ) );
    //Origem
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_VEICULO.AsString ),
               StrToInt( qry_ajuste_impressao_C_ORIGEM.AsString ),
               Trim( qry_nf_serv_op_NM_LOCAL_ORIGEM.AsString ) );
    //Destino
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_VEICULO.AsString ),
               StrToInt( qry_ajuste_impressao_C_DESTINO.AsString ),
               Trim( qry_nf_serv_op_NM_LOCAL_DESTINO.AsString ) );
    //Volumes
    if Not qry_nf_serv_op_QT_EMBALAGEM.IsNull then
    begin
      rp_nf.Say( StrToInt( qry_ajuste_impressao_L_VOLUMES.AsString ),
                 StrToInt( qry_ajuste_impressao_C_VOLUMES.AsString ),
                 Trim( IntToStr( qry_nf_serv_op_QT_EMBALAGEM.AsInteger ) ) + ' ' +
                 Trim( Copy( qry_nf_serv_op_NM_ESPECIE.AsString, 1, 22 ) ) );
    end;
    //Peso Bruto
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_VOLUMES.AsString ),
               StrToInt( qry_ajuste_impressao_C_PESO_BRUTO.AsString ),
               Space( 15 - Length( Trim( FormatFloat( '#0,.000', qry_nf_serv_op_VL_PESO_BRUTO.AsFloat ) ) ) ) +
               Trim( FormatFloat( '#0,.000', qry_nf_serv_op_VL_PESO_BRUTO.AsFloat ) ) );
    //Peso Líquido
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_VOLUMES.AsString ),
               StrToInt( qry_ajuste_impressao_C_PESO_LIQUIDO.AsString ),
               Space( 15 - Length( Trim( FormatFloat( '#0,.000', qry_nf_serv_op_VL_PESO_LIQUIDO.AsFloat ) ) ) ) +
               Trim( FormatFloat( '#0,.000', qry_nf_serv_op_VL_PESO_LIQUIDO.AsFloat ) ) );
    //Valor FOB
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_VALOR_FOB.AsString ),
               StrToInt( qry_ajuste_impressao_C_VALOR_FOB.AsString ),
               cMoedaNac + Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_FOB.AsFloat ) ) ) ) +
               Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_FOB.AsFloat ) ) );
    //Valor CIF
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_VALOR_FOB.AsString ),
               StrToInt( qry_ajuste_impressao_C_VALOR_CIF.AsString ),
               cMoedaNac + Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_CIF.AsFloat ) ) ) ) +
               Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_CIF.AsFloat ) ) );
    //Nº DA/DI/RE/DT
    if qry_nf_serv_op_CD_PRODUTO.AsString = '01' then //Importação
    begin
      if Trim( qry_nf_serv_op_NR_DI.AsString ) <> '' then
        rp_nf.Say( StrToInt( qry_ajuste_impressao_L_DI.AsString ),
                   StrToInt( qry_ajuste_impressao_C_DI.AsString ),
                   Copy( Trim( qry_nf_serv_op_NR_DI.AsString ),  1, 2 ) + '/' +
                   Copy( Trim( qry_nf_serv_op_NR_DI.AsString ),  3, 7 ) + '-' +
                   Copy( Trim( qry_nf_serv_op_NR_DI.AsString ), 10, 1 ) );
    end
    else
    begin
      if qry_nf_serv_op_CD_PRODUTO.AsString = '02' then //Exportação
        if Trim( qry_nf_serv_op_NR_DI.AsString ) <> '' then
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_DI.AsString ),
                     StrToInt( qry_ajuste_impressao_C_DI.AsString ),
                     Copy( Trim( qry_nf_serv_op_NR_DI.AsString ),  1, 2 ) + '/' +
                     Copy( Trim( qry_nf_serv_op_NR_DI.AsString ),  3, 7 ) + '-' +
                     Copy( Trim( qry_nf_serv_op_NR_DI.AsString ), 10, 3 ) );
      end;

    //Despesas
    nLinhas   := 0;
    nCliente  := 0;
    nIndaia   := 0;
    nServicos := 0;

    cHist1 := TStringList.Create;
    cHist2 := TStringList.Create;
    cHist1.Assign( qry_nf_serv_op_TX_HISTORICO );

    nMult       := 0;
    nEspaco     := 0;
    nCaracteres := 1;
    cControla   := '';
    lEntrou     := True;

    for nN := 1 to Length( cHist1.Text ) do
    begin
      lEntrou := False;
      if ( Copy( cHist1.Text, nN, 1 ) <> #0 ) then
      begin
        if ( Copy( cHist1.Text, nN, 1 ) <> #13 ) and ( Copy( cHist1.Text, nN + 1, 1 ) <> #10 ) then
           cControla := cControla + Copy( cHist1.Text, nN, 1 );

        if ( Copy( cHist1.Text, nN, 1 ) = #32 ) or
           ( ( Copy( cHist1.Text, nN, 1 ) = #13 ) and ( Copy( cHist1.Text, nN + 1, 1 ) = #10 ) ) then
           nEspaco := nCaracteres;

        if ( Copy( cHist1.Text, nN, 1 ) = #10 ) and ( Copy( cHist1.Text, nN - 1, 1 ) = #13 ) then
           cControla := Copy( cControla, 1, Length( cControla ) - 1 );

        if ( nMult = 38 ) and ( Trim( cControla ) <> '' ) or
           ( Copy( cHist1.Text, nN, 1 ) = #13 ) and ( Copy( cHist1.Text, nN + 1, 1 ) = #10 ) then
        begin
          cHist2.Add( Copy( cControla, 1, nEspaco ) );
          cControla   := Copy( cControla, nEspaco + 1, Length( cControla ) - 1 );
          nCaracteres := Length( Trim( cControla ) );
          nMult       := nCaracteres - 1;
          lEntrou     := True;
        end;
      end;
      nMult       := nMult + 1;
      nCaracteres := nCaracteres + 1;
   end;

    if cHist2.Count > 0  then
    begin
      rp_nf.MemoSay( StrToInt( qry_ajuste_impressao_L_DESCRICAO.AsString ) + nLinhas,
                     StrToInt( qry_ajuste_impressao_C_DESCRICAO.AsString ),
                     cHist2 );

      nLinhas := nLinhas + cHist2.Count;
    end;

    qry_nf_serv_op_item_.Close;
    qry_nf_serv_op_item_.Prepare;
    qry_nf_serv_op_item_.Open;
    while Not qry_nf_serv_op_item_.EOF do
    begin
      if nLinhas < qry_ajuste_impressao_NR_LINHAS.AsInteger then
      begin
        if ( ( nLinhas + 1 ) = qry_ajuste_impressao_NR_LINHAS.AsInteger ) and ( StrToInt( qry_nf_serv_op_item_NR_ORDEM_FAT.AsString ) < 1000 ) then
        begin
          // Imprimir Outras Vide Anexo se houver
          if ( nCliente > 0 ) or ( nIndaia > 0 ) or ( nServicos > 0 ) then
          begin
            // Descrição da Despesa ou do Serviço
            rp_nf.Say( StrToInt( qry_ajuste_impressao_L_DESCRICAO.AsString ) + nLinhas,
                       StrToInt( qry_ajuste_impressao_C_DESCRICAO.AsString ),
                       'OUTRAS VIDE ANEXO' );

            if qry_nf_serv_op_item_IN_COLUNA.AsString = '1' then // Cliente
            begin
              // Cliente
              rp_nf.Say( StrToInt( qry_ajuste_impressao_L_DESCRICAO.AsString ) + nLinhas,
                         StrToInt( qry_ajuste_impressao_C_CLIENTE.AsString ),
                         Space( 12 - Length( Trim( FormatFloat( '#0,.00', nCliente ) ) ) ) +
                         Trim( FormatFloat( '#0,.00', nCliente ) ) );
            end;
            if qry_nf_serv_op_item_IN_COLUNA.AsString = '2' then //Indaiá
            begin
              // Indaiá
              rp_nf.Say( StrToInt( qry_ajuste_impressao_L_DESCRICAO.AsString ) + nLinhas,
                         StrToInt( qry_ajuste_impressao_C_INDAIA.AsString ),
                         Space( 12 - Length( Trim( FormatFloat( '#0,.00', nIndaia ) ) ) ) +
                         Trim( FormatFloat( '#0,.00', nIndaia ) ) );
            end;
            if qry_nf_serv_op_item_IN_COLUNA.AsString = '3' then //Serviços
            begin
              // Serviços
              rp_nf.Say( StrToInt( qry_ajuste_impressao_L_DESCRICAO.AsString ) + nLinhas,
                         StrToInt( qry_ajuste_impressao_C_SERVICOS.AsString ),
                         Space( 12 - Length( Trim( FormatFloat( '#0,.00', nServicos ) ) ) ) +
                         Trim( FormatFloat( '#0,.00', nServicos ) ) );
            end;
          end;
        end;

        if ( StrToInt( qry_nf_serv_op_item_NR_ORDEM_FAT.AsString ) < 1000 ) then
        begin
          //Descrição da Despesa ou do Serviço
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_DESCRICAO.AsString ) + nLinhas,
                     StrToInt( qry_ajuste_impressao_C_DESCRICAO.AsString ),
                     Trim( qry_nf_serv_op_item_NM_ITEM.AsString ) );

          if qry_nf_serv_op_item_IN_COLUNA.AsString = '1' then //Cliente
          begin
            //Cliente
            rp_nf.Say( StrToInt( qry_ajuste_impressao_L_DESCRICAO.AsString ) + nLinhas,
                       StrToInt( qry_ajuste_impressao_C_CLIENTE.AsString ),
                       Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_item_VL_ITEM.AsFloat ) ) ) ) +
                       Trim( FormatFloat( '#0,.00', qry_nf_serv_op_item_VL_ITEM.AsFloat ) ) );
          end;
          if qry_nf_serv_op_item_IN_COLUNA.AsString = '2' then //Indaiá
          begin
            //Indaiá
            rp_nf.Say( StrToInt( qry_ajuste_impressao_L_DESCRICAO.AsString ) + nLinhas,
                       StrToInt( qry_ajuste_impressao_C_INDAIA.AsString ),
                       Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_item_VL_ITEM.AsFloat ) ) ) ) +
                       Trim( FormatFloat( '#0,.00', qry_nf_serv_op_item_VL_ITEM.AsFloat ) ) );
          end;
          if qry_nf_serv_op_item_IN_COLUNA.AsString = '3' then //Serviços
          begin
            //Serviços
            rp_nf.Say( StrToInt( qry_ajuste_impressao_L_DESCRICAO.AsString ) + nLinhas,
                       StrToInt( qry_ajuste_impressao_C_SERVICOS.AsString ),
                       Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_item_VL_ITEM.AsFloat ) ) ) ) +
                       Trim( FormatFloat( '#0,.00', qry_nf_serv_op_item_VL_ITEM.AsFloat ) ) );
          end;
          nLinhas := nLinhas + 1;
        end;

        if StrToInt( qry_nf_serv_op_item_NR_ORDEM_FAT.AsString ) > 999 then
        begin
          // Imprime junto com os ítens qdo a flag Quadro Total na Fatura = Sim
          if qry_nf_serv_op_IN_QUADRO_TOTAL.AsString = '1' then
          begin
            // Destaque de Impostos
            if StrToInt( qry_nf_serv_op_item_NR_ORDEM_FAT.AsString ) = 1000 then
            begin
              rp_nf.Say( StrToInt( qry_ajuste_impressao_L_DESTAQUE.AsString ) + nLinhas,
                         StrToInt( qry_ajuste_impressao_C_DESTAQUE.AsString ),
                         Trim( qry_nf_serv_op_item_NM_ITEM.AsString ) );
            end;
            if StrToInt( qry_nf_serv_op_item_NR_ORDEM_FAT.AsString ) = 1001 then
            begin
               rp_nf.Say( ( StrToInt( qry_ajuste_impressao_L_DESTAQUE.AsString ) + 1 ) + nLinhas,
                          StrToInt( qry_ajuste_impressao_C_DESTAQUE.AsString ),
                          Trim( qry_nf_serv_op_item_NM_ITEM.AsString ) );
            end;
            if StrToInt( qry_nf_serv_op_item_NR_ORDEM_FAT.AsString ) = 1002 then
            begin
               rp_nf.Say( ( StrToInt( qry_ajuste_impressao_L_DESTAQUE.AsString ) + 2 ) + nLinhas,
                          StrToInt( qry_ajuste_impressao_C_DESTAQUE.AsString ) ,
                          Trim( qry_nf_serv_op_item_NM_ITEM.AsString ) );
            end;
            // RETENÇÃO
            //if StrToInt( qry_nf_serv_op_item_NR_ORDEM_FAT.AsString ) = 1003 then
            //begin
            //   rp_nf.Say( StrToInt( qry_ajuste_impressao_L_RETENCAO.AsString ) + nLinhas,
            //              StrToInt( qry_ajuste_impressao_C_RETENCAO.AsString ) ,
            //              Trim( qry_nf_serv_op_item_NM_ITEM.AsString ) );
            //end;
            //if StrToInt( qry_nf_serv_op_item_NR_ORDEM_FAT.AsString ) = 1004 then
            //begin
            //   rp_nf.Say( ( StrToInt( qry_ajuste_impressao_L_RETENCAO.AsString ) + 1 ) + nLinhas,
            //              StrToInt( qry_ajuste_impressao_C_RETENCAO.AsString ) ,
            //              Trim( qry_nf_serv_op_item_NM_ITEM.AsString ) );
            //end;
          end
          else
          begin
            if StrToInt( qry_nf_serv_op_item_NR_ORDEM_FAT.AsString ) = 1003 then
            begin
               Ret1 := Trim( qry_nf_serv_op_item_NM_ITEM.AsString );
            end;
            if StrToInt( qry_nf_serv_op_item_NR_ORDEM_FAT.AsString ) = 1004 then
            begin
               Ret2 := Trim( qry_nf_serv_op_item_NM_ITEM.AsString );
            end;
          end;
        end;
      end
      else //Processar outras Despesas
      begin
        if qry_nf_serv_op_item_IN_COLUNA.AsString = '1' then //Cliente
          nCliente := nCliente + qry_nf_serv_op_item_VL_ITEM.AsFloat;
        if qry_nf_serv_op_item_IN_COLUNA.AsString = '2' then //Indaiá
          nIndaia := nIndaia + qry_nf_serv_op_item_VL_ITEM.AsFloat;
        if qry_nf_serv_op_item_IN_COLUNA.AsString = '3' then //Serviços
          nServicos := nServicos + qry_nf_serv_op_item_VL_ITEM.AsFloat;
      end;

      qry_nf_serv_op_item_.Next;
    end;

    qry_nf_serv_op_item_.Close;

    lNaoTrib  := True;
    lComissao := True;
    lTotGeral := True;
    lTrib     := True;
    lISS      := True;
    lIRRF     := True;
    lRetencao := True;
    nLinhas   := 0;
    nObs      := StrToInt( qry_ajuste_impressao_L_NAO_TRIBUTAVEL.AsString );

    //--------------------------------------------------------------------------------------------------------------

    //Faturas c/ Numerário
    if cbo_tipo_nf_serv.ItemIndex = 0 then
    begin
      qry_nf_serv_op_num_.Close;
      qry_nf_serv_op_num_.Prepare;
      qry_nf_serv_op_num_.Open;
      while ( Not qry_nf_serv_op_num_.EOF ) or ( nLinhas = 7 ) do //Limitado a 7 linhas de Numerários
      begin
        //FP, Valor Num., Data Num.
        if Trim( qry_nf_serv_op_num_NR_FP.AsString ) <> '' then
        begin
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_NAO_TRIBUTAVEL.AsString ) + nLinhas,
                     StrToInt( qry_ajuste_impressao_C_OBS.AsString ),
                     'F.P.: ' + Trim( qry_nf_serv_op_num_NR_FP.AsString ) +
                     Space( 23 - Length( 'F.P.: ' + Trim( qry_nf_serv_op_num_NR_FP.AsString ) ) ) +
                     cMoedaNac + Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_num_VL_NUM.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_op_num_VL_NUM.AsFloat ) ) +
                     Space( 2 ) + FormatDateTime( 'dd/mm/yyyy', qry_nf_serv_op_num_DT_NUM.AsDateTime ) );
        end
        else
        begin
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_NAO_TRIBUTAVEL.AsString ) + nLinhas,
                     StrToInt( qry_ajuste_impressao_C_OBS.AsString ),
                     Space( 23 ) +
                     cMoedaNac + Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_num_VL_NUM.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_op_num_VL_NUM.AsFloat ) ) +
                     Space( 2 ) + FormatDateTime( 'dd/mm/yyyy', qry_nf_serv_op_num_DT_NUM.AsDateTime ) );
        end;

        //Não Tributável
        if ( nObs = StrToInt( qry_ajuste_impressao_L_NAO_TRIBUTAVEL.AsString ) ) and lNaoTrib then
        begin
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_NAO_TRIBUTAVEL.AsString ),
                     StrToInt( qry_ajuste_impressao_C_NAO_TRIBUTAVEL.AsString ),
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_NAO_TRIBUTAVEL.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_NAO_TRIBUTAVEL.AsFloat ) ) );

          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_NAO_TRIBUTAVEL.AsString ),
                     StrToInt( qry_ajuste_impressao_C_SUB_TOTAL_TRIBUTAVEL.AsString ),
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_SUB_TOT_TRIBUTAVEL.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_SUB_TOT_TRIBUTAVEL.AsFloat ) ) );

          lNaoTrib := False;
        end;

        //Comissão
        if ( nObs = StrToInt( qry_ajuste_impressao_L_COMISSAO.AsString ) ) and lComissao then
        begin
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_COMISSAO.AsString ),
                     StrToInt( qry_ajuste_impressao_C_COMISSAO.AsString ),
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_COMISSAO.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_COMISSAO.AsFloat ) ) );

          lComissao := False;
        end;

        //Total Geral
        if ( nObs = StrToInt( qry_ajuste_impressao_L_TOTAL_GERAL.AsString ) ) and lTotGeral then
        begin
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_TOTAL_GERAL.AsString ),
                     StrToInt( qry_ajuste_impressao_C_TOTAL_GERAL.AsString ),
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_GERAL.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_GERAL.AsFloat ) ) );

          lTotGeral := False;
        end;

        //Valor Tributável - ISS
        if ( nObs = StrToInt( qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL.AsString ) ) and lTrib then
        begin
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL.AsString ),
                     StrToInt( qry_ajuste_impressao_C_TOTAL_TRIBUTAVEL.AsString ),
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_TRIBUTAVEL.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_TRIBUTAVEL.AsFloat ) ) );

          lTrib := False;
        end;

        qry_nf_serv_op_num_.Next;

        nLinhas := nLinhas + 1;
        nObs    := nObs + 1;
      end;
      qry_nf_serv_op_num_.Close;
    end;

    //----------------------------------------------------------------------------------------------------

    cObs1 := TStringList.Create;
    cObs2 := TStringList.Create;


    //Notas c/ Obs
    if cbo_tipo_nf_serv.ItemIndex = 1 then
    begin
      cObs1.Assign( qry_nf_serv_op_TX_OBS );
      cObs1.Add('RETENÇÃO NA FONTE LEI 10833/03');
      NM_Retencao := qry_nf_serv_op_NM_RETENCAO.AsString;
      cObs1.Add( NM_Retencao );

      nMult       := 0;
      nEspaco     := 0;
      nCaracteres := 1;
      cControla   := '';
      lEntrou     := True;

      // Faz enqto ainda existir Observação
      // #13 - ENTER  #32 -  (espaço)  #10 - carriage return
      for nN := 1 to Length( cObs1.Text ) do
      begin
        lEntrou := False;
        if ( Copy( cObs1.Text, nN, 1 ) <> #0 ) then
        begin
          if ( Copy( cObs1.Text, nN, 1 ) <> #13 ) and ( Copy( cObs1.Text, nN + 1, 1 ) <> #10 ) then
             cControla := cControla + Copy( cObs1.Text, nN, 1 );

          if ( Copy( cObs1.Text, nN, 1 ) = #32 ) or
             ( ( Copy( cObs1.Text, nN, 1 ) = #13 ) and ( Copy( cObs1.Text, nN - 1, 1 ) = #10 ) ) then
             nEspaco := nCaracteres;

          if ( Copy( cObs1.Text, nN, 1 ) = #10 ) and ( Copy( cObs1.Text, nN - 1, 1 ) = #13 ) then
             cControla := Copy( cControla, 1, Length( cControla ) - 1 );

          if ( nMult > 37 ) and ( Trim( cControla ) <> '' ) and ( Copy( cObs1.Text, nN, 1 ) = #32 ) or
             ( Copy( cObs1.Text, nN, 1 ) = #13 ) and ( Copy( cObs1.Text, nN + 1, 1 ) = #10 ) then
          begin
            //Total Não Tributável, Sub-Total Tributável
            if nObs = StrToInt( qry_ajuste_impressao_L_NAO_TRIBUTAVEL.AsString ) then
            begin
              cAdiciona := Copy( cControla, 1, nEspaco ) +
                           Space( StrToInt( qry_ajuste_impressao_C_NAO_TRIBUTAVEL.AsString ) -
                                  Length( Copy( cControla, 1, nEspaco ) ) - 1 ) +
                           Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_NAO_TRIBUTAVEL.AsFloat ) ) ) ) +
                           Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_NAO_TRIBUTAVEL.AsFloat ) ) + ' ' +
                           Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_SUB_TOT_TRIBUTAVEL.AsFloat ) ) ) ) +
                           Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_SUB_TOT_TRIBUTAVEL.AsFloat ) );
              lNaoTrib := False;
            end
            //Comissão
            else if nObs = StrToInt( qry_ajuste_impressao_L_COMISSAO.AsString ) then
            begin
              cAdiciona := Copy( cControla, 1, nEspaco ) +
                           Space( StrToInt( qry_ajuste_impressao_C_COMISSAO.AsString ) -
                                  Length( Copy( cControla, 1, nEspaco ) ) - 1 ) +
                           Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_COMISSAO.AsFloat ) ) ) ) +
                           Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_COMISSAO.AsFloat ) );
              lComissao := False;
            end
            //Total Geral
            else if nObs = StrToInt( qry_ajuste_impressao_L_TOTAL_GERAL.AsString ) then
            begin
              cAdiciona := Copy( cControla, 1, nEspaco ) +
                           Space( StrToInt( qry_ajuste_impressao_C_TOTAL_GERAL.AsString ) -
                                  Length( Copy( cControla, 1, nEspaco ) ) - 1 ) +
                           Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_GERAL.AsFloat ) ) ) ) +
                           Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_GERAL.AsFloat ) );
              lTotGeral := False;
            end
            //Valor Tributável
            else if nObs = StrToInt( qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL.AsString ) then
            begin
              cAdiciona := Copy( cControla, 1, nEspaco ) +
                           Space( StrToInt( qry_ajuste_impressao_C_TOTAL_TRIBUTAVEL.AsString ) -
                                  Length( Copy( cControla, 1, nEspaco ) ) - 1 ) +
                           Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_TRIBUTAVEL.AsFloat ) ) ) ) +
                           Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_TRIBUTAVEL.AsFloat ) );
              lTrib := False;
            end
            //I.S.S.
            else if nObs = StrToInt( qry_ajuste_impressao_L_ISS.AsString ) then
            begin
              cAdiciona := Copy( cControla, 1, nEspaco ) +
                           Space( StrToInt( qry_ajuste_impressao_C_ISS.AsString ) -
                                  Length( Copy( cControla, 1, nEspaco ) ) - 1 ) +
                           Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_ISS.AsFloat ) ) ) ) +
                           Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_ISS.AsFloat ) );
              lISS := False;
            end
            //I.R.R.F.
            else if nObs = StrToInt( qry_ajuste_impressao_L_IRRF.AsString ) then
            begin
              cAdiciona := Copy( cControla, 1, nEspaco ) +
                           Space( StrToInt( qry_ajuste_impressao_C_IRRF.AsString ) -
                                  Length( Copy( cControla, 1, nEspaco ) ) - 1 ) +
                           Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_IR.AsFloat ) ) ) ) +
                           Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_IR.AsFloat ) );
              lIRRF := False;
            end
            //Retenção
            else if nObs = StrToInt( qry_ajuste_impressao_L_COFINS.AsString ) then
            begin
              cAdiciona := Trim( cControla ) +
                           Space( StrToInt( qry_ajuste_impressao_C_COFINS.AsString ) -
                                 Length( Copy( cControla, 1, nEspaco ) ) - 1 ) +
                           Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_RETENCAO.AsFloat ) ) ) ) +
                           Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_RETENCAO.AsFloat ) );
              lRetencao := False;
            end
            else
            begin
              cAdiciona := Copy( cControla, 1, nEspaco );
            end;
            cObs2.Add( cAdiciona );
            cControla   := Copy( cControla, nEspaco + 1, Length( cControla ) - 1 );
            nCaracteres := Length( Trim( cControla ) );
            nMult       := nCaracteres - 1;
            nObs        := nObs + 1;
            lEntrou     := True;
          end;
        end;
        nMult := nMult + 1;
        nCaracteres := nCaracteres + 1;
      end;

      if lEntrou or ( Trim( cControla ) = '' ) then
        cControla := '';

      // Faz qdo a observação já terminou e imprime o resto dos valores da Nota
      while nObs <= ( StrToInt( qry_ajuste_impressao_L_COFINS.AsString ) ) do
      begin
        //Não Tributável
        if ( nObs = StrToInt( qry_ajuste_impressao_L_NAO_TRIBUTAVEL.AsString ) ) and lNaoTrib then
        begin
          cAdiciona := Trim( cControla ) +
                       Space( StrToInt( qry_ajuste_impressao_C_NAO_TRIBUTAVEL.AsString ) -
                              Length( Trim( cControla ) ) - 1 ) +
                       Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_NAO_TRIBUTAVEL.AsFloat ) ) ) ) +
                       Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_NAO_TRIBUTAVEL.AsFloat ) ) + ' ' +
                       Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_SUB_TOT_TRIBUTAVEL.AsFloat ) ) ) ) +
                       Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_SUB_TOT_TRIBUTAVEL.AsFloat ) );
          lNaoTrib  := False;
          cControla := '';
          nObs      := nObs + 1;
        end
        //Comissão
        else if ( nObs = StrToInt( qry_ajuste_impressao_L_COMISSAO.AsString ) ) and lComissao then
        begin
          cAdiciona := Trim( cControla ) +
                       Space( StrToInt( qry_ajuste_impressao_C_COMISSAO.AsString ) -
                              Length( Trim( cControla ) ) - 1 ) +
                       Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_COMISSAO.AsFloat ) ) ) ) +
                       Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_COMISSAO.AsFloat ) );
          lComissao := False;
          cControla := '';
          nObs      := nObs + 1;
        end
        //Total Geral
        else if ( nObs = StrToInt( qry_ajuste_impressao_L_TOTAL_GERAL.AsString ) ) and lTotGeral then
        begin
          cAdiciona := Trim( cControla ) +
                       Space( StrToInt( qry_ajuste_impressao_C_TOTAL_GERAL.AsString ) -
                              Length( Trim( cControla ) ) - 1 ) +
                       Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_GERAL.AsFloat ) ) ) ) +
                       Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_GERAL.AsFloat ) );
          lTotGeral := False;
          cControla := '';
          nObs      := nObs + 1;
        end
        //Total Tributável
        else if ( nObs = StrToInt( qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL.AsString ) ) and lTrib then
        begin
          cAdiciona := Trim( cControla ) +
                       Space( StrToInt( qry_ajuste_impressao_C_TOTAL_TRIBUTAVEL.AsString ) -
                              Length( Trim( cControla ) ) - 1 ) +
                       Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_TRIBUTAVEL.AsFloat ) ) ) ) +
                       Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_TRIBUTAVEL.AsFloat ) );
          lTrib     := False;
          cControla := '';
          nObs      := nObs + 1;
        end
        //ISS
        else if ( nObs = StrToInt( qry_ajuste_impressao_L_ISS.AsString ) ) and lISS then
        begin
          cAdiciona := Trim( cControla ) +
                       Space( StrToInt( qry_ajuste_impressao_C_ISS.AsString ) -
                              Length( Trim( cControla ) ) - 1 ) +
                       Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_ISS.AsFloat ) ) ) ) +
                       Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_ISS.AsFloat ) );
          lISS      := False;
          cControla := '';
          nObs      := nObs + 1;
        end
        //IRRF
        else if ( nObs = StrToInt( qry_ajuste_impressao_L_IRRF.AsString ) ) and lIRRF then
        begin
          cAdiciona := Trim( cControla ) +
                       Space( StrToInt( qry_ajuste_impressao_C_IRRF.AsString ) -
                              Length( Trim( cControla ) ) - 1 ) +
                       Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_IR.AsFloat ) ) ) ) +
                       Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_IR.AsFloat ) );
          lIRRF     := False;
          cControla := '';
          nObs      := nObs + 1;
        end
       //Retenção
        else if ( nObs = StrToInt( qry_ajuste_impressao_L_COFINS.AsString ) ) and lRetencao then
        begin
          cAdiciona := Trim( cControla ) +
                       Space( StrToInt( qry_ajuste_impressao_C_COFINS.AsString ) -
                              Length( Trim( cControla ) ) - 1 ) +
                       Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_RETENCAO.AsFloat ) ) ) ) +
                       Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_RETENCAO.AsFloat ) );
          lRetencao := False;
          cControla := '';
          nObs      := nObs + 1;
        end
        else
        begin
          cAdiciona := Trim( cControla + ' ' );
          cControla := '';
          nObs      := nObs + 1;
        end;

        cObs2.Add( cAdiciona );
      end;

      rp_nf.MemoSay( StrToInt( qry_ajuste_impressao_L_OBS.AsString ) + nLinhas,
                     StrToInt( qry_ajuste_impressao_C_OBS.AsString ),
                     cObs2 );
    end;

    //Não Tributável
    if lNaoTrib then
    begin
      rp_nf.Say( StrToInt( qry_ajuste_impressao_L_NAO_TRIBUTAVEL.AsString ),
                 StrToInt( qry_ajuste_impressao_C_NAO_TRIBUTAVEL.AsString ),
                 Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_NAO_TRIBUTAVEL.AsFloat ) ) ) ) +
                 Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_NAO_TRIBUTAVEL.AsFloat ) ) );

      rp_nf.Say( StrToInt( qry_ajuste_impressao_L_NAO_TRIBUTAVEL.AsString ),
                 StrToInt( qry_ajuste_impressao_C_SUB_TOTAL_TRIBUTAVEL.AsString ),
                 Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_SUB_TOT_TRIBUTAVEL.AsFloat ) ) ) ) +
                 Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_SUB_TOT_TRIBUTAVEL.AsFloat ) ) );

      lNaoTrib := False;
    end;

    //Comissão
    if lComissao then
    begin
      rp_nf.Say( StrToInt( qry_ajuste_impressao_L_COMISSAO.AsString ),
                 StrToInt( qry_ajuste_impressao_C_COMISSAO.AsString ),
                 Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_COMISSAO.AsFloat ) ) ) ) +
                 Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_COMISSAO.AsFloat ) ) );

      lComissao := False;
    end;

    //Total Geral
    if lTotGeral then
    begin
      rp_nf.Say( StrToInt( qry_ajuste_impressao_L_TOTAL_GERAL.AsString ),
                 StrToInt( qry_ajuste_impressao_C_TOTAL_GERAL.AsString ),
                 Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_GERAL.AsFloat ) ) ) ) +
                 Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_GERAL.AsFloat ) ) );

      lTotGeral := False;
    end;

    //------------------------------------------------------------------------------------------
    //Quadro Total somente em Faturas
    if cbo_tipo_nf_serv.ItemIndex = 0 then
    begin

      if (qry_nf_serv_op_IN_QUADRO_TOTAL.AsString = '1') then
        if (qry_nf_serv_op_VL_RETENCAO.AsInteger > 0) then
          linha_total := StrToInt( qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL.AsString ) - 1 else
          linha_total := StrToInt( qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL.AsString );

      if qry_nf_serv_op_IN_QUADRO_TOTAL.AsString = '1' then
      begin
        //Total Num
        rp_nf.Say( linha_total, //StrToInt( qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL.AsString ),
                   StrToInt( qry_ajuste_impressao_C_OBS.AsString ),
                   'Total Numerário Recebido' + Space( 7 ) + cMoedaNac +
                   Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_NUM.AsFloat ) ) ) ) +
                   Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_NUM.AsFloat ) ) );
      end
      else
      begin
        // RETENÇÃO 1o LINHA
        rp_nf.Say( StrToInt( qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL.AsString ),
                   StrToInt( qry_ajuste_impressao_C_OBS.AsString ),
                   Ret1 );

      end;

      if ((qry_nf_serv_op_IN_QUADRO_TOTAL.AsString = '1') and (qry_nf_serv_op_VL_RETENCAO.AsInteger > 0)) then
      begin
        //Retenção
        rp_nf.Say( StrToInt( qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL.AsString ) ,
                   StrToInt( qry_ajuste_impressao_C_OBS.AsString ),
                   qry_nf_serv_op_NM_RETENCAO.AsString + Space( 31 - Length(Trim(qry_nf_serv_op_NM_RETENCAO.AsString)) ) + cMoedaNac +
                   Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_RETENCAO.AsFloat ) ) ) ) +
                   Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_RETENCAO.AsFloat ) ) )
      end;

      //Valor Tributável - ISS
      if lTrib then
      begin
        rp_nf.Say( StrToInt( qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL.AsString ),
                   StrToInt( qry_ajuste_impressao_C_TOTAL_TRIBUTAVEL.AsString ),
                   Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_TRIBUTAVEL.AsFloat ) ) ) ) +
                   Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_TRIBUTAVEL.AsFloat ) ) );

        lTrib := False;
      end;

      if qry_nf_serv_op_IN_QUADRO_TOTAL.AsString = '1' then
      begin
        //Descrição do I.R.R.F.
        rp_nf.Say( StrToInt( qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL.AsString ) + 1,
                   StrToInt( qry_ajuste_impressao_C_OBS.AsString ),
                   Trim( qry_nf_serv_op_NM_IR.AsString ) +
                   Space( 31 - Length( Trim( qry_nf_serv_op_NM_IR.AsString ) ) ) + cMoedaNac +
                   Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_IR.AsFloat ) ) ) ) +
                   Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_IR.AsFloat ) ) );
      end
      else
      begin
        // RETENÇÃO 2o LINHA
        rp_nf.Say( StrToInt( qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL.AsString ) + 1,
                   StrToInt( qry_ajuste_impressao_C_OBS.AsString ),
                   Ret2 );
      end;

      if ( qry_nf_serv_op_IN_QUADRO_TOTAL.AsString = '1' ) and
         ( UpperCase( Trim( qry_nf_serv_op_END_CIDADE.AsString ) ) = 'SANTOS' ) then
      begin
        //Descrição do I.S.S.
        cNmISS := 'ISS retido na fonte';
        rp_nf.Say( StrToInt( qry_ajuste_impressao_L_ISS.AsString ),
                   StrToInt( qry_ajuste_impressao_C_OBS.AsString ),
                   Trim( cNmISS ) +
                   Space( 31 - Length( Trim( cNmISS ) ) ) + cMoedaNac +
                   Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_ISS.AsFloat ) ) ) ) +
                   Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_ISS.AsFloat ) ) );

        //I.S.S.
        if lISS then
        begin
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_ISS.AsString ),
                     StrToInt( qry_ajuste_impressao_C_ISS.AsString ),
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_ISS.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_ISS.AsFloat ) ) );
        end;

        //N.Fat
        rp_nf.Say( StrToInt( qry_ajuste_impressao_L_ISS.AsString ) + 1,
                   StrToInt( qry_ajuste_impressao_C_OBS.AsString ),
                   'N/Fat.' + Space( 25 ) + #27#33#128 + cMoedaNac +
                   Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_GERAL.AsFloat ) ) ) ) +
                   Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_GERAL.AsFloat ) ) + #27#33#0 );

        //Saldo
        rp_nf.Say( StrToInt( qry_ajuste_impressao_L_IRRF.AsString ),
                   StrToInt( qry_ajuste_impressao_C_OBS.AsString ),
                   Trim( qry_nf_serv_op_NM_SALDO.AsString ) +
                   Space( 31 - Length( Trim( qry_nf_serv_op_NM_SALDO.AsString ) ) ) + cMoedaNac +
                   Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_SALDO.AsFloat ) ) ) ) +
                   Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_SALDO.AsFloat ) ) );

        //I.R.R.F.
        if lIRRF then
        begin
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_IRRF.AsString ),
                     StrToInt( qry_ajuste_impressao_C_IRRF.AsString ),
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_IR.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_IR.AsFloat ) ) );
        end;

        //Retenção
        if lRetencao then
        begin
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_COFINS.AsString ),
                     StrToInt( qry_ajuste_impressao_C_COFINS.AsString ),
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_RETENCAO.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_RETENCAO.AsFloat ) ) );
        end;
      end
      else //Não é de Santos
      begin
        if qry_nf_serv_op_IN_QUADRO_TOTAL.AsString = '1' then
        begin
          //N.Fat
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_ISS.AsString ),
                     StrToInt( qry_ajuste_impressao_C_OBS.AsString ),
                     'N/Fat.' + Space( 25 ) + #27#33#128 + cMoedaNac +
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_GERAL.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_TOT_GERAL.AsFloat ) ) + #27#33#0 );
        end;

        //I.S.S.
        if lISS then
        begin
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_ISS.AsString ),
                     StrToInt( qry_ajuste_impressao_C_ISS.AsString ),
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_ISS.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_ISS.AsFloat ) ) );
        end;

        if qry_nf_serv_op_IN_QUADRO_TOTAL.AsString = '1' then
        begin
          //Saldo
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_ISS.AsString ) + 1,
                     StrToInt( qry_ajuste_impressao_C_OBS.AsString ),
                     Trim( qry_nf_serv_op_NM_SALDO.AsString ) +
                     Space( 31 - Length( Trim( qry_nf_serv_op_NM_SALDO.AsString ) ) ) + cMoedaNac +
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_SALDO.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_SALDO.AsFloat ) ) );
        end;

        //I.R.R.F.
        if lIRRF then
        begin
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_IRRF.AsString ),
                     StrToInt( qry_ajuste_impressao_C_IRRF.AsString ),
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_IR.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_IR.AsFloat ) ) );
        end;
       //Retenção
        if lRetencao then
        begin
          rp_nf.Say( StrToInt( qry_ajuste_impressao_L_COFINS.AsString ),
                     StrToInt( qry_ajuste_impressao_C_COFINS.AsString ),
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_RETENCAO.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_op_VL_RETENCAO.AsFloat ) ) );
        end;
      end;
    end;

    // Salto de página
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_COFINS.AsString ) + 1,
               StrToInt( qry_ajuste_impressao_C_COFINS.AsString ), #12 );

    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_COFINS.AsString ) + 1,
               StrToInt( qry_ajuste_impressao_C_COFINS.AsString ) + 1, #27#64 );

    rp_nf.EndDoc;

    qry_nf_serv_op_.Close;

  end;
end;
{$HINTS ON}

{$HINTS OFF}
procedure Tfrm_nf_serv.GeraNFAdm;
var
  cControla, cAdiciona : String;
  nN, nMult, nCaracteres, nEspaco, nLinhas, nObs : Integer;
  lEntrou, lNaoTrib, lComissao, lTotGeral, lTrib, lISS, lIRRF : Boolean;
  cHist1, cHist2, cObs1, cObs2 : TStringlist;
  nIndaia, nServicos : Double;
begin
  with datm_nf_serv do
  begin
    qry_ajuste_impressao_.Close;
    qry_ajuste_impressao_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_ajuste_impressao_.Prepare;
    qry_ajuste_impressao_.Open;
    if qry_ajuste_impressao_.RecordCount = 0 then
    begin
      BoxMensagem( 'Ajuste de Impressão não cadastrado!', 2 );
      qry_ajuste_impressao_.Close;
      Exit;
    end;

    qry_nf_serv_adm_.Close;
    qry_nf_serv_adm_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_nf_serv_adm_.ParamByName('NR_DOCTO').AsString    := qry_grd_adm_NR_DOCTO.AsString;
    qry_nf_serv_adm_.Prepare;
    qry_nf_serv_adm_.Open;

    rp_nf.PrinterName := impressora;
    //rp_nf.SetToDefaultPrinter;
    rp_nf.BeginDoc;

    rp_nf.Say( 01, 01, #27#64#27#120#0#18#27#80#27#67#0#12#27#50#27#40#116#3#0#1#25#0 );

    // Emissão, Nº Relatório/Ano
    if qry_nf_serv_adm_NR_RELATORIO.AsString <> '' then
    begin
      rp_nf.Say( StrToInt( qry_ajuste_impressao_L_EMISSAO.AsString ),
                 StrToInt( qry_ajuste_impressao_C_EMISSAO.AsString ),
                 FormatDateTime( 'dd/mm/yyyy', qry_nf_serv_adm_DT_EMISSAO.AsDateTime ) + ' R:' +
                 Copy( qry_nf_serv_adm_NR_RELATORIO.AsString, 2, 2 ) + '/' + Copy( qry_nf_serv_adm_NR_ANO.AsString, 3, 2 ) );
    end
    else
    begin
      rp_nf.Say( StrToInt( qry_ajuste_impressao_L_EMISSAO.AsString ),
                 StrToInt( qry_ajuste_impressao_C_EMISSAO.AsString ),
                 Space( 4 ) + FormatDateTime( 'dd/mm/yyyy', qry_nf_serv_adm_DT_EMISSAO.AsDateTime ) );
    end;
    //Vencimento
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_EMISSAO.AsString ),
               StrToInt( qry_ajuste_impressao_C_VENCIMENTO.AsString ),
               FormatDateTime( 'dd/mm/yyyy', qry_nf_serv_adm_DT_VENCIMENTO.AsDateTime ) );
    //Dados do cliente
    //Razão Social
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_RAZAO_SOCIAL.AsString ),
               StrToInt( qry_ajuste_impressao_C_RAZAO_SOCIAL.AsString ),
               qry_nf_serv_adm_NM_FAVORECIDO.AsString );
    //Endereço
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_ENDERECO.AsString ),
               StrToInt( qry_ajuste_impressao_C_ENDERECO.AsString ),
               Trim( qry_nf_serv_adm_END_FAVORECIDO.AsString ) + ', ' +
               Trim( qry_nf_serv_adm_END_NUMERO.AsString ) );
    //Município
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_MUNICIPIO.AsString ),
               StrToInt( qry_ajuste_impressao_C_MUNICIPIO.AsString ),
               Trim( qry_nf_serv_adm_END_CIDADE.AsString ) );
    //Bairro
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_MUNICIPIO.AsString ),
               StrToInt( qry_ajuste_impressao_C_BAIRRO.AsString ),
               Trim( qry_nf_serv_adm_END_BAIRRO.AsString ) );
    //UF
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_MUNICIPIO.AsString ),
               StrToInt( qry_ajuste_impressao_C_UF.AsString ),
               Trim( qry_nf_serv_adm_END_UF.AsString ) );
    //CEP
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_MUNICIPIO.AsString ),
               StrToInt( qry_ajuste_impressao_C_CEP.AsString ),
               Copy( qry_nf_serv_adm_END_CEP.AsString, 1, 5 ) + '-' +
               Copy( qry_nf_serv_adm_END_CEP.AsString, 6, 3 ) );
    //C.N.P.J.
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_CNPJ.AsString ),
               StrToInt( qry_ajuste_impressao_C_CNPJ.AsString ),
               Copy( qry_nf_serv_adm_CGC_EMPRESA.AsString,  1, 2 ) + '.' +
               Copy( qry_nf_serv_adm_CGC_EMPRESA.AsString,  3, 3 ) + '.' +
               Copy( qry_nf_serv_adm_CGC_EMPRESA.AsString,  6, 3 ) + '/' +
               Copy( qry_nf_serv_adm_CGC_EMPRESA.AsString,  9, 4 ) + '-' +
               Copy( qry_nf_serv_adm_CGC_EMPRESA.AsString, 13, 2 ) );
    //Inscr.Est
    if ( UpperCase( qry_nf_serv_adm_IE_EMPRESA.AsString ) <> 'ISENTO' ) and
       ( UpperCase( qry_nf_serv_adm_IE_EMPRESA.AsString ) <> 'ISENTA' ) then
       rp_nf.Say( StrToInt( qry_ajuste_impressao_L_CNPJ.AsString ),
                  StrToInt( qry_ajuste_impressao_C_IE.AsString ),
                  Copy( qry_nf_serv_adm_IE_EMPRESA.AsString,  1, 3 ) + '.' +
                  Copy( qry_nf_serv_adm_IE_EMPRESA.AsString,  4, 3 ) + '.' +
                  Copy( qry_nf_serv_adm_IE_EMPRESA.AsString,  7, 3 ) + '/' +
                  Copy( qry_nf_serv_adm_IE_EMPRESA.AsString, 10, 3 ) )
    else
       rp_nf.Say( StrToInt( qry_ajuste_impressao_L_CNPJ.AsString ),
                  StrToInt( qry_ajuste_impressao_C_IE.AsString ),
                  Trim( qry_nf_serv_adm_IE_EMPRESA.AsString ) );
    //Despesas
    nLinhas   := 0;
    nIndaia   := 0;
    nServicos := 0;

    qry_nf_serv_adm_item_.Close;
    qry_nf_serv_adm_item_.Prepare;
    qry_nf_serv_adm_item_.Open;
    while Not qry_nf_serv_adm_item_.EOF do
    begin
      if nLinhas < qry_ajuste_impressao_NR_LINHAS.AsInteger then
      begin
        //Descrição da Despesa ou do Serviço
        cHist1 := TStringList.Create;
        cHist2 := TStringList.Create;
        cHist1.Assign( qry_nf_serv_adm_item_TX_HISTORICO );

        nMult       := 0;
        nEspaco     := 0;
        nCaracteres := 1;
        cControla   := '';
        lEntrou     := True;

        for nN := 1 to length( cHist1.Text ) do
        begin
          lEntrou := False;
          if ( Copy( cHist1.Text, nN, 1 ) <> #0 ) then
          begin
            if ( Copy( cHist1.Text, nN, 1 ) <> #13 ) and ( Copy( cHist1.Text, nN + 1, 1 ) <> #10 ) then
               cControla := cControla + Copy( cHist1.Text, nN, 1 );

            if ( Copy( cHist1.Text, nN, 1 ) = #32 ) or
               ( ( Copy( cHist1.Text, nN, 1 ) = #13 ) and ( Copy( cHist1.Text, nN + 1, 1 ) = #10 ) ) then
               nEspaco := nCaracteres;

            if ( Copy( cHist1.Text, nN, 1 ) = #10 ) and ( Copy( cHist1.Text, nN - 1, 1 ) = #13 ) then
               cControla := Copy( cControla, 1, Length( cControla ) - 1 );

            if ( nMult = 38 ) and ( Trim( cControla ) <> '' ) or
               ( Copy( cHist1.Text, nN, 1 ) = #13 ) and ( Copy( cHist1.Text, nN + 1, 1 ) = #10 ) then
            begin
//              if cHist1.i
              cHist2.Add( Copy( cControla, 1, nEspaco ) );
              cControla   := Copy( cControla, nEspaco + 1, Length( cControla ) - 1 );
              nCaracteres := Length( Trim( cControla ) );
              nMult       := nCaracteres - 1;
              lEntrou     := True;
            end;
          end;
          nMult       := nMult + 1;
          nCaracteres := nCaracteres + 1;
        end;

        if qry_nf_serv_adm_item_IN_COLUNA.AsString = '1' then //Indaiá
        begin
          //Indaiá
          cAdiciona := Trim( cControla ) + Space( StrToInt( qry_ajuste_impressao_C_INDAIA.AsString ) + nLinhas - Length( Trim( cControla ) ) ) +
                       Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_item_VL_ITEM.AsFloat ) ) ) ) +
                       Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_item_VL_ITEM.AsFloat ) );
        end;
        if qry_nf_serv_adm_item_IN_COLUNA.AsString = '2' then //Serviços
        begin
          //Serviços
          cAdiciona := Trim( cControla ) + Space( StrToInt( qry_ajuste_impressao_C_SERVICOS.AsString ) + nLinhas - Length( Trim( cControla ) ) ) +
                       Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_item_VL_ITEM.AsFloat ) ) ) ) +
                       Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_item_VL_ITEM.AsFloat ) );
        end;

        cHist2.Add( cAdiciona );

        rp_nf.MemoSay( StrToInt( qry_ajuste_impressao_L_DESCRICAO.AsString ) + nLinhas,
                       StrToInt( qry_ajuste_impressao_C_DESCRICAO.AsString ),
                       cHist2 );

        nLinhas := nLinhas + cHist2.Count + 1;
      end
      else //Processar outras Despesas
      begin
        if qry_nf_serv_adm_item_IN_COLUNA.AsString = '1' then //Indaiá
          nIndaia := nIndaia + qry_nf_serv_adm_item_VL_ITEM.AsFloat;
        if qry_nf_serv_adm_item_IN_COLUNA.AsString = '2' then //Serviços
          nServicos := nServicos + qry_nf_serv_adm_item_VL_ITEM.AsFloat;
      end;

      qry_nf_serv_adm_item_.Next;
    end;

    //Imprimir Outras Vide Anexo se houver
    if ( nIndaia > 0 ) or ( nServicos > 0 ) then
    begin
      //Descrição da Despesa ou do Serviço
      rp_nf.Say( StrToInt( qry_ajuste_impressao_L_DESCRICAO.AsString ) + nLinhas,
                 StrToInt( qry_ajuste_impressao_C_DESCRICAO.AsString ),
                 'OUTRAS VIDE ANEXO' );

      if qry_nf_serv_adm_item_IN_COLUNA.AsString = '1' then //Indaiá
      begin
        //Indaiá
        rp_nf.Say( StrToInt( qry_ajuste_impressao_L_DESCRICAO.AsString ) + nLinhas,
                   StrToInt( qry_ajuste_impressao_C_INDAIA.AsString ),
                   Space( 12 - Length( Trim( FormatFloat( '#0,.00', nIndaia ) ) ) ) +
                   Trim( FormatFloat( '#0,.00', nIndaia ) ) );
      end;
      if qry_nf_serv_adm_item_IN_COLUNA.AsString = '2' then //Serviços
      begin
        //Serviços
        rp_nf.Say( StrToInt( qry_ajuste_impressao_L_DESCRICAO.AsString ) + nLinhas,
                   StrToInt( qry_ajuste_impressao_C_SERVICOS.AsString ),
                   Space( 12 - Length( Trim( FormatFloat( '#0,.00', nServicos ) ) ) ) +
                   Trim( FormatFloat( '#0,.00', nServicos ) ) );
      end;
    end;

    qry_nf_serv_adm_item_.Close;

    //Obs
    lNaoTrib  := True;
    lComissao := True;
    lTotGeral := True;
    lTrib     := True;
    lISS      := True;
    lIRRF     := True;
    nLinhas   := 0;
    nObs      := StrToInt( qry_ajuste_impressao_L_NAO_TRIBUTAVEL.AsString );

    cObs1 := TStringList.Create;
    cObs2 := TStringList.Create;
    cObs1.Assign( qry_nf_serv_adm_TX_OBS );

    nMult       := 0;
    nEspaco     := 0;
    nCaracteres := 1;
    cControla   := '';
    lEntrou     := True;

    for nN := 1 to length( cObs1.Text ) do
    begin
      lEntrou := False;
      if ( Copy( cObs1.Text, nN, 1 ) <> #0 ) then
      begin
        if ( Copy( cObs1.Text, nN, 1 ) <> #13 ) and ( Copy( cObs1.Text, nN + 1, 1 ) <> #10 ) then
           cControla := cControla + Copy( cObs1.Text, nN, 1 );

        if ( Copy( cObs1.Text, nN, 1 ) = #32 ) or
           ( ( Copy( cObs1.Text, nN, 1 ) = #10 ) and ( Copy( cObs1.Text, nN - 1, 1 ) = #13 ) ) then
           nEspaco := nCaracteres;

        if ( Copy( cObs1.Text, nN, 1 ) = #10 ) and ( Copy( cObs1.Text, nN - 1, 1 ) = #13 ) then
           cControla := Copy( cControla, 1, Length( cControla ) - 1 );

        if ( nMult = 48 ) and ( Trim( cControla ) <> '' ) or
           ( Copy( cObs1.Text, nN, 1 ) = #13 ) and ( Copy( cObs1.Text, nN + 1, 1 ) = #10 ) then
        begin
          //Total Não Tributável, Sub-Total Tributável
          if nObs = StrToInt( qry_ajuste_impressao_L_NAO_TRIBUTAVEL.AsString ) then
          begin
            cAdiciona := Copy( cControla, 1, nEspaco ) +
                         Space( StrToInt( qry_ajuste_impressao_C_NAO_TRIBUTAVEL.AsString ) -
                                Length( Copy( cControla, 1, nEspaco ) ) ) +
                         Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_NAO_TRIBUTAVEL.AsFloat ) ) ) ) +
                         Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_NAO_TRIBUTAVEL.AsFloat ) ) + ' ' +
                         Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_TRIBUTAVEL.AsFloat ) ) ) ) +
                         Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_TRIBUTAVEL.AsFloat ) );
            lNaoTrib := False;
          end
          //Comissão
          else if nObs = StrToInt( qry_ajuste_impressao_L_COMISSAO.AsString ) then
          begin
            cAdiciona := Copy( cControla, 1, nEspaco ) +
                         Space( StrToInt( qry_ajuste_impressao_C_COMISSAO.AsString ) -
                                Length( Copy( cControla, 1, nEspaco ) ) ) +
                         Space( 12 - Length( Trim( FormatFloat( '#0,.00', 0 ) ) ) ) +
                         Trim( FormatFloat( '#0,.00', 0 ) );
            lComissao := False;
          end
          //Total Geral
          else if nObs = StrToInt( qry_ajuste_impressao_L_TOTAL_GERAL.AsString ) then
          begin
            cAdiciona := Copy( cControla, 1, nEspaco ) +
                         Space( StrToInt( qry_ajuste_impressao_C_TOTAL_GERAL.AsString ) -
                                Length( Copy( cControla, 1, nEspaco ) ) ) +
                         Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_GERAL.AsFloat ) ) ) ) +
                         Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_GERAL.AsFloat ) );
            lTotGeral := False;
          end
          //Valor Tributável
          else if nObs = StrToInt( qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL.AsString ) then
          begin
            cAdiciona := Copy( cControla, 1, nEspaco ) +
                         Space( StrToInt( qry_ajuste_impressao_C_TOTAL_TRIBUTAVEL.AsString ) -
                                Length( Copy( cControla, 1, nEspaco ) ) ) +
                         Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_TRIBUTAVEL.AsFloat ) ) ) ) +
                         Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_TRIBUTAVEL.AsFloat ) );
            lTrib := False;
          end
          //I.S.S.
          else if nObs = StrToInt( qry_ajuste_impressao_L_ISS.AsString ) then
          begin
            cAdiciona := Copy( cControla, 1, nEspaco ) +
                         Space( StrToInt( qry_ajuste_impressao_C_ISS.AsString ) -
                                Length( Copy( cControla, 1, nEspaco ) ) ) +
                         Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_ISS.AsFloat ) ) ) ) +
                         Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_ISS.AsFloat ) );
            lISS := False;
          end
          //I.R.R.F.
          else if nObs = StrToInt( qry_ajuste_impressao_L_IRRF.AsString ) then
          begin
            cAdiciona := Copy( cControla, 1, nEspaco ) +
                         Space( StrToInt( qry_ajuste_impressao_C_IRRF.AsString ) -
                                Length( Copy( cControla, 1, nEspaco ) ) ) +
                         Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_IR.AsFloat ) ) ) ) +
                         Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_IR.AsFloat ) );
            lIRRF := False;
          end
          else
          begin
            cAdiciona := Copy( cControla, 1, nEspaco );
          end;
          cObs2.Add( cAdiciona );
          cControla   := Copy( cControla, nEspaco + 1, Length( cControla ) - 1 );
          nCaracteres := Length( Trim( cControla ) );
          nMult       := nCaracteres - 1;
          nObs        := nObs + 1;
          lEntrou     := True;
        end;
      end;
      nMult := nMult + 1;
      nCaracteres := nCaracteres + 1;
    end;
    if lEntrou or ( Trim( cControla ) = '' ) then
      cControla := '';

    while nObs <= ( StrToInt( qry_ajuste_impressao_L_IRRF.AsString ) ) do
    begin
      //Não Tributável
      if ( nObs = StrToInt( qry_ajuste_impressao_L_NAO_TRIBUTAVEL.AsString ) ) and lNaoTrib then
      begin
        cAdiciona := Trim( cControla ) +
                     Space( StrToInt( qry_ajuste_impressao_C_NAO_TRIBUTAVEL.AsString ) -
                            Length( Trim( cControla ) ) ) +
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_NAO_TRIBUTAVEL.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_NAO_TRIBUTAVEL.AsFloat ) ) + ' ' +
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_TRIBUTAVEL.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_TRIBUTAVEL.AsFloat ) );
        lNaoTrib  := False;
        cControla := '';
        nObs      := nObs + 1;
      end
      //Comissão
      else if ( nObs = StrToInt( qry_ajuste_impressao_L_COMISSAO.AsString ) ) and lComissao then
      begin
        cAdiciona := Trim( cControla ) +
                     Space( StrToInt( qry_ajuste_impressao_C_COMISSAO.AsString ) -
                            Length( Trim( cControla ) ) ) +
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', 0 ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', 0 ) );
        lComissao := False;
        cControla := '';
        nObs      := nObs + 1;
      end
      //Total Geral
      else if ( nObs = StrToInt( qry_ajuste_impressao_L_TOTAL_GERAL.AsString ) ) and lTotGeral then
      begin
        cAdiciona := Trim( cControla ) +
                     Space( StrToInt( qry_ajuste_impressao_C_TOTAL_GERAL.AsString ) -
                            Length( Trim( cControla ) ) ) +
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_GERAL.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_GERAL.AsFloat ) );
        lTotGeral := False;
        cControla := '';
        nObs      := nObs + 1;
      end
      //Total Tributavel
      else if ( nObs = StrToInt( qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL.AsString ) ) and lTrib then
      begin
        cAdiciona := Trim( cControla ) +
                     Space( StrToInt( qry_ajuste_impressao_C_TOTAL_TRIBUTAVEL.AsString ) -
                            Length( Trim( cControla ) ) ) +
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_TRIBUTAVEL.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_TOT_TRIBUTAVEL.AsFloat ) );
        lTrib     := False;
        cControla := '';
        nObs      := nObs + 1;
      end
      //ISS
      else if ( nObs = StrToInt( qry_ajuste_impressao_L_ISS.AsString ) ) and lISS then
      begin
        cAdiciona := Trim( cControla ) +
                     Space( StrToInt( qry_ajuste_impressao_C_ISS.AsString ) -
                            Length( Trim( cControla ) ) ) +
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_ISS.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_ISS.AsFloat ) );
        lISS      := False;
        cControla := '';
        nObs      := nObs + 1;
      end
      //IRRF
      else if ( nObs = StrToInt( qry_ajuste_impressao_L_IRRF.AsString ) ) and lIRRF then
      begin
        cAdiciona := Trim( cControla ) +
                     Space( StrToInt( qry_ajuste_impressao_C_IRRF.AsString ) -
                            Length( Trim( cControla ) ) ) +
                     Space( 12 - Length( Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_IR.AsFloat ) ) ) ) +
                     Trim( FormatFloat( '#0,.00', qry_nf_serv_adm_VL_IR.AsFloat ) );
        lIRRF     := False;
        cControla := '';
        nObs      := nObs + 1;
      end
      else
      begin
        cAdiciona := Trim( cControla + ' ' );
        cControla := '';
        nObs      := nObs + 1;
      end;

      cObs2.Add( cAdiciona );
    end;

    rp_nf.MemoSay( StrToInt( qry_ajuste_impressao_L_OBS.AsString ),
                   StrToInt( qry_ajuste_impressao_C_OBS.AsString ),
                   cObs2 );

    // Salto de página
    if lPulo then
    begin
      rp_nf.Say( StrToInt( qry_ajuste_impressao_L_IRRF.AsString ) + 1,
                 StrToInt( qry_ajuste_impressao_C_IRRF.AsString ), #12 );
    end;
    rp_nf.Say( StrToInt( qry_ajuste_impressao_L_IRRF.AsString ) + 1,
               StrToInt( qry_ajuste_impressao_C_IRRF.AsString ) + 1, #27#64 );

    rp_nf.EndDoc;

    qry_nf_serv_adm_.Close;

  end;
end;

procedure Tfrm_nf_serv.btn_preview_rateio_despClick(Sender: TObject);
var
  i : Integer;
begin
  if Not Consiste then Exit;

  with datm_nf_serv, crp_nf_serv do
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
          Screen.Cursor := crHourGlass;
          datm_main.db_broker.StartTransaction;
          for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
          begin
            TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
            with datm_nf_serv do
            begin
              //Comando para apaga Rateio
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
          Screen.Cursor := crDefault;

          if sp_fat_atz_rateio_imp.ParamByName('Result').AsInteger > 0 then
            ExibeErro( 'sp_fat_atz_rateio_imp', sp_fat_atz_rateio_imp.ParamByName('Result').AsInteger, '', 0.0 )
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
              qry_sum_fat_calc_rat_desp_.Close;
              qry_sum_fat_calc_rat_desp_.Prepare;
              qry_sum_fat_calc_rat_desp_.Open;

              ppRelFatCalculoRateioDesp.DeviceType := 'Screen';
              ppRelFatCalculoRateioDesp.Template.FileName := cDir_RPT + '\RBFAT003.RTM';
              ppRelFatCalculoRateioDesp.PrinterSetup.DocumentName := Caption;
              ppTitle.Caption := 'Rateio de Despesas - Nº ' + qry_fat_calculo_rateio_despesas_NR_NOTA_FATURA.AsString;
              ppRelFatCalculoRateioDesp.Print;

              Cria_SQL( 'UPDATE TFAT_CALCULO_RATEIO_DESP SET CD_USUARIO = NULL WHERE CD_USUARIO = ' + QuotedStr( str_cd_usuario ) );
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
          Screen.Cursor := crHourGlass;
          datm_main.db_broker.StartTransaction;
          for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
          begin
            TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
            with datm_nf_serv do
            begin
              //Comando para apaga Rateio
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
          Screen.Cursor := crDefault;

          if sp_fat_atz_rateio_exp.ParamByName('Result').AsInteger > 0 then
            ExibeErro( 'sp_fat_atz_rateio_exp', sp_fat_atz_rateio_exp.ParamByName('Result').AsInteger, '', 0.0 )
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
              qry_sum_fat_calc_rat_desp_.Close;
              qry_sum_fat_calc_rat_desp_.Prepare;
              qry_sum_fat_calc_rat_desp_.Open;

              ppRelFatCalculoRateioDesp.DeviceType := 'Screen';
              ppRelFatCalculoRateioDesp.Template.FileName := cDir_RPT + '\RBFAT003.RTM';
              ppRelFatCalculoRateioDesp.PrinterSetup.DocumentName := Caption;
              ppTitle.Caption := 'Rateio de Despesas - Nº ' + qry_fat_calculo_rateio_despesas_NR_NOTA_FATURA.AsString;
              ppRelFatCalculoRateioDesp.Print;

              Cria_SQL( 'UPDATE TFAT_CALCULO_RATEIO_DESP SET CD_USUARIO = NULL WHERE CD_USUARIO = ' + QuotedStr( str_cd_usuario ) );
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



procedure Tfrm_nf_serv.msk_nr_ndcEnter(Sender: TObject);
begin
  st_nr_ndc := msk_nr_ndc.Text;
end;

procedure Tfrm_nf_serv.msk_nr_ndcExit(Sender: TObject);
begin
  if Trim( msk_nr_ndc.Text ) = st_nr_ndc then Exit;
  AbreNFServ;
end;

procedure TFrm_nf_serv.pBeforePrint(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ppHeaderBand1')).BeforePrint := pBeforePrint2;
  TppPageStyle(Frm_impressao.FindComponent('ppPageStyle1')).BeforePrint := pBeforePrint3;
end;

procedure TFrm_nf_serv.pBeforePrint2(Sender: TObject);
var vTipoFat: string[1];
begin
  vTipoFat := '';
  vTipoFat := ConsultaLookUpSQL('SELECT ISNULL(TP_TIPO_FAT, '''') AS TIPO ' +
               '  FROM TS_FATURA (NOLOCK) ' +
               ' WHERE CD_UNID_NEG    = '''+ qryNFCD_UNID_NEG.AsString +''' ' +
               '   AND CD_PRODUTO     = '''+ qryNFCD_PRODUTO.AsString +''' ' +
               '   AND NR_SOLICITACAO = '''+ qryNFNR_SOLICITACAO.AsString +''' ', 'TIPO');

  TppDBMemo(Frm_impressao.FindComponent('RegISS')).Visible    := ((vTipoFat = 'F') and (UpperCase(qryNFCLI_CID.AsString) = 'SANTOS'));// and (UpperCase(qryNFCD_UNID_NEG.AsString) = '01')
  TppDBMemo(Frm_impressao.FindComponent('RegSoma1')).Visible  := (vTipoFat = 'F');
  TppDBMemo(Frm_impressao.FindComponent('RegSoma2')).Visible  := (vTipoFat = 'F');
  TppDBMemo(Frm_impressao.FindComponent('ppOBS')).Visible     := not (vTipoFat = 'F');
  TppSubReport(Frm_impressao.FindComponent('SubNumerario')).Visible  := (vTipoFat = 'F');
end;

procedure Tfrm_nf_serv.btnPrevClick(Sender: TObject);
var i:integer;
begin
  if Not Consiste then Exit;

  with datm_nf_serv do
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

    try
      datm_main.db_broker.StartTransaction;

      for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
      begin
        TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
        with datm_nf_serv do
        begin
          CloseStoredProc( sp_nf_serv_op );
          with sp_nf_serv_op do
          begin
            ParamByName('@cd_unid_neg').AsString    := msk_cd_unid_neg.Text;
            ParamByName('@cd_produto').AsString     := msk_cd_produto.Text;
            ParamByName('@nr_solicitacao').AsString := qry_grd_sol_NR_SOLICITACAO.AsString;
          end;
          ExecStoredProc( sp_nf_serv_op );
          CloseStoredProc( sp_nf_serv_op );
        end;
      end;


      ConsistePreviewFatura;
      datm_main.db_broker.Commit;
    except
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      BoxMensagem( 'Erro ao tentar imprimir Nota Fiscal!', 2 );
      Exit;
    end;

    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;

    qryNF.Close;
    qryNF.ParamByName('VIA').AsString := 'P';
    qryNF.ParamByName('USUARIO').AsString := str_cd_usuario;
    qryNF.Open;

    //chama o form de impressão!!
    Application.CreateForm(TFrm_impressao, Frm_impressao );
    frm_impressao.cd_unid_neg   := msk_cd_unid_neg.Text;
    frm_impressao.cd_modulo     := '1147';
    frm_impressao.vApenas_email := false;
    frm_impressao.vBeforePrint  :=  pBeforePrint;
    frm_impressao.ShowModal;
    frm_impressao.Release;

    with datm_nf_serv.qry_atz_dados_ do
    begin
      SQL.Clear;
      SQL.Add( 'UPDATE TNF_SERV_OP SET CD_EMISSOR = "" WHERE CD_EMISSOR = "' + str_cd_usuario + '"' );
      Prepare;
      ExecSQL;
    end;

    datm_nf_serv.qry_grd_sol_.Close;
    datm_nf_serv.qry_grd_sol_.Open;
    Screen.Cursor := crDefault;
  end;

end;

procedure Tfrm_nf_serv.qryNFCalcFields(DataSet: TDataSet);
begin
  //(1) - Endereço Unidade
  qryNFcalcUNEnd.AsString := '';
  if Trim(qryNFEND_UNID_NEG.AsString) <> '' then qryNFcalcUNEnd.AsString := Trim(qryNFEND_UNID_NEG.AsString);
  if qryNFcalcUNEnd.AsString = '' then begin
    if Trim(qryNFEND_NUMERO.AsString) <> '' then qryNFcalcUNEnd.AsString := Trim(qryNFEND_NUMERO.AsString)
  end else begin
    if Trim(qryNFEND_NUMERO.AsString) <> '' then qryNFcalcUNEnd.AsString := qryNFcalcUNEnd.AsString + ', ' + Trim(qryNFEND_NUMERO.AsString);
  end;
  if qryNFcalcUNEnd.AsString = '' then begin
    if Trim(qryNFEND_CEP.AsString) <> '' then qryNFcalcUNEnd.AsString := Trim(qryNFEND_CEP.AsString)
  end else begin
    if Trim(qryNFEND_CEP.AsString) <> '' then qryNFcalcUNEnd.AsString := qryNFcalcUNEnd.AsString + ' - CEP: ' + Copy(Trim(qryNFEND_CEP.AsString),1, 5) + '-' + Copy(Trim(qryNFEND_CEP.AsString),6, 3);
  end;
  qryNFcalcUNEnd.AsString := UpperCase(qryNFcalcUNEnd.AsString);
  //(4) - Bairro + Cidade Unidade
  qryNFcalcUNBairro.AsString := '';
  if Trim(qryNFEND_BAIRRO.AsString) <> '' then qryNFcalcUNBairro.AsString := Trim(qryNFEND_BAIRRO.AsString);
  if qryNFcalcUNBairro.AsString = '' then begin
    if Trim(qryNFEND_CIDADE.AsString) <> '' then qryNFcalcUNBairro.AsString := Trim(qryNFEND_CIDADE.AsString)
  end else begin
    if Trim(qryNFEND_CIDADE.AsString) <> '' then qryNFcalcUNBairro.AsString := qryNFcalcUNBairro .AsString + ' - ' + Trim(qryNFEND_CIDADE.AsString);
  end;
  if qryNFcalcUNBairro.AsString = '' then begin
    if Trim(qryNFEND_UF.AsString) <> '' then qryNFcalcUNBairro.AsString := Trim(qryNFEND_CEP.AsString)
  end else begin
    if Trim(qryNFEND_UF.AsString) <> '' then qryNFcalcUNBairro.AsString := qryNFcalcUNBairro.AsString + ' - ' + Trim(qryNFEND_UF.AsString);
  end;
  qryNFcalcUNBairro.AsString := UpperCase(qryNFcalcUNbairro.AsString);
  //(5) - Insc. Estadual Unidade
  if (UpperCase(qryNFIE_UNID_NEG.AsString) <> 'ISENTA') and (UpperCase(qryNFIE_UNID_NEG.AsString) <> 'ISENTO') and (UpperCase(qryNFIE_UNID_NEG.AsString) <> '') then begin
    qryNFCalcUNIE.AsString := 'I.EST.: ' +  Copy(qryNFIE_UNID_NEG.AsString, 1,3) + '.' + Copy(qryNFIE_UNID_NEG.AsString, 4,3) + '.' + Copy(qryNFIE_UNID_NEG.AsString, 7,3) + '.' + Copy(qryNFIE_UNID_NEG.AsString, 10,3)
  end else begin
    qryNFCalcUNIE.AsString := 'I.EST.: ' + UpperCase(qryNFIE_UNID_NEG.AsString);
  end;
  qryNFCalcUNIE.AsString := qryNFCalcUNIE.AsString + ' - I.MUN.: ' + Copy(qryNFIM_UNID_NEG.AsString, 1,3) + '.' + Copy(qryNFIM_UNID_NEG.AsString, 4,3) + '.' + Copy(qryNFIM_UNID_NEG.AsString, 7,1);
  //(6) - Fax
  if (Trim(qryNFNR_FAX1.AsString) <> '') or (Trim(qryNFNR_FAX2.AsString) <> '') then qryNFcalcUNFax.AsString := 'FAX: ';
  if Trim(qryNFNR_FAX1.AsString) <> '' then begin
    qryNFcalcUNFax.AsString := qryNFcalcUNFax.AsString + Trim(qryNFNR_FAX1.AsString);
    if Trim(qryNFNR_FAX2.AsString) <> '' then qryNFcalcUNFax.AsString := qryNFcalcUNFax.AsString + ' / ' + Trim(qryNFNR_FAX2.AsString);
  end else
    if Trim(qryNFNR_FAX2.AsString) <> '' then qryNFcalcUNFax.AsString := Trim(qryNFNR_FAX2.AsString);
  //(8) - Dt. Emissão
  if (Trim(qryNFDT_EMISSAO.ASString) <> '')  and (not qryNFDT_EMISSAO.IsNull) then qryNFcalcEmissao.AsString := FormatDateTime('dd/mm/yyyy', qryNFDT_EMISSAO.AsDateTime);
  if (Trim(qryNFNR_RELATORIO.ASString) <> '')  and (not qryNFNR_RELATORIO.IsNull) then qryNFcalcEmissao.AsString := qryNFcalcEmissao.AsString  + '   R.: ' + Trim(qryNFNR_RELATORIO.ASString);
  if (Trim(qryNFNR_ANO.ASString) <> '')  and (not qryNFNR_ANO.IsNull) then qryNFcalcEmissao.AsString := qryNFcalcEmissao.AsString  + '/' + Trim(qryNFNR_ANO.ASString);
  //(12) - End. Cliente
  qryNFcalcENEnd.AsString := '';
  if Trim(qryNFCLI_END.AsString) <> '' then qryNFcalcENEnd.AsString := Trim(qryNFCLI_END.AsString);
  if qryNFcalcENEnd.AsString = '' then begin
    if Trim(qryNFCLI_NUM.AsString) <> '' then qryNFcalcENEnd.AsString := Trim(qryNFCLI_NUM.AsString)
  end else begin
    if Trim(qryNFCLI_NUM.AsString) <> '' then qryNFcalcENEnd.AsString := qryNFcalcENEnd.AsString + ', ' + Trim(qryNFCLI_NUM.AsString);
  end;
  //(16) - Insc. Estadual - Cliente
  if (UpperCase(qryNFIE_EMPRESA.AsString) <> 'ISENTA') and (UpperCase(qryNFIE_EMPRESA.AsString) <> 'ISENTO') and (UpperCase(qryNFIE_EMPRESA.AsString) <> '') then begin
    qryNFCalcENIE.AsString := Copy(qryNFIE_EMPRESA.AsString, 1,3) + '.' + Copy(qryNFIE_EMPRESA.AsString, 4,3) + '.' + Copy(qryNFIE_EMPRESA.AsString, 7,3) + '.' + Copy(qryNFIE_EMPRESA.AsString, 10,3)
  end else begin
    qryNFcalcENIE.AsString := 'ISENTA';
  end;
  //(26) - Docto
  if Trim(qryNFCD_PRODUTO.AsString) = '01' then begin
    if Trim(qryNFNR_DI.AsString) = '' then
      qryNFcalcNrDocto.AsString := ''
    else
      qryNFcalcNrDocto.AsString := Copy(Trim(qryNFNR_DI.AsString), 1,2) + '/' + Copy(Trim(qryNFNR_DI.AsString), 3,7) + '-' +  Copy(Trim(qryNFNR_DI.AsString), 10,1);
  end else begin
    if Trim(qryNFNR_DI.AsString) = '' then
      qryNFcalcNrDocto.AsString := ''
    else
      qryNFcalcNrDocto.AsString := Copy(Trim(qryNFNR_DI.AsString), 1,2) + '/' + Copy(Trim(qryNFNR_DI.AsString), 3,7) + '-' +  Copy(Trim(qryNFNR_DI.AsString), 10,3);
  end;
  //(38) - Título 1
  if Trim(qryNFCD_UNID_NEG.AsString) = '01' then
    qryNFcalcCol1.AsString := '1) NÃO TRIBUTÁVEL'
  else
    qryNFcalcCol1.AsString := '1) VALOR DO REEMBOLSO';
  //(39) - Título 2
  if Trim(qryNFCD_UNID_NEG.AsString) = '01' then
    qryNFcalcCol2.AsString := '2) SUB-TOTAL'
  else
    qryNFcalcCol2.AsString := '2) SUB-TOTAL SERVIÇOS';
end;

procedure Tfrm_nf_serv.btnImpClick(Sender: TObject);
var i: Word;
    vNotaImpressa : string;
begin
  if Not Consiste then Exit;

  if datm_nf_serv.qry_grd_sol_.FieldByName('IN_PREVIEW').AsString = '1' then
  begin
    BoxMensagem( 'Não é possível emitir esta nota pois ela foi gerada como Preview', 2 );
    Exit;
  end;

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

  with datm_nf_serv do
  begin
    try
      if dbgrdSol.SelectedRows.Count > 0 then
      begin
      for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
        begin
          TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
          vNotaImpressa := ConsultaLookUPSQL('SELECT NR_SOLICITACAO FROM TRETENCAO_IR WHERE NR_SOLICITACAO = ''' + qry_fat_sol_NR_SOLICITACAO.AsString +
              ''' AND CD_UNID_NEG = ''' + qry_fat_sol_CD_UNID_NEG.AsString + ''' AND CD_PRODUTO = ''' + qry_fat_sol_CD_PRODUTO.AsString + '''', 'NR_SOLICITACAO');
          if (vNotaImpressa = '') and (qry_fat_sol_TP_TIPO_FAT.AsString = 'F') then
          begin
            qry_processos.Close;
            qry_processos.ParamByName('NR_SOLICITACAO').AsString := qry_fat_sol_NR_SOLICITACAO.AsString;
            qry_processos.ParamByName('CD_UNID_NEG').AsString := qry_fat_sol_CD_UNID_NEG.AsString;
            qry_processos.ParamByName('CD_PRODUTO').AsString := qry_fat_sol_CD_PRODUTO.AsString;
            qry_processos.Open;
            while not qry_processos.Eof do
            begin
              RetemImpostos(qry_processosNR_PROCESSO.AsString);
              FastExecSQL(' UPDATE TS_FATURA_PROCESSO SET VL_FATURA = (SELECT CASE WHEN CD_ITEM = ''996'' THEN ROUND(SUM(VL_ITEM), 2) * -1 ELSE ROUND(SUM(VL_ITEM), 2) END'+
                         '                                    FROM TFATURAMENTO_CC '+
                         '                                    WHERE CD_ITEM IN (''995'', ''996'') '+
                         '                                    AND CD_UNID_NEG = '''+msk_cd_unid_neg.Text+''' '+
                         '                                    AND CD_PRODUTO = '''+msk_cd_produto.Text+'''   '+
                         '                                    AND NR_SOLIC_FAT = '''+qry_fat_sol_NR_SOLICITACAO.AsString+'''    '+
                         '                                    AND NR_PROCESSO = ''' +qry_processosNR_PROCESSO.AsString+'''    '+
                         '                                    GROUP BY CD_ITEM )'+
                         ' WHERE CD_UNID_NEG = '''+msk_cd_unid_neg.Text+''' AND CD_PRODUTO = '''+msk_cd_produto.Text+''' '+
                         '  AND NR_PROCESSO = ''' +qry_processosNR_PROCESSO.AsString+'''    '+
                         '  AND NR_SOLICITACAO = '''+qry_fat_sol_NR_SOLICITACAO.AsString+''' ');
              qry_processos.Next
            end;
          end;
        end;
{          with qry_processos do
          begin
            Close;
            ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
            ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
            ParamByName('NR_SOLICITACAO').AsString := qry_fat_sol_NR_SOLICITACAO.AsString;
            Open;
            while not qry_processos.Eof do
            begin
              RetemImpostos(qry_processosNR_PROCESSO.AsString);
              qry_processos.Next;
            end;
          end;
        end;}

        for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
        begin
          TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
          // Atualiza a ts_fatura e ts_fatura_processo
          FastExecSQL(' UPDATE TS_FATURA SET VL_FATURA = (SELECT CASE WHEN CD_ITEM = ''996'' THEN ROUND(SUM(VL_ITEM), 2) * -1 ELSE ROUND(SUM(VL_ITEM), 2) END'+
                     '                                    FROM TFATURAMENTO_CC '+
                     '                                    WHERE CD_ITEM IN (''995'', ''996'') '+
                     '                                    AND CD_UNID_NEG = '''+msk_cd_unid_neg.Text+''' '+
                     '                                    AND CD_PRODUTO = '''+msk_cd_produto.Text+'''   '+
                     '                                    AND NR_SOLIC_FAT = '''+qry_fat_sol_NR_SOLICITACAO.AsString+'''    '+
                     '                                    GROUP BY CD_ITEM )'+
                     ' WHERE CD_UNID_NEG = '''+msk_cd_unid_neg.Text+''' AND CD_PRODUTO = '''+msk_cd_produto.Text+''' '+
                     '       AND NR_SOLICITACAO = '''+qry_fat_sol_NR_SOLICITACAO.AsString+''' ');
        end;

        datm_main.db_broker.StartTransaction;
        for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
        begin
         TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
         // executa calculos necessários para a NF
          CloseStoredProc( sp_nf_serv_op );
          with sp_nf_serv_op do
          begin
            ParamByName('@cd_unid_neg').AsString    := msk_cd_unid_neg.Text;
            ParamByName('@cd_produto').AsString     := msk_cd_produto.Text;
            ParamByName('@nr_solicitacao').AsString := qry_grd_sol_NR_SOLICITACAO.AsString;
          end;
          ExecStoredProc( sp_nf_serv_op );
          CloseStoredProc( sp_nf_serv_op );
          // refresh
          qry_fat_sol_.Close;
          qry_fat_sol_.Prepare;
          qry_fat_sol_.Open;
          nr_ult_nf_serv := StrToInt( ConsultaLookupSQL(' SELECT CONVERT(Integer,NR_ULT_NF_SERV) + 1 AS NR_ULT_NF_SERV ' +
                                                        '   FROM TAJUSTE_IMPRESSAO_NF_SERV_INDAIA ' +
                                                        '  WHERE CD_UNID_NEG = ''' + ifthen(msk_cd_unid_neg.Text = '07', '01', msk_cd_unid_neg.Text) + '''','NR_ULT_NF_SERV' ) );

          {if nr_ult_nf_serv = 094090 then  nr_ult_nf_serv := 094109; // gambs André - retirado 20/02/2009 por André}

          if (Trim(qry_fat_sol_NR_NF_SERV.AsString) = '') then
          begin
            //guarda número da úlitma nota na tabela da solicitação.
            qry_fat_sol_.Edit;
            qry_fat_sol_NR_NF_SERV.AsString     := Replicate( '0', 6 - Length( Trim( IntToStr( nr_ult_nf_serv ) ) ) ) + Trim( IntToStr( nr_ult_nf_serv ) );
            qry_fat_sol_NR_NOTA_FATURA.AsString := qry_fat_sol_NR_NF_SERV.AsString;
            qry_fat_sol_IN_IMP_NF_SERV.AsString := '1';
            qry_fat_sol_DT_NF_SERV.AsDateTime   := dt_server;
            qry_fat_sol_.Post;
            //guarda número da úlitma nota
            FastExecSQL(' UPDATE TAJUSTE_IMPRESSAO_NF_SERV_INDAIA ' +
                        '    SET NR_ULT_NF_SERV = ''' + Replicate( '0', 6 - Length( Trim( IntToStr( nr_ult_nf_serv ) ) ) ) + Trim( IntToStr( nr_ult_nf_serv ) ) + '''' +
                        '  WHERE CD_UNID_NEG = ''' + ifthen(msk_cd_unid_neg.Text = '07', '01', msk_cd_unid_neg.Text) + '''');
          end;
          //Realizar Evento
          if qry_fat_sol_TP_TIPO_FAT.AsString = 'F' then
          begin
            with TQuery.Create(application) do
            begin
              Databasename := 'DBBROKER';
              SQL.Clear;
              SQL.Add('    UPDATE F                                                                                 ');
              SQL.Add('    SET    F.DT_REALIZACAO      = CASE WHEN ISNULL(F.DT_REALIZACAO, '''') = '''' THEN CONVERT(DATETIME,CONVERT(VARCHAR,:DT_REALIZACAO,103),103) ELSE F.DT_REALIZACAO END, ');
              SQL.Add('           F.CD_RESP_REALIZACAO = CASE WHEN ISNULL(F.CD_RESP_REALIZACAO, '''') = '''' THEN ISNULL( :CD_USUARIO, ''0000'' ) ELSE F.CD_RESP_REALIZACAO END, ');
              SQL.Add('           F.DT_INSPECAO        = CONVERT(DATETIME,CONVERT(VARCHAR,:DT_REALIZACAO,103),103), ');
              SQL.Add('           F.CD_RESP_INSPECAO   = ISNULL( :CD_USUARIO, ''0000'' ),                           ');
              SQL.Add('           F.CD_RESULT_INSPECAO = ''C''                                                      ');
              SQL.Add('    FROM TS_FATURA_PROCESSO FP                                                               ');
              SQL.Add('    INNER JOIN TFOLLOWUP F (NOLOCK) ON F.NR_PROCESSO = FP.NR_PROCESSO                        ');
              SQL.Add('    WHERE FP.CD_UNID_NEG = '''+msk_cd_unid_neg.Text+''' AND                                  ');
              SQL.Add('          FP.CD_PRODUTO =  '''+msk_cd_produto.Text+''' AND                                   ');
              SQL.Add('          FP.NR_SOLICITACAO = '''+qry_fat_sol_NR_SOLICITACAO.AsString+''' AND                ');
              SQL.Add('    			CD_EVENTO     = ''092'' AND                                                         ');
              SQL.Add('          IN_APLICAVEL  = ''1''                                                              ');

{              SQL.Add('    UPDATE TFOLLOWUP');
              SQL.Add('    SET    DT_REALIZACAO      = CONVERT(DATETIME,CONVERT(VARCHAR,:DT_REALIZACAO,103),103),');
              SQL.Add('           CD_RESP_REALIZACAO = ISNULL( :CD_USUARIO, ''0000'' ),');
              SQL.Add('           DT_INSPECAO        = CONVERT(DATETIME,CONVERT(VARCHAR,:DT_REALIZACAO,103),103),');
              SQL.Add('           CD_RESP_INSPECAO   = ISNULL( :CD_USUARIO, ''0000'' ),');
              SQL.Add('           CD_RESULT_INSPECAO = ''C''');
              SQL.Add('    WHERE  NR_PROCESSO        = :NR_PROCESSO AND');
              SQL.Add('           CD_EVENTO          = ''092'' AND');
              SQL.Add('           IN_APLICAVEL       = ''1''');  }
             //Realiza Evento nos Pedidos
              SQL.Add('    UPDATE PO');
              SQL.Add('    SET    DT_REALIZACAO      = CONVERT(DATETIME,CONVERT(VARCHAR,:DT_REALIZACAO,103),103),');
              SQL.Add('           CD_RESP_REALIZACAO = ISNULL( :CD_USUARIO, ''0000'' )');
              SQL.Add('    FROM TPROCESSO EP');
              SQL.Add('    INNER JOIN TFLP_PO_ITEM PO ON EP.NR_REFERENCIA = PO.NR_PROCESSO ');
              SQL.Add('    WHERE  EP.NR_PROCESSO = :NR_PROCESSO AND');
              SQL.Add('           PO.CD_EVENTO          = ''092'' AND');
              SQL.Add('           PO.IN_APLICAVEL       = ''1''');
              // Atualizar o followup
              SQL.Add('EXEC SP_ATZ_FOLLOWUP ''' + qry_fat_proc_NR_PROCESSO.AsString + '''');
              if TimeOf(qry_fat_sol_DT_FATURA.AsDateTime) > 0 then
                ParamByName('DT_REALIZACAO').AsDateTime := qry_fat_sol_DT_FATURA.AsDateTime
              else
                ParamByName('DT_REALIZACAO').AsDateTime := qry_fat_sol_DT_FATURA.AsDateTime + Time; // Incluido TIME para o Followup - Michel - 06/04/2010
              ParamByName('CD_USUARIO').AsString      := str_cd_usuario;
              ParamByName('NR_PROCESSO').AsString     := qry_fat_proc_NR_PROCESSO.AsString;
              ExecSQL;
              Free;
            end;

          end;
        end;
//        FastExecSQL(' DELETE FROM TAJUSTE_IMPRESSAO_NF_SERV_INDAIA WHERE CD_UNID_NEG = ''99''');
        datm_main.db_broker.Commit;

        if qry_fat_sol_TP_TIPO_FAT.AsString = 'F' then
        begin
          with TQuery.Create(application) do
          begin
            Databasename := 'DBBROKER';
            for i := 0 to dbgrdSol.SelectedRows.Count - 1 do
            begin
              TTable(dbgrdSol.DataSource.DataSet).GotoBookMark(TBookMark(dbgrdSol.SelectedRows[i]));
              if qry_fat_sol_TP_TIPO_FAT.AsString = 'F' then
              begin
                SQL.Clear;
                SQL.Add('    UPDATE TRETENCAO_IR');
                SQL.Add('    SET    NR_NOTA = :NR_NOTA');
                SQL.Add('    WHERE  CD_UNID_NEG = :CD_UNID_NEG');
                SQL.Add('           AND CD_PRODUTO = :CD_PRODUTO');
                SQL.Add('           AND NR_SOLICITACAO = :NR_SOLICITACAO');
                SQL.Add('    UPDATE TRETENCAO_COFINS');
                SQL.Add('    SET    NR_NOTA = :NR_NOTA');
                SQL.Add('    WHERE  CD_UNID_NEG = :CD_UNID_NEG');
                SQL.Add('           AND CD_PRODUTO = :CD_PRODUTO');
                SQL.Add('           AND NR_SOLICITACAO = :NR_SOLICITACAO');
                ParamByName('CD_UNID_NEG').AsString  := qry_fat_sol_CD_UNID_NEG.AsString;
                ParamByName('CD_PRODUTO').AsString     := qry_fat_sol_CD_PRODUTO.AsString;
                ParamByName('NR_SOLICITACAO').AsString := qry_fat_sol_NR_SOLICITACAO.AsString;
                ParamByName('NR_NOTA').AsString := qry_fat_sol_NR_NF_SERV.AsString;
                ExecSQL;
              end;
            end;
            Free;
          end;
        end;

        //Imprimir Nota Fiscal
//        if ((Trim( msk_cd_unid_neg.Text ) = '01') or (Trim( msk_cd_unid_neg.Text ) = '07')) then
//        begin
          qryNF.Close;
          qryNF.ParamByName('VIA').AsString := 'I';
          qryNF.ParamByName('USUARIO').AsString := str_cd_usuario;
          qryNF.Open;

          //chama o form de impressão!!
          Application.CreateForm(TFrm_impressao, Frm_impressao );
          frm_impressao.cd_unid_neg   := msk_cd_unid_neg.Text;
          frm_impressao.cd_modulo     := '1147';
          frm_impressao.vApenas_email := false;
          frm_impressao.vBeforePrint  :=  pBeforePrint;
          frm_impressao.ShowModal;
          frm_impressao.Release;
//        end
{        else if Trim( msk_cd_unid_neg.Text ) = '02' then
        begin
          with crp_nf_serv do
          begin
            Connect        := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
            ReportName     := cDir_Rpt + '\CRNF003.RPT';
            ParamFields[0] := Trim( str_cd_usuario );
            Execute;
          end;
        end;}

        with datm_nf_serv.qry_atz_dados_ do
        begin
          SQL.Clear;
          SQL.Add( 'UPDATE TNF_SERV_OP SET CD_EMISSOR = "" WHERE CD_EMISSOR = "' + str_cd_usuario + '"' );
          Prepare;
          ExecSQL;
        end;

      end;
//      datm_main.db_broker.Commit;
    except
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      BoxMensagem( 'Erro ao tentar imprimir Nota Fiscal!', 2 );
      Exit;
    end;

    btn_desmarca_todasClick(nil);

    msk_nr_nf_ini.Text := Replicate( '0', 6 - Length( Trim( IntToStr( nr_ult_nf_serv ) ) ) ) +
                                              Trim( IntToStr( nr_ult_nf_serv ) );

    qry_grd_sol_.Close;
    qry_grd_sol_.Prepare;
    qry_grd_sol_.Open;


  end;

  Screen.Cursor := crDefault;
  Application.ProcessMessages;

  msk_nr_nf_ini.Text := UltNrNF;


end;

procedure Tfrm_nf_serv.msk_cd_unid_negChange(Sender: TObject);
begin
  msk_nr_nf_ini.Visible := msk_cd_unid_neg.Text <> '01';
  lbl_nr_nf_ini.Visible := msk_cd_unid_neg.Text <> '01';
end;

procedure Tfrm_nf_serv.ConsistePreviewFatura;
  procedure CancelaFatura;
  begin
    try
      with datm_nf_serv do
      begin
        CloseStoredProc(sp_fat_canc);
        sp_fat_canc.ParamByName('@CD_UNID_NEG').AsString    := msk_cd_unid_neg.Text;
        sp_fat_canc.ParamByName('@CD_PRODUTO').AsString     := msk_cd_produto.Text;
        sp_fat_canc.ParamByName('@NR_SOLICITACAO').AsString := datm_nf_serv.qry_grd_sol_.FieldByName('NR_SOLICITACAO').AsString;
        sp_fat_canc.ParamByName('@CD_USUARIO').AsString     := str_cd_usuario;
        ExecStoredProc(sp_fat_canc);
        CloseStoredProc(sp_fat_canc);
      end;
    except
      on E: Exception do
        TrataErro(E);
    end;
  end;
begin
  if datm_nf_serv.qry_grd_sol_.FieldByName('IN_PREVIEW').AsString = '1' then
  begin
    if datm_nf_serv.qry_grd_sol_.FieldByName('NR_NF_SERV').AsString = '' then //Faz a pergunta somente se o Status for diferente de "Faturada"
      CancelaFatura;
  end
  else
  begin
    if datm_nf_serv.qry_grd_sol_.FieldByName('NR_NF_SERV').AsString = '' then //Faz a pergunta somente se o Status for diferente de "Faturada"
      if Application.MessageBox('Esta fatura foi gerada em modo Preview. Deseja cancelá-la ? ','Atenção',Mb_IconQuestion + MB_YESNO + MB_DEFBUTTON2) = idYes then
        CancelaFatura
  end;
end;


procedure Tfrm_nf_serv.RetemImpostos(nr_processo: string); {Novo Controle de IRRF e PIS/COFINS - André 26/09/2008}
var vCnpjEmpresa : string [8];
    vTpRetencaoIr, vTpRetencaoCofins : string [1];
    DataInicial, DataFinal : TDateTime;
    vCnpjUnidNeg, nr_solicitacao, vIrRetido, vCofinsRetido, DataFatura, DataFaturaVenc, DataIr, DataCofins, vTribTotIr, vTribTotCofins, vTribTotRet, vCdTotal, vl_iss : string;
    valor_tributavel, vValorComissao, vIrAtual, vCofinsAtual, vTotalIrRetido, vTotalCofinsRetido, vVlTotal, vTribTotRetido  : Real;
begin
  vCnpjUnidNeg := ConsultaLookUPSQL('SELECT CGC_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''','CGC_UNID_NEG');
  valor_tributavel := 0;
  vValorComissao := 0;
  vIrAtual := 0;
  vCofinsAtual := 0;
  vTotalIrRetido := 0;
  vTotalCofinsRetido := 0;
  vVlTotal := 0;

  vCnpjEmpresa := ConsultaLookUPSQL('SELECT SUBSTRING(CGC_EMPRESA, 1,8) as CGC_EMPRESA FROM TEMPRESA_NAC ' +
                                     'WHERE CD_EMPRESA = ''' + datm_nf_serv.qry_fat_proc_CD_CLIENTE.AsString + '''','CGC_EMPRESA');
  nr_solicitacao := datm_nf_serv.qry_grd_sol_NR_SOLICITACAO.AsString;

// Verifica se o cliente da fatura vai reter o IRRF e o COFINS por data da fatura ou data de vencimento da fatura

  vTpRetencaoIr := ConsultaLookUPSQL('SELECT ISNULL(IN_TP_RETENCAO_IR,''0'')IN_TP_RETENCAO_IR from TCLIENTE_HABILITACAO ' +
                                      'WHERE CD_CLIENTE = ''' + datm_nf_serv.qry_fat_proc_CD_CLIENTE.AsString + ''' ' +
                                      ' AND CD_UNID_NEG = ''' + datm_nf_serv.qry_fat_proc_CD_UNID_NEG.AsString + ''' ' +
                                      ' AND CD_PRODUTO = ''' + datm_nf_serv.qry_fat_proc_CD_PRODUTO.AsString + ''' ',
                                         'IN_TP_RETENCAO_IR');

  vTpRetencaoCofins := ConsultaLookUPSQL('SELECT ISNULL(IN_TP_RETENCAO_COFINS,''0'')IN_TP_RETENCAO_COFINS from TCLIENTE_HABILITACAO ' +
                                          'WHERE CD_CLIENTE = ''' + datm_nf_serv.qry_fat_proc_CD_CLIENTE.AsString + ''' ' +
                                          ' AND CD_UNID_NEG = ''' + datm_nf_serv.qry_fat_proc_CD_UNID_NEG.AsString + ''' ' +
                                          ' AND CD_PRODUTO = ''' + datm_nf_serv.qry_fat_proc_CD_PRODUTO.AsString + ''' ',
                                           'IN_TP_RETENCAO_COFINS');

  if (vTpRetencaoIr = '0') and (vTpRetencaoCofins = '0') then exit;

//Calcula as datas para retencão do IRRF e COFINS

  DataFatura := ConsultaLookupSQL('SELECT DT_FATURA FROM TS_FATURA WHERE CD_UNID_NEG = ''' + msk_cd_unid_neg.Text +
                                       ''' AND CD_PRODUTO = ''' + msk_cd_produto.Text + '''AND NR_SOLICITACAO = ''' + datm_nf_serv.qry_fat_sol_NR_SOLICITACAO.AsString + '''','DT_FATURA');
  DataFaturaVenc := ConsultaLookupSQL('SELECT DT_VENCTO_FATURA FROM TS_FATURA WHERE CD_UNID_NEG = ''' + msk_cd_unid_neg.Text +
                                       ''' AND CD_PRODUTO = ''' + msk_cd_produto.Text + '''AND NR_SOLICITACAO = ''' + datm_nf_serv.qry_fat_sol_NR_SOLICITACAO.AsString + '''','DT_VENCTO_FATURA');

  Case StrToInt(vTpRetencaoIr) of
    1,3: DataIr := DataFatura;
    2  : DataIr := DataFaturaVenc;
  end;

  Case StrToInt(vTpRetencaoCofins) of
    1,3: DataCofins := DataFatura;
    2  : DataCofins := DataFaturaVenc;
  end;

  Case StrToInt(vTpRetencaoCofins) of
    1,3: begin
      DataInicial := EncodeDate( StrToInt( Copy(DataFatura, 7, 4 ) ), StrToInt( Copy(DataFatura, 4, 2 ) ), 1);
      DataFinal := EncodeDate( StrToInt( Copy( DataFatura, 7, 4 ) ), StrToInt( Copy(DataFatura, 4, 2 ) ),
                                DaysInAMonth(StrToInt(Copy(DataFatura, 7, 4 )), StrToInt(Copy(DataFatura, 4, 2 ))) );
    end;
    2: begin
      DataInicial := EncodeDate( StrToInt( Copy(DataFaturaVenc, 7, 4 ) ), StrToInt( Copy(DataFaturaVenc, 4, 2 ) ), 1);
      DataFinal := EncodeDate( StrToInt( Copy(DataFaturaVenc, 7, 4 ) ), StrToInt( Copy(DataFaturaVenc, 4, 2 ) ),
                             DaysInAMonth(StrToInt(Copy(DataFaturaVenc, 7, 4 )), StrToInt(Copy(DataFaturaVenc, 4, 2 ))) );
    end;
  end;


// ********* Calcula os valores da comissão e tributavel da fatura atual ************
  with datm_nf_serv do
  begin
    // Verifica valor total tributavel - PROCESSO CORRENTE
    qry_tot_tributavel_.Close;
    qry_tot_tributavel_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_tot_tributavel_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    qry_tot_tributavel_.ParamByName('NR_SOLICITACAO').AsString := nr_solicitacao;
    qry_tot_tributavel_.Prepare;
    qry_tot_tributavel_.Open;
    if not qry_tot_tributavel_.EOF then
      valor_tributavel := qry_tot_tributavel_.FieldByName('VL_TRIBUTAVEL').AsFloat;
    qry_tot_tributavel_.Close;

    // Verifica valor comissão - PROCESSO CORRENTE
    qry_comissao_.Close;
    qry_comissao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_comissao_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
    qry_comissao_.ParamByName('NR_SOLICITACAO').AsString := nr_solicitacao;
    qry_comissao_.Prepare;
    qry_comissao_.Open;
    if not qry_comissao_.EOF then
      vValorComissao := qry_comissao_.FieldByName('VL_COMISSAO').AsFloat;
    qry_comissao_.Close;
  end;

  // Valor tributável
  valor_tributavel := valor_tributavel + vValorComissao;

{  if (msk_cd_unid_neg.Text = '02') and
    (ConsultaLookUpSQL('SELECT IN_COBRAR_ISS from TCLIENTE_HABILITACAO ' +
                         ' WHERE CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' AND CD_PRODUTO = ''' + msk_cd_produto.Text + ''' ' +
                         ' AND CD_CLIENTE = ''' + datm_nf_serv.qry_fat_proc_CD_CLIENTE.AsString + ''' ', 'IN_COBRAR_ISS') = '1') then
  begin
    vl_iss := ConsultaLookUpSQL('SELECT VL_ITEM FROM TFATURAMENTO_CC' +
                         ' WHERE CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' AND CD_PRODUTO = ''' + msk_cd_produto.Text + ''' ' +
                         ' AND CD_ITEM = ''394'' AND IN_CANCELADO = ''0'' AND NR_SOLIC_FAT = ''' + nr_solicitacao + ''' ', 'VL_ITEM');
    if vl_iss = '' then vl_iss := '0';
    valor_tributavel := valor_tributavel + Arredondar(StrToFloat(vl_iss), 2);
  end;}

  if valor_tributavel = 0 then exit;

  //pega os valores do IR e do Cofins atual
  vIrAtual := Arredondar((valor_tributavel * 0.015), 2);
  vCofinsAtual := Arredondar((valor_tributavel * 0.0465), 2);

  if vTpRetencaoIr <> '3' then
  begin
  // IR
    // Verifica se o cliente já reteve IR no dia se 0 nenhum processo reteve IR
    vIrRetido := ConsultaLookupSQL('SELECT COUNT(*) COUNT FROM TRETENCAO_IR' +
                                   ' WHERE CGC_UNID_NEG = ''' + vCnpjUnidNeg + ''' ' +
                                   '  AND DT_FATURA = CONVERT (DATETIME, CONVERT (VARCHAR, ''' + DataIr + ''', 103), 103)' +
                                   '  AND CGC_EMPRESA = ''' + vCnpjEmpresa + ''' ' +
                                   '  AND IN_IR_RETIDO = ''1'' ', 'COUNT');

    // Verifica o valor Total da Retenção de IR no dia
    vTribTotIr := ConsultaLookUPSQL('SELECT SUM(VL_IR) VL_IR FROM TRETENCAO_IR' +
                                    ' WHERE CGC_UNID_NEG = ''' + vCnpjUnidNeg + ''' ' +
                                    '  AND DT_FATURA = CONVERT (DATETIME, CONVERT (VARCHAR, ''' + DataIr + ''', 103), 103)' +
                                    '  AND CGC_EMPRESA = ''' + vCnpjEmpresa + ''' ', 'VL_IR');

    if vTribTotIr = '' then vTribTotIr := '0';
    vTotalIrRetido := Arredondar(StrToFloat(vTribTotIr), 2) + vIrAtual;
  end;

  if vTpRetencaoCofins <> '3' then
  begin
    // Cofins
    // Verifica se o cliente já reteve Cofins no mês se 0 nenhum processo reteve Cofins
    vCofinsRetido := ConsultaLookupSQL('SELECT COUNT(*) COUNT FROM TRETENCAO_COFINS' +
                                   ' WHERE CGC_UNID_NEG = ''' + vCnpjUnidNeg + ''' ' +
                                   '  AND DT_FATURA BETWEEN CONVERT (DATETIME, CONVERT (VARCHAR, ''' + DateTimeToStr(DataInicial) + ''', 103), 103) AND CONVERT (DATETIME, CONVERT (VARCHAR, ''' + DateTimeToStr(DataFinal) + ''', 103), 103)' +
                                   '  AND CGC_EMPRESA = ''' + vCnpjEmpresa + ''' ' +
                                   '  AND IN_COFINS_RETIDO = ''1'' ', 'COUNT');

    // Verifica o valor Total da Retenção de Cofins no Mês
    vTribTotRet := ConsultaLookUPSQL('SELECT SUM(VL_TRIBUTAVEL) VL_COFINS FROM TRETENCAO_COFINS' +
                                   ' WHERE CGC_UNID_NEG = ''' + vCnpjUnidNeg + ''' ' +
                                    '  AND DT_FATURA BETWEEN CONVERT (DATETIME, CONVERT (VARCHAR, ''' + DateTimeToStr(DataInicial) + ''', 103), 103) AND CONVERT (DATETIME, CONVERT (VARCHAR, ''' + DateTimeToStr(DataFinal) + ''', 103), 103)' +
                                    '  AND CGC_EMPRESA = ''' + vCnpjEmpresa + ''' ', 'VL_COFINS');


    vTribTotCofins := ConsultaLookUPSQL('SELECT SUM(VL_COFINS) VL_COFINS FROM TRETENCAO_COFINS' +
                                   ' WHERE CGC_UNID_NEG = ''' + vCnpjUnidNeg + ''' ' +
                                    '  AND DT_FATURA BETWEEN CONVERT (DATETIME, CONVERT (VARCHAR, ''' + DateTimeToStr(DataInicial) + ''', 103), 103) AND CONVERT (DATETIME, CONVERT (VARCHAR, ''' + DateTimeToStr(DataFinal) + ''', 103), 103)' +
                                    '  AND CGC_EMPRESA = ''' + vCnpjEmpresa + ''' ', 'VL_COFINS');
    if vTribTotCofins = '' then vTribTotCofins := '0';
    if vTribTotRet    = '' then vTribTotRet    := '0';
    vTribTotRetido :=   Arredondar(StrToFloat(vTribTotRet), 2) + valor_tributavel;
    vTotalCofinsRetido := Arredondar(StrToFloat(vTribTotCofins), 2) + vCofinsAtual;
  end;
// ********** Insere os valores de IR e Cofins nas tabelas de Retenção e Atualiza os valores da Tfaturamento
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
  // IR item 994
    if vTpRetencaoIr <> '0' then
    begin
      SQL.Add(' INSERT INTO TRETENCAO_IR ');
      SQL.Add('   ( CD_UNID_NEG, CD_PRODUTO, NR_NOTA, NR_PROCESSO,');
      SQL.Add('     DT_FATURA, CGC_EMPRESA, VL_TRIBUTAVEL, NR_SOLICITACAO,');
      SQL.Add('     VL_IR, IN_IR_RETIDO, IN_IR_RETIDO_ATUAL, VL_IR_RETIDO, CGC_UNID_NEG)');
      SQL.Add(' VALUES ( :cdUnidNeg, :cdProd, :nrNota, :nrProcesso, ');
      SQL.Add(' CONVERT (DATETIME, CONVERT (VARCHAR, ''' + DataIr + ''', 103), 103), :CnpjEmpresa, :valor_tributavel, :nrSolicitacao,');

      if vTpRetencaoIr <> '3' then
      begin
        if (vIrRetido = '0' ) and (vTotalIrRetido < 10 )  then   // não reter ir
          SQL.Add(' :vlIr, 0, 0, 0')
        else
        begin
          if (vIrRetido = '0' ) and (vTotalIrRetido >= 10 ) then  // Totalizador
            SQL.Add(' :vlIr, 1, 1, :vTotalIrRetido')
          else // cliente ja reteve Ir no dia
            SQL.Add(' :vlIr, 1, 0, :vlIr');
        end;
      end
      else
        SQL.Add(' :vlIr, 1, 0, :vlIr'); // Reter Sempre o IR

      SQL.Add(', '''+vCnpjUnidNeg+''')');
      ParamByName('cdUnidNeg').AsString := msk_cd_unid_neg.Text;
      ParamByName('cdProd').AsString := msk_cd_produto.Text;
      ParamByName('nrNota').AsString := '0';
      ParamByName('nrSolicitacao').AsString := nr_solicitacao;
      ParamByName('nrProcesso').AsString := nr_processo;
      ParamByName('CnpjEmpresa').AsString := vCnpjEmpresa;
      ParamByName('valor_tributavel').AsFloat := valor_tributavel;
      ParamByName('vlIr').AsFloat := vIrAtual;

      if vTpRetencaoIr <> '3' then
        if (vIrRetido = '0' ) and (vTotalIrRetido >= 10 ) then  // Totalizador
        begin
          ParamByName('vTotalIrRetido').AsFloat := vTotalIrRetido;
          vIrAtual := vTotalIrRetido;
        end;
      ExecSQL;

      if (((vIrRetido = '0' ) and (vTotalIrRetido >= 10 )) or (vIrRetido > '0' )) or (vTpRetencaoIr = '3') then
      begin
        SQL.Clear;
        SQL.Add(' UPDATE TFATURAMENTO_CC SET VL_ITEM = :vlIr');
        SQL.Add('   WHERE CD_ITEM = ''994'' AND NR_PROCESSO = :NR_PROCESSO AND NR_SOLIC_FAT = :NR_SOLIC_FAT');
        ParamByName('vlIr').AsFloat := vIrAtual;
        ParamByName('NR_PROCESSO').AsString := nr_processo;
        ParamByName('NR_SOLIC_FAT').AsString := nr_solicitacao;
        ExecSQL;
      end;
    end;

    if vTpRetencaoCofins <> '0' then
    begin
    // Pis/Cofins item 578
      SQL.Clear;
      SQL.Add(' INSERT INTO TRETENCAO_COFINS ');
      SQL.Add('   ( CD_UNID_NEG, CD_PRODUTO, NR_NOTA, NR_PROCESSO,');
      SQL.Add('     DT_FATURA, CGC_EMPRESA, VL_TRIBUTAVEL, NR_SOLICITACAO,');
      SQL.Add('     VL_COFINS, IN_COFINS_RETIDO, IN_COFINS_RETIDO_ATUAL, VL_COFINS_RETIDO, CGC_UNID_NEG)');
      SQL.Add(' VALUES ( :cdUnidNeg, :cdProd, :nrNota, :nrProcesso,');
      SQL.Add(' CONVERT (DATETIME, CONVERT (VARCHAR, ''' + DataCofins + ''', 103), 103), :CnpjEmpresa, :valor_tributavel, :nrSolicitacao, ');

      if vTpRetencaoCofins <> '3' then
        if (vCofinsRetido = '0' ) and (vTribTotRetido < 5000 )  then   // não reter cofins
          SQL.Add(' :vlCofins, 0, 0, 0')
        else
        begin
          if (vCofinsRetido = '0' ) and (vTribTotRetido >= 5000 ) then  // Totalizador
            SQL.Add(' :vlCofins, 1, 1, :vTotalCofinsRetido')
          else // cliente ja reteve Ir no dia
            SQL.Add(' :vlCofins, 1, 0, :vlCofins');
        end
      else
        SQL.Add(' :vlCofins, 1, 0, :vlCofins');

      SQL.Add(', '''+vCnpjUnidNeg+''')');
      ParamByName('cdUnidNeg').AsString := msk_cd_unid_neg.Text;
      ParamByName('cdProd').AsString := msk_cd_produto.Text;
      ParamByName('nrNota').AsString := '0';
      ParamByName('nrSolicitacao').AsString := nr_solicitacao;
      ParamByName('nrProcesso').AsString := nr_processo;
      ParamByName('CnpjEmpresa').AsString := vCnpjEmpresa;
      ParamByName('valor_tributavel').AsFloat := valor_tributavel;
      ParamByName('vlCofins').AsFloat := vCofinsAtual;

      if vTpRetencaoCofins <> '3' then
        if (vCofinsRetido = '0' ) and (vTribTotRetido >= 5000 ) then
        begin
          ParamByName('vTotalCofinsRetido').AsFloat := vTotalCofinsRetido;
          vCofinsAtual := vTotalCofinsRetido;
        end;
      ExecSQL;

      if (((vCofinsRetido = '0' ) and (vTribTotRetido >= 5000 )) or (vCofinsRetido > '0' )) or (vTpRetencaoCofins = '3') then
      begin
        SQL.Clear;
        SQL.Add(' UPDATE TFATURAMENTO_CC SET VL_ITEM = :vlCofins');
        SQL.Add('   WHERE CD_ITEM = ''578'' AND NR_PROCESSO = :NR_PROCESSO AND NR_SOLIC_FAT = :NR_SOLIC_FAT ');
        ParamByName('vlCofins').AsFloat := vCofinsAtual;
        ParamByName('NR_PROCESSO').AsString := nr_processo;
        ParamByName('NR_SOLIC_FAT').AsString := nr_solicitacao;
        ExecSQL;
      end;
    end;

    // Atualiza o valor do Item totalizador (995 e 996) na Tfaturamento_cc de acordo com os valores do IR e Cofins
    vCdTotal := ConsultaLookUPSQL('SELECT CD_ITEM FROM TFATURAMENTO_CC WHERE CD_ITEM IN (''995'', ''996'') AND NR_PROCESSO = ''' + NR_PROCESSO + ''' AND NR_SOLIC_FAT = ''' + nr_solicitacao + ''' ', 'CD_ITEM');
    vVlTotal  := StrToFloat(ConsultaLookUPSQL( 'SELECT VL_ITEM FROM TFATURAMENTO_CC WHERE CD_ITEM = ''' + vCdTotal + ''' AND NR_PROCESSO = ''' + NR_PROCESSO + ''' AND NR_SOLIC_FAT = ''' + nr_solicitacao + ''' ', 'VL_ITEM'));

    if vCdTotal = '995' then // Saldo Credor soma os itens de imposto
    begin
      if vTpRetencaoIr <> '0' then
      begin
        if (((vIrRetido = '0' ) and (vTotalIrRetido >= 10 )) or (vIrRetido > '0' )) or (vTpRetencaoIr = '3') then
          vVlTotal  := vVlTotal + vIrAtual;
      end;
      if vTpRetencaoCofins <> '0' then
      begin
        if (((vCofinsRetido = '0' ) and (vTribTotRetido >= 5000 )) or (vCofinsRetido > '0' )) or (vTpRetencaoCofins = '3') then
          vVlTotal  := vVlTotal + vCofinsAtual;
      end;
    end
    else // Saldo Devedor item 996 subtrai os itens de imposto
    begin
      if vTpRetencaoIr <> '0' then
      begin
        if (((vIrRetido = '0' ) and (vTotalIrRetido >= 10 )) or (vIrRetido > '0' )) or (vTpRetencaoIr = '3') then
          vVlTotal  := vVlTotal - vIrAtual;
      end;
      if vTpRetencaoCofins <> '0' then
      begin
        if (((vCofinsRetido = '0' ) and (vTribTotRetido >= 5000 )) or (vCofinsRetido > '0' )) or (vTpRetencaoCofins = '3') then
          vVlTotal  := vVlTotal - vCofinsAtual;
      end;
    end;

    SQL.Clear;
    SQL.Add(' UPDATE TFATURAMENTO_CC SET VL_ITEM = ROUND(:vlTotal, 2)');
    SQL.Add('   WHERE CD_ITEM = :cdItem AND NR_PROCESSO = :NR_PROCESSO AND NR_SOLIC_FAT = :NR_SOLIC_FAT  ');
    ParamByName('cdItem').AsString := vCdTotal;
    ParamByName('vlTotal').AsFloat := vVlTotal;
//    ParamByName('vlTotal').AsFloat := FormatFloat(arredondar '#0,.00', FloavVlTotal);
    ParamByName('NR_PROCESSO').AsString := nr_processo;
    ParamByName('NR_SOLIC_FAT').AsString := nr_solicitacao;
    ExecSQL;


// Atualiza a ts_fatura e ts_fatura_processo
    SQL.Clear;
    SQL.Add(' UPDATE TS_FATURA SET VL_FATURA = ROUND(:vlTotal, 2)');
    SQL.Add('   WHERE CD_UNID_NEG = :cdUnidNeg AND CD_PRODUTO = :cdProd AND NR_SOLICITACAO = :NR_SOLIC_FAT  ');
    SQL.Add(' UPDATE TS_FATURA_PROCESSO SET VL_FATURA = ROUND(:vlTotal, 2)');
    SQL.Add('   WHERE CD_UNID_NEG = :cdUnidNeg AND CD_PRODUTO = :cdProd AND NR_SOLICITACAO = :NR_SOLIC_FAT  ');
    ParamByName('vlTotal').AsFloat :=  iif(vCdTotal = '995', vVlTotal, - vVlTotal);
    ParamByName('cdUnidNeg').AsString := msk_cd_unid_neg.Text;
    ParamByName('cdProd').AsString := msk_cd_produto.Text;
    ParamByName('NR_SOLIC_FAT').AsString := nr_solicitacao;
    ExecSQL;

    Free;
  end; // fim do with TQuery.Create

end;

procedure Tfrm_nf_serv.SpeedButton1Click(Sender: TObject);
var i:integer;
  vPasta : String;
begin
  {  IMPORTANTE:
     Alteração André: 27/02/2010 - Para geração dos rtmms para a SG, alterado o where da query principal do relatorio retirado a parte:
     WHERE ISNULL(NF.CD_EMISSOR, '') = :USUARIO
     AND V.TP_VIA = :VIA
    qryNF.Close;
    qryNF.ParamByName('VIA').AsString := 'P';
    qryNF.ParamByName('USUARIO').AsString := str_cd_usuario;
    qryNF.Open;}
  with datm_nf_serv do
  begin
    try
      if edtAnoNotaSG.Text = '' then
      begin
        Showmessage('Informe um ano para impressão!');
      end;
      if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'TEMP\') then
        CreateDir(ExtractFilePath(Application.ExeName) + 'TEMP\');
      if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'NotasSG\') then
        CreateDir(ExtractFilePath(Application.ExeName) + 'NotasSG\ultimas\');

      vPasta := ExtractFilePath(Application.ExeName) + 'NotasSG\ultimas\';

      datm_main.db_broker.StartTransaction;
      qryNotasSG.Close;
      qryNotasSG.ParamByName('DATA').AsInteger := StrToInt(edtAnoNotaSG.Text);
      qryNotasSG.Open;

      while not qryNotasSG.Eof do
      begin
        with datm_nf_serv do
        begin
          {FastExecSQL(' UPDATE TNF_SERV_OP SET CD_EMISSOR = '''+str_cd_usuario+''' WHERE NR_SOLICITACAO = '''+qryNotasSGNR_SOLICITACAO.AsString+''''+
                                                                            ' AND CD_UNID_NEG = '''+qryNotasSGCD_UNID_NEG.AsString+''''+
                                                                            ' AND CD_UNID_NEG = '''+qryNotasSGCD_PRODUTO.AsString+'''');}
          {CloseStoredProc( sp_nf_serv_op );
          with sp_nf_serv_op do
          begin
            ParamByName('@cd_unid_neg').AsString    := msk_cd_unid_neg.Text;
            ParamByName('@cd_produto').AsString     := msk_cd_produto.Text;
            ParamByName('@nr_solicitacao').AsString := qryNotasSGNR_SOLICITACAO.AsString;
          end;
          ExecStoredProc( sp_nf_serv_op );
          CloseStoredProc( sp_nf_serv_op );}

{          qryNF.Close;
          qryNF.ParamByName('CD_UNID_NEG').AsString    := qryNotasSGCD_UNID_NEG.AsString;
          qryNF.ParamByName('CD_PRODUTO').AsString     := qryNotasSGCD_PRODUTO.AsString;
          qryNF.ParamByName('NR_SOLICITACAO').AsString := qryNotasSGNR_SOLICITACAO.AsString;
          qryNF.Open;}

        qryNF.Close;
        qryNF.ParamByName('VIA').AsString := 'P';
        qryNF.ParamByName('USUARIO').AsString := str_cd_usuario;
        qryNF.Open;

{        Application.CreateForm(TFrm_impressao, Frm_impressao );
         //chama o form de impressão!!
          frm_impressao.cd_unid_neg   := msk_cd_unid_neg.Text;
          frm_impressao.cd_modulo     := '1147';
          frm_impressao.vApenas_email := false;
          frm_impressao.vBeforePrint  :=  pBeforePrint;
          frm_impressao.ShowModal;
          frm_impressao.Release;}

          if FileExists(vPasta + qryNotasSGNR_SOLICITACAO.AsString + '.PDF') then
            DeleteFile(vPasta + qryNotasSGNR_SOLICITACAO.AsString + '.PDF');

          ppReport1.Reset;
          ppReport1.Template.FileName := cDir_Rpt + '\relNF.rtm';
          ppReport1.Template.LoadFromFile;
          ppReport1.AllowPrintToArchive :=False;
          ppReport1.AllowPrintToFile :=True;
          ppReport1.ShowPrintDialog := False;
          ppReport1.DeviceType := 'PDFFile' ; //PDF;
          lblStatus.Caption := 'Imprimindo em: ' + vPasta + qryNFNR_NF_SERV.AsString + '.PDF';
          ppReport1.SaveAsTemplate := true;
          ppReport1.TextFileName := vPasta + qryNFNR_NF_SERV.AsString + '.PDF';
          ppReport1.Print;
          lblStatus.Caption := 'Gerado em: ' + vPasta +qryNFNR_NF_SERV.AsString + '.PDF';
          Application.ProcessMessages;
          sleep(3);
        end;
        qryNotasSG.Next;
      end;
      datm_main.db_broker.Commit;
      ShowMessage('Arquivos gerados com sucesso!');
      lblStatus.Caption := '';
    except
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      BoxMensagem( 'Erro ao tentar imprimir Nota Fiscal!', 2 );
      Exit;
    end;
  end;
  end;
procedure Tfrm_nf_serv.pBeforePrint3(Sender: TObject);
begin
  if (Trim( msk_cd_unid_neg.Text ) = '02') then
  begin
    TppImage(Frm_impressao.FindComponent('ppImage2')).Visible := False;
    TppImage(Frm_impressao.FindComponent('ppImage4')).Visible := False;
    TppImage(Frm_impressao.FindComponent('ppImage5')).Visible := False;
    Exit;
  end;
end;

end.

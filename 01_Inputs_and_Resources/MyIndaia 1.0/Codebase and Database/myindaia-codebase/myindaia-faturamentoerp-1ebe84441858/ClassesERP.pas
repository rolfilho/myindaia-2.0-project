unit ClassesERP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxCheckBox, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, Clipbrd, StrUtils,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  InterfacesERP, DadosFaturamentoERP, cxCurrencyEdit, dxGDIPlusClasses,
  cxCalendar, cxButtonEdit, ActnList, cxMemo, DBCtrls, cxDBLookupComboBox,math,
  cxDropDownEdit,ADODB,ShellAPI, ImgList, dxNavBar, jpeg, DdeMan, Grids, DBGrids, DateUtils,
  cxNavigator, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;


type
  TBeforePaste = procedure(Sender: TObject; AText: String; var ADone: Boolean) of object;

  TcxMaskEdit = class(cxMaskEdit.TcxMaskEdit)
  private
    FBeforePaste: TBeforePaste;
  public
    procedure PasteFromClipboard; override;
    property BeforePaste: TBeforePaste read FBeforePaste write FBeforePaste;
  end;

type
  TfrmFaturamentoERP = class(TForm)
    pnlProcesso: TPanel;
    pnlFaturas: TPanel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    cxgdbtvTipoFatura: TcxGridDBTableView;
    cxglTipoFatura: TcxGridLevel;
    cxgFaturas: TcxGrid;
    Panel2: TPanel;
    cxgPendentes: TcxGrid;
    cxgdbtvPendentes: TcxGridDBTableView;
    cxglTipoPendente: TcxGridLevel;
    Panel3: TPanel;
    cxgdbtvPendentesTipo: TcxGridDBColumn;
    cxgdbtvPendentescustomClearance_id: TcxGridDBColumn;
    cxgdbtvPendentesid: TcxGridDBColumn;
    cxgdbtvPendentescreated: TcxGridDBColumn;
    cxgdbtvPendentesreceivedDate: TcxGridDBColumn;
    cxgdbtvPendentesseniorKey: TcxGridDBColumn;
    cxgdbtvPendentesValor: TcxGridDBColumn;
    cxgdbtvPendentesstatus: TcxGridDBColumn;
    cxgdbtvPendentesuser_id: TcxGridDBColumn;
    cxgdbtvPendentescustomID: TcxGridDBColumn;
    cxglPendentes: TcxGridLevel;
    cxgdbtvTipoPendente: TcxGridDBTableView;
    cxgdbtvTipoPendenteTipo: TcxGridDBColumn;
    imgGerarNotaFiscal: TImage;
    cxgdbtvPendentesparentID: TcxGridDBColumn;
    cxgdbtvPendentesitem_id: TcxGridDBColumn;
    cxgdbtvPendentesitem_name: TcxGridDBColumn;
    cxglFaturas: TcxGridLevel;
    cxgdbtvFaturas: TcxGridDBTableView;
    cxgdbtvTipoFaturaCodTipo: TcxGridDBColumn;
    cxgdbtvTipoFaturaNomeTipo: TcxGridDBColumn;
    cxgdbtvFaturasid: TcxGridDBColumn;
    cxgdbtvFaturasakey: TcxGridDBColumn;
    cxgdbtvFaturascofins: TcxGridDBColumn;
    cxgdbtvFaturascreated: TcxGridDBColumn;
    cxgdbtvFaturasdueDate: TcxGridDBColumn;
    cxgdbtvFaturasinvoiceReceiverType: TcxGridDBColumn;
    cxgdbtvFaturasir: TcxGridDBColumn;
    cxgdbtvFaturasobs: TcxGridDBColumn;
    cxgdbtvFaturasseniorDateNFE: TcxGridDBColumn;
    cxgdbtvFaturasseniorKey: TcxGridDBColumn;
    cxgdbtvFaturasstatus: TcxGridDBColumn;
    cxgdbtvFaturastotal: TcxGridDBColumn;
    cxgdbtvFaturastype: TcxGridDBColumn;
    cxgdbtvFaturasvalorTibutavel: TcxGridDBColumn;
    cxgdbtvFaturasbranch_id: TcxGridDBColumn;
    cxgdbtvFaturascustomClearance_id: TcxGridDBColumn;
    cxgdbtvFaturasuser_id: TcxGridDBColumn;
    cxgdbtvFaturascustomID: TcxGridDBColumn;
    cxgdbtvFaturascustomer_id: TcxGridDBColumn;
    cxgdbtvFaturasCD_CLIENTE: TcxGridDBColumn;
    cxglFaturasItens: TcxGridLevel;
    cxgdbtvFaturasItens: TcxGridDBTableView;
    cxgdbtvFaturasItensTipo: TcxGridDBColumn;
    cxgdbtvFaturasItenstype: TcxGridDBColumn;
    cxgdbtvFaturasItensid: TcxGridDBColumn;
    cxgdbtvFaturasItensprice: TcxGridDBColumn;
    cxgdbtvFaturasItensitem_id: TcxGridDBColumn;
    cxgdbtvFaturasItensitem_name: TcxGridDBColumn;
    cxgdbtvFaturasItensitem_aKey: TcxGridDBColumn;
    cxgdbtvFaturasItensitem_active: TcxGridDBColumn;
    cxgdbtvFaturasItensParentID: TcxGridDBColumn;
    cxgdbtvFaturasItensBilling_id: TcxGridDBColumn;
    cxgdbtvFaturasItensTipoNota: TcxGridDBColumn;
    cxgdbtvFaturasItenscreated: TcxGridDBColumn;
    cxgdbtvFaturasItensreceivedDate: TcxGridDBColumn;
    cxgdbtvFaturasItensTotal: TcxGridDBColumn;
    cxgdbtvFaturasItensseniorKey: TcxGridDBColumn;
    cxgdbtvFaturasItensstatus: TcxGridDBColumn;
    cxgdbtvFaturasItenscustomClearance_id: TcxGridDBColumn;
    cxgdbtvFaturasItenscustomer_id: TcxGridDBColumn;
    cxgdbtvFaturasItensdestino: TcxGridDBColumn;
    cxgdbtvFaturasOpcoes: TcxGridDBColumn;
    cxgdbtvFaturasItenscustomID: TcxGridDBColumn;
    dbEmpresa: TDBText;
    Label4: TLabel;
    dbCNPJEmpresa: TDBText;
    Label5: TLabel;
    Label6: TLabel;
    dbApEmpresa: TDBText;
    pnlObservacoes: TPanel;
    obs: TMemo;
    Image1: TImage;
    cxgdbtvFaturasiss: TcxGridDBColumn;
    cxgdbtvFaturasItensReembolso: TcxGridDBColumn;
    cxgdbtvFaturasSituacao: TcxGridDBColumn;
    cxgdbtvFaturasname: TcxGridDBColumn;
    cxgdbtvFaturasNumdfs: TcxGridDBColumn;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxmeUnidade: TcxMaskEdit;
    cxmeProduto: TcxMaskEdit;
    cxteUnidade: TcxTextEdit;
    cxteProduto: TcxTextEdit;
    cxmeProcesso: TcxMaskEdit;
    btnPesquisar: TBitBtn;
    Label7: TLabel;
    lblProcesso: TLabel;
    Label8: TLabel;
    mmLog: TMemo;
    procedure cxmeUnidadePropertiesChange(Sender: TObject);
    procedure cxmeProdutoPropertiesChange(Sender: TObject);
    procedure cxmeProcessoPropertiesChange(Sender: TObject);
    procedure cxmeProcessoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxmeProcessoKeyPress(Sender: TObject; var Key: Char);
    procedure cxmeUnidadeExit(Sender: TObject);
    procedure cxmeProdutoExit(Sender: TObject);
    procedure cxmeProcessoExit(Sender: TObject);
    procedure imgGerarNotaFiscalClick(Sender: TObject);
    procedure cxgdbtvFaturasOpcoesPropertiesButtonClick(Sender: TObject;AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure cxgdbtvFaturasobsPropertiesPopup(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxmeProcessoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure mmLogChange(Sender: TObject);
    procedure cxgdbtvTipoPendenteStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure cxgdbtvTipoFaturaStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
  private
    FUsuario: String;
    FLogin: String;
    FSenha: String;
    protected
    FCD_USUARIO: Integer;
    FCD_CARGO: Integer;
    FNM_CARGO: String;
    FNM_USUARIO: String;
    FNM_LOGIN: String;
    FNM_SENHA: String;
    FNM_EMAIL: String;
    FCD_SISTEMA: Integer;
    procedure MaskBeforePaste(Sender: TObject; AText: String; var ADone: Boolean);
    procedure ExpandirGrids;
  public
    property CD_USUARIO: Integer read FCD_USUARIO;
    property CD_CARGO  : Integer read FCD_CARGO;
    property NM_CARGO  : String  read FNM_CARGO;
    property NM_USUARIO: String  read FNM_USUARIO;
    property NM_LOGIN  : String read FNM_LOGIN;
    property NM_SENHA  : String read FNM_SENHA;
    property NM_EMAIL  : String  read FNM_EMAIL;
    property CD_SISTEMA: Integer read FCD_SISTEMA;
    constructor Create(AOwner: TComponent); override;
    // Interface Methods
    procedure Show(Login, Senha: String); overload;
    procedure Show(Login, Senha, Unidade, Produto, Processo: String); overload;
    function ShowModal(Login, Senha: String): Cardinal; reintroduce; overload;
    function ShowModal(Login, Senha, Unidade, Produto, Processo: String): Cardinal; reintroduce; overload;
    function GetUnidade: String;
    procedure SetUnidade(Unidade: String);
    function GetProduto: String;
    procedure SetProduto(Produto: String);
    function GetProcesso: String;
    procedure SetProcesso(Processo: String);
    function GetUsuario: String;
    function GetLogin: String;
    procedure GeraIntegracaoDespesaTXT(Processo,Grupo : string);
    property Unidade: String read GetUnidade write SetUnidade;
    property Produto: String read GetProduto write SetProduto;
    property Processo: String read GetProcesso write SetProcesso;
    property Usuario: String read GetUsuario;
    property Login: String read GetLogin;
    function GeraReembolso(Billing_id : string):string;
    function SaldoProcesso(Billing_id : integer):string;
    procedure BuscarProcesso;
    procedure LimpaLog(Path, TipoArquivo: String);
    procedure AlterarProduto(key : Char);

  end;

  function StartupSystem: Boolean; stdcall;
  function GetLoginName: PWideChar;    stdcall;
  function GetPassword: PWideChar;     stdcall;
  function GetUserCode: PWideChar;     stdcall;
  function GetUserName: PWideChar;     stdcall;
  function GetUserEmail: PWideChar;    stdcall;
  function GetCargoCode: PWideChar;    stdcall;
  function GetCargoName: PWideChar;    stdcall;

var
  frmFaturamentoERP: TfrmFaturamentoERP;
  FCD_USUARIO: Integer;
  FCD_CARGO: Integer;
    FNM_CARGO: String;
    FNM_USUARIO: String;
    FNM_LOGIN: String;
    FNM_SENHA: String;
    FNM_EMAIL: String;
    FCD_SISTEMA: Integer;

  const
  PastaDoctosIntegracao = 'C:\DDBROKER\FaturamentoERP\Documentos\Integracao\';

implementation

{$R *.dfm}

uses
  GeraNotaFiscal, DadosEnvioERP, Funcoes, Global, DebugDataset,ImpressaoDocumentos,Integracao,DocumentosFaturamento, DDENFSEIntf;

  function StartupSystem: Boolean; external 'C:\ddbroker\MyLoginInt.dll';
  function GetLoginName: PWideChar;    external 'C:\ddbroker\MyLoginInt.dll';
  function GetPassword: PWideChar;     external 'C:\ddbroker\MyLoginInt.dll';
  function GetUserCode: PWideChar;     external 'C:\ddbroker\MyLoginInt.dll';
  function GetUserName: PWideChar;     external 'C:\ddbroker\MyLoginInt.dll';
  function GetUserEmail: PWideChar;    external 'C:\ddbroker\MyLoginInt.dll';
  function GetCargoCode: PWideChar;    external 'C:\ddbroker\MyLoginInt.dll';
  function GetCargoName: PWideChar;    external 'C:\ddbroker\MyLoginInt.dll';
{ TcxMaskEdit }


procedure TcxMaskEdit.PasteFromClipboard;
var
  Done: Boolean;
begin
  Done := False;
  if Assigned(FBeforePaste) then
    FBeforePaste(Self, ClipBoard.AsText, Done);
  if not Done then
    inherited;
end;

{ TfrmFaturamentoERP }

procedure TfrmFaturamentoERP.cxmeUnidadePropertiesChange(Sender: TObject);
begin
  if Length(Trim(cxmeUnidade.Text)) = 2 then
    cxteUnidade.Text := dtmFaturamentoERP.ConsultaSQL('SELECT RTRIM(AP_UNID_NEG) AS AP_UNID_NEG ' +
                                                      'FROM BROKER.DBO.TUNID_NEG (NOLOCK) ' +
                                                      'WHERE CD_UNID_NEG = :CD_UNID_NEG', [cxmeUnidade.Text], '')
  else
    cxteUnidade.Text := '';
  if cxteUnidade.Text <> '' then
    cxmeUnidade.Style.Color := clWindow;
  cxmeProcessoPropertiesChange(cxmeProcesso);
end;

procedure TfrmFaturamentoERP.cxmeProdutoPropertiesChange(Sender: TObject);
begin
  if Length(Trim(cxmeProduto.Text)) = 2 then
    cxteProduto.Text := dtmFaturamentoERP.ConsultaSQL('SELECT RTRIM(NM_PRODUTO) AS NM_PRODUTO ' +
                                                      'FROM BROKER.DBO.TPRODUTO (NOLOCK) ' +
                                                      'WHERE CD_PRODUTO = :CD_PRODUTO', [cxmeProduto.Text], '')
  else
    cxteProduto.Text := '';
  if cxteProduto.Text <> '' then
    cxmeProduto.Style.Color := clWindow;
  cxmeProcessoPropertiesChange(cxmeProcesso);
end;

procedure TfrmFaturamentoERP.cxmeProcessoPropertiesChange(Sender: TObject);
begin
  {with dtmFaturamentoERP do
  begin
    if (cxteUnidade.Text <> '') and (cxteProduto.Text <> '') and (Length(StringReplace(cxmeProcesso.Text, ' ', '', [rfReplaceAll])) >= 10) then
    begin
      try
        if qryCustomClearance.Active then
          qryCustomClearance.Close;
        qryCustomClearance.Parameters.ParamValues['customID'] := cxmeUnidade.Text + cxmeProduto.Text + StringReplace(cxmeProcesso.Text, ' ', '', [rfReplaceAll]);
        qryCustomClearance.Open;
      except
        if qryCustomClearance.Active then
          qryCustomClearance.Close;
      end;
    end
    else if qryCustomClearance.Active then
      qryCustomClearance.Close;
    if qryCustomClearance.Active and (Trim(qryCustomClearancecustomID.AsString) <> '') then
      cxmeUnidade.Style.Color := clWindow;
    ExpandirGrids;
  end;      }
end;

procedure TfrmFaturamentoERP.cxmeProcessoPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  Error := False;
end;

procedure TfrmFaturamentoERP.cxmeProcessoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    BuscarProcesso;
  end;
end;

procedure TfrmFaturamentoERP.cxmeProcessoKeyPress(Sender: TObject; var Key: Char);
begin
  AlterarProduto(key);
  if     (Key = '-')
     and (cxmeProcesso.SelStart > 3)
     and (PosEx('-', cxmeProcesso.Text, cxmeProcesso.SelStart +1) > cxmeProcesso.SelStart) then
    cxmeProcesso.SelStart := PosEx('-', cxmeProcesso.Text, cxmeProcesso.SelStart +1) -1;
end;

procedure TfrmFaturamentoERP.MaskBeforePaste(Sender: TObject; AText: String; var ADone: Boolean);
var
  I: Integer;
  Unidade, Produto, Processo: String;
begin
  Processo := Trim(AText);

  if TryStrToInt(Copy(Processo, 1, 4), I) then
  begin
    Unidade := Copy(Processo, 1, 2);
    Produto := Copy(Processo, 3, 2);
    Delete(Processo, 1, 4);
  end
  else if TryStrToInt(Copy(Processo, 1, 2), I) then
  begin
    Unidade := '';
    Produto := Copy(Processo, 1, 2);
    Delete(Processo, 1, 2);
  end
  else
  begin
    Unidade := '';
    Produto := '';
  end;

  if (Sender = cxmeUnidade) or (Sender = cxmeProduto) or (Sender = cxmeProcesso) then
  begin
    if Unidade <> '' then
      cxmeUnidade.Text := Unidade;
    if Produto <> '' then
      cxmeProduto.Text := Produto;
    if Processo <> '' then
    begin
      if Produto = '' then
        AlterarProduto(Processo[1]);
      cxmeProcesso.Text := Processo;
    end;
  end;

  ADone := True;
end;

procedure TfrmFaturamentoERP.mmLogChange(Sender: TObject);
begin
  SendMessage(mmLog.Handle, EM_LINESCROLL, 0,mmLog.Lines.Count);
  Application.ProcessMessages;
end;

procedure TfrmFaturamentoERP.cxmeUnidadeExit(Sender: TObject);
begin
  if (Trim(cxmeUnidade.Text) <> '') and (cxteUnidade.Text = '') then
    cxmeUnidade.Style.Color := clRed;
end;

procedure TfrmFaturamentoERP.cxmeProdutoExit(Sender: TObject);
begin
  if (Trim(cxmeProduto.Text) <> '') and (cxteProduto.Text = '') then
    cxmeProduto.Style.Color := clRed;
end;

procedure TfrmFaturamentoERP.cxgdbtvFaturasobsPropertiesPopup(Sender: TObject);
begin
 Obs.Clear;
 Obs.Text := dtmFaturamentoERP.qryFaturasobs.AsString;
end;

procedure TfrmFaturamentoERP.cxgdbtvFaturasOpcoesPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  seniorKey,Cliente,codSnf,Incoterm,IncotermSalvo,FaturaContra: String;
  ExisteFatura: integer;
  bmPosicaoQuery : TBookmark;
  atualizouFaturaContra : boolean;
  msgBaixaPsrCrp: string;
begin
  try
    Screen.Cursor := crHourGlass;

    {$REGION 'Incoterm'}
    Incoterm := dtmFaturamentoERP.ConsultaSQL('select ISNULL(P.CD_INCOTERM,ISNULL(PE.CD_INCOTERM,'''')) CD_INCOTERM '+
                                              '  FROM BROKER.DBO.TPROCESSO         P  (NOLOCK) ' +
                                              ' LEFT JOIN BROKER.DBO.TPROCESSO_EXP PE (NOLOCK) ON PE.NR_PROCESSO = P.NR_PROCESSO '+
                                              ' WHERE P.NR_PROCESSO = :CNPJAgente ',
                                              [Parametros.ProcessoCompleto], '');

    IncotermSalvo := dtmFaturamentoERP.ConsultaSQL(' select InvoiceReceiverType '+
                                                   '  from billing (NOLOCK) '+
                                                   '  where id=:Nota',
                                                   [dtmFaturamentoERP.qryFaturasid.AsInteger], '');
    {$endregion}

  case AButtonIndex of
    0:
    {$region 'Cancelamento'}
       if AnsiIndexText(Trim(dtmFaturamentoERP.qryFaturasstatus.AsString), [_NotaFiscal_Aberta, _NotaFiscal_Faturada]) < 0 then
         MessageDlg('A situação deste processo não permite esta operação.', mtInformation, [mbOk], 0)
       else
       if MessageDlg('Deseja CANCELAR a Nota ' + dtmFaturamentoERP.qryFaturasid.AsString + '?'#13 +
                     'Não será possível descancelar a Nota.', mtConfirmation, [mbYes, mbNo, mbCancel], 0, mbNo) = mrYes then
       begin
          ExisteFatura := strtoint(dtmFaturamentoERP.ConsultaSQL(
          ' select COUNT(*)                                                                                            ' +
          '   FROM MYINDAIAV2.DBO.Billing B (NOLOCK)                                                                   ' +
          ' inner join MYINDAIAV2.DBO.Billing_ItemInvoiced  bii (NOLOCK)  on bii.Billing_id = b.id                     ' +
          ' inner join MYINDAIAV2.DBO.ItemInvoiced          ii  (NOLOCK)  on ii.id          = bii.itensInvoiced_id     ' +
          ' inner join MYINDAIAV2.DBO.CustomClearance       cc  (NOLOCK)  on cc.id          = ii.customClearance_id    ' +
          ' where status = ''INVOICED'' '+
          '   AND cc.id  = :ProcessoID ' ,
          [inttostr(Parametros.Processoid)],''));

          if ExisteFatura <= 0 then
          begin
            if dtmFaturamentoERP.qryFaturastype.AsString='TAX_INVOICE' then
            begin
               dtmFaturamentoERP.ExecSQL(' update broker.dbo.TFOLLOWUP               '+
                                         '    set DT_REALIZACAO_EFETIVA = null,      '+
                                         '        DT_REALIZACAO         = GETDATE(), '+
                                         '        CD_RESP_REALIZACAO    = null       '+
                                         '  where CD_EVENTO=''092''                  '+
                                         '    and NR_PROCESSO  in (SELECT distinct cc.customID                                                        ' +
                                         '                           FROM Billing              B2  (NOLOCK)                                  ' +
                                         '                     INNER JOIN Billing_ItemInvoiced BII (NOLOCK) ON BII.Billing_id=B2.id          ' +
                                         '                     INNER JOIN ItemInvoiced         II  (NOLOCK) ON II.id=BII.itensInvoiced_id    ' +
                                         '                     INNER JOIN CustomClearance      CC  (NOLOCK) ON CC.id=II.customClearance_id   ' +
                                         '                          where b2.id =  :BillingID  ) ' ,
                                         [dtmFaturamentoERP.qryFaturasid.AsString]);
            end
            else
            begin
              dtmFaturamentoERP.ExecSQL(' update broker.dbo.TFOLLOWUP               '+
                                        '    set DT_REALIZACAO_EFETIVA = null,      '+
                                        '        DT_REALIZACAO         = GETDATE(), '+
                                        '        CD_RESP_REALIZACAO    = null       '+
                                        '  where CD_EVENTO = ''721''                '+
                                        '    and NR_PROCESSO  in (SELECT distinct cc.customID   ' +
                                        '                           FROM Billing              B2  (NOLOCK)                                ' +
                                        '                     INNER JOIN Billing_ItemInvoiced BII (NOLOCK) ON BII.Billing_id=B2.id        ' +
                                        '                     INNER JOIN ItemInvoiced         II  (NOLOCK) ON II.id=BII.itensInvoiced_id  ' +
                                        '                     INNER JOIN CustomClearance      CC  (NOLOCK) ON CC.id=II.customClearance_id ' +
                                        '                          where b2.id =  :BillingID  ) '
                                       ,[dtmFaturamentoERP.qryFaturasid.AsString]);


            end;
          end;

           // Só o status INVOICED cancela no ERP, pois o status OPEN ainda não foi enviado ao ERP
           if dtmFaturamentoERP.qryFaturasseniorKey.Asstring = '' then
           begin
            dtmFaturamentoERP.ExecSQL(' delete Billing_PaymentRequested      where Billing_id =:Nota',[dtmFaturamentoERP.qryFaturasid.AsInteger]);
            dtmFaturamentoERP.ExecSQL(' delete Billing_CashRequested         where Billing_id =:Nota',[dtmFaturamentoERP.qryFaturasid.AsInteger]);
            dtmFaturamentoERP.ExecSQL(' update Billing set status=''CLOSED'' where id =:Nota',[dtmFaturamentoERP.qryFaturasid.AsInteger]);
            dtmFaturamentoERP.ExecSQL(' update pr set billing_id=null from PaymentRequested pr where pr.billing_id= :billing_id',[dtmFaturamentoERP.qryFaturasid.AsInteger]);

            dtmFaturamentoERP.qryFaturas.close;
            dtmFaturamentoERP.qryFaturas.open;


            ShowMessage('Nota cancelada com sucesso.');
            exit;
           end;


           if SameText(Trim(dtmFaturamentoERP.qryFaturasstatus.AsString), _NotaFiscal_Faturada) then
           begin
             //seniorKey := dtmEnvioERP.CancelarNota('UserWS', 'UserWsIndaia', dtmFaturamentoERP.qryFaturasid.AsInteger, _Producao);
             dtmFaturamentoERP.ExecSQL(' delete Billing_PaymentRequested      where Billing_id =:Nota',[dtmFaturamentoERP.qryFaturasid.AsInteger]);
             dtmFaturamentoERP.ExecSQL(' delete Billing_CashRequested         where Billing_id =:Nota',[dtmFaturamentoERP.qryFaturasid.AsInteger]);
             dtmFaturamentoERP.ExecSQL(' update Billing set status=''CLOSED'' where id =:Nota',[dtmFaturamentoERP.qryFaturasid.AsInteger]);
             dtmFaturamentoERP.ExecSQL(' update pr set billing_id=null from PaymentRequested pr where pr.billing_id= :billing_id',[dtmFaturamentoERP.qryFaturasid.AsInteger]);
           end
           else
             seniorKey := '-';

           seniorKey := '207507';
           if seniorKey = '' then
           begin
             MessageDlg('Erro enviando nota. Favor atualizar sua tela nota cancelada apenas no Novo Faturamento'#13 + dtmEnvioERP.MensagemErro, mtError, [mbOk], 0)
           end
           else
           begin
             try
               if dtmFaturamentoERP.qryFaturas.State <> dsEdit then
                 dtmFaturamentoERP.qryFaturas.Edit;

               if seniorKey <> '-' then
                 dtmFaturamentoERP.qryFaturasseniorKey.AsString := seniorKey;

               dtmFaturamentoERP.qryFaturasstatus.AsString := _NotaFiscal_Fechada;

               dtmFaturamentoERP.qryFaturas.Post;

               dtmFaturamentoERP.ExecSQL(' delete Billing_PaymentRequested where Billing_id =:Nota',[dtmFaturamentoERP.qryFaturasid.AsInteger]);
               dtmFaturamentoERP.ExecSQL(' delete Billing_CashRequested    where Billing_id =:Nota',[dtmFaturamentoERP.qryFaturasid.AsInteger]);
               dtmFaturamentoERP.ExecSQL(' update pr set billing_id=null from PaymentRequested pr where pr.billing_id= :billing_id',[dtmFaturamentoERP.qryFaturasid.AsInteger]);

               dtmFaturamentoERP.qryFaturas.close;
               dtmFaturamentoERP.qryFaturas.open;

               ShowMessage('Nota cancelada com sucesso.');
             except
               on E: Exception do
               begin
                 MessageDlg('A nota foi cancelada com sucesso no ERP. Mas ocorreu um erro ao atualizar o sistema.'#13 +
                            'Informe ao TI o número da nota no ERP.'#13'O número da nota no ERP é ' + seniorKey + '.'#13#13 +
                            'Erro: ' + E.Message, mtWarning, [mbOk], 0);

                 dtmFaturamentoERP.qryFaturas.close;
                 dtmFaturamentoERP.qryFaturas.open;
               end;
             end;
           end;
       end;
    {$endregion}
    1:
    {$region 'Transmissão'}
    begin
      //seniorKey := dtmEnvioERP.EnviarNota('UserWS', 'UserWsIndaia', dtmFaturamentoERP.qryFaturasid.AsInteger, _Producao, Parametros.GrupoBroker);
      //Exit;
     { Parametros.GrupoBroker := dtmFaturamentoERP.ConsultaSQL('select CD_GRUPO                       ' +
                                                              '  FROM  broker.dbo.tprocesso (NOLOCK) ' +
                                                              ' Where  NR_PROCESSO = :akey           ',
                                                              [Parametros.ProcessoCompleto], '');   }




      (*TESTE*)

//       Cliente := dtmFaturamentoERP.ConsultaSQL('SELECT id                  ' +
//                                                '  FROM Customer (NOLOCK)   ' +
//                                                ' WHERE taxID = :CNPJAgente ',
//                                                  [Parametros.CNPJAgente], '');
//
//       dtmEnvioERP.qryClienteV2.Parameters.ParamValues['CD_CLIENTE'] := Cliente;
//       dtmEnvioERP.qryClienteV2.Open;
//
//
//
//       dtmEnvioERP.qryUnidade.Parameters.ParamValues['ID_UNIDADE'] := dtmFaturamentoERP.qryFaturasbranch_id.AsInteger;
//       dtmEnvioERP.qryUnidade.Open;
////
//       dtmEnvioERP.BaixaPsrCrp( dtmEnvioERP.qryClienteV2seniorKey.asinteger,
//                                               1,
//                                               dtmEnvioERP.qryUnidadeseniorKey.AsInteger,
//                                               _Producao,
//                                               dtmFaturamentoERP.qryFaturasid.AsInteger,
//                                               'UserWS',
//                                               'UserWsIndaia');


      if not SameText(Trim(dtmFaturamentoERP.qryFaturasstatus.AsString), _NotaFiscal_Aberta) then
         MessageDlg('A situação deste processo não permite esta operação.', mtInformation, [mbOk], 0)
      else
       if dtmFaturamentoERP.qryFaturasdueDate.AsDateTime = 0 then
         MessageDlg('É necessário informar a Data de Vencimento da Nota Fiscal.', mtInformation, [mbOk], 0)
       else
       if dtmFaturamentoERP.qryFaturastotal.AsFloat <= 0 then
       begin
         atualizouFaturaContra := false;

         if (Incoterm = 'EXW') and (Parametros.Produto='02')   then
         begin
           if MessageDlg('Deseja Emitir Fatura contra o Agente?!', mtConfirmation, [mbYes, mbNo, mbCancel], 0, mbNo) = mrYes then
           begin
             mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Gravando alteração : Fatura contra o agente');
             FaturaContra:='AGENT';
             atualizouFaturaContra := true;
             dtmFaturamentoERP.ExecSQL('update billing  '+
                                      '   set InvoiceReceiverType =''AGENT'' '+
                                      ' where id=:Nota',
                                      [dtmFaturamentoERP.qryFaturasid.AsInteger]);
           end
           else
           begin
             mmLog.lines.add(DateTimeToStr (Now) + ':' +'Gravando alteração : Fatura contra o cliente');
             FaturaContra:='CUSTOMER';
             atualizouFaturaContra := true;
             dtmFaturamentoERP.ExecSQL('update billing  '+
                                      '   set InvoiceReceiverType =''CUSTOMER'' '+
                                      ' where id=:Nota',
                                      [dtmFaturamentoERP.qryFaturasid.AsInteger]);
           end;
         end;

         if FaturaContra='AGENT' then
         begin
           if not atualizouFaturaContra then
           begin
             mmLog.lines.add(DateTimeToStr (Now) + ':' +'Gravando alteração : Fatura contra o agente');
             dtmFaturamentoERP.ExecSQL('update billing  '+
                                       '   set InvoiceReceiverType =''AGENT'' '+
                                       ' where id=:Nota',
                                       [dtmFaturamentoERP.qryFaturasid.AsInteger]);
           end;
           mmLog.lines.add(DateTimeToStr (Now) + ':'+ 'Buscando codigo do cliente.');
           Cliente := dtmFaturamentoERP.ConsultaSQL('SELECT id                  ' +
                                                    '  FROM Customer (NOLOCK)   ' +
                                                    ' WHERE taxID = :CNPJAgente ',
                                                      [Parametros.CNPJAgente], '');
           if Cliente='' then
           begin
             raise Exception.Create('Agente não encontrado no Cadastro!');
             exit;
           end;

           if dtmEnvioERP.qryClienteV2.Active then
              dtmEnvioERP.qryClienteV2.Close;

           dtmEnvioERP.qryClienteV2.Parameters.ParamValues['CD_CLIENTE'] := Cliente;
           dtmEnvioERP.qryClienteV2.Open;
         end
         else
         begin
           if not atualizouFaturaContra then
           begin
             mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Gravando alteração : Fatura contra o cliente');
             dtmFaturamentoERP.ExecSQL(' update billing  '+
                                       '    set InvoiceReceiverType =''CUSTOMER'' '+
                                       '  where id=:Nota',
                                       [dtmFaturamentoERP.qryFaturasid.AsInteger]);
           end;

           mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Buscando codigo do cliente.');
           Cliente := dtmFaturamentoERP.ConsultaSQL('SELECT id                 ' +
                                                    '  FROM Customer (NOLOCK)  ' +
                                                    ' WHERE akey = :akey       ',
                                                     [dtmFaturamentoERP.qryFaturasCD_CLIENTE.AsString], '');
           if dtmEnvioERP.qryClienteV2.Active then
              dtmEnvioERP.qryClienteV2.Close;

            dtmEnvioERP.qryClienteV2.Parameters.ParamValues['CD_CLIENTE'] := Cliente;
            dtmEnvioERP.qryClienteV2.Open;
         end;

         mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Buscando codigo da unidade de negocio');
         if dtmEnvioERP.qryUnidade.Active then
            dtmEnvioERP.qryUnidade.Close;

         dtmEnvioERP.qryUnidade.Parameters.ParamValues['ID_UNIDADE'] := dtmFaturamentoERP.qryFaturasbranch_id.AsInteger;
         dtmEnvioERP.qryUnidade.Open;

         mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Atualizando titulos no senior.');


         dtmEnvioERP.AtualizarTitulosProcessos(  dtmEnvioERP.qryClienteV2seniorKey.Asinteger,
                                                 1,
                                                 dtmEnvioERP.qryUnidadeseniorKey.AsInteger,
                                                 _Producao,
                                                 dtmFaturamentoERP.qryFaturasid.AsInteger,
                                                 'UserWS',
                                                 'UserWsIndaia');


         if dtmEnvioERP.qryUnidadeProcesso.Active then
            dtmEnvioERP.qryUnidadeProcesso.Close;
         dtmEnvioERP.qryUnidadeProcesso.Parameters.ParamValues['ID_UNIDADE'] := dtmFaturamentoERP.qryFaturasBRANCH_ID_CUSTOM.AsInteger;
         dtmEnvioERP.qryUnidadeProcesso.Open;

         mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Iniciando baixa PsrCrp(1).');

         msgBaixaPsrCrp := dtmEnvioERP.BaixaPsrCrp( dtmEnvioERP.qryClienteV2seniorKey.asinteger,
                                                 1,
                                                 dtmEnvioERP.qryUnidadeProcessoseniorKey.AsInteger,
                                                 _Producao,
                                                 dtmFaturamentoERP.qryFaturasid.AsInteger,
                                                 'UserWS',
                                                 'UserWsIndaia');

         mmLog.lines.add(DateTimeToStr (Now) + ': ' + msgBaixaPsrCrp);


         mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Atualizando numero da fatura nos pagamentos.');
         dtmFaturamentoERP.ExecSQL('update PaymentRequested   '+
                                   '   set billing_id =:Nota  '+
                                   ' where id in (SELECT payments_id                        '+
                                   '                FROM Billing_PaymentRequested (NOLOCK)  '+
                                   '               WHERE Billing_id=:Nota) ',
                                   [dtmFaturamentoERP.qryFaturasid.AsInteger,
                                    dtmFaturamentoERP.qryFaturasid.AsInteger]);


           if dtmFaturamentoERP.qryFaturastype.AsString='TAX_INVOICE' then
           begin
             mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Atualizando evento 092');
             dtmFaturamentoERP.ExecSQL('update broker.dbo.TFOLLOWUP                '+
                                       '   set DT_REALIZACAO_EFETIVA = null,       '+
                                       '       DT_REALIZACAO         = GETDATE() , '+
                                       '       CD_RESP_REALIZACAO    = null        '+
                                       ' where CD_EVENTO =''092''                  '+
                                       '   and NR_PROCESSO  in (SELECT distinct cc.customID   ' +
                                       '                          FROM Billing              B2  (NOLOCK)                                            ' +
                                       '                    INNER JOIN Billing_ItemInvoiced BII (NOLOCK) ON BII.Billing_id = B2.id                  ' +
                                       '                    INNER JOIN ItemInvoiced         II  (NOLOCK) ON II.id          = BII.itensInvoiced_id   ' +
                                       '                    INNER JOIN CustomClearance      CC  (NOLOCK) ON CC.id          = II.customClearance_id  ' +
                                       '                         where b2.id =  :BillingID  ) ' ,
                                       [dtmFaturamentoERP.qryFaturasid.AsString]);
           end
           else
           begin

             mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Atualizando evento 721');
             dtmFaturamentoERP.ExecSQL('  update broker.dbo.TFOLLOWUP               '+
                                      '     set DT_REALIZACAO_EFETIVA = null,      '+
                                      '         DT_REALIZACAO         = GETDATE(), '+
                                      '         CD_RESP_REALIZACAO    = null       '+
                                      '   where CD_EVENTO=''721''                  '+
                                      '     and NR_PROCESSO in (SELECT cc.customID                                                       ' +
                                      '                         FROM Billing              B2  (NOLOCK)                                             ' +
                                      '                   INNER JOIN Billing_ItemInvoiced BII (NOLOCK)  ON BII.Billing_id= B2.id                   ' +
                                      '                   INNER JOIN ItemInvoiced         II  (NOLOCK)  ON II.id         = BII.itensInvoiced_id    ' +
                                      '                   INNER JOIN CustomClearance      CC  (NOLOCK)  ON CC.id         = II.customClearance_id   ' +
                                      '                        where b2.id =  :BillingID  ) ' ,
                                      [dtmFaturamentoERP.qryFaturasid.AsString]);
           end;

         SaldoProcesso(dtmFaturamentoERP.qryFaturasid.AsInteger);
         mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Fatura a Favor do Cliente: Pagamentos atualizados no ERP!');
         MessageDlg('Fatura a Favor do Cliente: Pagamentos atualizados no ERP!', mtInformation, [mbOk], 0);
         Exit;
       end
       else
       if MessageDlg('Deseja trasmitir a Nota ' + dtmFaturamentoERP.qryFaturasid.AsString + '?',
                     mtConfirmation, [mbYes, mbNo, mbCancel], 0, mbNo) = mrYes then
       begin
         if dtmFaturamentoERP.qryFaturas.State = dsEdit then
         begin
           mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Gravando alterações');
           dtmFaturamentoERP.qryFaturas.Post;
         end
         else
         begin
             bmPosicaoQuery  := dtmFaturamentoERP.qryFaturas.GetBookMark;
             mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Atualizando fatura');
             dtmFaturamentoERP.qryFaturas.close;
             dtmFaturamentoERP.qryFaturas.open;

             dtmFaturamentoERP.qryFaturas.GotoBookMark(bmPosicaoQuery);
             dtmFaturamentoERP.qryFaturas.FreeBookMark(bmPosicaoQuery);
         end;
         mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Enviando ao Senior');
         seniorKey := dtmEnvioERP.EnviarNota('UserWS',
                                             'UserWsIndaia',
                                             dtmFaturamentoERP.qryFaturasid.AsInteger,
                                             _Producao,
                                             Parametros.GrupoBroker);


         if seniorKey = '' then
         begin
           mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Erro enviando nota. ' + dtmEnvioERP.MensagemErro);
           MessageDlg('Erro enviando nota.'#13 + dtmEnvioERP.MensagemErro, mtError, [mbOk], 0)
         end
         else
         begin
           try
             mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Atualizando numero da fatura nos pagamentos.');
             dtmFaturamentoERP.ExecSQL(' update PaymentRequested                                 '+
                                       '    set billing_id =:Nota                                '+
                                       '  where id in (SELECT payments_id                        '+
                                       '                 FROM Billing_PaymentRequested (NOLOCK)  '+
                                       '                WHERE Billing_id = :Nota)                ',
                                      [dtmFaturamentoERP.qryFaturasid.AsInteger,dtmFaturamentoERP.qryFaturasid.AsInteger]);

             if not(dtmFaturamentoERP.qryFaturas.State in [dsEdit]) then
               dtmFaturamentoERP.qryFaturas.Edit;

             dtmFaturamentoERP.qryFaturasseniorKey.AsString       := seniorKey;
             dtmFaturamentoERP.qryFaturasseniorDateNFE.AsDateTime := Date;
             dtmFaturamentoERP.qryFaturasstatus.AsString          := _NotaFiscal_Faturada;
             dtmFaturamentoERP.qryFaturasir.AsFloat               := dtmEnvioERP.ValorTotalIR;

             if dtmFaturamentoERP.qryFaturas.State = dsEdit then
             begin
               mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Atualizando fatura.');
               dtmFaturamentoERP.qryFaturas.Post;
             end;

             if dtmFaturamentoERP.qryFaturastype.AsString='TAX_INVOICE' then
             begin
               mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Atualizando evento 092.');
               dtmFaturamentoERP.ExecSQL('update broker.dbo.TFOLLOWUP               '+
                                         '   set DT_REALIZACAO_EFETIVA = null,      '+
                                         '       DT_REALIZACAO         = GETDATE(), '+
                                         '       CD_RESP_REALIZACAO    = null       '+
                                         ' where CD_EVENTO=''092''                  '+
                                         '   and NR_PROCESSO in (SELECT distinct cc.customID '+
                                         '                         FROM Billing              B2  (NOLOCK)                                   ' +
                                         '                   INNER JOIN Billing_ItemInvoiced BII (NOLOCK) ON BII.Billing_id = B2.id         ' +
                                         '                   INNER JOIN ItemInvoiced         II  (NOLOCK) ON II.id=BII.itensInvoiced_id     ' +
                                         '                   INNER JOIN CustomClearance      CC  (NOLOCK) ON CC.id=II.customClearance_id    ' +
                                         '                        where b2.id =  :BillingID  ) ' ,
                                         [dtmFaturamentoERP.qryFaturasid.AsString]);
             end
             else
             begin
               mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Atualizando evento 721.');
               dtmFaturamentoERP.ExecSQL('update broker.dbo.TFOLLOWUP                '+
                                         '   set DT_REALIZACAO_EFETIVA = null,       '+
                                         '       DT_REALIZACAO         = GETDATE(),  '+
                                         '       CD_RESP_REALIZACAO    = null        '+
                                         ' where CD_EVENTO=''721''                   '+
                                         '   and NR_PROCESSO  in (SELECT cc.customID '+
                                         '                          FROM Billing              B2  (NOLOCK)                                 ' +
                                         '                    INNER JOIN Billing_ItemInvoiced BII (NOLOCK) ON BII.Billing_id=B2.id         ' +
                                         '                    INNER JOIN ItemInvoiced         II  (NOLOCK) ON II.id=BII.itensInvoiced_id   ' +
                                         '                    INNER JOIN CustomClearance      CC  (NOLOCK) ON CC.id=II.customClearance_id  ' +
                                         '                         where b2.id =  :BillingID  ) ' ,
                                         [dtmFaturamentoERP.qryFaturasid.AsString]);


             end;

             if dtmFaturamentoERP.qryFaturastype.AsString='TAX_RECEIPT' then
             begin
               mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Atualizando titulos senior.');
               dtmEnvioERP.AtualizarTitulosProcessos( dtmEnvioERP.qryClienteV2seniorKey.asinteger,
                                                       1,
                                                       dtmEnvioERP.qryUnidadeseniorKey.AsInteger,
                                                       _Producao,
                                                       dtmFaturamentoERP.qryFaturasid.AsInteger,
                                                       'UserWS',
                                                       'UserWsIndaia');


               mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Iniciando baixa PsrCrp(2).');

               if dtmFaturamentoERP.qryFaturasBRANCH_ID_CUSTOM.AsInteger <> 0 then
               begin
                 if dtmEnvioERP.qryUnidadeProcesso.Active then
                    dtmEnvioERP.qryUnidadeProcesso.Close;

                 dtmEnvioERP.qryUnidadeProcesso.Parameters.ParamValues['ID_UNIDADE'] := dtmFaturamentoERP.qryFaturasBRANCH_ID_CUSTOM.AsInteger;
                 dtmEnvioERP.qryUnidadeProcesso.Open;

                 msgBaixaPsrCrp := dtmEnvioERP.BaixaPsrCrp( dtmEnvioERP.qryClienteV2seniorKey.asinteger,
                                                         1,
                                                         dtmEnvioERP.qryUnidadeProcessoseniorKey.AsInteger,
                                                         _Producao,
                                                         dtmFaturamentoERP.qryFaturasid.AsInteger,
                                                         'UserWS',
                                                         'UserWsIndaia');
                 mmLog.lines.add(DateTimeToStr (Now) + ': ' + msgBaixaPsrCrp);
               end;

             end;

             SaldoProcesso(dtmFaturamentoERP.qryFaturasid.AsInteger);
             mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Nota enviada com sucesso.'#13'O número da nota no ERP é ' + seniorKey + '.');
             ShowMessage('Nota enviada com sucesso.'#13'O número da nota no ERP é ' + seniorKey + '.');
           except
             on E: Exception do
             begin
               mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Erro atualizando dados.');
               MessageDlg('A nota foi enviada com sucesso para o ERP. Mas ocorreu um erro ao atualizar o sistema.'#13 +
                          'Informe ao TI o número da nota no ERP.'#13'O número da nota no ERP é ' + seniorKey + '.'#13#13 +
                          'Erro: ' + E.Message, mtWarning, [mbOk], 0);
             end;
           end;
         end;
       end;


    End;
    {$endregion}
    2:
    {$REGION 'Impressão'}
    Begin
      if (Incoterm = 'EXW') and (Parametros.Produto='02') then
      begin
        if MessageDlg('Deseja Emitir Fatura contra o Agente?!', mtConfirmation, [mbYes, mbNo, mbCancel], 0, mbNo) = mrYes then
        begin
            dtmFaturamentoERP.ExecSQL(' update billing '+
                                      '    set InvoiceReceiverType =''AGENT'' '+
                                      '  where id=:Nota ',
                                      [dtmFaturamentoERP.qryFaturasid.AsInteger]);
        end
        else
        begin
          dtmFaturamentoERP.ExecSQL(' update billing  '+
                                    '    set InvoiceReceiverType =''CUSTOMER'' '+
                                    '  where id=:Nota',
                                    [dtmFaturamentoERP.qryFaturasid.AsInteger]);
        end;
      end
      else
      begin
          dtmFaturamentoERP.ExecSQL(' update billing  '+
                                    '    set InvoiceReceiverType =''CUSTOMER'' '+
                                    '  where id=:Nota ',
                                    [dtmFaturamentoERP.qryFaturasid.AsInteger]);
      end;

      Application.CreateForm(TdtmDocumentosFaturamento,dtmDocumentosFaturamento);
      Application.CreateForm(TfrmImpressaoDocumentos,frmImpressaoDocumentos);

      if dtmFaturamentoERP.qryFaturasType.AsString = 'TAX_INVOICE' then
      begin
        frmImpressaoDocumentos.Prefixo   := 'RPS';
        frmImpressaoDocumentos.Descricao := 'Nota de Serviço';
      end
      else
      begin
        frmImpressaoDocumentos.Prefixo   := 'FT';
        frmImpressaoDocumentos.Descricao := 'Fatura de Despesas';
      end;

      frmImpressaoDocumentos.FaturaId := dtmFaturamentoERP.qryFaturasid.AsInteger;

      if dtmFaturamentoERP.qryFaturasseniorKey.AsString = '' then
        frmImpressaoDocumentos.NumeroFatura := StrToInt(dtmFaturamentoERP.qryFaturasid.AsString)
      else
        frmImpressaoDocumentos.NumeroFatura := StrToInt(dtmFaturamentoERP.qryFaturasseniorKey.AsString);

      frmImpressaoDocumentos.NR_Processo := Parametros.ProcessoCompleto;
      frmImpressaoDocumentos.ShowModal;
    End;
    {$endregion}    //Integraçao
    3:
    {$region 'Integracao'}
    Begin
       if ( ( Parametros.GrupoBroker = '083') or
            ( Parametros.GrupoBroker = '028') or
            ( Parametros.GrupoBroker = '440') or
            ( Parametros.GrupoBroker = '155') or
            ( Parametros.GrupoBroker = '154') or
            ( Parametros.GrupoBroker = '644') or
            ( Parametros.GrupoBroker = 'C59') or
            ( Parametros.GrupoBroker = 'B50') ) then
        GeraIntegracaoDespesaTXT(Parametros.ProcessoCompleto,Parametros.GrupoBroker);
    End;
    {$ENDREGION}
    4:
    {$REGION 'Reembolso'}
    Begin
      GeraReembolso(dtmFaturamentoERP.qryFaturasid.AsString);
      dtmFaturamentoERP.qryFaturas.close;
      dtmFaturamentoERP.qryFaturas.open;
    End;
    {$endREGION}
  end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

function TfrmFaturamentoERP.SaldoProcesso(Billing_id : integer):string;
var
  TotalNumerario, TotalPagamento : double;
  SaldoProcesso : string;
begin
  mmLog.lines.add(DateTimeToStr (Now) + ': ' + 'Recalculando saldo do processo.');
  if dtmFaturamentoERP.qrySaldoProcesso.Active then
      dtmFaturamentoERP.qrySaldoProcesso.Close;

    dtmFaturamentoERP.qrySaldoProcesso.Parameters.ParamValues['Billing_id'] := Billing_id;
    dtmFaturamentoERP.qrySaldoProcesso.Open;

  while not dtmFaturamentoERP.qrySaldoProcesso.Eof  do
  begin
    TotalNumerario := strtofloat(dtmFaturamentoERP.ConsultaSQL(
                       '	SELECT ISNULL(SUM(CR.CASHREQUESTTOTAL),0) TOTALNUMERARIO                 ' +
                       '   	FROM CASHREQUESTED   CR (NOLOCK)                                       ' +
                       '	OUTER APPLY (SELECT CASHREQUESTS_ID                                      ' +
                       '						FROM BILLING_CASHREQUESTED BCR (NOLOCK)                        ' +
                       '      INNER JOIN BILLING               B   (NOLOCK) ON B.ID=BCR.BILLING_ID ' +
                       '						WHERE STATUS = ''INVOICED''                                    ' +
                       '							AND BCR.CASHREQUESTS_ID = CR.ID ) A                          ' +
                       '	WHERE CUSTOMCLEARANCE_ID= :CUSTOMCLEARANCE                               ' +
                       '	AND CR.STATUS=''APPROVED''                                               ' +
                       '	AND A.CASHREQUESTS_ID IS NULL                                            ',
                       [dtmFaturamentoERP.qrySaldoProcessocustomClearance_id.AsString], ''));

    TotalPagamento := strtofloat(dtmFaturamentoERP.ConsultaSQL(' SELECT isnull(sum(pr.paymentTotal),0)          ' +
                                                               '   from PaymentRequested pr (NOLOCK)            ' +
                                                          //   '  where pr.status= ''APPROVED''                 ' +
                                                               '  where pr.status <> ''CANCELED''               ' +
                                                               '    and pr.customClearance_id= :CustomClearance ' +
                                                               '    and isnull(billing_id,'''') = ''''          ',
                                                               [dtmFaturamentoERP.qrySaldoProcessocustomClearance_id.AsString], ''));

    SaldoProcesso :=  StringReplace(floattostr(TotalNumerario -  TotalPagamento), ',', '.', []);;

    dtmFaturamentoERP.ExecSQL(' update b                       '+
                              '    set value = :SaldoProcesso  '+
                              '   from Balance              b (NOLOCK) '+
                              '  inner join CustomClearance cc (NOLOCK) on cc.balance_id=b.id ' +
                              '  where cc.id= :CustomClearance',
                              [SaldoProcesso,dtmFaturamentoERP.qrySaldoProcessocustomClearance_id.AsString]);
    dtmFaturamentoERP.qrySaldoProcesso.Next;
  end;
end;

function TfrmFaturamentoERP.GeraReembolso(Billing_id: string): string;
var
  qryExecuta : TADOQuery;
begin

    if dtmFaturamentoERP.qryReembolso.Active then
      dtmFaturamentoERP.qryReembolso.Close;

    dtmFaturamentoERP.qryReembolso.Parameters.ParamValues['Billing_id'] := Billing_id;
    dtmFaturamentoERP.qryReembolso.Open;

    dtmFaturamentoERP.qryReembolso.first;
    while not dtmFaturamentoERP.qryReembolso.Eof do
    begin
      if dtmFaturamentoERP.qryReembolsoReembolso.AsString=''  then
      begin
        ShowMessage('Taxa de Reembolso não cadastrada!');
        exit;
      end;
      dtmFaturamentoERP.qryReembolso.Next;
    end;
    dtmFaturamentoERP.qryReembolso.first;

    dtmFaturamentoERP.ExecSQL(' delete myindaiav2.dbo.refund where Billing_id =:Nota',[Billing_id]);

    qryExecuta := dtmFaturamentoERP.GetQuery;

    while not dtmFaturamentoERP.qryReembolso.Eof do
    begin
      qryExecuta.SQL.Clear;
      qryExecuta.SQL.Add(' insert into myindaiav2.dbo.refund (days,price,billing_id,ItemPaymentRequested_id)'+
                         '  values( :dias, :reembolso, :billing_id, :ItemPaymentRequested_id) ');
      qryExecuta.Parameters.ParamValues['dias'] := dtmFaturamentoERP.qryReembolsoDias.AsInteger;
      qryExecuta.Parameters.ParamValues['reembolso'] := dtmFaturamentoERP.qryReembolsoReembolso.asfloat;
      qryExecuta.Parameters.ParamValues['billing_id']:= dtmFaturamentoERP.qryReembolsoBilling_id.AsInteger;
      qryExecuta.Parameters.ParamValues['ItemPaymentRequested_id'] := dtmFaturamentoERP.qryReembolsoItemPaymentRequested_id.AsInteger;
      qryExecuta.ExecSQL;

      dtmFaturamentoERP.qryReembolso.Next;
    end;

    ShowMessage('Reembolso gerado com sucesso!');
end;



procedure TfrmFaturamentoERP.GeraIntegracaoDespesaTXT(Processo,Grupo : string);
var
  Despachante,vnome,nome_doc,vGrupo: string;
  vString  : TStrings;
  vArquivo ,Despesas_Cadastro,PortoAeroporto: String ;
begin
 with dtmIntegracao  do
  begin
    cds_despesas_de.Close;
    cds_despesas_de.Params.ParamByName('Processo').AsString := Parametros.ProcessoCompleto;
    cds_despesas_de.Params.ParamByName('Fatura').AsInteger := dtmFaturamentoERP.qryFaturasid.AsInteger;
    cds_despesas_de.Open;
    cds_despesas_de.First;

    PortoAeroporto := dtmFaturamentoERP.ConsultaSQL(' select ltrim(rtrim(isnull(CD_LOCAL_DESEMBARQUE,''0''))) CD_LOCAL_DESEMBARQUE ' +
                                                    '   FROM  broker.dbo.tprocesso (NOLOCK) ' +
                                                    '  Where  NR_PROCESSO = :akey           ',
                                                    [Parametros.ProcessoCompleto], '');
    while NOT cds_despesas_de.Eof do
    begin
      if (dtmIntegracao.cds_despesas_deCD_DESPESA.AsString = '') or (dtmIntegracao.cds_despesas_deCD_DESPESA.IsNull) then
      begin
        Despesas_Cadastro := Despesas_Cadastro + '('+ trim(cds_despesas_deCD_DESPESA_INDAIA.AsString) +'-'+ trim(cds_despesas_deNM_ITEM.AsString)+')';
      end;
      cds_despesas_de.Next;
    end;

    if Despesas_Cadastro <> '' then
    begin
      ShowMessage('Existem despesas não cadastrada :' + trim(Despesas_Cadastro));
    end
    else
    begin
      while  (dtmIntegracao.cds_despesas_de.RecordCount > 0) do
      begin
        cds_despesas_de.First;

        while not dtmIntegracao.cds_despesas_de.Eof do
        begin
          if (cds_despesas_deCD_DESPESA_INDAIA.AsString = '26')  or (cds_despesas_deCD_DESPESA_INDAIA.AsString = '27') or
             (cds_despesas_deCD_DESPESA_INDAIA.AsString = '600') or (cds_despesas_deCD_DESPESA_INDAIA.AsString = '599')  then
          begin
            Despachante :='010';
            cds_despesas_de.Last;
            vnome:= '1' ;
          end
          else
          if (cds_despesas_deCD_DESPESA_INDAIA.AsString = '25') or (cds_despesas_deCD_DESPESA_INDAIA.AsString = '32') then
          begin
            cds_despesas_de.Last;
            vnome:= '2' ;
          end
          else
          if (cds_despesas_deCD_DESPESA_INDAIA.AsString = '684') then
          begin
            cds_despesas_de.Last;
            vnome:= '3' ;
          end
          else
          if (cds_despesas_deCD_DESPESA_INDAIA.AsString = '822') then
          begin
            cds_despesas_de.Last;
            vnome:= '4' ;
          end
          else
          begin
            cds_despesas_de.Last;
            vnome:= '5' ;
          end;
          Despachante :='IND';

          cds_despesas_di.Close;
          cds_despesas_di.Params.ParamByName('PROCESSO').AsString := Parametros.ProcessoCompleto;
          cds_despesas_di.Open;
          cds_despesas_di.First;

          {if ((dtmIntegracao.cds_despesas_diCD_AGENTE.AsString = '') OR (dtmIntegracao.cds_despesas_diCD_AGENTE.IsNull)) and (Grupo='155') then
          begin
            ShowMessage('Agente não cadastrado ,favor informar ao TI');
            Exit;
          end; }


          if (Grupo='028') then
          begin
          //criar aqui um if para quando o item for comissao ou despesas preencher o despachante para saint gobain
                              //SUAPE                                            //FATURA DE DESPESA
          if (PortoAeroporto = '0367') and (dtmFaturamentoERP.qryFaturastype.AsString = 'TAX_RECEIPT')  then
            Despachante :='001'//'021' /*FIN-603*/
          else                //SUAPE                                            //FATURA DE SERVIÇO
          if (PortoAeroporto = '0367') and (dtmFaturamentoERP.qryFaturastype.AsString = 'TAX_INVOICE') then
            Despachante :='011'//'022' /*FIN-603*/
          else                //SANTOS                                           //FATURA DE DESPESA
          if (PortoAeroporto = '0002') and (dtmFaturamentoERP.qryFaturastype.AsString = 'TAX_RECEIPT') then
            Despachante :='001'
          else                //SANTOS                                           //FATURA DE SERVIÇO
          if (PortoAeroporto = '0002') and (dtmFaturamentoERP.qryFaturastype.AsString = 'TAX_INVOICE') then
            Despachante :='011'
          else                //GUARULHOS                                           //FATURA DE DESPESA
          if (PortoAeroporto = '0125') and (dtmFaturamentoERP.qryFaturastype.AsString = 'TAX_RECEIPT') then
            Despachante :='033'
          else                //GUARULHOS                                           //FATURA DE SERVIÇO
          if (PortoAeroporto = '0125') and (dtmFaturamentoERP.qryFaturastype.AsString = 'TAX_INVOICE') then
            Despachante :='034'
          else                //VIRACOPOS                                           //FATURA DE DESPESA
          if (PortoAeroporto = '0111') and (dtmFaturamentoERP.qryFaturastype.AsString = 'TAX_RECEIPT') then
            Despachante :='035'
          else                //VIRACOPOS                                           //FATURA DE SERVIÇO
          if (PortoAeroporto = '0111') and (dtmFaturamentoERP.qryFaturastype.AsString = 'TAX_INVOICE') then
            Despachante :='036'
          else                //URUGUAIANA                                         //FATURA DE DESPESA
          if (PortoAeroporto = '0523') and (dtmFaturamentoERP.qryFaturastype.AsString = 'TAX_RECEIPT') then
            Despachante :='030'
          else                //URUGUAIANA                                         //FATURA DE SERVIÇO
          if (PortoAeroporto = '0523') and (dtmFaturamentoERP.qryFaturastype.AsString = 'TAX_INVOICE') then
            Despachante :='031'
          else                //RECIFE                                             //FATURA DE DESPESA
          if (PortoAeroporto = '0358') and (dtmFaturamentoERP.qryFaturastype.AsString = 'TAX_RECEIPT') then
            Despachante :='001'//'021' /*FIN-603*/
          else                //RECIFE                                             //FATURA DE SERVIÇO
          if (PortoAeroporto = '0358') and (dtmFaturamentoERP.qryFaturastype.AsString = 'TAX_INVOICE') then
            Despachante :='011'//'022' /*FIN-603*/
          else
				    ShowMessage('Local de Desembarque não localizado não lista (Easy).');
          end
          else
          if (Grupo = 'B50') then
            Despachante :='013'
          else if Grupo = '644' then
            Despachante :='197'
          else if Grupo = 'C59' then
            Despachante :='001'
          else if (Grupo <> '155') then
            Despachante :='001';


          nome_doc := dtmIntegracao.cds_despesas_diref_cliente_doc.AsString;

          vString := TStringList.Create;
          vString.add(cds_despesas_diTP_REGISTRO_DI.AsString +
                      JustificaString(cds_despesas_diNR_PROCESSO.AsString,18)+
                      JustificaString(cds_despesas_diDT_CHEGADA.AsString,8)+
                      JustificaString(cds_despesas_diDT_RECEBIMENTO_DOCTOS.AsString,8)+
                      JustificaString(Despachante,3)+
                      JustificaString(cds_despesas_diCD_AGENTE.AsString,3)+
                      JustificaString(cds_despesas_diDT_PAGTO_IMPOSTO.AsString,8)+
                      JustificaString(cds_despesas_diNR_REGISTRO_DI.AsString,10) +
                      StringReplace(FormatFloat('000000.00000000', cds_despesas_diTX_MERCADORIA.AsFloat),',','.',[]) +
                      JustificaString(cds_despesas_diDT_DESEMBARACO.AsString,8)+
                      JustificaString(cds_despesas_diCD_MOEDA_FRETE.AsString,3)+
                      StringReplace(FormatFloat('000000000000.00', cds_despesas_diVL_FRETE_MOEDA.AsFloat),',','.',[]) +
                      StringReplace(FormatFloat('000000.00000000', cds_despesas_diTX_FRETE.AsFloat),',','.',[]) +
                      StringReplace(FormatFloat('000000000000.00', cds_despesas_diVL_SEGURO_MOEDA.AsFloat),',','.',[]) +
                      JustificaString(cds_despesas_diCD_MOEDA_SEGURO.AsString,3)+
                      StringReplace(FormatFloat('000000.00000000', cds_despesas_diTX_SEGURO.AsFloat),',','.',[]) +
                      StringReplace(FormatFloat('000000.00000000', cds_despesas_diTX_DOLAR.AsFloat),',','.',[]) +
                      JustificaString(cds_despesas_diREF_CLIENTE.AsString,15)+
                      JustificaString(cds_despesas_diNR_MASTER.AsString,18)+
                      FStrZero(cds_despesas_diTP_DECLARACAO.AsString,2)+
                      FStrZero(cds_despesas_diURF_DESPACHO.AsString,7)+
                      FStrZero(cds_despesas_diURF_ENTRADA.AsString,7)+
                      JustificaString(cds_despesas_diCD_RECINTO_ALFAND.AsString,7)+
                      JustificaString(cds_despesas_diMODALIDADE_DESPACHO.AsString,1)+
                      JustificaString(cds_despesas_diTP_CONHECIMENTO.AsString,2)+
                      JustificaString(cds_despesas_diTP_DOCUMENTO.AsString,2)+
                      JustificaString(cds_despesas_diUTILIZACAO.AsString,1)+
                      JustificaString(Copy(TrimRight(cds_despesas_diNR_IDENTIFICACAO.AsString),1,15),15)+
                      StringReplace(FormatFloat('0000000000.0000', cds_despesas_diPESO_BRUTO.AsFloat),',','.',[]) +
                      StringReplace(FormatFloat('000000000000.00', cds_despesas_diTOT_FOB_MOEDA.AsFloat),',','.',[]) +
                      JustificaString(cds_despesas_diNR_FATURA_SERVICO.AsString,6)+
                      JustificaString(cds_despesas_diNR_NOTA_FISCAL_ENTRADA.AsString,20)+
                      JustificaString(cds_despesas_diDT_NOTA_FISCAL_ENTRADA.AsString,8)+
                      StringReplace(FormatFloat('000000000000.00', cds_despesas_diVL_TOT_NOTA_FISCAL_ENTRADA.AsFloat),',','.',[]) +
                      JustificaString(cds_despesas_diDT_ENTREGA_MERC.AsString,8)+
                      JustificaString(cds_despesas_diDT_REGISTRO_DI.AsString,8)+
                      StringReplace(FormatFloat('000000000000.00', cds_despesas_diVL_FRETE_COLLECT_MNEG.AsFloat),',','.',[]) +
                      StringReplace(FormatFloat('000000000000.00', cds_despesas_diVL_FRETE_TERR_NACIONAL.AsFloat),',','.',[])+
                      JustificaString(cds_despesas_diOBS.AsString,250)+
                      JustificaString(cds_despesas_diLOCAL_DESEMBARACO.AsString,30)+
                      JustificaString(cds_despesas_diUF_DESEMBARACO.AsString,2)  );

          vString.add(cds_despesas_diTP_REGISTRO_TX.AsString +
                      JustificaString(cds_despesas_diNR_PROCESSO.AsString,18)+
                      JustificaString(cds_despesas_diCD_MOEDA.AsString,3)+
                      StringReplace(FormatFloat('000000.00000000', cds_despesas_diTX_MOEDA.AsFloat),',','.',[]) );

          cds_despesas_di.Close;
          cds_despesas_de.First;
          if Despachante = '010' then
          begin
            while NOT cds_despesas_de.Eof do
            begin
              if (cds_despesas_deCD_DESPESA_INDAIA.AsString = '26') or (cds_despesas_deCD_DESPESA_INDAIA.AsString = '27') or
                 (cds_despesas_deCD_DESPESA_INDAIA.AsString = '600') or (cds_despesas_deCD_DESPESA_INDAIA.AsString = '599') then
              begin
                vString.add( cds_despesas_deTP_REGISTRO.AsString +
                         JustificaString(cds_despesas_deNR_PROCESSO.AsString,18)+
                         JustificaString(cds_despesas_deDT_PAGTO.AsString,8)+
                         FStrZero(cds_despesas_deCD_DESPESA.AsString,3) +
                         StringReplace(FormatFloat('00000000000000.00', cds_despesas_deVL_DESPESA.AsFloat),',','.',[]) +
                         JustificaString(cds_despesas_dePAGTO_EF_PREV.AsString,1)+
                         JustificaString(cds_despesas_deDESP_IMP.AsString,1)+
                         JustificaString(cds_despesas_deADIANTAMENTO.AsString,1)+
                         JustificaString(cds_despesas_deFILLER.AsString,277) );
                cds_despesas_de.Delete;
              end
              else
              cds_despesas_de.Next;
            end;
          end
          else
          if Despachante = '009' then
          begin
            while NOT cds_despesas_de.Eof do
            begin
              if (cds_despesas_deCD_DESPESA_INDAIA.AsString = '25') or (cds_despesas_deCD_DESPESA_INDAIA.AsString = '32')  then
              begin
                vString.add( cds_despesas_deTP_REGISTRO.AsString +
                         JustificaString(cds_despesas_deNR_PROCESSO.AsString,18)+
                         JustificaString(cds_despesas_deDT_PAGTO.AsString,8)+
                         FStrZero(cds_despesas_deCD_DESPESA.AsString,3) +
                         StringReplace(FormatFloat('00000000000000.00', cds_despesas_deVL_DESPESA.AsFloat),',','.',[]) +
                         JustificaString(cds_despesas_dePAGTO_EF_PREV.AsString,1)+
                         JustificaString(cds_despesas_deDESP_IMP.AsString,1)+
                         JustificaString(cds_despesas_deADIANTAMENTO.AsString,1)+
                         JustificaString(cds_despesas_deFILLER.AsString,277) );
                cds_despesas_de.Delete;
              end
              else
              cds_despesas_de.Next;
            end;
          end
          else
          if Despachante = '007' then
          begin
            while NOT cds_despesas_de.Eof do
            begin
              if (cds_despesas_deCD_DESPESA_INDAIA.AsString = '684') then
              begin
                 vString.add( cds_despesas_deTP_REGISTRO.AsString +
                           JustificaString(cds_despesas_deNR_PROCESSO.AsString,18)+
                          JustificaString(cds_despesas_deDT_PAGTO.AsString,8)+
                          FStrZero(cds_despesas_deCD_DESPESA.AsString,3) +
                          StringReplace(FormatFloat('00000000000000.00', cds_despesas_deVL_DESPESA.AsFloat),',','.',[]) +
                          JustificaString(cds_despesas_dePAGTO_EF_PREV.AsString,1)+
                          JustificaString(cds_despesas_deDESP_IMP.AsString,1)+
                          JustificaString(cds_despesas_deADIANTAMENTO.AsString,1)+
                          JustificaString(cds_despesas_deFILLER.AsString,277) );
                  cds_despesas_de.Delete;
              end
              else
              cds_despesas_de.Next;
            end;
          end
          else
          if (Despachante = '022')  then
          begin
             while NOT cds_despesas_de.Eof do
             begin
               if (cds_despesas_deCD_DESPESA_INDAIA.AsString = '822') then
               begin
                  vString.add( cds_despesas_deTP_REGISTRO.AsString +
                           JustificaString(cds_despesas_deNR_PROCESSO.AsString,18)+
                          JustificaString(cds_despesas_deDT_PAGTO.AsString,8)+
                          FStrZero(cds_despesas_deCD_DESPESA.AsString,3) +
                          StringReplace(FormatFloat('00000000000000.00', cds_despesas_deVL_DESPESA.AsFloat),',','.',[]) +
                          JustificaString(cds_despesas_dePAGTO_EF_PREV.AsString,1)+
                          JustificaString(cds_despesas_deDESP_IMP.AsString,1)+
                          JustificaString(cds_despesas_deADIANTAMENTO.AsString,1)+
                          JustificaString(cds_despesas_deFILLER.AsString,277) );
                  cds_despesas_de.Delete;
                end
                else
                 cds_despesas_de.Next;
             end;
          end
          else
          if (Despachante = 'IND') or
             (Despachante = '001') or
             (Despachante = '013') or
             (Despachante = '021') or
             (Despachante = '011') or
             (Despachante = '030') or
             (Despachante = '031') or
             (Despachante = '033') or
             (Despachante = '034') or
             (Despachante = '035') or
             (Despachante = '036') or
             (Despachante = '197') then
          begin
             while NOT cds_despesas_de.Eof do
             begin
              vString.add( cds_despesas_deTP_REGISTRO.AsString +
                         JustificaString(cds_despesas_deNR_PROCESSO.AsString,18)+
                         JustificaString(cds_despesas_deDT_PAGTO.AsString,8)+
                         FStrZero(cds_despesas_deCD_DESPESA.AsString,3) +
                         StringReplace(FormatFloat('00000000000000.00', cds_despesas_deVL_DESPESA.AsFloat),',','.',[]) +
                         JustificaString(cds_despesas_dePAGTO_EF_PREV.AsString,1)+
                         JustificaString(cds_despesas_deDESP_IMP.AsString,1)+
                         JustificaString(cds_despesas_deADIANTAMENTO.AsString,1)+
                         JustificaString(cds_despesas_deFILLER.AsString,277) );

                 cds_despesas_de.Delete;
             end
          end;

          vArquivo := PastaDoctosIntegracao + nome_doc+ Parametros.ProcessoCompleto+'.txt';
          vString.SaveToFile(vArquivo);
        end;

      end;
       showmessage('Integração do arquivo DI gerado em :' + vArquivo);
    end;
 end;
end;

procedure TfrmFaturamentoERP.cxgdbtvTipoFaturaStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  S: String;
begin
  if not VarIsNull(ARecord.Values[0]) then
    S := Trim(ARecord.Values[0])
  else
    S := '';
  if SameText(S, _NotaFiscal_Servico) then
    AStyle := dtmFaturamentoERP.cxsTipoReceita
  else if SameText(S, _NotaFiscal_Despesa) then
    AStyle := dtmFaturamentoERP.cxsTipoPagamento;
end;

procedure TfrmFaturamentoERP.cxgdbtvTipoPendenteStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  S: String;
begin
  if not VarIsNull(ARecord.Values[0]) then
    S := ARecord.Values[0]
  else
    S := '';
  if CharInSet(S[1], ['N', 'n']) then
    AStyle := dtmFaturamentoERP.cxsTipoNumerario
  else if CharInSet(S[1], ['P', 'p']) then
    AStyle := dtmFaturamentoERP.cxsTipoPagamento
  else if CharInSet(S[1], ['R', 'r']) then
    AStyle := dtmFaturamentoERP.cxsTipoReceita;

end;

procedure TfrmFaturamentoERP.cxmeProcessoExit(Sender: TObject);
begin
  if Processo = '' then
    cxmeProcesso.Style.Color := clRed;
  //ShowMessage(dtmfaturamentoErp.qryFaturasCustomClearance_id.AsString);
end;

constructor TfrmFaturamentoERP.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TfrmFaturamentoERP.ExpandirGrids;
begin
  if dtmFaturamentoERP.qryFaturas.Active then
  begin
    cxgdbtvTipoFatura.ViewData.Collapse(True);
    cxgdbtvTipoFatura.ViewData.Expand(False);
  end;
  if dtmFaturamentoERP.qryPendentes.Active then
  begin
    cxgdbtvTipoPendente.ViewData.Collapse(True);
    cxgdbtvTipoPendente.ViewData.Expand(False);
  end;
end;

procedure TfrmFaturamentoERP.FormCreate(Sender: TObject);
var
 HLogin: HWND;
begin
  if StartupSystem then
    begin
      FNM_LOGIN := GetLoginName;
      FNM_SENHA := GetPassword;
      FCD_USUARIO := StrToInt(GetUserCode);
      FCD_CARGO := StrToInt(GetCargoCode);
      FNM_CARGO := GetCargoName;
      FNM_USUARIO := GetUserName;
      FNM_EMAIL := GetUserEmail;

    end
    else
      Close;

  LimpaLog(PastaDoctosIntegracao,'txt');
  LimpaLog(Path + 'XML\','xml');
end;

procedure TfrmFaturamentoERP.FormShow(Sender: TObject);
var
  S, Nome, Valor: String;
  I: Integer;
  Done: Boolean;
begin
  Unidade := '';
  Produto := '';
  Processo := '';
  FUsuario := '';
  FLogin := 'mf';
  FSenha := '';

  cxmeUnidade.BeforePaste := MaskBeforePaste;
  cxmeProduto.BeforePaste := MaskBeforePaste;
  cxmeProcesso.BeforePaste := MaskBeforePaste;

  S := '';
  for I := 1 to ParamCount do
    S := S + ' ' + ParamStr(I);
  while S <> '' do
  begin
    I := Pos(';', S);
    if I = 0 then
      I := Length(S) +1;
    Valor := Copy(S, 1, I -1);
    Delete(S, 1, I);

    I := Pos('=', Valor);
    if I > 0 then
    begin
      Nome := Trim(Copy(Valor, 1, I -1));
      Delete(Valor, 1, I);
      Valor := Trim(Valor);
      if SameText(Nome, 'Unidade') then
        cxmeUnidade.Text := Valor
      else if SameText(Nome, 'Produto') then
        cxmeProduto.Text := Valor
      else if SameText(Nome, 'Processo') then
        MaskBeforePaste(cxmeProcesso, Valor, Done)
      else if SameText(Nome, 'Login') then
        FLogin := Valor
      else if SameText(Nome, 'Senha') then
        FSenha := Valor;
    end;
  end;
  if Trim(cxmeProduto.Text) <> '' then
    SelectNext(cxmeProduto, True, True)
  else if Trim(cxmeUnidade.Text) <> '' then
    SelectNext(cxmeUnidade, True, True);
  dtmFaturamentoERP.AbreUsuario(FNM_USUARIO,FNM_EMAIL,FCD_USUARIO);
  {if Trim(dtmFaturamentoERP.qryCustomClearancecustomID.AsString) <> '' then
  begin
    Parametros.Produto := cxmeProduto.Text;
    Parametros.Unidade := cxmeUnidade.Text;
    Parametros.Processo := cxmeProcesso.Text;
    Parametros.CNPJ := dtmFaturamentoERP.qryClienteLocalCGC_EMPRESA.AsString;
  end;}
end;

function TfrmFaturamentoERP.GetLogin: String;
begin
  Result := Self.FLogin;
end;

function TfrmFaturamentoERP.GetProcesso: String;
begin
  Result := cxmeProcesso.Text;
end;

function TfrmFaturamentoERP.GetProduto: String;
begin
  Result := cxmeProduto.Text;
end;

function TfrmFaturamentoERP.GetUnidade: String;
begin
  Result := cxmeUnidade.Text;
end;

function TfrmFaturamentoERP.GetUsuario: String;
begin
  Result := Self.FUsuario;
end;

procedure TfrmFaturamentoERP.Image1Click(Sender: TObject);
begin
  dtmFaturamentoERP.ExecSQL('update billing  set obs ='''+ obs.Text +''' where id=:Nota',[dtmFaturamentoERP.qryFaturasid.AsInteger]);
  dtmFaturamentoERP.qryFaturas.Close;
  dtmFaturamentoERP.qryFaturas.Open;
end;

procedure TfrmFaturamentoERP.imgGerarNotaFiscalClick(Sender: TObject);
begin
  if not (dtmFaturamentoERP.qryClienteLocal.State in [dsInactive]) then
  begin
    Parametros.CNPJ             := dtmFaturamentoERP.qryClienteLocalCGC_EMPRESA.AsString;
    Parametros.Produto          := cxmeProduto.Text;
    Parametros.Unidade          := cxmeUnidade.Text;
    Parametros.Processo         := cxmeProcesso.Text;
    Parametros.ProcessoCompleto := cxmeUnidade.Text + cxmeProduto.Text + StringReplace(cxmeProcesso.Text, ' ', '', [rfReplaceAll]);

    dtmFaturamentoERP.qryConsulta.Close;
    dtmFaturamentoERP.qryConsulta.SQL.Text :=
    '     SELECT C.ID,CC.CUSTOMER_ID                                                                      '+
    '       FROM BROKER.DBO.TPROCESSO           TP (NOLOCK)                                               '+
    ' INNER JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC (NOLOCK) ON CC.CUSTOMID = RTRIM(LTRIM(TP.NR_PROCESSO)) '+
    '  LEFT JOIN MYINDAIAV2.DBO.CUSTOMER        C  (NOLOCK) ON C.AKEY      = TP.CD_CLIENTE                '+
    '      WHERE TP.NR_PROCESSO = :NR_PROCESSO                                                            ';
    dtmFaturamentoERP.qryConsulta.Parameters.ParamByName('NR_PROCESSO').Value := Parametros.ProcessoCompleto;
    dtmFaturamentoERP.qryConsulta.Open;

    if dtmFaturamentoERP.qryConsulta.Fields[0].AsInteger <> dtmFaturamentoERP.qryConsulta.Fields[1].AsInteger then
      if MessageDlg('CNPJ divergente entre LOCAL e Wallet.'+#13#10+
                    'Desejar prosseguir?', mtConfirmation, [mbYes, mbNo], 0, mbNo) = mrNo then
        Exit;

    Parametros.GrupoBroker := dtmFaturamentoERP.ConsultaSQL('SELECT CD_GRUPO                       ' +
                                                            '  FROM BROKER.DBO.TPROCESSO (NOLOCK)  ' +
                                                            ' WHERE NR_PROCESSO = :AKEY            ',
                                                            [Parametros.ProcessoCompleto], '');

    Parametros.Processoid := dtmFaturamentoERP.qryCustomClearanceid.AsInteger;
    Parametros.CNPJ       := dtmFaturamentoERP.qryClienteLocalCGC_EMPRESA.AsString;

    with TfrmGeraNotaFiscal.Create(nil) do
      try
        if Execute then
        begin
          dtmFaturamentoERP.qryCustomClearance.Close;
          dtmFaturamentoERP.qryCustomClearance.Open;

          ExpandirGrids;
        end;
      finally
        Release;
        Free;
      end;
  end;
end;

procedure TfrmFaturamentoERP.SetProcesso(Processo: String);
begin
  cxmeProcesso.Text := Processo;
end;

procedure TfrmFaturamentoERP.SetProduto(Produto: String);
begin
  cxmeProduto.Text := Produto;
end;

procedure TfrmFaturamentoERP.SetUnidade(Unidade: String);
begin
  cxmeUnidade.Text := Unidade;
end;

procedure TfrmFaturamentoERP.Show(Login, Senha, Unidade, Produto, Processo: String);
begin
  Self.FLogin := Login;
  Self.FSenha := Senha;
  Self.Unidade := Unidade;
  Self.Produto := Produto;
  Self.Processo := Processo;
  inherited Show;
end;

procedure TfrmFaturamentoERP.Show(Login, Senha: String);
begin
  Show(Login, Senha, Self.Unidade, Self.Produto, Self.Processo);
end;

function TfrmFaturamentoERP.ShowModal(Login, Senha: String): Cardinal;
begin
  Result := ShowModal(Login, Senha, Self.Unidade, Self.Produto, Self.Processo);
end;

function TfrmFaturamentoERP.ShowModal(Login, Senha, Unidade, Produto, Processo: String): Cardinal;
begin
  Self.FLogin := Login;
  Self.FSenha := Senha;
  Self.Unidade := Unidade;
  Self.Produto := Produto;
  Self.Processo := Processo;
  Result := inherited ShowModal;
end;

procedure TfrmFaturamentoERP.btnPesquisarClick(Sender: TObject);
begin
  mmLog.Clear;
  BuscarProcesso;
end;

procedure TfrmFaturamentoERP.BuscarProcesso;
begin
  try
    btnPesquisar.Enabled := false;
    Screen.Cursor := crHourGlass;

    with dtmFaturamentoERP do
    begin
      if (cxteUnidade.Text <> '') and (cxteProduto.Text <> '') and (Length(StringReplace(cxmeProcesso.Text, ' ', '', [rfReplaceAll])) >= 10) then
      begin
        try
          if qryCustomClearance.Active then
            qryCustomClearance.Close;

          qryCustomClearance.Parameters.ParamValues['customID'] := cxmeUnidade.Text + cxmeProduto.Text + StringReplace(cxmeProcesso.Text, ' ', '', [rfReplaceAll]);
          qryCustomClearance.Open;

          lblProcesso.Caption := qryCustomClearancecustomID.AsString;
        except
          if qryCustomClearance.Active then
            qryCustomClearance.Close;
        end;
      end
      else
      begin
        lblProcesso.Caption := '-----------';

        if qryCustomClearance.Active then
          qryCustomClearance.Close;
      end;

      if qryCustomClearance.Active and (Trim(qryCustomClearancecustomID.AsString) <> '') then
        cxmeUnidade.Style.Color := clWindow;

      ExpandirGrids;
    end;

    if dtmfaturamentoErp.qryClienteLocal.Active then
      dtmfaturamentoErp.qryClienteLocal.Close;
    dtmfaturamentoErp.qryClienteLocal.Parameters.ParamByName('NR_PROCESSO').Value := cxmeUnidade.Text + cxmeProduto.Text + StringReplace(cxmeProcesso.Text, ' ', '', [rfReplaceAll]);
    dtmfaturamentoErp.qryClienteLocal.Open;

    if dtmfaturamentoErp.qryProcessoLocaL.Active then
      dtmfaturamentoErp.qryProcessoLocaL.Close;
    dtmfaturamentoErp.qryProcessoLocaL.Parameters.ParamByName('PROCESSO').Value := cxmeUnidade.Text + cxmeProduto.Text + StringReplace(cxmeProcesso.Text, ' ', '', [rfReplaceAll]);
    dtmfaturamentoErp.qryProcessoLocaL.Open;

    Parametros.Produto          := cxmeProduto.Text;
    Parametros.Unidade          := cxmeUnidade.Text;
    Parametros.Processo         := cxmeProcesso.Text;
    Parametros.ProcessoCompleto := cxmeUnidade.Text + cxmeProduto.Text +
                                   StringReplace(cxmeProcesso.Text, ' ', '', [rfReplaceAll]);

    Parametros.GrupoBroker      := dtmFaturamentoERP.ConsultaSQL('select CD_GRUPO ' +
                                                                 'FROM  broker.dbo.tprocesso (NOLOCK)' +
                                                                 'Where  NR_PROCESSO = :akey ',
                                                                 [Parametros.ProcessoCompleto], '');

    if Trim(Parametros.GrupoBroker) = '' then
      ShowMessage('Erro ao carregar o grupo do processo. Carregue o processo novamente.');


    Parametros.CNPJ       := dtmFaturamentoERP.qryClienteLocalCGC_EMPRESA.AsString;
    Parametros.CNPJAgente := dtmFaturamentoERP.qryProcessoLocalNR_CGC_AGENTE.AsString;

    if dtmFaturamentoERP.qryCustomClearance.state <> dsInactive then
     Parametros.Processoid := dtmFaturamentoERP.qryCustomClearanceid.AsInteger
    else
     Parametros.Processoid := 0;

  finally
    btnPesquisar.Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmFaturamentoERP.LimpaLog(Path, TipoArquivo: String);
var
  NomeArquivo : String;
  pesquisa: TSearchRec;
  dataLimite, dataArquivo: TDateTime;
  ageArquivo : Integer;
begin
  dataLimite  := IncDay(now,-5);

  if FindFirst(IncludeTrailingPathDelimiter(Path)+ '*.' + TipoArquivo, faAnyFile-faDirectory, pesquisa) = 0 then
  begin
    repeat
      if (pesquisa.Attr <> faDirectory) then
      begin
        ageArquivo := FileAge(IncludeTrailingPathDelimiter(Path)+  pesquisa.Name);
        if ageArquivo > -1  then
        begin
          dataArquivo := FileDateToDateTime(ageArquivo);
          if dataArquivo < dataLimite then
            Deletefile(IncludeTrailingPathDelimiter(Path)+  pesquisa.Name);
        end;
      end;
    until FindNext(pesquisa) <> 0;

    FindClose(pesquisa);
  end;
end;

procedure TfrmFaturamentoERP.AlterarProduto(key : Char);
begin
  if key in ['i', 'I'] then
  begin
    if cxmeProduto.text = '02' then
    begin
      cxmeProduto.Text := '01';
      cxmeProdutoExit(cxmeProduto);
    end;
  end
  else
  if key in ['e', 'E'] then
  begin
    if cxmeProduto.text = '01' then
    begin
      cxmeProduto.Text := '02';
      cxmeProdutoExit(cxmeProduto);
    end;
  end;
end;
end.


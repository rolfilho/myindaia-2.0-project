unit uPaletizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, Grids, DBGrids, DBTables,
  MemTable, DBCtrls, Menus, Mask, ToolEdit, CurrEdit, Funcoes, ConsOnLineEx;
                                          
type
  TTipoOperacao = (toFind, toCreate);

type
  TfrmPaletizacao = class(TForm)
    pnlCadastro: TPanel;
    scbMain: TScrollBox;
    btnIncluir: TSpeedButton;
    btnSair: TSpeedButton;
    dsPalets: TDataSource;
    dbgrdDebug: TDBGrid;
    mtblPalets: TMemoryTable;
    mtblPaletsCD_PALET: TIntegerField;
    mtblPaletsCD_NIVEL: TIntegerField;
    mtblPaletsCD_CAIXA: TIntegerField;
    mtblPaletsTX_NOME_CAIXA: TStringField;
    mtblPaletsTX_NOME_PAI: TStringField;
    mtblPaletsVL_QTD_FILHO: TIntegerField;
    mtblPaletsTX_ITENS_PROCESSO: TStringField;
    mtblPaletsTX_CAMINHO: TStringField;
    mtblPaletsTX_EDIT_CAIXA: TStringField;
    pnlProcessoItem: TPanel;
    btnBaixaItem: TSpeedButton;
    btnCancelaBaixa: TSpeedButton;
    dbgrdProcessoItem: TDBGrid;
    dsProcessoExpItem: TDataSource;
    qryProcessoExpItem: TQuery;
    updProcessoExpItem: TUpdateSQL;
    qryProcessoExpItemNR_PROCESSO: TStringField;
    qryProcessoExpItemNR_ITEM: TStringField;
    qryProcessoExpItemCD_MERCADORIA: TStringField;
    qryProcessoExpItemQT_MERCADORIA: TFloatField;
    qryProcessoExpItemQT_BAIXADA: TFloatField;
    qryProcessoExpItemcalcQtdeDisponivel: TFloatField;
    dsProcessoPaletizacao: TDataSource;
    qryProcessoPaletizacao: TQuery;
    updProcessoPaletizacao: TUpdateSQL;
    qryProcessoPaletizacaoNR_PROCESSO: TStringField;
    qryProcessoPaletizacaoCD_CAMINHO: TIntegerField;
    qryProcessoPaletizacaoTX_CAMINHO: TStringField;
    qryProcessoPaletizacaoNR_ITEM: TStringField;
    qryProcessoPaletizacaoVL_QTDE: TFloatField;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnlShowItensCaixa: TPanel;
    pnlQtdeItens: TPanel;
    lblnrItem: TLabel;
    lblMercadoria: TLabel;
    lblQtdeItem: TLabel;
    lblQtdeDisp: TLabel;
    btnOk: TBitBtn;
    mskQtdeItem: TCurrencyEdit;
    mskQtdeDisp: TCurrencyEdit;
    dbgrdShowItens: TDBGrid;
    btnEstornaItem: TSpeedButton;
    btnCancelaEstorno: TSpeedButton;
    mtblShowItens: TMemoryTable;
    dsShowItens: TDataSource;
    mtblShowItensNR_ITEM: TStringField;
    mtblShowItensCD_MERCADORIA: TStringField;
    mtblShowItensQT_MERCADORIA: TFloatField;
    edtNrItem: TEdit;
    edtMercadoria: TEdit;
    qryUltimoCodigo: TQuery;
    qryUltimoCodigoULTIMO: TIntegerField;
    pnlEspaco: TPanel;
    pnlLabels: TPanel;
    pnlExibeNivel: TPanel;
    popPaletizacao: TPopupMenu;
    mniExcluir: TMenuItem;
    btn1: TSpeedButton;
    shp1: TShape;
    shp2: TShape;
    shp3: TShape;
    mniCancelar: TMenuItem;
    btnPackingList: TSpeedButton;
    qryProcessoPaletizacaoCD_MERCADORIA: TStringField;
    lblUnidade: TLabel;
    mskUnidade: TMaskEdit;
    edtUnidade: TEdit;
    btnUnidade: TSpeedButton;
    lblProcesso: TLabel;
    mskNrProcesso: TMaskEdit;
    btnProcesso: TSpeedButton;
    chkProcessos: TCheckBox;
    shp4: TShape;
    edtPesqMercInc: TEdit;
    lblPesqMercIns: TLabel;
    lblPesqMercEst: TLabel;
    edtPesqMercEst: TEdit;
    qryProcessoExpItemAP_MERCADORIA: TStringField;
    mtblShowItensAP_MERCADORIA: TStringField;
    lblCaixaEstorno: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lblCaixaBaixar: TLabel;
    qryProcessoPaletizacaoVL_PESO_BRUTO: TFloatField;
    qryProcessoPaletizacaoVL_M3: TFloatField;
    qryProcessoPaletizacaoAP_MERCADORIA: TStringField;
    mtblPaletsVL_PESO_BRUTO: TFloatField;
    mtblPaletsVL_CUBAGEM: TFloatField;
    lblPesoLiq: TLabel;
    mskPesoLiq: TCurrencyEdit;
    mtblPaletsVL_PESO_LIQUIDO: TFloatField;
    qryProcessoPaletizacaoVL_PESO_LIQUIDO: TFloatField;
    mtblShowItensVL_PESO_LIQUIDO: TFloatField;
    btnCancelBaixaEstorno: TBitBtn;
    qryProcessoExpItemcalcPesoLiquido: TFloatField;
    qryProcessoExpItemVL_PESO_LIQ_UNIT: TFloatField;
    chkAlterPesoLiq: TCheckBox;
    btnZerar: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure mtblPaletsAfterPost(DataSet: TDataSet);
    procedure btn1Click(Sender: TObject);
    procedure btnBaixaItemClick(Sender: TObject);
    procedure btnCancelaBaixaClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure qryProcessoExpItemAfterPost(DataSet: TDataSet);
    procedure qryProcessoExpItemCalcFields(DataSet: TDataSet);
    procedure btnEstornaItemClick(Sender: TObject);
    procedure btnCancelaEstornoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure mniExcluirClick(Sender: TObject);
    procedure btnPackingListClick(Sender: TObject);
    procedure mskUnidadeExit(Sender: TObject);
    procedure mskNrProcessoExit(Sender: TObject);
    procedure btnUnidadeClick(Sender: TObject);
    procedure btnProcessoClick(Sender: TObject);
    procedure edtPesqMercIncChange(Sender: TObject);
    procedure edtPesqMercEstChange(Sender: TObject);
    procedure edtKeyPress(Sender: TObject; var Key: Char);
    procedure edtChange(Sender: TObject);
    procedure btnCancelBaixaEstornoClick(Sender: TObject);
    procedure chkAlterPesoLiqClick(Sender: TObject);
    procedure btnZerarClick(Sender: TObject);
  private
    { Private declarations }
    vNomePanel: string;
    vPnlPalet, vPnlNivel, vPnlCaixa: TPanel;
    vWinPalet, vWinNivel, vWinCaixa: TWinControl;
    vNumPalet, vCaixaSelec, vCaixaPos: Integer;
    aItensCx: array of array of string;
    function pnlPalet(pOperacao: TTipoOperacao; pNumPalet: Integer) : TPanel;
    function pnlNivel(pOperacao: TTipoOperacao; pNumPalet, pNumNivel: Integer) : TPanel;
    function pnlCaixa(pOperacao: TTipoOperacao; pNumPalet, pNumNivel, pNumCaixa: Integer; vObjetoPai: string) : TPanel;
    function NomeCaixa(pOperacao: TTipoOperacao; pNumPalet, pNumNivel, pNumCaixa: Integer; vObjetoPai: string) : string;
    procedure CriaObjetos(pNumPalet, pNumNivel, pNumCaixa: Integer; vObjetoPai: string);
    procedure AjustaPalet(pNumPalet: Integer);
    procedure btnCaixaClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure TravaPalets(pTrava: Boolean);
    function CriaArrayItensQtde(pNomePanelCaixa: string): Boolean;
    function GetPanel(Sender: TObject): TPanel;
    function VerificaEdit(pPanel: TPanel): Boolean;
    procedure imgDelClick(Sender: TObject);
    procedure imgDelContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    function VerificaQtdeMerc: Boolean;
  public
    { Public declarations }
    vNrProcesso: string;
  end;

const
  cWidth: Integer = 125;
  cHeight: Integer = 100;

var
  frmPaletizacao: TfrmPaletizacao;

implementation

uses GSMLIB, PGGP001, PGGP017, uPackingList;

{$R *.dfm}

function TfrmPaletizacao.pnlPalet(pOperacao: TTipoOperacao; pNumPalet: Integer) : TPanel;
var
  pPalet: string;
begin
  pPalet := 'pnlPalet_'+PutZeroEsquerda(IntToStr(pNumPalet),2);
  //cria ou procura o TPANEL palet(container/palet onde estão as caixas)
  if pOperacao = toCreate then
  begin
    with TPanel.Create(scbMain) do
    begin
      Top         := 1;
      Align       := alTop;
      BevelInner  := bvNone;
      BevelOuter  := bvNone;
      Height      := cHeight+2;
      Name        := pPalet;
      Caption     := '';
      Parent      := scbMain;
      ParentColor := True;
      Tag         := pNumPalet;
      Visible     := True;
      Width       := scbMain.Width;
    end;
    with TShape.Create(scbMain) do
    begin
      Top      := cHeight+20;
      Align    := alTop;
      Brush.Style := bsClear;
      Name     := 'shpDiv1_'+PutZeroEsquerda(IntToStr(pNumPalet),2);
      Parent   := scbMain;
      Pen.Color := clNavy;
      Pen.Mode := pmMask;
      Shape    := stRoundRect;
      Height   := 1;
    end;
    with TShape.Create(scbMain) do
    begin
      Top      := cHeight+21;
      Align    := alTop;
      Brush.Style := bsClear;
      Name     := 'shpDiv2_'+PutZeroEsquerda(IntToStr(pNumPalet),2);
      Parent   := scbMain;
      Pen.Color := clInfoBk;
      Pen.Mode := pmMask;
      Shape    := stRoundRect;
      Height   := 2;
    end;
  end else if pOperacao = toFind then
  begin
    Result := TPanel(scbMain.FindComponent(pPalet));
  end;
end;

function TfrmPaletizacao.pnlNivel(pOperacao: TTipoOperacao; pNumPalet, pNumNivel: Integer) : TPanel;
var
  pNivel: string;
begin
  pNivel := 'pnlNivel_'+PutZeroEsquerda(IntToStr(pNumPalet),2)+'_'+PutZeroEsquerda(IntToStr(pNumNivel),1);
  //cria ou procura o TPANEL nível(palet/nível onde estão os caixas)
  if pOperacao = toCreate then
  begin
    with TPanel.Create(pnlPalet(toFind,pNumPalet)) do
    begin
      Align      := alLeft;
      BevelInner := bvNone;
      BevelOuter := bvNone;
      Left       := cWidth*pNumNivel;
      Name       := pNivel;
      Caption    := '';
      Parent     := pnlPalet(toFind,pNumPalet);
      ParentColor := True;
      Tag        := pNumNivel;
      Visible    := True;
      Width      := cWidth;
    end;
  end else if pOperacao = toFind then
  begin
    Result := TPanel(pnlPalet(toFind,pNumPalet).FindComponent(pNivel));
  end;
end;

function TfrmPaletizacao.pnlCaixa(pOperacao: TTipoOperacao; pNumPalet, pNumNivel, pNumCaixa: Integer; vObjetoPai: string) : TPanel;
var
  pNomeCaixa: string;
  pPalet, pNivel, pCaixa: Integer;
begin
  pNomeCaixa := NomeCaixa(toFind,pNumPalet,pNumNivel,pNumCaixa,'');
  //cria ou procura o TPANEL nível(palet/nível onde estão as caixa)
  if pOperacao = toCreate then
  begin
    //verifica o tipo de componente e define onde será criada as caixas
    if Trim(vObjetoPai) <> '' then
    begin
      pPalet := StrToInt(ExtractWord(2,vObjetoPai,'_'));
      pNivel := StrToInt(ExtractWord(3,vObjetoPai,'_'));
      pCaixa := StrToInt(ExtractWord(4,vObjetoPai,'_'));
      vPnlNivel := pnlCaixa(toFind,pPalet,pNivel,pCaixa,'');
    end
    else
      vPnlNivel := pnlNivel(toFind,pNumPalet,pNumNivel);

    with TPanel.Create(vPnlNivel) do
    begin
      BevelInner := bvNone;
      BevelOuter := bvNone;
      Height     := cHeight;
      Left       := 0;
      Name       := pNomeCaixa;
      Caption    := '';
      Parent     := pnlNivel(toFind,pNumPalet,pNumNivel);
      ParentColor := True;
      Tag        := pNumCaixa;
      Top        := 0;
      Visible    := True;
      Width      := cWidth;
    end;
  end else if pOperacao = toFind then
  begin
    if pNumNivel > 1 then
    begin
      if mtblPalets.Locate('TX_NOME_CAIXA',pNomeCaixa,[loCaseInsensitive]) then
      begin
        pPalet := StrToInt(ExtractWord(2,mtblPaletsTX_NOME_PAI.AsString,'_'));
        pNivel := StrToInt(ExtractWord(3,mtblPaletsTX_NOME_PAI.AsString,'_'));
        pCaixa := StrToInt(ExtractWord(4,mtblPaletsTX_NOME_PAI.AsString,'_'));
        Result := TPanel(pnlCaixa(toFind,pPalet,pNivel,pCaixa,'').FindComponent(pNomeCaixa));
      end
      else
        Result := nil;
    end
    else
      Result := TPanel(pnlNivel(toFind,pNumPalet,pNumNivel).FindComponent(pNomeCaixa));
  end;
end;

function TfrmPaletizacao.NomeCaixa(pOperacao: TTipoOperacao; pNumPalet, pNumNivel, pNumCaixa: Integer; vObjetoPai: string) : string;
var
  vCodPalet, vCodNivel, vCodCaixa, vNomeCaixa, vCaminho: string;
  vQtdFilho: Integer;
begin
//Aqui, qdo passava de 100  dava erro, alterado para verificar o Len da variável antes de concatenar com ZEROS
//Rodrigo Capra - 19/02/2008            //  vCodPalet := PutZeroEsquerda(IntToStr(pNumPalet),2);
  vCodPalet := PutZeroEsquerda(IntToStr(pNumPalet),4-Length(IntToStr(pNumPalet)));
  vCodNivel := PutZeroEsquerda(IntToStr(pNumNivel),1);
  vCodCaixa := PutZeroEsquerda(IntToStr(pNumCaixa),1);
  //monta o nome do panel de caixas
  vNomeCaixa := 'pnlCaixa_'+vCodPalet+'_'+vCodNivel+'_'+vCodCaixa+'_';
  //verifica se esse nome existe
  if pOperacao = toCreate then
  begin
    try
      //verifica se a caixa criada esta dentro de outra caixa
      if Trim(vObjetoPai) <> '' then
      begin
        if mtblPalets.Locate('TX_NOME_CAIXA',vObjetoPai,[loCaseInsensitive]) then
        begin
          vQtdFilho := mtblPaletsVL_QTD_FILHO.AsInteger;
          vCaminho  := mtblPaletsTX_CAMINHO.AsString;
          mtblPalets.Edit;
          mtblPaletsVL_QTD_FILHO.AsInteger := vQtdFilho + 1;
          mtblPalets.Post;
        end;
      end;
      //insere o novo registro
      mtblPalets.Insert;
      mtblPaletsCD_PALET.AsInteger      := pNumPalet;
      mtblPaletsCD_NIVEL.AsInteger      := pNumNivel;
      mtblPaletsCD_CAIXA.AsInteger      := pNumCaixa;
      mtblPaletsTX_NOME_CAIXA.AsString  := vNomeCaixa;
      mtblPaletsTX_NOME_PAI.AsString    := vObjetoPai;
      mtblPaletsVL_QTD_FILHO.AsInteger  := 0;
      mtblPaletsTX_CAMINHO.AsString     := vCaminho + vNomeCaixa +'|';
      mtblPaletsVL_PESO_BRUTO.AsFloat   := 0.0;
      mtblPaletsVL_CUBAGEM.AsFloat      := 0.0;
      mtblPalets.Post;
      //posiciona na tabela a caixa
      mtblPalets.Locate('TX_NOME_CAIXA',vNomeCaixa,[loCaseInsensitive]);
    except
      on E: Exception do
      begin
        TrataErro(E);
        Exit;
      end;
    end;
  end;
  //retorna o nome da caixa
  Result := vNomeCaixa;
end;

procedure TfrmPaletizacao.CriaObjetos(pNumPalet, pNumNivel, pNumCaixa: Integer; vObjetoPai: string);
var
  pNomeCaixa: string;
  pPalet, pNivel, pCaixa: Integer;
begin
  pPalet := StrToInt(ExtractWord(2,vObjetoPai,'_'));
  pNivel := StrToInt(ExtractWord(3,vObjetoPai,'_'));
  pCaixa  := StrToInt(ExtractWord(4,vObjetoPai,'_'));
  //define o onwer e parent dos objetos caixa
  vPnlCaixa := pnlCaixa(toFind,pPalet,pNivel,pCaixa,'');
  //cria parte do nome dos objetos da caixa (codigo do palet_nivel_caixa)
  pNomeCaixa := Copy(vPnlCaixa.Name, 10, 9);
  //cria os componentes dentro do PANEL caixa
  with TShape.Create(vPnlCaixa) do begin
    Align    := alClient;
    Brush.Color := clSkyBlue;
    Name     := 'shpCaixa_'+pNomeCaixa;
    Parent   := vPnlCaixa;
    Pen.Color := clNavy;
    Pen.Mode := pmMask;
    Shape    := stRoundRect;
  end;

  with TEdit.Create(vPnlCaixa) do begin
    AutoSize := False;
    BevelKind := bkFlat;
    BevelOuter := bvNone;
    Height   := 19;
    Left     := 5;
    Name     := 'edtCaixa_'+pNomeCaixa;
    OnChange := edtChange;
    Parent   := vPnlCaixa;
    ParentCtl3D := False;
    Ctl3D    := False;
    Text     := '';
    Top      := 5;
    Width    := cWidth-25;
  end;

  with TLabel.Create(vPnlCaixa) do begin
    Caption    := 'Pb:';
    Font.Style := [fsBold];
    Name       := 'lblPesoBruto_'+pNomeCaixa;
    Parent     := vPnlCaixa;
    Left       := 5;
    Top        := 29;
    Transparent := True;
  end;

  with TLabel.Create(vPnlCaixa) do begin
    Caption    := 'M3:';
    Font.Style := [fsBold];
    Name       := 'lblCubagem_'+pNomeCaixa;
    Parent     := vPnlCaixa;
    Left       := 5;
    Top        := 50;
    Transparent := True;
  end;

  with TEdit.Create(vPnlCaixa) do begin
    AutoSize := False;
    BevelKind := bkFlat;
    BevelOuter := bvNone;
    Height   := 19;
    Left     := 30;
    Name     := 'edtPesoBruto_'+pNomeCaixa;
    OnChange := edtChange;
    OnKeyPress := edtKeyPress;
    Parent   := vPnlCaixa;
    ParentCtl3D := False;
    Ctl3D    := False;
    Text     := '0,0';
    Top      := 26;
    Width    := cWidth-50;
  end;

  with TEdit.Create(vPnlCaixa) do begin
    AutoSize := False;
    BevelKind := bkFlat;
    BevelOuter := bvNone;
    Height   := 19;
    Left     := 30;
    Name     := 'edtCubagem_'+pNomeCaixa;
    OnChange := edtChange;
    OnKeyPress := edtKeyPress;
    Parent   := vPnlCaixa;
    ParentCtl3D := False;
    Ctl3D    := False;
    Text     := '0,0';
    Top      := 47;
    Width    := cWidth-50;
  end;

  with TSpeedButton.Create(vPnlCaixa) do begin
    Flat     := True;
    Glyph.LoadFromFile('btnAddCaixa.bmp');
    Height   := 28;
    Hint     := 'Cria uma nova caixa dentro desta.';
    Left     := 15;
    Name     := 'btnCaixa_'+pNomeCaixa;
    OnClick  := btnCaixaClick;
    Parent   := vPnlCaixa;
    ShowHint := True;
    Top      := 69;
    Width    := 28;
  end;

  with TSpeedButton.Create(vPnlCaixa) do begin
    Flat     := True;
    Glyph.LoadFromFile('btnAddItem.bmp');
    Height   := 28;
    Hint     := 'Adciona itens dentro desta caixa.';
    Left     := 45;
    Name     := 'btnAdd_'+pNomeCaixa;
    OnClick  := btnAddClick;
    Parent   := vPnlCaixa;
    ShowHint := True;
    Top      := 69;
    Width    := 28;
  end;

  with TSpeedButton.Create(vPnlCaixa) do begin
    Flat     := True;
    Glyph.LoadFromFile('btnShowItem.bmp');
    Height   := 28;
    Hint     := 'Exibe os itens contidos dentro desta caixa.';
    Left     := 75;
    Name     := 'btnShow_'+pNomeCaixa;
    OnClick  := btnShowClick;
    Parent   := vPnlCaixa;
    ShowHint := True;
    Top      := 69;
    Width    := 28;
  end;

  with TImage.Create(vPnlCaixa) do begin
    Height  := 15;
    Left    := cWidth-18;
    Name    := 'imgDel_'+pNomeCaixa;
    OnClick := imgDelClick;
    OnContextPopup := imgDelContextPopup;
    Parent  := vPnlCaixa;
    Picture.LoadFromFile('btnExcluiCaixa.bmp');
    PopupMenu := popPaletizacao;
    Transparent := True;
    Top     := 7;
    Width   := 15;
  end;
  //posiciona o cursor no edit criado
  TEdit(vPnlCaixa.FindComponent('edtCaixa_'+pNomeCaixa)).SetFocus;
end;

procedure TfrmPaletizacao.AjustaPalet(pNumPalet: Integer);
var
  vHeightPalet, vWidthPalet, vCont: Integer;
  vCodPalet, vCodNivel, vCodCaixa: Integer;
begin
  vHeightPalet := 0;
  for vCodNivel := 1 to 99 do
    if pnlNivel(toFind,pNumPalet,vCodNivel) = nil then
      Break
    else
      for vCodCaixa := 1 to 99 do
      begin
        vPnlCaixa := pnlCaixa(toFind,pNumPalet,vCodNivel,vCodCaixa,'');
        if vPnlCaixa <> nil then
          if vHeightPalet < vPnlCaixa.Top then vHeightPalet := vPnlCaixa.Top;
      end;
  pnlPalet(toFind,pNumPalet).Height := vHeightPalet+cHeight+2;

  vWidthPalet := 0;
  for vCodPalet := 1 to vNumPalet do
    if pnlPalet(toFind,vCodPalet) <> nil then
    begin
      vCont := 0;
      for vCodNivel := 1 to 99 do
        if pnlNivel(toFind,vCodPalet,vCodNivel) <> nil then vCont := vCont + 1;
      if vCont > vWidthPalet then vWidthPalet := vCont;
    end;
  pnlEspaco.Width := cWidth*vWidthPalet;
  pnlExibeNivel.Width := cWidth*vWidthPalet;
end;

procedure TfrmPaletizacao.btnCaixaClick(Sender: TObject);
var
  vCodNivel, vCodCaixa, vTopCaixa, vNumCxPai, vQtdFilhos: Integer;
  vNomeCaixa: string;
  pnlCxFilho, pnlCxPai: TPanel;
begin
  vPnlCaixa := GetPanel(Sender);
  //cria uma nova caixa
  if VerificaEdit(vPnlCaixa) then
  begin
    //verifica se o pai do novo painel já tem filhos
    if mtblPalets.Locate('TX_NOME_CAIXA',vPnlCaixa.Name,[loCaseInsensitive]) then
      //se tiver, verifica qual a proxima caixa no nível
      for vCodCaixa := mtblPaletsVL_QTD_FILHO.AsInteger+1 to 99 do
      begin
        vNomeCaixa := NomeCaixa(toFind, vWinPalet.Tag, (vWinNivel.Tag+1), vCodCaixa, vPnlCaixa.Name);
        if Not mtblPalets.Locate('TX_NOME_CAIXA',vNomeCaixa,[loCaseInsensitive]) then Break;
      end
    else vCodCaixa := 1;
    //cria e retona o nome da nova caixa
    vNomeCaixa := NomeCaixa(toCreate, vWinPalet.Tag, (vWinNivel.Tag+1), vCodCaixa, vPnlCaixa.Name);
    //posiciona no registro da caixa pai
    mtblPalets.Locate('TX_NOME_CAIXA', mtblPaletsTX_NOME_PAI.AsString, [loCaseInsensitive]);
    vQtdFilhos := mtblPaletsVL_QTD_FILHO.AsInteger;
    pnlCxPai   := pnlCaixa(toFind, vWinPalet.Tag, vWinNivel.Tag, mtblPaletsCD_CAIXA.AsInteger, '');

    if vQtdFilhos = 1 then
      //se tiver somente 1 filho, a caixa(filho) terá o mesmo top do pai
      vTopCaixa := pnlCxPai.Top
    else
    begin
      //se for mais de 1 o top inicial da caixa será a altura do palet-2
      vTopCaixa := pnlPalet(toFind, vWinPalet.Tag).Height-2;
      //verifica todos panels caixa do nível da caixa pai
      for vNumCxPai := 1 to 99 do
      begin
        pnlCxFilho := pnlCaixa(toFind, vWinPalet.Tag, vWinNivel.Tag, vNumCxPai, '');
        if pnlCxFilho <> nil then
          if pnlCxFilho.Top > pnlCxPai.Top then
            if vTopCaixa > pnlCxFilho.Top then vTopCaixa := pnlCxFilho.Top;
      end;
      //Verifica se o top da caixa(filho) está correto dadas as condições
      if ((vWinNivel.Tag+1) > 3) and (vTopCaixa > cHeight*(vQtdFilhos-1) + pnlCxPai.Top) and
         (pnlNivel(toFind, vWinPalet.Tag, (vWinNivel.Tag+2)) = nil) then
        //se as condições acima forem abedecidas, ajusta o top
        vTopCaixa := cHeight*(vQtdFilhos-1) + pnlCxPai.Top;
      //ajusta o top de todas as caixas abaixo da caixa criada
      for vCodNivel := 1 to 99 do
        if pnlNivel(toFind, vWinPalet.Tag, vCodNivel) = nil then
          Break
        else
          for vNumCxPai := 1 to 99 do
          begin
            pnlCxFilho := pnlCaixa(toFind, vWinPalet.Tag, vCodNivel, vNumCxPai,'');
            if pnlCxFilho <> nil then
              if pnlCxFilho.Top >= vTopCaixa then pnlCxFilho.Top := pnlCxFilho.Top + cHeight;
          end;
    end;
    //seta o top da caixa(filho) criado
    pnlCaixa(toFind, vWinPalet.Tag, (vWinNivel.Tag+1), vCodCaixa, '').Top := vTopCaixa;
    AjustaPalet(vWinPalet.Tag);
  end;
  mtblPalets.Locate('TX_NOME_CAIXA', vNomeCaixa, [loCaseInsensitive]);
end;

procedure TfrmPaletizacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mtblShowItens.Close;
  mtblPalets.Close;
  qryProcessoPaletizacao.Close;
  qryProcessoExpItem.Close;

  Action := caFree;
end;

procedure TfrmPaletizacao.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  //zera o contador de containeres/palets
  vNumPalet := 0;
  //cria o cabeçalho com o label dos niveis
  for i := 1 to 99 do
  begin
    with TLabel.Create(pnlExibeNivel) do
    begin
      Left        := 0;
      Width       := cWidth;
      Align       := alLeft;
      Alignment   := taCenter;
      AutoSize    := False;
      Name        := 'lblNivel_'+PutZeroEsquerda(IntToStr(i),1);
      Parent      := pnlExibeNivel;
      Caption     := 'Nível '+IntToStr(i);
      Font.Color  := clSkyBlue;
      Font.Height := -11;
      Font.Name   := 'MS Sans Serif';
      Font.Style  := [fsBold];
    end;
  end;

  if vNrProcesso <> '' then
    Caption := 'Paletização [Processo: '+ Copy(vNrProcesso, 5, 13) +']'
  else
    Caption := 'Paletização';
end;

procedure TfrmPaletizacao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  //se pressionar ESC encerra
  if Key = VK_ESCAPE then btnSairClick(nil);
end;

procedure TfrmPaletizacao.FormShow(Sender: TObject);
begin
  pnlCadastro.Color := clMenuBroker;
  mtblPalets.Open;

  if vNrProcesso <> '' then
  begin
    mskUnidade.Text := Copy(vNrProcesso, 1, 2);
    mskUnidadeExit(nil);

    mskNrProcesso.Text := Copy(vNrProcesso, 5, 13);
    mskNrProcessoExit(nil);
  end
  else
  begin
    mskUnidade.Text := str_cd_unid_neg;
    mskUnidadeExit(nil);
  end;
  btn1.Visible := (str_cd_cargo = '001');
end;

procedure TfrmPaletizacao.btnIncluirClick(Sender: TObject);
begin
  ActiveControl := nil;
  //cria um novo container/palet
  Inc(vNumPalet);
  NomeCaixa(toCreate, vNumPalet, 1, 1, '');
  AjustaPalet(vNumPalet);
  //verifica se a quantidade maxima de palets foi atingida
  if vNumPalet >= 999 then btnIncluir.Enabled := False;
end;

procedure TfrmPaletizacao.btnSairClick(Sender: TObject);
begin
  ActiveControl := nil;
  //verifica se já existem palets, se existir limpa avisa usuário e pede para salvar antes de continuar
  if (vNumPalet > 0) and btnSalvar.Enabled then
    if Application.MessageBox('Deseja salvar a paletização antes de sair?','Salvar',MB_YESNO+MB_ICONQUESTION) = IDYES then
      btnSalvarClick(nil);
  //fecha o form
  Close;
end;

procedure TfrmPaletizacao.mtblPaletsAfterPost(DataSet: TDataSet);
var
  pNumPalet, pNumNivel, pNumCaixa: Integer;
  vNomePai, vNomeCaixa: string;
begin
  //recupera informação da tabela
  pNumPalet := mtblPaletsCD_PALET.AsInteger;
  pNumNivel := mtblPaletsCD_NIVEL.AsInteger;
  pNumCaixa := mtblPaletsCD_CAIXA.AsInteger;
  vNomePai  := mtblPaletsTX_NOME_PAI.AsString;
  vNomeCaixa := mtblPaletsTX_NOME_CAIXA.AsString;
  //cria palet/nível/caixa
  if pnlPalet(toFind,pNumPalet) = nil then pnlPalet(toCreate,pNumPalet);
  if pnlNivel(toFind,pNumPalet,pNumNivel) = nil then pnlNivel(toCreate,pNumPalet,pNumNivel);
  if pnlCaixa(toFind,pNumPalet,pNumNivel,pNumCaixa,'') = nil then
  begin
    pnlCaixa(toCreate,pNumPalet,pNumNivel,pNumCaixa,vNomePai);
    //cria os itens dentro do panel caixa
    CriaObjetos(pNumPalet,pNumNivel,pNumCaixa,vNomeCaixa);
  end;
  btnSalvar.Enabled      := True;
  btnCancelar.Enabled    := True;
  btnPackingList.Enabled := False;
end;

procedure TfrmPaletizacao.btn1Click(Sender: TObject);
begin
  dbgrdDebug.Visible := (not dbgrdDebug.Visible);
  dbgrdDebug.Height := 150;
end;

procedure TfrmPaletizacao.btnAddClick(Sender: TObject);
var
  pEdit: TEdit;
begin
  //adiciona itens a caixa
  vPnlCaixa := GetPanel(Sender);
  vNomePanel := vPnlCaixa.Name;
  if not VerificaEdit(vPnlCaixa) then Exit;
  CriaArrayItensQtde(vPnlCaixa.Name);
  //exibe o panel com itens e trava todos palets
  pEdit := TEdit(vPnlCaixa.FindComponent('edtCaixa_'+Copy(vPnlCaixa.Name,10,9)));
  lblCaixaBaixar.Caption := pEdit.Text;
  pnlProcessoItem.Visible := True;
  pnlProcessoItem.BringToFront;
  edtPesqMercInc.SetFocus;
  TravaPalets(False);
end;

procedure TfrmPaletizacao.btnShowClick(Sender: TObject);
var
  i: Integer;
  pEdit: TEdit;
begin
  vPnlCaixa  := GetPanel(Sender);
  vNomePanel := vPnlCaixa.Name;
  if CriaArrayItensQtde(vPnlCaixa.Name) then
  begin
    //lê todo o array e insere em mtblShowItens
    mtblShowItens.Close;
    mtblShowItens.Open;
    for i := 0 to High(aItensCx) do
    begin
      mtblShowItens.Insert;
      mtblShowItensNR_ITEM.AsString := aItensCx[i,0];
      mtblShowItensCD_MERCADORIA.AsString := ConsultaLookUPSQL('SELECT CD_MERCADORIA FROM TPROCESSO_EXP_ITEM (NOLOCK) '+
        'WHERE NR_PROCESSO = '''+ vNrProcesso +''' AND NR_ITEM = '''+ aItensCx[i,0] +''' ','CD_MERCADORIA');
      mtblShowItensAP_MERCADORIA.AsString := ConsultaLookUPSQL('SELECT AP_MERCADORIA FROM TMERCADORIA_EXP (NOLOCK) '+
        'WHERE CD_MERCADORIA = '''+ mtblShowItensCD_MERCADORIA.AsString +''' ','AP_MERCADORIA');
      mtblShowItensQT_MERCADORIA.AsFloat := StrToFloat(aItensCx[i,1]);
      mtblShowItensVL_PESO_LIQUIDO.AsFloat := StrToFloat(aItensCx[i,2]);
      mtblShowItens.Post;
    end;

    if High(aItensCx) > -1 then
    begin
      //exibe o panel com itens e trava todos palets
      pEdit := TEdit(vPnlCaixa.FindComponent('edtCaixa_'+Copy(vPnlCaixa.Name,10,9)));
      lblCaixaEstorno.Caption := pEdit.Text;
      pnlShowItensCaixa.Visible := True;
      pnlShowItensCaixa.BringToFront;
      edtPesqMercEst.SetFocus;
      TravaPalets(False);
    end
    else
      Application.MessageBox('Não existem itens inseridos nesta caixa!','Informação',MB_OK+MB_ICONINFORMATION);
  end;
end;

procedure TfrmPaletizacao.TravaPalets(pTrava: Boolean);
var
  i: Integer;
begin
  for i := 1 to vNumPalet do
  begin
    vPnlPalet := pnlPalet(toFind, i);
    if vPnlPalet <> nil then
      vPnlPalet.Enabled := pTrava;
  end;
  btnIncluir.Enabled  := pTrava;
  btnSalvar.Enabled   := pTrava;
  btnCancelar.Enabled := pTrava;
end;

function TfrmPaletizacao.CriaArrayItensQtde(pNomePanelCaixa: string): Boolean;
var
  sItens, sItem: string;
  i: Integer;
begin
  //posiciona no registro do panel
  if mtblPalets.Locate('TX_NOME_CAIXA',pNomePanelCaixa,[loCaseInsensitive]) then
  begin
    //verifica se já existem itens no panel, se tiver monta um array com eles
    if mtblPaletsTX_ITENS_PROCESSO.AsString <> '' then
    begin
      sItens := mtblPaletsTX_ITENS_PROCESSO.AsString;
      i := 0;
      while Length(sItens) > 0 do
      begin
        SetLength(aItensCx,(i+1));                                    //aumenta o tamanho do array
        SetLength(aItensCx[i], 3);                                    //seta para 3 o array do item
        sItem := Copy(sItens,0,Pos('/',sItens)-1);                    //copia o item e qtde para string
        aItensCx[i,0] := Copy(sItem,0,Pos(';',sItem)-1);              //copia o código do item
        sItem := Copy(sItem,Pos(';',sItem)+1,Length(sItem));          //remove o código do item da string
        aItensCx[i,1] := Copy(sItem,0,Pos(';',sItem)-1);              //copia a qtde do item
        sItem := Copy(sItem,Pos(';',sItem)+1,Length(sItem));          //remove qtde do item da string
        aItensCx[i,2] := sItem;                                       //copia o peso liquido do item
        sItens := Copy(sItens,Pos('/',sItens)+1,Length(sItens));      //remove o item copiado da string
        Inc(i);                                                       //incrementa o indice para o proximo item do array
      end;
    end
    else SetLength(aItensCx, 0);
    Result := True;
  end
  else
  begin
    Application.MessageBox('Não foi possível encontrar o regitro na tabela!'+#13#10+
      'Por favor informe o desenvolvimento','Erro',MB_OK+MB_ICONERROR);
    Result := False;
  end;
end;  

function TfrmPaletizacao.GetPanel(Sender: TObject): TPanel;
begin
  vWinCaixa := TButton(Sender).Parent;
  vWinNivel := vWinCaixa.Parent;
  vWinPalet := vWinNivel.Parent;
  //busca o panel onde serão inseridos os itens
  Result := pnlCaixa(toFind, vWinPalet.Tag, vWinNivel.Tag, vWinCaixa.Tag, '');
end;

function TfrmPaletizacao.VerificaEdit(pPanel: TPanel): Boolean;
var
  pEdit: TEdit;
begin
  pEdit := TEdit(pPanel.FindComponent('edtCaixa_'+Copy(pPanel.Name,10,9)));
  //se o panel não tiver um nome obriga a colocar
  if Trim(pEdit.Text) = '' then
  begin
    Application.MessageBox('Para inserir itens na caixa, deve-se dar um nome a ela!','Atenção',MB_OK+MB_ICONWARNING);
    pEdit.SetFocus;
    Result := False;
  end
  else Result := True;
end;  

procedure TfrmPaletizacao.btnBaixaItemClick(Sender: TObject);
begin
  vCaixaPos := 0;
  if dbgrdProcessoItem.SelectedRows.Count <> 0 then
  begin
    //pega numero de linhas selecionadas
    vCaixaSelec := dbgrdProcessoItem.SelectedRows.Count;
    //posiciona no primeiro registro que estiver selecionado e incrementa 1 na posição
    qryProcessoExpItem.GotoBookmark(TBookMark(dbgrdProcessoItem.SelectedRows[vCaixaPos]));
    Inc(vCaixaPos);
    //seta os edits de qtde a baixar e disponivel com a qtde disponivel.
    edtNrItem.Text := qryProcessoExpItemNR_ITEM.AsString;
    edtMercadoria.Text := qryProcessoExpItemCD_MERCADORIA.AsString;
    mskQtdeItem.Value := qryProcessoExpItem.FieldByName('calcQtdeDisponivel').AsFloat;
    mskPesoLiq.Value := qryProcessoExpItem.FieldByName('calcPesoLiquido').AsFloat;
    mskQtdeDisp.Value := qryProcessoExpItem.FieldByName('calcQtdeDisponivel').AsFloat;
    //exibe o panel de baixa e foca na qtde a baixar
    lblQtdeItem.Caption := 'Qtde. a Baixar';
    chkAlterPesoLiq.Visible := false;
    pnlQtdeItens.Visible := True;
    pnlQtdeItens.BringToFront;
    mskQtdeItem.SetFocus;
  end
  else
    Application.MessageBox('Nenhum item selecionado para ser baixado!'+ #13#10 +
      'Selecione um ou mais itens e clique em baixar novamente.','Atenção',MB_OK+MB_ICONWARNING);
end;

procedure TfrmPaletizacao.btnCancelaBaixaClick(Sender: TObject);
begin
  if dsProcessoExpItem.State in [dsEdit] then qryProcessoExpItem.Cancel;
  pnlQtdeItens.Visible := False;
  pnlProcessoItem.Visible := False;
  TravaPalets(True);
end;

procedure TfrmPaletizacao.btnOkClick(Sender: TObject);
var
  s, vAcao, vNrItem: string;
  i, vNewLen: Integer;
begin
  if pnlProcessoItem.Visible then vAcao := 'baixar';
  if pnlShowItensCaixa.Visible then vAcao := 'estornar';

  if (mskQtdeItem.Value <= 0) and (mskQtdeDisp.Value > 0) and not chkAlterPesoLiq.Checked then begin
    Application.MessageBox(PChar('Por favor informe a quantidade a '+vAcao+'!'),'Erro',MB_ICONERROR+MB_OK);
    mskQtdeItem.SetFocus;
  end
  else begin
    if (mskQtdeItem.Value > mskQtdeDisp.Value) and not chkAlterPesoLiq.Checked then begin
      Application.MessageBox(PChar('A quantidade a '+vAcao+' não pode ser maior que a disponível!'),'Erro',MB_ICONERROR+MB_OK);
      mskQtdeItem.SelectAll;
      mskQtdeItem.SetFocus;
    end
    else begin
      if (mskQtdeItem.Value = 0) and (mskQtdeDisp.Value = 0) and not chkAlterPesoLiq.Checked then begin
        Application.MessageBox(PChar('O item selecionado não tem quantidade disponível para baixar!'),'Atenção',MB_ICONWARNING+MB_OK);
      end
      else
      try
        datm_main.db_broker.StartTransaction;
        //adciona o valor a quantidade baixada do item
        if pnlProcessoItem.Visible then begin
          vNrItem := qryProcessoExpItemNR_ITEM.AsString;
          qryProcessoExpItem.Edit;
          qryProcessoExpItemQT_BAIXADA.AsFloat := qryProcessoExpItemQT_BAIXADA.AsFloat + mskQtdeItem.Value;
          qryProcessoExpItem.Post;
        end;
        if pnlShowItensCaixa.Visible then begin
          vNrItem := mtblShowItensNR_ITEM.AsString;
          if not chkAlterPesoLiq.Checked then
            with TQuery.Create(Application) do begin
              DatabaseName := 'DBBROKER';
              SQL.Clear;
              SQL.Add('UPDATE TPROCESSO_EXP_ITEM SET QT_BAIXADA = QT_BAIXADA - :QT_ESTORNO ');
              SQL.Add('WHERE NR_PROCESSO = '''+ vNrProcesso +''' AND NR_ITEM = '''+ vNrItem +''' ');
              ParamByName('QT_ESTORNO').AsFloat := mskQtdeItem.Value;
              ExecSQL;
              Free;
            end;
        end;
        //verifica se o item já existe no palet, se existir adiciona/estorna a qtde baixada, se não inclui o item no palet
        mtblPalets.Locate('TX_NOME_CAIXA',vNomePanel,[loCaseInsensitive]);
        if mtblPaletsTX_ITENS_PROCESSO.AsString <> '' then begin
          if Pos(vNrItem,mtblPaletsTX_ITENS_PROCESSO.AsString) > 0 then begin
            //procura o item que vai adicionar/estornar o valor
            for i := 0 to High(aItensCx) do
              if aItensCx[i,0] = vNrItem then begin
                if pnlProcessoItem.Visible then begin
                  aItensCx[i,1] := FloatToStr(StrToFloat(aItensCx[i,1]) + mskQtdeItem.Value);
                  aItensCx[i,2] := FloatToStr(mskPesoLiq.Value);
                end;
                if pnlShowItensCaixa.Visible then begin
                  if not chkAlterPesoLiq.Checked then aItensCx[i,1] := FloatToStr(StrToFloat(aItensCx[i,1]) - mskQtdeItem.Value);
                  aItensCx[i,2] := FloatToStr(mskPesoLiq.Value);
                end;
                Break;
              end;
          end
          else begin
            vNewLen := High(aItensCx)+1;
            SetLength(aItensCx, vNewLen+1);
            SetLength(aItensCx[vNewLen], 3);
            aItensCx[vNewLen,0] := vNrItem;
            aItensCx[vNewLen,1] := mskQtdeItem.Text;
            aItensCx[vNewLen,2] := mskPesoLiq.Text;
          end;
        end
        else begin
          SetLength(aItensCx, 1);
          SetLength(aItensCx[0], 3);
          aItensCx[0,0] := vNrItem;
          aItensCx[0,1] := mskQtdeItem.Text;
          aItensCx[0,2] := mskPesoLiq.Text;
        end;

        s := '';  //monta string de itens
        for i := 0 to High(aItensCx) do
          if StrToFloat(aItensCx[i,1]) > 0 then s := s + aItensCx[i,0] +';'+ aItensCx[i,1] +';'+ aItensCx[i,2] +'/';
        //salva na tabela a modificação
        mtblPalets.Edit;
        mtblPaletsTX_ITENS_PROCESSO.AsString := s;
        mtblPalets.Post;

        datm_main.db_broker.Commit;
      except
        on E: Exception do begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Exit;
        end;
      end;
      btnCancelBaixaEstornoClick(nil);
    end;
  end;
end;

procedure TfrmPaletizacao.qryProcessoExpItemAfterPost(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure TfrmPaletizacao.qryProcessoExpItemCalcFields(DataSet: TDataSet);
begin
  qryProcessoExpItem.FieldByName('calcQtdeDisponivel').AsFloat := qryProcessoExpItemQT_MERCADORIA.AsFloat - qryProcessoExpItemQT_BAIXADA.AsFloat;
  qryProcessoExpItem.FieldByName('calcPesoLiquido').AsFloat := qryProcessoExpItemQT_MERCADORIA.AsFloat * qryProcessoExpItemVL_PESO_LIQ_UNIT.AsFloat;
end;

procedure TfrmPaletizacao.btnEstornaItemClick(Sender: TObject);
begin
  vCaixaPos := 0;
  if dbgrdShowItens.SelectedRows.Count <> 0 then
  begin
    //pega numero de linhas selecionadas
    vCaixaSelec := dbgrdShowItens.SelectedRows.Count;
    //posiciona no primeiro registro que estiver selecionado e incrementa 1 na posição
    mtblShowItens.GotoBookmark(TBookMark(dbgrdShowItens.SelectedRows[vCaixaPos]));
    Inc(vCaixaPos);
    //seta os edits de qtde a baixar e disponivel com a qtde disponivel.
    edtNrItem.Text := mtblShowItensNR_ITEM.AsString;
    edtMercadoria.Text := mtblShowItensCD_MERCADORIA.AsString;
    mskQtdeItem.Value := mtblShowItensQT_MERCADORIA.AsFloat;
    mskPesoLiq.Value := mtblShowItensVL_PESO_LIQUIDO.AsFloat;
    mskQtdeDisp.Value := mtblShowItensQT_MERCADORIA.AsFloat;
    //exibe o panel de baixa e foca na qtde a baixar
    lblQtdeItem.Caption := 'Qtde. a Estornar';
    chkAlterPesoLiq.Visible := true;
    pnlQtdeItens.Visible := True;
    pnlQtdeItens.BringToFront;
    mskQtdeItem.SetFocus;
  end
  else
    Application.MessageBox('Nenhum item selecionado para ser estornado!'+ #13#10 +
      'Selecione um ou mais itens e clique em estornar novamente.','Atenção',MB_OK+MB_ICONWARNING);
end;

procedure TfrmPaletizacao.btnCancelaEstornoClick(Sender: TObject);
begin
  pnlQtdeItens.Visible := False;
  pnlShowItensCaixa.Visible := False;
  TravaPalets(True);
end;

procedure TfrmPaletizacao.btnSalvarClick(Sender: TObject);
var
  i: Integer;
  pEdit: TEdit;

  function ConverteCaminho(pCaminho: string): string;
  var
    vObjPnl, vCaminho: string;
    pPanel: TPanel;
    pEdit: TEdit;
  begin
    //cria o caminho com o nome dado a cada caixa nos edits
    vCaminho := '';
    while Length(pCaminho) > 0 do
    begin
      //pega o nome do objeto pai
      vObjPnl := Copy(pCaminho,0,Pos('|',pCaminho)-1);
      //localiza o panel na tela e na memory table
      pPanel := pnlCaixa(toFind,StrToInt(ExtractWord(2,vObjPnl,'_')),StrToInt(ExtractWord(3,vObjPnl,'_')),StrToInt(ExtractWord(4,vObjPnl,'_')),'');
      mtblPalets.Locate('TX_NOME_CAIXA',vNomePanel,[loCaseInsensitive]);
      //localiza o edit que contem o nome dado pelo usuário ao panel
      pEdit := TEdit(pPanel.FindComponent('edtCaixa_'+Copy(pPanel.Name,10,9)));
      //incrementa ao caminho o nome do panel
      vCaminho := vCaminho + pEdit.Text +'|';
      //remove do caminho de panels objeto o panel pai
      pCaminho := Copy(pCaminho,Pos('|',pCaminho)+1,Length(pCaminho));
    end;
    Result := vCaminho;
  end;
begin
  ActiveControl := nil;
  //grava a paletização na tabela
  try
    datm_main.db_broker.StartTransaction;

    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('DELETE TPROCESSO_PALETIZACAO WHERE NR_PROCESSO = '''+ vNrProcesso +''' ');
      ExecSQL;
      Free;
    end;

    qryProcessoPaletizacao.Close;
    qryProcessoPaletizacao.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qryProcessoPaletizacao.Open;
    
    mtblPalets.First;
    while not mtblPalets.Eof do
    begin
      vNomePanel := mtblPaletsTX_NOME_CAIXA.AsString;
      CriaArrayItensQtde(vNomePanel);
      if High(aItensCx) < 0 then
      begin
        qryProcessoPaletizacao.Insert;
        qryProcessoPaletizacaoNR_PROCESSO.AsString := vNrProcesso;
        qryProcessoPaletizacaoCD_CAMINHO.AsInteger := UltCod(qryUltimoCodigo, qryUltimoCodigoULTIMO);
        qryProcessoPaletizacaoTX_CAMINHO.AsString  := ConverteCaminho(mtblPaletsTX_CAMINHO.AsString);
        qryProcessoPaletizacao.Post;
      end
      else
        for i := 0 to High(aItensCx) do
        begin
          vPnlCaixa := pnlCaixa(toFind,mtblPaletsCD_PALET.AsInteger,mtblPaletsCD_NIVEL.AsInteger,mtblPaletsCD_CAIXA.AsInteger,'');
          qryProcessoExpItem.Locate('NR_ITEM',aItensCx[i, 0],[loCaseInsensitive]);
          qryProcessoPaletizacao.Insert;
          qryProcessoPaletizacaoNR_PROCESSO.AsString   := vNrProcesso;
          qryProcessoPaletizacaoCD_CAMINHO.AsInteger   := UltCod(qryUltimoCodigo, qryUltimoCodigoULTIMO);
          qryProcessoPaletizacaoTX_CAMINHO.AsString    := ConverteCaminho(mtblPaletsTX_CAMINHO.AsString);
          qryProcessoPaletizacaoNR_ITEM.AsString       := aItensCx[i, 0];
          qryProcessoPaletizacaoVL_QTDE.AsFloat        := StrToFloat(aItensCx[i, 1]);
          qryProcessoPaletizacaoVL_PESO_LIQUIDO.AsFloat:= StrToFloat(aItensCx[i, 2]);
          qryProcessoPaletizacaoCD_MERCADORIA.AsString := qryProcessoExpItemCD_MERCADORIA.AsString;
          pEdit := TEdit(vPnlCaixa.FindComponent('edtPesoBruto_'+Copy(mtblPaletsTX_NOME_CAIXA.AsString,10,9)));
          qryProcessoPaletizacaoVL_PESO_BRUTO.AsFloat  := StrToFloat(pEdit.Text);
          pEdit := TEdit(vPnlCaixa.FindComponent('edtCubagem_'+Copy(mtblPaletsTX_NOME_CAIXA.AsString,10,9)));
          qryProcessoPaletizacaoVL_M3.AsFloat          := StrToFloat(pEdit.Text);
          qryProcessoPaletizacao.Post;
        end;
      mtblPalets.Next;
    end;

    btnSalvar.Enabled      := False;
    btnCancelar.Enabled    := False;
    btnPackingList.Enabled := VerificaQtdeMerc;
    if not btnPackingList.Enabled then
      Application.MessageBox('Ainda não foram utilizados todos os itens disponíveis, utilize todos itens para habilitar a impressão do Packing List.', 
        'Informação', MB_OK + MB_ICONINFORMATION);

    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Exit;
    end;
  end;
end;

procedure TfrmPaletizacao.btnCancelarClick(Sender: TObject);
var
  i: Integer;
  shpDiv: TShape;
begin
  ActiveControl := nil;
  //cancela a edição de paletização
  if Application.MessageBox('Esta ação irá cancelar todas alterações realizadas na paletização do processo.'+#13#10+
                            'Deseja continuar?','Cancelar',MB_YESNO+MB_ICONQUESTION) = IDYES then
  begin
    for i := 1 to vNumPalet do
    begin
      vPnlPalet := pnlPalet(toFind, i);
      if vPnlPalet <> nil then
      begin
        shpDiv := TShape(scbMain.FindComponent('shpDiv1_'+PutZeroEsquerda(IntToStr(i),2)));
        FreeAndNil(shpDiv);
        shpDiv := TShape(scbMain.FindComponent('shpDiv2_'+PutZeroEsquerda(IntToStr(i),2)));
        FreeAndNil(shpDiv);
        FreeAndNil(vPnlPalet);
      end;
    end;
    mtblPalets.Close;
    mtblPalets.Open;
    vNumPalet := 0;
    pnlEspaco.Width := 0;
    pnlExibeNivel.Width := 0;
    mskNrProcessoExit(nil);
  end;
end;

procedure TfrmPaletizacao.imgDelClick(Sender: TObject);
begin
  vPnlCaixa := GetPanel(Sender);
  popPaletizacao.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;  

procedure TfrmPaletizacao.imgDelContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin
  vPnlCaixa := GetPanel(Sender);
end;

function TfrmPaletizacao.VerificaQtdeMerc: Boolean;
begin
  with TQuery.Create(Application) do begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT SUM(QT_MERCADORIA), SUM(QT_BAIXADA)');
    SQL.Add('FROM TPROCESSO_EXP_ITEM (NOLOCK)');
    SQL.Add('WHERE NR_PROCESSO = '''+vNrProcesso+''' ');
    Open;
    //verifica se a qtde de mercadorias é maiorque a baixada
    if Fields[0].AsFloat > Fields[1].AsFloat then Result := False
    else Result := True;
    Close;
    Free;
  end;
end;

procedure TfrmPaletizacao.mniExcluirClick(Sender: TObject);
var
  i, j, vMinTop, vMaxTop: Integer;
  pnlCxFilho, pnlCxPai, pnlNvlFilho: TPanel;
  shpDiv: TShape;
begin
  //verifica se o registro é localizado na tabela
  if mtblPalets.Locate('TX_NOME_CAIXA',vWinCaixa.Name,[loCaseInsensitive]) then
  begin
    try
      //verifica se é o primeira caixa do palet, se for apaga tudo
      if (vWinNivel.Tag = 1) and (vWinCaixa.Tag = 1) then
      begin
        //localiza todos os registros que estejam no palet e deleta, além de estornar os produtos
        mtblPalets.First;
        while not mtblPalets.Eof do
        begin
          if mtblPaletsCD_PALET.AsInteger = vWinPalet.Tag then
          begin
            CriaArrayItensQtde(mtblPaletsTX_NOME_CAIXA.AsString);
            for i := 0 to High(aItensCx) do
              with TQuery.Create(Application) do
              begin
                DatabaseName := 'DBBROKER';
                SQL.Clear;
                SQL.Add('UPDATE TPROCESSO_EXP_ITEM SET QT_BAIXADA = QT_BAIXADA - :QT_ESTORNO ');
                SQL.Add('WHERE NR_PROCESSO = '''+ vNrProcesso +''' AND NR_ITEM = '''+ aItensCx[i,0] +''' ');
                ParamByName('QT_ESTORNO').AsFloat := StrToFloat(aItensCx[i,1]);
                ExecSQL;
                Free;
              end;
            mtblPalets.Delete;
          end;
          mtblPalets.Next;
        end;
        shpDiv := TShape(scbMain.FindComponent('shpDiv1_'+PutZeroEsquerda(IntToStr(vWinPalet.Tag),2)));
        FreeAndNil(shpDiv);
        shpDiv := TShape(scbMain.FindComponent('shpDiv2_'+PutZeroEsquerda(IntToStr(vWinPalet.Tag),2)));
        FreeAndNil(shpDiv);
        vPnlPalet := pnlPalet(toFind,vWinPalet.Tag);
        FreeAndNil(vPnlPalet);
      end
      else
      begin
        //se não for a primeira caixa do palet, estorna valores das caixas filho
        vMinTop := vPnlCaixa.Top;
        vMaxTop := 0;
        mtblPalets.Locate('TX_NOME_CAIXA',mtblPaletsTX_NOME_PAI.AsString,[loCaseInsensitive]);
        //diminui em um a qtde de filhos do pai
        mtblPalets.Edit;
        mtblPaletsVL_QTD_FILHO.AsInteger := mtblPaletsVL_QTD_FILHO.AsInteger - 1;
        mtblPalets.Post;
        pnlCxPai := pnlCaixa(toFind,mtblPaletsCD_PALET.AsInteger, mtblPaletsCD_NIVEL.AsInteger, mtblPaletsCD_CAIXA.AsInteger,'');
        //guarda o maior top das caixas excluidas
        for i := 1 to 99 do
          if pnlNivel(toFind, vWinPalet.Tag, i) <> nil then
            for j := 1 to 99 do
            begin
              pnlCxFilho := pnlCaixa(toFind, vWinPalet.Tag, i, j, '');
              if pnlCxFilho <> nil then
              begin
                mtblPalets.Locate('TX_NOME_CAIXA',pnlCxFilho.Name,[loCaseInsensitive]);
                if Pos(vPnlCaixa.Name, mtblPaletsTX_CAMINHO.AsString) > 0 then
                  if pnlCxFilho.Top > vMaxTop then vMaxTop := pnlCxFilho.Top;
              end;
            end
          else Break;
        //ajusta o top dos itens restantes
        if (vMaxTop >= vMinTop) and (vPnlCaixa.Top <> pnlCxPai.Top) then
          for i := 1 to 99 do
            if pnlNivel(toFind, vWinPalet.Tag, i) <> nil then
              for j := 1 to 99 do
              begin
                pnlCxFilho := pnlCaixa(toFind, vWinPalet.Tag, i, j, '');
                if pnlCxFilho <> nil then
                  if pnlCxFilho.Top > vMaxTop then pnlCxFilho.Top := pnlCxFilho.Top-(vMaxTop-vMinTop)-cHeight;
              end
            else Break;
        //localiza todos os registros que sejam filhos e os filhos dos filhos, etc
        mtblPalets.First;
        while not mtblPalets.Eof do
        begin
          if Pos(vPnlCaixa.Name, mtblPaletsTX_CAMINHO.AsString) > 0 then
          begin
            CriaArrayItensQtde(mtblPaletsTX_NOME_CAIXA.AsString);
            for i := 0 to High(aItensCx) do
              with TQuery.Create(Application) do
              begin
                DatabaseName := 'DBBROKER';
                SQL.Clear;
                SQL.Add('UPDATE TPROCESSO_EXP_ITEM SET QT_BAIXADA = QT_BAIXADA - :QT_ESTORNO ');
                SQL.Add('WHERE NR_PROCESSO = '''+ vNrProcesso +''' AND NR_ITEM = '''+ aItensCx[i,0] +''' ');
                ParamByName('QT_ESTORNO').AsFloat := StrToFloat(aItensCx[i,1]);
                ExecSQL;
                Free;
              end;
            mtblPalets.Delete;
          end;
          mtblPalets.Next;
        end;
        FreeAndNil(vPnlCaixa);
        //apaga os panels de niveis caso não existam mais caixas
        for i := vWinNivel.Tag to 99 do
        begin
          pnlNvlFilho := pnlNivel(toFind, vWinPalet.Tag, i);
          if pnlNvlFilho <> nil then
          begin
            for j := 1 to 99 do
              if pnlCaixa(toFind, vWinPalet.Tag, i, j, '') <> nil then Break;
            if j > 99 then FreeAndNil(pnlNvlFilho);
          end
          else Break;
        end;
      end;
      AjustaPalet(vWinPalet.Tag);
      //recarrega a tabela de itens
      qryProcessoExpItem.Close;
      qryProcessoExpItem.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
      qryProcessoExpItem.Open;
    except
      on E: Exception do
      begin
        TrataErro(E);
        Exit;
      end;  
    end;
  end
  else
    Application.MessageBox('Não foi possível encontrar o registro desta caixa! Favor contatar o desenvolvimento.','Erro',MB_OK+MB_ICONERROR);
end;

procedure TfrmPaletizacao.btnPackingListClick(Sender: TObject);
begin
  if not VerIntegridade then Exit;
  Screen.Cursor := crHourGlass;
  Application.CreateForm(TfrmPackingList, frmPackingList);
  Application.ProcessMessages;
  Screen.Cursor := crArrow;
  frmPackingList.vNrProcesso := vNrProcesso;
  frmPackingList.ShowModal;
end;

procedure TfrmPaletizacao.mskUnidadeExit(Sender: TObject);
begin
  if Trim(mskUnidade.Text) = '' then Exit;

  mskUnidade.Text := Copy('00',0,2-Length(mskUnidade.Text)) + mskUnidade.Text;

  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TUNID_NEG (NOLOCK) WHERE CD_UNID_NEG = '''+ mskUnidade.Text +''' ');
    SQL.Add('AND CD_UNID_NEG IN ( SELECT CD_UNID_NEG FROM TUSUARIO_HABILITACAO (NOLOCK) WHERE CD_USUARIO = '''+ str_cd_usuario +''')' );
    Open;
    if Fields[0].AsInteger = 0 then
    begin
      Application.MessageBox('Unidade inválida/Usuário não habilitado!','Informação',MB_OK+MB_ICONINFORMATION);
      mskUnidade.Clear;
      mskUnidade.SetFocus;
    end;
    Close;
    Free;
  end;
end;

procedure TfrmPaletizacao.mskNrProcessoExit(Sender: TObject);
var
  vCaminho, vObjPai, vCaixaCaixa: string;
  vPesoBruto, vPesoLiquido, vCubagem: Double;
  shpDiv: TShape;
  pEdit: TEdit;
  i: Integer;
begin
  //verifica se já existem palets, se existir limpa avisa usuário e pede para salvar antes de continuar
  if vNumPalet > 0 then
  begin
    if btnSalvar.Enabled then
      if Application.MessageBox('Deseja salvar a paletização antes de alterar o processo?','Salvar',MB_YESNO+MB_ICONQUESTION) = IDYES then
        btnSalvarClick(nil);
    for i := 1 to vNumPalet do
    begin
      vPnlPalet := pnlPalet(toFind, i);
      if vPnlPalet <> nil then
      begin
        shpDiv := TShape(scbMain.FindComponent('shpDiv1_'+PutZeroEsquerda(IntToStr(i),2)));
        FreeAndNil(shpDiv);
        shpDiv := TShape(scbMain.FindComponent('shpDiv2_'+PutZeroEsquerda(IntToStr(i),2)));
        FreeAndNil(shpDiv);
        FreeAndNil(vPnlPalet);
      end;
      Application.ProcessMessages;
    end;
    mtblPalets.Close;
    mtblPalets.Open;
    vNumPalet := 0;
    pnlEspaco.Width := 0;
    pnlExibeNivel.Width := 0;
  end;
  //verifica se foi digitado o numero do processo
  if Trim(mskNrProcesso.Text) = '' then
  begin
    btnIncluir.Enabled     := False;
    btnSalvar.Enabled      := False;
    btnCancelar.Enabled    := False;
    btnPackingList.Enabled := False;
    Exit;
  end;
  //busca pelo processo
  vNrProcesso := mskUnidade.Text + '02' + mskNrProcesso.Text;

  qryProcessoExpItem.Close;
  qryProcessoExpItem.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
  qryProcessoExpItem.Open;
  //se não existir item no processo de exportação, informa usuário
  if qryProcessoExpItem.IsEmpty then
  begin
    Application.MessageBox('Não existem itens para esse processo de exportação!' +#13#10+
                           'Não é possível iniciar a paletização.','Atenção',MB_OK+MB_ICONWARNING);
    btnIncluir.Enabled     := False;
    btnSalvar.Enabled      := False;
    btnCancelar.Enabled    := False;
    btnPackingList.Enabled := False;
    Exit;
  end;

  if vNrProcesso <> '' then
    Caption := 'Paletização [Processo: '+ Copy(vNrProcesso, 5, 13) +']'
  else
    Caption := 'Paletização';   

  qryProcessoPaletizacao.Close;
  qryProcessoPaletizacao.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
  qryProcessoPaletizacao.Open;

  if not qryProcessoPaletizacao.IsEmpty then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT TX_CAMINHO, VL_PESO_BRUTO, ISNULL(SUM(VL_PESO_LIQUIDO), 0), VL_M3 ');
      SQL.Add('FROM TPROCESSO_PALETIZACAO (NOLOCK) ');
      SQL.Add('WHERE NR_PROCESSO = '''+ vNrProcesso +''' ');
      SQL.Add('GROUP BY TX_CAMINHO, VL_PESO_BRUTO, VL_M3');
      Open;
      while not Eof do
      begin
        vCaminho := Fields[0].AsString;
        vPesoBruto := Fields[1].AsFloat;
        vPesoLiquido := Fields[2].AsFloat;
        vCubagem := Fields[3].AsFloat;
        //se encontrar apenas um '|' significa que é o palet principal
        if ContaOcorrencias(vCaminho, '|') = 1 then
        begin
          btnIncluirClick(nil);

          vPnlCaixa := pnlCaixa(toFind,mtblPaletsCD_PALET.AsInteger,mtblPaletsCD_NIVEL.AsInteger,mtblPaletsCD_CAIXA.AsInteger,'');
          //peso bruto
          pEdit := TEdit(vPnlCaixa.FindComponent('edtPesoBruto_'+Copy(vPnlCaixa.Name,10,9)));
          pEdit.Text := FloatToStr(vPesoBruto);
          //cubagem
          pEdit  := TEdit(vPnlCaixa.FindComponent('edtCubagem_'+Copy(vPnlCaixa.Name,10,9)));
          pEdit.Text := FloatToStr(vCubagem);
          //localiza o panel e edit e insere o nome do panel no edit
          pEdit := TEdit(vPnlCaixa.FindComponent('edtCaixa_'+Copy(vPnlCaixa.Name,10,9)));
          pEdit.Text := Copy(vCaminho,0,Pos('|',vCaminho)-1);

          //procura pelos itens
          vCaixaCaixa := '';
          mtblPalets.Edit;
          mtblPaletsTX_EDIT_CAIXA.AsString := pEdit.Text;
          mtblPaletsVL_PESO_BRUTO.AsFloat := vPesoBruto;
          mtblPaletsVL_PESO_LIQUIDO.AsFloat := vPesoLiquido;
          mtblPaletsVL_CUBAGEM.AsFloat := vCubagem;

          while (vCaminho = qryProcessoPaletizacaoTX_CAMINHO.AsString) and (not qryProcessoPaletizacao.Eof) do
          begin
            if not VarIsNull(qryProcessoPaletizacaoNR_ITEM.AsVariant) then
              vCaixaCaixa := vCaixaCaixa +
                             qryProcessoPaletizacaoNR_ITEM.AsString +';'+
                             qryProcessoPaletizacaoVL_QTDE.AsString +';'+
                             qryProcessoPaletizacaoVL_PESO_LIQUIDO.AsString +'/';
            qryProcessoPaletizacao.Next;
          end;
          mtblPaletsTX_ITENS_PROCESSO.AsString := vCaixaCaixa;
          mtblPalets.Post;
        end
        else
        begin
          while ContaOcorrencias(vCaminho, '|') > 1 do
          begin
            vObjPai  := Copy(vCaminho,0,Pos('|',vCaminho)-1);
            vCaminho := Copy(vCaminho, Pos('|',vCaminho)+1, Length(vCaminho));
          end;
          //localiza na tabela e localiza o panel do objeto pai
          mtblPalets.Locate('TX_EDIT_CAIXA',vObjPai,[loCaseInsensitive]);
          vPnlCaixa := pnlCaixa(toFind,mtblPaletsCD_PALET.AsInteger, mtblPaletsCD_NIVEL.AsInteger, mtblPaletsCD_CAIXA.AsInteger,'');
          //simula o clique do botão para adicionar uma nova caixa dentro do objeto pai
          btnCaixaClick(vPnlCaixa.FindComponent('btnCaixa_'+Copy(vPnlCaixa.Name,10,9)));

          vPnlCaixa := pnlCaixa(toFind,mtblPaletsCD_PALET.AsInteger, mtblPaletsCD_NIVEL.AsInteger, mtblPaletsCD_CAIXA.AsInteger,'');
          //valor do peso bruto
          pEdit  := TEdit(vPnlCaixa.FindComponent('edtPesoBruto_'+Copy(vPnlCaixa.Name,10,9)));
          pEdit.Text := FloatToStr(vPesoBruto);
          //valor da cubagem
          pEdit  := TEdit(vPnlCaixa.FindComponent('edtCubagem_'+Copy(vPnlCaixa.Name,10,9)));
          pEdit.Text := FloatToStr(vCubagem);
          //localiza o edit da caixa criado e insere o nome do panel no edit
          pEdit  := TEdit(vPnlCaixa.FindComponent('edtCaixa_'+Copy(vPnlCaixa.Name,10,9)));
          pEdit.Text := Copy(vCaminho,0,Pos('|',vCaminho)-1);

          mtblPalets.Locate('TX_NOME_CAIXA',vPnlCaixa.Name,[loCaseInsensitive]);
          //procura pelos itens
          vCaixaCaixa := '';
          mtblPalets.Edit;
          mtblPaletsTX_EDIT_CAIXA.AsString := pEdit.Text;
          mtblPaletsVL_PESO_BRUTO.AsFloat := vPesoBruto;
          mtblPaletsVL_CUBAGEM.AsFloat := vCubagem;

          while (Fields[0].AsString = qryProcessoPaletizacaoTX_CAMINHO.AsString) and (not qryProcessoPaletizacao.Eof) do
          begin
            if not VarIsNull(qryProcessoPaletizacaoNR_ITEM.AsVariant) then
              vCaixaCaixa := vCaixaCaixa + qryProcessoPaletizacaoNR_ITEM.AsString +';'+ qryProcessoPaletizacaoVL_QTDE.AsString +'/';
            qryProcessoPaletizacao.Next;
          end;
          mtblPaletsTX_ITENS_PROCESSO.AsString := vCaixaCaixa;
          mtblPalets.Post;
        end;
        Application.ProcessMessages;
        Next;
      end;
      Close;
      Free;
    end;
  end;
  btnIncluir.Enabled     := True;
  btnSalvar.Enabled      := False;
  btnCancelar.Enabled    := False;
  btnPackingList.Enabled := VerificaQtdeMerc;
  
  qryUltimoCodigo.SQL[2] := 'WHERE NR_PROCESSO = '''+vNrProcesso+''' ';
end;

procedure TfrmPaletizacao.btnUnidadeClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  begin
    mskUnidade.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',nil);
    mskUnidadeExit(nil);
  end else edtUnidade.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', mskUnidade.Text,'AP_UNID_NEG');
end;

procedure TfrmPaletizacao.btnProcessoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT DISTINCT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA');
  vListAux.Add('FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('  INNER JOIN TPROCESSO_EXP_ITEM PEI (NOLOCK) ON PEI.NR_PROCESSO = PR.NR_PROCESSO');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE PR.CD_UNID_NEG  = ''' + mskUnidade.Text + '''');
  vListAux.Add('  AND PR.CD_PRODUTO   = ''02''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  if chkProcessos.Checked then
    vListAux.Add('  AND PR.DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  mskNrProcesso.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],
    ['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;
  mskNrProcessoExit(nil);
end;

procedure TfrmPaletizacao.edtPesqMercIncChange(Sender: TObject);
begin
  //consulta pelo nome da mercadoria
  qryProcessoExpItem.Locate('AP_MERCADORIA',edtPesqMercInc.Text,[loCaseInsensitive, loPartialKey]);
end;

procedure TfrmPaletizacao.edtPesqMercEstChange(Sender: TObject);
begin
  //consulta pelo nome da mercadoria
  mtblShowItens.Locate('AP_MERCADORIA',edtPesqMercEst.Text,[loCaseInsensitive, loPartialKey]);
end;

procedure TfrmPaletizacao.edtKeyPress(Sender: TObject; var Key: Char);
begin
  if not funcoes.IsNumeric(Key) then Key := #0;
end;

procedure TfrmPaletizacao.edtChange(Sender: TObject);
begin
  btnSalvar.Enabled      := True;
  btnCancelar.Enabled    := True;
  btnPackingList.Enabled := False;
end;

procedure TfrmPaletizacao.btnCancelBaixaEstornoClick(Sender: TObject);
begin
  chkAlterPesoLiq.Checked := false;
  if chkAlterPesoLiq.Visible then chkAlterPesoLiqClick(nil);
  //verifica se todos os itens já foram processados
  if vCaixaPos < vCaixaSelec then begin
    if pnlProcessoItem.Visible then begin
      //posiciona no primeiro registro que estiver selecionado e incrementa 1 na posição
      qryProcessoExpItem.GotoBookmark(TBookMark(dbgrdProcessoItem.SelectedRows[vCaixaPos]));
      //seta os edits de qtde a baixar e disponivel com a qtde disponivel.
      edtNrItem.Text := qryProcessoExpItemNR_ITEM.AsString;
      edtMercadoria.Text := qryProcessoExpItemCD_MERCADORIA.AsString;
      mskQtdeItem.Value := qryProcessoExpItem.FieldByName('calcQtdeDisponivel').AsFloat;
      mskPesoLiq.Value := qryProcessoExpItem.FieldByName('calcPesoLiquido').AsFloat;
      mskQtdeDisp.Value := qryProcessoExpItem.FieldByName('calcQtdeDisponivel').AsFloat;
    end;
    if pnlShowItensCaixa.Visible then begin
      //posiciona no primeiro registro que estiver selecionado e incrementa 1 na posição
      mtblShowItens.GotoBookmark(TBookmark(dbgrdShowItens.SelectedRows[vCaixaPos]));
      //seta os edits de qtde a extornar e disponivel com a qtde disponivel.
      edtNrItem.Text := mtblShowItensNR_ITEM.AsString;
      edtMercadoria.Text := mtblShowItensCD_MERCADORIA.AsString;
      mskQtdeItem.Value := mtblShowItensQT_MERCADORIA.AsFloat;
      mskPesoLiq.Value := mtblShowItensVL_PESO_LIQUIDO.AsFloat;
      mskQtdeDisp.Value := mtblShowItensQT_MERCADORIA.AsFloat;
    end;
    Inc(vCaixaPos);
    //exibe o panel de baixa e foca na qtde a baixar
    pnlQtdeItens.Visible := True;
    mskQtdeItem.SetFocus;
  end
  else begin
    //esconde os panels de itens e destrava os palets
    pnlQtdeItens.Visible := False;
    pnlProcessoItem.Visible := False;
    pnlShowItensCaixa.Visible := False;
    TravaPalets(True);

    qryProcessoExpItem.Close;
    qryProcessoExpItem.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qryProcessoExpItem.Open;
  end;
end;

procedure TfrmPaletizacao.chkAlterPesoLiqClick(Sender: TObject);
begin
  mskQtdeItem.ReadOnly := chkAlterPesoLiq.Checked;
  mskQtdeItem.TabStop := not chkAlterPesoLiq.Checked;
  if chkAlterPesoLiq.Checked then begin
    mskQtdeItem.Color := clSilver;
    mskQtdeItem.Value := 0;
    mskPesoLiq.SetFocus;
  end
  else begin
    mskQtdeItem.Color := clWindow;
    mskQtdeItem.Value := mtblShowItensQT_MERCADORIA.AsFloat;
    mskQtdeItem.SetFocus;
  end;
end;

procedure TfrmPaletizacao.btnZerarClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente refazer toda a Paletização?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    FastExecSQL(' DELETE TPROCESSO_PALETIZACAO WHERE NR_PROCESSO = '''+vNrProcesso+''' ');
    FastExecSQL(' UPDATE TPROCESSO_EXP_ITEM SET QT_BAIXADA = 0 WHERE NR_PROCESSO = '''+vNrProcesso+''' ');
  end
end;

end.


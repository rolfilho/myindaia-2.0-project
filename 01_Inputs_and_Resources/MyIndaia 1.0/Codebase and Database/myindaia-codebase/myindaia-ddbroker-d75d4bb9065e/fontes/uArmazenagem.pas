unit uArmazenagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Spin, Buttons, DBTables, Mask, Grids;

Type
  TTipoOperacao = (toFind, toCreate);

type
  TfrmArmazenagem = class(TForm)
    pnlTop: TPanel;
    pnlTotais: TPanel;
    shp3: TShape;
    lbl11: TLabel;
    shp4: TShape;
    lbl14: TLabel;
    shp6: TShape;
    lblQtdeContainers: TLabel;
    lblTotalGeralProcesso: TLabel;
    lbl_cd_unid_neg: TLabel;
    edtUnidade: TEdit;
    edt_nm_unid_neg: TEdit;
    btnConsUnidade: TSpeedButton;
    lbl_cd_produto: TLabel;
    edtProduto: TEdit;
    edt_nm_produto: TEdit;
    btnConsProduto: TSpeedButton;
    lbl_nr_processo: TLabel;
    edtProcesso: TEdit;
    btnConsProcesso: TSpeedButton;
    chkProcessos: TCheckBox;
    pnlAguarde: TPanel;
    pnl1: TPanel;
    shp1: TShape;
    lbl18: TLabel;
    lbl19: TLabel;
    rbContainer: TRadioButton;
    rbCargaSolta: TRadioButton;
    shp2: TShape;
    shp5: TShape;
    lbl1: TLabel;
    shp7: TShape;
    shp8: TShape;
    lbl2: TLabel;
    seDiasMais: TSpinEdit;
    lbl3: TLabel;
    shp9: TShape;
    rbTudo: TRadioButton;
    btnRefresh: TSpeedButton;
    edtContainerCarga: TEdit;
    btnContainerCarga: TSpeedButton;
    shpContainerCarga: TShape;
    lblContainerCarga: TLabel;
    shp11: TShape;
    shp12: TShape;
    lbl5: TLabel;
    scbBaseGeral: TScrollBox;
    shp10: TShape;
    lbl6: TLabel;
    btnCancelaDespesas: TSpeedButton;
    pnlCancelamentoDespesas: TPanel;
    pnl3: TPanel;
    lbl4: TLabel;
    pnl2: TPanel;
    btnConfirmaCancelamento: TSpeedButton;
    btnCancelaCancelamento: TSpeedButton;
    scbCancelamento: TScrollBox;
    pnlMostraCalculo: TPanel;
    ScrollBox1: TScrollBox;
    pnl5: TPanel;
    lbl8: TLabel;
    shp13: TShape;
    lblCalculos: TLabel;
    pnl4: TPanel;
    btnFecharClaculos: TSpeedButton;
    pnl6: TPanel;
    pnl7: TPanel;
    procedure btnConsUnidadeClick(Sender: TObject);
    procedure btnConsProdutoClick(Sender: TObject);
    procedure btnConsProcessoClick(Sender: TObject);
    procedure edtUnidadeExit(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure rbContainerClick(Sender: TObject);
    procedure rbCargaSoltaClick(Sender: TObject);
    procedure rbTudoClick(Sender: TObject);
    procedure btnContainerCargaClick(Sender: TObject);
    procedure btnCancelaDespesasClick(Sender: TObject);
    procedure btnConfirmaCancelamentoClick(Sender: TObject);
    procedure btnCancelaCancelamentoClick(Sender: TObject);
    procedure btnFecharClaculosClick(Sender: TObject);
  private
    procedure ConfiguraPeriodo(pPeriodo:Integer; pNomeContainer:String);
    procedure AdicionaContainer(pNomeContainer,pNomeExibicao,pTipoRegistro : string);
    function edtDiversos(pOperacao : TTipoOperacao; pName, pCntr : String; pTop:Integer=0) : TEdit;
    function pnlBase(pOperacao: TTipoOperacao; pCntr: String): TPanel;
    function scbDespesas(pOperacao: TTipoOperacao; pCntr: String): TScrollBox;
    procedure pnlDespesa(pCntr: string; pItem: Integer);
    procedure MostraCalculos(Sender : TObject);
    procedure CriaImagemCalc(pName, pNomeContainer, pHint: String);
    { Private declarations }
  public
    vUltimaCor : TColor;
    { Public declarations }
  end;

var
  frmArmazenagem: TfrmArmazenagem;

implementation

uses MaskUtils, PGGP001, ConsOnLineEx, Funcoes, PGGP017;

{$R *.dfm}

procedure TfrmArmazenagem.ConfiguraPeriodo(pPeriodo:Integer; pNomeContainer:String);
var
  vValueAtual : Integer;
  vDecimalAux : string;

  function findLbl(pName:string) : TLabel;
  begin
    Result := TLabel(pnlBase(toFind,pNomeContainer).FindComponent(pName))
  end;

  function findShp(pName:string) : TShape;
  begin
    Result := TShape(pnlBase(toFind,pNomeContainer).FindComponent(pName))
  end;

begin
  if StrToInt(Copy(IntToStr(pPeriodo),Length(IntToStr(pPeriodo)),1)) = 0 then
    vValueAtual := 10
  else vValueAtual := StrToInt(Copy(IntToStr(pPeriodo),Length(IntToStr(pPeriodo)),1));
  findShp('shpPeriodo'+pNomeContainer).Left := 27 + ( 24 * ( vValueAtual - 1 ) );
  // se for maior que 10, tem que reconfigurar os números
  if ( Copy(IntToStr(Trunc( ( pPeriodo - 1 ) / 10)),1,1) <> '0' ) then //and ( vValueAtual <> 10 ) then
  begin
//    if Trunc(pPeriodo / 10) > 0 then
    if ( pPeriodo > 10 ) and ( Copy(IntToStr(Trunc(pPeriodo)),1,1) <> '0' ) then
      vDecimalAux := Copy(IntToStr(Trunc(pPeriodo / 10)),1,1)
    else if Copy(IntToStr(Trunc(pPeriodo)),1,1) = '0' then
      vDecimalAux := Copy(IntToStr(Trunc(pPeriodo / 10)-1),1,1)
    else vDecimalAux := '';
    findLbl('Lbla'+pNomeContainer).Caption := vDecimalAux+'1';
    findLbl('Lblb'+pNomeContainer).Caption := vDecimalAux+'2';
    findLbl('Lblc'+pNomeContainer).Caption := vDecimalAux+'3';
    findLbl('Lbld'+pNomeContainer).Caption := vDecimalAux+'4';
    findLbl('Lble'+pNomeContainer).Caption := vDecimalAux+'5';
    findLbl('Lblf'+pNomeContainer).Caption := vDecimalAux+'6';
    findLbl('Lblg'+pNomeContainer).Caption := vDecimalAux+'7';
    findLbl('Lblh'+pNomeContainer).Caption := vDecimalAux+'8';
    findLbl('Lbli'+pNomeContainer).Caption := vDecimalAux+'9';
    findLbl('Lblj'+pNomeContainer).Caption := IntToStr(StrToInt(vDecimalAux)+1)+'0';
    if findShp('shpPeriodo'+pNomeContainer).Left = ( 27 + ( 24 * 10 ) ) then
      findShp('shpPeriodo'+pNomeContainer).Left := 27;
  end;
  // reconfigura o degradê ( é viadagem mesmo, e daí ? )
  if StrToInt(Copy(IntToStr(pPeriodo),Length(IntToStr(pPeriodo)),1)) = 1 then
  begin
    findLbl('Lbla'+pNomeContainer).Font.Color := clBlack;
    findLbl('Lblb'+pNomeContainer).Font.Color := clBlack;
    findLbl('Lblg'+pNomeContainer).Font.Color := clGray;
    findLbl('Lblh'+pNomeContainer).Font.Color := clSilver;
    findLbl('Lbli'+pNomeContainer).Font.Color := clSilver;
    findLbl('Lblj'+pNomeContainer).Font.Color := clSilver;
  end;
  if StrToInt(Copy(IntToStr(pPeriodo),Length(IntToStr(pPeriodo)),1)) = 2 then
  begin
    findLbl('Lbla'+pNomeContainer).Font.Color := clGray;
    findLbl('Lblb'+pNomeContainer).Font.Color := clBlack;
    findLbl('Lblh'+pNomeContainer).Font.Color := clGray;
    findLbl('Lbli'+pNomeContainer).Font.Color := clSilver;
    findLbl('Lblj'+pNomeContainer).Font.Color := clSilver;
  end;
  if StrToInt(Copy(IntToStr(pPeriodo),Length(IntToStr(pPeriodo)),1)) = 9 then
  begin
    findLbl('Lbla'+pNomeContainer).Font.Color := clSilver;
    findLbl('Lblb'+pNomeContainer).Font.Color := clSilver;
    findLbl('Lblc'+pNomeContainer).Font.Color := clGray;
    findLbl('Lbli'+pNomeContainer).Font.Color := clBlack;
    findLbl('Lblj'+pNomeContainer).Font.Color := clGray;
  end;
  if StrToInt(Copy(IntToStr(pPeriodo),Length(IntToStr(pPeriodo)),1)) = 0 then
  begin
    findLbl('Lbla'+pNomeContainer).Font.Color := clSilver;
    findLbl('Lblb'+pNomeContainer).Font.Color := clSilver;
    findLbl('Lblc'+pNomeContainer).Font.Color := clSilver;
    findLbl('Lbld'+pNomeContainer).Font.Color := clGray;
    findLbl('Lbli'+pNomeContainer).Font.Color := clBlack;
    findLbl('Lblj'+pNomeContainer).Font.Color := clBlack;
  end;
  // aparecer ou sumir as redicencias...
  if StrToInt( findLbl('Lbla'+pNomeContainer).Caption ) > 10 then
    findLbl('Lbl1Red'+pNomeContainer).Visible := True
  else findLbl('Lbl1Red'+pNomeContainer).Visible := False;
  Application.ProcessMessages;
end;

procedure TFrmArmazenagem.MostraCalculos(Sender : TObject);
begin
  pnlMostraCalculo.Visible := True;
  lblCalculos.Caption := TImage(Sender).Hint;
end;

procedure TFrmArmazenagem.CriaImagemCalc(pName,pNomeContainer,pHint:String);
begin
  with TImage.Create(TScrollBox(FindComponent('scbBaseGeral')).FindComponent('pnlBase' + pNomeContainer)) do
  begin
    Name         := pName;
    Parent       := pnlBase(toFind,pNomeContainer);
    Left         := 138;
    Top          := 9;
    Width        := 15;
    Height       := 20;
    Picture.LoadFromFile('C:\DDBroker\CALCULAT.BMP');
    ShowHint     := True;
    Hint         := pHint;
    OnClick      := MostraCalculos;
    Transparent  := True;
    Visible      := True;
  end;
end;


procedure TfrmArmazenagem.AdicionaContainer(pNomeContainer,pNomeExibicao,pTipoRegistro : string);

  procedure CriaShape(pLeft,pTop,pWidth,pHeight,pPreenchido,pPenWidth:Integer; pBorderColor,pBgColor:TColor; pName:String);
  begin
    with TShape.Create(TScrollBox(FindComponent('scbBaseGeral')).FindComponent('pnlBase' + pNomeContainer)) do
    begin
      Parent  := pnlBase(toFind,pNomeContainer);
      Name    := pName;
      Top     := pTop;
      Left    := pLeft;
      Width   := pWidth;
      Height  := pHeight;
      Pen.Color := pBorderColor;
      Pen.Width := pPenWidth;
      Brush.Color := pBgColor;
      if pPreenchido = 0 then
        Brush.Style := bsClear;
      Visible := True;
    end;
  end;

  procedure CriaLabel(pLeft,pTop,pWidth:Integer; pFontColor:TColor; pCaption,pName:string; pBold,pAutoSize:Boolean; pAlignment:TAlignment);
  begin
    with TLabel.Create(TScrollBox(FindComponent('scbBaseGeral')).FindComponent('pnlBase' + pNomeContainer)) do
    begin
      Name := pName;
      Parent  := pnlBase(toFind,pNomeContainer);
      Caption     := pCaption;
      AutoSize    := False;
      Top         := pTop;
      Left        := pLeft;
      Width       := pWidth;
      Alignment   := pAlignment;
      Font.Color  := pFontColor;
      if pBold then
        Font.Style := [fsBold]
      else Font.Style := [];
      Transparent := True;
      Visible     := True;
    end;
  end;

begin
  try
    // criando o panel basico
    pnlBase(toCreate,pNomeContainer);
    // Criando shapes
    CriaShape(7,16,280,25,1,1,clGray,clWhite,'shp1'+pNomeContainer);
    CriaShape(7,43,280,16,1,1,clGray,$00E6F0E6,'shp2'+pNomeContainer);
    CriaShape(9,9,127,16,1,1,clGray,clSilver,'shp3'+pNomeContainer);
    CriaShape(295,8,420,89,1,1,clGray,clMenuBroker,'shp4'+pNomeContainer);
    CriaShape(413,10,300,85,1,1,clGray,clPnlClaroBroker,'shp5'+pNomeContainer);
    CriaShape(7,59,280,1,1,1,clGray,clWhite,'shp6'+pNomeContainer);
    CriaShape(7,83,280,1,1,1,clGray,clWhite,'shp7'+pNomeContainer);
    CriaShape(27,62,23,19,0,2,clTeal,clWhite,'shpPeriodo'+pNomeContainer);
    // criando os Labels
    CriaLabel(13,10,46,clBlack,'Container','lbl1'+pNomeContainer,False,True,taLeftJustify,);
    if pTipoRegistro = 'CO' then
      CriaLabel(05,23,276,clTeal,FormatMaskText('llll-999-999-9;0;_',pNomeExibicao),'lbl2'+pNomeContainer,True,True,taRightJustify)
    else CriaLabel(05,23,276,clTeal,pNomeExibicao,'lbl2'+pNomeContainer,True,True,taRightJustify);
    CriaLabel(09,45,46,clGray,'Período','lbl3'+pNomeContainer,True,True,taLeftJustify);
    CriaLabel(05,66,13,clSilver,'...','lbl1Red'+pNomeContainer,True,False,taCenter);
    CriaLabel(25,66,27,clSilver,'1','lbla'+pNomeContainer,True,False,taCenter);
    CriaLabel(49,66,27,clGray,'2','lblb'+pNomeContainer,True,False,taCenter);
    CriaLabel(73,66,27,clBlack,'3','lblc'+pNomeContainer,True,False,taCenter);
    CriaLabel(97,66,27,clBlack,'4','lbld'+pNomeContainer,True,False,taCenter);
    CriaLabel(121,66,27,clBlack,'5','lble'+pNomeContainer,True,False,taCenter);
    CriaLabel(145,66,27,clBlack,'6','lblf'+pNomeContainer,True,False,taCenter);
    CriaLabel(169,66,27,clBlack,'7','lblg'+pNomeContainer,True,False,taCenter);
    CriaLabel(193,66,27,clBlack,'8','lblh'+pNomeContainer,True,False,taCenter);
    CriaLabel(217,66,27,clGray,'9','lbli'+pNomeContainer,True,False,taCenter);
    CriaLabel(238,66,38,clSilver,'10','lblj'+pNomeContainer,True,False,taCenter);
    CriaLabel(273,66,13,clSilver,'...','lbl2Red'+pNomeContainer,True,False,taCenter);
    CriaLabel(301,18,98,clBlack,'Entrada no Armazém','lbl4'+pNomeContainer,False,True,taLeftJustify);
    CriaLabel(301,54,84,clBlack,'Tipo do Container','lbl5'+pNomeContainer,False,True,taLeftJustify);
    // criando o edit da Entrada no Armazem
    edtDiversos(toCreate,'edtEntradaArmazem',pNomeContainer,32);
    // criando o edit da Entrada no Armazem
    edtDiversos(toCreate,'edtTipoContainer',pNomeContainer,68);
    // criando o scroll das despesas
    scbDespesas(toCreate,pNomeContainer);
  except
    On e:Exception do
      ShowMessage('Ocorreu o seguinte erro na aplicação : ' + e.message + #10#13 + 'Informe o departamento de TI');
  end;
end;

function TfrmArmazenagem.pnlBase(pOperacao : TTipoOperacao; pCntr : String) : TPanel;
begin
  if pOperacao = toCreate then
  begin
    with TPanel.Create(FrmArmazenagem.FindComponent('scbBaseGeral')) do
    begin
      Name := 'pnlBase'+pCntr;
      Parent  := TScrollBox(FrmArmazenagem.FindComponent('scbBaseGeral'));
      Align   := alTop;
      Caption := '';
      Height  := 102;
      BevelInner := bvNone;
      BevelOuter := bvNone;
      Color := clpnlClaroBroker;
      Visible := True;
    end;
  end else if pOperacao = toFind then
  begin
    Result := TPanel(TScrollBox(FindComponent('scbBaseGeral')).FindComponent('pnlBase'+pCntr));
  end;
end;

function TfrmArmazenagem.edtDiversos(pOperacao : TTipoOperacao; pName, pCntr : String; pTop:Integer=0) : TEdit;
begin
  if pOperacao = toCreate then
  begin
    with TEdit.Create(TScrollBox(FindComponent('scbBaseGeral')).FindComponent('pnlBase'+pCntr)) do
    begin
      Name     := pName+pCntr;
      Parent   := pnlBase(toFind,pCntr);
      Top      := pTop;
      Left     := 302;
      Width    := 103;
      Height   := 18;
      ReadOnLy := True;
      Visible  := True;
      Clear;
    end;
  end else if pOperacao = toFind then
  begin
    Result := TEdit(pnlBase(toFind,pCntr).FindComponent(pName+pCntr));
  end;
end;

function TfrmArmazenagem.scbDespesas(pOperacao : TTipoOperacao; pCntr : String) : TScrollBox;
begin
  if pOperacao = toCreate then
  begin
    with TScrollBox.Create(TScrollBox(FindComponent('scbBaseGeral')).FindComponent('pnlBase'+pCntr)) do
    begin
      Name    := 'scbDespesas'+pCntr;
      Parent  := pnlBase(toFind,pCntr);
      Top     := 12;
      Left    := 417;
      Width   := 294;
      Height  := 82;
      BorderStyle := bsNone;
      Visible := True;
    end;
  end else if pOperacao = toFind then
  begin
    Result := TScrollBox(pnlBase(toFind,pCntr).FindComponent('scbDespesas'+pCntr));
  end;
end;

procedure TfrmArmazenagem.btnConsUnidadeClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
    edtUnidade.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg)
  else edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', edtUnidade.Text,'AP_UNID_NEG');
end;

procedure TfrmArmazenagem.btnConsProdutoClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
    edtProduto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto)
  else edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', edtProduto.Text,'AP_PRODUTO');
end;

procedure TfrmArmazenagem.btnConsProcessoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + edtProduto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + edtUnidade.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  edtProcesso.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;
end;

procedure TfrmArmazenagem.edtUnidadeExit(Sender: TObject);
begin
  edtUnidade.Text := Copy('00',1,2-Length(edtUnidade.Text)) + edtUnidade.Text;
end;

procedure TfrmArmazenagem.edtProdutoExit(Sender: TObject);
begin
  edtProduto.Text := Copy('00',1,2-Length(edtProduto.Text)) + edtProduto.Text;
end;

procedure TfrmArmazenagem.pnlDespesa(pCntr:string; pItem:Integer);
begin
  with TPanel.Create(FindComponent('scbDespesas'+pCntr)) do
  begin
    Name       := 'pnlDespesa'+pCntr+'_'+IntToStr(pItem);
    Parent     := scbDespesas(toFind,pCntr);
    Align      := alTop;
    Alignment  := taLeftJustify;
    BevelInner := bvNone;
    BevelOuter := bvNone;
    Height     := 14;
    Font.Name  := 'Terminal';
    Font.Size  := 6;
    if Length(vDespesasNoArmazem) > 5 then
      Caption := vDespesasNoArmazem[pItem].Despesa + Copy('                                             ',1,45-(Length(vDespesasNoArmazem[pItem].Despesa)+Length(FormatFloat('###,###,##0.00',vDespesasNoArmazem[pItem].ValorTotalDespesa))+3)) + 'R$ ' + FormatFloat('###,###,##0.00',vDespesasNoArmazem[pItem].ValorTotalDespesa)
    else Caption := vDespesasNoArmazem[pItem].Despesa + Copy('                                                ',1,48-(Length(vDespesasNoArmazem[pItem].Despesa)+Length(FormatFloat('###,###,##0.00',vDespesasNoArmazem[pItem].ValorTotalDespesa))+3)) + 'R$ ' + FormatFloat('###,###,##0.00',vDespesasNoArmazem[pItem].ValorTotalDespesa);
    Color      := clPnlClaroBroker;
    Visible    := True;
  end;
end;

procedure TfrmArmazenagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmArmazenagem.FormShow(Sender: TObject);
begin
  pnlTotais.Color := clMenuBroker;
  pnlTop.Color := clMenuBroker;
  vUltimaCor := $00FFECD9;
  shpContainerCarga.Brush.Color := clMenuBroker;
  edtUnidade.Text := str_cd_unid_neg;
  edtProduto.Text := str_cd_produto;
end;

procedure TfrmArmazenagem.btnRefreshClick(Sender: TObject);
var
  i, j, vQtdeContainer, vQtdeCargaSolta : Integer;
  vArmazemDescarga,vArmazemAtracacao,vCntr : string;
  vTotalGeralProcesso : Real;

begin
  with TQuery.Create(application) do
  begin
    try
      vTotalGeralProcesso := 0;
      if edtProcesso.Text = '' then
        Exit;
      if scbBaseGeral <> nil then
        FreeAndNil(scbBaseGeral);
      with TScrollBox.Create(FrmArmazenagem) do
      begin
        Name        := 'scbBaseGeral';
        Parent      := FrmArmazenagem;
        Align       := alClient;
        BorderStyle := bsNone;
        Ctl3D       := False;
        Visible     := True;
        scbBaseGeral.SendToBack;
      end;
      pnlAguarde.Visible := True;
      Application.ProcessMessages;
      Databasename := 'DBBROKER';

      // *********************************** //
      // CALCULANDO PRIMEIRO POR CONTAINER   //
      // *********************************** //

      if rbTudo.Checked or rbContainer.Checked then
      begin
        vArmazemDescarga  := '';
        vArmazemAtracacao := '';
        if ConsultaLookUpSQL('SELECT CD_ARMAZEM_DESCARGA FROM TPROCESSO WHERE NR_PROCESSO = ''' + edtUnidade.Text + edtProduto.Text + edtProcesso.Text + '''','CD_ARMAZEM_DESCARGA') = '' then
        begin
          Application.MessageBox('Ainda não foram escolhidos os armazéns para o processo.' + #13#10 + 'Para a simulação, você deve escolher o armazém nas telas a seguir.', 'Armazéns', MB_OK + MB_ICONINFORMATION);
          vArmazemDescarga  := ConsultaOnLineEx('TARMAZEM','Escolha o Armazém de Descarga para Simulação da Armazenagem',['CD_ARMAZEM','NM_ARMAZEM'],['Código','Nome'],'CD_ARMAZEM',nil, 1, '');
          vArmazemAtracacao := ConsultaOnLineEx('TARMAZEM','Escolha o Armazém de Atracação para Simulação da Armazenagem',['CD_ARMAZEM','NM_ARMAZEM'],['Código','Nome'],'CD_ARMAZEM',nil, 1, '');
        end;

        SQL.Clear;
        SQL.Add('SELECT * FROM TPROCESSO_CNTR');
        SQL.Add(' WHERE NR_PROCESSO = ''' + edtUnidade.Text + edtProduto.Text + edtProcesso.Text + '''');
        if Trim(edtContainerCarga.Text) <> '' then
          SQL.Add(' AND NR_CNTR = ''' + Trim(edtContainerCarga.Text) + '''');
        SQL.Add(' AND IN_DESOVA <> ''1''');
        Open;
        while not EOF do
        begin
          Inc(vQtdeContainer);
          vCntr := FieldByName('NR_CNTR').AsString;
          // adiciona um panel com as configurações para cada container
          AdicionaContainer(vCntr,vCntr,'CO');
          // entrada no Armazem
          edtDiversos(toFind,'edtEntradaArmazem',vCntr).Text := FieldByName('DT_ENT_ARM').AsString;
          // tipo do container
          edtDiversos(toFind,'edtTipoContainer',vCntr).Text  := ConsultaLookUp('TTP_CNTR','TP_CNTR',FieldByName('TP_CNTR').AsString,'NM_TP_CNTR');
          // Verificando e calculando despesas
          if not DespesasNoArmazem(edtUnidade.Text + edtProduto.Text + edtProcesso.Text, vCntr, 'CO', ConsultaLookUp('TTP_CNTR','TP_CNTR',FieldByName('TP_CNTR').AsString,'TP_PESO'), seDiasMais.Value, False, True, vArmazemDescarga,vArmazemAtracacao) then
          begin
            FreeAndNil(scbBaseGeral);
            Exit;
          end;
          // A função joga os calculos para o array "vDespesasNoArmazem", e agora vou fazer um loop para mostrar na tela
          for i := 0 to Length(vDespesasNoArmazem) - 1 do
          begin
            pnlDespesa(vCntr,i);
            // configura o "componente" de período para cada container, em seu panel correspondente
            if vDespesasNoArmazem[i].Item = '514' then
              ConfiguraPeriodo(StrToInt(vDespesasNoArmazem[i].PeriodoAtual),vCntr);
            // acumula o valor para demonstrar o total geral
            vTotalGeralProcesso := vTotalGeralProcesso + vDespesasNoArmazem[i].ValorTotalDespesa;
            // cria botao para visualizar calculos
            if vDespesasNoArmazem[i].Item = '514' then
              CriaImagemCalc('img'+vCntr,vCntr,vDespesasNoArmazem[i].Hint);
          end;
          Next;
        end;

      end;

      // *********************************** //
      // CALCULANDO POR CARGA SOLTA          //
      // *********************************** //

      if rbTudo.Checked or rbCargaSolta.Checked then
      begin

        SQL.Clear;
        SQL.Add('SELECT * FROM TPROCESSO_CARGA_SOLTA');
        SQL.Add(' WHERE NR_PROCESSO = ''' + edtUnidade.Text + edtProduto.Text + edtProcesso.Text + '''');
        if Trim(edtContainerCarga.Text) <> '' then
          SQL.Add(' AND NM_ESPECIE = ''' + Trim(edtContainerCarga.Text) + '''');
        Open;
        while not EOF do
        begin
          Inc(vQtdeCargaSolta);
          vCntr := FieldByName('NR_SEQUENCIA').AsString;
          // adiciona um panel com as configurações para cada container
          AdicionaContainer(vCntr,FieldByName('NM_ESPECIE').AsString,'CS');
          // entrada no Armazem
          edtDiversos(toFind,'edtEntradaArmazem',vCntr).Text := FieldByName('DT_ENT_ARM').AsString;
          // tipo do container
          edtDiversos(toFind,'edtTipoContainer',vCntr).Text := '- - - - - - - - -';
          // Verificando e calculando despesas
          if not DespesasNoArmazem(edtUnidade.Text + edtProduto.Text + edtProcesso.Text, vCntr, 'CS', '', seDiasMais.Value, false, True, '','') then
          begin
            FreeAndNil(scbBaseGeral);
            Exit;
          end;
          // A função joga os calculos para o array "vDespesasNoArmazem", e agora vou fazer um loop para mostrar na tela
          for i := 0 to Length(vDespesasNoArmazem) - 1 do
          begin
            pnlDespesa(vCntr,i);
            // configura o "componente" de período para cada container, em seu panel correspondente
            ConfiguraPeriodo(StrToInt(vDespesasNoArmazem[i].PeriodoAtual),vCntr);
            // acumula o valor para demonstrar o total geral
            vTotalGeralProcesso := vTotalGeralProcesso + vDespesasNoArmazem[i].ValorTotalDespesa;
          end;
          Next;
        end;

      end;

      // *********************************** //
      // DEMONSTRANDO TOTAIS                 //
      // *********************************** //

      lblTotalGeralProcesso.Caption := 'R$ ' + FormatFloat('###,###,##0.00',vTotalGeralProcesso);
      lblQtdeContainers.Caption := IntToStr(vQtdeContainer + vQtdeCargaSolta);
    finally
      Close;
      Free;
      pnlAguarde.Visible := False;
    end;
  end;
end;

procedure TfrmArmazenagem.rbContainerClick(Sender: TObject);
begin
  lblContainerCarga.Caption  := 'Apenas o container';
  edtContainerCarga.Enabled := True;
  shpContainerCarga.Brush.Color := clWhite;
  btnContainerCarga.Enabled := True;
end;

procedure TfrmArmazenagem.rbCargaSoltaClick(Sender: TObject);
begin
  lblContainerCarga.Caption  := 'Apenas a carga';
  edtContainerCarga.Enabled := True;
  shpContainerCarga.Brush.Color := clWhite;
  btnContainerCarga.Enabled := True;
end;

procedure TfrmArmazenagem.rbTudoClick(Sender: TObject);
begin
  edtContainerCarga.Clear;
  edtContainerCarga.Enabled := False;
  shpContainerCarga.Brush.Color := clMenuBroker;
  btnContainerCarga.Enabled := False;
end;

procedure TfrmArmazenagem.btnContainerCargaClick(Sender: TObject);
begin
  if rbContainer.Checked then
    edtContainerCarga.Text := ConsultaOnLineExSQL('SELECT NR_CNTR, DT_ENT_ARM, DT_SAIDA_ARM FROM TPROCESSO_CNTR WHERE NR_PROCESSO = ''' + edtUnidade.Text+edtProduto.Text+edtProcesso.Text + '''','Containers para este processo',['NR_CNTR','DT_ENT_ARM','DT_SAIDA_ARM'],['Container','Entrada no Armazém','Saída do Armazem'],'NR_CNTR')
  else if rbCargaSolta.Checked then
    edtContainerCarga.Text := ConsultaOnLineExSQL('SELECT NM_ESPECIE, DT_ENT_ARM, DT_SAIDA_ARM FROM TPROCESSO_CARGA_SOLTA WHERE NR_PROCESSO = ''' + edtUnidade.Text+edtProduto.Text+edtProcesso.Text + '''','Containers para este processo',['NM_ESPECIE','DT_ENT_ARM','DT_SAIDA_ARM'],['Carga','Entrada no Armazém','Saída do Armazem'],'NM_ESPECIE');
end;

procedure TfrmArmazenagem.btnCancelaDespesasClick(Sender: TObject);
var
  i, j, vTopAux, vQtdeContainer, vQtdeCargaSolta, vTabelaAtiva : Integer;
  vCntr, vDescricao : string;
  vTotalGeralProcesso : Real;
  vCliente, vServico, vArmazemDescarga : String;
  vValorCIF : Real;
  vDataValidade : TDateTime;

begin
  with TQuery.Create(application) do
  begin
    try
     pnlCancelamentoDespesas.Visible := True;
      // Libera da memória o scroll
      if scbCancelamento <> nil then
        FreeAndNil(scbCancelamento);
      // cria-o novamente
      with TScrollBox.Create(frmArmazenagem) do
      begin
        Name        := 'scbCancelamento';
        Parent      := pnlCancelamentoDespesas;
        Align       := alClient;
        BorderStyle := bsNone;
        Ctl3D       := False;
        Visible     := True;
      end;
      // verifica o processo, retornando o cliente, o servico e o armazem, para definir a tabela a ser usada
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT CD_CLIENTE, CD_SERVICO, CD_ARMAZEM_DESCARGA');
      SQL.Add('  FROM TPROCESSO ( NOLOCK )');
      SQL.Add(' WHERE NR_PROCESSO = ''' + edtUnidade.Text + edtProduto.Text + edtProcesso.Text + '''');
      Open;
      vCliente         := Fields[0].AsString;
      vServico         := Fields[1].AsString;
      vArmazemDescarga := Fields[2].AsString;
      Close;
      // verifica a tabela ativa nesse cliente
      SQL.Clear;
      SQL.Add('SELECT TOP 1 CD_TABELA, DT_VALIDADE FROM TARMAZEM_TABELAS_CLIENTE ( NOLOCK )');
      SQL.Add(' WHERE CD_ARMAZEM = ''' + vArmazemDescarga + ''' AND CD_CLIENTE = ''' + vCliente + ''' AND IN_ATIVO = ''1''');
      Open;
      vTabelaAtiva  := StrToIntDef( Fields[0].AsString, 0);
      vDataValidade := Fields[1].AsDateTime;
      Close;
      // se não tem tabela ativa, PAU !
      if vTabelaAtiva = 0 then
        raise Exception.Create('Não existe uma tabela definida ou ativa para este cliente/armazem/serviço.');
      // se ela venceu, PAU !!!!!!!!!!!!!
      if vDataValidade < now then
        raise Exception.Create('A tabela ativa está vencida. Favor verificar !');
      // retorna as despesas da tabela indicada
      SQL.Clear;
      SQL.Add('SELECT CD_ITEM, TX_DESCRICAO_DESPESA');
      SQL.Add('  FROM TARMAZEM_DESPESAS_CLIENTE ( NOLOCK )');
      SQL.Add(' WHERE CD_ARMAZEM = ''' + vArmazemDescarga + ''' AND CD_CLIENTE = ''' + vCliente + '''');
      SQL.Add('   AND CD_TABELA = ''' + IntToStr(vTabelaAtiva) + '''');
      SQL.Add(' GROUP BY CD_ITEM, TX_DESCRICAO_DESPESA');
      Open;
      vTopAux := 5;
      while not EOF do
      begin
        vDescricao := Fields[1].AsString;
        vDescricao := Stringreplace(vDescricao,' ','',[rfReplaceAll]);
        vDescricao := Stringreplace(vDescricao,'/','',[rfReplaceAll]);
        vDescricao := Stringreplace(vDescricao,'-','',[rfReplaceAll]);
        vDescricao := Stringreplace(vDescricao,'"','',[rfReplaceAll]);
        with TCheckBox.Create(frmArmazenagem.FindComponent('scbCancelamento')) do
        begin
          Name    := 'chkCancela' + Fields[0].AsString + '_' + vDescricao;
          Parent  := TScrollBox(frmArmazenagem.FindComponent('scbCancelamento'));
          Caption := Fields[1].AsString;
          Top     := vTopAux;
          Left    := 5;
          Width   := 300;
          Visible := True;
          Checked := ( ConsultaLookupSQL('SELECT COUNT(*) BLA FROM TPROCESSO_ARMAZEM_DESPESAS_CANCELADAS WHERE NR_PROCESSO = ''' + edtUnidade.Text + edtProduto.Text + edtProcesso.Text + ''' AND CD_ITEM = ''' + Fields[0].AsString + '''','BLA') = '1' );
          vTopAux := vTopAux + 20;
        end;
        Next;
      end;
    finally
      Close;
      Free;
    end;
  end;
end;

procedure TfrmArmazenagem.btnConfirmaCancelamentoClick(Sender: TObject);
var i : Integer;
    vItensAdicionados : string;
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('DELETE FROM TPROCESSO_ARMAZEM_DESPESAS_CANCELADAS WHERE NR_PROCESSO = ''' + edtUnidade.Text + edtProduto.Text + edtProcesso.Text + '''');
    ExecSQL;
    for I := 0 to TScrollBox(frmArmazenagem.FindComponent('scbCancelamento')).ComponentCount - 1 do
    begin
      if TScrollBox(frmArmazenagem.FindComponent('scbCancelamento')).Components[i] is TCheckBox then
      begin
        if TCheckBox(TScrollBox(frmArmazenagem.FindComponent('scbCancelamento')).Components[i]).Checked then
        begin
          if Pos(Copy(TCheckBox(TScrollBox(frmArmazenagem.FindComponent('scbCancelamento')).Components[i]).Name,11,3),vItensAdicionados) = 0 then
          begin
            SQL.Clear;
            SQL.Add('INSERT INTO TPROCESSO_ARMAZEM_DESPESAS_CANCELADAS VALUES ( ''' + edtUnidade.Text + edtProduto.Text + edtProcesso.Text + ''',''' + Copy(TCheckBox(TScrollBox(frmArmazenagem.FindComponent('scbCancelamento')).Components[i]).Name,11,3) + ''')');
            ExecSQL;
            vItensAdicionados := vItensAdicionados + ',' + Copy(TCheckBox(TScrollBox(frmArmazenagem.FindComponent('scbCancelamento')).Components[i]).Name,11,3);
          end;
        end;
      end;
    end;
    Free;
    vItensAdicionados := '';
  end;
  pnlCancelamentoDespesas.Visible := False;
  BtnRefreshClick(nil);
end;

procedure TfrmArmazenagem.btnCancelaCancelamentoClick(Sender: TObject);
begin
  // Libera da memória o scroll
  if scbCancelamento <> nil then
    FreeAndNil(scbCancelamento);
  // deixa o painel invisivel
  pnlCancelamentoDespesas.Visible := False;
end;

procedure TfrmArmazenagem.btnFecharClaculosClick(Sender: TObject);
begin
  pnlMostraCalculo.Visible := False;
end;

end.

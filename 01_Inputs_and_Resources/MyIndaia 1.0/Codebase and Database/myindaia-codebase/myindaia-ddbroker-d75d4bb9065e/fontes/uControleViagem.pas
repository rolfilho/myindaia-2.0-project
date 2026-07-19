unit uControleViagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Grids, DBGrids, ExtCtrls, DB, DBTables, Buttons,
  RxGIF, ComCtrls, DateUtils, Menus, CheckLst;

Type
  TTipoOperacao = (toFind, toCreate);

type
  TfrmControleViagem = class(TForm)
    pnl8: TPanel;
    qry_viagem: TQuery;
    ds_viagem: TDataSource;
    qry_embarcacao: TQuery;
    ds_embarcacao: TDataSource;
    qry_embarcacaoCD_EMBARCACAO: TStringField;
    qry_embarcacaoNM_EMBARCACAO: TStringField;
    qry_embarcacaoCD_BANDEIRA: TStringField;
    qry_viagemNR_VIAGEM: TStringField;
    qry_viagemDT_ESPERADA: TDateTimeField;
    qry_viagemDT_ENT: TDateTimeField;
    qry_viagemCD_ARMAZEM_ATRACACAO: TStringField;
    qry_viagemNR_MANIFESTO: TStringField;
    qry_viagemCD_LOCAL: TStringField;
    pnl10: TPanel;
    pnl9: TPanel;
    pgctrlAlternaModos: TPageControl;
    tsNavio: TTabSheet;
    tsDias: TTabSheet;
    pnlMenu: TPanel;
    lbl1: TLabel;
    shp6: TShape;
    shp7: TShape;
    shp8: TShape;
    lbl18: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    shp9: TShape;
    lbl22: TLabel;
    shp3: TShape;
    pnl3: TPanel;
    pnl6: TPanel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    shp5: TShape;
    lbl17: TLabel;
    lbl5: TLabel;
    shp4: TShape;
    lbl4: TLabel;
    lbl_cd_produto: TLabel;
    btn_co_produto: TSpeedButton;
    mskDtPrevInicio: TMaskEdit;
    mskDtPrevFim: TMaskEdit;
    mskDtAtracadosInicio: TMaskEdit;
    mskDtAtracadosFim: TMaskEdit;
    edtNavio: TEdit;
    edt_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    pnl4: TPanel;
    shp1: TShape;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl16: TLabel;
    dbgrd1: TDBGrid;
    pnl2: TPanel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    dbgrd2: TDBGrid;
    shp2: TShape;
    pnl32: TPanel;
    scbBaseGeral: TScrollBox;
    pnl1: TPanel;
    pnl5: TPanel;
    lbl23: TLabel;
    pnl12: TPanel;
    pnl13: TPanel;
    img1: TImage;
    img2: TImage;
    pnl15: TPanel;
    btn_sair: TSpeedButton;
    pnl16: TPanel;
    pnl21: TPanel;
    pnl25: TPanel;
    pnl26: TPanel;
    pnl27: TPanel;
    pnl28: TPanel;
    pnl29: TPanel;
    pnl30: TPanel;
    pnl14: TPanel;
    lbl19: TLabel;
    pnl38: TPanel;
    pnl39: TPanel;
    pnl40: TPanel;
    pnl41: TPanel;
    pnl42: TPanel;
    pnl43: TPanel;
    pnl7: TPanel;
    pnl11: TPanel;
    pnlAguarde: TPanel;
    shp10: TShape;
    dtpPrevisao: TDateTimePicker;
    pnlHelp: TPanel;
    shp11: TShape;
    lbl24: TLabel;
    lbl25: TLabel;
    shp12: TShape;
    shp13: TShape;
    shp14: TShape;
    lbl26: TLabel;
    popNavio: TPopupMenu;
    VisualizarProcessos1: TMenuItem;
    pnlProcessos: TPanel;
    nbProcessos: TNotebook;
    shp15: TShape;
    lbl27: TLabel;
    pnl18: TPanel;
    btnOk2: TSpeedButton;
    lblNomeNavio1: TLabel;
    pnl22: TPanel;
    chklstVisualizaProcessos: TCheckListBox;
    pnl17: TPanel;
    shp16: TShape;
    shp17: TShape;
    lbl28: TLabel;
    btnIncluiProcesso: TSpeedButton;
    btnExcluirSelecionado: TSpeedButton;
    btnAlimentarFUP: TSpeedButton;
    shp18: TShape;
    shp19: TShape;
    shp20: TShape;
    N1: TMenuItem;
    Estenaviojchegou1: TMenuItem;
    pnlIncluirProcesso: TPanel;
    lbl29: TLabel;
    edtProcesso: TEdit;
    btnProcesso: TSpeedButton;
    btnConfirmar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure edted1Change(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure dbgrd2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormResize(Sender: TObject);
    procedure pgctrlAlternaModosChange(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtpPrevisaoExit(Sender: TObject);
    procedure dtpPrevisaoChange(Sender: TObject);
    procedure VisualizarProcessos1Click(Sender: TObject);
    procedure popNavioPopup(Sender: TObject);
    procedure btnOk2Click(Sender: TObject);
    procedure btnProcessoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    function pnlBase(pOperacao: TTipoOperacao; pNavio: String; pAlign:TAlign=alTop): TPanel;
    procedure CriaImagem(pImagem: String; pLeft, pTop, pHeight, pWidth: Integer;
      pName, pHint,pCodigoNavio: string);
    procedure CriaLabel(pLeft, pTop, pWidth: Integer; pFontColor: TColor;
      pCaption, pName: string; pBold, pAutoSize: Boolean;
      pAlignment: TAlignment; pCodigoNavio, pHint: string);
    procedure CriaShape(pLeft, pTop, pWidth, pHeight, pPreenchido,
      pPenWidth: Integer; pBorderColor, pBgColor: TColor; pName, pCodigoNavio: String);
    procedure ActiveHelp(Sender: TObject;Shift: TShiftState; X, Y: Integer);
    procedure DeActiveHelp(Sender: TObject;Shift: TShiftState; X, Y: Integer);
    { Private declarations }
  public
    { Public declarations }
    vAbrindo : Boolean;
    vPrimeiroDia, vUltimoDia, vDataEscolhida : TDateTime;
    vNavioClicado : string;
  end;

var
  frmControleViagem: TfrmControleViagem;

implementation

{$R *.dfm}

uses Funcoes, PGGP001, PGGP017, ConsOnLineEx;

procedure TfrmControleViagem.FormShow(Sender: TObject);
begin
  pgctrlAlternaModos.ActivePageIndex := 0;
  msk_cd_produto.Text := str_cd_produto;
//  dtpPrevisao.Date := now;
  qry_embarcacao.Open;
  qry_viagem.Open;
  shp1.Brush.Color := clMenuBroker;
  shp2.Brush.Color := clMenuBroker;
  shp3.Brush.Color := clPnlClaroBroker;
  shp4.Brush.Color := clPnlClaroBroker;
  shp5.Brush.Color := clPnlClaroBroker;
  vAbrindo := True;
end;

procedure TfrmControleViagem.edted1Change(Sender: TObject);
begin
  qry_embarcacao.Locate('NM_EMBARCACAO',edtNavio.Text,[loPartialKey]);
end;

procedure TfrmControleViagem.btn_co_produtoClick(Sender: TObject);
begin
  if Sender Is TSpeedButton Then
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto)
  else edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TfrmControleViagem.msk_cd_produtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
    btn_co_produtoClick(btn_co_produto);
end;

procedure TfrmControleViagem.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text = '' then
    Exit;
  qry_embarcacao.Close;
  qry_embarcacao.SQL.Strings[qry_embarcacao.SQL.Count-3] := '   AND VI.CD_PRODUTO = ''' + msk_cd_produto.Text + '''';
  if ( mskDtPrevInicio.Text <> '  /  /    ' ) and ( mskDtPrevFim.Text <> '  /  /    ' ) then
  begin
    qry_embarcacao.SQL.Strings[qry_embarcacao.SQL.Count-2] := '   AND VI.DT_ESPERADA BETWEEN :DT_PREV_INICIO AND :DT_PREV_FIM';
    qry_embarcacao.ParamByName('DT_PREV_INICIO').AsDateTime := StrToDate(mskDtPrevInicio.Text);
    qry_embarcacao.ParamByName('DT_PREV_FIM').AsDateTime    := StrToDate(mskDtPrevFim.Text);
  end else qry_embarcacao.SQL.Strings[qry_embarcacao.SQL.Count-2] := '   AND 1 = 1';
  if ( mskDtAtracadosInicio.Text <> '  /  /    ' ) and ( mskDtAtracadosFim.Text <> '  /  /    ' ) then
  begin
    qry_embarcacao.SQL.Strings[qry_embarcacao.SQL.Count-1] := '   AND VI.DT_ENT      BETWEEN :DT_INICIO AND :DT_FIM';
    qry_embarcacao.ParamByName('DT_INICIO').AsDateTime := StrToDate(mskDtAtracadosInicio.Text);
    qry_embarcacao.ParamByName('DT_FIM').AsDateTime    := StrToDate(mskDtAtracadosFim.Text);
  end else qry_embarcacao.SQL.Strings[qry_embarcacao.SQL.Count-1] := '   AND 1 = 1';
  qry_embarcacao.Open;
end;

procedure TfrmControleViagem.dbgrd2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.Font.Color := clBlack;
  // viagem encerrada
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('DT_ENT').AsDateTime > 0 then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00DDDDDD;
  end else
  // viagem prevista para hoje
  if DateToStr(TDBGrid(Sender).DataSource.DataSet.FieldByName('DT_ESPERADA').AsDateTime) = DateToStr(vDataEscolhida) then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00FAEDD3;
  end else
  // navio atracou hoje
  if DateToStr(TDBGrid(Sender).DataSource.DataSet.FieldByName('DT_ENT').AsDateTime) = DateToStr(vDataEscolhida) then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00DFFFDF;
  end;
  TDBGrid(Sender).Canvas.TextOut(Rect.Left + 2 ,Rect.Top+2, Column.Field.Text );
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmControleViagem.FormResize(Sender: TObject);
begin
  if ( frmControleViagem.WindowState = wsMaximized ) or ( vAbrindo = True ) then
  begin
    vAbrindo := False;
    dbgrd1.Columns[1].Width := 375;
    lbl16.Left := 419;
    dbgrd2.Columns[3].Width := 195;
    dbgrd2.Columns[4].Width := 207;
    lbl14.Left := 437;
    lbl15.Left := 644;
  end else begin
    dbgrd1.Columns[1].Width := 600;
    lbl16.Left := 644;
    dbgRd2.Columns[3].Width := 285;
    dbgrd2.Columns[4].Width := 297;
    lbl14.Left := 527;
    lbl15.Left := 824;
  end;
end;

procedure TfrmControleViagem.CriaShape(pLeft,pTop,pWidth,pHeight,pPreenchido,pPenWidth:Integer; pBorderColor,pBgColor:TColor; pName,pCodigoNavio:String);
begin
  with TShape.Create(TScrollBox(frmControleViagem.FindComponent('scbBaseGeral')).FindComponent('pnlBase' + pCodigoNavio)) do
  begin
    Parent  := pnlBase(toFind,pCodigoNavio);
    Name    := pName;
    Top     := pTop;
    Left    := pLeft;
    Width   := pWidth;
    Height  := pHeight;
    Pen.Color := pBorderColor;
    Pen.Width := pPenWidth;
    Brush.Color := pBgColor;
    Align   := alLeft;
    if pPreenchido = 0 then
      Brush.Style := bsClear;
    if Copy(pName,1,8) = 'shpNavio' then
      OnMouseMove := DeActiveHelp;
    Visible := True;
  end;
end;

procedure TfrmControleViagem.CriaLabel(pLeft,pTop,pWidth:Integer; pFontColor:TColor; pCaption,pName:string; pBold,pAutoSize:Boolean; pAlignment:TAlignment; pCodigoNavio,pHint:String);
begin
  with TLabel.Create(TScrollBox(frmControleViagem.FindComponent('scbBaseGeral')).FindComponent('pnlBase' + pCodigoNavio)) do
  begin
    Name := pName;
    Parent  := pnlBase(toFind,pCodigoNavio);
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
    if pHint <> '' then
      ShowHint    := True;
    Hint        := pHint;
    if Copy(pName,1,8) = 'lblNavio' then
      OnMouseMove := DeActiveHelp;
    Visible     := True;
  end;
end;

procedure TfrmControleViagem.CriaImagem(pImagem : String; pLeft, pTop, pHeight, pWidth : Integer; pName, pHint,pCodigoNavio : string);
begin
  with TImage.Create(TScrollBox(frmControleViagem.FindComponent('scbBaseGeral')).FindComponent('pnlBase' + pCodigoNavio)) do
  begin
    Name         := pName;
    Parent       := pnlBase(toFind,pCodigoNavio);
    Left         := pLeft;
    Top          := pTop;
    Width        := pWidth;
    Height       := pHeight;
    Picture.LoadFromFile(pImagem);
    ShowHint     := True;
    Hint         := pHint;
    if Copy(pName,1,6) = 'imgHlp' then
      OnMouseMove := ActiveHelp
    else begin
      PopupMenu := popNavio;
      Center := True;
    end;
    Transparent  := True;
    Visible      := True;
  end;
end;

function TfrmControleViagem.pnlBase(pOperacao : TTipoOperacao; pNavio : string; pAlign:TAlign=alTop) : TPanel;
begin
  if pOperacao = toCreate then
  begin
    with TPanel.Create(frmControleViagem.FindComponent('scbBaseGeral')) do
    begin
      Name    := 'pnlBase'+pNavio;
      Parent  := TScrollBox(frmControleViagem.FindComponent('scbBaseGeral'));
      Align   := pAlign;
      Caption := '';
      Height  := 21;
      BevelInner := bvNone;
      BevelOuter := bvNone;
      BorderStyle := bsNone;
      Visible := True;
    end;
  end else if pOperacao = toFind then
  begin
    Result := TPanel(TScrollBox(frmControleViagem.FindComponent('scbBaseGeral')).FindComponent('pnlBase'+pNavio));
  end;
end;

procedure TfrmControleViagem.pgctrlAlternaModosChange(Sender: TObject);
var
  i, vPassouHoje : Integer;
begin
  if pgctrlAlternaModos.ActivePageIndex = 1 then
  begin
    vDataEscolhida := now;
    frmControleViagem.BorderStyle := bsNone;
    frmControleViagem.WindowState := wsMaximized;
    pgctrlAlternaModos.ActivePageIndex := 1;
    dtpPrevisaoExit(nil);
  end else begin
    frmControleViagem.WindowState := wsNormal;
    frmControleViagem.BorderStyle := bsSizeable;
  end;
end;

procedure TfrmControleViagem.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmControleViagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmControleViagem.dtpPrevisaoExit(Sender: TObject);

    function PosicionaNavio(pCodigoNavio, pViagem : string; pDataEsperada : TDateTime; pContador : Integer) : Boolean;
    begin
      // começa a posicionar os navios
      if DatetoStr(pDataEsperada) = DatetoStr(vDataEscolhida) then
        CriaImagem('C:\DDBroker\NavioHJ.gif', 334,0,21,83,'img'+IntToStr(pContador)+'_'+pCodigoNavio+'_'+pViagem, 'Esperado para : ' + FormatDateTime('dd"/"mm"/"yyyy',pDataEsperada) + #10#13 + 'Viagem : ' + pViagem ,pCodigoNavio)
      else if pDataEsperada > vDataEscolhida then
        CriaImagem('C:\DDBroker\NavioA.gif', 82+192+((DaysBetween(pDataEsperada, vPrimeiroDia))*36),6,21,36,'img'+IntToStr(pContador)+'_'+pCodigoNavio+'_'+pViagem, 'Esperado para : ' + FormatDateTime('dd"/"mm"/"yyyy',pDataEsperada) + #10#13 + 'Viagem : ' + pViagem,pCodigoNavio)
      else if pDataEsperada < vDataEscolhida then
        CriaImagem('C:\DDBroker\NavioD.gif', 191+((DaysBetween(pDataEsperada, vPrimeiroDia)+1)*36),6,21,36,'img'+IntToStr(pContador)+'_'+pCodigoNavio+'_'+pViagem, 'Esperado para : ' + FormatDateTime('dd"/"mm"/"yyyy',pDataEsperada) + #10#13 + 'Viagem : ' + pViagem,pCodigoNavio);
    end;


    function AdicionaNavio(pCodigoNavio, pNomeNavio : String) : Boolean;
    var
      j : Integer;
    begin
      try
        // criando o panel basico
        pnlBase(toCreate,pCodigoNavio);
        // Criando shapes
        for j := DaysBetween(vDataEscolhida,vUltimoDia)+1 downto 0 do
        begin
          if j = 0 then
            CriaShape(20,0,36,0,1,1,clGray,$00F0E7CE,'shp'+IntToStr(j)+pCodigoNavio,pCodigoNavio)
          else if j = 1 then
            CriaShape(20,0,36,0,1,1,clGray,$00F7F1E1,'shp'+IntToStr(j)+pCodigoNavio,pCodigoNavio)
          else if j = 2 then
            CriaShape(20,0,36,0,1,1,clGray,$00FAF7ED,'shp'+IntToStr(j)+pCodigoNavio,pCodigoNavio)
          else CriaShape(20,0,36,0,1,1,clGray,$00FAF7ED,'shp'+IntToStr(j)+pCodigoNavio,pCodigoNavio);
        end;
        CriaShape(20,0,83,0,1,1,clGray,$00E8D8AE,'shp04'+pCodigoNavio,pCodigoNavio);
        CriaShape(20,0,36,0,1,1,clGray,$00F0E7CE,'shp03'+pCodigoNavio,pCodigoNavio);
        CriaShape(20,0,36,0,1,1,clGray,$00F7F1E1,'shp02'+pCodigoNavio,pCodigoNavio);
        CriaShape(20,0,36,0,1,1,clGray,$00FAF7ED,'shp01'+pCodigoNavio,pCodigoNavio);
        // criando shape pro nome do navio
        CriaShape(0,0,189,0,1,1,clBlack,clBtnFace,'shpNavio'+pCodigoNavio,pCodigoNavio);
        // criando imagens de Help
        CriaImagem('C:\DDBroker\HELPINDX.BMP', 2,3,13,13,'imgHlp'+pCodigoNavio,'',pCodigoNavio);
        // criando os Labels
        CriaLabel(5,5,185,clBlack,'      ' + pNomeNavio,'lblNavio'+pCodigoNavio,False,False,taLeftJustify,pCodigoNavio,'');
      except
        On e:Exception do
          ShowMessage('Ocorreu o seguinte erro na aplicação : ' + e.message + #10#13 + 'Informe o departamento de TI');
      end;

    end;

var
  i, vPassouHoje : Integer;
  vUltimoNavio : string;
  vContador : Integer;

begin
  pnlAguarde.Visible := True;
  Application.ProcessMessages;
  if vDataEscolhida = 0 then
    vDataEscolhida := TDateTimePicker(TScrollBox(frmControleViagem.FindComponent('scbBaseGeral')).FindComponent('dtpPrevisao')).Date;
  if scbBaseGeral <> nil then
    FreeAndNil(scbBaseGeral);
  with TScrollBox.Create(frmControleViagem) do
  begin
    Name        := 'scbBaseGeral';
    Parent      := frmControleViagem.pgctrlAlternaModos.Pages[1];
    Align       := alClient;
    BorderStyle := bsNone;
    Ctl3D       := False;
    HorzScrollBar.Visible := True;
    VertScrollBar.Visible := True;
    Visible     := True;
    scbBaseGeral.SendToBack;
  end;
  // Primeiro dia
  vPrimeiroDia := vDataEscolhida-4;
  // criando query basica
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT MAX(DT_ESPERADA) FROM TVIAGEM (NOLOCK)');
    Open;
    vUltimoDia := Fields[0].AsDateTime;
    Close;
    SQL.Clear;
    SQL.Add('SELECT VI.CD_PRODUTO, VI.CD_EMBARCACAO, EM.NM_EMBARCACAO, VI.NR_VIAGEM, CONVERT(DATETIME,CONVERT(VARCHAR,VI.DT_ESPERADA,103),103) DT_ESPERADA, VI.DT_ENT');
    SQL.Add('  FROM TVIAGEM VI (NOLOCK), TEMBARCACAO EM (NOLOCK), TPROCESSO PR (NOLOCK)');
    SQL.Add(' WHERE VI.DT_ESPERADA IS NOT NULL');
    SQL.Add('   AND VI.DT_ENT IS NULL');
    SQL.Add('   AND VI.DT_ESPERADA > GETDATE()-4');
    SQL.Add('   AND EM.CD_EMBARCACAO = VI.CD_EMBARCACAO');
    SQL.Add('   AND PR.NR_VIAGEM = VI.NR_VIAGEM');
    SQL.Add('   AND PR.CD_EMBARCACAO = EM.CD_EMBARCACAO');
    SQL.Add('   AND PR.CD_PRODUTO = VI.CD_PRODUTO');
    SQL.Add('   AND PR.CD_UNID_NEG = VI.CD_UNID_NEG');
    if msk_cd_produto.Text = '01' then
      SQL.Add('   AND PR.CD_PRODUTO = ''01''');
    SQL.Add(' GROUP BY VI.CD_PRODUTO, VI.CD_EMBARCACAO, EM.NM_EMBARCACAO, VI.NR_VIAGEM, DT_ESPERADA, VI.DT_ENT');
    SQL.Add(' ORDER BY VI.CD_EMBARCACAO');
    Open;
    vUltimoNavio := 'blablabla';
    while not EOF do
    begin
      if vUltimoNavio <> Fields[1].AsString then
      begin
        vContador := 0;
        AdicionaNavio(Fields[1].AsString,Fields[2].AsString);
        vUltimoNavio := Fields[1].AsString;
        PosicionaNavio(Fields[1].AsString,Fields[3].AsString,Fields[4].AsDateTime,vContador);
        Inc(vContador);
      end else begin
        PosicionaNavio(Fields[1].AsString,Fields[3].AsString,Fields[4].AsDateTime,vContador);
        Inc(vContador);
      end;
      Next;
    end;

    // criando o panel para ajuste de tamanho
    with TShape.Create(frmControleViagem.FindComponent('scbBaseGeral')) do
    begin
      Parent  := TScrollBox(frmControleViagem.FindComponent('scbBaseGeral'));
      Name    := 'shpTamanho';
      Align   := alTop;
      Height  := 21;
      Pen.Style := psClear;
      Brush.Style := bsClear;
      Visible := True;
    end;
    // criando o panel para ajuste de tamanho
    with TPanel.Create(frmControleViagem.FindComponent('scbBaseGeral')) do
    begin
      Name        := 'pnlBaseHeader';
      Parent      := TScrollBox(frmControleViagem.FindComponent('scbBaseGeral'));
      Align       := alNone;
      Caption     := '';
      Height      := 21;
      Width       := 280+((DaysBetween(vPrimeiroDia,vUltimoDia)+1)*36);
      Top         := 0;
      BevelInner  := bvNone;
      BevelOuter  := bvNone;
      BorderStyle := bsNone;
      Visible     := True;
    end;
    // Criando shapes
    for i := DaysBetween(vDataEscolhida,vUltimoDia)+1 downto 0 do
      CriaShape(20,0,36,20,1,1,clBlack,clPnlClaroBroker,'shp'+IntToStr(i)+'Header','Header');

    with TDateTimePicker.Create(frmControleViagem.FindComponent('scbBaseGeral')) do
    begin
      Name     := 'dtpPrevisao';
      Parent   := pnlBase(toFind,'Header');
      Top      := -1;
      Left     := 331;
      Width    := 86;
      Height   := 24;
      Date     := vDataEscolhida;
      Color    := clWhite;
      OnChange := dtpPrevisaoChange;
      OnExit   := dtpPrevisaoExit;
      Visible  := True;
    end;

    CriaShape(20,0,83,20,1,1,clBlack,clPnlClaroBroker,'shp04Header','Header');
    CriaShape(20,0,36,20,1,1,clBlack,clPnlClaroBroker,'shp03Header','Header');
    CriaShape(20,0,36,20,1,1,clBlack,clPnlClaroBroker,'shp02Header','Header');
    CriaShape(20,0,36,20,1,1,clBlack,clPnlClaroBroker,'shp01Header','Header');
    // Criando as datas
    for i := 0 to DaysBetween(vPrimeiroDia,vUltimoDia)+1 do
    begin
      if i = 4 then
      begin
        vPassouHoje := 46;
        continue;
      end;
      if ( UpperCase(FormatDateTime('ddd',vPrimeiroDia+i)) = 'SUN' ) or
         ( UpperCase(FormatDateTime('ddd',vPrimeiroDia+i)) = 'DOM' ) or
         ( UpperCase(FormatDateTime('ddd',vPrimeiroDia+i+1)) = 'SUN' ) or
         ( UpperCase(FormatDateTime('ddd',vPrimeiroDia+i+1)) = 'DOM' ) then
        CriaLabel(192+(i*36)+vPassouHoje,5,35,clRed,FormatDateTime('dd"/"mm',vPrimeiroDia+i),'lblDataHeader'+IntToStr(i),False,True,taLeftJustify,'Header',FormatDateTime('dddd',vPrimeiroDia+i))
      else
        CriaLabel(192+(i*36)+vPassouHoje,5,35,clBlack,FormatDateTime('dd"/"mm',vPrimeiroDia+i),'lblDataHeader'+IntToStr(i),False,True,taLeftJustify,'Header',FormatDateTime('dddd',vPrimeiroDia+i))
    end;
    vPassouHoje := 0;
    // criando shape pro nome do navio
    CriaShape(0,0,189,0,1,1,clBlack,clMenuBroker,'shpNavioHeader','Header');
    // criando os Labels
    CriaLabel(5,5,185,clBlack,'Nome do Navio','lblNavioHeader',True,False,taLeftJustify,'Header','');

    vDataEscolhida := 0;

    Application.ProcessMessages;
    Close;
    Free;
  end;
  pgctrlAlternaModos.ActivePageIndex := 1;
  pnlAguarde.Visible := False;
  Application.ProcessMessages;
end;

procedure TfrmControleViagem.dtpPrevisaoChange(Sender: TObject);
begin
  vDataEscolhida := TDateTimePicker(TScrollBox(frmControleViagem.FindComponent('scbBaseGeral')).FindComponent('dtpPrevisao')).Date;
end;

procedure TfrmControleViagem.ActiveHelp(Sender: TObject;Shift: TShiftState; X, Y: Integer);
begin
  if not pnlHelp.Visible then
  begin
    pnlHelp.Visible := True;
  end;
end;

procedure TfrmControleViagem.DeActiveHelp(Sender: TObject;Shift: TShiftState; X, Y: Integer);
begin
  pnlHelp.Visible := False;
end;

procedure TfrmControleViagem.VisualizarProcessos1Click(Sender: TObject);
var
  vUltimoProduto : string;
begin
  pnlProcessos.Visible := True;
  nbProcessos.ActivePage := 'Vizualizar';
  lblNomeNavio1.Caption  := ConsultaLookUp('TEMBARCACAO','CD_EMBARCACAO',Copy(vNavioClicado,Pos('_',vNavioClicado)+1,4),'NM_EMBARCACAO');
  chklstVisualizaProcessos.Clear;
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT PR.CD_PRODUTO, PR.NR_PROCESSO, EN.NM_EMPRESA');
    SQL.Add('  FROM TPROCESSO PR (NOLOCK), TEMPRESA_NAC EN (NOLOCK)');
    SQL.Add(' WHERE PR.NR_VIAGEM = ''' + Copy(vNavioClicado,Length(vNavioClicado)-3,4) + '''');
    SQL.Add('   AND PR.CD_EMBARCACAO = ''' + Copy(vNavioClicado,Pos('_',vNavioClicado)+1,4) + '''');
    SQL.Add('   AND EN.CD_EMPRESA = PR.CD_CLIENTE');
    SQL.Add(' ORDER BY PR.CD_PRODUTO');
    Open;
    while not EOF do
    begin
      chklstVisualizaProcessos.Items.Add(' ' + Trim(Copy(Fields[1].AsString,5,12)) + ' ( ' + Fields[2].AsString + ' ) ');
      Next;
    end;
    Close;
    Free;
  end;
end;

procedure TfrmControleViagem.popNavioPopup(Sender: TObject);
var Pos : TPoint;
    Control: TControl;
begin
  GetCursorPos(Pos);
  Control := FindDragTarget(Pos, True);
  if (Control <> nil) then
    vNavioClicado := Control.Name;
end;

procedure TfrmControleViagem.btnOk2Click(Sender: TObject);
begin
  pnlProcessos.Visible := False;
end;

procedure TfrmControleViagem.btnProcessoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  edtProcesso.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil, Edtprocesso.Text);
  vListAux.Free;
end;

procedure TfrmControleViagem.btnConfirmarClick(Sender: TObject);
var
  vFazEmbarcacao, vFazViagem : Boolean;
  vCdEmbarcacaoAtual, vCdViagemAtual : string;
begin
  vFazEmbarcacao := False;
  vCdEmbarcacaoAtual := Trim(ConsultaLookUp('TPROCESSO','NR_PROCESSO',edtProcesso.Text,'CD_EMBARCACAO'));
  if ( vCdEmbarcacaoAtual <> '' ) and ( vCdEmbarcacaoAtual <> Copy(vNavioClicado,Pos('_',vNavioClicado)+1,4) ) then
  begin
    if Application.MessageBox('Este processo já tem uma embarcação atribuída. Deseja alterar para a nova embarcação ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes then
     vFazEmbarcacao := True;
  end else vFazEmbarcacao := True;
  if not vFazEmbarcacao then
    Exit;
  vFazViagem := False;
  vCdViagemAtual := Trim(ConsultaLookUp('TPROCESSO','NR_PROCESSO',edtProcesso.Text,'NR_VIAGEM'));
  if ( vCdViagemAtual <> '' ) and ( vCdViagemAtual <> Copy(vNavioClicado,Length(vNavioClicado)-3,4) ) then
  begin
    if Application.MessageBox('Este processo já tem uma viagem atribuída. Deseja alterar para a nova viagem ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes then
     vFazViagem := True;
  end else vFazViagem := True;
  if vFazEmbarcacao or vFazViagem then
  begin
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TPROCESSO SET ');
      if vFazEmbarcacao then
        SQL.Add('       CD_EMBARCACAO = ''' + Copy(vNavioClicado,Pos('_',vNavioClicado)+1,4) + ''', ');
      if vFazEmbarcacao and vFazViagem then
        SQL.Add('       NR_VIAGEM     = ''' + Copy(vNavioClicado,Length(vNavioClicado)-3,4) + '''');
      SQL.Add(' WHERE NR_PROCESSO   = ''' + edtProcesso.Text + '''');
      ExecSQL;
      Free;
    end;
  end;
end;

end.


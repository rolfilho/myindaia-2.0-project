unit usemaforico;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxHyperLinkEdit, OleCtrls, SHDocVw, MSHTML, ComCtrls, Buttons,
  InvokeRegistry, Rio, cxDBLookupComboBox, cxGridExportLink, RxGIF, jpeg, Mask,
  ToolEdit, cxLabel, ppCtrls, ppBands, ppPrnabl, ppClass, ppCache,
  ppParameter, ppComm, ppRelatv, ppProd, ppReport, ppModule, raCodMod,
  ppDB, ppDBPipe, ppStrtch, ppSubRpt, ppRegion, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter;

type
  Tfrm_semaforico = class(TForm)
    pnlTopo: TPanel;
    rgProduto: TRadioGroup;
    pnlButton: TPanel;
    qryCadastroViagem: TQuery;
    dsCadastroViagem: TDataSource;
    qryCadastroViagemCD_UNID_NEG: TStringField;
    qryCadastroViagemCD_PRODUTO: TStringField;
    qryCadastroViagemCD_LOCAL: TStringField;
    qryCadastroViagemCD_EMBARCACAO: TStringField;
    qryCadastroViagemNM_EMBARCACAO: TStringField;
    qryCadastroViagemNR_VIAGEM: TStringField;
    qryCadastroViagemDT_ESPERADA: TDateTimeField;
    qryCadastroViagemDT_ENT: TDateTimeField;
    qryCadastroViagemNR_MANIFESTO: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1NM_EMBARCACAO: TcxGridDBColumn;
    cxGrid1DBTableView1NR_VIAGEM: TcxGridDBColumn;
    cxGrid1DBTableView1DT_ESPERADA: TcxGridDBColumn;
    cxGrid1DBTableView1DT_ENT: TcxGridDBColumn;
    cxGrid1DBTableView1NR_MANIFESTO: TcxGridDBColumn;
    updCadastroViagem: TUpdateSQL;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    qryViagemTerminal: TQuery;
    qryViagemTerminalDESCRICAO: TStringField;
    qryCadastroViagemID_EMBARCACAO: TIntegerField;
    Button1: TButton;
    Timer: TTimer;
    qryArmazem: TQuery;
    qryArmazemCD_ARMAZEM: TStringField;
    qryArmazemNM_ARMAZEM: TStringField;
    cxGrid1DBTableView1CD_ARMAZEM_ATRACACAO: TcxGridDBColumn;
    dsArmazem: TDataSource;
    qryCadastroViagemCD_ARMAZEM_ATRACACAO: TStringField;
    pnlNav: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    btnExcel: TSpeedButton;
    btn_sair: TSpeedButton;
    sp_ev_prev_fabrica_viagem: TStoredProc;
    WebBrowser: TWebBrowser;
    pnlGeral: TPanel;
    pnlLogin: TPanel;
    btn_efetuar: TSpeedButton;
    lblLogin: TLabel;
    Label1: TLabel;
    btn_cancelar: TSpeedButton;
    edtSenha: TEdit;
    edtLogin: TEdit;
    PageControl: TPageControl;
    lblAviso: TLabel;
    Memo1: TMemo;
    Label2: TLabel;
    edt_dataI: TDateEdit;
    Label3: TLabel;
    edt_dataF: TDateEdit;
    btnPeriodo: TButton;
    Label4: TLabel;
    cxGrid1DBTableView1Status: TcxGridDBColumn;
    btn_imprimir: TSpeedButton;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppDB_CadastroViagem: TppDBPipeline;
    qryCadastroViagemNM_ARMAZEM: TStringField;
    qryCadastroViagemSTATUS_INDEXADO: TStringField;
    qryCadastroViagemNR_VIAGEM_ARMADOR: TStringField;
    cxGrid1DBTableView1NR_VIAGEM_ARMADOR2: TcxGridDBColumn;
    ppDB_UnidNeg: TppDBPipeline;
    qry_unidade_negocio: TQuery;
    ds_unidade_negocio: TDataSource;
    qry_unidade_negocioEND_STS: TStringField;
    qry_unidade_negocioEND_RIO: TStringField;
    qry_unidade_negocioEND_SP: TStringField;
    ppTitleBand2: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppRegion2: TppRegion;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBTerminal: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppRegion1: TppRegion;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppLabel4: TppLabel;
    pplbl_periodo: TppLabel;
    ppLabel5: TppLabel;
    pplbl_emitido: TppLabel;
    ppLabel45: TppLabel;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppImage3: TppImage;
    ppLine5: TppLine;
    ppDetailBand14: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppShape76: TppShape;
    ppLabel39: TppLabel;
    ppLabel23: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel30: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel67: TppLabel;
    pplbl_usuario: TppLabel;
    ppLine3: TppLine;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLine4: TppLine;
    ppDBText5: TppDBText;
    ppDBText11: TppDBText;
    ppDBText9: TppDBText;
    pbSite: TProgressBar;
    qryArmazemNM_SIGLA: TStringField;
    qryCadastroViagemNM_PORTO: TStringField;
    qryCadastroViagemSTATUS: TStringField;
    qryCadastroViagemCALC_NM_ARMAZEM: TStringField;
    sp_atualiza_fup_demurrage_processos_viagem: TStoredProc;
    procedure FormShow(Sender: TObject);
    procedure rgProdutoClick(Sender: TObject);
    procedure WebBrowserImpDocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure PageControlChange(Sender: TObject);
    procedure qryCadastroViagemAfterPost(DataSet: TDataSet);
    procedure cxGrid1DBTableView1NM_EMBARCACAOPropertiesStartClick(
      Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_efetuarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPeriodoClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure WebBrowserProgressChange(Sender: TObject; Progress,
      ProgressMax: Integer);
    procedure WebBrowserDocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);

  private
    FScript: String;
    procedure pBeforePrint(Sender: TObject);

  public
    procedure ExecScript(AScript: String);
    procedure CriaTabSheet;
    procedure ConectaSite;
    procedure Esconde(vEsconder : Boolean);
    procedure FiltraLocalEmbarque;
    procedure EfetuarLogin;
  end;

var
  frm_semaforico: Tfrm_semaforico;
  vLogin, vSenha : String;
  vAcessoLiberado : Boolean;
  vTentativas    : Integer;

implementation

uses GSMLIB, PGSM990, ConsOnLineEx, PGGP001, Funcoes;

{$R *.dfm}

procedure Tfrm_semaforico.FormShow(Sender: TObject);
begin
  vAcessoLiberado  := False;
  vTentativas      := 0;
  pnlLogin.Visible := False;
  pnlGeral.Visible := True;

  qryArmazem.Close;
  qryArmazem.Open;  

  qryCadastroViagem.disableControls;
  qryCadastroViagem.Close;
  qryCadastroViagem.SQL.Strings[100] := ' WHERE V.DT_ESPERADA BETWEEN convert(datetime, convert(varchar, GETDATE(), 103),103)-3 AND GETDATE()+11';
  qryCadastroViagem.SQL.Strings[101] := ' AND V.CD_PRODUTO IN ("01","03")';

  qryViagemTerminal.Close;
  qryViagemTerminal.SQL.Strings[4] := ' WHERE V.DT_ESPERADA BETWEEN convert(datetime, convert(varchar, GETDATE(), 103),103)-3 AND GETDATE()+11';
  qryViagemTerminal.SQL.Strings[5] := ' AND V.CD_PRODUTO IN ("01","03")';

  edt_dataI.Text := FormatDateTime('dd/mm/yyyy', now-3);
  edt_dataF.Text := FormatDateTime('dd/mm/yyyy', now+11);

  CriaTabSheet;

  pnlNav.Width := frm_semaforico.Width - 33;
  pbSite.Left  := PageControl.Width - pbSite.Width - 2;
  pbSite.Top   := PageControl.Top + 2;
end;

procedure Tfrm_semaforico.rgProdutoClick(Sender: TObject);
begin
  qryCadastroViagem.disableControls;
  qryViagemTerminal.Close;
  qryCadastroViagem.Close;

  if rgProduto.ItemIndex = 0 then
  begin
    qryCadastroViagem.SQL.Strings[101] := ' AND V.CD_PRODUTO IN ("01","03")';
    qryViagemTerminal.SQL.Strings[5]   := ' AND V.CD_PRODUTO IN ("01","03")';

    qryCadastroViagemDT_ESPERADA.DisplayLabel := 'Esperada';
    qryCadastroViagemDT_ENT.DisplayLabel      := 'Entrada';
    cxGrid1DBTableView1NR_MANIFESTO.Visible   := True;
  end
  else
  begin
    qryCadastroViagem.SQL.Strings[101] := ' AND V.CD_PRODUTO IN ("02","10")';
    qryViagemTerminal.SQL.Strings[5]   := ' AND V.CD_PRODUTO IN ("02","10")';

    cxGrid1DBTableView1NR_MANIFESTO.Visible   := False;
    qryCadastroViagemDT_ESPERADA.DisplayLabel := 'Chegada';
    qryCadastroViagemDT_ENT.DisplayLabel      := 'Saida';
  end;
  qryCadastroViagem.SQL.Strings[102] := '';

  CriaTabSheet;
end;

procedure Tfrm_semaforico.WebBrowserImpDocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  Esconde(False);
  Esconde(True);
end;

procedure Tfrm_semaforico.ExecScript(AScript: String);
var
  Doc: IHTMLDocument2;
begin
  if WebBrowser.Document = nil then
    Exit;

  if AScript <> '' then
  begin
    Doc := WebBrowser.Document as IHTMLDocument2;
    Doc.parentWindow.execScript(AScript, 'javascript');
  end;
end;

procedure Tfrm_semaforico.PageControlChange(Sender: TObject);
begin
  FiltraLocalEmbarque;
end;

procedure Tfrm_semaforico.CriaTabSheet;
var i : Integer;
  CriaFolder : TTabSheet;
begin
  i := PageControl.PageCount -1;
  while i > -1  do
  begin
    PageControl.Pages[i].Free;
    i := i - 1;
  end;
  i := -1;

  qryCadastroViagem.Open;
  qryCadastroViagem.enableControls;

  qryViagemTerminal.Open;
  qryViagemTerminal.First;
  while not qryViagemTerminal.Eof do
  begin
    if qryViagemTerminalDESCRICAO.AsString <> '' then
    begin
      i := i + 1;
      CriaFolder             := TTabSheet.Create(PageControl);
      CriaFolder.Parent      := PageControl;
      CriaFolder.PageControl := PageControl;
      CriaFolder.Name        := 'Ts'+intToStr(i);
      CriaFolder.Caption     := qryViagemTerminalDESCRICAO.AsString;
      CriaFolder.PageIndex   := i;
    end;
    qryViagemTerminal.Next;
  end;

  FiltraLocalEmbarque;
end;

procedure Tfrm_semaforico.qryCadastroViagemAfterPost(DataSet: TDataSet);
begin
  qryCadastroViagem.DisableControls;
  qryCadastroViagem.ApplyUpdates;
  qryCadastroViagem.enableControls;
  
  //CloseStoredProc ( sp_ev_prev_fabrica_viagem );
  //sp_ev_prev_fabrica_viagem.ParamByName('@cd_unid_neg').AsString   := qryCadastroViagemCD_UNID_NEG.AsString;
  //sp_ev_prev_fabrica_viagem.ParamByName('@cd_produto').AsString    := qryCadastroViagemCD_PRODUTO.AsString;
  //sp_ev_prev_fabrica_viagem.ParamByName('@cd_embarcacao').AsString := qryCadastroViagemCD_EMBARCACAO.AsString;
  //sp_ev_prev_fabrica_viagem.ParamByName('@nr_viagem').AsString     := qryCadastroViagemNR_VIAGEM.AsString;
  //sp_ev_prev_fabrica_viagem.ParamByName('@cd_local').AsString      := qryCadastroViagemCD_LOCAL.AsString;
  //ExecStoredProc( sp_ev_prev_fabrica_viagem );
  //CloseStoredProc( sp_ev_prev_fabrica_viagem );
               
  CloseStoredProc ( sp_atualiza_fup_demurrage_processos_viagem );
  sp_atualiza_fup_demurrage_processos_viagem.ParamByName('@cd_unid_neg').AsString   := qryCadastroViagemCD_UNID_NEG.AsString;
  sp_atualiza_fup_demurrage_processos_viagem.ParamByName('@cd_produto').AsString    := qryCadastroViagemCD_PRODUTO.AsString;
  sp_atualiza_fup_demurrage_processos_viagem.ParamByName('@cd_embarcacao').AsString := qryCadastroViagemCD_EMBARCACAO.AsString;
  sp_atualiza_fup_demurrage_processos_viagem.ParamByName('@nr_viagem').AsString     := qryCadastroViagemNR_VIAGEM.AsString;
  ExecStoredProc( sp_atualiza_fup_demurrage_processos_viagem );
  CloseStoredProc( sp_atualiza_fup_demurrage_processos_viagem );     

 // AtualizarFollowupViagem(qryCadastroViagemCD_UNID_NEG.AsString, qryCadastroViagemCD_PRODUTO.AsString, qryCadastroViagemCD_EMBARCACAO.AsString, qryCadastroViagemNR_VIAGEM.AsString);
end;

procedure Tfrm_semaforico.cxGrid1DBTableView1NM_EMBARCACAOPropertiesStartClick(
  Sender: TObject);
var
  Doc : IHTMLDocument2;
  vScript: String;
begin
  if qryCadastroViagemCD_LOCAL.AsString = '0002' then
  begin
    if (WebBrowser.LocationURL = 'http://www.semaforico.gestaoderedes.com.br/Semaforico/security/Mensagem.aspx') or
       (WebBrowser.LocationURL = 'http://www.semaforico.gestaoderedes.com.br/Semaforico/Consultas/conHistorico.aspx') then
      vAcessoLiberado := True
    else
      vAcessoLiberado := False;

    if vAcessoLiberado = False then
    begin
      EfetuarLogin;
      Exit;
    end;

    if (WebBrowser.Document = nil) then
      ConectaSite;
    Doc := WebBrowser.Document as IHTMLDocument2;

    if not SameText(Doc.location.toString, 'http://www.semaforico.gestaoderedes.com.br/Semaforico/Consultas/conHistorico.aspx') then
    begin
      WebBrowser.Navigate('http://www.semaforico.gestaoderedes.com.br/Semaforico/Consultas/conHistorico.aspx');
      FScript := ' document.getElementById("ctl00_MainContent_hfIdNavio").value = "'+qryCadastroViagemID_EMBARCACAO.AsString+'";' +
                 ' document.getElementById("ctl00_MainContent_btnPesquisa").click();';
    end
    else
    begin
      vScript := ' document.getElementById("ctl00_MainContent_hfIdNavio").value = "'+qryCadastroViagemID_EMBARCACAO.AsString+'";' +
                 ' document.getElementById("ctl00_MainContent_btnPesquisa").click();';

      if Assigned(Doc) then
        Doc.parentWindow.execScript(vScript, 'javascript');
    end;

    if SameText(Doc.location.toString, 'http://www.semaforico.gestaoderedes.com.br/Semaforico/Consultas/conHistorico.aspx') and Assigned(Doc) then
      Doc.parentWindow.execScript(vScript, 'javascript');

    Timer.Enabled := True;
  end
end;

procedure Tfrm_semaforico.ConectaSite;
var
  vScript: String;
begin
  vScript := 'if ((document.getElementById("lgnSemaforico_UserName")) && (document.getElementById("lgnSemaforico_UserName").value == "")) {' +
           '   document.getElementById("lgnSemaforico_UserName").value = "'+vLogin+'";' +
           '   document.getElementById("lgnSemaforico_Password").value = "'+vSenha+'";' +
           '   document.getElementById("lgnSemaforico_LoginButton").click();' +
           '}';

  WebBrowser.Navigate('http://www.semaforico.gestaoderedes.com.br/Semaforico/Security/Login.aspx');

  while (WebBrowser.LocationURL = '') or (CompareText(WebBrowser.LocationURL, 'http://www.semaforico.gestaoderedes.com.br/Semaforico/Security/Login.aspx') <> 0) do
  begin
    Sleep(2000);    //de 1 para 3
    Application.ProcessMessages;
  end;

  Sleep(12000); // de 2 para 15
  Application.ProcessMessages;
  (WebBrowser.Document as IHTMLDocument2).parentWindow.execScript(vScript, 'javascript');
end;

procedure Tfrm_semaforico.Button1Click(Sender: TObject);
var
  Doc : IHTMLDocument2;
begin
  Doc := WebBrowser.Document as IHTMLDocument2;
  while (WebBrowser.LocationURL = '') or (CompareText(WebBrowser.LocationURL, 'http://www.semaforico.gestaoderedes.com.br/Semaforico/Consultas/conHistorico.aspx') = 0) do
  begin
    Sleep(300);    //de 1 para 3
    Application.ProcessMessages;
  end;

  Doc.parentWindow.execScript(Memo1.Text, 'javascript');
  Timer.Enabled := False;
end;

procedure Tfrm_semaforico.TimerTimer(Sender: TObject);
begin
  Exit; // Incluído por Michel em 13/12/2011 porque estava escondendo todos os campos do site e impossibilitava o usuário de ver os dados
  Esconde(True);
  Timer.Enabled := False;
end;

procedure Tfrm_semaforico.btnExcelClick(Sender: TObject);
begin
  ExportGridToExcel('C:\DDBROKER\Semaforico_'+FormatDateTime('dd-mm-yyyy', Date)+'.xls', cxGrid1);
  Showmessage(' Arquivo Criado');
end;

procedure Tfrm_semaforico.Esconde(vEsconder : Boolean);
var
  Doc: IHTMLDocument2;
  vScript : String;
begin
  if WebBrowser.Document = nil then
    Exit;
  Doc := WebBrowser.Document as IHTMLDocument2;
  if ((FScript <> '') and (vEsconder = False)) then
  begin
    Doc.parentWindow.execScript(FScript, 'javascript');
    FScript := '';
  end;

  if (vEsconder = true) then
  begin
    if (qryCadastroViagemID_EMBARCACAO.AsInteger = 0) then
    begin
      lblAviso.Visible := True;
      vScript := ' if (document.location == "http://www.semaforico.gestaoderedes.com.br/Semaforico/Consultas/conHistorico.aspx"){'+
                 ' setTimeout("escondeTd()",5000);'+
                 ' function escondeTd(){'+
                 ' var i;' +
                 ' for(i=139;i<=158;i++){' +
                 '   if (i != 140){'+
                 '     document.getElementsByTagName("td")[i].style.display="Block";' +
                 ' }}}}'
    end
    else
    begin
      lblAviso.Visible := False;
      vScript := ' if (document.location == "http://www.semaforico.gestaoderedes.com.br/Semaforico/Consultas/conHistorico.aspx"){'+
                 ' setTimeout("escondeTd()",5000);'+     // de 2 para 5
                 ' function escondeTd(){'+
                 ' var i;' +
                 ' for(i=0;i<=158;i++){' +
                 '   if (i != 140){'+
                 '     document.getElementsByTagName("td")[i].style.display="none";' +
                 ' }}}}';
    end;
    Doc.parentWindow.execScript(vScript, 'javascript');
  end
end;

procedure Tfrm_semaforico.FormResize(Sender: TObject);
begin
  pnlNav.Width := frm_semaforico.Width - 33;
  pnlLogin.top := (frm_semaforico.HEIGHT - pnlLogin.HEIGHT) div 2;
  pnlLogin.left := (frm_semaforico.WIDTH - pnlLogin.WIDTH)  div 2;
end;

procedure Tfrm_semaforico.btn_sairClick(Sender: TObject);
begin
  vLogin := '';
  vSenha := '';
  Close;
end;

procedure Tfrm_semaforico.btn_efetuarClick(Sender: TObject);
begin
  if WebBrowser.Document <> nil then
    vTentativas := 1
  else
    vTentativas := 0;

  vLogin := edtLogin.Text;
  vSenha := edtSenha.Text;
  ConectaSite;
  pnlLogin.Visible := False;
  pnlGeral.Enabled := True;
end;

procedure Tfrm_semaforico.btn_cancelarClick(Sender: TObject);
begin
  vAcessoLiberado := False;
  pnlGeral.Enabled := True;
  pnlLogin.Visible := False;
end;


procedure Tfrm_semaforico.FiltraLocalEmbarque;
begin
  qryCadastroViagem.disableControls;
  if (qryCadastroViagem.State in [dsEdit,dsInsert]) then
    qryCadastroViagem.Post;   
  qryCadastroViagem.enableControls;

  qryCadastroViagem.disableControls;
  qryCadastroViagem.Close;
  qryCadastroViagem.SQL.Strings[102] := 'AND L.DESCRICAO LIKE ''%'+PageControl.ActivePage.Caption+'%''';
  qryCadastroViagem.Open;
  qryCadastroViagem.enableControls;

  if PageControl.ActivePage.Caption = 'SANTOS' then
    pnlButton.Visible := True
  else
    pnlButton.Visible := False;
end;

procedure Tfrm_semaforico.EfetuarLogin;
begin
  edtSenha.Text     := '';
  pnlGeral.Enabled  := False;
  pnlLogin.top      := (frm_semaforico.HEIGHT - pnlLogin.HEIGHT) div 2;
  pnlLogin.left     := (frm_semaforico.WIDTH - pnlLogin.WIDTH)  div 2;
  pnlLogin.Visible  := True;
  edtLogin.SetFocus;
end;

procedure Tfrm_semaforico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (qryCadastroViagem.State in [dsEdit,dsInsert]) then
    qryCadastroViagem.Post;
end;

procedure Tfrm_semaforico.btnPeriodoClick(Sender: TObject);
begin
  if ((edt_dataI.Text='  /  /    ') and (edt_dataF.Text<>'  /  /    ')) or
     ((edt_dataI.Text<>'  /  /    ') and (edt_dataF.Text='  /  /    ')) then begin
     Showmessage('As duas datas de pesquisa devem estar: ou Vazias ou Preenchidas.');
     edt_dataI.SetFocus;
     exit;
  end;
  
  qryCadastroViagem.disableControls;
  qryCadastroViagem.Close;
  qryViagemTerminal.Close;

  if edt_dataI.Text<>'  /  /    ' then
  begin
     qryCadastroViagem.SQL.Strings[100] := ' WHERE V.DT_ESPERADA BETWEEN :pDATAI AND :pDATAF';
     qryCadastroViagem.ParamByName('pDATAI').AsDate:=edt_DATAI.Date;
     qryCadastroViagem.ParamByName('pDATAF').AsDate:=edt_DATAF.Date;

     qryViagemTerminal.SQL.Strings[4] := ' WHERE V.DT_ESPERADA BETWEEN :pDATAI AND :pDATAF';
     qryViagemTerminal.ParamByName('pDATAI').AsDate:=edt_DATAI.Date;
     qryViagemTerminal.ParamByName('pDATAF').AsDate:=edt_DATAF.Date;
  end
  else
  begin //usar o padrão
    qryCadastroViagem.SQL.Strings[100] := ' WHERE V.DT_ESPERADA BETWEEN convert(datetime, convert(varchar, GETDATE(), 103),103)-3 AND GETDATE()+11';
    qryViagemTerminal.SQL.Strings[4]   := ' WHERE V.DT_ESPERADA BETWEEN convert(datetime, convert(varchar, GETDATE(), 103),103)-3 AND GETDATE()+11';
    edt_dataI.Text := FormatDateTime('dd/mm/yyyy', now-3);
    edt_dataF.Text := FormatDateTime('dd/mm/yyyy', now+11);
  end;

  qryCadastroViagem.Open;
  qryCadastroViagem.enableControls;
  qryViagemTerminal.Open;

  CriaTabSheet;            
end;

procedure Tfrm_semaforico.btn_imprimirClick(Sender: TObject);
begin
   qryCadastroViagem.SQL.Strings[102] := '';

   { inicia rotina de impressão }
   Application.CreateForm(TFrm_impressao, Frm_impressao );
   if rgProduto.ItemIndex=0 then
      frm_impressao.cd_produto   := '01'
   else
      frm_impressao.cd_produto   := '02';


   frm_impressao.cd_unid_neg   := '01';
   frm_impressao.cd_modulo     := '2297';
   frm_impressao.vBeforePrint  :=  pBeforePrint;
   frm_impressao.ppReport1.PrinterSetup.Copies:=1;
   frm_impressao.vApenas_email := false;
   frm_impressao.ShowModal;
   frm_impressao.Release;
   FreeAndNil( frm_impressao );

   FiltraLocalEmbarque;
end;

procedure Tfrm_semaforico.pBeforePrint(Sender: TObject);
var
str_periodo:String;
begin
  if edt_dataI.Text='  /  /    ' then
     str_periodo:=dateToStr(date-3)+'  à  '+dateToStr(date+11)
  else
     str_periodo:=edt_DataI.Text+'  à  '+edt_DataF.Text;


  TppLabel(Frm_impressao.FindComponent('pplbl_periodo')).Caption  := str_periodo;
  TppLabel(Frm_impressao.FindComponent('pplbl_emitido')).Caption  := DateToStr(date);
  TppLabel(Frm_impressao.FindComponent('pplbl_usuario')).Caption  := str_nm_usuario;
end;


procedure Tfrm_semaforico.WebBrowserProgressChange(Sender: TObject;
  Progress, ProgressMax: Integer);
begin
  pbSite.Max      := ProgressMax;
  pbSite.Position := Progress;
end;

procedure Tfrm_semaforico.WebBrowserDocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  Doc : IHTMLDocument2;
begin
  if FScript <> '' then
  begin
    Doc := WebBrowser.Document as IHTMLDocument2;

    if SameText(Doc.location.toString, 'http://www.semaforico.gestaoderedes.com.br/Semaforico/Consultas/conHistorico.aspx') and Assigned(Doc) then
      Doc.parentWindow.execScript(FScript, 'javascript');

    FScript := '';
  end;
end;

end.

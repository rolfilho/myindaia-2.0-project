unit MyAuditoriaConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, Data.DB, Vcl.OleCtrls, SHDocVw,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  System.StrUtils,
  ActiveX, MSHTML,
  Aurelius.Drivers.FireDac,
  FireDac.Stan.Intf, FireDac.Stan.Option, FireDac.Stan.Param,
  FireDac.Stan.Error, FireDac.DatS, FireDac.Phys.Intf, FireDac.DApt.Intf,
  FireDac.Stan.Async, FireDac.DApt, FireDac.Comp.DataSet, FireDac.Comp.Client;

type
  TformMyauditoriaConsulta = class(TformMyForm)
    pnlDados: TPanel;
    Panel2: TPanel;
    pnlFiltro: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    WebBrowser: TWebBrowser;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    cbxEntidades: TComboBox;
    dsMain: TDataSource;
    Label4: TLabel;
    Memo: TMemo;
    qryMain: TFDQuery;
    qryMainDATA: TSQLTimeStampField;
    qryMainMAQUINA: TStringField;
    qryMainUSUARIO: TStringField;
    qryMainENTIDADE: TStringField;
    qryMainENTIDADE_PAI: TStringField;
    qryMainOPERACAO: TStringField;
    qryMainDETALHES: TMemoField;
    Splitter1: TSplitter;
    procedure Button1Click(Sender: TObject);
    procedure qryMainOPERACAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryMainAfterOpen(DataSet: TDataSet);
    procedure qryMainAfterScroll(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure WebBrowserCommandStateChange(ASender: TObject; Command: Integer;
      Enable: WordBool);
  private
    Zoom: OLEVariant;
    procedure LeConteudo;
    procedure PopulaEntidades;
    function DescricaoOperacao(const Operacao: string): string;
  protected
    procedure DoCreate; override;
  public

  end;

var
  formMyauditoriaConsulta: TformMyauditoriaConsulta;

implementation

{$R *.dfm}

uses MyUtil;

{ TformMyauditoriaConsulta }

{ TformMyauditoriaConsulta }

procedure TformMyauditoriaConsulta.Button1Click(Sender: TObject);
begin
  inherited;
  qryMain.Close;
  qryMain.SQL.Text := 'SELECT DATA, MAQUINA, USUARIO, ENTIDADE, ENTIDADE_PAI, '
    + 'OPERACAO, DETALHES FROM AUDITORIA ' + 'WHERE 0 = 0 ' +
    Ifthen(cbxEntidades.ItemIndex > 0, ' AND ENTIDADE = ' +
    QuotedStr(cbxEntidades.Text)) +
    'ORDER BY DATA DESC';
  qryMain.Open;
end;

procedure TformMyauditoriaConsulta.DoCreate;
begin
  inherited;
  qryMain.Connection := TFireDacConnectionAdapter(FObjectManager.Connection)
    .Connection;
end;

procedure TformMyauditoriaConsulta.FormDestroy(Sender: TObject);
begin
  qryMain.Close;
  inherited;
end;

procedure TformMyauditoriaConsulta.FormShow(Sender: TObject);
begin
  inherited;
  PopulaEntidades;
  WebBrowser.Navigate('about:blank');
end;

procedure TformMyauditoriaConsulta.qryMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  LeConteudo;
end;

procedure TformMyauditoriaConsulta.qryMainAfterScroll(DataSet: TDataSet);
begin
  inherited;
  LeConteudo;
end;

function TformMyauditoriaConsulta.DescricaoOperacao(const Operacao: string): string;
begin
  if Operacao.Equals('I') then
    Result := 'Inclusão'
  else if Operacao.Equals('A') then
    Result := 'Alteração'
  else if Operacao.Equals('E') then
    Result := 'Exclusão'
end;

procedure TformMyauditoriaConsulta.qryMainOPERACAOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  Text := DescricaoOperacao(Sender.AsString);
end;

procedure TformMyauditoriaConsulta.SpeedButton1Click(Sender: TObject);
var
  pvaIn: OLEVariant;
  pvaOut: OLEVariant;
begin
  inherited;
  pvaIn := null;
  WebBrowser.ControlInterface.ExecWB(OLECMDID_ZOOM, OLECMDEXECOPT_PROMPTUSER,
    pvaIn, Zoom);
  if Zoom < 4 then
    Zoom := Zoom + 1;
  WebBrowser.ControlInterface.ExecWB(OLECMDID_ZOOM, OLECMDEXECOPT_PROMPTUSER,
    Zoom, pvaOut);

end;

procedure TformMyauditoriaConsulta.SpeedButton2Click(Sender: TObject);
var
  pvaIn: OLEVariant;
  pvaOut: OLEVariant;
begin
  inherited;
  pvaIn := null;
  WebBrowser.ControlInterface.ExecWB(OLECMDID_ZOOM, OLECMDEXECOPT_PROMPTUSER,
    pvaIn, Zoom);
  if Zoom > 1 then
    Zoom := Zoom - 1;
  WebBrowser.ControlInterface.ExecWB(OLECMDID_ZOOM, OLECMDEXECOPT_PROMPTUSER,
    Zoom, pvaOut);
end;

procedure TformMyauditoriaConsulta.SpeedButton3Click(Sender: TObject);
var
  vaIn, vaOut: OLEVariant;
begin
  inherited;
  WebBrowser.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER,
    vaIn, vaOut);
end;

procedure TformMyauditoriaConsulta.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  // EniarEmail
end;

procedure TformMyauditoriaConsulta.PopulaEntidades;
var
  Classe: TClass;
begin
  cbxEntidades.Items.Clear;
  cbxEntidades.Items.Add('Todas');
  for Classe in FObjectManager.Explorer.Hierarchy.Classes do
    cbxEntidades.Items.Add(Classe.ClassName);
end;

procedure WBFindDialog(AWebBrowser: TWebBrowser);
const
  CGID_WebBrowser: TGUID = '{ED016940-BD5B-11cf-BA4E-00C04FD70816}';
  HTMLID_FIND = 1;
var
  CmdTarget: IOleCommandTarget;
  vaIn, vaOut: OLEVariant;
  PtrGUID: PGUID;
begin
  New(PtrGUID);
  PtrGUID^ := CGID_WebBrowser;
  if AWebBrowser.ControlInterface.Document <> nil then
    try
      AWebBrowser.ControlInterface.Document.QueryInterface(IOleCommandTarget,
        CmdTarget);
      if CmdTarget <> nil then
        try
          CmdTarget.Exec(PtrGUID, HTMLID_FIND, 0, vaIn, vaOut);
        finally
          CmdTarget._Release;
        end;
    except
    end;
  Dispose(PtrGUID);
end;

procedure TformMyauditoriaConsulta.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  WBFindDialog(WebBrowser);
end;

procedure TformMyauditoriaConsulta.WebBrowserCommandStateChange
  (ASender: TObject; Command: Integer; Enable: WordBool);
var
  Doc: IHTMLDocument2;
  Sel: IHTMLSelectionObject;
begin
  inherited;
  if not Assigned(ASender) or not(ASender is TWebBrowser) then
    Exit;
  if TOleEnum(Command) <> CSC_UPDATECOMMANDS then
    Exit;
  Doc := WebBrowser.Document as IHTMLDocument2;
  if not Assigned(Doc) then
    Exit;
  Sel := Doc.selection as IHTMLSelectionObject;
  if Assigned(Sel) and (Sel.type_ = 'Text') then
    ActiveControl := ASender as TWebBrowser;
end;

function RemoveAspas(const aValue: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(aValue) do
    if (aValue[i] <> '"') and (aValue[i] <> #39) then
      Result := Result + aValue[i];
end;

function QuebraDeLinhaHTML(const s: string): string;
begin
  Result := StringReplace(s, #13#10, '<br />', [rfReplaceAll]);
end;

function ObsAuditoriaToHTMLTable(const Modulo, Operacao, Obs: string): string;
const
  Chave = '[CHAVE]';
  ChavePai = '[CHAVE_PAI]';
  Campos = '[COLUNAS]';
var
  s: TStrings;
  i: Integer;
  MontaTabela: Boolean;
  Linhas: TStrings;
  Nome: string;
  Valor: string;
  Header: string;
  TabelaAlt: string;
  Colunas: Integer;
begin
  s := TStringList.Create;
  Linhas := TStringList.Create;
  MontaTabela := False;
  try
    if ((Operacao = 'A') { or (Modulo = 'CFE') } ) then
      Colunas := 3
    else
      Colunas := 2;
    s.Text := Obs;
    for i := 0 to s.Count - 1 do
    begin
      if not MontaTabela then
      begin
        if (s.Strings[i] <> '') and (s.Strings[i] <> Campos) then
        begin
          if s.Strings[i] = Chave then
            Result := '<br /><b>Identificação registro</b><br />'
          else if s.Strings[i] = ChavePai then
            Result := '<br /><b>Identificação registro principal</b><br />'
          else
          begin
            Nome := s.Names[i];
            Valor := s.ValueFromIndex[i];
            if not(Nome.IsEmpty) then
              Result := Result + '<b>' + Nome + '</b>=' + RemoveAspas(Valor)
                + '<br />';
          end;
        end;
      end;
      if MontaTabela then
      begin
        Nome := s.Names[i];
        Valor := s.ValueFromIndex[i];
        Linhas.Add('<tr><td>' + Nome + '</td>');
        Linhas.Add('<td>' + RemoveAspas(TokenN(Valor, 1)) + '</td>');
        if Colunas = 3 then
          Linhas.Add('<td>' + RemoveAspas(TokenN(Valor, 2)) + '</td></tr>');
      end;
      if not MontaTabela then
        MontaTabela := s.Strings[i] = Campos;
    end;
    Header := '<br /><b>Modificações</b><br />' +
      '<table border="1" style="border-collapse:collapse;font:verdana">' +
      '<tr style="background-color:#CCCCCC">' + '<th align="left">Campos</th>' +
      '<th align="left">' + Ifthen(Colunas = 3, 'Antes', 'Valor') + '</th>' +
      Ifthen(Colunas = 3, '<th align="left">Depois</th>') + '</tr>';
    for i := 0 to Linhas.Count - 1 do
      TabelaAlt := TabelaAlt + Linhas.Strings[i];
    Result := Result + Header + TabelaAlt + '</table>';
  finally
    s.Free;
    Linhas.Free;
  end;
end;

procedure WBLoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
var
  Doc: Variant;
begin
  if NOT Assigned(WebBrowser.Document) then
    WebBrowser.Navigate('about:blank');
  Doc := WebBrowser.Document;
  Doc.Clear;
  Doc.Write(HTMLCode);
  Doc.Close;
end;

procedure TformMyauditoriaConsulta.LeConteudo;
var
  Head: string;
  Body: string;
  Footer: string;
begin
  Head := '<html><body><font size="2" face="verdana">';
  Body := // '<b>Empresa:</b> '+ qryMain.AsString+'<br />'+
    '<b>Usuario:</b> ' + qryMainUSUARIO.AsString + '<br />' + '<b>Máquina:</b> '
    + qryMainMAQUINA.AsString + '<br />' +
    '<b>Entidade:</b> '+ qryMainENTIDADE.AsString+'<br />'+
    '<b>Entidade Principal:</b> '+ qryMainENTIDADE_PAI.AsString+'<br />'+
    '<b>Operação:</b> ' + DescricaoOperacao(qryMainOPERACAO.AsString) + '<br />' + '<b>Data:</b> '
    + qryMainDATA.AsString + '<br />' + ObsAuditoriaToHTMLTable
    (qryMainENTIDADE.AsString, qryMainOPERACAO.AsString,
    qryMainDETALHES.AsString);
  Footer := '</font></body></html>';
  WBLoadHTML(WebBrowser, Head + Body + Footer);
end;

end.

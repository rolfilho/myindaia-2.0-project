unit FrXMLTeste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, Vcl.ExtCtrls, Vcl.StdCtrls, System.AnsiStrings,
  Xml.xmldom, Xml.XMLIntf, Data.DB, Xml.XMLDoc,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Aurelius.Sql.MSSQL, Aurelius.Engine.DatabaseManager, Aurelius.Engine.ObjectManager,
  Aurelius.Bind.Dataset, Aurelius.Criteria.Base, Aurelius.Drivers.Interfaces,
  Aurelius.Criteria.Linq, Aurelius.Criteria.Projections,
  Generics.Collections, MyEntitiesBroker, ConnectionModule,
  FireDac.DApt,
  MyDialog, {ClassesXMLDUE,} xsdDue, myGlobal, Aurelius.Bind.BaseDataset;

type
  TformXMLTeste = class(TformMyForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    txtXML: TMemo;
    Panel5: TPanel;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    procedure txtXMLDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    NomeArquivo : String;
    CaminhoOrigem : String;
    { Private declarations }
  public
    class function Execute(aCaminhoOrigem, aNomeArquivo: string): Boolean; static;
  end;

var
  formXMLTeste: TformXMLTeste;
  NrProcesso: String;

implementation

uses
  MyUtil;

{$R *.dfm}

procedure TformXMLTeste.FormActivate(Sender: TObject);
begin
  txtXML.Lines.LoadFromFile(CaminhoOrigem +'\'+ NomeArquivo);
  inherited;
end;

procedure TformXMLTeste.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQL.DBConnection);
    FOwnsManager := True;
  end;
end;

procedure TformXMLTeste.txtXMLDblClick(Sender: TObject);
begin
  inherited;
  txtXML.SelectAll;
end;

procedure TformXMLTeste.Button1Click(Sender: TObject);
begin
  inherited;
  SaveDialog1.FileName := NomeArquivo;
  SaveDialog1.Title := 'Salvar XML Draft/Inttra';
  SaveDialog1.filter := 'Arquivo XML|*.xml';
  SaveDialog1.InitialDir := 'Área de Trabalho';
  if SaveDialog1.Execute then
  begin
    txtXML.Lines.SaveToFile(SaveDialog1.FileName);
    ShowMessage('Arquivo salvo com sucesso!');
  end;
end;

class function TformXMLTeste.Execute(aCaminhoOrigem, aNomeArquivo: string): Boolean;
var
  form: TformXMLTeste;
begin
  form := TformXMLTeste.Create(nil);
  try
    form.CaminhoOrigem := aCaminhoOrigem;
    form.NomeArquivo := aNomeArquivo;
    form.ShowModal;
  finally
    form.Free
  end;
end;

end.

unit uLI_Importa_XML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBClient,
  xmldom, XMLIntf, msxmldom, XMLDoc, DBTables;

type
  TfrmLi_Importa_XML = class(TForm)
    pnlFundo: TPanel;
    Panel1: TPanel;
    dbgListaLis: TDBGrid;
    Panel2: TPanel;
    btnSair: TSpeedButton;
    edtCaminho: TEdit;
    lblCaminhoArquivo: TLabel;
    SpeedButton1: TSpeedButton;
    btnImportarArquivoXMLLI: TSpeedButton;
    btnAceitar: TSpeedButton;
    cdsListaLis: TClientDataSet;
    dsListaLis: TDataSource;
    cdsListaLisNR_PROCESSO: TStringField;
    cdsListaLisNR_LI: TStringField;
    cdsListaLisDT_REGISTRO: TDateTimeField;
    qryInsereLi: TQuery;
    qryVerificaLIExiste: TQuery;
    qryVerificaLIExisteNR_PROCESSO: TStringField;
    qryVerificaLIExisteNR_LI: TStringField;
    qryVerificaLIExisteDT_REGISTRO: TDateTimeField;
    cdsListaLisSTATUS: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btnImportarArquivoXMLLIClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceitarClick(Sender: TObject);
    procedure dbgListaLisDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure LerLI(arquivo : string);
    procedure Processar;
    function InserirLi(nr_proc, nr_li, dataregistro : string) : Boolean;
    function VerificaLiExiste(nr_proc, nr_li : string) : Boolean;
  public
    { Public declarations }
    nr_processo : string;
  end;

var
  frmLi_Importa_XML: TfrmLi_Importa_XML;

implementation

uses
  PGGP017;

{$R *.dfm}

procedure TfrmLi_Importa_XML.SpeedButton1Click(Sender: TObject);
var
  selectedFile: string;
  dlg: TOpenDialog;
begin
  selectedFile := '';
  dlg := TOpenDialog.Create(nil);
  try
    dlg.InitialDir := 'C:\';
    dlg.Filter     := 'XML files (*.xml)|*.XML';

    if dlg.Execute then
      edtCaminho.text := dlg.FileName;
  finally
    dlg.Free;
  end;
end;

procedure TfrmLi_Importa_XML.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLi_Importa_XML.btnImportarArquivoXMLLIClick(Sender: TObject);
begin
  LerLI(edtCaminho.text);
end;


procedure TfrmLi_Importa_XML.LerLI(arquivo : string);
var
  Doc_LI : IXMLDocument;
  Node_ListaLis, NodeLis: IXmlNode;
  i, qtNodesLi :integer;
  NomeNode : String;
begin
  cdsListaLis.DisableControls;
  cdsListaLis.EmptyDataSet;

  Doc_LI        := TXMLDocument.Create(nil);
  Doc_LI.Active := False;
  Doc_LI.LoadFromFile(arquivo);
  Doc_LI.Active := True;

  try
    Node_ListaLis := Doc_LI.DocumentElement.ChildNodes.FindNode('listaLIVORetorno');//.ChildNodes.FindNode('listaLIVORetorno');

    qtNodesLi := Node_ListaLis.ChildNodes.Count;
    for I := 0 to qtNodesLi -1 do
    begin
      NomeNode := UpperCase(Node_ListaLis.ChildNodes[i].NodeName);

      if NomeNode = UpperCase('li') then
      begin
        NodeLis :=  Node_ListaLis.ChildNodes[i];

        cdsListaLis.Append;
        cdsListaLis.FieldByName('NR_PROCESSO').asstring := nr_processo;
        cdsListaLis.FieldByName('NR_LI').asstring       := NodeLis.ChildNodes.Nodes['numeroLI'].Text;
        cdsListaLis.FieldByName('DT_REGISTRO').asstring := NodeLis.ChildNodes.Nodes['dtRegistro'].Text;
        cdsListaLis.Post;
      end;
    end;
  except on e:exception do
  begin
    showmessage('Erro ao ler o arquivo. '#13 + e.message);
  end;
  end;
  cdsListaLis.EnableControls;
end;

procedure TfrmLi_Importa_XML.FormCreate(Sender: TObject);
begin
  cdsListaLis.CreateDataSet;
end;

procedure TfrmLi_Importa_XML.btnAceitarClick(Sender: TObject);
begin
  Processar;
end;

procedure TfrmLi_Importa_XML.Processar;
var  resultado :string;
begin
  cdsListaLis.first;
  while not cdsListaLis.eof do
  begin
    if not VerificaLiExiste(cdsListaLisNR_PROCESSO.asstring,cdsListaLisNR_LI.asstring) then
    begin //li não existe no processo
      if InserirLI(cdsListaLisNR_PROCESSO.asstring,cdsListaLisNR_LI.asstring,cdsListaLisDT_REGISTRO.asstring) then
        resultado := 'a'  //ok
      else
        resultado := 'q'; //erro ao incluir a li
    end
    else  //li já existe no processo
      resultado := 'r'; //não incluir

    cdsListaLis.edit;
    cdsListaLisSTATUS.asstring := resultado;
    cdsListaLis.post;

    cdsListaLis.Next;
  end;
end;

function TfrmLi_Importa_XML.VerificaLiExiste(nr_proc, nr_li : string) : Boolean;
begin
  qryVerificaLIExiste.close;
  qryVerificaLIExiste.ParamByName('NR_PROCESSO').asstring := nr_proc;
  qryVerificaLIExiste.ParamByName('NR_LI').asstring       := nr_li;
  qryVerificaLIExiste.open;
  if qryVerificaLIExiste.isempty then
    result := false
  else
    result := true;
end;

function TfrmLi_Importa_XML.InserirLi(nr_proc, nr_li, dataregistro : string) : Boolean;
begin
  qryInsereLi.close;
  qryInsereLi.ParamByName('NR_PROCESSO').asstring  := nr_proc;
  qryInsereLi.ParamByName('NR_LI').asstring        := nr_li;
  qryInsereLi.ParamByName('DT_REGISTRO').asdatetime  := strtodatetime(dataregistro);
  qryInsereLi.execsql;
  if qryInsereLi.rowsAffected > 0 then
    result := true
  else
    result := false;
end;


procedure TfrmLi_Importa_XML.dbgListaLisDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if (Column.FieldName = 'STATUS') then
    if (Column.Field.asString = 'r') then
      (Sender as TDBGrid).Canvas.Font.Color := clRed
    else
    if (Column.Field.asString = 'q') then
      (Sender as TDBGrid).Canvas.Font.Color := $0004A2BD
    else
      (Sender as TDBGrid).Canvas.Font.Color := clGreen;

   dbgListaLis.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.

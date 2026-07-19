unit DebugDataset;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, ExtCtrls, DB, StdCtrls;

type
  TfrmDebugDataSet = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    ContarRegistros1: TMenuItem;
    dsMain: TDataSource;
    GerarCSV1: TMenuItem;
    SaveDialogCSV: TSaveDialog;
    Button1: TButton;
    cbxAborta: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GerarCSV1Click(Sender: TObject);
    procedure ContarRegistros1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    function ConvertCSV(aTable: TDataSet; aNomeArq: string; aTitulocoluna: Boolean = True; aCampoNulo: Boolean = True; Delimitador: string = ';'): Integer;
    function EmptyFieldText(Field: TField): string;
    function EmptyFieldValue(Field: TField): string;
    function FieldValueNotNull(Field: TField): string;
  public
    class procedure ShowDataSet(Dataset: TDataSet);
  end;

var
  frmDebugDataset: TfrmDebugDataSet;

const
  retCSV_OK = 0;
  retCSV_FaltaNomeArquivo = 1;
  retCSV_FataDataSet = 2;
  MessErroCSV: array[0..2]  of string = (
    'Arquivo gerado com sucesso.',
    'Falta nome do Arquivo.',
    'Falta DataSet.'
  );

procedure ShowDataSet(Dataset: TDataSet);

implementation

{$R *.dfm}

procedure ShowDataSet(Dataset: TDataSet);
begin
  TfrmDebugDataSet.ShowDataSet(Dataset);
end;

procedure CatStr(var Value1: string; const Delimitador, Value2: string);
begin
  Value1 := Value1 + Delimitador + Value2;
end;

{ TfrmDebugDataset }

procedure TfrmDebugDataSet.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmDebugDataSet.ContarRegistros1Click(Sender: TObject);
begin
  ShowMessage('Quantide de Registros: ' + IntToStr(dsMain.DataSet.RecordCount));
end;

function TfrmDebugDataSet.ConvertCSV(aTable: TDataSet; aNomeArq: string;
  aTitulocoluna, aCampoNulo: Boolean; Delimitador: string): Integer;
var
  Arq: TextFile;
  Colunas: string;
  Linha: string;
  I: Integer;
  Bookmark: TBookmark;
begin
  if (aNomeArq='') then
  begin
    Result := retCSV_FaltaNomeArquivo;
    Exit;
  end;
  if aTable = nil then
  begin
    Result := retCSV_FataDataSet;
    Exit;
  end;
  AssignFile(Arq, aNomeArq);
  Rewrite(Arq);
  Bookmark := aTable.Bookmark;
  aTable.DisableControls;
  aTable.First;
  try
{    for I := 0 to Cabecalho.Count -1 do
    begin
      WriteLn(Arq, Cabecalho.Strings[i]);
    end;}
    if aTitulocoluna then
    begin
      for I := 0 to aTable.FieldCount - 1 do
      begin
        CatStr(Colunas, Delimitador, '"' + aTable.Fields.Fields[i].DisplayLabel + '"');
      end;
      WriteLn(Arq, Colunas);
    end;
    //
    while not aTable.Eof do
    begin
      Linha := '';
      for I := 0 to aTable.FieldCount - 1 do
      begin
        // Se o campo for nulo e deve tratar Campos Nulos, verifica o Text e usa-o.
        // Caso o Text também for nulo, trata de acordo com o tipo de dado.
        if aTable.Fields[i].IsNull and aCampoNulo then
        begin
          if (aTable.Fields[i].Text='') then
            CatStr(Linha, Delimitador, EmptyFieldText(aTable.Fields[i]))
          else
            CatStr(Linha, Delimitador,EmptyFieldValue(aTable.Fields[i]))
        end
        else
          CatStr(Linha, Delimitador, FieldValueNotNull(aTable.Fields[i]));
      end;
      WriteLn(Arq, Linha);
      aTable.Next;
    end;
  finally
    CloseFile(Arq);
    aTable.Bookmark := Bookmark;
    aTable.EnableControls;
  end;
  Result := retCSV_OK;
end;

function TfrmDebugDataSet.EmptyFieldText(Field: TField): string;
begin
  case Field.DataType of
    ftString : Result := '""';
    ftInteger: Result := '0';
    ftFloat: Result := '0,00';
    else
      Result := '0';
  end;
end;

function TfrmDebugDataSet.EmptyFieldValue(Field: TField): string;
begin
  case Field.DataType of
    ftString : Result := '"' + Field.Text + '"';
    ftInteger: Result := Field.Text;
    ftFloat: Result := FormatFloat(',0.00', StrToFloatDef(Field.Text, 0));
  else
    Result := '"' + Field.Text + '"';
  end;
end;

function TfrmDebugDataSet.FieldValueNotNull(Field: TField): string;
begin
  case Field.DataType of
    ftFloat: Result := FormatFloat(',0.00', Field.AsFloat);
    ftString: Result := '"' + Field.AsString + '"';
  else
    Result := Field.AsString;
  end;
end;

procedure TfrmDebugDataSet.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Ord(Key) = 27 then
    Close;
end;

procedure TfrmDebugDataSet.GerarCSV1Click(Sender: TObject);
var
  aFileName: string;
begin
  if SaveDialogCSV.Execute then
  begin
    aFileName:=SaveDialogCSV.FileName;
//    tblGRAVA.DatabaseName:=ExtractFileDir(aFileName);
    ConvertCSV(dsMain.DataSet, aFileName);
  end;
end;

class procedure TfrmDebugDataSet.ShowDataSet(Dataset: TDataSet);
var
  Form: TfrmDebugDataSet;
begin
  Form := TfrmDebugDataSet.Create(nil);
  try
    Form.BorderIcons := [biSystemMenu,biMinimize,biMaximize];
    Form.BorderStyle := bsSizeable;
    Form.Position:=poOwnerFormCenter;
    Form.WindowState := wsNormal;
    //Form.Height:= Altura;
    //Form.Width:= Largura;
    Form.dsMain.DataSet := DataSet;
    if DataSet <> nil then
      Form.ShowModal;
  finally
    if Form.cbxAborta.Checked then
    begin
      Form.Free;
      Abort;
    end;
    Form.Free;
  end;
end;

initialization
  TfrmDebugDataSet.ShowDataSet(nil);

end.

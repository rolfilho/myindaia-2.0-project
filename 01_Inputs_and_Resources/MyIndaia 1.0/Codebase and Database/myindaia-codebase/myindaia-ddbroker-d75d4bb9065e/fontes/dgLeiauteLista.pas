unit dgLeiauteLista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DMLeiaute, Grids, DBGrids, DBCtrls;

type
  TfrmLeiauteLista = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    class function Execute(Classe: TClasse; out TituloRelatorio: string): Boolean;
  end;

var
  frmLeiauteLista: TfrmLeiauteLista;

implementation

uses DB, KrUtil;

{$R *.dfm}

procedure TfrmLeiauteLista.Button1Click(Sender: TObject);
begin
  if FileExists(NomeArquivoIniTemporario) then
    DeleteFile(NomeArquivoIniTemporario);
  dmdLeiaute.qryLeiauteGridLEIAUTE.SaveToFile(NomeArquivoIniTemporario);
  Close;
  ModalResult := mrOK;
end;

procedure TfrmLeiauteLista.Button3Click(Sender: TObject);
begin
  Close;
  ModalResult := mrCancel;
end;

procedure TfrmLeiauteLista.Button2Click(Sender: TObject);
begin
  if dmdLeiaute.qryLeiauteGrid.RecordCount > 0 then
  begin
    dmdLeiaute.qryLeiauteGrid.Delete;
    dmdLeiaute.qryLeiauteGrid.ApplyUpdates;
  end;
end;

class function TfrmLeiauteLista.Execute(Classe: TClasse; out TituloRelatorio: string): Boolean;
var
  Form: TfrmLeiauteLista;
begin
  Form := TfrmLeiauteLista.Create(nil);
  try
    dmdLeiaute.qryLeiauteGrid.Close;
    dmdLeiaute.qryLeiauteGrid.ParamByName('CLASSE').AsInteger := Ord(Classe);
    dmdLeiaute.qryLeiauteGrid.Open;
    Form.ShowModal;
    Result :=  Form.ModalResult = mrOk;
    TituloRelatorio := dmdLeiaute.qryLeiauteGridTITULO_REL.AsString;
  finally
    Form.Free;
  end;
end;

end.

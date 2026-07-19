unit udmMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmMain = class(TDataModule)
    FDConnection1: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PreencheDadosConnection;
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

uses
  Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}



{ TdmMain }

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin

  if ExtractFileName(ParamStr(1)) <> '' then
  begin
    FDConnection1.Params.UserName := ExtractFileName(ParamStr(1));
    FDConnection1.Params.Password := ExtractFileName(ParamStr(2));
  end;
end;

procedure TdmMain.PreencheDadosConnection;
begin

end;

end.

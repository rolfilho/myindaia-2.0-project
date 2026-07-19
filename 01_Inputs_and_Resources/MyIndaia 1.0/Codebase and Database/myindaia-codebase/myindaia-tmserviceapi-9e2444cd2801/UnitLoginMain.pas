unit UnitLoginMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button3: TButton;
    TM: TFDConnection;
    QryUsuarios: TFDQuery;
    dsUsuarios: TDataSource;
    QryUsuariosID: TFDAutoIncField;
    QryUsuariosNM_USUARIO: TWideStringField;
    QryUsuariosEMAIL: TWideStringField;
    QryUsuariosUSERNAME: TWideStringField;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    QryUsuariosCNPJ_T: TWideStringField;
    QryUsuariosCNPJ_D: TWideStringField;
    QryUsuariosNM_TRANSPORTADORA: TWideStringField;
    QryUsuariosNM_DESPACHANTE: TWideStringField;
    Memo1: TMemo;
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Bcl.Jose.Core.JWT,
  Bcl.Jose.Core.Builder;

const
  JWT_SECRET = '2d013705c915';

procedure TForm1.Button3Click(Sender: TObject);
var
  JWT: TJWT;
  CNPJ: string;
  Tipo: AnsiChar;
begin
  JWT := TJWT.Create(TJWTClaims);
  try
    {JWT.Claims.SetClaimOfType<string>('username', UserName);
    JWT.Claims.SetClaimOfType<string>('usercode', Codigo);
    JWT.Claims.SetClaimOfType<Boolean>('internaluser', InternalUser);
    JWT.Claims.SetClaimOfType<Integer>('idioma', Idioma);
    JWT.Claims.Issuer := 'XData Server';
    edtToken.Text := TJOSE.SHA256CompactToken(JWT_SECRET, JWT);
    }
    if not QryUsuariosCNPJ_T.IsNull then
    begin
      CNPJ := QryUsuariosCNPJ_T.AsString;
      Tipo := 'T';
    end
    else if not QryUsuariosCNPJ_D.IsNull then
    begin
      CNPJ := QryUsuariosCNPJ_D.AsString;
      Tipo := 'D';
    end
    else
    begin
      ShowMessage('Não foi possível determinar se o usário pertence a uma Trasnportadora ou Depachante.');
      Exit;
    end;
    JWT.Claims.SetClaimOfType<Integer>('id', QryUsuariosID.AsInteger);
    JWT.Claims.SetClaimOfType<string>('username', QryUsuariosUSERNAME.AsString);
    JWT.Claims.SetClaimOfType<string>('cnpj', CNPJ);
    JWT.Claims.SetClaimOfType<AnsiChar>('tipo', Tipo);
    Memo1.Text := 'Bearer '+ TJOSE.SHA256CompactToken(JWT_SECRET, JWT);
  finally
    JWT.Free;
  end;
end;

end.

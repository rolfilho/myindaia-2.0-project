unit uSistemas_Dicas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, DB, DBTables, jpeg, Buttons, Mask, ShellApi,
  ComCtrls ;

type
  Tfrm_sistemas_dicas = class(TForm)
    ds_sistemas_dicas: TDataSource;
    Image1: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Image2: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    dbedt_usuario_criador: TDBText;
    dbedt_titulo: TDBText;
    Label3: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    btn_fechar: TSpeedButton;
    btn_sugestao: TSpeedButton;
    lbl_manual: TLabel;
    qry_sistemas_dicas: TQuery;
    qry_sistemas_dicasTX_TITULO_DICA: TStringField;
    qry_sistemas_dicasTX_TEXTO_DICA: TMemoField;
    qry_sistemas_dicasCD_USUARIO_CRIADOR: TStringField;
    qry_sistemas_dicasNM_USUARIO: TStringField;
    qry_sistemas_dicasORDEM: TFloatField;
    qry_sistemas_dicasNM_PATH_MANUAL: TStringField;
    qry_sistemas_dicasTIPO: TIntegerField;
    DBRichEdit1: TDBRichEdit;
    procedure FormShow(Sender: TObject);
    procedure btn_sugestaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_fecharClick(Sender: TObject);
    procedure lbl_manualClick(Sender: TObject);
    procedure lbl_manualMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbl_manualMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_sistemas_dicas: Tfrm_sistemas_dicas;

implementation

uses PGGP003, PGGP017 , uSistemas_Sugestao, uSistemas_Cadastro_Sugestao,
  ConsOnLineEx;

{$R *.dfm}

procedure Tfrm_sistemas_dicas.FormShow(Sender: TObject);
begin
  // Andressa 29/09/2010
  qry_sistemas_dicas.Close;
  qry_sistemas_dicas.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
  qry_sistemas_dicas.Open;
  qry_sistemas_dicas.Last;
  Randomize;
  qry_sistemas_dicas.Locate('ORDEM', Random(qry_sistemas_dicasORDEM.AsInteger - 1) + 1, []);
  if qry_sistemas_dicasNM_PATH_MANUAL.AsString <> '' then
    lbl_manual.Visible:= true
  else
    lbl_manual.Visible:=false;
end;

procedure Tfrm_sistemas_dicas.btn_sugestaoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_dicas_sugestao,frm_dicas_sugestao);
  frm_dicas_sugestao.ShowModal;
  FreeAndNil(frm_dicas_sugestao);
end;

procedure Tfrm_sistemas_dicas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_sistemas_dicas.Close;
end;

procedure Tfrm_sistemas_dicas.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_sistemas_dicas.lbl_manualClick(Sender: TObject);
var
vManual : string;
begin
  vManual:= qry_sistemas_dicasNM_PATH_MANUAL.AsString;
  if FileExists(vManual) then
  begin
    ShellExecute(Application.Handle, nil, PChar(vManual),nil,nil, SW_MAXIMIZE);
  end
  else
  begin
    ShowMessage('Não existe arquivos em anexo!');
  end;
end;

procedure Tfrm_sistemas_dicas.lbl_manualMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
lbl_manual.Font.Color:= clMenuHighlight;
lbl_manual.Font.Style:= [fsUnderline];
end;

procedure Tfrm_sistemas_dicas.lbl_manualMouseLeave(Sender: TObject);
begin
 lbl_manual.Font.Color:= clBackground;
 lbl_manual.Font.Style:= [];
end;

end.

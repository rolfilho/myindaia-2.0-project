unit Configuracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfrmConfiguracoes = class(TForm)
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    sbSalvar: TSpeedButton;
    Panel2: TPanel;
    PageControl: TPageControl;
    tbsConfig: TTabSheet;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtHeaderValor: TEdit;
    edtHorariosExecucao: TEdit;
    edtUltimoProcesso: TEdit;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Memo2: TMemo;
    Button3: TButton;
    Edit1: TEdit;
    Memo3: TMemo;
    Button2: TButton;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

{$R *.dfm}

end.

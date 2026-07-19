unit frmTesteMyCom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TformTesteMyCom = class(TForm)
    btnIntegrar: TButton;
    btnPrnFesto: TButton;
    btnWhirlpool: TButton;
    edtCaminho: TEdit;
    SpeedButton2: TSpeedButton;
    OpenDialog1: TOpenDialog;
    btnIntegraTranspXls: TButton;
    procedure btnIntegrarClick(Sender: TObject);
    procedure btnPrnFestoClick(Sender: TObject);
    procedure btnWhirlpoolClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnIntegraTranspXlsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formTesteMyCom: TformTesteMyCom;

implementation

uses IntegraSG, uIntegraPlan, uFuncoes;

{$R *.dfm}

procedure TformTesteMyCom.btnIntegrarClick(Sender: TObject);
var
  objIntegraPlan: TIntegraPlan;
  vArq: TextFile;
  vArqNome: string;
begin
  objIntegraPlan := TIntegraPlan.Create;
//  AssignFile(vArq, vArqNome);
  case  objIntegraPlan.Get_Remessa('00240816', '028', 'Indaia10', 'C:\Users\programador\Downloads\rap00240816_2.txt') of
    0: ShowMessage('Integrado com sucesso!');
  end;

end;

procedure TformTesteMyCom.btnPrnFestoClick(Sender: TObject);
var
  objIntegraPlan: TIntegraPlan;
  vArq: TextFile;
  vArqNome: string;
begin
  objIntegraPlan := TIntegraPlan.Create;
  objIntegraPlan.Get_IntegraPlanilhaWhirlpool('Antuerpia', edtCaminho.text, 4511);


  //  objIntegraPlan.Get_IntegraPlanilhaWhirlpool('Indaia10', 'C:\Users\programador.INDAIA\Downloads\DI_18391LISTA.prn', 4511);
//    objIntegraPlan.Get_IntegraPlanilhaWhirlpool('Indaia10', 'C:\Users\programador.INDAIA\Downloads\LI_IM-009920-18.prn', 4511);
end;

procedure TformTesteMyCom.btnWhirlpoolClick(Sender: TObject);
var
  objIntegraPlan: TIntegraPlan;
  vArq: TextFile;
  vArqNome: string;
  a :integer;
begin
  objIntegraPlan := TIntegraPlan.Create;
  a := objIntegraPlan.Get_IntegraPlanilhaWhirlpool('indaia10',
   'C:\Users\programador.INDAIA\Desktop\012d8657.txt',
    '0707');
end;

procedure TformTesteMyCom.SpeedButton2Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  edtCaminho.text := OpenDialog1.FileName;
end;

procedure TformTesteMyCom.btnIntegraTranspXlsClick(Sender: TObject);
var
  objIntegraPlan: TIntegraPlan;
  vArq: TextFile;
  vArqNome: string;
begin
  objIntegraPlan := TIntegraPlan.Create;
  objIntegraPlan.Get_TranspXls('1050' , 'Antuerpia', edtCaminho.text);
end;

end.

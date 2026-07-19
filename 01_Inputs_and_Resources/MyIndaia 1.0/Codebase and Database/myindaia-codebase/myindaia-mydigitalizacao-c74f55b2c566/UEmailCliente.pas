unit UEmailCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmEmailCliente = class(TForm)
    pnlDadosEmail: TPanel;
    Shape4: TShape;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label9: TLabel;
    edtPara: TEdit;
    edtCC: TEdit;
    edtAssunto: TEdit;
    Panel1: TPanel;
    SpeedButton8: TSpeedButton;
    SpeedButton6: TSpeedButton;
    mmCorpoEmail: TMemo;
    Shape5: TShape;
    edtRemetente: TEdit;
    Label1: TLabel;
    LstFiles: TListBox;
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ConfigurarEmail(ARemetente, ADestinatario, ACopia, AAssunto, ACorpo, Anexo : String);
  end;

var
  frmEmailCliente: TfrmEmailCliente;

implementation

{$R *.dfm}

procedure TfrmEmailCliente.SpeedButton8Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmEmailCliente.ConfigurarEmail(ARemetente, ADestinatario, ACopia, AAssunto, ACorpo , Anexo: String);
begin
  edtRemetente.text := ARemetente;
  edtPara.text := ADestinatario;
  edtCC.text := ACopia;
  edtAssunto.text := AAssunto;
  mmCorpoEmail.text := ACorpo;
  LstFiles.Items.add(Anexo);
end;

procedure TfrmEmailCliente.SpeedButton6Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.

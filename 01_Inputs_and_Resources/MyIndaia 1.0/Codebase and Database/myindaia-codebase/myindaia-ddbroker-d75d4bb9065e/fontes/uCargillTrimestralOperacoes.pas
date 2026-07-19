unit uCargillTrimestralOperacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TfrCargillTrimestralOperacoes = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SaveDialog: TSaveDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCargillTrimestralOperacoes: TfrCargillTrimestralOperacoes;

implementation

uses dmCargillTrimestralOperacoes;

{$R *.dfm}

procedure TfrCargillTrimestralOperacoes.BitBtn1Click(Sender: TObject);
var
  DM: TdmdCargillTrimestralOperacoes;
  DataInicial: TDateTime;
  DataFinal: TDateTime;
begin
  DataInicial := StrToDateDef(mskDataregistroIni.Text, 0);
  DataFinal := StrToDateDef(mskDataregistroFin.Text, 0);
  if DataInicial = 0 then
  begin
    MessageDlg('Data inicial inválida.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if DataFinal = 0 then
  begin
    MessageDlg('Data final inválida.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if DataFinal < DataInicial then
  begin
    MessageDlg('Data final menor que a inicial.', mtWarning, [mbOK], 0);
    Exit;
  end;

  if SaveDialog.Execute then
  begin
    DM := TdmdCargillTrimestralOperacoes.Create(nil);
    try
      DM.Gerar(SaveDialog.FileName, DataInicial, DataFinal);
      ShowMessage('Operação concluída');
    finally
      DM.Free;
    end;
    Close;
  end;
end;

procedure TfrCargillTrimestralOperacoes.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.

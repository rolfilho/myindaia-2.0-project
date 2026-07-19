unit uAcertaTxtNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, Mask, ToolEdit, ExtCtrls, Buttons, ComCtrls,
  Gauges;

type
  TfrmAcertaTxtNF = class(TForm)
    btnExecuta: TSpeedButton;
    lbl2: TLabel;
    btnEnviar: TSpeedButton;
    lbl4: TLabel;
    DirectoryEdit1: TDirectoryEdit;
    lstAlterados: TListBox;
    fllstNF: TFileListBox;
    Memo1: TMemo;
    lbl5: TLabel;
    shp1: TShape;
    shp2: TShape;
    bvl1: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcertaTxtNF: TfrmAcertaTxtNF;

implementation

uses PGSM990;

{$R *.dfm}

procedure TfrmAcertaTxtNF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAcertaTxtNF.btnExecutaClick(Sender: TObject);
var
  i : Integer;
  F, F2 : TextFile;
  S, vItemAux, vPedidoAux : string;
begin
  fllstNF.Directory := DirectoryEdit1.Text;
  for i := 0 to fllstNF.Items.Count - 1 do
  begin
    Application.ProcessMessages;
    if not DirectoryExists(fllstNF.Directory + '\temp') then
      CreateDir(fllstNF.Directory + '\temp');
    CopyFile(PChar(fllstNF.Items.Strings[i]), PChar(fllstNF.Directory + '\temp\' + fllstNF.Items.Strings[i]),True);
    AssignFile(F, fllstNF.Directory + '\temp\' + fllstNF.Items.Strings[i]);
    Reset(F);
    while not EOF(F) do
    begin
      Readln(F, S);
      vItemAux   := Copy(S,50,2);
      vPedidoAux := Copy(S,338,17);
      if Copy(S,1,1) = '2' then
        Memo1.Lines.Add(Copy(S,1,398) + '00' + vItemAux + Copy(S,403,5) + vPedidoAux + Copy(vPedidoAux,1,10) + Copy(S,435,170))
      else Memo1.Lines.Strings[0] := S;
    end;
    lstAlterados.Items.Add(fllstNF.Items.Strings[i]);
    CloseFile(F);
    DeleteFile(fllstNF.Directory + '\temp\' + fllstNF.Items.Strings[i]);
    Memo1.Lines.SaveToFile(fllstNF.Items.Strings[i]);
  end;

  btnEnviar.Enabled := (fllstNF.Items.Count > 0);
end;

procedure TfrmAcertaTxtNF.btnEnviarClick(Sender: TObject);
var i: Integer;
begin
  //abertura do form de impressão
  Application.CreateForm(TFrm_impressao, Frm_impressao );
  frm_impressao.vApenas_email := true;
  for i := 0 to fllstNF.Items.Count - 1 do
    frm_impressao.LstFiles.Items.Add(PChar(Trim(fllstNF.Directory) + '\' + Trim(fllstNF.Items.Strings[i])) );
  frm_impressao.ShowModal;
  frm_impressao.Release;
  lstAlterados.Clear;
  if Application.MessageBox('Deseja excluir os arquivos já enviados?', 'Exclusão dos TXT´s', MB_YESNO  + MB_ICONWARNING) = mrYes then begin
    for i := 0 to fllstNF.Items.Count - 1 do
      DeleteFile(PChar(Trim(fllstNF.Directory) + '\' + Trim(fllstNF.Items.Strings[i])));
  end;
end;

procedure TfrmAcertaTxtNF.FormCreate(Sender: TObject);
begin
  lstAlterados.Clear;
  btnEnviar.Enabled := False;
end;

end.

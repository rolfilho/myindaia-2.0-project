unit uRelatoriosNestleConfigEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, URelatoriosNestle, Mask, Grids,
  DBGrids, DB, DBClient;

type
  TfrmRelatoriosNestleConfigEmail = class(TForm)
    pnlDadosEmail: TPanel;
    Panel1: TPanel;
    rbPDF: TRadioButton;
    rbWord: TRadioButton;
    Panel2: TPanel;
    gbAnexar: TGroupBox;
    Panel3: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    edtRemetente: TEdit;
    btnEnviar: TBitBtn;
    btnSair: TBitBtn;
    lstArquivos: TListBox;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    btn3: TSpeedButton;
    edtCaminho: TMaskEdit;
    lbl17: TLabel;
    OpenDialog1: TOpenDialog;
    edtAssunto: TMemo;
    GroupBox1: TGroupBox;
    mmCorpoEmail: TMemo;
    edtNovoEmail: TEdit;
    dbgEmailsProcesso: TDBGrid;
    btnRemove: TBitBtn;
    btnAdd: TBitBtn;
    Shape4: TShape;
    edtDestino: TEdit;
    cdsEmailDest: TClientDataSet;
    cdsEmailDestNM_EMAIL: TStringField;
    dsEmailDest: TDataSource;
    Label1: TLabel;
    procedure btnEnviarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure edtDestinoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   function VerificaEmailJaExiste(Email : String) : Boolean;
   procedure PreencheEmailsProcesso;
  public
    { Public declarations }
  dadosEmail : TdadosEmail;
  end;

var
  frmRelatoriosNestleConfigEmail: TfrmRelatoriosNestleConfigEmail;

implementation

uses
  datm_RelatoriosNestle;

{$R *.dfm}


procedure TfrmRelatoriosNestleConfigEmail.btnEnviarClick(Sender: TObject);
var CorpoEmail , ArquivosAnexos: TStringList;
i : integer;
begin
  if cdsEmailDest.isempty then
  begin
    ShowMessage('Preencha o destinatário');
    Self.ModalResult := mrnone;
    abort;
  end; 

  CorpoEmail     := TStringList.Create;
  ArquivosAnexos := TStringList.Create;

  dadosEmail.Assunto      := edtAssunto.text;
  dadosEmail.Destinatario := StringReplace(edtDestino.text,',',';',[rfReplaceAll]);
  dadosEmail.Remetente    := edtRemetente.text;
  if rbPDF.checked then dadosEmail.PdfWord := 'P' else dadosEmail.PdfWord := 'W';

  for i := 0 to lstArquivos.count-1 do
    ArquivosAnexos.Add(lstArquivos.Items[i]);
  dadosEmail.Anexos := ArquivosAnexos;

  CorpoEmail.Add('<br>');
  for i := 0 to mmCorpoEmail.lines.count-1 do
    CorpoEmail.Add(mmCorpoEmail.Lines[i] + '<br>');

  CorpoEmail.Add('<br><br>');

  dadosEmail.Corpo := CorpoEmail;

  Self.ModalResult := mrOk;
end;

procedure TfrmRelatoriosNestleConfigEmail.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmRelatoriosNestleConfigEmail.FormShow(Sender: TObject);
var CorpoEmail : TStringList;
 i : integer;
begin
  if frmRelatoriosNestle.pgFiltros.ActivePage.Tag = 0  then //GeraRelProgramacaoRodoviaria
  begin
    datm_RelatorioNestle.qryEmails.close;
    datm_RelatorioNestle.qryEmails.sql.Text := datm_RelatorioNestle.GetSqlEmailsProgramacaoRodoviaria( frmRelatoriosNestle.cbUnidade.KeyValue +
                                                                                                       frmRelatoriosNestle.cbProduto.KeyValue +
                                                                                                       trim(frmRelatoriosNestle.edtNrProcesso.text));
    datm_RelatorioNestle.qryEmails.open;
    if not datm_RelatorioNestle.qryEmails.isEmpty then
    begin
      edtDestino.text   := edtDestino.text + ';' + datm_RelatorioNestle.qryEmails.fieldByName('EMAILS').asString;
      edtAssunto.text   := datm_RelatorioNestle.qryEmails.fieldByName('ASSUNTO').asString;
      CorpoEmail := TStringList.create;
      ExtractStrings(['|'], [], pchar(datm_RelatorioNestle.qryEmails.fieldByName('CORPO_EMAIL').asString),CorpoEmail);
      for i := 0 to CorpoEmail.count -1 do
      begin
        mmCorpoEmail.lines.Add(CorpoEmail[i]);
      end;

      frmRelatoriosNestle.atualizarSeqProgRodoviaria := True;
    end;
  end;

  if frmRelatoriosNestle.pgFiltros.ActivePage.Tag = 9 then
  begin
    rbWord.visible := true;
    rbPDF.visible  := true;
  end;
end;

procedure TfrmRelatoriosNestleConfigEmail.btn3Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  edtCaminho.text := OpenDialog1.FileName;
end;

procedure TfrmRelatoriosNestleConfigEmail.btn4Click(Sender: TObject);
begin
  if edtCaminho.text <> '' then
  begin
    lstArquivos.Items.add(edtCaminho.text);
    edtCaminho.Clear;
  end;
end;

procedure TfrmRelatoriosNestleConfigEmail.btn5Click(Sender: TObject);
begin
  if lstArquivos.Count > 0 then
  begin
    lstArquivos.Items.Delete(lstArquivos.ItemIndex);
  end;
end;

procedure TfrmRelatoriosNestleConfigEmail.btnAddClick(Sender: TObject);
  var LEmailsInserir : TStrings; i : integer;
begin
  if trim(edtNovoEmail.text) <> '' then
  begin
    LEmailsInserir := TStringList.Create;
    LEmailsInserir.Clear;
    LEmailsInserir.Delimiter       := ';';
    LEmailsInserir.DelimitedText   := edtNovoEmail.text;

    cdsEmailDest.DisableControls;
    for i := 0 to LEmailsInserir.count - 1 do
    begin
      if Trim(LEmailsInserir[i]) <> '' then
      begin
        if not VerificaEmailJaExiste(LEmailsInserir[i]) then
        begin
          cdsEmailDest.append;
          cdsEmailDest.fieldByName('NM_EMAIL').asString := LEmailsInserir[i];
          cdsEmailDest.post;
        end;
      end;
    end;
    cdsEmailDest.EnableControls;

    PreencheEmailsProcesso;
  end;
end;

procedure TfrmRelatoriosNestleConfigEmail.btnRemoveClick(Sender: TObject);
begin
  if not cdsEmailDest.isEmpty then
  begin
    cdsEmailDest.delete;
    cdsEmailDest.last;
    PreencheEmailsProcesso;
  end;
end;

procedure TfrmRelatoriosNestleConfigEmail.edtDestinoChange(Sender: TObject);
var
    emails : string;
    ListaEmails : TStrings;
    i : integer;
begin
  edtNovoEmail.clear;
  emails := edtDestino.text;

  ListaEmails := TStringList.Create;
  ListaEmails.Clear;
  ListaEmails.Delimiter       := ';';
  ListaEmails.DelimitedText   := emails;

  cdsEmailDest.DisableControls;
  cdsEmailDest.EmptyDataSet;
  for i := 0 to ListaEmails.count - 1 do
  begin
    if trim(ListaEmails[i]) <> '' then
    begin
      cdsEmailDest.append;
      cdsEmailDest.fieldByName('NM_EMAIL').asString := ListaEmails[i];
      cdsEmailDest.post;
    end;
  end;
  cdsEmailDest.first;
  cdsEmailDest.EnableControls;
end;

procedure TfrmRelatoriosNestleConfigEmail.PreencheEmailsProcesso;
var emails :String;
begin
  emails := '';
  cdsEmailDest.DisableControls;
  cdsEmailDest.first;
  while not cdsEmailDest.eof do
  begin
    emails := emails + StringReplace(cdsEmailDest.fieldByName('NM_EMAIL').asString, ';', '', [rfReplaceAll]) + ';';

    cdsEmailDest.next;
  end;
  cdsEmailDest.EnableControls;
  edtDestino.text := emails;
end;

function TfrmRelatoriosNestleConfigEmail.VerificaEmailJaExiste(Email : String) : Boolean;
begin
  Result := false;
  cdsEmailDest.first;
  while not cdsEmailDest.eof do
  begin
    if AnsiCompareText(Email, cdsEmailDest.fieldByName('NM_EMAIL').asString) = 0 then
    begin
      Result := true;
      break;
    end;
    cdsEmailDest.next;
  end;
end;

procedure TfrmRelatoriosNestleConfigEmail.FormCreate(Sender: TObject);
begin
  cdsEmailDest.createDataset;
end;

end.

unit USelecionaTiposDoctosEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids, ExtCtrls, DB, DBClient;

type
  TfrmSelecionaTiposDoctosEmail = class(TForm)
    Panel1: TPanel;
    btn_sair: TSpeedButton;
    Panel2: TPanel;
    SpeedButton11: TSpeedButton;
    Label71: TLabel;
    dbgEmailsProcesso: TDBGrid;
    btnRemove: TBitBtn;
    btnAdd: TBitBtn;
    edtTPDocto: TEdit;
    edtDocumento: TEdit;
    memoDoctos: TMemo;
    cdsTiposSelecionados: TClientDataSet;
    cdsTiposSelecionadosCdTipoDocumento: TStringField;
    cdsTiposSelecionadosDsTipoDocumento: TStringField;
    dsTiposSelecionados: TDataSource;
    btnAceitar: TSpeedButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure memoDoctosChange(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceitarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
  procedure PreencheCampoDoctos;
  function VerificaDoctoJaExiste(Email : String) : Boolean;
  public
    { Public declarations }
  end;

var
  frmSelecionaTiposDoctosEmail: TfrmSelecionaTiposDoctosEmail;

implementation

uses ConsOnLineEx, PGGP017;

{$R *.dfm}

procedure TfrmSelecionaTiposDoctosEmail.btnAddClick(Sender: TObject);
begin
  if trim(edtTPDocto.text) <> '' then
  begin
      cdsTiposSelecionados.DisableControls;
      if Trim(edtTPDocto.text) <> '' then
      begin
        if not VerificaDoctoJaExiste(edtTPDocto.text) then
        begin
          cdsTiposSelecionados.append;
          cdsTiposSelecionados.fieldByName('CdTipoDocumento').asString := edtTPDocto.text;
          cdsTiposSelecionados.fieldByName('DsTipoDocumento').asString := edtDocumento.text;
          cdsTiposSelecionados.post;
        end;
      end;
    cdsTiposSelecionados.EnableControls;

    PreencheCampoDoctos;
  end;
end;

procedure TfrmSelecionaTiposDoctosEmail.btnRemoveClick(Sender: TObject);
begin
  if not cdsTiposSelecionados.isEmpty then
  begin
    cdsTiposSelecionados.delete;
    PreencheCampoDoctos;
  end;
end;

procedure TfrmSelecionaTiposDoctosEmail.memoDoctosChange(Sender: TObject);
var
    Doctos : string;
    ListaDoctos : TStrings;
    i : integer;
begin
  edtTPDocto.clear;
  Doctos := memoDoctos.Text;

  ListaDoctos := TStringList.Create;
  ListaDoctos.Clear;
  ListaDoctos.Delimiter       := ';';
  ListaDoctos.DelimitedText   := Doctos;

  cdsTiposSelecionados.DisableControls;
  cdsTiposSelecionados.EmptyDataSet;
  for i := 0 to ListaDoctos.count - 1 do
  begin
    if trim(ListaDoctos[i]) <> '' then
    begin
      cdsTiposSelecionados.append;
      cdsTiposSelecionados.fieldByName('CdTipoDocumento').asString := ListaDoctos[i];
      if datm_main.qryTiposDoctos.Locate('CD_TIPO_DOCTO',  ListaDoctos[i], []) then
        cdsTiposSelecionados.fieldByName('DsTipoDocumento').asString := datm_main.qryTiposDoctos.fieldByName('NM_TIPO_DOCTO').asstring;
      cdsTiposSelecionados.post;
    end;
  end;
  cdsTiposSelecionados.first;
  cdsTiposSelecionados.EnableControls;
end;

procedure TfrmSelecionaTiposDoctosEmail.SpeedButton11Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If (Sender as TSpeedButton).Enabled Then
      edtTPDocto.Text := ConsultaOnLineEx('TTP_DOCTO_DIGITALIZADO','Tipo Documento',
                                          ['CD_TIPO_DOCTO', 'NM_TIPO_DOCTO'],
                                          ['Código', 'Documento'],
                                          'CD_TIPO_DOCTO',nil)
  end
  else
    edtDocumento.Text := ConsultaLookUP('TTP_DOCTO_DIGITALIZADO','CD_TIPO_DOCTO', edtTPDocto.Text  ,'NM_TIPO_DOCTO');
end;

procedure TfrmSelecionaTiposDoctosEmail.PreencheCampoDoctos;
var Doctos :String;
begin
  Doctos := '';
  cdsTiposSelecionados.DisableControls;
  cdsTiposSelecionados.first;
  while not cdsTiposSelecionados.eof do
  begin
    Doctos := Doctos + StringReplace(cdsTiposSelecionados.fieldByName('CdTipoDocumento').asString, ';', '', [rfReplaceAll]) + ';';

    cdsTiposSelecionados.next;
  end;
  cdsTiposSelecionados.EnableControls;

  memoDoctos.text := Doctos;
end;

function TfrmSelecionaTiposDoctosEmail.VerificaDoctoJaExiste(Email : String) : Boolean;
begin
  Result := false;
  cdsTiposSelecionados.first;
  while not cdsTiposSelecionados.eof do
  begin
    if AnsiCompareText(Email, cdsTiposSelecionados.fieldByName('CdTipoDocumento').asString) = 0 then
    begin
      Result := true;
      break;
    end;
    cdsTiposSelecionados.next;
  end;
end;

procedure TfrmSelecionaTiposDoctosEmail.FormCreate(Sender: TObject);
begin
  cdsTiposSelecionados.CreateDataSet;
  memoDoctos.lines.clear;
  datm_main.qryTiposDoctos.close;
  datm_main.qryTiposDoctos.open;
end;

procedure TfrmSelecionaTiposDoctosEmail.btnAceitarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSelecionaTiposDoctosEmail.btn_sairClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.

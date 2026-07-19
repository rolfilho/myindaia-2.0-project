unit uGeraRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, CheckLst, DBCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmGeraRelatorio = class(TForm)
    GroupBox1: TGroupBox;
    lblSearch: TLabel;
    clbDestinatarios: TCheckListBox;
    btnCancelar: TBitBtn;
    btnGerar: TBitBtn;
    GroupBox2: TGroupBox;
    qryRelatorios: TQuery;
    qryRelatoriosCD_RELATORIO: TStringField;
    qryRelatoriosNM_RELATORIO: TStringField;
    qryRelatoriosTX_RELATORIO: TStringField;
    qryRelatoriosTX_MODELO: TStringField;
    qryRelatoriosCD_TIPO_RELATORIO: TStringField;
    qryRelatoriosTX_CONFIGURACAO: TMemoField;
    qryRelatoriosIN_ATIVO: TStringField;
    qryRelatoriosIN_FIMDESEMANA: TStringField;
    qryRelatoriosTP_IDIOMA: TStringField;
    qryRelatoriosCD_VIA_TRANSPORTE: TStringField;
    qryRelatoriosVARIAVEL_CARTAS_CONFIG: TStringField;
    dsRelatorios: TDataSource;
    qryUsuarios: TQuery;
    qryUsuariosCD_USUARIO: TStringField;
    qryUsuariosNM_USUARIO: TStringField;
    qryUsuariosAP_USUARIO: TStringField;
    qryUsuariosNM_EMAIL: TStringField;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure btnGerarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure clbDestinatariosKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function Execute: Boolean;
    function GetRelatorio: String;
    function GetCheckedMails: String;
    function GetCheckedMailsList: TStrings;
  end;

  function GeraRelatorio: Boolean;

var
  frmGeraRelatorio: TfrmGeraRelatorio;

implementation

uses
  Main;

{$R *.dfm}

function GeraRelatorio: Boolean;
begin
  Application.CreateForm(TfrmGeraRelatorio, frmGeraRelatorio);
  try
    Result := frmGeraRelatorio.Execute;
  finally
    FreeAndNil(frmGeraRelatorio);
  end;
end;

{ TfrmGeraRelatorio }

function TfrmGeraRelatorio.Execute: Boolean;
begin
  qryRelatorios.Open;
  qryRelatorios.First;
  ///cbbRelatorio.Text := qryRelatoriosCD_RELATORIO.AsString;

  qryUsuarios.Open;
  qryRelatorios.First;
  while not qryUsuarios.Eof do
  begin
    clbDestinatarios.Items.Add((qryUsuariosNM_USUARIO.AsString) + ' [' + Trim(qryUsuariosNM_EMAIL.AsString) + ']');
    qryUsuarios.Next;
  end;
  Result := ShowModal = mrOk;
end;

function TfrmGeraRelatorio.GetCheckedMails: String;
var
  SL: TStrings;
  I: Integer;
begin
  Result := '';
  SL := GetCheckedMailsList;
  for I := 0 to GetCheckedMailsList.Count -1 do
  begin
    Result := Result + StringReplace(GetCheckedMailsList[I], ' ', '', [rfReplaceAll]);
    while (Result <> '') and CharInSet(Result[Length(Result)], [';', ',']) do
      Result := Copy(Result, 1, Length(Result) -1);
    Result := Result + ';';
  end;
end;

function TfrmGeraRelatorio.GetRelatorio: String;
begin
  Result := qryRelatorios.fieldByName('CD_RELATORIO').AsString;
end;

procedure TfrmGeraRelatorio.btnGerarClick(Sender: TObject);
begin
if GetCheckedMailsList.Count = 0 then
  begin
    clbDestinatarios.SetFocus;
    MessageDlg('Nenhum destinatário selecionado.', mtError, [mbOk], 0);
  end
  else
  begin
    Enabled := False;
    try
      frmMain.Watch(Self);
    finally
      Enabled := True;
      ShowMessage('Concluído');
      if not qryRelatorios.Active then
        qryRelatorios.Open;
    end;
  end;
end;

function TfrmGeraRelatorio.GetCheckedMailsList: TStrings;
var
  I, P: Integer;
  S: String;
begin
  Result := TStringList.Create;
  for I := 0 to clbDestinatarios.Items.Count -1 do
    if clbDestinatarios.Checked[I] then
    begin
      S := clbDestinatarios.Items[I];///?
      P := Pos('[', S);
      while P > 0 do
      begin
        Delete(S, 1, P);
        P := Pos('[', S);
      end;
      P := Pos(']', S);
      S := Copy(S, 1, P -1);
      Result.Add(S);
    end;
end;

procedure TfrmGeraRelatorio.FormCreate(Sender: TObject);
begin
  lblSearch.Caption := '';
end;

procedure TfrmGeraRelatorio.Button1Click(Sender: TObject);
var
  filtro: String;
begin
  if edit1.text <> '' then
  begin
    qryRelatorios.DisableControls;
    qryRelatorios.close;


    filtro := '';
    if (edit1.text <> '') then
      filtro := ' AND NM_RELATORIO LIKE '+QuotedStr('%' + edit1.text + '%');

    qryRelatorios.sql.text := 'SELECT * FROM TRELATORIOS_MAIL_AUT WHERE IN_ATIVO = ''1'' ' + filtro +
                              'ORDER BY NM_RELATORIO';

    qryRelatorios.open;
    qryRelatorios.EnableControls;
  end
end;

procedure TfrmGeraRelatorio.clbDestinatariosKeyPress(Sender: TObject; var Key: Char);
var
  S: String;
  I: Integer;
begin
  S := lblSearch.Caption;
  if Key = #8 then
  begin
    if S <> '' then
      S := Copy(S, 1, Length(S) -1)
  end
  else if not (Key in [#10, #13, #9]) then
    S := S + Key;
  if (Key = #32) and (clbDestinatarios.ItemIndex >= 0) then
    clbDestinatarios.Checked[clbDestinatarios.ItemIndex] := not clbDestinatarios.Checked[clbDestinatarios.ItemIndex];

  Key := #0;
  if (S <> lblSearch.Caption) then
  begin
    lblSearch.Caption := S;
    if lblSearch.Caption = '' then
      clbDestinatarios.ItemIndex := 0
    else //if (clbDestinatarios.ItemIndex < 0) or not SameText(Copy(clbDestinatarios.Items[clbDestinatarios.ItemIndex].Text, 1, Length(S)), lblSearch.Caption) then
    begin
      clbDestinatarios.ItemIndex := -1;
      for I := 0 to clbDestinatarios.Items.Count -1 do
        if SameText(Copy(clbDestinatarios.Items[I], 1, Length(lblSearch.Caption)), lblSearch.Caption) then
        begin
          clbDestinatarios.ItemIndex := I;
          Break;
        end;
    end;
  end;
end;

end.

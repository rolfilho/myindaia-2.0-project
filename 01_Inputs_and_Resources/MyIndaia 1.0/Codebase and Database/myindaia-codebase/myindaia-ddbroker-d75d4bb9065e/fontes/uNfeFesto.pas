unit uNfeFesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, Clipbrd, Math, DB, DBTables,
  Provider, DBClient, Grids, DBGrids, ShellAPI;

type
  TNotifyPasteEvent = procedure(Sender: TObject; var AText: String) of object;

  TEdit = class(StdCtrls.TEdit)
  private
    FOnPaste: TNotifyPasteEvent;
  protected
    procedure MsgPaste(var Msg: TMessage); message WM_PASTE;
  published
    property OnPaste: TNotifyPasteEvent read FOnPaste write FOnPaste;
  end;

  TLabelFile = class(TLabel)
  private
    FFileName: String;
    procedure DoOnClick(Sender: TObject);
    procedure SetFileName(const Value: String);
  public
    constructor Create(AOwner: TComponent); override;
    property FileName: String read FFileName write SetFileName;
  end;

  TfrmNfeFesto = class(TForm)
    pnlOpcoes: TPanel;
    btnAvancar: TBitBtn;
    pnlTitulo: TPanel;
    lblTituloSombra: TLabel;
    lblTitulo: TLabel;
    qryNfe: TQuery;
    Bevel1: TBevel;
    qryProcesso: TQuery;
    qryProcessoNR_PROCESSO: TStringField;
    qryProcessoCD_CLIENTE: TStringField;
    qryProcessoCD_GRUPO: TStringField;
    qryProcessoIN_CANCELADO: TStringField;
    nbNfe: TNotebook;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnUNID_NEG: TSpeedButton;
    btnPRODUTO: TSpeedButton;
    btnPROCESSO: TSpeedButton;
    edtCD_UNID_NEG: TEdit;
    edtNM_UNID_NEG: TEdit;
    edtCD_PRODUTO: TEdit;
    edtNM_PRODUTO: TEdit;
    edtNR_PROCESSO: TEdit;
    chkUltimosProcessos: TCheckBox;
    pnlCFOP_ITENS: TPanel;
    pnlArquivos: TPanel;
    qryNfeNR_LINHA: TAutoIncField;
    qryNfeTX_LINHA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure edtCD_UNID_NEGChange(Sender: TObject);
    procedure edtCD_PRODUTOChange(Sender: TObject);
    procedure btnUNID_NEGClick(Sender: TObject);
    procedure btnPRODUTOClick(Sender: TObject);
    procedure edtCD_UNID_NEGPaste(Sender: TObject; var AText: String);
    procedure edtCD_PRODUTOPaste(Sender: TObject; var AText: String);
    procedure edtNR_PROCESSOPaste(Sender: TObject; var AText: String);
    procedure edtCD_UNID_NEGExit(Sender: TObject);
    procedure edtCD_PRODUTOExit(Sender: TObject);
    procedure btnPROCESSOClick(Sender: TObject);
  private
    FTemFilhote: Boolean;
    function GeraNotas: Boolean;
  public
    { Public declarations }
  end;

var
  frmNfeFesto: TfrmNfeFesto;

implementation

uses
  ConsOnlineEx;

{$R *.dfm}

{ TEdit }

procedure TEdit.MsgPaste(var Msg: TMessage);
var
  S: String;
begin
  S := ClipBoard.AsText;
  if Assigned(FOnPaste) then
    FOnPaste(Self, S);
  Text := S;
end;

{ TLabelFile }

constructor TLabelFile.Create(AOwner: TComponent);
begin
  inherited;
  OnClick := DoOnClick;
  Cursor := crHandPoint;
  Font.Color := clBlue;
  ShowHint := True;
end;

procedure TLabelFile.DoOnClick(Sender: TObject);
begin
  ShellExecute(0, nil, PAnsiChar(FFileName), nil, nil, SW_SHOW);
end;

procedure TLabelFile.SetFileName(const Value: String);
begin
  FFileName := Value;
  Caption := ExtractFileName(Value);
  Hint := Value;
end;

{ TfrmNfeSamsung }

procedure TfrmNfeFesto.FormCreate(Sender: TObject);
begin
  nbNfe.PageIndex := 0;
  edtCD_UNID_NEG.OnPaste := edtCD_UNID_NEGPaste;
  edtCD_PRODUTO.OnPaste  := edtCD_PRODUTOPaste;
  edtNR_PROCESSO.OnPaste := edtNR_PROCESSOPaste;
end;

procedure TfrmNfeFesto.btnAvancarClick(Sender: TObject);
begin
  if edtNM_UNID_NEG.Text = '' then
  begin
    edtCD_UNID_NEG.SetFocus;
    MessageDlg('Insira uma Unidade válida.', mtError, [mbOk], 0);
  end
  else if edtNM_PRODUTO.Text = '' then
  begin
    edtCD_PRODUTO.SetFocus;
    MessageDlg('Insira um Produto válido.', mtError, [mbOk], 0);
  end
  else if edtNR_PROCESSO.Text = '' then
  begin
    edtNR_PROCESSO.SetFocus;
    MessageDlg('Insira um Processo válido.', mtError, [mbOk], 0);
  end
  else
  begin
    if qryProcesso.Active then
      qryProcesso.Close;
    qryProcesso.ParamByName('NR_PROCESSO').AsString := edtCD_UNID_NEG.Text + edtCD_PRODUTO.Text + edtNR_PROCESSO.Text;
    qryProcesso.Open;
    if Trim(qryProcessoNR_PROCESSO.AsString) = '' then
      MessageDlg('Processo não encontrado.'#13'Verifique a Unidade, o Produto e Processo.', mtInformation, [mbOk], 0)
    else if not SameText(qryProcessoCD_GRUPO.AsString, 'B35') then
      MessageDlg('O Processo não é do grupo Festo.'#13'Verifique a Unidade, o Produto e Processo.', mtInformation, [mbOk], 0)
    else if qryProcessoIN_CANCELADO.AsString = '1' then
      MessageDlg('Processo está cancelado.'#13'Verifique a Unidade, o Produto e Processo.', mtInformation, [mbOk], 0)
    else
    if GeraNotas then
      MessageDlg('ATENÇÃO: DANFE gerada com sucesso!', mtInformation, [mbOk], 0)
    else
      MessageDlg('ATENÇÃO: Erro na tentativa de gerar a DANFE!', mtInformation, [mbOk], 0)
  end;
end;

procedure TfrmNfeFesto.edtCD_UNID_NEGChange(Sender: TObject);
begin
  if Length(edtCD_UNID_NEG.Text) < 2 then
    edtNM_UNID_NEG.Text := ''
  else
  begin
    edtNM_UNID_NEG.Text := Trim(ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', edtCD_UNID_NEG.Text, 'AP_UNID_NEG'));
    if edtNM_UNID_NEG.Text = '' then
    begin
      MessageDlg('Unidade inválida.', mtError, [mbOk], 0);
      edtCD_UNID_NEG.SetFocus;
    end;
    edtCD_PRODUTO.SetFocus;
  end;
end;

procedure TfrmNfeFesto.edtCD_PRODUTOChange(Sender: TObject);
begin
  if Length(edtCD_PRODUTO.Text) < 2 then
    edtNM_PRODUTO.Text := ''
  else
  begin
    edtNM_PRODUTO.Text := Trim(ConsultaLookUP('TPRODUTO', 'CD_PRODUTO', edtCD_PRODUTO.Text, 'NM_PRODUTO'));
    if edtNM_PRODUTO.Text = '' then
    begin
      MessageDlg('Produto inválido.', mtError, [mbOk], 0);
      edtCD_PRODUTO.SetFocus;
    end;
    edtNR_PROCESSO.SetFocus;
  end;
end;

procedure TfrmNfeFesto.btnUNID_NEGClick(Sender: TObject);
var
  S: String;
begin
  S := ConsultaOnLineExSQL('SELECT CD_UNID_NEG, AP_UNID_NEG ' +
                           'FROM TUNID_NEG ' +
                           'WHERE IN_ATIVO = "1"', 'Unidade', ['CD_UNID_NEG', 'AP_UNID_NEG'], ['Código', 'Nome'], 'CD_UNID_NEG', nil, edtCD_UNID_NEG.Text);
  if S <> edtCD_UNID_NEG.Text then
    edtCD_UNID_NEG.Text := S;
end;

procedure TfrmNfeFesto.btnPRODUTOClick(Sender: TObject);
var
  S: String;
begin
  S := ConsultaOnLineExSQL('SELECT CD_PRODUTO, NM_PRODUTO ' +
                           'FROM TPRODUTO ' +
                           'WHERE IN_ATIVO = "1"', 'Produto', ['CD_PRODUTO', 'AP_PRODUTO'], ['Código', 'Nome'], 'CD_PRODUTO', nil, edtCD_PRODUTO.Text);
  if S <> edtCD_PRODUTO.Text then
    edtCD_PRODUTO.Text := S;
end;

procedure TfrmNfeFesto.edtNR_PROCESSOPaste(Sender: TObject; var AText: String);
var
  I: Integer;
begin
  if TryStrToInt(Copy(AText, 1, 4), I) then
  begin
    if edtCD_UNID_NEG.Text <> Copy(AText, 1, 2) then
      edtCD_UNID_NEG.Text := Copy(AText, 1, 2);
    if edtCD_PRODUTO.Text <> Copy(AText, 3, 2) then
      edtCD_PRODUTO.Text := Copy(AText, 3, 2);
    Delete(AText, 1, 4);
  end;
end;

procedure TfrmNfeFesto.edtCD_PRODUTOPaste(Sender: TObject; var AText: String);
begin
  if Length(AText) > 2 then
  begin
    if edtCD_UNID_NEG.Text <> Copy(AText, 1, 2) then
      edtCD_UNID_NEG.Text := Copy(AText, 1, 2);
    edtNR_PROCESSO.Text := Copy(AText, 5, Length(AText) -4);
    AText := Copy(AText, 3, 2);
  end;
end;

procedure TfrmNfeFesto.edtCD_UNID_NEGPaste(Sender: TObject; var AText: String);
begin
  if Length(AText) > 2 then
  begin
    if edtCD_PRODUTO.Text <> Copy(AText, 3, 2) then
      edtCD_PRODUTO.Text := Copy(AText, 3, 2);
    edtNR_PROCESSO.Text := Copy(AText, 5, Length(AText) -4);
    AText := Copy(AText, 1, 2);
  end;
end;

procedure TfrmNfeFesto.edtCD_UNID_NEGExit(Sender: TObject);
begin
  if Length(Trim(edtCD_UNID_NEG.Text)) = 1 then
    edtCD_UNID_NEG.Text := '0' + Trim(edtCD_UNID_NEG.Text);
end;

procedure TfrmNfeFesto.edtCD_PRODUTOExit(Sender: TObject);
begin
  if Length(Trim(edtCD_PRODUTO.Text)) = 1 then
    edtCD_PRODUTO.Text := '0' + Trim(edtCD_PRODUTO.Text);
end;

procedure TfrmNfeFesto.btnPROCESSOClick(Sender: TObject);
var
  SQL: TStringList;
begin
  SQL := TStringList.Create;
  try
    SQL.Add('SELECT SUBSTRING(PR.NR_PROCESSO, 5, 13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA, DT_ABERTURA');
    SQL.Add('FROM TPROCESSO PR');
    SQL.Add('  INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = PR.CD_CLIENTE');
    SQL.Add('WHERE PR.CD_PRODUTO  = :CD_PRODUTO');
    SQL.Add('  AND PR.CD_UNID_NEG = :CD_UNID_NEG');
    SQL.Add('  AND EN.CD_GRUPO = ''B35''');
    SQL.Add('  AND PR.IN_CANCELADO = "0"');
    if chkUltimosProcessos.Checked then
      SQL.Add('  AND DT_ABERTURA > GETDATE() - :QTD_DIAS');
    //edtNR_PROCESSO.Text := ConsultaOnLineExSQLList(SQL, 'Processos', ['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_ABERTURA'],
    //   ['Processo', 'Serviço', 'Cliente', 'Apelido', 'CNPJ', 'Data de Abertura'], 'NR_PROCESSO', nil, edtNR_PROCESSO.Text, );
    edtNR_PROCESSO.Text := ConsultaOnLineExSQL(SQL.Text, 'Processos', ['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_ABERTURA'],
       ['Processo', 'Serviço', 'Cliente', 'Apelido', 'CNPJ', 'Data de Abertura'], 'NR_PROCESSO', [edtCD_PRODUTO.Text, edtCD_UNID_NEG.Text, 90], nil, edtNR_PROCESSO.Text);
  finally
    FreeAndNil(SQL);
  end;
end;

function TfrmNfeFesto.GeraNotas: Boolean;
var
  Arquivo: TStringList;
  Nome: String;
  Cntr: String;
  I, J : Integer;
begin
  Arquivo := TStringList.Create;
  Result := True;

  try
    if qryNfe.Active then
      qryNfe.Close;
    qryNfe.ParamByName('NR_PROCESSO').AsString := edtCD_UNID_NEG.Text + edtCD_PRODUTO.Text + edtNR_PROCESSO.Text;
    qryNfe.Open;
    J := 0;
    Arquivo.Add(qryNfeTX_LINHA.AsString);
    qryNfe.Next;
    while Result and not qryNfe.Eof do
    begin
      if Trim(qryNfeTX_LINHA.AsString) = '' then
        Result := False
      else
      begin
        if  Trim(qryNfeTX_LINHA.AsString) = 'NOTAFISCAL|1' then
        begin
          Inc(J);
          if not FileExists('C:\DDBROKER\NOTA FISCAL') then
            ForceDirectories('C:\DDBROKER\NOTA FISCAL');
          Nome := 'C:\DDBROKER\NOTA FISCAL\0101' + Trim(edtNR_PROCESSO.Text) + '-0' + IntToStr(J) + '.txt';
          Arquivo.SaveToFile(Nome);
          Arquivo.Clear;
          Arquivo.Add(qryNfeTX_LINHA.AsString);
        end
        else
          Arquivo.Add(qryNfeTX_LINHA.AsString);
        qryNfe.Next;
      end;
    end;
    if not Result then
      MessageDlg('ATENÇÃO: Erro na tentativa de gerar a DANFE!', mtWarning, [mbOk], 0)
    else
    begin
      qryNfe.First;
      if not FileExists('C:\DDBROKER\NOTA FISCAL') then
        ForceDirectories('C:\DDBROKER\NOTA FISCAL');
      if J > 0 then
      begin
        Inc(J);
        Nome := 'C:\DDBROKER\NOTA FISCAL\0101' + Trim(edtNR_PROCESSO.Text) + '-0' + IntToStr(J) + '.txt';
      end
      else
        Nome := 'C:\DDBROKER\NOTA FISCAL\0101' + Trim(edtNR_PROCESSO.Text) + '.txt';
      Arquivo.SaveToFile(Nome);
    end;
  finally
    FreeAndNil(Arquivo);
  end;
end;

end.

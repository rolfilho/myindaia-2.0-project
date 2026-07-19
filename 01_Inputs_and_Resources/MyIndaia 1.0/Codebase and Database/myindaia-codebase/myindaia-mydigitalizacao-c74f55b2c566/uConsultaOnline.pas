unit uConsultaOnline;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ADODB,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter;

type
  TfrmMyDigConsultaOnline = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    cxsHeaders: TcxStyle;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Executar Queries "UPDATE", "INSERT", "DELETE" }
    function Executar(ASQL: String): Integer;
    { Abrir Consulta }
    function AbrirQuery(ASQL: String; AAfterOpen: TNotifyEvent = nil): TADOQuery; overload;
    function AbrirQuery(ATabela, ACampoRetorno: String): TADOQuery; overload;
    function AbrirQuery(ATabela, ACampoRetorno, ACampoValor, AValor: String): TADOQuery; overload;
    { Funções de Consulta Sem Tela }
    function Consulta(ASQL: String; AAfterOpen: TNotifyEvent = nil): String; overload;
    function Consulta(ATabela, ACampoRetorno: String): String; overload;
    function Consulta(ATabela, ACampoRetorno, ACampoValor, AValor: String): String; overload;
    { Funções de Consulta Com Tela }
    function ConsultaOnLine(ACaptionNaTela, ATabela: String; ACampos, ANomes: array of String;
       ACampoRetorno: String; AUltimoValor: String): String; overload;
    function ConsultaOnLine(ACaptionNaTela, ATabela, ACampoValor, AValor: String;
       ACampos, ANomes: array of String; ACampoRetorno: String; AUltimoValor: String): String; overload;
    function ConsultaOnLineSQL(ACaptionNaTela, ASQL: String; ACampos, ANomes: array of String;
       ACampoRetorno: String; AUltimoValor: String): String;
  end;

var
  frmMyDigConsultaOnline: TfrmMyDigConsultaOnline;

implementation

uses
  dConsultaOnline, dDigitalizacao;

{$R *.dfm}

{ TTfrmMyDigConsultaOnline }

function TfrmMyDigConsultaOnline.Consulta(ASQL: String; AAfterOpen: TNotifyEvent): String;
begin
  with dtmMyDigConsultaOnline do
  begin
    if qryConsulta.Active then
      qryConsulta.Close;
    qryConsulta.SQL.Text := ASQL;
    qryConsulta.Open;
    Result := qryConsulta.Fields[0].AsString;
    if Assigned(AAfterOpen) then
      AAfterOpen(qryConsulta);
    qryConsulta.Close;
  end;
end;

function TfrmMyDigConsultaOnline.Consulta(ATabela, ACampoRetorno: String): String;
begin
  Result := Consulta('SELECT ' + ACampoRetorno + ' FROM ' + ATabela + ' (NOLOCK)');
end;

function TfrmMyDigConsultaOnline.AbrirQuery(ASQL: String; AAfterOpen: TNotifyEvent): TADOQuery;
begin
  Result := TADOQuery.Create(Self);
  Result.Connection := dtmmyIndaiaDigitalizacao.Connection;
  with Result do
  begin
    if Active then
      Close;
    SQL.Text := ASQL;
    Open;
  end;
end;

function TfrmMyDigConsultaOnline.AbrirQuery(ATabela, ACampoRetorno: String): TADOQuery;
begin
  Result := AbrirQuery('SELECT ' + ACampoRetorno + ' FROM '  + ATabela + ' (NOLOCK) ');
end;

function TfrmMyDigConsultaOnline.AbrirQuery(ATabela, ACampoRetorno, ACampoValor, AValor: String): TADOQuery;
begin
  Result := AbrirQuery('SELECT ' + ACampoRetorno + ' FROM ' + ATabela + ' (NOLOCK) WHERE ' + ACampoValor + ' = ' + QuotedStr(AValor));
end;

function TfrmMyDigConsultaOnline.Consulta(ATabela, ACampoRetorno, ACampoValor, AValor: String): String;
begin
  Result := Consulta('SELECT ' + ACampoRetorno + ' FROM ' + ATabela + ' (NOLOCK) WHERE ' + ACampoValor + ' = ' + QuotedStr(AValor));
end;

function TfrmMyDigConsultaOnline.ConsultaOnLine(ACaptionNaTela, ATabela: String;
   ACampos, ANomes: array of String; ACampoRetorno, AUltimoValor: String): String;
var
  ListaCampos: String;
  I: Integer;
begin
  ListaCampos := '';
  for I := 0 to High(ACampos) do
    ListaCampos := ListaCampos + ', ' + ACampos[I];
  Delete(ListaCampos, 1, 2);
  Result := ConsultaOnLineSQL(ACaptionNaTela, 'SELECT ' + ListaCampos + ' FROM  ' + ATabela  +' (NOLOCK) ', ACampos, ANomes, ACampoRetorno, AUltimoValor);
end;

function TfrmMyDigConsultaOnline.ConsultaOnLine(ACaptionNaTela, ATabela, ACampoValor, AValor: String;
   ACampos, ANomes: array of String; ACampoRetorno, AUltimoValor: String): String;
var
  ListaCampos: String;
  I: Integer;
begin
  ListaCampos := '';
  for I := 0 to High(ACampos) do
    ListaCampos := ListaCampos + ', ' + ACampos[I];
  Delete(ListaCampos, 1, 2);
  Result := ConsultaOnLineSQL(ACaptionNaTela, 'SELECT ' + ListaCampos + ' FROM ' + ATabela + ' (NOLOCK) WHERE ' + ACampoValor + ' = ' + QuotedStr(AValor),
     ACampos, ANomes, ACampoRetorno, AUltimoValor);
end;

function TfrmMyDigConsultaOnline.ConsultaOnLineSQL(ACaptionNaTela, ASQL: String;
                                                   ACampos, ANomes: array of String;
                                                   ACampoRetorno: String;
                                                   AUltimoValor: String): String;
var
  I: Integer;
begin
  with dtmMyDigConsultaOnline do
  begin
    if qryConsultaOnline.Active then
      qryConsultaOnline.Close;

    qryConsultaOnline.SQL.Text := ASQL;
    qryConsultaOnline.Open;

    while cxGrid1DBTableView1.ColumnCount > 0 do
      cxGrid1DBTableView1.Columns[0].Destroy;

    for I := 0 to High(ACampos) do
      with cxGrid1DBTableView1.CreateColumn do
      begin
        DataBinding.FieldName := ACampos[I];
        Caption := ANomes[I];
        AdjustSize;

        if Width < Length(Caption) * 10 then
          Width := Length(Caption) * 10;
      end;

    if ShowModal = mrOk then
      Result := qryConsultaOnline.FieldByName(ACampoRetorno).AsString
    else
      Result := AUltimoValor;
  end;
end;

function TfrmMyDigConsultaOnline.Executar(ASQL: String): Integer;
begin
  with dtmMyDigConsultaOnline do
  begin
    if qryExecuta.Active then
      qryExecuta.Close;

    qryExecuta.SQL.Text := ASQL;
    Result := qryExecuta.ExecSQL;
  end;
end;

procedure TfrmMyDigConsultaOnline.cxGrid1DBTableView1DblClick(
  Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.

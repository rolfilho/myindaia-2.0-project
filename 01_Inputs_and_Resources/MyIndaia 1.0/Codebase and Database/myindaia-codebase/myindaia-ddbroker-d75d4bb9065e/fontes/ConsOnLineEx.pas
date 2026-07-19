{-----------------------------------------------------------------------------
 Unit Name: ConsOnLineEx
 Author:    vitor.zanin
 Purpose:
 History:
-----------------------------------------------------------------------------}

unit ConsOnLineEx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, Menus, Funcoes,
  ServicoNovo;

type
  TfrmConsOnLineEx = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    gridConsOnLine: TDBGrid;
    Shape1: TShape;
    Label1: TLabel;
    lblCriterioPesquisa: TLabel;
    Shape2: TShape;
    edtPesquisa: TEdit;
    Shape3: TShape;
    Label3: TLabel;
    qryConsOnLine: TQuery;
    dsConOnLine: TDataSource;
    lblNoOrder: TLabel;
    shpVerde: TShape;
    lblOrdenadoPor: TLabel;
    Shape4: TShape;
    Label2: TLabel;
    pnlFiltro: TPanel;
    Panel5: TPanel;
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    cmbCampos: TComboBox;
    Label4: TLabel;
    cmbPesquisa: TComboBox;
    Label5: TLabel;
    Shape5: TShape;
    Label6: TLabel;
    edtPalavraChave: TEdit;
    Shape6: TShape;
    Panel4: TPanel;
    btn_sair: TSpeedButton;
    pnl_filtrar: TPanel;
    pnl_incluir: TPanel;
    btn_incluir: TSpeedButton;
    btn_filtrar: TSpeedButton;
    pnl_texto_referencia: TPanel;
    Label7: TLabel;
    mem_texto_referencia: TMemo;
    btn_refresh: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridConsOnLineTitleClick(Column: TColumn);
    procedure gridConsOnLineKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridConsOnLineDblClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    function VerificaDireitos: Boolean;
    procedure btn_filtrarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure gridConsOnLineKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_refreshClick(Sender: TObject);
    procedure gridConsOnLineMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    gColor:TColor;
    gHintPause,gHintHidePause:integer;

    function VerificaCampo(pCampo: string): string;
    { Private declarations }


  public
    vTemWhere : Boolean;
    DM: TDataModule;
//    Cadastro: TFormClass;
    vColunaOrdenada : Integer;
    vMenuItem : TMenuItem;
    vSQLPadrao, vOrdenadoPor: string;
    NomesAux : array of string;
    CamposAux : array of string;
    vSQLList : TStringList;
    vAchouResult: Boolean;
    { Public declarations }
  end;

function ConsultaLookUPMaisCampos(Tabela, Campo, valor, Retorno: string): string;
function ConsultaOnLineEx(Tabela, CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; pMenuItem: TMenuItem = nil ; pColunaOrdenada:Integer=1; pUltimoValor: string = ''): string; overload;

function ConsultaOnLineExFiltro(Tabela, CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; Filtro: string; pMenuItem : TMenuItem; pUltimoValor: string = ''; pColunaOrdenada:Integer=1): string; overload;
function ConsultaOnLineExFiltro(Tabela, CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; Filtro: string; pMenuItem : TMenuItem; AParams: array of Variant; pUltimoValor: string = ''; pColunaOrdenada:Integer=1): string; overload;

function ConsultaOnLineExSQL(SQL, CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; pMenuItem: TMenuItem = nil; pUltimoValor: string = ''): string; overload;
function ConsultaOnLineExSQL(SQL, CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; AParams: array of Variant; pMenuItem: TMenuItem = nil; pUltimoValor: string = ''): string; overload;

function ConsultaLookUP(Tabela, Campo, valor, Retorno: string): string; overload;
function ConsultaLookUP(ATabela, ACampo, AValor, ARetorno: string; AParams: array of Variant): string; overload;

function ConsultaLookUPSQL(pSQL, pRetorno: string): string; overload;
function ConsultaLookUPSQL(ASQL, ARetorno: string; AParams: array of Variant): string; overload;

procedure SetParamValues(AQuery: TQuery; AParamValues: array of Variant);

//function ConsultaOnLineExSQLList(SQL : TStringList; CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; pMenuItem : TMenuItem; pUltimoValor: string = ''): string; overload;
function ConsultaOnLineExSQLList(SQL : TStringList; CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; pMenuItem : TMenuItem; pUltimoValor: string = '' ; pTexto_Referencia:String = ''  ): string; overload;


var ConsOnLineRes: array[0..9] of string;

implementation
uses PGGP017;

{$R *.DFM}

function ConsultaLookUP(Tabela, Campo, valor, Retorno: string): string;
begin
  result := '';
  if valor <> '' then with TQuery.Create(Application) do begin
      DataBaseName := 'DBBROKER';
      SQL.ADD('Select ' + retorno + ' from ' + tabela + ' (nolock) where ' + campo + ' = ' + QuotedStr(valor));
      Open;
      Result := Fields[0].AsString;
      Free;
    end;
end;

function ConsultaLookUPMaisCampos(Tabela, Campo, valor, Retorno: string): string;
var i : integer;
valores : string;
begin
  result := '';
  if valor <> '' then
  with TQuery.Create(Application) do
  begin
      DataBaseName := 'DBBROKER';
      SQL.ADD('Select ' + retorno + ' from ' + tabela + ' (nolock) where ' + campo + ' = ' + QuotedStr(valor));
      Open;
      valores := '';
      for i := 0 to Fields.Count-1 do
      begin
        valores := valores + Fields[i].AsString + '|';
      end;
      
      Result  := valores;
      Free;
  end;
end;

function ConsultaLookUP(ATabela, ACampo, AValor, ARetorno: string; AParams: array of Variant): string;
begin
  Result := '';
  if AValor <> '' then
    Result := ConsultaLookUPSQL('Select ' + ARetorno + ' from ' + ATabela + ' (NOLOCK) where ' + ACampo + ' = :' + ACampo, ARetorno, [AValor]);
end;

function ConsultaLookUPSQL(pSQL, pRetorno: string): string;
begin
  result := '';
  with TQuery.Create(Application) do begin
    DataBaseName := 'DBBROKER';
    SQL.ADD(pSQL);
    Open;
    Result := FieldByName(pRetorno).AsString;
    Free;
  end;
end;

function ConsultaLookUPSQL(ASQL, ARetorno: string; AParams: array of Variant): string;
var
  Query: TQuery;
begin
  Result := '';
  Query := TQuery.Create(Application);
  with Query do
    try
      DataBaseName := 'DBBROKER';
      SQL.Add(ASQL);
      SetParamValues(Query, AParams);
      Open;
      Result := FieldByName(ARetorno).AsString;
    finally
      Free;
    end;
end;

procedure SetParamValues(AQuery: TQuery; AParamValues: array of Variant);
var
  I: Integer;
begin
  if High(AParamValues) <> (AQuery.Params.Count -1) then
    raise Exception.Create('Quantidade de parâmetros incorreta para a consulta.');
  for I := 0 to High(AParamValues) do
    case VarType(AParamValues[I]) of
      varEmpty,
      varNull: AQuery.Params[I].Clear;

      varDispatch,
      varError,
      varAny,
      varVariant,
      varUnknown,
      varTypeMask,
      varArray,
      varByRef: ;

      varSmallint,
      varInteger,
      varSingle,
      varShortInt,
      varByte,
      varWord,
      varLongWord,
      varInt64: AQuery.Params[I].AsInteger := AParamValues[I];

      varDouble,
      varCurrency: AQuery.Params[I].AsFloat := AParamValues[I];

      varDate: AQuery.Params[I].AsDateTime := AParamValues[I];

      varOleStr, varStrArg, varString: AQuery.Params[I].AsString := AParamValues[I];

      varBoolean: AQuery.Params[I].AsBoolean := AParamValues[I];
    end;
end;

function ConsultaOnLineEx(Tabela, CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; pMenuItem : TMenuItem = nil; pColunaOrdenada:Integer=1;  pUltimoValor: string = ''): string;
var
  F : Integer;
begin
  Result := '';
  if (Tabela = '') or (Retorno = '') then Exit;
  with TfrmConsOnLineEx.Create(Application) do
  begin
    Caption := 'Consulta On Line - ' + CaptionNaTela;
    qryConsOnLine.SQL.ADD('SELECT ' + Campos[0]);
    for F := 1 to high(Campos) do qryConsOnLine.SQL[0] := qryConsOnLine.SQL[0] + ', ' + Campos[F];
    qryConsOnLine.SQL[0] := qryConsOnLine.SQL[0] + ' FROM ' + Tabela + ' (nolock) ';
    vSQLPadrao := qryConsOnLine.SQL.Text;
    qryConsOnLine.Open;
    for F := 0 to high(Nomes) do begin
      gridConsOnLine.Columns[F].Title.Caption := Nomes[F];
    end;

    // coluna ordenada por parametro ( padrão 1 (segunda coluna) )
    vColunaOrdenada := pColunaOrdenada;
    // habilitar ou não o botão de inclusão
    vMenuItem := pMenuItem;
//    Cadastro := pFormCadastro;
    pnl_incluir.Visible := ( (pMenuItem <> nil) and (VerificaDireitos) );

    SetLength(NomesAux,Length(Nomes));
    for F := 0 to high(Nomes) do
      NomesAux[F] := Nomes[F];

    SetLength(CamposAux,Length(Campos));
    for F := 0 to high(Campos) do
      CamposAux[F] := Campos[F];

    ShowModal;

    //kleber Guedes (23/05/2006)
    // retorno do resultado (duplo-clique retorna o campo, botão sair retorna o último valor (padrão vazio))
    if vAchouResult then
      Result := qryConsOnLine.FieldByName(Retorno).AsString
    else
      Result := pUltimoValor;

    for F := 0 to high(Campos) do begin
      if F > 9 then continue;
      ConsOnLineRes[F] := qryConsOnLine.Fields[f].AsString;
    end;
    Free;
  end;
end;

function ConsultaOnLineExFiltro(Tabela, CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; Filtro: string; pMenuItem : TMenuItem; pUltimoValor: string = ''; pColunaOrdenada:Integer=1): string;
var
  F: Integer;
begin
  if Filtro = '' then begin
    Result := ConsultaOnLineEx(Tabela, CaptionNaTela, Campos, Nomes, Retorno,nil);
    Exit;
  end;
  Result := '';
  if (Tabela = '') or (Retorno = '') then Exit;

  with TfrmConsOnLineEx.Create(Application) do begin
    Caption := 'Consulta On Line - ' + CaptionNaTela;
    qryConsOnLine.SQL.ADD('SELECT ' + Campos[0]);
    for F := 1 to high(Campos) do qryConsOnLine.SQL[0] := qryConsOnLine.SQL[0] + ', ' + Campos[F];
    qryConsOnLine.SQL[0] := qryConsOnLine.SQL[0] + ' FROM ' + Tabela + ' (nolock) ';
    qryConsOnLine.SQL.Add('WHERE ' + Filtro);
    vSQLPadrao := qryConsOnLine.SQL.Text;
    qryConsOnLine.Open;
    for F := 0 to high(Nomes) do begin
      gridConsOnLine.Columns[F].Title.Caption := Nomes[F];
    end;

    // coluna ordenada por parametro ( padrão 1 (segunda coluna) )
    vColunaOrdenada := pColunaOrdenada;

    // habilitar ou não o botão de inclusão
    vMenuItem := pMenuItem;
//    Cadastro := pFormCadastro;
    pnl_incluir.Visible := ( (pMenuItem <> nil) and (VerificaDireitos) );

    SetLength(NomesAux,Length(Nomes));
    for F := 0 to high(Nomes) do
      NomesAux[F] := Nomes[F];

    SetLength(CamposAux,Length(Campos));
    for F := 0 to high(Campos) do
      CamposAux[F] := Campos[F];

    ShowModal;

    //kleber Guedes (23/05/2006)
    // retorno do resultado (duplo-clique retorna o campo, botão sair retorna o último valor (padrão vazio))
    if vAchouResult then
      Result := qryConsOnLine.FieldByName(Retorno).AsString
    else
      Result := pUltimoValor;



    for F := 0 to high(Campos) do begin
      if F > 9 then continue;
      ConsOnLineRes[F] := qryConsOnLine.Fields[f].AsString;
    end;
    Free;
  end;
end;

function ConsultaOnLineExFiltro(Tabela, CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; Filtro: string; pMenuItem : TMenuItem; AParams: array of Variant; pUltimoValor: string = ''; pColunaOrdenada:Integer=1): string;
var
  F: Integer;
begin
  if Filtro = '' then
  begin
    Result := ConsultaOnLineEx(Tabela, CaptionNaTela, Campos, Nomes, Retorno, nil);
    Exit;
  end;
  Result := '';
  if (Tabela = '') or (Retorno = '') then Exit;

  with TfrmConsOnLineEx.Create(Application) do
  begin
    Caption := 'Consulta On Line - ' + CaptionNaTela;
    qryConsOnLine.SQL.ADD('SELECT ' + Campos[0]);
    for F := 1 to high(Campos) do
      qryConsOnLine.SQL[0] := qryConsOnLine.SQL[0] + ', ' + Campos[F];
    qryConsOnLine.SQL[0] := qryConsOnLine.SQL[0] + ' FROM ' + Tabela + ' (nolock) ';
    qryConsOnLine.SQL.Add('WHERE ' + Filtro);
    vSQLPadrao := qryConsOnLine.SQL.Text;
    SetParamValues(qryConsOnLine, AParams);
    qryConsOnLine.Open;
    for F := 0 to high(Nomes) do begin
      gridConsOnLine.Columns[F].Title.Caption := Nomes[F];
    end;

    // coluna ordenada por parametro ( padrão 1 (segunda coluna) )
    vColunaOrdenada := pColunaOrdenada;

    // habilitar ou não o botão de inclusão
    vMenuItem := pMenuItem;
//    Cadastro := pFormCadastro;
    pnl_incluir.Visible := ( (pMenuItem <> nil) and (VerificaDireitos) );

    SetLength(NomesAux,Length(Nomes));
    for F := 0 to high(Nomes) do
      NomesAux[F] := Nomes[F];

    SetLength(CamposAux,Length(Campos));
    for F := 0 to high(Campos) do
      CamposAux[F] := Campos[F];

    ShowModal;

    //kleber Guedes (23/05/2006)
    // retorno do resultado (duplo-clique retorna o campo, botão sair retorna o último valor (padrão vazio))
    if vAchouResult then
      Result := qryConsOnLine.FieldByName(Retorno).AsString
    else
      Result := pUltimoValor;



    for F := 0 to high(Campos) do begin
      if F > 9 then continue;
      ConsOnLineRes[F] := qryConsOnLine.Fields[f].AsString;
    end;
    Free;
  end;
end;

function ConsultaOnLineExSQL(SQL, CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; pMenuItem : TMenuItem = nil; pUltimoValor: string = ''): string;
var
  F: Integer;
begin
  Result := '';
  if (SQL = '') or (Retorno = '') then Exit;
  with TfrmConsOnLineEx.Create(Application) do
  begin
    Caption := 'Consulta On Line - ' + CaptionNaTela;
    qryConsOnLine.SQL.ADD(SQL);
    qryConsOnLine.Open;

    for F := 0 to high(Nomes) do
      gridConsOnLine.Columns[F].Title.Caption := Nomes[F];

// habilitar ou não o botão de inclusão
    vMenuItem := pMenuItem;
//    Cadastro := pFormCadastro;
    pnl_incluir.Visible := ( (pMenuItem <> nil) and (VerificaDireitos) );

    SetLength(NomesAux,Length(Nomes));
    for F := 0 to high(Nomes) do
      NomesAux[F] := Nomes[F];

    SetLength(CamposAux,Length(Campos));
    for F := 0 to high(Campos) do
      CamposAux[F] := Campos[F];

    pnl_filtrar.Visible := False;

    ShowModal;

    //kleber Guedes (23/05/2006)
    // retorno do resultado (duplo-clique retorna o campo, botão sair retorna o último valor (padrão vazio))
    if vAchouResult then
      Result := qryConsOnLine.FieldByName(Retorno).AsString
    else
      Result := pUltimoValor;

    for F := 0 to high(Campos) do begin
      if F > 9 then continue;
      ConsOnLineRes[F] := qryConsOnLine.Fields[f].AsString;
    end;
    Free;
  end;
end;

function ConsultaOnLineExSQL(SQL, CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; AParams: array of Variant; pMenuItem: TMenuItem = nil; pUltimoValor: string = ''): string;
var
  F: Integer;
begin
  Result := '';
  if (SQL = '') or (Retorno = '') then
    Exit;
  with TfrmConsOnLineEx.Create(Application) do
  begin
    Caption := 'Consulta On Line - ' + CaptionNaTela;
    qryConsOnLine.SQL.Add(SQL);
    SetParamValues(qryConsOnLine, AParams);
    qryConsOnLine.Open;

    for F := 0 to high(Nomes) do
      gridConsOnLine.Columns[F].Title.Caption := Nomes[F];

// habilitar ou não o botão de inclusão
    vMenuItem := pMenuItem;
//    Cadastro := pFormCadastro;
    pnl_incluir.Visible := ( (pMenuItem <> nil) and (VerificaDireitos) );

    SetLength(NomesAux,Length(Nomes));
    for F := 0 to high(Nomes) do
      NomesAux[F] := Nomes[F];

    SetLength(CamposAux,Length(Campos));
    for F := 0 to high(Campos) do
      CamposAux[F] := Campos[F];

    pnl_filtrar.Visible := False;

    ShowModal;

    //kleber Guedes (23/05/2006)
    // retorno do resultado (duplo-clique retorna o campo, botão sair retorna o último valor (padrão vazio))
    if vAchouResult then
      Result := qryConsOnLine.FieldByName(Retorno).AsString
    else
      Result := pUltimoValor;

    for F := 0 to high(Campos) do begin
      if F > 9 then continue;
      ConsOnLineRes[F] := qryConsOnLine.Fields[f].AsString;
    end;
    Free;
  end;
end;

function ConsultaOnLineExSQLList(SQL : TStringList; CaptionNaTela: string; Campos, Nomes: array of string; Retorno: string; pMenuItem : TMenuItem; pUltimoValor: string = '' ; pTexto_Referencia:String = ''  ): string; overload;
var
  F: Integer;
begin
  Result := '';
  if (SQL.Count = 0) or (Retorno = '') then Exit;
  with TfrmConsOnLineEx.Create(Application) do begin
    Caption := 'Consulta On Line - ' + CaptionNaTela;
    vSQLList := SQL;
    qryConsOnLine.SQL := SQL;
    qryConsOnLine.Open;
    for F := 0 to high(Nomes) do begin
      gridConsOnLine.Columns[F].Title.Caption := Nomes[F];
    end;

    // habilitar ou não o botão de inclusão
    vMenuItem := pMenuItem;
//    Cadastro := pFormCadastro;
    pnl_incluir.Visible := ( (pMenuItem <> nil) and (VerificaDireitos) );

    SetLength(NomesAux,Length(Nomes));
    for F := 0 to high(Nomes) do
      NomesAux[F] := Nomes[F];

    SetLength(CamposAux,Length(Campos));
    for F := 0 to high(Campos) do
      CamposAux[F] := Campos[F];

    pnl_filtrar.Visible := True;
    if pTexto_Referencia<>'' then begin
       mem_texto_referencia.Text:=pTexto_Referencia; 
       pnl_texto_referencia.Visible:=True
    end;

    ShowModal;

    //kleber Guedes (23/05/2006)
    // retorno do resultado (duplo-clique retorna o campo, botão sair retorna o último valor (padrão vazio))
    if vAchouResult then
      Result := qryConsOnLine.FieldByName(Retorno).AsString
    else
      Result := pUltimoValor;


    for F := 0 to high(Campos) do begin
      if F > 9 then continue;
      ConsOnLineRes[F] := qryConsOnLine.Fields[f].AsString;
    end;
    Free;
  end;
end;

procedure TfrmConsOnLineEx.btn_sairClick(Sender: TObject);
begin
  vAchouResult := False;
  Close;
end;

procedure TfrmConsOnLineEx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmConsOnLineEx.gridConsOnLineTitleClick(Column: TColumn);
var
  i, vIndAux: Integer;
begin
  if gridConsOnLine.Columns.Count = 1 then Exit;

  gridConsOnLine.Columns.RestoreDefaults;
  vIndAux := Column.Index;
  vOrdenadoPor := Column.FieldName;
  if not lblNoOrder.Visible then begin
    for i := 0 to qryConsOnLine.SQL.Count - 1 do begin
      if Pos('ORDER BY', qryConsOnLine.SQL.Strings[i]) > 0 then begin
        qryConsOnLine.SQL.Strings[i] := '';
        break;
      end;
    end;
    lblCriterioPesquisa.Caption := NomesAux[vIndAux];
    qryConsOnLine.SQL.Add('ORDER BY ' + vOrdenadoPor);
    qryConsOnLine.Close;
    qryConsOnLine.Prepare;
    qryConsOnLine.Open;
  end;
  gridConsOnLine.Columns[vIndAux].Color := $00EBFFE6;
  for i := 0 to high(NomesAux) do begin
    gridConsOnLine.Columns[i].Title.Caption := NomesAux[i];
  end;

  vColunaOrdenada:=vIndAux;
end;
                
procedure TfrmConsOnLineEx.gridConsOnLineKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> CHR(VK_Return) then begin
    with edtPesquisa do begin
      SetFocus; Clear;
      Text := Key; SelStart := 1;
    end;
  end else begin
    gridConsOnLineDblClick(gridConsOnLine);
  end;
end;

procedure TfrmConsOnLineEx.edtPesquisaChange(Sender: TObject);
begin
  qryConsOnLine.Locate(vOrdenadoPor, edtPesquisa.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmConsOnLineEx.FormShow(Sender: TObject);
begin
  Shape1.Brush.Color := clMenuBroker;
  Shape4.Brush.Color := clMenuBroker;
  Panel4.Color := clPnlClaroBroker;
  Shape2.Brush.Color := clPnlClaroBroker;
  label2.Caption := Trim(Copy(Caption,Pos('-',Caption)+1,Length(Caption)));
  label3.Caption := label2.Caption;
  gridConsOnLineTitleClick(gridConsOnLine.Columns[vColunaOrdenada]);
end;

procedure TfrmConsOnLineEx.FormCreate(Sender: TObject);
begin
  {by carlos - 19/03/2012}
  gColor         := Application.HintColor;
  gHintPause     := Application.HintPause;
  gHintHidePause := Application.HintHidePause;
  //
  {Altera a cor do Hint}
  Application.HintColor := clYellow;
  {Altera a pausa para exibição do Hint}
  Application.HintPause := 50;
  {Altera o tempo que o Hint fica visível}
  Application.HintHidePause := 10000;
  //

  lblNoOrder.Visible := (Pos('ORDER BY', qryConsOnLine.SQL.Text) > 0);
  lblOrdenadoPor.Visible := not lblNoOrder.Visible;
  shpVerde.Visible := not lblNoOrder.Visible;
  vAchouResult := false;
end;

procedure TfrmConsOnLineEx.gridConsOnLineDblClick(Sender: TObject);
begin
  vAchouResult := True;
  Close;
end;

procedure TfrmConsOnLineEx.btn_incluirClick(Sender: TObject);
//var
//  FormCadastro : TForm;
begin
//  FormCadastro := Cadastro.Create(Application);
//  FormCadastro.ShowModal;

(*  if not VerIntegridade then Exit;
  str_cd_modulo := '22';
  str_cd_rotina := '2203';
  str_cd_mod := str_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  frm_emp_est.ShowModal;*)

  vMenuItem.OnClick(btn_incluir);

  qryConsOnLine.Close;
  qryConsOnLine.Prepare;
  qryConsOnLine.Open;
  gridConsOnLineTitleClick(gridConsOnLine.Columns[0]);
  
end;

function TfrmConsOnLineEx.VerificaDireitos : Boolean;
var
//  FormCadastro : TForm;
  vRotina : string;
begin
  try
//    FormCadastro := Cadastro.Create(Application);
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT CD_ROTINA FROM TMODULO_ROTINA (nolock) WHERE NM_MENU = ''' + TMenuItem(vMenuItem).Name + '''');
      Open;
      vRotina := Fields[0].AsString;
      Close;
      SQL.Clear;
      SQL.Add('SELECT IN_ACESSO');
      SQL.Add('FROM   TCONTROLE_ACESSO (nolock) ');
      SQL.Add('WHERE  CD_CARGO  = ''' + str_cd_cargo + ''' and');
      SQL.Add('       CD_ROTINA = ''' + vRotina      + '''');
      Open;
      Result := FieldByName('IN_ACESSO').AsBoolean;
      Close;
      Free;
    end;
//    FormCadastro.Free;
  except
    on e: Exception do begin
//      FormCadastro.Free;
      BoxMensagem('Ocorreu um erro ao tentar verificar os direitos do usuario.' + #10#13 + 'Erro: ' + e.message,2);
      Result := False;
    end;
  end;
end;

procedure TfrmConsOnLineEx.btn_filtrarClick(Sender: TObject);
var
  i : Integer;
begin
  qryConsOnLine.Close;
  if Trim(vSQLPadrao) <> '' then
    qryConsOnLine.SQL.Text := vSQLPadrao
  else qryConsOnLine.SQL := vSQLList;
  qryConsOnLine.Prepare;
  qryConsOnLine.Open;

  vTemWhere := False;
  for i := 0 to qryConsOnLine.SQL.Count - 1 do
    if Pos('WHERE',qryConsOnLine.SQL.Strings[i]) > 0 then begin
      vTemWhere := True;
      break;
    end;

  edtPalavraChave.Clear;
  cmbPesquisa.ItemIndex := -1;
  cmbCampos.Items.Clear;
  for i := 0 to Length(NomesAux) - 1 do
    cmbCampos.Items.Add(NomesAux[i]);

  pnlFiltro.Visible := True;
  cmbCampos.SetFocus;

  gridConsOnLineTitleClick(gridConsOnLine.Columns[0]);
end;

procedure TfrmConsOnLineEx.SpeedButton1Click(Sender: TObject);
var
  i : Integer;
  vStrWhere : string;
begin

  for i := 0 to qryConsOnLine.SQL.Count - 1 do
    if Pos('ORDER BY',qryConsOnLine.SQL.Strings[i]) > 0 then begin
      qryConsOnLine.SQL.Delete(i);
      break;
    end;

  if vTemWhere then
    vStrWhere := 'AND '
  else vStrWhere := 'WHERE ';

  if cmbPesquisa.Text = 'que comece com' then
    qryConsOnLine.SQL.Add(vStrWhere + VerificaCampo(CamposAux[cmbCampos.ItemIndex]) + ' like '''  + edtPalavraChave.Text + '%''');

  if cmbPesquisa.Text = 'que termine com' then
    qryConsOnLine.SQL.Add(vStrWhere + VerificaCampo(CamposAux[cmbCampos.ItemIndex]) + ' like ''%' + edtPalavraChave.Text + '''');

  if cmbPesquisa.Text = 'igual a' then
    qryConsOnLine.SQL.Add(vStrWhere + VerificaCampo(CamposAux[cmbCampos.ItemIndex]) + ' = '''     + edtPalavraChave.Text + '''');

  if cmbPesquisa.Text = 'diferente de' then
    qryConsOnLine.SQL.Add(vStrWhere + VerificaCampo(CamposAux[cmbCampos.ItemIndex]) + ' <> '''    + edtPalavraChave.Text + '''');

  if cmbPesquisa.Text = 'que contenha' then
    qryConsOnLine.SQL.Add(vStrWhere + VerificaCampo(CamposAux[cmbCampos.ItemIndex]) + ' like ''%' + edtPalavraChave.Text + '%''');

  if cmbPesquisa.Text = 'maior que' then
    qryConsOnLine.SQL.Add(vStrWhere + VerificaCampo(CamposAux[cmbCampos.ItemIndex]) + ' > '''     + edtPalavraChave.Text + '''');

  if cmbPesquisa.Text = 'menor que' then
    qryConsOnLine.SQL.Add(vStrWhere + VerificaCampo(CamposAux[cmbCampos.ItemIndex]) + ' < '''     + edtPalavraChave.Text + '''');

  qryConsOnLine.Close;
  qryConsOnLine.Prepare;
  qryConsOnLine.Open;

  pnlFiltro.Visible := False;
  gridConsOnLineTitleClick(gridConsOnLine.Columns[0]);
end;

function TfrmConsOnLineEx.VerificaCampo(pCampo : string) : string;
begin
  Result := pCampo;
  if (pCampo = 'NR_PROCESSO') and ( (Pos('SUBSTRING',vSQLList.Text) > 0) or (Pos('SUBSTRING',vSQLPadrao) > 0) ) then
    Result := 'SUBSTRING(NR_PROCESSO,5,13)';
end;

procedure TfrmConsOnLineEx.SpeedButton2Click(Sender: TObject);
begin
  pnlFiltro.Visible := False;
end;

procedure TfrmConsOnLineEx.SpeedButton3Click(Sender: TObject);
begin
//  frm_main.mi_cad_mercClick(nil);
end;

procedure TfrmConsOnLineEx.gridConsOnLineKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
     gridConsOnLineDblClick(gridConsOnLine);
end;

procedure TfrmConsOnLineEx.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then btn_sairClick(nil);
end;

procedure TfrmConsOnLineEx.btn_refreshClick(Sender: TObject);
begin
  { by Carlos - 12/07/2011 }
  qryConsOnLine.Close;
  qryConsOnLine.Open;
  //
  gridConsOnLineTitleClick(gridConsOnLine.Columns[vColunaOrdenada]);
end;


{by Carlos - 19/03/2012}
procedure TfrmConsOnLineEx.gridConsOnLineMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
texto,NewTexto:String;
begin
  texto:=gridConsOnLine.Columns[gridConsOnLine.SelectedIndex].Field.AsString;
  if Length(texto) > 90 then begin
    NewTexto:='';
    while length(texto)>0 do begin
      NewTexto:=NewTexto+copy(texto,1,90)+#13;
      delete(texto,1,90);
    end;
    gridConsOnLine.Hint:=trim(NewTexto);
  end else
    gridConsOnLine.Hint:=texto;

end;

procedure TfrmConsOnLineEx.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Application.HintColor     := gColor;
  Application.HintPause     := gHintPause;
  Application.HintHidePause := gHintHidePause;
end;

end.


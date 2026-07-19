unit ServicoNovo;

interface

uses
  Forms, Windows, Classes, SysUtils, StrUtils, DBTables, DB, TypInfo;

type
  TDataModule = class(Classes.TDataModule)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TForm = class(Forms.TForm)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TQuery = class(DBTables.TQuery)
  public
    procedure Open; reintroduce;
    procedure ExecSQL; reintroduce;
  end;

procedure SetServicoNovo(AValue: Boolean; AControle: TComponent = nil); overload;
procedure SetServicoNovo(AProcesso: String; AControle: TComponent = nil); overload;
procedure SetServicoNovo(ACliente, AProduto: String; AControle: TComponent = nil); overload;
function GetServicoNovo: Boolean; overload;
function GetServicoNovo(AProcesso: String): Boolean; overload;
function GetServicoNovo(ACliente, AProduto: String): Boolean; overload;

function AjustaSQLServicoNovo(AServicoNovo: Boolean; ASQL: String): String;
procedure AjustaQueryServicoNovo(AServicoNovo: Boolean; AQuery: TQuery);
procedure AjustaControlesServicoNovo(AServicoNovo: Boolean; AParent: TComponent);

function ClasseExiste(AClasse: TClass): Boolean; overload;
function ClasseExiste(AClasse: String): Boolean; overload;
procedure AdicionaClasse(AClasse: TClass); overload;
procedure AdicionaClasse(AClasse: String); overload;

implementation

uses
  ConsOnLineEx;

var
  FServicoNovo: Boolean = False;
  FClassesSemQuery: array of String;

procedure SetServicoNovo(AValue: Boolean; AControle: TComponent = nil);
begin
  FServicoNovo := AValue;
  if AControle <> nil then
    AjustaControlesServicoNovo(AValue, AControle)
  else
  begin
    if Screen.DataModuleCount > 0 then
      AjustaControlesServicoNovo(AValue, Screen.DataModules[Screen.DataModuleCount -1]);
    if Screen.FormCount > 0 then
      AjustaControlesServicoNovo(AValue, Screen.Forms[Screen.FormCount -1]);
  end;
end;

procedure SetServicoNovo(AProcesso: String; AControle: TComponent = nil); overload;
begin
  SetServicoNovo(GetServicoNovo(AProcesso), AControle);
end;

procedure SetServicoNovo(ACliente, AProduto: String; AControle: TComponent = nil); overload;
begin
  SetServicoNovo(GetServicoNovo(ACliente, AProduto), AControle);
end;

function GetServicoNovo: Boolean;
begin
  Result := FServicoNovo;
end;

function GetServicoNovo(AProcesso: String): Boolean;
begin
  Result := ConsultaLookUPSQL('SELECT CASE WHEN P.DT_ABERTURA >= CASE WHEN P.CD_PRODUTO IN ("01") THEN ISNULL(G.DT_NOVO_FOLLOWUP_IMP, DATEADD(YEAR, 1, GETDATE())) ' +
                              '                                  ELSE CASE WHEN P.CD_PRODUTO IN ("02") THEN ISNULL(G.DT_NOVO_FOLLOWUP_EXP, DATEADD(YEAR, 1, GETDATE())) ' +
                              '                                       ELSE DATEADD(YEAR, 1, GETDATE()) ' +
                              '                                       END ' +
                              '                                  END THEN "1" ' +
                              '       ELSE "0" ' +
                              '       END AS IN_NOVO_FOLLOWUP ' +
                              ' FROM TGRUPO G (NOLOCK) ' +
                              '    INNER JOIN TPROCESSO P (NOLOCK) ON P.CD_GRUPO = G.CD_GRUPO ' +
                              ' WHERE P.NR_PROCESSO = "' + AProcesso + '"', 'IN_NOVO_FOLLOWUP') = '1';
end;

function GetServicoNovo(ACliente, AProduto: String): Boolean;
begin
  Result := ConsultaLookUPSQL(' SELECT CASE WHEN GETDATE() >= CASE WHEN "' + AProduto + '" IN ("01") THEN ISNULL(G.DT_NOVO_FOLLOWUP_IMP, DATEADD(YEAR, 1, GETDATE())) ' +
                              '                               ELSE CASE WHEN "' + AProduto + '" IN ("02") THEN ISNULL(G.DT_NOVO_FOLLOWUP_EXP, DATEADD(YEAR, 1, GETDATE())) ' +
                              '                                    ELSE DATEADD(YEAR, 1, GETDATE()) ' +
                              '                                    END ' +
                              '                               END THEN "1" ' +
                              '        ELSE "0" ' +
                              '        END AS IN_NOVO_FOLLOWUP' +
                              ' FROM TEMPRESA_NAC E ' +
                              '    INNER JOIN TGRUPO G ON G.CD_GRUPO = E.CD_GRUPO ' +
                              ' WHERE E.CD_EMPRESA = "' + ACliente + '"', 'IN_NOVO_FOLLOWUP') = '1';
end;

function AjustaSQLServicoNovo(AServicoNovo: Boolean; ASQL: String): String;
type
  TPalavra = record
    Nome: String;
    Posicao: Integer;
  end;

const
  _LETRAS = ['a'..'z', 'á', 'é', 'í', 'ó', 'ú', 'ç', 'ã', 'õ',
             'A'..'Z', 'Á', 'É', 'Í', 'Ó', 'Ú', 'Ç', 'Ã', 'Õ',
             '0'..'9', '_'];
  _TABELAS_ANTIGO: array[0..1] of string = ('TSERVICO', 'TSERVICO_EVENTO');
  _TABELAS_NOVO: array[0..1] of string = ('TSERVICO_NOVO', 'TSERVICO_EVENTO_NOVO');
  _TABELAS: array[0..3] of string = ('TSERVICO', 'TSERVICO_EVENTO',
                                     'TSERVICO_NOVO', 'TSERVICO_EVENTO_NOVO');

var
  Tabelas: array of TPalavra;
  Velho, Novo: Boolean;

  procedure ListaTabelas;
  var
    S: String;
    I, P, L: Integer;
  begin
    SetLength(Tabelas, 0);
    I := 1;
    L := Length(ASQL);
    Velho := False;
    Novo  := False;
    while (I < L) do
    begin
      while (I < L) and not (ASQL[I] in _LETRAS) do
        Inc(I);
      S := '';
      P := I;
      while (I < L) and (ASQL[I] in _LETRAS) do
      begin
        S := S + ASQL[I];
        Inc(I);
      end;
      if AnsiIndexText(S, _TABELAS) >= 0 then
      begin
        SetLength(Tabelas, High(Tabelas) +2);
        Tabelas[High(Tabelas)].Nome := S;
        Tabelas[High(Tabelas)].Posicao := P;
        if AnsiIndexText(S, _TABELAS_ANTIGO) >= 0 then
          Velho := True
        else if AnsiIndexText(S, _TABELAS_NOVO) >= 0 then
          Novo := True;
      end;
    end;
  end;

  procedure Ajusta(ATabelasOrigem, ATabelasDestino: array of String);
  var
    T: Integer;
  begin
    for T := High(Tabelas) downto 0 do
      if AnsiIndexText(Tabelas[T].Nome, ATabelasOrigem) >= 0 then
        ASQL := StuffString(ASQL, Tabelas[T].Posicao, Length(Tabelas[T].Nome), ATabelasDestino[AnsiIndexText(Tabelas[T].Nome, ATabelasOrigem)])
  end;
begin
  if not AnsiContainsText(ASQL, 'TSERVICO') then
    Result := ASQL
  else
  begin
    ListaTabelas;
    if Velho xor Novo then
    begin
      if AServicoNovo and Velho and not Novo then
        Ajusta(_TABELAS_ANTIGO, _TABELAS_NOVO)
      else if (not AServicoNovo) and Novo and not Velho then
        Ajusta(_TABELAS_NOVO, _TABELAS_ANTIGO);
    end;
    Result := ASQL;
  end;
  {if AServicoNovo then
    begin
      Result := StringReplace(ASQL, 'TSERVICO ', 'TSERVICO_NOVO ', [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, 'TSERVICO.', 'TSERVICO_NOVO.', [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, 'TSERVICO'#13, 'TSERVICO_NOVO#13', [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, 'TSERVICO_EVENTO ', 'TSERVICO_EVENTO_NOVO ', [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, 'TSERVICO_EVENTO.', 'TSERVICO_EVENTO_NOVO.', [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, 'TSERVICO_EVENTO'#13, 'TSERVICO_EVENTO_NOVO'#13, [rfReplaceAll, rfIgnoreCase]);
    end
    else
    begin
      Result := StringReplace(ASQL, 'TSERVICO_NOVO ', 'TSERVICO ', [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, 'TSERVICO_NOVO.', 'TSERVICO.', [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, 'TSERVICO_NOVO'#13, 'TSERVICO'#13, [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, 'TSERVICO_EVENTO_NOVO ', 'TSERVICO_EVENTO ', [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, 'TSERVICO_EVENTO_NOVO.', 'TSERVICO_EVENTO.', [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, 'TSERVICO_EVENTO_NOVO'#13, 'TSERVICO_EVENTO'#13, [rfReplaceAll, rfIgnoreCase]);
    end;}
end;

procedure AjustaQueryServicoNovo(AServicoNovo: Boolean; AQuery: TQuery);
var
  Active: Boolean;
begin
  Active := AQuery.Active;
  if AnsiContainsText(AQuery.SQL.Text, 'TSERVICO') then
  begin
    if Active then
      AQuery.Close;
    AQuery.SQL.Text := AjustaSQLServicoNovo(AServicoNovo, AQuery.SQL.Text);

    if (AQuery.FindField('CD_SERVICO') <> nil) then
    begin
      AQuery.FieldByName('CD_SERVICO').Destroy;
      AQuery.FieldDefs.Update;
      AQuery.FieldDefs.Find('CD_SERVICO').CreateField(AQuery);
    end;
  end;

  AQuery.Active := Active;
end;

procedure AjustaControlesServicoNovo(AServicoNovo: Boolean; AParent: TComponent);
var
  I: Integer;
  B: Boolean;
begin
  if ClasseExiste(AParent.ClassType) then
    Exit;
  I := 0;
  B := False;

  while I < AParent.ComponentCount do
  begin
    if (AParent.Components[I] is DBTables.TQuery) then
    begin
      B := True;
      AjustaQueryServicoNovo(AServicoNovo, TQuery(AParent.Components[I]));
    end;
    Inc(I);
  end;
  if not B then
    AdicionaClasse(AParent.ClassType);
end;

function ClasseExiste(AClasse: TClass): Boolean;
begin
  Result := ClasseExiste(AClasse.ClassName);
end;

function ClasseExiste(AClasse: String): Boolean;
begin
  Result := AnsiIndexText(AClasse, FClassesSemQuery) >= 0;
end;

procedure AdicionaClasse(AClasse: TClass);
begin
  AdicionaClasse(AClasse.ClassName);
end;

procedure AdicionaClasse(AClasse: String);
begin
  if not ClasseExiste(AClasse) then
  begin
    SetLength(FClassesSemQuery, High(FClassesSemQuery) +2);
    FClassesSemQuery[High(FClassesSemQuery)] := AClasse;
  end;
end;


{ TDataModule }

constructor TDataModule.Create(AOwner: TComponent);
begin
  inherited;
  AjustaControlesServicoNovo(GetServicoNovo, Self);
end;

{ TForm }

constructor TForm.Create(AOwner: TComponent);
begin
  inherited;
  AjustaControlesServicoNovo(GetServicoNovo, Self);
end;

{ TQuery }

procedure TQuery.ExecSQL;
begin
  AjustaQueryServicoNovo(GetServicoNovo, Self);
  inherited ExecSQL;
end;

procedure TQuery.Open;
begin
  if ((Owner = nil) or (Owner is TApplication) or SameText(Owner.ClassName, 'TfrmConsOnLineEx')) then
    AjustaQueryServicoNovo(GetServicoNovo, Self);
  inherited;
end;

initialization
  SetLength(FClassesSemQuery, 7);
  FClassesSemQuery[0] := 'Tfrm_DI';
  FClassesSemQuery[1] := 'Tfrm_exp_capa';
  FClassesSemQuery[2] := 'Tfrm_DI_capa';
  FClassesSemQuery[3] := 'Tfrm_manut_proc';
  FClassesSemQuery[4] := 'Tfrm_exp_capa';
  FClassesSemQuery[5] := 'Tfrm_dde';
  FClassesSemQuery[6] := 'Tfrm_follow_obs';

end.

unit uProcessoFatoresEvento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, DBTables, cxGridLevel, cxGrid,
  cxMemo, ClipBrd, Menus;

type
  TfrmProcessoFatoresEvento = class(TForm)
    ds_Processo_Fatores_Evento: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    qry_Processo_Fatores_Evento: TQuery;
    qry_Processo_Fatores_EventoCD_FATOR: TIntegerField;
    qry_Processo_Fatores_EventoNM_FATOR: TStringField;
    qry_Processo_Fatores_EventoCD_EVENTO: TStringField;
    qry_Processo_Fatores_EventoNM_EVENTO: TStringField;
    qry_Processo_Fatores_EventoCD_SERVICO: TIntegerField;
    qry_Processo_Fatores_EventoNM_SERVICO: TStringField;
    qry_Processo_Fatores_EventoNM_OPERACAO: TStringField;
    qry_Processo_Fatores_EventoDT_OPERACAO: TDateTimeField;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1CD_FATOR: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NM_FATOR: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1CD_EVENTO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NM_EVENTO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1CD_SERVICO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NM_SERVICO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NM_OPERACAO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DT_OPERACAO: TcxGridDBBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxsHeader: TcxStyle;
    qry_Processo_Fatores_EventoCD_EVENTO_ANTERIOR: TStringField;
    qry_Processo_Fatores_EventoNM_DESCRICAO: TStringField;
    cxGrid1DBBandedTableView1CD_EVENTO_ANTERIOR: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NM_DESCRICAO: TcxGridDBBandedColumn;
    qry_Processo_Fatores_EventoNM_EVENTO_ANTERIOR: TStringField;
    cxGrid1DBBandedTableView1NM_EVENTO_ANTERIOR: TcxGridDBBandedColumn;
    MainMenu1: TMainMenu;
    Editar1: TMenuItem;
    Copiar1: TMenuItem;
    CopiarLinha1: TMenuItem;
    procedure Copiar1Click(Sender: TObject);
    procedure CopiarLinha1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function ShowModal(AProcesso: String): Integer;
  end;

var
  frmProcessoFatoresEvento: TfrmProcessoFatoresEvento;

implementation

{$R *.dfm}

{ TForm3 }

function TfrmProcessoFatoresEvento.ShowModal(AProcesso: String): Integer;
begin
  if qry_Processo_Fatores_Evento.Active then
    qry_Processo_Fatores_Evento.Close;
  qry_Processo_Fatores_Evento.ParamByName('NR_PROCESSO').AsString := AProcesso;
  qry_Processo_Fatores_Evento.Open;
  Result := inherited ShowModal;
end;

procedure TfrmProcessoFatoresEvento.Copiar1Click(Sender: TObject);
var
  C: Integer;
begin
  for C := 0 to cxGrid1DBBandedTableView1.ColumnCount -1 do
    if cxGrid1DBBandedTableView1.Columns[C].Focused then
    begin
      Clipboard.AsText := cxGrid1DBBandedTableView1.Columns[C].DataBinding.Field.AsString;
      Break;
    end;
end;

procedure TfrmProcessoFatoresEvento.CopiarLinha1Click(Sender: TObject);
var
  C: Integer;
  D, T, G, G1, G2, G3, S1, S2: String; // Dados e Título e Grupo
begin
  D := '';
  T := '';
  G := '';
  G1 := '';
  for C := 0 to cxGrid1DBBandedTableView1.ColumnCount -1 do
  begin
    S1 := cxGrid1DBBandedTableView1.Columns[C].DataBinding.Field.AsString;
    S2 := cxGrid1DBBandedTableView1.Columns[C].Caption;
    G2 := cxGrid1DBBandedTableView1.Columns[C].Position.Band.Caption;
    while Length(S1) < Length(S2) do
      S1 := S1 + ' ';
    while Length(S1) > Length(S2) do
      S2 := S2 + ' ';

    if G2 <> G1 then
    begin
      G1 := G2;
      G3 := G1;
      while Length(G3) < Length(S2) do
        G3 := G3 + ' ';
    end
    else
    begin
      G3 := '';
      while Length(G3) < Length(S2) do
        G3 := G3 + ' ';
    end;

    while Length(S1) < Length(G3) do
      S1 := S1 + ' ';
    while Length(S2) < Length(G3) do
      S2 := S2 + ' ';

    G := G + #9 + G3;
    T := T + #9 + S2;
    D := D + #9 + S1;
  end;
  Delete(D, 1, 1);
  Delete(T, 1, 1);
  Delete(G, 1, 1);
  Clipboard.AsText := G + #13#10 + T + #13#10 + D;
end;

end.

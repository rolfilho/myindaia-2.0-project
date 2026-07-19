unit UConsultaMercanteDivergencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, KrQuery, Buttons;

type
  TfrmConsultaMercanteDivergencias = class(TForm)
    pnlFundo: TPanel;
    sgridDivergencias: TStringGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    mmNCMs: TMemo;
    btn_sair: TSpeedButton;
    pnlNenhumaDivergencia: TPanel;
    lblNenhumaDivergencia: TLabel;
    lblProcessoNaoConsultado: TLabel;
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
    procedure AutoSizeCol(Grid: TStringGrid; Column: integer);
    procedure AutoSizeGrid(StringGrid:TStringGrid);
  public
    { Public declarations }
    procedure VerificarDivergencias(NrProcesso : String);
  end;

var
  frmConsultaMercanteDivergencias: TfrmConsultaMercanteDivergencias;

implementation

{$R *.dfm}

procedure TfrmConsultaMercanteDivergencias.VerificarDivergencias(NrProcesso : String);
var  qryBroker: TLocalSQLQuery;
TemDivergenciaConhecimento :boolean;
begin
  mmNCMs.Text                   := '';
  sgridDivergencias.Cells[1,0]  := 'Broker';
  sgridDivergencias.Cells[2,0]  := 'Mercante';
  mmNCMs.Text                   := 'Nenhuma divergência de NCM encontrada';
  pnlNenhumaDivergencia.visible := true;

  qryBroker := TLocalSQLQuery.Create(nil);
  qryBroker.close;
  qryBroker.Sql.text := ' SELECT DESCRICAO_CAMPO                                              ' + sLineBreak +
                        '       ,CAMPO_BROKER                                                 ' + sLineBreak +
                        '       ,CAMPO_MERCANTE                                               ' + sLineBreak +
                        '       ,NCM                                                          ' + sLineBreak +
                        '       ,EXISTE_RESULTADO_MERCANTE                                    ' + sLineBreak +
                        '   FROM FN_CONSULTA_MERCANTE_DIVERGENCIAS('+quotedstr(NrProcesso)+') ';
  qryBroker.Open;
  if not qryBroker.eof then
  begin      
     if qryBroker.FieldByName('EXISTE_RESULTADO_MERCANTE').AsString = '0' then //ainda não foi consultado no site
     begin
      lblProcessoNaoConsultado.Visible := true;
     end;

    {* conhecimento *}
    TemDivergenciaConhecimento := false;
    qryBroker.first;
    while not qryBroker.eof do
    begin
      if qryBroker.FieldByName('NCM').AsString = '' then // os dados vem juntos. se o campo NCM estiver preenchido, não vai entrar nessa tabela
      begin
        TemDivergenciaConhecimento    := true;
        pnlNenhumaDivergencia.visible := false;
        sgridDivergencias.Cells[0,sgridDivergencias.RowCount-1] := Trim(qryBroker.FieldByName('DESCRICAO_CAMPO').AsString);
        sgridDivergencias.Cells[1,sgridDivergencias.RowCount-1] := Trim(qryBroker.FieldByName('CAMPO_BROKER').AsString);
        sgridDivergencias.Cells[2,sgridDivergencias.RowCount-1] := Trim(qryBroker.FieldByName('CAMPO_MERCANTE').AsString);
        sgridDivergencias.RowCount := sgridDivergencias.RowCount+1;
      end;
      qryBroker.next;
    end;
    if TemDivergenciaConhecimento then //se entrou nas divergencias de conhecimento, exclui a ultima linha.
      sgridDivergencias.RowCount := sgridDivergencias.RowCount-1;

    {* itens *}
    qryBroker.first;
    while not qryBroker.eof do
    begin
      if qryBroker.FieldByName('NCM').AsString <> '' then
      begin
        //só deve vir uma linha de ncm
        mmNCMs.Text :=  qryBroker.FieldByName('DESCRICAO_CAMPO').AsString +' '+ qryBroker.FieldByName('NCM').AsString;
      end;
      qryBroker.next;
    end;

    AutoSizeGrid(sgridDivergencias);
  end;

  qryBroker.close;
  qryBroker.free;

  self.ShowModal;
end;


procedure TfrmConsultaMercanteDivergencias.AutoSizeGrid(StringGrid:TStringGrid);
var
  i: integer;
begin
  for i := 0 to StringGrid.ColCount - 1 do
    AutoSizeCol(StringGrid, 0);
end;

procedure TfrmConsultaMercanteDivergencias.AutoSizeCol(Grid: TStringGrid; Column: integer);
var
  i, W, WMax: integer;
begin
  WMax := 0;
  for i := 0 to (Grid.RowCount - 1) do
  begin
    W := Grid.Canvas.TextWidth(Grid.Cells[Column, i]);
    if W > WMax then 
      WMax := W;
  end;
  Grid.ColWidths[Column]  := WMax + 20;
end;

procedure TfrmConsultaMercanteDivergencias.btn_sairClick(Sender: TObject);
begin
  Close;
end;

end.

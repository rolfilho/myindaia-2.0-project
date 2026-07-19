unit uConsultaExigenciaInmetro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, FMTBcd, DB, PGGP017,
  SqlExpr, Provider, DBClient, DBCtrls, StdCtrls, Buttons;

type
  TfrmConsultaExigenciaInmetro = class(TForm)
    pnlPrincipal: TPanel;
    pnlGrid: TPanel;
    grdConsulta: TDBGrid;
    pnlFiltro: TPanel;
    dtsExigenciaInmetro: TDataSource;
    qryExigenciaInmetro: TSQLQuery;
    cdsExigenciaInmetro: TClientDataSet;
    dspExigenciaInmetro: TDataSetProvider;
    cmbDataLote: TComboBox;
    qryDataLote: TSQLQuery;
    dspDataLote: TDataSetProvider;
    cdsDataLote: TClientDataSet;
    dtsDataLote: TDataSource;
    qryDataLoteDATA_HORA_LOTE: TSQLTimeStampField;
    cdsDataLoteDATA_HORA_LOTE: TSQLTimeStampField;
    lblDataLote: TLabel;
    lblNumeroResultConsulta: TLabel;
    cmbEmpresa: TComboBox;
    Label1: TLabel;
    qryEmpresa: TSQLQuery;
    dspEmpresa: TDataSetProvider;
    cdsEmpresa: TClientDataSet;
    dtsEmpresa: TDataSource;
    strngfldEmpresaNM_EMPRESA: TStringField;
    cdsEmpresaNM_EMPRESA: TStringField;
    btn_sair: TSpeedButton;
    qryExigenciaInmetroExpira: TSQLTimeStampField;
    qryExigenciaInmetroEmpresa: TStringField;
    qryExigenciaInmetroProcesso: TStringField;
    qryExigenciaInmetroLi: TStringField;
    qryExigenciaInmetroDescrio: TStringField;
    qryExigenciaInmetroNmeroExigncia: TIntegerField;
    cdsExigenciaInmetroExpira: TSQLTimeStampField;
    cdsExigenciaInmetroEmpresa: TStringField;
    cdsExigenciaInmetroProcesso: TStringField;
    cdsExigenciaInmetroLi: TStringField;
    cdsExigenciaInmetroDescrio: TStringField;
    cdsExigenciaInmetroNmeroExigncia: TIntegerField;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure cmbDataLoteChange(Sender: TObject);
    procedure cmbEmpresaChange(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaGrid;
    procedure CarregaCmbEmpresa;
    procedure CarregaCmbDataLote;
    function GetSqlConsulta :String;
  public
    { Public declarations }
  end;

var
  frmConsultaExigenciaInmetro: TfrmConsultaExigenciaInmetro;

implementation

uses uConsulta;

{$R *.dfm}

procedure TfrmConsultaExigenciaInmetro.FormCreate(Sender: TObject);
begin
  CarregaCmbDataLote;
  if cmbDataLote.Text <> '' then
  begin
    CarregaCmbEmpresa;
//    AtualizaGrid;
  end;
end;

procedure TfrmConsultaExigenciaInmetro.cmbDataLoteChange(Sender: TObject);
begin
  CarregaCmbEmpresa;
//  AtualizaGrid;
end;

function TfrmConsultaExigenciaInmetro.GetSqlConsulta :String;
begin
 result := ' SELECT DATA_HORA_EXPIRA Expira,                                          ' + #13#10 +
           '        T2.NM_EMPRESA    Empresa,                                         ' + #13#10 +
           '        T4.NR_PROCESSO   Processo,                                        ' + #13#10 +
           '        T3.NR_LI         Li,                                              ' + #13#10 +
           '        DESCRICAO        Descricao,                                       ' + #13#10 +
           '        NUMERO           Exigencia                                        ' + #13#10 +
           '  FROM TEXIGENCIAS_INMETRO T1  (NOLOCK)                                   ' + #13#10 +
           ' INNER JOIN TEMPRESA_NAC   T2  (NOLOCK)ON T2.CD_EMPRESA  = T1.CD_EMPRESA  ' + #13#10 +
           '  LEFT JOIN TPROCESSO_LI   T3  (NOLOCK)ON T3.NR_INMETRO  = T1.NUMERO      ' + #13#10 +
           '  LEFT JOIN TPROCESSO      T4  (NOLOCK)ON T4.NR_PROCESSO = T3.NR_PROCESSO ' + #13#10 +
           '                                      AND T4.CD_CLIENTE  = T1.CD_EMPRESA  ' + #13#10 +
           ' WHERE  CONVERT(VARCHAR(19),DATA_HORA_LOTE, 120) =  :DATALOTE             ';
end;
{
procedure TfrmConsultaExigenciaInmetro.AtualizaGrid;
begin
  if cdsExigenciaInmetro.Active then
    cdsExigenciaInmetro.Close;

  qryExigenciaInmetro.SQL.Clear;
  qryExigenciaInmetro.SQL.text := GetSqlConsulta;
  if cmbEmpresa.Text <> 'TODAS' then
  begin
    qryExigenciaInmetro.SQL.Add(' AND T2.NM_EMPRESA = ' + QuotedStr(cmbEmpresa.Text));
  end;
  qryExigenciaInmetro.SQL.Add(' ORDER BY T2.NM_EMPRESA, DATA_HORA_EXPIRA');
  qryExigenciaInmetro.ParamByName('DATALOTE').AsString := FormatDateTime('yyyy-mm-dd hh:mm:ss', (StrToDateTime(cmbDataLote.Text)));
  cdsExigenciaInmetro.Open;

  lblNumeroResultConsulta.Caption := 'Total de registros da consulta : ' + IntToStr(cdsExigenciaInmetro.recordCount);
end;
}

procedure TfrmConsultaExigenciaInmetro.AtualizaGrid;
var
  Form: TfmConsulta;
begin
  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := 'Exigência Inmetro';

    Form.Titulocoluna.Add('Expira=Expira');
    Form.Titulocoluna.Add('Empresa=Empresa');
    Form.Titulocoluna.Add('Processo=Processo');
    Form.Titulocoluna.Add('Descricao=Descrição');
    Form.Titulocoluna.Add('Exigencia=Número Exigência');

    Form.qryMain.SQL.Text := GetSqlConsulta;
    if cmbEmpresa.Text <> 'TODAS' then
    begin
      Form.qryMain.SQL.Add(' AND T2.NM_EMPRESA = ' + QuotedStr(cmbEmpresa.Text));
    end;

    Form.qryMain.SQL.Add(' ORDER BY T2.NM_EMPRESA, DATA_HORA_EXPIRA');
    Form.qryMain.ParamByName('DATALOTE').AsString := FormatDateTime('yyyy-mm-dd hh:mm:ss', (StrToDateTime(cmbDataLote.Text)));

    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TfrmConsultaExigenciaInmetro.CarregaCmbEmpresa;
var
  vEmpresa: String;
begin
  try
    if cdsEmpresa.Active then
    cdsEmpresa.Close;

    qryEmpresa.ParamByName('DATALOTE').AsString := FormatDateTime('yyyy-mm-dd hh:mm:ss', (StrToDateTime(cmbDataLote.Text)));
    cdsEmpresa.Open;

    if cdsEmpresa.RecordCount > 0 then
    begin
      cmbEmpresa.Items.Clear;
      cmbEmpresa.Items.Add('TODAS');
      cdsEmpresa.First;
      while not cdsEmpresa.Eof do
      begin
        vEmpresa := cdsEmpresa.FieldByName('NM_EMPRESA').AsString;
        cmbEmpresa.Items.Add(vEmpresa);
        cdsEmpresa.Next;
      end;
      cmbEmpresa.ItemIndex := 0;
    end;
  finally
    cdsEmpresa.Close;
  end
end;

procedure TfrmConsultaExigenciaInmetro.cmbEmpresaChange(Sender: TObject);
begin
//  AtualizaGrid;
end;

procedure TfrmConsultaExigenciaInmetro.CarregaCmbDataLote;
var
  vTxtDataLote: String;
begin
  try
    cdsDataLote.Open;
    if cdsDataLote.RecordCount > 0 then
    begin
      cdsDataLote.First;
      while not cdsDataLote.Eof do
      begin
        vTxtDataLote := FormatDateTime('dd/mm/yyyy hh:mm:ss', cdsDataLote.FieldByName('DATA_HORA_LOTE').Value);
        cmbDataLote.Items.Add(vTxtDataLote);
        cdsDataLote.Next;
      end;
      cmbDataLote.ItemIndex := 0;
    end;
  finally
    cdsDataLote.Close;
  end
end;

procedure TfrmConsultaExigenciaInmetro.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaExigenciaInmetro.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaExigenciaInmetro.BitBtn1Click(Sender: TObject);
begin
  AtualizaGrid;
end;

end.

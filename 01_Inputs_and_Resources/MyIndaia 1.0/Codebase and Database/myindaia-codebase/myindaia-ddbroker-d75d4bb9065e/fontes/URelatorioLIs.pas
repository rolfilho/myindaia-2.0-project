unit URelatorioLIs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DBCtrls, ExtCtrls, Mask, DBXpress, FMTBcd,
  DB, DBClient, Provider, SqlExpr;

type
  TfrmRelatorioLIs = class(TForm)
    SQLConnection: TSQLConnection;
    qryUnidadeNeg: TSQLQuery;
    qryUnidadeNegCD_UNID_NEG: TStringField;
    qryUnidadeNegNM_UNID_NEG: TStringField;
    dspUnidadeNeg: TDataSetProvider;
    cdsUnidadeNeg: TClientDataSet;
    cdsUnidadeNegCD_UNID_NEG: TStringField;
    cdsUnidadeNegNM_UNID_NEG: TStringField;
    dsUnidadeNeg: TDataSource;
    dsProduto: TDataSource;
    cdsProduto: TClientDataSet;
    cdsProdutoCD_PRODUTO: TStringField;
    cdsProdutoNM_PRODUTO: TStringField;
    dspProduto: TDataSetProvider;
    qryProduto: TSQLQuery;
    qryProdutoCD_PRODUTO: TStringField;
    qryProdutoNM_PRODUTO: TStringField;
    pnlFundo: TPanel;
    Label1: TLabel;
    lblNrProcesso: TLabel;
    lblUnidadeNeg: TLabel;
    Label2: TLabel;
    edtGrupo: TEdit;
    cbGrupo: TDBLookupComboBox;
    Panel1: TPanel;
    btn_sair: TSpeedButton;
    edtNrProcesso: TEdit;
    edUnidade: TEdit;
    cbUnidade: TDBLookupComboBox;
    edtProduto: TEdit;
    cbProduto: TDBLookupComboBox;
    Panel2: TPanel;
    btnGerar: TBitBtn;
    qryGrupo: TSQLQuery;
    strngfldqry1CD_GRUPO: TStringField;
    strngfldqry1NM_GRUPO: TStringField;
    dspGrupo: TDataSetProvider;
    cdsGrupo: TClientDataSet;
    strngfldGrupoCD_GRUPO: TStringField;
    strngfldGrupoNM_GRUPO: TStringField;
    dsGrupo: TDataSource;
    mskDataregistroIni: TMaskEdit;
    Label4: TLabel;
    mskDataregistroFin: TMaskEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbUnidadeExit(Sender: TObject);
    procedure cbUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbUnidadeCloseUp(Sender: TObject);
    procedure edUnidadeExit(Sender: TObject);
    procedure edUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGrupoExit(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbGrupoExit(Sender: TObject);
    procedure cbGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbGrupoCloseUp(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure cbProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbProdutoExit(Sender: TObject);
    procedure cbProdutoCloseUp(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure edtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  procedure BuscarCodigoUnidadeNeg;
  procedure BuscarCodigoProduto;
  procedure BuscarCodigoGrupo;
    
  procedure PreencherCodigoUnidadeNeg;
  procedure PreencherCodigoProduto;
  procedure PreencherCodigoGrupo;
  function GetSqlConsulta :String;

  public
    { Public declarations }
  end;

var
  frmRelatorioLIs: TfrmRelatorioLIs;

implementation

uses uConsulta;

{$R *.dfm}

procedure TfrmRelatorioLIs.FormCreate(Sender: TObject);
begin
  qryGrupo.close;
  cdsGrupo.close;
  qryGrupo.Open;
  cdsGrupo.Open;

  qryUnidadeNeg.close;
  cdsUnidadeNeg.close;
  qryUnidadeNeg.open;
  cdsUnidadeNeg.open;

  qryProduto.close;
  cdsProduto.close;
  qryProduto.open;
  cdsProduto.open;
end;

procedure TfrmRelatorioLIs.cbUnidadeExit(Sender: TObject);
begin
  PreencherCodigoUnidadeNeg;
end;

procedure TfrmRelatorioLIs.cbUnidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbUnidade.KeyValue := '';
end;

procedure TfrmRelatorioLIs.cbUnidadeCloseUp(Sender: TObject);
begin
  PreencherCodigoUnidadeNeg;
end;

procedure TfrmRelatorioLIs.edUnidadeExit(Sender: TObject);
begin
  BuscarCodigoUnidadeNeg;
end;

procedure TfrmRelatorioLIs.edUnidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoUnidadeNeg;
  end;
end;

procedure TfrmRelatorioLIs.BuscarCodigoUnidadeNeg;
begin
  if cdsUnidadeNeg.Locate('CD_UNID_NEG', edUnidade.Text, []) then
     cbUnidade.KeyValue := cdsUnidadeNeg.fieldbyName('CD_UNID_NEG').AsString
  else
    cbUnidade.KeyValue := '';
end;

procedure TfrmRelatorioLIs.BuscarCodigoProduto;
begin
  if cdsProduto.Locate('CD_PRODUTO', edtProduto.Text, []) then
     cbProduto.KeyValue := cdsProduto.fieldbyName('CD_PRODUTO').AsString
  else
    cbProduto.KeyValue := '';
end;


procedure TfrmRelatorioLIs.PreencherCodigoUnidadeNeg;
begin
  if not ((cbUnidade.KeyValue = '') or (cbUnidade.KeyValue = null)) then
    edUnidade.Text := cdsUnidadeNeg.fieldbyName('CD_UNID_NEG').AsString
  else
    edUnidade.Text := '';
end;


procedure TfrmRelatorioLIs.PreencherCodigoProduto;
begin
 if not ((cbProduto.KeyValue = '') or (cbProduto.KeyValue = null)) then
    edtProduto.Text := cdsProduto.fieldbyName('CD_PRODUTO').AsString
  else
    edtProduto.Text := '';
end;
procedure TfrmRelatorioLIs.edtGrupoExit(Sender: TObject);
begin
  BuscarCodigoGrupo;
end;

procedure TfrmRelatorioLIs.edtGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoGrupo;
  end;
end;

procedure TfrmRelatorioLIs.cbGrupoExit(Sender: TObject);
begin
  PreencherCodigoGrupo;
end;

procedure TfrmRelatorioLIs.cbGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbGrupo.KeyValue := '';

    edtGrupo.text := cbGrupo.KeyValue;
end;

procedure TfrmRelatorioLIs.cbGrupoCloseUp(Sender: TObject);
begin
  PreencherCodigoGrupo;
end;

procedure TfrmRelatorioLIs.PreencherCodigoGrupo;
begin
  if not ((cbGrupo.KeyValue = '') or (cbGrupo.KeyValue = null)) then
    edtGrupo.Text := cdsGrupo.fieldbyName('CD_GRUPO').AsString
  else
    edtGrupo.Text := '';
end;

procedure TfrmRelatorioLIs.BuscarCodigoGrupo;
begin
  if cdsGrupo.Locate('CD_GRUPO', edtGrupo.Text, [loCaseInsensitive]) then
    cbGrupo.KeyValue := cdsGrupo.fieldbyName('CD_GRUPO').AsString
  else
    cbGrupo.KeyValue := '';
end;

procedure TfrmRelatorioLIs.btnGerarClick(Sender: TObject);
var
  Form: TfmConsulta;
begin
  Form := TfmConsulta.Create(nil);
  try
    //se tiver periodo, valida se a data está correta
    if (mskDataregistroIni.text <> '  /  /       :  ') and (mskDataregistroFin.text <> '  /  /       :  ') then
    begin
      if StrtoDateTime(mskDataregistroIni.text) >  StrtoDateTime(mskDataregistroFin.text) then
      begin
        MessageDlg('Data inicial de Solicitação maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;
    end
    else //se não tiver periodo ou processo
    if (mskDataregistroIni.text = '  /  /       :  ') and (mskDataregistroFin.text = '  /  /       :  ') and
       ((trim(edUnidade.text) = '') or (trim(edtProduto.text) = '') or (trim(edtNrProcesso.text) = '')) then
    begin
      MessageDlg('Necessario informar o período ou/e o processo.', mtWarning, [mbOK], 0);
      Exit;
    end
    else
    begin
      ShowMessage('Período obrigatório!');
      Exit;
    end;

    Form.qryMain.SQL.Text := GetSqlConsulta;

    Form.TituloRelatorio := 'Relatório de LIs';

    Form.Titulocoluna.Add('NR_PROCESSO=Processo');
    Form.Titulocoluna.Add('CD_GRUPO=Cod Grupo');
    Form.Titulocoluna.Add('NM_GRUPO=Grupo');
    Form.Titulocoluna.Add('NR_LI=Nr Li');
    Form.Titulocoluna.Add('DT_STATUS=Data Status');
    Form.Titulocoluna.Add('TX_STATUS=Status');
    Form.Titulocoluna.Add('TX_STATUS_ANTERIOR=Status Anterior');
    Form.Titulocoluna.Add('CD_ORGAO_ANUENTE=Orgão Anuente');
    Form.Titulocoluna.Add('DT_CONSULTA=Data Consulta');
    Form.Titulocoluna.Add('DS_TRATAMENTO_ADM=Tratamento Adm.');
    Form.Titulocoluna.Add('DS_ANDAMENTO_ANUENCIA=Andamento Anuencia');
    Form.Titulocoluna.Add('DT_VALIDADE_DESPACHO=Data Validade Despacho');
    Form.Titulocoluna.Add('DT_VALIDADE_EMBARQUE=Data Validade Embarque');

    Form.FormatacaoEspecial.Add('DT_STATUS=dd/mm/yyyy');
    Form.FormatacaoEspecial.Add('DT_CONSULTA=dd/mm/yyyy');
    Form.FormatacaoEspecial.Add('DT_VALIDADE_DESPACHO=dd/mm/yyyy');
    Form.FormatacaoEspecial.Add('DT_VALIDADE_EMBARQUE=dd/mm/yyyy');

    Form.Executa;
  finally
    Form.Free;
  end;
end;

function TfrmRelatorioLIs.GetSqlConsulta : String;
var
  DataInicial, DataFinal :string;
begin
    DataInicial := FormatDateTime('yyyy/mm/dd hh:mm', StrtoDateTime(mskDataregistroIni.text));
    DataFinal   := FormatDateTime('yyyy/mm/dd hh:mm', StrtoDateTime(mskDataregistroFin.text));

    result := '  SELECT NR_PROCESSO                 ' + sLineBreak +
              '        ,CD_GRUPO                    ' + sLineBreak +
              '        ,NM_GRUPO                    ' + sLineBreak +
              '        ,NR_LI                       ' + sLineBreak +
              '        ,DT_STATUS                   ' + sLineBreak +
              '        ,TX_STATUS                   ' + sLineBreak +
              '        ,TX_STATUS_ANTERIOR          ' + sLineBreak +
              '        ,CD_ORGAO_ANUENTE            ' + sLineBreak +
              '        ,DT_CONSULTA                 ' + sLineBreak +
              '        ,DS_TRATAMENTO_ADM           ' + sLineBreak +
              '        ,DS_ANDAMENTO_ANUENCIA       ' + sLineBreak +
              '        ,DT_VALIDADE_DESPACHO        ' + sLineBreak +
              '        ,DT_VALIDADE_EMBARQUE        ' + sLineBreak +
              '    FROM DBO.FN_STATUS_LIS_PROCESSO('+quotedStr(DataInicial)+
                                                 ','+QuotedStr(DataFinal)+
                                                 ','+QuotedStr(edUnidade.text + edtProduto.text + edtNrProcesso.text)+
                                                 ','+QuotedStr(edtGrupo.text)+
                                                 ', 1)                               ' +sLineBreak+
              'ORDER BY NR_PROCESSO                                                  ' +sLineBreak;
end;

procedure TfrmRelatorioLIs.cbProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbProduto.KeyValue := '';
end;

procedure TfrmRelatorioLIs.cbProdutoExit(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TfrmRelatorioLIs.cbProdutoCloseUp(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TfrmRelatorioLIs.edtProdutoExit(Sender: TObject);
begin
  BuscarCodigoProduto;
end;

procedure TfrmRelatorioLIs.edtProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoProduto;
  end;
end;

end.

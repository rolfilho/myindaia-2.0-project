unit uFrmIntegracaoExcel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ComObj, udmMain,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, uManipulacaoArquivos, utils;

type
  TfrmIntegracaoExcel = class(TForm)
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    btnSelecionarArquivo: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    qryDrawbackIsencaoItens: TFDQuery;
    qryDrawbackIsencaoFila: TFDQuery;
    qryDrawbackIsencaoItensView: TFDQuery;
    ProgressBar1: TProgressBar;
    lblProgresso: TLabel;
    dsDrawbackIsencaoItensView: TDataSource;
    btnDeleteNaoEnviados: TBitBtn;
    qryDrawbackIsencaoItensViewNR_DUE: TStringField;
    qryDrawbackIsencaoItensViewNR_ITEM: TStringField;
    qryDrawbackIsencaoItensViewNR_ATO_CONCESSORIO: TStringField;
    qryDrawbackIsencaoItensViewQTD_ESTATISTICA: TStringField;
    qryDrawbackIsencaoItensViewTOTAL_MLE: TStringField;
    qryDrawbackIsencaoItensViewNCM: TStringField;
    qryDrawbackIsencaoItensViewCNPJ: TStringField;
    qryDrawbackIsencaoItensViewENQUADRAMENTO_1: TStringField;
    qryDrawbackIsencaoItensViewENQUADRAMENTO_2: TStringField;
    qryDrawbackIsencaoItensViewDATA_INCLUSAO: TStringField;
    lblLinhas: TLabel;
    procedure btnSelecionarArquivoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnDeleteNaoEnviadosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure LerExcel;
    procedure AbrirView;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIntegracaoExcel: TfrmIntegracaoExcel;

implementation

{$R *.dfm}

procedure TfrmIntegracaoExcel.btnDeleteNaoEnviadosClick(Sender: TObject);
var
  vQtdExclusão :integer;
  vDataInclusao: String;
begin

  vQtdExclusão := qryDrawbackIsencaoItensView.RecordCount;
  vDataInclusao := qryDrawbackIsencaoItensViewDATA_INCLUSAO.AsString;

  if vQtdExclusão = 0 then
  begin
    ShowMessage('Não existe itens para serem excluídos.');
    Exit;
  end;

  dmMain.FDConnection1.StartTransaction;
  try
    qryDrawbackIsencaoFila.Close;
    qryDrawbackIsencaoFila.SQL.Text := 'DELETE DRAWBACK_ISENCAO_ITENS ' +
                                       'FROM DRAWBACK_ISENCAO_ITENS ITENS ' +
                                       'LEFT JOIN DRAWBACK_ISENCAO_FILA FILA ON FILA.NR_DUE = ITENS.NR_DUE ' +
                                       'WHERE ' +
                                       'ITENS.DATA_INCLUSAO = :DATAINCLUSAO ' +
                                       'AND ISNULL(FILA.IN_XML_ENVIADO, 0) = 0 ';
    qryDrawbackIsencaoFila.ParamByName('DATAINCLUSAO').AsString := vDataInclusao;
    qryDrawbackIsencaoFila.ExecSQL;

    qryDrawbackIsencaoFila.Close;
    qryDrawbackIsencaoFila.SQL.Text := 'DELETE ' +
                                       'FROM DRAWBACK_ISENCAO_FILA '+
                                       'WHERE ' +
                                       'DATA_INCLUSAO = :DATAINCLUSAO ' +
                                       'AND ISNULL(IN_XML_ENVIADO, 0) = 0';
    qryDrawbackIsencaoFila.ParamByName('DATAINCLUSAO').AsString := vDataInclusao;
    qryDrawbackIsencaoFila.ExecSQL;

    dmMain.FDConnection1.Commit;
  except
    dmMain.FDConnection1.Rollback;
    showMessage('erro ao excluir as Dues da fila.')
  end;

  AbrirView;

  if qryDrawbackIsencaoItensView.RecordCount = 0 then
    showMessage(IntToStr(vQtdExclusão) + ' itens, importados do excel, excluídos com sucesso do banco de dados.')

end;

procedure TfrmIntegracaoExcel.btnSelecionarArquivoClick(Sender: TObject);
begin
  if qryDrawbackIsencaoItensView.RecordCount = 0 then
    LerExcel
  else
    ShowMessage('Já foi feita a integração da planilha de excel. Aguardando transmissão para o Siscomex.');
end;

procedure TfrmIntegracaoExcel.FormCreate(Sender: TObject);
begin
  dmMain := TdmMain.Create(self);
end;

procedure TfrmIntegracaoExcel.FormDestroy(Sender: TObject);
begin
  if assigned(dmMain) then
    FreeAndNil(dmMain);
end;

procedure TfrmIntegracaoExcel.FormShow(Sender: TObject);
begin
  AbrirView;
end;

procedure TfrmIntegracaoExcel.AbrirView;
begin
  qryDrawbackIsencaoItensView.close;
  qryDrawbackIsencaoItensView.Open;
  lblLinhas.Caption := 'Linhas: ' + IntToStr(qryDrawbackIsencaoItensView.recordcount);
end;

procedure TfrmIntegracaoExcel.LerExcel;
var
  vPlanilhaExcel, vSheet: OLEVariant;
  i, c: Integer;
  vContemRegistroNaLinha: Boolean;
  vExisteRegistroNfRef: Boolean;
  vDataInclusao: string;
  vCaminhoPlanilha: string;
  vCaminhoPlanilhaDestino: string;
begin

  vPlanilhaExcel := CreateOleObject('Excel.Application');
  try
    vPlanilhaExcel.Visible := False;
    if not OpenDialog1.Execute(Handle) then
      Exit;

    vPlanilhaExcel.WorkBooks.Add(OpenDialog1.FileName);
    vSheet := vPlanilhaExcel.Workbooks[1].WorkSheets[1];
    vCaminhoPlanilha := OpenDialog1.FileName;

    i := 2;

    qryDrawbackIsencaoItens.Close;
    qryDrawbackIsencaoItens.SQL.Text := 'INSERT INTO DRAWBACK_ISENCAO_ITENS ' +
                                        'VALUES(:NR_DUE, :NR_ITEM, :NR_ATO_CONCESSORIO, :QTD_ESTATISTICA, :TOTAL_MLE, :NCM, ' +
                                        ':CNPJ, :ENQUADRAMENTO_1, :ENQUADRAMENTO_2, :DATA_INCLUSAO)';
    ProgressBar1.Max := vSheet.Cells.SpecialCells(11).Row - 1;

    vDataInclusao := FormatDateTime('dd-mm-yyyy hhnnss', Now);

    while vSheet.Cells[i, 1].Value <> '' do
    begin
      qryDrawbackIsencaoItens.ParamByName('NR_DUE').AsString := Trim(vSheet.Cells[i,1].value);
      qryDrawbackIsencaoItens.ParamByName('NR_ITEM').AsString := Trim(vSheet.Cells[i,2].value);
      qryDrawbackIsencaoItens.ParamByName('NR_ATO_CONCESSORIO').AsString := Trim(vSheet.Cells[i,3].value);
      qryDrawbackIsencaoItens.ParamByName('QTD_ESTATISTICA').AsString := StringReplace(Trim(vSheet.Cells[i,4].value), ',', '.', [rfReplaceAll]);
      qryDrawbackIsencaoItens.ParamByName('TOTAL_MLE').AsString := StringReplace(Trim(vSheet.Cells[i,5].value), ',', '.', [rfReplaceAll]);
      qryDrawbackIsencaoItens.ParamByName('NCM').AsString := Trim(vSheet.Cells[i,6].value);
      qryDrawbackIsencaoItens.ParamByName('CNPJ').AsString := Trim(vSheet.Cells[i,7].value);
      qryDrawbackIsencaoItens.ParamByName('ENQUADRAMENTO_1').AsString := Trim(vSheet.Cells[i,8].value);
      qryDrawbackIsencaoItens.ParamByName('ENQUADRAMENTO_2').AsString := Trim(vSheet.Cells[i,9].value);
      qryDrawbackIsencaoItens.ParamByName('DATA_INCLUSAO').AsString := vDataInclusao;

      qryDrawbackIsencaoItens.ExecSQL;

      qryDrawbackIsencaoItensView.Refresh;

      if (i-1) <= ProgressBar1.Max then
      begin
        ProgressBar1.Position := i-1;
        lblProgresso.Caption := IntToStr(i-1) + ' de ' + IntToStr(ProgressBar1.Max);
      end;

      Inc(i, 1);

    end;

    lblProgresso.Caption := lblProgresso.Caption + ' | Finalizando gravação no banco de dados.';

    dmMain.FDConnection1.StartTransaction;
    try
      qryDrawbackIsencaoFila.Close;
      qryDrawbackIsencaoFila.SQL.Text := 'INSERT INTO DRAWBACK_ISENCAO_FILA ' +
                                         'SELECT DISTINCT NR_DUE, NULL, NULL, 1, NULL, NULL, DATA_INCLUSAO FROM DRAWBACK_ISENCAO_ITENS ' +
                                         'WHERE DATA_INCLUSAO = :DATA_INCLUSAO';
      qryDrawbackIsencaoFila.ParamByName('DATA_INCLUSAO').AsString := vDataInclusao;

      qryDrawbackIsencaoFila.ExecSQL;

      dmMain.FDConnection1.Commit;
    except
      dmMain.FDConnection1.Rollback;
      showMessage('erro ao inserir as Dues na fila.')
    end;

    AbrirView;

    lblProgresso.Caption := 'Integração da planilha concluída com sucesso.';

    vCaminhoPlanilhaDestino := GetPath + 'Arquivos\Planilhas\' + vDataInclusao + '\';
    FileExistsForce(vCaminhoPlanilhaDestino);
    CopyFile(vCaminhoPlanilha, vCaminhoPlanilhaDestino + ExtractFileName(vCaminhoPlanilha));

  finally
    vPlanilhaExcel.WorkBooks.Close;
  end;
end;

end.

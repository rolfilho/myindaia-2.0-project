unit uIntegracaoNotaNestle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DateUtils,
  StdCtrls, Mask, Buttons, ExtCtrls, Funcoes, DB, DBTables, Excel2000, OleServer, ComObj;

type

  TIntegracaoNota = class
  private
    numeroProcesso: String;
    nomePlanilha: String;
    LinhaItem: Integer;
    Excel: OleVariant;
    xlWorkB1: OleVariant;
    oSheet: OleVariant;
    listaDadosComplementares: TStringList;    
    queryContainersCount: TQuery;
    queryDraftDanfeCabecalho: TQuery;
    queryDraftDanfeItens: TQuery;
    queryDraftDanfeRodape: TQuery;
    queryDraftDanfeItensNotaComplementar: TQuery;
    procedure gerarDraft;
    procedure criaPlanilha;
    procedure preencheExcelCabecalho;
    procedure preencheExcelItens;
    procedure preencheExcelRodape;
    procedure preencheExcelItensNotaComplementar;
    function getSqlDraftDanfeCabecalho: String;
    function getSqlDraftDanfeItens: String;
    function getSqlDraftDanfeRodape: String;
    function getSqlDraftDanfeItensNotaComplementar: String;
    procedure quebraTexto(textoCompleto: String; maxCaracteres: integer);
  public
    constructor Create;
    destructor Destroy; override;
  end;

  Tfrm_integracao_nota_nestle = class(TForm)
    lbl_cd_unid_neg: TLabel;
    edt_nm_unid_neg: TEdit;
    Panel1: TPanel;
    btn_fechar: TButton;
    mskedt_cd_unid_neg: TMaskEdit;
    btn_cd_unid_neg: TSpeedButton;
    lblProcesso: TLabel;
    shpConteudo: TShape;
    shpTitulo: TShape;
    lblTitulo: TLabel;
    edtNrProcesso: TEdit;
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure mskedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mskedt_cd_unid_negExit(Sender: TObject);
    procedure btn_geraplanilhaClick(Sender: TObject);
  private
    IntegracaoNota: TIntegracaoNota;
  public

    { Public declarations }
  end;


var
  frm_integracao_nota_nestle: Tfrm_integracao_nota_nestle;

implementation

uses PGGP001, PGSM018, PGSM010, PGSM024, PGFT024, GSMLIB, PGGP017, PGSM105, ConsOnLineEx, KrDialog;

{$R *.DFM}

procedure Tfrm_integracao_nota_nestle.btn_cd_unid_negClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    mskedt_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',nil);
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', mskedt_cd_unid_neg.Text,'AP_UNID_NEG');
  End;
end;

procedure Tfrm_integracao_nota_nestle.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_integracao_nota_nestle.mskedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = mskedt_cd_unid_neg then btn_cd_unid_negClick(nil);
  end;
end;

procedure Tfrm_integracao_nota_nestle.mskedt_cd_unid_negExit(Sender: TObject);
begin
  if (edt_nm_unid_neg.Text = '') and (mskedt_cd_unid_neg.Text <> '') then
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', mskedt_cd_unid_neg.Text,'AP_UNID_NEG')
  else
    Exit;
end;

procedure Tfrm_integracao_nota_nestle.btn_geraplanilhaClick(
  Sender: TObject);
begin
  if (edt_nm_unid_neg.Text = '') or (edtNrProcesso.text = '') then
    reject('Favor preencher a Unidade de Negociação e o Número do Processo.');

  IntegracaoNota := TIntegracaoNota.Create;
  try
//    IntegracaoNota.numeroProcesso := '0101IM-000159-21';
    IntegracaoNota.numeroProcesso := mskedt_cd_unid_neg.Text + '01' + edtNrProcesso.Text;
    IntegracaoNota.gerarDraft;
  finally
    IntegracaoNota.Free;
  end;
end;




{ TIntegracaoNota }

constructor TIntegracaoNota.Create;
begin

  queryContainersCount := TQuery.Create(nil);
  queryContainersCount.DatabaseName := 'DBBROKER';

  queryDraftDanfeCabecalho := TQuery.Create(nil);
  queryDraftDanfeCabecalho.DatabaseName := 'DBBROKER';

  queryDraftDanfeItens := TQuery.Create(nil);
  queryDraftDanfeItens.DatabaseName := 'DBBROKER';


  queryDraftDanfeRodape := TQuery.Create(nil);
  queryDraftDanfeRodape.DatabaseName := 'DBBROKER';

  queryDraftDanfeItensNotaComplementar := TQuery.Create(nil);
  queryDraftDanfeItensNotaComplementar.DatabaseName := 'DBBROKER';

end;

destructor TIntegracaoNota.Destroy;
begin
  queryContainersCount.Free;
  queryDraftDanfeCabecalho.Free;
  queryDraftDanfeItens.Free;
  queryDraftDanfeRodape.Free;
  queryDraftDanfeItensNotaComplementar.Free;
  inherited;
end;

procedure TIntegracaoNota.gerarDraft;
var
  iCntr: Integer;
  pastaPlanilha: String;

  procedure apagaArquivosExistentes(arquivo: String);
  begin
    if FileExists(arquivo) then
      DeleteFile(arquivo);
  end;
begin
  LinhaItem := 9;
  pastaPlanilha := 'C:\DDBROKER\NOTA FISCAL\';

  queryContainersCount.SQL.Text := 'SELECT CASE WHEN TP.CD_SERVICO IN (3,5) THEN ''X'' ELSE NR_CNTR END AS NR_CNTR FROM BROKER.DBO.TPROCESSO TP LEFT JOIN TPROCESSO_CNTR TPC ON TP.NR_PROCESSO = TPC.NR_PROCESSO WHERE TP.NR_PROCESSO = :NR_PROCESSO GROUP BY NR_CNTR, TP.CD_SERVICO ';
  queryContainersCount.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryContainersCount.Open;

  queryDraftDanfeCabecalho.SQL.Text := getSqlDraftDanfeCabecalho;
  queryDraftDanfeCabecalho.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeCabecalho.Open;

  queryDraftDanfeItens.SQL.Text := getSqlDraftDanfeItens;
  queryDraftDanfeItens.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeItens.Open;

  queryDraftDanfeRodape.SQL.Text := getSqlDraftDanfeRodape;
  queryDraftDanfeRodape.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeRodape.Open;

  queryDraftDanfeItensNotaComplementar.SQL.Text := getSqlDraftDanfeItensNotaComplementar;

  if queryContainersCount.RecordCount = 0 then
    Reject('Não foi encontrado dados para o processo.');

  try
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    nomePlanilha := numeroProcesso + '_MN' + '.XLS';
    criaPlanilha;
    try
      preencheExcelCabecalho;
      queryDraftDanfeItens.First;
      while not queryDraftDanfeItens.Eof do
      begin
        preencheExcelItens;
        queryDraftDanfeItens.Next;
      end;
      preencheExcelRodape;

      apagaArquivosExistentes(pastaPlanilha + nomePlanilha);
      Excel.ActiveWorkBook.SaveAs(pastaPlanilha + nomePlanilha);
    finally
      Excel.Quit;
    end;

    iCntr := 0;
    queryContainersCount.First;
    while not queryContainersCount.Eof do
    begin
      LinhaItem := 9;

      queryDraftDanfeItensNotaComplementar.Close;
      queryDraftDanfeItensNotaComplementar.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
      queryDraftDanfeItensNotaComplementar.paramByName('NR_CNTR').AsString := queryContainersCount.fieldByName('NR_CNTR').AsString ;
      queryDraftDanfeItensNotaComplementar.Open;

      Inc(iCntr);
      nomePlanilha := numeroProcesso + '_MI' + IntToStr(iCntr) + '.XLS';
      criaPlanilha;
      try
        preencheExcelCabecalho;
        queryDraftDanfeItensNotaComplementar.first;
        while not queryDraftDanfeItensNotaComplementar.Eof do
        begin
          preencheExcelItensNotaComplementar;
          queryDraftDanfeItensNotaComplementar.Next;
        end;
        preencheExcelRodape;

        apagaArquivosExistentes(pastaPlanilha + nomePlanilha);
        Excel.ActiveWorkBook.SaveAs(pastaPlanilha + nomePlanilha);
      finally
        Excel.Quit;
      end;
      queryContainersCount.Next
    end;

    Screen.Cursor := crDefault;
    Information( IntToStr(iCntr + 1) + ' planilhas geradas com sucesso na pasta: ' + pastaPlanilha );
    Application.ProcessMessages;

  finally
    queryContainersCount.Close;
    queryDraftDanfeCabecalho.Close;
    queryDraftDanfeItens.Close;
    queryDraftDanfeRodape.Close;
    queryDraftDanfeItensNotaComplementar.Close;
  end;
end;

procedure TIntegracaoNota.criaPlanilha;
begin
    try
      Excel := CreateOLEObject('Excel.Application');
      xlWorkB1 := Excel.Workbooks.Open('C:\ddbroker\Modelo DRAFT DANFE Nestle.xls');
      oSheet := Excel.WorkBooks[1].Worksheets[1];
//      Excel.Visible := True;
    except
      BoxMensagem('Erro na criação da Planilha. Verifique se a Planilha não está em uso ou se o Excel está aberto.',2) ;
      Exit;
    end;
end;

procedure TIntegracaoNota.preencheExcelCabecalho;
begin

  oSheet.Cells[01,02].value := queryDraftDanfeCabecalho.FieldByName('Cliente').AsString;
  oSheet.Cells[02,02].value := queryDraftDanfeCabecalho.FieldByName('Processo').AsString;
  oSheet.Cells[03,02].value := queryDraftDanfeCabecalho.FieldByName('NumeroDI').AsString;
  oSheet.Cells[03,08].value := queryDraftDanfeCabecalho.FieldByName('TIPO').AsString;
  oSheet.Cells[01,06].value := queryDraftDanfeCabecalho.FieldByName('CNPJ').AsString;
  oSheet.Cells[02,06].value := queryDraftDanfeCabecalho.FieldByName('RefCliente').AsString;
  oSheet.Cells[03,06].value := queryDraftDanfeCabecalho.FieldByName('DataDI').AsString;
  oSheet.Cells[05,02].value := queryDraftDanfeCabecalho.FieldByName('Remetente').AsString;
  oSheet.Cells[05,06].value := queryDraftDanfeCabecalho.FieldByName('Endereco').AsString;
  oSheet.Cells[05,08].value := queryDraftDanfeCabecalho.FieldByName('Cidade').AsString;
  oSheet.Cells[05,11].value := queryDraftDanfeCabecalho.FieldByName('Pais').AsString;
  oSheet.Cells[06,02].value := queryDraftDanfeCabecalho.FieldByName('CodVendor').AsString;
  oSheet.Cells[40,11].value := queryDraftDanfeCabecalho.FieldByName('Incoterm').AsString;
  oSheet.Cells[40,12].value := queryDraftDanfeCabecalho.FieldByName('DataDI').AsString;
  oSheet.Cells[40,13].value := queryDraftDanfeCabecalho.FieldByName('Despacho').AsString;
  oSheet.Cells[40,14].value := queryDraftDanfeCabecalho.FieldByName('DespachoUF').AsString;
  oSheet.Cells[40,15].value := queryDraftDanfeCabecalho.FieldByName('DataDesembaraco').AsString;
end;

procedure TIntegracaoNota.preencheExcelItens;
var
  ColunaItem: Integer;

  function AddColuna: Integer;
  begin
    ColunaItem := ColunaItem + 1;
    result := ColunaItem;
  end;
begin
  ColunaItem := 1;
  oSheet.Cells[LinhaItem,ColunaItem].value := queryDraftDanfeItens.FieldByName('A').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('B').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('C').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('D').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('E').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('F').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('G').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('H').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('I').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('J').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('K').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('L').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('M').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('N').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('O').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('P').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('Q').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('R').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('S').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('T').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('U').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('V').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('W').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('X').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('Y').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('Z').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AA').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AB').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AC').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AD').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AE').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AF').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AG').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AH').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AI').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AJ').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AK').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AL').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AM').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AN').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AO').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AP').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AQ').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AR').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AS').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AT').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AU').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AV').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AW').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AX').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AY').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('AZ').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BA').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BB').AsString;
 //  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BC').AsString;
  AddColuna;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BD').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BE').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BF').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BG').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BH').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BI').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BJ').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BK').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BL').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BM').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BN').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BO').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BP').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BQ').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BR').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BS').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BT').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BU').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BV').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BW').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BX').AsString;

  Inc(LinhaItem);

end;

procedure TIntegracaoNota.preencheExcelItensNotaComplementar;
var
  ColunaItem: Integer;

  function AddColuna: Integer;
  begin
    ColunaItem := ColunaItem + 1;
    result := ColunaItem;
  end;
begin
  ColunaItem := 1;
  oSheet.Cells[LinhaItem,ColunaItem].value := queryDraftDanfeItensNotaComplementar.FieldByName('A').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('B').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('C').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('D').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('E').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('F').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('G').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('H').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('I').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('J').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('K').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('L').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('M').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('N').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('O').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('P').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('Q').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('R').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('S').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('T').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('U').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('V').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('W').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('X').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('Y').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('Z').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AA').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AB').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AC').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AD').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AE').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AF').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AG').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AH').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AI').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AJ').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AK').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AL').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AM').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AN').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AO').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AP').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AQ').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AR').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AS').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AT').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AU').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AV').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AW').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AX').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AY').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('AZ').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BA').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BB').AsString;
//   oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BC').AsString;
  AddColuna;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BD').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BE').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BF').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BG').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BH').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BI').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BJ').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BK').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BL').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BM').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BN').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BO').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BP').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BQ').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BR').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BS').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BT').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BU').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BV').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BW').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItensNotaComplementar.FieldByName('BX').AsString;

  Inc(LinhaItem);

end;

procedure TIntegracaoNota.preencheExcelRodape;
var
  i, linhaDadosCompl: integer;
begin
  oSheet.Cells[45,01].value := queryDraftDanfeRodape.FieldByName('Transportadora').AsString;
  oSheet.Cells[44,03].value := queryDraftDanfeRodape.FieldByName('CodViaTransp').AsString;
  oSheet.Cells[47,01].value := queryDraftDanfeRodape.FieldByName('Endereco').AsString;
  oSheet.Cells[45,07].value := queryDraftDanfeRodape.FieldByName('UF').AsString;
  oSheet.Cells[45,08].value := queryDraftDanfeRodape.FieldByName('CNPJ').AsString;
  oSheet.Cells[47,05].value := queryDraftDanfeRodape.FieldByName('Municipio').AsString;
  oSheet.Cells[47,08].value := queryDraftDanfeRodape.FieldByName('InscricaoEstadual').AsString;
  oSheet.Cells[48,07].value := queryDraftDanfeRodape.FieldByName('PesoLiquido').AsString;
  oSheet.Cells[50,08].value := queryDraftDanfeRodape.FieldByName('PesoBruto').AsString;
  oSheet.Cells[49,01].value := queryDraftDanfeRodape.FieldByName('QuantidadeEspecie').AsString;
  oSheet.Cells[49,05].value := queryDraftDanfeRodape.FieldByName('NR_CNTR_TOTAL').AsString;
  oSheet.Cells[42,06].value := queryDraftDanfeRodape.FieldByName('AFRMM_TOT_ROD').AsString;
  oSheet.Cells[51,01].value := queryDraftDanfeRodape.FieldByName('DadosComplementares').AsString;

end;

procedure TIntegracaoNota.quebraTexto(textoCompleto: String; maxCaracteres: integer);
var
  i, posEspaco: Integer;
  textoParcial, textoRestante: string;
begin

  textoRestante := textoCompleto;

  while Length(textoRestante) > maxCaracteres do
  begin
    posEspaco := 0;
    textoParcial := Copy(textoRestante, 0, maxCaracteres);

    if textoRestante[maxCaracteres + 1] = ' ' then
    begin
      listaDadosComplementares.add(textoParcial);
      textoRestante := Copy(textoRestante, maxCaracteres + 2, Length(textoRestante));
    end
    else
    begin
      for i := 0 to Length(textoParcial) do
      begin
        if textoParcial[i] = ' ' then
          posEspaco := i;
      end;
      if posEspaco > 0 then
      begin
        listaDadosComplementares.add(Copy(textoParcial, 0, posEspaco - 1));
        textoRestante := Copy(textoRestante, posEspaco + 1, Length(textoRestante));
      end
      else
      begin
        listaDadosComplementares.add(textoParcial);
        textoRestante := Copy(textoRestante, maxCaracteres + 1, Length(textoRestante));
      end;
    end;
  end;
  listaDadosComplementares.add(textoRestante);
end;

function TIntegracaoNota.getSqlDraftDanfeCabecalho: String;
begin
  Result :=
    ' SELECT ' + #13#10 +
    ' EN.NM_EMPRESA AS [Cliente], ' + #13#10 +
    ' TP.NR_PROCESSO AS [Processo], ' + #13#10 +
    ' TP.CD_INCOTERM AS [Incoterm], ' + #13#10 +
    ' CASE WHEN TP.NR_DI LIKE ''%BR%'' THEN TP.NR_DI ELSE SUBSTRING(TP.NR_DI,1,2) + ''/'' + SUBSTRING(TP.NR_DI,3,7) + ''-'' + SUBSTRING(TP.NR_DI,10,1) END AS [NumeroDI], ' + #13#10 +
    ' CASE WHEN TP.NR_DI LIKE ''%BR%'' THEN ''2'' ELSE ''0'' END  AS [TIPO], ' + #13#10 +
    ' EN.CGC_EMPRESA AS [CNPJ], ' + #13#10 +
    ' CAST(STUFF(( SELECT DISTINCT '', '' + LEFT (LTRIM(RTRIM(RC.CD_REFERENCIA)),10) ' + #13#10 +
    '                      FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) ' + #13#10 +
    '                     WHERE RC.NR_PROCESSO      = TP.NR_PROCESSO ' + #13#10 +
    '                       AND RC.TP_REFERENCIA    = ''01'' ' + #13#10 +
    '             FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [RefCliente], ' + #13#10 +
    ' CONVERT(VARCHAR(10),EV021.DT_REALIZACAO,104) AS [DataDI], ' + #13#10 +
    ' CONVERT(VARCHAR(10),EV088.DT_REALIZACAO,104) AS [DataDesembaraco], ' + #13#10 +
    ' EE.NM_EMPRESA AS [Remetente], ' + #13#10 +
    ' EE.END_EMPRESA + '', '' + EE.END_NUMERO AS [Endereco], ' + #13#10 +
    ' EE.END_CIDADE AS [Cidade], ' + #13#10 +
    ' PB.NM_PAIS AS [Pais], ' + #13#10 +
    ' UR.DESCRICAO AS [Despacho], ' + #13#10 +
    ' UR.END_UF + ''1'' AS [DespachoUF], ' + #13#10 +
    ' EE.NR_CLIENTE AS [CodVendor] ' + #13#10 +
    ' ' + #13#10 +
    ' FROM BROKER.DBO.TPROCESSO TP (NOLOCK) ' + #13#10 +
    ' ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = TP.CD_CLIENTE ' + #13#10 +
    ' LEFT JOIN BROKER.dbo.TFOLLOWUP EV021 (NOLOCK) ON EV021.NR_PROCESSO = TP.NR_PROCESSO AND EV021.CD_EVENTO=''021'' ' + #13#10 +
    ' LEFT JOIN BROKER.dbo.TFOLLOWUP EV088 (NOLOCK) ON EV088.NR_PROCESSO = TP.NR_PROCESSO AND EV088.CD_EVENTO=''088'' ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TEXPORTADOR_DI EDI (NOLOCK) ON EDI.NR_PROCESSO = TP.NR_PROCESSO ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TEMPRESA_EST EE (NOLOCK) ON EE.CD_EMPRESA = EDI.CD_EXPORTADOR ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TPAIS_BROKER PB (NOLOCK) ON PB.CD_PAIS = EE.CD_PAIS ' + #13#10 +
    ' INNER JOIN BROKER.DBO.TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = TP.NR_PROCESSO ' + #13#10 +
    ' LEFT JOIN BROKER.DBO.TURF UR (NOLOCK) ON UR.CODIGO = DI.CD_URF_DESPACHO ' + #13#10 +
    ' ' + #13#10 +
    ' WHERE TP.NR_PROCESSO = :NR_PROCESSO';

end;

function TIntegracaoNota.getSqlDraftDanfeItens: String;
begin
  Result :=
    ' SELECT ' + #13#10 +
    ' DM.NR_ADICAO AS [A],--Adição ' + #13#10 +
    ' DM.NR_ITEM AS [B], --Item ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DM.QT_MERC_UN_COMERC),''.'','','') AS [C], --Quantidade ' + #13#10 +
    ' UM.NM_SIGLA AS [D],--Unidade medida ' + #13#10 +
    ' RIGHT(''000000000000000'' + DM.CD_MERCADORIA,18) AS [E], --Código ' + #13#10 +
    ' MERC.AP_MERCADORIA AS [F],--Descricao da Mercadoria ' + #13#10 +
    ' (SELECT TPI.NR_PLANTA FROM BROKER.DBO.TPO_ITEM TPI WHERE TPI.NR_PROCESSO=DM.NR_PROC_PO AND TPI.NR_ITEM_CLIENTE=DM.NR_ITEM_PO AND TPI.NR_PARCIAL=''1'') AS [G],--Planta ' + #13#10 +
    ' CASE WHEN TP.NR_DI LIKE ''%BR%'' THEN TP.NR_DI ELSE SUBSTRING(TP.NR_DI,1,2) + ''/'' + SUBSTRING(TP.NR_DI,3,7) + ''-'' + SUBSTRING(TP.NR_DI,10,1) END AS [H],--Numero DI ' + #13#10 +
    ' SUBSTRING(DM.CD_NCM_SH,1,4)+''.''+SUBSTRING(DM.CD_NCM_SH,5,2)+''.''+SUBSTRING(DM.CD_NCM_SH,7,2) AS [I],--NCM ' + #13#10 +
    ' AI.CD_CFOP + (CASE WHEN (SELECT COUNT(NR_CNTR) FROM BROKER.DBO.TPROCESSO_CNTR WHERE NR_PROCESSO=TP.NR_PROCESSO)>1 THEN ''AA'' ELSE ''AB'' END) AS [J],--CFOP ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,6),DM.VL_BASE_CALC_II / DM.QT_MERC_UN_COMERC),''.'','','') AS [K],--Valor Unitário (Tot. Produtos/Quantidade) ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,4),DM.VL_BASE_CALC_II),''.'','','') AS [L],--Valor Total dos Produtos (Valor CIF Item) ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DM.PL_MERCADORIA),''.'','','') AS [M],--Peso Liq. ' + #13#10 +

    ' 	 CASE        ' + #13#10 +
	  ' WHEN AI.CD_TRIBUTACAO_ICMS = ''1'' THEN ''608'' ' + #13#10 +
	  ' WHEN AI.CD_TRIBUTACAO_ICMS = ''4'' THEN ''610'' ' + #13#10 +
	  ' WHEN AI.CD_TRIBUTACAO_ICMS = ''3'' THEN ''612'' ' + #13#10 +
	  ' WHEN AI.CD_TRIBUTACAO_ICMS = ''5'' THEN ''614'' ' + #13#10 +
	  ' WHEN AI.CD_TRIBUTACAO_ICMS = ''7'' THEN ''615'' ' + #13#10 +
	  ' WHEN AI.CD_TRIBUTACAO_ICMS = ''8'' THEN ''618'' ' + #13#10 +
    ' ' + #13#10 +
    ' END AS [N],--ICMS law ' + #13#10 +
    ' ' + #13#10 +

    ' CASE        ' + #13#10 +
    ' WHEN TIPI.CD_TIPO_BENEF_IPI = ''4'' AND TIPI.PC_ALIQ_NORM_ADVAL = 0 THEN ''IP1''           ' + #13#10 +
    ' WHEN TIPI.CD_TIPO_BENEF_IPI = ''4'' THEN ''IP0''       ' + #13#10 +
    ' WHEN TIPI.CD_TIPO_BENEF_IPI = ''3'' THEN ''Z47''       ' + #13#10 +
    ' WHEN TIPI.CD_TIPO_BENEF_IPI = ''5'' THEN ''Z13''       ' + #13#10 +
    ' ELSE ''Z50''       ' + #13#10 +
    ' ' + #13#10 +
    ' END AS [O],--IPI law ' + #13#10 +

    ' CASE    ' + #13#10 +
  	' WHEN AI.CD_TIPO_BENEF_PIS_COFINS = ''1'' AND AI.ALIQ_COFINS = 0 THEN ''C30'' ' + #13#10 +
  	' WHEN AI.CD_TIPO_BENEF_PIS_COFINS = ''1'' THEN ''C18''                        ' + #13#10 +
  	' WHEN AI.CD_TIPO_BENEF_PIS_COFINS = ''4'' THEN ''C29''                        ' + #13#10 +
    '	 ELSE ''C33'' ' + #13#10 +
    ' END AS [P],--Cofins law ' + #13#10 +


    ' CASE    ' + #13#10 +
  	' WHEN AI.CD_TIPO_BENEF_PIS_COFINS = ''1'' AND AI.ALIQ_PIS = 0 THEN ''P30'' ' + #13#10 +
  	' WHEN AI.CD_TIPO_BENEF_PIS_COFINS = ''1'' THEN ''P18''                        ' + #13#10 +
  	' WHEN AI.CD_TIPO_BENEF_PIS_COFINS = ''4'' THEN ''P29''                        ' + #13#10 +
    '	 ELSE ''P33'' ' + #13#10 +
    ' ' + #13#10 +
    ' END AS [Q],--Pis law ' + #13#10 +

    ' REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_CALC_II),''.'','','') AS [R],--Base II ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),DM.VL_II_ITEM),''.'','','') AS [S],--Valor II ' + #13#10 +
    ' REPLACE( ' + #13#10 +
    ' CONVERT(VARCHAR(MAX), ' + #13#10 +
    ' CONVERT(NUMERIC(15,2), ' + #13#10 +
    ' ( ' + #13#10 +
    ' SELECT ' + #13#10 +
    ' CASE ' + #13#10 +
    ' WHEN T.CD_TIPO_ALIQ_IPT=''1'' THEN T.PC_ALIQ_NORM_ADVAL ELSE T.PC_ALIQ_REDUZIDA END FROM BROKER.DBO.TRIBUTO T (NOLOCK) ' + #13#10 +
    ' WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0001'' ' + #13#10 +
    ' ) ' + #13#10 +
    ' )),''.'','','') + ''%'' AS [T],--% II ' + #13#10 +
    ' 0 AS [U],--Outra Base II ' + #13#10 +
    ' CASE ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3101%'' THEN REPLACE(CONVERT(NUMERIC(15,2),(DM.VL_BASE_CALC_II + DM.VL_II_ITEM)),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3102%'' THEN REPLACE(CONVERT(NUMERIC(15,2),(DM.VL_BASE_CALC_II + DM.VL_II_ITEM)),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3556%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3551%'' THEN ''0,00'' ' + #13#10 +
    ' ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3101%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3102%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3556%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3551%'' THEN ''0,00'' ' + #13#10 +
    ' ' + #13#10 +
    ' END AS [V],--Base IPI ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),DM.VL_IPI_ITEM),''.'','','') AS [W],--Valor IPI ' + #13#10 +
    ' REPLACE(CONVERT(VARCHAR(MAX), ' + #13#10 +
    ' CONVERT(NUMERIC(15,2), ' + #13#10 +
    ' ( ' + #13#10 +
    ' SELECT ' + #13#10 +
    ' CASE ' + #13#10 +
    ' WHEN T.CD_TIPO_ALIQ_IPT=''1'' THEN T.PC_ALIQ_NORM_ADVAL ELSE T.PC_ALIQ_REDUZIDA END FROM BROKER.DBO.TRIBUTO T (NOLOCK) ' + #13#10 +
    ' WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0002'' ' + #13#10 +
    ' ) ' + #13#10 +
    ' )),''.'','','') + ''%'' AS [X],--% IPI ' + #13#10 +
    ' CASE ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3101%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3102%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3556%'' THEN REPLACE(CONVERT(NUMERIC(15,2),(DM.VL_BASE_CALC_II + DM.VL_II_ITEM)),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3551%'' THEN REPLACE(CONVERT(NUMERIC(15,2),(DM.VL_BASE_CALC_II + DM.VL_II_ITEM)),''.'','','') ' + #13#10 +
    ' ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3101%'' THEN REPLACE(CONVERT(NUMERIC(15,2),(DM.VL_BASE_CALC_II + DM.VL_II_ITEM)),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3102%'' THEN REPLACE(CONVERT(NUMERIC(15,2),(DM.VL_BASE_CALC_II + DM.VL_II_ITEM)),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3556%'' THEN REPLACE(CONVERT(NUMERIC(15,2),(DM.VL_BASE_CALC_II + DM.VL_II_ITEM)),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_IPI_ITEM < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3551%'' THEN REPLACE(CONVERT(NUMERIC(15,2),(DM.VL_BASE_CALC_II + DM.VL_II_ITEM)),''.'','','') ' + #13#10 +
    ' ' + #13#10 +
    ' END AS [Y],--Outra Base IPI ' + #13#10 +
    ' ' + #13#10 +
    ' CASE ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3101%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3102%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3556%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3551%'' THEN ''0,00'' ' + #13#10 +
    ' ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_PIS ELSE AI.ALIQ_PIS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3101%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_PIS ELSE AI.ALIQ_PIS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3102%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_PIS ELSE AI.ALIQ_PIS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3556%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_PIS ELSE AI.ALIQ_PIS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3551%'' THEN ''0,00'' ' + #13#10 +
    ' ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'') AND AI.CD_CFOP LIKE ''3101%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'') AND AI.CD_CFOP LIKE ''3102%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'') AND AI.CD_CFOP LIKE ''3556%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'') AND AI.CD_CFOP LIKE ''3551%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR24'') AND AI.CD_CFOP LIKE ''3101%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR24'') AND AI.CD_CFOP LIKE ''3102%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR24'') AND AI.CD_CFOP LIKE ''3556%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR24'') AND AI.CD_CFOP LIKE ''3551%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' ' + #13#10 +
    ' END AS [Z],--Base Pis ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),DM.VL_PIS_ITEM),''.'','','') AS [AA],--Valor PIS ' + #13#10 +
    ' REPLACE(CONVERT(VARCHAR(MAX), ' + #13#10 +
    ' CONVERT(NUMERIC(15,2), ' + #13#10 +
    ' (CASE ' + #13#10 +
    ' WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_PIS ' + #13#10 +
    ' ELSE AI.ALIQ_PIS_REDUZIDA END))),''.'','','') + ''%'' AS [AB],--% PIS ' + #13#10 +
    ' CASE ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3101%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3102%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3556%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3551%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' ' + #13#10 +
    '  THEN AI.ALIQ_PIS ELSE AI.ALIQ_PIS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3101%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' ' + #13#10 +
    '  THEN AI.ALIQ_PIS ELSE AI.ALIQ_PIS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3102%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' ' + #13#10 +
    '  THEN AI.ALIQ_PIS ELSE AI.ALIQ_PIS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3556%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' ' + #13#10 +
    '  THEN AI.ALIQ_PIS ELSE AI.ALIQ_PIS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3551%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'',''BR24'') AND AI.CD_CFOP LIKE ''3101%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'',''BR24'') AND AI.CD_CFOP LIKE ''3102%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'',''BR24'') AND AI.CD_CFOP LIKE ''3556%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_PIS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'',''BR24'') AND AI.CD_CFOP LIKE ''3551%'' THEN ''0,00'' ' + #13#10 +
    ' ' + #13#10 +

    ' ELSE REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','')  ' + #13#10 +

    ' ' + #13#10 +
    ' END AS [AC],--Outra Base Pis ' + #13#10 +
    ' '''' AS [AD],--Flag PIS ' + #13#10 +
    ' CASE ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3101%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3102%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3556%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3551%'' THEN ''0,00'' ' + #13#10 +
    ' ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_COFINS ELSE AI.ALIQ_COFINS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3101%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_COFINS ELSE AI.ALIQ_COFINS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3102%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_COFINS ELSE AI.ALIQ_COFINS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3556%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_COFINS ELSE AI.ALIQ_COFINS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3551%'' THEN ''0,00'' ' + #13#10 +
    ' ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'') AND AI.CD_CFOP LIKE ''3101%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'') AND AI.CD_CFOP LIKE ''3102%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'') AND AI.CD_CFOP LIKE ''3556%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'') AND AI.CD_CFOP LIKE ''3551%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR24'') AND AI.CD_CFOP LIKE ''3101%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR24'') AND AI.CD_CFOP LIKE ''3102%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR24'') AND AI.CD_CFOP LIKE ''3556%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR24'') AND AI.CD_CFOP LIKE ''3551%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' ' + #13#10 +
    ' END AS [AE],--Base Cofins ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),DM.VL_COFINS_ITEM),''.'','','') AS [AF],--Valor COFINS ' + #13#10 +
    ' REPLACE(CONVERT(VARCHAR(MAX), ' + #13#10 +
    ' CONVERT(NUMERIC(15,2), ' + #13#10 +
    ' (CASE ' + #13#10 +
    ' WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_COFINS ' + #13#10 +
    ' ELSE AI.ALIQ_COFINS_REDUZIDA END))),''.'','','') + ''%'' AS [AG],--% COFINS ' + #13#10 +
    ' CASE ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3101%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3102%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3556%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND AI.CD_FUND_LEG_REGIME=''16'' AND AI.CD_CFOP LIKE ''3551%'' THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_PIS ELSE AI.ALIQ_COFINS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3101%'' ' + #13#10 +
    '  THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_PIS ELSE AI.ALIQ_COFINS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3102%'' ' + #13#10 +
    '  THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_PIS ELSE AI.ALIQ_COFINS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3556%'' ' + #13#10 +
    '  THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR24'',''BR30'') AND (CASE WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_PIS ELSE AI.ALIQ_COFINS_REDUZIDA END) = 0 AND AI.CD_CFOP LIKE ''3551%'' ' + #13#10 +
    '  THEN REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') ' + #13#10 +
    ' ' + #13#10 +

    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'') AND AI.CD_CFOP LIKE ''3101%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'') AND AI.CD_CFOP LIKE ''3102%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'') AND AI.CD_CFOP LIKE ''3556%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR10'',''BR23'',''BR30'') AND AI.CD_CFOP LIKE ''3551%'' THEN ''0,00'' ' + #13#10 +
    ' ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR24'') AND AI.CD_CFOP LIKE ''3101%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR24'') AND AI.CD_CFOP LIKE ''3102%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR24'') AND AI.CD_CFOP LIKE ''3556%'' THEN ''0,00'' ' + #13#10 +
    ' WHEN DM.VL_COFINS_ITEM > 0 AND EN.COD_INTERNO IN (''BR24'') AND AI.CD_CFOP LIKE ''3551%'' THEN ''0,00'' ' + #13#10 +

    ' ELSE  REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','')  ' + #13#10 +

    ' ' + #13#10 +
    ' END AS [AH],--Outra Base Cofins ' + #13#10 +
    ' '''' AS [AI],--Flag Cofins ' + #13#10 +
	  ' CASE ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3101%''  ' + #13#10 +
    ' THEN REPLACE(CONVERT(NUMERIC(15,6),CASE WHEN AI.PC_REDUCAO_ICMS > 0 THEN                                                           ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )	- ' + #13#10 +
	  ' ( ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 )) * ( (AI.PC_REDUCAO_ICMS) / 100)  ) ' + #13#10 +
    ' ELSE ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) END),''.'','','') ' + #13#10 +

    ' WHEN AI.VL_ICMS_A_RECOLHER > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3102%''  ' + #13#10 +
    ' THEN REPLACE(CONVERT(NUMERIC(15,6),CASE WHEN AI.PC_REDUCAO_ICMS > 0 THEN                                                           ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )	- ' + #13#10 +
	  ' ( ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 )) * ( (AI.PC_REDUCAO_ICMS) / 100)  ) ' + #13#10 +
    ' ELSE ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) END),''.'','','') ' + #13#10 +

    ' WHEN AI.VL_ICMS_A_RECOLHER > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3556%'' THEN ''0,000000'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3551%'' THEN ''0,000000'' ' + #13#10 +
    ' ' + #13#10 +
  	' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3101%'' THEN ''0,000000'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3102%'' THEN ''0,000000'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3556%'' THEN ''0,000000'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3551%'' THEN ''0,000000'' ' + #13#10 +
	  ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02716'' AND AI.CD_CFOP LIKE ''3101%'' THEN ''0,000000'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02716'' AND AI.CD_CFOP LIKE ''3102%'' THEN ''0,000000'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02716'' AND AI.CD_CFOP LIKE ''3556%'' THEN ''0,000000'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02716'' AND AI.CD_CFOP LIKE ''3551%'' THEN ''0,000000'' ' + #13#10 +
  	' ' + #13#10 +
	  ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02354'' AND AI.CD_CFOP LIKE ''3101%'' THEN ''0,000000'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02354'' AND AI.CD_CFOP LIKE ''3102%'' THEN ''0,000000'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02354'' AND AI.CD_CFOP LIKE ''3556%'' THEN ''0,000000'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02354'' AND AI.CD_CFOP LIKE ''3551%'' THEN ''0,000000'' ' + #13#10 +
  	' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02271'' AND AI.CD_CFOP LIKE ''3101%'' THEN ''0,000000'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02271'' AND AI.CD_CFOP LIKE ''3102%'' THEN ''0,000000'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02271'' AND AI.CD_CFOP LIKE ''3556%'' THEN ''0,000000'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02271'' AND AI.CD_CFOP LIKE ''3551%'' THEN ''0,000000'' ' + #13#10 +
    ' ' + #13#10 +
    ' END AS [AJ],--Base ICMS ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,6),CASE WHEN AI.PC_REDUCAO_ICMS > 0                        ' + #13#10 +
    '  THEN ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) * (AI.PC_REDUCAO_ICMS) / 100 ' + #13#10 +
    '  ELSE 0 END),''.'','','') AS [AK],--Valor Excluido de ICMS (redução)  ' + #13#10 +
    ' REPLACE(CONVERT(VARCHAR(MAX),CONVERT(NUMERIC(15,2),CASE WHEN AI.PC_REDUCAO_ICMS > 0 THEN 100 - AI.PC_REDUCAO_ICMS ELSE AI.PC_REDUCAO_ICMS END)),''.'','','')+''%'' AS [AL],--% Redução ICMS ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),CASE WHEN AI.VL_ICMS_A_RECOLHER_AFRMM = 0 THEN 0 WHEN AI.PC_REDUCAO_ICMS > 0 THEN             ' + #13#10 +
    ' ( ( ( AI.VL_BASE_CALC_ICMS_AFRMM - ( AI.VL_BASE_CALC_ICMS_AFRMM * ( (AI.PC_REDUCAO_ICMS) / 100) ) ) * ( AI.PC_ICMS / 100 ) )  / AI.VL_BASE_CALC_II ) *  DM.VL_BASE_CALC_II  ' + #13#10 +
    ' ELSE (( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) ) * ( AI.PC_ICMS / 100 ) END),''.'','','') AS [AM],--Valor ICMS  ' + #13#10 +
    ' REPLACE(CONVERT(VARCHAR(MAX),CONVERT(NUMERIC(15,2),AI.PC_ICMS)),''.'','','') +''%'' AS [AN],--% ICMS ' + #13#10 +
    ' CASE ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3101%'' THEN ''0,000000'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3102%'' THEN ''0,000000'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3556%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3551%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3101%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3102%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3556%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3551%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
	  ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02716'' AND AI.CD_CFOP LIKE ''3101%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02716'' AND AI.CD_CFOP LIKE ''3102%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02716'' AND AI.CD_CFOP LIKE ''3556%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02716'' AND AI.CD_CFOP LIKE ''3551%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02354'' AND AI.CD_CFOP LIKE ''3101%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02354'' AND AI.CD_CFOP LIKE ''3102%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02354'' AND AI.CD_CFOP LIKE ''3556%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02354'' AND AI.CD_CFOP LIKE ''3551%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
	  ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02271'' AND AI.CD_CFOP LIKE ''3101%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02271'' AND AI.CD_CFOP LIKE ''3102%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02271'' AND AI.CD_CFOP LIKE ''3556%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02271'' AND AI.CD_CFOP LIKE ''3551%'' THEN REPLACE(CONVERT(NUMERIC(15,6), ' + #13#10 +
    ' ( ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') ' + #13#10 +
    ' END AS [AO],--Outra Base ICMS ' + #13#10 +
    ' '''' AS [AP],--Flag de ICMS ' + #13#10 +
    ' 0 AS [AQ],--Base Pis Majorado ' + #13#10 +
    ' 0 AS [AR],--Valor PIS Majorado ' + #13#10 +
    ' 0 AS [AS],--% PIS Majorado ' + #13#10 +
    ' 0 AS [AT],--Outra Base Pis Majorado ' + #13#10 +
    ' ''X'' AS [AU],--Flag PIS Majorado ' + #13#10 +
    ' 0 AS [AV],--Base Cofins Majorado ' + #13#10 +
    ' 0 AS [AW],--Valor COFINS Majorado ' + #13#10 +
    ' 0 AS [AX],--% COFINS Majorado ' + #13#10 +
    ' 0 AS [AY],--Outra Base Cofins Majorado ' + #13#10 +
    ' '''' AS [AZ],--Flag Cofins Majorado ' + #13#10 +
    ' DM.VL_TX_SCX_ITEM AS [BA],--Siscomex ' + #13#10 +
    ' 0 AS [BB],--AFRMM ' + #13#10 +
    ' 0 AS [BC],--Outras Despesas ICMS ' + #13#10 +
    ' CAST(STUFF(( SELECT DISTINCT '', '' + LEFT(LTRIM(RTRIM(RC.CD_REFERENCIA)),10) ' + #13#10 +
    '                      FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) ' + #13#10 +
    '                     WHERE RC.NR_PROCESSO      = TP.NR_PROCESSO ' + #13#10 +
    '                       AND RC.TP_REFERENCIA    = ''01'' ' + #13#10 +
    '             FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [BD],--PEDIDO ' + #13#10 +
    ' CASE ' + #13#10 +
    ' 	WHEN TP.CD_AREA = ''AJ'' THEN ''0001042000'' ' + #13#10 +
    ' 	WHEN TP.CD_AREA = ''Y3'' THEN ''0001044000'' ' + #13#10 +
    ' 	WHEN TP.CD_AREA = ''Y1'' THEN ''0001042100'' ' + #13#10 +
    ' 	WHEN TP.CD_AREA = ''Y0'' THEN ''0001042700'' ' + #13#10 +
    ' 	WHEN TP.CD_AREA = ''Y2'' THEN ''0005014030'' ' + #13#10 +
    ' END AS [BE],--Despesas Aduaneiras ' + #13#10 +
    ' ISNULL(EE.NR_CLIENTE,'''') AS [BF],--Codigo Fabricante ' + #13#10 +
    ' 0 AS [BG],--Seguro ' + #13#10 +
    ' '''' AS [BH],--Frete ' + #13#10 +
    ' CASE WHEN AI.CD_TRIBUTACAO_ICMS = ''7'' THEN ''X'' ELSE '''' END AS [BI], --Diferimento ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DM.VL_BASE_IBS_CBS),''.'','','') AS [BJ], ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DM.VL_CBS),''.'','','') AS [BK],          ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),AI.ALIQ_CBS),''.'','','') AS [BL],        ' + #13#10 +
    ' '''' AS [BM],                                                           ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DM.VL_BASE_IBS_CBS),''.'','','') AS [BN], ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DM.VL_IBS_UF),''.'','','') AS [BO],       ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),AI.ALIQ_IBS_UF),''.'','','') AS [BP],     ' + #13#10 +
    ' '''' AS [BQ],                                                           ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DM.VL_BASE_IBS_CBS),''.'','','') AS [BR], ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DM.VL_IBS_MUN),''.'','','') AS [BS],      ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),AI.ALIQ_IBS_MUN),''.'','','') AS [BT],    ' + #13#10 +
    ' '''' AS [BU],                                                           ' + #13#10 +
    ' '''' AS [BV],                                                           ' + #13#10 +
    ' ''X'' AS [BW],                                                          ' + #13#10 +
    ' 0 AS [BX]                                                               ' + #13#10 +
    ' ' + #13#10 +
    ' ' + #13#10 +
    ' FROM BROKER.dbo.TPROCESSO TP (NOLOCK) ' + #13#10 +
    ' ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = TP.CD_CLIENTE ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TDETALHE_MERCADORIA DM (NOLOCK) ON DM.NR_PROCESSO = TP.NR_PROCESSO ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TUNID_MEDIDA_BROKER UM (NOLOCK) ON UM.CD_UNID_MEDIDA = DM.CD_UN_MED_COMERC ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TADICAO_DE_IMPORTACAO AI (NOLOCK) ON DM.NR_PROCESSO = AI.NR_PROCESSO AND DM.NR_ADICAO = AI.NR_ADICAO ' + #13#10 +
    ' LEFT JOIN BROKER.DBO.TMERCADORIA MERC (NOLOCK) ON MERC.CD_MERCADORIA = DM.CD_MERCADORIA AND MERC.CD_GRUPO = TP.CD_GRUPO ' + #13#10 +
    ' LEFT JOIN BROKER.dbo.TEMPRESA_EST EE (NOLOCK) ON EE.CD_EMPRESA = AI.CD_FABRICANTE ' + #13#10 +
    ' LEFT JOIN BROKER.DBO.TRIBUTO TIPI (NOLOCK) ON TIPI.NR_PROCESSO = TP.NR_PROCESSO AND TIPI.NR_ADICAO = AI.NR_ADICAO AND TIPI.CD_RECEITA_IMPOSTO = ''0002'' ' + #13#10 +
    ' ' + #13#10 +
    ' WHERE DM.NR_PROCESSO = :NR_PROCESSO';
end;

function TIntegracaoNota.getSqlDraftDanfeItensNotaComplementar: String;
begin
  Result :=
    ' SELECT ' + #13#10 +
    ' DM.NR_ADICAO AS [A],--Adição ' + #13#10 +
    ' DM.NR_ITEM AS [B], --Item ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DM.QT_MERC_UN_COMERC),''.'','','') AS [C], --Quantidade ' + #13#10 +
    ' UM.NM_SIGLA AS [D],--Unidade medida ' + #13#10 +
    ' RIGHT(''000000000000000'' + DM.CD_MERCADORIA,18) AS [E], --Código ' + #13#10 +
    ' MERC.AP_MERCADORIA AS [F],--Descricao da Mercadoria ' + #13#10 +
    ' (SELECT TPI.NR_PLANTA FROM BROKER.DBO.TPO_ITEM TPI WHERE TPI.NR_PROCESSO=DM.NR_PROC_PO AND TPI.NR_ITEM_CLIENTE=DM.NR_ITEM_PO AND TPI.NR_PARCIAL=''1'') AS [G],--Planta ' + #13#10 +
    ' CASE WHEN TP.NR_DI LIKE ''%BR%'' THEN TP.NR_DI ELSE SUBSTRING(TP.NR_DI,1,2) + ''/'' + SUBSTRING(TP.NR_DI,3,7) + ''-'' + SUBSTRING(TP.NR_DI,10,1) END AS [H],--Numero DI ' + #13#10 +
    ' SUBSTRING(DM.CD_NCM_SH,1,4)+''.''+SUBSTRING(DM.CD_NCM_SH,5,2)+''.''+SUBSTRING(DM.CD_NCM_SH,7,2) AS [I],--NCM ' + #13#10 +
    ' ''3949AA'' AS [J],--CFOP ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,6),DM.VL_BASE_CALC_II / DM.QT_MERC_UN_COMERC),''.'','','') AS [K],--Valor Unitário (Tot. Produtos/Quantidade) ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,4),DM.VL_BASE_CALC_II),''.'','','') AS [L],--Valor Total dos Produtos (Valor CIF Item) ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DM.PL_MERCADORIA),''.'','','') AS [M],--Peso Liq. ' + #13#10 +

    {    ' CASE ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3101%'' THEN ''IC0'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3102%'' THEN ''IC0'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3556%'' THEN ''IC0'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER > 0 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR23'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3551%'' THEN ''IC0'' ' + #13#10 +
    ' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3101%'' THEN ''IC4'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3102%'' THEN ''IC4'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3556%'' THEN ''IC4'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR10'',''BR19'',''BR24'',''BR30'') AND AI.CD_CFOP LIKE ''3551%'' THEN ''IC4'' ' + #13#10 +
   	' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02716'' AND AI.CD_CFOP LIKE ''3101%'' THEN ''IC4'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02716'' AND AI.CD_CFOP LIKE ''3102%'' THEN ''IC4'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02716'' AND AI.CD_CFOP LIKE ''3556%'' THEN ''IC4'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02716'' AND AI.CD_CFOP LIKE ''3551%'' THEN ''IC4'' ' + #13#10 +
    ' ' + #13#10 +
	  ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02354'' AND AI.CD_CFOP LIKE ''3101%'' THEN ''615'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02354'' AND AI.CD_CFOP LIKE ''3102%'' THEN ''615'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02354'' AND AI.CD_CFOP LIKE ''3556%'' THEN ''IC4'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02354'' AND AI.CD_CFOP LIKE ''3551%'' THEN ''IC4'' ' + #13#10 +
   	' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02271'' AND AI.CD_CFOP LIKE ''3101%'' THEN ''615'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02271'' AND AI.CD_CFOP LIKE ''3102%'' THEN ''615'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02271'' AND AI.CD_CFOP LIKE ''3556%'' THEN ''IC4'' ' + #13#10 +
    ' WHEN AI.VL_ICMS_A_RECOLHER < 0.01 AND EN.COD_INTERNO IN (''BR23'') AND TP.CD_CLIENTE = ''02271'' AND AI.CD_CFOP LIKE ''3551%'' THEN ''IC4'' ' + #13#10 +
    ' ' + #13#10 +
    ' END AS [N],--ICMS law ' + #13#10 +         }

    ' ''618'' AS [N],--ICMS law ' + #13#10 +

    ' ' + #13#10 +
    ' ''Z50'' AS [O],--IPI law ' + #13#10 +
    ' ''C11'' AS [P],--Cofins law ' + #13#10 +
    ' ''P11'' AS [Q],--Pis law ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_CALC_II),''.'','','') AS [R],--Base II ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),DM.VL_II_ITEM),''.'','','') AS [S],--Valor II ' + #13#10 +
    ' REPLACE( ' + #13#10 +
    ' CONVERT(VARCHAR(MAX), ' + #13#10 +
    ' CONVERT(NUMERIC(15,2), ' + #13#10 +
    ' ( ' + #13#10 +
    ' SELECT ' + #13#10 +
    ' CASE ' + #13#10 +
    ' WHEN T.CD_TIPO_ALIQ_IPT=''1'' THEN T.PC_ALIQ_NORM_ADVAL ELSE T.PC_ALIQ_REDUZIDA END FROM BROKER.DBO.TRIBUTO T (NOLOCK) ' + #13#10 +
    ' WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0001'' ' + #13#10 +
    ' ) ' + #13#10 +
    ' )),''.'','','') + ''%'' AS [T],--% II ' + #13#10 +
    ' 0 AS [U],--Outra Base II ' + #13#10 +
    ' ''0,00'' AS [V],--Base IPI ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),DM.VL_IPI_ITEM),''.'','','') AS [W],--Valor IPI ' + #13#10 +
    ' REPLACE(CONVERT(VARCHAR(MAX), ' + #13#10 +
    ' CONVERT(NUMERIC(15,2), ' + #13#10 +
    ' ( ' + #13#10 +
    ' SELECT ' + #13#10 +
    ' CASE ' + #13#10 +
    ' WHEN T.CD_TIPO_ALIQ_IPT=''1'' THEN T.PC_ALIQ_NORM_ADVAL ELSE T.PC_ALIQ_REDUZIDA END FROM BROKER.DBO.TRIBUTO T (NOLOCK) ' + #13#10 +
    ' WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0002'' ' + #13#10 +
    ' ) ' + #13#10 +
    ' )),''.'','','') + ''%'' AS [X],--% IPI ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),(DM.VL_BASE_CALC_II + DM.VL_II_ITEM)),''.'','','') AS [Y],--Outra Base IPI ' + #13#10 +
    ' ''0,00'' AS [Z],--Base Pis ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),DM.VL_PIS_ITEM),''.'','','') AS [AA],--Valor PIS ' + #13#10 +
    ' REPLACE(CONVERT(VARCHAR(MAX), ' + #13#10 +
    ' CONVERT(NUMERIC(15,2), ' + #13#10 +
    ' (CASE ' + #13#10 +
    ' WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_PIS ' + #13#10 +
    ' ELSE AI.ALIQ_PIS_REDUZIDA END))),''.'','','') + ''%'' AS [AB],--% PIS ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') AS [AC],--Outra Base Pis ' + #13#10 +
    ' '''' AS [AD],--Flag PIS ' + #13#10 +
    ' ''0,00'' AS [AE],--Base Cofins ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),DM.VL_COFINS_ITEM),''.'','','') AS [AF],--Valor COFINS ' + #13#10 +
    ' REPLACE(CONVERT(VARCHAR(MAX), ' + #13#10 +
    ' CONVERT(NUMERIC(15,2), ' + #13#10 +
    ' (CASE ' + #13#10 +
    ' WHEN AI.CD_TIPO_BENEF_PIS_COFINS=''1'' THEN AI.ALIQ_COFINS ' + #13#10 +
    ' ELSE AI.ALIQ_COFINS_REDUZIDA END))),''.'','','') + ''%'' AS [AG],--% COFINS ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),DM.VL_BASE_PIS_COFINS),''.'','','') AS [AH],--Outra Base Cofins ' + #13#10 +
    ' '''' AS [AI],--Flag Cofins ' + #13#10 +
    ' ''0,000000'' AS [AJ],--Base ICMS ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,6),CASE WHEN AI.PC_REDUCAO_ICMS > 0                        ' + #13#10 +
    '  THEN ( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) * (AI.PC_REDUCAO_ICMS) / 100 ' + #13#10 +
    '  ELSE 0 END),''.'','','') AS [AK],--Valor Excluido de ICMS (redução)  ' + #13#10 +
    ' REPLACE(CONVERT(VARCHAR(MAX),CONVERT(NUMERIC(15,2),CASE WHEN AI.PC_REDUCAO_ICMS > 0 THEN 100 - AI.PC_REDUCAO_ICMS ELSE AI.PC_REDUCAO_ICMS END)),''.'','','')+''%'' AS [AL],--% Redução ICMS ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),CASE WHEN AI.VL_ICMS_A_RECOLHER_AFRMM = 0 THEN 0 WHEN AI.PC_REDUCAO_ICMS > 0 THEN             ' + #13#10 +
    ' ( ( ( AI.VL_BASE_CALC_ICMS_AFRMM - ( AI.VL_BASE_CALC_ICMS_AFRMM * ( (AI.PC_REDUCAO_ICMS) / 100) ) ) * ( AI.PC_ICMS / 100 ) )  / AI.VL_BASE_CALC_II ) *  DM.VL_BASE_CALC_II  ' + #13#10 +
    ' ELSE (( DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM ) / ( (100 - AI.PC_ICMS) / 100 ) ) * ( AI.PC_ICMS / 100 ) END),''.'','','') AS [AM],--Valor ICMS  ' + #13#10 +
    ' REPLACE(CONVERT(VARCHAR(MAX),CONVERT(NUMERIC(15,2),AI.PC_ICMS)),''.'','','') +''%'' AS [AN],--% ICMS ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,6),( (DM.VL_BASE_CALC_II + DM.VL_II_ITEM + DM.VL_IPI_ITEM + DM.VL_PIS_ITEM + DM.VL_COFINS_ITEM + DM.VL_TX_SCX_ITEM + DM.VL_AFRMM_ITEM) / ( (100 - AI.PC_ICMS) / 100 ) )),''.'','','') AS [AO],--Outra Base ICMS ' + #13#10 +
    ' '''' AS [AP],--Flag de ICMS ' + #13#10 +
    ' 0 AS [AQ],--Base Pis Majorado ' + #13#10 +
    ' 0 AS [AR],--Valor PIS Majorado ' + #13#10 +
    ' 0 AS [AS],--% PIS Majorado ' + #13#10 +
    ' 0 AS [AT],--Outra Base Pis Majorado ' + #13#10 +
    ' ''X'' AS [AU],--Flag PIS Majorado ' + #13#10 +
    ' 0 AS [AV],--Base Cofins Majorado ' + #13#10 +
    ' 0 AS [AW],--Valor COFINS Majorado ' + #13#10 +
    ' 0 AS [AX],--% COFINS Majorado ' + #13#10 +
    ' 0 AS [AY],--Outra Base Cofins Majorado ' + #13#10 +
    ' '''' AS [AZ],--Flag Cofins Majorado ' + #13#10 +
    ' DM.VL_TX_SCX_ITEM AS [BA],--Siscomex ' + #13#10 +
    ' 0 AS [BB],--AFRMM ' + #13#10 +
    ' 0 AS [BC],--Outras Despesas ICMS ' + #13#10 +
    ' CAST(STUFF(( SELECT DISTINCT '', '' + LEFT(LTRIM(RTRIM(RC.CD_REFERENCIA)),10) ' + #13#10 +
    '                      FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) ' + #13#10 +
    '                     WHERE RC.NR_PROCESSO      = TP.NR_PROCESSO ' + #13#10 +
    '                       AND RC.TP_REFERENCIA    = ''01'' ' + #13#10 +
    '             FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [BD],--PEDIDO ' + #13#10 +
    ' CASE ' + #13#10 +
    ' 	WHEN TP.CD_AREA = ''AJ'' THEN ''0001042000'' ' + #13#10 +
    ' 	WHEN TP.CD_AREA = ''Y3'' THEN ''0001044000'' ' + #13#10 +
    ' 	WHEN TP.CD_AREA = ''Y1'' THEN ''0001042100'' ' + #13#10 +
    ' 	WHEN TP.CD_AREA = ''Y0'' THEN ''0001042700'' ' + #13#10 +
    ' 	WHEN TP.CD_AREA = ''Y2'' THEN ''0005014030'' ' + #13#10 +
    ' END AS [BE],--Despesas Aduaneiras ' + #13#10 +
    ' ISNULL(EE.NR_CLIENTE,'''') AS [BF],--Codigo Fabricante ' + #13#10 +
    ' 0 AS [BG],--Seguro ' + #13#10 +
    ' '''' AS [BH], --Frete ' + #13#10 +
    ' CASE WHEN AI.CD_TRIBUTACAO_ICMS = ''7'' THEN ''X'' ELSE '''' END AS [BI], --Diferimento ' + #13#10 +
        ' REPLACE(CONVERT(NUMERIC(15,3),DM.VL_BASE_IBS_CBS),''.'','','') AS [BJ], ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DM.VL_CBS),''.'','','') AS [BK],          ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),AI.ALIQ_CBS),''.'','','') AS [BL],        ' + #13#10 +
    ' '''' AS [BM],                                                           ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DM.VL_BASE_IBS_CBS),''.'','','') AS [BN], ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DM.VL_IBS_UF),''.'','','') AS [BO],       ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),AI.ALIQ_IBS_UF),''.'','','') AS [BP],     ' + #13#10 +
    ' '''' AS [BQ],                                                           ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DM.VL_BASE_IBS_CBS),''.'','','') AS [BR], ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DM.VL_IBS_MUN),''.'','','') AS [BS],      ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,2),AI.ALIQ_IBS_MUN),''.'','','') AS [BT],    ' + #13#10 +
    ' '''' AS [BU],                                                           ' + #13#10 +
    ' '''' AS [BV],                                                           ' + #13#10 +
    ' ''X'' AS [BW],                                                          ' + #13#10 +
    ' 0 AS [BX]                                                               ' + #13#10 +
    ' ' + #13#10 +
    ' ' + #13#10 +
    ' FROM BROKER.dbo.TPROCESSO TP (NOLOCK) ' + #13#10 +
    ' ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = TP.CD_CLIENTE ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TDETALHE_MERCADORIA DM (NOLOCK) ON DM.NR_PROCESSO = TP.NR_PROCESSO ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TUNID_MEDIDA_BROKER UM (NOLOCK) ON UM.CD_UNID_MEDIDA = DM.CD_UN_MED_COMERC ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TADICAO_DE_IMPORTACAO AI (NOLOCK) ON DM.NR_PROCESSO = AI.NR_PROCESSO AND DM.NR_ADICAO = AI.NR_ADICAO ' + #13#10 +
    ' LEFT JOIN BROKER.DBO.TMERCADORIA MERC (NOLOCK) ON MERC.CD_MERCADORIA = DM.CD_MERCADORIA AND MERC.CD_GRUPO = TP.CD_GRUPO ' + #13#10 +
    ' LEFT JOIN BROKER.dbo.TEMPRESA_EST EE (NOLOCK) ON EE.CD_EMPRESA = AI.CD_FABRICANTE ' + #13#10 +
    ' ' + #13#10 +
    ' WHERE DM.NR_PROCESSO = :NR_PROCESSO' + #13#10 +
    ' AND DM.NR_CNTR = :NR_CNTR' ;
end;

function TIntegracaoNota.getSqlDraftDanfeRodape: String;
begin
  Result :=
    ' SELECT ' + #13#10 +
    ' VT.CD_VIA_TRANSP AS [CodViaTransp], ' + #13#10 +
    ' TR.NM_TRANSP_ROD AS [Transportadora], ' + #13#10 +
    ' TR.END_TRANSP_ROD AS [Endereco], ' + #13#10 +
    ' TR.END_UF + ''1'' AS [UF], ' + #13#10 +
    ' SUBSTRING(TR.CNPJ_TRANSP_ROD,1,2) + ''.'' + SUBSTRING(TR.CNPJ_TRANSP_ROD,3,3) + ''.'' + SUBSTRING(TR.CNPJ_TRANSP_ROD,6,3) + ''/'' + SUBSTRING(TR.CNPJ_TRANSP_ROD,9,4) + ''-'' + SUBSTRING(TR.CNPJ_TRANSP_ROD,13,2) AS [CNPJ], ' + #13#10 +
    ' TR.END_CIDADE AS [Municipio], ' + #13#10 +
    ' TR.IE_TRANSP_ROD AS [InscricaoEstadual], ' + #13#10 +
    ' CONVERT(VARCHAR(MAX),CONVERT(NUMERIC(15,2),sum(AI.VL_AFRMM))) AS [AFRMM_TOT_ROD], ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DI.PL_CARGA),''.'','','') AS [PesoLiquido], ' + #13#10 +
    ' REPLACE(CONVERT(NUMERIC(15,3),DI.PB_CARGA),''.'','','') AS [PesoBruto], ' + #13#10 +
	  ' CASE WHEN                                                      ' + #13#10 +
	  ' (SELECT COUNT(*) FROM BROKER.DBO.TEMBALAGEM_CARGA EC (NOLOCK)  ' + #13#10 +
    ' WHERE EC.NR_PROCESSO = TP.NR_PROCESSO) > 1 THEN                ' + #13#10 +
	  ' (SELECT  ''OUTROS - '' +  CONVERT(VARCHAR(10),(SUM(CONVERT(NUMERIC,EC.QT_VOLUME_CARGA)))) FROM BROKER.DBO.TEMBALAGEM_CARGA EC (NOLOCK) ' + #13#10 +
    ' WHERE EC.NR_PROCESSO = TP.NR_PROCESSO)                         ' + #13#10 +
    ' ELSE                                                           ' + #13#10 +
    ' (SELECT RTRIM(TE.DESCRICAO) + '' - '' + EC.QT_VOLUME_CARGA FROM BROKER.DBO.TEMBALAGEM_CARGA EC (NOLOCK)      ' + #13#10 +
    ' INNER JOIN BROKER.DBO.TTP_EMBALAGEM TE (NOLOCK) ON TE.CODIGO = EC.CD_TIPO_EMBALAGEM    ' + #13#10 +
    ' WHERE EC.NR_PROCESSO = TP.NR_PROCESSO) END AS [QuantidadeEspecie],  ' + #13#10 +
    '  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(              ' + #13#10 +
    '  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(   REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(   ' + #13#10 +
    ' ''NREF '' + TP.NR_PROCESSO + ''   '' + ' + #13#10 +
    ' (CAST(STUFF(( SELECT DISTINCT '', '' + ''PO '' + LEFT(LTRIM(RTRIM(RC.CD_REFERENCIA)),10) ' + #13#10 +
    '                      FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) ' + #13#10 +
    '                     WHERE RC.NR_PROCESSO      = TP.NR_PROCESSO AND RC.TP_REFERENCIA    = ''01'' ' + #13#10 +
    '             FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)))  + ''   '' + ' + #13#10 +
    ' ''DI '' + TP.NR_DI + '' '' + ' + #13#10 +
    ' ''VALOR PIS '' + CONVERT(VARCHAR(MAX),CONVERT(NUMERIC(15,2),sum(AI.VL_PIS)))  + '' '' + ' + #13#10 +
    ' ''VALOR COFINS '' + CONVERT(VARCHAR(MAX),CONVERT(NUMERIC(15,2),sum(AI.VL_COFINS)))  + '' '' + ' + #13#10 +
    ' ''TX SISCOMEX '' + CONVERT(VARCHAR(MAX),CONVERT(NUMERIC(15,2),sum(AI.VL_TX_SCX_AD)))  + '' '' + ' + #13#10 +
    ' ''AFRMM '' + CONVERT(VARCHAR(MAX),CONVERT(NUMERIC(15,2),sum(AI.VL_AFRMM)))  + '' '' + ' + #13#10 +
    ' ''DATA DESEMBARACO '' + ISNULL(CONVERT(VARCHAR(10),EV088.DT_REALIZACAO,102),'''')  + '' '' + ' + #13#10 +
    ' ''MODAL '' + UPPER(VT.NM_VIA_TRANSP) + '' '' + ' + #13#10 +
    ' ''REGISTRO '' + CONVERT(VARCHAR(10),EV021.DT_REALIZACAO,102)  + '' ''  + ' + #13#10 +
    ' ''RECINTO ALFANDEGADO '' + RA.DESCRICAO    ' + #13#10 +
    ' + CASE WHEN TP.CD_CLIENTE = ''03163'' AND TP.CD_AREA IN (''AJ'',''Y1'') THEN '' Importacao. Diferimento do ICMS. '' + A.NM_AREA + '' TD Nº 77 - Processo 255000000641712 – Vigencia: Prazo Indeterminado'' ELSE ''''  END ' + #13#10 +
    '   ,''Á'',''A''),''À'',''A''),''Â'',''A''),''Ã'',''A''),''É'',''E''),''È'',''E''),''Ê'',''E''),''Í'',''I''),''Ì'',''I''),''Î'',''I''),    ' + #13#10 +
    '    ''Ó'',''O''),''Ò'',''O''),''Ô'',''O''),''Õ'',''O''),''Ú'',''U''),''Ù'',''U''),''Û'',''U''), ''Ç'',''C'') , ''/'','''')    ' + #13#10 +
    ' AS [DadosComplementares], ' + #13#10 +
    ' CAST(STUFF(( SELECT DISTINCT ''/ '' + LTRIM(RTRIM(SUBSTRING(TPC.NR_CNTR,1,4)+''-''+SUBSTRING(TPC.NR_CNTR,5,7))) FROM BROKER.DBO.TPROCESSO_CNTR TPC WITH (NOLOCK) ' + #13#10 +
    '                 WHERE TPC.NR_PROCESSO      = TP.NR_PROCESSO AND TPC.TP_CNTR  != ''01''   ' + #13#10 +
    '        FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [NR_CNTR_TOTAL]       ' + #13#10 +
    ' FROM BROKER.dbo.TPROCESSO TP (NOLOCK) ' + #13#10 +
    ' LEFT JOIN BROKER.DBO.TAREA A (NOLOCK) ON A.CD_AREA = TP.CD_AREA    ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TSERVICO_NOVO SN (NOLOCK) ON SN.CD_SERVICO = TP.CD_SERVICO ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TVIA_TRANSP_BROKER VT (NOLOCK) ON VT.CD_VIA_TRANSP = SN.CD_VIA_TRANSPORTE ' + #13#10 +
    ' LEFT JOIN BROKER.DBO.TTRANSP_ROD TR (NOLOCK) ON TR.CD_TRANSP_ROD = TP.CD_TRANSP_NAC ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = TP.NR_PROCESSO ' + #13#10 +
    ' INNER JOIN BROKER.dbo.TADICAO_DE_IMPORTACAO AI (NOLOCK) ON TP.NR_PROCESSO = AI.NR_PROCESSO ' + #13#10 +
    ' LEFT JOIN BROKER.dbo.TFOLLOWUP EV088 (NOLOCK) ON EV088.NR_PROCESSO = TP.NR_PROCESSO AND EV088.CD_EVENTO=''088'' ' + #13#10 +
    ' LEFT JOIN BROKER.dbo.TFOLLOWUP EV021 (NOLOCK) ON EV021.NR_PROCESSO = TP.NR_PROCESSO AND EV021.CD_EVENTO=''021'' ' + #13#10 +
    ' LEFT JOIN BROKER.dbo.TREC_ALFANDEGADO RA (NOLOCK) ON RA.CODIGO = DI.CD_RECINTO_ALFAND ' + #13#10 +
    ' WHERE TP.NR_PROCESSO = :NR_PROCESSO ' + #13#10 +
    ' GROUP BY TR.NM_TRANSP_ROD, TR.END_TRANSP_ROD, TR.END_UF, TR.CNPJ_TRANSP_ROD, TR.END_CIDADE, ' + #13#10 +
    ' 	TR.IE_TRANSP_ROD, DI.PL_CARGA, DI.PB_CARGA, TP.NR_PROCESSO, TP.NR_DI, EV088.DT_REALIZACAO, ' + #13#10 +
    ' 	VT.NM_VIA_TRANSP, EV021.DT_REALIZACAO, RA.DESCRICAO, VT.CD_VIA_TRANSP, A.NM_AREA, TP.CD_AREA, TP.CD_CLIENTE ';
end;

end.

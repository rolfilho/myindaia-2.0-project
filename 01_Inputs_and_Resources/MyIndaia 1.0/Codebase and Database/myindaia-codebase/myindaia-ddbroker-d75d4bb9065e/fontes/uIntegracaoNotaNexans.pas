unit uIntegracaoNotaNexans;

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
    LinhaCntr1: Integer;
    LinhaCntr2: Integer;
    Excel: OleVariant;
    xlWorkB1: OleVariant;
    oSheet: OleVariant;
    listaDadosComplementares: TStringList;
    queryDraftDanfeCabecalho: TQuery;
    queryDraftDanfeItens: TQuery;
    queryDraftDanfeAdicao1: TQuery;
    queryDraftDanfeAdicao2: TQuery;
    queryDraftDanfeAdicao3: TQuery;
    queryDraftDanfeAdicao4: TQuery;
    queryDraftDanfeItemCntr1: TQuery;
    queryDraftDanfeItemCntr2: TQuery;
    queryDraftDanfePesoCntr1: TQuery;
    queryDraftDanfePesoCntr2: TQuery;
    queryDraftDanfeCntr1: TQuery;
    queryDraftDanfeCntr2: TQuery;
    procedure gerarDraft;
    procedure criaPlanilha;
    procedure preencheExcelCabecalho;
    procedure preencheExcelItens;
    procedure preencheExcelCntr1;
    procedure preencheExcelCntr2;
    function getSqlDraftDanfeCabecalho: String;
    function getSqlDraftDanfeItens: String;
    function getSqlDraftDanfeAdicao1: String;
    function getSqlDraftDanfeAdicao2: String;
    function getSqlDraftDanfeAdicao3: String;
    function getSqlDraftDanfeAdicao4: String;
    function getSqlDraftDanfeItemCntr1: String;
    function getSqlDraftDanfeItemCntr2: String;
    function getSqlDraftDanfePesoCntr1: String;
    function getSqlDraftDanfePesoCntr2: String;
    function getSqlDraftDanfeCntr1: String;
    function getSqlDraftDanfeCntr2: String;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  Tfrm_integracao_nota_nexans = class(TForm)
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
  frm_integracao_nota_nexans: Tfrm_integracao_nota_nexans;

implementation

uses PGGP001, PGSM018, PGSM010, PGSM024, PGFT024, GSMLIB, PGGP017, PGSM105, ConsOnLineEx, KrDialog;

{$R *.DFM}

procedure Tfrm_integracao_nota_nexans.btn_cd_unid_negClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    mskedt_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',nil);
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', mskedt_cd_unid_neg.Text,'AP_UNID_NEG');
  End;
end;

procedure Tfrm_integracao_nota_nexans.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_integracao_nota_nexans.mskedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = mskedt_cd_unid_neg then btn_cd_unid_negClick(nil);
  end;
end;

procedure Tfrm_integracao_nota_nexans.mskedt_cd_unid_negExit(Sender: TObject);
begin
  if (edt_nm_unid_neg.Text = '') and (mskedt_cd_unid_neg.Text <> '') then
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', mskedt_cd_unid_neg.Text,'AP_UNID_NEG')
  else
    Exit;
end;

procedure Tfrm_integracao_nota_nexans.btn_geraplanilhaClick(
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

  queryDraftDanfeCabecalho := TQuery.Create(nil);
  queryDraftDanfeCabecalho.DatabaseName := 'DBBROKER';

  queryDraftDanfeItens := TQuery.Create(nil);
  queryDraftDanfeItens.DatabaseName := 'DBBROKER';

  queryDraftDanfeAdicao1 := TQuery.Create(nil);
  queryDraftDanfeAdicao1.DatabaseName := 'DBBROKER';

  queryDraftDanfeAdicao2 := TQuery.Create(nil);
  queryDraftDanfeAdicao2.DatabaseName := 'DBBROKER';

  queryDraftDanfeAdicao3 := TQuery.Create(nil);
  queryDraftDanfeAdicao3.DatabaseName := 'DBBROKER';

  queryDraftDanfeAdicao4 := TQuery.Create(nil);
  queryDraftDanfeAdicao4.DatabaseName := 'DBBROKER';

  queryDraftDanfeItemCntr1 := TQuery.Create(nil);
  queryDraftDanfeItemCntr1.DatabaseName := 'DBBROKER';

  queryDraftDanfeItemCntr2 := TQuery.Create(nil);
  queryDraftDanfeItemCntr2.DatabaseName := 'DBBROKER';

  queryDraftDanfePesoCntr1 := TQuery.Create(nil);
  queryDraftDanfePesoCntr1.DatabaseName := 'DBBROKER';

  queryDraftDanfePesoCntr2 := TQuery.Create(nil);
  queryDraftDanfePesoCntr2.DatabaseName := 'DBBROKER';

  queryDraftDanfeCntr1 := TQuery.Create(nil);
  queryDraftDanfeCntr1.DatabaseName := 'DBBROKER';

  queryDraftDanfeCntr2 := TQuery.Create(nil);
  queryDraftDanfeCntr2.DatabaseName := 'DBBROKER';

end;

destructor TIntegracaoNota.Destroy;
begin
  queryDraftDanfeCabecalho.Free;
  queryDraftDanfeItens.Free;
  queryDraftDanfeAdicao1.Free;
  queryDraftDanfeAdicao2.Free;
  queryDraftDanfeAdicao3.Free;
  queryDraftDanfeAdicao4.Free;
  queryDraftDanfeItemCntr1.Free;
  queryDraftDanfeItemCntr2.Free;
  queryDraftDanfePesoCntr1.Free;
  queryDraftDanfePesoCntr2.Free;
  queryDraftDanfeCntr1.Free;
  queryDraftDanfeCntr2.Free;
  inherited;
end;



procedure TIntegracaoNota.gerarDraft;
var
  pastaPlanilha: String;

  procedure apagaArquivosExistentes(arquivo: String);
  begin
    if FileExists(arquivo) then
      DeleteFile(arquivo);
  end;
begin
  LinhaItem := 11;
  LinhaCntr1 := 11;
  LinhaCntr2 := 40;
  pastaPlanilha := 'C:\DDBROKER\NOTA FISCAL\';

  queryDraftDanfeCabecalho.SQL.Text := getSqlDraftDanfeCabecalho;
  queryDraftDanfeCabecalho.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeCabecalho.Open;

  queryDraftDanfeItens.SQL.Text := getSqlDraftDanfeItens;
  queryDraftDanfeItens.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeItens.Open;

  queryDraftDanfeAdicao1.SQL.Text := getSqlDraftDanfeAdicao1;
  queryDraftDanfeAdicao1.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeAdicao1.Open;

  queryDraftDanfeAdicao2.SQL.Text := getSqlDraftDanfeAdicao2;
  queryDraftDanfeAdicao2.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeAdicao2.Open;

  queryDraftDanfeAdicao3.SQL.Text := getSqlDraftDanfeAdicao3;
  queryDraftDanfeAdicao3.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeAdicao3.Open;

  queryDraftDanfeAdicao4.SQL.Text := getSqlDraftDanfeAdicao4;
  queryDraftDanfeAdicao4.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeAdicao4.Open;

  queryDraftDanfeItemCntr1.SQL.Text := getSqlDraftDanfeItemCntr1;
  queryDraftDanfeItemCntr1.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeItemCntr1.Open;

  queryDraftDanfeItemCntr2.SQL.Text := getSqlDraftDanfeItemCntr2;
  queryDraftDanfeItemCntr2.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeItemCntr2.Open;

  queryDraftDanfePesoCntr1.SQL.Text := getSqlDraftDanfePesoCntr1;
  queryDraftDanfePesoCntr1.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfePesoCntr1.Open;

  queryDraftDanfePesoCntr2.SQL.Text := getSqlDraftDanfePesoCntr2;
  queryDraftDanfePesoCntr2.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfePesoCntr2.Open;

  queryDraftDanfeCntr1.SQL.Text := getSqlDraftDanfeCntr1;
  queryDraftDanfeCntr1.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeCntr1.Open;

  queryDraftDanfeCntr2.SQL.Text := getSqlDraftDanfeCntr2;
  queryDraftDanfeCntr2.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeCntr2.Open;


  try
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    nomePlanilha := numeroProcesso + '_NEXANS' + '.XLS';
    criaPlanilha;
    try
      preencheExcelCabecalho;

      queryDraftDanfeItens.First;
      while not queryDraftDanfeItens.Eof do
      begin
        preencheExcelItens;
        queryDraftDanfeItens.Next;
      end;


      queryDraftDanfeCntr1.First;
      while not queryDraftDanfeCntr1.Eof do
      begin
        queryDraftDanfeItemCntr1.First;
      while not queryDraftDanfeItemCntr1.Eof do
      begin
        preencheExcelCntr1;
        queryDraftDanfeItemCntr1.Next;
      end;

      queryDraftDanfeCntr1.Next;
      end;


      queryDraftDanfeCntr2.First;
      while not queryDraftDanfeCntr2.Eof do
      begin
        queryDraftDanfeItemCntr2.First;
      while not queryDraftDanfeItemCntr2.Eof do
      begin
        preencheExcelCntr2;
        queryDraftDanfeItemCntr2.Next;
      end;

      queryDraftDanfeCntr2.Next;
    end;

      apagaArquivosExistentes(pastaPlanilha + nomePlanilha);
      Excel.ActiveWorkBook.SaveAs(pastaPlanilha + nomePlanilha);
    finally
      Excel.Quit;
    end;

    Screen.Cursor := crDefault;
    Information( ' planilhas geradas com sucesso na pasta: ' + pastaPlanilha );
    Application.ProcessMessages;

  finally
    queryDraftDanfeCabecalho.Close;
    queryDraftDanfeItens.Close;
    queryDraftDanfeAdicao1.Close;
    queryDraftDanfeAdicao2.Close;
    queryDraftDanfeAdicao3.Close;
    queryDraftDanfeAdicao4.Close;
    queryDraftDanfeItemCntr1.Close;
    queryDraftDanfeItemCntr2.Close;
    queryDraftDanfePesoCntr1.Close;
    queryDraftDanfePesoCntr2.Close;
    queryDraftDanfeCntr1.Close;
    queryDraftDanfeCntr2.Close;
  end;
end;


procedure TIntegracaoNota.criaPlanilha;
begin
    try
      Excel := CreateOLEObject('Excel.Application');
      xlWorkB1 := Excel.Workbooks.Open('C:\ddbroker\Modelo DRAFT DANFE Nexans.xls');
//      oSheet := Excel.WorkBooks[1].Worksheets[1];
//      Excel.Visible := True;
    except
      BoxMensagem('Erro na criação da Planilha. Verifique se a Planilha não está em uso ou se o Excel está aberto.',2) ;
      Exit;
    end;
end;

procedure TIntegracaoNota.preencheExcelCabecalho;
begin

  //DADOS NF
  Excel.WorkBooks[1].Worksheets[1].Cells[03,01].value := queryDraftDanfeCabecalho.FieldByName('PEDIDOS').AsString;
  Excel.WorkBooks[1].Worksheets[1].Cells[05,02].value := queryDraftDanfeCabecalho.FieldByName('EXPORTADOR').AsString;
  Excel.WorkBooks[1].Worksheets[1].Cells[05,06].value := queryDraftDanfeCabecalho.FieldByName('EXPORTADOR - COD. CLIENTE').AsString;
  Excel.WorkBooks[1].Worksheets[1].Cells[06,02].value := queryDraftDanfeCabecalho.FieldByName('FABRICANTE').AsString;
  Excel.WorkBooks[1].Worksheets[1].Cells[06,06].value := queryDraftDanfeCabecalho.FieldByName('FABRICANTE - COD. CLIENTE').AsString;
  Excel.WorkBooks[1].Worksheets[1].Cells[07,02].value := queryDraftDanfeCabecalho.FieldByName('VALOR ADUANEIRO - USD').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[08,02].value := queryDraftDanfeCabecalho.FieldByName('VALOR ADUANEIRO - R$').AsFloat;

  //DADOS PARCIAIS
  Excel.WorkBooks[1].Worksheets[2].Cells[03,01].value := queryDraftDanfeCabecalho.FieldByName('PEDIDOS').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[05,02].value := queryDraftDanfeCabecalho.FieldByName('EXPORTADOR').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[05,07].value := queryDraftDanfeCabecalho.FieldByName('EXPORTADOR - COD. CLIENTE').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[06,02].value := queryDraftDanfeCabecalho.FieldByName('FABRICANTE').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[06,07].value := queryDraftDanfeCabecalho.FieldByName('FABRICANTE - COD. CLIENTE').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[07,02].value := queryDraftDanfeCabecalho.FieldByName('VALOR ADUANEIRO - USD').AsFloat;
  Excel.WorkBooks[1].Worksheets[2].Cells[08,02].value := queryDraftDanfeCabecalho.FieldByName('VALOR ADUANEIRO - R$').AsFloat;


  //DADOS NF - Adições
  Excel.WorkBooks[1].Worksheets[1].Cells[44,02].value := queryDraftDanfeAdicao1.FieldByName('II').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[44,03].value := queryDraftDanfeAdicao1.FieldByName('ALIQ. II').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[45,02].value := queryDraftDanfeAdicao1.FieldByName('IPI').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[45,03].value := queryDraftDanfeAdicao1.FieldByName('ALIQ. IPI').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[46,02].value := queryDraftDanfeAdicao1.FieldByName('PIS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[46,03].value := queryDraftDanfeAdicao1.FieldByName('ALIQ. PIS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[47,02].value := queryDraftDanfeAdicao1.FieldByName('COFINS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[47,03].value := queryDraftDanfeAdicao1.FieldByName('ALIQ. COFINS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[44,05].value := queryDraftDanfeAdicao1.FieldByName('ATO').AsString;

  Excel.WorkBooks[1].Worksheets[1].Cells[49,02].value := queryDraftDanfeAdicao2.FieldByName('II').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[49,03].value := queryDraftDanfeAdicao2.FieldByName('ALIQ. II').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[50,02].value := queryDraftDanfeAdicao2.FieldByName('IPI').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[50,03].value := queryDraftDanfeAdicao2.FieldByName('ALIQ. IPI').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[51,02].value := queryDraftDanfeAdicao2.FieldByName('PIS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[51,03].value := queryDraftDanfeAdicao2.FieldByName('ALIQ. PIS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[52,02].value := queryDraftDanfeAdicao2.FieldByName('COFINS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[52,03].value := queryDraftDanfeAdicao2.FieldByName('ALIQ. COFINS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[49,05].value := queryDraftDanfeAdicao2.FieldByName('ATO').AsString;

  Excel.WorkBooks[1].Worksheets[1].Cells[54,02].value := queryDraftDanfeAdicao3.FieldByName('II').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[54,03].value := queryDraftDanfeAdicao3.FieldByName('ALIQ. II').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[55,02].value := queryDraftDanfeAdicao3.FieldByName('IPI').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[55,03].value := queryDraftDanfeAdicao3.FieldByName('ALIQ. IPI').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[56,02].value := queryDraftDanfeAdicao3.FieldByName('PIS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[56,03].value := queryDraftDanfeAdicao3.FieldByName('ALIQ. PIS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[57,02].value := queryDraftDanfeAdicao3.FieldByName('COFINS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[57,03].value := queryDraftDanfeAdicao3.FieldByName('ALIQ. COFINS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[54,05].value := queryDraftDanfeAdicao3.FieldByName('ATO').AsString;

  Excel.WorkBooks[1].Worksheets[1].Cells[59,02].value := queryDraftDanfeAdicao4.FieldByName('II').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[59,03].value := queryDraftDanfeAdicao4.FieldByName('ALIQ. II').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[60,02].value := queryDraftDanfeAdicao4.FieldByName('IPI').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[60,03].value := queryDraftDanfeAdicao4.FieldByName('ALIQ. IPI').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[61,02].value := queryDraftDanfeAdicao4.FieldByName('PIS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[61,03].value := queryDraftDanfeAdicao4.FieldByName('ALIQ. PIS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[62,02].value := queryDraftDanfeAdicao4.FieldByName('COFINS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[62,03].value := queryDraftDanfeAdicao4.FieldByName('ALIQ. COFINS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[59,05].value := queryDraftDanfeAdicao4.FieldByName('ATO').AsString;

  //DADOS NF - TOTAIS
  Excel.WorkBooks[1].Worksheets[1].Cells[65,02].value := queryDraftDanfeCabecalho.FieldByName('AFRMM').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[66,02].value := queryDraftDanfeCabecalho.FieldByName('ICMS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[66,03].value := queryDraftDanfeCabecalho.FieldByName('ALIQ. ICMS').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[67,02].value := queryDraftDanfeCabecalho.FieldByName('TX SISCOMEX').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[64,04].value := queryDraftDanfeCabecalho.FieldByName('ANTIDUMPING').AsFloat;

  //DADOS PARCIAIS - TOTAIS CNTR 1
  if queryDraftDanfePesoCntr1.FieldByName('PESO LIQUIDO').AsFloat > 0 THEN
  begin
  Excel.WorkBooks[1].Worksheets[2].Cells[37,02].value := queryDraftDanfePesoCntr1.FieldByName('PESO LIQUIDO').AsFloat;
  Excel.WorkBooks[1].Worksheets[2].Cells[38,02].value := queryDraftDanfePesoCntr1.FieldByName('PESO BRUTO').AsFloat;
  end;

  //DADOS PARCIAIS - TOTAIS CNTR 2
  if queryDraftDanfePesoCntr2.FieldByName('PESO LIQUIDO').AsFloat > 0 THEN
  begin
    Excel.WorkBooks[1].Worksheets[2].Cells[66,02].value := queryDraftDanfePesoCntr2.FieldByName('PESO LIQUIDO').AsFloat;
    Excel.WorkBooks[1].Worksheets[2].Cells[67,02].value := queryDraftDanfePesoCntr2.FieldByName('PESO BRUTO').AsFloat;
  end;

  //DADOS NF - TEXTO
  Excel.WorkBooks[1].Worksheets[1].Cells[69,01].value := queryDraftDanfeCabecalho.FieldByName('PEDIDOS').AsString;
  Excel.WorkBooks[1].Worksheets[1].Cells[70,01].value := queryDraftDanfeCabecalho.FieldByName('OBS. 1').AsString;
  Excel.WorkBooks[1].Worksheets[1].Cells[71,01].value := queryDraftDanfeCabecalho.FieldByName('OBS. 2').AsString;
  Excel.WorkBooks[1].Worksheets[1].Cells[72,02].value := queryDraftDanfeCabecalho.FieldByName('OBS. 3').AsString;
  Excel.WorkBooks[1].Worksheets[1].Cells[73,01].value := queryDraftDanfeCabecalho.FieldByName('PESO BRUTO').AsString;
  Excel.WorkBooks[1].Worksheets[1].Cells[74,01].value := queryDraftDanfeCabecalho.FieldByName('PESO LIQUIDO').AsString;
  Excel.WorkBooks[1].Worksheets[1].Cells[75,01].value := queryDraftDanfeCabecalho.FieldByName('OBS. 4').AsString;
  Excel.WorkBooks[1].Worksheets[1].Cells[76,01].value := queryDraftDanfeCabecalho.FieldByName('TRANSP.RODOVIARIO').AsString;


  //DADOS PARCIAIS - TEXTO - CNTR 1
  Excel.WorkBooks[1].Worksheets[2].Cells[39,02].value := queryDraftDanfeCntr1.FieldByName('TEXTO').AsString;
  //DADOS PARCIAIS - TEXTO - CNTR 2
  Excel.WorkBooks[1].Worksheets[2].Cells[68,02].value := queryDraftDanfeCntr2.FieldByName('TEXTO').AsString;

  //DADOS PARCIAIS - TEXTO
  Excel.WorkBooks[1].Worksheets[2].Cells[76,01].value := queryDraftDanfeCabecalho.FieldByName('PEDIDOS').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[77,01].value := queryDraftDanfeCabecalho.FieldByName('OBS. 1').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[78,01].value := queryDraftDanfeCabecalho.FieldByName('OBS. 2').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[80,01].value := queryDraftDanfeCabecalho.FieldByName('OBS. 4').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[81,01].value := queryDraftDanfeCabecalho.FieldByName('TRANSP.RODOVIARIO').AsString;

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
  Excel.WorkBooks[1].Worksheets[1].Cells[LinhaItem,ColunaItem].value := queryDraftDanfeItens.FieldByName('GM').AsString;
  Excel.WorkBooks[1].Worksheets[1].Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('QTDE').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('ADIÇÃO').AsString;
  Excel.WorkBooks[1].Worksheets[1].Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('NCM').AsString;
  Excel.WorkBooks[1].Worksheets[1].Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('VALOR UNITÁRIO - R$').AsFloat;
  Excel.WorkBooks[1].Worksheets[1].Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('VALOR TOTAL - R$').AsFloat;
  Inc(LinhaItem);
end;



procedure TIntegracaoNota.preencheExcelCntr1;
var
  ColunaItem: Integer;

  function AddColuna: Integer;
  begin
    ColunaItem := ColunaItem + 1;
    result := ColunaItem;
  end;
begin
  ColunaItem := 1;
  Excel.WorkBooks[1].Worksheets[2].Cells[LinhaCntr1,ColunaItem].value := queryDraftDanfeItemCntr1.FieldByName('GM').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[LinhaCntr1,AddColuna].value := queryDraftDanfeItemCntr1.FieldByName('QTDE').AsFloat;
  Excel.WorkBooks[1].Worksheets[2].Cells[LinhaCntr1,AddColuna].value := queryDraftDanfeItemCntr1.FieldByName('ADIÇÃO').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[LinhaCntr1,AddColuna].value := queryDraftDanfeItemCntr1.FieldByName('NCM').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[LinhaCntr1,AddColuna].value := queryDraftDanfeItemCntr1.FieldByName('VALOR UNITÁRIO - R$').AsFloat;
  Excel.WorkBooks[1].Worksheets[2].Cells[LinhaCntr1,AddColuna].value := queryDraftDanfeItemCntr1.FieldByName('VALOR TOTAL - R$').AsFloat;
  Inc(LinhaCntr1);
end;



procedure TIntegracaoNota.preencheExcelCntr2;
var
  ColunaItem: Integer;

  function AddColuna: Integer;
  begin
    ColunaItem := ColunaItem + 1;
    result := ColunaItem;
  end;
begin
  ColunaItem := 1;
  Excel.WorkBooks[1].Worksheets[2].Cells[LinhaCntr2,ColunaItem].value := queryDraftDanfeItemCntr2.FieldByName('GM').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[LinhaCntr2,AddColuna].value := queryDraftDanfeItemCntr2.FieldByName('QTDE').AsFloat;
  Excel.WorkBooks[1].Worksheets[2].Cells[LinhaCntr2,AddColuna].value := queryDraftDanfeItemCntr2.FieldByName('ADIÇÃO').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[LinhaCntr2,AddColuna].value := queryDraftDanfeItemCntr2.FieldByName('NCM').AsString;
  Excel.WorkBooks[1].Worksheets[2].Cells[LinhaCntr2,AddColuna].value := queryDraftDanfeItemCntr2.FieldByName('VALOR UNITÁRIO - R$').AsFloat;
  Excel.WorkBooks[1].Worksheets[2].Cells[LinhaCntr2,AddColuna].value := queryDraftDanfeItemCntr2.FieldByName('VALOR TOTAL - R$').AsFloat;
  Inc(LinhaCntr2);

end;




function TIntegracaoNota.getSqlDraftDanfeCabecalho: String;
begin
  Result :=
  '  SELECT     ' + #13#10 +
  '  ''PROCESSO: '' + CAST(STUFF(( SELECT DISTINCT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) ' + #13#10 +
  '                               WHERE RC.NR_PROCESSO = TP.NR_PROCESSO FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [PEDIDOS]  ' + #13#10 +
  '  ,EE.NM_EMPRESA AS [EXPORTADOR]                                                                                                      ' + #13#10 +
  '  ,EE.NR_CLIENTE AS [EXPORTADOR - COD. CLIENTE]                                                                                       ' + #13#10 +
  '  ,EF.NM_EMPRESA AS [FABRICANTE]                                                                                                      ' + #13#10 +
  '  ,EF.NR_CLIENTE AS [FABRICANTE - COD. CLIENTE]                                                                                       ' + #13#10 +
  '  ,(SELECT TOP 1 RDI.VL_TOTAL_ANTIDUMPING FROM BROKER.DBO.VW_RESUMO_DI RDI (NOLOCK) WHERE RDI.NR_PROCESSO_COMPLETO = TP.NR_PROCESSO) AS [ANTIDUMPING]   ' + #13#10 +
  '  ,SUM(AI.VL_BASE_CALC_II) / DI.TX_DOLAR AS [VALOR ADUANEIRO - USD]                                                                   ' + #13#10 +
  '  ,SUM(AI.VL_BASE_CALC_II) AS [VALOR ADUANEIRO - R$]                                                                                  ' + #13#10 +
  '  ,SUM(AI.VL_AFRMM) AS [AFRMM]                                                                                                        ' + #13#10 +
//  '  ,SUM(AI.VL_ICMS_A_RECOLHER_AFRMM) * 2   AS [ICMS]                                                                                 ' + #13#10 +

  '  ,CASE WHEN AI.PC_REDUCAO_ICMS > 0 THEN SUM(AI.VL_ICMS_A_RECOLHER_AFRMM) * 2 ELSE                                                    ' + #13#10 +
  ' (SUM(AI.VL_BASE_CALC_ICMS_AFRMM) * (CASE WHEN AI.IN_FUNDO_POBREZA=''1'' THEN (AI.PC_ICMS + 2) / 100 ELSE AI.PC_ICMS / 100  END)) END   AS [ICMS]     ' + #13#10 +

  '  ,CASE WHEN AI.IN_FUNDO_POBREZA=''1'' THEN (AI.PC_ICMS + 2) / 100 ELSE AI.PC_ICMS / 100  END AS [ALIQ. ICMS]                            ' + #13#10 +
  '  ,SUM(AI.VL_TX_SCX_AD) AS [TX SISCOMEX]                                                                                              ' + #13#10 +
  '  ,''DI '' + SUBSTRING(TP.NR_DI,1,2) + ''/'' + SUBSTRING(TP.NR_DI,3,7) + ''-'' + SUBSTRING(TP.NR_DI,10,1) + '' de '' +                ' + #13#10 +
  '                      CONVERT(VARCHAR(10),EV021.DT_REALIZACAO,103) + '' - INVOICE: '' + F.NR_DCTO_INSTRUCAO AS [OBS. 1]               ' + #13#10 +
  '  ,''DATA DO DESEMBARAÇO: '' + CONVERT(VARCHAR(10),EV088.DT_REALIZACAO,103) AS [OBS. 2]                                               ' + #13#10 +
  '  ,CONVERT(VARCHAR(2),(SELECT COUNT(PC.NR_CNTR) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO))    ' + #13#10 +
  '  + '' CONTAINER DE '' +                                                                                                              ' + #13#10 +
  '  RTRIM((SELECT TOP 1 TC.NM_TP_CNTR FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)                                                        ' + #13#10 +
  '  LEFT JOIN BROKER.DBO.TTP_CNTR TC (NOLOCK) ON TC.TP_CNTR = PC.TP_CNTR WHERE PC.NR_PROCESSO = TP.NR_PROCESSO)) + '': '' +             ' + #13#10 +
  '  CAST(STUFF(( SELECT DISTINCT '', '' + LTRIM(RTRIM(PC.NR_CNTR)) FROM BROKER.DBO.TPROCESSO_CNTR PC WITH (NOLOCK)                      ' + #13#10 +
  '                               WHERE PC.NR_PROCESSO = TP.NR_PROCESSO FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(MAX))  AS [OBS. 3]  ' + #13#10 +
  '  ,''PESO BRUTO: '' + REPLACE(CONVERT(VARCHAR(MAX),DI.PB_CARGA),''.'','','') + '' KG'' AS [PESO BRUTO]                                ' + #13#10 +
  '  ,''PESO LIQUIDO: '' + REPLACE(CONVERT(VARCHAR(MAX),DI.PL_CARGA),''.'','','') + '' KG'' AS [PESO LIQUIDO]                            ' + #13#10 +
  '  ,CASE WHEN DI.CD_URF_DESPACHO = ''0717600'' THEN ''(RJ) MATERIAL LIBERADO NA 7ª REGIAO FISCAL'' ELSE '''' END AS [OBS. 4]           ' + #13#10 +
  '  ,TR.NM_TRANSP_ROD AS [TRANSP.RODOVIARIO]                                                                                            ' + #13#10 +
  '  FROM BROKER.dbo.TPROCESSO TP (NOLOCK)                                                                                               ' + #13#10 +
  '  LEFT JOIN BROKER.dbo.TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = TP.NR_PROCESSO                                          ' + #13#10 +
  '  LEFT JOIN BROKER.dbo.TADICAO_DE_IMPORTACAO AI (NOLOCK) ON AI.NR_PROCESSO = TP.NR_PROCESSO                                           ' + #13#10 +
  '  LEFT JOIN BROKER.dbo.TEMPRESA_EST EE (NOLOCK) ON EE.CD_EMPRESA = DI.CD_FORNECEDOR                                                   ' + #13#10 +
  '  LEFT JOIN BROKER.dbo.TEMPRESA_EST EF (NOLOCK) ON EF.CD_EMPRESA = DI.CD_FABRICANTE                                                   ' + #13#10 +
  '  LEFT JOIN BROKER.dbo.TFOLLOWUP EV021 (NOLOCK) ON EV021.NR_PROCESSO = TP.NR_PROCESSO AND EV021.CD_EVENTO=''021''                     ' + #13#10 +
  '  LEFT JOIN BROKER.dbo.TFOLLOWUP EV088 (NOLOCK) ON EV088.NR_PROCESSO = TP.NR_PROCESSO AND EV088.CD_EVENTO=''088''                     ' + #13#10 +
  '  LEFT JOIN BROKER.DBO.TDOCUMENTO_INSTRUCAO F (NOLOCK) ON F.NR_PROCESSO = TP.NR_PROCESSO AND F.CD_TIPO_DCTO_INSTR=''01''              ' + #13#10 +
  '  LEFT JOIN BROKER.DBO.TTRANSP_ROD TR (NOLOCK) ON TR.CD_TRANSP_ROD = TP.CD_TRANSP_NAC                                                 ' + #13#10 +
  //'  LEFT JOIN BROKER.DBO.VW_RESUMO_DI RDI (NOLOCK) ON RDI.NR_PROCESSO_COMPLETO = TP.NR_PROCESSO                                         ' + #13#10 +
  '  WHERE TP.NR_PROCESSO = :NR_PROCESSO                                                                                                 ' + #13#10 +
  '  GROUP BY TP.NR_PROCESSO,EE.NM_EMPRESA,EF.NM_EMPRESA,EE.NR_CLIENTE,EF.NR_CLIENTE,DI.TX_DOLAR,AI.IN_FUNDO_POBREZA,AI.PC_ICMS,TP.NR_DI   ' + #13#10 +
  '  ,EV021.DT_REALIZACAO,F.NR_DCTO_INSTRUCAO,EV088.DT_REALIZACAO,DI.PB_CARGA,DI.PL_CARGA,DI.CD_URF_DESPACHO,TR.NM_TRANSP_ROD,AI.PC_REDUCAO_ICMS  	 ';

end;

function TIntegracaoNota.getSqlDraftDanfeItens: String;
begin
  Result :=
  '  SELECT                                                                                             ' + #13#10 +
  '  DM.CD_MERCADORIA AS [GM]                                                                           ' + #13#10 +
  '  ,DM.QT_MERC_UN_COMERC AS [QTDE]                                                                    ' + #13#10 +
  '  ,DM.NR_ADICAO AS [ADIÇÃO]                                                                          ' + #13#10 +
  '  ,DM.CD_NCM_SH AS [NCM]                                                                             ' + #13#10 +
  '  ,DM.VL_BASE_CALC_II / DM.QT_MERC_UN_COMERC AS [VALOR UNITÁRIO - R$]                                ' + #13#10 +
  '  ,DM.VL_BASE_CALC_II AS [VALOR TOTAL - R$]                                                          ' + #13#10 +
  '  FROM BROKER.dbo.TPROCESSO TP (NOLOCK)                                                              ' + #13#10 +
  '  LEFT JOIN BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) ON DM.NR_PROCESSO = TP.NR_PROCESSO            ' + #13#10 +
  '  WHERE TP.NR_PROCESSO = :NR_PROCESSO ';

end;




function TIntegracaoNota.getSqlDraftDanfeAdicao1: String;
begin
  Result :=
  '  SELECT                                                                                                           ' + #13#10 +
  '  II.VL_IPT_A_RECOLHER AS [II]                                                                                     ' + #13#10 +
  '  ,II.PC_ALIQ_NORM_ADVAL / 100 AS [ALIQ. II]                                                                       ' + #13#10 +
  '  ,IPI.VL_IPT_A_RECOLHER AS [IPI]                                                                                  ' + #13#10 +
  '  ,IPI.PC_ALIQ_NORM_ADVAL / 100 AS [ALIQ. IPI]                                                                     ' + #13#10 +
  '  ,AI.VL_PIS AS [PIS]                                                                                              ' + #13#10 +
  '  ,AI.ALIQ_PIS / 100 AS [ALIQ. PIS]                                                                                ' + #13#10 +
  '  ,AI.VL_COFINS AS [COFINS]                                                                                        ' + #13#10 +
  '  ,AI.ALIQ_COFINS / 100 AS [ALIQ. COFINS]                                                                          ' + #13#10 +
  '  ,CASE WHEN AI.NR_ATO_CONCESSORIO IS NULL THEN '''' ELSE ''ATO CONCESSÓRIO - '' + AI.NR_ATO_DRAWBACK END AS [ATO] ' + #13#10 +
  '  FROM BROKER.dbo.TPROCESSO TP (NOLOCK)                                                                            ' + #13#10 +
  '  LEFT JOIN BROKER.dbo.TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = TP.NR_PROCESSO                       ' + #13#10 +
  '  LEFT JOIN BROKER.dbo.TADICAO_DE_IMPORTACAO AI (NOLOCK) ON AI.NR_PROCESSO = TP.NR_PROCESSO                        ' + #13#10 +
  '  OUTER APPLY ( SELECT VL_IPT_A_RECOLHER, PC_ALIQ_NORM_ADVAL FROM BROKER.DBO.TRIBUTO T (NOLOCK)                    ' + #13#10 +
  '    WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0001'' ) II   ' + #13#10 +
  '  OUTER APPLY ( SELECT VL_IPT_A_RECOLHER, PC_ALIQ_NORM_ADVAL FROM BROKER.DBO.TRIBUTO T (NOLOCK)                    ' + #13#10 +
  '    WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0002'' ) IPI  ' + #13#10 +
  '  WHERE TP.NR_PROCESSO = :NR_PROCESSO                                                                              ' + #13#10 +
  '  AND AI.NR_ADICAO=''001''     ';
end;



function TIntegracaoNota.getSqlDraftDanfeAdicao2: String;
begin
  Result :=
  '  SELECT                                                                                                           ' + #13#10 +
  '  II.VL_IPT_A_RECOLHER AS [II]                                                                                     ' + #13#10 +
  '  ,II.PC_ALIQ_NORM_ADVAL / 1000 AS [ALIQ. II]                                                                      ' + #13#10 +
  '  ,IPI.VL_IPT_A_RECOLHER AS [IPI]                                                                                  ' + #13#10 +
  '  ,IPI.PC_ALIQ_NORM_ADVAL / 100 AS [ALIQ. IPI]                                                                     ' + #13#10 +
  '  ,AI.VL_PIS AS [PIS]                                                                                              ' + #13#10 +
  '  ,AI.ALIQ_PIS / 100 AS [ALIQ. PIS]                                                                                ' + #13#10 +
  '  ,AI.VL_COFINS AS [COFINS]                                                                                        ' + #13#10 +
  '  ,AI.ALIQ_COFINS / 100 AS [ALIQ. COFINS]                                                                          ' + #13#10 +
  '  ,CASE WHEN AI.NR_ATO_CONCESSORIO IS NULL THEN '''' ELSE ''ATO CONCESSÓRIO - '' + AI.NR_ATO_DRAWBACK END AS [ATO] ' + #13#10 +
  '  FROM BROKER.dbo.TPROCESSO TP (NOLOCK)                                                                            ' + #13#10 +
  '  LEFT JOIN BROKER.dbo.TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = TP.NR_PROCESSO                       ' + #13#10 +
  '  LEFT JOIN BROKER.dbo.TADICAO_DE_IMPORTACAO AI (NOLOCK) ON AI.NR_PROCESSO = TP.NR_PROCESSO                        ' + #13#10 +
  '  OUTER APPLY ( SELECT VL_IPT_A_RECOLHER, PC_ALIQ_NORM_ADVAL FROM BROKER.DBO.TRIBUTO T (NOLOCK)                    ' + #13#10 +
  '    WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0001'' ) II   ' + #13#10 +
  '  OUTER APPLY ( SELECT VL_IPT_A_RECOLHER, PC_ALIQ_NORM_ADVAL FROM BROKER.DBO.TRIBUTO T (NOLOCK)                    ' + #13#10 +
  '    WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0002'' ) IPI  ' + #13#10 +
  '  WHERE TP.NR_PROCESSO = :NR_PROCESSO                                                                              ' + #13#10 +
  '  AND AI.NR_ADICAO=''002''     ';
end;




function TIntegracaoNota.getSqlDraftDanfeAdicao3: String;
begin
  Result :=
  '  SELECT                                                                                                           ' + #13#10 +
  '  II.VL_IPT_A_RECOLHER AS [II]                                                                                     ' + #13#10 +
  '  ,II.PC_ALIQ_NORM_ADVAL / 100 AS [ALIQ. II]                                                                       ' + #13#10 +
  '  ,IPI.VL_IPT_A_RECOLHER AS [IPI]                                                                                  ' + #13#10 +
  '  ,IPI.PC_ALIQ_NORM_ADVAL / 100 AS [ALIQ. IPI]                                                                     ' + #13#10 +
  '  ,AI.VL_PIS AS [PIS]                                                                                              ' + #13#10 +
  '  ,AI.ALIQ_PIS / 100 AS [ALIQ. PIS]                                                                                ' + #13#10 +
  '  ,AI.VL_COFINS AS [COFINS]                                                                                        ' + #13#10 +
  '  ,AI.ALIQ_COFINS / 100 AS [ALIQ. COFINS]                                                                          ' + #13#10 +
  '  ,CASE WHEN AI.NR_ATO_CONCESSORIO IS NULL THEN '''' ELSE ''ATO CONCESSÓRIO - '' + AI.NR_ATO_DRAWBACK END AS [ATO] ' + #13#10 +
  '  FROM BROKER.dbo.TPROCESSO TP (NOLOCK)                                                                            ' + #13#10 +
  '  LEFT JOIN BROKER.dbo.TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = TP.NR_PROCESSO                       ' + #13#10 +
  '  LEFT JOIN BROKER.dbo.TADICAO_DE_IMPORTACAO AI (NOLOCK) ON AI.NR_PROCESSO = TP.NR_PROCESSO                        ' + #13#10 +
  '  OUTER APPLY ( SELECT VL_IPT_A_RECOLHER, PC_ALIQ_NORM_ADVAL FROM BROKER.DBO.TRIBUTO T (NOLOCK)                    ' + #13#10 +
  '    WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0001'' ) II   ' + #13#10 +
  '  OUTER APPLY ( SELECT VL_IPT_A_RECOLHER, PC_ALIQ_NORM_ADVAL FROM BROKER.DBO.TRIBUTO T (NOLOCK)                    ' + #13#10 +
  '    WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0002'' ) IPI  ' + #13#10 +
  '  WHERE TP.NR_PROCESSO = :NR_PROCESSO                                                                              ' + #13#10 +
  '  AND AI.NR_ADICAO=''003''     ';
end;



function TIntegracaoNota.getSqlDraftDanfeAdicao4: String;
begin
  Result :=
  '  SELECT                                                                                                           ' + #13#10 +
  '  II.VL_IPT_A_RECOLHER AS [II]                                                                                     ' + #13#10 +
  '  ,II.PC_ALIQ_NORM_ADVAL / 100 AS [ALIQ. II]                                                                       ' + #13#10 +
  '  ,IPI.VL_IPT_A_RECOLHER AS [IPI]                                                                                  ' + #13#10 +
  '  ,IPI.PC_ALIQ_NORM_ADVAL / 100 AS [ALIQ. IPI]                                                                     ' + #13#10 +
  '  ,AI.VL_PIS AS [PIS]                                                                                              ' + #13#10 +
  '  ,AI.ALIQ_PIS / 100 AS [ALIQ. PIS]                                                                                ' + #13#10 +
  '  ,AI.VL_COFINS AS [COFINS]                                                                                        ' + #13#10 +
  '  ,AI.ALIQ_COFINS / 100 AS [ALIQ. COFINS]                                                                          ' + #13#10 +
  '  ,CASE WHEN AI.NR_ATO_CONCESSORIO IS NULL THEN '''' ELSE ''ATO CONCESSÓRIO - '' + AI.NR_ATO_DRAWBACK END AS [ATO] ' + #13#10 +
  '  FROM BROKER.dbo.TPROCESSO TP (NOLOCK)                                                                            ' + #13#10 +
  '  LEFT JOIN BROKER.dbo.TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = TP.NR_PROCESSO                       ' + #13#10 +
  '  LEFT JOIN BROKER.dbo.TADICAO_DE_IMPORTACAO AI (NOLOCK) ON AI.NR_PROCESSO = TP.NR_PROCESSO                        ' + #13#10 +
  '  OUTER APPLY ( SELECT VL_IPT_A_RECOLHER, PC_ALIQ_NORM_ADVAL FROM BROKER.DBO.TRIBUTO T (NOLOCK)                    ' + #13#10 +
  '    WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0001'' ) II   ' + #13#10 +
  '  OUTER APPLY ( SELECT VL_IPT_A_RECOLHER, PC_ALIQ_NORM_ADVAL FROM BROKER.DBO.TRIBUTO T (NOLOCK)                    ' + #13#10 +
  '    WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0002'' ) IPI  ' + #13#10 +
  '  WHERE TP.NR_PROCESSO = :NR_PROCESSO                                                                              ' + #13#10 +
  '  AND AI.NR_ADICAO=''004''     ';
end;




function TIntegracaoNota.getSqlDraftDanfeItemCntr1: String;
begin
  Result :=
  '  SELECT                                                                                                                 ' + #13#10 +
  '  DM.CD_MERCADORIA AS [GM]                                                                                               ' + #13#10 +
  '  ,CASE WHEN                                                                                                             ' + #13#10 +
  '  ( SELECT COUNT(*) FROM BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) WHERE DM.NR_PROCESSO = TP.NR_PROCESSO ) = 1          ' + #13#10 +
  '  AND ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 2 THEN      ' + #13#10 +
  '  DM.QT_MERC_UN_COMERC / 2 ELSE DM.QT_MERC_UN_COMERC END AS [QTDE]                                                       ' + #13#10 +
  '  ,DM.NR_ADICAO AS [ADIÇÃO]                                                                                              ' + #13#10 +
  '  ,DM.CD_NCM_SH AS [NCM]                                                                                                 ' + #13#10 +
  '  ,CASE WHEN                                                                                                             ' + #13#10 +
  '  ( SELECT COUNT(*) FROM BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) WHERE DM.NR_PROCESSO = TP.NR_PROCESSO ) = 1          ' + #13#10 +
  '  AND ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 2 THEN      ' + #13#10 +
  '  DM.VL_BASE_CALC_II / 2 ELSE DM.VL_BASE_CALC_II END AS [VALOR TOTAL - R$]                                               ' + #13#10 +
  '  ,CASE WHEN                                                                                                             ' + #13#10 +
  '  ( SELECT COUNT(*) FROM BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) WHERE DM.NR_PROCESSO = TP.NR_PROCESSO ) = 1          ' + #13#10 +
  '  AND ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 2 THEN      ' + #13#10 +
  '  ( DM.VL_BASE_CALC_II / 2 ) /                                                                                           ' + #13#10 +
  '               (CASE WHEN                                                                                                ' + #13#10 +
  '  ( SELECT COUNT(*) FROM BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) WHERE DM.NR_PROCESSO = TP.NR_PROCESSO ) = 1          ' + #13#10 +
  '  AND ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 2 THEN      ' + #13#10 +
  '  DM.QT_MERC_UN_COMERC / 2 ELSE DM.QT_MERC_UN_COMERC END )                                                               ' + #13#10 +
  '         ELSE DM.VL_BASE_CALC_II     /                                                                                   ' + #13#10 +
  '               (CASE WHEN                                                                                                ' + #13#10 +
  '  ( SELECT COUNT(*) FROM BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) WHERE DM.NR_PROCESSO = TP.NR_PROCESSO ) = 1          ' + #13#10 +
  '  AND ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 2 THEN      ' + #13#10 +
  '  DM.QT_MERC_UN_COMERC / 2 ELSE DM.QT_MERC_UN_COMERC END) END AS [VALOR UNITÁRIO - R$]                                   ' + #13#10 +
  '  FROM BROKER.dbo.TPROCESSO TP (NOLOCK)                                                                                  ' + #13#10 +
  '  LEFT JOIN BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) ON DM.NR_PROCESSO = TP.NR_PROCESSO                                ' + #13#10 +
  '  WHERE TP.NR_PROCESSO = :NR_PROCESSO                                                                                    ' + #13#10 +
  '  AND DM.NR_CNTR = ( SELECT TOP 1 PC.NR_CNTR FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)                                  ' + #13#10 +
  '  WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ORDER BY PC.NR_CNTR)      ';
end;




function TIntegracaoNota.getSqlDraftDanfeItemCntr2: String;
begin
  Result :=
  '  SELECT                                                                                                                    ' + #13#10 +
  '  DM.CD_MERCADORIA AS [GM]                                                                                                  ' + #13#10 +
  '  ,CASE WHEN                                                                                                                ' + #13#10 +
  '  ( SELECT COUNT(*) FROM BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) WHERE DM.NR_PROCESSO = TP.NR_PROCESSO ) = 1             ' + #13#10 +
  '  AND ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 2 THEN         ' + #13#10 +
  '  DM.QT_MERC_UN_COMERC / 2 ELSE DM.QT_MERC_UN_COMERC END AS [QTDE]                                                          ' + #13#10 +
  '  ,DM.NR_ADICAO AS [ADIÇÃO]                                                                                                 ' + #13#10 +
  '  ,DM.CD_NCM_SH AS [NCM]                                                                                                    ' + #13#10 +
  '  ,CASE WHEN                                                                                                                ' + #13#10 +
  '  ( SELECT COUNT(*) FROM BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) WHERE DM.NR_PROCESSO = TP.NR_PROCESSO ) = 1             ' + #13#10 +
  '  AND ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 2 THEN         ' + #13#10 +
  '  DM.VL_BASE_CALC_II / 2 ELSE DM.VL_BASE_CALC_II END AS [VALOR TOTAL - R$]                                                  ' + #13#10 +
  '  ,CASE WHEN                                                                                                                ' + #13#10 +
  '  ( SELECT COUNT(*) FROM BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) WHERE DM.NR_PROCESSO = TP.NR_PROCESSO ) = 1             ' + #13#10 +
  '  AND ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 2 THEN         ' + #13#10 +
  '  ( DM.VL_BASE_CALC_II / 2 ) /                                                                                              ' + #13#10 +
  '                           (CASE WHEN                                                                                       ' + #13#10 +
  '  ( SELECT COUNT(*) FROM BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) WHERE DM.NR_PROCESSO = TP.NR_PROCESSO ) = 1             ' + #13#10 +
  '  AND ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 2 THEN         ' + #13#10 +
  '  DM.QT_MERC_UN_COMERC / 2 ELSE DM.QT_MERC_UN_COMERC END )                                                                  ' + #13#10 +
  '          ELSE DM.VL_BASE_CALC_II /                                                                                         ' + #13#10 +
  '                            (CASE WHEN                                                                                      ' + #13#10 +
  '  ( SELECT COUNT(*) FROM BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) WHERE DM.NR_PROCESSO = TP.NR_PROCESSO ) = 1             ' + #13#10 +
  '  AND ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 2 THEN         ' + #13#10 +
  '  DM.QT_MERC_UN_COMERC / 2 ELSE DM.QT_MERC_UN_COMERC END)  END AS [VALOR UNITÁRIO - R$]                                     ' + #13#10 +
  '  FROM BROKER.dbo.TPROCESSO TP (NOLOCK)                                                                                     ' + #13#10 +
  '  LEFT JOIN BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) ON DM.NR_PROCESSO = TP.NR_PROCESSO                                   ' + #13#10 +
  '  WHERE TP.NR_PROCESSO = :NR_PROCESSO                                                                                       ' + #13#10 +
  '  AND DM.NR_CNTR =                                                                                                          ' + #13#10 +
  '  CASE                                                                                                                      ' + #13#10 +
  '  WHEN ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO) > 1 THEN         ' + #13#10 +
  '  ( SELECT TOP 1 PC.NR_CNTR FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)                                                      ' + #13#10 +
  '  WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ORDER BY PC.NR_CNTR DESC)                                                           ' + #13#10 +
  '  ELSE '''' END  ';

end;



function TIntegracaoNota.getSqlDraftDanfePesoCntr1: String;
begin
  Result :=
  '  SELECT                                                                                                                           ' + #13#10 +
  '  CASE WHEN                                                                                                                        ' + #13#10 +
  '  ( SELECT COUNT(*) FROM BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) WHERE DM.NR_PROCESSO = TP.NR_PROCESSO ) = 1                    ' + #13#10 +
  '  AND ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 2 THEN                ' + #13#10 +
  '  SUM(DM.PL_MERCADORIA) / 2 ELSE SUM(DM.PL_MERCADORIA) END AS [PESO LIQUIDO]                                                       ' + #13#10 +
  '  ,CASE WHEN                                                                                                                       ' + #13#10 +
  '  ( SELECT COUNT(*) FROM BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) WHERE DM.NR_PROCESSO = TP.NR_PROCESSO ) = 1                    ' + #13#10 +
  '  AND ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 2 THEN                ' + #13#10 +
  '  REPLACE(SUM(DM.PB_MERCADORIA)/2,''.'','','') ELSE REPLACE(SUM(DM.PB_MERCADORIA),''.'','','') END [PESO BRUTO]                    ' + #13#10 +
  '  FROM BROKER.dbo.TPROCESSO TP (NOLOCK)                                                                                            ' + #13#10 +
  '  LEFT JOIN BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) ON DM.NR_PROCESSO = TP.NR_PROCESSO                                          ' + #13#10 +
  '  WHERE TP.NR_PROCESSO = :NR_PROCESSO                                                                                              ' + #13#10 +
  '  AND DM.NR_CNTR =                                                                                                                 ' + #13#10 +
  '  ( SELECT TOP 1 PC.NR_CNTR FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ORDER BY PC.NR_CNTR)  ' + #13#10 +
  '  GROUP BY TP.NR_PROCESSO            ';
end;



function TIntegracaoNota.getSqlDraftDanfePesoCntr2: String;
begin
  Result :=
  '  SELECT                                                                                                                                  ' + #13#10 +
  '  CASE WHEN                                                                                                                               ' + #13#10 +
  '  ( SELECT COUNT(*) FROM BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) WHERE DM.NR_PROCESSO = TP.NR_PROCESSO ) = 1                           ' + #13#10 +
  '  AND ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 2 THEN                       ' + #13#10 +
  '  ISNULL(SUM(DM.PL_MERCADORIA)/2,0) ELSE ISNULL(SUM(DM.PL_MERCADORIA),0) END AS [PESO LIQUIDO]                                            ' + #13#10 +
  '  ,CASE WHEN                                                                                                                              ' + #13#10 +
  '  ( SELECT COUNT(*) FROM BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) WHERE DM.NR_PROCESSO = TP.NR_PROCESSO ) = 1                           ' + #13#10 +
  '  AND ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 2 THEN                       ' + #13#10 +
  '  ISNULL(REPLACE(SUM(DM.PB_MERCADORIA)/2,''.'','',''),0) ELSE ISNULL(REPLACE(SUM(DM.PB_MERCADORIA),''.'','',''),0) END AS [PESO BRUTO]    ' + #13#10 +
  '  FROM BROKER.dbo.TPROCESSO TP (NOLOCK)                                                                                                   ' + #13#10 +
  '  LEFT JOIN BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) ON DM.NR_PROCESSO = TP.NR_PROCESSO                                                 ' + #13#10 +
  '  WHERE TP.NR_PROCESSO = :NR_PROCESSO                                                                                                     ' + #13#10 +
  '  AND DM.NR_CNTR =                                                                                                                        ' + #13#10 +
  '  CASE WHEN                                                                                                                               ' + #13#10 +
  '  (( SELECT COUNT(*) FROM BROKER.DBO.TDETALHE_MERCADORIA DM (NOLOCK) WHERE DM.NR_PROCESSO = TP.NR_PROCESSO ) = 1                          ' + #13#10 +
  '  AND ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ) = 2) THEN                      ' + #13#10 +
  '  ( SELECT TOP 1 PC.NR_CNTR FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ORDER BY PC.NR_CNTR)         ' + #13#10 +
  '  ELSE                                                                                                                                    ' + #13#10 +
  '  (CASE                                                                                                                                   ' + #13#10 +
  '  WHEN ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO) > 1 THEN                       ' + #13#10 +
  '  ( SELECT TOP 1 PC.NR_CNTR FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = TP.NR_PROCESSO ORDER BY PC.NR_CNTR DESC)    ' + #13#10 +
  '  ELSE '''' END )                                                                                                                         ' + #13#10 +
  '  END                                                                                                                                     ' + #13#10 +
  '  GROUP BY TP.NR_PROCESSO          ';
end;





function TIntegracaoNota.getSqlDraftDanfeCntr1: String;
begin
  Result :=
  '  SELECT TOP 1                                                                ' + #13#10 +
  '  ''01 CONTAINERS '' + RTRIM(TC.NM_TP_CNTR) + '' '' + PC.NR_CNTR AS [TEXTO]   ' + #13#10 +
  '  FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)                                  ' + #13#10 +
  '  LEFT JOIN BROKER.DBO.TTP_CNTR TC (NOLOCK) on TC.TP_CNTR = PC.TP_CNTR        ' + #13#10 +
  '  WHERE PC.NR_PROCESSO = :NR_PROCESSO                                         ' + #13#10 +
  '  ORDER BY PC.NR_CNTR   ';
end;


function TIntegracaoNota.getSqlDraftDanfeCntr2: String;
begin
  Result :=
  '  SELECT TOP 1                                                                                                       ' + #13#10 +
  '  CASE WHEN                                                                                                          ' + #13#10 +
  '  ( SELECT COUNT(*) FROM BROKER.DBO.TPROCESSO_CNTR PC1 (NOLOCK) WHERE PC1.NR_PROCESSO = PC.NR_PROCESSO ) > 1 THEN    ' + #13#10 +
  '  ''01 CONTAINERS '' + RTRIM(TC.NM_TP_CNTR) + '' '' + PC.NR_CNTR                                                     ' + #13#10 +
  '  ELSE '''' END   AS [TEXTO]                                                                                         ' + #13#10 +
  '  FROM BROKER.DBO.TPROCESSO_CNTR PC (NOLOCK)                                                                         ' + #13#10 +
  '  LEFT JOIN BROKER.DBO.TTP_CNTR TC (NOLOCK) on TC.TP_CNTR = PC.TP_CNTR                                               ' + #13#10 +
  '  WHERE PC.NR_PROCESSO = :NR_PROCESSO                                                                                ' + #13#10 +
  '  GROUP BY TC.NM_TP_CNTR, PC.NR_CNTR, PC.NR_PROCESSO                                                                 ' + #13#10 +
  '  ORDER BY PC.NR_CNTR DESC   ';
end;




end.

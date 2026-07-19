unit uIntegracaoNotaEssity;

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
    procedure gerarDraft;
    procedure criaPlanilha;
    procedure preencheExcelCabecalho;
    procedure preencheExcelItens;
    function getSqlDraftDanfeCabecalho: String;
    function getSqlDraftDanfeItens: String;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  Tfrm_integracao_nota_essity = class(TForm)
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
  frm_integracao_nota_essity: Tfrm_integracao_nota_essity;

implementation

uses PGGP001, PGSM018, PGSM010, PGSM024, PGFT024, GSMLIB, PGGP017, PGSM105, ConsOnLineEx, KrDialog;

{$R *.DFM}

procedure Tfrm_integracao_nota_essity.btn_cd_unid_negClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    mskedt_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',nil);
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', mskedt_cd_unid_neg.Text,'AP_UNID_NEG');
  End;
end;

procedure Tfrm_integracao_nota_essity.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_integracao_nota_essity.mskedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = mskedt_cd_unid_neg then btn_cd_unid_negClick(nil);
  end;
end;

procedure Tfrm_integracao_nota_essity.mskedt_cd_unid_negExit(Sender: TObject);
begin
  if (edt_nm_unid_neg.Text = '') and (mskedt_cd_unid_neg.Text <> '') then
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', mskedt_cd_unid_neg.Text,'AP_UNID_NEG')
  else
    Exit;
end;

procedure Tfrm_integracao_nota_essity.btn_geraplanilhaClick(
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

end;

destructor TIntegracaoNota.Destroy;
begin
  queryDraftDanfeCabecalho.Free;
  queryDraftDanfeItens.Free;
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
  LinhaItem := 17;
  pastaPlanilha := 'C:\DDBROKER\NOTA FISCAL\';

  queryDraftDanfeCabecalho.SQL.Text := getSqlDraftDanfeCabecalho;
  queryDraftDanfeCabecalho.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeCabecalho.Open;

  queryDraftDanfeItens.SQL.Text := getSqlDraftDanfeItens;
  queryDraftDanfeItens.paramByName('NR_PROCESSO').AsString := numeroProcesso ;
  queryDraftDanfeItens.Open;


  try
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    nomePlanilha := numeroProcesso + '_ESSITY' + '.XLS';
    criaPlanilha;
    try
      preencheExcelCabecalho;
      queryDraftDanfeItens.First;
      while not queryDraftDanfeItens.Eof do
      begin
        preencheExcelItens;
        queryDraftDanfeItens.Next;
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
  end;
end;

procedure TIntegracaoNota.criaPlanilha;
begin
    try
      Excel := CreateOLEObject('Excel.Application');
      xlWorkB1 := Excel.Workbooks.Open('C:\ddbroker\Modelo DRAFT DANFE Essity.xls');
      oSheet := Excel.WorkBooks[1].Worksheets[1];
//      Excel.Visible := True;
    except
      BoxMensagem('Erro na criação da Planilha. Verifique se a Planilha não está em uso ou se o Excel está aberto.',2) ;
      Exit;
    end;
end;

procedure TIntegracaoNota.preencheExcelCabecalho;
begin

  oSheet.Cells[02,02].value := queryDraftDanfeCabecalho.FieldByName('DI').AsString;
  oSheet.Cells[03,02].value := queryDraftDanfeCabecalho.FieldByName('CFOP').AsString;
  oSheet.Cells[04,02].value := queryDraftDanfeCabecalho.FieldByName('TX DI').AsFloat;
  oSheet.Cells[05,02].value := queryDraftDanfeCabecalho.FieldByName('DATA DESEMBARAÇO').AsString;
  oSheet.Cells[06,02].value := queryDraftDanfeCabecalho.FieldByName('DATA DI').AsString;
  oSheet.Cells[07,02].value := queryDraftDanfeCabecalho.FieldByName('EXPORTADOR').AsString;
  oSheet.Cells[08,02].value := queryDraftDanfeCabecalho.FieldByName('ARMAZÉM DESCARGA').AsString;
  oSheet.Cells[09,02].value := queryDraftDanfeCabecalho.FieldByName('Qtde Volumes').AsString;
  oSheet.Cells[10,02].value := queryDraftDanfeCabecalho.FieldByName('Volume').AsString;
  oSheet.Cells[11,02].value := queryDraftDanfeCabecalho.FieldByName('PESO LIQ').AsFloat;
  oSheet.Cells[12,02].value := queryDraftDanfeCabecalho.FieldByName('PESO BRUTO').AsFloat;

  oSheet.Cells[03,05].value := queryDraftDanfeCabecalho.FieldByName('MOEDA FRETE').AsString;
  oSheet.Cells[04,05].value := queryDraftDanfeCabecalho.FieldByName('FRETE').AsFloat;

  oSheet.Cells[03,12].value := queryDraftDanfeCabecalho.FieldByName('TAXA SISCOMEX').AsString;
  oSheet.Cells[03,14].value := queryDraftDanfeCabecalho.FieldByName('AFRMM').AsString;

  oSheet.Cells[01,16].value := queryDraftDanfeCabecalho.FieldByName('DATA DI').AsString;
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
  ColunaItem := 2;
  oSheet.Cells[LinhaItem,ColunaItem].value := queryDraftDanfeItens.FieldByName('NCM').AsString;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('VALOR ADUANEIRO (CIF)').AsFloat;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('FRETE').AsFloat;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('ALIQ. II').AsFloat;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('VALOR II').AsFloat;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('ALIQ. IPI').AsFloat;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('VALOR IPI').AsFloat;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('ALIQ. COFINS').AsFloat;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('VALOR COFINS').AsFloat;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('ALIQ. PIS').AsFloat;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('VALOR PIS').AsFloat;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('SISCO E AFRMM').AsFloat;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('BASE ICMS').AsFloat;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('ALIQ. ICMS').AsFloat;
  oSheet.Cells[LinhaItem,AddColuna].value := queryDraftDanfeItens.FieldByName('VALOR ICMS').AsFloat;
  Inc(LinhaItem);

end;



function TIntegracaoNota.getSqlDraftDanfeCabecalho: String;
begin
  Result :=
	' SELECT ' + #13#10 +
	' TP.NR_DI AS [DI] ' + #13#10 +
	' ,(SELECT TOP 1 AI.CD_CFOP FROM BROKER.dbo.TADICAO_DE_IMPORTACAO AI (NOLOCK) WHERE AI.NR_PROCESSO = TP.NR_PROCESSO) AS [CFOP] ' + #13#10 +
	' ,DI.TX_MLE AS [TX DI] ' + #13#10 +
	' ,CONVERT(varchar(10),EV088.DT_REALIZACAO,104) AS [DATA DESEMBARAÇO] ' + #13#10 +
	' ,CONVERT(varchar(10),DI.DT_DI,104) AS [DATA DI] ' + #13#10 +
	' ,EE.NM_EMPRESA AS [EXPORTADOR] ' + #13#10 +
	' ,RA.DESCRICAO AS [ARMAZÉM DESCARGA] ' + #13#10 +
	' ,EC.QT_VOLUME_CARGA AS [Qtde Volumes] ' + #13#10 +
	' ,E.DESCRICAO AS [Volume] ' + #13#10 +
	' ,DI.PL_CARGA AS [PESO LIQ] ' + #13#10 +
	' ,DI.PB_CARGA AS [PESO BRUTO] ' + #13#10 +
	' ,MF.AP_MOEDA AS [MOEDA FRETE] ' + #13#10 +
	' ,DI.TX_FRETE AS [FRETE] ' + #13#10 +
	' ,SUM(VL_TX_SCX_AD) AS [TAXA SISCOMEX] ' + #13#10 +
	' ,SUM(AI.VL_AFRMM) AS [AFRMM] ' + #13#10 +

	' FROM BROKER.dbo.TPROCESSO TP (NOLOCK) ' + #13#10 +

	' LEFT JOIN BROKER.dbo.TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = TP.NR_PROCESSO ' + #13#10 +
	' LEFT JOIN BROKER.dbo.TADICAO_DE_IMPORTACAO AI (NOLOCK) ON AI.NR_PROCESSO = TP.NR_PROCESSO ' + #13#10 +
	' LEFT JOIN BROKER.dbo.TMOEDA_BROKER MF (NOLOCK) ON MF.CD_MOEDA = DI.CD_MOEDA_FRETE ' + #13#10 +
	' LEFT JOIN BROKER.dbo.TEMBALAGEM_CARGA EC (NOLOCK) ON EC.NR_PROCESSO = TP.NR_PROCESSO ' + #13#10 +
	' LEFT JOIN BROKER.dbo.TTP_EMBALAGEM E (NOLOCK) ON E.CODIGO = EC.CD_TIPO_EMBALAGEM ' + #13#10 +
	' LEFT JOIN BROKER.dbo.TREC_ALFANDEGADO RA (NOLOCK) ON RA.CODIGO = DI.CD_RECINTO_ALFAND ' + #13#10 +
	' LEFT JOIN BROKER.dbo.TEMPRESA_EST EE (NOLOCK) ON EE.CD_EMPRESA = DI.CD_FORNECEDOR ' + #13#10 +
	' LEFT JOIN BROKER.dbo.TFOLLOWUP EV088 (NOLOCK) ON EV088.NR_PROCESSO = TP.NR_PROCESSO AND EV088.CD_EVENTO=''088'' ' + #13#10 +

	' WHERE TP.NR_PROCESSO = :NR_PROCESSO ' + #13#10 +

	' GROUP BY TP.NR_DI, TP.NR_PROCESSO, DI.PL_CARGA, DI.PB_CARGA, DI.TX_FRETE, MF.AP_MOEDA,  ' + #13#10 +
	' EC.QT_VOLUME_CARGA, E.DESCRICAO, RA.DESCRICAO, EE.NM_EMPRESA, DI.DT_DI, EV088.DT_REALIZACAO, DI.TX_MLE ';

end;

function TIntegracaoNota.getSqlDraftDanfeItens: String;
begin
  Result :=
	' SELECT  ' + #13#10 +
	' AI.NR_ADICAO AS [ADIÇÃO] ' + #13#10 +
	' ,AI.CD_NCM_SH AS [NCM] ' + #13#10 +
	' ,AI.VL_BASE_CALC_II AS [VALOR ADUANEIRO (CIF)] ' + #13#10 +
	' ,AI.VL_FRETE_MERC_MN AS [FRETE] ' + #13#10 +
	' ,(SELECT  ' + #13#10 +
	'      CASE  ' + #13#10 +
	'      WHEN T.CD_TIPO_ALIQ_IPT=''1'' THEN T.PC_ALIQ_NORM_ADVAL ELSE T.PC_ALIQ_REDUZIDA END FROM BROKER.DBO.TRIBUTO T (NOLOCK)  ' + #13#10 +
	'      WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0001''  ' + #13#10 +
	'      ) AS [ALIQ. II] ' + #13#10 +
	'  ,(SELECT T.VL_IPT_A_RECOLHER FROM BROKER.DBO.TRIBUTO T (NOLOCK)  ' + #13#10 +
	'      WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0001''  ' + #13#10 +
	'      ) AS [VALOR II] ' + #13#10 +
	'  ,(SELECT  ' + #13#10 +
	'      CASE ' + #13#10 +
	'      WHEN T.CD_TIPO_ALIQ_IPT=''1'' THEN T.PC_ALIQ_NORM_ADVAL ELSE T.PC_ALIQ_REDUZIDA END FROM BROKER.DBO.TRIBUTO T (NOLOCK)  ' + #13#10 +
	'      WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0002''  ' + #13#10 +
	'      ) AS [ALIQ. IPI] ' + #13#10 +
	'  ,(SELECT T.VL_IPT_A_RECOLHER FROM BROKER.DBO.TRIBUTO T (NOLOCK)  ' + #13#10 +
	'      WHERE T.NR_PROCESSO = TP.NR_PROCESSO AND T.NR_ADICAO = AI.NR_ADICAO AND T.CD_RECEITA_IMPOSTO = ''0002''  ' + #13#10 +
	'      ) AS [VALOR IPI] ' + #13#10 +
	'   ,AI.ALIQ_COFINS AS [ALIQ. COFINS] ' + #13#10 +
	'   ,AI.VL_COFINS AS [VALOR COFINS] ' + #13#10 +
	'   ,AI.ALIQ_PIS AS [ALIQ. PIS] ' + #13#10 +
	'   ,AI.VL_PIS AS [VALOR PIS] ' + #13#10 +
	'   ,AI.VL_TX_SCX_AD AS [TAXA SISCOMEX] ' + #13#10 +
	'   ,AI.VL_BASE_CALC_ICMS_AFRMM AS [BASE ICMS] ' + #13#10 +
	'   ,AI.PC_ICMS AS [ALIQ. ICMS] ' + #13#10 +
	'   ,AI.VL_ICMS_A_RECOLHER_AFRMM AS [VALOR ICMS] ' + #13#10 +
  '   ,AI.VL_TX_SCX_AD + AI.VL_AFRMM AS [SISCO E AFRMM] ' + #13#10 +

	' FROM BROKER.dbo.TPROCESSO TP (NOLOCK) ' + #13#10 +

	' LEFT JOIN BROKER.DBO.TADICAO_DE_IMPORTACAO AI (NOLOCK) ON AI.NR_PROCESSO = TP.NR_PROCESSO ' + #13#10 +

	' WHERE TP.NR_PROCESSO = :NR_PROCESSO ' + #13#10 +

	' ORDER BY AI.NR_ADICAO ';
end;


end.

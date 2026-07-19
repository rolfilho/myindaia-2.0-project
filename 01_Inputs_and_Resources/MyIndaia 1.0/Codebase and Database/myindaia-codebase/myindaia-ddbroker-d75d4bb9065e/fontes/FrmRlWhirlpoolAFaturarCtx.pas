unit FrmRlWhirlpoolAFaturarCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlWhirlpoolAFaturarCtx = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSelect: string;
  public
    { Public declarations }
  end;

var
  FormRlWhirlpoolAFaturarCtx: TFormRlWhirlpoolAFaturarCtx;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TFormRlWhirlpoolAFaturarCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRlWhirlpoolAFaturarCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);
    
    Form.TituloRelatorio := 'A Faturar Whirlpool';

    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        MessageDlg('Data inicial maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;

    Form.qryMain.SQL.Text := GetSelect;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

function TFormRlWhirlpoolAFaturarCtx.GetSelect: string;
begin
  Result :=
  ' SELECT TP.NR_PROCESSO                                AS [Ref.INDAIA]                                     ' + sLineBreak +
  ' 	     ,EN.NM_EMPRESA                                AS [Cliente]                                        ' + sLineBreak +
  ' 	     ,SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+                                                             ' + sLineBreak +
  ' 	     SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+                                                              ' + sLineBreak +
  ' 	     SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+                                                              ' + sLineBreak +
  ' 	     SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+                                                              ' + sLineBreak +
  ' 	     SUBSTRING(EN.CGC_EMPRESA,13,2)                AS [CNPJ]                                           ' + sLineBreak +
  ' 	     ,CONVERT(VARCHAR(10),EV088.DT_REALIZACAO,103) AS [Desembaraço]                                    ' + sLineBreak +
  ' 	     ,CONVERT(VARCHAR(10),EV041.DT_REALIZACAO,103) AS [Lib. Processo para transporte]                  ' + sLineBreak +
  ' 	     ,A.NM_AREA                                    AS [Área]                                           ' + sLineBreak +
  ' 	     ,URF.DESCRICAO                                AS [Aduana]                                         ' + sLineBreak +
  ' 	     ,CI.VL_NUM_TAXA                               AS [Valor (R$)]                                     ' + sLineBreak +
  ' 	     ,CI2.VL_NUM_TAXA                              AS [Honorários]                                     ' + sLineBreak +
  '  FROM BROKER.DBO.TPROCESSO                   TP	   (NOLOCK)                                              ' + sLineBreak +
  ' INNER JOIN BROKER.DBO.TEMPRESA_NAC           EN    (NOLOCK) ON EN.CD_EMPRESA     = TP.CD_CLIENTE         ' + sLineBreak +
  ' INNER JOIN BROKER.DBO.TFOLLOWUP              EV088 (NOLOCK) ON EV088.NR_PROCESSO = TP.NR_PROCESSO        ' + sLineBreak +
  '                                                            AND EV088.CD_EVENTO   = ''088''               ' + sLineBreak +
  ' INNER JOIN BROKER.DBO.TFOLLOWUP              EV041 (NOLOCK) ON EV041.NR_PROCESSO = TP.NR_PROCESSO        ' + sLineBreak +
  '                                                            AND EV041.CD_EVENTO   = ''041''               ' + sLineBreak +
  ' INNER JOIN BROKER.DBO.TAREA                  A     (NOLOCK) ON A.CD_AREA         = TP.CD_AREA            ' + sLineBreak +
  ' INNER JOIN BROKER.DBO.TDECLARACAO_IMPORTACAO DI    (NOLOCK) ON DI.NR_PROCESSO    = TP.NR_PROCESSO        ' + sLineBreak +
  ' INNER JOIN BROKER.DBO.TURF                   URF   (NOLOCK) ON URF.CODIGO        = DI.CD_URF_DESPACHO    ' + sLineBreak +
  ' INNER JOIN BROKER.DBO.TRECEITAS_IMP          CI    (NOLOCK) ON CI.CD_CLIENTE     = TP.CD_CLIENTE         ' + sLineBreak +
  ' 									         	                               AND CI.CD_UNID_NEG    = TP.CD_UNID_NEG        ' + sLineBreak +
  ' 									         	                               AND CI.CD_PRODUTO     = TP.CD_PRODUTO         ' + sLineBreak +
  ' 									         	                               AND CI.CD_SERVICO     = TP.CD_SERVICO         ' + sLineBreak +
  ' 									         	                               AND CI.CD_ITEM        = ''807''               ' + sLineBreak +
  ' 									         	                               AND CI.CD_MOEDA_TAXA  = ''790''               ' + sLineBreak +
  ' INNER JOIN BROKER.DBO.TRECEITAS_IMP          CI2   (NOLOCK) ON CI2.CD_CLIENTE    = TP.CD_CLIENTE         ' + sLineBreak +
  ' 									         			                           AND CI2.CD_UNID_NEG   = TP.CD_UNID_NEG        ' + sLineBreak +
  ' 									         			                           AND CI2.CD_PRODUTO    = TP.CD_PRODUTO         ' + sLineBreak +
  ' 									         			                           AND CI2.CD_SERVICO    = TP.CD_SERVICO         ' + sLineBreak +
  ' 									         			                           AND CI2.CD_ITEM       = ''822''               ' + sLineBreak +
  ' 									         			                           AND CI2.CD_MOEDA_TAXA = ''790''			         ' + sLineBreak +
  ' WHERE TP.CD_GRUPO=''A77''		                                                                             ' + sLineBreak +
  '   AND ( EV041.DT_REALIZACAO >= ' + DateToSQL(DataInicial)  +
  '   AND   EV041.DT_REALIZACAO < ' + DateToSQL(DataFinal + 1) + ' )                                         ' + sLineBreak ;
end;



end.

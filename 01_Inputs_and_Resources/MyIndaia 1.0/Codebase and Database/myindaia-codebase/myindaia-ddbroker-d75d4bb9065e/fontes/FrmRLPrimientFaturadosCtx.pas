unit FrmRLPrimientFaturadosCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRLPrimientFaturadosCtx = class(TForm)
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
//    function GetWhere: string;
  public
    { Public declarations }
  end;

var
  FormRLPrimientFaturadosCtx: TFormRLPrimientFaturadosCtx;

implementation

{$R *.dfm}

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{ TForm3 }

function TFormRLPrimientFaturadosCtx.GetSelect: string;
begin
  Result :=
    ' WITH DADOS_BILLING AS (																		                                        					'+ sLineBreak +
    '   SELECT  																							                                              			'+ sLineBreak +
  	' 	''RPS'' AS TP_NF1																							                                          	'+ sLineBreak +
  	' 	,B.seniorKey AS NR_RPS  																				                                      		'+ sLineBreak +
  	' 	,B.NR_NOTA AS NR_NFE  																						                                      	'+ sLineBreak +
  	' 	,TP.NR_PROCESSO AS NR_PROCESSO  																			                                  	'+ sLineBreak +
  	' 	,CONVERT(VARCHAR(10),B.CREATED,103) AS DT_EMISSAO  														                        		'+ sLineBreak +
    '     ,TP.CD_CLIENTE 																							                                          	'+ sLineBreak +
  	' 	,ISNULL(B.total,0) VALOR_RPS  																	                                  				'+ sLineBreak +
  	' 	,''FT'' AS TP_NF2																							                                          	'+ sLineBreak +
  	' 	,'''' AS PRESTACAO  																						                                        	'+ sLineBreak +
  	' 	,0 AS VALOR_FT  																							                                          	'+ sLineBreak +
    '   FROM MYINDAIAV2.DBO.BILLING B (NOLOCK)  																	                              	'+ sLineBreak +
    '   JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK) ON BII.BILLING_ID = B.ID  							          	'+ sLineBreak +
    '   JOIN MYINDAIAV2.DBO.ITEMINVOICED II (NOLOCK) ON II.ID = BII.ITENSINVOICED_ID  								          	'+ sLineBreak +
    '   JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC (NOLOCK) ON CC.ID = II.CUSTOMCLEARANCE_ID  						        		'+ sLineBreak +
    '   JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = CC.CUSTOMID  									              		'+ sLineBreak +
    '   WHERE TP.CD_GRUPO = ''C54''  																		                                    			'+ sLineBreak +
    '     AND B.TYPE = ''TAX_INVOICE''  																	                                  			'+ sLineBreak +
    '     AND B.STATUS = ''INVOICED''  																				                                  	'+ sLineBreak +
    '     AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)                          + sLineBreak +
//    '     AND TP.CD_PRODUTO = ''02''                                      											                 	'+ sLineBreak +
	  ' 																										                                                   			'+ sLineBreak +
    '   UNION ALL  																				                        				                      	'+ sLineBreak +
  	' 																									                                                 			  	'+ sLineBreak +
    '   SELECT  																							                          		                    	'+ sLineBreak +
  	' 	''RPS'' AS TP_NF1																						                                          		'+ sLineBreak +
  	' 	,0 AS VALOR_RPS  																						                                          		'+ sLineBreak +
  	' 	,0 AS NR_NFE  																								                                           	'+ sLineBreak +
  	' 	,TP.NR_PROCESSO AS NR_PROCESSO  																	                                 		  	'+ sLineBreak +
  	' 	,CONVERT(VARCHAR(10),B.CREATED,103) AS DT_EMISSAO  											                    			    		'+ sLineBreak +
  	' 	,TP.CD_CLIENTE  																							                                           	'+ sLineBreak +
  	' 	,0 AS VALOR_RPS																									                                          '+ sLineBreak +
  	' 	,''FT'' AS TP_NF2																								                                          '+ sLineBreak +
    '     ,ISNULL(B.seniorKey,B.ID) AS PRESTACAO  																	                            	'+ sLineBreak +
    ' 	,sum(II.price) AS VALOR_FT  																				                                    	'+ sLineBreak +
    '   FROM MYINDAIAV2.DBO.BILLING B (NOLOCK)  																	                                '+ sLineBreak +
    '   JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK) ON BII.BILLING_ID = B.ID  		                      '+ sLineBreak +
    '   JOIN MYINDAIAV2.DBO.ITEMINVOICED II (NOLOCK) ON II.ID = BII.ITENSINVOICED_ID  				                    '+ sLineBreak +
    '   JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC (NOLOCK) ON CC.ID = II.CUSTOMCLEARANCE_ID  								        '+ sLineBreak +
    '   JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = CC.CUSTOMID  											              '+ sLineBreak +
    '   WHERE TP.CD_GRUPO = ''C54''  																					                                    '+ sLineBreak +
    '     AND B.TYPE = ''TAX_RECEIPT''  																				                                  '+ sLineBreak +
    '     AND B.STATUS = ''INVOICED''  																					                                  '+ sLineBreak +
      '     AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)                          + sLineBreak +
//    '     AND TP.CD_PRODUTO = ''02''                                   												                    '+ sLineBreak +
    '   GROUP BY B.CREATED, TP.NR_PROCESSO, B.SENIORKEY, B.ID, TP.CD_CLIENTE, B.TOTAL  									          '+ sLineBreak +
    ' )  																												                                                  '+ sLineBreak +
  	' 																													                                                  '+ sLineBreak +
    ' SELECT  																											                                              '+ sLineBreak +
    '   TP_NF1 AS [Série NF]																							                                        '+ sLineBreak +
  	'   ,MAX(NR_RPS) AS [Nº Nota Fiscal]  																				                                '+ sLineBreak +
  	'   ,MAX(NR_NFE) AS [NF Serviço] 																					                                    '+ sLineBreak +
  	'   ,NR_PROCESSO AS [Processo]  																					                                    '+ sLineBreak +
  	'   ,DT_EMISSAO AS [Emissão]  																						                                    '+ sLineBreak +
  	'   ,(SELECT  																										                                            '+ sLineBreak +
    '   EN.NM_EMPRESA FROM BROKER.DBO.TEMPRESA_NAC EN  																	                          '+ sLineBreak +
    '   WHERE EN.CD_EMPRESA = A.CD_CLIENTE) AS [CNPJ CLIENTE]  															                      '+ sLineBreak +
  	'   ,MAX(VALOR_RPS) AS [Valor Bruto] 																				                                  '+ sLineBreak +
  	'   ,TP_NF2 AS [Série NF]																							                                        '+ sLineBreak +
  	'   ,MAX(PRESTACAO) AS [Nº Nota Fiscal]																				                                '+ sLineBreak +
  	'   ,NR_PROCESSO AS [Processo]																						                                    '+ sLineBreak +
  	'   ,DT_EMISSAO AS [Emissão]																						                                      '+ sLineBreak +
  	'   ,(SELECT  																										                                            '+ sLineBreak +
    '   EN.NM_EMPRESA FROM BROKER.DBO.TEMPRESA_NAC EN  																	                          '+ sLineBreak +
    '   WHERE EN.CD_EMPRESA = A.CD_CLIENTE) AS [CNPJ CLIENTE]  															                      '+ sLineBreak +
  	'   ,MAX(VALOR_FT) AS [Valor Bruto]																					                                  '+ sLineBreak +
  	'   ,Cast(ISNULL(STUFF((SELECT DISTINCT '','' + LTRIM(RTRIM(R.CD_REFERENCIA))  										            '+ sLineBreak +
    '   FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK)  																	                          '+ sLineBreak +
    '   WHERE R.NR_PROCESSO = A.NR_PROCESSO  																			                                '+ sLineBreak +
    '   AND R.TP_REFERENCIA = ''21''  																					                                  '+ sLineBreak +
    '   FOR XML PATH('''')), 1, 1, ''''), '''')  																		                              '+ sLineBreak +
    '   as Varchar(300)) AS [Ref. Primary]  																			                                '+ sLineBreak +
    '   ,'''' AS [SP]  																									                                          '+ sLineBreak +
    ' FROM DADOS_BILLING A (NOLOCK)  																					                                    '+ sLineBreak +
    ' GROUP BY NR_PROCESSO, TP_NF1, DT_EMISSAO, A.CD_CLIENTE, TP_NF2													                    '+ sLineBreak +
    ' ORDER BY NR_PROCESSO 																								                                        '+ sLineBreak ;
end;

procedure TFormRLPrimientFaturadosCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRLPrimientFaturadosCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);

    Form.TituloRelatorio := 'Faturados Primient';

    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        MessageDlg('Data inicial maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;

      Form.qryMain.SQL.Text := GetSelect;
      Form.Executa;
     end;

  finally
    Form.Free;
  end;
end;


end.

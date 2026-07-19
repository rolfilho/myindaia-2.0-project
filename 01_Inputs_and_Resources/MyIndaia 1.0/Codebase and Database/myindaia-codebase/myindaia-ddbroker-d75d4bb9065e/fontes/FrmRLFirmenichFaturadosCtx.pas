unit FrmRLFirmenichFaturadosCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRLFirmenichFaturadosCtx = class(TForm)
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    edt_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
  private
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSelect: string;
    function GetWhere: string;
  public
    { Public declarations }
  end;

var
  FormRLFirmenichFaturadosCtx: TFormRLFirmenichFaturadosCtx;

implementation

{$R *.dfm}

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{ TForm3 }

function TFormRLFirmenichFaturadosCtx.GetSelect: string;
begin
  Result := ' SELECT DISTINCT																					                                                  						'+ sLineBreak +
            ' CAST(STUFF(( SELECT DISTINCT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA)) 											                      			'+ sLineBreak +
            ' FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) 																		                                  	'+ sLineBreak +
            ' WHERE RC.NR_PROCESSO      = TP.NR_PROCESSO																			                                    	'+ sLineBreak +
            ' AND RC.TP_REFERENCIA    = ''01'' 																						                                        	'+ sLineBreak +
            ' FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [Nr. Pedido],														                      	'+ sLineBreak +
            ' TP.nr_processo  AS [Ref .Indaiá],																						                                        	'+ sLineBreak +
            ' A.nm_area AS [Área],																									                                                '+ sLineBreak +
            ' RPS.seniorkey AS [RPS],																								                                              	'+ sLineBreak +
            ' FT.seniorkey AS [FT],																									                                              	'+ sLineBreak +
            ' NULL AS [NFSe],																										                                                    '+ sLineBreak +
            ' IIVV.NAME AS [Item],																								                                              		'+ sLineBreak +
            ' IIV.price AS [Valor],																									                                              	'+ sLineBreak +
            ' B.created AS [Data Faturamento]																		                                          					'+ sLineBreak +
            ' FROM   myindaiav2.dbo.billing B   (NOLOCK)																                                    				'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.billing_iteminvoiced BII (NOLOCK) ON BII.billing_id = B.id								                		'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.iteminvoiced II  (NOLOCK) ON II.id = BII.itensinvoiced_id									                  '+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.billing_paymentrequested BPR (NOLOCK) ON BPR.billing_id = B.id								              	'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.paymentrequested PR  (NOLOCK) ON PR.id = BPR.payments_id									                		'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.paymentrequested_itempaymentrequested  PIPR(NOLOCK) ON PIPR.paymentrequested_id = PR.id			'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.itempaymentrequested IR  (NOLOCK) ON IR.id = PIPR.items_id					                					'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.item I   (NOLOCK) ON I.id = IR.item_id													                            	'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.billing FT  (NOLOCK) ON FT.seniorkey = B.seniorkey								                    				'+ sLineBreak +
            ' AND B.type = ''TAX_RECEIPT''																					                                           			'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.billing RPS (NOLOCK) ON RPS.seniorkey = B.seniorkey			                  									'+ sLineBreak +
            ' AND B.type = ''TAX_INVOICE''												                                            											'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.billing_iteminvoiced IV  (NOLOCK) ON IV.billing_id = B.id							                 			'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.iteminvoiced IIV (NOLOCK) ON IIV.id = IV.itensinvoiced_id			                							'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.item IIVV(NOLOCK) ON IIVV.id = IIV.item_id											                        			'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.customclearance CC  (NOLOCK) ON CC.id = IIV.customclearance_id		                						'+ sLineBreak +
            ' LEFT JOIN broker.dbo.tprocesso TP  (NOLOCK) ON TP.nr_processo = CC.customid									                    			'+ sLineBreak +
            ' LEFT JOIN broker.dbo.tarea A   (NOLOCK) ON A.cd_area = TP.cd_area            					                  							'+ sLineBreak +
            ' WHERE B.status    = ''INVOICED''																			                                        				'+ sLineBreak +
            ' AND TP.cd_grupo = ''118''																						                                            			'+ sLineBreak +
            ' AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)                          + sLineBreak +
            ' UNION ALL																				                                                    									'+ sLineBreak +
            ' SELECT DISTINCT																					                                                  						'+ sLineBreak +
            ' CAST(STUFF(( SELECT DISTINCT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA))	                      													'+ sLineBreak +
            ' FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK)															                                      			'+ sLineBreak +
            ' WHERE RC.NR_PROCESSO      = TP.NR_PROCESSO			                                    																	'+ sLineBreak +
            ' AND RC.TP_REFERENCIA    = ''01''											                                        												'+ sLineBreak +
            ' FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [Nr. Pedido],		                        												'+ sLineBreak +
            ' TP.nr_processo AS [Ref .Indaiá],						                                        																	'+ sLineBreak +
            ' A.nm_area AS [Área],											                                              															'+ sLineBreak +
            ' NULL AS [RPS],																	                                                  										'+ sLineBreak +
            ' NULL AS [FT],																		                                                  										'+ sLineBreak +
            ' B.nr_nota AS [NFSe],																                                              										'+ sLineBreak +
            ' ''NOTA FISCAL'' AS [Item],															                                          										'+ sLineBreak +
            ' ISNULL(B.total,0) - ISNULL(b.ir,0) - ISNULL(b.cofins,0) - ISNULL(b.iss,0) AS [Valor],	              									'+ sLineBreak +
            ' B.created AS [Data Faturamento]										                                          													'+ sLineBreak +
            ' FROM   myindaiav2.dbo.billing B   (NOLOCK)							                                    													'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.billing_iteminvoiced BII (NOLOCK) ON BII.billing_id = B.id	                									'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.iteminvoiced II  (NOLOCK) ON II.id = BII.itensinvoiced_id          		      								'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.billing_iteminvoiced IV  (NOLOCK) ON IV.billing_id = B.id                										'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.iteminvoiced IIV (NOLOCK) ON IIV.id = IV.itensinvoiced_id		                								'+ sLineBreak +
            ' LEFT JOIN myindaiav2.dbo.customclearance CC  (NOLOCK) ON CC.id = IIV.customclearance_id	              								'+ sLineBreak +
            ' LEFT JOIN broker.dbo.tprocesso TP  (NOLOCK) ON TP.nr_processo = CC.customid						                    						'+ sLineBreak +
            ' LEFT JOIN broker.dbo.tarea A   (NOLOCK) ON A.cd_area = TP.cd_area            	                  											'+ sLineBreak +
            ' WHERE B.status    = ''INVOICED''																				                                        			'+ sLineBreak +
            ' AND TP.cd_grupo = ''118''																		                                            							'+ sLineBreak +
            ' AND B.type = ''TAX_INVOICE''														                                          										'+ sLineBreak +
            ' AND B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1)	          							+ sLineBreak;
end;

function TFormRLFirmenichFaturadosCtx.GetWhere: string;
begin
  Result := ' WHERE B.status    = ''INVOICED'' '+
            '   AND TP.cd_grupo = ''118''      ';
end;

procedure TFormRLFirmenichFaturadosCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRLFirmenichFaturadosCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);
  //  Filtros     := GetWhere;

    Form.TituloRelatorio := 'Faturados Firmenich';

    if (msk_cd_produto.Text <> '') then
      CatSQLAnd(Filtros, ' TP.CD_PRODUTO = ' + QuotedStr(msk_cd_produto.Text));

    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        MessageDlg('Data inicial maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;

//      CatSQLAnd(Filtros, ' B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1));
      Form.qryMain.SQL.Text := GetSelect;// + Filtros;
      Form.Executa;
     end;

  finally
    Form.Free;
  end;
end;

procedure TFormRLFirmenichFaturadosCtx.btn_co_produtoClick(
  Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TFormRLFirmenichFaturadosCtx.msk_cd_produtoExit(Sender: TObject);
begin
  btn_co_produtoClick(msk_cd_produto);
  ValCodEdt( msk_cd_produto );
end;

end.

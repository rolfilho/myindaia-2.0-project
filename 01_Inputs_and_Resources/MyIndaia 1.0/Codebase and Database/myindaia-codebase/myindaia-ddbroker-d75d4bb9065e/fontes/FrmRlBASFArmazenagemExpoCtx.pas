unit FrmRlBASFArmazenagemExpoCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlBASFArmazenagemExpoCtx = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    chbBasfSa: TCheckBox;
    chbBasfPoliuretanos: TCheckBox;
    chbChemetall: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSQLSelect: string;
  public
    { Public declarations }
    sEmpresa : String;
    sGrupo   : String;
  end;

var
  FormRlBASFArmazenagemExpoCtx: TFormRlBASFArmazenagemExpoCtx;

implementation

uses
  KrDialog, uConsulta, KrQuery;

{$R *.dfm}

procedure TFormRlBASFArmazenagemExpoCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

function TFormRlBASFArmazenagemExpoCtx.GetSQLSelect: string;
begin
   sgrupo := '';
   if chbBasfSa.checked then
    if sgrupo = '' then
      sgrupo := '''002'''
    else
      sgrupo := sgrupo + ', ' + '''002''';

   if chbBasfPoliuretanos.checked then
    if sgrupo = '' then
      sgrupo := '''013'''
    else
      sgrupo := sgrupo + ', ' + '''013''';

   if chbChemetall.checked then
    if sgrupo = '' then
      sgrupo := '''559'''
    else
      sgrupo := sgrupo + ', ' + '''559''';

  Result :=
   ' SELECT	DISTINCT TOP 10                                                                                                                     ' + sLineBreak +
   '        G.NM_GRUPO                                                    AS [GRUPO],                                                           ' + sLineBreak +
   '   	 		MASTER.DBO.ROWCONCAT(DISTINCT RTRIM(RC.CD_REFERENCIA)+'','')  AS [NO. FATURA],                                                      ' + sLineBreak +
   '   	 		EE.NM_EMPRESA  											                         	AS [IMPORTADOR],                                                      ' + sLineBreak +
   '   	 		A.NM_AREA      											                         	AS [SBU],                                                             ' + sLineBreak +
   '   	 		CON.NM_CONTATO 											                         	AS [ANALISTA],                                                        ' + sLineBreak +
   '   	 		TP.NR_PROCESSO 											                         	AS [REFERÊNCIA INDAIA],                                               ' + sLineBreak +
   '   	 		AGE.NM_AGENTE  											                         	AS [ARMADOR],                                                         ' + sLineBreak +
   '   	 		CONVERT(VARCHAR(10),EV315.DT_REALIZACAO,103)    			        AS [ENTRADA TERMINAL],                                                ' + sLineBreak +
   '   	 		CONVERT(VARCHAR(10),EV132.DT_REALIZACAO,103)    			        AS [SAIDA TERMINAL],                                                  ' + sLineBreak +
   '   	 		CONVERT(VARCHAR(10),TP.DT_CONHECIMENTO,103)     			        AS [DT. EMBARQUE],                                                    ' + sLineBreak +
   '   	 		'''' 														                              AS [DIAS EXCEDENTES],                                                 ' + sLineBreak +
   '   	 		'''' 														                              AS [FATOR GERADOR DA ESTADIA],                                        ' + sLineBreak +
   '   	 		AA.NM_ARMAZEM   								                              AS [TERMINAL],                                                        ' + sLineBreak +
   '   	 		IPR.PRICE       								                              AS [ARMAZENAGEM - VALOR],                                             ' + sLineBreak +
   '   	 		PR.RECEIVEDDATE 								                              AS [ARMAZENAGEM - DT. PGTO.],                                         ' + sLineBreak +
   '   	 		MASTER.DBO.ROWCONCAT(DISTINCT RTRIM(RES.CD_REFERENCIA)+'','') AS [RESERVA],                                                         ' + sLineBreak +
   '   	 		COUNT(C.TP_CNTR) 										                          AS [QTDE. CONTAINERES],                                               ' + sLineBreak +
   '   	 		TC.NM_TP_CNTR    										                          AS [TIPO DE CONTAINER],                                               ' + sLineBreak +
   '   	 		''''               									                          AS [OBSERVACAO]                                                       ' + sLineBreak +
   '    FROM MYINDAIAV2.DBO.PAYMENTREQUESTED                            PR    WITH(NOLOCK)                                                      ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED  PRIPR WITH(NOLOCK) ON PRIPR.PAYMENTREQUESTED_ID =	PR.ID                 ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED                   IPR   WITH(NOLOCK) ON IPR.ID                    =	PRIPR.ITEMS_ID        ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.ITEM                                   I     WITH(NOLOCK) ON I.ID                      =	IPR.ITEM_ID           ' + sLineBreak +
   '    LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                        CC    WITH(NOLOCK) ON CC.ID                     =	PR.CUSTOMCLEARANCE_ID ' + sLineBreak +
   '                                                                                                                                            ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TPROCESSO 							                    TP  	WITH(NOLOCK) ON TP.NR_PROCESSO 	          = CC.CUSTOMID           ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TGRUPO    							                    G   	WITH(NOLOCK) ON G.CD_GRUPO     	          = TP.CD_GRUPO           ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TREF_CLIENTE						                    RC  	WITH(NOLOCK) ON RC.NR_PROCESSO 	          = CC.CUSTOMID           ' + sLineBreak +
   '                                                                                      AND RC.TP_REFERENCIA          = ''19''                ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TREF_CLIENTE						                    RES 	WITH(NOLOCK) ON RES.NR_PROCESSO	          = CC.CUSTOMID           ' + sLineBreak +
   '                                                                                      AND RES.TP_REFERENCIA         = ''05''                ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TEMPRESA_EST						                    EE  	WITH(NOLOCK) ON EE.CD_EMPRESA  			      = TP.CD_IMPORTADOR      ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TAREA       						                    A   	WITH(NOLOCK) ON A.CD_AREA      			      = TP.CD_AREA            ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TCLIENTE_CONTATO 			                    CON 	WITH(NOLOCK) ON	CON.CD_CONTATO 			      = TP.CD_CONTATO         ' + sLineBreak +
   '    																	   				                                      AND TP.CD_CLIENTE  			      = CON.CD_CLIENTE        ' + sLineBreak +
   '    																	   				                                      AND CON.CD_PRODUTO 			      = TP.CD_PRODUTO         ' + sLineBreak +
   '    																	   				                                      AND CON.CD_UNID_NEG			      = TP.CD_UNID_NEG        ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TAGENTE   							                    AGE   WITH(NOLOCK) ON AGE.CD_AGENTE  			      = TP.CD_AGENTE          ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TFOLLOWUP 							                    EV315 WITH(NOLOCK) ON EV315.NR_PROCESSO         = TP.NR_PROCESSO        ' + sLineBreak +
   '                                                                                      AND EV315.CD_EVENTO           = ''315''               ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TFOLLOWUP 							                    EV132 WITH(NOLOCK) ON EV132.NR_PROCESSO         = TP.NR_PROCESSO        ' + sLineBreak +
   '                                                                                      AND EV132.CD_EVENTO           = ''132''               ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TARMAZEM  							                    AA    WITH(NOLOCK) ON TP.CD_ARMAZEM_ATRACACAO   = AA.CD_ARMAZEM         ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TPROCESSO_CNTR  				                    C     WITH(NOLOCK) ON C.NR_PROCESSO             = TP.NR_PROCESSO        ' + sLineBreak +
   '    LEFT JOIN BROKER.DBO.TTP_CNTR        				                    TC    WITH(NOLOCK) ON TC.TP_CNTR                = C.TP_CNTR             ' + sLineBreak +
   '                                                                                                                                            ' + sLineBreak +
   '    WHERE                                                                                                                                   ' + sLineBreak +
   '      	PR.STATUS=''APPROVED''                                                                                                              ' + sLineBreak +
   '    	AND G.CD_GRUPO IN ('+sGrupo+')                                                                                                        ' + sLineBreak +
   '    	AND TP.CD_PRODUTO = ''02''                                                                                                            ' + sLineBreak +
   '    	AND I.ID = 13                                                                                                                         ' + sLineBreak +
   '    	AND (PR.RECEIVEDDATE >= @DATAINICIAL AND PR.RECEIVEDDATE >= @DATAFINAL )                                                              ' + sLineBreak +
   '                                                                                                                                            ' + sLineBreak +
   '    GROUP BY CC.CUSTOMID,                                                                                                                   ' + sLineBreak +
   '    	   	G.NM_GRUPO,                                                                                                                       ' + sLineBreak +
   '    	   	TP.CD_UNID_NEG,                                                                                                                   ' + sLineBreak +
   '    	   	TP.CD_PRODUTO,                                                                                                                    ' + sLineBreak +
   '    	   	PR.SENIORKEY,                                                                                                                     ' + sLineBreak +
   '    	   	IPR.PRICE,                                                                                                                        ' + sLineBreak +
   '    	   	PR.CREATED,                                                                                                                       ' + sLineBreak +
   '    	   	PR.RECEIVEDDATE,                                                                                                                  ' + sLineBreak +
   '    	   	PR.ID,                                                                                                                            ' + sLineBreak +
   '    	   	A.NM_AREA,                                                                                                                        ' + sLineBreak +
   '    	   	EV315.DT_REALIZACAO,                                                                                                              ' + sLineBreak +
   '    	   	EV132.DT_REALIZACAO,                                                                                                              ' + sLineBreak +
   '    	   	EE.NM_EMPRESA,                                                                                                                    ' + sLineBreak +
   '    	   	TP.NR_PROCESSO,                                                                                                                   ' + sLineBreak +
   '    	   	CON.NM_CONTATO,                                                                                                                   ' + sLineBreak +
   '    	   	AGE.NM_AGENTE,                                                                                                                    ' + sLineBreak +
   '    	   	TP.DT_CONHECIMENTO,                                                                                                               ' + sLineBreak +
   '    	   	AA.NM_ARMAZEM,                                                                                                                    ' + sLineBreak +
   '    	   	TC.NM_TP_CNTR                                                                                                                     ' + sLineBreak ;
end;

procedure TFormRlBASFArmazenagemExpoCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  SQL: string;
begin
  if (not chbBasfSa.checked) and (not chbBasfPoliuretanos.checked) and (not chbChemetall.checked) then
  begin
    ShowMessage('Selecione um grupo!');
    exit;
  end;

  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := sEmpresa + ' Armazenagem - Expo';
    DataInicial          := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal            := StrToDateTimeDef(mskDataregistroFin.Text, 0);

    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        Warning('Data inicial de Solicitação maior que a data final.');
        Exit;
      end;

      SQL := GetSQLSelect;
      SQL := StringReplace(SQL, '@DATAINICIAL',  DateToSQL(DataInicial), [rfReplaceAll, rfIgnoreCase]);
      SQL := StringReplace(SQL, '@DATAFINAL',    DateToSQL(DataFinal + 1), [rfReplaceAll, rfIgnoreCase]);
    end;

    Form.qryMain.SQL.Text := SQL;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFormRlBASFArmazenagemExpoCtx.FormShow(Sender: TObject);
begin
  Self.Caption := sEmpresa + ' Armazenagem - Expo';
end;

end.

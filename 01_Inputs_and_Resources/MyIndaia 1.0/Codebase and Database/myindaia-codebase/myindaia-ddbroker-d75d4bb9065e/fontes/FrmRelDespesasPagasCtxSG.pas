unit FrmRelDespesasPagasCtxSG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRelDepesasPagasCtxSG = class(TForm)
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    lblGrupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    mskItem: TMaskEdit;
    edtItem: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSQL: string;
    function GetWhere: string;
  public
    { Public declarations }
  end;

var
  FormRelDepesasPagasCtxSG: TFormRelDepesasPagasCtxSG;

implementation

{$R *.dfm}

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{ TFormRelDepesasPagasCtx }

function TFormRelDepesasPagasCtxSG.GetSQL: string;
begin
  Result :=

  ' SELECT	                                                                                                                                 '+sLineBreak +
  ' 	  CC.CUSTOMID                                       AS [Ref. Indaía],                                                                  '+sLineBreak +
  '     REF.REF_CLIENTE                                   AS [Ref. Cliente],                                                                 '+sLineBreak +
  ' 	  PR.RECEIVEDDATE                                   AS [Data do Pagamento],                                                            '+sLineBreak +
  ' 	  I.NAME                                            AS [Item],                                                                         '+sLineBreak +
  ' 	  F.NAME                                            AS [Favorecido],                                                                   '+sLineBreak +
  ' 	  IPR.PRICE                                         AS [Valor],                                                                        '+sLineBreak +
  ' 	  SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''                                                                                                  '+sLineBreak +
  '       + SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''                                                                                              '+sLineBreak +
  '       + SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''                                                                                              '+sLineBreak +
  '       + SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''                                                                                              '+sLineBreak +
  '       + SUBSTRING(EN.CGC_EMPRESA,13,2)                AS [CNPJ],                                                                         '+sLineBreak +
  ' 	  B.CREATED                                         AS [Data do Faturamento],                                                          '+sLineBreak +
  ' 	  (CASE WHEN B.SENIORKEY IS NOT NULL                                                                                                   '+sLineBreak +
	' 	        THEN B.SENIORKEY                                                                                                               '+sLineBreak +
	' 	  	  ELSE CAST(B.ID AS INT)                                                                                                           '+sLineBreak +
	' 	   END)                                             AS [Nr. Fatura de Despesa],                                                        '+sLineBreak +
  '      CASE WHEN TP.CD_PRODUTO =''02''                                                                                                     '+sLineBreak +
  '           THEN IMPO.NM_EMPRESA                                                                                                           '+sLineBreak +
  '           ELSE EN.NM_EMPRESA                                                                                                             '+sLineBreak +
  '      END                                              AS [Importador],                                                                   '+sLineBreak +
  '     EN.NM_EMPRESA                                     AS [Consignatário],                                                                '+sLineBreak +
  '     PB.NM_PAIS                                        AS [País de Destino],                                                              '+sLineBreak +
  '     vt.NM_VIA_TRANSPORTE                              AS [Modal],                                                                        '+sLineBreak +
  '     LE.DESCRICAO                                      AS [Porto/Aeroporto de destino]                                                    '+sLineBreak +
  '   FROM  BROKER.DBO.TPROCESSO                                     TP   (NOLOCK)                                                           '+sLineBreak +
  '        JOIN BROKER.DBO.TGRUPO                                    G    (NOLOCK) ON G.CD_GRUPO                = TP.CD_GRUPO                '+sLineBreak +
  '        JOIN BROKER.DBO.TEMPRESA_NAC                              EN   (NOLOCK) ON EN.CD_EMPRESA             = TP.CD_CLIENTE              '+sLineBreak +
  '        JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                       CC   (NOLOCK) ON CC.CUSTOMID               = TP.NR_PROCESSO             '+sLineBreak +
  '        JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED                      PR   (NOLOCK) ON PR.CUSTOMCLEARANCE_ID     = CC.ID                      '+sLineBreak +
  '        JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED PRIPR(NOLOCK) ON PRIPR.PAYMENTREQUESTED_ID = PR.ID                      '+sLineBreak +
  '        JOIN MYINDAIAV2.DBO.ITEMPAYMENTREQUESTED                  IPR  (NOLOCK) ON IPR.ID                    = PRIPR.ITEMS_ID             '+sLineBreak +
  '        JOIN MYINDAIAV2.DBO.ITEM                                  I    (NOLOCK) ON I.ID                      = IPR.ITEM_ID                '+sLineBreak +
  '   LEFT JOIN MYINDAIAV2.DBO.BENEFICIARY                           F    (NOLOCK) ON F.ID                      = PR.BENEFICIARY_ID          '+sLineBreak +
  '   LEFT JOIN MYINDAIAV2.DBO.BILLING                               B    (NOLOCK) ON B.ID                      = PR.BILLING_ID              '+sLineBreak +
  '   LEFT JOIN BROKER.DBO.TEMPRESA_EST                              IMPO (NOLOCK) ON IMPO.CD_EMPRESA           = TP.CD_IMPORTADOR           '+sLineBreak +
  '   LEFT JOIN BROKER.DBO.TPAIS_BROKER                              PB   (NOLOCK) ON PB.CD_PAIS                = TP.CD_PAIS_DESTINO         '+sLineBreak +
  '        JOIN BROKER.DBO.VW_SERVICO_GERAL                          SE            ON SE.CD_SERVICO             = tP.CD_SERVICO              '+sLineBreak +
  '        JOIN BROKER.DBO.TVIA_TRANSPORTE                           VT   (NOLOCK) ON VT.CD_VIA_TRANSPORTE      = SE.CD_VIA_TRANSPORTE       '+sLineBreak +
  '        JOIN BROKER.DBO.TLOCAL_EMBARQUE                           LE   (NOLOCK) ON LE.CODIGO                 = TP.CD_LOCAL_DESEMBARQUE    '+sLineBreak +
  '   OUTER APPLY (  SELECT TOP 1 LTRIM(RTRIM(R.CD_REFERENCIA))AS REF_CLIENTE                                                                '+sLineBreak +
  '                    FROM BROKER.DBO.TREF_CLIENTE R (NOLOCK)                                                                               '+sLineBreak +
  '                   WHERE NR_PROCESSO = TP.NR_PROCESSO                                                                                      '+sLineBreak +
  '                     AND TP_REFERENCIA IN (CASE WHEN TP.CD_PRODUTO = 1                                                                     '+sLineBreak +
  '                                                THEN G.TP_PEDIDO_BUSCA_IMP                                                                '+sLineBreak +
  '                                                ELSE G.TP_PEDIDO_BUSCA                                                                    '+sLineBreak +
  '                                           END )                                                                                          '+sLineBreak +
  '                ) REF                                                                                                                     '+sLineBreak ;

end;

function TFormRelDepesasPagasCtxSG.GetWhere: string;
begin
  Result := ' WHERE PR.STATUS=''APPROVED'' ';
end;

procedure TFormRelDepesasPagasCtxSG.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRelDepesasPagasCtxSG.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);
    Filtros     := GetWhere;
    Form.TituloRelatorio := 'Despesas Pagas';

    if (msk_cd_produto.Text <> '') then
      CatSQLAnd(Filtros, ' TP.CD_PRODUTO = ' + QuotedStr(msk_cd_produto.Text));
    if (msk_cd_grupo.Text<>'') then
      CatSQLAnd(Filtros, ' TP.CD_GRUPO = ' + QuotedStr(msk_cd_grupo.Text));

    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        MessageDlg('Data inicial de Solicitação maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;
      CatSQLAnd(Filtros, ' PR.receiveddate >= ' + DateToSQL(DataInicial) + ' AND PR.receiveddate < ' + DateToSQL(DataFinal + 1));

      if (trim(mskItem.Text) <> '') then
        CatSQLAnd(Filtros, ' i.id =  ' + QuotedStr(mskItem.Text));
    end;
    Form.qryMain.SQL.Text := GetSQL + Filtros;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFormRelDepesasPagasCtxSG.msk_cd_produtoExit(Sender: TObject);
begin
  btn_co_produtoClick(msk_cd_produto);
  ValCodEdt( msk_cd_produto );
end;

procedure TFormRelDepesasPagasCtxSG.btn_co_grupoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_grupo.Text := ConsultaOnLineEx('TGRUPO','Grupo',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO')
  else
    edt_nm_Grupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', msk_cd_grupo.Text,'NM_GRUPO');
end;

procedure TFormRelDepesasPagasCtxSG.SpeedButton1Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
    mskItem.Text := ConsultaOnLineEx('MYINDAIAV2.DBO.ITEM','Item',['id','name'],['Código','Nome'],'id')
  else
    edtItem.Text := ConsultaLookUP('MYINDAIAV2.DBO.ITEM','id', mskItem.Text,'name');
end;

procedure TFormRelDepesasPagasCtxSG.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TFormRelDepesasPagasCtxSG.FormShow(Sender: TObject);
begin
  msk_cd_produto.Text := '02';
  msk_cd_produtoExit(nil);  
  msk_cd_grupo.Text   := '028';
end;

end.

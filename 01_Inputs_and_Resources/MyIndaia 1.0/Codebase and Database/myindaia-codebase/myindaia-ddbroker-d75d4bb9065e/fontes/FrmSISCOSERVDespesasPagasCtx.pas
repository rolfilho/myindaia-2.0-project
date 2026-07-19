unit FrmSISCOSERVDespesasPagasCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask, ExtCtrls, StrUtils, DB;

type
  TFormPadraoSISCOSERVCtx = class(TForm)
    lbl_produto: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    lblGrupo: TLabel;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    btn_co_grupo: TSpeedButton;
    mskDataSolicPagtoIni: TMaskEdit;
    mskDataSolicPagtoFin: TMaskEdit;
    Label2: TLabel;
    mskDataFaturamentoIni: TMaskEdit;
    mskDataFaturamentoFin: TMaskEdit;
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    PRDataInicial: TDateTime;
    PRDataFinal: TDateTime;
    BDataInicial: TDateTime;
    BDataFinal: TDateTime;
    function GetSQL: string;
  public
    { Public declarations }
  end;

var
  FormPadraoSISCOSERVCtx: TFormPadraoSISCOSERVCtx;

implementation

{$R *.dfm}

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{ TForm3 }

function TFormPadraoSISCOSERVCtx.GetSQL: string;
begin
  Result := '  SELECT CC.CUSTOMID                                       AS [Ref. Indaiá],                                        '+
            '  	      G.NM_GRUPO                                        AS [Grupo],                                              '+
            '  	      C.NAME                                            AS [Cliente],                                            '+
            '  	      SUBSTRING(C.TAXID,1,2)+''.''+                                                                              '+
            '         SUBSTRING(C.TAXID,3,3)+''.''+                                                                              '+
            '         SUBSTRING(C.TAXID,6,3)+''/''+                                                                              '+
            '         SUBSTRING(C.TAXID,9,4)+''-''+                                                                              '+
            '         SUBSTRING(C.TAXID,13,2)                           AS [CNPJ Cliente],                                       '+
            '  	      I.NAME                                            AS [Item],                                               '+
            '  	      IPR.PRICE                                         AS [Valor],                                              '+
            '  	      PR.CREATED                                        AS [Data do Pagto.],                                     '+
            '  	      FAV.NAME                                          AS [Favorecido],                                         '+
            '  	      SUBSTRING(FAV.TAXID,1,2)+''.''+                                                                            '+
            '         SUBSTRING(FAV.TAXID,3,3)+''.''+                                                                            '+
            '         SUBSTRING(FAV.TAXID,6,3)+''/''+                                                                            '+
            '         SUBSTRING(FAV.TAXID,9,4)+''-''+                                                                            '+
            '         SUBSTRING(FAV.TAXID,13,2)                         AS [CNPJ Favorecido],                                    '+
            '  	      B.CREATED                                         AS [Data do Faturamento],                                '+
            '  	      CAST(B.SENIORKEY AS INT)                          AS [Nr. Fatura de Serviço],                              '+
            '  	      CAST(B.ID AS INT)                                 AS [Nr. Fatura de Despesas],                             '+
            '  	      A.NM_AGENTE                                       AS [Nome do Agente],                                     '+
            '  	      SUBSTRING(A.NR_CGC_AGENTE,1,2)+''.''+                                                                      '+
            '         SUBSTRING(A.NR_CGC_AGENTE,3,3)+''.''+                                                                      '+
            '         SUBSTRING(A.NR_CGC_AGENTE,6,3)+''/''+                                                                      '+
            '         SUBSTRING(A.NR_CGC_AGENTE,9,4)+''-''+                                                                      '+
            '         SUBSTRING(A.NR_CGC_AGENTE,13,2)                   AS [CNPJ Agente],                                        '+
            '  	      EE.AP_EMPRESA                                     AS [Exportador],                                         '+
            '  	      TF.DESCRICAO                                      AS [Tipo Frete],                                         '+
            '  	      M.AP_MOEDA                                        AS [Moeda do Frete],                                     '+
            '  	      TP.VL_FRETE_COLLECT_MNEG                          AS [Frete Collet],                                       '+
            '  	      TP.VL_FRETE_PREPAID_MNEG                          AS [Frete Preaid],                                       '+
            '  	      TP.NR_DI                                          AS [Nr. DI],                                             '+
            '  	      DT_CONHECIMENTO                                   AS [ETD],                                                '+
            '  	      ETA.DT_REALIZACAO                                 AS [ETA],                                                '+
            '  	      TR.NM_TRANSP_ROD                                  AS [Transportadora],                                     '+
            '  	      SUBSTRING(TR.CNPJ_TRANSP_ROD,1,2)+''.''+                                                                   '+
            '         SUBSTRING(TR.CNPJ_TRANSP_ROD,3,3)+''.''+                                                                   '+
            '         SUBSTRING(TR.CNPJ_TRANSP_ROD,6,3)+''/''+                                                                   '+
            '         SUBSTRING(TR.CNPJ_TRANSP_ROD,9,4)+''-''+                                                                   '+
            '         SUBSTRING(TR.CNPJ_TRANSP_ROD,13,2)                AS [CNPJ Transportadora],                                '+
            '         BROKER.DBO.FN_CONCATENA_REFRENCIA(TP.NR_PROCESSO) AS [Ref. Cliente]                                        '+
            '  FROM MYINDAIAV2.dbo.PAYMENTREQUESTED                           PR   (NOLOCK)                                      '+
            '  LEFT JOIN MYINDAIAV2.dbo.PAYMENTREQUESTED_ITEMPAYMENTREQUESTED PIPR (NOLOCK)ON PIPR.PAYMENTREQUESTED_ID=PR.ID     '+
            '  LEFT JOIN MYINDAIAV2.dbo.ITEMPAYMENTREQUESTED                  IPR  (NOLOCK)ON IPR.ID=PIPR.ITEMS_ID               '+
            '  LEFT JOIN MYINDAIAV2.dbo.ITEM                                  I    (NOLOCK)ON I.ID=IPR.ITEM_ID                   '+
            '  LEFT JOIN MYINDAIAV2.dbo.BILLING                               B    (NOLOCK)ON B.ID=PR.BILLING_ID                 '+
            '  LEFT JOIN MYINDAIAV2.dbo.BENEFICIARY                           FAV  (NOLOCK)ON FAV.ID=PR.BENEFICIARY_ID           '+
            '  LEFT JOIN MYINDAIAV2.dbo.CUSTOMCLEARANCE                       CC   (NOLOCK)ON CC.ID=PR.CUSTOMCLEARANCE_ID        '+
            '  LEFT JOIN MYINDAIAV2.dbo.CUSTOMER                              C    (NOLOCK)ON C.ID=PR.CUSTOMER_ID                '+
            '  LEFT JOIN BROKER.DBO.TPROCESSO                                 TP   (NOLOCK)ON TP.NR_PROCESSO=CC.CUSTOMID         '+
            '  LEFT JOIN BROKER.DBO.TAGENTE                                   A    (NOLOCK)ON A.CD_AGENTE=TP.CD_AGENTE           '+
            '  LEFT JOIN BROKER.DBO.TEMPRESA_EST                              EE   (NOLOCK)ON EE.CD_EMPRESA=TP.CD_EXPORTADOR     '+
            '  LEFT JOIN BROKER.DBO.TTP_FRETE                                 TF   (NOLOCK)ON TF.CODIGO=TP.TP_FRETE              '+
            '  LEFT JOIN BROKER.DBO.TMOEDA_BROKER                             M    (NOLOCK)ON M.CD_MOEDA=TP.CD_MOEDA_FRETE       '+
            '  LEFT JOIN BROKER.DBO.TFOLLOWUP                                 ETA  (NOLOCK)ON TP.NR_PROCESSO=ETA.NR_PROCESSO     '+
            '                                                                             AND ETA.CD_EVENTO = ''161''            '+
            '  LEFT JOIN BROKER.DBO.TTRANSP_ROD                               TR   (NOLOCK)ON TP.CD_TRANSP_NAC=TR.CD_TRANSP_ROD  '+
            '  LEFT JOIN BROKER.DBO.TDOCUMENTO_INSTRUCAO                      FAT  (NOLOCK)ON TP.NR_PROCESSO=FAT.NR_PROCESSO     '+
            '                                                                             AND FAT.CD_TIPO_DCTO_INSTR = ''01''    '+
            '  LEFT JOIN BROKER.DBO.TGRUPO                                    G    (NOLOCK)ON G.CD_GRUPO=TP.CD_GRUPO             '+
            '  ';
end;

procedure TFormPadraoSISCOSERVCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    PRDataInicial := StrToDateTimeDef(mskDataSolicPagtoIni.Text, 0);
    PRDataFinal   := StrToDateTimeDef(mskDataSolicPagtoFin.Text, 0);
    BDataInicial  := StrToDateTimeDef(mskDataFaturamentoIni.Text, 0);
    BDataFinal    := StrToDateTimeDef(mskDataFaturamentoFin.Text, 0);

    Form.TituloRelatorio := 'Padrão SISCOSERV (Despesas Pagas)';
    Filtros              := ' WHERE B.STATUS = ' + QuotedStr('INVOICED');


    if (msk_cd_produto.Text <> '') then
      CatSQLAnd(Filtros, ' TP.CD_PRODUTO = ' + QuotedStr(msk_cd_produto.Text));

    if (msk_cd_grupo.Text<>'') then
      CatSQLAnd(Filtros, ' G.CD_GRUPO = ' + QuotedStr(msk_cd_grupo.Text));


    if (PRDataInicial = 0) and (PRDataFinal = 0) and (BDataInicial = 0) and (BDataFinal = 0) then
    begin
      ShowMessage('Informe pelo menos um dos períodos.');
      Exit;
    end;

    if (PRDataInicial > 0) and (PRDataFinal > 0) then
    begin
      if PRDataInicial > PRDataFinal then
      begin
        MessageDlg('Data inicial de Solicitação de Pagamento maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;
      CatSQLAnd(Filtros, ' PR.CREATED >= ' + DateToSQL(PRDataInicial) + ' AND PR.CREATED < ' + DateToSQL(PRDataFinal + 1));
    end;

    if (BDataInicial > 0) and (BDataFinal > 0) then
    begin
      if BDataInicial > BDataFinal then
      begin
        MessageDlg('Data inicial de Faturamento maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;
      CatSQLAnd(Filtros, ' B.CREATED >= ' + DateToSQL(BDataInicial) + ' AND B.CREATED < ' + DateToSQL(BDataFinal + 1));
    end;

    Form.qryMain.SQL.Text := GetSQL + Filtros;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFormPadraoSISCOSERVCtx.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TFormPadraoSISCOSERVCtx.btn_co_grupoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_grupo.Text := ConsultaOnLineEx('TGRUPO','Grupo',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO')
  else
    edt_nm_Grupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', msk_cd_grupo.Text,'NM_GRUPO');
end;

procedure TFormPadraoSISCOSERVCtx.msk_cd_produtoExit(Sender: TObject);
begin
  btn_co_produtoClick(msk_cd_produto);
  ValCodEdt( msk_cd_produto );
end;

procedure TFormPadraoSISCOSERVCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.

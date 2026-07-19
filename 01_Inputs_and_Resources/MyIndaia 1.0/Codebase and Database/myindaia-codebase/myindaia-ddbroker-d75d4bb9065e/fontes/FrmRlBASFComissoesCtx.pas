unit FrmRlBASFComissoesCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlBASFComissoesCtx = class(TForm)
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    edt_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    chbBasfSa: TCheckBox;
    chbBasfPoliuretanos: TCheckBox;
    chbChemetall: TCheckBox;
    chbSuvinil: TCheckBox;
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSelect: string;
    function GetWhere: string;
  public
    { Public declarations }
    sEmpresa : String;
    sGrupo   : String;
  end;

var
  FormRlBASFComissoesCtx: TFormRlBASFComissoesCtx;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

{ TFormRlBASFComissoes }

function TFormRlBASFComissoesCtx.GetSelect: string;
begin
  Result :=
   '  SELECT                                                                                                        ' + sLineBreak +
   '        G.NM_GRUPO                                                        AS [GRUPO],                           ' + sLineBreak +
   '        B.SENIORKEY    													                          AS [NF],                              ' + sLineBreak +
   '        TP.NR_PROCESSO 													                          AS [REF. INDAIA],                     ' + sLineBreak +
   '        CAST((SELECT RTRIM(RC.CD_REFERENCIA) + '', '' AS ''data()''                                             ' + sLineBreak +
   '                FROM BROKER.DBO.TREF_CLIENTE RC                                                                 ' + sLineBreak +
   '               WHERE RC.NR_PROCESSO   = TP.NR_PROCESSO                                                          ' + sLineBreak +
   '                 AND RC.TP_REFERENCIA = (CASE WHEN TP.CD_PRODUTO = ''01''                                       ' + sLineBreak +
   '                                              THEN ''01''                                                       ' + sLineBreak +
   '                                              ELSE ''19''                                                       ' + sLineBreak +
   '                                          END)                                                                  ' + sLineBreak +
   '               FOR XML PATH('''')) AS NVARCHAR)                           AS [NR. PEDIDO],                      ' + sLineBreak +
   '        P.NM_PRODUTO 													                            AS [PRODUTO],                         ' + sLineBreak +
   '        S.NAME       													                            AS [MODAL],                           ' + sLineBreak +
   '        I.NAME     													                              AS [ITEM],                            ' + sLineBreak +
   '        CONVERT(VARCHAR(MAX),B.NR_NOTA)				                            AS [NR NF DE SERVIÇO],                ' + sLineBreak +
   '        II.PRICE          										                            AS [VALOR NF DE SERVIÇO],             ' + sLineBreak +
   '      II.PRICE - ((( ISNULL(B.IR,0)                                                                             ' + sLineBreak +
   '      +ISNULL(B.COFINS,0)+ISNULL(B.ISS,0) )                                                                     ' + sLineBreak +
   '      / B.VALORTIBUTAVEL) * II.PRICE)      		                            AS [VALOR NF],                        ' + sLineBreak +
   '        B.CREATED 														                            AS [EMISSAO NF],                      ' + sLineBreak +
   '        B.DUEDATE    													                            AS [VENCIMENTO],                      ' + sLineBreak +
   '        ''À PAGAR'' 													                            AS [STATUS]                           ' + sLineBreak +
   '      FROM MYINDAIAV2.DBO.BILLING                   B   WITH(NOLOCK)                                            ' + sLineBreak +
   '      LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII WITH(NOLOCK) ON BII.BILLING_ID = B.ID                   ' + sLineBreak +
   '      LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED         II  WITH(NOLOCK) ON II.ID          = BII.ITENSINVOICED_ID   ' + sLineBreak +
   '      LEFT JOIN MYINDAIAV2.DBO.ITEM                 I   WITH(NOLOCK) ON I.ID           = II.ITEM_ID             ' + sLineBreak +
   '      LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE      CC  WITH(NOLOCK) ON CC.ID          = II.CUSTOMCLEARANCE_ID  ' + sLineBreak +
   '      LEFT JOIN BROKER.DBO.TPROCESSO                TP  WITH(NOLOCK) ON TP.NR_PROCESSO = CC.CUSTOMID            ' + sLineBreak +
   '      LEFT JOIN BROKER.DBO.TGRUPO                   G   WITH(NOLOCK) ON G.CD_GRUPO     = TP.CD_GRUPO            ' + sLineBreak +
   '      LEFT JOIN BROKER.DBO.TAREA                    A   WITH(NOLOCK) ON A.CD_AREA      = TP.CD_AREA             ' + sLineBreak +
   '      LEFT JOIN BROKER.DBO.TPRODUTO                 P   WITH(NOLOCK) ON P.CD_PRODUTO   = TP.CD_PRODUTO          ' + sLineBreak +
   '      LEFT JOIN MYINDAIAV2.DBO.SERVICE              S   WITH(NOLOCK) ON S.ID           = CC.SERVICE_ID          ' + sLineBreak ;

end;

function TFormRlBASFComissoesCtx.GetWhere: string;
begin
  Result := 'WHERE B.STATUS = ''INVOICED'' AND B.type = ''TAX_INVOICE'' ';
end;

procedure TFormRlBASFComissoesCtx.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TFormRlBASFComissoesCtx.msk_cd_produtoExit(Sender: TObject);
begin
  btn_co_produtoClick(msk_cd_produto);
  ValCodEdt( msk_cd_produto );
end;

procedure TFormRlBASFComissoesCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  if (not chbBasfSa.checked) and (not chbBasfPoliuretanos.checked) and (not chbChemetall.checked) and (not chbSuvinil.checked) then
  begin
    ShowMessage('Selecione um grupo!');
    exit;
  end;
  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);
    Filtros     := GetWhere;
    
    Form.TituloRelatorio := sEmpresa + ' - Comissões';

    if (msk_cd_produto.Text <> '') then
      CatSQLAnd(Filtros, ' TP.CD_PRODUTO = ' + QuotedStr(msk_cd_produto.Text));

  {  if sGrupo = '' then
    begin
      if RadioGroup.ItemIndex = 0 then
        CatSQLAnd(Filtros, ' TP.CD_GRUPO = '+QuotedStr('002'))
      else
        CatSQLAnd(Filtros, ' TP.CD_GRUPO = '+QuotedStr('013'));
    end
    else}

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

    if chbSuvinil.checked then
    if sgrupo = '' then
      sgrupo := '''D28'''
    else
      sgrupo := sgrupo + ', ' + '''D28''';

    CatSQLAnd(Filtros, ' TP.CD_GRUPO in ( ' + sGrupo+ ' )');

    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        MessageDlg('Data inicial de Solicitação maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;
      CatSQLAnd(Filtros, ' B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1));
    end;
    Form.qryMain.SQL.Text := GetSelect + Filtros;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFormRlBASFComissoesCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRlBASFComissoesCtx.FormShow(Sender: TObject);
begin
  //if sGrupo <> '' then
  //  RadioGroup.visible := false;

  Self.Caption := sEmpresa + ' - Comissões';

end;

end.

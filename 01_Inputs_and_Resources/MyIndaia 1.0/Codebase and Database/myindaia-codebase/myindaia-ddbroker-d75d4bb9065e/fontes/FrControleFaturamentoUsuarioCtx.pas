unit FrControleFaturamentoUsuarioCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, StrUtils;

type
  TFormControleFaturamentoUsuarioCtx = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lblGrupo: TLabel;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    btn_co_grupo: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    cbxTipoFatura: TComboBox;
    Label3: TLabel;
    procedure btn_co_grupoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSQL: string;
  public
  end;

var
  FormControleFaturamentoUsuarioCtx: TFormControleFaturamentoUsuarioCtx;

implementation

{$R *.dfm}

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

procedure TFormControleFaturamentoUsuarioCtx.btn_co_grupoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_grupo.Text := ConsultaOnLineEx('TGRUPO','Grupo',['CD_GRUPO','NM_GRUPO'],['Código','Nome'],'CD_GRUPO')
  else
    edt_nm_Grupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO', msk_cd_grupo.Text,'NM_GRUPO');
end;

function TFormControleFaturamentoUsuarioCtx.GetSQL: string;
begin
  DataInicial  := StrToDateTimeDef(mskDataregistroIni.Text, 0);
  DataFinal    := StrToDateTimeDef(mskDataregistroFin.Text, 0);
  Result       := 'SELECT	DISTINCT                                                                                                 '+ sLineBreak +
                  '	               CAST(B.ID as INT)                   AS [Código],                                                '+ sLineBreak +
                  '	               U.NAME                              AS [Colaborador],                                           '+ sLineBreak +
                  '	               B.CREATED                           AS [Criação da Fatura],                                     '+ sLineBreak +
                  '	               (CASE WHEN B.TYPE = ''TAX_RECEIPT''                                                             '+ sLineBreak +
                  '                           THEN ''Nota de Despesa''                                                             '+ sLineBreak +
                  '                      WHEN B.TYPE = ''TAX_INVOICE''                                                             '+ sLineBreak +
                  '                           THEN ''Nota de Serviço''                                                             '+ sLineBreak +
                  '                      ELSE ''Verificar Nota''                                                                   '+ sLineBreak +
                  '                 END)                               AS [Tipo de Fatura],                                        '+ sLineBreak +
                  '	               (CASE WHEN B.STATUS = ''OPEN''                                                                  '+ sLineBreak +
                  '                           THEN ''Aberta''                                                                      '+ sLineBreak +
                  '                      WHEN B.status=''INVOICED''                                                                '+ sLineBreak +
                  '                           THEN ''Enviada''                                                                     '+ sLineBreak +
                  '                      WHEN B.STATUS=''CLOSED''                                                                  '+ sLineBreak +
                  '                           THEN ''Cancelada''                                                                   '+ sLineBreak +
                  '                      ELSE ''Verificar Status''                                                                 '+ sLineBreak +
                  '                 END)                               AS Status,                                                  '+ sLineBreak +
                  '	               CC.CUSTOMID                         AS [Ref. Indaiá],                                           '+ sLineBreak +
                  '	               G.NM_GRUPO                          AS [Grupo]                                                  '+ sLineBreak +
                  '	FROM      MYINDAIAV2.dbo.BILLING              B  WITH(NOLOCK)                                                  '+ sLineBreak +
                  '	LEFT JOIN MYINDAIAV2.dbo.AUTHUSER             U  WITH(NOLOCK) ON U.ID                =  B.USER_ID              '+ sLineBreak +
                  '	LEFT JOIN MYINDAIAV2.dbo.BILLING_ITEMINVOICED BI WITH(NOLOCK) ON BI.BILLING_ID       =  B.ID                   '+ sLineBreak +
                  '	LEFT JOIN MYINDAIAV2.dbo.ITEMINVOICED         II WITH(NOLOCK) ON BI.ITENSINVOICED_ID =  II.ID                  '+ sLineBreak +
                  '	LEFT JOIN MYINDAIAV2.dbo.CUSTOMCLEARANCE      CC WITH(NOLOCK) ON CC.ID               =  II.CUSTOMCLEARANCE_ID  '+ sLineBreak +
                  '	LEFT JOIN BROKER.DBO.TPROCESSO                P  WITH(NOLOCK) ON P.NR_PROCESSO       =  CC.CUSTOMID            '+ sLineBreak +
                  '	     JOIN BROKER.DBO.TGRUPO                   G  WITH(NOLOCK) ON G.CD_GRUPO          =  P.CD_GRUPO             '+ sLineBreak ;
end;

procedure TFormControleFaturamentoUsuarioCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := 'Controle de Faturamento por Usuário';
    Form.qryMain.SQL.Text := GetSQL;
    Filtros := ' WHERE 0 = 0 ';
    if (msk_cd_grupo.Text <> '') then
      CatSQLAnd(Filtros, 'G.CD_GRUPO = ' + QuotedStr(msk_cd_grupo.Text));
    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        MessageDlg('Data inicial de Registro maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;
      CatSQLAnd(Filtros, ' B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1));
    end;
    if cbxTipoFatura.ItemIndex >= 0 then
    begin
      case cbxTipoFatura.ItemIndex of
        0: CatSQLAnd(Filtros, ' B.TYPE = ''TAX_INVOICE'' ');
        1: CatSQLAnd(Filtros, ' B.TYPE = ''TAX_RECEIPT'' ');
      end;
    end;
    Form.qryMain.SQL.Text := Form.qryMain.SQL.Text + Filtros;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFormControleFaturamentoUsuarioCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.

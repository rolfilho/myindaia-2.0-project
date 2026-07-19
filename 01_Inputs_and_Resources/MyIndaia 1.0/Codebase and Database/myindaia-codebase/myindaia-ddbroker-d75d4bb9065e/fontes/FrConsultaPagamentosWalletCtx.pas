unit FrConsultaPagamentosWalletCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls, StrUtils;

type
  TFormConsultaPaqamentosWallet = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    edt_nm_produto: TEdit;
    msk_cd_produto: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    mskDataregistroIni: TMaskEdit;
    mskDataregistroFin: TMaskEdit;
    Label3: TLabel;
    btn_co_Beneficiario: TSpeedButton;
    edt_nm_Beneficiario: TEdit;
    msk_cd_Beneficiario: TMaskEdit;
    Label4: TLabel;
    btn_co_Usuario: TSpeedButton;
    edt_nm_Usuario: TEdit;
    msk_cd_usuario: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_BeneficiarioClick(Sender: TObject);
    procedure msk_cd_BeneficiarioExit(Sender: TObject);
    procedure btn_co_UsuarioClick(Sender: TObject);
    procedure msk_cd_usuarioExit(Sender: TObject);
  private
    { Private declarations }
    DataInicial: TDateTime;
    DataFinal: TDateTime;
    function GetSQL: string;
  public
    { Public declarations }
  end;

var
  FormConsultaPaqamentosWallet: TFormConsultaPaqamentosWallet;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TFormConsultaPaqamentosWallet.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
begin
  Form := TfmConsulta.Create(nil);
  try
    Filtros               := ' PR.STATUS = ' + QuotedStr('OPEN') + ' AND PR.TYPE = ' + quotedStr('BOLETO');
    Form.TituloRelatorio  := 'Pagamentos Criados (Boleto)';
    Form.qryMain.SQL.Text := GetSQL;

    if (msk_cd_produto.Text <> '') then
      CatSQLAnd(Filtros, ' TP.CD_PRODUTO = ' + QuotedStr(msk_cd_produto.Text));

    if (DataInicial > 0) and (DataFinal > 0) then
    begin
      if DataInicial > DataFinal then
      begin
        MessageDlg('Data inicial de Solicitação maior que a data final.', mtWarning, [mbOK], 0);
        Exit;
      end;
      
      CatSQLAnd(Filtros, ' PR.CREATED >= ' + DateToSQL(DataInicial) + ' AND PR.CREATED < ' + DateToSQL(DataFinal + 1));
    end;

    if msk_cd_Beneficiario.Text <> '' then
      CatSQLAnd(Filtros, ' FAV.ID = ' + msk_cd_Beneficiario.Text);
    if msk_cd_usuario.Text <> '' then
      CatSQLAnd(Filtros, ' U.ID = ' + msk_cd_usuario.Text);

    Form.qryMain.SQL.Text := Form.qryMain.SQL.Text + Filtros;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

function TFormConsultaPaqamentosWallet.GetSQL: string;
begin
  DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
  DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);
  Result      :=  '  SELECT                                                                                                 '+ sLineBreak +
                  '  		CONVERT(VARCHAR(10),PR.CREATED,103) AS [DATA SOLICITAÇÃO],                                          '+ sLineBreak +
                  '  		CC.CUSTOMID                         AS [REF. IDAIÁ],                                                '+ sLineBreak +
                  '  		FAV.NAME                            AS [FAVORECIDO],                                                '+ sLineBreak +
                  '  		PR.SENIORKEY                        AS [CÓDIGO SENIOR],                                             '+ sLineBreak +
                  '     PR.SENIORSUBKEY                     AS [CÓDIGO SUB SENIOR],                                         '+ sLineBreak +
                  '  		PR.PAYMENTTOTAL                     AS [TOTAL],                                                     '+ sLineBreak +
                  '  		IMP.NAME                            AS [CLIENTE],                                                   '+ sLineBreak +
                  '     U.NAME                              AS [USUÁRIO]                                                    '+ sLineBreak +
                  '  FROM      MYINDAIAV2.DBO.PAYMENTREQUESTED PR  WITH(NOLOCK)                                             '+ sLineBreak +
                  '  LEFT JOIN MYINDAIAV2.DBO.AUTHUSER         U   WITH(NOLOCK) ON U.ID            = PR.USER_ID             '+ sLineBreak +
                  '  LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE  CC  WITH(NOLOCK) ON CC.ID           = PR.CUSTOMCLEARANCE_ID  '+ sLineBreak +
                  '  LEFT JOIN MYINDAIAV2.DBO.BENEFICIARY      FAV WITH(NOLOCK) ON FAV.ID          = PR.BENEFICIARY_ID      '+ sLineBreak +
                  '  LEFT JOIN MYINDAIAV2.DBO.CUSTOMER         IMP WITH(NOLOCK) ON IMP.ID          = PR.CUSTOMER_ID         '+ sLineBreak +
                  '  LEFT JOIN BROKER.DBO.TPROCESSO            TP  WITH(NOLOCK) ON TP.NR_PROCESSO  = CC.CUSTOMID            '+ sLineBreak +
                  '  WHERE                                                                                                  '+ sLineBreak ;
end;

procedure TFormConsultaPaqamentosWallet.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormConsultaPaqamentosWallet.msk_cd_produtoExit(
  Sender: TObject);
begin
  btn_co_produtoClick(msk_cd_produto);
  ValCodEdt( msk_cd_produto );
end;

procedure TFormConsultaPaqamentosWallet.btn_co_produtoClick(
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

procedure TFormConsultaPaqamentosWallet.btn_co_BeneficiarioClick(
  Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_Beneficiario.Text := ConsultaOnLineExSQL(' SELECT ID, NAME FROM MYINDAIAV2.DBO.BENEFICIARY ', 'Beneficiários', ['ID', 'NAME'], ['Código', 'Nome'], 'ID');
    msk_cd_BeneficiarioExit(nil);
  end
  else
    edt_nm_Beneficiario.Text := ConsultaLookUPSQL('SELECT name FROM MYINDAIAV2.DBO.BENEFICIARY WHERE ID = ' + msk_cd_Beneficiario.Text, 'name');
end;

procedure TFormConsultaPaqamentosWallet.msk_cd_BeneficiarioExit(
  Sender: TObject);
begin
  if msk_cd_Beneficiario.Text <> '' then
  begin
    btn_co_BeneficiarioClick(msk_cd_Beneficiario);
    ValCodEdt(msk_cd_Beneficiario);
  end;
end;

procedure TFormConsultaPaqamentosWallet.btn_co_UsuarioClick(
  Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_Usuario.Text := ConsultaOnLineExSQL(' SELECT ID, NAME FROM MYINDAIAV2.DBO.AuthUser ', 'Beneficiários', ['ID', 'NAME'], ['Código', 'Nome'], 'ID');
    msk_cd_UsuarioExit(nil);
  end
  else
    edt_nm_Usuario.Text := ConsultaLookUPSQL('SELECT name FROM MYINDAIAV2.DBO.AuthUser WHERE ID = ' + msk_cd_Usuario.Text, 'name');
end;

procedure TFormConsultaPaqamentosWallet.msk_cd_usuarioExit(
  Sender: TObject);
begin
  if msk_cd_usuario.Text <> '' then
  begin
    btn_co_UsuarioClick(msk_cd_usuario);
    ValCodEdt(msk_cd_usuario);
  end;
end;

end.

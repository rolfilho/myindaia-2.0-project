unit FrmRlFerreroFaturadosExpoCtx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFormRlFerreroFaturadosExpoCtx = class(TForm)
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
    function GetGroupby: string;
  public
    { Public declarations }
  end;

var
  FormRlFerreroFaturadosExpoCtx: TFormRlFerreroFaturadosExpoCtx;

implementation

uses
  uConsulta, PGGP001, Funcoes, ConsOnLineEx, KrQuery;

{$R *.dfm}

procedure TFormRlFerreroFaturadosExpoCtx.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormRlFerreroFaturadosExpoCtx.BitBtn1Click(Sender: TObject);
var
  Form: TfmConsulta;
  Filtros: string;
  CodigoProduto : String;
begin

  Form := TfmConsulta.Create(nil);
  try
    DataInicial := StrToDateTimeDef(mskDataregistroIni.Text, 0);
    DataFinal   := StrToDateTimeDef(mskDataregistroFin.Text, 0);
    CodigoProduto := msk_cd_produto.Text;

    if (CodigoProduto = '') or (DataInicial <= 0) or (DataFinal <= 0) then
    begin
      MessageDlg('Todos os campos são obrigatórios.', mtWarning, [mbOK], 0);
      Exit;
    end;

    if DataInicial > DataFinal then
    begin
      MessageDlg('Data inicial maior que a data final.', mtWarning, [mbOK], 0);
      Exit;
    end;

    Filtros     := GetWhere;
    Form.TituloRelatorio := 'Prometeon Faturados (Despesas + Honorários)';

    CatSQLAnd(Filtros, ' TP.CD_PRODUTO = ' + QuotedStr(CodigoProduto));
    CatSQLAnd(Filtros, ' B.CREATED >= ' + DateToSQL(DataInicial) + ' AND B.CREATED < ' + DateToSQL(DataFinal + 1));

    Form.qryMain.SQL.Text := GetSelect + Filtros + GetGroupby;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure TFormRlFerreroFaturadosExpoCtx.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TFormRlFerreroFaturadosExpoCtx.msk_cd_produtoExit(Sender: TObject);
begin
  btn_co_produtoClick(msk_cd_produto);
  ValCodEdt( msk_cd_produto );
end;

function TFormRlFerreroFaturadosExpoCtx.GetSelect: string;
begin
  Result :=
             ' SELECT	DISTINCT  ' + #13#10 +
	 ' CAST(STUFF(( SELECT DISTINCT '', '' + LTRIM(RTRIM(RC.CD_REFERENCIA)) FROM BROKER.DBO.TREF_CLIENTE RC WITH (NOLOCK) WHERE RC.NR_PROCESSO = TP.NR_PROCESSO AND RC.TP_REFERENCIA = ''01'' FOR XML PATH('''') ), 1, 1, '''') AS VARCHAR(200)) AS [PROCESSO] ' + #13#10 +
	 ' ,CASE     ' + #13#10 +
	 ' WHEN iivv.id=''3'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''    ' + #13#10 +
	 ' WHEN iivv.id=''3'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''    ' + #13#10 +
	 ' WHEN iivv.id=''3'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''    ' + #13#10 +
	 ' WHEN iivv.id=''9'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''    ' + #13#10 +
	 ' WHEN iivv.id=''9'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''    ' + #13#10 +
	 ' WHEN iivv.id=''9'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''    ' + #13#10 +
	 ' WHEN iivv.id=''13'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''602''   ' + #13#10 +
	 ' WHEN iivv.id=''13'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''402''  	' + #13#10 +
	 ' WHEN iivv.id=''13'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''302''   ' + #13#10 +
	 ' WHEN iivv.id=''16'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''602''   ' + #13#10 +
	 ' WHEN iivv.id=''16'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''402''  	' + #13#10 +
	 ' WHEN iivv.id=''16'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''302''   ' + #13#10 +
	 ' WHEN iivv.id=''21'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''311''   ' + #13#10 +
	 ' WHEN iivv.id=''23'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''   ' + #13#10 +
	 ' WHEN iivv.id=''23'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''   ' + #13#10 +
	 ' WHEN iivv.id=''23'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' + #13#10 +
	 ' WHEN iivv.id=''24'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''   ' + #13#10 +
	 ' WHEN iivv.id=''24'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''   ' + #13#10 +
	 ' WHEN iivv.id=''24'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' + #13#10 +
	 ' WHEN iivv.id=''26'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''   ' + #13#10 +
	 ' WHEN iivv.id=''26'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''   ' + #13#10 +
	 ' WHEN iivv.id=''26'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' + #13#10 +
	 ' WHEN iivv.id=''28'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''   ' + #13#10 +
	 ' WHEN iivv.id=''28'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' + #13#10 +
	 ' WHEN iivv.id=''28'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' + #13#10 +
	 ' WHEN iivv.id=''32'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''620''   ' + #13#10 +
	 ' WHEN iivv.id=''32'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''420''  	' + #13#10 +
	 ' WHEN iivv.id=''32'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''320''   ' + #13#10 +
	 ' WHEN iivv.id=''34'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''620''   ' + #13#10 +
	 ' WHEN iivv.id=''34'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''420''   ' + #13#10 +
	 ' WHEN iivv.id=''34'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''320''   ' + #13#10 +
	 ' WHEN iivv.id=''36'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' + #13#10 +
	 ' WHEN iivv.id=''36'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''   ' + #13#10 +
	 ' WHEN iivv.id=''36'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' + #13#10 +
	 ' WHEN iivv.id=''42'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' + #13#10 +
	 ' WHEN iivv.id=''42'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' + #13#10 +
	 ' WHEN iivv.id=''42'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' + #13#10 +
	 ' WHEN iivv.id=''45'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' + #13#10 +
	 ' WHEN iivv.id=''45'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' + #13#10 +
	 ' WHEN iivv.id=''45'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' + #13#10 +
	 ' WHEN iivv.id=''47'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' + #13#10 +
	 ' WHEN iivv.id=''47'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' + #13#10 +
	 ' WHEN iivv.id=''47'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' + #13#10 +
	 ' WHEN iivv.id=''291'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +	
	 ' WHEN iivv.id=''291'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''291'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''50'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' + #13#10 +
	 ' WHEN iivv.id=''50'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' + #13#10 +
	 ' WHEN iivv.id=''50'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' + #13#10 +
	 ' WHEN iivv.id=''349'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''349'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''349'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''51'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''   ' + #13#10 +
	 ' WHEN iivv.id=''51'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' + #13#10 +
	 ' WHEN iivv.id=''51'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' + #13#10 +
	 ' WHEN iivv.id=''61'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' + #13#10 +
	 ' WHEN iivv.id=''61'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' + #13#10 +
	 ' WHEN iivv.id=''61'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' + #13#10 +
	 ' WHEN iivv.id=''366'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''366'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''366'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''67'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' + #13#10 +
	 ' WHEN iivv.id=''67'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' + #13#10 +
	 ' WHEN iivv.id=''67'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' + #13#10 +
	 ' WHEN iivv.id=''70'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''602''  	' + #13#10 +
	 ' WHEN iivv.id=''70'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''402''  	' + #13#10 +
	 ' WHEN iivv.id=''70'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''302''   ' + #13#10 +
	 ' WHEN iivv.id=''77'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''612''  	' + #13#10 +
	 ' WHEN iivv.id=''81'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' + #13#10 +
	 ' WHEN iivv.id=''81'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' + #13#10 +
	 ' WHEN iivv.id=''81'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' + #13#10 +
	 ' WHEN iivv.id=''270'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''604''  ' + #13#10 +
   ' WHEN iivv.id=''270'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''404''  ' + #13#10 +
	 ' WHEN iivv.id=''270'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''304''  ' + #13#10 +
 	 ' WHEN iivv.id=''276'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''604''  ' + #13#10 +
	 ' WHEN iivv.id=''276'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''404''  ' + #13#10 +
	 ' WHEN iivv.id=''276'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''304''  ' + #13#10 +
	 ' WHEN iivv.id=''101'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''101'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''101'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''102'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''612''  ' + #13#10 +
	 ' WHEN iivv.id=''111'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''0''    ' + #13#10 +
	 ' WHEN iivv.id=''111'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''313''  ' + #13#10 +
	 ' WHEN iivv.id=''112'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''623''  ' + #13#10 +
	 ' WHEN iivv.id=''112'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''313''  ' + #13#10 +
	 ' WHEN iivv.id=''113'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''623''  ' + #13#10 +
	 ' WHEN iivv.id=''117'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +	
	 ' WHEN iivv.id=''117'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''117'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''118'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +	
	 ' WHEN iivv.id=''118'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''118'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''257'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''604''  ' + #13#10 +	
	 ' WHEN iivv.id=''257'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''404''  ' + #13#10 +
	 ' WHEN iivv.id=''257'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''304''  ' + #13#10 +
	 ' WHEN iivv.id=''341'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''341'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''341'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''139'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''139'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''139'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''140'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +	
	 ' WHEN iivv.id=''140'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''140'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''149'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''632''  ' + #13#10 +
	 ' WHEN iivv.id=''388'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''388'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''388'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''151'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''618''  ' + #13#10 +
	 ' WHEN iivv.id=''152'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''152'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''152'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''362'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''362'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''362'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''161'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''161'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +	
	 ' WHEN iivv.id=''161'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''165'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''165'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +	
	 ' WHEN iivv.id=''165'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''172'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''172'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''172'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''186'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''186'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''186'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''365'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''365'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''365'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''189'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''189'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''189'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''190'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''190'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''190'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''191'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''191'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''191'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''197'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''197'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''197'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''238'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''604''  ' + #13#10 +
	 ' WHEN iivv.id=''238'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''404''  ' + #13#10 +
	 ' WHEN iivv.id=''238'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''304''  ' + #13#10 +
	 ' WHEN iivv.id=''236'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''236'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''236'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''209'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''209'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''209'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''219'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''219'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''219'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''323'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''604''  ' + #13#10 +
	 ' WHEN iivv.id=''323'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''404''  ' + #13#10 +
	 ' WHEN iivv.id=''323'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''304''  ' + #13#10 +
	 ' WHEN iivv.id=''223'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''223'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''223'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''225'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''225'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''225'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' WHEN iivv.id=''233'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' + #13#10 +
	 ' WHEN iivv.id=''233'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' + #13#10 +
	 ' WHEN iivv.id=''233'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' + #13#10 +
	 ' ELSE ''CONFIRMAR CÓDIGO'' END AS [DESPESA]						    ' + #13#10 +
   ' ,CONVERT(VARCHAR(10),B.CREATED,103) AS [DATA DOCUMENTO]              ' + #13#10 +
	 ' , CONVERT(VARCHAR(MAX), SUM(IIV.PRICE)) AS [VALOR]						    ' + #13#10 +
	 ' ,''2'' AS [ADIANTADO]											    ' + #13#10 +
	 ' ,convert(varchar(max),B.nr_nota) AS [DOCUMENTO]										    ' + #13#10 +
	 ' ,''1'' AS [PAGO POR]											    ' + #13#10 +
	 ' ,''197'' AS [FORNECEDOR]										    ' + #13#10 +
 	 ' ,NULL AS [Desc. Despesa]									    ' + #13#10 +
	 ' FROM MYINDAIAV2.DBO.Billing B (NOLOCK)						' + #13#10 +
	 ' LEFT JOIN MYINDAIAV2.DBO.Billing_ItemInvoiced IV (NOLOCK) ON IV.Billing_id = B.id   ' + #13#10 +
     ' LEFT JOIN MYINDAIAV2.DBO.ItemInvoiced IIV (NOLOCK) ON IIV.id = IV.itensInvoiced_id   ' + #13#10 +
     ' LEFT JOIN MYINDAIAV2.DBO.ITEM IIVV (NOLOCK) ON IIVV.id = IIV.item_id    ' + #13#10 +
     ' LEFT JOIN MYINDAIAV2.DBO.CustomClearance CC (NOLOCK) ON CC.ID = IIV.customClearance_id    ' + #13#10 +
     ' LEFT JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = CC.customID   ' + #13#10 +
	 ' INNER JOIN BROKER.DBO.TSERVICO_NOVO SN (NOLOCK) ON SN.CD_SERVICO = TP.CD_SERVICO   ';

end;

function TFormRlFerreroFaturadosExpoCtx.GetWhere: string;
begin
  Result := 'WHERE B.STATUS = ''INVOICED'' ' +
            '		AND TP.CD_GRUPO = ''644'' ' ;

end;

function TFormRlFerreroFaturadosExpoCtx.GetGroupby: string;
begin
  Result :=
            ' GROUP BY ' +
            '  CASE     '  +
	 ' WHEN iivv.id=''3'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''    ' +
	 ' WHEN iivv.id=''3'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''    ' +
	 ' WHEN iivv.id=''3'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''    ' +
	 ' WHEN iivv.id=''9'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''    ' +
	 ' WHEN iivv.id=''9'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''    ' +
	 ' WHEN iivv.id=''9'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''    ' +
	 ' WHEN iivv.id=''13'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''602''   ' +
	 ' WHEN iivv.id=''13'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''402''  	' +
	 ' WHEN iivv.id=''13'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''302''   ' +
	 ' WHEN iivv.id=''16'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''602''   ' +
	 ' WHEN iivv.id=''16'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''402''  	' +
	 ' WHEN iivv.id=''16'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''302''   ' +
	 ' WHEN iivv.id=''21'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''311''   ' +
	 ' WHEN iivv.id=''23'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''   ' +
	 ' WHEN iivv.id=''23'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''   ' +
	 ' WHEN iivv.id=''23'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' +
	 ' WHEN iivv.id=''24'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''   ' +
	 ' WHEN iivv.id=''24'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''   ' +
	 ' WHEN iivv.id=''24'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' +
	 ' WHEN iivv.id=''26'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''   ' +
	 ' WHEN iivv.id=''26'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''   ' +
	 ' WHEN iivv.id=''26'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' +
	 ' WHEN iivv.id=''28'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''   ' +
	 ' WHEN iivv.id=''28'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' +
	 ' WHEN iivv.id=''28'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' +
	 ' WHEN iivv.id=''32'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''620''   ' +
	 ' WHEN iivv.id=''32'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''420''  	' +
	 ' WHEN iivv.id=''32'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''320''   ' +
	 ' WHEN iivv.id=''34'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''620''   ' +
	 ' WHEN iivv.id=''34'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''420''   ' +
	 ' WHEN iivv.id=''34'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''320''   ' +
	 ' WHEN iivv.id=''36'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' +
	 ' WHEN iivv.id=''36'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''   ' +
	 ' WHEN iivv.id=''36'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' +
	 ' WHEN iivv.id=''42'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' +
	 ' WHEN iivv.id=''42'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' +
	 ' WHEN iivv.id=''42'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' +
	 ' WHEN iivv.id=''45'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' +
	 ' WHEN iivv.id=''45'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' +
	 ' WHEN iivv.id=''45'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' +
	 ' WHEN iivv.id=''47'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' +
	 ' WHEN iivv.id=''47'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' +
	 ' WHEN iivv.id=''47'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' +
	 ' WHEN iivv.id=''291'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''291'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''291'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''50'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' +
	 ' WHEN iivv.id=''50'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' +
	 ' WHEN iivv.id=''50'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' +
	 ' WHEN iivv.id=''349'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''349'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''349'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''51'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''   ' +
	 ' WHEN iivv.id=''51'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' +
	 ' WHEN iivv.id=''51'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' +
	 ' WHEN iivv.id=''61'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' +
	 ' WHEN iivv.id=''61'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' +
	 ' WHEN iivv.id=''61'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' +
	 ' WHEN iivv.id=''366'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''366'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''366'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''67'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' +
	 ' WHEN iivv.id=''67'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' +
	 ' WHEN iivv.id=''67'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' +
	 ' WHEN iivv.id=''70'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''602''  	' +
	 ' WHEN iivv.id=''70'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''402''  	' +
	 ' WHEN iivv.id=''70'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''302''   ' +
	 ' WHEN iivv.id=''77'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''612''  	' +
	 ' WHEN iivv.id=''81'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  	' +
	 ' WHEN iivv.id=''81'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  	' +
	 ' WHEN iivv.id=''81'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''   ' +
	 ' WHEN iivv.id=''270'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''604''  ' +
	 ' WHEN iivv.id=''270'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''404''  ' +
	 ' WHEN iivv.id=''270'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''304''  ' +
	 ' WHEN iivv.id=''276'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''604''  ' +
	 ' WHEN iivv.id=''276'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''404''  ' +
	 ' WHEN iivv.id=''276'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''304''  ' +
	 ' WHEN iivv.id=''101'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''101'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''101'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''102'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''612''  ' +
	 ' WHEN iivv.id=''111'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''0''    ' +
	 ' WHEN iivv.id=''111'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''313''  ' +
	 ' WHEN iivv.id=''112'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''623''  ' +
	 ' WHEN iivv.id=''112'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''313''  ' +
	 ' WHEN iivv.id=''113'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''623''  ' +
	 ' WHEN iivv.id=''117'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''117'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''117'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''118'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''118'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''118'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''257'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''604''  ' +
	 ' WHEN iivv.id=''257'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''404''  ' +
	 ' WHEN iivv.id=''257'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''304''  ' +
	 ' WHEN iivv.id=''341'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''341'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''341'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''139'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''139'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''139'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''140'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''140'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''140'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''149'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''632''  ' +
	 ' WHEN iivv.id=''388'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''388'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''388'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''151'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''618''  ' +
	 ' WHEN iivv.id=''152'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''152'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''152'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''362'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''362'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''362'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''161'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''161'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''161'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''165'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''165'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''165'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''172'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''172'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''172'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''186'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''186'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''186'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''365'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''365'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''365'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''189'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''189'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''189'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''190'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''190'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''190'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''191'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''191'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''191'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''197'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''197'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''197'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''238'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''604''  ' +
	 ' WHEN iivv.id=''238'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''404''  ' +
	 ' WHEN iivv.id=''238'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''304''  ' +
	 ' WHEN iivv.id=''236'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''236'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''236'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''209'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''209'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''209'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''219'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''219'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''219'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''323'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''604''  ' +
	 ' WHEN iivv.id=''323'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''404''  ' +
	 ' WHEN iivv.id=''323'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''304''  ' +
	 ' WHEN iivv.id=''223'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''223'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''223'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''225'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''225'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''225'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' WHEN iivv.id=''233'' AND SN.CD_VIA_TRANSPORTE=''01'' THEN ''611''  ' +
	 ' WHEN iivv.id=''233'' AND SN.CD_VIA_TRANSPORTE=''07'' THEN ''411''  ' +
	 ' WHEN iivv.id=''233'' AND SN.CD_VIA_TRANSPORTE=''04'' THEN ''311''  ' +
	 ' ELSE ''CONFIRMAR CÓDIGO'' END , TP.NR_PROCESSO, B.NR_NOTA, B.CREATED '      ;
end;


end.

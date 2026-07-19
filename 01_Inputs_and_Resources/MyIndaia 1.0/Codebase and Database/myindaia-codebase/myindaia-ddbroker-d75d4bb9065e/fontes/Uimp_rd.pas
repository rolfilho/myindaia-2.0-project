{-----------------------------------------}
{Form de Impressão do Rel. de Despesas    }
{ kleber Guedes - 03/11/2005              }
{-----------------------------------------}

{alterar o nr. do RD quando liberado para todos}
unit Uimp_rd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, StdCtrls, Buttons, ppBands, ppCache, ppClass,
  ppComm, ppRelatv, ppProd, ppReport, DB, DBTables, ppPrnabl, ppCtrls,
  RxGIF, ppDB, ppDBPipe, ppDBBDE, ppVar, ppParameter, Grids, DBGrids,
  ppModule, raCodMod, ppStrtch, ppSubRpt, ComCtrls, Tabs, jpeg;

type
  Tfrm_impressao_rd = class(TForm)
    panel_fundo: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    ds_imp_rd: TDataSource;
    qry_imp_rd_: TQuery;
    ppBDEimp_rd: TppBDEPipeline;
    qry_imp_rd_NR_CONHECIMENTO: TStringField;
    qry_imp_rd_NR_PROCESSO: TStringField;
    qry_imp_rd_CD_REFERENCIA: TStringField;
    qry_imp_rd_CD_ITEM: TStringField;
    qry_imp_rd_NM_ITEM: TStringField;
    qry_imp_rd_VL_PAGTO: TFloatField;
    qry_imp_rd_DT_PAGTO: TDateTimeField;
    qry_imp_rd_NM_EMPRESA: TStringField;
    qry_imp_rd_CGC_EMPRESA: TStringField;
    qry_imp_rd_NM_FAVORECIDO: TStringField;
    qry_imp_rd_CGC_EMPRESA_1: TStringField;
    qry_imp_rd_AP_BANCO: TStringField;
    qry_imp_rd_NR_CONTA: TStringField;
    qry_imp_rd_CD_AGENCIA: TStringField;
    qry_imp_rd_CD_UNID_NEG: TStringField;
    qry_imp_rd_CD_PRODUTO: TStringField;
    qry_imp_rd_CD_FAVORECIDO: TStringField;
    qry_imp_rd_CD_CLIENTE: TStringField;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    qry_imp_rd_TRANSPORTE: TStringField;
    qry_imp_rd_PROCESSO: TStringField;
    Panel4: TPanel;
    qry_imp_total_: TQuery;
    ds_imp_total: TDataSource;
    qry_imp_total_CD_FAVORECIDO: TStringField;
    qry_imp_total_calc_ValorExtenso: TStringField;
    qry_imp_total_VL_PAGTO: TFloatField;
    ppBDEPipeline1: TppBDEPipeline;
    qry_imp_total_CD_CLIENTE: TStringField;
    qry_imp_rd_PRODUTO: TStringField;
    qry_imp_total_CD_GRUPO: TStringField;
    qry_imp_total_CD_BANCO: TStringField;
    qry_imp_total_CD_PRODUTO: TStringField;
    qry_imp_total_CD_UNID_NEG: TStringField;
    qry_integ_rd_: TQuery;
    ds_integ_rd: TDataSource;
    tab: TTabSet;
    note: TNotebook;
    Label2: TLabel;
    edt_cd_unid_neg: TEdit;
    Label3: TLabel;
    edt_cd_produto: TEdit;
    Label4: TLabel;
    edt_cd_grupo: TEdit;
    Label5: TLabel;
    edt_cd_cliente: TEdit;
    Panel3: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    dt_inicio: TMaskEdit;
    dt_final: TMaskEdit;
    edt_nm_cliente: TEdit;
    edt_nm_grupo: TEdit;
    edt_nm_produto: TEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    btn_co_produto: TSpeedButton;
    btn_co_grupo: TSpeedButton;
    btn_co_cliente: TSpeedButton;
    btn_print_: TSpeedButton;
    btn_chama: TSpeedButton;
    pnlAux: TPanel;
    pnl_rd: TPanel;
    btn_print_2: TSpeedButton;
    btn_sair: TSpeedButton;
    Label10: TLabel;
    edt_rd2: TEdit;
    Label12: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    edt_cd_produto2: TEdit;
    edt_cd_unid_neg2: TEdit;
    edt_nm_unid_neg2: TEdit;
    edt_nm_produto2: TEdit;
    btn_co_produto2: TSpeedButton;
    btn_co_unid_neg2: TSpeedButton;
    Label14: TLabel;
    edt_processo: TEdit;
    Label15: TLabel;
    edt_cd_grupo2: TEdit;
    Label16: TLabel;
    edt_cd_cliente2: TEdit;
    Panel6: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    dt_inicio2: TMaskEdit;
    dt_final2: TMaskEdit;
    edt_nm_cliente2: TEdit;
    edt_nm_grupo2: TEdit;
    btn_co_grupo2: TSpeedButton;
    btn_co_cliente2: TSpeedButton;
    btn_co_processo2: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    edt_nr_rd: TEdit;
    btn_txt_: TSpeedButton;
    Bevel3: TBevel;
    lbl_ult_rd: TLabel;
    Bevel4: TBevel;
    pnl_aguarde: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    bar: TProgressBar;
    ppBDEPipeline1ppField4: TppField;
    qry_imp_total_NR_RD: TStringField;
    qry_imp_rd_NR_RD: TStringField;
    ppBDEimp_rdppField22: TppField;
    check_imp: TCheckBox;
    ds_integ_rd2: TDataSource;
    qry_integ_rd2: TQuery;
    ppBDEPipeline1ppField10: TppField;
    qry_imp_total_DT_SOLIC_PAGTO: TDateTimeField;
    qry_imp_total_NR_CONTA: TStringField;
    qry_imp_total_CD_AGENCIA: TStringField;
    ppBDEPipeline1ppField11: TppField;
    ppBDEPipeline1ppField12: TppField;
    qry_imp_total_NM_GRUPO: TStringField;
    ppBDEPipeline1ppField13: TppField;
    qry_imp_total_calcConta: TStringField;
    qry_imp_total_calcAgencia: TStringField;
    ppBDEPipeline1ppField14: TppField;
    ppBDEPipeline1ppField15: TppField;
    ppHeaderBand2: TppHeaderBand;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLine26: TppLine;
    ppLabel43: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel44: TppLabel;
    ppDBText3: TppDBText;
    ppDetailBand3: TppDetailBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppFooterBand2: TppFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLabel45: TppLabel;
    ppDBText30: TppDBText;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLabel46: TppLabel;
    ppDBText31: TppDBText;
    ppLabel47: TppLabel;
    ppDBText32: TppDBText;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLabel55: TppLabel;
    ppLabel57: TppLabel;
    ppDBText33: TppDBText;
    ppLabel58: TppLabel;
    ppDBText34: TppDBText;
    ppLabel59: TppLabel;
    ppDBText35: TppDBText;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLabel60: TppLabel;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppLabel61: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppImage4: TppImage;
    ppImage5: TppImage;
    ppImage6: TppImage;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape6: TppShape;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLine45: TppLine;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLine46: TppLine;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLine47: TppLine;
    ppLabel70: TppLabel;
    ppLine48: TppLine;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLine49: TppLine;
    ppLabel73: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel74: TppLabel;
    ppDBText39: TppDBText;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppDBText40: TppDBText;
    ppLabel80: TppLabel;
    ppLine50: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    qry_imp_rd_SAP_USA: TStringField;
    ppBDEimp_rdppField23: TppField;
    ppDBText4: TppDBText;
    ppLabel4: TppLabel;
    procedure FormShow(Sender: TObject);
    procedure edt_cd_grupoEnter(Sender: TObject);
    procedure edt_cd_unid_negExit(Sender: TObject);
    procedure btn_print_Click(Sender: TObject);
    procedure edt_cd_produtoExit(Sender: TObject);
    procedure edt_cd_grupoExit(Sender: TObject);
    procedure edt_cd_clienteExit(Sender: TObject);
    procedure edt_cd_clienteEnter(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure dt_inicioExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure edt_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qry_imp_total_CalcFields(DataSet: TDataSet);
    procedure btn_txt_Click(Sender: TObject);
    procedure btn_chamaClick(Sender: TObject);
    procedure tabChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure edt_rd2Exit(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_co_unid_neg2Click(Sender: TObject);
    procedure btn_co_produto2Click(Sender: TObject);
    procedure edt_cd_grupo2Enter(Sender: TObject);
    procedure edt_cd_grupo2Exit(Sender: TObject);
    procedure btn_co_grupo2Click(Sender: TObject);
    procedure btn_co_cliente2Click(Sender: TObject);
    procedure dt_inicio2Exit(Sender: TObject);
    procedure edt_cd_unid_neg2Exit(Sender: TObject);
    procedure edt_cd_produto2Exit(Sender: TObject);
    procedure edt_cd_cliente2Enter(Sender: TObject);
    procedure edt_cd_cliente2Exit(Sender: TObject);
    procedure btn_co_processo2Click(Sender: TObject);
    procedure edt_processoExit(Sender: TObject);
    procedure edt_nr_rdExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_print_2Click(Sender: TObject);

  private
    { Private declarations }

    unid_neg, prod: string;
    ult_rd, rd: string[8];
    dt_server, vData:  TdateTime;
    txt_padrao, rd_padrao1, rd_padrao2, txt_padrao2: string;
    reimp: boolean;
  public
    { Public declarations }
    procedure limpa(secao: string);
  end;

var
  frm_impressao_rd: Tfrm_impressao_rd;
  function acrescenta_zero(valor: string; quant: integer): string;
  function COMPLETA_COM_ZEROS(pValor: String) : String;
  procedure habilita_imprimir(tipo: integer);


implementation

uses Funcoes, PGGP017, GSMLIB, PGSM990, PGSM102, DateUtils, ConsOnLineEx;

{$R *.dfm}

function COMPLETA_COM_ZEROS(pValor: String) : String;
var
  NCD : Integer;

begin
  if (pValor <> '') then
  begin
    NCD := 2;
    if Pos(',',pValor) = 0 then pValor := pValor + ',';
    while Length(Trim(Copy(pValor, Pos(',',pValor) + 1, Length(pValor)))) < NCD do pValor := pValor + '0';
    while Length(Trim(Copy(pValor, Pos(',',pValor) + 1, Length(pValor)))) > NCD do Delete(pValor,Length(pValor),1);
  end;
  Result := pValor;
end;



procedure Tfrm_impressao_rd.FormShow(Sender: TObject);
begin
  //passa dt_server
{  dt_server := datm_main.sp_data_hora_server.ParamByName('@dt_nt_server').AsDateTime;
  dt_server := StrToDate(DateToStr(dt_server));}
  with datm_main do
  begin
    try
      CloseStoredProc(sp_data_hora_server);
      ExecStoredProc(sp_data_hora_server);
      dt_server := sp_data_hora_server.ParamByName('@dt_nt_server').AsDateTime;
      dt_server := StrToDate(DateToStr(dt_server));
      CloseStoredProc(sp_data_hora_server);
    except
      on E: Exception do
      begin
        TrataErro(E);
        dt_server := Date;
      end;
    end;
  end;
  //passa parametro de unidade e produto
  unid_neg := ConsultaLookUpSQL('SELECT CD_UNID_NEG FROM TUSUARIO_HABILITACAO WHERE IN_DEFAULT = ''1'' AND CD_USUARIO = ' + QuotedStr(str_cd_usuario), 'CD_UNID_NEG');
  prod     := ConsultaLookUpSQL('SELECT CD_PRODUTO  FROM TUSUARIO_HABILITACAO WHERE IN_DEFAULT = ''1'' AND CD_USUARIO = ' + QuotedStr(str_cd_usuario), 'CD_PRODUTO');
  edt_cd_unid_neg.Text := unid_neg;
  edt_nm_unid_neg.Text := ConsultaLookUp('TUNID_NEG', 'CD_UNID_NEG', unid_neg, 'NM_UNID_NEG');
  edt_cd_produto.Text  := prod;
  edt_nm_produto.Text  := ConsultaLookUp('TPRODUTO', 'CD_PRODUTO', prod, 'NM_PRODUTO');
  edt_cd_unid_neg2.Text := unid_neg;
  edt_nm_unid_neg2.Text := ConsultaLookUp('TUNID_NEG', 'CD_UNID_NEG', unid_neg, 'NM_UNID_NEG');
  edt_cd_produto2.Text  := prod;
  edt_nm_produto2.Text  := ConsultaLookUp('TPRODUTO', 'CD_PRODUTO', prod, 'NM_PRODUTO');

  //datas padrão
  dt_inicio.Text  := DateToStr(now);
  dt_final.Text   := DateToStr(now);
  dt_inicio2.Text := DateToStr(now);
  dt_final2.Text  := DateToStr(now);

  //passa nr. do RD
  with datm_main.tbl_parametro_ do
  begin
    Close;
    Open;
    ult_rd := FieldByName('NR_ULT_RD').AsString;
  end;
  lbl_ult_rd.Caption := 'Último RD impresso nº: ' + ult_rd ;
  if FormatDateTime('YY', dt_server) = Copy(ult_rd, 1,2) then
    begin
      rd := FormatDateTime('YY', dt_server) + '/' + acrescenta_zero(IntToStr(StrToInt(Copy(ult_rd, 4,5)) + 1), 5);
    end
    else
      rd := FormatDateTime('YY', dt_server) + '/00001';

end;

function acrescenta_zero(valor: string; quant: integer): string;
begin
  Result := '';
  while length(valor) < quant do
        valor := '0' + valor;
  Result := valor;
end;

procedure habilita_imprimir(tipo: integer);
var ok: boolean;
begin
  ok := true;
  with frm_impressao_rd do
  begin
    if tipo = 0 then //botão imprimir...
    begin
      if (edt_cd_unid_neg.Text = '')    or  ((edt_cd_unid_neg.Text <> '') and (edt_nm_unid_neg.Text = '')) then ok := false;
      if (edt_cd_produto.Text = '')     or  ((edt_cd_produto.Text <> '')  and (edt_nm_produto.Text = ''))  then ok := false;
      if (edt_cd_grupo.Text <> '')       and (edt_nm_grupo.Text = '')       then ok := false;
      if (edt_cd_cliente.Text <> '')     and (edt_nm_cliente.Text = '')     then ok := false;
      if (dt_inicio.Text = '  /  /    ') or  (dt_final.Text = '  /  /    ') then ok := false;
    end
    else if tipo = 1 then //botão gerar arquivo texto
    begin
      if (edt_nr_rd.Text = '') and (edt_processo.Text = '') then
      begin
        if (edt_cd_unid_neg2.Text = '')    or  ((edt_cd_unid_neg2.Text <> '') and (edt_nm_unid_neg2.Text = '')) then ok := false;
        if (edt_cd_produto2.Text = '')     or  ((edt_cd_produto2.Text <> '')  and (edt_nm_produto2.Text = ''))  then ok := false;
        if (edt_cd_grupo2.Text <> '')       and (edt_nm_grupo2.Text = '')       then ok := false;
        if (edt_cd_cliente2.Text <> '')     and (edt_nm_cliente2.Text = '')     then ok := false;
        if (dt_inicio2.Text = '  /  /    ') or  (dt_final2.Text = '  /  /    ') then ok := false;
        if StrToDate(dt_final2.Text) < StrToDate(dt_inicio2.Text) then  ok := false
      end;
    end;


    if ok then
    begin
       if tipo = 0 then btn_print_.Enabled := true;
       if tipo = 1 then btn_txt_.Enabled := true;
    end else begin
       if tipo = 0 then btn_print_.Enabled := false;
       if tipo = 1 then btn_txt_.Enabled := false;
    end;

  end;
end;


procedure Tfrm_impressao_rd.edt_cd_grupoEnter(Sender: TObject);
begin
  //bloqueia acesso a clientes
  if edt_cd_cliente.Text = '' then
  begin
    edt_cd_cliente.Enabled := false;
    edt_cd_cliente.Color := clmenu;
  end;
end;

procedure Tfrm_impressao_rd.edt_cd_unid_negExit(Sender: TObject);
begin
  //faz pesquisa do nome
  if edt_cd_unid_neg.Text <> '' then
     edt_cd_unid_neg.Text := acrescenta_zero(edt_cd_unid_neg.Text, 2) ;
  edt_nm_unid_neg.Text := ConsultaLookUp('TUNID_NEG', 'CD_UNID_NEG', edt_cd_unid_neg.Text, 'NM_UNID_NEG');
  //verifica código
  if (edt_cd_unid_neg.Text = '') or (edt_nm_unid_neg.Text = '') then
  begin
      BoxMensagem('Unidade de Negociação não existente ou não permitida!', 2);
      edt_cd_unid_neg.SetFocus;
  end;

  //verifica habilitação
  if ConsultaLookUPSQL('SELECT UH.CD_UNID_NEG FROM TUSUARIO_HABILITACAO UH, TUSUARIO U WHERE UH.CD_UNID_NEG = '
                        + QuotedStr(edt_cd_unid_neg.Text)
                        + ' AND U.CD_USUARIO = ' + QuotedStr(str_cd_usuario), 'CD_UNID_NEG') = '' then
   begin
     BoxMensagem('Unidade de Negócio não cadastrada ou não habilitada para Usuário', 2);
     edt_cd_unid_neg.Text := '';
     edt_cd_unid_neg.SetFocus;
   end;
  //habilita ou não botão de imprimir
  habilita_imprimir(0);
end;

procedure Tfrm_impressao_rd.edt_cd_produtoExit(Sender: TObject);
begin
 //faz pesquisa do nome
  if edt_cd_produto.Text <> '' then
     edt_cd_produto.Text := acrescenta_zero(edt_cd_produto.Text, 2);
  edt_nm_produto.Text := ConsultaLookUp('TPRODUTO', 'CD_PRODUTO', edt_cd_produto.Text, 'NM_PRODUTO');
  //verifica código
  if (edt_cd_produto.Text <> '') and (edt_nm_produto.Text = '') then
  begin
    BoxMensagem('Produto não existente!', 2);
    edt_cd_produto.SetFocus;
  end;
  //verifica habilitação
  if (ConsultaLookUPSQL('SELECT UH.CD_UNID_NEG FROM TUSUARIO_HABILITACAO UH, TUSUARIO U WHERE UH.CD_UNID_NEG = '
                     + QuotedStr(edt_cd_unid_neg.Text) + ' AND U.CD_USUARIO = ' + QuotedStr(str_cd_usuario),
                     'CD_UNID_NEG') = '') or
   (ConsultaLookUPSQL('SELECT UH.CD_PRODUTO FROM TUSUARIO_HABILITACAO UH, TUSUARIO U WHERE UH.CD_PRODUTO = '
                     + QuotedStr(edt_cd_produto.Text) +
                     ' AND CD_UNID_NEG = '  + QuotedStr(edt_cd_unid_neg.Text) +
                     ' AND U.CD_USUARIO = ' + QuotedStr(str_cd_usuario),
                     'CD_PRODUTO') = '') then
   begin
     BoxMensagem('Unidade de Negócio X Produto não cadastrada ou sem habilitação!', 2);
     edt_cd_produto.Text := '';
     edt_cd_unid_neg.Text := '';
     edt_cd_unid_neg.Clear;
   end;

   //habilita ou não botão de imprimir
   habilita_imprimir(0);

end;

procedure Tfrm_impressao_rd.edt_cd_grupoExit(Sender: TObject);
begin
  //faz pesquisa do nome
  if edt_cd_grupo.Text <> '' then
     edt_cd_grupo.Text := acrescenta_zero(edt_cd_grupo.Text, 3);
  edt_nm_grupo.Text := ConsultaLookUp('TGRUPO', 'CD_GRUPO', edt_cd_grupo.Text, 'NM_GRUPO');
  //verifica código
  if (edt_cd_grupo.Text <> '') and (edt_nm_grupo.Text = '') then
  begin
    BoxMensagem('Grupo de clientes não existente!', 2);
    edt_cd_grupo.SetFocus;
  end;

  //todos
  if edt_cd_grupo.Text = '' then
  begin
    edt_cd_cliente.Enabled := true;
    edt_cd_cliente.Color := clwhite;

  end
  else
    dt_inicio.SetFocus;

  //habilita ou não botão de imprimir
  habilita_imprimir(0);

end;

procedure Tfrm_impressao_rd.edt_cd_clienteExit(Sender: TObject);
begin
  //faz pesquisa do nome
  if edt_cd_cliente.Text <> '' then
     edt_cd_cliente.Text := acrescenta_zero(edt_cd_cliente.Text, 5);

  edt_nm_cliente.Text := ConsultaLookUp('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_cliente.Text, 'AP_EMPRESA');
  //verifica código
  if (edt_cd_cliente.Text <> '') and (edt_nm_cliente.Text = '') then
  begin
    BoxMensagem('Cliente não existente!', 2);
    edt_cd_cliente.SetFocus;
  end;

  //todos
  if edt_cd_cliente.Text = '' then
  begin
    edt_nm_cliente.Text := 'Todos';
    edt_cd_grupo.Enabled := true;
    edt_cd_grupo.Color := clwhite;
  end
  else
    dt_inicio.SetFocus;

  //habilita ou não botão de imprimir
  habilita_imprimir(0);
end;

procedure Tfrm_impressao_rd.btn_print_Click(Sender: TObject);
var
  rds_gerados:    string;
  ult_itemDI:     string[1];
  ult_favorecido: string[5];
  ult_area:       string[3];
  qry, qryDt : tQuery;
begin
  if StrToDate(dt_final.Text) >= StrToDate(dt_inicio.Text) then
  begin
    try
      datm_main.db_broker.StartTransaction;
{-------- ABRE A QUERY PRINCIPAL BASEADO NOS FILTROS ---------------------------------------------------------------------------------------------------------------------------------------------}
      //passa parametros para a query principal
      qry := TQuery.Create(application);
      with qry do
      begin
        Close;
        DataBaseName := 'DBBROKER';
        SQL.Add('SELECT SP.NR_PROCESSO, SP.CD_ITEM, SP.NR_LANCAMENTO, SP.NR_RD, I.IN_ITEM_DI,  SP.CD_FAVORECIDO, P.CD_CLIENTE, SP.VL_PAGTO, SP.DT_PAGTO,  P.CD_UNID_NEG, P.CD_PRODUTO, ');
        SQL.Add('       P.CD_AREA, (SELECT NM_GRUPO FROM TAREA (NOLOCK) WHERE CD_AREA = P.CD_AREA) GRUPO_AREA ');
        SQL.Add('FROM   TPROCESSO P (NOLOCK), TSOLIC_PAGTO SP (NOLOCK), TITEM I (NOLOCK) ');
        SQL.Add('WHERE SP.CD_STATUS  = ''0''                            AND ');
        SQL.Add('      SP.TP_DESTINO = ''5''                            AND ');
        SQL.Add('      SP.NR_PROCESSO = P.NR_PROCESSO                   AND ');
        SQL.Add('      I.CD_ITEM = SP.CD_ITEM                          AND ');
        SQL.Add('      SP.DT_SOLIC_PAGTO BETWEEN CONVERT(datetime, ''' + dt_inicio.Text + ''', 103) AND CONVERT(datetime, ' + QuotedStr(dt_final.text) + ', 103) AND ');
        SQL.Add('      ISNULL(SP.NR_RD, '''') = '''' AND ');
        SQL.Add('      SUBSTRING(SP.NR_PROCESSO, 1, 2) = ''' + edt_cd_unid_neg.Text + ''' AND ');
        SQL.Add('      SUBSTRING(SP.NR_PROCESSO, 3, 2) = ''' + edt_cd_produto.Text  + ''' AND ');
        SQL.Add('      ((P.CD_CLIENTE = ''' + edt_cd_cliente.Text + ''')  OR  (P.CD_CLIENTE IN ( SELECT CD_EMPRESA FROM TEMPRESA_NAC WHERE CD_GRUPO = ''' + edt_cd_grupo.Text + ''') )) ');
        SQL.Add('ORDER BY GRUPO_AREA, P.CD_CLIENTE, SP.CD_FAVORECIDO, I.IN_ITEM_DI, SP.CD_ITEM, SP.NR_PROCESSO ');
        Prepare;
        //ShowMessage(SQL.Text);
        Open;

         if IsEmpty then
         begin
           BoxMensagem('Não há dados para exibir!!', 2);
           limpa('b');
           Exit;
         end;
  {-------- GERA NÚMERO DO RD NA TABELA DE SOLICITAÇÃO DE PAGAMENTO ---------------------------------------------------------------------------------------------------------------------------------------------}
       //barra
        pnlAux.Visible := true;
        pnl_aguarde.Visible := true;
        pnl_rd.Visible := false;
        bar.Max := qry.RecordCount;

        First;
        ult_area := FieldByName('GRUPO_AREA').AsString;
        ult_favorecido := FieldByName('CD_FAVORECIDO').AsString;
        ult_itemDI := FieldByName('IN_ITEM_DI').AsString;
        rds_gerados := QuotedStr(rd) +  ', ' ;


        while not Eof do
        begin
          //incrementa nr_rd ao trocar favorecido
          if (FieldByName('GRUPO_AREA').AsString <> ult_area) or (FieldByName('CD_FAVORECIDO').AsString <> ult_favorecido) or (FieldByName('IN_ITEM_DI').AsString <> ult_ItemDI) then
          begin
            rd := Copy(rd, 1, 3) + acrescenta_zero(IntToStr(StrToInt(Copy(rd, 4,5)) + 1), 5);
            rds_gerados := rds_gerados + QuotedStr(rd) + ', ';
          end;
          //faz update na tsolic_pagto com os rds gerados
          with TQuery.Create(application) do
          begin
            DatabaseName := 'DBBROKER';
            Close;
            SQL.Add('UPDATE TSOLIC_PAGTO SET NR_RD = ''' + rd + ''' WHERE NR_PROCESSO = ''' + qry.Fields[0].AsString + ''' AND CD_ITEM = ''' + qry.Fields[1].AsString + ''' AND NR_LANCAMENTO = ''' + qry.Fields[2].AsString + ''' ');
            ExecSQL;
            Free;
          end;
          bar.StepIt;
          ult_area := FieldByName('GRUPO_AREA').AsString;
          ult_favorecido := qry.FieldByName('CD_FAVORECIDO').AsString;
          ult_itemDI := FieldByName('IN_ITEM_DI').AsString;
          Next;
        end;

        rds_gerados := Copy(rds_gerados, 1, Length(rds_gerados) - 2);
        pnlAux.Visible := false;


      end;

      qry.Free;
      
      datm_main.db_broker.Commit;
    except
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      ShowMessage('Erro na Aplicação! Atualização de Borderô!');
      Exit;
    end;
{-------- ROTINA PARA INCLUIR DATA DE IMPRESSÃO DO BORDERÔ ---------------------------------------------------------------------------------------------------------------------------------------}
    repeat
      try
        if (vData > now) and (vData <> 0) then BoxMensagem('A Data deve ser menor que a atual', 2);
        vData := StrToDate(InputBox('Data do Borderô', 'Digite a data desejada: ', DateToStr(Now)));
      except
        BoxMensagem('Data Inválida!', 2);
        vData := 0;
      end;
    until (vData <> 0) and (vData <= now);
    try
      datm_main.db_broker.StartTransaction;
      
      qryDt := TQuery.Create(application);
      with qryDt do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        Close;
        SQL.Add('UPDATE TSOLIC_PAGTO SET DT_IMPR_RD = CONVERT(DATETIME, ''' + DateToStr(vData) + ''' , 103) ' );
        SQL.Add(' WHERE NR_RD IN (' + rds_gerados + ') ');
        ExecSQL;
        Free;
      end;
      datm_main.db_broker.Commit;
    except
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      ShowMessage('Erro na Aplicação! Atualização de Data');
      Exit;
    end;


{-------- ABRE A QUERY TOTAL BASEADO NOS RDS GERADOS ---------------------------------------------------------------------------------------------------------------------------------------------}
    //passa paremetros para a query total
    with qry_imp_total_ do
    begin
      Close;
      SQL.Text := rd_padrao1 + '       ISNULL(SP.NR_RD, '''') IN (' + rds_gerados + ') AND '
                             + '       SUBSTRING(SP.NR_PROCESSO, 1, 2) = ''' + edt_cd_unid_neg.Text + ''' AND '
                             + '       SUBSTRING(SP.NR_PROCESSO, 3, 2) = ''' + edt_cd_produto.Text + ''' '
                             + ' GROUP BY SP.NR_RD, A.NM_GRUPO, P.CD_GRUPO, P.CD_CLIENTE, SP.CD_FAVORECIDO, B.CD_BANCO, P.CD_PRODUTO, P.CD_UNID_NEG,  B1.NR_CONTA, B1.CD_AGENCIA '
                             + ' ORDER BY SP.NR_RD, P.CD_CLIENTE,SP.CD_FAVORECIDO ';

{                             + ' GROUP BY SP.NR_RD, P.CD_GRUPO, P.CD_CLIENTE, SP.CD_FAVORECIDO, B.CD_BANCO, P.CD_PRODUTO, P.CD_UNID_NEG '
                             + ' ORDER BY P.CD_CLIENTE,SP.CD_FAVORECIDO ';}
      Prepare;
      //ShowMessage(SQL.Text);
      Open;
    end;

{-------- ABRE A QUERY PRINCIPAL BASEADO NA QRY TOTAL ---------------------------------------------------------------------------------------------------------------------------------------------}
    with qry_imp_rd_ do
    begin
      Close;
      Prepare;
      //ShowMessage(SQL.Text);
      Open;
    end;


{-------- ROTINA DE IMPRESSÃO - EXIBE OU NÃO OS DADOS ---------------------------------------------------------------------------------------------------------------------------------------------}
    if qry_imp_rd_.IsEmpty then
    begin
//      BoxMensagem('Não há dados para exibir!!', 2);
      Application.MessageBox(PChar('IMPORTANTE !!' + #13#10 + 'Todos os borderôs foram gerados com sucesso: ' + rds_gerados + #13#10 +
                                   'Mas ocorreu um erro na Aplicação! Alguns borderôs podem não ser exibidos na impressão do Relatório!' + #13#10 +
                                   'Caso isto ocorra, reimprima os números gerados acima e contate o Suporte!' ), 'Erro de Impressão', MB_OK + MB_ICONERROR);
      limpa('b');
    end;
//    else
//    begin
    {-------- SALVA O ÚLTIMO RD NA TABLEA DE PARAMETROS ---------------------------------------------------------------------------------------------------------------------------------------------}

      with datm_main.tbl_parametro_ do
      begin
        Close;
        Open;
        Edit;
        FieldByName('NR_ULT_RD').AsString := ConsultaLookUPSQL('SELECT MAX(NR_RD) AS NR_RD FROM TSOLIC_PAGTO', 'NR_RD');
        Post;
        limpa('b');
        lbl_ult_rd.Caption := 'Último RD impresso nº: ' + FieldByName('NR_ULT_RD').AsString;
      end;
      Application.CreateForm(TFrm_impressao, Frm_impressao );
      frm_impressao.cd_unid_neg   := edt_cd_unid_neg.text;
      frm_impressao.cd_produto    := edt_cd_produto.text;
      frm_impressao.cd_via_transp := '';
      frm_impressao.cd_modulo     := '1149';
      frm_impressao.vApenas_email := false;
      frm_impressao.ShowModal;
      frm_impressao.Release;
      frm_impressao_rd.FormShow(nil);

//    end;
  end
  else
  begin
    BoxMensagem('Verifique o período informado!', 2);
    dt_inicio.Text := '';
    dt_final.Text := '';
    dt_inicio.SetFocus;
   end;
end;

procedure Tfrm_impressao_rd.edt_cd_clienteEnter(Sender: TObject);
begin
  //bloqueia acesso a grupo
  if edt_cd_grupo.Text = '' then
  begin
    edt_cd_grupo.Enabled := false;
    edt_cd_grupo.Color := clmenu;
  end;
end;



procedure Tfrm_impressao_rd.btn_co_unid_negClick(Sender: TObject);
begin
 if Sender is TSpeedButton then
 begin
    edt_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidades',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Unidade'],'CD_UNID_NEG',nil,1);
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',edt_cd_unid_neg.Text,'NM_UNID_NEG');
 end
 else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',edt_cd_unid_neg.Text,'NM_UNID_NEG');
end;

procedure Tfrm_impressao_rd.dt_inicioExit(Sender: TObject);
begin
  //habilita ou não botão de imprimir
  habilita_imprimir(0);

end;

procedure Tfrm_impressao_rd.btn_co_produtoClick(Sender: TObject);
begin
 if Sender is TSpeedButton then
 begin
    edt_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO',nil,1);
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO',edt_cd_produto.Text,'NM_PRODUTO');
 end
 else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO',edt_cd_produto.Text,'NM_PRODUTO');
end;

procedure Tfrm_impressao_rd.btn_co_grupoClick(Sender: TObject);
begin
 if Sender is TSpeedButton then
 begin
    edt_cd_grupo.Text := ConsultaOnLineEx('TGRUPO','Grupos',['CD_GRUPO','NM_GRUPO'],['Código','Grupo'],'CD_GRUPO',nil,1);
    edt_nm_grupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO',edt_cd_grupo.Text,'NM_GRUPO');
 end
 else
    edt_nm_grupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO',edt_cd_grupo.Text,'NM_GRUPO');

end;

procedure Tfrm_impressao_rd.btn_co_clienteClick(Sender: TObject);
begin
 if Sender is TSpeedButton then
 begin
    edt_cd_cliente.Text := ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','NM_EMPRESA', 'AP_EMPRESA'],['Código','Empresa', 'Apelido'],'CD_EMPRESA',nil,2);
    edt_nm_cliente.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',edt_cd_cliente.Text,'AP_EMPRESA');
 end
 else
   edt_nm_cliente.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',edt_cd_cliente.Text,'AP_EMPRESA');

end;

procedure Tfrm_impressao_rd.edt_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if sender = edt_cd_unid_neg   then btn_co_unid_negClick(btn_co_unid_neg);
    if sender = edt_cd_produto    then btn_co_produtoClick(btn_co_produto);
    if sender = edt_cd_grupo      then btn_co_grupoClick(btn_co_grupo);
    if sender = edt_cd_cliente    then btn_co_clienteClick(btn_co_cliente);
    if sender = edt_cd_unid_neg2  then btn_co_unid_neg2Click(btn_co_unid_neg2);
    if sender = edt_cd_produto2   then btn_co_produto2Click(btn_co_produto2);
    if sender = edt_cd_grupo2     then btn_co_grupo2Click(btn_co_grupo2);
    if sender = edt_cd_cliente2   then btn_co_cliente2Click(btn_co_cliente2);
    if sender = edt_processo      then btn_co_processo2Click(btn_co_processo2);

  end;
end;

procedure Tfrm_impressao_rd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_imp_rd_.Close;
  Action := caFree;
end;

procedure Tfrm_impressao_rd.qry_imp_total_CalcFields(DataSet: TDataSet);
begin
  qry_imp_total_.FieldByName('Calc_ValorExtenso').AsString := Extenso(qry_imp_total_.FieldByName('VL_PAGTO').AsFloat);
  qry_imp_total_.FieldByName('DT_SOLIC_PAGTO').AsString := DateToStr(vData);
  qry_imp_total_.FieldByName('calcConta').AsString := Copy(qry_imp_total_.FieldByName('NR_CONTA').AsString, 1, 3) + '.' +
                                                      Copy(qry_imp_total_.FieldByName('NR_CONTA').AsString, 4, 3) + '-' +
                                                      Copy(qry_imp_total_.FieldByName('NR_CONTA').AsString, 7, 1);
  qry_imp_total_.FieldByName('calcAgencia').AsString := Copy(qry_imp_total_.FieldByName('CD_AGENCIA').AsString, 1, 4) + '-' +
                                                        Copy(qry_imp_total_.FieldByName('CD_AGENCIA').AsString, 5, 1);
end;


procedure Tfrm_impressao_rd.btn_txt_Click(Sender: TObject);
var
  tp_pesquisa   : integer;
  nome_arquivo  : string[25];
  str_txt       : string;
  Arquivo_01    : TextFile;
  Path_Arquivo  : String;
  vazio1, vazio2: boolean;
begin
  if (edt_nr_rd.Text <> '') and (edt_processo.Text = '')  then tp_pesquisa := 0; //por rd
  if (edt_processo.Text <> '') and (edt_nr_rd.Text = '')  then tp_pesquisa := 1; //por processo
  if (edt_processo.Text <> '') and (edt_nr_rd.Text <> '') then tp_pesquisa := 2; //por processo e rd
  if (edt_processo.Text = '')  and (edt_nr_rd.Text = '')  then tp_pesquisa := 3; //por outros campos

  //passa paremetros para a query
  with qry_integ_rd_ do
  begin
    //criação do arquivo txt
    if tp_pesquisa = 3 then
    begin
      Close;
      SQL.Text := txt_padrao +  ' SP.DT_PAGTO BETWEEN CONVERT(datetime, :INICIO, 103) AND CONVERT(datetime, :FINAL, 103) AND '
                             +  ' SUBSTRING(SP.NR_PROCESSO, 1, 2) = :UNIDADE AND '
                             +  ' SUBSTRING(SP.NR_PROCESSO, 3, 2) = :PRODUTO  AND '
                             +  ' ((P.CD_CLIENTE = :CLIENTE)  OR  (P.CD_CLIENTE IN ( SELECT CD_EMPRESA FROM TEMPRESA_NAC WHERE CD_GRUPO = :GRUPO ) )) '
                             +  ' ORDER BY P.CD_CLIENTE, SP.CD_FAVORECIDO, SP.CD_ITEM, SP.NR_PROCESSO ';

      ParamByName('inicio').AsString     := dt_inicio2.Text;
      ParamByName('final').AsString      := dt_final2.Text;
      ParamByName('unidade').AsString    := edt_cd_unid_neg2.Text;
      ParamByName('produto').AsString    := edt_cd_produto2.Text;
      ParamByName('grupo').AsString      := edt_cd_grupo2.Text;
      ParamByName('cliente').AsString    := edt_cd_cliente2.Text;
      Prepare;

      Open;
    end
    else if tp_pesquisa = 0 then
    begin
      Close;
      SQL.Text := txt_padrao + ' ISNULL(SP.NR_RD, '''') = ''' + Trim(edt_nr_rd.Text) + ''' AND '
                             + ' SUBSTRING(SP.NR_PROCESSO, 1, 2) <> ''03'' '
                             + ' ORDER BY P.CD_CLIENTE, SP.CD_FAVORECIDO, SP.CD_ITEM, SP.NR_PROCESSO ';
      Prepare;
      Open;

    end
    else if tp_pesquisa = 1 then
    begin
      Close;
      SQL.Text := txt_padrao + ' ISNULL(SP.NR_PROCESSO, '''') = ''' + Trim(Trim(edt_cd_unid_neg2.Text) + Trim(edt_cd_produto2.Text) + Trim(edt_processo.Text)) + ''' '
                             + ' ORDER BY P.CD_CLIENTE, SP.CD_FAVORECIDO, SP.CD_ITEM, SP.NR_PROCESSO ';
      Prepare;
      Open;
    end
    else if tp_pesquisa = 2 then
    begin
      Close;
      SQL.Text := txt_padrao + ' ISNULL(SP.NR_PROCESSO, '''') = ''' + Trim(Trim(edt_cd_unid_neg2.Text) + Trim(edt_cd_produto2.Text) + Trim(edt_processo.Text)) + ''' AND '
                             + ' ISNULL(SP.NR_RD, '''') = ''' + Trim(edt_nr_rd.Text) + ''' '
                             + ' ORDER BY P.CD_CLIENTE, SP.CD_FAVORECIDO, SP.CD_ITEM, SP.NR_PROCESSO ';
      Prepare;
      Open;
    end;

    ParamByName('UNIDADE').AsString := Trim(edt_cd_unid_neg2.Text);
    ParamByName('PRODUTO').AsSTring := Trim(edt_cd_produto2.Text);
    Open;
    //ShowMessage(SQL.Text);

    if (check_imp.Checked) then
    begin
      //passa parametrso para aquery (impostos)
      with qry_integ_rd2 do
      begin
        if tp_pesquisa = 0 then  //por rd
        begin
          Close;
          SQL.Text := txt_padrao2 + ' CS.CD_UNID_NEG   = '''+ edt_cd_unid_neg2.Text +'''        AND '
                                  + ' CS.CD_PRODUTO    = '''+ edt_cd_produto2.Text +''' AND '
                                  + ' ISNULL(SP.NR_RD, '''') = ''' +  edt_nr_rd.Text + ''' AND '
                                  + ' SUBSTRING(FC.NR_PROCESSO, 1, 2) <> ''03'' '
                                  + ' ORDER BY P.CD_CLIENTE, FC.CD_ITEM, FC.NR_PROCESSO ';
          Prepare;
          Open;

        end
        else if tp_pesquisa = 1 then  //por processo
        begin
          Close;
          SQL.Text := txt_padrao2 + ' CS.CD_UNID_NEG   = '''+ edt_cd_unid_neg2.Text +'''        AND '
                                  + ' CS.CD_PRODUTO    = '''+ edt_cd_produto2.Text +''' AND '
                                  + ' FC.NR_PROCESSO = ''' +  Trim(edt_cd_unid_neg2.Text) + Trim(edt_cd_produto2.Text) + Trim(edt_processo.Text) + ''' '
                                  + ' ORDER BY P.CD_CLIENTE, FC.CD_ITEM, FC.NR_PROCESSO ';
          Prepare;
          Open;
        end
        else if tp_pesquisa = 2 then  //por processo
        begin
          Close;
          SQL.Text := txt_padrao2 + ' CS.CD_UNID_NEG   = '''+ edt_cd_unid_neg2.Text +'''        AND '
                                  + ' CS.CD_PRODUTO    = '''+ edt_cd_produto2.Text +''' AND '
                                  + ' FC.NR_PROCESSO = ''' +  Trim(edt_cd_unid_neg2.Text) + Trim(edt_cd_produto2.Text) + Trim(edt_processo.Text) + ''' AND '
                                  + ' ISNULL(SP.NR_RD, '''') = ''' +  edt_nr_rd.Text + ''' '
                                  + ' ORDER BY P.CD_CLIENTE, FC.CD_ITEM, FC.NR_PROCESSO ';
          Prepare;
          Open;
        end
        else if tp_pesquisa = 3 then //por outros campos
        begin
          Close;
          SQL.Text := txt_padrao2 + ' CS.CD_UNID_NEG   = '''+ edt_cd_unid_neg2.Text +'''        AND '
                                  + ' CS.CD_PRODUTO    = '''+ edt_cd_produto2.Text +''' AND '
                                  + ' FC.DT_LANCAMENTO BETWEEN CONVERT(datetime, '''+ dt_inicio2.Text +''', 103) AND CONVERT(datetime, '''+ dt_final2.Text +''', 103) AND '
                                  + ' SUBSTRING(FC.NR_PROCESSO, 1, 2) = ''' + edt_cd_unid_neg2.Text + ''' AND '
                                  + ' SUBSTRING(FC.NR_PROCESSO, 3, 2) = ''' + edt_cd_produto2.Text  + ''' AND '
                                  + ' ((P.CD_CLIENTE = ''' + edt_cd_cliente2.Text + ''')  OR  (P.CD_CLIENTE IN ( SELECT CD_EMPRESA FROM TEMPRESA_NAC WHERE CD_GRUPO = ''' + edt_cd_grupo2.Text + '''))) '
                                  + ' ORDER BY P.CD_CLIENTE, FC.CD_ITEM, FC.NR_PROCESSO';

          Prepare;
          Open;
        end;
        //ShowMessage(SQL.Text);
      end;
    end;

    vazio1 := false;
    vazio2 := false;

    if (qry_integ_rd_.IsEmpty) then  vazio1 := true;
    if not (check_imp.Checked) then
    begin
      vazio2 := true;
    end
    else
     if (qry_integ_rd2.IsEmpty) then vazio2 := true;


    if vazio1 and vazio2 then
    begin
      BoxMensagem('Não há dados para exibir!!', 2);
      limpa('t');
    end
    else
    begin
      nome_arquivo := 'DuPont_'+ FormatDateTime('ddmmyyyy', date() ) + FormatDateTime('hhmmss', time() ) + '.txt';

      Path_Arquivo := 'C:\DDBroker\' + nome_arquivo ;
      AssignFile( Arquivo_01, Path_Arquivo );
      ReWrite( Arquivo_01 );

      qry_integ_rd_.First;
      while not qry_integ_rd_.EOF do
      begin

        str_txt := '';
        str_txt := qry_integ_rd_.Fieldbyname('CD_REFERENCIA').AsString + Space( 16 - length( qry_integ_rd_.Fieldbyname('CD_REFERENCIA').AsString) ) ;
        str_txt := str_txt + qry_integ_rd_.Fieldbyname('PROCESSO').AsString + ' ';
        str_txt := str_txt + qry_integ_rd_.Fieldbyname('NR_RD').asString +  Space(9 - length(qry_integ_rd_.Fieldbyname('NR_RD').asString));
        str_txt := str_txt + Space( 10 - length(COMPLETA_COM_ZEROS(FloatToStr(qry_integ_rd_.Fieldbyname('VL_PAGTO').AsFloat)))) + COMPLETA_COM_ZEROS(FloatToStr(qry_integ_rd_.Fieldbyname('VL_PAGTO').AsFloat));
        str_txt := str_txt + '    ';
        str_txt := str_txt + Copy(qry_integ_rd_.Fieldbyname('NM_ITEM').AsString, 1, 21) + Space( 21 - length(Copy(qry_integ_rd_.Fieldbyname('NM_ITEM').AsString,1,21)) ) ;
        str_txt := str_txt + Copy(qry_integ_rd_.Fieldbyname('NM_FAVORECIDO').AsString, 1, 41 ) + Space( 41 - length( Copy(qry_integ_rd_.Fieldbyname('NM_FAVORECIDO').AsString, 1, 41 )) );

        if qry_integ_rd_.Fieldbyname('DT_PAGTO').AsDateTime = 0 then
          str_txt := str_txt + '        '
        else str_txt := str_txt + FormatDateTime('ddmmyyyy', qry_integ_rd_.Fieldbyname('DT_PAGTO').AsDateTime);

        str_txt := str_txt + ' 001';
        str_txt := str_txt + #13#10;

        Write( Arquivo_01, str_txt );

        (*--- atualização da data de impressão do TXT --------------------------------------------*)
        with TQuery.Create(application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          Close;
          SQL.Add('UPDATE TSOLIC_PAGTO SET DT_IMPR_TXT = CONVERT(DATETIME, ''' + DateToStr(now) + ''', 103) ');
          SQL.Add('WHERE NR_PROCESSO = ''' + qry_integ_rd_.FieldByName('NR_PROCESSO').AsString + ''' AND ');
          SQL.Add('      CD_ITEM = ''' + qry_integ_rd_.Fieldbyname('CD_ITEM').AsString + ''' AND ');
          SQL.Add('      NR_RD = ''' + qry_integ_rd_.Fieldbyname('NR_RD').AsString + ''' AND ');
          SQL.Add('      NR_LANCAMENTO = ''' + qry_integ_rd_.Fieldbyname('NR_LANCAMENTO').AsString + ''' ');
          ExecSQL;
          Free;
        end;

        qry_integ_rd_.Next;
      end;

      if (check_imp.Checked) then
      begin
        qry_integ_rd2.First;
        while not qry_integ_rd2.EOF do
        begin

          str_txt := '';
          str_txt := qry_integ_rd2.Fieldbyname('CD_REFERENCIA').AsString + Space( 16 - length( qry_integ_rd2.Fieldbyname('CD_REFERENCIA').AsString) ) ;
          str_txt := str_txt + qry_integ_rd2.Fieldbyname('PROCESSO').AsString + ' ';
          str_txt := str_txt + qry_integ_rd2.Fieldbyname('NR_RD').asString +  Space(9 - length(qry_integ_rd2.Fieldbyname('NR_RD').asString));
          str_txt := str_txt + Space( 10 - length(COMPLETA_COM_ZEROS(FloatToStr(qry_integ_rd2.Fieldbyname('VL_PAGTO').AsFloat)))) + COMPLETA_COM_ZEROS(FloatToStr(qry_integ_rd2.Fieldbyname('VL_PAGTO').AsFloat));
          str_txt := str_txt + '    ';
          str_txt := str_txt + Copy(qry_integ_rd2.Fieldbyname('NM_ITEM').AsString, 1, 21) + Space( 21 - length(Copy(qry_integ_rd2.Fieldbyname('NM_ITEM').AsString,1,21)) ) ;
          str_txt := str_txt + Copy(qry_integ_rd2.Fieldbyname('NM_FAVORECIDO').AsString, 1, 41 ) + Space( 41 - length( Copy(qry_integ_rd2.Fieldbyname('NM_FAVORECIDO').AsString, 1, 41 )) );

          if qry_integ_rd2.Fieldbyname('DT_PAGTO').AsDateTime = 0 then
            str_txt := str_txt + '        '
          else str_txt := str_txt + FormatDateTime('ddmmyyyy', qry_integ_rd2.Fieldbyname('DT_PAGTO').AsDateTime);

          str_txt := str_txt + ' 001';
//          str_txt := str_txt + qry_integ_rd2.FieldByName('CD_BANCO_DEB_CC').AsString;
          str_txt := str_txt + #13#10;

          Write( Arquivo_01, str_txt );

          with TQuery.Create(application) do
          begin
            DatabaseName := 'DBBROKER';
            SQL.Clear;
            Close;
            SQL.Add('UPDATE TSOLIC_PAGTO SET DT_IMPR_TXT = CONVERT(DATETIME, ''' + DateToStr(now) + ''', 103) ');
            SQL.Add('WHERE NR_PROCESSO = ''' + qry_integ_rd2.FieldByName('NR_PROCESSO').AsString + ''' AND ');
            SQL.Add('      CD_ITEM = ''' + qry_integ_rd2.Fieldbyname('CD_ITEM').AsString + ''' AND ');
            SQL.Add('      NR_RD = ''' + qry_integ_rd2.Fieldbyname('NR_RD').AsString + ''' AND ');
            SQL.Add('      NR_LANCAMENTO = ''' + qry_integ_rd2.Fieldbyname('NR_LANCAMENTO').AsString + ''' ');
            ExecSQL;
            Free;
          end;


          qry_integ_rd2.Next;

        end;
      end;



      CloseFile( Arquivo_01 );

      //abertura do form de impressão
      Application.CreateForm(TFrm_impressao, Frm_impressao );
      frm_impressao.vApenas_email := true;
      if edt_nr_rd.Text <> '' then  frm_impressao.eSubject.Text := 'RD de despesas nº ' + edt_nr_rd.Text;
      Frm_impressao.LstFiles.Items.Add(Path_Arquivo);
      frm_impressao.ShowModal;
      frm_impressao.Release;

      limpa('t');
   end;
 end;

end;

procedure Tfrm_impressao_rd.limpa(secao: string);
begin
  if secao = 'b' then //seção borderô
  begin
    //passa parametro de unidade e produto
    unid_neg := ConsultaLookUpSQL('SELECT CD_UNID_NEG FROM TUSUARIO_HABILITACAO WHERE IN_DEFAULT = ''1'' AND CD_USUARIO = ' + QuotedStr(str_cd_usuario), 'CD_UNID_NEG');
    prod     := ConsultaLookUpSQL('SELECT CD_PRODUTO  FROM TUSUARIO_HABILITACAO WHERE IN_DEFAULT = ''1'' AND CD_USUARIO = ' + QuotedStr(str_cd_usuario), 'CD_PRODUTO');
    edt_cd_unid_neg.Text := unid_neg;
    edt_nm_unid_neg.Text := ConsultaLookUp('TUNID_NEG', 'CD_UNID_NEG', unid_neg, 'NM_UNID_NEG');
    edt_cd_produto.Text  := prod;
    edt_nm_produto.Text  := ConsultaLookUp('TPRODUTO', 'CD_PRODUTO', prod, 'NM_PRODUTO');
    //datas padrão
    dt_inicio.Text := DateToStr(now);
    dt_final.Text := DateToStr(now);
    edt_cd_grupo.Text := '';
    edt_nm_grupo.Text := '';
    edt_cd_cliente.Text := '';
    edt_nm_cliente.Text := '';
  end
  else if secao = 'r' then // seção Reimpressão
  begin
    edt_rd2.Text := '';
    btn_print_2.Enabled := false;
  end
  else if secao = 't' then //seção txt
  begin
     //passa parametro de unidade e produto
    unid_neg := ConsultaLookUpSQL('SELECT CD_UNID_NEG FROM TUSUARIO_HABILITACAO WHERE IN_DEFAULT = ''1'' AND CD_USUARIO = ' + QuotedStr(str_cd_usuario), 'CD_UNID_NEG');
    prod     := ConsultaLookUpSQL('SELECT CD_PRODUTO  FROM TUSUARIO_HABILITACAO WHERE IN_DEFAULT = ''1'' AND CD_USUARIO = ' + QuotedStr(str_cd_usuario), 'CD_PRODUTO');
    edt_cd_unid_neg2.Text := unid_neg;
    edt_nm_unid_neg2.Text := ConsultaLookUp('TUNID_NEG', 'CD_UNID_NEG', unid_neg, 'NM_UNID_NEG');
    edt_cd_produto2.Text  := prod;
    edt_nm_produto2.Text  := ConsultaLookUp('TPRODUTO', 'CD_PRODUTO', prod, 'NM_PRODUTO');
    //datas padrão
    dt_inicio2.Text := DateToStr(now);
    dt_final2.Text := DateToStr(now);
    edt_cd_grupo2.Text := '';
    edt_nm_grupo2.Text := '';
    edt_cd_cliente2.Text := '';
    edt_nm_cliente2.Text := '';
    edt_nr_rd.Text := '';
    edt_processo.Text := '';
  end;
end;

procedure Tfrm_impressao_rd.btn_chamaClick(Sender: TObject);
begin
  pnlAux.Visible := true;
  pnl_aguarde.Visible := false;
  pnl_rd.Visible := true;
  edt_rd2.SetFocus;
end;

procedure Tfrm_impressao_rd.tabChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  if note.ActivePage = 'bordero' then
    note.ActivePage := 'txt'
  else
    note.ActivePage := 'bordero';

end;

procedure Tfrm_impressao_rd.edt_rd2Exit(Sender: TObject);
begin
  if (Copy(edt_rd2.Text, 3, 1) = '/') and (length(edt_rd2.text) = 8) then btn_print_2.Enabled := true
  else btn_print_2.Enabled := false;
end;

procedure Tfrm_impressao_rd.btn_sairClick(Sender: TObject);
begin
  pnlAux.Visible := false;
  limpa('r');
end;

procedure Tfrm_impressao_rd.btn_co_unid_neg2Click(Sender: TObject);
begin
 if Sender is TSpeedButton then
 begin
    edt_cd_unid_neg2.Text := ConsultaOnLineEx('TUNID_NEG','Unidades',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Unidade'],'CD_UNID_NEG',nil,1);
    edt_nm_unid_neg2.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',edt_cd_unid_neg2.Text,'NM_UNID_NEG');
 end
 else
    edt_nm_unid_neg2.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',edt_cd_unid_neg2.Text,'NM_UNID_NEG');
end;

procedure Tfrm_impressao_rd.btn_co_produto2Click(Sender: TObject);
begin
 if Sender is TSpeedButton then
 begin
    edt_cd_produto2.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO',nil,1);
    edt_nm_produto2.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO',edt_cd_produto2.Text,'NM_PRODUTO');
 end
 else
    edt_nm_produto2.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO',edt_cd_produto2.Text,'NM_PRODUTO');
end;

procedure Tfrm_impressao_rd.edt_cd_grupo2Enter(Sender: TObject);
begin
  //bloqueia acesso a clientes
  if edt_cd_cliente2.Text = '' then
  begin
    edt_cd_cliente2.Enabled := false;
    edt_cd_cliente2.Color := clmenu;
  end;
end;

procedure Tfrm_impressao_rd.edt_cd_grupo2Exit(Sender: TObject);
begin
  //faz pesquisa do nome
  if edt_cd_grupo2.Text <> '' then
     edt_cd_grupo2.Text := acrescenta_zero(edt_cd_grupo2.Text, 3);
  edt_nm_grupo2.Text := ConsultaLookUp('TGRUPO', 'CD_GRUPO', edt_cd_grupo2.Text, 'NM_GRUPO');
  //verifica código
  if (edt_cd_grupo2.Text <> '') and (edt_nm_grupo2.Text = '') then
  begin
    BoxMensagem('Grupo de clientes não existente!', 2);
    edt_cd_grupo2.SetFocus;
  end;

  //todos
  if edt_cd_grupo2.Text = '' then
  begin
    edt_cd_cliente2.Enabled := true;
    edt_cd_cliente2.Color := clwhite;
  end
  else
    dt_inicio2.SetFocus;

  //habilita ou não botão de imprimir
  habilita_imprimir(1);

end;

procedure Tfrm_impressao_rd.btn_co_grupo2Click(Sender: TObject);
begin
 if Sender is TSpeedButton then
 begin
    edt_cd_grupo2.Text := ConsultaOnLineEx('TGRUPO','Grupos',['CD_GRUPO','NM_GRUPO'],['Código','Grupo'],'CD_GRUPO',nil,1);
    edt_nm_grupo2.Text := ConsultaLookUP('TGRUPO','CD_GRUPO',edt_cd_grupo2.Text,'NM_GRUPO');
 end
 else
    edt_nm_grupo2.Text := ConsultaLookUP('TGRUPO','CD_GRUPO',edt_cd_grupo2.Text,'NM_GRUPO');

end;

procedure Tfrm_impressao_rd.btn_co_cliente2Click(Sender: TObject);
begin
 if Sender is TSpeedButton then
 begin
    edt_cd_cliente2.Text := ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','NM_EMPRESA', 'AP_EMPRESA'],['Código','Empresa', 'Apelido'],'CD_EMPRESA',nil,2);
    edt_nm_cliente2.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',edt_cd_cliente2.Text,'AP_EMPRESA');
 end
 else
   edt_nm_cliente2.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',edt_cd_cliente2.Text,'AP_EMPRESA');

end;

procedure Tfrm_impressao_rd.dt_inicio2Exit(Sender: TObject);
begin
  habilita_imprimir(1);
end;

procedure Tfrm_impressao_rd.edt_cd_unid_neg2Exit(Sender: TObject);
begin
  //faz pesquisa do nome
  if edt_cd_unid_neg2.Text <> '' then
     edt_cd_unid_neg2.Text := acrescenta_zero(edt_cd_unid_neg2.Text, 2) ;
  edt_nm_unid_neg2.Text := ConsultaLookUp('TUNID_NEG', 'CD_UNID_NEG', edt_cd_unid_neg2.Text, 'NM_UNID_NEG');
  //verifica código
  if (edt_cd_unid_neg2.Text = '') or (edt_nm_unid_neg2.Text = '') then
  begin
      BoxMensagem('Unidade de Negociação não existente ou não permitida!', 2);
      edt_cd_unid_neg2.SetFocus;
  end;

  //verifica habilitação
  if ConsultaLookUPSQL('SELECT UH.CD_UNID_NEG FROM TUSUARIO_HABILITACAO UH, TUSUARIO U WHERE UH.CD_UNID_NEG = '
                        + QuotedStr(edt_cd_unid_neg2.Text)
                        + ' AND U.CD_USUARIO = ' + QuotedStr(str_cd_usuario), 'CD_UNID_NEG') = '' then
   begin
     BoxMensagem('Unidade de Negócio não cadastrada ou não habilitada para Usuário', 2);
     edt_cd_unid_neg2.Text := '';
     edt_cd_unid_neg2.SetFocus;
   end;
  //habilita ou não botão de imprimir
  habilita_imprimir(1);
end;

procedure Tfrm_impressao_rd.edt_cd_produto2Exit(Sender: TObject);
begin
 //faz pesquisa do nome
  if edt_cd_produto2.Text <> '' then
     edt_cd_produto2.Text := acrescenta_zero(edt_cd_produto2.Text, 2);
  edt_nm_produto2.Text := ConsultaLookUp('TPRODUTO', 'CD_PRODUTO', edt_cd_produto2.Text, 'NM_PRODUTO');
  //verifica código
  if (edt_cd_produto2.Text <> '') and (edt_nm_produto2.Text = '') then
  begin
    BoxMensagem('Produto não existente!', 2);
    edt_cd_produto2.SetFocus;
  end;
  //verifica habilitação
  if (ConsultaLookUPSQL('SELECT UH.CD_UNID_NEG FROM TUSUARIO_HABILITACAO UH, TUSUARIO U WHERE UH.CD_UNID_NEG = '
                     + QuotedStr(edt_cd_unid_neg2.Text) + ' AND U.CD_USUARIO = ' + QuotedStr(str_cd_usuario),
                     'CD_UNID_NEG') = '') or
   (ConsultaLookUPSQL('SELECT UH.CD_PRODUTO FROM TUSUARIO_HABILITACAO UH, TUSUARIO U WHERE UH.CD_PRODUTO = '
                     + QuotedStr(edt_cd_produto2.Text) +
                     ' AND CD_UNID_NEG = '  + QuotedStr(edt_cd_unid_neg2.Text) +
                     ' AND U.CD_USUARIO = ' + QuotedStr(str_cd_usuario),
                     'CD_PRODUTO') = '') then
   begin
     BoxMensagem('Unidade de Negócio X Produto não cadastrada ou sem habilitação!', 2);
     edt_cd_produto2.Text := '';
     edt_cd_unid_neg2.Text := '';
     edt_cd_unid_neg2.Clear;
   end;

   //habilita ou não botão de imprimir
   habilita_imprimir(1);

end;

procedure Tfrm_impressao_rd.edt_cd_cliente2Enter(Sender: TObject);
begin
  //bloqueia acesso a grupo
  if edt_cd_grupo2.Text = '' then
  begin
    edt_cd_grupo2.Enabled := false;
    edt_cd_grupo2.Color := clmenu;
  end;
end;

procedure Tfrm_impressao_rd.edt_cd_cliente2Exit(Sender: TObject);
begin
  //faz pesquisa do nome
  if edt_cd_cliente2.Text <> '' then
     edt_cd_cliente2.Text := acrescenta_zero(edt_cd_cliente2.Text, 5);

  edt_nm_cliente2.Text := ConsultaLookUp('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_cliente2.Text, 'AP_EMPRESA');
  //verifica código
  if (edt_cd_cliente2.Text <> '') and (edt_nm_cliente2.Text = '') then
  begin
    BoxMensagem('Cliente não existente!', 2);
    edt_cd_cliente2.SetFocus;
  end;

  //todos
  if edt_cd_cliente2.Text = '' then
  begin
    edt_nm_cliente2.Text := 'Todos';
    edt_cd_grupo2.Enabled := true;
    edt_cd_grupo2.Color := clwhite;
  end
  else
    dt_inicio2.SetFocus;

  //habilita ou não botão de imprimir
  habilita_imprimir(1);
end;

procedure Tfrm_impressao_rd.btn_co_processo2Click(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO, 5, 14) NR_PROCESSO_ABR, PR.CD_UNID_NEG, PR.CD_PRODUTO , EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE  PR.IN_CANCELADO = ''0''');
  vListAux.Add('  AND  PR.CD_UNID_NEG  = ' + QuotedStr(edt_cd_unid_neg2.Text));
  vListAux.Add('  AND  PR.CD_PRODUTO   = ' + QuotedStr(edt_cd_produto2.Text));
  edt_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO_ABR', 'CD_UNID_NEG', 'CD_PRODUTO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Unidade', 'Produto', 'Cliente', 'Data de Abertura'],'NR_PROCESSO_ABR', nil);
  vListAux.Free;
end;

procedure Tfrm_impressao_rd.edt_processoExit(Sender: TObject);
begin
  if edt_processo.Text <> '' then
  begin
    edt_cd_grupo2.Text := '';
    edt_nm_grupo2.Text := '';
    edt_cd_cliente2.Text := '';
    edt_nm_cliente2.Text := '';
    dt_inicio2.Clear;
    dt_final2.Clear;
  end;
  habilita_imprimir(1);
end;

procedure Tfrm_impressao_rd.edt_nr_rdExit(Sender: TObject);
begin
  if edt_nr_rd.Text <> '' then
  begin
    edt_cd_grupo2.Text := '';
    edt_nm_grupo2.Text := '';
    edt_cd_cliente2.Text := '';
    edt_nm_cliente2.Text := '';
    dt_inicio2.Clear;
    dt_final2.Clear;

  end;
  habilita_imprimir(1);
end;

procedure Tfrm_impressao_rd.FormCreate(Sender: TObject);
begin
  note.ActivePage := 'bordero';
  txt_padrao  := qry_integ_rd_.SQL.Text;
  txt_padrao2 := qry_integ_rd2.SQL.Text;
  rd_padrao1  := qry_imp_total_.SQL.Text;
  rd_padrao2  := qry_imp_rd_.SQL.Text;
end;

procedure Tfrm_impressao_rd.btn_print_2Click(Sender: TObject);
var vListAux: TStringList;
begin
  reimp := true;
  if Application.MessageBox('Deseja Manter a Data de Impressão deste Borderô?', 'Data do Borderô', MB_YESNO + MB_ICONQUESTION) = mrYes then

    vData := StrToDate(ConsultaLookUPSQL('SELECT TOP 1 DT_IMPR_RD ' +
                                         'FROM TSOLIC_PAGTO ' +
                                         'WHERE NR_RD = ''' + edt_rd2.Text + ''' '  , 'DT_IMPR_RD'))
  else
  begin
    repeat
      try
        if (vData > now) and (vData <> 0) then BoxMensagem('A Data deve ser menor que a atual', 2);
        vData := StrToDate(InputBox('Data do Borderô', 'Digite a data desejada: ', ''));
      except
        BoxMensagem('Data Inválida!', 2);
        vData := 0;
      end;
    until (vData <> 0) and (vData <= now);
  end;



    //passa paremetros para a query total
    with qry_imp_total_ do
    begin
      Close;
      vListAux := TStringList.Create;
      vListAux.Text := rd_padrao1;
      vListAux.Strings[2] :=   'WHERE ((SP.CD_STATUS = ''0'') OR (SP.CD_STATUS = ''7'')) AND ';

      SQL.Text := vListAux.Text + '       ISNULL(SP.NR_RD, '''') = ''' + edt_rd2.Text + ''' AND '
                                + '       SUBSTRING(SP.NR_PROCESSO, 3, 2) = ''' + edt_cd_produto.Text + ''' '
                                + 'GROUP BY  SP.NR_RD, A.NM_GRUPO, P.CD_GRUPO, P.CD_CLIENTE, SP.CD_FAVORECIDO, B.CD_BANCO, P.CD_PRODUTO, P.CD_UNID_NEG,  B1.NR_CONTA, B1.CD_AGENCIA '
                                + 'ORDER BY P.CD_CLIENTE,SP.CD_FAVORECIDO ';
{                                + ' GROUP BY SP.NR_RD, P.CD_GRUPO, P.CD_CLIENTE, SP.CD_FAVORECIDO, B.CD_BANCO, P.CD_PRODUTO, P.CD_UNID_NEG '
                                + ' ORDER BY P.CD_CLIENTE,SP.CD_FAVORECIDO ';
       Prepare;                                                                                                                                      }
      Open;
//      ShowMessage(SQL.Text);
    end;
    //passa parametros para a query principal
    with qry_imp_rd_ do
    begin
      Close;
      SQL.Strings[37] := 'WHERE ((SP.CD_STATUS = ''0'') OR (SP.CD_STATUS = ''7'')) AND ';
      Prepare;
      Open;
      //ShowMessage(SQL.Text);
    end;
    if qry_imp_rd_.IsEmpty then
    begin
      BoxMensagem('Não há dados para exibir!!', 2);
    end
    else
    begin

      Application.CreateForm(TFrm_impressao, Frm_impressao );
      frm_impressao.cd_unid_neg   := edt_cd_unid_neg.text;
      frm_impressao.cd_produto    := edt_cd_produto.text;
      frm_impressao.cd_via_transp := '';
      frm_impressao.cd_modulo     := '1149';
      frm_impressao.vApenas_email := false;
      frm_impressao.ShowModal;
      frm_impressao.Release;


      limpa('r');
      btn_sairClick(btn_sair);
    end;

end;



end.

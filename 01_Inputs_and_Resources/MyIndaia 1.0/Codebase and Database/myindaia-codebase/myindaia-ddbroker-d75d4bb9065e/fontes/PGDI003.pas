
(*************************************************************************************************
Sistema: DDBroker - Indaiá Logística
PROGRAMA: PGDI003.PAS - frm_di - Declaração de Importação
AUTOR: Leandro Stipanich
DATA:
Manutenção:
Data:
*************************************************************************************************)
unit PGDI003;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, Mask,
  DBCtrls, PGGP001, UCRPE32, Funcoes, dbcgrids, ServicoNovo, ADODB,
  FormsLog, KrUtil; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013

type
  Tfrm_DI = class(TForm)
    pnl_cadastro: TPanel;
    btn_nova_di: TSpeedButton;
    btn_sair: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_nova_di: TMenuItem;
    mi_capa_di: TMenuItem;
    mi_adicao_di: TMenuItem;
    mi_item_di: TMenuItem;
    Bevel1: TBevel;
    lbl_nr_processo: TLabel;
    mskedt_nr_processo: TMaskEdit;
    btn_nr_processo: TSpeedButton;
    Label63: TLabel;
    btn_tipo_declaracao: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    mskedt_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    lbl_cd_cliente: TLabel;
    edt_cd_cliente: TEdit;
    edt_nm_cliente: TEdit;
    lbl_cd_servico: TLabel;
    edt_cd_servico: TEdit;
    edt_nm_servico: TEdit;
    edt_nm_tipo_declaracao: TEdit;
    mskedt_cd_tipo_declaracao: TMaskEdit;
    btn_adicao_di: TSpeedButton;
    btn_itens_di: TSpeedButton;
    btn_capa_di: TSpeedButton;
    mi_saida: TMenuItem;
    btn_duplica: TSpeedButton;
    mi_duplica_di: TMenuItem;
    btn_co_unid_neg: TSpeedButton;
    Bevel2: TBevel;
    Panel1: TPanel;
    Image1: TImage;
    btn_rel_rascunho: TSpeedButton;
    btn_li: TSpeedButton;
    crp_di: TCrpe;
    btn_calculo: TSpeedButton;
    btn_resumo: TSpeedButton;
    mi_print: TMenuItem;
    mi_calcula: TMenuItem;
    mi_integraSCX: TMenuItem;
    mi_addLI: TMenuItem;
    mi_resumo: TMenuItem;
    btn_rel_calc: TSpeedButton;
    btn_manut_proc: TSpeedButton;
    mi_manut_proc: TMenuItem;
    mi_rel_calc: TMenuItem;
    mi_rel_rascunho: TMenuItem;
    RealizaoporProcesso1: TMenuItem;
    btn_proc_realiza: TSpeedButton;
    chkProcessos: TCheckBox;
    btn_trans_DI: TSpeedButton;
    btn_Retificar: TSpeedButton;
    Panel2: TPanel;
    dbgHistCalc: TDBGrid;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    btn_import_licenca_itens: TSpeedButton;
    btnDivergenciasMercante: TSpeedButton;
    btnLiberarDiValorAlto: TSpeedButton;
    btnImportarArquivoItensDI: TSpeedButton;
    btnImportarXMLDi: TSpeedButton;
    btnEnvioDuimp: TSpeedButton;
    Label1: TLabel;
    edtCNPJ: TMaskEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_nova_diClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mskedt_nr_processoExit(Sender: TObject);
    procedure btn_adicao_diClick(Sender: TObject);
    procedure btn_itens_diClick(Sender: TObject);
    procedure btn_capa_diClick(Sender: TObject);
    procedure btn_duplicaClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_tipo_declaracaoClick(Sender: TObject);
    procedure mskedt_cd_unid_negExit(Sender: TObject);
    procedure mskedt_cd_tipo_declaracaoExit(Sender: TObject);
    procedure btn_liClick(Sender: TObject);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mskedt_cd_tipo_declaracaoEnter(Sender: TObject);
    procedure btn_calculoClick(Sender: TObject);
    procedure mskedt_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_resumoClick(Sender: TObject);
    procedure btn_manut_procClick(Sender: TObject);
    procedure mi_rel_rascunhoClick(Sender: TObject);
    procedure mi_rel_calcClick(Sender: TObject);
    procedure btn_di_proc_expClick(Sender: TObject);
    procedure btn_trans_DIClick(Sender: TObject);
    procedure btn_RetificarClick(Sender: TObject);
    procedure dbtxtVisualizarClick(Sender: TObject);
    procedure dbgHistCalcCellClick(Column: TColumn);
    procedure mskedt_nr_processoEnter(Sender: TObject);
    procedure dbgHistCalcDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btn_import_licenca_itensClick(Sender: TObject);
    procedure btnDivergenciasMercanteClick(Sender: TObject);
    procedure btnLiberarDiValorAltoClick(Sender: TObject);
    procedure btnImportarArquivoItensDIClick(Sender: TObject);
    procedure btnImportarXMLDiClick(Sender: TObject);
    procedure btnEnvioDuimpClick(Sender: TObject);
  private
    Criando_DI:Boolean;
    FProcessoBusca: String;
    { Private declarations }
    function Busca_armazem( nr_proc: String ): String;
    procedure AlimentaItensDI;
    procedure PreparaDatamodule;
  public
    { Public declarations }
    i_seletor : Integer;
    cState : String[1];
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    in_DI_Registrada : Boolean;
    in_DI_Retificacao : Boolean;
    str_via_transp  : String[2];
    str_cd_agente   : String;
    pesq_cd_unid_neg : String[2];
    pesq_nr_processo : String[14];
    procedure HabilitaBotoes( lResp : Boolean);
    procedure Desconnecta_GSM;
    procedure Dados_Default_Nova_Di;
  end;

var
  frm_DI: Tfrm_DI;

implementation

uses GSMLIB,  PGGP017, PGDI017, PGDI001, PGDI004, PGDI005, PGDI010, PGSM018,
     PGSM096, PGDI015, PGGP015, PGSM121, PGDI018, PGDI032, PGSM136,
     PGGP018, PGGA003, PGGP019, ConsOnLineEx, PGDI038, PGDI039,
  uRetificaDI_Adm_Temp, uHistoricoCalculoDI, KrHandle, KrDetalheMercadoria,
  KrDialog, UConsultaMercanteDivergencias, PGDI050,  uImportarPlanilhaItensDI,
  PGDI020, uImportarXMLDISiscomex;

{$R *.DFM}

procedure Tfrm_DI.btn_sairClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '';
  str_nr_processo := '';
  Close;
end;

procedure Tfrm_DI.Desconnecta_GSM;
begin
  with datm_main do
  begin
    db_broker.Connected     := False;
  end;
end;

function Tfrm_DI.Busca_armazem( nr_proc: string ): string;
var
  qry_amz: TQuery;
begin
  qry_amz := TQuery.Create( frm_DI );
  with qry_amz do
  begin
    Close;
    SQL.Clear;
    DataBaseName := 'DBBROKER';
    SQL.Add('SELECT CD_ARMAZEM_DESCARGA, CD_ARMAZEM_ATRACACAO FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "'+ str_nr_processo + '"');
    Open;
    Result := IIF(str_via_transp = '07',FieldByname('CD_ARMAZEM_ATRACACAO').AsString, FieldByname('CD_ARMAZEM_DESCARGA').AsString);
    Close;
    Free;
  end;
end;

procedure Tfrm_DI.btn_nova_diClick(Sender: TObject);
var
  qry: TQuery;
begin
  with datm_di do
  begin
    if mskedt_cd_unid_neg.Text = '' then
    begin
      MessageDlg('A Unidade de Negócio deve ser informada.', mtError, [mbOk], 0);
      Exit;
    end;
    if mskedt_nr_processo.Text = '' then
    begin
      MessageDlg('O Cliente deve ser informado.', mtError, [mbOk], 0);
      Exit;
    end;

    qry_di_.Close;
    qry_di_.UnPrepare;
    qry_di_.Open;
    qry_di_.Append;
    qry_di_NR_PROCESSO.AsString              := str_nr_processo;
    qry_di_CD_IMPORTADOR.AsString            := edt_cd_cliente.Text;
    qry_di_CD_TIPO_DECLARACAO.AsString       := mskedt_cd_tipo_declaracao.Text;
    qry_di_CD_VIA_TRANSP_CARG.AsString       := str_via_transp;
    qry_di_NR_AGENTE_CARGA.asString          := str_cd_agente;
    qry_di_IN_REPASSA_DADOS_CAMBIO.AsBoolean := False;


    qry := TQuery.Create( frm_DI );
    with qry do
    begin
      Close;
      DataBaseName := 'DBBROKER';

      SQL.Clear;
      SQL.Add('SELECT CD_URF, CD_RECINTO, CD_SETOR FROM TARMAZEM (NOLOCK) WHERE CD_ARMAZEM = "' + Busca_armazem( qry_processo_NR_PROCESSO.asString ) + '"');
      Prepare;
      Open;
      qry_di_CD_URF_DESPACHO.asString := qry.FieldByname('CD_URF').asString;

      if qry_di_CD_URF_ENTR_CARGA.IsNull then
        qry_di_CD_URF_ENTR_CARGA.asString := qry.FieldByname('CD_URF').asString;

      qry_di_CD_RECINTO_ALFAND.asString  := qry.FieldByname('CD_RECINTO').asString;
      qry_di_CD_SETOR_ARMAZENAM.asString := qry.FieldByName('CD_SETOR').asString;
      qry.Close;

      SQL.Clear;
      SQL.Text :=
        '  SELECT RIGHT( ''00'' + CONVERT(VARCHAR,DATEPART(DAY,P.DT_CONHECIMENTO)),2)    +                        ' + sLineBreak +
        '         RIGHT( ''00'' + CONVERT(VARCHAR,DATEPART(MONTH,P.DT_CONHECIMENTO)),2)  +                        ' + sLineBreak +
        '         RIGHT( ''0000'' + CONVERT(VARCHAR,DATEPART(YEAR,P.DT_CONHECIMENTO)),4) DT_CONHECIMENTO,         ' + sLineBreak +
        '         P.NR_PRESENCA_CARGA,                                                                            ' + sLineBreak +
        '         P.CD_LOCAL_EMBARQUE,                                                                            ' + sLineBreak + 
        '         P.CD_INCOTERM,                                                                                  ' + sLineBreak +
        '         E.CD_EMBARCACAO,                                                                                ' + sLineBreak +
        '         A.CD_RECINTO,                                                                                   ' + sLineBreak + 
        '         RIGHT( ''00'' + CONVERT(VARCHAR,DATEPART(DAY,V.DT_ENT)),2)    +                                 ' + sLineBreak +
        '         RIGHT( ''00'' + CONVERT(VARCHAR,DATEPART(MONTH,V.DT_ENT)),2)  +                                 ' + sLineBreak + 
        '         RIGHT( ''0000'' + CONVERT(VARCHAR,DATEPART(YEAR,V.DT_ENT)),4)   DT_ENT,                         ' + sLineBreak +
        '         P.NR_CONHECIMENTO,                                                                              ' + sLineBreak +
        '         P.NR_CONHECIMENTO_MASTER,                                                                       ' + sLineBreak +
        '         P.CD_MOEDA_FRETE,                                                                               ' + sLineBreak +
        '         P.VL_FRETE_PREPAID_MNEG,                                                                        ' + sLineBreak +
        '         P.VL_FRETE_COLLECT_MNEG                                                                         ' + sLineBreak +
        '     FROM   TPROCESSO   P (NOLOCK)                                                                       ' + sLineBreak +
        '  LEFT JOIN TARMAZEM    A (NOLOCK) ON A.CD_ARMAZEM    =  P.CD_ARMAZEM_DESCARGA                           ' + sLineBreak +
        '  LEFT JOIN TEMBARCACAO E (NOLOCK) ON E.CD_EMBARCACAO = CASE WHEN ISNULL(P.IN_BALDEACAO, ''0'') = ''0''  ' + sLineBreak +
        '                                                             THEN P.CD_EMBARCACAO                        ' + sLineBreak +
        '                                                             ELSE P.CD_EMBARCACAO_BALDEACAO              ' + sLineBreak +
        '                                                        END                                              ' + sLineBreak +
        '  LEFT JOIN TVIAGEM     V (NOLOCK) ON V.NR_VIAGEM    =  CASE WHEN ISNULL(P.IN_BALDEACAO, ''0'') = ''0''  ' + sLineBreak +
        '                                                                  THEN P.NR_VIAGEM                       ' + sLineBreak +
        '                                                                  ELSE P.NR_VIAGEM_BALDEACAO             ' + sLineBreak +
        '                                                        END                                              ' + sLineBreak +
        '                                 AND V.CD_EMBARCACAO =  E.CD_EMBARCACAO                                  ' + sLineBreak +
        '                                 AND V.CD_UNID_NEG   =  CASE P.CD_UNID_NEG WHEN ''07''                   ' + sLineBreak +
        '                                                             THEN ''01''                                 ' + sLineBreak +
        '                                                             ELSE P.CD_UNID_NEG                          ' + sLineBreak +
        '                                                        END                                              ' + sLineBreak +
        '                                 AND V.CD_PRODUTO    =  P.CD_PRODUTO                                     ' + sLineBreak +
        '   WHERE P.NR_PROCESSO   = ' + QuotedStr(trim(str_nr_processo)) + '                                      ' + sLineBreak ;

      Open;
      qry_di_CD_PRESENCA_CARGA.AsString  := qry.FieldByName('NR_PRESENCA_CARGA').asString;
      qry_di_CD_LOCAL_EMBARQUE.AsString  := qry.FieldByName('CD_LOCAL_EMBARQUE').asString;
      qry_di_CD_VEICULO_TRANSP.AsString  := qry.FieldByName('CD_EMBARCACAO').asString;
      qry_di_CD_RECINTO_ALFAND.AsString  := qry.FieldByName('CD_RECINTO').asString;
      qry_di_CD_INCOTERM.AsString        := qry.FieldByName('CD_INCOTERM').asString;
      qry_di_DT_EMBARQUE.AsString        := qry.FieldByName('DT_CONHECIMENTO').asString;
      qry_di_DT_CHEGADA_CARGA.AsString   := qry.FieldByName('DT_ENT').asString;
      qry_di_NR_DCTO_CARGA_MAST.AsString := qry.FieldByName('NR_CONHECIMENTO_MASTER').asString;
      qry_di_NR_DCTO_CARGA.AsString      := qry.FieldByName('NR_CONHECIMENTO').asString;
      qry_di_CD_MOEDA_FRETE.AsString     := qry.FieldByName('CD_MOEDA_FRETE').asString;
      qry_di_VL_TOT_FRT_COLLECT.AsString := qry.FieldByName('VL_FRETE_COLLECT_MNEG').asString;
      qry_di_VL_TOT_FRT_PREPAID.AsString := qry.FieldByName('VL_FRETE_PREPAID_MNEG').asString;
 
      qry.Close;
    end;

    tbl_taxa_cambio_.Open;
    if tbl_taxa_cambio_.FindKey(['220']) then
       qry_di_TX_DOLAR.AsFloat         := tbl_taxa_cambio_taxa_conversao.AsFloat;

    tbl_taxa_cambio_.Close;
    mskedt_cd_tipo_declaracao.Color    := clMenu;
    mskedt_cd_tipo_declaracao.ReadOnly := True;
    mskedt_cd_tipo_declaracao.TabStop  := False;
    HabilitaBotoes( True );
    Criando_DI                         := True;
    btn_capa_diClick(Sender);
  end;
end;

procedure Tfrm_DI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  crp_di.Free;
  cd_unid_neg_gestao := mskedt_cd_unid_neg.Text;
  nr_processo_gestao := mskedt_cd_unid_neg.Text + '01' + mskedt_nr_processo.Text;
//  Application.CreateForm(Tfrm_DI_capa, frm_DI_capa);
//  Application.CreateForm(Tdatm_DI_capa, datm_DI_capa);
//  frm_DI_capa.FormShow(nil);
//  datm_DI_capa.qry_di_.ParamByName('NR_PROCESSO').AsString := nr_processo_gestao;
//  datm_DI_capa.qry_di_.Open;
//  datm_DI_capa.qry_di_.Edit;
//  frm_DI_capa.Atualiza_Historico_Padrao;
//  datm_DI_capa.qry_di_.Post;
//  frm_DI_capa.Free;
//  datm_DI_capa.Free;
  datm_di.Free;
  Action := caFree;
end;

procedure Tfrm_DI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
  begin
    str_cd_rotina_atalho := '';
    str_nr_processo := '';
    Close;
  end;
  if btn_resumo.Enabled and ( Key = 123 ) {F12} then
    btn_resumoClick(nil);
  if Key = 113 then
    btn_manut_procClick(nil);
end;

procedure Tfrm_DI.HabilitaBotoes( lResp : Boolean);
begin
  if in_DI_Retificacao then
  begin
    btn_nova_di.Enabled       := False;
    mi_nova_di.Enabled        := False;
    btn_duplica.Enabled       := False;
    mi_duplica_di.Enabled     := False;
    mi_addLI.Enabled          := False;
    mi_calcula.Enabled        := False;
    mi_integraSCX.Enabled     := False;
    btn_li.Enabled            := lResp;
    mi_addLI.Enabled          := lResp;
    btn_calculo.Enabled       := lResp;
    mi_calcula.Enabled        := lResp;
    mi_integraSCX.Enabled     := lResp;
  end
  else
  begin
    btn_nova_di.Enabled       := Not( lResp );
    mi_nova_di.Enabled        := Not( lResp );
    btn_duplica.Enabled       := Not( lResp );
    mi_duplica_di.Enabled     := Not( lResp );

    if btn_nova_di.Enabled then
    begin
      btn_calculo.Enabled              := False;
      mi_calcula.Enabled               := False;
      mi_integraSCX.Enabled            := False;
      btn_li.Enabled                   := False;
      mi_addLI.Enabled                 := False;
    end
    else
    begin
      btn_li.Enabled                   := Not( in_DI_Registrada );
      mi_addLI.Enabled                 := Not( in_DI_Registrada );
      btn_calculo.Enabled              := Not( in_DI_Registrada );
      mi_calcula.Enabled               := Not( in_DI_Registrada );
      mi_integraSCX.Enabled            := Not( in_DI_Registrada );
    end;
  end;

  btn_capa_di.Enabled         := lResp;
  btn_adicao_di.Enabled       := lResp;
  btn_itens_di.Enabled        := lResp;

  mi_capa_di.Enabled          := lResp;
  mi_adicao_di.Enabled        := lResp;
  mi_item_di.Enabled          := lResp;
  btn_import_licenca_itens.Enabled := lResp;

  mi_print.Enabled            := lResp;
  btn_rel_rascunho.Enabled    := lResp;
  mi_rel_rascunho.Enabled     := lResp;
  btn_rel_calc.Enabled        := lResp;
  mi_rel_calc.Enabled         := lResp;
  btn_resumo.Enabled          := lResp;
  mi_resumo.Enabled           := lResp;
  
  btnImportarArquivoItensDI.Enabled := lResp;
//  btnImportarXMLDi.Enabled          := lResp;
  btnDivergenciasMercante.enabled   := lResp;
  btnLiberarDiValorAlto.Enabled     := lResp;

  btn_tipo_declaracao.Enabled := Not ( lResp );
end;

procedure Tfrm_DI.mskedt_nr_processoExit(Sender: TObject);
begin
  if mskedt_nr_processo.Text = FProcessoBusca then
    Exit;
  btn_trans_DI.Enabled  := False;
  btn_Retificar.Visible := False;

  SetServicoNovo(mskedt_cd_unid_neg.Text + '01' + mskedt_nr_processo.Text);

  if (mskedt_nr_processo.Text = '0000000') or (mskedt_nr_processo.Text = '') then
  begin
    HabilitaBotoes( False );
    btn_nova_di.Enabled := False;
    Exit;
  end;

  with datm_di do
  begin
    edt_cd_cliente.Text := '';
    edt_nm_cliente.Text := '';

    edt_cd_servico.Text := '';
    edt_nm_servico.Text := '';

    if mskedt_nr_processo.Text <> '' then
    begin
      qry_processo_.Close;
      qry_processo_.UnPrepare;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := mskedt_cd_unid_neg.Text + '01' + mskedt_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount = 0 then
      begin
        qry_processo_.Close;
        MessageDlg('Processo não encontrado. Digite novamente.', mtError, [mbOk], 0);
        mskedt_nr_processo.Setfocus;
        HabilitaBotoes( False );
        Exit;
      end;

      if qry_processo_IN_CANCELADO.AsString = '1' then
      begin
        qry_processo_.Close;
        MessageDlg('Processo Cancelado! Digite novamente.', mtError, [mbOk], 0);
        mskedt_nr_processo.Setfocus;
        HabilitaBotoes( False );
        btn_nova_di.Enabled    := False;
        mi_nova_di.Enabled     := False;
        btn_duplica.Enabled    := False;
        mi_duplica_di.Enabled  := False;
        btn_li.Enabled         := False;
        mi_addLI.Enabled       := False;
        Exit;
      end;

      if qry_processo_IN_LIBERADO.AsString = '0' then
      begin
        qry_processo_.Close;
        MessageDlg('Processo não está liberado! Digite novamente.', mtError, [mbOk], 0);
        mskedt_nr_processo.Setfocus;
        HabilitaBotoes( False );
        btn_nova_di.Enabled    := False;
        mi_nova_di.Enabled     := False;
        btn_duplica.Enabled    := False;
        mi_duplica_di.Enabled  := False;
        btn_li.Enabled         := False;
        mi_addLI.Enabled       := False;
        Exit;
      end;

      if qry_processo_IN_PRODUCAO.AsString = '0' then
      begin
        qry_processo_.Close;
        MessageDlg('Processo não está na produção! Digite novamente.', mtError, [mbOk], 0);
        mskedt_nr_processo.Setfocus;
        HabilitaBotoes( False );
        btn_nova_di.Enabled    := False;
        mi_nova_di.Enabled     := False;
        btn_duplica.Enabled    := False;
        mi_duplica_di.Enabled  := False;
        btn_li.Enabled         := False;
        mi_addLI.Enabled       := False;
        Exit;
      end;

      str_nr_processo     := qry_processo_NR_PROCESSO.AsString;
      str_cd_Cliente      := qry_processo_CD_CLIENTE.AsString;
      str_cd_Grupo        := qry_processo_CD_GRUPO.AsString;
      str_cd_agente       := qry_processo_LookAgente.AsString;
      edt_cd_cliente.Text := qry_processo_CD_CLIENTE.AsString;
      edt_cd_servico.Text := qry_processo_CD_SERVICO.AsString;
      qry_processo_.Close;

      qry_empresa_.Close;
      qry_empresa_.UnPrepare;
      qry_empresa_.ParamByName('CD_EMPRESA').AsString := edt_cd_cliente.Text;
      qry_empresa_.Prepare;
      qry_empresa_.Open;
      if qry_empresa_.RecordCount > 0 then
      begin
        edt_nm_cliente.Text := qry_empresa_NM_EMPRESA.AsString;
        edtCNPJ.Text := qry_empresa_CGC_EMPRESA.AsString;
      end;

      qry_empresa_.Close;

      qry_servico_.Close;
      qry_servico_.UnPrepare;
      qry_servico_.ParamByName('CD_SERVICO').AsString := edt_cd_servico.Text;
      qry_servico_.Prepare;
      qry_servico_.Open;
      if qry_servico_.RecordCount > 0 then
        edt_nm_servico.Text := qry_servico_NM_SERVICO.AsString;
      str_via_transp := qry_servico_LookViaTranspSiscomex.AsString;
      qry_servico_.Close;

      qry_di_.Close;
      qry_di_.UnPrepare;
      qry_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      if in_DI_Retificacao then
         qry_di_.SQL[15] := '( ( NR_DECLARACAO_IMP <> "" ) AND ( NR_DECLARACAO_IMP IS NOT NULL ) )'
      else
         qry_di_.SQL[15] := '( ( NR_DECLARACAO_IMP <> "XXXXXXXXXX" ) OR ( NR_DECLARACAO_IMP IS NULL ) )';
      qry_di_.Prepare;
      qry_di_.Open;

      in_DI_Registrada := False;
      if qry_di_NR_DECLARACAO_IMP.AsString <> '' then
      begin
        if not in_DI_Retificacao then
          in_DI_Registrada := True;
      end;

      if not qry_di_.EOF then
      begin
        mskedt_cd_tipo_declaracao.Color    := clMenu;
        mskedt_cd_tipo_declaracao.ReadOnly := True;
        mskedt_cd_tipo_declaracao.TabStop  := False;
        HabilitaBotoes( True );
        if datm_DI.qry_di_CD_TIPO_DECLARACAO.AsString = '' then
        begin
          qry_di_.Edit;
          qry_di_CD_TIPO_DECLARACAO.AsString := '01';
          qry_di_.Post;
        end;
        mskedt_cd_tipo_declaracao.Text := qry_di_CD_TIPO_DECLARACAO.AsString;
        qry_tp_decl_.Close;
        qry_tp_decl_.UnPrepare;
        qry_tp_decl_.ParamByName('CODIGO').AsString := qry_di_CD_TIPO_DECLARACAO.AsString;
        qry_tp_decl_.Prepare;
        qry_tp_decl_.Open;
        if qry_tp_decl_.RecordCount > 0 then
          edt_nm_tipo_declaracao.Text := qry_tp_decl_Descricao.AsString;
        qry_tp_decl_.Close;
      end
      else
      begin
        if in_DI_Retificacao then
        begin
          BoxMensagem('Processo não registrado ou não cadastrado!', 2);
        end
        else
        begin
          mskedt_cd_tipo_declaracao.Color    := clWindow;
          mskedt_cd_tipo_declaracao.ReadOnly := False;
          mskedt_cd_tipo_declaracao.TabStop  := True;
          HabilitaBotoes( False );
        end;
      end;
      //qry_di_.Close;  // Comentado por causa da Digitalização - Michel - 08/03/2010
    end;
  end;

  if mskedt_cd_tipo_declaracao.TabStop then
    mskedt_cd_tipo_declaracao.SetFocus
  else
    mskedt_nr_processo.SetFocus;
end;

procedure Tfrm_DI.btn_capa_diClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_DI_Capa, frm_DI_Capa);
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  frm_DI_capa.in_DI_Registrada := in_DI_Registrada;

  if Criando_DI then
  begin
    Dados_Default_Nova_Di;
    Criando_DI := False;
  end;

  frm_DI_Capa.ShowModal;

//  Desconnecta_GSM;

  case i_seletor of
    2: begin
         i_seletor := 0;
         btn_adicao_diClick(Sender);
       end;
    3: begin
         i_seletor := 0;
         btn_itens_diClick(Sender);
       end;
  end;
  FProcessoBusca := '';
  mskedt_nr_processoExit(Sender);
end;

procedure Tfrm_DI.btn_adicao_diClick(Sender: TObject);
begin
  datm_DI.qry_di_.Close;
  datm_DI.qry_di_.UnPrepare;
  datm_DI.qry_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  datm_DI.qry_di_.Prepare;
  datm_DI.qry_di_.Open;
  if ( datm_DI.qry_di_.RecordCount > 0 ) and ( datm_DI.qry_di_QT_ADICOES.AsFloat <= 0 )then
  begin
    BoxMensagem('Não existem adições' + #10#13 + 'para este processo!', 3);
    datm_DI.qry_di_.Close;
    Exit;
  end;
  datm_DI.qry_di_.Close;

  Application.CreateForm(Tfrm_DI_Adicao, frm_DI_Adicao);
  frm_DI_Adicao.in_DI_Registrada := in_DI_Registrada;
  frm_DI_Adicao.ShowModal;
  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  case i_seletor of
    1: begin
         i_seletor := 0;
         btn_capa_diClick(Sender);
       end;
    3: begin
         i_seletor := 0;
         btn_itens_diClick(Sender);
       end;
  end;

  if datm_DI.qryHistCalc.Active then
    datm_DI.qryHistCalc.Close;
  datm_DI.qryHistCalc.Open;
  //Desconnecta_GSM;
end;

procedure Tfrm_DI.btn_itens_diClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_DI_Itens, frm_DI_Itens);
  frm_DI_Itens.in_DI_Registrada := in_DI_Registrada;
  frm_DI_Itens.ShowModal;

  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  case i_seletor of
    1: begin
         i_seletor := 0;
         btn_capa_diClick(Sender);
       end;
    2: begin
         i_seletor := 0;
         btn_adicao_diClick(Sender);
       end;
  end;

  if datm_DI.qryHistCalc.Active then
    datm_DI.qryHistCalc.Close;
  datm_DI.qryHistCalc.Open;

  //Desconnecta_GSM;
end;

procedure Tfrm_DI.btn_duplicaClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_duplica_DI, frm_duplica_DI );
  frm_duplica_di.in_di := True;
  frm_duplica_DI.ShowModal;
  mskedt_nr_processoExit(Sender);
  Application.ProcessMessages;
end;

procedure Tfrm_DI.btn_co_unid_negClick(Sender: TObject);
begin

  with datm_di do
  begin

    Application.CreateForm(Tfrm_unidade, frm_unidade);
    frm_unidade.Cons_OnLine := qry_processo_CD_UNID_NEG;

    with frm_unidade do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;

    if (frm_unidade.Cons_OnLine_Texto <> '' ) then
    begin
      mskedt_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
      qry_unidade_.Close;
      qry_unidade_.UnPrepare;
      qry_unidade_.ParamByName('CD_UNID_NEG').AsString := mskedt_cd_unid_neg.Text;
      qry_unidade_.Prepare;
      qry_unidade_.Open;
      if qry_unidade_.RecordCount > 0 then
        edt_nm_unid_neg.Text := qry_unidade_AP_UNID_NEG.AsString;
      qry_unidade_.Close;
    end;
  end;
end;

procedure Tfrm_DI.btn_tipo_declaracaoClick(Sender: TObject);
begin
  with datm_di do
  begin
    qry_di_.Close;
    qry_di_.UnPrepare;
    qry_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_di_.Prepare;
    qry_di_.Open;

    Cons_On_line_Texto( 'DBBROKER', 'TTIPO_DECLARACAO', mskedt_cd_tipo_declaracao, 'Tipo de Declaração', 33, '');

    qry_di_.Close;
  end;
end;

procedure Tfrm_DI.mskedt_cd_unid_negExit(Sender: TObject);
begin
  ValCodEdt( mskedt_cd_unid_neg );
  with datm_di do
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.UnPrepare;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_usuario_habilitacao_.Prepare;
    qry_usuario_habilitacao_.Open;

    // Descrição da Unidade
    qry_unidade_.Close;
    qry_unidade_.UnPrepare;
    qry_unidade_.ParamByName('CD_UNID_NEG').AsString := mskedt_cd_unid_neg.Text;
    qry_unidade_.Prepare;
    qry_unidade_.Open;
    if qry_unidade_.RecordCount > 0 then
       edt_nm_unid_neg.Text := qry_unidade_AP_UNID_NEG.AsString
    else
       edt_nm_unid_neg.Text := '';
    qry_unidade_.Close;

    if not qry_usuario_habilitacao_.Locate('CD_UNID_NEG', mskedt_cd_unid_neg.Text, [loCaseInsensitive]) then
    begin
      BoxMensagem('Unidade de Negócio não existe ou não está Habilitada!',3);
      mskedt_cd_unid_neg.Text := '';
      edt_nm_unid_neg.Text := '';
      mskedt_cd_unid_neg.SetFocus;
    end;
    qry_usuario_habilitacao_.Close;
  end;
end;

procedure Tfrm_DI.mskedt_cd_tipo_declaracaoExit(Sender: TObject);
begin
  if mskedt_cd_tipo_declaracao.Text <> '' then ValCodEdt( mskedt_cd_tipo_declaracao );
  with datm_DI do
  begin
    qry_tp_decl_.Close;
    qry_tp_decl_.UnPrepare;
    qry_tp_decl_.ParamByName('CODIGO').AsString := mskedt_cd_tipo_declaracao.Text;
    qry_tp_decl_.Prepare;
    qry_tp_decl_.Open;
    if qry_tp_decl_.RecordCount > 0 then
       edt_nm_tipo_declaracao.Text := qry_tp_decl_Descricao.AsString
    else
    begin
      BoxMensagem('Tipo de Declaração inválido!', 3);
      qry_tp_decl_.Close;
      Exit;
    end;
    qry_tp_decl_.Close;
  end;

end;

procedure Tfrm_DI.btn_liClick(Sender: TObject);
var
in_moeda_unica:String;
vl_moeda_unica, vl_mercadoria:Double;
begin
  {Verifica se os Valores necessarios estão preenchidos - by Carlos 27/07/2010 }
  with TQuery.Create(Application)do
  begin
    DataBaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add(' SELECT Isnull(IN_MOEDA_UNICA,0), ISNULL(VL_TOT_MLE_MNEG,0) VL_TOT_MLE_MNEG, ');
    SQL.Add(' (ISNULL(VL_TOT_FRT_PREPAID,0)+ISNULL(VL_TOT_FRT_COLLECT,0)+ISNULL(VL_FRETE_TNAC_MNEG,0)) TOT_MERCADORIA ');
    SQL.Add(' FROM TDECLARACAO_IMPORTACAO (NOLOCK) ');
    SQL.Add(' WHERE  NR_PROCESSO = :NR_PROCESSO ');
    ParamByName('NR_PROCESSO').AsString:=mskedt_cd_unid_neg.Text+'01'+mskedt_nr_processo.Text;
    Open;
    in_moeda_unica:=Fields[0].AsString;
    vl_moeda_unica:=fields[1].AsFloat;
    vl_mercadoria :=fields[2].AsFloat;
    Close;
    free;
  end;
  if (in_moeda_unica='True') and (vl_moeda_unica=0) then begin
     ShowMessage('Valor Total das Mercadorias no Local de Embarque não Informado!!');
     exit;
  end;

  if vl_mercadoria=0 then begin
     ShowMessage('Frete Total não Informado!!');
     exit;
  end;


  Application.CreateForm(Tfrm_DI_Adicao_Com_LI,frm_DI_Adicao_Com_LI);
  frm_DI_Adicao_Com_LI.cd_unidade  := mskedt_cd_unid_neg.Text;
  frm_DI_Adicao_Com_LI.cd_produto  := '01';
  frm_DI_Adicao_Com_LI.nr_processo := mskedt_nr_processo.Text;
  frm_DI_Adicao_Com_LI.ShowModal;
end;

procedure Tfrm_DI.btn_nr_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;                                              
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''01''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + mskedt_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  mskedt_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;
end;

procedure Tfrm_DI.PreparaDatamodule;
begin
  with datm_di do
  begin
    in_DI_Retificacao               := False;
    str_cd_produto                  := '01';
    mskedt_cd_unid_neg.Text         := str_cd_unid_neg;
    mskedt_cd_tipo_declaracao.Text  := '01';

    qry_unidade_.Close;
    qry_unidade_.UnPrepare;
    qry_unidade_.ParamByName('CD_UNID_NEG').AsString := mskedt_cd_unid_neg.Text;
    qry_unidade_.Prepare;
    qry_unidade_.Open;
    if qry_unidade_.RecordCount > 0 then
      edt_nm_unid_neg.Text := qry_unidade_AP_UNID_NEG.AsString;
    qry_unidade_.Close;

    qry_tp_decl_.Close;
    qry_tp_decl_.UnPrepare;
    qry_tp_decl_.ParamByName('CODIGO').AsString := mskedt_cd_tipo_declaracao.Text;
    qry_tp_decl_.Prepare;
    qry_tp_decl_.Open;
    if qry_tp_decl_.RecordCount > 0 then
      edt_nm_tipo_declaracao.Text := qry_tp_decl_Descricao.AsString;
    qry_tp_decl_.Close;
  end;
end;

procedure Tfrm_DI.FormCreate(Sender: TObject);
begin
  FProcessoBusca := '';
  Criando_DI    := False;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  // Inicializa o Data Module para Senha
  Application.CreateForm( Tdatm_DI, datm_DI );
 // Application.CreateForm( Tdatm_DI_Itens, datm_DI_Itens );

  PreparaDatamodule;
end;

procedure Tfrm_DI.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
//  Panel1.Color := clPnlClaroBroker;

  if pesq_cd_unid_neg <> '' then
    mskedt_cd_unid_neg.Text := pesq_cd_unid_neg
  else
    mskedt_cd_unid_neg.Text := str_cd_unid_neg;
  mskedt_cd_unid_negExit(nil);

  if pesq_nr_processo <> '' then
  begin
    mskedt_nr_processo.Text := pesq_nr_processo;
    mskedt_nr_processoExit(nil);
  end;

  mskedt_nr_processo.SetFocus;
  if in_DI_Retificacao then
    Caption := 'Retificação de Declaração de Importação';
end;

procedure Tfrm_DI.mskedt_cd_tipo_declaracaoEnter(Sender: TObject);
begin
  if Not mskedt_cd_tipo_declaracao.TabStop then
    mskedt_nr_processo.SetFocus;
end;

procedure Tfrm_DI.btn_calculoClick(Sender: TObject);
var
  vQryItensAux : TQuery;
  vReferenciaErrada : Boolean;
  vInConferencia : string;
begin
 { vInConferencia := ConsultaLookUPSQL('select B.IN_CONFERE_REFERENCIA from TPROCESSO A (NOLOCK), TGRUPO B (NOLOCK) where ' +
                                      'A.NR_PROCESSO = '''  + str_nr_processo + ''' and B.CD_GRUPO = A.CD_GRUPO','IN_CONFERE_REFERENCIA');
  vReferenciaErrada := VerifReferenciaDI(str_nr_processo, vInConferencia);
  if not vReferenciaErrada then
    Exit;  }

  Application.CreateForm(Tfrm_di_capa, frm_di_capa);
  frm_DI_capa.FormShow(frm_DI_capa);
  frm_DI_capa.btn_calculoClick(frm_DI_capa.btn_calculo);
  if datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert] then
    datm_DI_Capa.qry_di_.Post;
  frm_DI_capa.Close;

  if datm_DI.qryHistCalc.Active then
    datm_DI.qryHistCalc.Close;
  datm_DI.qryHistCalc.Open;
end;

procedure Tfrm_DI.Dados_Default_Nova_Di;
begin
  with datm_DI do
  begin
    qry_processo_.Close;
    qry_processo_.UnPrepare;
    qry_processo_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_processo_.Prepare;
    qry_processo_.Open;

    if qry_di_CD_VIA_TRANSP_CARG.AsString = '01' then //Marítimo
    begin
      qry_di_CD_LOCAL_EMBARQUE.AsString := qry_processo_CD_LOCAL_EMBARQUE.AsString;
      qry_di_CD_TRANSPORTADOR.AsString  := qry_processo_CD_TRANSPORTADOR.AsString;

      if qry_processo_NR_CONHECIMENTO_MASTER.AsString <> '' then
      begin
        qry_di_NR_DCTO_CARGA_MAST.AsString := qry_processo_NR_CONHECIMENTO_MASTER.AsString;
        qry_di_NR_DCTO_CARGA.AsString      := qry_processo_NR_CONHECIMENTO.AsString;
        qry_di_CD_TIPO_DCTO_CARGA.AsString := '12';
      end
      else
      begin
        if qry_processo_NR_CONHECIMENTO.AsString <> '' then
        begin
          qry_di_NR_DCTO_CARGA.AsString      := qry_processo_NR_CONHECIMENTO.AsString;
          qry_di_CD_TIPO_DCTO_CARGA.AsString := '10';
        end;
      end;

      qry_di_CD_TIPO_MANIFESTO.AsString  := '1';
      qry_di_NR_MANIFESTO.AsString       := qry_processo_NR_MANIFESTO.AsString;
    end;

    if qry_di_CD_VIA_TRANSP_CARG.AsString = '04' then // Aéreo
    begin
      qry_di_CD_LOCAL_EMBARQUE.AsString := qry_processo_CD_LOCAL_EMBARQUE.AsString;

      if qry_processo_NR_CONHECIMENTO_MASTER.AsString <> '' then
      begin
        qry_di_NR_DCTO_CARGA_MAST.AsString   := qry_processo_NR_CONHECIMENTO_MASTER.AsString;
        qry_di_NR_DCTO_CARGA.AsString        := qry_processo_NR_CONHECIMENTO.AsString;
        qry_di_CD_TIPO_DCTO_CARGA.AsString   := '03';
      end
      else
      begin
        if qry_processo_NR_CONHECIMENTO.AsString <> '' then
        begin
          qry_di_NR_DCTO_CARGA.AsString      := qry_processo_NR_CONHECIMENTO.AsString;
          qry_di_CD_TIPO_DCTO_CARGA.AsString := '01';
        end;
      end;

      qry_di_CD_TIPO_MANIFESTO.AsString := '2';
      qry_di_NR_MANIFESTO.AsString      := qry_processo_NR_MANIFESTO.AsString;
    end;

    if qry_di_CD_VIA_TRANSP_CARG.AsString = '07' then // Rodoviário
    begin
      datm_DI.qry_di_CD_TIPO_DCTO_CARGA.AsString := '13';
      datm_DI.qry_di_CD_TIPO_MANIFESTO.AsString  := '4';  //'1';
      datm_DI.qry_di_CD_TRANSPORTADOR.asString   := datm_DI.qry_processo_CD_TRANSPORTADOR.AsString;
      datm_DI.qry_di_NR_MANIFESTO.AsString       := datm_DI.qry_processo_NR_MANIFESTO.AsString;
      datm_DI.qry_di_NR_DCTO_CARGA_MAST.AsString := datm_DI.qry_processo_NR_CONHECIMENTO_MASTER.AsString;
      datm_DI.qry_di_NR_DCTO_CARGA.AsString      := datm_DI.qry_processo_NR_CONHECIMENTO.AsString;
      datm_DI.qry_di_NR_VEICULO_TRANSP.AsString  := datm_DI.qry_processo_NR_PLACA_VEICULO.AsString;
      datm_DI.qry_di_CD_URF_ENTR_CARGA.AsString  := datm_DI.qry_processo_CD_URF_ENTRADA.AsString;

    end;

    if Pos( qry_di_CD_VIA_TRANSP_CARG.AsString, '01,02,03' ) > 0 then //Marítimo, Fluvial, Lacustre
    begin
      qry_di_CD_VEICULO_TRANSP.AsString  := qry_processo_CD_EMBARCACAO.AsString;
      qry_di_CD_BANDEIRA_TRANSP.AsString := qry_processo_CD_PAIS.AsString;
    end;

    datm_DI.qry_di_HR_DI.AsString                := FormatDateTime('hh:mm:ss', Now);
    datm_DI.qry_di_VL_TOT_MLE_MNEG.asFloat       := datm_DI.qry_processo_VL_MLE_MNEG.asFloat;
    datm_DI.qry_di_CD_MOEDA_MLE.AsString         := datm_DI.qry_processo_CD_MOEDA_MLE.AsString;
    datm_DI.qry_di_CD_MOEDA_FRETE.AsString       := datm_DI.qry_processo_CD_MOEDA_FRETE.AsString;
    datm_DI.qry_di_CD_MOEDA_SEGURO.AsString      := datm_DI.qry_processo_CD_MOEDA_MLE.AsString;
    datm_DI.qry_di_PB_CARGA.AsFloat              := datm_DI.qry_processo_VL_PESO_BRUTO.AsFloat;
    datm_DI.qry_di_PL_CARGA.AsFloat              := datm_DI.qry_processo_VL_PESO_LIQUIDO.AsFloat;
    datm_DI.qry_di_IN_MOEDA_UNICA.asBoolean      := true;
    datm_DI.qry_di_CD_PAIS_PROC_CARGA.AsString   := datm_DI.qry_processo_CD_PAIS_ORIGEM.AsString;
    datm_DI.qry_di_NM_VEICULO_TRANSP.AsString    := datm_DI.qry_processo_NM_EMBARCACAO.AsString;
    datm_DI.qry_di_CD_TIPO_IMPORTADOR.AsString   := datm_DI.qry_processo_CD_TIPO_PESSOA.AsString;
    datm_DI.qry_di_CD_TIPO_BASE_SEGURO.asstring  := datm_DI.qry_processo_CD_TIPO_BASE_SEGURO_DI.AsString;
    datm_DI.qry_di_PC_SEGURO_MLE.asFloat         := datm_DI.qry_processo_PC_SEGURO_MLE_DI.asFloat;
    datm_DI.qry_di_VL_TOT_FRT_COLLECT.AsFloat    := datm_DI.qry_processo_VL_FRETE_COLLECT_MNEG.AsFloat;
    datm_DI.qry_di_VL_TOT_FRT_PREPAID.AsFloat    := datm_DI.qry_processo_VL_FRETE_PREPAID_MNEG.AsFloat;
    datm_DI.qry_di_VL_FRETE_TNAC_MNEG.AsFloat    := datm_DI.qry_processo_VL_FRETE_TNAC_MNEG.AsFloat;

    if datm_DI.qry_processo_TP_FRETE.asstring = '1' then
      datm_DI.qry_di_IN_EMBUT_FRT_ITENS.asBoolean := true
    else
      datm_DI.qry_di_IN_EMBUT_FRT_ITENS.asBoolean := false;

    datm_DI.qry_di_CD_VINC_IMPO_EXPO.asString := '4';

    qry_di_.Post;

    if datm_DI.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString <> '' then
    begin
      BoxMensagem('Existe uma instrução de desembaraço relacionada a este processo. ' + #10#13 +
                  'O Sistema irá automaticamente lançar os itens do pedido para esta DI.', 3);

      FastExecSQL(Format('EXEC SP_ALIMENTA_ITENS_DI ''%s'', ''%s''', [str_nr_processo, datm_DI.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString]));
    end
    else
    begin
      qryRefCliente.Close;
      qryRefCliente.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qryRefCliente.Open;
      if qryRefCliente.RecordCount > 0 then
      begin
        BoxMensagem('O Sistema irá automaticamente lançar os itens dos pedidos, correspondentes às referências do processo, para esta DI.', 3);
        FastExecSQL(Format('EXEC SP_ALIMENTA_ITENS_DI_REF_CLIENTE ''%s''', [str_nr_processo]));
      end;
    end;

    qry_processo_.Close;
    qry_di_.Close;

    qryInsereDoctos.close;
    qryInsereDoctos.ParamByName('NR_PROCESSO1').AsString := str_nr_processo;
    qryInsereDoctos.ParamByName('NR_PROCESSO2').AsString := str_nr_processo;
    qryInsereDoctos.ExecSql;

    qryInsereDeducao.close;
    qryInsereDeducao.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qryInsereDeducao.ExecSql;

    qryInsereEmbalagem.close;
    qryInsereEmbalagem.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qryInsereEmbalagem.ExecSql;

   { CloseStoredProc( sp_di_ret_embalagem );
    sp_di_ret_embalagem.ParamByName( '@nr_processo' ).AsString := str_nr_processo;
    ExecStoredProc( sp_di_ret_embalagem );
    CloseStoredProc( sp_di_ret_embalagem );   }

    CloseStoredProc( sp_da_gera_di );
    sp_da_gera_di.ParamByName( '@nr_processo' ).AsString := str_nr_processo;
    ExecStoredProc( sp_da_gera_di );
    CloseStoredProc( sp_da_gera_di );

    CloseStoredProc( sp_nac_gera_di );
    sp_nac_gera_di.ParamByName( '@nr_processo' ).AsString := str_nr_processo;
    ExecStoredProc( sp_nac_gera_di );
    CloseStoredProc( sp_nac_gera_di );
  end;
end;

procedure Tfrm_DI.mskedt_nr_processoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = mskedt_nr_processo        then btn_nr_processoClick(nil);
    if Sender = mskedt_cd_tipo_declaracao then btn_tipo_declaracaoClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = mskedt_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      mskedt_cd_unid_neg.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
      mskedt_cd_unid_negExit(nil);
      mskedt_nr_processo.Text := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      mskedt_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_DI.btn_resumoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_DI_Resumo, frm_DI_Resumo);
  frm_DI_Resumo.ShowModal;
end;

procedure Tfrm_DI.btn_manut_procClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0102';
  Close;
end;

procedure Tfrm_DI.mi_rel_rascunhoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  with crp_di do
  begin
    ReInitLibrary;
    Connect        := 'DSN=BROKER; UID=sa; PWD=123; DSQ=BROKER';
    //Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    ReportName  := cDir_Rpt + '\CRGSM001.RPT';
    ReportTitle := 'Rascunho de DI - Capa e Itens';
    //SelectionFormula[0] := '{DI.NR_PROCESSO} = "'+ str_nr_processo + '"';
    //Formulas[0] := 'NR_PROCESSO = "'+ str_nr_processo + '"';
    GaranteHandleTProcesso(1, str_nr_processo);
    Execute;
  end;
  Screen.Cursor := crArrow;
end;

procedure Tfrm_DI.mi_rel_calcClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  with crp_di do
  begin
    ReInitLibrary;
    //Connect        := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    //TODO: Alteração temporária, enquanto não se resolve o problema do usuário luiz.ornelas
    Connect        := 'DSN=BROKER; UID=sa; PWD=123; DSQ=BROKER';
    ReportName     := cDir_Rpt + '\CRDI004.RPT';
    ReportTitle    := 'Cálculo de Processo DI - Capa e Adições';
    SelectionFormula[0] := '{TDECLARACAO_IMPORTACAO.NR_PROCESSO} = "'+ str_nr_processo +'"';
    Execute;
  end;
  Screen.Cursor := crArrow;
end;

procedure Tfrm_DI.btn_di_proc_expClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0110';
  Close;
end;

procedure Tfrm_DI.AlimentaItensDI;
{var
  vQryItensDesemb : TQuery;}
begin
  FastExecSQL(Format('EXEC SP_ALIMENTA_ITENS_DI ''%s'', ''%s''', [str_nr_processo, datm_DI.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString]));
  (*vQryItensDesemb              := TQuery.Create(Application);
  vQryItensDesemb.DatabaseName := 'DBBROKER';
  {vQryItensDesemb.SQL.Add('select * from TINSTRUCAO_DESEMBARACO_PEDIDO A, TPO_ITEM B');
  vQryItensDesemb.SQL.Add('where');
  vQryItensDesemb.SQL.Add('   A.ID_CODIGO =:ID_CODIGO and A.NR_REFERENCIA = B.NR_PROCESSO and');
  vQryItensDesemb.SQL.Add('   A.NR_ITEM_PO = B.NR_ITEM_CLIENTE AND A.NR_PARCIAL = B.NR_PARCIAL');}

  // Incuida a tabela TINSTRUCAO_DESEMBARACO no join, pois trouxe itens de outro cliente que tinham o mesmo pedido/item/parcial - Michel - 20/01/2011
  vQryItensDesemb.SQL.Add('SELECT *');
  vQryItensDesemb.SQL.Add('FROM TINSTRUCAO_DESEMBARACO_PEDIDO A');
  vQryItensDesemb.SQL.Add('   INNER JOIN TPO_ITEM B ON B.NR_PROCESSO = A.NR_REFERENCIA');
  vQryItensDesemb.SQL.Add('                        AND B.NR_ITEM_CLIENTE = A.NR_ITEM_PO');
  vQryItensDesemb.SQL.Add('                        AND B.NR_PARCIAL = A.NR_PARCIAL');
  vQryItensDesemb.SQL.Add('   INNER JOIN TINSTRUCAO_DESEMBARACO C ON C.ID_CODIGO = A.ID_CODIGO');
  vQryItensDesemb.SQL.Add('                                      AND C.CD_CLIENTE = B.CD_EMPRESA');
  vQryItensDesemb.SQL.Add('WHERE A.ID_CODIGO = :ID_CODIGO');

  vQryItensDesemb.ParamByName('ID_CODIGO').AsString := datm_DI.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString;
  vQryItensDesemb.Open;

  with TQuery.Create(Application)do
  begin
    DataBaseName := 'DBBROKER';
    while not vQryItensDesemb.Eof do
    begin
      Sql.Clear;
      Sql.Add('INSERT INTO TDETALHE_MERCADORIA');
      Sql.Add('(NR_PROCESSO, NR_ADICAO, NR_ITEM,      CD_MERCADORIA, CD_FABR_EXPO, CD_EXPORTADOR, CD_FABRICANTE, ');
      Sql.Add(' CD_PAIS_AQUISICAO, CD_PAIS_ORIGEM,    CD_NCM_SH, CD_NALADI_SH, CD_NALADI_NCCA , ');
      Sql.Add(' TX_DESC_DET_MERC, QT_MERC_UN_COMERC,  CD_UN_MED_COMERC, VL_UNITARIO, VL_MLE_ITEM, PL_MERCADORIA, ');
      Sql.Add(' CD_TIPO_CALCULO_ITEM, NR_PROC_PO, NR_ITEM_PO, NR_PARCIAL)');
      Sql.Add('values');
      Sql.Add('(:NR_PROCESSO, :NR_ADICAO, :NR_ITEM,    :CD_MERCADORIA, :CD_FABR_EXPO, :CD_EXPORTADOR, :CD_FABRICANTE, ');
      Sql.Add(' :CD_PAIS_AQUISICAO, :CD_PAIS_ORIGEM,   :CD_NCM_SH, :CD_NALADI_SH, :CD_NALADI_NCCA, ');
      Sql.Add(' :TX_DESC_DET_MERC, :QT_MERC_UN_COMERC, :CD_UN_MED_COMERC, :VL_UNITARIO, :VL_MLE_ITEM, :PL_MERCADORIA, ');
      Sql.Add(' :CD_TIPO_CALCULO_ITEM, :NR_PROC_PO, :NR_ITEM_PO, :NR_PARCIAL)');

      //Campos Chave PK
      ParamByName('NR_PROCESSO').AsString          := str_nr_processo;
      ParamByName('NR_ADICAO').AsString            := '001';
      ParamByName('NR_ITEM').AsString              := '***';

      //Campos diversos
      ParamByName('CD_FABR_EXPO').AsString         := vQryItensDesemb.FieldByName('IN_FABR_EXP_PROD').AsString;
      ParamByName('CD_EXPORTADOR').AsString        := vQryItensDesemb.FieldByName('CD_EXPORTADOR').AsString;
      ParamByName('CD_FABRICANTE').AsString        := vQryItensDesemb.FieldByName('CD_FABRICANTE').AsString;
      ParamByName('CD_PAIS_AQUISICAO').AsString    := vQryItensDesemb.FieldByName('CD_PAIS_AQUISICAO').AsString;
      ParamByName('CD_PAIS_ORIGEM').AsString       := vQryItensDesemb.FieldByName('CD_PAIS_ORIGEM').AsString;
      ParamByName('CD_MERCADORIA').AsString        := vQryItensDesemb.FieldByName('CD_MERCADORIA').AsString;
      ParamByName('CD_NCM_SH').AsString            := vQryItensDesemb.FieldByName('CD_NCM_SH').AsString;
      ParamByName('CD_NALADI_SH').AsString         := vQryItensDesemb.FieldByName('CD_NALADI_SH').AsString;
      ParamByName('CD_NALADI_NCCA').AsString       := vQryItensDesemb.FieldByName('CD_NALADI_NCCA').AsString;
      ParamByName('TX_DESC_DET_MERC').AsString     := vQryItensDesemb.FieldByName('TX_MERCADORIA').AsString;
      ParamByName('QT_MERC_UN_COMERC').AsFloat     := vQryItensDesemb.FieldByName('QT_INICIAL').AsFloat;     // Aletrado de ASSTRING para ASFLOAT, erro durante a execução da query - Michel - 06/11/2008
      ParamByName('CD_UN_MED_COMERC').AsString     := vQryItensDesemb.FieldByName('CD_UNID_MEDIDA').AsString;
      ParamByName('VL_UNITARIO').AsFloat           := vQryItensDesemb.FieldByName('VL_UNITARIO').AsFloat;
      ParamByName('VL_MLE_ITEM').AsFloat           := vQryItensDesemb.FieldByName('VL_UNITARIO').AsFloat * vQryItensDesemb.FieldByName('QT_INICIAL').AsFloat;
      ParamByName('PL_MERCADORIA').AsFloat         := vQryItensDesemb.FieldByName('PL_ITEM').AsFloat;
      ParamByName('CD_TIPO_CALCULO_ITEM').AsString := vQryItensDesemb.FieldByName('TP_CALCULO').AsString;
      ParamByName('CD_PAIS_ORIGEM').AsString       := vQryItensDesemb.FieldByName('CD_PAIS_ORIGEM').AsString;

      //Pedido/Item/Parcial
      ParamByName('NR_PROC_PO').AsString           := vQryItensDesemb.FieldByName('NR_REFERENCIA').AsString;
      ParamByName('NR_ITEM_PO').AsString           := vQryItensDesemb.FieldByName('NR_ITEM_PO').AsString;
      ParamByName('NR_PARCIAL').AsInteger          := vQryItensDesemb.FieldByName('NR_PARCIAL').AsInteger;

      ExecSql;

      //Procedure para classificar e gerar as adições
      CloseStoredProc(datm_DI.sp_di_classifica_item);
      datm_DI.sp_di_classifica_item.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
      ExecStoredProc(datm_DI.sp_di_classifica_item);
      CloseStoredProc(datm_DI.sp_di_classifica_item);

      vQryItensDesemb.Next;
    end;
  end;*)
end;

procedure Tfrm_DI.btn_trans_DIClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_trans_DI, frm_trans_DI);
  // Desabilitar as opções de alterar a consulta
  frm_trans_di.msk_cd_unid_neg.Enabled := False;
  frm_trans_di.btn_co_unid_neg.Enabled := False;
  frm_trans_di.msk_cd_grupo.Enabled    := False;
  frm_trans_di.btn_co_grupo.Enabled    := False;
  frm_trans_di.msk_cd_cliente.Enabled  := False;
  frm_trans_di.btn_co_cliente.Enabled  := False;
  // Preenche os campos
  frm_trans_DI.msk_cd_unid_neg.Text := mskedt_cd_unid_neg.Text;
  frm_trans_DI.msk_cd_unid_negExit(frm_trans_DI.msk_cd_unid_neg);
  frm_trans_DI.msk_cd_cliente.Text := edt_cd_cliente.Text;
  frm_trans_DI.msk_cd_clienteExit(frm_trans_DI.msk_cd_cliente);
  // Preencher parâmetro com o processo e exibir a janela
  datm_trans_di.qry_grd_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  datm_trans_di.qry_grd_di_.ParamByName('CD_CARGO').AsString := str_cd_cargo;
  frm_trans_DI.ShowModal;
  FreeAndNil(frm_trans_DI);
end;

procedure Tfrm_DI.btn_RetificarClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_RetificaDI_Adm_Temp, frm_RetificaDI_Adm_Temp);
  frm_RetificaDI_Adm_Temp.ShowModal('', '', '', str_nr_processo);
end;

procedure Tfrm_DI.dbtxtVisualizarClick(Sender: TObject);
begin
  ShowMessage('');
end;

procedure Tfrm_DI.dbgHistCalcCellClick(Column: TColumn);
begin
  if (Column = dbgHistCalc.Columns[0]) and (datm_DI.qryHistCalcNM_OPCAO.AsString <> '') then
  begin
    Application.CreateForm(TfrmHistoricoClalculoDI, frmHistoricoClalculoDI);
    try
      frmHistoricoClalculoDI.ShowModal;
    finally
      FreeAndNil(frmHistoricoClalculoDI);
    end;
  end;
end;

procedure Tfrm_DI.mskedt_nr_processoEnter(Sender: TObject);
begin
  FProcessoBusca := mskedt_nr_processo.Text;
end;

procedure Tfrm_DI.dbgHistCalcDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column = dbgHistCalc.Columns[0] then
    dbgHistCalc.Canvas.Font.Color := clBlue
  else
    dbgHistCalc.Canvas.Font.Color := clWindowText;
  dbgHistCalc.Canvas.FillRect(Rect);
  if datm_DI.qryHistCalcNM_OPCAO.AsString <> '' then
    dbgHistCalc.Canvas.Brush.Color := clWindow
  else
    dbgHistCalc.Canvas.Brush.Color := $00BAE4BE;
  dbgHistCalc.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_DI.btn_import_licenca_itensClick(Sender: TObject);
begin
  if Confirm('Confirma operação?') then
  begin
    CloneLicencaItens(mskedt_cd_unid_neg.Text + '01' + mskedt_nr_processo.Text);
    PreparaDatamodule;
    FProcessoBusca := '';
    mskedt_nr_processoExit(Sender);
    Information('Operação concluída com sucesso.');
  end;
end;

procedure Tfrm_DI.btnDivergenciasMercanteClick(Sender: TObject);
begin
  if trim(str_nr_processo) <> '' then
  begin
    Application.CreateForm(TfrmConsultaMercanteDivergencias, frmConsultaMercanteDivergencias);
    frmConsultaMercanteDivergencias.VerificarDivergencias(str_nr_processo);
  end
  else
  begin
    showmessage('Selecione o processo.')
  end;
end;

procedure Tfrm_DI.btnLiberarDiValorAltoClick(Sender: TObject);
begin
//  str_cd_rotina_atalho := '0203';
//  Close;

  if frm_main.mi_di_lib_alto_valor.visible then
  begin
    if not VerIntegridade then Exit;
    vStr_cd_modulo := '02';
    str_cd_rotina := '0203';
    str_cd_mod := vStr_cd_modulo;
    str_cd_rot := str_cd_rotina;
    Application.CreateForm(Tfrm_di_libera, frm_di_libera);
    frm_di_libera.ShowModal;
  end
  else
    ShowMessage('Usuario sem acesso ao modulo de Liberação de DI');
end;

procedure Tfrm_DI.btnImportarArquivoItensDIClick(Sender: TObject);
var
  Form: TfrmImportarPlanilhaItensDI;
begin
  Form := TfrmImportarPlanilhaItensDI.Create(nil);
  try
    Form.lblNrProcesso.caption :=  str_nr_processo;
    Form.lblGrupo.caption      :=  str_cd_Grupo;
    Form.lblCliente.caption    :=  str_cd_Cliente;
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure Tfrm_DI.btnImportarXMLDiClick(Sender: TObject);
var
  Form: TfrmImportarXMLDISiscomex;
begin
  if (str_nr_processo <> '') and (str_cd_Grupo <> '') then
  begin
    Form := TfrmImportarXMLDISiscomex.Create(nil);
    try
      Form.lblNrProcesso.caption :=  str_nr_processo;
      Form.lblGrupo.caption      :=  str_cd_Grupo;
      Form.lblCliente.caption    :=  edt_cd_cliente.text;;
      Form.ViaTransporte := str_via_transp;
      Form.ShowModal;
    finally
      Form.Free;
    end;
    FProcessoBusca := '';
    mskedt_nr_processoExit(sender);
  end;
end;

procedure Tfrm_DI.btnEnvioDuimpClick(Sender: TObject);
var
  Pasta: string;
  CaminhoArquivo: string;
  vNrProcesso: string;
begin
  Pasta :='C:\DDBROKER\Duimp\';
  CaminhoArquivo := Pasta+'IntegracaoDuimp.exe';
  vNrProcesso := str_nr_processo;

  if not FileExists(CaminhoArquivo) then
  begin
    ShowMessage('Sistema não encontrado no caminho ' + CaminhoArquivo +'.');
    Exit;
  end;

  StartApp('Open', PChar(CaminhoArquivo), PAnsiChar(ServidorEmUso + ' TransmissaoDuimp ' + vNrProcesso), PChar(Pasta), SW_SHOW);

end;

end.

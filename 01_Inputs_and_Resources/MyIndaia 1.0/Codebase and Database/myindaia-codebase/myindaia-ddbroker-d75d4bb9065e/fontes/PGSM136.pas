unit PGSM136;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids, ComCtrls, Menus, Buttons,
  ExtCtrls, Db, DBTables, UCRPE32, Funcoes, PGGP017;

type
  Tfrm_pesq_proc = class(TForm)
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    pgctrl_pesq_proc: TPageControl;
    ts_filtros: TTabSheet;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    btn_co_area: TSpeedButton;
    lbl_cd_produto: TLabel;
    btn_co_produto: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    ts_lista: TTabSheet;
    dbg_lib_proc: TDBGrid;
    Label4: TLabel;
    btn_co_cliente: TSpeedButton;
    msk_cd_cliente: TMaskEdit;
    edt_nm_cliente: TEdit;
    Label5: TLabel;
    btn_co_servico: TSpeedButton;
    msk_cd_servico: TMaskEdit;
    edt_nm_servico: TEdit;
    Label6: TLabel;
    btn_co_navio: TSpeedButton;
    msk_cd_navio: TMaskEdit;
    edt_nm_navio: TEdit;
    Label7: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    btn_co_local_emb: TSpeedButton;
    btn_co_local_desemb: TSpeedButton;
    btn_co_pais_dest: TSpeedButton;
    btn_co_pais_origem: TSpeedButton;
    lbl_di_da: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    msk_nr_voo: TMaskEdit;
    msk_nr_di: TMaskEdit;
    msk_nr_dde: TMaskEdit;
    msk_nr_li: TMaskEdit;
    msk_cd_local_emb: TMaskEdit;
    msk_cd_local_desemb: TMaskEdit;
    msk_cd_pais_dest: TMaskEdit;
    msk_cd_pais_origem: TMaskEdit;
    edt_nm_local_emb: TEdit;
    edt_nm_local_desemb: TEdit;
    edt_nm_pais_dest: TEdit;
    edt_nm_pais_origem: TEdit;
    msk_nr_re: TMaskEdit;
    Label10: TLabel;
    msk_cd_ref: TMaskEdit;
    Label11: TLabel;
    mi_manut_proc: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    btn_co_armazem_atracacao: TSpeedButton;
    btn_co_armazem_descarga: TSpeedButton;
    btn_co_agente: TSpeedButton;
    msk_cd_armazem_atracacao: TMaskEdit;
    msk_cd_armazem_descarga: TMaskEdit;
    msk_cd_agente: TMaskEdit;
    edt_nm_armazem_atracacao: TEdit;
    edt_nm_armazem_descarga: TEdit;
    edt_nm_agente: TEdit;
    lbl_viagem: TLabel;
    lbl_cntr: TLabel;
    msk_nr_viagem: TMaskEdit;
    msk_nr_cntr: TMaskEdit;
    lbl_fatura: TLabel;
    msk_nr_fatura: TMaskEdit;
    lbl_canal: TLabel;
    dblkpcbox_canal: TDBLookupComboBox;
    lbl_transp_rod: TLabel;
    msk_cd_transp_nac: TMaskEdit;
    edt_nm_transp_nac: TEdit;
    btn_co_transp_nac: TSpeedButton;
    lbl_conhecimento: TLabel;
    msk_nr_conhecimento: TMaskEdit;
    lbl_nr_conhecimento_master: TLabel;
    msk_nr_conhecimento_master: TMaskEdit;
    mi_proc_realiza: TMenuItem;
    Label3: TLabel;
    btn_co_grupo: TSpeedButton;
    msk_cd_grupo: TMaskEdit;
    edt_nm_grupo: TEdit;
    lbl_evento: TLabel;
    btn_co_evento: TSpeedButton;
    msk_cd_evento: TMaskEdit;
    edt_nm_evento: TEdit;
    lbl_importador: TLabel;
    btn_co_importador: TSpeedButton;
    msk_cd_importador: TMaskEdit;
    edt_nm_importador: TEdit;
    lbl_exportador: TLabel;
    btn_co_exportador: TSpeedButton;
    msk_cd_exportador: TMaskEdit;
    edt_nm_exportador: TEdit;
    lbl_periodo: TLabel;
    msk_dt_inicio: TMaskEdit;
    msk_dt_fim: TMaskEdit;
    Label15: TLabel;
    lbl_dt_abertura: TLabel;
    msk_dt_inicio_abertura: TMaskEdit;
    Label16: TLabel;
    msk_dt_fim_abertura: TMaskEdit;
    mi_imprimir: TMenuItem;
    crp_proc: TCrpe;
    btn_co_viagem: TSpeedButton;
    lbl_mercadoria: TLabel;
    msk_cd_mercadoria: TMaskEdit;
    edt_nm_mercadoria: TEdit;
    btn_co_mercadoria: TSpeedButton;
    lbl_transp_int: TLabel;
    msk_cd_transportador: TMaskEdit;
    edt_nm_transportador: TEdit;
    btn_co_transportador: TSpeedButton;
    lblarea: TLabel;
    msk_cd_area: TMaskEdit;
    edt_nm_area: TEdit;
    lblcontato: TLabel;
    msk_cd_contato: TMaskEdit;
    edt_nm_contato: TEdit;
    btn_co_contato: TSpeedButton;
    msk_nr_nota_fiscal: TMaskEdit;
    Label17: TLabel;
    Label18: TLabel;
    msk_nr_dta: TMaskEdit;
    Label19: TLabel;
    cb_tp_referencia: TComboBox;
    msk_nr_requerimento: TMaskEdit;
    lbl_nr_requerimento: TLabel;
    lbl_n_ato_drawback: TLabel;
    msk_nr_ato_drawback: TMaskEdit;
    pnl_manut_proc: TPanel;
    Panel1: TPanel;
    lbl_pesquisar: TLabel;
    lbl_ordem: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    btn_sair: TSpeedButton;
    btn_manut_proc: TSpeedButton;
    btn_proc_realiza: TSpeedButton;
    btn_imprimir: TSpeedButton;
    dbnvg: TDBNavigator;
    Panel2: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    Shape1: TShape;
    Shape2: TShape;
    Label20: TLabel;
    msk_nr_certificado: TMaskEdit;
    lblItemCliente: TLabel;
    mskItemCliente: TMaskEdit;
    lbl_ce_mercante: TLabel;
    msk_ce_mercante: TMaskEdit;
    pnl_consignatario: TPanel;
    Label21: TLabel;
    msk_cd_consignatario: TMaskEdit;
    edt_nm_consignatario: TEdit;
    dblkcbox_consignatario: TDBLookupComboBox;
    btn_co_consignatario: TSpeedButton;
    Shape3: TShape;
    Label22: TLabel;
    Label23: TLabel;
    mskRuc: TMaskEdit;
    mskDue: TMaskEdit;
    Label24: TLabel;
    Label109: TLabel;
    mskCDFronteira: TMaskEdit;
    edtFronteira: TEdit;
    BbtnFronteira: TSpeedButton;
    lbl_loteexp: TLabel;
    msk_lote_exp: TMaskEdit;
    btn_co_ncm: TSpeedButton;
    msk_cd_ncm: TMaskEdit;
    lblNCM: TLabel;
    cb_tp_filtro: TComboBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    msk_nr_duimp: TMaskEdit;
    msk_li_transacao: TMaskEdit;
    Label28: TLabel;
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_servicoClick(Sender: TObject);
    procedure btn_co_local_embClick(Sender: TObject);
    procedure btn_co_local_desembClick(Sender: TObject);
    procedure btn_co_pais_destClick(Sender: TObject);
    procedure btn_co_pais_origemClick(Sender: TObject);
    procedure btn_co_navioClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_pesq_procChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgctrl_pesq_procChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure HabilitaPesq(Hab : Boolean);
    procedure btn_manut_procClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure edt_chaveExit(Sender: TObject);
    procedure btn_co_transp_nacClick(Sender: TObject);
    procedure btn_co_armazem_atracacaoClick(Sender: TObject);
    procedure btn_co_armazem_descargaClick(Sender: TObject);
    procedure btn_co_agenteClick(Sender: TObject);
    procedure btn_proc_realizaClick(Sender: TObject);
    procedure dbg_lib_procDblClick(Sender: TObject);
    procedure dbg_lib_procKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure btn_co_eventoClick(Sender: TObject);
    procedure btn_co_importadorClick(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure msk_dt_fimExit(Sender: TObject);
    procedure msk_dt_inicio_aberturaExit(Sender: TObject);
    procedure msk_dt_fim_aberturaExit(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_co_viagemClick(Sender: TObject);
    procedure btn_co_mercadoriaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure msk_cd_transportadorExit(Sender: TObject);
    procedure btn_co_transportadorClick(Sender: TObject);
    procedure msk_cd_areaExit(Sender: TObject);
    procedure msk_cd_contatoExit(Sender: TObject);
    procedure btn_co_contatoClick(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_consignatarioExit(Sender: TObject);
    procedure btn_co_consignatarioClick(Sender: TObject);
    procedure dbg_lib_procDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BbtnFronteiraClick(Sender: TObject);
    procedure btn_co_ncmClick(Sender: TObject);
    procedure cb_tp_referenciaExit(Sender: TObject);

  private
    Pesquisa : String;
    a_str_indices : Array[0..2] Of String[60];
    b_str_indices : Array[0..2] Of String[60];
    SQLStrRel : String;
    flag_btn  :Integer;
    procedure GeraSqlStr;
    function Consiste : Boolean;
  public
    PesqNrProcesso : String;
    tp_relatorio : Byte;
    // 1 - Relaçao de Processos - Mod. 1
  end;

var
  frm_pesq_proc: Tfrm_pesq_proc;

implementation

uses GSMLIB,  PGSM010, PGSM014, PGSM018, PGSM019, PGSM022, PGSM036, PGSM051,
     PGSM064, PGSM088, PGSM096, PGSM103, PGSM104, PGSM119, uAg, PGSM137,
     PGSM148, PGSM210, PGSM240, PGGP001, PGGP018, PGGA003, PGSM117, PGSM184,
     PGSM185, PGSM025, PGSM212, ConsOnLineEx, uFollowUp, PGDI020;

{$R *.DFM}

procedure Tfrm_pesq_proc.btn_co_clienteClick(Sender: TObject);
const
  _CNPJ_FORMATADO = 'CASE ISNULL(CGC_EMPRESA, '''') WHEN '''' THEN '''' ELSE ' +
     'SUBSTRING(CGC_EMPRESA, 1, 2) + ''.'' + SUBSTRING(CGC_EMPRESA, 3, 3) + ''.'' + SUBSTRING(CGC_EMPRESA, 6, 3) + ''/'' + ' +
     'SUBSTRING(CGC_EMPRESA, 9, 4) + ''-'' + SUBSTRING(CGC_EMPRESA, 13, 2) END AS CGC_EMPRESA';
begin
  if Sender is TSpeedButton then
    msk_cd_cliente.Text := ConsultaOnLineEx('TEMPRESA_NAC','Cliente',['CD_EMPRESA','NM_EMPRESA', _CNPJ_FORMATADO],['Código','Descrição', 'CNPJ'],'CD_EMPRESA',frm_main.mi_cad_emp_nac)
  else
    edt_nm_cliente.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',msk_cd_cliente.Text,'NM_EMPRESA')
end;

procedure Tfrm_pesq_proc.btn_co_servicoClick(Sender: TObject);
begin
  {if Sender is TSpeedButton then
    msk_cd_servico.Text := ConsultaOnLineEx('TSERVICO','Serviços',['CD_SERVICO','NM_SERVICO'],['Código','Descrição'],'CD_SERVICO',frm_main.mi_tabela_servico)
  else
    edt_nm_servico.Text := ConsultaLookUP('TSERVICO','CD_SERVICO',msk_cd_servico.Text,'NM_SERVICO')}
  if Sender is TSpeedButton then
    msk_cd_servico.Text := ConsultaOnLineExSQL(' SELECT CONVERT(VARCHAR, CD_SERVICO) AS CD_SERVICO, NM_SERVICO ' +
                                               ' FROM TSERVICO_NOVO ' +
                                               ' UNION ALL ' +
                                               ' SELECT CD_SERVICO, NM_SERVICO ' +
                                               ' FROM TSERVICO', 'Serviços', ['CD_SERVICO','NM_SERVICO'],['Código','Descrição'],'CD_SERVICO', frm_main.mi_tabela_servico, msk_cd_servico.Text)
  else
    edt_nm_servico.Text := ConsultaLookUPSQL(' SELECT NM_SERVICO ' +
                                             ' FROM (SELECT CONVERT(VARCHAR, CD_SERVICO) AS CD_SERVICO, NM_SERVICO, 1 AS TP_SERVICO ' +
                                             '       FROM TSERVICO_NOVO ' +
                                             '       UNION ALL ' +
                                             '       SELECT CD_SERVICO, NM_SERVICO, 2 AS TP_SERVICO ' +
                                             '       FROM TSERVICO) AS S ' +
                                             ' WHERE S.CD_SERVICO = "' + msk_cd_servico.Text + '" ' +
                                             ' ORDER BY TP_SERVICO', 'NM_SERVICO')
end;

procedure Tfrm_pesq_proc.btn_co_local_embClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_local_emb.Text := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Embarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb)
  else
    edt_nm_local_emb.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',msk_cd_local_emb.Text,'DESCRICAO');
end;

procedure Tfrm_pesq_proc.btn_co_local_desembClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_local_desemb.Text := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Embarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb)
  else
    edt_nm_local_desemb.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',msk_cd_local_desemb.Text,'DESCRICAO');
end;

procedure Tfrm_pesq_proc.btn_co_pais_destClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_pais_dest.Text := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_pais)
  else
    edt_nm_pais_dest.Text := ConsultaLookUP('TPAIS','CODIGO',msk_cd_pais_dest.Text,'DESCRICAO')
end;

procedure Tfrm_pesq_proc.btn_co_pais_origemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_pais_origem.Text := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_pais)
  else
    edt_nm_pais_origem.Text := ConsultaLookUP('TPAIS','CODIGO',msk_cd_pais_origem.Text,'DESCRICAO')
end;

procedure Tfrm_pesq_proc.btn_co_navioClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_navio.Text := ConsultaOnLineEx('TEMBARCACAO','Embarcação',['CD_EMBARCACAO','NM_EMBARCACAO'],['Código','Nome'],'CD_EMBARCACAO',frm_main.mi_cad_embar)
  else
    edt_nm_navio.Text := ConsultaLookUP('TEMBARCACAO','CD_EMBARCACAO',msk_cd_navio.Text,'NM_EMBARCACAO');
end;

procedure Tfrm_pesq_proc.btn_co_unid_negClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg);
    msk_cd_unid_negExit(nil);
  End
  Else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure Tfrm_pesq_proc.btn_co_produtoClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto);
    msk_cd_produtoExit(nil);
  End
  Else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

function Tfrm_pesq_proc.Consiste : Boolean;
begin
  Consiste := True;
  with datm_pesq_proc do
  begin
    (* Unidade *)
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) = '' ) then
    begin
      ValCodEdt( msk_cd_unid_neg );
      if Not ( qry_usuario_habilitacao_.Locate('CD_UNID_NEG', Trim( msk_cd_unid_neg.Text ), [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Unidade não encontrada!', 2 );
        msk_cd_unid_neg.Text     := '';
        edt_nm_unid_neg.Text     := '';
        edt_nm_produto.Text      := '';
        Consiste                 := False;
        msk_cd_unid_neg.SetFocus;
      end
      else
      begin
        edt_nm_unid_neg.Text     := qry_usuario_habilitacao_look_nm_unid_neg.AsString;
        edt_nm_produto.Text      := '';
      end;
    end;

    (* Produto *)
    if ( Trim( msk_cd_unid_neg.Text ) = '') and ( Trim( msk_cd_produto.Text ) <> '') then
    begin
      ValCodEdt( msk_cd_produto );
      if Not ( qry_usuario_habilitacao_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Produto não encontrado!', 2 );
        msk_cd_produto.Text      := '';
        edt_nm_produto.Text      := '';
        edt_nm_unid_neg.Text     := '';
        Consiste                 := False;
        msk_cd_produto.SetFocus;
      end
      else
      begin
        edt_nm_unid_neg.Text     := '';
        edt_nm_produto.Text      := qry_usuario_habilitacao_look_nm_produto.AsString;
      end;
    end;

    (* Unidade - Produto *)
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_unid_neg );
      ValCodEdt( msk_cd_produto );
      if Not ( qry_usuario_habilitacao_.Locate( 'CD_UNID_NEG;CD_PRODUTO', VarArrayOf([ Trim( msk_cd_unid_neg.Text ), Trim( msk_cd_produto.Text ) ]), [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Unidade x Produto não encontrada, sem habilitação ou desativado!', 2 );
        msk_cd_unid_neg.Text     := '';
        edt_nm_unid_neg.Text     := '';
        msk_cd_produto.Text      := '';
        edt_nm_produto.Text      := '';
        Consiste                 := False;
        msk_cd_unid_neg.SetFocus;
      end
      else
      begin
        edt_nm_unid_neg.Text     := qry_usuario_habilitacao_look_nm_unid_neg.AsString;
        edt_nm_produto.Text      := qry_usuario_habilitacao_look_nm_produto.AsString;
      end;
    end;

    if ( Trim( msk_cd_unid_neg.Text ) = '' ) and ( Trim( msk_cd_produto.Text ) = '' ) then
    begin
      edt_nm_unid_neg.Text       := '';
      edt_nm_produto.Text        := '';
    end;

    (* Grupo *)
    if ( Trim( msk_cd_grupo.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_grupo );
      qry_grupo_.Close;
      qry_grupo_.Prepare;
      qry_grupo_.ParamByName('CD_GRUPO').AsString := Trim( msk_cd_grupo.Text );
      qry_grupo_.Open;
      if qry_grupo_.RecordCount = 0 then
      begin
        BoxMensagem( 'Grupo inexistente!', 2 );
        msk_cd_grupo.Text := '';
        edt_nm_grupo.Text := '';
        Consiste          := False;
        msk_cd_grupo.SetFocus;
      end
      else
      begin
        edt_nm_grupo.Text := qry_grupo_.FieldByName('NM_GRUPO').AsString;
      end;
    end
    else
    begin
      edt_nm_grupo.Text   := '';
    end;

    (* Cliente *)
      if ( Trim( msk_cd_cliente.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_cliente );
      qry_empresa_nac_.Close;
      qry_empresa_nac_.Prepare;
      qry_empresa_nac_.ParamByName('CD_EMPRESA').AsString := Trim( msk_cd_cliente.Text );
      qry_empresa_nac_.Open;
      if qry_empresa_nac_.RecordCount = 0 then
      Begin
        BoxMensagem( 'Cliente inexistente!', 2 );             //FERNANDA PESQUISANDO POR CLIENTES INATIVOS 05/01/12
        msk_cd_cliente.Text      := '';
        edt_nm_cliente.Text      := '';
        Consiste                 := False;
        msk_cd_cliente.SetFocus;
      end
      else
         // Retirada a verificação para impedir a pesquisa de clientes inativos (comentários abaixo)
         //         Eric 17/05/2012 - Ocorr: 04640/12

        //if qry_empresa_nac_.FieldByName('in_ativo').AsString='1' then
        //begin
          edt_nm_cliente.Text      := qry_empresa_nac_.FieldByName('NM_EMPRESA').AsString;
          (* Cliente X Habilitação *)
          qry_cliente_habilitacao_.Close;
          qry_cliente_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
          qry_cliente_habilitacao_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
          qry_cliente_habilitacao_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
          qry_cliente_habilitacao_.Prepare;
          qry_cliente_habilitacao_.Open;
        {end
         else
        begin                                             //FERNANDA PESQUISANDO POR CLIENTES INATIVOS 05/01/12
          BoxMensagem( 'Cliente Inativo!', 2 );
         msk_cd_grupo.Text         := '';
          edt_nm_grupo.Text           := '';
          Consiste                 := False;
          msk_cd_grupo.SetFocus;
        end}

        // Fim das linhas comentadas.      Eric   17/05/2012   Ocorr: 04640/12
      end;

    (* Importador - Importação *)
    if ( Trim( msk_cd_importador.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) = '01' ) then
    begin
      ValCodEdt( msk_cd_importador );
      qry_empresa_nac_.Close;
      qry_empresa_nac_.Prepare;
      qry_empresa_nac_.ParamByName('CD_EMPRESA').AsString := Trim( msk_cd_importador.Text );
      qry_empresa_nac_.Open;
      if qry_empresa_nac_.RecordCount = 0 then
      begin
        BoxMensagem( 'Importador inexistente!', 2 );
        msk_cd_importador.Text := '';
        edt_nm_importador.Text := '';
        Consiste          := False;
        msk_cd_importador.SetFocus;
      end
      else

     begin
        edt_nm_importador.Text := qry_empresa_nac_.FieldByName('NM_EMPRESA').AsString;
      end;
    end
    else
    begin
      if Trim( msk_cd_produto.Text ) = '01' then
         edt_nm_importador.Text   := '';
    end;

    (* Importador - Exportação *)
    if ( Trim( msk_cd_importador.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) = '02' ) then
    begin
      ValCodEdt( msk_cd_importador );
      qry_empresa_est_.Close;
      qry_empresa_est_.Prepare;
      qry_empresa_est_.ParamByName('CD_EMPRESA').AsString := Trim( msk_cd_importador.Text );
      qry_empresa_est_.Open;
      if qry_empresa_est_.RecordCount = 0 then
      begin
        BoxMensagem( 'Importador inexistente!', 2 );
        msk_cd_importador.Text := '';
        edt_nm_importador.Text := '';
        Consiste          := False;
        msk_cd_importador.SetFocus;
      end
      else
      begin
        edt_nm_importador.Text := qry_empresa_est_.FieldByName('NM_EMPRESA').AsString;
      end;
    end
    else
    begin
      if Trim( msk_cd_produto.Text ) = '02' then
         edt_nm_importador.Text   := '';
    end;

    (* Exportador - Importação *)
    if ( Trim( msk_cd_exportador.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) = '01' ) then
    begin
      ValCodEdt( msk_cd_exportador );
      qry_empresa_est_.Close;
      qry_empresa_est_.Prepare;
      qry_empresa_est_.ParamByName('CD_EMPRESA').AsString := Trim( msk_cd_exportador.Text );
      qry_empresa_est_.Open;
      if qry_empresa_est_.RecordCount = 0 then
      begin
        BoxMensagem( 'Exportador inexistente!', 2 );
        msk_cd_exportador.Text := '';
        edt_nm_exportador.Text := '';
        Consiste          := False;
        msk_cd_exportador.SetFocus;
      end
      else
      begin
        edt_nm_exportador.Text := qry_empresa_est_.FieldByName('NM_EMPRESA').AsString;
      end;
    end
    else
    begin
      if Trim( msk_cd_produto.Text ) = '01' then
         edt_nm_exportador.Text   := '';
    end;

    (* Exportador - Exportação *)
    if ( Trim( msk_cd_exportador.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) = '02' ) then
    begin
      ValCodEdt( msk_cd_exportador );
      qry_empresa_nac_.Close;
      qry_empresa_nac_.Prepare;
      qry_empresa_nac_.ParamByName('CD_EMPRESA').AsString := Trim( msk_cd_exportador.Text );
      qry_empresa_nac_.Open;
      if qry_empresa_nac_.RecordCount = 0 then
      begin
        BoxMensagem( 'Exportador inexistente!', 2 );
        msk_cd_exportador.Text := '';
        edt_nm_exportador.Text := '';
        Consiste          := False;
        msk_cd_exportador.SetFocus;
      end
      else
      begin
        edt_nm_exportador.Text := qry_empresa_nac_.FieldByName('NM_EMPRESA').AsString;
      end;
    end
    else
    begin
      if Trim( msk_cd_produto.Text ) = '02' then
         edt_nm_exportador.Text   := '';
    end;

    (* Serviço *)
    if ( Trim( msk_cd_servico.Text ) <> '' ) then
    begin
      //ValCodEdt( msk_cd_servico ); // Comentado porque pode ser serviço novo, como 1, 2, 3, ... - Michel - 04/09/2012
      qry_servico_.Close;
      qry_servico_.Prepare;
      qry_servico_.ParamByName('CD_SERVICO').AsString := Trim( msk_cd_servico.Text );
      qry_servico_.Open;
      if qry_servico_.RecordCount = 0 then
      begin
        BoxMensagem( 'Serviço inexistente!', 2 );
        msk_cd_servico.Text      := '';
        edt_nm_servico.Text      := '';
        Consiste                 := False;
        msk_cd_servico.SetFocus;
      end
      else
      begin
        edt_nm_servico.Text      := qry_servico_.FieldByName('NM_SERVICO').AsString;

        (* Cliente X Serviço *)
        if (Trim( msk_cd_cliente.Text ) <> '') and (Trim(msk_cd_unid_neg.Text) <> '') and
           (Trim(msk_cd_produto.Text) <> '')   and (Trim(msk_cd_servico.Text) <> '') then
        begin
          qry_cliente_servico_.Close;
          qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
          qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
          qry_cliente_servico_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
          qry_cliente_servico_.ParamByName('CD_SERVICO').AsString  := msk_cd_servico.Text;
          qry_cliente_servico_.Prepare;
          qry_cliente_servico_.Open;
          if qry_cliente_servico_.RecordCount = 0 then
          begin
            BoxMensagem( 'Cliente X Serviço inexistente!', 2 );
            Consiste := False;
            msk_cd_servico.SetFocus;
          end;
        end;
      end;
    end
    else
    begin
      edt_nm_servico.Text        := '';
    end;

    (* Transportadora *)
    if ( Trim( msk_cd_transp_nac.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_transp_nac );
      qry_transp_rod_.Close;
      qry_transp_rod_.Prepare;
      qry_transp_rod_.ParamByName('CD_TRANSP_ROD').AsString := Trim( msk_cd_transp_nac.Text );
      qry_transp_rod_.Open;
      if qry_transp_rod_.RecordCount = 0 then
      begin
        BoxMensagem( 'Transportador inexistente!', 2 );
        msk_cd_transp_nac.Text := '';
        edt_nm_transp_nac.Text := '';
        Consiste               := False;
        msk_cd_transp_nac.SetFocus;
      end
      else
      begin
        edt_nm_transp_nac.Text := qry_transp_rod_.FieldByName('NM_TRANSP_ROD').AsString;
      end;
    end
    else
    begin
      edt_nm_transp_nac.Text   := '';
    end;

    (* Area *)
    if ( Trim( msk_cd_area.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_area );
      qry_area_.Close;
      qry_area_.Prepare;
      qry_area_.ParamByName('CD_AREA').AsString := Trim( msk_cd_area.Text );
      qry_area_.Open;
      if qry_area_.RecordCount = 0 then
      begin
        BoxMensagem( 'Área Inexistente! Favor digitar uma área válida', 2 );
        msk_cd_area.Text        := '';
        edt_nm_area.Text        := '';
        Consiste                 := False;
        msk_cd_area.SetFocus;
      end
      else
      begin
        edt_nm_area.Text        := qry_area_.FieldByName('NM_AREA').AsString;
      end;
    end
    else
    begin
      edt_nm_area.Text          := '';
    end;

    (* Contato *)
    if ( Trim( msk_cd_contato.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_contato );
      qry_cliente_contato_.Close;
      qry_cliente_contato_.ParamByName('CD_CONTATO').AsString := Trim( msk_cd_contato.Text );
      qry_cliente_contato_.ParamByName('CD_CLIENTE').AsString := Trim( msk_cd_cliente.Text );
      qry_cliente_contato_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
      qry_cliente_contato_.ParamByName('CD_PRODUTO').AsString := Trim( msk_cd_produto.Text );
      qry_cliente_contato_.Prepare;
      qry_cliente_contato_.Open;
      if qry_cliente_contato_.RecordCount = 0 then
      begin
        BoxMensagem( 'Contato Inexistente!Favor digitar um contato válido', 2 );
        msk_cd_contato.Text        := '';
        edt_nm_contato.Text        := '';
        Consiste                 := False;
        msk_cd_contato.SetFocus;
      end
      else
      begin
        edt_nm_contato.Text        := qry_cliente_contato_.FieldByName('NM_CONTATO').AsString;
      end;
    end
    else
    begin
      edt_nm_contato.Text          := '';
    end;

    (* Embarcação *)
    if ( Trim( msk_cd_navio.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_navio );
      qry_embarc_.Close;
      qry_embarc_.Prepare;
      qry_embarc_.ParamByName('CD_EMBARCACAO').AsString := Trim( msk_cd_navio.Text );
      qry_embarc_.Open;
      if qry_embarc_.RecordCount = 0 then
      begin
        BoxMensagem( 'Embarcação inexistente!', 2 );
        msk_cd_navio.Text        := '';
        edt_nm_navio.Text        := '';
        Consiste                 := False;
        msk_cd_navio.SetFocus;
      end
      else
      begin
        edt_nm_navio.Text        := qry_embarc_.FieldByName('NM_EMBARCACAO').AsString;
      end;
    end
    else
    begin
      edt_nm_navio.Text          := '';
    end;

    (* Viagem *)
    if Trim( msk_nr_viagem.Text ) <> '' then
    begin
      qry_viagem_.Close;

      //Verifica sempre se a unidade é 07. Caso o seja, modifica para '01' (Não no Edit, mas somente o parâmetro da query, para fins de consulta). Eric 23/07/2012 17:13h
      If Trim(msk_cd_unid_neg.Text) = '07' Then
        qry_viagem_.ParamByName('CD_UNID_NEG').AsString   := '01'
      else
        qry_viagem_.ParamByName('CD_UNID_NEG').AsString   := msk_cd_unid_neg.Text;

      qry_viagem_.ParamByName('CD_PRODUTO').AsString    := msk_cd_produto.Text;
      qry_viagem_.ParamByName('CD_EMBARCACAO').AsString := msk_cd_navio.Text;
      qry_viagem_.ParamByName('NR_VIAGEM').AsString     := msk_nr_viagem.Text;
      qry_viagem_.Prepare;
      qry_viagem_.Open;
      if qry_viagem_.RecordCount = 0 then
      begin
        BoxMensagem( 'Nº da Viagem inválido!', 2 );
        pgctrl_pesq_proc.ActivePage := ts_filtros;
        Consiste                    := False;
        msk_nr_viagem.SetFocus;
        Exit;
      end;
      qry_viagem_.Close;
    end;

    (* Local de Embarque *)
    if ( Trim( msk_cd_local_emb.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_local_emb );
      qry_local_emb_.Close;
      qry_local_emb_.Prepare;
      qry_local_emb_.ParamByName('CD_LOCAL').AsString := Trim( msk_cd_local_emb.Text );
      qry_local_emb_.Open;
      if qry_local_emb_.RecordCount = 0 then
      begin
        BoxMensagem( 'Local de embarque inexistente!', 2 );
        msk_cd_local_emb.Text    := '';
        edt_nm_local_emb.Text    := '';
        Consiste                 := False;
        msk_cd_local_emb.SetFocus;
      end
      else
      begin
        edt_nm_local_emb.Text    := qry_local_emb_.FieldByName('DESCRICAO').AsString;
      end;
    end
    else
    begin
      edt_nm_local_emb.Text      := '';
    end;

    (* Local de Desembarque *)
    if ( Trim( msk_cd_local_desemb.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_local_desemb );
      qry_local_emb_.Close;
      qry_local_emb_.Prepare;
      qry_local_emb_.ParamByName('CD_LOCAL').AsString := Trim( msk_cd_local_desemb.Text );
      qry_local_emb_.Open;
      if qry_local_emb_.RecordCount = 0 then
      begin
        BoxMensagem( 'Local de desembarque inexistente!', 2 );
        msk_cd_local_desemb.Text := '';
        edt_nm_local_desemb.Text := '';
        Consiste                 := False;
        msk_cd_local_desemb.SetFocus;
      end
      else
      begin
        edt_nm_local_desemb.Text := qry_local_emb_.FieldByName('DESCRICAO').AsString;
      end;
    end
    else
    begin
      edt_nm_local_desemb.Text   := '';
    end;

    (* País Destino *)
    if ( Trim( msk_cd_pais_dest.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_pais_dest );
      qry_pais_.Close;
      qry_pais_.Prepare;
      qry_pais_.ParamByName('CD_PAIS').AsString := Trim( msk_cd_pais_dest.Text );
      qry_pais_.Open;
      if qry_pais_.RecordCount = 0 then
      begin
        BoxMensagem( 'País de Destino inexistente!', 2 );
        msk_cd_pais_dest.Text    := '';
        edt_nm_pais_dest.Text    := '';
        Consiste                 := False;
        msk_cd_pais_dest.SetFocus;
      end
      else
      begin
        edt_nm_pais_dest.Text    := qry_pais_.FieldByName('NM_PAIS').AsString;
      end;
    end
    else
    begin
      edt_nm_pais_dest.Text      := '';
    end;

    (* País de Origem *)
    if ( Trim( msk_cd_pais_origem.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_pais_origem );
      qry_pais_.Close;
      qry_pais_.Prepare;
      qry_pais_.ParamByName('CD_PAIS').AsString := Trim( msk_cd_pais_origem.Text );
      qry_pais_.Open;
      if qry_pais_.RecordCount = 0 then
      begin
        BoxMensagem( 'País de Origem inexistente!', 2 );
        msk_cd_pais_origem.Text  := '';
        edt_nm_pais_origem.Text  := '';
        Consiste                 := False;
        msk_cd_pais_origem.SetFocus;
      end
      else
      begin
        edt_nm_pais_origem.Text  := qry_pais_.FieldByName('NM_PAIS').AsString;
      end;
    end
    else
    begin
      edt_nm_pais_origem.Text    := '';
    end;

    (* Armazém de Atracação *)
    if ( Trim( msk_cd_armazem_atracacao.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_armazem_atracacao );
      qry_amz_.Close;
      qry_amz_.Prepare;
      qry_amz_.ParamByName('CD_ARMAZEM').AsString := Trim( msk_cd_armazem_atracacao.Text );
      qry_amz_.Open;
      if qry_amz_.RecordCount = 0 then
      begin
        BoxMensagem( 'Armazém de Atracação inexistente!', 2 );
        msk_cd_armazem_atracacao.Text := '';
        edt_nm_armazem_atracacao.Text := '';
        Consiste                      := False;
        msk_cd_armazem_atracacao.SetFocus;
      end
      else
      begin
        edt_nm_armazem_atracacao.Text := qry_amz_.FieldByName('NM_ARMAZEM').AsString;
      end;
    end
    else
    begin
      edt_nm_armazem_atracacao.Text   := '';
    end;

    (* Armazém de Descarga *)
    if ( Trim( msk_cd_armazem_descarga.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_armazem_descarga );
      qry_amz_.Close;
      qry_amz_.Prepare;
      qry_amz_.ParamByName('CD_ARMAZEM').AsString := Trim( msk_cd_armazem_descarga.Text );
      qry_amz_.Open;
      if qry_amz_.RecordCount = 0 then
      begin
        BoxMensagem( 'Armazém de Descarga inexistente!', 2 );
        msk_cd_armazem_descarga.Text := '';
        edt_nm_armazem_descarga.Text := '';
        Consiste                     := False;
        msk_cd_armazem_descarga.SetFocus;
      end
      else
      begin
        edt_nm_armazem_descarga.Text := qry_amz_.FieldByName('NM_ARMAZEM').AsString;
      end;
    end
    else
    begin
      edt_nm_armazem_descarga.Text   := '';
    end;

    (* Agente *)
    if ( Trim( msk_cd_agente.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_agente );
      qry_agente_.Close;
      qry_agente_.Prepare;
      qry_agente_.ParamByName('CD_AGENTE').AsString := Trim( msk_cd_agente.Text );
      qry_agente_.Open;
      if qry_agente_.RecordCount = 0 then
      begin
        BoxMensagem( 'Agente inexistente!', 2 );
        msk_cd_agente.Text := '';
        edt_nm_agente.Text := '';
        Consiste           := False;
        msk_cd_agente.SetFocus;
      end
      else
      begin
        edt_nm_agente.Text := qry_agente_.FieldByName('NM_AGENTE').AsString;
      end;
    end
    else
    begin
      edt_nm_agente.Text   := '';
    end;

    (* Transportador *)
    if ( Trim( msk_cd_transportador.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_transportador );
      qry_transportador_.Close;
      qry_transportador_.Prepare;
      qry_transportador_.ParamByName('CD_TRANSPORTADOR').AsString := Trim( msk_cd_transportador.Text );
      qry_transportador_.Open;
      if qry_transportador_.RecordCount = 0 then
      begin
        BoxMensagem( 'Transportador Internacional inexistente!', 2 );
        msk_cd_transportador.Text := '';
        edt_nm_transportador.Text := '';
        Consiste           := False;
        msk_cd_transportador.SetFocus;
      end
      else
      begin
        edt_nm_transportador.Text := qry_transportador_.FieldByName('DESCRICAO').AsString;
      end;
    end
    else
    begin
      edt_nm_transportador.Text   := '';
    end;

    (* Requerimento *)
    if ( Trim( msk_nr_requerimento.Text ) <> '' ) then
    begin
      qry_requerimento_.Close;
      qry_requerimento_.Prepare;
      qry_requerimento_.ParamByName('NR_REQUERIMENTO').AsString := Trim( msk_nr_requerimento.Text );
      qry_requerimento_.Open;

      if qry_requerimento_.RecordCount = 0 then
      begin
        BoxMensagem( 'Requerimento inexistente!', 2 );
        msk_nr_requerimento.Text := '';
        Consiste           := False;
        msk_nr_requerimento.SetFocus;
      end;
    end;

    (* Mercadoria *)
    if Trim( msk_cd_mercadoria.Text ) <> '' then
    begin
      if msk_cd_produto.Text = '01' then
      begin
        qry_mercadoria_.Close;
        qry_mercadoria_.Prepare;
        qry_mercadoria_.ParamByName('CD_MERCADORIA').AsString := Trim( msk_cd_mercadoria.Text );
        qry_mercadoria_.Open;
        if qry_mercadoria_.RecordCount = 0 then
        begin
          BoxMensagem( 'Mercadoria Inexistente!', 2);
          msk_cd_mercadoria.Text := '';
          edt_nm_mercadoria.Text := '';
          Consiste               := False;
          msk_cd_mercadoria.SetFocus;
        end
        else
        begin
          edt_nm_mercadoria.Text := qry_mercadoria_.FieldByName('AP_MERCADORIA').AsString;
        end;
      end
      else
      begin
        qry_mercadoria_exp_.Close;
        qry_mercadoria_exp_.Prepare;
        qry_mercadoria_exp_.ParamByName('CD_MERCADORIA').AsString := Trim( msk_cd_mercadoria.Text );
        qry_mercadoria_exp_.Open;
        if qry_mercadoria_exp_.RecordCount = 0 then
        begin
          BoxMensagem( 'Mercadoria Exportação Inexistente!', 2);
          msk_cd_mercadoria.Text := '';
          edt_nm_mercadoria.Text := '';
          Consiste               := False;
          msk_cd_mercadoria.SetFocus;
        end
        else
        begin
          edt_nm_mercadoria.Text := qry_mercadoria_exp_.FieldByName('AP_MERCADORIA').AsString;
        end;
      end;
    end
    else
    begin
      edt_nm_mercadoria.Text := '';
    end;

    (* Evento *)
    if ( Trim( msk_cd_evento.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_evento );
      qry_evento_.Close;
      qry_evento_.Prepare;
      qry_evento_.ParamByName('CD_EVENTO').AsString := Trim( msk_cd_evento.Text );
      qry_evento_.Open;
      if qry_evento_.RecordCount = 0 then
      begin
        BoxMensagem( 'Evento inexistente!', 2 );
        msk_cd_evento.Text := '';
        edt_nm_evento.Text := '';
        Consiste           := False;
        msk_cd_evento.SetFocus;
      end
      else
      begin
        edt_nm_evento.Text := qry_evento_.FieldByName('NM_EVENTO').AsString;
      end;
    end
    else
    begin
      edt_nm_evento.Text   := '';
    end;

    (* Consignatario *)
    if ( Trim( msk_cd_consignatario.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_consignatario );

      qry_empresa_est_.Close;
      qry_empresa_est_.Prepare;
      qry_empresa_est_.ParamByName('CD_EMPRESA').AsString := Trim( msk_cd_consignatario.Text );
      qry_empresa_est_.Open;

      if qry_empresa_est_.RecordCount = 0 then
      begin
        BoxMensagem( 'Consignatario inexistente!', 2 );
        msk_cd_consignatario.Text := '';
        edt_nm_consignatario.Text := '';
        Consiste                  := False;
        msk_cd_grupo.SetFocus;
      end
      else
      begin
        edt_nm_consignatario.Text := qry_empresa_est_.FieldByName('NM_EMPRESA').AsString;
      end;
    end
    else
    begin
      edt_nm_consignatario.Text   := '';
    end;


  end;


end;

procedure Tfrm_pesq_proc.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_pesq_proc, datm_pesq_proc );
  with datm_pesq_proc do
  begin
    // traz as habilitacoes para o usuario
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
    qry_usuario_habilitacao_.Prepare;
    qry_usuario_habilitacao_.Open;

    // abre queries
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_tp_referencia_.Close;
    qry_tp_referencia_.Prepare;
    qry_tp_referencia_.Open;

    cb_tp_referencia.Clear;
    qry_tp_referencia_.First;
    While Not qry_tp_referencia_.EOF Do
    Begin
      cb_tp_referencia.Items.Add( Trim( qry_tp_referencia_NM_REFERENCIA.AsString ) ) ;
      qry_tp_referencia_.Next;
    End;

    qry_tp_canal_.Close;
    qry_tp_canal_.Prepare;
    qry_tp_canal_.Open;

    qry_tp_lead_time_.Close;
    qry_tp_lead_time_.Prepare;
    qry_tp_lead_time_.Open;

    // Atualiza tela
    msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_produto.Text  := str_cd_produto;
    Consiste;

    a_str_indices[0] := 'P.NR_PROCESSO';
    a_str_indices[1] := 'E.AP_EMPRESA, P.NR_PROCESSO';
    a_str_indices[2] := 'S.NM_SERVICO, P.NR_PROCESSO';

    b_str_indices[0] := 'NR_PROCESSO';
    b_str_indices[1] := 'AP_EMPRESA';
    b_str_indices[2] := 'NM_SERVICO';

    With cb_ordem Do
    Begin
      Clear;
      Items.Add('Nº Processo');
      Items.Add('Cliente');
      Items.Add('Serviço');
      ItemIndex := 0;
    End;
  end;
end;

procedure Tfrm_pesq_proc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  crp_proc.Free;
  With datm_pesq_proc Do
  Begin
    qry_cliente_habilitacao_.Close;
    qry_cliente_servico_.Close;
    qry_usuario_habilitacao_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_empresa_nac_.Close;
    qry_grupo_.Close;
    qry_servico_.Close;
    qry_pais_.Close;
    qry_embarc_.Close;
    qry_local_emb_.Close;
    qry_transp_rod_.Close;
    qry_transportador_.Close;
    qry_amz_.Close;
    qry_agente_.Close;
    qry_evento_.Close;
    qry_tp_canal_.Close;
    qry_tp_referencia_.Close;
    Free;
  End;

  if flag_btn=0 then
    str_cd_rotina_atalho := ''; //by carlos 07/06/2010
  Tag    := 0;
  Action := caFree;
end;

procedure Tfrm_pesq_proc.pgctrl_pesq_procChange(Sender: TObject);
begin
  frm_pesq_proc.VertScrollBar.Position := 0;
  If pgctrl_pesq_proc.Activepage = ts_lista Then
  Begin
    GeraSqlStr;
    HabilitaPesq(True);
    if datm_pesq_proc.qry_pesq_.RecordCount = 0 then
    begin
      btn_manut_proc.Enabled   := False;
      mi_manut_proc.Enabled    := False;
      btn_proc_realiza.Enabled := False;
      mi_proc_realiza.Enabled  := False;
    End;
  End Else
    HabilitaPesq(False);
end;

procedure Tfrm_pesq_proc.GeraSqlStr;
var
  sqlstr, Campos, CamposRel : String;

begin
  sqlstr := '';
  Campos    := 'SELECT P.NR_PROCESSO, P.CD_UNID_NEG, U.NM_UNID_NEG, P.CD_PRODUTO, PR.NM_PRODUTO, P.CD_CLIENTE, E.AP_EMPRESA, P.CD_SERVICO, ISNULL(SN.NM_SERVICO, S.NM_SERVICO) AS NM_SERVICO, P.IN_CANCELADO ';
  CamposRel := 'SELECT P.NR_PROCESSO ';
  sqlstr := sqlstr + 'FROM TPROCESSO P (NOLOCK), TEMPRESA_NAC E (NOLOCK), TSERVICO S (NOLOCK), TUNID_NEG U (NOLOCK), TPRODUTO PR (NOLOCK), TSERVICO_NOVO SN (NOLOCK) ';

  if ( Trim( msk_cd_produto.Text ) <> '' ) and (( Trim( msk_cd_mercadoria.Text ) <> '' ) or ( Trim( msk_cd_ncm.Text ) <> '' )) then
  begin
    if ( msk_cd_produto.Text = '01' ) or ( msk_cd_produto.Text = '03' ) then
      sqlstr := sqlstr + ', TDETALHE_MERCADORIA M (NOLOCK) '
    else if ( msk_cd_produto.Text = '02' ) or ( msk_cd_produto.Text = '10' ) then
      sqlstr := sqlstr + ', TPROCESSO_EXP_ITEM M (NOLOCK) ';
  end;

  if ( Trim( msk_nr_ato_drawback.Text ) <> '' ) then
    sqlstr := sqlstr + ', TADICAO_DE_IMPORTACAO A (NOLOCK) ';

  sqlstr := sqlstr + ' WHERE P.CD_UNID_NEG  = U.CD_UNID_NEG AND ' +
                     '       P.CD_PRODUTO   = PR.CD_PRODUTO AND ' +
                     '       P.CD_CLIENTE   = E.CD_EMPRESA  AND ' +
                     '       P.CD_SERVICO  *= S.CD_SERVICO  AND ' +
                     '       P.CD_SERVICO  *= CONVERT(VARCHAR, SN.CD_SERVICO) AND ' +
//                     '       P.IN_CANCELADO = ''0''         AND ' +  by carlos 21/06/2011 (ocorrencia: 0001184411 )
                     '     ( P.CD_UNID_NEG + P.CD_PRODUTO ) IN  ' +
                     '     ( SELECT CD_UNID_NEG + CD_PRODUTO    ' +
                     '         FROM TUSUARIO_HABILITACAO        ' +
                     '        WHERE CD_USUARIO = "' + str_cd_usuario + '" ' +
                     '          AND IN_ATIVO = "1" ) ';

  if ( Trim( msk_cd_unid_neg.Text ) <> '' ) then

  sqlstr := sqlstr + ' AND P.CD_UNID_NEG = "' + Trim( msk_cd_unid_neg.Text ) + '" ';

  if ( Trim( msk_cd_produto.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_PRODUTO = "' + Trim( msk_cd_produto.Text ) + '" ';

  if ( Trim( msk_cd_grupo.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND E.CD_GRUPO = "' + Trim( msk_cd_grupo.Text ) + '" ';

  if ( Trim( msk_cd_cliente.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_CLIENTE = "' + Trim( msk_cd_cliente.Text ) + '" ';

  if ( Trim( msk_cd_importador.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_IMPORTADOR = "' + Trim( msk_cd_importador.Text ) + '" ';

  if ( Trim( msk_cd_exportador.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_EXPORTADOR = "' + Trim( msk_cd_exportador.Text ) + '" ';

  if ( Trim( msk_cd_servico.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_SERVICO = "' +  Trim( msk_cd_servico.Text ) + '" ';

  if ( Trim( msk_cd_transp_nac.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_TRANSP_NAC = "' +  Trim( msk_cd_transp_nac.Text ) + '" ';

  if ( Trim( msk_cd_navio.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND ( ( P.CD_EMBARCACAO = "' + Trim( msk_cd_navio.Text ) + '" AND P.IN_BALDEACAO IS NULL ) OR     ' +
   ' ( P.CD_EMBARCACAO = "' + Trim( msk_cd_navio.Text ) + '" AND P.IN_BALDEACAO != ''1'' ) OR ( P.CD_EMBARCACAO_BALDEACAO = "' + Trim( msk_cd_navio.Text ) + '" AND P.IN_BALDEACAO =''1'' )) ';

  if ( Trim( msk_cd_local_emb.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_LOCAL_EMBARQUE = "' + Trim( msk_cd_local_emb.Text ) + '" ';

  if ( Trim( mskCDFronteira.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_FRONTEIRA = "' + Trim( mskCDFronteira.Text ) + '" ';

  if ( Trim( msk_cd_local_desemb.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_LOCAL_DESEMBARQUE = "' + Trim( msk_cd_local_desemb.Text ) + '" ';

  if ( Trim( msk_cd_pais_dest.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_PAIS_DESTINO = "' + Trim( msk_cd_pais_dest.Text ) + '" ';

  if ( Trim( msk_cd_pais_origem.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_PAIS_ORIGEM = "' + Trim( msk_cd_pais_origem.Text ) + '" ';

  if ( Trim( msk_cd_armazem_atracacao.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_ARMAZEM_ATRACACAO = "' + Trim( msk_cd_armazem_atracacao.Text ) + '" ';

  if ( Trim( msk_cd_armazem_descarga.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_ARMAZEM_DESCARGA = "' + Trim( msk_cd_armazem_descarga.Text ) + '" ';

  if ( Trim( msk_cd_agente.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_AGENTE = "' + Trim( msk_cd_agente.Text ) + '" ';

  if ( Trim( msk_cd_produto.Text ) <> '' ) AND( Trim( msk_cd_mercadoria.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.NR_PROCESSO = M.NR_PROCESSO AND M.CD_MERCADORIA = "' + Trim( msk_cd_mercadoria.Text ) + '" ';

  if ( Trim( msk_cd_produto.Text ) <> '' ) and ( Trim( msk_cd_ncm.Text ) <> '' ) then
  begin
    if ( msk_cd_produto.Text = '01' ) or ( msk_cd_produto.Text = '03' ) then
      sqlstr := sqlstr + ' AND P.NR_PROCESSO = M.NR_PROCESSO AND M.CD_NCM_SH = "' + Trim( msk_cd_ncm.Text ) + '" '
    else if ( msk_cd_produto.Text = '02' ) or ( msk_cd_produto.Text = '10' ) then
      sqlstr := sqlstr + ' AND P.NR_PROCESSO = M.NR_PROCESSO AND M.CD_NCM = "' + Trim( msk_cd_ncm.Text ) + '" ';
  end;

  if ( Trim( msk_cd_contato.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_CONTATO = "' +  Trim( msk_cd_contato.Text ) + '" ';

  if ( Trim( msk_cd_area.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_AREA = "' +  Trim( msk_cd_area.Text ) + '" ';

  if ( Trim( msk_cd_transportador.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_TRANSPORTADOR = "' +  Trim( msk_cd_transportador.Text ) + '" ';

  if ( msk_dt_inicio_abertura.Text <> '  /  /    ' ) and ( msk_dt_fim_abertura.Text <> '  /  /    ' ) then
    sqlstr := sqlstr + ' AND P.DT_ABERTURA BETWEEN CONVERT( datetime, "' + msk_dt_inicio_abertura.Text + ' 00:00' + '", 103 ) AND CONVERT( datetime, "' + msk_dt_fim_abertura.Text +' 23:59' + '", 103 ) ';

  if ( Trim( msk_cd_evento.Text ) <> '' ) then
  begin
    sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT FL.NR_PROCESSO FROM TFOLLOWUP FL (NOLOCK) WHERE P.NR_PROCESSO = FL.NR_PROCESSO AND FL.CD_EVENTO = "' + Trim( msk_cd_evento.Text) + '" ';
    if ( msk_dt_inicio.Text <> '  /  /    ' ) and ( msk_dt_fim.Text <> '  /  /    ' ) then
      sqlstr := sqlstr + ' AND FL.DT_REALIZACAO BETWEEN CONVERT( datetime, "' + msk_dt_inicio.Text +' 00:00' + '", 103 ) AND CONVERT( datetime, "' + msk_dt_fim.Text + ' 23:59'+ '", 103 ) ';
    sqlstr := sqlstr + ')';
  end;

  if ( Trim( msk_nr_viagem.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND ( (P.NR_VIAGEM = "' + Trim( msk_nr_viagem.Text ) + '" AND P.IN_BALDEACAO != ''1'' ) OR ' +
    ' (P.NR_VIAGEM = "' + Trim( msk_nr_viagem.Text ) + '" AND P.IN_BALDEACAO IS NULL ) OR  ( P.NR_VIAGEM_BALDEACAO = "' + Trim( msk_nr_viagem.Text ) + '" AND P.IN_BALDEACAO = ''1'' ) )';

  if ( Trim( msk_nr_voo.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.NR_VOO = "' + Trim( msk_nr_voo.Text ) + '" ';

  if ( Trim( msk_nr_di.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.NR_DI = "' + Trim( msk_nr_di.Text ) + '" ';


  if ( Trim( msk_nr_duimp.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_DUIMP = "' + Trim( msk_nr_duimp.Text ) + '" ';


  if ( Trim( msk_nr_li.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT PLI.NR_PROCESSO FROM TPROCESSO_LI PLI (NOLOCK) WHERE P.NR_PROCESSO = PLI.NR_PROCESSO AND PLI.NR_LI = "' + Trim( msk_nr_li.Text ) + '" )';


  if ( Trim( msk_li_transacao.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT PLI.NR_PROCESSO FROM TPROCESSO_LI PLI (NOLOCK) WHERE P.NR_PROCESSO = PLI.NR_PROCESSO AND PLI.NR_TRANSACAO_GRU LIKE "%' + Trim( msk_li_transacao.Text ) + '%" )';



  // Referência
  if (cb_tp_referencia.ItemIndex + 1) > 9 then
  begin
    if ( Trim( msk_cd_ref.Text ) <> '' ) and ( Trim( mskItemCliente.Text ) <> '' ) then
      sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT RC.NR_PROCESSO FROM TREF_CLIENTE RC (NOLOCK) WHERE P.NR_PROCESSO = RC.NR_PROCESSO AND RC.CD_REFERENCIA = "' + Trim( msk_cd_ref.Text ) + '" AND RC.NR_ITEM_PO = "' + Trim( mskItemCliente.Text ) + '" AND TP_REFERENCIA = "' + IntToStr(cb_tp_referencia.ItemIndex + 1) + '" )'
    else
      if ( Trim( msk_cd_ref.Text ) <> '' ) then
        sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT RC.NR_PROCESSO FROM TREF_CLIENTE RC (NOLOCK) WHERE P.NR_PROCESSO = RC.NR_PROCESSO AND RC.CD_REFERENCIA = "' + Trim( msk_cd_ref.Text ) + '" AND TP_REFERENCIA = "' + IntToStr(cb_tp_referencia.ItemIndex + 1) + '" )';
  end
  else
  begin
    if ( cb_tp_filtro.ItemIndex = 1 ) then
    begin
      if ( Trim( msk_cd_ref.Text ) <> '' ) and ( Trim( mskItemCliente.Text ) <> '' ) then
        sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT RC.NR_PROCESSO FROM TREF_CLIENTE RC (NOLOCK) WHERE P.NR_PROCESSO = RC.NR_PROCESSO AND RC.CD_REFERENCIA LIKE "' + Copy(Trim( msk_cd_ref.Text ), 0, 10) + '%" AND RC.NR_ITEM_PO = "' + Trim( mskItemCliente.Text ) + '" AND TP_REFERENCIA = "' + '0'+IntToStr(cb_tp_referencia.ItemIndex + 1) + '" )'
      else
        if ( Trim( msk_cd_ref.Text ) <> '' ) then
          sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT RC.NR_PROCESSO FROM TREF_CLIENTE RC (NOLOCK) WHERE P.NR_PROCESSO = RC.NR_PROCESSO AND RC.CD_REFERENCIA LIKE "' + Copy(Trim( msk_cd_ref.Text ), 0, 10) + '%" AND TP_REFERENCIA = "' + '0'+IntToStr(cb_tp_referencia.ItemIndex + 1) + '" )';
    end
    else
    begin
      if ( Trim( msk_cd_ref.Text ) <> '' ) and ( Trim( mskItemCliente.Text ) <> '' ) then
        sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT RC.NR_PROCESSO FROM TREF_CLIENTE RC (NOLOCK) WHERE P.NR_PROCESSO = RC.NR_PROCESSO AND RC.CD_REFERENCIA = "' + Trim( msk_cd_ref.Text ) + '" AND RC.NR_ITEM_PO = "' + Trim( mskItemCliente.Text ) + '" AND TP_REFERENCIA = "' + '0'+IntToStr(cb_tp_referencia.ItemIndex + 1) + '" )'
      else
        if ( Trim( msk_cd_ref.Text ) <> '' ) then
          sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT RC.NR_PROCESSO FROM TREF_CLIENTE RC (NOLOCK) WHERE P.NR_PROCESSO = RC.NR_PROCESSO AND RC.CD_REFERENCIA = "' + Trim( msk_cd_ref.Text ) + '" AND TP_REFERENCIA = "' + '0'+IntToStr(cb_tp_referencia.ItemIndex + 1) + '" )';
    end;
   end;

  if ( Trim( msk_nr_fatura.Text ) <> '' ) and ((Trim( msk_cd_produto.Text)='01') or (Trim( msk_cd_produto.Text)='03')) then
    sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT FAT.NR_PROCESSO FROM TDOCUMENTO_INSTRUCAO FAT (NOLOCK) WHERE P.NR_PROCESSO = FAT.NR_PROCESSO AND FAT.CD_TIPO_DCTO_INSTR = "01" AND FAT.NR_DCTO_INSTRUCAO = "' + Trim( msk_nr_fatura.Text ) + '" )';

  if ( Trim( msk_nr_nota_fiscal.Text ) <> '' ) and ((Trim( msk_cd_produto.Text)='01') or (Trim( msk_cd_produto.Text)='03')) then
    sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT NF.NR_PROCESSO FROM TPROCESSO_NF NF (NOLOCK) WHERE P.NR_PROCESSO = NF.NR_PROCESSO AND NF.NR_NOTA = "' + Trim( msk_nr_nota_fiscal.Text ) + '" )';

  if ( Trim( msk_nr_nota_fiscal.Text ) <> '' ) and ((Trim( msk_cd_produto.Text)='02') or (Trim( msk_cd_produto.Text)='10')) then
    sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT ENF.NR_PROCESSO FROM TPROCESSO_EXP_NF ENF (NOLOCK) WHERE P.NR_PROCESSO = ENF.NR_PROCESSO AND ENF.NR_NF = "' + Trim( msk_nr_nota_fiscal.Text ) + '" )';

  if ( Trim( msk_nr_dta.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.NR_DTA = "' + Trim( msk_nr_dta.Text ) + '" ';

  if ( Trim( msk_nr_fatura.Text ) <> '' ) and ((Trim( msk_cd_produto.Text)='02') or (Trim( msk_cd_produto.Text)='10')) then
    sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT PRO.NR_PROCESSO FROM TPROCESSO_EXP PRO (NOLOCK) WHERE P.NR_PROCESSO = PRO.NR_PROCESSO AND PRO.NR_FATURA = "' + Trim( msk_nr_fatura.Text ) + '" )';

  if ( Trim( msk_nr_conhecimento.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.NR_CONHECIMENTO = "' + Trim( msk_nr_conhecimento.Text ) + '" ';

  if ( Trim( msk_nr_conhecimento_master.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.NR_CONHECIMENTO_MASTER = "' + Trim( msk_nr_conhecimento_master.Text ) + '" ';

  if ( Trim( msk_nr_cntr.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT CNTR.NR_PROCESSO FROM TPROCESSO_CNTR CNTR (NOLOCK) WHERE P.NR_PROCESSO = CNTR.NR_PROCESSO AND CNTR.NR_CNTR = "' + Trim( msk_nr_cntr.Text ) + '" )';

  if ( Trim( datm_pesq_proc.qry_tp_canal_NM_CANAL.AsString ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_CANAL = "' + Trim( datm_pesq_proc.qry_tp_canal_CD_CANAL.AsString ) + '" ';

  if ( Trim( msk_nr_dde.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.NR_DDE = "' + Trim( msk_nr_dde.Text ) + '" ';

  if ( Trim( msk_nr_re.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT RE.NR_PROCESSO FROM TPROCESSO_EXP_RE RE (NOLOCK) WHERE RE.NR_RE = "' + Trim( msk_nr_re.Text ) + '" )';

  if ( Trim( msk_nr_requerimento.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT NR_PROCESSO FROM TPROCESSO_REQUERIMENTO WHERE NR_REQUERIMENTO = "' + Trim( msk_nr_requerimento.Text ) + '" )';

  if ( Trim( msk_nr_ato_drawback.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.NR_PROCESSO = A.NR_PROCESSO AND A.NR_ATO_DRAWBACK = "' + Trim( msk_nr_ato_drawback.Text ) + '" ';

  if ( Trim( msk_nr_certificado.Text ) <> '' ) and ((Trim( msk_cd_produto.Text)='02') or (Trim( msk_cd_produto.Text)='10')) then
    sqlstr := sqlstr + ' AND P.NR_PROCESSO IN ( SELECT DISTINCT PE.NR_PROCESSO FROM TPROCESSO_EXP PE (NOLOCK) WHERE P.NR_PROCESSO = PE.NR_PROCESSO AND PE.NR_CERTIFICADO = "' + Trim( msk_nr_certificado.Text ) + '" )';

  if ( Trim( msk_ce_mercante.Text ) <> '' ) and ((Trim( msk_cd_produto.Text)='01') or (Trim( msk_cd_produto.Text)='03')) then
    sqlstr := sqlstr + ' AND P.NUM_CE = "' + Trim( msk_ce_mercante.Text ) + '" ';

  //add por agatha nigro 29/01/2018
  if ( Trim( mskDue.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND P.CD_DUE = "' + Trim( mskDue.Text ) + '" ';

  //add por agatha nigro 29/01/2018    
  if ( Trim( mskRuc.Text ) <> '' ) then
    sqlstr := sqlstr + ' AND UPPER(P.CD_RUC)  = UPPER("' + Trim( mskRuc.Text ) + '") ';


  if ( Trim( msk_lote_exp.Text ) <> '' )  then
    sqlstr := sqlstr + ' AND P.NR_PROCESSO IN (SELECT DISTINCT EI.NR_PROCESSO FROM TRAP_FORNECIMENTO_LOTE RL (NOLOCK),  TPROCESSO_EXP_ITEM EI (NOLOCK) WHERE EI.NR_PEDIDO = RL.CD_FORNECIMENTO AND RL.CD_LOTE = "' + Trim( msk_lote_exp.Text ) + '" )';

  if ( Trim(msk_cd_consignatario.Text) <> '' ) and ( trim(dblkcbox_consignatario.Text) <> '' ) and ((Trim( msk_cd_produto.Text)='02') or (Trim( msk_cd_produto.Text)='10'))  then begin
    //by carlos - 21/06/2011
    sqlstr := sqlstr + ' AND P.TP_CONSIGNEE = "' + Trim( dblkcbox_consignatario.KeyValue ) + '" ';
    sqlstr := sqlstr + ' AND P.CD_CONSIGNEE = "' + Trim( msk_cd_consignatario.Text ) + '" ';      
  end;

  SQLStrRel := CamposRel + sqlstr;
  sqlstr    := Campos + sqlstr + 'ORDER BY ' + a_str_indices[cb_ordem.ItemIndex];

  datm_pesq_proc.qry_pesq_.Close;
  datm_pesq_proc.qry_pesq_.Sql.Clear;
  datm_pesq_proc.qry_pesq_.Sql.Add(sqlstr);
  datm_pesq_proc.qry_pesq_.Prepare;
  datm_pesq_proc.qry_pesq_.Open;
end;

procedure Tfrm_pesq_proc.FormShow(Sender: TObject);
begin
  pgctrl_pesq_proc.ActivePage := ts_filtros;

  if tp_relatorio < 1 then
  begin
    btn_manut_proc.Visible      := frm_main.mi_manutencao_processo.Visible;
    mi_manut_proc.Visible       := frm_main.mi_manutencao_processo.Visible;
    btn_proc_realiza.Visible    := frm_main.mi_realizacao_processo.Visible;
    mi_proc_realiza.Visible     := frm_main.mi_realizacao_processo.Visible;
    mi_imprimir.Visible         := False;
    btn_imprimir.Visible        := False;
  end
  else
  begin
    btn_manut_proc.Visible      := False;
    mi_manut_proc.Visible       := False;
    btn_proc_realiza.Visible    := False;
    mi_proc_realiza.Visible     := False;
    mi_imprimir.Visible         := True;
    btn_imprimir.Visible        := True;
    case tp_relatorio of
      1 : Caption := 'Relação de Processos - Modelo 1';
    end;
  end;

  if Tag = 1 then
  begin
    btn_manut_proc.Visible := False;
    mi_manut_proc.Visible  := False;
  end
  else
  begin
    btn_manut_proc.Visible := btn_manut_proc.Visible;
    mi_manut_proc.Visible  := btn_manut_proc.Visible;
  end;

  if Tag = 2 then
  begin
    btn_proc_realiza.Visible := False;
    mi_proc_realiza.Visible  := False;
  end
  else
  begin
    btn_proc_realiza.Visible := btn_proc_realiza.Visible;
    mi_proc_realiza.Visible  := mi_proc_realiza.Visible;
  end;

  if mi_manut_proc.Visible   then mi_manut_proc.ShortCut   := TextToShortCut('F2');
  if mi_proc_realiza.Visible then mi_proc_realiza.ShortCut := TextToShortCut('CTRL+F2');
end;

procedure Tfrm_pesq_proc.cb_ordemClick(Sender: TObject);
begin
  Screen.Cursor  := crHourGlass;
  Pesquisa       := datm_pesq_proc.qry_pesq_NR_PROCESSO.AsString;
  (* Apaga o campo de pesquisa  *)
  edt_chave.Text := '';

  GeraSqlStr;

  Localiza(datm_pesq_proc.qry_pesq_, Pesquisa, b_str_indices[0] );
  edt_chave.SetFocus;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_pesq_proc.btn_sairClick(Sender: TObject);
begin
//  str_cd_rotina_atalho := ''; by carlos - 07/06/2010
  Close;
end;

procedure Tfrm_pesq_proc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then begin
    str_cd_rotina_atalho := '';
    Close;
  end;
end;

procedure Tfrm_pesq_proc.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg          then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = msk_cd_produto           then btn_co_produtoClick(btn_co_produto);
    if Sender = msk_cd_grupo             then btn_co_grupoClick(btn_co_grupo);
    if Sender = msk_cd_cliente           then btn_co_clienteClick(btn_co_cliente);
    if Sender = msk_cd_importador        then btn_co_importadorClick(btn_co_importador);
    if Sender = msk_cd_exportador        then btn_co_exportadorClick(btn_co_exportador);
    if Sender = msk_cd_servico           then btn_co_servicoClick(btn_co_servico);
    if Sender = msk_cd_navio             then btn_co_navioClick(btn_co_navio);
    if Sender = msk_nr_viagem            then btn_co_viagemClick(btn_co_viagem);
    if Sender = msk_cd_local_emb         then btn_co_local_embClick(btn_co_local_emb);
    if Sender = msk_cd_local_desemb      then btn_co_local_desembClick(btn_co_local_desemb);
    if Sender = msk_cd_pais_dest         then btn_co_pais_destClick(btn_co_pais_dest);
    if Sender = msk_cd_pais_origem       then btn_co_pais_origemClick(btn_co_pais_origem);
    if Sender = msk_cd_transp_nac        then btn_co_transp_nacClick(btn_co_transp_nac);
    if Sender = msk_cd_armazem_atracacao then btn_co_armazem_atracacaoClick(btn_co_armazem_atracacao);
    if Sender = msk_cd_armazem_descarga  then btn_co_armazem_descargaClick(btn_co_armazem_descarga);
    if Sender = msk_cd_agente            then btn_co_agenteClick(btn_co_agente);
    if Sender = msk_cd_evento            then btn_co_eventoClick(btn_co_evento);
    if Sender = msk_cd_mercadoria        then btn_co_mercadoriaClick(btn_co_mercadoria);
    if Sender = msk_cd_transportador     then btn_co_transportadorClick(btn_co_transportador);
    if Sender = msk_cd_contato           then btn_co_contatoClick(btn_co_contato);
    if Sender = msk_cd_area              then btn_co_areaClick(btn_co_area);
  end;
end;

procedure Tfrm_pesq_proc.pgctrl_pesq_procChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if ( msk_cd_ref.Text <> '' ) and ( cb_tp_referencia.Text = '' ) then
  begin
    Application.MessageBox('Não foi possível processar sua busca.' + #13#10 +
      'Se deseja filtrar por referência, selecione o tipo da referência desejada.',
      'Filtragem por Referência', MB_OK + MB_ICONINFORMATION);
    AllowChange := False
  end
  else
    AllowChange := Consiste;
end;

procedure Tfrm_pesq_proc.HabilitaPesq(Hab: Boolean);
begin
  dbnvg.Enabled            := Hab;
  lbl_pesquisar.Enabled    := Hab;
  lbl_ordem.Enabled        := Hab;
  cb_ordem.Enabled         := Hab;
  edt_chave.Enabled        := Hab;
  btn_manut_proc.Enabled   := Hab;
  mi_manut_proc.Enabled    := Hab;
  btn_proc_realiza.Enabled := Hab;
  mi_proc_realiza.Enabled  := Hab;
end;

procedure Tfrm_pesq_proc.btn_manut_procClick(Sender: TObject);
begin
  flag_btn:=0;
  if Application.MessageBox('Deseja reutilizar esta pesquisa ao fechar a Manutenção?', 'Pesquisa de Processos', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
    vStr_cd_modulo := '01';
    str_cd_rotina := '0102';
    frm_manut_proc.pesq_cd_unid_neg := Copy( datm_pesq_proc.qry_pesq_NR_PROCESSO.AsString, 1, 2);
    frm_manut_proc.pesq_cd_prod     := Copy( datm_pesq_proc.qry_pesq_NR_PROCESSO.AsString, 3, 2);
    frm_manut_proc.pesq_nr_proc     := datm_pesq_proc.qry_pesq_NR_PROCESSO.AsString;
    frm_manut_proc.ShowModal;
    vStr_cd_modulo                   := '01';
    str_cd_rotina                   := '0109';
  end else begin
    str_cd_rotina_atalho := '0102';
    nr_processo_gestao   := datm_pesq_proc.qry_pesq_NR_PROCESSO.AsString;
    cd_unid_neg_gestao   := Copy(datm_pesq_proc.qry_pesq_NR_PROCESSO.AsString, 1, 2);
    cd_prod_gestao       := Copy(datm_pesq_proc.qry_pesq_NR_PROCESSO.AsString, 3, 2);
    flag_btn:=1;
    Close;
  end;
end;

procedure Tfrm_pesq_proc.edt_chaveChange(Sender: TObject);
begin
  if cb_ordem.ItemIndex = 0 then
  Localiza(datm_pesq_proc.qry_pesq_, dbedt_cd_unid_neg.Text + dbedt_cd_produto.Text +
                                       edt_chave.Text, b_str_indices[cb_ordem.ItemIndex] )
  else
    Localiza(datm_pesq_proc.qry_pesq_, edt_chave.Text, b_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_pesq_proc.edt_chaveExit(Sender: TObject);
begin
  if cb_ordem.ItemIndex = 0 then
  Localiza(datm_pesq_proc.qry_pesq_, dbedt_cd_unid_neg.Text + dbedt_cd_produto.Text +
                                       edt_chave.Text, b_str_indices[cb_ordem.ItemIndex] )
  else
    Localiza(datm_pesq_proc.qry_pesq_, edt_chave.Text, b_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_pesq_proc.btn_co_transp_nacClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_transp_nac.Text := ConsultaOnLineEx('TTRANSP_ROD','Transportador',['CD_TRANSP_ROD','NM_TRANSP_ROD'],['Código','Descrição'],'CD_TRANSP_ROD',frm_main.mi_cad_transp_rod)
  else
    edt_nm_transp_nac.Text := ConsultaLookUP('TTRANSP_ROD','CD_TRANSP_ROD',msk_cd_transp_nac.Text,'NM_TRANSP_ROD');
end;

procedure Tfrm_pesq_proc.btn_co_armazem_atracacaoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_armazem_atracacao.Text := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM'],['Código','Nome'],'CD_ARMAZEM',frm_main.mi_cad_amz)
  else
    edt_nm_armazem_atracacao.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',msk_cd_armazem_atracacao.Text,'NM_ARMAZEM');
end;

procedure Tfrm_pesq_proc.btn_co_armazem_descargaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_armazem_descarga.Text := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM'],['Código','Nome'],'CD_ARMAZEM',frm_main.mi_cad_amz)
  else
    edt_nm_armazem_descarga.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',msk_cd_armazem_descarga.Text,'NM_ARMAZEM');
end;

procedure Tfrm_pesq_proc.btn_co_agenteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_agente.Text := ConsultaOnLineEx('TAGENTE','Agentes',['CD_AGENTE','NM_AGENTE'],['Código','Descrição'],'CD_AGENTE',frm_main.mi_agentes)
  else
    edt_nm_agente.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',msk_cd_agente.Text,'NM_AGENTE');
end;

procedure Tfrm_pesq_proc.btn_proc_realizaClick(Sender: TObject);
begin
  flag_btn:=0;
  if Application.MessageBox('Deseja reutilizar esta pesquisa ao fechar o FollowUp?', 'Pesquisa de Processos', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
    vStr_cd_modulo := '01';
    str_cd_rotina := '0110';
    Application.CreateForm(Tfrm_followup, frm_followup);
    frm_followup.pesq_cd_unid_neg := Copy( datm_pesq_proc.qry_pesq_NR_PROCESSO.AsString, 1, 2);
    frm_followup.pesq_cd_prod     := Copy( datm_pesq_proc.qry_pesq_NR_PROCESSO.AsString, 3, 2);
    frm_followup.pesq_nr_proc     := datm_pesq_proc.qry_pesq_NR_PROCESSO.AsString;
    frm_followup.ShowModal;
    vStr_cd_modulo                   := '01';
    str_cd_rotina                   := '0109';
  end else begin
    str_cd_rotina_atalho := '0110';
    nr_processo_gestao   := datm_pesq_proc.qry_pesq_NR_PROCESSO.AsString;
    cd_unid_neg_gestao   := Copy(datm_pesq_proc.qry_pesq_NR_PROCESSO.AsString, 1, 2);
    cd_prod_gestao       := Copy(datm_pesq_proc.qry_pesq_NR_PROCESSO.AsString, 3, 2);
    flag_btn:=1;
    Close;
  end;

end;

procedure Tfrm_pesq_proc.dbg_lib_procDblClick(Sender: TObject);
begin
  PesqNrProcesso := datm_pesq_proc.qry_pesq_NR_PROCESSO.AsString;
  Close;
end;

procedure Tfrm_pesq_proc.dbg_lib_procKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then dbg_lib_procDblClick(nil);
end;

procedure Tfrm_pesq_proc.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_lib_procDblClick(nil);
end;

procedure Tfrm_pesq_proc.btn_co_grupoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_grupo.Text := ConsultaOnLineEx('TGRUPO','Grupos',['CD_GRUPO','NM_GRUPO'],['Código','Descrição'],'CD_GRUPO',frm_main.mi_cad_cli)
  else
    edt_nm_grupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO',msk_cd_grupo.Text,'NM_GRUPO')
end;

procedure Tfrm_pesq_proc.btn_co_eventoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_evento.Text := ConsultaOnLineEx('TEVENTO','Eventos',['CD_EVENTO','NM_EVENTO'],['Código','Nome'],'CD_EVENTO',frm_main.mi_realizacao_evento)
  else
    edt_nm_evento.Text := ConsultaLookUP('TEVENTO','CD_EVENTO',msk_cd_evento.Text,'NM_EVENTO');
end;

procedure Tfrm_pesq_proc.btn_co_importadorClick(Sender: TObject);
begin
  if Trim( msk_cd_produto.Text ) = '' then
  begin
    BoxMensagem( 'Atenção! É necessário informar um produto para determinar o Importador!', 3 );
    msk_cd_produto.SetFocus;
  end;

  If Trim( msk_cd_produto.Text ) = '01' Then
  Begin
    if Sender is TSpeedButton then
      msk_cd_importador.Text := ConsultaOnLineEx('TEMPRESA_NAC','Importador',['CD_EMPRESA','NM_EMPRESA'],['Código','Descrição'],'CD_EMPRESA',frm_main.mi_cad_emp_nac)
    else
      edt_nm_importador.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',msk_cd_importador.Text,'NM_EMPRESA')
  end;

  if Trim( msk_cd_produto.Text ) = '02' then
  begin
    if Sender is TSpeedButton then
      msk_cd_importador.Text := ConsultaOnLineEx('TEMPRESA_EST','Empresa Estrangeira',['CD_EMPRESA','NM_EMPRESA'],['Código','Descrição'],'CD_EMPRESA',frm_main.mi_cad_emp_est)
    else
      edt_nm_importador.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',msk_cd_importador.Text,'NM_EMPRESA')
  end;
end;

procedure Tfrm_pesq_proc.btn_co_exportadorClick(Sender: TObject);
begin
  if Trim( msk_cd_produto.Text ) = '' then
  begin
    BoxMensagem( 'Atenção! É necessário informar um produto para determinar o Importador!', 3 );
    msk_cd_produto.SetFocus;
  end;

  if Trim( msk_cd_produto.Text ) = '01' then
  begin
    if Sender is TSpeedButton then
      msk_cd_exportador.Text := ConsultaOnLineEx('TEMPRESA_EST','Empresa Estrangeira',['CD_EMPRESA','NM_EMPRESA'],['Código','Descrição'],'CD_EMPRESA',frm_main.mi_cad_emp_est)
    else
      edt_nm_exportador.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',msk_cd_exportador.Text,'NM_EMPRESA')
  end;

  if Trim( msk_cd_produto.Text ) = '02' then
  begin
    if Sender is TSpeedButton then
      msk_cd_exportador.Text := ConsultaOnLineEx('TEMPRESA_NAC','Exportador',['CD_EMPRESA','NM_EMPRESA'],['Código','Descrição'],'CD_EMPRESA',frm_main.mi_cad_emp_nac)
    else
      edt_nm_exportador.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',msk_cd_exportador.Text,'NM_EMPRESA')
  end;
end;

{ $HINTS OFF }
procedure Tfrm_pesq_proc.msk_dt_inicioExit(Sender: TObject);
var
  dt_selecao : TDateTime;
begin
  if msk_dt_inicio.Text <> '  /  /    ' then
  begin
    try
      StrToDate( msk_dt_inicio.Text );
    except
      on EConvertError do
      begin
        BoxMensagem( 'Data Inválida!', 2 );
        msk_dt_inicio.Clear;
        msk_dt_inicio.SetFocus;
        Exit;
      end;
    end;
    dt_selecao := StrToDate( msk_dt_inicio.Text );
  end;
end;
{$HINTS ON}

{$HINTS OFF}
procedure Tfrm_pesq_proc.msk_dt_fimExit(Sender: TObject);
var
  dt_selecao : TDateTime;
begin
  if msk_dt_fim.Text <> '  /  /    ' then
  begin
    try
      StrToDate( msk_dt_fim.Text );
    except
      on EConvertError do
      begin
        BoxMensagem( 'Data Inválida!', 2 );
        msk_dt_fim.Clear;
        msk_dt_fim.SetFocus;
        Exit;
      end;
    end;
    dt_selecao := StrToDate( msk_dt_fim.Text );
  end;
end;
{$HINTS ON}

{$HINTS OFF}
procedure Tfrm_pesq_proc.msk_dt_inicio_aberturaExit(Sender: TObject);
var
  dt_selecao : TDateTime;
begin
  if msk_dt_inicio_abertura.Text <> '  /  /    ' then
  begin
    try
      StrToDate( msk_dt_inicio_abertura.Text );
    except
      on EConvertError do
      begin
        BoxMensagem( 'Data Inválida!', 2 );
        msk_dt_inicio_abertura.Clear;
        msk_dt_inicio_abertura.SetFocus;
        Exit;
      end;
    end;
    dt_selecao := StrToDate( msk_dt_inicio_abertura.Text );
  end;
end;
{$HINTS ON}


{$HINTS OFF}
procedure Tfrm_pesq_proc.msk_dt_fim_aberturaExit(Sender: TObject);
var
  dt_selecao : TDateTime;
begin
  if msk_dt_fim_abertura.Text <> '  /  /    ' then
  begin
    try
      StrToDate( msk_dt_fim_abertura.Text );
    except
      on EConvertError do
      begin
        BoxMensagem( 'Data Inválida!', 2 );
        msk_dt_fim_abertura.Clear;
        msk_dt_fim_abertura.SetFocus;
        Exit;
      end;
    end;
    dt_selecao := StrToDate( msk_dt_fim_abertura.Text );
  end;
end;
{$HINTS ON}


procedure Tfrm_pesq_proc.btn_imprimirClick(Sender: TObject);
var
  nr_identificador : Integer;
  sqlstr : string;
begin
  with datm_pesq_proc, crp_proc do
  begin
    case tp_relatorio of
      1: begin
           Screen.Cursor := crHourGlass;
           Application.ProcessMessages;

           Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
           ReportName  := cDir_Rpt + '\CRGI021.RPT';

           qry_rel_proc_mod1_.Close;
           qry_rel_proc_mod1_.Prepare;
           qry_rel_proc_mod1_.Open;
           if qry_rel_proc_mod1_.RecordCount > 0 then
           begin
             nr_identificador := qry_rel_proc_mod1_.FieldByName('NR_IDENTIFICADOR').AsInteger + 1;
           end
           else
           begin
             nr_identificador := 1;
           end;
           sqlstr := 'INSERT TREL_PROCESSO_MOD1 ( NR_IDENTIFICADOR, NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, CD_EXPORTADOR, CD_PAIS_ORIGEM, CD_MOEDA_FOB, VL_FOB_MNEG ) ';
           sqlstr := sqlstr + 'SELECT ' + IntToStr( nr_identificador ) + ', P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_PRODUTO, P.CD_CLIENTE, P.CD_EXPORTADOR, P.CD_PAIS_ORIGEM, P.CD_MOEDA_MLE, ISNULL( P.VL_MLE_MNEG, 0 ) ';
           sqlstr := sqlstr + 'FROM TPROCESSO P (NOLOCK) WHERE NR_PROCESSO IN ( ';
           sqlstr := sqlstr + SQLStrRel;
           sqlstr := sqlstr + ' )';
           qry_atz_rel_proc_mod1_.Close;
           qry_atz_rel_proc_mod1_.Sql.Clear;
           qry_atz_rel_proc_mod1_.Sql.Add(sqlstr);
           qry_atz_rel_proc_mod1_.Prepare;
           qry_atz_rel_proc_mod1_.ExecSQL;

           Formulas[0] := 'NrIdentificador = ' + IntToStr( nr_identificador );

           Screen.Cursor := crDefault;
           Application.ProcessMessages;

           Execute;

           ApagaDados( 'TREL_PROCESSO_MOD1', nr_identificador );
         end; (* Fim Mod. 1  *)
    end;
  end;
end;

procedure Tfrm_pesq_proc.btn_co_viagemClick(Sender: TObject);
var
  UnidNeg : string;
begin
  with datm_pesq_proc do
  begin
    if Trim( msk_cd_navio.Text ) = '' then
    begin
      BoxMensagem( 'Informe um Navio', 3 );
      msk_cd_navio.SetFocus;
      Exit;
    end;

    //Verifica sempre se a unidade é 07. Caso o seja, modifica para '01' (Não no Edit, mas somente o parâmetro da query, para fins de consulta). Eric 23/07/2012 17:18h
    If Trim(msk_cd_unid_neg.Text) = '07' Then
      UnidNeg := '01'
    else
      UnidNeg := msk_cd_unid_neg.Text;

    msk_nr_viagem.Text := ConsultaOnLineExSQL(
                              'SELECT V.NR_VIAGEM, V.DT_ESPERADA, V.DT_ENT, E.DESCRICAO, A.NM_ARMAZEM, ' +
                              'V.NR_MANIFESTO ' +
                              'FROM   TVIAGEM V (NOLOCK), TARMAZEM A (NOLOCK), TLOCAL_EMBARQUE E (NOLOCK) ' +
                              'WHERE  V.CD_UNID_NEG = ''' + UnidNeg + ''' AND ' +
                              'V.CD_PRODUTO = ''' + frm_pesq_proc.msk_cd_produto.Text + ''' AND ' +
                              'V.CD_EMBARCACAO = ''' + frm_pesq_proc.msk_cd_navio.Text + ''' AND ' +
                              'V.CD_ARMAZEM_ATRACACAO *= A.CD_ARMAZEM AND ' +
                              'V.CD_LOCAL = E.CODIGO ',
  //                            'ORDER BY SUBSTRING( V.NR_VIAGEM, 3, 2 ) DESC, SUBSTRING( V.NR_VIAGEM, 1, 2 ) DESC ',
                              'Viagens', ['NR_VIAGEM', 'DT_ESPERADA', 'DT_ENT', 'DESCRICAO.','NM_ARMAZEM','NR_MANIFESTO'],
                              ['Viagem', 'Dt. Esperada', 'Dt. Entrada', 'Local Desemb.','Arm. Atracação','Nº Manifesto'], 'NR_VIAGEM', frm_main.mi_gp_ga_cad_viagem);
  end;
end;

procedure Tfrm_pesq_proc.btn_co_mercadoriaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_mercadoria.Text := ConsultaOnLineEx('TMERCADORIA','Mercadorias',['CD_MERCADORIA','AP_MERCADORIA', 'CD_NCM_SH', 'CD_AREA', 'CONVERT(DECIMAL(16,2),VL_UNITARIO)'],['Código','Nome', 'NCM', 'Área', 'Valor Unitário'],'CD_MERCADORIA',frm_main.mi_cad_merc);
  end else
    dbedt_nm_produto.Text := ConsultaLookUP ('TMERCADORIA','CD_MERCADORIA',msk_cd_mercadoria.Text,'AP_MERCADORIA')

(*  if Trim( msk_cd_unid_neg.Text ) = '' then
  begin
    BoxMensagem( 'Informe a Unidade',3 );
    msk_cd_unid_neg.SetFocus;
    Exit;
  end;

  if Trim( msk_cd_produto.Text ) = '' then
  begin
    BoxMensagem( 'Informe o Produto',3 );
    msk_cd_produto.SetFocus;
    Exit;
  end;

  if Trim( msk_cd_produto.Text ) = '01' then
  begin
    if Sender is TSpeedButton then
      msk_cd_mercadoria.Text := ConsultaOnLineEx('TMERCADORIA','Mercadoria',['CD_MERCADORIA','AP_MERCADORIA'],['Código','Descrição'],'CD_MERCADORIA',frm_main.mi_cad_merc)
    else
      edt_nm_mercadoria.Text := ConsultaLookUP('TMERCADORIA','CD_MERCADORIA',msk_cd_mercadoria.Text,'AP_MERCADORIA')
  end
  else
  begin
   Application.CreateForm(Tfrm_Mercadoria_Exp, frm_Mercadoria_Exp);

   CloseStoredProc( datm_mercadoria_exp.sp_mercadoria_exp_ );
   datm_mercadoria_exp.sp_mercadoria_exp_.ParamByName('@cd_exportador').AsString := '';
   datm_mercadoria_exp.sp_mercadoria_exp_.ParamByName('@cd_grupo').AsString      := '';
   ExecStoredProc( datm_mercadoria_exp.sp_mercadoria_exp_ );
   frm_mercadoria_exp.nr_identificador := datm_mercadoria_exp.sp_mercadoria_exp_.ParamByName('@nr_identificador').AsInteger;
   CloseStoredProc( datm_mercadoria_exp.sp_mercadoria_exp_ );

   datm_mercadoria_exp.qry_lista_.Close;
   datm_mercadoria_exp.qry_lista_.ParamByName('NR_IDENTIFICADOR').asInteger := frm_mercadoria_exp.nr_identificador;
   datm_mercadoria_exp.qry_lista_.Prepare;
   datm_mercadoria_exp.qry_lista_.Open;

    with frm_mercadoria_exp do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      msk_cd_mercadoria.Text := Cons_OnLine_Texto;
      lCons_OnLine := False;
      msk_cd_unid_negExit(nil);
    end;

  end;
*)
end;

procedure Tfrm_pesq_proc.FormActivate(Sender: TObject);
begin
  frm_pesq_proc.VertScrollBar.Position := 0;
end;

procedure Tfrm_pesq_proc.msk_cd_transportadorExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_proc.btn_co_transportadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_transportador.Text := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl)
  else
    edt_nm_transportador.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',msk_cd_transportador.Text,'DESCRICAO');
end;


procedure Tfrm_pesq_proc.msk_cd_areaExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_proc.msk_cd_contatoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_proc.btn_co_contatoClick(Sender: TObject);
begin
  if msk_cd_unid_neg.Text = '' then
  begin
   BoxMensagem( 'Preencher o campo Unidade!', 2 );
   msk_cd_unid_neg.SetFocus;
   exit;
  end;
  if msk_cd_produto.Text = '' then
  begin
    BoxMensagem( 'Preencher o campo Produto!', 2 );
    msk_cd_produto.SetFocus;
    exit;
  end;
  if msk_cd_cliente.Text = '' then
  begin
    BoxMensagem( 'Preencher o campo Cliente!', 2 );
    msk_cd_cliente.SetFocus;
    exit;
  end;
  if Sender is TSpeedButton then
    msk_cd_contato.Text := ConsultaOnLineExSQL('SELECT CD_CONTATO, NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + msk_cd_cliente.Text + ''' and CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' AND CD_PRODUTO    = ''' + msk_cd_produto.Text + '''',                                                                           'Contatos', ['CD_CONTATO', 'NM_CONTATO'], ['Código', 'Descrição'], 'CD_CONTATO', nil)
  else
    edt_nm_contato.Text := ConsultaLookUPSQL('SELECT NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + msk_cd_cliente.Text + ''' and CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' AND CD_PRODUTO    = ''' + msk_cd_produto.Text + ''' and CD_CONTATO = ''' + msk_cd_contato.Text + '''','NM_CONTATO');
end;


procedure Tfrm_pesq_proc.msk_cd_clienteExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_proc.msk_cd_unid_negExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_proc.btn_co_areaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_area.Text := ConsultaOnLineEx('TAREA','Área',['CD_AREA','NM_AREA'],['Código','Descrição'],'CD_AREA',frm_main.mi_cad_area)
  else edt_nm_area.Text := ConsultaLookUP('TAREA','CD_AREA',msk_cd_area.Text,'NM_AREA');
end;


procedure Tfrm_pesq_proc.msk_cd_produtoExit(Sender: TObject);
begin
  Consiste;
  if msk_cd_produto.Text='02' then begin
     pnl_consignatario.Visible:=True;
     datm_pesq_proc.qry_tp_pessoa_exp_.Open;
  end else begin
     datm_pesq_proc.qry_tp_pessoa_exp_.Close;
     pnl_consignatario.Visible:=False;
  end;
end;

procedure Tfrm_pesq_proc.msk_cd_consignatarioExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_pesq_proc.btn_co_consignatarioClick(Sender: TObject);
var
vGrupo: string[3];
begin
  if dblkcbox_consignatario.KeyValue = 0 then
     if msk_cd_grupo.Text='' then begin
        ShowMessage('Informe o Grupo');
        msk_cd_grupo.SetFocus;
        exit;
     end;

  vGrupo := msk_cd_grupo.Text;
  with datm_pesq_proc do begin
    if Sender is TSpeedButton then begin
      if (Sender as TSpeedButton).Enabled then begin
        //Importador
        if dblkcbox_consignatario.KeyValue = 0 then
          msk_cd_consignatario.Text := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
            ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
            'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,msk_cd_consignatario.Text);

        //Agente
        if dblkcbox_consignatario.KeyValue = 1 then
          msk_cd_consignatario.Text := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ',
            'Agente',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'],['Código', 'Nome', 'Apelido'], 'CD_EMPRESA');
        //Banco
        if dblkcbox_consignatario.KeyValue = 3 then
          msk_cd_consignatario.Text := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ',
            'Banco',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA');
        //Transportadora
        if dblkcbox_consignatario.KeyValue = 2 then
          msk_cd_consignatario.Text := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO', 'DESCRICAO'],['Código','Nome'],'CODIGO');
        //Despachante
        if dblkcbox_consignatario.KeyValue = 4 then
          msk_cd_consignatario.Text := ConsultaOnLineEx('TDESPACHANTE','Despachante',['CD_DESPACHANTE','NM_DESPACHANTE'],['Código','Nome'],'CD_DESPACHANTE');

        msk_cd_consignatarioExit(nil);

      end;
    end
    else begin

      //Importador
      if dblkcbox_consignatario.KeyValue = 0 then
        edt_nm_consignatario.Text := ConsultaLookUPSQL(
        ' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = 1 AND CD_EMPRESA = '''+ msk_cd_consignatario.Text +''' ' +
        ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ','NM_EMPRESA');


      //Agente
      if dblkcbox_consignatario.KeyValue = 1 then
        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
          'WHERE CD_EMPRESA = ''' + msk_cd_consignatario.Text +''' '+
          '  AND IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');

      //Banco
      if dblkcbox_consignatario.KeyValue = 3 then
        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
          'WHERE CD_EMPRESA = ''' + msk_cd_consignatario.Text +''' '+
          '  AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');

      //Transportadora
      if dblkcbox_consignatario.KeyValue = 2 then
        edt_nm_consignatario.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',msk_cd_consignatario.Text, 'DESCRICAO');

      //Despachante
      if dblkcbox_consignatario.KeyValue = 4 then
        edt_nm_consignatario.Text := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE',msk_cd_consignatario.Text, 'NM_DESPACHANTE');

    end;

  end;

end;

procedure Tfrm_pesq_proc.dbg_lib_procDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  //by carlos - 21/06/2011
  if datm_pesq_proc.qry_pesq_IN_CANCELADO.AsString='1' then begin
    dbg_lib_proc.Canvas.Brush.Color := clRed;
    dbg_lib_proc.Canvas.Font.Color  := clWhite;
    dbg_lib_proc.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Column.Field.AsString);
  end;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure Tfrm_pesq_proc.BbtnFronteiraClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    mskCDFronteira.Text := ConsultaOnLineEx('TLOCAL_EMBARQUE','Fronteira',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil)
  else
    edtFronteira.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',mskCDFronteira.Text,'DESCRICAO');
end;

procedure Tfrm_pesq_proc.btn_co_ncmClick(Sender: TObject);
begin
    msk_cd_ncm.Text := ConsultaOnLineEx('TNCM','NCM',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_ncm)
end;

procedure Tfrm_pesq_proc.cb_tp_referenciaExit(Sender: TObject);
begin
  if cb_tp_referencia.ItemIndex + 1 = 1 then
  begin
    cb_tp_filtro.Enabled := True;
  end
  else
  begin
    cb_tp_filtro.Enabled := False;
    cb_tp_filtro.ItemIndex := 0;
  end;
end;

end.

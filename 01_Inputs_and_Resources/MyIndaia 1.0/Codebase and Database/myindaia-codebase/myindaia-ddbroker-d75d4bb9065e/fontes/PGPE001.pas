unit PGPE001;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Menus, Buttons, ComCtrls, Grids,
  DBGrids, Db, DBTables, DBCGrids, Funcoes;

type
  Tfrm_pe_capa = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    menu_manut_cadastro: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    btn_itens_pe: TSpeedButton;
    btn_excluir: TSpeedButton;
    mi_excluir: TMenuItem;
    mi_itens_pe: TMenuItem;
    pgctrl_pe_capa: TPageControl;
    tbsht_capa_01: TTabSheet;
    tbsht_capa_02: TTabSheet;
    tbsht_capa_03: TTabSheet;
    pnl_basicas: TPanel;
    lbl_processo: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    btn_co_importador: TSpeedButton;
    Label30: TLabel;
    SpeedButton15: TSpeedButton;
    Label31: TLabel;
    SpeedButton16: TSpeedButton;
    btn_co_exportador: TSpeedButton;
    Label32: TLabel;
    Label33: TLabel;
    btn_co_origem: TSpeedButton;
    Label34: TLabel;
    btn_co_destino: TSpeedButton;
    Label35: TLabel;
    btn_co_pais_destino: TSpeedButton;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    btn_co_representante: TSpeedButton;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    btn_co_instr_neg: TSpeedButton;
    Label43: TLabel;
    btn_co_seguradora: TSpeedButton;
    Label44: TLabel;
    btn_co_urf_desp: TSpeedButton;
    Label45: TLabel;
    btn_co_urf_emb: TSpeedButton;
    Label46: TLabel;
    btn_co_termo_pagto: TSpeedButton;
    Label47: TLabel;
    Label48: TLabel;
    btn_co_moeda: TSpeedButton;
    Label49: TLabel;
    mskedt_nr_processo: TMaskEdit;
    dbedt_dt_abertura: TDBEdit;
    dbedt_nr_fatura: TDBEdit;
    dbedt_dt_fatura: TDBEdit;
    dbchkbx_drawback: TDBCheckBox;
    dbedt_cd_exportador: TDBEdit;
    dbedt_nm_exportador: TDBEdit;
    dbedt_cd_importador: TDBEdit;
    dbedt_nm_importador: TDBEdit;
    dbedt_cd_local_origem: TDBEdit;
    dbedt_nm_local_origem: TDBEdit;
    dbedt_cd_local_destino: TDBEdit;
    dbedt_nm_local_destino: TDBEdit;
    dbedt_cd_pais_destino: TDBEdit;
    dbedt_nm_pais_destino: TDBEdit;
    dblkcbox_via_transp: TDBLookupComboBox;
    dblkcbox_tp_frete: TDBLookupComboBox;
    dbedt_cd_representante: TDBEdit;
    dbedt_nm_representante: TDBEdit;
    dblkcbox_forma_pagto: TDBLookupComboBox;
    dbedt_perc_comissao: TDBEdit;
    dbedt_cd_incoterm: TDBEdit;
    dbedt_cd_instr_neg: TDBEdit;
    dbedt_nm_istr_neg: TDBEdit;
    dbedt_cd_seguradora: TDBEdit;
    dbedt_nm_seguradora: TDBEdit;
    dbedt_cd_urf_despacho: TDBEdit;
    dbedt_nm_urf_despacho: TDBEdit;
    dbedt_cd_urf_embarque: TDBEdit;
    dbedt_nm_urf_embarque: TDBEdit;
    dbedt_cd_termo_pagto: TDBEdit;
    dbedt_nm_termo_pagto: TDBEdit;
    dblkcbox_tp_lingua: TDBLookupComboBox;
    dbm_termo_pagto: TDBMemo;
    dbedt_cd_moeda: TDBEdit;
    dbedt_nm_moeda: TDBEdit;
    pnl_complementares: TPanel;
    Label20: TLabel;
    SpeedButton1: TSpeedButton;
    Label21: TLabel;
    SpeedButton4: TSpeedButton;
    Label22: TLabel;
    Label23: TLabel;
    dbm_decl_exportador: TDBMemo;
    dbm_decl_adicional: TDBMemo;
    pnl_totais: TPanel;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dbm_marc_volumes: TDBMemo;
    dbm_inf_geral: TDBMemo;
    dbedt_tot_mle: TDBEdit;
    dbedt_qt_total_emb: TDBEdit;
    dbedt_qt_total_prod: TDBEdit;
    dbedt_vl_desconto: TDBEdit;
    dbedt_tot_pl: TDBEdit;
    dbedt_vl_seguro: TDBEdit;
    dbedt_vl_cubagem: TDBEdit;
    dbedt_vl_frete_intern: TDBEdit;
    dbedt_tot_pb: TDBEdit;
    dbedt_tot_incoterm_mcv: TDBEdit;
    dbedt_tot_exw: TDBEdit;
    dbedt_tx_cambio: TDBEdit;
    dbedt_tot_pallets: TDBEdit;
    dbedt_vl_comissao_agente: TDBEdit;
    dbedt_tot_conteineres: TDBEdit;
    Label24: TLabel;
    dbedt_nm_carta_credito: TDBEdit;
    Label50: TLabel;
    dbedt_cd_agente_carga: TDBEdit;
    dbedt_nm_agente_carga: TDBEdit;
    btn_co_agente: TSpeedButton;
    Label51: TLabel;
    dbedt_cd_despachante: TDBEdit;
    dbedt_nm_despachante: TDBEdit;
    btn_co_despachante: TSpeedButton;
    Label52: TLabel;
    dbedt_cd_transportadora: TDBEdit;
    dbedt_nm_transportadora: TDBEdit;
    btn_co_transportadora: TSpeedButton;
    Label53: TLabel;
    dbedt_nr_li: TDBEdit;
    dbedt_cd_consignatario: TDBEdit;
    dbedt_nm_consignatario: TDBEdit;
    btn_co_consignatario: TSpeedButton;
    Label56: TLabel;
    Label54: TLabel;
    dblkcbox_notificado1: TDBLookupComboBox;
    dbedt_cd_notificado1: TDBEdit;
    dbedt_nm_notificado1: TDBEdit;
    btn_co_notificado1: TSpeedButton;
    Label55: TLabel;
    dblkcbox_notificado2: TDBLookupComboBox;
    dbedt_cd_notificado2: TDBEdit;
    dbedt_nm_notificado2: TDBEdit;
    btn_co_notificado2: TSpeedButton;
    DBEdit39: TDBEdit;
    dblkcbox_consignatario: TDBLookupComboBox;
    dbedt_nm_incoterm: TDBEdit;
    btn_co_incoterm: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_cd_importadorExit(Sender: TObject);
    procedure dbedt_cd_urf_despachoExit(Sender: TObject);
    procedure btn_itens_peClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbedt_cd_incotermExit(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbedt_cd_inst_financExit(Sender: TObject);
    procedure dbedt_cd_pais_procExit(Sender: TObject);
    procedure dbedt_cd_urf_entradaExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_exportadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure btn_co_origemClick(Sender: TObject);
    procedure btn_co_pais_destinoClick(Sender: TObject);
    procedure btn_co_representanteClick(Sender: TObject);
    procedure btn_co_instr_negClick(Sender: TObject);
    procedure btn_co_urf_despClick(Sender: TObject);
    procedure btn_co_termo_pagtoClick(Sender: TObject);
    procedure btn_co_importadorClick(Sender: TObject);
    procedure btn_co_destinoClick(Sender: TObject);
    procedure btn_co_seguradoraClick(Sender: TObject);
    procedure btn_co_urf_embClick(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure dbedt_cd_exportadorExit(Sender: TObject);
    procedure dbedt_cd_local_origemExit(Sender: TObject);
    procedure dbedt_cd_pais_destinoExit(Sender: TObject);
    procedure dbedt_cd_representanteExit(Sender: TObject);
    procedure dbedt_cd_instr_negExit(Sender: TObject);
    procedure dbedt_cd_termo_pagtoExit(Sender: TObject);
    procedure dbedt_cd_local_destinoExit(Sender: TObject);
    procedure dbedt_cd_seguradoraExit(Sender: TObject);
    procedure dbedt_cd_urf_embarqueExit(Sender: TObject);
    procedure dbedt_cd_moedaExit(Sender: TObject);
    procedure dbedt_cd_agente_cargaExit(Sender: TObject);
    procedure btn_co_despachanteClick(Sender: TObject);
    procedure btn_co_transportadoraClick(Sender: TObject);
    procedure dbedt_cd_transportadoraExit(Sender: TObject);
    procedure btn_co_consignatarioClick(Sender: TObject);
    procedure btn_co_agenteClick(Sender: TObject);
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );
    procedure dbedt_cd_despachanteExit(Sender: TObject);
    procedure mskedt_nr_processoExit(Sender: TObject);
    procedure btn_co_incotermClick(Sender: TObject);
    procedure pgctrl_pe_capaChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_pe_capaChange(Sender: TObject);
    procedure dblkcbox_consignatarioExit(Sender: TObject);
    procedure dblkcbox_notificado1Exit(Sender: TObject);
    procedure dblkcbox_notificado2Exit(Sender: TObject);
    procedure dbedt_cd_notificado1Exit(Sender: TObject);
    procedure dbedt_cd_notificado2Exit(Sender: TObject);
    procedure btn_co_notificado1Click(Sender: TObject);
    procedure btn_co_notificado2Click(Sender: TObject);
    procedure dbedt_cd_consignatarioExit(Sender: TObject);
    procedure dbedt_vl_frete_internExit(Sender: TObject);
    procedure dbedt_vl_seguroExit(Sender: TObject);
    procedure dbedt_vl_frete_internEnter(Sender: TObject);
    procedure dbedt_vl_seguroEnter(Sender: TObject);
    procedure dblkcbox_consignatarioClick(Sender: TObject);
    procedure dblkcbox_notificado1Click(Sender: TObject);
    procedure dblkcbox_notificado2Click(Sender: TObject);

  private
    function VerAlt            : Boolean;
    function Grava             : Boolean;
    procedure Cancelar;
    procedure CodExits;
    procedure Desabilita_Entrada;
    procedure Habilita_Entrada;
    procedure Habilita_Btn_CbBx( nNum : Integer );
    procedure Zera_Numero;
    procedure Valida_Exit( nNum:Integer );
    procedure Muda_Lookup_Nm( nNum:Integer; nTp:Integer );
    procedure ValCodigo( dbedit_Codigo : TDbEdit; nNum : Integer );
    procedure Verifica_Capa;

  public
    { Public declarations }
    un_pd_nr_processo : string[11];
    Code : integer;
    in_reb : String[1];
    Tab_Ativa : TTabSheet;
    lNaoConsiste, in_banco, in_calculo, in_forca_calculo, in_excluiu, in_abrindo_via, in_li_abrindo : Boolean;
    aMoedas : array [1..4] of String;
    aTaxas  : array [1..4] of Double;
    vl_old  : Double;

    function Consiste : Boolean;
  end;

var
  frm_pe_capa: Tfrm_pe_capa;

implementation

uses GSMLIB, PGPE005, PGGP017, PGSM096, PGPE004, PGGP001, PGPE002, PGSM103,
     PGSM104, PGSM046, PGSM019, PGSM148, PGSM126, PGSM014, PGSM041;

{$R *.DFM}


procedure Tfrm_pe_capa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_PE_Capa do
    begin
      qry_pe_.Close;
      qry_via_transporte_.Close;
      qry_urf_.Close;
      qry_forma_pagto_.Close;
      qry_lingua_.Close;
      qry_tp_frete_.Close;
      qry_tp_pessoa_exp_.Close;
      qry_despachante_.Close;
      qry_emp_est_.Close;
      qry_ag_.Close;
      qry_local_embarque_.Close;
      qry_moeda_.Close;
      qry_emp_nac_.Close;
      qry_pais_.Close;

      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;

  Screen.Cursor := crArrow;

  Criando_pe := False;
end;

procedure Tfrm_pe_capa.btn_sairClick(Sender: TObject);
begin
  Close;
end;


procedure Tfrm_pe_capa.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
  datm_PE_Capa.VerificaEstado(False);
  pgctrl_pe_capa.SetFocus;
  Criando_pe := False;
end;

procedure Tfrm_pe_capa.btn_cancelarClick(Sender: TObject);
begin
  Criando_pe := False;
  Cancelar;
end;


procedure Tfrm_pe_capa.FormShow(Sender: TObject);
begin
  in_excluiu        := False;

  If not (bCriando) then
  begin
    If Criando_pe = True then
       str_nr_processo := ''
    else
    begin
      str_nr_processo := datm_PE.qry_pe_NR_PROCESSO.AsString;
      mskedt_nr_processo.Text := str_nr_processo;
      mskedt_nr_processo.Color := clMenu;
      mskedt_nr_processo.ReadOnly := True;
      mskedt_nr_processo.TabStop := False;
    end;
  end
  else
  begin
    if Criando_pe then
       str_nr_processo := '';

    if Trim(str_nr_processo) <> '' then
    begin
      mskedt_nr_processo.Text := str_nr_processo;
      mskedt_nr_processo.Color := clMenu;
      mskedt_nr_processo.ReadOnly := True;
      mskedt_nr_processo.TabStop := False;
    end
  end;

  pgctrl_pe_capa.ActivePage := tbsht_capa_01;

  If Trim(str_nr_processo) = '' then
  begin
    Desabilita_Entrada;
    lbl_processo.Enabled := True;
    mskedt_nr_processo.Enabled := True;
    mskedt_nr_processo.SetFocus;
    Exit;
  end;

  Frm_PE_capa.Caption := 'Pedido de Exportação [ ' + Trim( str_nr_processo ) + ' ] ';

  datm_PE_capa.qry_pe_.Close;
  datm_PE_capa.qry_pe_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  datm_PE_capa.qry_pe_.ParamByName('CD_UNID_NEG').AsString := frm_pe.msk_cd_unid_neg.Text;
  datm_PE_capa.qry_pe_.Prepare;
  datm_PE_capa.qry_pe_.Open;

  datm_PE_Capa.qry_pe_.Edit;

  Zera_Numero;
  Verifica_Capa;

  datm_PE_Capa.qry_pe_.Post;
  datm_PE_Capa.VerificaEstado(False);

  pgctrl_pe_capa.ActivePage := tbsht_capa_01;
end;

procedure Tfrm_pe_capa.Verifica_Capa;
var
  nVlProd, nVlEmb, nVlCub, nVlPL, nVlExw : Double;

begin
  nVlProd := 0;
  nVlEmb  := 0;
  nVlCub  := 0;
  nVlPL   := 0;
  nVlExw  := 0;

  with datm_pe_capa do
  begin
    qry_pe_itens_.Close;
    qry_pe_itens_.ParamByName('CD_UNID_NEG').AsString := frm_pe.msk_cd_unid_neg.Text;
    qry_pe_itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_pe_itens_.Prepare;
    qry_pe_itens_.Prepare;
    qry_pe_itens_.Open;

    if Not (qry_pe_itens_.EOF) then
    begin

      qry_pe_itens_.First;

      while Not (qry_pe_itens_.EOF) and
            (qry_pe_itens_.FieldByName('NR_PROCESSO').AsString = str_nr_processo) do
      begin
        nVlProd := nVlProd + qry_pe_itens_.FieldByName('QT_MERCADORIA').AsFloat;
        nVlEmb  := nVlEmb + qry_pe_itens_.FieldByName('QT_EMBALAGEM').AsFloat;
        nVlCub  := nVlCub + qry_pe_itens_.FieldByName('VL_CUBAGEM').AsFloat;
        nVlPL   := nVLPL + qry_pe_itens_.FieldByName('VL_TOT_PESO_LIQ').AsFloat;
        nVlExw  := nVlExw + qry_pe_itens_.FieldByName('VL_TOT_ITEM').AsFloat;

        qry_pe_itens_.Next;
      end;

      qry_pe_VL_TOT_QTDE_PROD.AsFloat := nVlProd;
      qry_pe_VL_TOT_QTDE_EMBALAGEM.AsFloat := nVlEmb;
      qry_pe_VL_TOT_CUBAGEM.AsFloat := nVlCub;
      qry_pe_VL_PESO_LIQUIDO.AsFloat := nVlPL;
      qry_pe_VL_TOT_EXW.AsFloat := nVlExw;
      qry_pe_VL_TOT_FOB.AsFloat := nVlExw;
      qry_pe_VL_TOT_MCV.AsFloat := nVlExw + qry_pe_VL_FRETE.AsFloat + qry_pe_VL_SEGURO.AsFloat;

    end;
    qry_pe_itens_.Close;
  end;
end;

procedure Tfrm_pe_capa.dbedt_cd_importadorExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_capa.dbedt_cd_urf_despachoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_capa.btn_itens_peClick(Sender: TObject);
begin
  Close;
  Frm_PE.i_seletor := 2;
end;

procedure Tfrm_pe_capa.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_PE_capa, datm_PE_capa );

  datm_pe_capa.qry_via_transporte_.Close;
  datm_pe_capa.qry_via_transporte_.Prepare;
  datm_pe_capa.qry_via_transporte_.Open;

  datm_pe_capa.qry_tp_frete_.Close;
  datm_pe_capa.qry_tp_frete_.Prepare;
  datm_pe_capa.qry_tp_frete_.Open;

  datm_pe_capa.qry_forma_pagto_.Close;
  datm_pe_capa.qry_forma_pagto_.Prepare;
  datm_pe_capa.qry_forma_pagto_.Open;

  datm_pe_capa.qry_lingua_.Close;
  datm_pe_capa.qry_lingua_.Prepare;
  datm_pe_capa.qry_lingua_.Open;

  datm_pe_capa.qry_tp_pessoa_exp_.Close;
  datm_pe_capa.qry_tp_pessoa_exp_.Prepare;
  datm_pe_capa.qry_tp_pessoa_exp_.Open;
end;

procedure Tfrm_pe_capa.dbedt_cd_incotermExit(Sender: TObject);
begin
  CodExits;
  If datm_pe_capa.qry_pe_.State in [dsEdit,dsInsert] then
  begin
    datm_pe_capa.qry_pe_VL_FRETE.AsFloat  := 0;
    datm_pe_capa.qry_pe_VL_SEGURO.AsFloat := 0;
  end;
end;

procedure Tfrm_pe_capa.btn_excluirClick(Sender: TObject);
begin

  if BoxMensagem( 'Deseja realmente excluir o Pedido[ ' + Trim( str_nr_processo ) + '] ?', 1 ) then
  begin
    datm_PE_capa.qry_pe_.Close;

    try
      datm_main.db_broker.StartTransaction;
      datm_pe_capa.qry_exec_sp_.SQL.Clear;
      datm_pe_capa.qry_exec_sp_.SQL.Add( 'EXEC sp_pe_exclui "' + str_nr_processo + '","' + frm_pe.msk_cd_unid_neg.Text + '"' );

      datm_pe_capa.qry_exec_sp_.ExecSQL;

      datm_main.db_broker.Commit;

      datm_pe_capa.VerificaEstado(False);
    except
      on E: Exception do
      begin
        Frm_PE_capa.btn_cancelarClick(nil);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    in_excluiu := True;
    Close;
  end;
end;



procedure Tfrm_pe_capa.dbedt_cd_inst_financExit(Sender: TObject);
begin
  CodExits;
end;


function Tfrm_pe_capa.Consiste:Boolean;
begin
  if datm_PE_Capa.qry_pe_.State in [dsInsert, dsEdit] then
  begin

    If pgctrl_pe_capa.ActivePage = tbsht_capa_01 then
    begin
      {Exportador}
      if dbedt_cd_exportador.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_exportador );
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_exportador.Text = '' ) then
          begin
            BoxMensagem('Código do Exportador inválido !',2);
            pgctrl_pe_capa.ActivePage := tbsht_capa_01;
            dbedt_cd_exportador.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      {Importador}
      if dbedt_cd_importador.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_importador );
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_importador.Text = '' ) then
          begin
            BoxMensagem('Código do Importador inválido!',2);
            pgctrl_pe_capa.ActivePage := tbsht_capa_01;
            dbedt_cd_importador.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      {Local de Origem}
      if dbedt_cd_local_origem.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_local_origem );
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_local_origem.Text = '' ) then
          begin
            BoxMensagem('Código do Local de Origem inválido !',2);
            pgctrl_pe_capa.ActivePage := tbsht_capa_01;
            dbedt_cd_local_origem.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      {Local de Destino}
      if dbedt_cd_local_destino.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_local_destino );
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_local_destino.Text = '' ) then
          begin
            BoxMensagem('Código do Local de Destino inválido !',2);
            pgctrl_pe_capa.ActivePage := tbsht_capa_01;
            dbedt_cd_local_destino.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      {Pais de Destino Final}
      if dbedt_cd_pais_destino.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_pais_destino );
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_pais_destino.Text = '' ) then
          begin
            BoxMensagem('Código do País de Destino inválido !',2);
            pgctrl_pe_capa.ActivePage := tbsht_capa_01;
            dbedt_cd_pais_destino.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      {Representante}
      if dbedt_cd_representante.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_representante );
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_representante.Text = '' ) then
          begin
            BoxMensagem('Código do Representante inválido !',2);
            pgctrl_pe_capa.ActivePage := tbsht_capa_01;
            dbedt_cd_representante.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      {Incoterm}
      if dbedt_cd_incoterm.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_incoterm );
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_incoterm.Text = '' ) then
          begin
            BoxMensagem('Código do Incoterm inválido!',2);
            pgctrl_pe_capa.ActivePage := tbsht_capa_01;
            dbedt_cd_incoterm.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      {Instrumento de Negociacao}
      if dbedt_cd_instr_neg.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_instr_neg );
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_istr_neg.Text = '' ) then
          begin
            BoxMensagem('Código do Instrumento de Negociação inválido!',2);
            pgctrl_pe_capa.ActivePage := tbsht_capa_01;
            dbedt_cd_instr_neg.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      {Seguradora}
      if dbedt_cd_seguradora.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_seguradora );
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_seguradora.Text = '' ) then
          begin
            BoxMensagem('Código do Agente Comissão inválido!',2);
            pgctrl_pe_capa.ActivePage := tbsht_capa_01;
            dbedt_cd_seguradora.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      {URF de Despacho}
      ValidCodigo( dbedt_cd_urf_despacho );
      if dbedt_cd_urf_despacho.Text <> '' then
      begin
        if ( dbedt_nm_urf_despacho.Text = '' ) then
        begin
          BoxMensagem('Código da URF de Despacho inválido!',2);
          pgctrl_pe_capa.ActivePage := tbsht_capa_01;
          dbedt_cd_urf_despacho.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      {URF de Embarque}
      if dbedt_cd_urf_embarque.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_urf_embarque );
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_urf_embarque.Text = '' ) then
          begin
            BoxMensagem('Código da URF de Embarque inválido!',2);
            pgctrl_pe_capa.ActivePage := tbsht_capa_01;
            dbedt_cd_urf_embarque.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      {Termo de Pagamento}
      if dbedt_cd_termo_pagto.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_termo_pagto );
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_termo_pagto.Text = '' ) then
          begin
            BoxMensagem('Código do Termo de Pagamento inválido!',2);
            pgctrl_pe_capa.ActivePage := tbsht_capa_01;
            dbedt_cd_termo_pagto.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      {Moeda FOB}
      if dbedt_cd_moeda.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_moeda);
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_moeda.Text = '' ) then
          begin
            BoxMensagem('Código da Moeda inválido!',2);
            pgctrl_pe_capa.ActivePage := tbsht_capa_01;
            dbedt_cd_moeda.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;

    If pgctrl_pe_capa.ActivePage = tbsht_capa_03 then
    begin
      {Agente de Carga}
      ValidCodigo( dbedt_cd_agente_carga);
      If lNaoConsiste = False then
      begin
        if dbedt_cd_agente_carga.Text <> '' then
        begin
          if ( dbedt_nm_agente_carga.Text = '' ) then
          begin
            BoxMensagem('Código do Agende de Carga inválido!',2);
            pgctrl_pe_capa.ActivePage := tbsht_capa_03;
            dbedt_cd_agente_carga.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      {Despachante}
      if dbedt_cd_despachante.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_despachante);
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_despachante.Text = '' ) then
          begin
            BoxMensagem('Código do Despachante inválido!',2);
            pgctrl_pe_capa.ActivePage := tbsht_capa_03;
            dbedt_cd_despachante.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      {Transportador Internacional}
      if dbedt_cd_transportadora.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_transportadora);
        If lNaoConsiste = False then
        begin
          if ( dbedt_nm_transportadora.Text = '' ) then
          begin
            BoxMensagem('Código da Transportadora inválido!',2);
            pgctrl_pe_capa.ActivePage := tbsht_capa_03;
            dbedt_cd_transportadora.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;
  end;
  Consiste := True;
end;


procedure Tfrm_pe_capa.dbedt_cd_pais_procExit(Sender: TObject);
begin
  CodExits;
end;


procedure Tfrm_pe_capa.Cancelar;
begin
  with datm_PE_Capa do
  begin
    if qry_pe_.State      in [dsEdit,dsInsert] then qry_pe_.Cancel;
    qry_pe_.Close;
    btn_sairClick(nil);
  end;
end;


procedure Tfrm_pe_capa.dbedt_cd_urf_entradaExit(Sender: TObject);
begin
  CodExits;
end;

function Tfrm_pe_capa.VerAlt;
begin
  VerAlt := True;

  if ( ( datm_PE_Capa.qry_pe_.State in [dsEdit] ) {and st_modificar} ) or
      ( datm_PE_Capa.qry_pe_.State in [dsInsert] ) then
  begin
    if BoxMensagem('A Capa do PE foi alterada.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      if Not Consiste then
      begin
        VerAlt := False;
        Exit;
      end;
      if Not Grava then
      begin
        VerAlt := False;
        Exit;
      end;
    end
    else
      Cancelar;
  end;
end;


procedure Tfrm_pe_capa.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_pe_capa.Desabilita_Entrada;
var i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TLabel ) then
       TLabel( Components[i] ).Enabled        := False;
    if ( Components[i] is TSpeedButton ) then
       TSpeedButton( Components[i] ).Enabled  := False;
    if ( Components[i] is TDBEdit ) then
       TDBEdit( Components[i] ).Enabled       := False;
    if ( Components[i] is TDBRadioGroup ) then
       TDBRadioGroup( Components[i] ).Enabled := False;
    if ( Components[i] is TRadioButton ) then
       TRadioButton( Components[i] ).Enabled  := False;
    if ( Components[i] is TDBCheckBox ) then
       TDBCheckBox( Components[i] ).Enabled   := False;
    if ( Components[i] is TDBLookupComboBox ) then
       TDBLookupComboBox( Components[i] ).Enabled := False;
    if ( Components[i] is  TMaskEdit ) then
       TMaskEdit( Components[i] ).Enabled     :=  False;
  end;

  mi_salvar.Enabled   := btn_salvar.Enabled;
  mi_cancelar.Enabled := btn_cancelar.Enabled;
  mi_excluir.Enabled  := btn_excluir.Enabled;

  btn_sair.Enabled := True;
  btn_itens_pe.Enabled := True;

  mi_itens_pe.Enabled := btn_itens_pe.Enabled;
  mi_sair.Enabled     := btn_sair.Enabled;
end;


procedure Tfrm_pe_capa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
end;

procedure Tfrm_pe_capa.dbedt_cd_exportadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_exportador        then btn_co_exportadorClick(nil);
    if Sender = dbedt_cd_importador        then btn_co_importadorClick(nil);
    if Sender = dbedt_cd_local_origem      then btn_co_origemClick(nil);
    if Sender = dbedt_cd_local_destino     then btn_co_destinoClick(nil);
    if Sender = dbedt_cd_pais_destino      then btn_co_pais_destinoClick(nil);
    if Sender = dbedt_cd_representante     then btn_co_representanteClick(nil);
    if Sender = dbedt_cd_incoterm          then btn_co_incotermClick(nil);
    if Sender = dbedt_cd_instr_neg         then btn_co_instr_negClick(nil);
    if Sender = dbedt_cd_seguradora        then btn_co_seguradoraClick(nil);
    if Sender = dbedt_cd_urf_despacho      then btn_co_urf_despClick(nil);
    if Sender = dbedt_cd_urf_embarque      then btn_co_urf_embClick(nil);
    if Sender = dbedt_cd_termo_pagto       then btn_co_termo_pagtoClick(nil);
    if Sender = dbedt_cd_moeda             then btn_co_moedaClick(nil);
    if Sender = dbedt_cd_agente_carga      then btn_co_agenteClick(nil);
    if Sender = dbedt_cd_despachante       then btn_co_despachanteClick(nil);
    if Sender = dbedt_cd_transportadora    then btn_co_transportadoraClick(nil);
    if Sender = dbedt_cd_consignatario     then btn_co_consignatarioClick(nil);
    if Sender = dbedt_cd_notificado1       then btn_co_notificado1Click(nil);
    if Sender = dbedt_cd_notificado2       then btn_co_notificado2Click(nil);
  end;
end;

procedure Tfrm_pe_capa.btn_co_exportadorClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TEMPRESA_NAC',
                datm_pe_Capa.qry_pe_CD_EXPORTADOR,
                'Exportador', 38, 'SELECT * FROM TEMPRESA_NAC WHERE IN_EXPORTADOR = 1','TQuery');
  dbedt_cd_exportadorExit(nil);
end;

procedure Tfrm_pe_capa.btn_co_origemClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TLOCAL_EMBARQUE',
                datm_pe_capa.qry_pe_CD_LOCAL_ORIGEM,
                'Local Origem', 1, '', 'TQuery');
  dbedt_cd_local_origemExit(nil);
end;

procedure Tfrm_pe_capa.btn_co_pais_destinoClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TPAIS',
                datm_pe_capa.qry_pe_CD_PAIS_DESTINO,
                'País', 1, '', 'TQuery');
  dbedt_cd_pais_destinoExit(nil);
end;

procedure Tfrm_pe_capa.btn_co_representanteClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TEMPRESA_NAC',
                datm_pe_Capa.qry_pe_CD_REPRESENTANTE,
                'Representante', 38, 'SELECT * FROM TEMPRESA_NAC WHERE IN_REPRESENTANTE = 1','TQuery');
  dbedt_cd_representanteExit(nil);
end;

procedure Tfrm_pe_capa.btn_co_instr_negClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TINST_NEGOC',
                datm_pe_Capa.qry_pe_CD_INST_NEGOC,
                'Instrumento de Negociação', 39, '','TQuery');
  dbedt_cd_instr_negExit(nil);
end;

procedure Tfrm_pe_capa.btn_co_urf_despClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TURF',
                datm_pe_Capa.qry_pe_CD_URF_DESPACHO,
                'Unidade da Receita Federal de Despacho', 1, '','TQuery');
  dbedt_cd_urf_despachoExit(nil);
end;

procedure Tfrm_pe_capa.btn_co_termo_pagtoClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TTERMO_PAGTO',
                datm_pe_Capa.qry_pe_CD_TERMO_PAGTO,
                'Termo de Pagamento', 40, '','TQuery');
  dbedt_cd_instr_negExit(nil);
end;

procedure Tfrm_pe_capa.btn_co_importadorClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TEMPRESA_EST',
                datm_pe_Capa.qry_pe_CD_IMPORTADOR,
                'Importador', 38, 'SELECT * FROM TEMPRESA_EST WHERE IN_IMPORTADOR = 1', 'TQuery');
  dbedt_cd_importadorExit(nil);
end;

procedure Tfrm_pe_capa.btn_co_destinoClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TLOCAL_EMBARQUE',
                datm_pe_capa.qry_pe_CD_LOCAL_DESTINO,
                'Local Destino', 1, '', 'TQuery');
  dbedt_cd_local_destinoExit(nil);
end;

procedure Tfrm_pe_capa.btn_co_seguradoraClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TEMPRESA_EST',
                datm_pe_Capa.qry_pe_CD_SEGURADORA,
                'Agente Comissão', 38, 'SELECT * FROM TEMPRESA_EST WHERE IN_AGENTE = 1','TQuery');
  dbedt_cd_seguradoraExit(nil);

end;

procedure Tfrm_pe_capa.btn_co_urf_embClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TURF',
                datm_pe_Capa.qry_pe_CD_URF_DESTINO,
                'Unidade da Receita Federal de Embarque', 1, '','TQuery');
  dbedt_cd_urf_embarqueExit(nil);
end;

procedure Tfrm_pe_capa.btn_co_moedaClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TMOEDA',
                datm_pe_Capa.qry_pe_CD_MOEDA,
                'Moedas', 1, '','TQuery');
  dbedt_cd_moedaExit(nil);
end;

procedure Tfrm_pe_capa.dbedt_cd_exportadorExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_capa.dbedt_cd_local_origemExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_capa.dbedt_cd_pais_destinoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_capa.dbedt_cd_representanteExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_capa.dbedt_cd_instr_negExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_capa.dbedt_cd_termo_pagtoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_capa.dbedt_cd_local_destinoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_capa.dbedt_cd_seguradoraExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_capa.dbedt_cd_urf_embarqueExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_capa.dbedt_cd_moedaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_capa.dbedt_cd_agente_cargaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_capa.btn_co_despachanteClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TDESPACHANTE',
                datm_pe_capa.qry_pe_CD_DESPACHANTE,
                'Despachante', 41, '', 'TQuery');
  dbedt_cd_despachanteExit(nil);
end;

procedure Tfrm_pe_capa.btn_co_transportadoraClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TTRANSPORTADOR_ITL',
                datm_pe_Capa.qry_pe_CD_TRANSPORTADORA,
                'Transportadora', 1, '','TQuery');
  dbedt_cd_transportadoraExit(nil);
end;

procedure Tfrm_pe_capa.dbedt_cd_transportadoraExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_pe_capa.btn_co_consignatarioClick(Sender: TObject);
begin

  {Importador}
  If dblkcbox_consignatario.KeyValue = 0 then
     Cons_On_line( 'DBBROKER', 'TEMPRESA_EST',
                   datm_pe_capa.qry_pe_CD_CONSIGNATARIO,
                  'Importador', 38, 'SELECT * FROM TEMPRESA_EST WHERE IN_IMPORTADOR = 1 AND IN_ATIVO = 1','TQuery');

  {Agente de Carga}
  If dblkcbox_consignatario.KeyValue = 1 then
     Cons_On_line( 'DBBROKER', 'TEMPRESA_EST',
                   datm_pe_capa.qry_pe_CD_CONSIGNATARIO,
                   'Agente', 38, 'SELECT * FROM TEMPRESA_EST WHERE IN_AGENTE = 1 AND IN_ATIVO = 1','TQuery');

  {Transportadora}
  If dblkcbox_consignatario.KeyValue = 2 then
     Cons_On_line( 'DBBROKER', 'TTRANSPORTADOR_ITL',
                   datm_pe_capa.qry_pe_CD_CONSIGNATARIO,
                   'Transportadora', 1, '','TQuery');

  {Banco}
  If dblkcbox_consignatario.KeyValue = 3 then
     Cons_On_line( 'DBBROKER', 'TEMPRESA_EST',
                   datm_pe_capa.qry_pe_CD_CONSIGNATARIO,
                   'Banco', 38, 'SELECT * FROM TEMPRESA_EST WHERE IN_BANCO = 1 AND IN_ATIVO = 1','TQuery');

  {Despachante}
  If dblkcbox_consignatario.KeyValue = 4 then
     Cons_On_line( 'DBBROKER', 'TDESPACHANTE',
                   datm_pe_capa.qry_pe_CD_CONSIGNATARIO,
                   'Despachante', 41, '', 'TQuery');

end;


procedure Tfrm_pe_capa.btn_co_agenteClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TAGENTE',
                datm_pe_capa.qry_pe_CD_AGENTE,
                'Agente de Carga', 34, '', 'TQuery');
  dbedt_cd_agente_cargaExit(nil);
end;


procedure Tfrm_pe_capa.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin

  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo           := nCodigo;
  datm_consulta_padrao.Tabela.TableName := cNomeTabela;

  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine        := fCampo;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    if Not ( datm_PE_Capa.qry_pe_.State in [dsEdit, dsInsert] ) then datm_PE_Capa.qry_pe_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;

end;



procedure Tfrm_pe_capa.dbedt_cd_despachanteExit(Sender: TObject);
begin
  CodExits;
end;

function Tfrm_pe_capa.Grava;
begin
  Grava := True;
  try
    datm_main.db_broker.StartTransaction;
    with datm_PE_Capa do
    begin
      if qry_pe_.State in [dsEdit,dsInsert] then
      begin
        qry_pe_.Post;

        datm_main.db_broker.Commit;

        qry_pe_.Close;
        qry_pe_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
        qry_pe_.ParamByName('CD_UNID_NEG').AsString := frm_pe.msk_cd_unid_neg.Text;
        qry_pe_.Prepare;
        qry_pe_.Open;
      end;
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
end;


procedure Tfrm_pe_capa.Habilita_Entrada;
var i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TLabel ) then
       TLabel( Components[i] ).Enabled        := True;
    if ( Components[i] is TSpeedButton ) then
       TSpeedButton( Components[i] ).Enabled  := True;
    if ( Components[i] is TDBEdit ) then
       TDBEdit( Components[i] ).Enabled       := True;
    if ( Components[i] is TDBRadioGroup ) then
       TDBRadioGroup( Components[i] ).Enabled := True;
    if ( Components[i] is TRadioButton ) then
       TRadioButton( Components[i] ).Enabled  := True;
    if ( Components[i] is TDBCheckBox ) then
       TDBCheckBox( Components[i] ).Enabled   := True;
    if ( Components[i] is TDBLookupComboBox ) then
       TDBLookupComboBox( Components[i] ).Enabled := True;
  end;

  btn_sair.Enabled := True;
  mi_sair.Enabled  := True;
end;


procedure Tfrm_pe_capa.mskedt_nr_processoExit(Sender: TObject);
begin
  If mskedt_nr_processo.ReadOnly then
     exit;

  If mskedt_nr_processo.Text <> '' then
  begin
    with datm_PE_Capa do
    begin

      qry_pe_.Close;
      qry_pe_.ParamByName('NR_PROCESSO').AsString := mskedt_nr_processo.Text;
      qry_pe_.ParamByName('CD_UNID_NEG').AsString := frm_pe.msk_cd_unid_neg.Text;
      qry_pe_.Prepare;
      qry_pe_.Open;

      if not (qry_pe_.EOF) then
      begin
        BoxMensagem( 'Nr. Processo já existente !! ', 3 );
        mskedt_nr_processo.Text := '';
        Cancelar;
        Desabilita_Entrada;
        Exit;
      end;

      str_nr_processo := mskedt_nr_processo.Text;
      mskedt_nr_processo.Color := clMenu;
      mskedt_nr_processo.ReadOnly := True;
      mskedt_nr_processo.TabStop := False;
      mskedt_nr_processo.Enabled := True;

      Frm_PE_capa.Caption := 'Pedido de Exportação [ ' + Trim( str_nr_processo ) + ' ] ';

      qry_pe_.Append;

      qry_pe_NR_PROCESSO.AsString          := str_nr_processo;
      qry_pe_CD_UNID_NEG.AsString          := frm_pe.msk_cd_unid_neg.Text;
      qry_pe_DT_REGISTRO_PEDIDO.AsDateTime := StrToDate( DateToStr( Date ) );

      Habilita_Entrada;
    end;

    Zera_Numero;
    dbedt_dt_abertura.SetFocus;
  end;

end;


procedure Tfrm_pe_capa.Zera_Numero;
begin
  NullToZero( datm_pe_capa.qry_pe_VL_FRETE              );
  NullToZero( datm_pe_capa.qry_pe_VL_SEGURO             );
  NullToZero( datm_pe_capa.qry_pe_VL_PESO_BRUTO         );
  NullToZero( datm_pe_capa.qry_pe_VL_PESO_LIQUIDO       );
  NullToZero( datm_pe_capa.qry_pe_VL_DESCONTO           );
  NullToZero( datm_pe_capa.qry_pe_VL_COMISSAO_PERCENT   );
  NullToZero( datm_pe_capa.qry_pe_VL_TOT_ORIGEM         );
  NullToZero( datm_pe_capa.qry_pe_VL_TOT_CUBAGEM        );
  NullToZero( datm_pe_capa.qry_pe_VL_TOT_FOB            );
  NullToZero( datm_pe_capa.qry_pe_VL_TOT_COM_AGENTE     );
  NullToZero( datm_pe_capa.qry_pe_VL_TOT_QTDE_PROD      );
  NullToZero( datm_pe_capa.qry_pe_VL_TOT_QTDE_EMBALAGEM );
  NullToZero( datm_pe_capa.qry_pe_VL_TOT_MCV            );
  NullToZero( datm_pe_capa.qry_pe_VL_TX_CAMBIO          );
  NullToZero( datm_pe_capa.qry_pe_VL_TOT_CONTAINER      );
  NullToZero( datm_pe_capa.qry_pe_VL_TOT_PALLETS        );
  NullToZero( datm_pe_capa.qry_pe_VL_TOT_EXW            );

  IF datm_pe_capa.qry_pe_IN_DRAWBACK.AsBoolean <> True then
     datm_pe_capa.qry_pe_IN_DRAWBACK.Value := False;

end;


procedure Tfrm_pe_capa.btn_co_incotermClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TINCOTERMS_VENDA',
                datm_PE_capa.qry_pe_CD_INCOTERM ,
                'Incoterms', 1, '','TQuery');
end;

procedure Tfrm_pe_capa.pgctrl_pe_capaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := Consiste;
end;

procedure Tfrm_pe_capa.pgctrl_pe_capaChange(Sender: TObject);
begin

  if pgctrl_pe_capa.ActivePage = tbsht_capa_02 then
  begin
    dbedt_vl_frete_intern.Color    := clMenu;
    dbedt_vl_frete_intern.ReadOnly := True;
    dbedt_vl_frete_intern.TabStop  := False;
    dbedt_vl_seguro.Color    := clMenu;
    dbedt_vl_seguro.ReadOnly := True;
    dbedt_vl_seguro.TabStop  := False;

    If (dbedt_cd_incoterm.Text = 'CIF') or
       (dbedt_cd_incoterm.Text = 'DAF') or
       (dbedt_cd_incoterm.Text = 'DES') or
       (dbedt_cd_incoterm.Text = 'CIP') then
    begin
      dbedt_vl_frete_intern.Color    := clWindow;
      dbedt_vl_frete_intern.ReadOnly := False;
      dbedt_vl_frete_intern.TabStop  := True;
      dbedt_vl_seguro.Color    := clWindow;
      dbedt_vl_seguro.ReadOnly := False;
      dbedt_vl_seguro.TabStop  := True;
    end
    else If dbedt_cd_incoterm.Text = 'DDU' then
    begin
      dbedt_vl_seguro.Color    := clWindow;
      dbedt_vl_seguro.ReadOnly := False;
      dbedt_vl_seguro.TabStop  := True;
    end
    else If (dbedt_cd_incoterm.Text = 'CFR') or
      (dbedt_cd_incoterm.Text = 'CPT') then
    begin
      dbedt_vl_frete_intern.Color    := clWindow;
      dbedt_vl_frete_intern.ReadOnly := False;
      dbedt_vl_frete_intern.TabStop  := True;
    end;
  end
  else if pgctrl_pe_capa.ActivePage = tbsht_capa_03 then
  begin
    dbedt_cd_consignatario.Enabled := True;
    dbedt_nm_consignatario.Enabled := True;
    btn_co_consignatario.Enabled   := True;
    dbedt_cd_notificado1.Enabled   := True;
    dbedt_nm_notificado1.Enabled   := True;
    btn_co_notificado1.Enabled     := True;
    dbedt_cd_notificado2.Enabled   := True;
    dbedt_nm_notificado2.Enabled   := True;
    btn_co_notificado2.Enabled     := True;

    Habilita_Btn_CbBx( 1 );
    Habilita_Btn_CbBx( 2 );
    Habilita_Btn_CbBx( 3 );
  end;

end;


procedure Tfrm_pe_capa.Habilita_Btn_CbBx( nNum : Integer );
begin

  if nNum = 1 then
  begin
    if datm_PE_Capa.qry_pe_TP_CONSIGNATARIO.IsNull then
    begin
      dbedt_cd_consignatario.Enabled := False;
      dbedt_nm_consignatario.Enabled := False;
      dbedt_nm_consignatario.DataField := '';
      btn_co_consignatario.Enabled   := False;
    end
    else
    begin
      dbedt_cd_consignatario.Enabled := True;
      dbedt_nm_consignatario.Enabled := True;
      btn_co_consignatario.Enabled   := True;

      Muda_Lookup_Nm( 1, dblkcbox_consignatario.KeyValue );
    end;
  end;

  if nNum = 2 then
  begin
    If datm_PE_Capa.qry_pe_TP_NOTIFY1.IsNull then
    begin
      dbedt_cd_notificado1.Enabled   := False;
      dbedt_nm_notificado1.Enabled   := False;
      dbedt_nm_notificado1.DataField := '';
      btn_co_notificado1.Enabled     := False;
    end
    else
    begin
      dbedt_cd_notificado1.Enabled   := True;
      dbedt_nm_notificado1.Enabled   := True;
      btn_co_notificado1.Enabled     := True;

      Muda_Lookup_Nm( 2, dblkcbox_notificado1.KeyValue );
    end;
  end;

  if nNum = 3 then
  begin
    if datm_PE_Capa.qry_pe_TP_NOTIFY2.IsNull then
    begin
      dbedt_cd_notificado2.Enabled   := False;
      dbedt_nm_notificado2.Enabled   := False;
      dbedt_nm_notificado2.DataField := '';
      btn_co_notificado2.Enabled     := False;
    end
    else
    begin
      dbedt_cd_notificado2.Enabled   := True;
      dbedt_nm_notificado2.Enabled   := True;
      btn_co_notificado2.Enabled     := True;

      Muda_Lookup_Nm( 3, dblkcbox_notificado2.KeyValue );
    end;
  end;
end;


procedure Tfrm_pe_capa.dblkcbox_consignatarioExit(Sender: TObject);
begin
  dbedt_cd_consignatario.Text := '';
  Habilita_Btn_CbBx( 1 );
  if Not datm_PE_Capa.qry_pe_TP_CONSIGNATARIO.IsNull then
     dbedt_cd_consignatario.SetFocus;
end;

procedure Tfrm_pe_capa.dblkcbox_notificado1Exit(Sender: TObject);
begin
  dbedt_cd_notificado1.Text := '';
  Habilita_Btn_CbBx( 2 );
  if Not datm_PE_Capa.qry_pe_TP_NOTIFY1.IsNull then
     dbedt_cd_notificado1.SetFocus;
end;

procedure Tfrm_pe_capa.dblkcbox_notificado2Exit(Sender: TObject);
begin
  dbedt_cd_notificado2.Text := '';
  Habilita_Btn_CbBx( 3 );
  if Not datm_PE_Capa.qry_pe_TP_NOTIFY2.IsNull then
     dbedt_cd_notificado2.SetFocus;
end;

procedure Tfrm_pe_capa.dbedt_cd_notificado1Exit(Sender: TObject);
begin
  Valida_Exit( 2 );
end;

procedure Tfrm_pe_capa.dbedt_cd_notificado2Exit(Sender: TObject);
begin
  Valida_Exit( 3 );
end;

procedure Tfrm_pe_capa.btn_co_notificado1Click(Sender: TObject);
begin

  {Importador}
  If dblkcbox_notificado1.KeyValue = 0 then
     Cons_On_line( 'DBBROKER', 'TEMPRESA_EST',
                   datm_pe_capa.qry_pe_CD_NOTIFY1,
                  'Importador', 38, 'SELECT * FROM TEMPRESA_EST WHERE IN_IMPORTADOR = 1 AND IN_ATIVO = 1','TQuery');

  {Agente de Carga}
  If dblkcbox_notificado1.KeyValue = 1 then
     Cons_On_line( 'DBBROKER', 'TEMPRESA_EST',
                   datm_pe_capa.qry_pe_CD_NOTIFY1,
                   'Agente', 38, 'SELECT * FROM TEMPRESA_EST WHERE IN_AGENTE = 1 AND IN_ATIVO = 1','TQuery');

  {Transportadora}
  If dblkcbox_notificado1.KeyValue = 2 then
     Cons_On_line( 'DBBROKER', 'TTRANSPORTADOR_ITL',
                   datm_pe_capa.qry_pe_CD_NOTIFY1,
                   'Transportadora', 1, '','TQuery');

  {Banco}
  If dblkcbox_notificado1.KeyValue = 3 then
     Cons_On_line( 'DBBROKER', 'TEMPRESA_EST',
                   datm_pe_capa.qry_pe_CD_NOTIFY1,
                   'Banco', 38, 'SELECT * FROM TEMPRESA_EST WHERE IN_BANCO = 1 AND IN_ATIVO = 1','TQuery');

  {Despachante}
  If dblkcbox_notificado1.KeyValue = 4 then
     Cons_On_line( 'DBBROKER', 'TDESPACHANTE',
                   datm_pe_capa.qry_pe_CD_NOTIFY1,
                   'Despachante', 41, '', 'TQuery');

end;


procedure Tfrm_pe_capa.btn_co_notificado2Click(Sender: TObject);
begin
  {Importador}
  If dblkcbox_notificado2.KeyValue = 0 then
     Cons_On_line( 'DBBROKER', 'TEMPRESA_EST',
                   datm_pe_capa.qry_pe_CD_NOTIFY2,
                  'Importador', 38, 'SELECT * FROM TEMPRESA_EST WHERE IN_IMPORTADOR = 1 AND IN_ATIVO = 1','TQuery');

  {Agente de Carga}
  If dblkcbox_notificado2.KeyValue = 1 then
     Cons_On_line( 'DBBROKER', 'TEMPRESA_EST',
                   datm_pe_capa.qry_pe_CD_NOTIFY2,
                   'Agente', 38, 'SELECT * FROM TEMPRESA_EST WHERE IN_AGENTE = 1 AND IN_ATIVO = 1','TQuery');

  {Transportadora}
  If dblkcbox_notificado2.KeyValue = 2 then
     Cons_On_line( 'DBBROKER', 'TTRANSPORTADOR_ITL',
                   datm_pe_capa.qry_pe_CD_NOTIFY2,
                   'Transportadora', 1, '','TQuery');

  {Banco}
  If dblkcbox_notificado2.KeyValue = 3 then
     Cons_On_line( 'DBBROKER', 'TEMPRESA_EST',
                   datm_pe_capa.qry_pe_CD_NOTIFY2,
                   'Banco', 38, 'SELECT * FROM TEMPRESA_EST WHERE IN_BANCO = 1 AND IN_ATIVO = 1','TQuery');

  {Despachante}
  If dblkcbox_notificado2.KeyValue = 4 then
     Cons_On_line( 'DBBROKER', 'TDESPACHANTE',
                   datm_pe_capa.qry_pe_CD_NOTIFY2,
                   'Despachante', 41, '', 'TQuery');

end;

procedure Tfrm_pe_capa.dbedt_cd_consignatarioExit(Sender: TObject);
begin
  Valida_Exit( 1 );
end;

procedure Tfrm_pe_capa.Valida_Exit( nNum:Integer );
begin

  if datm_PE_Capa.qry_pe_.State in [dsEdit,dsInsert] then
  begin
    if nNum = 1 then
    begin
      ValCodigo( dbedt_cd_consignatario, dbedt_cd_consignatario.MaxLength );
      if dbedt_cd_consignatario.Text <> '' then
      begin
        if ( dbedt_nm_consignatario.Text = '' ) then
        begin
          BoxMensagem('Código do Consignatário inválido!',2);
          pgctrl_pe_capa.ActivePage := tbsht_capa_03;
          dbedt_cd_consignatario.SetFocus;
          Exit;
        end;
      end;
    end;

    if nNum = 2 then
    begin
      ValCodigo( dbedt_cd_notificado1, dbedt_cd_notificado1.MaxLength );
      if dbedt_cd_notificado1.Text <> '' then
      begin
        if ( dbedt_nm_notificado1.Text = '' ) then
        begin
          BoxMensagem('Código do Notificado-1 inválido!',2);
          pgctrl_pe_capa.ActivePage := tbsht_capa_03;
          dbedt_cd_notificado1.SetFocus;
          Exit;
        end;
      end;
    end;

    if nNum = 3 then
    begin
      ValCodigo( dbedt_cd_notificado2, dbedt_cd_notificado2.MaxLength );
      if dbedt_cd_notificado2.Text <> '' then
      begin
        if ( dbedt_nm_notificado2.Text = '' ) then
        begin
          BoxMensagem('Código do Notificado-2 inválido!',2);
          pgctrl_pe_capa.ActivePage := tbsht_capa_03;
          dbedt_cd_notificado2.SetFocus;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_pe_capa.Muda_Lookup_Nm( nNum:Integer; nTp : Integer );
begin
  // nNum
  // 1 - Consignatario
  // 2 - Notificado 1
  // 3 - Notificado 2

  // nTp
  // 0 - Importador
  // 1 - Agente de Carga
  // 2 - Transportadora
  // 3 - Banco
  // 4 - Despachante

  // Tamanha para MaxLength
  // Importador = 5
  // Agente = 5
  // Transportadora  = 4
  // Banco = 5
  // Despachante = 3


  If nNum = 1 then
  begin
    If (nTp = 0) or (nTp = 1) or (nTp = 3) then
       dbedt_cd_consignatario.MaxLength := 5;
    If nTp = 2 then
       dbedt_cd_consignatario.MaxLength := 4;
    If nTp = 4 then
       dbedt_cd_consignatario.MaxLength := 3;
  end;

  If nNum = 2 then
  begin
    If (nTp = 0) or (nTp = 1) or (nTp = 3) then
      dbedt_cd_notificado1.MaxLength := 5;
    If nTp = 2 then
      dbedt_cd_notificado1.MaxLength := 4;
    If nTp = 4 then
      dbedt_cd_notificado1.MaxLength := 3;
  end;

  If nNum = 3 then
  begin
    If (nTp = 0) or (nTp = 1) or (nTp = 3) then
      dbedt_cd_notificado2.MaxLength := 5;
    If nTp = 2 then
      dbedt_cd_notificado2.MaxLength := 4;
    If nTp = 4 then
      dbedt_cd_notificado2.MaxLength := 3;
  end;

end;

procedure Tfrm_pe_capa.ValCodigo( dbedit_Codigo : TDbEdit; nNum : Integer );
var
  nLoop, nFim : Byte;
  lDigitouLetras : Boolean;
  nNumero : Double;

begin
  lDigitouLetras := False;
  if dbedit_Codigo.Field.Size = 0 then Exit;

  nFim := Length(Trim(dbedit_Codigo.Text));

  if nFim > 0 then
  begin
    nLoop := 1;
    Repeat
      if Not (dbedit_Codigo.Text[nLoop] In ['0'..'9'] ) then
         lDigitouLetras := True;
      nLoop := nLoop + 1;
    Until (lDigitouLetras) or ( nLoop > nFim );

    { SE O USUÁRIO NÃO DIGITOU LETRAS NO CÓDIGO }
    if Not( lDigitouLetras ) then
    begin
      nNumero := StrToFloat(dbedit_Codigo.Text);
      if Not dbedit_codigo.ReadOnly then
      dbedit_Codigo.field.AsString := StrZero( nNumero, nNum );
    end;

  end;

end;



procedure Tfrm_pe_capa.dbedt_vl_frete_internExit(Sender: TObject);
begin
  If datm_pe_capa.qry_pe_.State in [dsEdit,dsInsert] then
     If datm_pe_capa.qry_pe_VL_FRETE.AsFloat <> vl_old then
        datm_pe_capa.qry_pe_VL_TOT_MCV.AsFloat := (datm_pe_capa.qry_pe_VL_TOT_MCV.AsFloat - vl_old) + StrToFloat( dbedt_vl_frete_intern.Text );
end;

procedure Tfrm_pe_capa.dbedt_vl_seguroExit(Sender: TObject);
begin
  If datm_pe_capa.qry_pe_.State in [dsEdit,dsInsert] then
     If datm_pe_capa.qry_pe_VL_SEGURO.AsFloat <> vl_old then
        datm_pe_capa.qry_pe_VL_TOT_MCV.AsFloat := (datm_pe_capa.qry_pe_VL_TOT_MCV.AsFloat - vl_old) + StrToFloat( dbedt_vl_seguro.Text );
end;

procedure Tfrm_pe_capa.dbedt_vl_frete_internEnter(Sender: TObject);
begin
  vl_old := datm_pe_capa.qry_pe_VL_FRETE.AsFloat;
end;

procedure Tfrm_pe_capa.dbedt_vl_seguroEnter(Sender: TObject);
begin
  vl_old := datm_pe_capa.qry_pe_VL_SEGURO.AsFloat;
end;


procedure Tfrm_pe_capa.dblkcbox_consignatarioClick(Sender: TObject);
begin
  if datm_pe_capa.qry_pe_.State in [dsInsert, dsEdit] then
  begin
    datm_pe_capa.qry_pe_CD_CONSIGNATARIO.AsString := '';
  end;
end;

procedure Tfrm_pe_capa.dblkcbox_notificado1Click(Sender: TObject);
begin
  if datm_pe_capa.qry_pe_.State in [dsInsert, dsEdit] then
  begin
    datm_pe_capa.qry_pe_CD_NOTIFY1.AsString := '';
  end;
end;

procedure Tfrm_pe_capa.dblkcbox_notificado2Click(Sender: TObject);
begin
  if datm_pe_capa.qry_pe_.State in [dsInsert, dsEdit] then
  begin
    datm_pe_capa.qry_pe_CD_NOTIFY2.AsString := '';
  end;
end;

end.



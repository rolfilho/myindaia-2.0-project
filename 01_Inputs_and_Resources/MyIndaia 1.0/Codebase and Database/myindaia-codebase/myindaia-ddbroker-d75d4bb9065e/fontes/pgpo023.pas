(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGPO023.PAS - Gestão do Pedido
DATA:

Manutenção:
Data:
*************************************************************************************************)

unit PGPO023;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Grids, DBGrids, Mask, DBCtrls, ComCtrls, Buttons, DateUtils,
  ExtCtrls, Db, ToolEdit, RXDBCtrl, dbtables, Variants, Funcoes, ConsOnLineEx;

type
  Tfrm_gestao_po = class(TForm)
    pnl_manut_cadastro: TPanel;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_incluir: TSpeedButton;
    menu_manut: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_gestao_po: TPageControl;
    ts_po: TTabSheet;
    mi_manut_proc: TMenuItem;
    btn_proc_realiza: TSpeedButton;
    mi_proc_realiza: TMenuItem;
    ts_analise: TTabSheet;
    btn_excluir: TSpeedButton;
    mi_excluir: TMenuItem;
    ts_gestao: TTabSheet;
    pgctrl_gestao: TPageControl;
    ts_basica: TTabSheet;
    ts_po_item: TTabSheet;
    btn_gestao_po: TSpeedButton;
    pnl_atencao: TPanel;
    Label34: TLabel;
    Bevel1: TBevel;
    dbgrd_nec_li: TDBGrid;
    pnl_necessidade_li: TPanel;
    Label30: TLabel;
    dbedt_item_cliente: TDBEdit;
    Label29: TLabel;
    dbedt_cd_mercadoria: TDBEdit;
    btn_co_mercadoria: TSpeedButton;
    lbl_embalagem: TLabel;
    dbedt_cd_ncm: TDBEdit;
    dbchk_incide_li: TDBCheckBox;
    dbedt_nr_referencia_analise: TDBEdit;
    dbedt_nr_processo_analise: TDBEdit;
    lbl_referencia_2: TLabel;
    lbl_processo_2: TLabel;
    Shape2: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape16: TShape;
    Shape15: TShape;
    Shape14: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape9: TShape;
    Shape1: TShape;
    Shape4: TShape;
    Shape3: TShape;
    Label35: TLabel;
    btn_co_porto_item: TSpeedButton;
    Label36: TLabel;
    btn_co_navio_item: TSpeedButton;
    Label37: TLabel;
    btn_nr_viagem_item: TSpeedButton;
    Label40: TLabel;
    Label42: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    dbtxt_nr_item: TDBText;
    lblTotalItens: TLabel;
    Label33: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    dbtxt_cd_mercadoria: TDBText;
    dbtxt_qt_inicial: TDBText;
    Label47: TLabel;
    dbtxt_nm_area: TDBText;
    edt_nm_porto_item: TEdit;
    edt_nm_navio_item: TEdit;
    dbedt_nr_viagem_item: TDBEdit;
    dbedt_nr_voo_item: TDBEdit;
    dbedt_nr_bl_item: TDBEdit;
    dblckpbox_in_consolidado_item: TDBLookupComboBox;
    dblckpbox_in_urgente_item: TDBLookupComboBox;
    dblckpbox_in_seguro_item: TDBLookupComboBox;
    dbnav_po_item: TDBNavigator;
    dbm_tx_mercadoria: TDBMemo;
    dbedt_cd_porto_item: TDBEdit;
    dbedt_cd_navio_item: TDBEdit;
    Shape5: TShape;
    Label4: TLabel;
    btn_co_contato: TSpeedButton;
    Label5: TLabel;
    btn_co_anl_indaia: TSpeedButton;
    Label6: TLabel;
    btn_co_porto: TSpeedButton;
    Label7: TLabel;
    btn_co_navio: TSpeedButton;
    Label8: TLabel;
    btn_nr_viagem: TSpeedButton;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label32: TLabel;
    btn_co_importador: TSpeedButton;
    Shape6: TShape;
    btnRepassaItens: TSpeedButton;
    edt_nm_contato: TEdit;
    edt_nm_anl_indaia: TEdit;
    edt_nm_porto: TEdit;
    edt_nm_navio: TEdit;
    dbedt_nr_viagem: TDBEdit;
    dbedt_nr_voo: TDBEdit;
    dbedt_nr_ordem: TDBEdit;
    dbedt_nr_bl: TDBEdit;
    dblckpbox_pedido: TDBLookupComboBox;
    dblckpbox_incoterm: TDBLookupComboBox;
    dblckpbox_in_consolidado: TDBLookupComboBox;
    dblckpbox_in_urgente: TDBLookupComboBox;
    dblckpbox_in_seguro: TDBLookupComboBox;
    dbedt_in_cancelado: TDBEdit;
    edt_nm_importador: TEdit;
    ckbox_dados_itens: TCheckBox;
    dbedt_cd_contato: TDBEdit;
    dbedt_cd_anl_indaia: TDBEdit;
    dbedt_cd_importador: TDBEdit;
    dbedt_cd_porto: TDBEdit;
    dbedt_cd_navio: TDBEdit;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Shape8: TShape;
    Shape7: TShape;
    Label2: TLabel;
    btn_co_unid_neg: TSpeedButton;
    Label3: TLabel;
    btn_co_produto: TSpeedButton;
    Label14: TLabel;
    btn_co_cliente: TSpeedButton;
    Label15: TLabel;
    btn_co_servico: TSpeedButton;
    Label16: TLabel;
    Label17: TLabel;
    btn_co_exportador: TSpeedButton;
    Label18: TLabel;
    btn_co_referencia: TSpeedButton;
    lbl_dt_ent_arm: TLabel;
    Label1: TLabel;
    btn_co_area: TSpeedButton;
    Label31: TLabel;
    Label20: TLabel;
    btn_atz_servico: TSpeedButton;
    lbl_atz_servico: TLabel;
    edt_nm_unid_neg: TEdit;
    edt_nm_produto: TEdit;
    edt_nm_cliente: TEdit;
    edt_nm_servico: TEdit;
    edt_nm_modalidade: TEdit;
    edt_nm_exportador: TEdit;
    msk_nr_referencia: TMaskEdit;
    Panel2: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label19: TLabel;
    msk_hr_pedido: TDateTimePicker;
    dbedt_cd_cliente: TDBEdit;
    dbedt_cd_servico: TDBEdit;
    dbedt_cd_exportador: TDBEdit;
    edt_dt_pedido: TDateEdit;
    msk_dt_abertura: TDateEdit;
    msk_hr_abertura: TDateTimePicker;
    Panel4: TPanel;
    Panel5: TPanel;
    msk_nr_processo: TMaskEdit;
    msk_cd_unid_neg: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_area: TEdit;
    dbedt_cd_area: TDBEdit;
    Bevel4: TBevel;
    lbl_referencia_3: TLabel;
    dbedt_nr_referencia_basica: TDBEdit;
    lbl_processo_3: TLabel;
    dbetd_nr_processo_basica: TDBEdit;
    lbl_referencia_4: TLabel;
    dbedt_nr_referencia_item: TDBEdit;
    lbl_processo_4: TLabel;
    dbedt_nr_processo_item: TDBEdit;
    edt_ap_mercadoria: TEdit;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure msk_cd_servicoExit(Sender: TObject);
    procedure msk_cd_exportadorExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_servicoClick(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_proc_realizaClick(Sender: TObject);
    procedure msk_nr_referenciaExit(Sender: TObject);
    procedure dbedt_cd_clienteExit(Sender: TObject);
    procedure dbedt_cd_servicoExit(Sender: TObject);
    procedure dbedt_cd_exportadorExit(Sender: TObject);
    procedure btn_co_contatoClick(Sender: TObject);
    procedure dbedt_cd_contatoExit(Sender: TObject);
    procedure dbedt_cd_anl_indaiaExit(Sender: TObject);
    procedure pgctrl_gestao_poChange(Sender: TObject);
    procedure dbedt_cd_portoExit(Sender: TObject);
    procedure dbedt_cd_navioExit(Sender: TObject);
    procedure dbedt_nr_viagemExit(Sender: TObject);
    procedure btn_co_anl_indaiaClick(Sender: TObject);
    procedure Edita;
    procedure btn_co_portoClick(Sender: TObject);
    procedure pgctrl_gestao_poChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure edt_dt_pedidoChange(Sender: TObject);
    procedure msk_hr_pedidoChange(Sender: TObject);
    procedure btn_co_navioClick(Sender: TObject);
    procedure btn_nr_viagemClick(Sender: TObject);
    procedure dbedt_item_clienteExit(Sender: TObject);
    procedure dbedt_cd_mercadoriaExit(Sender: TObject);
    procedure btn_co_mercadoriaClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbchk_incide_liClick(Sender: TObject);
    procedure dbedt_nr_vooExit(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure dbedt_cd_importadorExit(Sender: TObject);
    procedure btn_co_importadorClick(Sender: TObject);
    procedure pgctrl_gestaoChange(Sender: TObject);
    procedure btn_co_porto_itemClick(Sender: TObject);
    procedure btn_co_navio_itemClick(Sender: TObject);
    procedure btn_nr_viagem_itemClick(Sender: TObject);
    procedure dbedt_cd_porto_itemExit(Sender: TObject);
    procedure dbedt_cd_navio_itemExit(Sender: TObject);
    procedure dbedt_nr_viagem_itemExit(Sender: TObject);
    procedure dbedt_nr_voo_itemExit(Sender: TObject);
    procedure ckbox_dados_itensClick(Sender: TObject);
    procedure btnRepassaItensClick(Sender: TObject);
    procedure btn_gestao_poClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure msk_nr_referenciaClick(Sender: TObject);
    procedure btn_co_referenciaClick(Sender: TObject);
    procedure btn_atz_servicoClick(Sender: TObject);
    procedure dbedt_cd_areaExit(Sender: TObject);
  private
    { Private declarations }
    fAbrindo, in_comprador : Boolean;
    num_processo, num_referencia : String;
    procedure Cancelar;
    procedure VerificaTransporte;
    function Grava : Boolean;
    function Consiste : Boolean;
  public
    { Public declarations }
    pesq_nr_po, pesq_nr_proc : String[18];
    vNaoEntrar, vObrigadoSalvar : Boolean;
    procedure ConfigBotoes(vModoEdicao : Integer);
    procedure LimpaEdits;
    procedure Repassa(const pAction : String);
  end;

var
  frm_gestao_po: Tfrm_gestao_po;
  GrupoCliente, vServicoOld : String;
  GrupoBASF, GrupoBSG : String[3];

implementation

uses PGGP001, PGPO024, PGGP017;

{$R *.DFM}

procedure Tfrm_gestao_po.VerificaTransporte;
begin
  if ConsultaLookUp('TSERVICO','CD_SERVICO',dbedt_cd_servico.Text,'CD_VIA_TRANSPORTE') = '01' then
  begin
    dbedt_cd_navio.Enabled  := True;
    dbedt_nr_viagem.Enabled := True;
    btn_co_navio.Enabled    := True;
    btn_nr_viagem.Enabled   := True;
    dbedt_nr_voo.Enabled    := False;
    dbedt_cd_navio_item.Enabled  := True;
    dbedt_nr_viagem_item.Enabled := True;
    btn_co_navio_item.Enabled    := True;
    btn_nr_viagem_item.Enabled   := True;
    dbedt_nr_voo_item.Enabled    := False;

    dbedt_nr_voo.Color      := clmenu;
    dbedt_cd_navio.Color    := clwhite;
    dbedt_nr_viagem.Color   := clwhite;
    dbedt_nr_voo_item.Color      := clmenu;
    dbedt_cd_navio_item.Color    := clwhite;
    dbedt_nr_viagem_item.Color   := clwhite;


    label7.Font.Color  := clBlack;
    label8.Font.Color  := clBlack;
    label36.Font.Color := clBlack;
    label37.Font.Color := clBlack;
    label11.Font.Color := clGray;
    label40.Font.Color := clGray;
  end
  else
  if ConsultaLookUp('TSERVICO','CD_SERVICO',dbedt_cd_servico.Text,'CD_VIA_TRANSPORTE') = '04' then
  begin
    dbedt_cd_navio.Enabled  := False;
    dbedt_nr_viagem.Enabled := False;
    btn_co_navio.Enabled    := False;
    btn_nr_viagem.Enabled   := False;
    dbedt_nr_voo.Enabled    := True;
    dbedt_cd_navio_item.Enabled  := False;
    dbedt_nr_viagem_item.Enabled := False;
    btn_co_navio_item.Enabled    := False;
    btn_nr_viagem_item.Enabled   := False;
    dbedt_nr_voo_item.Enabled    := True;

    dbedt_nr_voo.Color      := clwhite;
    dbedt_cd_navio.Color    := clmenu;
    dbedt_nr_viagem.Color   := clmenu;
    dbedt_nr_voo_item.Color      := clwhite;
    dbedt_cd_navio_item.Color    := clmenu;
    dbedt_nr_viagem_item.Color   := clmenu;

    label7.Font.Color  := clGray;
    label8.Font.Color  := clGray;
    label36.Font.Color := clGray;
    label37.Font.Color := clGray;
    label11.Font.Color := clBlack;
    label40.Font.Color := clBlack;
  end;
end;

procedure Tfrm_gestao_po.btn_salvarClick(Sender: TObject);
var vRefClienteHabilitacao : Integer;
begin
  with datm_gestao_po do
  begin
//      if Not Consiste then Exit;

    // consistencias
    if RefClienteHabilitacao(msk_cd_unid_neg.Text, msk_cd_produto.Text, dbedt_cd_cliente.Text, 0) = 0 then
    begin
      if pos('/',msk_nr_referencia.text) > 0 then
      begin
        MessageDlg('As referencias para esse cliente não podem conter o caracter "/".', mtError, [mbOK], 0);
        Exit;
      end;
    end;

    vRefClienteHabilitacao := RefClienteHabilitacao(msk_cd_unid_neg.Text, msk_cd_produto.Text, dbedt_cd_cliente.Text, 1);
    if vRefClienteHabilitacao > 0 then
    begin
      if Length(msk_nr_referencia.Text) <> vRefClienteHabilitacao then
      begin
        MessageDlg('As referencias para esse cliente devem ter ' + IntToStr(vRefClienteHabilitacao) + ' caracteres. Verifique se suas referências foram digitadas corretamente.', mtError, [mbOK], 0);
        Exit;
      end;
    end;

    if Not Grava then Exit;
    str_nr_processo := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
  end;
  ConfigBotoes(0);
  if pgctrl_gestao_po.ActivePage = ts_gestao then begin
    btn_incluir.Enabled := False;
    mi_incluir.Enabled  := False;
  end;
  vObrigadoSalvar := False;
end;

function Tfrm_gestao_po.Grava : Boolean;
var
   flt_nr_processo : Double;
   nr_proc : String[18];
   nr_ref : String;
   vInserindo: Boolean;

begin
  Screen.Cursor := crHourGlass;
  nr_ref := Trim( msk_nr_referencia.Text );

  try
    // Pega o número do proximo processo desta unid.neg x produto
    with datm_gestao_po do
    begin

      if pgctrl_gestao_po.ActivePage = ts_gestao then begin

          datm_main.db_broker.StartTransaction;

          if pgctrl_gestao.ActivePage = ts_po_item then begin
            datm_gestao_po.qry_gestao_item_.Post;
            datm_gestao_po.qry_gestao_item_.Close;
            datm_gestao_po.qry_gestao_item_.Prepare;
            datm_gestao_po.qry_gestao_item_.Open;
            ConfigBotoes(0);
            btn_incluir.Enabled := False;
            mi_incluir.Enabled := False;
          end else begin
            datm_gestao_po.qry_processo_.Post;
            ConfigBotoes(0);
          end;

          with TQuery.create(application) do
          begin
            Databasename := 'DBBROKER';
            SQL.Clear;
            SQL.Add('UPDATE TPO SET CD_IMPORTADOR = ''' + dbedt_cd_importador.Text + ''' WHERE NR_PROCESSO = ''' + qry_processo_.FieldByName('NR_REFERENCIA').AsString + '''');
            ExecSQL;
            Free;
          end;

          datm_main.db_broker.Commit;

      end
      else if pgctrl_gestao_po.ActivePage = ts_analise then begin
        if ( datm_gestao_po.qry_nec_li_.State in [ dsInsert, dsEdit ]) then
        begin

          datm_main.db_broker.StartTransaction;

          datm_gestao_po.qry_nec_li_.Post;
          datm_gestao_po.qry_nec_li_.Close;
          datm_gestao_po.qry_nec_li_.Prepare;
          datm_gestao_po.qry_nec_li_.Open;
          ConfigBotoes(0);

          datm_main.db_broker.Commit;

        end;
      end
      else begin

        datm_main.db_broker.StartTransaction;

        nr_proc := qry_processo_.FieldByname('NR_PROCESSO').AsString;
        vInserindo := False;
        if ( qry_processo_.State = dsInsert ) then
        begin
          vInserindo := True;
          qry_ult_processo_.Close;
          qry_ult_processo_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
          qry_ult_processo_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
          if in_comprador then
            qry_ult_processo_.ParamByName('CD_PREFIXO').AsString  := 'IT'
          else qry_ult_processo_.ParamByName('CD_PREFIXO').AsString  := qry_cliente_servico_CD_PREFIXO.AsString;
          qry_ult_processo_.Prepare;
          qry_ult_processo_.Open;

          // Até 2013 o processo é constituído de 4 dígitos, a partir de 2014 é constituído de 6 dígitos
          if YearOf(Date) < 2014 then
          begin
            if ( Copy(qry_ult_processo_ULTIMO.AsString, 8, 4) = '' ) or ( Copy( qry_ult_processo_ULTIMO.AsString, 8, 4 ) = '9999' ) then
              flt_nr_processo := StrToFloat( '0001' )
            else
              flt_nr_processo := StrToFloat( Copy( qry_ult_processo_ULTIMO.AsString, 8, 4 ) ) + 1;

            if in_comprador then
            begin
              nr_proc := msk_cd_unid_neg.Text + msk_cd_produto.Text +
                         'IT' +
                         '-' + FormatFloat( '0000', flt_nr_processo ) +
                         '-' + FormatDateTime('YY', dt_server);
            end
            else
            begin
              nr_proc := msk_cd_unid_neg.Text + msk_cd_produto.Text +
                         qry_cliente_servico_CD_PREFIXO.AsString +
                         '-' + FormatFloat( '0000', flt_nr_processo ) +
                         '-' + FormatDateTime('YY', dt_server)
            end;
          end
          else
          begin
            if (Copy(qry_ult_processo_ULTIMO.AsString, 8, 6) = '' ) or (Copy(qry_ult_processo_ULTIMO.AsString, 8, 4) = '999999') then
              flt_nr_processo := 0001
            else
              flt_nr_processo := StrToFloat(Copy(qry_ult_processo_ULTIMO.AsString, 8, 6)) + 1;

            if in_comprador then
            begin
              nr_proc := msk_cd_unid_neg.Text + msk_cd_produto.Text +
                         'IT' +
                         '-' + FormatFloat('000000', flt_nr_processo) +
                         '-' + FormatDateTime('YY', dt_server);
            end
            else
            begin
              nr_proc := msk_cd_unid_neg.Text + msk_cd_produto.Text +
                         qry_cliente_servico_CD_PREFIXO.AsString +
                         '-' + FormatFloat('000000', flt_nr_processo) +
                         '-' + FormatDateTime('YY', dt_server)
            end;
          end;

          //Caso esteja abrindo um novo processo, precisa passar os dados
          //grava na TPROCESSO
          qry_processo_.FieldByName('NR_PROCESSO').AsString   := nr_proc;
          qry_processo_.FieldByName('CD_UNID_NEG').AsString   := msk_cd_unid_neg.Text;
          qry_processo_.FieldByName('CD_PRODUTO').AsString    := msk_cd_produto.Text;
          qry_processo_.FieldByName('NR_REFERENCIA').AsString := nr_ref;
          qry_processo_.FieldByName('IN_LIBERADO').AsString   := '1';
          qry_processo_.FieldByName('IN_CANCELADO').AsString  := '0';
          qry_processo_.FieldByName('DT_ABERTURA').AsDateTime := Now;

          //Grava na TPO
          if ( qry_po_.State in [dsInsert] ) then
          begin
            qry_po_.FieldByName('NR_PROCESSO').AsString   := qry_processo_.FieldByName('NR_REFERENCIA').AsString;
            qry_po_.FieldByName('DT_ABERTURA').AsDateTime := Now;
            qry_po_.FieldByName('CD_SERVICO').AsString    := dbedt_cd_servico.Text;
          end;
        end;

        //Grava novos/edita valores da TPO
//        if not ( qry_po_.State in [dsEdit,dsInsert] ) then
//          qry_po_.Edit;
//        qry_po_.FieldByName('CD_IMPORTADOR').AsString := dbedt_cd_importador.Text;
//        qry_po_.FieldByName('CD_EXPORTADOR').AsString := dbedt_cd_exportador.Text;
//        qry_po_.FieldByName('CD_AREA').AsString       := dbedt_cd_area.Text;
//        }

        //Grava data e hora do pedido
        qry_processo_.FieldByName('DT_PEDIDO').AsString := edt_dt_pedido.Text + ' ' + TimeToStr(msk_hr_pedido.Time);

//        try
        if qry_po_.state in [dsInsert] then
          qry_po_.Post
        else
        begin
          with TQuery.Create(application) do
          begin
            Databasename := 'DBBROKER';
            SQL.Clear;
            SQL.Add('UPDATE TPO SET CD_EXPORTADOR = :CD_EXPORTADOR,');
            SQL.Add('               CD_AREA = :CD_AREA,');
            SQL.Add('               CD_SERVICO = :CD_SERVICO');
            SQL.Add(' WHERE NR_PROCESSO = ''' + qry_processo_.FieldByName('NR_REFERENCIA').AsString + '''');
            ParamByName('CD_EXPORTADOR').AsString := dbedt_cd_exportador.Text;
            ParamByName('CD_AREA').AsString       := dbedt_cd_area.Text;
            ParamByName('CD_SERVICO').AsString    := dbedt_cd_servico.Text;
            ExecSQL;
            Free;
          end;
        end;

//        except
//          on e:Exception do
//            ShowMessage(e.message);
//        end;

        //Grava processo
        qry_processo_.Post;

        with TQuery.Create(Application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add('UPDATE TESTAGIO_PROCESSO SET NR_PROCESSO_ADM = ''' + nr_proc + ''' WHERE NR_REFERENCIA = ''' + nr_ref + '''');
          ExecSQL;
          Free;
        end;

        datm_main.db_broker.Commit;

        msk_nr_processo.Text := Copy( qry_processo_NR_PROCESSO.AsString, 5, 14);
        msk_dt_abertura.Date := qry_processo_.FieldByname('DT_ABERTURA').AsDateTime;
        msk_hr_abertura.Time := qry_processo_.FieldByname('DT_ABERTURA').AsDateTime;

        if ( vInserindo ) then
        begin
          //atualiza F-UP  - pedido por Rose (01/02/2006)
          with TQuery.Create(Application) do
          begin
            //evento 003 - abertura de processo
            DatabaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('UPDATE TFLP_PO ');
            SQL.Add('   SET DT_REALIZACAO = ' + QuotedStr(qry_processo_.FieldByname('DT_ABERTURA').AsString) + ', ' );
            SQL.Add('       DT_PREVISTA   = ' + QuotedStr(qry_processo_.FieldByname('DT_ABERTURA').AsString));
            SQL.Add(' WHERE CD_EVENTO     = ''003'' ');
            SQL.Add('   AND NR_PROCESSO = ' + QuotedStr(qry_po_NR_PROCESSO.AsString));
            ExecSQL;
            //evento 022 - observações
            SQL.Clear;
            SQL.Add('UPDATE TFLP_PO ');
            SQL.Add('   SET DT_REALIZACAO = ' + QuotedStr(qry_processo_.FieldByname('DT_ABERTURA').AsString) + ', ' );
            SQL.Add('       DT_PREVISTA   = ' + QuotedStr(qry_processo_.FieldByname('DT_ABERTURA').AsString));
            SQL.Add(' WHERE CD_EVENTO     = ''022'' ');
            SQL.Add('   AND NR_PROCESSO = ' + QuotedStr(qry_po_NR_PROCESSO.AsString));
            ExecSQL;
            Free;
          end;

          CloseStoredProc(sp_atz_ev_flp_po);
          sp_atz_ev_flp_po.ParamByName('@nr_processo').AsString  := qry_processo_.FieldByName('NR_REFERENCIA').AsString;
          ExecStoredProc(sp_atz_ev_flp_po);
          CloseStoredProc(sp_atz_ev_flp_po);

        end;

      end;

      dbedt_cd_cliente.Enabled    := True;
      dbedt_cd_servico.Enabled    := False;
      dbedt_cd_exportador.enabled := True;
      btn_co_cliente.Enabled      := True;
      btn_co_servico.Enabled      := True;
      btn_co_exportador.enabled   := True;
      btn_co_area.Enabled         := True;

      msk_cd_unid_neg.Enabled     := False;
      msk_cd_produto.Enabled      := False;
      msk_nr_referencia.Enabled   := True;
      edt_dt_pedido.Enabled       := True;
      msk_hr_pedido.Enabled       := True;
      btn_co_unid_neg.Enabled     := False;
      btn_co_produto.Enabled      := False;

      Grava := True;
   end;
   except
     on E: Exception do
     begin
       with datm_gestao_po do
       begin
         qry_processo_.Cancel;
         qry_po_.Cancel;
         if datm_main.db_broker.InTransaction then
           datm_main.db_broker.Rollback;
         TrataErro(E);
         qry_processo_.Append;
         qry_po_.Append;
         Grava                     := False;
         msk_nr_processo.Text      := '';

         ConfigBotoes(1);

         msk_cd_unid_neg.Enabled   := True;
         msk_cd_produto.Enabled    := True;
         msk_nr_referencia.Enabled := True;
         edt_dt_pedido.Enabled     := True;
         msk_hr_pedido.Enabled     := True;

         btn_co_unid_neg.Enabled   := True;
         btn_co_produto.Enabled    := True;
         btn_co_cliente.Enabled    := True;
         btn_co_servico.Enabled    := True;
       end;
     end;
   end;

   Screen.Cursor := crDefault;
end;

procedure Tfrm_gestao_po.btn_incluirClick(Sender: TObject);
begin
  with datm_gestao_po do
  begin
    pnl_atencao.Visible := False;
    vNaoEntrar          := False;

    // Nova PO
    if pgctrl_gestao_po.ActivePage = ts_po then
    begin
      qry_processo_.Close;
      qry_po_.Close;

      msk_cd_unid_neg.Enabled   := True;
      msk_cd_produto.Enabled    := True;
      msk_nr_referencia.Enabled := True;

      btn_co_unid_neg.Enabled   := True;
      btn_co_produto.Enabled    := True;
      btn_co_referencia.Enabled := True;

      msk_nr_processo.Text      := '';

      if nr_po_gestao = '' then
         msk_nr_referencia.Text := ''
      else
         msk_nr_referencia.Text := nr_po_gestao;

      // traz a unidade e o produto padrao do usuario
      qry_traz_default_.Close;
      qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_traz_default_.Prepare;
      qry_traz_default_.Open;

      // abre usuário
      qry_usuario_.Close;
      qry_usuario_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_usuario_.Prepare;
      qry_usuario_.Open;

      // traz as habilitacoes para o usuario
      qry_usuario_habilitacao_.Close;
      qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_usuario_habilitacao_.Prepare;
      qry_usuario_habilitacao_.Open;

      // abre servico
      qry_servico_.Close;
      qry_servico_.Prepare;
      qry_servico_.Open;

      // abre yes no
      qry_yes_no.Close;
      qry_yes_no.Prepare;
      qry_yes_no.Open;

      // abre incoterm
      qry_incoterm_.Close;
      qry_incoterm_.Prepare;
      qry_incoterm_.Open;

      // abre exportador
      qry_exportador_.Close;
      qry_exportador_.Prepare;
      qry_exportador_.Open;

      // abre tabela tipo pedido
      qry_tp_pedido_.Close;
      qry_tp_pedido_.Prepare;
      qry_tp_pedido_.Open;

      // atribui códigos defaults de unidade e produto
      msk_cd_unid_neg.Text := qry_traz_default_CD_UNID_NEG.AsString;
      msk_cd_produto.Text  := qry_traz_default_CD_PRODUTO.AsString;

      // localiza a unidade x produto
      qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text]), [loCaseInsensitive]);
      edt_nm_unid_neg.Text := qry_usuario_habilitacao_NM_UNID_NEG.AsString;
      edt_nm_produto.Text  := qry_usuario_habilitacao_NM_PRODUTO.AsString;

      //msk_cd_clienteExit(nil);
      //msk_cd_servicoExit(nil);
      //msk_cd_exportadorExit(nil);

      ConfigBotoes(0);
      mi_incluir.Enabled     := False;
      btn_incluir.Enabled    := False;

      edt_dt_pedido.TabOrder := msk_nr_referencia.TabOrder + 1;
      msk_hr_pedido.TabOrder := edt_dt_pedido.TabOrder + 1;
      msk_cd_produto.SetFocus;
    end;

    // Necessidade LI
    if pgctrl_gestao_po.ActivePage = ts_analise then
    begin
      if qry_nec_li_.State in [dsInsert,dsEdit] then
         qry_nec_li_.Cancel;

      dbchk_incide_li.Checked := false;
      qry_nec_li_.Append;
      ConfigBotoes(1);
      dbedt_item_cliente.SetFocus;
    end;
  end;
end;

procedure Tfrm_gestao_po.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_gestao_po.Cancelar;
begin
  with datm_gestao_po do
  begin
    try
      if qry_processo_.State in [dsInsert, dsEdit] then qry_processo_.Cancel;
      if qry_po_.State       in [dsInsert, dsEdit] then qry_po_.Cancel;
      if qry_nec_li_.State   in [dsInsert, dsEdit] then qry_nec_li_.Cancel;
      if qry_gestao_item_.State in [dsInsert, dsEdit] then qry_gestao_item_.Cancel;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;

    if pgctrl_gestao_po.ActivePage = ts_gestao then
    begin
      btn_incluir.Enabled := False;
      mi_incluir.Enabled  := False;
    end;

    {
  with datm_gestao_po do
  begin

    fAbrindo := True;
    edt_dt_pedido.Date := qry_processo_.FieldByname('DT_PEDIDO').AsDateTime;
    msk_hr_pedido.Time := qry_processo_.FieldByname('DT_PEDIDO').AsDateTime;
    ConfigBotoes(0);

    if pgctrl_gestao_po.ActivePage <> ts_gestao then begin
      LimpaEdits;
      fAbrindo := False;
      msk_cd_produto.Clear;
      msk_cd_produto.Enabled    := True;
      msk_nr_referencia.Clear;
      msk_nr_referencia.Enabled := True;
      'qry_processo_.Close;
    end;
  end;
  }
  end;
end;

procedure Tfrm_gestao_po.btn_sairClick(Sender: TObject);
begin
  if vObrigadoSalvar then begin
    MessageDlg('É obrigatório salvar o pedido após uma alteração de serviço !!!', mtError, [mbOK], 0);
    Exit;
  end;
  btn_cancelarClick(nil);
  str_cd_rotina_atalho := '';
  Close;
end;

procedure Tfrm_gestao_po.FormCreate(Sender: TObject);
begin
  vStr_cd_modulo := '18';
  str_cd_rotina  := '1820';

  // Cria o DataModule do Processo
  Application.CreateForm(Tdatm_gestao_po, datm_gestao_po);

//  pesq_nr_po   := nr_po_gestao;
end;

function Tfrm_gestao_po.Consiste;
var
  bAchouHabilitacaoCliente : Boolean;
  bAchouUnidadeProduto     : Boolean;
  bAchouServicoCliente     : Boolean;
  dt_hoje                  : TDate;
  bPropostaVencida         : Boolean;
begin
  Consiste := True;

  with datm_gestao_po do
  begin
    //dados básicos da PO
    if pgctrl_gestao_po.ActivePage = ts_po then
    begin
      // Procura e posiciona
      qry_cliente_habilitacao_.Close;
      qry_cliente_habilitacao_.ParamByName('CD_CLIENTE').AsString  := dbedt_cd_cliente.Text;
      qry_cliente_habilitacao_.Prepare;
      qry_cliente_habilitacao_.Open;

      qry_cliente_servico_.Close;
      qry_cliente_servico_.ParamByName('CD_CLIENTE').AsString  := dbedt_cd_cliente.Text;
      qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
      qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
      qry_cliente_servico_.ParamByName('CD_SERVICO').AsString  := dbedt_cd_servico.Text;
      qry_cliente_servico_.Prepare;
      qry_cliente_servico_.Open;

      bAchouUnidadeProduto     := qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text]), [loCaseInsensitive]);
      bAchouHabilitacaoCliente := qry_cliente_habilitacao_.Locate('CD_CLIENTE;CD_UNID_NEG;CD_PRODUTO', VarArrayOf([dbedt_cd_cliente.Text, msk_cd_unid_neg.Text, msk_cd_produto.Text]), [loCaseInsensitive]);
      in_comprador             := qry_cliente_habilitacao_IN_COMPRADOR.AsBoolean;
      bAchouServicoCliente     := qry_cliente_servico_.Locate('CD_CLIENTE;CD_UNID_NEG;CD_PRODUTO;CD_SERVICO', VarArrayOf([dbedt_cd_cliente.Text, msk_cd_unid_neg.Text, msk_cd_produto.Text, dbedt_cd_servico.Text]), [loCaseInsensitive]);

      // Faz consistência básica
      if ( Trim( msk_cd_unid_neg.Text ) = '' ) then
      begin
        BoxMensagem( 'Campo "Cód. Unid. Neg." deve ser preenchido!', 2 );
        msk_cd_unid_neg.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      if ( Trim( msk_cd_produto.Text ) = '' ) then
      begin
        BoxMensagem( 'Campo "Cód. Produto" deve ser preenchido!', 2 );
        msk_cd_produto.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      if dbedt_cd_cliente.Visible = True then
      begin
        if ( Trim( dbedt_cd_cliente.Text ) = '' ) then
        begin
          BoxMensagem( 'Campo "Cód. Cliente" deve ser preenchido!', 2 );
          dbedt_cd_cliente.SetFocus;
          Consiste := False;
          Exit;
        end;
      end
      else
      if dbedt_cd_servico.Visible = True then
      begin
        if ( Trim( dbedt_cd_servico.Text ) = '' ) then
        begin
          BoxMensagem( 'Campo "Cód. Serviço" deve ser preenchido!', 2 );
          dbedt_cd_servico.SetFocus;
          Consiste := False;
          Exit;
        end;
      end
      else
      if ( Not bAchouUnidadeProduto ) and ( Not in_comprador ) then
      begin
        BoxMensagem( 'Produto inexistente ou sem habilitação para esta Unidade!', 2 );
        msk_cd_produto.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      if ( Not bAchouHabilitacaoCliente ) and ( Not in_comprador ) then
      begin
        BoxMensagem( 'Cliente inexistente ou sem habilitação para essa Unidade x Produto!', 2 );
        dbedt_cd_cliente.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      if ( Not bAchouServicoCliente ) and ( Not in_comprador ) then
      begin
        BoxMensagem( 'Serviço inexistente ou sem habilitação para o cliente!', 2 );
        dbedt_cd_servico.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      if ( ( Trim( qry_cliente_servico_CD_PREFIXO.AsString ) = '' ) or
           ( qry_cliente_servico_CD_PREFIXO.IsNull ) ) and ( Not in_comprador ) then
      begin
        BoxMensagem( 'Prefixo para abertura do processo não cadastrado!' + #13#10 +
                     'Consulte habilitação do cliente!', 2 );
        dbedt_cd_servico.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      if ( qry_cliente_servico_IN_ATIVO.AsString = '0' ) then
      begin
        BoxMensagem( 'Este serviço para o cliente está desativado, você não conseguirá abrir esse processo', 2 );
        dbedt_cd_servico.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      if ( qry_cliente_habilitacao_IN_ATIVO.AsString = '0' ) and ( Not in_comprador ) then
      begin
        BoxMensagem( 'Habilitação para o cliente está desativada, você não conseguirá abrir esse processo', 2 );
        dbedt_cd_cliente.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      if ( qry_usuario_habilitacao_IN_ATIVO.AsString = '0' ) and ( Not in_comprador ) then
      begin
        BoxMensagem( 'Habilitação da Unidade x Produto está desativada, você não conseguirá abrir esse processo', 2 );
        msk_cd_unid_neg.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      begin
        qry_processo_velho_IN_LIBERADO.AsString := '1';
      end;

      // Atribui data de hoje
      dt_hoje := StrToDate( FormatDateTime( 'dd/mm/yyyy', dt_server ) );

      if ( ( ( qry_cliente_servico_DT_CAPTACAO.Value + qry_cliente_servico_PZ_PROPOSTA.Value ) < dt_hoje ) and
             ( qry_cliente_servico_PZ_PROPOSTA.Value <> 0 ) ) or
         ( qry_cliente_servico_DT_CAPTACAO.IsNull) then
        bPropostaVencida := True
      else
        bPropostaVencida := False;

      // Libera ou nao e atribui código de pendência
      if ( in_comprador ) then
      begin
        if Not BoxMensagem( 'Atenção! Empresa do Tipo Comprador.' + #13#10 +
                            'Processo será aberto como Indent (IT)' + #13#10 +
                            'Registrar mesmo assim?', 1) then
        begin
          Consiste := False;
          Exit;
        end;
      end
      else
      begin
        if ( qry_cliente_habilitacao_IN_RESTRICAO.AsString = '1' ) then
        begin
          if bPropostaVencida then
          begin
            if ( qry_cliente_habilitacao_DT_VALID_CRED_RF.Value < dt_hoje ) then
            begin
              // Restrição e proposta e credenciamento
              if Not BoxMensagem( 'Existe restrição ao cliente e as datas de proposta e de credenciamento estão vencidas! Registrar mesmo assim?', 1 ) then
              begin
                Consiste := False;
                Exit;
              end
              else
              begin
                qry_processo_velho_CD_RESTRICAO.AsString := '7';
                qry_processo_velho_IN_LIBERADO.AsString  := '0';
              end;
            end
            else
            begin
              // Restricao e Proposta
              if Not BoxMensagem('Existe restrição ao cliente e a data da proposta está vencida! Registrar mesmo assim?', 1) then
              begin
                Consiste := False;
                Exit;
              end
              else
              begin
                qry_processo_velho_CD_RESTRICAO.AsString := '4';
                qry_processo_velho_IN_LIBERADO.AsString  := '0';
              end;
            end;
          end
          else
          if ( qry_cliente_habilitacao_DT_VALID_CRED_RF.Value < dt_hoje ) then
          begin
            // Restrição e credenciamento
            if Not BoxMensagem('Existe restrição ao cliente e a data de credenciamento está vencida! Registrar mesmo assim?', 1) then
            begin
              Consiste := False;
              Exit;
            end
            else
            begin
              qry_processo_velho_CD_RESTRICAO.AsString := '5';
              qry_processo_velho_IN_LIBERADO.AsString  := '0';
            end;
          end
          else
          begin
            // Restrição
            if Not BoxMensagem( 'Existe restrição ao cliente! Registrar mesmo assim?', 1) then
            begin
              Consiste := False;
              Exit;
            end
            else
            begin
              qry_processo_velho_CD_RESTRICAO.AsString := '1';
              qry_processo_velho_IN_LIBERADO.AsString  := '0';
            end;
          end
        end
        else
        if bPropostaVencida then
        begin
          if ( qry_cliente_habilitacao_DT_VALID_CRED_RF.Value < dt_hoje ) then
          begin
            // Proposta e Credenciamento
            if Not BoxMensagem( 'As datas da proposta e do credenciamento estão vencidas! Registrar mesmo assim?', 1) then
            begin
              Consiste := False;
              Exit;
            end
            else
            begin
              qry_processo_velho_CD_RESTRICAO.AsString := '6';
              qry_processo_velho_IN_LIBERADO.AsString  := '0';
            end;
          end
          else
          begin
            // Proposta
            if Not BoxMensagem( 'A data da proposta está vencida! Registrar mesmo assim?', 1) then
            begin
              Consiste := False;
              Exit;
            end
            else
            begin
              qry_processo_velho_CD_RESTRICAO.AsString := '2';
              qry_processo_velho_IN_LIBERADO.AsString  := '0';
            end
          end
        end
        else
        if qry_cliente_habilitacao_DT_VALID_CRED_RF.Value < dt_hoje then
        begin
          // Credenciamento
          if Not BoxMensagem('A data do credenciamento está vencida! Registrar mesmo assim?', 1) then
          begin
            Consiste := False;
            Exit;
          end
          else
          begin
            qry_processo_velho_CD_RESTRICAO.AsString := '3';
            qry_processo_velho_IN_LIBERADO.AsString  := '0';
          end;
        end
        else
        begin
          // nenhuma pendência
          qry_processo_velho_IN_LIBERADO.AsString  := '1';
          qry_processo_velho_CD_RESTRICAO.AsString := '0';
        end;
      end;
    end;

    //analise dos itens (necessidade de LI)
    if pgctrl_gestao_po.ActivePage = ts_analise then
    begin
      if ( Not ( qry_nec_li_.State in [dsInsert, dsEdit] ) ) then
      begin
        Consiste := False;
        Exit;
      end
      else
      begin
        if dbedt_cd_mercadoria.Text = '' then
        begin
          BoxMensagem( 'Campo Part Number deve ser preenchido!', 2 );
          dbedt_cd_mercadoria.SetFocus;
          Consiste := False;
          Exit;
        end;

        qry_mercadoria_.Close;
        qry_mercadoria_.ParamByName('CD_MERCADORIA').AsString := dbedt_cd_mercadoria.Text;
        qry_mercadoria_.Prepare;
        qry_mercadoria_.Open;
        If qry_mercadoria_.RecordCount = 0 then
        begin
          BoxMensagem( 'Mercadoria não cadastrada!', 2 );
          dbedt_cd_mercadoria.Text := '';
          dbedt_cd_ncm.Text        := '';
          dbchk_incide_li.Checked  := False;
          Consiste                 := False;
          dbedt_cd_mercadoria.SetFocus;
          Exit;
        end;
      end;
    end;

    //gestão da PO
    if pgctrl_gestao_po.ActivePage = ts_analise then
    begin
      //gestão básica
      if pgctrl_gestao.ActivePage = ts_basica then
      begin

      end;

      //gestão por item  
      if pgctrl_gestao.ActivePage = ts_po_item then
      begin

      end;
    end;
  end;
end;

procedure Tfrm_gestao_po.msk_cd_produtoExit(Sender: TObject);
begin
  ValCodEdt(msk_cd_unid_neg);
  ValCodEdt(msk_cd_produto);
  with datm_gestao_po do
  begin
    if ( msk_cd_unid_neg.Text <> '' ) and ( msk_cd_produto.Text = '' ) then
    begin
      edt_nm_produto.Text    := '';
      if Not ( qry_usuario_habilitacao_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Unidade não encontrada, sem habilitação ou desativada!', 2 );
        msk_cd_unid_neg.Text := '';
        edt_nm_unid_neg.Text := '';
        msk_cd_unid_neg.SetFocus;
      end
      else
      begin
        edt_nm_unid_neg.Text := qry_usuario_habilitacao_NM_UNID_NEG.AsString;
      end;
    end;

    // Verifica se o usuário tem habilitação
    if ( msk_cd_unid_neg.Text = '' ) and ( msk_cd_produto.Text <> '' ) then
    begin
      edt_nm_unid_neg.Text   := '';
      if Not ( qry_usuario_habilitacao_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Produto não encontrado, sem habilitação ou desativado!', 2 );
        msk_cd_produto.Text  := '';
        edt_nm_produto.Text  := '';
        msk_cd_produto.SetFocus;
      end
      else
      begin
        edt_nm_produto.Text  := qry_usuario_habilitacao_NM_PRODUTO.AsString;
      end;
    end;

    // Verifica se existe o Produto na Unidade digitada
    if ( msk_cd_unid_neg.Text <> '' ) and ( msk_cd_produto.Text <> '' ) then
    begin
      if Not ( qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([msk_cd_unid_neg.Text, msk_cd_produto.Text]), [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Unidade x Produto não encontrada, sem habilitação ou desativada!', 2 );
        msk_cd_unid_neg.Text := '';
        edt_nm_unid_neg.Text := '';
        msk_cd_produto.Text  := '';
        edt_nm_produto.Text  := '';
        msk_cd_unid_neg.SetFocus;
      end else begin
        edt_nm_unid_neg.Text := qry_usuario_habilitacao_NM_UNID_NEG.AsString;
        edt_nm_produto.Text  := qry_usuario_habilitacao_NM_PRODUTO.AsString;
      end;
    end;

    if ( msk_cd_unid_neg.Text = '' ) and ( msk_cd_produto.Text = '' ) then
    begin
      edt_nm_unid_neg.Text := '';
      edt_nm_produto.Text  := '';
    end;
  end;

  if msk_nr_referencia.Enabled = True then begin
    msk_cd_produto.Enabled := False;
    msk_nr_referencia.SetFocus;
  end;
end;

procedure Tfrm_gestao_po.msk_cd_clienteExit(Sender: TObject);
begin
  with datm_gestao_po do
  begin
    if dbedt_cd_cliente.Text <> '' then
    begin
      qry_cliente_habilitacao_.Close;
      qry_cliente_habilitacao_.ParamByName('CD_CLIENTE').AsString  := dbedt_cd_cliente.Text;
      qry_cliente_habilitacao_.Prepare;
      qry_cliente_habilitacao_.Open;
      in_comprador := qry_cliente_habilitacao_IN_COMPRADOR.AsBoolean;
      // Verifica se cliente possui habilitação
      if Not ( qry_cliente_habilitacao_.Locate( 'CD_CLIENTE;CD_UNID_NEG;CD_PRODUTO', VarArrayOf([dbedt_cd_cliente.Text, msk_cd_unid_neg.Text, msk_cd_produto.Text] ), [loCaseInsensitive]) ) and
         Not ( in_comprador ) then
      begin
        BoxMensagem( 'Cliente não encontrado ou sem habilitação para essa Unidade x Produto!', 2 );
        edt_nm_cliente.Text  := '';
        if dbedt_cd_cliente.Enabled then dbedt_cd_cliente.SetFocus;
      end
      else
        edt_nm_cliente.Text := qry_cliente_habilitacao_NM_EMPRESA.AsString;
      // Grupo do Cliente
      GrupoCliente := qry_cliente_habilitacao_CD_GRUPO.AsString;
    end
    else
      edt_nm_cliente.Text := '';
  end;
end;

procedure Tfrm_gestao_po.msk_cd_servicoExit(Sender: TObject);
begin
  with datm_gestao_po do
  begin
    if dbedt_cd_servico.Text <> '' then
    begin
      qry_servico_.Close;
      qry_servico_.ParamByName('CD_SERVICO').AsString := dbedt_cd_servico.Text;
      qry_servico_.Prepare;
      qry_servico_.Open;
      if ( qry_servico_.Locate('CD_SERVICO', dbedt_cd_servico.Text, [loCaseInsensitive]) ) and
         ( qry_servico_IN_ATIVO.AsString = '1' ) then
      begin
        qry_cliente_servico_.Close;
        qry_cliente_servico_.ParamByName('CD_CLIENTE').AsString  := dbedt_cd_cliente.Text;
        qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
        qry_cliente_servico_.ParamByName('CD_SERVICO').AsString  := dbedt_cd_servico.Text;
        qry_cliente_servico_.Prepare;
        qry_cliente_servico_.Open;
        if Not ( qry_cliente_servico_.Locate('CD_CLIENTE;CD_UNID_NEG;CD_PRODUTO;CD_SERVICO', VarArrayOf([dbedt_cd_cliente.Text, msk_cd_unid_neg.Text, msk_cd_produto.Text, dbedt_cd_servico.Text]), []) ) and
           Not ( in_comprador ) then
        begin
           BoxMensagem( 'Serviço não encontrado ou sem habilitação para esse cliente!', 2 );
           edt_nm_servico.Text    := '';
           edt_nm_modalidade.Text := '';
           if dbedt_cd_servico.Enabled then dbedt_cd_servico.SetFocus;
        end
        else
        begin
          edt_nm_servico.Text    := qry_servico_NM_SERVICO.AsString;
          edt_nm_modalidade.Text := ConsultaLookup('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', ConsultaLookup('TSERVICO','CD_SERVICO', dbedt_cd_servico.text,'CD_VIA_TRANSPORTE'),'NM_VIA_TRANSP');
        end;
      end
      else
      begin
         BoxMensagem( 'Esse Serviço não está ativo!', 2 );
         edt_nm_servico.Text    := '';
         edt_nm_modalidade.Text := '';
         if dbedt_cd_servico.Enabled then dbedt_cd_servico.SetFocus;
      end;
    end
    else
    begin
      edt_nm_servico.Text    := '';
      edt_nm_modalidade.Text := '';
    end;
  end;
end;

procedure Tfrm_gestao_po.msk_cd_exportadorExit(Sender: TObject);
begin
  with datm_gestao_po do
  begin
    if ( dbedt_cd_exportador.Text <> '' ) then
    begin
      edt_nm_exportador.Text    := '';
      qry_exportador_.Close;
      qry_exportador_.ParamByName('CD_EMPRESA').AsString := dbedt_cd_exportador.Text;
      qry_exportador_.Prepare;
      qry_exportador_.Open;
      if Not ( qry_exportador_.Locate('CD_EMPRESA', dbedt_cd_exportador.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Exportador não cadastrado!', 2 );
        dbedt_cd_exportador.Text := '';
        edt_nm_exportador.Text := '';
        dbedt_cd_exportador.SetFocus;
      end
      else
      begin
        edt_nm_exportador.Text := qry_exportador_NM_EMPRESA.AsString;
      end;
    end;
  end;
end;

procedure Tfrm_gestao_po.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_gestao_po do
  begin
    if str_cd_rotina = '1820' then str_cd_rotina := '';

    cd_unid_neg_gestao := msk_cd_unid_neg.Text;
    cd_prod_gestao     := msk_cd_produto.Text;
    nr_po_gestao       := qry_processo_NR_REFERENCIA.AsString;

    qry_processo_velho_.Close;
    qry_cliente_habilitacao_.Close;
    qry_cliente_servico_.Close;
    qry_usuario_habilitacao_.Close;
    qry_produto_.Close;
    qry_unid_neg_.Close;
    qry_unid_neg_produto_.Close;
    qry_traz_default_.Close;
    qry_ult_processo_.Close;
    qry_servico_.Close;
    qry_exportador_.Close;
    qry_nec_li_.Close;
    qry_processo_.Close;
    qry_po_.Close;
//    qry_po_item_.Close;
    qry_yes_no.Close;
    qry_cliente_contato_.Close;
    qry_navio_.Close;
    qry_porto_.Close;
    qry_viagem_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_gestao_po.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
//    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then exit;
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidades',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',msk_cd_unid_neg.Text,'NM_UNID_NEG');
end;

procedure Tfrm_gestao_po.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
//    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then exit;
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO',msk_cd_produto.Text,'NM_PRODUTO');
end;

procedure Tfrm_gestao_po.btn_co_clienteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_gestao_po.qry_processo_) then exit;
      datm_gestao_po.qry_processo_CD_CLIENTE.Value := ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil)
  end else begin
    edt_nm_cliente.Text := ConsultaLookup('TEMPRESA_NAC','CD_EMPRESA',dbedt_cd_cliente.Text,'NM_EMPRESA');
  end;
end;

procedure Tfrm_gestao_po.btn_co_servicoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_gestao_po.qry_processo_) then Exit;
      datm_gestao_po.qry_processo_CD_SERVICO.Value := ConsultaOnLineExSQL('SELECT CD_SERVICO, NM_SERVICO FROM TSERVICO P WHERE ( P.IN_ATIVO = "1" ) AND P.CD_SERVICO IN ( SELECT S.CD_SERVICO FROM TCLIENTE_SERVICO S WHERE S.CD_CLIENTE = ''' + dbedt_cd_cliente.text + ''' AND S.CD_UNID_NEG = ''' + msk_cd_unid_neg.text + ''' AND CD_PRODUTO = ''' + msk_cd_produto.text + ''' AND S.IN_ATIVO = "1" ) ','Serviços',['CD_SERVICO','NM_SERVICO'],['Código','Nome'],'CD_SERVICO',nil)
  end else begin
    edt_nm_servico.Text    := ConsultaLookup('TSERVICO','CD_SERVICO',dbedt_cd_servico.text,'NM_SERVICO');
    edt_nm_modalidade.Text := ConsultaLookup('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', ConsultaLookup('TSERVICO','CD_SERVICO', dbedt_cd_servico.text,'CD_VIA_TRANSPORTE'),'NM_VIA_TRANSP');
  end;
end;

procedure Tfrm_gestao_po.btn_co_exportadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_gestao_po.qry_processo_) then Exit;
      datm_gestao_po.qry_processo_CD_EXPORTADOR.Value := ConsultaOnLineEx('TEMPRESA_EST','Exportadores',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil)
  end else begin
    edt_nm_exportador.Text := ConsultaLookup('TEMPRESA_EST','CD_EMPRESA',dbedt_cd_exportador.Text,'NM_EMPRESA');
  end;
end;

procedure Tfrm_gestao_po.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    btn_sairClick(nil);
end;

procedure Tfrm_gestao_po.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg      then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = msk_cd_produto       then btn_co_produtoClick(btn_co_produto);
    if Sender = msk_nr_referencia    then btn_co_referenciaClick(btn_co_referencia);
    if Sender = dbedt_cd_cliente     then btn_co_clienteClick(btn_co_cliente);
    if Sender = dbedt_cd_servico     then btn_co_servicoClick(btn_co_servico);
    if Sender = dbedt_cd_exportador  then btn_co_exportadorClick(btn_co_exportador);
    if Sender = dbedt_cd_area        then btn_co_areaClick(btn_co_area);

    If Sender = dbedt_cd_mercadoria  then btn_co_mercadoriaClick(btn_co_mercadoria);

    if Sender = dbedt_cd_contato     then btn_co_contatoClick(btn_co_contato);
    if Sender = dbedt_cd_anl_indaia  then btn_co_anl_indaiaClick(btn_co_anl_indaia);
    if Sender = dbedt_cd_importador  then btn_co_importadorClick(btn_co_importador);
    if Sender = dbedt_cd_porto       then btn_co_portoClick(btn_co_porto);
    if Sender = dbedt_cd_navio       then btn_co_navioClick(btn_co_navio);
    if Sender = dbedt_nr_viagem      then btn_nr_viagemClick(btn_nr_viagem);

    if Sender = dbedt_cd_porto_item  then btn_co_porto_itemClick(btn_co_porto_item);
    if Sender = dbedt_cd_navio_item  then btn_co_navio_itemClick(btn_co_navio_item);
    if Sender = dbedt_nr_viagem_item then btn_nr_viagem_itemClick(btn_nr_viagem_item);
  end;
end;

procedure Tfrm_gestao_po.msk_nr_processoChange(Sender: TObject);
begin
  if ( Trim( msk_nr_processo.Text ) = '' ) then
  begin
    btn_proc_realiza.Enabled := False;
    mi_proc_realiza.Enabled  := False;
    btn_gestao_po.Enabled    := False;
  end
  else
  begin
    btn_proc_realiza.Enabled := True;
    mi_proc_realiza.Enabled  := True;
    btn_gestao_po.Enabled    := True;
  end;
end;

procedure Tfrm_gestao_po.FormShow(Sender: TObject);
begin
  pnl_manut_cadastro.Color := clMenuBroker;
  panel2.Color             := clPnlClaroBroker;
  shape1.brush.Color       := clMenuBroker;
  shape2.brush.Color       := clPnlClaroBroker;
  shape8.Brush.Color       := clMenuBroker;
  dbm_tx_mercadoria.Color  := clPnlClaroBroker;

  pgctrl_gestao_po.ActivePage := ts_po;

  btn_proc_realiza.Visible := frm_main.mi_realizacao_processo.Visible;
  mi_proc_realiza.Visible  := frm_main.mi_realizacao_processo.Visible;
  if mi_manut_proc.Visible   then mi_manut_proc.ShortCut   := TextToShortCut('F2');
  if mi_proc_realiza.Visible then mi_proc_realiza.ShortCut := TextToShortCut('Ctrl+F2');

  // Botões/Menu
  ConfigBotoes(0);

  btn_atz_servico.Visible := ( ( str_cd_cargo = '044' ) or ( str_cd_cargo = '001' ) );
  lbl_atz_servico.Visible := ( ( str_cd_cargo = '044' ) or ( str_cd_cargo = '001' ) );
end;


procedure Tfrm_gestao_po.btn_proc_realizaClick(Sender: TObject);
begin
  if vObrigadoSalvar then begin
    MessageDlg('É obrigatório salvar o pedido após uma alteração de serviço !!!', mtError, [mbOK], 0);
    Exit;
  end;
  // Botão Realização do Processo
  str_cd_rotina_atalho := '1807';
  nr_po_gestao := Trim(msk_nr_referencia.Text);
  nr_processo_gestao := Trim(dbedt_nr_processo_analise.Text);
  Close;
end;

procedure Tfrm_gestao_po.msk_nr_referenciaExit(Sender: TObject);
begin
  if ( msk_nr_referencia.Text = '' ) then
  begin
    msk_nr_referencia.SetFocus;
    Exit;
  end;

  msk_nr_referencia.Enabled := False;

  with datm_gestao_po do
  begin
    qry_processo_.Close;
    qry_processo_.UnPrepare;
    qry_processo_.ParamByName('CD_UNID_NEG').AsString   := Trim( msk_cd_unid_neg.Text );
    qry_processo_.ParamByName('CD_PRODUTO').AsString    := Trim( msk_cd_produto.Text );
    qry_processo_.ParamByName('NR_REFERENCIA').AsString := Trim( msk_nr_referencia.Text );
    qry_processo_.Prepare;
    qry_processo_.Open;

    qry_po_.Close;
    qry_po_.UnPrepare;
    qry_po_.ParamByName('NR_PROCESSO').AsString := Trim( msk_nr_referencia.Text );
    qry_po_.Prepare;
    qry_po_.Open;

    if qry_processo_.RecordCount = 0 then
    begin
      msk_nr_processo.Text        := '';
      msk_dt_abertura.Text        := '';
      msk_hr_abertura.Time        := StrToTime('00:00:00');
      edt_nm_cliente.Text         := '';
      edt_nm_servico.Text         := '';
      edt_nm_modalidade.Text      := '';
      edt_nm_exportador.Text      := '';
      edt_nm_area.Text            := '';
      edt_dt_pedido.Enabled       := True;
      edt_dt_pedido.Date          := Now;
      msk_hr_pedido.Enabled       := True;
      dbedt_cd_cliente.Enabled    := True;
      dbedt_cd_servico.Enabled    := True;
      dbedt_cd_exportador.Enabled := True;
      dbedt_cd_area.Enabled       := True;
      btn_co_cliente.Enabled      := True;
      btn_co_servico.Enabled      := True;
      btn_co_exportador.enabled   := True;
      btn_co_area.Enabled         := True;
      MessageDlg('Não existem dados para esta referência.' + #13#10 + 'O sistema irá criar um novo registro.', mtInformation,[mbOk], 0);
      qry_processo_.Insert;
      qry_processo_.FieldByName('IN_CONSOLIDADO').AsString := '0';
      if qry_po_.RecordCount = 0 then
        qry_po_.Insert
      else qry_po_.Edit;
      dbedt_cd_cliente.SetFocus;
      Exit;
    end;

    if qry_processo_.FieldByName('IN_CANCELADO').AsString = '1' then
    begin
      if MessageDlg('Essa referência está atribuída a um processo cancelado.' + #13#10 +
                    'Deseja desvincular a referência e abrir um novo processo com ela?',
                     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
        msk_nr_processo.Text        := '';
        msk_dt_abertura.Text        := '';
        msk_hr_abertura.Time        := StrToTime('00:00:00');
        edt_nm_cliente.Text         := '';
        edt_nm_servico.Text         := '';
        edt_nm_modalidade.Text      := '';
        edt_nm_exportador.Text      := '';
        edt_nm_area.Text            := '';
        edt_dt_pedido.Enabled       := True;
        edt_dt_pedido.Date          := now;
        msk_hr_pedido.Enabled       := True;
        dbedt_cd_cliente.Enabled    := True;
        dbedt_cd_servico.Enabled    := True;
        dbedt_cd_exportador.Enabled := True;
        dbedt_cd_area.Enabled       := True;
        btn_co_cliente.Enabled      := True;
        btn_co_servico.Enabled      := True;
        btn_co_exportador.Enabled   := True;
        btn_co_area.Enabled         := True;
        Exit;
      end else begin
        with TQuery.Create(Application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQl.Add('UPDATE TPROCESSO SET NR_REFERENCIA = NULL WHERE NR_PROCESSO = ''' + qry_processo_.FieldByName('NR_PROCESSO').AsString + '''');
          ExecSQL;
          Free;
        end;
        msk_nr_referenciaExit(nil);
        Exit;
      end;
    end;

    fAbrindo := True;
    MessageDlg('Já existem dados para esta referência.' + #10#13 + 'Eles serão abertos para consulta/alteração.', mtInformation,[mbOk], 0);
    ConfigBotoes(0);
    edt_dt_pedido.Date          := qry_processo_.FieldByname('DT_PEDIDO').AsDateTime;
    msk_hr_pedido.Time          := qry_processo_.FieldByname('DT_PEDIDO').AsDateTime;
    edt_dt_pedido.Enabled       := True;
    msk_hr_pedido.Enabled       := True;
    fAbrindo := False;
    dbedt_cd_cliente.Enabled    := True;
    btn_co_cliente.Enabled      := True;

    dbedt_cd_servico.Enabled    := true;
    btn_co_servico.Enabled      := true;

    dbedt_cd_exportador.enabled := True;
    btn_co_exportador.enabled   := True;
    btn_co_area.Enabled         := True;

    edt_nm_modalidade.Text := ConsultaLookup('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', ConsultaLookup('TSERVICO','CD_SERVICO', dbedt_cd_servico.text,'CD_VIA_TRANSPORTE'),'NM_VIA_TRANSP');

    msk_nr_processo.Text := Copy( qry_processo_NR_PROCESSO.AsString, 5, 10 );
    msk_dt_abertura.Date := qry_processo_DT_ABERTURA.AsDatetime;
    msk_hr_abertura.Time := qry_processo_DT_ABERTURA.AsDatetime;
    num_processo   := qry_processo_NR_PROCESSO.AsString;
    num_referencia := qry_processo_NR_REFERENCIA.AsString;

    if qry_processo_.state in [dsEdit, dsInsert] then
      qry_processo_.Post;

    vServicoOld := dbedt_cd_servico.Text;
    dbedt_cd_exportadorExit(nil);
    dbedt_cd_clienteExit(nil);
  end;
end;

procedure Tfrm_gestao_po.dbedt_cd_clienteExit(Sender: TObject);
begin
  ValidCodigo( dbedt_cd_cliente );
end;

procedure Tfrm_gestao_po.dbedt_cd_servicoExit(Sender: TObject);
begin
  ValidCodigo( dbedt_cd_servico );
  with datm_gestao_po do
  begin
    if dbedt_cd_servico.Text <> '' then
    begin
      qry_servico_.Close;
      qry_servico_.ParamByName('CD_SERVICO').AsString := dbedt_cd_servico.Text;
      qry_servico_.Prepare;
      qry_servico_.Open;
      if ( qry_servico_.Locate('CD_SERVICO', dbedt_cd_servico.Text, [loCaseInsensitive]) ) and
         ( qry_servico_IN_ATIVO.AsString = '1' ) then
      begin
        qry_cliente_servico_.Close;
        qry_cliente_servico_.ParamByName('CD_CLIENTE').AsString  := dbedt_cd_cliente.Text;
        qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
        qry_cliente_servico_.ParamByName('CD_SERVICO').AsString  := dbedt_cd_servico.Text;
        qry_cliente_servico_.Prepare;
        qry_cliente_servico_.Open;
        if Not ( qry_cliente_servico_.Locate('CD_CLIENTE;CD_UNID_NEG;CD_PRODUTO;CD_SERVICO', VarArrayOf([dbedt_cd_cliente.Text, msk_cd_unid_neg.Text, msk_cd_produto.Text, dbedt_cd_servico.Text]), []) ) and
           Not ( in_comprador ) then
        begin
           BoxMensagem( 'Serviço não encontrado ou sem habilitação para esse cliente!', 2 );
           edt_nm_servico.Text    := '';
           edt_nm_modalidade.Text := '';
           if dbedt_cd_servico.Enabled then dbedt_cd_servico.SetFocus;
        end
        else
        begin
          edt_nm_servico.Text    := qry_servico_NM_SERVICO.AsString;
          edt_nm_modalidade.Text := ConsultaLookup('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', ConsultaLookup('TSERVICO','CD_SERVICO', dbedt_cd_servico.text,'CD_VIA_TRANSPORTE'),'NM_VIA_TRANSP');
        end;
      end
      else
      begin
         BoxMensagem( 'Esse Serviço não está ativo!', 2 );
         edt_nm_servico.Text    := '';
         edt_nm_modalidade.Text := '';
         if dbedt_cd_servico.Enabled then dbedt_cd_servico.SetFocus;
      end;
    end
    else
    begin
      edt_nm_servico.Text    := '';
      edt_nm_modalidade.Text := '';
    end;

    if Trim(dbedt_cd_servico.Text) <> vServicoOld then
    begin
      lbl_atz_servico.visible := true;
      btn_atz_servico.Enabled := true;
    end
    else
    begin
      lbl_atz_servico.visible := false;
      btn_atz_servico.Enabled := false;
    end;

  end;
end;

procedure Tfrm_gestao_po.dbedt_cd_exportadorExit(Sender: TObject);
begin
  ValidCodigo( dbedt_cd_exportador );
end;

procedure Tfrm_gestao_po.btn_co_contatoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_gestao_po.qry_processo_) then Exit;
    datm_gestao_po.qry_processo_CD_ANALISTA_CLIENTE.Value := ConsultaOnLineExSQL('SELECT CD_USUARIO, NM_USUARIO, NM_EMAIL FROM TUSUARIO WHERE CD_CARGO = ''040'' AND IN_ATIVO = ''1''','Contatos',['CD_USUARIO','NM_USUARIO','NM_EMAIL'],['Código','Nome','Email'],'CD_USUARIO',nil);
  end
  else
    edt_nm_contato.Text := ConsultaLookup('TUSUARIO','CD_USUARIO',dbedt_cd_contato.text,'NM_USUARIO');
end;

procedure Tfrm_gestao_po.dbedt_cd_contatoExit(Sender: TObject);
begin
  if Trim( dbedt_cd_contato.Text ) = '' then
  begin
    edt_nm_contato.Text := '';
    Exit;
  end;
  ValidCodigo( dbedt_cd_contato );
end;

procedure Tfrm_gestao_po.dbedt_cd_anl_indaiaExit(Sender: TObject);
begin
  if Trim( dbedt_cd_anl_indaia.Text ) = '' then
  begin
    edt_nm_anl_indaia.Text := '';
    Exit;
  end;

  ValidCodigo( dbedt_cd_anl_indaia );
  with datm_gestao_po do
  begin
    if ( dbedt_cd_anl_indaia.Text <> '' ) then
    begin
      edt_nm_anl_indaia.Text    := '';
      qry_usuario_.Close;
      qry_usuario_.ParamByName('CD_USUARIO').AsString := Trim(dbedt_cd_anl_indaia.Text);
      qry_usuario_.Prepare;
      qry_usuario_.Open;
      if Not ( qry_usuario_.Locate('CD_USUARIO', dbedt_cd_anl_indaia.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Analista não cadastrado!', 2 );
        dbedt_cd_anl_indaia.Text := '';
        edt_nm_anl_indaia.Text := '';
        dbedt_cd_anl_indaia.SetFocus;
      end
      else
      begin
        edt_nm_anl_indaia.Text := qry_usuario_NM_USUARIO.AsString;
      end;
    end;
  end;
end;

procedure Tfrm_gestao_po.pgctrl_gestao_poChange(Sender: TObject);
begin
  with datm_gestao_po do
  begin
    ConfigBotoes(0);
    // PO
    if pgctrl_gestao_po.ActivePage = ts_po then
    begin
      dbedt_cd_clienteExit(nil);
      dbedt_cd_servicoExit(nil);
      dbedt_cd_exportadorExit(nil);
      dbedt_cd_areaExit(nil);
    end;

    // Analise
    if pgctrl_gestao_po.ActivePage = ts_analise then
    begin
      qry_nec_li_.Close;
      qry_nec_li_.ParamByName('NR_PROCESSO').AsString   := qry_processo_NR_PROCESSO.AsString;
      qry_nec_li_.ParamByName('NR_REFERENCIA').AsString := qry_processo_NR_REFERENCIA.AsString;
      qry_nec_li_.Prepare;
      qry_nec_li_.Open;
    end;

    // Gestão
    if pgctrl_gestao_po.ActivePage = ts_gestao then
    begin
      pgctrl_gestao.ActivePage := ts_basica;
      dbedt_cd_contatoExit(nil);
      dbedt_cd_anl_indaiaExit(nil);
      dbedt_cd_importadorExit(nil);
      dbedt_cd_portoExit(nil);
      dbedt_cd_navioExit(nil);
      dbedt_nr_viagemExit(nil);
      btn_incluir.Enabled := False;
      mi_incluir.Enabled  := False;
      VerificaTransporte;
    end;
  end;
end;

procedure Tfrm_gestao_po.dbedt_cd_portoExit(Sender: TObject);
begin
  if Trim( dbedt_cd_porto.Text ) = '' then
  begin
    edt_nm_porto.Text := '';
    Exit;
  end;

  ValidCodigo( dbedt_cd_porto );
  with datm_gestao_po do
  begin
    if ( dbedt_cd_porto.Text <> '' ) then
    begin
      edt_nm_porto.Text    := '';
      qry_porto_.Close;
      qry_porto_.ParamByName('CODIGO').AsString := dbedt_cd_porto.Text;
      qry_porto_.Prepare;
      qry_porto_.Open;
      if Not ( qry_porto_.Locate('CODIGO', dbedt_cd_porto.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Local de Desembarque não cadastrado!', 2 );
        dbedt_cd_porto.Text := '';
        edt_nm_porto.Text   := '';
        dbedt_cd_porto.SetFocus;
      end
      else
        edt_nm_porto.Text   := qry_porto_DESCRICAO.AsString;
    end;
  end;
end;

procedure Tfrm_gestao_po.dbedt_cd_navioExit(Sender: TObject);
begin
  if Trim( dbedt_cd_navio.Text ) = '' then
  begin
    edt_nm_navio.Text    := '';
    Exit;
  end;

  ValidCodigo( dbedt_cd_navio );
  with datm_gestao_po do
  begin
    if ( dbedt_cd_navio.Text <> '' ) then
    begin
      edt_nm_navio.Text    := '';
      qry_navio_.Close;
      qry_navio_.ParamByName('CD_EMBARCACAO').AsString := dbedt_cd_navio.Text;
      qry_navio_.Prepare;
      qry_navio_.Open;
      if Not ( qry_navio_.Locate('CD_EMBARCACAO', dbedt_cd_navio.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Navio não cadastrado!', 2 );
        dbedt_cd_navio.Text := '';
        edt_nm_navio.Text := '';
        dbedt_cd_navio.SetFocus;
      end
      else
        edt_nm_navio.Text := qry_navio_NM_EMBARCACAO.AsString;
    end;
  end;
end;

procedure Tfrm_gestao_po.dbedt_nr_viagemExit(Sender: TObject);
begin
  if Trim( dbedt_nr_viagem.Text ) <> '' then
  begin
    if ( Trim( dbedt_cd_porto.Text ) = '' ) then
    begin
      BoxMensagem( 'Verifique o Porto !', 2 );
      dbedt_cd_porto.SetFocus;
      Exit;
    end;
    
    if ( Trim( dbedt_cd_navio.Text ) = '' ) then
    begin
      BoxMensagem( 'Verifique o Navio !', 2 );
      dbedt_cd_navio.SetFocus;
      Exit;
    end;

    //ValidCodigo( dbedt_nr_viagem );
    with datm_gestao_po do
    begin
      qry_viagem_.Close;
      qry_viagem_.ParamByName('CD_UNID_NEG').AsString   := msk_cd_unid_neg.Text;
      qry_viagem_.ParamByName('CD_PRODUTO').AsString    := msk_cd_produto.Text;
      qry_viagem_.ParamByName('CD_EMBARCACAO').AsString := dbedt_cd_navio.Text;
      qry_viagem_.ParamByName('CD_LOCAL').AsString      := dbedt_cd_porto.Text;
      qry_viagem_.ParamByName('NR_VIAGEM').AsString     := dbedt_nr_viagem.Text;
      qry_viagem_.Prepare;
      qry_viagem_.Open;
      if qry_viagem_.RecordCount = 0 then
      begin
        BoxMensagem( 'Nº da Viagem inválido!', 2 );
        dbedt_nr_viagem.SetFocus;
      end
      else qry_viagem_.Close;
    end;
  end;
end;

procedure Tfrm_gestao_po.btn_co_anl_indaiaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_gestao_po.qry_processo_) then exit;
    datm_gestao_po.qry_processo_CD_ANALISTA_COMISSARIA.Value := ConsultaOnLineExSQL('SELECT CD_USUARIO, NM_USUARIO, NM_EMAIL FROM TUSUARIO WHERE CD_CARGO <> ''040''','Analistas Indaiá',['CD_USUARIO','NM_USUARIO','NM_EMAIL'],['Código','Nome','Email'],'CD_USUARIO',nil);
  end
  else
    edt_nm_anl_indaia.Text := ConsultaLookup('TUSUARIO','CD_USUARIO',dbedt_cd_anl_indaia.text,'NM_USUARIO');
end;

procedure Tfrm_gestao_po.Edita;
begin
  btn_salvar.Enabled   := True;
  btn_cancelar.Enabled := True;
end;

procedure Tfrm_gestao_po.btn_co_portoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_gestao_po.qry_processo_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_gestao_po.qry_processo_CD_LOCAL_DESEMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil)
  end
  else
    edt_nm_porto.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_porto.Text,'DESCRICAO');
end;

procedure Tfrm_gestao_po.pgctrl_gestao_poChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if vObrigadoSalvar then begin
    MessageDlg('É obrigatório salvar o pedido após uma alteração de serviço !!!', mtError, [mbOK], 0);
    AllowChange := False;
    Exit;
  end;

{  if ( pgctrl_gestao_po.ActivePage = TabSheet1 ) or ( pgctrl_gestao_po.ActivePage = TabSheet2 ) then begin
    AllowChange := ( datm_gestao_po.qry_po_.State = dsBrowse );
    if datm_gestao_po.qry_po_.State in [dsEdit,dsInsert] then
      MessageDlg('Salve as alterações antes de mudar a guia.', mtInformation,[mbOk], 0)
    else if datm_gestao_po.qry_po_.State in [dsInactive] then
      MessageDlg('Digite uma referência para que o sistema possa trazer os' + #13#10 + 'dados na tela ou criar um novo registro.', mtInformation,[mbOk], 0);
  end
  else
  if ( pgctrl_gestao_po.ActivePage = TabSheet3 ) then begin
    AllowChange := ( datm_gestao_po.qry_nec_li_.State = dsBrowse );
    if not AllowChange then
      MessageDlg('Salve as alterações antes de mudar a guia.', mtInformation,[mbOk], 0)
  end; }

  AllowChange := ( datm_gestao_po.qry_processo_.State <> dsInactive );
  if not AllowChange then
    MessageDlg('Digite uma referência para que o sistema possa trazer os' + #13#10 + 'dados na tela ou criar um novo registro.', mtInformation,[mbOk], 0);
end;

procedure Tfrm_gestao_po.edt_dt_pedidoChange(Sender: TObject);
begin
  if not ( fAbrindo ) and not ( datm_gestao_po.qry_processo_.state in [dsEdit,dsInsert] ) then
    datm_gestao_po.qry_processo_.Edit;
  ConfigBotoes(1);
end;

procedure Tfrm_gestao_po.msk_hr_pedidoChange(Sender: TObject);
begin
  if not ( fAbrindo ) and not ( datm_gestao_po.qry_processo_.state in [dsEdit,dsInsert] ) then
    datm_gestao_po.qry_processo_.Edit;
  ConfigBotoes(1);
end;

procedure Tfrm_gestao_po.ConfigBotoes(vModoEdicao : Integer);
begin
  mi_incluir.Enabled   := ( vModoEdicao = 0 );
  btn_incluir.Enabled  := ( vModoEdicao = 0 );
  mi_salvar.Enabled    := ( vModoEdicao = 1 );
  btn_salvar.Enabled   := ( vModoEdicao = 1 );
  mi_cancelar.Enabled  := ( vModoEdicao = 1 );
  btn_cancelar.Enabled := ( vModoEdicao = 1 );
  btn_excluir.Enabled  := ( pgctrl_gestao_po.ActivePage = ts_analise );
  mi_excluir.Enabled   := btn_excluir.Enabled;
end;

procedure Tfrm_gestao_po.btn_co_navioClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_gestao_po.qry_processo_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_gestao_po.qry_processo_CD_EMBARCACAO.AsString := ConsultaOnLineEx('TEMBARCACAO','Embarcação',['CD_EMBARCACAO','NM_EMBARCACAO'],['Código','Nome'],'CD_EMBARCACAO',nil)
  end
  else
    edt_nm_navio.Text := ConsultaLookUP('TEMBARCACAO','CD_EMBARCACAO',dbedt_cd_navio.Text,'NM_EMBARCACAO');
end;

procedure Tfrm_gestao_po.btn_nr_viagemClick(Sender: TObject);
begin
  with datm_gestao_po do
  begin
    if Trim( dbedt_cd_navio.Text ) = '' then
    begin
      BoxMensagem( 'Informe uma Embarcação', 3 );
      dbedt_cd_navio.SetFocus;
      Exit;
    end;
    if not PoeEmEdicao(datm_gestao_po.qry_processo_) then Exit;

    qry_processo_NR_VIAGEM.AsString := ConsultaOnLineExSQL(
      'SELECT V.NR_VIAGEM, V.DT_ESPERADA, V.DT_ENT, E.DESCRICAO, A.NM_ARMAZEM, V.NR_MANIFESTO ' +
      'FROM   TVIAGEM V ( NOLOCK ), TARMAZEM A ( NOLOCK ), TLOCAL_EMBARQUE E ( NOLOCK ) ' +
      'WHERE V.CD_UNID_NEG           = ' + QuotedStr(msk_cd_unid_neg.Text) +
      '  AND V.CD_PRODUTO            = ' + QuotedStr(msk_cd_produto.Text)  +
      '  AND V.CD_EMBARCACAO         = ' + QuotedStr(dbedt_cd_navio.Text)  +
      '  AND V.CD_ARMAZEM_ATRACACAO *= A.CD_ARMAZEM ' +
      '  AND V.CD_LOCAL              = E.CODIGO ',
      'Viagens', ['NR_VIAGEM', 'DT_ESPERADA', 'DT_ENT', 'DESCRICAO.','NM_ARMAZEM','NR_MANIFESTO'],
      ['Viagem', 'Dt. Esperada', 'Dt. Entrada', 'Local Desemb.','Arm. Atracação','Nº Manifesto'], 'NR_VIAGEM', frm_main.mi_gp_ga_cad_viagem);
  end;
end;

procedure Tfrm_gestao_po.LimpaEdits;
var
  i : integer;
begin
  for i := 0 to ComponentCount-1 do
    if Components[i] is TEdit then
      TEdit(Components[i]).Clear;
end;

procedure Tfrm_gestao_po.dbedt_item_clienteExit(Sender: TObject);
begin
  if datm_gestao_po.qry_nec_li_.state = dsbrowse then
    exit;
  if ( dbedt_item_cliente.Text = '' ) then
  begin
    BoxMensagem( 'Ítem - campo obrigatório!', 2 );
    dbedt_item_cliente.Text := '';
    dbedt_item_cliente.SetFocus;
  end
  else
    ValidCodigo( dbedt_item_cliente );
end;

procedure Tfrm_gestao_po.dbedt_cd_mercadoriaExit(Sender: TObject);
begin
  if datm_gestao_po.qry_nec_li_.state = dsbrowse then
    Exit;

  if ( dbedt_cd_mercadoria.Text = '' ) then
  begin
    BoxMensagem( 'Digite o Part Number!', 2 );
    dbedt_cd_mercadoria.Text := '';
    dbedt_cd_mercadoria.SetFocus;
    Exit
  end;

  with datm_gestao_po do
  begin
    qry_mercadoria_.Close;
    qry_mercadoria_.ParamByName('CD_MERCADORIA').AsString := dbedt_cd_mercadoria.Text;
    qry_mercadoria_.Prepare;
    qry_mercadoria_.Open;
    If qry_mercadoria_.RecordCount = 0 then
    begin
      BoxMensagem( 'Mercadoria não cadastrada!', 2 );
      dbedt_cd_mercadoria.Text := '';
      dbedt_cd_ncm.Text := '';
      dbedt_cd_mercadoria.SetFocus;
    end
    else
    begin
      dbedt_cd_ncm.Text := qry_mercadoria_CD_NCM_SH.AsString;
      dbchk_incide_li.Checked := ( qry_mercadoria_IN_NECESSITA_LI.AsString = 'True' );
    end;
    dbchk_incide_li.SetFocus;
  end;
end;

procedure Tfrm_gestao_po.btn_co_mercadoriaClick(Sender: TObject);
var vImportador, vGrupo : string;
    vListAux: TStringList;
begin
  with datm_gestao_po do
  begin
    if Sender is TSpeedButton then
    begin
      if not PoeEmEdicao(qry_nec_li_) then Exit;
      vImportador := qry_processo_CD_IMPORTADOR.AsString;
      vGrupo      := ConsultaLookup('TEMPRESA_NAC', 'CD_EMPRESA', vImportador, 'CD_GRUPO');
      vListAux := TStringList.Create;
      vListAux.Add('SELECT CD_MERCADORIA,AP_MERCADORIA,CD_NCM_SH, CD_AREA, CONVERT(DECIMAL(16,2),VL_UNITARIO)VL_UNITARIO,');
      vListAux.Add('       (CASE WHEN IN_NECESSITA_LI = 1 THEN ''Sim'' ELSE ''Não'' END) LI');
      vListAux.Add('FROM   TMERCADORIA ');
      if (vImportador <> '') or (vGrupo <> '') then
        vListAux.Add('WHERE  ( ( CD_IMPORTADOR = ''' + vImportador + ''' AND ''' + vImportador + ''' <> '''' ) OR ( CD_GRUPO = ''' + vGrupo + ''' AND ''' + vGrupo + ''' <> '''') )');
      //ShowMessage(vListAux.Text);
      qry_nec_li_CD_MERCADORIA.AsString := ConsultaOnLineExSQLList(vListAux,'Mercadorias',['CD_MERCADORIA','AP_MERCADORIA', 'CD_NCM_SH', 'CD_AREA', 'VL_UNITARIO', 'LI'],['Código','Nome', 'NCM', 'Área', 'Valor Unitário', 'Incide LI'], 'CD_MERCADORIA', frm_main.mi_cad_merc);
      vListAux.Free;
    end
    else
      edt_ap_mercadoria.Text := ConsultaLookUP('TMERCADORIA','CD_MERCADORIA',dbedt_cd_mercadoria.Text,'AP_MERCADORIA');
  end;
end;

procedure Tfrm_gestao_po.btn_excluirClick(Sender: TObject);
begin
  if pgctrl_gestao_po.ActivePage = ts_analise then
  begin
    if BoxMensagem( 'Este item será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
//      datm_main.db_broker.StartTransaction;
      datm_gestao_po.qry_nec_li_.Delete;
//      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_gestao_po.qry_nec_li_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_gestao_po.dbchk_incide_liClick(Sender: TObject);
begin
  if ( datm_gestao_po.qry_nec_li_.State in [ dsInsert, dsEdit ] ) then
  begin
    ConfigBotoes(1);
  end;
end;

procedure Tfrm_gestao_po.dbedt_nr_vooExit(Sender: TObject);
begin
  if ( Trim( dbedt_nr_voo.Text ) <> '' ) then
  begin
    dbedt_cd_porto.Color  := clMenu;
    dbedt_cd_navio.Color  := clMenu;
    dbedt_nr_viagem.Color := clMenu;
    btn_co_porto.Enabled  := False;
    btn_co_navio.Enabled  := False;
    btn_nr_viagem.Enabled := False;
  end
  else
  begin
    dbedt_cd_porto.Color  := clWindow;
    dbedt_cd_navio.Color  := clWindow;
    dbedt_nr_viagem.Color := clWindow;
    btn_co_porto.Enabled  := True;
    btn_co_navio.Enabled  := True;
    btn_nr_viagem.Enabled := True;
  end;
end;

procedure Tfrm_gestao_po.btn_co_areaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_gestao_po.qry_processo_) then Exit;
    datm_gestao_po.qry_processo_CD_AREA.AsString := ConsultaOnLineEx('TAREA','Áreas',['CD_AREA','NM_AREA'],['Código','Área'],'CD_AREA',nil);
  end
  else
    edt_nm_area.Text := ConsultaLookUp('TAREA','CD_AREA', dbedt_cd_area.Text,'NM_AREA');
end;

procedure Tfrm_gestao_po.dbedt_cd_importadorExit(Sender: TObject);
begin
  ValidCodigo( dbedt_cd_importador );
end;

procedure Tfrm_gestao_po.btn_co_importadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_gestao_po.qry_processo_) then Exit;
    datm_gestao_po.qry_processo_CD_IMPORTADOR.AsString := ConsultaOnLineEx('TEMPRESA_NAC','Importadores',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil);
  end
  else
    edt_nm_importador.Text := ConsultaLookUp('TEMPRESA_NAC','CD_EMPRESA', dbedt_cd_importador.Text,'NM_EMPRESA');
end;

procedure Tfrm_gestao_po.pgctrl_gestaoChange(Sender: TObject);
begin
  with datm_gestao_po do
  begin
    ConfigBotoes(0);
    // Gestão básica
    if pgctrl_gestao.ActivePage = ts_basica then
    begin
      dbedt_cd_contatoExit(nil);
      dbedt_cd_anl_indaiaExit(nil);
      dbedt_cd_importadorExit(nil);
      dbedt_cd_portoExit(nil);
      dbedt_cd_navioExit(nil);
      dbedt_nr_viagemExit(nil);
      btn_incluir.Enabled := False;
      mi_incluir.Enabled  := False;
      VerificaTransporte;
    end;

    // Gestão Itens da PO
    if pgctrl_gestao.ActivePage = ts_po_item then
    begin
      //abre a tabela com os itens da gestão.
      qry_gestao_item_.Close;
      qry_gestao_item_.ParamByName('NR_PROCESSO').AsString := msk_nr_referencia.Text;
      qry_gestao_item_.Prepare;
      qry_gestao_item_.Open;
      //verifica se todos os itens da po estão na gestão, se não insere.
      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        SQl.Clear;
        SQL.Add('SELECT COUNT(*) ');
        SQL.Add('FROM TPO_ITEM ( NOLOCK ) ');
        SQL.Add('WHERE NR_PROCESSO = '+ QuotedStr(msk_nr_referencia.Text) );
        Open;
        if Fields[0].AsInteger > qry_gestao_item_.RecordCount then
        begin
          Close;
          SQL.Clear;
          SQL.Add('INSERT INTO TGESTAO_ITEM ( ');
          SQL.Add('  NR_PROCESSO, NR_ITEM, CD_LOCAL_DESEMBARQUE, CD_EMBARCACAO, NR_VIAGEM, ');
          SQL.Add('  NR_VOO, NR_CONHECIMENTO, IN_CONSOLIDADO, IN_URGENTE, IN_SEGURO ) ');
          SQL.Add('SELECT ');
          SQL.Add('  I.NR_PROCESSO, I.NR_ITEM, PR.CD_LOCAL_DESEMBARQUE, PR.CD_EMBARCACAO, PR.NR_VIAGEM, ');
          SQL.Add('  PR.NR_VOO, PR.NR_CONHECIMENTO, PR.IN_CONSOLIDADO, PR.IN_URGENTE, PR.IN_SEGURO ');
          SQL.Add('FROM TPO_ITEM I ( NOLOCK ), TPROCESSO PR (NOLOCK) ');
          SQL.Add('WHERE I.NR_PROCESSO = '+ QuotedStr(msk_nr_referencia.Text) );
          SQL.Add('  AND NOT EXISTS ( ');
          SQL.Add('        SELECT * FROM TGESTAO_ITEM G ( NOLOCK ) ');
          SQL.Add('        WHERE G.NR_PROCESSO = I.NR_PROCESSO AND G.NR_ITEM = I.NR_ITEM ) ');
          SQL.Add('  AND PR.NR_REFERENCIA = I.NR_PROCESSO ');
          SQL.Add('  AND PR.IN_CANCELADO  = ''0'' ');
          ExecSQL;
          //reabre a gestão de itens agora contendo todos os itens do pedido
          qry_gestao_item_.Close;
          qry_gestao_item_.ParamByName('NR_PROCESSO').AsString := msk_nr_referencia.Text;
          qry_gestao_item_.Prepare;
          qry_gestao_item_.Open;
        end
        else Close;

        SQL.Clear;
        SQl.Add('SELECT MAX( NR_ITEM ) ');
        SQl.Add('FROM TGESTAO_ITEM ( NOLOCK ) ');
        SQl.Add('WHERE NR_PROCESSO = '+ QuotedStr(msk_nr_referencia.Text) );
        Open;
        lblTotalItens.Caption := Fields[0].AsString;
        Close;
        Free;
      end;

      btn_incluir.Enabled := False;
      mi_incluir.Enabled  := False;
    end;
  end;
end;

procedure Tfrm_gestao_po.btn_co_porto_itemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_gestao_po.qry_gestao_item_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_gestao_po.qry_gestao_item_CD_LOCAL_DESEMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil)
  end
  else
    edt_nm_porto_item.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_porto_item.Text,'DESCRICAO');
end;

procedure Tfrm_gestao_po.btn_co_navio_itemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_gestao_po.qry_gestao_item_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_gestao_po.qry_gestao_item_CD_EMBARCACAO.AsString := ConsultaOnLineEx('TEMBARCACAO','Embarcação',['CD_EMBARCACAO','NM_EMBARCACAO'],['Código','Nome'],'CD_EMBARCACAO',nil)
  end
  else
    edt_nm_navio_item.Text := ConsultaLookUP('TEMBARCACAO','CD_EMBARCACAO',dbedt_cd_navio_item.Text,'NM_EMBARCACAO');
end;

procedure Tfrm_gestao_po.btn_nr_viagem_itemClick(Sender: TObject);
begin
  with datm_gestao_po do
  begin
    if Trim( dbedt_cd_navio_item.Text ) = '' then
    begin
      BoxMensagem( 'Informe uma Embarcação', 3 );
      dbedt_cd_navio_item.SetFocus;
      Exit;
    end;
    if not PoeEmEdicao(datm_gestao_po.qry_gestao_item_) then Exit;

    qry_gestao_item_NR_VIAGEM.AsString := ConsultaOnLineExSQL(
      'SELECT V.NR_VIAGEM, V.DT_ESPERADA, V.DT_ENT, E.DESCRICAO, A.NM_ARMAZEM, V.NR_MANIFESTO ' +
      'FROM   TVIAGEM V ( NOLOCK ), TARMAZEM A ( NOLOCK ), TLOCAL_EMBARQUE E ( NOLOCK ) ' +
      'WHERE V.CD_UNID_NEG           = ' + QuotedStr(msk_cd_unid_neg.Text) +
      '  AND V.CD_PRODUTO            = ' + QuotedStr(msk_cd_produto.Text) +
      '  AND V.CD_EMBARCACAO         = ' + QuotedStr(dbedt_cd_navio_item.Text) +
      '  AND V.CD_ARMAZEM_ATRACACAO *= A.CD_ARMAZEM ' +
      '  AND V.CD_LOCAL              = E.CODIGO ',
      'Viagens', ['NR_VIAGEM', 'DT_ESPERADA', 'DT_ENT', 'DESCRICAO.','NM_ARMAZEM','NR_MANIFESTO'],
      ['Viagem', 'Dt. Esperada', 'Dt. Entrada', 'Local Desemb.','Arm. Atracação','Nº Manifesto'], 'NR_VIAGEM', frm_main.mi_gp_ga_cad_viagem);
  end;
end;

procedure Tfrm_gestao_po.dbedt_cd_porto_itemExit(Sender: TObject);
begin
  if Trim( dbedt_cd_porto_item.Text ) = '' then
  begin
    edt_nm_porto_item.Text     := '';
    dbedt_nr_viagem_item.Color := clWindow;
    Exit;
  end;

  ValidCodigo( dbedt_cd_porto_item );
  with datm_gestao_po do
  begin
    if ( dbedt_cd_porto_item.Text <> '' ) then
    begin
      edt_nm_porto_item.Text    := '';
      qry_porto_.Close;
      qry_porto_.ParamByName('CODIGO').AsString := dbedt_cd_porto_item.Text;
      qry_porto_.Prepare;
      qry_porto_.Open;
      if Not ( qry_porto_.Locate('CODIGO', dbedt_cd_porto_item.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Porto não cadastrado!', 2 );
        dbedt_cd_porto_item.Text   := '';
        edt_nm_porto_item.Text     := '';
        dbedt_nr_viagem_item.Color := clWindow;
        dbedt_cd_porto_item.SetFocus;
      end
      else
      begin
        edt_nm_porto_item.Text     := qry_porto_DESCRICAO.AsString;
        dbedt_nr_viagem_item.Color := clMenu;
      end;
    end;
  end;
end;

procedure Tfrm_gestao_po.dbedt_cd_navio_itemExit(Sender: TObject);
begin
  if Trim( dbedt_cd_navio_item.Text ) = '' then
  begin
    edt_nm_navio_item.Text := '';
    Exit;
  end;

  ValidCodigo( dbedt_cd_navio_item );
  with datm_gestao_po do                   
  begin
    if ( dbedt_cd_navio_item.Text <> '' ) then
    begin
      edt_nm_navio_item.Text := '';
      qry_navio_.Close;
      qry_navio_.ParamByName('CD_EMBARCACAO').AsString := dbedt_cd_navio_item.Text;
      qry_navio_.Prepare;
      qry_navio_.Open;
      if Not ( qry_navio_.Locate('CD_EMBARCACAO', dbedt_cd_navio_item.Text, [loCaseInsensitive]) ) then
      begin
        BoxMensagem( 'Navio não cadastrado!', 2 );
        dbedt_cd_navio_item.Text := '';
        edt_nm_navio_item.Text   := '';
        dbedt_cd_navio_item.SetFocus;
      end
      else
      begin
        edt_nm_navio_item.Text   := qry_navio_NM_EMBARCACAO.AsString;
      end;
    end;
  end;
end;

procedure Tfrm_gestao_po.dbedt_nr_viagem_itemExit(Sender: TObject);
begin
   if Trim( dbedt_nr_viagem_item.Text ) = '' then
   begin
     dbedt_nr_viagem_item.Text := '';
     Exit;
   end;

   if ( Trim( dbedt_cd_porto_item.Text ) = '' ) then
   begin
     BoxMensagem( 'Verifique o Porto !', 2 );
     dbedt_cd_porto_item.SetFocus;
     Exit;
   end;
   if ( Trim( dbedt_cd_navio_item.Text ) = '' ) then
   begin
     BoxMensagem( 'Verifique o Navio !', 2 );
     dbedt_cd_navio_item.SetFocus;
     Exit;
   end;
   if ( Trim( dbedt_nr_viagem_item.Text ) = '' ) then
   begin
     BoxMensagem( 'Verifique a Viagem !', 2 );
     dbedt_nr_viagem_item.SetFocus;
     Exit;
   end;

   with datm_gestao_po do
   begin
     qry_viagem_.Close;
     qry_viagem_.ParamByName('CD_UNID_NEG').AsString   := qry_processo_CD_UNID_NEG.AsString;
     qry_viagem_.ParamByName('CD_PRODUTO').AsString    := qry_processo_CD_PRODUTO.AsString;
     qry_viagem_.ParamByName('CD_EMBARCACAO').AsString := dbedt_cd_navio_item.Text;
     qry_viagem_.ParamByName('NR_VIAGEM').AsString     := dbedt_nr_viagem_item.Text;
     qry_viagem_.ParamByName('CD_LOCAL').AsString      := dbedt_cd_porto_item.Text;
     qry_viagem_.Prepare;
     qry_viagem_.Open;
     if qry_viagem_.RecordCount = 0 then
     begin
       BoxMensagem( 'Nº da Viagem inválido!', 2 );
       dbedt_nr_viagem_item.SetFocus;
     end
     else
     begin
       qry_viagem_.Close;
     end;
   end;
end;

procedure Tfrm_gestao_po.dbedt_nr_voo_itemExit(Sender: TObject);
begin
  if ( Trim( dbedt_nr_voo.Text ) <> '' ) then
  begin
    dbedt_cd_porto_item.Color  := clMenu;
    dbedt_cd_navio_item.Color  := clMenu;
    dbedt_nr_viagem_item.Color := clMenu;
    btn_co_porto_item.Enabled  := False;
    btn_co_navio_item.Enabled  := False;
    btn_nr_viagem_item.Enabled := False;
  end
  else
  begin
    dbedt_cd_porto_item.Color  := clWindow;
    dbedt_cd_navio_item.Color  := clWindow;
    dbedt_nr_viagem_item.Color := clWindow;
    btn_co_porto_item.Enabled  := True;
    btn_co_navio_item.Enabled  := True;
    btn_nr_viagem_item.Enabled := True;
  end;
end;

procedure Tfrm_gestao_po.ckbox_dados_itensClick(Sender: TObject);
begin
  if not (datm_gestao_po.qry_processo_.state in [dsInsert, dsEdit]) then begin
    datm_gestao_po.qry_processo_.Edit;
    ConfigBotoes(1);
  end else begin
    Grava;
  end;

  if vNaoEntrar then begin
    vNaoEntrar := False;
    btnRepassaItens.Enabled := not ckbox_dados_itens.Checked;
    ts_po_item.TabVisible   := not ckbox_dados_itens.Checked;
    exit;
  end;

  if not ckbox_dados_itens.Checked then begin
    Repassa('-');
    btnRepassaItens.Enabled := True;
    ts_po_item.TabVisible   := True;
    exit;
  end;

  if BoxMensagem( 'Deseja repassar as informações para os ítens ?' + #10#13 + 'As informações lá contidas, serão apagadas.', 1) then begin
    btnRepassaItens.Enabled := False;
    ts_po_item.TabVisible   := False;
    Repassa('+');
  end
  else begin
    vNaoEntrar := True;
    ckbox_dados_itens.Checked := False;
    btnRepassaItens.Enabled   := True;
    ts_po_item.TabVisible     := True;
  end;

end;

procedure Tfrm_gestao_po.btnRepassaItensClick(Sender: TObject);
begin
  if (datm_gestao_po.qry_processo_.state in [dsInsert, dsEdit]) then begin
    datm_gestao_po.qry_processo_.Post;
//    BoxMensagem( 'Você precisa salvar o processo antes de repassar os dados.',2);
//    exit;
  end;

  if BoxMensagem( 'Deseja repassar as informações para os ítens ?' + #10#13 + 'As informações lá contidas, serão apagadas.', 1) then
    Repassa('+');
end;

procedure Tfrm_gestao_po.Repassa(const pAction : String);

  Function IIF(pTest: Boolean; Const pTrue: string; Const pFalse: String): String;
  begin
    if pTest then
      Result := pTrue
    else
      Result := pFalse;
  end;

begin
  with TQuery.Create(Application) do begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;

    SQL.Add('UPDATE TGESTAO_ITEM SET ');
    SQL.Add('  CD_LOCAL_DESEMBARQUE = ''' + IIF((pAction = '+'),datm_gestao_po.qry_processo_CD_LOCAL_DESEMBARQUE.AsString,'') + ''',');
    SQL.Add('  CD_EMBARCACAO        = ''' + IIF((pAction = '+'),datm_gestao_po.qry_processo_CD_EMBARCACAO.AsString,'')        + ''',');
    SQL.Add('  NR_VIAGEM            = ''' + IIF((pAction = '+'),datm_gestao_po.qry_processo_NR_VIAGEM.AsString,'')            + ''',');
    SQL.Add('  NR_VOO               = ''' + IIF((pAction = '+'),datm_gestao_po.qry_processo_NR_VOO.AsString,'')               + ''',');
    SQL.Add('  IN_CONSOLIDADO       = ''' + IIF((pAction = '+'),datm_gestao_po.qry_processo_IN_CONSOLIDADO.AsString,'')       + ''',');
    SQL.Add('  NR_CONHECIMENTO      = ''' + IIF((pAction = '+'),datm_gestao_po.qry_processo_NR_CONHECIMENTO.AsString,'')      + ''',');
    SQL.Add('  IN_URGENTE           = ''' + IIF((pAction = '+'),datm_gestao_po.qry_processo_IN_URGENTE.AsString,'')           + ''',');
    SQL.Add('  IN_SEGURO            = ''' + IIF((pAction = '+'),datm_gestao_po.qry_processo_IN_SEGURO.AsString,'')            + '''');
    SQL.Add('WHERE NR_PROCESSO = ''' + datm_gestao_po.qry_processo_NR_REFERENCIA.AsString + '''');

    ExecSQL;
    Free;
  end;
end;

procedure Tfrm_gestao_po.btn_gestao_poClick(Sender: TObject);
begin
  if vObrigadoSalvar then begin
    MessageDlg('É obrigatório salvar o pedido após uma alteração de serviço !!!', mtError, [mbOK], 0);
    Exit;
  end;
  // Botão Manutenção do Processo
  str_cd_rotina_atalho := '1801';
  nr_po_gestao := Trim(msk_nr_referencia.Text);
  nr_processo_gestao := Trim(dbedt_nr_processo_analise.Text);
  Close;
end;

procedure Tfrm_gestao_po.FormActivate(Sender: TObject);
begin
  if Trim( pesq_nr_po ) <> '' then
  begin
    btn_incluirClick(nil);
    msk_nr_referencia.Text := Trim( pesq_nr_po );
    msk_nr_referenciaExit(nil);
  end;
end;

procedure Tfrm_gestao_po.msk_nr_referenciaClick(Sender: TObject);
begin
  if not msk_nr_referencia.Enabled then
    BoxMensagem('Se desejar fazer nova consulta ou abrir uma nova PO,' + #13#10 + 'cancele a atual e clique em "Incluir" novamente.',2);
end;

procedure Tfrm_gestao_po.btn_co_referenciaClick(Sender: TObject);
begin
  msk_nr_referencia.Text := ConsultaOnLineExSQL('SELECT NR_REFERENCIA, NR_PROCESSO, (SELECT NM_EMPRESA FROM TEMPRESA_NAC WHERE CD_EMPRESA = CD_CLIENTE) NM_EMPRESA, DT_ABERTURA FROM TPROCESSO WHERE CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' AND CD_PRODUTO = ''' + msk_cd_produto.Text + ''' AND NR_REFERENCIA IS NOT NULL','Pedidos',['NR_REFERENCIA', 'NR_PROCESSO', 'NM_EMPRESA', 'DT_ABERTURA' ],['Pedido','Processo','Cliente','Dt. Abertura'],'NR_REFERENCIA', nil);
end;

procedure Tfrm_gestao_po.btn_atz_servicoClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente atualizar o FollowUp com os eventos desse '+#13+#10+'serviço ? Essa operação irá limpar as datas de realização dos '+#13+#10+'eventos que não forem comum entre o antigo e o novo serviço !', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
    Exit;
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    //atualiza o followup da po
    SQL.Clear;
    SQL.Add('  DELETE FROM TFLP_PO ');
    SQL.Add('  WHERE NR_PROCESSO = ''' + msk_nr_referencia.text + ''' ');
    SQL.Add('    AND CD_EVENTO NOT IN ( ');
    SQL.Add('          SELECT CD_EVENTO ');
    SQL.Add('          FROM TSERVICO_EVENTO ( NOLOCK ) ');
    SQL.Add('          WHERE CD_SERVICO = ''' + dbedt_cd_servico.Text + ''' ');
    SQL.Add('    )');
    ExecSQL;
    SQL.Clear;
    SQL.Add('  INSERT TFLP_PO ( NR_PROCESSO, CD_EVENTO, IN_APLICAVEL, NR_ORDEM )');
    SQL.Add('  SELECT PO.NR_PROCESSO, SE.CD_EVENTO ,''1'', SE.NR_ORDEM');
    SQL.Add('    FROM TSERVICO_EVENTO SE ( NOLOCK ), TPO PO ( NOLOCK )');
    SQL.Add('   WHERE SE.CD_SERVICO = ''' + dbedt_cd_servico.Text + '''');
    SQL.Add('     AND SE.CD_TIPO_EVENTO = ''00''');
    SQL.Add('     AND SE.CD_EVENTO NOT IN ( SELECT CD_EVENTO FROM TSERVICO_EVENTO WHERE CD_SERVICO = ''' + vServicoOld + ''')');
    SQL.Add('     AND PO.NR_PROCESSO = ''' + msk_nr_referencia.text + '''');
    ExecSQL;

    //atualiza o followup de itens
    SQL.Clear;
    SQL.Add('  DELETE FROM TFLP_PO_ITEM ');
    SQL.Add('  WHERE NR_PROCESSO = ''' + msk_nr_referencia.text + ''' ');
    SQL.Add('    AND CD_EVENTO NOT IN ( ');
    SQL.Add('          SELECT CD_EVENTO ');
    SQL.Add('          FROM TSERVICO_EVENTO ( NOLOCK ) ');
    SQL.Add('          WHERE CD_SERVICO = ''' + dbedt_cd_servico.Text + ''' ');
    SQL.Add('    )');
    ExecSQL;
    SQL.Clear;
    SQL.Add('  INSERT TFLP_PO_ITEM ( NR_PROCESSO, NR_ITEM, NR_ITEM_CLIENTE, CD_EVENTO, IN_APLICAVEL, NR_ORDEM )');
    SQL.Add('  SELECT POI.NR_PROCESSO, POI.NR_ITEM, POI.NR_ITEM_CLIENTE, SE.CD_EVENTO ,''1'', SE.NR_ORDEM');
    SQL.Add('    FROM TSERVICO_EVENTO SE ( NOLOCK ), TPO_ITEM POI ( NOLOCK )');
    SQL.Add('   WHERE SE.CD_SERVICO = ''' + dbedt_cd_servico.Text + '''');
    SQL.Add('     AND SE.CD_TIPO_EVENTO = ''01''');
    SQL.Add('     AND SE.CD_EVENTO NOT IN ( SELECT CD_EVENTO FROM TSERVICO_EVENTO WHERE CD_SERVICO = ''' + vServicoOld + ''')');
    SQL.Add('     AND POI.NR_PROCESSO = ''' + msk_nr_referencia.text + '''');
    ExecSQL;
    Free;
  end;
  vServicoOld := dbedt_cd_servico.Text;
  MessageDlg('O FollowUp foi atualizado com sucesso.' + chr(13) + 'Salve as alterações para prosseguir!', mtInformation, [mbOK], 0);
  vObrigadoSalvar := True;
  ConfigBotoes(1);
end;

procedure Tfrm_gestao_po.dbedt_cd_areaExit(Sender: TObject);
begin
  ValidCodigo( dbedt_cd_area );
end;

end.

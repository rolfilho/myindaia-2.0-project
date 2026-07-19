unit PGSM295;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus, StdCtrls, DBCtrls, Buttons, ExtCtrls,
  ComCtrls, RxDBComb, Mask, Grids, DBGrids, DB, DbTables,  ppMemo, ppSubRpt, ppStrtch, ppRegion, ppCtrls, ppVar,
  ppPrnabl, ppParameter, Variants, strUtils;

type
  rDespesasAux = Record
    Item              : String;
    ValorTotalDespesa : Real;
  end;

type
  Tfrm_notificacao = class(TForm)
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_incluir: TSpeedButton;
    MainMenu1: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    Panel1: TPanel;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    Label1: TLabel;
    btn_cd_produto: TSpeedButton;
    lbl_nr_processo: TLabel;
    btn_processo: TSpeedButton;
    lbl_cd_servico: TLabel;
    lbl_cd_cliente: TLabel;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    dbedt_nm_servico: TDBEdit;
    dbedt_cd_servico: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    dbedt_cd_cliente: TDBEdit;
    dbrdgrp_base_calculo: TDBRadioGroup;
    pgctrl_notif_numerario: TPageControl;
    ts_lista: TTabSheet;
    dbg_solicitacao: TDBGrid;
    TabSheet2: TTabSheet;
    dbg_itens: TDBGrid;
    ts_notificacao: TTabSheet;
    DBGrid1: TDBGrid;
    btn_cancela_numerario: TSpeedButton;
    ts_numerario: TTabSheet;
    dbgrid_numerario: TDBGrid;
    btn_print_: TSpeedButton;
    btn_excluir: TSpeedButton;
    mi_excluir: TMenuItem;
    mi_cancela_numerario: TMenuItem;
    mi_impri_: TMenuItem;
    msk_nr_processo: TMaskEdit;
    btn_duplica: TSpeedButton;
    Panel3: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    ts_obs: TTabSheet;
    DBMemo1: TDBMemo;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    btnDuplicaSolic: TSpeedButton;
    pnlDuplica: TPanel;
    pnlDuplica2: TPanel;
    lbl1: TLabel;
    dbtxtProcesso: TDBText;
    dbtxtSolic: TDBText;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    medtProcesso: TMaskEdit;
    btnCoProcesso: TSpeedButton;
    medtSolic: TMaskEdit;
    lbl5: TLabel;
    lblFechar: TLabel;
    btnDuplicar: TSpeedButton;
    lbl6: TLabel;
    lbl7: TLabel;
    dbedtUnid: TDBEdit;
    dbedtProd: TDBEdit;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    SpeedButton1: TSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    nbDados: TNotebook;
    pnl_item: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    btn_co_banco: TSpeedButton;
    Label6: TLabel;
    btn_co_item: TSpeedButton;
    lbl_favorecido: TLabel;
    btn_co_favorecido: TSpeedButton;
    Label4: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    dbedt_vl_solicitado: TDBEdit;
    dbedt_nm_banco: TDBEdit;
    dbedt_vl_calculado: TDBEdit;
    dbedt_nm_item: TDBEdit;
    dbedt_nm_favorecido: TDBEdit;
    dblckpbox_tp_destino: TDBLookupComboBox;
    Panel2: TPanel;
    Label10: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    Label9: TLabel;
    edt_deb_comiss: TEdit;
    edt_tt_deb_conta: TEdit;
    DBEdit10: TDBEdit;
    dbedt_cd_item: TDBEdit;
    dbedt_cd_banco: TDBEdit;
    dbedt_cd_favorecido: TDBEdit;
    lbl8: TLabel;
    bvl1: TBevel;
    BtnIncluirObs: TSpeedButton;
    btnPreCalculo: TSpeedButton;
    Panel4: TPanel;
    SpeedButton2: TSpeedButton;
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_processoClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_cancela_numerarioClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure Habilita_campos( Hab:Boolean);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dblckpbox_tp_destinoClick(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure dbedt_cd_favorecidoChange(Sender: TObject);
    procedure dbedt_cd_favorecidoExit(Sender: TObject);
    procedure pgctrl_notif_numerarioChange(Sender: TObject);
    procedure som_valores;
    procedure btn_excluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_notif_numerarioChanging(Sender: TObject; var AllowChange: Boolean);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure btn_duplicaClick(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
    procedure dbrdgrp_base_calculoClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbedt_cd_itemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_print_Click(Sender: TObject);
    procedure lblFecharClick(Sender: TObject);
    procedure btnDuplicaSolicClick(Sender: TObject);
    procedure btnDuplicarClick(Sender: TObject);
    procedure btnCoProcessoClick(Sender: TObject);
    procedure medtProcessoExit(Sender: TObject);
    procedure medtSolicExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure BtnIncluirObsClick(Sender: TObject);
    procedure btnPreCalculoClick(Sender: TObject);
    procedure msk_cd_produtoChange(Sender: TObject);
    procedure DBMemo1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    in_cpmf_num : string[1];
    st_bco_deb_cc, st_bco_com, st_bco_deb_com :string[3];
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;

    procedure Cancelar;
    function ItemEscolhidoOk(const pCD_EMPRESA: string; pCD_ITEM: string): Boolean;
    procedure lanca_pc_impostos_obs;
  public
    lCons_OnLine : Boolean;
    st_modificar, st_incluir, st_excluir : Boolean;
    tmpSQL, Cons_OnLine_Texto : String;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure pBeforePrint(Sender: TObject);
  end;

var
  frm_notificacao: Tfrm_notificacao;

implementation

uses GSMLIB, ConsOnLineEx, PGSM296, PGGP001, PGGP017, PGSM146, PGNM021, PGSM990, Funcoes,
  ppClass, uDIPreCalculo;

{$R *.DFM}

procedure Tfrm_notificacao.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_notificacao.Cancelar;
begin
  try
    if datm_notificacao.qry_notifica_.State in [dsInsert, dsEdit] then
      datm_notificacao.qry_notifica_.Cancel;
    if datm_notificacao.qry_notifica_item_.State in [dsInsert, dsEdit] then
      datm_notificacao.qry_notifica_item_.Cancel;
      btn_mi (st_incluir, False, False, st_excluir);

      dbg_solicitacao.Enabled := True; // by Carlos - 25/06/2010
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

function Tfrm_notificacao.Consiste: Boolean;
begin
  if pgctrl_notif_numerario.ActivePage = ts_lista then
  begin
    if ( datm_notificacao.qry_notifica_CD_BASE_CALCULO.AsString <> '0' ) and
       ( datm_notificacao.qry_notifica_CD_BASE_CALCULO.AsString <> '1' ) and
       ( datm_notificacao.qry_processo_TP_SERVICO.AsString = '0' ) then
    begin
      BoxMensagem('Informe a base de Cálculo para a Solicitação de Numerário (Previsão/D.I.)!', 2);
      dbrdgrp_base_calculo.SetFocus;
      Consiste  := False;
      Exit;
    end;
  end;
  if pgctrl_notif_numerario.ActivePage = ts_numerario then
  begin
    if ( dbedt_cd_banco.Text = '' ) and ( datm_notificacao.qry_notifica_item_TP_DESTINO.AsString = '1' ) then // Déb. Conta
    begin
      BoxMensagem('Campo Banco deve ser preenchido!', 2);
      dbedt_cd_banco.SetFocus;
      Consiste  := False;
      Exit;
    end;
    if ( dbedt_nm_banco.Text = '' ) and ( datm_notificacao.qry_notifica_item_TP_DESTINO.AsString = '1' ) then // Déb. Conta
    begin
      BoxMensagem('Banco não encontrado!', 2);
      dbedt_cd_banco.SetFocus;
      Consiste  := False;
      Exit;
    end;
    if dbedt_cd_item.Text = '' then
    begin
      BoxMensagem('Campo Item deve ser preenchido!', 2);
      dbedt_cd_item.SetFocus;
      Consiste := False;
      Exit;
    end;
    if dbedt_nm_item.Text = '' then
    begin
      BoxMensagem('Item não encontrado!', 2);
      dbedt_cd_item.SetFocus;
      Consiste := False;
      Exit;
    end;

    //Rodrigo Capra - 03810/08 - 11/07/2008
    if not ItemEscolhidoOk(dbedt_cd_cliente.Text, dbedt_cd_item.Text) then
    begin
//      BoxMensagem('Este item não pode ter numerário solicitado para esse Cliente!', 2);
      dbedt_cd_item.SetFocus;
      Consiste := False;
      Exit;
    end;

    if dblckpbox_tp_destino.Text = '' then
    begin
      BoxMensagem('Deve ser escolhido um Tipo de Destino!', 2);
      dbedt_cd_item.SetFocus;
      Consiste := False;
      Exit;
    end;
    if dbedt_vl_solicitado.Text = '' then
    begin
      BoxMensagem('Campo Valor Solicitado deve ser preenchido!', 2);
      dbedt_cd_item.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
  Consiste := True;
end;


function Tfrm_notificacao.Grava: Boolean;
var
  nr_lanc : String[3];
  in_lanc_itens_cancelados : Boolean;
  vItensNumerario, vCntr, vLancamentoAux, vTipoDestino : string;
  i : Integer;
  vTotalGeralProcesso, vResultado : Real;
  vTabFrete: string[5];
  vQryArmazenagem : TQuery;
  vQryCalcFrete   : TQuery;

  function fExecSQL(const pSQL : String) : Boolean;
  begin
    with TQuery.Create(application) do
    begin
      try
        try
          Result := True;
          Databasename := 'DBBROKER';
          SQL.Clear;
          SQL.Add(pSQL);
          ParamByName('VALOR').AsFloat := vDespesasNoArmazem[i].ValorTotalDespesa;
          ExecSQL;
        except
          On e:Exception do
          begin
            Result := False;
            ShowMessage('Ocorreu o seguinte erro na aplicação :' + #13#10 + e.message + #10#13 + 'Informe o departamento de TI.');
          end;
        end;
      finally
        Free;
      end;
    end;
  end;

begin
  in_lanc_itens_cancelados:=false;
  if (pgctrl_notif_numerario.ActivePage = ts_obs) then
  begin
    try
      if datm_notificacao.qry_notifica_.State in [dsEdit] then
        datm_notificacao.qry_notifica_.Post;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_notificacao.qry_notifica_.Cancel;
        TrataErro(E);
      end;
    end;
  end;
  if (pgctrl_notif_numerario.ActivePage = ts_lista) then
  begin
    try
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        Sql.Add('SELECT NR_PROCESSO, CD_ITEM , NR_LANCAMENTO FROM TNUMERARIO_NOTIFICA_ITEM (NOLOCK)');
        Sql.Add(' WHERE NR_PROCESSO ="'+datm_notificacao.qry_processo_NR_PROCESSO.AsString+'"');
        Sql.Add(' AND CD_STATUS = "C" AND CD_ITEM NOT IN (SELECT N.CD_ITEM FROM TNUMERARIO_NOTIFICA_ITEM N (NOLOCK) ');
        Sql.Add('  WHERE N.NR_PROCESSO = "'+datm_notificacao.qry_processo_NR_PROCESSO.AsString+'" ');
        Sql.Add(' AND N.NR_SOLICITACAO <> NR_SOLICITACAO )');
        Open;
        if Recordcount > 0 then
          if boxmensagem('Deseja importar itens Cancelados para este Registro?',1) then
            in_lanc_itens_cancelados:=true;
        Free;
      end;
      datm_main.db_broker.StartTransaction;
      // Grava Numerario
      datm_notificacao.qry_notifica_.Post;
      with datm_notificacao do
      begin
        CloseStoredProc( sp_calc_padrao );
        sp_calc_padrao.ParamByName('@NR_PROCESSO').AsString    := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
        sp_calc_padrao.ParamByName('@NR_SOLICITACAO').AsString := datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
        ExecStoredProc(sp_calc_padrao);
        CloseStoredProc( sp_calc_padrao );
        if in_cpmf_num = '1' then  // Inclui ou Atualiza Item CPMF 
        begin
          CloseStoredProc(sp_atz_num_cpmf );
          sp_atz_num_cpmf.ParamByName( '@NR_PROCESSO' ).AsString    := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
          sp_atz_num_cpmf.ParamByName( '@NR_SOLIC' ).AsString       := datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
          sp_atz_num_cpmf.ParamByName( '@cd_cliente' ).AsString     := datm_notificacao.qry_processo_CD_CLIENTE.AsString;
          sp_atz_num_cpmf.ParamByName( '@cd_servico' ).AsString     := datm_notificacao.qry_processo_CD_SERVICO.AsString;
          ExecStoredProc( sp_atz_num_cpmf );
          CloseStoredProc( sp_atz_num_cpmf );
        end;
        if  in_lanc_itens_cancelados then
        begin
          CloseStoredProc(sp_importa_num_cancelados );
          sp_importa_num_cancelados.ParamByName('@NR_PROCESSO').AsString   := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
          sp_importa_num_cancelados.ParamByName('@NR_SOLICITACAO').AsString:= datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
          ExecStoredProc( sp_importa_num_cancelados );
          CloseStoredProc( sp_importa_num_cancelados );
        end;
        if (datm_notificacao.qry_processo_NR_PROCESSO_VINC.AsString <> '') then
        begin
          CloseStoredProc(sp_numerario_proc_vinc );
          sp_numerario_proc_vinc.ParamByName('@NR_PROCESSO').AsString   := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
          sp_numerario_proc_vinc.ParamByName('@NR_PROC_VINC').AsString  := datm_notificacao.qry_processo_NR_PROCESSO_VINC.AsString;
          sp_numerario_proc_vinc.ParamByName('@NR_SOLICITACAO').AsString:= datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
          sp_numerario_proc_vinc.ParamByName('@dt_tarifario').AsDAtetime:= dt_server;
          ExecStoredProc( sp_numerario_proc_vinc );
          CloseStoredProc( sp_numerario_proc_vinc );
        end;
        CloseStoredProc(sp_soma_solinum_ag );
        sp_soma_solinum_ag.ParamByName('@NR_PROCESSO').AsString   := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
        sp_soma_solinum_ag.ParamByName('@nr_solinum').AsString:= datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
        ExecStoredProc( sp_soma_solinum_ag );
        CloseStoredProc( sp_soma_solinum_ag );
      end;

      // ******************************************************************* //
      // ARMAZENAGEM                                                         //
      // ******************************************************************* //

(*
      vQryArmazenagem := TQuery.Create(Application);
      with vQryArmazenagem do
      begin
        try
          Databasename := 'DBBROKER';
          // verificando os itens configurados na cliente x numerario
          SQL.Clear;
          SQL.Add('SELECT N.CD_ITEM, N.TP_DESTINO');
          SQL.Add('  FROM TPROCESSO P (NOLOCK), TCLIENTE_NUMERARIO N (NOLOCK), TCALCULO S (NOLOCK)');
          SQL.Add(' WHERE P.CD_CLIENTE     = N.CD_CLIENTE     AND');
          SQL.Add('       P.CD_UNID_NEG    = N.CD_UNID_NEG    AND');
          SQL.Add('       P.CD_PRODUTO     = N.CD_PRODUTO     AND');
          SQL.Add('       P.CD_SERVICO     = N.CD_SERVICO     AND');
          SQL.Add('       N.TP_CALCULO     = S.CD_CALCULO     AND');
          SQL.Add('       P.NR_PROCESSO    = ''' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + ''' AND');
          SQL.Add('       N.NR_SOLICITACAO = ''' + datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString + ''' AND');
          SQL.Add('       S.NM_STORED_PROCEDURE = ''FUNCTION'' AND');
          SQL.Add('       S.CD_CALCULO     = ''018''');
          Open;
          while not EOF do
          begin
            vItensNumerario := vItensNumerario + ' ' + FieldByName('CD_ITEM').AsString;
            Next;
          end;
          // CALCULANDO PRIMEIRO POR CONTAINER //
          SQL.Clear;
          SQL.Add('SELECT * FROM TPROCESSO_CNTR (NOLOCK)');
          SQL.Add(' WHERE NR_PROCESSO = ''' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + '''');
          Open;
          while not EOF do
          begin
            vCntr := FieldByName('NR_CNTR').AsString;
            // Verificando e calculando despesas
           if DespesasNoArmazem(datm_notificacao.qry_notifica_NR_PROCESSO.AsString, vCntr, 'CO', ConsultaLookUp('TTP_CNTR','TP_CNTR',FieldByName('TP_CNTR').AsString,'TP_PESO'), 0, True, false) then
           begin
              // A função joga os calculos para o array "vDespesasNoArmazem", e agora vou fazer um loop para mostrar na tela
              for i := 0 to Length(vDespesasNoArmazem) - 1 do  // roda despesa a despesa calculada
              begin
                vLancamentoAux := ConsultaLookUpSQL('SELECT ( SUBSTRING(''000'',1,3-LEN(ISNULL(MAX(NR_LANCAMENTO),0)+1)) + CAST(ISNULL(MAX(NR_LANCAMENTO),0)+1 AS CHAR) ) BLA ' +
                                                    ' FROM TNUMERARIO_NOTIFICA_ITEM (NOLOCK) WHERE NR_PROCESSO = ''' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + ''' and nr_solicitacao = ''' + datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString + '''', 'BLA');
                if Pos(vDespesasNoArmazem[i].Item ,vItensNumerario) > 0 then // verifica se elas estao configuradas para o cliente
                begin
                  vTipoDestino := ConsultaLookupSQL('SELECT N.TP_DESTINO FROM TPROCESSO P (NOLOCK), TCLIENTE_NUMERARIO N (NOLOCK), TCALCULO S (NOLOCK) ' +
                                                    ' WHERE P.CD_CLIENTE = N.CD_CLIENTE AND ' +
                                                    ' P.CD_UNID_NEG    = N.CD_UNID_NEG  AND ' +
                                                    ' P.CD_PRODUTO     = N.CD_PRODUTO     AND ' +
                                                    ' P.CD_SERVICO     = N.CD_SERVICO     AND ' +
                                                    ' N.TP_CALCULO     = S.CD_CALCULO     AND ' +
                                                    ' N.CD_ITEM        = ''' + vDespesasNoArmazem[i].Item + '''     AND ' +
                                                    ' P.NR_PROCESSO    = ''' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + ''' AND ' +
                                                    ' N.NR_SOLICITACAO = ''' + datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString + ''' AND ' +
                                                    ' S.NM_STORED_PROCEDURE = ''FUNCTION'' AND ' +
                                                    ' S.CD_CALCULO     = ''018'' ','TP_DESTINO');
                  if StrToInt(ConsultaLookupSQL('SELECT COUNT(1) BLA FROM TNUMERARIO_NOTIFICA_ITEM (NOLOCK)' +
                                                ' WHERE NR_PROCESSO    = ''' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + '''' +
                                                '   AND NR_SOLICITACAO = ''' + datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString + '''' +
                                                '   AND CD_ITEM        = ''' + vDespesasNoArmazem[i].Item + '''', 'BLA')) > 0 then
                  begin
                    if not fExecSQL('UPDATE TNUMERARIO_NOTIFICA_ITEM SET VL_ITEM_CALCULADO = VL_ITEM_CALCULADO + :VALOR,' +
                                ' VL_SOLICITADO = VL_SOLICITADO + :VALOR' +
                                ' WHERE NR_PROCESSO    = ''' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + '''' +
                                '   AND NR_SOLICITACAO = ''' + datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString + '''' +
                                '   AND CD_ITEM        = ''' + vDespesasNoArmazem[i].Item + '''') then
                      ShowMessage('Ocorreu um erro ao acumular valores nas despesas do armazém. Informe o departamento de TI.');
                  end
                  else
                  begin
                    if not fExecSQL('INSERT TNUMERARIO_NOTIFICA_ITEM (NR_PROCESSO, NR_SOLICITACAO, NR_LANCAMENTO, CD_ITEM, NR_PRIORIDADE, CD_TIPO_CALCULO, CD_BANCO, VL_ITEM_CALCULADO,'+
                                                                        'VL_SOLICITADO, CD_STATUS, VL_RECEBIDO, VL_UTILIZADO, IN_CANCELADO, TP_DESTINO, CD_FAVORECIDO, CD_MOEDA_COMPRA,'+
                                                                        'CD_MOEDA_VENDA, VL_COMPRA, VL_VENDA, NR_SOLIC_VINC)'+
                                                                        ' VALUES ( ''' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + ''',''' + datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString + ''', ''' + vLancamentoAux + ''',' +
                                                                        '          ''' + vDespesasNoArmazem[i].Item + ''', NULL, ''A'', NULL, :VALOR,' +
                                                                        '          :VALOR, ''A'', 0, 0, 0, ''' + vTipoDestino + ''', NULL, NULL, NULL, NULL, NULL, NULL )') then
                      ShowMessage('Ocorreu um erro ao inserir as despesas do armazém. Informe o departamento de TI.');
                  end;
                end;
              end;
            end;
            Next;
          end;

          // CALCULANDO POR CARGA SOLTA //
          SQL.Clear;
          SQL.Add('SELECT * FROM TPROCESSO_CARGA_SOLTA (NOLOCK)');
          SQL.Add(' WHERE NR_PROCESSO = ''' + msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text + '''');
          Open;
          while not EOF do
          begin
            vCntr := FieldByName('NM_ESPECIE').AsString;
            // adiciona um panel com as configurações para cada container
            if DespesasNoArmazem(msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text, vCntr, 'CS', '',0, True) then
            begin

              // A função joga os calculos para o array "vDespesasNoArmazem", e agora vou fazer um loop para mostrar na tela
              for i := 0 to Length(vDespesasNoArmazem) - 1 do
                if Pos(vDespesasNoArmazem[i].Item ,vItensNumerario) > 0 then
                  vTotalGeralProcesso := vTotalGeralProcesso + vDespesasNoArmazem[i].ValorTotalDespesa;
            end; //if
            Next;
          end;

        finally
          Close;
          Free;
        end;
      end;

*) // comentado por carlos em 15/07/2010 por não se usar mais a função de armazenagem

      // ******************************************************************* //
      // FINAL DA ARMAZENAGEM                                                //
      // ******************************************************************* //


      // ******************************************************************* //
      // CÁLCULO DE FRETE                                                    //
      // ******************************************************************* //

      vTabFrete := ConsultaLookUpSQL('SELECT P.CD_TAB_FRETE FROM TPROCESSO P (NOLOCK) ' +
                           ' INNER JOIN TTAB_FRETE F (NOLOCK) ON  F.CD_TAB_FRETE = P.CD_TAB_FRETE ' +
                           '                                  AND F.CD_MOEDA_TAB_FRETE = P.CD_MOEDA_FRETE ' +
                           ' WHERE P.NR_PROCESSO = "'+datm_notificacao.qry_notifica_NR_PROCESSO.AsString+'" ', 'CD_TAB_FRETE');
      if vTabFrete <> '' then
      begin

        vQryCalcFrete := TQuery.Create(Application);
        with vQryCalcFrete do
        begin
          try
            Databasename := 'DBBROKER';
            // verificando os itens configurados na cliente x numerario
            SQL.Clear;
            SQL.Add('SELECT N.CD_ITEM, N.TP_DESTINO');
            SQL.Add('  FROM TPROCESSO P (NOLOCK), TCLIENTE_NUMERARIO N (NOLOCK), TCALCULO S (NOLOCK)');
            SQL.Add(' WHERE P.CD_CLIENTE     = N.CD_CLIENTE     AND');
            SQL.Add('       P.CD_UNID_NEG    = N.CD_UNID_NEG    AND');
            SQL.Add('       P.CD_PRODUTO     = N.CD_PRODUTO     AND');
            SQL.Add('       P.CD_SERVICO     = N.CD_SERVICO     AND');
            SQL.Add('       N.TP_CALCULO     = S.CD_CALCULO     AND');
            SQL.Add('       P.NR_PROCESSO    = ''' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + ''' AND');
            SQL.Add('       N.NR_SOLICITACAO = ''' + datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString + ''' AND');
            SQL.Add('       S.NM_STORED_PROCEDURE = ''FUNCTION'' AND');
            SQL.Add('       S.CD_CALCULO     = ''019''');
            Open;
            //despesas cadastradas
            while not Eof do begin
              vResultado := CalculaFrete(datm_notificacao.qry_notifica_NR_PROCESSO.AsString, vTabFrete, vQryCalcFrete.Fields[0].AsString);
              if vResultado < 0 then
                FastExecSQL('INSERT INTO TLOG_ERRO_CALCULO VALUES ( "' + str_cd_usuario + '", "FUNCTION", "' + FloatToStr(Abs(vResultado)) + '", "' + vQryCalcFrete.Fields[0].AsString + '" ) ')
              else begin
                vLancamentoAux := ConsultaLookUpSQL('SELECT ( SUBSTRING(''000'',1,3-LEN(ISNULL(MAX(NR_LANCAMENTO),0)+1)) + CAST(ISNULL(MAX(NR_LANCAMENTO),0)+1 AS CHAR) ) BLA ' +
                                                    ' FROM TNUMERARIO_NOTIFICA_ITEM (NOLOCK) WHERE NR_PROCESSO = ''' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + ''' and nr_solicitacao = ''' + datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString + '''', 'BLA');
                 if StrToInt(ConsultaLookupSQL('SELECT COUNT(*) BLA FROM TNUMERARIO_NOTIFICA_ITEM (NOLOCK)' +
                                               ' WHERE NR_PROCESSO    = ''' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + '''' +
                                               '   AND NR_SOLICITACAO = ''' + datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString + '''' +
                                               '   AND CD_ITEM        = ''' + vQryCalcFrete.Fields[0].AsString + '''', 'BLA')) > 0 then
                 begin
                   if not FastExecSQL('UPDATE TNUMERARIO_NOTIFICA_ITEM SET VL_ITEM_CALCULADO = ' + FloatToStr(vResultado) + ', ' +
                               ' VL_SOLICITADO = ' + FloatToStr(vResultado) +
                               ' WHERE NR_PROCESSO    = ''' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + '''' +
                               '   AND NR_SOLICITACAO = ''' + datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString + '''' +
                               '   AND CD_ITEM        = ''' + vQryCalcFrete.Fields[0].AsString + '''') then
                     ShowMessage('Ocorreu um erro ao acumular valores nas despesas do armazém. Informe o departamento de TI.');
                 end else begin
                   if not FastExecSQL('INSERT TNUMERARIO_NOTIFICA_ITEM (NR_PROCESSO, NR_SOLICITACAO, NR_LANCAMENTO, CD_ITEM, NR_PRIORIDADE, CD_TIPO_CALCULO, CD_BANCO, VL_ITEM_CALCULADO,'+
                                                                       'VL_SOLICITADO, CD_STATUS, VL_RECEBIDO, VL_UTILIZADO, IN_CANCELADO, TP_DESTINO, CD_FAVORECIDO, CD_MOEDA_COMPRA,'+
                                                                       'CD_MOEDA_VENDA, VL_COMPRA, VL_VENDA, NR_SOLIC_VINC)'+
                                                                       ' VALUES ( ''' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + ''',''' + datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString + ''', ''' + vLancamentoAux + ''',' +
                                                                       '          ''' + vQryCalcFrete.Fields[0].AsString + ''', NULL, ''A'', NULL, ' + FloatToStr(vResultado) + ', ' +
                                                                       '          ' + FloatToStr(vResultado) + ', ''A'', 0, 0, 0, ''' + vQryCalcFrete.Fields[1].AsString + ''', NULL, NULL, NULL, NULL, NULL, NULL )') then
                    ShowMessage('Ocorreu um erro ao inserir as despesas do armazém. Informe o departamento de TI.');
                end;
              end;
              Next;
            end;
          finally
            vQryCalcFrete.Free;
          end;
        end; //with
      end; //verificação de tabela válida
      // ******************************************************************* //
      // FIM DE FRETE                                                        //
      // ******************************************************************* //


      datm_main.db_broker.Commit;
      with TQuery.Create(Application) do
      begin
        // Exibir registros de erro de calculo
        DataBaseName:='DBBROKER';
        Sql.Clear;
        Sql.Add('SELECT COUNT(CD_ERRO)  FROM TLOG_ERRO_CALCULO  (NOLOCK)');
        Sql.Add('WHERE CD_USUARIO = "'+str_cd_usuario+'"');
        Open;
        if Fields[0].AsInteger > 0 then
        begin
          Application.CreateForm( Tfrm_log_erro_calculo, frm_log_erro_calculo );
          frm_log_erro_calculo.ShowModal;
        end;
        // limpar registros de erro de calculo
        Sql.Clear;
        Sql.Add('DELETE TLOG_ERRO_CALCULO WHERE CD_USUARIO = "'+str_cd_usuario+'"');
        ExecSql;
        Free;
      end;
      datm_notificacao.qry_notifica_.close;
      datm_notificacao.qry_notifica_.Prepare;
      datm_notificacao.qry_notifica_.Open;
      datm_notificacao.qry_notifica_.FetchAll;
      datm_notificacao.qry_notifica_.Last;
      dbg_solicitacao.Enabled := True;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_notificacao.qry_notifica_.Cancel;
        TrataErro(E);
      end;
    end;
  end;
  IF pgctrl_notif_numerario.ActivePage = ts_numerario THEN
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_notificacao.qry_notifica_item_.State in [dsInsert, dsEdit] ) then
      begin
        // Grava item do numerario
        nr_lanc := datm_notificacao.qry_notifica_item_NR_LANCAMENTO.AsString;
        datm_notificacao.qry_notifica_item_NR_SOLICITACAO.AsString := datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
        datm_notificacao.qry_notifica_item_.Post;
        // Atualizar Pagamentos
        CloseStoredProc( datm_notificacao.sp_atz_pagto_ag );
        datm_notificacao.sp_atz_pagto_ag.ParamByName('@NR_PROCESSO').AsString:= datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
        datm_notificacao.sp_atz_pagto_ag.ParamByName('@CD_ITEM').AsString    := datm_notificacao.qry_notifica_item_CD_ITEM.AsString;
        ExecStoredProc( datm_notificacao.sp_atz_pagto_ag );
        CloseStoredProc( datm_notificacao.sp_atz_pagto_ag );
        if IN_CPMF_NUM = '1' then  //  Inclui ou Atualiza Item CPMF
        begin
          CloseStoredProc( datm_notificacao.sp_atz_num_cpmf );
          datm_notificacao.sp_atz_num_cpmf.ParamByName( '@NR_PROCESSO' ).AsString:= datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
          datm_notificacao.sp_atz_num_cpmf.ParamByName( '@NR_SOLIC' ).AsString   := datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
          datm_notificacao.sp_atz_num_cpmf.ParamByName( '@cd_cliente' ).AsString := datm_notificacao.qry_processo_CD_CLIENTE.AsString;
          datm_notificacao.sp_atz_num_cpmf.ParamByName( '@cd_servico' ).AsString := datm_notificacao.qry_processo_CD_SERVICO.AsString;
          ExecStoredProc( datm_notificacao.sp_atz_num_cpmf );
          CloseStoredProc( datm_notificacao.sp_atz_num_cpmf );
        end;
        CloseStoredProc(datm_notificacao.sp_soma_solinum_ag );
        datm_notificacao.sp_soma_solinum_ag.ParamByName('@NR_PROCESSO').AsString := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
        datm_notificacao.sp_soma_solinum_ag.ParamByName('@nr_solinum').AsString  := datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
        ExecStoredProc( datm_notificacao.sp_soma_solinum_ag );
        CloseStoredProc( datm_notificacao.sp_soma_solinum_ag );
      end;
      datm_notificacao.atz_soma_numerario;
      datm_main.db_broker.Commit;
      Grava := True;
      datm_notificacao.qry_notifica_item_.Close;
      datm_notificacao.qry_notifica_item_.ParamByName('NR_PROCESSO').AsString:=datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
      datm_notificacao.qry_notifica_item_.ParamByName('NR_SOLICITACAO').AsString:=datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
      datm_notificacao.qry_notifica_item_.Prepare;
      datm_notificacao.qry_notifica_item_.Open;
      datm_notificacao.qry_notifica_item_.Locate('NR_LANCAMENTO',nr_lanc,[loCaseInsensitive, loPartialKey]);
      som_valores;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_notificacao.qry_notifica_item_.Cancel;
        datm_notificacao.qry_notifica_.Cancel;
        Grava := False;
        TrataErro(E);
      end;
    end;
  end;
  btn_mi(st_incluir, false, false, st_excluir);
end;

function Tfrm_notificacao.VerAlt: Boolean;
begin
  VerAlt := True;
  if pgctrl_notif_numerario.ActivePage = ts_lista then
  begin
    if Trim( msk_nr_processo.Text ) = '' then
    begin
      VerAlt := False;
      Exit;
    end;
    if ( datm_notificacao.qry_notifica_.State in [dsEdit, dsInsert] ) then
    begin
      if BoxMensagem('Solicitação de Numerário foi alterada.' + #13#10 +
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
      end else
        Cancelar;
    end;
  end else begin
    if ( datm_notificacao.qry_notifica_item_.State in [dsEdit, dsInsert] ) then
    begin
      if BoxMensagem('Itens da Solicitação foi alterado.' + #13#10 +
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
      end else
        Cancelar;
    end;
  end;
end;

procedure Tfrm_notificacao.msk_cd_unid_negExit(Sender: TObject);
begin
  if msk_cd_unid_neg.Text <> '' then
  begin
    ValCodEdt( msk_cd_unid_neg );
    datm_notificacao.qry_pesquisa_.Active:=false;
    datm_notificacao.qry_pesquisa_.Sql.Clear;
    datm_notificacao.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG (NOLOCK) WHERE CD_UNID_NEG="'+msk_cd_unid_neg.Text+'"');
    datm_notificacao.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO (NOLOCK)');
    datm_notificacao.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_notificacao.qry_pesquisa_.Active:=true;
    if datm_notificacao.qry_pesquisa_.RecordCount > 0 then
    begin
      edt_nm_unid_neg.text:= datm_notificacao.qry_pesquisa_.Fields[0].AsString;
      datm_notificacao.qry_pesquisa_.Close;
    end else begin
      datm_notificacao.qry_pesquisa_.Close;
      edt_nm_unid_neg.Text := '';
      BoxMensagem('Código da Unidade de Negócio inválido!', 2);
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;
  end else begin
    Boxmensagem('A Unidade de Negócio deve ser informado!',2);
    msk_cd_unid_neg.SetFocus;
  end;
end;

procedure Tfrm_notificacao.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text <> '' then
  begin
    ValCodEdt( msk_cd_produto );
    datm_notificacao.qry_pesquisa_.Active:=false;
    datm_notificacao.qry_pesquisa_.Sql.Clear;
    datm_notificacao.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO="'+msk_cd_produto.Text+'"');
    datm_notificacao.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO (NOLOCK)');
    datm_notificacao.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_notificacao.qry_pesquisa_.Active:=true;
    if datm_notificacao.qry_pesquisa_.RecordCount > 0 then
    begin
      edt_nm_produto.text:= datm_notificacao.qry_pesquisa_.Fields[0].AsString;
      datm_notificacao.qry_pesquisa_.Close;
    end else begin
      datm_notificacao.qry_pesquisa_.Close;
      edt_nm_produto.Text := '';
      BoxMensagem('Código do Produto inválido ou não habilidado!', 2);
      msk_cd_produto.SetFocus;
      Exit;
    end;
  end else begin
    Boxmensagem('O Produto deve ser informado!',2);
    msk_cd_produto.SetFocus;
  end;
end;

procedure Tfrm_notificacao.btn_cd_unid_negClick(Sender: TObject);
begin
  Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG', msk_cd_unid_neg, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );
  msk_cd_unid_negExit(Sender);
end;

procedure Tfrm_notificacao.btn_cd_produtoClick(Sender: TObject);
var
  produto:string;
begin
  produto:=ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Unidade'],'CD_PRODUTO');
  if produto <>'' then
  begin
    msk_cd_produto.text:=produto;
    msk_cd_produtoExit(Sender);
  end;
end;

procedure Tfrm_notificacao.FormCreate(Sender: TObject);
begin
  st_modificar:=false;
  st_incluir:=false;
  st_excluir:=false;
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  Application.CreateForm(Tdatm_notificacao, datm_notificacao);
  pnl_manut_proc.Color := clMenuBroker;
  Panel1.Color := clPnlClaroBroker;
  Panel2.Color := clPnlClaroBroker;
  Shape1.Brush.Color := clMenuBroker;
  with datm_notificacao do
  begin
    qry_traz_default_.Close;
    qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_traz_default_.Open;
    msk_cd_unid_neg.text:= qry_traz_default_CD_UNID_NEG.AsString;
    edt_nm_unid_neg.text:=qry_traz_default_NM_UNID_NEG.AsString;
    msk_cd_produto.text:=qry_traz_default_CD_PRODUTO.AsString;
    edt_nm_produto.text:=qry_traz_default_NM_PRODUTO.AsString;
    qry_banco_.close;
    qry_banco_.Prepare;
    qry_banco_.Open;
    qry_status_.close;
    qry_status_.Prepare;
    qry_status_.Open;
    qry_usuario_.close;
    qry_usuario_.Prepare;
    qry_usuario_.Open;
    qry_item_.close;
    qry_item_.Prepare;
    qry_item_.Open;
    qry_tp_destino_.close;
    qry_tp_destino_.Prepare;
    qry_tp_destino_.Open;
    qry_moeda_broker_.close;
    qry_moeda_broker_.Prepare;
    qry_moeda_broker_.Open;
    qry_favorecido_.close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;
  end;
  ts_notificacao.tabVisible := false;
  ts_numerario.tabVisible   := false;
  pgctrl_notif_numerario.ActivePage := ts_lista;
end;

procedure Tfrm_notificacao.btn_processoClick(Sender: TObject);
var
  processo : string;
begin
  processo:=ConsultaOnLineExSql('SELECT SUBSTRING(NR_PROCESSO,5,14)AS NR_PROCESSO, TPR.CD_CLIENTE,' +
                                ' (SELECT AP_EMPRESA FROM TEMPRESA_NAC CL (NOLOCK) WHERE CL.CD_EMPRESA = TPR.CD_CLIENTE) AS NM_CLIENTE,' +
                                ' TPR.CD_SERVICO,(SELECT TS.NM_SERVICO FROM TSERVICO TS (NOLOCK) WHERE TS.CD_SERVICO =TPR.CD_SERVICO)NM_SERVICO'+
                                ' FROM TPROCESSO TPR (NOLOCK) WHERE TPR.CD_PRODUTO = ' + QuotedStr(msk_cd_produto.Text) +
                                ' AND TPR.CD_UNID_NEG = '+ QuotedStr(msk_cd_unid_neg.Text) +
                                ' AND TPR.IN_LIBERADO = "1"  ',
                                'Processos',['NR_PROCESSO','CD_CLIENTE','NM_CLIENTE','CD_SERVICO','NM_SERVICO'],
                                ['Processo','Cód.','Cliente','Cód.','Serviço'],'NR_PROCESSO');
  if processo <>'' then
  begin
    msk_nr_processo.text:=processo;
    msk_nr_processoExit(Sender);
  end;
end;

procedure Tfrm_notificacao.msk_nr_processoExit(Sender: TObject);
var
  proc : string[18];
begin    
  if msk_nr_processo.Text <> '' then
  begin
    proc:= msk_cd_unid_neg.Text +  msk_cd_produto.Text +msk_nr_processo.Text;
    datm_notificacao.qry_processo_.Close;
    datm_notificacao.qry_processo_.ParamByName('NR_PROCESSO').AsString:= proc;
    datm_notificacao.qry_processo_.Prepare;
    datm_notificacao.qry_processo_.Open;
    if datm_notificacao.qry_processo_.RecordCount > 0 then
    begin
      datm_notificacao.qry_notifica_.Close;
      datm_notificacao.qry_notifica_.Prepare;
      datm_notificacao.qry_notifica_.ParamByName('NR_PROCESSO').AsString:= proc;
      datm_notificacao.qry_notifica_.Open;
      //localiza solicitação vinda do Pré-alerta
      if datm_notificacao.qry_processo_TP_SERVICO.AsString = '0' then
//      if 1=1 then
      begin
        btn_mi(st_incluir, false, false, st_excluir);
        Habilita_campos(true);
      end else begin
        btn_mi(false, false, false, false);
        Habilita_campos(false);//dbrdgrp_base_calculo.Visible:=false;
        btn_print_.Enabled := True;
      end;
      btn_cancela_numerario.Enabled := True;
      mi_cancela_numerario.Enabled  := True;
      btnPreCalculo.Enabled         := True; // Michel - 24/02/2010
    end else begin
      BoxMensagem('Código do Processo inválido ou não habilidado!', 2);
      msk_nr_processo.text:='';
      msk_nr_processo.SetFocus;
      btn_cancela_numerario.Enabled := False;
      mi_cancela_numerario.Enabled  := False;
      btnPreCalculo.Enabled         := False; // Michel - 24/02/2010
      Exit;
    end;
  end;
  pgctrl_notif_numerario.ActivePage := ts_lista;
end;

procedure Tfrm_notificacao.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_notificacao.btn_cancela_numerarioClick(Sender: TObject);
begin
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    Sql.Clear;
    Sql.Add(' SELECT COUNT(*) FROM TRECEBIMENTO_PROCESSO (NOLOCK)');
    Sql.Add(' WHERE NR_PROCESSO = "'+datm_notificacao.qry_notifica_NR_PROCESSO.AsString+'"');
    Sql.Add(' AND NR_SOLICITACAO = "'+datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString+'"');
    Sql.Add(' AND CD_STATUS IN ("A", "B", "P") ');
    tmpSql := Sql.Gettext;
    Open;
    if Fields[0].AsInteger > 0 then
    begin
      BoxMensagem(' Existe um registro de Recebimento não cancelado para esta Notificação!',2);
      Free;
      Exit;
    end;
    Free;
  end;
  datm_notificacao.qry_notifica_item_.Close;
  datm_notificacao.qry_notifica_item_.ParamByName('NR_PROCESSO').AsString:=datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
  datm_notificacao.qry_notifica_item_.ParamByName('NR_SOLICITACAO').AsString:=datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
  datm_notificacao.qry_notifica_item_.Prepare;
  datm_notificacao.qry_notifica_item_.Open;
  if (datm_notificacao.qry_notifica_item_.RecordCount > 0) and (datm_notificacao.qry_notifica_.FieldByName('VL_RECEBIDO').AsFloat > 0) then
  begin
    Boxmensagem('Esta Notificação não pode ser cancelada pois foi recebida total/parcialmente.', 2);
    Exit;
  end else begin
    if BoxMensagem('Esta Notificação será cancelada!' + #13#10 + 'Confirma cancelamento?', 1) then
    begin
      try
        try
          datm_main.db_broker.StartTransaction;
          with TQuery.Create(Application) do
          begin
            DataBaseName:='DBBROKER';
            Sql.Clear;
            Sql.Add('UPDATE TPROCESSO_DESPESAS SET NR_NOTIFICACAO = "0" ');
            Sql.Add(' WHERE NR_PROCESSO = "'+datm_notificacao.qry_notifica_NR_PROCESSO.AsString+'"');
            Sql.Add(' AND NR_NOTIFICACAO = "'+datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString+'"');
            ExecSql;
            Sql.Clear;
            Sql.Add('UPDATE TNUMERARIO_NOTIFICA_ITEM SET CD_STATUS = "C", IN_CANCELADO = "1"  ');
            Sql.Add(' WHERE NR_SOLICITACAO = "'+datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString+'"');
            Sql.Add('AND NR_PROCESSO = "'+datm_notificacao.qry_notifica_NR_PROCESSO.AsString+'"');
            Sql.Add('');
            ExecSql;
            Free;
          end;
          if not(datm_notificacao.qry_notifica_.State in[dsEdit]) then
            datm_notificacao.qry_notifica_.Edit;
          datm_notificacao.qry_notifica_CD_STATUS.AsString:='C';
          datm_notificacao.qry_notifica_.Post;
          with datm_notificacao do
          begin
            CloseStoredProc(sp_atz_status_solic_pagto_ag );
            sp_atz_status_solic_pagto_ag.ParamByName('@NR_PROCESSO').AsString   := qry_notifica_NR_PROCESSO.AsString;
            ExecStoredProc( sp_atz_status_solic_pagto_ag );
            CloseStoredProc( sp_atz_status_solic_pagto_ag );
          end;
          datm_main.db_broker.Commit;
          datm_notificacao.qry_notifica_item_.Close;
          datm_notificacao.qry_notifica_item_.ParamByName('NR_PROCESSO').AsString    := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
          datm_notificacao.qry_notifica_item_.ParamByName('NR_SOLICITACAO').AsString := datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
          datm_notificacao.qry_notifica_item_.Prepare;
          datm_notificacao.qry_notifica_item_.Open;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
      except
        BoxMensagem('Erro no Cancelamento!', 2);
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_notificacao.btn_incluirClick(Sender: TObject);
begin
  if ConsultaLookUPSQL('SELECT COUNT(*) CONTADOR FROM TPROCESSO_NOT_MONEY WHERE NR_PROCESSO = '''+msk_cd_unid_neg.Text+msk_cd_produto.Text+msk_nr_processo.Text+ '''',  'CONTADOR') = '0' then
  begin
    ShowMessage('Para esse processo, deve ser utilizado o myIndaia Money');
    Exit;
  end;

  nbDados.ActivePage := 'Dados';
  in_cpmf_num := '0';
  with Tquery.Create(Application) do
  begin
    DataBaseName:='DBBROKER';
    Sql.Add('SELECT CD_CLIENTE , CD_UNID_NEG, CD_PRODUTO, CD_SERVICO, CD_BANCO_DEB_CC, CD_BANCO_COM, ');
    Sql.Add(' CD_BANCO_DEB_COM,IN_CPMF_NUM FROM TCLIENTE_SERVICO (NOLOCK) WHERE CD_CLIENTE = :CD_CLIENTE AND ');
    Sql.Add(' CD_UNID_NEG = :CD_UNID_NEG AND ');
    Sql.Add(' CD_PRODUTO = :CD_PRODUTO AND ');
    Sql.Add(' CD_SERVICO = :CD_SERVICO');
    Params[0].AsString:= datm_notificacao.qry_processo_CD_CLIENTE.AsString;
    Params[1].AsString:= datm_notificacao.qry_processo_CD_UNID_NEG.AsString;
    Params[2].AsString:= datm_notificacao.qry_processo_CD_PRODUTO.AsString;
    Params[3].AsString:= datm_notificacao.qry_processo_CD_SERVICO.AsString;
    tmpSQL := SQL.GetText;
    Open;
    if RecordCount > 0 then
    begin
      if Trim( FieldByName('CD_BANCO_DEB_CC').AsString ) = '' then
      begin
        BoxMensagem('Banco para Débito em Conta Corrente não cadastrado para este Cliente X Serviço!', 2);
        Exit;
      end;
      if Trim( FieldByName('CD_BANCO_COM').AsString ) = '' then
      begin
        BoxMensagem('Banco da Comissária não cadastrado para este Cliente X Serviço!', 2);
        Exit;
      end;
    end else begin
      BoxMensagem('Parâmetros não cadastro para este Cliente X Serviço!', 2);
      Exit;
    end;
    in_cpmf_num := FieldByName('IN_CPMF_NUM').AsString;
    Free;
  end;

  if pgctrl_notif_numerario.ActivePage = ts_lista then
  begin // processo vinculado- caso o agenciamento não notificou não é premitido solicitar numerario
    if datm_notificacao.qry_processo_NR_PROCESSO_VINC.AsString <> '' then
    begin
      with TQuery.Create(Application) do
      begin
        DataBaseName:='DBBROKER';
        Sql.Add('SELECT NR_PROCESSO FROM TNUMERARIO_NOTIFICA (NOLOCK) ');
        Sql.Add('WHERE NR_PROCESSO = "'+datm_notificacao.qry_processo_NR_PROCESSO_VINC.AsString+'"');
        Sql.Add(' AND CD_STATUS IN ("A","B") ');
        Open;
        if recordcount = 0 then
        begin
          Boxmensagem('O Processo Vinculado '+ datm_notificacao.qry_processo_NR_PROCESSO_VINC.AsString+
                      'não foi Notificado'+ #10#13+ 'Favor entrar em contato com o Depto Agenciamento ',2);
          Free;
          Exit;
        end;
        Free;
      end;
    end;
    dbg_solicitacao.Enabled := false;
    datm_notificacao.qry_notifica_.Insert;
    datm_notificacao.qry_notifica_.FieldByName('NR_PROCESSO').AsString      := msk_cd_unid_neg.Text +  msk_cd_produto.Text +msk_nr_processo.Text; // datm_notificacao.qry_processo_.FieldByName('NR_PROCESSO').AsString;
    datm_notificacao.qry_notifica_.FieldByName('DT_SOLICITACAO').AsDateTime := dt_server;
    datm_notificacao.qry_notifica_.FieldByName('CD_USUARIO').AsString       := str_cd_usuario;
    datm_notificacao.qry_notifica_.FieldByName('CD_STATUS').AsString        := 'A';
    datm_notificacao.qry_notifica_.FieldByName('CD_BASE_CALCULO').AsString  := '0';
    with TQuery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Add('SELECT TX_NUMERARIO_OBS FROM TCLIENTE_HABILITACAO (NOLOCK) ');
      Sql.Add(' WHERE CD_CLIENTE   = "'+datm_notificacao.qry_processo_CD_CLIENTE.AsString+'"');
      Sql.Add('   AND CD_UNID_NEG  = "'+datm_notificacao.qry_processo_CD_UNID_NEG.AsString+'"');
      Sql.Add('   AND CD_PRODUTO   = "'+datm_notificacao.qry_processo_CD_PRODUTO.AsString+'"');
      Open;
      datm_notificacao.qry_notifica_.FieldByName('TX_NUMERARIO_OBS').AsString := Fields[0].AsString;
      Free;
    end;
  end;

  if pgctrl_notif_numerario.ActivePage = ts_numerario then
  begin
    if not (datm_notificacao.qry_notifica_DT_EMISSAO.IsNull) then
    begin
      Application.MessageBox(PChar('Não é possível incluir novos Itens pois esta Solicitação já foi emitida no dia '+datm_notificacao.qry_notifica_DT_EMISSAO.AsString),'Atenção',MB_ICONWARNING);
      Exit;
    end;
    // Não permite incluir itens quando a solicitação já está cancelada - 19/06/2006
    if datm_notificacao.qry_notifica_CD_STATUS.AsString = 'C' then
    begin
      Application.MessageBox('Não é possível incluir novos Itens pois esta Solicitação já foi cancelada','Atenção',MB_ICONWARNING);
      Exit;
    end;
    datm_notificacao.qry_notifica_item_.Insert;
    datm_notificacao.qry_notifica_item_NR_PROCESSO.AsString   := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
    datm_notificacao.qry_notifica_item_NR_SOLICITACAO.AsString:= datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
    datm_notificacao.qry_notifica_item_CD_STATUS.AsString     := 'A';
    datm_notificacao.qry_notifica_item_IN_CANCELADO.AsString  := '0';
    datm_notificacao.qry_notifica_item_VL_SOLICITADO.AsFloat  := 0;
    datm_notificacao.qry_notifica_item_VL_RECEBIDO.AsFloat    := 0;
    dbedt_cd_item.SetFocus;
  end;
  btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_notificacao.Habilita_campos(Hab: Boolean);
begin
  ts_notificacao.TABVisible       := not Hab;
  ts_numerario.TABVisible         := Hab;
  btn_print_.Enabled              := Hab;
  mi_impri_.Enabled               := Hab;
  btn_duplica.Enabled             := Hab;
end;

procedure Tfrm_notificacao.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_notificacao.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  if (datm_notificacao.qry_notifica_item_.IsEmpty) and not (btn_salvar.Enabled) then
    nbDados.ActivePage := 'Msg'
  else
    nbDados.ActivePage := 'Dados';

end;

procedure Tfrm_notificacao.dblckpbox_tp_destinoClick(Sender: TObject);
begin
  if ( datm_notificacao.qry_notifica_item_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, st_modificar, st_modificar, False );
  if datm_notificacao.qry_notifica_item_.FieldByName('TP_DESTINO').AsString = '0' then // Terceiros
  begin
    dbedt_cd_favorecido.Color    := clWindow;
    dbedt_cd_favorecido.ReadOnly := False;
    dbedt_cd_favorecido.TabStop  := True;
    btn_co_favorecido.Enabled    := True;
  end else begin
    if datm_notificacao.qry_notifica_item_.State in [dsedit, dsInsert] then
    begin
      with Tquery.Create(Application) do
      begin
        SQL.Clear;
        DataBaseName:='DBBROKER';
        Sql.Add('SELECT CD_CLIENTE , CD_UNID_NEG, CD_PRODUTO, CD_SERVICO, CD_BANCO_DEB_CC, CD_BANCO_COM, ');
        Sql.Add(' CD_BANCO_DEB_COM,IN_CPMF_NUM FROM TCLIENTE_SERVICO (NOLOCK) WHERE CD_CLIENTE = :CD_CLIENTE AND ');
        Sql.Add(' CD_UNID_NEG = :CD_UNID_NEG AND ');
        Sql.Add(' CD_PRODUTO = :CD_PRODUTO AND ');
        Sql.Add(' CD_SERVICO = :CD_SERVICO');
        Params[0].AsString:= datm_notificacao.qry_processo_CD_CLIENTE.AsString;
        Params[1].AsString:= datm_notificacao.qry_processo_CD_UNID_NEG.AsString;
        Params[2].AsString:= datm_notificacao.qry_processo_CD_PRODUTO.AsString;
        Params[3].AsString:= datm_notificacao.qry_processo_CD_SERVICO.AsString;
        Open;

        if datm_notificacao.qry_notifica_item_.FieldByName('TP_DESTINO').AsString = '1' then // Déb. Conta
          datm_notificacao.qry_notifica_item_.FieldByName('CD_BANCO').AsString := FieldByName('CD_BANCO_DEB_CC').AsString;
        if datm_notificacao.qry_notifica_item_.FieldByName('TP_DESTINO').AsString = '2' then // Comissária
          datm_notificacao.qry_notifica_item_.FieldByName('CD_BANCO').AsString := FieldByName('CD_BANCO_COM').AsString;
        if datm_notificacao.qry_notifica_item_.FieldByName('TP_DESTINO').AsString = '3' then // Déb Conta da Comissária
          datm_notificacao.qry_notifica_item_.FieldByName('CD_BANCO').AsString := FieldByName('CD_BANCO_DEB_COM').AsString;
        Close;
        { sistema não irá lançar mais o favorecido para a solicitação - a pedido de Vitor Zanin (05/11/2007)
        datm_notificacao.qry_notifica_item_.FieldByName('CD_FAVORECIDO').AsString  := '';
        SQL.Clear;
        SQL.Add('SELECT TOP 1(F.CD_FAVORECIDO) FROM TFAVORECIDO F (NOLOCK) WHERE CD_BANCO = ''' + datm_notificacao.qry_notifica_item_.FieldByName('CD_BANCO').AsString + ''' ');
        Open;
        datm_notificacao.qry_notifica_item_.FieldByName('CD_FAVORECIDO').AsString  := Fields[0].AsString;
        }
        Free;
      end;
    end;
    dbedt_cd_favorecido.Color    := clWindow;
    dbedt_cd_favorecido.ReadOnly := False;
    dbedt_cd_favorecido.TabStop  := True;
    btn_co_favorecido.Enabled    := True;
  end;
end;

procedure Tfrm_notificacao.dbedt_cd_itemExit(Sender: TObject);
begin
  if datm_notificacao.qry_notifica_item_.State in [dsEdit, dsInsert] then
  begin
    ValidCodigo(dbedt_cd_item);
    if dbedt_cd_item.Text <> '' then
    begin
      if (dbedt_nm_item.Text = '') then
      begin
        BoxMensagem('Código do Item inválido!',2);
        dbedt_cd_item.SetFocus;
        Exit;
      end;
    (* if (datm_notificacao.qry_item_.Locate('CD_ITEM',dbedt_cd_item.Text,[])) and
          (datm_notificacao.qry_item_TP_ITEM.AsString = '1') then
      begin
        dbedt_nm_item.Text := '';
        BoxMensagem('Código do Item inválido!',2);
        dbedt_cd_item.SetFocus;
        Exit;
      end; *)
    end;

  // Verifica se Unidade/Produto/Item estão cadastrados na tabela TITEM_PRIORIDADE
  with TQuery.Create(Application) do
  begin
    DataBaseName:='DBBROKER';
    Sql.Clear;
    Sql.Add('SELECT CD_ITEM FROM TITEM_PRIORIDADE (NOLOCK)');
    sql.Add(' WHERE CD_UNID_NEG = :CD_UNID_NEG AND CD_PRODUTO = :CD_PRODUTO');
    DataSource:=datm_notificacao.ds_processo;
    Sql.Add(' AND CD_ITEM = "'+dbedt_cd_item.Text+'"');
    Open;
    if (recordcount = 0) and (dbedt_cd_item.Text <> '')then
    begin
      BoxMensagem('Unidade/Produto/Item não cadatrados em ITEM-PRIORIDADE. Comunique ao suporte.',2);
      dbedt_cd_item.SetFocus;
      Close;
      Exit;
    end;
    Close;
  end;


    with TQuery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT N.CD_CLIENTE, N.CD_UNID_NEG, N.CD_PRODUTO, N.CD_SERVICO, N.NR_SOLICITACAO, ');
      Sql.Add(' N.CD_ITEM, C.NM_STORED_PROCEDURE FROM TCLIENTE_NUMERARIO N (NOLOCK), TCALCULO C (NOLOCK) ');
      sql.Add(' WHERE N.CD_CLIENTE = :CD_CLIENTE AND  N.CD_UNID_NEG = :CD_UNID_NEG AND ');
      Sql.Add(' N.CD_PRODUTO = :CD_PRODUTO AND N.CD_SERVICO = :CD_SERVICO  AND N.TP_CALCULO *= C.CD_CALCULO');
      DataSource:=datm_notificacao.ds_processo;
      Sql.Add(' AND N.CD_ITEM = "'+dbedt_cd_item.Text+'"');
      Open;
      if recordcount > 0 then
      begin
        try
          with datm_notificacao do
          begin
            CloseStoredProc(sp_calculo);
            sp_calculo.StoredProcName := '';
            sp_calculo.StoredProcName := FieldByName('NM_STORED_PROCEDURE').AsString;
            sp_calculo.Params.CreateParam( ftString,  '@NR_PROCESSO', ptInput ).AsString      := qry_processo_.FieldByName('NR_PROCESSO').AsString;
            sp_calculo.Params.CreateParam( ftString,  '@CD_ITEM',     ptInput ).AsString      := qry_notifica_item_.FieldByName('CD_ITEM').AsString;
            sp_calculo.Params.CreateParam( ftFloat,   '@RESULTADO',   ptInputOutput ).AsFloat := StrToInt( Trim( qry_notifica_.FieldByName('CD_BASE_CALCULO').AsString ) );
            sp_calculo.Params.CreateParam( ftInteger, 'Result',       ptResult );
            ExecStoredProc(sp_calculo);
            if sp_calculo.ParamByName('Result').AsInteger = 0 then
            begin
              qry_notifica_item_.FieldByName('VL_ITEM_CALCULADO').AsFloat := sp_calculo.ParamByName('@RESULTADO').AsFloat;
              qry_notifica_item_.FieldByName('CD_TIPO_CALCULO').AsString  := 'A';
              if qry_notifica_item_.FieldByName('VL_SOLICITADO').AsFloat = 0 then
                qry_notifica_item_.FieldByName('VL_SOLICITADO').AsFloat   := sp_calculo.ParamByName('@RESULTADO').AsFloat;
            end
            else
            begin
              ExibeErro( FieldByName('NM_STORED_PROCEDURE').AsString, sp_calculo.ParamByName('Result').AsInteger, dbedt_nm_item.Text, 0 );
            end;
            CloseStoredProc(sp_calculo);
          end;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
      end
      else
      begin
        datm_notificacao.qry_notifica_item_.FieldByName('CD_TIPO_CALCULO').AsString := 'M';
      end;
      Free;
    end;
  end;
end;

procedure Tfrm_notificacao.dbedt_cd_bancoExit(Sender: TObject);
begin
  if datm_notificacao.qry_notifica_item_.State in [dsEdit, dsInsert] then
  begin
    ValidCodigo(dbedt_cd_banco);
    if dbedt_cd_banco.Text <> '' then
    begin
      if dbedt_nm_banco.Text = '' then
      begin
        BoxMensagem('Código do Banco inválido!',2);
        dbedt_cd_banco.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_notificacao.dbedt_cd_favorecidoChange(Sender: TObject);
begin
  if datm_notificacao.qry_notifica_item_.State in [dsEdit, dsInsert] then
    btn_mi(false, st_modificar, st_modificar, False)
end;

procedure Tfrm_notificacao.dbedt_cd_favorecidoExit(Sender: TObject);
begin
  if datm_notificacao.qry_notifica_item_.State in [dsEdit, dsInsert] then
  begin
    ValidCodigo(dbedt_cd_favorecido);
    if dbedt_cd_favorecido.Text <> '' then
    begin
      if dbedt_nm_favorecido.Text = '' then
      begin
        BoxMensagem('Código do Favorecido inválido!',2);
        dbedt_cd_favorecido.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_notificacao.pgctrl_notif_numerarioChange(Sender: TObject);
begin
  //by Carlos 01/07/2010 - evitar entrar com o tab durante a digitação/gravação dos itens
  msk_nr_processo.TabStop := pgctrl_notif_numerario.ActivePageIndex=0;
  msk_cd_unid_neg.TabStop := pgctrl_notif_numerario.ActivePageIndex=0;
  msk_cd_produto.TabStop  := pgctrl_notif_numerario.ActivePageIndex=0;

  btnDuplicaSolic.Enabled :=  (pgctrl_notif_numerario.ActivePage = ts_notificacao) or
                              (pgctrl_notif_numerario.ActivePage = ts_numerario);
  if pgctrl_notif_numerario.ActivePage <> ts_lista then
  begin
    datm_notificacao.qry_notifica_item_.Close;
    datm_notificacao.qry_notifica_item_.ParamByName('NR_PROCESSO').AsString:=datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
    datm_notificacao.qry_notifica_item_.ParamByName('NR_SOLICITACAO').AsString:=datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
    datm_notificacao.qry_notifica_item_.Prepare;
    datm_notificacao.qry_notifica_item_.Open;
  end;
  if pgctrl_notif_numerario.ActivePage = ts_numerario then
  begin
    som_valores;
    if (datm_notificacao.qry_notifica_item_.IsEmpty) and not (btn_salvar.Enabled) then
      nbDados.ActivePage := 'Msg'
    else
      nbDados.ActivePage := 'Dados';
  end;

  BtnIncluirObs.Enabled := (pgctrl_notif_numerario.ActivePage = ts_obs) and (msk_cd_produto.Text = '01');
end;

procedure Tfrm_notificacao.pBeforePrint(Sender: TObject);
var
  S: String;
  I: Integer;
begin
  if SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'rel_notifica_mod2.rtm') or
     SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'rel_notifica_mod2_exp.rtm') then
     begin
    datm_notificacao.pp_referencias.RangeEndCount := 2;
  end else if SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'REL_NOTIFICA_MOD2_CLIENTES.RTM') or
     SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'REL_NOTIFICA_MOD2_CLIENTES.RTM') then
     begin
     TppLabel(Frm_impressao.FindComponent('ppLabel43')).Caption := 'TOTAL A SER PAGO DIRETO PELO CLIENTE';
  end
  else  if SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'rel_notifica_desemb.rtm') or
     SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'rel_notifica_desemb_exp.rtm') then
  begin
    datm_notificacao.qryFCL.Close;
    datm_notificacao.qryFCL.ParamByName('NR_PROCESSO').AsString := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
    datm_notificacao.qryFCL.Open;
    if not datm_notificacao.qryFCL.isEmpty then
    begin
     TppLabel(Frm_impressao.FindComponent('ppMemCarga')).Caption := 'Contâiners: ';
      while not datm_notificacao.qryFCL.Eof do
      begin
        TppLabel(Frm_impressao.FindComponent('ppMemCarga')).Caption :=  TppLabel(Frm_impressao.FindComponent('ppMemCarga')).Caption + datm_notificacao.qryFCL.FieldByName('TEXTO').AsString + ' ';
        datm_notificacao.qryFCL.Next;
      end;
    end;
    TppLabel(Frm_impressao.FindComponent('ppMemCarga')).Caption := Copy(TppLabel(Frm_impressao.FindComponent('ppMemCarga')).Caption, 1, Length(TppLabel(Frm_impressao.FindComponent('ppMemCarga')).Caption ) - 2) + '. ';
    datm_notificacao.qryLCL.Close;
    datm_notificacao.qryLCL.ParamByName('NR_PROCESSO').AsString := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
    datm_notificacao.qryLCL.Open;
    if not datm_notificacao.qryLCL.isEmpty then
    begin
      TppLabel(Frm_impressao.FindComponent('ppMemCarga')).Caption := 'Carga Solta: ';
      while not datm_notificacao.qryLCL.Eof do begin
        TppLabel(Frm_impressao.FindComponent('ppMemCarga')).Caption :=  TppLabel(Frm_impressao.FindComponent('ppMemCarga')).Caption + datm_notificacao.qryLCL.FieldByName('TEXTO').AsString + ' ';
        datm_notificacao.qryLCL.Next;
      end;
    end;
    //TppLabel(Frm_impressao.FindComponent('ppMemCarga')).Caption := Copy(TppLabel(Frm_impressao.FindComponent('ppMemCarga')).Caption, 3, Length(TppLabel(Frm_impressao.FindComponent('ppMemCarga')).Caption ) - 4) + '. ';
    if (datm_notificacao.qryLCL.isEmpty) and (datm_notificacao.qryFCL.isEmpty) then
    begin
     TppLabel(Frm_impressao.FindComponent('ppMemCarga')).Visible := False;
     TppShape(Frm_impressao.FindComponent('ppShape3')).Visible := False;
    end;

    datm_notificacao.qryFCL.Close;
    datm_notificacao.qryLCL.Close;

    // Listar Referências
    S := '';
    I := 1;
    datm_notificacao.qry_imp_referencias_.First;
    while not datm_notificacao.qry_imp_referencias_.Eof do
    begin
      S := S + Trim(datm_notificacao.qry_imp_referencias_CD_REFERENCIA.AsString) + ', ';
      datm_notificacao.qry_imp_referencias_.Next;
      if (I mod 5) = 0 then
        S := S + #13;
      Inc(I);
    end;
    S := Copy(S, 1, Length(S) -2);
    TppMemo(Frm_impressao.FindComponent('ppMemo1')).Text := S;
  end;
end;

procedure Tfrm_notificacao.som_valores;
var
  vSOMA : TQuery;
begin
  vSOMA:=TQuery.Create(Application);
  vSOMA.DataBaseName:='DBBROKER';
  vSOMA.Sql.Add('SELECT SUM(VL_SOLICITADO) FROM TNUMERARIO_NOTIFICA_ITEM (NOLOCK)');
  vSOMA.Sql.Add(' WHERE NR_PROCESSO= "'+datm_notificacao.qry_notifica_NR_PROCESSO.AsString+'"');
  vSOMA.Sql.Add('AND NR_SOLICITACAO = "'+datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString+'"');
  vSOMA.Sql.Add('AND TP_DESTINO IN ("1", "5") ');
  vSOMA.Open;
  edt_tt_deb_conta.text:=formatfloat('###,###,##0.00',vSOMA.Fields[0].AsFloat);
  vSOMA.Close;
  vSOMA.Sql.Clear;
  vSOMA.Sql.Add('SELECT SUM(VL_SOLICITADO) FROM TNUMERARIO_NOTIFICA_ITEM (NOLOCK)');
  vSOMA.Sql.Add(' WHERE NR_PROCESSO= "'+datm_notificacao.qry_notifica_NR_PROCESSO.AsString+'"');
  vSOMA.Sql.Add('AND NR_SOLICITACAO = "'+datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString+'"');
  vSOMA.Sql.Add('AND TP_DESTINO IN ("2","3") ');
  vSOMA.Open;
  edt_deb_comiss.Text := formatfloat('###,###,##0.00',vSOMA.Fields[0].AsFloat);
end;

procedure Tfrm_notificacao.btn_excluirClick(Sender: TObject);
var
  str_cd_item : string;
begin
  if datm_notificacao.qry_notifica_IN_EMITIDO.AsString = '1' then
  begin
    boxmensagem('Solicitação já emitida. Exclusão não permitida!',2);
    Exit;
  end;
  if pgctrl_notif_numerario.ActivePage = ts_lista then
  begin
    datm_notificacao.qry_notifica_item_.Close;
    datm_notificacao.qry_notifica_item_.ParamByName('NR_PROCESSO').AsString:=datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
    datm_notificacao.qry_notifica_item_.ParamByName('NR_SOLICITACAO').AsString:=datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
    datm_notificacao.qry_notifica_item_.Prepare;
    datm_notificacao.qry_notifica_item_.Open;
    if datm_notificacao.qry_notifica_item_.RecordCount = 0 then
    begin
      if (datm_notificacao.qry_notifica_NR_SOLICITACAO.AsInteger = datm_notificacao.qry_notifica_.RecordCount) and (datm_notificacao.qry_notifica_CD_STATUS.AsString <> 'B') then
      begin
        if BoxMensagem( 'Esta Solicitação será excluída! ' + #13#10 + 'Confirma exclusão?', 1 ) then
        try
          datm_main.db_broker.StartTransaction;
          datm_notificacao.qry_notifica_.Delete;
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
            datm_notificacao.qry_notifica_.cancel;
            TrataErro(E);
          end;
        end;
      end else
        BoxMensagem( 'Só é permitido excluir a última solicitação do processo que não tenha sido Baixada!', 2 );
    end else
      BoxMensagem( 'Esta Solicitação não pode ser excluída!', 2 );
  end else begin
    if (datm_notificacao.qry_notifica_CD_STATUS.AsString = 'A' ) and (datm_notificacao.qry_notifica_item_CD_STATUS.AsString = 'A') then
    begin
      if BoxMensagem( 'Este Item da Solicitação será excluído! ' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        datm_notificacao.qry_notifica_item_.Delete;
        // Atualiza total solicitado
        datm_notificacao.atz_soma_numerario;
        with datm_notificacao do
        begin
          if IN_CPMF_NUM = '1' then  // Atualiza Item CPMF no Numerário
          begin
            CloseStoredProc( sp_atz_num_cpmf );
            sp_atz_num_cpmf.ParamByName( '@NR_PROCESSO' ).AsString    := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
            sp_atz_num_cpmf.ParamByName( '@NR_SOLIC' ).AsString       := datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
            sp_atz_num_cpmf.ParamByName( '@cd_cliente' ).AsString     := datm_notificacao.qry_processo_CD_CLIENTE.AsString;
            sp_atz_num_cpmf.ParamByName( '@cd_servico' ).AsString     := datm_notificacao.qry_processo_CD_SERVICO.AsString;
            ExecStoredProc( sp_atz_num_cpmf );
            CloseStoredProc( sp_atz_num_cpmf );
          end;
        end;
        datm_main.db_broker.Commit;
        som_valores;
        if (datm_notificacao.qry_notifica_item_.IsEmpty) and not (btn_salvar.Enabled) then
          nbDados.ActivePage := 'Msg'
        else
          nbDados.ActivePage := 'Dados';

      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          datm_notificacao.qry_notifica_item_.Cancel;
          TrataErro(E);
        end;
      end;
    end else
      BoxMensagem( 'Este Lançamento não pode ser excluído!', 2 );
  end;
end;

procedure Tfrm_notificacao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_notificacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_notificacao.qry_notifica_item_.close;
  datm_notificacao.qry_notifica_.Close;
  datm_notificacao.qry_processo_.Close;
  datm_notificacao.Free;
  Action := caFree;
end;

procedure Tfrm_notificacao.pgctrl_notif_numerarioChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_notificacao.btn_duplicaClick(Sender: TObject);
begin
  if BoxMensagem( 'Você deseja duplicar a ' + #13#10 + 'solicitação nº ' + datm_notificacao.qry_notifica_.FieldByName('NR_SOLICITACAO').AsString + '?', 1 ) then
  begin
    with datm_notificacao do
    begin
      try
        datm_main.db_broker.StartTransaction;
        CloseStoredProc(sp_duplica_numerario_ag);
        sp_duplica_numerario_ag.ParamByName('@NR_PROCESSO').AsString    := qry_notifica_.FieldByName('NR_PROCESSO').AsString;
        sp_duplica_numerario_ag.ParamByName('@NR_SOLICITACAO').AsString := qry_notifica_.FieldByName('NR_SOLICITACAO').AsString;
        ExecStoredProc(sp_duplica_numerario_ag);
        CloseStoredProc(sp_duplica_numerario_ag);
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      qry_notifica_.Close;
      qry_notifica_.Prepare;
      qry_notifica_.Open;
      qry_notifica_.FetchAll;
      qry_notifica_.Last;
      qry_notifica_item_.Close;
      qry_notifica_item_.Prepare;
      qry_notifica_item_.Open;
    end;
  end;
end;

procedure Tfrm_notificacao.btn_co_itemClick(Sender: TObject);
begin
  if not (datm_notificacao.qry_notifica_item_.State in [dsEdit, dsInsert]) then
    datm_notificacao.qry_notifica_item_.Edit;
  datm_notificacao.qry_notifica_item_CD_ITEM.AsString := ConsultaOnLineExSQL('SELECT I.NM_ITEM, I.CD_ITEM ' +
                                                                             'FROM TITEM I (NOLOCK) ' +
                                                                             'WHERE I.CD_TIPO_ITEM = "D" AND '+
                                                                             'I.IN_ATIVO = "1" ','Item', ['NM_ITEM' ,'CD_ITEM'],
                                                                            ['Item', 'Codigo'],'CD_ITEM');
  dbedt_cd_itemExit(nil);
end;

procedure Tfrm_notificacao.btn_co_bancoClick(Sender: TObject);
begin
  if not (datm_notificacao.qry_notifica_item_.State in [dsEdit, dsInsert]) then
    datm_notificacao.qry_notifica_item_.edit;
  datm_notificacao.qry_notifica_item_CD_BANCO.AsString :=   ConsultaOnLineExSQL('SELECT B.NM_BANCO, B.CD_BANCO ' +
                                                                                'FROM TBANCO B (NOLOCK) ' +
                                                                                'WHERE B.IN_ATIVO = "1" ','Banco', ['NM_BANCO' ,'CD_BANCO'],
                                                                               ['Banco', 'Codigo'],'CD_BANCO');
  dbedt_cd_bancoExit(nil);
end;

procedure Tfrm_notificacao.DBMemo1Change(Sender: TObject);
begin
  if datm_notificacao.qry_notifica_.State in [dsEdit, dsInsert] then
    btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_notificacao.dbrdgrp_base_calculoClick(Sender: TObject);
begin
  if btn_salvar.Enabled = False then
  begin
    BoxMensagem('Clique no botão incluir antes de decidir a forma do calculo',3);
    dbrdgrp_base_calculo.ItemIndex := -1;
    datm_notificacao.qry_notifica_.Cancel;
  end;
end;

procedure Tfrm_notificacao.msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg then btn_cd_unid_negClick(btn_cd_unid_neg);
    if Sender = msk_cd_produto  then btn_cd_produtoClick(btn_cd_produto);
    if Sender = msk_nr_processo then btn_processoClick(btn_processo);
    if Sender = dbedt_cd_item   then btn_co_itemClick(btn_co_item);
    if Sender = dbedt_cd_banco  then btn_co_bancoClick(btn_co_banco);
    if Sender = medtProcesso    then btnCoProcessoClick(btnCoProcesso);
  end;
end;

procedure Tfrm_notificacao.dbedt_cd_itemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( datm_notificacao.qry_notifica_item_.IsEmpty ) and not ( btn_salvar.Enabled ) then
  begin
    BoxMensagem('Clique em incluir para a inclusão de um novo item.',3);
    dbedt_cd_item.Text := '';
    datm_notificacao.qry_notifica_item_.Cancel;
    btn_mi(True,False,False,False);
  end;
  if Key = VK_F5 then
    if Sender = dbedt_cd_item then
      btn_co_itemClick(btn_co_item);
end;

procedure Tfrm_notificacao.btn_print_Click(Sender: TObject);
begin
  datm_notificacao.qry_imp_notificacao_.close;
  datm_notificacao.qry_imp_notificacao_.ParamByName('NR_SOLICITACAO').AsString := datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
  datm_notificacao.qry_imp_notificacao_.ParamByName('NR_PROCESSO').AsString    := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
  datm_notificacao.qry_imp_notificacao_.Prepare;
  datm_notificacao.qry_imp_notificacao_.Open;
  datm_notificacao.qryItemCliente.close;
  datm_notificacao.qryItemCliente.ParamByName('NR_SOLICITACAO').AsString := datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
  datm_notificacao.qryItemCliente.ParamByName('NR_PROCESSO').AsString    := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
  datm_notificacao.qryItemCliente.Prepare;
  datm_notificacao.qryItemCliente.Open;
  datm_notificacao.qryItemIndaia.close;
  datm_notificacao.qryItemIndaia.ParamByName('NR_SOLICITACAO').AsString := datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
  datm_notificacao.qryItemIndaia.ParamByName('NR_PROCESSO').AsString    := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
  datm_notificacao.qryItemIndaia.Prepare;
  datm_notificacao.qryItemIndaia.Open;
  if datm_notificacao.qryMoedas.Active then
    datm_notificacao.qryMoedas.Close;
  datm_notificacao.qryMoedas.ParamByName('NR_PROCESSO').AsString := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
  datm_notificacao.qryMoedas.Prepare;
  datm_notificacao.qryMoedas.Open;
  //ShowMessage(IntToStr(datm_notificacao.qryMoedas.RecordCount));
  // verifica se o processo possui Referência cadastrada e emite um aviso (kleber - 10/03/2006)
  // alterado - michel - 10/11/2008
  if datm_notificacao.qry_imp_referencias_.Active then
    datm_notificacao.qry_imp_referencias_.Close;
  datm_notificacao.qry_imp_referencias_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text +
     msk_cd_produto.Text + msk_nr_processo.Text;
  datm_notificacao.qry_imp_referencias_.Open;

  if datm_notificacao.qry_imp_referencias_.IsEmpty then
  begin
    Application.MessageBox('Processo não pode ser impresso pois não possui referência cadastrada! ' + chr(13) + 'Preencha a referência na Manutenção do Processo e tente novamente!', 'Campos Necessários',  MB_OK + MB_ICONERROR);
    Exit;
  end;

  datm_notificacao.qry_imp_notificacao_exp_.close;
  datm_notificacao.qry_imp_notificacao_exp_.ParamByName('NR_SOLICITACAO').AsString := datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
  datm_notificacao.qry_imp_notificacao_exp_.ParamByName('NR_PROCESSO').AsString    := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
  datm_notificacao.qry_imp_notificacao_exp_.Prepare;
  datm_notificacao.qry_imp_notificacao_exp_.Open;
  Application.CreateForm(TFrm_impressao, Frm_impressao );
  Frm_impressao.cd_emp_nac    := datm_notificacao.qry_processo_CD_CLIENTE.AsString;
  Frm_impressao.cd_unid_neg   := msk_cd_unid_neg.text;
  Frm_impressao.cd_produto    := msk_cd_produto.text;
  Frm_impressao.cd_via_transp := '';
  Frm_impressao.cd_modulo     := '0504';
  Frm_impressao.vBeforePrint  :=  pBeforePrint;
  Frm_impressao.ShowModal;
  if datm_notificacao.qry_notifica_IN_EMITIDO.AsString = '1' then exit;
  if not(Boxmensagem('Impressão realizado com Sucesso?',1)) then exit;
  if not(datm_notificacao.qry_notifica_.State in [dsEdit]) then
    datm_notificacao.qry_notifica_.Edit;
  datm_notificacao.qry_notifica_IN_EMITIDO.AsString := '1';
  datm_notificacao.qry_notifica_DT_EMISSAO.AsDatetime:= dt_Server;
  datm_notificacao.qry_notifica_.Post;
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    Sql.Clear;
    // A linha abaixo foi alterada incluindo ISNULL para os campos DT_REALIZACAO e CD_RESP_REALIZACAO para não sobrescrevê-los se estiverem preenchidos - Michel - 29/10/2008
    Sql.Add('UPDATE TFOLLOWUP SET DT_REALIZACAO = ISNULL(DT_REALIZACAO, CONVERT(DATETIME, ''' + DateToStr(dt_server) + ''' , 103)), CD_RESP_REALIZACAO = ISNULL(CD_RESP_REALIZACAO, ''' + str_cd_usuario + ''')');
    Sql.Add('WHERE NR_PROCESSO =:NR_PROCESSO AND CD_EVENTO =:CD_EVENTO AND IN_APLICAVEL = ''1''');
    if ConsultaLookUPSQL('SELECT COUNT(*) CONT FROM TNUMERARIO_NOTIFICA_ITEM (NOLOCK) ' +
                          ' WHERE NR_PROCESSO = "' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString +'" ' +
                          '  AND NR_SOLICITACAO = "'+ datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString +'" ' +
                          '  AND VL_SOLICITADO > 0 ' +
                          '  AND CD_ITEM IN (SELECT CD_ITEM FROM TITEM (NOLOCK) WHERE IN_ITEM_DI = "0") ', 'CONT') > '0' then
    begin
      ParamByName('NR_PROCESSO').AsString    := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
      ParamByName('CD_EVENTO').AsString      := '018';
      ExecSql;
    end;
    // Query incluída porque este evento pode ser alterado, diferente do evento anterior (018) -- Esta é a query original que era utilizada para os dois eventos - Michel - 29/10/2008
    Sql.Clear;
    Sql.Add('UPDATE TFOLLOWUP SET DT_REALIZACAO = CONVERT(DATETIME, ''' + DateToStr(dt_server) + ''' , 103), CD_RESP_REALIZACAO = ''' + str_cd_usuario + '''');
    Sql.Add('WHERE NR_PROCESSO =:NR_PROCESSO AND CD_EVENTO =:CD_EVENTO AND IN_APLICAVEL = ''1''');
    if ConsultaLookUPSQL('SELECT COUNT(*) CONT FROM TNUMERARIO_NOTIFICA_ITEM (NOLOCK) ' +
                          ' WHERE NR_PROCESSO = "' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString +'" ' +
                          '  AND NR_SOLICITACAO = "'+ datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString +'" ' +
                          '  AND VL_SOLICITADO > 0 ' +
                          '  AND SUBSTRING(NR_PROCESSO, 3, 2) IN ("01", "03") ' +
                          '  AND CD_ITEM IN (SELECT CD_ITEM FROM TITEM (NOLOCK) WHERE IN_ITEM_DI = "1") ', 'CONT') > '0' then
    begin
      ParamByName('NR_PROCESSO').AsString    := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
      ParamByName('CD_EVENTO').AsString      := '384';
      ExecSql;
    end;
    SQL.Clear;
    SQl.Add('Exec sp_atz_followup ''' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + '''');
    ExecSQL;
    Free;
  end;
end;

procedure Tfrm_notificacao.lblFecharClick(Sender: TObject);
begin
  medtProcesso.Clear;
  medtSolic.Clear;
  pnlDuplica.Visible := False;
end;

procedure Tfrm_notificacao.btnDuplicaSolicClick(Sender: TObject);
begin
  pnlDuplica.Visible := true;
  medtProcesso.SetFocus;
end;

procedure Tfrm_notificacao.btnDuplicarClick(Sender: TObject);
var vQryDados, vQryInsert: TQuery;
begin
  medtSolicExit(nil);
  // verifica se qry de item notificacao não está em inserção / edição
  if datm_notificacao.qry_notifica_item_.State in [dsInsert, dsEdit] then
  begin
    ShowMessage('Salve as alterações antes de duplicar os itens!');
    lblFecharClick(nil);
    Exit;
  end;
  // verifica processo e solicitação
  if ConsultaLookUpSQL('SELECT COUNT(*) CONT FROM TNUMERARIO_NOTIFICA (NOLOCK) ' +
      ' WHERE NR_PROCESSO    = "' + Trim(dbedtUnid.Text + dbedtProd.Text + medtProcesso.Text) + '" ' +
      '   AND NR_SOLICITACAO = "' + medtSolic.Text + '" ', 'CONT') = '0' then
      begin
    ShowMessage('Processo/Solicitação Inválida ou Inexistente!');
    medtSolic.SetFocus;
    Exit;
  end;
  //verifica se processo/solicitação não é igual a atual
  if (Trim(dbedtUnid.Text + dbedtProd.Text + medtProcesso.Text) = datm_notificacao.qry_notifica_NR_PROCESSO.AsString) and
     (medtSolic.Text = datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString) then
     begin
    ShowMessage('Processo/Solicitação de Origem igual a Processo/Solicitação de Destino!');
    medtProcesso.SetFocus;
    Exit;
  end;

  try
    //update em itens existentes
    vQryDados := TQuery.Create(application);
    vQryDados.DataBaseName := 'DBBROKER';
    vQryDados.Close;
    vQryDados.SQL.Clear;
    vQryDados.SQL.Add(' UPDATE NNI2 SET ');
    vQryDados.SQL.Add('   VL_ITEM_CALCULADO = 0, ');
    vQryDados.SQL.Add('   VL_SOLICITADO = NNI.VL_SOLICITADO, ');
    vQryDados.SQL.Add('   VL_RECEBIDO = 0, ');
    vQryDados.SQL.Add('   VL_UTILIZADO = 0, ');
    vQryDados.SQL.Add('   TP_DESTINO = NNI.TP_DESTINO, ');
    vQryDados.SQL.Add('   CD_TIPO_CALCULO = NNI.CD_TIPO_CALCULO, ');
    vQryDados.SQL.Add('   CD_BANCO = NNI.CD_BANCO, ');
    vQryDados.SQL.Add('   CD_FAVORECIDO = NNI.CD_FAVORECIDO, ');
    vQryDados.SQL.Add('   CD_MOEDA_COMPRA = NNI.CD_MOEDA_COMPRA, ');
    vQryDados.SQL.Add('   CD_MOEDA_VENDA = NNI.CD_MOEDA_VENDA, ');
    vQryDados.SQL.Add('   VL_COMPRA = 0, ');
    vQryDados.SQL.Add('   VL_VENDA = 0, ');
    vQryDados.SQL.Add('   NR_SOLIC_VINC = NNI.NR_SOLIC_VINC ');
    vQryDados.SQL.Add('  FROM TNUMERARIO_NOTIFICA_ITEM NNI (NOLOCK), TNUMERARIO_NOTIFICA_ITEM NNI2 (NOLOCK) ');
    vQryDados.SQL.Add(' WHERE NNI.NR_PROCESSO = "' + Trim(dbedtUnid.Text + dbedtProd.Text + medtProcesso.Text) + '" ');
    vQryDados.SQL.Add('   AND NNI.NR_SOLICITACAO = "' + medtSolic.Text + '" ');
    vQryDados.SQL.Add('   AND NNI2.NR_PROCESSO = "' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + '" ');
    vQryDados.SQL.Add('   AND NNI2.NR_SOLICITACAO = "' + datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString + '" ');
    vQryDados.SQL.Add('   AND NNI.CD_ITEM = NNI2.CD_ITEM ');
    try
      vQryDados.ExecSQL;
    except
      ShowMessage('Erro ao atualizar itens existentes!!');
      Exit;
    end;
    //insert em itens não existentes
    vQryDados.Close;
    vQryDados.SQL.Clear;
    vQryDados.SQL.Add(' SELECT CD_ITEM, VL_ITEM_CALCULADO, VL_SOLICITADO, VL_RECEBIDO, VL_UTILIZADO, TP_DESTINO, IDENTITY(int, 1,1) AS LANCTO, ');
    vQryDados.SQL.Add('        CD_TIPO_CALCULO, CD_BANCO, CD_FAVORECIDO, CD_MOEDA_COMPRA, CD_MOEDA_VENDA, VL_COMPRA, VL_VENDA, NR_SOLIC_VINC ');
    vQryDados.SQL.Add('   INTO #TEMP ');
    vQryDados.SQL.Add('   FROM TNUMERARIO_NOTIFICA_ITEM NNI (NOLOCK) ');
    vQryDados.SQL.Add('  WHERE NNI.NR_PROCESSO = "' + Trim(dbedtUnid.Text + dbedtProd.Text + medtProcesso.Text) + '" ');
    vQryDados.SQL.Add('    AND NNI.NR_SOLICITACAO = "' + medtSolic.Text + '" ');
    vQryDados.SQL.Add('    AND NNI.CD_ITEM NOT IN ');
    vQryDados.SQL.Add('       (SELECT CD_ITEM ');
    vQryDados.SQL.Add('          FROM TNUMERARIO_NOTIFICA_ITEM (NOLOCK) ');
    vQryDados.SQL.Add('         WHERE NR_PROCESSO = "' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + '" AND ');
    vQryDados.SQL.Add('               NR_SOLICITACAO = "' + datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString + '") ');
    vQryDados.SQL.Add(' ');
    vQryDados.SQL.Add(' DECLARE @Aux INT ');
    vQryDados.SQL.Add(' SELECT  @Aux = ISNULL(MAX(NR_LANCAMENTO), 0) ');
    vQryDados.SQL.Add('   FROM  TNUMERARIO_NOTIFICA_ITEM (NOLOCK) ');
    vQryDados.SQL.Add('  WHERE  NR_PROCESSO = "' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + '" AND ');
    vQryDados.SQL.Add('         NR_SOLICITACAO = "' + datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString + '" ');
    vQryDados.SQL.Add(' ');
    vQryDados.SQL.Add(' INSERT INTO TNUMERARIO_NOTIFICA_ITEM (NR_PROCESSO, NR_SOLICITACAO, NR_LANCAMENTO, CD_ITEM, ');
    vQryDados.SQL.Add('             VL_ITEM_CALCULADO, VL_SOLICITADO, VL_RECEBIDO, VL_UTILIZADO, TP_DESTINO, CD_STATUS, IN_CANCELADO, ');
    vQryDados.SQL.Add('             CD_TIPO_CALCULO, CD_BANCO, CD_FAVORECIDO, CD_MOEDA_COMPRA, CD_MOEDA_VENDA, VL_COMPRA, VL_VENDA, NR_SOLIC_VINC) ');
    vQryDados.SQL.Add(' SELECT "' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + '", "' + datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString + '", ');
    vQryDados.SQL.Add('        RIGHT("000" + CAST(@Aux + LANCTO AS VARCHAR(3)), 3), ');
    vQryDados.SQL.Add('        CD_ITEM, 0, VL_SOLICITADO, 0, 0, TP_DESTINO, "A", "0", ');
    vQryDados.SQL.Add('        CD_TIPO_CALCULO, CD_BANCO, CD_FAVORECIDO, CD_MOEDA_COMPRA, CD_MOEDA_VENDA, 0, 0, NR_SOLIC_VINC ');
    vQryDados.SQL.Add('   FROM #TEMP ');
    vQryDados.SQL.Add(' ');
    vQryDados.SQL.Add('DROP TABLE #TEMP ');
    try
      vQryDados.ExecSQL;
    except
      ShowMessage('Erro ao inserir novos itens!!');
      Exit;
    end;
    datm_notificacao.atz_soma_numerario;
    som_valores;
  finally
    vQryDados.Free;
    lblFecharClick(nil);
     if not (datm_notificacao.qry_notifica_.State in [dsEdit]) then
    datm_notificacao.qry_notifica_.Edit;
    datm_notificacao.qry_notifica_VL_SOLICITADO.AsFloat:=  StrToFloat(StringReplace(edt_deb_comiss.Text, '.', '', [rfReplaceAll])) ;
    datm_notificacao.qry_notifica_.Post;
    datm_notificacao.qry_notifica_item_.Close;
    datm_notificacao.qry_notifica_item_.ParamByName('NR_PROCESSO').AsString:=datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
    datm_notificacao.qry_notifica_item_.ParamByName('NR_SOLICITACAO').AsString:=datm_notificacao.qry_notifica_NR_SOLICITACAO.AsString;
    datm_notificacao.qry_notifica_item_.Prepare;
    datm_notificacao.qry_notifica_item_.Open;
  end;
end;

procedure Tfrm_notificacao.btnCoProcessoClick(Sender: TObject);
begin
  medtProcesso.Text := ConsultaOnLineExSql('SELECT SUBSTRING(NR_PROCESSO,5,14)AS NR_PROCESSO, TPR.CD_CLIENTE,' +
                        ' (SELECT AP_EMPRESA FROM TEMPRESA_NAC CL (NOLOCK) WHERE CL.CD_EMPRESA = TPR.CD_CLIENTE) AS NM_CLIENTE,' +
                        ' TPR.CD_SERVICO,(SELECT TS.NM_SERVICO FROM TSERVICO TS (NOLOCK) WHERE TS.CD_SERVICO =TPR.CD_SERVICO)NM_SERVICO'+
                        ' FROM TPROCESSO TPR (NOLOCK) WHERE TPR.CD_PRODUTO = ' + QuotedStr(dbedtProd.Text) +
                        ' AND TPR.CD_UNID_NEG = '+ QuotedStr(dbedtUnid.Text) +
                        ' AND TPR.IN_LIBERADO = "1" AND TPR.IN_CANCELADO = "0" ',
                        'Processos',['NR_PROCESSO','CD_CLIENTE','NM_CLIENTE','CD_SERVICO','NM_SERVICO'],
                        ['Processo','Cód.','Cliente','Cód.','Serviço'],'NR_PROCESSO', nil, medtProcesso.Text);
  if medtProcesso.Text  <> '' then
    msk_nr_processoExit(Sender);
end;

procedure Tfrm_notificacao.medtProcessoExit(Sender: TObject);
begin
  if medtProcesso.Text <> '' then
  begin
    if ConsultaLookUpSQL('SELECT ISNULL(SUBSTRING(NR_PROCESSO,5,14), "")AS NR_PROCESSO ' +
        ' FROM TPROCESSO TPR (NOLOCK) WHERE TPR.NR_PROCESSO = '+ QuotedStr(dbedtUnid.Text + dbedtProd.Text + medtProcesso.Text) +
        ' AND TPR.IN_LIBERADO = "1" AND TPR.IN_CANCELADO = "0" ' , 'NR_PROCESSO') = '' then
        begin
      ShowMessage('Processo inválido ou inexistente!');
      medtProcesso.Clear;
      medtProcesso.SetFocus;
    end;
  end;
end;

procedure Tfrm_notificacao.medtSolicExit(Sender: TObject);
begin
  if medtSolic.Text <> '' then
    medtSolic.Text :=  Copy('000', 1, 3 - Length( medtSolic.Text)) +  medtSolic.Text;
end;

procedure Tfrm_notificacao.FormShow(Sender: TObject);
begin
  pnlDuplica2.Color := clPnlClaroBroker;          
  //faz as consistências quando dados já preenchidos, ou seja, quando veio do Profit (kleber 06/03/2007)

   if str_cd_rotina_atalho = '0504' then
   begin
    msk_cd_unid_neg.Text := cd_unid_neg_gestao;
    msk_cd_produto.Text := cd_prod_gestao;
    msk_nr_processo.Text := Copy(nr_processo_gestao, 5 ,14);
    if (cd_unid_neg_gestao <> '') and (cd_prod_gestao <> '') and (nr_processo_gestao <> '') then
      msk_nr_processoExit(msk_nr_processo);
  end;
  str_cd_rotina_atalho := '';
end;

procedure Tfrm_notificacao.SpeedButton1Click(Sender: TObject);
begin
  if not (datm_notificacao.qry_notifica_item_.State in [dsEdit, dsInsert]) then
    datm_notificacao.qry_notifica_item_.edit;
  datm_notificacao.qry_notifica_item_CD_BANCO.AsString :=   ConsultaOnLineExSQL('SELECT B.NM_BANCO, B.CD_BANCO ' +
                                                                                '  FROM TBANCO B (NOLOCK) ' +
                                                                                ' WHERE B.IN_ATIVO = "1" ','Banco', ['NM_BANCO' ,'CD_BANCO'],
                                                                               ['Banco', 'Codigo'],'CD_BANCO');
  DBEdit4Exit(nil);
end;

procedure Tfrm_notificacao.DBEdit4Exit(Sender: TObject);
begin
  if datm_notificacao.qry_notifica_item_.State in [dsEdit, dsInsert] then
  begin
    ValidCodigo(DBEdit4);
    if DBEdit4.Text <> '' then
    begin
      if DBEdit3.Text = '' then
      begin
        BoxMensagem('Código do Banco inválido!',2);
        DBEdit4.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_notificacao.BtnIncluirObsClick(Sender: TObject);
var
  vLista : TStringList;
begin
  vLista := TStringList.Create;
  with TQuery.Create(Application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('select NR_ADICAO, SUBSTRING(CD_MERCADORIA_NCM,1,8) CD_MERCADORIA_NCM, PC_ICMS, ALIQ_PIS ,ALIQ_COFINS');
    SQL.Add('from TADICAO_DE_IMPORTACAO where nr_processo =:NR_PROCESSO');
    ParamByName('NR_PROCESSO').AsString := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
    Open;
    while not Eof do
    begin
      vLista.Add('Adição: ' + FieldByName('NR_ADICAO').AsString);
      vLista.Add('II: '     + ConsultaLookUPSQL('SELECT case when	PC_ALIQ_ACOR_TARIF > 0 then PC_ALIQ_ACOR_TARIF when ' +
                                                'PC_ALIQ_REDUZIDA > 0 then PC_ALIQ_REDUZIDA else PC_ALIQ_NORM_ADVAL end as PC_ALIQ ' +
                                                'FROM TRIBUTO WHERE NR_PROCESSO = ''' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + '''' +
                                                'AND NR_ADICAO = ''' + FieldByName('NR_ADICAO').AsString + '''' +
                                                ' AND CD_RECEITA_IMPOSTO = ''0001''','PC_ALIQ') + ' %');
      vLista.Add('IPI: '    + ConsultaLookUPSQL('SELECT case when PC_ALIQ_REDUZIDA > 0 then PC_ALIQ_REDUZIDA else PC_ALIQ_NORM_ADVAL end as PC_ALIQ ' +
                                                'FROM TRIBUTO WHERE NR_PROCESSO = ''' + datm_notificacao.qry_notifica_NR_PROCESSO.AsString + '''' +
                                                'AND NR_ADICAO = ''' + FieldByName('NR_ADICAO').AsString + '''' +
                                                ' AND CD_RECEITA_IMPOSTO = ''0002''','PC_ALIQ') + ' %');

      vLista.Add('PIS: '   + FormatFloat('#,##0.00', FieldByName('ALIQ_PIS').AsFloat) + ' %');
      vLista.Add('COFINS: '+ FormatFloat('#,##0.00', FieldByName('ALIQ_COFINS').AsFloat) + ' %');
      vLista.Add('ICMS: '  + FormatFloat('#,##0.00', FieldByName('PC_ICMS').AsFloat) + ' %');
      vLista.Add('NCM: '   + Copy(FieldByName('CD_MERCADORIA_NCM').AsString,1,4) + '.' + Copy(FieldByName('CD_MERCADORIA_NCM').AsString,5,2) + '.' + Copy(FieldByName('CD_MERCADORIA_NCM').AsString,7,2));

      datm_notificacao.SqlAux.Close;
      datm_notificacao.SqlAux.SQL.Clear;
      datm_notificacao.SqlAux.SQL.Add('select A.TX_DESC_DET_MERC, A.NR_ITEM from TDETALHE_MERCADORIA A, TMERCADORIA B');
      datm_notificacao.SqlAux.SQL.Add('where A.nr_processo =:NR_PROCESSO and A.NR_ADICAO =:NR_ADICAO AND');
      datm_notificacao.SqlAux.SQL.Add('B.CD_MERCADORIA = A.CD_MERCADORIA');
      datm_notificacao.SqlAux.ParamByName('NR_PROCESSO').AsString := datm_notificacao.qry_notifica_NR_PROCESSO.AsString;
      datm_notificacao.SqlAux.ParamByName('NR_ADICAO').AsString   := FieldByName('NR_ADICAO').AsString;
      datm_notificacao.SqlAux.Open;
      while not datm_notificacao.SqlAux.Eof do
      begin
        vLista.Add('Item: ' + datm_notificacao.SqlAux.FieldByName('NR_ITEM').AsString + ' - ' +
                              datm_notificacao.SqlAux.FieldByName('TX_DESC_DET_MERC').AsString);
        datm_notificacao.SqlAux.Next;
      end;
      Next;
      vLista.Add('');
    end;
    Free;
  end;
  datm_notificacao.qry_notifica_.Edit;
  datm_notificacao.qry_notifica_.FieldByName('TX_NUMERARIO_OBS').AsString := datm_notificacao.qry_notifica_.FieldByName('TX_NUMERARIO_OBS').AsString + #10#13 + vLista.Text;
  btn_salvar.Click;

end;

function Tfrm_notificacao.ItemEscolhidoOk(const pCD_EMPRESA : string; pCD_ITEM : string) : Boolean;
var
  pGrupo : string;
begin
  Result := True;
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    Sql.Clear;
    Sql.Add('select B.NM_ITEM, A.*');
    Sql.Add('from TGRUPO_ITEM_NUMERARIO A, TITEM B');
    Sql.Add('where');
    Sql.Add('   B.CD_ITEM = A.CD_ITEM and');
    Sql.Add('   CD_GRUPO = (select CD_GRUPO from TEMPRESA_NAC where  CD_EMPRESA =:CD_EMPRESA) AND');
    Sql.Add('   A.CD_ITEM =:CD_ITEM');
    ParamByName('CD_EMPRESA').AsString := pCD_EMPRESA;
    ParamByName('CD_ITEM').AsString := pCD_ITEM;
    Open;
    if RecordCount <> 0 then
    begin
      //se o campo CD_AGENTE da TPROCESSO for '00001', bloqueia !
      if ConsultaLookUp('TPROCESSO','NR_PROCESSO',datm_notificacao.qry_processo_NR_PROCESSO.AsString,'CD_AGENTE') = '0001' then
      begin
        BoxMensagem('Este item do numerário é bloqueado para este cliente, pois o agente é a Indaia!',2);
        Result := False;
      end
      else
      begin
        BoxMensagem('O agente de carga do processo não está definido como Indaia. Você poderá solicitar este numerário, mas certifique-se que a manutenção do processo esteja preenchida corretamente.!',2);
        Result := True;
      end;
    end;
    Free;
  end;
end;


procedure Tfrm_notificacao.btnPreCalculoClick(Sender: TObject);
begin
  // Michel - 24/02/2010
  Application.createForm(Tfrm_DI_PreCalculo, frm_DI_PreCalculo);
  frm_DI_PreCalculo.Execute(msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text);
  FreeAndNil(frm_DI_PreCalculo);
end;

procedure Tfrm_notificacao.msk_cd_produtoChange(Sender: TObject);
begin
  btnPreCalculo.Visible := (msk_cd_produto.Text = '01'); // Michel - 24/02/2010
end;

procedure Tfrm_notificacao.DBMemo1Click(Sender: TObject);
begin
//  datm_notificacao.ds_notifica.AutoEdit:=True; //by carlos - liberar a digitação para testes
end;

{ Lançar os percentuais dos impostos do pre-calculo no campo de OBS sub-divididos em 12 adições no maximo - by carlos }
procedure Tfrm_notificacao.lanca_pc_impostos_obs;
var
str_pc_II,
str_pc_IPI,
str_pc_PIS,
str_pc_COFINS,
str_pc_ICMS,
str_adicao:String;
aAdicao,aII,aIPI,aPIS,aCOFINS,aICMS: array[1..2] of string;
cta_adicao,g:Integer;
tem_adicao_di:boolean;
begin
  { Somente os numerarios em aberto serão permitidos a alteração da OBS }
  if datm_notificacao.qry_notifica_CD_STATUS.AsString<>'A' then exit;

  if trim(datm_notificacao.qry_notifica_TX_NUMERARIO_OBS.AsString)<>'' then
      if Application.MessageBox('Já existem informações no campo OBSERVAÇÃO,'  + #13#10 +
                     'Deseja adicionar os impostos no final ?', 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrNo then exit;


  //Inclui percentuais do pre-calculo no campo de OBS (somente quando houver adições) - by Carlos 23/06/2010
  with TQuery.Create(Application) do
  begin
     str_adicao    :='';
     str_pc_II     :='';
     str_pc_IPI    :='';
     str_pc_PIS    :='';
     str_pc_COFINS :='';
     str_pc_ICMS   :='';
     cta_adicao    :=0;
     g             :=0;
     //
     DatabaseName := 'DBBROKER';  //limitado a 14 adições
     Sql.Clear;
     Sql.Add(' SELECT top 1 nr_processo FROM TADICAO_DE_IMPORTACAO ');
     Sql.Add(' WHERE NR_PROCESSO ="'+datm_notificacao.qry_processo_NR_PROCESSO.AsString+'"');
     open;
     tem_adicao_di:=not eof;
     close;
     //
     Sql.Clear;
     if tem_adicao_di then begin
        Sql.Add(' SELECT ISNULL( ');
        Sql.Add(' case when ( isnull(AI.CD_TIPO_ACORDO_TAR,"") =  "" ) and ( T1.PC_ALIQ_REDUZIDA = 0 ) then T1.PC_ALIQ_NORM_ADVAL ');
        Sql.Add('      when ( isnull(AI.CD_TIPO_ACORDO_TAR,"") <> "" ) then  T1.PC_ALIQ_ACOR_TARIF ');
        Sql.Add('      when ( isnull(AI.CD_TIPO_ACORDO_TAR,"") =  "" ) and ( T1.PC_ALIQ_REDUZIDA > 0 ) then T1.PC_ALIQ_REDUZIDA ');
        Sql.Add(' end,0) PC_ALIQUOTA_II , ');
        Sql.Add(' ISNULL( CASE WHEN T2.PC_ALIQ_REDUZIDA <> 0 THEN  T2.PC_ALIQ_REDUZIDA ELSE T2.PC_ALIQ_NORM_ADVAL END , 0 ) PC_ALIQUOTA_IPI , ');
        Sql.Add(' ISNULL( AI.ALIQ_PIS    , 0 ) PC_ALIQUOTA_PIS, ');
        Sql.Add(' ISNULL( AI.ALIQ_COFINS , 0 ) PC_ALIQUOTA_COFINS, ');
        Sql.Add(' ISNULL( AI.PC_ICMS     , 0 ) PC_ALIQUOTA_ICMS ');
        Sql.Add(' FROM TADICAO_DE_IMPORTACAO AI (NOLOCK) ');
        Sql.Add(' LEFT JOIN TRIBUTO T1 (NOLOCK) ON T1.NR_PROCESSO=AI.NR_PROCESSO AND T1.NR_ADICAO=AI.NR_ADICAO  AND T1.CD_RECEITA_IMPOSTO="0001" -- II ');
        Sql.Add(' LEFT JOIN TRIBUTO T2 (NOLOCK) ON T2.NR_PROCESSO=AI.NR_PROCESSO AND T2.NR_ADICAO=AI.NR_ADICAO  AND T2.CD_RECEITA_IMPOSTO="0002" -- IPI  ');
        Sql.Add(' WHERE AI.NR_PROCESSO ="'+datm_notificacao.qry_processo_NR_PROCESSO.AsString+'"');
     end else begin
        Sql.Add(' SELECT ');
        Sql.Add(' ISNULL( PC.PC_ALIQUOTA_II     , 0 ) PC_ALIQUOTA_II  ,   ');
        Sql.Add(' ISNULL( PC.PC_ALIQUOTA_IPI    , 0 ) PC_ALIQUOTA_IPI ,   ');
        Sql.Add(' ISNULL( PC.PC_ALIQUOTA_PIS    , 0 ) PC_ALIQUOTA_PIS,    ');
        Sql.Add(' ISNULL( PC.PC_ALIQUOTA_COFINS , 0 ) PC_ALIQUOTA_COFINS, ');
        Sql.Add(' ISNULL( PC.PC_ALIQUOTA_ICMS   , 0 ) PC_ALIQUOTA_ICMS    ');
        Sql.Add(' FROM TPRE_CALCULO_ADICAO PC   (NOLOCK)  ');
        Sql.Add(' WHERE PC.NR_PROCESSO ="'+datm_notificacao.qry_processo_NR_PROCESSO.AsString+'"');
     end;
     Open;
     if recordcount>14 then
        ShowMessage('O numero maximo para alimentação automatica da OBSERVAÇÂO é de 14 adições,'+#13+' o Sistema descartará as demais.');

     while not eof do begin
       inc(cta_adicao);

       str_adicao:=str_adicao+'Adição.....'    +RightStr('..'+intTostr(cta_adicao),2)                       +'   ';
       str_pc_II     :=str_pc_II    +'II    : '+formatFloat('00.00',FieldByName('PC_ALIQUOTA_II').Value)    +'   ';
       str_pc_IPI    :=str_pc_IPI   +'IPI   : '+formatFloat('00.00',FieldByName('PC_ALIQUOTA_IPI').Value)   +'   ';
       str_pc_PIS    :=str_pc_PIS   +'PIS   : '+formatFloat('00.00',FieldByName('PC_ALIQUOTA_PIS').Value)   +'   ';
       str_pc_COFINS :=str_pc_COFINS+'COFINS: '+formatFloat('00.00',FieldByName('PC_ALIQUOTA_COFINS').Value)+'   ';
       str_pc_ICMS   :=str_pc_ICMS  +'ICMS  : '+formatFloat('00.00',FieldByName('PC_ALIQUOTA_ICMS').Value)  +'   ';
       if cta_adicao=7 then begin
         aAdicao[1]:=copy(str_adicao,   1, length(str_adicao)   -3);
         aII[1]    :=copy(str_pc_II,    1, length(str_pc_II)    -3);
         aIPI[1]   :=copy(str_pc_IPI,   1, length(str_pc_IPI)   -3);
         aPIS[1]   :=copy(str_pc_PIS,   1, length(str_pc_PIS)   -3);
         aCOFINS[1]:=copy(str_pc_COFINS,1, length(str_pc_COFINS)-3);
         aICMS[1]  :=copy(str_pc_ICMS,  1, length(str_pc_ICMS)  -3);
         //limpa as variaveis para alimentar o grupo 2 (caso seja necessario)
         str_adicao    :='';
         str_pc_II     :='';
         str_pc_IPI    :='';
         str_pc_PIS    :='';
         str_pc_COFINS :='';
         str_pc_ICMS   :='';
       end;

       if cta_adicao=14 then break;

       next;
     end;
     if cta_adicao>0 then begin
        if cta_adicao<7 then
          g:=1;

        if cta_adicao>7 then
          g:=2;

        if g<>0 then begin
           aAdicao[g]:=copy(str_adicao,   1, length(str_adicao)   -3);
           aII[g]    :=copy(str_pc_II,    1, length(str_pc_II)    -3);
           aIPI[g]   :=copy(str_pc_IPI,   1, length(str_pc_IPI)   -3);
           aPIS[g]   :=copy(str_pc_PIS,   1, length(str_pc_PIS)   -3);
           aCOFINS[g]:=copy(str_pc_COFINS,1, length(str_pc_COFINS)-3);
           aICMS[g]  :=copy(str_pc_ICMS,  1, length(str_pc_ICMS)  -3);
        end;
        if not (datm_notificacao.ds_notifica.State in [dsEdit,dsInsert]) then
           datm_notificacao.qry_notifica_.Edit;

        dbMemo1.Lines.Add(aAdicao[1] );
        dbMemo1.Lines.Add(aII[1]     );
        dbMemo1.Lines.Add(aIPI[1]    );
        dbMemo1.Lines.Add(aPIS[1]    );
        dbMemo1.Lines.Add(aCOFINS[1] );
        dbMemo1.Lines.Add(aICMS[1]   );
        if cta_adicao>7 then begin
           dbMemo1.Lines.Add('');
           dbMemo1.Lines.Add(aAdicao[2] );
           dbMemo1.Lines.Add(aII[2]     );
           dbMemo1.Lines.Add(aIPI[2]    );
           dbMemo1.Lines.Add(aPIS[2]    );
           dbMemo1.Lines.Add(aCOFINS[2] );
           dbMemo1.Lines.Add(aICMS[2]   );
        end;
     end;
     free;
  end;
end;


procedure Tfrm_notificacao.SpeedButton2Click(Sender: TObject);
begin
 { Lançar os percentuais dos impostos do pre-calculo no campo de OBS - by carlos - 23/06/2010 }
  lanca_pc_impostos_obs;
end;

end.




(*******************************************************************************
Sistema: DD Broker - Bysoft
PROGRAMA: PGSM263.PAS - frm_instrucao_embarque
AUTOR: José Roberto
DATA: 10/09/02
Titulo: Instrução de Embarque
********************************************************************************)

unit uInstrucaoEmbarque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, Buttons, ExtCtrls,
  RxDBComb, DB, Menus, dbTables, ppBands, ppVar, ppCtrls, ppPrnabl, ppClass, ppCache, ppDB, ppDBPipe, ppDBBDE, ppEndUsr, ppComm, ppRelatv, ppProd,
  ppReport, ppStrtch, ppMemo, ppSubRpt, ppRegion, Funcoes, jpeg,
  ppParameter;

type
  TFrm_Instrucao_Embarque = class(TForm)
    pnl_manut_proc: TPanel;         
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    pgctrl_instrucao_embarque: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    DBGrid_Lista_instrucao: TDBGrid;
    MainMenu1: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    btn_prealerta: TSpeedButton;
    Sair1: TMenuItem;
    dnav_instr: TDBNavigator;
    ts_carga: TTabSheet;
    DBMemo1: TDBMemo;
    lb_receita: TLabel;
    dbgrid_receitas: TDBGrid;
    Label8: TLabel;
    ts_volumes: TTabSheet;
    pnl_lcl: TPanel;
    Label22: TLabel;
    DBMemo2: TDBMemo;
    dbgrid_lcl: TDBGrid;
    pnl_fcl: TPanel;
    dbgrid_fcl: TDBGrid;
    ppReport_instrucao: TppReport;
    ppDesigner: TppDesigner;
    mi_prealerta: TMenuItem;
    Label1: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Label2: TLabel;
    Panel1: TPanel;
    Label21: TLabel;
    btn_uni_neg: TSpeedButton;
    Label51: TLabel;
    btn_co_produto: TSpeedButton;
    msk_cd_unid: TMaskEdit;
    edt_nm_unid: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    Panel2: TPanel;
    dbgrid_carga: TDBGrid;
    dbedcheck_in_cubagem: TDBCheckBox;
    Panel3: TPanel;
    Label3: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    lb_tarifa_venda: TLabel;
    lb_tt_frete: TLabel;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    dbedt_tarifa_venda: TDBEdit;
    dbedt_tt_frete: TDBEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label6: TLabel;
    btn_co_processo: TSpeedButton;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    dbedt_cd_cliente: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Panel6: TPanel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label24: TLabel;
    btn_co_exportador: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    btn_co_agente: TSpeedButton;
    btn_co_origem: TSpeedButton;
    btn_co_destino: TSpeedButton;
    Label5: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label30: TLabel;
    btn_co_moeda: TSpeedButton;
    lb_proc_vinc: TLabel;
    lb_proc_canc: TLabel;
    lb_consolidacao: TLabel;
    btn_consolidacao: TSpeedButton;
    dbedt_nm_exportador: TDBEdit;
    dbedt_cd_agente: TDBEdit;
    dbedt_cd_origem: TDBEdit;
    dbedt_cd_destino: TDBEdit;
    dbedt_nm_agente: TDBEdit;
    dbedt_nm_origem: TDBEdit;
    dbet_nm_destino: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    dbedt_nm_moeda: TDBEdit;
    dbLookp_tp_frete: TDBLookupComboBox;
    dbedt_nm_local_conso: TDBEdit;
    dbedt_cd_exportador: TDBEdit;
    dbedt_cd_moeda: TDBEdit;
    dbLookCB_incoterm: TDBLookupComboBox;
    dbedt_cd_local_conso: TDBEdit;
    Panel7: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    lb_tarifa_fcl: TLabel;
    lb_frete_fcl: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    dbedt_venda_fcl: TDBEdit;
    dbedt_frete_fcl: TDBEdit;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl_tarifa_lcl: TLabel;
    lbl_frete_lcl: TLabel;
    dbedt1: TDBEdit;
    dbedt2: TDBEdit;
    dbedt3: TDBEdit;
    dbedt_venda_lcl: TDBEdit;
    dbedt_frete_lcl: TDBEdit;
    dbrgrpEstufagem: TDBRadioGroup;
    ppParameterList1: TppParameterList;
    cbbTipoCarga: TComboBox;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppLabel23: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppLine6: TppLine;
    ppLabel31: TppLabel;
    ppLine7: TppLine;
    ppLabel32: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel33: TppLabel;
    ppLabel38: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    shp1: TShape;
    Label20: TLabel;
    dbedtCdEmbarcacao: TDBEdit;
    btnNavio: TSpeedButton;
    lbl_viagem_im: TLabel;
    dbedtNrViagem: TDBEdit;
    btnViagem: TSpeedButton;
    dbedtNmEmbarcacao: TDBEdit;
    dbedtViagemArmador: TDBEdit;
    lbl4: TLabel;
    dbgrdRefCli: TDBGrid;
    lbl5: TLabel;
    shp2: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);//verifca em qual dos intervalos da tabela de itens será analisado
    procedure btn_co_agenteClick(Sender: TObject);
    procedure btn_co_origemClick(Sender: TObject);
    procedure btn_co_destinoClick(Sender: TObject);
    procedure dbedt_cd_agenteExit(Sender: TObject);
    procedure dbedt_cd_origemExit(Sender: TObject);
    procedure dbedt_cd_destinoExit(Sender: TObject);
    procedure dbedt_cd_freteChange(Sender: TObject);
    procedure pgctrl_instrucao_embarqueChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pgctrl_instrucao_embarqueChange(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure dbedt_cd_exportadorExit(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemChange(Sender: TObject);
    procedure dbedt_cd_clienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unidExit(Sender: TObject);
    procedure btn_uni_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure dbedt_cd_exportadorChange(Sender: TObject);
    procedure routing_order(Hab:Boolean);
    procedure FormShow(Sender: TObject);
    procedure dbgrid_lclDblClick(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure dbedt_cd_moedaExit(Sender: TObject);
    procedure btn_prealertaClick(Sender: TObject);
    procedure dbedt_cd_local_consoExit(Sender: TObject);
    procedure btn_consolidacaoClick(Sender: TObject);
    procedure campo_consolidacao;
    procedure dbgrid_lclExit(Sender: TObject);
    procedure dbgrid_fclExit(Sender: TObject);
    procedure msk_cd_unidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbLookCB_incotermKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbllk_tp_cargaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbLookCB_incotermClick(Sender: TObject);
    procedure dbllk_tp_cargaClick(Sender: TObject);
    procedure dbgrid_lclKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_fclKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_fclDblClick(Sender: TObject);
    procedure dbgrid_fclEnter(Sender: TObject);
    procedure dbrgrpEstufagemClick(Sender: TObject);
    procedure dbrgrpEstufagemEnter(Sender: TObject);
    procedure cbbTipoCargaChange(Sender: TObject);
    procedure dbgrid_lclColExit(Sender: TObject);
    procedure dbgrid_fclColExit(Sender: TObject);
    procedure btnViagemClick(Sender: TObject);
    procedure btnNavioClick(Sender: TObject);
    procedure dbedtCdEmbarcacaoExit(Sender: TObject);
    procedure dbedtCdEmbarcacaoEnter(Sender: TObject);
    procedure dbedtNrViagemExit(Sender: TObject);
    procedure dbedtCdEmbarcacaoChange(Sender: TObject);
    procedure dbedtNrViagemChange(Sender: TObject);
  private
//    lNaoConsiste: Boolean;
    vEmbarcacao: string[4];
    a_str_indices : Array[0..5] Of String[60]; // trabalha c/ edt_chave
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
//    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
  public
    Pesquisa : String;
    Flag_change_frete,via_transp:String;
    st_modificar, st_incluir, st_excluir: Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    controle_calculo:Boolean;
    procedure Get_DataHora_Servidor;
    function Grava    : Boolean;
  end;

var
  Frm_Instrucao_Embarque: TFrm_Instrucao_Embarque;


implementation
  uses GSMLIB, PGGP001, PGGP017, dInstrucaoEmbarque,
  uAg, ConsOnLineEx, PGSM990, PGSM091, uPortos, uProfitMaritimo;
{$R *.DFM}

procedure TFrm_Instrucao_Embarque.FormCreate(Sender: TObject);
begin
  st_modificar:=false;
  st_incluir:=false;
  st_excluir:=false;
  Pesquisa:='';
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  Application.CreateForm(Tdatm_instrucao_embarque, datm_instrucao_embarque);
  with datm_instrucao_embarque do
  begin
    qry_traz_default_.Close;
    qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_traz_default_.Open;
    msk_cd_unid.text:= qry_traz_default_CD_UNID_NEG.AsString;
    edt_nm_unid.text:=qry_traz_default_NM_UNID_NEG.AsString;
    msk_cd_produto.text:=qry_traz_default_CD_PRODUTO.AsString;
    edt_nm_produto.text:=qry_traz_default_NM_PRODUTO.AsString;
    ds_processo.AutoEdit               :=st_modificar;
    qry_via_transp_.Close;
    qry_via_transp_.ParamByName('CD_VIA_TRANSP').AsString:='04';
    qry_via_transp_.Open;
    qry_incoterms_.Close;
    qry_incoterms_.Prepare;
    qry_incoterms_.Open;
    qry_tp_frete_.Close;
    qry_tp_frete_.Prepare;
    qry_tp_frete_.Open;
    ds_processo.AutoEdit          :=st_modificar;
    ds_instr_carga.AutoEdit       :=st_modificar;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
  a_str_indices[0] := 'NR_PROCESSO';
  a_str_indices[1] := 'NM_EMPRESA';
  a_str_indices[2] := 'CD_SIGLA';
  a_str_indices[3] := 'CD_SIGLA_1';
  With cb_ordem do
  begin
    Clear;
    Items.Add('Processo');
    Items.Add('Cliente');
    Items.Add('Origem');
    Items.Add('Destino');
    ItemIndex := 0;
  end;
  pgctrl_instrucao_embarque.ActivePage:=ts_lista;


end;

procedure TFrm_Instrucao_Embarque.btn_mi(Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean);
begin
  btn_salvar.Enabled   := Salv;
  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;
  mi_Cancelar.Enabled  := Canc;
end;

procedure TFrm_Instrucao_Embarque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  VerAlt;
  datm_instrucao_embarque.qry_processo_.close;
  datm_instrucao_embarque.Free;
end;

procedure TFrm_Instrucao_Embarque.btn_cancelarClick(Sender: TObject);
begin
  cancelar;
end;

procedure TFrm_Instrucao_Embarque.btn_salvarClick(Sender: TObject);
begin
  if Not Grava then
    exit;
end;

procedure TFrm_Instrucao_Embarque.Cancelar;
begin
  try
    if datm_Instrucao_embarque.qry_processo_.State in [dsInsert, dsEdit] then
      datm_Instrucao_embarque.qry_processo_.Cancel;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function TFrm_Instrucao_Embarque.Consiste: Boolean;
begin
  consiste := true;

  if Trim(dbedtCdEmbarcacao.Text) <> '' then begin
    dbedtCdEmbarcacao.Text := Copy('0000', 1, 4- Length(dbedtCdEmbarcacao.Text)) + dbedtCdEmbarcacao.Text;
    if dbedtNmEmbarcacao.Text = '' then begin
       ShowMessage('Navio Inválido!');
       Consiste := False;
       dbedtCdEmbarcacao.Text := '';
       dbedtCdEmbarcacao.SetFocus;
    end;
  end;

  if Trim(dbedtNrViagem.Text) <> '' then begin
    if ConsultaLookUPSQL('SELECT V.NR_VIAGEM FROM TVIAGEM V (NOLOCK) WHERE ' +
    '   V.CD_UNID_NEG = ''' + msk_cd_unid.Text + ''' AND ' +
    '   V.CD_PRODUTO = ''01'' AND ' +
    '   V.CD_EMBARCACAO = ''' + dbedtCdEmbarcacao.Text + ''' AND ' +
    '   V.NR_VIAGEM = ''' + datm_instrucao_embarque.qry_processo_NR_VIAGEM.AsString + ''' ', 'NR_VIAGEM') = '' then begin
      ShowMessage('Viagem Inválida!');
      Consiste := false;
      dbedtNrViagem.Text := '';
      dbedtNrViagem.SetFocus;
    end;
  end;
end;

function TFrm_Instrucao_Embarque.Grava: Boolean;
begin
  if not Consiste then
  begin
    Grava:=false;
    exit;
  end;
  try
    with datm_instrucao_embarque do
    begin
      if not datm_main.db_broker.InTransaction then
        datm_main.db_broker.StartTransaction;
      if qry_processo_.State in [dsInsert,dsEdit] then begin
        //alteração para salvamento manual do tipo de Carga 15/09/2006
        if cbbTipoCarga.ItemIndex <> -1 then
          qry_processo_TP_CARGA.AsString := IntToStr(cbbTipoCarga.ItemIndex);
        qry_processo_.Post;
      end;
      datm_main.db_broker.Commit;
      Grava := True;
      end;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  btn_mi(st_incluir,false,false,st_excluir);
end;

function TFrm_Instrucao_Embarque.VerAlt: Boolean;
begin
  VerAlt := True;
  if ( ( datm_instrucao_embarque.qry_processo_.State in [dsEdit] ) and st_modificar ) or ( datm_instrucao_embarque.qry_processo_.State in [dsInsert] ) then
  begin
    if BoxMensagem('O cadastro de Instrução de Embarque não foi salvo.' + #13#10 + 'Deseja salvar as informações?', 1) then
    if Not Grava then
    begin
      VerAlt := False;
      Exit;
    end else
      Cancelar;
  end;
end;

procedure TFrm_Instrucao_Embarque.Get_DataHora_Servidor;
begin
  with datm_main do
  begin
    try
      CloseStoredProc(sp_data_hora_server);
      ExecStoredProc(sp_data_hora_server);
      dt_server := sp_data_hora_server.ParamByName('@dt_nt_server').AsDateTime;
      hr_server := dt_server;
      dt_server := StrToDate(DateToStr(dt_server));
      CloseStoredProc(sp_data_hora_server);
    except
      on E: Exception do
      begin
        TrataErro(E);
        dt_server := Date;
        hr_server := Time;
      end;
    end;
  end;
end;

procedure TFrm_Instrucao_Embarque.btn_co_agenteClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2229';
  Application.CreateForm(Tfrm_ag, frm_ag);
  with frm_ag Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    tp_ag:=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_ag.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_instrucao_embarque.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_instrucao_embarque.qry_processo_.Edit;
    vStr_cd_modulo := '30';
    str_cd_rotina := '3002';
    datm_instrucao_embarque.qry_processo_CD_AGENTE.Value:=frm_ag.Cons_OnLine_Texto;
  end;
  dbedt_cd_agenteExit(Sender);
end;

procedure TFrm_Instrucao_Embarque.btn_co_origemClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2267';
  Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_instrucao_embarque.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
       datm_instrucao_embarque.qry_processo_.Edit;
    vStr_cd_modulo := '30';
    str_cd_rotina := '3002';
    datm_instrucao_embarque.qry_processo_CD_ORIGEM.Value:=frm_portos.Cons_OnLine_Texto;
    //dbedt_cd_origem_tab_frete.SetFocus;
  end;
  dbedt_cd_origemExit(Sender);
end;

procedure TFrm_Instrucao_Embarque.btn_co_destinoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2267';
  Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    In_porto:= (via_transp = '01');
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_instrucao_embarque.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
       datm_instrucao_embarque.qry_processo_.Edit;

    vStr_cd_modulo := '30';
    str_cd_rotina := '3002';
    datm_instrucao_embarque.qry_processo_CD_DESTINO.Value:=frm_portos.Cons_OnLine_Texto;
    //dbedt_cd_destino_tab_frete.SetFocus;
  end;
  dbedt_cd_destinoExit(Sender);
end;

procedure TFrm_Instrucao_Embarque.dbedt_cd_agenteExit(Sender: TObject);
begin
 with datm_instrucao_embarque do
  begin
  if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then
    Exit;
  if dbedt_cd_agente.Text <> '' then
  begin
       ValidCodigo( dbedt_cd_agente );
       qry_pesquisa_.Active:=False;
       qry_pesquisa_.Sql.Clear;
       qry_pesquisa_.Sql.Add('SELECT NM_AGENTE, CD_AGENTE FROM TAGENTE');
       qry_pesquisa_.Sql.Add('WHERE CD_AGENTE ="'+dbedt_cd_agente.Text+'"');
       qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0 then
        begin
          qry_processo_NM_AGENTE.AsString:= qry_pesquisa_.Fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_agente.Text := '';
          BoxMensagem('Código de Agente inválido!', 2);
          dbedt_cd_agente.SetFocus;
          Exit;
        end;

   end;
 end;
end;

procedure TFrm_Instrucao_Embarque.dbedt_cd_origemExit(Sender: TObject);
begin
  with datm_instrucao_embarque do
  begin
    if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then
      Exit;
    if dbedt_cd_origem.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_origem );
      qry_pesquisa_.Active:=False;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_PORTO, CD_PORTO, CD_SIGLA FROM TPORTO');
      qry_pesquisa_.Sql.Add('WHERE CD_PORTO ="'+dbedt_cd_origem.Text+'"');
      qry_pesquisa_.Active:=true;
      if not qry_pesquisa_.IsEmpty then
      begin
        qry_processo_CD_ORIGEM.AsString:=qry_pesquisa_.Fields[1].AsString;
        qry_processo_NM_PORTO.AsString:=qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_origem.Text := '';
        BoxMensagem('Código de Origem inválido!', 2);
        dbedt_nm_origem.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure TFrm_Instrucao_Embarque.dbedt_cd_destinoExit(Sender: TObject);
begin
with datm_instrucao_embarque do
begin
  if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then
     Exit;

  if dbedt_cd_destino.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_destino );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT NM_PORTO, CD_PORTO, CD_SIGLA FROM TPORTO WHERE CD_PORTO ="'+dbedt_cd_destino.Text+'"');
    qry_pesquisa_.Active:=true;
    if qry_pesquisa_.RecordCount > 0 then
     begin
      qry_processo_NM_PORTO_1.AsString:=qry_pesquisa_.Fields[0].AsString;

      qry_pesquisa_.Close;
     end
   else
     begin
       qry_pesquisa_.Close;
       dbet_nm_destino.Text := '';
       BoxMensagem('Código de Destino inválido!', 2);
       dbedt_cd_destino.SetFocus;
       Exit;
     end;

   end;
  end;

end;

procedure TFrm_Instrucao_Embarque.dbedt_cd_freteChange(Sender: TObject);
begin

If ( datm_instrucao_embarque.qry_processo_.State in [ dsInsert, dsEdit ] ) then
    Btn_Mi( False, True, True, False );

end;

procedure TFrm_Instrucao_Embarque.pgctrl_instrucao_embarqueChanging(Sender: TObject; var AllowChange: Boolean);
begin

  AllowChange := (not datm_instrucao_embarque.qry_processo_.IsEmpty) and (VerAlt);
end;

procedure TFrm_Instrucao_Embarque.pgctrl_instrucao_embarqueChange(Sender: TObject);
var vViaTransp: string[2];
begin
//  if (pgctrl_instrucao_embarque.ActivePage = ts_dados_basicos) then
//    if not (datm_instrucao_embarque.qry_processo_.State in [dsInactive]) then
//      datm_instrucao_embarque.qry_processo_.Edit;
  btn_prealerta.Enabled := (pgctrl_instrucao_embarque.ActivePage <> ts_lista);
  mi_prealerta.Enabled  := (pgctrl_instrucao_embarque.ActivePage <> ts_lista);
  btn_salvar.Enabled    := (pgctrl_instrucao_embarque.ActivePage =  ts_dados_basicos);
  edt_chave.Enabled     := (pgctrl_instrucao_embarque.ActivePage =  ts_lista);
  cb_ordem.Enabled      := (pgctrl_instrucao_embarque.ActivePage =  ts_lista);
  dnav_instr.Enabled    := (pgctrl_instrucao_embarque.ActivePage =  ts_lista);
  dbedtViagemArmador.Enabled  := (Trim(datm_instrucao_embarque.qry_processo_NR_VIAGEM.AsString) = '');
{  edt_chave.Enabled    := (pgctrl_instrucao_embarque.ActivePage <> ts_lista);
  cb_ordem.Enabled     := (pgctrl_instrucao_embarque.ActivePage <> ts_lista);
  dnav_instr.Enabled   := (pgctrl_instrucao_embarque.ActivePage <> ts_lista); }
  with datm_instrucao_embarque do
  begin
    if (pgctrl_instrucao_embarque.ActivePage = ts_carga) then
    begin
      lb_tarifa_venda.Visible    := ( qry_processo_IN_ROUTING.AsString = '1' );
      dbedt_tarifa_venda.Visible := ( qry_processo_IN_ROUTING.AsString = '1' );
      dbgrid_receitas.Visible    := ( qry_processo_IN_ROUTING.AsString = '1' );
      lb_receita.Visible         := ( qry_processo_IN_ROUTING.AsString = '1' );
      lb_tt_frete.Visible        := ( qry_processo_IN_ROUTING.AsString = '1' );
      dbedt_tt_frete.Visible     := ( qry_processo_IN_ROUTING.AsString = '1' );
      qry_instrucao_carga_.close;
      qry_instrucao_carga_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qry_instrucao_carga_.Prepare;
      qry_instrucao_carga_.Open;
      if qry_processo_IN_ROUTING.AsString = '1' then
      begin
        qry_tab_venda_item_.Close;
        qry_tab_venda_item_.ParamByName('CD_TAB_FRETE').AsString := qry_processo_CD_TAB_FRETE_VENDA.AsString;
        qry_tab_venda_item_.ParamByName('CD_SERVICO').AsString   := qry_processo_CD_SERVICO.AsString;
        qry_tab_venda_item_.ParamByName('CD_PRODUTO').AsString   := qry_processo_CD_PRODUTO.AsString;
        qry_tab_venda_item_.ParamByName('NR_PROPOSTA').AsString  := qry_processo_NR_PROPOSTA.AsString;
        qry_tab_venda_item_.Prepare;
        qry_tab_venda_item_.Open;
        qry_tab_frete_despesa_.Close;
        qry_tab_frete_despesa_.ParamByName('CD_TAB_FRETE').AsString := qry_processo_CD_TAB_FRETE_VENDA.AsString;
        qry_tab_frete_despesa_.ParamByName('CD_SERVICO').AsString   := qry_processo_CD_SERVICO.AsString;
        qry_tab_frete_despesa_.ParamByName('CD_PRODUTO').AsString   := qry_processo_CD_PRODUTO.AsString;
        qry_tab_frete_despesa_.ParamByName('NR_PROPOSTA').AsString  := qry_processo_NR_PROPOSTA.AsString;
        qry_tab_frete_despesa_.Prepare;
        qry_tab_frete_despesa_.Open;
      end;
    end;
    if (pgctrl_instrucao_embarque.ActivePage = ts_volumes) then
    begin
        vViaTransp := ConsultaLookUp('TSERVICO', 'CD_SERVICO', qry_processo_CD_SERVICO.AsString, 'CD_VIA_TRANSPORTE');
        if vViaTransp <> '' then begin
          dbrgrpEstufagem.DataField := '';
          dbrgrpEstufagem.Items.Clear;
          dbrgrpEstufagem.Values.Clear;
          if ConsultaLookUp('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', vViaTransp, 'IN_FCL') = '1' then begin
            dbrgrpEstufagem.Items.Add('FCL');
            dbrgrpEstufagem.Values.Add('1');
          end;
          if ConsultaLookUp('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', vViaTransp, 'IN_LCL') = '1' then begin
            dbrgrpEstufagem.Items.Add('LCL');
            dbrgrpEstufagem.Values.Add('0');
          end;
          if ConsultaLookUp('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', vViaTransp, 'IN_CS') = '1' then begin
            dbrgrpEstufagem.Items.Add('Carga Solta');
            dbrgrpEstufagem.Values.Add('2');
          end;
          dbrgrpEstufagem.Width := dbrgrpEstufagem.Items.Count*(100);
          dbrgrpEstufagem.Left := 727 - dbrgrpEstufagem.Items.Count*(100);
          dbrgrpEstufagem.Columns := dbrgrpEstufagem.Items.Count;
          dbrgrpEstufagem.DataField := 'TP_ESTUFAGEM';
        end;


      if qry_processo_TP_ESTUFAGEM.AsString = '0' then
      begin
        qry_instrucao_lcl_.close;
        qry_instrucao_lcl_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
        qry_instrucao_lcl_.Prepare;
        qry_instrucao_lcl_.Open;
        //qry_instrucao_lcl_.Edit;
      end else begin
        if qry_cntr_.State in [dsInactive] then
        begin
          qry_cntr_.Close;
          qry_cntr_.Prepare;
          qry_cntr_.Open;
        end;
        qry_instrucao_fcl_.close;
        qry_instrucao_fcl_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
        qry_instrucao_fcl_.Prepare;
        qry_instrucao_fcl_.Open;
        //qry_instrucao_fcl_.Edit;
        dbgrid_fcl.Columns.items[4].Readonly := ( qry_processo_IN_ROUTING.AsString = '1' );
        if dbgrid_fcl.Columns.items[4].Readonly then
          dbgrid_fcl.Columns.items[4].Color := clMenu
        else dbgrid_fcl.Columns.items[4].Color := clWindow;
      end;
//      qry_processo_.Edit;
    end;
  end;
  Btn_Mi(False, False, False, False);
end;

procedure TFrm_Instrucao_Embarque.btn_sairClick(Sender: TObject);
begin
  ActiveControl := nil;
  Close;
end;

procedure TFrm_Instrucao_Embarque.btn_co_exportadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_Instrucao_embarque.qry_processo_) then
      exit;
    datm_instrucao_embarque.qry_processo_CD_EMP_EST.AsString := ConsultaOnLineEx('TEMPRESA_EST','Exportadores',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome Empresa'],'CD_EMPRESA',frm_main.mi_cad_emp_est);
  end else
    dbedt_nm_exportador.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',dbedt_cd_exportador.Text,'NM_EMPRESA');
  dbedt_cd_exportadorExit(sender);
end;

procedure TFrm_Instrucao_Embarque.dbedt_cd_exportadorExit(Sender: TObject);
begin
  with datm_instrucao_embarque do
  begin
    if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then
      exit;
    if dbedt_cd_exportador.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_exportador );
      qry_pesquisa_.Active := False;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_EMPRESA, CD_EMPRESA,   RTRIM(END_EMPRESA) + ');
      qry_pesquisa_.Sql.Add(' RTRIM(CASE ISNULL(END_NUMERO,"") WHEN "" THEN "" ELSE ", "  + END_NUMERO END) + ');
      qry_pesquisa_.Sql.Add(' RTRIM(CASE ISNULL(END_COMPL,"")  WHEN "" THEN "" ELSE "  "  + END_COMPL  END) + ');
      qry_pesquisa_.Sql.Add(' RTRIM(CASE ISNULL(END_CIDADE,"") WHEN "" THEN "" ELSE " - " + END_CIDADE END) + ');
      qry_pesquisa_.Sql.Add(' RTRIM(CASE ISNULL(END_ESTADO,"") WHEN "" THEN "" ELSE " - " + END_ESTADO END) + ');
      qry_pesquisa_.Sql.Add(' RTRIM(CASE ISNULL(CD_PAIS,"")    WHEN "" THEN "" ELSE " - " + (SELECT DESCRICAO FROM TPAIS WHERE CODIGO = CD_PAIS) END) AS END_EMPRESA, ');
      qry_pesquisa_.Sql.Add(' NR_TELEFONE, NM_CONTATO FROM TEMPRESA_EST');
      qry_pesquisa_.Sql.Add(' WHERE CD_EMPRESA ="'+dbedt_cd_exportador.Text+'"');
      qry_pesquisa_.Active := true;
      if not qry_pesquisa_.IsEmpty then
      begin
        qry_processo_NM_EMPRESA_1.AsString := qry_pesquisa_.Fields[0].AsString;
        qry_processo_NM_CONTATO.AsString   := qry_pesquisa_.Fields[4].AsString;
        qry_processo_END_EMPRESA.AsString  := qry_pesquisa_.Fields[2].AsString;
        qry_processo_NR_TELEFONE.AsString  := qry_pesquisa_.Fields[3].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_exportador.Text := '';
        BoxMensagem('Código do Exportador inválido!', 2);
        dbedt_cd_exportador.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure TFrm_Instrucao_Embarque.edt_chaveChange(Sender: TObject);
begin
  if cb_ordem.Itemindex = 0 then
    Localiza(datm_instrucao_embarque.qry_processo_, msk_cd_unid.text + msk_cd_produto.text + edt_chave.Text, a_str_indices[cb_ordem.ItemIndex])
  else
    Localiza(datm_instrucao_embarque.qry_processo_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex]);
end;

procedure TFrm_Instrucao_Embarque.cb_ordemChange(Sender: TObject);
begin
  edt_chave.Text := '';
  edt_chave.SetFocus;
  datm_instrucao_embarque.qry_processo_.Close;
  datm_instrucao_embarque.qry_processo_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid.text;
  datm_instrucao_embarque.qry_processo_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
  case cb_ordem.ItemIndex of
    0: datm_instrucao_embarque.qry_processo_.Sql[26] := ' TP.NR_PROCESSO';
    1: datm_instrucao_embarque.qry_processo_.Sql[26] := ' NM_EMPRESA';
    2: datm_instrucao_embarque.qry_processo_.Sql[26] := ' TPO.CD_SIGLA';
    3: datm_instrucao_embarque.qry_processo_.Sql[26] := ' TPOR.CD_SIGLA';
  end;


{  if cb_ordem.itemindex = 0 then
    datm_instrucao_embarque.qry_processo_.Sql[26] := ' TP.NR_PROCESSO';
  if cb_ordem.itemindex = 1 then
    datm_instrucao_embarque.qry_processo_.Sql[26] := ' NM_EMPRESA';
  if cb_ordem.itemindex = 2 then
    datm_instrucao_embarque.qry_processo_.Sql[26] := ' TPO.CD_SIGLA';
  if cb_ordem.itemindex = 3 then
    datm_instrucao_embarque.qry_processo_.Sql[26] := ' TPOR.CD_SIGLA'; }
  datm_instrucao_embarque.qry_processo_.Prepare;
  datm_instrucao_embarque.qry_processo_.Open;
end;

procedure TFrm_Instrucao_Embarque.dbedt_cd_clienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F5) and (not TDBEdit(Sender).ReadOnly) then
  begin
    if Sender = dbedt_cd_exportador then btn_co_exportadorClick(btn_co_exportador);
    if Sender = dbedt_cd_agente     then btn_co_agenteClick(btn_co_agente);
    if Sender = dbedt_cd_origem     then btn_co_origemClick(btn_co_origem);
    if Sender = dbedt_cd_destino    then btn_co_destinoClick(btn_co_destino);
    if Sender = dbedt_cd_moeda      then btn_co_moedaClick(btn_co_moeda);
   end else begin
     TDBEdit(Sender).DataSource.DataSet.Edit;
   end;
end;

procedure TFrm_Instrucao_Embarque.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #27 then Close;
end;

procedure TFrm_Instrucao_Embarque.msk_cd_unidExit(Sender: TObject);
begin
  if msk_cd_unid.Text <> '' then
  begin
    ValCodEdt( msk_cd_unid );
    datm_instrucao_embarque.qry_pesquisa_.Active:=false;
    datm_instrucao_embarque.qry_pesquisa_.Sql.Clear;
    datm_instrucao_embarque.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_cd_unid.Text+'"');
    datm_instrucao_embarque.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_instrucao_embarque.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_instrucao_embarque.qry_pesquisa_.Active:=true;
    if datm_instrucao_embarque.qry_pesquisa_.RecordCount > 0 then
    begin
      edt_nm_unid.text:= datm_instrucao_embarque.qry_pesquisa_.Fields[0].AsString;
      datm_instrucao_embarque.qry_pesquisa_.Close;
      datm_instrucao_embarque.qry_processo_.Close;
      datm_instrucao_embarque.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_cd_unid.Text;
      datm_instrucao_embarque.qry_processo_.ParamByName('CD_PRODUTO').AsString:=msk_cd_produto.Text;
      datm_instrucao_embarque.qry_processo_.Prepare;
      datm_instrucao_embarque.qry_processo_.Open;
    end
    else
    begin
      datm_instrucao_embarque.qry_pesquisa_.Close;
      edt_nm_unid.Text := '';
      BoxMensagem('Código da Unidade de Negócio inválido!', 2);
      msk_cd_unid.SetFocus;
      Exit;
    end;
  end
  else
  begin
    Boxmensagem('A Unidade de Negócio deve ser informado!',2);
    msk_cd_unid.SetFocus;
  end;
end;

procedure TFrm_Instrucao_Embarque.btn_uni_negClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    msk_cd_unid.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg, 1,msk_cd_unid.Text);
    msk_cd_unidExit(nil);
  End Else
    edt_nm_unid.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid.Text,'AP_UNID_NEG');
end;

procedure TFrm_Instrucao_Embarque.btn_co_produtoClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Descrição'],'CD_PRODUTO', nil, 1, msk_cd_produto.Text);
    msk_cd_produtoExit(nil);
  End Else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'NM_PRODUTO');
end;

procedure TFrm_Instrucao_Embarque.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text <> '' then
  begin
    ValCodEdt( msk_cd_produto );
    datm_instrucao_embarque.qry_pesquisa_.Active:=false;
    datm_instrucao_embarque.qry_pesquisa_.Sql.Clear;
    datm_instrucao_embarque.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_cd_produto.Text+'"');
    datm_instrucao_embarque.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    datm_instrucao_embarque.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_instrucao_embarque.qry_pesquisa_.Active:=true;
    if not datm_instrucao_embarque.qry_pesquisa_.IsEmpty then
    begin
      edt_nm_produto.text:= datm_instrucao_embarque.qry_pesquisa_.Fields[0].AsString;
      datm_instrucao_embarque.qry_pesquisa_.Close;
      datm_instrucao_embarque.qry_processo_.Close;
      datm_instrucao_embarque.qry_processo_.ParamByName('CD_UNID_NEG').AsString :=msk_cd_unid.Text;
      datm_instrucao_embarque.qry_processo_.ParamByName('CD_PRODUTO').AsString  :=msk_cd_produto.Text;
      datm_instrucao_embarque.qry_processo_.Prepare;
      datm_instrucao_embarque.qry_processo_.Open;
    end
    else
    begin
      datm_instrucao_embarque.qry_pesquisa_.Close;
      edt_nm_produto.Text := '';
      BoxMensagem('Código do Produto inválido ou não habilidado!', 2);
      msk_cd_produto.SetFocus;
      Exit;
    end;
  end
  else
  begin
    Boxmensagem('O Produto deve ser informado!',2);
    msk_cd_produto.SetFocus;
  end;
end;

procedure TFrm_Instrucao_Embarque.dbedt_cd_exportadorChange(Sender: TObject);
begin
  if (datm_instrucao_embarque.qry_processo_.State in [dsEdit,dsInsert]) then
    btn_mi(false,True,True,false);
end;

procedure TFrm_Instrucao_Embarque.routing_order(Hab: Boolean);
begin
  dbLookCB_incoterm.ReadOnly:= Hab;        //hab = true entao routing order
  dbLookp_tp_frete.ReadOnly := Hab;
  dbedt_cd_moeda.ReadOnly   := Hab;
//  dbllk_tp_carga.ReadOnly   := Hab;
  cbbTipoCarga.Enabled      := not Hab;


  dbedt_venda_lcl.Visible   := Hab;
  dbedt_frete_lcl.Visible   := Hab;
  //dbedt_venda_fcl.Visible   := Hab;
  dbedt_frete_fcl.Visible   := Hab;
  lbl_frete_lcl.Visible      := Hab;
  lbl_tarifa_lcl.Visible     := Hab;
  lb_frete_fcl.Visible      := Hab;
  //lb_tarifa_fcl.Visible     := Hab;
  btn_co_moeda.Visible      := not Hab;
  if Hab then
  begin
    dbLookCB_incoterm.Color:= clMenu;
    dbLookp_tp_frete.Color := clMenu;
    dbedt_cd_moeda.Color   := clMenu;
//    dbllk_tp_carga.Color   := clMenu;
    cbbTipoCarga.Color     := clMenu;
  end
  else
  begin
    dbLookCB_incoterm.Color:= clwindow;
    dbLookp_tp_frete.Color := clwindow;
    dbedt_cd_moeda.Color   := clWindow;
//    dbllk_tp_carga.Color   := clWindow;
    cbbTipoCarga.Color     := clWindow;
  end;
end;

procedure TFrm_Instrucao_Embarque.FormShow(Sender: TObject);
begin
  pnl_manut_proc.Color := clMenuBroker;
  shp1.Brush.Color := clPnlClaroBroker;
  with datm_instrucao_embarque do
  begin
    qry_processo_.Close;
    if Pesquisa <> '' then
    begin
      qry_processo_.ParamByName('CD_UNID_NEG').AsString   := copy(Pesquisa,1,2);
      qry_processo_.ParamByName('CD_PRODUTO').AsString    := copy(Pesquisa,3,2);
      qry_processo_.ParamByName('CD_VIA_TRANSP').AsString := via_transp;
      qry_processo_.Sql[29]:=' AND NR_PROCESSO="'+ Pesquisa+'"';
    end
    else
    begin
      qry_processo_.ParamByName('CD_UNID_NEG').AsString   := msk_cd_unid.Text;
      qry_processo_.ParamByName('CD_PRODUTO').AsString    := msk_cd_produto.Text;
      qry_processo_.ParamByName('CD_VIA_TRANSP').AsString := via_transp;
    end;
    qry_processo_.Prepare;
    qry_processo_.Open;
  end;
  if via_transp = '04' then
  begin
    ts_volumes.TabVisible := false;
    ts_carga.TabVisible   := true;
    DBGrid_Lista_instrucao.Columns.Items[2].visible := true;
    DBGrid_Lista_instrucao.Columns.Items[3].visible := true;
    DBGrid_Lista_instrucao.Columns.Items[4].visible := false;
    DBGrid_Lista_instrucao.Columns.Items[5].visible := false;
  end;
  if via_transp = '01' then
  begin
    ts_volumes.TabVisible := true;
    ts_carga.TabVisible   := false;
    DBGrid_Lista_instrucao.Columns.Items[2].visible := false;
    DBGrid_Lista_instrucao.Columns.Items[3].visible := false;
    DBGrid_Lista_instrucao.Columns.Items[4].visible := true;
    DBGrid_Lista_instrucao.Columns.Items[5].visible := true;
  end;
  campo_consolidacao;
  str_cd_rotina_atalho := '';
end;

procedure TFrm_Instrucao_Embarque.dbgrid_lclDblClick(Sender: TObject);
begin
{  if dbgrid_lcl.Columns.Grid.Fields[dbgrid_lcl.Columns.Grid.SelectedIndex].DisplayName = 'NM_EMBALAGEM' then  begin
    Application.CreateForm(Tfrm_embal, frm_embal);
    with frm_embal Do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      ShowModal;
      lCons_OnLine := False;
    end;
    if (frm_embal.Cons_Online_Texto <> '' ) then
    begin
//      If ( st_modificar ) then
//      begin
        if not(datm_Instrucao_Embarque.qry_instrucao_lcl_.State in [dsEdit,dsInsert]) then
          datm_Instrucao_Embarque.qry_instrucao_lcl_.Edit;
        datm_Instrucao_Embarque.qry_instrucao_lcl_TP_EMBALAGEM.Value := frm_embal.Cons_Online_Texto;
//      end;
    end;
  end;       }

    if (TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'TP_EMBALAGEM') or
       (TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'calcEMBALAGEM')     then  begin
    if not(TDBGrid(Sender).DataSource.DataSet.State in [dsEdit,dsInsert]) then
      TDBGrid(Sender).DataSource.DataSet.Edit;
    TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_EMBALAGEM').AsString  := ConsultaOnlineEx('TEMBALAGEM', 'Embalagens',
                                                                                ['CD_EMBALAGEM', 'NM_EMBALAGEM_S'],
                                                                                ['Código', 'Descrição'],
                                                                                'CD_EMBALAGEM', nil, 1,
                                                                                TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_EMBALAGEM').AsString);
  end;
end;

procedure TFrm_Instrucao_Embarque.btn_co_moedaClick(Sender: TObject);
var moeda :string;
begin
  moeda := ConsultaOnLineEx('TMOEDA_BROKER','Moedas',['CD_MOEDA','NM_MOEDA','AP_MOEDA'],['Código','Moeda','Sigla'],'CD_MOEDA',nil);   if moeda <> '' then
  begin
    if datm_instrucao_embarque.qry_processo_.State in [dsBrowse, dsInactive] then
      datm_instrucao_embarque.qry_processo_.Edit;
    datm_instrucao_embarque.qry_processo_CD_MOEDA_FRETE.AsString := Moeda;
    dbedt_cd_moedaExit(sender);
  end;
end;

procedure TFrm_Instrucao_Embarque.dbedt_cd_moedaExit(Sender: TObject);
begin
  with datm_instrucao_embarque do
  begin
    if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then
      exit;
     if dbedt_cd_moeda.Text <> '' then
     begin
      ValidCodigo( dbedt_cd_moeda );
      qry_pesquisa_.Active := False;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_MOEDA FROM TMOEDA_BROKER ');
      qry_pesquisa_.Sql.Add('WHERE CD_MOEDA ="'+dbedt_cd_moeda.Text+'"');
      qry_pesquisa_.Active := true;
      if not qry_pesquisa_.IsEmpty then
      begin
        qry_processo_NM_MOEDA.AsString:= qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_moeda.Text := '';
        BoxMensagem('Código da Moeda inválido!', 2);
        dbedt_cd_moeda.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure TFrm_Instrucao_Embarque.btn_prealertaClick(Sender: TObject);
begin
  with datm_instrucao_embarque do
  begin
  try

    qryShippingMar.Close;
    qryShippingMar.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
    qryShippingMar.ParamByName('USUARIO').AsString := str_cd_usuario;
    qryShippingMar.Open;
    qryRelDet1.Close;
    qryRelDet1.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
    qryRelDet1.Open;
    qryRelDet2.Close;
    qryRelDet2.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
    qryRelDet2.Open;
    if datm_instrucao_embarque.qry_processo_TP_ESTUFAGEM.AsString = '0' then begin
      qryRelDet3.Close;
      qryRelDet3.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qryRelDet3.Open;
    end else begin
      qryRelDet3FCL.Close;
      qryRelDet3FCL.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qryRelDet3FCL.Open;
    end;

    if (qryRelDet1.IsEmpty) and (qryRelDet2.IsEmpty) and
       (((qryRelDet3.IsEmpty)    and ((datm_instrucao_embarque.qry_processo_TP_ESTUFAGEM.AsString = '0') or (datm_instrucao_embarque.qry_processo_TP_ESTUFAGEM.AsString = '2'))) or
        ((qryRelDet3FCL.IsEmpty) and (datm_instrucao_embarque.qry_processo_TP_ESTUFAGEM.AsString = '1'))) then
      ShowMessage('Não existem itens a serem exibidos!')
    else begin
      Application.CreateForm(TFrm_impressao, Frm_impressao );
      Frm_impressao.cd_unid_neg   := datm_instrucao_embarque.qry_processo_CD_UNID_NEG.AsString;
      Frm_impressao.cd_modulo     := '3903';
      Frm_impressao.cd_produto    := datm_instrucao_embarque.qry_processo_CD_PRODUTO.AsString;
      Frm_impressao.cd_via_transp := datm_instrucao_embarque.qry_processo_CD_VIA_TRANSPORTE.AsString;
      Frm_impressao.ShowModal;
      if boxmensagem('O processo será enviado ao Pré-Alerta. Confirma ?',1) then
      begin
        if (datm_instrucao_embarque.qry_processo_CD_MOEDA_FRETE.AsString = '') or (datm_instrucao_embarque.qry_processo_CD_INCOTERM.AsString = '')  then
        begin
          Boxmensagem('Existe Informação pendente para este Processo. Favor verificar Moeda e/ou Incoterm.',2);
          Exit;
        end;
        Pesquisa := datm_instrucao_embarque.qry_processo_NR_PROCESSO.AsString;
        cd_unid_neg_gestao := datm_instrucao_embarque.qry_processo_.FieldByName('CD_UNID_NEG').AsString;
        cd_prod_gestao := datm_instrucao_embarque.qry_processo_.FieldByName('CD_PRODUTO').AsString;
        cd_origem_gestao := datm_instrucao_embarque.qry_processo_.FieldByName('CD_ORIGEM').AsString;
        cd_destino_gestao := datm_instrucao_embarque.qry_processo_.FieldByName('CD_DESTINO').AsString;


        if not (datm_instrucao_embarque.qry_processo_.State in [dsEdit]) then
          datm_instrucao_embarque.qry_processo_.Edit;
        datm_instrucao_embarque.qry_processo_IN_PEDIDO.AsString:= '1' ;
        if not grava then
          exit;
        datm_instrucao_embarque.qry_processo_.Close;
        datm_instrucao_embarque.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_cd_unid.Text;
        datm_instrucao_embarque.qry_processo_.ParamByName('CD_PRODUTO').AsString:=msk_cd_produto.Text;
        datm_instrucao_embarque.qry_processo_.Prepare;
        datm_instrucao_embarque.qry_processo_.Open;
        datm_instrucao_embarque.qry_processo_.Locate('NR_PROCESSO',Pesquisa,[]);

        //chama tela do Pré-alerta (kleber - 06/03/2007)
        if Application.MessageBox('Deseja ir para a tela de Pré-alerta?', 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
          str_cd_rotina_atalho := '3904';
          Close;
        end else begin
          str_cd_rotina_atalho := '';
          cd_unid_neg_gestao := '';
          cd_prod_gestao := '';
          cd_origem_gestao := '';
          cd_destino_gestao := '';
        end;

      end;
    end;
  finally
    qryRelDet1.Close;
    qryRelDet2.Close;
    qryRelDet3.Close;
    qryRelDet3FCL.Close;
    qryShippingMar.Close;
  end;
  end;
end;


{ --- antiga rotina do botão imprimir ------------------------------------------
procedure TFrm_Instrucao_Embarque.btn_imprimirClick(Sender: TObject);
var
  modulo : string[4];
begin
  if datm_instrucao_embarque.qry_cntr_.State in [dsInactive] then
  begin
    datm_instrucao_embarque.qry_cntr_.Close;
    datm_instrucao_embarque.qry_cntr_.Prepare;
    datm_instrucao_embarque.qry_cntr_.Open;
  end;
  datm_instrucao_embarque.qry_rel_instrucao_.Close;
  datm_instrucao_embarque.qry_rel_instrucao_.ParamByName('NR_PROCESSO').AsString := datm_instrucao_embarque.qry_processo_NR_PROCESSO.AsString;
  datm_instrucao_embarque.qry_rel_instrucao_.Prepare;
  datm_instrucao_embarque.qry_rel_instrucao_.Open;
  datm_instrucao_embarque.qry_instrucao_carga_.close;
  datm_instrucao_embarque.qry_instrucao_lcl_.close;
  datm_instrucao_embarque.qry_instrucao_fcl_.close;
  datm_instrucao_embarque.qry_instrucao_carga_.close;
  if (datm_instrucao_embarque.qry_processo_TP_ESTUFAGEM.AsString = '0') and (datm_instrucao_embarque.qry_processo_CD_VIA_TRANSPORTE.AsString = '04') then
  begin
    datm_instrucao_embarque.qry_instrucao_carga_.ParamByName('NR_PROCESSO').AsString := datm_instrucao_embarque.qry_processo_NR_PROCESSO.AsString;
    datm_instrucao_embarque.qry_instrucao_carga_.Prepare;
    datm_instrucao_embarque.qry_instrucao_carga_.Open;
    modulo:='3001';
  end;
  if (datm_instrucao_embarque.qry_processo_TP_ESTUFAGEM.AsString = '0') and (datm_instrucao_embarque.qry_processo_CD_VIA_TRANSPORTE.AsString = '01') then
  begin
    datm_instrucao_embarque.qry_instrucao_lcl_.ParamByName('NR_PROCESSO').AsString := datm_instrucao_embarque.qry_processo_NR_PROCESSO.AsString;
    datm_instrucao_embarque.qry_instrucao_lcl_.Prepare;
    datm_instrucao_embarque.qry_instrucao_lcl_.Open;
    modulo:='3002';
  end;
  if (datm_instrucao_embarque.qry_processo_TP_ESTUFAGEM.AsString = '1') and (datm_instrucao_embarque.qry_processo_CD_VIA_TRANSPORTE.AsString = '01') then
  begin
    datm_instrucao_embarque.qry_instrucao_fcl_.ParamByName('NR_PROCESSO').AsString:= datm_instrucao_embarque.qry_processo_NR_PROCESSO.AsString;
    datm_instrucao_embarque.qry_instrucao_fcl_.Prepare;
    datm_instrucao_embarque.qry_instrucao_fcl_.Open;
    modulo:='3002';
  end;
  Application.CreateForm(TFrm_impressao, Frm_impressao );
  Frm_impressao.cd_emp_nac    := datm_instrucao_embarque.qry_processo_CD_CLIENTE.AsString;
  Frm_impressao.cd_unid_neg   := datm_instrucao_embarque.qry_processo_CD_UNID_NEG.AsString;
  Frm_impressao.cd_agente     := datm_instrucao_embarque.qry_processo_CD_AGENTE.AsString;
  Frm_impressao.cd_cia        := datm_instrucao_embarque.qry_processo_CD_CIA_TRANSP.AsString;
  Frm_impressao.cd_armador    := datm_instrucao_embarque.qry_processo_CD_ARMADOR.AsString;
  Frm_impressao.cd_modulo     := '3903';
  Frm_impressao.cd_produto    := datm_instrucao_embarque.qry_processo_CD_PRODUTO.AsString;
  Frm_impressao.cd_via_transp := datm_instrucao_embarque.qry_processo_CD_VIA_TRANSPORTE.AsString;
  Frm_impressao.ShowModal;
  if boxmensagem('Impressão realizada com Sucesso?',1) then
  begin
    if (datm_instrucao_embarque.qry_processo_CD_MOEDA_FRETE.AsString = '') or (datm_instrucao_embarque.qry_processo_CD_INCOTERM.AsString = '')  then
    begin
      Boxmensagem('Existe Informação pendente para este Processo. Favor verificar Moeda e/ou Incoterm.',2);
      Exit;
    end;
    Pesquisa := datm_instrucao_embarque.qry_processo_NR_PROCESSO.AsString;
    if not (datm_instrucao_embarque.qry_processo_.State in [dsEdit]) then
      datm_instrucao_embarque.qry_processo_.Edit;
    datm_instrucao_embarque.qry_processo_IN_PEDIDO.AsString:= '1' ;
    if not grava then
      exit;
    datm_instrucao_embarque.qry_processo_.Close;
    datm_instrucao_embarque.qry_processo_.ParamByName('CD_UNID_NEG').AsString:=msk_cd_unid.Text;
    datm_instrucao_embarque.qry_processo_.ParamByName('CD_PRODUTO').AsString:=msk_cd_produto.Text;
    datm_instrucao_embarque.qry_processo_.Prepare;
    datm_instrucao_embarque.qry_processo_.Open;
    datm_instrucao_embarque.qry_processo_.Locate('NR_PROCESSO',Pesquisa,[]);
  end;
end;
-------------------------------------------------------------------------------}

procedure TFrm_Instrucao_Embarque.dbedt_cd_local_consoExit(Sender: TObject);
begin
  with datm_instrucao_embarque do
  begin
    if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then
       Exit;
    if dbedt_cd_local_conso.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_local_conso );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT  CD_PORTO, NM_PORTO, CD_SIGLA FROM TPORTO WHERE CD_PORTO ="'+dbedt_cd_local_conso.Text+'"');
      if via_transp = '04' then
        qry_pesquisa_.Sql.Add(' AND TP_PORTO = "0" ')
      else
        qry_pesquisa_.Sql.Add(' AND TP_PORTO = "1" ');
      qry_pesquisa_.Active := true;
      if not qry_pesquisa_.IsEmpty then
      begin
        qry_processo_NM_CONSOLIDACAO.AsString:=qry_pesquisa_.Fields[1].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_local_conso.Text := '';
        BoxMensagem('Código do Local de Consolidação inválido!', 2);
        dbedt_cd_local_conso.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure TFrm_Instrucao_Embarque.btn_consolidacaoClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    datm_instrucao_embarque.qry_processo_CD_LOCAL_CONSOLIDACAO.Value := ConsultaOnLineEx('TPORTO','Portos',['CD_PORTO','NM_PORTO'],['Código','Nome'],'CD_PORTO',nil, 1,dbedt_cd_local_conso.Text);
    dbedt_cd_local_consoExit(nil);
  End Else
    dbedt_nm_local_conso.Text := ConsultaLookUP('TPORTO','CD_PORTO', dbedt_cd_local_conso.Text,'NM_PORTO');
end;

procedure TFrm_Instrucao_Embarque.campo_consolidacao;
var Qry:TQuery;
begin
  Qry := Tquery.Create(Application);
  Qry.DataBaseName := 'DBBROKER';
  Qry.Sql.Add('SELECT IN_CONSOLIDACAO_LOCAL_DIF FROM TPARAMETROS ');
  Qry.Open;
  lb_consolidacao.Visible      := (Qry.Fields[0].AsString = '1');
  dbedt_cd_local_conso.Visible := (Qry.Fields[0].AsString = '1');
  dbedt_nm_local_conso.Visible := (Qry.Fields[0].AsString = '1');
  btn_consolidacao.Visible     := (Qry.Fields[0].AsString = '1');
  Qry.Free;
end;

procedure TFrm_Instrucao_Embarque.dbgrid_lclExit(Sender: TObject);
begin
{  if datm_instrucao_embarque.qry_instrucao_lcl_.State in [dsEdit,dsInsert] then begin
    if datm_instrucao_embarque.qry_instrucao_lcl_TP_EMBALAGEM.AsString = '' then begin
      ShowMessage('Não há embalagem cadastrada. Operação será cancelada!');
      datm_instrucao_embarque.qry_instrucao_lcl_.Cancel;
      Exit;
    end else
      datm_instrucao_embarque.qry_instrucao_lcl_.Post;
  end; }
end;

procedure TFrm_Instrucao_Embarque.dbgrid_fclExit(Sender: TObject);
begin
{  if datm_instrucao_embarque.qry_instrucao_fcl_.State in [dsEdit,dsInsert] then begin
   if datm_instrucao_embarque.qry_instrucao_fcl_TP_CNTR.AsString = '' then begin
     ShowMEssage('Não existe Tipo de Contãiner. Operação será cancelada!');
     datm_instrucao_embarque.qry_instrucao_fcl_.Cancel;
   end else
    datm_instrucao_embarque.qry_instrucao_fcl_.Post;
  end;  }
end;


procedure TFrm_Instrucao_Embarque.msk_cd_unidKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then begin
    if Sender = msk_cd_unid         then btn_uni_negClick(btn_uni_neg);
    if Sender = msk_cd_produto      then btn_co_produtoClick(btn_co_produto);
  end;
end;

procedure TFrm_Instrucao_Embarque.dbLookCB_incotermKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  TDBLookupComboBox(Sender).DataSource.DataSet.Edit;
end;

procedure TFrm_Instrucao_Embarque.dbllk_tp_cargaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  TRxDBComboBox(Sender).DataSource.DataSet.Edit;
end;

procedure TFrm_Instrucao_Embarque.DBMemo2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  TDbMemo(Sender).DataSource.DataSet.Edit;
end;

procedure TFrm_Instrucao_Embarque.dbLookCB_incotermClick(Sender: TObject);
begin
  TDBLookupComboBox(Sender).DataSource.DataSet.Edit;
  dbedt_cd_exportadorChange(nil);
end;

procedure TFrm_Instrucao_Embarque.dbllk_tp_cargaClick(Sender: TObject);
begin
  TRxDBComboBox(Sender).DataSource.DataSet.Edit;
  dbedt_cd_exportadorChange(nil);
end;

procedure TFrm_Instrucao_Embarque.dbgrid_lclKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //não salvar sem embalagem
{  if (Key = VK_DOWN) or
     (((Key = VK_LEFT) or (Key = VK_TAB))
      and (TDBGrid(Sender).SelectedIndex = TDBGrid(Sender).Columns.Count - 1)) then
     if ConsultaLookUp('TEMBALAGEM', 'CD_EMBALAGEM',datm_instrucao_embarque.qry_instrucao_lcl_TP_EMBALAGEM.ASString , 'NM_EMBALAGEM_S') = '' then begin
      ShowMessage('Não há embalagem cadastrada. Operação será cancelada!');
      datm_instrucao_embarque.qry_instrucao_lcl_.Cancel;
    end; }

  if key = VK_F5 then dbgrid_lclDblClick(Sender);  

end;


procedure TFrm_Instrucao_Embarque.dbgrid_fclKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //não salvar sem cntr
{  if (Key = VK_DOWN) or
     (((Key = VK_LEFT) or (Key = VK_TAB))
      and (TDBGrid(Sender).SelectedIndex = TDBGrid(Sender).Columns.Count - 1)) then
     if ConsultaLookUp('TTP_CNTR', 'TP_CNTR',datm_instrucao_embarque.qry_instrucao_Fcl_TP_CNTR.ASString , 'NM_TP_CNTR') = '' then begin
      ShowMessage('Não há Contâiner cadastrado. Operação será cancelada!');
      datm_instrucao_embarque.qry_instrucao_fcl_.Cancel;
    end;
     }

  if key = VK_F5 then dbgrid_fclDblClick(Sender);   
end;

procedure TFrm_Instrucao_Embarque.dbgrid_fclDblClick(Sender: TObject);
begin
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcCNTR') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'TP_CNTR')  then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
      TDBGrid(Sender).dataSource.DataSet.FieldByname('TP_CNTR').AsString := ConsultaOnLineEx('TTP_CNTR', 'Tipo de Contâiner',['TP_CNTR', 'NM_TP_CNTR'], ['Código','Tipo'],'TP_CNTR', nil, 1, TDBGrid(Sender).dataSource.DataSet.FieldByname('TP_CNTR').AsString);
  end;
end;

procedure TFrm_Instrucao_Embarque.dbgrid_fclEnter(Sender: TObject);
begin
  if TDBGrid(Sender).DataSource.DataSet.State in [dsBrowse, dsInactive] then
   TDBGrid(Sender).DataSource.DataSet.Edit; 
end;

procedure TFrm_Instrucao_Embarque.dbrgrpEstufagemClick(Sender: TObject);
begin
  //coloca em edição
  if TDBRadioGroup(Sender).DataSource.DataSet.State in [dsBrowse, dsInactive] then
   TDBRadioGroup(Sender).DataSource.DataSet.Edit;
  //habilita botão de salvar
  dbedt_cd_exportadorChange(nil);
  //troca os grids
  if (dbrgrpestufagem.ItemIndex = dbrgrpestufagem.Items.IndexOf('FCL') ) then begin
    pnl_lcl.Visible := false;
    pnl_fcl.Visible := True;
    datm_instrucao_embarque.qry_instrucao_fcl_.close;
    datm_instrucao_embarque.qry_instrucao_fcl_.ParamByName('NR_PROCESSO').AsString := datm_instrucao_embarque.qry_processo_NR_PROCESSO.AsString;
    datm_instrucao_embarque.qry_instrucao_fcl_.Prepare;
    datm_instrucao_embarque.qry_instrucao_fcl_.Open;
    if datm_Instrucao_Embarque.qry_processo_IN_ROUTING.AsString = '1' then begin
      dbgrid_fcl.Columns.items[4].Readonly := true;
      dbgrid_fcl.Columns.items[4].Color    := clMenu;
    end else begin
      dbgrid_fcl.Columns.items[4].Readonly := false;
      dbgrid_fcl.Columns.items[4].Color    := clWindow;
    end;
  end else begin
    pnl_lcl.Visible := true;
    pnl_fcl.Visible := False;
    datm_instrucao_embarque.qry_instrucao_lcl_.close;
    datm_instrucao_embarque.qry_instrucao_lcl_.ParamByName('NR_PROCESSO').AsString := datm_instrucao_embarque.qry_processo_NR_PROCESSO.AsString;
    datm_instrucao_embarque.qry_instrucao_lcl_.Prepare;
    datm_instrucao_embarque.qry_instrucao_lcl_.Open;
  end;



end;

procedure TFrm_Instrucao_Embarque.dbrgrpEstufagemEnter(Sender: TObject);
begin
  TDBRadioGroup(Sender).DataSource.DataSet.Edit;
end;

procedure TFrm_Instrucao_Embarque.cbbTipoCargaChange(Sender: TObject);
begin
  if datm_instrucao_embarque.qry_processo_.State in [dsBrowse, dsInactive] then
    datm_instrucao_embarque.qry_processo_.Edit;
  dbedt_cd_exportadorChange(Sender);
end;

procedure TFrm_Instrucao_Embarque.dbgrid_lclColExit(Sender: TObject);
begin
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'TP_EMBALAGEM' then
  begin
    if (ConsultaLookUPSQL('SELECT NM_EMBALAGEM_S FROM TEMBALAGEM WHERE CD_EMBALAGEM = "'+ TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_EMBALAGEM').AsString +'"', 'NM_EMBALAGEM_S') = '') and
       (TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_EMBALAGEM').AsString <> '') then
    begin
      ShowMessage('Embalagem Inválida ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;
  end;
end;

procedure TFrm_Instrucao_Embarque.dbgrid_fclColExit(Sender: TObject);
begin
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'TP_CNTR' then
  begin
    if (ConsultaLookUP('TTP_CNTR', 'TP_CNTR',TDBGrid(Sender).DataSource.DataSet.FieldbyName('TP_CNTR').AsString , 'NM_TP_CNTR') = '') then
    begin
      ShowMessage('Tipo de Cntr inválido ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;
  end;
end;

procedure TFrm_Instrucao_Embarque.btnViagemClick(Sender: TObject);
begin

    if Sender is TSpeedButton then
    begin
      if not PoeEmEdicao(datm_instrucao_embarque.qry_processo_) then exit;
      datm_instrucao_embarque.qry_processo_NR_VIAGEM.AsString := ConsultaOnLineExSQL(
                                'SELECT V.NR_VIAGEM, V.DT_ESPERADA, V.DT_ENT, E.DESCRICAO, A.NM_ARMAZEM, ' +
                                'V.NR_MANIFESTO, V.NR_VIAGEM_ARMADOR ' +
                                'FROM   TVIAGEM V (NOLOCK), TARMAZEM A (NOLOCK), TLOCAL_EMBARQUE E (NOLOCK) ' +
                                'WHERE  V.CD_UNID_NEG = ''' + msk_cd_unid.Text + ''' AND ' +
                                'V.CD_PRODUTO = "01" AND ' +
                                'V.CD_EMBARCACAO = ''' + dbedtCdEmbarcacao.Text + ''' AND ' +
                                'V.CD_ARMAZEM_ATRACACAO *= A.CD_ARMAZEM AND ' +
                                'V.CD_LOCAL = E.CODIGO ',
                                'Viagens', ['NR_VIAGEM', 'DT_ESPERADA', 'DT_ENT', 'DESCRICAO.','NM_ARMAZEM','NR_MANIFESTO', 'NR_VIAGEM_ARMADOR'],
                                ['Viagem', 'Dt. Esperada', 'Dt. Entrada', 'Local Desemb.','Arm. Atracação','Nº Manifesto', 'Viagem Armador'], 'NR_VIAGEM', frm_main.mi_gp_ga_cad_viagem, dbedtNrViagem.Text);
      if Trim(datm_instrucao_embarque.qry_processo_NR_VIAGEM.AsString) <> '' then begin
        dbedtViagemArmador.Enabled := False;
        if ConsultaLookUpSQL('SELECT RTRIM(LTRIM(NR_VIAGEM_ARMADOR)) AS VIAGEM FROM TVIAGEM' +
                                             ' WHERE CD_EMBARCACAO = ''' + dbedtCdEmbarcacao.Text  + '''' +
                                             '   AND NR_VIAGEM     = ''' + dbedtNrViagem.Text      + '''' +
                                             '   AND CD_UNID_NEG   = ''' + msk_cd_unid.Text        + '''' +
                                             '   AND CD_PRODUTO    = ''01''', 'VIAGEM') <> '' then
          datm_instrucao_embarque.qry_processo_NR_VIAGEM_ARMADOR.AsString := ConsultaLookUpSQL('SELECT RTRIM(LTRIM(NR_VIAGEM_ARMADOR)) AS VIAGEM FROM TVIAGEM' +
                                             ' WHERE CD_EMBARCACAO = ''' + dbedtCdEmbarcacao.Text  + '''' +
                                             '   AND NR_VIAGEM     = ''' + dbedtNrViagem.Text      + '''' +
                                             '   AND CD_UNID_NEG   = ''' + msk_cd_unid.Text        + '''' +
                                             '   AND CD_PRODUTO    = ''01''', 'VIAGEM');
      end else begin
        dbedtViagemArmador.Enabled := True;
      end;
    end;
end;

procedure TFrm_Instrucao_Embarque.btnNavioClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    vEmbarcacao := datm_instrucao_embarque.qry_processo_CD_EMBARCACAO.AsString;
    if not PoeEmEdicao(datm_instrucao_embarque.qry_processo_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_instrucao_embarque.qry_processo_CD_EMBARCACAO.AsString := ConsultaOnLineEx('TEMBARCACAO','Embarcação',['CD_EMBARCACAO','NM_EMBARCACAO'],['Código','Nome'],'CD_EMBARCACAO',frm_main.mi_cad_embar, 1, dbedtCdEmbarcacao.Text);
    if datm_instrucao_embarque.qry_processo_CD_EMBARCACAO.AsString <> vEmbarcacao then
      dbedtNrViagem.Text := '';
  end
  else
    dbedtNmEmbarcacao.Text := ConsultaLookUP('TEMBARCACAO','CD_EMBARCACAO',dbedtCdEmbarcacao.Text,'NM_EMBARCACAO');
end;

procedure TFrm_Instrucao_Embarque.dbedtCdEmbarcacaoExit(Sender: TObject);
begin
  if Trim(dbedtCdEmbarcacao.Text) <> '' then begin
    dbedtCdEmbarcacao.Text := Copy('0000', 1, 4- Length(dbedtCdEmbarcacao.Text)) + dbedtCdEmbarcacao.Text;
    if dbedtNmEmbarcacao.Text = '' then begin
       ShowMessage('Navio Inválido!');
       dbedtCdEmbarcacao.Text := '';
       dbedtCdEmbarcacao.SetFocus;
    end;
  end;
  if not (datm_instrucao_embarque.qry_processo_.State in [dsInsert, dsEdit]) then Exit;
  if datm_instrucao_embarque.qry_processo_CD_EMBARCACAO.AsString <> vEmbarcacao then
    datm_instrucao_embarque.qry_processo_NR_VIAGEM.AsString := '';

end;

procedure TFrm_Instrucao_Embarque.dbedtCdEmbarcacaoEnter(Sender: TObject);
begin
  vEmbarcacao := datm_instrucao_embarque.qry_processo_CD_EMBARCACAO.AsString;
end;

procedure TFrm_Instrucao_Embarque.dbedtNrViagemExit(Sender: TObject);
begin
  if Trim(dbedtNrViagem.Text) <> '' then
  begin
    if ConsultaLookUPSQL('SELECT V.NR_VIAGEM FROM TVIAGEM V (NOLOCK) WHERE ' +
                         '       V.CD_UNID_NEG   = ''' + msk_cd_unid.Text + ''' AND ' +
                         '       V.CD_PRODUTO    = ''01'' AND ' +
                         '       V.CD_EMBARCACAO = ''' + dbedtCdEmbarcacao.Text + ''' AND ' +
                         '       V.NR_VIAGEM     = ''' + datm_instrucao_embarque.qry_processo_NR_VIAGEM.AsString + ''' ', 'NR_VIAGEM') = '' then
    begin
      ShowMessage('Viagem Inválida!');
      dbedtNrViagem.Text := '';
      dbedtNrViagem.SetFocus;
      dbedtViagemArmador.Enabled  := true;
    end else
      dbedtViagemArmador.Enabled  := false;
  end else
    dbedtViagemArmador.Enabled  := true;
end;

procedure TFrm_Instrucao_Embarque.dbedtCdEmbarcacaoChange(Sender: TObject);
begin
  if (datm_instrucao_embarque.qry_processo_.State in [dsEdit,dsInsert]) then begin
    btn_mi(false,True,True,false);
    btnNavioClick(Sender);
  end;
end;

procedure TFrm_Instrucao_Embarque.dbedtNrViagemChange(Sender: TObject);
begin
  if (datm_instrucao_embarque.qry_processo_.State in [dsEdit,dsInsert]) then begin
    btn_mi(false,True,True,false);
    btnViagemClick(Sender);
  end;  
end;

end.


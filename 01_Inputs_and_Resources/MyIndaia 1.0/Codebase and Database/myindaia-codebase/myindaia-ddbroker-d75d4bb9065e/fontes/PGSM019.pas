unit PGSM019;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, PGGP001, RxDBComb, Funcoes;

type
  Tfrm_Transportador_itl = class(TForm)
    pnl_cadastro: TPanel;
    btn_novo: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    dbg_cadastro: TDBGrid;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label3: TLabel;
    dbedt_cd_local_embarque: TDBEdit;
    Label4: TLabel;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    Label6: TLabel;
    btn_pais: TSpeedButton;
    Label7: TLabel;
    lb_sigla: TLabel;
    lb_sigla_iata: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label13: TLabel;
    Label10: TLabel;
    dbedt_look_nm_pais: TDBEdit;
    btn_co_cd_pais: TSpeedButton;
    Label15: TLabel;
    ts_conhececimentos: TTabSheet;
    pgtrl_conhecimento: TPageControl;
    ts_lista_conhec: TTabSheet;
    ts_dados_conhec: TTabSheet;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label12: TLabel;
    Label21: TLabel;
    DBEdit3: TDBEdit;
    Label22: TLabel;
    DBEdit4: TDBEdit;
    Label23: TLabel;
    DBEdit5: TDBEdit;
    Label27: TLabel;
    dbedt_dt_abertura: TDBEdit;
    dbradiogrp_inclusao: TDBRadioGroup;
    rxcbx_iata: TRxDBComboBox;
    Label28: TLabel;
    dbedt_look_nm_cidade: TDBEdit;
    ts_calculos: TTabSheet;
    Panel1: TPanel;
    dbedt_formula: TDBEdit;
    Label29: TLabel;
    Panel2: TPanel;
    Label30: TLabel;
    DBEdit6: TDBEdit;
    RxCombox_tp_comissao: TRxDBComboBox;
    Label32: TLabel;
    Label33: TLabel;
    DBEdit7: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit8: TDBEdit;
    dbedt_conhec_inicial: TDBEdit;
    dbedt_conhec_final: TDBEdit;
    Label25: TLabel;
    Label24: TLabel;
    dbedt_qtde: TDBEdit;
    Label26: TLabel;
    ts_agencias: TTabSheet;
    pnl_agencia: TPanel;
    label100: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    dbedt_cd_notificador: TDBEdit;
    Label20: TLabel;
    dbedt_nm_notificador: TDBEdit;
    btn_co_agencia: TSpeedButton;
    DBGrid3: TDBGrid;
    pnl_navio: TPanel;
    Label34: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    dbedt_cd_navio: TDBEdit;
    Label35: TLabel;
    dbedt_nm_navio: TDBEdit;
    btn_co_navio: TSpeedButton;
    DBGrid4: TDBGrid;
    Label8: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    DBEdit13: TDBEdit;
    Label9: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    dbedt_nm_local_embarque: TDBEdit;
    dbedt_apelido: TDBEdit;
    dbedt_sigla: TDBEdit;
    dbedt_cd_iata: TDBEdit;
    dbgoup_tp_transp: TDBRadioGroup;
    dbedt_endereco: TDBEdit;
    dbedt_endereco_compl: TDBEdit;
    dbedt_cep: TDBEdit;
    dbedt_cd_cidade: TDBEdit;
    dbedt_fabr_cd_pais: TDBEdit;
    DBEdit16: TDBEdit;
    dbedt_cnpj_transp: TDBEdit;
    dbedt_nr_account: TDBEdit;
    dbedt_nm_home_page: TDBEdit;
    pnl_demurrage: TGroupBox;
    Label19: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    btn_co_moeda: TSpeedButton;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    dbedt_cd_moeda: TDBEdit;
    dbedt_nm_moeda: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Panel3: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label5: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label44: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    Label45: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label31: TLabel;
    Label52: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel4: TPanel;
    Label46: TLabel;
    Label47: TLabel;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    DBText2: TDBText;
    Panel7: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Panel8: TPanel;
    lblStatus: TLabel;
    Shape3: TShape;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure btn_paisClick(Sender: TObject);
    procedure dbedt_fabr_cd_paisKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbedt_fabr_cd_paisExit(Sender: TObject);
    procedure pgctrlChange(Sender: TObject);
    procedure btn_co_cd_paisClick(Sender: TObject);
    procedure dbedt_cd_cidadeExit(Sender: TObject);
    procedure dbradiogrp_inclusaoChange(Sender: TObject);
    procedure calc_conhec;
    procedure dbedt_conhec_inicialExit(Sender: TObject);
    procedure dbedt_qtdeExit(Sender: TObject);
    procedure rxcbx_iataChange(Sender: TObject);
    function digitto_iata(var Conhecimento:string):String;
    function proximo_conhecimento(var conhecimento:String; casas:integer):String;
    procedure habilita_campos(Hab:Boolean);
    procedure pgctrlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dbgoup_tp_transpChange(Sender: TObject);
    procedure dbedt_cd_notificadorExit(Sender: TObject);
    procedure btn_co_agenciaClick(Sender: TObject);
    procedure pnl_agenciaEnter(Sender: TObject);
    procedure pnl_agenciaExit(Sender: TObject);
    procedure pnl_navioEnter(Sender: TObject);
    procedure pnl_navioExit(Sender: TObject);
    procedure dbedt_cd_navioExit(Sender: TObject);
    procedure btn_co_navioClick(Sender: TObject);
    procedure dbedt_cd_notificadorChange(Sender: TObject);
    procedure dbedt_cd_navioChange(Sender: TObject);
    procedure dbedt_cd_moedaExit(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure dbedt_cnpj_transpExit(Sender: TObject);
    procedure dbedt_formulaDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbedt_formulaDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbedt_formulaExit(Sender: TObject);
    procedure dbedt_nm_local_embarqueChange(Sender: TObject);
  private
    { Private declarations }
        st_modificar, st_incluir, st_excluir: Boolean;
        procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
        procedure Cancelar;
        function VerAlt   : Boolean;
        function  Grava   : Boolean;
        function Consiste : Boolean;
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    in_aerea, in_terrestre, in_maritima, in_avancado:Boolean;
    Cons_OnLine_Texto : String;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );
    { Public declarations }
  end;

var
  frm_Transportador_itl: Tfrm_Transportador_itl;
  Calcular_conhecimentos:Boolean;
implementation

uses gsmlib, PGSM106, PGSM096, PGSM148, ConsOnLineEx, uNotificador, PGSM248,
  PGSM247, PGGP017, uVeiculo;

{$R *.DFM}

procedure Tfrm_Transportador_itl.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin

  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo           := nCodigo;
  datm_consulta_padrao.Tabela.TableName := cNomeTabela;

  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine       := fCampo;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_Transportador_itl.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Transportador_itl.btn_novoClick(Sender: TObject);
begin
  if (PgCtrl.ActivePage = ts_lista) or  (PgCtrl.ActivePage = ts_dados_basicos) then
  begin
    datm_transportador_itl.qry_transp_itl_.DisableControls;
    datm_transportador_itl.qry_transp_itl_.Cancel;
    datm_transportador_itl.qry_transp_itl_.Append;
    datm_transportador_itl.qry_transp_itl_.EnableControls;
    datm_transportador_itl.qry_transp_itl_CODIGO.asString := UltCod( datm_transportador_itl.qry_ult_cod_, datm_transportador_itl.qry_ult_cod_ULTIMO );
    datm_transportador_itl.qry_transp_itl_PERC_COMISSAO_CIA_TRANSP.AsFloat := 5;
    datm_transportador_itl.qry_transp_itl_TP_COMISSAO.AsString             := '0';
    datm_transportador_itl.qry_transp_itl_IN_CALC_IR_IATA.AsString         := '0';
    datm_transportador_itl.qry_transp_itl_IN_CALC_IR_OVER.AsString         := '0';
    datm_transportador_itl.qry_transp_itl_IN_CONVERSAO_IATA.AsString       := '0';
    if in_aerea then
     begin
      datm_transportador_itl.qry_transp_itl_TP_TRANSPORTADOR.AsString := '0';
      datm_transportador_itl.qry_transp_itl_TP_TARIFA.AsString        := '0';
     end;

     if in_maritima then
      datm_transportador_itl.qry_transp_itl_TP_TRANSPORTADOR.AsString := '1';

     if in_terrestre then
      datm_transportador_itl.qry_transp_itl_TP_TRANSPORTADOR.AsString := '2';

    pgctrl.ActivePage := ts_dados_basicos;
    dbedt_nm_local_embarque.SetFocus;
 end;
  if  PgCtrl.ActivePage = ts_conhececimentos then
    begin
     habilita_campos(true);
     datm_transportador_itl.qry_serie_conhec_.DisableControls;
     datm_transportador_itl.qry_serie_conhec_.Cancel;
     datm_transportador_itl.qry_serie_conhec_.Append;
     datm_transportador_itl.qry_serie_conhec_.EnableControls;
     datm_transportador_itl.qry_serie_conhec_CODIGO.AsString:=datm_transportador_itl.qry_transp_itl_CODIGO.asString;
     datm_transportador_itl.qry_serie_conhec_DT_ABERTURA.AsdateTime :=dt_server;
     datm_transportador_itl.qry_serie_conhec_IN_INCLUSAO.AsString   := '0';
     datm_transportador_itl.qry_serie_conhec_IN_IATA.AsString       := '1';
     datm_transportador_itl.qry_serie_conhec_QTDE_CONHEC.AsInteger  := 1;
     dbradiogrp_inclusaoChange(nil);
     pgctrl.ActivePage := ts_conhececimentos;
     pgtrl_conhecimento.ActivePage := ts_dados_conhec;
     dbedt_conhec_inicial.SetFocus;
     Calcular_conhecimentos:=true;
    end;
if  (PgCtrl.ActivePage = ts_agencias) then
  begin
   if pnl_agencia.Color = $00DADCDE then
     begin
      datm_transportador_itl.qry_notificador_.DisableControls;
      datm_transportador_itl.qry_notificador_.Cancel;
      datm_transportador_itl.qry_notificador_.Append;
      datm_transportador_itl.qry_notificador_.EnableControls;
      datm_transportador_itl.qry_notificador_CD_ARMADOR.asString := datm_transportador_itl.qry_transp_itl_CODIGO.asString;
      dbedt_cd_notificador.SetFocus;
    end
    else
     begin
      if pnl_navio.Color = $00DADCDE then
         begin
          datm_transportador_itl.qry_navio_.DisableControls;
          datm_transportador_itl.qry_navio_.Cancel;
          datm_transportador_itl.qry_navio_.Append;
          datm_transportador_itl.qry_navio_.EnableControls;
          datm_transportador_itl.qry_navio_CD_ARMADOR.asString := datm_transportador_itl.qry_transp_itl_CODIGO.asString;
          dbedt_cd_navio.SetFocus;
        end
        else exit;
      end;
 end;
  btn_mi(false,st_modificar,st_modificar, false);
end;

procedure Tfrm_Transportador_itl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_transportador_itl.qry_transp_itl_.Close;
//  datm_transportador_itl.Destroy;
  datm_transportador_itl.Free;
  Action := caFree;
end;

procedure Tfrm_Transportador_itl.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
//      if Not (TTable(Cons_OnLine.DataSet).State in [dsEdit, dsInsert]) then
//         TTable(Cons_OnLine.DataSet).Edit;
      Cons_OnLine.AsString := datm_transportador_itl.qry_transp_itl_CODIGO.AsString;
      Cons_Online_Texto := datm_transportador_itl.qry_transp_itl_CODIGO.AsString;
    except
      BoxMensagem('Não consegui retornar Código do Transportador!', 2);
    end;
    Close;
  end;
end;

procedure Tfrm_Transportador_itl.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  If Key = 27 then Close;
  If Key = 13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_Transportador_itl.FormCreate(Sender: TObject);
begin
  { Inicializa o Data Module para Transportador Itl }
  Application.CreateForm( Tdatm_transportador_itl, datm_transportador_itl );
  in_aerea     := false;
  in_terrestre := false;
  in_maritima  := false;
  in_avancado  := false;
  Calcular_conhecimentos := false;
  a_str_indices[0] := 'CODIGO';
  a_str_indices[1] := 'DESCRICAO';
  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;
  AtribuiDireitos(st_incluir,st_modificar, st_excluir);
  datm_transportador_itl.ds_serie_conec.AutoEdit:=st_modificar;
  datm_transportador_itl.ds_transp_itl.AutoEdit :=st_modificar;
  btn_mi(st_incluir,false, false, st_excluir);
{  datm_transportador_itl.qry_transp_itl_.IndexFieldNames := a_str_indices[0];}{LEANDRO 28/08/98}
end;

procedure Tfrm_Transportador_itl.btn_excluirClick(Sender: TObject);
var
  Pesquisa : String;
begin
if (pgctrl.ActivePage = ts_lista ) or (pgctrl.ActivePage = ts_dados_basicos )then
 begin
   Pesquisa := datm_transportador_itl.qry_transp_itl_CODIGO.AsString;
   if BoxMensagem('Este transportador internacional será excluído! Confirma exclusão?', 1)  then
     begin
       Try
        with TQuery.Create(Application) do
        begin
        DataBaseName:='DBBROKER';
        Sql.Clear;
        Sql.Add('DELETE TCIA_SERIE WHERE CODIGO="'+datm_transportador_itl.qry_transp_itl_CODIGO.AsString+'" ');
        ExecSql;
        Close;
        Sql.Clear;
        Sql.Add('DELETE TCIA_CONHECIMENTOS WHERE CODIGO="'+datm_transportador_itl.qry_transp_itl_CODIGO.AsString+'" ');
        ExecSql;
        Close;
        Sql.Clear;
        Sql.Add('DELETE TARMADOR_NOTIFICADOR WHERE CD_ARMADOR="'+datm_transportador_itl.qry_transp_itl_CODIGO.AsString+'" ');
        ExecSql;
        Close;
        Sql.Clear;
        Sql.Add('DELETE TVEICULO_ARMADOR WHERE CD_ARMADOR="'+datm_transportador_itl.qry_transp_itl_CODIGO.AsString+'" ');
        ExecSql;
        Free;
        end;
        datm_transportador_itl.qry_transp_itl_.delete;
        with TQuery.Create(application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add(' DELETE FROM MYINDAIA.DBO.TTRANSP_ITL WHERE CD_TRANSP_ITL = ''' + Pesquisa  + ''' ');
          ExecSQL;
          Free;
        end;
        PgCtrl.ActivePage := ts_lista;
        Except
        MessageDlg('Exclusão não pode ser realizada.', mtError, [mbOk], 0)
       end;
     end;
  end
  else
    begin
     if (pgctrl.ActivePage = ts_conhececimentos ) then
      Begin
       if BoxMensagem('Este Serie e seus respectivos Conhecimentos serão excluídos! Confirma exclusão?', 1)  then
        begin
          Try
           with TQuery.Create(Application) do
            begin
            DataBaseName:='DBBROKER';
            Sql.Clear;
            Sql.Add('DELETE TCIA_CONHECIMENTOS WHERE CODIGO="'+datm_transportador_itl.qry_serie_conhec_CODIGO.AsString+'" ');
            Sql.Add('AND CD_SERIE="'+datm_transportador_itl.qry_serie_conhec_CD_SERIE.AsString+'"');
            ExecSql;

            Free;
            end;
           datm_transportador_itl.qry_serie_conhec_.delete;
           pgtrl_conhecimento.ActivePage := ts_lista_conhec;
           Except
           MessageDlg('Exclusão não pode ser realizada.', mtError, [mbOk], 0)
           end;
         end;
      end;
     end;
 if (pgctrl.ActivePage = ts_agencias ) then
   begin
     if pnl_agencia.Color = $00DADCDE then
        datm_transportador_itl.qry_notificador_.delete;

     if pnl_navio.Color = $00DADCDE then
        datm_transportador_itl.qry_navio_.delete;
   end;
end;


procedure Tfrm_Transportador_itl.btn_salvarClick(Sender: TObject);
begin
 if not Consiste then exit;
 if not  Grava  then exit;
end;

procedure Tfrm_Transportador_itl.btn_cancelarClick(Sender: TObject);
begin
CAncelar;

end;

procedure Tfrm_Transportador_itl.cb_ordemClick(Sender: TObject);
begin

  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  with datm_transportador_itl.qry_transp_itl_ do
  begin
     Close;
     SQL[7] := 'ORDER BY ' + a_str_indices[cb_ordem.ItemIndex];
     Open;
  end;
end;

procedure Tfrm_Transportador_itl.edt_chaveChange(Sender: TObject);
begin
 try
  datm_transportador_itl.qry_transp_itl_.Locate(a_str_indices[cb_ordem.ItemIndex], edt_chave.Text, [loPartialKey, loCaseInsensitive ]);
 except
   raise;
 end;
end;

procedure Tfrm_Transportador_itl.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  Shape1.Brush.Color := clpnlClaroBroker;
  Shape2.Brush.Color := clpnlClaroBroker;
  Panel8.Color       := clpnlClaroBroker;

  Panel2.Color       := clMenuBroker;
  Panel7.Color       := clMenuBroker;
  Panel6.Color       := clMenuBroker;

  datm_transportador_itl.qry_transp_itl_.Close;

  if in_aerea then
     datm_transportador_itl.qry_transp_itl_.Sql[6]:=' WHERE TP_TRANSPORTADOR = "0" ';

  if in_maritima then
     datm_transportador_itl.qry_transp_itl_.Sql[6]:=' WHERE TP_TRANSPORTADOR = "1" ';

  if in_terrestre then
     datm_transportador_itl.qry_transp_itl_.Sql[6]:=' WHERE TP_TRANSPORTADOR = "2" ';

  datm_transportador_itl.qry_transp_itl_.Prepare;
  datm_transportador_itl.qry_transp_itl_.Open;
  
  pgctrl.ActivePage := ts_lista;
  edt_chave.SetFocus;

end;

procedure Tfrm_Transportador_itl.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_Transportador_itl.btn_paisClick(Sender: TObject);
begin
  if not (datm_transportador_itl.qry_transp_itl_.State in [dsEdit, dsInsert]) then datm_transportador_itl.qry_transp_itl_.Edit;
    datm_transportador_itl.qry_transp_itl_CD_PAIS.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',NIL);
    dbedt_fabr_cd_pais.Text := datm_transportador_itl.qry_transp_itl_CD_PAIS.AsString;
    dbedt_fabr_cd_paisExit(nil);
end;

procedure Tfrm_Transportador_itl.dbedt_fabr_cd_paisKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = dbedt_fabr_cd_pais   then btn_paisClick(btn_pais);
    if Sender = dbedt_cd_notificador then btn_co_agenciaClick(btn_co_agencia);
    if Sender = dbedt_cd_navio       then btn_co_navioClick(btn_co_navio);
    if Sender = dbedt_cd_cidade      then btn_co_cd_paisClick(btn_co_cd_pais);
  end;
end;

procedure Tfrm_Transportador_itl.dbedt_fabr_cd_paisExit(Sender: TObject);
begin
  if not(datm_transportador_itl.qry_transp_itl_.State in[dsEdit,dsInsert]) then
    exit;
  if dbedt_fabr_cd_pais.text <>'' then
  begin
   ValidCodigo(dbedt_fabr_cd_pais);
   with TQuery.Create(Application) do
    begin
     DataBaseName:='DBBROKER';
     Sql.Clear;
     Sql.Add('SELECT DESCRICAO FROM TPAIS WHERE CODIGO = "'+dbedt_fabr_cd_pais.text+'"');
     Open;
     if Recordcount > 0 then
      begin
       datm_transportador_itl.qry_transp_itl_NM_PAIS.AsString:=Fields[0].AsString;
      end
     else
      begin
        BoxMensagem('Código do País inválido!',2);
        dbedt_look_nm_pais.text:='';
        dbedt_fabr_cd_pais.SetFocus;
      end;
     Free;
    end;
  end
  else dbedt_look_nm_pais.text:='';

end;

procedure Tfrm_Transportador_itl.pgctrlChange(Sender: TObject);
begin
  if pgctrl.ActivePage = ts_lista then
  begin
    edt_chave.Enabled := true;
    cb_ordem.Enabled := true;
    dbnvg.Enabled := true;
  end
  else
  begin
    edt_chave.Enabled := false;
    cb_ordem.Enabled := false;
    dbnvg.Enabled := false;
  end;

// btn_gera_favo.Enabled := (pgctrl.ActivePage = ts_dados_basicos);

  if pgctrl.ActivePage = ts_conhececimentos then
    begin
      with datm_transportador_itl do
       begin
        qry_serie_conhec_.close;
        qry_serie_conhec_.ParamByName('CODIGO').AsString:=qry_transp_itl_CODIGO.AsString;
        qry_serie_conhec_.Prepare;
        qry_serie_conhec_.Open;
       end;
   end;

    if pgctrl.ActivePage = ts_agencias then
    begin
      with datm_transportador_itl do
       begin
        qry_notificador_.close;
        qry_notificador_.ParamByName('CD_ARMADOR').AsString:=qry_transp_itl_CODIGO.AsString;
        qry_notificador_.Prepare;
        qry_notificador_.Open;

        qry_navio_.close;
        qry_navio_.ParamByName('CD_ARMADOR').AsString:=qry_transp_itl_CODIGO.AsString;
        qry_navio_.Prepare;
        qry_navio_.Open;
       end;
   end;


  if pgctrl.ActivePage = ts_calculos then
    begin
        datm_transportador_itl.qry_var_iata_.close;
        datm_transportador_itl.qry_var_iata_.Prepare;
        datm_transportador_itl.qry_var_iata_.Open;

   end;





end;

procedure Tfrm_Transportador_itl.btn_co_cd_paisClick(Sender: TObject);
begin
 if not (datm_transportador_itl.qry_transp_itl_.State in [dsEdit, dsInsert]) then datm_transportador_itl.qry_transp_itl_.Edit;

     datm_transportador_itl.qry_transp_itl_CD_CIDADE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',NIL);
     dbedt_cd_cidade.Text := datm_transportador_itl.qry_transp_itl_CD_CIDADE.AsString;
     dbedt_cd_cidadeExit(nil);
end;

procedure Tfrm_Transportador_itl.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_novo.Enabled     := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_Transportador_itl.dbedt_cd_cidadeExit(Sender: TObject);
begin
if not(datm_transportador_itl.qry_transp_itl_.State in[dsEdit,dsInsert]) then exit;
 if dbedt_cd_cidade.text <>'' then
  begin
   ValidCodigo(dbedt_cd_cidade);
   with TQuery.Create(Application) do
    begin
     DataBaseName:='DBBROKER';
     Sql.Clear;
     Sql.Add('SELECT DESCRICAO FROM TLOCAL_EMBARQUE WHERE CODIGO = "'+dbedt_cd_cidade.text+'"');
     Open;
     if Recordcount > 0 then
      begin
       datm_transportador_itl.qry_transp_itl_NM_CIDADE.AsString:=Fields[0].AsString;
      end
     else
      begin
        BoxMensagem('Código da Cidade inválido!',2);
        dbedt_look_nm_cidade.text:='';
        dbedt_cd_cidade.SetFocus;
      end;
     Free;
    end;
  end
  else dbedt_look_nm_cidade.text:='';


end;

procedure Tfrm_Transportador_itl.dbradiogrp_inclusaoChange(Sender: TObject);
begin
  if dbradiogrp_inclusao.ItemIndex = 0 then
    begin
     dbedt_conhec_final.readOnly:=true;
     dbedt_conhec_final.Color:=clMenu;
     dbedt_qtde.readOnly:=false;
     dbedt_qtde.Color:=clWindow;
    end
   else
     begin
     dbedt_conhec_final.readOnly:=false;
     dbedt_conhec_final.Color:=clWindow;
     dbedt_qtde.readOnly:=true;
     dbedt_qtde.Color:=clMenu;
     end;
end;

procedure Tfrm_Transportador_itl.calc_conhec;
  var i:integer;
    st_conhecimento:string;
begin
  st_conhecimento:=Trim(datm_Transportador_itl.qry_serie_conhec_CONHEC_INICIAL.AsString);
  for i:=1 to datm_Transportador_itl.qry_serie_conhec_QTDE_CONHEC.AsInteger do
    begin
      if rxcbx_iata.ItemIndex = 0 then
        begin


        end;

      if rxcbx_iata.ItemIndex = 1 then
        begin
         st_conhecimento :=st_conhecimento + digitto_iata(st_conhecimento);
       //BoxMensagem('o conhecimento com o digito é'+st_conhecimento,2);
         with TQuery.Create(Application) do
           begin
            DatabaseName:='DBBROKER';
            Sql.Clear;
            Sql.Add('INSERT INTO TCIA_CONHECIMENTOS (CODIGO,CD_SERIE,NR_CONHECIMENTO, CD_REGISTRO, IN_DISPONIVEL)');
            Sql.Add('VALUES (:CODIGO,:CD_SERIE,:NR_CONHECIMENTO, :CD_REGISTRO, :IN_DISPONIVEL) ');
            params[0].AsString :=datm_Transportador_itl.qry_serie_conhec_CODIGO.AsString;
            params[1].AsString :=datm_Transportador_itl.qry_serie_conhec_CD_SERIE.AsString;
            params[2].AsString :=st_conhecimento;
            params[3].AsInteger:= i;
            params[4].AsString := '1';
            ExecSql;
            Free;
           end;
          st_conhecimento:=proximo_conhecimento(st_conhecimento,3);
        end;


    end;

end;

procedure Tfrm_Transportador_itl.dbedt_conhec_inicialExit(Sender: TObject);
var st_conhec_inicial,st_conhec_final:string;
    fl_campo1, fl_campo2:integer;

begin
 if not(datm_Transportador_itl.qry_serie_conhec_.State in [dsEdit, dsInsert])or
 (datm_Transportador_itl.qry_serie_conhec_CONHEC_INICIAL.IsNull) then exit;

 if dbradiogrp_inclusao.ItemIndex = 0 then
  begin
   dbedt_qtdeExit(nil);
  end;

 if dbradiogrp_inclusao.ItemIndex = 1 then
  begin

   if(datm_Transportador_itl.qry_serie_conhec_CONHEC_FINAL.IsNull) then exit;

   st_conhec_inicial:=trim(dbedt_conhec_inicial.text);
   datm_Transportador_itl.qry_serie_conhec_DIG_INICIAL.AsString := digitto_iata(st_conhec_inicial);
   st_conhec_final  :=trim(dbedt_conhec_final.text);
   fl_campo1:=strtoint(copy(st_conhec_final,5,4)) - strtoint(copy(st_conhec_inicial,5,4));
   datm_Transportador_itl.qry_serie_conhec_DIG_FINAL.AsString := digitto_iata(st_conhec_final);
   if rxcbx_iata.ItemIndex = 0 then
   fl_campo2:=strtoint(copy(st_conhec_final,10,4)) - strtoint(copy(st_conhec_inicial,10,4))
   else fl_campo2:=strtoint(copy(st_conhec_final,10,3)) - strtoint(copy(st_conhec_inicial,10,3));

   datm_Transportador_itl.qry_serie_conhec_QTDE_CONHEC.AsInteger:=  (fl_campo1 * 1000) + fl_campo2;
 end;
end;

procedure Tfrm_Transportador_itl.dbedt_qtdeExit(Sender: TObject);
var fl_campo1,fl_campo2,resto:integer;
    st_conhec_inicial,st_conhec_final:string;
    divisao:string;
begin
  if not(datm_Transportador_itl.qry_serie_conhec_.State in [dsEdit, dsInsert]) then exit;
  if (dbedt_qtde.text = '') or(dbedt_qtde.text = '00') then
    begin
     BoxMensagem('Deve ser inserido uma quantidade',2);
     dbedt_qtde.SetFocus;
     Exit;
    end;
   st_conhec_inicial:=trim(dbedt_conhec_inicial.text);
   
   if st_conhec_inicial = '' then exit;

  if rxcbx_iata.ItemIndex = 0 then
   begin
      fl_campo2:=strtoint(copy(st_conhec_inicial,10,4));
      if (fl_campo2 + datm_Transportador_itl.qry_serie_conhec_QTDE_CONHEC.AsInteger - 1) > 9999 then
        begin
           resto:=(fl_campo2 + datm_Transportador_itl.qry_serie_conhec_QTDE_CONHEC.AsInteger -1 )-9999;
           divisao:= formatfloat('0',strtofloat(inttostr(fl_campo2 + datm_Transportador_itl.qry_serie_conhec_QTDE_CONHEC.AsInteger -1))/10000);
           st_conhec_final  := formatfloat('0000',strtofloat(copy(st_conhec_inicial,5,4))+ strtofloat(divisao));
           datm_Transportador_itl.qry_serie_conhec_CONHEC_FINAL.AsString:=copy(st_conhec_inicial,1,4)+
                                                            st_conhec_final+'-'+formatfloat('0000',strtofloat(inttostr(resto)));
        end
        else
          begin
            st_conhec_final := copy(st_conhec_inicial,1,9) + formatfloat('0000',strtofloat(inttostr(fl_campo2 + datm_Transportador_itl.qry_serie_conhec_QTDE_CONHEC.AsInteger -1)));
            datm_Transportador_itl.qry_serie_conhec_CONHEC_FINAL.AsString:=st_conhec_final;
          end;
          exit;
    end
   else
    begin
     fl_campo2:=strtoint(copy(st_conhec_inicial,10,3));
      if (fl_campo2 + datm_Transportador_itl.qry_serie_conhec_QTDE_CONHEC.AsInteger - 1) > 999 then
        begin
           resto:=(fl_campo2 + datm_Transportador_itl.qry_serie_conhec_QTDE_CONHEC.AsInteger - 1)-999;
           divisao:= formatfloat('0',strtofloat(inttostr(fl_campo2 + datm_Transportador_itl.qry_serie_conhec_QTDE_CONHEC.AsInteger - 1))/1000);
           st_conhec_final  := formatfloat('0000',strtofloat(copy(st_conhec_inicial,5,4))+ strtofloat(divisao));
            datm_Transportador_itl.qry_serie_conhec_CONHEC_FINAL.AsString:=copy(st_conhec_inicial,1,4)+
                                                            st_conhec_final+'-'+formatfloat('0000',strtofloat(inttostr(resto)));
        end
      else
        begin
            st_conhec_final := copy(st_conhec_inicial,1,9) + formatfloat('000',strtofloat(inttostr(fl_campo2 + datm_Transportador_itl.qry_serie_conhec_QTDE_CONHEC.AsInteger - 1)));
            datm_Transportador_itl.qry_serie_conhec_CONHEC_FINAL.AsString:=st_conhec_final;
          end;
      end;

      datm_Transportador_itl.qry_serie_conhec_DIG_INICIAL.AsString := digitto_iata(st_conhec_inicial);
      datm_Transportador_itl.qry_serie_conhec_DIG_FINAL.AsString := digitto_iata(st_conhec_final);







end;

procedure Tfrm_Transportador_itl.rxcbx_iataChange(Sender: TObject);
begin
if (datm_Transportador_itl.qry_serie_conhec_.State in [dsEdit, dsInsert]) then
   btn_mi(false,st_modificar,st_modificar,false);
end;

function Tfrm_Transportador_itl.digitto_iata(
  var Conhecimento: string): String;
var digitos:string;
    numero:real;
    i:integer;
begin
   numero:=strtofloat(copy(conhecimento,5,4) + copy(conhecimento,10,3));
   digitos:=formatfloat('0.00000000000000000000',(numero / 7 ));
   i:=0;

   while digitos[i] <> ',' do   i:=i+1;

   digitos:='0,' + copy(digitos, i + 1 ,20);
   digitto_iata:=floatToStr(Round(strtofloat(digitos) * 7));

end;

function Tfrm_Transportador_itl.proximo_conhecimento(
  var conhecimento: String;casas:integer): String;
 var digito:string;
     numero:real;
begin
   digito:= copy(conhecimento,10,casas);
   numero:=strtofloat(digito) + 1;

    if (numero > 9999) and (casas = 4) then
      begin
        proximo_conhecimento:= copy(conhecimento,1,4)+  formatfloat('0000',(strtofloat(copy(conhecimento,5,4))+1)) + '-0000';
        exit;
      end;

    if (numero > 999) and (casas = 3) then
      begin
        proximo_conhecimento:= copy(conhecimento,1,4)+ formatfloat('0000',(strtofloat(copy(conhecimento,5,4))+1)) +'-000';
        exit;
      end;

  if casas = 4 then
    proximo_conhecimento:= copy(conhecimento,1,9) + formatfloat('0000',numero)
  else proximo_conhecimento:= copy(conhecimento,1,9) + formatfloat('000',numero)


end;

procedure Tfrm_Transportador_itl.habilita_campos(Hab: Boolean);
begin
  dbradiogrp_inclusao.Readonly := not Hab;
  rxcbx_iata.Readonly          := not Hab;
  dbedt_dt_abertura.Readonly   := not Hab;
  dbedt_conhec_inicial.Readonly:= not Hab;
  dbedt_conhec_final.Readonly  := not Hab;
  dbedt_qtde.Readonly          := not Hab;

 if hab then
  begin
  rxcbx_iata.Color:=clWindow;
  dbedt_dt_abertura.Color:=clWindow;
  dbedt_conhec_inicial.Color:=clWindow;
  dbedt_conhec_final.Color:=clWindow;
  dbedt_qtde.Color:=clWindow;
  end
  else
    begin
      rxcbx_iata.Color:=clMenu;
      dbedt_dt_abertura.Color:=clMenu;
      dbedt_conhec_inicial.Color:=clMenu;
      dbedt_conhec_final.Color:=clMenu;
      dbedt_qtde.Color:=clMenu;
   end;
end;

procedure Tfrm_Transportador_itl.Cancelar;
begin

 if (pgctrl.ActivePage = ts_dados_basicos)or (pgctrl.ActivePage = ts_calculos) then
   begin
    try
      datm_transportador_itl.qry_transp_itl_.Cancel;
      btn_mi(st_incluir,false,false,st_excluir);

    except
     raise;
   end;
  end;

 if pgctrl.ActivePage = ts_conhececimentos then
   begin
    try
      datm_transportador_itl.qry_serie_conhec_.Cancel;
      btn_mi(st_incluir,false,false,st_excluir);
      habilita_campos(False);
    except
     raise;
   end;
  end;

   if pgctrl.ActivePage = ts_agencias then
   begin
    try
     if datm_transportador_itl.qry_notificador_.State in [dsEdit,dsInsert] then
        datm_transportador_itl.qry_notificador_.Cancel;

     if datm_transportador_itl.qry_navio_.State in [dsEdit,dsInsert] then
        datm_transportador_itl.qry_navio_.Cancel;

      btn_mi(st_incluir,false,false,st_excluir);
      habilita_campos(False);
    except
     raise;
   end;
  end;

end;



function Tfrm_Transportador_itl.Consiste: Boolean;
begin
 Consiste:=true;
if pgctrl.ActivePage = ts_dados_basicos then
 begin
   if dbedt_nm_local_embarque.text ='' then
     begin
      BoxMensagem('Deve ser preenchido o campo Descrição!',2);
      dbedt_nm_local_embarque.SetFocus;
      consiste:=false;
      exit;
     end;
   if dbgoup_tp_transp.ItemIndex = -1 then
     begin
      BoxMensagem('Deve ser marcado um tipo para a transportadora!',2);
      consiste:=false;
      exit;
     end;
 end;
 if (pgctrl.ActivePage = ts_conhececimentos) and (pgtrl_conhecimento.ActivePage = ts_dados_conhec)then
   begin
    if dbedt_conhec_inicial.text = '' then
      begin
      BoxMensagem('Deve ser inserido o Conhecimento Inicial!',2);
      consiste:=false;
      dbedt_conhec_inicial.SetFocus;
      exit;
      end;

   end;

 if (pgctrl.ActivePage = ts_agencias)then
   begin
    if dbedt_cd_notificador.text = '' then
      begin
      BoxMensagem('Deve ser preenchido a Agência!',2);
      consiste:=false;
      dbedt_cd_notificador.SetFocus;
      exit;
      end;

   end;



end;

function Tfrm_Transportador_itl.VerAlt: Boolean;
begin
 VerAlt := True;
  if ( ( datm_transportador_itl.qry_transp_itl_.State in [dsEdit] ) and st_modificar ) or
     ( datm_transportador_itl.qry_transp_itl_.State in [dsInsert] ) then
    begin
    if BoxMensagem('O Cadastro do Tranportador foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      if Not Consiste then
      begin
        VerAlt := false;
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

   if ( ( datm_transportador_itl.qry_serie_conhec_.State in [dsEdit] ) and st_modificar ) or
     ( datm_transportador_itl.qry_serie_conhec_.State in [dsInsert] ) then
    begin
    if BoxMensagem('Os Conhecimento Não foram Salvos.' + #13#10 +
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

function Tfrm_Transportador_itl.Grava: Boolean;
var Pesquisa:string;
begin
Grava:=true;
if (pgctrl.ActivePage = ts_dados_basicos)or (pgctrl.ActivePage = ts_calculos) then
 begin
    Try
      If ( datm_transportador_itl.qry_transp_itl_.State in [dsInsert, dsEdit] ) then
      begin
        Pesquisa := datm_transportador_itl.qry_transp_itl_CODIGO.AsString;
        datm_transportador_itl.qry_transp_itl_.Post;
        with TQuery.Create(application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add(' DELETE FROM MYINDAIA.DBO.TTRANSP_ITL WHERE CD_TRANSP_ITL = ''' + Pesquisa  + ''' ');
          ExecSQL;
          SQL.Clear;
          SQL.Add('INSERT INTO MYINDAIA.DBO.TTRANSP_ITL ( CD_TRANSP_ITL, NM_TRANSP_ITL, AP_TRANSP_ITL ) ');
          SQL.Add('SELECT CODIGO, DESCRICAO, APELIDO                                                          ');
          SQL.Add('FROM TTRANSPORTADOR_ITL ( NOLOCK ) WHERE CODIGO = ''' + Pesquisa + ''' ');
          ExecSQL;
          Free;
        end;

        btn_mi(st_incluir,false,false,st_excluir);
      end
      Except
       MessageDlg('Erro - operação de atualização. Tente gravar novamente.',mtError, [mbOk], 0);
       Grava:=false;

    End;
  end;
 if pgctrl.ActivePage = ts_conhececimentos then
   begin
     if not(BoxMensagem('Os Dados a serem salvos não poderão ser modificados. Deseja salvar os Dados?',1))then exit;
      Try
      If ( datm_transportador_itl.qry_serie_conhec_.State in [dsInsert, dsEdit] ) then
      begin
        datm_transportador_itl.qry_serie_conhec_CONHEC_DISP.AsInteger:=datm_transportador_itl.qry_serie_conhec_QTDE_CONHEC.AsInteger;
        datm_transportador_itl.qry_serie_conhec_.Post;
        if Calcular_conhecimentos then
           calc_conhec;
        habilita_campos(False);
        btn_mi(st_incluir,false,false,st_excluir);
      end
      Except
       MessageDlg('Erro - operação de atualização. Tente gravar novamente.',mtError, [mbOk], 0);
       Grava:=false;
    End;
   end;

 if pgctrl.ActivePage = ts_agencias then
   begin
    try
  //  datm_main.db_broker.StartTransaction;
    If ( datm_transportador_itl.qry_notificador_.State in [dsInsert, dsEdit] ) then
    begin
      datm_transportador_itl.qry_notificador_.FieldByName('CD_ARMADOR').AsString := datm_transportador_itl.qry_transp_itl_CODIGO.AsString;
      datm_transportador_itl.qry_notificador_.Post;
      Pesquisa := datm_transportador_itl.qry_notificador_CD_NOTIFICADOR.AsString;
        datm_transportador_itl.qry_notificador_.close;
        datm_transportador_itl.qry_notificador_.ParamByName('CD_ARMADOR').AsString := datm_transportador_itl.qry_transp_itl_CODIGO.AsString;
        datm_transportador_itl.qry_notificador_.Prepare;
        datm_transportador_itl.qry_notificador_.Open;
        datm_transportador_itl.qry_notificador_.Locate('CD_NOTIFICADOR',Pesquisa,[loCaseInsensitive, loPartialKey]);
    end;

    If ( datm_transportador_itl.qry_navio_.State in [dsInsert, dsEdit] ) then
    begin
      datm_transportador_itl.qry_navio_.FieldByName('CD_ARMADOR').AsString := datm_transportador_itl.qry_transp_itl_CODIGO.AsString;
      datm_transportador_itl.qry_navio_.Post;
      Pesquisa := datm_transportador_itl.qry_navio_CD_VEICULO.AsString;

      datm_transportador_itl.qry_navio_.close;
      datm_transportador_itl.qry_navio_.ParamByName('CD_ARMADOR').AsString := datm_transportador_itl.qry_transp_itl_CODIGO.AsString;
      datm_transportador_itl.qry_navio_.Prepare;
      datm_transportador_itl.qry_navio_.Open;
      datm_transportador_itl.qry_navio_.Locate('CD_VEICULO',Pesquisa,[loCaseInsensitive, loPartialKey]);
    end;

   Grava := True;
  except
    on E: Exception do
    begin
  //    if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
   //   datm_unid_medida.qry_unid_medida_.Cancel;
      Grava := False;
      TrataErro(E);
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );

   end;


end;

procedure Tfrm_Transportador_itl.pgctrlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 AllowChange:=Veralt;
end;

procedure Tfrm_Transportador_itl.dbgoup_tp_transpChange(Sender: TObject);
begin
If not( datm_transportador_itl.qry_transp_itl_.State in [dsInsert, dsEdit] ) then exit;
  if (dbgoup_tp_transp.ItemIndex = 1) or (dbgoup_tp_transp.ItemIndex = 2)then
    begin
     with TQuery.Create(Application) do
       begin
       DatabaseName:='DBBROKER';
       Sql.Clear;
       Sql.Add('SELECT CD_SERIE FROM TCIA_SERIE WHERE CODIGO = "'+datm_transportador_itl.qry_transp_itl_CODIGO.AsString+'"');
       Open;
       if recordCount > 0 then
         begin
         boxMensagem('Existe Series e Conhecimentos para essa Transportadora. Não pode modificar essa Claasificação! ',2);
         datm_transportador_itl.qry_transp_itl_TP_TRANSPORTADOR.AsString:='0';
         ts_conhececimentos.TabVisible:=in_avancado;
         ts_calculos.TabVisible:=in_avancado;
         btn_mi(false,st_modificar,st_modificar, false);
         exit;
         end;
        ts_conhececimentos.TabVisible:=false;
        ts_calculos.TabVisible:=false;
        if (dbgoup_tp_transp.ItemIndex = 1)then
           begin
           pnl_demurrage.Visible:=in_avancado;
           ts_agencias.TabVisible:=in_avancado;
           end;
       Free;
       end;

      dbedt_sigla.visible:=false;
      dbedt_cd_iata.visible:=false;
      lb_sigla_iata.visible:=false;
      lb_sigla.visible:=false;

    end;

  if (dbgoup_tp_transp.ItemIndex = 0) or (dbgoup_tp_transp.ItemIndex = 2)then
    begin
     with TQuery.Create(Application) do
       begin
       DatabaseName:='DBBROKER';
       Sql.Clear;
       Sql.Add('SELECT CD_NOTIFICADOR FROM TARMADOR_NOTIFICADOR WHERE CD_ARMADOR = "'+datm_transportador_itl.qry_transp_itl_CODIGO.AsString+'"');
       Open;
       if recordCount > 0 then
         begin
         boxMensagem('Existem Agências/ Notificadores para este Armador!',2);
         datm_transportador_itl.qry_transp_itl_TP_TRANSPORTADOR.AsString:='1';
         ts_agencias.TabVisible:=in_avancado;
         btn_mi(false,st_modificar,st_modificar, false);
         exit;
         end;


        if (dbgoup_tp_transp.ItemIndex = 0)then
           begin
            ts_conhececimentos.TabVisible:=in_avancado;
            ts_calculos.TabVisible:=in_avancado;
            dbedt_sigla.visible:=in_avancado;
            dbedt_cd_iata.visible:=in_avancado;
            lb_sigla_iata.visible:=in_avancado;
            lb_sigla.visible:=in_avancado;
           end
          else
            begin
            dbedt_sigla.visible:=false;
            dbedt_cd_iata.visible:=false;
            lb_sigla_iata.visible:=false;
            lb_sigla.visible:=false;

            end;
        ts_agencias.TabVisible:=false;
        pnl_demurrage.Visible:=false;
       Free;
       end;
    end;


 btn_mi(false,st_modificar,st_modificar, false);
end;

procedure Tfrm_Transportador_itl.dbedt_cd_notificadorExit(Sender: TObject);
begin
 with datm_Transportador_itl do
  begin
   if not(qry_notificador_.State in [dsEdit,dsInsert]) then exit;
   if dbedt_cd_notificador.Text <> '' then
     begin
       ValidCodigo( dbedt_cd_notificador );
       with TQuery.Create(Application) do //verifica se já existe algum relacionamento
         begin
           dataBaseName:='DBBROKER';
           Sql.Clear;
           Sql.Add('SELECT COUNT(*) FROM TARMADOR_NOTIFICADOR WHERE CD_ARMADOR = "'+qry_transp_itl_CODIGO.AsString+'"');
           Sql.Add(' AND CD_NOTIFICADOR="'+dbedt_cd_notificador.text+'"');
           Open;
            if Fields[0].AsInteger > 0 then
              begin
               BoxMensagem('Este Notificador já está relacionado!',2);
               dbedt_cd_notificador.SetFocus;
               Exit;
              end;

         end;
       qry_pesquisa_.Active:=false;
       qry_pesquisa_.Sql.Clear;
       qry_pesquisa_.Sql.Add('SELECT TN.NM_NOTIFICADOR, TN.CD_CIDADE, (SELECT TC.DESCRICAO FROM TLOCAL_EMBARQUE TC WHERE TC.CODIGO = TN.CD_CIDADE)NM_CIDADE, ');
       qry_pesquisa_.Sql.Add(' TN.NM_CONTATO, TN.END_FONE FROM TNOTIFICADOR TN ');
       qry_pesquisa_.Sql.Add(' WHERE TN.CD_NOTIFICADOR = "'+dbedt_cd_notificador.Text+'"');
       qry_pesquisa_.Active:=true;

       if qry_pesquisa_.RecordCount > 0 then
         begin
            qry_notificador_NM_NOTIFICADOR.AsString := qry_pesquisa_.fields[0].AsString;
            qry_notificador_CD_CIDADE.AsString := qry_pesquisa_.fields[1].AsString;
            qry_notificador_NM_CIDADE.AsString := qry_pesquisa_.fields[2].AsString;
            qry_notificador_END_FONE.AsString := qry_pesquisa_.fields[4].AsString;
            qry_notificador_NM_CONTATO.AsString := qry_pesquisa_.fields[3].AsString;
            qry_pesquisa_.Close;
         end
       else
         begin
           qry_pesquisa_.Close;
           dbedt_nm_notificador.Text := '';
           BoxMensagem('Código da Cidade inválido!', 2);
           dbedt_cd_notificador .SetFocus;
           Exit;
        end;

      end
    else dbedt_nm_notificador.Text := '';
 end;

end;

procedure Tfrm_Transportador_itl.btn_co_agenciaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2279';

  Application.CreateForm(Tfrm_notificador, frm_notificador);

  with frm_notificador do
  begin
    lCons_OnLine := True;
    ts_armadores.TabVisible:=false;
    Caption := ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_notificador.Cons_OnLine_Texto <> '') then
  begin
    if not (datm_Transportador_itl.qry_notificador_.State in [dsEdit, dsInsert]) and (st_modificar) then
      datm_Transportador_itl.qry_notificador_.Edit;
    datm_Transportador_itl.qry_notificador_CD_NOTIFICADOR.AsString := frm_notificador.Cons_OnLine_Texto;
    dbedt_cd_notificador.SetFocus;
    dbedt_cd_notificadorExit(Sender);
  end;
end;

procedure Tfrm_Transportador_itl.pnl_agenciaEnter(Sender: TObject);
begin
  if not(datm_Transportador_itl.qry_navio_.State in [dsEdit,dsInsert])then
  begin
    pnl_agencia.Color := clPnlClaroBroker;
    datm_Transportador_itl.ds_notificador.AutoEdit:=st_modificar;
  end;
end;

procedure Tfrm_Transportador_itl.pnl_agenciaExit(Sender: TObject);
begin
  if not(datm_Transportador_itl.qry_notificador_.State in [dsEdit,dsInsert])then
  begin
    pnl_agencia.Color := clMenu;
    datm_Transportador_itl.ds_notificador.AutoEdit:=false;
  end;
end;

procedure Tfrm_Transportador_itl.pnl_navioEnter(Sender: TObject);
begin
  if not(datm_Transportador_itl.qry_notificador_.State in [dsEdit,dsInsert])then
  begin
    pnl_navio.Color := clPnlClaroBroker;
    datm_Transportador_itl.ds_navio.AutoEdit:=st_modificar;
  end;
end;

procedure Tfrm_Transportador_itl.pnl_navioExit(Sender: TObject);
begin
  if not(datm_Transportador_itl.qry_navio_.State in [dsEdit,dsInsert])then
  begin
    pnl_navio.Color := clMenu;
    datm_Transportador_itl.ds_navio.AutoEdit:=false;
  end;
end;

procedure Tfrm_Transportador_itl.dbedt_cd_navioExit(Sender: TObject);
begin
  with datm_Transportador_itl do
  begin
    if not(qry_navio_.State in [dsEdit,dsInsert]) then exit;
    if dbedt_cd_navio.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_navio );
      with TQuery.Create(Application) do //verifica se já existe algum relacionamento
      begin
        dataBaseName:='DBBROKER';
        Sql.Clear;
        Sql.Add('SELECT COUNT(*) FROM TVEICULO_ARMADOR WHERE CD_ARMADOR = "'+qry_transp_itl_CODIGO.AsString+'"');
        Sql.Add(' AND CD_VEICULO="'+dbedt_cd_navio.text+'"');
        Open;
        if Fields[0].AsInteger > 0 then
        begin
          BoxMensagem('Este Navio já está relacionado!',2);
          dbedt_cd_navio.SetFocus;
          Exit;
        end;
      end;
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_EMBARCACAO FROM TEMBARCACAO ');
      qry_pesquisa_.Sql.Add(' WHERE CD_EMBARCACAO = "'+dbedt_cd_navio.Text+'"');
      qry_pesquisa_.Active:=true;

      if qry_pesquisa_.RecordCount > 0 then
      begin
        qry_navio_NM_EMBARCACAO.AsString := qry_pesquisa_.fields[0].AsString;
        qry_pesquisa_.Close;
      end else begin
        qry_pesquisa_.Close;
        dbedt_nm_navio.Text := '';
        BoxMensagem('Código do Navio inválido!', 2);
        dbedt_cd_navio .SetFocus;
        Exit;
      end;
    end else
      dbedt_nm_navio.Text := '';
  end;
end;

procedure Tfrm_Transportador_itl.btn_co_navioClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2269';

  Application.CreateForm(Tfrm_veiculo, frm_veiculo);

  with frm_veiculo do
  begin
    lCons_OnLine := True;
    Caption := ' [Consulta On-Line]';
    ts_armador.TabVisible:=false;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_veiculo.Cons_OnLine_Texto <> '') then
  begin
    if not (datm_Transportador_itl.qry_navio_.State in [dsEdit, dsInsert]) and (st_modificar) then
      datm_Transportador_itl.qry_navio_.Edit;
    datm_Transportador_itl.qry_navio_CD_VEICULO.AsString := frm_veiculo.Cons_OnLine_Texto;
    dbedt_cd_navio.SetFocus;
    dbedt_cd_navioExit(Sender);
  end;
end;

procedure Tfrm_Transportador_itl.dbedt_cd_notificadorChange(
  Sender: TObject);
begin
  if (datm_Transportador_itl.qry_notificador_.State in [dsEdit,dsInsert]) then
    btn_mi(false,st_modificar,st_modificar,false);
end;

procedure Tfrm_Transportador_itl.dbedt_cd_navioChange(Sender: TObject);
begin
  if (datm_Transportador_itl.qry_navio_.State in [dsEdit,dsInsert]) then
    btn_mi(false,st_modificar,st_modificar,false);
end;

procedure Tfrm_Transportador_itl.dbedt_cd_moedaExit(Sender: TObject);
begin
  if not(datm_transportador_itl.qry_transp_itl_.State in[dsEdit,dsInsert]) then exit;

  if dbedt_cd_moeda.text <>'' then
  begin
    ValidCodigo(dbedt_cd_moeda);
    with TQuery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+dbedt_cd_moeda.text+'"');
      Open;
      if Recordcount > 0 then
      begin
        datm_transportador_itl.qry_transp_itl_NM_MOEDA.AsString:=Fields[0].AsString;
      end else begin
        BoxMensagem('Código da Moeda inválido!',2);
        dbedt_nm_moeda.text:='';
      end;
      Free;
    end;
  end
  else dbedt_nm_moeda.text:='';
end;

procedure Tfrm_Transportador_itl.btn_co_moedaClick(Sender: TObject);
begin
if not (datm_transportador_itl.qry_transp_itl_.State in [dsEdit, dsInsert]) then
                  datm_transportador_itl.qry_transp_itl_.Edit;

     datm_transportador_itl.qry_transp_itl_CD_MOEDA_DEMURRAGE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',nil);
   //  dbedt_cd_cidade.Text := datm_transportador_itl.qry_transp_itl_CD_CIDADE.AsString;
     dbedt_cd_moedaExit(nil);
end;

procedure Tfrm_Transportador_itl.dbedt_cnpj_transpExit(Sender: TObject);
begin
if not(datm_Transportador_itl.qry_transp_itl_.State in [dsEdit,dsInsert]) then exit;

if Not CNPJ(dbedt_cnpj_transp.Text) then
   begin
    dbedt_cnpj_transp.SetFocus;
    Exit;
   end;

  if Trim( dbedt_cnpj_transp.Text ) <> '' then
  begin
   with TQuery.Create(Application) do
    begin
      DataBaseName:= 'DBBROKER';
      Sql.Add('SELECT CODIGO FROM TTRANSPORTADOR_ITL WHERE CGC_TRANSPORTADOR = "'+dbedt_cnpj_transp.text+'"');
      Open;
      if Fields[0].AsString <> ''  then
      begin
        BoxMensagem( 'C.N.P.J. já cadastrado para '#13'Transportador '+
                     Fields[0].AsString, 2 );
        dbedt_cnpj_transp.SetFocus;
        //Consiste := False;
        Exit;
      end;
     Free;
    end;
   end;
end;

procedure Tfrm_Transportador_itl.dbedt_formulaDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TDBText) or (Source is TLabel);
end;

procedure Tfrm_Transportador_itl.dbedt_formulaDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  if not ( datm_transportador_itl.qry_transp_itl_.State in [dsEdit, dsInsert] ) then
    datm_transportador_itl.qry_transp_itl_.Edit;
  if (Sender is TDBEdit) and (Source is TDBText) then
    with Sender as TDBEdit do
      Text := Text + (Source as TDBText).Caption;
  if (Sender is TDBEdit) and (Source is TLabel) then
    with Sender as TDBEdit do
      Text := Text + Copy((Source as TLabel).Caption,2,1);
  dbedt_formulaExit(nil);
end;

procedure Tfrm_Transportador_itl.dbedt_formulaExit(Sender: TObject);
var
  formula      : string;
  i, j         : integer;
  Erro, Fechou : Boolean;
  abertos      : integer;
  variavel     : array[1..10] of string;
begin
  for i := 1 to datm_Transportador_itl.qry_var_iata_.Recordcount - 1 do
    variavel[i] := 'A' + inttostr(i);
  abertos := 0;
  formula := dbedt_formula.text;
  Erro    := false;
  for i:=1 to length(formula) do
  begin
    if formula[i] = '(' then
    begin
      abertos := abertos + 1 ;
      if (formula[i + 1] = '+') or (formula[i + 1] = '-') or (formula[i + 1] = '/') or (formula[i + 1] = '*') then
        Erro := true;
    end;
    if formula[i] = ')' then
    begin
      abertos := abertos - 1 ;
      if (formula[i + 1] <> '+') and (formula[i + 1] <> '-') and (formula[i + 1] <> '/') and (formula[i + 1] <> '*') and
         (formula[i + 1] <> ')') and (i + 1  <  length(formula)) then
        Erro := true;
    end;
    if formula[i] = 'A' then
    begin
      if (formula[i+1]='1') or (formula[i+1]='2') or (formula[i+1]='3') or (formula[i+1]='4') or (formula[i+1]='5') or
         (formula[i+1]='6') or (formula[i+1]='7') or (formula[i+1]='8') or (formula[i+1]='9') then
        Erro := false
      else Erro := true;
    end;
    if (formula[i]='1') or (formula[i]='2') or (formula[i]='3') or (formula[i]='4') or (formula[i]='5') or
       (formula[i]='6') or (formula[i]='7') or (formula[i]='8') or (formula[i]='9') then
    begin
      if (formula[i - 1]= 'A') and ((formula[i+1]='1') or (formula[i+1]='2') or (formula[i+1]='3') or (formula[i+1]='4') or
      (formula[i+1]='5') or (formula[i+1]='6') or (formula[i+1]='7') or (formula[i+1]='8') or (formula[i+1]='9')) then
         Erro := true;
    end;
    if (formula[i]= '+') or (formula[i]= '-') or (formula[i]= '*') or (formula[i]= '/') then
    begin
      if (formula[i+1]= ')') or (formula[i+1]= '+') or (formula[i+1]= '-') or (formula[i+1]= '*') or (formula[i+1]= '/') then
        erro := true;
    end;
  if erro then
    Break;
  end;

  lblStatus.Caption := 'Formula correta';
  lblStatus.Font.Color := clTeal;

  if (Erro) then begin
    lblStatus.Caption := 'Sintaxe da formula esta errada!';
    lblStatus.Font.Color := clRed;
    dbedt_formula.SetFocus;
  end;

  if (abertos <> 0) then begin
    lblStatus.Caption := 'Erro com os parenteses. Sintaxe errada!';
    lblStatus.Font.Color := clRed;
    dbedt_formula.SetFocus;
  End;
end;

procedure Tfrm_Transportador_itl.dbedt_nm_local_embarqueChange(
  Sender: TObject);
begin
  If ( datm_transportador_itl.qry_transp_itl_.State in [ dsInsert, dsEdit ] ) then
    btn_mi(false,st_modificar,st_modificar, false);
end;

end.

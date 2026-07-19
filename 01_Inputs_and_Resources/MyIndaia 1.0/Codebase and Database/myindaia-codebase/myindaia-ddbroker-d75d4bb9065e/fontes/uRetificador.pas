unit uRetificador;

interface

uses
  Windows, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids, Mask, DBCtrls, RxDBComb, Menus, DB;

type
  Tfrm_retifica = class(TForm)
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    MainMenu1: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    Panel1: TPanel;
    Label5: TLabel;
    msk_unid_pesq: TMaskEdit;
    edt_nm_unid_pesq: TEdit;
    btn_co_unid_pesq: TSpeedButton;
    msk_prod_pesq: TMaskEdit;
    Label6: TLabel;
    edt_nm_prod_pesq: TEdit;
    btn_co_prod_pesq: TSpeedButton;
    msk_processo: TMaskEdit;
    Label1: TLabel;
    btn_co_processo: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    pgctrl_retifica: TPageControl;
    ts_frete_maritimo: TTabSheet;
    ts_taxa_maritima: TTabSheet;
    ts_frete_aerea: TTabSheet;
    ts_taxa_aerea: TTabSheet;
    grp_fcl: TGroupBox;
    Label17: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    dbgrid_contanier: TDBGrid;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit17: TDBEdit;
    grp_lcl: TGroupBox;
    Label36: TLabel;
    lb_tarifa_conso: TLabel;
    Label37: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    dbgrid_lcl: TDBGrid;
    dbedt_charg_conso: TDBEdit;
    dbedt_tarifa_conso: TDBEdit;
    dbedt_tt_frete_conso: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit18: TDBEdit;
    DBGrid4: TDBGrid;
    Label14: TLabel;
    DBGrid6: TDBGrid;
    Label16: TLabel;
    Label15: TLabel;
    DBGrid5: TDBGrid;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label23: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit16: TDBEdit;
    dbgrid_other_charge: TDBGrid;
    Label4: TLabel;
    DBGrid2: TDBGrid;
    Label13: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    ts_dados_basicos: TTabSheet;
    Panel2: TPanel;
    dbedt_cd_origem: TDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    dbedt_nm_origem: TDBEdit;
    dbedt_nm_destino: TDBEdit;
    dbedt_cd_destino: TDBEdit;
    Label28: TLabel;
    dbedt_cd_ag: TDBEdit;
    dbedt_nm_ag: TDBEdit;
    lb_ag: TLabel;
    dbedt_cd_cia: TDBEdit;
    dbedt_nm_cia: TDBEdit;
    Label30: TLabel;
    dbedt_cd_moeda: TDBEdit;
    dbedt_nm_moeda: TDBEdit;
    Label31: TLabel;
    dbedt_nr_house: TDBEdit;
    Label32: TLabel;
    DBGrid3: TDBGrid;
    DBEdit30: TDBEdit;
    Label33: TLabel;
    Bevel2: TBevel;
    Label34: TLabel;
    btn_co_origem: TSpeedButton;
    btn_co_ag: TSpeedButton;
    btn_co_moeda: TSpeedButton;
    btn_co_cia: TSpeedButton;
    btn_co_destino: TSpeedButton;
    dbedt_cd_armador: TDBEdit;
    dbedt_nm_armador: TDBEdit;
    btn_co_armador: TSpeedButton;
    DBEdit19: TDBEdit;
    Label29: TLabel;
    DBEdit20: TDBEdit;
    Label35: TLabel;
    pnl_consolidacao: TPanel;
    Label38: TLabel;
    dbedt_cd_consolidacao: TDBEdit;
    dbedt_nm_consolidacao: TDBEdit;
    btn_consolidacao: TSpeedButton;
    Bevel1: TBevel;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure btn_sairClick(Sender: TObject);
    procedure btn_co_unid_pesqClick(Sender: TObject);
    procedure btn_co_prod_pesqClick(Sender: TObject);
    procedure msk_prod_pesqExit(Sender: TObject);
    procedure msk_unid_pesqExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_processoExit(Sender: TObject);
    procedure abre_qry;
    procedure fecha_qry;
    procedure btn_salvarClick(Sender: TObject);
    procedure show_paineis( const cd_via_transp:string);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_co_origemClick(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure btn_co_destinoClick(Sender: TObject);
    procedure btn_co_ciaClick(Sender: TObject);
    procedure btn_co_agClick(Sender: TObject);
    procedure dbedt_cd_origemExit(Sender: TObject);
    procedure dbedt_cd_destinoExit(Sender: TObject);
    procedure dbedt_cd_agExit(Sender: TObject);
    procedure dbedt_cd_moedaExit(Sender: TObject);
    procedure dbedt_cd_armadorExit(Sender: TObject);
    procedure dbedt_cd_ciaExit(Sender: TObject);
    procedure dbedt_nr_houseChange(Sender: TObject);
    procedure btn_co_armadorClick(Sender: TObject);
    procedure dbedt_cd_agChange(Sender: TObject);
    procedure btn_consolidacaoClick(Sender: TObject);
    procedure dbedt_cd_consolidacaoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure msk_unid_pesqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_lclColExit(Sender: TObject);
    procedure dbgrid_lclDblClick(Sender: TObject);
    procedure dbgrid_lclKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid4ColExit(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid6ColExit(Sender: TObject);
    procedure DBGrid6DblClick(Sender: TObject);
    procedure DBGrid6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid5ColExit(Sender: TObject);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60]; // trabalha c/ edt_chave
    Pesquisa : String;
    mudanca:Boolean;//controla o processo de inclusão de master e houses
//    procedure Cancelar;
  public
    function Grava   :Boolean;
    function Consiste:Boolean;
  end;

var
  frm_retifica: Tfrm_retifica;
  st_modificar, st_incluir, st_excluir: Boolean;

implementation

uses GSMLIB, PGGP017, PGGP001,ConsOnLineEx, PGSM048, PGSM019, PGSM242, Funcoes, dRetificador, uPortos, uAg;

{$R *.DFM}

procedure Tfrm_retifica.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_salvar.Enabled   := Salv;
  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;
  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_retifica.btn_sairClick(Sender: TObject);
begin
  fecha_qry;
  datm_retifica.Free;
  Close;
end;

procedure Tfrm_retifica.btn_co_unid_pesqClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    msk_unid_pesq.text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Unidade'],'CD_UNID_NEG', nil, 1, msk_unid_pesq.text);
    msk_unid_pesqExit(Sender);
  end else
    edt_nm_unid_pesq.text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_unid_pesq.text, 'NM_UNID_NEG' );



{  Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG',msk_unid_pesq, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );
  msk_unid_pesqExit(Sender);   }
end;

procedure Tfrm_retifica.btn_co_prod_pesqClick(Sender: TObject);
//var produto:string;
begin
  if Sender is TSpeedButton then begin
    msk_prod_pesq.text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO', nil, 1, msk_prod_pesq.text);
    msk_prod_pesqExit(Sender);
  end else
    edt_nm_prod_pesq.text := ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO= "'+msk_prod_pesq.Text+'" ' +
                                               'AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO' +
                                               '                   WHERE CD_USUARIO ="'+str_cd_usuario+'")' , 'NM_PRODUTO');



{  produto := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Unidade'],'CD_PRODUTO');
  if produto <> '' then
  begin
    msk_prod_pesq.text := produto;
    msk_prod_pesqExit(Sender);
  end;  }
end;

procedure Tfrm_retifica.msk_prod_pesqExit(Sender: TObject);
begin
{  if msk_prod_pesq.Text <> '' then
  begin
    ValCodEdt( msk_prod_pesq );
    datm_retifica.qry_pesquisa_.Active:=false;
    datm_retifica.qry_pesquisa_.Sql.Clear;
    datm_retifica.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_prod_pesq.Text+'"');
    datm_retifica.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    datm_retifica.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_retifica.qry_pesquisa_.Active:=true;
    if not datm_retifica.qry_pesquisa_.IsEmpty then
    begin
      edt_nm_prod_pesq.text:= datm_retifica.qry_pesquisa_.Fields[0].AsString;
      datm_retifica.qry_pesquisa_.Close;
    end
    else
    begin
      datm_retifica.qry_pesquisa_.Close;
      edt_nm_prod_pesq.Text := '';
      BoxMensagem('Código do Produto inválido ou não habilidado!', 2);
      msk_prod_pesq.SetFocus;
      Exit;
    end;
  end
  else
  begin
    Boxmensagem('O Produto deve ser informado!',2);
    msk_prod_pesq.SetFocus;
  end; }

  if msk_prod_pesq.Text <> '' then begin
    msk_prod_pesq.Text := Copy('00', 1, 2 - Length( msk_prod_pesq.Text)) +  msk_prod_pesq.Text;
    edt_nm_prod_pesq.text := ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO= "'+msk_prod_pesq.Text+'" ' +
                                               ' AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO ' +
                                               '                   WHERE CD_USUARIO ="'+str_cd_usuario+'") ' , 'NM_PRODUTO');

    if edt_nm_prod_pesq.text = '' then begin
      edt_nm_prod_pesq.Text := '';
      ShowMessage('Código do Produto inválido ou não habilidado!');
      msk_prod_pesq.SetFocus;
      Exit;
    end;
  end else begin
    ShowMessage('O Produto deve ser informado!');
    msk_prod_pesq.SetFocus;
  end;

end;

procedure Tfrm_retifica.msk_unid_pesqExit(Sender: TObject);
begin
{  if msk_unid_pesq.Text <> '' then
  begin
    ValCodEdt( msk_unid_pesq );
    datm_retifica.qry_pesquisa_.Active:=false;
    datm_retifica.qry_pesquisa_.Sql.Clear;
    datm_retifica.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid_pesq.Text+'"');
    datm_retifica.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_retifica.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_retifica.qry_pesquisa_.Active:=true;
    if not datm_retifica.qry_pesquisa_.IsEmpty then
    begin
      edt_nm_unid_pesq.text:= datm_retifica.qry_pesquisa_.Fields[0].AsString;
      datm_retifica.qry_pesquisa_.Close;
    end
    else
    begin
      datm_retifica.qry_pesquisa_.Close;
      edt_nm_unid_pesq.Text := '';
      BoxMensagem('Código da Unidade de Negócio inválido!', 2);
      msk_unid_pesq.SetFocus;
      Exit;
    end;
  end
  else
  begin
    Boxmensagem('A Unidade de Negócio deve ser informado!',2);
    msk_unid_pesq.SetFocus;
  end;   }

  if msk_unid_pesq.Text <> '' then begin
    msk_unid_pesq.Text := Copy('00', 1, 2 - Length( msk_unid_pesq.Text)) +  msk_unid_pesq.Text;
    edt_nm_unid_pesq.text := ConsultaLookUpSQL('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid_pesq.Text+'" ' +
                                               ' AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG FROM TUSUARIO_HABILITACAO ' +
                                               '                     WHERE CD_USUARIO ="'+str_cd_usuario+'") ', 'NM_UNID_NEG');

    if edt_nm_unid_pesq.text = '' then begin
      edt_nm_unid_pesq.Text := '';
      ShowMessage('Código da Unidade de Negócio inválido!');
      msk_unid_pesq.SetFocus;
      Exit;
    end;
  end else begin
    ShowMessage('A Unidade de Negócio deve ser informado!');
    msk_unid_pesq.SetFocus;
  end;


end;

procedure Tfrm_retifica.FormCreate(Sender: TObject);
begin
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  Application.CreateForm(Tdatm_retifica, datm_retifica);
  datm_retifica.qry_traz_default_.Close;
  datm_retifica.qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
  datm_retifica.qry_traz_default_.Open;
  msk_unid_pesq.text    := datm_retifica.qry_traz_default_CD_UNID_NEG.AsString;
  edt_nm_unid_pesq.text := datm_retifica.qry_traz_default_NM_UNID_NEG.AsString;
  msk_prod_pesq.text   := datm_retifica.qry_traz_default_CD_PRODUTO.AsString;
  edt_nm_prod_pesq.text:= datm_retifica.qry_traz_default_NM_PRODUTO.AsString;
end;

procedure Tfrm_retifica.btn_co_processoClick(Sender: TObject);
var processo:string;
begin
  processo := ConsultaOnLineExSql('SELECT SUBSTRING(NR_PROCESSO,5,14)AS NR_PROCESSO, TPR.CD_CLIENTE,' +
                                  ' (SELECT AP_EMPRESA FROM TEMPRESA_NAC CL WHERE CL.CD_EMPRESA = TPR.CD_CLIENTE) AS NM_CLIENTE, TPR.CD_SERVICO, TS.NM_SERVICO'+
                                  ' FROM TPROCESSO TPR, TSERVICO TS WHERE TPR.CD_PRODUTO = ' + QuotedStr(msk_prod_pesq.Text) +' AND TPR.CD_UNID_NEG = '+ QuotedStr(msk_unid_pesq.Text) +
                                  ' AND TPR.IN_LIBERADO = "1" AND ISNULL(TPR.IN_ACCOUNT,"0") IN ("0","2") AND TS.CD_SERVICO = TPR.CD_SERVICO AND TS.TP_SERVICO = "1"',
                                  'Processos',['NR_PROCESSO','CD_CLIENTE','NM_CLIENTE','CD_SERVICO','NM_SERVICO'],['Processo','Cód.','Cliente','Cód.','Serviço'],'NR_PROCESSO');
  if processo <>'' then
  begin
    msk_processo.text:=processo;
    msk_processoExit(Sender);
  end;
end;

procedure Tfrm_retifica.msk_processoExit(Sender: TObject);
var proc:string[18];
begin
  if msk_processo.Text <> '' then
  begin
    proc:= msk_unid_pesq.Text + msk_prod_pesq.Text + msk_processo.Text;
    datm_retifica.qry_processo_.Close;
    datm_retifica.qry_processo_.ParamByName('NR_PROCESSO').AsString:= proc;
    datm_retifica.qry_processo_.ParamByName('CD_UNID_NEG').AsString:= msk_unid_pesq.Text;
    datm_retifica.qry_processo_.ParamByName('CD_PRODUTO').AsString := msk_prod_pesq.Text;
    datm_retifica.qry_processo_.Prepare;
    datm_retifica.qry_processo_.Open;
    datm_retifica.qry_processo_.Edit;
    if not datm_retifica.qry_processo_.IsEmpty then
    begin
      abre_qry;
      show_paineis(datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString);
      datm_retifica.qry_proc_relacionados_.close;
      datm_retifica.qry_proc_relacionados_.ParamByname('NR_PROCESSO').AsString := proc;
      datm_retifica.qry_proc_relacionados_.Prepare;
      datm_retifica.qry_proc_relacionados_.Open;
    end
    else
    begin
      fecha_qry;
      BoxMensagem('Código do Processo inválido ou não habilidado!', 2);
      msk_processo.text := '';
      msk_processo.SetFocus;
      Exit;
    end;
  end
  else
    fecha_qry;
end;

procedure Tfrm_retifica.abre_qry;
begin
  if (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01') and (datm_retifica.qry_processo_TP_ESTUFAGEM.AsString = '1') and (datm_retifica.qry_processo_TP_SERVICO.AsString = '02') then
  begin
    datm_retifica.qry_processo_cntr_.Close;
    datm_retifica.qry_processo_cntr_.ParamByName('NR_PROCESSO').AsString:=datm_retifica.qry_processo_NR_PROCESSO.AsString;
    datm_retifica.qry_processo_cntr_.Prepare;
    datm_retifica.qry_processo_cntr_.Open;
  end;
  if (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01') and (datm_retifica.qry_processo_TP_ESTUFAGEM.AsString = '0') then
  begin
    datm_retifica.qry_processo_carga_.Close;
    datm_retifica.qry_processo_carga_.ParamByName('NR_PROCESSO').AsString:=datm_retifica.qry_processo_NR_PROCESSO.AsString;
    datm_retifica.qry_processo_carga_.Prepare;
    datm_retifica.qry_processo_carga_.Open;
  end;
  datm_retifica.qry_despesa_house_.Close;
  datm_retifica.qry_despesa_house_.ParamByName('NR_PROCESSO').AsString:=datm_retifica.qry_processo_NR_PROCESSO.AsString;
  datm_retifica.qry_despesa_house_.Prepare;
  datm_retifica.qry_despesa_house_.Open;
  datm_retifica.qry_vl_brasil_.Close;
  datm_retifica.qry_vl_brasil_.ParamByName('NR_PROCESSO').AsString:=datm_retifica.qry_processo_NR_PROCESSO.AsString;
  datm_retifica.qry_vl_brasil_.Prepare;
  datm_retifica.qry_vl_brasil_.Open;
  datm_retifica.qry_vl_other_.Close;
  datm_retifica.qry_vl_other_.ParamByName('NR_PROCESSO').AsString:=datm_retifica.qry_processo_NR_PROCESSO.AsString;
  datm_retifica.qry_vl_other_.Prepare;
  datm_retifica.qry_vl_other_.Open;
  datm_retifica.qry_house_.Close;
  datm_retifica.qry_house_.ParamByName('NR_PROCESSO').AsString:=datm_retifica.qry_processo_NR_PROCESSO.AsString;
  datm_retifica.qry_house_.Prepare;
  datm_retifica.qry_house_.Open;
end;

procedure Tfrm_retifica.fecha_qry;
begin
  datm_retifica.qry_processo_.Close;
  datm_retifica.qry_vl_brasil_.Close;
  datm_retifica.qry_vl_other_.Close;
  datm_retifica.qry_despesa_house_.Close;
end;

procedure Tfrm_retifica.btn_salvarClick(Sender: TObject);
begin
  if not consiste then exit;
  if not grava then exit;
end;

function Tfrm_retifica.Grava: Boolean;
begin
  try
    with datm_retifica do
    begin
      if not datm_main.db_broker.InTransaction then
      datm_main.db_broker.StartTransaction;
      if qry_processo_.State in [dsInsert, dsEdit] then
        qry_processo_.Post;
      if qry_house_.State in [dsInsert, dsEdit] then
        qry_house_.Post;
      if pgctrl_retifica.ActivePage = ts_dados_basicos then
        atz_dados;
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
  btn_mi(false,false,false,false);
end;

procedure Tfrm_retifica.show_paineis;
begin
  dbedt_cd_armador.Visible := (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01');
  label30.Visible          := (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01');
  dbedt_nm_armador.Visible := (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01');
  btn_co_armador.Visible   := (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01');
  dbedt_cd_cia.Visible     := (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '04');
  dbedt_nm_cia.Visible     := (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '04');
  btn_co_cia.Visible       := (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '04');
  dbedt_cd_ag.Visible      := (datm_retifica.qry_processo_TP_PROCESSO.AsString = '1');
  dbedt_nm_ag.Visible      := (datm_retifica.qry_processo_TP_PROCESSO.AsString = '1');
  lb_ag.Visible            := (datm_retifica.qry_processo_TP_PROCESSO.AsString = '1');
  btn_co_ag.Visible        := (datm_retifica.qry_processo_TP_PROCESSO.AsString = '1');
  pnl_consolidacao.Visible := (datm_retifica.qry_processo_TP_PRODUTO.AsString = '01');
  pgctrl_retifica.ActivePage   :=ts_dados_basicos;
  ts_frete_maritimo.TabVisible := (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01');
  ts_taxa_maritima.TabVisible  := (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01');
  ts_frete_aerea.TabVisible    := (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '04');
  ts_taxa_aerea.TabVisible     := (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '04');
  if (datm_retifica.qry_processo_TP_ESTUFAGEM.AsString = '1') then
  begin
    grp_fcl.BringToFront;
    grp_lcl.SendToBack
  end;
  if (datm_retifica.qry_processo_TP_ESTUFAGEM.AsString = '0') then
  begin
    grp_fcl.SendToBack;
    grp_lcl.BringToFront;
  end;
end;

procedure Tfrm_retifica.btn_cancelarClick(Sender: TObject);
begin
  if datm_retifica.qry_processo_.State in [dsInsert, dsEdit] then
    datm_retifica.qry_processo_.Cancel;
  btn_mi(false,false,false,false);
end;

procedure Tfrm_retifica.btn_co_origemClick(Sender: TObject);
begin
{ Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    in_porto:=(datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01');;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_retifica.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
       datm_retifica.qry_processo_.Edit;
    datm_retifica.qry_processo_CD_ORIGEM.Value:=frm_portos.Cons_OnLine_Texto;
  end;
  dbedt_cd_origemExit(NIL);  }

  if Sender is TSpeedButton then begin
    if not ( datm_retifica.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_retifica.qry_processo_.Edit;
    if datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01' then
      datm_retifica.qry_processo_CD_ORIGEM.AsString := ConsultaOnlineExFiltro('TPORTO', 'Origens', ['CD_PORTO', 'NM_PORTO'], ['Código', 'Descrição'], 'CD_PORTO','TP_PORTO= "1"', nil, datm_retifica.qry_processo_CD_ORIGEM.AsString, 1)
    else
      datm_retifica.qry_processo_CD_ORIGEM.AsString := ConsultaOnlineExFiltro('TPORTO', 'Origens', ['CD_PORTO', 'NM_PORTO'], ['Código', 'Descrição'], 'CD_PORTO','TP_PORTO= "0"', nil, datm_retifica.qry_processo_CD_ORIGEM.AsString, 1);
    dbedt_cd_origemExit(nil);
  end else begin
    if datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01' then
      datm_retifica.qry_processo_NM_ORIGEM.AsString := ConsultaLookUpSQL('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "'+dbedt_cd_origem.Text+'" AND TP_PORTO= "1" ', 'NM_PORTO')
    else
      datm_retifica.qry_processo_NM_ORIGEM.AsString := ConsultaLookUpSQL('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "'+dbedt_cd_origem.Text+'" AND TP_PORTO= "0" ', 'NM_PORTO');
  end;
end;

procedure Tfrm_retifica.btn_co_moedaClick(Sender: TObject);
begin
{ Application.CreateForm(Tfrm_moeda, frm_moeda);
  with frm_moeda Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_moeda.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_retifica.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
       datm_retifica.qry_processo_.Edit;
    datm_retifica.qry_processo_CD_MOEDA_FRETE.AsString := frm_moeda.Cons_OnLine_Texto;
  end;
  dbedt_cd_moedaExit(NIL);  }

  if Sender is TSpeedButton then begin
    if not ( datm_retifica.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_retifica.qry_processo_.Edit;
    datm_retifica.qry_processo_CD_MOEDA_FRETE.AsString := ConsultaOnlineEx('TMOEDA_BROKER', 'Moedas', ['CD_MOEDA', 'NM_MOEDA', 'AP_MOEDA'], ['Código', 'Descrição', 'Apelido'], 'CD_MOEDA', nil, 1, datm_retifica.qry_processo_CD_MOEDA_FRETE.AsString);
    dbedt_cd_moedaExit(nil);
  end else
    datm_retifica.qry_processo_AP_MOEDA.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', dbedt_cd_moeda.Text, 'AP_MOEDA');
end;

procedure Tfrm_retifica.btn_co_destinoClick(Sender: TObject);
begin
{ Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    in_porto:=(datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01');;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_retifica.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
       datm_retifica.qry_processo_.Edit;
    datm_retifica.qry_processo_CD_DESTINO.Value:=frm_portos.Cons_OnLine_Texto;
  end;
  dbedt_cd_destinoExit(NIL); }

  if Sender is TSpeedButton then begin
    if not ( datm_retifica.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_retifica.qry_processo_.Edit;
    if datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01' then
      datm_retifica.qry_processo_CD_DESTINO.AsString := ConsultaOnlineExFiltro('TPORTO', 'Origens', ['CD_PORTO', 'NM_PORTO'], ['Código', 'Descrição'], 'CD_PORTO','TP_PORTO= "1"', nil, datm_retifica.qry_processo_CD_DESTINO.AsString, 1)
    else
      datm_retifica.qry_processo_CD_DESTINO.AsString := ConsultaOnlineExFiltro('TPORTO', 'Origens', ['CD_PORTO', 'NM_PORTO'], ['Código', 'Descrição'], 'CD_PORTO','TP_PORTO= "0"', nil, datm_retifica.qry_processo_CD_DESTINO.AsString, 1);
    dbedt_cd_destinoExit(nil);
  end else begin
    if datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01' then
      datm_retifica.qry_processo_NM_DESTINO.AsString := ConsultaLookUpSQL('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "'+dbedt_cd_destino.Text+'" AND TP_PORTO= "1" ', 'NM_PORTO')
    else
      datm_retifica.qry_processo_NM_DESTINO.AsString := ConsultaLookUpSQL('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "'+dbedt_cd_destino.Text+'" AND TP_PORTO= "0" ', 'NM_PORTO');
  end;
end;

procedure Tfrm_retifica.btn_co_ciaClick(Sender: TObject);
begin
{  Application.CreateForm(Tfrm_Transportador_itl, frm_Transportador_itl);
  with frm_Transportador_itl Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    in_aerea:=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_Transportador_itl.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_retifica.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
       datm_retifica.qry_processo_.Edit;
    datm_retifica.qry_processo_CD_CIA_TRANSP.AsString:=frm_Transportador_itl.Cons_OnLine_Texto;
  end;
   dbedt_cd_ciaExit(NIL);  }

  if Sender is TSpeedButton then begin
    if not ( datm_retifica.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_retifica.qry_processo_.Edit;
    datm_retifica.qry_processo_CD_CIA_TRANSP.AsString := ConsultaOnlineExFiltro('TTRANSPORTADOR_ITL', 'Transportadores Internacionais', ['CODIGO', 'DESCRICAO'], ['Código', 'Descrição'], 'CODIGO', 'TP_TRANSPORTADOR = "0"', nil, datm_retifica.qry_processo_CD_CIA_TRANSP.AsString, 1);
    dbedt_cd_ciaExit(nil);
  end else
    datm_retifica.qry_processo_NM_CIA.AsString := ConsultaLookUpSQL('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO = "'+ dbedt_cd_cia.Text + '" AND TP_TRANSPORTADOR = "0" ', 'DESCRICAO');
end;

procedure Tfrm_retifica.btn_co_agClick(Sender: TObject);
begin
{  Application.CreateForm(Tfrm_ag, frm_ag);
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
    If Not ( datm_retifica.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
       datm_retifica.qry_processo_.Edit;
    datm_retifica.qry_processo_CD_AGENTE.AsString:=frm_ag.Cons_OnLine_Texto;
  end;
  dbedt_cd_agExit(NIL);  }

  if Sender is TSpeedButton then begin
    if not ( datm_retifica.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_retifica.qry_processo_.Edit;
    datm_retifica.qry_processo_CD_AGENTE.AsString :=ConsultaOnlineExFiltro('TAGENTE', 'Agentes', ['CD_AGENTE', 'NM_AGENTE'], ['Código', 'Descrição'], 'CD_AGENTE', 'TP_AG = "1"', nil, datm_retifica.qry_processo_CD_AGENTE.AsString, 1);
    dbedt_cd_agExit(nil);
  end else
    datm_retifica.qry_processo_NM_AGENTE.AsString := ConsultaLookUpSQL('SELECT NM_AGENTE FROM TAGENTE WHERE CD_AGENTE = "'+dbedt_cd_ag.Text+'" AND TP_AG = "1" ' , 'NM_AGENTE');

end;

procedure Tfrm_retifica.dbedt_cd_origemExit(Sender: TObject);
//var tp_porto:String[1];
begin
{  if not(datm_retifica.qry_processo_.State in [dsEdit]) then
    exit;
  if (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01') then
    tp_porto := '1'
  else
    tp_porto := '0';
  if dbedt_cd_origem.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_origem );
    datm_retifica.qry_pesquisa_.Active:=false;
    datm_retifica.qry_pesquisa_.Sql.Clear;
    datm_retifica.qry_pesquisa_.Sql.Add('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "'+dbedt_cd_origem.Text+'"');
    datm_retifica.qry_pesquisa_.Sql.Add(' AND TP_PORTO= "'+tp_porto+'"');
    datm_retifica.qry_pesquisa_.Active:=true;
    if datm_retifica.qry_pesquisa_.RecordCount > 0  then
    begin
      datm_retifica.qry_processo_NM_ORIGEM.AsString := datm_retifica.qry_pesquisa_.Fields[0].AsString;
      datm_retifica.qry_pesquisa_.Close;
    end
    else
    begin
      datm_retifica.qry_pesquisa_.Close;
      dbedt_nm_origem.Text := '';
      BoxMensagem('Código da Origem inválido!', 2);
      dbedt_cd_origem.SetFocus;
      Exit;
    end;
    end
  else
    dbedt_nm_origem.Text := ''; }

  if not (datm_retifica.qry_processo_.State in [dsInsert, dsEdit]) then exit;
  if dbedt_cd_origem.Text <> '' then begin
    dbedt_cd_origem.Text := Copy('0000', 1, 4 - Length( dbedt_cd_origem.Text)) +  dbedt_cd_origem.Text;
    if (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01') then
      datm_retifica.qry_processo_NM_ORIGEM.AsString := ConsultaLookUpSQL('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "'+dbedt_cd_origem.Text+'" AND TP_PORTO= "1" ', 'NM_PORTO')
    else
      datm_retifica.qry_processo_NM_ORIGEM.AsString := ConsultaLookUpSQL('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "'+dbedt_cd_origem.Text+'" AND TP_PORTO= "0" ', 'NM_PORTO');
    if datm_retifica.qry_processo_NM_ORIGEM.AsString = '' then begin
      dbedt_nm_origem.Text := '';
      BoxMensagem('Código da Origem inválido!', 2);
      dbedt_cd_origem.SetFocus;
      Exit;
    end;
  end else
    dbedt_nm_origem.Text := '';
end;

function Tfrm_retifica.Consiste: Boolean;
begin
  consiste := true;
  if pgctrl_retifica.Activepage = ts_dados_basicos then
  begin
    if not(BoxMensagem('Este Informações serão alteradas para todos os Processos relacionados. Deseja Continuar?',1)) then
    begin
      Consiste := false;
      Exit;
    end;
    if (dbedt_nm_origem.Text = '') then
    begin
      Boxmensagem('Deve ser informado uma Origem',2);
      dbedt_nm_origem.SetFocus;
      Consiste := false;
      Exit;
    end;
    if (dbedt_cd_destino.Text = '') then
    begin
      Boxmensagem('Deve ser informado um Destino',2);
      dbedt_cd_destino.SetFocus;
      Consiste := false;
      Exit;
    end;
    if (datm_retifica.qry_processo_TP_PROCESSO.AsString = '1') then begin
      if (dbedt_cd_ag.Text = '') then begin
        Boxmensagem('Deve ser informado um Agente',2);
        dbedt_cd_ag.SetFocus;
        Consiste := false;
        Exit;
      end;
    end;
    if (dbedt_nm_armador.Text = '') and (dbedt_nm_cia.Text = '') then
    begin
      Boxmensagem('Deve ser informado um Transportador',2);
      //dbedt_cd_destino.SetFocus;
      Consiste := false;
      Exit;
    end;
    if (dbedt_nm_moeda.Text = '') then
    begin
      Boxmensagem('Deve ser informado uma Moeda',2);
      dbedt_cd_moeda.SetFocus;
      Consiste := false;
      Exit;
    end;
    if (dbedt_nr_house.Text = '') then
    begin
      Boxmensagem('Deve ser informado o Nº House',2);
      dbedt_nr_house.SetFocus;
      Consiste := false;
      Exit;
    end;
    if (datm_retifica.in_change_cia )  then
     Consiste := datm_retifica.verifica_qtde_conhecimento(datm_retifica.qry_processo_CD_CIA_TRANSP.AsString);
  end;
end;

procedure Tfrm_retifica.dbedt_cd_destinoExit(Sender: TObject);
//var tp_porto:String[1];
begin
{  if not(datm_retifica.qry_processo_.State in [dsEdit]) then
    exit;
  if (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01') then
    tp_porto := '1'
  else
    tp_porto := '0';
  if dbedt_cd_destino.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_destino );
    datm_retifica.qry_pesquisa_.Active:=false;
    datm_retifica.qry_pesquisa_.Sql.Clear;
    datm_retifica.qry_pesquisa_.Sql.Add('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "'+dbedt_cd_destino.Text+'"');
    datm_retifica.qry_pesquisa_.Sql.Add(' AND TP_PORTO= "'+tp_porto+'"');
    datm_retifica.qry_pesquisa_.Active:=true;
    if not datm_retifica.qry_pesquisa_.IsEmpty then
    begin
      datm_retifica.qry_processo_NM_DESTINO.AsString := datm_retifica.qry_pesquisa_.Fields[0].AsString;
      datm_retifica.qry_pesquisa_.Close;
    end
    else
    begin
      datm_retifica.qry_pesquisa_.Close;
      dbedt_nm_destino.Text := '';
      BoxMensagem('Código do Destino inválido!', 2);
      dbedt_cd_destino.SetFocus;
      Exit;
    end;
  end
  else
    dbedt_nm_destino.Text := '';}

  if not (datm_retifica.qry_processo_.State in [dsInsert, dsEdit]) then exit;
  if dbedt_cd_destino.Text <> '' then begin
    dbedt_cd_destino.Text := Copy('0000', 1, 4 - Length( dbedt_cd_destino.Text)) +  dbedt_cd_destino.Text;
    if (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01') then
      datm_retifica.qry_processo_NM_DESTINO.AsString := ConsultaLookUpSQL('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "'+dbedt_cd_destino.Text+'" AND TP_PORTO= "1" ', 'NM_PORTO')
    else
      datm_retifica.qry_processo_NM_DESTINO.AsString := ConsultaLookUpSQL('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "'+dbedt_cd_destino.Text+'" AND TP_PORTO= "0" ', 'NM_PORTO');
    if datm_retifica.qry_processo_NM_DESTINO.AsString = '' then begin
      dbedt_nm_destino.Text := '';
      BoxMensagem('Código da Origem inválido!', 2);
      dbedt_cd_destino.SetFocus;
      Exit;
    end;
  end else
    dbedt_nm_destino.Text := '';
end;

procedure Tfrm_retifica.dbedt_cd_agExit(Sender: TObject);
begin
{  if not(datm_retifica.qry_processo_.State in [dsEdit]) then
    exit;
  if dbedt_cd_ag.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_ag );
    datm_retifica.qry_pesquisa_.Active:=false;
    datm_retifica.qry_pesquisa_.Sql.Clear;
    datm_retifica.qry_pesquisa_.Sql.Add(' SELECT NM_AGENTE FROM TAGENTE WHERE CD_AGENTE = "'+dbedt_cd_ag.Text+'"');
    datm_retifica.qry_pesquisa_.Sql.Add(' AND TP_AG = "1" ');
    datm_retifica.qry_pesquisa_.Active:=true;
    if not datm_retifica.qry_pesquisa_.IsEmpty  then
    begin
      datm_retifica.qry_processo_NM_AGENTE.AsString := datm_retifica.qry_pesquisa_.Fields[0].AsString;
      datm_retifica.qry_pesquisa_.Close;
    end
    else
    begin
      datm_retifica.qry_pesquisa_.Close;
      dbedt_nm_ag.Text := '';
      BoxMensagem('Código do Agente inválido!', 2);
      dbedt_cd_ag.SetFocus;
      Exit;
    end;
  end
  else
    dbedt_nm_ag.Text := '';   }

  if not(datm_retifica.qry_processo_.State in [dsInsert, dsEdit]) then exit;
  if dbedt_cd_ag.Text <> '' then begin
    dbedt_cd_ag.Text := Copy('0000', 1, 4 - Length( dbedt_cd_ag.Text)) +  dbedt_cd_ag.Text;
    datm_retifica.qry_processo_NM_AGENTE.AsString := ConsultaLookUpSQL('SELECT NM_AGENTE FROM TAGENTE WHERE CD_AGENTE = "'+dbedt_cd_ag.Text+'" AND TP_AG = "1" ' , 'NM_AGENTE');
    if datm_retifica.qry_processo_NM_AGENTE.AsString = '' then begin
      dbedt_nm_ag.Text := '';
      ShowMessage('Código do Agente inválido!');
      dbedt_cd_ag.SetFocus;
      Exit;
    end;

  end else
    dbedt_nm_ag.Text := '';
end;

procedure Tfrm_retifica.dbedt_cd_moedaExit(Sender: TObject);
begin
{  if not(datm_retifica.qry_processo_.State in [dsEdit]) then
    exit;
  if dbedt_cd_moeda.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_moeda );
    datm_retifica.qry_pesquisa_.Active:=false;
    datm_retifica.qry_pesquisa_.Sql.Clear;
    datm_retifica.qry_pesquisa_.Sql.Add('SELECT AP_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+dbedt_cd_moeda.Text+'"');
    datm_retifica.qry_pesquisa_.Active:=true;
    if not datm_retifica.qry_pesquisa_.IsEmpty  then
    begin
      datm_retifica.qry_processo_AP_MOEDA.AsString := datm_retifica.qry_pesquisa_.Fields[0].AsString;
      datm_retifica.qry_pesquisa_.Close;
    end
    else
    begin
      datm_retifica.qry_pesquisa_.Close;
      dbedt_NM_moeda.Text := '';
      BoxMensagem('Código da Moeda inválido!', 2);
      dbedt_cd_moeda.SetFocus;
      Exit;
    end;
  end
  else
    dbedt_cd_moeda.Text := '';  }

  if not(datm_retifica.qry_processo_.State in [dsInsert, dsEdit]) then  exit;
  if dbedt_cd_moeda.Text <> '' then begin
    dbedt_cd_moeda.Text := Copy('000', 1, 3 - Length( dbedt_cd_moeda.Text)) +  dbedt_cd_moeda.Text;
    datm_retifica.qry_processo_AP_MOEDA.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', dbedt_cd_moeda.Text, 'AP_MOEDA');
    if datm_retifica.qry_processo_AP_MOEDA.AsString = '' then begin
      dbedt_nm_moeda.Text := '';
      ShowMessage('Código da Moeda inválido!');
      dbedt_cd_moeda.SetFocus;
      Exit;
    end;
  end else
    dbedt_cd_moeda.Text := '';
end;

procedure Tfrm_retifica.dbedt_cd_armadorExit(Sender: TObject);
begin
{  if not(datm_retifica.qry_processo_.State in [dsEdit])then
    exit;
  if dbedt_cd_armador.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_armador );
    datm_retifica.qry_pesquisa_.Active:=false;
    datm_retifica.qry_pesquisa_.Sql.Clear;
    datm_retifica.qry_pesquisa_.Sql.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO = "'+dbedt_cd_armador.Text+'"');
    datm_retifica.qry_pesquisa_.Active:=true;
    if not datm_retifica.qry_pesquisa_.IsEmpty then
    begin
      datm_retifica.qry_processo_NM_ARMADOR.AsString := datm_retifica.qry_pesquisa_.Fields[0].AsString;
      datm_retifica.qry_pesquisa_.Close;
    end
    else
    begin
      datm_retifica.qry_pesquisa_.Close;
      dbedt_NM_armador.Text := '';
      BoxMensagem('Código do Transportador inválido!', 2);
      dbedt_cd_armador.SetFocus;
      Exit;
    end;
  end
  else
    dbedt_nm_armador.Text := '';      }

  if not(datm_retifica.qry_processo_.State in [dsInsert, dsEdit]) then exit;
  if dbedt_cd_armador.Text <> '' then begin
    dbedt_cd_armador.Text := Copy('0000', 1, 4 - Length( dbedt_cd_armador.Text)) +  dbedt_cd_armador.Text;
    datm_retifica.qry_processo_NM_ARMADOR.AsString := ConsultaLookUpSQL('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO = "'+ dbedt_cd_armador.Text + '" AND TP_TRANSPORTADOR = "1" ', 'DESCRICAO');
    if datm_retifica.qry_processo_NM_ARMADOR.AsString = '' then begin
      dbedt_nm_armador.Text := '';
      ShowMessage('Código do Transportador inválido!');
      dbedt_cd_armador.SetFocus;
      Exit;
    end;
  end else
    dbedt_nm_armador.Text := '';
end;

procedure Tfrm_retifica.dbedt_cd_ciaExit(Sender: TObject);
begin
{  if not(datm_retifica.qry_processo_.State in [dsEdit]) then
    exit;
  if dbedt_cd_cia.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_cia );
    datm_retifica.qry_pesquisa_.Active:=false;
    datm_retifica.qry_pesquisa_.Sql.Clear;
    datm_retifica.qry_pesquisa_.Sql.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO = "'+dbedt_cd_cia.Text+'"');
    datm_retifica.qry_pesquisa_.Active:=true;
    if datm_retifica.qry_pesquisa_.IsEmpty then
    begin
      datm_retifica.qry_processo_NM_CIA.AsString := datm_retifica.qry_pesquisa_.Fields[0].AsString;
      datm_retifica.qry_pesquisa_.Close;
    end
    else
    begin
      datm_retifica.qry_pesquisa_.Close;
      dbedt_nm_cia.Text := '';
      BoxMensagem('Código do Transportador inválido!', 2);
      dbedt_cd_cia.SetFocus;
      Exit;
    end;
  end
  else
    dbedt_nm_cia.Text := '';    }


  if not(datm_retifica.qry_processo_.State in [dsInsert, dsEdit]) then exit;
  if dbedt_cd_cia.Text <> '' then begin
    dbedt_cd_cia.Text := Copy('0000', 1, 4 - Length( dbedt_cd_cia.Text)) +  dbedt_cd_cia.Text;
    datm_retifica.qry_processo_NM_CIA.AsString := ConsultaLookUpSQL('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO = "'+ dbedt_cd_cia.Text + '" AND TP_TRANSPORTADOR = "0" ', 'DESCRICAO');
    if datm_retifica.qry_processo_NM_CIA.AsString = '' then begin
      dbedt_nm_cia.Text := '';
      ShowMessage('Código do Transportador inválido!');
      dbedt_cd_cia.SetFocus;
      Exit;
    end;
  end else
    dbedt_nm_cia.Text := '';
end;

procedure Tfrm_retifica.dbedt_nr_houseChange(Sender: TObject);
begin
  if not (datm_retifica.qry_house_.State in [dsInsert,dsEdit]) then
    datm_retifica.qry_house_.Edit;
  btn_mi(false, true, true, false);
end;

procedure Tfrm_retifica.btn_co_armadorClick(Sender: TObject);
begin
{  Application.CreateForm(Tfrm_Transportador_itl, frm_Transportador_itl);
  with frm_Transportador_itl Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    in_maritima  :=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_Transportador_itl.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_retifica.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_retifica.qry_processo_.Edit;
    datm_retifica.qry_processo_CD_CIA_TRANSP.AsString:=frm_Transportador_itl.Cons_OnLine_Texto;
  end;
  dbedt_cd_armadorExit(NIL); }

  if Sender is TSpeedButton then begin
    if not ( datm_retifica.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_retifica.qry_processo_.Edit;
    datm_retifica.qry_processo_CD_ARMADOR.AsString := ConsultaOnlineExFiltro('TTRANSPORTADOR_ITL', 'Transportadores Internacionais', ['CODIGO', 'DESCRICAO'], ['Código', 'Descrição'], 'CODIGO', 'TP_TRANSPORTADOR = "1"', nil, datm_retifica.qry_processo_CD_ARMADOR.AsString, 1);
    dbedt_cd_armadorExit(nil);
  end else
    datm_retifica.qry_processo_NM_ARMADOR.AsString := ConsultaLookUpSQL('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO = "'+ dbedt_cd_armador.Text + '" AND TP_TRANSPORTADOR = "1" ', 'DESCRICAO');
end;

procedure Tfrm_retifica.dbedt_cd_agChange(Sender: TObject);
begin
 if datm_retifica.qry_processo_.State in [dsinsert, dsEdit] then
   btn_mi(false,true,true, false);

  if Sender = dbedt_cd_origem       then btn_co_origemClick(nil);
  if Sender = dbedt_cd_ag           then btn_co_agClick(nil);
  if Sender = dbedt_cd_moeda        then btn_co_moedaClick(nil);
  if Sender = dbedt_cd_consolidacao then btn_consolidacaoClick(nil);
  if Sender = dbedt_cd_destino      then btn_co_destinoClick(nil);
  if Sender = dbedt_cd_cia          then btn_co_ciaClick(nil);
  if Sender = dbedt_cd_armador      then btn_co_armadorClick(nil);
end;

procedure Tfrm_retifica.btn_consolidacaoClick(Sender: TObject);
begin
{  Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    in_porto:=(datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01');;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_retifica.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_retifica.qry_processo_.Edit;
    datm_retifica.qry_processo_CD_LOCAL_CONSOLIDACAO.Value:=frm_portos.Cons_OnLine_Texto;
  end;
  dbedt_cd_consolidacaoExit(NIL); }

  if Sender is TSpeedButton then begin
    if not ( datm_retifica.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_retifica.qry_processo_.Edit;
    if datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01' then
      datm_retifica.qry_processo_CD_LOCAL_CONSOLIDACAO.AsString := ConsultaOnlineExFiltro('TPORTO', 'Origens', ['CD_PORTO', 'NM_PORTO'], ['Código', 'Descrição'], 'CD_PORTO','TP_PORTO= "1"', nil, datm_retifica.qry_processo_CD_LOCAL_CONSOLIDACAO.AsString, 1)
    else
      datm_retifica.qry_processo_CD_LOCAL_CONSOLIDACAO.AsString := ConsultaOnlineExFiltro('TPORTO', 'Origens', ['CD_PORTO', 'NM_PORTO'], ['Código', 'Descrição'], 'CD_PORTO','TP_PORTO= "0"', nil, datm_retifica.qry_processo_CD_LOCAL_CONSOLIDACAO.AsString, 1);
    dbedt_cd_origemExit(nil);
  end else begin
    if (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01') then
      datm_retifica.qry_processo_NM_CONSOLIDACAO.AsString := ConsultaLookUpSQL('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "'+dbedt_cd_consolidacao.Text+'" AND TP_PORTO= "1" ', 'NM_PORTO')
    else
      datm_retifica.qry_processo_NM_CONSOLIDACAO.AsString := ConsultaLookUpSQL('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "'+dbedt_cd_consolidacao.Text+'" AND TP_PORTO= "0" ', 'NM_PORTO');
 end;
end;

procedure Tfrm_retifica.dbedt_cd_consolidacaoExit(Sender: TObject);
//var tp_porto :String[1];
begin
{  if not (datm_retifica.qry_processo_.State in [dsEdit]) then
    exit;
  if (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01') then
    tp_porto := '1'
  else
    tp_porto := '0';
  if dbedt_cd_consolidacao.Text <> '' then
  begin
    ValidCodigo(dbedt_cd_consolidacao);
    datm_retifica.qry_pesquisa_.Active := false;
    datm_retifica.qry_pesquisa_.Sql.Clear;
    datm_retifica.qry_pesquisa_.Sql.Add(' SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "'+dbedt_cd_consolidacao.Text+'"');
    datm_retifica.qry_pesquisa_.Sql.Add(' AND TP_PORTO= "'+tp_porto+'"');
    datm_retifica.qry_pesquisa_.Active := true;
    if datm_retifica.qry_pesquisa_.IsEmpty then
    begin
      datm_retifica.qry_processo_NM_CONSOLIDACAO.AsString := datm_retifica.qry_pesquisa_.Fields[0].AsString;
      datm_retifica.qry_pesquisa_.Close;
    end
    else
    begin
      datm_retifica.qry_pesquisa_.Close;
      dbedt_nm_consolidacao.Text := '';
      BoxMensagem('Código do Local de Consolidação inválido!', 2);
      dbedt_cd_consolidacao.SetFocus;
      Exit;
    end;
  end
  else
    dbedt_nm_consolidacao.Text := ''; }

  if not (datm_retifica.qry_processo_.State in [dsInsert, dsEdit]) then exit;
  if dbedt_cd_consolidacao.Text <> '' then begin
    dbedt_cd_consolidacao.Text := Copy('0000', 1, 4 - Length( dbedt_cd_consolidacao.Text)) +  dbedt_cd_consolidacao.Text;
    if (datm_retifica.qry_processo_CD_VIA_TRANSPORTE.AsString = '01') then
      datm_retifica.qry_processo_NM_CONSOLIDACAO.AsString := ConsultaLookUpSQL('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "'+dbedt_cd_consolidacao.Text+'" AND TP_PORTO= "1" ', 'NM_PORTO')
    else
      datm_retifica.qry_processo_NM_CONSOLIDACAO.AsString := ConsultaLookUpSQL('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO = "'+dbedt_cd_consolidacao.Text+'" AND TP_PORTO= "0" ', 'NM_PORTO');

    if datm_retifica.qry_processo_NM_CONSOLIDACAO.AsString = '' then begin
      dbedt_nm_consolidacao.Text := '';
      ShowMessage('Código do Local de Consolidação inválido!');
      dbedt_cd_consolidacao.SetFocus;
      Exit;
    end;
  end else
    dbedt_nm_consolidacao.Text := '';
end;

procedure Tfrm_retifica.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_retifica.msk_unid_pesqKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then begin
    if Sender = msk_unid_pesq         then btn_co_unid_pesqClick(btn_co_unid_pesq);
    if Sender = msk_prod_pesq         then btn_co_prod_pesqClick(btn_co_prod_pesq);
    if Sender = msk_processo          then btn_co_processoClick(btn_co_processo);
    if Sender = dbedt_cd_origem       then btn_co_origemClick(btn_co_origem);
    if Sender = dbedt_cd_ag           then btn_co_agClick(btn_co_ag);
    if Sender = dbedt_cd_moeda        then btn_co_moedaClick(btn_co_moeda);
    if Sender = dbedt_cd_consolidacao then btn_consolidacaoClick(btn_consolidacao);
    if Sender = dbedt_cd_destino      then btn_co_destinoClick(btn_co_destino);
    if Sender = dbedt_cd_cia          then btn_co_ciaClick(btn_co_cia);
    if Sender = dbedt_cd_armador      then btn_co_armadorClick(btn_co_armador);
  end;
end;

procedure Tfrm_retifica.dbgrid_lclColExit(Sender: TObject);
begin
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'TP_EMBALAGEM' then
    if (ConsultaLookUPSQL('SELECT NM_EMBALAGEM_S FROM TEMBALAGEM WHERE CD_EMBALAGEM = "'+ TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_EMBALAGEM').AsString +'"', 'NM_EMBALAGEM_S') = '') and
       (TDBGrid(Sender).DataSource.DataSet.FieldByName('TP_EMBALAGEM').AsString <> '')  then begin
      ShowMessage('Embalagem Inválida ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;

end;

procedure Tfrm_retifica.dbgrid_lclDblClick(Sender: TObject);
begin
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcEMBALAGEM') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'TP_EMBALAGEM') then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
    TDBGrid(Sender).dataSource.DataSet.FieldByname('TP_EMBALAGEM').AsString := ConsultaOnLineEx('TEMBALAGEM', 'Embalagens',['CD_EMBALAGEM', 'NM_EMBALAGEM_S'], ['Código','Embalagem'],'CD_EMBALAGEM', nil, 1, TDBGrid(Sender).dataSource.DataSet.FieldByname('TP_EMBALAGEM').AsString);
  end;
end;

procedure Tfrm_retifica.dbgrid_lclKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then dbgrid_lclDblClick(dbgrid_lcl);
end;

procedure Tfrm_retifica.DBGrid4ColExit(Sender: TObject);
begin
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM' then
    if (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+ TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_ITEM').AsString +'" AND TP_ITEM = "1"', 'NM_ITEM') = '') and
       (TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_ITEM').AsString <> '')  then begin
      ShowMessage('Item Inválido ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;
end;

procedure Tfrm_retifica.DBGrid4DblClick(Sender: TObject);
begin
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcItem') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM')  then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
    TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString := ConsultaOnLineExFiltro('TITEM', 'Itens',['CD_ITEM', 'NM_ITEM'], ['Código','Item'],'CD_ITEM','TP_ITEM = "1"', nil, TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString);
  end;
end;

procedure Tfrm_retifica.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F5 then DBGrid4DblClick(Sender);
end;

procedure Tfrm_retifica.DBGrid6ColExit(Sender: TObject);
begin
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM' then
    if (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+ TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_ITEM').AsString +'" AND TP_ITEM = "1" ', 'NM_ITEM') = '')
      and (TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_ITEM').AsString <> '')  then begin
      ShowMessage('Item Inválido ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'CD_MOEDA' then
    if (ConsultaLookUPSQL('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+ TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_MOEDA').AsString +'"' , 'NM_MOEDA') = '')
      and (TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_MOEDA').AsString <> '')  then begin
      ShowMessage('Moeda Inválida ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;

    end;

end;

procedure Tfrm_retifica.DBGrid6DblClick(Sender: TObject);
begin
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcItem') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM') then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
    TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString := ConsultaOnLineExFiltro('TITEM', 'Itens',['CD_ITEM', 'NM_ITEM'], ['Código','Item'],'CD_ITEM','TP_ITEM = "1"', nil, TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString);
  end;
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcMoeda') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'CD_MOEDA') then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
    TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_MOEDA').AsString := ConsultaOnLineEx('TMOEDA_BROKER', 'Moedas',['CD_MOEDA', 'NM_MOEDA'], ['Código','Moeda'],'CD_MOEDA', nil, 1,  TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_MOEDA').AsString);
  end;
end;

procedure Tfrm_retifica.DBGrid6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F5 then DBGrid6DblClick(DBGrid6);
end;

procedure Tfrm_retifica.DBGrid5ColExit(Sender: TObject);
begin
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM' then
    if (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+ TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_ITEM').AsString +'" AND TP_ITEM = "1" ', 'NM_ITEM') = '')
      and (TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_ITEM').AsString <> '')  then begin
      ShowMessage('Item Inválido ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'CD_MOEDA_VENDA' then
    if (ConsultaLookUPSQL('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+ TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_MOEDA_VENDA').AsString +'"' , 'NM_MOEDA') = '')
      and (TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_MOEDA_VENDA').AsString <> '')  then begin
      ShowMessage('Moeda Inválida ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;

end;

procedure Tfrm_retifica.DBGrid5DblClick(Sender: TObject);
begin
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcItem') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM')  then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
      TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString := ConsultaOnLineExFiltro('TITEM', 'Itens',['CD_ITEM', 'NM_ITEM'], ['Código','Item'],'CD_ITEM','TP_ITEM = "1"', nil, TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString);
  end;
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcMoeda') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'CD_MOEDA_VENDA')  then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
      TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_MOEDA_VENDA').AsString := ConsultaOnLineEx('TMOEDA_BROKER', 'Moedas',['CD_MOEDA', 'NM_MOEDA'], ['Código','Moeda'],'CD_MOEDA', nil, 1,  TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_MOEDA_VENDA').AsString);
  end;
end;

procedure Tfrm_retifica.DBGrid5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F5 then DBGrid5DblClick(DBGrid5);
end;

end.

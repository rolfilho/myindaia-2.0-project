unit uGerarRemessa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids, ComCtrls, Buttons, ExtCtrls, DB,
  Menus, DBCGrids, DbTables;

type
  Tfrm_gerar_remessa = class(TForm)
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_incluir: TSpeedButton;
    MainMenu1: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    Panel_pesquisa: TPanel;
    btn_pesq: TSpeedButton;
    mi_sair: TMenuItem;
    mi_pesquisar: TMenuItem;
    btn_emissao_fat: TSpeedButton;
    mi_emissao: TMenuItem;
    pnl_grid: TPanel;
    grid_remessa: TDBGrid;
    edt_remessa: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    btn_co_agente: TSpeedButton;
    Label7: TLabel;
    btn_co_moeda: TSpeedButton;
    edt_nm_agente: TEdit;
    edt_nm_moeda: TEdit;
    msk_cd_agente: TMaskEdit;
    msk_cd_moeda: TMaskEdit;
    rdgp_via_transp: TRadioGroup;
    rdgrp_tp_processo: TRadioGroup;
    Panel1: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edt_vl_total: TEdit;
    edt_vl_real: TEdit;
    edt_vl_moeda: TMaskEdit;
    edt_vl_disp: TEdit;
    edt_nm_bco: TEdit;
    edt_cd_bco: TEdit;
    procedure btn_co_agenteClick(Sender: TObject);
    procedure msk_cd_agenteExit(Sender: TObject);
    procedure msk_cd_moedaExit(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_pesqClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure edt_vl_moedaExit(Sender: TObject);
    procedure btn_emissao_fatClick(Sender: TObject);
    procedure grid_remessaColEnter(Sender: TObject);
    procedure grid_remessaCellClick(Column: TColumn);
    procedure SaveBoolean();
    procedure grid_remessaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grid_remessaColExit(Sender: TObject);
    procedure abre_table;
    procedure FormShow(Sender: TObject);
    procedure msk_cd_agenteChange(Sender: TObject);
    procedure msk_cd_moedaChange(Sender: TObject);
    procedure msk_cd_moedaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    processo:array[1..100]of string[20];
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  public
      { Public declarations }
  end;

var
  frm_gerar_remessa: Tfrm_gerar_remessa;
  st_modificar, st_incluir, st_excluir: Boolean;
  FOriginalOptions : TDBGridOptions;



implementation

uses PGGP001, GSMLIB, dGerarRemessa, PGGP017, PGSM096, PGSM148, PGSM048, uAg, ConsOnLineEx, uEmissaoRemessa, Funcoes;

{$R *.DFM}


{ Tfrm_remessa }



procedure Tfrm_gerar_remessa.btn_co_agenteClick(Sender: TObject);

begin
{  vstr_cd_modulo := '22';
  str_cd_rotina := '2229';

  Application.CreateForm(Tfrm_ag, frm_ag);
   with frm_ag do
  begin
    lCons_OnLine       := True;
    Caption            := Caption + ' [Consulta On-Line]';
    tp_ag:=true;
    ShowModal;
    lCons_OnLine       := False;
  end;
  msk_cd_agente.Text   := frm_ag.Cons_OnLine_Texto;
 //str_cd_modulo        := '01';
 // str_cd_rotina        := '0102';

  msk_cd_agenteExit(nil); }

  if Sender is TSpeedButton then begin
    msk_cd_agente.Text := ConsultaOnlineEx('TAGENTE', 'Agentes', ['CD_AGENTE', 'NM_AGENTE'], ['Código', 'Descrição'], 'CD_AGENTE', nil, 1, msk_cd_agente.Text);
    msk_cd_agenteExit(nil);
  end else
    edt_nm_agente.Text := ConsultaLookUp('TAGENTE', 'CD_AGENTE', msk_cd_agente.Text, 'NM_AGENTE');

end;

procedure Tfrm_gerar_remessa.msk_cd_agenteExit(Sender: TObject);
begin
{  if msk_cd_agente.Text <> '' then
  begin
    ValCodEdt( msk_cd_agente );
    datm_gerar_remessa.qry_pesquisa_.Active:=false;
    datm_gerar_remessa.qry_pesquisa_.Sql.Clear;
    datm_gerar_remessa.qry_pesquisa_.Sql.Add('SELECT NM_AGENTE FROM TAGENTE WHERE CD_AGENTE="'+msk_cd_agente.Text+'"');
    datm_gerar_remessa.qry_pesquisa_.Sql.Add('AND TP_AG = "1"');
    datm_gerar_remessa.qry_pesquisa_.Active:=true;
    if datm_gerar_remessa.qry_pesquisa_.RecordCount > 0 then
    begin
      edt_nm_agente.text:= datm_gerar_remessa.qry_pesquisa_.Fields[0].AsString;
      datm_gerar_remessa.qry_pesquisa_.Close;
    end else begin
      datm_gerar_remessa.qry_pesquisa_.Close;
      edt_nm_agente.Text := '';
      BoxMensagem('Código do Agente inválido!', 2);
      msk_cd_agente.SetFocus;
      Exit;
    end;
  end else edt_nm_agente.Text := '';   }

  if msk_cd_agente.Text <> '' then begin
    msk_cd_agente.Text := Copy('0000', 1, 4 - Length( msk_cd_agente.Text)) +  msk_cd_agente.Text;
    edt_nm_agente.Text := ConsultaLookUp('TAGENTE', 'CD_AGENTE', msk_cd_agente.Text, 'NM_AGENTE');

    if edt_nm_agente.Text = '' then begin
      edt_nm_agente.Text := '';
      ShowMessage('Código do Agente inválido!');
      msk_cd_agente.SetFocus;
      Exit;
    end;
  end else
    edt_nm_agente.Text := '';        

end;

procedure Tfrm_gerar_remessa.msk_cd_moedaExit(Sender: TObject);
begin
{  if msk_cd_moeda.Text <> '' then
  begin
    ValCodEdt( msk_cd_moeda );
    datm_gerar_remessa.qry_pesquisa_.Active:=false;
    datm_gerar_remessa.qry_pesquisa_.Sql.Clear;
    datm_gerar_remessa.qry_pesquisa_.Sql.Add('SELECT AP_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA="'+msk_cd_moeda.Text+'"');
    datm_gerar_remessa.qry_pesquisa_.Active:=true;
    if datm_gerar_remessa.qry_pesquisa_.RecordCount > 0 then
    begin
      edt_nm_moeda.text:= datm_gerar_remessa.qry_pesquisa_.Fields[0].AsString;
      datm_gerar_remessa.qry_pesquisa_.Close;
    end else begin
      datm_gerar_remessa.qry_pesquisa_.Close;
      edt_nm_moeda.Text := '';
      BoxMensagem('Código da Moeda inválido!', 2);
      msk_cd_agente.SetFocus;
      Exit;
    end;
  end else edt_nm_moeda.Text := ''; }

  if msk_cd_moeda.Text <> '' then begin
    msk_cd_moeda.Text := Copy('000', 1, 3 - Length( msk_cd_moeda.Text)) +  msk_cd_moeda.Text;
    edt_nm_moeda.text := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', msk_cd_moeda.Text, 'AP_MOEDA');
    if edt_nm_moeda.text = '' then begin
      edt_nm_moeda.Text := '';
      ShowMessage('Código da Moeda inválido!');
      msk_cd_moeda.SetFocus;
      Exit;
    end;

  end else
    edt_nm_moeda.Text := '';

end;

procedure Tfrm_gerar_remessa.btn_co_moedaClick(Sender: TObject);
var
  moeda : string;
begin
  moeda:=ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA','AP_MOEDA'],['Código','Descrição','Sigla'],'CD_MOEDA');
  if moeda <>'' then
  begin
    msk_cd_moeda.text:=moeda;
    msk_cd_moedaExit(Sender);
  end;
end;

procedure Tfrm_gerar_remessa.FormCreate(Sender: TObject);
begin
   st_modificar:=false;
   st_incluir:=false;
   st_excluir:=false;
   AtribuiDireitos(st_modificar, st_incluir, st_excluir);
   Application.CreateForm(Tdatm_gerar_remessa, datm_gerar_remessa);
   if in_remessa  = '1' then
     begin
      rdgrp_tp_processo.Columns:=3;
      rdgrp_tp_processo.Items.Add('Remeter');
      rdgrp_tp_processo.Items.Add('Receber');
      rdgrp_tp_processo.Items.Add('Todos');
     end
   else
     begin
      rdgrp_tp_processo.Columns:=2;
      rdgrp_tp_processo.Items.Add('Remeter');
      rdgrp_tp_processo.Items.Add('Receber');
     end;

   datm_gerar_remessa.qry_disp_remessa_.Close;//O INDEXE DESSA TABELA DEVE ESTAR DECRESCENTE EM DT_DISP
  // datm_gerar_remessa.qry_disp_remessa_.ParamByname('DT_DISP').AsDate:= dt_server;
   datm_gerar_remessa.qry_disp_remessa_.Prepare;
   datm_gerar_remessa.qry_disp_remessa_.Open;

   datm_gerar_remessa.qry_banco_.Close;
   datm_gerar_remessa.qry_banco_.ParamByname('CD_BANCO').AsString:= datm_gerar_remessa.qry_disp_remessa_CD_BANCO.AsString;
   datm_gerar_remessa.qry_banco_.Prepare;
   datm_gerar_remessa.qry_banco_.Open;

   datm_gerar_remessa.qry_tt_saldo_disp_.Close;
   datm_gerar_remessa.qry_tt_saldo_disp_.Prepare;
   datm_gerar_remessa.qry_tt_saldo_disp_.Open;

   edt_cd_bco.text := datm_gerar_remessa.qry_disp_remessa_CD_BANCO.AsString;
   edt_nm_bco.text := datm_gerar_remessa.qry_banco_NM_BANCO.aSsTRING;
   edt_vl_disp.Text:= formatfloat('0.00',datm_gerar_remessa.qry_tt_saldo_disp_VL_DISP.AsFloat - datm_gerar_remessa.qry_tt_saldo_disp_VL_UTILIZADO.AsFloat );


   rdgrp_tp_processo.ItemIndex:=0;
   btn_mi(True,false,false,True)
end;

procedure Tfrm_gerar_remessa.btn_sairClick(Sender: TObject);
begin
Close;
end;

procedure Tfrm_gerar_remessa.btn_pesqClick(Sender: TObject);
begin
  edt_vl_total.Text := '0,00';
  edt_vl_moeda.Text := '0,000000';
  edt_vl_real.Text  := '0,00';
  if (msk_cd_agente.text = '' ) or (msk_cd_moeda.text = '') then
//  begin
//    BoxMensagem('São campos Obrigatórios para Pesquisa "Agente" e "Moeda" ',2);
    Exit;
//  end;
  //busca o cambio para a moeda informada
  with TQuery.Create(Application)do
  begin
    DatabaseName:='DBBROKER';
    Sql.Clear;
    Sql.Add('SELECT VL_TAXA FROM TTAXA_FRETE WHERE CD_MOEDA = :CD_MOEDA AND DT_INICIO=:DT_INICIO');
    Params[0].AsString:= msk_cd_moeda.text;
    Params[1].AsDateTime:= dt_server;
    Open;
    if recordcount > 0 then
      edt_vl_moeda.text:=formatfloat('0.000000',Fields[0].AsFloat);
    Free;
  end;

  abre_table;

  if edt_vl_moeda.text = '0.000000' then
    Boxmensagem('Não existe taxa de cambio para a moeda na data corrente!',2);
  if datm_gerar_remessa.qry_processo_faturas_.RecordCount = 0 then
    grid_remessa.Enabled:= false
  else grid_remessa.Enabled:=true;
end;

procedure Tfrm_gerar_remessa.btn_incluirClick(Sender: TObject);
begin
  datm_gerar_remessa.qry_processo_faturas_.Close;
//  msk_cd_agente.Enabled    := true;
//  btn_co_agente.Enabled    := true;
//  msk_cd_moeda.Enabled     := true;
//  btn_co_moeda.Enabled     := true;
  edt_vl_total.Enabled      := true;
  edt_vl_moeda.Enabled      := true;
  edt_vl_real.Enabled       := true;
  rdgrp_tp_processo.Enabled := true;
  rdgp_via_transp.Enabled   := true;
  msk_cd_agente.Enabled     := true;
  msk_cd_moeda.Enabled      := true;
  btn_co_agente.Enabled     := true;
  btn_co_moeda.Enabled      := true;
  msk_cd_agente.text        := '';
  edt_nm_agente.text        := '';
  msk_cd_moeda.text         := '';
  edt_nm_moeda.text         := '';
  edt_remessa.text          := ' ';
  edt_vl_total.text         := '0,00';
  edt_vl_moeda.text         := '0,000000';
  edt_vl_real.text          := '0,00';
  msk_cd_agente.SetFocus;
  btn_mi(false,True,True,false);                                                   
end;

procedure Tfrm_gerar_remessa.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled := Inc ;  mi_incluir.Enabled   := Inc ;  btn_salvar.Enabled   := Salv;
  mi_salvar.Enabled   := Salv;  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_gerar_remessa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
datm_gerar_remessa.qry_processo_faturas_.Close;
datm_gerar_remessa.Free;
end;

procedure Tfrm_gerar_remessa.btn_cancelarClick(Sender: TObject);
begin
    datm_gerar_remessa.qry_processo_faturas_.Close;
    msk_cd_agente.text:='';
    edt_nm_agente.text:='';
    msk_cd_moeda.text:='';
    edt_nm_moeda.text:='';


    edt_remessa.text:=' ';
    edt_vl_total.text:='0,00';
    edt_vl_moeda.text:='0,000000';
    edt_vl_real.text:='0,00';

//    msk_cd_agente.Enabled:=false;
//    btn_co_agente.Enabled:=false;
//    msk_cd_moeda.Enabled:=false;
//    btn_co_moeda.Enabled:=false;

    edt_vl_total.Enabled:=false;
    edt_vl_moeda.Enabled:=false;
    edt_vl_real.Enabled:=false;

    rdgrp_tp_processo.Enabled := false;
    rdgp_via_transp.Enabled   := false;
    grid_remessa.Enabled      := false;

    msk_cd_agente.Enabled := False;
    msk_cd_moeda.Enabled := False;
    btn_co_agente.Enabled := False;
    btn_co_moeda.Enabled := False;

    btn_mi(True,false,false,True);

end;

procedure Tfrm_gerar_remessa.btn_salvarClick(Sender: TObject);
var I, J, Pagina, linha, Qtde_linha:integer;
  REMESSA:TQuery;
  via_transp:String[2];
begin
  datm_gerar_remessa.qry_tt_saldo_disp_.Close;
  datm_gerar_remessa.qry_tt_saldo_disp_.Prepare;
  datm_gerar_remessa.qry_tt_saldo_disp_.Open;
  edt_vl_disp.Text:= formatfloat('0.00',datm_gerar_remessa.qry_tt_saldo_disp_VL_DISP.AsFloat - datm_gerar_remessa.qry_tt_saldo_disp_VL_UTILIZADO.AsFloat );
  if rdgrp_tp_processo.ItemIndex = 0 then // a remeter
    Qtde_linha := 30;
  if rdgrp_tp_processo.ItemIndex = 1 then // a receber
    Qtde_linha := 45;
  if rdgp_via_transp.ItemIndex = 0 then
    via_transp := '04' // aérea
  else via_transp := '01'; // maritima

//  if strtofloat(edt_vl_real.text) > strtofloat(edt_vl_disp.text) then
//  begin
//    Boxmensagem('O Valor disponibilizado é inferior ao total da Remessa!',2);
//    Exit;
//  end;
  if strtofloat(edt_vl_real.text) <= 0  then
  begin
    Boxmensagem('O Valor Total em Reais não esta totalizado!',2);
    Exit;
  end;
  if edt_cd_bco.text = '' then
  begin
    Boxmensagem('Não existe um Banco para efetuar Remessa!',2);
    Exit;
  end;
  I:=0;
  //verifica se existe processos selecionados
  datm_gerar_remessa.qry_processo_faturas_.First;
  while Not(datm_gerar_remessa.qry_processo_faturas_.EOF) do
  begin
    if datm_gerar_remessa.qry_processo_faturas_IN_SELECIONADO.AsString = '1' then
    begin
      I:=I + 1;
      processo[I]:=datm_gerar_remessa.qry_processo_faturas_NR_PROCESSO.AsString;
    end;
    datm_gerar_remessa.qry_processo_faturas_.Next;
  end;
  if I = 0 then
  begin
    BoxMensagem('Não Existe Processos Selecionados!',2);
    Exit;
  end;
  try
    if not datm_main.db_broker.InTransaction then
      datm_main.db_broker.StartTransaction;
    with TQuery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT MAX(NR_REMESSA) FROM TREMESSA');
      Open;
      if (Fields[0].AsString = '')  then
        edt_remessa.text :='0001/'+ copy(DateToStr(dt_server),9,10)
      else edt_remessa.text :=formatfloat('0000', strtofloat(copy(Fields[0].AsString,1,4)) + 1)+'/'+ copy(DateToStr(dt_server),9,10);
      Free;
    end;
    REMESSA:=TQuery.Create(Application);
    REMESSA.DataBaseName:='DBBROKER';
    REMESSA.Sql.Clear;
    REMESSA.Sql.Add('INSERT INTO TREMESSA (NR_REMESSA, CD_AGENTE, CD_MOEDA, IN_EMISSAO, VL_TOTAL, VL_MOEDA,');
    REMESSA.Sql.Add(' VL_TOTAL_REAL, DT_REMESSA, VL_BANCO, VL_CORRETORA, CD_BANCO, CD_VIA_TRANSP ) ');
    REMESSA.Sql.Add('VALUES (:NR_REMESSA, :CD_AGENTE, :CD_MOEDA, :IN_EMISSAO, :VL_TOTAL, :VL_MOEDA,');
    REMESSA.Sql.Add(':VL_TOTAL_REAL, :DT_REMESSA, :VL_BANCO, :VL_CORRETORA, :CD_BANCO, :CD_VIA_TRANSP)');
    REMESSA.Params[0].AsString  := edt_remessa.text;
    REMESSA.Params[1].AsString  := msk_cd_agente.text;
    REMESSA.Params[2].AsString  := msk_cd_moeda.text;
    REMESSA.Params[3].AsString  := '0';
    REMESSA.Params[4].AsFloat   := strtofloat(edt_vl_total.text);
    REMESSA.Params[5].AsFloat   := strtofloat(edt_vl_moeda.text);
    REMESSA.Params[6].AsFloat   := strtofloat(edt_vl_real.text);
    REMESSA.Params[7].AsDAteTime:= dt_server;
    REMESSA.Params[8].AsFloat   := vl_custo_mov_bancario;
    REMESSA.Params[9].AsFloat   := vl_custo_corretora;
    REMESSA.Params[10].AsString := edt_cd_bco.text;
    REMESSA.Params[11].AsString := via_transp;
    REMESSA.ExecSql;
    Pagina := 1;
    linha  := 1;
    REMESSA.Close;
    for J := 1 to I do
    begin
      if processo[J] <> '' then
      begin
        REMESSA.Sql.Clear;
        REMESSA.Sql.Add(' INSERT INTO TREMESSA_PROCESSO (NR_REMESSA, NR_PROCESSO, NR_LINHA, NR_PAGINA)');
        REMESSA.Sql.Add(' VALUES (:NR_REMESSA, :NR_PROCESSO,:NR_LINHA,:NR_PAGINA)');
        REMESSA.Params[0].AsString := edt_remessa.text;
        REMESSA.Params[1].AsString := processo[J];
        if Linha > Qtde_linha then
          Pagina := pagina + 1;
        REMESSA.Params[2].AsInteger:= Linha;
        REMESSA.Params[3].AsInteger:= Pagina;
        REMESSA.ExecSql;
        REMESSA.Sql.Clear;
        REMESSA.Sql.Add(' UPDATE TPROCESSO_FATURA_AG SET IN_FATURA = "5" ');
        REMESSA.Sql.Add(' WHERE NR_PROCESSO = :NR_PROCESSO ');
        REMESSA.Sql.Add(' AND IN_FATURA IN ("3", "4") ');
        REMESSA.Params[0].AsString := processo[J];
        REMESSA.ExecSql;
        REMESSA.Close;
        Linha := Linha + 1 ;
      end;
    end;
    REMESSA.Free;
    if not(rdgrp_tp_processo.Itemindex = 1) then
    begin
      if not (datm_gerar_remessa.qry_disp_remessa_.State in [dsEdit]) then
        datm_gerar_remessa.qry_disp_remessa_.Edit;
      datm_gerar_remessa.qry_disp_remessa_VL_UTILIZADO.AsFloat := strtofloat(edt_vl_real.text);
      datm_gerar_remessa.qry_disp_remessa_.Post;
      datm_gerar_remessa.qry_tt_saldo_disp_.Close;
      datm_gerar_remessa.qry_tt_saldo_disp_.Prepare;
      datm_gerar_remessa.qry_tt_saldo_disp_.Open;
      edt_vl_disp.Text:= formatfloat('0.00',datm_gerar_remessa.qry_tt_saldo_disp_VL_DISP.AsFloat - datm_gerar_remessa.qry_tt_saldo_disp_VL_UTILIZADO.AsFloat );
    end;
    datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        edt_remessa.text:='';
        TrataErro(E);
        exit;
      end;
  end;
  btn_mi(True,false,false,True);
  edt_vl_total.Enabled:=false;
  edt_vl_moeda.Enabled:=false;
  edt_vl_real.Enabled:=false;
  rdgrp_tp_processo.Enabled :=false;
  rdgp_via_transp.Enabled   := false;
  grid_remessa.Enabled:=false;
  msk_cd_agente.Enabled := False;
  msk_cd_moeda.Enabled := False;
  btn_co_agente.Enabled := False;
  btn_co_moeda.Enabled := False;
end;

procedure Tfrm_gerar_remessa.edt_vl_moedaExit(Sender: TObject);
begin
  edt_vl_real.text:= FormatFloat('0.00',ABS(strtofloat(edt_vl_total.text) * strtofloat(edt_vl_moeda.text)));
end;

procedure Tfrm_gerar_remessa.btn_emissao_fatClick(Sender: TObject);
begin
  vstr_cd_modulo := '33';
  str_cd_rotina := '3304';
  Application.CreateForm(Tfrm_emissao_remessa, frm_emissao_remessa);
  frm_emissao_remessa.ShowModal;
  vstr_cd_modulo := '33';
  str_cd_rotina := '3303';
end;

procedure Tfrm_gerar_remessa.grid_remessaColEnter(Sender: TObject);
begin

 if  grid_remessa.SelectedIndex = 0 then
 //if grid_remessa.SelectedField.DataType = ftBoolean then
 begin
  FOriginalOptions := grid_remessa.Options;
  grid_remessa.Options := grid_remessa.Options - [dgEditing];
 end;
end;

procedure Tfrm_gerar_remessa.grid_remessaCellClick(Column: TColumn);
begin
 if grid_remessa.SelectedIndex = 0  then
 //if grid_remessa.SelectedField.DataType = ftBoolean then
     SaveBoolean();
 grid_remessa.Repaint;
end;

procedure Tfrm_gerar_remessa.SaveBoolean;
var
  REMESSA:Tquery;
  nr_processo:String[20];
  in_selecionado:String[1];
begin
  nr_processo := datm_gerar_remessa.qry_processo_faturas_NR_PROCESSO.AsString;
 //grid_remessa.SelectedField.Dataset.Edit;
 {if not(datm_gerar_remessa.qry_processo_faturas_.State in [dsEdit])then
   datm_gerar_remessa.qry_processo_faturas_.Edit;
 }
 if datm_gerar_remessa.qry_processo_faturas_IN_SELECIONADO.AsString = '0' then
  in_selecionado:='1'
 else in_selecionado:= '0' ;

 //datm_gerar_remessa.qry_processo_faturas_.Post;


  REMESSA:= Tquery.Create(Application);
  REMESSA.DataBaseName := 'DBBROKER';
  REMESSA.Sql.Add(' UPDATE TPROCESSO_FATURA_AG SET IN_SELECIONADO = "'+in_selecionado+'" ');
  REMESSA.Sql.Add(' WHERE NR_PROCESSO = "'+nr_processo+'"');
  REMESSA.ExecSql;
  REMESSA.Free;

  abre_table;
  datm_gerar_remessa.qry_processo_faturas_.Locate('NR_PROCESSO', nr_processo, [loCaseInsensitive, loPartialKey]);
end;

procedure Tfrm_gerar_remessa.grid_remessaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Const

 CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,

     DFCS_BUTTONCHECK or DFCS_CHECKED);

var

 CheckBoxRectangle : TRect;
 ctrl_booleano :Boolean;

begin

 if  Column.FieldName = 'IN_SELECIONADO' then

// if Column.Field.DataType = ftBoolean then

 begin
 if datm_gerar_remessa.qry_processo_faturas_IN_SELECIONADO.AsString = '0' then
   ctrl_booleano :=false
 else ctrl_booleano:= true;



 grid_remessa.Canvas.FillRect(Rect);

 CheckBoxRectangle.Left := Rect.Left + 2;

 CheckBoxRectangle.Right := Rect.Right - 2;

 CheckBoxRectangle.Top := Rect.Top + 2;

 CheckBoxRectangle.Bottom := Rect.Bottom - 2;

 DrawFrameControl(grid_remessa.Canvas.Handle,

      CheckBoxRectangle,

      DFC_BUTTON,

      CtrlState[ctrl_booleano]);

 end;


end;

procedure Tfrm_gerar_remessa.grid_remessaColExit(Sender: TObject);
begin

// if  grid_remessa.SelectedIndex = 0 then
 //if grid_remessa.SelectedField.DataType = ftBoolean then

//  grid_remessa.Options := FOriginalOptions;
end;

procedure Tfrm_gerar_remessa.abre_table;
var
  cd_via_transp : String[2];
begin
  if rdgp_via_transp.ItemIndex = 0  then
    cd_via_transp := '04'
  else cd_via_transp := '01';
  datm_gerar_remessa.vl_calc_tt_account := 0;
  datm_gerar_remessa.qry_processo_faturas_.Close;
  if rdgrp_tp_processo.ItemIndex = 0  then
    datm_gerar_remessa.qry_processo_faturas_.Sql[10]:=' AND F.IN_FATURA = "3"  ';
  if rdgrp_tp_processo.ItemIndex = 1  then
    datm_gerar_remessa.qry_processo_faturas_.Sql[10]:=' AND F.IN_FATURA = "4" ';
  if rdgrp_tp_processo.ItemIndex = 2  then
    datm_gerar_remessa.qry_processo_faturas_.Sql[10]:=' AND F.IN_FATURA IN("3","4") ';
  datm_gerar_remessa.qry_processo_faturas_.ParamByName('CD_AGENTE').AsSTRING     := msk_cd_agente.text;
  datm_gerar_remessa.qry_processo_faturas_.ParamByName('CD_MOEDA').AsSTRING      := msk_cd_moeda.text;
  datm_gerar_remessa.qry_processo_faturas_.ParamByName('CD_VIA_TRANSP').AsSTRING := cd_via_transp;
  datm_gerar_remessa.qry_processo_faturas_.Prepare;
  datm_gerar_remessa.qry_processo_faturas_.Open;
  edt_vl_total.text:=formatfloat('0.00',datm_gerar_remessa.vl_calc_tt_account);
  edt_vl_real.text:= FormatFloat('0.00',ABS(datm_gerar_remessa.vl_calc_tt_account * strtofloat(edt_vl_moeda.text)));
end;

procedure Tfrm_gerar_remessa.FormShow(Sender: TObject);
begin
  Panel1.Color := clPnlClaroBroker;
  edt_vl_total.Enabled:=false;
  edt_vl_moeda.Enabled:=false;
  edt_vl_real.Enabled:=false;
  rdgrp_tp_processo.Enabled :=false;
  rdgp_via_transp.Enabled   := false;
  grid_remessa.Enabled:=false;
  msk_cd_agente.Enabled := False;
  msk_cd_moeda.Enabled := False;
  btn_co_agente.Enabled := False;
  btn_co_moeda.Enabled := False;
end;

procedure Tfrm_gerar_remessa.msk_cd_agenteChange(Sender: TObject);
begin
  btn_co_agenteClick(nil);
  btn_pesqClick(nil);
end;

procedure Tfrm_gerar_remessa.msk_cd_moedaChange(Sender: TObject);
begin
  btn_pesqClick(nil);
end;

procedure Tfrm_gerar_remessa.msk_cd_moedaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_F5 then begin
   if Sender = msk_cd_moeda then btn_co_moedaClick(btn_co_moeda);
   if Sender = msk_cd_agente then btn_co_agenteClick(btn_co_agente);   
 end;
end;

procedure Tfrm_gerar_remessa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

end.

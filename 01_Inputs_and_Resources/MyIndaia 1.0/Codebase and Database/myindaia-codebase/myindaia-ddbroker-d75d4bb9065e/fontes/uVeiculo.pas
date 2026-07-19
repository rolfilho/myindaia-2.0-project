unit uVeiculo;
(*******************************************************************************
SISTEMA: Broker - Cargo
PROGRAMA: PGSM247.PAS - frm_veiculo
AUTOR: Paulo do Amaral Costa
DATA: 21/06/2002
MANUTENÇÃO:
DATA: 21/06/2002 - ADBC-0007 - Ecotrans
********************************************************************************)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, PGGP001, RXDBCtrl, Funcoes;

type
  Tfrm_veiculo = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_frete: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    dbg_cadastro: TDBGrid;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label3: TLabel;
    dbedt_cd_veiculo: TDBEdit;
    Label4: TLabel;
    dbedt_nm_veiculo: TDBEdit;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    Label8: TLabel;
    dbedt_irin: TDBEdit;
    dbedt_look_nm_bandeira: TDBEdit;
    dbedt_cd_bandeira: TDBEdit;
    Label5: TLabel;
    btn_co_cd_bandeira: TSpeedButton;
    Label18: TLabel;
    dbg_veiculo_rota: TDBGrid;
    ts_armador: TTabSheet;
    Label13: TLabel;
    btn_co_cd_armador: TSpeedButton;
    dbedt_cd_armador: TDBEdit;
    dbedt_nm_armador: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_nm_veiculoChange(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure pgctrl_freteChange(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_cd_armadorClick(Sender: TObject);
    procedure dbedt_cd_armadorExit(Sender: TObject);
    procedure pgctrl_freteChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbedt_cd_armadorKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure btn_co_cd_bandeiraClick(Sender: TObject);
    procedure dbedt_cd_bandeiraExit(Sender: TObject);
    procedure dbg_veiculo_rotaEnter(Sender: TObject);
    procedure executa_consulta;
    procedure dbedt_cd_armadorChange(Sender: TObject);

  private
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;

  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_veiculo: Tfrm_veiculo;
  BookMark : TBookMark;
  st_origem,st_destino:string;
implementation

uses GSMLIB, PGGP017, dVeiculo, PGSM210, PGSM249, PGSM019;

{$R *.DFM}

procedure Tfrm_veiculo.btn_sairClick(Sender: TObject);
begin
  //if Not VerAlt then Exit;  by Paulo - coloquei no onclosequery
  Close;
end;

procedure Tfrm_veiculo.btn_incluirClick(Sender: TObject);
begin
      dbnvg.Enabled := False;
      edt_chave.Enabled := False;
      cb_ordem.Enabled := False;

if (pgctrl_frete.ActivePage = ts_dados_basicos) or  (pgctrl_frete.ActivePage = ts_lista)then
   begin
     pgctrl_frete.ActivePage := ts_dados_basicos;
     with datm_veiculo do
      begin
      qry_veiculo_.Cancel;
      qry_veiculo_.Append;
     end;

      dbedt_nm_veiculo.SetFocus;  
   end;
if pgctrl_frete.ActivePage = ts_armador then
  begin
     with datm_veiculo do
      begin
      qry_veiculo_armador_.Cancel;
      qry_veiculo_armador_.Append;
      qry_veiculo_armador_CD_VEICULO.AsString:=qry_veiculo_CD_EMBARCACAO.AsString;
     end;



  end;
      btn_mi(false,st_modificar, st_modificar, false);

end;

procedure Tfrm_veiculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //if Not VerAlt then Exit;
  datm_veiculo.qry_veiculo_.Close;
  datm_veiculo.qry_veiculo_rota_.Close;
  datm_veiculo.Free;
  Action := caFree;
end;

procedure Tfrm_veiculo.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
//    try
//      Cons_OnLine.AsString := datm_veiculo.qry_veiculo_CD_EMBARCACAO.AsString;
//    except
      try
        Cons_OnLine_Texto := datm_veiculo.qry_veiculo_CD_EMBARCACAO.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código da Embarcação !', 2);
      end;
//    end;
    Close;
  end;
end;

procedure Tfrm_veiculo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 27 then Close;
  If Key = 13 then
  begin
    dbg_cadastroDblClick(Sender);
  end;
end;

procedure Tfrm_veiculo.FormCreate(Sender: TObject);
begin
  { Cria o DataModule de Frete }

  Application.CreateForm(Tdatm_veiculo, datm_veiculo );
  st_origem:='';
  st_destino:='';

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_veiculo do
  begin

    qry_veiculo_.Close;
    qry_veiculo_.SQL[3] := 'NM_EMBARCACAO';
    //qry_veiculo_.Prepare;
    qry_veiculo_.Open;

    qry_veiculo_rota_.Close;
    qry_veiculo_rota_.Prepare;
    qry_veiculo_rota_.Open;

  end;

  a_str_indices[0] := 'CD_EMBARCACAO';
  a_str_indices[1] := 'NM_EMBARCACAO';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

//  vStr_cd_modulo:='23';
//  str_cd_rotina:='2301';

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_veiculo.ds_veiculo.AutoEdit := st_modificar;
  datm_veiculo.ds_veiculo_rota.AutoEdit := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;
end;

procedure Tfrm_veiculo.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este veículo será excluído! Confirma exclusão?', 1 ) Then
  begin
    try
      Screen.Cursor := crHourGlass;
      datm_main.db_broker.StartTransaction;  //inicia transação (deleções)
      //**início deleção registros nas tabela filha (TVEICULO_ROTA)**
      datm_veiculo.lmensa_delete:=false;
      with datm_veiculo.qry_veiculo_rota_ do
      begin
        if not IsEmpty then
        begin
          while not EOF do
          begin
            Delete;
          end;
        end;
      end;
      datm_veiculo.lmensa_delete:=true;
      //**fim deleção registro na tabela filha**
      datm_veiculo.qry_veiculo_.Delete; //DELETA VEÍCULO (registro atual do cadastro de veículos)
      datm_main.db_broker.Commit;       //commita a transação (todas as deleções efetivadas)
      Screen.Cursor := crArrow;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_veiculo.qry_veiculo_.cancel;
        TrataErro(E);
        datm_veiculo.lmensa_delete:=true;
      end;
    end;
    Pesquisa := datm_veiculo.qry_veiculo_CD_EMBARCACAO.AsString;
    Localiza(datm_veiculo.qry_veiculo_, Pesquisa, a_str_indices[0] );
    pgctrl_frete.ActivePage := ts_lista;
  end;
end;

procedure Tfrm_veiculo.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_veiculo.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_veiculo.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_veiculo.qry_veiculo_CD_EMBARCACAO.AsString;
  edt_chave.Text := '';
  datm_veiculo.qry_veiculo_.DisableControls;
  datm_veiculo.qry_veiculo_.Close;
  datm_veiculo.qry_veiculo_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  datm_veiculo.qry_veiculo_.Open;
  datm_veiculo.qry_veiculo_.EnableControls;
  Localiza(datm_veiculo.qry_veiculo_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_veiculo.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_veiculo.qry_veiculo_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_veiculo.FormShow(Sender: TObject);
begin
  pgctrl_frete.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_veiculo.dbedt_nm_veiculoChange(Sender: TObject);
begin
  If ( datm_veiculo.qry_veiculo_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_veiculo.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

function Tfrm_veiculo.Consiste : Boolean;
begin
  Consiste:=True;
  if (pgctrl_frete.ActivePage=ts_dados_basicos) then
  begin
    if dbedt_nm_veiculo.Text = '' then
    begin
      BoxMensagem('Campo Descrição deve ser preenchido!', 2);
      pgctrl_frete.ActivePage := ts_dados_basicos;
      Consiste := False;
      dbedt_nm_veiculo.SetFocus;
      Exit;
    end;
   if dbedt_cd_bandeira.Text = '' then
    begin
      BoxMensagem('Campo Bandeira deve ser preenchido!', 2);
      pgctrl_frete.ActivePage := ts_dados_basicos;
      dbedt_cd_bandeira.SetFocus;
      Consiste := False;
      Exit;
    end;
    if Not ( datm_veiculo.qry_veiculo_.State in [dsEdit, dsInsert] ) then Exit;
    ValidCodigo( dbedt_cd_bandeira );
    if dbedt_cd_bandeira.Text <> '' then
    begin
      if dbedt_look_nm_bandeira.Text = '' then
      begin
        BoxMensagem('Código da Bandeira inválido!',2);
        pgctrl_frete.ActivePage := ts_dados_basicos;
        dbedt_cd_bandeira.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

  end;
  if (pgctrl_frete.ActivePage=ts_armador) then
  begin
    if dbedt_cd_armador.Text = '' then
    begin
      BoxMensagem('Campo Armador deve ser preenchido!', 2);
      dbedt_cd_armador.SetFocus;
      Consiste := False;
      Exit;
    end;

  end;
end;

function Tfrm_veiculo.Grava : Boolean;
begin
 if pgctrl_frete.ActivePage = ts_dados_basicos then
  begin
    try
     datm_main.db_broker.StartTransaction;
     if ( datm_veiculo.qry_veiculo_.State in [dsInsert, dsEdit] ) then
         datm_veiculo.qry_veiculo_.Post;
     datm_main.db_broker.Commit;
      Grava := True;
     except
      on E: Exception do
       begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
         datm_veiculo.qry_veiculo_.cancel;
         TrataErro(E);
         Grava := False;
       end;
     end;
   end;

 if pgctrl_frete.ActivePage = ts_armador then
   begin
     try
     datm_main.db_broker.StartTransaction;
     if ( datm_veiculo.qry_veiculo_armador_.State in [dsInsert, dsEdit] ) then
         datm_veiculo.qry_veiculo_armador_.Post;
     datm_main.db_broker.Commit;
      Grava := True;
     except
      on E: Exception do
       begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
         datm_veiculo.qry_veiculo_armador_.cancel;
         TrataErro(E);
         Grava := False;
       end;
     end;


   end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_veiculo.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_veiculo.qry_veiculo_.State in [dsEdit] ) and st_modificar ) or
     ( datm_veiculo.qry_veiculo_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Veículo foi alterado.' + #13#10 +
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


   if ( ( datm_veiculo.qry_veiculo_Armador_.State in [dsEdit] ) and st_modificar ) or
     ( datm_veiculo.qry_veiculo_Armador_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Os Dados do Armador foram alterados.' + #13#10 +
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

procedure Tfrm_veiculo.Cancelar;
begin
  try
    if datm_veiculo.qry_veiculo_.State in [dsInsert, dsEdit] then
      datm_veiculo.qry_veiculo_.Cancel;

    if datm_veiculo.qry_veiculo_Armador_.State in [dsInsert, dsEdit] then
      datm_veiculo.qry_veiculo_Armador_.Cancel;

  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_veiculo.pgctrl_freteChange(Sender: TObject);
begin

  if (pgctrl_frete.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled := True;
  end
  else
  begin
    dbnvg.Enabled := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
  end;

   if pgctrl_frete.ActivePage = ts_armador then
      begin
         datm_veiculo.qry_veiculo_armador_.close;
         datm_veiculo.qry_veiculo_armador_.ParamByName('CD_VEICULO').AsString:=datm_veiculo.qry_veiculo_CD_EMBARCACAO.AsString;
         datm_veiculo.qry_veiculo_armador_.Prepare;
         datm_veiculo.qry_veiculo_armador_.Open;
         dbnvg.datasource:=datm_veiculo.ds_veiculo_armador;
      end




end;

procedure Tfrm_veiculo.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_veiculo.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_veiculo.btn_co_cd_armadorClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2207';
  Application.CreateForm(Tfrm_Transportador_itl, frm_Transportador_itl);
  with frm_Transportador_itl Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    In_maritima:=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2269';
  if (frm_Transportador_itl.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_veiculo.qry_veiculo_armador_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
     begin
       datm_veiculo.qry_veiculo_armador_.Edit;
     end;
     datm_veiculo.qry_veiculo_armador_CD_ARMADOR.Value:=frm_Transportador_itl.Cons_OnLine_Texto;
    dbedt_cd_armador.SetFocus;
    dbedt_cd_armadorExit(Sender);
  end;

end;

procedure Tfrm_veiculo.dbedt_cd_armadorExit(Sender: TObject);
begin
 with datm_veiculo do
  begin
   if not(qry_veiculo_armador_.State in [dsEdit,dsInsert]) then exit;
   if dbedt_cd_armador.Text <> '' then
     begin
       ValidCodigo( dbedt_cd_armador );
       with TQuery.Create(Application) do //verifica se já existe algum relacionamento
         begin
           dataBaseName:='DBBROKER';
           Sql.Clear;
           Sql.Add('SELECT COUNT(*) FROM TVEICULO_ARMADOR WHERE CD_VEICULO = "'+qry_veiculo_CD_EMBARCACAO.AsString+'"');
           Sql.Add(' AND CD_ARMADOR="'+dbedt_cd_armador.text+'"');
           Open;
            if Fields[0].AsInteger > 0 then
              begin
               BoxMensagem('Este Armador já está relacionado!',2);
               dbedt_cd_armador.SetFocus;
               Free;
               Exit;
              end
            else
              begin
               Close;
               Sql.Clear;
               Sql.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL ');
               Sql.Add(' WHERE CODIGO = "'+dbedt_cd_armador.Text+'"');
               Open;
               if recordCount > 0 then
                begin
                 qry_veiculo_armador_NM_ARMADOR.AsString := fields[0].AsString;
                 Free;
                end
                else
                  begin
                   dbedt_nm_armador.Text := '';
                   BoxMensagem('Código do Armador inválido!', 2);
                   dbedt_cd_armador .SetFocus;
                   Free;
                   Exit;
                  end;
              end;
        end;//with
     end
   else  dbedt_nm_armador.Text := '';
 end;

end;

procedure Tfrm_veiculo.pgctrl_freteChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_veiculo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  VerAlt;
end;

procedure Tfrm_veiculo.dbedt_cd_armadorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_armador   then btn_co_cd_armadorClick(nil);
    if Sender = dbedt_cd_bandeira  then btn_co_cd_bandeiraClick(nil);
  end;
end;

procedure Tfrm_veiculo.btn_co_cd_bandeiraClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_pais, frm_pais);
  with frm_pais Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_pais.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_veiculo.qry_veiculo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_veiculo.qry_veiculo_.Edit;
    datm_veiculo.qry_veiculo_CD_BANDEIRA.Value:=frm_pais.Cons_OnLine_Texto;
    dbedt_cd_bandeira.SetFocus;
  end;
  dbedt_cd_bandeiraExit(Sender);
end;

procedure Tfrm_veiculo.dbedt_cd_bandeiraExit(Sender: TObject);
begin
  if Not ( datm_veiculo.qry_veiculo_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_bandeira );
  if dbedt_cd_bandeira.Text <> '' then
  begin
    if dbedt_look_nm_bandeira.Text = '' then
    begin
      BoxMensagem('Código da Bandeira inválido!',2);
      pgctrl_frete.ActivePage := ts_dados_basicos;
      dbedt_cd_bandeira.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_veiculo.dbg_veiculo_rotaEnter(Sender: TObject);
begin
//  VerAlt;
end;

procedure Tfrm_veiculo.executa_consulta;
begin
if (st_origem <> '') and (st_destino <>'') then
 begin
  with datm_veiculo do
   begin
   qry_veiculo_.Active:=false;
   qry_veiculo_.Sql.Clear;
   qry_veiculo_.Sql.Add('SELECT * FROM TEMBARCACAO AS TV, TVEICULO_ROTA AS TVR ');
   qry_veiculo_.Sql.Add('WHERE TV.CD_EMBARCACAO = TVR.CD_VEICULO AND');
   qry_veiculo_.Sql.Add('TVR.CD_ORIGEM = "'+st_origem+'" AND TVR.CD_DESTINO ="'+st_destino+'"');
   qry_veiculo_.Sql.Add('ORDER BY TV.NM_VEICULO');
   qry_veiculo_.Active:=true;
   end;
 end;
end;

procedure Tfrm_veiculo.dbedt_cd_armadorChange(Sender: TObject);
begin
if datm_veiculo.qry_veiculo_armador_.State in [dsEdit,dsInsert] then
  btn_mi(false,st_modificar, st_modificar, false);
end;

end.

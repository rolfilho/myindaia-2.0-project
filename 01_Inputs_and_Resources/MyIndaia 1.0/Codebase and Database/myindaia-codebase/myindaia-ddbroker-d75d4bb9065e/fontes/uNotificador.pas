unit uNotificador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ComCtrls, StdCtrls, DBCtrls, Buttons, ExtCtrls, Menus,
  RxDBComb, Mask,DB, DBTables;

type
  Tfrm_notificador = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_notificador: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    MainMenu1: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    DBEdit1: TDBEdit;
    dbedt_nm_notificador: TDBEdit;
    DBEdit3: TDBEdit;
    dbedt_cd_pais: TDBEdit;
    dbedt_cd_cidade: TDBEdit;
    dbedt_nm_cidade: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dbedt_nm_pais: TDBEdit;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    ts_armadores: TTabSheet;
    DBGrid2: TDBGrid;
    btn_co_inst: TSpeedButton;
    btn_co_pais: TSpeedButton;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    dbedt_cd_armador: TDBEdit;
    dbedt_nm_armador: TDBEdit;
    btn_co_armador: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dbedt_cgc_notificador: TDBEdit;
    Label17: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbedt_nm_notificadorChange(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_co_instClick(Sender: TObject);
    procedure dbedt_cd_cidadeExit(Sender: TObject);
    procedure dbedt_cd_paisExit(Sender: TObject);
    procedure dbedt_cd_paisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_paisClick(Sender: TObject);
    procedure btn_co_armadorClick(Sender: TObject);
    procedure dbedt_cd_armadorExit(Sender: TObject);
    procedure pgctrl_notificadorChange(Sender: TObject);
    procedure dbedt_cd_armadorChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemChange(Sender: TObject);
    procedure pgctrl_notificadorChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedt_cgc_notificadorExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     a_str_indices : Array[0..5] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;

  public
    { Public declarations }
     lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_notificador: Tfrm_notificador;

implementation
 uses  GSMLIB, PGGP017, dNotificador,ConsOnLineEx;
{$R *.DFM}

procedure Tfrm_notificador.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_notificador.Cancelar;
begin
  if datm_notificador.qry_notificador_.State in [dsEdit,dsInsert] then
    datm_notificador.qry_notificador_.Cancel;

  if datm_notificador.qry_armador_.State in [dsEdit, dsInsert] then
    datm_notificador.qry_armador_.Cancel;

 btn_mi(st_incluir,false,false,st_excluir);
end;

function Tfrm_notificador.Consiste: Boolean;
begin
 consiste:=true;
if pgctrl_notificador.ActivePage = ts_dados_basicos then
  begin
   if dbedt_nm_notificador.text = '' then
     begin
      BoxMensagem('Deve ser preenchido o nome do Notificador!',2);
      dbedt_nm_notificador.SetFocus;
      Consiste:=false;
     end;

  end;
if pgctrl_notificador.ActivePage = ts_armadores then
  begin
   if dbedt_cd_armador.text = '' then
     begin
      BoxMensagem('Deve ser preenchido o Armador!',2);
      dbedt_cd_armador.SetFocus;
      Consiste:=false;
     end;

  end;


end;

procedure Tfrm_notificador.FormCreate(Sender: TObject);
begin
  { Cria o DataModule de Frete }

  Application.CreateForm(Tdatm_notificador, datm_notificador );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_notificador do
  begin
    qry_notificador_.Close;
    qry_notificador_.Prepare;
    qry_notificador_.Open;
  end;

  a_str_indices[0] := 'CD_NOTIFICADOR';
  a_str_indices[1] := 'NM_NOTIFICADOR';
  a_str_indices[2] := 'NM_CIDADE';
  a_str_indices[3] := 'NM_PAIS';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Nome');
    Items.Add('Cidade');
    Items.Add('País');
    ItemIndex := 1;
  end;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_notificador.ds_notificador.AutoEdit := st_modificar;

  pgctrl_notificador.ActivePage:=ts_lista;

 btn_mi(st_incluir, false, false, st_excluir);

end;

function Tfrm_notificador.Grava: Boolean;
begin
   if (pgctrl_notificador.ActivePage = ts_dados_basicos) then
     begin
       try
         if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
          if datm_notificador.qry_notificador_.State in [dsEdit, dsInsert] then
              datm_notificador.qry_notificador_.Post;
          datm_main.db_broker.Commit;
          GRava:=True;
        except
          begin
              if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              datm_notificador.qry_notificador_.cancel;
             // TrataErro(E);
              Grava := False;
           end;
        end;

     end;
  if (pgctrl_notificador.ActivePage = ts_armadores) then
    begin
     try
         if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
          if datm_notificador.qry_armador_.State in [dsEdit, dsInsert] then
              datm_notificador.qry_armador_.Post;
          datm_main.db_broker.Commit;
          GRava:=True;
        except
          begin
              if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              datm_notificador.qry_armador_.cancel;
              BoxMensagem('Este armador já está relacionado!',2);
              Grava := False;
           end;
        end;


    end;
btn_mi(st_incluir, false, false, st_excluir );
dbnvg.Enabled:=true;

end;

function Tfrm_notificador.VerAlt: Boolean;
begin
VerAlt := True;
  if ( ( datm_notificador.qry_armador_.State in [dsEdit] ) and st_modificar ) or
     ( datm_notificador.qry_armador_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Os dados do Armador foram alterados.' + #13#10 +
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

  if ( ( datm_notificador.qry_notificador_.State in [dsEdit] ) and st_modificar ) or
     ( datm_notificador.qry_notificador_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Os dados do Notificador foram alterados.' + #13#10 +
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

procedure Tfrm_notificador.btn_sairClick(Sender: TObject);
begin

close;
end;

procedure Tfrm_notificador.dbedt_nm_notificadorChange(Sender: TObject);
begin
  if datm_notificador.qry_notificador_.State in [dsEdit, dsInsert] then
     btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_notificador.btn_incluirClick(Sender: TObject);
begin
  dbedt_cd_armador.Enabled := True;
  btn_co_armador.Enabled := True;
  dbnvg.Enabled:=false;
  if (pgctrl_notificador.ActivePage = ts_dados_basicos) or
      (pgctrl_notificador.ActivePage = ts_lista) then
    begin
     with datm_notificador do
      begin
      pgctrl_notificador.ActivePage := ts_dados_basicos;
    //    qry_notificador_.DisableControls;
        qry_notificador_.Cancel;
        qry_notificador_.Append;
      //  qry_notificador_.EnableControls;

        dbedt_nm_notificador.SetFocus;
        qry_notificador_IN_ATIVO.AsString:='1';
      end;
    end;
    if (pgctrl_notificador.ActivePage = ts_armadores) then
      begin
       with datm_notificador do
        begin
         qry_armador_.Cancel;
         qry_armador_.Append;
         qry_armador_CD_NOTIFICADOR.AsString:=qry_notificador_CD_NOTIFICADOR.AsString;
         dbedt_cd_armador.SetFocus;

        end;
      end;
 btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_notificador.btn_salvarClick(Sender: TObject);
begin
  if not (Consiste) then exit;
  if not (Grava) then exit;
  dbedt_cd_armador.Enabled := False;
  btn_co_armador.Enabled := False;
end;

procedure Tfrm_notificador.btn_cancelarClick(Sender: TObject);
begin
  CAncelar;
  dbedt_cd_armador.Enabled := False;
  btn_co_armador.Enabled := False;
end;

procedure Tfrm_notificador.btn_excluirClick(Sender: TObject);
begin
with datm_notificador do
 begin
   if (pgctrl_notificador.ActivePage = ts_dados_basicos) or
      (pgctrl_notificador.ActivePage = ts_lista) then
      begin
        if BoxMensagem('Deseja excluir esse Notificador?',1) then
            begin
             try
              if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction ;
               with TQuery.Create(Application) do
                 begin
                  DataBaseName:='DBBROKER';
                  Sql.Clear;
                  Sql.Add('DELETE TARMADOR_NOTIFICADOR WHERE CD_NOTIFICADOR= "'+qry_notificador_CD_NOTIFICADOR.AsString+'"');
                  ExecSql;
                  Free;
                 end;

                qry_notificador_.Delete;
               datm_main.db_broker.Commit;
               Except
                on E: Exception do
                   begin
                   if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                    datm_notificador.qry_notificador_.cancel;
                   TrataErro(E);
                   end;
             end;//try
         end;
      end;
   if (pgctrl_notificador.ActivePage = ts_armadores) then
     begin
        if BoxMensagem('Deseja excluir esse Armador?',1) then
           begin
             try
              if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
               qry_armador_.Delete;
               datm_main.db_broker.Commit;
                Except
                   on E: Exception do
                   begin
                   if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
                    datm_notificador.qry_armador_.cancel;
                   TrataErro(E);
                   end;


             end;//try
           end;
     end;

  end;//with
end;

procedure Tfrm_notificador.btn_co_instClick(Sender: TObject);
begin
  if not (datm_notificador.qry_notificador_.State in [dsEdit, dsInsert]) then
    datm_notificador.qry_notificador_.Edit;
  datm_notificador.qry_notificador_CD_CIDADE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',NIL);
  dbedt_cd_cidade.Text := datm_notificador.qry_notificador_CD_CIDADE.AsString;
  dbedt_cd_cidadeExit(nil);

  (*str_cd_modulo := '22';
  str_cd_rotina := '2206';
  Application.CreateForm(Tfrm_Local_embarque, frm_Local_embarque);
  with frm_Local_embarque do
  begin
    lCons_OnLine := True;
    Caption := ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
    end;
  str_cd_modulo := '22';
  str_cd_rotina := '2279';
  if (frm_Local_embarque.Cons_OnLine_Texto <> '') then
  begin
    if not (datm_notificador.qry_notificador_.State in [dsEdit, dsInsert])
      and (st_modificar) then
      datm_notificador.qry_notificador_.Edit;
    datm_notificador.qry_notificador_CD_CIDADE.Value := frm_Local_embarque.Cons_OnLine_Texto;
    dbedt_cd_cidade.SetFocus;
    dbedt_cd_cidadeExit(Sender);
  end;*)

end;

procedure Tfrm_notificador.dbedt_cd_cidadeExit(Sender: TObject);
begin
 with datm_notificador do
  begin
   if not(qry_notificador_.State in [dsEdit,dsInsert]) then exit;
   if dbedt_cd_cidade.Text <> '' then
     begin
       ValidCodigo( dbedt_cd_cidade );
       qry_pesquisa_.Active:=false;
       qry_pesquisa_.Sql.Clear;
       qry_pesquisa_.Sql.Add('SELECT DESCRICAO FROM TLOCAL_EMBARQUE ');
       qry_pesquisa_.Sql.Add(' WHERE CODIGO = "'+dbedt_cd_cidade.Text+'"');
       qry_pesquisa_.Active:=true;

       if qry_pesquisa_.RecordCount > 0 then
         begin
            qry_notificador_NM_CIDADE.AsString := qry_pesquisa_.fields[0].AsString;
            qry_pesquisa_.Close;
         end
       else
         begin
           qry_pesquisa_.Close;
           dbedt_nm_cidade.Text := '';
           BoxMensagem('Código da Cidade inválido!', 2);
           dbedt_cd_cidade .SetFocus;
           Exit;
        end;

      end
    else dbedt_nm_cidade.Text := '';
 end;

end;

procedure Tfrm_notificador.dbedt_cd_paisExit(Sender: TObject);
begin
 with datm_notificador do
  begin
   if not(qry_notificador_.State in [dsEdit,dsInsert]) then exit;
   if dbedt_cd_pais.Text <> '' then
     begin
       ValidCodigo( dbedt_cd_cidade );
       qry_pesquisa_.Active:=false;
       qry_pesquisa_.Sql.Clear;
       qry_pesquisa_.Sql.Add('SELECT NM_PAIS FROM TPAIS_BROKER ');
       qry_pesquisa_.Sql.Add(' WHERE CD_PAIS = "'+dbedt_cd_pais.Text+'"');
       qry_pesquisa_.Active:=true;

       if qry_pesquisa_.RecordCount > 0 then
         begin
            qry_notificador_NM_PAIS.AsString := qry_pesquisa_.fields[0].AsString;
            qry_pesquisa_.Close;
         end
       else
         begin
           qry_pesquisa_.Close;
           dbedt_nm_pais.Text := '';
           BoxMensagem('Código do País inválido!', 2);
           dbedt_cd_pais .SetFocus;
           Exit;
        end;

      end
    else dbedt_nm_pais.Text := '';
 end;

end;

procedure Tfrm_notificador.dbedt_cd_paisKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if sender = dbedt_cd_pais    then btn_co_paisClick(btn_co_pais);
    if sender = dbedt_cd_cidade  then btn_co_instClick(btn_co_inst);
    if sender = dbedt_cd_armador then btn_co_armadorClick(btn_co_armador);
  end;
end;

procedure Tfrm_notificador.btn_co_paisClick(Sender: TObject);
begin
  if not (datm_notificador.qry_notificador_.State in [dsEdit, dsInsert]) then
    datm_notificador.qry_notificador_.Edit;
  datm_notificador.qry_notificador_CD_PAIS.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',NIL);
  dbedt_cd_pais.Text := datm_notificador.qry_notificador_CD_PAIS.AsString;
  dbedt_cd_paisExit(Sender);

(* str_cd_modulo := '22';
  str_cd_rotina := '2265';

  Application.CreateForm(Tfrm_pais, frm_pais);

  with frm_pais do
  begin
    lCons_OnLine := True;

    Caption := ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
    end;
  str_cd_modulo := '22';
  str_cd_rotina := '2279';
  if (frm_pais.Cons_OnLine_Texto <> '') then
  begin
    if not (datm_notificador.qry_notificador_.State in [dsEdit, dsInsert])
      and (st_modificar) then
      datm_notificador.qry_notificador_.Edit;
    datm_notificador.qry_notificador_CD_PAIS.Value := frm_pais.Cons_OnLine_Texto;
    dbedt_cd_pais.SetFocus;
    dbedt_cd_paisExit(Sender);
  end;*)

end;

procedure Tfrm_notificador.btn_co_armadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_notificador.qry_armador_) then exit;
    datm_notificador.qry_armador_CD_ARMADOR.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Armadores',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil)
  end;// else
//    dbedt_cd_agente.Text := ConsultaLookUP('TAGENTE','CD_AGENTE', dbedt_cd_agente.Text,'NM_AGENTE')

(*  str_cd_modulo := '22';
  str_cd_rotina := '2207';
  Application.CreateForm(Tfrm_transportador_itl, frm_transportador_itl);
  with frm_transportador_itl do
  begin
    lCons_OnLine := True;
    Caption := ' [Consulta On-Line]';
    in_maritima:=true;
    ShowModal;
    lCons_OnLine := False;
    end;
  str_cd_modulo := '22';
  str_cd_rotina := '2279';
  if (frm_transportador_itl.Cons_OnLine_Texto <> '') then
  begin
    if not (datm_notificador.qry_armador_.State in [dsEdit, dsInsert])
      and (st_modificar) then
      datm_notificador.qry_armador_.Edit;
    datm_notificador.qry_armador_CD_ARMADOR.Value := frm_transportador_itl.Cons_OnLine_Texto;
    dbedt_cd_armador.SetFocus;
    dbedt_cd_armadorExit(Sender);
  end;*)
  dbedt_cd_armadorExit(Sender);
end;

procedure Tfrm_notificador.dbedt_cd_armadorExit(Sender: TObject);
begin
  with datm_notificador do
  begin
    if not(qry_armador_.State in [dsEdit,dsInsert]) then
      exit;
    if dbedt_cd_armador.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_armador );
      with TQuery.Create(Application) do //verifica se já existe algum relacionamento
      begin
        dataBaseName := 'DBBROKER';
        Sql.Clear;
        Sql.Add('SELECT COUNT(*) FROM TARMADOR_NOTIFICADOR WHERE CD_NOTIFICADOR = "'+qry_notificador_CD_NOTIFICADOR.AsString+'"');
        Sql.Add(' AND CD_ARMADOR="'+dbedt_cd_armador.text+'"');
        Open;
        if Fields[0].AsInteger > 0 then
        begin
          BoxMensagem('Este Armador já está relacionado!',2);
          dbedt_cd_armador.SetFocus;
          Exit;
        end;
      end;
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE TP_TRANSPORTADOR = "1"  ');
      qry_pesquisa_.Sql.Add(' AND CODIGO = "'+dbedt_cd_armador.Text+'"');
      qry_pesquisa_.Active:=true;
      if not qry_pesquisa_.IsEmpty then
      begin
        qry_armador_NM_ARMADOR.AsString := qry_pesquisa_.fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_armador.Text := '';
        BoxMensagem('Código da Armador inválido!', 2);
        dbedt_cd_armador .SetFocus;
        Exit;
      end;
    end
    else
      dbedt_nm_armador.Text := '';
  end;
end;

procedure Tfrm_notificador.pgctrl_notificadorChange(Sender: TObject);
begin
 edt_chave.Enabled:=True;
 cb_ordem.Enabled:=true;
// btn_gera_favo.Enabled := (pgctrl_notificador.ActivePage = ts_dados_basicos);
  with datm_notificador do
  begin
    if pgctrl_notificador.ActivePage = ts_armadores then
    begin
      a_str_indices[0] := 'CD_ARMADOR';
      a_str_indices[1] := 'NM_ARMADOR';
      With cb_ordem do
      begin
        Clear;
        Items.Add('Código');
        Items.Add('Armador');
        ItemIndex := 1;
      end;
      qry_armador_.close;
      qry_armador_.ParamByName('CD_NOTIFICADOR').AsString:=qry_notificador_CD_NOTIFICADOR.AsString;
      qry_armador_.Prepare;
      qry_armador_.Open;
      dbnvg.datasource:=ds_armador;
    end
    else
    begin
      if pgctrl_notificador.ActivePage = ts_lista then
      begin
        a_str_indices[0] := 'CD_NOTIFICADOR';
        a_str_indices[1] := 'NM_NOTIFICADOR';
        a_str_indices[2] := 'NM_CIDADE';
        a_str_indices[3] := 'NM_PAIS';
        With cb_ordem do
        begin
          Clear;
          Items.Add('Código');
          Items.Add('Nome');
          Items.Add('Cidade');
          Items.Add('País');
          ItemIndex := 1;
        end;
        dbnvg.datasource:= ds_notificador;
      end
      else
      begin
        edt_chave.Enabled := false;
        cb_ordem.Enabled  := false;
      end;
    end;
  end;
end;

procedure Tfrm_notificador.dbedt_cd_armadorChange(Sender: TObject);
begin
  if datm_notificador.qry_armador_.State in [dsEdit, dsinsert] then
    btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_notificador.edt_chaveChange(Sender: TObject);
begin
  if pgctrl_notificador.ActivePage = ts_lista then
    localiza (datm_notificador.qry_notificador_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
  if pgctrl_notificador.ActivePage = ts_armadores then
    localiza (datm_notificador.qry_armador_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_notificador.cb_ordemChange(Sender: TObject);
begin
  edt_chave.text:='';
  with datm_notificador do
  begin
    if pgctrl_notificador.ActivePage = ts_lista then
    begin
      qry_notificador_.Close;
      if cb_ordem.itemindex = 0 then
        qry_notificador_.Sql[6]:='TN.CD_NOTIFICADOR';
      if cb_ordem.itemindex = 1 then
        qry_notificador_.Sql[6]:='TN.NM_NOTIFICADOR';
      if cb_ordem.itemindex = 2 then
        qry_notificador_.Sql[6]:='NM_CIDADE';
      if cb_ordem.itemindex = 3 then
        qry_notificador_.Sql[6]:='NM_PAIS';
      qry_notificador_.prepare;
      qry_notificador_.Open;
    end;
    if pgctrl_notificador.ActivePage = ts_armadores then
    begin
      qry_armador_.Close;
      if cb_ordem.itemindex = 0 then
        qry_armador_.Sql[6]:='TAN.CD_ARMADOR';
      if cb_ordem.itemindex = 1 then
        qry_armador_.Sql[6]:='NM_ARMADOR';
      qry_armador_.ParamByName('CD_NOTIFICADOR').AsString:=qry_notificador_CD_NOTIFICADOR.AsString;
      qry_armador_.Prepare;
      qry_armador_.Open;
    end;
  end;
end;

procedure Tfrm_notificador.pgctrl_notificadorChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange:=VerAlt;
end;

procedure Tfrm_notificador.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
//    try
//      Cons_OnLine.AsString := datm_notificador.qry_notificador_CD_NOTIFICADOR.AsString;
//    except
      try
        Cons_OnLine_Texto := datm_notificador.qry_notificador_CD_NOTIFICADOR.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do Notificador !', 2);
      end;
//    end;
    Close;
  end;

end;

procedure Tfrm_notificador.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_notificador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_notificador.qry_armador_.close;
 datm_notificador.qry_notificador_.Close;
 datm_notificador.Free;
end;

procedure Tfrm_notificador.dbedt_cgc_notificadorExit(Sender: TObject);
begin
if not(datm_notificador.qry_notificador_.State in [dsEdit,dsInsert]) then exit;

if Not CNPJ(dbedt_cgc_notificador.Text) then
   begin
    dbedt_cgc_notificador.SetFocus;
    Exit;
   end;

  if Trim( dbedt_cgc_notificador.Text ) <> '' then
  begin
   with TQuery.Create(Application) do
    begin
      DataBaseName:= 'DBBROKER';
      Sql.Add('SELECT CD_NOTIFICADOR, NM_NOTIFICADOR FROM TNOTIFICADOR WHERE CGC_NOTIFICADOR = "'+dbedt_cgc_notificador.text+'"');
      Open;
      if Fields[0].AsString <> ''  then
      begin
        BoxMensagem( 'C.N.P.J. já cadastrado para '#13'Notificador '+
                     Fields[1].AsString, 2 );
        dbedt_cgc_notificador.SetFocus;
        //Consiste := False;
        Exit;
      end;
      Free;
    end;
  end;
end;

procedure Tfrm_notificador.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
end;

end.

(*******************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGSM242.PAS - frm_portos

AUTOR: Ricardo Giacomi Lopes

DATA: 05/06/2002

Manutenção: Ricardo Giacomi Lopes

Data: 21/06/2002 - ADBC-0006 - Cadastro de Porto / Aeroporto

********************************************************************************)

unit uPortos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Menus, Mask, Buttons, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, DbTables, Funcoes;

type
  Tfrm_portos = class(TForm)
    pgctrl_portos: TPageControl;
    ts_lista: TTabSheet;
    dbg_portos: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_ag: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    btn_co_cd_cidade: TSpeedButton;
    btn_cd_cidade: TSpeedButton;
    dbedt_look_nm_pais: TDBEdit;
    dbedt_look_nm_cidade: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_btn_ag: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    dbedt_cd_porto: TDBEdit;
    Label6: TLabel;
    dbedt_look_nm_porto_grupo: TDBEdit;
    btn_co_grupo: TSpeedButton;
    btn_cd_urf: TSpeedButton;
    dbedt_nm_urf: TDBEdit;
    Label7: TLabel;
    lb_sigla_aero: TLabel;
    dbedt_nm_porto: TDBEdit;
    dbedt_cd_cidade: TDBEdit;
    dbedt_cd_pais: TDBEdit;
    dbedt_cd_uf: TDBEdit;
    dbedt_cd_grupo: TDBEdit;
    dbedt_sigla: TDBEdit;
    dbedt_sigla_aeroporto: TDBEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    procedure dbedt_cd_portoChange(Sender: TObject);
    procedure mi_incluirClick(Sender: TObject);
    procedure mi_salvarClick(Sender: TObject);
    procedure mi_cancelarClick(Sender: TObject);
    procedure mi_excluirClick(Sender: TObject);
    procedure mi_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_ordemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbg_portosDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgctrl_portosChange(Sender: TObject);
    procedure pgctrl_portosChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbg_portosKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_cidadeExit(Sender: TObject);
    procedure btn_co_cd_cidadeClick(Sender: TObject);
    procedure dbedt_cd_cidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_cd_cidadeClick(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure dbedt_cd_paisExit(Sender: TObject);
    procedure dbedt_cd_grupoExit(Sender: TObject);
    procedure btn_cd_urfClick(Sender: TObject);
    procedure dbedt_cd_ufExit(Sender: TObject);
  private
    { Private declarations }
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..4] Of String[60]; // trabalha c/ edt_chave
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir: Boolean;

    procedure Cancelar;
    function Consiste : Boolean;
    function Grava    : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    function VerAlt   : Boolean;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );

  public
    { Public declarations }
   lCons_OnLine : Boolean;
   Cons_OnLine : TStringField;
   Cons_OnLine_Texto : String;
   In_porto:Boolean;//se true é porto se false é aeroporto

  end;

var
  frm_portos: Tfrm_portos;

implementation

uses GSMLIB, PGGP001, dPortos, PGGP017, PGSM014, PGSM096, PGSM148, uGrupoPortos, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_portos.dbedt_cd_portoChange(Sender: TObject);
begin
  if ( datm_portos.qry_porto_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_portos.mi_incluirClick(Sender: TObject);

begin
  with datm_portos do
  begin
    qry_porto_.DisableControls;
    qry_porto_.Cancel;
    qry_porto_.Append;
    qry_porto_.EnableControls;
    qry_porto_.FieldByName('CD_PORTO').AsString := UltCod( qry_ult_registro_, qry_ult_registro_ULTIMO );
     if in_porto then
        qry_porto_.FieldByName('TP_PORTO').AsString :='1'
     else qry_porto_.FieldByName('TP_PORTO').AsString :='0';


  end;



  pgctrl_portos.ActivePage := ts_dados_basicos;
  dbedt_nm_porto.SetFocus;

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  

  dbnvg.Enabled := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled := False;

end;

procedure Tfrm_portos.mi_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava then Exit;

end;

function Tfrm_portos.Grava : Boolean;
begin
  

  // P/ qry_porto_

  try
    datm_main.db_broker.StartTransaction;
    if ( datm_portos.qry_porto_.State in [dsInsert, dsEdit] ) then
    begin
      datm_portos.qry_porto_.Post;
      Pesquisa := datm_portos.qry_porto_CD_PORTO.AsString;
      datm_portos.qry_porto_.Close;
      datm_portos.qry_porto_.Prepare;
      datm_portos.qry_porto_.Open;
      Localiza(datm_portos.qry_porto_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_portos.qry_porto_.Cancel;
      TrataErro(E);
      Grava := False;
    end;
  end;


  Btn_Mi(st_incluir, False, False, st_excluir );

end;


procedure Tfrm_portos.mi_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_portos.mi_excluirClick(Sender: TObject);
begin
  if datm_portos.qry_porto_.IsEmpty then
   begin
      BoxMensagem( 'Não existe Registro para ser excluído!', 2 );
      exit;
     end;
  if BoxMensagem( 'Este cadastro será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_portos.qry_porto_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_portos.qry_porto_.Cancel;
      TrataErro(E);
    end;
  end;
  Pesquisa := datm_portos.qry_porto_CD_PORTO.AsString;
  Localiza (datm_portos.qry_porto_, Pesquisa, a_str_indices[0]);
  pgctrl_portos.ActivePage := ts_lista;

end;

procedure Tfrm_portos.Cancelar;
begin
  
  try
    if datm_portos.qry_porto_.State in [dsInsert, dsEdit] then
    begin
      datm_portos.qry_porto_.Cancel;
      pgctrl_portos.ActivePage := ts_dados_basicos;
      dbedt_nm_porto.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente!', 2 );
  end;


  Btn_Mi(st_incluir, False, False, st_excluir );
  //dbedt_cd_grupo.Enabled:=false;
  //btn_co_grupo.Enabled:=false;


end;

function Tfrm_portos.Consiste : Boolean;  //IRÁ SER USADO SE ALGUM
begin                                         //CAMPO NÃO PUDER FICAR
  Consiste := False;
  if dbedt_cd_porto.text = '' then
  begin
    BoxMensagem('Deve ser inserido o Código do Porto!', 2);
    dbedt_cd_porto.Setfocus;
    exit;
  end;
  if dbedt_cd_grupo.Text = '' then
  begin
   BoxMensagem('Campo Grupo do Porto deve ser preenchido!', 2);
   dbedt_cd_grupo.SetFocus;
   Exit;
  end;
  if dbedt_nm_porto.Text = '' then
  begin
    BoxMensagem('Campo Nome do Porto deve ser preenchido!', 2);
    dbedt_nm_porto.SetFocus;
    Exit;
  end;
  Consiste := True;
end;

procedure Tfrm_portos.mi_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_portos.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_portos.qry_porto_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_portos.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_portosDblClick(nil); // trabalha c/ dbgrid
end;

procedure Tfrm_portos.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;


procedure Tfrm_portos.cb_ordemClick(Sender: TObject);
begin
   Pesquisa := datm_portos.qry_porto_CD_PORTO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_portos.qry_porto_.Close;
  datm_portos.qry_porto_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  datm_portos.qry_porto_.Prepare;
  datm_portos.qry_porto_.Open;
  Localiza(datm_portos.qry_porto_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;

end;

procedure Tfrm_portos.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  in_porto     := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  Application.CreateForm(Tdatm_portos, datm_portos);

 


  btn_incluir.Enabled   := st_incluir;
  btn_excluir.Enabled   := st_excluir;
  mi_incluir.Enabled    := st_incluir;
  mi_excluir.Enabled    := st_excluir;

  datm_portos.ds_porto.AutoEdit          := st_modificar;

  a_str_indices[0] := 'CD_PORTO';
  a_str_indices[1] := 'NM_PORTO';



  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Nome'); 
    ItemIndex := 1;
  end;
 
end;

procedure Tfrm_portos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_portos.qry_porto_.Close;

   datm_portos.free;

  action:= cafree;
end;

procedure Tfrm_portos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
  if key = #13 then dbg_portosDblClick(Sender);

end;

procedure Tfrm_portos.dbg_portosDblClick(Sender: TObject);
begin

If lCons_OnLine Then
  begin
    try
//      Cons_OnLine.AsString := datm_portos.qry_porto_CD_PORTO.AsString;
      Cons_Online_Texto := datm_portos.qry_porto_CD_PORTO.AsString;
    except
      BoxMensagem('Não foi possível retornar o Código do porto !', 2);
    end;
    Close;
  end;

end;

procedure Tfrm_portos.FormShow(Sender: TObject);
begin
 
  datm_portos.qry_porto_.Close;
  if in_porto then
   begin
    datm_portos.qry_porto_.SQL[1]:=' WHERE TP_PORTO ="1"';
    frm_portos.Caption:='Cadastro de Portos';
    a_str_indices[2] := 'CD_SIGLA_CIDADE';
    cb_ordem.Items.Add('Sigla Cidade');
   end
  else
    begin
      frm_portos.Caption:='Cadastro de Aeroportos';
      datm_portos.qry_porto_.SQL[1]:=' WHERE TP_PORTO ="0"';
      a_str_indices[2] := 'CD_SIGLA';
      a_str_indices[3] := 'CD_SIGLA_CIDADE';
      dbg_portos.Columns.Items[2].Visible:=true;
      cb_ordem.Items.Add('Sigla');
      cb_ordem.Items.Add('Sigla Cidade');
    end;
  
  datm_portos.qry_porto_.SQL[3] := 'NM_PORTO';
  datm_portos.qry_porto_.Prepare;
  datm_portos.qry_porto_.Open;

  pgctrl_portos.ActivePage:= ts_lista;
  edt_chave.setfocus;
 end;

procedure Tfrm_portos.pgctrl_portosChange(Sender: TObject);
begin
  if (pgctrl_portos.ActivePage = ts_lista ) then
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

  if (pgctrl_portos.ActivePage = ts_dados_basicos) then
    dbedt_nm_porto.SetFocus;

end;

procedure Tfrm_portos.pgctrl_portosChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_portos.VerAlt: Boolean;
begin
  VerAlt := True;
  if ( ( datm_portos.qry_porto_.State in [dsEdit] ) and st_modificar ) or
     ( datm_portos.qry_porto_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Portos foi alterado.' + #13#10 +
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

procedure Tfrm_portos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  VerAlt;
end;

procedure Tfrm_portos.dbg_portosKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then dbg_portosDblClick(Sender);
end;

procedure Tfrm_portos.dbedt_cd_cidadeExit(Sender: TObject);
begin
if Not ( datm_portos.qry_porto_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_cidade );
  if dbedt_cd_cidade.Text <> '' then
  begin
    if dbedt_look_nm_cidade.Text = '' then
    begin
      BoxMensagem('Código da Cidade inválido!',2);
      pgctrl_portos.ActivePage := ts_dados_basicos;
      dbedt_cd_cidade.SetFocus;
      Exit;
    end;
    with TQuery.Create(Application) do
      begin
       DataBaseName:='DBBROKER';
       Sql.clear;
       Sql.Add('SELECT CD_SIGLA FROM TLOCAL_EMBARQUE WHERE CODIGO = "'+dbedt_cd_cidade.Text+'"');
       Open;
       datm_portos.qry_porto_CD_SIGLA_CIDADE.AsString:=Fields[0].AsString;
       Free;
      end;
  end;
end;

procedure Tfrm_portos.btn_co_cd_cidadeClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_portos.qry_porto_) then exit;
    datm_portos.qry_porto_CD_CIDADE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Cidade',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil);
  end;
//  Consulta_On_line( 'TLOCAL_EMBARQUE', datm_portos.qry_porto_CD_CIDADE, 'Cidade', 1 );
  dbedt_cd_cidadeExit(Sender);
end;

procedure Tfrm_portos.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin

  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo           := nCodigo;
  datm_consulta_padrao.Tabela.TableName := cNomeTabela;

  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine       := fCampo;
  frm_consulta_padrao.st_modificar      := st_modificar;
  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;


procedure Tfrm_portos.dbedt_cd_cidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_cidade then  btn_co_cd_cidadeClick (btn_co_cd_cidade);
    if Sender = dbedt_cd_pais   then  btn_cd_cidadeClick (btn_cd_cidade);
    if Sender = dbedt_cd_grupo  then  btn_co_grupoClick (btn_co_grupo);
    if Sender = dbedt_cd_uf     then  btn_cd_urfClick (btn_cd_urf);

  end;
end;

procedure Tfrm_portos.btn_cd_cidadeClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_portos.qry_porto_) then exit;
    datm_portos.qry_porto_CD_PAIS.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil);
  end;
//  Consulta_On_line( 'TPAIS_BROKER', datm_portos.qry_porto_CD_PAIS, 'Pais', 57 );
//  dbedt_cd_paisExit(Sender);
end;

procedure Tfrm_portos.btn_co_grupoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2273';
  Application.CreateForm(Tfrm_grupo_portos, frm_grupo_portos);
  with frm_grupo_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_grupo_portos.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_portos.qry_porto_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       begin
        datm_portos.qry_porto_.Edit;
       end;
    datm_portos.qry_porto_grupo_.close;
    datm_portos.qry_porto_grupo_.Prepare;
    datm_portos.qry_porto_grupo_.Open;

    datm_portos.qry_porto_CD_GRUPO_PORTO.Value:=frm_grupo_portos.Cons_OnLine_Texto;
  end;

  dbedt_cd_grupoExit(Sender);
end;

procedure Tfrm_portos.dbedt_cd_paisExit(Sender: TObject);
begin
if Not ( datm_portos.qry_porto_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_pais );
  if dbedt_cd_pais.Text <> '' then
  begin
    if dbedt_look_nm_pais.Text = '' then
    begin
      BoxMensagem('Código do Armador inválido!',2);
      pgctrl_portos.ActivePage := ts_dados_basicos;
      dbedt_cd_pais.SetFocus;
      Exit;
    end;
  end;

end;

procedure Tfrm_portos.dbedt_cd_grupoExit(Sender: TObject);
begin
if Not ( datm_portos.qry_porto_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_grupo );
  if dbedt_cd_grupo.Text <> '' then
  begin
    if dbedt_look_nm_porto_grupo.Text = '' then
    begin
      BoxMensagem('Código do Grupo de Portos/Aeroportos inválido!',2);
      pgctrl_portos.ActivePage := ts_dados_basicos;
      dbedt_cd_grupo.SetFocus;
      Exit;
    end;
  end;

end;

procedure Tfrm_portos.btn_cd_urfClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_portos.qry_porto_) then exit;
    datm_portos.qry_porto_CD_URF.AsString := ConsultaOnLineEx('TURF','URF',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil);
  end;
  // Consulta_On_line( 'TURF', datm_portos.qry_porto_CD_URF, 'URF', 1 );
dbedt_cd_ufExit(Sender);
end;

procedure Tfrm_portos.dbedt_cd_ufExit(Sender: TObject);
begin
if Not ( datm_portos.qry_porto_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_uf);
  if dbedt_cd_uf.Text <> '' then
  begin
    if dbedt_cd_uf.Text = '' then
    begin
      BoxMensagem('Código do URF inválido!',2);
      pgctrl_portos.ActivePage := ts_dados_basicos;
      dbedt_cd_uf.SetFocus;
      Exit;
    end;
  end;
end;

end.

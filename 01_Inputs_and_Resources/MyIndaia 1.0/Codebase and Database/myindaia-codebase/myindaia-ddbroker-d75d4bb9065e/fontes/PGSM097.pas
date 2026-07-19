unit PGSM097;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, Db, DBCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  Menus;

type
  Tfrm_grupo_servico = class(TForm)
    menu_grupo_servico: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_cadastro: TPanel;
    pnl_pesquisa: TPanel;
    btn_incluir: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    dbnvg: TDBNavigator;
    btn_sair: TSpeedButton;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    pgctrl_grupo_servico: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_nm_grupo_servico: TLabel;
    lbl_cd_codigo: TLabel;
    dbedt_nm_grupo: TDBEdit;
    dbedt_cd_grupo: TDBEdit;
    lbl_nm_meta: TLabel;
    dbedt_nr_meta: TDBEdit;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_grupo_servicoChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure mi_sairClick(Sender: TObject);
    procedure dbedt_nm_grupoChange(Sender: TObject);
    procedure dbedt_cd_grupoChange(Sender: TObject);
    procedure dbedt_nr_metaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure pgctrl_grupo_servicoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mi_incluirClick(Sender: TObject);
    procedure mi_salvarClick(Sender: TObject);
    procedure mi_cancelarClick(Sender: TObject);
    procedure mi_excluirClick(Sender: TObject);




  private
    { Private Declarations }
    str_cd_grupo : String;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure Abertura;

  public
    { Public Declarations }
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;

  end;

var
  frm_grupo_servico: Tfrm_grupo_servico;

implementation

uses PGGP001, PGSM098, PGGP017, GSMLIB;

{$R *.DFM}


procedure Tfrm_grupo_servico.btn_incluirClick(Sender: TObject);
begin
  with datm_grupo_servico do
   begin
     qry_grupo_servico_.DisableControls;
     qry_grupo_servico_.Cancel;
     qry_grupo_servico_.Append;
     qry_grupo_servico_.EnableControls;
     qry_grupo_servico_CD_GRUPO.AsString  := UltCod( qry_ult_grupo_servico_, qry_ult_grupo_servico_ULTIMO );
  end;

  pgctrl_grupo_servico.ActivePage := ts_dados_basicos;

  btn_mi( False, True, True, False );

  dbedt_nm_grupo.SetFocus;
end;



procedure Tfrm_grupo_servico.Cancelar;
begin
  try
    if datm_grupo_servico.qry_grupo_servico_.State in [dsInsert, dsEdit] then
    begin
      datm_grupo_servico.qry_grupo_servico_.Cancel;
      pgctrl_grupo_servico.ActivePage := ts_dados_basicos;
      dbedt_nm_grupo.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;



function Tfrm_grupo_servico.Consiste : Boolean;
begin
  {Código}
  if dbedt_cd_grupo.Text = '' then
  Begin
    BoxMensagem('Código do Grupo deve ser preenchido!', 2);
    pgctrl_grupo_servico.ActivePage := ts_dados_basicos;
    dbedt_cd_grupo.SetFocus;
    consiste := False;
    Exit;
  end;
  //Consiste := True;

  {Nome do Grupo}
  if dbedt_nm_grupo.Text = '' then
  begin
    BoxMensagem('Campo Descrição deve ser preenchido!', 2);
    pgctrl_grupo_servico.ActivePage := ts_dados_basicos;
    dbedt_nm_grupo.SetFocus;
    Consiste := False;
    Exit;
  end;
  //Consiste := True;

  {Meta}
  if dbedt_nr_meta.Text = '' then
  begin
    BoxMensagem('Número da Meta deve ser preenchido!', 2);
    pgctrl_grupo_servico.ActivePage := ts_dados_basicos;
    dbedt_nr_meta.SetFocus;
    Consiste := False;
    Exit;
  end;
  Consiste := True;
end;

function Tfrm_grupo_servico.Grava;
begin
  begin
    Grava := Commit( datm_grupo_servico.qry_grupo_servico_ );

    btn_mi(st_incluir, False, False, st_excluir );
  end;
end;



function Tfrm_grupo_servico.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_grupo_servico.qry_grupo_servico_.State in [dsEdit] ) and st_modificar ) or
     ( datm_grupo_servico.qry_grupo_servico_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Grupos foi alterado.' + #13#10 +
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

procedure Tfrm_grupo_servico.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;



procedure Tfrm_grupo_servico.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
 if VerAlt then
  begin
    with datm_grupo_servico do
    begin
      qry_grupo_servico_.Close;
      Free;
    end;
    Action := caFree;
  end
  else
    Action := caNone;
end;


procedure Tfrm_grupo_servico.pgctrl_grupo_servicoChange(Sender: TObject);
begin
  if (pgctrl_grupo_servico.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled     := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled  := True;
  end
  else
  begin
    dbnvg.Enabled     := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled  := False;
  end;
end;


procedure Tfrm_grupo_servico.cb_ordemClick(Sender: TObject);
begin
  with datm_grupo_servico do
  begin
    Pesquisa := qry_grupo_servico_CD_GRUPO.AsString;

    edt_chave.Text := '';
    qry_grupo_servico_.Close;
    qry_grupo_servico_.SQL[4] := a_str_indices[cb_ordem.ItemIndex];
    qry_grupo_servico_.Prepare;
    qry_grupo_servico_.Open;
    Localiza( qry_grupo_servico_, Pesquisa, a_str_indices[0] );
    edt_chave.SetFocus;
  end;
end;


procedure Tfrm_grupo_servico.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_grupo_servico.Abertura;
begin
  with datm_grupo_servico do
  begin
    qry_grupo_servico_.Close;
    qry_grupo_servico_.Prepare;
    qry_grupo_servico_.Open;
    if str_cd_grupo <> '' then
      qry_grupo_servico_.Locate('CD_GRUPO', str_cd_grupo, [loCaseInsensitive]);
  end;
end;

procedure Tfrm_grupo_servico.dbg_cadastroDblClick(Sender: TObject);
begin
   if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_grupo_servico.qry_grupo_servico_.FieldByName('CD_GRUPO').AsString;
    except
      try
        Cons_Online_Texto := datm_grupo_servico.qry_grupo_servico_.FieldByName('CD_GRUPO').AsString;
      except
        BoxMensagem('Não consegui retornar Código do Grupo!', 2);
      end;
    end;
    Close;
  end;
end;



procedure Tfrm_grupo_servico.FormCreate(Sender: TObject);
begin
  { Inicializa o Data Module para Proprietários de Mercadoria}
  Application.CreateForm( Tdatm_grupo_servico, datm_grupo_servico );
end;



procedure Tfrm_grupo_servico.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_grupo_servico.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_grupo_servico.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_grupo_servico.mi_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_grupo_servico.dbedt_nm_grupoChange(Sender: TObject);
begin
  If ( datm_grupo_servico.qry_grupo_servico_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_grupo_servico.dbedt_cd_grupoChange(Sender: TObject);
begin
  If ( datm_grupo_servico.qry_grupo_servico_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_grupo_servico.dbedt_nr_metaChange(Sender: TObject);
begin
  If ( datm_grupo_servico.qry_grupo_servico_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_grupo_servico.FormShow(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  pgctrl_grupo_servico.ActivePage := ts_lista;
  edt_chave.SetFocus;
  with datm_grupo_servico do
  begin
    ds_grupo_servico.AutoEdit := st_modificar;
    qry_grupo_servico_.Close;
    qry_grupo_servico_.SQL[4] := 'NM_GRUPO';
    qry_grupo_servico_.Prepare;
    qry_grupo_servico_.Open;
  end;
  a_str_indices[0] := 'CD_GRUPO';
  a_str_indices[1] := 'NM_GRUPO';


  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Nome');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;
end;

procedure Tfrm_grupo_servico.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_grupo_servico.qry_grupo_servico_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex]);
end;

procedure Tfrm_grupo_servico.pgctrl_grupo_servicoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_grupo_servico.edt_chaveKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_grupo_servico.btn_excluirClick(Sender: TObject);
begin
  with datm_grupo_servico do
  begin
   if BoxMensagem( 'Este Grupo será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) Then
     begin
       try
         datm_main.db_broker.StartTransaction;
         qry_grupo_servico_.Delete;
         qry_grupo_servico_.ApplyUpdates;
         Abertura;
         datm_main.db_broker.Commit;
       except
        on E: Exception do
        begin
          TrataErro(E);
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          datm_grupo_servico.qry_grupo_servico_.Cancel;
         end;
       end;
   end;
end;
   pgctrl_grupo_servico.ActivePage := ts_lista;
end;



procedure Tfrm_grupo_servico.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #27 then close;
end;

procedure Tfrm_grupo_servico.mi_incluirClick(Sender: TObject);
begin
  with datm_grupo_servico do
   begin
     qry_grupo_servico_.DisableControls;
     qry_grupo_servico_.Cancel;
     qry_grupo_servico_.Append;
     qry_grupo_servico_.EnableControls;
     qry_grupo_servico_CD_GRUPO.AsString  := UltCod( qry_ult_grupo_servico_, qry_ult_grupo_servico_ULTIMO );
  end;

  pgctrl_grupo_servico.ActivePage := ts_dados_basicos;

  btn_mi( False, True, True, False );

  dbedt_nm_grupo.SetFocus;
end;

procedure Tfrm_grupo_servico.mi_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_grupo_servico.mi_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;


procedure Tfrm_grupo_servico.mi_excluirClick(Sender: TObject);
begin
  with datm_grupo_servico do
  begin
   if BoxMensagem( 'Este Grupo será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) Then
     begin
         datm_main.db_broker.StartTransaction;
         qry_grupo_servico_.Delete;
         qry_grupo_servico_.ApplyUpdates;
         Abertura;
         datm_main.db_broker.Commit;
         pgctrl_grupo_servico.ActivePage := ts_lista;
     end;
   end;      
end;







end.

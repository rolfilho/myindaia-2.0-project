 unit PGSM081;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Mask, DBCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, DB, Funcoes;

type
  Tfrm_tx_tra = class(TForm)
    Panel300: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    pgctrl_tx_tra: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedt_look_ativo: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbedt_cd_taxa_tra: TDBEdit;
    dbedt_nm_descricao: TDBEdit;
    Label6: TLabel;
    dbedt_VL_THC_CNTR_20: TDBEdit;
    Label7: TLabel;
    dbedt_VL_THC_CNTR_40: TDBEdit;
    Label8: TLabel;
    dbedt_VL_THC_C_SOLTA: TDBEdit;
    Label9: TLabel;
    dbedt_VL_THC_CNTR_20_RORO: TDBEdit;
    Label10: TLabel;
    dbedt_VL_THC_CNTR_40_RORO: TDBEdit;
    Label11: TLabel;
    dbedt_VL_THC_C_SOLTA_RORO: TDBEdit;
    Label12: TLabel;
    dbedt_VL_THC_MIN: TDBEdit;
    Label13: TLabel;
    dbedt_VL_CARR_CNTR_20_MM: TDBEdit;
    Label14: TLabel;
    dbedt_VL_CARR_CNTR_20_MO: TDBEdit;
    Label15: TLabel;
    dbedt_VL_CARR_CNTR_40_MM: TDBEdit;
    Label16: TLabel;
    dbedt_VL_CARR_CNTR_40_MO: TDBEdit;
    Label17: TLabel;
    dbedt_VL_CARR_C_SOLTA_MM: TDBEdit;
    Label18: TLabel;
    dbedt_VL_CARR_C_SOLTA_MO: TDBEdit;
    Label19: TLabel;
    dbedt_VL_CARR_MIN: TDBEdit;
    Label20: TLabel;
    dbedt_PC_ACR_CARR_PERIGO: TDBEdit;
    Label21: TLabel;
    dbedt_NR_PERIODO_ARM: TDBEdit;
    Label22: TLabel;
    dbedt_VL_ARM_CNTR_1P: TDBEdit;
    Label23: TLabel;
    dbedt_VL_ARM_CNTR_DP: TDBEdit;
    Label24: TLabel;
    dbedt_VL_ARM_CNTR_20_MIN: TDBEdit;
    Label25: TLabel;
    dbedt_VL_ARM_CNTR_40_MIN: TDBEdit;
    Label26: TLabel;
    dbedt_VL_ARM_CNTR_REIMP: TDBEdit;
    Label27: TLabel;
    dbedt_VL_ARM_C_SOLTA_1P: TDBEdit;
    Label28: TLabel;
    dbedt_VL_ARM_C_SOLTA_2P: TDBEdit;
    Label29: TLabel;
    dbedt_VL_ARM_C_SOLTA_3P: TDBEdit;
    Label30: TLabel;
    dbedt_VL_ARM_C_SOLTA_DP: TDBEdit;
    Label31: TLabel;
    dbedt_VL_ARM_C_SOLTA_MIN: TDBEdit;
    Label32: TLabel;
    dbedt_VL_ARM_C_SOLTA_BAGAGEM: TDBEdit;
    Label33: TLabel;
    dbedt_VL_ARM_C_SOLTA_REIMP: TDBEdit;
    Label34: TLabel;
    dbedt_PC_ACR_ARM_PERIGO: TDBEdit;
    Label35: TLabel;
    dbedt_VL_ENERGIA_CNTR_FIXO: TDBEdit;
    Label36: TLabel;
    dbedt_VL_ENERGIA_CNTR_20: TDBEdit;
    Label37: TLabel;
    dbedt_VL_ENERGIA_CNTR_40: TDBEdit;
    Label38: TLabel;
    dbedt_PC_ISS: TDBEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label42: TLabel;
    Bevel5: TBevel;
    procedure pgctrl_tx_traChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_nm_descricaoChange(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure pgctrl_tx_traChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    OnChanging : Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    lnm_tx_tra : Boolean;
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
  frm_tx_tra: Tfrm_tx_tra;

implementation

uses PGSM082, PGGP001, GSMLIB, PGGP017;

{$R *.DFM}

procedure Tfrm_tx_tra.pgctrl_tx_traChange(Sender: TObject);
begin
  OnChanging := False;

  if lnm_tx_tra then
  begin
    lnm_tx_tra := False;
    pgctrl_tx_tra.ActivePage := ts_dados_basicos;
    dbedt_nm_descricao.SetFocus;
    Exit;
  end;

  if (pgctrl_tx_tra.ActivePage = ts_lista ) then
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

end;

procedure Tfrm_tx_tra.FormCreate(Sender: TObject);
begin
  { Cria o DataModule do Taxa Tra }

  Application.CreateForm(Tdatm_tx_tra, datm_tx_tra );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_tx_tra do
  begin
    tbl_yesno_.Open;
    qry_tx_tra_.SQL[2] := 'NM_DESCRICAO';
    qry_tx_tra_.Prepare;
    qry_tx_tra_.Open;
  end;

  a_str_indices[0] := 'CD_TAXA_TRA';
  a_str_indices[1] := 'NM_DESCRICAO';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;
  vStr_cd_modulo:='22';
  str_cd_rotina:='2222';

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_tx_tra.ds_tx_tra.AutoEdit                   := st_modificar;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;

end;

procedure Tfrm_tx_tra.btn_incluirClick(Sender: TObject);
begin
         btn_incluir.Enabled := False;
         mi_incluir.Enabled  := False;
         btn_excluir.Enabled := False;
         mi_excluir.Enabled  := False;
         with datm_tx_tra do
         begin
           qry_tx_tra_.DisableControls;
           qry_tx_tra_.Cancel;
           qry_tx_tra_.Append;
           qry_tx_tra_.EnableControls;
           qry_tx_tra_CD_TAXA_TRA.AsString  := UltCod( qry_ult_tx_tra_, qry_ult_tx_tra_ULTIMO );
           qry_tx_tra_IN_ATIVO.AsString  := '1';
         end;

        pgctrl_tx_tra.ActivePage := ts_dados_basicos;
        dbedt_nm_descricao.SetFocus;
end;

procedure Tfrm_tx_tra.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

function Tfrm_tx_tra.Grava;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_tx_tra.qry_tx_tra_.State in [dsInsert, dsEdit] ) then
       datm_tx_tra.qry_tx_tra_.Post;
    datm_main.db_broker.Commit;
    Grava:=True;
  except
    on E: Exception do
    begin
      datm_tx_tra.qry_tx_tra_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_tx_tra.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_tx_tra.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_tx_tra.Cancelar;
begin
  try
    if datm_tx_tra.qry_tx_tra_.State in [dsInsert, dsEdit] then
    begin
      datm_tx_tra.qry_tx_tra_.Cancel;
      pgctrl_tx_tra.ActivePage := ts_dados_basicos;
      dbedt_nm_descricao.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_tx_tra.btn_excluirClick(Sender: TObject);
begin
   if BoxMensagem( 'Esta taxa será excluída! Confirma exclusão?', 1 ) Then
   try
     datm_main.db_broker.StartTransaction;
     datm_tx_tra.qry_tx_tra_.Delete;
     datm_main.db_broker.Commit;
   except
     on E: Exception do
     begin
       datm_tx_tra.qry_tx_tra_.Cancel;
       if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
       TrataErro(E);
     end;
   end;
   pgctrl_tx_tra.ActivePage := ts_lista;
end;

procedure Tfrm_tx_tra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_tx_tra.qry_tx_tra_.Close;
  datm_tx_tra.tbl_yesno_.Close;
//  datm_tx_tra.destroy;
  datm_tx_tra.Free;
  Action := caFree;
end;

procedure Tfrm_tx_tra.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_tx_tra.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_tx_tra.qry_tx_tra_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_tx_tra.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_tx_tra.qry_tx_tra_CD_TAXA_TRA.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_tx_tra.qry_tx_tra_.Close;
  datm_tx_tra.qry_tx_tra_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_tx_tra.qry_tx_tra_.Open;
  Localiza(datm_tx_tra.qry_tx_tra_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_tx_tra.dbedt_nm_descricaoChange(Sender: TObject);
begin
  if ( datm_tx_tra.qry_tx_tra_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

function Tfrm_tx_tra.Consiste;
begin
   if dbedt_nm_descricao.Text = '' then
   begin
     BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
     dbedt_nm_descricao.SetFocus;
     lnm_tx_tra := True;
     Consiste := False;
     Exit;
   end;
   Consiste := True;
end;

procedure Tfrm_tx_tra.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_tx_tra.qry_tx_tra_CD_TAXA_TRA.AsString;
    except
      try
        Cons_Online_Texto := datm_tx_tra.qry_tx_tra_CD_TAXA_TRA.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código da Taxa TRA !', 2);
      end;  
    end;
    Close;
  end;
end;

procedure Tfrm_tx_tra.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_tx_tra.pgctrl_tx_traChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

function Tfrm_tx_tra.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_tx_tra.qry_tx_tra_.State in [dsEdit] ) and st_modificar ) or
     ( datm_tx_tra.qry_tx_tra_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro taxa de Tra foi alterado.' + #13#10 +
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


procedure Tfrm_tx_tra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 then Close;
end;

end.

unit PGSM079;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, DBCtrls, Mask, Buttons, ExtCtrls, ComCtrls, DB, Funcoes;

type
  Tfrm_tx_codesp = class(TForm)
    pgctrl_codesp: TPageControl;
    ts_dados_basicos: TTabSheet;
    pnl_amz: TPanel;
    pnl_btn_codesp: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbedt_NR_PERIODO: TDBEdit;
    dbedt_VL_ARM_GERAL_MIN: TDBEdit;
    Label21: TLabel;
    dbedt_VL_MOV_ATE_5: TDBEdit;
    Label22: TLabel;
    ebedt_VL_MOV_ACIMA_5: TDBEdit;
    Label23: TLabel;
    dbedt_VL_MOV_GRANEL: TDBEdit;
    Label24: TLabel;
    dbedt_VL_MOV_CNTR: TDBEdit;
    dbedt_VL_ARM_GRANEL_1_1: TDBEdit;
    dbedt_VL_ARM_GRANEL_1_2: TDBEdit;
    dbedt_VL_ARM_GRANEL_1_3: TDBEdit;
    dbedt_VL_ARM_GRANEL_9_1: TDBEdit;
    dbedt_VL_ARM_GRANEL_9_2: TDBEdit;
    dbedt_VL_ARM_GRANEL_9_3: TDBEdit;
    lblGranel: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    lblGeral: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    lbl1: TLabel;
    dbedt_VL_ARM_GERAL_05_1: TDBEdit;
    dbedt_VL_ARM_GERAL_05_2: TDBEdit;
    dbedt_VL_ARM_GERAL_05_3: TDBEdit;
    dbedt_VL_ARM_GERAL_10_1: TDBEdit;
    dbedt_VL_ARM_GERAL_10_2: TDBEdit;
    dbedt_VL_ARM_GERAL_10_3: TDBEdit;
    dbedt_VL_ARM_GERAL_15_1: TDBEdit;
    dbedt_VL_ARM_GERAL_15_2: TDBEdit;
    dbedt_VL_ARM_GERAL_15_3: TDBEdit;
    dbedt_VL_ARM_GERAL_99_1: TDBEdit;
    dbedt_VL_ARM_GERAL_99_2: TDBEdit;
    dbedt_VL_ARM_GERAL_99_3: TDBEdit;
    Label31: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label33: TLabel;
    Bevel6: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Bevel7: TBevel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Label2: TLabel;
    Bevel14: TBevel;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Bevel17: TBevel;
    Bevel18: TBevel;
    Bevel19: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel20: TBevel;
    Bevel21: TBevel;
    Label1: TLabel;
    Label5: TLabel;
    Bevel22: TBevel;
    Bevel23: TBevel;
    Bevel24: TBevel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label25: TLabel;
    dbedt_PC_ISS: TDBEdit;
    Bevel25: TBevel;
    Bevel26: TBevel;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedt_NR_PERIODOChange(Sender: TObject);
    procedure mi_sairClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    st_modificar, st_incluir, st_excluir : Boolean;
    function Grava    : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
  end;

var
  frm_tx_codesp: Tfrm_tx_codesp;

implementation

uses PGGP001, PGGP017, PGSM080, GSMLIB;

{$R *.DFM}

procedure Tfrm_tx_codesp.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Grava then Exit;
end;

procedure Tfrm_tx_codesp.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_tx_codesp.Cancelar;
begin
  try
    if datm_tx_codesp.qry_tx_codesp_.State in [dsInsert, dsEdit] then
    begin
      datm_tx_codesp.qry_tx_codesp_.Cancel;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_tx_codesp.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

function Tfrm_tx_codesp.Grava;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_tx_codesp.qry_tx_codesp_.State in [dsInsert, dsEdit] ) then
    begin
      datm_tx_codesp.qry_tx_codesp_.Post;
    end;
    datm_main.db_broker.Commit;
    Grava:=True;
  except
    on E: Exception do
    begin
      datm_tx_codesp.qry_tx_codesp_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_tx_codesp.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_tx_codesp, datm_tx_codesp );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_tx_codesp do
  begin
    tbl_yesno_.Open;
    qry_tx_codesp_.Prepare;
    qry_tx_codesp_.Open;
  end;

  vStr_cd_modulo:='22';
  str_cd_rotina:='2221';

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_tx_codesp.ds_tx_codesp.AutoEdit                    := st_modificar;

  st_incluir   := False;
  st_excluir   := False;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;

end;

procedure Tfrm_tx_codesp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_main.db_broker.Connected := false;
  datm_tx_codesp.qry_tx_codesp_.Close;
  datm_tx_codesp.tbl_yesno_.Close;
//  datm_tx_codesp.destroy;
  datm_tx_codesp.Free;
  Action := caFree;
end;

procedure Tfrm_tx_codesp.dbedt_NR_PERIODOChange(Sender: TObject);
begin
  if ( datm_tx_codesp.qry_tx_codesp_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_tx_codesp.mi_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_tx_codesp.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

function Tfrm_tx_codesp.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_tx_codesp.qry_tx_codesp_.State in [dsEdit] ) and st_modificar ) or
     ( datm_tx_codesp.qry_tx_codesp_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Tabela de Taxas da CODESP foi alterada.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
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


procedure Tfrm_tx_codesp.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 then Close;
end;

end.

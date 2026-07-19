unit PGSM085;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Mask, DBCtrls, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, Funcoes;

type
  Tfrm_tx_teca = class(TForm)
    Panel300: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    pgctrl_tx_teca: TPageControl;
    ts_dados_basicos: TTabSheet;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbedt_VL_ARM_05: TDBEdit;
    dbedt_VL_ARM_10: TDBEdit;
    dbedt_VL_ARM_20: TDBEdit;
    dbedt_VL_ARM_99: TDBEdit;
    dbedt_VL_CPTZ: TDBEdit;
    dbedt_VL_CPTZ_PESO_MIN: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbedt_nm_descricaoChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    st_modificar : boolean;
    st_incluir   : boolean;
    st_excluir   : boolean;
    function Grava : Boolean;
    procedure btn_mi( Op : Boolean );
  public
    { Public declarations }
  end;

var
  frm_tx_teca: Tfrm_tx_teca;

implementation

uses PGSM086, PGGP017, PGGP001, GSMLIB;

{$R *.DFM}


procedure Tfrm_tx_teca.FormCreate(Sender: TObject);
begin
  { Cria o DataModule do Taxa Teca }

  Application.CreateForm(Tdatm_tx_teca, datm_tx_teca );

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  vStr_cd_modulo:='22';
  str_cd_rotina:='2224';

  datm_tx_teca.qry_tx_teca_.Open;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_tx_teca.ds_tx_teca.AutoEdit                   := st_modificar;
  st_incluir := False;
  st_excluir := False;  

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;

end;

procedure Tfrm_tx_teca.btn_incluirClick(Sender: TObject);
begin
         btn_incluir.Enabled := False;
         mi_incluir.Enabled  := False;
         btn_excluir.Enabled := False;
         mi_excluir.Enabled  := False;
         with datm_tx_teca do
         begin
           qry_tx_teca_.DisableControls;
           qry_tx_teca_.Cancel;
           qry_tx_teca_.Append;
           qry_tx_teca_.EnableControls;
         end;

        pgctrl_tx_teca.ActivePage := ts_dados_basicos;
end;

procedure Tfrm_tx_teca.btn_salvarClick(Sender: TObject);
begin
  //if Not Consiste then Exit;
  ActiveControl := nil;
  if Not Grava then Exit;
end;

procedure Tfrm_tx_teca.btn_cancelarClick(Sender: TObject);
begin
   try
     if datm_tx_teca.qry_tx_teca_.State in [dsInsert, dsEdit] then
     begin
       datm_tx_teca.qry_tx_teca_.Cancel;
       pgctrl_tx_teca.ActivePage := ts_dados_basicos;
       dbedt_VL_ARM_05.SetFocus;       
     end;
   except
     BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
   end;
   Btn_Mi(True);
end;

function Tfrm_tx_teca.Grava;
begin
           try
             datm_main.db_broker.StartTransaction;
             if ( datm_tx_teca.qry_tx_teca_.State in [dsInsert, dsEdit] ) then
             begin
               datm_tx_teca.qry_tx_teca_.Post;
             end;
             datm_main.db_broker.Commit;
             Grava:=True;
           except
             on E: Exception do
             begin
               datm_tx_teca.qry_tx_teca_.Cancel;
               if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
               TrataErro(E);
               Grava := False;
             end;
           end;
      Btn_Mi(True);
end;

procedure Tfrm_tx_teca.btn_sairClick(Sender: TObject);
begin
   if ( datm_tx_teca.qry_tx_teca_.State in [dsInsert, dsEdit] ) then
   begin
     if BoxMensagem('Cadastro taxa TECA foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1) then
        begin
          //if Not Consiste then Exit;
          if Not Grava then Exit;
        end
        else
        begin
          Btn_Mi(True);
          datm_tx_teca.qry_tx_teca_.Cancel;
        end;
   end;
   Close;
end;

procedure Tfrm_tx_teca.btn_mi( Op : Boolean );
begin
  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;
  btn_salvar.Enabled   := not Op;
  mi_salvar.Enabled    := not Op;
  btn_Cancelar.Enabled := not Op;
  mi_Cancelar.Enabled  := not Op;
end;

procedure Tfrm_tx_teca.dbedt_nm_descricaoChange(Sender: TObject);
begin
   if ( datm_tx_teca.qry_tx_teca_.State in [ dsInsert, dsEdit ] ) then
   begin
     btn_Salvar.Enabled   := True;
     btn_Cancelar.Enabled := True;
     mi_Cancelar.Enabled  := True;
     mi_Salvar.Enabled    := True;

     btn_incluir.Enabled  :=  False;
     btn_excluir.Enabled  :=  False;
     mi_incluir.Enabled   :=  False;
     mi_excluir.Enabled   :=  False;
   end;
end;


procedure Tfrm_tx_teca.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #27 then Close;
end;

end.

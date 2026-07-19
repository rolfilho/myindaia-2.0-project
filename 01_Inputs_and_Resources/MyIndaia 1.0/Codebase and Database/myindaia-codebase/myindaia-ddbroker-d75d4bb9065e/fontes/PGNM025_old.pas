unit PGNM025_old;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, Menus, DB, DBTables, Mask, UCRPE32,
  DBCGrids;

type
  Tfrm_print_recibo_old = class(TForm)
    pnl_print: TPanel;
    pnl_dados: TPanel;
    btn_incluir_ref: TSpeedButton;
    btn_salvar_ref: TSpeedButton;
    Label1: TLabel;
    lbl_cliente: TLabel;
    Label2: TLabel;
    lbl_quantia: TLabel;
    Label3: TLabel;
    dbmemo_referente: TDBMemo;
    btn_memo_ref_: TSpeedButton;
    lbl_valor: TLabel;
    btn_cancelar_ref: TSpeedButton;
    btn_excluir_ref: TSpeedButton;
    btn_imprimir_recibo: TSpeedButton;
    btn_sair: TSpeedButton;
    menu: TMainMenu;
    mi_incluir_ref: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar_referencia: TMenuItem;
    mi_excluir_referencia: TMenuItem;
    mi_imprimir_recibo: TMenuItem;
    mi_sair: TMenuItem;
    dbnav_ref: TDBNavigator;
    lbl_data: TLabel;
    crystallRecibo: TCrpe;
    dbctrlGrid_Ref: TDBCtrlGrid;
    dbmemoref_: TDBMemo;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluir_refClick(Sender: TObject);
    procedure btn_salvar_refClick(Sender: TObject);
    procedure btn_cancelar_refClick(Sender: TObject);
    procedure btn_excluir_refClick(Sender: TObject);
    procedure btn_imprimir_reciboClick(Sender: TObject);
    procedure dbmemo_referenteChange(Sender: TObject);
    procedure verifica_estado;
    procedure Ver_Alt;
    procedure dbmemoref_DblClick(Sender: TObject);
    procedure btn_memo_ref_Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nr_proc: String;
    cd_usuario : String[4];
    vl_recibo : double;
  end;

var
  frm_print_recibo_old: Tfrm_print_recibo_old;

implementation

uses PGNM026, GSMLIB, PGNM004, PGGP001, PGGP017;

{$R *.DFM}

procedure Tfrm_print_recibo_old.verifica_estado;
begin
   with frm_print_recibo_old do
   begin
      btn_incluir_ref.Enabled             := not( datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit]);
      mi_incluir_ref.Enabled              := not( datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit]);
      btn_excluir_ref.Enabled             := not( datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit]);
      mi_excluir_referencia.Enabled       := not( datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit]);
      btn_imprimir_recibo.Enabled         := not( datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit]);
      mi_imprimir_recibo.Enabled          := not( datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit]);
      btn_salvar_ref.Enabled              := datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit];
      mi_salvar.Enabled                   := datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit];
      btn_cancelar_ref.Enabled            := datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit];
      mi_cancelar_referencia.Enabled      := datm_print_recibo.qry_ref_.State in [dsInsert, dsEdit];
   end;
end;

procedure Tfrm_print_recibo_old.Ver_Alt;
begin
   if datm_print_recibo.qry_ref_.State in [dsInsert,dsEdit] then
   begin
      if BoxMensagem('O cadastro de notas de refência foi alterado. Salva alterações?',1)
      then btn_salvar_refClick(nil)
      else btn_cancelar_refClick(nil);
   end;
   verifica_estado;
end;

procedure Tfrm_print_recibo_old.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_print_recibo_old.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var i: Integer;
begin
   Ver_Alt;
   for i := 0 to datm_print_recibo.ComponentCount - 1 do
   begin
      if Components[i] is TQuery then ( Components[i] as tQuery ).Close;
      if Components[i] is TTable then ( Components[i] as tTable ).Close;
   end;
   datm_print_recibo.Free;
   Action := caFree;
end;

procedure Tfrm_print_recibo_old.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_print_recibo, datm_print_recibo );
  datm_print_recibo.qry_ref_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
  datm_print_recibo.qry_ref_.Prepare;
  datm_print_recibo.qry_ref_.Open;
end;

procedure Tfrm_print_recibo_old.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_print_recibo_old.btn_incluir_refClick(Sender: TObject);
begin
  with datm_print_recibo do
  begin
     qry_ref_.Append;
  end;
  verifica_estado;
  dbmemo_referente.SetFocus;
end;

procedure Tfrm_print_recibo_old.btn_salvar_refClick(Sender: TObject);
var codigo: String;
begin
   with datm_print_recibo.qry_ref_ do
   begin
     try
        ActiveControl := nil;
        FieldByName('CD_USUARIO').AsString := str_cd_usuario;
        Post;
        codigo := FieldByName('CD_REFERENCIA').asString;
        Close;
        Open;
        Locate('CD_REFERENCIA', codigo, [] );
     except
        BoxMensagem( 'Não foi possível gravar!', 2 );
        verifica_estado;
     end;
   end;
   verifica_estado;
   dbmemo_referente.SetFocus;
end;

procedure Tfrm_print_recibo_old.btn_cancelar_refClick(Sender: TObject);
begin
  datm_print_recibo.qry_ref_.Cancel;
  verifica_estado;
  dbmemo_referente.SetFocus;
end;

procedure Tfrm_print_recibo_old.btn_excluir_refClick(Sender: TObject);
begin
  if BoxMensagem('Deseja mesmo apagar este registro?',1) then
  begin
   try
    datm_print_recibo .qry_ref_.Delete;
    datm_print_recibo .qry_ref_.Close;
    datm_print_recibo .qry_ref_.Open;
   except
   end;
  end;
  verifica_estado;
  dbmemo_referente.SetFocus;
end;

procedure Tfrm_print_recibo_old.btn_imprimir_reciboClick(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   Ver_Alt;
   with crystallRecibo do
   begin
      Connect     := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
      ReportName  := cDir_Rpt + '\CRNM008bkp.RPT';
      ReportTitle := 'Recibo';
      Formulas[0] := 'nr_processo = "'+ nr_proc + '"';
      Formulas[1] := 'ValorNum = "'+ lbl_valor.Caption + '"';
      Formulas[2] := 'ValorStr = "'+ Extenso( vl_recibo ) + '"';
      Formulas[3] := 'CodRef = "'+ datm_print_recibo.qry_ref_CD_REFERENCIA.AsString + '"';
      Formulas[4] := 'DtEmissao = "' + lbl_data.Caption + '"';
      Formulas[5] := 'Cliente = "' + lbl_cliente.Caption + '"';
      Execute;
   end;
   Screen.Cursor  := crDefault;
end;

procedure Tfrm_print_recibo_old.dbmemo_referenteChange(Sender: TObject);
begin
   verifica_estado;
end;

procedure Tfrm_print_recibo_old.dbmemoref_DblClick(Sender: TObject);
begin
  dbctrlGrid_Ref.Visible := False;
end;

procedure Tfrm_print_recibo_old.btn_memo_ref_Click(Sender: TObject);
begin
   dbctrlGrid_Ref.Visible := True;
end;

end.

unit PGSM186;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, Funcoes, dblookup;

type
  Tfrm_acordo = class(TForm)
    pgctrl_acordo: TPageControl;
    ts_lista: TTabSheet;
    dbg_acordo: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_acordo: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_ativo: TLabel;
    dbedt_cd_acordo: TDBEdit;
    dbedt_nm_acordo: TDBEdit;
    dblkpcbox_ativo_favor: TDBLookupComboBox;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    ts_normas: TTabSheet;
    Panel2: TPanel;
    dbgrd_norma: TDBGrid;
    Panel3: TPanel;
    lbl_norma: TLabel;
    dbedt_cd_norma: TDBEdit;
    btn_co_norma: TSpeedButton;
    ts_pais: TTabSheet;
    Panel4: TPanel;
    dbgrd_pais: TDBGrid;
    Panel5: TPanel;
    lbl_pais: TLabel;
    btn_co_pais: TSpeedButton;
    dbedt_cd_pais: TDBEdit;
    dbedt_nm_pais: TDBEdit;
    lbl_descr_pais: TLabel;
    lbl_descr_norma: TLabel;
    dbedt_nm_norma: TDBEdit;
    pnl_cadastro: TPanel;
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
    dbedt_Fiesp: TDBEdit;
    SpeedButton3: TSpeedButton;
    Label6: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_acordoChange(Sender: TObject);
    procedure dbedt_nm_acordoChange(Sender: TObject);
    procedure dbg_acordoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrl_acordoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_paisClick(Sender: TObject);
    procedure dbedt_cd_normaExit(Sender: TObject);
    procedure btn_co_normaClick(Sender: TObject);
    procedure dbedt_cd_normaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_paisExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbg_acordoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
  private
    OnChanging : Boolean;
    a_str_indices : Array[0..2] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_acordo: Tfrm_acordo;

implementation

Uses PGSM187, PGGP017, GSMLIB, PGGP001, PGSM188, KrUtil, KrDialog;

{$R *.DFM}


procedure Tfrm_acordo.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_acordo do
  begin

    if (pgctrl_acordo.ActivePage = ts_lista) or (pgctrl_acordo.ActivePage = ts_dados_basicos) then
    begin
      qry_acordo_.DisableControls;
      qry_acordo_.Cancel;
      qry_acordo_.Append;
      qry_acordo_.EnableControls;
      pgctrl_acordo.ActivePage := ts_dados_basicos;

      dbedt_cd_acordo.Color := clWindow;
      dbedt_cd_acordo.ReadOnly := False;
      dbedt_cd_acordo.SetFocus;
    end
    else if (pgctrl_acordo.ActivePage = ts_normas) then
    begin
      qry_acordo_norma_.DisableControls;
      qry_acordo_norma_.Cancel;
      qry_acordo_norma_.Append;
      qry_acordo_norma_.EnableControls;
      pgctrl_acordo.ActivePage := ts_normas;

      lbl_norma.Enabled      := True;
      lbl_descr_norma.Enabled:= True;
      dbedt_cd_norma.Enabled := True;
      dbedt_nm_norma.Enabled := True;
      btn_co_norma.Enabled   := True;

      dbedt_cd_norma.SetFocus;
    end
    else if (pgctrl_acordo.ActivePage = ts_pais) then
    begin
      qry_acordo_pais_.DisableControls;
      qry_acordo_pais_.Cancel;
      qry_acordo_pais_.Append;
      qry_acordo_pais_.EnableControls;
      pgctrl_acordo.ActivePage := ts_pais;

      lbl_pais.Enabled       := True;
      lbl_descr_pais.Enabled := True;
      dbedt_cd_pais.Enabled  := True;
      dbedt_nm_pais.Enabled  := True;
      btn_co_pais.Enabled    := True;

      dbedt_cd_pais.SetFocus;
    end;
  end;
end;

procedure Tfrm_acordo.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;

  pgctrl_acordo.SetFocus;
  dbedt_cd_acordo.Color := clBtnFace;
  dbedt_cd_acordo.ReadOnly := True;

end;

procedure Tfrm_acordo.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_acordo.Cancelar;
begin
  try
    if pgctrl_acordo.ActivePage = ts_dados_basicos then
    begin
      if datm_acordo.qry_acordo_.State in [dsInsert, dsEdit] then
      begin
        datm_acordo.qry_acordo_.Cancel;
        pgctrl_acordo.ActivePage := ts_dados_basicos;
      end;

      dbedt_cd_acordo.Color := clBtnFace;
      dbedt_cd_acordo.ReadOnly := True;

      btn_mi( st_incluir, False, False, st_excluir );
    end
    else if pgctrl_acordo.ActivePage = ts_normas then
    begin
      if datm_acordo.qry_acordo_norma_.State in [dsInsert, dsEdit] then
      begin
        datm_acordo.qry_acordo_norma_.Cancel;
        pgctrl_acordo.ActivePage := ts_normas;
      end;
      Btn_Mi(st_incluir, False, False, st_excluir );
    end
    else if pgctrl_acordo.ActivePage = ts_pais then
    begin
      if datm_acordo.qry_acordo_pais_.State in [dsInsert, dsEdit] then
      begin
        datm_acordo.qry_acordo_pais_.Cancel;
        pgctrl_acordo.ActivePage := ts_pais;
      end;
      Btn_Mi(st_incluir, False, False, st_excluir );

    end;

    pgctrl_acordo.SetFocus;

  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;

end;

procedure Tfrm_acordo.btn_excluirClick(Sender: TObject);
begin
  if (pgctrl_acordo.ActivePage = ts_lista) or (pgctrl_acordo.ActivePage = ts_dados_basicos) then
  begin
    if BoxMensagem( 'Esta Acordo será excluído! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;

      datm_acordo.qry_apaga_norma_.Close;
      datm_acordo.qry_apaga_norma_.ParamByName('CD_ACORDO').AsString := datm_acordo.qry_acordo_CODIGO.AsString;
      datm_acordo.qry_apaga_norma_.ExecSQL;

      datm_acordo.qry_apaga_pais_.Close;
      datm_acordo.qry_apaga_pais_.ParamByName('CD_ACORDO').AsString := datm_acordo.qry_acordo_CODIGO.AsString;
      datm_acordo.qry_apaga_pais_.ExecSQL;

      datm_acordo.qry_acordo_.Delete;
      datm_main.db_broker.Commit;

      pgctrl_acordo.ActivePage:=ts_lista;
    except
      on E: Exception do
      begin
        datm_acordo.qry_acordo_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end
  else if (pgctrl_acordo.ActivePage = ts_normas) then
  begin
    if BoxMensagem( 'Esta Norma será excluída do Acordo ! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_acordo.qry_acordo_norma_.Delete;
      datm_main.db_broker.Commit;
      pgctrl_acordo.ActivePage:=ts_normas;
    except
      on E: Exception do
      begin
        datm_acordo.qry_acordo_norma_.cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end
  else if (pgctrl_acordo.ActivePage = ts_pais) then
  begin
    if BoxMensagem( 'Este País será excluído do Acordo ! Confirma exclusão?', 1 ) Then
    try
      datm_main.db_broker.StartTransaction;
      datm_acordo.qry_acordo_pais_.Delete;
      datm_main.db_broker.Commit;
      pgctrl_acordo.ActivePage:=ts_pais;
    except
      on E: Exception do
      begin
        datm_acordo.qry_acordo_pais_.cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end

end;

procedure Tfrm_acordo.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_acordo.edt_chaveChange(Sender: TObject);
begin
  if pgctrl_acordo.ActivePage = ts_lista then
    Localiza(datm_acordo.qry_acordo_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
  else if pgctrl_acordo.ActivePage = ts_normas then
    Localiza(datm_acordo.qry_acordo_norma_, edt_chave.Text, 'CD_NORMA' )
  else if pgctrl_acordo.ActivePage = ts_pais then
    Localiza(datm_acordo.qry_acordo_pais_, edt_chave.Text, 'CD_PAIS' );

end;

procedure Tfrm_acordo.cb_ordemClick(Sender: TObject);
begin

  if pgctrl_acordo.ActivePage = ts_lista then
  begin
    Pesquisa := datm_acordo.qry_acordo_CODIGO.AsString;
    edt_chave.Text := '';
    datm_acordo.qry_acordo_.Close;
    datm_acordo.qry_acordo_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
    datm_acordo.qry_acordo_.Open;

    Localiza(datm_acordo.qry_acordo_, Pesquisa, a_str_indices[0] );
    edt_chave.SetFocus;
  end;

end;

procedure Tfrm_acordo.pgctrl_acordoChange(Sender: TObject);
begin
  OnChanging := False;

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  if (pgctrl_acordo.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled := True;
    dbnvg.DataSource := datm_acordo.ds_acordo;
    edt_chave.Enabled := True;
    cb_ordem.Enabled := True;
  end
  else if (pgctrl_acordo.ActivePage = ts_normas ) then
  begin
    btn_incluir.Enabled := True;
    mi_incluir.Enabled  := True;
    btn_excluir.Enabled := True;
    mi_excluir.Enabled  := True;
    dbnvg.Enabled := True;
    dbnvg.DataSource := datm_acordo.ds_acordo_norma;
    edt_chave.Enabled := True;
    cb_ordem.Enabled := False;

    if datm_acordo.qry_acordo_norma_CD_ACORDO.AsString <> '' then
    begin
      lbl_norma.Enabled      := True;
      lbl_descr_norma.Enabled:= True;
      dbedt_cd_norma.Enabled := True;
      dbedt_nm_norma.Enabled := True;
      btn_co_norma.Enabled   := True;
    end
    else
    begin
      lbl_norma.Enabled      := False;
      lbl_descr_norma.Enabled:= False;
      dbedt_cd_norma.Enabled := False;
      dbedt_nm_norma.Enabled := False;
      btn_co_norma.Enabled   := False;
    end;
  end
  else if (pgctrl_acordo.ActivePage = ts_pais ) then
  begin
    btn_incluir.Enabled := True;
    mi_incluir.Enabled  := True;
    btn_excluir.Enabled := True;
    mi_excluir.Enabled  := True;
    dbnvg.Enabled := True;
    dbnvg.DataSource := datm_acordo.ds_acordo_pais;
    edt_chave.Enabled := True;
    cb_ordem.Enabled := False;

    if datm_acordo.qry_acordo_pais_CD_ACORDO.AsString <> '' then
    begin
      lbl_pais.Enabled       := True;
      lbl_descr_pais.Enabled := True;
      dbedt_cd_pais.Enabled  := True;
      dbedt_nm_pais.Enabled  := True;
      btn_co_pais.Enabled    := True;
    end
    else
    begin
      lbl_pais.Enabled       := False;
      lbl_descr_pais.Enabled := False;
      dbedt_cd_pais.Enabled  := False;
      dbedt_nm_pais.Enabled  := False;
      btn_co_pais.Enabled    := False;
    end;

    datm_acordo.qryClassificacao.Close;
    datm_acordo.qryClassificacao.Open;
  end
  else
  begin
    dbnvg.Enabled := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
    dbedt_cd_acordo.Color := clBtnFace;
    dbedt_cd_acordo.ReadOnly := True;
  end;

end;

procedure Tfrm_acordo.dbedt_nm_acordoChange(Sender: TObject);
begin
  if ( datm_acordo.qry_acordo_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_acordo.dbg_acordoDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_acordo.qry_acordo_CODIGO.AsString;
    except
      try
        Cons_Online_Texto := datm_acordo.qry_acordo_CODIGO.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do Acordo !', 2);
      end;
    end;
    Close;
  end;
end;

function Tfrm_acordo.Grava;
begin
  try
    datm_main.db_broker.StartTransaction;
    if pgctrl_acordo.ActivePage = ts_dados_basicos then
    begin
      if ( datm_acordo.qry_acordo_.State in [dsInsert, dsEdit] ) then
        datm_acordo.qry_acordo_.Post;
      Btn_Mi(False, False, False, False );
    end
    else if pgctrl_acordo.ActivePage = ts_normas then
    begin
      if ( datm_acordo.qry_acordo_norma_.State in [dsInsert, dsEdit] ) then
      begin
        datm_acordo.qry_acordo_norma_CD_ACORDO.AsString := datm_acordo.qry_acordo_CODIGO.AsString;
        datm_acordo.qry_acordo_norma_.Post;
      end;
    end
    else if pgctrl_acordo.ActivePage = ts_pais then
    begin
      if ( datm_acordo.qry_acordo_pais_.State in [dsInsert, dsEdit] ) then
      begin
        datm_acordo.qry_acordo_pais_CD_ACORDO.AsString := datm_acordo.qry_acordo_CODIGO.AsString;
        datm_acordo.qry_acordo_pais_.Post;
      end;
    end;

    datm_main.db_broker.Commit;
    Grava:=True;

    if pgctrl_acordo.ActivePage = ts_normas then
    begin
      datm_acordo.qry_acordo_norma_.Close;
      datm_acordo.qry_acordo_norma_.Prepare;
      datm_acordo.qry_acordo_norma_.Open;
      Btn_Mi(st_incluir, False, False, st_excluir );
    end
    else if pgctrl_acordo.ActivePage = ts_pais then
    begin
      datm_acordo.qry_acordo_pais_.Close;
      datm_acordo.qry_acordo_pais_.Prepare;
      datm_acordo.qry_acordo_pais_.Open;
      Btn_Mi(st_incluir, False, False, st_excluir );
    end;

  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);

      if pgctrl_acordo.ActivePage = ts_dados_basicos then datm_acordo.qry_acordo_.cancel;
      if pgctrl_acordo.ActivePage = ts_normas        then datm_acordo.qry_acordo_norma_.cancel;
      if pgctrl_acordo.ActivePage = ts_pais          then datm_acordo.qry_acordo_pais_.cancel;

      Grava := False;
    end;
  end;
end;

procedure Tfrm_acordo.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

function Tfrm_acordo.Consiste;
begin

  if pgctrl_acordo.ActivePage = ts_dados_basicos then
  begin
    if dbedt_nm_acordo.Text = '' then
    begin
      BoxMensagem('Campo ''Nome'' deve ser preenchido!', 2);
      dbedt_nm_acordo.SetFocus;
      Consiste := False;
      exit;
    end;
  end
  else if pgctrl_acordo.ActivePage = ts_normas then
  begin
    if dbedt_cd_norma.Text <> '' then
    begin
      if dbedt_nm_norma.Text = '' then
      begin
        BoxMensagem('Código da Norma inválido !',2);
        pgctrl_acordo.ActivePage := ts_normas;
        dbedt_cd_norma.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end
  else if pgctrl_acordo.ActivePage = ts_pais then
  begin
    if dbedt_cd_pais.Text <> '' then
    begin
      if dbedt_nm_pais.Text = '' then
      begin
        BoxMensagem('Código do País inválido !',2);
        pgctrl_acordo.ActivePage := ts_pais;
        dbedt_cd_pais.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  Consiste := True;
end;

procedure Tfrm_acordo.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_acordo, datm_acordo );

end;

procedure Tfrm_acordo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_acordo.qry_acordo_.Close;
  datm_acordo.qry_acordo_norma_.Close;
  datm_acordo.qry_acordo_pais_.Close;
  datm_acordo.qry_normas_.Close;
  datm_acordo.qry_apaga_norma_.Close;
  datm_acordo.qry_apaga_pais_.Close;
  datm_acordo.tbl_yesno_.Close;

  datm_acordo.destroy;

  Action := caFree;
end;

procedure Tfrm_acordo.pgctrl_acordoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

function Tfrm_acordo.VerAlt : Boolean;
begin
  VerAlt := True;

  if pgctrl_acordo.ActivePage = ts_dados_basicos then
  begin
    if ( ( datm_acordo.qry_acordo_.State in [dsEdit] ) and st_modificar ) or
       ( datm_acordo.qry_acordo_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Acordo foi alterado.' + #13#10 +
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
  end
  else if pgctrl_acordo.ActivePage = ts_normas then
  begin
    if ( ( datm_acordo.qry_acordo_norma_.State in [dsEdit] ) and st_modificar ) or
       ( datm_acordo.qry_acordo_norma_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Tabela de Norma/Acordo foi alterado.' + #13#10 +
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
  end
  else if pgctrl_acordo.ActivePage = ts_pais then
  begin
    if ( ( datm_acordo.qry_acordo_pais_.State in [dsEdit] ) and st_modificar ) or
       ( datm_acordo.qry_acordo_pais_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Tabela de País/Acordo foi alterado.' + #13#10 +
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
  end

end;


procedure Tfrm_acordo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;






procedure Tfrm_acordo.btn_co_paisClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TPAIS',
                datm_acordo.qry_acordo_pais_CD_PAIS,
                'País', 1, '', 'TQuery');
  dbedt_cd_paisExit(nil);
end;

procedure Tfrm_acordo.dbedt_cd_normaExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_acordo.btn_co_normaClick(Sender: TObject);
begin
  with datm_acordo do
  begin
    vStr_cd_modulo := '22';
    str_cd_rotina := '2251';

    Application.CreateForm( Tfrm_normas, frm_normas );
    if qry_acordo_norma_.State in [dsInsert] then
       frm_normas.cd_acordo   := ''
    else
       frm_normas.cd_acordo   := qry_acordo_CODIGO.AsString;
    frm_normas.Cons_OnLine := qry_acordo_norma_CD_NORMA;
    with frm_normas do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( qry_acordo_norma_.State in [dsEdit, dsInsert] ) then qry_acordo_norma_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    qry_normas_.Close;
    qry_normas_.Prepare;
    qry_normas_.Open;

    vStr_cd_modulo := '22';
    str_cd_rotina := '2250';
    dbedt_cd_normaExit(nil);
  end;
end;

procedure Tfrm_acordo.dbedt_cd_normaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_norma  then btn_co_normaClick(nil);
    if Sender = dbedt_cd_pais   then btn_co_paisClick(nil);
  end;
end;

procedure Tfrm_acordo.dbedt_cd_paisExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_acordo.FormShow(Sender: TObject);
begin

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  with datm_acordo do
  begin
    tbl_yesno_.Open;

    qry_pais_.Close;
    qry_pais_.Prepare;
    qry_pais_.Open;

    qry_acordo_.Close;
    qry_acordo_.SQL[2] := 'NOME';
    qry_acordo_.Prepare;
    qry_acordo_.Open;
  end;

  a_str_indices[0] := 'CODIGO';
  a_str_indices[1] := 'NOME';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Nome');
    ItemIndex := 1;
  end;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_acordo.ds_acordo.AutoEdit   := st_modificar;

  // btn_incluir.Enabled              := st_incluir;
  // mi_incluir.Enabled               := st_incluir;
  // btn_excluir.Enabled              := st_excluir;
  // mi_excluir.Enabled               := st_excluir;

  datm_acordo.qry_acordo_.Close;
  datm_acordo.qry_acordo_.Open;

  datm_acordo.qry_acordo_norma_.Prepare;
  datm_acordo.qry_acordo_norma_.Open;

  datm_acordo.qry_acordo_pais_.Prepare;
  datm_acordo.qry_acordo_pais_.Open;

  pgctrl_acordo.ActivePage := ts_lista;
  edt_chave.SetFocus;

  btn_mi( st_incluir, False, False, st_excluir );
  pnl_cadastro.Color := clMenuBroker;
end;

procedure Tfrm_acordo.dbg_acordoKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) and ( pgctrl_acordo.ActivePage = ts_lista ) then
     dbg_acordoDblClick(Sender);
end;

procedure Tfrm_acordo.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_acordoDblClick(nil);
end;

procedure Tfrm_acordo.SpeedButton3Click(Sender: TObject);
begin
  if not (datm_acordo.qry_acordo_.State in [dsEdit, dsInsert]) then
    datm_acordo.qry_acordo_.Edit;
  dbedt_nm_acordoChange(nil);
  ExecAndWaitRun(GetCODFullPath,
    '/Consulta /Acordo /Classe Tfrm_acordo /Form "Cadastro de Acordo"',
    'TFormList', 'Lista', SW_SHOW);
end;

procedure Tfrm_acordo.WMCopyData(var Msg: TWMCopyData);
var
  s: string;
begin
  if Msg.CopyDataStruct.dwData = 2 then
  begin
    s := PChar(Msg.CopyDataStruct.lpData);
    datm_acordo.qry_acordo_FIESP_ID.AsString := s;
  end
  else
  begin
    msg.Result := 0;
    Reject('Tipo de dados não suportado!');
  end;
  msg.Result := 1;
end;

procedure Tfrm_acordo.DBLookupComboBox1Click(Sender: TObject);
begin
  if ( datm_acordo.qry_acordo_PAIS_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

end.

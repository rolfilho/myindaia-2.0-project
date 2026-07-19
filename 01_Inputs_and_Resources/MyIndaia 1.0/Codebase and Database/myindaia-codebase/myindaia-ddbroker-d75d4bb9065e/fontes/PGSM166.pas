unit PGSM166;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls;

type
  Tfrm_inst_negoc = class(TForm)
    pgctrl_inst_negoc: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_descricao: TLabel;
    dbedt_nm_inst_negoc: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    dbgrd_inst_negoc: TDBGrid;
    ts_inst_negoc_pais: TTabSheet;
    pgctrl_inst_negoc_pais: TPageControl;
    ts_lista2: TTabSheet;
    dbgrd_inst_negoc_pais: TDBGrid;
    ts_dados_basicos2: TTabSheet;
    pnl_inst_negoc_pais: TPanel;
    lbl_pais: TLabel;
    btn_co_pais: TSpeedButton;
    lbl_inst_negoc2: TLabel;
    dbedt_cd_pais: TDBEdit;
    dbedt_nm_pais: TDBEdit;
    dbedt_cd_ct_contabil3: TDBEdit;
    dbedt_nm_inst_negoc3: TDBEdit;
    lbl_inst_negoc: TLabel;
    dbedt_cd_inst_negoc2: TDBEdit;
    dbedt_nm_inst_negoc2: TDBEdit;
    lbl_codigo: TLabel;
    dbedt_cd_inst_negoc: TDBEdit;
    lbl_ativo: TLabel;
    dblkpcbox_ativo: TDBLookupComboBox;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrd_inst_negocDblClick(Sender: TObject);
    procedure dbgrd_inst_negocKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_nm_inst_negocChange(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_inst_negocChange(Sender: TObject);
    procedure dbedt_cd_paisChange(Sender: TObject);
    procedure dbedt_cd_paisExit(Sender: TObject);
    procedure btn_co_paisClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure pgctrl_inst_negocChanging(Sender: TObject; var AllowChange: Boolean);
    procedure Cancelar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_classifKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgctrl_inst_negoc_paisChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_cd_inst_negocExit(Sender: TObject);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  public
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_Online_Texto : String;
  end;

var
  frm_inst_negoc: Tfrm_inst_negoc;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM096, PGSM165;

{$R *.DFM}

procedure Tfrm_inst_negoc.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_inst_negoc.btn_incluirClick(Sender: TObject);
begin
  if ( pgctrl_inst_negoc.ActivePage = ts_dados_basicos ) or
     ( pgctrl_inst_negoc.ActivePage = ts_lista ) then
  begin
    with datm_inst_negoc do
    begin
      qry_inst_negoc_.DisableControls;
      qry_inst_negoc_.Cancel;
      qry_inst_negoc_.Append;

      qry_inst_negoc_CD_INST_NEGOC.AsString := UltCod( qry_ult_inst_negoc_, qry_ult_inst_negoc_ULTIMO );
      qry_inst_negoc_IN_ATIVO.AsString := '1';
      qry_inst_negoc_.EnableControls;
    end;
    pgctrl_inst_negoc.ActivePage := ts_dados_basicos;
    dbedt_nm_inst_negoc.SetFocus;
  end
  else if pgctrl_inst_negoc.ActivePage = ts_inst_negoc_pais then {Instrumento de Negociação X Países}
  begin
    with datm_inst_negoc do
    begin
      if qry_inst_negoc_.RecordCount = 0  then
      begin
        BoxMensagem('Selecione um Instrumento de Negociação!', 2);
        Cancelar;
        pgctrl_inst_negoc.ActivePage := ts_lista;
        Exit;
      end;

      pgctrl_inst_negoc_pais.Enabled := True;
      qry_inst_negoc_pais_.DisableControls;
      qry_inst_negoc_pais_.Cancel;
      qry_inst_negoc_pais_.Append;
      qry_inst_negoc_pais_.EnableControls;

      qry_inst_negoc_pais_CD_INST_NEGOC.AsString := qry_inst_negoc_CD_INST_NEGOC.AsString;
    end;
    pgctrl_inst_negoc_pais.ActivePage            := ts_dados_basicos2;
    pnl_inst_negoc_pais.Enabled                  := True;
    dbedt_cd_pais.SetFocus;
  end;

  btn_mi( False, True, True, False );

  dbnvg.Enabled     := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled  := False;

end;

procedure Tfrm_inst_negoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_inst_negoc do
    begin
      tbl_yesno_.Close;
      qry_inst_negoc_.Close;
      qry_pais_.Close;
      qry_inst_negoc_pais_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_inst_negoc.dbgrd_inst_negocDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_inst_negoc.qry_inst_negoc_CD_INST_NEGOC.AsString;
    except
      try
         Cons_Online_Texto := datm_inst_negoc.qry_inst_negoc_CD_INST_NEGOC.AsString;
      except
         BoxMensagem('Não foi possível retornar o Código do Instrumento de Negociação!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_inst_negoc.dbgrd_inst_negocKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbgrd_inst_negocDblClick(nil);
end;

procedure Tfrm_inst_negoc.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  { Inicializa o Data Module para Conta Contábil}
  Application.CreateForm( Tdatm_inst_negoc, datm_inst_negoc );

  with datm_inst_negoc do
  begin
    ds_inst_negoc.AutoEdit      := st_modificar;
    ds_inst_negoc_pais.AutoEdit := st_modificar;

    tbl_yesno_.Open;

    qry_pais_.Close;
    qry_pais_.Prepare;
    qry_pais_.Open;

    qry_inst_negoc_.Close;
    qry_inst_negoc_.SQL[2] := 'NM_INST_NEGOC';
    qry_inst_negoc_.Prepare;
    qry_inst_negoc_.Open;

    qry_inst_negoc_pais_.Close;
    qry_inst_negoc_pais_.ParamByName('CD_INST_NEGOC').AsString := qry_inst_negoc_CD_INST_NEGOC.AsString;
    qry_inst_negoc_pais_.Prepare;
    qry_inst_negoc_pais_.Open;
  end;

  a_str_indices[0] := 'CD_INST_NEGOC';
  a_str_indices[1] := 'NM_INST_NEGOC';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_inst_negoc.btn_excluirClick(Sender: TObject);
begin
  with datm_inst_negoc do
  begin
    if ( pgctrl_inst_negoc.ActivePage = ts_dados_basicos ) or
       ( pgctrl_inst_negoc.ActivePage = ts_lista ) then
    begin
      if BoxMensagem( 'Este Instrumento de Negociação será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        {Instrumento de Negociação X País}
        CloseStoredProc(sp_exclui_inst_negoc);
        sp_exclui_inst_negoc.ParamByName('@CD_INST_NEGOC').AsString := qry_inst_negoc_CD_INST_NEGOC.AsString;
        ExecStoredProc(sp_exclui_inst_negoc);
        CloseStoredProc(sp_exclui_inst_negoc);
        {Instrumento de Negociação}
        qry_inst_negoc_.Delete;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          qry_inst_negoc_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      pgctrl_inst_negoc.ActivePage := ts_lista;
    end
    else if pgctrl_inst_negoc.ActivePage = ts_inst_negoc_pais then
    begin
      if qry_inst_negoc_pais_.RecordCount = 0 then Exit;
      if BoxMensagem( 'Este Instrumento de Negociação x País será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        qry_inst_negoc_pais_.Delete;
        datm_main.db_broker.Commit;
        qry_inst_negoc_pais_.Close;
        qry_inst_negoc_pais_.Prepare;
        qry_inst_negoc_pais_.Open;
      except
        on E: Exception do
        begin
          qry_inst_negoc_pais_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      pgctrl_inst_negoc.ActivePage := ts_lista2;
    end;
  end;
end;

procedure Tfrm_inst_negoc.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  lNaoConsiste                 := False;
  pgctrl_inst_negoc.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_inst_negoc.dbedt_nm_inst_negocChange(Sender: TObject);
begin
 if ( datm_inst_negoc.qry_inst_negoc_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_inst_negoc.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_inst_negoc.edt_chaveChange(Sender: TObject);
begin
  Localiza( datm_inst_negoc.qry_inst_negoc_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_inst_negoc.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_inst_negoc.qry_inst_negoc_CD_INST_NEGOC.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_inst_negoc.qry_inst_negoc_.Close;
  datm_inst_negoc.qry_inst_negoc_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_inst_negoc.qry_inst_negoc_.Prepare;
  datm_inst_negoc.qry_inst_negoc_.Open;
  Localiza(datm_inst_negoc.qry_inst_negoc_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_inst_negoc.pgctrl_inst_negocChange(Sender: TObject);
begin
  if ( pgctrl_inst_negoc.ActivePage = ts_dados_basicos ) or
     ( pgctrl_inst_negoc.ActivePage = ts_lista ) then
  begin
    dbnvg.DataSource     := datm_inst_negoc.ds_inst_negoc;
  end
  else if pgctrl_inst_negoc.ActivePage = ts_inst_negoc_pais then
  begin
    dbnvg.DataSource := datm_inst_negoc.ds_inst_negoc_pais;
  end;

  if (   pgctrl_inst_negoc.ActivePage = ts_lista ) or
     ( ( pgctrl_inst_negoc.ActivePage = ts_inst_negoc_pais ) and
       ( pgctrl_inst_negoc_pais.ActivePage = ts_lista2 ) ) then
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

  btn_mi( st_incluir, False, False, st_excluir );

  if ( pgctrl_inst_negoc.ActivePage = ts_inst_negoc_pais ) and
     ( datm_inst_negoc.qry_inst_negoc_pais_.RecordCount = 0 ) then
  begin
    pgctrl_inst_negoc_pais.Enabled := False;
  end
  else
  begin
    pgctrl_inst_negoc_pais.Enabled := True;
  end;
end;

procedure Tfrm_inst_negoc.dbedt_cd_paisChange(Sender: TObject);
begin
  if ( datm_inst_negoc.qry_inst_negoc_pais_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_inst_negoc.dbedt_cd_paisExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_inst_negoc.btn_co_paisClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TPAIS', datm_inst_negoc.qry_inst_negoc_pais_CD_PAIS,
                'Países', 1, '', 'TQuery' );
end;

procedure Tfrm_inst_negoc.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

function Tfrm_inst_negoc.Consiste : Boolean;
begin
  if ( pgctrl_inst_negoc.ActivePage = ts_dados_basicos ) or
     ( pgctrl_inst_negoc.ActivePage = ts_lista ) then
  begin
    {Código do Instrumento de Negociação}
    if datm_inst_negoc.qry_inst_negoc_.State in [dsEdit, dsInsert] then
    begin
      ValidCodigo( dbedt_cd_inst_negoc );
    end;
    if Not lNaoConsiste then
    begin
      if dbedt_cd_inst_negoc.Text = '' then
      begin
        BoxMensagem('Campo Código do Instrumento de Negociação deve ser preenchido!', 2);
        pgctrl_inst_negoc.ActivePage := ts_dados_basicos;
        dbedt_cd_inst_negoc.SetFocus;
        Consiste := False;
        Exit;
      end;

      {Descrição do Instrumento de Negociação}
      if dbedt_nm_inst_negoc.Text = '' then
      begin
        BoxMensagem('Campo Descrição deve ser preenchido!', 2);
        pgctrl_inst_negoc.ActivePage := ts_dados_basicos;
        dbedt_nm_inst_negoc.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end
  else if pgctrl_inst_negoc.ActivePage = ts_inst_negoc_pais then  {Instrumento de Negociação X País}
  begin
    {País}
    if Not lNaoConsiste then
    begin
      if dbedt_cd_pais.Text = '' then
      begin
        BoxMensagem('Campo País deve ser preenchido!', 2);
        pgctrl_inst_negoc.ActivePage      := ts_inst_negoc_pais;
        pgctrl_inst_negoc_pais.ActivePage := ts_dados_basicos2;
        dbedt_cd_pais.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if datm_inst_negoc.qry_inst_negoc_pais_.State in [dsInsert, dsEdit] then
       ValidCodigo( dbedt_cd_pais );

    if dbedt_cd_pais.Text <> '' then
    begin
      if dbedt_nm_pais.Text = '' then
      begin
        BoxMensagem('Código do País inválido!',2);
        pgctrl_inst_negoc.ActivePage      := ts_inst_negoc_pais;
        pgctrl_inst_negoc_pais.ActivePage := ts_dados_basicos2;
        dbedt_cd_pais.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
  Consiste := True;
end;

function Tfrm_inst_negoc.Grava : Boolean;
begin
  Grava := True;
  if ( pgctrl_inst_negoc.ActivePage = ts_dados_basicos ) or
     ( pgctrl_inst_negoc.ActivePage = ts_lista ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_inst_negoc.qry_inst_negoc_.State in [dsInsert, dsEdit] ) then
      begin
        datm_inst_negoc.qry_inst_negoc_.Post;
        Pesquisa := datm_inst_negoc.qry_inst_negoc_CD_INST_NEGOC.AsString;
        datm_inst_negoc.qry_inst_negoc_.Close;
        datm_inst_negoc.qry_inst_negoc_.Prepare;
        datm_inst_negoc.qry_inst_negoc_.Open;
        Localiza(datm_inst_negoc.qry_inst_negoc_, Pesquisa, a_str_indices[0] );
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_inst_negoc.qry_inst_negoc_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
    end;
    end;
  end
  else if pgctrl_inst_negoc.ActivePage = ts_inst_negoc_pais then  {Instrumento de Negociação X País}
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_inst_negoc.qry_inst_negoc_pais_.State in [dsInsert, dsEdit] ) then
      begin
        datm_inst_negoc.qry_inst_negoc_pais_.Post;
        Pesquisa := datm_inst_negoc.qry_inst_negoc_pais_CD_PAIS.AsString;
        datm_inst_negoc.qry_inst_negoc_pais_.Close;
        datm_inst_negoc.qry_inst_negoc_pais_.ParamByName('CD_INST_NEGOC').AsString := datm_inst_negoc.qry_inst_negoc_CD_INST_NEGOC.AsString;
        datm_inst_negoc.qry_inst_negoc_pais_.Prepare;
        datm_inst_negoc.qry_inst_negoc_pais_.Open;
        datm_inst_negoc.qry_inst_negoc_pais_.Locate( 'CD_PAIS', Pesquisa, [loCaseInsensitive] );

      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_inst_negoc.qry_inst_negoc_pais_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_inst_negoc.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_inst_negoc.pgctrl_inst_negocChanging(Sender: TObject;
var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_inst_negoc.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( pgctrl_inst_negoc.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( datm_inst_negoc.qry_inst_negoc_.State in [dsEdit] ) and st_modificar ) or
       ( datm_inst_negoc.qry_inst_negoc_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Instrumento de Negociação foi alterado.' + #13#10 +
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
  if ( pgctrl_inst_negoc.ActivePage = ts_inst_negoc_pais ) and
     ( pgctrl_inst_negoc.ActivePage = ts_dados_basicos2 ) then
  begin
    if ( ( datm_inst_negoc.qry_inst_negoc_pais_.State in [dsEdit] ) and st_modificar ) or
       ( datm_inst_negoc.qry_inst_negoc_pais_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Instrumento de Negociação X País foi alterado.' + #13#10 +
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
end;

procedure Tfrm_inst_negoc.Cancelar;
begin
  try
    if ( pgctrl_inst_negoc.ActivePage = ts_dados_basicos ) or
       ( pgctrl_inst_negoc.ActivePage = ts_lista ) then
    begin
      {Instrumento de Negociação}
      if datm_inst_negoc.qry_inst_negoc_.State in [dsInsert, dsEdit] then
        datm_inst_negoc.qry_inst_negoc_.Cancel;
      pgctrl_inst_negoc.ActivePage := ts_dados_basicos;
      dbedt_nm_inst_negoc.SetFocus;
    end
    else if ( pgctrl_inst_negoc.ActivePage = ts_inst_negoc_pais ) then
    begin
      {Instrumento de Negociação X País}
      if datm_inst_negoc.qry_inst_negoc_pais_.State in [dsInsert, dsEdit] then
        datm_inst_negoc.qry_inst_negoc_pais_.Cancel;
      pgctrl_inst_negoc_pais.ActivePage := ts_dados_basicos2;
      dbedt_cd_pais.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;

  if ( pgctrl_inst_negoc.ActivePage = ts_inst_negoc_pais ) and
     ( datm_inst_negoc.qry_inst_negoc_pais_.RecordCount = 0 ) then
  begin
    pgctrl_inst_negoc_pais.Enabled := False;
  end
  else
  begin
    pgctrl_inst_negoc_pais.Enabled := True;
  end;

  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_inst_negoc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_inst_negoc.dbedt_cd_classifKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_pais then btn_co_paisClick(nil);
  end;
end;

procedure Tfrm_inst_negoc.pgctrl_inst_negoc_paisChanging(
Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_inst_negoc.dbedt_cd_inst_negocExit(Sender: TObject);
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

end.

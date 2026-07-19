unit PGSM212;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DbTables, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls;

type
  Tfrm_area = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_area: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_nm_area: TLabel;
    lbl_cd_area: TLabel;
    dbedt_nm_area: TDBEdit;
    dbedt_cd_area: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    lbl_email: TLabel;
    dbedt_nm_email_gerente: TDBEdit;
    lbl_nome: TLabel;
    dbedt_nm_gerente: TDBEdit;
    Label1: TLabel;
    dbedt_nm_email_analista: TDBEdit;
    Label2: TLabel;
    dbedt_nm_analista: TDBEdit;
    Label3: TLabel;
    dbedt_nm_grupo: TDBEdit;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dbDivMerc: TDBLookupComboBox;
    Label31: TLabel;
    dbedt_fdc_numero: TDBEdit;
    Label4: TLabel;
    procedure dbedt_nm_areaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_areaChange(Sender: TObject);
    procedure pgctrl_areaChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_nm_grupoChange(Sender: TObject);
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

    lCons_OnLineMemo : Boolean;
    Cons_OnLineMemo : TMemoField;
    Cons_OnLineMemo_Texto : TStrings;
  end;

var
  frm_area: Tfrm_area;

implementation

uses PGSM213, GSMLIB, PGGP001, PGGP017, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_area.dbedt_nm_areaChange(Sender: TObject);
begin
  if ( datm_area.qry_area_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_area.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Área}
  Application.CreateForm( Tdatm_area, datm_area );

  with datm_area do
  begin
    ds_area.AutoEdit := st_modificar;

    qry_area_.Close;
    qry_area_.SQL[3] := 'NM_AREA';
    qry_area_.Prepare;
    qry_area_.Open;
  end;

  a_str_indices[0] := 'CD_AREA';
  a_str_indices[1] := 'NM_AREA';

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

procedure Tfrm_area.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_area.ActivePage := ts_lista;
  edt_chave.SetFocus;
  with datm_area do
  begin
    qry_area_.Close;
    qry_area_.SQL[3] := 'NM_AREA';
    qry_area_.Prepare;
    qry_area_.Open;
  end;
end;

procedure Tfrm_area.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_area do
    begin
      qry_area_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_area.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_area.qry_area_CD_AREA.AsString;
    except
      try
        Cons_OnLine_Texto := datm_area.qry_area_CD_AREA.AsString;
      except
        BoxMensagem( 'Não consegui retornar Código da Área!', 2 );
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_area.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_area.btn_incluirClick(Sender: TObject);

   { by Carlos - nova combinação de numeros para geração do codigo da area - 26/08/2011 }
   function CriaCodigo:String;
   var
   strUltimaLetra,strNew:String;
   c,x:Integer;
   begin
     strUltimaLetra:=ConsultaLookUPSQL(' select max(SUBSTRING(CD_AREA,1,1)) LETRA from TAREA ','LETRA');
     while True do begin
       for c:=0 to 9 do begin
          strNew:=strUltimaLetra+intToStr(c);
          if ConsultaLookUPSQL(' select CD_AREA from TAREA where CD_AREA = "'+strNew+'"','CD_AREA') = '' then begin
             Result:= strNew;
             exit;
          end;
       end;
       strUltimaLetra:= chr(ord(strUltimaletra[1])+1);   //proxima letra
       if ord(strUltimaletra[1])>90 then begin
          { Faz a sequencia somente com letras }
          for c:=65 to 90 do begin
            for x:=65 to 90 do begin
              strNew:=chr(c)+chr(x);
              if ConsultaLookUPSQL(' select CD_AREA from TAREA where CD_AREA = "'+strNew+'"','CD_AREA') = '' then begin
                 Result:= strNew;
                 exit;
              end;
            end;
          end;
          ShowMessage('Não Existe mais combinações para geração do numero da area');
          result:='';
          exit;
       end;
     end;
   end;

begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_area do
  begin
    qry_area_.DisableControls;
    qry_area_.Cancel;
    qry_area_.Append;
    qry_area_CD_AREA.AsString  := CriaCodigo; //UltCod( qry_ult_area_, qry_ult_area_ULTIMO );
    qry_area_.EnableControls;
  end;
  pgctrl_area.ActivePage := ts_dados_basicos;
  dbedt_nm_area.SetFocus;
end;

procedure Tfrm_area.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_area.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_area.Cancelar;
begin
  try
    if datm_area.qry_area_.State in [dsInsert, dsEdit] then
    begin
      datm_area.qry_area_.Cancel;
      pgctrl_area.ActivePage := ts_dados_basicos;
      dbedt_nm_area.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  btn_mi( st_incluir, False, False, st_excluir );
end;

procedure Tfrm_area.btn_excluirClick(Sender: TObject);
var
  cd_area : String[2];
begin
  if BoxMensagem( 'Esta Área será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    cd_area := datm_area.qry_area_CD_AREA.AsString;
    datm_area.qry_area_.Delete;
    datm_main.db_broker.Commit;

    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' DELETE FROM MYINDAIA.DBO.TAREA WHERE CD_AREA = ''' + cd_area  + ''' ');
      ExecSQL;
      Free;
    end;

  except
    on E: Exception do
    begin
      datm_area.qry_area_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  pgctrl_area.ActivePage := ts_lista;
end;

procedure Tfrm_area.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_area.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_area.qry_area_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_area.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_area.qry_area_CD_AREA.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_area.qry_area_.Close;
  datm_area.qry_area_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  datm_area.qry_area_.Prepare;
  datm_area.qry_area_.Open;
  Localiza(datm_area.qry_area_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

function Tfrm_area.Consiste : Boolean;
begin
  Consiste := True;

  {Descrição}
  if dbedt_nm_area.Text = '' then
  begin
    BoxMensagem( 'Campo Descrição deve ser preenchido!', 2 );
    pgctrl_area.ActivePage := ts_dados_basicos;
    dbedt_nm_area.SetFocus;
    Consiste := False;
    Exit;
  end;

  {Grupo}
  if dbedt_nm_grupo.Text = '' then
  begin
    BoxMensagem( 'Campo Grupo deve ser preenchido!', 2 );
    pgctrl_area.ActivePage := ts_dados_basicos;
    dbedt_nm_grupo.SetFocus;
    Consiste := False;
    Exit;
  end;
end;

function Tfrm_area.Grava : Boolean;
begin
  if (dbedt_nm_grupo.Text='SAM') and (dbDivMerc.Text= '') then
  begin
    ShowMessage('Atenção!Necessário o preenchimento da divisao de mercadoria para esse grupo');
    Exit;
  end;
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_area.qry_area_.State in [dsInsert, dsEdit] ) then
    begin
      datm_area.qry_area_.Post;
      Pesquisa := datm_area.qry_area_CD_AREA.AsString;
      datm_area.qry_area_.Close;
      datm_area.qry_area_.Prepare;
      datm_area.qry_area_.Open;
      Localiza(datm_area.qry_area_, Pesquisa, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;

    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' DELETE FROM MYINDAIA.DBO.TAREA WHERE CD_AREA = ''' + Pesquisa  + ''' ');
      ExecSQL;
      SQL.Clear;
      SQL.Add(' INSERT INTO MYINDAIA.DBO.TAREA ( ');
      SQL.Add(' CD_AREA, NM_AREA, NM_GERENTE, NM_ANALISTA, NM_EMAIL_GERENTE, NM_EMAIL_ANALISTA, NM_GRUPO ) ');
      SQL.Add(' SELECT CD_AREA, NM_AREA, NM_GERENTE, NM_ANALISTA, NM_EMAIL_GERENTE, NM_EMAIL_ANALISTA, NM_GRUPO ');
      SQL.Add(' FROM TAREA ( NOLOCK ) WHERE CD_AREA = ''' + Pesquisa + ''' ');
      ExecSQL;
      Free;
    end;

    Grava := True;
  except
    on E: Exception do
    begin
      datm_area.qry_area_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_area.pgctrl_areaChange(Sender: TObject);
begin
  if (pgctrl_area.ActivePage = ts_lista ) then
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

procedure Tfrm_area.pgctrl_areaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_area.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_area.qry_area_.State in [dsEdit] ) and st_modificar ) or
     ( datm_area.qry_area_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Áreas foi alterado.' + #13#10 +
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

procedure Tfrm_area.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_area.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then close;
end;

procedure Tfrm_area.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;




procedure Tfrm_area.dbedt_nm_grupoChange(Sender: TObject);
begin
   if ( datm_area.qry_area_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );

   if dbedt_nm_grupo.text = 'SAM' then
   begin
     dbDivMerc.Enabled:= True;
     datm_area.qry_LCC.Close;
     datm_area.qry_LCC.Open;
   end
   ELSE
   begin
     dbDivMerc.Enabled:= FALSE;
   end;

end;

end.

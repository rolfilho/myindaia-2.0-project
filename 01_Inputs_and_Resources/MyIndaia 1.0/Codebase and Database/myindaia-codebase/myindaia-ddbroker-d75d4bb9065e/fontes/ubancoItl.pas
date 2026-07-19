unit uBancoItl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls, Buttons, ExtCtrls, DB, DBTables, Menus;

type
  Tfrm_banco_itl = class(TForm)
    pnl_btn_ag: TPanel;
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
    pgctrl_bco_itl: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    dbgrid_bco_itl: TDBGrid;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbedt_nm_cidade: TDBEdit;
    dbedt_nm_pais: TDBEdit;
    btn_co_cidade: TSpeedButton;
    btn_co_pais: TSpeedButton;
    qry_bco_itl_: TQuery;
    qry_bco_itl_CD_BANCO: TStringField;
    qry_bco_itl_NM_BANCO: TStringField;
    qry_bco_itl_END_BANCO: TStringField;
    qry_bco_itl_END_UF: TStringField;
    qry_bco_itl_END_ZIP_CODE: TStringField;
    qry_bco_itl_CD_CIDADE: TStringField;
    qry_bco_itl_CD_PAIS: TStringField;
    ds_bco_itl: TDataSource;
    qry_bco_itl_IN_ATIVO: TStringField;
    MainMenu1: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    qry_bco_itl_NM_CIDADE: TStringField;
    qry_bco_itl_NM_PAIS: TStringField;
    UpDAte_banco: TUpdateSQL;
    dbedt_nm_bco: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    dbedt_cd_cidade: TDBEdit;
    dbedt_cd_pais: TDBEdit;
    DBMemo1: TDBMemo;
    procedure btn_co_cidadeClick(Sender: TObject);
    procedure btn_co_paisClick(Sender: TObject);
    procedure dbedt_cd_cidadeExit(Sender: TObject);
    procedure dbedt_cd_paisExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure pgctrl_bco_itlChange(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbedt_nm_bcoChange(Sender: TObject);
    procedure qry_bco_itl_AfterPost(DataSet: TDataSet);
    procedure qry_bco_itl_AfterDelete(DataSet: TDataSet);
    procedure qry_bco_itl_BeforePost(DataSet: TDataSet);
    procedure cb_ordemChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbgrid_bco_itlDblClick(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_bco_itlKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbedt_cd_cidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
     st_modificar, st_incluir, st_excluir: Boolean;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );

    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    { Public declarations }
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_banco_itl: Tfrm_banco_itl;

implementation

uses GSMLIB, {PSGM280, }PGGP017, ConsOnLineEx;

{$R *.DFM}

procedure Tfrm_banco_itl.btn_co_cidadeClick(Sender: TObject);
var
  cidade:string;
begin
   cidade := ConsultaOnLineEx('TLOCAL_EMBARQUE','Cidade',['CODIGO','DESCRICAO'], ['Código','Cidade'],'CODIGO',nil);
   if cidade <> '' then
    begin
      if not(qry_bco_itl_.State in [dsEdit]) then qry_bco_itl_.Edit;
      qry_bco_itl_CD_CIDADE.AsString:=cidade;
      dbedt_cd_cidadeExit(sender);
    end;


end;

procedure Tfrm_banco_itl.btn_co_paisClick(Sender: TObject);
var pais:string;
begin
   pais := ConsultaOnLineEx('TPAIS_BROKER','País',['CD_PAIS','NM_PAIS'],['Código','País'],'CD_PAIS',nil);
   if pais <> '' then
    begin
      if not(qry_bco_itl_.State in [dsEdit]) then qry_bco_itl_.Edit;
      qry_bco_itl_CD_PAIS.AsString:=pais;
      dbedt_cd_paisExit(sender);
    end;



end;

procedure Tfrm_banco_itl.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
 btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_banco_itl.Cancelar;
begin
  if qry_bco_itl_.State in [dsEdit,dsInsert] then
  qry_bco_itl_.Cancel;
  btn_mi(st_incluir,false, false,st_excluir);
end;

function Tfrm_banco_itl.Consiste: Boolean;
begin
Consiste:=true;
if (pgctrl_bco_itl.ActivePage = ts_dados_basicos)then
  begin
   if dbedt_nm_bco.Text = '' then
    begin
      BoxMensagem('Campo Descrição deve ser preenchido!', 2);
      pgctrl_bco_itl.ActivePage := ts_dados_basicos;
      dbedt_nm_bco.SetFocus;
      Consiste := False;
      Exit;
    end;

  end

end;

procedure Tfrm_banco_itl.Consulta_On_line(cNomeTabela: String;
  fcampo: TStringField; cCaption: String; nCodigo: Integer);
begin

end;

procedure Tfrm_banco_itl.dbedt_cd_cidadeExit(Sender: TObject);
begin
   if not(qry_bco_itl_.State in [dsInsert,dsEdit]) then exit;

   if dbedt_cd_cidade.Text <> '' then
     begin
       ValidCodigo( dbedt_cd_cidade );
       with Tquery.Create(Application) do
       begin
       DAtaBasename:='DBBROKER';
       Sql.Clear;
       Sql.Add('SELECT DESCRICAO FROM TLOCAL_EMBARQUE WHERE CODIGO="'+dbedt_cd_cidade.Text+'"');
       Active:=true;
       if RecordCount > 0 then
         begin
          qry_bco_itl_NM_CIDADE.AsString := fields[0].AsString;
           Close;
         end
       else
         begin
           Close;
           dbedt_nm_cidade.Text := '';
           BoxMensagem('Código do Banco inválido!', 2);
           dbedt_cd_cidade.SetFocus;
           Exit;
        end;
        end;
      end
    else dbedt_nm_cidade.Text := '';
 end;


procedure Tfrm_banco_itl.dbedt_cd_paisExit(Sender: TObject);
begin
 if not(qry_bco_itl_.State in [dsInsert,dsEdit]) then exit;

   if dbedt_cd_pais.Text <> '' then
     begin
       ValidCodigo( dbedt_cd_pais );
       with Tquery.Create(Application) do
       begin
       DAtaBasename:='DBBROKER';
       Sql.Clear;
       Sql.Add('SELECT NM_PAIS FROM TPAIS_BROKER WHERE CD_PAIS="'+dbedt_cd_pais.Text+'"');
       Active:=true;
       if RecordCount > 0 then
         begin
           qry_bco_itl_NM_PAIS.AsString := fields[0].AsString;
           Close;
         end
       else
         begin
           Close;
           dbedt_nm_pais.Text := '';
           BoxMensagem('Código do País inválido!', 2);
           dbedt_cd_pais.SetFocus;
           Exit;
        end;
        Free;
        end;
      end
    else dbedt_nm_pais.Text := '';
 end;


function Tfrm_banco_itl.Grava: Boolean;
begin
 if(pgctrl_bco_itl.ActivePage = ts_dados_basicos)then
  begin
    try
    if ( qry_bco_itl_.State in [dsInsert, dsEdit] ) then
       qry_bco_itl_.Post;
   
    Grava := True;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      qry_bco_itl_.Cancel;
      TrataErro(E);
      Grava := False;
    end;
  end;
end;
btn_mi(st_incluir,false,false,st_excluir);
end;

function Tfrm_banco_itl.Veralt: Boolean;
begin
 VerAlt := True;
  if ( ( qry_bco_itl_.State in [dsEdit] ) and st_modificar ) or
     ( qry_bco_itl_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de banco Internacinal foi alterado.' + #13#10 +
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

procedure Tfrm_banco_itl.FormCreate(Sender: TObject);
begin

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  qry_bco_itl_.Close;
  qry_bco_itl_.prepare;
  qry_bco_itl_.Open;

  a_str_indices[0] := 'CD_BANCO';
  a_str_indices[1] := 'NM_BANCO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

 btn_mi(st_incluir, false, false, st_excluir);

end;

procedure Tfrm_banco_itl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if VerAlt then
  begin
    qry_bco_itl_.Close;
    Action := caFree
  end
  else
    Action := caNone;

  
end;

procedure Tfrm_banco_itl.btn_sairClick(Sender: TObject);
begin
Close;
end;

procedure Tfrm_banco_itl.btn_incluirClick(Sender: TObject);
begin

   pgctrl_bco_itl.ActivePage:=ts_dados_basicos;

   qry_bco_itl_.DisableControls;
   qry_bco_itl_.Cancel;
   qry_bco_itl_.Append;
   qry_bco_itl_.EnableControls;

    edt_chave.Enabled:=false;
    cb_ordem.Enabled :=false;
    dbnvg.Enabled    :=false;
   btn_mi(false,st_modificar,st_modificar, false);
end;

procedure Tfrm_banco_itl.pgctrl_bco_itlChange(Sender: TObject);
begin
 if pgctrl_bco_itl.ActivePage = ts_lista then
   begin
    edt_chave.Enabled:=true;
    cb_ordem.Enabled :=true;
    dbnvg.Enabled    :=true;
   end
 else
   begin
    edt_chave.Enabled:=false;
    cb_ordem.Enabled :=false;
    dbnvg.Enabled    :=false;
   end;
end;

procedure Tfrm_banco_itl.btn_salvarClick(Sender: TObject);
begin
if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_banco_itl.btn_cancelarClick(Sender: TObject);
begin
Cancelar;
end;

procedure Tfrm_banco_itl.dbedt_nm_bcoChange(Sender: TObject);
begin
 if qry_bco_itl_.State in [dsEdit, dsInsert] then
   btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_banco_itl.qry_bco_itl_AfterPost(DataSet: TDataSet);
begin
qry_bco_itl_.ApplyUpdates;
end;

procedure Tfrm_banco_itl.qry_bco_itl_AfterDelete(DataSet: TDataSet);
begin
qry_bco_itl_.ApplyUpdates;
end;

procedure Tfrm_banco_itl.qry_bco_itl_BeforePost(DataSet: TDataSet);
begin
  if qry_bco_itl_.State in [dsInsert] then
    begin
     with TQuery.Create(Application) do
      begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT MAX(CD_BANCO) FROM TBCO_ITL');
      Open;
      if Fields[0].AsString = '' then
        begin
        qry_bco_itl_CD_BANCO.AsString:='001';
        end
      else
        begin
          qry_bco_itl_CD_BANCO.AsString:=formatfloat('000', strtofloat(Fields[0].AsString) + 1);
        end;
       Free;
      end;
    end;
end;

procedure Tfrm_banco_itl.cb_ordemChange(Sender: TObject);
begin
  Pesquisa := qry_bco_itl_CD_BANCO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  qry_bco_itl_.Close;
  qry_bco_itl_.SQL[4] := a_str_indices[cb_ordem.ItemIndex];
  qry_bco_itl_.Prepare;
  qry_bco_itl_.Open;
  Localiza(qry_bco_itl_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_banco_itl.edt_chaveChange(Sender: TObject);
begin
   Localiza(qry_bco_itl_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_banco_itl.dbgrid_bco_itlDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := qry_bco_itl_CD_BANCO.AsString;
    except
      try
         Cons_OnLine_Texto := qry_bco_itl_CD_BANCO.AsString;
      except
         BoxMensagem('Não foi possível retornar o Código do Banco!', 2)
      end;
    end;
    Close;
  end;

end;

procedure Tfrm_banco_itl.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then dbgrid_bco_itlDblClick(nil);
end;

procedure Tfrm_banco_itl.dbgrid_bco_itlKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then dbgrid_bco_itlDblClick(Sender);
end;

procedure Tfrm_banco_itl.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_banco_itl.btn_excluirClick(Sender: TObject);
begin
if(pgctrl_bco_itl.ActivePage = ts_lista)then
   begin
      if BoxMensagem( 'Este Banco será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
          try
            qry_bco_itl_.Delete;
         except
           on E: Exception do
           begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            qry_bco_itl_.Cancel;
            TrataErro(E);
          end;
        end;
   end;

end;

procedure Tfrm_banco_itl.dbedt_cd_cidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_F5 then
  begin
    if Sender = dbedt_cd_cidade then btn_co_cidadeClick(nil);
    if Sender = dbedt_cd_pais then btn_co_paisClick(nil);  
 end;
end;

end.

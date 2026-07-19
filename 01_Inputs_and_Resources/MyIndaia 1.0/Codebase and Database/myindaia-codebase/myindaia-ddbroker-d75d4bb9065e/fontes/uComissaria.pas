unit uComissaria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, RxDBComb, Mask, DBCtrls, Grids, DBGrids, ComCtrls,
  StdCtrls, Buttons, ExtCtrls, Menus;

type
  Tfrm_comissaria = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    pgctrl_comissaria: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    Label3: TLabel;
    lblNome: TLabel;
    lblAtivo: TLabel;
    dbedt_cd_comissaria: TDBEdit;
    Label4: TLabel;
    qry_comissaria_: TQuery;
    ds_comissaria: TDataSource;
    UpDAte_comissaria: TUpdateSQL;
    qry_ult_comissaria_: TQuery;
    qry_comissaria_NM_COMISSARIA: TStringField;
    qry_comissaria_FAX_COMISSARIA: TStringField;
    qry_comissaria_FONE_COMISSARIA: TStringField;
    qry_comissaria_EMAIL_COMISSARIA: TStringField;
    qry_comissaria_IN_ATIVO: TStringField;
    qry_comissaria_END_COMISSRIA: TStringField;
    qry_ult_comissaria_ULTIMO: TStringField;
    qry_comissaria_calc_ativo: TStringField;
    MainMenu1: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbedt_nm_comissaria: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    qry_comissaria_CD_COMISSARIA: TStringField;
    procedure qry_comissaria_AfterDelete(DataSet: TDataSet);
    procedure qry_comissaria_AfterPost(DataSet: TDataSet);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure pgctrl_comissariaChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure qry_comissaria_BeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qry_comissaria_CalcFields(DataSet: TDataSet);
    procedure pgctrl_comissariaChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbedt_nm_comissariaChange(Sender: TObject);
  private
    { Private declarations }
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    lnm_despachante : Boolean;
    st_cd_modulo,
    st_cd_rotina:string;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    { Public declarations }
     lCons_OnLine : Boolean;
     Cons_OnLine : TStringField;
     Cons_OnLine_Texto : String;
  end;

var
  frm_comissaria: Tfrm_comissaria;

implementation

uses GSMLIB, PGGP017;

{$R *.DFM}

procedure Tfrm_comissaria.qry_comissaria_AfterDelete(DataSet: TDataSet);
begin
qry_comissaria_.ApplyUpdates;
end;

procedure Tfrm_comissaria.qry_comissaria_AfterPost(DataSet: TDataSet);
begin
qry_comissaria_.ApplyUpdates;
end;

procedure Tfrm_comissaria.btn_sairClick(Sender: TObject);
begin
 if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_comissaria.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
end;

procedure Tfrm_comissaria.Cancelar;
begin
 try
    if qry_comissaria_.State in [dsInsert, dsEdit] then
    begin
      qry_comissaria_.Cancel;
      pgctrl_comissaria.ActivePage := ts_dados_basicos;
      dbedt_nm_comissaria.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_comissaria.Consiste: Boolean;
begin
consiste:=true;
if pgctrl_comissaria.ActivePage = ts_dados_basicos then
 begin
 if dbedt_nm_comissaria.text = '' then
   begin
    Boxmensagem('Deve ser preenchido o campo Nome da Comissaria!',2);
    dbedt_nm_comissaria.SetFocus;
    consiste:=false;
    Exit;
   end;
 end;

end;

function Tfrm_comissaria.Grava: Boolean;
begin
try
    datm_main.db_broker.StartTransaction;
    If ( qry_comissaria_.State in [dsInsert, dsEdit] ) then
         qry_comissaria_.Post;


    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      qry_comissaria_.Cancel;
      Grava := False;
      TrataErro(E);
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );

end;

function Tfrm_comissaria.VerAlt: Boolean;
begin
 VerAlt := True;
  if ( ( qry_comissaria_.State in [dsEdit] ) and st_modificar ) or
     ( qry_comissaria_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Comissárias foi alterado.' + #13#10 +
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

procedure Tfrm_comissaria.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;


    qry_comissaria_.DisableControls;
    qry_comissaria_.Cancel;
    qry_comissaria_.Append;
    qry_comissaria_.EnableControls;
    qry_comissaria_IN_ATIVO.AsString  := '1';

  pgctrl_comissaria.ActivePage := ts_dados_basicos;
  dbedt_nm_comissaria.SetFocus;
  btn_mi(false,st_modificar,st_modificar, false);
end;

procedure Tfrm_comissaria.btn_salvarClick(Sender: TObject);
begin
 if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_comissaria.btn_cancelarClick(Sender: TObject);
begin
Cancelar;
end;

procedure Tfrm_comissaria.btn_excluirClick(Sender: TObject);
begin
    if BoxMensagem( 'Esta Comissária será excluída! Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        qry_comissaria_.Delete;

        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          qry_comissaria_.Cancel;
          TrataErro(E);
        end;
      end;
      pgctrl_comissaria.ActivePage := ts_lista;


end;

procedure Tfrm_comissaria.pgctrl_comissariaChange(Sender: TObject);
begin
 if (pgctrl_comissaria.ActivePage = ts_lista ) then
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

procedure Tfrm_comissaria.edt_chaveChange(Sender: TObject);
begin
  Localiza(qry_comissaria_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_comissaria.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := qry_comissaria_CD_COMISSARIA.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  qry_comissaria_.Close;
  qry_comissaria_.SQL[3] := a_str_indices[cb_ordem.ItemIndex];
  qry_comissaria_.Open;
  Localiza(qry_comissaria_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;

end;

procedure Tfrm_comissaria.qry_comissaria_BeforePost(DataSet: TDataSet);
begin
  if qry_comissaria_.State in [dsinsert] then
       qry_comissaria_CD_COMISSARIA.AsString:=UltCod(qry_ult_comissaria_, qry_ult_comissaria_ULTIMO);
end;

procedure Tfrm_comissaria.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);



    ds_comissaria.AutoEdit := st_modificar;

    qry_comissaria_.Prepare;
    qry_comissaria_.SQL[3] := 'NM_COMISSARIA';
    qry_comissaria_.Open;


  a_str_indices[0] := 'CD_COMISSARIA';
  a_str_indices[1] := 'NM_COMISSARIA';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Nome');
    ItemIndex := 1;
  end;

 btn_mi(st_incluir,false,false,st_excluir);

end;

procedure Tfrm_comissaria.qry_comissaria_CalcFields(DataSet: TDataSet);
begin
  if qry_comissaria_IN_ATIVO.AsString = '1' then 
    qry_comissaria_calc_ativo.AsString:='Sim'
  else qry_comissaria_calc_ativo.AsString:='Não';
end;

procedure Tfrm_comissaria.pgctrl_comissariaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 VerAlt;
end;

procedure Tfrm_comissaria.dbg_cadastroDblClick(Sender: TObject);
begin
 If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := qry_comissaria_CD_COMISSARIA.AsString;
    except
      try
        Cons_Online_Texto := qry_comissaria_CD_COMISSARIA.AsString;
      except
        BoxMensagem('Não consegui retornar Código da Comissária!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_comissaria.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_comissaria.FormShow(Sender: TObject);
begin
 pgctrl_comissaria.ActivePage := ts_lista;
 edt_chave.SetFocus;
end;

procedure Tfrm_comissaria.dbedt_nm_comissariaChange(Sender: TObject);
begin
  if qry_comissaria_.State in [dsEdit,dsInsert] then
    btn_mi(false,st_modificar,st_modificar,false);
end;

end.

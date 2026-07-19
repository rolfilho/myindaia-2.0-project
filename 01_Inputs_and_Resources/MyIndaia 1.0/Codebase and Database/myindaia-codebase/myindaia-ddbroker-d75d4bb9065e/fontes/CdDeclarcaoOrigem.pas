unit CdDeclarcaoOrigem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxDBComb, Mask, DBCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, Menus,DB, DBTables, PGGP017, KrComunication;

type
  TfrmCdDeclaracaoOrigem = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_cntr: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    lbl_nm_pais: TLabel;
    dbedt_Acordo: TDBEdit;
    MainMenu1: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dsMain: TDataSource;
    Label3: TLabel;
    dsFederacao: TDataSource;
    updMain: TUpdateSQL;
    qryMain: TQuery;
    QryFederacao: TQuery;
    DBLookupComboBox: TDBLookupComboBox;
    QryFederacaoID: TAutoIncField;
    QryFederacaoNOME: TStringField;
    qryMainID: TAutoIncField;
    qryMainNUMERO: TStringField;
    qryMainFEDERACAO_ID: TIntegerField;
    qryMainVENCIMENTO: TDateTimeField;
    qryMainFederacao: TStringField;
    dbeDataVencNorma: TDBEdit;
    Label32: TLabel;
    lbl19: TLabel;
    dbedt_cd_cliente: TDBEdit;
    edt_nm_cliente: TEdit;
    Label207: TLabel;
    msk_CNPJ_Cliente: TMaskEdit;
    btn_co_cliente: TSpeedButton;
    qryMainCD_CLIENTE: TStringField;
    qryClassificacao: TQuery;
    dsClassificacao: TDataSource;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    btnIncluirClassificacao: TBitBtn;
    qryClassificacaoID: TAutoIncField;
    qryClassificacaoID_DO: TIntegerField;
    qryClassificacaoSIGLA: TStringField;
    qryClassificacaoCODIGO: TStringField;
    qryClassificacaoDENOMINACAO: TMemoField;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure pgctrl_cntrChange(Sender: TObject);
    procedure pgctrl_cntrChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_ordemClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbedt_AcordoChange(Sender: TObject);
    procedure qryMainUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure dbedt_cd_clienteChange(Sender: TObject);
    procedure btnIncluirClassificacaoClick(Sender: TObject);
  private
    { Private declarations }
    a_str_indices : Array[0..1] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    procedure Cancelar;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure ControleBotoes;
    procedure AbreClassificacao;
  public
    { Public declarations }
     lCons_OnLine : Boolean;
     Cons_OnLine : TStringField;
     Cons_OnLine_Texto : String;
  end;

var
  frmCdDeclaracaoOrigem: TfrmCdDeclaracaoOrigem;

implementation

uses GSMLIB, PGGP001, KrDialog, KrUtil, PGSM095, KrAuditoria, PGGP019, ConsOnLineEx;

{$R *.DFM}

procedure TfrmCdDeclaracaoOrigem.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;
  mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;
  mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;
  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;
  mi_Cancelar.Enabled  := Canc;
end;

procedure TfrmCdDeclaracaoOrigem.Cancelar;
begin
  if qryMain.State in [dsEdit,dsinsert] then
    qryMain.cancel;
  btn_mi(st_incluir,false,false,st_excluir);
end;

function TfrmCdDeclaracaoOrigem.Consiste: Boolean;
begin
  Result := true;
  if dbedt_Acordo.Text = '' then
  begin
    Warning('Número da Declaração de Origem em branco.');
    dbedt_Acordo.SetFocus;
    Result := false;
    Exit;
  end
end;

function TfrmCdDeclaracaoOrigem.Grava: Boolean;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( qryMain.State in [dsInsert, dsEdit] ) then
    begin
      qryMain.Post;
      qryMain.ApplyUpdates;
    end;
    datm_main.db_broker.Commit;
    Grava := True;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      qryMain.Cancel;
      Grava := False;
      TrataErro(E);
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function TfrmCdDeclaracaoOrigem.Veralt: Boolean;
begin
  Veralt := True;
  if ( pgctrl_cntr.ActivePage = ts_dados_basicos ) then
  begin
    if ( ( qryMain.State in [dsEdit] ) and st_modificar ) or
       ( qryMain.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Acordo Comercial foi alterado.' + #13#10 +
         'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          Veralt := False;
          Exit;
        end;
        if Not Grava then
        begin
          Veralt := False;
          Exit;
        end;
      end
      else
        Cancelar;
    end;
  end;
end;

procedure TfrmCdDeclaracaoOrigem.btn_incluirClick(Sender: TObject);
begin
  qryMain.DisableControls;
  qryMain.Cancel;
  qryMain.Append;
  qryMain.EnableControls;
  dbnvg.Enabled:=false;
  pgctrl_cntr.ActivePage := ts_dados_basicos;
  dbedt_Acordo.SetFocus;
  btn_mi(false,st_modificar,st_modificar,false);
end;

procedure TfrmCdDeclaracaoOrigem.btn_salvarClick(Sender: TObject);
begin
  if not consiste then
    Exit;
  if not grava then
    Exit;
end;

procedure TfrmCdDeclaracaoOrigem.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmCdDeclaracaoOrigem.btn_excluirClick(Sender: TObject);
begin
 if BoxMensagem( 'Este Acrodo Comercial será excluído! Confirma exclusão?', 1 ) Then
  begin
    try
      datm_main.db_broker.StartTransaction;
      qryMain.Delete;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        qryMain.Cancel;
        TrataErro(E);
      end;
    end;
  end;
  pgctrl_cntr.ActivePage := ts_lista;
end;

procedure TfrmCdDeclaracaoOrigem.pgctrl_cntrChange(Sender: TObject);
begin
  if pgctrl_cntr.ActivePage = ts_lista then
    dbnvg.Enabled:=true
  else
  begin
    dbnvg.Enabled:=false;
    AbreClassificacao;
  end;

end;

procedure TfrmCdDeclaracaoOrigem.AbreClassificacao;
begin
  qryClassificacao.Close;
  qryClassificacao.ParamByName('ID_DECLARACAO').AsString := qryMain.fieldByName('ID').AsString;
  qryClassificacao.Open;
end;

procedure TfrmCdDeclaracaoOrigem.pgctrl_cntrChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure TfrmCdDeclaracaoOrigem.FormCreate(Sender: TObject);
begin
  st_modificar := True;
  st_incluir   := True;
  st_excluir   := True;

  //AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  //Application.CreateForm( Tdatm_cntr, datm_cntr );

  dsMain.AutoEdit := st_modificar;
  qryMain.Close;
  qryMain.Prepare;
  qryMain.Open;
  a_str_indices[0] := 'ACORDO';
  a_str_indices[1] := 'DESCRICAO';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Acordo');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  btn_mi(st_incluir,false,false,st_excluir);

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;
end;

procedure TfrmCdDeclaracaoOrigem.edt_chaveChange(Sender: TObject);
begin
  Localiza(qryMain, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure TfrmCdDeclaracaoOrigem.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    dbg_cadastroDblClick(Sender);
end;

procedure TfrmCdDeclaracaoOrigem.cb_ordemClick(Sender: TObject);
var
  pesquisa : string;
begin
  Pesquisa := qryMainNUMERO.AsString;
  edt_chave.Text := '';
  qryMain.Close;
  qryMain.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  qryMain.Open;
  Localiza(qryMain, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure TfrmCdDeclaracaoOrigem.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCdDeclaracaoOrigem.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := qryMainNUMERO.AsString;
    except
      try
        Cons_Online_Texto := qryMainNUMERO.AsString;
      except
        Error( 'Não foi possível retornar o Número da Declaração de Origem!');
      end;
    end;
    Close;
  end;
end;

procedure TfrmCdDeclaracaoOrigem.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
   dbg_cadastroDblClick(Sender);
end;

procedure TfrmCdDeclaracaoOrigem.FormShow(Sender: TObject);
begin
  pgctrl_cntr.ActivePage := ts_lista;
  edt_chave.SetFocus;

  qryMain.Close;
  qryMain.Prepare;
  qryMain.Open;
  QryFederacao.Open;


  btn_excluir.Enabled := True;
  mi_excluir.Enabled  := True;
  if qryMain.RecordCount = 0 then
  begin
     btn_excluir.Enabled := False;
     mi_excluir.Enabled  := False;
  end;
end;

procedure TfrmCdDeclaracaoOrigem.dbedt_AcordoChange(Sender: TObject);
begin
  ControleBotoes;
end;

procedure TfrmCdDeclaracaoOrigem.qryMainUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  Auditoria.AuditIt(DataSet, UpdateKind, 'DeclarcaoOrigem', '');
  TUpdateSQL(TQuery(DataSet).UpdateObject).Apply(UpdateKind);
  UpdateAction := uaApplied;
end;

procedure TfrmCdDeclaracaoOrigem.btn_co_clienteClick(Sender: TObject);
var
  vCliente: String;
begin
  if Sender is TSpeedButton then
  begin
    if not(qryMain.State in [dsEdit,dsInsert]) and st_modificar then
    begin
      ControleBotoes;
      qryMain.edit;
    end;

    vCliente := ConsultaOnLineExFiltro('TEMPRESA_NAC', 'Cliente', ['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA'],
       ['Código', 'Descrição', 'Apelido', 'CNPJ', 'Endereço'], 'CD_EMPRESA', '', frm_main.mi_cad_emp_nac, dbedt_cd_cliente.text, 1);
    if vCliente <> qryMainCD_CLIENTE.AsString then
      qryMainCD_CLIENTE.AsString := vCliente;
  end
  else
    edt_nm_cliente.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', dbedt_cd_cliente.Text, 'NM_EMPRESA');

  msk_CNPJ_Cliente.Text := ConsultaLookUPSQL(' SELECT CGC_EMPRESA  ' +
                                                ' FROM TEMPRESA_NAC (NOLOCK)       ' +
                                                ' WHERE CD_EMPRESA = ''' + dbedt_cd_cliente.Text + '''', 'CGC_EMPRESA');
end;

procedure TfrmCdDeclaracaoOrigem.dbedt_cd_clienteChange(Sender: TObject);
begin
  ControleBotoes;
  If TDbEdit(Sender).Name = dbedt_cd_cliente.Name Then
    btn_co_cliente.OnClick(Sender);
end;

procedure TfrmCdDeclaracaoOrigem.ControleBotoes;
begin
  if qryMain.State in [dsEdit,dsInsert] then
    btn_mi(false,st_modificar,st_modificar,false);
end;

procedure TfrmCdDeclaracaoOrigem.btnIncluirClassificacaoClick(Sender: TObject);
var
  vNrDeclaracao: string;
  vCNPJ: string;
begin

  vNrDeclaracao := qryMainNUMERO.AsString;
  vCNPJ := msk_CNPJ_Cliente.Text;
  ExecAndWaitRun(GetCODFullPath,
    '/Consulta /DeclaracaoOrigem /Classe TfrmCdAcordoComercial /Form "Declaração de Origem" /CNPJ '+ vCNPJ +' /NrDeclaracao '+ vNrDeclaracao,
    'TFormList', 'Lista', SW_SHOW);

  AbreClassificacao;
end;

end.

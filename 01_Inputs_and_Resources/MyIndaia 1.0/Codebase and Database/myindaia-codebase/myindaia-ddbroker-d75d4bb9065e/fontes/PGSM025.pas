unit PGSM025;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBCtrls, ExtCtrls, Mask, Grids, DBGrids, Menus,
  Buttons, ComCtrls, ConsOnLineEx;

type
  Tfrm_cliente_contato = class(TForm)
    pgctrl_cliente_contato: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_entrada_de_dados: TPanel;
    lbl_nome: TLabel;
    lbl_cargo: TLabel;
    lbl_departamento: TLabel;
    lbl_fone: TLabel;
    lbl_fax: TLabel;
    gbox_responsabilidades: TGroupBox;
    dbchkbox_contas_receber_pagar: TDBCheckBox;
    dbchkbox_faturamento: TDBCheckBox;
    dbchkbox_numerario: TDBCheckBox;
    dbchkbox_operacional: TDBCheckBox;
    dbedt_nm_contato: TDBEdit;
    dbedt_tx_cargo: TDBEdit;
    dbedt_tx_departamento: TDBEdit;
    dbedt_nr_fone: TDBEdit;
    dbedt_nr_fax: TDBEdit;
    dbg_contatos: TDBGrid;
    dbedt_cd_cliente: TDBEdit;
    dbedt_razao_social: TDBEdit;
    lbl_Cliente: TLabel;
    lbl_unid_neg: TLabel;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    dbedt_cd_produto: TDBEdit;
    lbl_produto: TLabel;
    lbl_cliente2: TLabel;
    dbedt_cd_cliente2: TDBEdit;
    dbedt_nm_cliente2: TDBEdit;
    lbl_unid_neg2: TLabel;
    dbedt_cd_unid_neg2: TDBEdit;
    dbedt_nm_unid_neg2: TDBEdit;
    lbl_produto2: TLabel;
    dbedt_cd_produto2: TDBEdit;
    dbedt_nm_produto2: TDBEdit;
    lbl_cod: TLabel;
    dbedt_cd_contato: TDBEdit;
    lbl_area: TLabel;
    btn_co_area: TSpeedButton;
    dbedt_cd_area: TDBEdit;
    dbedt_nm_area: TDBEdit;
    lbl_tp_follow_up: TLabel;
    btn_co_tp_follow_up: TSpeedButton;
    dbedt_tp_follow_up: TDBEdit;
    dbedt_nm_tp_follow_up: TDBEdit;
    grpbox_forma: TGroupBox;
    dbchkbox_doc: TDBCheckBox;
    dbchkbox_xls: TDBCheckBox;
    dbchkbox_html: TDBCheckBox;
    dbchkbox_fax: TDBCheckBox;
    lbl_email: TLabel;
    dbedt_email: TDBEdit;
    dbchkbox_com_exterior: TDBCheckBox;
    dbchkbox_drawback: TDBCheckBox;
    dbchkbox_demurrage: TDBCheckBox;
    dbchkbox_edi: TDBCheckBox;
    pnl_cadastro: TPanel;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    dbedt_cd_usuario: TDBEdit;
    Label1: TLabel;
    dbedt_nm_usuario: TDBEdit;
    btn_cd_usuario: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbedt_nm_contatoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure pgctrl_cliente_contatoChange(Sender: TObject);
    procedure pgctrl_cliente_contatoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_areaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_areaClick(Sender: TObject);
    procedure btn_co_tp_follow_upClick(Sender: TObject);
    procedure dbedt_cd_areaExit(Sender: TObject);
    procedure dbedt_tp_follow_upExit(Sender: TObject);
    procedure dbg_contatosDblClick(Sender: TObject);
    procedure dbg_contatosKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_cd_usuarioClick(Sender: TObject);
    procedure dbedt_cd_usuarioExit(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    st_modificar, st_incluir, st_excluir : Boolean;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    str_cliente, str_unid, str_produto : String;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
  end;

var
  frm_cliente_contato: Tfrm_cliente_contato;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM066, PGSM212;

{$R *.DFM}

procedure Tfrm_cliente_contato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_cliente_contato do
  begin
    tbl_yesno_.Close;
    qry_area_.Close;
    qry_tp_follow_up_.Close;
    qry_empresa_nac_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_cliente_contato_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_cliente_contato.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_cliente_contato.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_cliente_contato.Cancelar;
begin
  try
    if datm_cliente_contato.qry_cliente_contato_.State in [dsInsert, dsEdit] then
    begin
      datm_cliente_contato.qry_cliente_contato_.Cancel;
      pgctrl_cliente_contato.ActivePage := ts_dados_basicos;
      dbedt_nm_contato.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cliente_contato.dbedt_nm_contatoChange(Sender: TObject);
begin
  if ( datm_cliente_contato.qry_cliente_contato_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente_contato.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Cliente X Contato}
  Application.CreateForm( Tdatm_cliente_contato, datm_cliente_contato );

  with datm_cliente_contato do
  begin
    ds_cliente_contato.AutoEdit := st_modificar;

    tbl_yesno_.Open;

    qry_empresa_nac_.Close;
    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_area_.Close;
    qry_area_.Prepare;
    qry_area_.Open;

    qry_tp_follow_up_.Close;
    qry_tp_follow_up_.Prepare;
    qry_tp_follow_up_.Open;

    qry_cliente_contato_.Close;
    qry_cliente_contato_.Prepare;
    qry_cliente_contato_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_cliente_contato_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_contato_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_cliente_contato_.Open;

  end;

  a_str_indices[0] := 'NM_CONTATO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Nome');
    ItemIndex := 0;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;
end;

procedure Tfrm_cliente_contato.FormShow(Sender: TObject);
begin
  with datm_cliente_contato do
  begin
    qry_cliente_contato_.Close;
    qry_cliente_contato_.Prepare;
    qry_cliente_contato_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_cliente_contato_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_contato_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_cliente_contato_.Open;
  end;

  pgctrl_cliente_contato.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_cliente_contato.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_cliente_contato do
  begin
    qry_cliente_contato_.DisableControls;
    qry_cliente_contato_.Cancel;
    qry_cliente_contato_.Append;
    qry_cliente_contato_.EnableControls;
    qry_cliente_contato_CD_CLIENTE.AsString       := str_cliente;
    qry_cliente_contato_CD_UNID_NEG.AsString      := str_unid;
    qry_cliente_contato_CD_PRODUTO.AsString       := str_produto;
    qry_cliente_contato_IN_CONTAS.AsBoolean       := False;
    qry_cliente_contato_IN_FATURAMENTO.AsBoolean  := False;
    qry_cliente_contato_IN_NUMERARIO.AsBoolean    := False;
    qry_cliente_contato_IN_OPERACIONAL.AsBoolean  := False;
    qry_cliente_contato_IN_DOC.AsBoolean          := False;
    qry_cliente_contato_IN_XLS.AsBoolean          := False;
    qry_cliente_contato_IN_HTML.AsBoolean         := False;
    qry_cliente_contato_IN_FAX.AsBoolean          := False;
    qry_cliente_contato_IN_COM_EXTERIOR.AsBoolean := False;
    qry_cliente_contato_IN_DRAWBACK.AsBoolean     := False;
    qry_cliente_contato_IN_DEMURRAGE.AsBoolean    := False;
    qry_ult_contato_.Close;
    qry_ult_contato_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_ult_contato_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_ult_contato_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_ult_contato_.Prepare;
    qry_ult_contato_.Open;
    if Not qry_ult_contato_.EOF then
    begin
      if qry_ult_contato_ULTIMO.AsString <> '' then
      begin
        qry_cliente_contato_CD_CONTATO.AsString :=
           Replicate( '0', 3 - Length( Trim( IntToStr( ( StrToInt( qry_ult_contato_ULTIMO.AsString ) + 1 ) ) ) ) ) +
           Trim( IntToStr( ( StrToInt( qry_ult_contato_ULTIMO.AsString ) + 1 ) ) )
      end
      else
      begin
        qry_cliente_contato_CD_CONTATO.AsString := '001';
      end;
    end
    else
    begin
      qry_cliente_contato_CD_CONTATO.AsString := '001';
    end;
    qry_ult_contato_.Close;
  end;
  pgctrl_cliente_contato.ActivePage := ts_dados_basicos;
  dbedt_nm_contato.SetFocus;
end;

procedure Tfrm_cliente_contato.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este Contato será excluído! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_cliente_contato.qry_cliente_contato_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_cliente_contato.qry_cliente_contato_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_cliente_contato.ActivePage := ts_lista;
end;

procedure Tfrm_cliente_contato.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

function Tfrm_cliente_contato.Consiste : Boolean;
begin
  if dbedt_nm_contato.Text = '' then
  begin
    BoxMensagem('Campo Nome deve ser preenchido!', 2);
    pgctrl_cliente_contato.ActivePage := ts_dados_basicos;
    dbedt_nm_contato.SetFocus;
    Consiste := False;
    Exit;
  end;

  {Área}
  if ( datm_cliente_contato.qry_cliente_contato_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_area );
    if dbedt_cd_area.Text <> '' then
    begin
      if dbedt_nm_area.Text = '' then
      begin
        BoxMensagem( 'Código da Área inválido!', 2 );
        pgctrl_cliente_contato.ActivePage := ts_dados_basicos;
        dbedt_cd_area.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Tipo de Follow Up}
  if ( datm_cliente_contato.qry_cliente_contato_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_tp_follow_up );
    if dbedt_tp_follow_up.Text <> '' then
    begin
      if dbedt_nm_tp_follow_up.Text = '' then
      begin
        BoxMensagem( 'Código do Tipo de Follow-Up inválido!', 2 );
        pgctrl_cliente_contato.ActivePage := ts_dados_basicos;
        dbedt_tp_follow_up.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  Consiste := True;
end;

function Tfrm_cliente_contato.Grava : Boolean;
var str_contato : String[3];
begin
  with datm_cliente_contato do
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( qry_cliente_contato_.State in [dsInsert, dsEdit] ) then
      begin
        qry_cliente_contato_.Post;
        str_contato := qry_cliente_contato_CD_CONTATO.AsString;

        qry_cliente_contato_.Close;
        qry_cliente_contato_.Prepare;
        qry_cliente_contato_.Open;
        qry_cliente_contato_.Locate( 'CD_CLIENTE;CD_UNID_NEG;CD_PRODUTO;CD_CONTATO',
                                     VarArrayOf([str_cliente,str_unid,str_produto,str_contato]), [loCaseInsensitive]);
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        qry_cliente_contato_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end;
end;

procedure Tfrm_cliente_contato.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_cliente_contato.qry_cliente_contato_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_cliente_contato.pgctrl_cliente_contatoChange(Sender: TObject);
begin
  if (pgctrl_cliente_contato.ActivePage = ts_lista ) then
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

procedure Tfrm_cliente_contato.pgctrl_cliente_contatoChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_cliente_contato.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_cliente_contato.qry_cliente_contato_.State in [dsEdit] ) and st_modificar ) or
     ( datm_cliente_contato.qry_cliente_contato_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Contatos foi alterado.' + #13#10 +
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

procedure Tfrm_cliente_contato.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_cliente_contato.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_cliente_contato.dbedt_cd_areaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_area      then btn_co_areaClick(nil);
    if Sender = dbedt_tp_follow_up then btn_co_tp_follow_upClick(nil);
  end;
end;

procedure Tfrm_cliente_contato.btn_co_areaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_area, frm_area);
  frm_area.Cons_OnLine := datm_cliente_contato.qry_cliente_contato_CD_AREA;
  with frm_area do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente_contato.qry_cliente_contato_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_contato.qry_cliente_contato_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_contato do
  begin
    qry_area_.Close;
    qry_area_.Prepare;
    qry_area_.Open;
  end;
  dbedt_cd_areaExit(Sender);
end;

procedure Tfrm_cliente_contato.btn_co_tp_follow_upClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TTP_FOLLOW_UP',
                datm_cliente_contato.qry_cliente_contato_TP_FOLLOWUP,
                'Tipo de Follow_up', 19, '' ,'TTable');
  dbedt_tp_follow_upExit(nil);
end;

procedure Tfrm_cliente_contato.dbedt_cd_areaExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_cliente_contato.dbedt_tp_follow_upExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_cliente_contato.dbg_contatosDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_cliente_contato.qry_cliente_contato_CD_CONTATO.AsString;
    except
      try
        Cons_OnLine_Texto := datm_cliente_contato.qry_cliente_contato_CD_CONTATO.AsString;
      except
        BoxMensagem('Não consegui retornar Código do Contato!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_cliente_contato.dbg_contatosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) and ( pgctrl_cliente_contato.ActivePage = ts_lista ) then
     dbg_contatosDblClick(Sender);
end;

procedure Tfrm_cliente_contato.edt_chaveKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then dbg_contatosDblClick(nil);
end;



procedure Tfrm_cliente_contato.btn_cd_usuarioClick(Sender: TObject);
begin

  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_cliente_contato.qry_cliente_contato_) then exit;

    datm_cliente_contato.qry_cliente_contato_CD_USUARIO.Value := ConsultaOnLineExFiltro('TUSUARIO','Usuario',['CD_USUARIO','NM_USUARIO'],['Código','Nome'],'CD_USUARIO', 'IN_ATIVO = "1"', nil, datm_cliente_contato.qry_cliente_contato_CD_USUARIO.Value)
  end;

  dbedt_cd_usuarioExit(Sender);

end;

procedure Tfrm_cliente_contato.dbedt_cd_usuarioExit(Sender: TObject);
begin
  if dbedt_cd_usuario.Text='' then exit;

  datm_cliente_contato.qry_cliente_contato_CD_USUARIO.Value:= Copy('0000', 1, 4 - Length( dbedt_cd_usuario.Text)) +  dbedt_cd_usuario.Text;

  dbedt_nm_usuario.Text   :=   ConsultaLookUP('TUSUARIO', 'CD_USUARIO', dbedt_cd_usuario.Text, 'NM_USUARIO');
end;

end.

unit PGSM214;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBCtrls, ExtCtrls, Mask, Grids, DBGrids, Menus,
  Buttons, ComCtrls;

type
  Tfrm_cliente_docto = class(TForm)
    pgctrl_cliente_docto: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pnl_entrada_de_dados: TPanel;
    lbl_descricao: TLabel;
    dbedt_nm_docto: TDBEdit;
    dbg_doctos: TDBGrid;
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
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    lbl_cod: TLabel;
    dbedt_cd_docto: TDBEdit;
    btn_co_docto: TSpeedButton;
    lbl_forma: TLabel;
    dblckpbox_forma_envio: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbedt_nm_doctoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure pgctrl_cliente_doctoChange(Sender: TObject);
    procedure pgctrl_cliente_doctoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbg_doctosDblClick(Sender: TObject);
    procedure dbedt_cd_doctoExit(Sender: TObject);
    procedure btn_co_doctoClick(Sender: TObject);
    procedure dbedt_cd_doctoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_doctoChange(Sender: TObject);
  private
    a_str_indices : Array[0..1] Of String[60];
    lNaoConsiste, st_modificar, st_incluir, st_excluir : Boolean;
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
  frm_cliente_docto: Tfrm_cliente_docto;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM208, PGSM215;

{$R *.DFM}

procedure Tfrm_cliente_docto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_cliente_docto do
  begin
    qry_empresa_nac_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_cliente_docto_.Close;
    qry_tp_forma_doc_.Close;
    qry_docto_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_cliente_docto.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_cliente_docto.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_cliente_docto.Cancelar;
begin
  try
    if datm_cliente_docto.qry_cliente_docto_.State in [dsInsert, dsEdit] then
    begin
      datm_cliente_docto.qry_cliente_docto_.Cancel;
      pgctrl_cliente_docto.ActivePage := ts_dados_basicos;
      dbedt_nm_docto.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cliente_docto.dbedt_nm_doctoChange(Sender: TObject);
begin
  if ( datm_cliente_docto.qry_cliente_docto_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente_docto.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Cliente X Documento}
  Application.CreateForm( Tdatm_cliente_docto, datm_cliente_docto );
end;

procedure Tfrm_cliente_docto.FormShow(Sender: TObject);
begin
  with datm_cliente_docto do
  begin
    ds_cliente_docto.AutoEdit := st_modificar;

    qry_empresa_nac_.Close;
    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_tp_forma_doc_.Close;
    qry_tp_forma_doc_.Prepare;
    qry_tp_forma_doc_.Open;

    qry_docto_.Close;
    qry_docto_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_docto_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_docto_.Prepare;
    qry_docto_.Open;

    qry_cli_docto_lista_.Close;
    qry_cli_docto_lista_.Prepare;
    qry_cli_docto_lista_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_cli_docto_lista_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cli_docto_lista_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_cli_docto_lista_.Prepare;
    qry_cli_docto_lista_.Open;
  end;

  a_str_indices[0] := 'DESCRICAO';

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

  pgctrl_cliente_docto.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;

procedure Tfrm_cliente_docto.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  with datm_cliente_docto do
  begin
    if qry_cliente_docto_.State in [dsInsert, dsEdit] then
    begin
      // está em Insert/Edit
    end
    else
    begin
      qry_cliente_docto_.Open;
    end;

    qry_cliente_docto_.DisableControls;
    qry_cliente_docto_.Cancel;
    qry_cliente_docto_.Append;
    qry_cliente_docto_.EnableControls;
    qry_cliente_docto_CD_CLIENTE.AsString      := str_cliente;
    qry_cliente_docto_CD_UNID_NEG.AsString     := str_unid;
    qry_cliente_docto_CD_PRODUTO.AsString      := str_produto;
  end;
  pgctrl_cliente_docto.ActivePage := ts_dados_basicos;
  dbedt_cd_docto.SetFocus;
end;

procedure Tfrm_cliente_docto.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este Documento será excluído! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_cliente_docto.qry_cliente_docto_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_cliente_docto.qry_cliente_docto_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  datm_cliente_docto.qry_cli_docto_lista_.Close;
  datm_cliente_docto.qry_cli_docto_lista_.Prepare;
  datm_cliente_docto.qry_cli_docto_lista_.Open;
  pgctrl_cliente_docto.ActivePage := ts_lista;
end;

procedure Tfrm_cliente_docto.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

function Tfrm_cliente_docto.Consiste : Boolean;
begin
  if Not lNaoConsiste then
  begin
    if dbedt_nm_docto.Text = '' then
    begin
      BoxMensagem('Campo Documento deve ser preenchido!', 2);
      pgctrl_cliente_docto.ActivePage := ts_dados_basicos;
      dbedt_cd_docto.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  {Documento}
  if ( datm_cliente_docto.qry_cliente_docto_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_docto );
    if dbedt_cd_docto.Text <> '' then
    begin
      if dbedt_nm_docto.Text = '' then
      begin
        BoxMensagem( 'Código do Documento inválido!', 2 );
        pgctrl_cliente_docto.ActivePage := ts_dados_basicos;
        dbedt_cd_docto.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  if Not lNaoConsiste then
  begin
    if datm_cliente_docto.qry_cliente_docto_CD_FORMA_DOC.AsString = '' then
    begin
      BoxMensagem('Campo Enviar deve ser preenchido!', 2);
      pgctrl_cliente_docto.ActivePage := ts_dados_basicos;
      dblckpbox_forma_envio.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  Consiste := True;
end;

function Tfrm_cliente_docto.Grava : Boolean;
var str_docto : String[3];
begin
  with datm_cliente_docto do
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( qry_cliente_docto_.State in [dsInsert, dsEdit] ) then
      begin
        qry_cliente_docto_.Post;
        str_docto := qry_cliente_docto_CD_DOCUMENTO.AsString;

        qry_cli_docto_lista_.Close;
        qry_cli_docto_lista_.Prepare;
        qry_cli_docto_lista_.Open;
        qry_cli_docto_lista_.Locate( 'CD_CLIENTE;CD_UNID_NEG;CD_PRODUTO;CD_DOCUMENTO',
                                     VarArrayOf([str_cliente,str_unid,str_produto,str_docto]), [loCaseInsensitive]);
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        qry_cliente_docto_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
    btn_mi( st_incluir, False, False, st_excluir );
  end;
end;

procedure Tfrm_cliente_docto.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_cliente_docto.qry_cli_docto_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_cliente_docto.pgctrl_cliente_doctoChange(Sender: TObject);
begin
  if (pgctrl_cliente_docto.ActivePage = ts_lista ) then
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

procedure Tfrm_cliente_docto.pgctrl_cliente_doctoChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_cliente_docto.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_cliente_docto.qry_cliente_docto_.State in [dsEdit] ) and st_modificar ) or
     ( datm_cliente_docto.qry_cliente_docto_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Documentos foi alterado.' + #13#10 +
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

procedure Tfrm_cliente_docto.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_cliente_docto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_cliente_docto.dbg_doctosDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_cliente_docto.qry_cliente_docto_CD_DOCUMENTO.AsString;
    except
      try
        Cons_OnLine_Texto := datm_cliente_docto.qry_cliente_docto_CD_DOCUMENTO.AsString;
      except
        BoxMensagem( 'Não consegui retornar Código do Documento!', 2 );
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_cliente_docto.dbedt_cd_doctoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_cliente_docto.btn_co_doctoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_documento, frm_documento);
  frm_documento.Cons_OnLine := datm_cliente_docto.qry_cliente_docto_CD_DOCUMENTO;
  with frm_documento do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    cd_unid_neg  := dbedt_cd_unid_neg2.Text;
    cd_produto   := dbedt_cd_produto2.Text;
    if Not ( datm_cliente_docto.qry_cliente_docto_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente_docto.qry_cliente_docto_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente_docto do
  begin
    qry_docto_.Close;
    qry_docto_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_docto_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_docto_.Prepare;
    qry_docto_.Open;
  end;
  dbedt_cd_doctoExit(Sender);
end;

procedure Tfrm_cliente_docto.dbedt_cd_doctoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_docto then btn_co_doctoClick(nil);
  end;
end;

procedure Tfrm_cliente_docto.dbedt_cd_doctoChange(Sender: TObject);
begin
  if ( datm_cliente_docto.qry_cliente_docto_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

end.

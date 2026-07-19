unit PGSM208;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, ExtCtrls, Menus, ComCtrls, Grids, DBGrids,
  Db, Mask, DBTables, Funcoes;

type
  Tfrm_documento = class(TForm)
    MainMenu1: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_doc: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    Bevel1: TBevel;
    dbgrd_doc: TDBGrid;
    Label1: TLabel;
    dbedt_cd_documento: TDBEdit;
    Label2: TLabel;
    dbedt_nm_documento: TDBEdit;
    lbl_unidade2: TLabel;
    lbl_produto2: TLabel;
    btn_co_unid_neg: TSpeedButton;
    btn_co_produto: TSpeedButton;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_cd_documentoChange(Sender: TObject);
    procedure pgctrl_docChange(Sender: TObject);
    procedure edt_chaveExit(Sender: TObject);
    procedure pgctrl_docChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure edt_chaveChange(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
    procedure dbedt_cd_produtoExit(Sender: TObject);
    procedure dbedt_cd_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbgrd_docDblClick(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    a_str_indices : Array[0..1] of String[16];
    lNaoConsiste, st_modificar, st_incluir, st_excluir : Boolean;
    Pesquisa : String;
    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    cd_unid_neg, cd_produto : String[2];
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    { Public declarations }
  end;

var
  frm_documento: Tfrm_documento;

implementation

uses PGGP001, PGSM010, PGSM018, PGSM207, GSMLIB, PGGP017, PGSM209;

{$R *.DFM}

procedure Tfrm_documento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_documento.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm(Tdatm_documento, datm_documento);
end;

procedure Tfrm_documento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_documento do
  begin
    if qry_documento_.State in [ dsInsert, dsEdit ] then
    begin
      if BoxMensagem('O cadastro de DOCUMENTO foi alterado.'+ #13 + 'Deseja salvar alterações antes de sair?', 1 ) then
      begin
        try
          datm_main.db_broker.StartTransaction;
          qry_documento_.Post;
          datm_main.db_broker.Commit;
        except
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          BoxMensagem('Não foi possível para o sistema atualizar o cadastro.',2 );
          qry_documento_.Cancel;
        end;
      end
    end;
    Free;
  end;
  Screen.Cursor := crDefault;
end;
procedure Tfrm_documento.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_documento.btn_incluirClick(Sender: TObject);
begin
  if st_incluir then
  begin
    pgctrl_doc.ActivePage := ts_dados_basicos;
    datm_documento.qry_documento_.Insert;
    datm_documento.qry_documento_CODIGO.AsString      := UltCod( datm_documento.qry_ult_doc_, datm_documento.qry_ult_doc_ULTIMO );
    datm_documento.qry_documento_CD_UNID_NEG.AsString := str_cd_unid_neg;
    datm_documento.qry_documento_CD_PRODUTO.AsString  := str_cd_produto;
    dbedt_nm_documento.SetFocus;
  end;

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;
end;

procedure Tfrm_documento.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_documento.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_documento.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este registro do DOCUMENTO será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_documento.qry_documento_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_documento.qry_documento_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  pgctrl_doc.ActivePage := ts_lista;
end;

procedure Tfrm_documento.cb_ordemClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Pesquisa := datm_documento.qry_documento_CODIGO.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_documento.qry_documento_.Close;
  datm_documento.qry_documento_.ParamByName('CD_UNID_NEG').AsString := cd_unid_neg;
  datm_documento.qry_documento_.ParamByName('CD_PRODUTO').AsString  := cd_produto;
  datm_documento.qry_documento_.SQL[5] := a_str_indices[cb_ordem.ItemIndex];
  datm_documento.qry_documento_.Prepare;
  datm_documento.qry_documento_.Open;
  Localiza(datm_documento.qry_documento_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

procedure Tfrm_documento.dbedt_cd_documentoChange(Sender: TObject);
begin
  if ( datm_documento.qry_documento_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_documento.pgctrl_docChange(Sender: TObject);
begin
  if (pgctrl_doc.ActivePage = ts_lista ) then
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

procedure Tfrm_documento.edt_chaveExit(Sender: TObject);
begin
  if datm_documento.qry_documento_.Locate( a_str_indices[ cb_ordem.ItemIndex ], edt_chave.text, [lopartialKey] ) then
  dbgrd_doc.SetFocus;
end;

function Tfrm_documento.Grava : Boolean;
var
  cd_documento : String;
begin
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_documento.qry_documento_.State in [dsInsert, dsEdit] ) then
    begin
      datm_documento.qry_documento_.Post;
      cd_documento := datm_documento.qry_documento_CODIGO.AsString;
      datm_documento.qry_documento_.Close;
      datm_documento.qry_documento_.ParamByName('CD_UNID_NEG').AsString := cd_unid_neg;
      datm_documento.qry_documento_.ParamByName('CD_PRODUTO').AsString  := cd_produto;
      datm_documento.qry_documento_.Prepare;
      datm_documento.qry_documento_.Open;
      Localiza(datm_documento.qry_documento_, cd_documento, a_str_indices[0] );
    end;
    datm_main.db_broker.Commit;
    Grava := True;
    pgctrl_doc.SetFocus;
  except
    on E: Exception do
    begin
      datm_documento.qry_documento_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  btn_mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_documento.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_documento.qry_documento_.State in [dsEdit] ) and st_modificar ) or
     ( datm_documento.qry_documento_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de DOCUMENTO foi alterado.' + #13#10 +
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

procedure Tfrm_documento.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_documento.Cancelar;
begin
  try
    if datm_documento.qry_documento_.State in [dsInsert, dsEdit] then
    begin
      datm_documento.qry_documento_.Cancel;
      pgctrl_doc.ActivePage := ts_dados_basicos;
      dbedt_cd_documento.SetFocus;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;


procedure Tfrm_documento.pgctrl_docChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_documento.Consiste : Boolean;
begin
  Consiste := True;

  if Not lNaoConsiste then
  begin
    if dbedt_cd_unid_neg.Text = '' then
    begin
      BoxMensagem('Campo Unidade deve ser preenchido!', 2);
      pgctrl_doc.ActivePage := ts_lista;
      dbedt_cd_unid_neg.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if Not ( datm_documento.qry_documento_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_unid_neg );
  if dbedt_cd_unid_neg.Text <> '' Then
  begin
    if dbedt_nm_unid_neg.Text = '' Then
    begin
      BoxMensagem('Código da Unidade de Negócio inválido!',2);
      pgctrl_doc.ActivePage := ts_dados_basicos;
      dbedt_cd_unid_neg.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if Not lNaoConsiste then
  begin
    if dbedt_cd_produto.Text = '' then
    begin
      BoxMensagem('Campo Produto deve ser preenchido!', 2);
      pgctrl_doc.ActivePage := ts_dados_basicos;
      dbedt_cd_produto.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if Not ( datm_documento.qry_documento_.State in [dsEdit, dsInsert] ) then Exit;
  ValidCodigo( dbedt_cd_produto );
  if dbedt_cd_produto.Text <> '' Then
  begin
    if dbedt_nm_produto.Text = '' Then
    begin
      BoxMensagem('Código do Produto inválido!',2);
      pgctrl_doc.ActivePage := ts_dados_basicos;
      dbedt_cd_produto.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if Not lNaoConsiste then
  begin
    if dbedt_cd_documento.Text = '' then
    begin
      BoxMensagem('Campo Código deve ser preenchido!', 2);
      pgctrl_doc.ActivePage := ts_dados_basicos;
      dbedt_cd_documento.SetFocus;
      Consiste := False;
      Exit;
    end;

    if dbedt_nm_documento.Text = '' then
    begin
      BoxMensagem('Campo Descrição deve ser preenchido!', 2);
      pgctrl_doc.ActivePage := ts_dados_basicos;
      dbedt_nm_documento.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
end;

procedure Tfrm_documento.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_documento.qry_documento_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_documento.btn_co_unid_negClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  frm_unidade.Cons_OnLine := datm_documento.qry_documento_CD_UNID_NEG;
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_documento.qry_documento_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_documento.qry_documento_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;

  with datm_documento do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
  end;
  dbedt_cd_unid_negExit(Sender);
end;

procedure Tfrm_documento.btn_co_produtoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_produto, frm_produto);
  frm_produto.Cons_OnLine := datm_documento.qry_documento_CD_PRODUTO;
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_documento.qry_documento_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_documento.qry_documento_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;

  with datm_documento do
  begin
    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;
  end;
  dbedt_cd_produtoExit(Sender);
end;

procedure Tfrm_documento.dbedt_cd_unid_negExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_documento.dbedt_cd_produtoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_documento.dbedt_cd_produtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = dbedt_cd_produto  then btn_co_produtoClick(nil);
  end;
end;

procedure Tfrm_documento.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  with datm_documento do
  begin
    pgctrl_doc.ActivePage := ts_lista;
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    with cb_ordem do
    begin
       Items.Clear;
       Items.Add('Código');
       Items.Add('Descrição');
       ItemIndex := 1;
    end;
    a_str_indices[0] := 'CODIGO';
    a_str_indices[1] := 'DESCRICAO';

    qry_documento_.Close;
    qry_documento_.ParamByName('CD_UNID_NEG').AsString := cd_unid_neg;
    qry_documento_.ParamByName('CD_PRODUTO').AsString  := cd_produto;
    qry_documento_.SQL[5] := a_str_indices[cb_ordem.ItemIndex];
    qry_documento_.Prepare;
    qry_documento_.Open;

    st_modificar := False;
    st_incluir   := False;
    st_excluir   := False;

    AtribuiDireitos( st_modificar, st_incluir, st_excluir);

    btn_incluir.Enabled := st_incluir;
    mi_incluir.Enabled  := st_incluir;
    btn_excluir.Enabled := st_excluir;
    mi_excluir.Enabled  := st_excluir;

    Screen.Cursor := crDefault;
    Application.ProcessMessages;
  end;
end;

procedure Tfrm_documento.dbgrd_docDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_documento.qry_documento_CODIGO.AsString;
    except
      try
        Cons_OnLine_Texto := datm_documento.qry_documento_CODIGO.AsString;
      except
        BoxMensagem( 'Não consegui retornar Código do Documento!', 2 );
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_documento.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbgrd_docDblClick(nil);
end;

end.

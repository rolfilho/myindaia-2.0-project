unit uClienteArmazem;

interface

uses                    
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, DBTables;

type
  Tfrm_cliente_armazem = class(TForm)
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
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
    pgctrl_despesas: TPageControl;
    ts_despesas_lista: TTabSheet;
    ts_despesas_config: TTabSheet;
    dbgrd2: TDBGrid;
    shp1: TShape;
    lbl2: TLabel;
    lbl9: TLabel;
    ed1: TEdit;
    ed2: TEdit;
    dsDespesasBasicas: TDataSource;
    qryDespesasBasicas: TQuery;
    qryDespesasBasicasCD_ARMAZEM: TStringField;
    qryDespesasBasicasCD_ITEM: TStringField;
    qryDespesasBasicasCD_DESPESA_BASICA: TIntegerField;
    qryDespesasBasicasTX_VALOR_LIMITE: TStringField;
    qryDespesasBasicasCD_MARGEM: TStringField;
    qryDespesasBasicasQT_DIAS: TIntegerField;
    qryDespesasBasicasTX_TIPO_CALCULO: TStringField;
    qryDespesasBasicasVL_PRINCIPAL: TFloatField;
    qryDespesasBasicasVL_MINIMO_20: TFloatField;
    qryDespesasBasicasVL_MINIMO_40: TFloatField;
    qryDespesasBasicasVL_DESP_CIF: TStringField;
    qryDespesasBasicasVL_DESP_VALOR: TStringField;
    qryDespesasBasicasTX_DESCRICAO_DESPESA: TStringField;
    qryDespesasBasicasTX_PERIODO: TStringField;
    qryDespesasBasicasNM_ITEM: TStringField;
    qryDespesasBasicasNM_MARGEM: TStringField;
    updDespesasBasicas: TUpdateSQL;
    qryClienteArmazem: TQuery;
    dsClienteArmazem: TDataSource;
    qryClienteArmazemCD_CLIENTE: TStringField;
    qryClienteArmazemCD_ARMAZEM: TStringField;
    qryClienteArmazemNM_ARMAZEM: TStringField;
    pgc1: TPageControl;
    ts1: TTabSheet;
    lbl13: TLabel;
    shp7: TShape;
    lbl14: TLabel;
    dbgrd3: TDBGrid;
    ed4: TEdit;
    ed5: TEdit;
    ts2: TTabSheet;
    shp2: TShape;
    shp4: TShape;
    shp5: TShape;
    shp3: TShape;
    lbl4: TLabel;
    lbl6: TLabel;
    lbl8: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    btn1: TSpeedButton;
    img2: TImage;
    img1: TImage;
    lbl7: TLabel;
    shp6: TShape;
    edt_valor_inicial: TEdit;
    dbedt6: TDBEdit;
    dbedt8: TDBEdit;
    dbedt9: TDBEdit;
    dbedt10: TDBEdit;
    dbedt1: TDBEdit;
    edt_periodo: TEdit;
    ed3: TEdit;
    dbedt2: TDBEdit;
    dbrgrp1: TDBRadioGroup;
    dbrgrp2: TDBRadioGroup;
    chk_emdiante: TCheckBox;
    edt_valor_final: TEdit;
    pnlIncluirArmazem: TPanel;
    shp8: TShape;
    lbl1: TLabel;
    dbedt_cd_amz_atr_im: TDBEdit;
    ed_nm_amz: TEdit;
    btn_co_amz_atr_im: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure pgctrl_cliente_armazemChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_tabelaExit(Sender: TObject);
    procedure btn_co_amz_atr_imClick(Sender: TObject);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60];
    lCancelar, lAbertura, lSalvar, lExcluir, st_modificar, st_incluir, st_excluir : Boolean;
    function VerAlt   : Boolean;
    procedure CodExits;
  public
    Code : Integer;
    str_cliente, str_unid, str_produto, str_servico, str_armazem : String;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
  end;

var
  frm_cliente_armazem: Tfrm_cliente_armazem;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGSM041, PGSM048, PGSM059, PGSM067, PGSM096, PGSM109, PGSM148,
  pgsm239, PGSM064, dClienteArmazem, ConsOnLineEx, PGGP019 , PGSM108;

procedure Tfrm_cliente_armazem.FormCreate(Sender: TObject);
begin
  //lCancelar    := False;
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Cliente X Numerário}
  Application.CreateForm( Tdatm_cliente_armazem, datm_cliente_armazem );

  with datm_cliente_armazem do
  begin
    ds_cliente_armazem.AutoEdit := st_modificar;

    qry_empresa_nac_.Close;
    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_servico_.Close;
    qry_servico_.Prepare;
    qry_servico_.Open;

    qry_cliente_armazem_.Close;
    qry_cliente_armazem_.ParamByName('CD_CLIENTE').AsString  := str_cliente;
    qry_cliente_armazem_.ParamByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_armazem_.ParamByName('CD_PRODUTO').AsString  := str_produto;
    qry_cliente_armazem_.ParamByName('CD_SERVICO').AsString  := str_servico;
    qry_cliente_armazem_.Prepare;
    qry_cliente_armazem_.Open;
  end;

  a_str_indices[0] := 'CD_ITEM';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código do Item');
    ItemIndex := 0;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;
end;

procedure Tfrm_cliente_armazem.FormShow(Sender: TObject);
begin
  lNaoConsiste := False;
  lAbertura    := True;

  qryClienteArmazem.Close;
  qryClienteArmazem.Open;

//  pgctrl_cliente_armazem.ActivePage := ts_lista;
  edt_chave.SetFocus;
  lAbertura    := False;
end;

procedure Tfrm_cliente_armazem.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
  if VerAlt then
    qryClienteArmazem.Close
  else
    Action := caNone;
end;

procedure Tfrm_cliente_armazem.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled  := False;
  mi_incluir.Enabled   := False;
  btn_excluir.Enabled  := False;
  mi_excluir.Enabled   := False;
  btn_salvar.Enabled   := True;
  mi_salvar.Enabled    := True;
  btn_cancelar.Enabled := True;
  mi_cancelar.Enabled  := True;

  qryClienteArmazem.Insert;
  qryClienteArmazemCD_CLIENTE.AsString  := datm_cliente.qry_empresa_nac_CD_EMPRESA.AsString;
  pnlIncluirArmazem.Visible := True;

//  dbedt_cd_amz.SetFocus;
end;

procedure Tfrm_cliente_armazem.btn_salvarClick(Sender: TObject);
begin
  try
    datm_main.db_broker.StartTransaction;
    if pgctrl_despesas.ActivePage = ts_despesas_lista then
    begin
      qryDespesasBasicas.Post;
      pnlIncluirArmazem.Visible := False;
    end else begin


    end;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      qryDespesasBasicas.Cancel;
      TrataErro(E);
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cliente_armazem.btn_cancelarClick(Sender: TObject);
begin
  try
    if datm_cliente_armazem.qry_cliente_armazem_.State in [dsInsert, dsEdit] then
      qryClienteArmazem.Cancel;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cliente_armazem.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este Cliente X Armazém será excluído! Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    qryClienteArmazem.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      qryClienteArmazem.Cancel;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_cliente_armazem.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_cliente_armazem.edt_chaveChange(Sender: TObject);
begin
  Localiza(qryClienteArmazem, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_cliente_armazem.dbedt_cd_itemExit(Sender: TObject);
begin
  CodExits;
end;

function Tfrm_cliente_armazem.VerAlt : Boolean;
begin
(*  VerAlt := True;

  if ( ( datm_cliente_armazem.qry_cliente_armazem_.State in [dsEdit] ) and st_modificar ) or
     ( datm_cliente_armazem.qry_cliente_armazem_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Clientes X Armazém foi alterado.' + #13#10 +
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
  end;*)
end;

procedure Tfrm_cliente_armazem.pgctrl_cliente_armazemChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_cliente_armazem.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;


procedure Tfrm_cliente_armazem.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_cliente_armazem.CodExits;
begin
  lNaoConsiste := True;
//  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_cliente_armazem.dbedt_cd_tabelaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente_armazem.btn_co_amz_atr_imClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    datm_cliente_armazem.qry_cliente_armazem_CD_ARMAZEM.AsString := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM'],['Código','Descrição'],'CD_ARMAZEM',frm_main.mi_cad_amz)
  else ed_nm_amz.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',datm_cliente_armazem.qry_cliente_armazem_CD_ARMAZEM.AsString,'NM_ARMAZEM');
end;

end.

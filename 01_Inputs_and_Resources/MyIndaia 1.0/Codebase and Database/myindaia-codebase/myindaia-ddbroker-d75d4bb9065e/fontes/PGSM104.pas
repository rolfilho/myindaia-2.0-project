
unit PGSM104;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, dbclient, DBiTypes;

type
  Tfrm_cliente_co = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dbnvg: TDBNavigator;
    pgctrl_cliente: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    dbg_cadastro: TDBGrid;
    menu_cadastro: TMainMenu;
    mi_sair: TMenuItem;
    pnl_entrada_de_dados: TPanel;
    lbl_cd_empresa: TLabel;
    lbl_nm_empresa: TLabel;
    lbl_ap_empresa: TLabel;
    lbl_end_empresa: TLabel;
    lbl_end_numero: TLabel;
    lbl_end_bairro: TLabel;
    lbl_end_cidade: TLabel;
    lbl_end_uf: TLabel;
    lbl_end_cep: TLabel;
    lbl_cd_tipo_pessoa: TLabel;
    lbl_cnpj_empresa: TLabel;
    lbl_cpf_empresa: TLabel;
    lbl_ie_empresa: TLabel;
    lbl_outro_doc: TLabel;
    lbl_dt_inclusao: TLabel;
    lbl_in_faturamento: TLabel;
    lbl_cd_grupo: TLabel;
    lbl_in_ativo: TLabel;
    dbedt_cd_empresa: TDBEdit;
    dbedt_nm_empresa: TDBEdit;
    dbedt_ap_empresa: TDBEdit;
    dbedt_end_empresa: TDBEdit;
    dbedt_end_numero: TDBEdit;
    dbedt_end_bairro: TDBEdit;
    dbedt_end_cidade: TDBEdit;
    dbedt_end_uf: TDBEdit;
    dbedt_end_cep: TDBEdit;
    dblkpcbox_tipo_pessoa: TDBLookupComboBox;
    dbedt_cnpj_empresa: TDBEdit;
    dbedt_cpf_empresa: TDBEdit;
    dbedt_ie_empresa: TDBEdit;
    dbedt_outro_doc: TDBEdit;
    dbedt_dt_inclusao: TDBEdit;
    dblkpcbox_in_faturamento: TDBLookupComboBox;
    dbedt_cd_grupo: TDBEdit;
    dbedt_nm_grupo: TDBEdit;
    Panel2: TPanel;
    dbchkbox_in_cliente: TDBCheckBox;
    dbchkbox_in_importador: TDBCheckBox;
    dbchkbox_in_exportador: TDBCheckBox;
    dbchkbox_in_outros: TDBCheckBox;
    dbchkbox_in_representante: TDBCheckBox;
    dblkpcbox_in_ativo: TDBLookupComboBox;
    dbchkbox_in_comprador: TDBCheckBox;
    dbchkbox_in_seguradora: TDBCheckBox;
    procedure btn_sairClick(Sender: TObject);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    a_str_indices : Array[0..5] Of String[60];
    Pesquisa : String;
  public
    lCons_OnLine, lRepresentante  : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    str_condicao, str_ordem, str_cd_grupo : String
  end;

var
  frm_cliente_co: Tfrm_cliente_co;

implementation

uses GSMLIB, PGGP017, PGSM068, PGSM119;

{$R *.DFM}

procedure Tfrm_cliente_co.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_cliente_co.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine Then
  begin
    try
      if Not (TTable(Cons_OnLine.DataSet).State in [dsEdit, dsInsert]) then
         TTable(Cons_OnLine.DataSet).Edit;
      Cons_OnLine.AsString := datm_cliente_co.qry_empresa_nac_CD_EMPRESA.AsSTring;
    except
      try
        Cons_OnLine_Texto := datm_cliente_co.qry_empresa_nac_CD_EMPRESA.AsSTring;
      except
        begin
          if lRepresentante then BoxMensagem('Não consegui retornar Código do Representante!', 2)
          else BoxMensagem('Não consegui retornar Código da Empresa Nacional!', 2);
        end;
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_cliente_co.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_cliente_co.FormCreate(Sender: TObject);
begin
  { Inicializa o Data Module para Consulta On Line de Clientes}
  Application.CreateForm( Tdatm_cliente_co, datm_cliente_co );

  str_condicao := '';
  str_cd_grupo := '';

  a_str_indices[0] := 'CD_EMPRESA';
  a_str_indices[1] := 'NM_EMPRESA';
  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Razão Social');
    ItemIndex := 1;
  end;

  with datm_cliente_co do
  begin
    tbl_yesno_.Open;
    tbl_tipo_pessoa_.Open;

    qry_grupo_.Close;
    qry_grupo_.Prepare;
    qry_grupo_.Open;

    qry_empresa_nac_.Close;
    qry_empresa_nac_.Prepare;
    datm_cliente_co.qry_empresa_nac_.SQL[1] := str_condicao;
    datm_cliente_co.qry_empresa_nac_.SQL[2] := 'ORDER BY ' + a_str_indices[1];
    qry_empresa_nac_.Open;
  end;

end;

procedure Tfrm_cliente_co.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_cliente_co.qry_empresa_nac_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_cliente_co.FormShow(Sender: TObject);
begin
  if lRepresentante then str_condicao := 'WHERE IN_REPRESENTANTE = 1';
  if str_cd_grupo <> '' then str_condicao := 'WHERE IN_IMPORTADOR = 1 AND CD_GRUPO = "' + str_cd_grupo + '"';
  with datm_cliente_co do
  begin
    qry_empresa_nac_.Close;
    qry_empresa_nac_.Prepare;
    datm_cliente_co.qry_empresa_nac_.SQL[1] := str_condicao;
    datm_cliente_co.qry_empresa_nac_.SQL[2] := 'ORDER BY ' + a_str_indices[1];
    qry_empresa_nac_.Open;
  end;
  pgctrl_cliente.ActivePage := ts_lista;
  edt_chave.SetFocus;
end;


procedure Tfrm_cliente_co.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_cliente_co.qry_empresa_nac_CD_EMPRESA.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_cliente_co.qry_empresa_nac_.Close;
  datm_cliente_co.qry_empresa_nac_.SQL[1] := str_condicao;
  datm_cliente_co.qry_empresa_nac_.SQL[2] := 'ORDER BY ' + a_str_indices[cb_ordem.ItemIndex];
  datm_cliente_co.qry_empresa_nac_.Open;
  Localiza(datm_cliente_co.qry_empresa_nac_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_cliente_co.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_cliente_co do
  begin
    tbl_yesno_.Close;
    tbl_tipo_pessoa_.Close;
    qry_grupo_.Close;
    qry_empresa_nac_.Close;
//    Destroy;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_cliente_co.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_cliente_co.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then dbg_cadastroDblClick(nil);
end;



end.

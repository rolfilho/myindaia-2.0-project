unit PGSM196;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, DBCtrls,
  Mask, ComCtrls, Funcoes, ConsOnLineEx;

type
  Tfrm_de_para = class(TForm)
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    mi_salvar: TMenuItem;
    pgctrl_de_para: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    dbg_cadastro: TDBGrid;
    pnl_entrada_de_dados: TPanel;
    lbl_cd_ddbroker: TLabel;
    lbl_cd_tabela: TLabel;
    dbedt_cd_ddbroker: TDBEdit;
    dblkpcbox_cd_tabela: TDBLookupComboBox;
    mi_cancelar: TMenuItem;
    dbedt_cd_externo: TDBEdit;
    lbl_cd_externo: TLabel;
    lbl_cd_unid_neg: TLabel;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    btn_co_unid_neg: TSpeedButton;
    lbl_cd_produto: TLabel;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    btn_co_produto: TSpeedButton;
    pnl1: TPanel;
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
    dbedt_cd_grupo: TDBEdit;
    dbedt_nm_grupo: TDBEdit;
    btn_co_grupo: TSpeedButton;
    lbl_cd_grupo: TLabel;
    dbedt_cdtabela: TDBEdit;
    DBEdit2: TDBEdit;
    SpeedButton1: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure pgctrl_de_paraChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_de_paraChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_ddbrokerClick(Sender: TObject);
    procedure dbedt_cd_ddbrokerExit(Sender: TObject);
    procedure dbedt_cd_ddbrokerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
    procedure dbedt_cd_produtoExit(Sender: TObject);
    procedure dblkpcbox_cd_tabelaExit(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure dbedt_cd_grupoExit(Sender: TObject);
    procedure dbedt_cdtabelaExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    OnChanging : Boolean;
    a_str_indices : Array[0..2] Of String[60];
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir : Boolean;

    function Grava    : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure Habilita_Btn_CbBx;
    procedure Muda_Lookup_Nm(CodTabela: String);
    procedure Valida_Exit;
    procedure ValCodigo( dbedit_Codigo : TDbEdit; nNum : Integer );

  public
    { Public declarations }
    lCons_OnLine : Boolean;
    Cons_OnLine  : TStringField;
    Cons_OnLine_Texto  : String;
  end;

var
  frm_de_para: Tfrm_de_para;

implementation

uses GSMLIB, PGSM197, PGGP017, PGGP001, PGSM010, PGSM018;

{$R *.DFM}

procedure Tfrm_de_para.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_de_para.btn_incluirClick(Sender: TObject);
begin
  with datm_de_para do
  begin
    qry_de_para_.DisableControls;
    qry_de_para_.Cancel;
    qry_de_para_.Append;
    qry_de_para_.EnableControls;
  end;
  pgctrl_de_para.ActivePage := ts_dados_basicos;

  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  dbnvg.Enabled := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled := False;

  datm_de_para.qry_de_para_CD_UNID_NEG.AsString := str_cd_unid_neg;
  datm_de_para.qry_de_para_CD_PRODUTO.AsString := str_cd_produto;

  Habilita_Btn_CbBx;

  //dbedt_cd_unid_neg.SetFocus;
end;

procedure Tfrm_de_para.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_de_para.qry_de_para_.Close;
  datm_de_para.qry_ttp_de_para.Close;
  datm_de_para.qry_unid_neg_.Close;
  datm_de_para.qry_produto_.Close;

  datm_de_para.Free;
  Action := caFree;
end;

procedure Tfrm_de_para.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 //  Inicializa o Data Module
  Application.CreateForm( Tdatm_de_para, datm_de_para );

  with datm_de_para do
  begin
    ds_de_para.AutoEdit := st_modificar;
    qry_de_para_.Prepare;
    qry_de_para_.SQL[2] := 'CD_DDBROKER';
    qry_de_para_.Open;
    qry_unid_neg_.Open;
    qry_produto_.Open;
  end;

  a_str_indices[0] := 'CD_TABELA';
  a_str_indices[1] := 'CD_GRUPO';
  a_str_indices[2] := 'CD_DDBROKER';


  With cb_ordem do
  begin
    Clear;
    Items.Add('Cód Tabela');
    Items.Add('Cód Grupo');
    Items.Add('Cód Broker');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

end;

procedure Tfrm_de_para.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este Código será excluído! Confirma exclusão?', 1 ) Then
  try
    datm_main.db_broker.StartTransaction;
    datm_de_para.qry_de_para_.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_de_para.qry_de_para_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  pgctrl_de_para.ActivePage := ts_lista;
end;

procedure Tfrm_de_para.FormShow(Sender: TObject);
begin
  pgctrl_de_para.ActivePage := ts_lista;
  //edt_chave.SetFocus;
end;

procedure Tfrm_de_para.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_de_para.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_de_para.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_de_para.qry_de_para_CD_TABELA.AsString;
  //  Apaga o campo de pesquisa
  edt_chave.Text := '';
  datm_de_para.qry_de_para_.Close;
  datm_de_para.qry_de_para_.SQL[2] := a_str_indices[cb_ordem.ItemIndex];
  datm_de_para.qry_de_para_.Open;
  Localiza(datm_de_para.qry_de_para_, Pesquisa, a_str_indices[0] );
  //edt_chave.SetFocus;
end;

procedure Tfrm_de_para.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_de_para.qry_de_para_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

function Tfrm_de_para.Consiste : Boolean;
begin
  if dbedt_cd_unid_neg.Text = '' then
  begin
    BoxMensagem('Campo Unidade de Negócios deve ser preenchido!', 2);
    pgctrl_de_para.ActivePage := ts_dados_basicos;
   // dbedt_cd_unid_neg.SetFocus;
    Consiste := False;
    Exit;
  end
  else
  begin
    if Trim(dbedt_nm_unid_neg.Text) = '' then
    begin
      BoxMensagem('Código da Unidade de Negócio inválido !',2);
      pgctrl_de_para.ActivePage := ts_dados_basicos;
      //dbedt_cd_unid_neg.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if dbedt_cd_produto.Text = '' then
  begin
    BoxMensagem('Campo Produto deve ser preenchido!', 2);
    pgctrl_de_para.ActivePage := ts_dados_basicos;
    //dbedt_cd_produto.SetFocus;
    Consiste := False;
    Exit;
  end
  else
  begin
    if Trim(dbedt_nm_produto.Text) = '' then
    begin
      BoxMensagem('Código do Produto inválido !',2);
      pgctrl_de_para.ActivePage := ts_dados_basicos;
      //dbedt_cd_produto.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if dbedt_cd_ddbroker.Text = '' then
  begin
    BoxMensagem('Campo Código DDBroker deve ser preenchido!', 2);
    pgctrl_de_para.ActivePage := ts_dados_basicos;
    //dbedt_cd_ddbroker.SetFocus;
    Consiste := False;
    Exit;
  end;
  {else
  begin
    if dbedt_nm_ddbroker.Text = '' then
    begin
      BoxMensagem('Código DDBroker inválido !',2);
      pgctrl_de_para.ActivePage := ts_dados_basicos;
      dbedt_cd_ddbroker.SetFocus;
      Consiste := False;
      Exit;
    end;
  end; }

  if dbedt_cd_externo.Text = '' then
  begin
    BoxMensagem('Campo Código Externo deve ser preenchido!', 2);
    pgctrl_de_para.ActivePage := ts_dados_basicos;
    //dbedt_cd_externo.SetFocus;
    Consiste := False;
    Exit;
  end;

  Consiste := True;
end;

function Tfrm_de_para.Grava : Boolean;
var
  cGuarda1, cGuarda4, cGuarda5 : string[2];
  cGuarda2 : string[5];
  cGuarda3,cGuarda6 : string[15];

begin
  try
    datm_main.db_broker.StartTransaction;
    with datm_de_para do
    begin
      //cGuarda1 := dblkpcbox_cd_tabela.KeyValue;
      cGuarda1 := dbedt_cdtabela.Text  ;
      cGuarda2 := dbedt_cd_ddbroker.Text;
      cGuarda3 := dbedt_cd_externo.Text;
      cGuarda4 := dbedt_cd_unid_neg.Text;
      cGuarda5 := dbedt_cd_produto.Text;
      cGuarda6 := dbedt_cd_grupo.Text;

      if ( qry_de_para_.State in [dsInsert, dsEdit] ) then
        qry_de_para_.Post;

      datm_main.db_broker.Commit;
      Grava := True;

      qry_de_para_.Close;
      qry_de_para_.Prepare;
      qry_de_para_.Open;
      qry_de_para_.Locate('CD_UNID_NEG;CD_PRODUTO;CD_TABELA;CD_DDBROKER;CD_EXTERNO;CD_GRUPO', VarArrayOf ([cGuarda4, cGuarda5, cGuarda1, cGuarda2, cGuarda3,cGuarda6]), [loCaseInsensitive])
    end;

  except
    on E: Exception do
    begin
      datm_de_para.qry_de_para_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );

 // pgctrl_de_para.SetFocus;
end;

function Tfrm_de_para.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_de_para.qry_de_para_.State in [dsEdit] ) and st_modificar ) or
     ( datm_de_para.qry_de_para_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Tabela De->Para foi alterada.' + #13#10 +
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

procedure Tfrm_de_para.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_de_para.Cancelar;
begin
  try
    if datm_de_para.qry_de_para_.State in [dsInsert, dsEdit] then
    begin
      datm_de_para.qry_de_para_.Cancel;
      pgctrl_de_para.ActivePage := ts_lista;
      pgctrl_de_paraChange(nil);
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_de_para.pgctrl_de_paraChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

procedure Tfrm_de_para.pgctrl_de_paraChange(Sender: TObject);
begin
  OnChanging := False;

  if (pgctrl_de_para.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled := True;
  end
  else
  begin
    Habilita_Btn_CbBx;

    if datm_de_para.qry_de_para_CD_UNID_NEG.AsString = '' then
    begin
      lbl_cd_unid_neg.Enabled   := False;
      lbl_cd_produto.Enabled    := False;
      dbedt_cd_unid_neg.Enabled := False;
      dbedt_cd_produto.Enabled  := False;
      dbedt_cd_grupo.Enabled  := False;
      dbedt_nm_unid_neg.Enabled := False;
      dbedt_nm_produto.Enabled  := False;
      dbedt_nm_grupo.Enabled  := False;
      btn_co_unid_neg.Enabled   := False;
      btn_co_produto.Enabled    := False;
      btn_co_grupo.Enabled    := False;
    end
    else
    begin
      lbl_cd_unid_neg.Enabled   := True;
      lbl_cd_produto.Enabled    := True;
      dbedt_cd_unid_neg.Enabled := True;
      dbedt_cd_produto.Enabled  := True;
      dbedt_cd_grupo.Enabled  := True;
      dbedt_nm_unid_neg.Enabled := True;
      dbedt_nm_produto.Enabled  := True;
      dbedt_nm_grupo.Enabled  := True;
      btn_co_unid_neg.Enabled   := True;
      btn_co_produto.Enabled    := True;
      btn_co_grupo.Enabled    := True;
    end;
    dbnvg.Enabled := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
  end;

end;

procedure Tfrm_de_para.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;


procedure Tfrm_de_para.btn_co_ddbrokerClick(Sender: TObject);
begin
  if not (datm_de_para.qry_de_para_.State in [dsInsert, dsEdit] ) then datm_de_para.qry_de_para_.Edit;
  with TQuery.Create(application) do begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('SELECT ISNULL(NM_TABELA,""), ISNULL(NM_CHAVE,""), ISNULL(NM_RETORNO,""), ISNULL(NM_FILTRO,"") FROM TTP_DE_PARA (NOLOCK)');
    SQL.Add(' WHERE CD_DE_PARA = "' + Copy('00', 1, 2 - Length(IntToStr(dblkpcbox_cd_tabela.KeyValue))) + IntToStr(dblkpcbox_cd_tabela.KeyValue) + '" ');
    Open;
    if (IsEmpty) or (Fields[0].AsString = '') then
      datm_de_para.qry_de_para_CD_DDBroker.AsString := ''
    else begin
      if Trim(Fields[3].AsString) <> '' then
        datm_de_para.qry_de_para_CD_DDBroker.AsString := ConsultaOnLineExFiltro( Fields[0].AsString, 'Tabela De-Para', [Fields[1].AsString , Fields[2].AsString], ['Código', 'Descrição'],
                                                         Fields[1].AsString , Fields[3].AsString, nil, datm_de_para.qry_de_para_CD_DDBroker.AsString)
      else
        datm_de_para.qry_de_para_CD_DDBroker.AsString := ConsultaOnLineEx( Fields[0].AsString, 'Tabela De-Para', [Fields[1].AsString , Fields[2].AsString], ['Código', 'Descrição'],
                                                         Fields[1].AsString,  nil, 1, datm_de_para.qry_de_para_CD_DDBroker.AsString)
    end;
    Free;
  end;
end;

procedure Tfrm_de_para.Habilita_Btn_CbBx;
begin
  if datm_de_para.qry_de_para_CD_TABELA.IsNull then
  begin
    lbl_cd_tabela.Enabled      := False;
    lbl_cd_ddbroker.Enabled    := False;
    lbl_cd_externo.Enabled     := False;
    dblkpcbox_cd_tabela.Enabled:= False;
    dbedt_cd_ddbroker.Enabled  := False;
    dbedt_cd_externo.Enabled   := False;
    dbedt_cd_ddbroker.TabStop  := False;
    dbedt_cd_externo.TabStop   := False;
    dblkpcbox_cd_tabela.TabStop:= False;
    btn_co_grupo.Enabled    := False;
    //btn_co_ddbroker.Enabled    := False;
  end
  else
  begin
    lbl_cd_tabela.Enabled      := True;
    lbl_cd_ddbroker.Enabled    := True;
    lbl_cd_externo.Enabled     := True;
    dblkpcbox_cd_tabela.Enabled:= True;
    dbedt_cd_ddbroker.Enabled  := True;
    dbedt_cd_externo.Enabled   := True;
    dbedt_cd_ddbroker.TabStop  := True;
    dbedt_cd_externo.TabStop   := True;
    dblkpcbox_cd_tabela.TabStop:= True;
    //btn_co_ddbroker.Enabled    := True;

    Muda_Lookup_Nm( dblkpcbox_cd_tabela.KeyValue );
  end;

  lbl_cd_unid_neg.Enabled   := True;
  lbl_cd_produto.Enabled    := True;
  lbl_cd_grupo.Enabled    := True;
  dbedt_cd_unid_neg.Enabled := True;
  dbedt_cd_produto.Enabled  := True;
  dbedt_cd_grupo.Enabled  := True;
  btn_co_unid_neg.Enabled   := True;
  btn_co_produto.Enabled    := True;
  btn_co_grupo.Enabled    := True;
  dbedt_nm_unid_neg.Enabled := True;
  dbedt_nm_produto.Enabled  := True;
  dbedt_nm_grupo.Enabled  := True;
end;


procedure Tfrm_de_para.Muda_Lookup_Nm(CodTabela: String);
var
  vTabela, vChave: string[75];
  vTamanho: string;
begin
  vTabela := '';
  vChave  := '';
  CodTabela := Trim(CodTabela);
  vTabela := ConsultaLookUp('TTP_DE_PARA', 'CD_DE_PARA', Copy('00', 1, 2 - Length(CodTabela)) + CodTabela , 'NM_TABELA');
  vChave  := ConsultaLookUp('TTP_DE_PARA', 'CD_DE_PARA', Copy('00', 1, 2 - Length(CodTabela)) + CodTabela , 'NM_CHAVE');

  try
    vTamanho := ConsultaLookUPSQL('SELECT LENGTH ' +
                                  'FROM SYSCOLUMNS ' +
                                  'WHERE NAME = "' + vChave + '" ' +
                                  '  AND ID IN (SELECT ID ' +
                                  '             FROM SYSOBJECTS ' +
                                  '             WHERE NAME = "' + vTabela + '")', 'LENGTH');
  except
    vTamanho := '0';
  end;


  dbedt_cd_ddbroker.MaxLength := StrToIntDef(vTamanho, 0);
{  if ( nNum = 1 ) or ( nNum = 5 ) then
     dbedt_cd_ddbroker.MaxLength := 5
  else if ( nNum = 2 ) or ( nNum = 9 ) or ( nNum = 12 ) then
     dbedt_cd_ddbroker.MaxLength := 3
  else if ( nNum = 3 ) then
     dbedt_cd_ddbroker.MaxLength := 2
  else if ( nNum = 4 ) or ( nNum = 6 ) or ( nNum = 7 ) or ( nNum = 8 ) then
     dbedt_cd_ddbroker.MaxLength := 4; }
end;

procedure Tfrm_de_para.Valida_Exit;
begin
  if datm_de_para.qry_de_para_.State in [dsEdit,dsInsert] then
  begin
    ValidCodigo( dbedt_cd_unid_neg );
    if dbedt_cd_unid_neg.Text <> '' then
    begin
      if dbedt_nm_unid_neg.Text = '' then
      begin
        BoxMensagem( 'Unidade de Negócio não encontrada !!', 2 );
        dbedt_cd_unid_neg.Clear;
        //dbedt_cd_unid_neg.SetFocus;
      end;
    end;

    //ValidCodigo(dbedt_cd_produto);
    if dbedt_cd_produto.Text <> '' then
    begin
      if dbedt_nm_produto.Text = '' then
      begin
        BoxMensagem( 'Produto não encontrado !!', 2 );
        dbedt_cd_produto.Clear;
        //dbedt_cd_produto.SetFocus;
      end;
    end;

       //ValidCodigo(dbedt_cd_produto);
    if dbedt_cd_grupo.Text <> '' then
    begin
      if dbedt_nm_grupo.Text = '' then
      begin
        BoxMensagem( 'Grupo não encontrado !!', 2 );
        dbedt_cd_grupo.Clear;
        //dbedt_cd_grupo.SetFocus;
      end;
    end;

    ValCodigo( dbedt_cd_ddbroker, dbedt_cd_ddbroker.MaxLength );
    {if dbedt_cd_ddbroker.Text <> '' then
    begin
      if ( dbedt_nm_ddbroker.Text = '' ) then
      begin
        BoxMensagem( 'Código DDBroker inválido!', 2 );
        pgctrl_de_para.ActivePage := ts_dados_basicos;
        dbedt_cd_ddbroker.SetFocus;
        Exit;
      end;
    end;}
  end;
end;

procedure Tfrm_de_para.dbedt_cd_ddbrokerExit(Sender: TObject);
begin
  Valida_Exit;
end;

procedure Tfrm_de_para.ValCodigo( dbedit_Codigo : TDbEdit; nNum : Integer );
var
  nLoop, nFim : Byte;
  lDigitouLetras : Boolean;
  nNumero : Double;
begin
  lDigitouLetras := False;
  if dbedit_Codigo.Field.Size = 0 then
     Exit;

  nFim := Length( Trim( dbedit_Codigo.Text ) );

  if nFim > 0 then
  begin
    nLoop := 1;
    Repeat
      if Not ( dbedit_Codigo.Text[nLoop] In ['0'..'9'] ) then
         lDigitouLetras := True;
      nLoop := nLoop + 1;
    Until (lDigitouLetras) or ( nLoop > nFim );

    // SE O USUÁRIO NÃO DIGITOU LETRAS NO CÓDIGO 
    if Not( lDigitouLetras ) then
    begin
      nNumero := StrToFloat(dbedit_Codigo.Text);
//      if Not dbedit_codigo.ReadOnly then
//      dbedit_Codigo.field.AsString := StrZero( nNumero, nNum );
    end;
  end;
end;

procedure Tfrm_de_para.dbedt_cd_ddbrokerKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_unid_neg then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = dbedt_cd_produto  then btn_co_produtoClick(btn_co_produto);
    if Sender = dbedt_cd_grupo  then btn_co_grupoClick(btn_co_grupo);
    //if Sender = dbedt_cd_ddbroker then btn_co_ddbrokerClick(btn_co_ddbroker);
  end;
end;

procedure Tfrm_de_para.btn_co_produtoClick(Sender: TObject);
begin
{  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto);
  frm_produto.Cons_OnLine := datm_de_para.qry_de_para_CD_PRODUTO;
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_de_para.qry_de_para_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_de_para.qry_de_para_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_de_para do
  begin
    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;
  end;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2311';
  dbedt_cd_produtoExit(nil); }
  if Sender is TSpeedButton then begin
    if not ( datm_de_para.qry_de_para_.State in [dsEdit, dsInsert]) and (st_modificar) then datm_de_para.qry_de_para_.Edit;
    datm_de_para.qry_de_para_CD_PRODUTO.AsString := ConsultaOnlineEx('TPRODUTO', 'Produtos', ['CD_PRODUTO', 'NM_PRODUTO'], ['Código', 'Produto'], 'CD_PRODUTO', nil, 1, datm_de_para.qry_de_para_CD_PRODUTO.AsString);
    dbedt_cd_produtoExit(nil);
  end;
end;


procedure Tfrm_de_para.btn_co_unid_negClick(Sender: TObject);
begin
 { vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  frm_unidade.Cons_OnLine := datm_de_para.qry_de_para_CD_UNID_NEG;
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_de_para.qry_de_para_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_de_para.qry_de_para_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_de_para do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
  end;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2311';
  dbedt_cd_unid_negExit(Sender);
  }

  if Sender is TSpeedButton then begin
    if not ( datm_de_para.qry_de_para_.State in [dsEdit, dsInsert]) and (st_modificar) then datm_de_para.qry_de_para_.Edit;
    datm_de_para.qry_de_para_CD_UNID_NEG.AsString := ConsultaOnlineEx('TUNID_NEG', 'Unidades de Negócio', ['CD_UNID_NEG', 'NM_UNID_NEG'], ['Código', 'Unidade'], 'CD_UNID_NEG', nil, 1, datm_de_para.qry_de_para_CD_UNID_NEG.AsString);
    dbedt_cd_unid_negExit(nil);
  end;
end;

procedure Tfrm_de_para.dbedt_cd_unid_negExit(Sender: TObject);
begin
  Valida_Exit;
end;

procedure Tfrm_de_para.dbedt_cd_produtoExit(Sender: TObject);
begin
  Valida_Exit;

  if dbedt_cd_produto.Text <> '' then
  begin
    dblkpcbox_cd_tabela.Enabled:= True;
    lbl_cd_tabela.Enabled := True;
    //dblkpcbox_cd_tabela.SetFocus;
  end;

end;

procedure Tfrm_de_para.dblkpcbox_cd_tabelaExit(Sender: TObject);
begin
  Habilita_Btn_CbBx;

  //if (dblkpcbox_cd_tabela.KeyValue <> 0) then
    // dbedt_cd_ddbroker.SetFocus;
end;

procedure Tfrm_de_para.btn_co_grupoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not ( datm_de_para.qry_de_para_.State in [dsEdit, dsInsert]) and (st_modificar) then datm_de_para.qry_de_para_.Edit;
    datm_de_para.qry_de_para_CD_GRUPO.AsString := ConsultaOnlineEx('TGRUPO', 'Grupos', ['CD_GRUPO', 'NM_GRUPO'], ['Código', 'Grupo'], 'CD_GRUPO', nil, 1, datm_de_para.qry_de_para_CD_GRUPO.AsString);
    dbedt_cd_grupoExit(nil);
  end
end;

procedure Tfrm_de_para.dbedt_cd_grupoExit(Sender: TObject);
begin
  Valida_Exit;

  if dbedt_cd_grupo.Text <> '' then
  begin
    lbl_cd_tabela.Enabled := True;
    dblkpcbox_cd_tabela.Enabled:= True;
    lbl_cd_ddbroker.Enabled := True;
    dbedt_cd_ddbroker.Enabled:= True;
    lbl_cd_externo.Enabled := True;
    dbedt_cd_externo.Enabled := True;
    //dblkpcbox_cd_tabela.SetFocus;
  end;
end;

procedure Tfrm_de_para.dbedt_cdtabelaExit(Sender: TObject);
begin
  if dbedt_cdtabela.Text <> '' then
  begin
    lbl_cd_tabela.Enabled := True;
    dblkpcbox_cd_tabela.Enabled:= True;
    lbl_cd_ddbroker.Enabled := True;
    dbedt_cd_ddbroker.Enabled:= True;
    lbl_cd_externo.Enabled := True;
    dbedt_cd_externo.Enabled := True;
  end;
end;

procedure Tfrm_de_para.SpeedButton1Click(Sender: TObject);
begin
    if Sender is TSpeedButton then begin
    if not ( datm_de_para.qry_de_para_.State in [dsEdit, dsInsert]) and (st_modificar) then datm_de_para.qry_de_para_.Edit;
    datm_de_para.qry_de_para_cd_tabela.AsString := ConsultaOnlineEx('TTP_DE_PARA', 'Tabelas', ['CD_DE_PARA', 'NM_DE_PARA'],
    ['Cód Tabela', 'Tabela'], 'CD_DE_PARA', nil, 1, datm_de_para.qry_de_para_CD_TABELA.AsString);
    dbedt_cdtabelaExit(nil);
  end
end;

end.



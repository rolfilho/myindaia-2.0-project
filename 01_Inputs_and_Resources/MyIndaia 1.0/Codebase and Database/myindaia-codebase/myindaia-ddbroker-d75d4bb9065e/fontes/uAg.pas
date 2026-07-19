(*******************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGSM127.PAS - frm_ag

AUTOR: BYSOFT

DATA: dd/mm/yyyy

Manutenção: Ricardo Giacomi Lopes

Data: 23/05/2002 - ADBR0096 - Etiqueta de Cobrança

********************************************************************************)

unit uAg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, DB, DBTAbles, RXSpin, Spin, RxDBComb;

type
  Tfrm_ag = class(TForm)
    pgctrl_ag: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_btn_ag: TPanel;
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
    dbg_ag: TDBGrid;
    ts_contato: TTabSheet;
    dbg_contato: TDBGrid;
    Label24: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    pnl_ag: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lbl_ativo: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    btn_cidade: TSpeedButton;
    btn_pais: TSpeedButton;
    dbedt_cd_ag: TDBEdit;
    dbedt_nr_sigla: TDBEdit;
    dbedt_look_nm_pais: TDBEdit;
    dbedt_look_nm_cidade: TDBEdit;
    Label15: TLabel;
    Label17: TLabel;
    ts_dados_desemb: TTabSheet;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label16: TLabel;
    dbedt_nr_fax: TDBEdit;
    dbedt_ds_homepage: TDBEdit;
    dbedt_nm_contato: TDBEdit;
    dbedt_ds_depto_contato: TDBEdit;
    dbedt_ds_cargo_contato: TDBEdit;
    dbedt_nr_fone_contato: TDBEdit;
    dbedt_ds_email_contato: TDBEdit;
    dbedt_agente: TDBEdit;
    DBEdit3: TDBEdit;
    dbedt_nm_ag: TDBEdit;
    dbedt_nm_agente_reduzido: TDBEdit;
    RxDBCboBox_Ativp_Ag: TRxDBComboBox;
    dbmemo_ds_endereco: TDBMemo;
    dbedt_cd_cidade: TDBEdit;
    DBEdit4: TDBEdit;
    dbedt_cd_pais: TDBEdit;
    dbedt_nr_zip_code: TDBEdit;
    Panel2: TPanel;
    Label26: TLabel;
    Panel3: TPanel;
    Label32: TLabel;
    btn_cd_bco_2: TSpeedButton;
    Label33: TLabel;
    btn_cd_moeda_3: TSpeedButton;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    btn_cd_moeda_4: TSpeedButton;
    Label37: TLabel;
    dbedt_look_nm_banco_2: TDBEdit;
    dbedt_nm_moeda_3: TDBEdit;
    dbedt_nm_moeda_4: TDBEdit;
    DBMemo1: TDBMemo;
    dbedt_cd_bco_2: TDBEdit;
    dbedt_cd_moeda_3: TDBEdit;
    DBEdit12: TDBEdit;
    dbedt_cd_moeda_4: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    pnl1: TPanel;
    dbedt_cd_moeda_ct_1: TDBEdit;
    Label18: TLabel;
    Label22: TLabel;
    btn_co_banco: TSpeedButton;
    Label19: TLabel;
    btn_co_moeda_ct_1: TSpeedButton;
    btn_co_moeda_ct_2: TSpeedButton;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label13: TLabel;
    Label31: TLabel;
    dbedt_look_nm_banco: TDBEdit;
    dbedt_nm_moeda_ct_1: TDBEdit;
    dbedt_nm_moeda_ct_2: TDBEdit;
    dbedt_nr_iata: TDBEdit;
    dbedt_ds_profit: TDBEdit;
    DBEdit2: TDBEdit;
    dbedt_cd_banco: TDBEdit;
    DBEdit9: TDBEdit;
    dbedt_cd_moeda_ct_2: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    lbl1: TLabel;
    dbedtswift: TDBEdit;
    dbedtSwift2: TDBEdit;
    lbl2: TLabel;
    dbedt_cnpj_agente: TDBEdit;
    lbl_cnpj_empresa: TLabel;
    Label38: TLabel;
    dbedtScacCode: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbg_agDblClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbedt_nm_agChange(Sender: TObject);
    procedure dbedt_cd_cidadeExit(Sender: TObject);
    procedure dbedt_cd_tx_expExit(Sender: TObject);
    procedure pgctrl_agChange(Sender: TObject);
    procedure dbg_agKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure pgctrl_agChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CodExits;
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_cidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_cidadeClick (Sender: TObject);
    procedure btn_paisClick(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure dbedt_cd_tx_impExit(Sender: TObject);
    procedure dbedt_cd_contatoChange(Sender: TObject);
    procedure dbg_contatoDblClick(Sender: TObject);
    procedure dbg_contatoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure btn_co_moeda_ct_1Click(Sender: TObject);
    procedure btn_co_moeda_ct_2Click(Sender: TObject);
    procedure dbedt_cd_moeda_ct_1Exit(Sender: TObject);
    procedure dbedt_cd_moeda_ct_2Exit(Sender: TObject);
    procedure dbedt_cd_paisExit(Sender: TObject);
    procedure dbedt_cd_bco_2Exit(Sender: TObject);
    procedure dbedt_cd_moeda_3Exit(Sender: TObject);
    procedure dbedt_cd_moeda_4Exit(Sender: TObject);
    procedure btn_cd_moeda_3Click(Sender: TObject);
    procedure btn_cd_moeda_4Click(Sender: TObject);
    procedure btn_cd_bco_2Click(Sender: TObject);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..1] Of String[60];
    Pesquisa : String;

    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );

    function Consiste : Boolean;
    function Grava    : Boolean;
    function Veralt   : Boolean;
    function jaExisteCGC( cnpj, CodAgente: String ): Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
  public
    lDi, lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    st_modificar, st_incluir, st_excluir, tp_ag: Boolean;
  end;

var
  frm_ag: Tfrm_ag;

implementation

uses GSMLIB, PGGP001, PGGP017, dAg, PGSM126, PGSM014, PGSM096, PGSM148,
  PGSM242, ConsOnLineEx, uBancoItl;

{$R *.DFM}

function Tfrm_ag.jaExisteCGC( cnpj, CodAgente: String ): Boolean;
var qry_: TQuery;
begin
  if trim(cnpj) <> '' then
  begin
    qry_ := TQuery.Create( frm_ag );
    with qry_ do
    begin
      Close;
      DataBaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) CONT from TAGENTE WHERE NR_CGC_AGENTE = "' + cnpj + '" AND CD_AGENTE <> "'+ CodAgente +'"');
      Open;
      result := FieldByname('CONT').AsInteger > 0;
      Close;
      Free;
    end;
  end
  else
  result := false;
end;

procedure Tfrm_ag.btn_cidadeClick(Sender: TObject);
 var cidade:string;
begin
   cidade := ConsultaOnLineEx('TLOCAL_EMBARQUE','Cidade',['CODIGO','DESCRICAO','CD_SIGLA'],['Código','Cidade','Sigla'],'CODIGO',nil);
   if cidade <> '' then
    begin
      if not(datm_ag.qry_ag_.State in [dsEdit]) then datm_ag.qry_ag_.Edit;
      datm_ag.qry_ag_CD_CIDADE.AsString:=cidade;
      dbedt_cd_cidadeExit(sender);
    end;

end;

procedure Tfrm_ag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_ag do
    begin
      qry_ag_.Close;

      qry_ag_tx_.Close;
      qry_local_embarque_.Close;
      qry_contato_.Close;

      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_ag.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  tp_ag        := False;
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  {Inicializa o DataModule para Agentes}
  Application.CreateForm(Tdatm_ag, datm_ag );

  with datm_ag do
  begin
    ds_ag.AutoEdit := st_modificar;

  {  qry_ag_.Close;
    qry_ag_.Prepare;
    qry_ag_.Open;

    qry_contato_.Close;
    qry_contato_.Prepare;
    qry_contato_.Open;}


    qry_local_embarque_.Close;
    qry_local_embarque_.Prepare;
    qry_local_embarque_.Open;

     qry_pais_.Close;
     qry_pais_.Prepare;
     qry_pais_.Open;


  end;

  a_str_indices[0] := 'CD_AGENTE';
  a_str_indices[1] := 'NM_AGENTE';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_incluir.Enabled  := st_incluir;
  mi_excluir.Enabled  := st_excluir;

  lDi                 := False;

end;

procedure Tfrm_ag.dbg_agDblClick(Sender: TObject);
begin
  if lCons_OnLine then
{  begin
    try
      if lDi then
        Cons_OnLine.AsString := datm_ag.qry_ag_NR_CGC_AGENTE.AsString
      else
        Cons_OnLine.AsString := datm_ag.qry_ag_CD_AGENTE.AsString;
    except}
      try
         if lDi then
           Cons_OnLine_Texto := datm_ag.qry_ag_NR_CGC_AGENTE.AsString
         else
           Cons_OnLine_Texto := datm_ag.qry_ag_CD_AGENTE.AsString;
      except
        if lDi then
          BoxMensagem('Não foi possível retornar o C.N.P.J. do Agente !', 2)
        else
          BoxMensagem('Não foi possível retornar o Código do Agente !', 2);
      end;
//    end;
    Close;
//  end;
end;

procedure Tfrm_ag.btn_incluirClick(Sender: TObject);
var x:string;
begin

 if (pgctrl_ag.ActivePage = ts_contato)then
   begin
     with datm_ag do
        begin
           qry_contato_.DisableControls;
           qry_contato_.Cancel;
           qry_contato_.Append;
           qry_contato_.EnableControls;

           qry_contato_.FieldByName('CD_CONTATO').AsString := UltCod( qry_ult_contato_, qry_ult_contato_ULTIMO );
        end;
  dbedt_nm_contato.SetFocus;
 end;


 if (pgctrl_ag.ActivePage = ts_dados_basicos) or (pgctrl_ag.ActivePage = ts_lista)then
 begin
  with datm_ag do
  begin
    qry_ag_.DisableControls;
    qry_ag_.Cancel;
    qry_ag_.Append;
    qry_ag_.EnableControls;
    qry_ag_.FieldByName('CD_AGENTE').AsString := UltCod( qry_ult_ag_, qry_ult_ag_ULTIMO );
    qry_ag_.FieldByName('DS_TIPO_AGENTE').AsString := '0';
    qry_ag_.FieldByName('IN_ATIVO').AsString  := '1';
     if tp_ag then
       begin
       qry_ag_.FieldByName('TP_AG').AsString  := '1';
       pgctrl_ag.ActivePage := ts_dados_basicos;
        dbedt_nm_ag.SetFocus;
       end
     else
       begin
        qry_ag_.FieldByName('TP_AG').AsString  := '0';
        pgctrl_ag.ActivePage := ts_dados_desemb;
        dbedt_agente.SetFocus;
       end;
  end;

 end;
  btn_mi( False, true, true, False );
end;

procedure Tfrm_ag.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_ag.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_ag.Cancelar;
begin
 if(pgctrl_ag.ActivePage = ts_contato)then
   begin
      try
        if datm_ag.qry_contato_.State in [dsInsert, dsEdit] then
         begin
            datm_ag.qry_contato_.Cancel;
            pgctrl_ag.ActivePage := ts_contato;
            dbedt_nm_contato.SetFocus;
         end;
        except
           BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente!', 2 );
         end;
     end
 else
   begin
         try
           if datm_ag.qry_ag_.State in [dsInsert, dsEdit] then
               datm_ag.qry_ag_.Cancel;
          except
              BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente!', 2 );
          end;
   end;
 Btn_Mi(st_incluir, False, False, st_excluir );
end;
procedure Tfrm_ag.btn_excluirClick(Sender: TObject);
var
  Pesquisa : String;
begin
if(pgctrl_ag.ActivePage = ts_contato)then
   begin
      if BoxMensagem( 'Este Contato será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
          try
          datm_main.db_broker.StartTransaction;
           datm_ag.qry_contato_.Delete;
           datm_main.db_broker.Commit;
         except
           on E: Exception do
           begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            datm_ag.qry_contato_.Cancel;
            TrataErro(E);
          end;
        end;
  pgctrl_ag.ActivePage := ts_contato;
end
else
  begin
  Pesquisa := datm_ag.qry_ag_CD_AGENTE.AsString;
  if BoxMensagem( 'Este agente será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_ag.qry_ag_.Delete;
    datm_main.db_broker.Commit;

    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' DELETE FROM MYINDAIA.DBO.TAGENTE WHERE CD_AGENTE = ''' + Pesquisa  + ''' ');
      ExecSQL;
      Free;
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_ag.qry_ag_.Cancel;
      TrataErro(E);
    end;
  end;
  pgctrl_ag.ActivePage := ts_lista;
  end;
end;

procedure Tfrm_ag.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin

  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo           := nCodigo;
  datm_consulta_padrao.Tabela.TableName := cNomeTabela;

  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine       := fCampo;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

function Tfrm_ag.Grava : Boolean;
begin
  if(pgctrl_ag.ActivePage = ts_contato)then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_ag.qry_contato_.State in [dsInsert, dsEdit] ) then
      begin
        datm_ag.qry_contato_.Post;
        Pesquisa := datm_ag.qry_contato_CD_CONTATO.AsString;
        datm_ag.qry_contato_.Close;
        datm_ag.qry_contato_.Prepare;
        datm_ag.qry_contato_.Open;
        Localiza(datm_ag.qry_contato_, Pesquisa, a_str_indices[0] );
      end;
      datm_main.db_broker.Commit;

      Grava := True;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_ag.qry_contato_.Cancel;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;

  if(pgctrl_ag.ActivePage = ts_dados_basicos) or (pgctrl_ag.ActivePage = ts_dados_desemb)then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_ag.qry_ag_.State in [dsInsert, dsEdit] ) then
      begin
        datm_ag.qry_ag_.Post;
        Pesquisa := datm_ag.qry_ag_CD_AGENTE.AsString;
      //  datm_ag.qry_ag_.Close;
      //  datm_ag.qry_ag_.Prepare;
      //  datm_ag.qry_ag_.Open;
      //  Localiza(datm_ag.qry_ag_, Pesquisa, a_str_indices[0] );
      end;
      datm_main.db_broker.Commit;

      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add(' DELETE FROM MYINDAIA.DBO.TAGENTE WHERE CD_AGENTE = ''' + Pesquisa  + ''' ');
        ExecSQL;
        SQL.Clear;
        SQL.Add(' INSERT INTO MYINDAIA.DBO.TAGENTE ( ');
        SQL.Add(' CD_AGENTE, NM_AGENTE, CD_TAXA_IMP, CD_TAXA_EXP, IN_ATIVO, NR_CGC_AGENTE, NM_AGENTE_REDUZIDO ) ');
        SQL.Add(' SELECT CD_AGENTE, NM_AGENTE, CD_TAXA_IMP, CD_TAXA_EXP, IN_ATIVO, NR_CGC_AGENTE, NM_AGENTE_REDUZIDO ');
        SQL.Add(' FROM TAGENTE (NOLOCK) WHERE IN_ATIVO = ''1'' AND CD_AGENTE = ''' + Pesquisa + ''' ');
        ExecSQL;
        Free;
      end;

      Grava := True;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        datm_ag.qry_ag_.Cancel;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;

  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_ag.Consiste : Boolean;
var CGC_NOVO : String;
begin
  {Descrição do agente}
  if (pgctrl_ag.ActivePage = ts_contato) and (datm_ag.qry_contato_.State in [dsEdit,dsInsert])then
  begin
   if dbedt_nm_contato.Text = '' then
    begin
      BoxMensagem('Campo Nome de Contato deve ser preenchido!', 2);
      pgctrl_ag.ActivePage := ts_contato;
      dbedt_nm_contato.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  if ( datm_ag.qry_ag_.State in [dsInsert, dsEdit] ) then
  begin
    CGC_NOVO := stringReplace(stringReplace(stringReplace(dbedt_cnpj_agente.EditText,
                                            '.', '',[rfReplaceAll]),
                                            '-', '',[rfReplaceAll]),
                                            '/', '',[rfReplaceAll]);

    if datm_ag.qry_ag_NR_CGC_AGENTE.Value <> CGC_NOVO  then
    begin
      if jaExisteCGC(CGC_NOVO, datm_ag.qry_ag_CD_AGENTE.asString) then
      begin
        Application.MessageBox('CNPJ já cadastrado', 'Atenção', MB_OK) ;
        exit;
      end;
    end;
  end;

  if (pgctrl_ag.ActivePage = ts_dados_basicos) and (datm_ag.qry_ag_.State in [dsEdit,dsInsert])then
  begin
      if Not lNaoConsiste then
      begin
        if dbedt_nm_ag.Text = '' then
        begin
          BoxMensagem('Campo ''Descrição'' deve ser preenchido!', 2);
          pgctrl_ag.ActivePage := ts_dados_basicos;
          dbedt_nm_ag.SetFocus;
          Consiste := False;
          Exit;
        end;

    {    if Trim( dbedt_cgc_agente.Text ) = '' then
        begin
          BoxMensagem('Campo ''C.N.P.J.'' deve ser preenchido!', 2);
          pgctrl_ag.ActivePage := ts_dados_basicos;
          dbedt_cgc_agente.SetFocus;
          Consiste := False;
          Exit;
        end;}
      end;


      if ( datm_ag.qry_ag_.State in [dsEdit, dsInsert] ) then
      begin

        if dbedt_cd_cidade.Text <> '' then
        begin
          ValidCodigo( dbedt_cd_cidade );
          if dbedt_look_nm_cidade.Text = '' then
          begin
            BoxMensagem('Código da Cidade. inválido!',2);
            pgctrl_ag.ActivePage := ts_dados_basicos;
            dbedt_cd_cidade.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      if ( datm_ag.qry_ag_.State in [dsEdit, dsInsert] ) then
      begin

        if dbedt_cd_pais.Text <> '' then
        begin
           ValidCodigo( dbedt_cd_pais );
          if dbedt_look_nm_pais.Text = '' then
          begin
            BoxMensagem('Código do País inválido!',2);
            pgctrl_ag.ActivePage := ts_dados_basicos;
            dbedt_cd_pais.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
  end;

  if (pgctrl_ag.ActivePage = ts_dados_desemb) and (datm_ag.qry_ag_.State in [dsEdit,dsInsert])then
  begin
    if dbedt_agente.Text = '' then
    begin
      BoxMensagem('Campo Nome deve ser preenchido!', 2);
      pgctrl_ag.ActivePage := ts_dados_desemb;
      dbedt_agente.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
  Consiste := True;
end;

procedure Tfrm_ag.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_ag.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ag.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_ag.qry_ag_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_ag.dbedt_nm_agChange(Sender: TObject);
begin
  btn_paisClick(dbedt_nm_ag);
  if ( datm_ag.qry_ag_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_ag.dbedt_cd_cidadeExit(Sender: TObject);
begin
 with datm_ag do
  begin
   if not(qry_ag_.State in [dsEdit,dsInsert]) then exit;
   if dbedt_cd_cidade.Text <> '' then
     begin
       ValidCodigo( dbedt_cd_cidade );
       qry_pesquisa_.Active:=false;
       qry_pesquisa_.Sql.Clear;
       qry_pesquisa_.Sql.Add('SELECT DESCRICAO, CD_SIGLA FROM TLOCAL_EMBARQUE WHERE CODIGO ="'+dbedt_cd_cidade.Text+'"');
       qry_pesquisa_.Active:=true;

       if qry_pesquisa_.RecordCount > 0 then
         begin
            qry_ag_DESCRICAO.AsString := qry_pesquisa_.fields[0].AsString;
            qry_ag_CD_SIGLA.AsString := qry_pesquisa_.fields[1].AsString;
           qry_pesquisa_.Close;
         end
       else
         begin
           qry_pesquisa_.Close;
           dbedt_look_nm_cidade.Text := '';
           BoxMensagem('Código do Local inválido!', 2);
           dbedt_cd_cidade .SetFocus;
           Exit;
        end;

      end
    else dbedt_look_nm_cidade.Text := '';
 end;
end;

procedure Tfrm_ag.dbedt_cd_tx_expExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_ag.pgctrl_agChange(Sender: TObject);
begin
  if (pgctrl_ag.ActivePage = ts_lista ) or
     (pgctrl_ag.ActivePage = ts_dados_basicos) then
     dbnvg.DataSource := datm_ag.ds_ag
  else
     dbnvg.DataSource := datm_ag.ds_contato;

  if (pgctrl_ag.ActivePage = ts_lista ) or
     (pgctrl_ag.ActivePage = ts_contato )  then
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

  if (pgctrl_ag.ActivePage = ts_dados_basicos) then
      dbedt_nm_ag.SetFocus;

  if (pgctrl_ag.ActivePage = ts_contato) then
  begin
    datm_ag.qry_contato_.Close;
    datm_ag.qry_contato_.Prepare;
    datm_ag.qry_contato_.Open;
  end;
end;

procedure Tfrm_ag.dbg_agKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then dbg_agDblClick(Sender);
end;

procedure Tfrm_ag.FormShow(Sender: TObject);
begin
  pnl_btn_ag.Color     := clMenuBroker;
  lNaoConsiste         := False;
  pgctrl_ag.ActivePage := ts_lista;
  edt_chave.SetFocus;
  datm_ag.Qry_ag_.Close;
  if tp_ag then
  begin
    datm_ag.Qry_ag_.ParamByName('TP_AG').AsString := '1' ;
    ts_dados_desemb.Tabvisible:=false;
    ts_contato.Tabvisible:=true;
    ts_dados_basicos.Tabvisible:=true;
    frm_ag.Caption:='Cadastro de Agente';
  //  dbg_ag.Columns.Items[3].Visible:= true;
  end
  else
  begin
    datm_ag.Qry_ag_.ParamByName('TP_AG').AsString := '0' ;
    ts_dados_desemb.Tabvisible:=true;
    ts_contato.Tabvisible:=false;
    ts_dados_basicos.Tabvisible:=false;
    frm_ag.Caption:='Cadastro de Agente de Carga';
   // dbg_ag.Columns.Items[3].Visible:= false;
   end;
   datm_ag.Qry_ag_.Prepare;
   datm_ag.Qry_ag_.Open;
end;

procedure Tfrm_ag.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_ag.qry_ag_CD_AGENTE.AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_ag.qry_ag_.Close;
  datm_ag.qry_ag_.SQL[15] := 'TA.'+a_str_indices[cb_ordem.ItemIndex];
  datm_ag.qry_ag_.Prepare;
  datm_ag.qry_ag_.Open;
  Localiza(datm_ag.qry_ag_, Pesquisa, a_str_indices[0] );
  edt_chave.SetFocus;
end;

procedure Tfrm_ag.pgctrl_agChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_ag.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( ( datm_ag.qry_ag_.State in [dsEdit] ) and st_modificar ) or
     ( datm_ag.qry_ag_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Agentes foi alterado.' + #13#10 +
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
  if ( ( datm_ag.qry_contato_.State in [dsEdit] ) and st_modificar ) or
     ( datm_ag.qry_contato_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Contato foi alterado.' + #13#10 +
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

procedure Tfrm_ag.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;

  if (pgctrl_ag.ActivePage = ts_lista ) then
    if key = #13 then dbg_agDblClick(Sender);

  if (pgctrl_ag.ActivePage = ts_contato ) then
    if key = #13 then dbg_contatoDblClick(Sender);

end;

procedure Tfrm_ag.CodExits;
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;


procedure Tfrm_ag.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then dbg_agDblClick(nil);
end;

procedure Tfrm_ag.dbedt_cd_cidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = dbedt_cd_cidade     then btn_cidadeClick(btn_cidade);
    if Sender = dbedt_cd_pais       then btn_paisClick(btn_pais);
    if Sender = dbedt_cd_banco      then btn_co_bancoClick(btn_co_banco);
    if Sender = dbedt_cd_moeda_ct_1 then btn_co_moeda_ct_1Click(btn_co_moeda_ct_1);
    if Sender = dbedt_cd_moeda_ct_2 then btn_co_moeda_ct_2Click(btn_co_moeda_ct_2);
    if Sender = dbedt_cd_bco_2      then btn_cd_bco_2Click(btn_cd_bco_2);
    if Sender = dbedt_cd_moeda_3    then btn_cd_moeda_3Click(btn_cd_moeda_3);
    if Sender = dbedt_cd_moeda_4    then btn_cd_moeda_4Click(btn_cd_moeda_4);
  end;
end;

procedure Tfrm_ag.btn_paisClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_ag.qry_ag_) then exit;
    datm_ag.qry_ag_CD_PAIS.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil)
  end else
    dbedt_look_nm_pais.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais.Text,'DESCRICAO')
//  dbedt_cd_paisExit(Sender);
end;

procedure Tfrm_ag.btn_co_bancoClick(Sender: TObject);
begin

  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_ag.qry_ag_) then exit;
    datm_ag.qry_ag_CD_BCO.AsString := ConsultaOnLineEx('TBCO_ITL','Banco Internacional',['CD_BANCO','NM_BANCO'],['Código','Nome'],'CD_BANCO',nil)
  end; //else
//    dbedt_look_nm_pais.Text := ConsultaLookUP('TBCO_ITL','CD_BANCO',dbedt_cd_pais.Text,'NM_BANCO')

(*
  str_cd_modulo := '22';
  str_cd_rotina := '2267';

  Application.CreateForm(Tfrm_banco_itl, frm_banco_itl);

  with frm_banco_itl do
  begin
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    end;
  str_cd_modulo := '22';
  str_cd_rotina := '2229';
  if (frm_banco_itl.Cons_OnLine_Texto <> '') then
  begin
    if not (datm_ag.qry_ag_.State in [dsEdit, dsInsert])
      and (st_modificar) then
      datm_ag.qry_ag_.Edit;
    datm_ag.qry_ag_CD_BCO.Value := frm_banco_itl.Cons_OnLine_Texto;
  end;  *)
  dbedt_cd_bancoExit(Sender);
end;

procedure Tfrm_ag.dbedt_cd_tx_impExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_ag.dbedt_cd_contatoChange(Sender: TObject);
begin
  if ( datm_ag.qry_contato_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );

end;

procedure Tfrm_ag.dbg_contatoDblClick(Sender: TObject);
begin
if lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_ag.qry_contato_CD_AGENTE.AsString;
    except
      try
        Cons_Online_Texto := datm_ag.qry_contato_CD_AGENTE.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código do Vendedor !', 2);
      end;
    end;
    Close;
  end;

end;

procedure Tfrm_ag.dbg_contatoKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then dbg_contatoDblClick(Sender);
end;

procedure Tfrm_ag.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  VerAlt;
end;

procedure Tfrm_ag.dbedt_cd_bancoExit(Sender: TObject);
begin
 with datm_ag do
  begin
   if not(datm_ag.qry_ag_.State in [dsInsert,dsEdit]) then exit;
   if dbedt_cd_banco.Text <> '' then
     begin
       ValidCodigo( dbedt_cd_banco );
       qry_pesquisa_.Active:=false;
       qry_pesquisa_.Sql.Clear;
       qry_pesquisa_.Sql.Add('SELECT NM_BANCO FROM TBCO_ITL WHERE CD_BANCO="'+dbedt_cd_banco.Text+'"');
       qry_pesquisa_.Active:=true;

       if qry_pesquisa_.RecordCount > 0 then
         begin
           qry_ag_NM_BCO_ITL.AsString := qry_pesquisa_.fields[0].AsString;
           qry_pesquisa_.Close;
         end
       else
         begin
           qry_pesquisa_.Close;
           dbedt_look_nm_banco.Text := '';
           BoxMensagem('Código do Banco inválido!', 2);
           dbedt_cd_banco .SetFocus;
           Exit;
        end;

      end
    else dbedt_look_nm_banco.Text := '';
 end;
end;

procedure Tfrm_ag.btn_co_moeda_ct_1Click(Sender: TObject);
var moeda:string;
begin
   moeda := ConsultaOnLineEx('TMOEDA_BROKER','Moedas',['CD_MOEDA','NM_MOEDA','AP_MOEDA'],['Código','Moeda','Sigla'],'CD_MOEDA',nil);
   if moeda <> '' then
    begin
      if not(datm_ag.qry_ag_.State in [dsEdit]) then datm_ag.qry_ag_.Edit;
      datm_ag.qry_ag_CD_MOEDA_CONTA_1.AsString:=moeda;
      dbedt_cd_moeda_ct_1Exit(sender);
    end;

end;

procedure Tfrm_ag.btn_co_moeda_ct_2Click(Sender: TObject);
var moeda:string;
begin
   moeda := ConsultaOnLineEx('TMOEDA_BROKER','Moedas',['CD_MOEDA','NM_MOEDA','AP_MOEDA'],['Código','Moeda','Sigla'],'CD_MOEDA',nil);
   if moeda <> '' then
    begin
      if not(datm_ag.qry_ag_.State in [dsEdit]) then datm_ag.qry_ag_.Edit;
      datm_ag.qry_ag_CD_MOEDA_CONTA_2.AsString:=moeda;
      dbedt_cd_moeda_ct_2Exit(sender);
    end;


end;

procedure Tfrm_ag.dbedt_cd_moeda_ct_1Exit(Sender: TObject);
begin
with datm_ag do
 begin
   if not(qry_ag_.State in [dsEdit,dsInsert]) then exit;

   if dbedt_cd_moeda_ct_1.text <> '' then
    begin
      ValidCodigo( dbedt_cd_moeda_ct_1 );
       qry_pesquisa_.Active:=false;
       qry_pesquisa_.Sql.Clear;
       qry_pesquisa_.Sql.Add('SELECT AP_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA="'+dbedt_cd_moeda_ct_1.Text+'"');
       qry_pesquisa_.Active:=true;

       if qry_pesquisa_.RecordCount > 0 then
         begin
            qry_ag_MOEDA_CONTA_1.AsString := qry_pesquisa_.fields[0].AsString;
            qry_pesquisa_.Close;
         end
       else
         begin
           qry_pesquisa_.Close;
           dbedt_nm_moeda_ct_1.Text := '';
           BoxMensagem('Código da Moeda inválido!', 2);
           dbedt_cd_moeda_ct_1 .SetFocus;
           Exit;
        end;
    end
   else dbedt_nm_moeda_ct_1.text:=' ';



 end;
end;

procedure Tfrm_ag.dbedt_cd_moeda_ct_2Exit(Sender: TObject);
begin
with datm_ag do
 begin
   if not(qry_ag_.State in [dsEdit,dsInsert]) then exit;

   if dbedt_cd_moeda_ct_2.text <> '' then
    begin
      ValidCodigo( dbedt_cd_moeda_ct_2 );
       qry_pesquisa_.Active:=false;
       qry_pesquisa_.Sql.Clear;
       qry_pesquisa_.Sql.Add('SELECT AP_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA="'+dbedt_cd_moeda_ct_2.Text+'"');
       qry_pesquisa_.Active:=true;

       if qry_pesquisa_.RecordCount > 0 then
         begin
            qry_ag_MOEDA_CONTA_2.AsString := qry_pesquisa_.fields[0].AsString;
            qry_pesquisa_.Close;
         end
       else
         begin
           qry_pesquisa_.Close;
           dbedt_nm_moeda_ct_2.Text := '';
           BoxMensagem('Código da Moeda inválido!', 2);
           dbedt_cd_moeda_ct_2.SetFocus;
           Exit;
        end;
    end
   else dbedt_nm_moeda_ct_2.text:=' '; 
 end;
end;

procedure Tfrm_ag.dbedt_cd_paisExit(Sender: TObject);
begin
 with datm_ag do
  begin
   if not(qry_ag_.State in [dsEdit,dsInsert]) then exit;
   if dbedt_cd_pais.Text <> '' then
     begin
       ValidCodigo( dbedt_cd_pais );
       qry_pesquisa_.Active:=false;
       qry_pesquisa_.Sql.Clear;
       qry_pesquisa_.Sql.Add('SELECT NM_PAIS FROM TPAIS_BROKER WHERE CD_PAIS="'+dbedt_cd_pais.Text+'"');
       qry_pesquisa_.Active:=true;

       if qry_pesquisa_.RecordCount > 0 then
         begin
            qry_ag_NM_PAIS.AsString := qry_pesquisa_.fields[0].AsString;
            qry_pesquisa_.Close;
         end
       else
         begin
           qry_pesquisa_.Close;
           dbedt_look_nm_pais.Text := '';
           BoxMensagem('Código do País inválido!', 2);
           dbedt_cd_pais .SetFocus;
           Exit;
        end;

      end
    else dbedt_look_nm_pais.Text := '';
 end;
end;

procedure Tfrm_ag.dbedt_cd_bco_2Exit(Sender: TObject);
begin
 with datm_ag do
  begin
   if not(datm_ag.qry_ag_.State in [dsInsert,dsEdit]) then exit;
   if dbedt_cd_bco_2.Text <> '' then
     begin
       ValidCodigo( dbedt_cd_bco_2 );
       qry_pesquisa_.Active:=false;
       qry_pesquisa_.Sql.Clear;
       qry_pesquisa_.Sql.Add('SELECT NM_BANCO FROM TBCO_ITL WHERE CD_BANCO="'+dbedt_cd_bco_2.Text+'"');
       qry_pesquisa_.Active:=true;

       if qry_pesquisa_.RecordCount > 0 then
         begin
           qry_ag_NM_BCO_ITL_2.AsString := qry_pesquisa_.fields[0].AsString;
           qry_pesquisa_.Close;
         end
       else
         begin
           qry_pesquisa_.Close;
           dbedt_look_nm_banco_2.Text := '';
           BoxMensagem('Código do Banco inválido!', 2);
           dbedt_cd_bco_2.SetFocus;
           Exit;
        end;

      end
    else dbedt_look_nm_banco_2.Text := '';
 end;

end;

procedure Tfrm_ag.dbedt_cd_moeda_3Exit(Sender: TObject);
begin
with datm_ag do
 begin
   if not(qry_ag_.State in [dsEdit,dsInsert]) then exit;

   if dbedt_cd_moeda_3.text <> '' then
    begin
      ValidCodigo( dbedt_cd_moeda_3 );
       qry_pesquisa_.Active:=false;
       qry_pesquisa_.Sql.Clear;
       qry_pesquisa_.Sql.Add('SELECT AP_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA="'+dbedt_cd_moeda_3.Text+'"');
       qry_pesquisa_.Active:=true;

       if qry_pesquisa_.RecordCount > 0 then
         begin
            qry_ag_MOEDA_CONTA_3.AsString := qry_pesquisa_.fields[0].AsString;
            qry_pesquisa_.Close;
         end
       else
         begin
           qry_pesquisa_.Close;
           dbedt_nm_moeda_3.Text := '';
           BoxMensagem('Código da Moeda inválido!', 2);
           dbedt_cd_moeda_3 .SetFocus;
           Exit;
        end;
    end
   else dbedt_nm_moeda_3.text:=' ';



 end;

end;

procedure Tfrm_ag.dbedt_cd_moeda_4Exit(Sender: TObject);
begin
with datm_ag do
 begin
   if not(qry_ag_.State in [dsEdit,dsInsert]) then exit;

   if dbedt_cd_moeda_4.text <> '' then
    begin
      ValidCodigo( dbedt_cd_moeda_4 );
       qry_pesquisa_.Active:=false;
       qry_pesquisa_.Sql.Clear;
       qry_pesquisa_.Sql.Add('SELECT AP_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA="'+dbedt_cd_moeda_4.Text+'"');
       qry_pesquisa_.Active:=true;

       if qry_pesquisa_.RecordCount > 0 then
         begin
            qry_ag_MOEDA_CONTA_4.AsString := qry_pesquisa_.fields[0].AsString;
            qry_pesquisa_.Close;
         end
       else
         begin
           qry_pesquisa_.Close;
           dbedt_nm_moeda_4.Text := '';
           BoxMensagem('Código da Moeda inválido!', 2);
           dbedt_cd_moeda_4.SetFocus;
           Exit;
        end;
    end
   else dbedt_nm_moeda_4.text:=' ';



 end;

end;

procedure Tfrm_ag.btn_cd_moeda_3Click(Sender: TObject);
var moeda:string;
begin
   moeda := ConsultaOnLineEx('TMOEDA_BROKER','Moedas',['CD_MOEDA','NM_MOEDA','AP_MOEDA'],['Código','Moeda','Sigla'],'CD_MOEDA',nil);
   if moeda <> '' then
    begin
      if not(datm_ag.qry_ag_.State in [dsEdit]) then datm_ag.qry_ag_.Edit;
      datm_ag.qry_ag_CD_MOEDA_CONTA_3.AsString:=moeda;
      dbedt_cd_moeda_3Exit(sender);
    end;

end;

procedure Tfrm_ag.btn_cd_moeda_4Click(Sender: TObject);
var moeda:string;
begin
   moeda := ConsultaOnLineEx('TMOEDA_BROKER','Moedas',['CD_MOEDA','NM_MOEDA','AP_MOEDA'],['Código','Moeda','Sigla'],'CD_MOEDA',nil);
   if moeda <> '' then
    begin
      if not(datm_ag.qry_ag_.State in [dsEdit]) then datm_ag.qry_ag_.Edit;
      datm_ag.qry_ag_CD_MOEDA_CONTA_4.AsString:=moeda;
      dbedt_cd_moeda_4Exit(sender);
    end;

end;

procedure Tfrm_ag.btn_cd_bco_2Click(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_ag.qry_ag_) then exit;
    datm_ag.qry_ag_CD_BCO_2.AsString := ConsultaOnLineEx('TBCO_ITL','Banco Internacional',['CD_BANCO','NM_BANCO'],['Código','Nome'],'CD_BANCO',nil)
  end; //else
//    dbedt_look_nm_pais.Text := ConsultaLookUP('TBCO_ITL','CD_BANCO',dbedt_cd_pais.Text,'NM_BANCO')

(*  str_cd_modulo := '22';
  str_cd_rotina := '2267';

  Application.CreateForm(Tfrm_banco_itl, frm_banco_itl);

  with frm_banco_itl do
  begin
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    end;
  str_cd_modulo := '22';
  str_cd_rotina := '2229';
  if (frm_banco_itl.Cons_OnLine_Texto <> '') then
  begin
    if not (datm_ag.qry_ag_.State in [dsEdit, dsInsert])
      and (st_modificar) then
      datm_ag.qry_ag_.Edit;
    datm_ag.qry_ag_CD_BCO_2.Value := frm_banco_itl.Cons_OnLine_Texto;
  end;*)
  dbedt_cd_bco_2Exit(Sender);

end;

end.

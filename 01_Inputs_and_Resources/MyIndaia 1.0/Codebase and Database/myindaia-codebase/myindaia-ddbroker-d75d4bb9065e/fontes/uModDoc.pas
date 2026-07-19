unit uModDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ToolEdit, Mask, Grids, DBGrids, ComCtrls, Buttons,
  ExtCtrls, Menus, DB, Funcoes;
type
  Tfrm_mod_doc = class(TForm)
    pnl_btn_ag: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_documento: TPageControl;
    ts_lista: TTabSheet;
    ts_dados: TTabSheet;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    btn_co_modulo: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    MainMenu1: TMainMenu;
    mi_Incluir: TMenuItem;
    mi_Salvar: TMenuItem;
    mi_Cancelar: TMenuItem;
    mi_Excluir: TMenuItem;
    mi_Sair: TMenuItem;
    dbedt_cd_unid_neg: TDBEdit;
    DBEdit15: TDBEdit;
    dbedt_nm_rotina: TDBEdit;
    dbedt_cd_modulo: TDBEdit;
    dbedt_descricao: TDBEdit;
    file_path: TFilenameEdit;
    GroupBox1: TGroupBox;
    btn_co_emp_nac: TSpeedButton;
    btn_co_emp_est: TSpeedButton;
    btn_co_agente: TSpeedButton;
    btn_co_cia: TSpeedButton;
    btn_co_armador: TSpeedButton;
    btn_co_comissaria: TSpeedButton;
    dbedt_nm_emp_nac: TDBEdit;
    dbedt_nm_emp_est: TDBEdit;
    dbedt_nm_agente: TDBEdit;
    dbedt_nm_cia: TDBEdit;
    dbedt_nm_armador: TDBEdit;
    dbedt_nm_comissaria: TDBEdit;
    check_emp_nac: TDBCheckBox;
    dbedt_cd_emp_nac: TDBEdit;
    check_emp_est: TDBCheckBox;
    dbedt_cd_emp_est: TDBEdit;
    check_agente: TDBCheckBox;
    dbedt_cd_agente: TDBEdit;
    check_cia: TDBCheckBox;
    dbedt_cd_cia: TDBEdit;
    check_armador: TDBCheckBox;
    dbedt_cd_armador: TDBEdit;
    check_comissaria: TDBCheckBox;
    dbedt_cd_comissaria: TDBEdit;
    DBCheckBox7: TDBCheckBox;
    dbedt_cd_via_transp: TDBEdit;
    Label7: TLabel;
    dbedt_nm_via_transp: TDBEdit;
    SpeedButton1: TSpeedButton;
    Label8: TLabel;
    SpeedButton2: TSpeedButton;
    dbedt_nm_produto: TDBEdit;
    dbedt_cd_produto: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Panel1: TPanel;
    Label55: TLabel;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    DBCheckBox1: TDBCheckBox;
    dbchkGrupo: TDBCheckBox;
    dbedtCodGrupo: TDBEdit;
    dbedtNomeGrupo: TDBEdit;
    btnConsGrupo: TSpeedButton;
    Label9: TLabel;
    dbedt_cd_tipo_docto: TDBEdit;
    btnConsultaTipoDocto: TSpeedButton;
    edt_nm_tipo_docto: TEdit;
    check_estufagem: TDBCheckBox;
    dbedt_cd_estufagem: TDBEdit;
    dbedt_nm_estufagem: TDBEdit;
    btn_co_estufagem: TSpeedButton;
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_co_moduloClick(Sender: TObject);
    procedure btn_co_emp_nacClick(Sender: TObject);
    procedure dbedt_cd_moduloExit(Sender: TObject);
    procedure btn_co_emp_estClick(Sender: TObject);
    procedure btn_co_agenteClick(Sender: TObject);
    procedure btn_co_ciaClick(Sender: TObject);
    procedure btn_co_armadorClick(Sender: TObject);
    procedure btn_co_comissariaClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbedt_cd_emp_nacExit(Sender: TObject);
    procedure dbedt_cd_emp_estExit(Sender: TObject);
    procedure dbedt_cd_agenteExit(Sender: TObject);
    procedure dbedt_cd_ciaExit(Sender: TObject);
    procedure dbedt_cd_armadorExit(Sender: TObject);
    procedure dbedt_cd_comissariaExit(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbedt_descricaoChange(Sender: TObject);
    procedure file_pathClick(Sender: TObject);
    procedure file_pathEnter(Sender: TObject);
    procedure file_pathExit(Sender: TObject);
    procedure pgctrl_documentoChange(Sender: TObject);
    procedure check_emp_nacClick(Sender: TObject);
    procedure check_emp_estClick(Sender: TObject);
    procedure check_agenteClick(Sender: TObject);
    procedure check_ciaClick(Sender: TObject);
    procedure check_armadorClick(Sender: TObject);
    procedure check_comissariaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbedt_cd_via_transpExit(Sender: TObject);
    procedure dbedt_cd_produtoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure dbedt_cd_moduloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbchkGrupoClick(Sender: TObject);
    procedure dbedtCodGrupoExit(Sender: TObject);
    procedure btnConsGrupoClick(Sender: TObject);
    procedure btnConsultaTipoDoctoClick(Sender: TObject);
    procedure dbedt_cd_tipo_doctoChange(Sender: TObject);
    procedure dbedt_cd_tipo_doctoExit(Sender: TObject);
    procedure check_estufagemClick(Sender: TObject);
    procedure dbedt_cd_estufagemExit(Sender: TObject);
    procedure btn_co_estufagemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    a_str_indices : Array[0..1] Of String[60]; // trabalha c/ edt_chave
    Pesquisa : String;
    st_modificar, st_incluir, st_excluir: Boolean;
    str_path_doc:String[100];
    procedure Cancelar;
    function Consiste : Boolean;
    function Grava    : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    function VerAlt   : Boolean;
  public
    { Public declarations }
    in_modulo:Boolean;
  end;

var
  frm_mod_doc: Tfrm_mod_doc;

implementation

uses  GSMLIB, dModDoc, PGGP001, ConsOnLineEx, PGGP017;
{$R *.DFM}

{ Tfrm_mod_doc }
procedure Tfrm_mod_doc.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_mod_doc.Cancelar;
begin
 if   datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsInsert] then
    datm_mod_doc.qry_modelo_doc_.Cancel;
btn_mi(st_incluir, false, false, st_excluir);
end;

function Tfrm_mod_doc.Consiste: Boolean;
begin
  if pgctrl_documento.ActivePage = ts_lista then
   begin
     if dbedt_cd_unid_neg.text = '' then
      begin
         BoxMensagem('Deve ser inserido o Código da Unidade!', 2);
         Consiste:=false;
         dbedt_cd_unid_neg.SetFocus;
         exit;
       end;
      if dbedt_cd_modulo.text = '' then
       begin
         BoxMensagem('Deve ser inserido o Código do Modulo!', 2);
         Consiste:=false;
         dbedt_cd_modulo.SetFocus;
         exit;
        end;
  end;
  Consiste := True;
end;

function Tfrm_mod_doc.Grava: Boolean;
begin
try
  datm_main.db_broker.StartTransaction;
  if ( datm_mod_doc.qry_modelo_doc_.State in [dsInsert, dsEdit] ) then
    begin
     datm_mod_doc.qry_modelo_doc_NM_PATH.AsString:= file_path.Text;
     datm_mod_doc.qry_modelo_doc_DT_DOCUMENTO.AsDAteTime:= dt_server;
     datm_mod_doc.qry_modelo_doc_.Post;
     end;
   datm_main.db_broker.Commit;
   Grava := True;
   except
   on E: Exception do
     begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_mod_doc.qry_modelo_doc_.Cancel;
      TrataErro(E);
      Grava := False;
     end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

function Tfrm_mod_doc.VerAlt: Boolean;
begin
 VerAlt := True;
  if ( ( datm_mod_doc.qry_modelo_doc_.State in [dsEdit] ) and st_modificar ) or
     ( datm_mod_doc.qry_modelo_doc_.State in [dsInsert] ) then
    begin
    if BoxMensagem('O Cadastro de Modelos de Documentos foi alterado.' + #13#10 +
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
    else Cancelar;
  end;
end;

procedure Tfrm_mod_doc.msk_cd_unid_negExit(Sender: TObject);
begin
  with datm_mod_doc do begin
    if msk_cd_unid_neg.text <> '' then begin
      ValCodEdt( msk_cd_unid_neg );
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG, PATH_RELATORIOS FROM TUNID_NEG (NOLOCK)');
      qry_pesquisa_.Sql.Add('WHERE IN_ATIVO = "1" AND CD_UNID_NEG="'+ msk_cd_unid_neg.text +'"');
      qry_pesquisa_.Sql.Add(' AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG FROM TUSUARIO_HABILITACAO (NOLOCK) WHERE CD_USUARIO ="'+str_cd_usuario+'")');
      qry_pesquisa_.Open;
      if qry_pesquisa_.RecordCount > 0  then begin
        edt_nm_unid_neg.text:=qry_pesquisa_.Fields[0].AsString;
        str_path_doc        :=qry_pesquisa_.Fields[1].AsString;
        qry_modelo_doc_.Close;
        qry_modelo_doc_.ParamByName('CD_UNID_NAG').AsString:= msk_cd_unid_neg.text;
        qry_modelo_doc_.Prepare;
        qry_modelo_doc_.Open;
      end
      else begin
        edt_nm_unid_neg.text:='';
        BoxMensagem('Unidade não Habilitada ou Código Inválido!',2);
        msk_cd_unid_neg.SetFocus;
      end;
    end
    else edt_nm_unid_neg.text:='';
  end;
end;

procedure Tfrm_mod_doc.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_mod_doc, datm_mod_doc);
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_mod_doc.ds_modelo_doc.AutoEdit     := st_modificar;
  in_modulo :=false;

  datm_mod_doc.qry_traz_default_.Close;
  datm_mod_doc.qry_traz_default_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
  datm_mod_doc.qry_traz_default_.Prepare;
  datm_mod_doc.qry_traz_default_.Open;

  msk_cd_unid_neg.text:=datm_mod_doc.qry_traz_default_CD_UNID_NEG.AsString;
  edt_nm_unid_neg.text:=datm_mod_doc.qry_traz_default_NM_UNID_NEG.AsString;
  str_path_doc:= datm_mod_doc.qry_traz_default_PATH_RELATORIOS.AsString;

  btn_mi(st_incluir, false, false, st_excluir);
  pgctrl_documento.Activepage:=ts_lista;
end;

procedure Tfrm_mod_doc.FormShow(Sender: TObject);
begin
  if not in_modulo then
  begin
    datm_mod_doc.qry_modelo_doc_.Close;
    datm_mod_doc.qry_modelo_doc_.ParamByName('CD_UNID_NAG').AsString:=msk_cd_unid_neg.text;
    datm_mod_doc.qry_modelo_doc_.Prepare;
    datm_mod_doc.qry_modelo_doc_.Open;
  end;
end;

procedure Tfrm_mod_doc.btn_co_moduloClick(Sender: TObject);
begin
  with datm_mod_doc do
  begin
    if not(qry_modelo_doc_.State in [dsEdit,dsinsert]) then qry_modelo_doc_.Edit;
    qry_modelo_doc_CD_MODULO.AsString := ConsultaOnLineExSQL('SELECT TC.CD_MODULO, TC.CD_ROTINA, '+
      ' (SELECT TR.NM_ROTINA FROM TMODULO_ROTINA TR (NOLOCK) WHERE TR.CD_MODULO = TC.CD_MODULO AND TR.CD_ROTINA = TC.CD_ROTINA)NM_ROTINA '+
      'FROM TCONTROLE_ACESSO TC (NOLOCK) '+
      'WHERE TC.CD_CARGO = '''+str_cd_cargo+''' AND TC.IN_ACESSO = "1"',
      'Modulos/Rotinas',['CD_MODULO', 'CD_ROTINA', 'NM_ROTINA'],['Modulos','Rotinas', 'Descricao'],'CD_ROTINA',nil);
    dbedt_cd_moduloExit(nil);
    //msk_proposta.Text := datm_abre_proc.qry_processo_NR_PROPOSTA.AsString;
    // msk_propostaExit(Sender);
  end;
end;

procedure Tfrm_mod_doc.btn_co_emp_nacClick(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then datm_mod_doc.qry_modelo_doc_.Edit;
  datm_mod_doc.qry_modelo_doc_CD_EMP_NAC.AsString := ConsultaOnLineExSQL(
    'SELECT CD_EMPRESA, NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK)','Empresa Nacional',['CD_EMPRESA', 'NM_EMPRESA'],['Codigo','Descricao'],'CD_EMPRESA',nil);
  dbedt_cd_emp_nacExit(nil);
end;

procedure Tfrm_mod_doc.dbedt_cd_moduloExit(Sender: TObject);
begin
  with datm_mod_doc do begin
    if not(qry_modelo_doc_.State in [dsEdit,dsInsert]) then exit;
    if dbedt_cd_modulo.text <> '' then begin
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT TC.CD_MODULO, TC.CD_ROTINA,');
      qry_pesquisa_.Sql.Add('  (SELECT TR.NM_ROTINA FROM TMODULO_ROTINA TR (NOLOCK) WHERE TR.CD_MODULO = TC.CD_MODULO AND TR.CD_ROTINA = TC.CD_ROTINA)NM_ROTINA');
      qry_pesquisa_.Sql.Add('FROM TCONTROLE_ACESSO TC (NOLOCK) ');
      qry_pesquisa_.Sql.Add('WHERE TC.CD_CARGO = "'+str_cd_cargo+'" AND TC.IN_ACESSO = "1"');
      qry_pesquisa_.Sql.Add('  AND TC.CD_ROTINA = "'+dbedt_cd_modulo.text+'" ');
      qry_pesquisa_.Open;
      if qry_pesquisa_.RecordCount > 0  then begin
        qry_modelo_doc_NM_ROTINA.AsString:=qry_pesquisa_.Fields[2].AsString;
      end
      else begin
        dbedt_nm_rotina.text:='';
        BoxMensagem('Modulo não Habilitada ou Código Inválido!',2);
        dbedt_cd_modulo.SetFocus;
      end;
    end
    else dbedt_nm_rotina.text:='';
  end;
end;

procedure Tfrm_mod_doc.btn_co_emp_estClick(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then datm_mod_doc.qry_modelo_doc_.Edit;
  datm_mod_doc.qry_modelo_doc_CD_EMP_EST.AsString := ConsultaOnLineExSQL(
    'SELECT CD_EMPRESA, NM_EMPRESA FROM TEMPRESA_EST (NOLOCK)','Empresa Estrangeira',['CD_EMPRESA', 'NM_EMPRESA'],['Codigo','Descricao'],'CD_EMPRESA',nil);
  dbedt_cd_emp_estExit(nil);
end;

procedure Tfrm_mod_doc.btn_co_agenteClick(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then datm_mod_doc.qry_modelo_doc_.Edit;
  datm_mod_doc.qry_modelo_doc_CD_AGENTE.AsString := ConsultaOnLineExSQL(
    'SELECT CD_AGENTE, NM_AGENTE FROM TAGENTE (NOLOCK)','Agentes',['CD_AGENTE', 'NM_AGENTE'],['Codigo','Descricao'],'CD_AGENTE',nil);
  dbedt_cd_agenteExit(nil);
end;

procedure Tfrm_mod_doc.btn_co_ciaClick(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then datm_mod_doc.qry_modelo_doc_.Edit;
  datm_mod_doc.qry_modelo_doc_CD_CIA.AsString := ConsultaOnLineExSQL(
    'SELECT CODIGO, DESCRICAO FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE TP_TRANSPORTADOR  = "0" ',
    'Companhia Aerea', ['CODIGO', 'DESCRICAO'],['Codigo','Descricao'],'CODIGO',nil);
  dbedt_cd_ciaExit(nil);
end;

procedure Tfrm_mod_doc.btn_co_armadorClick(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then datm_mod_doc.qry_modelo_doc_.Edit;
  datm_mod_doc.qry_modelo_doc_CD_ARMADOR.AsString := ConsultaOnLineExSQL(
    'SELECT CODIGO, DESCRICAO FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE TP_TRANSPORTADOR  = "1" ',
    'Armador',['CODIGO', 'DESCRICAO'],['Codigo','Descricao'],'CODIGO',nil);
  dbedt_cd_armadorExit(nil);
end;

procedure Tfrm_mod_doc.btn_co_comissariaClick(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then datm_mod_doc.qry_modelo_doc_.Edit;
  datm_mod_doc.qry_modelo_doc_CD_COMISSARIA.AsString := ConsultaOnLineExSQL(
    'SELECT CD_COMISSARIA, NM_COMISSARIA FROM TCOMISSARIA (NOLOCK)', 'Comissaria',['CD_COMISSARIA', 'NM_DESCRICAO'],['Codigo','Descricao'],'CD_COMISSARIA',nil);
  dbedt_cd_comissariaExit(nil);
end;

procedure Tfrm_mod_doc.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_mod_doc.dbedt_cd_emp_nacExit(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsInsert]) then Exit;
  if dbedt_cd_emp_nac.text <> '' then
  begin
    ValidCodigo(dbedt_cd_emp_nac);
    datm_mod_doc.qry_pesquisa_.Sql.Clear;
    datm_mod_doc.qry_pesquisa_.Sql.Add('SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = "'+dbedt_cd_emp_nac.text+'" ');
    datm_mod_doc.qry_pesquisa_.Open;
    if datm_mod_doc.qry_pesquisa_.RecordCount > 0  then
    begin
      datm_mod_doc.qry_modelo_doc_NM_EMP_NAC.AsString:=datm_mod_doc.qry_pesquisa_.Fields[0].AsString;
    end else begin
      dbedt_nm_emp_nac.text:='';
      BoxMensagem('Código Inválido!',2);
      dbedt_cd_emp_nac.SetFocus;
    end;
  end
  else dbedt_nm_emp_nac.text:='';
end;

procedure Tfrm_mod_doc.dbedt_cd_emp_estExit(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsInsert]) then Exit;
    if dbedt_cd_emp_est.text <> '' then
     begin
       ValidCodigo(dbedt_cd_emp_est);
       datm_mod_doc.qry_pesquisa_.Sql.Clear;
       datm_mod_doc.qry_pesquisa_.Sql.Add('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = "'+dbedt_cd_emp_est.text+'" ');
       datm_mod_doc.qry_pesquisa_.Open;
      if datm_mod_doc.qry_pesquisa_.RecordCount > 0  then
        begin
         datm_mod_doc.qry_modelo_doc_NM_EMP_EST.AsString:=datm_mod_doc.qry_pesquisa_.Fields[0].AsString;
        end
       else
        begin
         dbedt_nm_emp_est.text:='';
         BoxMensagem('Código Inválido!',2);
         dbedt_cd_emp_est.SetFocus;
        end;
     end
    else dbedt_nm_emp_est.text:='';
end;

procedure Tfrm_mod_doc.dbedt_cd_agenteExit(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsInsert]) then Exit;
    if dbedt_cd_agente.text <> '' then
     begin
       ValidCodigo(dbedt_cd_agente);
       datm_mod_doc.qry_pesquisa_.Sql.Clear;
       datm_mod_doc.qry_pesquisa_.Sql.Add('SELECT NM_AGENTE FROM TAGENTE (NOLOCK) WHERE CD_AGENTE = "'+dbedt_cd_agente.text+'" ');
       datm_mod_doc.qry_pesquisa_.Open;
      if datm_mod_doc.qry_pesquisa_.RecordCount > 0  then
        begin
         datm_mod_doc.qry_modelo_doc_NM_AGENTE.AsString:=datm_mod_doc.qry_pesquisa_.Fields[0].AsString;
        end
       else
        begin
         dbedt_nm_agente.text:='';
         BoxMensagem('Código Inválido!',2);
         dbedt_cd_agente.SetFocus;
        end;
     end
    else dbedt_nm_agente.text:='';
end;

procedure Tfrm_mod_doc.dbedt_cd_ciaExit(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsInsert]) then Exit;
    if dbedt_cd_cia.text <> '' then
     begin
       ValidCodigo(dbedt_cd_cia);
       datm_mod_doc.qry_pesquisa_.Sql.Clear;
       datm_mod_doc.qry_pesquisa_.Sql.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE CODIGO = "'+dbedt_cd_cia.text+'" AND TP_TRANSPORTADOR = "0" ');
       datm_mod_doc.qry_pesquisa_.Open;
      if datm_mod_doc.qry_pesquisa_.RecordCount > 0  then
        begin
         datm_mod_doc.qry_modelo_doc_NM_CIA.AsString:=datm_mod_doc.qry_pesquisa_.Fields[0].AsString;
        end
       else
        begin
         dbedt_nm_cia.text:='';
         BoxMensagem('Código Inválido!',2);
         dbedt_cd_cia.SetFocus;
        end;
     end
    else dbedt_nm_cia.text:='';
end;

procedure Tfrm_mod_doc.dbedt_cd_armadorExit(Sender: TObject);
begin
    if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsInsert]) then Exit;
    if dbedt_cd_armador.text <> '' then
     begin
       ValidCodigo(dbedt_cd_armador);
       datm_mod_doc.qry_pesquisa_.Sql.Clear;
       datm_mod_doc.qry_pesquisa_.Sql.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL (NOLOCK) WHERE CODIGO = "'+dbedt_cd_armador.text+'" AND TP_TRANSPORTADOR = "1" ');
       datm_mod_doc.qry_pesquisa_.Open;
      if datm_mod_doc.qry_pesquisa_.RecordCount > 0  then
        begin
         datm_mod_doc.qry_modelo_doc_NM_ARMADOR.AsString:=datm_mod_doc.qry_pesquisa_.Fields[0].AsString;
        end
       else
        begin
         dbedt_nm_armador.text:='';
         BoxMensagem('Código Inválido!',2);
         dbedt_cd_armador.SetFocus;
        end;
     end
    else dbedt_nm_armador.text:='';
end;

procedure Tfrm_mod_doc.dbedt_cd_comissariaExit(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsInsert]) then Exit;
    if dbedt_cd_comissaria.text <> '' then
     begin
       ValidCodigo(dbedt_cd_comissaria);
       datm_mod_doc.qry_pesquisa_.Sql.Clear;
       datm_mod_doc.qry_pesquisa_.Sql.Add('SELECT NM_COMISSARIA FROM TCOMISSARIA (NOLOCK) WHERE CD_COMISSARIA = "'+dbedt_cd_comissaria.text+'" ');
       datm_mod_doc.qry_pesquisa_.Open;
      if datm_mod_doc.qry_pesquisa_.RecordCount > 0  then
        begin
         datm_mod_doc.qry_modelo_doc_NM_COMISSARIA.AsString:=datm_mod_doc.qry_pesquisa_.Fields[0].AsString;
        end
       else
        begin
         dbedt_nm_comissaria.text:='';
         BoxMensagem('Código Inválido!',2);
         dbedt_cd_comissaria.SetFocus;
        end;
     end
    else dbedt_nm_comissaria.text:='';
end;

procedure Tfrm_mod_doc.btn_incluirClick(Sender: TObject);
begin
  with datm_mod_doc do begin
    qry_modelo_doc_.DisableControls;
    qry_modelo_doc_.Cancel;
    qry_modelo_doc_.Insert;
    qry_modelo_doc_.EnableControls;
    qry_modelo_doc_CD_UNID_NEG.AsString   := msk_cd_unid_neg.text;
    qry_modelo_doc_NM_UNID_NEG.AsString   := edt_nm_unid_neg.text;
    qry_modelo_doc_IN_DAFAULT.AsString    := '1';
    qry_modelo_doc_IN_EMP_NAC.AsString    := '0';
    qry_modelo_doc_IN_EMP_EST.AsString    := '0';
    qry_modelo_doc_IN_AGENTE.AsString     := '0';
    qry_modelo_doc_IN_CIA.AsString        := '0';
    qry_modelo_doc_IN_ARMADOR.AsString    := '0';
    qry_modelo_doc_IN_COMISSARIA.AsString := '0';
    qry_modelo_doc_IN_PROCESSO.AsString   := '1';
    qry_modelo_doc_IN_GRUPO.AsString      := '0';
  end;
  pgctrl_documento.ActivePage  := ts_dados;
  dbedt_cd_modulo.SetFocus;
  file_path.DialogFiles.Text   := '';
  dbedt_cd_emp_nac.Color       := clMenu;
  dbedt_cd_emp_est.Color       := clMenu;
  dbedt_cd_agente.Color        := clMenu;
  dbedt_cd_cia.Color           := clMenu;
  dbedt_cd_armador.Color       := clMenu;
  dbedt_cd_comissaria.Color    := clMenu;
  dbedtCodGrupo.Color          := clMenu;
  dbedt_cd_emp_nac.ReadOnly    := True;
  dbedt_cd_emp_est.ReadOnly    := True;
  dbedt_cd_agente.ReadOnly     := True;
  dbedt_cd_cia.ReadOnly        := True;
  dbedt_cd_armador.ReadOnly    := True;
  dbedt_cd_comissaria.ReadOnly := True;
  dbedtCodGrupo.ReadOnly       := True;
  btn_co_emp_nac.Enabled       := false;
  btn_co_emp_est.Enabled       := false;
  btn_co_agente.Enabled        := false;
  btn_co_cia.Enabled           := false;
  btn_co_armador.Enabled       := false;
  btn_co_comissaria.Enabled    := false;
  btnConsGrupo.Enabled         := false;
  btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_mod_doc.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_mod_doc.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_mod_doc.btn_excluirClick(Sender: TObject);
begin
  if datm_mod_doc.qry_modelo_doc_.IsEmpty then
  begin
     BoxMensagem( 'Não existe Documento para ser excluído!', 2 );
     exit;
  end;
  if BoxMensagem( 'Este Documento será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
       datm_main.db_broker.StartTransaction;
       datm_mod_doc.qry_modelo_doc_.Delete;
       datm_main.db_broker.Commit;
    except
     on E: Exception do
       begin
       if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
       datm_mod_doc.qry_modelo_doc_.Cancel;
       TrataErro(E);
       end;
    end;
  pgctrl_documento.ActivePage := ts_lista;
end;

procedure Tfrm_mod_doc.dbedt_descricaoChange(Sender: TObject);
begin
 if datm_mod_doc.qry_modelo_doc_.State in [dsedit,dsInsert]then
   btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_mod_doc.file_pathClick(Sender: TObject);
begin
 file_path.HistoryList.Text:=str_path_doc;
end;

procedure Tfrm_mod_doc.file_pathEnter(Sender: TObject);
begin
 //path:= file_path.text;
end;

procedure Tfrm_mod_doc.file_pathExit(Sender: TObject);
begin
 // if path = file_path.text then exit;
end;

procedure Tfrm_mod_doc.pgctrl_documentoChange(Sender: TObject);
begin
  file_path.FileName:=datm_mod_doc.qry_modelo_doc_NM_PATH.AsString;
  if check_armador.Checked then begin
    dbedt_cd_armador.Color:=clWindow;
    dbedt_cd_armador.Readonly:=false;
    btn_co_armador.Enabled:=true;
  end
  else begin
    dbedt_cd_armador.Color:=clMenu;
    dbedt_cd_armador.Readonly:=true;
    btn_co_armador.Enabled:=false;
  end;
  if check_cia.Checked then begin
    dbedt_cd_cia.Color:=clWindow;
    dbedt_cd_cia.Readonly:=false;
    btn_co_cia.Enabled:=true;
  end
  else begin
    dbedt_cd_cia.Color:=clMenu;
    dbedt_cd_cia.Readonly:=true;
    btn_co_cia.Enabled:=false;
  end;
  if check_emp_nac.Checked then begin
    dbedt_cd_emp_nac.Color:=clWindow;
    dbedt_cd_emp_nac.Readonly:=false;
    btn_co_emp_nac.Enabled:=true;
  end
  else begin
    dbedt_cd_emp_nac.Color:=clMenu;
    dbedt_cd_emp_nac.Readonly:=true;
    btn_co_emp_nac.Enabled:=false;
  end;
  if check_emp_est.Checked then begin
    dbedt_cd_emp_est.Color:=clWindow;
    dbedt_cd_emp_est.Readonly:=false;
    btn_co_emp_est.Enabled:=true;
  end
  else begin
    dbedt_cd_emp_est.Color:=clMenu;
    dbedt_cd_emp_est.Readonly:=true;
    btn_co_emp_est.Enabled:=false;
  end;
  if check_agente.Checked then begin
    dbedt_cd_agente.Color:=clWindow;
    dbedt_cd_agente.Readonly:=false;
    btn_co_agente.Enabled:=true;
  end
  else begin
    dbedt_cd_agente.Color:=clMenu;
    dbedt_cd_agente.Readonly:=true;
    btn_co_agente.Enabled:=false;
  end;
  if check_comissaria.Checked then begin
    dbedt_cd_comissaria.Color:=clWindow;
    dbedt_cd_comissaria.Readonly:=false;
    btn_co_comissaria.Enabled:=true;
  end
  else begin
    dbedt_cd_comissaria.Color:=clMenu;
    dbedt_cd_comissaria.Readonly:=true;
    btn_co_comissaria.Enabled:=false;
  end;
  if dbchkGrupo.Checked then begin
    dbedtCodGrupo.Color    :=clWindow;
    dbedtCodGrupo.Readonly :=false;
    btnConsGrupo.Enabled   :=true;
  end
  else begin
    dbedtCodGrupo.Color    :=clMenu;
    dbedtCodGrupo.Readonly :=true;
    btnConsGrupo.Enabled   :=false;
  end;

  if check_estufagem.Checked then begin
    dbedt_cd_estufagem.Color    :=clWindow;
    dbedt_cd_estufagem.Readonly :=false;
    btn_co_estufagem.Enabled    :=true;
  end
  else begin
    dbedt_cd_estufagem.Color    :=clMenu;
    dbedt_cd_estufagem.Readonly :=true;
    btn_co_estufagem.Enabled    :=false;
  end;

end;

procedure Tfrm_mod_doc.check_emp_nacClick(Sender: TObject);
begin
if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then exit;
if check_emp_nac.Checked then
  begin
  dbedt_cd_emp_nac.Color:=clWindow;
  dbedt_cd_emp_nac.Readonly:=false;
  btn_co_emp_nac.Enabled:=true;
  end
else
  begin
  dbedt_cd_emp_nac.Color:=clMenu;
  dbedt_cd_emp_nac.Readonly:=true;
  btn_co_emp_nac.Enabled:=false;
  end;
btn_mi(false,st_modificar,st_modificar, false);
end;

procedure Tfrm_mod_doc.check_emp_estClick(Sender: TObject);
begin
if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then exit;
if check_emp_est.Checked then
  begin
  dbedt_cd_emp_est.Color:=clWindow;
  dbedt_cd_emp_est.Readonly:=false;
  btn_co_emp_est.Enabled:=true;
  end
else
  begin
  dbedt_cd_emp_est.Color:=clMenu;
  dbedt_cd_emp_est.Readonly:=true;
  btn_co_emp_est.Enabled:=false;
  end;
btn_mi(false,st_modificar,st_modificar, false);
end;

procedure Tfrm_mod_doc.check_agenteClick(Sender: TObject);
begin
if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then exit;
if check_agente.Checked then
  begin
  dbedt_cd_agente.Color:=clWindow;
  dbedt_cd_agente.Readonly:=false;
  btn_co_agente.Enabled:=true;
  end
else
  begin
  dbedt_cd_agente.Color:=clMenu;
  dbedt_cd_agente.Readonly:=true;
  btn_co_agente.Enabled:=false;
  end;
btn_mi(false,st_modificar,st_modificar, false);
end;

procedure Tfrm_mod_doc.check_ciaClick(Sender: TObject);
begin
if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then exit;
if check_cia.Checked then
  begin
  dbedt_cd_cia.Color:=clWindow;
  dbedt_cd_cia.Readonly:=false;
  btn_co_cia.Enabled:=true;
  end
else
  begin
  dbedt_cd_cia.Color:=clMenu;
  dbedt_cd_cia.Readonly:=true;
  btn_co_cia.Enabled:=false;
  end;
btn_mi(false,st_modificar,st_modificar, false);
end;

procedure Tfrm_mod_doc.check_armadorClick(Sender: TObject);
begin
if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then exit;
if check_armador.Checked then
  begin
  dbedt_cd_armador.Color:=clWindow;
  dbedt_cd_armador.Readonly:=false;
  btn_co_armador.Enabled:=true;
  end
else
  begin
  dbedt_cd_armador.Color:=clMenu;
  dbedt_cd_armador.Readonly:=true;
  btn_co_armador.Enabled:=false;
  end;
btn_mi(false,st_modificar,st_modificar, false);
end;

procedure Tfrm_mod_doc.check_comissariaClick(Sender: TObject);
begin
if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then exit;
if check_comissaria.Checked then
  begin
  dbedt_cd_comissaria.Color:=clWindow;
  dbedt_cd_comissaria.Readonly:=false;
  btn_co_comissaria.Enabled:=true;
  end
else
  begin
  dbedt_cd_comissaria.Color:=clMenu;
  dbedt_cd_comissaria.Readonly:=true;
  btn_co_comissaria.Enabled:=false;
  end;
btn_mi(false,st_modificar,st_modificar, false);
end;

procedure Tfrm_mod_doc.SpeedButton1Click(Sender: TObject);
begin
if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then
  datm_mod_doc.qry_modelo_doc_.Edit;
  datm_mod_doc.qry_modelo_doc_CD_VIA_TRANSP.AsString := ConsultaOnLineExSQL(
    'SELECT CD_VIA_TRANSP, NM_VIA_TRANSP FROM TVIA_TRANSP_BROKER (NOLOCK)',
   'Via de Transporte',['CD_VIA_TRANSP', 'NM_VIA_TRANSP'],['Código','Descrição'],'CD_VIA_TRANSP',nil);
  dbedt_cd_via_transpExit(nil);
  //msk_proposta.Text := datm_abre_proc.qry_processo_NR_PROPOSTA.AsString;
 // msk_propostaExit(Sender);
end;

procedure Tfrm_mod_doc.dbedt_cd_via_transpExit(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsInsert]) then exit;
    if dbedt_cd_via_transp.text <> '' then
     begin
       ValidCodigo(dbedt_cd_via_transp);
       datm_mod_doc.qry_pesquisa_.Sql.Clear;
       datm_mod_doc.qry_pesquisa_.Sql.Add('SELECT NM_VIA_TRANSP FROM TVIA_TRANSP_BROKER (NOLOCK) WHERE CD_VIA_TRANSP = "'+dbedt_cd_via_transp.TEXT+'" ');
       datm_mod_doc.qry_pesquisa_.Open;
      if datm_mod_doc.qry_pesquisa_.RecordCount > 0  then
        begin
         datm_mod_doc.qry_modelo_doc_NM_VIA_TRANSP.AsString:=datm_mod_doc.qry_pesquisa_.Fields[0].AsString;
        end
       else
        begin
         dbedt_nm_via_transp.text:='';
         BoxMensagem('Via de Transporte Inválido!',2);
         dbedt_cd_via_transp.SetFocus;
        end;
     end
    else dbedt_nm_via_transp.text:='';
end;

procedure Tfrm_mod_doc.dbedt_cd_produtoExit(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsInsert]) then exit;
    if dbedt_cd_produto.text <> '' then
     begin
       datm_mod_doc.qry_pesquisa_.Sql.Clear;
       datm_mod_doc.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO = "'+dbedt_cd_produto.text+'" ');
       datm_mod_doc.qry_pesquisa_.Open;
      if datm_mod_doc.qry_pesquisa_.RecordCount > 0  then
        begin
         datm_mod_doc.qry_modelo_doc_NM_PRODUTO.AsString:=datm_mod_doc.qry_pesquisa_.Fields[0].AsString;
        end
       else
        begin
         dbedt_nm_produto.text:='';
         BoxMensagem('Produto Inválido!',2);
         dbedt_cd_produto.SetFocus;
        end;
     end
    else dbedt_nm_produto.text:='';
end;

procedure Tfrm_mod_doc.SpeedButton2Click(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then datm_mod_doc.qry_modelo_doc_.Edit;
  datm_mod_doc.qry_modelo_doc_CD_PRODUTO.AsString := ConsultaOnLineExSQL(
    'SELECT CD_PRODUTO, NM_PRODUTO FROM TPRODUTO (NOLOCK)','Produtos',['CD_PRODUTO', 'NM_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',nil);
  dbedt_cd_produtoExit(nil);
end;

procedure Tfrm_mod_doc.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  else edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'NM_UNID_NEG');
  msk_cd_unid_negExit(Sender);
end;

procedure Tfrm_mod_doc.dbedt_cd_moduloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_modulo      then btn_co_moduloClick(btn_co_modulo);
    if Sender = dbedt_cd_via_transp  then SpeedButton1Click(SpeedButton1);
    if Sender = dbedt_cd_produto     then SpeedButton2Click(SpeedButton2);
    if Sender = dbedt_cd_emp_nac     then btn_co_emp_nacClick(btn_co_emp_nac);
    if Sender = dbedt_cd_emp_est     then btn_co_emp_estClick(btn_co_emp_est);
    if Sender = dbedt_cd_agente      then btn_co_agenteClick(btn_co_agente);
    if Sender = dbedt_cd_cia         then btn_co_ciaClick(btn_co_cia);
    if Sender = dbedt_cd_armador     then btn_co_armadorClick(btn_co_armador);
    if Sender = dbedt_cd_comissaria  then btn_co_comissariaClick(btn_co_comissaria);
    if Sender = dbedtCodGrupo        then btnConsGrupoClick(btnConsGrupo);
    if Sender = dbedt_cd_tipo_docto  then btnConsultaTipoDoctoClick(btnConsultaTipoDocto);
  end;
end;

procedure Tfrm_mod_doc.dbchkGrupoClick(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then exit;
  if dbchkGrupo.Checked then begin
    dbedtCodGrupo.Color    :=clWindow;
    dbedtCodGrupo.Readonly :=false;
    btnConsGrupo.Enabled   :=true;
  end
  else begin
    dbedtCodGrupo.Color    :=clMenu;
    dbedtCodGrupo.Readonly :=true;
    btnConsGrupo.Enabled   :=false;
  end;
  btn_mi(false,st_modificar,st_modificar, false);
end;

procedure Tfrm_mod_doc.dbedtCodGrupoExit(Sender: TObject);
begin
  with datm_mod_doc do begin
    if not(qry_modelo_doc_.State in [dsEdit,dsInsert]) then Exit;
    if dbedtCodGrupo.text <> '' then begin
      ValidCodigo(dbedtCodGrupo);
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_GRUPO FROM TGRUPO (NOLOCK) WHERE CD_GRUPO = "'+dbedtCodGrupo.Text+'" ');
      qry_pesquisa_.Open;
      if qry_pesquisa_.RecordCount > 0  then begin
        qry_modelo_doc_NM_GRUPO.AsString:=qry_pesquisa_.Fields[0].AsString;
      end
      else begin
        dbedtNomeGrupo.text:='';
        BoxMensagem('Código Inválido!',2);
        dbedtCodGrupo.SetFocus;
      end;
    end
    else dbedtNomeGrupo.text:='';
  end;
end;

procedure Tfrm_mod_doc.btnConsGrupoClick(Sender: TObject);
begin
  with datm_mod_doc do begin
    if not(qry_modelo_doc_.State in [dsEdit,dsinsert]) then qry_modelo_doc_.Edit;
    qry_modelo_doc_CD_GRUPO.AsString := ConsultaOnLineExSQL(
      'SELECT CD_GRUPO, NM_GRUPO FROM TGRUPO (NOLOCK)','Grupo de Empresas',['CD_GRUPO', 'NM_GRUPO'],['Codigo','Descricao'],'CD_GRUPO',nil);
  end;
  dbedtCodGrupoExit(nil);
end;

procedure Tfrm_mod_doc.btnConsultaTipoDoctoClick(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then
    datm_mod_doc.qry_modelo_doc_.Edit;
  datm_mod_doc.qry_modelo_doc_CD_VIA_TRANSP.AsString := ConsultaOnLineExSQL(
     ' SELECT CD_TIPO_DOCTO, NM_TIPO_DOCTO ' +
     ' FROM TTP_DOCTO_DIGITALIZADO         ' +
     ' WHERE CD_PRODUTO IN (''AM'', ''' + str_cd_produto + ''')',
     'Tipo de documento digitalizado',['CD_TIPO_DOCTO', 'NM_TIPO_DOCTO'], ['Código','Descrição'], 'CD_TIPO_DOCTO', nil);
  dbedt_cd_via_transpExit(nil);
  //msk_proposta.Text := datm_abre_proc.qry_processo_NR_PROPOSTA.AsString;
 // msk_propostaExit(Sender);
end;

procedure Tfrm_mod_doc.dbedt_cd_tipo_doctoChange(Sender: TObject);
begin
  if datm_mod_doc.qry_modelo_doc_.State in [dsedit,dsInsert] then
    btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_mod_doc.dbedt_cd_tipo_doctoExit(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsInsert]) then exit;
    if dbedt_cd_tipo_docto.text <> '' then
     begin
       ValidCodigo(dbedt_cd_tipo_docto);
       datm_mod_doc.qry_pesquisa_.Sql.Clear;
       datm_mod_doc.qry_pesquisa_.Sql.Add('SELECT NM_TIPO_DOCTO FROM TTP_DOCTO_DIGITALIZADO WHERE CD_TIPO_DOCTO = "' + dbedt_cd_tipo_docto.TEXT + '" ');
       datm_mod_doc.qry_pesquisa_.Open;
      if datm_mod_doc.qry_pesquisa_.RecordCount > 0  then
        begin
         edt_nm_tipo_docto.Text := datm_mod_doc.qry_pesquisa_.Fields[0].AsString;
        end
       else
        begin
         edt_nm_tipo_docto.text := '';
         BoxMensagem('Tipo de documento Inválido!',2);
         dbedt_cd_tipo_docto.SetFocus;
        end;
     end
    else edt_nm_tipo_docto.text:='';
end;

procedure Tfrm_mod_doc.check_estufagemClick(Sender: TObject);
begin
  //by Carlos - 28/12/2009
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then exit;

  if check_estufagem.Checked then  begin
     dbedt_cd_estufagem.Color:=clWindow;
     dbedt_cd_estufagem.Readonly:=false;
     btn_co_estufagem.Enabled:=true;
  end else begin
     dbedt_cd_estufagem.Color:=clMenu;
     dbedt_cd_estufagem.Readonly:=true;
     btn_co_estufagem.Enabled:=false;
  end;
  btn_mi(false,st_modificar,st_modificar, false);

end;

procedure Tfrm_mod_doc.dbedt_cd_estufagemExit(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsInsert]) then Exit;
    if dbedt_cd_estufagem.text <> '' then
     begin
       ValidCodigo(dbedt_cd_estufagem);
       datm_mod_doc.qry_pesquisa_.Sql.Clear;
       datm_mod_doc.qry_pesquisa_.Sql.Add('SELECT NM_ESTUFAGEM FROM VW_TIPO_ESTUFAGEM (NOLOCK) WHERE TP_ESTUFAGEM = "'+dbedt_cd_estufagem.text+'" ');
       datm_mod_doc.qry_pesquisa_.Open;
      if datm_mod_doc.qry_pesquisa_.RecordCount > 0  then
        begin
         datm_mod_doc.qry_modelo_doc_NM_ESTUFAGEM.AsString:=datm_mod_doc.qry_pesquisa_.Fields[0].AsString;
        end
       else
        begin
         dbedt_nm_estufagem.text:='';
         BoxMensagem('Código Inválido!',2);
         dbedt_cd_estufagem.SetFocus;
        end;
     end
    else dbedt_nm_estufagem.text:='';

end;

procedure Tfrm_mod_doc.btn_co_estufagemClick(Sender: TObject);
begin
  if not(datm_mod_doc.qry_modelo_doc_.State in [dsEdit,dsinsert]) then datm_mod_doc.qry_modelo_doc_.Edit;
  datm_mod_doc.qry_modelo_doc_CD_ESTUFAGEM.AsString := ConsultaOnLineExSQL(
    'SELECT TP_ESTUFAGEM, NM_ESTUFAGEM FROM VW_TIPO_ESTUFAGEM (NOLOCK)', 'Estufagem',['TP_ESTUFAGEM', 'NM_ESTUFAGEM'],['Codigo','Descricao'],'TP_ESTUFAGEM',nil);
  dbedt_cd_estufagemExit(nil);

end;

procedure Tfrm_mod_doc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_mod_doc.Free;
end;

end.

unit PGSM053;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_cargo = class(TDataModule)
    ds_controle_acesso: TDataSource;
    ds_cargo_modulo: TDataSource;
    qry_cargo_modulo_: TQuery;
    qry_controle_acesso_: TQuery;
    ds_cargo: TDataSource;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    qry_ult_cargo_: TQuery;
    qry_ult_cargo_ULTIMO: TStringField;
    sp_atz_cargo_desc: TStoredProc;
    qry_cargo_: TQuery;
    qry_cargo_lista_: TQuery;
    ds_cargo_lista: TDataSource;
    qry_cargo_CD_CARGO: TStringField;
    qry_cargo_NM_CARGO: TStringField;
    qry_cargo_CD_NIVEL: TIntegerField;
    qry_cargo_CD_CARGO_PAI: TStringField;
    qry_cargo_IN_ATIVO: TStringField;
    qry_cargo_lista_CD_CARGO: TStringField;
    qry_cargo_lista_NM_CARGO: TStringField;
    qry_cargo_lista_CD_NIVEL: TIntegerField;
    qry_cargo_lista_CD_CARGO_PAI: TStringField;
    qry_cargo_lista_IN_ATIVO: TStringField;
    qry_vw_cargo_: TQuery;
    ds_vw_cargo: TDataSource;
    qry_cargo_lista_LK_NM_CARGO_PAI: TStringField;
    qry_cargo_LK_NM_CARGO_PAI: TStringField;
    qry_cargo_lista_LK_ATIVO: TStringField;
    qry_cargo_LK_ATIVO: TStringField;
    qry_cargo_modulo_CD_CARGO: TStringField;
    qry_cargo_modulo_CD_MODULO: TStringField;
    qry_cargo_modulo_IN_ATIVO: TBooleanField;
    qry_controle_acesso_CD_CARGO: TStringField;
    qry_controle_acesso_CD_MODULO: TStringField;
    qry_controle_acesso_CD_ROTINA: TStringField;
    qry_controle_acesso_IN_ACESSO: TBooleanField;
    qry_controle_acesso_IN_INCLUIR: TBooleanField;
    qry_controle_acesso_IN_MODIFICAR: TBooleanField;
    qry_controle_acesso_IN_EXCLUIR: TBooleanField;
    qry_modulo_: TQuery;
    qry_rotina_: TQuery;
    ds_modulo: TDataSource;
    ds_rotina: TDataSource;
    qry_controle_acesso_LK_MN_ROTINA: TStringField;
    sp_atz_controle_acesso: TStoredProc;
    qry_cargo_modulo_p_: TQuery;
    qry_controle_acesso_p_: TQuery;
    qry_cargo_modulo_p_CD_CARGO: TStringField;
    qry_cargo_modulo_p_CD_MODULO: TStringField;
    qry_cargo_modulo_p_IN_ATIVO: TBooleanField;
    qry_controle_acesso_p_CD_CARGO: TStringField;
    qry_controle_acesso_p_CD_MODULO: TStringField;
    qry_controle_acesso_p_CD_ROTINA: TStringField;
    qry_controle_acesso_p_IN_ACESSO: TBooleanField;
    qry_controle_acesso_p_IN_INCLUIR: TBooleanField;
    qry_controle_acesso_p_IN_MODIFICAR: TBooleanField;
    qry_controle_acesso_p_IN_EXCLUIR: TBooleanField;
    qry_cargo_lista_IN_SELECIONADO: TStringField;
    qry_cargo_IN_SELECIONADO: TStringField;
    qry_cargo_lista_calcSELECIONADO: TStringField;
    qry_cargo_IN_MANAGER: TStringField;
    qry_tabelas_: TQuery;
    qry_acesso_documento_: TQuery;
    ds_tabelas: TDataSource;
    ds_acesso_documento: TDataSource;
    sp_atz_controle_acesso_digitalizacao: TStoredProc;
    qry_acesso_documento_CD_TIPO_DOCTO: TIntegerField;
    qry_acesso_documento_IN_VISUALIZACAO: TStringField;
    qry_acesso_documento_IN_ALTERACAO: TStringField;
    qry_tipos_documento_: TQuery;
    ds_tipos_documento: TDataSource;
    qry_acesso_documento_LK_NM_TIPO_DOCTO: TStringField;
    qry_acesso_documento_ID_TABELA: TIntegerField;
    qry_tabelas_ID_TABELA: TIntegerField;
    qry_tabelas_ID_CAMPO: TIntegerField;
    qry_tabelas_NM_EXIBICAO: TStringField;
    qry_tabelas_ID_CAMPO_PROCESSO: TIntegerField;
    qry_tabelas_NM_SQL_LOOKUP: TStringField;
    qry_tipos_documento_CD_TIPO_DOCTO: TIntegerField;
    qry_tipos_documento_NM_TIPO_DOCTO: TStringField;
    qry_tipos_documento_CD_PRODUTO: TStringField;
    qry_tipos_documento_IN_MULTIPLOS_ARQ: TIntegerField;
    qry_tipos_documento_NM_PREFIXO_ARQ: TStringField;
    qry_tipos_documento_IN_ENVIA_WEB: TStringField;
    qry_tipos_documento_ID_TABELA: TIntegerField;
    sp_copia_acesso_digitalizacao: TStoredProc;
    qry_rotina_CD_MODULO: TStringField;
    qry_rotina_CD_ROTINA: TStringField;
    qry_rotina_NM_ROTINA: TStringField;
    qry_rotina_NM_MENU: TStringField;
    qry_rotina_NM_FORM: TStringField;
    qry_sistema_novo: TQuery;
    ds_sistema_novo: TDataSource;
    qry_sistema_novoCD_SISTEMA: TIntegerField;
    qry_sistema_novoNM_SISTEMA: TStringField;
    qry_sistema_novoNM_APLICATIVO: TStringField;
    qry_sistema_novoNM_PROCESSO: TStringField;
    qry_controle_acesso_sistema: TQuery;
    ds_controle_acesso_sistema: TDataSource;
    qry_modulo_novo: TQuery;
    ds_modulo_novo: TDataSource;
    qry_controle_acesso_modulo: TQuery;
    ds_controle_acesso_modulo: TDataSource;
    qry_modulo_novoCD_SISTEMA: TIntegerField;
    qry_modulo_novoCD_MODULO: TIntegerField;
    qry_modulo_novoNM_MODULO: TStringField;
    qry_controle_acesso_sistemaLK_NM_SISTEMA: TStringField;
    qry_controle_acesso_sistemaCD_SISTEMA: TIntegerField;
    qry_controle_acesso_sistemaCD_CARGO: TIntegerField;
    qry_controle_acesso_moduloCD_MODULO: TIntegerField;
    qry_controle_acesso_moduloCD_CARGO: TIntegerField;
    qry_controle_acesso_moduloCD_SISTEMA: TIntegerField;
    qry_controle_acesso_moduloLK_NM_MODULO: TStringField;
    ds_controle_acesso_rotina: TDataSource;
    qry_rotina_novo: TQuery;
    ds_rotina_novo: TDataSource;
    qry_rotina_novoCD_SISTEMA: TIntegerField;
    qry_rotina_novoCD_MODULO: TIntegerField;
    qry_rotina_novoCD_ROTINA: TIntegerField;
    qry_rotina_novoNM_ROTINA: TStringField;
    qry_controle_acesso_rotina: TQuery;
    qry_controle_acesso_rotinaCD_SISTEMA: TIntegerField;
    qry_controle_acesso_rotinaCD_MODULO: TIntegerField;
    qry_controle_acesso_rotinaCD_ROTINA: TIntegerField;
    qry_controle_acesso_rotinaCD_CARGO: TIntegerField;
    qry_controle_acesso_rotinaIN_VISIVEL: TBooleanField;
    qry_controle_acesso_rotinaLK_NM_ROTINA: TStringField;
    sp_copia_controle_acesso_novo: TStoredProc;
    qry_controle_acesso_rotinaIN_ATIVO: TBooleanField;
    up_controle_acesso: TUpdateSQL;
    qry_cargo_IN_INTERNO: TStringField;
    qry_cargo_IN_DASHBOARD_WEB: TStringField;
    qry_cargo_DOC_PREFERENCIAL: TIntegerField;
    qry_cargo_CD_SETOR: TIntegerField;
    qry_cargo_IN_LIBERA_TRANSMISSAO_DI: TStringField;
    procedure qry_cargo_lista_CalcFields(DataSet: TDataSet);
    procedure qry_acesso_documento_BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cargo: Tdatm_cargo;

implementation

{$R *.DFM}


procedure Tdatm_cargo.qry_cargo_lista_CalcFields(DataSet: TDataSet);
begin
  qry_cargo_lista_.FieldByName('calcSELECIONADO').AsString := '';
  if ( qry_cargo_lista_.FieldByName('IN_SELECIONADO').AsString = '1' ) then
    qry_cargo_lista_.FieldByName('calcSELECIONADO').AsString := 'ü';
end;

procedure Tdatm_cargo.qry_acesso_documento_BeforeOpen(DataSet: TDataSet);
begin
  qry_acesso_documento_.ParamByName('CD_CARGO').AsString := qry_cargo_CD_CARGO.AsString;
end;

end.

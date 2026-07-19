(*************************************************************************************************

//Sistema: DD Broker - Indaiá Logística

//PROGRAMA: PGPE048.PAS - DataModule do filtro para relatórios por Unidade, Cliente/Grupo, Analista e Serviço

//AUTOR: Leandro Stipanich

//DATA: 13/09/2001

//MANUTENÇÃO: Leandro Stipanich

//DATA: 13/09/2001

*************************************************************************************************)
unit Pgpe048;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_sel_unid_cli_serv_anal = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_grupo_DT_INCLUSAO: TDateTimeField;
    qry_grupo_IN_ATIVO: TStringField;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_servico_CD_CLASSIFICACAO: TStringField;
    qry_servico_CD_VIA_TRANSPORTE: TStringField;
    qry_servico_IN_ATIVO: TStringField;
    qry_cliente_servico_: TQuery;
    qry_cliente_servico_CD_CLIENTE: TStringField;
    qry_cliente_servico_CD_UNID_NEG: TStringField;
    qry_cliente_servico_CD_PRODUTO: TStringField;
    qry_cliente_servico_CD_SERVICO: TStringField;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    sp_rel_and_processo_exp: TStoredProc;
    qry_apaga_dados: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    sp_rel_cont_averb: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_unid_cli_serv_anal: Tdatm_sel_unid_cli_serv_anal;

implementation

{$R *.DFM}








end.

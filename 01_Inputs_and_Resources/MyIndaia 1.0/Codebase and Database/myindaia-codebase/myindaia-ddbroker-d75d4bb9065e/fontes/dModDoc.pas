unit dModDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_mod_doc = class(TDataModule)
    qry_modelo_doc_: TQuery;
    ds_modelo_doc: TDataSource;
    qry_modelo_doc_CD_UNID_NEG: TStringField;
    qry_modelo_doc_CD_MODULO: TStringField;
    qry_modelo_doc_CODIGO: TStringField;
    qry_modelo_doc_DESCRIAO: TStringField;
    qry_modelo_doc_NM_PATH: TStringField;
    qry_modelo_doc_DT_DOCUMENTO: TDateTimeField;
    qry_modelo_doc_IN_DAFAULT: TStringField;
    qry_modelo_doc_IN_EMP_NAC: TStringField;
    qry_modelo_doc_IN_EMP_EST: TStringField;
    qry_modelo_doc_IN_AGENTE: TStringField;
    qry_modelo_doc_IN_CIA: TStringField;
    qry_modelo_doc_IN_ARMADOR: TStringField;
    qry_modelo_doc_IN_COMISSARIA: TStringField;
    qry_modelo_doc_CD_EMP_NAC: TStringField;
    qry_modelo_doc_CD_EMP_EST: TStringField;
    qry_modelo_doc_CD_AGENTE: TStringField;
    qry_modelo_doc_CD_CIA: TStringField;
    qry_modelo_doc_CD_ARMADOR: TStringField;
    qry_modelo_doc_CD_COMISSARIA: TStringField;
    qry_modelo_doc_NM_EMP_NAC: TStringField;
    qry_modelo_doc_NM_EMP_EST: TStringField;
    qry_modelo_doc_NM_AGENTE: TStringField;
    qry_modelo_doc_NM_CIA: TStringField;
    qry_modelo_doc_NM_ARMADOR: TStringField;
    qry_modelo_doc_NM_COMISSARIA: TStringField;
    qry_traz_default_: TQuery;
    qry_pesquisa_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_NM_UNID_NEG: TStringField;
    qry_modelo_doc_NM_UNID_NEG: TStringField;
    qry_modelo_doc_NM_ROTINA: TStringField;
    UpDate_mod_doc: TUpdateSQL;
    qry_traz_default_PATH_RELATORIOS: TStringField;
    qry_modelo_doc_CD_VIA_TRANSP: TStringField;
    qry_modelo_doc_NM_VIA_TRANSP: TStringField;
    qry_modelo_doc_CD_PRODUTO: TStringField;
    qry_modelo_doc_NM_PRODUTO: TStringField;
    qry_modelo_doc_IN_PROCESSO: TStringField;
    qry_modelo_doc_CD_GRUPO: TStringField;
    qry_modelo_doc_NM_GRUPO: TStringField;
    qry_modelo_doc_IN_GRUPO: TStringField;
    qry_modelo_doc_CD_TIPO_DOCTO: TIntegerField;
    qry_modelo_doc_IN_ESTUFAGEM: TStringField;
    qry_modelo_doc_CD_ESTUFAGEM: TStringField;
    qry_modelo_doc_NM_ESTUFAGEM: TStringField;
    procedure qry_modelo_doc_AfterDelete(DataSet: TDataSet);
    procedure qry_modelo_doc_AfterPost(DataSet: TDataSet);
    procedure qry_modelo_doc_BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_mod_doc: Tdatm_mod_doc;

implementation

{$R *.DFM}

procedure Tdatm_mod_doc.qry_modelo_doc_AfterDelete(DataSet: TDataSet);
begin
  qry_modelo_doc_.ApplyUpdates;
end;

procedure Tdatm_mod_doc.qry_modelo_doc_AfterPost(DataSet: TDataSet);
begin
  qry_modelo_doc_.ApplyUpdates;
end;

procedure Tdatm_mod_doc.qry_modelo_doc_BeforePost(DataSet: TDataSet);
begin
  if datm_mod_doc.qry_modelo_doc_.State in [dsinsert] then begin
    with TQuery.Create(Application) do begin
      DataBaseName:='DBBROKER';
      Sql.Add('SELECT MAX(CODIGO) FROM TMODELO_DOC WHERE CD_UNID_NEG = "'+qry_modelo_doc_CD_UNID_NEG.AsString+'"');
      Open;
      if Fields[0].AsString='' then
        qry_modelo_doc_CODIGO.AsString:='001'
      else
        qry_modelo_doc_CODIGO.AsString:=formatfloat('000',Fields[0].AsInteger + 1);
      Free;
    end;
  end;
end;

end.

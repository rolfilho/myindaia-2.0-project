unit PGSM068;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_cliente_co = class(TDataModule)
    ds_empresa_nac: TDataSource;
    qry_empresa_nac_: TQuery;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    qry_empresa_nac_CGC_EMPRESA: TStringField;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    qry_empresa_nac_LookCliente: TStringField;
    qry_empresa_nac_LookImportador: TStringField;
    qry_empresa_nac_LookExportador: TStringField;
    qry_empresa_nac_LookRepresentante: TStringField;
    qry_empresa_nac_LookOutros: TStringField;
    ds_grupo: TDataSource;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_empresa_nac_LookGrupo: TStringField;
    ds_tipo_pessoa: TDataSource;
    tbl_tipo_pessoa_: TTable;
    tbl_tipo_pessoa_CD_TIPO_PESSOA: TStringField;
    tbl_tipo_pessoa_NM_TIPO_PESSOA: TStringField;
    qry_empresa_nac_LookTipoPessoa: TStringField;
    qry_empresa_nac_CalcCNPJ: TStringField;
    qry_empresa_nac_IN_CLIENTE: TBooleanField;
    qry_empresa_nac_IN_IMPORTADOR: TBooleanField;
    qry_empresa_nac_IN_EXPORTADOR: TBooleanField;
    qry_empresa_nac_IN_REPRESENTANTE: TBooleanField;
    qry_empresa_nac_IN_OUTROS: TBooleanField;
    qry_empresa_nac_CD_GRUPO: TStringField;
    qry_empresa_nac_CD_TIPO_PESSOA: TStringField;
    qry_empresa_nac_AP_EMPRESA: TStringField;
    qry_empresa_nac_END_EMPRESA: TStringField;
    qry_empresa_nac_END_NUMERO: TStringField;
    qry_empresa_nac_END_BAIRRO: TStringField;
    qry_empresa_nac_END_CIDADE: TStringField;
    qry_empresa_nac_END_UF: TStringField;
    qry_empresa_nac_END_CEP: TStringField;
    qry_empresa_nac_CPF_EMPRESA: TStringField;
    qry_empresa_nac_IE_EMPRESA: TStringField;
    qry_empresa_nac_OUTRO_DOC: TStringField;
    qry_empresa_nac_DT_INCLUSAO: TDateTimeField;
    qry_empresa_nac_IN_FATURAMENTO: TStringField;
    qry_empresa_nac_IN_ATIVO: TStringField;
    qry_empresa_nac_IN_SEGURADORA: TBooleanField;
    qry_empresa_nac_IN_COMPRADOR: TBooleanField;
    procedure qry_empresa_nac_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cliente_co: Tdatm_cliente_co;

implementation

{$R *.DFM}

procedure Tdatm_cliente_co.qry_empresa_nac_CalcFields(DataSet: TDataSet);
begin
  qry_empresa_nac_CalcCNPJ.AsString := Copy( qry_empresa_nac_CGC_EMPRESA.AsString, 1, 2 ) + '.' +
                                       Copy( qry_empresa_nac_CGC_EMPRESA.AsString, 3, 3 ) + '.' +
                                       Copy( qry_empresa_nac_CGC_EMPRESA.AsString, 6, 3 ) + '/' +
                                       Copy( qry_empresa_nac_CGC_EMPRESA.AsString, 9, 4 ) + '-' +
                                       Copy( qry_empresa_nac_CGC_EMPRESA.AsString, 13, 2 );
end;

end.

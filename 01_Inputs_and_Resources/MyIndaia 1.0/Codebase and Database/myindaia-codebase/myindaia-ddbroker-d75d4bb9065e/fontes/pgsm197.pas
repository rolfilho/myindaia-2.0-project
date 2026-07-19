unit PGSM197;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, ConsOnLineEx;

type
  Tdatm_de_para = class(TDataModule)
    ds_de_para: TDataSource;
    qry_de_para_: TQuery;
    qry_ttp_de_para: TQuery;
    qry_de_para_CD_TABELA: TStringField;
    qry_ttp_de_paraCD_DE_PARA: TStringField;
    qry_de_para_CalcNmDDBroker: TStringField;
    ds_ttp_de_para: TDataSource;
    qry_nm_ddbroker_: TQuery;
    ds_nm_ddbroker: TDataSource;
    qry_de_para_CD_EXTERNO: TStringField;
    qry_ttp_de_paraNM_DE_PARA: TStringField;
    qry_de_para_LookTipo: TStringField;
    ds_unid_neg: TDataSource;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_de_para_CD_UNID_NEG: TStringField;
    qry_de_para_CD_PRODUTO: TStringField;
    qry_de_para_LookNmUnidNeg: TStringField;
    qry_de_para_LookNmProduto: TStringField;
    qry_ttp_de_paraNM_TABELA: TStringField;
    qry_ttp_de_paraNM_CHAVE: TStringField;
    qry_ttp_de_paraNM_RETORNO: TStringField;
    qry_ttp_de_paraNM_FILTRO: TStringField;
    qry_de_para_CD_DDBROKER: TStringField;
    qry_de_para_CD_GRUPO: TStringField;
    ds_grupo: TDataSource;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_de_para_lookGrupo: TStringField;
    procedure qry_de_para_CalcFields(DataSet: TDataSet);
    procedure qry_de_para_BeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_de_para: Tdatm_de_para;

implementation

uses PGSM196;

{$R *.DFM}

procedure Tdatm_de_para.qry_de_para_CalcFields(DataSet: TDataSet);
begin
  with TQuery.Create(application) do begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('SELECT ISNULL(NM_TABELA,""), ISNULL(NM_CHAVE,""), ISNULL(NM_RETORNO,""), ISNULL(NM_FILTRO,"") FROM TTP_DE_PARA (NOLOCK)');
    SQL.Add(' WHERE CD_DE_PARA = "' +qry_de_para_CD_TABELA.AsString  + '" ');
    Open;
    if (IsEmpty) or (Fields[0].AsString = '') then
      qry_de_para_CalcNmDDBroker.AsString := ''
    else begin
      if Trim(Fields[3].AsString) <> '' then
        qry_de_para_CalcNmDDBroker.AsString := ConsultaLookUpSQL('SELECT ' + Fields[2].AsString + ' FROM ' + Fields[0].AsString + ' (NOLOCK) ' +
                                               ' WHERE ' + Fields[1].AsString + ' = "' + qry_de_para_CD_DDBROKER.AsString + '" AND ' +
                                               Fields[3].AsString , Fields[2].AsString)
      else
        qry_de_para_CalcNmDDBroker.AsString := ConsultaLookUp(Fields[0].AsString, Fields[1].AsString, qry_de_para_CD_DDBROKER.AsString , Fields[2].AsString);

    end;
    qry_de_para_CalcNmDDBroker.AsString := ConsultaLookUp('TTP_DE_PARA', 'CD_DE_PARA', qry_de_para_CD_TABELA.AsString , 'NM_DE_PARA');
    Free;
  end;
end;


procedure Tdatm_de_para.qry_de_para_BeforeEdit(DataSet: TDataSet);
begin
  frm_de_para.btn_incluir.Enabled  := False;
  frm_de_para.btn_salvar.Enabled   := True;
  frm_de_para.btn_cancelar.Enabled := True;
  frm_de_para.btn_excluir.Enabled  := False;

  frm_de_para.mi_incluir.Enabled   := False;
  frm_de_para.mi_salvar.Enabled    := True;
  frm_de_para.mi_cancelar.Enabled  := True;
  frm_de_para.mi_excluir.Enabled   := False;
end;

end.



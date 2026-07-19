unit PGGP068;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppProd, ppReport, ppEndUsr,
  ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppDBBDE, Db, DBTables,
  ppModule, daDatMod, ppStrtch, ppSubRpt, TeEngine, Series, ExtCtrls,
  TeeProcs;

type
  Tdatm_po_planilha = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_grupo_DT_INCLUSAO: TDateTimeField;
    qry_grupo_IN_ATIVO: TStringField;
    qry_apaga_dados: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    qry_area_: TQuery;
    qry_area_CD_AREA: TStringField;
    qry_area_NM_AREA: TStringField;
    sp_po_planilha: TStoredProc;
    qry_rel_po_planilha_: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_po_planilha: Tdatm_po_planilha;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP067;

end.

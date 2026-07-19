unit KrLI;

interface

uses Classes;

procedure DuplicarLI(LIs, ProcessoDestino: TStrings);

implementation

uses KrQuery, SysUtils;

procedure InsertLIAnuentes(const ProcessoOrigem, ProcessoDestino: string);
var
  Q: TLocalQuery;
begin
  Q := AutoQuery.Query;
  Q.SQL.Text := ' INSERT INTO TPROC_ANUENTES (NR_PROCESSO, ORGAO, PROCESSO, CGC) '+
                ' SELECT :ProcessoDestino, ORGAO, PROCESSO, CGC '+
                ' FROM   TPROC_ANUENTES '+
                ' WHERE  NR_PROCESSO = :ProcessoOrigem';
  Q.ParamByName('ProcessoOrigem').AsString := ProcessoOrigem;
  Q.ParamByName('ProcessoDestino').AsString := ProcessoDestino;
  Q.ExecSQL;
end;

procedure InsertLINVE(const ProcessoOrigem, ProcessoDestino: string);
var
  Q: TLocalQuery;
begin
  Q := AutoQuery.Query;
  Q.SQL.Text := ' INSERT INTO TLICENCA_NVE (NR_PROCESSO, NR_ITEM, CD_NIVEL_NVE, CD_ATRIBUTO_NCM, CD_ESPECIF_NCM) '+
                ' SELECT :ProcessoDestino, NR_ITEM, CD_NIVEL_NVE, CD_ATRIBUTO_NCM, CD_ESPECIF_NCM '+
                ' FROM TLICENCA_NVE '+
                ' WHERE  NR_PROCESSO = :ProcessoOrigem ';
  Q.ParamByName('ProcessoOrigem').AsString := ProcessoOrigem;
  Q.ParamByName('ProcessoDestino').AsString := ProcessoDestino;
  Q.ExecSQL;
end;

procedure InsertLIItens(const ProcessoOrigem, ProcessoDestino: string);
var
  Q: TLocalQuery;
begin
  Q := AutoQuery.Query;
  Q.SQL.Text := ' INSERT INTO TLICENCA_ITENS ( NR_PROCESSO, NR_ITEM, NR_DESTAQUE_NCM, '+
                ' CD_IMPORTADOR, CD_EXPORTADOR, CD_FABR_EXPO, CD_FABRICANTE, CD_MERCADORIA, '+
                ' CD_NALADI_NCCA, CD_NALADI_SH, CD_NCM_SH, CD_PAIS_AQUISICAO, CD_PAIS_ORIGEM, '+
                ' CD_UN_MED_COMERC, CD_UN_MED_ESTAT, PL_MERCADORIA, QT_MERC_UN_COMERC, '+
                ' QT_MERC_UN_ESTAT, TX_DESC_DET_MERC, VL_UNIT_MLE, VL_TOTAL_MLE, VL_UNIT_MCV, '+
                ' CD_PAIS_PROCEDENCIA, VL_RAT_FRETE, VL_RAT_SEGURO, VL_RAT_DESPESA, VL_RAT_DESCONTO, '+
                ' NR_ATO_DRAWBACK, NR_PROC_PO, NR_ITEM_PO, CD_REGIME_TRIBUTACAO, CD_FUND_LEGAL, '+
                ' NR_ITEM_DRAWBACK_BK, NR_REG_DRAWBACK, IN_REG_DRAWBACK, NR_LI_SUBSTITUIDO, '+
                ' IN_DRAWBACK_AUTOMATICO, QT_PRODUTO_DRAWBACK, VL_PRODUTO_DRAWBACK, NR_FATURA_PO, '+
                ' SISTEMA_DRAWBACK, NR_ITEM_DRAWBACK ) '+
                ' SELECT :ProcessoDestino, NR_ITEM, NR_DESTAQUE_NCM, CD_IMPORTADOR, CD_EXPORTADOR, '+
                ' CD_FABR_EXPO, CD_FABRICANTE, CD_MERCADORIA, CD_NALADI_NCCA, CD_NALADI_SH, CD_NCM_SH, '+
                ' CD_PAIS_AQUISICAO, CD_PAIS_ORIGEM, CD_UN_MED_COMERC, CD_UN_MED_ESTAT, PL_MERCADORIA, '+
                ' QT_MERC_UN_COMERC, QT_MERC_UN_ESTAT, TX_DESC_DET_MERC, VL_UNIT_MLE, VL_TOTAL_MLE, '+
                ' VL_UNIT_MCV, CD_PAIS_PROCEDENCIA, VL_RAT_FRETE, VL_RAT_SEGURO, VL_RAT_DESPESA, '+
                ' VL_RAT_DESCONTO, NR_ATO_DRAWBACK, NR_PROC_PO, NR_ITEM_PO, CD_REGIME_TRIBUTACAO, '+
                ' CD_FUND_LEGAL, NR_ITEM_DRAWBACK_BK, NR_REG_DRAWBACK, IN_REG_DRAWBACK, NR_LI_SUBSTITUIDO, '+
                ' IN_DRAWBACK_AUTOMATICO, QT_PRODUTO_DRAWBACK, VL_PRODUTO_DRAWBACK, NR_FATURA_PO, '+
                ' SISTEMA_DRAWBACK, NR_ITEM_DRAWBACK '+
                ' FROM TLICENCA_ITENS '+
                ' WHERE  NR_PROCESSO = :ProcessoOrigem ';
  Q.ParamByName('ProcessoOrigem').AsString := ProcessoOrigem;
  Q.ParamByName('ProcessoDestino').AsString := ProcessoDestino;
  Q.ExecSQL;
end;

function GetSelectLI(const Processo: string): string;
begin
  Result := ' SELECT NR_PROCESSO FROM TLICENCA_IMPORTACAO  '+
            ' WHERE  NR_PROCESSO LIKE '+QuotedStr(Processo+'%');
end;

function UltimoSequencialLI(const Processo: string): Integer;
var
  Q: TLocalQuery;
  Aux: string;
begin
  Result := 0;
  Q := AutoQuery.Query('SELECT MAX(NR_PROCESSO) FROM TLICENCA_IMPORTACAO '+
                       'WHERE NR_PROCESSO LIKE ' + QuotedStr(Processo+'%')) ;
  Q.Open;
  Aux := Trim(Q.Fields[0].AsString);
  if not Q.IsEmpty and (Length(Aux) > 16) then
    Result := StrToIntDef(Copy(Aux, 18, 3),0);
end;

procedure InsertLI(const ProcessoOrigem, ProcessoDestino: string);
var
  Q: TLocalQuery;
begin
  Q := AutoQuery.Query(GetSelectLI(ProcessoOrigem));
  Q.SQL.Text := ' INSERT INTO TLICENCA_IMPORTACAO ( NR_PROCESSO, NR_IDENT_USUARIO, NR_ATO_DRAWBACK, '+
                ' NR_COMUNICADO_COMPRA, NR_REGISTRO_LI, CD_MOD_PAGAMENTO, CD_IMPORTADOR, CD_ACORDO_ALADI, '+
                ' CD_REGIME_TRIBUTACAO, CD_FUND_LEGAL, CD_AGENCIA_SECEX, CD_PAIS_PROCEDENCIA, CD_INCOTERM, '+
                ' CD_INSTITUICAO_FINANC, CD_MOT_SEM_COBERTURA, CD_CONDICAO_MERC, CD_MOEDA_FOB, '+
                ' CD_URF_DESPACHO, CD_URF_ENTRADA, CD_MOEDA_FRETE, CD_MOEDA_SEGURO, CD_MOEDA_MLE, '+
                ' CD_TIPO_IMPORTADOR, CD_SERVICO, DT_PROCESSO_LI, DT_REGISTRO_LI, QT_DIAS_COBERTURA, '+
                ' QT_TOTAL_PES_LIQ, QT_MED_ESTATISTICA, QT_TOTAL_ITEM, TP_CAMBIO, TP_ACORDO_ALADI, '+
                ' TX_INFO_COMPLEMENTAR, VL_FRETE_MOEDA, VL_SEGURO_MOEDA, VL_DESPESA_MOEDA, '+
                ' VL_DESCONTO_MOEDA, VL_TOTAL_MOEDA, NR_PROCESSO_SISCOMEX, IN_MONTADA, IN_EMBUT_FRT_ITENS ) '+
                ' SELECT :ProcessoDestino, NR_IDENT_USUARIO, NR_ATO_DRAWBACK, NR_COMUNICADO_COMPRA, '+
                ' NR_REGISTRO_LI, CD_MOD_PAGAMENTO, CD_IMPORTADOR, CD_ACORDO_ALADI, CD_REGIME_TRIBUTACAO,'+
                ' CD_FUND_LEGAL, CD_AGENCIA_SECEX, CD_PAIS_PROCEDENCIA, CD_INCOTERM, CD_INSTITUICAO_FINANC, '+
                ' CD_MOT_SEM_COBERTURA, CD_CONDICAO_MERC, CD_MOEDA_FOB, CD_URF_DESPACHO, CD_URF_ENTRADA, '+
                ' CD_MOEDA_FRETE, CD_MOEDA_SEGURO, CD_MOEDA_MLE, CD_TIPO_IMPORTADOR, CD_SERVICO, '+
                ' CONVERT( DATETIME, CONVERT( char(10), GETDATE(), 103), 103), DT_REGISTRO_LI, '+
                ' QT_DIAS_COBERTURA, QT_TOTAL_PES_LIQ, QT_MED_ESTATISTICA, QT_TOTAL_ITEM, TP_CAMBIO, '+
                ' TP_ACORDO_ALADI, TX_INFO_COMPLEMENTAR, VL_FRETE_MOEDA, VL_SEGURO_MOEDA, VL_DESPESA_MOEDA, '+
                ' VL_DESCONTO_MOEDA, VL_TOTAL_MOEDA, NR_PROCESSO_SISCOMEX, ''0'', IN_EMBUT_FRT_ITENS  '+
                ' FROM   TLICENCA_IMPORTACAO  '+
                ' WHERE  NR_PROCESSO = :ProcessoOrigem ';
  Q.ParamByName('ProcessoOrigem').AsString := ProcessoOrigem;
  Q.ParamByName('ProcessoDestino').AsString := ProcessoDestino;
  Q.ExecSQL;
end;

function FormatNumeroProcesso(const Processo: string; Seq: Integer): string;
begin
  Result := Processo + '-' + FormatFloat('000', Seq);
end;

procedure DuplicarLI(LIs, ProcessoDestino: TStrings);
var
  I: Integer;
  J: Integer;
  Seq: Integer;
  Aux: string;
begin
  TLocalQuery.StarTransaction;
  try
    for I := 0 to LIs.Count - 1 do
      for J := 0 to ProcessoDestino.Count - 1 do
      begin
        Seq := UltimoSequencialLI(ProcessoDestino[J]);
        Inc(Seq);
        Aux := FormatNumeroProcesso(ProcessoDestino[J], Seq);
        InsertLI(LIs[I], Aux);
        InsertLIItens(LIs[I], Aux);
        InsertLINVE(LIs[I], Aux);
        InsertLIAnuentes(LIs[I], Aux);
      end;
    TLocalQuery.CommitTransaction;
  except
    TLocalQuery.RollbackTransaction;
    raise;
  end;
end;

end.

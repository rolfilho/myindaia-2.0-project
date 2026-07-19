unit PGPE046;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppClass, ppProd, ppReport, ppEndUsr, ppDB, ppComm, ppRelatv,
  ppCache, ppDBPipe, ppDBBDE, Db, DBTables, ppModule, daDatMod, ppStrtch,
  ppMemo, ppCtrls, ppPrnabl, ppVar, ppSubRpt, ByComponent, ByDocEngine,
  ByHEDoc, H5Def32, PGHI001;

type
  Tdatm_exp_impr_bordero = class(TDataModule)
    qry_unid_: TQuery;
    qry_imp_: TQuery;
    qry_proc_exp_: TQuery;
    qry_processo_: TQuery;
    qry_moeda_: TQuery;
    qry_exp_: TQuery;
    by_he_Bordero: TByHEDoc;
    qry_exp_NM_EMPRESA: TStringField;
    qry_proc_exp_NR_PROCESSO: TStringField;
    qry_proc_exp_DT_REGISTRO_PEDIDO: TDateTimeField;
    qry_proc_exp_NR_FATURA: TStringField;
    qry_proc_exp_DT_FATURA: TDateTimeField;
    qry_proc_exp_CD_MOEDA: TStringField;
    qry_proc_exp_CD_TERMO_PAGTO: TStringField;
    qry_proc_exp_CD_EXPORTADOR: TStringField;
    qry_proc_exp_CD_IMPORTADOR: TStringField;
    qry_proc_exp_VL_TX_CAMBIO: TFloatField;
    qry_proc_exp_CD_FORMA_PAGTO: TStringField;
    qry_processo_CD_BANCO_EXP: TStringField;
    qry_unid_CD_UNID_NEG: TStringField;
    qry_unid_NM_UNID_NEG: TStringField;
    qry_termo_pagto_: TQuery;
    qry_exp_saque_: TQuery;
    qry_exp_saque_NR_SAQUE: TStringField;
    qry_exp_saque_DT_VCTO_SAQUE: TDateTimeField;
    qry_exp_saque_VL_TOT_SAQUE: TFloatField;
    qry_exp_saque_NR_PROCESSO: TStringField;
    qry_exp_re_: TQuery;
    qry_exp_re_NR_PROCESSO: TStringField;
    qry_exp_re_NR_RE: TStringField;
    qry_proc_exp_NR_SD: TStringField;
    qry_moeda_CD_MOEDA: TStringField;
    qry_moeda_AP_MOEDA: TStringField;
    qry_proc_exp_TP_DOCUMENTO: TStringField;
    qry_proc_exp_CD_DOCUMENTO: TStringField;
    qry_documento_: TQuery;
    qry_referencia_: TQuery;
    qry_banco_fatura_: TQuery;
    qry_banco_fatura_NM_EMPRESA: TStringField;
    qry_referencia_NR_PROCESSO: TStringField;
    qry_referencia_NM_REFERENCIA: TStringField;
    qry_ttp_data_: TQuery;
    qry_ttp_data_CODIGO: TStringField;
    qry_exp_saque_TP_VCTO: TStringField;
    qry_executa_: TQuery;
    qry_termo_pagto_NM_TERMO_PAGTO: TStringField;
    ds_proc_exp_: TDataSource;
    qry_exp_nf_: TQuery;
    qry_exp_nf_NR_PROCESSO: TStringField;
    qry_exp_nf_NR_NF: TStringField;
    qry_analista_: TQuery;
    qry_processo_CD_ANALISTA_CLIENTE: TStringField;
    qry_proc_exp_CD_LINGUA_PEDIDO: TStringField;
    qry_executa_NR_PROCESSO: TStringField;
    qry_executa_NR_SEQUENCIA: TStringField;
    qry_executa_CD_DOCUMENTO: TStringField;
    qry_executa_NR_REFERENCIA: TStringField;
    qry_executa_QT_COPIAS: TIntegerField;
    qry_executa_QT_ORIGINAIS: TIntegerField;
    qry_executa_DESCRICAO: TStringField;
    qry_ttp_data_DESCRICAO: TStringField;
    qry_proc_exp_CD_BANCO_SAQUE_BORDERO: TStringField;
    qry_banco_bordero_: TQuery;
    qry_banco_bordero_NM_BANCO: TStringField;
    qry_banco_bordero_END_BANCO: TStringField;
    qry_proc_exp_VL_COMISSAO_PERCENT: TFloatField;
    qry_proc_exp_AP_MOEDA: TStringField;
    qry_proc_exp_VL_TOT_COM_AGENTE: TFloatField;
    qry_proc_exp_NM_AGENTE: TStringField;
    qry_analista_NM_USUARIO: TStringField;
    qry_proc_exp_DT_INICIAL: TDateTimeField;
    qry_proc_exp_VL_TOT_MCV: TFloatField;
    qry_processo_NR_CONHECIMENTO_MASTER: TStringField;
    qry_processo_NR_CONHECIMENTO: TStringField;
    procedure by_he_BorderoDoc(Sender: TObject);
  private
    { Private declarations }
    function SpacePonto( i : Integer) : String;

  public
    { Public declarations }
  end;

var
  datm_exp_impr_bordero: Tdatm_exp_impr_bordero;

implementation

{$R *.DFM}

uses PGPE045, GSMLIB;


procedure Tdatm_exp_impr_bordero.by_he_BorderoDoc(Sender: TObject);
var
  cTexto1, cTexto2, cTexto3, cTexto5, cTexto6 : String[70];
  cTexto4, cTexto7, cTexto8 : String[100];
  nNum : Integer;

begin
  by_he_Bordero.ppHEEditor.LoadDoc( Pchar( Trim( cDir_Rpt + '\Bordero.hed' ) ), FILEFORMAT_HIGHEDIT );

  qry_proc_exp_.Close;
  qry_proc_exp_.ParamByName('NR_PROCESSO').AsString := frm_exp_impr_bordero.msk_cd_unid_neg.text + '02' + frm_exp_impr_bordero.msk_nr_processo.Text;
  qry_proc_exp_.Prepare;
  qry_proc_exp_.Open;

  qry_exp_.Close;
  qry_exp_.ParamByName('CD_EXPORTADOR').AsString := qry_proc_exp_CD_EXPORTADOR.AsString;
  qry_exp_.Prepare;
  qry_exp_.Open;

  qry_imp_.Close;
  qry_imp_.Sql.Clear;
  if qry_proc_exp_CD_LINGUA_PEDIDO.AsString = '1' then      // ingles
  begin
    qry_imp_.SQL.Add(
    'SELECT E.NM_EMPRESA, P.NM_PAIS_ING '+
    'FROM TEMPRESA_EST E '+
    'LEFT JOIN TPAIS_BROKER P ON P.CD_PAIS = E.CD_PAIS WHERE CD_EMPRESA = "' + qry_proc_exp_CD_IMPORTADOR.AsString + '"' )
  end
  else if qry_proc_exp_CD_LINGUA_PEDIDO.AsString = '2' then      // espanhol
  begin
    qry_imp_.SQL.Add(
    'SELECT E.NM_EMPRESA, P.NM_PAIS_ESP '+
    'FROM TEMPRESA_EST E '+
    'LEFT JOIN TPAIS_BROKER P ON P.CD_PAIS = E.CD_PAIS WHERE CD_EMPRESA = "' + qry_proc_exp_CD_IMPORTADOR.AsString + '"' )
  end
  else
  begin
    qry_imp_.SQL.Add(
    'SELECT E.NM_EMPRESA, P.NM_PAIS_PORT '+
    'FROM TEMPRESA_EST E '+
    'LEFT JOIN TPAIS_BROKER P ON P.CD_PAIS = E.CD_PAIS WHERE CD_EMPRESA = "' + qry_proc_exp_CD_IMPORTADOR.AsString + '"' )
  end;
  qry_imp_.Prepare;
  qry_imp_.Open;

  qry_moeda_.Close;
  qry_moeda_.ParamByName('CD_MOEDA').AsString := qry_proc_exp_CD_MOEDA.AsString;
  qry_moeda_.Prepare;
  qry_moeda_.Open;

  qry_termo_pagto_.Close;
  qry_termo_pagto_.ParamByName('CD_TERMO_PAGTO').AsString := qry_proc_exp_CD_TERMO_PAGTO.AsString;
  qry_termo_pagto_.Prepare;
  qry_termo_pagto_.Open;

  qry_processo_.Close;
  qry_processo_.Prepare;
  qry_processo_.Open;

  qry_banco_fatura_.Close;
  qry_banco_fatura_.ParamByName('CD_BANCO_EXP').AsString := qry_processo_CD_BANCO_EXP.AsString;
  qry_banco_fatura_.Prepare;
  qry_banco_fatura_.Open;

  qry_exp_saque_.Close;
  qry_exp_saque_.Prepare;
  qry_exp_saque_.Open;

  qry_exp_nf_.Close;
  qry_exp_nf_.Prepare;
  qry_exp_nf_.Open;

  qry_exp_re_.Close;
  qry_exp_re_.Prepare;
  qry_exp_re_.Open;

  qry_referencia_.Close;
  qry_referencia_.Prepare;
  qry_referencia_.Open;

  qry_ttp_data_.Close;
  qry_ttp_data_.ParamByName('CODIGO').AsString := qry_exp_saque_TP_VCTO.AsString;
  qry_ttp_data_.Prepare;
  qry_ttp_data_.Open;

  qry_analista_.Close;
  qry_analista_.ParamByName('NR_PROCESSO').AsString := qry_proc_exp_NR_PROCESSO.AsString;
  qry_analista_.Prepare;
  qry_analista_.Open;

  by_he_Bordero.ppAutoRefresh := False;

  by_he_Bordero.pcAddField( '[NR_PROCESSO]'        , Copy( qry_proc_exp_NR_PROCESSO.AsString, 5, 14 ) );
  if Trim( qry_proc_exp_NR_FATURA.AsString ) = '' then
    by_he_Bordero.pcAddField( '[NR_FATURA]'        , '' )
  else
    by_he_Bordero.pcAddField( '[NR_FATURA]'        , '/ ' + qry_proc_exp_NR_FATURA.AsString );
  by_he_Bordero.pcAddField( '[NM_ANALISTA]'        , UpperCase( qry_analista_NM_USUARIO.AsString ) );
  by_he_Bordero.pcAddField( '[DT_DE_ABERTURA]'     , FormatDateTime( 'dd/mm/yyyy', Date ) );
  by_he_Bordero.pcAddField( '[SUA_REFERENCIA]'     , qry_referencia_NM_REFERENCIA.AsString );
  by_he_Bordero.pcAddField( '[NM_BANCO_FATURA]'    , qry_banco_fatura_NM_EMPRESA.AsString );
  by_he_Bordero.pcAddField( '[NR_FATURA]'          , qry_proc_exp_NR_FATURA.AsString );
  by_he_Bordero.pcAddField( '[AP_MOEDA]'           , qry_moeda_AP_MOEDA.AsString );
  by_he_Bordero.pcAddField( '[VL_TOT_CIF]'         , FormatFloat( '#0,.00', qry_proc_exp_VL_TOT_MCV.AsFloat ) );
  by_he_Bordero.pcAddField( '[NM_TERMO_PAGTO]'     , qry_termo_pagto_NM_TERMO_PAGTO.AsString );
//  by_he_Bordero.pcAddField( '[DT_TP_VCTO]'         , qry_ttp_data_DESCRICAO.AsString );
  by_he_Bordero.pcAddField( '[DT_VCTO_SAQUE]'      , qry_exp_saque_DT_VCTO_SAQUE.AsString );
  by_he_Bordero.pcAddField( '[NM_IMPORTADOR]'      , qry_imp_.FieldByName('NM_EMPRESA').AsString );
  if qry_proc_exp_VL_COMISSAO_PERCENT.AsFloat = 0 then
     by_he_Bordero.pcAddField( '[PERC_COM_AGENTE]'    , '' )
  else
     by_he_Bordero.pcAddField( '[PERC_COM_AGENTE]'    , FormatFloat( '#0.00', qry_proc_exp_VL_COMISSAO_PERCENT.AsFloat ) + ' % ' );

  if ( Trim( qry_proc_exp_AP_MOEDA.AsString ) <> '' ) and ( qry_proc_exp_VL_TOT_COM_AGENTE.AsFloat <> 0 ) then
    by_he_Bordero.pcAddField( '[NM_MOEDA]'           , ' - ' + Trim( qry_proc_exp_AP_MOEDA.AsString ) + ' ' )
  else
    by_he_Bordero.pcAddField( '[NM_MOEDA]'           , ' ' );
  if qry_proc_exp_VL_TOT_COM_AGENTE.AsFloat = 0 then
     by_he_Bordero.pcAddField( '[VL_COMISSAO_AGENTE]'    , '' )
  else
     by_he_Bordero.pcAddField( '[VL_COMISSAO_AGENTE]' , FormatFloat( '#0.00', qry_proc_exp_VL_TOT_COM_AGENTE.AsFloat ) );
  if Trim( qry_proc_exp_NM_AGENTE.AsString ) <> '' then
     by_he_Bordero.pcAddField( '[NM_AGENTE]'          , 'BENEFICIÁRIO : ' + qry_proc_exp_NM_AGENTE.AsString + #13#10 )
  else
     by_he_Bordero.pcAddField( '[NM_AGENTE]'          , '' );

  if qry_proc_exp_CD_LINGUA_PEDIDO.AsString = '1' then      // ingles
    by_he_Bordero.pcAddField( '[NM_PAIS_IMPORTADOR]', qry_imp_.FieldByName('NM_PAIS_ING').AsString )
  else if qry_proc_exp_CD_LINGUA_PEDIDO.AsString = '2' then      // espanhol
    by_he_Bordero.pcAddField( '[NM_PAIS_IMPORTADOR]', qry_imp_.FieldByName('NM_PAIS_ESP').AsString )
  else
    by_he_Bordero.pcAddField( '[NM_PAIS_IMPORTADOR]', qry_imp_.FieldByName('NM_PAIS_PORT').AsString );

  by_he_Bordero.pcAddField( '[DT_FATURA]'         , qry_proc_exp_DT_INICIAL.AsString );
//  by_he_Bordero.pcAddField( '[VL_TX_CAMBIO]'      , qry_proc_exp_VL_TX_CAMBIO.AsString );

  //Banco Documento
  if ( qry_proc_exp_CD_BANCO_SAQUE_BORDERO.AsString <> '' ) then
  begin
    qry_banco_bordero_.Close;
    qry_banco_bordero_.ParamByName('CD_BANCO_SAQUE_BORDERO').AsString := qry_proc_exp_CD_BANCO_SAQUE_BORDERO.AsString;
    qry_banco_bordero_.Prepare;
    qry_banco_bordero_.Open;

    by_he_Bordero.pcAddField( '[NM_BANCO_DOC]', qry_banco_bordero_.FieldByName('NM_BANCO').AsString );
    by_he_Bordero.pcAddField( '[END_BANCO_DOC]', qry_banco_bordero_.FieldByName('END_BANCO').AsString );
    qry_banco_bordero_.Close;
  end
  else
  begin
    by_he_Bordero.pcAddField( '[NM_BANCO_DOC]' , '' );
    by_he_Bordero.pcAddField( '[END_BANCO_DOC]'  , '' );
  end;

  cTexto1 := '';
  cTexto2 := '';
  cTexto3 := '';
  cTexto4 := '';
  cTexto5 := '';
  cTexto6 := '';
  cTexto7 := '';
  cTexto8 := '';

  {Saque}
  qry_executa_.Close;
  qry_executa_.ParamByName('CD_UNID_NEG').AsString := frm_exp_impr_bordero.msk_cd_unid_neg.Text;
  qry_executa_.ParamByName('NR_PROCESSO').AsString := qry_proc_exp_NR_PROCESSO.AsString;
  qry_executa_.ParamByName('NOME').AsString := 'SAQUE';
  qry_executa_.Prepare;
  qry_executa_.Open;

  if qry_executa_NR_PROCESSO.AsString = qry_proc_exp_NR_PROCESSO.AsString then
  begin
    cTexto1 := Trim( 'Saque de ' + Trim( qry_moeda_AP_MOEDA.AsString ) + ' ' + FormatFloat( '#0,.00', qry_exp_saque_VL_TOT_SAQUE.AsFloat ) + ' - Vencimento : ' + qry_exp_saque_DT_VCTO_SAQUE.AsString );
    nNum := Length( cTexto1 );

    cTexto1 := cTexto1 + SpacePonto( 70 - (nNum + 7)) + StrZero(qry_executa_QT_ORIGINAIS.AsInteger,3) + '/' + StrZero(qry_executa_QT_COPIAS.AsInteger,3);
  end;

  {Fatura}
  qry_executa_.Close;
  qry_executa_.ParamByName('CD_UNID_NEG').AsString := frm_exp_impr_bordero.msk_cd_unid_neg.Text;
  qry_executa_.ParamByName('NR_PROCESSO').AsString := qry_proc_exp_NR_PROCESSO.AsString;
  qry_executa_.ParamByName('NOME').AsString := 'FATURA';
  qry_executa_.Prepare;
  qry_executa_.Open;

  if qry_executa_NR_PROCESSO.AsString = qry_proc_exp_NR_PROCESSO.AsString then
  begin
    cTexto2 := Trim( 'Fatura Comercial ' + Trim( qry_proc_exp_NR_FATURA.AsString ) );
    nNum    := Length( cTexto2 );

    cTexto2 := cTexto2 + SpacePonto( 70 - (nNum + 7)) + StrZero(qry_executa_QT_ORIGINAIS.AsInteger,3) + '/' + StrZero(qry_executa_QT_COPIAS.AsInteger,3);
  end;

  {B/L}
  qry_executa_.Close;
  qry_executa_.ParamByName('CD_UNID_NEG').AsString := frm_exp_impr_bordero.msk_cd_unid_neg.Text;
  qry_executa_.ParamByName('NR_PROCESSO').AsString := qry_proc_exp_NR_PROCESSO.AsString;
  qry_executa_.ParamByName('NOME').AsString := 'B/L';
  qry_executa_.Prepare;
  qry_executa_.Open;

  if qry_executa_NR_PROCESSO.AsString = qry_proc_exp_NR_PROCESSO.AsString then
  begin
    cTexto3 := 'Conhecimento B/L Nº ';
    if Trim(qry_processo_NR_CONHECIMENTO_MASTER.AsString) <> '' then
       cTexto3 := Trim( cTexto3 ) + qry_processo_NR_CONHECIMENTO_MASTER.AsString
    else
       cTexto3 := Trim( cTexto3 ) + qry_processo_NR_CONHECIMENTO.AsString;

    cTexto3 := Trim( cTexto3 );
    nNum := Length( cTexto3 );

    cTexto3 := cTexto3 + SpacePonto( 70 - (nNum + 7)) + StrZero(qry_executa_QT_ORIGINAIS.AsInteger,3) + '/' + StrZero(qry_executa_QT_COPIAS.AsInteger,3);
  end
  else
  begin
    {AWB}
    qry_executa_.Close;
    qry_executa_.ParamByName('CD_UNID_NEG').AsString := frm_exp_impr_bordero.msk_cd_unid_neg.Text;
    qry_executa_.ParamByName('NR_PROCESSO').AsString := qry_proc_exp_NR_PROCESSO.AsString;
    qry_executa_.ParamByName('NOME').AsString := 'AWB';
    qry_executa_.Prepare;
    qry_executa_.Open;

    cTexto3 := 'Conhecimento AWB Nº ';
    if Trim(qry_processo_NR_CONHECIMENTO_MASTER.AsString) <> '' then
       cTexto3 := Trim( cTexto3 ) + qry_processo_NR_CONHECIMENTO_MASTER.AsString
    else
       cTexto3 := Trim( cTexto3 ) + qry_processo_NR_CONHECIMENTO.AsString;

    cTexto3 := Trim( cTexto3 );
    nNum := Length( cTexto3 );

    cTexto3 := cTexto3 + SpacePonto( 70 - (nNum + 7)) + StrZero(qry_executa_QT_ORIGINAIS.AsInteger,3) + '/' + StrZero(qry_executa_QT_COPIAS.AsInteger,3);
  end;

  {Certificado de Origem}
  qry_executa_.Close;
  qry_executa_.ParamByName('CD_UNID_NEG').AsString := frm_exp_impr_bordero.msk_cd_unid_neg.Text;
  qry_executa_.ParamByName('NR_PROCESSO').AsString := qry_proc_exp_NR_PROCESSO.AsString;
  qry_executa_.ParamByName('NOME').AsString := 'DE ORIGEM';
  qry_executa_.Prepare;
  qry_executa_.Open;

  if qry_executa_NR_PROCESSO.AsString = qry_proc_exp_NR_PROCESSO.AsString then
  begin
    cTexto5 := 'Certificado de Origem ';
    cTexto5 := Trim( cTexto5 );
    nNum := Length( cTexto5 );
    cTexto5 := cTexto5 + SpacePonto( 70 - (nNum + 7)) + StrZero(qry_executa_QT_ORIGINAIS.AsInteger,3) + '/' + StrZero(qry_executa_QT_COPIAS.AsInteger,3);
  end;

  {Packing List}
  qry_executa_.Close;
  qry_executa_.ParamByName('CD_UNID_NEG').AsString := frm_exp_impr_bordero.msk_cd_unid_neg.Text;
  qry_executa_.ParamByName('NR_PROCESSO').AsString := qry_proc_exp_NR_PROCESSO.AsString;
  qry_executa_.ParamByName('NOME').AsString := 'PACK';
  qry_executa_.Prepare;
  qry_executa_.Open;

  if qry_executa_NR_PROCESSO.AsString = qry_proc_exp_NR_PROCESSO.AsString then
  begin
    cTexto8 := Trim( 'Packing List ' + Trim( qry_proc_exp_NR_FATURA.AsString ) );
    nNum := Length( cTexto8 );

    cTexto8 := cTexto8 + SpacePonto( 70 - (nNum + 7) ) + StrZero( qry_executa_QT_ORIGINAIS.AsInteger, 3 ) + '/' + StrZero( qry_executa_QT_COPIAS.AsInteger, 3 );
  end;

  {Certificado de Seguro}
  qry_executa_.Close;
  qry_executa_.ParamByName('CD_UNID_NEG').AsString := frm_exp_impr_bordero.msk_cd_unid_neg.Text;
  qry_executa_.ParamByName('NR_PROCESSO').AsString := qry_proc_exp_NR_PROCESSO.AsString;
  qry_executa_.ParamByName('NOME').AsString := 'DE SEGURO';
  qry_executa_.Prepare;
  qry_executa_.Open;

  if qry_executa_NR_PROCESSO.AsString = qry_proc_exp_NR_PROCESSO.AsString then
  begin
    cTexto6 := 'Certificado de Seguro ';
    cTexto6 := Trim( cTexto6 );
    nNum := Length( cTexto6 );
    cTexto6 := cTexto6 + SpacePonto( 70 - (nNum + 7)) + StrZero(qry_executa_QT_ORIGINAIS.AsInteger,3) + '/' + StrZero(qry_executa_QT_COPIAS.AsInteger,3);
  end;

 {NF}
  while not (qry_exp_NF_.EOF) do
  begin
    cTexto7 := Trim( cTexto7 ) + Trim( qry_exp_NF_NR_NF.AsString ) + ',';
    qry_exp_NF_.Next;
  end;

  if cTexto7 <> '' then
     cTexto7 := Copy( cTexto7, 1, Length( cTexto7 ) - 1 );

  {RE}
  while not (qry_exp_RE_.EOF) do
  begin
    cTexto4 := Trim( cTexto4 ) + Trim( qry_exp_RE_NR_RE.AsString ) + ',';
    qry_exp_RE_.Next;
  end;

  if cTexto4 <> '' then
     cTexto4 := Copy( cTexto4, 1, Length( cTexto4 ) - 1 );

  if by_he_Bordero.ppHEEditor.Search( SEARCH_FORWARD + SEARCH_CASE + SEARCH_INIT, 'DOCUMENTOS ANEXOS', false ) = SEARCH_FOUND then
  begin
    if Trim(cTexto1) <> '' then
    begin
      by_he_Bordero.pcAddLine;
      by_he_Bordero.pcInsertText( '[SAQUE] ' );
      by_he_Bordero.pcAddField( '[SAQUE]'  , cTexto1 );
    end;

    if Trim(cTexto2) <> '' then
    begin
      by_he_Bordero.pcAddLine;
      by_he_Bordero.pcInsertText( '[FATURA] ' );
      by_he_Bordero.pcAddField( '[FATURA]'  , cTexto2 );
    end;

    if Trim(cTexto3) <> '' then
    begin
      by_he_Bordero.pcAddLine;
      by_he_Bordero.pcInsertText( '[CONHECIMENTO] ' );
      by_he_Bordero.pcAddField( '[CONHECIMENTO]'  , cTexto3 );
    end;

    if Trim(cTexto5) <> '' then
    begin
      by_he_Bordero.pcAddLine;
      by_he_Bordero.pcInsertText( '[CERT_ORIGEM] ' );
      by_he_Bordero.pcAddField( '[CERT_ORIGEM]'  , cTexto5 );
    end;

    if Trim(cTexto6) <> '' then
    begin
      by_he_Bordero.pcAddLine;
      by_he_Bordero.pcInsertText( '[CERT_SEGURO] ' );
      by_he_Bordero.pcAddField( '[CERT_SEGURO]'  , cTexto6 );
    end;

    if Trim(cTexto8) <> '' then
    begin
      by_he_Bordero.pcAddLine;
      by_he_Bordero.pcInsertText( '[PACKING_LIST] ' );
      by_he_Bordero.pcAddField( '[PACKING_LIST]'  , cTexto8 );
    end;

    if Trim(cTexto4) <> '' then
    begin
      by_he_Bordero.pcAddLine;
      by_he_Bordero.pcInsertText( 'R.E. Nº [RE] ' );
      by_he_Bordero.pcAddField( '[RE]'  , cTexto4 );
      by_he_Bordero.pcAddLine;
      by_he_Bordero.pcInsertText( 'R.E.s Emitidos com o prazo de 180 dias' );
    end;

    if Trim(qry_proc_exp_NR_SD.AsString) <> '' then
    begin
      by_he_Bordero.pcAddLine;
      by_he_Bordero.pcInsertText( 'SD Nº [NR_SD] ' );
      by_he_Bordero.pcAddField( '[NR_SD]'  , qry_proc_exp_NR_SD.AsString );
    end;

    if Trim(cTexto7) <> '' then
    begin
      by_he_Bordero.pcAddLine;
      by_he_Bordero.pcInsertText( 'Outros Documentos : ' );

      by_he_Bordero.pcAddLine;
      by_he_Bordero.pcInsertText( 'NF Nº [NF] ' );
      by_he_Bordero.pcAddField( '[NF]'  , cTexto7 );
    end;
  end;

  if qry_proc_exp_CD_FORMA_PAGTO.AsString = '1' then
  begin
    by_he_Bordero.pcAddField( '[MARCA_COMISSAO_2]'  , 'X' );
    by_he_Bordero.pcAddField( '[MARCA_COMISSAO_1]'  , ' ' );
  end
  else
  if qry_proc_exp_CD_FORMA_PAGTO.AsString = '0' then
  begin
    by_he_Bordero.pcAddField( '[MARCA_COMISSAO_1]'  , 'X' );
    by_he_Bordero.pcAddField( '[MARCA_COMISSAO_2]'  , ' ' );
  end
  else
  begin
    by_he_Bordero.pcAddField( '[MARCA_COMISSAO_1]'  , ' ' );
    by_he_Bordero.pcAddField( '[MARCA_COMISSAO_2]'  , ' ' );
  end;

  by_he_Bordero.pcAddField( '[NM_EXPORTADOR]'  , qry_exp_NM_EMPRESA.AsString );

  by_he_Bordero.pcFieldReplace;
  by_he_Bordero.ppAutoRefresh := True;

end;

function Tdatm_exp_impr_bordero.SpacePonto( i : Integer) : String;
var
  s : string;
begin
  s := '';
  While Length( s ) < i do s := s + '.';
  SpacePonto := s;
end;

end.

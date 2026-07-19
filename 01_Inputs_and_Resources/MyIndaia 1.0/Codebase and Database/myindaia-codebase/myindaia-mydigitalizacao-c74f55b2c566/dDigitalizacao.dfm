object dtmMyIndaiaDigitalizacao: TdtmMyIndaiaDigitalizacao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 271
  Top = 193
  Height = 588
  Width = 473
  object Connection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=SA;Initial Catalog=BROKER;Data Source=INDAIA10;Use Procedure' +
      ' for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ' +
      'ID=Digitaliza'#231#227'o;Use Encryption for Data=False;Tag with column c' +
      'ollation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 53
    Top = 16
  end
  object dsListaArquivos: TDataSource
    DataSet = qryListaArquivos
    OnStateChange = dsListaArquivosStateChange
    Left = 53
    Top = 80
  end
  object dsTipoArquivo: TDataSource
    DataSet = qryTipoArquivo
    Left = 53
    Top = 192
  end
  object dsProcesso: TDataSource
    DataSet = qryProcesso
    Left = 53
    Top = 136
  end
  object dsTabelas: TDataSource
    DataSet = qryTabelas
    Left = 53
    Top = 253
  end
  object dsChaveConsulta: TDataSource
    DataSet = qryChaveConsulta
    Left = 53
    Top = 309
  end
  object dsTabelasVinculadas: TDataSource
    DataSet = qryTabelasVinculadas
    Left = 53
    Top = 367
  end
  object qryListaArquivos: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Filter = 'IN_ATIVO = '#39'1'#39
    Filtered = True
    BeforeOpen = qryListaArquivosBeforeOpen
    AfterOpen = qryListaArquivosAfterOpen
    AfterClose = qryListaArquivosAfterClose
    BeforeEdit = qryListaArquivosBeforeEdit
    BeforePost = qryListaArquivosBeforePost
    Parameters = <
      item
        Name = 'NR_PROCESSO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = '0101IM-1000-10'
      end
      item
        Name = 'ID_TABELA'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1652005462
      end
      item
        Name = 'CD_CARGO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 3
        Value = '001'
      end>
    SQL.Strings = (
      'DECLARE @NR_PROCESSO CHAR(18)'
      'DECLARE @ID_TABELA   INT'
      'DECLARE @CD_CARGO    CHAR(3)'
      ''
      'SET @NR_PROCESSO = :NR_PROCESSO'
      'SET @ID_TABELA   = :ID_TABELA'
      'SET @CD_CARGO    = :CD_CARGO'
      ''
      'SELECT PD.*,'
      '       (SELECT CAD.IN_VISUALIZACAO'
      '        FROM TCONTROLE_ACESSO_DIGITALIZACAO CAD (NOLOCK)'
      '        WHERE CAD.ID_TABELA     = PD.ID_TABELA'
      '          AND CAD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO'
      '          AND CAD.CD_CARGO      = @CD_CARGO) AS IN_VISUALIZACAO,'
      '       (SELECT CAD.IN_ALTERACAO'
      '        FROM TCONTROLE_ACESSO_DIGITALIZACAO CAD (NOLOCK)'
      '        WHERE CAD.ID_TABELA     = PD.ID_TABELA'
      '          AND CAD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO'
      '          AND CAD.CD_CARGO      = @CD_CARGO) AS IN_ALTERACAO,'
      '       (SELECT COUNT(*)'
      '        FROM TPROCESSO_DOCTOS PD1 (NOLOCK)'
      '        WHERE PD1.NR_PROCESSO = PD.NR_PROCESSO'
      '          AND PD1.NM_ARQUIVO_PAI = PD.NM_ARQUIVO)+1 AS ARQUIVOS'
      'FROM TPROCESSO_DOCTOS PD (nolock)'
      'WHERE NR_PROCESSO                      = @NR_PROCESSO'
      '  AND PD.ID_TABELA                     = @ID_TABELA'
      '--  AND PD.IN_ATIVO = '#39'1'#39
      '  AND (SELECT TOP 1 CAD.IN_VISUALIZACAO'
      '       FROM TCONTROLE_ACESSO_DIGITALIZACAO CAD(NOLOCK)'
      '       WHERE CAD.ID_TABELA     = PD.ID_TABELA'
      '         AND CAD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO'
      '         AND CAD.CD_CARGO      = @CD_CARGO) = '#39'1'#39
      '  AND ISNULL(NM_ARQUIVO_PAI, '#39#39')       = '#39#39)
    Left = 168
    Top = 80
    object qryListaArquivosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 18
    end
    object qryListaArquivosCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
    end
    object qryListaArquivosNM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      FixedChar = True
      Size = 200
    end
    object qryListaArquivosNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 15
    end
    object qryListaArquivosCD_USUARIO_CRIACAO: TStringField
      FieldName = 'CD_USUARIO_CRIACAO'
      FixedChar = True
      Size = 4
    end
    object qryListaArquivosDT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
    end
    object qryListaArquivosCD_USUARIO_ALT: TStringField
      FieldName = 'CD_USUARIO_ALT'
      FixedChar = True
      Size = 4
    end
    object qryListaArquivosDT_ALT: TDateTimeField
      FieldName = 'DT_ALT'
    end
    object qryListaArquivosIN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qryListaArquivosNM_ARQUIVO_PAI: TStringField
      FieldName = 'NM_ARQUIVO_PAI'
      FixedChar = True
      Size = 15
    end
    object qryListaArquivosNM_MOTIVO_ALTERACAO: TStringField
      FieldName = 'NM_MOTIVO_ALTERACAO'
      Size = 255
    end
    object qryListaArquivosID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryListaArquivosIN_VISUALIZACAO: TStringField
      FieldName = 'IN_VISUALIZACAO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object qryListaArquivosIN_ALTERACAO: TStringField
      FieldName = 'IN_ALTERACAO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 1
    end
    object qryListaArquivosARQUIVOS: TIntegerField
      FieldName = 'ARQUIVOS'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object qryListaArquivosIN_ENVIA_WEB: TStringField
      FieldKind = fkLookup
      FieldName = 'IN_ENVIA_WEB'
      LookupDataSet = qryTipoArquivo
      LookupKeyFields = 'CD_TIPO_DOCTO'
      LookupResultField = 'IN_ENVIA_WEB'
      KeyFields = 'CD_TIPO_DOCTO'
      ProviderFlags = [pfInWhere]
      Size = 1
      Lookup = True
    end
  end
  object qryProcesso: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    AfterOpen = qryProcessoAfterOpen
    AfterClose = qryProcessoAfterClose
    Parameters = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        Size = 1
        Value = 'X'
      end
      item
        Name = 'ID_CODIGO'
        DataType = ftString
        Size = 1
        Value = 'X'
      end>
    SQL.Strings = (
      'SELECT P.BASE_CALCULO_SDA,'
      '       P.CD_AGENTE,'
      '       P.CD_AGENTE_SEGURO,'
      '       P.CD_ANALISTA_CLIENTE,'
      '       P.CD_ANALISTA_COMISSARIA,'
      '       P.CD_AREA,'
      '       P.CD_ARMADOR,'
      '       P.CD_ARMAZEM_ATRACACAO,'
      '       P.CD_ARMAZEM_DESCARGA,'
      '       P.CD_ARMAZEM_ESTOCAGEM,'
      '       P.CD_ARMAZEM_TABELA_CLIENTE,'
      '       P.CD_BANCO_EXP,'
      '       P.CD_CANAL,'
      '       P.CD_CANCELADOR,'
      '       P.CD_CELULA,'
      '       P.CD_CIA_TRANSP,'
      '       P.CD_CLIENTE,'
      '       P.CD_CONTATO,'
      '       P.CD_CT_LUCRO,'
      '       P.CD_DESPACHANTE,'
      '       P.CD_DESPACHANTE_SDA,'
      '       P.CD_DESTINO,'
      '       P.CD_EMBARCACAO,'
      '       P.CD_EMP_EST,'
      '       P.CD_ESTUFAGEM,'
      '       P.CD_EXPORTADOR,'
      '       P.CD_FRONTEIRA,'
      '       P.CD_GRUPO,'
      '       P.CD_IMP_EXP_FI,'
      '       P.CD_IMPORTADOR,'
      '       P.CD_INCOTERM,'
      '       P.CD_LIBERADOR,'
      '       P.CD_LIBERADOR_DI,'
      '       P.CD_LINGUA_PEDIDO,'
      '       P.CD_LOCAL_CONSOLIDACAO,'
      '       P.CD_LOCAL_DESEMBARQUE,'
      '       P.CD_LOCAL_EMBARQUE,'
      '       P.CD_LOCAL_TRANSBORDO,'
      '       P.CD_MOEDA_FRETE,'
      '       P.CD_MOEDA_MLE,'
      '       P.CD_MOEDA_SEGURO,'
      '       P.CD_ORIGEM,'
      '       P.CD_PAIS_DESTINO,'
      '       P.CD_PAIS_ORIGEM,'
      '       P.CD_PRIMEIRO_PORTO_ATRAC,'
      '       P.CD_PRODUTO,'
      '       P.CD_PRODUTO_VINC,'
      '       P.CD_REF_IMP,'
      '       P.CD_REGIME_TRIB,'
      '       P.CD_REPRESENTANTE,'
      '       P.CD_RESTRICAO,'
      '       P.CD_SERVICO,'
      '       P.CD_STATUS_SDA,'
      '       P.CD_TAB_FRETE,'
      '       P.CD_TAB_FRETE_COMPRA,'
      '       P.CD_TAB_FRETE_VENDA,'
      '       P.CD_TAB_SDA,'
      '       P.CD_TERMO_PAGTO,'
      '       P.CD_TP_DTA,'
      '       P.CD_TP_PEDIDO,'
      '       P.CD_TRANSP_NAC,'
      '       P.CD_TRANSP_NAC_DOC,'
      '       P.CD_TRANSPORTADOR,'
      '       P.CD_UNID_NEG,'
      '       P.CD_UNID_NEG_VINC,'
      '       P.CD_USUARIO,'
      '       P.CD_USUARIO_ALTEROU_CANAL,'
      '       P.CD_USUARIO_REPASSA,'
      '       P.CHARGEABLE,'
      '       P.CONDICAO_PAGTO,'
      '       P.CUBAGEM,'
      '       P.DESCR_INGLES,'
      '       P.DESCR_MERCADORIA,'
      '       P.DIAS_CONDICAO_PAGTO,'
      '       P.DT_ABERTURA,'
      '       P.DT_APRESENTACAO,'
      '       P.DT_ATRACACAO,'
      '       P.DT_CANCELAMENTO,'
      '       P.DT_CHEGADA,'
      '       P.DT_CONHECIMENTO,'
      '       P.DT_CONTABIL_LWW,'
      '       P.DT_CRUZE,'
      '       P.DT_DESCARGA,'
      '       P.DT_DESEMBARACO,'
      '       P.DT_DISTRIBUICAO,'
      '       P.DT_EMBARQUE,'
      '       P.DT_ESTOCAGEM,'
      '       P.DT_LIBERACAO,'
      '       P.DT_PEDIDO,'
      '       P.DT_PRESENCA_CARGA,'
      '       P.DT_REC_NUM,'
      '       P.DT_RECEB_DOC,'
      '       P.DT_RECEBIMENTO,'
      '       P.DT_REG_DDE,'
      '       P.DT_SOL_NUM,'
      '       P.DT_VENC_PROCESSO_EXP_TEMP,'
      '       P.DT_VENCTO_ARMAZENAGEM,'
      '       P.HR_ABERTURA,'
      '       P.HR_PEDIDO,'
      '       P.ID_CODIGO_INSTR_DESEMB,'
      '       P.IN_ACCOUNT,'
      '       P.IN_AS_AGREED,'
      '       P.IN_CANCELADO,'
      '       P.IN_CHEQUE_SDA,'
      '       P.IN_CONSOLIDADO,'
      '       P.IN_COURRIER,'
      '       P.IN_CUBAGEM,'
      '       P.IN_DADOS_IGUAIS_ITENS,'
      '       P.IN_DI_LIBERADA,'
      '       P.IN_EDI_BASF,'
      '       P.IN_ENTREPOSTO,'
      '       P.IN_ETIQUETA,'
      '       P.IN_IMP_ARM,'
      '       P.IN_IMPORTANTE,'
      '       P.IN_LIBERADO,'
      '       P.IN_LIQUIDADO,'
      '       P.IN_MERC_PERIGOSA,'
      '       P.IN_PEDIDO,'
      '       P.IN_POR_VEICULO,'
      '       P.IN_PRODUCAO,'
      '       P.IN_PRODUTO_IMPORTADO,'
      '       P.IN_REL_LEAD_TIME,'
      '       P.IN_ROUTING,'
      '       P.IN_SDA_PAGO,'
      '       P.IN_SEGURO,'
      '       P.IN_SELECIONADO,'
      '       P.IN_TRANSMITE_SEM_PREVISAO,'
      '       P.IN_URGENTE,'
      '       P.NM_ATO_DECLARATORIO,'
      '       P.NM_CONEXAO,'
      '       P.NM_EMPRESA_BASF,'
      '       P.NM_LOCAL_NF_LWW,'
      '       P.NM_PLANTA,'
      '       P.NR_AVERBACAO,'
      '       P.NR_CAMINHAO,'
      '       P.NR_CONHECIMENTO,'
      '       P.NR_CONHECIMENTO_MASTER,'
      '       P.NR_CONTA_CONTABIL,'
      '       P.NR_COURRIER,'
      '       P.NR_DA,'
      '       P.NR_DDE,'
      '       P.NR_DESPACHO,'
      '       P.NR_DI,'
      '       P.NR_DI_RETORNO,'
      '       P.NR_DTA,'
      '       P.NR_FATURA,'
      '       P.NR_MANIFESTO,'
      '       P.NR_ORDEM,'
      '       P.NR_PERIODO_ARMAZENAGEM,'
      '       P.NR_PLACA_VEICULO,'
      '       P.NR_PRESENCA_CARGA,'
      '       P.NR_PROC_PARCEIRO,'
      '       P.NR_PROC_RISC,'
      '       P.NR_PROCESSO,'
      '       P.NR_PROCESSO_EXP_TEMP,'
      '       P.NR_PROCESSO_OR_ENTREPOSTO,'
      '       P.NR_PROCESSO_VINC,'
      '       P.NR_PROPOSTA,'
      '       P.NR_REF_EXPORTADOR,'
      '       P.NR_REFERENCIA,'
      '       P.NR_VIAGEM,'
      '       P.NR_VIAGEM_ARMADOR,'
      '       P.NR_VOO,'
      '       P.NUM_CE,'
      '       P.OUTRA_TAXA,'
      '       P.OUTRA_TAXA_CUSTO,'
      '       P.QT_DEVOLUCOES,'
      '       P.QT_LANC_FAT,'
      '       P.QT_RECEBIMENTO,'
      '       P.QT_REF_CLIENTE,'
      '       P.QT_SOLINUM,'
      '       P.QTD_VOLUME,'
      '       P.REF_CLIENTE,'
      '       P.TP_BANCO_EXP,'
      '       P.TP_CARGA,'
      '       P.TP_DESEMB_MIC_DTA,'
      '       P.TP_DIVISAO,'
      '       P.TP_ESTUFAGEM,'
      '       P.TP_FREQUENCIA,'
      '       P.TP_FRETE,'
      '       P.TP_MIC_DTA,'
      '       P.TP_PROCESSO,'
      '       --P.TX_DESCR,'
      '       --P.TX_MERCADORIA,'
      '       --P.TX_OBS_INT,'
      '       --P.TX_OBS_LWW,'
      '       --P.TX_OBSERVACOES,'
      '       P.VL_ACCOUNT,'
      '       P.VL_CIF_DOLAR,'
      '       P.VL_CIF_MN,'
      '       P.VL_COMISS_IATA,'
      '       P.VL_COMPL_SDA,'
      '       P.VL_CONTR_ASSIST,'
      '       P.VL_CUSTO_CIA,'
      '       P.VL_DESP_AG,'
      '       P.VL_DESP_BRASIL,'
      '       P.VL_DESP_MASTER,'
      '       P.VL_DESP_REAL,'
      '       P.VL_DIVISAO,'
      '       P.VL_FAT_COMPLEMENTAR,'
      '       P.VL_FRETE,'
      '       P.VL_FRETE_COLLECT_MNEG,'
      '       P.VL_FRETE_CUSTO,'
      '       P.VL_FRETE_INTERNO,'
      '       P.VL_FRETE_MN,'
      '       P.VL_FRETE_PREPAID_MNEG,'
      '       P.VL_FRETE_TNAC_MNEG,'
      '       P.VL_HOUSE,'
      '       P.VL_ICMS_MN,'
      '       P.VL_II_MN,'
      '       P.VL_IPI_MN,'
      '       P.VL_M3,'
      '       P.VL_MERCADORIA,'
      '       P.VL_MLE_MN,'
      '       P.VL_MLE_MNEG,'
      '       P.VL_OTHER_CHARGE,'
      '       P.VL_OTHER_CHARGE_CC,'
      '       P.VL_OTHER_CHARGE_CUSTO,'
      '       P.VL_OVER,'
      '       P.VL_PESO_BRUTO,'
      '       P.VL_PESO_LIQUIDO,'
      '       P.VL_PREMIO_SEGURO,'
      '       P.VL_PROFIT_AGENTE,'
      '       P.VL_PROFIT_BRASIL,'
      '       P.VL_PROFIT_HOUSE,'
      '       P.VL_PROFIT_LIQUIDO,'
      '       P.VL_RATEIO,'
      '       P.VL_RATEIO_DESPESA,'
      '       P.VL_REC_AG,'
      '       P.VL_REC_BR,'
      '       P.VL_SDA,'
      '       P.VL_SEGURO_MN,'
      '       P.VL_SEGURO_MNEG,'
      '       P.VL_TARIFA_FRETE,'
      '       P.VL_TAXA_FRETE,'
      '       P.VL_TT_CUSTO,'
      '       P.VL_TT_PROF_AG,'
      '       P.VL_TT_PROF_BR,'
      '       P.VL_TT_VENDA,'
      '       P.VL_VENDA_BRASIL,'
      '       P.VL_VENDA_CIA,'
      '       ISNULL(EN.NM_EMPRESA, EE.NM_EMPRESA) AS NM_EMPRESA'
      
        'FROM TPROCESSO P LEFT JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = P.' +
        'CD_CLIENTE'
      '  LEFT JOIN TEMPRESA_EST EE ON EE.CD_EMPRESA = P.CD_CLIENTE'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND IN_CANCELADO = '#39'0'#39
      'UNION'
      'SELECT NULL AS BASE_CALCULO_SDA,'
      '       NULL AS CD_AGENTE,'
      '       NULL AS CD_AGENTE_SEGURO,'
      '       NULL AS CD_ANALISTA_CLIENTE,'
      '       NULL AS CD_ANALISTA_COMISSARIA,'
      '       NULL AS CD_AREA,'
      '       NULL AS CD_ARMADOR,'
      '       NULL AS CD_ARMAZEM_ATRACACAO,'
      '       NULL AS CD_ARMAZEM_DESCARGA,'
      '       NULL AS CD_ARMAZEM_ESTOCAGEM,'
      '       NULL AS CD_ARMAZEM_TABELA_CLIENTE,'
      '       NULL AS CD_BANCO_EXP,'
      '       NULL AS CD_CANAL,'
      '       NULL AS CD_CANCELADOR,'
      '       NULL AS CD_CELULA,'
      '       NULL AS CD_CIA_TRANSP,'
      '       ID.CD_CLIENTE,'
      '       NULL AS CD_CONTATO,'
      '       NULL AS CD_CT_LUCRO,'
      '       NULL AS CD_DESPACHANTE,'
      '       NULL AS CD_DESPACHANTE_SDA,'
      '       NULL AS CD_DESTINO,'
      '       ID.CD_EMBARCACAO AS CD_EMBARCACAO,'
      '       NULL AS CD_EMP_EST,'
      '       NULL AS CD_ESTUFAGEM,'
      '       NULL AS CD_EXPORTADOR,'
      '       NULL AS CD_FRONTEIRA,'
      '       NULL AS CD_GRUPO,'
      '       NULL AS CD_IMP_EXP_FI,'
      '       ID.CD_CLIENTE AS CD_IMPORTADOR,'
      '       NULL AS CD_INCOTERM,'
      '       NULL AS CD_LIBERADOR,'
      '       NULL AS CD_LIBERADOR_DI,'
      '       NULL AS CD_LINGUA_PEDIDO,'
      '       NULL AS CD_LOCAL_CONSOLIDACAO,'
      '       NULL AS CD_LOCAL_DESEMBARQUE,'
      '       NULL AS CD_LOCAL_EMBARQUE,'
      '       NULL AS CD_LOCAL_TRANSBORDO,'
      '       NULL AS CD_MOEDA_FRETE,'
      '       NULL AS CD_MOEDA_MLE,'
      '       NULL AS CD_MOEDA_SEGURO,'
      '       NULL AS CD_ORIGEM,'
      '       NULL AS CD_PAIS_DESTINO,'
      '       NULL AS CD_PAIS_ORIGEM,'
      '       NULL AS CD_PRIMEIRO_PORTO_ATRAC,'
      '       '#39'01'#39' AS CD_PRODUTO,'
      '       NULL AS CD_PRODUTO_VINC,'
      '       NULL AS CD_REF_IMP,'
      '       NULL AS CD_REGIME_TRIB,'
      '       NULL AS CD_REPRESENTANTE,'
      '       NULL AS CD_RESTRICAO,'
      '       NULL AS CD_SERVICO,'
      '       NULL AS CD_STATUS_SDA,'
      '       NULL AS CD_TAB_FRETE,'
      '       NULL AS CD_TAB_FRETE_COMPRA,'
      '       NULL AS CD_TAB_FRETE_VENDA,'
      '       NULL AS CD_TAB_SDA,'
      '       NULL AS CD_TERMO_PAGTO,'
      '       NULL AS CD_TP_DTA,'
      '       NULL AS CD_TP_PEDIDO,'
      '       NULL AS CD_TRANSP_NAC,'
      '       NULL AS CD_TRANSP_NAC_DOC,'
      '       NULL AS CD_TRANSPORTADOR,'
      '       NULL AS CD_UNID_NEG,'
      '       NULL AS CD_UNID_NEG_VINC,'
      '       NULL AS CD_USUARIO,'
      '       NULL AS CD_USUARIO_ALTEROU_CANAL,'
      '       NULL AS CD_USUARIO_REPASSA,'
      '       NULL AS CHARGEABLE,'
      '       NULL AS CONDICAO_PAGTO,'
      '       NULL AS CUBAGEM,'
      '       NULL AS DESCR_INGLES,'
      '       NULL AS DESCR_MERCADORIA,'
      '       NULL AS DIAS_CONDICAO_PAGTO,'
      '       ID.DT_CRIACAO AS DT_ABERTURA,'
      '       NULL AS DT_APRESENTACAO,'
      '       NULL AS DT_ATRACACAO,'
      '       NULL AS DT_CANCELAMENTO,'
      '       NULL AS DT_CHEGADA,'
      '       NULL AS DT_CONHECIMENTO,'
      '       NULL AS DT_CONTABIL_LWW,'
      '       NULL AS DT_CRUZE,'
      '       NULL AS DT_DESCARGA,'
      '       NULL AS DT_DESEMBARACO,'
      '       NULL AS DT_DISTRIBUICAO,'
      '       NULL AS DT_EMBARQUE,'
      '       NULL AS DT_ESTOCAGEM,'
      '       NULL AS DT_LIBERACAO,'
      '       NULL AS DT_PEDIDO,'
      '       NULL AS DT_PRESENCA_CARGA,'
      '       NULL AS DT_REC_NUM,'
      '       NULL AS DT_RECEB_DOC,'
      '       NULL AS DT_RECEBIMENTO,'
      '       NULL AS DT_REG_DDE,'
      '       NULL AS DT_SOL_NUM,'
      '       NULL AS DT_VENC_PROCESSO_EXP_TEMP,'
      '       NULL AS DT_VENCTO_ARMAZENAGEM,'
      '       NULL AS HR_ABERTURA,'
      '       NULL AS HR_PEDIDO,'
      '       NULL AS ID_CODIGO_INSTR_DESEMB,'
      '       NULL AS IN_ACCOUNT,'
      '       NULL AS IN_AS_AGREED,'
      '       NULL AS IN_CANCELADO,'
      '       NULL AS IN_CHEQUE_SDA,'
      '       NULL AS IN_CONSOLIDADO,'
      '       NULL AS IN_COURRIER,'
      '       NULL AS IN_CUBAGEM,'
      '       NULL AS IN_DADOS_IGUAIS_ITENS,'
      '       NULL AS IN_DI_LIBERADA,'
      '       NULL AS IN_EDI_BASF,'
      '       NULL AS IN_ENTREPOSTO,'
      '       NULL AS IN_ETIQUETA,'
      '       NULL AS IN_IMP_ARM,'
      '       NULL AS IN_IMPORTANTE,'
      '       NULL AS IN_LIBERADO,'
      '       NULL AS IN_LIQUIDADO,'
      '       NULL AS IN_MERC_PERIGOSA,'
      '       NULL AS IN_PEDIDO,'
      '       NULL AS IN_POR_VEICULO,'
      '       NULL AS IN_PRODUCAO,'
      '       NULL AS IN_PRODUTO_IMPORTADO,'
      '       NULL AS IN_REL_LEAD_TIME,'
      '       NULL AS IN_ROUTING,'
      '       NULL AS IN_SDA_PAGO,'
      '       NULL AS IN_SEGURO,'
      '       NULL AS IN_SELECIONADO,'
      '       NULL AS IN_TRANSMITE_SEM_PREVISAO,'
      '       NULL AS IN_URGENTE,'
      '       NULL AS NM_ATO_DECLARATORIO,'
      '       NULL AS NM_CONEXAO,'
      '       NULL AS NM_EMPRESA_BASF,'
      '       NULL AS NM_LOCAL_NF_LWW,'
      '       NULL AS NM_PLANTA,'
      '       NULL AS NR_AVERBACAO,'
      '       NULL AS NR_CAMINHAO,'
      '       NULL AS NR_CONHECIMENTO,'
      '       NULL AS NR_CONHECIMENTO_MASTER,'
      '       NULL AS NR_CONTA_CONTABIL,'
      '       NULL AS NR_COURRIER,'
      '       NULL AS NR_DA,'
      '       NULL AS NR_DDE,'
      '       NULL AS NR_DESPACHO,'
      '       NULL AS NR_DI,'
      '       NULL AS NR_DI_RETORNO,'
      '       NULL AS NR_DTA,'
      '       NULL AS NR_FATURA,'
      '       NULL AS NR_MANIFESTO,'
      '       NULL AS NR_ORDEM,'
      '       NULL AS NR_PERIODO_ARMAZENAGEM,'
      '       NULL AS NR_PLACA_VEICULO,'
      '       NULL AS NR_PRESENCA_CARGA,'
      '       NULL AS NR_PROC_PARCEIRO,'
      '       NULL AS NR_PROC_RISC,'
      '       ID.ID_CODIGO AS NR_PROCESSO,'
      '       NULL AS NR_PROCESSO_EXP_TEMP,'
      '       NULL AS NR_PROCESSO_OR_ENTREPOSTO,'
      '       NULL AS NR_PROCESSO_VINC,'
      '       NULL AS NR_PROPOSTA,'
      '       NULL AS NR_REF_EXPORTADOR,'
      '       NULL AS NR_REFERENCIA,'
      '       NULL AS NR_VIAGEM,'
      '       NULL AS NR_VIAGEM_ARMADOR,'
      '       NULL AS NR_VOO,'
      '       NULL AS NUM_CE,'
      '       NULL AS OUTRA_TAXA,'
      '       NULL AS OUTRA_TAXA_CUSTO,'
      '       NULL AS QT_DEVOLUCOES,'
      '       NULL AS QT_LANC_FAT,'
      '       NULL AS QT_RECEBIMENTO,'
      '       NULL AS QT_REF_CLIENTE,'
      '       NULL AS QT_SOLINUM,'
      '       NULL AS QTD_VOLUME,'
      '       NULL AS REF_CLIENTE,'
      '       NULL AS TP_BANCO_EXP,'
      '       NULL AS TP_CARGA,'
      '       NULL AS TP_DESEMB_MIC_DTA,'
      '       NULL AS TP_DIVISAO,'
      '       NULL AS TP_ESTUFAGEM,'
      '       NULL AS TP_FREQUENCIA,'
      '       NULL AS TP_FRETE,'
      '       NULL AS TP_MIC_DTA,'
      '       NULL AS TP_PROCESSO,'
      '       --NULL AS TX_DESCR,'
      '       --NULL AS TX_MERCADORIA,'
      '       --NULL AS TX_OBS_INT,'
      '       --NULL AS TX_OBS_LWW,'
      '       --NULL AS TX_OBSERVACOES,'
      '       NULL AS VL_ACCOUNT,'
      '       NULL AS VL_CIF_DOLAR,'
      '       NULL AS VL_CIF_MN,'
      '       NULL AS VL_COMISS_IATA,'
      '       NULL AS VL_COMPL_SDA,'
      '       NULL AS VL_CONTR_ASSIST,'
      '       NULL AS VL_CUSTO_CIA,'
      '       NULL AS VL_DESP_AG,'
      '       NULL AS VL_DESP_BRASIL,'
      '       NULL AS VL_DESP_MASTER,'
      '       NULL AS VL_DESP_REAL,'
      '       NULL AS VL_DIVISAO,'
      '       NULL AS VL_FAT_COMPLEMENTAR,'
      '       NULL AS VL_FRETE,'
      '       NULL AS VL_FRETE_COLLECT_MNEG,'
      '       NULL AS VL_FRETE_CUSTO,'
      '       NULL AS VL_FRETE_INTERNO,'
      '       NULL AS VL_FRETE_MN,'
      '       NULL AS VL_FRETE_PREPAID_MNEG,'
      '       NULL AS VL_FRETE_TNAC_MNEG,'
      '       NULL AS VL_HOUSE,'
      '       NULL AS VL_ICMS_MN,'
      '       NULL AS VL_II_MN,'
      '       NULL AS VL_IPI_MN,'
      '       NULL AS VL_M3,'
      '       NULL AS VL_MERCADORIA,'
      '       NULL AS VL_MLE_MN,'
      '       NULL AS VL_MLE_MNEG,'
      '       NULL AS VL_OTHER_CHARGE,'
      '       NULL AS VL_OTHER_CHARGE_CC,'
      '       NULL AS VL_OTHER_CHARGE_CUSTO,'
      '       NULL AS VL_OVER,'
      '       NULL AS VL_PESO_BRUTO,'
      '       NULL AS VL_PESO_LIQUIDO,'
      '       NULL AS VL_PREMIO_SEGURO,'
      '       NULL AS VL_PROFIT_AGENTE,'
      '       NULL AS VL_PROFIT_BRASIL,'
      '       NULL AS VL_PROFIT_HOUSE,'
      '       NULL AS VL_PROFIT_LIQUIDO,'
      '       NULL AS VL_RATEIO,'
      '       NULL AS VL_RATEIO_DESPESA,'
      '       NULL AS VL_REC_AG,'
      '       NULL AS VL_REC_BR,'
      '       NULL AS VL_SDA,'
      '       NULL AS VL_SEGURO_MN,'
      '       NULL AS VL_SEGURO_MNEG,'
      '       NULL AS VL_TARIFA_FRETE,'
      '       NULL AS VL_TAXA_FRETE,'
      '       NULL AS VL_TT_CUSTO,'
      '       NULL AS VL_TT_PROF_AG,'
      '       NULL AS VL_TT_PROF_BR,'
      '       NULL AS VL_TT_VENDA,'
      '       NULL AS VL_VENDA_BRASIL,'
      '       NULL AS VL_VENDA_CIA,'
      '       ISNULL(EN.NM_EMPRESA, EE.NM_EMPRESA) AS NM_EMPRESA'
      'FROM TINSTRUCAO_DESEMBARACO ID'
      '   LEFT JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = ID.CD_CLIENTE'
      '   LEFT JOIN TEMPRESA_EST EE ON EE.CD_EMPRESA = ID.CD_CLIENTE'
      'WHERE ID_CODIGO = :ID_CODIGO'
      '  AND IN_AUTORIZADO = '#39'0'#39)
    Left = 168
    Top = 136
    object qryProcessoBASE_CALCULO_SDA: TFloatField
      FieldName = 'BASE_CALCULO_SDA'
      ReadOnly = True
    end
    object qryProcessoCD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_AGENTE_SEGURO: TStringField
      FieldName = 'CD_AGENTE_SEGURO'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object qryProcessoCD_ANALISTA_CLIENTE: TStringField
      FieldName = 'CD_ANALISTA_CLIENTE'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_ANALISTA_COMISSARIA: TStringField
      FieldName = 'CD_ANALISTA_COMISSARIA'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_AREA: TStringField
      FieldName = 'CD_AREA'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qryProcessoCD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_ARMAZEM_ATRACACAO: TStringField
      FieldName = 'CD_ARMAZEM_ATRACACAO'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_ARMAZEM_DESCARGA: TStringField
      FieldName = 'CD_ARMAZEM_DESCARGA'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_ARMAZEM_ESTOCAGEM: TStringField
      FieldName = 'CD_ARMAZEM_ESTOCAGEM'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_ARMAZEM_TABELA_CLIENTE: TIntegerField
      FieldName = 'CD_ARMAZEM_TABELA_CLIENTE'
      ReadOnly = True
    end
    object qryProcessoCD_BANCO_EXP: TStringField
      FieldName = 'CD_BANCO_EXP'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object qryProcessoCD_CANAL: TStringField
      FieldName = 'CD_CANAL'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoCD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_CELULA: TStringField
      FieldName = 'CD_CELULA'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qryProcessoCD_CIA_TRANSP: TStringField
      FieldName = 'CD_CIA_TRANSP'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object qryProcessoCD_CONTATO: TStringField
      FieldName = 'CD_CONTATO'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_CT_LUCRO: TStringField
      FieldName = 'CD_CT_LUCRO'
      ReadOnly = True
      Size = 25
    end
    object qryProcessoCD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_DESPACHANTE_SDA: TStringField
      FieldName = 'CD_DESPACHANTE_SDA'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_EMP_EST: TStringField
      FieldName = 'CD_EMP_EST'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object qryProcessoCD_ESTUFAGEM: TStringField
      FieldName = 'CD_ESTUFAGEM'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object qryProcessoCD_FRONTEIRA: TStringField
      FieldName = 'CD_FRONTEIRA'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_IMP_EXP_FI: TStringField
      FieldName = 'CD_IMP_EXP_FI'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object qryProcessoCD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object qryProcessoCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_LIBERADOR: TStringField
      FieldName = 'CD_LIBERADOR'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_LIBERADOR_DI: TStringField
      FieldName = 'CD_LIBERADOR_DI'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoCD_LOCAL_CONSOLIDACAO: TStringField
      FieldName = 'CD_LOCAL_CONSOLIDACAO'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_LOCAL_TRANSBORDO: TStringField
      FieldName = 'CD_LOCAL_TRANSBORDO'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_PAIS_DESTINO: TStringField
      FieldName = 'CD_PAIS_DESTINO'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_PRIMEIRO_PORTO_ATRAC: TStringField
      FieldName = 'CD_PRIMEIRO_PORTO_ATRAC'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      ReadOnly = True
      Size = 2
    end
    object qryProcessoCD_PRODUTO_VINC: TStringField
      FieldName = 'CD_PRODUTO_VINC'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qryProcessoCD_REF_IMP: TStringField
      FieldName = 'CD_REF_IMP'
      ReadOnly = True
      Size = 15
    end
    object qryProcessoCD_REGIME_TRIB: TStringField
      FieldName = 'CD_REGIME_TRIB'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoCD_REPRESENTANTE: TStringField
      FieldName = 'CD_REPRESENTANTE'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object qryProcessoCD_RESTRICAO: TStringField
      FieldName = 'CD_RESTRICAO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_STATUS_SDA: TStringField
      FieldName = 'CD_STATUS_SDA'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoCD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object qryProcessoCD_TAB_FRETE_COMPRA: TStringField
      FieldName = 'CD_TAB_FRETE_COMPRA'
      ReadOnly = True
      FixedChar = True
      Size = 6
    end
    object qryProcessoCD_TAB_FRETE_VENDA: TStringField
      FieldName = 'CD_TAB_FRETE_VENDA'
      ReadOnly = True
      FixedChar = True
      Size = 6
    end
    object qryProcessoCD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_TERMO_PAGTO: TStringField
      FieldName = 'CD_TERMO_PAGTO'
      ReadOnly = True
      FixedChar = True
      Size = 6
    end
    object qryProcessoCD_TP_DTA: TStringField
      FieldName = 'CD_TP_DTA'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoCD_TP_PEDIDO: TStringField
      FieldName = 'CD_TP_PEDIDO'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryProcessoCD_TRANSP_NAC: TStringField
      FieldName = 'CD_TRANSP_NAC'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_TRANSP_NAC_DOC: TStringField
      FieldName = 'CD_TRANSP_NAC_DOC'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_TRANSPORTADOR: TStringField
      FieldName = 'CD_TRANSPORTADOR'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qryProcessoCD_UNID_NEG_VINC: TStringField
      FieldName = 'CD_UNID_NEG_VINC'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qryProcessoCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_USUARIO_ALTEROU_CANAL: TStringField
      FieldName = 'CD_USUARIO_ALTEROU_CANAL'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCD_USUARIO_REPASSA: TStringField
      FieldName = 'CD_USUARIO_REPASSA'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoCHARGEABLE: TFloatField
      FieldName = 'CHARGEABLE'
      ReadOnly = True
    end
    object qryProcessoCONDICAO_PAGTO: TStringField
      FieldName = 'CONDICAO_PAGTO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoCUBAGEM: TFloatField
      FieldName = 'CUBAGEM'
      ReadOnly = True
    end
    object qryProcessoDESCR_INGLES: TStringField
      FieldName = 'DESCR_INGLES'
      ReadOnly = True
      Size = 50
    end
    object qryProcessoDESCR_MERCADORIA: TStringField
      FieldName = 'DESCR_MERCADORIA'
      ReadOnly = True
      Size = 100
    end
    object qryProcessoDIAS_CONDICAO_PAGTO: TStringField
      FieldName = 'DIAS_CONDICAO_PAGTO'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryProcessoDT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      ReadOnly = True
    end
    object qryProcessoDT_APRESENTACAO: TDateTimeField
      FieldName = 'DT_APRESENTACAO'
      ReadOnly = True
    end
    object qryProcessoDT_ATRACACAO: TDateTimeField
      FieldName = 'DT_ATRACACAO'
      ReadOnly = True
    end
    object qryProcessoDT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      ReadOnly = True
    end
    object qryProcessoDT_CHEGADA: TDateTimeField
      FieldName = 'DT_CHEGADA'
      ReadOnly = True
    end
    object qryProcessoDT_CONHECIMENTO: TDateTimeField
      FieldName = 'DT_CONHECIMENTO'
      ReadOnly = True
    end
    object qryProcessoDT_CONTABIL_LWW: TDateTimeField
      FieldName = 'DT_CONTABIL_LWW'
      ReadOnly = True
    end
    object qryProcessoDT_CRUZE: TDateTimeField
      FieldName = 'DT_CRUZE'
      ReadOnly = True
    end
    object qryProcessoDT_DESCARGA: TDateTimeField
      FieldName = 'DT_DESCARGA'
      ReadOnly = True
    end
    object qryProcessoDT_DESEMBARACO: TDateTimeField
      FieldName = 'DT_DESEMBARACO'
      ReadOnly = True
    end
    object qryProcessoDT_DISTRIBUICAO: TDateTimeField
      FieldName = 'DT_DISTRIBUICAO'
      ReadOnly = True
    end
    object qryProcessoDT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      ReadOnly = True
    end
    object qryProcessoDT_ESTOCAGEM: TDateTimeField
      FieldName = 'DT_ESTOCAGEM'
      ReadOnly = True
    end
    object qryProcessoDT_LIBERACAO: TDateTimeField
      FieldName = 'DT_LIBERACAO'
      ReadOnly = True
    end
    object qryProcessoDT_PEDIDO: TDateTimeField
      FieldName = 'DT_PEDIDO'
      ReadOnly = True
    end
    object qryProcessoDT_PRESENCA_CARGA: TDateTimeField
      FieldName = 'DT_PRESENCA_CARGA'
      ReadOnly = True
    end
    object qryProcessoDT_REC_NUM: TDateTimeField
      FieldName = 'DT_REC_NUM'
      ReadOnly = True
    end
    object qryProcessoDT_RECEB_DOC: TDateTimeField
      FieldName = 'DT_RECEB_DOC'
      ReadOnly = True
    end
    object qryProcessoDT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
      ReadOnly = True
    end
    object qryProcessoDT_REG_DDE: TDateTimeField
      FieldName = 'DT_REG_DDE'
      ReadOnly = True
    end
    object qryProcessoDT_SOL_NUM: TDateTimeField
      FieldName = 'DT_SOL_NUM'
      ReadOnly = True
    end
    object qryProcessoDT_VENC_PROCESSO_EXP_TEMP: TDateTimeField
      FieldName = 'DT_VENC_PROCESSO_EXP_TEMP'
      ReadOnly = True
    end
    object qryProcessoDT_VENCTO_ARMAZENAGEM: TDateTimeField
      FieldName = 'DT_VENCTO_ARMAZENAGEM'
      ReadOnly = True
    end
    object qryProcessoHR_ABERTURA: TDateTimeField
      FieldName = 'HR_ABERTURA'
      ReadOnly = True
    end
    object qryProcessoHR_PEDIDO: TDateTimeField
      FieldName = 'HR_PEDIDO'
      ReadOnly = True
    end
    object qryProcessoID_CODIGO_INSTR_DESEMB: TStringField
      FieldName = 'ID_CODIGO_INSTR_DESEMB'
      ReadOnly = True
      FixedChar = True
      Size = 13
    end
    object qryProcessoIN_ACCOUNT: TStringField
      FieldName = 'IN_ACCOUNT'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_AS_AGREED: TStringField
      FieldName = 'IN_AS_AGREED'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_CHEQUE_SDA: TStringField
      FieldName = 'IN_CHEQUE_SDA'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_CONSOLIDADO: TStringField
      FieldName = 'IN_CONSOLIDADO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_COURRIER: TStringField
      FieldName = 'IN_COURRIER'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_CUBAGEM: TStringField
      FieldName = 'IN_CUBAGEM'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_DADOS_IGUAIS_ITENS: TStringField
      FieldName = 'IN_DADOS_IGUAIS_ITENS'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_DI_LIBERADA: TStringField
      FieldName = 'IN_DI_LIBERADA'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_EDI_BASF: TStringField
      FieldName = 'IN_EDI_BASF'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryProcessoIN_ENTREPOSTO: TStringField
      FieldName = 'IN_ENTREPOSTO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_ETIQUETA: TStringField
      FieldName = 'IN_ETIQUETA'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_IMP_ARM: TStringField
      FieldName = 'IN_IMP_ARM'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_IMPORTANTE: TStringField
      FieldName = 'IN_IMPORTANTE'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_LIQUIDADO: TStringField
      FieldName = 'IN_LIQUIDADO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_MERC_PERIGOSA: TStringField
      FieldName = 'IN_MERC_PERIGOSA'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_PEDIDO: TStringField
      FieldName = 'IN_PEDIDO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_POR_VEICULO: TStringField
      FieldName = 'IN_POR_VEICULO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_PRODUCAO: TStringField
      FieldName = 'IN_PRODUCAO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_PRODUTO_IMPORTADO: TStringField
      FieldName = 'IN_PRODUTO_IMPORTADO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_REL_LEAD_TIME: TStringField
      FieldName = 'IN_REL_LEAD_TIME'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_ROUTING: TStringField
      FieldName = 'IN_ROUTING'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_SDA_PAGO: TStringField
      FieldName = 'IN_SDA_PAGO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_SEGURO: TStringField
      FieldName = 'IN_SEGURO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_TRANSMITE_SEM_PREVISAO: TStringField
      FieldName = 'IN_TRANSMITE_SEM_PREVISAO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoIN_URGENTE: TStringField
      FieldName = 'IN_URGENTE'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoNM_ATO_DECLARATORIO: TStringField
      FieldName = 'NM_ATO_DECLARATORIO'
      ReadOnly = True
      Size = 40
    end
    object qryProcessoNM_CONEXAO: TStringField
      FieldName = 'NM_CONEXAO'
      ReadOnly = True
      FixedChar = True
      Size = 18
    end
    object qryProcessoNM_EMPRESA_BASF: TStringField
      FieldName = 'NM_EMPRESA_BASF'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoNM_LOCAL_NF_LWW: TStringField
      FieldName = 'NM_LOCAL_NF_LWW'
      ReadOnly = True
    end
    object qryProcessoNM_PLANTA: TStringField
      FieldName = 'NM_PLANTA'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object qryProcessoNR_AVERBACAO: TStringField
      FieldName = 'NR_AVERBACAO'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object qryProcessoNR_CAMINHAO: TStringField
      FieldName = 'NR_CAMINHAO'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object qryProcessoNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object qryProcessoNR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object qryProcessoNR_CONTA_CONTABIL: TStringField
      FieldName = 'NR_CONTA_CONTABIL'
      ReadOnly = True
      Size = 40
    end
    object qryProcessoNR_COURRIER: TStringField
      FieldName = 'NR_COURRIER'
      ReadOnly = True
      Size = 15
    end
    object qryProcessoNR_DA: TStringField
      FieldName = 'NR_DA'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object qryProcessoNR_DDE: TStringField
      FieldName = 'NR_DDE'
      ReadOnly = True
      FixedChar = True
      Size = 11
    end
    object qryProcessoNR_DESPACHO: TStringField
      FieldName = 'NR_DESPACHO'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object qryProcessoNR_DI: TStringField
      FieldName = 'NR_DI'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object qryProcessoNR_DI_RETORNO: TStringField
      FieldName = 'NR_DI_RETORNO'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object qryProcessoNR_DTA: TStringField
      FieldName = 'NR_DTA'
      ReadOnly = True
      Size = 10
    end
    object qryProcessoNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      ReadOnly = True
      Size = 30
    end
    object qryProcessoNR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object qryProcessoNR_ORDEM: TStringField
      FieldName = 'NR_ORDEM'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object qryProcessoNR_PERIODO_ARMAZENAGEM: TIntegerField
      FieldName = 'NR_PERIODO_ARMAZENAGEM'
      ReadOnly = True
    end
    object qryProcessoNR_PLACA_VEICULO: TStringField
      FieldName = 'NR_PLACA_VEICULO'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object qryProcessoNR_PRESENCA_CARGA: TStringField
      FieldName = 'NR_PRESENCA_CARGA'
      ReadOnly = True
      FixedChar = True
      Size = 36
    end
    object qryProcessoNR_PROC_PARCEIRO: TStringField
      FieldName = 'NR_PROC_PARCEIRO'
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
    object qryProcessoNR_PROC_RISC: TStringField
      FieldName = 'NR_PROC_RISC'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object qryProcessoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      ReadOnly = True
      FixedChar = True
      Size = 18
    end
    object qryProcessoNR_PROCESSO_EXP_TEMP: TStringField
      FieldName = 'NR_PROCESSO_EXP_TEMP'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object qryProcessoNR_PROCESSO_OR_ENTREPOSTO: TStringField
      FieldName = 'NR_PROCESSO_OR_ENTREPOSTO'
      ReadOnly = True
      FixedChar = True
      Size = 18
    end
    object qryProcessoNR_PROCESSO_VINC: TStringField
      FieldName = 'NR_PROCESSO_VINC'
      ReadOnly = True
      FixedChar = True
      Size = 14
    end
    object qryProcessoNR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      ReadOnly = True
      FixedChar = True
    end
    object qryProcessoNR_REF_EXPORTADOR: TStringField
      FieldName = 'NR_REF_EXPORTADOR'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object qryProcessoNR_REFERENCIA: TStringField
      FieldName = 'NR_REFERENCIA'
      ReadOnly = True
      FixedChar = True
      Size = 18
    end
    object qryProcessoNR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object qryProcessoNR_VIAGEM_ARMADOR: TStringField
      FieldName = 'NR_VIAGEM_ARMADOR'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object qryProcessoNR_VOO: TStringField
      FieldName = 'NR_VOO'
      ReadOnly = True
      FixedChar = True
      Size = 18
    end
    object qryProcessoNUM_CE: TStringField
      FieldName = 'NUM_CE'
      ReadOnly = True
      FixedChar = True
    end
    object qryProcessoOUTRA_TAXA: TFloatField
      FieldName = 'OUTRA_TAXA'
      ReadOnly = True
    end
    object qryProcessoOUTRA_TAXA_CUSTO: TFloatField
      FieldName = 'OUTRA_TAXA_CUSTO'
      ReadOnly = True
    end
    object qryProcessoQT_DEVOLUCOES: TIntegerField
      FieldName = 'QT_DEVOLUCOES'
      ReadOnly = True
    end
    object qryProcessoQT_LANC_FAT: TIntegerField
      FieldName = 'QT_LANC_FAT'
      ReadOnly = True
    end
    object qryProcessoQT_RECEBIMENTO: TIntegerField
      FieldName = 'QT_RECEBIMENTO'
      ReadOnly = True
    end
    object qryProcessoQT_REF_CLIENTE: TIntegerField
      FieldName = 'QT_REF_CLIENTE'
      ReadOnly = True
    end
    object qryProcessoQT_SOLINUM: TIntegerField
      FieldName = 'QT_SOLINUM'
      ReadOnly = True
    end
    object qryProcessoQTD_VOLUME: TFloatField
      FieldName = 'QTD_VOLUME'
      ReadOnly = True
    end
    object qryProcessoREF_CLIENTE: TStringField
      FieldName = 'REF_CLIENTE'
      ReadOnly = True
      FixedChar = True
    end
    object qryProcessoTP_BANCO_EXP: TStringField
      FieldName = 'TP_BANCO_EXP'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoTP_CARGA: TStringField
      FieldName = 'TP_CARGA'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoTP_DESEMB_MIC_DTA: TStringField
      FieldName = 'TP_DESEMB_MIC_DTA'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoTP_DIVISAO: TStringField
      FieldName = 'TP_DIVISAO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoTP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoTP_FREQUENCIA: TStringField
      FieldName = 'TP_FREQUENCIA'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoTP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoTP_MIC_DTA: TStringField
      FieldName = 'TP_MIC_DTA'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoTP_PROCESSO: TStringField
      FieldName = 'TP_PROCESSO'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProcessoVL_ACCOUNT: TFloatField
      FieldName = 'VL_ACCOUNT'
      ReadOnly = True
    end
    object qryProcessoVL_CIF_DOLAR: TFloatField
      FieldName = 'VL_CIF_DOLAR'
      ReadOnly = True
    end
    object qryProcessoVL_CIF_MN: TFloatField
      FieldName = 'VL_CIF_MN'
      ReadOnly = True
    end
    object qryProcessoVL_COMISS_IATA: TFloatField
      FieldName = 'VL_COMISS_IATA'
      ReadOnly = True
    end
    object qryProcessoVL_COMPL_SDA: TFloatField
      FieldName = 'VL_COMPL_SDA'
      ReadOnly = True
    end
    object qryProcessoVL_CONTR_ASSIST: TFloatField
      FieldName = 'VL_CONTR_ASSIST'
      ReadOnly = True
    end
    object qryProcessoVL_CUSTO_CIA: TFloatField
      FieldName = 'VL_CUSTO_CIA'
      ReadOnly = True
    end
    object qryProcessoVL_DESP_AG: TFloatField
      FieldName = 'VL_DESP_AG'
      ReadOnly = True
    end
    object qryProcessoVL_DESP_BRASIL: TFloatField
      FieldName = 'VL_DESP_BRASIL'
      ReadOnly = True
    end
    object qryProcessoVL_DESP_MASTER: TFloatField
      FieldName = 'VL_DESP_MASTER'
      ReadOnly = True
    end
    object qryProcessoVL_DESP_REAL: TFloatField
      FieldName = 'VL_DESP_REAL'
      ReadOnly = True
    end
    object qryProcessoVL_DIVISAO: TFloatField
      FieldName = 'VL_DIVISAO'
      ReadOnly = True
    end
    object qryProcessoVL_FAT_COMPLEMENTAR: TFloatField
      FieldName = 'VL_FAT_COMPLEMENTAR'
      ReadOnly = True
    end
    object qryProcessoVL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      ReadOnly = True
    end
    object qryProcessoVL_FRETE_COLLECT_MNEG: TFloatField
      FieldName = 'VL_FRETE_COLLECT_MNEG'
      ReadOnly = True
    end
    object qryProcessoVL_FRETE_CUSTO: TFloatField
      FieldName = 'VL_FRETE_CUSTO'
      ReadOnly = True
    end
    object qryProcessoVL_FRETE_INTERNO: TFloatField
      FieldName = 'VL_FRETE_INTERNO'
      ReadOnly = True
    end
    object qryProcessoVL_FRETE_MN: TFloatField
      FieldName = 'VL_FRETE_MN'
      ReadOnly = True
    end
    object qryProcessoVL_FRETE_PREPAID_MNEG: TFloatField
      FieldName = 'VL_FRETE_PREPAID_MNEG'
      ReadOnly = True
    end
    object qryProcessoVL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
      ReadOnly = True
    end
    object qryProcessoVL_HOUSE: TFloatField
      FieldName = 'VL_HOUSE'
      ReadOnly = True
    end
    object qryProcessoVL_ICMS_MN: TFloatField
      FieldName = 'VL_ICMS_MN'
      ReadOnly = True
    end
    object qryProcessoVL_II_MN: TFloatField
      FieldName = 'VL_II_MN'
      ReadOnly = True
    end
    object qryProcessoVL_IPI_MN: TFloatField
      FieldName = 'VL_IPI_MN'
      ReadOnly = True
    end
    object qryProcessoVL_M3: TFloatField
      FieldName = 'VL_M3'
      ReadOnly = True
    end
    object qryProcessoVL_MERCADORIA: TFloatField
      FieldName = 'VL_MERCADORIA'
      ReadOnly = True
    end
    object qryProcessoVL_MLE_MN: TFloatField
      FieldName = 'VL_MLE_MN'
      ReadOnly = True
    end
    object qryProcessoVL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      ReadOnly = True
    end
    object qryProcessoVL_OTHER_CHARGE: TFloatField
      FieldName = 'VL_OTHER_CHARGE'
      ReadOnly = True
    end
    object qryProcessoVL_OTHER_CHARGE_CC: TFloatField
      FieldName = 'VL_OTHER_CHARGE_CC'
      ReadOnly = True
    end
    object qryProcessoVL_OTHER_CHARGE_CUSTO: TFloatField
      FieldName = 'VL_OTHER_CHARGE_CUSTO'
      ReadOnly = True
    end
    object qryProcessoVL_OVER: TFloatField
      FieldName = 'VL_OVER'
      ReadOnly = True
    end
    object qryProcessoVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      ReadOnly = True
    end
    object qryProcessoVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      ReadOnly = True
    end
    object qryProcessoVL_PREMIO_SEGURO: TFloatField
      FieldName = 'VL_PREMIO_SEGURO'
      ReadOnly = True
    end
    object qryProcessoVL_PROFIT_AGENTE: TFloatField
      FieldName = 'VL_PROFIT_AGENTE'
      ReadOnly = True
    end
    object qryProcessoVL_PROFIT_BRASIL: TFloatField
      FieldName = 'VL_PROFIT_BRASIL'
      ReadOnly = True
    end
    object qryProcessoVL_PROFIT_HOUSE: TFloatField
      FieldName = 'VL_PROFIT_HOUSE'
      ReadOnly = True
    end
    object qryProcessoVL_PROFIT_LIQUIDO: TFloatField
      FieldName = 'VL_PROFIT_LIQUIDO'
      ReadOnly = True
    end
    object qryProcessoVL_RATEIO: TFloatField
      FieldName = 'VL_RATEIO'
      ReadOnly = True
    end
    object qryProcessoVL_RATEIO_DESPESA: TFloatField
      FieldName = 'VL_RATEIO_DESPESA'
      ReadOnly = True
    end
    object qryProcessoVL_REC_AG: TFloatField
      FieldName = 'VL_REC_AG'
      ReadOnly = True
    end
    object qryProcessoVL_REC_BR: TFloatField
      FieldName = 'VL_REC_BR'
      ReadOnly = True
    end
    object qryProcessoVL_SDA: TFloatField
      FieldName = 'VL_SDA'
      ReadOnly = True
    end
    object qryProcessoVL_SEGURO_MN: TFloatField
      FieldName = 'VL_SEGURO_MN'
      ReadOnly = True
    end
    object qryProcessoVL_SEGURO_MNEG: TFloatField
      FieldName = 'VL_SEGURO_MNEG'
      ReadOnly = True
    end
    object qryProcessoVL_TARIFA_FRETE: TFloatField
      FieldName = 'VL_TARIFA_FRETE'
      ReadOnly = True
    end
    object qryProcessoVL_TAXA_FRETE: TFloatField
      FieldName = 'VL_TAXA_FRETE'
      ReadOnly = True
    end
    object qryProcessoVL_TT_CUSTO: TFloatField
      FieldName = 'VL_TT_CUSTO'
      ReadOnly = True
    end
    object qryProcessoVL_TT_PROF_AG: TFloatField
      FieldName = 'VL_TT_PROF_AG'
      ReadOnly = True
    end
    object qryProcessoVL_TT_PROF_BR: TFloatField
      FieldName = 'VL_TT_PROF_BR'
      ReadOnly = True
    end
    object qryProcessoVL_TT_VENDA: TFloatField
      FieldName = 'VL_TT_VENDA'
      ReadOnly = True
    end
    object qryProcessoVL_VENDA_BRASIL: TFloatField
      FieldName = 'VL_VENDA_BRASIL'
      ReadOnly = True
    end
    object qryProcessoVL_VENDA_CIA: TFloatField
      FieldName = 'VL_VENDA_CIA'
      ReadOnly = True
    end
    object qryProcessoNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      ReadOnly = True
      Size = 80
    end
  end
  object qryTipoArquivo: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_TABELA'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CD_CARGO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 3
        Value = Null
      end
      item
        Name = 'CD_PRODUTO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'SELECT TDD.CD_TIPO_DOCTO,'
      '       TDD.CD_PRODUTO,'
      '       TDD.IN_MULTIPLOS_ARQ,'
      '       TDD.NM_PREFIXO_ARQ,'
      '       TDD.IN_ENVIA_WEB,'
      '       TDD.ID_TABELA,'
      '       CASE TDD.IN_ENVIA_WEB'
      
        '           WHEN '#39'1'#39' THEN TDD.NM_TIPO_DOCTO + '#39' - '#39' + '#39'[Este tipo' +
        ' de documento migra diretamente para a web]'#39
      '       ELSE TDD.NM_TIPO_DOCTO'
      '       END AS NM_TIPO_DOCTO,'
      '       CASE TDD.IN_ENVIA_WEB'
      
        '           WHEN '#39'1'#39' THEN '#39'<b>'#39' + TDD.NM_TIPO_DOCTO + '#39'</b> - '#39' +' +
        ' '#39'[Este tipo de documento migra diretamente para a web]'#39
      '       ELSE '#39'<b>'#39' + TDD.NM_TIPO_DOCTO + '#39'</b>'#39
      '       END AS NM_TIPO_DOCTO_HTML,'
      '       CAD.IN_VISUALIZACAO,'
      '       CAD.IN_ALTERACAO'
      'FROM TTP_DOCTO_DIGITALIZADO TDD'
      
        '   INNER JOIN TCONTROLE_ACESSO_DIGITALIZACAO CAD ON CAD.ID_TABEL' +
        'A     = TDD.ID_TABELA'
      
        '                                                AND CAD.CD_TIPO_' +
        'DOCTO = TDD.CD_TIPO_DOCTO'
      
        '                                                AND CAD.CD_TIPO_' +
        'DOCTO = TDD.CD_TIPO_DOCTO'
      'WHERE TDD.ID_TABELA = :ID_TABELA'
      '  AND CAD.CD_CARGO  = :CD_CARGO'
      
        '  AND ((:CD_PRODUTO IN (CD_PRODUTO, '#39'AM'#39')) OR (CD_PRODUTO = '#39'AM'#39 +
        '))'
      'ORDER BY NM_TIPO_DOCTO')
    Left = 168
    Top = 192
    object qryTipoArquivoCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
    end
    object qryTipoArquivoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryTipoArquivoIN_MULTIPLOS_ARQ: TIntegerField
      FieldName = 'IN_MULTIPLOS_ARQ'
    end
    object qryTipoArquivoNM_PREFIXO_ARQ: TStringField
      FieldName = 'NM_PREFIXO_ARQ'
      Size = 4
    end
    object qryTipoArquivoIN_ENVIA_WEB: TStringField
      FieldName = 'IN_ENVIA_WEB'
      FixedChar = True
      Size = 1
    end
    object qryTipoArquivoID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
    end
    object qryTipoArquivoNM_TIPO_DOCTO: TStringField
      FieldName = 'NM_TIPO_DOCTO'
      ReadOnly = True
      Size = 156
    end
    object qryTipoArquivoNM_TIPO_DOCTO_HTML: TStringField
      FieldName = 'NM_TIPO_DOCTO_HTML'
      ReadOnly = True
      Size = 163
    end
    object qryTipoArquivoIN_VISUALIZACAO: TStringField
      FieldName = 'IN_VISUALIZACAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoArquivoIN_ALTERACAO: TStringField
      FieldName = 'IN_ALTERACAO'
      FixedChar = True
      Size = 1
    end
  end
  object qryTabelas: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT TD.NM_EXIBICAO,'
      '       TD.NM_SQL_LOOKUP,'
      '       TD.ID_TABELA,'
      '       ST.NAME AS NM_TABELA,'
      '       SC.NAME AS NM_CAMPO,'
      '       CASE SC.PRECISION'
      '           WHEN 0 THEN '#39'0'#39
      '       ELSE '#39'1'#39
      '       END AS IN_CONVERT,'
      '       CASE SC.PRECISION'
      '           WHEN 0 THEN '#39#39
      '       ELSE CASE SC.SCALE'
      
        '                WHEN 0 THEN '#39'CONVERT(INT, '#39' + SC.NAME + '#39') AS '#39' ' +
        '+ SC.NAME'
      
        '            ELSE '#39'CONVERT(DECIMAL('#39' + CONVERT(VARCHAR, SC.PRECIS' +
        'ION) + '#39', '#39' + CONVERT(VARCHAR, SC.SCALE) + '#39'), '#39' + SC.NAME + '#39') ' +
        'AS '#39' + SC.NAME'
      '            END'
      '       END AS '#39'CONVERT'#39
      
        'FROM TTABELA_DIGITALIZACAO TD INNER JOIN SYS.TABLES ST ON ST.OBJ' +
        'ECT_ID = TD.ID_TABELA'
      
        '   INNER JOIN SYS.COLUMNS SC ON SC.OBJECT_ID = TD.ID_TABELA AND ' +
        'SC.COLUMN_ID = TD.ID_CAMPO'
      'WHERE ST.NAME <> '#39'TPROCESSO'#39
      'ORDER BY TD.NM_EXIBICAO')
    Left = 168
    Top = 253
    object qryTabelasNM_EXIBICAO: TStringField
      FieldName = 'NM_EXIBICAO'
      Size = 100
    end
    object qryTabelasNM_SQL_LOOKUP: TStringField
      FieldName = 'NM_SQL_LOOKUP'
      Size = 2000
    end
    object qryTabelasID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
    end
    object qryTabelasNM_TABELA: TWideStringField
      FieldName = 'NM_TABELA'
      Size = 128
    end
    object qryTabelasNM_CAMPO: TWideStringField
      FieldName = 'NM_CAMPO'
      Size = 128
    end
    object qryTabelasIN_CONVERT: TStringField
      FieldName = 'IN_CONVERT'
      ReadOnly = True
      Size = 1
    end
    object qryTabelasCONVERT: TWideStringField
      FieldName = 'CONVERT'
      ReadOnly = True
      Size = 342
    end
  end
  object qryChaveConsulta: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT '#39#39' AS CODIGO, '#39#39' AS DESCRICAO')
    Left = 168
    Top = 309
    object qryChaveConsultaCODIGO: TStringField
      FieldName = 'CODIGO'
      ReadOnly = True
      Size = 255
    end
    object qryChaveConsultaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ReadOnly = True
      Size = 255
    end
  end
  object qryTabelasVinculadas: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    AfterOpen = qryTabelasVinculadasAfterOpen
    AfterClose = qryTabelasVinculadasAfterClose
    Parameters = <
      item
        Name = 'ID_TABELA_PROCESSO'
        DataType = ftInteger
        Size = -1
        Value = 0
      end>
    SQL.Strings = (
      'SELECT TD.NM_EXIBICAO,'
      '       TD.ID_TABELA,'
      '       SC.NAME AS NM_CAMPO_PROCESSO'
      
        'FROM TTABELA_DIGITALIZACAO TD INNER JOIN SYS.COLUMNS SC ON SC.OB' +
        'JECT_ID = :ID_TABELA_PROCESSO AND SC.COLUMN_ID = TD.ID_CAMPO_PRO' +
        'CESSO'
      'ORDER BY CASE NM_EXIBICAO'
      '             WHEN '#39'PROCESSO'#39' THEN '#39#39
      '         ELSE NM_EXIBICAO'
      '         END')
    Left = 168
    Top = 367
    object qryTabelasVinculadasNM_EXIBICAO: TStringField
      FieldName = 'NM_EXIBICAO'
      Size = 100
    end
    object qryTabelasVinculadasID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
    end
    object qryTabelasVinculadasNM_CAMPO_PROCESSO: TWideStringField
      FieldName = 'NM_CAMPO_PROCESSO'
      Size = 128
    end
  end
  object qryUsuarios: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO  '
      'FROM TUSUARIO (NOLOCK) ')
    Left = 168
    Top = 429
    object qryUsuariosCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryUsuariosNM_USUARIO: TStringField
      DisplayWidth = 50
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
  end
  object dsUsuarios: TDataSource
    DataSet = qryUsuarios
    Left = 53
    Top = 429
  end
  object qryAbreOcorrencia: TADOQuery
    Connection = Connection
    Parameters = <
      item
        Name = 'CD_USUARIO'
        DataType = ftInteger
        Size = -1
        Value = 0
      end
      item
        Name = 'NM_APLICATIVO'
        DataType = ftString
        Size = 100
        Value = ''
      end
      item
        Name = 'NM_MOTIVO'
        DataType = ftString
        Size = 8000
        Value = ''
      end
      item
        Name = 'NM_ERRO'
        DataType = ftString
        Size = 80
        Value = ''
      end>
    SQL.Strings = (
      'DECLARE @RETORNO           INT'
      'DECLARE @CD_OCORRENCIA     VARCHAR(20)'
      'DECLARE @CD_PRE_OCORRENCIA VARCHAR(20)'
      ''
      
        'EXEC @RETORNO = SUPORTE.DBO.SP_CRIA_PRE_OCORRENCIA :CD_USUARIO, ' +
        ':NM_APLICATIVO, :NM_MOTIVO, :NM_ERRO, @CD_OCORRENCIA OUTPUT, @CD' +
        '_PRE_OCORRENCIA OUTPUT'
      ''
      
        'SELECT @RETORNO AS CD_RETORNO, @CD_OCORRENCIA AS CD_OCORRENCIA, ' +
        '@CD_PRE_OCORRENCIA AS CD_PRE_OCORRENCIA')
    Left = 279
    Top = 91
    object qryAbreOcorrenciaCD_RETORNO: TIntegerField
      FieldName = 'CD_RETORNO'
      ReadOnly = True
    end
    object qryAbreOcorrenciaCD_OCORRENCIA: TStringField
      FieldName = 'CD_OCORRENCIA'
      ReadOnly = True
    end
    object qryAbreOcorrenciaCD_PRE_OCORRENCIA: TStringField
      FieldName = 'CD_PRE_OCORRENCIA'
      ReadOnly = True
    end
  end
  object qryClientes: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT CD_EMPRESA AS CD_CLIENTE,'
      
        '       RTRIM(NM_EMPRESA) + '#39' ('#39' +  SUBSTRING(CGC_EMPRESA, 1, 2) ' +
        '+ '#39'.'#39' + SUBSTRING(CGC_EMPRESA, 3, 3) + '#39'.'#39' + SUBSTRING(CGC_EMPRE' +
        'SA, 6, 3) + '#39'/'#39' + SUBSTRING(CGC_EMPRESA, 9, 4) + '#39'-'#39' + SUBSTRING' +
        '(CGC_EMPRESA, 13, 2) + '#39')'#39' AS NM_CLIENTE_CNPJ,'
      
        '       RTRIM(AP_EMPRESA) + '#39' ('#39' +  SUBSTRING(CGC_EMPRESA, 1, 2) ' +
        '+ '#39'.'#39' + SUBSTRING(CGC_EMPRESA, 3, 3) + '#39'.'#39' + SUBSTRING(CGC_EMPRE' +
        'SA, 6, 3) + '#39'/'#39' + SUBSTRING(CGC_EMPRESA, 9, 4) + '#39'-'#39' + SUBSTRING' +
        '(CGC_EMPRESA, 13, 2) + '#39')'#39' AS AP_CLIENTE_CNPJ,'
      '       RTRIM(NM_EMPRESA) AS NM_CLIENTE,'
      '       RTRIM(AP_EMPRESA) AS AP_CLIENTE,'
      
        '       SUBSTRING(CGC_EMPRESA, 1, 2) + '#39'.'#39' + SUBSTRING(CGC_EMPRES' +
        'A, 3, 3) + '#39'.'#39' + SUBSTRING(CGC_EMPRESA, 6, 3) + '#39'/'#39' + SUBSTRING(' +
        'CGC_EMPRESA, 9, 4) + '#39'-'#39' + SUBSTRING(CGC_EMPRESA, 13, 2) AS CNPJ' +
        '_CLIENTE'
      'FROM TEMPRESA_NAC'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 168
    Top = 488
    object qryClientesCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qryClientesNM_CLIENTE_CNPJ: TStringField
      FieldName = 'NM_CLIENTE_CNPJ'
      ReadOnly = True
      Size = 101
    end
    object qryClientesAP_CLIENTE_CNPJ: TStringField
      FieldName = 'AP_CLIENTE_CNPJ'
      ReadOnly = True
      Size = 31
    end
    object qryClientesNM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      ReadOnly = True
      Size = 80
    end
    object qryClientesAP_CLIENTE: TStringField
      FieldName = 'AP_CLIENTE'
      ReadOnly = True
      Size = 10
    end
    object qryClientesCNPJ_CLIENTE: TStringField
      FieldName = 'CNPJ_CLIENTE'
      ReadOnly = True
      Size = 18
    end
  end
  object dsClientes: TDataSource
    DataSet = qryClientes
    Left = 56
    Top = 488
  end
  object qryUsuarioLogado: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT CD_USUARIO,'
      '       NM_USUARIO,'
      '       NM_EMAIL,'
      '       CD_CARGO,'
      '       AP_USUARIO AS NM_LOGIN'
      'FROM TUSUARIO'
      'WHERE AP_USUARIO = SUSER_NAME()')
    Left = 279
    Top = 241
    object qryUsuarioLogadoCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryUsuarioLogadoNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
    object qryUsuarioLogadoNM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Size = 2000
    end
    object qryUsuarioLogadoCD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      FixedChar = True
      Size = 3
    end
    object qryUsuarioLogadoNM_LOGIN: TStringField
      FieldName = 'NM_LOGIN'
      FixedChar = True
      Size = 15
    end
  end
  object qryEmail: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      
        'SELECT NM_HOST, NR_PORTA, NM_LOGIN, NM_SENHA, EMAIL_TLS FROM VW_' +
        'CONFIG_MAIL ( NOLOCK )')
    Left = 278
    Top = 23
    object qryEmailNM_HOST: TStringField
      FieldName = 'NM_HOST'
      Size = 100
    end
    object qryEmailNR_PORTA: TIntegerField
      FieldName = 'NR_PORTA'
    end
    object qryEmailNM_LOGIN: TStringField
      FieldName = 'NM_LOGIN'
      Size = 100
    end
    object qryEmailNM_SENHA: TStringField
      FieldName = 'NM_SENHA'
      Size = 100
    end
    object qryEmailEMAIL_TLS: TBooleanField
      FieldName = 'EMAIL_TLS'
    end
  end
  object qryNumeroRelatorios: TADOQuery
    Connection = Connection
    Parameters = <
      item
        Name = 'NR_PROCESSO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = Null
      end
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 19
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'SELECT OBS FROM MYINDAIAV2.DBO.BILLING B'
      
        'LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII ON BII.BILLING' +
        '_ID=B.ID'
      
        'LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED II ON II.ID=BII.ITENSINVOI' +
        'CED_ID'
      
        'LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC ON CC.ID=II.CUSTOMCL' +
        'EARANCE_ID'
      'LEFT JOIN BROKER.DBO.TPROCESSO TP ON TP.NR_PROCESSO=CC.CUSTOMID'
      'WHERE TP.NR_PROCESSO = :NR_PROCESSO and B.id = :ID')
    Left = 378
    Top = 24
    object qryNumeroRelatoriosOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
    end
  end
  object db_broker: TDatabase
    AliasName = 'BROKER'
    DatabaseName = 'DBBROKER'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SA'
      'PASSWORD=123'
      'HOST NAME='
      'DATABASE NAME=BROKER')
    SessionName = 'Default'
    BeforeConnect = db_brokerBeforeConnect
    Left = 348
    Top = 163
  end
  object SQLConnection: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbexpmss.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MSSQL'
      'HostName=INDAIA10'
      'DataBase=BROKER'
      'User_Name=SA'
      'Password=123'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'MSSQL TransIsolation=ReadCommited'
      'OS Authentication=False')
    VendorLib = 'oledb'
    Left = 276
    Top = 163
  end
  object qryUpdateEvento: TADOQuery
    Connection = Connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CD_USUARIO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 4
        Value = Null
      end
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = Null
      end
      item
        Name = 'CD_EVENTO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 3
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE TFOLLOWUP'
      'SET DT_REALIZACAO = GETDATE()'
      ',CD_RESP_REALIZACAO = :CD_USUARIO'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'AND CD_EVENTO = :CD_EVENTO')
    Left = 276
    Top = 329
  end
end

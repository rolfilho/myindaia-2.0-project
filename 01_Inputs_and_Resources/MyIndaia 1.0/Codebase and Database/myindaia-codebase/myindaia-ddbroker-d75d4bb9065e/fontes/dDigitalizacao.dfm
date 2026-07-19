object datmDigitalizacao: TdatmDigitalizacao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 485
  Top = 224
  Height = 442
  Width = 362
  object ds_ListaArquivos: TDataSource
    DataSet = qry_ListaArquivos
    OnStateChange = ds_ListaArquivosStateChange
    Left = 48
    Top = 14
  end
  object qry_ListaArquivos: TQuery
    CachedUpdates = True
    BeforeOpen = qry_ListaArquivosBeforeOpen
    AfterOpen = qry_ListaArquivosAfterOpen
    AfterClose = qry_ListaArquivosAfterClose
    BeforeEdit = qry_ListaArquivosBeforeEdit
    BeforePost = qry_ListaArquivosBeforePost
    OnNewRecord = qry_ListaArquivosNewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT PD.*,'
      '       CAD.IN_VISUALIZACAO,'
      '       CAD.IN_ALTERACAO,'
      '       (SELECT COUNT(*)'
      '        FROM TPROCESSO_DOCTOS PD1'
      '        WHERE PD1.NR_PROCESSO = PD.NR_PROCESSO'
      '          AND PD1.NM_ARQUIVO_PAI = PD.NM_ARQUIVO)+1 AS ARQUIVOS'
      
        'FROM TPROCESSO_DOCTOS PD INNER JOIN TCONTROLE_ACESSO_DIGITALIZAC' +
        'AO CAD ON CAD.ID_TABELA     = PD.ID_TABELA'
      
        '                                                                ' +
        '      AND CAD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO'
      'WHERE NR_PROCESSO                      = :NR_PROCESSO'
      '  AND PD.ID_TABELA                     = :ID_TABELA'
      '  AND CAD.CD_CARGO                     = :CD_CARGO'
      '  AND PD.IN_ATIVO                      = '#39'1'#39
      '  AND ISNULL(CAD.IN_VISUALIZACAO, '#39'0'#39') = '#39'1'#39
      '  AND ISNULL(NM_ARQUIVO_PAI, '#39#39')       = '#39#39)
    UpdateObject = upd_ListaArquivos
    Left = 162
    Top = 14
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 18
        Value = '0101IM-1000-10'
      end
      item
        DataType = ftInteger
        Name = 'ID_TABELA'
        ParamType = ptUnknown
        Value = '1652005462'
      end
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptUnknown
        Value = '001'
      end>
    object qry_ListaArquivosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_ListaArquivosCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
    end
    object qry_ListaArquivosNM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      FixedChar = True
      Size = 80
    end
    object qry_ListaArquivosNM_ARQUIVO: TStringField
      FieldName = 'NM_ARQUIVO'
      FixedChar = True
      Size = 10
    end
    object qry_ListaArquivosCD_USUARIO_CRIACAO: TStringField
      FieldName = 'CD_USUARIO_CRIACAO'
      FixedChar = True
      Size = 4
    end
    object qry_ListaArquivosDT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
    end
    object qry_ListaArquivosCD_USUARIO_ALT: TStringField
      FieldName = 'CD_USUARIO_ALT'
      FixedChar = True
      Size = 4
    end
    object qry_ListaArquivosDT_ALT: TDateTimeField
      FieldName = 'DT_ALT'
    end
    object qry_ListaArquivosIN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_ListaArquivosNM_ARQUIVO_PAI: TStringField
      FieldName = 'NM_ARQUIVO_PAI'
      FixedChar = True
      Size = 10
    end
    object qry_ListaArquivosNM_MOTIVO_ALTERACAO: TStringField
      FieldName = 'NM_MOTIVO_ALTERACAO'
      FixedChar = True
      Size = 255
    end
    object qry_ListaArquivosID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
    end
    object qry_ListaArquivosIN_VISUALIZACAO: TStringField
      FieldName = 'IN_VISUALIZACAO'
      FixedChar = True
      Size = 1
    end
    object qry_ListaArquivosIN_ALTERACAO: TStringField
      FieldName = 'IN_ALTERACAO'
      FixedChar = True
      Size = 1
    end
    object qry_ListaArquivosARQUIVOS: TIntegerField
      FieldName = 'ARQUIVOS'
    end
    object qry_ListaArquivosNM_CRIADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_CRIADOR'
      LookupDataSet = qry_Usuarios
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'NM_USUARIO'
      KeyFields = 'CD_USUARIO_CRIACAO'
      Size = 150
      Lookup = True
    end
    object qry_ListaArquivosNM_ALTERADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_ALTERADOR'
      LookupDataSet = qry_Usuarios
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'NM_USUARIO'
      KeyFields = 'CD_USUARIO_ALT'
      Size = 150
      Lookup = True
    end
    object qry_ListaArquivosNM_TIPO_DOCTO: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_TIPO_DOCTO'
      LookupDataSet = qry_TipoArquivo
      LookupKeyFields = 'CD_TIPO_DOCTO'
      LookupResultField = 'NM_TIPO_DOCTO'
      KeyFields = 'CD_TIPO_DOCTO'
      Size = 150
      Lookup = True
    end
    object qry_ListaArquivosIN_ENVIA_WEB: TStringField
      FieldKind = fkLookup
      FieldName = 'IN_ENVIA_WEB'
      LookupDataSet = qry_TipoArquivo
      LookupKeyFields = 'CD_TIPO_DOCTO'
      LookupResultField = 'IN_ENVIA_WEB'
      KeyFields = 'CD_TIPO_DOCTO'
      Size = 1
      Lookup = True
    end
  end
  object upd_ListaArquivos: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_DOCTOS'
      'set'
      '  CD_TIPO_DOCTO = :CD_TIPO_DOCTO,'
      '  NM_DESCRICAO = :NM_DESCRICAO,'
      '  NM_ARQUIVO = :NM_ARQUIVO,'
      '  CD_USUARIO_CRIACAO = :CD_USUARIO_CRIACAO,'
      '  DT_CRIACAO = :DT_CRIACAO,'
      '  CD_USUARIO_ALT = :CD_USUARIO_ALT,'
      '  DT_ALT = :DT_ALT,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  NM_ARQUIVO_PAI = :NM_ARQUIVO_PAI,'
      '  NM_MOTIVO_ALTERACAO = :NM_MOTIVO_ALTERACAO'
      'where'
      '  ID_TABELA = :OLD_ID_TABELA and'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NM_ARQUIVO = :OLD_NM_ARQUIVO')
    InsertSQL.Strings = (
      'insert into TPROCESSO_DOCTOS'
      
        '  (NR_PROCESSO, CD_TIPO_DOCTO, NM_DESCRICAO, NM_ARQUIVO, CD_USUA' +
        'RIO_CRIACAO, '
      
        '   DT_CRIACAO, CD_USUARIO_ALT, DT_ALT, IN_ATIVO, NM_ARQUIVO_PAI,' +
        ' ID_TABELA)'
      'values'
      
        '  (:NR_PROCESSO, :CD_TIPO_DOCTO, :NM_DESCRICAO, :NM_ARQUIVO, :CD' +
        '_USUARIO_CRIACAO, '
      
        '   :DT_CRIACAO, :CD_USUARIO_ALT, :DT_ALT, :IN_ATIVO, :NM_ARQUIVO' +
        '_PAI, :ID_TABELA)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_DOCTOS'
      'where'
      '  ID_TABELA = :OLD_ID_TABELA and'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NM_ARQUIVO = :OLD_NM_ARQUIVO')
    Left = 258
    Top = 14
  end
  object qry_TipoArquivo: TQuery
    BeforeOpen = qry_TipoArquivoBeforeOpen
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TDD.CD_TIPO_DOCTO,TDD.CD_PRODUTO,TDD.IN_MULTIPLOS_ARQ,TDD' +
        '.NM_PREFIXO_ARQ,TDD.IN_ENVIA_WEB,TDD.ID_TABELA,Case TDD.IN_ENVIA' +
        '_WEB when '#39'1'#39' then TDD.NM_TIPO_DOCTO +'#39' - '#39' +'#39'[Este tipo de docu' +
        'mento migra diretamente para a web]'#39' else TDD.NM_TIPO_DOCTO end ' +
        'as NM_TIPO_DOCTO,'
      ' CAD.IN_VISUALIZACAO, CAD.IN_ALTERACAO'
      
        'FROM TTP_DOCTO_DIGITALIZADO TDD INNER JOIN TCONTROLE_ACESSO_DIGI' +
        'TALIZACAO CAD ON CAD.ID_TABELA     = TDD.ID_TABELA'
      
        '                                                                ' +
        '             AND CAD.CD_TIPO_DOCTO = TDD.CD_TIPO_DOCTO          ' +
        '                                                             AND' +
        ' CAD.CD_TIPO_DOCTO = TDD.CD_TIPO_DOCTO'
      'WHERE TDD.ID_TABELA = :ID_TABELA'
      '  AND CAD.CD_CARGO  = :CD_CARGO'
      
        '  AND ((:CD_PRODUTO = CD_PRODUTO) OR (CD_PRODUTO = '#39'AM'#39') OR (:CD' +
        '_PRODUTO = '#39'AM'#39'))'
      'ORDER BY NM_TIPO_DOCTO')
    Left = 162
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_TABELA'
        ParamType = ptInput
        Value = '1652005462'
      end
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptInput
        Value = '001'
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
        Size = 2
        Value = 'AM'
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_TipoArquivoCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.CD_TIPO_DOCTO'
    end
    object qry_TipoArquivoNM_TIPO_DOCTO: TStringField
      FieldName = 'NM_TIPO_DOCTO'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.NM_TIPO_DOCTO'
      FixedChar = True
      Size = 100
    end
    object qry_TipoArquivoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_TipoArquivoIN_MULTIPLOS_ARQ: TIntegerField
      FieldName = 'IN_MULTIPLOS_ARQ'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.IN_MULTIPLOS_ARQ'
    end
    object qry_TipoArquivoNM_PREFIXO_ARQ: TStringField
      FieldName = 'NM_PREFIXO_ARQ'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.NM_PREFIXO_ARQ'
      FixedChar = True
      Size = 4
    end
    object qry_TipoArquivoIN_ENVIA_WEB: TStringField
      FieldName = 'IN_ENVIA_WEB'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.IN_ENVIA_WEB'
      FixedChar = True
      Size = 1
    end
    object qry_TipoArquivoID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
      Origin = 'DBBROKER.TTP_DOCTO_DIGITALIZADO.ID_TABELA'
    end
    object qry_TipoArquivoIN_VISUALIZACAO: TStringField
      FieldName = 'IN_VISUALIZACAO'
      Origin = 'DBBROKER.TCONTROLE_ACESSO_DIGITALIZACAO.IN_VISUALIZACAO'
      FixedChar = True
      Size = 1
    end
    object qry_TipoArquivoIN_ALTERACAO: TStringField
      FieldName = 'IN_ALTERACAO'
      Origin = 'DBBROKER.TCONTROLE_ACESSO_DIGITALIZACAO.IN_ALTERACAO'
      FixedChar = True
      Size = 1
    end
  end
  object ds_TipoArquivo: TDataSource
    DataSet = qry_TipoArquivo
    Left = 48
    Top = 126
  end
  object qry_Processo: TQuery
    AfterOpen = qry_ProcessoAfterOpen
    AfterClose = qry_ProcessoAfterClose
    DatabaseName = 'DBBROKER'
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
      'WHERE ID_CODIGO = :NR_PROCESSO'
      '  AND IN_AUTORIZADO = '#39'0'#39)
    Left = 162
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_ProcessoBASE_CALCULO_SDA: TFloatField
      FieldName = 'BASE_CALCULO_SDA'
    end
    object qry_ProcessoCD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_AGENTE_SEGURO: TStringField
      FieldName = 'CD_AGENTE_SEGURO'
      FixedChar = True
      Size = 5
    end
    object qry_ProcessoCD_ANALISTA_CLIENTE: TStringField
      FieldName = 'CD_ANALISTA_CLIENTE'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_ANALISTA_COMISSARIA: TStringField
      FieldName = 'CD_ANALISTA_COMISSARIA'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_AREA: TStringField
      FieldName = 'CD_AREA'
      FixedChar = True
      Size = 2
    end
    object qry_ProcessoCD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_ARMAZEM_ATRACACAO: TStringField
      FieldName = 'CD_ARMAZEM_ATRACACAO'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_ARMAZEM_DESCARGA: TStringField
      FieldName = 'CD_ARMAZEM_DESCARGA'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_ARMAZEM_ESTOCAGEM: TStringField
      FieldName = 'CD_ARMAZEM_ESTOCAGEM'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_ARMAZEM_TABELA_CLIENTE: TIntegerField
      FieldName = 'CD_ARMAZEM_TABELA_CLIENTE'
    end
    object qry_ProcessoCD_BANCO_EXP: TStringField
      FieldName = 'CD_BANCO_EXP'
      FixedChar = True
      Size = 5
    end
    object qry_ProcessoCD_CANAL: TStringField
      FieldName = 'CD_CANAL'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoCD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_CELULA: TStringField
      FieldName = 'CD_CELULA'
      FixedChar = True
      Size = 2
    end
    object qry_ProcessoCD_CIA_TRANSP: TStringField
      FieldName = 'CD_CIA_TRANSP'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_ProcessoCD_CONTATO: TStringField
      FieldName = 'CD_CONTATO'
      FixedChar = True
      Size = 3
    end
    object qry_ProcessoCD_CT_LUCRO: TStringField
      FieldName = 'CD_CT_LUCRO'
      FixedChar = True
      Size = 25
    end
    object qry_ProcessoCD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      FixedChar = True
      Size = 3
    end
    object qry_ProcessoCD_DESPACHANTE_SDA: TStringField
      FieldName = 'CD_DESPACHANTE_SDA'
      FixedChar = True
      Size = 3
    end
    object qry_ProcessoCD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_EMP_EST: TStringField
      FieldName = 'CD_EMP_EST'
      FixedChar = True
      Size = 5
    end
    object qry_ProcessoCD_ESTUFAGEM: TStringField
      FieldName = 'CD_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_ProcessoCD_FRONTEIRA: TStringField
      FieldName = 'CD_FRONTEIRA'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_ProcessoCD_IMP_EXP_FI: TStringField
      FieldName = 'CD_IMP_EXP_FI'
      FixedChar = True
      Size = 5
    end
    object qry_ProcessoCD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_ProcessoCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_ProcessoCD_LIBERADOR: TStringField
      FieldName = 'CD_LIBERADOR'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_LIBERADOR_DI: TStringField
      FieldName = 'CD_LIBERADOR_DI'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoCD_LOCAL_CONSOLIDACAO: TStringField
      FieldName = 'CD_LOCAL_CONSOLIDACAO'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_LOCAL_TRANSBORDO: TStringField
      FieldName = 'CD_LOCAL_TRANSBORDO'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
    object qry_ProcessoCD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      FixedChar = True
      Size = 3
    end
    object qry_ProcessoCD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      FixedChar = True
      Size = 3
    end
    object qry_ProcessoCD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_PAIS_DESTINO: TStringField
      FieldName = 'CD_PAIS_DESTINO'
      FixedChar = True
      Size = 3
    end
    object qry_ProcessoCD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_ProcessoCD_PRIMEIRO_PORTO_ATRAC: TStringField
      FieldName = 'CD_PRIMEIRO_PORTO_ATRAC'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_ProcessoCD_PRODUTO_VINC: TStringField
      FieldName = 'CD_PRODUTO_VINC'
      FixedChar = True
      Size = 2
    end
    object qry_ProcessoCD_REF_IMP: TStringField
      FieldName = 'CD_REF_IMP'
      FixedChar = True
      Size = 15
    end
    object qry_ProcessoCD_REGIME_TRIB: TStringField
      FieldName = 'CD_REGIME_TRIB'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoCD_REPRESENTANTE: TStringField
      FieldName = 'CD_REPRESENTANTE'
      FixedChar = True
      Size = 5
    end
    object qry_ProcessoCD_RESTRICAO: TStringField
      FieldName = 'CD_RESTRICAO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_ProcessoCD_STATUS_SDA: TStringField
      FieldName = 'CD_STATUS_SDA'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoCD_TAB_FRETE: TStringField
      FieldName = 'CD_TAB_FRETE'
      FixedChar = True
      Size = 5
    end
    object qry_ProcessoCD_TAB_FRETE_COMPRA: TStringField
      FieldName = 'CD_TAB_FRETE_COMPRA'
      FixedChar = True
      Size = 6
    end
    object qry_ProcessoCD_TAB_FRETE_VENDA: TStringField
      FieldName = 'CD_TAB_FRETE_VENDA'
      FixedChar = True
      Size = 6
    end
    object qry_ProcessoCD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      FixedChar = True
      Size = 3
    end
    object qry_ProcessoCD_TERMO_PAGTO: TStringField
      FieldName = 'CD_TERMO_PAGTO'
      FixedChar = True
      Size = 6
    end
    object qry_ProcessoCD_TP_DTA: TStringField
      FieldName = 'CD_TP_DTA'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoCD_TP_PEDIDO: TStringField
      FieldName = 'CD_TP_PEDIDO'
      FixedChar = True
      Size = 3
    end
    object qry_ProcessoCD_TRANSP_NAC: TStringField
      FieldName = 'CD_TRANSP_NAC'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_TRANSP_NAC_DOC: TStringField
      FieldName = 'CD_TRANSP_NAC_DOC'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_TRANSPORTADOR: TStringField
      FieldName = 'CD_TRANSPORTADOR'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_ProcessoCD_UNID_NEG_VINC: TStringField
      FieldName = 'CD_UNID_NEG_VINC'
      FixedChar = True
      Size = 2
    end
    object qry_ProcessoCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_USUARIO_ALTEROU_CANAL: TStringField
      FieldName = 'CD_USUARIO_ALTEROU_CANAL'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCD_USUARIO_REPASSA: TStringField
      FieldName = 'CD_USUARIO_REPASSA'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoCHARGEABLE: TFloatField
      FieldName = 'CHARGEABLE'
    end
    object qry_ProcessoCONDICAO_PAGTO: TStringField
      FieldName = 'CONDICAO_PAGTO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoCUBAGEM: TFloatField
      FieldName = 'CUBAGEM'
    end
    object qry_ProcessoDESCR_INGLES: TStringField
      FieldName = 'DESCR_INGLES'
      FixedChar = True
      Size = 50
    end
    object qry_ProcessoDESCR_MERCADORIA: TStringField
      FieldName = 'DESCR_MERCADORIA'
      FixedChar = True
      Size = 100
    end
    object qry_ProcessoDIAS_CONDICAO_PAGTO: TStringField
      FieldName = 'DIAS_CONDICAO_PAGTO'
      FixedChar = True
      Size = 3
    end
    object qry_ProcessoDT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
    end
    object qry_ProcessoDT_APRESENTACAO: TDateTimeField
      FieldName = 'DT_APRESENTACAO'
    end
    object qry_ProcessoDT_ATRACACAO: TDateTimeField
      FieldName = 'DT_ATRACACAO'
    end
    object qry_ProcessoDT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
    end
    object qry_ProcessoDT_CHEGADA: TDateTimeField
      FieldName = 'DT_CHEGADA'
    end
    object qry_ProcessoDT_CONHECIMENTO: TDateTimeField
      FieldName = 'DT_CONHECIMENTO'
    end
    object qry_ProcessoDT_CONTABIL_LWW: TDateTimeField
      FieldName = 'DT_CONTABIL_LWW'
    end
    object qry_ProcessoDT_CRUZE: TDateTimeField
      FieldName = 'DT_CRUZE'
    end
    object qry_ProcessoDT_DESCARGA: TDateTimeField
      FieldName = 'DT_DESCARGA'
    end
    object qry_ProcessoDT_DESEMBARACO: TDateTimeField
      FieldName = 'DT_DESEMBARACO'
    end
    object qry_ProcessoDT_DISTRIBUICAO: TDateTimeField
      FieldName = 'DT_DISTRIBUICAO'
    end
    object qry_ProcessoDT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
    end
    object qry_ProcessoDT_ESTOCAGEM: TDateTimeField
      FieldName = 'DT_ESTOCAGEM'
    end
    object qry_ProcessoDT_LIBERACAO: TDateTimeField
      FieldName = 'DT_LIBERACAO'
    end
    object qry_ProcessoDT_PEDIDO: TDateTimeField
      FieldName = 'DT_PEDIDO'
    end
    object qry_ProcessoDT_PRESENCA_CARGA: TDateTimeField
      FieldName = 'DT_PRESENCA_CARGA'
    end
    object qry_ProcessoDT_REC_NUM: TDateTimeField
      FieldName = 'DT_REC_NUM'
    end
    object qry_ProcessoDT_RECEB_DOC: TDateTimeField
      FieldName = 'DT_RECEB_DOC'
    end
    object qry_ProcessoDT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
    end
    object qry_ProcessoDT_REG_DDE: TDateTimeField
      FieldName = 'DT_REG_DDE'
    end
    object qry_ProcessoDT_SOL_NUM: TDateTimeField
      FieldName = 'DT_SOL_NUM'
    end
    object qry_ProcessoDT_VENC_PROCESSO_EXP_TEMP: TDateTimeField
      FieldName = 'DT_VENC_PROCESSO_EXP_TEMP'
    end
    object qry_ProcessoDT_VENCTO_ARMAZENAGEM: TDateTimeField
      FieldName = 'DT_VENCTO_ARMAZENAGEM'
    end
    object qry_ProcessoHR_ABERTURA: TDateTimeField
      FieldName = 'HR_ABERTURA'
    end
    object qry_ProcessoHR_PEDIDO: TDateTimeField
      FieldName = 'HR_PEDIDO'
    end
    object qry_ProcessoID_CODIGO_INSTR_DESEMB: TStringField
      FieldName = 'ID_CODIGO_INSTR_DESEMB'
      FixedChar = True
      Size = 13
    end
    object qry_ProcessoIN_ACCOUNT: TStringField
      FieldName = 'IN_ACCOUNT'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_AS_AGREED: TStringField
      FieldName = 'IN_AS_AGREED'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_CHEQUE_SDA: TStringField
      FieldName = 'IN_CHEQUE_SDA'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_CONSOLIDADO: TStringField
      FieldName = 'IN_CONSOLIDADO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_COURRIER: TStringField
      FieldName = 'IN_COURRIER'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_CUBAGEM: TStringField
      FieldName = 'IN_CUBAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_DADOS_IGUAIS_ITENS: TStringField
      FieldName = 'IN_DADOS_IGUAIS_ITENS'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_DI_LIBERADA: TStringField
      FieldName = 'IN_DI_LIBERADA'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_EDI_BASF: TStringField
      FieldName = 'IN_EDI_BASF'
      FixedChar = True
      Size = 3
    end
    object qry_ProcessoIN_ENTREPOSTO: TStringField
      FieldName = 'IN_ENTREPOSTO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_ETIQUETA: TStringField
      FieldName = 'IN_ETIQUETA'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_IMP_ARM: TStringField
      FieldName = 'IN_IMP_ARM'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_IMPORTANTE: TStringField
      FieldName = 'IN_IMPORTANTE'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_LIQUIDADO: TStringField
      FieldName = 'IN_LIQUIDADO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_MERC_PERIGOSA: TStringField
      FieldName = 'IN_MERC_PERIGOSA'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_PEDIDO: TStringField
      FieldName = 'IN_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_POR_VEICULO: TStringField
      FieldName = 'IN_POR_VEICULO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_PRODUCAO: TStringField
      FieldName = 'IN_PRODUCAO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_PRODUTO_IMPORTADO: TStringField
      FieldName = 'IN_PRODUTO_IMPORTADO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_REL_LEAD_TIME: TStringField
      FieldName = 'IN_REL_LEAD_TIME'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_ROUTING: TStringField
      FieldName = 'IN_ROUTING'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_SDA_PAGO: TStringField
      FieldName = 'IN_SDA_PAGO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_SEGURO: TStringField
      FieldName = 'IN_SEGURO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_TRANSMITE_SEM_PREVISAO: TStringField
      FieldName = 'IN_TRANSMITE_SEM_PREVISAO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoIN_URGENTE: TStringField
      FieldName = 'IN_URGENTE'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoNM_ATO_DECLARATORIO: TStringField
      FieldName = 'NM_ATO_DECLARATORIO'
      FixedChar = True
      Size = 40
    end
    object qry_ProcessoNM_CONEXAO: TStringField
      FieldName = 'NM_CONEXAO'
      FixedChar = True
      Size = 18
    end
    object qry_ProcessoNM_EMPRESA_BASF: TStringField
      FieldName = 'NM_EMPRESA_BASF'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoNM_LOCAL_NF_LWW: TStringField
      FieldName = 'NM_LOCAL_NF_LWW'
      FixedChar = True
    end
    object qry_ProcessoNM_PLANTA: TStringField
      FieldName = 'NM_PLANTA'
      FixedChar = True
      Size = 30
    end
    object qry_ProcessoNR_AVERBACAO: TStringField
      FieldName = 'NR_AVERBACAO'
      FixedChar = True
      Size = 10
    end
    object qry_ProcessoNR_CAMINHAO: TStringField
      FieldName = 'NR_CAMINHAO'
      FixedChar = True
      Size = 4
    end
    object qry_ProcessoNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qry_ProcessoNR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      FixedChar = True
      Size = 30
    end
    object qry_ProcessoNR_CONTA_CONTABIL: TStringField
      FieldName = 'NR_CONTA_CONTABIL'
      FixedChar = True
      Size = 40
    end
    object qry_ProcessoNR_COURRIER: TStringField
      FieldName = 'NR_COURRIER'
      FixedChar = True
      Size = 15
    end
    object qry_ProcessoNR_DA: TStringField
      FieldName = 'NR_DA'
      FixedChar = True
      Size = 10
    end
    object qry_ProcessoNR_DDE: TStringField
      FieldName = 'NR_DDE'
      FixedChar = True
      Size = 11
    end
    object qry_ProcessoNR_DESPACHO: TStringField
      FieldName = 'NR_DESPACHO'
      FixedChar = True
      Size = 10
    end
    object qry_ProcessoNR_DI: TStringField
      FieldName = 'NR_DI'
      FixedChar = True
      Size = 10
    end
    object qry_ProcessoNR_DI_RETORNO: TStringField
      FieldName = 'NR_DI_RETORNO'
      FixedChar = True
      Size = 10
    end
    object qry_ProcessoNR_DTA: TStringField
      FieldName = 'NR_DTA'
      FixedChar = True
      Size = 10
    end
    object qry_ProcessoNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 15
    end
    object qry_ProcessoNR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      FixedChar = True
      Size = 15
    end
    object qry_ProcessoNR_ORDEM: TStringField
      FieldName = 'NR_ORDEM'
      FixedChar = True
      Size = 30
    end
    object qry_ProcessoNR_PERIODO_ARMAZENAGEM: TIntegerField
      FieldName = 'NR_PERIODO_ARMAZENAGEM'
    end
    object qry_ProcessoNR_PLACA_VEICULO: TStringField
      FieldName = 'NR_PLACA_VEICULO'
      FixedChar = True
      Size = 15
    end
    object qry_ProcessoNR_PRESENCA_CARGA: TStringField
      FieldName = 'NR_PRESENCA_CARGA'
      FixedChar = True
      Size = 36
    end
    object qry_ProcessoNR_PROC_PARCEIRO: TStringField
      FieldName = 'NR_PROC_PARCEIRO'
      FixedChar = True
      Size = 8
    end
    object qry_ProcessoNR_PROC_RISC: TStringField
      FieldName = 'NR_PROC_RISC'
      FixedChar = True
      Size = 5
    end
    object qry_ProcessoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_ProcessoNR_PROCESSO_EXP_TEMP: TStringField
      FieldName = 'NR_PROCESSO_EXP_TEMP'
      FixedChar = True
      Size = 5
    end
    object qry_ProcessoNR_PROCESSO_OR_ENTREPOSTO: TStringField
      FieldName = 'NR_PROCESSO_OR_ENTREPOSTO'
      FixedChar = True
      Size = 18
    end
    object qry_ProcessoNR_PROCESSO_VINC: TStringField
      FieldName = 'NR_PROCESSO_VINC'
      FixedChar = True
      Size = 14
    end
    object qry_ProcessoNR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qry_ProcessoNR_REF_EXPORTADOR: TStringField
      FieldName = 'NR_REF_EXPORTADOR'
      FixedChar = True
      Size = 30
    end
    object qry_ProcessoNR_REFERENCIA: TStringField
      FieldName = 'NR_REFERENCIA'
      FixedChar = True
      Size = 18
    end
    object qry_ProcessoNR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      FixedChar = True
      Size = 15
    end
    object qry_ProcessoNR_VIAGEM_ARMADOR: TStringField
      FieldName = 'NR_VIAGEM_ARMADOR'
      FixedChar = True
      Size = 15
    end
    object qry_ProcessoNR_VOO: TStringField
      FieldName = 'NR_VOO'
      FixedChar = True
      Size = 18
    end
    object qry_ProcessoNUM_CE: TStringField
      FieldName = 'NUM_CE'
      FixedChar = True
    end
    object qry_ProcessoOUTRA_TAXA: TFloatField
      FieldName = 'OUTRA_TAXA'
    end
    object qry_ProcessoOUTRA_TAXA_CUSTO: TFloatField
      FieldName = 'OUTRA_TAXA_CUSTO'
    end
    object qry_ProcessoQT_DEVOLUCOES: TIntegerField
      FieldName = 'QT_DEVOLUCOES'
    end
    object qry_ProcessoQT_LANC_FAT: TIntegerField
      FieldName = 'QT_LANC_FAT'
    end
    object qry_ProcessoQT_RECEBIMENTO: TIntegerField
      FieldName = 'QT_RECEBIMENTO'
    end
    object qry_ProcessoQT_REF_CLIENTE: TIntegerField
      FieldName = 'QT_REF_CLIENTE'
    end
    object qry_ProcessoQT_SOLINUM: TIntegerField
      FieldName = 'QT_SOLINUM'
    end
    object qry_ProcessoQTD_VOLUME: TFloatField
      FieldName = 'QTD_VOLUME'
    end
    object qry_ProcessoREF_CLIENTE: TStringField
      FieldName = 'REF_CLIENTE'
      FixedChar = True
    end
    object qry_ProcessoTP_BANCO_EXP: TStringField
      FieldName = 'TP_BANCO_EXP'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoTP_CARGA: TStringField
      FieldName = 'TP_CARGA'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoTP_DESEMB_MIC_DTA: TStringField
      FieldName = 'TP_DESEMB_MIC_DTA'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoTP_DIVISAO: TStringField
      FieldName = 'TP_DIVISAO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoTP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoTP_FREQUENCIA: TStringField
      FieldName = 'TP_FREQUENCIA'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoTP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoTP_MIC_DTA: TStringField
      FieldName = 'TP_MIC_DTA'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoTP_PROCESSO: TStringField
      FieldName = 'TP_PROCESSO'
      FixedChar = True
      Size = 1
    end
    object qry_ProcessoVL_ACCOUNT: TFloatField
      FieldName = 'VL_ACCOUNT'
    end
    object qry_ProcessoVL_CIF_DOLAR: TFloatField
      FieldName = 'VL_CIF_DOLAR'
    end
    object qry_ProcessoVL_CIF_MN: TFloatField
      FieldName = 'VL_CIF_MN'
    end
    object qry_ProcessoVL_COMISS_IATA: TFloatField
      FieldName = 'VL_COMISS_IATA'
    end
    object qry_ProcessoVL_COMPL_SDA: TFloatField
      FieldName = 'VL_COMPL_SDA'
    end
    object qry_ProcessoVL_CONTR_ASSIST: TFloatField
      FieldName = 'VL_CONTR_ASSIST'
    end
    object qry_ProcessoVL_CUSTO_CIA: TFloatField
      FieldName = 'VL_CUSTO_CIA'
    end
    object qry_ProcessoVL_DESP_AG: TFloatField
      FieldName = 'VL_DESP_AG'
    end
    object qry_ProcessoVL_DESP_BRASIL: TFloatField
      FieldName = 'VL_DESP_BRASIL'
    end
    object qry_ProcessoVL_DESP_MASTER: TFloatField
      FieldName = 'VL_DESP_MASTER'
    end
    object qry_ProcessoVL_DESP_REAL: TFloatField
      FieldName = 'VL_DESP_REAL'
    end
    object qry_ProcessoVL_DIVISAO: TFloatField
      FieldName = 'VL_DIVISAO'
    end
    object qry_ProcessoVL_FAT_COMPLEMENTAR: TFloatField
      FieldName = 'VL_FAT_COMPLEMENTAR'
    end
    object qry_ProcessoVL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object qry_ProcessoVL_FRETE_COLLECT_MNEG: TFloatField
      FieldName = 'VL_FRETE_COLLECT_MNEG'
    end
    object qry_ProcessoVL_FRETE_CUSTO: TFloatField
      FieldName = 'VL_FRETE_CUSTO'
    end
    object qry_ProcessoVL_FRETE_INTERNO: TFloatField
      FieldName = 'VL_FRETE_INTERNO'
    end
    object qry_ProcessoVL_FRETE_MN: TFloatField
      FieldName = 'VL_FRETE_MN'
    end
    object qry_ProcessoVL_FRETE_PREPAID_MNEG: TFloatField
      FieldName = 'VL_FRETE_PREPAID_MNEG'
    end
    object qry_ProcessoVL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
    end
    object qry_ProcessoVL_HOUSE: TFloatField
      FieldName = 'VL_HOUSE'
    end
    object qry_ProcessoVL_ICMS_MN: TFloatField
      FieldName = 'VL_ICMS_MN'
    end
    object qry_ProcessoVL_II_MN: TFloatField
      FieldName = 'VL_II_MN'
    end
    object qry_ProcessoVL_IPI_MN: TFloatField
      FieldName = 'VL_IPI_MN'
    end
    object qry_ProcessoVL_M3: TFloatField
      FieldName = 'VL_M3'
    end
    object qry_ProcessoVL_MERCADORIA: TFloatField
      FieldName = 'VL_MERCADORIA'
    end
    object qry_ProcessoVL_MLE_MN: TFloatField
      FieldName = 'VL_MLE_MN'
    end
    object qry_ProcessoVL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
    end
    object qry_ProcessoVL_OTHER_CHARGE: TFloatField
      FieldName = 'VL_OTHER_CHARGE'
    end
    object qry_ProcessoVL_OTHER_CHARGE_CC: TFloatField
      FieldName = 'VL_OTHER_CHARGE_CC'
    end
    object qry_ProcessoVL_OTHER_CHARGE_CUSTO: TFloatField
      FieldName = 'VL_OTHER_CHARGE_CUSTO'
    end
    object qry_ProcessoVL_OVER: TFloatField
      FieldName = 'VL_OVER'
    end
    object qry_ProcessoVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qry_ProcessoVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
    end
    object qry_ProcessoVL_PREMIO_SEGURO: TFloatField
      FieldName = 'VL_PREMIO_SEGURO'
    end
    object qry_ProcessoVL_PROFIT_AGENTE: TFloatField
      FieldName = 'VL_PROFIT_AGENTE'
    end
    object qry_ProcessoVL_PROFIT_BRASIL: TFloatField
      FieldName = 'VL_PROFIT_BRASIL'
    end
    object qry_ProcessoVL_PROFIT_HOUSE: TFloatField
      FieldName = 'VL_PROFIT_HOUSE'
    end
    object qry_ProcessoVL_PROFIT_LIQUIDO: TFloatField
      FieldName = 'VL_PROFIT_LIQUIDO'
    end
    object qry_ProcessoVL_RATEIO: TFloatField
      FieldName = 'VL_RATEIO'
    end
    object qry_ProcessoVL_RATEIO_DESPESA: TFloatField
      FieldName = 'VL_RATEIO_DESPESA'
    end
    object qry_ProcessoVL_REC_AG: TFloatField
      FieldName = 'VL_REC_AG'
    end
    object qry_ProcessoVL_REC_BR: TFloatField
      FieldName = 'VL_REC_BR'
    end
    object qry_ProcessoVL_SDA: TFloatField
      FieldName = 'VL_SDA'
    end
    object qry_ProcessoVL_SEGURO_MN: TFloatField
      FieldName = 'VL_SEGURO_MN'
    end
    object qry_ProcessoVL_SEGURO_MNEG: TFloatField
      FieldName = 'VL_SEGURO_MNEG'
    end
    object qry_ProcessoVL_TARIFA_FRETE: TFloatField
      FieldName = 'VL_TARIFA_FRETE'
    end
    object qry_ProcessoVL_TAXA_FRETE: TFloatField
      FieldName = 'VL_TAXA_FRETE'
    end
    object qry_ProcessoVL_TT_CUSTO: TFloatField
      FieldName = 'VL_TT_CUSTO'
    end
    object qry_ProcessoVL_TT_PROF_AG: TFloatField
      FieldName = 'VL_TT_PROF_AG'
    end
    object qry_ProcessoVL_TT_PROF_BR: TFloatField
      FieldName = 'VL_TT_PROF_BR'
    end
    object qry_ProcessoVL_TT_VENDA: TFloatField
      FieldName = 'VL_TT_VENDA'
    end
    object qry_ProcessoVL_VENDA_BRASIL: TFloatField
      FieldName = 'VL_VENDA_BRASIL'
    end
    object qry_ProcessoVL_VENDA_CIA: TFloatField
      FieldName = 'VL_VENDA_CIA'
    end
    object qry_ProcessoNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
  end
  object ds_Processo: TDataSource
    DataSet = qry_Processo
    Left = 48
    Top = 72
  end
  object qry_Tabelas: TQuery
    DatabaseName = 'DBBROKER'
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
    Left = 162
    Top = 232
    object qry_TabelasNM_EXIBICAO: TStringField
      FieldName = 'NM_EXIBICAO'
      FixedChar = True
      Size = 100
    end
    object qry_TabelasNM_SQL_LOOKUP: TStringField
      FieldName = 'NM_SQL_LOOKUP'
      FixedChar = True
      Size = 8000
    end
    object qry_TabelasID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
    end
    object qry_TabelasNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      FixedChar = True
      Size = 255
    end
    object qry_TabelasNM_CAMPO: TStringField
      FieldName = 'NM_CAMPO'
      FixedChar = True
      Size = 255
    end
    object qry_TabelasIN_CONVERT: TStringField
      FieldName = 'IN_CONVERT'
      FixedChar = True
      Size = 1
    end
    object qry_TabelasCONVERT: TStringField
      FieldName = 'CONVERT'
      FixedChar = True
      Size = 255
    end
  end
  object ds_Tabelas: TDataSource
    DataSet = qry_Tabelas
    Left = 48
    Top = 232
  end
  object qry_ChaveConsulta: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select '#39#39' as Codigo, '#39#39' as Descricao')
    Left = 162
    Top = 288
    object qry_ChaveConsultaCodigo: TStringField
      FieldName = 'Codigo'
      FixedChar = True
      Size = 1
    end
    object qry_ChaveConsultaDescricao: TStringField
      FieldName = 'Descricao'
      FixedChar = True
      Size = 1
    end
  end
  object ds_ChaveConsulta: TDataSource
    DataSet = qry_ChaveConsulta
    Left = 48
    Top = 288
  end
  object ds_Forms: TDataSource
    DataSet = qry_Forms
    Left = 48
    Top = 182
  end
  object qry_Forms: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DF.NM_FORM,'
      '       DF.NM_DATA_MODULE,'
      '       DF.NM_QUERY,'
      '       DF.ID_TABELA,'
      '       ST.NAME AS NM_TABELA,'
      '       DF.NM_CAMPO,'
      '       CASE ISNULL(SC.NAME, ISNULL(DF.NM_CAMPO, '#39'NR_PROCESSO'#39'))'
      '           WHEN '#39'NR_PROCESSO'#39' THEN '#39'1'#39
      '           WHEN '#39'ID_CODIGO'#39' THEN '#39'2'#39
      '       ELSE '#39'0'#39
      '       END AS IN_PROCESSO'
      
        'FROM TDADOS_FORMS DF LEFT JOIN (TTABELA_DIGITALIZACAO TD INNER J' +
        'OIN SYS.COLUMNS SC ON SC.OBJECT_ID = TD.ID_TABELA AND SC.COLUMN_' +
        'ID = TD.ID_CAMPO) ON TD.ID_TABELA = DF.ID_TABELA'
      '   INNER JOIN SYS.TABLES ST ON ST.OBJECT_ID = DF.ID_TABELA'
      'WHERE DF.NM_FORM = :NM_FORM')
    Left = 162
    Top = 182
    ParamData = <
      item
        DataType = ftString
        Name = 'NM_FORM'
        ParamType = ptUnknown
      end>
    object qry_FormsNM_FORM: TStringField
      FieldName = 'NM_FORM'
      FixedChar = True
      Size = 50
    end
    object qry_FormsNM_DATA_MODULE: TStringField
      FieldName = 'NM_DATA_MODULE'
      FixedChar = True
      Size = 50
    end
    object qry_FormsNM_QUERY: TStringField
      FieldName = 'NM_QUERY'
      FixedChar = True
      Size = 50
    end
    object qry_FormsID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
    end
    object qry_FormsNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      FixedChar = True
      Size = 255
    end
    object qry_FormsNM_CAMPO: TStringField
      FieldName = 'NM_CAMPO'
      FixedChar = True
      Size = 255
    end
    object qry_FormsIN_PROCESSO: TStringField
      FieldName = 'IN_PROCESSO'
      FixedChar = True
      Size = 1
    end
  end
  object ds_TabelasVinculadas: TDataSource
    DataSet = qry_TabelasVinculadas
    Left = 48
    Top = 350
  end
  object qry_TabelasVinculadas: TQuery
    CachedUpdates = True
    AfterOpen = qry_TabelasVinculadasAfterOpen
    AfterClose = qry_TabelasVinculadasAfterClose
    DatabaseName = 'DBBROKER'
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
    Left = 162
    Top = 350
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_TABELA_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_TabelasVinculadasNM_EXIBICAO: TStringField
      FieldName = 'NM_EXIBICAO'
      FixedChar = True
      Size = 100
    end
    object qry_TabelasVinculadasID_TABELA: TIntegerField
      FieldName = 'ID_TABELA'
    end
    object qry_TabelasVinculadasNM_CAMPO_PROCESSO: TStringField
      FieldName = 'NM_CAMPO_PROCESSO'
      FixedChar = True
      Size = 255
    end
  end
  object IdIPWatch1: TIdIPWatch
    Active = False
    HistoryEnabled = False
    HistoryFilename = 'iphist.dat'
    Left = 256
    Top = 232
  end
  object qry_Usuarios: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO'
      'FROM TUSUARIO')
    Left = 258
    Top = 182
    object qry_UsuariosCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TUSUARIO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_UsuariosNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'DBBROKER.TUSUARIO.NM_USUARIO'
      FixedChar = True
      Size = 50
    end
  end
end

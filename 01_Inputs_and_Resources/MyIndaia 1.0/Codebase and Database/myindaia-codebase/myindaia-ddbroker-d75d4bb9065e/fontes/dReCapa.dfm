object datm_re_capa: Tdatm_re_capa
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 324
  Top = 147
  Height = 508
  Width = 666
  object qry_re_capa: TQuery
    CachedUpdates = True
    BeforePost = qry_re_capaBeforePost
    AfterPost = qry_re_capaAfterPost
    AfterDelete = qry_re_capaAfterDelete
    AfterScroll = qry_re_capaAfterScroll
    OnCalcFields = qry_re_capaCalcFields
    AutoRefresh = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '/*GetSelQueryRE*/')
    Left = 131
    Top = 17
    object qry_re_capaEXPORTADOR: TStringField
      DisplayWidth = 100
      FieldName = 'EXPORTADOR'
      FixedChar = True
      Size = 100
    end
    object qry_re_capaIMPORTADOR: TStringField
      DisplayWidth = 100
      FieldName = 'IMPORTADOR'
      FixedChar = True
      Size = 100
    end
    object qry_re_capaNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_re_capaNR_OUTRA_REF: TStringField
      FieldName = 'NR_OUTRA_REF'
      FixedChar = True
      Size = 30
    end
    object qry_re_capaNR_RE_SISCOMEX: TStringField
      FieldName = 'NR_RE_SISCOMEX'
      EditMask = '##/#######-###;1;_'
      FixedChar = True
      Size = 30
    end
    object qry_re_capaNR_REG_VENDA: TStringField
      FieldName = 'NR_REG_VENDA'
      FixedChar = True
      Size = 9
    end
    object qry_re_capaNR_REG_CREDITO: TStringField
      FieldName = 'NR_REG_CREDITO'
      FixedChar = True
      Size = 12
    end
    object qry_re_capaNR_RE_VINCULADA: TStringField
      FieldName = 'NR_RE_VINCULADA'
      FixedChar = True
      Size = 13
    end
    object qry_re_capaNR_DI_VINCULADA: TStringField
      FieldName = 'NR_DI_VINCULADA'
      FixedChar = True
      Size = 15
    end
    object qry_re_capaCD_ENQUAD1: TStringField
      FieldName = 'CD_ENQUAD1'
      FixedChar = True
      Size = 5
    end
    object qry_re_capaCD_ENQUAD2: TStringField
      FieldName = 'CD_ENQUAD2'
      FixedChar = True
      Size = 5
    end
    object qry_re_capaCD_ENQUAD3: TStringField
      FieldName = 'CD_ENQUAD3'
      FixedChar = True
      Size = 5
    end
    object qry_re_capaCD_ENQUAD4: TStringField
      FieldName = 'CD_ENQUAD4'
      FixedChar = True
      Size = 5
    end
    object qry_re_capaCD_ENQUAD5: TStringField
      FieldName = 'CD_ENQUAD5'
      FixedChar = True
      Size = 5
    end
    object qry_re_capaCD_ENQUAD6: TStringField
      FieldName = 'CD_ENQUAD6'
      FixedChar = True
      Size = 5
    end
    object qry_re_capaCD_INST_NEGO: TStringField
      FieldName = 'CD_INST_NEGO'
      FixedChar = True
      Size = 5
    end
    object qry_re_capaCD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      FixedChar = True
      Size = 10
    end
    object qry_re_capaCD_URF_EMBARQUE: TStringField
      FieldName = 'CD_URF_EMBARQUE'
      FixedChar = True
      Size = 7
    end
    object qry_re_capaCD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      FixedChar = True
      Size = 7
    end
    object qry_re_capaDT_DATA_RE: TDateTimeField
      FieldName = 'DT_DATA_RE'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_re_capaDT_LIMITE_OPERACAO: TDateTimeField
      FieldName = 'DT_LIMITE_OPERACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_re_capaVL_MARGEM_NAO_SACADA: TFloatField
      FieldName = 'VL_MARGEM_NAO_SACADA'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaVL_VALOR_CONSIGNACAO: TFloatField
      FieldName = 'VL_VALOR_CONSIGNACAO'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaVL_VALOR_COBER_CAMBIAL: TFloatField
      FieldName = 'VL_VALOR_COBER_CAMBIAL'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaVL_VALOR_FINANCEIRO_RC: TFloatField
      FieldName = 'VL_VALOR_FINANCEIRO_RC'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaVL_TOTAL_COND_VENDA_ACUM: TFloatField
      FieldName = 'VL_TOTAL_COND_VENDA_ACUM'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaVL_TOTAL_LOCAL_VENDA_ACUM: TFloatField
      FieldName = 'VL_TOTAL_LOCAL_VENDA_ACUM'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaCD_ULTIMO_ANEXO_TRANSMITIDO: TIntegerField
      FieldName = 'CD_ULTIMO_ANEXO_TRANSMITIDO'
    end
    object qry_re_capaDT_DATA_TRANSMISSAO: TDateTimeField
      FieldName = 'DT_DATA_TRANSMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_re_capaCD_NUMERO_TRANSMISSAO: TIntegerField
      FieldName = 'CD_NUMERO_TRANSMISSAO'
    end
    object qry_re_capaVL_ESQUE_PG_TOTAL: TFloatField
      FieldName = 'VL_ESQUE_PG_TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaVL_VALOR_NBM_INCLUIDAS: TFloatField
      FieldName = 'VL_VALOR_NBM_INCLUIDAS'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaCD_STATUS_RE: TStringField
      FieldName = 'CD_STATUS_RE'
      FixedChar = True
      Size = 1
    end
    object qry_re_capaTX_SITUACAO_RE: TStringField
      DisplayWidth = 150
      FieldName = 'TX_SITUACAO_RE'
      FixedChar = True
      Size = 150
    end
    object qry_re_capaCD_SUARIO: TStringField
      FieldName = 'CD_SUARIO'
      FixedChar = True
      Size = 6
    end
    object qry_re_capaDT_DATA: TDateTimeField
      FieldName = 'DT_DATA'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_re_capaTM_HORA: TDateTimeField
      FieldName = 'TM_HORA'
    end
    object qry_re_capaCD_PROPRIETARIO: TStringField
      FieldName = 'CD_PROPRIETARIO'
      FixedChar = True
      Size = 6
    end
    object qry_re_capaNR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
    end
    object qry_re_capaNR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      FixedChar = True
    end
    object qry_re_capaDT_DATA_AVERBACAO: TDateTimeField
      FieldName = 'DT_DATA_AVERBACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_re_capaDT_DATA_MASTER: TDateTimeField
      FieldName = 'DT_DATA_MASTER'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_re_capaCD_PAIS_FINAL: TStringField
      FieldName = 'CD_PAIS_FINAL'
      FixedChar = True
      Size = 3
    end
    object qry_re_capaCD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      FixedChar = True
      Size = 3
    end
    object qry_re_capaCD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      FixedChar = True
      Size = 6
    end
    object qry_re_capaDT_DATA_TRANSP_IBERNAT: TDateTimeField
      FieldName = 'DT_DATA_TRANSP_IBERNAT'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_re_capaTM_HORA_TRANSP_IBERNAT: TDateTimeField
      FieldName = 'TM_HORA_TRANSP_IBERNAT'
    end
    object qry_re_capaCD_SITUACAO_RE: TStringField
      FieldName = 'CD_SITUACAO_RE'
      FixedChar = True
      Size = 2
    end
    object qry_re_capaTX_SITUACAO_SISBACEN: TStringField
      FieldName = 'TX_SITUACAO_SISBACEN'
      FixedChar = True
    end
    object qry_re_capaCD_USUARIO_EXTERNO: TStringField
      FieldName = 'CD_USUARIO_EXTERNO'
      FixedChar = True
      Size = 6
    end
    object qry_re_capaTX_CPF_SISCOMEX: TStringField
      FieldName = 'TX_CPF_SISCOMEX'
      FixedChar = True
      Size = 11
    end
    object qry_re_capaTX_SENHA_SISCOMEX: TStringField
      FieldName = 'TX_SENHA_SISCOMEX'
      FixedChar = True
      Size = 10
    end
    object qry_re_capaNM_ARQUIVO_TRANSMISSAO: TStringField
      FieldName = 'NM_ARQUIVO_TRANSMISSAO'
      FixedChar = True
      Size = 100
    end
    object qry_re_capaCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_re_capaQT_ANEXOS: TIntegerField
      FieldName = 'QT_ANEXOS'
    end
    object qry_re_capaCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_re_capaTP_NAO_QUEBRAR_LINHAS_SEPARADO: TStringField
      FieldName = 'TP_NAO_QUEBRAR_LINHAS_SEPARADO'
      FixedChar = True
      Size = 1
    end
    object qry_re_capaNR_PARCELAS: TStringField
      FieldName = 'NR_PARCELAS'
      FixedChar = True
      Size = 3
    end
    object qry_re_capaNR_PERIODICIDADE: TStringField
      FieldName = 'NR_PERIODICIDADE'
      FixedChar = True
      Size = 3
    end
    object qry_re_capaCD_MODALIDADE_TRANS: TStringField
      FieldName = 'CD_MODALIDADE_TRANS'
      FixedChar = True
      Size = 3
    end
    object qry_re_capaVL_CONSIGN: TFloatField
      FieldName = 'VL_CONSIGN'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaVL_SEM_COB_CAMBIAL: TFloatField
      FieldName = 'VL_SEM_COB_CAMBIAL'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaVL_FINANC_RC: TFloatField
      FieldName = 'VL_FINANC_RC'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaVL_PAGT_VISTA: TFloatField
      FieldName = 'VL_PAGT_VISTA'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaVL_PARCELA: TFloatField
      FieldName = 'VL_PARCELA'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaPC_MARGEM_NAO_SACADA: TFloatField
      FieldName = 'PC_MARGEM_NAO_SACADA'
    end
    object qry_re_capaVL_ESQ_PAG_TOT: TFloatField
      FieldName = 'VL_ESQ_PAG_TOT'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaVL_PAGTO_ANTEC: TFloatField
      FieldName = 'VL_PAGTO_ANTEC'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_re_capaTP_INDICADOR: TStringField
      FieldName = 'TP_INDICADOR'
      FixedChar = True
      Size = 1
    end
    object qry_re_capaIN_ORIGEM_RE: TStringField
      FieldName = 'IN_ORIGEM_RE'
      FixedChar = True
      Size = 1
    end
    object qry_re_capaIN_MARCA_ATUAL_FABRICANTE: TStringField
      FieldName = 'IN_MARCA_ATUAL_FABRICANTE'
      FixedChar = True
      Size = 1
    end
    object qry_re_capaIN_CONTROLE_RATEIO: TStringField
      FieldName = 'IN_CONTROLE_RATEIO'
      FixedChar = True
      Size = 1
    end
    object qry_re_capaIN_CONTROLE_TRANSMISSAO: TStringField
      FieldName = 'IN_CONTROLE_TRANSMISSAO'
      FixedChar = True
      Size = 1
    end
    object qry_re_capaIN_MARCA_TRANSMISSAO: TStringField
      FieldName = 'IN_MARCA_TRANSMISSAO'
      FixedChar = True
      Size = 1
    end
    object qry_re_capaIN_ORIGEM_REG: TStringField
      FieldName = 'IN_ORIGEM_REG'
      FixedChar = True
      Size = 1
    end
    object qry_re_capaIN_TRANSMISSAO_CONCLUIDA: TStringField
      FieldName = 'IN_TRANSMISSAO_CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object qry_re_capaIN_AGRUPAR: TStringField
      FieldName = 'IN_AGRUPAR'
      FixedChar = True
      Size = 1
    end
    object qry_re_capaIN_QUEBRA_POR_VALOR: TStringField
      FieldName = 'IN_QUEBRA_POR_VALOR'
      FixedChar = True
      Size = 1
    end
    object qry_re_capaIN_QUEBRA_POR_FABRICANTE: TStringField
      FieldName = 'IN_QUEBRA_POR_FABRICANTE'
      FixedChar = True
      Size = 1
    end
    object qry_re_capaIN_DESC_TIPO_RECOF: TStringField
      FieldName = 'IN_DESC_TIPO_RECOF'
      FixedChar = True
      Size = 1
    end
    object qry_re_capaIN_NAO_QUEBRAR_LINHAS: TStringField
      FieldName = 'IN_NAO_QUEBRAR_LINHAS'
      FixedChar = True
      Size = 1
    end
    object qry_re_capaPESO_LIQUIDO_TOTAL: TFloatField
      FieldName = 'PESO_LIQUIDO_TOTAL'
      DisplayFormat = '0.00000'
    end
    object qry_re_capaVL_FRETE_TOTAL: TFloatField
      FieldName = 'VL_FRETE_TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaVL_SEGURO_TOTAL: TFloatField
      FieldName = 'VL_SEGURO_TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_capaPROCESSO_REDUZIDO: TStringField
      FieldName = 'PROCESSO_REDUZIDO'
      FixedChar = True
      Size = 14
    end
    object qry_re_capaDT_ULT_CONSULTA: TDateTimeField
      FieldName = 'DT_ULT_CONSULTA'
    end
    object qry_re_capaTX_DOCUMENTO_SISCOMEX: TMemoField
      FieldName = 'TX_DOCUMENTO_SISCOMEX'
      BlobType = ftMemo
    end
    object qry_re_capaCD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      FixedChar = True
      Size = 3
    end
    object qry_re_capaTX_END_IMPORTADOR: TMemoField
      FieldName = 'TX_END_IMPORTADOR'
      BlobType = ftMemo
    end
    object qry_re_capaNR_PROCESSO_COMPLEMENTO: TStringField
      FieldName = 'NR_PROCESSO_COMPLEMENTO'
      FixedChar = True
      Size = 3
    end
    object qry_re_capaPROCESSO_REDUZIDO_COMPLEMENTO: TStringField
      FieldName = 'PROCESSO_REDUZIDO_COMPLEMENTO'
      FixedChar = True
    end
    object qry_re_capaVL_PESO_NBM_INCLUIDAS: TFloatField
      FieldName = 'VL_PESO_NBM_INCLUIDAS'
      DisplayFormat = '0.00000'
    end
    object qry_re_capaIN_NOVOEX: TBooleanField
      FieldName = 'IN_NOVOEX'
    end
    object qry_re_capaCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
  end
  object ds_re_capa: TDataSource
    DataSet = qry_re_capa
    OnStateChange = ds_re_capaStateChange
    Left = 40
    Top = 16
  end
  object qry_re_anexo: TQuery
    CachedUpdates = True
    BeforeOpen = qry_re_anexoBeforeOpen
    BeforePost = qry_re_anexoBeforePost
    AfterPost = qry_re_capaAfterPost
    AfterDelete = qry_re_anexoAfterDelete
    AfterScroll = qry_re_anexoAfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TRE_ANEXO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '      AND NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO'
      'ORDER BY CD_RE_ANEXO')
    UpdateObject = upd_re_anexo
    Left = 127
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO_COMPLEMENTO'
        ParamType = ptInput
      end>
    object qry_re_anexoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TRE_ANEXO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_re_anexoCD_RE_ANEXO: TIntegerField
      FieldName = 'CD_RE_ANEXO'
      Origin = 'DBBROKER.TRE_ANEXO.CD_RE_ANEXO'
    end
    object qry_re_anexoCD_NALADI: TStringField
      FieldName = 'CD_NALADI'
      Origin = 'DBBROKER.TRE_ANEXO.CD_NALADI'
      FixedChar = True
      Size = 8
    end
    object qry_re_anexoCD_NCM: TStringField
      FieldName = 'CD_NCM'
      Origin = 'DBBROKER.TRE_ANEXO.CD_NCM'
      FixedChar = True
      Size = 10
    end
    object qry_re_anexoCD_NBM: TStringField
      FieldName = 'CD_NBM'
      Origin = 'DBBROKER.TRE_ANEXO.CD_NBM'
      FixedChar = True
      Size = 10
    end
    object qry_re_anexoCD_UF_PRODUTOR: TStringField
      FieldName = 'CD_UF_PRODUTOR'
      Origin = 'DBBROKER.TRE_ANEXO.CD_UF_PRODUTOR'
      FixedChar = True
      Size = 2
    end
    object qry_re_anexoCD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'DBBROKER.TRE_ANEXO.CD_EMBALAGEM'
      FixedChar = True
      Size = 10
    end
    object qry_re_anexoCD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'DBBROKER.TRE_ANEXO.CD_UNID_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qry_re_anexoCD_FINALIDADE: TStringField
      FieldName = 'CD_FINALIDADE'
      Origin = 'DBBROKER.TRE_ANEXO.CD_FINALIDADE'
      FixedChar = True
      Size = 3
    end
    object qry_re_anexoCD_FORMA_PGTO: TStringField
      FieldName = 'CD_FORMA_PGTO'
      Origin = 'DBBROKER.TRE_ANEXO.CD_FORMA_PGTO'
      FixedChar = True
      Size = 1
    end
    object qry_re_anexoTX_CATEGORIA_TEXTIL: TStringField
      FieldName = 'TX_CATEGORIA_TEXTIL'
      Origin = 'DBBROKER.TRE_ANEXO.TX_CATEGORIA_TEXTIL'
      FixedChar = True
      Size = 30
    end
    object qry_re_anexoIN_EXPORTADOR_FABRICANTE: TStringField
      FieldName = 'IN_EXPORTADOR_FABRICANTE'
      Origin = 'DBBROKER.TRE_ANEXO.IN_EXPORTADOR_FABRICANTE'
      FixedChar = True
      Size = 1
    end
    object qry_re_anexoIN_OBS_EXPORTADOR: TStringField
      FieldName = 'IN_OBS_EXPORTADOR'
      Origin = 'DBBROKER.TRE_ANEXO.IN_OBS_EXPORTADOR'
      FixedChar = True
      Size = 1
    end
    object qry_re_anexoDT_VALIDADE_EMBARQUE: TDateTimeField
      FieldName = 'DT_VALIDADE_EMBARQUE'
      Origin = 'DBBROKER.TRE_ANEXO.DT_VALIDADE_EMBARQUE'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_re_anexoPESO_LIQUIDO: TFloatField
      FieldName = 'PESO_LIQUIDO'
      Origin = 'DBBROKER.TRE_ANEXO.PESO_LIQUIDO'
      DisplayFormat = '#,##0.00000'
      EditFormat = '###0.00000'
    end
    object qry_re_anexoQT_UNIDADE_COMERCIAL: TFloatField
      FieldName = 'QT_UNIDADE_COMERCIAL'
      Origin = 'DBBROKER.TRE_ANEXO.QT_UNIDADE_COMERCIAL'
      DisplayFormat = '#,##0.00000'
    end
    object qry_re_anexoQT_MEDIA_NBM: TFloatField
      FieldName = 'QT_MEDIA_NBM'
      Origin = 'DBBROKER.TRE_ANEXO.QT_MEDIA_NBM'
      DisplayFormat = '#,##0.00000'
      EditFormat = '###0.00000'
    end
    object qry_re_anexoVL_COND_VENDA: TFloatField
      FieldName = 'VL_COND_VENDA'
      Origin = 'DBBROKER.TRE_ANEXO.VL_COND_VENDA'
      DisplayFormat = '#0.00'
    end
    object qry_re_anexoVL_LOCAL_VENDA: TFloatField
      FieldName = 'VL_LOCAL_VENDA'
      Origin = 'DBBROKER.TRE_ANEXO.VL_LOCAL_VENDA'
      DisplayFormat = '#0.00'
    end
    object qry_re_anexoPC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'DBBROKER.TRE_ANEXO.PC_COMISSAO'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_anexoVL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
      Origin = 'DBBROKER.TRE_ANEXO.VL_COMISSAO'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_anexoVL_FRETE_RATEADO: TFloatField
      FieldName = 'VL_FRETE_RATEADO'
      Origin = 'DBBROKER.TRE_ANEXO.VL_FRETE_RATEADO'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_anexoVL_SEGURO_RATEADO: TFloatField
      FieldName = 'VL_SEGURO_RATEADO'
      Origin = 'DBBROKER.TRE_ANEXO.VL_SEGURO_RATEADO'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_anexoPESO_BRUTO_RATEADO: TFloatField
      FieldName = 'PESO_BRUTO_RATEADO'
      Origin = 'DBBROKER.TRE_ANEXO.PESO_BRUTO_RATEADO'
      DisplayFormat = '#,##0.00000'
    end
    object qry_re_anexoCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TRE_ANEXO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_re_anexoDT_DATA: TDateTimeField
      FieldName = 'DT_DATA'
      Origin = 'DBBROKER.TRE_ANEXO.DT_DATA'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_re_anexoTM_HORA: TDateTimeField
      FieldName = 'TM_HORA'
      Origin = 'DBBROKER.TRE_ANEXO.TM_HORA'
    end
    object qry_re_anexoCD_ORIGEM_REGISTRO: TStringField
      FieldName = 'CD_ORIGEM_REGISTRO'
      Origin = 'DBBROKER.TRE_ANEXO.CD_ORIGEM_REGISTRO'
      FixedChar = True
      Size = 1
    end
    object qry_re_anexoTX_PENDENCIA: TStringField
      FieldName = 'TX_PENDENCIA'
      Origin = 'DBBROKER.TRE_ANEXO.TX_PENDENCIA'
      FixedChar = True
      Size = 80
    end
    object qry_re_anexoTX_OBSERVACOES: TStringField
      FieldName = 'TX_OBSERVACOES'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERVACOES'
      FixedChar = True
      Size = 80
    end
    object qry_re_anexoTX_MENS_ADVERTENCIA1: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA1'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA1'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_MENS_ADVERTENCIA2: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA2'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA2'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_MENS_ADVERTENCIA3: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA3'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA3'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_MENS_ADVERTENCIA4: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA4'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA4'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_MENS_ADVERTENCIA5: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA5'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA5'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_MENS_ADVERTENCIA6: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA6'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA6'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_MENS_ADVERTENCIA7: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA7'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA7'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_MENS_ADVERTENCIA8: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA8'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA8'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_MENS_ADVERTENCIA9: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA9'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA9'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_MENS_ADVERTENCIA10: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA10'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA10'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_MENS_ADVERTENCIA11: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA11'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA11'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_MENS_ADVERTENCIA12: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA12'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA12'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_MENS_ADVERTENCIA13: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA13'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA13'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_OBSERV_ORG_ANUENT1: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT1'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT1'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_OBSERV_ORG_ANUENT2: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT2'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT2'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_OBSERV_ORG_ANUENT3: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT3'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT3'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_OBSERV_ORG_ANUENT4: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT4'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT4'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_OBSERV_ORG_ANUENT5: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT5'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT5'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_OBSERV_ORG_ANUENT6: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT6'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT6'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_OBSERV_ORG_ANUENT7: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT7'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT7'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_OBSERV_ORG_ANUENT8: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT8'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT8'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_OBSERV_ORG_ANUENT9: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT9'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT9'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_OBSERV_ORG_ANUENT10: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT10'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT10'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_OBSERV_ORG_ANUENT11: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT11'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT11'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_OBSERV_ORG_ANUENT12: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT12'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT12'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_OBSERV_ORG_ANUENT13: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT13'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT13'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoTX_OBSERV_ORG_ANUENT14: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT14'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT14'
      FixedChar = True
      Size = 75
    end
    object qry_re_anexoQT_EMBARCADA: TFloatField
      FieldName = 'QT_EMBARCADA'
      Origin = 'DBBROKER.TRE_ANEXO.QT_EMBARCADA'
      DisplayFormat = '#,##0.00000'
    end
    object qry_re_anexoVL_EMBARCADO: TFloatField
      FieldName = 'VL_EMBARCADO'
      Origin = 'DBBROKER.TRE_ANEXO.VL_EMBARCADO'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_anexoDT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Origin = 'DBBROKER.TRE_ANEXO.DT_EMBARQUE'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_re_anexoVL_CAMB_PROVIS_RE: TFloatField
      FieldName = 'VL_CAMB_PROVIS_RE'
      Origin = 'DBBROKER.TRE_ANEXO.VL_CAMB_PROVIS_RE'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_anexoDT_PROVIS: TDateTimeField
      FieldName = 'DT_PROVIS'
      Origin = 'DBBROKER.TRE_ANEXO.DT_PROVIS'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_re_anexoVL_CAMB_APLIC_RE: TFloatField
      FieldName = 'VL_CAMB_APLIC_RE'
      Origin = 'DBBROKER.TRE_ANEXO.VL_CAMB_APLIC_RE'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_anexoDT_APLICACAO: TDateTimeField
      FieldName = 'DT_APLICACAO'
      Origin = 'DBBROKER.TRE_ANEXO.DT_APLICACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_re_anexoVL_CAMB_LIQ_DESP: TFloatField
      FieldName = 'VL_CAMB_LIQ_DESP'
      Origin = 'DBBROKER.TRE_ANEXO.VL_CAMB_LIQ_DESP'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_anexoDT_EMB_EF_COB_CAMB: TDateTimeField
      FieldName = 'DT_EMB_EF_COB_CAMB'
      Origin = 'DBBROKER.TRE_ANEXO.DT_EMB_EF_COB_CAMB'
    end
    object qry_re_anexoNR_SD_SISCOMEX: TStringField
      FieldName = 'NR_SD_SISCOMEX'
      Origin = 'DBBROKER.TRE_ANEXO.NR_SD_SISCOMEX'
      FixedChar = True
      Size = 12
    end
    object qry_re_anexoVL_COM_AG_EFET: TFloatField
      FieldName = 'VL_COM_AG_EFET'
      Origin = 'DBBROKER.TRE_ANEXO.VL_COM_AG_EFET'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_anexoDT_EMISSAO_CONHEC_EMB: TDateTimeField
      FieldName = 'DT_EMISSAO_CONHEC_EMB'
      Origin = 'DBBROKER.TRE_ANEXO.DT_EMISSAO_CONHEC_EMB'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_re_anexoPESO_LIQUIDO_KG_REBATE: TFloatField
      FieldName = 'PESO_LIQUIDO_KG_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.PESO_LIQUIDO_KG_REBATE'
      DisplayFormat = '#,##0.00000'
    end
    object qry_re_anexoQT_COMERC_REBATE: TFloatField
      FieldName = 'QT_COMERC_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.QT_COMERC_REBATE'
      DisplayFormat = '#,##0.00000'
    end
    object qry_re_anexoCD_UNIDADE_COMERC_REBATE: TStringField
      FieldName = 'CD_UNIDADE_COMERC_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.CD_UNIDADE_COMERC_REBATE'
      FixedChar = True
      Size = 15
    end
    object qry_re_anexoQT_NBM_SH_REBATE: TFloatField
      FieldName = 'QT_NBM_SH_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.QT_NBM_SH_REBATE'
      DisplayFormat = '#,##0.00000'
    end
    object qry_re_anexoCD_UNIDADE_NBM_SH_REBATE: TStringField
      FieldName = 'CD_UNIDADE_NBM_SH_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.CD_UNIDADE_NBM_SH_REBATE'
      FixedChar = True
      Size = 15
    end
    object qry_re_anexoVL_TOTAL_COND_VENDA_REBATE: TFloatField
      FieldName = 'VL_TOTAL_COND_VENDA_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.VL_TOTAL_COND_VENDA_REBATE'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_anexoVL_TOTAL_LOCAL_EMB_REBATE: TFloatField
      FieldName = 'VL_TOTAL_LOCAL_EMB_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.VL_TOTAL_LOCAL_EMB_REBATE'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_anexoVL_COMISSAO_AGENTE_REBATE: TFloatField
      FieldName = 'VL_COMISSAO_AGENTE_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.VL_COMISSAO_AGENTE_REBATE'
      DisplayFormat = '#,##0.00'
    end
    object qry_re_anexoCD_FORMA_PGTO_REBATE: TStringField
      FieldName = 'CD_FORMA_PGTO_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.CD_FORMA_PGTO_REBATE'
      FixedChar = True
      Size = 1
    end
    object qry_re_anexoDT_AVERBACAO: TDateTimeField
      FieldName = 'DT_AVERBACAO'
      Origin = 'DBBROKER.TRE_ANEXO.DT_AVERBACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_re_anexoIN_TRANSMISSAO_CONCLUIDA: TStringField
      FieldName = 'IN_TRANSMISSAO_CONCLUIDA'
      Origin = 'DBBROKER.TRE_ANEXO.IN_TRANSMISSAO_CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object qry_re_anexoTX_DESC_MERCADORIA: TMemoField
      FieldName = 'TX_DESC_MERCADORIA'
      Origin = 'DBBROKER.TRE_ANEXO.TX_DESC_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_re_anexoTX_OBSERVACAO_EXPORTADOR: TMemoField
      FieldName = 'TX_OBSERVACAO_EXPORTADOR'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERVACAO_EXPORTADOR'
      BlobType = ftMemo
    end
    object qry_re_anexolookforma_pgto: TStringField
      FieldKind = fkLookup
      FieldName = 'lookforma_pgto'
      LookupDataSet = qry_forma_pgto
      LookupKeyFields = 'CD_FORMA_PGTO_REBATE'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_FORMA_PGTO_REBATE'
      Lookup = True
    end
    object qry_re_anexolook_unid_est: TStringField
      FieldKind = fkLookup
      FieldName = 'look_unid_est'
      LookupDataSet = qry_ncm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'UNIDADE_MEDIDA'
      KeyFields = 'CD_NCM'
      Size = 5
      Lookup = True
    end
    object qry_re_anexolook_desc_unid_est: TStringField
      FieldKind = fkLookup
      FieldName = 'look_desc_unid_est'
      LookupDataSet = qry_unidade_
      LookupKeyFields = 'CD_UNID_MEDIDA'
      LookupResultField = 'NM_UNID_MEDIDA'
      KeyFields = 'look_unid_est'
      Size = 50
      Lookup = True
    end
    object qry_re_anexoCD_SULF_NCM: TStringField
      FieldName = 'CD_SULF_NCM'
      Origin = 'DBBROKER.TRE_ANEXO.CD_SULF_NCM'
      FixedChar = True
      Size = 2
    end
    object qry_re_anexoNR_PROCESSO_COMPLEMENTO: TStringField
      FieldName = 'NR_PROCESSO_COMPLEMENTO'
      Origin = 'DBBROKER.TRE_ANEXO.NR_PROCESSO_COMPLEMENTO'
      FixedChar = True
      Size = 3
    end
  end
  object ds_re_anexo: TDataSource
    DataSet = qry_re_anexo
    OnStateChange = ds_re_anexoStateChange
    Left = 40
    Top = 64
  end
  object upd_re_capa: TUpdateSQL
    ModifySQL.Strings = (
      'update TRE_CAPA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO,'
      '  NR_OUTRA_REF = :NR_OUTRA_REF,'
      '  NR_RE_SISCOMEX = :NR_RE_SISCOMEX,'
      '  NR_REG_VENDA = :NR_REG_VENDA,'
      '  NR_REG_CREDITO = :NR_REG_CREDITO,'
      '  NR_RE_VINCULADA = :NR_RE_VINCULADA,'
      '  NR_DI_VINCULADA = :NR_DI_VINCULADA,'
      '  CD_ENQUAD1 = :CD_ENQUAD1,'
      '  CD_ENQUAD2 = :CD_ENQUAD2,'
      '  CD_ENQUAD3 = :CD_ENQUAD3,'
      '  CD_ENQUAD4 = :CD_ENQUAD4,'
      '  CD_ENQUAD5 = :CD_ENQUAD5,'
      '  CD_ENQUAD6 = :CD_ENQUAD6,'
      '  CD_INST_NEGO = :CD_INST_NEGO,'
      '  CD_ACESSO = :CD_ACESSO,'
      '  CD_URF_EMBARQUE = :CD_URF_EMBARQUE,'
      '  CD_URF_DESPACHO = :CD_URF_DESPACHO,'
      '  IN_MARCA_ATUAL_FABRICANTE = :IN_MARCA_ATUAL_FABRICANTE,'
      '  IN_CONTROLE_RATEIO = :IN_CONTROLE_RATEIO,'
      '  DT_DATA_RE = :DT_DATA_RE,'
      '  DT_LIMITE_OPERACAO = :DT_LIMITE_OPERACAO,'
      '  VL_MARGEM_NAO_SACADA = :VL_MARGEM_NAO_SACADA,'
      '  VL_VALOR_CONSIGNACAO = :VL_VALOR_CONSIGNACAO,'
      '  VL_VALOR_COBER_CAMBIAL = :VL_VALOR_COBER_CAMBIAL,'
      '  VL_VALOR_FINANCEIRO_RC = :VL_VALOR_FINANCEIRO_RC,'
      '  VL_TOTAL_COND_VENDA_ACUM = :VL_TOTAL_COND_VENDA_ACUM,'
      '  VL_TOTAL_LOCAL_VENDA_ACUM = :VL_TOTAL_LOCAL_VENDA_ACUM,'
      '  CD_ULTIMO_ANEXO_TRANSMITIDO = :CD_ULTIMO_ANEXO_TRANSMITIDO,'
      '  IN_CONTROLE_TRANSMISSAO = :IN_CONTROLE_TRANSMISSAO,'
      '  IN_MARCA_TRANSMISSAO = :IN_MARCA_TRANSMISSAO,'
      '  DT_DATA_TRANSMISSAO = :DT_DATA_TRANSMISSAO,'
      '  CD_NUMERO_TRANSMISSAO = :CD_NUMERO_TRANSMISSAO,'
      '  VL_ESQUE_PG_TOTAL = :VL_ESQUE_PG_TOTAL,'
      '  VL_VALOR_NBM_INCLUIDAS = :VL_VALOR_NBM_INCLUIDAS,'
      '  CD_STATUS_RE = :CD_STATUS_RE,'
      '  TX_SITUACAO_RE = :TX_SITUACAO_RE,'
      '  CD_SUARIO = :CD_SUARIO,'
      '  DT_DATA = :DT_DATA,'
      '  TM_HORA = :TM_HORA,'
      '  CD_PROPRIETARIO = :CD_PROPRIETARIO,'
      '  IN_ORIGEM_REG = :IN_ORIGEM_REG,'
      '  NR_MASTER = :NR_MASTER,'
      '  NR_HOUSE = :NR_HOUSE,'
      '  DT_DATA_AVERBACAO = :DT_DATA_AVERBACAO,'
      '  DT_DATA_MASTER = :DT_DATA_MASTER,'
      '  CD_PAIS_FINAL = :CD_PAIS_FINAL,'
      '  CD_TIPO_IMPORTADOR = :CD_TIPO_IMPORTADOR,'
      '  CD_IMPORTADOR = :CD_IMPORTADOR,'
      '  DT_DATA_TRANSP_IBERNAT = :DT_DATA_TRANSP_IBERNAT,'
      '  TM_HORA_TRANSP_IBERNAT = :TM_HORA_TRANSP_IBERNAT,'
      '  CD_SITUACAO_RE = :CD_SITUACAO_RE,'
      '  TX_SITUACAO_SISBACEN = :TX_SITUACAO_SISBACEN,'
      '  CD_USUARIO_EXTERNO = :CD_USUARIO_EXTERNO,'
      '  TX_CPF_SISCOMEX = :TX_CPF_SISCOMEX,'
      '  TX_SENHA_SISCOMEX = :TX_SENHA_SISCOMEX,'
      '  NM_ARQUIVO_TRANSMISSAO = :NM_ARQUIVO_TRANSMISSAO,'
      '  IN_TRANSMISSAO_CONCLUIDA = :IN_TRANSMISSAO_CONCLUIDA,'
      '  CD_EXPORTADOR = :CD_EXPORTADOR,'
      '  IN_ORIGEM_RE = :IN_ORIGEM_RE,'
      '  QT_ANEXOS = :QT_ANEXOS,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  IN_AGRUPAR = :IN_AGRUPAR,'
      '  IN_QUEBRA_POR_VALOR = :IN_QUEBRA_POR_VALOR,'
      '  IN_QUEBRA_POR_FABRICANTE = :IN_QUEBRA_POR_FABRICANTE,'
      '  IN_DESC_TIPO_RECOF = :IN_DESC_TIPO_RECOF,'
      '  IN_NAO_QUEBRAR_LINHAS = :IN_NAO_QUEBRAR_LINHAS,'
      '  NR_PARCELAS = :NR_PARCELAS,'
      '  NR_PERIODICIDADE = :NR_PERIODICIDADE,'
      '  CD_MODALIDADE_TRANS = :CD_MODALIDADE_TRANS,'
      '  VL_CONSIGN = :VL_CONSIGN,'
      '  VL_SEM_COB_CAMBIAL = :VL_SEM_COB_CAMBIAL,'
      '  VL_FINANC_RC = :VL_FINANC_RC,'
      '  VL_PAGT_VISTA = :VL_PAGT_VISTA,'
      '  VL_PARCELA = :VL_PARCELA,'
      '  PC_MARGEM_NAO_SACADA = :PC_MARGEM_NAO_SACADA,'
      '  VL_ESQ_PAG_TOT = :VL_ESQ_PAG_TOT,'
      '  VL_PAGTO_ANTEC = :VL_PAGTO_ANTEC,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  TP_INDICADOR = :TP_INDICADOR,'
      '  PESO_LIQUIDO_TOTAL = :PESO_LIQUIDO_TOTAL,'
      '  VL_FRETE_TOTAL = :VL_FRETE_TOTAL,'
      '  VL_SEGURO_TOTAL = :VL_SEGURO_TOTAL,'
      '  DT_ULT_CONSULTA = :DT_ULT_CONSULTA,'
      '  TX_DOCUMENTO_SISCOMEX = :TX_DOCUMENTO_SISCOMEX,'
      '  TX_END_IMPORTADOR = :TX_END_IMPORTADOR,'
      '  CD_PAIS_IMPORTADOR = :CD_PAIS_IMPORTADOR,'
      '  IN_NOVOEX = :IN_NOVOEX'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO')
    InsertSQL.Strings = (
      'insert into TRE_CAPA'
      '  (NR_PROCESSO, NR_PROCESSO_COMPLEMENTO, NR_OUTRA_REF, '
      'NR_RE_SISCOMEX, '
      '   NR_REG_VENDA, NR_REG_CREDITO, NR_RE_VINCULADA, '
      'NR_DI_VINCULADA, CD_ENQUAD1, '
      '   CD_ENQUAD2, CD_ENQUAD3, CD_ENQUAD4, CD_ENQUAD5, CD_ENQUAD6, '
      'CD_INST_NEGO, '
      '   CD_ACESSO, CD_URF_EMBARQUE, CD_URF_DESPACHO, '
      'IN_MARCA_ATUAL_FABRICANTE, '
      '   IN_CONTROLE_RATEIO, DT_DATA_RE, DT_LIMITE_OPERACAO, '
      'VL_MARGEM_NAO_SACADA, '
      '   VL_VALOR_CONSIGNACAO, VL_VALOR_COBER_CAMBIAL, '
      'VL_VALOR_FINANCEIRO_RC, '
      '   VL_TOTAL_COND_VENDA_ACUM, VL_TOTAL_LOCAL_VENDA_ACUM, '
      'CD_ULTIMO_ANEXO_TRANSMITIDO, '
      '   IN_CONTROLE_TRANSMISSAO, IN_MARCA_TRANSMISSAO, '
      'DT_DATA_TRANSMISSAO, '
      '   CD_NUMERO_TRANSMISSAO, VL_ESQUE_PG_TOTAL, '
      'VL_VALOR_NBM_INCLUIDAS, CD_STATUS_RE, '
      
        '   TX_SITUACAO_RE, CD_SUARIO, DT_DATA, TM_HORA, CD_PROPRIETARIO,' +
        ' '
      'IN_ORIGEM_REG, '
      '   NR_MASTER, NR_HOUSE, DT_DATA_AVERBACAO, DT_DATA_MASTER, '
      'CD_PAIS_FINAL, '
      '   CD_TIPO_IMPORTADOR, CD_IMPORTADOR, DT_DATA_TRANSP_IBERNAT, '
      'TM_HORA_TRANSP_IBERNAT, '
      '   CD_SITUACAO_RE, TX_SITUACAO_SISBACEN, CD_USUARIO_EXTERNO, '
      'TX_CPF_SISCOMEX, '
      '   TX_SENHA_SISCOMEX, NM_ARQUIVO_TRANSMISSAO, '
      'IN_TRANSMISSAO_CONCLUIDA, '
      
        '   CD_EXPORTADOR, IN_ORIGEM_RE, QT_ANEXOS, CD_MOEDA, IN_AGRUPAR,' +
        ' '
      'IN_QUEBRA_POR_VALOR, '
      '   IN_QUEBRA_POR_FABRICANTE, IN_DESC_TIPO_RECOF, '
      'IN_NAO_QUEBRAR_LINHAS, '
      '   NR_PARCELAS, NR_PERIODICIDADE, CD_MODALIDADE_TRANS, '
      'VL_CONSIGN, VL_SEM_COB_CAMBIAL, '
      
        '   VL_FINANC_RC, VL_PAGT_VISTA, VL_PARCELA, PC_MARGEM_NAO_SACADA' +
        ', '
      'VL_ESQ_PAG_TOT, '
      
        '   VL_PAGTO_ANTEC, CD_INCOTERM, TP_INDICADOR, PESO_LIQUIDO_TOTAL' +
        ', '
      'VL_FRETE_TOTAL, '
      '   VL_SEGURO_TOTAL, DT_ULT_CONSULTA, TX_DOCUMENTO_SISCOMEX, '
      'TX_END_IMPORTADOR, '
      '   CD_PAIS_IMPORTADOR, IN_NOVOEX)'
      'values'
      '  (:NR_PROCESSO, :NR_PROCESSO_COMPLEMENTO, :NR_OUTRA_REF, '
      ':NR_RE_SISCOMEX, '
      '   :NR_REG_VENDA, :NR_REG_CREDITO, :NR_RE_VINCULADA, '
      ':NR_DI_VINCULADA, '
      '   :CD_ENQUAD1, :CD_ENQUAD2, :CD_ENQUAD3, :CD_ENQUAD4, '
      ':CD_ENQUAD5, :CD_ENQUAD6, '
      
        '   :CD_INST_NEGO, :CD_ACESSO, :CD_URF_EMBARQUE, :CD_URF_DESPACHO' +
        ', '
      ':IN_MARCA_ATUAL_FABRICANTE, '
      '   :IN_CONTROLE_RATEIO, :DT_DATA_RE, :DT_LIMITE_OPERACAO, '
      ':VL_MARGEM_NAO_SACADA, '
      '   :VL_VALOR_CONSIGNACAO, :VL_VALOR_COBER_CAMBIAL, '
      ':VL_VALOR_FINANCEIRO_RC, '
      '   :VL_TOTAL_COND_VENDA_ACUM, :VL_TOTAL_LOCAL_VENDA_ACUM, '
      ':CD_ULTIMO_ANEXO_TRANSMITIDO, '
      '   :IN_CONTROLE_TRANSMISSAO, :IN_MARCA_TRANSMISSAO, '
      ':DT_DATA_TRANSMISSAO, '
      '   :CD_NUMERO_TRANSMISSAO, :VL_ESQUE_PG_TOTAL, '
      ':VL_VALOR_NBM_INCLUIDAS, '
      
        '   :CD_STATUS_RE, :TX_SITUACAO_RE, :CD_SUARIO, :DT_DATA, :TM_HOR' +
        'A, '
      ':CD_PROPRIETARIO, '
      '   :IN_ORIGEM_REG, :NR_MASTER, :NR_HOUSE, :DT_DATA_AVERBACAO, '
      ':DT_DATA_MASTER, '
      '   :CD_PAIS_FINAL, :CD_TIPO_IMPORTADOR, :CD_IMPORTADOR, '
      ':DT_DATA_TRANSP_IBERNAT, '
      '   :TM_HORA_TRANSP_IBERNAT, :CD_SITUACAO_RE, '
      ':TX_SITUACAO_SISBACEN, :CD_USUARIO_EXTERNO, '
      
        '   :TX_CPF_SISCOMEX, :TX_SENHA_SISCOMEX, :NM_ARQUIVO_TRANSMISSAO' +
        ', '
      ':IN_TRANSMISSAO_CONCLUIDA, '
      '   :CD_EXPORTADOR, :IN_ORIGEM_RE, :QT_ANEXOS, :CD_MOEDA, '
      ':IN_AGRUPAR, :IN_QUEBRA_POR_VALOR, '
      '   :IN_QUEBRA_POR_FABRICANTE, :IN_DESC_TIPO_RECOF, '
      ':IN_NAO_QUEBRAR_LINHAS, '
      '   :NR_PARCELAS, :NR_PERIODICIDADE, :CD_MODALIDADE_TRANS, '
      ':VL_CONSIGN, '
      
        '   :VL_SEM_COB_CAMBIAL, :VL_FINANC_RC, :VL_PAGT_VISTA, :VL_PARCE' +
        'LA, '
      ':PC_MARGEM_NAO_SACADA, '
      
        '   :VL_ESQ_PAG_TOT, :VL_PAGTO_ANTEC, :CD_INCOTERM, :TP_INDICADOR' +
        ', '
      ':PESO_LIQUIDO_TOTAL, '
      '   :VL_FRETE_TOTAL, :VL_SEGURO_TOTAL, :DT_ULT_CONSULTA, '
      ':TX_DOCUMENTO_SISCOMEX, '
      '   :TX_END_IMPORTADOR, :CD_PAIS_IMPORTADOR, :IN_NOVOEX)')
    DeleteSQL.Strings = (
      'DELETE TRE_CAPA'
      'WHERE'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO')
    Left = 220
    Top = 16
  end
  object upd_re_anexo: TUpdateSQL
    ModifySQL.Strings = (
      'update TRE_ANEXO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO,'
      '  CD_RE_ANEXO = :CD_RE_ANEXO,'
      '  CD_NALADI = :CD_NALADI,'
      '  CD_NCM = :CD_NCM,'
      '  CD_NBM = :CD_NBM,'
      '  CD_UF_PRODUTOR = :CD_UF_PRODUTOR,'
      '  CD_EMBALAGEM = :CD_EMBALAGEM,'
      '  CD_UNID_MEDIDA = :CD_UNID_MEDIDA,'
      '  CD_FINALIDADE = :CD_FINALIDADE,'
      '  CD_FORMA_PGTO = :CD_FORMA_PGTO,'
      '  TX_CATEGORIA_TEXTIL = :TX_CATEGORIA_TEXTIL,'
      '  IN_EXPORTADOR_FABRICANTE = :IN_EXPORTADOR_FABRICANTE,'
      '  IN_OBS_EXPORTADOR = :IN_OBS_EXPORTADOR,'
      '  DT_VALIDADE_EMBARQUE = :DT_VALIDADE_EMBARQUE,'
      '  PESO_LIQUIDO = :PESO_LIQUIDO,'
      '  QT_UNIDADE_COMERCIAL = :QT_UNIDADE_COMERCIAL,'
      '  QT_MEDIA_NBM = :QT_MEDIA_NBM,'
      '  VL_COND_VENDA = :VL_COND_VENDA,'
      '  VL_LOCAL_VENDA = :VL_LOCAL_VENDA,'
      '  PC_COMISSAO = :PC_COMISSAO,'
      '  VL_COMISSAO = :VL_COMISSAO,'
      '  VL_FRETE_RATEADO = :VL_FRETE_RATEADO,'
      '  VL_SEGURO_RATEADO = :VL_SEGURO_RATEADO,'
      '  PESO_BRUTO_RATEADO = :PESO_BRUTO_RATEADO,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  DT_DATA = :DT_DATA,'
      '  TM_HORA = :TM_HORA,'
      '  CD_ORIGEM_REGISTRO = :CD_ORIGEM_REGISTRO,'
      '  TX_PENDENCIA = :TX_PENDENCIA,'
      '  TX_OBSERVACOES = :TX_OBSERVACOES,'
      '  TX_MENS_ADVERTENCIA1 = :TX_MENS_ADVERTENCIA1,'
      '  TX_MENS_ADVERTENCIA2 = :TX_MENS_ADVERTENCIA2,'
      '  TX_MENS_ADVERTENCIA3 = :TX_MENS_ADVERTENCIA3,'
      '  TX_MENS_ADVERTENCIA4 = :TX_MENS_ADVERTENCIA4,'
      '  TX_MENS_ADVERTENCIA5 = :TX_MENS_ADVERTENCIA5,'
      '  TX_MENS_ADVERTENCIA6 = :TX_MENS_ADVERTENCIA6,'
      '  TX_MENS_ADVERTENCIA7 = :TX_MENS_ADVERTENCIA7,'
      '  TX_MENS_ADVERTENCIA8 = :TX_MENS_ADVERTENCIA8,'
      '  TX_MENS_ADVERTENCIA9 = :TX_MENS_ADVERTENCIA9,'
      '  TX_MENS_ADVERTENCIA10 = :TX_MENS_ADVERTENCIA10,'
      '  TX_MENS_ADVERTENCIA11 = :TX_MENS_ADVERTENCIA11,'
      '  TX_MENS_ADVERTENCIA12 = :TX_MENS_ADVERTENCIA12,'
      '  TX_MENS_ADVERTENCIA13 = :TX_MENS_ADVERTENCIA13,'
      '  TX_OBSERV_ORG_ANUENT1 = :TX_OBSERV_ORG_ANUENT1,'
      '  TX_OBSERV_ORG_ANUENT2 = :TX_OBSERV_ORG_ANUENT2,'
      '  TX_OBSERV_ORG_ANUENT3 = :TX_OBSERV_ORG_ANUENT3,'
      '  TX_OBSERV_ORG_ANUENT4 = :TX_OBSERV_ORG_ANUENT4,'
      '  TX_OBSERV_ORG_ANUENT5 = :TX_OBSERV_ORG_ANUENT5,'
      '  TX_OBSERV_ORG_ANUENT6 = :TX_OBSERV_ORG_ANUENT6,'
      '  TX_OBSERV_ORG_ANUENT7 = :TX_OBSERV_ORG_ANUENT7,'
      '  TX_OBSERV_ORG_ANUENT8 = :TX_OBSERV_ORG_ANUENT8,'
      '  TX_OBSERV_ORG_ANUENT9 = :TX_OBSERV_ORG_ANUENT9,'
      '  TX_OBSERV_ORG_ANUENT10 = :TX_OBSERV_ORG_ANUENT10,'
      '  TX_OBSERV_ORG_ANUENT11 = :TX_OBSERV_ORG_ANUENT11,'
      '  TX_OBSERV_ORG_ANUENT12 = :TX_OBSERV_ORG_ANUENT12,'
      '  TX_OBSERV_ORG_ANUENT13 = :TX_OBSERV_ORG_ANUENT13,'
      '  TX_OBSERV_ORG_ANUENT14 = :TX_OBSERV_ORG_ANUENT14,'
      '  QT_EMBARCADA = :QT_EMBARCADA,'
      '  VL_EMBARCADO = :VL_EMBARCADO,'
      '  DT_EMBARQUE = :DT_EMBARQUE,'
      '  VL_CAMB_PROVIS_RE = :VL_CAMB_PROVIS_RE,'
      '  DT_PROVIS = :DT_PROVIS,'
      '  VL_CAMB_APLIC_RE = :VL_CAMB_APLIC_RE,'
      '  DT_APLICACAO = :DT_APLICACAO,'
      '  VL_CAMB_LIQ_DESP = :VL_CAMB_LIQ_DESP,'
      '  DT_EMB_EF_COB_CAMB = :DT_EMB_EF_COB_CAMB,'
      '  NR_SD_SISCOMEX = :NR_SD_SISCOMEX,'
      '  VL_COM_AG_EFET = :VL_COM_AG_EFET,'
      '  DT_EMISSAO_CONHEC_EMB = :DT_EMISSAO_CONHEC_EMB,'
      '  PESO_LIQUIDO_KG_REBATE = :PESO_LIQUIDO_KG_REBATE,'
      '  QT_COMERC_REBATE = :QT_COMERC_REBATE,'
      '  CD_UNIDADE_COMERC_REBATE = :CD_UNIDADE_COMERC_REBATE,'
      '  QT_NBM_SH_REBATE = :QT_NBM_SH_REBATE,'
      '  CD_UNIDADE_NBM_SH_REBATE = :CD_UNIDADE_NBM_SH_REBATE,'
      '  VL_TOTAL_COND_VENDA_REBATE = :VL_TOTAL_COND_VENDA_REBATE,'
      '  VL_TOTAL_LOCAL_EMB_REBATE = :VL_TOTAL_LOCAL_EMB_REBATE,'
      '  VL_COMISSAO_AGENTE_REBATE = :VL_COMISSAO_AGENTE_REBATE,'
      '  CD_FORMA_PGTO_REBATE = :CD_FORMA_PGTO_REBATE,'
      '  DT_AVERBACAO = :DT_AVERBACAO,'
      '  IN_TRANSMISSAO_CONCLUIDA = :IN_TRANSMISSAO_CONCLUIDA,'
      '  TX_DESC_MERCADORIA = :TX_DESC_MERCADORIA,'
      '  CD_SULF_NCM = :CD_SULF_NCM'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO')
    InsertSQL.Strings = (
      'insert into TRE_ANEXO'
      '  (NR_PROCESSO, NR_PROCESSO_COMPLEMENTO, CD_RE_ANEXO, '
      'CD_NALADI, CD_NCM, '
      '   CD_NBM, CD_UF_PRODUTOR, CD_EMBALAGEM, CD_UNID_MEDIDA, '
      'CD_FINALIDADE, '
      
        '   CD_FORMA_PGTO, TX_CATEGORIA_TEXTIL, IN_EXPORTADOR_FABRICANTE,' +
        ' '
      'IN_OBS_EXPORTADOR, '
      '   DT_VALIDADE_EMBARQUE, PESO_LIQUIDO, QT_UNIDADE_COMERCIAL, '
      'QT_MEDIA_NBM, '
      '   VL_COND_VENDA, VL_LOCAL_VENDA, PC_COMISSAO, VL_COMISSAO, '
      'VL_FRETE_RATEADO, '
      '   VL_SEGURO_RATEADO, PESO_BRUTO_RATEADO, CD_USUARIO, DT_DATA, '
      'TM_HORA, '
      '   CD_ORIGEM_REGISTRO, TX_PENDENCIA, TX_OBSERVACOES, '
      'TX_MENS_ADVERTENCIA1, '
      '   TX_MENS_ADVERTENCIA2, TX_MENS_ADVERTENCIA3, '
      'TX_MENS_ADVERTENCIA4, TX_MENS_ADVERTENCIA5, '
      '   TX_MENS_ADVERTENCIA6, TX_MENS_ADVERTENCIA7, '
      'TX_MENS_ADVERTENCIA8, TX_MENS_ADVERTENCIA9, '
      '   TX_MENS_ADVERTENCIA10, TX_MENS_ADVERTENCIA11, '
      'TX_MENS_ADVERTENCIA12, '
      '   TX_MENS_ADVERTENCIA13, TX_OBSERV_ORG_ANUENT1, '
      'TX_OBSERV_ORG_ANUENT2, '
      '   TX_OBSERV_ORG_ANUENT3, TX_OBSERV_ORG_ANUENT4, '
      'TX_OBSERV_ORG_ANUENT5, '
      '   TX_OBSERV_ORG_ANUENT6, TX_OBSERV_ORG_ANUENT7, '
      'TX_OBSERV_ORG_ANUENT8, '
      '   TX_OBSERV_ORG_ANUENT9, TX_OBSERV_ORG_ANUENT10, '
      'TX_OBSERV_ORG_ANUENT11, '
      '   TX_OBSERV_ORG_ANUENT12, TX_OBSERV_ORG_ANUENT13, '
      'TX_OBSERV_ORG_ANUENT14, '
      '   QT_EMBARCADA, VL_EMBARCADO, DT_EMBARQUE, VL_CAMB_PROVIS_RE, '
      'DT_PROVIS, '
      '   VL_CAMB_APLIC_RE, DT_APLICACAO, VL_CAMB_LIQ_DESP, '
      'DT_EMB_EF_COB_CAMB, '
      '   NR_SD_SISCOMEX, VL_COM_AG_EFET, DT_EMISSAO_CONHEC_EMB, '
      'PESO_LIQUIDO_KG_REBATE, '
      '   QT_COMERC_REBATE, CD_UNIDADE_COMERC_REBATE, '
      'QT_NBM_SH_REBATE, CD_UNIDADE_NBM_SH_REBATE, '
      '   VL_TOTAL_COND_VENDA_REBATE, VL_TOTAL_LOCAL_EMB_REBATE, '
      'VL_COMISSAO_AGENTE_REBATE, '
      '   CD_FORMA_PGTO_REBATE, DT_AVERBACAO, '
      'IN_TRANSMISSAO_CONCLUIDA, TX_DESC_MERCADORIA, CD_SULF_NCM)'
      'values'
      '  (:NR_PROCESSO, :NR_PROCESSO_COMPLEMENTO, :CD_RE_ANEXO, '
      ':CD_NALADI, :CD_NCM, '
      '   :CD_NBM, :CD_UF_PRODUTOR, :CD_EMBALAGEM, :CD_UNID_MEDIDA, '
      ':CD_FINALIDADE, '
      '   :CD_FORMA_PGTO, :TX_CATEGORIA_TEXTIL, '
      ':IN_EXPORTADOR_FABRICANTE, :IN_OBS_EXPORTADOR, '
      '   :DT_VALIDADE_EMBARQUE, :PESO_LIQUIDO, :QT_UNIDADE_COMERCIAL, '
      ':QT_MEDIA_NBM, '
      '   :VL_COND_VENDA, :VL_LOCAL_VENDA, :PC_COMISSAO, :VL_COMISSAO, '
      ':VL_FRETE_RATEADO, '
      '   :VL_SEGURO_RATEADO, :PESO_BRUTO_RATEADO, :CD_USUARIO, '
      ':DT_DATA, :TM_HORA, '
      '   :CD_ORIGEM_REGISTRO, :TX_PENDENCIA, :TX_OBSERVACOES, '
      ':TX_MENS_ADVERTENCIA1, '
      '   :TX_MENS_ADVERTENCIA2, :TX_MENS_ADVERTENCIA3, '
      ':TX_MENS_ADVERTENCIA4, '
      '   :TX_MENS_ADVERTENCIA5, :TX_MENS_ADVERTENCIA6, '
      ':TX_MENS_ADVERTENCIA7, '
      '   :TX_MENS_ADVERTENCIA8, :TX_MENS_ADVERTENCIA9, '
      ':TX_MENS_ADVERTENCIA10, '
      '   :TX_MENS_ADVERTENCIA11, :TX_MENS_ADVERTENCIA12, '
      ':TX_MENS_ADVERTENCIA13, '
      '   :TX_OBSERV_ORG_ANUENT1, :TX_OBSERV_ORG_ANUENT2, '
      ':TX_OBSERV_ORG_ANUENT3, '
      '   :TX_OBSERV_ORG_ANUENT4, :TX_OBSERV_ORG_ANUENT5, '
      ':TX_OBSERV_ORG_ANUENT6, '
      '   :TX_OBSERV_ORG_ANUENT7, :TX_OBSERV_ORG_ANUENT8, '
      ':TX_OBSERV_ORG_ANUENT9, '
      '   :TX_OBSERV_ORG_ANUENT10, :TX_OBSERV_ORG_ANUENT11, '
      ':TX_OBSERV_ORG_ANUENT12, '
      '   :TX_OBSERV_ORG_ANUENT13, :TX_OBSERV_ORG_ANUENT14, '
      ':QT_EMBARCADA, :VL_EMBARCADO, '
      
        '   :DT_EMBARQUE, :VL_CAMB_PROVIS_RE, :DT_PROVIS, :VL_CAMB_APLIC_' +
        'RE, '
      ':DT_APLICACAO, '
      '   :VL_CAMB_LIQ_DESP, :DT_EMB_EF_COB_CAMB, :NR_SD_SISCOMEX, '
      ':VL_COM_AG_EFET, '
      '   :DT_EMISSAO_CONHEC_EMB, :PESO_LIQUIDO_KG_REBATE, '
      ':QT_COMERC_REBATE, '
      '   :CD_UNIDADE_COMERC_REBATE, :QT_NBM_SH_REBATE, '
      ':CD_UNIDADE_NBM_SH_REBATE, '
      '   :VL_TOTAL_COND_VENDA_REBATE, :VL_TOTAL_LOCAL_EMB_REBATE, '
      ':VL_COMISSAO_AGENTE_REBATE, '
      '   :CD_FORMA_PGTO_REBATE, :DT_AVERBACAO, '
      ':IN_TRANSMISSAO_CONCLUIDA, :TX_DESC_MERCADORIA, :CD_SULF_NCM)')
    DeleteSQL.Strings = (
      'DELETE TRE_ANEXO'
      'WHERE'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO')
    Left = 220
    Top = 64
  end
  object qry_re_anexo_fabric: TQuery
    CachedUpdates = True
    BeforePost = qry_re_anexo_fabricBeforePost
    AfterPost = AplicaUpdates
    AfterDelete = AplicaUpdates
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT '#9'NR_PROCESSO, NR_PROCESSO_COMPLEMENTO,'
      '       '#9'CD_RE_ANEXO, CD_FABRICANTE, CD_RE_ANEXO_FABRIC,'
      
        '       (SELECT AP_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EM' +
        'PRESA = CD_FABRICANTE) AS FABRICANTE,'
      
        #9'     (SELECT CGC_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EM' +
        'PRESA = CD_FABRICANTE) AS CNPJ,'
      
        #9'     (SELECT END_UF FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA' +
        ' = CD_FABRICANTE) AS ESTADO_PRODUTOR,'
      
        #9'     (SELECT CD_NCM '#9'    FROM TRE_ANEXO (NOLOCK)    WHERE CD_RE' +
        '_ANEXO = RAF.CD_RE_ANEXO AND NR_PROCESSO = RAF.NR_PROCESSO AND N' +
        'R_PROCESSO_COMPLEMENTO = RAF.NR_PROCESSO_COMPLEMENTO) AS NCM,'
      '      '#9'NR_ATO,'
      '      '#9'QT_MERCADORIA,'
      '      '#9'VL_TOTAL'
      'FROM '#9'  TRE_ANEXO_FABRIC RAF (NOLOCK)'
      'WHERE '#9'NR_PROCESSO = :NR_PROCESSO'
      'AND    '#9'NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO'
      'AND '#9'CD_RE_ANEXO  = :CD_RE_ANEXO'
      ''
      ' ')
    UpdateObject = upd_re_anexo_fabric
    Left = 128
    Top = 111
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO_COMPLEMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_RE_ANEXO'
        ParamType = ptInput
      end>
    object qry_re_anexo_fabricNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_re_anexo_fabricCD_RE_ANEXO: TIntegerField
      FieldName = 'CD_RE_ANEXO'
    end
    object qry_re_anexo_fabricCD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_re_anexo_fabricFABRICANTE: TStringField
      FieldName = 'FABRICANTE'
      FixedChar = True
      Size = 10
    end
    object qry_re_anexo_fabricCNPJ: TStringField
      FieldName = 'CNPJ'
      FixedChar = True
      Size = 14
    end
    object qry_re_anexo_fabricESTADO_PRODUTOR: TStringField
      FieldName = 'ESTADO_PRODUTOR'
      FixedChar = True
      Size = 2
    end
    object qry_re_anexo_fabricNCM: TStringField
      FieldName = 'NCM'
      FixedChar = True
      Size = 10
    end
    object qry_re_anexo_fabricNR_ATO: TStringField
      FieldName = 'NR_ATO'
      FixedChar = True
      Size = 13
    end
    object qry_re_anexo_fabricQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object qry_re_anexo_fabricVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '###0.00'
    end
    object qry_re_anexo_fabricNR_PROCESSO_COMPLEMENTO: TStringField
      FieldName = 'NR_PROCESSO_COMPLEMENTO'
      FixedChar = True
      Size = 3
    end
    object qry_re_anexo_fabricCD_RE_ANEXO_FABRIC: TIntegerField
      FieldName = 'CD_RE_ANEXO_FABRIC'
    end
  end
  object ds_re_anexo_fabric: TDataSource
    DataSet = qry_re_anexo_fabric
    OnStateChange = ds_re_anexo_fabricStateChange
    Left = 40
    Top = 112
  end
  object upd_re_anexo_fabric: TUpdateSQL
    ModifySQL.Strings = (
      'update TRE_ANEXO_FABRIC'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO,'
      '  CD_RE_ANEXO = :CD_RE_ANEXO,'
      '  CD_RE_ANEXO_FABRIC = :CD_RE_ANEXO_FABRIC,'
      '  CD_FABRICANTE = :CD_FABRICANTE,'
      '  NR_ATO = :NR_ATO,'
      '  QT_MERCADORIA = :QT_MERCADORIA,'
      '  VL_TOTAL = :VL_TOTAL'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO and'
      '  CD_RE_ANEXO_FABRIC = :OLD_CD_RE_ANEXO_FABRIC')
    InsertSQL.Strings = (
      'insert into TRE_ANEXO_FABRIC'
      
        '  (NR_PROCESSO, NR_PROCESSO_COMPLEMENTO, CD_RE_ANEXO, CD_RE_ANEX' +
        'O_FABRIC, '
      '   CD_FABRICANTE, NR_ATO, QT_MERCADORIA, VL_TOTAL)'
      'values'
      
        '  (:NR_PROCESSO, :NR_PROCESSO_COMPLEMENTO, :CD_RE_ANEXO, :CD_RE_' +
        'ANEXO_FABRIC, '
      '   :CD_FABRICANTE, :NR_ATO, :QT_MERCADORIA, :VL_TOTAL)')
    DeleteSQL.Strings = (
      'DELETE TRE_ANEXO_FABRIC'
      'WHERE'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO and'
      '  CD_RE_ANEXO_FABRIC = :OLD_CD_RE_ANEXO_FABRIC')
    Left = 219
    Top = 110
  end
  object qry_forma_pgto: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TFORMA_PAGAR (NOLOCK)')
    Left = 142
    Top = 159
    object qry_forma_pgtoCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TFORMA_PAGAR.CODIGO'
      FixedChar = True
      Size = 1
    end
    object qry_forma_pgtoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TFORMA_PAGAR.DESCRICAO'
      FixedChar = True
      Size = 30
    end
    object qry_forma_pgtoCD_FORMA_PGTO_REBATE: TStringField
      FieldName = 'CD_FORMA_PGTO_REBATE'
      Origin = 'DBBROKER.TFORMA_PAGAR.CD_FORMA_PGTO_REBATE'
      FixedChar = True
      Size = 1
    end
  end
  object ds_forma_pgto: TDataSource
    DataSet = qry_forma_pgto
    Left = 40
    Top = 157
  end
  object qry_exclui_anexo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE TRE_ANEXO'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'AND NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO'
      '')
    Left = 307
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO_COMPLEMENTO'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TRE_ANEXO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object IntegerField1: TIntegerField
      FieldName = 'CD_RE_ANEXO'
      Origin = 'DBBROKER.TRE_ANEXO.CD_RE_ANEXO'
    end
    object StringField2: TStringField
      FieldName = 'CD_NALADI'
      Origin = 'DBBROKER.TRE_ANEXO.CD_NALADI'
      FixedChar = True
      Size = 8
    end
    object StringField3: TStringField
      FieldName = 'CD_NCM'
      Origin = 'DBBROKER.TRE_ANEXO.CD_NCM'
      FixedChar = True
      Size = 10
    end
    object StringField4: TStringField
      FieldName = 'CD_NBM'
      Origin = 'DBBROKER.TRE_ANEXO.CD_NBM'
      FixedChar = True
      Size = 10
    end
    object StringField5: TStringField
      FieldName = 'CD_UF_PRODUTOR'
      Origin = 'DBBROKER.TRE_ANEXO.CD_UF_PRODUTOR'
      FixedChar = True
      Size = 2
    end
    object StringField6: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'DBBROKER.TRE_ANEXO.CD_EMBALAGEM'
      FixedChar = True
      Size = 10
    end
    object StringField7: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'DBBROKER.TRE_ANEXO.CD_UNID_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object StringField8: TStringField
      FieldName = 'CD_FINALIDADE'
      Origin = 'DBBROKER.TRE_ANEXO.CD_FINALIDADE'
      FixedChar = True
      Size = 3
    end
    object StringField9: TStringField
      FieldName = 'CD_FORMA_PGTO'
      Origin = 'DBBROKER.TRE_ANEXO.CD_FORMA_PGTO'
      FixedChar = True
      Size = 1
    end
    object StringField10: TStringField
      FieldName = 'TX_CATEGORIA_TEXTIL'
      Origin = 'DBBROKER.TRE_ANEXO.TX_CATEGORIA_TEXTIL'
      FixedChar = True
      Size = 30
    end
    object StringField11: TStringField
      FieldName = 'IN_EXPORTADOR_FABRICANTE'
      Origin = 'DBBROKER.TRE_ANEXO.IN_EXPORTADOR_FABRICANTE'
      FixedChar = True
      Size = 1
    end
    object StringField12: TStringField
      FieldName = 'IN_OBS_EXPORTADOR'
      Origin = 'DBBROKER.TRE_ANEXO.IN_OBS_EXPORTADOR'
      FixedChar = True
      Size = 1
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DT_VALIDADE_EMBARQUE'
      Origin = 'DBBROKER.TRE_ANEXO.DT_VALIDADE_EMBARQUE'
      EditMask = '!99/99/0000;1;_'
    end
    object FloatField1: TFloatField
      FieldName = 'PESO_LIQUIDO'
      Origin = 'DBBROKER.TRE_ANEXO.PESO_LIQUIDO'
      DisplayFormat = '#,##0.00000'
    end
    object FloatField2: TFloatField
      FieldName = 'QT_UNIDADE_COMERCIAL'
      Origin = 'DBBROKER.TRE_ANEXO.QT_UNIDADE_COMERCIAL'
      DisplayFormat = '#,##0.00000'
    end
    object FloatField3: TFloatField
      FieldName = 'QT_MEDIA_NBM'
      Origin = 'DBBROKER.TRE_ANEXO.QT_MEDIA_NBM'
      DisplayFormat = '#,##0.00000'
    end
    object FloatField4: TFloatField
      FieldName = 'VL_COND_VENDA'
      Origin = 'DBBROKER.TRE_ANEXO.VL_COND_VENDA'
      DisplayFormat = '#,##0.00'
    end
    object FloatField5: TFloatField
      FieldName = 'VL_LOCAL_VENDA'
      Origin = 'DBBROKER.TRE_ANEXO.VL_LOCAL_VENDA'
      DisplayFormat = '#,##0.00'
    end
    object FloatField6: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'DBBROKER.TRE_ANEXO.PC_COMISSAO'
      DisplayFormat = '#,##0.00'
    end
    object FloatField7: TFloatField
      FieldName = 'VL_COMISSAO'
      Origin = 'DBBROKER.TRE_ANEXO.VL_COMISSAO'
      DisplayFormat = '#,##0.00'
    end
    object FloatField8: TFloatField
      FieldName = 'VL_FRETE_RATEADO'
      Origin = 'DBBROKER.TRE_ANEXO.VL_FRETE_RATEADO'
      DisplayFormat = '#,##0.00'
    end
    object FloatField9: TFloatField
      FieldName = 'VL_SEGURO_RATEADO'
      Origin = 'DBBROKER.TRE_ANEXO.VL_SEGURO_RATEADO'
      DisplayFormat = '#,##0.00'
    end
    object FloatField10: TFloatField
      FieldName = 'PESO_BRUTO_RATEADO'
      Origin = 'DBBROKER.TRE_ANEXO.PESO_BRUTO_RATEADO'
      DisplayFormat = '#,##0.00000'
    end
    object StringField13: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TRE_ANEXO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DT_DATA'
      Origin = 'DBBROKER.TRE_ANEXO.DT_DATA'
      EditMask = '!99/99/0000;1;_'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'TM_HORA'
      Origin = 'DBBROKER.TRE_ANEXO.TM_HORA'
    end
    object StringField14: TStringField
      FieldName = 'CD_ORIGEM_REGISTRO'
      Origin = 'DBBROKER.TRE_ANEXO.CD_ORIGEM_REGISTRO'
      FixedChar = True
      Size = 1
    end
    object StringField15: TStringField
      FieldName = 'TX_PENDENCIA'
      Origin = 'DBBROKER.TRE_ANEXO.TX_PENDENCIA'
      FixedChar = True
      Size = 80
    end
    object StringField16: TStringField
      FieldName = 'TX_OBSERVACOES'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERVACOES'
      FixedChar = True
      Size = 80
    end
    object StringField17: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA1'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA1'
      FixedChar = True
      Size = 75
    end
    object StringField18: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA2'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA2'
      FixedChar = True
      Size = 75
    end
    object StringField19: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA3'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA3'
      FixedChar = True
      Size = 75
    end
    object StringField20: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA4'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA4'
      FixedChar = True
      Size = 75
    end
    object StringField21: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA5'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA5'
      FixedChar = True
      Size = 75
    end
    object StringField22: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA6'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA6'
      FixedChar = True
      Size = 75
    end
    object StringField23: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA7'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA7'
      FixedChar = True
      Size = 75
    end
    object StringField24: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA8'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA8'
      FixedChar = True
      Size = 75
    end
    object StringField25: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA9'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA9'
      FixedChar = True
      Size = 75
    end
    object StringField26: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA10'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA10'
      FixedChar = True
      Size = 75
    end
    object StringField27: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA11'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA11'
      FixedChar = True
      Size = 75
    end
    object StringField28: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA12'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA12'
      FixedChar = True
      Size = 75
    end
    object StringField29: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA13'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA13'
      FixedChar = True
      Size = 75
    end
    object StringField30: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT1'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT1'
      FixedChar = True
      Size = 75
    end
    object StringField31: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT2'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT2'
      FixedChar = True
      Size = 75
    end
    object StringField32: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT3'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT3'
      FixedChar = True
      Size = 75
    end
    object StringField33: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT4'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT4'
      FixedChar = True
      Size = 75
    end
    object StringField34: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT5'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT5'
      FixedChar = True
      Size = 75
    end
    object StringField35: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT6'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT6'
      FixedChar = True
      Size = 75
    end
    object StringField36: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT7'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT7'
      FixedChar = True
      Size = 75
    end
    object StringField37: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT8'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT8'
      FixedChar = True
      Size = 75
    end
    object StringField38: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT9'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT9'
      FixedChar = True
      Size = 75
    end
    object StringField39: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT10'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT10'
      FixedChar = True
      Size = 75
    end
    object StringField40: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT11'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT11'
      FixedChar = True
      Size = 75
    end
    object StringField41: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT12'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT12'
      FixedChar = True
      Size = 75
    end
    object StringField42: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT13'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT13'
      FixedChar = True
      Size = 75
    end
    object StringField43: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT14'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT14'
      FixedChar = True
      Size = 75
    end
    object FloatField11: TFloatField
      FieldName = 'QT_EMBARCADA'
      Origin = 'DBBROKER.TRE_ANEXO.QT_EMBARCADA'
      DisplayFormat = '#,##0.00000'
    end
    object FloatField12: TFloatField
      FieldName = 'VL_EMBARCADO'
      Origin = 'DBBROKER.TRE_ANEXO.VL_EMBARCADO'
      DisplayFormat = '#,##0.00'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Origin = 'DBBROKER.TRE_ANEXO.DT_EMBARQUE'
      EditMask = '!99/99/0000;1;_'
    end
    object FloatField13: TFloatField
      FieldName = 'VL_CAMB_PROVIS_RE'
      Origin = 'DBBROKER.TRE_ANEXO.VL_CAMB_PROVIS_RE'
      DisplayFormat = '#,##0.00'
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'DT_PROVIS'
      Origin = 'DBBROKER.TRE_ANEXO.DT_PROVIS'
      EditMask = '!99/99/0000;1;_'
    end
    object FloatField14: TFloatField
      FieldName = 'VL_CAMB_APLIC_RE'
      Origin = 'DBBROKER.TRE_ANEXO.VL_CAMB_APLIC_RE'
      DisplayFormat = '#,##0.00'
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'DT_APLICACAO'
      Origin = 'DBBROKER.TRE_ANEXO.DT_APLICACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object FloatField15: TFloatField
      FieldName = 'VL_CAMB_LIQ_DESP'
      Origin = 'DBBROKER.TRE_ANEXO.VL_CAMB_LIQ_DESP'
      DisplayFormat = '#,##0.00'
    end
    object DateTimeField7: TDateTimeField
      FieldName = 'DT_EMB_EF_COB_CAMB'
      Origin = 'DBBROKER.TRE_ANEXO.DT_EMB_EF_COB_CAMB'
    end
    object StringField44: TStringField
      FieldName = 'NR_SD_SISCOMEX'
      Origin = 'DBBROKER.TRE_ANEXO.NR_SD_SISCOMEX'
      FixedChar = True
      Size = 12
    end
    object FloatField16: TFloatField
      FieldName = 'VL_COM_AG_EFET'
      Origin = 'DBBROKER.TRE_ANEXO.VL_COM_AG_EFET'
      DisplayFormat = '#,##0.00'
    end
    object DateTimeField8: TDateTimeField
      FieldName = 'DT_EMISSAO_CONHEC_EMB'
      Origin = 'DBBROKER.TRE_ANEXO.DT_EMISSAO_CONHEC_EMB'
      EditMask = '!99/99/0000;1;_'
    end
    object FloatField17: TFloatField
      FieldName = 'PESO_LIQUIDO_KG_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.PESO_LIQUIDO_KG_REBATE'
      DisplayFormat = '#,##0.00000'
    end
    object FloatField18: TFloatField
      FieldName = 'QT_COMERC_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.QT_COMERC_REBATE'
      DisplayFormat = '#,##0.00000'
    end
    object StringField45: TStringField
      FieldName = 'CD_UNIDADE_COMERC_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.CD_UNIDADE_COMERC_REBATE'
      FixedChar = True
      Size = 15
    end
    object FloatField19: TFloatField
      FieldName = 'QT_NBM_SH_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.QT_NBM_SH_REBATE'
      DisplayFormat = '#,##0.00000'
    end
    object StringField46: TStringField
      FieldName = 'CD_UNIDADE_NBM_SH_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.CD_UNIDADE_NBM_SH_REBATE'
      FixedChar = True
      Size = 15
    end
    object FloatField20: TFloatField
      FieldName = 'VL_TOTAL_COND_VENDA_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.VL_TOTAL_COND_VENDA_REBATE'
      DisplayFormat = '#,##0.00'
    end
    object FloatField21: TFloatField
      FieldName = 'VL_TOTAL_LOCAL_EMB_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.VL_TOTAL_LOCAL_EMB_REBATE'
      DisplayFormat = '#,##0.00'
    end
    object FloatField22: TFloatField
      FieldName = 'VL_COMISSAO_AGENTE_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.VL_COMISSAO_AGENTE_REBATE'
      DisplayFormat = '#,##0.00'
    end
    object StringField47: TStringField
      FieldName = 'CD_FORMA_PGTO_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.CD_FORMA_PGTO_REBATE'
      FixedChar = True
      Size = 1
    end
    object DateTimeField9: TDateTimeField
      FieldName = 'DT_AVERBACAO'
      Origin = 'DBBROKER.TRE_ANEXO.DT_AVERBACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object StringField48: TStringField
      FieldName = 'IN_TRANSMISSAO_CONCLUIDA'
      Origin = 'DBBROKER.TRE_ANEXO.IN_TRANSMISSAO_CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object MemoField1: TMemoField
      FieldName = 'TX_DESC_MERCADORIA'
      Origin = 'DBBROKER.TRE_ANEXO.TX_DESC_MERCADORIA'
      BlobType = ftMemo
    end
    object MemoField2: TMemoField
      FieldName = 'TX_OBSERVACAO_EXPORTADOR'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERVACAO_EXPORTADOR'
      BlobType = ftMemo
    end
    object StringField49: TStringField
      FieldKind = fkLookup
      FieldName = 'lookforma_pgto'
      LookupDataSet = qry_forma_pgto
      LookupKeyFields = 'CD_FORMA_PGTO_REBATE'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_FORMA_PGTO_REBATE'
      Lookup = True
    end
  end
  object qry_ncm_: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TNCM (NOLOCK)')
    Left = 308
    Top = 208
    object qry_ncm_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TNCM.CODIGO'
      FixedChar = True
      Size = 8
    end
    object qry_ncm_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TNCM.DESCRICAO'
      FixedChar = True
      Size = 120
    end
    object qry_ncm_UNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      Origin = 'DBBROKER.TNCM.UNIDADE_MEDIDA'
      FixedChar = True
      Size = 4
    end
    object qry_ncm_ALIQUOTA_II: TStringField
      FieldName = 'ALIQUOTA_II'
      Origin = 'DBBROKER.TNCM.ALIQUOTA_II'
      FixedChar = True
      Size = 6
    end
    object qry_ncm_DATA_INICIO_VIG_II: TStringField
      FieldName = 'DATA_INICIO_VIG_II'
      Origin = 'DBBROKER.TNCM.DATA_INICIO_VIG_II'
      FixedChar = True
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_II: TStringField
      FieldName = 'DATA_FIM_VIG_II'
      Origin = 'DBBROKER.TNCM.DATA_FIM_VIG_II'
      FixedChar = True
      Size = 10
    end
    object qry_ncm_ALIQUOTA_II_MERCOSUL: TStringField
      FieldName = 'ALIQUOTA_II_MERCOSUL'
      Origin = 'DBBROKER.TNCM.ALIQUOTA_II_MERCOSUL'
      FixedChar = True
      Size = 6
    end
    object qry_ncm_DATA_INICIO_VIG_II_MSUL: TStringField
      FieldName = 'DATA_INICIO_VIG_II_MSUL'
      Origin = 'DBBROKER.TNCM.DATA_INICIO_VIG_II_MSUL'
      FixedChar = True
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_II_MSUL: TStringField
      FieldName = 'DATA_FIM_VIG_II_MSUL'
      Origin = 'DBBROKER.TNCM.DATA_FIM_VIG_II_MSUL'
      FixedChar = True
      Size = 10
    end
    object qry_ncm_ALIQUOTA_IPI: TStringField
      FieldName = 'ALIQUOTA_IPI'
      Origin = 'DBBROKER.TNCM.ALIQUOTA_IPI'
      FixedChar = True
      Size = 6
    end
    object qry_ncm_DATA_INICIO_VIG_IPI: TStringField
      FieldName = 'DATA_INICIO_VIG_IPI'
      Origin = 'DBBROKER.TNCM.DATA_INICIO_VIG_IPI'
      FixedChar = True
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_IPI: TStringField
      FieldName = 'DATA_FIM_VIG_IPI'
      Origin = 'DBBROKER.TNCM.DATA_FIM_VIG_IPI'
      FixedChar = True
      Size = 10
    end
  end
  object qry_unidade_: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_UNID_MEDIDA , NM_UNID_MEDIDA, IN_ATIVO, CD_GIPLITE, NM' +
        '_SIGLA , CD_SCX_EXP FROM TUNID_MEDIDA_BROKER (NOLOCK)')
    Left = 308
    Top = 161
    object qry_unidade_CD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'DBBROKER.TUNID_MEDIDA_BROKER.CD_UNID_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qry_unidade_NM_UNID_MEDIDA: TStringField
      FieldName = 'NM_UNID_MEDIDA'
      Origin = 'DBBROKER.TUNID_MEDIDA_BROKER.NM_UNID_MEDIDA'
      FixedChar = True
      Size = 50
    end
    object qry_unidade_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TUNID_MEDIDA_BROKER.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_unidade_CD_GIPLITE: TStringField
      FieldName = 'CD_GIPLITE'
      Origin = 'DBBROKER.TUNID_MEDIDA_BROKER.CD_GIPLITE'
      FixedChar = True
      Size = 2
    end
    object qry_unidade_NM_SIGLA: TStringField
      FieldName = 'NM_SIGLA'
      Origin = 'DBBROKER.TUNID_MEDIDA_BROKER.NM_SIGLA'
      FixedChar = True
      Size = 3
    end
    object qry_unidade_CD_SCX_EXP: TStringField
      FieldName = 'CD_SCX_EXP'
      Origin = 'DBBROKER.TUNID_MEDIDA_BROKER.CD_SCX_EXP'
      FixedChar = True
      Size = 2
    end
  end
  object qry_rel_recapa: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '
      
        '   RE.NR_REG_VENDA,RE.NR_REG_CREDITO,RE.NR_RE_VINCULADA,RE.NR_DI' +
        '_VINCULADA,RE.NR_RE_SISCOMEX,RE.DT_DATA,RE.TX_SITUACAO_SISBACEN,'
      
        '   (SELECT CGC_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRE' +
        'SA = RE.CD_EXPORTADOR) AS CGC_EXPORTADOR,'
      
        '   (SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRES' +
        'A = RE.CD_EXPORTADOR) AS NM_EXPORTADOR,'
      
        '   RE.CD_ENQUAD1,RE.CD_ENQUAD2,RE.CD_ENQUAD3,RE.CD_ENQUAD4,RE.CD' +
        '_ENQUAD5,RE.CD_ENQUAD6,'
      '   RE.CD_URF_DESPACHO,RE.CD_URF_EMBARQUE,'
      
        '   (SELECT DESCRICAO FROM TURF (NOLOCK) WHERE CODIGO = RE.CD_URF' +
        '_DESPACHO) AS NM_URF_DESPACHO,'
      
        '   (SELECT DESCRICAO FROM TURF (NOLOCK) WHERE CODIGO = RE.CD_URF' +
        '_EMBARQUE) AS NM_URF_EMBARQUE,'
      
        '   (SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRES' +
        'A = RE.CD_IMPORTADOR) AS NM_IMPORTADOR,'
      
        '   (SELECT CD_PAIS FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA =' +
        ' RE.CD_IMPORTADOR) AS CD_PAIS_IMPORTADOR,'
      
        '   (SELECT NM_PAIS FROM (NOLOCK) TPAIS_BROKER WHERE CD_PAIS = (S' +
        'ELECT CD_PAIS FROM TEMPRESA_EST WHERE CD_EMPRESA = RE.CD_IMPORTA' +
        'DOR)) AS NM_PAIS_IMPORTADOR,'
      '   RE.TX_END_IMPORTADOR,RE.CD_PAIS_FINAL,'
      
        '   (SELECT NM_PAIS FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = RE' +
        '.CD_PAIS_FINAL) AS NM_PAIS_DESTINO,'
      '   RE.CD_INST_NEGO,'
      
        '   (SELECT NM_INST_NEGOC FROM TINST_NEGOC (NOLOCK) WHERE CD_INST' +
        '_NEGOC = RE.CD_INST_NEGO) AS NM_INST_NEGOC,'
      
        '   RE.CD_INCOTERM,RE.VL_ESQUE_PG_TOTAL,RE.TX_SITUACAO_RE,RE.CD_M' +
        'OEDA,'
      
        '   (SELECT NM_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA =' +
        ' RE.CD_MOEDA) AS NM_MOEDA_NEG,'
      
        '   RE.VL_PAGTO_ANTEC,RE.VL_PAGT_VISTA,RE.NR_PARCELAS,RE.NR_PERIO' +
        'DICIDADE,RE.TP_INDICADOR,'
      
        '   RE.VL_PARCELA,RE.VL_MARGEM_NAO_SACADA,RE.VL_VALOR_CONSIGNACAO' +
        ',RE.VL_VALOR_COBER_CAMBIAL,RE.VL_VALOR_FINANCEIRO_RC,RE.CD_MODAL' +
        'IDADE_TRANS,'
      
        '   (SELECT NM_MODALIDADE_TRANS FROM TMODALIDADE_TRANS (NOLOCK) W' +
        'HERE CD_MODALIDADE_TRANS = RE.CD_MODALIDADE_TRANS) AS NM_MODAL_T' +
        'RANS'
      'FROM TRE_CAPA RE (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 143
    Top = 257
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_rel_recapaCGC_EXPORTADOR: TStringField
      FieldName = 'CGC_EXPORTADOR'
      FixedChar = True
      Size = 14
    end
    object qry_rel_recapaNM_EXPORTADOR: TStringField
      FieldName = 'NM_EXPORTADOR'
      FixedChar = True
      Size = 50
    end
    object qry_rel_recapaCD_ENQUAD1: TStringField
      FieldName = 'CD_ENQUAD1'
      FixedChar = True
      Size = 5
    end
    object qry_rel_recapaCD_ENQUAD2: TStringField
      FieldName = 'CD_ENQUAD2'
      FixedChar = True
      Size = 5
    end
    object qry_rel_recapaCD_ENQUAD3: TStringField
      FieldName = 'CD_ENQUAD3'
      FixedChar = True
      Size = 5
    end
    object qry_rel_recapaCD_ENQUAD4: TStringField
      FieldName = 'CD_ENQUAD4'
      FixedChar = True
      Size = 5
    end
    object qry_rel_recapaCD_ENQUAD5: TStringField
      FieldName = 'CD_ENQUAD5'
      FixedChar = True
      Size = 5
    end
    object qry_rel_recapaCD_ENQUAD6: TStringField
      FieldName = 'CD_ENQUAD6'
      FixedChar = True
      Size = 5
    end
    object qry_rel_recapaCD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      FixedChar = True
      Size = 7
    end
    object qry_rel_recapaCD_URF_EMBARQUE: TStringField
      FieldName = 'CD_URF_EMBARQUE'
      FixedChar = True
      Size = 7
    end
    object qry_rel_recapaNM_URF_DESPACHO: TStringField
      FieldName = 'NM_URF_DESPACHO'
      FixedChar = True
      Size = 120
    end
    object qry_rel_recapaNM_URF_EMBARQUE: TStringField
      FieldName = 'NM_URF_EMBARQUE'
      FixedChar = True
      Size = 120
    end
    object qry_rel_recapaTX_SITUACAO_RE: TStringField
      FieldName = 'TX_SITUACAO_RE'
      FixedChar = True
      Size = 40
    end
    object qry_rel_recapaNR_REG_VENDA: TStringField
      FieldName = 'NR_REG_VENDA'
      FixedChar = True
      Size = 9
    end
    object qry_rel_recapaNR_REG_CREDITO: TStringField
      FieldName = 'NR_REG_CREDITO'
      FixedChar = True
      Size = 12
    end
    object qry_rel_recapaNR_RE_VINCULADA: TStringField
      FieldName = 'NR_RE_VINCULADA'
      FixedChar = True
      Size = 13
    end
    object qry_rel_recapaNR_DI_VINCULADA: TStringField
      FieldName = 'NR_DI_VINCULADA'
      FixedChar = True
      Size = 15
    end
    object qry_rel_recapaNM_IMPORTADOR: TStringField
      FieldName = 'NM_IMPORTADOR'
      FixedChar = True
      Size = 60
    end
    object qry_rel_recapaCD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      FixedChar = True
      Size = 3
    end
    object qry_rel_recapaNM_PAIS_IMPORTADOR: TStringField
      FieldName = 'NM_PAIS_IMPORTADOR'
      FixedChar = True
      Size = 120
    end
    object qry_rel_recapaTX_END_IMPORTADOR: TMemoField
      FieldName = 'TX_END_IMPORTADOR'
      BlobType = ftMemo
    end
    object qry_rel_recapaCD_PAIS_FINAL: TStringField
      FieldName = 'CD_PAIS_FINAL'
      FixedChar = True
      Size = 3
    end
    object qry_rel_recapaNM_PAIS_DESTINO: TStringField
      FieldName = 'NM_PAIS_DESTINO'
      FixedChar = True
      Size = 120
    end
    object qry_rel_recapaCD_INST_NEGO: TStringField
      FieldName = 'CD_INST_NEGO'
      FixedChar = True
      Size = 5
    end
    object qry_rel_recapaNM_INST_NEGOC: TStringField
      FieldName = 'NM_INST_NEGOC'
      FixedChar = True
      Size = 60
    end
    object qry_rel_recapaCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_rel_recapaVL_ESQUE_PG_TOTAL: TFloatField
      FieldName = 'VL_ESQUE_PG_TOTAL'
    end
    object qry_rel_recapaCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_rel_recapaNM_MOEDA_NEG: TStringField
      FieldName = 'NM_MOEDA_NEG'
      FixedChar = True
      Size = 30
    end
    object qry_rel_recapaVL_PAGTO_ANTEC: TFloatField
      FieldName = 'VL_PAGTO_ANTEC'
    end
    object qry_rel_recapaVL_PAGT_VISTA: TFloatField
      FieldName = 'VL_PAGT_VISTA'
    end
    object qry_rel_recapaNR_PARCELAS: TStringField
      FieldName = 'NR_PARCELAS'
      FixedChar = True
      Size = 3
    end
    object qry_rel_recapaNR_PERIODICIDADE: TStringField
      FieldName = 'NR_PERIODICIDADE'
      FixedChar = True
      Size = 3
    end
    object qry_rel_recapaTP_INDICADOR: TStringField
      FieldName = 'TP_INDICADOR'
      FixedChar = True
      Size = 1
    end
    object qry_rel_recapaVL_PARCELA: TFloatField
      FieldName = 'VL_PARCELA'
    end
    object qry_rel_recapaVL_MARGEM_NAO_SACADA: TFloatField
      FieldName = 'VL_MARGEM_NAO_SACADA'
    end
    object qry_rel_recapaVL_VALOR_CONSIGNACAO: TFloatField
      FieldName = 'VL_VALOR_CONSIGNACAO'
    end
    object qry_rel_recapaVL_VALOR_COBER_CAMBIAL: TFloatField
      FieldName = 'VL_VALOR_COBER_CAMBIAL'
    end
    object qry_rel_recapaVL_VALOR_FINANCEIRO_RC: TFloatField
      FieldName = 'VL_VALOR_FINANCEIRO_RC'
    end
    object qry_rel_recapaCD_MODALIDADE_TRANS: TStringField
      FieldName = 'CD_MODALIDADE_TRANS'
      FixedChar = True
      Size = 3
    end
    object qry_rel_recapaNM_MODAL_TRANS: TStringField
      FieldName = 'NM_MODAL_TRANS'
      FixedChar = True
      Size = 30
    end
    object qry_rel_recapaNR_RE_SISCOMEX: TStringField
      FieldName = 'NR_RE_SISCOMEX'
      FixedChar = True
      Size = 30
    end
    object qry_rel_recapaTX_SITUACAO_SISBACEN: TStringField
      FieldName = 'TX_SITUACAO_SISBACEN'
      FixedChar = True
    end
    object qry_rel_recapaDT_DATA: TDateTimeField
      FieldName = 'DT_DATA'
    end
  end
  object ppBDE_rel_recapa: TppBDEPipeline
    DataSource = ds_rel_recapa
    UserName = 'BDE_rel_recapa'
    Left = 397
    Top = 16
    object ppBDE_rel_recapappField1: TppField
      FieldAlias = 'CGC_EXPORTADOR'
      FieldName = 'CGC_EXPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField2: TppField
      FieldAlias = 'NM_EXPORTADOR'
      FieldName = 'NM_EXPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField3: TppField
      FieldAlias = 'CD_ENQUAD1'
      FieldName = 'CD_ENQUAD1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField4: TppField
      FieldAlias = 'CD_ENQUAD2'
      FieldName = 'CD_ENQUAD2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField5: TppField
      FieldAlias = 'CD_ENQUAD3'
      FieldName = 'CD_ENQUAD3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField6: TppField
      FieldAlias = 'CD_ENQUAD4'
      FieldName = 'CD_ENQUAD4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField7: TppField
      FieldAlias = 'CD_ENQUAD5'
      FieldName = 'CD_ENQUAD5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField8: TppField
      FieldAlias = 'CD_ENQUAD6'
      FieldName = 'CD_ENQUAD6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField9: TppField
      FieldAlias = 'CD_URF_DESPACHO'
      FieldName = 'CD_URF_DESPACHO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField10: TppField
      FieldAlias = 'CD_URF_EMBARQUE'
      FieldName = 'CD_URF_EMBARQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField11: TppField
      FieldAlias = 'NM_URF_DESPACHO'
      FieldName = 'NM_URF_DESPACHO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField12: TppField
      FieldAlias = 'NM_URF_EMBARQUE'
      FieldName = 'NM_URF_EMBARQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField13: TppField
      FieldAlias = 'TX_SITUACAO_RE'
      FieldName = 'TX_SITUACAO_RE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField14: TppField
      FieldAlias = 'NR_REG_VENDA'
      FieldName = 'NR_REG_VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField15: TppField
      FieldAlias = 'NR_REG_CREDITO'
      FieldName = 'NR_REG_CREDITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField16: TppField
      FieldAlias = 'NR_RE_VINCULADA'
      FieldName = 'NR_RE_VINCULADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField17: TppField
      FieldAlias = 'NR_DI_VINCULADA'
      FieldName = 'NR_DI_VINCULADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField18: TppField
      FieldAlias = 'NM_IMPORTADOR'
      FieldName = 'NM_IMPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField19: TppField
      FieldAlias = 'CD_PAIS_IMPORTADOR'
      FieldName = 'CD_PAIS_IMPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField20: TppField
      FieldAlias = 'NM_PAIS_IMPORTADOR'
      FieldName = 'NM_PAIS_IMPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField21: TppField
      FieldAlias = 'TX_END_IMPORTADOR'
      FieldName = 'TX_END_IMPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField22: TppField
      FieldAlias = 'CD_PAIS_FINAL'
      FieldName = 'CD_PAIS_FINAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField23: TppField
      FieldAlias = 'NM_PAIS_DESTINO'
      FieldName = 'NM_PAIS_DESTINO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField24: TppField
      FieldAlias = 'CD_INST_NEGO'
      FieldName = 'CD_INST_NEGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField25: TppField
      FieldAlias = 'NM_INST_NEGOC'
      FieldName = 'NM_INST_NEGOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField26: TppField
      FieldAlias = 'CD_INCOTERM'
      FieldName = 'CD_INCOTERM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField27: TppField
      FieldAlias = 'VL_ESQUE_PG_TOTAL'
      FieldName = 'VL_ESQUE_PG_TOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField28: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField29: TppField
      FieldAlias = 'NM_MOEDA_NEG'
      FieldName = 'NM_MOEDA_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField30: TppField
      FieldAlias = 'VL_PAGTO_ANTEC'
      FieldName = 'VL_PAGTO_ANTEC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField31: TppField
      FieldAlias = 'VL_PAGT_VISTA'
      FieldName = 'VL_PAGT_VISTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField32: TppField
      FieldAlias = 'NR_PARCELAS'
      FieldName = 'NR_PARCELAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField33: TppField
      FieldAlias = 'NR_PERIODICIDADE'
      FieldName = 'NR_PERIODICIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField34: TppField
      FieldAlias = 'TP_INDICADOR'
      FieldName = 'TP_INDICADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField35: TppField
      FieldAlias = 'VL_PARCELA'
      FieldName = 'VL_PARCELA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField36: TppField
      FieldAlias = 'VL_MARGEM_NAO_SACADA'
      FieldName = 'VL_MARGEM_NAO_SACADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField37: TppField
      FieldAlias = 'VL_VALOR_CONSIGNACAO'
      FieldName = 'VL_VALOR_CONSIGNACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField38: TppField
      FieldAlias = 'VL_VALOR_COBER_CAMBIAL'
      FieldName = 'VL_VALOR_COBER_CAMBIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField39: TppField
      FieldAlias = 'VL_VALOR_FINANCEIRO_RC'
      FieldName = 'VL_VALOR_FINANCEIRO_RC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField40: TppField
      FieldAlias = 'CD_MODALIDADE_TRANS'
      FieldName = 'CD_MODALIDADE_TRANS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_recapappField41: TppField
      FieldAlias = 'NM_MODAL_TRANS'
      FieldName = 'NM_MODAL_TRANS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
  end
  object ppReport: TppReport
    AutoStop = False
    DataPipeline = BDEExtratoRE
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBroker\ExtratoRETelasSiscomex.rtm'
    Units = utPrinterPixels
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 394
    Top = 75
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'BDEExtratoRE'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 33073
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Extrato de RE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Impact'
        Font.Size = 16
        Font.Style = []
        Transparent = True
        mmHeight = 6350
        mmLeft = 1852
        mmTop = 23813
        mmWidth = 32279
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 1588
        mmLeft = 794
        mmTop = 30956
        mmWidth = 195792
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 1588
        mmLeft = 794
        mmTop = 21696
        mmWidth = 195792
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D6167651E1C0000FFD8FFE000104A4649460001020100C800
          C80000FFEE000E41646F626500640000000001FFDB0084000604040405040605
          050609060506090B080606080B0C0A0A0B0A0A0C100C0C0C0C0C0C100C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010707070D0C0D18
          101018140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108005B
          00D103011100021101031101FFDD0004001BFFC401A200000007010101010100
          00000000000000040503020601000708090A0B01000202030101010101000000
          00000000010002030405060708090A0B10000201030302040206070304020602
          73010203110400052112314151061361227181143291A10715B14223C152D1E1
          331662F0247282F12543345392A2B26373C235442793A3B33617546474C3D2E2
          082683090A181984944546A4B456D355281AF2E3F3C4D4E4F465758595A5B5C5
          D5E5F566768696A6B6C6D6E6F637475767778797A7B7C7D7E7F7384858687888
          98A8B8C8D8E8F82939495969798999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACA
          DAEAFA110002020102030505040506040803036D010002110304211231410551
          1361220671819132A1B1F014C1D1E1234215526272F1332434438216925325A2
          63B2C20773D235E2448317549308090A18192636451A2764745537F2A3B3C328
          29D3E3F38494A4B4C4D4E4F465758595A5B5C5D5E5F5465666768696A6B6C6D6
          E6F6475767778797A7B7C7D7E7F738485868788898A8B8C8D8E8F83949596979
          8999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACADAEAFAFFDA000C030100021103
          11003F00F54E2AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D
          8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABFFD0F54E2A926B7E
          71D0F4797D1B994BDC815304439B0AF4E5D97E9CC8C5A59CC58E4E1E7D763C46
          89F57724E3F35341E4434170ABD8F1535FA3965FFC9F3EF0E2FF002C63EE923E
          D3F30FCA972789BBF418F6994A7E3B8CAA5A2C83A37C3B4F0CBAD7F593FB6BCB
          4BA8C496D324C87F6A360C3F0CC79448E61CD84E32160DAAE4593B15762AEC55
          D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8AB
          B157FFD1F54E2AF0CD7219D35EBE8AE09F58DCB8773FE536C7FE04E743888E01
          5DCF1FA88919240F3E27AE693E56D0F4EB68E386D6391828E53C8A1DD8F7249A
          E69726A2723B97A6C3A4C7014004835CF34F92ADE792D1EC12F64889593D3893
          8861B11C8D3F0CC9C3A7CC45DF0B85A8D5E9E2787878FE0910D47F2F65979C02
          EF45B8ED35B96500FB852C3FE1732383381BF0E41E6E1F8BA526C71E23FD14F7
          4DD575D515D3354B4F305B8FF744A443754F9F427FD6198F931C3F8A32C47FD3
          41CCC59B27F04A39C7FA4C8AD71F9ABE4FD36E4597982EC685A870127D56F7E1
          25492392B0AAB2D46512D2CB9C7D63FA2E663D644ED2071CBFA489D27F33BC81
          ABEA10E9DA66BB6B777D704886DE27ABB15058D053C06572C1302C86E8E68134
          0B27CA9B5D8ABB15762AEC55D8AA5BAFF99342F2F592DF6B77D1585A33889669
          8F152EC090BF3A29C942064680B6329888B2C7C7E71FE5712147996C89240003
          F52761DB2DFCB64EE2D7F98877B32041008DC1DC650DCEC55D8ABB1549BCC5E7
          3F2AF96CC035DD4E0D38DCF2FAB89DB8F3E14E54F95464E18E52E42D84F2463C
          CA5B61F9ADF973A85EC16365E60B4B8BCB97115BC08F56776E8A053A9C99D3CC
          0B2188CD0268165794B6A95DDDDB5A5B4B75752AC36D0234934CE42AAA28AB33
          13D001840BD904D311FF0095CBF95B4AFF0089AC69FF00193FB32EFCB64EE2D5
          F98877B27D2358D3758D3E2D434C9D6E6CA6A98674078B006955A8151954A262
          68B6C6408B08CC8A5FFFD2F54E2AC0FF00323CAEF3A7E99B44E5246BC6F2351B
          941D241EE9FB5FE4E6C743A8AF41FF0035D2F6A692FF00791FF3FF00E2936F22
          7991356D2D6DE561F5EB450928EEE8365907CFF6BFCACA7578382563E99395D9
          DAA192147EB8FE389E75E67D21F4AD7A682E01FABC927AD1B8FDA89DAA69EEBB
          AE6D3065E380239BA2D5E1F0F290797D5FE6BD66CB44F2F8B3885B595B9B7640
          50F056AA91506A46F5CD2CF2CEF726DE971E9F1708A8C69057BE45F2C5D9E5F5
          316F2F512DB931303FEC76CB21ABC91EB7EF6AC9D9F865D384FF0047D2F943F3
          96E0BFE626A56BF5A96EE3D38476714B3B727023404AD7FC9766CDA6037106B8
          6DC09C384F0D9970FF003930FC85825FF1D8BE867B7827B1B691E0175511C8F2
          D23E1C87D962A5A8D833806344123FA2884CC6428C632FE9FF0017F45F46C5F9
          A7E55B7BE974BD76F6DF48D5ADE827B69A642B522A28E0D370797C59AD9E94D5
          C7D717638B5809E198E097FB1FF4C9CE99E71F2A6A82E1B4ED5ED2E96D104972
          D14C8C23435A33907E15DBBE512C721CC3923244F22914FF009D3F95B05D7D5A
          4F31DA7A95A12A59D01F775529FF000D960D364EE607510EF65BA7EA361A8D9C
          77B61711DD5A4C39453C2C1D187B32D465241068B6820EE1BBDBFB2B0B57BABD
          B88ED6DA2159279982228F7662062013C949039B10FF0095D7F957F59FAB7F88
          ED7D4AD3955B857FD7E3C3FE1B2EFCAE4EE6AFCC43BDE65FF3943E61B4BBD37C
          B765653A5C5BDCBCD7A258983A32A288D082B507777CCAD0C082497175B3B000
          78E7907481ABF9E341D348AADC5EC3EA7FA91B7A8DFF000A999B965C3027C9C4
          C51B900FB9259A28626966758E2415777215401DC93B0CD08776C3F50FCE2FCB
          1D3E568AE3CC569EA29A32C4C65A1FF9E61B2F1A6C87A349D440755B65F9D1F9
          5D78E121F31DA0726804ACD17E2E146274D907451A881EACC2DEE6DEE604B8B6
          95268241CA396360C8C3C430A8394914DA0DBC53F3CBCA9A3F99FCC764B77E6F
          D37446D3AD8A7D46EC832F295B9973F1A503284A66769721844D44CADC3D4E31
          23F508A47F959F94BA15A79E74ED4ADFCDFA76B4FA717B9FA8DA0AC868A515BE
          DB51519C1E993CFA826047098DB0C1800903C424FA12F6FECAC6DDAE6F6E23B5
          B74FB734CEB1A0F9B310335C013C9CF240E6F19FCE0F39F943CD1A5268363E79
          D3F4CB377E5A8811CB72D305A148F945F088EBF137F3E66E9F1CA06CC4970F51
          923214240311FCB6F21FE4FC7ACA5CEB3E6FB0D6DD08367A7906D612E3F6A513
          1AC9BFD98FECFF00AD97E7CB96B6898B561C58EF79093E99844422410F1F4B88
          F4F8538F1A6DC69B5299AA2EC9762AFF00FFD3F54E2AE2010411507A8C55E75E
          65F2BDFE857E35DF2F82B1212F342BBFA75FB5F0FED44DFB4BFB39B4C1A88E48
          F04FF1FF001E745ABD24B0CBC5C5CBFDCFFC713359F45F3D68FE8B1106A700E4
          17F6A373B721FCF1365353D3CEF9C4B90258F598EBE998FF0063FF001D4BBCB5
          E61BDF2E5E0D035F531C20FF00A35C1355504EDBF788F63FB19767C2328E3838
          FA5D4CB04BC2CBCBF865F8FE17A0B4B1AC4662C3D355E65FB7102B5CD5D3BCB7
          C19AF6A6FAAEBBA8EA6E6AF7D7535C1F948E587E19D0423400747295925EEDFF
          0038C5E5AB1BBD035FBFBFB749E1BAB88ED50482A38C09C9A9FECA4CC1D66531
          90A34E5E970C6713C43883C43CDF716F77E6BD66E2015B77BD9C41525BF768E5
          1373B9F85733E1742F9B866201A1C93FFCBDF20799BCDD61AADB6937696B6086
          237B6FCA8F72CB528AB18A7A8230C5BE23C7E2FE6C8649C624197FA648122088
          EE7F98C4F53D3E4D3B52BAD3E53592D25785C814DD0D3A1E9F2CB18036F78FF9
          C51BBBE27CC367CD8E9F1FD5E548FF0065667E618AF872551CBFD5CD76BC0D8F
          5761A12770F3DFCE5FCC5BFF0037F99EEADD276FD01A74CF0D85AA9A2398CF16
          9DC7ED33B03C6BF6533274D84423FD22D1A8CC672FE8B7F94BF94B73E7EB9BC7
          92ECD869761C566B8440EEF2B8256340C42ECA393B63A8D4787E64AE0C1E27B9
          20F3E79667F2AF9A2F3CB6F74D770E9CC05B48761E9CCA25D92A4213CBE30BFB
          596629F1C78BBDAF2C3865C3DCCCBFE71B749FAEFE652DD32D63D32D269C93D9
          E4A44BFF00126CA35B2AC7EF6ED1C6E7EE7A67E77F92FCD1E63BB8CCDE67D3B4
          5F2CC318F4ECEEE5922F565EAF2494F85E9F6517F6731B4B96311C8CA4E4EA71
          CA5D4462F32F2C7907F2A2CAFA5FF1779D2C6EEDD54082DB4D795416A9E46493
          8741FB2AB9953CD908F4C4FF009CE34316307D52FF004AC23CED67E58B4F335E
          DBF962E9AFB425286D2E1C96279282EB520160ADF0D6997E232311C5F5346411
          12F4F27B2FFCE2A6A1AA33EBDA71919B4A85609A28C9256399CB06E1FCBCD57E
          203F973075E06C7AB99A12771D1E57F9B5AA8D5FF323CC179F6916E9ADA2277F
          82D80847E2873334F1E1800E2E795CCBD2BFE71534657D575ED64A0FDC450D9C
          6DEF2132BFE0A998BAF96C0393A18EE4A37F387F2F7CC9AF6BF3DFEB9E6FD274
          ED291A9A6E9D752C9188A2ECC5294691BABBE474D9A318D0892596A31191B320
          0316F2AF923F256D239C79B7CE16D7D725A9047A7BCB142894EA5B87277AFF00
          B15CBB265CA7E98B5431E21F549E61ACDBE9B16AD7D069D31BAD3639E44B3B87
          1BC9086211C8FF0029732A24D0BE6E2C80BDB93E9AFF009C63D4B54BBF22DD43
          792B4B6D6578F0D897258AC7C158A027F6559BE1CD5EBA204F6767A324C777AF
          E61396FF00FFD4F54E2AEC55C402287A62AC23CC7E47B88AE7F4BF9718DB5EA1
          E6D6E878863DCA7615EE87E06CD860D58238726E1D46ABB3C83E262F4CBF9AA1
          69AEE8DE66B7FD11E62845A6A6878A48470F8FA5509FB0FF00E437DAC94B0CF1
          1E2C7EA8B086A31EA07879470CD2CD762F38796B44D474C8D85E69B756F2C167
          74D5A42F221552D4A94A57A7D9FE5C9C7C3CC41FA66C09CDA5147D78BBFF009A
          F95F52D1F51D267FAB5FC0D0B8FB2C774703BA30D9866716B84C48587D3FF961
          C3CADF909FA5643C1CDA5D6A4C7FCA939327E0133519FD79ABFCD76D87D38ADF
          2A2722A0B6EC7763EE7739B7756FA83F287C99629F94BA7EA72B359EA0C6E351
          8EFA3F864452E4AF2FE65E08BB66B72EA4C7211F547E9E173068E33C625F4CFF
          00866F99EFEF66BFBFBABF99CC935DCD24F2487AB348C589FA6B9B102B670EC9
          E6FA4FFE71B3459A1FCBCD56FE2F86E754B995616E9B43188D3FE1CBE6AF5B2F
          581DCECB471F413DEF9A2786782E2682E1592E2191E39D185195D5886041EF5C
          DA02EB69EC9F929F9C1E54F25795F50D37588EE3EB4F72D7503411FA8250E8AA
          12B51C5815FDACC2D4E9A539021CCD36A2308905E5DE6CF305D798FCCBA96B97
          29E9CB7F3B49E975F4D3ECA27FB040AB9978E1C3103B9C69CF8A44BD9BFE71AA
          DFF47797FCD9E6731191A0558A24037616F134CCA3E6CEB983AD3728C5CCD18A
          1293C4B5EF30EADE64D4E6D5F58B86BABBB93CC9724AA29DD5235E88883650B9
          9D08088A0E14A6646CBD13C8DA47E4545E525D57CDBA9C971ACFC6D2E948D223
          27162123448C0F50B2D1B997FDACC7CB2CBC5511B3918A38B86E477799DF4B6D
          35F5C4B6B07D56D6495DADEDAA5BD38CB1289C8EEDC576AE650E4E31E6FA33FE
          71CA04D1BF2DB5CF30CA0012CD34DC8ED58ECE2A0FF86E79ACD69E2988BB1D20
          A812F9BE5B896E6692E6524CB70ED2B93DDA462C7F139B3AA75B76FA0FF2CEF2
          F3CA1FF38FDAD799AD107D7EE1EE2E2DDD8546CCB6F1B11E094E79AECE04F308
          9E4EC30930C4641F3F5F5D5DDF5D4B797B33DDDE4C4BCB3CCC5DDD8EE49639B1
          000D8380493B97AADB699F905A5792E2BEBABC935EF324B6E0FD4124951BEB2E
          BFDDFA69C42246FB16639886598CAAB862E508E211BFAA4F2515037FA732DC47
          D87F90BA47E8DFCAED22ABC64BD125E480F8CCE4AFFC204CD36AE5790BB7D2C6
          A01E8398CE43FFD5F54E2AEC55D8ABB15487CCBE4FD2F5C8CBC8BE8DE8144BA4
          1BFB071FB6B99383532C7FD570B55A18661BED2FE7318875AF31F9558586BB01
          BFD28FC11CE3E2F87C031EBFF18E4CCB38B1E6F540F0CDD7C73E5D37A720E3C7
          FCEFC7FB9921F5AFCBFF002AF9B74F964D1E489E390132D84BF6031F01F6E16F
          9631D4CF19E1C83FCE49D1E3CBEBC12E13FCDFC7D2E3A8E9F0E823C9BE6ED25A
          DF4930A5A8F47908DA18E814554F2A7C23E246C074FC478F19B2CA3AE30F4668
          F0FF0049BB1FC93FC97D421F56CB4C8A78CF74B89CD3E63D4A8CA27A8CD13476
          73B1E2C33171F533B87CBFA441A02E810C1E9E92B6FF00535B756614878F0E3C
          ABCBECF7AF2CC5333C5C5D5CAE0155D183DD7FCE3DFE573DABC76DA40827E3FB
          A93D69C8561D2A0B9A8F1CC98EB260EE7671F2692241AD8A33C85AE689A3DBC3
          E545B15D25AD5DE18A2466788C85C961C9C9705989A72CB353A627D60F107134
          9AE8DF8721C12FA7FA2A9E6FFC97F20F9AEFDB51D46CDE1D41E9EB5D5A486179
          29B0E74AAB1FF2B8F2CA31EA670143939D934F091B285F2E7E427E5BE857E97F
          158C97B73130685AF6533AA30E85508095FF005970CF57390AB4434B089B549F
          F21BF2B279E49E6D183CD33B492399E7A9672598FDBEE4E01ABC83AA4E9A07A3
          27F2C7947CBDE58D31B4BD12D05AD8BC8D2BC5C99EAEF40C4972C77A6553C929
          9B2D908088A0C2754FF9C73FCB2BFBD92E96DAE6C8CAC59A1B59DA38B9135255
          086E3F25F872F8EB32014D32D2409B44F97FF207F2D745BE8EF52C64BDB88583
          C26F65332AB0DC109B21FF0064AD827ABC921569869611369779DFF2AFF29B43
          D0F56F33DEF97DAECDB2BDD5C471CF32B48CCD56A55C28A96C962CF924444163
          9306300921318353FC9FD234A1E403796F6505E208A4D25A69390FAE0E5E9B49
          53C1A4E7DE4C898E5278FED640E303818E0F24FF00CE367E9A6D0E96BFA55261
          6C6D3EB371CBD6AF1F4C1E7C4BD76E20E5BE2E7ABE8D7E161BAEA9FE8BE74FCA
          FB1F25DB69D74D6DA6E833ADCDBD969F349F59F52D6191A391D82FA84216E5CB
          9FD9FE6CAA58F21958DE4D83240468F261373F971FF38F7279A57435BDBAB6BD
          B98E09EDA18AE1FD061747F72913B07AB302AC16BF619732066CDC374D070E2E
          2A4C3CB1A37E4579674E4D5B508E3B0B9BA96EED2DE4D42E3EB53116EED04AF1
          FA5C953A7DA55E51FF00AD919CB348D065086288B2ADA8F927FE71AB4E4B5FAE
          0B5892F615B8B6617370EAD04868B2725760A8DFCEDF0E08E5CE7924E3C239BD
          7F4AB0B0D3F4DB5B1D3D047636D12456B1A92408D5405009AD76CC29124D972E
          20014115812FFFD6F54E2AEC55D8ABB15762AB27820B889A19E3596271474700
          823DC1C20906C319444851E4C2B55FCBD9ADAE0DFF0096EE5ACEE17716E5885F
          92B761FE4BF25CCFC7AD0470E41C41D4E6ECC313C584F0CBF9A858FCE92464E9
          5E70D3763B194A5411E253A1FF005A33933A5BF5629358D791E8CF1FC7E3F9AB
          CF9274ABD1FA43CADAA1B773B85572CA3DAA0874FF006583F3728FA7246D3F90
          84FD5865C3F8FF004CA6FABFE63687B5DDB8BFB74FF76F1E7B7FAD1D1BFE0972
          431E0C9C8F0962736AF0FD438C7E3F9AA2DF9B17DC4AFE8F8965A53E291A80FF
          00ABC41C3FC9C3BD8FF2CCBF9A2FDEC2EF2F66BABB9AF267FDFCCE65775DA8C4
          D76F0A76CCF8C40000E4EA673329191E65EE1A2CF733E916735D295B89214694
          1D8F22A2B5CE7F2802440E56F5F8244E38997D5483B5F34E9EFA94BA5DE1FA9E
          A113504521F864077568DFA1E43B7DAC9CB4F2E1E21EA8B543591333097A263F
          1E94E72872D2F6D7B4C5D7068864235136E6EC47C1B8FA41B8579D385797ECF2
          E592E0357D18F10BA57BCD534DB2B592EEF2EA2B7B5888592791D5514921402C
          4D01A9A601127609240567B8811433C8AAA4D03330009FA71A4DA4FE73D020F3
          2796350D024BAFAA0D4A2F43D700332D48350A48E5D3278E7C3207B984E3C429
          866A1F93AB77AB5EB47E617834CD4EEED750BFD2C5BC2CD24D682300ACCC7D44
          56685795065C3534396E1A4E0B3CF66331FE5BF9D64F3B471C6823D02DBCC2FA
          D6F716D244A8CECECC1428BBF55CB71E0FFBB4CB7C68F07F4B8785AFC1971797
          1712BF9A7F273CB767E59B27B9F30BC365A3A5C412DC0B55B87617D726415113
          07F85E4E207C4BFB5C7063D4C8CB97D5FEF567A78F0F3E4CA63FCAF306B9A3DF
          E9FE65B8B592C2C6D2C2EE2F4E1796EE0B393D55E4EDF147EA578C9C57EC655E
          3EC411CCB68C3B820F441FFCA9C685ECA4D27CC6D65A9598D417D6FAB4338683
          51B833BA7A521217D366E2AF92FCCF78DB6FF628F03B8F7A51E78FCA0D0E4D32
          6BED43CCCF6F61A5E951D95E48D6F1CCD1C76F52D32AC653D36727F78823C962
          D41BA03996393003B93D1EB7A21B73A3581B697D6B636F17A33538F34E038B53
          B721BE624B997263C823322C9FFFD7F54E2AEC55D8ABB15762AEC55D8AA1B50D
          32C35180C17B024F11FD9715A7C8F51F464E19251360D35E4C5198A90E20C2F5
          0FCB8BBB498DDF97AF5E0946E21762A7E4B20FF8DF33E1AE0456416EA72F65CA
          278B14B84FE3F890B1F9DFCD7A24820D76C4CC836F548E0C7E4EB58DB267498F
          26F02D63B43362359237F8FF004A9BC3E6AF22EAE00BD8A28A56EAB75101BFFA
          F423FE1B283A7CD0E5FEC5C98EB34D97EA007F5C26F63A1F94F9ACF656968ECB
          BABC611A9F757289E5CBC8993958F4F839C4453924015268075394396F25FCC6
          BDB1BCF3029B57593D1844733AEE0B8626951FCA0E6EB4503186FDEF33DA9923
          2CBE9E81997E5EEB32EA3A1FA53B17B8B26F4598EE4A52A84FD1F0FF00B1CC1D
          6E2119D8E5276BD999CCF1D1E70F4B16FCC9FCBEF366BFAC6AD75A54B1A4177A
          17E8EB70F33C645CFD6D26A90A3E11E9A9F8F061CD18800FF39C9CB8E5226BB9
          2AD63F252F65D3BCCDA7E9B6F6F1D9DFC3A74DA5DB4934A6317F6C49B99181E5
          C4CAA78F3F8B964E3A91609E97FE9584B4FB103C903E61FCA2F3A6A3A7E8DE9D
          969B12DA45791CBA341338B789AE240D1C8AF3ACDEA3851477E2ADFC9C70C351
          104F3FEB319E091039277A2FE4CC92EAD6F37991CDCC361A5E9B6F63730DCCA2
          68EF2CD8B48EA76FF2539B7C4E99096A76F4F79671C1BEFDC10FA4FE526BD67A
          9D86B45615D6A2F305D5EDCDE09E424E9937329153A1DD97945865A80411D387
          FD928C041BEBC5FEC522F2E7E4B7E60D9EA53CF3DC5BDA3DC596A36B3DE413B1
          2F2DDA11149C422BF0573FEEC92475FD9CB27A9811F10D50D3CC1F9ABDA7E4FF
          009C93CBBAAD95BE9BA768F757367676A86D2F2E5CDC4B05C24B24F297F810B2
          2B745E7F17DAE380EA23C40D99321825C2455236F3F297CDD2F9DDF528E1B30A
          FAD45AA2F983EB338BC4B442A5AD0434E1C28A53ED71F8B223511E0AFE8F0F0F
          FBE49C12E2BF3FA917A37E51EB3A6DE691ABC0B145AE43AADFDC6A7782795B9D
          8DC09BD18A9D19579C3CA3C8CB500823F8687FA64C701147ADB19D27F24BF302
          DA2D4C4BF5547BED22FAC26E3705966B8B8A189DA91A9E1CBFDF8D23A7F365D2
          D540D7BC35C74F217EE7BB797ECA7B0D074EB29E9EBDADAC30CBC4D579C71856
          A1F0A8CD7CCD925CD88A0023F22C9FFFD0F54E2AEC55D8ABB15762AEC55D8ABB
          15762AB658629A331CA8B246DF6918020FD070824724188228B19D4FF2E7CBB7
          9C9A146B295BF6A13F0D7FD4355CCBC7ADC91E7EA75F97B2F14F97A0FF00458C
          5E7E57EB56EC5B4FBA8E71D812D0BFE155CCB8EBE07EA1FEF9D7CFB27247E920
          FF00B14AAEFCB1E738C149ADAEA54EE164322FE0C72E8EA317421C69E9350398
          97CF890D0F94FCCB2B844D36607C5D4228FA49C99D4E31FC41AE3A3CC7944BD2
          FC93E5A9B43D3E45B960D7772C1E50BBAA8028AA0F7A66A7559C6496DC83D068
          34A70C4DFD5264598AE73B15762AEC55D8ABB15762AEC55D8ABB15762AEC55FF
          D1F54E2AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15
          762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABFFD2F54E2AEC55D8ABB157
          62AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AE
          C55D8ABB15762AEC55D8ABFFD9}
        mmHeight = 19844
        mmLeft = 265
        mmTop = 794
        mmWidth = 52123
        BandType = 0
      end
      object ppImage3: TppImage
        UserName = 'Image3'
        MaintainAspectRatio = False
        Picture.Data = {
          0954474946496D616765510C0000474946383961C8002E00F700000000008000
          00008000808000000080800080008080808080C0C0C0FF000000FF00FFFF0000
          00FFFF00FF00FFFFFFFFFF000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000003300006600009900
          00CC0000FF0033000033330033660033990033CC0033FF006600006633006666
          0066990066CC0066FF0099000099330099660099990099CC0099FF00CC0000CC
          3300CC6600CC9900CCCC00CCFF00FF0000FF3300FF6600FF9900FFCC00FFFF33
          00003300333300663300993300CC3300FF3333003333333333663333993333CC
          3333FF3366003366333366663366993366CC3366FF3399003399333399663399
          993399CC3399FF33CC0033CC3333CC6633CC9933CCCC33CCFF33FF0033FF3333
          FF6633FF9933FFCC33FFFF6600006600336600666600996600CC6600FF663300
          6633336633666633996633CC6633FF6666006666336666666666996666CC6666
          FF6699006699336699666699996699CC6699FF66CC0066CC3366CC6666CC9966
          CCCC66CCFF66FF0066FF3366FF6666FF9966FFCC66FFFF990000990033990066
          9900999900CC9900FF9933009933339933669933999933CC9933FF9966009966
          339966669966999966CC9966FF9999009999339999669999999999CC9999FF99
          CC0099CC3399CC6699CC9999CCCC99CCFF99FF0099FF3399FF6699FF9999FFCC
          99FFFFCC0000CC0033CC0066CC0099CC00CCCC00FFCC3300CC3333CC3366CC33
          99CC33CCCC33FFCC6600CC6633CC6666CC6699CC66CCCC66FFCC9900CC9933CC
          9966CC9999CC99CCCC99FFCCCC00CCCC33CCCC66CCCC99CCCCCCCCCCFFCCFF00
          CCFF33CCFF66CCFF99CCFFCCCCFFFFFF0000FF0033FF0066FF0099FF00CCFF00
          FFFF3300FF3333FF3366FF3399FF33CCFF33FFFF6600FF6633FF6666FF6699FF
          66CCFF66FFFF9900FF9933FF9966FF9999FF99CCFF99FFFFCC00FFCC33FFCC66
          FFCC99FFCCCCFFCCFFFFFF00FFFF33FFFF66FFFF99FFFFCCFFFFFF21F9040100
          0000002C00000000C8002E000008FF00FF091C48B0A0C18303AB215CC8B0A1C3
          8710234A9C48B1A24584FE066EFB472D15156AD4AAA9F293AA5ABE7F0AA95D5C
          295125C48C2C63CA9CB9D0E314558552E94C35E526CD9F0D533953D53124D0A3
          48572A1C8942E7943F7F5250F3D3B39ACBA40B336A3D7855A0482A3DA934A192
          E24FD77F30B1AA5D2BD0CF1F5544A3EAA442456435926C638E9C4297EE1F2A79
          A898CD4B78EDDF141FABE98CABAA5A35B02954110E4954A1428167098E124B37
          7067BA65250B4C5BB8F44A6A60E9A2864A4DD51FB7AAFA4E617B97AE1F2A6E8D
          1204990A6EB5BF82010BAEF2170FE83F974D2B5F990A7168B04FA3928D4D964A
          A181A467A2A6A2828A13EF64F194FF743DC58F5BDC74BF53A9D2176ADFBEFF4E
          2E9F4FF1B65FEA545CF7ED9DC2F81FB5C0FD5145607F15D71748F17154E08082
          89F7157B7FE0F11F7DA6A595DD680565849A73FAA5F0547364B987D814975D88
          D6457F75271C7B9E3D85C2842751F3177BECD1358A597DB12721853C46F4472A
          3FB6F69659AA00A9D36F40368614757910171C70E5F134A140B109E8991F3216
          E95770C9F5C8967C1165A4D88FC8A552C88F8CBD058B91535274964A70FA8198
          60709D378587E5F9249033391E68D56B63AD4745495E16BA105D7CE947C50B8A
          D239A21F5D6A175C60977984674FA96CD45660047E34106A9C0E1AA9A1A5695A
          5072778D950290EDA98218A387E1FF46535A4CDAC6115953A0902B9603011718
          7B4AA2F41A7A3F66F8506BE7FDA5134232F6D61A48CF82449490A9A8F4636FD7
          8E6A5047D82E86D9286CAA02EE8F39BD35AE6BA2D9841B357CADFA57A250A622
          506FE792292EBAF6E6C4505F8189D7DC9D77E2B5E76D0B2287195F7C09667044
          5F510183C2EFC1506D411ED1F5425F0F5B8CB16AFF0097B1600E5177316E7E78
          2527C0CEDD896BCA73A694F0A05A08D69B79F981E6E9862BE7ECDCCAE52DF41B
          BFDF7928F4C462FEF52B5DF28A141659B775B515B3D579FA297588C9FB690A6E
          9999CA6DCE69ED5E7E03715D5D6605D99CC2750429A6F06B50B10D9584F681FD
          0F7E8EF9266D3E385BCDAE5F6EB9FFF576DB8299D7E641AA840A1C9E567FFAA4
          93AE4DF5941F4DF045F642DBD175E87E8A77F5187C04C5D6F97B8332841FD208
          C165FAB344A5BE79592AFD5C14583FF6074B9D252BD42AEAADF996BA6E0DF539
          EC14B08029D01F47FF155BB5234595EB14899BB8DBA29653FEAADCD4A45010CE
          2F14E4F94015434F0543F65DBC2A4251C50D7A9F7489E618ECD5EBE71AD65775
          7FFEFC3D3FA4CA149EFDF7DA9B0B0656ED4E790218F322821FD12C043820E388
          013133B2EF51AC738C7A4FE2AE1741CC7DEA537FE04B03E7C71DB03863238A89
          9C99EC8598FF28C4521CECCB5812A62DAE20D031634A1A959C10AAD03165793D
          D155C92062B3C971AF3A2968616CFF9CD390BF38434E633B085D1EC32186A0CE
          2E8D519DA2A6D0952459652A44F9A1A0E082BBDD4D6B223202DB6F6238100911
          8738FFE18916A8C2179EF464870EA99C037B6741836C2E7A0B894DC3D2B72D90
          49D020A4C960DC0689A8EA3461625EB96042DEE5BDDB38123DC6318F22B3F243
          55E4032E50F9D0DC3E032CC560696BCC834CFD42E61C38EECB3983531C1119E2
          11C9D86C8EBDCADE3F803841AE502535234A0D5F3E161A9F8D8E2E3050592E73
          69CA896C8D4EC6FBCD5B8463B42285055A5ABA532A1132C887FCE562C5FCD4C7
          1AA20A18A4A4810B9CA5D53456CB490A095FE8FCDA2B6DB9B3EE68A148E94457
          2AE4A390A7618723274A8E7DF0E0FF04E4DCF13D813999AE984715A1C9CA9AA8
          4468884A07C42252C1190201222CFFE2125A42244B434A27E806781046B627A3
          205D164BEEF8968E19A73785F34F4F22974380ADB0320E41E0340D52CD83FC93
          9B75A1D27B5CF29829FD919254C2834185264CE8A56014703A88D876C654018E
          CA79284110665082C48F50A7325F391CC074C5D59E7C6D14A9132941A4F3826C
          76547CE5C44C75645913B9CD326AF392CA408C9A5666A5026E7FD002DB02679E
          CC64C7357D2B5060FD46916DE0A63157C9E41B2125AC7F00891ADBC0A42EAB93
          3028A9B09CF27BC87BC2F9A90672F305C91199A71218D13A1E44431A41896A4F
          6219D54EF5245005213E55C2DA49FF6244959C098E84EEB7D8DED46D0A78904C
          481CE91AE318C73B35A2C2493353BDEA70F67A0D65E82A0FF8D08400D13D5D01
          E2734935917F820E39F9808C79F0520DE328C83F8EE9985F1844205E51D3B45C
          816FDADE83D32EC98F0A5A289B7C01F90F6D38D6489241956BB6468DB4E88424
          6432526E663BE0C1DCD3214CEC8B7A80C5115D0D6A2C3892972A307CC992DCB1
          78D56DEB7411D243CA45B7ADE1141F59CE62D18820514F9FE20B864FF48F510C
          B32F73DACD9C46C9B09701A60A2CF25473FC808750E5013905BA6248AA5108E1
          E4E1C80B63C8350F7A90EED51533DB149D372996B16C92338E02D946BBC0A692
          8CDC662C2AE0954A7AB233D04833FF39EFC15AA4A0EA958ACDE968C6518533F0
          803F41218D8DAFA18A79144520196288C4D5312B0AAF3CBC1393CFAD6AADDAA9
          5A7C2CFA120416E7FBD4D686B59F3F14C280BF84A53137EDB7D72CE63C864394
          0091162185655122F2AB0C35306D1B1FA2A45182916ADAF453D2B1E21133BFD4
          B5E8128ACF8ECDA98392F1AF57EEB750D752F5D8896209B4EC02A7911827C85B
          4D58795A3328C98089CED7B3B351D7E510A61A3595E63665F52688421523A621
          1991E96E12461D8E12445DA9DC5BCDC062EBDBDAEFC704720F49628387DA0105
          5AF369E144FCBB0DE94486206CC452A20BD270A189262DC7F94D099DED10FFDA
          936C15F30C1E3A0215FC38B8D8DCFFE5D14E07821F79BD2BCAA5E5D8F3A27D9B
          A760E53104625C8002977252E1874461964E5DB601A22998EA56EDEA92C6E992
          8F9F81A544617AB04DFFE08420E7E70F2A08B2D5C0DDF3BCC40642D6F50B58E3
          068BF9FAA54BFAC60358579E145F31734574EA7AA1FEF29DFF6C248341C31568
          D8CD9962A64667D339FA4F2A47A309DBCA21F6943B521058F65B81CE7C6DDA30
          EC3ED797DB68E16566A509A6ADE4E4E0F45BF16A818998A73016C96C03899109
          0948DAC5D8B6A86C4A325255B5AEC8663C283C26BF99028DF835A8AB701DF448
          21F98DC20624A4760E2A708C6CDBBA847C4271EF0FC357CB5400CECCED023FF4
          344E506BDF847285F857D90F51482E6D5BFB137BEAC73FDD96FAF5D72F11E199
          462466691DFB979396391BEBD0F7CF7E5ACA9CFDA45828EAF3F7130101003B}
        mmHeight = 13229
        mmLeft = 144198
        mmTop = 4763
        mmWidth = 52388
        BandType = 0
      end
      object ppImage4: TppImage
        UserName = 'Image4'
        MaintainAspectRatio = False
        Picture.Data = {
          0954474946496D616765CA0700004749463839613C003B00F70000FFFFFFFFFF
          CCFFCCFFFFCCCCFFCC99FFCC66FFCC33FF9999FF9966FF9933FF9900FF6633FF
          6600CCFFFFCCFFCCCCCCFFCCCCCCCCCC99CCCC66CCCC33CC99CCCC9999CC9966
          CC9933CC9900CC6633CC660099CCCC99CC999999CC9999999999669966999966
          66669966666699666666666633663366663333333366FFFFFF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000002C00000000
          3C003B000008FF0001081C48B0A0C18110122A8470B0A1C387100942F0E0E1C3
          880F1E4864DCE82161C48F20054E2441D243878E14137E98C8B163C897041F44
          B8486264848C2C21CC84208242840E18353284091282C69A0A85A25CEAA1C286
          893985127D38B263888521346E249955AB51A815B54E3D681465CE8C2240A4AC
          A0900345924A3506D83896E0C69529338E8830D4618091213A427850B3625FA2
          19D9E22481F130C88C4A59D69CCA31E146C730335E152AF5E5E5C5111ED44528
          227245D145BD1A9D3C9AA080CF463F146D7C17736B0038A18EF0F0F17242D60E
          071028900041F102040240F41D0178C3D5255D3A24904081020617AC63579020
          C18087427FF3FF7EF8016EC9E909187067507D017705EEAF17F87E308056B8B6
          459A672CA021710DD52580C17B1958970080D75D40C073FB91E01064F8F9A75E
          75ECC167A085EF55A7C08206CDB59F6DD09D7710020A5C302106012228608AD6
          21A01C59FB79F0A25D1F1E44C0750156E85E8016A6C75D02CBD55850797085D0
          80410394C862752872A722820838005173E63916A246071550618539B6672097
          20C558D0959825999D80EF3DB95E930874E8A241109254509C0E1A54C07B3B4E
          E8238FEEBD495000D571481095110E14A76C06B537607526264040764EB638A3
          40801658804164D208D778040DC02385010E00E89E40161400893F1E24E6405D
          89D8A90205A6FF07E981CA0D00290247FE29A07BD84D2AD0AA02C5C9E940D4BD
          8727772F7AEAE74080F6C81D7D033D40A4AB00E40A806D3756572077182CE01D
          B3FDE96AA293D5F90A0008E60D3B5C718E1A542C975C9ACB6C7A5E866A50699B
          1244000204F40BED40665AB7C0A2B0CA0B00A0B3127CC141AD62F92700D4093A
          AFB3F42AD06687F5EAC81DA6C2EAEB5D02112460EE92251AB8B0B8136AF05EB7
          971A34ADC3020D479DA7FFC6CC258E185E7C300213DE5C61CD028D906EA7095C
          202AD000D84AA0814D2A60C1C12B72BBF4C607BD3C2CA50310D7724124DE9C67
          75C6F5D8B397120FD440C35703609C0503F08B3106156E8B66754F06A8F08343
          13AD1CA065C7FFBC1E9FEB1DEB658F48FF9A37B316189780040E69D9E481EF9D
          A9C0E34D67D037415623895CE103DD8961C5F17D6DE1E50339806EBE0F15B06C
          4137762BB5B60622C8C004A4637E78968EEA8C24AA63FF8DE37C1F015B907004
          488000F0D35940E180EAC19D4001F99185125F0DED4B9CE2B553DAAFEAAA1320
          EA6DD523E7E8BE0683EF1744E32760C0F1E68794FDA9C449E0A8C8A3E564E84F
          2F5A9610E70211CFEF01063800F25E22809731C43C23F80B494460820F648F58
          FCBA40006E143D879405001140C15B78C3919A08A0344F8B48D6BEE52851EDEB
          810891D3B54632149460292128A494400A608100102F62ECFB9E0D0DD295163A
          6735E38921B3AFDCD639E370CF38FB6A17411A00190F480B291689C0B5E01201
          FED50762C2298E03BC6300CBA98E76BA4BE17D2C53820E0C84485224CA048B63
          4303286B5D08F09444AE32C5B730A42C150916094238950008705F134000BF8E
          C7AFAD4DD1411BE10096388202BE78E004696CCDBE00A03A9119F13B7BCB4A09
          4870950168920425E8C82641E901EF1DCC7C3AF4972A0910810A44C07BDE9380
          2B0FF04A02544002FDCAE5F7DAD73E21F21226930A08003B}
        mmHeight = 15610
        mmLeft = 125677
        mmTop = 3440
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PROCESSO'
        DataPipeline = BDEExtratoRE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEExtratoRE'
        mmHeight = 4191
        mmLeft = 156634
        mmTop = 25135
        mmWidth = 38365
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 100013
      mmPrintPosition = 0
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'TELA_SISCOMEX'
        DataPipeline = BDEExtratoRE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDEExtratoRE'
        mmHeight = 93927
        mmLeft = 23019
        mmTop = 4498
        mmWidth = 157163
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 42069
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'Shape3'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 1058
        mmLeft = 1323
        mmTop = 794
        mmWidth = 195792
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtPageSetDesc
        DisplayFormat = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 170657
        mmTop = 31750
        mmWidth = 26194
        BandType = 8
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 1588
        mmLeft = 1058
        mmTop = 35983
        mmWidth = 195792
        BandType = 8
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Santos - Matriz'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3217
        mmLeft = 1323
        mmTop = 2646
        mmWidth = 195792
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 
          'Rua XV de Novembro 170  Centro  Santos SP  CEP 11010 150  tel 55' +
          ' 13 32114000 fax 55 13 32114020'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3217
        mmLeft = 1323
        mmTop = 5292
        mmWidth = 195792
        BandType = 8
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'S'#227'o Paulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3217
        mmLeft = 1323
        mmTop = 10583
        mmWidth = 195792
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 
          'Alameda dos Nhambiquaras 1518 10'#186' and. Moema  S'#227'o Paulo SP  CEP ' +
          '04090-003  tel / fax 55 11 50904400'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3217
        mmLeft = 1323
        mmTop = 13229
        mmWidth = 195792
        BandType = 8
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'www.myindaia.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3217
        mmLeft = 1323
        mmTop = 18521
        mmWidth = 195792
        BandType = 8
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 
          #8220'Conduzimos nossos neg'#243'cios de acordo com o modelo FIATA de Serv' +
          'i'#231'os de Agentes de Carga'#8221'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3217
        mmLeft = 1323
        mmTop = 23813
        mmWidth = 195792
        BandType = 8
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 
          #8220'All business transactions are in accordance with Fiata Model Ru' +
          'les for Freight Forwarding Services'#8221
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3217
        mmLeft = 1323
        mmTop = 26458
        mmWidth = 195792
        BandType = 8
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 1058
        mmLeft = 1323
        mmTop = 30427
        mmWidth = 195792
        BandType = 8
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Picture.Data = {
          0954474946496D6167651A07000047494638396187002800F70000295171A9B2
          BAFAFBFCD4850D96A6B3E3E7EAB1BAC1B8C3CC72869BD1D7DBF4C674CAD3D9F1
          F4F6D6DCE1869AABF4AE44F6F8FA536F84F6E6BE89826EDCE1E6F8F4EBCBC7C3
          C2CBD3EFF1F3EAEDEFE2DBD1A89E8EF4F6F7143E6AFCFEFCFFFFFF0400000000
          000000A0BE15000400000000040000240B140060BE150000F00000402A4678FF
          FFFFFFA4F612000000000000000010A8000010E0F412003CF61200CCF5120000
          00000034F51200240000008C2A467800001300480D130024000000384717000C
          F5120000020000FCF61200551F4678D02A4678FFFFFFFF0CF71200D0C14A7848
          0D1300000000000000000028FA1200E8F512000000001074F512000632467800
          0000100100000002000000D4F51200A800001001000000F8F512004F6D467867
          6966000100000002000000D4F51200A4F612002C790000000000001604000018
          150010160400000000000010300010F4B50100B02300100000000001000000CC
          F512000000000038F512003CF6120000000000551F4678F4B50100FFFFFFFF00
          1000108CF51200B0FF120044F61200551F4678C86E4678FFFFFFFF54F61200DD
          6A4678000000101030001038F6120000000000FD107479000000101030001038
          F6120000000000A4F612002C79000000000000103000101000000011000000A8
          F61200FE0000006CF612008A3FE177685B4800FE00000084F61200D29E011022
          00000000000000FE0000000000000098F61200EF5BE17700000000D29E011011
          000000A8F612001100000000000000765B4800CAD04700B69B1800409B1800AB
          A9420000000010D29E0110685B4800FF000000000013002C790000685B4800FF
          000000B69B180000F71200240000002C790000409B18000000000048FB1200CE
          0EE277760000001C00000038471700200100002A2E6769E8050A00E8050A0048
          F71200551F467818254678FFFFFFFF58F712009D917279000013000800140018
          010000409B180000000000000000000000000000000000C4C0440069471700F4
          C615006D4717005DFA1200FFFFFFFF384717002EC144006947170021F9040100
          001F002C00000000870028004008FF003F081C48B0A0C18308132A5CC8B0A1C3
          87101B4A1840B1E2060B0F06581028E141C60113227EB040C040808D22111258
          49406403962D11066089F2E1C4011B0C14CC3881C0010B142704482030E3060D
          1214645C4AF1E38606020D7498DA2142800D54A746401001005500083404C8DA
          010101045EA7028860C08083B7081C043080966A840B0B227C4560C12DDC0D01
          023848DB0140CAC30741065040F1A2410D6D6B26981B4003C1BE0124106CB0C1
          01E0B62603131D789540CE9F81031CB85CD20005812F3BCF6D9B5A27E2DB131F
          30C6B9E0B6EFDFC0830B1F4EBC38C1DD1B0E58FE7053F1C7010E9CDA16C898E0
          C700031164650B9C30D89A0E1318FF303D7DE0820333E7420DFEDA21850B81DF
          6E783E617A82AC0000EBA58A2040DEED3391655500845545D776C90DF6557DDA
          D91540835A1120985A8581675C42199DC4D36A1776E8A17037D5F7E188249668
          E2898825F5D168067534008A301AC75804A76134C073380645C07A082945D058
          76F1789B03DB45046159065190D67729F16400781F95F4118D06F0841D474119
          A08152415DF9817742ED5718576439401091F88909407E1624A0205953213090
          05DB5D20D09B70CA0911454315C49850BD2554D18D8436559150037987800162
          5695139EF911A0A84F04E0E7C09375C1C9DF7896B685568164C514237583D248
          9076690985A65A0E5840E05E06BCFF0427A8F5E159D89A006EA0E883B31618C1
          A8CC29C6E5041C026BEC8513E5F46779C7363B5C471F11EBECB4D4566BEDB5D8
          66ABED892A6EEB2D432E3A755073167EEBEC9F1378F6115312B878E872096946
          D09AF4B6E7DBAB5E89EA90015EE57B90054B7A29D29F3959B065A1838214ED06
          0475246FB003B058A95DCC1EA6265F100DB666040EC02B900511842C148B10DD
          D41FBCBB71CC58461C7FE4008B134D8052B4A25E1C5A7A5139B055B1031D7096
          590DD0F99503767EF0D2595B392061410F22E074B109ACC4D55A5B09E9D08C04
          8077530459477BD26EA23A65C16E41A104F0D08C6A8A5FD1ABDEFA955673A9C9
          71A3217DD0F65D09400896CE5999F7F910CB9535DCA5C11B0855934737E6C814
          480EB4A7375BB6F6676BAB47E67795A25A6AE0AA035C85BC9D49986B201E013A
          87DCA89E0E15CEF3C70364CD50E141595428C6465B1A40A3561D689769059EDC
          B6E5726F8579E539C9EDB477ABA3D8C096880F40FB0740C22D29AC207F957BA3
          6B15B896EE5A1D8F5F49B86F7024C7996A45328C314FC92CD25C1BB081E96065
          F692E95C2F7700BD7B771E72AB0D10883FD7FAABCF83E897350B7CEA566609A0
          B18C62A39E7828011E43480226783E87884E03113416631C7080191DC55C201C
          08480CB01B99853084C96A60B94EB82DFAE88B85DF221B022A08C36DB9694735
          CCA10E831310003B}
        mmHeight = 9525
        mmLeft = 529
        mmTop = 31750
        mmWidth = 33867
        BandType = 8
      end
    end
  end
  object ppDesigner: TppDesigner
    Caption = 'Relat'#243'rios'
    DataSettings.DatabaseName = 'DBBROKER'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtMSSQLServer
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport
    ShowData = False
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 480
    WindowLeft = 0
    WindowTop = 50
    WindowWidth = 640
    WindowState = wsMaximized
    Left = 482
    Top = 75
  end
  object ds_rel_recapa: TDataSource
    DataSet = qry_rel_recapa
    Left = 40
    Top = 254
  end
  object qry_rel_reanexo: TQuery
    CachedUpdates = True
    AfterScroll = qry_rel_reanexoAfterScroll
    OnCalcFields = qry_rel_reanexoCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '
      '   RE.CD_NCM,'
      
        '  (SELECT DESCRICAO FROM TNCM (NOLOCK) WHERE CODIGO = RE.CD_NCM)' +
        ' AS NM_NCM,'
      '   RE.CD_NALADI,'
      
        '  (SELECT DESCRICAO FROM TNCM (NOLOCK) WHERE CODIGO = RE.CD_NALA' +
        'DI) AS NM_NALADI,'
      
        '   RE.TX_DESC_MERCADORIA,RE.TX_CATEGORIA_TEXTIL,RE.CD_UF_PRODUTO' +
        'R,'
      
        '   RE.DT_VALIDADE_EMBARQUE,RE.PESO_LIQUIDO,RE.QT_UNIDADE_COMERCI' +
        'AL,'
      
        '  (SELECT NM_UNID_MEDIDA FROM TUNID_MEDIDA_BROKER (NOLOCK) WHERE' +
        ' CD_UNID_MEDIDA = RE.CD_UNID_MEDIDA) AS NM_UNIDADE_MED,'
      '   RE.QT_MEDIA_NBM,'
      
        '  (SELECT NM_SIGLA FROM TUNID_MEDIDA_BROKER (NOLOCK) WHERE CD_UN' +
        'ID_MEDIDA IN (SELECT UNIDADE_MEDIDA FROM TNCM (NOLOCK) WHERE COD' +
        'IGO = RE.CD_NCM)) AS NM_UNIDADE_MED_NCM,'
      '   RE.VL_COND_VENDA,RE.VL_LOCAL_VENDA,'
      
        '   CAST(RE.VL_COND_VENDA / RE.QT_UNIDADE_COMERCIAL AS DECIMAL(9,' +
        '2)) AS VL_UNIT_COND_VENDA,'
      
        '   CAST(RE.VL_LOCAL_VENDA / RE.QT_UNIDADE_COMERCIAL AS DECIMAL(9' +
        ',2)) AS VL_UNIT_LOCAL_VENDA,'
      
        '   RE.PC_COMISSAO,RE.CD_FORMA_PGTO_REBATE,RE.VL_COMISSAO_AGENTE_' +
        'REBATE,RE.CD_FINALIDADE,'
      
        '  (SELECT NM_FINALIDADE_MERC FROM TFINALIDADE_MERC (NOLOCK) WHER' +
        'E CD_FINALIDADE_MERC = RE.CD_FINALIDADE) AS NM_FINALIDADE,'
      '   CASE ISNULL(RE.IN_EXPORTADOR_FABRICANTE,'#39'0'#39')'
      '   WHEN '#39'0'#39' THEN '#39'S'#39
      '   WHEN '#39'1'#39' THEN '#39'N'#39
      '   END AS EXP_FABR,'
      '   CASE ISNULL(RE.IN_OBS_EXPORTADOR,'#39'0'#39')'
      '   WHEN '#39'0'#39' THEN '#39'N'#39
      '   WHEN '#39'1'#39' THEN '#39'S'#39
      '   END AS OBS_EXP,'
      
        '   RE.TX_OBSERVACAO_EXPORTADOR,RE.TX_MENS_ADVERTENCIA1,RE.TX_MEN' +
        'S_ADVERTENCIA2,RE.TX_MENS_ADVERTENCIA3,'
      
        '   RE.TX_MENS_ADVERTENCIA4,RE.TX_MENS_ADVERTENCIA5,RE.TX_MENS_AD' +
        'VERTENCIA6,RE.TX_MENS_ADVERTENCIA7,'
      
        '   RE.TX_MENS_ADVERTENCIA8,RE.TX_MENS_ADVERTENCIA9,RE.TX_MENS_AD' +
        'VERTENCIA10,RE.TX_MENS_ADVERTENCIA11,'
      
        '   RE.TX_MENS_ADVERTENCIA12,RE.TX_MENS_ADVERTENCIA13,RE.TX_OBSER' +
        'V_ORG_ANUENT1,RE.TX_OBSERV_ORG_ANUENT2,'
      
        '   RE.TX_OBSERV_ORG_ANUENT3,RE.TX_OBSERV_ORG_ANUENT4,RE.TX_OBSER' +
        'V_ORG_ANUENT5,RE.TX_OBSERV_ORG_ANUENT6,'
      
        '   RE.TX_OBSERV_ORG_ANUENT7,RE.TX_OBSERV_ORG_ANUENT8,RE.TX_OBSER' +
        'V_ORG_ANUENT9,RE.TX_OBSERV_ORG_ANUENT10,'
      
        '   RE.TX_OBSERV_ORG_ANUENT11,RE.TX_OBSERV_ORG_ANUENT12,RE.TX_OBS' +
        'ERV_ORG_ANUENT13,'
      '   RE.TX_OBSERV_ORG_ANUENT14,RE.CD_RE_ANEXO,RE.NR_PROCESSO'
      'FROM TRE_ANEXO RE (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 147
    Top = 203
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_rel_reanexoCD_NCM: TStringField
      FieldName = 'CD_NCM'
      FixedChar = True
      Size = 10
    end
    object qry_rel_reanexoNM_NCM: TStringField
      FieldName = 'NM_NCM'
      FixedChar = True
      Size = 120
    end
    object qry_rel_reanexoCD_NALADI: TStringField
      FieldName = 'CD_NALADI'
      FixedChar = True
      Size = 8
    end
    object qry_rel_reanexoNM_NALADI: TStringField
      FieldName = 'NM_NALADI'
      FixedChar = True
      Size = 120
    end
    object qry_rel_reanexoTX_DESC_MERCADORIA: TMemoField
      FieldName = 'TX_DESC_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_rel_reanexoTX_CATEGORIA_TEXTIL: TStringField
      FieldName = 'TX_CATEGORIA_TEXTIL'
      FixedChar = True
      Size = 30
    end
    object qry_rel_reanexoCD_UF_PRODUTOR: TStringField
      FieldName = 'CD_UF_PRODUTOR'
      FixedChar = True
      Size = 2
    end
    object qry_rel_reanexoDT_VALIDADE_EMBARQUE: TDateTimeField
      FieldName = 'DT_VALIDADE_EMBARQUE'
    end
    object qry_rel_reanexoPESO_LIQUIDO: TFloatField
      FieldName = 'PESO_LIQUIDO'
    end
    object qry_rel_reanexoQT_UNIDADE_COMERCIAL: TFloatField
      FieldName = 'QT_UNIDADE_COMERCIAL'
    end
    object qry_rel_reanexoNM_UNIDADE_MED: TStringField
      DisplayWidth = 3
      FieldName = 'NM_UNIDADE_MED'
      FixedChar = True
      Size = 3
    end
    object qry_rel_reanexoQT_MEDIA_NBM: TFloatField
      FieldName = 'QT_MEDIA_NBM'
    end
    object qry_rel_reanexoNM_UNIDADE_MED_NCM: TStringField
      FieldName = 'NM_UNIDADE_MED_NCM'
      FixedChar = True
      Size = 3
    end
    object qry_rel_reanexoVL_COND_VENDA: TFloatField
      FieldName = 'VL_COND_VENDA'
    end
    object qry_rel_reanexoVL_LOCAL_VENDA: TFloatField
      FieldName = 'VL_LOCAL_VENDA'
    end
    object qry_rel_reanexoVL_UNIT_COND_VENDA: TFloatField
      FieldName = 'VL_UNIT_COND_VENDA'
    end
    object qry_rel_reanexoVL_UNIT_LOCAL_VENDA: TFloatField
      FieldName = 'VL_UNIT_LOCAL_VENDA'
    end
    object qry_rel_reanexoPC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
    end
    object qry_rel_reanexoCD_FORMA_PGTO_REBATE: TStringField
      FieldName = 'CD_FORMA_PGTO_REBATE'
      FixedChar = True
      Size = 1
    end
    object qry_rel_reanexoVL_COMISSAO_AGENTE_REBATE: TFloatField
      FieldName = 'VL_COMISSAO_AGENTE_REBATE'
    end
    object qry_rel_reanexoCD_FINALIDADE: TStringField
      FieldName = 'CD_FINALIDADE'
      FixedChar = True
      Size = 3
    end
    object qry_rel_reanexoNM_FINALIDADE: TStringField
      FieldName = 'NM_FINALIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_rel_reanexoEXP_FABR: TStringField
      FieldName = 'EXP_FABR'
      FixedChar = True
      Size = 1
    end
    object qry_rel_reanexoOBS_EXP: TStringField
      FieldName = 'OBS_EXP'
      FixedChar = True
      Size = 1
    end
    object qry_rel_reanexoTX_OBSERVACAO_EXPORTADOR: TMemoField
      FieldName = 'TX_OBSERVACAO_EXPORTADOR'
      BlobType = ftMemo
    end
    object qry_rel_reanexoCD_RE_ANEXO: TIntegerField
      FieldName = 'CD_RE_ANEXO'
    end
    object qry_rel_reanexoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_rel_reanexoTX_MENS_ADVERTENCIA1: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA1'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_MENS_ADVERTENCIA2: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA2'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_MENS_ADVERTENCIA3: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA3'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_MENS_ADVERTENCIA4: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA4'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_MENS_ADVERTENCIA5: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA5'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_MENS_ADVERTENCIA6: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA6'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_MENS_ADVERTENCIA7: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA7'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_MENS_ADVERTENCIA8: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA8'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_MENS_ADVERTENCIA9: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA9'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_MENS_ADVERTENCIA10: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA10'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_MENS_ADVERTENCIA11: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA11'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_MENS_ADVERTENCIA12: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA12'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_MENS_ADVERTENCIA13: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA13'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_OBSERV_ORG_ANUENT1: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT1'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_OBSERV_ORG_ANUENT2: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT2'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_OBSERV_ORG_ANUENT3: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT3'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_OBSERV_ORG_ANUENT4: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT4'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_OBSERV_ORG_ANUENT5: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT5'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_OBSERV_ORG_ANUENT6: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT6'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_OBSERV_ORG_ANUENT7: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT7'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_OBSERV_ORG_ANUENT8: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT8'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_OBSERV_ORG_ANUENT9: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT9'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_OBSERV_ORG_ANUENT10: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT10'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_OBSERV_ORG_ANUENT11: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT11'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_OBSERV_ORG_ANUENT12: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT12'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_OBSERV_ORG_ANUENT13: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT13'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoTX_OBSERV_ORG_ANUENT14: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT14'
      FixedChar = True
      Size = 75
    end
    object qry_rel_reanexoCalcTX_OBSERVACAO_EXPORTADOR: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcTX_OBSERVACAO_EXPORTADOR'
      Size = 1000
      Calculated = True
    end
    object qry_rel_reanexoCalcTX_DESC_MERCADORIA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcTX_DESC_MERCADORIA'
      Size = 1000
      Calculated = True
    end
  end
  object ds_rel_reanexo: TDataSource
    DataSet = qry_rel_reanexo
    Left = 40
    Top = 206
  end
  object ppBDE_rel_reanexo: TppBDEPipeline
    DataSource = ds_rel_reanexo
    UserName = 'BDE_rel_reanexo'
    Left = 480
    Top = 16
    object ppBDE_rel_reanexoppField1: TppField
      FieldAlias = 'CD_NCM'
      FieldName = 'CD_NCM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField2: TppField
      FieldAlias = 'NM_NCM'
      FieldName = 'NM_NCM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField3: TppField
      FieldAlias = 'CD_NALADI'
      FieldName = 'CD_NALADI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField4: TppField
      FieldAlias = 'NM_NALADI'
      FieldName = 'NM_NALADI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField5: TppField
      FieldAlias = 'TX_DESC_MERCADORIA'
      FieldName = 'TX_DESC_MERCADORIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField6: TppField
      FieldAlias = 'TX_CATEGORIA_TEXTIL'
      FieldName = 'TX_CATEGORIA_TEXTIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField7: TppField
      FieldAlias = 'CD_UF_PRODUTOR'
      FieldName = 'CD_UF_PRODUTOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField8: TppField
      FieldAlias = 'DT_VALIDADE_EMBARQUE'
      FieldName = 'DT_VALIDADE_EMBARQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField9: TppField
      FieldAlias = 'PESO_LIQUIDO'
      FieldName = 'PESO_LIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField10: TppField
      FieldAlias = 'QT_UNIDADE_COMERCIAL'
      FieldName = 'QT_UNIDADE_COMERCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField11: TppField
      FieldAlias = 'NM_UNIDADE_MED'
      FieldName = 'NM_UNIDADE_MED'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField12: TppField
      FieldAlias = 'QT_MEDIA_NBM'
      FieldName = 'QT_MEDIA_NBM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField13: TppField
      FieldAlias = 'NM_UNIDADE_MED_NCM'
      FieldName = 'NM_UNIDADE_MED_NCM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField14: TppField
      FieldAlias = 'VL_COND_VENDA'
      FieldName = 'VL_COND_VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField15: TppField
      FieldAlias = 'VL_LOCAL_VENDA'
      FieldName = 'VL_LOCAL_VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField16: TppField
      FieldAlias = 'VL_UNIT_COND_VENDA'
      FieldName = 'VL_UNIT_COND_VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField17: TppField
      FieldAlias = 'VL_UNIT_LOCAL_VENDA'
      FieldName = 'VL_UNIT_LOCAL_VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField18: TppField
      FieldAlias = 'PC_COMISSAO'
      FieldName = 'PC_COMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField19: TppField
      FieldAlias = 'CD_FORMA_PGTO_REBATE'
      FieldName = 'CD_FORMA_PGTO_REBATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField20: TppField
      FieldAlias = 'VL_COMISSAO_AGENTE_REBATE'
      FieldName = 'VL_COMISSAO_AGENTE_REBATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField21: TppField
      FieldAlias = 'CD_FINALIDADE'
      FieldName = 'CD_FINALIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField22: TppField
      FieldAlias = 'NM_FINALIDADE'
      FieldName = 'NM_FINALIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField23: TppField
      FieldAlias = 'EXP_FABR'
      FieldName = 'EXP_FABR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField24: TppField
      FieldAlias = 'OBS_EXP'
      FieldName = 'OBS_EXP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField25: TppField
      FieldAlias = 'TX_OBSERVACAO_EXPORTADOR'
      FieldName = 'TX_OBSERVACAO_EXPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField26: TppField
      FieldAlias = 'CD_RE_ANEXO'
      FieldName = 'CD_RE_ANEXO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField27: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField28: TppField
      FieldAlias = 'TX_MENS_ADVERTENCIA1'
      FieldName = 'TX_MENS_ADVERTENCIA1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField29: TppField
      FieldAlias = 'TX_MENS_ADVERTENCIA2'
      FieldName = 'TX_MENS_ADVERTENCIA2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField30: TppField
      FieldAlias = 'TX_MENS_ADVERTENCIA3'
      FieldName = 'TX_MENS_ADVERTENCIA3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField31: TppField
      FieldAlias = 'TX_MENS_ADVERTENCIA4'
      FieldName = 'TX_MENS_ADVERTENCIA4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField32: TppField
      FieldAlias = 'TX_MENS_ADVERTENCIA5'
      FieldName = 'TX_MENS_ADVERTENCIA5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField33: TppField
      FieldAlias = 'TX_MENS_ADVERTENCIA6'
      FieldName = 'TX_MENS_ADVERTENCIA6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField34: TppField
      FieldAlias = 'TX_MENS_ADVERTENCIA7'
      FieldName = 'TX_MENS_ADVERTENCIA7'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField35: TppField
      FieldAlias = 'TX_MENS_ADVERTENCIA8'
      FieldName = 'TX_MENS_ADVERTENCIA8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField36: TppField
      FieldAlias = 'TX_MENS_ADVERTENCIA9'
      FieldName = 'TX_MENS_ADVERTENCIA9'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField37: TppField
      FieldAlias = 'TX_MENS_ADVERTENCIA10'
      FieldName = 'TX_MENS_ADVERTENCIA10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField38: TppField
      FieldAlias = 'TX_MENS_ADVERTENCIA11'
      FieldName = 'TX_MENS_ADVERTENCIA11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField39: TppField
      FieldAlias = 'TX_MENS_ADVERTENCIA12'
      FieldName = 'TX_MENS_ADVERTENCIA12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField40: TppField
      FieldAlias = 'TX_MENS_ADVERTENCIA13'
      FieldName = 'TX_MENS_ADVERTENCIA13'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField41: TppField
      FieldAlias = 'TX_OBSERV_ORG_ANUENT1'
      FieldName = 'TX_OBSERV_ORG_ANUENT1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField42: TppField
      FieldAlias = 'TX_OBSERV_ORG_ANUENT2'
      FieldName = 'TX_OBSERV_ORG_ANUENT2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField43: TppField
      FieldAlias = 'TX_OBSERV_ORG_ANUENT3'
      FieldName = 'TX_OBSERV_ORG_ANUENT3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField44: TppField
      FieldAlias = 'TX_OBSERV_ORG_ANUENT4'
      FieldName = 'TX_OBSERV_ORG_ANUENT4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField45: TppField
      FieldAlias = 'TX_OBSERV_ORG_ANUENT5'
      FieldName = 'TX_OBSERV_ORG_ANUENT5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField46: TppField
      FieldAlias = 'TX_OBSERV_ORG_ANUENT6'
      FieldName = 'TX_OBSERV_ORG_ANUENT6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField47: TppField
      FieldAlias = 'TX_OBSERV_ORG_ANUENT7'
      FieldName = 'TX_OBSERV_ORG_ANUENT7'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField48: TppField
      FieldAlias = 'TX_OBSERV_ORG_ANUENT8'
      FieldName = 'TX_OBSERV_ORG_ANUENT8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField49: TppField
      FieldAlias = 'TX_OBSERV_ORG_ANUENT9'
      FieldName = 'TX_OBSERV_ORG_ANUENT9'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField50: TppField
      FieldAlias = 'TX_OBSERV_ORG_ANUENT10'
      FieldName = 'TX_OBSERV_ORG_ANUENT10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField51: TppField
      FieldAlias = 'TX_OBSERV_ORG_ANUENT11'
      FieldName = 'TX_OBSERV_ORG_ANUENT11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField52: TppField
      FieldAlias = 'TX_OBSERV_ORG_ANUENT12'
      FieldName = 'TX_OBSERV_ORG_ANUENT12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppBDE_rel_reanexoppField53: TppField
      FieldAlias = 'TX_OBSERV_ORG_ANUENT13'
      FieldName = 'TX_OBSERV_ORG_ANUENT13'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
  end
  object qry_rel_reanexofabr: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '
      
        '   REF.NR_PROCESSO, REF.CD_RE_ANEXO, REF.CD_FABRICANTE, REF.NR_A' +
        'TO,'
      '   REF.QT_MERCADORIA, REF.VL_TOTAL,'
      
        '   (SELECT CGC_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRE' +
        'SA = REF.CD_FABRICANTE) AS CGC_FABRICANTE'
      'FROM TRE_ANEXO_FABRIC REF (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '      AND CD_RE_ANEXO = :CD_RE_ANEXO')
    Left = 148
    Top = 300
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_RE_ANEXO'
        ParamType = ptInput
      end>
    object qry_rel_reanexofabrNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_rel_reanexofabrCD_RE_ANEXO: TIntegerField
      FieldName = 'CD_RE_ANEXO'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.CD_RE_ANEXO'
    end
    object qry_rel_reanexofabrCD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_rel_reanexofabrNR_ATO: TStringField
      FieldName = 'NR_ATO'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.NR_ATO'
      FixedChar = True
      Size = 13
    end
    object qry_rel_reanexofabrQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.QT_MERCADORIA'
    end
    object qry_rel_reanexofabrVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.VL_TOTAL'
    end
    object qry_rel_reanexofabrCGC_FABRICANTE: TStringField
      FieldName = 'CGC_FABRICANTE'
      FixedChar = True
      Size = 14
    end
  end
  object ds_rel_reanexofabr: TDataSource
    DataSet = qry_rel_reanexofabr
    Left = 37
    Top = 303
  end
  object ppBDE_rel_reanexofabr: TppBDEPipeline
    DataSource = ds_rel_reanexofabr
    UserName = 'ppBDE_rel_reanexofabr'
    Left = 559
    Top = 16
  end
  object qry_recapa: TQuery
    CachedUpdates = True
    AfterOpen = qry_recapaAfterOpen
    AfterClose = qry_recapaAfterClose
    AfterScroll = qry_recapaAfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT RC.NR_PROCESSO, RC.NR_OUTRA_REF, RC.NR_RE_SISCOMEX,'
      
        '       ( SELECT CGC_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_' +
        'EMPRESA = CD_EXPORTADOR ) AS CGC_EXPORTADOR,'
      
        '       ( SELECT CPF_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_' +
        'EMPRESA = CD_EXPORTADOR ) AS CPF_EXPORTADOR,'
      
        '       ( SELECT CD_TIPO_PESSOA FROM TEMPRESA_NAC (NOLOCK) WHERE ' +
        'CD_EMPRESA = CD_EXPORTADOR ) AS CD_TIPO_PESSOA,'
      
        '       CD_ENQUAD1, CD_ENQUAD2, CD_ENQUAD3, CD_ENQUAD4, CD_ENQUAD' +
        '5, CD_ENQUAD6,'
      
        #9'  NR_REG_VENDA, NR_REG_CREDITO, DT_LIMITE_OPERACAO, CONVERT(DEC' +
        'IMAL(5,2),VL_MARGEM_NAO_SACADA) AS VL_MARGEM_NAO_SACADA,'
      
        #9'  NR_RE_VINCULADA, NR_DI_VINCULADA, CD_URF_DESPACHO, CD_URF_EMB' +
        'ARQUE, VL_PAGT_VISTA, VL_PAGTO_ANTEC,'
      
        #9'  CAST(SUBSTRING(TX_END_IMPORTADOR,1,55) AS CHAR(55)) AS NM_EMP' +
        'RESA_SISCOMEX,'
      
        '       CAST(SUBSTRING(TX_END_IMPORTADOR,56,55) AS CHAR(55)) AS E' +
        'ND_EMPRESA_SISCOMEX,'
      
        #9'  ( SELECT CD_SCX_EXP FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS ' +
        '= EE.CD_PAIS) CD_PAIS,'
      
        #9'  ( SELECT CD_SCX_EXP FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS ' +
        '= CD_PAIS_FINAL) CD_PAIS_FINAL, CD_INST_NEGO,'
      
        #9'  CD_MODALIDADE_TRANS, CD_MOEDA, NR_PARCELAS, NR_PERIODICIDADE,' +
        ' TP_INDICADOR, VL_PARCELA, VL_CONSIGN, '
      
        #9'  VL_SEM_COB_CAMBIAL, VL_FINANC_RC, CD_INCOTERM, VL_VALOR_COBER' +
        '_CAMBIAL'
      ' FROM TRE_CAPA RC (NOLOCK), TEMPRESA_EST EE (NOLOCK)'
      ' WHERE EE.CD_EMPRESA = RC.CD_IMPORTADOR'
      '  AND IN_SELECIONADO = '#39'1'#39)
    Left = 312
    Top = 16
  end
  object qry_reanexo: TQuery
    CachedUpdates = True
    AfterOpen = qry_reanexoAfterOpen
    AfterClose = qry_reanexoAfterClose
    AfterScroll = qry_reanexoAfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT RE.TX_DESC_MERCADORIA, RE.CD_NBM, RE.CD_NALADI, RE.CD_NCM' +
        ', RE.CD_SULF_NCM, RE.TX_CATEGORIA_TEXTIL, RE.CD_UF_PRODUTOR, CAS' +
        'T(RE.PESO_LIQUIDO AS DECIMAL(15,5)) AS PESO_LIQUIDO,'
      
        #9'    RE.QT_UNIDADE_COMERCIAL, RE.QT_MEDIA_NBM, RE.VL_COND_VENDA,' +
        ' RE.VL_LOCAL_VENDA, RE.PC_COMISSAO, RE.CD_FORMA_PGTO_REBATE,'
      
        #9'    RE.CD_FINALIDADE, RE.IN_EXPORTADOR_FABRICANTE, ISNULL(RE.IN' +
        '_OBS_EXPORTADOR,0) IN_OBS_EXPORTADOR, (SELECT UB.NM_UNID_MEDIDA ' +
        'FROM TUNID_MEDIDA_BROKER UB (NOLOCK) WHERE'
      
        'UB.CD_UNID_MEDIDA = RE.CD_UNID_MEDIDA) AS CD_UNID_MEDIDA, RE.TX_' +
        'OBSERVACAO_EXPORTADOR, RE.CD_RE_ANEXO'
      'FROM   TRE_ANEXO RE (NOLOCK)'
      'WHERE  RE.NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY CD_RE_ANEXO')
    Left = 311
    Top = 62
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
  end
  object qry_anexo_fabr: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_RE_ANEXO, CD_FABRICANTE,(SELECT AP_EMPRES' +
        'A FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA = CD_FABRICANTE) A' +
        'S FABRICANTE,'
      
        '(SELECT CGC_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE CD_EMPRESA ' +
        '= CD_FABRICANTE) AS CNPJ,'
      
        'SUBSTRING(RTRIM((SELECT END_ESTADO '#9'    FROM TEMPRESA_EST (NOLOC' +
        'K) WHERE CD_EMPRESA = CD_FABRICANTE) ),1,2) AS ESTADO_PRODUTOR,'
      
        '(SELECT CD_NCM '#9'    FROM TRE_ANEXO (NOLOCK)    WHERE CD_RE_ANEXO' +
        ' = RAF.CD_RE_ANEXO AND NR_PROCESSO = RAF.NR_PROCESSO) AS NCM,'
      
        '(SELECT CD_SULF_NCM   FROM TRE_ANEXO (NOLOCK)    WHERE CD_RE_ANE' +
        'XO = RAF.CD_RE_ANEXO AND NR_PROCESSO = RAF.NR_PROCESSO) AS SULF_' +
        'NCM,'
      'NR_ATO, QT_MERCADORIA, VL_TOTAL'
      'FROM '#9'TRE_ANEXO_FABRIC RAF (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'AND CD_RE_ANEXO  = :CD_RE_ANEXO')
    Left = 308
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_RE_ANEXO'
        ParamType = ptInput
      end>
    object qry_anexo_fabrNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_anexo_fabrCD_RE_ANEXO: TIntegerField
      FieldName = 'CD_RE_ANEXO'
    end
    object qry_anexo_fabrCD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_anexo_fabrFABRICANTE: TStringField
      FieldName = 'FABRICANTE'
      FixedChar = True
      Size = 10
    end
    object qry_anexo_fabrCNPJ: TStringField
      FieldName = 'CNPJ'
      FixedChar = True
      Size = 14
    end
    object qry_anexo_fabrESTADO_PRODUTOR: TStringField
      FieldName = 'ESTADO_PRODUTOR'
      FixedChar = True
      Size = 2
    end
    object qry_anexo_fabrNCM: TStringField
      FieldName = 'NCM'
      FixedChar = True
      Size = 10
    end
    object qry_anexo_fabrSULF_NCM: TStringField
      FieldName = 'SULF_NCM'
      FixedChar = True
      Size = 2
    end
    object qry_anexo_fabrNR_ATO: TStringField
      FieldName = 'NR_ATO'
      FixedChar = True
      Size = 13
    end
    object qry_anexo_fabrQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      DisplayFormat = '#,##0.00'
    end
    object qry_anexo_fabrVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '#,##0.00'
    end
  end
  object ByHLLAPI: TByHLLAPI
    HLLAPIKind = hkIWW4
    DllName = 'WHLLAPI.DLL'
    DllFunc = 'WINHLLAPI'
    IPAddress = '127.0.0.1'
    IPPort = 4321
    TimeOut = 60000
    Left = 559
    Top = 84
  end
  object mtExtratoRE: TMemoryTable
    Left = 401
    Top = 139
    object mtExtratoRETELA_SISCOMEX: TStringField
      FieldName = 'TELA_SISCOMEX'
      Size = 2000
    end
    object mtExtratoREPROCESSO: TStringField
      FieldName = 'PROCESSO'
      Size = 16
    end
  end
  object dsExtratoRE: TDataSource
    DataSet = mtExtratoRE
    Left = 485
    Top = 143
  end
  object BDEExtratoRE: TppBDEPipeline
    DataSource = dsExtratoRE
    UserName = 'BDEExtratoRE'
    Left = 561
    Top = 140
    object BDEExtratoREppField1: TppField
      FieldAlias = 'TELA_SISCOMEX'
      FieldName = 'TELA_SISCOMEX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object BDEExtratoREppField2: TppField
      FieldAlias = 'PROCESSO'
      FieldName = 'PROCESSO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
  end
  object XMLDocument1: TXMLDocument
    Left = 564
    Top = 208
    DOMVendorDesc = 'MSXML'
  end
  object dsFilaRE: TDataSource
    DataSet = qryFilaRE
    OnStateChange = ds_re_anexo_fabricStateChange
    Left = 32
    Top = 368
  end
  object qryFilaRE: TQuery
    CachedUpdates = True
    BeforeOpen = qryFilaREBeforeOpen
    BeforePost = qry_re_anexo_fabricBeforePost
    AfterPost = AplicaUpdates
    AfterDelete = AplicaUpdates
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TRE_CANCELAR (NOLOCK)'
      'WHERE IN_CANCELADO = :IN_CANCELADO'
      'ORDER BY DT_TRANSMISSAO, NR_RE')
    Left = 120
    Top = 367
    ParamData = <
      item
        DataType = ftString
        Name = 'IN_CANCELADO'
        ParamType = ptInput
        Value = '0'
      end>
    object qryFilaRENR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TRE_CANCELAR.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryFilaRENR_PROCESSO_COMPLEMENTO: TStringField
      FieldName = 'NR_PROCESSO_COMPLEMENTO'
      Origin = 'DBBROKER.TRE_CANCELAR.NR_PROCESSO_COMPLEMENTO'
      FixedChar = True
      Size = 3
    end
    object qryFilaRECD_RE_ANEXO: TIntegerField
      FieldName = 'CD_RE_ANEXO'
      Origin = 'DBBROKER.TRE_CANCELAR.CD_RE_ANEXO'
    end
    object qryFilaRENR_RE: TStringField
      FieldName = 'NR_RE'
      Origin = 'DBBROKER.TRE_CANCELAR.NR_RE'
      FixedChar = True
      Size = 15
    end
    object qryFilaREDT_TRANSMISSAO: TDateTimeField
      FieldName = 'DT_TRANSMISSAO'
      Origin = 'DBBROKER.TRE_CANCELAR.DT_TRANSMISSAO'
    end
    object qryFilaREDT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'DBBROKER.TRE_CANCELAR.DT_CANCELAMENTO'
    end
    object qryFilaRECD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TRE_CANCELAR.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryFilaREIN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'DBBROKER.TRE_CANCELAR.IN_CANCELADO'
      OnChange = qryFilaREIN_CANCELADOChange
      FixedChar = True
      Size = 1
    end
    object qryFilaRECD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      Origin = 'DBBROKER.TRE_CANCELAR.CD_CANCELADOR'
      FixedChar = True
      Size = 4
    end
  end
  object updFilaRE: TUpdateSQL
    ModifySQL.Strings = (
      'update TRE_CANCELAR'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO,'
      '  CD_RE_ANEXO = :CD_RE_ANEXO,'
      '  NR_RE = :NR_RE,'
      '  DT_TRANSMISSAO = :DT_TRANSMISSAO,'
      '  DT_CANCELAMENTO = :DT_CANCELAMENTO,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  IN_CANCELADO = :IN_CANCELADO,'
      '  CD_CANCELADOR = :CD_CANCELADOR'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO and'
      '  NR_RE = :OLD_NR_RE and'
      '  DT_TRANSMISSAO = :OLD_DT_TRANSMISSAO and'
      '  DT_CANCELAMENTO = :OLD_DT_CANCELAMENTO and'
      '  CD_USUARIO = :OLD_CD_USUARIO and'
      '  IN_CANCELADO = :OLD_IN_CANCELADO and'
      '  CD_CANCELADOR = :OLD_CD_CANCELADOR')
    InsertSQL.Strings = (
      'insert into TRE_CANCELAR'
      
        '  (NR_PROCESSO, NR_PROCESSO_COMPLEMENTO, CD_RE_ANEXO, NR_RE, DT_' +
        'TRANSMISSAO, '
      '   DT_CANCELAMENTO, CD_USUARIO, IN_CANCELADO, CD_CANCELADOR)'
      'values'
      
        '  (:NR_PROCESSO, :NR_PROCESSO_COMPLEMENTO, :CD_RE_ANEXO, :NR_RE,' +
        ' :DT_TRANSMISSAO, '
      '   :DT_CANCELAMENTO, :CD_USUARIO, :IN_CANCELADO, :CD_CANCELADOR)')
    DeleteSQL.Strings = (
      'DELETE TRE_CANCELAR'
      'WHERE'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO and'
      '  NR_RE = :OLD_NR_RE and'
      '  DT_TRANSMISSAO = :OLD_DT_TRANSMISSAO and'
      '  DT_CANCELAMENTO = :OLD_DT_CANCELAMENTO and'
      '  CD_USUARIO = :OLD_CD_USUARIO and'
      '  IN_CANCELADO = :OLD_IN_CANCELADO and'
      '  CD_CANCELADOR = :OLD_CD_CANCELADOR')
    Left = 254
    Top = 415
  end
  object qrySituacaoFila: TQuery
    CachedUpdates = True
    BeforeOpen = qryFilaREBeforeOpen
    BeforePost = qry_re_anexo_fabricBeforePost
    AfterPost = AplicaUpdates
    AfterDelete = AplicaUpdates
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT '#39'0'#39' AS CD_SITUACAO, '#39'A Cancelar'#39' AS NM_SITUACAO'
      'UNION ALL'
      'SELECT '#39'1'#39' AS CD_SITUACAO, '#39'Cancelado'#39' AS NM_SITUACAO'
      'UNION ALL'
      
        'SELECT '#39'-'#39' AS CD_SITUACAO, '#39'Cancelamento Cancelado'#39' AS NM_SITUAC' +
        'AO')
    UpdateObject = updFilaRE
    Left = 120
    Top = 415
    object qrySituacaoFilaCD_SITUACAO: TStringField
      FieldName = 'CD_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object qrySituacaoFilaNM_SITUACAO: TStringField
      FieldName = 'NM_SITUACAO'
      FixedChar = True
      Size = 22
    end
  end
  object dsSituacaoFila: TDataSource
    DataSet = qrySituacaoFila
    OnStateChange = ds_re_anexo_fabricStateChange
    Left = 32
    Top = 416
  end
  object qryGrupo: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_GRUPO , NM_GRUPO   FROM TGRUPO (NOLOCK)  WHERE IN_ATIV' +
        'O = 1 ORDER BY NM_GRUPO   ')
    Left = 418
    Top = 275
    object qryGrupoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
    object qryGrupoNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Size = 50
    end
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 480
    Top = 273
    object cdsGrupoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
    object cdsGrupoNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Size = 50
    end
  end
  object dspGrupo: TDataSetProvider
    DataSet = qryGrupo
    Left = 418
    Top = 340
  end
  object dsGrupo: TDataSource
    DataSet = cdsGrupo
    Left = 477
    Top = 338
  end
end

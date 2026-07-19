object datm_int_mesquita: Tdatm_int_mesquita
  Left = 252
  Top = 125
  Height = 388
  Width = 531
  object ds_int_mesquita005: TDataSource
    DataSet = qry_int_mesquita005_
    Left = 48
    Top = 24
  end
  object qry_ultimo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX( NR_IDENTIFICADOR ) NR_IDENTIFICADOR'
      'FROM   TINT_MESQUITA005')
    Left = 422
    Top = 24
  end
  object ds_int_mesquita009: TDataSource
    DataSet = qry_int_mesquita009_
    Left = 48
    Top = 96
  end
  object qry_int_mesquita005_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM    TINT_MESQUITA005')
    Left = 169
    Top = 24
    object qry_int_mesquita005_NR_IDENTIFICADOR: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
      Origin = 'TINT_MESQUITA005.NR_IDENTIFICADOR'
    end
    object qry_int_mesquita005_NM_CNPJ: TStringField
      FieldName = 'NM_CNPJ'
      Origin = 'TINT_MESQUITA005.NM_CNPJ'
      Size = 18
    end
    object qry_int_mesquita005_NM_NAVIO: TStringField
      FieldName = 'NM_NAVIO'
      Origin = 'TINT_MESQUITA005.NM_NAVIO'
      Size = 18
    end
    object qry_int_mesquita005_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'TINT_MESQUITA005.NR_VIAGEM'
      Size = 12
    end
    object qry_int_mesquita005_NR_BL: TStringField
      FieldName = 'NR_BL'
      Origin = 'TINT_MESQUITA005.NR_BL'
    end
    object qry_int_mesquita005_NM_PORTO: TStringField
      FieldName = 'NM_PORTO'
      Origin = 'TINT_MESQUITA005.NM_PORTO'
    end
    object qry_int_mesquita005_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      Origin = 'TINT_MESQUITA005.NM_ARMADOR'
      Size = 18
    end
    object qry_int_mesquita005_NR_CNPJ: TStringField
      FieldName = 'NR_CNPJ'
      Origin = 'TINT_MESQUITA005.NR_CNPJ'
      Size = 18
    end
    object qry_int_mesquita005_CH_PRESENCA: TStringField
      FieldName = 'CH_PRESENCA'
      Origin = 'TINT_MESQUITA005.CH_PRESENCA'
      Size = 36
    end
    object qry_int_mesquita005_DT_PRESENCA: TDateTimeField
      FieldName = 'DT_PRESENCA'
      Origin = 'TINT_MESQUITA005.DT_PRESENCA'
    end
  end
  object qry_int_mesquita005c_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_CNPJ, CH_PRESENCA'
      'FROM    TINT_MESQUITA005'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR AND'
      '               NM_CNPJ = :NM_CNPJ AND'
      '               NM_NAVIO = :NM_NAVIO AND'
      '               NR_VIAGEM = :NR_VIAGEM AND'
      '               NR_BL = :NR_BL AND'
      '               NM_PORTO = :NM_PORTO AND'
      '               NM_ARMADOR = :NM_ARMADOR')
    Params.Data = {
      01000700104E525F4944454E544946494341444F520001020030000000074E4D
      5F434E504A0001020030000000084E4D5F4E4156494F0001020030000000094E
      525F56494147454D0001020030000000054E525F424C0001020030000000084E
      4D5F504F52544F00010200300000000A4E4D5F41524D41444F52000102003000
      0000}
    Left = 169
    Top = 160
    object qry_int_mesquita005c_NR_CNPJ: TStringField
      FieldName = 'NR_CNPJ'
      Origin = 'TINT_MESQUITA005.NR_CNPJ'
      Size = 18
    end
    object qry_int_mesquita005c_CH_PRESENCA: TStringField
      FieldName = 'CH_PRESENCA'
      Origin = 'TINT_MESQUITA005.NR_CNPJ'
      Size = 36
    end
  end
  object qry_int_mesquita009_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM    TINT_MESQUITA009')
    Left = 169
    Top = 96
    object qry_int_mesquita009_NR_IDENTIFICADOR: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
      Origin = 'TINT_MESQUITA009.NR_IDENTIFICADOR'
    end
    object qry_int_mesquita009_NM_CNPJ: TStringField
      FieldName = 'NM_CNPJ'
      Origin = 'TINT_MESQUITA009.NM_CNPJ'
      Size = 18
    end
    object qry_int_mesquita009_NM_NAVIO: TStringField
      FieldName = 'NM_NAVIO'
      Origin = 'TINT_MESQUITA009.NM_NAVIO'
      Size = 18
    end
    object qry_int_mesquita009_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'TINT_MESQUITA009.NR_VIAGEM'
      Size = 12
    end
    object qry_int_mesquita009_NR_BL: TStringField
      FieldName = 'NR_BL'
      Origin = 'TINT_MESQUITA009.NR_BL'
    end
    object qry_int_mesquita009_NM_PORTO: TStringField
      FieldName = 'NM_PORTO'
      Origin = 'TINT_MESQUITA009.NM_PORTO'
    end
    object qry_int_mesquita009_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      Origin = 'TINT_MESQUITA009.NM_ARMADOR'
      Size = 18
    end
    object qry_int_mesquita009_NR_CNPJ: TStringField
      FieldName = 'NR_CNPJ'
      Origin = 'TINT_MESQUITA009.NR_CNPJ'
      Size = 18
    end
    object qry_int_mesquita009_CH_PRESENCA: TStringField
      FieldName = 'CH_PRESENCA'
      Origin = 'TINT_MESQUITA009.CH_PRESENCA'
      Size = 36
    end
    object qry_int_mesquita009_NR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      Origin = 'TINT_MESQUITA009.NR_CNTR'
      Size = 12
    end
    object qry_int_mesquita009_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'TINT_MESQUITA009.TP_CNTR'
      Size = 4
    end
    object qry_int_mesquita009_DT_DESOVA: TDateTimeField
      FieldName = 'DT_DESOVA'
      Origin = 'TINT_MESQUITA009.DT_DESOVA'
    end
    object qry_int_mesquita009_DT_CARREGAMENTO: TDateTimeField
      FieldName = 'DT_CARREGAMENTO'
      Origin = 'TINT_MESQUITA009.DT_CARREGAMENTO'
    end
    object qry_int_mesquita009_DT_RET_FABRICA: TDateTimeField
      FieldName = 'DT_RET_FABRICA'
      Origin = 'TINT_MESQUITA009.DT_RET_FABRICA'
    end
    object qry_int_mesquita009_DT_DEV_CNTR: TDateTimeField
      FieldName = 'DT_DEV_CNTR'
      Origin = 'TINT_MESQUITA009.DT_DEV_CNTR'
    end
    object qry_int_mesquita009_DT_ATRACACAO: TDateTimeField
      FieldName = 'DT_ATRACACAO'
      Origin = 'TINT_MESQUITA009.DT_ATRACACAO'
    end
    object qry_int_mesquita009_DT_PRESENCA: TDateTimeField
      FieldName = 'DT_PRESENCA'
      Origin = 'TINT_MESQUITA009.NR_IDENTIFICADOR'
    end
    object qry_int_mesquita009_DT_ENT_FABRICA: TDateTimeField
      FieldName = 'DT_ENT_FABRICA'
      Origin = 'TINT_MESQUITA009.NM_CNPJ'
    end
    object qry_int_mesquita009_DT_ENT_PATIO: TDateTimeField
      FieldName = 'DT_ENT_PATIO'
      Origin = 'TINT_MESQUITA009.NM_NAVIO'
    end
    object qry_int_mesquita009_TX_OBS_AVARIA: TMemoField
      FieldName = 'TX_OBS_AVARIA'
      Origin = 'TINT_MESQUITA009.NR_VIAGEM'
      BlobType = ftMemo
    end
  end
  object qry_atz_mesquita009_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 301
    Top = 96
  end
  object qry_atz_mesquita005_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 301
    Top = 24
    object qry_atz_mesquita005_NR_IDENTIFICADOR: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
      Origin = 'TINT_MESQUITA005.NR_IDENTIFICADOR'
    end
    object qry_atz_mesquita005_NM_CNPJ: TStringField
      FieldName = 'NM_CNPJ'
      Origin = 'TINT_MESQUITA005.NM_CNPJ'
      Size = 18
    end
    object qry_atz_mesquita005_NM_NAVIO: TStringField
      FieldName = 'NM_NAVIO'
      Origin = 'TINT_MESQUITA005.NM_NAVIO'
      Size = 18
    end
    object qry_atz_mesquita005_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'TINT_MESQUITA005.NR_VIAGEM'
      Size = 12
    end
    object qry_atz_mesquita005_NR_BL: TStringField
      FieldName = 'NR_BL'
      Origin = 'TINT_MESQUITA005.NR_BL'
    end
    object qry_atz_mesquita005_NM_PORTO: TStringField
      FieldName = 'NM_PORTO'
      Origin = 'TINT_MESQUITA005.NM_PORTO'
    end
    object qry_atz_mesquita005_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      Origin = 'TINT_MESQUITA005.NM_ARMADOR'
      Size = 18
    end
    object qry_atz_mesquita005_NR_CNPJ: TStringField
      FieldName = 'NR_CNPJ'
      Origin = 'TINT_MESQUITA005.NR_CNPJ'
      Size = 18
    end
    object qry_atz_mesquita005_CH_PRESENCA: TStringField
      FieldName = 'CH_PRESENCA'
      Origin = 'TINT_MESQUITA005.CH_PRESENCA'
      Size = 36
    end
    object qry_atz_mesquita005_DT_PRESENCA: TDateTimeField
      FieldName = 'DT_PRESENCA'
      Origin = 'TINT_MESQUITA005.DT_PRESENCA'
    end
  end
  object qry_cd_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_EMPRESA'
      'FROM     TEMPRESA_NAC'
      'WHERE  CGC_EMPRESA = :CGC_EMPRESA')
    Params.Data = {010001000B4347435F454D50524553410001020030000000}
    Left = 422
    Top = 96
    object qry_cd_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
  end
  object qry_verif_tprocesso_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT  *'
      'FROM    TPROCESSO'
      'WHERE NR_PRESENCA_CARGA = :NR_PRESENCA_CARGA'
      '      AND NR_CONHECIMENTO = :NR_CONHECIMENTO')
    Params.Data = {
      01000200114E525F50524553454E43415F434152474100010200300000000F4E
      525F434F4E484543494D454E544F0001020030000000}
    Left = 422
    Top = 160
    object qry_verif_tprocesso_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_verif_tprocesso_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_verif_tprocesso_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 2
    end
    object qry_verif_tprocesso_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_verif_tprocesso_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.CD_SERVICO'
      Size = 3
    end
    object qry_verif_tprocesso_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TPROCESSO.CD_USUARIO'
      Size = 4
    end
    object qry_verif_tprocesso_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'TPROCESSO.DT_ABERTURA'
    end
    object qry_verif_tprocesso_CD_RESTRICAO: TStringField
      FieldName = 'CD_RESTRICAO'
      Origin = 'TPROCESSO.CD_RESTRICAO'
      Size = 1
    end
    object qry_verif_tprocesso_CD_LIBERADOR: TStringField
      FieldName = 'CD_LIBERADOR'
      Origin = 'TPROCESSO.CD_LIBERADOR'
      Size = 4
    end
    object qry_verif_tprocesso_DT_LIBERACAO: TDateTimeField
      FieldName = 'DT_LIBERACAO'
      Origin = 'TPROCESSO.DT_LIBERACAO'
    end
    object qry_verif_tprocesso_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TPROCESSO.IN_CANCELADO'
      Size = 1
    end
    object qry_verif_tprocesso_CD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      Origin = 'TPROCESSO.CD_CANCELADOR'
      Size = 4
    end
    object qry_verif_tprocesso_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'TPROCESSO.DT_CANCELAMENTO'
    end
    object qry_verif_tprocesso_CD_REPRESENTANTE: TStringField
      FieldName = 'CD_REPRESENTANTE'
      Origin = 'TPROCESSO.CD_REPRESENTANTE'
      Size = 5
    end
    object qry_verif_tprocesso_NR_PROC_RISC: TStringField
      FieldName = 'NR_PROC_RISC'
      Origin = 'TPROCESSO.NR_PROC_RISC'
      Size = 5
    end
    object qry_verif_tprocesso_NR_PROC_PARCEIRO: TStringField
      FieldName = 'NR_PROC_PARCEIRO'
      Origin = 'TPROCESSO.NR_PROC_PARCEIRO'
      Size = 8
    end
    object qry_verif_tprocesso_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TPROCESSO.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_verif_tprocesso_IN_MERC_PERIGOSA: TStringField
      FieldName = 'IN_MERC_PERIGOSA'
      Origin = 'TPROCESSO.IN_MERC_PERIGOSA'
      Size = 1
    end
    object qry_verif_tprocesso_TX_OBSERVACOES: TMemoField
      FieldName = 'TX_OBSERVACOES'
      Origin = 'TPROCESSO.TX_OBSERVACOES'
      BlobType = ftMemo
    end
    object qry_verif_tprocesso_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TPROCESSO.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_verif_tprocesso_VL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      Origin = 'TPROCESSO.VL_MLE_MNEG'
    end
    object qry_verif_tprocesso_VL_MLE_MN: TFloatField
      FieldName = 'VL_MLE_MN'
      Origin = 'TPROCESSO.VL_MLE_MN'
    end
    object qry_verif_tprocesso_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TPROCESSO.CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_verif_tprocesso_VL_FRETE_PREPAID_MNEG: TFloatField
      FieldName = 'VL_FRETE_PREPAID_MNEG'
      Origin = 'TPROCESSO.VL_FRETE_PREPAID_MNEG'
    end
    object qry_verif_tprocesso_VL_FRETE_COLLECT_MNEG: TFloatField
      FieldName = 'VL_FRETE_COLLECT_MNEG'
      Origin = 'TPROCESSO.VL_FRETE_COLLECT_MNEG'
    end
    object qry_verif_tprocesso_VL_FRETE_MN: TFloatField
      FieldName = 'VL_FRETE_MN'
      Origin = 'TPROCESSO.VL_FRETE_MN'
    end
    object qry_verif_tprocesso_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'TPROCESSO.CD_MOEDA_SEGURO'
      Size = 3
    end
    object qry_verif_tprocesso_VL_SEGURO_MNEG: TFloatField
      FieldName = 'VL_SEGURO_MNEG'
      Origin = 'TPROCESSO.VL_SEGURO_MNEG'
    end
    object qry_verif_tprocesso_VL_SEGURO_MN: TFloatField
      FieldName = 'VL_SEGURO_MN'
      Origin = 'TPROCESSO.VL_SEGURO_MN'
    end
    object qry_verif_tprocesso_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'TPROCESSO.CD_AGENTE'
      Size = 4
    end
    object qry_verif_tprocesso_VL_TAXA_FRETE: TFloatField
      FieldName = 'VL_TAXA_FRETE'
      Origin = 'TPROCESSO.VL_TAXA_FRETE'
    end
    object qry_verif_tprocesso_VL_CIF_DOLAR: TFloatField
      FieldName = 'VL_CIF_DOLAR'
      Origin = 'TPROCESSO.VL_CIF_DOLAR'
    end
    object qry_verif_tprocesso_VL_CIF_MN: TFloatField
      FieldName = 'VL_CIF_MN'
      Origin = 'TPROCESSO.VL_CIF_MN'
    end
    object qry_verif_tprocesso_VL_II_MN: TFloatField
      FieldName = 'VL_II_MN'
      Origin = 'TPROCESSO.VL_II_MN'
    end
    object qry_verif_tprocesso_VL_IPI_MN: TFloatField
      FieldName = 'VL_IPI_MN'
      Origin = 'TPROCESSO.VL_IPI_MN'
    end
    object qry_verif_tprocesso_VL_ICMS_MN: TFloatField
      FieldName = 'VL_ICMS_MN'
      Origin = 'TPROCESSO.VL_ICMS_MN'
    end
    object qry_verif_tprocesso_CD_ARMAZEM_ATRACACAO: TStringField
      FieldName = 'CD_ARMAZEM_ATRACACAO'
      Origin = 'TPROCESSO.CD_ARMAZEM_ATRACACAO'
      Size = 4
    end
    object qry_verif_tprocesso_CD_ARMAZEM_DESCARGA: TStringField
      FieldName = 'CD_ARMAZEM_DESCARGA'
      Origin = 'TPROCESSO.CD_ARMAZEM_DESCARGA'
      Size = 4
    end
    object qry_verif_tprocesso_CD_ARMAZEM_ESTOCAGEM: TStringField
      FieldName = 'CD_ARMAZEM_ESTOCAGEM'
      Origin = 'TPROCESSO.CD_ARMAZEM_ESTOCAGEM'
      Size = 4
    end
    object qry_verif_tprocesso_CD_TRANSP_NAC: TStringField
      FieldName = 'CD_TRANSP_NAC'
      Origin = 'TPROCESSO.CD_TRANSP_NAC'
      Size = 4
    end
    object qry_verif_tprocesso_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'TPROCESSO.CD_EMBARCACAO'
      Size = 4
    end
    object qry_verif_tprocesso_NR_VOO: TStringField
      FieldName = 'NR_VOO'
      Origin = 'TPROCESSO.NR_VOO'
      Size = 18
    end
    object qry_verif_tprocesso_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'TPROCESSO.NR_CONHECIMENTO'
      Size = 30
    end
    object qry_verif_tprocesso_NR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      Origin = 'TPROCESSO.NR_CONHECIMENTO_MASTER'
      Size = 30
    end
    object qry_verif_tprocesso_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPROCESSO.CD_PAIS_ORIGEM'
      Size = 3
    end
    object qry_verif_tprocesso_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Origin = 'TPROCESSO.CD_LOCAL_EMBARQUE'
      Size = 4
    end
    object qry_verif_tprocesso_CD_PAIS_DESTINO: TStringField
      FieldName = 'CD_PAIS_DESTINO'
      Origin = 'TPROCESSO.CD_PAIS_DESTINO'
      Size = 3
    end
    object qry_verif_tprocesso_CD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'TPROCESSO.CD_LOCAL_DESEMBARQUE'
      Size = 4
    end
    object qry_verif_tprocesso_NR_DI: TStringField
      FieldName = 'NR_DI'
      Origin = 'TPROCESSO.NR_DI'
      Size = 10
    end
    object qry_verif_tprocesso_QT_REF_CLIENTE: TIntegerField
      FieldName = 'QT_REF_CLIENTE'
      Origin = 'TPROCESSO.QT_REF_CLIENTE'
    end
    object qry_verif_tprocesso_QT_SOLINUM: TIntegerField
      FieldName = 'QT_SOLINUM'
      Origin = 'TPROCESSO.QT_SOLINUM'
    end
    object qry_verif_tprocesso_QT_RECEBIMENTO: TIntegerField
      FieldName = 'QT_RECEBIMENTO'
      Origin = 'TPROCESSO.QT_RECEBIMENTO'
    end
    object qry_verif_tprocesso_QT_DEVOLUCOES: TIntegerField
      FieldName = 'QT_DEVOLUCOES'
      Origin = 'TPROCESSO.QT_DEVOLUCOES'
    end
    object qry_verif_tprocesso_QT_LANC_FAT: TIntegerField
      FieldName = 'QT_LANC_FAT'
      Origin = 'TPROCESSO.QT_LANC_FAT'
    end
    object qry_verif_tprocesso_BASE_CALCULO_SDA: TFloatField
      FieldName = 'BASE_CALCULO_SDA'
      Origin = 'TPROCESSO.BASE_CALCULO_SDA'
    end
    object qry_verif_tprocesso_VL_SDA: TFloatField
      FieldName = 'VL_SDA'
      Origin = 'TPROCESSO.VL_SDA'
    end
    object qry_verif_tprocesso_VL_CONTR_ASSIST: TFloatField
      FieldName = 'VL_CONTR_ASSIST'
      Origin = 'TPROCESSO.VL_CONTR_ASSIST'
    end
    object qry_verif_tprocesso_DT_DISTRIBUICAO: TDateTimeField
      FieldName = 'DT_DISTRIBUICAO'
      Origin = 'TPROCESSO.DT_DISTRIBUICAO'
    end
    object qry_verif_tprocesso_CD_DESPACHANTE_SDA: TStringField
      FieldName = 'CD_DESPACHANTE_SDA'
      Origin = 'TPROCESSO.CD_DESPACHANTE_SDA'
      Size = 3
    end
    object qry_verif_tprocesso_CD_STATUS_SDA: TStringField
      FieldName = 'CD_STATUS_SDA'
      Origin = 'TPROCESSO.CD_STATUS_SDA'
      Size = 1
    end
    object qry_verif_tprocesso_VL_FRETE_INTERNO: TFloatField
      FieldName = 'VL_FRETE_INTERNO'
      Origin = 'TPROCESSO.VL_FRETE_INTERNO'
    end
    object qry_verif_tprocesso_NM_LOCAL_NF_LWW: TStringField
      FieldName = 'NM_LOCAL_NF_LWW'
      Origin = 'TPROCESSO.NM_LOCAL_NF_LWW'
    end
    object qry_verif_tprocesso_DT_CONTABIL_LWW: TDateTimeField
      FieldName = 'DT_CONTABIL_LWW'
      Origin = 'TPROCESSO.DT_CONTABIL_LWW'
    end
    object qry_verif_tprocesso_TX_OBS_LWW: TMemoField
      FieldName = 'TX_OBS_LWW'
      Origin = 'TPROCESSO.TX_OBS_LWW'
      BlobType = ftMemo
    end
    object qry_verif_tprocesso_DT_ATRACACAO: TDateTimeField
      FieldName = 'DT_ATRACACAO'
      Origin = 'TPROCESSO.DT_ATRACACAO'
    end
    object qry_verif_tprocesso_DT_DESCARGA: TDateTimeField
      FieldName = 'DT_DESCARGA'
      Origin = 'TPROCESSO.DT_DESCARGA'
    end
    object qry_verif_tprocesso_DT_ESTOCAGEM: TDateTimeField
      FieldName = 'DT_ESTOCAGEM'
      Origin = 'TPROCESSO.DT_ESTOCAGEM'
    end
    object qry_verif_tprocesso_DT_CONHECIMENTO: TDateTimeField
      FieldName = 'DT_CONHECIMENTO'
      Origin = 'TPROCESSO.DT_CONHECIMENTO'
    end
    object qry_verif_tprocesso_DT_DESEMBARACO: TDateTimeField
      FieldName = 'DT_DESEMBARACO'
      Origin = 'TPROCESSO.DT_DESEMBARACO'
    end
    object qry_verif_tprocesso_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Origin = 'TPROCESSO.IN_LIBERADO'
      Size = 1
    end
    object qry_verif_tprocesso_DT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Origin = 'TPROCESSO.DT_EMBARQUE'
    end
    object qry_verif_tprocesso_CD_REGIME_TRIB: TStringField
      FieldName = 'CD_REGIME_TRIB'
      Origin = 'TPROCESSO.CD_REGIME_TRIB'
      Size = 1
    end
    object qry_verif_tprocesso_IN_CHEQUE_SDA: TStringField
      FieldName = 'IN_CHEQUE_SDA'
      Origin = 'TPROCESSO.IN_CHEQUE_SDA'
      Size = 1
    end
    object qry_verif_tprocesso_IN_LIQUIDADO: TStringField
      FieldName = 'IN_LIQUIDADO'
      Origin = 'TPROCESSO.IN_LIQUIDADO'
      Size = 1
    end
    object qry_verif_tprocesso_VL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
      Origin = 'TPROCESSO.VL_FRETE_TNAC_MNEG'
    end
    object qry_verif_tprocesso_IN_PRODUCAO: TStringField
      FieldName = 'IN_PRODUCAO'
      Origin = 'TPROCESSO.IN_PRODUCAO'
      Size = 1
    end
    object qry_verif_tprocesso_NR_DDE: TStringField
      FieldName = 'NR_DDE'
      Origin = 'TPROCESSO.NR_DDE'
      Size = 11
    end
    object qry_verif_tprocesso_IN_SDA_PAGO: TStringField
      FieldName = 'IN_SDA_PAGO'
      Origin = 'TPROCESSO.IN_SDA_PAGO'
      Size = 1
    end
    object qry_verif_tprocesso_TX_OBS_INT: TMemoField
      FieldName = 'TX_OBS_INT'
      Origin = 'TPROCESSO.TX_OBS_INT'
      BlobType = ftMemo
    end
    object qry_verif_tprocesso_CD_CANAL: TStringField
      FieldName = 'CD_CANAL'
      Origin = 'TPROCESSO.CD_CANAL'
      Size = 1
    end
    object qry_verif_tprocesso_IN_URGENTE: TStringField
      FieldName = 'IN_URGENTE'
      Origin = 'TPROCESSO.IN_URGENTE'
      Size = 1
    end
    object qry_verif_tprocesso_CD_ANALISTA_CLIENTE: TStringField
      FieldName = 'CD_ANALISTA_CLIENTE'
      Origin = 'TPROCESSO.CD_ANALISTA_CLIENTE'
      Size = 4
    end
    object qry_verif_tprocesso_CD_ANALISTA_COMISSARIA: TStringField
      FieldName = 'CD_ANALISTA_COMISSARIA'
      Origin = 'TPROCESSO.CD_ANALISTA_COMISSARIA'
      Size = 4
    end
    object qry_verif_tprocesso_NR_PRESENCA_CARGA: TStringField
      FieldName = 'NR_PRESENCA_CARGA'
      Origin = 'TPROCESSO.NR_PRESENCA_CARGA'
      Size = 36
    end
    object qry_verif_tprocesso_DT_PRESENCA_CARGA: TDateTimeField
      FieldName = 'DT_PRESENCA_CARGA'
      Origin = 'TPROCESSO.DT_PRESENCA_CARGA'
    end
    object qry_verif_tprocesso_IN_POR_VEICULO: TStringField
      FieldName = 'IN_POR_VEICULO'
      Origin = 'TPROCESSO.IN_POR_VEICULO'
      Size = 1
    end
    object qry_verif_tprocesso_CD_USUARIO_REPASSA: TStringField
      FieldName = 'CD_USUARIO_REPASSA'
      Origin = 'TPROCESSO.CD_USUARIO_REPASSA'
      Size = 4
    end
    object qry_verif_tprocesso_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'TPROCESSO.NR_VIAGEM'
      Size = 15
    end
    object qry_verif_tprocesso_IN_IMP_ARM: TStringField
      FieldName = 'IN_IMP_ARM'
      Origin = 'TPROCESSO.IN_IMP_ARM'
      Size = 1
    end
    object qry_verif_tprocesso_CD_TRANSP_NAC_DOC: TStringField
      FieldName = 'CD_TRANSP_NAC_DOC'
      Origin = 'TPROCESSO.CD_TRANSP_NAC_DOC'
      Size = 4
    end
    object qry_verif_tprocesso_IN_DI_LIBERADA: TStringField
      FieldName = 'IN_DI_LIBERADA'
      Origin = 'TPROCESSO.IN_DI_LIBERADA'
      Size = 1
    end
    object qry_verif_tprocesso_CD_LIBERADOR_DI: TStringField
      FieldName = 'CD_LIBERADOR_DI'
      Origin = 'TPROCESSO.CD_LIBERADOR_DI'
      Size = 4
    end
    object qry_verif_tprocesso_NR_AVERBACAO: TStringField
      FieldName = 'NR_AVERBACAO'
      Origin = 'TPROCESSO.NR_AVERBACAO'
      Size = 10
    end
    object qry_verif_tprocesso_VL_PREMIO_SEGURO: TFloatField
      FieldName = 'VL_PREMIO_SEGURO'
      Origin = 'TPROCESSO.VL_PREMIO_SEGURO'
    end
    object qry_verif_tprocesso_TP_BANCO_EXP: TStringField
      FieldName = 'TP_BANCO_EXP'
      Origin = 'TPROCESSO.TP_BANCO_EXP'
      Size = 1
    end
    object qry_verif_tprocesso_CD_BANCO_EXP: TStringField
      FieldName = 'CD_BANCO_EXP'
      Origin = 'TPROCESSO.CD_BANCO_EXP'
      Size = 5
    end
    object qry_verif_tprocesso_CD_AGENTE_SEGURO: TStringField
      FieldName = 'CD_AGENTE_SEGURO'
      Origin = 'TPROCESSO.CD_AGENTE_SEGURO'
      Size = 5
    end
    object qry_verif_tprocesso_VL_COMPL_SDA: TFloatField
      FieldName = 'VL_COMPL_SDA'
      Origin = 'TPROCESSO.VL_COMPL_SDA'
    end
    object qry_verif_tprocesso_NR_DA: TStringField
      FieldName = 'NR_DA'
      Origin = 'TPROCESSO.NR_DA'
      Size = 10
    end
    object qry_verif_tprocesso_CD_CONTATO: TStringField
      FieldName = 'CD_CONTATO'
      Origin = 'TPROCESSO.CD_CONTATO'
      Size = 3
    end
    object qry_verif_tprocesso_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TPROCESSO.CD_AREA'
      Size = 2
    end
    object qry_verif_tprocesso_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'TPROCESSO.NR_MANIFESTO'
      Size = 15
    end
    object qry_verif_tprocesso_NM_CONEXAO: TStringField
      FieldName = 'NM_CONEXAO'
      Origin = 'TPROCESSO.NM_CONEXAO'
      Size = 18
    end
    object qry_verif_tprocesso_NR_PROCESSO_EXP_TEMP: TStringField
      FieldName = 'NR_PROCESSO_EXP_TEMP'
      Origin = 'TPROCESSO.NR_PROCESSO_EXP_TEMP'
      Size = 5
    end
    object qry_verif_tprocesso_DT_VENC_PROCESSO_EXP_TEMP: TDateTimeField
      FieldName = 'DT_VENC_PROCESSO_EXP_TEMP'
      Origin = 'TPROCESSO.DT_VENC_PROCESSO_EXP_TEMP'
    end
    object qry_verif_tprocesso_NR_DI_RETORNO: TStringField
      FieldName = 'NR_DI_RETORNO'
      Origin = 'TPROCESSO.NR_DI_RETORNO'
      Size = 10
    end
    object qry_verif_tprocesso_VL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      Origin = 'TPROCESSO.VL_PESO_LIQUIDO'
    end
    object qry_verif_tprocesso_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      Origin = 'TPROCESSO.VL_PESO_BRUTO'
    end
    object qry_verif_tprocesso_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TPROCESSO.CD_INCOTERM'
      Size = 3
    end
    object qry_verif_tprocesso_NR_PROCESSO_VINC: TStringField
      FieldName = 'NR_PROCESSO_VINC'
      Origin = 'TPROCESSO.NR_PROCESSO_VINC'
      Size = 14
    end
    object qry_verif_tprocesso_TP_MIC_DTA: TStringField
      FieldName = 'TP_MIC_DTA'
      Origin = 'TPROCESSO.TP_MIC_DTA'
      Size = 1
    end
    object qry_verif_tprocesso_TP_DESEMB_MIC_DTA: TStringField
      FieldName = 'TP_DESEMB_MIC_DTA'
      Origin = 'TPROCESSO.TP_DESEMB_MIC_DTA'
      Size = 1
    end
    object qry_verif_tprocesso_CD_UNID_NEG_VINC: TStringField
      FieldName = 'CD_UNID_NEG_VINC'
      Origin = 'TPROCESSO.CD_UNID_NEG_VINC'
      Size = 2
    end
    object qry_verif_tprocesso_CD_PRODUTO_VINC: TStringField
      FieldName = 'CD_PRODUTO_VINC'
      Origin = 'TPROCESSO.CD_PRODUTO_VINC'
      Size = 2
    end
    object qry_verif_tprocesso_NR_DESPACHO: TStringField
      FieldName = 'NR_DESPACHO'
      Origin = 'TPROCESSO.NR_DESPACHO'
      Size = 10
    end
    object qry_verif_tprocesso_DT_CHEGADA: TDateTimeField
      FieldName = 'DT_CHEGADA'
      Origin = 'TPROCESSO.DT_CHEGADA'
    end
    object qry_verif_tprocesso_DT_APRESENTACAO: TDateTimeField
      FieldName = 'DT_APRESENTACAO'
      Origin = 'TPROCESSO.DT_APRESENTACAO'
    end
    object qry_verif_tprocesso_DT_CRUZE: TDateTimeField
      FieldName = 'DT_CRUZE'
      Origin = 'TPROCESSO.DT_CRUZE'
    end
    object qry_verif_tprocesso_DT_SOL_NUM: TDateTimeField
      FieldName = 'DT_SOL_NUM'
      Origin = 'TPROCESSO.DT_SOL_NUM'
    end
    object qry_verif_tprocesso_DT_REC_NUM: TDateTimeField
      FieldName = 'DT_REC_NUM'
      Origin = 'TPROCESSO.DT_REC_NUM'
    end
    object qry_verif_tprocesso_DT_RECEB_DOC: TDateTimeField
      FieldName = 'DT_RECEB_DOC'
      Origin = 'TPROCESSO.DT_RECEB_DOC'
    end
    object qry_verif_tprocesso_TP_PROCESSO: TStringField
      FieldName = 'TP_PROCESSO'
      Origin = 'TPROCESSO.TP_PROCESSO'
      Size = 1
    end
    object qry_verif_tprocesso_NM_ATO_DECLARATORIO: TStringField
      FieldName = 'NM_ATO_DECLARATORIO'
      Origin = 'TPROCESSO.NM_ATO_DECLARATORIO'
      Size = 40
    end
    object qry_verif_tprocesso_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TPROCESSO.CD_DESPACHANTE'
      Size = 3
    end
    object qry_verif_tprocesso_DT_REG_DDE: TDateTimeField
      FieldName = 'DT_REG_DDE'
      Origin = 'TPROCESSO.DT_REG_DDE'
    end
    object qry_verif_tprocesso_IN_ETIQUETA: TStringField
      FieldName = 'IN_ETIQUETA'
      Origin = 'TPROCESSO.IN_ETIQUETA'
      Size = 1
    end
    object qry_verif_tprocesso_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'TPROCESSO.TP_FRETE'
      Size = 1
    end
    object qry_verif_tprocesso_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TPROCESSO.NR_FATURA'
      Size = 15
    end
    object qry_verif_tprocesso_CD_EMP_EST: TStringField
      FieldName = 'CD_EMP_EST'
      Origin = 'TPROCESSO.CD_EMP_EST'
      Size = 5
    end
    object qry_verif_tprocesso_NR_PLACA_VEICULO: TStringField
      FieldName = 'NR_PLACA_VEICULO'
      Origin = 'TPROCESSO.NR_PLACA_VEICULO'
      Size = 15
    end
    object qry_verif_tprocesso_NR_PERIODO_ARMAZENAGEM: TIntegerField
      FieldName = 'NR_PERIODO_ARMAZENAGEM'
      Origin = 'TPROCESSO.NR_PERIODO_ARMAZENAGEM'
    end
    object qry_verif_tprocesso_DT_VENCTO_ARMAZENAGEM: TDateTimeField
      FieldName = 'DT_VENCTO_ARMAZENAGEM'
      Origin = 'TPROCESSO.DT_VENCTO_ARMAZENAGEM'
    end
    object qry_verif_tprocesso_VL_FRETE_CUSTO: TFloatField
      FieldName = 'VL_FRETE_CUSTO'
      Origin = 'TPROCESSO.VL_FRETE_CUSTO'
    end
    object qry_verif_tprocesso_VL_M3: TFloatField
      FieldName = 'VL_M3'
      Origin = 'TPROCESSO.VL_M3'
    end
    object qry_verif_tprocesso_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPROCESSO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_verif_tprocesso_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPROCESSO.CD_EXPORTADOR'
      Size = 5
    end
    object qry_verif_tprocesso_IN_ENTREPOSTO: TStringField
      FieldName = 'IN_ENTREPOSTO'
      Origin = 'TPROCESSO.IN_ENTREPOSTO'
      Size = 1
    end
    object qry_verif_tprocesso_NR_PROCESSO_OR_ENTREPOSTO: TStringField
      FieldName = 'NR_PROCESSO_OR_ENTREPOSTO'
      Origin = 'TPROCESSO.NR_PROCESSO_OR_ENTREPOSTO'
      Size = 18
    end
    object qry_verif_tprocesso_CD_TRANSPORTADOR: TStringField
      FieldName = 'CD_TRANSPORTADOR'
      Origin = 'TPROCESSO.CD_TRANSPORTADOR'
      Size = 4
    end
  end
  object qry_tint_mesquita005_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM    TINT_MESQUITA005'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR')
    Params.Data = {01000100104E525F4944454E544946494341444F5200030400000000000000}
    Left = 422
    Top = 298
    object qry_tint_mesquita005_NR_IDENTIFICADOR: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
      Origin = 'TINT_MESQUITA005.NR_IDENTIFICADOR'
    end
    object qry_tint_mesquita005_NM_CNPJ: TStringField
      FieldName = 'NM_CNPJ'
      Origin = 'TINT_MESQUITA005.NM_CNPJ'
      Size = 18
    end
    object qry_tint_mesquita005_NM_NAVIO: TStringField
      FieldName = 'NM_NAVIO'
      Origin = 'TINT_MESQUITA005.NM_NAVIO'
      Size = 18
    end
    object qry_tint_mesquita005_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'TINT_MESQUITA005.NR_VIAGEM'
      Size = 12
    end
    object qry_tint_mesquita005_NR_BL: TStringField
      FieldName = 'NR_BL'
      Origin = 'TINT_MESQUITA005.NR_BL'
    end
    object qry_tint_mesquita005_NM_PORTO: TStringField
      FieldName = 'NM_PORTO'
      Origin = 'TINT_MESQUITA005.NM_PORTO'
    end
    object qry_tint_mesquita005_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      Origin = 'TINT_MESQUITA005.NM_ARMADOR'
      Size = 18
    end
    object qry_tint_mesquita005_NR_CNPJ: TStringField
      FieldName = 'NR_CNPJ'
      Origin = 'TINT_MESQUITA005.NR_CNPJ'
      Size = 18
    end
    object qry_tint_mesquita005_CH_PRESENCA: TStringField
      FieldName = 'CH_PRESENCA'
      Origin = 'TINT_MESQUITA005.CH_PRESENCA'
      Size = 36
    end
    object qry_tint_mesquita005_DT_PRESENCA: TDateTimeField
      FieldName = 'DT_PRESENCA'
      Origin = 'TINT_MESQUITA005.DT_PRESENCA'
    end
  end
  object ds_tint_mesquita005: TDataSource
    DataSet = qry_tint_mesquita005_
    Left = 48
    Top = 160
  end
  object qry_tint_mesquita009_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM    TINT_MESQUITA009'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR')
    Params.Data = {01000100104E525F4944454E544946494341444F5200030400000000000000}
    Left = 169
    Top = 232
    object qry_tint_mesquita009_NR_IDENTIFICADOR: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
      Origin = 'TINT_MESQUITA009.NR_IDENTIFICADOR'
    end
    object qry_tint_mesquita009_NM_CNPJ: TStringField
      FieldName = 'NM_CNPJ'
      Origin = 'TINT_MESQUITA009.NM_CNPJ'
      Size = 18
    end
    object qry_tint_mesquita009_NM_NAVIO: TStringField
      FieldName = 'NM_NAVIO'
      Origin = 'TINT_MESQUITA009.NM_NAVIO'
      Size = 18
    end
    object qry_tint_mesquita009_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'TINT_MESQUITA009.NR_VIAGEM'
      Size = 12
    end
    object qry_tint_mesquita009_NR_BL: TStringField
      FieldName = 'NR_BL'
      Origin = 'TINT_MESQUITA009.NR_BL'
    end
    object qry_tint_mesquita009_NM_PORTO: TStringField
      FieldName = 'NM_PORTO'
      Origin = 'TINT_MESQUITA009.NM_PORTO'
    end
    object qry_tint_mesquita009_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      Origin = 'TINT_MESQUITA009.NM_ARMADOR'
      Size = 18
    end
    object qry_tint_mesquita009_NR_CNPJ: TStringField
      FieldName = 'NR_CNPJ'
      Origin = 'TINT_MESQUITA009.NR_CNPJ'
      Size = 18
    end
    object qry_tint_mesquita009_CH_PRESENCA: TStringField
      FieldName = 'CH_PRESENCA'
      Origin = 'TINT_MESQUITA009.CH_PRESENCA'
      Size = 36
    end
    object qry_tint_mesquita009_NR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      Origin = 'TINT_MESQUITA009.NR_CNTR'
      Size = 12
    end
    object qry_tint_mesquita009_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'TINT_MESQUITA009.TP_CNTR'
      Size = 4
    end
    object qry_tint_mesquita009_DT_DESOVA: TDateTimeField
      FieldName = 'DT_DESOVA'
      Origin = 'TINT_MESQUITA009.DT_DESOVA'
    end
    object qry_tint_mesquita009_DT_CARREGAMENTO: TDateTimeField
      FieldName = 'DT_CARREGAMENTO'
      Origin = 'TINT_MESQUITA009.DT_CARREGAMENTO'
    end
    object qry_tint_mesquita009_DT_RET_FABRICA: TDateTimeField
      FieldName = 'DT_RET_FABRICA'
      Origin = 'TINT_MESQUITA009.DT_RET_FABRICA'
    end
    object qry_tint_mesquita009_DT_DEV_CNTR: TDateTimeField
      FieldName = 'DT_DEV_CNTR'
      Origin = 'TINT_MESQUITA009.DT_DEV_CNTR'
    end
    object qry_tint_mesquita009_DT_ATRACACAO: TDateTimeField
      FieldName = 'DT_ATRACACAO'
      Origin = 'TINT_MESQUITA009.DT_ATRACACAO'
    end
    object qry_tint_mesquita009_DT_PRESENCA: TDateTimeField
      FieldName = 'DT_PRESENCA'
      Origin = 'TINT_MESQUITA009.NR_IDENTIFICADOR'
    end
    object qry_tint_mesquita009_DT_ENT_FABRICA: TDateTimeField
      FieldName = 'DT_ENT_FABRICA'
      Origin = 'TINT_MESQUITA009.NM_CNPJ'
    end
    object qry_tint_mesquita009_DT_ENT_PATIO: TDateTimeField
      FieldName = 'DT_ENT_PATIO'
      Origin = 'TINT_MESQUITA009.NM_NAVIO'
    end
    object qry_tint_mesquita009_TX_OBS_AVARIA: TMemoField
      FieldName = 'TX_OBS_AVARIA'
      Origin = 'TINT_MESQUITA009.NR_VIAGEM'
      BlobType = ftMemo
    end
  end
  object ds_tint_mesquita009: TDataSource
    DataSet = qry_tint_mesquita009_
    Left = 48
    Top = 232
  end
  object qry_tprocesso_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT  *'
      'FROM    TPROCESSO_CNTR'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '      AND NR_CNTR = :NR_CNTR')
    Params.Data = {
      010002000B4E525F50524F434553534F0001020030000000074E525F434E5452
      0001020030000000}
    Left = 422
    Top = 232
    object qry_tprocesso_cntr_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_CNTR.NR_PROCESSO'
      Size = 18
    end
    object qry_tprocesso_cntr_NR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      Origin = 'TPROCESSO_CNTR.NR_CNTR'
    end
    object qry_tprocesso_cntr_DT_ENT_ARM: TDateTimeField
      FieldName = 'DT_ENT_ARM'
      Origin = 'TPROCESSO_CNTR.DT_ENT_ARM'
    end
    object qry_tprocesso_cntr_DT_DESOVA: TDateTimeField
      FieldName = 'DT_DESOVA'
      Origin = 'TPROCESSO_CNTR.DT_DESOVA'
    end
    object qry_tprocesso_cntr_DT_DEMURRAGE: TDateTimeField
      FieldName = 'DT_DEMURRAGE'
      Origin = 'TPROCESSO_CNTR.DT_DEMURRAGE'
    end
    object qry_tprocesso_cntr_IN_DESOVA: TStringField
      FieldName = 'IN_DESOVA'
      Origin = 'TPROCESSO_CNTR.IN_DESOVA'
      Size = 1
    end
    object qry_tprocesso_cntr_IN_DEMURRAGE: TStringField
      FieldName = 'IN_DEMURRAGE'
      Origin = 'TPROCESSO_CNTR.IN_DEMURRAGE'
      Size = 1
    end
    object qry_tprocesso_cntr_NR_LACRE: TStringField
      FieldName = 'NR_LACRE'
      Origin = 'TPROCESSO_CNTR.NR_LACRE'
    end
    object qry_tprocesso_cntr_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'TPROCESSO_CNTR.TP_CNTR'
      Size = 2
    end
    object qry_tprocesso_cntr_NR_FREE_TIME: TIntegerField
      FieldName = 'NR_FREE_TIME'
      Origin = 'TPROCESSO_CNTR.NR_FREE_TIME'
    end
    object qry_tprocesso_cntr_DRREG: TAutoIncField
      FieldName = 'DRREG'
      Origin = 'TPROCESSO_CNTR.DRREG'
    end
    object qry_tprocesso_cntr_IN_REPARO_CNTR: TStringField
      FieldName = 'IN_REPARO_CNTR'
      Origin = 'TPROCESSO_CNTR.IN_REPARO_CNTR'
      Size = 1
    end
    object qry_tprocesso_cntr_IN_PAGTO_EFETIVADO: TBooleanField
      FieldName = 'IN_PAGTO_EFETIVADO'
      Origin = 'TPROCESSO_CNTR.IN_PAGTO_EFETIVADO'
    end
    object qry_tprocesso_cntr_NR_CHEQUE_CAUCAO: TStringField
      FieldName = 'NR_CHEQUE_CAUCAO'
      Origin = 'TPROCESSO_CNTR.NR_CHEQUE_CAUCAO'
      Size = 7
    end
    object qry_tprocesso_cntr_VL_CHEQUE_CAUCAO: TFloatField
      FieldName = 'VL_CHEQUE_CAUCAO'
      Origin = 'TPROCESSO_CNTR.VL_CHEQUE_CAUCAO'
    end
    object qry_tprocesso_cntr_DT_EMISSAO_CNTR: TDateTimeField
      FieldName = 'DT_EMISSAO_CNTR'
      Origin = 'TPROCESSO_CNTR.DT_EMISSAO_CNTR'
    end
    object qry_tprocesso_cntr_TX_ESTUFAGEM: TStringField
      FieldName = 'TX_ESTUFAGEM'
      Origin = 'TPROCESSO_CNTR.TX_ESTUFAGEM'
      Size = 10
    end
    object qry_tprocesso_cntr_DT_DEVOLUCAO_CNTR: TDateTimeField
      FieldName = 'DT_DEVOLUCAO_CNTR'
      Origin = 'TPROCESSO_CNTR.DT_DEVOLUCAO_CNTR'
    end
    object qry_tprocesso_cntr_DT_ENT: TDateTimeField
      FieldName = 'DT_ENT'
      Origin = 'TPROCESSO_CNTR.DT_ENT'
    end
    object qry_tprocesso_cntr_TP_DIAS: TStringField
      FieldName = 'TP_DIAS'
      Origin = 'TPROCESSO_CNTR.TP_DIAS'
      Size = 1
    end
    object qry_tprocesso_cntr_CD_STATUS_CNTR: TStringField
      FieldName = 'CD_STATUS_CNTR'
      Origin = 'TPROCESSO_CNTR.CD_STATUS_CNTR'
      Size = 2
    end
    object qry_tprocesso_cntr_CD_BANCO_CAUCAO: TStringField
      FieldName = 'CD_BANCO_CAUCAO'
      Origin = 'TPROCESSO_CNTR.CD_BANCO_CAUCAO'
      Size = 3
    end
    object qry_tprocesso_cntr_DT_EMISSAO_CAUCAO: TDateTimeField
      FieldName = 'DT_EMISSAO_CAUCAO'
      Origin = 'TPROCESSO_CNTR.DT_EMISSAO_CAUCAO'
    end
    object qry_tprocesso_cntr_CD_MOEDA_DEPOSITO: TStringField
      FieldName = 'CD_MOEDA_DEPOSITO'
      Origin = 'TPROCESSO_CNTR.CD_MOEDA_DEPOSITO'
      Size = 3
    end
    object qry_tprocesso_cntr_TX_DEPOSITO: TFloatField
      FieldName = 'TX_DEPOSITO'
      Origin = 'TPROCESSO_CNTR.TX_DEPOSITO'
    end
    object qry_tprocesso_cntr_VL_DEPOSITO: TFloatField
      FieldName = 'VL_DEPOSITO'
      Origin = 'TPROCESSO_CNTR.VL_DEPOSITO'
    end
    object qry_tprocesso_cntr_IN_DEPOSITADO: TStringField
      FieldName = 'IN_DEPOSITADO'
      Origin = 'TPROCESSO_CNTR.IN_DEPOSITADO'
      Size = 1
    end
    object qry_tprocesso_cntr_IN_DEVOLVIDO: TStringField
      FieldName = 'IN_DEVOLVIDO'
      Origin = 'TPROCESSO_CNTR.IN_DEVOLVIDO'
      Size = 1
    end
    object qry_tprocesso_cntr_IN_AVARIA: TStringField
      FieldName = 'IN_AVARIA'
      Origin = 'TPROCESSO_CNTR.IN_AVARIA'
      Size = 1
    end
    object qry_tprocesso_cntr_TX_OBS_AVARIA: TMemoField
      FieldName = 'TX_OBS_AVARIA'
      Origin = 'TPROCESSO_CNTR.TX_OBS_AVARIA'
      BlobType = ftMemo
    end
    object qry_tprocesso_cntr_VL_AVARIA: TFloatField
      FieldName = 'VL_AVARIA'
      Origin = 'TPROCESSO_CNTR.VL_AVARIA'
    end
    object qry_tprocesso_cntr_IN_LAVAGEM: TStringField
      FieldName = 'IN_LAVAGEM'
      Origin = 'TPROCESSO_CNTR.IN_LAVAGEM'
      Size = 1
    end
    object qry_tprocesso_cntr_VL_LAVAGEM: TFloatField
      FieldName = 'VL_LAVAGEM'
      Origin = 'TPROCESSO_CNTR.VL_LAVAGEM'
    end
    object qry_tprocesso_cntr_DT_ENTREGA_FABRICA: TDateTimeField
      FieldName = 'DT_ENTREGA_FABRICA'
      Origin = 'TPROCESSO_CNTR.DT_ENTREGA_FABRICA'
    end
    object qry_tprocesso_cntr_DT_RET_CNTR_FABRICA: TDateTimeField
      FieldName = 'DT_RET_CNTR_FABRICA'
      Origin = 'TPROCESSO_CNTR.DT_RET_CNTR_FABRICA'
    end
    object qry_tprocesso_cntr_DT_ENTRADA_PATIO_TRANSP: TDateTimeField
      FieldName = 'DT_ENTRADA_PATIO_TRANSP'
      Origin = 'TPROCESSO_CNTR.DT_ENTRADA_PATIO_TRANSP'
    end
    object qry_tprocesso_cntr_DT_CARREGAMENTO: TDateTimeField
      FieldName = 'DT_CARREGAMENTO'
      Origin = 'TPROCESSO_CNTR.DT_CARREGAMENTO'
    end
  end
  object qry_tp_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT  *'
      'FROM    TTP_CNTR'
      'WHERE NM_TP_CNTR = :NM_TP_CNTR ')
    Params.Data = {010001000A4E4D5F54505F434E54520001020030000000}
    Left = 301
    Top = 161
    object qry_tp_cntr_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'TTP_CNTR.TP_CNTR'
      Size = 2
    end
    object qry_tp_cntr_NM_TP_CNTR: TStringField
      FieldName = 'NM_TP_CNTR'
      Origin = 'TTP_CNTR.NM_TP_CNTR'
    end
  end
  object qry_tfollowup_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT DT_REALIZACAO'
      'FROM    TFOLLOWUP'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'AND       IN_APLICAVEL = 1'
      'AND       CD_EVENTO = 162')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 301
    Top = 232
    object qry_tfollowup_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'TFOLLOWUP.DT_REALIZACAO'
    end
  end
  object qry_atz_tmesquita009_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 301
    Top = 298
  end
  object sp_integracao_mesquita: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_integracao'
    Params.Data = {
      0100030006526573756C740403040000000000000011406E725F6964656E7469
      66696361646F720103040000000000000006406964656E740203040000000000
      0000}
    Left = 48
    Top = 296
  end
  object qry_arq_integracao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM    TDIVERGENCIA'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR')
    Params.Data = {01000100104E525F4944454E544946494341444F5200030400000000000000}
    Left = 169
    Top = 295
    object qry_arq_integracao_TX_MOTIVO: TStringField
      FieldName = 'TX_MOTIVO'
      Origin = 'TDIVERGENCIA.TX_MOTIVO'
      Size = 200
    end
  end
end

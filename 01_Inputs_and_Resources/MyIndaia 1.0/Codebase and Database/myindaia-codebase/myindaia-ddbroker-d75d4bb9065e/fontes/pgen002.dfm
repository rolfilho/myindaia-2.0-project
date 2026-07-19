object datm_da: Tdatm_da
  OldCreateOrder = True
  Height = 665
  Width = 812
  object qry_processo_: TQuery
    AfterOpen = qry_processo_AfterOpen
    AfterScroll = qry_processo_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, IN_CANCELADO, IN_LI' +
        'BERADO, IN_PRODUCAO'
      'FROM   TPROCESSO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 615
    Top = 325
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 2
    end
    object qry_processo_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 1
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 1
    end
    object qry_processo_IN_PRODUCAO: TStringField
      FieldName = 'IN_PRODUCAO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 1
    end
  end
  object qry_da_: TQuery
    CachedUpdates = True
    AfterScroll = qry_da_AfterScroll
    OnCalcFields = qry_da_CalcFields
    OnPostError = qry_da_PostError
    OnUpdateError = qry_da_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TDA'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    UpdateObject = us_da
    Left = 162
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_da_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDA.NR_PROCESSO'
      Size = 18
    end
    object qry_da_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TDA.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_da_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'TDA.CD_EMBARCACAO'
      Size = 4
    end
    object qry_da_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'TDA.NR_VIAGEM'
      EditMask = '00/00;0;_'
      Size = 4
    end
    object qry_da_CD_ARMAZEM_ATRACACAO: TStringField
      FieldName = 'CD_ARMAZEM_ATRACACAO'
      Origin = 'TDA.CD_ARMAZEM_ATRACACAO'
      Size = 4
    end
    object qry_da_CD_ARMAZEM_DESCARGA: TStringField
      FieldName = 'CD_ARMAZEM_DESCARGA'
      Origin = 'TDA.CD_ARMAZEM_DESCARGA'
      Size = 4
    end
    object qry_da_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'TDA.NR_CONHECIMENTO'
      Size = 30
    end
    object qry_da_NR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      Origin = 'TDA.NR_CONHECIMENTO_MASTER'
      Size = 30
    end
    object qry_da_DT_CONHECIMENTO: TDateTimeField
      FieldName = 'DT_CONHECIMENTO'
      Origin = 'TDA.DT_CONHECIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_da_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Origin = 'TDA.CD_LOCAL_EMBARQUE'
      Size = 4
    end
    object qry_da_CD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'TDA.CD_LOCAL_DESEMBARQUE'
      Size = 4
    end
    object qry_da_IN_ENTREPOSTO: TStringField
      FieldName = 'IN_ENTREPOSTO'
      Origin = 'TDA.IN_ENTREPOSTO'
      Size = 1
    end
    object qry_da_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'TDA.CD_AGENTE'
      Size = 4
    end
    object qry_da_CD_TRANSPORTADOR: TStringField
      FieldName = 'CD_TRANSPORTADOR'
      Origin = 'TDA.CD_TRANSPORTADOR'
      Size = 4
    end
    object qry_da_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TDA.CD_INCOTERM'
      Size = 3
    end
    object qry_da_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TDA.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_da_VL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      Origin = 'TDA.VL_MLE_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_da_IN_EMBUT_FRT_ITENS: TStringField
      FieldName = 'IN_EMBUT_FRT_ITENS'
      Origin = 'TDA.IN_EMBUT_FRT_ITENS'
      Size = 1
    end
    object qry_da_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'TDA.TP_FRETE'
      Size = 1
    end
    object qry_da_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TDA.CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_da_VL_FRETE_MNEG: TFloatField
      FieldName = 'VL_FRETE_MNEG'
      Origin = 'TDA.VL_FRETE_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_da_IN_EMBUT_SEG_ITENS: TStringField
      FieldName = 'IN_EMBUT_SEG_ITENS'
      Origin = 'TDA.IN_EMBUT_SEG_ITENS'
      Size = 1
    end
    object qry_da_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'TDA.CD_MOEDA_SEGURO'
      Size = 3
    end
    object qry_da_VL_SEGURO_MNEG: TFloatField
      FieldName = 'VL_SEGURO_MNEG'
      Origin = 'TDA.VL_SEGURO_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_da_NR_DA: TStringField
      FieldName = 'NR_DA'
      Origin = 'TDA.NR_DA'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object qry_da_DT_DA: TDateTimeField
      FieldName = 'DT_DA'
      Origin = 'TDA.DT_VENCTO_DA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_da_DT_VENCTO_DA: TDateTimeField
      FieldName = 'DT_VENCTO_DA'
      Origin = 'TDA.NR_PROCESSO'
    end
    object qry_da_CD_TIPO_BASE_SEGURO: TStringField
      FieldName = 'CD_TIPO_BASE_SEGURO'
      Origin = 'TDA.TX_MERCADORIA'
      Size = 1
    end
    object qry_da_PC_SEGURO_MLE: TFloatField
      FieldName = 'PC_SEGURO_MLE'
      Origin = 'TDA.CD_EMBARCACAO'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_da_VL_MLD_MNEG: TFloatField
      FieldName = 'VL_MLD_MNEG'
      Origin = 'TDA.NR_VIAGEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_da_DT_CALCULO: TDateTimeField
      FieldName = 'DT_CALCULO'
      Origin = 'TDA.NR_PROCESSO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qry_da_TX_MLE: TFloatField
      FieldName = 'TX_MLE'
      Origin = 'TDA.TX_MERCADORIA'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_da_TX_FRETE: TFloatField
      FieldName = 'TX_FRETE'
      Origin = 'TDA.CD_EMBARCACAO'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_da_TX_SEGURO: TFloatField
      FieldName = 'TX_SEGURO'
      Origin = 'TDA.NR_VIAGEM'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_da_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
      Origin = 'TDA.CD_ARMAZEM_ATRACACAO'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_da_VL_MLE_DOLAR: TFloatField
      FieldName = 'VL_MLE_DOLAR'
      Origin = 'TDA.NR_PROCESSO'
      DisplayFormat = '#0,.00'
    end
    object qry_da_VL_MLD_DOLAR: TFloatField
      FieldName = 'VL_MLD_DOLAR'
      Origin = 'TDA.TX_MERCADORIA'
      DisplayFormat = '#0,.00'
    end
    object qry_da_LookLocalEmbarque: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookLocalEmbarque'
      Size = 50
      Calculated = True
    end
    object qry_da_LookLocalDesembarque: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookLocalDesembarque'
      Size = 50
      Calculated = True
    end
    object qry_da_LookArmazemAtracacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookArmazemAtracacao'
      Size = 50
      Calculated = True
    end
    object qry_da_LookArmazemDescarga: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookArmazemDescarga'
      Size = 50
      Calculated = True
    end
    object qry_da_LookEmbarcacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookEmbarcacao'
      Size = 40
      Calculated = True
    end
    object qry_da_LookAgente: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookAgente'
      Size = 60
      Calculated = True
    end
    object qry_da_LookTransportador: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookTransportador'
      Size = 60
      Calculated = True
    end
    object qry_da_LookMoedaMLE: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookMoedaMLE'
      Size = 30
      Calculated = True
    end
    object qry_da_LookMoedaFrete: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookMoedaFrete'
      Size = 30
      Calculated = True
    end
    object qry_da_LookMoedaSeguro: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookMoedaSeguro'
      Size = 30
      Calculated = True
    end
    object qry_da_LookTpFrete: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTpFrete'
      LookupDataSet = qry_tp_frete_
      LookupKeyFields = 'CD_TP_FRETE'
      LookupResultField = 'NM_TP_FRETE'
      KeyFields = 'TP_FRETE'
      Size = 30
      Lookup = True
    end
    object qry_da_LookIncoterm: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookIncoterm'
      Size = 3
      Calculated = True
    end
  end
  object ds_da: TDataSource
    DataSet = qry_da_
    Left = 44
    Top = 10
  end
  object qry_yes_no_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO'
      'FROM   TYES_NO')
    Left = 613
    Top = 217
    object qry_yes_no_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Origin = 'TYES_NO.CD_YESNO'
      Size = 1
    end
    object qry_yes_no_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Origin = 'TYES_NO.TX_YESNO'
      Size = 3
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG, AP_UNID_NEG '
      'FROM   TUNID_NEG'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_UNID_NEG IN ( SELECT CD_UNID_NEG'
      '                        FROM   TUSUARIO_HABILITACAO'
      '                        WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                               IN_ATIVO = '#39'1'#39' )'
      '')
    Left = 613
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO, AP_PRODUTO'
      'FROM   TPRODUTO'
      'WHERE  CD_PRODUTO = :CD_PRODUTO AND'
      '       CD_PRODUTO IN ( SELECT CD_PRODUTO'
      '                       FROM   TUSUARIO_HABILITACAO'
      '                       WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                              IN_ATIVO = '#39'1'#39' )'
      '')
    Left = 613
    Top = 65
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object qry_lista_merc_: TQuery
    AfterScroll = qry_lista_merc_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT R.CD_MERCADORIA, M.AP_MERCADORIA, SUM( ISNULL( QT_REF, 0 ' +
        ') ) AS QT_REF,'
      
        '       SUM( ISNULL( R.PL_REF, 0 ) ) AS PL_REF, MIN( MB.AP_MOEDA ' +
        ') AS AP_MOEDA,'
      
        '       SUM( ISNULL( R.VL_MLD_MNEG, 0 ) ) AS VL_MLD_MNEG, SUM( IS' +
        'NULL( R.VL_MLD_DOLAR, 0 ) ) AS VL_MLD_DOLAR'
      'FROM   TDA_REF R, TMERCADORIA M, TMOEDA_BROKER MB, TPROCESSO P'
      'WHERE  R.NR_PROCESSO = :NR_PROCESSO AND'
      '       R.CD_MERCADORIA = M.CD_MERCADORIA AND'
      '       R.CD_MOEDA_MLE *= MB.CD_MOEDA AND'
      '       R.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.IN_CANCELADO = '#39'0'#39
      'GROUP BY R.CD_MERCADORIA, M.AP_MERCADORIA')
    Left = 162
    Top = 65
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_lista_merc_CD_MERCADORIA: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_MERCADORIA'
      Size = 15
    end
    object qry_lista_merc_AP_MERCADORIA: TStringField
      DisplayLabel = 'Mercadoria'
      FieldName = 'AP_MERCADORIA'
      Size = 25
    end
    object qry_lista_merc_AP_MOEDA: TStringField
      DisplayLabel = 'Moeda'
      FieldName = 'AP_MOEDA'
      Size = 6
    end
    object qry_lista_merc_QT_REF: TIntegerField
      DisplayLabel = 'Volumes'
      FieldName = 'QT_REF'
    end
    object qry_lista_merc_VL_MLD_MNEG: TFloatField
      DisplayLabel = 'Valor Moeda'
      FieldName = 'VL_MLD_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lista_merc_VL_MLD_DOLAR: TFloatField
      DisplayLabel = 'Valor US$'
      FieldName = 'VL_MLD_DOLAR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lista_merc_PL_REF: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'PL_REF'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
  end
  object ds_lista_merc: TDataSource
    DataSet = qry_lista_merc_
    Left = 44
    Top = 65
  end
  object qry_ref_: TQuery
    CachedUpdates = True
    OnCalcFields = qry_ref_CalcFields
    OnUpdateError = qry_ref_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TDA_REF'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_REF = :NR_REF AND'
      '       CD_MERCADORIA = :CD_MERCADORIA'
      '')
    UpdateObject = us_ref
    Left = 162
    Top = 217
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_ref_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDA_REF.NR_PROCESSO'
      Size = 18
    end
    object qry_ref_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TDA_REF.NR_REF'
      Size = 15
    end
    object qry_ref_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TDA_REF.CD_MERCADORIA'
      OnChange = qry_ref_CD_MERCADORIAChange
      Size = 15
    end
    object qry_ref_IN_CERT_ANALISE: TStringField
      FieldName = 'IN_CERT_ANALISE'
      Origin = 'TDA_REF.IN_CERT_ANALISE'
      Size = 1
    end
    object qry_ref_CD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'TDA_REF.CD_UNID_MEDIDA'
      Size = 3
    end
    object qry_ref_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TDA_REF.VL_UNITARIO'
      DisplayFormat = '#0.0000000'
      EditFormat = '#0,.0000000'
    end
    object qry_ref_QT_REF: TIntegerField
      FieldName = 'QT_REF'
      Origin = 'TDA_REF.NR_PROCESSO'
      EditFormat = '#####'
    end
    object qry_ref_PL_REF: TFloatField
      FieldName = 'PL_REF'
      Origin = 'TDA_REF.NR_PROCESSO'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_ref_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TDA_REF.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_ref_VL_FRETE_MNEG: TFloatField
      FieldName = 'VL_FRETE_MNEG'
      Origin = 'TDA_REF.VL_FRETE_MNEG'
      DisplayFormat = '#0.00'
      EditFormat = '#0,.00'
    end
    object qry_ref_IN_EMBUT_FRT_ITENS: TStringField
      FieldName = 'IN_EMBUT_FRT_ITENS'
      Origin = 'TDA_REF.IN_EMBUT_FRT_ITENS'
      Size = 1
    end
    object qry_ref_VL_SEGURO_MNEG: TFloatField
      FieldName = 'VL_SEGURO_MNEG'
      Origin = 'TDA_REF.VL_SEGURO_MNEG'
      DisplayFormat = '#0.00'
      EditFormat = '#0,.00'
    end
    object qry_ref_IN_EMBUT_SEG_ITENS: TStringField
      FieldName = 'IN_EMBUT_SEG_ITENS'
      Origin = 'TDA_REF.IN_EMBUT_SEG_ITENS'
      Size = 1
    end
    object qry_ref_VL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      Origin = 'TDA_REF.VL_MLE_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ref_VL_MLE_DOLAR: TFloatField
      FieldName = 'VL_MLE_DOLAR'
      Origin = 'TDA_REF.VL_MLE_DOLAR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ref_VL_MLD_MNEG: TFloatField
      FieldName = 'VL_MLD_MNEG'
      Origin = 'TDA_REF.NR_PROCESSO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ref_VL_MLD_DOLAR: TFloatField
      FieldName = 'VL_MLD_DOLAR'
      Origin = 'TDA_REF.NR_PROCESSO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ref_TX_MLE: TFloatField
      FieldName = 'TX_MLE'
      Origin = 'TDA_REF.TX_MLE'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_ref_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
      Origin = 'TDA_REF.TX_DOLAR'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_ref_LookMercadoria: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookMercadoria'
      Size = 25
      Calculated = True
    end
    object qry_ref_LookUnidMedida: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookUnidMedida'
      Size = 50
      Calculated = True
    end
    object qry_ref_LookMoedaMLE: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookMoedaMLE'
      Size = 30
      Calculated = True
    end
    object qry_ref_NM_MERCADORIA: TMemoField
      FieldName = 'NM_MERCADORIA'
      Origin = 'TDA_REF.NR_PROCESSO'
      BlobType = ftMemo
    end
    object qry_ref_ALIQUOTA_II: TStringField
      FieldName = 'ALIQUOTA_II'
      Origin = 'TDA_REF.NR_REF'
      Size = 6
    end
    object qry_ref_ALIQUOTA_IPI: TStringField
      FieldName = 'ALIQUOTA_IPI'
      Origin = 'TDA_REF.CD_MERCADORIA'
      Size = 6
    end
  end
  object ds_ref: TDataSource
    DataSet = qry_ref_
    Left = 44
    Top = 217
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UP.CD_UNID_NEG, U.AP_UNID_NEG, UP.CD_PRODUTO, P.AP_PRODUT' +
        'O'
      'FROM   TUNID_NEG_PRODUTO UP, TUNID_NEG U, TPRODUTO P'
      'WHERE  UP.CD_UNID_NEG = U.CD_UNID_NEG AND'
      '       UP.CD_PRODUTO = P.CD_PRODUTO AND'
      '       ( UP.CD_UNID_NEG + UP.CD_PRODUTO ) IN'
      '          ( SELECT ( CD_UNID_NEG + CD_PRODUTO )'
      '            FROM   TUSUARIO_HABILITACAO'
      '            WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                   IN_ATIVO = '#39'1'#39' )'
      ''
      '')
    Left = 613
    Top = 118
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object qry_lista_ref_: TQuery
    AfterScroll = qry_lista_ref_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT R.NR_PROCESSO, R.CD_MERCADORIA, R.NR_REF, R.PL_REF, R.QT_' +
        'REF,'
      '       R.VL_MLD_MNEG, R.VL_MLD_DOLAR, MB.AP_MOEDA'
      'FROM   TDA_REF R, TMOEDA_BROKER MB'
      'WHERE  R.NR_PROCESSO = :NR_PROCESSO AND'
      '       R.CD_MERCADORIA = :CD_MERCADORIA AND'
      '       R.CD_MOEDA_MLE *= MB.CD_MOEDA')
    Left = 162
    Top = 169
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_lista_ref_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_lista_ref_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Size = 15
    end
    object qry_lista_ref_NR_REF: TStringField
      DisplayLabel = 'N'#186' Ref.'
      FieldName = 'NR_REF'
      Origin = 'TDA_REF.NR_REF'
      Size = 15
    end
    object qry_lista_ref_QT_REF: TIntegerField
      DisplayLabel = 'Volumes'
      FieldName = 'QT_REF'
    end
    object qry_lista_ref_AP_MOEDA: TStringField
      DisplayLabel = 'Moeda'
      FieldName = 'AP_MOEDA'
      Size = 6
    end
    object qry_lista_ref_PL_REF: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'PL_REF'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_lista_ref_VL_MLD_MNEG: TFloatField
      DisplayLabel = 'Valor Moeda'
      FieldName = 'VL_MLD_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lista_ref_VL_MLD_DOLAR: TFloatField
      DisplayLabel = 'Valor US$'
      FieldName = 'VL_MLD_DOLAR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object ds_lista_ref: TDataSource
    DataSet = qry_lista_ref_
    Left = 44
    Top = 169
  end
  object qry_lote_: TQuery
    CachedUpdates = True
    AfterPost = qry_lote_AfterPost
    AfterDelete = qry_lote_AfterDelete
    AfterScroll = qry_lote_AfterScroll
    OnCalcFields = qry_lote_CalcFields
    OnUpdateError = qry_lote_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TDA_LOTE'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       CD_MERCADORIA = :CD_MERCADORIA AND'
      '       NR_REF = :NR_REF AND'
      '       NR_LOTE = :NR_LOTE')
    UpdateObject = us_lote
    Left = 162
    Top = 324
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LOTE'
        ParamType = ptUnknown
      end>
    object qry_lote_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDA_LOTE.NR_PROCESSO'
      Size = 18
    end
    object qry_lote_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TDA_LOTE.NR_REF'
      Size = 15
    end
    object qry_lote_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TDA_LOTE.CD_MERCADORIA'
      Size = 15
    end
    object qry_lote_NR_LOTE: TStringField
      FieldName = 'NR_LOTE'
      Origin = 'TDA_LOTE.NR_LOTE'
      OnChange = qry_lote_NR_LOTEChange
      Size = 12
    end
    object qry_lote_QT_LOTE: TIntegerField
      FieldName = 'QT_LOTE'
      Origin = 'TDA_LOTE.NR_PROCESSO'
      OnChange = qry_lote_QT_LOTEChange
      EditFormat = '#####'
    end
    object qry_lote_DT_FABRICACAO: TDateTimeField
      FieldName = 'DT_FABRICACAO'
      Origin = 'TDA_LOTE.DT_FABRICACAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_lote_DT_VALIDADE: TDateTimeField
      FieldName = 'DT_VALIDADE'
      Origin = 'TDA_LOTE.DT_VALIDADE'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_lote_TX_AVARIA: TMemoField
      FieldName = 'TX_AVARIA'
      Origin = 'TDA_LOTE.TX_AVARIA'
      BlobType = ftMemo
    end
    object qry_lote_QT_AVARIA: TIntegerField
      FieldName = 'QT_AVARIA'
      Origin = 'TDA_LOTE.NR_PROCESSO'
      EditFormat = '#####'
    end
    object qry_lote_QT_AVARIA_LIB: TIntegerField
      FieldName = 'QT_AVARIA_LIB'
      Origin = 'TDA_LOTE.NR_REF'
      EditFormat = '#####'
    end
    object qry_lote_QT_DISPONIVEL: TIntegerField
      FieldName = 'QT_DISPONIVEL'
      Origin = 'TDA_LOTE.CD_MERCADORIA'
      EditFormat = '#####'
    end
    object qry_lote_QT_NAC: TIntegerField
      FieldName = 'QT_NAC'
      Origin = 'TDA_LOTE.NR_LOTE'
      EditFormat = '#####'
    end
    object qry_lote_QT_AG_DESEMB: TIntegerField
      FieldName = 'QT_AG_DESEMB'
      Origin = 'TDA_LOTE.QT_LOTE'
      EditFormat = '#####'
    end
    object qry_lote_QT_TRANSITO: TIntegerField
      FieldName = 'QT_TRANSITO'
      Origin = 'TDA_LOTE.VL_PESO_LIQ_UNIT'
      EditFormat = '#####'
    end
    object qry_lote_QT_AG_DESOVA: TIntegerField
      FieldName = 'QT_AG_DESOVA'
      Origin = 'TDA_LOTE.NR_PROCESSO'
      EditFormat = '#####'
    end
    object qry_lote_QT_FISICA: TIntegerField
      FieldName = 'QT_FISICA'
      Origin = 'TDA_LOTE.NR_PROCESSO'
      EditFormat = '#####'
    end
    object qry_lote_QT_AG_REGISTRO: TIntegerField
      FieldName = 'QT_AG_REGISTRO'
      Origin = 'TDA_LOTE.NR_PROCESSO'
      EditFormat = '#####'
    end
    object qry_lote_PL_UNIT: TFloatField
      FieldName = 'PL_UNIT'
      Origin = 'TDA_LOTE.NR_PROCESSO'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_lote_PL_LOTE: TFloatField
      FieldName = 'PL_LOTE'
      Origin = 'TDA_LOTE.NR_REF'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_lote_PL_AVARIA: TFloatField
      FieldName = 'PL_AVARIA'
      Origin = 'TDA_LOTE.CD_MERCADORIA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_lote_PL_AVARIA_LIB: TFloatField
      FieldName = 'PL_AVARIA_LIB'
      Origin = 'TDA_LOTE.NR_LOTE'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_lote_PL_DISPONIVEL: TFloatField
      FieldName = 'PL_DISPONIVEL'
      Origin = 'TDA_LOTE.QT_LOTE'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_lote_PL_NAC: TFloatField
      FieldName = 'PL_NAC'
      Origin = 'TDA_LOTE.PL_UNIT'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_lote_PL_AG_DESEMB: TFloatField
      FieldName = 'PL_AG_DESEMB'
      Origin = 'TDA_LOTE.PL_LOTE'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_lote_PL_AG_DESOVA: TFloatField
      FieldName = 'PL_AG_DESOVA'
      Origin = 'TDA_LOTE.DT_FABRICACAO'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_lote_PL_TRANSITO: TFloatField
      FieldName = 'PL_TRANSITO'
      Origin = 'TDA_LOTE.DT_VALIDADE'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_lote_PL_FISICA: TFloatField
      FieldName = 'PL_FISICA'
      Origin = 'TDA_LOTE.TX_AVARIA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_lote_PL_AG_REGISTRO: TFloatField
      FieldName = 'PL_AG_REGISTRO'
      Origin = 'TDA_LOTE.QT_AVARIA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_lote_IN_ETIQ_FABR: TStringField
      FieldName = 'IN_ETIQ_FABR'
      Origin = 'TDA_LOTE.NR_PROCESSO'
      Size = 1
    end
    object qry_lote_IN_ETIQ_VALID: TStringField
      FieldName = 'IN_ETIQ_VALID'
      Origin = 'TDA_LOTE.NR_REF'
      Size = 1
    end
    object qry_lote_TP_LOCAL_ETIQ_FABR: TStringField
      FieldName = 'TP_LOCAL_ETIQ_FABR'
      Origin = 'TDA_LOTE.CD_MERCADORIA'
      Size = 1
    end
    object qry_lote_TP_LOCAL_ETIQ_VALID: TStringField
      FieldName = 'TP_LOCAL_ETIQ_VALID'
      Origin = 'TDA_LOTE.NR_LOTE'
      Size = 1
    end
    object qry_lote_IN_SOLIC_ETIQ_FABR: TStringField
      FieldName = 'IN_SOLIC_ETIQ_FABR'
      Origin = 'TDA_LOTE.QT_LOTE'
      Size = 1
    end
    object qry_lote_IN_SOLIC_ETIQ_VALID: TStringField
      FieldName = 'IN_SOLIC_ETIQ_VALID'
      Origin = 'TDA_LOTE.PL_UNIT'
      Size = 1
    end
    object qry_lote_IN_REVALIDADO: TStringField
      FieldName = 'IN_REVALIDADO'
      Origin = 'TDA_LOTE.PL_LOTE'
      Size = 1
    end
    object qry_lote_DT_VALIDADE_ANT: TDateTimeField
      FieldName = 'DT_VALIDADE_ANT'
      Origin = 'TDA_LOTE.DT_FABRICACAO'
    end
    object qry_lote_LookLocalEtiqFabr: TStringField
      FieldKind = fkLookup
      FieldName = 'LookLocalEtiqFabr'
      LookupDataSet = qry_tp_local_etiq_
      LookupKeyFields = 'TP_LOCAL_ETIQ'
      LookupResultField = 'NM_LOCAL_ETIQ'
      KeyFields = 'TP_LOCAL_ETIQ_FABR'
      Lookup = True
    end
    object qry_lote_LookLocalEtiqValid: TStringField
      FieldKind = fkLookup
      FieldName = 'LookLocalEtiqValid'
      LookupDataSet = qry_tp_local_etiq_
      LookupKeyFields = 'TP_LOCAL_ETIQ'
      LookupResultField = 'NM_LOCAL_ETIQ'
      KeyFields = 'TP_LOCAL_ETIQ_VALID'
      Lookup = True
    end
    object qry_lote_PL_AVARIA_PEND: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PL_AVARIA_PEND'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
      Calculated = True
    end
  end
  object ds_lote: TDataSource
    DataSet = qry_lote_
    Left = 44
    Top = 324
  end
  object qry_lista_lote_: TQuery
    AfterScroll = qry_lista_lote_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_MERCADORIA, NR_REF, NR_LOTE, QT_LOTE, PL_' +
        'LOTE'
      'FROM   TDA_LOTE'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       CD_MERCADORIA = :CD_MERCADORIA AND'
      '       NR_REF = :NR_REF')
    Left = 162
    Top = 273
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end>
    object qry_lista_lote_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDA_LOTE.NR_PROCESSO'
      Size = 18
    end
    object qry_lista_lote_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TDA_LOTE.CD_MERCADORIA'
      Size = 15
    end
    object qry_lista_lote_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TDA_LOTE.NR_REF'
      Size = 15
    end
    object qry_lista_lote_NR_LOTE: TStringField
      DisplayLabel = 'N'#186' Lote'
      FieldName = 'NR_LOTE'
      Origin = 'TDA_LOTE.NR_LOTE'
      Size = 12
    end
    object qry_lista_lote_QT_LOTE: TIntegerField
      DisplayLabel = 'Volumes'
      FieldName = 'QT_LOTE'
      Origin = 'TDA_LOTE.NR_PROCESSO'
      EditFormat = '99999'
    end
    object qry_lista_lote_PL_LOTE: TFloatField
      DisplayLabel = 'Peso L'#237'quido'
      FieldName = 'PL_LOTE'
      Origin = 'TDA_LOTE.NR_PROCESSO'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
  end
  object ds_lista_lote: TDataSource
    DataSet = qry_lista_lote_
    Left = 44
    Top = 273
  end
  object us_da: TUpdateSQL
    ModifySQL.Strings = (
      'update TDA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  TX_MERCADORIA = :TX_MERCADORIA,'
      '  CD_EMBARCACAO = :CD_EMBARCACAO,'
      '  NR_VIAGEM = :NR_VIAGEM,'
      '  CD_ARMAZEM_ATRACACAO = :CD_ARMAZEM_ATRACACAO,'
      '  CD_ARMAZEM_DESCARGA = :CD_ARMAZEM_DESCARGA,'
      '  NR_CONHECIMENTO = :NR_CONHECIMENTO,'
      '  NR_CONHECIMENTO_MASTER = :NR_CONHECIMENTO_MASTER,'
      '  DT_CONHECIMENTO = :DT_CONHECIMENTO,'
      '  CD_LOCAL_EMBARQUE = :CD_LOCAL_EMBARQUE,'
      '  CD_LOCAL_DESEMBARQUE = :CD_LOCAL_DESEMBARQUE,'
      '  IN_ENTREPOSTO = :IN_ENTREPOSTO,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  CD_TRANSPORTADOR = :CD_TRANSPORTADOR,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  CD_MOEDA_MLE = :CD_MOEDA_MLE,'
      '  VL_MLE_MNEG = :VL_MLE_MNEG,'
      '  VL_MLE_DOLAR = :VL_MLE_DOLAR,'
      '  IN_EMBUT_FRT_ITENS = :IN_EMBUT_FRT_ITENS,'
      '  TP_FRETE = :TP_FRETE,'
      '  CD_MOEDA_FRETE = :CD_MOEDA_FRETE,'
      '  VL_FRETE_MNEG = :VL_FRETE_MNEG,'
      '  IN_EMBUT_SEG_ITENS = :IN_EMBUT_SEG_ITENS,'
      '  CD_MOEDA_SEGURO = :CD_MOEDA_SEGURO,'
      '  VL_SEGURO_MNEG = :VL_SEGURO_MNEG,'
      '  NR_DA = :NR_DA,'
      '  DT_DA = :DT_DA,'
      '  DT_VENCTO_DA = :DT_VENCTO_DA,'
      '  DT_CALCULO = :DT_CALCULO,'
      '  CD_TIPO_BASE_SEGURO = :CD_TIPO_BASE_SEGURO,'
      '  PC_SEGURO_MLE = :PC_SEGURO_MLE,'
      '  VL_MLD_MNEG = :VL_MLD_MNEG,'
      '  VL_MLD_DOLAR = :VL_MLD_DOLAR,'
      '  TX_MLE = :TX_MLE,'
      '  TX_FRETE = :TX_FRETE,'
      '  TX_SEGURO = :TX_SEGURO,'
      '  TX_DOLAR = :TX_DOLAR'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TDA'
      
        '  (NR_PROCESSO, TX_MERCADORIA, CD_EMBARCACAO, NR_VIAGEM, CD_ARMA' +
        'ZEM_ATRACACAO, '
      
        '   CD_ARMAZEM_DESCARGA, NR_CONHECIMENTO, NR_CONHECIMENTO_MASTER,' +
        ' DT_CONHECIMENTO, '
      
        '   CD_LOCAL_EMBARQUE, CD_LOCAL_DESEMBARQUE, IN_ENTREPOSTO, CD_AG' +
        'ENTE, CD_TRANSPORTADOR, '
      
        '   CD_INCOTERM, CD_MOEDA_MLE, VL_MLE_MNEG, VL_MLE_DOLAR, IN_EMBU' +
        'T_FRT_ITENS, '
      
        '   TP_FRETE, CD_MOEDA_FRETE, VL_FRETE_MNEG, IN_EMBUT_SEG_ITENS, ' +
        'CD_MOEDA_SEGURO, '
      
        '   VL_SEGURO_MNEG, NR_DA, DT_DA, DT_VENCTO_DA, DT_CALCULO, CD_TI' +
        'PO_BASE_SEGURO, '
      
        '   PC_SEGURO_MLE, VL_MLD_MNEG, VL_MLD_DOLAR, TX_MLE, TX_FRETE, T' +
        'X_SEGURO, '
      '   TX_DOLAR)'
      'values'
      
        '  (:NR_PROCESSO, :TX_MERCADORIA, :CD_EMBARCACAO, :NR_VIAGEM, :CD' +
        '_ARMAZEM_ATRACACAO, '
      
        '   :CD_ARMAZEM_DESCARGA, :NR_CONHECIMENTO, :NR_CONHECIMENTO_MAST' +
        'ER, :DT_CONHECIMENTO, '
      
        '   :CD_LOCAL_EMBARQUE, :CD_LOCAL_DESEMBARQUE, :IN_ENTREPOSTO, :C' +
        'D_AGENTE, '
      
        '   :CD_TRANSPORTADOR, :CD_INCOTERM, :CD_MOEDA_MLE, :VL_MLE_MNEG,' +
        ' :VL_MLE_DOLAR, '
      
        '   :IN_EMBUT_FRT_ITENS, :TP_FRETE, :CD_MOEDA_FRETE, :VL_FRETE_MN' +
        'EG, :IN_EMBUT_SEG_ITENS, '
      
        '   :CD_MOEDA_SEGURO, :VL_SEGURO_MNEG, :NR_DA, :DT_DA, :DT_VENCTO' +
        '_DA, :DT_CALCULO, '
      
        '   :CD_TIPO_BASE_SEGURO, :PC_SEGURO_MLE, :VL_MLD_MNEG, :VL_MLD_D' +
        'OLAR, :TX_MLE, '
      '   :TX_FRETE, :TX_SEGURO, :TX_DOLAR)')
    DeleteSQL.Strings = (
      'delete from TDA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 281
    Top = 10
  end
  object us_ref: TUpdateSQL
    ModifySQL.Strings = (
      'update TDA_REF'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_REF = :NR_REF,'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  IN_CERT_ANALISE = :IN_CERT_ANALISE,'
      '  QT_REF = :QT_REF,'
      '  PL_REF = :PL_REF,'
      '  CD_UNID_MEDIDA = :CD_UNID_MEDIDA,'
      '  VL_UNITARIO = :VL_UNITARIO,'
      '  CD_MOEDA_MLE = :CD_MOEDA_MLE,'
      '  VL_FRETE_MNEG = :VL_FRETE_MNEG,'
      '  IN_EMBUT_FRT_ITENS = :IN_EMBUT_FRT_ITENS,'
      '  VL_SEGURO_MNEG = :VL_SEGURO_MNEG,'
      '  IN_EMBUT_SEG_ITENS = :IN_EMBUT_SEG_ITENS,'
      '  VL_MLE_MNEG = :VL_MLE_MNEG,'
      '  VL_MLE_DOLAR = :VL_MLE_DOLAR,'
      '  TX_MLE = :TX_MLE,'
      '  TX_DOLAR = :TX_DOLAR,'
      '  VL_MLD_MNEG = :VL_MLD_MNEG,'
      '  VL_MLD_DOLAR = :VL_MLD_DOLAR,'
      '  ALIQUOTA_II = :ALIQUOTA_II,'
      '  ALIQUOTA_IPI = :ALIQUOTA_IPI,'
      '  NM_MERCADORIA = :NM_MERCADORIA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_REF = :OLD_NR_REF and'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA')
    InsertSQL.Strings = (
      'insert into TDA_REF'
      
        '  (NR_PROCESSO, NR_REF, CD_MERCADORIA, IN_CERT_ANALISE, QT_REF, ' +
        'PL_REF, '
      
        '   CD_UNID_MEDIDA, VL_UNITARIO, CD_MOEDA_MLE, VL_FRETE_MNEG, IN_' +
        'EMBUT_FRT_ITENS, '
      
        '   VL_SEGURO_MNEG, IN_EMBUT_SEG_ITENS, VL_MLE_MNEG, VL_MLE_DOLAR' +
        ', TX_MLE, '
      
        '   TX_DOLAR, VL_MLD_MNEG, VL_MLD_DOLAR, ALIQUOTA_II, ALIQUOTA_IP' +
        'I, NM_MERCADORIA)'
      'values'
      
        '  (:NR_PROCESSO, :NR_REF, :CD_MERCADORIA, :IN_CERT_ANALISE, :QT_' +
        'REF, :PL_REF, '
      
        '   :CD_UNID_MEDIDA, :VL_UNITARIO, :CD_MOEDA_MLE, :VL_FRETE_MNEG,' +
        ' :IN_EMBUT_FRT_ITENS, '
      
        '   :VL_SEGURO_MNEG, :IN_EMBUT_SEG_ITENS, :VL_MLE_MNEG, :VL_MLE_D' +
        'OLAR, :TX_MLE, '
      
        '   :TX_DOLAR, :VL_MLD_MNEG, :VL_MLD_DOLAR, :ALIQUOTA_II, :ALIQUO' +
        'TA_IPI, '
      '   :NM_MERCADORIA)')
    DeleteSQL.Strings = (
      'delete from TDA_REF'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_REF = :OLD_NR_REF and'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA')
    Left = 281
    Top = 217
  end
  object us_lote: TUpdateSQL
    ModifySQL.Strings = (
      'update TDA_LOTE'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_REF = :NR_REF,'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  NR_LOTE = :NR_LOTE,'
      '  QT_LOTE = :QT_LOTE,'
      '  PL_UNIT = :PL_UNIT,'
      '  PL_LOTE = :PL_LOTE,'
      '  DT_FABRICACAO = :DT_FABRICACAO,'
      '  DT_VALIDADE = :DT_VALIDADE,'
      '  TX_AVARIA = :TX_AVARIA,'
      '  QT_AVARIA = :QT_AVARIA,'
      '  QT_AVARIA_LIB = :QT_AVARIA_LIB,'
      '  QT_DISPONIVEL = :QT_DISPONIVEL,'
      '  QT_NAC = :QT_NAC,'
      '  QT_AG_DESEMB = :QT_AG_DESEMB,'
      '  QT_TRANSITO = :QT_TRANSITO,'
      '  QT_AG_DESOVA = :QT_AG_DESOVA,'
      '  QT_FISICA = :QT_FISICA,'
      '  QT_AG_REGISTRO = :QT_AG_REGISTRO,'
      '  PL_AVARIA = :PL_AVARIA,'
      '  PL_AVARIA_LIB = :PL_AVARIA_LIB,'
      '  PL_DISPONIVEL = :PL_DISPONIVEL,'
      '  PL_NAC = :PL_NAC,'
      '  PL_AG_DESEMB = :PL_AG_DESEMB,'
      '  PL_AG_DESOVA = :PL_AG_DESOVA,'
      '  PL_TRANSITO = :PL_TRANSITO,'
      '  PL_FISICA = :PL_FISICA,'
      '  PL_AG_REGISTRO = :PL_AG_REGISTRO,'
      '  IN_ETIQ_FABR = :IN_ETIQ_FABR,'
      '  IN_ETIQ_VALID = :IN_ETIQ_VALID,'
      '  TP_LOCAL_ETIQ_FABR = :TP_LOCAL_ETIQ_FABR,'
      '  TP_LOCAL_ETIQ_VALID = :TP_LOCAL_ETIQ_VALID,'
      '  IN_SOLIC_ETIQ_FABR = :IN_SOLIC_ETIQ_FABR,'
      '  IN_SOLIC_ETIQ_VALID = :IN_SOLIC_ETIQ_VALID,'
      '  IN_REVALIDADO = :IN_REVALIDADO,'
      '  DT_VALIDADE_ANT = :DT_VALIDADE_ANT'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_REF = :OLD_NR_REF and'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LOTE = :OLD_NR_LOTE')
    InsertSQL.Strings = (
      'insert into TDA_LOTE'
      
        '  (NR_PROCESSO, NR_REF, CD_MERCADORIA, NR_LOTE, QT_LOTE, PL_UNIT' +
        ', PL_LOTE, '
      
        '   DT_FABRICACAO, DT_VALIDADE, TX_AVARIA, QT_AVARIA, QT_AVARIA_L' +
        'IB, QT_DISPONIVEL, '
      
        '   QT_NAC, QT_AG_DESEMB, QT_TRANSITO, QT_AG_DESOVA, QT_FISICA, Q' +
        'T_AG_REGISTRO, '
      
        '   PL_AVARIA, PL_AVARIA_LIB, PL_DISPONIVEL, PL_NAC, PL_AG_DESEMB' +
        ', PL_AG_DESOVA, '
      
        '   PL_TRANSITO, PL_FISICA, PL_AG_REGISTRO, IN_ETIQ_FABR, IN_ETIQ' +
        '_VALID, '
      
        '   TP_LOCAL_ETIQ_FABR, TP_LOCAL_ETIQ_VALID, IN_SOLIC_ETIQ_FABR, ' +
        'IN_SOLIC_ETIQ_VALID, '
      '   IN_REVALIDADO, DT_VALIDADE_ANT)'
      'values'
      
        '  (:NR_PROCESSO, :NR_REF, :CD_MERCADORIA, :NR_LOTE, :QT_LOTE, :P' +
        'L_UNIT, '
      
        '   :PL_LOTE, :DT_FABRICACAO, :DT_VALIDADE, :TX_AVARIA, :QT_AVARI' +
        'A, :QT_AVARIA_LIB, '
      
        '   :QT_DISPONIVEL, :QT_NAC, :QT_AG_DESEMB, :QT_TRANSITO, :QT_AG_' +
        'DESOVA, '
      
        '   :QT_FISICA, :QT_AG_REGISTRO, :PL_AVARIA, :PL_AVARIA_LIB, :PL_' +
        'DISPONIVEL, '
      
        '   :PL_NAC, :PL_AG_DESEMB, :PL_AG_DESOVA, :PL_TRANSITO, :PL_FISI' +
        'CA, :PL_AG_REGISTRO, '
      
        '   :IN_ETIQ_FABR, :IN_ETIQ_VALID, :TP_LOCAL_ETIQ_FABR, :TP_LOCAL' +
        '_ETIQ_VALID, '
      
        '   :IN_SOLIC_ETIQ_FABR, :IN_SOLIC_ETIQ_VALID, :IN_REVALIDADO, :D' +
        'T_VALIDADE_ANT)')
    DeleteSQL.Strings = (
      'delete from TDA_LOTE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_REF = :OLD_NR_REF and'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LOTE = :OLD_NR_LOTE')
    Left = 281
    Top = 324
  end
  object qry_merc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT M.CD_MERCADORIA, M.AP_MERCADORIA, M.CD_AREA, A.NM_AREA, M' +
        '.CD_PROPRIETARIO,'
      
        '       M.CD_MATERIAL, P.NM_PROPRIETARIO, M.CD_EMBALAGEM_SCX, B.D' +
        'ESCRICAO AS NM_EMBALAGEM,'
      
        '       M.PL_MERCADORIA, M.CD_UN_MED_COMERC, M.NM_MERCADORIA, N.A' +
        'LIQUOTA_II, N.ALIQUOTA_IPI'
      
        'FROM   TMERCADORIA M, TAREA A, TPROPRIETARIO_MERC P, TTP_EMBALAG' +
        'EM B, TNCM AS N'
      'WHERE  M.CD_AREA *= A.CD_AREA AND'
      '       M.CD_PROPRIETARIO *= P.CD_PROPRIETARIO AND'
      '       M.CD_EMBALAGEM_SCX *= B.CODIGO AND'
      '       M.CD_NCM_SH *= N.CODIGO AND'
      '       M.CD_MERCADORIA = :CD_MERCADORIA'
      '')
    Left = 162
    Top = 118
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_merc_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Size = 15
    end
    object qry_merc_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      Size = 25
    end
    object qry_merc_CD_MATERIAL: TStringField
      FieldName = 'CD_MATERIAL'
      Size = 10
    end
    object qry_merc_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Size = 2
    end
    object qry_merc_NM_AREA: TStringField
      FieldName = 'NM_AREA'
      Size = 50
    end
    object qry_merc_CD_PROPRIETARIO: TStringField
      FieldName = 'CD_PROPRIETARIO'
      Size = 3
    end
    object qry_merc_NM_PROPRIETARIO: TStringField
      FieldName = 'NM_PROPRIETARIO'
      Size = 50
    end
    object qry_merc_CD_EMBALAGEM_SCX: TStringField
      FieldName = 'CD_EMBALAGEM_SCX'
      Size = 2
    end
    object qry_merc_NM_EMBALAGEM: TStringField
      FieldName = 'NM_EMBALAGEM'
      Size = 120
    end
    object qry_merc_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_merc_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Size = 3
    end
    object qry_merc_NM_MERCADORIA: TMemoField
      FieldName = 'NM_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_merc_ALIQUOTA_II: TStringField
      FieldName = 'ALIQUOTA_II'
      Size = 6
    end
    object qry_merc_ALIQUOTA_IPI: TStringField
      FieldName = 'ALIQUOTA_IPI'
      Size = 6
    end
  end
  object ds_merc: TDataSource
    DataSet = qry_merc_
    Left = 44
    Top = 118
  end
  object qry_da_vencto_: TQuery
    CachedUpdates = True
    OnUpdateError = qry_da_vencto_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TDA_VENCTO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       DT_VENCTO_DA = :DT_VENCTO_DA')
    UpdateObject = us_da_vencto
    Left = 162
    Top = 524
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_VENCTO_DA'
        ParamType = ptUnknown
      end>
    object qry_da_vencto_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDA_VENCTO.NR_PROCESSO'
      Size = 18
    end
    object qry_da_vencto_DT_VENCTO_DA: TDateTimeField
      FieldName = 'DT_VENCTO_DA'
      Origin = 'TDA_VENCTO.DT_VENCTO_DA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_da_vencto_NR_PROTOCOLO: TStringField
      FieldName = 'NR_PROTOCOLO'
      Origin = 'TDA_VENCTO.NR_PROTOCOLO'
    end
    object qry_da_vencto_DT_PROTOCOLO: TDateTimeField
      FieldName = 'DT_PROTOCOLO'
      Origin = 'TDA_VENCTO.DT_PROTOCOLO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_da_vencto_DT_DEFERIMENTO: TDateTimeField
      FieldName = 'DT_DEFERIMENTO'
      Origin = 'TDA_VENCTO.DT_DEFERIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
  end
  object ds_da_vencto: TDataSource
    DataSet = qry_da_vencto_
    Left = 44
    Top = 524
  end
  object us_da_vencto: TUpdateSQL
    ModifySQL.Strings = (
      'update TDA_VENCTO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  DT_VENCTO_DA = :DT_VENCTO_DA,'
      '  NR_PROTOCOLO = :NR_PROTOCOLO,'
      '  DT_PROTOCOLO = :DT_PROTOCOLO,'
      '  DT_DEFERIMENTO = :DT_DEFERIMENTO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  DT_VENCTO_DA = :OLD_DT_VENCTO_DA')
    InsertSQL.Strings = (
      'insert into TDA_VENCTO'
      
        '  (NR_PROCESSO, DT_VENCTO_DA, NR_PROTOCOLO, DT_PROTOCOLO, DT_DEF' +
        'ERIMENTO)'
      'values'
      
        '  (:NR_PROCESSO, :DT_VENCTO_DA, :NR_PROTOCOLO, :DT_PROTOCOLO, :D' +
        'T_DEFERIMENTO)')
    DeleteSQL.Strings = (
      'delete from TDA_VENCTO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  DT_VENCTO_DA = :OLD_DT_VENCTO_DA')
    Left = 281
    Top = 524
  end
  object qry_lista_da_vencto_: TQuery
    CachedUpdates = True
    AfterScroll = qry_lista_da_vencto_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TDA_VENCTO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY DT_VENCTO_DA DESC')
    Left = 162
    Top = 474
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_lista_da_vencto_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDA_VENCTO.NR_PROCESSO'
      Size = 18
    end
    object qry_lista_da_vencto_DT_VENCTO_DA: TDateTimeField
      DisplayLabel = 'Dt. Vencimento'
      FieldName = 'DT_VENCTO_DA'
      Origin = 'TDA_VENCTO.DT_VENCTO_DA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qry_lista_da_vencto_NR_PROTOCOLO: TStringField
      DisplayLabel = 'N'#186' Protocolo'
      FieldName = 'NR_PROTOCOLO'
      Origin = 'TDA_VENCTO.NR_PROTOCOLO'
    end
    object qry_lista_da_vencto_DT_PROTOCOLO: TDateTimeField
      DisplayLabel = 'Dt. Protocolo'
      FieldName = 'DT_PROTOCOLO'
      Origin = 'TDA_VENCTO.DT_PROTOCOLO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qry_lista_da_vencto_DT_DEFERIMENTO: TDateTimeField
      DisplayLabel = 'Dt. Deferimento'
      FieldName = 'DT_DEFERIMENTO'
      Origin = 'TDA_VENCTO.DT_DEFERIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
  object ds_lista_da_vencto: TDataSource
    DataSet = qry_lista_da_vencto_
    Left = 44
    Top = 474
  end
  object qry_da_lib_avaria_: TQuery
    CachedUpdates = True
    OnCalcFields = qry_da_lib_avaria_CalcFields
    OnUpdateError = qry_da_lib_avaria_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TDA_LIB_AVARIA'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_REF = :NR_REF AND'
      '       CD_MERCADORIA = :CD_MERCADORIA AND'
      '       NR_LOTE = :NR_LOTE AND'
      '       DT_LIB = :DT_LIB')
    UpdateObject = us_da_lib_avaria
    Left = 162
    Top = 424
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_LIB'
        ParamType = ptUnknown
      end>
    object qry_da_lib_avaria_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDA_LIB_AVARIA.NR_PROCESSO'
      Size = 18
    end
    object qry_da_lib_avaria_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TDA_LIB_AVARIA.NR_REF'
      Size = 15
    end
    object qry_da_lib_avaria_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TDA_LIB_AVARIA.CD_MERCADORIA'
      Size = 15
    end
    object qry_da_lib_avaria_NR_LOTE: TStringField
      FieldName = 'NR_LOTE'
      Origin = 'TDA_LIB_AVARIA.NR_LOTE'
      Size = 12
    end
    object qry_da_lib_avaria_DT_LIB: TDateTimeField
      FieldName = 'DT_LIB'
      Origin = 'TDA_LIB_AVARIA.DT_LIB'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_da_lib_avaria_QT_LIB: TIntegerField
      FieldName = 'QT_LIB'
      Origin = 'TDA_LIB_AVARIA.QT_LIB'
      EditFormat = '#####'
    end
    object qry_da_lib_avaria_PL_LIB: TFloatField
      DisplayLabel = 'Peso L'#237'q Avaria'
      FieldName = 'PL_LIB'
      Origin = 'TDA_LIB_AVARIA.NR_PROCESSO'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_da_lib_avaria_CD_USUARIO_LIB: TStringField
      FieldName = 'CD_USUARIO_LIB'
      Origin = 'TDA_LIB_AVARIA.CD_USUARIO_LIB'
      Size = 4
    end
    object qry_da_lib_avaria_TX_MOTIVO_LIB: TMemoField
      FieldName = 'TX_MOTIVO_LIB'
      Origin = 'TDA_LIB_AVARIA.TX_MOTIVO_LIB'
      BlobType = ftMemo
    end
    object qry_da_lib_avaria_LookUsuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookUsuario'
      Size = 60
      Calculated = True
    end
  end
  object ds_da_lib_avaria: TDataSource
    DataSet = qry_da_lib_avaria_
    Left = 44
    Top = 424
  end
  object us_da_lib_avaria: TUpdateSQL
    ModifySQL.Strings = (
      'update TDA_LIB_AVARIA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_REF = :NR_REF,'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  NR_LOTE = :NR_LOTE,'
      '  DT_LIB = :DT_LIB,'
      '  QT_LIB = :QT_LIB,'
      '  PL_LIB = :PL_LIB,'
      '  CD_USUARIO_LIB = :CD_USUARIO_LIB,'
      '  TX_MOTIVO_LIB = :TX_MOTIVO_LIB'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_REF = :OLD_NR_REF and'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LOTE = :OLD_NR_LOTE and'
      '  DT_LIB = :OLD_DT_LIB')
    InsertSQL.Strings = (
      'insert into TDA_LIB_AVARIA'
      
        '  (NR_PROCESSO, NR_REF, CD_MERCADORIA, NR_LOTE, DT_LIB, QT_LIB, ' +
        'PL_LIB, '
      '   CD_USUARIO_LIB, TX_MOTIVO_LIB)'
      'values'
      
        '  (:NR_PROCESSO, :NR_REF, :CD_MERCADORIA, :NR_LOTE, :DT_LIB, :QT' +
        '_LIB, :PL_LIB, '
      '   :CD_USUARIO_LIB, :TX_MOTIVO_LIB)')
    DeleteSQL.Strings = (
      'delete from TDA_LIB_AVARIA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_REF = :OLD_NR_REF and'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LOTE = :OLD_NR_LOTE and'
      '  DT_LIB = :OLD_DT_LIB')
    Left = 281
    Top = 424
  end
  object qry_lista_da_lib_avaria_: TQuery
    CachedUpdates = True
    AfterScroll = qry_lista_da_lib_avaria_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT L.NR_PROCESSO, L.CD_MERCADORIA, L.NR_REF, L.NR_LOTE, L.DT' +
        '_LIB, L.QT_LIB,'
      '       L.CD_USUARIO_LIB, U.NM_USUARIO, L.PL_LIB'
      'FROM   TDA_LIB_AVARIA L, TUSUARIO U'
      'WHERE  L.CD_USUARIO_LIB *= U.CD_USUARIO AND'
      '       L.NR_PROCESSO = :NR_PROCESSO AND'
      '       L.NR_REF = :NR_REF AND'
      '       L.CD_MERCADORIA = :CD_MERCADORIA AND'
      '       L.NR_LOTE = :NR_LOTE'
      'ORDER BY L.DT_LIB DESC')
    Left = 162
    Top = 374
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LOTE'
        ParamType = ptUnknown
      end>
    object qry_lista_da_lib_avaria_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_lista_da_lib_avaria_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Size = 15
    end
    object qry_lista_da_lib_avaria_NR_REF: TStringField
      FieldName = 'NR_REF'
      Size = 15
    end
    object qry_lista_da_lib_avaria_NR_LOTE: TStringField
      FieldName = 'NR_LOTE'
      Size = 12
    end
    object qry_lista_da_lib_avaria_DT_LIB: TDateTimeField
      DisplayLabel = 'Dt. Libera'#231#227'o'
      FieldName = 'DT_LIB'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '00/00/0000;1;_'
    end
    object qry_lista_da_lib_avaria_QT_LIB: TIntegerField
      DisplayLabel = 'Volumes Lib.'
      FieldName = 'QT_LIB'
      EditFormat = '99999'
    end
    object qry_lista_da_lib_avaria_PL_LIB: TFloatField
      DisplayLabel = 'Peso L'#237'q. Avaria'
      FieldName = 'PL_LIB'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_lista_da_lib_avaria_CD_USUARIO_LIB: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_USUARIO_LIB'
      Size = 4
    end
    object qry_lista_da_lib_avaria_NM_USUARIO: TStringField
      DisplayLabel = 'Liberador'
      FieldName = 'NM_USUARIO'
      Size = 50
    end
  end
  object ds_lista_da_lib_avaria: TDataSource
    DataSet = qry_lista_da_lib_avaria_
    Left = 44
    Top = 374
  end
  object qry_local_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO AS CD_LOCAL, DESCRICAO AS NM_LOCAL'
      'FROM   TLOCAL_EMBARQUE'
      'WHERE  CODIGO = :CD_LOCAL')
    Left = 499
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_LOCAL'
        ParamType = ptUnknown
      end>
  end
  object qry_armazem_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ARMAZEM, NM_ARMAZEM'
      'FROM   TARMAZEM'
      'WHERE  CD_ARMAZEM = :CD_ARMAZEM')
    Left = 499
    Top = 65
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
      end>
  end
  object qry_embarcacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMBARCACAO, NM_EMBARCACAO'
      'FROM   TEMBARCACAO'
      'WHERE  CD_EMBARCACAO = :CD_EMBARCACAO')
    Left = 499
    Top = 118
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMBARCACAO'
        ParamType = ptUnknown
      end>
  end
  object qry_viagem_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT NR_VIAGEM, CD_ARMAZEM_ATRACACAO'
      'FROM   TVIAGEM'
      'WHERE  CD_UNID_NEG   = :CD_UNID_NEG AND'
      '       CD_PRODUTO    = :CD_PRODUTO AND'
      '       CD_EMBARCACAO = :CD_EMBARCACAO AND'
      '       NR_VIAGEM     = :NR_VIAGEM'
      '')
    Left = 499
    Top = 169
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EMBARCACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_VIAGEM'
        ParamType = ptUnknown
      end>
  end
  object qry_incoterm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO AS CD_INCOTERM, DESCRICAO AS NM_INCOTERM'
      'FROM   TINCOTERMS_VENDA'
      'WHERE  CODIGO = :CD_INCOTERM')
    Left = 499
    Top = 217
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_INCOTERM'
        ParamType = ptUnknown
      end>
  end
  object qry_agente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_AGENTE, NM_AGENTE'
      'FROM   TAGENTE'
      'WHERE  CD_AGENTE = :CD_AGENTE')
    Left = 499
    Top = 273
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_AGENTE'
        ParamType = ptUnknown
      end>
  end
  object qry_transp_itl_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CODIGO AS CD_TRANSP_ITL, DESCRICAO AS NM_TRANSP_ITL'
      'FROM   TTRANSPORTADOR_ITL'
      'WHERE  CODIGO = :CD_TRANSP_ITL')
    Left = 499
    Top = 324
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_TRANSP_ITL'
        ParamType = ptUnknown
      end>
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_MOEDA, AP_MOEDA'
      'FROM   TMOEDA_BROKER'
      'WHERE  CD_MOEDA = :CD_MOEDA')
    Left = 499
    Top = 374
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MOEDA'
        ParamType = ptUnknown
      end>
  end
  object qry_tp_frete_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CODIGO CD_TP_FRETE, DESCRICAO NM_TP_FRETE'
      'FROM   TTP_FRETE')
    Left = 499
    Top = 424
    object qry_tp_frete_CD_TP_FRETE: TStringField
      FieldName = 'CD_TP_FRETE'
      Origin = 'TTP_FRETE.CODIGO'
      Size = 1
    end
    object qry_tp_frete_NM_TP_FRETE: TStringField
      FieldName = 'NM_TP_FRETE'
      Origin = 'TTP_FRETE.DESCRICAO'
      Size = 30
    end
  end
  object qry_mercadoria_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_MERCADORIA, AP_MERCADORIA'
      'FROM   TMERCADORIA'
      'WHERE  CD_MERCADORIA = :CD_MERCADORIA')
    Left = 499
    Top = 474
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
  end
  object qry_unid_medida_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_UNID_MEDIDA, NM_UNID_MEDIDA'
      'FROM   TUNID_MEDIDA_BROKER'
      'WHERE  CD_UNID_MEDIDA = :CD_UNID_MEDIDA')
    Left = 499
    Top = 524
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_MEDIDA'
        ParamType = ptUnknown
      end>
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO'
      'FROM   TUSUARIO'
      'WHERE  CD_USUARIO = :CD_USUARIO')
    Left = 613
    Top = 169
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object qry_tp_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM   TTP_FRETE')
    Left = 613
    Top = 273
    object qry_tp_cntr_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TTP_FRETE.CODIGO'
      Size = 1
    end
    object qry_tp_cntr_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTP_FRETE.DESCRICAO'
      Size = 30
    end
  end
  object qry_tot_merc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( SUM( ISNULL( R.PL_REF, 0 ) ), 0 ) AS PL_REF,'
      
        '       ISNULL( SUM( ISNULL( R.QT_REF, 0 ) ), 0 ) AS VL_TOT_QT_RE' +
        'F,'
      
        '       ISNULL( SUM( ISNULL( R.VL_MLD_DOLAR, 0 ) ), 0 ) AS VL_TOT' +
        '_MLD_DOLAR'
      'FROM   TDA_REF R, TPROCESSO P'
      'WHERE  R.NR_PROCESSO = :NR_PROCESSO AND'
      '       R.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.IN_CANCELADO = '#39'0'#39)
    Left = 393
    Top = 65
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_tot_merc_VL_TOT_QT_REF: TIntegerField
      FieldName = 'VL_TOT_QT_REF'
    end
    object qry_tot_merc_VL_TOT_MLD_DOLAR: TFloatField
      FieldName = 'VL_TOT_MLD_DOLAR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tot_merc_PL_REF: TFloatField
      FieldName = 'PL_REF'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
  end
  object qry_tot_ref_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( SUM( ISNULL( PL_REF, 0 ) ), 0 ) AS PL_REF,'
      '       ISNULL( SUM( ISNULL( QT_REF, 0 ) ), 0 ) AS VL_TOT_REF,'
      
        '       ISNULL( SUM( ISNULL( VL_MLD_DOLAR, 0 ) ), 0 ) AS VL_TOT_M' +
        'LD_DOLAR'
      'FROM   TDA_REF'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       CD_MERCADORIA = :CD_MERCADORIA')
    Left = 393
    Top = 169
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_tot_ref_VL_TOT_REF: TIntegerField
      FieldName = 'VL_TOT_REF'
    end
    object qry_tot_ref_VL_TOT_MLD_DOLAR: TFloatField
      FieldName = 'VL_TOT_MLD_DOLAR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tot_ref_PL_REF: TFloatField
      FieldName = 'PL_REF'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
  end
  object qry_tot_lote_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( SUM( ISNULL( PL_LOTE, 0 ) ), 0 ) AS PL_LOTE,'
      '       ISNULL( SUM( ISNULL( QT_LOTE, 0 ) ), 0 ) AS VL_TOT_LOTE'
      'FROM   TDA_LOTE'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       CD_MERCADORIA = :CD_MERCADORIA AND'
      '       NR_REF = :NR_REF')
    Left = 393
    Top = 273
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end>
    object qry_tot_lote_VL_TOT_LOTE: TIntegerField
      FieldName = 'VL_TOT_LOTE'
    end
    object qry_tot_lote_PL_LOTE: TFloatField
      FieldName = 'PL_LOTE'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
  end
  object qry_tot_lib_avaria_: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( SUM( ISNULL( QT_LIB, 0 ) ), 0 ) AS VL_TOT_LIB,'
      '       ISNULL( SUM( ISNULL( PL_LIB, 0 ) ), 0 ) AS PL_LIB'
      'FROM   TDA_LIB_AVARIA'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_REF = :NR_REF AND'
      '       CD_MERCADORIA = :CD_MERCADORIA AND'
      '       NR_LOTE = :NR_LOTE')
    Left = 393
    Top = 374
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LOTE'
        ParamType = ptUnknown
      end>
    object qry_tot_lib_avaria_VL_TOT_LIB: TIntegerField
      FieldName = 'VL_TOT_LIB'
    end
    object qry_tot_lib_avaria_PL_LIB: TFloatField
      FieldName = 'PL_LIB'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
  end
  object ds_tot_merc: TDataSource
    DataSet = qry_tot_merc_
    Left = 281
    Top = 65
  end
  object ds_tot_ref: TDataSource
    DataSet = qry_tot_ref_
    Left = 281
    Top = 169
  end
  object ds_tot_lote: TDataSource
    DataSet = qry_tot_lote_
    Left = 281
    Top = 275
  end
  object ds_tot_lib_avaria: TDataSource
    DataSet = qry_tot_lib_avaria_
    Left = 281
    Top = 374
  end
  object qry_existe_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) EXISTEDI'
      'FROM TDECLARACAO_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 614
    Top = 374
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_existe_di_EXISTEDI: TIntegerField
      FieldName = 'EXISTEDI'
    end
  end
  object qry_vencto_: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT D.NR_DA, D.DT_VENCTO_DA, S.TP_CTRL_VENCTO'
      'FROM   TDA D, TPROCESSO P, TSERVICO S'
      'WHERE  D.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_SERVICO = S.CD_SERVICO AND'
      '       D.NR_PROCESSO = :NR_PROCESSO')
    Left = 162
    Top = 580
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_vencto_NR_DA: TStringField
      FieldName = 'NR_DA'
      Origin = 'TDA.NR_DA'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object qry_vencto_DT_VENCTO_DA: TDateTimeField
      FieldName = 'DT_VENCTO_DA'
      Origin = 'TDA.DT_VENCTO_DA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qry_vencto_TP_CTRL_VENCTO: TStringField
      FieldName = 'TP_CTRL_VENCTO'
      Origin = 'TDA.NR_DA'
      Size = 1
    end
  end
  object ds_vencto: TDataSource
    DataSet = qry_vencto_
    Left = 44
    Top = 580
  end
  object qry_consiste_avaria_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM( QT_LIB ) AS QT_LIB'
      'FROM   TDA_LIB_AVARIA'
      'WHERE  NR_PROCESSO   = :NR_PROCESSO AND'
      '       CD_MERCADORIA = :CD_MERCADORIA AND'
      '       NR_REF        = :NR_REF AND'
      '       NR_LOTE       = :NR_LOTE AND'
      '       DT_LIB        <> :DT_LIB  '
      '')
    Left = 614
    Top = 422
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_LIB'
        ParamType = ptUnknown
      end>
    object qry_consiste_avaria_QT_LIB: TIntegerField
      FieldName = 'QT_LIB'
      Origin = 'TDA_LIB_AVARIA.QT_LIB'
    end
  end
  object qry_tp_local_etiq_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT TP_LOCAL_ETIQ, NM_LOCAL_ETIQ'
      'FROM   TTP_LOCAL_ETIQ')
    Left = 614
    Top = 473
    object qry_tp_local_etiq_TP_LOCAL_ETIQ: TStringField
      FieldName = 'TP_LOCAL_ETIQ'
      Origin = 'TTP_LOCAL_ETIQ.TP_LOCAL_ETIQ'
      Size = 1
    end
    object qry_tp_local_etiq_NM_LOCAL_ETIQ: TStringField
      FieldName = 'NM_LOCAL_ETIQ'
      Origin = 'TTP_LOCAL_ETIQ.NM_LOCAL_ETIQ'
    end
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT NR_DIAS_VENCTO_ENT_NAVIO'
      'FROM   TPARAMETROS')
    Left = 613
    Top = 524
  end
  object qry_ent_navio_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT DT_REALIZACAO DT_ENT_NAVIO'
      'FROM   TFOLLOWUP'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       CD_EVENTO IN ( SELECT CD_EV_ENT FROM TPARAMETROS ) AND'
      '       IN_APLICAVEL = '#39'1'#39)
    Left = 613
    Top = 576
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ent_navio_DT_ENT_NAVIO: TDateTimeField
      FieldName = 'DT_ENT_NAVIO'
    end
  end
  object sp_atz_da_lote: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_da_lote'
    Left = 728
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_evento'
        ParamType = ptInput
      end>
  end
end

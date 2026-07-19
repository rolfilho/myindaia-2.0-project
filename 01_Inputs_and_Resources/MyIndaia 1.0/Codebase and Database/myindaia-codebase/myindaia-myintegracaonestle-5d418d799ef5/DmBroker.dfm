object dmdBroker: TdmdBroker
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 301
  Width = 623
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':587'
    MaxLineAction = maException
    Port = 587
    DefaultPort = 0
    ReadTimeout = 60000
    SSLOptions.Method = sslvTLSv1_2
    SSLOptions.SSLVersions = [sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 519
    Top = 16
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 327
    Top = 16
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    SASLMechanisms = <>
    Left = 407
    Top = 16
  end
  object qryBroker: TFDQuery
    Connection = dbBroker
    Left = 136
    Top = 16
  end
  object dbBroker: TFDConnection
    ConnectionName = 'Broker'
    Params.Strings = (
      'Database=BROKER'
      'User_Name=SA'
      'Password=123'
      'Server=INDAIA10'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object qryTRAP: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      '  INSERT INTO MYINDAIA..TRAP (                                  '
      '        CD_RAP                                        '
      '       ,CD_RAP_ANO                                    '
      '       ,CD_STATUS                                     '
      '       ,IN_RAP_VALIDA                                 '
      '       ,IN_FORN_VALIDA                                '
      '       ,IN_PACK_VALIDA                                '
      '       ,TX_VALIDACAO                                  '
      '       ,CD_USUARIO_CRIADOR                            '
      '       ,DT_INSERCAO                                   '
      '       ,CD_EXPORTADOR                                 '
      '       ,CD_FABRICANTE                                 '
      '       ,CD_CLIENTE                                    '
      '       ,CD_PAIS                                       '
      '       ,CD_TERMO_PAGTO                                '
      '       ,CD_INCOTERM                                   '
      '       ,CD_MOEDA_MLE                                  '
      '       ,CD_VIA_TRANSPORTE                             '
      '       ,CD_LOCAL_ORIGEM                               '
      '       ,CD_LOCAL_DESTINO                              '
      '       ,CD_CONSIGNATARIO                              '
      '       ,CD_NOTIFY                                     '
      '       ,CD_BANCO                                      '
      '       ,NR_FORNECIMENTO                               '
      '       ,NR_PEDIDO                                     '
      '       ,DT_PREV_SAIDA                                 '
      '       ,VL_MLE                                        '
      '       ,VL_SEGURO                                     '
      '       ,VL_FRETE_INT                                  '
      '       ,VL_PESO_BRUTO                                 '
      '       ,VL_PESO_LIQ                                   '
      '       ,VL_CUBAGEM                                    '
      '       ,TX_EMBALAGEM                                  '
      '       ,TX_MARCACAO                                   '
      '       ,TX_INST_EMB                                   '
      '       ,CD_GRUPO                                      '
      '       ,DT_PREV_EMBARQUE                              '
      '       ,CD_STATUS_DOCTO                               '
      '       ,IN_RAP_VALIDA_DOCTO                           '
      '       ,IN_FABR_EXPO                                  '
      '       ,IN_INSPECAO                                   '
      '       ,IN_PERMISSO                                   '
      '       ,IN_EXPURGO                                    '
      '       ,IN_PALLET_EXPURGO                             '
      '       ,IN_DECL_EMBALAGEM                             '
      '       ,IN_CONSULADO                                  '
      '       ,IN_TRIANGULACAO                               '
      '       ,IN_CARTA_CREDITO                              '
      '       ,IN_CADIVI                                     '
      '       ,IN_AMOSTRA                                    '
      '       ,IN_ANTECIPADO                                 '
      '       ,IN_EMAIL_ERRO                                 '
      '       ,TP_DRAWBACK                                   '
      '       ,TP_NOTIFY                                     '
      '       ,TP_CONSIGNEE                                  '
      '       ,VL_ACRESCIMO                                  '
      '       ,VL_DESCONTO                                   '
      '       ,IN_PEDIDO_VALIDA                              '
      '       ,IN_COURRIER                                   '
      '       ,IN_MODELO                                     '
      '       ,IN_SEM_PACK_LIST                              '
      '       ,DT_FECHAMENTO                                 '
      '       ,DT_FINALIZADO_PEDIDO                          '
      '       ,TX_OBS                                        '
      ' )                                                    '
      ' VALUES (                                             '
      '         :CD_RAP                    '#9'                 '
      '       , :CD_RAP_ANO                                  '
      '       , :CD_STATUS                                   '
      '       , :IN_RAP_VALIDA                               '
      '       , :IN_FORN_VALIDA                              '
      '       , :IN_PACK_VALIDA                              '
      '       , :TX_VALIDACAO                                '
      '       , :CD_USUARIO_CRIADOR                          '
      '       , :DT_INSERCAO                                 '
      '       , :CD_EXPORTADOR                               '
      '       , :CD_FABRICANTE                               '
      '       , :CD_CLIENTE                                  '
      '       , :CD_PAIS                                     '
      '       , :CD_TERMO_PAGTO                              '
      '       , :CD_INCOTERM                                 '
      '       , :CD_MOEDA_MLE                                '
      '       , :CD_VIA_TRANSPORTE                           '
      '       , :CD_LOCAL_ORIGEM                             '
      '       , :CD_LOCAL_DESTINO                            '
      '       , :CD_CONSIGNATARIO                            '
      '       , :CD_NOTIFY                                   '
      '       , :CD_BANCO                                    '
      '       , :NR_FORNECIMENTO                             '
      '       , :NR_PEDIDO                                   '
      '       , :DT_PREV_SAIDA                               '
      '       , :VL_MLE                                      '
      '       , :VL_SEGURO                                   '
      '       , :VL_FRETE_INT                                '
      '       , :VL_PESO_BRUTO                               '
      '       , :VL_PESO_LIQ                                 '
      '       , :VL_CUBAGEM                                  '
      '       , :TX_EMBALAGEM                                '
      '       , :TX_MARCACAO                                 '
      '       , :TX_INST_EMB                                 '
      '       , :CD_GRUPO                                    '
      '       , :DT_PREV_EMBARQUE                            '
      '       , :CD_STATUS_DOCTO                             '
      '       , :IN_RAP_VALIDA_DOCTO                         '
      '       , :IN_FABR_EXPO                                '
      '       , :IN_INSPECAO                                 '
      '       , :IN_PERMISSO                                 '
      '       , :IN_EXPURGO                                  '
      '       , :IN_PALLET_EXPURGO                           '
      '       , :IN_DECL_EMBALAGEM                           '
      '       , :IN_CONSULADO                                '
      '       , :IN_TRIANGULACAO                             '
      '       , :IN_CARTA_CREDITO                            '
      '       , :IN_CADIVI                                   '
      '       , :IN_AMOSTRA                                  '
      '       , :IN_ANTECIPADO                               '
      '       , :IN_EMAIL_ERRO                               '
      '       , :TP_DRAWBACK                                 '
      '       , :TP_NOTIFY                                   '
      '       , :TP_CONSIGNEE                                '
      '       , :VL_ACRESCIMO                                '
      '       , :VL_DESCONTO                                 '
      '       , :IN_PEDIDO_VALIDA                            '
      '       , :IN_COURRIER                                 '
      '       , :IN_MODELO                                   '
      '       , :IN_SEM_PACK_LIST                            '
      '       , :DT_FECHAMENTO                               '
      '       , :DT_FINALIZADO_PEDIDO                        '
      '       , :TX_OBS                                      '
      '   )                                                  ')
    Left = 80
    Top = 88
    ParamData = <
      item
        Name = 'CD_RAP'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_RAP_ANO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_STATUS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IN_RAP_VALIDA'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_FORN_VALIDA'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_PACK_VALIDA'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'TX_VALIDACAO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_USUARIO_CRIADOR'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DT_INSERCAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'CD_EXPORTADOR'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_FABRICANTE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_CLIENTE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_PAIS'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_TERMO_PAGTO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_INCOTERM'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_MOEDA_MLE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_VIA_TRANSPORTE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_LOCAL_ORIGEM'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_LOCAL_DESTINO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_CONSIGNATARIO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_NOTIFY'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_BANCO'
        DataType = ftString
        ParamType = ptInput
        Size = 5
      end
      item
        Name = 'NR_FORNECIMENTO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'NR_PEDIDO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DT_PREV_SAIDA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'VL_MLE'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_SEGURO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_FRETE_INT'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_PESO_BRUTO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_PESO_LIQ'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_CUBAGEM'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'TX_EMBALAGEM'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TX_MARCACAO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TX_INST_EMB'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_GRUPO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DT_PREV_EMBARQUE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'CD_STATUS_DOCTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IN_RAP_VALIDA_DOCTO'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_FABR_EXPO'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_INSPECAO'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_PERMISSO'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_EXPURGO'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_PALLET_EXPURGO'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_DECL_EMBALAGEM'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_CONSULADO'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_TRIANGULACAO'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_CARTA_CREDITO'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_CADIVI'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_AMOSTRA'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_ANTECIPADO'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_EMAIL_ERRO'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'TP_DRAWBACK'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TP_NOTIFY'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TP_CONSIGNEE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'VL_ACRESCIMO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_DESCONTO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'IN_PEDIDO_VALIDA'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_COURRIER'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_MODELO'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_SEM_PACK_LIST'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'DT_FECHAMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DT_FINALIZADO_PEDIDO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'TX_OBS'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryTRAP_FORNECIMENTO: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      '  INSERT INTO MYINDAIA..TRAP_FORNECIMENTO ('
      '        CD_RAP                             '
      '      , CD_RAP_ANO                         '
      '      , CD_FORNECIMENTO                    '
      '      , CD_ITEM                            '
      '      , CD_MERCADORIA                      '
      '      , VL_QTDE                            '
      '      , VL_PESO_LIQ_UN                     '
      '      , TX_UNID_MEDIDA                     '
      '      , VL_PRECO_UNIT                      '
      '      , VL_PRECO_TOT                       '
      '      , CD_INCOTERM                        '
      '      , CD_REFERENCIA                      '
      '      , DT_PEDIDO                          '
      '      , NR_PO                              '
      '      , CD_PAIS_DESTINO                    '
      '      , CD_NCM                             '
      '      , TX_MARCACAO                        '
      '      , CD_GRUPO                           '
      '      , VL_PESO_BRUTO_UN                   '
      '      , CD_TIPO_CONTAINER                  '
      '      , CHAVE_NOTA                         '
      '      , TX_DESC                            '
      '      , TX_DESC_ING                        '
      '      , TX_DESC_ESP                        '
      '      , QT_CAIXAS      '
      '      , VL_CUBAGEM                    '
      '     )                                     '
      '      VALUES (                             '
      '        :CD_RAP                            '
      '      , :CD_RAP_ANO                        '
      '      , :CD_FORNECIMENTO                   '
      '      , :CD_ITEM                           '
      '      , :CD_MERCADORIA                     '
      '      , :VL_QTDE                           '
      '      , :VL_PESO_LIQ_UN                    '
      '      , :TX_UNID_MEDIDA                    '
      '      , :VL_PRECO_UNIT                     '
      '      , :VL_PRECO_TOT                      '
      '      , :CD_INCOTERM                       '
      '      , :CD_REFERENCIA                     '
      '      , :DT_PEDIDO                         '
      '      , :NR_PO                             '
      '      , :CD_PAIS_DESTINO                   '
      '      , :CD_NCM                            '
      '      , :TX_MARCACAO                       '
      '      , :CD_GRUPO                          '
      '      , :VL_PESO_BRUTO_UN                  '
      '      , :CD_TIPO_CONTAINER                 '
      '      , :CHAVE_NOTA                        '
      '      , :TX_DESC                           '
      '      , :TX_DESC_ING                       '
      '      , :TX_DESC_ESP                       '
      '      , :QT_CAIXAS '
      '     , :VL_CUBAGEM                        '
      '  '#9')                                      ')
    Left = 80
    Top = 152
    ParamData = <
      item
        Name = 'CD_RAP'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_RAP_ANO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_FORNECIMENTO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_ITEM'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_MERCADORIA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'VL_QTDE'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_PESO_LIQ_UN'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'TX_UNID_MEDIDA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'VL_PRECO_UNIT'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_PRECO_TOT'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'CD_INCOTERM'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_REFERENCIA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DT_PEDIDO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'NR_PO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_PAIS_DESTINO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_NCM'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TX_MARCACAO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_GRUPO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'VL_PESO_BRUTO_UN'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'CD_TIPO_CONTAINER'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CHAVE_NOTA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TX_DESC'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TX_DESC_ING'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TX_DESC_ESP'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'QT_CAIXAS'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_CUBAGEM'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object qryTRAP_FORNECIMENTO_LOTE: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      ' INSERT INTO TRAP_FORNECIMENTO_LOTE ('
      '       CD_RAP                                  '
      '      ,CD_RAP_ANO                              '
      '      ,CD_FORNECIMENTO                         '
      '      ,CD_GRUPO                                '
      '      ,CHAVE_NOTA  '
      '      ,CD_DELIVERY                            '
      '      ,CD_LOTE                                 '
      '      ,CD_SKU                                  '
      '      ,DT_FABRICACAO                           '
      '      ,DT_VENCIMENTO                           '
      '      ,QT_MERCADORIA                           '
      '      ,QT_PESO_LIQ                             '
      '      ,QT_PESO_BRUTO                           '
      ' )                                             '
      ' '#9'VALUES (                                    '
      '       :CD_RAP                                 '
      '      ,:CD_RAP_ANO                             '
      '      ,:CD_FORNECIMENTO                        '
      '      ,:CD_GRUPO                               '
      '      ,:CHAVE_NOTA      '#9'                      '
      '      ,:CD_DELIVERY'
      '      ,:CD_LOTE         '#9'                      '
      '      ,:CD_SKU          '#9'                      '
      '      ,:DT_FABRICACAO   '#9'                      '
      '      ,:DT_VENCIMENTO   '#9'                      '
      '      ,:QT_MERCADORIA   '#9'                      '
      '      ,:QT_PESO_LIQ                            '
      '      ,:QT_PESO_BRUTO                          '
      ' )                                             ')
    Left = 80
    Top = 224
    ParamData = <
      item
        Name = 'CD_RAP'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_RAP_ANO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_FORNECIMENTO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_GRUPO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CHAVE_NOTA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_DELIVERY'
        ParamType = ptInput
      end
      item
        Name = 'CD_LOTE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_SKU'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DT_FABRICACAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DT_VENCIMENTO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'QT_MERCADORIA'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'QT_PESO_LIQ'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'QT_PESO_BRUTO'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object qryRetorno: TFDQuery
    Connection = dbBroker
    Left = 232
    Top = 88
  end
  object qryRetornoOrdem: TFDQuery
    Connection = dbBroker
    Left = 232
    Top = 152
  end
  object qryRetornoAdicao: TFDQuery
    Connection = dbBroker
    Left = 232
    Top = 224
  end
  object qryTINSTRUCAO_DESEMBARACO: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'INSERT INTO TINSTRUCAO_DESEMBARACO ('
      '  ID_CODIGO'#9'                            '
      ', CD_USUARIO'#9'                        '
      ', DT_CRIACAO'#9'                        '
      ', IN_AUTORIZADO                         '
      ', CD_CLIENTE'#9'                        '
      ', CD_RESPONSAVEL'#9'                    '
      ', TX_OBSERVACOES'#9'                    '
      ', CD_MODAL'#9'                            '
      ', CD_PAIS_PROCEDENCIA'#9'                '
      ', CD_MOEDA_FRETE'#9'                    '
      ', VL_FRETE_PREPAID_MNEG'#9'                '
      ', VL_FRETE_COLLECT_MNEG'#9'                '
      ', VL_SEGURO_MNEG'#9'                    '
      ', CD_LOCAL_EMBARQUE'#9'                    '
      ', CD_INCOTERM'#9'                        '
      ', CD_TIPO_FRETE'#9'                        '
      ', ID_CLIENTE'
      ')'
      'VALUES'
      '(  :ID_CODIGO'#9'            '
      ' , :CD_USUARIO'#9'        '
      ' , :DT_CRIACAO'#9'        '
      ' , :IN_AUTORIZADO         '
      ' , :CD_CLIENTE'#9'        '
      ' , :CD_RESPONSAVEL'#9'    '
      ' , :TX_OBSERVACOES'#9'    '
      ' , :CD_MODAL'#9'            '
      ' , :CD_PAIS_PROCEDENCIA'#9
      ' , :CD_MOEDA_FRETE'#9'    '
      ' , :VL_FRETE_PREPAID_MNEG'#9
      ' , :VL_FRETE_COLLECT_MNEG'#9
      ' , :VL_SEGURO_MNEG'#9'    '
      ' , :CD_LOCAL_EMBARQUE'#9'    '
      ' , :CD_INCOTERM'#9'        '
      ' , :CD_TIPO_FRETE'#9'        '
      ' , :ID_CLIENTE'#9
      ')')
    Left = 400
    Top = 88
    ParamData = <
      item
        Name = 'ID_CODIGO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_USUARIO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DT_CRIACAO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IN_AUTORIZADO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_CLIENTE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_RESPONSAVEL'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TX_OBSERVACOES'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_MODAL'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_PAIS_PROCEDENCIA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_MOEDA_FRETE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'VL_FRETE_PREPAID_MNEG'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_FRETE_COLLECT_MNEG'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_SEGURO_MNEG'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'CD_LOCAL_EMBARQUE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_INCOTERM'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_TIPO_FRETE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ID_CLIENTE'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryTINSTRUCAO_DESEMBARACO_PEDIDO: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'INSERT INTO TINSTRUCAO_DESEMBARACO_PEDIDO('
      ', ID_CODIGO'#9'                                 '
      ', NR_REFERENCIA'#9'                             '
      ', NR_ITEM_PO'#9'                             '
      ', NR_PARCIAL'#9'                             '
      ', DT_INCLUSAO'#9'                             '
      ')'
      'VALUES'
      '('
      '  :ID_CODIGO'#9'    '
      ', :NR_REFERENCIA'#9
      ', :NR_ITEM_PO'#9
      ', :NR_PARCIAL'#9
      ', :DT_INCLUSAO'#9
      ')')
    Left = 400
    Top = 152
    ParamData = <
      item
        Name = 'ID_CODIGO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'NR_REFERENCIA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'NR_ITEM_PO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'NR_PARCIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DT_INCLUSAO'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object qryTPO: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'INSERT INTO TPO('
      '   ,NR_PROCESSO'#9'               '
      '   ,CD_IMPORTADOR'#9'           '
      '   ,CD_EXPORTADOR'#9'           '
      '   ,CD_VIA_TRANSP'#9'           '
      '   ,CD_PAIS_PROCEDENCIA'#9'       '
      '   ,CD_MOEDA_NEG'#9'           '
      '   ,CD_INCOTERM      '#9'       '
      '   ,CD_LOCAL_EMBARQUE'#9'       '
      '   ,CD_MOEDA_FRETE'#9'           '
      '   ,CD_MOEDA_SEGURO'#9'           '
      '   ,CD_MOEDA_CARGA'#9'           '
      '   ,DT_ABERTURA                '
      '   ,PL_PO'#9'                   '
      '   ,PB_PO'#9'                   '
      '   ,TX_OBSERVACAO'#9'           '
      '   ,VL_FRETE_PREPAID'#9'       '
      '   ,VL_FRETE_COLLECT'#9'       '
      '   ,VL_SEGURO'#9'               '
      '   ,VL_TOTAL'#9'               '
      '   ,DT_NECESSIDADE'#9'           '
      '   ,CD_TIPO_FRETE'#9'           '
      '   ,CD_LOCAL_DESEMBARQUE'#9'   '
      '   ,CD_EMPRESA'#9'               '
      '   ,CD_USUARIO'#9'               '
      '   ,CD_AREA      '#9'           '
      '   ,CD_SERVICO'#9'               '
      '   ,IN_WEB'#9'                   '
      '   ,IN_COMISSAO'#9'               '
      '   ,IN_DESCONTO'#9'               '
      '   ,IN_INDICADOR_CONSIG_IMPORT '
      '   ,IN_INDIC_MULTMODAL'#9'       '
      '   ,IN_FUNDAP'#9'               '
      '   ,IN_INDIC_TX_JUROS'#9'       '
      '   ,IN_SEGURO'#9'               '
      '   ,PC_COMISSAO'#9'               '
      '   ,PC_DESCONTO'#9'               '
      '   ,PC_SEGURO'#9'               '
      '   ,PC_COMISSAO_AGENTE'#9'       '
      '   ,QT_TOTAL_PESO'#9'           '
      '   ,QT_PORC_ICMS'#9'           '
      '   ,QT_TOTAL_ITENS'#9'           '
      '   ,QT_PORC_RED_ICMS'#9'       '
      '   ,TP_CAMBIO'#9'               '
      '   ,TX_JUROS'#9'               '
      '   ,VL_COMISSAO'#9'               '
      '   ,VL_CARGA'#9'               '
      '   ,VL_CAMBIO'#9'               '
      '   ,VL_DESCONTO'#9'               '
      '   ,VL_FRETE_TERRIT_NAC'#9'       '
      '   ,VL_TOTAL_PARCELA'#9'       '
      '   ,VL_PAGTO_ANTECIPADO'#9'       '
      '   ,VL_PAGTO_VISTA'#9'           '
      '   ,VL_PERIODIC_MENSAL'#9'       '
      '   ,VL_DESPESAS'#9'               '
      '   ,VL_DESCONTOS'#9'           '
      '   ,IN_SELECIONADO'#9'           '
      '   ,IN_MONTADO'#9'               '
      '   ,IN_IND_COND_MERC'#9'       '
      '   ,IN_IND_CAMBIO_ITENS'#9'       '
      '   ,QT_TOTAL_DISPONIVEL'#9'       '
      '   ,IN_ENTREPOSTO'#9'           '
      '   ,IN_FATURADO'#9'               '
      '   ,IN_IMEDIATO'#9'               '
      '   ,VL_FRETE_INTERNO'#9'       '
      '   ,VL_EMBALAGEM'#9'           '
      '   ,VL_PB_EMBALAGEM'#9'           '
      '   ,VL_PL_EMBALAGEM'#9'           '
      '   ,IN_CARGA_PERIGOSA'#9'       '
      '   ,VL_M3'#9'                   '
      ')'
      'VALUES'
      '('
      '   :NR_PROCESSO'#9'              '
      '  ,:CD_IMPORTADOR'#9'          '
      '  ,:CD_EXPORTADOR'#9'          '
      '  ,:CD_VIA_TRANSP'#9'          '
      '  ,:CD_PAIS_PROCEDENCIA'#9'      '
      '  ,:CD_MOEDA_NEG'#9'          '
      '  ,:CD_INCOTERM      '#9'      '
      '  ,:CD_LOCAL_EMBARQUE'#9'      '
      '  ,:CD_MOEDA_FRETE'#9'          '
      '  ,:CD_MOEDA_SEGURO'#9'          '
      '  ,:CD_MOEDA_CARGA'#9'          '
      '  ,:DT_ABERTURA               '
      '  ,:PL_PO'#9'                  '
      '  ,:PB_PO'#9'                  '
      '  ,:TX_OBSERVACAO'#9'          '
      '  ,:VL_FRETE_PREPAID'#9'      '
      '  ,:VL_FRETE_COLLECT'#9'      '
      '  ,:VL_SEGURO'#9'              '
      '  ,:VL_TOTAL'#9'              '
      '  ,:DT_NECESSIDADE'#9'          '
      '  ,:CD_TIPO_FRETE'#9'          '
      '  ,:CD_LOCAL_DESEMBARQUE'#9'  '
      '  ,:CD_EMPRESA'#9'              '
      '  ,:CD_USUARIO'#9'              '
      '  ,:CD_AREA      '#9'          '
      '  ,:CD_SERVICO'#9'              '
      '  ,:IN_WEB'#9'                  '
      '  ,:IN_COMISSAO'#9'              '
      '  ,:IN_DESCONTO'#9'              '
      '  ,:IN_INDICADOR_CONSIG_IMPORT'
      '  ,:IN_INDIC_MULTMODAL'#9'      '
      '  ,:IN_FUNDAP'#9'              '
      '  ,:IN_INDIC_TX_JUROS'#9'      '
      '  ,:IN_SEGURO'#9'              '
      '  ,:PC_COMISSAO'#9'              '
      '  ,:PC_DESCONTO'#9'              '
      '  ,:PC_SEGURO'#9'              '
      '  ,:PC_COMISSAO_AGENTE'#9'      '
      '  ,:QT_TOTAL_PESO'#9'          '
      '  ,:QT_PORC_ICMS'#9'          '
      '  ,:QT_TOTAL_ITENS'#9'          '
      '  ,:QT_PORC_RED_ICMS'#9'      '
      '  ,:TP_CAMBIO'#9'              '
      '  ,:TX_JUROS'#9'              '
      '  ,:VL_COMISSAO'#9'              '
      '  ,:VL_CARGA'#9'              '
      '  ,:VL_CAMBIO'#9'              '
      '  ,:VL_DESCONTO'#9'              '
      '  ,:VL_FRETE_TERRIT_NAC'#9'      '
      '  ,:VL_TOTAL_PARCELA'#9'      '
      '  ,:VL_PAGTO_ANTECIPADO'#9'      '
      '  ,:VL_PAGTO_VISTA'#9'          '
      '  ,:VL_PERIODIC_MENSAL'#9'      '
      '  ,:VL_DESPESAS'#9'              '
      '  ,:VL_DESCONTOS'#9'          '
      '  ,:IN_SELECIONADO'#9'          '
      '  ,:IN_MONTADO'#9'              '
      '  ,:IN_IND_COND_MERC'#9'      '
      '  ,:IN_IND_CAMBIO_ITENS'#9'      '
      '  ,:QT_TOTAL_DISPONIVEL'#9'      '
      '  ,:IN_ENTREPOSTO'#9'          '
      '  ,:IN_FATURADO'#9'              '
      '  ,:IN_IMEDIATO'#9'              '
      '  ,:VL_FRETE_INTERNO'#9'      '
      '  ,:VL_EMBALAGEM'#9'          '
      '  ,:VL_PB_EMBALAGEM'#9'          '
      '  ,:VL_PL_EMBALAGEM'#9'          '
      '  ,:IN_CARGA_PERIGOSA'#9'      '
      '  ,:VL_M3'#9'                 '
      ''
      ')')
    Left = 544
    Top = 88
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_IMPORTADOR'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_EXPORTADOR'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_VIA_TRANSP'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_PAIS_PROCEDENCIA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_MOEDA_NEG'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_INCOTERM'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_LOCAL_EMBARQUE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_MOEDA_FRETE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_MOEDA_SEGURO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_MOEDA_CARGA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DT_ABERTURA'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'PL_PO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'PB_PO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'TX_OBSERVACAO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'VL_FRETE_PREPAID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_FRETE_COLLECT'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_SEGURO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_TOTAL'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'DT_NECESSIDADE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'CD_TIPO_FRETE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_LOCAL_DESEMBARQUE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_EMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_USUARIO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_AREA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_SERVICO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'IN_WEB'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'IN_COMISSAO'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_DESCONTO'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_INDICADOR_CONSIG_IMPORT'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_INDIC_MULTMODAL'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_FUNDAP'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_INDIC_TX_JUROS'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_SEGURO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'PC_COMISSAO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'PC_DESCONTO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'PC_SEGURO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'PC_COMISSAO_AGENTE'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'QT_TOTAL_PESO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'QT_PORC_ICMS'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'QT_TOTAL_ITENS'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'QT_PORC_RED_ICMS'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'TP_CAMBIO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'TX_JUROS'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_COMISSAO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_CARGA'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_CAMBIO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_DESCONTO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_FRETE_TERRIT_NAC'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_TOTAL_PARCELA'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_PAGTO_ANTECIPADO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_PAGTO_VISTA'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_PERIODIC_MENSAL'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_DESPESAS'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_DESCONTOS'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'IN_SELECIONADO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'IN_MONTADO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'IN_IND_COND_MERC'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_IND_CAMBIO_ITENS'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'QT_TOTAL_DISPONIVEL'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'IN_ENTREPOSTO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'IN_FATURADO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'IN_IMEDIATO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'VL_FRETE_INTERNO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_EMBALAGEM'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_PB_EMBALAGEM'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_PL_EMBALAGEM'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'IN_CARGA_PERIGOSA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'VL_M3'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object qryTPO_ITEM: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'INSERT INTO TPO_ITEM ('
      '    NR_PROCESSO   '#9'               '
      '   ,NR_ITEM'#9'                       '
      '   ,CD_EXPORTADOR'#9'               '
      '   ,CD_MERCADORIA'#9'               '
      '   ,CD_FABRICANTE'#9'               '
      '   ,CD_PAIS_ORIGEM'#9'               '
      '   ,CD_NCM_SH'#9'                   '
      '   ,CD_MOEDA_NEGOCIADA'#9'           '
      '   ,CD_INCOTERM   '#9'               '
      '   ,CD_UNID_MEDIDA'#9'               '
      '   ,PL_ITEM'#9'                       '
      '   ,QT_INICIAL'#9'                   '
      '   ,TX_MERCADORIA'#9'               '
      '   ,VL_UNITARIO'#9'                   '
      '   ,VL_TOTAL'#9'                   '
      '   ,QT_DISPONIVEL'#9'               '
      '   ,QT_INICIAL_EST'#9'               '
      '   ,NR_ITEM_CLIENTE'#9'               '
      '   ,TX_OBSERVACAO'#9'               '
      '   ,IN_UTILIZADO_INSTR_DESEMB'#9'   '
      '   ,ID_CODIGO_INSTR_DESEMB'#9'       '
      '   ,NR_PARCIAL'#9'                   '
      '   ,CD_EMPRESA'#9'                   '
      '   ,QT_BAIXADA_DI'#9'               '
      '   ,QT_BAIXADA_LI'#9'               '
      '   ,QT_ESPEC_II'#9'                   '
      '   ,QT_ESPEC_IPI'#9'               '
      '   ,QT_AD'#9'                       '
      '   ,QT_MED_ESTATISTICA'#9'           '
      '   ,TP_IND_TX_JUROS'#9'               '
      '   ,TX_JUROS_CAMBIO'#9'               '
      '   ,VL_DESPESA_MOEDA'#9'           '
      '   ,VL_DESCONTO_MOEDA'#9'           '
      '   ,VL_DESCONTO'#9'                   '
      '   ,VL_COMISSAO'#9'                   '
      '   ,VL_ESPEC_II'#9'                   '
      '   ,VL_ESPEC_IPI'#9'               '
      '   ,VL_ESPEC_AD'#9'                   '
      '   ,VL_TOTAL_PARCELAS'#9'           '
      '   ,VL_COBERT_ACIMA_360'#9'           '
      '   ,VL_PAGTO_ANTECIPADO'#9'           '
      '   ,VL_PAGTO_AVISTA'#9'               '
      '   ,VL_FRETE_NAC_MOEDA'#9'           '
      '   ,VL_SEGURO_MOEDA                '
      '   ,VL_ACRESC_MOEDA                '
      '   ,VL_DEDUC_MOEDA'#9'               '
      '   ,VL_FRETE_PREPAID_MOEDA'#9'       '
      '   ,VL_FRETE_COLLECT'#9'           '
      '   ,IN_SELECIONADO       '#9'       '
      '   ,QT_BAIXAR'#9'                   '
      '   ,IN_MONTADO'#9'                   '
      '   ,IN_FABR_EXP_PROD'#9'           '
      '   ,IN_IND_COND_MERC'#9'           '
      '   ,IN_IND_PERIODICIDADE'#9'       '
      '   ,IN_REG_TRIB_IPI'#9'               '
      '   ,CD_MODALIDADE'#9'               '
      '   ,IN_AVISO_DB    '#9'               '
      '   ,TP_STATUS_CRODA '#9'           '
      ')'
      'VALUES ('
      '  :NR_PROCESSO   '#9'               '
      ' ,:NR_ITEM'#9'                       '
      ' ,:CD_EXPORTADOR'#9'               '
      ' ,:CD_MERCADORIA'#9'               '
      ' ,:CD_FABRICANTE'#9'               '
      ' ,:CD_PAIS_ORIGEM'#9'               '
      ' ,:CD_NCM_SH'#9'                   '
      ' ,:CD_MOEDA_NEGOCIADA'#9'           '
      ' ,:CD_INCOTERM   '#9'               '
      ' ,:CD_UNID_MEDIDA'#9'               '
      ' ,:PL_ITEM'#9'                       '
      ' ,:QT_INICIAL'#9'                   '
      ' ,:TX_MERCADORIA'#9'               '
      ' ,:VL_UNITARIO'#9'                   '
      ' ,:VL_TOTAL'#9'                   '
      ' ,:QT_DISPONIVEL'#9'               '
      ' ,:QT_INICIAL_EST'#9'               '
      ' ,:NR_ITEM_CLIENTE'#9'               '
      ' ,:TX_OBSERVACAO'#9'               '
      ' ,:IN_UTILIZADO_INSTR_DESEMB'#9'   '
      ' ,:ID_CODIGO_INSTR_DESEMB'#9'       '
      ' ,:NR_PARCIAL'#9'                   '
      ' ,:CD_EMPRESA'#9'                   '
      ' ,:QT_BAIXADA_DI'#9'               '
      ' ,:QT_BAIXADA_LI'#9'               '
      ' ,:QT_ESPEC_II'#9'                   '
      ' ,:QT_ESPEC_IPI'#9'               '
      ' ,:QT_AD'#9'                       '
      ' ,:QT_MED_ESTATISTICA'#9'           '
      ' ,:TP_IND_TX_JUROS'#9'               '
      ' ,:TX_JUROS_CAMBIO'#9'               '
      ' ,:VL_DESPESA_MOEDA'#9'           '
      ' ,:VL_DESCONTO_MOEDA'#9'           '
      ' ,:VL_DESCONTO'#9'                   '
      ' ,:VL_COMISSAO'#9'                   '
      ' ,:VL_ESPEC_II'#9'                   '
      ' ,:VL_ESPEC_IPI'#9'               '
      ' ,:VL_ESPEC_AD'#9'                   '
      ' ,:VL_TOTAL_PARCELAS'#9'           '
      ' ,:VL_COBERT_ACIMA_360'#9'           '
      ' ,:VL_PAGTO_ANTECIPADO'#9'           '
      ' ,:VL_PAGTO_AVISTA'#9'               '
      ' ,:VL_FRETE_NAC_MOEDA'#9'           '
      ' ,:VL_SEGURO_MOEDA                '
      ' ,:VL_ACRESC_MOEDA                '
      ' ,:VL_DEDUC_MOEDA'#9'               '
      ' ,:VL_FRETE_PREPAID_MOEDA'#9'       '
      ' ,:VL_FRETE_COLLECT'#9'           '
      ' ,:IN_SELECIONADO       '#9'       '
      ' ,:QT_BAIXAR'#9'                   '
      ' ,:IN_MONTADO'#9'                   '
      ' ,:IN_FABR_EXP_PROD'#9'           '
      ' ,:IN_IND_COND_MERC'#9'           '
      ' ,:IN_IND_PERIODICIDADE'#9'       '
      ' ,:IN_REG_TRIB_IPI'#9'               '
      ' ,:CD_MODALIDADE'#9'               '
      ' ,:IN_AVISO_DB    '#9'               '
      ' ,:TP_STATUS_CRODA '#9'          '
      ' )')
    Left = 544
    Top = 152
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'NR_ITEM'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_EXPORTADOR'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_MERCADORIA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_FABRICANTE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_PAIS_ORIGEM'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_NCM_SH'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_MOEDA_NEGOCIADA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_INCOTERM'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_UNID_MEDIDA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'PL_ITEM'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'QT_INICIAL'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'TX_MERCADORIA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'VL_UNITARIO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_TOTAL'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'QT_DISPONIVEL'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'QT_INICIAL_EST'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NR_ITEM_CLIENTE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TX_OBSERVACAO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'IN_UTILIZADO_INSTR_DESEMB'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ID_CODIGO_INSTR_DESEMB'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'NR_PARCIAL'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CD_EMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'QT_BAIXADA_DI'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'QT_BAIXADA_LI'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'QT_ESPEC_II'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'QT_ESPEC_IPI'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'QT_AD'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'QT_MED_ESTATISTICA'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'TP_IND_TX_JUROS'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'TX_JUROS_CAMBIO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_DESPESA_MOEDA'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_DESCONTO_MOEDA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'VL_DESCONTO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_COMISSAO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_ESPEC_II'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_ESPEC_IPI'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_ESPEC_AD'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_TOTAL_PARCELAS'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_COBERT_ACIMA_360'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_PAGTO_ANTECIPADO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_PAGTO_AVISTA'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_FRETE_NAC_MOEDA'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_SEGURO_MOEDA'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_ACRESC_MOEDA'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_DEDUC_MOEDA'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_FRETE_PREPAID_MOEDA'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_FRETE_COLLECT'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'IN_SELECIONADO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'QT_BAIXAR'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'IN_MONTADO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'IN_FABR_EXP_PROD'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'IN_IND_COND_MERC'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'IN_IND_PERIODICIDADE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'IN_REG_TRIB_IPI'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CD_MODALIDADE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'IN_AVISO_DB'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TP_STATUS_CRODA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryTemp: TFDQuery
    Connection = dbBroker
    Left = 192
    Top = 16
  end
  object qryTemp2: TFDQuery
    Connection = dbBroker
    Left = 248
    Top = 16
  end
  object qryProcesso: TFDQuery
    Connection = dbBroker
    Left = 352
    Top = 216
  end
end

object dmdBroker: TdmdBroker
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 663
  Width = 714
  object qryProcesso: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      
        'SELECT * FROM FN_SELECIONA_PAGAMENTO_MERCANTE('#39#39' , '#39#39' , :NR_PROC' +
        'ESSO , '#39#39' , '#39#39',:TP_PGMTO,0,3)')
    Left = 120
    Top = 96
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TP_PGMTO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryUpdateEvento: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      ' UPDATE TFOLLOWUP                     '
      '    SET DT_REALIZACAO = GETDATE()     '
      '   FROM TFOLLOWUP WITH(NOLOCK)        '
      '  WHERE NR_PROCESSO = :NR_PROCESSO    '
      '    AND CD_EVENTO   = :CD_EVENTO      ')
    Left = 40
    Top = 96
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'CD_EVENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end>
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
  object dsGrupo: TDataSource
    DataSet = cdsGrupo
    Left = 109
    Top = 585
  end
  object dsDados: TDataSource
    AutoEdit = False
    DataSet = cdsDados
    Left = 25
    Top = 585
  end
  object dsEmpresa: TDataSource
    DataSet = cdsEmpresa
    Left = 189
    Top = 585
  end
  object dsUnidadeNeg: TDataSource
    DataSet = cdsUnidadeNeg
    Left = 290
    Top = 585
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 390
    Top = 585
  end
  object qryGrupo: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT CD_GRUPO, NM_GRUPO     '
      '  FROM TGRUPO                 '
      ' WHERE ISNULL(IN_ATIVO,1) = 1 '
      ' ORDER BY NM_GRUPO            ')
    Left = 112
    Top = 384
  end
  object qryEmpresa: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA   '
      '  FROM TEMPRESA_NAC WITH(NOLOCK)'
      ' WHERE ISNULL(IN_ATIVO, 1) = 1  '
      ' ORDER BY NM_EMPRESA            ')
    Left = 192
    Top = 384
  end
  object qryUnidadeNeg: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT CD_UNID_NEG '
      ',CD_UNID_NEG + '#39' - '#39' +  NM_UNID_NEG AS NM_UNID_NEG'
      'FROM TUNID_NEG'
      'ORDER BY CD_UNID_NEG '
      '')
    Left = 288
    Top = 384
  end
  object qryProduto: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT CD_PRODUTO '
      ',CD_PRODUTO + '#39' - '#39' + NM_PRODUTO AS NM_PRODUTO'
      ' FROM TPRODUTO'
      'ORDER BY CD_PRODUTO '
      '')
    Left = 392
    Top = 384
  end
  object qryDados: TFDQuery
    Connection = dbBroker
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 500
    SQL.Strings = (
      
        'SELECT * FROM FN_SELECIONA_PAGAMENTO_MERCANTE ('#39#39' , '#39#39' , '#39#39' , '#39#39 +
        ' , '#39#39',0,1,3)')
    Left = 24
    Top = 384
    object qryDadosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
    end
    object qryDadosNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'NR_CONHECIMENTO'
      Size = 30
    end
    object qryDadosNUM_CE: TStringField
      FieldName = 'NUM_CE'
      Origin = 'NUM_CE'
    end
    object qryDadosINTEGRAL: TIntegerField
      FieldName = 'INTEGRAL'
      Origin = 'INTEGRAL'
    end
    object qryDadosISENCAO: TIntegerField
      FieldName = 'ISENCAO'
      Origin = 'ISENCAO'
    end
    object qryDadosSUSPENSAO: TIntegerField
      FieldName = 'SUSPENSAO'
      Origin = 'SUSPENSAO'
    end
    object qryDadosCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qryDadosCGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'CGC_EMPRESA'
      Size = 14
    end
    object qryDadosCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qryDadosNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'NM_GRUPO'
      Size = 50
    end
    object qryDadosCD_TP_ISENCAO: TStringField
      FieldName = 'CD_TP_ISENCAO'
      Origin = 'CD_TP_ISENCAO'
      FixedChar = True
      Size = 4
    end
    object qryDadosCD_TP_SUSPENSAO: TStringField
      FieldName = 'CD_TP_SUSPENSAO'
      Origin = 'CD_TP_SUSPENSAO'
      FixedChar = True
      Size = 4
    end
    object qryDadosIC_ISENCAO_PARCIAL: TStringField
      FieldName = 'IC_ISENCAO_PARCIAL'
      Origin = 'IC_ISENCAO_PARCIAL'
      FixedChar = True
      Size = 4
    end
    object qryDadosQT_PESO_ISENCAO: TBCDField
      FieldName = 'QT_PESO_ISENCAO'
      Origin = 'QT_PESO_ISENCAO'
      Precision = 9
      Size = 3
    end
    object qryDadosIC_SUSPENSAO_PARCIAL: TStringField
      FieldName = 'IC_SUSPENSAO_PARCIAL'
      Origin = 'IC_SUSPENSAO_PARCIAL'
      FixedChar = True
      Size = 1
    end
    object qryDadosQT_PESO_SUSPENSAO: TFloatField
      FieldName = 'QT_PESO_SUSPENSAO'
      Origin = 'QT_PESO_SUSPENSAO'
    end
    object qryDadosDT_VENCIMENTO_SUSPENSAO: TSQLTimeStampField
      FieldName = 'DT_VENCIMENTO_SUSPENSAO'
      Origin = 'DT_VENCIMENTO_SUSPENSAO'
    end
    object qryDadosNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Origin = 'NR_BANCO'
      FixedChar = True
      Size = 3
    end
    object qryDadosCD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Origin = 'CD_AGENCIA'
      Size = 5
    end
    object qryDadosNR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'NR_CONTA'
      Size = 10
    end
    object qryDadosSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      DisplayFormat = '##,##0.00'
      EditFormat = '##,##0.00'
      Precision = 15
      Size = 3
    end
    object qryDadosTP_CONTA: TStringField
      FieldName = 'TP_CONTA'
      Origin = 'TP_CONTA'
      FixedChar = True
      Size = 7
    end
    object qryDadosDI_EXTERNA: TStringField
      FieldName = 'DI_EXTERNA'
      Origin = 'DI_EXTERNA'
      FixedChar = True
      Size = 1
    end
    object qryDadosDEFINIR: TIntegerField
      FieldName = 'DEFINIR'
      Origin = 'DEFINIR'
    end
    object qryDadosNR_ATO_CONCESSORIO: TStringField
      FieldName = 'NR_ATO_CONCESSORIO'
      Origin = 'NR_ATO_CONCESSORIO'
      FixedChar = True
      Size = 15
    end
    object qryDadosNACIONALIZACAO: TStringField
      FieldName = 'NACIONALIZACAO'
      Origin = 'NACIONALIZACAO'
      FixedChar = True
      Size = 1
    end
    object qryDadosNR_PARCELA_ENTREPOSTO: TStringField
      FieldName = 'NR_PARCELA_ENTREPOSTO'
      Origin = 'NR_PARCELA_ENTREPOSTO'
      FixedChar = True
      Size = 3
    end
  end
  object qryTemp: TFDQuery
    Connection = dbBroker
    Left = 224
    Top = 24
  end
  object qryInserePagamentoWallet: TFDQuery
    ConnectionName = 'Broker'
    SQL.Strings = (
      'DECLARE @RESULTADO VARCHAR(50)'
      ''
      
        'EXEC SP_INSERE_PGMTO_MERCANTE_WALLET :NR_PROCESSO, :TIPO_CONTA, ' +
        ':USUARIO, :VALOR_DEBITO, @RESULTADO OUTPUT'
      ''
      'SELECT @RESULTADO AS RESULTADO')
    Left = 232
    Top = 96
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'TIPO_CONTA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Name = 'VALOR_DEBITO'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object qryInserePagamentoWalletRESULTADO: TStringField
      FieldName = 'RESULTADO'
      Origin = 'RESULTADO'
      ReadOnly = True
      Size = 50
    end
  end
  object qryLogPgmto: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      
        'INSERT INTO TPAGAMENTO_MERCANTE_LOG (DT_PGMTO, CD_USUARIO, NR_PR' +
        'OCESSO, NUM_CE, TP_PGMTO, TP_ACAO, VL_PGMTO, VL_PESO, CD_TP_ISEN' +
        'CAO, CD_TP_SUSPENSAO, NR_PEDIDO_PGMTO_AFRMM)'
      
        ' VALUES (:DT_PGMTO, :CD_USUARIO, :NR_PROCESSO, :NUM_CE, :TP_PGMT' +
        'O, :TP_ACAO, :VL_PGMTO, :VL_PESO, :CD_TP_ISENCAO, :CD_TP_SUSPENS' +
        'AO, :NR_PEDIDO_PGMTO_AFRMM)')
    Left = 40
    Top = 232
    ParamData = <
      item
        Name = 'DT_PGMTO'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'CD_USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'NUM_CE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'TP_PGMTO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'TP_ACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'VL_PGMTO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'VL_PESO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'CD_TP_ISENCAO'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Name = 'CD_TP_SUSPENSAO'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end
      item
        Name = 'NR_PEDIDO_PGMTO_AFRMM'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end>
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDados'
    OnCalcFields = cdsDadosCalcFields
    Left = 24
    Top = 520
    object cdsDadosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
    end
    object cdsDadosNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Size = 30
    end
    object cdsDadosNUM_CE: TStringField
      FieldName = 'NUM_CE'
    end
    object cdsDadosINTEGRAL: TIntegerField
      FieldName = 'INTEGRAL'
    end
    object cdsDadosISENCAO: TIntegerField
      FieldName = 'ISENCAO'
    end
    object cdsDadosSUSPENSAO: TIntegerField
      FieldName = 'SUSPENSAO'
    end
    object cdsDadosCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object cdsDadosCGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Size = 14
    end
    object cdsDadosCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object cdsDadosNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Size = 50
    end
    object cdsDadosCD_TP_ISENCAO: TStringField
      FieldName = 'CD_TP_ISENCAO'
      FixedChar = True
      Size = 4
    end
    object cdsDadosCD_TP_SUSPENSAO: TStringField
      FieldName = 'CD_TP_SUSPENSAO'
      FixedChar = True
      Size = 4
    end
    object cdsDadosIC_ISENCAO_PARCIAL: TStringField
      FieldName = 'IC_ISENCAO_PARCIAL'
      FixedChar = True
      Size = 4
    end
    object cdsDadosQT_PESO_ISENCAO: TBCDField
      FieldName = 'QT_PESO_ISENCAO'
      Precision = 9
      Size = 3
    end
    object cdsDadosIC_SUSPENSAO_PARCIAL: TStringField
      FieldName = 'IC_SUSPENSAO_PARCIAL'
      FixedChar = True
      Size = 1
    end
    object cdsDadosQT_PESO_SUSPENSAO: TFloatField
      FieldName = 'QT_PESO_SUSPENSAO'
    end
    object cdsDadosDT_VENCIMENTO_SUSPENSAO: TSQLTimeStampField
      FieldName = 'DT_VENCIMENTO_SUSPENSAO'
    end
    object cdsDadosNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      FixedChar = True
      Size = 3
    end
    object cdsDadosCD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Size = 5
    end
    object cdsDadosNR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Size = 10
    end
    object cdsDadosIN_INTEGRAL: TStringField
      FieldKind = fkCalculated
      FieldName = 'IN_INTEGRAL'
      ReadOnly = True
      Size = 1
      Calculated = True
    end
    object cdsDadosIN_ISENCAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'IN_ISENCAO'
      ReadOnly = True
      Size = 1
      Calculated = True
    end
    object cdsDadosIN_SUSPENSAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'IN_SUSPENSAO'
      ReadOnly = True
      Size = 1
      Calculated = True
    end
    object cdsDadosIN_DEFINIR: TStringField
      FieldKind = fkCalculated
      FieldName = 'IN_DEFINIR'
      Size = 1
      Calculated = True
    end
    object cdsDadosSALDO: TBCDField
      FieldName = 'SALDO'
      Precision = 15
      Size = 3
    end
    object cdsDadosTP_CONTA: TStringField
      FieldName = 'TP_CONTA'
      FixedChar = True
      Size = 7
    end
    object cdsDadosDI_EXTERNA: TStringField
      FieldName = 'DI_EXTERNA'
      FixedChar = True
      Size = 1
    end
    object cdsDadosDEFINIR: TIntegerField
      FieldName = 'DEFINIR'
    end
    object cdsDadosNR_ATO_CONCESSORIO: TStringField
      FieldName = 'NR_ATO_CONCESSORIO'
      FixedChar = True
      Size = 15
    end
    object cdsDadosNACIONALIZACAO: TStringField
      FieldName = 'NACIONALIZACAO'
      FixedChar = True
      Size = 1
    end
    object cdsDadosNR_PARCELA_ENTREPOSTO: TStringField
      FieldName = 'NR_PARCELA_ENTREPOSTO'
      FixedChar = True
      Size = 3
    end
  end
  object dspDados: TDataSetProvider
    DataSet = qryDados
    Left = 24
    Top = 448
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 112
    Top = 520
  end
  object dspGrupo: TDataSetProvider
    DataSet = qryGrupo
    Left = 112
    Top = 448
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    Left = 192
    Top = 520
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qryEmpresa
    Left = 192
    Top = 448
  end
  object cdsUnidadeNeg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnidadeNeg'
    Left = 288
    Top = 520
  end
  object dspUnidadeNeg: TDataSetProvider
    DataSet = qryUnidadeNeg
    Left = 288
    Top = 448
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 392
    Top = 520
  end
  object dspProduto: TDataSetProvider
    DataSet = qryProduto
    Left = 392
    Top = 448
  end
  object qryUsuarioWallet: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      '  SELECT B.id , A.CD_USUARIO'
      '    FROM BROKER.DBO.TUSUARIO  A (NOLOCK)'
      
        '    JOIN MYINDAIAV2..AuthUser B (NOLOCK) ON B.username = A.NM_EM' +
        'AIL'
      '   WHERE A.AP_USUARIO= :AP_USUARIO')
    Left = 152
    Top = 24
    ParamData = <
      item
        Name = 'AP_USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
    object qryUsuarioWalletid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object qryUsuarioWalletCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'CD_USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 4
    end
  end
  object qryUpdateNumeroPedidoProcesso: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'UPDATE TPROCESSO '
      '   SET NR_PEDIDO_PGMTO_AFRMM = :NR_PEDIDO_PGMTO_AFRMM'
      ' WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 224
    Top = 232
    ParamData = <
      item
        Name = 'NR_PEDIDO_PGMTO_AFRMM'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end>
  end
  object qryVerificaLogPagamento: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT CD_PGMTO_MERCANTE '
      'FROM TPAGAMENTO_MERCANTE_LOG (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO '
      '  AND NUM_CE   = :NUM_CE'
      '  AND TP_PGMTO = :TP_PGMTO'
      '  AND TP_ACAO  = :TP_ACAO'
      '  AND VL_PGMTO = :VL_PGMTO'
      '  AND CD_USUARIO = :CD_USUARIO')
    Left = 40
    Top = 296
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'NUM_CE'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Name = 'TP_PGMTO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'TP_ACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'VL_PGMTO'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'CD_USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 4
      end>
  end
  object qryVerificaEventoPreenchido: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT DT_REALIZACAO'
      'FROM TFOLLOWUP (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'AND CD_EVENTO = :CD_EVENTO')
    Left = 40
    Top = 168
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'CD_EVENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end>
  end
  object qryVerificaPagamentoWallet: TFDQuery
    ConnectionName = 'Broker'
    SQL.Strings = (
      'IF :TIPO_CONTA = '#39'INDAIA'#39'    '
      'BEGIN'
      #9'SELECT A.ID'
      
        #9'FROM MYINDAIAV2..PAYMENTREQUESTED                      A (NOLOC' +
        'K)'
      
        #9'JOIN MYINDAIAV2..PAYMENTREQUESTED_ITEMPAYMENTREQUESTED B (NOLOC' +
        'K)ON B.PAYMENTREQUESTED_ID = A.id'
      
        #9'JOIN MYINDAIAV2..ITEMPAYMENTREQUESTED                  C (NOLOC' +
        'K)ON C.id = B.items_id'
      
        #9'JOIN MYINDAIAV2..CUSTOMCLEARANCE                       D (NOLOC' +
        'K)ON D.ID = A.CUSTOMCLEARANCE_ID'
      #9'WHERE A.beneficiary_id = 399'
      #9'AND D.customID      = :NR_PROCESSO'
      #9'AND A.user_id       = :USER_ID'
      #9'AND A.PAYMENTTOTAL  = :VALOR_PGMTO'
      #9
      'END'
      'ELSE'
      'BEGIN'
      #9'SELECT A.ID'
      #9'FROM MYINDAIAV2..CASHREQUESTED                      A (NOLOCK)'
      
        #9'JOIN MYINDAIAV2..CASHREQUESTED_ITEMCASHREQUESTED    B (NOLOCK)O' +
        'N B.CASHREQUESTED_ID = A.id'
      
        #9'JOIN MYINDAIAV2..ITEMCASHREQUESTED                  C (NOLOCK)O' +
        'N C.id = B.items_id'
      
        #9'JOIN MYINDAIAV2..CUSTOMCLEARANCE                    D (NOLOCK)O' +
        'N D.ID = A.CUSTOMCLEARANCE_ID'
      
        #9'JOIN BROKER..TPAGAMENTO_MERCANTE_LOG                L (NOLOCK)O' +
        'N L.NR_PROCESSO = D.customID'
      #9'WHERE D.customID   = :NR_PROCESSO'
      #9'AND A.user_id      = :USER_ID'
      #9'AND'#9'C.PRICE = :VALOR_PGMTO'#9
      'END')
    Left = 232
    Top = 160
    ParamData = <
      item
        Name = 'TIPO_CONTA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'USER_ID'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'VALOR_PGMTO'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object qryVerificaNumeroPedidoProcesso: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT NR_PEDIDO_PGMTO_AFRMM '
      'FROM TPROCESSO '
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 224
    Top = 296
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end>
  end
  object qryVerificaArquivoDigitalizado: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT NM_ARQUIVO'
      '  FROM TPROCESSO_DOCTOS'
      ' WHERE CD_TIPO_DOCTO      = '#39'152'#39
      '   AND CD_USUARIO_CRIACAO = '#39'0707'#39
      '   AND NR_PROCESSO        = :NR_PROCESSO'
      '   AND NM_DESCRICAO       = :DS_ARQUIVO')
    Left = 392
    Top = 296
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'DS_ARQUIVO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
  end
  object dsDIExterna: TDataSource
    DataSet = cdsDIExterna
    Left = 350
    Top = 233
  end
  object qryDIExterna: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT *'
      '  FROM TPAGAMENTO_MERCANTE_SEM_DI'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 352
    Top = 32
    ParamData = <
      item
        Position = 1
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end>
    object qryDIExternaCD_PGMTO_SEM_DI: TFDAutoIncField
      DisplayLabel = 'Chave'
      FieldName = 'CD_PGMTO_SEM_DI'
      Origin = 'CD_PGMTO_SEM_DI'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryDIExternaNR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryDIExternaNR_CONHECIMENTO: TStringField
      DisplayLabel = 'Conhecimento'
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'NR_CONHECIMENTO'
      Size = 30
    end
    object qryDIExternaNUM_CE: TStringField
      DisplayLabel = 'CE Mercante'
      FieldName = 'NUM_CE'
      Origin = 'NUM_CE'
    end
    object qryDIExternaTP_PGMTO: TIntegerField
      DisplayLabel = 'Tipo Pagamento'
      FieldName = 'TP_PGMTO'
      Origin = 'TP_PGMTO'
    end
    object qryDIExternaNR_PARCELA_ENTREPOSTO: TIntegerField
      DisplayLabel = 'Nr Parcela Entreposto'
      FieldName = 'NR_PARCELA_ENTREPOSTO'
      Origin = 'NR_PARCELA_ENTREPOSTO'
    end
    object qryDIExternaCD_TP_ISENCAO: TStringField
      DisplayLabel = 'Tipo Isen'#231#227'o'
      FieldName = 'CD_TP_ISENCAO'
      Origin = 'CD_TP_ISENCAO'
      FixedChar = True
      Size = 4
    end
    object qryDIExternaCD_TP_SUSPENSAO: TStringField
      DisplayLabel = 'Tipo Suspens'#227'o'
      FieldName = 'CD_TP_SUSPENSAO'
      Origin = 'CD_TP_SUSPENSAO'
      FixedChar = True
      Size = 4
    end
    object qryDIExternaIC_ISENCAO_PARCIAL: TStringField
      DisplayLabel = 'Isen'#231#227'o Parcial'
      FieldName = 'IC_ISENCAO_PARCIAL'
      Origin = 'IC_ISENCAO_PARCIAL'
      FixedChar = True
      Size = 4
    end
    object qryDIExternaQT_PESO_ISENCAO: TBCDField
      DisplayLabel = 'Peso Isen'#231#227'o'
      FieldName = 'QT_PESO_ISENCAO'
      Origin = 'QT_PESO_ISENCAO'
      Precision = 9
      Size = 3
    end
    object qryDIExternaIC_SUSPENSAO_PARCIAL: TStringField
      DisplayLabel = 'Suspens'#227'o Parcial'
      FieldName = 'IC_SUSPENSAO_PARCIAL'
      Origin = 'IC_SUSPENSAO_PARCIAL'
      FixedChar = True
      Size = 1
    end
    object qryDIExternaQT_PESO_SUSPENSAO: TFloatField
      DisplayLabel = 'Peso Suspens'#227'o'
      FieldName = 'QT_PESO_SUSPENSAO'
      Origin = 'QT_PESO_SUSPENSAO'
    end
    object qryDIExternaDT_VENCIMENTO_SUSPENSAO: TSQLTimeStampField
      DisplayLabel = 'Vencimento Suspens'#227'o'
      FieldName = 'DT_VENCIMENTO_SUSPENSAO'
      Origin = 'DT_VENCIMENTO_SUSPENSAO'
    end
    object qryDIExternaNR_ATO_CONCESSORIO: TStringField
      DisplayLabel = 'Nr Ato Concess'#243'rio'
      FieldName = 'NR_ATO_CONCESSORIO'
      Origin = 'NR_ATO_CONCESSORIO'
      FixedChar = True
      Size = 15
    end
  end
  object cdsDIExterna: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end>
    ProviderName = 'dspDIExterna'
    OnReconcileError = cdsDIExternaReconcileError
    Left = 352
    Top = 168
    object cdsDIExternaCD_PGMTO_SEM_DI: TAutoIncField
      DisplayLabel = 'Chave'
      FieldName = 'CD_PGMTO_SEM_DI'
      ReadOnly = True
    end
    object cdsDIExternaNR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object cdsDIExternaNR_CONHECIMENTO: TStringField
      DisplayLabel = 'Conhecimento'
      FieldName = 'NR_CONHECIMENTO'
      Size = 30
    end
    object cdsDIExternaNUM_CE: TStringField
      DisplayLabel = 'CE Mercante'
      FieldName = 'NUM_CE'
    end
    object cdsDIExternaTP_PGMTO: TIntegerField
      DisplayLabel = 'Tipo Pagamento'
      FieldName = 'TP_PGMTO'
    end
    object cdsDIExternaNR_PARCELA_ENTREPOSTO: TIntegerField
      DisplayLabel = 'Nr Parcela Entreposto'
      FieldName = 'NR_PARCELA_ENTREPOSTO'
    end
    object cdsDIExternaCD_TP_ISENCAO: TStringField
      DisplayLabel = 'Tipo Isen'#231#227'o'
      FieldName = 'CD_TP_ISENCAO'
      FixedChar = True
      Size = 4
    end
    object cdsDIExternaCD_TP_SUSPENSAO: TStringField
      DisplayLabel = 'Tipo Suspens'#227'o'
      FieldName = 'CD_TP_SUSPENSAO'
      FixedChar = True
      Size = 4
    end
    object cdsDIExternaIC_ISENCAO_PARCIAL: TStringField
      DisplayLabel = 'Isen'#231#227'o Parcial'
      FieldName = 'IC_ISENCAO_PARCIAL'
      FixedChar = True
      Size = 4
    end
    object cdsDIExternaQT_PESO_ISENCAO: TBCDField
      DisplayLabel = 'Peso Isen'#231#227'o'
      FieldName = 'QT_PESO_ISENCAO'
      Precision = 9
      Size = 3
    end
    object cdsDIExternaIC_SUSPENSAO_PARCIAL: TStringField
      DisplayLabel = 'Suspens'#227'o Parcial'
      FieldName = 'IC_SUSPENSAO_PARCIAL'
      FixedChar = True
      Size = 1
    end
    object cdsDIExternaQT_PESO_SUSPENSAO: TFloatField
      DisplayLabel = 'Peso Suspens'#227'o'
      FieldName = 'QT_PESO_SUSPENSAO'
    end
    object cdsDIExternaDT_VENCIMENTO_SUSPENSAO: TSQLTimeStampField
      DisplayLabel = 'Vencimento Suspens'#227'o'
      FieldName = 'DT_VENCIMENTO_SUSPENSAO'
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = '99/99/9999;1;_'
    end
    object cdsDIExternaNR_ATO_CONCESSORIO: TStringField
      DisplayLabel = 'Nr Ato Concess'#243'rio'
      FieldName = 'NR_ATO_CONCESSORIO'
      FixedChar = True
      Size = 15
    end
    object cdsDIExternanmIsencao: TStringField
      DisplayLabel = 'Tipo Isen'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'NomeTipoIsencao'
      LookupDataSet = cdsIsencao
      LookupKeyFields = 'CD_TP_ISENCAO'
      LookupResultField = 'DS_TP_ISENCAO'
      KeyFields = 'CD_TP_ISENCAO'
      Size = 30
      Lookup = True
    end
    object cdsDIExternaNomeTipoSuspensao: TStringField
      DisplayLabel = 'Tipo Suspens'#227'o'
      FieldKind = fkLookup
      FieldName = 'NomeTipoSuspensao'
      LookupDataSet = cdsSuspensao
      LookupKeyFields = 'CD_TP_SUSPENSAO'
      LookupResultField = 'DS_TP_SUSPENSAO'
      KeyFields = 'CD_TP_SUSPENSAO'
      Size = 30
      Lookup = True
    end
  end
  object dspDIExterna: TDataSetProvider
    DataSet = qryDIExterna
    Left = 352
    Top = 96
  end
  object dsIsencao: TDataSource
    DataSet = cdsIsencao
    Left = 486
    Top = 585
  end
  object qryIsencao: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_ISENCAO_AFRMM')
    Left = 488
    Top = 384
    object qryIsencaoCD_TP_ISENCAO: TStringField
      FieldName = 'CD_TP_ISENCAO'
      Origin = 'CD_TP_ISENCAO'
      FixedChar = True
      Size = 4
    end
    object qryIsencaoDS_TP_ISENCAO: TStringField
      FieldName = 'DS_TP_ISENCAO'
      Origin = 'DS_TP_ISENCAO'
      Size = 70
    end
  end
  object cdsIsencao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIsencao'
    Left = 488
    Top = 520
    object cdsIsencaoCD_TP_ISENCAO: TStringField
      FieldName = 'CD_TP_ISENCAO'
      FixedChar = True
      Size = 4
    end
    object cdsIsencaoDS_TP_ISENCAO: TStringField
      FieldName = 'DS_TP_ISENCAO'
      Size = 70
    end
  end
  object dspIsencao: TDataSetProvider
    DataSet = qryIsencao
    Left = 488
    Top = 448
  end
  object dsSuspensao: TDataSource
    DataSet = cdsSuspensao
    Left = 566
    Top = 585
  end
  object qrySuspensao: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT * FROM TTP_SUSPENSAO_AFRMM')
    Left = 568
    Top = 384
    object qrySuspensaoCD_TP_SUSPENSAO: TStringField
      FieldName = 'CD_TP_SUSPENSAO'
      Origin = 'CD_TP_SUSPENSAO'
      FixedChar = True
      Size = 4
    end
    object qrySuspensaoDS_TP_SUSPENSAO: TStringField
      FieldName = 'DS_TP_SUSPENSAO'
      Origin = 'DS_TP_SUSPENSAO'
      Size = 70
    end
  end
  object cdsSuspensao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSuspensao'
    Left = 568
    Top = 520
    object cdsSuspensaoCD_TP_SUSPENSAO: TStringField
      FieldName = 'CD_TP_SUSPENSAO'
      FixedChar = True
      Size = 4
    end
    object cdsSuspensaoDS_TP_SUSPENSAO: TStringField
      FieldName = 'DS_TP_SUSPENSAO'
      Size = 70
    end
  end
  object dspSuspensao: TDataSetProvider
    DataSet = qrySuspensao
    Left = 568
    Top = 448
  end
  object dsDIExternaIsencao: TDataSource
    DataSet = cdsDIExternaIsencao
    Left = 438
    Top = 233
  end
  object cdsDIExternaIsencao: TClientDataSet
    Aggregates = <>
    Filter = 'TP_PGMTO = 2'
    Filtered = True
    Params = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end>
    ProviderName = 'dspDIExterna'
    OnCalcFields = cdsDIExternaIsencaoCalcFields
    Left = 440
    Top = 168
    object AutoIncField1: TAutoIncField
      DisplayLabel = 'Chave'
      FieldName = 'CD_PGMTO_SEM_DI'
      ReadOnly = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object StringField2: TStringField
      DisplayLabel = 'Conhecimento'
      FieldName = 'NR_CONHECIMENTO'
      Size = 30
    end
    object StringField3: TStringField
      DisplayLabel = 'CE Mercante'
      FieldName = 'NUM_CE'
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'Tipo Pagamento'
      FieldName = 'TP_PGMTO'
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'Nr Parcela Entreposto'
      FieldName = 'NR_PARCELA_ENTREPOSTO'
    end
    object StringField4: TStringField
      DisplayLabel = 'Tipo Isen'#231#227'o'
      FieldName = 'CD_TP_ISENCAO'
      FixedChar = True
      Size = 4
    end
    object StringField5: TStringField
      DisplayLabel = 'Tipo Suspens'#227'o'
      FieldName = 'CD_TP_SUSPENSAO'
      FixedChar = True
      Size = 4
    end
    object BCDField1: TBCDField
      DisplayLabel = 'Peso Isen'#231#227'o'
      FieldName = 'QT_PESO_ISENCAO'
      Precision = 9
      Size = 3
    end
    object StringField7: TStringField
      DisplayLabel = 'Suspens'#227'o Parcial'
      FieldName = 'IC_SUSPENSAO_PARCIAL'
      FixedChar = True
      Size = 1
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Peso Suspens'#227'o'
      FieldName = 'QT_PESO_SUSPENSAO'
    end
    object SQLTimeStampField1: TSQLTimeStampField
      DisplayLabel = 'Vencimento Suspens'#227'o'
      FieldName = 'DT_VENCIMENTO_SUSPENSAO'
    end
    object StringField8: TStringField
      DisplayLabel = 'Nr Ato Concess'#243'rio'
      FieldName = 'NR_ATO_CONCESSORIO'
      FixedChar = True
      Size = 15
    end
    object StringField9: TStringField
      DisplayLabel = 'Tipo Isen'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'NomeTipoIsencao'
      LookupDataSet = cdsIsencao
      LookupKeyFields = 'CD_TP_ISENCAO'
      LookupResultField = 'DS_TP_ISENCAO'
      KeyFields = 'CD_TP_ISENCAO'
      Size = 30
      Lookup = True
    end
    object StringField10: TStringField
      DisplayLabel = 'Tipo Suspens'#227'o'
      FieldKind = fkLookup
      FieldName = 'NomeTipoSuspensao'
      LookupDataSet = cdsSuspensao
      LookupKeyFields = 'CD_TP_SUSPENSAO'
      LookupResultField = 'DS_TP_SUSPENSAO'
      KeyFields = 'CD_TP_SUSPENSAO'
      Size = 30
      Lookup = True
    end
    object cdsDIExternaIsencaodsIsencaoParcial: TStringField
      FieldKind = fkCalculated
      FieldName = 'dsIsencaoParcial'
      Size = 3
      Calculated = True
    end
    object cdsDIExternaIsencaoIC_ISENCAO_PARCIAL: TStringField
      DisplayLabel = 'Isen'#231#227'o Parcial'
      FieldName = 'IC_ISENCAO_PARCIAL'
      FixedChar = True
      Size = 4
    end
  end
  object dsDIExternaSuspensao: TDataSource
    DataSet = cdsDIExternaSuspensao
    Left = 534
    Top = 233
  end
  object cdsDIExternaSuspensao: TClientDataSet
    Aggregates = <>
    Filter = 'TP_PGMTO = 3'
    Filtered = True
    Params = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end>
    ProviderName = 'dspDIExterna'
    OnCalcFields = cdsDIExternaSuspensaoCalcFields
    Left = 536
    Top = 168
    object StringField19: TStringField
      DisplayLabel = 'Tipo Isen'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'NomeTipoIsencao'
      LookupDataSet = cdsIsencao
      LookupKeyFields = 'CD_TP_ISENCAO'
      LookupResultField = 'DS_TP_ISENCAO'
      KeyFields = 'CD_TP_ISENCAO'
      Size = 30
      Lookup = True
    end
    object StringField20: TStringField
      DisplayLabel = 'Tipo Suspens'#227'o'
      FieldKind = fkLookup
      FieldName = 'NomeTipoSuspensao'
      LookupDataSet = cdsSuspensao
      LookupKeyFields = 'CD_TP_SUSPENSAO'
      LookupResultField = 'DS_TP_SUSPENSAO'
      KeyFields = 'CD_TP_SUSPENSAO'
      Size = 30
      Lookup = True
    end
    object cdsDIExternaSuspensaodsSuspensaoParcial: TStringField
      FieldKind = fkCalculated
      FieldName = 'dsSuspensaoParcial'
      Size = 3
      Calculated = True
    end
    object cdsDIExternaSuspensaoIC_SUSPENSAO_PARCIAL: TStringField
      DisplayLabel = 'Parcial'
      FieldName = 'IC_SUSPENSAO_PARCIAL'
      FixedChar = True
      Size = 1
    end
    object cdsDIExternaSuspensaoCD_PGMTO_SEM_DI: TAutoIncField
      FieldName = 'CD_PGMTO_SEM_DI'
      ReadOnly = True
    end
    object cdsDIExternaSuspensaoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object cdsDIExternaSuspensaoNR_CONHECIMENTO: TStringField
      DisplayLabel = 'Conhecimento'
      FieldName = 'NR_CONHECIMENTO'
      Size = 30
    end
    object cdsDIExternaSuspensaoNUM_CE: TStringField
      DisplayLabel = 'CE Mercante'
      FieldName = 'NUM_CE'
    end
    object cdsDIExternaSuspensaoTP_PGMTO: TIntegerField
      FieldName = 'TP_PGMTO'
    end
    object cdsDIExternaSuspensaoNR_PARCELA_ENTREPOSTO: TIntegerField
      FieldName = 'NR_PARCELA_ENTREPOSTO'
    end
    object cdsDIExternaSuspensaoCD_TP_ISENCAO: TStringField
      FieldName = 'CD_TP_ISENCAO'
      FixedChar = True
      Size = 4
    end
    object cdsDIExternaSuspensaoCD_TP_SUSPENSAO: TStringField
      FieldName = 'CD_TP_SUSPENSAO'
      FixedChar = True
      Size = 4
    end
    object cdsDIExternaSuspensaoIC_ISENCAO_PARCIAL: TStringField
      FieldName = 'IC_ISENCAO_PARCIAL'
      FixedChar = True
      Size = 4
    end
    object cdsDIExternaSuspensaoQT_PESO_ISENCAO: TBCDField
      FieldName = 'QT_PESO_ISENCAO'
      Precision = 9
      Size = 3
    end
    object cdsDIExternaSuspensaoQT_PESO_SUSPENSAO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'QT_PESO_SUSPENSAO'
    end
    object cdsDIExternaSuspensaoDT_VENCIMENTO_SUSPENSAO: TSQLTimeStampField
      DisplayLabel = 'Vencimento'
      FieldName = 'DT_VENCIMENTO_SUSPENSAO'
    end
    object cdsDIExternaSuspensaoNR_ATO_CONCESSORIO: TStringField
      DisplayLabel = 'Nr Ato Concess'#243'rio'
      FieldName = 'NR_ATO_CONCESSORIO'
      FixedChar = True
      Size = 15
    end
  end
  object dsDIExternaIntegral: TDataSource
    DataSet = cdsDIExternaIntegral
    Left = 630
    Top = 233
  end
  object cdsDIExternaIntegral: TClientDataSet
    Aggregates = <>
    Filter = 'TP_PGMTO = 1'
    Filtered = True
    Params = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end>
    ProviderName = 'dspDIExterna'
    Left = 632
    Top = 168
    object AutoIncField3: TAutoIncField
      DisplayLabel = 'Chave'
      FieldName = 'CD_PGMTO_SEM_DI'
      ReadOnly = True
    end
    object StringField21: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object StringField22: TStringField
      DisplayLabel = 'Conhecimento'
      FieldName = 'NR_CONHECIMENTO'
      Size = 30
    end
    object StringField23: TStringField
      DisplayLabel = 'CE Mercante'
      FieldName = 'NUM_CE'
    end
    object IntegerField5: TIntegerField
      DisplayLabel = 'Tipo Pagamento'
      FieldName = 'TP_PGMTO'
    end
    object IntegerField6: TIntegerField
      DisplayLabel = 'Nr Parcela Entreposto'
      FieldName = 'NR_PARCELA_ENTREPOSTO'
    end
    object StringField24: TStringField
      DisplayLabel = 'Tipo Isen'#231#227'o'
      FieldName = 'CD_TP_ISENCAO'
      FixedChar = True
      Size = 4
    end
    object StringField25: TStringField
      DisplayLabel = 'Tipo Suspens'#227'o'
      FieldName = 'CD_TP_SUSPENSAO'
      FixedChar = True
      Size = 4
    end
    object StringField26: TStringField
      DisplayLabel = 'Isen'#231#227'o Parcial'
      FieldName = 'IC_ISENCAO_PARCIAL'
      FixedChar = True
      Size = 4
    end
    object BCDField3: TBCDField
      DisplayLabel = 'Peso Isen'#231#227'o'
      FieldName = 'QT_PESO_ISENCAO'
      Precision = 9
      Size = 3
    end
    object StringField27: TStringField
      DisplayLabel = 'Suspens'#227'o Parcial'
      FieldName = 'IC_SUSPENSAO_PARCIAL'
      FixedChar = True
      Size = 1
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Peso Suspens'#227'o'
      FieldName = 'QT_PESO_SUSPENSAO'
    end
    object SQLTimeStampField3: TSQLTimeStampField
      DisplayLabel = 'Vencimento Suspens'#227'o'
      FieldName = 'DT_VENCIMENTO_SUSPENSAO'
    end
    object StringField28: TStringField
      DisplayLabel = 'Nr Ato Concess'#243'rio'
      FieldName = 'NR_ATO_CONCESSORIO'
      FixedChar = True
      Size = 15
    end
    object StringField29: TStringField
      DisplayLabel = 'Tipo Isen'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'NomeTipoIsencao'
      LookupDataSet = cdsIsencao
      LookupKeyFields = 'CD_TP_ISENCAO'
      LookupResultField = 'DS_TP_ISENCAO'
      KeyFields = 'CD_TP_ISENCAO'
      Size = 30
      Lookup = True
    end
    object StringField30: TStringField
      DisplayLabel = 'Tipo Suspens'#227'o'
      FieldKind = fkLookup
      FieldName = 'NomeTipoSuspensao'
      LookupDataSet = cdsSuspensao
      LookupKeyFields = 'CD_TP_SUSPENSAO'
      LookupResultField = 'DS_TP_SUSPENSAO'
      KeyFields = 'CD_TP_SUSPENSAO'
      Size = 30
      Lookup = True
    end
  end
  object qryAtualizaSaldoProcesso: TFDQuery
    Connection = dbV2
    SQL.Strings = (
      'EXEC sp_SaldoProcesso :customID')
    Left = 456
    Top = 96
    ParamData = <
      item
        Name = 'CUSTOMID'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end>
  end
  object dbV2: TFDConnection
    ConnectionName = 'MYINDAIAV2'
    Params.Strings = (
      'Database=MYINDAIAV2'
      'User_Name=SA'
      'Password=123'
      'Server=INDAIA10'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 80
    Top = 16
  end
end

object datm_numerario: Tdatm_numerario
  OldCreateOrder = True
  Left = 14
  Top = 123
  Height = 351
  Width = 955
  object dsq_item: TDataSource
    DataSet = qry_item_
    Left = 270
    Top = 16
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT I.CD_ITEM, I.NM_ITEM, I.IN_ATIVO'
      'FROM TITEM I, TTIPO_ITEM T'
      'WHERE I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND T.IN_SOLIC_NUM = '#39'1'#39
      'ORDER BY CD_ITEM')
    Left = 386
    Top = 16
    object qry_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object qry_item_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TITEM.CD_ITEM'
      Size = 1
    end
  end
  object ds_yesno: TDataSource
    DataSet = qry_yesno_
    Left = 270
    Top = 120
  end
  object ds_itens_solinum: TDataSource
    DataSet = qry_itens_solinum_
    Left = 53
    Top = 67
  end
  object qry_itens_solinum_: TQuery
    AfterScroll = qry_itens_solinum_AfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_solinum
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_SOLICITACAO , '
      '               NR_LANCAMENTO , CD_ITEM ,'
      '               CD_TIPO_CALCULO , CD_BANCO ,'
      
        '               VL_ITEM_CALCULADO , VL_SOLICITADO , IN_CANCELADO ' +
        ','
      
        '               CD_STATUS , VL_RECEBIDO , TP_DESTINO, CD_FAVORECI' +
        'DO'
      'FROM TNUMERARIO_ITEM_SOLIC '
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '               NR_SOLICITACAO = :NR_SOLICITACAO'
      '')
    Left = 165
    Top = 67
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptUnknown
      end>
    object qry_itens_solinum_NR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 18
    end
    object qry_itens_solinum_NR_SOLICITACAO: TStringField
      DisplayLabel = 'N'#186' Solic.'
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_SOLICITACAO'
      Size = 3
    end
    object qry_itens_solinum_NR_LANCAMENTO: TStringField
      DisplayLabel = 'Lanc.'
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_LANCAMENTO'
      Size = 3
    end
    object qry_itens_solinum_CD_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'CD_ITEM'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_ITEM'
      Size = 3
    end
    object qry_itens_solinum_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_TIPO_CALCULO'
      Size = 3
    end
    object qry_itens_solinum_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 1
    end
    object qry_itens_solinum_VL_ITEM_CALCULADO: TFloatField
      DisplayLabel = 'Calculado'
      FieldName = 'VL_ITEM_CALCULADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_ITEM_CALCULADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_solinum_VL_SOLICITADO: TFloatField
      DisplayLabel = 'Solicitado'
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_SOLICITADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_solinum_VL_RECEBIDO: TFloatField
      DisplayLabel = 'Recebido'
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_RECEBIDO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object LK_STATUS_ITEM: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'LK_NM_STATUS'
      LookupDataSet = qry_status_numer_
      LookupKeyFields = 'CD_STATUS'
      LookupResultField = 'NM_STATUS'
      KeyFields = 'CD_STATUS'
      Lookup = True
    end
    object qry_itens_solinum_LK_NM_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'LK_NM_ITEM'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 40
      Lookup = True
    end
    object qry_itens_solinum_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 3
    end
    object qry_itens_solinum_LK_ITEM_ATIVO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_ITEM_ATIVO'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'IN_ATIVO'
      KeyFields = 'CD_ITEM'
      Size = 1
      Lookup = True
    end
    object qry_itens_solinum_TP_DESTINO: TStringField
      FieldName = 'TP_DESTINO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 1
    end
    object qry_itens_solinum_LookBanco: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_itens_solinum_LookBancoFav: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBancoFav'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'CD_BANCO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 40
      Lookup = True
    end
    object qry_itens_solinum_LookTpDestino: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTpDestino'
      LookupDataSet = qry_tp_destino_
      LookupKeyFields = 'CD_TP_DESTINO'
      LookupResultField = 'NM_TP_DESTINO'
      KeyFields = 'TP_DESTINO'
      Lookup = True
    end
    object qry_itens_solinum_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 5
    end
    object qry_itens_solinum_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldKind = fkLookup
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_itens_solinum_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 1
    end
  end
  object ds_solinum: TDataSource
    DataSet = qry_solinum_
    Left = 53
    Top = 16
  end
  object qry_solinum_: TQuery
    AfterOpen = qry_solinum_AfterScroll
    AfterScroll = qry_solinum_AfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_SOLICITACAO,  DT_SOLICITACAO, '
      '               CD_USUARIO, CD_STATUS, DT_EMISSAO,'
      '               VL_SOLICITADO, VL_RECEBIDO, CD_BASE_CALCULO'
      'FROM TNUMERARIO'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '               NR_SOLICITACAO < '#39'999'#39)
    Left = 165
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_solinum_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TNUMERARIO.NR_PROCESSO'
      Size = 18
    end
    object qry_solinum_NR_SOLICITACAO: TStringField
      DisplayLabel = 'Solicita'#231#227'o N'#186
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TNUMERARIO.NR_SOLICITACAO'
      Size = 3
    end
    object qry_solinum_DT_SOLICITACAO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_SOLICITACAO'
      Origin = 'TNUMERARIO.DT_SOLICITACAO'
    end
    object qry_solinum_CD_USUARIO: TStringField
      DisplayLabel = 'Solicitante'
      FieldName = 'CD_USUARIO'
      Origin = 'TNUMERARIO.CD_USUARIO'
      Size = 4
    end
    object qry_solinum_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TNUMERARIO.NR_PROCESSO'
      Size = 1
    end
    object qry_solinum_VL_SOLICITADO: TFloatField
      DisplayLabel = 'Vl. Solicitado'
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO.VL_SOLICITADO'
      DisplayFormat = '#0,.00'
    end
    object qry_solinum_VL_RECEBIDO: TFloatField
      DisplayLabel = 'Vl. Recebido'
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO.VL_RECEBIDO'
      DisplayFormat = '#0,.00'
    end
    object qry_solinum_DT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Origin = 'TNUMERARIO.NR_PROCESSO'
    end
    object qry_solinum_CD_BASE_CALCULO: TStringField
      FieldName = 'CD_BASE_CALCULO'
      Origin = 'TNUMERARIO.NR_PROCESSO'
      Size = 1
    end
    object qry_solinum_Look_ap_usuario2: TStringField
      DisplayLabel = 'Solicitante'
      FieldKind = fkLookup
      FieldName = 'Look_ap_usuario'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Lookup = True
    end
    object LK_STATUS_NUMER: TStringField
      FieldKind = fkLookup
      FieldName = 'Status'
      LookupDataSet = qry_status_numer_
      LookupKeyFields = 'CD_STATUS'
      LookupResultField = 'NM_STATUS'
      KeyFields = 'CD_STATUS'
      Lookup = True
    end
  end
  object ds_usuario: TDataSource
    DataSet = qry_usuario_
    Left = 53
    Top = 232
  end
  object sp_atz_numerario: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_numerario'
    Left = 740
    Top = 67
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_solicitacao'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_item'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField2: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_cancela_numerario: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_cancela_numerario'
    Left = 740
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_solicitacao'
        ParamType = ptInput
      end>
    object StringField7: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField8: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM TBANCO')
    Left = 165
    Top = 176
    object qry_banco_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
    object qry_banco_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Origin = 'TBANCO.NM_BANCO'
      Size = 40
    end
  end
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 53
    Top = 176
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG IN '
      '              ( SELECT CD_UNID_NEG '
      '                FROM TUSUARIO_HABILITACAO'
      '                WHERE CD_USUARIO = :CD_USUARIO )')
    Left = 486
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Size = 10
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, AP_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO IN '
      '              ( SELECT CD_PRODUTO'
      '                FROM TUSUARIO_HABILITACAO'
      '                WHERE CD_USUARIO = :CD_USUARIO )')
    Left = 386
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_produto_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Size = 10
    end
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, CD_UNID_NEG, CD_PRODUTO, IN_ATIVO'
      'FROM TUSUARIO_HABILITACAO'
      'WHERE CD_USUARIO = :CD_USUARIO AND'
      '               CD_UNID_NEG = :CD_UNID_NEG AND'
      '               CD_PRODUTO = :CD_PRODUTO'
      ''
      '               ')
    Left = 614
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_usuario_habilitacao_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUSUARIO_HABILITACAO.CD_PRODUTO'
      Size = 2
    end
    object qry_usuario_habilitacao_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO_HABILITACAO.IN_ATIVO'
      Size = 1
    end
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_PRODUTO,'
      '               P.CD_CLIENTE, P.CD_SERVICO, P.IN_LIBERADO,'
      
        '              C.AP_EMPRESA, S.NM_SERVICO, P.IN_PRODUCAO, P.IN_CA' +
        'NCELADO'
      'FROM TPROCESSO P, TEMPRESA_NAC C, TSERVICO S'
      'WHERE (P.CD_CLIENTE *= C.CD_EMPRESA) AND'
      '      (P.CD_SERVICO *= S.CD_SERVICO) AND'
      '      (P.NR_PROCESSO = :NR_PROCESSO)')
    Left = 165
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qry_processo_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_processo_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Size = 50
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Size = 1
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_processo_IN_PRODUCAO: TStringField
      FieldName = 'IN_PRODUCAO'
      Size = 1
    end
    object qry_processo_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Size = 1
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 53
    Top = 120
  end
  object qry_cliente_numerario_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      
        'SELECT N.CD_CLIENTE, N.CD_UNID_NEG, N.CD_PRODUTO, N.CD_SERVICO, ' +
        'N.NR_SOLICITACAO, N.CD_ITEM, C.NM_STORED_PROCEDURE'
      'FROM TCLIENTE_NUMERARIO N, TCALCULO C'
      'WHERE N.CD_CLIENTE = :CD_CLIENTE AND'
      '               N.CD_UNID_NEG = :CD_UNID_NEG AND'
      '               N.CD_PRODUTO = :CD_PRODUTO AND'
      '               N.CD_SERVICO = :CD_SERVICO  AND'
      '               N.TP_CALCULO *= C.CD_CALCULO')
    Left = 614
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
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
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
    object qry_cliente_numerario_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_numerario_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_numerario_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_numerario_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qry_cliente_numerario_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Size = 3
    end
    object qry_cliente_numerario_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TCLIENTE_NUMERARIO.CD_ITEM'
      Size = 3
    end
    object qry_cliente_numerario_NM_STORED_PROCEDURE: TStringField
      FieldName = 'NM_STORED_PROCEDURE'
      Size = 30
    end
  end
  object qry_status_numer_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TTP_STATUS_NUMER')
    Left = 486
    Top = 176
    object qry_status_numer_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TTP_STATUS_NUMER.CD_STATUS'
      Size = 1
    end
    object qry_status_numer_NM_STATUS: TStringField
      FieldName = 'NM_STATUS'
      Origin = 'TTP_STATUS_NUMER.NM_STATUS'
    end
  end
  object sp_calculo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_calc_sda_imp'
    Left = 858
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_item'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@Resultado'
        ParamType = ptInputOutput
        Value = 0.000000000000000000
      end>
    object StringField3: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_calc_padrao: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_calc_padrao'
    Left = 858
    Top = 67
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_solicitacao'
        ParamType = ptInput
      end>
    object StringField5: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField6: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_duplica_numerario: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_duplica_numerario'
    Left = 740
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_solicitacao'
        ParamType = ptInput
      end>
    object StringField9: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField10: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object ds_tp_destino: TDataSource
    DataSet = qry_tp_destino_
    Left = 270
    Top = 67
  end
  object qry_tp_destino_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_TP_DESTINO, NM_TP_DESTINO'
      'FROM TTP_DESTINO')
    Left = 386
    Top = 67
    object qry_tp_destino_CD_TP_DESTINO: TStringField
      FieldName = 'CD_TP_DESTINO'
      Origin = 'TTP_DESTINO.CD_TP_DESTINO'
      Size = 1
    end
    object qry_tp_destino_NM_TP_DESTINO: TStringField
      FieldName = 'NM_TP_DESTINO'
      Origin = 'TTP_DESTINO.NM_TP_DESTINO'
    end
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO, CD_BANCO'
      'FROM TFAVORECIDO'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 386
    Top = 176
    object qry_favorecido_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 5
    end
    object qry_favorecido_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 50
    end
    object qry_favorecido_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TFAVORECIDO.CD_BANCO'
      Size = 3
    end
  end
  object ds_favorecido: TDataSource
    DataSet = qry_favorecido_
    Left = 270
    Top = 176
  end
  object qry_cliente_servico_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CLIENTE , CD_UNID_NEG, CD_PRODUTO, CD_SERVICO,'
      '       CD_BANCO_DEB_CC, CD_BANCO_COM, CD_BANCO_DEB_COM,'
      '       IN_CPMF_NUM'
      'FROM TCLIENTE_SERVICO'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      '      CD_UNID_NEG = :CD_UNID_NEG AND'
      '      CD_PRODUTO = :CD_PRODUTO AND'
      '      CD_SERVICO = :CD_SERVICO')
    Left = 486
    Top = 67
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
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
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
    object qry_cliente_servico_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_servico_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_SERVICO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_servico_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_SERVICO.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_servico_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TCLIENTE_SERVICO.CD_SERVICO'
      Size = 3
    end
    object qry_cliente_servico_CD_BANCO_DEB_CC: TStringField
      FieldName = 'CD_BANCO_DEB_CC'
      Origin = 'TCLIENTE_SERVICO.CD_BANCO_DEB_CC'
      Size = 3
    end
    object qry_cliente_servico_CD_BANCO_COM: TStringField
      FieldName = 'CD_BANCO_COM'
      Origin = 'TCLIENTE_SERVICO.CD_BANCO_COM'
      Size = 3
    end
    object qry_cliente_servico_CD_BANCO_DEB_COM: TStringField
      FieldName = 'CD_BANCO_DEB_COM'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
      Size = 3
    end
    object qry_cliente_servico_IN_CPMF_NUM: TStringField
      FieldName = 'IN_CPMF_NUM'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
      Size = 1
    end
  end
  object sp_atz_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_pagto'
    Left = 740
    Top = 232
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
        Name = '@cd_item'
        ParamType = ptInput
      end>
    object StringField11: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField12: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object qry_log_erro_calculo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE'
      'TLOG_ERRO_CALCULO'
      'WHERE '
      'CD_USUARIO = :CD_USUARIO')
    Left = 486
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object qry_tot_erro_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) TOT_ERRO'
      'FROM TLOG_ERRO_CALCULO'
      'WHERE CD_USUARIO = :CD_USUARIO')
    Left = 486
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object sp_soma_solinum: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_soma_solinum'
    Left = 740
    Top = 16
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
        Name = '@nr_solinum'
        ParamType = ptInput
      end>
    object StringField13: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField14: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, AP_USUARIO'
      'FROM TUSUARIO')
    Left = 165
    Top = 232
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Origin = 'TUSUARIO.AP_USUARIO'
      Size = 15
    end
  end
  object qry_yesno_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO'
      'FROM TYES_NO')
    Left = 386
    Top = 120
    object qry_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Origin = 'TYES_NO.CD_YESNO'
      Size = 1
    end
    object qry_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Origin = 'TYES_NO.TX_YESNO'
      Size = 3
    end
  end
  object sp_atz_num_cpmf: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_num_cpmf'
    Left = 861
    Top = 120
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
        Name = '@nr_solic'
        ParamType = ptInput
      end>
  end
  object qry_item_lanc_: TQuery
    AfterOpen = qry_solinum_AfterScroll
    AfterScroll = qry_solinum_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_ITEM'
      'FROM TNUMERARIO_ITEM_SOLIC'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '               NR_SOLICITACAO =  :NR_SOLICITACAO AND'
      '               CD_ITEM = :CD_ITEM')
    Left = 605
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptInput
      end>
  end
end

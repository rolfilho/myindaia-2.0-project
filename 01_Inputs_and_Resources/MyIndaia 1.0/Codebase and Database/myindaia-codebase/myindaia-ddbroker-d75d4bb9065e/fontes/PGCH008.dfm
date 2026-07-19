object datm_impressao_cheque: Tdatm_impressao_cheque
  Top = 207
  Height = 284
  Width = 781
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 288
    Top = 73
  end
  object ds_favorecido: TDataSource
    DataSet = qry_favorecido_
    Left = 288
    Top = 14
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, AP_FAVORECIDO, NM_FAVORECIDO'
      'FROM TFAVORECIDO')
    Left = 376
    Top = 14
    object qry_favorecido_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 5
    end
    object qry_favorecido_AP_FAVORECIDO: TStringField
      FieldName = 'AP_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 10
    end
    object qry_favorecido_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 50
    end
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TBANCO')
    Left = 376
    Top = 73
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
    object qry_banco_AP_BANCO: TStringField
      FieldName = 'AP_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 10
    end
    object qry_banco_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'TBANCO.NM_BANCO'
      Size = 10
    end
    object qry_banco_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Origin = 'TBANCO.AP_BANCO'
      Size = 5
    end
    object qry_banco_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TBANCO.NR_CONTA'
      Size = 8
    end
    object qry_banco_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TBANCO.CD_AGENCIA'
      Size = 1
    end
    object qry_banco_TP_CONTA: TStringField
      FieldName = 'TP_CONTA'
      Origin = 'TBANCO.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_banco_IN_FINANCEIRO: TStringField
      FieldName = 'IN_FINANCEIRO'
      Origin = 'TBANCO.IN_ATIVO'
      Size = 1
    end
    object qry_banco_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Origin = 'TBANCO.TP_CONTA'
      Size = 3
    end
    object qry_banco_LVALOR: TIntegerField
      FieldName = 'LVALOR'
      Origin = 'TBANCO.IN_FINANCEIRO'
    end
    object qry_banco_CVALOR: TIntegerField
      FieldName = 'CVALOR'
      Origin = 'TBANCO.NR_BANCO'
    end
    object qry_banco_LEXTENSO: TIntegerField
      FieldName = 'LEXTENSO'
      Origin = 'TBANCO.LVALOR'
    end
    object qry_banco_CEXTENSO: TIntegerField
      FieldName = 'CEXTENSO'
      Origin = 'TBANCO.CVALOR'
    end
    object qry_banco_LFAVOR: TIntegerField
      FieldName = 'LFAVOR'
      Origin = 'TBANCO.LEXTENSO'
    end
    object qry_banco_CFAVOR: TIntegerField
      FieldName = 'CFAVOR'
      Origin = 'TBANCO.CEXTENSO'
    end
    object qry_banco_LCIDADE: TIntegerField
      FieldName = 'LCIDADE'
      Origin = 'TBANCO.LFAVOR'
    end
    object qry_banco_CCIDADE: TIntegerField
      FieldName = 'CCIDADE'
      Origin = 'TBANCO.CFAVOR'
    end
    object qry_banco_CDIA: TIntegerField
      FieldName = 'CDIA'
      Origin = 'TBANCO.LCIDADE'
    end
    object qry_banco_CANO: TIntegerField
      FieldName = 'CANO'
      Origin = 'TBANCO.CCIDADE'
    end
    object qry_banco_ANOMASK: TStringField
      FieldName = 'ANOMASK'
      Origin = 'TBANCO.CDIA'
      Size = 4
    end
    object qry_banco_FORMCONT: TBooleanField
      FieldName = 'FORMCONT'
      Origin = 'TBANCO.CANO'
    end
    object qry_banco_LEXTENSO2: TIntegerField
      FieldName = 'LEXTENSO2'
      Origin = 'TBANCO.ANOMASK'
    end
    object qry_banco_CEXTENSO2: TIntegerField
      FieldName = 'CEXTENSO2'
      Origin = 'TBANCO.FORMCONT'
    end
    object qry_banco_CMES: TIntegerField
      FieldName = 'CMES'
      Origin = 'TBANCO.CD_BANCO'
    end
    object qry_banco_LCHEQUE: TIntegerField
      FieldName = 'LCHEQUE'
      Origin = 'TBANCO.CD_BANCO'
    end
    object qry_banco_CCHEQUE: TIntegerField
      FieldName = 'CCHEQUE'
      Origin = 'TBANCO.NM_BANCO'
    end
    object qry_banco_CBANCO: TIntegerField
      FieldName = 'CBANCO'
      Origin = 'TBANCO.NR_CONTA'
    end
    object qry_banco_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TBANCO.AP_BANCO'
      Size = 1
    end
    object qry_banco_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TBANCO.NR_CONTA'
      Size = 3
    end
  end
  object tbl_status_solic_ch_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TSTATUS_SOLIC_CH'
    Left = 688
    Top = 14
    object tbl_status_solic_ch_CODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 1
    end
    object tbl_status_solic_ch_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 25
    end
  end
  object ds_status_solic_ch: TDataSource
    DataSet = tbl_status_solic_ch_
    Left = 556
    Top = 14
  end
  object ds_status_item_solic_ch: TDataSource
    DataSet = tbl_status_item_solic_ch_
    Left = 556
    Top = 73
  end
  object tbl_status_item_solic_ch_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TSTATUS_SOLIC_CH_ITENS'
    Left = 688
    Top = 73
    object tbl_status_item_solic_ch_CODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 1
    end
    object tbl_status_item_solic_ch_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 25
    end
  end
  object ds_status_ch: TDataSource
    DataSet = tbl_status_ch_
    Left = 556
    Top = 131
  end
  object tbl_status_ch_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TSTATUS_CHEQUE'
    Left = 688
    Top = 131
    object tbl_status_ch_CODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 1
    end
    object tbl_status_ch_DESCRICAO: TStringField
      DisplayWidth = 25
      FieldName = 'DESCRICAO'
      Size = 25
    end
  end
  object ds_solic_banco: TDataSource
    AutoEdit = False
    DataSet = qry_solic_banco_
    Left = 44
    Top = 73
  end
  object qry_solic_banco_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_solic_usuarios
    SQL.Strings = (
      'SELECT DISTINCT DT_SOLIC_CH, CD_USUARIO, CD_BANCO'
      'FROM TSOLIC_CHEQUE'
      'WHERE'
      '  ( DT_SOLIC_CH = :DT_SOLIC_CH ) AND'
      '  ( CD_TIPO_LANC = "1" ) AND'
      
        '  ( CD_STATUS_SOLIC_CH = "1" OR CD_STATUS_SOLIC_CH = "3" OR CD_S' +
        'TATUS_SOLIC_CH = "4" ) AND'
      '  ( CD_USUARIO = :CD_USUARIO )')
    Params.Data = {
      010002000B44545F534F4C49435F434800010200300001000A43445F55535541
      52494F0001020030000100}
    Left = 142
    Top = 73
    object qry_solic_banco_CD_BANCO: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_BANCO'
      Size = 3
    end
    object qry_solic_banco_LookBanco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_solic_banco_DT_SOLIC_CH: TStringField
      FieldName = 'DT_SOLIC_CH'
      Size = 10
    end
    object qry_solic_banco_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Size = 4
    end
  end
  object tbl_parametro_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TPARAMETROS'
    Left = 376
    Top = 131
    object tbl_parametro_DT_SOLIC_CH: TDateTimeField
      FieldName = 'DT_SOLIC_CH'
    end
    object tbl_parametro_NR_SOLIC_CH: TIntegerField
      FieldName = 'NR_SOLIC_CH'
      Required = True
    end
    object tbl_parametro_HM_PARA_SOLIC_CH: TStringField
      FieldName = 'HM_PARA_SOLIC_CH'
      Size = 5
    end
    object tbl_parametro_PATH_RELATORIOS: TStringField
      FieldName = 'PATH_RELATORIOS'
      Size = 100
    end
    object tbl_parametro_PATH_SISCOMEX: TStringField
      FieldName = 'PATH_SISCOMEX'
      Size = 100
    end
    object tbl_parametro_PATH_RISC: TStringField
      FieldName = 'PATH_RISC'
      Size = 100
    end
    object tbl_parametro_CD_INSTALACAO: TStringField
      FieldName = 'CD_INSTALACAO'
      Size = 1
    end
    object tbl_parametro_NM_SERVIDOR: TStringField
      FieldName = 'NM_SERVIDOR'
      Size = 15
    end
    object tbl_parametro_NM_CID_CHEQUE: TStringField
      FieldName = 'NM_CID_CHEQUE'
    end
  end
  object ds_solic_ch: TDataSource
    DataSet = qry_solic_ch_
    Left = 44
    Top = 131
  end
  object qry_solic_ch_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_solic_banco
    RequestLive = True
    SQL.Strings = (
      
        'SELECT DT_SOLIC_CH, NR_SOLIC_CH, CD_FAVORECIDO, CD_BANCO, VL_SOL' +
        'IC_CH,'
      'CD_STATUS_SOLIC_CH, CD_STATUS_CHEQUE, IN_EMITIR, NR_CHEQUE'
      'FROM TSOLIC_CHEQUE'
      'WHERE'
      '  ( DT_SOLIC_CH = :DT_SOLIC_CH ) AND'
      '  ( CD_TIPO_LANC = "1" ) AND'
      
        '  ( CD_STATUS_SOLIC_CH = "1" OR CD_STATUS_SOLIC_CH = "3" OR CD_S' +
        'TATUS_SOLIC_CH = "4" ) AND'
      
        '  ( CD_STATUS_CHEQUE = "0" OR CD_STATUS_CHEQUE = "1" OR CD_STATU' +
        'S_CHEQUE = "2" ) AND'
      '  ( CD_BANCO = :CD_BANCO ) AND'
      '  ( CD_USUARIO = :CD_USUARIO)')
    Params.Data = {
      010003000B44545F534F4C49435F434800010200300001000843445F42414E43
      4F00010200300001000A43445F5553554152494F0001020030000100}
    Left = 142
    Top = 131
    object StringField5: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'LookApFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'AP_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object StringField6: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object StringField7: TStringField
      DisplayLabel = 'Status'
      FieldName = 'LookStatus'
      LookupDataSet = tbl_status_ch_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS_CHEQUE'
      Size = 25
      Lookup = True
    end
    object StringField11: TStringField
      FieldName = 'LookApBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'AP_BANCO'
      LookupResultField = 'AP_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 10
      Lookup = True
    end
    object qry_solic_ch_DT_SOLIC_CH: TStringField
      FieldName = 'DT_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE.DT_SOLIC_CH'
      Size = 10
    end
    object qry_solic_ch_NR_SOLIC_CH: TStringField
      FieldName = 'NR_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE.NR_SOLIC_CH'
      Size = 3
    end
    object qry_solic_ch_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TSOLIC_CHEQUE.CD_FAVORECIDO'
      Size = 5
    end
    object qry_solic_ch_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TSOLIC_CHEQUE.CD_BANCO'
      Size = 3
    end
    object qry_solic_ch_VL_SOLIC_CH: TFloatField
      FieldName = 'VL_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE.VL_SOLIC_CH'
      DisplayFormat = '#0,.00'
    end
    object qry_solic_ch_CD_STATUS_SOLIC_CH: TStringField
      FieldName = 'CD_STATUS_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE.CD_STATUS_SOLIC_CH'
      Size = 1
    end
    object qry_solic_ch_CD_STATUS_CHEQUE: TStringField
      FieldName = 'CD_STATUS_CHEQUE'
      Origin = 'TSOLIC_CHEQUE.CD_STATUS_CHEQUE'
      Size = 1
    end
    object qry_solic_ch_IN_EMITIR: TStringField
      FieldName = 'IN_EMITIR'
      Origin = 'TSOLIC_CHEQUE.IN_EMITIR'
      Size = 1
    end
    object qry_solic_ch_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TSOLIC_CHEQUE.NR_CHEQUE'
      Size = 6
    end
    object qry_solic_ch_lookFavorecido: TStringField
      FieldName = 'lookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
  end
  object qry_solic_usuarios_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT DT_SOLIC_CH, CD_USUARIO'
      'FROM TSOLIC_CHEQUE'
      'WHERE'
      '  ( DT_SOLIC_CH = :DT_HOJE ) AND'
      '  ( CD_TIPO_LANC = "1" ) AND'
      
        '  ( CD_STATUS_SOLIC_CH = "1" OR CD_STATUS_SOLIC_CH = "3" OR CD_S' +
        'TATUS_SOLIC_CH = "4" ) AND'
      '    CD_USUARIO IN'
      '    ((SELECT CD_USUARIO'
      '      FROM  TUSUARIO U, TCARGO_DESCENDENTE C'
      '      WHERE U.CD_CARGO = C.CD_DESCENDENTE AND'
      '                     C.CD_CARGO <> C.CD_DESCENDENTE AND'
      '                     C.CD_CARGO = :CD_CARGO ) UNION'
      '     (SELECT :CD_USUARIO))'
      '')
    Params.Data = {
      010003000744545F484F4A4500010200300000000843445F434152474F000102
      00300000000A43445F5553554152494F0001020030000000}
    Left = 142
    Top = 14
    object qry_solic_usuarios_DT_SOLIC_CH: TStringField
      FieldName = 'DT_SOLIC_CH'
      Size = 10
    end
    object qry_solic_usuarios_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object qry_solic_usuarios_lookUsuario: TStringField
      FieldName = 'lookUsuario'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 15
      Lookup = True
    end
  end
  object ds_solic_usuarios: TDataSource
    AutoEdit = False
    DataSet = qry_solic_usuarios_
    Left = 44
    Top = 14
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUSUARIO')
    Left = 288
    Top = 131
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Origin = 'TUSUARIO.NM_USUARIO'
      Size = 15
    end
  end
end

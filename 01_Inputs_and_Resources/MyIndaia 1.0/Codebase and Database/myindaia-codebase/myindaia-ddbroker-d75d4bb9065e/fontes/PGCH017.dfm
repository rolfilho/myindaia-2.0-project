object datm_cheque_avulso: Tdatm_cheque_avulso
  Left = 200
  Top = 108
  Height = 156
  Width = 219
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_BANCO, NM_BANCO, IN_ATIVO, FORMCONT, LVALOR, CVALOR, L' +
        'EXTENSO, CEXTENSO,'
      
        'LFAVOR, CFAVOR, LEXTENSO2, CEXTENSO2, LCIDADE, CCIDADE, CDIA, CM' +
        'ES, CANO, ANOMASK,'
      'LCHEQUE, CCHEQUE, CBANCO, AP_BANCO  '
      'FROM TBANCO'
      'WHERE CD_BANCO = :CD_BANCO')
    Params.Data = {010001000843445F42414E434F0001020030000000}
    Left = 112
    Top = 20
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
    object qry_banco_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TBANCO.IN_ATIVO'
      Size = 1
    end
    object qry_banco_FORMCONT: TBooleanField
      FieldName = 'FORMCONT'
      Origin = 'TBANCO.FORMCONT'
    end
    object qry_banco_LVALOR: TIntegerField
      FieldName = 'LVALOR'
      Origin = 'TBANCO.LVALOR'
    end
    object qry_banco_CVALOR: TIntegerField
      FieldName = 'CVALOR'
      Origin = 'TBANCO.CVALOR'
    end
    object qry_banco_LEXTENSO: TIntegerField
      FieldName = 'LEXTENSO'
      Origin = 'TBANCO.LEXTENSO'
    end
    object qry_banco_CEXTENSO: TIntegerField
      FieldName = 'CEXTENSO'
      Origin = 'TBANCO.CEXTENSO'
    end
    object qry_banco_LFAVOR: TIntegerField
      FieldName = 'LFAVOR'
      Origin = 'TBANCO.LFAVOR'
    end
    object qry_banco_CFAVOR: TIntegerField
      FieldName = 'CFAVOR'
      Origin = 'TBANCO.CFAVOR'
    end
    object qry_banco_LEXTENSO2: TIntegerField
      FieldName = 'LEXTENSO2'
      Origin = 'TBANCO.LEXTENSO2'
    end
    object qry_banco_CEXTENSO2: TIntegerField
      FieldName = 'CEXTENSO2'
      Origin = 'TBANCO.CEXTENSO2'
    end
    object qry_banco_LCIDADE: TIntegerField
      FieldName = 'LCIDADE'
      Origin = 'TBANCO.LCIDADE'
    end
    object qry_banco_CCIDADE: TIntegerField
      FieldName = 'CCIDADE'
      Origin = 'TBANCO.CCIDADE'
    end
    object qry_banco_CDIA: TIntegerField
      FieldName = 'CDIA'
      Origin = 'TBANCO.CDIA'
    end
    object qry_banco_CMES: TIntegerField
      FieldName = 'CMES'
      Origin = 'TBANCO.CMES'
    end
    object qry_banco_CANO: TIntegerField
      FieldName = 'CANO'
      Origin = 'TBANCO.CANO'
    end
    object qry_banco_ANOMASK: TStringField
      FieldName = 'ANOMASK'
      Origin = 'TBANCO.ANOMASK'
      Size = 4
    end
    object qry_banco_LCHEQUE: TIntegerField
      FieldName = 'LCHEQUE'
      Origin = 'TBANCO.LCHEQUE'
    end
    object qry_banco_CCHEQUE: TIntegerField
      FieldName = 'CCHEQUE'
      Origin = 'TBANCO.CCHEQUE'
    end
    object qry_banco_CBANCO: TIntegerField
      FieldName = 'CBANCO'
      Origin = 'TBANCO.CBANCO'
    end
    object qry_banco_AP_BANCO: TStringField
      FieldName = 'AP_BANCO'
      Origin = 'TBANCO.AP_BANCO'
      Size = 10
    end
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO'
      'FROM TFAVORECIDO'
      'WHERE CD_FAVORECIDO = :CD_FAVORECIDO')
    Params.Data = {010001000D43445F4641564F52454349444F0001020030000000}
    Left = 112
    Top = 68
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
  end
  object qry_solic_ch_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_SOLIC_CH, CD_FAVORECIDO, CD_BANCO, VL_SOLIC_CH,'
      'CD_STATUS_SOLIC_CH, CD_STATUS_CHEQUE, IN_EMITIR, NR_CHEQUE'
      'FROM TSOLIC_CHEQUE'
      'WHERE ( DT_SOLIC_CH = :DT_SOLIC_CH ) AND'
      '               ( CD_BANCO = :CD_BANCO ) AND'
      
        '               ( CD_STATUS_SOLIC_CH = '#39'1'#39' OR CD_STATUS_SOLIC_CH ' +
        ' = '#39'3'#39' )  ')
    Params.Data = {
      010002000B44545F534F4C49435F434800010200300001000843445F42414E43
      4F0001020030000100}
    Left = 28
    Top = 20
    object qry_solic_ch_NR_SOLIC_CH: TStringField
      DisplayLabel = 'Solic'
      FieldName = 'NR_SOLIC_CH'
      Size = 3
    end
    object qry_solic_ch_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
    end
    object qry_solic_ch_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Size = 3
    end
    object qry_solic_ch_VL_SOLIC_CH: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_SOLIC_CH'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_ch_IN_EMITIR: TStringField
      FieldName = 'IN_EMITIR'
      Size = 1
    end
    object qry_solic_ch_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'AP_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_solic_ch_LookBanco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_solic_ch_LookStatus: TStringField
      DisplayLabel = 'Status'
      FieldName = 'LookStatus'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS_CHEQUE'
      Size = 25
      Lookup = True
    end
    object qry_solic_ch_CD_STATUS_SOLIC_CH: TStringField
      FieldName = 'CD_STATUS_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE.NR_SOLIC_CH'
      Size = 1
    end
    object qry_solic_ch_CD_STATUS_CHEQUE: TStringField
      FieldName = 'CD_STATUS_CHEQUE'
      Origin = 'TSOLIC_CHEQUE.CD_FAVORECIDO'
      Size = 1
    end
    object qry_solic_ch_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TSOLIC_CHEQUE.NR_SOLIC_CH'
      Size = 6
    end
  end
  object tbl_parametro_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TPARAMETROS'
    Left = 28
    Top = 68
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
    object tbl_parametro_CD_BANCO_CHEQUE: TStringField
      FieldName = 'CD_BANCO_CHEQUE'
      Size = 3
    end
  end
end

object datm_arm_rec: Tdatm_arm_rec
  Left = 167
  Top = 104
  Height = 239
  Width = 520
  object qry_arm_rec_per_: TQuery
    BeforeInsert = qry_arm_rec_per_BeforeInsert
    BeforeEdit = qry_arm_rec_per_BeforeEdit
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TARM_REC_PER '
      'WHERE CD_RECINTO = :CD_RECINTO')
    Params.Data = {010001000A43445F524543494E544F0001020030000000}
    Left = 128
    Top = 24
    object qry_arm_rec_per_CD_RECINTO: TStringField
      FieldName = 'CD_RECINTO'
      Origin = 'TARM_REC_PER.CD_RECINTO'
      Size = 7
    end
    object qry_arm_rec_per_NR_PERCENT: TFloatField
      FieldName = 'NR_PERCENT'
      Origin = 'TARM_REC_PER.CD_RECINTO'
      EditFormat = '#00.0000'
    end
    object qry_arm_rec_per_NR_PERIODO: TIntegerField
      DisplayWidth = 2
      FieldName = 'NR_PERIODO'
      Origin = 'TARM_REC_PER.CD_RECINTO'
      MaxValue = 99
    end
    object qry_arm_rec_per_QT_DIAS: TIntegerField
      DisplayWidth = 2
      FieldName = 'QT_DIAS'
      Origin = 'TARM_REC_PER.NR_PERIODO'
      MaxValue = 99
    end
  end
  object ds_arm_rec_per: TDataSource
    DataSet = qry_arm_rec_per_
    Left = 32
    Top = 24
  end
  object qry_arm_rec_: TQuery
    BeforeInsert = qry_arm_rec_BeforeInsert
    BeforeEdit = qry_arm_rec_BeforeEdit
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TARM_REC')
    Left = 128
    Top = 96
    object qry_arm_rec_CD_RECINTO: TStringField
      FieldName = 'CD_RECINTO'
      Origin = 'TARM_REC.CD_RECINTO'
      Size = 7
    end
    object qry_arm_rec_QT_DIAS: TStringField
      FieldName = 'QT_DIAS'
      Origin = 'TARM_REC.QT_DIAS'
      EditMask = '99;0;_'
      Size = 2
    end
    object qry_arm_rec_IN_FERIADO: TStringField
      FieldName = 'IN_FERIADO'
      Origin = 'TARM_REC.IN_FERIADO'
      Size = 1
    end
    object qry_arm_rec_IN_SABDOM: TStringField
      FieldName = 'IN_SABDOM'
      Origin = 'TARM_REC.IN_SABDOM'
      Size = 1
    end
    object qry_arm_rec_CalcNmRecinto: TStringField
      DisplayWidth = 120
      FieldName = 'CalcNmRecinto'
      LookupDataSet = qry_recinto_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_RECINTO'
      Size = 120
      Lookup = True
    end
  end
  object ds_arm_rec: TDataSource
    DataSet = qry_arm_rec_
    Left = 32
    Top = 96
  end
  object qry_recinto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TREC_ALFANDEGADO')
    Left = 232
    Top = 24
    object qry_recinto_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TREC_ALFANDEGADO.CODIGO'
      Size = 7
    end
    object qry_recinto_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TREC_ALFANDEGADO.DESCRICAO'
      Size = 120
    end
  end
end

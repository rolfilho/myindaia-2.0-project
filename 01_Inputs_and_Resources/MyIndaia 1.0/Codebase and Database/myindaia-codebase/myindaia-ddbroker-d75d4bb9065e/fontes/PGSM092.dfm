object datm_embal: Tdatm_embal
  OldCreateOrder = True
  Left = 306
  Top = 215
  Height = 232
  Width = 301
  object ds_embal: TDataSource
    DataSet = qry_embal_
    Left = 32
    Top = 70
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 120
    Top = 12
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
    object tbl_yesno_IN_YESNO: TBooleanField
      FieldName = 'IN_YESNO'
      Required = True
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 32
    Top = 12
  end
  object qry_embal_: TQuery
    AfterPost = qry_embal_AfterPost
    OnCalcFields = qry_embal_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TEMBALAGEM ORDER BY'
      'NM_EMBALAGEM_S')
    Left = 120
    Top = 70
    object qry_embal_CD_EMBALAGEM: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 4
    end
    object qry_embal_NM_EMBALAGEM_P: TStringField
      DisplayLabel = 'Descri'#231#227'o Plural'
      FieldName = 'NM_EMBALAGEM_P'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 50
    end
    object qry_embal_CD_TIPO: TStringField
      FieldName = 'CD_TIPO'
      Origin = 'TEMBALAGEM.CD_TIPO'
      Size = 1
    end
    object qry_embal_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TEMBALAGEM.IN_ATIVO'
      Size = 1
    end
    object qry_embal_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'look_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_embal_LookTipoEmbal: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTipoEmbal'
      LookupDataSet = qry_tp_embal_
      LookupKeyFields = 'CD_TIPO'
      LookupResultField = 'NM_TIPO'
      KeyFields = 'CD_TIPO'
      Lookup = True
    end
    object qry_embal_NR_COMPRIMENTO: TFloatField
      FieldName = 'NR_COMPRIMENTO'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_embal_NR_ALTURA: TFloatField
      FieldName = 'NR_ALTURA'
      Origin = 'TEMBALAGEM.NM_EMBALAGEM_S'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_embal_NR_PESO: TFloatField
      FieldName = 'NR_PESO'
      Origin = 'TEMBALAGEM.NM_EMBALAGEM_P'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_embal_NR_LARGURA: TFloatField
      FieldName = 'NR_LARGURA'
      Origin = 'TEMBALAGEM.CD_TIPO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_embal_CD_CLASSIF: TFloatField
      FieldName = 'CD_CLASSIF'
      Origin = 'TEMBALAGEM.IN_ATIVO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_embal_CD_EMBALAGEM_SUP: TStringField
      FieldName = 'CD_EMBALAGEM_SUP'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 4
    end
    object qry_embal_QT_EMBALAGEM_SUP: TFloatField
      FieldName = 'QT_EMBALAGEM_SUP'
      Origin = 'TEMBALAGEM.NM_EMBALAGEM_S'
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object qry_embal_NmEmbalagem: TStringField
      FieldKind = fkLookup
      FieldName = 'NmEmbalagem'
      LookupDataSet = qry_embal_2_
      LookupKeyFields = 'CD_EMBALAGEM'
      LookupResultField = 'NM_EMBALAGEM_S'
      KeyFields = 'CD_EMBALAGEM_SUP'
      Size = 60
      Lookup = True
    end
    object qry_embal_CD_EMBALAGEM_CLIENTE: TStringField
      FieldName = 'CD_EMBALAGEM_CLIENTE'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 10
    end
    object qry_embal_NM_DESCR_DETALHADA: TStringField
      FieldName = 'NM_DESCR_DETALHADA'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 50
    end
    object qry_embal_NM_DESCR_DETALHADA_INGLES: TStringField
      FieldName = 'NM_DESCR_DETALHADA_INGLES'
      Origin = 'TEMBALAGEM.NM_EMBALAGEM_S'
      Size = 50
    end
    object qry_embal_NM_DESCR_DETALHADA_ESPANHOL: TStringField
      FieldName = 'NM_DESCR_DETALHADA_ESPANHOL'
      Origin = 'TEMBALAGEM.NM_EMBALAGEM_P'
      Size = 50
    end
    object qry_embal_NM_EMBALAGEM_S: TStringField
      DisplayLabel = 'Descri'#231#227'o Singular'
      FieldName = 'NM_EMBALAGEM_S'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 50
    end
    object qry_embal_CD_UNID_MED_EMB: TStringField
      FieldName = 'CD_UNID_MED_EMB'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 3
    end
    object qry_embal_QT_MERC_EMB: TFloatField
      FieldName = 'QT_MERC_EMB'
      Origin = 'TEMBALAGEM.NM_EMBALAGEM_S'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_embal_LookUnidMedEmb: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookUnidMedEmb'
      Size = 50
      Calculated = True
    end
    object qry_embal_FIESP_Id: TIntegerField
      FieldName = 'FIESP_Id'
      Origin = 'DBBROKER.TEMBALAGEM.FIESP_Id'
    end
  end
  object qry_ult_embal_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(E.CD_EMBALAGEM) ULTIMO'
      'FROM  TEMBALAGEM E')
    Left = 213
    Top = 12
    object qry_ult_embal_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 4
    end
  end
  object qry_tp_embal_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTP_EMBAL')
    Left = 120
    Top = 132
    object qry_tp_embal_CD_TIPO: TStringField
      FieldName = 'CD_TIPO'
      Origin = 'TTP_EMBAL.CD_TIPO'
      Size = 1
    end
    object qry_tp_embal_NM_TIPO: TStringField
      FieldName = 'NM_TIPO'
      Origin = 'TTP_EMBAL.NM_TIPO'
    end
  end
  object ds_tp_embal: TDataSource
    DataSet = qry_tp_embal_
    Left = 32
    Top = 132
  end
  object qry_embal_2_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_EMBALAGEM, NM_EMBALAGEM_S '
      'FROM TEMBALAGEM '
      'ORDER BY NM_EMBALAGEM_S')
    Left = 213
    Top = 70
    object qry_embal_2_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 4
    end
    object qry_embal_2_NM_EMBALAGEM_S: TStringField
      FieldName = 'NM_EMBALAGEM_S'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 50
    end
  end
end

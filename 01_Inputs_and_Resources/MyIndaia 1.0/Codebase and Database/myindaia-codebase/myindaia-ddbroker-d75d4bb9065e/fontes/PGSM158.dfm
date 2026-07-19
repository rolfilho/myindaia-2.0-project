object datm_ncm: Tdatm_ncm
  OldCreateOrder = True
  Left = 1124
  Top = 216
  Height = 208
  Width = 318
  object qry_ncm_: TQuery
    AfterPost = qry_ncm_AfterPost
    OnNewRecord = qry_ncm_NewRecord
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TNCM '
      'ORDER BY'
      'CODIGO')
    Left = 32
    Top = 13
    object qry_ncm_CODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'TNCM.CODIGO'
      EditMask = '9999.99.99-;0;_'
      Size = 8
    end
    object qry_ncm_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'TNCM.DESCRICAO'
      Size = 120
    end
    object qry_ncm_UNIDADE_MEDIDA: TStringField
      DisplayLabel = 'Unidade de medida'
      FieldName = 'UNIDADE_MEDIDA'
      Origin = 'TNCM.UNIDADE_MEDIDA'
      Size = 4
    end
    object qry_ncm_ALIQUOTA_II: TStringField
      DisplayLabel = 'Aliquota II'
      FieldName = 'ALIQUOTA_II'
      Origin = 'TNCM.ALIQUOTA_II'
      Size = 6
    end
    object qry_ncm_DATA_INICIO_VIG_II: TStringField
      DisplayLabel = 'Inicio vig'#234'ncia II'
      FieldName = 'DATA_INICIO_VIG_II'
      Origin = 'TNCM.DATA_INICIO_VIG_II'
      EditMask = '99/99/9999;1;_'
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_II: TStringField
      DisplayLabel = 'Fim vig'#234'ncia II'
      FieldName = 'DATA_FIM_VIG_II'
      Origin = 'TNCM.DATA_FIM_VIG_II'
      EditMask = '99/99/9999;1;_'
      Size = 10
    end
    object qry_ncm_ALIQUOTA_II_MERCOSUL: TStringField
      DisplayLabel = 'Al'#237'quota II Mercosul'
      FieldName = 'ALIQUOTA_II_MERCOSUL'
      Origin = 'TNCM.ALIQUOTA_II_MERCOSUL'
      Size = 6
    end
    object qry_ncm_DATA_INICIO_VIG_II_MSUL: TStringField
      DisplayLabel = 'In'#237'cio vig'#234'ncia II Mercosul'
      FieldName = 'DATA_INICIO_VIG_II_MSUL'
      Origin = 'TNCM.DATA_INICIO_VIG_II_MSUL'
      EditMask = '99/99/9999;1;_'
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_II_MSUL: TStringField
      DisplayLabel = 'Fim vig'#234'ncia II Mercosul'
      FieldName = 'DATA_FIM_VIG_II_MSUL'
      Origin = 'TNCM.DATA_FIM_VIG_II_MSUL'
      EditMask = '99/99/9999;1;_'
      Size = 10
    end
    object qry_ncm_ALIQUOTA_IPI: TStringField
      DisplayLabel = 'Al'#237'quota IPI'
      FieldName = 'ALIQUOTA_IPI'
      Origin = 'TNCM.ALIQUOTA_IPI'
      Size = 6
    end
    object qry_ncm_DATA_INICIO_VIG_IPI: TStringField
      DisplayLabel = 'Inicio vig'#234'ncia IPI'
      FieldName = 'DATA_INICIO_VIG_IPI'
      Origin = 'TNCM.DATA_INICIO_VIG_IPI'
      EditMask = '99/99/9999;1;_'
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_IPI: TStringField
      DisplayLabel = 'Fim vig'#234'ncia IPI'
      FieldName = 'DATA_FIM_VIG_IPI'
      Origin = 'TNCM.DATA_FIM_VIG_IPI'
      EditMask = '99/99/9999;1;_'
      Size = 10
    end
    object qry_ncm_nm_unid_medida: TStringField
      FieldKind = fkLookup
      FieldName = 'nm_unid_medida'
      LookupDataSet = tbl_unid_med_
      LookupKeyFields = 'CD_UNID_MEDIDA'
      LookupResultField = 'NM_UNID_MEDIDA'
      KeyFields = 'UNIDADE_MEDIDA'
      Size = 40
      Lookup = True
    end
    object qry_ncm_ALIQUOTA_PIS_ADVAL: TStringField
      FieldName = 'ALIQUOTA_PIS_ADVAL'
      Origin = 'DBBROKER.TNCM.ALIQUOTA_PIS_ADVAL'
      FixedChar = True
      Size = 6
    end
    object qry_ncm_DATA_INI_VIG_PIS_ADVAL: TStringField
      FieldName = 'DATA_INI_VIG_PIS_ADVAL'
      Origin = 'DBBROKER.TNCM.DATA_INI_VIG_PIS_ADVAL'
      EditMask = '99/99/9999;1;_'
      FixedChar = True
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_PIS_ADVAL: TStringField
      FieldName = 'DATA_FIM_VIG_PIS_ADVAL'
      Origin = 'DBBROKER.TNCM.DATA_FIM_VIG_PIS_ADVAL'
      EditMask = '99/99/9999;1;_'
      FixedChar = True
      Size = 10
    end
    object qry_ncm_ALIQUOTA_COFINS_ADVAL: TStringField
      FieldName = 'ALIQUOTA_COFINS_ADVAL'
      Origin = 'DBBROKER.TNCM.ALIQUOTA_COFINS_ADVAL'
      FixedChar = True
      Size = 6
    end
    object qry_ncm_DATA_INI_VIG_COFINS_ADVAL: TStringField
      FieldName = 'DATA_INI_VIG_COFINS_ADVAL'
      Origin = 'DBBROKER.TNCM.DATA_INI_VIG_COFINS_ADVAL'
      EditMask = '99/99/9999;1;_'
      FixedChar = True
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_COFINS_ADVAL: TStringField
      FieldName = 'DATA_FIM_VIG_COFINS_ADVAL'
      Origin = 'DBBROKER.TNCM.DATA_FIM_VIG_COFINS_ADVAL'
      EditMask = '99/99/9999;1;_'
      FixedChar = True
      Size = 10
    end
    object qry_ncm_ALIQUOTA_GATT: TStringField
      FieldName = 'ALIQUOTA_GATT'
      Origin = 'DBBROKER.TNCM.ALIQUOTA_GATT'
      FixedChar = True
      Size = 6
    end
    object qry_ncm_DATA_INICIO_VIG_GATT: TStringField
      FieldName = 'DATA_INICIO_VIG_GATT'
      Origin = 'DBBROKER.TNCM.DATA_INICIO_VIG_GATT'
      FixedChar = True
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_GATT: TStringField
      FieldName = 'DATA_FIM_VIG_GATT'
      Origin = 'DBBROKER.TNCM.DATA_FIM_VIG_GATT'
      FixedChar = True
      Size = 10
    end
    object qry_ncm_IN_NECESSITA_LI: TStringField
      FieldName = 'IN_NECESSITA_LI'
      Origin = 'DBBROKER.TNCM.IN_NECESSITA_LI'
      FixedChar = True
      Size = 1
    end
    object qry_ncm_IN_ANUENCIA_EXERCITO: TStringField
      FieldName = 'IN_ANUENCIA_EXERCITO'
      Origin = 'DBBROKER.TNCM.IN_ANUENCIA_EXERCITO'
      FixedChar = True
      Size = 1
    end
  end
  object ds_ncm_: TDataSource
    DataSet = qry_ncm_
    Left = 32
    Top = 64
  end
  object tbl_unid_med_: TTable
    DatabaseName = 'DBBROKER'
    Filter = 'IN_ATIVO = '#39'1'#39
    Filtered = True
    TableName = 'TUNID_MEDIDA_BROKER'
    Left = 104
    Top = 13
    object tbl_unid_med_CD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Required = True
      Size = 3
    end
    object tbl_unid_med_NM_UNID_MEDIDA: TStringField
      FieldName = 'NM_UNID_MEDIDA'
      Required = True
      Size = 50
    end
    object tbl_unid_med_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object tbl_unid_med_CD_GIPLITE: TStringField
      FieldName = 'CD_GIPLITE'
      Size = 2
    end
  end
end

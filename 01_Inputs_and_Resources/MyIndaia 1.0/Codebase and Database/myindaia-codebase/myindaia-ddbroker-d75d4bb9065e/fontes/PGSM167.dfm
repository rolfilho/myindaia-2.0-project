object datm_duplica_ct_contabil_gerencial: Tdatm_duplica_ct_contabil_gerencial
  Left = 200
  Top = 108
  Height = 228
  Width = 335
  object sp_duplica_ct_contabil_gerencial: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_duplica_ct_contabil_gerencial'
    Params.Data = {
      0100050006526573756C7404030400000000000001154063645F63745F636F6E
      746162696C5F666F6E74650101020030000000174063645F63745F636F6E7461
      62696C5F64657374696E6F01010200300000000D4063645F6D65735F666F6E74
      6501010200300000000D4063645F616E6F5F666F6E74650101020030000000}
    Left = 211
    Top = 19
  end
  object qry_ct_contabil_unica_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCT_CONTABIL'
      'WHERE  CD_ACESSO+CD_AUX = :CD_ACESSO_AUX'
      'ORDER BY'
      'CD_CT_CONTABIL')
    Params.Data = {010001000D43445F41434553534F5F4155580001020030000000}
    Left = 53
    Top = 20
    object qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      Size = 10
    end
    object qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 40
    end
  end
  object qry_ct_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX '
      'FROM TCT_CONTABIL'
      'WHERE CD_CT_CONTABIL = :CD_CT_CONTABIL'
      'ORDER BY'
      'CD_CT_CONTABIL')
    Params.Data = {010001000E43445F43545F434F4E544142494C0001020030000000}
    Left = 53
    Top = 77
    object qry_ct_contabil_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      Size = 10
    end
    object qry_ct_contabil_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 40
    end
    object qry_ct_contabil_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_ct_contabil_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 3
    end
  end
  object qry_meses_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_MES, NM_MES'
      'FROM TMESES'
      'WHERE CD_MES = :CD_MES')
    Params.Data = {010001000643445F4D45530001020030000000}
    Left = 207
    Top = 77
    object qry_meses_CD_MES: TStringField
      FieldName = 'CD_MES'
      Origin = 'TMESES.CD_MES'
      Size = 2
    end
    object qry_meses_NM_MES: TStringField
      FieldName = 'NM_MES'
      Origin = 'TMESES.NM_MES'
      Size = 10
    end
  end
end

object datm_local_embarque: Tdatm_local_embarque
  OldCreateOrder = True
  Left = 243
  Top = 202
  Height = 283
  Width = 425
  object ds_local_embarque: TDataSource
    DataSet = qry_local_embarque_
    Left = 61
    Top = 32
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUNID_NEG')
    Left = 178
    Top = 94
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
    object qry_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_NEG.IN_ATIVO'
      Size = 1
    end
  end
  object qry_local_embarque_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TLOCAL_EMBARQUE'
      'ORDER BY'
      'DESCRICAO'
      '')
    Left = 61
    Top = 94
    object qry_local_embarque_CODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'TLOCAL_EMBARQUE.CODIGO'
      Size = 4
    end
    object qry_local_embarque_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'TLOCAL_EMBARQUE.DESCRICAO'
      Size = 50
    end
    object qry_local_embarque_CD_UNID_NEG_LOCAL: TStringField
      FieldName = 'CD_UNID_NEG_LOCAL'
      Origin = 'TLOCAL_EMBARQUE.CD_UNID_NEG_LOCAL'
      Size = 2
    end
    object qry_local_embarque_LK_AP_UNID_NEG: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_AP_UNID_NEG'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'AP_UNID_NEG'
      KeyFields = 'CD_UNID_NEG_LOCAL'
      Lookup = True
    end
    object qry_local_embarque_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_local_embarque_CD_UF: TStringField
      FieldName = 'CD_UF'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.CD_UF'
      FixedChar = True
      Size = 2
    end
    object qry_local_embarque_CD_SIGLA: TStringField
      FieldName = 'CD_SIGLA'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.CD_SIGLA'
      FixedChar = True
      Size = 3
    end
    object qry_local_embarque_NM_CIDADE: TStringField
      FieldName = 'NM_CIDADE'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.NM_CIDADE'
      FixedChar = True
      Size = 50
    end
    object qry_local_embarque_FIESP_Id: TIntegerField
      FieldName = 'FIESP_Id'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.FIESP_Id'
    end
  end
  object qry_ult_local_embarque_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CODIGO) AS ULTIMO'
      'FROM TLOCAL_EMBARQUE')
    Left = 178
    Top = 32
    object qry_ult_local_embarque_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TLOCAL_EMBARQUE.CODIGO'
      Size = 4
    end
  end
end

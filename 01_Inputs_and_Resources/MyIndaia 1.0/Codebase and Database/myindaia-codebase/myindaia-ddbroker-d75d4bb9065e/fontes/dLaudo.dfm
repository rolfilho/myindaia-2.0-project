object datm_Laudo: Tdatm_Laudo
  OldCreateOrder = False
  Left = 320
  Top = 213
  Height = 401
  Width = 588
  object ds_laudo_mat_pri: TDataSource
    DataSet = qry_lista_mat_pri_
    Left = 40
    Top = 129
  end
  object ds_lista_mat_pri: TDataSource
    DataSet = qry_lista_mat_pri_
    Left = 40
    Top = 79
  end
  object qry_lista_mat_pri_: TQuery
    CachedUpdates = True
    AfterPost = qry_lista_mat_pri_AfterPost
    AfterDelete = qry_lista_mat_pri_AfterPost
    AfterScroll = qry_lista_mat_pri_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT L.CD_MERCADORIA, L.NR_LAUDO, L.CD_MAT_PRI,'
      'L.VL_INDICE, M.AP_MERCADORIA, L.CD_UN_MED_COMERC,'
      'L.VL_CALCULADO, L.NR_PALAVRAS_CHAVE, L.PERC_PERDA'
      'FROM   TLAUDO_MAT_PRI L'
      'INNER JOIN TMERCADORIA M ON L.CD_MAT_PRI = M.CD_MERCADORIA'
      
        'INNER JOIN TMERCADORIA_EXP M2 ON L.CD_MERCADORIA = M2.CD_MERCADO' +
        'RIA'
      'WHERE'
      '  L.CD_MERCADORIA = :CD_MERCADORIA AND'
      '  L.NR_LAUDO = :NR_LAUDO'
      '  '
      '  ')
    UpdateObject = upd_lista_mat_pri
    Left = 153
    Top = 79
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
        Size = 16
      end
      item
        DataType = ftString
        Name = 'NR_LAUDO'
        ParamType = ptUnknown
        Size = 6
      end>
    object qry_lista_mat_pri_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TLAUDO_MAT_PRI.CD_MERCADORIA'
      Size = 15
    end
    object qry_lista_mat_pri_AP_MERCADORIA: TStringField
      DisplayLabel = 'Mercadoria'
      FieldName = 'AP_MERCADORIA'
      Origin = 'TLAUDO_MAT_PRI.CD_MERCADORIA'
      Size = 25
    end
    object qry_lista_mat_pri_NR_LAUDO: TStringField
      DisplayLabel = 'Laudo N'#186
      FieldName = 'NR_LAUDO'
      Origin = 'TLAUDO_MAT_PRI.NR_LAUDO'
      Size = 5
    end
    object qry_lista_mat_pri_CD_MAT_PRI: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_MAT_PRI'
      Origin = 'TLAUDO_MAT_PRI.CD_MAT_PRI'
      Size = 15
    end
    object qry_lista_mat_pri_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Origin = 'DBBROKER.TLAUDO_MAT_PRI.CD_UN_MED_COMERC'
      FixedChar = True
      Size = 8
    end
    object qry_lista_mat_pri_VL_INDICE: TFloatField
      DisplayLabel = #205'ndice'
      FieldName = 'VL_INDICE'
      Origin = 'DBBROKER.TLAUDO_MAT_PRI.VL_INDICE'
    end
    object fltfld_lista_mat_pri_PERC_PERDA: TFloatField
      FieldName = 'PERC_PERDA'
      Origin = 'DBBROKER.TLAUDO_MAT_PRI.PERC_PERDA'
    end
    object fltfld_lista_mat_pri_VL_CALCULADO: TFloatField
      FieldName = 'VL_CALCULADO'
      Origin = 'DBBROKER.TLAUDO_MAT_PRI.VL_CALCULADO'
    end
    object strngfld_lista_mat_pri_NR_PALAVRAS_CHAVE: TStringField
      FieldName = 'NR_PALAVRAS_CHAVE'
      Origin = 'DBBROKER.TLAUDO_MAT_PRI.NR_PALAVRAS_CHAVE'
      FixedChar = True
      Size = 50
    end
  end
  object qry_ult_laudo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX( NR_LAUDO ) AS NR_LAUDO'
      'FROM   TLAUDO'
      'WHERE  CD_MERCADORIA = :CD_MERCADORIA')
    Left = 308
    Top = 76
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
  end
  object qry_laudo_mat_pri_: TQuery
    AfterInsert = qry_laudo_mat_pri_AfterInsert
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TLAUDO_MAT_PRI M'
      'WHERE  M.CD_MERCADORIA = :CD_MERCADORIA AND'
      '       M.NR_LAUDO = :NR_LAUDO ')
    Left = 153
    Top = 129
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LAUDO'
        ParamType = ptUnknown
      end>
    object qry_laudo_mat_pri_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TLAUDO_MAT_PRI.CD_MERCADORIA'
      Size = 15
    end
    object qry_laudo_mat_pri_NR_LAUDO: TStringField
      FieldName = 'NR_LAUDO'
      Origin = 'TLAUDO_MAT_PRI.NR_LAUDO'
      Size = 5
    end
    object qry_laudo_mat_pri_CD_MAT_PRI: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_MAT_PRI'
      Origin = 'TLAUDO_MAT_PRI.CD_MAT_PRI'
      Size = 15
    end
    object qry_laudo_mat_pri_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Origin = 'DBBROKER.TLAUDO_MAT_PRI.CD_UN_MED_COMERC'
      FixedChar = True
      Size = 8
    end
    object qry_laudo_mat_pri_VL_INDICE: TFloatField
      DisplayLabel = #205'ndice'
      FieldName = 'VL_INDICE'
      Origin = 'DBBROKER.TLAUDO_MAT_PRI.VL_INDICE'
      DisplayFormat = '#,##0.000000'
      EditFormat = '#,##0.000000'
    end
    object qry_laudo_mat_pri_VL_CALCULADO: TFloatField
      FieldName = 'VL_CALCULADO'
      Origin = 'DBBROKER.TLAUDO_MAT_PRI.VL_CALCULADO'
    end
    object qry_laudo_mat_pri_PERC_PERDA: TFloatField
      DisplayLabel = '% Perda'
      FieldName = 'PERC_PERDA'
      Origin = 'DBBROKER.TLAUDO_MAT_PRI.PERC_PERDA'
      DisplayFormat = '#,##0.000'
      EditFormat = '#,##0.000'
    end
  end
  object upd_lista_mat_pri: TUpdateSQL
    ModifySQL.Strings = (
      'update TLAUDO_MAT_PRI'
      'set'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  NR_LAUDO = :NR_LAUDO,'
      '  CD_MAT_PRI = :CD_MAT_PRI,'
      '  VL_INDICE = :VL_INDICE,'
      '  CD_UN_MED_COMERC = :CD_UN_MED_COMERC,'
      '  VL_CALCULADO = :VL_CALCULADO,'
      '  NR_PALAVRAS_CHAVE = :NR_PALAVRAS_CHAVE,'
      '  PERC_PERDA = :PERC_PERDA'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LAUDO = :OLD_NR_LAUDO and'
      '  CD_MAT_PRI = :OLD_CD_MAT_PRI')
    InsertSQL.Strings = (
      'insert into TLAUDO_MAT_PRI'
      
        '  (CD_MERCADORIA, NR_LAUDO, CD_MAT_PRI, VL_INDICE, CD_UN_MED_COM' +
        'ERC, VL_CALCULADO, '
      '   NR_PALAVRAS_CHAVE, PERC_PERDA)'
      'values'
      
        '  (:CD_MERCADORIA, :NR_LAUDO, :CD_MAT_PRI, :VL_INDICE, :CD_UN_ME' +
        'D_COMERC, '
      '   :VL_CALCULADO, :NR_PALAVRAS_CHAVE, :PERC_PERDA)')
    DeleteSQL.Strings = (
      'delete from TLAUDO_MAT_PRI'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LAUDO = :OLD_NR_LAUDO and'
      '  CD_MAT_PRI = :OLD_CD_MAT_PRI')
    Left = 232
    Top = 80
  end
  object upd_laudo: TUpdateSQL
    ModifySQL.Strings = (
      'update TLAUDO'
      'set'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  NR_LAUDO = :NR_LAUDO,'
      '  NR_DESCR_MERC = :NR_DESCR_MERC'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LAUDO = :OLD_NR_LAUDO and'
      '  NR_DESCR_MERC = :OLD_NR_DESCR_MERC')
    InsertSQL.Strings = (
      'insert into TLAUDO'
      '  (CD_MERCADORIA, NR_LAUDO, NR_DESCR_MERC)'
      'values'
      '  (:CD_MERCADORIA, :NR_LAUDO, :NR_DESCR_MERC)')
    DeleteSQL.Strings = (
      'delete from TLAUDO'
      'where'
      '  CD_MERCADORIA = :OLD_CD_MERCADORIA and'
      '  NR_LAUDO = :OLD_NR_LAUDO and'
      '  NR_DESCR_MERC = :OLD_NR_DESCR_MERC')
    Left = 232
    Top = 32
  end
  object qry_Laudo_: TQuery
    CachedUpdates = True
    AfterPost = qry_Laudo_AfterPost
    AfterDelete = qry_Laudo_AfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MERCADORIA, NR_LAUDO, NR_DESCR_MERC'
      'FROM   TLAUDO'
      'WHERE  CD_MERCADORIA = :CD_MERCADORIA')
    UpdateObject = upd_laudo
    Left = 152
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptInput
      end>
    object qry_Laudo_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TLAUDO.CD_MERCADORIA'
      FixedChar = True
      Size = 15
    end
    object qry_Laudo_NR_LAUDO: TStringField
      FieldName = 'NR_LAUDO'
      Origin = 'DBBROKER.TLAUDO.NR_LAUDO'
      FixedChar = True
      Size = 5
    end
    object qry_Laudo_NR_DESCR_MERC: TStringField
      FieldName = 'NR_DESCR_MERC'
      Origin = 'DBBROKER.TLAUDO.NR_DESCR_MERC'
      FixedChar = True
      Size = 50
    end
  end
  object ds_Laudo: TDataSource
    DataSet = qry_Laudo_
    Left = 40
    Top = 24
  end
end

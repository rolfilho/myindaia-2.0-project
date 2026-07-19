object datm_modulo: Tdatm_modulo
  OldCreateOrder = True
  Left = 348
  Top = 153
  Height = 350
  Width = 547
  object ds_modulo: TDataSource
    DataSet = qry_modulo_
    Left = 124
    Top = 81
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 32
    Top = 20
  end
  object ds_modulo_rotina: TDataSource
    DataSet = qry_modulo_rotina_
    Left = 235
    Top = 81
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 32
    Top = 81
  end
  object qry_modulo_: TQuery
    AfterCancel = qry_modulo_AfterScroll
    AfterScroll = qry_modulo_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TMODULO ORDER BY'
      'NM_MODULO')
    Left = 124
    Top = 20
    object qry_modulo_CD_MODULO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_MODULO'
      Origin = 'TMODULO.CD_MODULO'
      Size = 2
    end
    object qry_modulo_NM_MODULO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_MODULO'
      Origin = 'TMODULO.NM_MODULO'
      Size = 60
    end
    object qry_modulo_AP_MODULO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_MODULO'
      Origin = 'TMODULO.AP_MODULO'
      Size = 3
    end
  end
  object qry_modulo_rotina_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT MR.*'
      'FROM  TMODULO_ROTINA MR'
      'WHERE (MR.CD_MODULO =:CD_MODULO )')
    Left = 235
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MODULO'
        ParamType = ptUnknown
      end>
    object qry_modulo_rotina_CD_MODULO: TStringField
      FieldName = 'CD_MODULO'
      Origin = 'TMODULO_ROTINA.CD_MODULO'
      Size = 2
    end
    object qry_modulo_rotina_CD_ROTINA: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_ROTINA'
      Origin = 'TMODULO_ROTINA.CD_ROTINA'
      Size = 4
    end
    object qry_modulo_rotina_NM_ROTINA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_ROTINA'
      Origin = 'TMODULO_ROTINA.NM_ROTINA'
      Size = 50
    end
    object qry_modulo_rotina_look_nm_modulo: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_modulo'
      LookupDataSet = qry_modulo_
      LookupKeyFields = 'CD_MODULO'
      LookupResultField = 'NM_MODULO'
      KeyFields = 'CD_MODULO'
      Size = 50
      Lookup = True
    end
    object qry_modulo_rotina_NM_MENU: TStringField
      FieldName = 'NM_MENU'
      Origin = 'DBBROKER.TMODULO_ROTINA.NM_MENU'
      FixedChar = True
      Size = 50
    end
    object qry_modulo_rotina_NM_FORM: TStringField
      FieldName = 'NM_FORM'
      Origin = 'DBBROKER.TMODULO_ROTINA.NM_FORM'
      FixedChar = True
      Size = 50
    end
  end
  object qry_ult_modulo_rotina_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL(MAX(CD_ROTINA),'#39'0000'#39') ULTIMO'
      '    FROM  TMODULO_ROTINA'
      '    WHERE (CD_MODULO =:CD_MODULO)')
    Left = 356
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MODULO'
        ParamType = ptUnknown
      end>
    object qry_ult_modulo_rotina_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TMODULO_ROTINA.CD_ROTINA'
      Size = 4
    end
  end
  object sp_atz_controle_acesso: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_controle_acesso'
    Left = 356
    Top = 81
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end>
  end
end

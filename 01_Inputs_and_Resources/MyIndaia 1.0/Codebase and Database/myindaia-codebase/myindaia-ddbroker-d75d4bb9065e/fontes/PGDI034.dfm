object datm_DI_adicao_com_LI: Tdatm_DI_adicao_com_LI
  OldCreateOrder = True
  Left = 369
  Top = 168
  Height = 223
  Width = 290
  object db_ri: TDatabase
    AliasName = 'LI'
    DatabaseName = 'REGIMP'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SA'
      'PASSWORD=123')
    SessionName = 'Default'
    Left = 48
    Top = 28
  end
  object qry_li_browse_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_OPER_TRAT_PREV, DT_REG_OPER_TRAT, NM_FORN_ESTR'
      'FROM   OPERA'#199#195'O_COM_TRATAMENTO'
      'ORDER BY'
      'CONVERT( datetime, DT_REG_OPER_TRAT, 103)')
    Left = 168
    Top = 95
    object qry_li_browse_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      EditMask = '99/9999999-9;0;'
      Size = 10
    end
    object qry_li_browse_DT_REG_OPER_TRAT: TStringField
      FieldName = 'DT_REG_OPER_TRAT'
      Size = 10
    end
    object qry_li_browse_NM_FORN_ESTR: TStringField
      FieldName = 'NM_FORN_ESTR'
      Size = 60
    end
  end
  object ds_li: TDataSource
    DataSet = qry_li_browse_
    Left = 48
    Top = 96
  end
  object sp_di_adicao_com_li: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_adicao_com_li'
    Left = 167
    Top = 29
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = '@cd_prod'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = '@nr_li'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftDateTime
        Name = '@dt_registro'
        ParamType = ptInput
        Value = 0d
      end>
    object sp_di_adicao_com_liStringField3: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object sp_di_adicao_com_liStringField4: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
end

object datm_consulta_li: Tdatm_consulta_li
  Left = 157
  Top = 148
  Height = 144
  Width = 216
  object qry_li_: TQuery
    OnCalcFields = qry_li_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT  L.NR_PROCESSO, L.CD_IMPORTADOR, E.AP_EMPRESA, L.DT_PROCE' +
        'SSO_LI, L.NR_REGISTRO_LI, L.DT_REGISTRO_LI'
      'FROM TLICENCA_IMPORTACAO L,'
      'TEMPRESA_NAC E'
      'WHERE L.CD_IMPORTADOR *= E.CD_EMPRESA'
      'ORDER BY'
      'L.NR_PROCESSO'
      '')
    Left = 104
    Top = 32
    object qry_li_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
    end
    object qry_li_NR_REGISTRO_LI: TStringField
      DisplayLabel = 'N'#186' Registro'
      FieldName = 'NR_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.NR_REGISTRO_LI'
      EditMask = '!99/9999999-9;0;'
      Size = 10
    end
    object qry_li_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TLICENCA_IMPORTACAO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_li_DT_PROCESSO_LI: TDateTimeField
      DisplayLabel = 'Data Abertura'
      FieldName = 'DT_PROCESSO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_PROCESSO_LI'
    end
    object qry_li_DT_REGISTRO_LI: TDateTimeField
      DisplayLabel = 'Data Registro'
      FieldName = 'DT_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_REGISTRO_LI'
    end
    object qry_li_calc_nr_proc: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldKind = fkCalculated
      FieldName = 'calc_nr_proc'
      Calculated = True
    end
    object qry_li_AP_EMPRESA: TStringField
      DisplayLabel = 'Importador'
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
  end
  object ds_li: TDataSource
    DataSet = qry_li_
    Left = 24
    Top = 32
  end
end

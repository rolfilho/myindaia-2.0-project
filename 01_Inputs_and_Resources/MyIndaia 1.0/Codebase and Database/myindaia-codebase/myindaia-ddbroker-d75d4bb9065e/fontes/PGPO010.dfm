object datm_consulta_po: Tdatm_consulta_po
  Left = 200
  Top = 104
  Height = 167
  Width = 234
  object ds_po: TDataSource
    DataSet = qry_po_
    Left = 40
    Top = 40
  end
  object qry_po_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT  P.NR_PROCESSO, P.CD_IMPORTADOR, E.AP_EMPRESA, P.DT_ABERT' +
        'URA, NR_DA'
      'FROM TPO P,'
      'TEMPRESA_NAC E'
      'WHERE P.CD_IMPORTADOR *= E.CD_EMPRESA AND'
      'ISNULL( NR_DA, '#39#39' ) = '#39#39
      'ORDER BY'
      'P.NR_PROCESSO'
      '')
    Left = 136
    Top = 40
    object qry_po_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_po_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Size = 5
    end
    object qry_po_AP_EMPRESA: TStringField
      DisplayLabel = 'Importador'
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_po_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
    end
    object qry_po_NR_DA: TStringField
      DisplayLabel = 'Nº D.A.'
      FieldName = 'NR_DA'
      EditMask = '99/9999999-9;0;_'
      Size = 10
    end
  end
end

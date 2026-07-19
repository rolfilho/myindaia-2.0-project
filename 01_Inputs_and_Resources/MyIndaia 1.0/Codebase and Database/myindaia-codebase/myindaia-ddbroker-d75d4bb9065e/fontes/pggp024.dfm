object datm_consulta_pe: Tdatm_consulta_pe
  Left = 157
  Top = 148
  Height = 144
  Width = 216
  object qry_pe_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT  P.NR_PROCESSO, P.CD_EXPORTADOR, E.AP_EMPRESA, P.DT_REGIS' +
        'TRO_PEDIDO, P.CD_INCOTERM'
      'FROM TPE P,'
      'TEMPRESA_NAC E'
      
        'WHERE P.CD_EXPORTADOR *= E.CD_EMPRESA AND CD_UNID_NEG = :CD_UNID' +
        '_NEG'
      'ORDER BY'
      'P.NR_PROCESSO'
      '')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 104
    Top = 32
    object qry_pe_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_pe_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Size = 5
    end
    object qry_pe_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_pe_DT_REGISTRO_PEDIDO: TDateTimeField
      FieldName = 'DT_REGISTRO_PEDIDO'
    end
    object qry_pe_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Size = 3
    end
  end
  object ds_pe: TDataSource
    DataSet = qry_pe_
    Left = 24
    Top = 32
  end
end

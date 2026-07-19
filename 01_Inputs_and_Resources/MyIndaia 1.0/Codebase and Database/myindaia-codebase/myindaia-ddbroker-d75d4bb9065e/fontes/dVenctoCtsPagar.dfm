object datm_ctaapagar_vencto: Tdatm_ctaapagar_vencto
  OldCreateOrder = True
  Left = 595
  Top = 208
  Height = 150
  Width = 215
  object qry_ctaapagar_vencto_: TQuery
    BeforeClose = qry_ctaapagar_vencto_BeforeScroll
    BeforeScroll = qry_ctaapagar_vencto_BeforeScroll
    AfterScroll = qry_ctaapagar_vencto_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TCTAAPAGAR_VENCTO'
      'WHERE NR_IDENTIFICADOR =:NR_IDENTIFICADOR AND '
      'CD_USUARIO =:CD_USUARIO'
      'ORDER BY NR_CTAAPAGAR')
    Left = 48
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    object qry_ctaapagar_vencto_NR_IDENTIFICADOR: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
      Origin = 'TCTAAPAGAR_VENCTO.NR_IDENTIFICADOR'
    end
    object qry_ctaapagar_vencto_NR_CTAAPAGAR: TStringField
      FieldName = 'NR_CTAAPAGAR'
      Origin = 'TCTAAPAGAR_VENCTO.NR_CTAAPAGAR'
      Size = 3
    end
    object qry_ctaapagar_vencto_DT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
      Origin = 'TCTAAPAGAR_VENCTO.DT_VENCTO'
      EditMask = '!99/99/0000;1; '
    end
  end
  object ds_ctaapagar_vencto: TDataSource
    DataSet = qry_ctaapagar_vencto_
    Left = 47
    Top = 69
  end
end

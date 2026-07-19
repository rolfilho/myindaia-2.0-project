object datm_ct_gerencial: Tdatm_ct_gerencial
  OldCreateOrder = True
  Left = 117
  Top = 104
  Height = 359
  Width = 355
  object ds_ct_gerencial: TDataSource
    DataSet = qry_ct_gerencial_
    Left = 36
    Top = 24
  end
  object qry_ct_gerencial_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TCT_GERENCIAL'
      'WHERE CD_CT_GERENCIAL <> '#39#39
      'ORDER BY'
      'CD_CT_GERENCIAL')
    Left = 137
    Top = 24
    object qry_ct_gerencial_CD_CT_GERENCIAL: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_CT_GERENCIAL'
      Origin = 'TCT_GERENCIAL.CD_CT_GERENCIAL'
      Size = 4
    end
    object qry_ct_gerencial_NM_CT_GERENCIAL: TStringField
      DisplayLabel = 'Conta Gerencial'
      FieldName = 'NM_CT_GERENCIAL'
      Origin = 'TCT_GERENCIAL.NM_CT_GERENCIAL'
    end
  end
  object ds_rateios: TDataSource
    DataSet = qry_rateios
    Left = 44
    Top = 112
  end
  object qry_rateios: TQuery
    AfterOpen = qry_rateiosAfterOpen
    AfterClose = qry_rateiosAfterClose
    AfterScroll = qry_rateiosAfterScroll
    OnCalcFields = qry_rateiosCalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'select * from TRATEIO'
      'order by '
      '  CD_RATEIO')
    Left = 145
    Top = 112
    object qry_rateiosCD_RATEIO: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_RATEIO'
      Origin = 'DBBROKER.TRATEIO.CD_RATEIO'
      FixedChar = True
      Size = 4
    end
    object qry_rateiosNM_RATEIO: TStringField
      DisplayLabel = 'Descri'#231#227'o do rateio'
      FieldName = 'NM_RATEIO'
      Origin = 'DBBROKER.TRATEIO.NM_RATEIO'
      FixedChar = True
      Size = 30
    end
    object qry_rateiosIN_ATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TRATEIO.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_rateioscalcAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkCalculated
      FieldName = 'calcAtivo'
      Calculated = True
    end
  end
  object qry_ult_rateios: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_RATEIO) AS ULTIMO'
      'FROM TRATEIO')
    Left = 260
    Top = 112
    object qry_ult_rateiosULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TRATEIO.CD_RATEIO'
      FixedChar = True
      Size = 4
    end
  end
  object dts_rateio_contas: TDataSource
    DataSet = qry_rateio_contas
    Left = 44
    Top = 184
  end
  object qry_rateio_contas: TQuery
    AfterInsert = qry_rateio_contasAfterInsert
    OnPostError = qry_rateio_contasPostError
    DatabaseName = 'DBBROKER'
    DataSource = ds_rateios
    RequestLive = True
    SQL.Strings = (
      'select * FROM TRATEIO_CONTAS'
      'where '
      '  CD_RATEIO =:CD_RATEIO')
    Left = 145
    Top = 184
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_RATEIO'
        ParamType = ptUnknown
        Size = 5
      end>
    object qry_rateio_contasCD_RATEIO: TStringField
      FieldName = 'CD_RATEIO'
      Origin = 'DBBROKER.TCONTAS_RATEIO.CD_RATEIO'
      FixedChar = True
      Size = 4
    end
    object qry_rateio_contasPERC: TFloatField
      FieldName = 'PERC'
      Origin = 'DBBROKER.TCONTAS_RATEIO.PERC'
    end
    object qry_rateio_contasCD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TRATEIO_CONTAS.CD_CT_CUSTO'
      FixedChar = True
      Size = 25
    end
  end
  object sqlAux: TQuery
    AfterInsert = qry_rateio_contasAfterInsert
    OnPostError = qry_rateio_contasPostError
    DatabaseName = 'DBBROKER'
    Left = 145
    Top = 256
  end
end

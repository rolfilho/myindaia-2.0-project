object datmRelatorioBasico: TdatmRelatorioBasico
  OldCreateOrder = False
  Left = 706
  Top = 248
  Height = 247
  Width = 339
  object dsRelatorios: TDataSource
    DataSet = qryRelatorios
    Left = 40
    Top = 16
  end
  object qryRelatorios: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TRELATORIO_BASICO (NOLOCK)'
      'ORDER BY NM_RELATORIO')
    Left = 151
    Top = 17
    object qryRelatoriosCD_RELATORIO: TAutoIncField
      FieldName = 'CD_RELATORIO'
      Origin = 'DBBROKER.TRELATORIO_BASICO.CD_RELATORIO'
    end
    object qryRelatoriosNM_RELATORIO: TStringField
      FieldName = 'NM_RELATORIO'
      Origin = 'DBBROKER.TRELATORIO_BASICO.NM_RELATORIO'
      FixedChar = True
      Size = 255
    end
    object qryRelatoriosTX_SQL: TMemoField
      FieldName = 'TX_SQL'
      Origin = 'DBBROKER.TRELATORIO_BASICO.TX_SQL'
      BlobType = ftMemo
    end
    object qryRelatoriosNM_CAMPO_FILTRO: TStringField
      FieldName = 'NM_CAMPO_FILTRO'
      Origin = 'DBBROKER.TRELATORIO_BASICO.NM_CAMPO_FILTRO'
      FixedChar = True
      Size = 255
    end
  end
  object qryGeraRelatorio: TQuery
    DatabaseName = 'DBBROKER'
    Left = 151
    Top = 73
  end
end

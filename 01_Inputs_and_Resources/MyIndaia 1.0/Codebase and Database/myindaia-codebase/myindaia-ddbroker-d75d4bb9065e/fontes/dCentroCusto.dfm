object datm_centro_custo: Tdatm_centro_custo
  OldCreateOrder = False
  Left = 383
  Top = 109
  Height = 225
  Width = 237
  object qry_centro_custo_: TQuery
    AfterInsert = qry_centro_custo_AfterInsert
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TCONTABIL_CUSTO'
      'WHERE CD_CT_CUSTO <> '#39#39' and IN_ATIVO = '#39'1'#39'           '
      'ORDER BY'
      'CD_CT_CUSTO')
    Left = 146
    Top = 19
    object qry_centro_custo_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'DBBROKER.TCONTABIL_CUSTO.CD_COLIGADA'
      FixedChar = True
      Size = 2
    end
    object qry_centro_custo_NM_CT_CUSTO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_CT_CUSTO'
      Origin = 'DBBROKER.TCONTABIL_CUSTO.NM_CT_CUSTO'
      FixedChar = True
      Size = 40
    end
    object qry_centro_custo_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TCONTABIL_CUSTO.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_centro_custo_CD_CT_CUSTO2: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TCONTABIL_CUSTO.CD_CT_CUSTO'
      FixedChar = True
      Size = 25
    end
  end
  object ds_centro_custo: TDataSource
    DataSet = qry_centro_custo_
    Left = 44
    Top = 19
  end
  object SqlAux: TQuery
    AfterInsert = qry_centro_custo_AfterInsert
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TCONTABIL_CUSTO'
      'WHERE CD_CT_CUSTO <> '#39#39' and IN_ATIVO = '#39'S'#39
      'ORDER BY'
      'CD_CT_CUSTO')
    Left = 50
    Top = 83
  end
end

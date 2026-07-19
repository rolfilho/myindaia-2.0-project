object datm_de_para: Tdatm_de_para
  OldCreateOrder = True
  Left = 418
  Top = 172
  Height = 310
  Width = 475
  object ds_de_para: TDataSource
    DataSet = qry_de_para_
    Left = 36
    Top = 24
  end
  object qry_de_para_: TQuery
    BeforeInsert = qry_de_para_BeforeEdit
    BeforeEdit = qry_de_para_BeforeEdit
    OnCalcFields = qry_de_para_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TDE_PARA'
      'ORDER BY'
      
        'CD_TABELA                                                       ' +
        '    ')
    Left = 124
    Top = 24
    object qry_de_para_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      Origin = 'TDE_PARA.CD_TABELA'
      Size = 2
    end
    object qry_de_para_CD_DDBROKER: TStringField
      FieldName = 'CD_DDBROKER'
      Origin = 'DBBROKER.TDE_PARA.CD_DDBROKER'
      FixedChar = True
      Size = 6
    end
    object qry_de_para_CalcNmDDBroker: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNmDDBroker'
      Size = 60
      Calculated = True
    end
    object qry_de_para_CD_EXTERNO: TStringField
      FieldName = 'CD_EXTERNO'
      Origin = 'TDE_PARA.CD_TABELA'
      Size = 100
    end
    object qry_de_para_LookTipo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTipo'
      LookupDataSet = qry_ttp_de_para
      LookupKeyFields = 'CD_DE_PARA'
      LookupResultField = 'NM_DE_PARA'
      KeyFields = 'CD_TABELA'
      Lookup = True
    end
    object qry_de_para_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TDE_PARA.CD_UNID_NEG'
      Size = 2
    end
    object qry_de_para_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TDE_PARA.CD_PRODUTO'
      Size = 2
    end
    object qry_de_para_LookNmUnidNeg: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 30
      Lookup = True
    end
    object qry_de_para_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TDE_PARA.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_de_para_LookNmProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 30
      Lookup = True
    end
    object qry_de_para_lookGrupo: TStringField
      FieldKind = fkLookup
      FieldName = 'lookGrupo'
      LookupDataSet = qry_grupo_
      LookupKeyFields = 'CD_GRUPO'
      LookupResultField = 'NM_GRUPO'
      KeyFields = 'CD_GRUPO'
      Size = 5000
      Lookup = True
    end
  end
  object qry_ttp_de_para: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  * '
      'FROM    TTP_DE_PARA'
      'ORDER BY CD_DE_PARA')
    Left = 124
    Top = 100
    object qry_ttp_de_paraCD_DE_PARA: TStringField
      FieldName = 'CD_DE_PARA'
      Origin = 'TTP_DE_PARA.CD_DE_PARA'
      Size = 2
    end
    object qry_ttp_de_paraNM_DE_PARA: TStringField
      FieldName = 'NM_DE_PARA'
      Origin = 'TTP_DE_PARA.CD_DE_PARA'
    end
    object qry_ttp_de_paraNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      Origin = 'DBBROKER.TTP_DE_PARA.NM_TABELA'
      FixedChar = True
      Size = 75
    end
    object qry_ttp_de_paraNM_CHAVE: TStringField
      FieldName = 'NM_CHAVE'
      Origin = 'DBBROKER.TTP_DE_PARA.NM_CHAVE'
      FixedChar = True
      Size = 75
    end
    object qry_ttp_de_paraNM_RETORNO: TStringField
      FieldName = 'NM_RETORNO'
      Origin = 'DBBROKER.TTP_DE_PARA.NM_RETORNO'
      FixedChar = True
      Size = 75
    end
    object qry_ttp_de_paraNM_FILTRO: TStringField
      FieldName = 'NM_FILTRO'
      Origin = 'DBBROKER.TTP_DE_PARA.NM_FILTRO'
      FixedChar = True
      Size = 250
    end
  end
  object ds_ttp_de_para: TDataSource
    DataSet = qry_ttp_de_para
    Left = 36
    Top = 101
  end
  object qry_nm_ddbroker_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '#39#39)
    Left = 327
    Top = 24
  end
  object ds_nm_ddbroker: TDataSource
    DataSet = qry_nm_ddbroker_
    Left = 235
    Top = 24
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 228
    Top = 92
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 228
    Top = 140
  end
  object qry_produto_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO')
    Left = 328
    Top = 140
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_produto_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'TPRODUTO.NM_PRODUTO'
      Size = 40
    end
  end
  object qry_unid_neg_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG FROM'
      'TUNID_NEG')
    Left = 328
    Top = 92
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object ds_grupo: TDataSource
    DataSet = qry_grupo_
    Left = 232
    Top = 192
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO,NM_GRUPO FROM TGRUPO')
    Left = 328
    Top = 192
    object qry_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TGRUPO.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_grupo_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'DBBROKER.TGRUPO.NM_GRUPO'
      FixedChar = True
      Size = 50
    end
  end
end

object datm_cliente_armazem: Tdatm_cliente_armazem
  OldCreateOrder = True
  Left = 364
  Top = 123
  Height = 468
  Width = 442
  object ds_cliente_armazem: TDataSource
    DataSet = qry_cliente_armazem_
    Left = 38
    Top = 12
  end
  object ds_empresa_nac: TDataSource
    DataSet = qry_empresa_nac_
    Left = 38
    Top = 60
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 38
    Top = 108
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 38
    Top = 156
  end
  object ds_servico: TDataSource
    DataSet = qry_servico_
    Left = 38
    Top = 204
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO '
      'FROM TSERVICO')
    Left = 159
    Top = 204
    object qry_servico_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 3
    end
    object qry_servico_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Origin = 'TSERVICO.NM_SERVICO'
      Size = 50
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO')
    Left = 159
    Top = 155
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
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG FROM'
      'TUNID_NEG')
    Left = 159
    Top = 108
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
  object qry_empresa_nac_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC')
    Left = 159
    Top = 60
    object qry_empresa_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object qry_cliente_armazem_: TQuery
    AfterInsert = qry_cliente_armazem_AfterInsert
    OnCalcFields = qry_cliente_armazem_CalcFields
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM '
      'TCLIENTE_ARMAZEM'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'CD_SERVICO = :CD_SERVICO')
    Left = 159
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
    object qry_cliente_armazem_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_ARMAZEM.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_armazem_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_ARMAZEM.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_armazem_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_ARMAZEM.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_armazem_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TCLIENTE_ARMAZEM.CD_SERVICO'
      Size = 3
    end
    object qry_cliente_armazem_CD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'TCLIENTE_ARMAZEM.CD_ARMAZEM'
      Size = 4
    end
    object qry_cliente_armazem_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      Origin = 'TCLIENTE_ARMAZEM.CD_CLIENTE'
      Size = 3
    end
    object qry_cliente_armazem_calcArmazem: TStringField
      DisplayLabel = 'Armazem'
      FieldKind = fkCalculated
      FieldName = 'calcArmazem'
      Calculated = True
    end
  end
  object ds_armazem: TDataSource
    DataSet = qry_armazem_
    Left = 43
    Top = 257
  end
  object qry_armazem_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ARMAZEM, NM_ARMAZEM'
      'FROM TARMAZEM')
    Left = 160
    Top = 257
    object qry_armazem_CD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'TARMAZEM.CD_ARMAZEM'
      Size = 4
    end
    object qry_armazem_NM_ARMAZEM: TStringField
      FieldName = 'NM_ARMAZEM'
      Origin = 'TARMAZEM.NM_ARMAZEM'
      Size = 50
    end
  end
  object qry_tabela_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_armazem
    SQL.Strings = (
      'SELECT CD_TABELA, NM_TABELA'
      'FROM TARM_TABELA'
      'WHERE CD_ARMAZEM=:CD_ARMAZEM')
    Left = 160
    Top = 305
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
      end>
    object qry_tabela_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      Origin = 'TARM_TABELA.CD_TABELA'
      Size = 3
    end
    object qry_tabela_NM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      Origin = 'TARM_TABELA.NM_TABELA'
      Size = 50
    end
  end
  object ds_tabela: TDataSource
    DataSet = qry_tabela_
    Left = 51
    Top = 321
  end
  object qry_ver_armazem_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *  FROM TCLIENTE_ARMAZEM'
      'WHERE CD_CLIENTE =:CD_CLIENTE'
      'AND CD_ARMAZEM =:CD_ARMAZEM'
      'AND CD_SERVICO =:CD_SERVICO')
    Left = 168
    Top = 368
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
    object qry_ver_armazem_cliente_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_ARMAZEM.CD_CLIENTE'
      Size = 5
    end
    object qry_ver_armazem_cliente_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_ARMAZEM.CD_UNID_NEG'
      Size = 2
    end
    object qry_ver_armazem_cliente_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_ARMAZEM.CD_PRODUTO'
      Size = 2
    end
    object qry_ver_armazem_cliente_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TCLIENTE_ARMAZEM.CD_SERVICO'
      Size = 3
    end
    object qry_ver_armazem_cliente_CD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'TCLIENTE_ARMAZEM.CD_ARMAZEM'
      Size = 4
    end
    object qry_ver_armazem_cliente_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      Origin = 'TCLIENTE_ARMAZEM.CD_TABELA'
      Size = 3
    end
  end
  object qry_tabela2_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TABELA, NM_TABELA'
      'FROM TARM_TABELA'
      'WHERE CD_ARMAZEM=:CD_ARMAZEM'
      'AND CD_TABELA =:CD_TABELA')
    Left = 240
    Top = 305
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_TABELA'
        ParamType = ptUnknown
      end>
    object qry_tabela2_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      Origin = 'TARM_TABELA.CD_TABELA'
      Size = 3
    end
    object qry_tabela2_NM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      Origin = 'TARM_TABELA.NM_TABELA'
      Size = 50
    end
  end
  object SqlAuxiliar: TQuery
    DatabaseName = 'DBBROKER'
    Left = 352
    Top = 57
  end
end

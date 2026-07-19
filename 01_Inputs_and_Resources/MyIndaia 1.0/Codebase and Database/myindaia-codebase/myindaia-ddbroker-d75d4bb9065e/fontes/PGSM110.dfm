object datm_produto: Tdatm_produto
  OldCreateOrder = True
  Left = 171
  Top = 160
  Height = 347
  Width = 565
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 28
    Top = 72
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 28
    Top = 136
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 122
    Top = 136
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_produto_lista
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPRODUTO '
      'WHERE CD_PRODUTO = :CD_PRODUTO')
    Left = 122
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
        Size = 3
      end>
    object qry_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TPRODUTO.IN_ATIVO'
      Size = 1
    end
    object qry_produto_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'look_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 5
      Lookup = True
    end
    object qry_produto_CD_PRODUTO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_produto_NM_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_PRODUTO'
      Origin = 'TPRODUTO.NM_PRODUTO'
      Size = 40
    end
    object qry_produto_AP_PRODUTO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_PRODUTO'
      Origin = 'TPRODUTO.AP_PRODUTO'
      Size = 10
    end
    object qry_produto_CD_VIATRANSP: TStringField
      FieldName = 'CD_VIATRANSP'
      Origin = 'TPRODUTO.IN_ATIVO'
      Size = 1
    end
    object qry_produto_TP_FAT_SEM_RECEITA: TStringField
      FieldName = 'TP_FAT_SEM_RECEITA'
      Origin = 'TPRODUTO.NM_PRODUTO'
      Size = 1
    end
    object qry_produto_CD_CT_GERENCIAL: TStringField
      FieldName = 'CD_CT_GERENCIAL'
      Origin = 'DBBROKER.TPRODUTO.CD_CT_GERENCIAL'
      FixedChar = True
      Size = 4
    end
    object qry_produto_TP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      Origin = 'DBBROKER.TPRODUTO.TP_PRODUTO'
      FixedChar = True
      Size = 2
    end
  end
  object qry_ult_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_PRODUTO) AS ULTIMO'
      'FROM TPRODUTO')
    Left = 224
    Top = 72
    object qry_ult_produto_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
  end
  object sp_ativar_desativar_produto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.SP_ATIVAR_DESATIVAR_PRODUTO'
    Left = 372
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@IN_ATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@CD_PRODUTO'
        ParamType = ptInput
      end>
  end
  object qry_produto_lista_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TPRODUTO '
      'WHERE ( CD_PRODUTO IN'
      '            ( SELECT CD_PRODUTO'
      '              FROM   TUSUARIO_HABILITACAO'
      
        '              WHERE  CD_USUARIO = :CD_USUARIO AND IN_ATIVO = '#39'1'#39 +
        ' ) ) OR ( :CD_CARGO = '#39'001'#39' )'
      'ORDER BY '
      'CD_PRODUTO')
    Left = 122
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptUnknown
      end>
    object qry_produto_lista_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_produto_lista_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Size = 40
    end
    object qry_produto_lista_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Size = 10
    end
    object qry_produto_lista_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object qry_produto_lista_LK_ATIVO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_ATIVO'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
  end
  object ds_produto_lista: TDataSource
    DataSet = qry_produto_lista_
    Left = 28
    Top = 10
  end
  object sp_inc_produto_usuario: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_inc_produto_usuario;1'
    Left = 372
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_produto'
        ParamType = ptInput
      end>
  end
end

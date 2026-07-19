object datm_imp_receitas_operacionais: Tdatm_imp_receitas_operacionais
  Left = 200
  Top = 108
  Height = 183
  Width = 281
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 60
    Top = 12
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, AP_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO = :CD_PRODUTO')
    Params.Data = {010001000A43445F50524F4455544F0001020030000000}
    Left = 168
    Top = 12
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_produto_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Origin = 'TPRODUTO.AP_PRODUTO'
      Size = 10
    end
  end
  object qry_apaga_dados: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE FROM TREC_DESP_OPERACIONAIS'
      'WHERE IDENTIFICADOR = :IDENTIFICADOR')
    Params.Data = {010001000D4944454E544946494341444F5200030400000000000000}
    Left = 168
    Top = 68
    object StringField1: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
  end
  object sp_cria_dados: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_ordena_cliente_receita'
    Params.Data = {
      0100070006526573756C74040304000000000000000840756E69646164650101
      020030000000084070726F6475746F01010200300000001040706572696F646F
      5F696E696369616C010B080000002C845D40CB4200000E40706572696F646F5F
      66696E616C010B080000002C845D40CB42000006406368617665010102003000
      000011406E725F6964656E746966696361646F7202030400000000000000}
    Left = 60
    Top = 68
  end
end

object datm_duplica_unid: Tdatm_duplica_unid
  Left = 200
  Top = 108
  Height = 222
  Width = 321
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 36
    Top = 32
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
  object sp_duplica_unid: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_duplica_unidade'
    Params.Data = {
      0100040006526573756C74040304000000000000010E4063645F756E69645F61
      7475616C01010200300000000C4063645F756E69645F6E657701010200300000
      000B4074705F726570617373610105020000000000}
    Left = 143
    Top = 28
  end
  object qry_usuario_habilitacao_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG IN'
      '              ( SELECT CD_UNID_NEG'
      '                FROM   TUSUARIO_HABILITACAO H'
      
        '                WHERE  CD_USUARIO = :CD_USUARIO AND H.IN_ATIVO =' +
        ' '#39'1'#39' ) OR'
      '      :CD_CARGO = '#39'001'#39
      'ORDER BY'
      'NM_UNID_NEG')
    Params.Data = {
      010002000A43445F5553554152494F00010200300000000843445F434152474F
      0001020030000000}
    Left = 144
    Top = 95
    object qry_usuario_habilitacao_unidade_CD_UNID_NEG: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_habilitacao_unidade_NM_UNID_NEG: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_UNID_NEG'
      Size = 50
    end
    object qry_usuario_habilitacao_unidade_AP_UNID_NEG: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_UNID_NEG'
      Size = 10
    end
    object qry_usuario_habilitacao_unidade_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object qry_usuario_habilitacao_unidade_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'look_ativo'
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
  end
end

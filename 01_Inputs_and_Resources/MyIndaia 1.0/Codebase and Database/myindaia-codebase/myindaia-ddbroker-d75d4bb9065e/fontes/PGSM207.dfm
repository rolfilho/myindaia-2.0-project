object datm_manut_rel_fin: Tdatm_manut_rel_fin
  OldCreateOrder = True
  Left = 361
  Top = 312
  Height = 207
  Width = 455
  object ds_rel_fin_controle: TDataSource
    DataSet = qry_rel_fin_controle_
    Left = 60
    Top = 56
  end
  object qry_rel_fin_controle_: TQuery
    AfterScroll = qry_rel_fin_controle_AfterScroll
    OnCalcFields = qry_rel_fin_controle_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_rel_fin_controle_lista
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TREL_FIN_CONTROLE (NOLOCK)'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '                CD_PRODUTO = :CD_PRODUTO AND '
      '                NR_RELATORIO = :NR_RELATORIO AND'
      '                DT_EMISSAO = :DT_EMISSAO AND'
      '                CD_GRUPO = :CD_GRUPO AND'
      '                CD_CLIENTE = :CD_CLIENTE'
      'ORDER BY'
      'DT_EMISSAO')
    Left = 201
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftString
        Name = 'NR_RELATORIO'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftDateTime
        Name = 'DT_EMISSAO'
        ParamType = ptInput
        Size = 8
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
        Size = 6
      end>
    object qry_rel_fin_controle_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TREL_FIN_CONTROLE.CD_CLIENTE'
      Size = 2
    end
    object qry_rel_fin_controle_NR_RELATORIO: TStringField
      FieldName = 'NR_RELATORIO'
      Origin = 'TREL_FIN_CONTROLE.NR_RELATORIO'
      Size = 3
    end
    object qry_rel_fin_controle_DT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Origin = 'TREL_FIN_CONTROLE.DT_EMISSAO'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_rel_fin_controle_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TREL_FIN_CONTROLE.CD_GRUPO'
      Size = 3
    end
    object qry_rel_fin_controle_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TREL_FIN_CONTROLE.CD_CLIENTE'
      Size = 5
    end
    object qry_rel_fin_controle_NR_ANO: TStringField
      FieldName = 'NR_ANO'
      Origin = 'TREL_FIN_CONTROLE.NR_ANO'
      Size = 4
    end
    object qry_rel_fin_controle_LookGrupo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookGrupo'
      LookupDataSet = qry_grupo_
      LookupKeyFields = 'CD_GRUPO'
      LookupResultField = 'NM_GRUPO'
      KeyFields = 'CD_GRUPO'
      Size = 50
      Lookup = True
    end
    object qry_rel_fin_controle_LookCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCliente'
      LookupDataSet = qry_cliente_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_rel_fin_controle_VL_REEMBOLSO: TFloatField
      FieldName = 'VL_REEMBOLSO'
      Origin = 'TREL_FIN_CONTROLE.NR_RELATORIO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_rel_fin_controle_VL_JUROS: TFloatField
      FieldName = 'VL_JUROS'
      Origin = 'TREL_FIN_CONTROLE.DT_EMISSAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_rel_fin_controle_VL_CPMF: TFloatField
      FieldName = 'VL_CPMF'
      Origin = 'TREL_FIN_CONTROLE.CD_GRUPO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_rel_fin_controle_LookUnidNeg: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookUnidNeg'
      Size = 50
      Calculated = True
    end
    object qry_rel_fin_controle_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TREL_FIN_CONTROLE.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_rel_fin_controle_LookProduto: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookProduto'
      Size = 50
      Calculated = True
    end
  end
  object qry_rel_fin_controle_lista_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT R.CD_UNID_NEG, U.AP_UNID_NEG,'
      '       CASE ISNULL( R.CD_GRUPO, '#39#39' )'
      '         WHEN '#39'X'#39' THEN '#39#39
      '         ELSE R.CD_GRUPO'
      '       END CD_GRUPO, G.NM_GRUPO,'
      '       CASE ISNULL( R.CD_CLIENTE, '#39#39' )'
      '         WHEN '#39'X'#39' THEN '#39#39
      '         ELSE R.CD_CLIENTE'
      
        '       END CD_CLIENTE, E.NM_EMPRESA, R.NR_RELATORIO, R.NR_ANO, R' +
        '.DT_EMISSAO, P.CD_PRODUTO, P.AP_PRODUTO'
      
        'FROM   TREL_FIN_CONTROLE R (NOLOCK), TGRUPO G (NOLOCK), TEMPRESA' +
        '_NAC E (NOLOCK), TUNID_NEG U (NOLOCK), TPRODUTO P (NOLOCK)'
      'WHERE  R.CD_UNID_NEG = U.CD_UNID_NEG AND'
      '       R.CD_PRODUTO = P.CD_PRODUTO AND'
      '       R.CD_GRUPO *= G.CD_GRUPO AND'
      '       G.IN_ATIVO = '#39'1'#39' AND'
      '       R.CD_CLIENTE *= E.CD_EMPRESA AND'
      '       E.IN_ATIVO = '#39'1'#39' AND'
      '       R.NR_ANO = :NR_ANO'
      'ORDER BY'
      
        '  U.AP_UNID_NEG, P.AP_PRODUTO, G.NM_GRUPO, E.NM_EMPRESA, R.DT_EM' +
        'ISSAO')
    Left = 200
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptUnknown
      end>
    object qry_rel_fin_controle_lista_CD_UNID_NEG: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_rel_fin_controle_lista_AP_UNID_NEG: TStringField
      DisplayLabel = 'Unid. Neg.'
      FieldName = 'AP_UNID_NEG'
      Size = 10
    end
    object qry_rel_fin_controle_lista_CD_GRUPO: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_GRUPO'
      Size = 3
    end
    object qry_rel_fin_controle_lista_NM_GRUPO: TStringField
      DisplayLabel = 'Grupo'
      FieldName = 'NM_GRUPO'
      Size = 50
    end
    object qry_rel_fin_controle_lista_CD_CLIENTE: TStringField
      DisplayLabel = 'C'#243'd'
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_rel_fin_controle_lista_NM_EMPRESA: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object qry_rel_fin_controle_lista_NR_RELATORIO: TStringField
      DisplayLabel = 'Rel.'
      FieldName = 'NR_RELATORIO'
      Size = 3
    end
    object qry_rel_fin_controle_lista_NR_ANO: TStringField
      DisplayLabel = 'Ano'
      FieldName = 'NR_ANO'
      Size = 4
    end
    object qry_rel_fin_controle_lista_DT_EMISSAO: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'DT_EMISSAO'
    end
    object qry_rel_fin_controle_lista_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      FixedChar = True
      Size = 10
    end
    object qry_rel_fin_controle_lista_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
  end
  object ds_rel_fin_controle_lista: TDataSource
    DataSet = qry_rel_fin_controle_lista_
    Left = 64
    Top = 8
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_rel_fin_controle
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_GRUPO, NM_GRUPO'
      'FROM   TGRUPO (NOLOCK)'
      'WHERE  IN_ATIVO = '#39'1'#39)
    Left = 312
    Top = 8
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_rel_fin_controle
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM   TEMPRESA_NAC (NOLOCK)'
      'WHERE  IN_ATIVO = '#39'1'#39)
    Left = 310
    Top = 56
    object qry_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_cliente_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object qry_ult_relat_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT RIGHT( '#39'000'#39' + CONVERT( varchar, ISNULL( CONVERT( int, MA' +
        'X( NR_RELATORIO ) ) + 1, 1 ) ), 3 ) NR_RELATORIO'
      'FROM   TREL_FIN_CONTROLE'
      
        'WHERE  DATEPART( yy, DT_EMISSAO ) = DATEPART( yy, GETDATE() ) AN' +
        'D'
      '       CD_GRUPO = :CD_GRUPO AND'
      '       CD_UNID_NEG = :CD_UNID_NEG')
    Left = 60
    Top = 105
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end>
  end
  object qry_ult_relat_cli_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT RIGHT( '#39'000'#39' + CONVERT( varchar, ISNULL( CONVERT( int, MA' +
        'X( NR_RELATORIO ) ) + 1, 1 ) ), 3 ) NR_RELATORIO'
      'FROM   TREL_FIN_CONTROLE'
      
        'WHERE  DATEPART( yy, DT_EMISSAO ) = DATEPART( yy, GETDATE() ) AN' +
        'D'
      '       CD_CLIENTE = :CD_CLIENTE AND'
      '       CD_UNID_NEG = :CD_UNID_NEG')
    Left = 201
    Top = 105
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
      end>
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM   TUNID_NEG (NOLOCK)'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_UNID_NEG IN'
      '              ( SELECT CD_UNID_NEG'
      '                FROM   TUSUARIO_HABILITACAO (NOLOCK)'
      '                WHERE  CD_USUARIO = :CD_USUARIO )')
    Left = 310
    Top = 108
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Size = 50
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM   TPRODUTO (NOLOCK)'
      'WHERE  CD_PRODUTO = :CD_PRODUTO '
      'AND CD_PRODUTO IN  ( SELECT CD_PRODUTO'
      
        '                                                 FROM   TUSUARIO' +
        '_HABILITACAO (NOLOCK)'
      
        '                                                 WHERE  CD_USUAR' +
        'IO = :CD_USUARIO AND '
      
        '                                                 CD_UNID_NEG = :' +
        'CD_UNID_NEG)')
    Left = 384
    Top = 8
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftFixedChar
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end>
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_produto_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
  end
end

object datm_sel_unid_prod_fin: Tdatm_sel_unid_prod_fin
  OldCreateOrder = True
  Left = 280
  Top = 212
  Height = 448
  Width = 748
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM   TUNID_NEG (NOLOCK)'
      'WHERE  CD_UNID_NEG <> '#39#39)
    Left = 31
    Top = 17
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
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO (NOLOCK)'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 31
    Top = 76
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
  object sp_rel_fin: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_fin'
    Left = 659
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
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
      end
      item
        DataType = ftString
        Name = '@cd_grupo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_atual'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_moeda_juros'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_relatorio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_ano'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@erro'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
        Value = 1
      end>
  end
  object qry_ult_relat_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT MAX( NR_RELATORIO ) NR_RELATORIO, MAX( DT_EMISSAO ) DT_EM' +
        'ISSAO'
      'FROM   TREL_FIN_CONTROLE'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_GRUPO = :CD_GRUPO AND'
      '       NR_ANO = :NR_ANO AND'
      '       CD_PRODUTO = :CD_PRODUTO')
    Left = 128
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, END_CIDADE'
      'FROM TEMPRESA_NAC (NOLOCK)'
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Left = 128
    Top = 76
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
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
    object qry_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
      Size = 10
    end
    object qry_cliente_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 30
    end
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TGRUPO (NOLOCK)'
      'WHERE CD_GRUPO = :CD_GRUPO ')
    Left = 31
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qry_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TGRUPO.CD_GRUPO'
      Size = 3
    end
    object qry_grupo_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'TGRUPO.NM_GRUPO'
      Size = 50
    end
    object qry_grupo_DT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'TGRUPO.DT_INCLUSAO'
    end
    object qry_grupo_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TGRUPO.IN_ATIVO'
      Size = 1
    end
  end
  object qry_juros_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TJUROS_REEMB (NOLOCK)'
      'WHERE  CD_MOEDA_JUROS = :CD_MOEDA_JUROS ')
    Left = 237
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MOEDA_JUROS'
        ParamType = ptUnknown
      end>
    object qry_juros_CD_MOEDA_JUROS: TStringField
      FieldName = 'CD_MOEDA_JUROS'
      Origin = 'TJUROS_REEMB.CD_MOEDA_JUROS'
      Size = 3
    end
    object qry_juros_DT_JUROS: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_JUROS'
      Origin = 'TJUROS_REEMB.DT_JUROS'
    end
    object qry_juros_VL_INDICE: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_INDICE'
      Origin = 'TJUROS_REEMB.VL_INDICE'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_juros_VL_JUROS: TFloatField
      DisplayLabel = 'Juros'
      FieldName = 'VL_JUROS'
      Origin = 'TJUROS_REEMB.VL_JUROS'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.00000000'
    end
    object qry_juros_VL_ACUMULADO: TFloatField
      DisplayLabel = 'Acumulado'
      FieldName = 'VL_ACUMULADO'
      Origin = 'TJUROS_REEMB.VL_ACUMULADO'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.00000000'
    end
  end
  object qry_tot_tab_juros_cli_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT( CD_MOEDA_JUROS ) TOT_MOEDA'
      'FROM   TEMPRESA_NAC (NOLOCK)'
      'WHERE  CD_GRUPO = :CD_GRUPO AND'
      '       ISNULL( CD_MOEDA_JUROS, '#39#39' ) <> '#39#39)
    Left = 237
    Top = 76
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
  end
  object qry_tab_juros_cli_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT MAX( E.CD_MOEDA_JUROS ) CD_MOEDA_JUROS, M.NM_MOEDA NM_MOE' +
        'DA_JUROS'
      'FROM   TEMPRESA_NAC E (NOLOCK), TMOEDA_BROKER M (NOLOCK)'
      'WHERE  E.CD_MOEDA_JUROS = M.CD_MOEDA AND'
      '       ( ( E.CD_GRUPO = :CD_GRUPO ) OR ( :CD_GRUPO = '#39#39' ) ) AND'
      
        '       ( ( E.CD_EMPRESA = :CD_EMPRESA ) OR ( :CD_EMPRESA = '#39#39' ) ' +
        ') AND'
      '       ISNULL( E.CD_MOEDA_JUROS, '#39#39' ) <> '#39#39
      'GROUP BY M.NM_MOEDA       ')
    Left = 128
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
      end>
  end
  object qry_tab_juros_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT MAX( E.CD_MOEDA_JUROS ) CD_MOEDA_JUROS, M.NM_MOEDA NM_MOE' +
        'DA_JUROS'
      'FROM   TEMPRESA_NAC E (NOLOCK), TMOEDA_BROKER M (NOLOCK)'
      'WHERE  E.CD_MOEDA_JUROS = M.CD_MOEDA AND'
      '       ( ( ( E.CD_GRUPO = :CD_GRUPO ) OR ( :CD_GRUPO = '#39#39' ) ) OR'
      
        '         ( ( E.CD_EMPRESA = :CD_EMPRESA ) OR ( :CD_EMPRESA = '#39#39' ' +
        ') ) ) AND'
      '       ISNULL( E.CD_MOEDA_JUROS, '#39#39' ) <> '#39#39
      'GROUP BY M.NM_MOEDA       ')
    Left = 128
    Top = 183
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qry_ult_relat_cli_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT MAX( NR_RELATORIO ) NR_RELATORIO, MAX( DT_EMISSAO ) DT_EM' +
        'ISSAO'
      'FROM   TREL_FIN_CONTROLE'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_CLIENTE = :CD_CLIENTE AND'
      '       NR_ANO = :NR_ANO AND'
      '       CD_PRODUTO = :CD_PRODUTO'
      '')
    Left = 237
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
  end
  object sp_fin_gera_tab_juros: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_fin_gera_tab_juros'
    Left = 659
    Top = 76
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_moeda_juros'
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
      end
      item
        DataType = ftString
        Name = '@cd_grupo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_atual'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_final'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@in_rel_reemb'
        ParamType = ptInput
      end>
  end
  object ds_juros: TDataSource
    DataSet = qry_juros_
    Left = 237
    Top = 183
  end
  object qry_rel_fin_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_REFERENCIA, NM_EMBARCACAO, NR_FATURA, NR_PROCESSO, NM_' +
        'ITEM, VL_ITEM, VL_CPMF, DT_PAGTO, NR_DIAS, VL_REEMBOLSO'
      'FROM   TREL_FIN_DESP (NOLOCK)'
      'WHERE  NR_IDENTIFICADOR = :NR_IDENTIFICADOR'
      'ORDER BY NR_FATURA')
    Left = 31
    Top = 183
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end>
    object qry_rel_fin_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREL_FIN_DESP.CD_REFERENCIA'
      Size = 15
    end
    object qry_rel_fin_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      Origin = 'TREL_FIN_DESP.NM_EMBARCACAO'
      Size = 40
    end
    object qry_rel_fin_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TREL_FIN_DESP.NR_FATURA'
      Size = 6
    end
    object qry_rel_fin_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TREL_FIN_DESP.NR_PROCESSO'
      Size = 18
    end
    object qry_rel_fin_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TREL_FIN_DESP.NM_ITEM'
      Size = 30
    end
    object qry_rel_fin_VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
      Origin = 'TREL_FIN_DESP.VL_ITEM'
    end
    object qry_rel_fin_VL_CPMF: TFloatField
      FieldName = 'VL_CPMF'
      Origin = 'TREL_FIN_DESP.VL_CPMF'
    end
    object qry_rel_fin_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
      Origin = 'TREL_FIN_DESP.DT_PAGTO'
    end
    object qry_rel_fin_NR_DIAS: TIntegerField
      FieldName = 'NR_DIAS'
      Origin = 'TREL_FIN_DESP.NR_DIAS'
    end
    object qry_rel_fin_VL_REEMBOLSO: TFloatField
      FieldName = 'VL_REEMBOLSO'
      Origin = 'TREL_FIN_DESP.VL_REEMBOLSO'
    end
  end
  object qry_tot_desp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS TOT_LINHAS_DESP'
      'FROM   TREL_FIN_DESP'
      'WHERE  NR_IDENTIFICADOR = :NR_IDENTIFICADOR AND'
      '       VL_ITEM > 0')
    Left = 464
    Top = 76
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end>
  end
  object qry_rel_fin_desp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT F.NR_IDENTIFICADOR, F.CD_UNID_NEG, F.CD_PRODUTO, F.NR_SOL' +
        'ICITACAO,'
      '       CASE SUBSTRING( F.NR_PROCESSO, 7, 1 )'
      '         WHEN "-" THEN F.NR_PROCESSO'
      '         ELSE ""'
      '       END AS NR_PROCESSO,'
      '       F.CD_ITEM, F.NM_ITEM, F.CD_REFERENCIA, F.NM_EMBARCACAO,'
      
        '       ROUND( F.VL_ITEM, 2 ) AS VL_ITEM, F.VL_CPMF, F.VL_REEMBOL' +
        'SO, F.DT_FATURA, F.DT_PAGTO, F.NR_DIAS,'
      '       F.NR_FATURA, F.NM_AREA'
      'FROM   TREL_FIN_DESP F (NOLOCK), TITEM I (NOLOCK)'
      'WHERE  NR_IDENTIFICADOR = :NR_IDENTIFICADOR AND'
      '       F.CD_ITEM *= I.CD_ITEM AND'
      '       F.VL_ITEM > 0'
      'ORDER BY NR_FATURA, NR_PROCESSO, I.NR_ORDEM_FAT, F.CD_ITEM')
    Left = 347
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end>
    object qry_rel_fin_desp_NR_IDENTIFICADOR: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
    end
    object qry_rel_fin_desp_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_rel_fin_desp_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_rel_fin_desp_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      FixedChar = True
      Size = 6
    end
    object qry_rel_fin_desp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_rel_fin_desp_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_rel_fin_desp_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_rel_fin_desp_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      FixedChar = True
      Size = 15
    end
    object qry_rel_fin_desp_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      FixedChar = True
      Size = 40
    end
    object qry_rel_fin_desp_VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object qry_rel_fin_desp_VL_CPMF: TFloatField
      FieldName = 'VL_CPMF'
    end
    object qry_rel_fin_desp_VL_REEMBOLSO: TFloatField
      FieldName = 'VL_REEMBOLSO'
    end
    object qry_rel_fin_desp_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
    end
    object qry_rel_fin_desp_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
    end
    object qry_rel_fin_desp_NR_DIAS: TIntegerField
      FieldName = 'NR_DIAS'
    end
    object qry_rel_fin_desp_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 6
    end
    object qry_rel_fin_desp_NM_AREA: TStringField
      FieldName = 'NM_AREA'
      FixedChar = True
      Size = 10
    end
  end
  object qry_rel_fin_resumo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TREL_FIN_RESUMO (NOLOCK)'
      'WHERE  NR_IDENTIFICADOR = :NR_IDENTIFICADOR'
      'ORDER BY NR_FATURA')
    Left = 464
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end>
  end
  object qry_rel_fin_totais_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM( ISNULL( VL_ITEM, 0 ) ) AS VL_SOMA,'
      '       SUM( ISNULL( VL_CPMF, 0 ) ) AS VL_CPMF,'
      '       SUM( ISNULL( VL_COMISSAO, 0 ) ) AS VL_COMISSAO,'
      
        '       SUM( ISNULL( VL_ITEM, 0 ) + ISNULL( VL_CPMF, 0 ) + ISNULL' +
        '( VL_COMISSAO, 0 ) ) AS VL_SUB_TOTAL,'
      '       SUM( ISNULL( VL_REEMBOLSO, 0 ) ) AS VL_REEMBOLSO,'
      
        '       SUM( ISNULL( VL_ITEM, 0 ) + ISNULL( VL_CPMF, 0 ) + ISNULL' +
        '( VL_COMISSAO, 0 ) + ISNULL( VL_REEMBOLSO, 0 ) ) AS VL_TOTAL'
      'FROM   TREL_FIN_RESUMO R (NOLOCK)'
      'WHERE  NR_IDENTIFICADOR = :NR_IDENTIFICADOR'
      '       AND VL_ITEM > 0')
    Left = 347
    Top = 183
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end>
  end
  object qry_tot_resumo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS TOT_LINHAS_RESUMO'
      'FROM   TREL_FIN_RESUMO (NOLOCK)'
      'WHERE  NR_IDENTIFICADOR = :NR_IDENTIFICADOR')
    Left = 564
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end>
  end
  object qry_rel_fin_juros_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TJUROS_REEMB (NOLOCK)'
      'WHERE  CD_MOEDA_JUROS = :CD_MOEDA_JUROS'
      'ORDER BY DT_JUROS')
    Left = 347
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MOEDA_JUROS'
        ParamType = ptUnknown
      end>
  end
  object qry_tot_juros_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS TOT_LINHAS_JUROS'
      'FROM   TJUROS_REEMB (NOLOCK)'
      'WHERE  CD_MOEDA_JUROS = :CD_MOEDA_JUROS')
    Left = 347
    Top = 76
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MOEDA_JUROS'
        ParamType = ptUnknown
      end>
  end
  object sp_rel_dem_cliente: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_dem_cliente'
    Left = 659
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
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
      end
      item
        DataType = ftString
        Name = '@cd_grupo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_inicio'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_fim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
      end>
  end
  object qry_rel_dem_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TREL_DEM_CLIENTE (NOLOCK)'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR AND'
      'SUBSTRING( NR_PROCESSO, 3, 2 ) = '#39'01'#39)
    Left = 464
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptInput
      end>
    object qry_rel_dem_cliente_NR_IDENTIFICADOR: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
    end
    object qry_rel_dem_cliente_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_rel_dem_cliente_VL_REMESSA: TFloatField
      FieldName = 'VL_REMESSA'
    end
    object qry_rel_dem_cliente_DT_REMESSA: TDateTimeField
      FieldName = 'DT_REMESSA'
    end
    object qry_rel_dem_cliente_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      FixedChar = True
      Size = 15
    end
    object qry_rel_dem_cliente_VL_DESPESA: TFloatField
      FieldName = 'VL_DESPESA'
    end
  end
  object qry_rel_dem_cliente_exp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TREL_DEM_CLIENTE (NOLOCK)'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR AND'
      'SUBSTRING( NR_PROCESSO, 3, 2 ) = '#39'02'#39)
    Left = 464
    Top = 183
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptInput
      end>
    object qry_rel_dem_cliente_exp_NR_IDENTIFICADOR: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
    end
    object qry_rel_dem_cliente_exp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_rel_dem_cliente_exp_VL_REMESSA: TFloatField
      FieldName = 'VL_REMESSA'
    end
    object qry_rel_dem_cliente_exp_DT_REMESSA: TDateTimeField
      FieldName = 'DT_REMESSA'
    end
    object qry_rel_dem_cliente_exp_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      FixedChar = True
      Size = 15
    end
    object qry_rel_dem_cliente_exp_VL_DESPESA: TFloatField
      FieldName = 'VL_DESPESA'
    end
  end
  object sp_rel_rec_liq: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_rec_liq'
    Left = 661
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
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
      end
      item
        DataType = ftString
        Name = '@cd_grupo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_inicial'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_final'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
      end>
  end
  object qry_rel_rec_liq_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TREL_REC_LIQ (NOLOCK)'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR'
      'ORDER BY NR_IDENTIFICADOR, CD_GRUPO, CD_CLIENTE')
    Left = 564
    Top = 76
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptInput
      end>
    object qry_rel_rec_liq_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'DBBROKER.TREL_REC_LIQ.NM_GRUPO'
      FixedChar = True
      Size = 15
    end
    object qry_rel_rec_liq_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      Origin = 'DBBROKER.TREL_REC_LIQ.NM_CLIENTE'
      FixedChar = True
      Size = 10
    end
    object qry_rel_rec_liq_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TREL_REC_LIQ.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_rel_rec_liq_VL_RECEITA: TFloatField
      FieldName = 'VL_RECEITA'
      Origin = 'DBBROKER.TREL_REC_LIQ.VL_RECEITA'
    end
    object qry_rel_rec_liq_VL_SALDO: TFloatField
      FieldName = 'VL_SALDO'
      Origin = 'DBBROKER.TREL_REC_LIQ.VL_SALDO'
    end
    object qry_rel_rec_liq_NR_IDENTIFICADOR: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
      Origin = 'DBBROKER.TREL_REC_LIQ.NR_IDENTIFICADOR'
    end
    object qry_rel_rec_liq_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TREL_REC_LIQ.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_rel_rec_liq_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TREL_REC_LIQ.CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
  end
  object sp_rel_fluxo_op: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_fluxo_op'
    Left = 573
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
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
      end
      item
        DataType = ftString
        Name = '@cd_grupo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_inicial'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_final'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
      end>
  end
  object qry_rel_recebiveis_: TQuery
    DatabaseName = 'DBBroker'
    SQL.Strings = (
      
        'SELECT E.NM_EMPRESA,  P.NR_PROCESSO, (F.NR_SOLICITACAO + '#39' / '#39'+ ' +
        'F.NR_NOTA_FATURA) AS '#39'NR_NOTA'#39', ISNULL(CONVERT(VARCHAR, F.DT_LIQ' +
        'UIDACAO, 103),'#39#39') DT_LIQUIDACAO, F.VL_LIQUIDACAO,'
      
        '  (SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE REF WHERE REF.NR' +
        '_PROCESSO = P.NR_PROCESSO AND TP_REFERENCIA = '#39'01'#39') CD_REFERENCI' +
        'A,'
      
        '  CONVERT(VARCHAR, F.DT_FATURA,103) DT_FATURA, CONVERT(VARCHAR, ' +
        'F.DT_VENCTO_FATURA,103) DT_VENCTO_FATURA,'
      
        '  (SELECT TOP 1 ISNULL(CONVERT(VARCHAR, FAT.DT_LANCAMENTO,103), ' +
        #39#39') FROM TFATURAMENTO_CC FAT (NOLOCK) WHERE FAT.IN_FATURADO = '#39'1' +
        #39' AND '
      
        '  FAT.CD_ITEM NOT IN (SELECT CD_ITEM FROM TFATURAMENTO_CC_CLIENT' +
        'E FATCC WHERE FATCC.NR_PROCESSO = FAT.NR_PROCESSO AND FATCC.CD_I' +
        'TEM = FAT.CD_ITEM AND ROUND(FATCC.VL_ITEM, 2) = ROUND(FAT.VL_ITE' +
        'M, 2)) AND'
      '  FAT.NR_PROCESSO = P.NR_PROCESSO AND'
      
        '    FAT.NR_SOLIC_FAT = F.NR_SOLICITACAO AND FAT.CD_ITEM = '#39'991'#39' ' +
        'AND IN_CANCELADO = '#39'0'#39' ORDER BY FAT.DT_LANCAMENTO DESC) AS DT_AD' +
        'TO_NUM,'
      
        '  ((SELECT ISNULL(SUM(VL_ITEM),0) FROM TFATURAMENTO_CC FAT (NOLO' +
        'CK) WHERE  FAT.CD_ITEM NOT IN (SELECT CD_ITEM FROM TFATURAMENTO_' +
        'CC_CLIENTE FATCC WHERE FATCC.NR_PROCESSO = FAT.NR_PROCESSO AND F' +
        'ATCC.CD_ITEM = FAT.CD_ITEM AND ROUND(FATCC.VL_ITEM,2) = ROUND(FA' +
        'T.VL_ITEM,2)) AND'
      
        '    FAT.IN_FATURADO = '#39'1'#39' AND FAT.NR_PROCESSO = P.NR_PROCESSO AN' +
        'D FAT.NR_SOLIC_FAT = F.NR_SOLICITACAO AND FAT.CD_ITEM = '#39'991'#39' AN' +
        'D IN_CANCELADO = '#39'0'#39') -'
      
        '   (SELECT ISNULL(SUM(VL_ITEM),0) FROM TFATURAMENTO_CC FAT (NOLO' +
        'CK) WHERE  FAT.CD_ITEM NOT IN (SELECT CD_ITEM FROM TFATURAMENTO_' +
        'CC_CLIENTE FATCC WHERE FATCC.NR_PROCESSO = FAT.NR_PROCESSO AND F' +
        'ATCC.CD_ITEM = FAT.CD_ITEM AND ROUND(FATCC.VL_ITEM,2) = ROUND(FA' +
        'T.VL_ITEM,2)) AND'
      
        '    FAT.IN_FATURADO = '#39'1'#39' AND FAT.NR_PROCESSO = P.NR_PROCESSO AN' +
        'D FAT.NR_SOLIC_FAT = F.NR_SOLICITACAO AND FAT.CD_ITEM = '#39'993'#39' AN' +
        'D IN_CANCELADO = '#39'0'#39' )) ADTO_NUM,'
      
        '  CASE WHEN (SELECT COUNT(*) FROM TFATURAMENTO_CC FAT (NOLOCK) W' +
        'HERE  FAT.CD_ITEM NOT IN (SELECT CD_ITEM FROM TFATURAMENTO_CC_CL' +
        'IENTE FATCC WHERE FATCC.NR_PROCESSO = FAT.NR_PROCESSO AND FATCC.' +
        'CD_ITEM = FAT.CD_ITEM AND ROUND(FATCC.VL_ITEM,2) = ROUND(FAT.VL_' +
        'ITEM,2)) AND'
      
        '    FAT.IN_FATURADO = '#39'1'#39' AND FAT.NR_PROCESSO = P.NR_PROCESSO AN' +
        'D FAT.NR_SOLIC_FAT = F.NR_SOLICITACAO AND FAT.IN_CANCELADO = '#39'0'#39 +
        ' AND CD_ITEM = '#39'513'#39') > 0'
      
        '    THEN (SELECT ISNULL(SUM(CASE IN_RESTITUI WHEN 1 THEN VL_ITEM' +
        ' * -1 ELSE VL_ITEM END),0) FROM TFATURAMENTO_CC FAT (NOLOCK) WHE' +
        'RE FAT.CD_ITEM NOT IN (SELECT CD_ITEM FROM TFATURAMENTO_CC_CLIEN' +
        'TE FATCC WHERE FATCC.NR_PROCESSO = FAT.NR_PROCESSO AND FATCC.CD_' +
        'ITEM = FAT.CD_ITEM AND ROUND(FATCC.VL_ITEM,2) = ROUND(FAT.VL_ITE' +
        'M,2)) AND'
      
        '    FAT.IN_FATURADO = '#39'1'#39' AND FAT.NR_PROCESSO = P.NR_PROCESSO AN' +
        'D IN_CANCELADO = '#39'0'#39' AND FAT.NR_SOLIC_FAT = F.NR_SOLICITACAO AND' +
        ' FAT.CD_ITEM = '#39'822'#39' )'
      
        '    ELSE (SELECT ISNULL(SUM(CASE IN_RESTITUI WHEN 1 THEN VL_ITEM' +
        ' * -1 ELSE VL_ITEM END),0) FROM TFATURAMENTO_CC FAT (NOLOCK) WHE' +
        'RE FAT.CD_ITEM NOT IN (SELECT CD_ITEM FROM TFATURAMENTO_CC_CLIEN' +
        'TE FATCC WHERE FATCC.NR_PROCESSO = FAT.NR_PROCESSO AND FATCC.CD_' +
        'ITEM = FAT.CD_ITEM AND ROUND(FATCC.VL_ITEM,2) = ROUND(FAT.VL_ITE' +
        'M,2)) AND'
      
        '    FAT.IN_FATURADO = '#39'1'#39' AND FAT.NR_PROCESSO = P.NR_PROCESSO AN' +
        'D IN_CANCELADO = '#39'0'#39' AND'
      
        '          FAT.NR_SOLIC_FAT = F.NR_SOLICITACAO AND ((FAT.CD_ITEM ' +
        '= '#39'822'#39') OR CD_ITEM IN (SELECT CD_ITEM FROM TITEM (NOLOCK) WHERE' +
        ' CD_TIPO_ITEM = '#39'R'#39' OR ((CD_TIPO_ITEM = '#39'D'#39') AND (IN_TRIBUTAVEL ' +
        '= '#39'1'#39')) ))) END AS RECEITAS,'
      
        '  CASE WHEN (SELECT COUNT(*) FROM TFATURAMENTO_CC FAT (NOLOCK) W' +
        'HERE  FAT.CD_ITEM NOT IN (SELECT CD_ITEM FROM TFATURAMENTO_CC_CL' +
        'IENTE FATCC WHERE FATCC.NR_PROCESSO = FAT.NR_PROCESSO AND FATCC.' +
        'CD_ITEM = FAT.CD_ITEM AND ROUND(FATCC.VL_ITEM,2) = ROUND(FAT.VL_' +
        'ITEM,2)) AND'
      
        '    FAT.IN_FATURADO = '#39'1'#39' AND FAT.NR_PROCESSO = P.NR_PROCESSO AN' +
        'D FAT.NR_SOLIC_FAT = F.NR_SOLICITACAO AND FAT.IN_CANCELADO = '#39'0'#39 +
        ' AND CD_ITEM = '#39'513'#39') > 0'
      
        '    THEN (SELECT ISNULL(SUM(CASE IN_RESTITUI WHEN 1 THEN VL_ITEM' +
        ' * -1 ELSE VL_ITEM END),0) FROM TFATURAMENTO_CC FAT (NOLOCK) WHE' +
        'RE FAT.CD_ITEM NOT IN (SELECT CD_ITEM FROM TFATURAMENTO_CC_CLIEN' +
        'TE FATCC WHERE FATCC.NR_PROCESSO = FAT.NR_PROCESSO AND FATCC.CD_' +
        'ITEM = FAT.CD_ITEM AND ROUND(FATCC.VL_ITEM,2) = ROUND(FAT.VL_ITE' +
        'M,2)) AND'
      
        '    FAT.IN_FATURADO = '#39'1'#39' AND FAT.NR_PROCESSO = P.NR_PROCESSO AN' +
        'D IN_CANCELADO = '#39'0'#39' AND FAT.NR_SOLIC_FAT = F.NR_SOLICITACAO AND' +
        ' FAT.CD_ITEM = '#39'513'#39')'
      '    ELSE'
      
        '    (SELECT ISNULL(SUM(CASE IN_RESTITUI WHEN 1 THEN VL_ITEM * -1' +
        ' ELSE VL_ITEM END),0) FROM TFATURAMENTO_CC FAT (NOLOCK) WHERE FA' +
        'T.CD_ITEM NOT IN (SELECT CD_ITEM FROM TFATURAMENTO_CC_CLIENTE FA' +
        'TCC WHERE FATCC.NR_PROCESSO = FAT.NR_PROCESSO AND FATCC.CD_ITEM ' +
        '= FAT.CD_ITEM AND ROUND(FATCC.VL_ITEM,2) = ROUND(FAT.VL_ITEM,2))' +
        ' AND'
      
        '      FAT.IN_FATURADO = '#39'1'#39' AND FAT.NR_PROCESSO = P.NR_PROCESSO ' +
        'AND'
      
        '      FAT.CD_ITEM IN (SELECT CD_ITEM FROM TITEM (NOLOCK) WHERE C' +
        'D_TIPO_ITEM = '#39'D'#39' AND IN_TRIBUTAVEL = '#39'0'#39') AND FAT.NR_SOLIC_FAT ' +
        '= F.NR_SOLICITACAO AND FAT.IN_CANCELADO = '#39'0'#39' AND'
      
        '      FAT.CD_ITEM NOT IN ('#39'997'#39','#39'998'#39', '#39'994'#39', '#39'578'#39') AND FAT.CD_' +
        'ITEM NOT IN (SELECT SOL.CD_ITEM FROM TSOLIC_PAGTO SOL (NOLOCK) W' +
        'HERE SOL.NR_PROCESSO = FAT.NR_PROCESSO AND FAT.CD_ITEM = SOL.CD_' +
        'ITEM AND'
      
        '                                                                ' +
        '            FAT.VL_ITEM = SOL.VL_PAGTO AND SOL.CD_STATUS = '#39'7'#39' A' +
        'ND SOL.TP_DESTINO = '#39'1'#39') AND'
      
        '      FAT.CD_ITEM NOT IN (SELECT FAT1.CD_ITEM FROM TFATURAMENTO_' +
        'CC FAT1 (NOLOCK) WHERE FAT.CD_ITEM NOT IN (SELECT CD_ITEM FROM T' +
        'FATURAMENTO_CC_CLIENTE FATCC WHERE FATCC.NR_PROCESSO = FAT.NR_PR' +
        'OCESSO AND FATCC.CD_ITEM = FAT.CD_ITEM AND ROUND(FATCC.VL_ITEM,2' +
        ') = ROUND(FAT.VL_ITEM,2)) AND'
      
        '      FAT.IN_FATURADO = '#39'1'#39' AND FAT1.CD_ITEM IN ('#39'025'#39','#39'026'#39','#39'02' +
        '7'#39','#39'032'#39','#39'599'#39','#39'600'#39') AND'
      
        '                               FAT1.CD_FORMA_PAGTO = '#39'S'#39' AND FAT' +
        '1.NR_SOLIC_FAT = FAT.NR_SOLIC_FAT AND FAT1.NR_PROCESSO = FAT.NR_' +
        'PROCESSO)) END AS DESPESAS,'
      
        '  (SELECT ISNULL(SUM(CASE IN_RESTITUI WHEN 1 THEN VL_ITEM * -1 E' +
        'LSE VL_ITEM END),0) FROM TFATURAMENTO_CC FAT (NOLOCK) WHERE FAT.' +
        'CD_ITEM NOT IN (SELECT CD_ITEM FROM TFATURAMENTO_CC_CLIENTE FATC' +
        'C WHERE FATCC.NR_PROCESSO = FAT.NR_PROCESSO AND FATCC.CD_ITEM = ' +
        'FAT.CD_ITEM AND ROUND(FATCC.VL_ITEM,2) = ROUND(FAT.VL_ITEM,2)) A' +
        'ND'
      
        '    FAT.IN_FATURADO = '#39'1'#39' AND FAT.NR_PROCESSO = P.NR_PROCESSO AN' +
        'D FAT.NR_SOLIC_FAT = F.NR_SOLICITACAO AND IN_CANCELADO = '#39'0'#39' AND' +
        ' CD_ITEM IN ('#39'994'#39','#39'578'#39')) AS IMPOSTOS'
      'FROM TPROCESSO P (NOLOCK)'
      
        'INNER JOIN TEMPRESA_NAC E (NOLOCK) ON E.CD_EMPRESA = P.CD_CLIENT' +
        'E'
      
        'INNER JOIN TS_FATURA_PROCESSO FP (NOLOCK) ON FP.NR_PROCESSO = P.' +
        'NR_PROCESSO'
      
        'INNER JOIN TS_FATURA F (NOLOCK) ON F.NR_SOLICITACAO = FP.NR_SOLI' +
        'CITACAO AND F.CD_UNID_NEG = FP.CD_UNID_NEG AND F.CD_PRODUTO = FP' +
        '.CD_PRODUTO'
      'WHERE (P.CD_UNID_NEG = :CD_UNID_NEG OR ( :CD_UNID_NEG = '#39#39' ) )'
      '  AND (P.CD_PRODUTO = :CD_PRODUTO OR ( :CD_PRODUTO = '#39#39' ) )'
      '  AND (P.CD_CLIENTE = :CD_CLIENTE OR ( :CD_CLIENTE = '#39#39' ) )'
      '  AND (P.CD_GRUPO'#9'  = :CD_GRUPO OR ( :CD_GRUPO = '#39#39' ) )'
      
        '  AND F.IN_CANCELADO = '#39'0'#39' AND P.IN_CANCELADO = '#39'0'#39' AND ((F.IN_I' +
        'MP_NF_SERV = '#39'1'#39') OR (F.IN_IMPRESSO = '#39'1'#39'))'
      '-- ** VER ABERTURA DA QUERY'
      'ORDER BY E.NM_EMPRESA, F.NR_SOLICITACAO')
    Left = 96
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
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
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qry_rel_recebiveis_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_rel_recebiveis_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_rel_recebiveis_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      FixedChar = True
      Size = 15
    end
    object qry_rel_recebiveis_NR_NOTA: TStringField
      FieldName = 'NR_NOTA'
      FixedChar = True
      Size = 15
    end
    object qry_rel_recebiveis_DT_FATURA: TStringField
      FieldName = 'DT_FATURA'
      FixedChar = True
      Size = 30
    end
    object qry_rel_recebiveis_DT_VENCTO_FATURA: TStringField
      FieldName = 'DT_VENCTO_FATURA'
      FixedChar = True
      Size = 30
    end
    object qry_rel_recebiveis_DT_ADTO_NUM: TStringField
      FieldName = 'DT_ADTO_NUM'
      FixedChar = True
      Size = 30
    end
    object qry_rel_recebiveis_ADTO_NUM: TFloatField
      FieldName = 'ADTO_NUM'
    end
    object qry_rel_recebiveis_RECEITAS: TFloatField
      FieldName = 'RECEITAS'
    end
    object qry_rel_recebiveis_DESPESAS: TFloatField
      FieldName = 'DESPESAS'
    end
    object qry_rel_recebiveis_IMPOSTOS: TFloatField
      FieldName = 'IMPOSTOS'
    end
    object qry_rel_recebiveis_DT_LIQUIDACAO: TStringField
      FieldName = 'DT_LIQUIDACAO'
      FixedChar = True
      Size = 30
    end
    object qry_rel_recebiveis_VL_LIQUIDACAO: TFloatField
      FieldName = 'VL_LIQUIDACAO'
    end
  end
end

object datm_di_libera: Tdatm_di_libera
  OldCreateOrder = True
  Left = 310
  Top = 193
  Height = 242
  Width = 226
  object qry_lista_: TQuery
    AfterOpen = qry_lista_AfterOpen
    OnCalcFields = qry_lista_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT *'
      
        'FROM (SELECT P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_PRODUTO, ISNULL(' +
        'SN.NM_SERVICO, S.NM_SERVICO) AS NM_SERVICO, P.VL_CIF_DOLAR, H.VL' +
        '_MIN_DI, 0 AS IN_TIPO_REGISTRO'
      '      FROM TPROCESSO P (NOLOCK)'
      
        '         LEFT  JOIN TSERVICO S (NOLOCK) ON S.CD_SERVICO = P.CD_S' +
        'ERVICO'
      
        '         LEFT  JOIN TSERVICO_NOVO SN (NOLOCK) ON CONVERT(VARCHAR' +
        ', SN.CD_SERVICO) = P.CD_SERVICO'
      
        '         INNER JOIN TCLIENTE_HABILITACAO H (NOLOCK) ON H.CD_UNID' +
        '_NEG = P.CD_UNID_NEG'
      
        '                                                   AND H.CD_PROD' +
        'UTO = P.CD_PRODUTO'
      
        '                                                   AND H.CD_CLIE' +
        'NTE = P.CD_CLIENTE'
      
        '         INNER JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_' +
        'PROCESSO = P.NR_PROCESSO'
      
        '      WHERE (DI.NR_DECLARACAO_IMP IS NULL OR DI.NR_DECLARACAO_IM' +
        'P = '#39#39')'
      '        AND P.IN_CANCELADO = '#39'0'#39
      '        AND P.IN_DI_LIBERADA = :IN_DI_LIBERADA'
      '        AND P.CD_UNID_NEG = :CD_UNID_NEG'
      '        AND YEAR(P.DT_ABERTURA) >= 2011'
      '        AND P.CD_PRODUTO = :CD_PRODUTO'
      
        '        AND ((P.CD_UNID_NEG+P.CD_PRODUTO) IN (SELECT CD_UNID_NEG' +
        '+CD_PRODUTO'
      
        '                                              FROM TUSUARIO_HABI' +
        'LITACAO (NOLOCK)'
      
        '                                              WHERE CD_USUARIO =' +
        ' :CD_USUARIO'
      
        '                                                AND IN_ATIVO = '#39 +
        '1'#39'))'
      '      UNION ALL'
      '      SELECT *, 1 AS IN_TIPO_REGISTRO'
      
        '      FROM (SELECT TOP 1000 P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_P' +
        'RODUTO, ISNULL(SN.NM_SERVICO, S.NM_SERVICO) AS NM_SERVICO, 0 AS ' +
        'VL_CIF_DOLAR, 0 AS VL_MIN_DI'
      '            FROM TPROCESSO P (NOLOCK)'
      
        '               LEFT  JOIN TSERVICO S (NOLOCK) ON S.CD_SERVICO = ' +
        'P.CD_SERVICO'
      
        '               LEFT  JOIN TSERVICO_NOVO SN (NOLOCK) ON CONVERT(V' +
        'ARCHAR, SN.CD_SERVICO) = P.CD_SERVICO'
      
        '               INNER JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON ' +
        'DI.NR_PROCESSO = P.NR_PROCESSO'
      '            WHERE P.IN_CANCELADO = '#39'0'#39
      '              AND P.CD_UNID_NEG = :CD_UNID_NEG'
      '              AND P.CD_PRODUTO = :CD_PRODUTO'
      '              AND ISNULL(P.IN_DI_LIBERADA, '#39#39') <> '#39'1'#39
      '              AND P.IN_MONEY = '#39'1'#39
      '              AND (SELECT COUNT(*)'
      '                   FROM TADICAO_DE_IMPORTACAO AI (NOLOCK)'
      
        '                   WHERE AI.NR_PROCESSO = DI.NR_PROCESSO) = (SEL' +
        'ECT COUNT(*)'
      
        '                                                             FRO' +
        'M TPREVISAO_ADICAO PA (NOLOCK)'
      
        '                                                             WHE' +
        'RE PA.NR_PROCESSO = DI.NR_PROCESSO)'
      '              AND (SELECT COUNT(*)'
      '                   FROM TUSUARIO_HABILITACAO UH (NOLOCK)'
      '                   WHERE UH.CD_USUARIO = :CD_USUARIO'
      '                     AND UH.CD_UNID_NEG = P.CD_UNID_NEG'
      '                     AND UH.CD_PRODUTO = P.CD_PRODUTO'
      '                     AND UH.IN_ATIVO = '#39'1'#39') > 0'
      '              AND ISNULL(DI.NR_DECLARACAO_IMP, '#39#39') = '#39#39') AS VW'
      
        '      WHERE MYMONEY.DBO.FN_IMPOSTOS_NAO_RECEBIDOS_COUNT(NR_PROCE' +
        'SSO) > 0) AS VW2'
      'ORDER BY'
      'NR_PROCESSO')
    Left = 53
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'IN_DI_LIBERADA'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    object qry_lista_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_lista_calc_nr_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nr_processo'
      Size = 14
      Calculated = True
    end
    object qry_lista_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_lista_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_lista_NM_SERVICO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'NM_SERVICO'
      Size = 50
    end
    object qry_lista_VL_CIF_DOLAR: TFloatField
      DisplayLabel = 'CIF US$'
      FieldName = 'VL_CIF_DOLAR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lista_VL_MIN_DI: TFloatField
      DisplayLabel = 'Valor Parametrizado'
      FieldName = 'VL_MIN_DI'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lista_IN_TIPO_REGISTRO: TIntegerField
      FieldName = 'IN_TIPO_REGISTRO'
    end
  end
  object ds_lista_: TDataSource
    DataSet = qry_lista_
    Left = 53
    Top = 80
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG '
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = "01"')
    Left = 137
    Top = 16
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
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO = "01"')
    Left = 137
    Top = 80
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
  object qry_libera_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_lista_
    SQL.Strings = (
      'UPDATE TPROCESSO'
      'SET    IN_DI_LIBERADA = '#39'1'#39','
      '       CD_LIBERADOR_DI = :CD_LIBERADOR_DI'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 53
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_LIBERADOR_DI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object StringField2: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object FloatField1: TFloatField
      FieldName = 'VL_SOLICITADO'
      DisplayFormat = '#0,.00'
    end
    object FloatField2: TFloatField
      FieldName = 'VL_RECEBIDO'
      DisplayFormat = '#0,.00'
    end
    object StringField3: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nr_processo'
      Size = 14
      Calculated = True
    end
    object StringField4: TStringField
      FieldKind = fkLookup
      FieldName = 'lkp_nm_servico'
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 50
      Lookup = True
    end
    object FloatField3: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_diferenca'
      DisplayFormat = '#0,.00'
      Calculated = True
    end
  end
end

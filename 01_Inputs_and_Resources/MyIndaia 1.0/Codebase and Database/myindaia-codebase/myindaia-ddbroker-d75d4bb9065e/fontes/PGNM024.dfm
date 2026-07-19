object datm_libera_sol_aberto: Tdatm_libera_sol_aberto
  OldCreateOrder = True
  Left = 310
  Top = 193
  Height = 250
  Width = 343
  object qry_lista_: TQuery
    AfterOpen = qry_lista_AfterOpen
    OnCalcFields = qry_lista_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_PRODUTO, S.NM_SERVICO,' +
        ' ISNULL( SUM(C.VL_SOLICITADO),0 ) VL_SOLICITADO, ISNULL( SUM(VL_' +
        'RECEBIDO),0 ) VL_RECEBIDO'
      'FROM   TPROCESSO P, TNUMERARIO_NOTIFICA C, TSERVICO S'
      'WHERE  ( P.NR_PROCESSO = C.NR_PROCESSO ) AND'
      '       ( C.CD_STATUS IN ( '#39'A'#39','#39'P'#39','#39'B'#39' ) ) AND'
      '       ( P.CD_SERVICO = S.CD_SERVICO ) AND'
      '       ( P.IN_CANCELADO <> '#39'1'#39' ) AND'
      '       ( P.CD_UNID_NEG = :CD_UNID_NEG ) AND'
      '       ( P.CD_PRODUTO = :CD_PRODUTO ) AND'
      '       ( ( P.CD_UNID_NEG+P.CD_PRODUTO ) IN'
      '           ( SELECT CD_UNID_NEG+CD_PRODUTO'
      '             FROM   TUSUARIO_HABILITACAO'
      
        '             WHERE  CD_USUARIO = :CD_USUARIO AND IN_ATIVO = '#39'1'#39' ' +
        ') AND'
      '         ( C.CD_STATUS = '#39'A'#39' ) AND'
      '         ( VL_SOLICITADO > VL_RECEBIDO ) AND'
      '         ( P.NR_PROCESSO IN ( SELECT N.NR_PROCESSO'
      
        '                              FROM   TNUMERARIO_NOTIFICA N, TNUM' +
        'ERARIO_NOTIFICA_ITEM NI, TITEM I'
      
        '                              WHERE  N.NR_PROCESSO = NI.NR_PROCE' +
        'SSO AND'
      
        '                                     N.NR_SOLICITACAO = NI.NR_SO' +
        'LICITACAO AND'
      '                                     NI.CD_ITEM = I.CD_ITEM AND'
      '                                     I.IN_ITEM_DI = '#39'1'#39' AND'
      
        '                                     N.CD_STATUS = '#39'A'#39' AND NI.TP' +
        '_DESTINO IN ('#39'2'#39', '#39'3'#39') ) ) OR'
      '       ( P.IN_DI_LIBERADA <> '#39'1'#39' ) )'
      
        'GROUP BY P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_PRODUTO, S.NM_SERVIC' +
        'O'
      'ORDER BY '
      'P.NR_PROCESSO'
      '')
    Left = 24
    Top = 16
    ParamData = <
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
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_lista_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_lista_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      DisplayFormat = '#0,.00'
    end
    object qry_lista_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
      DisplayFormat = '#0,.00'
    end
    object qry_lista_calc_nr_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nr_processo'
      Size = 14
      Calculated = True
    end
    object qry_lista_calc_diferenca: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_diferenca'
      DisplayFormat = '#0,.00'
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
  end
  object ds_lista_: TDataSource
    DataSet = qry_lista_
    Left = 24
    Top = 80
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG '
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = "01"')
    Left = 105
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
    Left = 105
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
    Left = 24
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

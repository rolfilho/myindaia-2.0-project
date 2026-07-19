object datm_sda_pesq: Tdatm_sda_pesq
  OldCreateOrder = True
  Left = 623
  Top = 229
  Height = 184
  Width = 682
  object qry_pesq_: TQuery
    OnCalcFields = qry_pesq_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ' SELECT S.NR_PROCESSO, S.CD_DESPACHANTE, D.NM_DESPACHANTE, '
      ' S.CD_STATUS, ST.NM_STATUS_SDA,                            '
      ' P.CD_UNID_NEG, U.NM_UNID_NEG, P.CD_PRODUTO, PR.NM_PRODUTO,'
      ' ( S.VL_SDA + S.VL_CONTR_ASSIST + S.VL_COMPL ) AS VL_SDA,  '
      ' S.DT_DISTRIBUICAO, S.DT_EMISSAO, S.DT_CANCEL, S.DT_PAGTO, '
      ' S.CD_DISTRIBUIDOR, UD.NM_USUARIO AS NM_DISTRIBUIDOR,      '
      ' S.CD_EMISSOR, UE.NM_USUARIO AS NM_EMISSOR,                '
      ' S.CD_CANCELADOR, UC.NM_USUARIO AS NM_CANCELADOR,'
      ' EN.NM_EMPRESA           '
      ' FROM   TPROCESSO_SDA S,                                   '
      '        TPROCESSO P,                                       '
      '        TDESPACHANTE D,                                    '
      '        TSTATUS_SDA ST,                                    '
      '        TUSUARIO UD,                                       '
      '        TUSUARIO UE,                                       '
      '        TUSUARIO UC,                                       '
      '        TUNID_NEG U,                                       '
      '        TPRODUTO PR, '
      '        TEMPRESA_NAC EN                                      '
      ' WHERE S.NR_PROCESSO        = P.NR_PROCESSO                '
      '   AND S.CD_DESPACHANTE    *= D.CD_DESPACHANTE             '
      '   AND P.CD_UNID_NEG        = U.CD_UNID_NEG                '
      '   AND P.CD_PRODUTO         = PR.CD_PRODUTO                '
      '   AND S.CD_STATUS         *= ST.CD_STATUS_SDA             '
      '   AND S.CD_DISTRIBUIDOR   *= UD.CD_USUARIO                '
      '   AND S.CD_EMISSOR        *= UE.CD_USUARIO                '
      '   AND S.CD_CANCELADOR     *= UC.CD_USUARIO                '
      '   AND P.IN_CANCELADO       = '#39'0'#39'                          '
      '   AND P.IN_LIBERADO        = '#39'1'#39
      '   AND P.CD_CLIENTE         = EN.CD_EMPRESA'
      '   ')
    Left = 53
    Top = 20
    object qry_pesq_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_pesq_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_pesq_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Size = 50
    end
    object qry_pesq_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_pesq_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Size = 40
    end
    object qry_pesq_CD_DESPACHANTE: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_DESPACHANTE'
      Size = 3
    end
    object qry_pesq_NM_DESPACHANTE: TStringField
      DisplayLabel = 'Despachante'
      FieldName = 'NM_DESPACHANTE'
      Size = 50
    end
    object qry_pesq_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Size = 1
    end
    object qry_pesq_NM_STATUS_SDA: TStringField
      DisplayLabel = 'Status'
      FieldName = 'NM_STATUS_SDA'
    end
    object qry_pesq_VL_SDA: TFloatField
      DisplayLabel = 'Valor S.D.A.'
      FieldName = 'VL_SDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pesq_DT_DISTRIBUICAO: TDateTimeField
      DisplayLabel = 'Dt. Distribui'#231#227'o'
      FieldName = 'DT_DISTRIBUICAO'
    end
    object qry_pesq_DT_EMISSAO: TDateTimeField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldName = 'DT_EMISSAO'
    end
    object qry_pesq_DT_CANCEL: TDateTimeField
      FieldName = 'DT_CANCEL'
    end
    object qry_pesq_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
    end
    object qry_pesq_CD_DISTRIBUIDOR: TStringField
      FieldName = 'CD_DISTRIBUIDOR'
      Size = 4
    end
    object qry_pesq_NM_DISTRIBUIDOR: TStringField
      FieldName = 'NM_DISTRIBUIDOR'
      Size = 50
    end
    object qry_pesq_CD_EMISSOR: TStringField
      FieldName = 'CD_EMISSOR'
      Size = 4
    end
    object qry_pesq_NM_EMISSOR: TStringField
      FieldName = 'NM_EMISSOR'
      Size = 50
    end
    object qry_pesq_CD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      Size = 4
    end
    object qry_pesq_NM_CANCELADOR: TStringField
      FieldName = 'NM_CANCELADOR'
      Size = 50
    end
    object qry_pesq_CalcProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldKind = fkCalculated
      FieldName = 'CalcProcesso'
      Size = 14
      Calculated = True
    end
    object qry_pesq_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
  end
  object ds_pesq: TDataSource
    DataSet = qry_pesq_
    Left = 53
    Top = 74
  end
  object qry_desp_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_DESPACHANTE, NM_DESPACHANTE'
      'FROM   TDESPACHANTE'
      'WHERE  CD_DESPACHANTE = :CD_DESPACHANTE')
    Left = 122
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_DESPACHANTE'
        ParamType = ptUnknown
      end>
    object qry_desp_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TDESPACHANTE.CD_DESPACHANTE'
      Size = 3
    end
    object qry_desp_NM_DESPACHANTE: TStringField
      FieldName = 'NM_DESPACHANTE'
      Origin = 'TDESPACHANTE.NM_DESPACHANTE'
      Size = 50
    end
  end
  object ds_desp: TDataSource
    DataSet = qry_desp_
    Left = 122
    Top = 74
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO'
      'FROM TUSUARIO'
      'ORDER BY'
      'NM_USUARIO')
    Left = 199
    Top = 20
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'TUSUARIO.NM_USUARIO'
      Size = 50
    end
  end
  object ds_usuario: TDataSource
    DataSet = qry_usuario_
    Left = 199
    Top = 74
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO'
      'FROM TPROCESSO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 393
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
  end
  object qry_status_sda_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_STATUS_SDA, NM_STATUS_SDA'
      'FROM   TSTATUS_SDA'
      'ORDER BY CD_STATUS_SDA')
    Left = 290
    Top = 20
    object qry_status_sda_CD_STATUS_SDA: TStringField
      FieldName = 'CD_STATUS_SDA'
      Origin = 'TSTATUS_SDA.CD_STATUS_SDA'
      Size = 1
    end
    object qry_status_sda_NM_STATUS_SDA: TStringField
      FieldName = 'NM_STATUS_SDA'
      Origin = 'TSTATUS_SDA.NM_STATUS_SDA'
    end
  end
  object ds_status_sda: TDataSource
    DataSet = qry_status_sda_
    Left = 290
    Top = 74
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UNP.CD_UNID_NEG, UNP.CD_PRODUTO, U.NM_UNID_NEG, P.NM_PROD' +
        'UTO'
      'FROM   TUNID_NEG_PRODUTO UNP, TUNID_NEG U, TPRODUTO P'
      'WHERE  UNP.CD_UNID_NEG = U.CD_UNID_NEG AND'
      '       UNP.CD_PRODUTO = P.CD_PRODUTO AND'
      
        '       ( UNP.CD_UNID_NEG + UNP.CD_PRODUTO ) IN ( SELECT ( UH.CD_' +
        'UNID_NEG + UH.CD_PRODUTO )'
      
        '                                                 FROM   TUSUARIO' +
        '_HABILITACAO UH'
      
        '                                                 WHERE  UH.CD_US' +
        'UARIO = :CD_USUARIO AND'
      
        '                                                        UH.IN_AT' +
        'IVO = '#39'1'#39' )')
    Left = 393
    Top = 74
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_usuario_habilitacao_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Size = 50
    end
    object qry_usuario_habilitacao_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Size = 40
    end
  end
end

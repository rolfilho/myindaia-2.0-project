object datm_lib_account: Tdatm_lib_account
  OldCreateOrder = True
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object qry_processo_: TQuery
    CachedUpdates = True
    AfterPost = qry_processo_AfterPost
    OnCalcFields = qry_processo_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.NR_PROCESSO, TP.CD_CLIENTE, TP.CD_AGENTE, TH.CD_MASTER' +
        ', TH.NR_MASTER, TH.NR_HOUSE,'
      
        '   (SELECT TE.NM_EMPRESA FROM TEMPRESA_NAC TE WHERE TE.CD_EMPRES' +
        'A = TP.CD_CLIENTE)NM_CLIENTE, TP.VL_ACCOUNT,'
      
        '   (SELECT TA.NM_AGENTE FROM TAGENTE TA WHERE TA.CD_AGENTE = TP.' +
        'CD_AGENTE)NM_AGENTE, TP.IN_ACCOUNT, TS.CD_VIA_TRANSPORTE,'
      '    TP.IN_LIBERADO,TP.CD_RESTRICAO, TP.CD_MOEDA_FRETE'
      ''
      '     FROM TPROCESSO TP, TSERVICO TS, THOUSE TH'
      
        '     WHERE TP.CD_UNID_NEG =:CD_UNID_NEG and TP.CD_PRODUTO=:CD_PR' +
        'ODUTO AND  TP.IN_ACCOUNT in ('#39'6'#39','#39'7'#39')'
      '       AND TP.CD_SERVICO = TS.CD_SERVICO AND TS.TP_SERVICO = '#39'1'#39
      '       AND TP.NR_PROCESSO = TH.NR_PROCESSO'
      '    ORDER BY'
      '         TP.NR_PROCESSO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = Update_processo
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_processo_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_processo_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_processo_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_processo_IN_ACCOUNT: TStringField
      FieldName = 'IN_ACCOUNT'
      FixedChar = True
      Size = 1
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_RESTRICAO: TStringField
      FieldName = 'CD_RESTRICAO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 10
      Calculated = True
    end
    object qry_processo_calc_motivo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_motivo'
      Size = 15
      Calculated = True
    end
    object qry_processo_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_processo_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 14
    end
    object qry_processo_NR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      FixedChar = True
      Size = 15
    end
    object qry_processo_VL_ACCOUNT: TFloatField
      FieldName = 'VL_ACCOUNT'
      DisplayFormat = '0.00'
    end
    object qry_processo_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_processo_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UH.CD_USUARIO, TP.NM_PRODUTO, UH.CD_UNID_NEG, TUN.NM_UNID' +
        '_NEG, UH.CD_PRODUTO, UH.IN_ATIVO, UH.IN_DEFAULT,TU.NM_USUARIO  F' +
        'ROM TUSUARIO_HABILITACAO UH'
      'LEFT JOIN TUSUARIO TU ON(TU.CD_USUARIO = UH.CD_USUARIO)'
      'LEFT JOIN TPRODUTO TP ON(TP.CD_PRODUTO = UH.CD_PRODUTO)'
      
        'LEFT JOIN TUNID_NEG TUN ON (TUN.CD_UNID_NEG = UH.CD_UNID_NEG)WHE' +
        'RE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39)
    Left = 128
    Top = 16
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_traz_default_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_traz_default_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qry_traz_default_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_traz_default_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_traz_default_IN_DEFAULT: TStringField
      FieldName = 'IN_DEFAULT'
      FixedChar = True
      Size = 1
    end
    object qry_traz_default_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
  end
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 32
    Top = 72
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 40
    Top = 128
  end
  object Update_processo: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_RESTRICAO = :CD_RESTRICAO,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  IN_LIBERADO = :IN_LIBERADO,'
      '  IN_ACCOUNT = :IN_ACCOUNT'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPROCESSO'
      
        '  (NR_PROCESSO, CD_CLIENTE, CD_RESTRICAO, CD_AGENTE, IN_LIBERADO' +
        ', IN_ACCOUNT)'
      'values'
      
        '  (:NR_PROCESSO, :CD_CLIENTE, :CD_RESTRICAO, :CD_AGENTE, :IN_LIB' +
        'ERADO, '
      '   :IN_ACCOUNT)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 40
    Top = 192
  end
end

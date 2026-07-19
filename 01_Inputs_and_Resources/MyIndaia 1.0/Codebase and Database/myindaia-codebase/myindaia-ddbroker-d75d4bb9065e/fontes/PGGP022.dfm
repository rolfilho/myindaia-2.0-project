object datm_consulta_processo: Tdatm_consulta_processo
  Left = 162
  Top = 136
  Height = 132
  Width = 224
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, SUBSTRING( P.NR_PROCESSO, 5, 14 ) AS CalcP' +
        'rocesso, P.CD_CLIENTE, E.NM_EMPRESA AS NM_CLIENTE, P.DT_ABERTURA' +
        ','
      
        '       P.CD_SERVICO, S.NM_SERVICO, P.CD_EMBARCACAO, EM.NM_EMBARC' +
        'ACAO,'
      
        '       P.NR_CONHECIMENTO_MASTER, P.NR_CONHECIMENTO, P.NR_DI, P.N' +
        'R_MANIFESTO'
      'FROM  TPROCESSO P, TEMPRESA_NAC E, TSERVICO S, TEMBARCACAO EM'
      'WHERE P.CD_CLIENTE = E.CD_EMPRESA AND'
      '      P.CD_SERVICO = S.CD_SERVICO AND'
      '      P.CD_EMBARCACAO *= EM.CD_EMBARCACAO AND'
      '      P.IN_CANCELADO = '#39'0'#39' AND'
      '      P.IN_PRODUCAO = '#39'1'#39' AND'
      '      P.IN_LIBERADO = '#39'1'#39' AND'
      
        '      ( ( CD_UNID_NEG = :CD_UNIDADE ) OR ( :CD_UNIDADE = '#39#39' ) ) ' +
        'AND'
      
        '      ( ( CD_PRODUTO = :CD_PRODUTO ) OR ( :CD_PRODUTO = '#39#39' ) ) A' +
        'ND'
      '      ( ( CD_CLIENTE = :CD_CLIENTE ) OR ( :CD_CLIENTE = '#39#39' ) )'
      'ORDER BY'
      'P.NR_PROCESSO')
    Params.Data = {
      010006000A43445F554E494441444500010200300000000A43445F554E494441
      444500010200300000000A43445F50524F4455544F00010200300000000A4344
      5F50524F4455544F00010200300000000A43445F434C49454E54450001020030
      0000000A43445F434C49454E54450001020030000000}
    Left = 37
    Top = 20
    object qry_processo_NR_PROCESSO: TStringField
      DisplayLabel = 'Nº Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_CLIENTE: TStringField
      DisplayLabel = 'Cod.'
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 5
    end
    object qry_processo_CD_SERVICO: TStringField
      DisplayLabel = 'Cod.'
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 3
    end
    object qry_processo_DT_ABERTURA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_ABERTURA'
      Origin = 'TPROCESSO.NR_PROCESSO'
    end
    object qry_processo_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Size = 4
    end
    object qry_processo_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Size = 30
    end
    object qry_processo_NR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      Size = 30
    end
    object qry_processo_NR_DI: TStringField
      FieldName = 'NR_DI'
      Size = 10
    end
    object qry_processo_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Size = 15
    end
    object qry_processo_NM_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NM_CLIENTE'
      Size = 50
    end
    object qry_processo_NM_SERVICO: TStringField
      DisplayLabel = 'Serviço'
      FieldName = 'NM_SERVICO'
      Size = 50
    end
    object qry_processo_NM_EMBARCACAO: TStringField
      DisplayLabel = 'Embarcação'
      FieldName = 'NM_EMBARCACAO'
      Size = 40
    end
    object qry_processo_CalcProcesso: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'CalcProcesso'
      Size = 14
    end
  end
  object ds_Processo: TDataSource
    AutoEdit = False
    DataSet = qry_processo_
    Left = 117
    Top = 20
  end
end

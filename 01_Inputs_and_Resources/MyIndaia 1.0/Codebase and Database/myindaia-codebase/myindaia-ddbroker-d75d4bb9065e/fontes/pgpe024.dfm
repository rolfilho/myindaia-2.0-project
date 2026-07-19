object datm_exp_duplica: Tdatm_exp_duplica
  Left = 200
  Top = 104
  Height = 265
  Width = 215
  object ds_exp: TDataSource
    DataSet = qry_exp_
    Left = 24
    Top = 24
  end
  object qry_exp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO '
      'FROM TPROCESSO_EXP'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 96
    Top = 24
    object qry_exp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP.NR_PROCESSO'
      Size = 18
    end
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, P.CD_CLIENTE, E.NM_EMPRESA, P.CD_SERVICO, ' +
        'S.NM_SERVICO'
      'FROM   TPROCESSO P, TEMPRESA_NAC E, TSERVICO S'
      'WHERE  P.NR_PROCESSO = :NR_PROCESSO AND'
      '       P.CD_CLIENTE = E.CD_EMPRESA AND'
      '       P.CD_SERVICO = S.CD_SERVICO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 93
    Top = 101
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_processo_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.CD_SERVICO'
      Size = 3
    end
    object qry_processo_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Origin = 'TSERVICO.NM_SERVICO'
      Size = 50
    end
  end
end

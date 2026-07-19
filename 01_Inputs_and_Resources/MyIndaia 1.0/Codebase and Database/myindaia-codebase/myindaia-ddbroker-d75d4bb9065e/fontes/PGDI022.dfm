object datm_duplica_di: Tdatm_duplica_di
  Left = 200
  Top = 108
  Height = 222
  Width = 321
  object sp_duplica_di: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_duplica_di'
    Params.Data = {
      0100030006526573756C740403040000000000000012406E725F70726F636573
      736F5F666F6E7465010102003000000014406E725F70726F636573736F5F6465
      7374696E6F0101020030000000}
    Left = 124
    Top = 45
  end
  object qry_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(NR_PROCESSO) AS TOT_PROCESSO'
      'FROM  TDECLARACAO_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 29
    Top = 45
    object qry_di_TOT_PROCESSO: TIntegerField
      FieldName = 'TOT_PROCESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
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
    Left = 221
    Top = 45
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
  object qry_po_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(NR_PROCESSO) AS TOT_PROCESSO'
      'FROM  TPO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 29
    Top = 101
    object qry_po_TOT_PROCESSO: TIntegerField
      FieldName = 'TOT_PROCESSO'
      Origin = 'TPO.NR_PROCESSO'
    end
  end
  object sp_duplica_po: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_duplica_po'
    Params.Data = {
      0100030006526573756C740403040001000000000112406E725F70726F636573
      736F5F666F6E7465010102003000000014406E725F70726F636573736F5F6465
      7374696E6F0101020030000000}
    Left = 124
    Top = 101
  end
end

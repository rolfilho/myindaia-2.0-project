object datm_recalc_proc: Tdatm_recalc_proc
  Left = 200
  Top = 108
  Height = 147
  Width = 388
  object qry_DI_: TQuery
    OnCalcFields = qry_DI_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT D.NR_PROCESSO'
      'FROM TPROCESSO P, TDECLARACAO_IMPORTACAO D'
      'WHERE P.NR_PROCESSO = D.NR_PROCESSO AND'
      '               P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '               P.CD_PRODUTO = :CD_PRODUTO  AND'
      '               ISNULL(D.NR_DECLARACAO_IMP,'#39#39') = '#39#39' AND'
      
        '               (D.DT_CALCULO < CONVERT(DATETIME,(CONVERT(CHAR(10' +
        '),GETDATE(),103)),103) or'
      '                D.DT_CALCULO = null ) AND'
      '               P.IN_CANCELADO = '#39'0'#39
      'ORDER BY D.NR_PROCESSO DESC')
    Params.Data = {
      010002000B43445F554E49445F4E454700010200300000000A43445F50524F44
      55544F0001020030000000}
    Left = 24
    Top = 32
    object qry_DI_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_DI_calc_nr_processo: TStringField
      FieldName = 'calc_nr_processo'
      Calculated = True
    end
  end
  object qry_usuario_hab_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(CD_USUARIO) AS OK'
      'FROM TUSUARIO_HABILITACAO'
      'WHERE CD_USUARIO = :CD_USUARIO AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'IN_ATIVO = '#39'1'#39)
    Params.Data = {
      010003000A43445F5553554152494F00010200300000000B43445F554E49445F
      4E454700010200300000000A43445F50524F4455544F0001020030000000}
    Left = 101
    Top = 32
    object qry_usuario_hab_OK: TIntegerField
      FieldName = 'OK'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG '
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 193
    Top = 32
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 50
    end
  end
  object sp_di_calculo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_calculo'
    Params.Data = {
      0100020006526573756C74040304000000000000000C406E725F70726F636573
      736F0101020030000000}
    Left = 272
    Top = 32
  end
end

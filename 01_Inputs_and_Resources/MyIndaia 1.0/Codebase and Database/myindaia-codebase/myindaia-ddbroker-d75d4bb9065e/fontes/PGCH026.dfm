object datm_sel_col_fav: Tdatm_sel_col_fav
  Left = 200
  Top = 108
  Height = 187
  Width = 208
  object qry_coligada_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TCOLIGADA'
      'WHERE CD_COLIGADA = :CD_COLIGADA')
    Params.Data = {010001000B43445F434F4C49474144410001020030000000}
    Left = 36
    Top = 26
    object qry_coligada_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCOLIGADA.CD_COLIGADA'
      Size = 2
    end
    object qry_coligada_NM_COLIGADA: TStringField
      FieldName = 'NM_COLIGADA'
      Origin = 'TCOLIGADA.NM_COLIGADA'
    end
    object qry_coligada_IN_FATURAMENTO: TStringField
      FieldName = 'IN_FATURAMENTO'
      Origin = 'TCOLIGADA.CD_COLIGADA'
      Size = 1
    end
    object qry_coligada_CGC_COLIGADA: TStringField
      FieldName = 'CGC_COLIGADA'
      Origin = 'TCOLIGADA.NM_COLIGADA'
      Size = 14
    end
    object qry_coligada_NM_RAZ_SOCIAL: TStringField
      FieldName = 'NM_RAZ_SOCIAL'
      Origin = 'TCOLIGADA.IN_FATURAMENTO'
      Size = 70
    end
    object qry_coligada_END_COLIGADA: TStringField
      FieldName = 'END_COLIGADA'
      Origin = 'TCOLIGADA.CGC_COLIGADA'
      Size = 50
    end
    object qry_coligada_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Origin = 'TCOLIGADA.NM_RAZ_SOCIAL'
      Size = 6
    end
    object qry_coligada_END_COMPL: TStringField
      FieldName = 'END_COMPL'
      Origin = 'TCOLIGADA.END_COLIGADA'
    end
    object qry_coligada_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Origin = 'TCOLIGADA.END_NUMERO'
    end
    object qry_coligada_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TCOLIGADA.END_COMPL'
    end
    object qry_coligada_END_UF: TStringField
      FieldName = 'END_UF'
      Origin = 'TCOLIGADA.END_BAIRRO'
      Size = 2
    end
    object qry_coligada_END_CEP: TStringField
      FieldName = 'END_CEP'
      Origin = 'TCOLIGADA.END_CIDADE'
      Size = 8
    end
    object qry_coligada_TEL_COLIGADA: TStringField
      FieldName = 'TEL_COLIGADA'
      Origin = 'TCOLIGADA.END_UF'
      Size = 15
    end
    object qry_coligada_DDD_COLIGADA: TStringField
      FieldName = 'DDD_COLIGADA'
      Origin = 'TCOLIGADA.END_CEP'
      Size = 3
    end
    object qry_coligada_FAX_COLIGADA: TStringField
      FieldName = 'FAX_COLIGADA'
      Origin = 'TCOLIGADA.TEL_COLIGADA'
      Size = 8
    end
    object qry_coligada_EMAIL_COLIGADA: TStringField
      FieldName = 'EMAIL_COLIGADA'
      Origin = 'TCOLIGADA.DDD_COLIGADA'
      Size = 50
    end
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO'
      'FROM TFAVORECIDO'
      'WHERE CD_FAVORECIDO = :CD_FAVORECIDO')
    Params.Data = {010001000D43445F4641564F52454349444F0001020030000000}
    Left = 125
    Top = 26
    object qry_favorecido_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 5
    end
    object qry_favorecido_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 50
    end
  end
  object qry_DIRF_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT A.*, F.NM_FAVORECIDO, F.CD_TIPO_PESSOA, F.CGC_EMPRESA, F.' +
        'CPF_EMPRESA'
      'FROM TMOV_AUTONOMOS  A, '
      '           TFAVORECIDO F,'
      '           TCD_RECOL_IR C'
      'WHERE  A.CD_FAVORECIDO = F.CD_FAVORECIDO AND'
      '       A.CD_RECOL = C.CD_RECOL AND'
      '       A.CD_COLIGADA = :CD_COLIGADA AND'
      '       A.CD_RECOL = :CD_RECOL AND'
      '       A.ANO = :ANO'
      'ORDER BY C.CD_RECOL+F.CPF_EMPRESA+F.CGC_EMPRESA')
    Params.Data = {
      010003000B43445F434F4C494741444100010200300000000843445F5245434F
      4C000102003000000003414E4F0001020030000100}
    Left = 36
    Top = 99
    object qry_DIRF_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TMOV_AUTONOMOS.CD_FAVORECIDO'
      Size = 5
    end
    object qry_DIRF_ANO: TStringField
      FieldName = 'ANO'
      Origin = 'TMOV_AUTONOMOS.ANO'
      Size = 4
    end
    object qry_DIRF_VL_REND_01: TFloatField
      FieldName = 'VL_REND_01'
      Origin = 'TMOV_AUTONOMOS.VL_REND_01'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_REND_02: TFloatField
      FieldName = 'VL_REND_02'
      Origin = 'TMOV_AUTONOMOS.VL_REND_02'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_REND_03: TFloatField
      FieldName = 'VL_REND_03'
      Origin = 'TMOV_AUTONOMOS.VL_REND_03'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_REND_04: TFloatField
      FieldName = 'VL_REND_04'
      Origin = 'TMOV_AUTONOMOS.VL_REND_04'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_REND_05: TFloatField
      FieldName = 'VL_REND_05'
      Origin = 'TMOV_AUTONOMOS.VL_REND_05'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_REND_06: TFloatField
      FieldName = 'VL_REND_06'
      Origin = 'TMOV_AUTONOMOS.VL_REND_06'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_REND_07: TFloatField
      FieldName = 'VL_REND_07'
      Origin = 'TMOV_AUTONOMOS.VL_REND_07'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_REND_08: TFloatField
      FieldName = 'VL_REND_08'
      Origin = 'TMOV_AUTONOMOS.VL_REND_08'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_REND_09: TFloatField
      FieldName = 'VL_REND_09'
      Origin = 'TMOV_AUTONOMOS.VL_REND_09'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_REND_10: TFloatField
      FieldName = 'VL_REND_10'
      Origin = 'TMOV_AUTONOMOS.VL_REND_10'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_REND_11: TFloatField
      FieldName = 'VL_REND_11'
      Origin = 'TMOV_AUTONOMOS.VL_REND_11'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_REND_12: TFloatField
      FieldName = 'VL_REND_12'
      Origin = 'TMOV_AUTONOMOS.VL_REND_12'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_IR_01: TFloatField
      FieldName = 'VL_IR_01'
      Origin = 'TMOV_AUTONOMOS.VL_IR_01'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_IR_02: TFloatField
      FieldName = 'VL_IR_02'
      Origin = 'TMOV_AUTONOMOS.VL_IR_02'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_IR_03: TFloatField
      FieldName = 'VL_IR_03'
      Origin = 'TMOV_AUTONOMOS.VL_IR_03'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_IR_04: TFloatField
      FieldName = 'VL_IR_04'
      Origin = 'TMOV_AUTONOMOS.VL_IR_04'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_IR_05: TFloatField
      FieldName = 'VL_IR_05'
      Origin = 'TMOV_AUTONOMOS.VL_IR_05'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_IR_06: TFloatField
      FieldName = 'VL_IR_06'
      Origin = 'TMOV_AUTONOMOS.VL_IR_06'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_IR_07: TFloatField
      FieldName = 'VL_IR_07'
      Origin = 'TMOV_AUTONOMOS.VL_IR_07'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_IR_08: TFloatField
      FieldName = 'VL_IR_08'
      Origin = 'TMOV_AUTONOMOS.VL_IR_08'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_IR_09: TFloatField
      FieldName = 'VL_IR_09'
      Origin = 'TMOV_AUTONOMOS.VL_IR_09'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_IR_10: TFloatField
      FieldName = 'VL_IR_10'
      Origin = 'TMOV_AUTONOMOS.VL_IR_10'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_IR_11: TFloatField
      DisplayWidth = 10
      FieldName = 'VL_IR_11'
      Origin = 'TMOV_AUTONOMOS.VL_IR_11'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_VL_IR_12: TFloatField
      FieldName = 'VL_IR_12'
      Origin = 'TMOV_AUTONOMOS.VL_IR_12'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DIRF_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TMOV_AUTONOMOS.CD_COLIGADA'
      Size = 2
    end
    object qry_DIRF_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      Size = 50
    end
    object qry_DIRF_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Size = 1
    end
    object qry_DIRF_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Size = 14
    end
    object qry_DIRF_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Size = 11
    end
    object qry_DIRF_CD_RECOL: TStringField
      FieldName = 'CD_RECOL'
      Size = 4
    end
    object qry_DIRF_VL_REND_TRIB_01: TFloatField
      FieldName = 'VL_REND_TRIB_01'
    end
    object qry_DIRF_VL_REND_TRIB_02: TFloatField
      FieldName = 'VL_REND_TRIB_02'
    end
    object qry_DIRF_VL_REND_TRIB_03: TFloatField
      FieldName = 'VL_REND_TRIB_03'
    end
    object qry_DIRF_VL_REND_TRIB_04: TFloatField
      FieldName = 'VL_REND_TRIB_04'
    end
    object qry_DIRF_VL_REND_TRIB_05: TFloatField
      FieldName = 'VL_REND_TRIB_05'
    end
    object qry_DIRF_VL_REND_TRIB_06: TFloatField
      FieldName = 'VL_REND_TRIB_06'
    end
    object qry_DIRF_VL_REND_TRIB_07: TFloatField
      FieldName = 'VL_REND_TRIB_07'
    end
    object qry_DIRF_VL_REND_TRIB_08: TFloatField
      FieldName = 'VL_REND_TRIB_08'
    end
    object qry_DIRF_VL_REND_TRIB_09: TFloatField
      FieldName = 'VL_REND_TRIB_09'
    end
    object qry_DIRF_VL_REND_TRIB_10: TFloatField
      FieldName = 'VL_REND_TRIB_10'
    end
    object qry_DIRF_VL_REND_TRIB_11: TFloatField
      FieldName = 'VL_REND_TRIB_11'
    end
    object qry_DIRF_VL_REND_TRIB_12: TFloatField
      FieldName = 'VL_REND_TRIB_12'
    end
  end
  object qry_recol_ir_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_RECOL, NM_NATUREZA'
      'FROM TCD_RECOL_IR'
      'WHERE CD_RECOL = :CD_RECOL')
    Params.Data = {010001000843445F5245434F4C0001020030000000}
    Left = 125
    Top = 99
    object qry_recol_ir_CD_RECOL: TStringField
      FieldName = 'CD_RECOL'
      Origin = 'TCD_RECOL_IR.CD_RECOL'
      Size = 4
    end
    object qry_recol_ir_NM_NATUREZA: TStringField
      FieldName = 'NM_NATUREZA'
      Origin = 'TCD_RECOL_IR.NM_NATUREZA'
      Size = 40
    end
  end
end

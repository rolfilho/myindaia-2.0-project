object datm_imp_ir: Tdatm_imp_ir
  Left = 200
  Top = 108
  Height = 187
  Width = 188
  object qry_coligada_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_COLIGADA, NM_COLIGADA'
      'FROM TCOLIGADA'
      'WHERE CD_COLIGADA = :CD_COLIGADA')
    Params.Data = {010001000B43445F434F4C49474144410001020030000000}
    Left = 36
    Top = 29
    object qry_coligada_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCOLIGADA.CD_COLIGADA'
      Size = 2
    end
    object qry_coligada_NM_COLIGADA: TStringField
      FieldName = 'NM_COLIGADA'
      Origin = 'TCOLIGADA.NM_COLIGADA'
    end
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO'
      'FROM TFAVORECIDO'
      'WHERE CD_FAVORECIDO = :CD_FAVORECIDO')
    Params.Data = {010001000D43445F4641564F52454349444F0001020030000000}
    Left = 112
    Top = 29
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
  object qry_cd_recol_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCD_RECOL_IR'
      'WHERE CD_RECOL = :CD_RECOL')
    Params.Data = {010001000843445F5245434F4C0001020030000000}
    Left = 36
    Top = 95
    object qry_cd_recol_CD_RECOL: TStringField
      FieldName = 'CD_RECOL'
      Origin = 'TCD_RECOL_IR.CD_RECOL'
      Size = 4
    end
    object qry_cd_recol_VL_ALIQ: TFloatField
      FieldName = 'VL_ALIQ'
      Origin = 'TCD_RECOL_IR.VL_ALIQ'
    end
    object qry_cd_recol_NM_NATUREZA: TStringField
      FieldName = 'NM_NATUREZA'
      Origin = 'TCD_RECOL_IR.NM_NATUREZA'
      Size = 40
    end
    object qry_cd_recol_CD_LAYOUT_IR: TStringField
      FieldName = 'CD_LAYOUT_IR'
      Origin = 'TCD_RECOL_IR.CD_LAYOUT_IR'
      Size = 1
    end
  end
end

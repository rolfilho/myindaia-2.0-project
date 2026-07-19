object datm_ajuste_impressao_gnre: Tdatm_ajuste_impressao_gnre
  Left = 530
  Top = 195
  Height = 240
  Width = 251
  object qry_ajuste_impressao_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TAJUSTE_IMPRESSAO_GNRE'
      'WHERE CD_DOCUMENTO = :CD_DOCUMENTO')
    Params.Data = {010001000C43445F444F43554D454E544F0001020030000000}
    Left = 48
    Top = 16
    object qry_ajuste_impressao_CD_DOCUMENTO: TStringField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.CD_UNID_NEG'
      Size = 2
    end
    object qry_ajuste_impressao_L_UF_FAV: TStringField
      FieldName = 'L_UF_FAV'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_UF_FAV'
      Size = 3
    end
    object qry_ajuste_impressao_C_UF_FAV: TStringField
      FieldName = 'C_UF_FAV'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_UF_FAV'
      Size = 3
    end
    object qry_ajuste_impressao_L_VENC: TStringField
      FieldName = 'L_VENC'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_VENC'
      Size = 3
    end
    object qry_ajuste_impressao_C_VENC: TStringField
      FieldName = 'C_VENC'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_VENC'
      Size = 3
    end
    object qry_ajuste_impressao_L_CD_UF_FAV: TStringField
      FieldName = 'L_CD_UF_FAV'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_CD_UF_FAV'
      Size = 3
    end
    object qry_ajuste_impressao_C_CD_UF_FAV: TStringField
      FieldName = 'C_CD_UF_FAV'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_CD_UF_FAV'
      Size = 3
    end
    object qry_ajuste_impressao_L_CD_RECEITA: TStringField
      FieldName = 'L_CD_RECEITA'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_CD_RECEITA'
      Size = 3
    end
    object qry_ajuste_impressao_C_CD_RECEITA: TStringField
      FieldName = 'C_CD_RECEITA'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_CD_RECEITA'
      Size = 3
    end
    object qry_ajuste_impressao_L_IMP_EXP: TStringField
      FieldName = 'L_IMP_EXP'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_IMP_EXP'
      Size = 3
    end
    object qry_ajuste_impressao_C_IMP_EXP: TStringField
      FieldName = 'C_IMP_EXP'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_IMP_EXP'
      Size = 3
    end
    object qry_ajuste_impressao_L_INSC_EST: TStringField
      FieldName = 'L_INSC_EST'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_INSC_EST'
      Size = 3
    end
    object qry_ajuste_impressao_C_INSC_EST: TStringField
      FieldName = 'C_INSC_EST'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_INSC_EST'
      Size = 3
    end
    object qry_ajuste_impressao_L_CNPJ: TStringField
      FieldName = 'L_CNPJ'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_CNPJ'
      Size = 3
    end
    object qry_ajuste_impressao_C_CNPJ: TStringField
      FieldName = 'C_CNPJ'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_CNPJ'
      Size = 3
    end
    object qry_ajuste_impressao_L_END: TStringField
      FieldName = 'L_END'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_END'
      Size = 3
    end
    object qry_ajuste_impressao_C_END: TStringField
      FieldName = 'C_END'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_END'
      Size = 3
    end
    object qry_ajuste_impressao_L_DOCTO_ORIGEM: TStringField
      FieldName = 'L_DOCTO_ORIGEM'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_DOCTO_ORIGEM'
      Size = 3
    end
    object qry_ajuste_impressao_C_DOCTO_ORIGEM: TStringField
      FieldName = 'C_DOCTO_ORIGEM'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_DOCTO_ORIGEM'
      Size = 3
    end
    object qry_ajuste_impressao_L_MUNICIPIO: TStringField
      FieldName = 'L_MUNICIPIO'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_MUNICIPIO'
      Size = 3
    end
    object qry_ajuste_impressao_C_MUNICIPIO: TStringField
      FieldName = 'C_MUNICIPIO'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_MUNICIPIO'
      Size = 3
    end
    object qry_ajuste_impressao_L_UF: TStringField
      FieldName = 'L_UF'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_UF'
      Size = 3
    end
    object qry_ajuste_impressao_C_UF: TStringField
      FieldName = 'C_UF'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_UF'
      Size = 3
    end
    object qry_ajuste_impressao_L_CEP: TStringField
      FieldName = 'L_CEP'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_CEP'
      Size = 3
    end
    object qry_ajuste_impressao_C_CEP: TStringField
      FieldName = 'C_CEP'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_CEP'
      Size = 3
    end
    object qry_ajuste_impressao_L_TEL: TStringField
      FieldName = 'L_TEL'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_TEL'
      Size = 3
    end
    object qry_ajuste_impressao_C_TEL: TStringField
      FieldName = 'C_TEL'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_TEL'
      Size = 3
    end
    object qry_ajuste_impressao_L_REF: TStringField
      FieldName = 'L_REF'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_REF'
      Size = 3
    end
    object qry_ajuste_impressao_C_REF: TStringField
      FieldName = 'C_REF'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_REF'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_PRINC: TStringField
      FieldName = 'L_VL_PRINC'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_VL_PRINC'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_PRINC: TStringField
      FieldName = 'C_VL_PRINC'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_VL_PRINC'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_REF: TStringField
      FieldName = 'L_NR_REF'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_NR_REF'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_REF: TStringField
      FieldName = 'C_NR_REF'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_NR_REF'
      Size = 3
    end
    object qry_ajuste_impressao_L_NM_BANCO: TStringField
      FieldName = 'L_NM_BANCO'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_NM_BANCO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NM_BANCO: TStringField
      FieldName = 'C_NM_BANCO'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_NM_BANCO'
      Size = 3
    end
    object qry_ajuste_impressao_L_CONTA: TStringField
      FieldName = 'L_CONTA'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_CONTA'
      Size = 3
    end
    object qry_ajuste_impressao_C_CONTA: TStringField
      FieldName = 'C_CONTA'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_CONTA'
      Size = 3
    end
    object qry_ajuste_impressao_L_AGENCIA: TStringField
      FieldName = 'L_AGENCIA'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_AGENCIA'
      Size = 3
    end
    object qry_ajuste_impressao_C_AGENCIA: TStringField
      FieldName = 'C_AGENCIA'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_AGENCIA'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_BANCO: TStringField
      FieldName = 'L_NR_BANCO'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_NR_BANCO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_BANCO: TStringField
      FieldName = 'C_NR_BANCO'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_NR_BANCO'
      Size = 3
    end
    object qry_ajuste_impressao_L_TOTAL: TStringField
      FieldName = 'L_TOTAL'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.L_TOTAL'
      Size = 3
    end
    object qry_ajuste_impressao_C_TOTAL: TStringField
      FieldName = 'C_TOTAL'
      Origin = 'TAJUSTE_IMPRESSAO_GNRE.C_TOTAL'
      Size = 3
    end
    object qry_ajuste_impressao_LookUnidade: TStringField
      FieldName = 'LookUnidade'
      LookupDataSet = qry_unidade_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
  end
  object qry_unidade_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG')
    Left = 48
    Top = 72
    object qry_unidade_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unidade_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object ds_ajuste_impressao: TDataSource
    DataSet = qry_ajuste_impressao_
    Left = 160
    Top = 16
  end
end

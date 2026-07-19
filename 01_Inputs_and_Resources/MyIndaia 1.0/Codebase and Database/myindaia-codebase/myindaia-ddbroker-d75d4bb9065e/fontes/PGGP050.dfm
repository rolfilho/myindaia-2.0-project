object datm_ajuste_impressao_exoneracao: Tdatm_ajuste_impressao_exoneracao
  Left = 200
  Top = 110
  Height = 279
  Width = 335
  object qry_ajuste_impressao_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TAJUSTE_IMPRESSAO_EXONERACAO'
      'WHERE CD_DOCUMENTO = :CD_DOCUMENTO')
    Params.Data = {010001000C43445F444F43554D454E544F0001020030000000}
    Left = 48
    Top = 24
    object qry_ajuste_impressao_CD_DOCUMENTO: TStringField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_ajuste_impressao_L_UF_SEC: TStringField
      FieldName = 'L_UF_SEC'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.L_UF_SEC'
      Size = 3
    end
    object qry_ajuste_impressao_C_UF_SEC: TStringField
      FieldName = 'C_UF_SEC'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_UF_SEC'
      Size = 3
    end
    object qry_ajuste_impressao_L_EMPRESA: TStringField
      FieldName = 'L_EMPRESA'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.L_EMPRESA'
      Size = 3
    end
    object qry_ajuste_impressao_C_EMPRESA: TStringField
      FieldName = 'C_EMPRESA'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_EMPRESA'
      Size = 3
    end
    object qry_ajuste_impressao_C_PROCESSO: TStringField
      FieldName = 'C_PROCESSO'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_PROCESSO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_DI: TStringField
      FieldName = 'C_NR_DI'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_NR_DI'
      Size = 3
    end
    object qry_ajuste_impressao_C_DT_REG_DI: TStringField
      FieldName = 'C_DT_REG_DI'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_DT_REG_DI'
      Size = 3
    end
    object qry_ajuste_impressao_L_INSC_EST: TStringField
      FieldName = 'L_INSC_EST'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.L_INSC_EST'
      Size = 3
    end
    object qry_ajuste_impressao_C_INSC_EST: TStringField
      FieldName = 'C_INSC_EST'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_INSC_EST'
      Size = 3
    end
    object qry_ajuste_impressao_C_CNPJ_CPF: TStringField
      FieldName = 'C_CNPJ_CPF'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_CNPJ_CPF'
      Size = 3
    end
    object qry_ajuste_impressao_C_CAE: TStringField
      FieldName = 'C_CAE'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_CAE'
      Size = 3
    end
    object qry_ajuste_impressao_C_DESEMB: TStringField
      FieldName = 'C_DESEMB'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_DESEMB'
      Size = 3
    end
    object qry_ajuste_impressao_C_UFARM: TStringField
      FieldName = 'C_UFARM'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_UFARM'
      Size = 3
    end
    object qry_ajuste_impressao_L_END: TStringField
      FieldName = 'L_END'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.L_END'
      Size = 3
    end
    object qry_ajuste_impressao_C_END: TStringField
      FieldName = 'C_END'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_END'
      Size = 3
    end
    object qry_ajuste_impressao_C_BAIRRO: TStringField
      FieldName = 'C_BAIRRO'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_BAIRRO'
      Size = 3
    end
    object qry_ajuste_impressao_L_CEP: TStringField
      FieldName = 'L_CEP'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.L_CEP'
      Size = 3
    end
    object qry_ajuste_impressao_C_CEP: TStringField
      FieldName = 'C_CEP'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_CEP'
      Size = 3
    end
    object qry_ajuste_impressao_C_MUNICIPIO: TStringField
      FieldName = 'C_MUNICIPIO'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_MUNICIPIO'
      Size = 3
    end
    object qry_ajuste_impressao_C_UF_EMP: TStringField
      FieldName = 'C_UF_EMP'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_UF_EMP'
      Size = 3
    end
    object qry_ajuste_impressao_C_TEL: TStringField
      FieldName = 'C_TEL'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_TEL'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_CIF: TStringField
      FieldName = 'C_VL_CIF'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_VL_CIF'
      Size = 3
    end
    object qry_ajuste_impressao_L_ADICAO: TStringField
      FieldName = 'L_ADICAO'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.L_ADICAO'
      Size = 3
    end
    object qry_ajuste_impressao_C_ADICAO: TStringField
      FieldName = 'C_ADICAO'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_ADICAO'
      Size = 3
    end
    object qry_ajuste_impressao_C_CLASSE: TStringField
      FieldName = 'C_CLASSE'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_CLASSE'
      Size = 3
    end
    object qry_ajuste_impressao_C_TRAT: TStringField
      FieldName = 'C_TRAT'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_TRAT'
      Size = 3
    end
    object qry_ajuste_impressao_C_FUND_LEGAL: TStringField
      FieldName = 'C_FUND_LEGAL'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_FUND_LEGAL'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_MCV: TStringField
      FieldName = 'C_VL_MCV'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_VL_MCV'
      Size = 3
    end
    object qry_ajuste_impressao_L_DATA: TStringField
      FieldName = 'L_DATA'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.L_DATA'
      Size = 3
    end
    object qry_ajuste_impressao_C_DATA: TStringField
      FieldName = 'C_DATA'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_DATA'
      Size = 3
    end
    object qry_ajuste_impressao_C_REPRESENTANTE: TStringField
      FieldName = 'C_REPRESENTANTE'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_REPRESENTANTE'
      Size = 3
    end
    object qry_ajuste_impressao_L_OBS: TStringField
      FieldName = 'L_OBS'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.L_OBS'
      Size = 3
    end
    object qry_ajuste_impressao_C_OBS: TStringField
      FieldName = 'C_OBS'
      Origin = 'TAJUSTE_IMPRESSAO_EXONERACAO.C_OBS'
      Size = 3
    end
    object qry_ajuste_impressao_LookUnidade: TStringField
      FieldName = 'LookUnidade'
      LookupDataSet = qry_unidade_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 40
      Lookup = True
    end
  end
  object qry_unidade_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG')
    Left = 144
    Top = 24
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
    Left = 48
    Top = 80
  end
end

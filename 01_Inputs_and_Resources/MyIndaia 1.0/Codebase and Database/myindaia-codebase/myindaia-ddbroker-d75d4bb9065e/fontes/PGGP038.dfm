object datm_ajuste_impressao_icms: Tdatm_ajuste_impressao_icms
  Left = 342
  Top = 123
  Height = 326
  Width = 437
  object qry_ajuste_impressao_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TAJUSTE_IMPRESSAO_ICMS'
      'WHERE CD_DOCUMENTO = :CD_DOCUMENTO')
    Params.Data = {010001000C43445F444F43554D454E544F0001020030000000}
    Left = 160
    Top = 32
    object qry_ajuste_impressao_CD_DOCUMENTO: TStringField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'TAJUSTE_IMPRESSAO.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_CGC_CPF: TStringField
      FieldName = 'L_NR_CGC_CPF'
      Origin = 'TAJUSTE_IMPRESSAO.L_NR_CGC_CPF'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_CGC_CPF: TStringField
      FieldName = 'C_NR_CGC_CPF'
      Origin = 'TAJUSTE_IMPRESSAO.C_NR_CGC_CPF'
      Size = 3
    end
    object qry_ajuste_impressao_L_NM_CONTRIBUINTE: TStringField
      FieldName = 'L_NM_CONTRIBUINTE'
      Origin = 'TAJUSTE_IMPRESSAO.L_NM_CONTRIBUINTE'
      Size = 3
    end
    object qry_ajuste_impressao_C_NM_CONTRIBUINTE: TStringField
      FieldName = 'C_NM_CONTRIBUINTE'
      Origin = 'TAJUSTE_IMPRESSAO.C_NM_CONTRIBUINTE'
      Size = 3
    end
    object qry_ajuste_impressao_C_DT_REFERENCIA: TStringField
      FieldName = 'C_DT_REFERENCIA'
      Origin = 'TAJUSTE_IMPRESSAO.C_DT_REFERENCIA'
      Size = 3
    end
    object qry_ajuste_impressao_L_NM_ENDERECO: TStringField
      FieldName = 'L_NM_ENDERECO'
      Origin = 'TAJUSTE_IMPRESSAO.L_NM_ENDERECO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NM_ENDERECO: TStringField
      FieldName = 'C_NM_ENDERECO'
      Origin = 'TAJUSTE_IMPRESSAO.C_NM_ENDERECO'
      Size = 3
    end
    object qry_ajuste_impressao_L_CD_CEP: TStringField
      FieldName = 'L_CD_CEP'
      Origin = 'TAJUSTE_IMPRESSAO.L_CD_CEP'
      Size = 3
    end
    object qry_ajuste_impressao_C_CD_CEP: TStringField
      FieldName = 'C_CD_CEP'
      Origin = 'TAJUSTE_IMPRESSAO.C_CD_CEP'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_TELEFONE: TStringField
      FieldName = 'C_NR_TELEFONE'
      Origin = 'TAJUSTE_IMPRESSAO.C_NR_TELEFONE'
      Size = 3
    end
    object qry_ajuste_impressao_C_DT_VENCIMENTO: TStringField
      FieldName = 'C_DT_VENCIMENTO'
      Origin = 'TAJUSTE_IMPRESSAO.C_DT_VENCIMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_REGISTRO: TStringField
      FieldName = 'L_NR_REGISTRO'
      Origin = 'TAJUSTE_IMPRESSAO.L_NR_REGISTRO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_REGISTRO: TStringField
      FieldName = 'C_NR_REGISTRO'
      Origin = 'TAJUSTE_IMPRESSAO.C_NR_REGISTRO'
      Size = 3
    end
    object qry_ajuste_impressao_L_TX_TEXTO: TStringField
      FieldName = 'L_TX_TEXTO'
      Origin = 'TAJUSTE_IMPRESSAO.L_TX_TEXTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_TX_TEXTO: TStringField
      FieldName = 'C_TX_TEXTO'
      Origin = 'TAJUSTE_IMPRESSAO.C_TX_TEXTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_CD_RECEITA: TStringField
      FieldName = 'C_CD_RECEITA'
      Origin = 'TAJUSTE_IMPRESSAO.C_CD_RECEITA'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_ICMS: TStringField
      FieldName = 'C_VL_ICMS'
      Origin = 'TAJUSTE_IMPRESSAO.C_VL_ICMS'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_ESPEC_RECEITA: TStringField
      FieldName = 'L_NR_ESPEC_RECEITA'
      Origin = 'TAJUSTE_IMPRESSAO.L_NR_ESPEC_RECEITA'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_ESPEC_RECEITA: TStringField
      FieldName = 'C_NR_ESPEC_RECEITA'
      Origin = 'TAJUSTE_IMPRESSAO.C_NR_ESPEC_RECEITA'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_TOTAL_ICMS: TStringField
      FieldName = 'L_VL_TOTAL_ICMS'
      Origin = 'TAJUSTE_IMPRESSAO.L_VL_TOTAL_ICMS'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_TOTAL_ICMS: TStringField
      FieldName = 'C_VL_TOTAL_ICMS'
      Origin = 'TAJUSTE_IMPRESSAO.C_VL_TOTAL_ICMS'
      Size = 3
    end
    object qry_ajuste_impressao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.CD_DOCUMENTO'
      Size = 2
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
    object qry_ajuste_impressao_L_DT_VENCIMENTO: TStringField
      FieldName = 'L_DT_VENCIMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_INSCR_EST: TStringField
      FieldName = 'C_NR_INSCR_EST'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.L_NR_CGC_CPF'
      Size = 3
    end
    object qry_ajuste_impressao_L_NM_MUNICIPIO: TStringField
      FieldName = 'L_NM_MUNICIPIO'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.C_NR_CGC_CPF'
      Size = 3
    end
    object qry_ajuste_impressao_C_NM_MUNICIPIO: TStringField
      FieldName = 'C_NM_MUNICIPIO'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.L_NM_CONTRIBUINTE'
      Size = 3
    end
    object qry_ajuste_impressao_L_NM_UF: TStringField
      FieldName = 'L_NM_UF'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.C_NM_CONTRIBUINTE'
      Size = 3
    end
    object qry_ajuste_impressao_C_NM_UF: TStringField
      FieldName = 'C_NM_UF'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.C_DT_REFERENCIA'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_CAE: TStringField
      FieldName = 'C_NR_CAE'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.L_NM_ENDERECO'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_INSCR_DIV_ATIVA: TStringField
      FieldName = 'L_NR_INSCR_DIV_ATIVA'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.C_NM_ENDERECO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_INSCR_DIV_ATIVA: TStringField
      FieldName = 'C_NR_INSCR_DIV_ATIVA'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.L_CD_CEP'
      Size = 3
    end
    object qry_ajuste_impressao_L_DT_REFERENCIA: TStringField
      FieldName = 'L_DT_REFERENCIA'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.C_CD_CEP'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_AIIM: TStringField
      FieldName = 'L_NR_AIIM'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.C_NR_TELEFONE'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_AIIM: TStringField
      FieldName = 'C_NR_AIIM'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.C_DT_VENCIMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_ICMS: TStringField
      FieldName = 'L_VL_ICMS'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.L_NR_REGISTRO'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_JUROS: TStringField
      FieldName = 'L_VL_JUROS'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.C_NR_REGISTRO'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_JUROS: TStringField
      FieldName = 'C_VL_JUROS'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.L_TX_TEXTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_MULTA: TStringField
      FieldName = 'L_VL_MULTA'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.C_TX_TEXTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_MULTA: TStringField
      FieldName = 'C_VL_MULTA'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.C_CD_RECEITA'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_ACRESCIMO: TStringField
      FieldName = 'L_VL_ACRESCIMO'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.C_VL_ICMS'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_ACRESCIMO: TStringField
      FieldName = 'C_VL_ACRESCIMO'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.L_NR_ESPEC_RECEITA'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_HONORARIO: TStringField
      FieldName = 'L_VL_HONORARIO'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_HONORARIO: TStringField
      FieldName = 'C_VL_HONORARIO'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.L_NR_CGC_CPF'
      Size = 3
    end
    object qry_ajuste_impressao_LookUnidade2: TStringField
      FieldName = 'LookUnidade2'
      LookupDataSet = qry_unidade_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_ajuste_impressao_L_NR_REGISTRO2: TStringField
      FieldName = 'L_NR_REGISTRO2'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_REGISTRO2: TStringField
      FieldName = 'C_NR_REGISTRO2'
      Origin = 'TAJUSTE_IMPRESSAO_ICMS.L_NR_CGC_CPF'
      Size = 3
    end
  end
  object ds_ajuste_impressao: TDataSource
    DataSet = qry_ajuste_impressao_
    Left = 48
    Top = 32
  end
  object qry_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG')
    Left = 160
    Top = 88
  end
end

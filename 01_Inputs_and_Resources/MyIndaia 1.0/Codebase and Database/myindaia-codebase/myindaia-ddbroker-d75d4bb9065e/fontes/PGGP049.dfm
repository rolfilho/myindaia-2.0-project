object datm_ajuste_impressao_darf: Tdatm_ajuste_impressao_darf
  Left = 399
  Top = 114
  Height = 206
  Width = 323
  object qry_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG')
    Left = 48
    Top = 64
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
  object qry_ajuste_impressao_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TAJUSTE_IMPRESSAO_DARF'
      'WHERE CD_DOCUMENTO = :CD_DOCUMENTO')
    Params.Data = {010001000C43445F444F43554D454E544F0001020030000000}
    Left = 48
    Top = 8
    object qry_ajuste_impressao_CD_DOCUMENTO: TStringField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.CD_UNID_NEG'
      Size = 2
    end
    object qry_ajuste_impressao_L_PERIODO: TStringField
      FieldName = 'L_PERIODO'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_PERIODO'
      Size = 3
    end
    object qry_ajuste_impressao_C_PERIODO: TStringField
      FieldName = 'C_PERIODO'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_PERIODO'
      Size = 3
    end
    object qry_ajuste_impressao_L_CPF_CNPJ: TStringField
      FieldName = 'L_CPF_CNPJ'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_CPF_CNPJ'
      Size = 3
    end
    object qry_ajuste_impressao_C_CPF_CNPJ: TStringField
      FieldName = 'C_CPF_CNPJ'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_CPF_CNPJ'
      Size = 3
    end
    object qry_ajuste_impressao_L_N_REF: TStringField
      FieldName = 'L_N_REF'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_N_REF'
      Size = 3
    end
    object qry_ajuste_impressao_C_N_REF: TStringField
      FieldName = 'C_N_REF'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_N_REF'
      Size = 3
    end
    object qry_ajuste_impressao_C_CD_RECEITA: TStringField
      FieldName = 'C_CD_RECEITA'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_CD_RECEITA'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_REF: TStringField
      FieldName = 'L_NR_REF'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_NR_REF'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_REF: TStringField
      FieldName = 'C_NR_REF'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_NR_REF'
      Size = 3
    end
    object qry_ajuste_impressao_L_S_REF: TStringField
      FieldName = 'L_S_REF'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_S_REF'
      Size = 3
    end
    object qry_ajuste_impressao_C_S_REF: TStringField
      FieldName = 'C_S_REF'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_S_REF'
      Size = 3
    end
    object qry_ajuste_impressao_L_IMPORTADOR: TStringField
      FieldName = 'L_IMPORTADOR'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_IMPORTADOR'
      Size = 3
    end
    object qry_ajuste_impressao_C_IMPORTADOR: TStringField
      FieldName = 'C_IMPORTADOR'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_IMPORTADOR'
      Size = 3
    end
    object qry_ajuste_impressao_L_TEL_UNIDADE: TStringField
      FieldName = 'L_TEL_UNIDADE'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_TEL_UNIDADE'
      Size = 3
    end
    object qry_ajuste_impressao_C_TEL_UNIDADE: TStringField
      FieldName = 'C_TEL_UNIDADE'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_TEL_UNIDADE'
      Size = 3
    end
    object qry_ajuste_impressao_L_MASTER: TStringField
      FieldName = 'L_MASTER'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_MASTER'
      Size = 3
    end
    object qry_ajuste_impressao_C_MASTER: TStringField
      FieldName = 'C_MASTER'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_MASTER'
      Size = 3
    end
    object qry_ajuste_impressao_C_FILHOTE: TStringField
      FieldName = 'C_FILHOTE'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_FILHOTE'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_PRINC: TStringField
      FieldName = 'C_VL_PRINC'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_VL_PRINC'
      Size = 3
    end
    object qry_ajuste_impressao_L_LINHA_MOTIVO1: TStringField
      FieldName = 'L_LINHA_MOTIVO1'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_LINHA_MOTIVO1'
      Size = 3
    end
    object qry_ajuste_impressao_C_LINHA_MOTIVO1: TStringField
      FieldName = 'C_LINHA_MOTIVO1'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_LINHA_MOTIVO1'
      Size = 3
    end
    object qry_ajuste_impressao_L_LINHA_MOTIVO2: TStringField
      FieldName = 'L_LINHA_MOTIVO2'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_LINHA_MOTIVO2'
      Size = 3
    end
    object qry_ajuste_impressao_C_LINHA_MOTIVO2: TStringField
      FieldName = 'C_LINHA_MOTIVO2'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_LINHA_MOTIVO2'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_JUROS: TStringField
      FieldName = 'L_VL_JUROS'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_VL_JUROS'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_JUROS: TStringField
      FieldName = 'C_VL_JUROS'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_VL_JUROS'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_TOTAL: TStringField
      FieldName = 'L_VL_TOTAL'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.L_VL_TOTAL'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_TOTAL: TStringField
      FieldName = 'C_VL_TOTAL'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_VL_TOTAL'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_MULTA: TStringField
      FieldName = 'C_VL_MULTA'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.C_VL_MULTA'
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
    object qry_ajuste_impressao_L_DT_VENCTO: TStringField
      FieldName = 'L_DT_VENCTO'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_DT_VENCTO: TStringField
      FieldName = 'C_DT_VENCTO'
      Origin = 'TAJUSTE_IMPRESSAO_DARF.CD_UNID_NEG'
      Size = 3
    end
  end
  object ds_ajuste_impressao: TDataSource
    DataSet = qry_ajuste_impressao_
    Left = 160
    Top = 8
  end
end

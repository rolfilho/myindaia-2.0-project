object datm_ajuste_impressao_sda: Tdatm_ajuste_impressao_sda
  Left = 198
  Top = 105
  Height = 207
  Width = 437
  object qry_ajuste_impressao_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TAJUSTE_IMPRESSAO_SDA'
      'WHERE CD_DOCUMENTO = :CD_DOCUMENTO')
    Params.Data = {010001000C43445F444F43554D454E544F0001020030000000}
    Left = 160
    Top = 32
    object qry_ajuste_impressao_CD_DOCUMENTO: TStringField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_DOCUMENTO: TStringField
      FieldName = 'L_NR_DOCUMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_DOCUMENTO: TStringField
      FieldName = 'C_NR_DOCUMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_OPERACAO: TStringField
      FieldName = 'C_NR_OPERACAO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_OPERACAO'
      Size = 3
    end
    object qry_ajuste_impressao_L_NM_IMP_EXP: TStringField
      FieldName = 'L_NM_IMP_EXP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NM_IMP_EXP'
      Size = 3
    end
    object qry_ajuste_impressao_C_NM_IMP_EXP: TStringField
      FieldName = 'C_NM_IMP_EXP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NM_IMP_EXP'
      Size = 3
    end
    object qry_ajuste_impressao_L_NM_DESP: TStringField
      FieldName = 'L_NM_DESP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NM_DESP'
      Size = 3
    end
    object qry_ajuste_impressao_C_NM_DESP: TStringField
      FieldName = 'C_NM_DESP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NM_DESP'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_CPF: TStringField
      FieldName = 'C_NR_CPF'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_CPF'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_SDA: TStringField
      FieldName = 'L_VL_SDA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_VL_SDA'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_SDA: TStringField
      FieldName = 'C_VL_SDA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_VL_SDA'
      Size = 3
    end
    object qry_ajuste_impressao_C_DT_EMISSAO: TStringField
      FieldName = 'C_DT_EMISSAO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_DT_EMISSAO'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_TAXA: TStringField
      FieldName = 'L_VL_TAXA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_VL_TAXA'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_TAXA: TStringField
      FieldName = 'C_VL_TAXA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_VL_TAXA'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_TOTAL: TStringField
      FieldName = 'L_VL_TOTAL'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_VL_TOTAL'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_TOTAL: TStringField
      FieldName = 'C_VL_TOTAL'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_VL_TOTAL'
      Size = 3
    end
    object qry_ajuste_impressao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NM_DESP'
      EditMask = '!99;0; '
      Size = 2
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
    object qry_ajuste_impressao_C_OPER_IMP: TStringField
      FieldName = 'C_OPER_IMP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NM_DESP'
      Size = 3
    end
    object qry_ajuste_impressao_C_OPER_EXP: TStringField
      FieldName = 'C_OPER_EXP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_CPF'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_CONHECIMENTO: TStringField
      FieldName = 'L_NR_CONHECIMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_CONHECIMENTO: TStringField
      FieldName = 'C_NR_CONHECIMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_OPERACAO'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_CPF: TStringField
      FieldName = 'L_NR_CPF'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NM_DESP'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_PROCESSO: TStringField
      FieldName = 'L_NR_PROCESSO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_PROCESSO: TStringField
      FieldName = 'C_NR_PROCESSO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_URF_DESPACHO: TStringField
      FieldName = 'L_URF_DESPACHO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_URF_DESPACHO: TStringField
      FieldName = 'C_URF_DESPACHO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_OPER_IMP: TStringField
      FieldName = 'L_OPER_IMP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_OPER_EXP: TStringField
      FieldName = 'L_OPER_EXP'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_OPERACAO'
      Size = 3
    end
    object qry_ajuste_impressao_L_VEIC: TStringField
      FieldName = 'L_VEIC'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NM_IMP_EXP'
      Size = 3
    end
    object qry_ajuste_impressao_L_DT_ENT: TStringField
      FieldName = 'L_DT_ENT'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NM_DESP'
      Size = 3
    end
    object qry_ajuste_impressao_L_REF: TStringField
      FieldName = 'L_REF'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NM_DESP'
      Size = 3
    end
    object qry_ajuste_impressao_L_MASTER: TStringField
      FieldName = 'L_MASTER'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.C_NR_CPF'
      Size = 3
    end
    object qry_ajuste_impressao_L_VL_CIF: TStringField
      FieldName = 'L_VL_CIF'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_REF: TStringField
      FieldName = 'C_REF'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_TP_DOCUMENTO: TStringField
      FieldName = 'TP_DOCUMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 1
    end
    object qry_ajuste_impressao_C_NM_COMPL_SDA: TStringField
      FieldName = 'C_NM_COMPL_SDA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_VL_CIF: TStringField
      FieldName = 'C_VL_CIF'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_CNPJ: TStringField
      FieldName = 'C_CNPJ'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_OBS: TStringField
      FieldName = 'L_OBS'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_OBS: TStringField
      FieldName = 'C_OBS'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_NM_COMPL_SDA: TStringField
      FieldName = 'L_NM_COMPL_SDA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_NR_LINHA_GUIA: TStringField
      FieldName = 'NR_LINHA_GUIA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_CNPJ: TStringField
      FieldName = 'L_CNPJ'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_DT_EMISSAO: TStringField
      FieldName = 'L_DT_EMISSAO'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_NR_CONTA_CORRENTE: TStringField
      FieldName = 'L_NR_CONTA_CORRENTE'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_NR_CONTA_CORRENTE: TStringField
      FieldName = 'C_NR_CONTA_CORRENTE'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.L_NR_DOCUMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_CD_DESP_SDA: TStringField
      FieldName = 'C_CD_DESP_SDA'
      Origin = 'TAJUSTE_IMPRESSAO_SDA.CD_DOCUMENTO'
      Size = 3
    end
  end
  object ds_ajuste_impressao: TDataSource
    DataSet = qry_ajuste_impressao_
    Left = 48
    Top = 32
  end
  object qry_unidade_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      '')
    Left = 160
    Top = 96
    object qry_unidade_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
    object qry_unidade_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
  end
end

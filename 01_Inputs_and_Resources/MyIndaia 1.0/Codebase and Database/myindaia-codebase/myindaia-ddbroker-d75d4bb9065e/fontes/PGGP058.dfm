object datm_ajuste_impressao_nf_serv: Tdatm_ajuste_impressao_nf_serv
  Left = 530
  Top = 195
  Height = 240
  Width = 280
  object qry_ajuste_impressao_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM   TAJUSTE_IMPRESSAO_NF_SERV_INDAIA'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 48
    Top = 18
    object qry_ajuste_impressao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TAJUSTE_IMPRESSAO_BOLETO.CD_UNID_NEG'
      Size = 2
    end
    object qry_ajuste_impressao_LookUnidNeg: TStringField
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unidade_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_ajuste_impressao_L_EMISSAO: TStringField
      FieldName = 'L_EMISSAO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.CD_UNID_NEG'
      Size = 3
    end
    object qry_ajuste_impressao_C_EMISSAO: TStringField
      FieldName = 'C_EMISSAO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_EMISSAO'
      Size = 3
    end
    object qry_ajuste_impressao_C_VENCIMENTO: TStringField
      FieldName = 'C_VENCIMENTO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_EMISSAO'
      Size = 3
    end
    object qry_ajuste_impressao_L_N_REFERENCIA: TStringField
      FieldName = 'L_N_REFERENCIA'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_VENCIMENTO'
      Size = 3
    end
    object qry_ajuste_impressao_C_N_REFERENCIA: TStringField
      FieldName = 'C_N_REFERENCIA'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_N_REFERENCIA'
      Size = 3
    end
    object qry_ajuste_impressao_L_RAZAO_SOCIAL: TStringField
      FieldName = 'L_RAZAO_SOCIAL'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_N_REFERENCIA'
      Size = 3
    end
    object qry_ajuste_impressao_C_RAZAO_SOCIAL: TStringField
      FieldName = 'C_RAZAO_SOCIAL'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_RAZAO_SOCIAL'
      Size = 3
    end
    object qry_ajuste_impressao_C_CODIGO: TStringField
      FieldName = 'C_CODIGO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_RAZAO_SOCIAL'
      Size = 3
    end
    object qry_ajuste_impressao_L_ENDERECO: TStringField
      FieldName = 'L_ENDERECO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_CODIGO'
      Size = 3
    end
    object qry_ajuste_impressao_C_ENDERECO: TStringField
      FieldName = 'C_ENDERECO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_ENDERECO'
      Size = 3
    end
    object qry_ajuste_impressao_L_MUNICIPIO: TStringField
      FieldName = 'L_MUNICIPIO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_ENDERECO'
      Size = 3
    end
    object qry_ajuste_impressao_C_MUNICIPIO: TStringField
      FieldName = 'C_MUNICIPIO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_MUNICIPIO'
      Size = 3
    end
    object qry_ajuste_impressao_C_BAIRRO: TStringField
      FieldName = 'C_BAIRRO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_MUNICIPIO'
      Size = 3
    end
    object qry_ajuste_impressao_C_UF: TStringField
      FieldName = 'C_UF'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_BAIRRO'
      Size = 3
    end
    object qry_ajuste_impressao_C_CEP: TStringField
      FieldName = 'C_CEP'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_UF'
      Size = 3
    end
    object qry_ajuste_impressao_L_CNPJ: TStringField
      FieldName = 'L_CNPJ'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_CEP'
      Size = 3
    end
    object qry_ajuste_impressao_C_CNPJ: TStringField
      FieldName = 'C_CNPJ'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_CNPJ'
      Size = 3
    end
    object qry_ajuste_impressao_C_IE: TStringField
      FieldName = 'C_IE'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_CNPJ'
      Size = 3
    end
    object qry_ajuste_impressao_L_AREA: TStringField
      FieldName = 'L_AREA'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_IE'
      Size = 3
    end
    object qry_ajuste_impressao_C_AREA: TStringField
      FieldName = 'C_AREA'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_AREA'
      Size = 3
    end
    object qry_ajuste_impressao_C_ANALISTA: TStringField
      FieldName = 'C_ANALISTA'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_AREA'
      Size = 3
    end
    object qry_ajuste_impressao_L_S_REFERENCIA: TStringField
      FieldName = 'L_S_REFERENCIA'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_ANALISTA'
      Size = 3
    end
    object qry_ajuste_impressao_C_S_REFERENCIA: TStringField
      FieldName = 'C_S_REFERENCIA'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_S_REFERENCIA'
      Size = 3
    end
    object qry_ajuste_impressao_L_NAT_DESPACHO: TStringField
      FieldName = 'L_NAT_DESPACHO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_S_REFERENCIA'
      Size = 3
    end
    object qry_ajuste_impressao_C_NAT_DESPACHO: TStringField
      FieldName = 'C_NAT_DESPACHO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_NAT_DESPACHO'
      Size = 3
    end
    object qry_ajuste_impressao_C_MODAL: TStringField
      FieldName = 'C_MODAL'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_NAT_DESPACHO'
      Size = 3
    end
    object qry_ajuste_impressao_L_VEICULO: TStringField
      FieldName = 'L_VEICULO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_MODAL'
      Size = 3
    end
    object qry_ajuste_impressao_C_VEICULO: TStringField
      FieldName = 'C_VEICULO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_VEICULO'
      Size = 3
    end
    object qry_ajuste_impressao_C_ORIGEM: TStringField
      FieldName = 'C_ORIGEM'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_VEICULO'
      Size = 3
    end
    object qry_ajuste_impressao_C_DESTINO: TStringField
      FieldName = 'C_DESTINO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_ORIGEM'
      Size = 3
    end
    object qry_ajuste_impressao_L_VOLUMES: TStringField
      FieldName = 'L_VOLUMES'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_DESTINO'
      Size = 3
    end
    object qry_ajuste_impressao_C_VOLUMES: TStringField
      FieldName = 'C_VOLUMES'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_VOLUMES'
      Size = 3
    end
    object qry_ajuste_impressao_C_PESO_BRUTO: TStringField
      FieldName = 'C_PESO_BRUTO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_VOLUMES'
      Size = 3
    end
    object qry_ajuste_impressao_C_PESO_LIQUIDO: TStringField
      FieldName = 'C_PESO_LIQUIDO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_PESO_BRUTO'
      Size = 3
    end
    object qry_ajuste_impressao_L_VALOR_FOB: TStringField
      FieldName = 'L_VALOR_FOB'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_PESO_LIQUIDO'
      Size = 3
    end
    object qry_ajuste_impressao_C_VALOR_FOB: TStringField
      FieldName = 'C_VALOR_FOB'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_VALOR_FOB'
      Size = 3
    end
    object qry_ajuste_impressao_C_VALOR_CIF: TStringField
      FieldName = 'C_VALOR_CIF'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_VALOR_FOB'
      Size = 3
    end
    object qry_ajuste_impressao_L_DI: TStringField
      FieldName = 'L_DI'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_VALOR_CIF'
      Size = 3
    end
    object qry_ajuste_impressao_C_DI: TStringField
      FieldName = 'C_DI'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_DI'
      Size = 3
    end
    object qry_ajuste_impressao_NR_LINHAS: TIntegerField
      FieldName = 'NR_LINHAS'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_DI'
    end
    object qry_ajuste_impressao_L_DESCRICAO: TStringField
      FieldName = 'L_DESCRICAO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.NR_LINHAS'
      Size = 3
    end
    object qry_ajuste_impressao_C_DESCRICAO: TStringField
      FieldName = 'C_DESCRICAO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_DESCRICAO'
      Size = 3
    end
    object qry_ajuste_impressao_C_CLIENTE: TStringField
      FieldName = 'C_CLIENTE'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_DESCRICAO'
      Size = 3
    end
    object qry_ajuste_impressao_C_INDAIA: TStringField
      FieldName = 'C_INDAIA'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_CLIENTE'
      Size = 3
    end
    object qry_ajuste_impressao_C_SERVICOS: TStringField
      FieldName = 'C_SERVICOS'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_INDAIA'
      Size = 3
    end
    object qry_ajuste_impressao_L_OBS: TStringField
      FieldName = 'L_OBS'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_SERVICOS'
      Size = 3
    end
    object qry_ajuste_impressao_C_OBS: TStringField
      FieldName = 'C_OBS'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_OBS'
      Size = 3
    end
    object qry_ajuste_impressao_L_NAO_TRIBUTAVEL: TStringField
      FieldName = 'L_NAO_TRIBUTAVEL'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_OBS'
      Size = 3
    end
    object qry_ajuste_impressao_C_NAO_TRIBUTAVEL: TStringField
      FieldName = 'C_NAO_TRIBUTAVEL'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_NAO_TRIBUTAVEL'
      Size = 3
    end
    object qry_ajuste_impressao_C_SUB_TOTAL_TRIBUTAVEL: TStringField
      FieldName = 'C_SUB_TOTAL_TRIBUTAVEL'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_NAO_TRIBUTAVEL'
      Size = 3
    end
    object qry_ajuste_impressao_L_COMISSAO: TStringField
      FieldName = 'L_COMISSAO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_SUB_TOTAL_TRIBUTAVEL'
      Size = 3
    end
    object qry_ajuste_impressao_C_COMISSAO: TStringField
      FieldName = 'C_COMISSAO'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_COMISSAO'
      Size = 3
    end
    object qry_ajuste_impressao_L_TOTAL_GERAL: TStringField
      FieldName = 'L_TOTAL_GERAL'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_COMISSAO'
      Size = 3
    end
    object qry_ajuste_impressao_C_TOTAL_GERAL: TStringField
      FieldName = 'C_TOTAL_GERAL'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_TOTAL_GERAL'
      Size = 3
    end
    object qry_ajuste_impressao_L_TOTAL_TRIBUTAVEL: TStringField
      FieldName = 'L_TOTAL_TRIBUTAVEL'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_TOTAL_GERAL'
      Size = 3
    end
    object qry_ajuste_impressao_C_TOTAL_TRIBUTAVEL: TStringField
      FieldName = 'C_TOTAL_TRIBUTAVEL'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_TOTAL_TRIBUTAVEL'
      Size = 3
    end
    object qry_ajuste_impressao_L_ISS: TStringField
      FieldName = 'L_ISS'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_TOTAL_TRIBUTAVEL'
      Size = 3
    end
    object qry_ajuste_impressao_C_ISS: TStringField
      FieldName = 'C_ISS'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_ISS'
      Size = 3
    end
    object qry_ajuste_impressao_L_IRRF: TStringField
      FieldName = 'L_IRRF'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_ISS'
      Size = 3
    end
    object qry_ajuste_impressao_C_IRRF: TStringField
      FieldName = 'C_IRRF'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_IRRF'
      Size = 3
    end
    object qry_ajuste_impressao_NR_ULT_NF_SERV: TStringField
      FieldName = 'NR_ULT_NF_SERV'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_IRRF'
      Size = 6
    end
    object qry_ajuste_impressao_C_COFINS: TStringField
      FieldName = 'C_COFINS'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.L_N_REFERENCIA'
      Size = 3
    end
    object qry_ajuste_impressao_L_COFINS: TStringField
      FieldName = 'L_COFINS'
      Origin = 'TAJUSTE_IMPRESSAO_NF_SERV_INDAIA.C_N_REFERENCIA'
      Size = 3
    end
  end
  object qry_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG')
    Left = 48
    Top = 78
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
    Left = 172
    Top = 16
  end
  object qry_lista_: TQuery
    AfterScroll = qry_lista_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT A.CD_UNID_NEG, U.NM_UNID_NEG'
      'FROM   TAJUSTE_IMPRESSAO_NF_SERV_INDAIA A, TUNID_NEG U'
      'WHERE  A.CD_UNID_NEG *= U.CD_UNID_NEG')
    Left = 48
    Top = 139
    object qry_lista_CD_UNID_NEG: TStringField
      DisplayLabel = 'Cód.'
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_lista_NM_UNID_NEG: TStringField
      DisplayLabel = 'Unidade de Negócio'
      FieldName = 'NM_UNID_NEG'
      Size = 50
    end
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 172
    Top = 139
  end
end

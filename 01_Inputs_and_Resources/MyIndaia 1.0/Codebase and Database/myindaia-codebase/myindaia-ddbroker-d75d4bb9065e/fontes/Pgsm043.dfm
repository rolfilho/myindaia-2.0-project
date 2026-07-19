object datm_recontab_ctaapagar: Tdatm_recontab_ctaapagar
  Left = 65532
  Top = 65532
  Height = 492
  Width = 652
  object qry_contab_: TQuery
    DatabaseName = 'DBPROCESSO'
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      'NR_CONTAB = :NR_CONTAB')
    Params.Data = {
      010002000B43445F434F4C49474144410001020030000000094E525F434F4E54
      41420001020030000000}
    Left = 24
    Top = 23
    object qry_contab_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABILIZACAO.CD_COLIGADA'
      Size = 2
    end
    object qry_contab_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO.NR_CONTAB'
      Size = 4
    end
    object qry_contab_DT_CONTAB: TDateTimeField
      FieldName = 'DT_CONTAB'
      Origin = 'TCONTABILIZACAO.DT_CONTAB'
    end
    object qry_contab_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TCONTABILIZACAO.CD_USUARIO'
      Size = 4
    end
    object qry_contab_TP_CONTAB: TStringField
      FieldName = 'TP_CONTAB'
      Origin = 'TCONTABILIZACAO.TP_CONTAB'
      Size = 1
    end
    object qry_contab_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCONTABILIZACAO.CD_COLIGADA'
    end
    object qry_contab_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCONTABILIZACAO.CD_COLIGADA'
      Size = 2
    end
    object qry_contab_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCONTABILIZACAO.NR_CONTAB'
      Size = 2
    end
  end
  object qry_contab_lanc_: TQuery
    DatabaseName = 'DBPROCESSO'
    DataSource = ds_contab
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO_LANC'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      'NR_CONTAB = :NR_CONTAB')
    Params.Data = {
      010002000B43445F434F4C49474144410001020030000100094E525F434F4E54
      41420001020030000100}
    Left = 138
    Top = 23
    object qry_contab_lanc_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABILIZACAO_LANC.CD_COLIGADA'
      Size = 2
    end
    object qry_contab_lanc_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_LANC.NR_CONTAB'
      Size = 4
    end
    object qry_contab_lanc_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC.NR_LANCAMENTO'
      Size = 3
    end
    object qry_contab_lanc_CD_CT_DEVEDORA: TStringField
      FieldName = 'CD_CT_DEVEDORA'
      Origin = 'TCONTABILIZACAO_LANC.CD_CT_DEVEDORA'
      Size = 8
    end
    object qry_contab_lanc_CD_CT_CREDORA: TStringField
      FieldName = 'CD_CT_CREDORA'
      Origin = 'TCONTABILIZACAO_LANC.CD_CT_CREDORA'
      Size = 8
    end
    object qry_contab_lanc_VL_LANCAMENTO: TFloatField
      FieldName = 'VL_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC.VL_LANCAMENTO'
    end
    object qry_contab_lanc_CD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Origin = 'TCONTABILIZACAO_LANC.CD_HISTORICO'
      Size = 8
    end
    object qry_contab_lanc_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCONTABILIZACAO_LANC.NM_HISTORICO'
      Size = 186
    end
    object qry_contab_lanc_CD_FILIAL: TStringField
      FieldName = 'CD_FILIAL'
      Origin = 'TCONTABILIZACAO_LANC.CD_FILIAL'
      Size = 3
    end
    object qry_contab_lanc_CD_CUSTO: TStringField
      FieldName = 'CD_CUSTO'
      Origin = 'TCONTABILIZACAO_LANC.CD_CUSTO'
      Size = 3
    end
  end
  object ds_contab: TDataSource
    DataSet = qry_contab_
    Left = 24
    Top = 80
  end
  object ds_contab_lanc: TDataSource
    DataSet = qry_contab_lanc_
    Left = 138
    Top = 80
  end
  object ds_contab_gerencial: TDataSource
    DataSet = qry_contab_gerencial_
    Left = 260
    Top = 80
  end
  object qry_contab_gerencial_: TQuery
    DatabaseName = 'DBPROCESSO'
    DataSource = ds_contab_lanc
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO_GERENCIAL'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      'NR_CONTAB = :NR_CONTAB AND'
      'NR_LANCAMENTO = :NR_LANCAMENTO')
    Params.Data = {
      010003000B43445F434F4C49474144410001020030000100094E525F434F4E54
      414200010200300001000D4E525F4C414E43414D454E544F0001020030000100}
    Left = 260
    Top = 23
    object qry_contab_gerencial_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABILIZACAO_GERENCIAL.CD_COLIGADA'
      Size = 2
    end
    object qry_contab_gerencial_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_GERENCIAL.NR_CONTAB'
      Size = 4
    end
    object qry_contab_gerencial_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_GERENCIAL.NR_LANCAMENTO'
      Size = 3
    end
    object qry_contab_gerencial_CT_GERENCIAL: TStringField
      FieldName = 'CT_GERENCIAL'
      Origin = 'TCONTABILIZACAO_GERENCIAL.CT_GERENCIAL'
      Size = 4
    end
    object qry_contab_gerencial_VL_GERENCIAL: TFloatField
      FieldName = 'VL_GERENCIAL'
      Origin = 'TCONTABILIZACAO_GERENCIAL.VL_GERENCIAL'
    end
  end
  object ds_coligada: TDataSource
    DataSet = qry_coligada_
    Left = 380
    Top = 80
  end
  object qry_coligada_: TQuery
    DatabaseName = 'DBGSM'
    SQL.Strings = (
      'SELECT *'
      'FROM TCOLIGADA'
      'WHERE CD_COLIGADA <> '#39#39)
    Left = 380
    Top = 23
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
  end
end

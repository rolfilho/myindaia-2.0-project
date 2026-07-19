object datm_sel_col_data: Tdatm_sel_col_data
  OldCreateOrder = True
  Left = 30
  Top = 78
  Height = 612
  Width = 749
  object ds_coligada: TDataSource
    DataSet = qry_coligada_
    Left = 32
    Top = 15
  end
  object qry_coligada_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_COLIGADA, NM_COLIGADA'
      'FROM TCOLIGADA'
      'WHERE CD_COLIGADA <> '#39#39)
    Left = 122
    Top = 15
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
  object sp_contabiliza: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza'
    Left = 222
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_produto'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_contab'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_cont'
        ParamType = ptOutput
      end>
  end
  object qry_contab_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      'NR_CONTAB = :NR_CONTAB')
    Left = 32
    Top = 70
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end>
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
    DatabaseName = 'DBBROKER'
    DataSource = ds_contab
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO_LANC'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      'NR_CONTAB = :NR_CONTAB')
    Left = 122
    Top = 70
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end>
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
    Left = 32
    Top = 130
  end
  object ds_contab_lanc: TDataSource
    DataSet = qry_contab_lanc_
    Left = 122
    Top = 130
  end
  object ds_contab_gerencial: TDataSource
    DataSet = qry_contab_gerencial_
    Left = 222
    Top = 130
  end
  object qry_contab_gerencial_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_contab_lanc
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO_GERENCIAL'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      'NR_CONTAB = :NR_CONTAB AND'
      'NR_LANCAMENTO = :NR_LANCAMENTO')
    Left = 222
    Top = 70
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end>
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG <> '#39#39)
    Left = 330
    Top = 15
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 330
    Top = 70
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_produto_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'TPRODUTO.NM_PRODUTO'
      Size = 40
    end
  end
  object sp_contabiliza_contmaster: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza_contmaster'
    Left = 446
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_produto'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_contab'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_cont'
        ParamType = ptOutput
        Value = '0008'
      end>
  end
  object qry_contab_contmaster_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO_CONTMASTER'
      'WHERE NR_CONTAB = :NR_CONTAB')
    Left = 56
    Top = 182
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end>
    object qry_contab_contmaster_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_CONTMASTER.NR_CONTAB'
      Size = 4
    end
    object qry_contab_contmaster_DT_CONTAB: TDateTimeField
      FieldName = 'DT_CONTAB'
      Origin = 'TCONTABILIZACAO_CONTMASTER.DT_CONTAB'
    end
    object qry_contab_contmaster_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TCONTABILIZACAO_CONTMASTER.CD_USUARIO'
      Size = 4
    end
    object qry_contab_contmaster_TP_CONTAB: TStringField
      FieldName = 'TP_CONTAB'
      Origin = 'TCONTABILIZACAO_CONTMASTER.TP_CONTAB'
      Size = 1
    end
    object qry_contab_contmaster_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCONTABILIZACAO_CONTMASTER.DT_MOVIMENTO'
    end
    object qry_contab_contmaster_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCONTABILIZACAO_CONTMASTER.CD_UNID_NEG'
      Size = 2
    end
    object qry_contab_contmaster_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCONTABILIZACAO_CONTMASTER.CD_PRODUTO'
      Size = 2
    end
    object qry_contab_contmaster_CD_CT_CTAAPAGAR: TStringField
      FieldName = 'CD_CT_CTAAPAGAR'
      Origin = 'TCONTABILIZACAO_CONTMASTER.CD_CT_CTAAPAGAR'
      Size = 10
    end
    object qry_contab_contmaster_CD_CT_INSS: TStringField
      FieldName = 'CD_CT_INSS'
      Origin = 'TCONTABILIZACAO_CONTMASTER.CD_CT_INSS'
      Size = 8
    end
  end
  object qry_contab_lanc_contmaster_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_contab_contmaster
    SQL.Strings = (
      'SELECT *'
      'FROM   TCONTABILIZACAO_LANC_CONTMASTER'
      'WHERE  NR_CONTAB = :NR_CONTAB')
    Left = 226
    Top = 182
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end>
    object qry_contab_lanc_contmaster_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.NR_CONTAB'
      Size = 4
    end
    object qry_contab_lanc_contmaster_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.NR_LANCAMENTO'
      Size = 3
    end
    object qry_contab_lanc_contmaster_CD_CT_DEVEDORA: TStringField
      FieldName = 'CD_CT_DEVEDORA'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.CD_CT_DEVEDORA'
      Size = 10
    end
    object qry_contab_lanc_contmaster_CD_CT_CREDORA: TStringField
      FieldName = 'CD_CT_CREDORA'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.CD_CT_CREDORA'
      Size = 10
    end
    object qry_contab_lanc_contmaster_VL_LANCAMENTO: TFloatField
      FieldName = 'VL_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.VL_LANCAMENTO'
    end
    object qry_contab_lanc_contmaster_CD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.CD_HISTORICO'
      Size = 3
    end
    object qry_contab_lanc_contmaster_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.NM_HISTORICO'
      Size = 186
    end
    object qry_contab_lanc_contmaster_CD_FILIAL: TStringField
      FieldName = 'CD_FILIAL'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.CD_FILIAL'
      Size = 3
    end
    object qry_contab_lanc_contmaster_CD_CUSTO: TStringField
      FieldName = 'CD_CUSTO'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.CD_CUSTO'
      Size = 3
    end
    object qry_contab_lanc_contmaster_NM_FORNECEDOR: TStringField
      FieldName = 'NM_FORNECEDOR'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.NM_FORNECEDOR'
      Size = 35
    end
  end
  object ds_contab_contmaster: TDataSource
    DataSet = qry_contab_contmaster_
    Left = 56
    Top = 242
  end
  object ds_contab_lanc_contmaster: TDataSource
    DataSet = qry_contab_lanc_contmaster_
    Left = 226
    Top = 242
  end
  object ds_contab_gerencial_contmaster: TDataSource
    DataSet = qry_contab_gerencial_contmaster_
    Left = 414
    Top = 242
  end
  object qry_contab_gerencial_contmaster_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_contab_lanc_contmaster
    SQL.Strings = (
      'SELECT *'
      'FROM   TCONTABILIZACAO_GERENCIAL_CONTMASTER'
      'WHERE  NR_CONTAB = :NR_CONTAB AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO')
    Left = 414
    Top = 182
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end>
    object qry_contab_gerencial_contmaster_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_GERENCIAL_CONTMASTER.NR_CONTAB'
      Size = 4
    end
    object qry_contab_gerencial_contmaster_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_GERENCIAL_CONTMASTER.NR_LANCAMENTO'
      Size = 3
    end
    object qry_contab_gerencial_contmaster_CT_GERENCIAL: TStringField
      FieldName = 'CT_GERENCIAL'
      Origin = 'TCONTABILIZACAO_GERENCIAL_CONTMASTER.CT_GERENCIAL'
      Size = 4
    end
    object qry_contab_gerencial_contmaster_VL_GERENCIAL: TFloatField
      FieldName = 'VL_GERENCIAL'
      Origin = 'TCONTABILIZACAO_GERENCIAL_CONTMASTER.VL_GERENCIAL'
    end
  end
  object qry_contab_si_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TCONTABILIZACAO_SI'
      'WHERE  NR_CONTAB = :NR_CONTAB')
    Left = 56
    Top = 303
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end>
    object qry_contab_si_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_SI.NR_CONTAB'
      Size = 4
    end
    object qry_contab_si_DT_CONTAB: TDateTimeField
      FieldName = 'DT_CONTAB'
      Origin = 'TCONTABILIZACAO_SI.DT_CONTAB'
    end
    object qry_contab_si_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TCONTABILIZACAO_SI.CD_USUARIO'
      Size = 4
    end
    object qry_contab_si_TP_CONTAB: TStringField
      FieldName = 'TP_CONTAB'
      Origin = 'TCONTABILIZACAO_SI.TP_CONTAB'
      Size = 1
    end
    object qry_contab_si_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCONTABILIZACAO_SI.CD_UNID_NEG'
      Size = 2
    end
    object qry_contab_si_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCONTABILIZACAO_SI.CD_PRODUTO'
      Size = 2
    end
    object qry_contab_si_CD_CT_CTAAPAGAR: TStringField
      FieldName = 'CD_CT_CTAAPAGAR'
      Origin = 'TCONTABILIZACAO_SI.CD_CT_CTAAPAGAR'
      Size = 10
    end
    object qry_contab_si_CD_CT_INSS: TStringField
      FieldName = 'CD_CT_INSS'
      Origin = 'TCONTABILIZACAO_SI.CD_CT_INSS'
      Size = 8
    end
    object qry_contab_si_VL_DEBITO: TFloatField
      FieldName = 'VL_DEBITO'
      Origin = 'TCONTABILIZACAO_SI.VL_DEBITO'
    end
    object qry_contab_si_VL_CREDITO: TFloatField
      FieldName = 'VL_CREDITO'
      Origin = 'TCONTABILIZACAO_SI.VL_CREDITO'
    end
  end
  object qry_contab_lanc_si_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_contab_si
    SQL.Strings = (
      'SELECT *'
      'FROM   TCONTABILIZACAO_LANC_SI'
      'WHERE  NR_CONTAB = :NR_CONTAB')
    Left = 154
    Top = 303
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end>
    object qry_contab_lanc_si_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_LANC_SI.NR_CONTAB'
      Size = 4
    end
    object qry_contab_lanc_si_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC_SI.NR_LANCAMENTO'
      Size = 5
    end
    object qry_contab_lanc_si_DT_LANCAMENTO: TDateTimeField
      FieldName = 'DT_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC_SI.DT_LANCAMENTO'
    end
    object qry_contab_lanc_si_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Origin = 'TCONTABILIZACAO_LANC_SI.NR_DOCTO'
      Size = 6
    end
    object qry_contab_lanc_si_CD_CT_DEVEDORA: TStringField
      FieldName = 'CD_CT_DEVEDORA'
      Origin = 'TCONTABILIZACAO_LANC_SI.CD_CT_DEVEDORA'
      Size = 10
    end
    object qry_contab_lanc_si_CD_CT_CREDORA: TStringField
      FieldName = 'CD_CT_CREDORA'
      Origin = 'TCONTABILIZACAO_LANC_SI.CD_CT_CREDORA'
      Size = 10
    end
    object qry_contab_lanc_si_VL_LANCAMENTO: TFloatField
      FieldName = 'VL_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC_SI.VL_LANCAMENTO'
    end
    object qry_contab_lanc_si_CD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Origin = 'TCONTABILIZACAO_LANC_SI.CD_HISTORICO'
      Size = 3
    end
    object qry_contab_lanc_si_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCONTABILIZACAO_LANC_SI.NM_HISTORICO'
      Size = 190
    end
    object qry_contab_lanc_si_CD_FILIAL: TStringField
      FieldName = 'CD_FILIAL'
      Origin = 'TCONTABILIZACAO_LANC_SI.CD_FILIAL'
      Size = 3
    end
    object qry_contab_lanc_si_CD_CUSTO: TStringField
      FieldName = 'CD_CUSTO'
      Origin = 'TCONTABILIZACAO_LANC_SI.CD_CUSTO'
      Size = 3
    end
    object qry_contab_lanc_si_NM_FORNECEDOR: TStringField
      FieldName = 'NM_FORNECEDOR'
      Origin = 'TCONTABILIZACAO_LANC_SI.NM_FORNECEDOR'
      Size = 35
    end
    object qry_contab_lanc_si_CD_SIMBOLOGIA: TStringField
      FieldName = 'CD_SIMBOLOGIA'
      Origin = 'TCONTABILIZACAO_LANC_SI.CD_SIMBOLOGIA'
      Size = 3
    end
  end
  object ds_contab_si: TDataSource
    DataSet = qry_contab_si_
    Left = 56
    Top = 352
  end
  object ds_contab_lanc_si: TDataSource
    DataSet = qry_contab_lanc_si_
    Left = 154
    Top = 352
  end
  object sp_contabiliza_si: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza_si'
    Left = 444
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_inicio'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_fim'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_contab'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end>
  end
  object qry_limpa_si_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE TCONTABILIZACAO_SI'
      'DELETE TCONTABILIZACAO_LANC_SI'
      'WHERE DT_LANCAMENTO BETWEEN :DT_INICIO AND :DT_FIM')
    Left = 410
    Top = 306
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_FIM'
        ParamType = ptUnknown
      end>
  end
  object qry_contab_rm_tito_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TCONTABILIZACAO_RM_TITO'
      'WHERE  NR_CONTAB = :NR_CONTAB')
    Left = 56
    Top = 413
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end>
    object qry_contab_rm_tito_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABILIZACAO_RM_TITO.CD_COLIGADA'
      Size = 2
    end
    object qry_contab_rm_tito_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_RM_TITO.NR_CONTAB'
      Size = 4
    end
    object qry_contab_rm_tito_DT_CONTAB: TDateTimeField
      FieldName = 'DT_CONTAB'
      Origin = 'TCONTABILIZACAO_RM_TITO.DT_CONTAB'
    end
    object qry_contab_rm_tito_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TCONTABILIZACAO_RM_TITO.CD_USUARIO'
      Size = 4
    end
    object qry_contab_rm_tito_TP_CONTAB: TStringField
      FieldName = 'TP_CONTAB'
      Origin = 'TCONTABILIZACAO_RM_TITO.TP_CONTAB'
      Size = 1
    end
    object qry_contab_rm_tito_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCONTABILIZACAO_RM_TITO.DT_MOVIMENTO'
    end
    object qry_contab_rm_tito_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCONTABILIZACAO_RM_TITO.CD_UNID_NEG'
      Size = 2
    end
    object qry_contab_rm_tito_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCONTABILIZACAO_RM_TITO.CD_PRODUTO'
      Size = 2
    end
    object qry_contab_rm_tito_CD_CT_CTAAPAGAR: TStringField
      FieldName = 'CD_CT_CTAAPAGAR'
      Origin = 'TCONTABILIZACAO_RM_TITO.CD_CT_CTAAPAGAR'
      Size = 8
    end
    object qry_contab_rm_tito_CD_CT_INSS: TStringField
      FieldName = 'CD_CT_INSS'
      Origin = 'TCONTABILIZACAO_RM_TITO.CD_CT_INSS'
      Size = 8
    end
  end
  object qry_contab_lanc_rm_tito_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_contab_rm_tito
    SQL.Strings = (
      'SELECT *'
      'FROM   TCONTABILIZACAO_LANC_RM_TITO'
      'WHERE  NR_CONTAB = :NR_CONTAB')
    Left = 202
    Top = 413
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end>
    object qry_contab_lanc_rm_tito_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.CD_COLIGADA'
      Size = 2
    end
    object qry_contab_lanc_rm_tito_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.NR_CONTAB'
      Size = 4
    end
    object qry_contab_lanc_rm_tito_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.NR_LANCAMENTO'
      Size = 3
    end
    object qry_contab_lanc_rm_tito_CD_CT_DEVEDORA: TStringField
      FieldName = 'CD_CT_DEVEDORA'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.CD_CT_DEVEDORA'
      Size = 10
    end
    object qry_contab_lanc_rm_tito_CD_CT_CREDORA: TStringField
      FieldName = 'CD_CT_CREDORA'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.CD_CT_CREDORA'
      Size = 10
    end
    object qry_contab_lanc_rm_tito_VL_LANCAMENTO: TFloatField
      FieldName = 'VL_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.VL_LANCAMENTO'
    end
    object qry_contab_lanc_rm_tito_CD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.CD_HISTORICO'
      Size = 8
    end
    object qry_contab_lanc_rm_tito_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.NM_HISTORICO'
      Size = 186
    end
    object qry_contab_lanc_rm_tito_CD_FILIAL: TStringField
      FieldName = 'CD_FILIAL'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.CD_FILIAL'
      Size = 3
    end
    object qry_contab_lanc_rm_tito_CD_CUSTO: TStringField
      FieldName = 'CD_CUSTO'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.CD_CUSTO'
      Size = 3
    end
    object qry_contab_lanc_rm_tito_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.DT_MOVIMENTO'
    end
  end
  object ds_contab_rm_tito: TDataSource
    DataSet = qry_contab_rm_tito_
    Left = 56
    Top = 473
  end
  object ds_contab_lanc_rm_tito: TDataSource
    DataSet = qry_contab_lanc_rm_tito_
    Left = 334
    Top = 413
  end
  object ds_contab_ger_rm_tito: TDataSource
    DataSet = qry_contab_ger_rm_tito_
    Left = 202
    Top = 473
  end
  object qry_contab_ger_rm_tito_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_contab_lanc_rm_tito
    SQL.Strings = (
      'SELECT *'
      'FROM   TCONTABILIZACAO_GERENCIAL_CONTMASTER'
      'WHERE  NR_CONTAB = :NR_CONTAB AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO')
    Left = 334
    Top = 473
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end>
    object qry_contab_ger_rm_tito_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_GERENCIAL_CONTMASTER.NR_CONTAB'
      Size = 4
    end
    object qry_contab_ger_rm_tito_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_GERENCIAL_CONTMASTER.NR_LANCAMENTO'
      Size = 3
    end
    object qry_contab_ger_rm_tito_CT_GERENCIAL: TStringField
      FieldName = 'CT_GERENCIAL'
      Origin = 'TCONTABILIZACAO_GERENCIAL_CONTMASTER.CT_GERENCIAL'
      Size = 4
    end
    object qry_contab_ger_rm_tito_VL_GERENCIAL: TFloatField
      FieldName = 'VL_GERENCIAL'
      Origin = 'TCONTABILIZACAO_GERENCIAL_CONTMASTER.VL_GERENCIAL'
    end
  end
  object sp_contabiliza_rm_tito: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza_rm_tito'
    Left = 456
    Top = 414
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_produto'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_contab'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_cont'
        ParamType = ptOutput
        Value = '0008'
      end>
  end
end

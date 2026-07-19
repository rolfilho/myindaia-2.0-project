object datm_abertura_processo: Tdatm_abertura_processo
  Left = 183
  Top = 238
  Height = 241
  Width = 453
  object tbl_processo_: TTable
    OnCalcFields = tbl_processo_CalcFields
    DatabaseName = 'DBPROCESSO'
    IndexFieldNames = 'NR_PROCESSO'
    TableName = 'TPROCESSO'
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 4
    object tbl_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      Size = 11
    end
    object tbl_processo_Look_nr_Processo: TStringField
      FieldName = 'Look_nr_Processo'
      EditMask = '99/9999\-9;0; '
      Size = 7
      Calculated = True
    end
    object tbl_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Required = True
      Size = 5
    end
    object tbl_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object tbl_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object tbl_processo_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object tbl_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object tbl_processo_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
    end
    object tbl_processo_NR_PROC_RISC: TStringField
      FieldName = 'NR_PROC_RISC'
      Size = 5
    end
    object tbl_processo_QT_REF_CLIENTE: TIntegerField
      FieldName = 'QT_REF_CLIENTE'
    end
  end
  object ds_processo: TDataSource
    DataSet = tbl_processo_
    Left = 72
    Top = 4
  end
  object tbl_follow_up_: TTable
    DatabaseName = 'DBPROCESSO'
    IndexFieldNames = 'NR_PROCESSO;CD_SERVICO;CD_EVENTO'
    TableName = 'TFOLLOWUP'
    Left = 72
    Top = 57
    object tbl_follow_up_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      Size = 11
    end
    object tbl_follow_up_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Required = True
      Size = 3
    end
    object tbl_follow_up_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Required = True
      Size = 3
    end
    object tbl_follow_up_IN_APLICAVEL: TStringField
      FieldName = 'IN_APLICAVEL'
      Required = True
      Size = 1
    end
    object tbl_follow_up_CD_RESP_APLICACAO: TStringField
      FieldName = 'CD_RESP_APLICACAO'
      Size = 4
    end
    object tbl_follow_up_CD_RESP_REALIZACAO: TStringField
      FieldName = 'CD_RESP_REALIZACAO'
      Size = 4
    end
    object tbl_follow_up_CD_RESP_INSPECAO: TStringField
      FieldName = 'CD_RESP_INSPECAO'
      Size = 4
    end
    object tbl_follow_up_DT_APLICACAO: TDateTimeField
      FieldName = 'DT_APLICACAO'
    end
    object tbl_follow_up_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
    end
    object tbl_follow_up_DT_INSPECAO: TDateTimeField
      FieldName = 'DT_INSPECAO'
    end
    object tbl_follow_up_CD_RESULT_INSPECAO: TStringField
      FieldName = 'CD_RESULT_INSPECAO'
      Size = 1
    end
    object tbl_follow_up_NR_RNC: TStringField
      FieldName = 'NR_RNC'
      Size = 8
    end
  end
  object tbl_unid_neg_produto_: TTable
    DatabaseName = 'DBTABGSM'
    IndexFieldNames = 'CD_UNID_NEG;CD_PRODUTO'
    MasterFields = 'CD_UNID_NEG'
    TableName = 'TUNID_NEG_PRODUTO'
    UpdateMode = upWhereKeyOnly
    Left = 296
    Top = 52
    object tbl_unid_neg_produto_CD_UNID_NEG: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object tbl_unid_neg_produto_CD_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object tbl_unid_neg_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object tbl_unid_neg_produto_NR_ULT_FATURA: TFloatField
      DisplayLabel = 'Ult.Fatura'
      FieldName = 'NR_ULT_FATURA'
    end
    object tbl_unid_neg_produto_NR_ULT_NOTA: TFloatField
      DisplayLabel = 'Ult. Nota'
      FieldName = 'NR_ULT_NOTA'
    end
    object tbl_unid_neg_produto_NR_ULT_PROCESSO: TFloatField
      DisplayLabel = 'Ult.Processo'
      FieldName = 'NR_ULT_PROCESSO'
    end
  end
  object tbl_unid_neg_: TTable
    DatabaseName = 'DBTABGSM'
    TableName = 'TUNID_NEG'
    Left = 296
    Top = 4
    object tbl_unid_neg_CD_UNID_NEG: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object tbl_unid_neg_NM_UNID_NEG: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_UNID_NEG'
      Size = 50
    end
    object tbl_unid_neg_AP_UNID_NEG: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_UNID_NEG'
      Size = 10
    end
    object tbl_unid_neg_IN_ATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object tbl_produto_: TTable
    DatabaseName = 'DBTABGSM'
    IndexFieldNames = 'CD_PRODUTO'
    TableName = 'TPRODUTO'
    Left = 192
    Top = 56
    object tbl_produto_CD_PRODUTO: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object tbl_produto_NM_PRODUTO: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_PRODUTO'
      Size = 40
    end
    object tbl_produto_AP_PRODUTO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_PRODUTO'
      Size = 10
    end
    object tbl_produto_IN_ATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'IN_ATIVO'
      Visible = False
      Size = 1
    end
  end
  object tbl_empresa_: TTable
    DatabaseName = 'DBCAD'
    IndexFieldNames = 'CD_EMPRESA'
    TableName = 'TEMPRESA_NAC'
    Left = 192
    Top = 116
    object tbl_empresa_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Size = 5
    end
    object tbl_empresa_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object tbl_empresa_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object tbl_empresa_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      Size = 50
    end
    object tbl_empresa_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object tbl_empresa_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Size = 30
    end
    object tbl_empresa_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 30
    end
    object tbl_empresa_END_UF: TStringField
      FieldName = 'END_UF'
      Size = 2
    end
    object tbl_empresa_END_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 8
    end
    object tbl_empresa_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Size = 1
    end
    object tbl_empresa_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Size = 14
    end
    object tbl_empresa_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Size = 11
    end
    object tbl_empresa_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
    end
    object tbl_empresa_OUTRO_DOC: TStringField
      FieldName = 'OUTRO_DOC'
    end
    object tbl_empresa_DT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
    end
    object tbl_empresa_IN_FATURAMENTO: TStringField
      FieldName = 'IN_FATURAMENTO'
      Size = 1
    end
    object tbl_empresa_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object tbl_empresa_IN_RESTRICAO: TStringField
      FieldName = 'IN_RESTRICAO'
      Size = 1
    end
    object tbl_empresa_IN_EVENTUAL: TStringField
      FieldName = 'IN_EVENTUAL'
      Size = 1
    end
    object tbl_empresa_CD_TIPO_REF: TStringField
      FieldName = 'CD_TIPO_REF'
      Size = 1
    end
    object tbl_empresa_CD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      Size = 3
    end
  end
  object tbl_servico_: TTable
    DatabaseName = 'DBCAD'
    TableName = 'TSERVICO'
    Left = 300
    Top = 116
    object tbl_servico_CD_SERVICO: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_SERVICO'
      Required = True
      Size = 3
    end
    object tbl_servico_NM_SERVICO: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_SERVICO'
      Required = True
      Size = 50
    end
  end
  object tbl_ref_proc_cliente_: TTable
    DatabaseName = 'DBPROCESSO'
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_processo
    TableName = 'TREF_CLIENTE'
    Left = 72
    Top = 112
    object tbl_ref_proc_cliente_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      Size = 11
    end
    object tbl_ref_proc_cliente_SEQ_REF: TStringField
      FieldName = 'SEQ_REF'
      Required = True
      Size = 2
    end
    object tbl_ref_proc_cliente_CD_REFERENCIA: TStringField
      DisplayLabel = 'S/Referência'
      FieldName = 'CD_REFERENCIA'
      Required = True
      Size = 15
    end
    object tbl_ref_proc_cliente_PB_REFERENCIA: TFloatField
      DisplayLabel = 'Peso Bruto (Kg)'
      FieldName = 'PB_REFERENCIA'
      DisplayFormat = '#0,.00000'
    end
    object tbl_ref_proc_cliente_TX_CLIENTE: TStringField
      DisplayLabel = 'Texto'
      FieldName = 'TX_CLIENTE'
      Size = 15
    end
    object tbl_ref_proc_cliente_QT_CNTR_20: TSmallintField
      DisplayLabel = 'Containes 20´'
      FieldName = 'QT_CNTR_20'
      DisplayFormat = '#0,.00'
    end
    object tbl_ref_proc_cliente_QT_CNTR_40: TSmallintField
      DisplayLabel = 'Containes 40´'
      FieldName = 'QT_CNTR_40'
      DisplayFormat = '#0,.00'
    end
  end
end

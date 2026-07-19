object datm_receb_num_solic: Tdatm_receb_num_solic
  Left = 247
  Top = 145
  Height = 350
  Width = 563
  object dsq_n_ref: TDataSource
    DataSet = qry_n_ref_
    Left = 52
    Top = 16
  end
  object qry_n_ref_: TQuery
    OnCalcFields = qry_n_ref_CalcFields
    DatabaseName = 'DBPROCESSO'
    SQL.Strings = (
      'SELECT TNUMERARIO.NR_PROCESSO , NR_SOLICITACAO , '
      ' DT_SOLICITACAO , TNUMERARIO.CD_USUARIO , CD_STATUS , '
      ' VL_SOLICITADO , VL_RECEBIDO , '
      ' QT_ITENS_SOLIC'
      'FROM TNUMERARIO TNUMERARIO,'
      '            TPROCESSO TPROCESSO'
      'WHERE TPROCESSO.CD_CLIENTE = :CD_CLIENTE AND'
      
        '               TNUMERARIO.NR_PROCESSO = TPROCESSO.NR_PROCESSO AN' +
        'D'
      '               TNUMERARIO.CD_STATUS = '#39'A'#39' AND'
      '               TNUMERARIO.NR_PROCESSO LIKE :CD_UNID_PROD '
      '')
    Params.Data = {
      010002000A43445F434C49454E54450001060030303030320000010C43445F55
      4E49445F50524F44000106003031303125000001}
    Left = 184
    Top = 16
    object qry_n_ref_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TNUMERARIO.NR_PROCESSO'
      Size = 11
    end
    object qry_n_ref_Look_nr_processo: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'Look_nr_processo'
      Size = 9
      Calculated = True
    end
    object qry_n_ref_NR_SOLICITACAO: TStringField
      DisplayLabel = 'Nº Solic'
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TNUMERARIO.NR_SOLICITACAO'
      Size = 3
    end
    object qry_n_ref_DT_SOLICITACAO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_SOLICITACAO'
      Origin = 'TNUMERARIO.DT_SOLICITACAO'
    end
    object qry_n_ref_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TNUMERARIO.CD_USUARIO'
      Size = 4
    end
    object qry_n_ref_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TNUMERARIO.CD_STATUS'
      Size = 1
    end
    object qry_n_ref_VL_SOLICITADO: TFloatField
      DisplayLabel = 'Solicitação'
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO.VL_SOLICITADO'
      DisplayFormat = '#0,.00'
    end
    object qry_n_ref_VL_RECEBIDO: TFloatField
      DisplayLabel = 'Recebido'
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO.VL_RECEBIDO'
      DisplayFormat = '#0,.00'
    end
    object qry_n_ref_QT_ITENS_SOLIC: TIntegerField
      FieldName = 'QT_ITENS_SOLIC'
      Origin = 'TNUMERARIO.QT_ITENS_SOLIC'
    end
    object qry_n_ref_Status: TStringField
      FieldName = 'Status'
      Calculated = True
    end
  end
  object tbl_servico_: TTable
    DatabaseName = 'DBCAD'
    TableName = 'TSERVICO'
    Left = 308
    Top = 64
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
  object tbl_empresa_: TTable
    DatabaseName = 'DBCAD'
    IndexFieldNames = 'CD_EMPRESA'
    TableName = 'TEMPRESA_NAC'
    Left = 308
    Top = 16
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
  object tbl_processo_w_: TTable
    DatabaseName = 'DBPROCESSO'
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = dsq_n_ref
    TableName = 'TPROCESSO'
    Left = 52
    Top = 64
    object tbl_processo_w_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      Size = 11
    end
    object tbl_processo_w_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object tbl_processo_w_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object tbl_processo_w_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
    end
    object tbl_processo_w_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object tbl_processo_w_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object tbl_processo_w_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object tbl_processo_w_TXT_OBSERVACOES: TMemoField
      FieldName = 'TXT_OBSERVACOES'
      BlobType = ftMemo
    end
    object tbl_processo_w_QT_SOLINUM: TIntegerField
      FieldName = 'QT_SOLINUM'
    end
    object tbl_processo_w_QT_RECEBIMENTO: TIntegerField
      FieldName = 'QT_RECEBIMENTO'
    end
    object tbl_processo_w_QT_DEVOLUCOES: TIntegerField
      FieldName = 'QT_DEVOLUCOES'
    end
    object tbl_processo_w_QT_LANC_FAT: TIntegerField
      FieldName = 'QT_LANC_FAT'
    end
    object tbl_processo_w_NR_PROC_RISC: TStringField
      FieldName = 'NR_PROC_RISC'
      Size = 5
    end
  end
  object dsq_item_cd: TDataSource
    DataSet = qry_item_cd
    Left = 404
    Top = 16
  end
  object qry_item_cd: TQuery
    DatabaseName = 'DBCAD'
    SQL.Strings = (
      
        'SELECT CD_ITEM , NM_ITEM , CD_TIPO_ITEM, NR_PRIORIDADE, CD_TIPO_' +
        'LANC_FAT'
      'FROM TITEM TITEM'
      'WHERE (CD_TIPO_ITEM = '#39'D'#39') OR (CD_TIPO_ITEM = '#39'R'#39' ) '
      'ORDER BY CD_ITEM')
    Left = 476
    Top = 16
    object qry_item_cdCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_cdNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object qry_item_cdCD_TIPO_ITEM: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Origin = 'TITEM.CD_TIPO_ITEM'
      Size = 1
    end
    object qry_item_cdNR_PRIORIDADE: TIntegerField
      FieldName = 'NR_PRIORIDADE'
      Origin = 'TITEM.CD_ITEM'
    end
    object qry_item_cdCD_TIPO_LANC_FAT: TStringField
      FieldName = 'CD_TIPO_LANC_FAT'
      Origin = 'TITEM.CD_ITEM'
      Size = 1
    end
  end
  object dsq_item_nm: TDataSource
    DataSet = qry_item_nm
    Left = 404
    Top = 64
  end
  object qry_item_nm: TQuery
    DatabaseName = 'DBCAD'
    SQL.Strings = (
      'SELECT CD_ITEM , NM_ITEM , CD_TIPO_ITEM'
      'FROM TITEM TITEM'
      'WHERE (CD_TIPO_ITEM = '#39'D'#39') OR (CD_TIPO_ITEM = '#39'R'#39' ) '
      'ORDER BY NM_ITEM')
    Left = 476
    Top = 64
    object qry_item_nmCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_nmNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object qry_item_nmCD_TIPO_ITEM: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Origin = 'TITEM.CD_TIPO_ITEM'
      Size = 1
    end
  end
  object tbl_unid_neg_: TTable
    DatabaseName = 'DBTABGSM'
    TableName = 'TUNID_NEG'
    Left = 308
    Top = 112
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
    Left = 308
    Top = 160
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
  object tbl_unid_neg_produto_: TTable
    DatabaseName = 'DBTABGSM'
    IndexFieldNames = 'CD_UNID_NEG;CD_PRODUTO'
    MasterFields = 'CD_UNID_NEG'
    TableName = 'TUNID_NEG_PRODUTO'
    UpdateMode = upWhereKeyOnly
    Left = 308
    Top = 208
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
  object ds_usuario: TDataSource
    DataSet = tbl_usuario_
    Left = 404
    Top = 112
  end
  object tbl_usuario_: TTable
    DatabaseName = 'DBTABGSM'
    TableName = 'TUSUARIO'
    Left = 476
    Top = 112
    object tbl_usuario_CD_USUARIO: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object tbl_usuario_AP_USUARIO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_USUARIO'
      Size = 15
    end
    object tbl_usuario_NM_USUARIO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_USUARIO'
      Size = 50
    end
    object tbl_usuario_CD_SENHA: TStringField
      FieldName = 'CD_SENHA'
      Size = 10
    end
    object tbl_usuario_CD_UNID_NEG: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object tbl_usuario_CD_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object tbl_usuario_CD_CARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CD_CARGO'
      Size = 3
    end
    object tbl_usuario_IN_ATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object ds_banco: TDataSource
    DataSet = tbl_banco_
    Left = 404
    Top = 160
  end
  object tbl_banco_: TTable
    DatabaseName = 'DBCAD'
    TableName = 'TBANCO'
    Left = 476
    Top = 160
    object tbl_banco_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Required = True
      Size = 3
    end
    object tbl_banco_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Required = True
      Size = 40
    end
    object tbl_banco_AP_BANCO: TStringField
      FieldName = 'AP_BANCO'
      Size = 10
    end
    object tbl_banco_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Size = 10
    end
    object tbl_banco_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Size = 5
    end
    object tbl_banco_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Size = 8
    end
  end
  object ds_recebimento: TDataSource
    DataSet = tbl_recebimento_
    Left = 52
    Top = 112
  end
  object tbl_recebimento_: TTable
    DatabaseName = 'DBPROCESSO'
    TableName = 'TRECEBIMENTO'
    Left = 184
    Top = 112
    object tbl_recebimento_NR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Size = 11
    end
    object tbl_recebimento_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object tbl_recebimento_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Size = 3
    end
    object tbl_recebimento_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object tbl_recebimento_NR_RECEBIMENTO: TStringField
      DisplayLabel = 'Recto.'
      FieldName = 'NR_RECEBIMENTO'
      Size = 3
    end
    object tbl_recebimento_DT_RECEBIMENTO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_RECEBIMENTO'
    end
    object tbl_recebimento_VL_RECEBIMENTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_RECEBIMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object tbl_recebimento_QT_ITENS_RECEB: TIntegerField
      FieldName = 'QT_ITENS_RECEB'
    end
    object tbl_recebimento_IN_CANCELADO: TBooleanField
      FieldName = 'IN_CANCELADO'
    end
    object tbl_recebimento_DT_CANCELAMENTO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_CANCELAMENTO'
    end
    object tbl_recebimento_CD_USUARIO_CANC: TStringField
      DisplayLabel = 'Usuário'
      FieldName = 'CD_USUARIO_CANC'
      Size = 4
    end
  end
  object dsq_itens_receb: TDataSource
    DataSet = qry_itens_receb_
    Left = 52
    Top = 160
  end
  object qry_itens_receb_: TQuery
    DatabaseName = 'DBPROCESSO'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_RECEBIMENTO , '
      ' NR_LANC_RECEB , NR_SOLICITACAO , '
      ' NR_LANCAMENTO , CD_ITEM , VL_SOLICITADO , '
      ' VL_RECEBIDO , IN_CANCELADO'
      'FROM TRECEBIMENTO_ITEM_RECEB TRECEBIMENTO_ITEM_RECEB'
      ' WHERE NR_PROCESSO = :NR_PROCESSO AND'
      ' NR_RECEBIMENTO = :NR_RECEBIMENTO')
    Params.Data = {
      010002000B4E525F50524F434553534F00010200300000000E4E525F52454345
      42494D454E544F0001020030000000}
    Left = 184
    Top = 160
    object qry_itens_receb_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TNUMERARIO_ITEM_RECEB.NR_PROCESSO'
      Size = 11
    end
    object qry_itens_receb_NR_RECEBIMENTO: TStringField
      DisplayLabel = 'Recebimento'
      FieldName = 'NR_RECEBIMENTO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_PROCESSO'
      Size = 6
    end
    object qry_itens_receb_NR_LANC_RECEB: TStringField
      FieldName = 'NR_LANC_RECEB'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_PROCESSO'
      Size = 6
    end
    object qry_itens_receb_NR_SOLICITACAO: TStringField
      DisplayLabel = 'Nº Solic.'
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TNUMERARIO_ITEM_RECEB.NR_SOLICITACAO'
      Size = 3
    end
    object qry_itens_receb_NR_LANCAMENTO: TStringField
      DisplayLabel = 'Lanc.'
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TNUMERARIO_ITEM_RECEB.NR_LANCAMENTO'
      Size = 3
    end
    object qry_itens_receb_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TNUMERARIO_ITEM_RECEB.NR_PROCESSO'
      Size = 3
    end
    object qry_itens_receb_VL_SOLICITADO: TFloatField
      DisplayLabel = 'Solicitado'
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO_ITEM_RECEB.VL_SOLICITADO'
      DisplayFormat = '#0,.00'
    end
    object qry_itens_receb_VL_RECEBIDO: TFloatField
      DisplayLabel = 'Recebido'
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO_ITEM_RECEB.VL_RECEBIDO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_receb_Look_nm_item: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'Look_nm_item'
      LookupDataSet = qry_item_cd
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 40
      Lookup = True
    end
    object qry_itens_receb_IN_CANCELADO: TBooleanField
      FieldName = 'IN_CANCELADO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_RECEBIMENTO'
    end
  end
  object dsq_itens_por_prioridade_: TDataSource
    DataSet = qry_itens_por_prioridade_
    Left = 52
    Top = 208
  end
  object qry_itens_por_prioridade_: TQuery
    DatabaseName = 'DBPROCESSO'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_SOLICITACAO , '
      ' NR_LANCAMENTO , CD_ITEM , NR_PRIORIDADE , '
      ' CD_TIPO_CALCULO , TP_SOLIC_INFORM , '
      ' VL_ITEM_CALCULADO , VL_SOLICITADO , '
      ' CD_STATUS , VL_RECEBIDO , VL_UTILIZADO'
      'FROM TNUMERARIO_ITEM_SOLIC TNUMERARIO_ITEM_SOLIC'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_PRIORIDADE')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 184
    Top = 208
    object qry_itens_por_prioridade_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 11
    end
    object qry_itens_por_prioridade_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_SOLICITACAO'
      Size = 3
    end
    object qry_itens_por_prioridade_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_LANCAMENTO'
      Size = 3
    end
    object qry_itens_por_prioridade_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_ITEM'
      Size = 3
    end
    object qry_itens_por_prioridade_NR_PRIORIDADE: TIntegerField
      FieldName = 'NR_PRIORIDADE'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PRIORIDADE'
    end
    object qry_itens_por_prioridade_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_TIPO_CALCULO'
      Size = 3
    end
    object qry_itens_por_prioridade_TP_SOLIC_INFORM: TStringField
      FieldName = 'TP_SOLIC_INFORM'
      Origin = 'TNUMERARIO_ITEM_SOLIC.TP_SOLIC_INFORM'
      Size = 3
    end
    object qry_itens_por_prioridade_VL_ITEM_CALCULADO: TFloatField
      FieldName = 'VL_ITEM_CALCULADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_ITEM_CALCULADO'
    end
    object qry_itens_por_prioridade_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_SOLICITADO'
    end
    object qry_itens_por_prioridade_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_STATUS'
      Size = 1
    end
    object qry_itens_por_prioridade_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_RECEBIDO'
    end
    object qry_itens_por_prioridade_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_UTILIZADO'
    end
  end
  object qry_verif_item_999_: TQuery
    DatabaseName = 'DBPROCESSO'
    RequestLive = True
    Left = 184
    Top = 64
  end
  object sp_cancela_itens_receb_: TStoredProc
    DatabaseName = 'DBPROCESSO'
    StoredProcName = 'dbo.sp_apaga_itens_receb;1'
    Params.Data = {
      0100030006526573756C74040304000000000000010C406E725F70726F636573
      736F01010200300000000F406E725F7265636562696D656E746F010102003000
      0000}
    Left = 52
    Top = 260
    object StringField3: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_soma_todas_solinum_: TStoredProc
    DatabaseName = 'DBPROCESSO'
    StoredProcName = 'dbo.sp_soma_todas_solic_num;1'
    Params.Data = {
      0100020006526573756C74040304000000000000000C406E725F70726F636573
      736F0101020030000000}
    Left = 184
    Top = 260
    object StringField5: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField6: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
end

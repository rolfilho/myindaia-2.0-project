object datm_fat_sol: Tdatm_fat_sol
  OldCreateOrder = True
  Top = 41
  Height = 748
  Width = 1129
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM , NM_ITEM , CD_TIPO_ITEM, CD_TIPO_LANC_FAT'
      'FROM   TITEM (NOLOCK)'
      'WHERE  IN_ATIVO = '#39'1'#39' '
      'ORDER BY CD_ITEM')
    Left = 44
    Top = 107
    object qry_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object qry_item_CD_TIPO_ITEM: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Origin = 'TITEM.CD_TIPO_ITEM'
      Size = 1
    end
    object qry_item_CD_TIPO_LANC_FAT: TStringField
      FieldName = 'CD_TIPO_LANC_FAT'
      Origin = 'TITEM.CD_ITEM'
      Size = 1
    end
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 645
    Top = 107
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
    object tbl_yesno_IN_YESNO: TBooleanField
      FieldName = 'IN_YESNO'
      Required = True
    end
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TBANCO (NOLOCK)')
    Left = 138
    Top = 107
    object qry_banco_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
    object qry_banco_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Origin = 'TBANCO.NM_BANCO'
      Size = 40
    end
    object qry_banco_AP_BANCO: TStringField
      FieldName = 'AP_BANCO'
      Origin = 'TBANCO.AP_BANCO'
      Size = 10
    end
    object qry_banco_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'TBANCO.NR_CONTA'
      Size = 10
    end
    object qry_banco_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Origin = 'TBANCO.CD_AGENCIA'
      Size = 5
    end
    object qry_banco_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TBANCO.CD_CT_CONTABIL'
      Size = 8
    end
    object qry_banco_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TBANCO.IN_ATIVO'
      Size = 1
    end
    object qry_banco_TP_CONTA: TStringField
      FieldName = 'TP_CONTA'
      Origin = 'TBANCO.TP_CONTA'
      Size = 1
    end
    object qry_banco_IN_FINANCEIRO: TStringField
      FieldName = 'IN_FINANCEIRO'
      Origin = 'TBANCO.IN_FINANCEIRO'
      Size = 1
    end
    object qry_banco_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TBANCO.FORMCONT'
      Size = 1
    end
    object qry_banco_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TBANCO.LEXTENSO2'
      Size = 3
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUNID_NEG (NOLOCK)'
      'WHERE CD_UNID_NEG <> '#39#39)
    Left = 44
    Top = 12
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Size = 10
    end
    object qry_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 50
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TPRODUTO (NOLOCK)'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 138
    Top = 12
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_produto_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Size = 10
    end
    object qry_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUSUARIO_HABILITACAO (NOLOCK)'
      'WHERE CD_USUARIO = :CD_USUARIO AND'
      '               CD_UNID_NEG = :CD_UNID_NEG AND'
      '               CD_PRODUTO = :CD_PRODUTO'
      ''
      '               ')
    Left = 138
    Top = 60
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_usuario_habilitacao_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUSUARIO_HABILITACAO.CD_PRODUTO'
      Size = 2
    end
    object qry_usuario_habilitacao_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO_HABILITACAO.IN_ATIVO'
      Size = 1
    end
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_fat_proc
    SQL.Strings = (
      'SELECT P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_PRODUTO,'
      '               P.CD_CLIENTE, P.CD_SERVICO, P.IN_LIBERADO,'
      
        '              C.AP_EMPRESA, C.CD_GRUPO, S.NM_SERVICO, P.VL_II_MN' +
        ', P.VL_IPI_MN, P.VL_ICMS_MN'
      
        'FROM TPROCESSO P (NOLOCK), TEMPRESA_NAC C (NOLOCK), TSERVICO S (' +
        'NOLOCK)'
      'WHERE (P.CD_CLIENTE *= C.CD_EMPRESA) AND'
      '              (P.CD_SERVICO *= S.CD_SERVICO) AND'
      '              (P.IN_PRODUCAO = '#39'1'#39' )  AND '
      '              (P.IN_CANCELADO = '#39'0'#39' ) AND'
      '              (P.NR_PROCESSO = :NR_PROCESSO)  ')
    Left = 756
    Top = 202
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Size = 1
    end
    object qry_processo_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_processo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
    object qry_processo_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Size = 50
    end
    object qry_processo_VL_II_MN: TFloatField
      FieldName = 'VL_II_MN'
    end
    object qry_processo_VL_IPI_MN: TFloatField
      FieldName = 'VL_IPI_MN'
    end
    object qry_processo_VL_ICMS_MN: TFloatField
      FieldName = 'VL_ICMS_MN'
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 756
    Top = 249
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TUSUARIO (NOLOCK)')
    Left = 44
    Top = 60
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'TUSUARIO.NM_USUARIO'
      Size = 50
    end
    object qry_usuario_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Origin = 'TUSUARIO.AP_USUARIO'
      Size = 15
    end
    object qry_usuario_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO.IN_ATIVO'
      Size = 1
    end
  end
  object qry_fat_: TQuery
    AfterScroll = qry_fat_AfterScroll
    OnCalcFields = qry_fat_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, CD_PRODUTO, NR_SOLICITACAO, CD_USUARIO, TP_T' +
        'IPO_FAT, NR_NOTA_FATURA,'
      
        '       CD_CANCELADOR, TX_OBSERVACOES, NR_RELATORIO, NR_ANO, NR_N' +
        'F_SERV,'
      
        '       IN_CALCULADO, IN_CANCELADO, IN_LIQ_AUT, IN_IMP_NF_SERV, I' +
        'N_LIQUIDADO,'
      
        '       DT_SOLICITACAO, DT_FATURA, DT_VENCTO_FATURA, DT_CALCULO, ' +
        'DT_NF_SERV, DT_CANCELAMENTO, IN_PREVIEW'
      'FROM   TS_FATURA'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       DT_FATURA = :DT_FATURA'
      'ORDER BY'
      'NR_SOLICITACAO')
    Left = 236
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FATURA'
        ParamType = ptInput
      end>
    object qry_fat_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TS_FATURA.CD_UNID_NEG'
      Size = 2
    end
    object qry_fat_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TS_FATURA.CD_PRODUTO'
      Size = 2
    end
    object qry_fat_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TS_FATURA.NR_SOLICITACAO'
      Size = 6
    end
    object qry_fat_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TS_FATURA.CD_USUARIO'
      Size = 4
    end
    object qry_fat_TP_TIPO_FAT: TStringField
      FieldName = 'TP_TIPO_FAT'
      Origin = 'TS_FATURA.TP_TIPO_FAT'
      Size = 1
    end
    object qry_fat_NR_NOTA_FATURA: TStringField
      FieldName = 'NR_NOTA_FATURA'
      Origin = 'TS_FATURA.NR_NOTA_FATURA'
      Size = 6
    end
    object qry_fat_CD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      Origin = 'TS_FATURA.CD_CANCELADOR'
      Size = 4
    end
    object qry_fat_TX_OBSERVACOES: TMemoField
      FieldName = 'TX_OBSERVACOES'
      Origin = 'TS_FATURA.TX_OBSERVACOES'
      BlobType = ftMemo
    end
    object qry_fat_NR_RELATORIO: TStringField
      FieldName = 'NR_RELATORIO'
      Origin = 'TS_FATURA.NR_RELATORIO'
      Size = 3
    end
    object qry_fat_NR_ANO: TStringField
      FieldName = 'NR_ANO'
      Origin = 'TS_FATURA.NR_ANO'
      Size = 4
    end
    object qry_fat_IN_CALCULADO: TStringField
      FieldName = 'IN_CALCULADO'
      Origin = 'TS_FATURA.IN_CALCULADO'
      Size = 1
    end
    object qry_fat_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TS_FATURA.IN_CANCELADO'
      Size = 1
    end
    object qry_fat_IN_LIQ_AUT: TStringField
      FieldName = 'IN_LIQ_AUT'
      Origin = 'TS_FATURA.IN_LIQ_AUT'
      Size = 1
    end
    object qry_fat_IN_IMP_NF_SERV: TStringField
      FieldName = 'IN_IMP_NF_SERV'
      Origin = 'TS_FATURA.IN_IMP_NF_SERV'
      Size = 1
    end
    object qry_fat_IN_LIQUIDADO: TStringField
      FieldName = 'IN_LIQUIDADO'
      Origin = 'TS_FATURA.IN_LIQUIDADO'
      Size = 1
    end
    object qry_fat_DT_SOLICITACAO: TDateTimeField
      FieldName = 'DT_SOLICITACAO'
      Origin = 'TS_FATURA.DT_SOLICITACAO'
    end
    object qry_fat_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TS_FATURA.DT_FATURA'
    end
    object qry_fat_DT_VENCTO_FATURA: TDateTimeField
      FieldName = 'DT_VENCTO_FATURA'
      Origin = 'TS_FATURA.DT_VENCTO_FATURA'
    end
    object qry_fat_DT_CALCULO: TDateTimeField
      FieldName = 'DT_CALCULO'
      Origin = 'TS_FATURA.DT_CALCULO'
    end
    object qry_fat_DT_NF_SERV: TDateTimeField
      FieldName = 'DT_NF_SERV'
      Origin = 'TS_FATURA.DT_NF_SERV'
    end
    object qry_fat_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'TS_FATURA.DT_CANCELAMENTO'
    end
    object qry_fat_NR_NF_SERV: TStringField
      FieldName = 'NR_NF_SERV'
      Origin = 'TS_FATURA.CD_UNID_NEG'
      Size = 6
    end
    object qry_fat_look_nm_usuario: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_usuario'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Lookup = True
    end
    object qry_fat_look_Calculado: TStringField
      FieldKind = fkLookup
      FieldName = 'look_Calculado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CALCULADO'
      Size = 4
      Lookup = True
    end
    object qry_fat_look_Cancelado: TStringField
      FieldKind = fkLookup
      FieldName = 'look_Cancelado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CANCELADO'
      Size = 4
      Lookup = True
    end
    object qry_fat_look_nm_cancelador: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_cancelador'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_CANCELADOR'
      Size = 30
      Lookup = True
    end
    object qry_fat_CalcNrSolicitacao: TStringField
      DisplayLabel = 'N'#186' Solicita'#231#227'o'
      FieldKind = fkCalculated
      FieldName = 'CalcNrSolicitacao'
      Size = 7
      Calculated = True
    end
    object qry_fat_IN_PREVIEW: TStringField
      FieldName = 'IN_PREVIEW'
      Origin = 'DBBROKER.TS_FATURA.IN_PREVIEW'
      FixedChar = True
      Size = 1
    end
  end
  object ds_fat: TDataSource
    DataSet = qry_fat_
    Left = 236
    Top = 60
  end
  object qry_fat_proc_: TQuery
    AfterOpen = qry_fat_proc_AfterOpen
    BeforeInsert = qry_fat_proc_BeforeInsert
    BeforeEdit = qry_fat_proc_BeforeEdit
    BeforePost = qry_fat_proc_BeforePost
    AfterCancel = qry_fat_proc_AfterCancel
    BeforeDelete = qry_fat_proc_BeforeDelete
    AfterScroll = qry_fat_proc_AfterScroll
    OnCalcFields = qry_fat_proc_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_fat
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TS_FATURA_PROCESSO'
      'WHERE (CD_UNID_NEG = :CD_UNID_NEG) AND'
      '      (CD_PRODUTO = :CD_PRODUTO) AND'
      '      (NR_SOLICITACAO = :NR_SOLICITACAO)')
    Left = 334
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptUnknown
        Size = 7
      end>
    object qry_fat_proc_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TS_FATURA_PROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_fat_proc_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TS_FATURA_PROCESSO.CD_PRODUTO'
      Size = 2
    end
    object qry_fat_proc_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TS_FATURA_PROCESSO.NR_SOLICITACAO'
      Size = 6
    end
    object qry_fat_proc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TS_FATURA_PROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_fat_proc_Calc_Nr_Processo: TStringField
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'Calc_Nr_Processo'
      Size = 14
      Calculated = True
    end
  end
  object ds_fat_proc: TDataSource
    DataSet = qry_fat_proc_
    Left = 334
    Top = 60
  end
  object qry_fat_proc_item_: TQuery
    AfterOpen = qry_fat_proc_item_AfterOpen
    BeforeInsert = qry_fat_proc_item_BeforeInsert
    BeforeEdit = qry_fat_proc_item_BeforeEdit
    AfterPost = qry_fat_proc_item_AfterPost
    AfterCancel = qry_fat_proc_item_AfterCancel
    AfterScroll = qry_fat_proc_item_AfterScroll
    OnCalcFields = qry_fat_proc_item_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_fat_proc
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TS_FATURA_PROCESSO_ITEM'
      'WHERE (CD_UNID_NEG = :CD_UNID_NEG) AND'
      '              (CD_PRODUTO = :CD_PRODUTO) AND'
      '              (NR_SOLICITACAO = :NR_SOLICITACAO) AND'
      '              (NR_PROCESSO = :NR_PROCESSO)')
    Left = 444
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptUnknown
        Size = 7
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object qry_fat_proc_item_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TS_FATURA_PROCESSO_ITEM.CD_UNID_NEG'
      Size = 2
    end
    object qry_fat_proc_item_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TS_FATURA_PROCESSO_ITEM.CD_PRODUTO'
      Size = 2
    end
    object qry_fat_proc_item_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TS_FATURA_PROCESSO_ITEM.NR_SOLICITACAO'
      EditMask = '99/9999;0;_'
      Size = 6
    end
    object qry_fat_proc_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TS_FATURA_PROCESSO_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_fat_proc_item_CD_ITEM: TStringField
      DisplayLabel = 'C'#243'd'
      FieldName = 'CD_ITEM'
      Origin = 'TS_FATURA_PROCESSO_ITEM.CD_ITEM'
      Size = 3
    end
    object qry_fat_proc_item_VL_CALCULADO: TFloatField
      DisplayLabel = 'Vl. Calculado'
      FieldName = 'VL_CALCULADO'
      Origin = 'TS_FATURA_PROCESSO_ITEM.VL_CALCULADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_proc_item_VL_INFORMADO: TFloatField
      DisplayLabel = 'Vl Informado'
      FieldName = 'VL_INFORMADO'
      Origin = 'TS_FATURA_PROCESSO_ITEM.VL_INFORMADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_proc_item_look_nm_item: TStringField
      DisplayLabel = 'Item'
      FieldKind = fkLookup
      FieldName = 'look_nm_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 40
      Lookup = True
    end
    object qry_fat_proc_item_IN_RESTITUI: TStringField
      FieldName = 'IN_RESTITUI'
      Origin = 'TS_FATURA_PROCESSO_ITEM.CD_UNID_NEG'
      Size = 1
    end
    object qry_fat_proc_item_look_restitui: TStringField
      FieldKind = fkLookup
      FieldName = 'look_restitui'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_RESTITUI'
      Size = 4
      Lookup = True
    end
    object qry_fat_proc_item_look_cd_tipo_item: TStringField
      FieldKind = fkLookup
      FieldName = 'look_cd_tipo_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'CD_TIPO_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 1
      Lookup = True
    end
    object qry_fat_proc_item_calc_nm_item: TStringField
      DisplayLabel = 'Item'
      FieldKind = fkCalculated
      FieldName = 'calc_nm_item'
      Size = 36
      Calculated = True
    end
    object qry_fat_proc_item_look_in_fat_sol: TStringField
      FieldKind = fkLookup
      FieldName = 'look_in_fat_sol'
      LookupDataSet = qry_tipo_item_
      LookupKeyFields = 'CD_TIPO_ITEM'
      LookupResultField = 'IN_FAT_SOLIC'
      KeyFields = 'look_cd_tipo_item'
      Size = 1
      Lookup = True
    end
    object qry_fat_proc_item_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TS_FATURA_PROCESSO_ITEM.CD_UNID_NEG'
      Size = 5
    end
    object qry_fat_proc_item_look_nm_favorecido: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_favorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_fat_proc_item_IN_NAO_FAT: TStringField
      FieldName = 'IN_NAO_FAT'
      Origin = 'TS_FATURA_PROCESSO_ITEM.CD_UNID_NEG'
      Size = 1
    end
    object qry_fat_proc_item_INDICE: TStringField
      FieldName = 'INDICE'
      Origin = 'TS_FATURA_PROCESSO_ITEM.CD_PRODUTO'
      Size = 1
    end
    object qry_fat_proc_item_IN_MANUAL: TStringField
      FieldName = 'IN_MANUAL'
      Origin = 'TS_FATURA_PROCESSO_ITEM.CD_UNID_NEG'
      Size = 1
    end
    object qry_fat_proc_item_CD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TS_FATURA_PROCESSO_ITEM.CD_CT_CUSTO'
      FixedChar = True
      Size = 25
    end
  end
  object ds_fat_proc_item: TDataSource
    DataSet = qry_fat_proc_item_
    Left = 444
    Top = 60
  end
  object qry_fat_cc_: TQuery
    OnCalcFields = qry_fat_cc_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_LANCAMENTO, CD_ITEM, DT_LANCAMENTO, Y.TX_' +
        'YESNO, VL_ITEM,'
      '       VL_ASSIST, IN_RESTITUI, NM_ITEM_COMPLEMENTO, IN_SEL_FAT'
      'FROM   TFATURAMENTO_CC F, TYES_NO Y (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       F.IN_SEL_FAT = Y.CD_YESNO AND'
      '       IN_CANCELADO = '#39'0'#39' AND'
      '       DT_LANCAMENTO <= :DT_FATURA AND'
      '       ( ( ( ISNULL( IN_FATURADO, '#39'0'#39' ) = '#39'0'#39' ) AND'
      '           NOT EXISTS'
      '           ( SELECT *'
      '             FROM   TS_FATURA'
      '             WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '                    CD_PRODUTO = :CD_PRODUTO AND'
      '                    NR_SOLICITACAO = :NR_SOLICITACAO AND'
      '                    IN_CALCULADO = '#39'1'#39' AND'
      '                    IN_CANCELADO = '#39'0'#39' ) ) OR'
      '         ( ( ISNULL( IN_FATURADO, '#39'0'#39' ) <> '#39'0'#39' AND'
      '             CD_UNID_NEG = :CD_UNID_NEG AND'
      '             CD_PRODUTO = :CD_PRODUTO AND'
      '             NR_SOLIC_FAT = :NR_SOLICITACAO ) AND'
      '           EXISTS'
      '           ( SELECT *'
      '             FROM   TS_FATURA'
      '             WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '                    CD_PRODUTO = :CD_PRODUTO AND'
      '                    NR_SOLICITACAO = :NR_SOLICITACAO AND'
      '                    IN_CALCULADO = '#39'1'#39' AND'
      '                    IN_CANCELADO = '#39'0'#39' ) ) ) AND'
      '       ( CD_ITEM IN ( SELECT I.CD_ITEM'
      
        '                      FROM   TITEM I (NOLOCK), TTIPO_ITEM T (NOL' +
        'OCK)'
      '                      WHERE  I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND'
      '                             T.IN_FATURAR = '#39'1'#39' ) )')
    Left = 552
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = #39'x'#39
      end
      item
        DataType = ftDate
        Name = 'DT_FATURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end>
    object qry_fat_cc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFATURAMENTO_CC.NR_PROCESSO'
      Size = 18
    end
    object qry_fat_cc_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TFATURAMENTO_CC.NR_LANCAMENTO'
      Size = 6
    end
    object qry_fat_cc_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TFATURAMENTO_CC.CD_ITEM'
      Size = 3
    end
    object qry_fat_cc_VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
      Origin = 'TFATURAMENTO_CC.VL_ITEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_cc_NM_ITEM_COMPLEMENTO: TStringField
      FieldName = 'NM_ITEM_COMPLEMENTO'
      Origin = 'TFATURAMENTO_CC.NR_PROCESSO'
    end
    object qry_fat_cc_calc_vl_lancamento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_lancamento'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_fat_cc_look_nm_item: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_fat_cc_IN_RESTITUI: TStringField
      FieldName = 'IN_RESTITUI'
      Origin = 'TFATURAMENTO_CC.NR_LANCAMENTO'
      Size = 1
    end
    object qry_fat_cc_calc_nm_item: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_item'
      Size = 40
      Calculated = True
    end
    object qry_fat_cc_DT_LANCAMENTO: TDateTimeField
      FieldName = 'DT_LANCAMENTO'
      Origin = 'TFATURAMENTO_CC.NR_PROCESSO'
    end
    object qry_fat_cc_TX_YESNO: TStringField
      DisplayLabel = 'Fat.?'
      FieldName = 'TX_YESNO'
      Size = 3
    end
    object qry_fat_cc_VL_ASSIST: TFloatField
      FieldName = 'VL_ASSIST'
    end
    object qry_fat_cc_IN_SEL_FAT: TStringField
      FieldName = 'IN_SEL_FAT'
      Size = 1
    end
  end
  object ds_fat_cc: TDataSource
    DataSet = qry_fat_cc_
    Left = 552
    Top = 60
  end
  object qry_controle_: TQuery
    AfterScroll = qry_controle_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TS_FATURA_CONTROLE (NOLOCK)'
      'WHERE CD_UNID_NEG =:CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO')
    Left = 334
    Top = 107
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_controle_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TS_FATURA_CONTROLE.CD_UNID_NEG'
      Size = 2
    end
    object qry_controle_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TS_FATURA_CONTROLE.CD_PRODUTO'
      Size = 2
    end
    object qry_controle_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TS_FATURA_CONTROLE.DT_MOVIMENTO'
    end
    object qry_controle_IN_FECHADO: TStringField
      FieldName = 'IN_FECHADO'
      Origin = 'TS_FATURA_CONTROLE.IN_FECHADO'
      Size = 1
    end
    object qry_controle_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TS_FATURA_CONTROLE.CD_USUARIO'
      Size = 4
    end
    object qry_controle_DT_FECHAMENTO: TDateTimeField
      FieldName = 'DT_FECHAMENTO'
      Origin = 'TS_FATURA_CONTROLE.DT_FECHAMENTO'
    end
    object qry_controle_IN_CONTABILIZADO: TStringField
      FieldName = 'IN_CONTABILIZADO'
      Origin = 'TS_FATURA_CONTROLE.IN_CONTABILIZADO'
      Size = 1
    end
    object qry_controle_DT_CONTABILIZACAO: TDateTimeField
      FieldName = 'DT_CONTABILIZACAO'
      Origin = 'TS_FATURA_CONTROLE.DT_CONTABILIZACAO'
    end
    object qry_controle_CD_CONTABILIZADOR: TStringField
      FieldName = 'CD_CONTABILIZADOR'
      Origin = 'TS_FATURA_CONTROLE.CD_CONTABILIZADOR'
      Size = 4
    end
  end
  object qry_cre_deb_cc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      
        'TOTAL  = SUM ( ISNULL(VL_ITEM,0) - ISNULL(VL_IR,0) + ISNULL(VL_A' +
        'SSIST,0) ),'
      'CRED_F ='
      
        '  (SELECT SUM ( ISNULL( VL_ITEM, 0) - ISNULL( VL_IR, 0 ) + ISNUL' +
        'L( VL_ASSIST, 0 ) )'
      
        '     FROM TFATURAMENTO_CC F, TITEM I (NOLOCK), TTIPO_ITEM T (NOL' +
        'OCK)'
      '     WHERE F.CD_ITEM = I.CD_ITEM AND'
      '           I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND'
      '           T.TP_NATUREZA = '#39'C'#39' AND'
      
        '           ( ( ( F.DT_LANCAMENTO = :DT_PAGTO_ITEM ) AND ( :DT_PA' +
        'GTO_ITEM IS NOT NULL ) ) OR'
      '             ( :DT_PAGTO_ITEM IS NULL ) ) AND'
      
        '           (IN_FATURADO = '#39'0'#39' OR NR_SOLIC_FAT = :NR_SOLIC_FAT) A' +
        'ND'
      '           (NR_PROCESSO = :NR_PROCESSO) ),'
      'DEB_F  ='
      
        '  (SELECT SUM ( ISNULL( VL_ITEM, 0 ) - ISNULL( VL_IR, 0 ) + ISNU' +
        'LL(VL_ASSIST, 0 ) )'
      
        '     FROM TFATURAMENTO_CC F, TITEM I (NOLOCK), TTIPO_ITEM T (NOL' +
        'OCK)'
      '     WHERE F.CD_ITEM = I.CD_ITEM AND'
      '           I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND'
      '           T.TP_NATUREZA = '#39'D'#39' AND'
      
        '           ( ( ( F.DT_LANCAMENTO = :DT_PAGTO_ITEM ) AND ( :DT_PA' +
        'GTO_ITEM IS NOT NULL ) ) OR'
      '             ( :DT_PAGTO_ITEM IS NULL ) ) AND'
      
        '           (IN_FATURADO = '#39'0'#39' OR NR_SOLIC_FAT = :NR_SOLIC_FAT) A' +
        'ND'
      '           (NR_PROCESSO = :NR_PROCESSO) )'
      'FROM TFATURAMENTO_CC F, TITEM I (NOLOCK), TTIPO_ITEM T (NOLOCK)'
      'WHERE F.CD_ITEM = I.CD_ITEM AND'
      '      I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND'
      '      (IN_FATURADO = '#39'0'#39' OR NR_SOLIC_FAT = :NR_SOLIC_FAT) AND'
      '      (NR_PROCESSO = :NR_PROCESSO)'
      '')
    Left = 444
    Top = 107
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_PAGTO_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_PAGTO_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_PAGTO_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_SOLIC_FAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_PAGTO_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_PAGTO_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_PAGTO_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_SOLIC_FAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_SOLIC_FAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_cre_deb_cc_TOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object qry_cre_deb_cc_CRED_F: TFloatField
      FieldName = 'CRED_F'
    end
    object qry_cre_deb_cc_DEB_F: TFloatField
      FieldName = 'DEB_F'
    end
  end
  object qry_cre_deb_fat_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '
      'TOTAL  = SUM( ISNULL( F.VL_INFORMADO, 0 ) ),'
      'CRED_F ='
      '  (SELECT SUM( ISNULL( F.VL_INFORMADO, 0 ) )'
      
        '     FROM TS_FATURA_PROCESSO_ITEM F, TITEM I (NOLOCK), TTIPO_ITE' +
        'M T (NOLOCK)'
      '     WHERE F.CD_ITEM = I.CD_ITEM AND'
      '           I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND'
      '           T.TP_NATUREZA = '#39'C'#39') AND'
      
        '           ( ( ( F.DT_LANCAMENTO = :DT_PAGTO_ITEM ) AND ( :DT_PA' +
        'GTO_ITEM IS NOT NULL ) ) OR'
      '             ( :DT_PAGTO_ITEM IS NULL ) ) AND'
      
        '           ( IN_FATURADO = '#39'0'#39' OR NR_SOLIC_FAT = :NR_SOLIC_FAT )' +
        ','
      'DEB_F  ='
      '  (SELECT SUM ( ISNULL( VL_INFORMADO, 0 ) )'
      
        '     FROM TS_FATURA_PROCESSO_ITEM F, TITEM I (NOLOCK), TTIPO_ITE' +
        'M T (NOLOCK)'
      '     WHERE F.CD_ITEM = I.CD_ITEM AND'
      '           I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND'
      '           T.TP_NATUREZA = '#39'D'#39') AND'
      
        '           ( ( ( F.DT_LANCAMENTO = :DT_PAGTO_ITEM ) AND ( :DT_PA' +
        'GTO_ITEM IS NOT NULL ) ) OR'
      '             ( :DT_PAGTO_ITEM IS NULL ) ) AND'
      
        '           ( IN_FATURADO = '#39'0'#39' OR NR_SOLIC_FAT = :NR_SOLIC_FAT )' +
        ','
      
        'FROM TS_FATURA_PROCESSO_ITEM F, TITEM I (NOLOCK), TTIPO_ITEM T (' +
        'NOLOCK)'
      'WHERE F.CD_ITEM = I.CD_ITEM AND'
      '      I.CD_TIPO_ITEM = T.CD_TIPO_ITEM'
      '')
    Left = 444
    Top = 155
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DT_PAGTO_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_PAGTO_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_PAGTO_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_SOLIC_FAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_PAGTO_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_PAGTO_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_PAGTO_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_SOLIC_FAT'
        ParamType = ptUnknown
      end>
    object qry_cre_deb_fat_TOT: TFloatField
      FieldName = 'TOT'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object sp_fat_saldos: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_fat_saldos'
    Left = 44
    Top = 155
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
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
        DataType = ftString
        Name = '@nr_solic'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_cred_proc'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = '@vl_deb_proc'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = '@vl_cred_sol'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = '@vl_deb_sol'
        ParamType = ptOutput
      end>
  end
  object sp_fat_calc_padrao: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_fat_calc_padrao'
    Left = 138
    Top = 155
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_solicitacao'
        ParamType = ptInput
      end>
  end
  object sp_fat_calculo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_fat_calculo'
    Left = 236
    Top = 155
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
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
        DataType = ftString
        Name = '@nr_solicitacao'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_sd_fat_zero'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = '@nr_identificador'
        ParamType = ptOutput
      end>
  end
  object sp_fat_canc: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_fat_canc'
    Left = 334
    Top = 155
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
        DataType = ftString
        Name = '@nr_solicitacao'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end>
  end
  object qry_fat_ult_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT ISNULL( MAX(NR_SOLICITACAO), :PREFIXO +'#39'0000'#39' ) NR_ULT_SO' +
        'LICITACAO'
      '   FROM   TS_FATURA (NOLOCK)'
      '   WHERE ( CD_UNID_NEG = :CD_UNID_NEG ) AND'
      '  ( CD_PRODUTO = :CD_PRODUTO ) AND'
      '  SUBSTRING(NR_SOLICITACAO, 1, 2) = :SOLIC')
    Left = 552
    Top = 107
    ParamData = <
      item
        DataType = ftString
        Name = 'PREFIXO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SOLIC'
        ParamType = ptInput
      end>
    object qry_fat_ult_NR_ULT_SOLICITACAO: TStringField
      FieldName = 'NR_ULT_SOLICITACAO'
      Size = 6
    end
  end
  object ds_yesno_: TDataSource
    DataSet = tbl_yesno_
    Left = 645
    Top = 155
  end
  object qry_tipo_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTIPO_ITEM (NOLOCK)')
    Left = 236
    Top = 107
    object qry_tipo_item_CD_TIPO_ITEM: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Origin = 'TTIPO_ITEM.CD_TIPO_ITEM'
      Size = 1
    end
    object qry_tipo_item_NM_TIPO_ITEM: TStringField
      FieldName = 'NM_TIPO_ITEM'
      Origin = 'TTIPO_ITEM.NM_TIPO_ITEM'
      Size = 30
    end
    object qry_tipo_item_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TTIPO_ITEM.TP_NATUREZA'
      Size = 1
    end
    object qry_tipo_item_IN_FATURAR: TStringField
      FieldName = 'IN_FATURAR'
      Origin = 'TTIPO_ITEM.IN_FATURAR'
      Size = 1
    end
    object qry_tipo_item_IN_RESTITUI: TStringField
      FieldName = 'IN_RESTITUI'
      Origin = 'TTIPO_ITEM.IN_RESTITUI'
      Size = 1
    end
    object qry_tipo_item_IN_FAT_SOLIC: TStringField
      FieldName = 'IN_FAT_SOLIC'
      Origin = 'TTIPO_ITEM.IN_SOLIC_NUM'
      Size = 1
    end
  end
  object sp_contabiliza: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza'
    Left = 138
    Top = 202
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
        ParamType = ptInput
      end>
  end
  object qry_contab_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO (NOLOCK)'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      'NR_CONTAB = :NR_CONTAB')
    Left = 236
    Top = 202
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
      'FROM TCONTABILIZACAO_LANC (NOLOCK)'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      'NR_CONTAB = :NR_CONTAB')
    Left = 334
    Top = 202
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
      Size = 10
    end
    object qry_contab_lanc_CD_CT_CREDORA: TStringField
      FieldName = 'CD_CT_CREDORA'
      Origin = 'TCONTABILIZACAO_LANC.CD_CT_CREDORA'
      Size = 10
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
    Left = 236
    Top = 249
  end
  object ds_contab_lanc: TDataSource
    DataSet = qry_contab_lanc_
    Left = 334
    Top = 249
  end
  object ds_contab_gerencial: TDataSource
    DataSet = qry_contab_gerencial_
    Left = 444
    Top = 249
  end
  object qry_contab_gerencial_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_contab_lanc
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO_GERENCIAL (NOLOCK)'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      'NR_CONTAB = :NR_CONTAB AND'
      'NR_LANCAMENTO = :NR_LANCAMENTO')
    Left = 444
    Top = 202
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
  object qry_log_erro_calculo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE'
      'TLOG_ERRO_CALCULO'
      'WHERE '
      'CD_USUARIO = :CD_USUARIO')
    Left = 44
    Top = 202
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_log_erro_calculo_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TLOG_ERRO_CALCULO.CD_USUARIO'
      Size = 4
    end
    object qry_log_erro_calculo_NM_STORED_PROCEDURE: TStringField
      FieldName = 'NM_STORED_PROCEDURE'
      Origin = 'TLOG_ERRO_CALCULO.NM_STORED_PROCEDURE'
      Size = 30
    end
    object qry_log_erro_calculo_CD_ERRO: TSmallintField
      FieldName = 'CD_ERRO'
      Origin = 'TLOG_ERRO_CALCULO.CD_ERRO'
    end
    object qry_log_erro_calculo_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TLOG_ERRO_CALCULO.CD_USUARIO'
      Size = 3
    end
  end
  object qry_tot_erro_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) TOT_ERRO'
      'FROM TLOG_ERRO_CALCULO (NOLOCK)'
      'WHERE CD_USUARIO = :CD_USUARIO')
    Left = 44
    Top = 249
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_tot_erro_TOT_ERRO: TIntegerField
      FieldName = 'TOT_ERRO'
    end
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO'
      'FROM TFAVORECIDO (NOLOCK)'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 645
    Top = 202
    object qry_favorecido_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 5
    end
    object qry_favorecido_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 50
    end
  end
  object qry_proc_fat_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    ParamCheck = False
    SQL.Strings = (
      'SELECT F.NR_SOLICITACAO, F.DT_FATURA'
      'FROM TS_FATURA F,'
      '           TS_FATURA_PROCESSO P'
      'WHERE F.CD_UNID_NEG = P.CD_UNID_NEG AND'
      '              F.CD_PRODUTO = P.CD_PRODUTO AND'
      '              F.NR_SOLICITACAO = P.NR_SOLICITACAO AND'
      '              F.TP_TIPO_FAT = '#39'F'#39' AND'
      '              F.IN_CANCELADO = '#39'0'#39' AND'
      '              P.NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY F.DT_FATURA DESC, F.NR_SOLICITACAO DESC')
    Left = 552
    Top = 155
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_proc_fat_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TS_FATURA.NR_SOLICITACAO'
      Size = 6
    end
    object qry_proc_fat_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TS_FATURA.DT_FATURA'
    end
  end
  object qry_pend_followup_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      'SELECT COUNT(*) TOT_PEND'
      'FROM   TFOLLOWUP F (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       IN_APLICAVEL = '#39'1'#39' AND'
      '       ISNULL( DT_REALIZACAO, '#39#39' ) = '#39#39' AND'
      '       NR_ORDEM < ( SELECT NR_ORDEM'
      '                    FROM   TFOLLOWUP FP (NOLOCK)'
      '                    WHERE  F.NR_PROCESSO = FP.NR_PROCESSO AND'
      
        '                           FP.CD_EVENTO = ( SELECT CD_EV_ENVIO_F' +
        'AT FROM TPARAMETROS (NOLOCK) ) )'
      ''
      '')
    Left = 138
    Top = 249
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_pend_followup_TOT_PEND: TIntegerField
      FieldName = 'TOT_PEND'
    end
  end
  object qry_cliente_habil_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_DIAS_VENCTO_FATURA, CD_RESPONSAVEL, IN_DIA_UTIL_EMISSA' +
        'O_FAT, IN_AVISO_RETENCAO, IN_REMESSA'
      'FROM TCLIENTE_HABILITACAO (NOLOCK)'
      'WHERE CD_CLIENTE = :CD_CLIENTE'
      'AND CD_UNID_NEG = :CD_UNID_NEG'
      'AND CD_PRODUTO = :CD_PRODUTO')
    Left = 552
    Top = 202
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
  end
  object qry_fat_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT F.CD_UNID_NEG, F.CD_PRODUTO, F.NR_SOLICITACAO, FP.NR_PROC' +
        'ESSO, P.CD_CLIENTE, E.AP_EMPRESA, F.DT_IMPRESSAO'
      
        'FROM   TS_FATURA F, TS_FATURA_PROCESSO FP, TPROCESSO P (NOLOCK),' +
        ' TEMPRESA_NAC E (NOLOCK)'
      'WHERE  F.CD_UNID_NEG    = FP.CD_UNID_NEG    AND'
      '       F.CD_PRODUTO     = FP.CD_PRODUTO     AND'
      '       F.NR_SOLICITACAO = FP.NR_SOLICITACAO AND'
      '       FP.NR_PROCESSO   = P.NR_PROCESSO     AND'
      '       P.CD_CLIENTE     = E.CD_EMPRESA      AND'
      '       F.IN_CANCELADO   = '#39'0'#39'               AND'
      '       F.IN_IMPRESSO    = '#39'1'#39'               AND'
      '       F.TP_TIPO_FAT '#9' = '#39'D'#39'               AND'
      
        '       F.DT_IMPRESSAO BETWEEN CONVERT( datetime, :DT_INICIO, 103' +
        ' ) AND CONVERT( datetime, :DT_TERMINO, 103 ) AND'
      '       ( ( E.CD_GRUPO   = :CD_GRUPO   OR :CD_GRUPO   = '#39#39' ) AND'
      '         ( P.CD_CLIENTE = :CD_CLIENTE OR :CD_CLIENTE = '#39#39' ) )'
      '')
    Left = 552
    Top = 249
    ParamData = <
      item
        DataType = ftString
        Name = 'DT_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DT_TERMINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
    object qry_fat_cliente_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_fat_cliente_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_fat_cliente_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Size = 6
    end
    object qry_fat_cliente_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_fat_cliente_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_fat_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_fat_cliente_DT_IMPRESSAO: TDateTimeField
      FieldName = 'DT_IMPRESSAO'
    end
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO, NM_GRUPO'
      'FROM TGRUPO (NOLOCK)'
      'WHERE CD_GRUPO = :CD_GRUPO ')
    Left = 645
    Top = 249
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end>
    object qry_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TGRUPO.CD_GRUPO'
      Size = 3
    end
    object qry_grupo_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'TGRUPO.NM_GRUPO'
      Size = 50
    end
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC (NOLOCK)'
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Left = 756
    Top = 60
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
    object qry_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_cliente_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
      Size = 10
    end
  end
  object qry_itens_pago_cli_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'INSERT TS_FATURA_PROCESSO_ITEM'
      
        '   ( CD_UNID_NEG, CD_PRODUTO, NR_SOLICITACAO, NR_PROCESSO, CD_IT' +
        'EM,'
      
        '     VL_CALCULADO, VL_INFORMADO, IN_RESTITUI, CD_FAVORECIDO, IN_' +
        'NAO_FAT )'
      
        'SELECT  :CD_UNID_NEG, :CD_PRODUTO, :NR_SOLICITACAO, NR_PROCESSO,' +
        ' CD_ITEM, ISNULL( VL_ITEM_CALCULADO, 0 ), ISNULL( VL_ITEM_CALCUL' +
        'ADO, 0 ), '#39'0'#39', CD_FAVORECIDO, '#39'*'#39
      'FROM   TNUMERARIO_ITEM_SOLIC'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       TP_DESTINO IN ( '#39'0'#39', '#39'1'#39' ) AND'
      '       IN_CANCELADO = '#39'0'#39' AND'
      '       CD_ITEM NOT IN ( SELECT CD_ITEM'
      '                        FROM   TFATURAMENTO_CC'
      '                        WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '                               IN_CANCELADO = '#39'0'#39' AND'
      '                               IN_FATURADO = '#39'0'#39' ) AND'
      '       NOT EXISTS( SELECT NR_PROCESSO'
      '                   FROM   TFATURAMENTO_CC'
      '                   WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      
        '                          CD_ITEM IN ( SELECT CD_ITEM_PAGO_CLI F' +
        'ROM TPARAMETROS (NOLOCK) ) )'
      ''
      'INSERT TS_FATURA_PROCESSO_ITEM'
      
        '   ( CD_UNID_NEG, CD_PRODUTO, NR_SOLICITACAO, NR_PROCESSO, CD_IT' +
        'EM,'
      '     VL_CALCULADO, VL_INFORMADO, IN_RESTITUI )'
      
        'SELECT  :CD_UNID_NEG, :CD_PRODUTO, :NR_SOLICITACAO, NR_PROCESSO,' +
        ' ( SELECT CD_ITEM_PAGO_CLI FROM TPARAMETROS (NOLOCK) ) CD_ITEM,'
      
        '        SUM( ISNULL( VL_ITEM_CALCULADO, 0 ) ), SUM( ISNULL( VL_I' +
        'TEM_CALCULADO, 0 ) ), '#39'0'#39
      'FROM   TNUMERARIO_ITEM_SOLIC'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       TP_DESTINO IN ( '#39'0'#39', '#39'1'#39' ) AND'
      '       IN_CANCELADO = '#39'0'#39' AND'
      '       CD_ITEM NOT IN ( SELECT CD_ITEM'
      '                        FROM   TFATURAMENTO_CC'
      '                        WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '                               IN_CANCELADO = '#39'0'#39' AND'
      '                               IN_FATURADO = '#39'0'#39' ) AND'
      '       NOT EXISTS( SELECT NR_PROCESSO'
      '                   FROM   TFATURAMENTO_CC'
      '                   WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      
        '                          CD_ITEM IN ( SELECT CD_ITEM_PAGO_CLI F' +
        'ROM TPARAMETROS (NOLOCK) ) )'
      'GROUP BY NR_SOLICITACAO, NR_PROCESSO')
    Left = 645
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_atz_fat_cc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TFATURAMENTO_CC'
      'SET    IN_SEL_FAT = :IN_SEL_FAT'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO AND'
      '       ( ( :IN_SEL_FAT = '#39'0'#39' ) OR'
      '         ( :IN_SEL_FAT = '#39'1'#39' AND'
      '           CD_ITEM NOT IN ( SELECT CD_ITEM'
      
        '                            FROM   TCLIENTE_FAT_ITEM_COMPLEMENTA' +
        'R FI (NOLOCK), TPROCESSO P (NOLOCK)'
      
        '                            WHERE  NR_PROCESSO = P.NR_PROCESSO A' +
        'ND'
      
        '                                   P.CD_CLIENTE = FI.CD_CLIENTE ' +
        'AND'
      
        '                                   P.CD_UNID_NEG = FI.CD_UNID_NE' +
        'G AND'
      
        '                                   P.CD_PRODUTO = FI.CD_PRODUTO ' +
        'AND'
      
        '                                   P.CD_SERVICO = FI.CD_SERVICO ' +
        'AND'
      '                                   FI.IN_ATIVO = '#39'1'#39' ) ) )'
      '')
    Left = 756
    Top = 155
    ParamData = <
      item
        DataType = ftString
        Name = 'IN_SEL_FAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IN_SEL_FAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IN_SEL_FAT'
        ParamType = ptUnknown
      end>
  end
  object sp_rel_fin_controle_num: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_fin_controle_num'
    Left = 645
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
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
        DataType = ftString
        Name = '@cd_grupo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_vencto'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = '@nr_relatorio'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = '@nr_ano'
        ParamType = ptOutput
      end>
  end
  object sp_fat_pagos_cli: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_fat_pagos_cli'
    Left = 756
    Top = 107
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
        DataType = ftString
        Name = '@nr_solicitacao'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SISTEMA_CONTABIL, VL_REMESSA'
      'FROM TPARAMETROS (NOLOCK)')
    Left = 756
    Top = 12
    object qry_param_CD_SISTEMA_CONTABIL: TStringField
      FieldName = 'CD_SISTEMA_CONTABIL'
      Origin = 'TPARAMETROS.CD_SISTEMA_CONTABIL'
      Size = 1
    end
    object qry_param_VL_REMESSA: TFloatField
      FieldName = 'VL_REMESSA'
      Origin = 'DBBROKER.TPARAMETROS.VL_REMESSA'
    end
  end
  object qry_tot_fat_proc_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_fat
    SQL.Strings = (
      'SELECT COUNT(*) AS TOT_PROCESSO'
      'FROM   TS_FATURA_PROCESSO'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       NR_SOLICITACAO = :NR_SOLICITACAO')
    Left = 138
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptUnknown
      end>
  end
  object qry_distinct_cliente_por_fatura_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_fat
    SQL.Strings = (
      'SELECT DISTINCT P.CD_CLIENTE AS CD_CLIENTE'
      'FROM   TS_FATURA_PROCESSO FP, TPROCESSO P (NOLOCK)'
      'WHERE  FP.NR_PROCESSO = P.NR_PROCESSO AND'
      '       FP.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       FP.CD_PRODUTO = :CD_PRODUTO AND'
      '       FP.NR_SOLICITACAO = :NR_SOLICITACAO')
    Left = 334
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptUnknown
      end>
  end
  object qry_feriado_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TFERIADO (NOLOCK)'
      'WHERE DT_FERIADO = :DT_FERIADO')
    Left = 552
    Top = 296
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT_FERIADO'
        ParamType = ptUnknown
      end>
    object qry_feriado_DT_FERIADO: TDateTimeField
      FieldName = 'DT_FERIADO'
      Origin = 'TFERIADO.DT_FERIADO'
    end
    object qry_feriado_NM_FERIADO: TStringField
      FieldName = 'NM_FERIADO'
      Origin = 'TFERIADO.NM_FERIADO'
      Size = 50
    end
  end
  object qry_rel_liq_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS TOT_LIQ'
      
        'FROM   TS_FATURA F, TS_FATURA_PROCESSO FP, TPROCESSO P (NOLOCK),' +
        ' TEMPRESA_NAC E (NOLOCK)'
      'WHERE  F.CD_UNID_NEG = FP.CD_UNID_NEG AND'
      '       F.CD_PRODUTO = FP.CD_PRODUTO AND'
      '       F.NR_SOLICITACAO = FP.NR_SOLICITACAO AND'
      '       FP.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_CLIENTE = E.CD_EMPRESA AND'
      '       F.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       F.CD_PRODUTO = :CD_PRODUTO AND'
      '       F.NR_SOLICITACAO = :NR_SOLICITACAO AND'
      '       F.IN_CANCELADO = '#39'0'#39' AND'
      '       ( E.CD_GRUPO IN ( SELECT E.CD_GRUPO '
      
        '                         FROM   TLIQUIDACAO L, TPROCESSO P (NOLO' +
        'CK), TEMPRESA_NAC E (NOLOCK)'
      
        '                         WHERE  L.NR_PROCESSO = P.NR_PROCESSO AN' +
        'D'
      '                                P.CD_CLIENTE = E.CD_EMPRESA AND'
      '                                L.IN_CANCELADO = '#39'0'#39' AND'
      
        '                                L.NR_RELATORIO = F.NR_RELATORIO ' +
        'AND'
      '                                L.NR_ANO = F.NR_ANO ) )'
      '')
    Left = 645
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptUnknown
      end>
    object qry_rel_liq_TOT_LIQ: TIntegerField
      FieldName = 'TOT_LIQ'
    end
  end
  object sp_fat_refat: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_fat_refat'
    Left = 444
    Top = 296
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
        DataType = ftString
        Name = '@nr_solicitacao'
        ParamType = ptInput
      end>
  end
  object qry_bol_fatura_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_BOLETO, IN_CANCELADO'
      'FROM TBOLETO_FATURA (NOLOCK)'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      '      CD_PRODUTO = :CD_PRODUTO AND'
      '      NR_FATURA = :NR_FATURA')
    Left = 236
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_FATURA'
        ParamType = ptUnknown
      end>
    object qry_bol_fatura_NR_BOLETO: TStringField
      FieldName = 'NR_BOLETO'
      Origin = 'TBOLETO_FATURA.NR_BOLETO'
      Size = 10
    end
    object qry_bol_fatura_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TBOLETO_FATURA.IN_CANCELADO'
      Size = 1
    end
  end
  object sp_fat_duplica: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_fat_duplica'
    Left = 756
    Top = 393
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
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
        DataType = ftString
        Name = '@nr_solicitacao'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end>
  end
  object qry_cliente_fat_proc_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_fat
    SQL.Strings = (
      'SELECT ISNULL( MIN( DISTINCT P.CD_CLIENTE ), '#39#39' ) CD_CLIENTE'
      'FROM   TS_FATURA_PROCESSO FP, TPROCESSO P (NOLOCK)'
      'WHERE  FP.NR_PROCESSO = P.NR_PROCESSO AND'
      '       FP.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       FP.CD_PRODUTO = :CD_PRODUTO AND'
      '       FP.NR_SOLICITACAO = :NR_SOLICITACAO')
    Left = 44
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptUnknown
      end>
    object qry_cliente_fat_proc_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
  end
  object qry_cli_hab_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT IN_NOTA_LIQ'
      
        'FROM   TCLIENTE_HABILITACAO H (NOLOCK), TPROCESSO P (NOLOCK), TS' +
        '_FATURA_PROCESSO F'
      'WHERE  F.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_UNID_NEG = H.CD_UNID_NEG AND'
      '       P.CD_PRODUTO = H.CD_PRODUTO AND'
      '       P.CD_CLIENTE = H.CD_CLIENTE AND'
      '       F.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       F.CD_PRODUTO = :CD_PRODUTO AND'
      '       F.NR_SOLICITACAO = :NR_SOLICITACAO')
    Left = 334
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptUnknown
      end>
    object qry_cli_hab_IN_NOTA_LIQ: TStringField
      FieldName = 'IN_NOTA_LIQ'
      Origin = 'TCLIENTE_HABILITACAO.IN_NOTA_LIQ'
      Size = 1
    end
  end
  object qry_calculo_rateio_desp_: TQuery
    AfterOpen = qry_calculo_rateio_desp_AfterOpen
    OnCalcFields = qry_calculo_rateio_desp_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_IDENTIFICADOR, NR_PROCESSO, CD_ITEM, '
      
        '               CD_AREA, TP_RATEIO_DESP, OBS, NR_PROC_PO_NR_ITEM_' +
        'PO,'
      '               CD_REFERENCIA'
      'FROM TCALCULO_RATEIO_DESP (NOLOCK)'
      'WHERE NR_IDENTIFICADOR =:NR_IDENTIFICADOR')
    Left = 756
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end>
    object qry_calculo_rateio_desp_NR_IDENTIFICADOR: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
      Origin = 'TCALCULO_RATEIO_DESP.NR_IDENTIFICADOR'
    end
    object qry_calculo_rateio_desp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TCALCULO_RATEIO_DESP.NR_IDENTIFICADOR'
      Size = 18
    end
    object qry_calculo_rateio_desp_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TCALCULO_RATEIO_DESP.CD_ITEM'
      Size = 3
    end
    object qry_calculo_rateio_desp_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TCALCULO_RATEIO_DESP.CD_AREA'
      Size = 2
    end
    object qry_calculo_rateio_desp_TP_RATEIO_DESP: TStringField
      FieldName = 'TP_RATEIO_DESP'
      Origin = 'TCALCULO_RATEIO_DESP.TP_RATEIO_DESP'
      Size = 1
    end
    object qry_calculo_rateio_desp_LookNmItem: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'LookNmItem'
      LookupDataSet = qry_item_rat_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 60
      Lookup = True
    end
    object qry_calculo_rateio_desp_LookNmArea: TStringField
      DisplayLabel = #193'rea'
      FieldKind = fkLookup
      FieldName = 'LookNmArea'
      LookupDataSet = qry_area_
      LookupKeyFields = 'CD_AREA'
      LookupResultField = 'NM_AREA'
      KeyFields = 'CD_AREA'
      Lookup = True
    end
    object qry_calculo_rateio_desp_LookNmRateioDesp: TStringField
      DisplayLabel = 'Forma de Rateio'
      FieldKind = fkLookup
      FieldName = 'LookNmRateioDesp'
      LookupDataSet = qry_ttp_rateio_desp_
      LookupKeyFields = 'TP_RATEIO_DESP'
      LookupResultField = 'NM_TP_RATEIO_DESP'
      KeyFields = 'TP_RATEIO_DESP'
      Lookup = True
    end
    object qry_calculo_rateio_desp_Calc_Nr_Processo: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldKind = fkCalculated
      FieldName = 'Calc_Nr_Processo'
      Size = 14
      Calculated = True
    end
    object qry_calculo_rateio_desp_OBS: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS'
      Origin = 'TCALCULO_RATEIO_DESP.NR_IDENTIFICADOR'
      Size = 50
    end
    object qry_calculo_rateio_desp_NR_PROC_PO_NR_ITEM_PO: TStringField
      DisplayLabel = 'N'#186' P.O.'
      FieldName = 'NR_PROC_PO_NR_ITEM_PO'
      Origin = 'TCALCULO_RATEIO_DESP.NR_IDENTIFICADOR'
      Size = 21
    end
    object qry_calculo_rateio_desp_CD_REFERENCIA: TStringField
      DisplayLabel = 'C'#243'd. Refer'#234'ncia'
      FieldName = 'CD_REFERENCIA'
      Origin = 'TCALCULO_RATEIO_DESP.NR_PROCESSO'
      Size = 15
    end
  end
  object ds_calculo_rateio_desp: TDataSource
    DataSet = qry_calculo_rateio_desp_
    Left = 756
    Top = 296
  end
  object qry_area_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_AREA, NM_AREA'
      'FROM TAREA (NOLOCK)')
    Left = 645
    Top = 344
    object qry_area_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TAREA.CD_AREA'
      Size = 2
    end
    object qry_area_NM_AREA: TStringField
      FieldName = 'NM_AREA'
      Origin = 'TAREA.NM_AREA'
      Size = 50
    end
  end
  object qry_item_rat_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM'
      'FROM TITEM (NOLOCK)')
    Left = 645
    Top = 393
  end
  object qry_ttp_rateio_desp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TP_RATEIO_DESP, NM_TP_RATEIO_DESP'
      'FROM TTP_RATEIO_DESP (NOLOCK)')
    Left = 552
    Top = 344
    object qry_ttp_rateio_desp_TP_RATEIO_DESP: TStringField
      FieldName = 'TP_RATEIO_DESP'
      Origin = 'TTP_RATEIO_DESP.TP_RATEIO_DESP'
      Size = 1
    end
    object qry_ttp_rateio_desp_NM_TP_RATEIO_DESP: TStringField
      FieldName = 'NM_TP_RATEIO_DESP'
      Origin = 'TTP_RATEIO_DESP.NM_TP_RATEIO_DESP'
    end
  end
  object qry_verif_nd_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT IN_ND'
      'FROM TCLIENTE_HABILITACAO (NOLOCK)'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      '      CD_UNID_NEG = :CD_UNID_NEG AND'
      '      CD_PRODUTO = :CD_PRODUTO')
    Left = 444
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
    object qry_verif_nd_IN_ND: TStringField
      FieldName = 'IN_ND'
      Origin = 'DBBROKER.TCLIENTE_HABILITACAO.IN_ND'
      FixedChar = True
      Size = 1
    end
  end
  object qry_retencao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM(VL_TRIBUTAVEL) AS VL_TRIBUTAVEL'
      'FROM   TRETENCAO'
      'WHERE  '
      '      CD_UNID_NEG =:CD_UNID_NEG AND'
      
        '       CD_CLIENTE = (SELECT TOP 1 SUBSTRING (E.CGC_EMPRESA, 1, 8' +
        ') FROM TEMPRESA_NAC  E WHERE CD_EMPRESA = :CD_CLIENTE) AND'
      '        DT_FATURA BETWEEN :DT_INICIO AND :DT_FIM'
      '--                AND    IN_JA_RETIDO = '#39'0'#39)
    Left = 138
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
  end
  object qry_nf_impressa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT( NR_PROCESSO ) AS QTDE'
      'FROM TNF_RETENCAO'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      '               CD_CLIENTE = :CD_CLIENTE AND'
      '               DT_FATURA BETWEEN :DT_INICIO AND :DT_FIM AND'
      '               IN_STATUS IN ( '#39'I'#39' , '#39'A'#39', '#39'T'#39', '#39'N'#39' )')
    Left = 236
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
  end
  object qry_tot_tributavel_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT ISNULL( ROUND( SUM( F.VL_INFORMADO ), 2 ), 0 ) AS VL_TRIB' +
        'UTAVEL'
      'FROM   TS_FATURA_PROCESSO_ITEM F'
      '       INNER JOIN TITEM I (NOLOCK) ON ( I.CD_ITEM = F.CD_ITEM )'
      'WHERE  I.IN_TRIBUTAVEL = '#39'1'#39' AND'
      '       F.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       F.CD_PRODUTO = :CD_PRODUTO AND'
      '       F.NR_SOLICITACAO = :NR_SOLICITACAO AND'
      
        '       F.CD_ITEM NOT IN ( SELECT CD_ITEM_RECEB_NUM FROM TPARAMET' +
        'ROS (NOLOCK) ) AND'
      
        '       F.CD_ITEM NOT IN ( SELECT CD_ITEM_DEVOL_NUM FROM TPARAMET' +
        'ROS (NOLOCK) ) AND'
      
        '       F.CD_ITEM NOT IN ( SELECT CD_ITEM_EXTOR_NUM FROM TPARAMET' +
        'ROS (NOLOCK) ) AND'
      
        '       F.CD_ITEM NOT IN ( SELECT CD_ITEM_SALDO_CRE FROM TPARAMET' +
        'ROS (NOLOCK) ) AND'
      
        '       F.CD_ITEM NOT IN ( SELECT CD_ITEM_SALDO_DEB FROM TPARAMET' +
        'ROS (NOLOCK) ) AND'
      
        '       F.CD_ITEM NOT IN ( SELECT CD_ITEM_RECEB_SD  FROM TPARAMET' +
        'ROS (NOLOCK) ) AND'
      
        '       F.CD_ITEM NOT IN ( SELECT CD_ITEM_PAGTO_SD  FROM TPARAMET' +
        'ROS (NOLOCK) ) AND'
      
        '       F.CD_ITEM NOT IN ( SELECT CD_ITEM_EXT_RECEB FROM TPARAMET' +
        'ROS (NOLOCK) ) AND'
      
        '       F.CD_ITEM NOT IN ( SELECT CD_ITEM_EXT_PAGTO FROM TPARAMET' +
        'ROS (NOLOCK) ) AND'
      
        '       F.CD_ITEM NOT IN ( SELECT CD_ITEM_NAO_FAT   FROM TPARAMET' +
        'ROS (NOLOCK) ) AND'
      
        '       F.CD_ITEM NOT IN ( SELECT CD_ITEM_IR        FROM TPARAMET' +
        'ROS (NOLOCK) ) AND'
      
        '       F.CD_ITEM NOT IN ( SELECT CD_ITEM_COFINS_RETENCAO FROM TP' +
        'ARAMETROS (NOLOCK) ) AND'
      
        '       F.CD_ITEM NOT IN ( SELECT CD_ITEM_COMISSAO  FROM TPARAMET' +
        'ROS (NOLOCK) ) AND'
      
        '       F.CD_ITEM NOT IN ( SELECT CD_ITEM_PAGO_CLI  FROM TPARAMET' +
        'ROS (NOLOCK) )')
    Left = 44
    Top = 393
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end>
  end
  object qry_comissao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT VL_INFORMADO AS VL_COMISSAO'
      'FROM   TS_FATURA_PROCESSO_ITEM (NOLOCK)'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       NR_SOLICITACAO = :NR_SOLICITACAO AND'
      
        '       CD_ITEM IN ( SELECT CD_ITEM_COMISSAO FROM TPARAMETROS (NO' +
        'LOCK) )'
      ''
      '')
    Left = 44
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end>
  end
  object qry_status_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT IN_STATUS'
      'FROM TNF_RETENCAO (NOLOCK)'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      '               CD_PRODUTO = :CD_PRODUTO AND'
      '               NR_SOLICITACAO = :NR_SOLICITACAO'
      '')
    Left = 138
    Top = 393
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end>
    object qry_status_IN_STATUS: TStringField
      FieldName = 'IN_STATUS'
      Origin = 'DBBROKER.TNF_RETENCAO.IN_STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qry_grupo_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( CD_GRUPO, '#39#39' ) AS CD_GRUPO'
      'FROM   TEMPRESA_NAC (NOLOCK)'
      'WHERE  CD_EMPRESA = :CD_CLIENTE'
      '')
    Left = 236
    Top = 393
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
  end
  object qry_retencao_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM(VL_TRIBUTAVEL) AS VL_TRIBUTAVEL'
      'FROM   TNF_RETENCAO'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '                CD_GRUPO = :CD_GRUPO AND'
      '                DT_FATURA BETWEEN :DT_INICIO AND :DT_FIM AND'
      '                IN_STATUS = ( '#39'-'#39' )')
    Left = 336
    Top = 393
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
  end
  object qry_comissao_old: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '    SELECT ISNULL( ROUND( SUM('
      '       CASE IN_RESTITUI'
      
        '         WHEN '#39'0'#39' THEN ( ISNULL( FI.VL_ITEM, 0 ) + ISNULL( FI.VL' +
        '_ASSIST, 0 ) - ISNULL( FI.VL_IR, 0 ) )'
      
        '         WHEN '#39'1'#39' THEN ( ISNULL( FI.VL_ITEM, 0 ) + ISNULL( FI.VL' +
        '_ASSIST, 0 ) - ISNULL( FI.VL_IR, 0 ) ) * (-1)'
      '       END ), 2 ), 0 ) AS VL_COMISSAO'
      'FROM   TFATURAMENTO_CC FI'
      'WHERE  FI.IN_CANCELADO = '#39'0'#39' AND'
      '       FI.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       FI.CD_PRODUTO = :CD_PRODUTO AND'
      '       FI.NR_SOLIC_FAT = :NR_SOLICITACAO AND'
      
        '       FI.CD_ITEM IN ( SELECT CD_ITEM_COMISSAO FROM TPARAMETROS ' +
        ')'
      '')
    Left = 444
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end>
  end
  object qry_tot_tributavel_old: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( ROUND( SUM('
      '       CASE IN_RESTITUI'
      
        '         WHEN '#39'0'#39' THEN ( ISNULL( FI.VL_ITEM, 0 ) + ISNULL( FI.VL' +
        '_ASSIST, 0 ) - ISNULL( FI.VL_IR, 0 ) )'
      
        '         WHEN '#39'1'#39' THEN ( ISNULL( FI.VL_ITEM, 0 ) + ISNULL( FI.VL' +
        '_ASSIST, 0 ) - ISNULL( FI.VL_IR, 0 ) ) * (-1)'
      '       END ), 2 ), 0 ) AS VL_TRIBUTAVEL'
      'FROM   TFATURAMENTO_CC FI, TITEM I (NOLOCK)'
      'WHERE  FI.CD_ITEM = I.CD_ITEM AND'
      '       FI.IN_FATURADO = '#39'0'#39' AND'
      '       I.IN_TRIBUTAVEL = '#39'1'#39' AND'
      '       FI.IN_CANCELADO = '#39'0'#39' AND'
      '       FI.NR_PROCESSO = :NR_PROCESSO AND'
      '       ISNULL( FI.CD_ITEM_NAO_FAT, '#39#39' ) <> '#39'*'#39' AND'
      
        '       FI.CD_ITEM NOT IN ( SELECT CD_ITEM_RECEB_NUM FROM TPARAME' +
        'TROS (NOLOCK) ) AND'
      
        '       FI.CD_ITEM NOT IN ( SELECT CD_ITEM_DEVOL_NUM FROM TPARAME' +
        'TROS (NOLOCK) ) AND'
      
        '       FI.CD_ITEM NOT IN ( SELECT CD_ITEM_EXTOR_NUM FROM TPARAME' +
        'TROS (NOLOCK) ) AND'
      
        '       FI.CD_ITEM NOT IN ( SELECT CD_ITEM_SALDO_CRE FROM TPARAME' +
        'TROS (NOLOCK) ) AND'
      
        '       FI.CD_ITEM NOT IN ( SELECT CD_ITEM_SALDO_DEB FROM TPARAME' +
        'TROS (NOLOCK) ) AND'
      
        '       FI.CD_ITEM NOT IN ( SELECT CD_ITEM_RECEB_SD  FROM TPARAME' +
        'TROS (NOLOCK) ) AND'
      
        '       FI.CD_ITEM NOT IN ( SELECT CD_ITEM_PAGTO_SD  FROM TPARAME' +
        'TROS (NOLOCK) ) AND'
      
        '       FI.CD_ITEM NOT IN ( SELECT CD_ITEM_EXT_RECEB FROM TPARAME' +
        'TROS (NOLOCK) ) AND'
      
        '       FI.CD_ITEM NOT IN ( SELECT CD_ITEM_EXT_PAGTO FROM TPARAME' +
        'TROS (NOLOCK) ) AND'
      
        '       FI.CD_ITEM NOT IN ( SELECT CD_ITEM_NAO_FAT   FROM TPARAME' +
        'TROS (NOLOCK) ) AND'
      
        '       FI.CD_ITEM NOT IN ( SELECT CD_ITEM_IR        FROM TPARAME' +
        'TROS (NOLOCK) ) AND'
      
        '       FI.CD_ITEM NOT IN ( SELECT CD_ITEM_COFINS_RETENCAO FROM T' +
        'PARAMETROS (NOLOCK) ) AND'
      
        '       FI.CD_ITEM NOT IN ( SELECT CD_ITEM_COMISSAO  FROM TPARAME' +
        'TROS (NOLOCK) ) AND'
      
        '       FI.CD_ITEM NOT IN ( SELECT CD_ITEM_PAGO_CLI  FROM TPARAME' +
        'TROS (NOLOCK) )')
    Left = 552
    Top = 393
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
  end
  object qry_nf_impressa_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT( NR_PROCESSO ) AS QTDE'
      'FROM TNF_RETENCAO (NOLOCK)'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      '               CD_GRUPO = :CD_GRUPO AND'
      '               DT_FATURA BETWEEN :DT_INICIO AND :DT_FIM AND'
      '               IN_STATUS IN ( '#39'I'#39' , '#39'A'#39', '#39'T'#39', '#39'N'#39' )')
    Left = 48
    Top = 448
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
  end
  object ds_fat_docto: TDataSource
    DataSet = qry_fat_docto_
    Left = 136
    Top = 448
  end
  object qry_fat_docto_: TQuery
    AfterOpen = qry_fat_docto_AfterOpen
    DatabaseName = 'DBBROKER'
    DataSource = ds_fat
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TS_FATURA_DOCUMENTO (NOLOCK)'
      'WHERE ( CD_UNID_NEG = :CD_UNID_NEG ) AND'
      '      ( CD_PRODUTO = :CD_PRODUTO ) AND'
      '      ( NR_SOLICITACAO = :NR_SOLICITACAO )'
      'ORDER BY NR_SOLICITACAO')
    Left = 236
    Top = 448
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptUnknown
        Size = 7
      end>
    object qry_fat_docto_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TS_FATURA_DOCUMENTO.CD_UNID_NEG'
      Size = 2
    end
    object qry_fat_docto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TS_FATURA_DOCUMENTO.CD_PRODUTO'
      Size = 2
    end
    object qry_fat_docto_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TS_FATURA_DOCUMENTO.NR_SOLICITACAO'
      Size = 6
    end
    object qry_fat_docto_CD_DOCUMENTO: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_DOCUMENTO'
      Origin = 'TS_FATURA_DOCUMENTO.CD_DOCUMENTO'
      Size = 3
    end
    object qry_fat_docto_NR_DOCTO: TStringField
      DisplayLabel = 'N'#186' Docto.'
      FieldName = 'NR_DOCTO'
      Origin = 'TS_FATURA_DOCUMENTO.NR_DOCTO'
      Size = 10
    end
    object qry_fat_docto_LookDocumento: TStringField
      DisplayLabel = 'Documento'
      FieldKind = fkLookup
      FieldName = 'LookDocumento'
      LookupDataSet = qry_docto_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_DOCUMENTO'
      Size = 50
      Lookup = True
    end
    object qry_fat_docto_LookFormaDocto: TStringField
      DisplayLabel = 'Enviar'
      FieldKind = fkLookup
      FieldName = 'LookFormaDocto'
      LookupDataSet = qry_tp_forma_doc_
      LookupKeyFields = 'CD_FORMA_DOC'
      LookupResultField = 'NM_FORMA_DOC'
      KeyFields = 'CD_FORMA_DOC'
      Size = 10
      Lookup = True
    end
    object qry_fat_docto_CD_FORMA_DOC: TStringField
      FieldName = 'CD_FORMA_DOC'
      Origin = 'DBBROKER.TS_FATURA_DOCUMENTO.CD_FORMA_DOC'
      FixedChar = True
      Size = 1
    end
  end
  object qry_docto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM   TTP_DOCUMENTO (NOLOCK)'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO')
    Left = 336
    Top = 448
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_docto_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TTP_DOCUMENTO.CODIGO'
      Size = 3
    end
    object qry_docto_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTP_DOCUMENTO.CODIGO'
      Size = 50
    end
  end
  object qry_tp_forma_doc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FORMA_DOC, NM_FORMA_DOC'
      'FROM   TTP_FORMA_DOC (NOLOCK)')
    Left = 552
    Top = 448
    object qry_tp_forma_doc_CD_FORMA_DOC: TStringField
      FieldName = 'CD_FORMA_DOC'
      Origin = 'TTP_FORMA_DOC.CD_FORMA_DOC'
      Size = 1
    end
    object qry_tp_forma_doc_NM_FORMA_DOC: TStringField
      FieldName = 'NM_FORMA_DOC'
      Origin = 'TTP_FORMA_DOC.NM_FORMA_DOC'
      Size = 10
    end
  end
  object ds_tp_forma_doc: TDataSource
    DataSet = qry_tp_forma_doc_
    Left = 444
    Top = 448
  end
  object qry_cliente_doc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FORMA_DOC'
      'FROM   TCLIENTE_DOCUMENTO (NOLOCK)'
      'WHERE CD_CLIENTE = :CD_CLIENTE'
      '      AND CD_UNID_NEG = :CD_UNID_NEG'
      '      AND CD_PRODUTO = :CD_PRODUTO'
      '      AND CD_DOCUMENTO = :CD_DOCUMENTO ')
    Left = 648
    Top = 448
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_DOCUMENTO'
        ParamType = ptInput
      end>
  end
end

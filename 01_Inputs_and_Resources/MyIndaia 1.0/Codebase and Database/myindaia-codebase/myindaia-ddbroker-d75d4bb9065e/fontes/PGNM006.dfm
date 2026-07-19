object datm_devolucao: Tdatm_devolucao
  OldCreateOrder = True
  Left = 123
  Top = 179
  Height = 367
  Width = 763
  object sp_atz_devolucao: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_devolucao'
    Left = 460
    Top = 200
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
        Name = '@nr_devolucao'
        ParamType = ptInput
      end>
    object StringField5: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField6: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object ds_devolucao: TDataSource
    DataSet = qry_devolucao_
    Left = 460
    Top = 72
  end
  object qry_devolucao_: TQuery
    AfterScroll = qry_devolucao_AfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_DEVOLUCAO ,  '
      ' DT_DEVOLUCAO , CD_USUARIO ,  '
      ' VL_DEVOLUCAO , IN_CANCELADO , '
      ' DT_CANCELAMENTO , CD_USUARIO_CANC,'
      'IN_TRANSFERIDO, NR_SOLIC_CH'
      'FROM TDEVOLUCAO '
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 460
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_devolucao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDEVOLUCAO.NR_PROCESSO'
      Size = 18
    end
    object qry_devolucao_NR_DEVOLUCAO: TStringField
      DisplayLabel = 'Devoluc'#227'o'
      FieldName = 'NR_DEVOLUCAO'
      Origin = 'TDEVOLUCAO.NR_DEVOLUCAO'
      Size = 3
    end
    object qry_devolucao_DT_DEVOLUCAO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_DEVOLUCAO'
      Origin = 'TDEVOLUCAO.DT_DEVOLUCAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_devolucao_CD_USUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'CD_USUARIO'
      Origin = 'TDEVOLUCAO.CD_USUARIO'
      Size = 4
    end
    object qry_devolucao_VL_DEVOLUCAO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_DEVOLUCAO'
      Origin = 'TDEVOLUCAO.VL_DEVOLUCAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_devolucao_DT_CANCELAMENTO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'TDEVOLUCAO.DT_CANCELAMENTO'
    end
    object qry_devolucao_CD_USUARIO_CANC: TStringField
      FieldName = 'CD_USUARIO_CANC'
      Origin = 'TDEVOLUCAO.CD_USUARIO_CANC'
      Size = 4
    end
    object qry_devolucao_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TDEVOLUCAO.NR_PROCESSO'
      Size = 1
    end
    object qry_devolucao_Look_ap_usuario: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldKind = fkLookup
      FieldName = 'Look_ap_usuario'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Lookup = True
    end
    object qry_devolucao_Look_usuario_Canc: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldKind = fkLookup
      FieldName = 'Look_usuario_Canc'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO_CANC'
      Lookup = True
    end
    object qry_devolucao_look_Cancelado: TStringField
      FieldKind = fkLookup
      FieldName = 'look_Cancelado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CANCELADO'
      Size = 4
      Lookup = True
    end
    object qry_devolucao_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'TDEVOLUCAO.NR_PROCESSO'
      Size = 1
    end
    object qry_devolucao_NR_SOLIC_CH: TStringField
      FieldName = 'NR_SOLIC_CH'
      Origin = 'TDEVOLUCAO.NR_PROCESSO'
      Size = 3
    end
  end
  object ds_itens_devol_lista: TDataSource
    DataSet = qry_itens_devol_lista_
    Left = 569
    Top = 72
  end
  object qry_itens_devolucao_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_itens_devol_lista
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_DEVOLUCAO , '
      ' NR_LANC_DEVOL , NR_RECEBIMENTO , '
      ' NR_LANC_RECEB , CD_ITEM , VL_DEVOLVIDO '
      'FROM TDEVOLUCAO_ITENS '
      ' WHERE ( NR_PROCESSO = :NR_PROCESSO ) AND'
      ' ( NR_DEVOLUCAO = :NR_DEVOLUCAO ) AND'
      ' ( NR_LANC_DEVOL = :NR_LANC_DEVOL)'
      '')
    Left = 680
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_DEVOLUCAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANC_DEVOL'
        ParamType = ptUnknown
      end>
    object qry_itens_devolucao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_itens_devolucao_NR_DEVOLUCAO: TStringField
      DisplayLabel = 'Devolu'#231#227'o'
      FieldName = 'NR_DEVOLUCAO'
      Size = 3
    end
    object qry_itens_devolucao_NR_LANC_DEVOL: TStringField
      DisplayLabel = 'Lan'#231'.'
      FieldName = 'NR_LANC_DEVOL'
      Size = 3
    end
    object qry_itens_devolucao_NR_RECEBIMENTO: TStringField
      FieldName = 'NR_RECEBIMENTO'
      Size = 3
    end
    object qry_itens_devolucao_NR_LANC_RECEB: TStringField
      FieldName = 'NR_LANC_RECEB'
      Size = 3
    end
    object qry_itens_devolucao_CD_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object qry_itens_devolucao_VL_DEVOLVIDO: TFloatField
      DisplayLabel = 'Valor Devolu'#231#227'o'
      FieldName = 'VL_DEVOLVIDO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_devolucao_Look_nm_item: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'Look_nm_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 40
      Lookup = True
    end
    object qry_itens_devolucao_calc_VL_DISPONIVEL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_VL_DISPONIVEL'
      Calculated = True
    end
  end
  object dsq_item: TDataSource
    DataSet = qry_item_
    Left = 19
    Top = 200
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT I.CD_ITEM, I.NM_ITEM, I.CD_TIPO_ITEM, 1, I.CD_TIPO_LANC_F' +
        'AT'
      'FROM TITEM I,'
      '            TTIPO_ITEM T'
      'WHERE I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND'
      '              T.IN_RECEB_NUM = '#39'1'#39
      'ORDER BY I.CD_ITEM')
    Left = 19
    Top = 135
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
    object qry_item_COLUMN4: TIntegerField
      FieldName = 'COLUMN4'
    end
  end
  object ds_usuario: TDataSource
    Left = 143
    Top = 200
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TBANCO')
    Left = 79
    Top = 135
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
      Origin = 'TBANCO.CD_BANCO'
      Size = 10
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
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 79
    Top = 200
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG IN '
      '              ( SELECT CD_UNID_NEG '
      '                FROM TUSUARIO_HABILITACAO'
      '                WHERE CD_USUARIO = :CD_USUARIO )')
    Left = 27
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
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
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO IN '
      '              ( SELECT CD_PRODUTO'
      '                FROM TUSUARIO_HABILITACAO'
      '                WHERE CD_USUARIO = :CD_USUARIO )')
    Left = 143
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
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
      'FROM TUSUARIO_HABILITACAO'
      'WHERE CD_USUARIO = :CD_USUARIO AND'
      '               CD_UNID_NEG = :CD_UNID_NEG AND'
      '               CD_PRODUTO = :CD_PRODUTO'
      ''
      '               ')
    Left = 23
    Top = 72
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
    SQL.Strings = (
      'SELECT P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_PRODUTO,'
      '               P.CD_CLIENTE, P.CD_SERVICO, P.IN_LIBERADO,'
      '              C.AP_EMPRESA, S.NM_SERVICO'
      'FROM TPROCESSO P, TEMPRESA_NAC C, TSERVICO S'
      'WHERE (P.CD_CLIENTE *= C.CD_EMPRESA) AND'
      '              (P.CD_SERVICO *= S.CD_SERVICO) AND'
      '              (P.NR_PROCESSO = :NR_PROCESSO)')
    Left = 212
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Value = '01019800010'
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qry_processo_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_processo_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Size = 50
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Size = 1
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 212
    Top = 72
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 212
    Top = 200
  end
  object tbl_yesno_: TTable
    Active = True
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 212
    Top = 135
  end
  object ds_itens_receb: TDataSource
    DataSet = qry_itens_receb_
    Left = 364
    Top = 72
  end
  object qry_itens_receb_: TQuery
    OnCalcFields = qry_itens_receb_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_receb
    SQL.Strings = (
      'SELECT R.NR_PROCESSO, R.NR_RECEBIMENTO, R.NR_LANC_RECEB,'
      '       R.NR_SOLICITACAO, R.NR_LANCAMENTO, R.CD_ITEM,'
      '       R.VL_SOLICITADO, R.VL_RECEBIDO, R.IN_CANCELADO,'
      '       R.VL_UTILIZADO, VL_DEVOLUCAO = ISNULL ('
      '       ( SELECT SUM (I.VL_DEVOLVIDO)'
      '         FROM TDEVOLUCAO_ITENS I,'
      '              TDEVOLUCAO D'
      '         WHERE I.NR_PROCESSO = D.NR_PROCESSO AND'
      '               I.NR_DEVOLUCAO = D.NR_DEVOLUCAO AND'
      '               I.NR_PROCESSO = R.NR_PROCESSO AND'
      '               I.NR_RECEBIMENTO = R.NR_RECEBIMENTO AND'
      '               I.NR_LANC_RECEB = R.NR_LANC_RECEB AND'
      '               D.IN_CANCELADO= '#39'0'#39' ), 0 )'
      'FROM TRECEBIMENTO_ITEM_RECEB R'
      'WHERE R.NR_PROCESSO = :NR_PROCESSO AND'
      '      R.NR_RECEBIMENTO = :NR_RECEBIMENTO')
    Left = 364
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_RECEBIMENTO'
        ParamType = ptUnknown
      end>
    object qry_itens_receb_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_PROCESSO'
      Size = 18
    end
    object qry_itens_receb_NR_RECEBIMENTO: TStringField
      FieldName = 'NR_RECEBIMENTO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_RECEBIMENTO'
      Size = 3
    end
    object qry_itens_receb_NR_LANC_RECEB: TStringField
      FieldName = 'NR_LANC_RECEB'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_LANC_RECEB'
      Size = 6
    end
    object qry_itens_receb_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_SOLICITACAO'
      Size = 3
    end
    object qry_itens_receb_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_LANCAMENTO'
      Size = 3
    end
    object qry_itens_receb_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.CD_ITEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_receb_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.VL_SOLICITADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_receb_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TNUMERARIO_ITEM_RECEB.NR_PROCESSO'
      Size = 3
    end
    object qry_itens_receb_LK_NM_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'LK_NM_ITEM'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 40
      Lookup = True
    end
    object qry_itens_receb_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_PROCESSO'
      Size = 1
    end
    object qry_itens_receb_LookCancelado: TStringField
      DisplayLabel = 'Cancelado'
      FieldKind = fkLookup
      FieldName = 'LookCancelado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CANCELADO'
      Size = 3
      Lookup = True
    end
    object qry_itens_receb_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_PROCESSO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_receb_VL_DEVOLUCAO: TFloatField
      FieldName = 'VL_DEVOLUCAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_receb_calc_VL_DISPONIVEL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_VL_DISPONIVEL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
  end
  object qry_receb_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_RECEBIMENTO, DT_RECEBIMENTO,'
      '               CD_USUARIO, CD_BANCO, VL_RECEBIMENTO, '
      '               IN_CANCELADO, DT_CANCELAMENTO, CD_USUARIO_CANC,'
      '               IN_TRANSFERIDO'
      'FROM TRECEBIMENTO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 288
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_receb_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TRECEBIMENTO.NR_PROCESSO'
      Size = 18
    end
    object qry_receb_NR_RECEBIMENTO: TStringField
      FieldName = 'NR_RECEBIMENTO'
      Origin = 'TRECEBIMENTO.NR_RECEBIMENTO'
      Size = 3
    end
    object qry_receb_DT_RECEBIMENTO: TDateTimeField
      FieldName = 'DT_RECEBIMENTO'
      Origin = 'TRECEBIMENTO.DT_RECEBIMENTO'
    end
    object qry_receb_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TRECEBIMENTO.CD_USUARIO'
      Size = 4
    end
    object qry_receb_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TRECEBIMENTO.CD_BANCO'
      Size = 3
    end
    object qry_receb_VL_RECEBIMENTO: TFloatField
      FieldName = 'VL_RECEBIMENTO'
      Origin = 'TRECEBIMENTO.VL_RECEBIMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_receb_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TRECEBIMENTO.IN_CANCELADO'
      Size = 1
    end
    object qry_receb_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'TRECEBIMENTO.DT_CANCELAMENTO'
    end
    object qry_receb_CD_USUARIO_CANC: TStringField
      FieldName = 'CD_USUARIO_CANC'
      Origin = 'TRECEBIMENTO.CD_USUARIO_CANC'
      Size = 4
    end
    object qry_receb_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'TRECEBIMENTO.IN_TRANSFERIDO'
      Size = 1
    end
    object qry_receb_LK_NM_USUARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_USUARIO'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 30
      Lookup = True
    end
    object qry_receb_LK_NM_BANCO: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_BANCO'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'AP_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 30
      Lookup = True
    end
    object qry_receb_LK_NM_CANCELADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_NM_CANCELADOR'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO_CANC'
      Lookup = True
    end
    object qry_receb_LookCancelado: TStringField
      DisplayLabel = 'Cancelado'
      FieldKind = fkLookup
      FieldName = 'LookCancelado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CANCELADO'
      Size = 3
      Lookup = True
    end
  end
  object ds_receb: TDataSource
    DataSet = qry_receb_
    Left = 288
    Top = 72
  end
  object qry_usuario_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TUSUARIO')
    Left = 143
    Top = 135
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_CD_SENHA: TStringField
      FieldName = 'CD_SENHA'
      Origin = 'TUSUARIO.CD_SENHA'
      Size = 10
    end
    object qry_usuario_CD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Origin = 'TUSUARIO.CD_CARGO'
      Size = 3
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
  object qry_tot_devolucao_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_devolucao
    SQL.Strings = (
      'SELECT SUM(VL_DEVOLVIDO) TOT_DEVOLVIDO'
      'FROM TDEVOLUCAO_ITENS'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '               NR_DEVOLUCAO = :NR_DEVOLUCAO')
    Left = 364
    Top = 135
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_DEVOLUCAO'
        ParamType = ptUnknown
      end>
    object qry_tot_devolucao_TOT_DEVOLVIDO: TFloatField
      FieldName = 'TOT_DEVOLVIDO'
      Origin = 'TDEVOLUCAO_ITENS.VL_DEVOLVIDO'
    end
  end
  object qry_saldo_receb_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      'SELECT R.NR_PROCESSO, R.NR_RECEBIMENTO, R.NR_LANC_RECEB ,  '
      '       R.CD_ITEM,  R.VL_RECEBIDO,'
      '       VL_DEVOLUCAO ='
      '       ( SELECT SUM (DI.VL_DEVOLVIDO)'
      '         FROM   TDEVOLUCAO_ITENS DI,'
      '                TDEVOLUCAO D'
      '         WHERE  DI.NR_PROCESSO = R.NR_PROCESSO AND'
      '                DI.NR_RECEBIMENTO = R.NR_RECEBIMENTO AND'
      '                DI.NR_LANC_RECEB = R.NR_LANC_RECEB AND'
      '                DI.NR_PROCESSO = D.NR_PROCESSO AND'
      '                DI.NR_DEVOLUCAO = D.NR_DEVOLUCAO AND'
      '                D.IN_CANCELADO= '#39'0'#39'),'
      '         VL_UTILIZADO'
      'FROM  TRECEBIMENTO_ITEM_RECEB R'
      'WHERE R.NR_PROCESSO = :NR_PROCESSO AND'
      '      R.IN_CANCELADO = '#39'0'#39
      'ORDER BY R.NR_RECEBIMENTO DESC, R.NR_LANC_RECEB')
    Left = 460
    Top = 135
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_saldo_receb_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_saldo_receb_NR_RECEBIMENTO: TStringField
      FieldName = 'NR_RECEBIMENTO'
      Size = 3
    end
    object qry_saldo_receb_NR_LANC_RECEB: TStringField
      FieldName = 'NR_LANC_RECEB'
      Size = 6
    end
    object qry_saldo_receb_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object qry_saldo_receb_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
    end
    object qry_saldo_receb_VL_DEVOLUCAO: TFloatField
      FieldName = 'VL_DEVOLUCAO'
    end
    object qry_saldo_receb_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
    end
  end
  object qry_saldo_proc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ( SELECT SUM( CASE F.CD_ITEM '
      '                       WHEN '#39'991'#39' THEN F.VL_ITEM'
      '                       WHEN '#39'993'#39' THEN F.VL_ITEM * (-1)'
      '                       WHEN '#39'992'#39' THEN CASE F.IN_RESTITUI '
      
        '                                         WHEN '#39'0'#39' THEN F.VL_ITEM' +
        ' * (-1)'
      '                                         WHEN '#39'1'#39' THEN F.VL_ITEM'
      '                                       END'
      '                     END )'
      '         FROM   TFATURAMENTO_CC F'
      '         WHERE  F.NR_PROCESSO = P.NR_PROCESSO AND'
      
        '                ( F.CD_ITEM IN ( SELECT CD_ITEM_PAGO_CLI FROM TP' +
        'ARAMETROS ) OR'
      
        '                  F.CD_ITEM IN ( SELECT CD_ITEM_RECEB_NUM FROM T' +
        'PARAMETROS ) OR'
      
        '                  F.CD_ITEM IN ( SELECT CD_ITEM_EXTOR_NUM FROM T' +
        'PARAMETROS ) ) ) AS VL_RECEBIDO,'
      '       ( SELECT SUM( CASE F.IN_RESTITUI '
      '                       WHEN '#39'0'#39' THEN F.VL_ITEM'
      '                       WHEN '#39'1'#39' THEN F.VL_ITEM * (-1)'
      '                     END )'
      '         FROM   TFATURAMENTO_CC F'
      '         WHERE  F.NR_PROCESSO = P.NR_PROCESSO AND'
      '                ISNULL( F.CD_ITEM_NAO_FAT, '#39#39' ) = '#39#39' AND'
      
        '                F.CD_ITEM NOT IN ( SELECT CD_ITEM_PAGO_CLI FROM ' +
        'TPARAMETROS ) AND'
      
        '                F.CD_ITEM NOT IN ( SELECT CD_ITEM_RECEB_NUM FROM' +
        ' TPARAMETROS ) AND'
      
        '                F.CD_ITEM NOT IN ( SELECT CD_ITEM_EXTOR_NUM FROM' +
        ' TPARAMETROS ) AND'
      
        '                F.CD_ITEM NOT IN ( SELECT CD_ITEM_DEVOL_NUM FROM' +
        ' TPARAMETROS ) AND'
      
        '                F.CD_ITEM NOT IN ( SELECT CD_ITEM_SALDO_DEB FROM' +
        ' TPARAMETROS ) AND'
      
        '                F.CD_ITEM NOT IN ( SELECT CD_ITEM_SALDO_CRE FROM' +
        ' TPARAMETROS ) AND'
      
        '                F.CD_ITEM NOT IN ( SELECT CD_ITEM_PAGTO_SD FROM ' +
        'TPARAMETROS ) AND'
      
        '                F.CD_ITEM NOT IN ( SELECT CD_ITEM_RECEB_SD FROM ' +
        'TPARAMETROS ) AND'
      
        '                F.CD_ITEM NOT IN ( SELECT CD_ITEM_EXT_PAGTO FROM' +
        ' TPARAMETROS ) AND'
      
        '                F.CD_ITEM NOT IN ( SELECT CD_ITEM_EXT_RECEB FROM' +
        ' TPARAMETROS ) AND'
      
        '                F.CD_ITEM NOT IN ( SELECT CD_ITEM_IR FROM TPARAM' +
        'ETROS ) '
      '       ) +'
      '       ( SELECT SUM( CASE F.CD_ITEM '
      '                      WHEN '#39'988'#39' THEN F.VL_ITEM'
      '                      WHEN '#39'997'#39' THEN F.VL_ITEM'
      '                      WHEN '#39'998'#39' THEN F.VL_ITEM * (-1)'
      '                      WHEN '#39'987'#39' THEN F.VL_ITEM * (-1)'
      '                    END )'
      '         FROM   TFATURAMENTO_CC F'
      '         WHERE  F.NR_PROCESSO = P.NR_PROCESSO AND'
      
        '                ( F.CD_ITEM IN ( SELECT CD_ITEM_PAGTO_SD  FROM T' +
        'PARAMETROS ) OR'
      
        '                  F.CD_ITEM IN ( SELECT CD_ITEM_RECEB_SD  FROM T' +
        'PARAMETROS ) OR'
      
        '                  F.CD_ITEM IN ( SELECT CD_ITEM_EXT_PAGTO FROM T' +
        'PARAMETROS ) OR'
      
        '                  F.CD_ITEM IN ( SELECT CD_ITEM_EXT_RECEB FROM T' +
        'PARAMETROS ) )'
      '       ) +'
      '       ( SELECT SUM( CASE H.CD_IR_FAT '
      '                       WHEN '#39'0'#39' THEN 0'
      '                       WHEN '#39'1'#39' THEN F.VL_ITEM * (-1)'
      '                       WHEN '#39'2'#39' THEN F.VL_ITEM'
      '                      END )'
      
        '         FROM   TFATURAMENTO_CC F, TPROCESSO P2, TCLIENTE_HABILI' +
        'TACAO H'
      '         WHERE  F.NR_PROCESSO = P.NR_PROCESSO AND'
      '                F.NR_PROCESSO = P2.NR_PROCESSO AND'
      '                P2.CD_UNID_NEG = H.CD_UNID_NEG AND'
      '                P2.CD_PRODUTO = H.CD_PRODUTO AND'
      '                P2.CD_CLIENTE = H.CD_CLIENTE AND'
      
        '                F.CD_ITEM IN ( SELECT CD_ITEM_IR FROM TPARAMETRO' +
        'S ) )'
      '       AS VL_UTILIZADO'
      'FROM     TPROCESSO P'
      'WHERE    P.NR_PROCESSO = :NR_PROCESSO')
    Left = 680
    Top = 135
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_saldo_proc_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
    end
    object qry_saldo_proc_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
    end
  end
  object sp_apaga_devol: TStoredProc
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    StoredProcName = 'dbo.sp_apaga_devol'
    Left = 364
    Top = 200
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
        Name = '@nr_devolucao'
        ParamType = ptInput
      end>
  end
  object qry_saldo_disponivel_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_itens_devol_lista
    SQL.Strings = (
      'SELECT R.VL_RECEBIDO,  '
      '              VL_DEVOLUCAO ='
      '              ( SELECT SUM (VL_DEVOLVIDO) '
      '                    FROM TDEVOLUCAO_ITENS D'
      '                    WHERE D.NR_PROCESSO = R.NR_PROCESSO AND'
      
        '                                   D.NR_RECEBIMENTO = R.NR_RECEB' +
        'IMENTO AND'
      
        '                                   D.NR_LANC_RECEB = R.NR_LANC_R' +
        'ECEB AND'
      '                                   IN_CANCELADO= '#39'0'#39'),'
      '             VL_UTILIZADO '
      'FROM TRECEBIMENTO_ITEM_RECEB R'
      'WHERE R.NR_PROCESSO = :NR_PROCESSO AND'
      '               R.NR_RECEBIMENTO = :NR_RECEBIMENTO AND'
      '               R.NR_LANC_RECEB = :NR_LANC_RECEB AND'
      '               R.IN_CANCELADO = '#39'0'#39)
    Left = 569
    Top = 135
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_RECEBIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANC_RECEB'
        ParamType = ptUnknown
      end>
    object qry_saldo_disponivel_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
    end
    object qry_saldo_disponivel_VL_DEVOLUCAO: TFloatField
      FieldName = 'VL_DEVOLUCAO'
    end
    object qry_saldo_disponivel_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
    end
  end
  object qry_itens_devol_lista_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_devolucao
    SQL.Strings = (
      'SELECT D.NR_PROCESSO, D.NR_DEVOLUCAO, D.NR_LANC_DEVOL,'
      '       D.NR_RECEBIMENTO, D.NR_LANC_RECEB, D.CD_ITEM,'
      '       D.VL_DEVOLVIDO, VL_DISPONIVEL = ( ISNULL ( '
      
        '       ( SELECT SUM (ISNULL (I.VL_RECEBIDO, 0) - ISNULL (I.VL_UT' +
        'ILIZADO, 0) )'
      '         FROM TRECEBIMENTO_ITEM_RECEB I,'
      '              TRECEBIMENTO R'
      '         WHERE I.NR_PROCESSO = R.NR_PROCESSO AND'
      '               I.NR_RECEBIMENTO = R.NR_RECEBIMENTO AND'
      '               I.NR_PROCESSO = D.NR_PROCESSO AND'
      '               I.NR_RECEBIMENTO = D.NR_RECEBIMENTO AND'
      '               I.NR_LANC_RECEB = D.NR_LANC_RECEB AND'
      '               I.CD_ITEM = D.CD_ITEM AND'
      '               I.IN_CANCELADO = '#39'0'#39' AND'
      '               R.IN_CANCELADO = '#39'0'#39'), 0 ) - ISNULL ('
      '       ( SELECT SUM (ISNULL (A.VL_DEVOLVIDO, 0) )'
      '         FROM TDEVOLUCAO_ITENS A,'
      '              TDEVOLUCAO B'
      '         WHERE A.NR_PROCESSO  = B.NR_PROCESSO AND'
      '               A.NR_DEVOLUCAO = B.NR_DEVOLUCAO AND'
      '               A.NR_PROCESSO  = D.NR_PROCESSO AND'
      '               A.CD_ITEM = D.CD_ITEM AND'
      '               B.IN_CANCELADO = '#39'0'#39'), 0) )'
      'FROM   TDEVOLUCAO_ITENS D'
      'WHERE ( D.NR_PROCESSO  = :NR_PROCESSO ) AND'
      '      ( D.NR_DEVOLUCAO = :NR_DEVOLUCAO )')
    Left = 569
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_DEVOLUCAO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object StringField2: TStringField
      DisplayLabel = 'Devolu'#231#227'o'
      FieldName = 'NR_DEVOLUCAO'
      Size = 3
    end
    object StringField7: TStringField
      DisplayLabel = 'Lan'#231'.'
      FieldName = 'NR_LANC_DEVOL'
      Size = 3
    end
    object StringField8: TStringField
      FieldName = 'NR_RECEBIMENTO'
      Size = 3
    end
    object StringField9: TStringField
      FieldName = 'NR_LANC_RECEB'
      Size = 3
    end
    object StringField10: TStringField
      DisplayLabel = 'Item'
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Valor Devolu'#231#227'o'
      FieldName = 'VL_DEVOLVIDO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object StringField11: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'Look_nm_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 40
      Lookup = True
    end
    object qry_itens_devol_lista_VL_DISPONIVEL: TFloatField
      FieldName = 'VL_DISPONIVEL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object ds_itens_devolucao: TDataSource
    DataSet = qry_itens_devolucao_
    Left = 680
    Top = 72
  end
  object qry_tot_distribuicao_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_itens_devol_lista
    SQL.Strings = (
      'SELECT SUM ( ISNULL (VL_DEVOLVIDO, 0)) VL_TOT_DEVOLUCAO'
      'FROM TDEVOLUCAO_ITENS '
      ' WHERE ( NR_PROCESSO = :NR_PROCESSO ) AND'
      ' ( NR_DEVOLUCAO = :NR_DEVOLUCAO )'
      '')
    Left = 680
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_DEVOLUCAO'
        ParamType = ptUnknown
      end>
  end
  object qry_caixa_ctrl_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(DT_MOVIMENTO) + 1 DT_MOVIMENTO'
      'FROM   TCAIXA_CONTROLE'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Left = 563
    Top = 201
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
  end
  object qry_existe_fav_cli_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( F.CD_FAVORECIDO, '#39#39' ) CD_FAVORECIDO'
      'FROM   TFAVORECIDO F, TEMPRESA_NAC E, TPROCESSO P'
      'WHERE  P.CD_CLIENTE = E.CD_EMPRESA AND'
      '       E.CGC_EMPRESA = F.CGC_EMPRESA AND'
      '       P.NR_PROCESSO = :NR_PROCESSO')
    Left = 680
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_existe_fav_cli_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
    end
  end
  object qry_existe_ch_devol_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_STATUS_CHEQUE'
      'FROM   TSOLIC_PAGTO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO AND'
      '       CD_ITEM IN ( SELECT CD_ITEM_DEVOL_NUM FROM TPARAMETROS )'
      '')
    Left = 568
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end>
    object qry_existe_ch_devol_CD_STATUS_CHEQUE: TStringField
      FieldName = 'CD_STATUS_CHEQUE'
      Size = 1
    end
  end
  object qry_saldos_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_itens_devol_lista
    SQL.Strings = (
      'SELECT SUM ( ISNULL (VL_DEVOLVIDO, 0)) VL_TOT_DEVOLUCAO'
      'FROM TDEVOLUCAO_ITENS '
      ' WHERE ( NR_PROCESSO = :NR_PROCESSO ) AND'
      ' ( NR_DEVOLUCAO = :NR_DEVOLUCAO )'
      '')
    Left = 360
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_DEVOLUCAO'
        ParamType = ptUnknown
      end>
  end
end

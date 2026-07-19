object datm_canc_proc: Tdatm_canc_proc
  Left = 293
  Top = 104
  Height = 427
  Width = 485
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 72
    Top = 55
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TUNID_NEG')
    Left = 72
    Top = 7
    object qry_unid_neg_CD_UNID_NEG: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
    object qry_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_NEG.IN_ATIVO'
      Size = 1
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TPRODUTO ')
    Left = 72
    Top = 122
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
    object qry_produto_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Origin = 'TPRODUTO.AP_PRODUTO'
      Size = 10
    end
    object qry_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TPRODUTO.IN_ATIVO'
      Size = 1
    end
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 72
    Top = 170
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 220
    Top = 7
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 220
    Top = 55
  end
  object qry_rel_processo_: TQuery
    OnCalcFields = qry_rel_processo_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, '
      '               CD_CLIENTE, CD_SERVICO, CD_USUARIO,'
      '               IN_CANCELADO, CD_CANCELADOR, DT_CANCELAMENTO,'
      '               IN_LIBERADO'
      'FROM TPROCESSO '
      'WHERE (( CD_UNID_NEG+CD_PRODUTO )  IN '
      '               ( SELECT CD_UNID_NEG+CD_PRODUTO'
      '                   FROM TUSUARIO_HABILITACAO'
      '                   WHERE CD_USUARIO = :CD_USUARIO AND'
      '                                  IN_ATIVO='#39'1'#39'))  AND'
      '               IN_CANCELADO = '#39'0'#39
      'ORDER BY'
      'NR_PROCESSO')
    Params.Data = {010001000A43445F5553554152494F0001020030000000}
    Left = 72
    Top = 232
    object qry_rel_processo_NR_PROCESSO: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_rel_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_rel_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_rel_processo_CD_CLIENTE: TStringField
      DisplayLabel = 'Cód. Cliente'
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_rel_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qry_rel_processo_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object qry_rel_processo_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Size = 1
    end
    object qry_rel_processo_CD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      Size = 4
    end
    object qry_rel_processo_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
    end
    object qry_rel_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Size = 1
    end
    object qry_rel_processo_look_ap_cliente: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'look_ap_cliente'
      LookupDataSet = qry_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'AP_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 25
      Lookup = True
    end
    object qry_rel_processo_look_produto: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'look_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'AP_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 25
      Lookup = True
    end
    object qry_rel_processo_look_ap_usuario: TStringField
      DisplayLabel = 'Usuário'
      FieldName = 'look_ap_usuario'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 25
      Lookup = True
    end
    object qry_rel_processo_look_ap_unidade: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'look_ap_unidade'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'AP_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 25
      Lookup = True
    end
    object qry_rel_processo_nr_processo_calc: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'nr_processo_calc'
      Size = 14
      Calculated = True
    end
  end
  object ds_rel_processo: TDataSource
    DataSet = qry_rel_processo_
    Left = 72
    Top = 280
  end
  object qry_ult_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_PROCESSO) ULTIMO  FROM TPROCESSO'
      'WHERE CD_UNID_NEG=:CD_UNID_NEG AND '
      'CD_PRODUTO=:CD_PRODUTO')
    Params.Data = {
      010002000B43445F554E49445F4E454700010200300000000A43445F50524F44
      55544F0001020030000000}
    Left = 368
    Top = 280
    object qry_ult_processo_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 11
    end
  end
  object qry_empresa_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TEMPRESA_NAC WHERE IN_ATIVO='#39'1'#39)
    Left = 220
    Top = 122
    object qry_empresa_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_empresa_nac_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
      Size = 10
    end
    object qry_empresa_nac_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      Origin = 'TEMPRESA_NAC.END_EMPRESA'
      Size = 50
    end
    object qry_empresa_nac_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Origin = 'TEMPRESA_NAC.END_NUMERO'
      Size = 6
    end
    object qry_empresa_nac_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TEMPRESA_NAC.END_CIDADE'
      Size = 30
    end
    object qry_empresa_nac_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Origin = 'TEMPRESA_NAC.END_BAIRRO'
      Size = 30
    end
    object qry_empresa_nac_END_UF: TStringField
      FieldName = 'END_UF'
      Origin = 'TEMPRESA_NAC.END_UF'
      Size = 2
    end
    object qry_empresa_nac_END_CEP: TStringField
      FieldName = 'END_CEP'
      Origin = 'TEMPRESA_NAC.END_CEP'
      Size = 8
    end
    object qry_empresa_nac_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Origin = 'TEMPRESA_NAC.CD_TIPO_PESSOA'
      Size = 1
    end
    object qry_empresa_nac_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'TEMPRESA_NAC.CGC_EMPRESA'
      Size = 14
    end
    object qry_empresa_nac_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Origin = 'TEMPRESA_NAC.CPF_EMPRESA'
      Size = 11
    end
    object qry_empresa_nac_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
      Origin = 'TEMPRESA_NAC.IE_EMPRESA'
    end
    object qry_empresa_nac_OUTRO_DOC: TStringField
      FieldName = 'OUTRO_DOC'
      Origin = 'TEMPRESA_NAC.OUTRO_DOC'
    end
    object qry_empresa_nac_DT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'TEMPRESA_NAC.DT_INCLUSAO'
    end
    object qry_empresa_nac_IN_FATURAMENTO: TStringField
      FieldName = 'IN_FATURAMENTO'
      Origin = 'TEMPRESA_NAC.IN_FATURAMENTO'
      Size = 1
    end
    object qry_empresa_nac_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TEMPRESA_NAC.IN_ATIVO'
      Size = 1
    end
    object qry_empresa_nac_IN_RESTRICAO: TStringField
      FieldName = 'IN_RESTRICAO'
      Origin = 'TEMPRESA_NAC.IN_RESTRICAO'
      Size = 1
    end
    object qry_empresa_nac_IN_EVENTUAL: TStringField
      FieldName = 'IN_EVENTUAL'
      Origin = 'TEMPRESA_NAC.IN_EVENTUAL'
      Size = 1
    end
    object qry_empresa_nac_CD_TIPO_REF: TStringField
      FieldName = 'CD_TIPO_REF'
      Origin = 'TEMPRESA_NAC.CD_TIPO_REF'
      Size = 1
    end
    object qry_empresa_nac_CD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      Origin = 'TEMPRESA_NAC.CD_TAB_SDA'
      Size = 3
    end
    object qry_empresa_nac_IN_CLIENTE: TBooleanField
      FieldName = 'IN_CLIENTE'
      Origin = 'TEMPRESA_NAC.IN_CLIENTE'
    end
    object qry_empresa_nac_IN_IMPORTADOR: TBooleanField
      FieldName = 'IN_IMPORTADOR'
      Origin = 'TEMPRESA_NAC.IN_IMPORTADOR'
    end
    object qry_empresa_nac_IN_EXPORTADOR: TBooleanField
      FieldName = 'IN_EXPORTADOR'
      Origin = 'TEMPRESA_NAC.IN_EXPORTADOR'
    end
    object qry_empresa_nac_IN_OUTROS: TBooleanField
      FieldName = 'IN_OUTROS'
      Origin = 'TEMPRESA_NAC.IN_OUTROS'
    end
    object qry_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField
      FieldName = 'NR_AG_BANCO_IMPOSTOS'
      Origin = 'TEMPRESA_NAC.NR_AG_BANCO_IMPOSTOS'
      Size = 5
    end
    object qry_empresa_nac_CD_SDA: TStringField
      FieldName = 'CD_SDA'
      Origin = 'TEMPRESA_NAC.CD_SDA'
      Size = 4
    end
    object qry_empresa_nac_NR_CAE: TStringField
      FieldName = 'NR_CAE'
      Origin = 'TEMPRESA_NAC.NR_CAE'
      Size = 10
    end
    object qry_empresa_nac_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TEMPRESA_NAC.CD_GRUPO'
      Size = 3
    end
    object qry_empresa_nac_IN_REPRESENTANTE: TBooleanField
      FieldName = 'IN_REPRESENTANTE'
      Origin = 'TEMPRESA_NAC.IN_REPRESENTANTE'
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = qry_empresa_nac_
    Left = 220
    Top = 170
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TSERVICO WHERE IN_ATIVO='#39'1'#39)
    Left = 368
    Top = 7
    object qry_servico_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 3
    end
    object qry_servico_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Origin = 'TSERVICO.NM_SERVICO'
      Size = 50
    end
    object qry_servico_CD_CLASSIFICACAO: TStringField
      FieldName = 'CD_CLASSIFICACAO'
      Origin = 'TSERVICO.CD_CLASSIFICACAO'
      Size = 2
    end
    object qry_servico_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TSERVICO.CD_VIA_TRANSPORTE'
      Size = 2
    end
    object qry_servico_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TSERVICO.IN_ATIVO'
      Size = 1
    end
  end
  object ds_servico: TDataSource
    DataSet = qry_servico_
    Left = 368
    Top = 55
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TUSUARIO WHERE IN_ATIVO='#39'1'#39)
    Left = 220
    Top = 232
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
  object ds_usuario: TDataSource
    DataSet = qry_usuario_
    Left = 220
    Top = 280
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_rel_processo
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, '
      '               CD_CLIENTE, CD_SERVICO, CD_USUARIO,'
      '               IN_CANCELADO, CD_CANCELADOR, DT_CANCELAMENTO,'
      '               IN_LIBERADO'
      'FROM TPROCESSO '
      'WHERE NR_PROCESSO=:NR_PROCESSO  ')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 368
    Top = 122
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 2
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.CD_SERVICO'
      Size = 3
    end
    object qry_processo_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TPROCESSO.CD_USUARIO'
      Size = 4
    end
    object qry_processo_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TPROCESSO.IN_CANCELADO'
      Size = 1
    end
    object qry_processo_CD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      Origin = 'TPROCESSO.CD_CANCELADOR'
      Size = 4
    end
    object qry_processo_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'TPROCESSO.DT_CANCELAMENTO'
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 368
    Top = 170
  end
  object qry_fat_cc_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_rel_processo
    SQL.Strings = (
      'SELECT'
      'ISNULL('
      
        '( SELECT SUM( ISNULL( F.VL_ITEM, 0 ) + ISNULL( F.VL_ASSIST, 0 ) ' +
        '- ISNULL( F.VL_IR, 0 ) )'
      '  FROM   TFATURAMENTO_CC F'
      '  WHERE  NR_PROCESSO = P.NR_PROCESSO AND'
      '         IN_CANCELADO = '#39'0'#39' AND'
      '         IN_RESTITUI = '#39'0'#39' AND '
      '         CD_ITEM NOT IN ( '#39'993'#39' ) ) +'
      
        '( SELECT SUM( ISNULL( F.VL_ITEM, 0 ) + ISNULL( F.VL_ASSIST, 0 ) ' +
        '- ISNULL( F.VL_IR, 0 ) ) * (-1)'
      '  FROM   TFATURAMENTO_CC F'
      '  WHERE  NR_PROCESSO = P.NR_PROCESSO AND'
      '         IN_CANCELADO = '#39'0'#39' AND'
      '         IN_RESTITUI = '#39'1'#39' ) +'
      
        '( SELECT SUM( ISNULL( F.VL_ITEM, 0 ) + ISNULL( F.VL_ASSIST, 0 ) ' +
        '- ISNULL( F.VL_IR, 0 ) ) * (-1)'
      '  FROM   TFATURAMENTO_CC F'
      '  WHERE  NR_PROCESSO = P.NR_PROCESSO AND'
      '         IN_CANCELADO = '#39'0'#39' AND'
      '         IN_RESTITUI = '#39'0'#39' AND '
      '         CD_ITEM IN ( '#39'993'#39' ) ), 0 ) AS QT_FAT_CC,'
      '( SELECT COUNT(*)'
      '  FROM   TRECEBIMENTO'
      '  WHERE  NR_PROCESSO = P.NR_PROCESSO AND'
      '         IN_CANCELADO = '#39'0'#39' AND'
      '         IN_TRANSFERIDO = '#39'0'#39' ) QT_RECEB,'
      '( SELECT COUNT(*)'
      '  FROM   TSOLIC_CHEQUE S,'
      '         TSOLIC_CHEQUE_ITENS I'
      '  WHERE  S.DT_SOLIC_CH = I.DT_SOLIC_CH AND'
      '         S.NR_SOLIC_CH = I.NR_SOLIC_CH AND'
      '         I.NR_PROCESSO = P.NR_PROCESSO AND'
      '         NOT ( S.CD_STATUS_CHEQUE IN ('#39'5'#39','#39'6'#39','#39'7'#39') ) AND'
      '         NOT ( S.CD_STATUS_CHEQUE IN ('#39'3'#39') ) AND'
      '         NOT ( I.CD_STATUS IN ('#39'5'#39','#39'7'#39','#39'9'#39') ) AND'
      '         I.CD_ITEM NOT IN ( '#39'991'#39', '#39'992'#39', '#39'993'#39' ) AND'
      '         IN_TRANSF = '#39'0'#39' ) QT_SOLIC_CH'
      'FROM  TPROCESSO P'
      'WHERE P.NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 72
    Top = 344
    object qry_fat_cc_QT_FAT_CC: TFloatField
      FieldName = 'QT_FAT_CC'
    end
    object qry_fat_cc_QT_RECEB: TIntegerField
      FieldName = 'QT_RECEB'
    end
    object qry_fat_cc_QT_SOLIC_CH: TIntegerField
      FieldName = 'QT_SOLIC_CH'
    end
  end
end

object datm_ent_ch_br: Tdatm_ent_ch_br
  Left = 164
  Top = 108
  Height = 515
  Width = 727
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TUNID_NEG ')
    Left = 172
    Top = 16
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
      'SELECT * FROM TPRODUTO')
    Left = 267
    Top = 16
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
    object qry_produto_CD_VIATRANSP: TStringField
      FieldName = 'CD_VIATRANSP'
      Origin = 'TPRODUTO.CD_VIATRANSP'
      Size = 1
    end
  end
  object ds_ch_br: TDataSource
    DataSet = qry_ch_br_
    Left = 172
    Top = 193
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 267
    Top = 77
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TUSUARIO WHERE IN_ATIVO = '#39'1'#39)
    Left = 365
    Top = 16
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
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TBANCO WHERE IN_ATIVO = '#39'1'#39)
    Left = 457
    Top = 16
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
    object qry_banco_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Origin = 'TBANCO.NR_BANCO'
      Size = 3
    end
    object qry_banco_LVALOR: TIntegerField
      FieldName = 'LVALOR'
      Origin = 'TBANCO.LVALOR'
    end
    object qry_banco_CVALOR: TIntegerField
      FieldName = 'CVALOR'
      Origin = 'TBANCO.CVALOR'
    end
    object qry_banco_LEXTENSO: TIntegerField
      FieldName = 'LEXTENSO'
      Origin = 'TBANCO.LEXTENSO'
    end
    object qry_banco_CEXTENSO: TIntegerField
      FieldName = 'CEXTENSO'
      Origin = 'TBANCO.CEXTENSO'
    end
    object qry_banco_LFAVOR: TIntegerField
      FieldName = 'LFAVOR'
      Origin = 'TBANCO.LFAVOR'
    end
    object qry_banco_CFAVOR: TIntegerField
      FieldName = 'CFAVOR'
      Origin = 'TBANCO.CFAVOR'
    end
    object qry_banco_LCIDADE: TIntegerField
      FieldName = 'LCIDADE'
      Origin = 'TBANCO.LCIDADE'
    end
    object qry_banco_CCIDADE: TIntegerField
      FieldName = 'CCIDADE'
      Origin = 'TBANCO.CCIDADE'
    end
    object qry_banco_CDIA: TIntegerField
      FieldName = 'CDIA'
      Origin = 'TBANCO.CDIA'
    end
    object qry_banco_CANO: TIntegerField
      FieldName = 'CANO'
      Origin = 'TBANCO.CANO'
    end
    object qry_banco_ANOMASK: TStringField
      FieldName = 'ANOMASK'
      Origin = 'TBANCO.ANOMASK'
      Size = 4
    end
    object qry_banco_FORMCONT: TBooleanField
      FieldName = 'FORMCONT'
      Origin = 'TBANCO.FORMCONT'
    end
    object qry_banco_LEXTENSO2: TIntegerField
      FieldName = 'LEXTENSO2'
      Origin = 'TBANCO.LEXTENSO2'
    end
    object qry_banco_CEXTENSO2: TIntegerField
      FieldName = 'CEXTENSO2'
      Origin = 'TBANCO.CEXTENSO2'
    end
    object qry_banco_CMES: TIntegerField
      FieldName = 'CMES'
      Origin = 'TBANCO.CMES'
    end
    object qry_banco_LCHEQUE: TIntegerField
      FieldName = 'LCHEQUE'
      Origin = 'TBANCO.LCHEQUE'
    end
    object qry_banco_CCHEQUE: TIntegerField
      FieldName = 'CCHEQUE'
      Origin = 'TBANCO.CCHEQUE'
    end
    object qry_banco_CBANCO: TIntegerField
      FieldName = 'CBANCO'
      Origin = 'TBANCO.CBANCO'
    end
    object qry_banco_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TBANCO.AP_BANCO'
      Size = 1
    end
    object qry_banco_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TBANCO.NR_CONTA'
      Size = 3
    end
  end
  object qry_ch_br_: TQuery
    AfterScroll = qry_ch_br_AfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_ch_br_rel
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TCHEQUE_BRANCO '
      'WHERE CD_BANCO=:CD_BANCO'
      'AND NR_CHEQUE=:NR_CHEQUE AND IN_CANCELADO='#39'0'#39' ORDER BY '
      'CD_BANCO,NR_CHEQUE')
    Params.Data = {
      010002000843445F42414E434F0001020030000100094E525F43484551554500
      01020030000100}
    Left = 176
    Top = 138
    object qry_ch_br_CD_BANCO: TStringField
      DisplayLabel = 'Cd Banco'
      FieldName = 'CD_BANCO'
      Origin = 'TCHEQUE_BRANCO.CD_BANCO'
      EditMask = '!999;0; '
      Size = 3
    end
    object qry_ch_br_NR_CHEQUE: TStringField
      DisplayLabel = 'Nr. Cheque'
      FieldName = 'NR_CHEQUE'
      Origin = 'TCHEQUE_BRANCO.NR_CHEQUE'
      EditMask = '!999999;0; '
      Size = 6
    end
    object qry_ch_br_CD_UNID_NEG: TStringField
      DisplayLabel = 'Cd Unid.'
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCHEQUE_BRANCO.CD_UNID_NEG'
      EditMask = '!99;0; '
      Size = 2
    end
    object qry_ch_br_CD_USUARIO: TStringField
      DisplayLabel = 'Cd. Usuário'
      FieldName = 'CD_USUARIO'
      Origin = 'TCHEQUE_BRANCO.CD_BANCO'
      EditMask = '!9999;0; '
      Size = 4
    end
    object qry_ch_br_CD_PRODUTO: TStringField
      DisplayLabel = 'Cd.Produto'
      FieldName = 'CD_PRODUTO'
      Origin = 'TCHEQUE_BRANCO.CD_PRODUTO'
      EditMask = '!99;0; '
      Size = 2
    end
    object qry_ch_br_DT_ENTREGA: TDateTimeField
      DisplayLabel = 'Entrega'
      FieldName = 'DT_ENTREGA'
      Origin = 'TCHEQUE_BRANCO.DT_ENTREGA'
    end
    object qry_ch_br_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'TCHEQUE_BRANCO.IN_TRANSFERIDO'
      Size = 1
    end
    object qry_ch_br_IN_BAIXADO: TStringField
      FieldName = 'IN_BAIXADO'
      Origin = 'TCHEQUE_BRANCO.IN_BAIXADO'
      Size = 1
    end
    object qry_ch_br_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TCHEQUE_BRANCO.CD_BANCO'
      Size = 1
    end
    object qry_ch_br_look_ap_usuario: TStringField
      DisplayLabel = 'Usuário'
      FieldName = 'look_ap_usuario'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 25
      Lookup = True
    end
    object qry_ch_br_look_ap_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'look_ap_banco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'AP_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 25
      Lookup = True
    end
    object qry_ch_br_look_cancelado: TStringField
      DisplayLabel = 'Cancelado'
      FieldName = 'look_cancelado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CANCELADO'
      Size = 3
      Lookup = True
    end
    object qry_ch_br_look_ap_produto: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'look_ap_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'AP_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 25
      Lookup = True
    end
    object qry_ch_br_look_ap_unid_neg: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'look_ap_unid_neg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'AP_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 25
      Lookup = True
    end
    object qry_ch_br_look_ap_favor: TStringField
      FieldName = 'look_ap_favor'
      LookupDataSet = qry_favor_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'AP_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 25
      Lookup = True
    end
    object qry_ch_br_look_nm_unid_neg: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'look_nm_unid_neg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 35
      Lookup = True
    end
    object qry_ch_br_look_nm_produto: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'look_nm_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 35
      Lookup = True
    end
    object qry_ch_br_look_in_controla_ir: TBooleanField
      FieldName = 'look_in_controla_ir'
      LookupDataSet = qry_favor_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'IN_CONTROLA_IR'
      KeyFields = 'CD_FAVORECIDO'
      Lookup = True
    end
    object qry_ch_br_CD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      Origin = 'TCHEQUE_BRANCO.CD_BANCO'
      Size = 4
    end
    object qry_ch_br_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'TCHEQUE_BRANCO.NR_CHEQUE'
    end
    object qry_ch_br_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TCHEQUE_BRANCO.CD_BANCO'
      Size = 5
    end
    object qry_ch_br_DT_BAIXA: TDateTimeField
      FieldName = 'DT_BAIXA'
      Origin = 'TCHEQUE_BRANCO.CD_BANCO'
    end
    object qry_ch_br_DT_PAGAMENTO: TDateTimeField
      FieldName = 'DT_PAGAMENTO'
      Origin = 'TCHEQUE_BRANCO.CD_BANCO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
  end
  object qry_favor_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TFAVORECIDO WHERE IN_ATIVO = '#39'1'#39' ')
    Left = 536
    Top = 16
    object qry_favor_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 5
    end
    object qry_favor_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 50
    end
    object qry_favor_AP_FAVORECIDO: TStringField
      FieldName = 'AP_FAVORECIDO'
      Origin = 'TFAVORECIDO.AP_FAVORECIDO'
      Size = 10
    end
    object qry_favor_END_FAVORECIDO: TStringField
      FieldName = 'END_FAVORECIDO'
      Origin = 'TFAVORECIDO.END_FAVORECIDO'
      Size = 50
    end
    object qry_favor_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Origin = 'TFAVORECIDO.END_NUMERO'
      Size = 6
    end
    object qry_favor_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TFAVORECIDO.END_CIDADE'
      Size = 30
    end
    object qry_favor_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Origin = 'TFAVORECIDO.END_BAIRRO'
      Size = 30
    end
    object qry_favor_END_UF: TStringField
      FieldName = 'END_UF'
      Origin = 'TFAVORECIDO.END_UF'
      Size = 2
    end
    object qry_favor_END_CEP: TStringField
      FieldName = 'END_CEP'
      Origin = 'TFAVORECIDO.END_CEP'
      Size = 8
    end
    object qry_favor_NR_FONE: TStringField
      FieldName = 'NR_FONE'
      Origin = 'TFAVORECIDO.NR_FONE'
      Size = 15
    end
    object qry_favor_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      Origin = 'TFAVORECIDO.NR_FAX'
      Size = 15
    end
    object qry_favor_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'TFAVORECIDO.NM_CONTATO'
      Size = 50
    end
    object qry_favor_TX_CARGO: TStringField
      FieldName = 'TX_CARGO'
      Origin = 'TFAVORECIDO.TX_CARGO'
      Size = 25
    end
    object qry_favor_TX_DEPARTAMENTO: TStringField
      FieldName = 'TX_DEPARTAMENTO'
      Origin = 'TFAVORECIDO.TX_DEPARTAMENTO'
      Size = 50
    end
    object qry_favor_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Origin = 'TFAVORECIDO.CD_TIPO_PESSOA'
      Size = 1
    end
    object qry_favor_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'TFAVORECIDO.CGC_EMPRESA'
      Size = 14
    end
    object qry_favor_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Origin = 'TFAVORECIDO.CPF_EMPRESA'
      Size = 11
    end
    object qry_favor_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
      Origin = 'TFAVORECIDO.IE_EMPRESA'
    end
    object qry_favor_DT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
      Origin = 'TFAVORECIDO.DT_INCLUSAO'
    end
    object qry_favor_IN_CONTROLA_IR: TBooleanField
      FieldName = 'IN_CONTROLA_IR'
      Origin = 'TFAVORECIDO.IN_CONTROLA_IR'
    end
    object qry_favor_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TFAVORECIDO.IN_ATIVO'
      Size = 1
    end
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TUSUARIO_HABILITACAO UH'
      'WHERE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39)
    Params.Data = {010001000A43445F5553554152494F0001020030000000}
    Left = 457
    Top = 138
    object qry_traz_default_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
      Size = 4
    end
    object qry_traz_default_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_traz_default_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUSUARIO_HABILITACAO.CD_PRODUTO'
      Size = 2
    end
    object qry_traz_default_DT_HABILITACAO: TDateTimeField
      FieldName = 'DT_HABILITACAO'
      Origin = 'TUSUARIO_HABILITACAO.DT_HABILITACAO'
    end
    object qry_traz_default_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO_HABILITACAO.IN_ATIVO'
      Size = 1
    end
    object qry_traz_default_IN_DEFAULT: TStringField
      FieldName = 'IN_DEFAULT'
      Origin = 'TUSUARIO_HABILITACAO.IN_DEFAULT'
      Size = 1
    end
    object qry_traz_default_look_nm_unid_neg: TStringField
      FieldName = 'look_nm_unid_neg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 35
      Lookup = True
    end
    object qry_traz_default_look_nm_produto: TStringField
      FieldName = 'look_nm_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 35
      Lookup = True
    end
  end
  object qry_ch_br_it_: TQuery
    AfterScroll = qry_ch_br_it_AfterScroll
    OnCalcFields = qry_ch_br_it_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_ch_br
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TCHEQUE_BRANCO_ITEM '
      'WHERE CD_BANCO=:CD_BANCO AND'
      'NR_CHEQUE=:NR_CHEQUE')
    Params.Data = {
      010002000843445F42414E434F0001020030000000094E525F43484551554500
      01020030000000}
    Left = 267
    Top = 138
    object qry_ch_br_it_CD_BANCO: TStringField
      DisplayLabel = 'Cód. Banco'
      FieldName = 'CD_BANCO'
      Origin = 'TCHEQUE_BRANCO_ITEM.CD_BANCO'
      Size = 3
    end
    object qry_ch_br_it_NR_CHEQUE: TStringField
      DisplayLabel = 'Nr. Cheque'
      FieldName = 'NR_CHEQUE'
      Origin = 'TCHEQUE_BRANCO_ITEM.NR_CHEQUE'
      Size = 6
    end
    object qry_ch_br_it_NR_PROCESSO: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TCHEQUE_BRANCO_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_ch_br_it_CD_ITEM: TStringField
      DisplayLabel = 'Cd Item'
      FieldName = 'CD_ITEM'
      Origin = 'TCHEQUE_BRANCO_ITEM.CD_ITEM'
      Size = 3
    end
    object qry_ch_br_it_VL_ITEM: TFloatField
      DisplayLabel = 'Valor Item'
      FieldName = 'VL_ITEM'
      Origin = 'TCHEQUE_BRANCO_ITEM.VL_ITEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_ch_br_it_VL_IR: TFloatField
      DisplayLabel = 'Valor IR'
      FieldName = 'VL_IR'
      Origin = 'TCHEQUE_BRANCO_ITEM.VL_IR'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_ch_br_it_CD_DESPACHANTE: TStringField
      DisplayLabel = 'Cd Despach.'
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TCHEQUE_BRANCO_ITEM.CD_DESPACHANTE'
      Size = 3
    end
    object qry_ch_br_it_VL_ASSIST: TFloatField
      DisplayLabel = 'Contr. Assist.'
      FieldName = 'VL_ASSIST'
      Origin = 'TCHEQUE_BRANCO_ITEM.VL_ASSIST'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_ch_br_it_VL_BONIFICACAO: TFloatField
      DisplayLabel = 'Bonificação'
      FieldName = 'VL_BONIFICACAO'
      Origin = 'TCHEQUE_BRANCO_ITEM.VL_BONIFICACAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#.##'
    end
    object qry_ch_br_it_look_nm_item: TStringField
      DisplayLabel = 'Item'
      FieldName = 'look_nm_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 35
      Lookup = True
    end
    object qry_ch_br_it_look_ap_desp: TStringField
      FieldName = 'look_ap_desp'
      LookupDataSet = qry_desp_
      LookupKeyFields = 'CD_DESPACHANTE'
      LookupResultField = 'AP_DESPACHANTE'
      KeyFields = 'CD_DESPACHANTE'
      Size = 25
      Lookup = True
    end
    object qry_ch_br_it_nr_processo_calc: TStringField
      DisplayLabel = 'Nr. Processo'
      DisplayWidth = 18
      FieldName = 'nr_processo_calc'
      Size = 18
      Calculated = True
    end
  end
  object ds_ch_br_it: TDataSource
    DataSet = qry_ch_br_it_
    Left = 267
    Top = 193
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT I.* '
      'FROM TITEM I,'
      '           TTIPO_ITEM T'
      'WHERE I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND'
      '              T.IN_SOLIC_CHQ = '#39'1'#39' AND'
      '              I.IN_ATIVO = '#39'1'#39)
    Left = 73
    Top = 77
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
      Origin = 'TITEM.CD_TIPO_LANC_FAT'
      Size = 1
    end
    object qry_item_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TITEM.IN_ATIVO'
      Size = 1
    end
  end
  object qry_desp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TDESPACHANTE WHERE IN_ATIVO = '#39'1'#39' ')
    Left = 172
    Top = 77
    object qry_desp_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TDESPACHANTE.CD_DESPACHANTE'
      Size = 3
    end
    object qry_desp_NM_DESPACHANTE: TStringField
      FieldName = 'NM_DESPACHANTE'
      Origin = 'TDESPACHANTE.NM_DESPACHANTE'
      Size = 50
    end
    object qry_desp_AP_DESPACHANTE: TStringField
      FieldName = 'AP_DESPACHANTE'
      Origin = 'TDESPACHANTE.AP_DESPACHANTE'
      Size = 10
    end
    object qry_desp_VL_MIN_SDA: TFloatField
      FieldName = 'VL_MIN_SDA'
      Origin = 'TDESPACHANTE.VL_MIN_SDA'
    end
    object qry_desp_VL_MAX_SDA: TFloatField
      FieldName = 'VL_MAX_SDA'
      Origin = 'TDESPACHANTE.VL_MAX_SDA'
    end
    object qry_desp_CD_RISC: TStringField
      FieldName = 'CD_RISC'
      Origin = 'TDESPACHANTE.CD_RISC'
      Size = 3
    end
    object qry_desp_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TDESPACHANTE.IN_ATIVO'
      Size = 1
    end
  end
  object qry_ch_br_pesq_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TCHEQUE_BRANCO ORDER BY'
      'CD_BANCO,NR_CHEQUE')
    Left = 365
    Top = 138
    object StringField1: TStringField
      DisplayLabel = 'Cd Banco'
      FieldName = 'CD_BANCO'
      Origin = 'TCHEQUE_BRANCO.CD_BANCO'
      EditMask = '!999;0; '
      Size = 3
    end
    object StringField2: TStringField
      DisplayLabel = 'Nr. Cheque'
      FieldName = 'NR_CHEQUE'
      Origin = 'TCHEQUE_BRANCO.NR_CHEQUE'
      EditMask = '!999999;0; '
      Size = 6
    end
    object StringField3: TStringField
      DisplayLabel = 'Cd Unid.'
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCHEQUE_BRANCO.CD_UNID_NEG'
      EditMask = '!99;0; '
      Size = 2
    end
    object StringField4: TStringField
      DisplayLabel = 'Cd. Usuário'
      FieldName = 'CD_USUARIO'
      Origin = 'TCHEQUE_BRANCO.CD_BANCO'
      EditMask = '!9999;0; '
      Size = 4
    end
    object StringField5: TStringField
      DisplayLabel = 'Cd.Produto'
      FieldName = 'CD_PRODUTO'
      Origin = 'TCHEQUE_BRANCO.CD_PRODUTO'
      EditMask = '!99;0; '
      Size = 2
    end
    object StringField6: TStringField
      DisplayLabel = 'Cd. Favor.'
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TCHEQUE_BRANCO.CD_FAVORECIDO'
      EditMask = '!99999;0; '
      Size = 5
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Entrega'
      FieldName = 'DT_ENTREGA'
      Origin = 'TCHEQUE_BRANCO.DT_ENTREGA'
    end
    object StringField7: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'TCHEQUE_BRANCO.IN_TRANSFERIDO'
      Size = 1
    end
    object StringField8: TStringField
      FieldName = 'IN_BAIXADO'
      Origin = 'TCHEQUE_BRANCO.IN_BAIXADO'
      Size = 1
    end
    object StringField9: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TCHEQUE_BRANCO.CD_BANCO'
      Size = 1
    end
    object StringField10: TStringField
      DisplayLabel = 'Usuário'
      FieldName = 'look_ap_usuario'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 25
      Lookup = True
    end
    object StringField11: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'look_ap_banco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'AP_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 25
      Lookup = True
    end
    object StringField12: TStringField
      DisplayLabel = 'Cancelado'
      FieldName = 'look_cancelado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CANCELADO'
      Size = 3
      Lookup = True
    end
    object StringField13: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'look_ap_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'AP_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 25
      Lookup = True
    end
    object StringField14: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'look_ap_unid_neg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'AP_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 25
      Lookup = True
    end
    object StringField15: TStringField
      FieldName = 'look_ap_favor'
      LookupDataSet = qry_favor_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'AP_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 25
      Lookup = True
    end
    object StringField16: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'look_nm_unid_neg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 35
      Lookup = True
    end
    object StringField17: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'look_nm_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 35
      Lookup = True
    end
    object qry_ch_br_pesq_CD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      Origin = 'TCHEQUE_BRANCO.CD_BANCO'
      Size = 4
    end
    object qry_ch_br_pesq_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'TCHEQUE_BRANCO.NR_CHEQUE'
    end
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TUNID_NEG_PRODUTO '
      'WHERE (CD_UNID_NEG+CD_PRODUTO) IN '
      '               (SELECT (CD_UNID_NEG+CD_PRODUTO) '
      '               FROM TUSUARIO_HABILITACAO '
      '               WHERE CD_USUARIO=:CD_USUARIO AND IN_ATIVO='#39'1'#39')  ')
    Params.Data = {010001000A43445F5553554152494F0001020030000000}
    Left = 73
    Top = 16
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_usuario_habilitacao_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object qry_usuario_habilitacao_NR_ULT_FATURA: TFloatField
      FieldName = 'NR_ULT_FATURA'
    end
    object qry_usuario_habilitacao_NR_ULT_NOTA: TFloatField
      FieldName = 'NR_ULT_NOTA'
    end
    object qry_usuario_habilitacao_NR_ULT_PROCESSO: TFloatField
      FieldName = 'NR_ULT_PROCESSO'
    end
    object qry_usuario_habilitacao_NR_ULT_PREVISAO: TStringField
      FieldName = 'NR_ULT_PREVISAO'
      Size = 6
    end
    object qry_usuario_habilitacao_TX_NUMERARIO_OBS: TMemoField
      FieldName = 'TX_NUMERARIO_OBS'
      BlobType = ftMemo
    end
    object qry_usuario_habilitacao_TX_NUMERARIO_ASS: TMemoField
      FieldName = 'TX_NUMERARIO_ASS'
      BlobType = ftMemo
    end
  end
  object qry_ch_br_it_pesq_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TCHEQUE_BRANCO_ITEM ')
    Left = 365
    Top = 193
    object qry_ch_br_it_pesq_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TCHEQUE_BRANCO_ITEM.CD_BANCO'
      Size = 3
    end
    object qry_ch_br_it_pesq_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TCHEQUE_BRANCO_ITEM.NR_CHEQUE'
      Size = 6
    end
    object qry_ch_br_it_pesq_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TCHEQUE_BRANCO_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_ch_br_it_pesq_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TCHEQUE_BRANCO_ITEM.CD_ITEM'
      Size = 3
    end
    object qry_ch_br_it_pesq_VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
      Origin = 'TCHEQUE_BRANCO_ITEM.VL_ITEM'
    end
    object qry_ch_br_it_pesq_VL_IR: TFloatField
      FieldName = 'VL_IR'
      Origin = 'TCHEQUE_BRANCO_ITEM.VL_IR'
    end
    object qry_ch_br_it_pesq_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TCHEQUE_BRANCO_ITEM.CD_DESPACHANTE'
      Size = 3
    end
    object qry_ch_br_it_pesq_VL_ASSIST: TFloatField
      FieldName = 'VL_ASSIST'
      Origin = 'TCHEQUE_BRANCO_ITEM.VL_ASSIST'
    end
    object qry_ch_br_it_pesq_VL_BONIFICACAO: TFloatField
      FieldName = 'VL_BONIFICACAO'
      Origin = 'TCHEQUE_BRANCO_ITEM.VL_BONIFICACAO'
    end
  end
  object qry_ch_br_rel_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TCHEQUE_BRANCO WHERE (CD_UNID_NEG+CD_PRODUTO) IN '
      '               (SELECT (CD_UNID_NEG+CD_PRODUTO) '
      '               FROM TUSUARIO_HABILITACAO '
      
        '               WHERE CD_USUARIO=:CD_USUARIO AND IN_ATIVO='#39'1'#39')  A' +
        'ND IN_CANCELADO='#39'0'#39' AND IN_BAIXADO = '#39'0'#39
      'ORDER BY '
      'CD_BANCO,NR_CHEQUE')
    Params.Data = {010001000A43445F5553554152494F0001020030000000}
    Left = 73
    Top = 138
    object qry_ch_br_rel_CD_BANCO: TStringField
      DisplayLabel = 'Cd. Banco'
      FieldName = 'CD_BANCO'
      Size = 3
    end
    object qry_ch_br_rel_NR_CHEQUE: TStringField
      DisplayLabel = 'Nr. Cheque'
      FieldName = 'NR_CHEQUE'
      Size = 6
    end
    object qry_ch_br_rel_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_ch_br_rel_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_ch_br_rel_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object qry_ch_br_rel_DT_ENTREGA: TDateTimeField
      DisplayLabel = 'Entrega'
      FieldName = 'DT_ENTREGA'
    end
    object qry_ch_br_rel_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Size = 1
    end
    object qry_ch_br_rel_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Size = 1
    end
    object qry_ch_br_rel_IN_BAIXADO: TStringField
      FieldName = 'IN_BAIXADO'
      Size = 1
    end
    object qry_ch_br_rel_look_ap_usuario: TStringField
      DisplayLabel = 'Usuário'
      FieldName = 'look_ap_usuario'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 25
      Lookup = True
    end
    object qry_ch_br_rel_look_ap_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'look_ap_banco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'AP_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 25
      Lookup = True
    end
    object qry_ch_br_rel_look_cancelado: TStringField
      DisplayLabel = 'Cancelado'
      FieldName = 'look_cancelado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CANCELADO'
      Size = 3
      Lookup = True
    end
    object qry_ch_br_rel_look_ap_produto: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'look_ap_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'AP_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 25
      Lookup = True
    end
    object qry_ch_br_rel_look_ap_unid_neg: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'look_ap_unid_neg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'AP_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 25
      Lookup = True
    end
    object qry_ch_br_rel_look_ap_favor: TStringField
      FieldName = 'look_ap_favor'
      LookupDataSet = qry_favor_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'AP_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 25
      Lookup = True
    end
    object qry_ch_br_rel_look_nm_unid_neg: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'look_nm_unid_neg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 35
      Lookup = True
    end
    object qry_ch_br_rel_look_nm_produto: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'look_nm_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 35
      Lookup = True
    end
    object qry_ch_br_rel_CD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      Size = 4
    end
    object qry_ch_br_rel_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
    end
    object qry_ch_br_rel_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
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
    Params.Data = {
      010001000B4E525F50524F434553534F00010C00303130313938303030313000
      0001}
    Left = 536
    Top = 138
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
    Left = 536
    Top = 193
  end
  object ds_ch_br_rel: TDataSource
    DataSet = qry_ch_br_rel_
    Left = 73
    Top = 193
  end
  object sp_baixar_cheque: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_baixar_ch_br'
    Params.Data = {
      0100040006526573756C7404030400000000000001094063645F62616E636F01
      010200300000000A406E725F63686571756501010200300000000D4064745F6D
      6F76696D656E746F010B080000002C845D40CB420000}
    Left = 73
    Top = 272
  end
  object qry_caixa_controle_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TCAIXA_CONTROLE'
      'WHERE CD_COLIGADA = :CD_COLIGADA AND'
      '               DT_MOVIMENTO >= :DT_MOVIMENTO')
    Params.Data = {
      010002000B43445F434F4C494741444100010200300000000C44545F4D4F5649
      4D454E544F000904005A950A000000}
    Left = 363
    Top = 266
    object qry_caixa_controle_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCAIXA_CONTROLE.CD_COLIGADA'
      Size = 2
    end
    object qry_caixa_controle_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCAIXA_CONTROLE.DT_MOVIMENTO'
    end
    object qry_caixa_controle_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TCAIXA_CONTROLE.CD_USUARIO'
      Size = 4
    end
  end
  object ds_caixa_controle: TDataSource
    DataSet = qry_caixa_controle_
    Left = 265
    Top = 266
  end
end

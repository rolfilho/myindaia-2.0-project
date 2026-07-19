object datm_canc_proc: Tdatm_canc_proc
  OldCreateOrder = True
  Left = 534
  Top = 79
  Height = 648
  Width = 643
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
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      DisplayLabel = 'Descri'#231#227'o'
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
  object qry_rel_processo_1: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT A.NR_PROCESSO, A.CD_UNID_NEG, A.CD_PRODUTO,'
      '               A.CD_CLIENTE, A.CD_SERVICO, A.CD_USUARIO,'
      
        '               A.IN_CANCELADO, A.CD_CANCELADOR, A.DT_CANCELAMENT' +
        'O,'
      '               A.IN_LIBERADO'
      'FROM TPROCESSO A, TUSUARIO_HABILITACAO B'
      'WHERE'
      '  A.CD_UNID_NEG = B.CD_UNID_NEG AND'
      '  A.CD_PRODUTO = B.CD_PRODUTO AND'
      '  A.IN_CANCELADO = '#39'0'#39' AND'
      '  B.CD_USUARIO =:CD_USUARIO AND'
      '  B.IN_ATIVO = '#39'1'#39)
    Left = 72
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_rel_processo_1NR_PROCESSO: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_rel_processo_1CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_rel_processo_1CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_rel_processo_1CD_CLIENTE: TStringField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_rel_processo_1CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qry_rel_processo_1CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object qry_rel_processo_1IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Size = 1
    end
    object qry_rel_processo_1CD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      Size = 4
    end
    object qry_rel_processo_1DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
    end
    object qry_rel_processo_1IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Size = 1
    end
    object qry_rel_processo_1look_ap_cliente: TStringField
      DisplayLabel = 'Cliente'
      FieldKind = fkLookup
      FieldName = 'look_ap_cliente'
      LookupDataSet = qry_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'AP_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      LookupCache = True
      Size = 25
      Lookup = True
    end
    object qry_rel_processo_1look_produto: TStringField
      DisplayLabel = 'Produto'
      FieldKind = fkLookup
      FieldName = 'look_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'AP_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      LookupCache = True
      Size = 25
      Lookup = True
    end
    object qry_rel_processo_1look_ap_usuario: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldKind = fkLookup
      FieldName = 'look_ap_usuario'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      LookupCache = True
      Size = 25
      Lookup = True
    end
    object qry_rel_processo_1look_ap_unidade: TStringField
      DisplayLabel = 'Unidade'
      FieldKind = fkLookup
      FieldName = 'look_ap_unidade'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'AP_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      LookupCache = True
      Size = 25
      Lookup = True
    end
    object qry_rel_processo_1nr_processo_calc: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldKind = fkCalculated
      FieldName = 'nr_processo_calc'
      Size = 14
      Calculated = True
    end
  end
  object ds_rel_processo1: TDataSource
    DataSet = qry_rel_processo_1
    Left = 72
    Top = 280
  end
  object qry_ult_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_PROCESSO) ULTIMO  FROM TPROCESSO'
      'WHERE CD_UNID_NEG=:CD_UNID_NEG AND '
      'CD_PRODUTO=:CD_PRODUTO')
    Left = 368
    Top = 224
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
    Left = 368
    Top = 122
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
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
    Left = 72
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
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
  object qry_pgto_lancado_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '--ITENS 992,987,988,993 s'#227'o itens de estorno, por isso que'
      
        '--s'#227'o multiplicados por -1 para que seja somado com o outro lan'#231 +
        'amento e anular'
      ''
      'SELECT'
      'ISNULL(SUM(case CD_ITEM'
      #9'when 992 then ISNULL( VL_ITEM, 0) * -1'
      #9'when 987 then ISNULL( VL_ITEM, 0) * -1'
      #9'when 988 then ISNULL( VL_ITEM, 0) * -1'
      #9'when 993 then ISNULL( VL_ITEM, 0) * -1'
      #9'when 991 then ISNULL( VL_ITEM, 0)'
      #9'when 997 then ISNULL( VL_ITEM, 0)'
      #9'when 998 then ISNULL( VL_ITEM, 0)'
      '       end),0)  +'
      
        'ISNULL( SUM( case when (IN_RESTITUI = 1 and CD_ITEM not in(992,9' +
        '87,988,993,991,997,998)) then ISNULL( VL_ITEM, 0) * -1'
      
        #9'  when (IN_RESTITUI=0 and CD_ITEM not in(992,987,988,993,991,99' +
        '7,998)) then ISNULL( VL_ITEM, 0)'
      #9'end),0) VL_TOTAL'
      'FROM TFATURAMENTO_CC'
      'WHERE'
      ' NR_PROCESSO =:NR_PROCESSO and IN_CANCELADO = '#39'0'#39
      '')
    Left = 368
    Top = 368
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_pgto_lancado_qt_calc_processos: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'qt_calc_processos'
      Calculated = True
    end
    object qry_pgto_lancado_VL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
  end
  object ds_pgto_lancado: TDataSource
    DataSet = qry_pgto_lancado_
    Left = 368
    Top = 312
  end
  object qry_rel_processo_: TQuery
    OnCalcFields = qry_rel_processo_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM ('
      'SELECT A.NR_PROCESSO,   A.CD_UNID_NEG,    A.CD_PRODUTO,'
      '       A.CD_CLIENTE,    A.CD_SERVICO,     A.CD_USUARIO,'
      '       A.IN_CANCELADO,  A.CD_CANCELADOR,  A.DT_CANCELAMENTO,'
      '       A.IN_LIBERADO,   C.AP_EMPRESA,     D.AP_PRODUTO,'
      '       E.AP_USUARIO,    F.AP_UNID_NEG'
      'FROM TPROCESSO            A (NOLOCK),'
      '     TUSUARIO_HABILITACAO B (NOLOCK),'
      '     TEMPRESA_NAC         C (NOLOCK), '
      '     TPRODUTO             D (NOLOCK),'
      '     TUSUARIO             E (NOLOCK),'
      '     TUNID_NEG            F (NOLOCK),'
      '     TFOLLOWUP            G (NOLOCK)'
      'WHERE A.CD_UNID_NEG  = B.CD_UNID_NEG'
      '  AND A.CD_PRODUTO   = B.CD_PRODUTO'
      '  AND B.CD_USUARIO   = :CD_USUARIO'
      '  AND B.IN_ATIVO     = '#39'1'#39
      '  AND A.IN_CANCELADO = '#39'0'#39
      '  AND A.CD_PRODUTO   <> '#39'06'#39
      '  AND A.CD_CLIENTE   = C.CD_EMPRESA'
      '  AND A.CD_PRODUTO   = D.CD_PRODUTO'
      '  AND A.CD_USUARIO   = E.CD_USUARIO'
      '  AND A.CD_UNID_NEG  = F.CD_UNID_NEG'
      '  AND A.NR_PROCESSO  = G.NR_PROCESSO'
      '  AND G.IN_APLICAVEL = '#39'1'#39'  '
      ''
      '  AND ( ( G.CD_EVENTO    = '#39'092'#39' AND G.DT_REALIZACAO IS NULL) OR'
      
        '        ( SUBSTRING(G.NR_PROCESSO,5,2)='#39'LI'#39' AND G.CD_EVENTO='#39'379' +
        #39' AND G.DT_REALIZACAO IS NULL   ) OR'
      
        '        ( SUBSTRING(G.NR_PROCESSO,5,2)='#39'TD'#39' AND G.CD_EVENTO='#39'600' +
        #39' AND G.DT_REALIZACAO IS NULL   )'
      '      )'
      ''
      ''
      
        'AND (SELECT COUNT(CR.ID) FROM MYINDAIAV2.DBO.CUSTOMCLEARANCE CC ' +
        '(NOLOCK)'
      
        'LEFT JOIN MYINDAIAV2.DBO.CASHREQUESTED CR (NOLOCK) ON CR.CUSTOMC' +
        'LEARANCE_ID = CC.ID'
      'WHERE CR.status!='#39'CANCELED'#39' AND CC.CUSTOMID = A.NR_PROCESSO) = 0'
      ''
      
        'AND (SELECT COUNT(PR.ID) FROM MYINDAIAV2.DBO.CUSTOMCLEARANCE CC ' +
        '(NOLOCK)'
      
        'LEFT JOIN MYINDAIAV2.DBO.PAYMENTREQUESTED PR (NOLOCK) ON PR.CUST' +
        'OMCLEARANCE_ID = CC.ID'
      'WHERE CC.CUSTOMID = A.NR_PROCESSO) = 0'
      ''
      
        'AND (SELECT COUNT(B.ID) FROM MYINDAIAV2.DBO.BILLING_ITEMINVOICED' +
        ' BII (NOLOCK)'
      
        'LEFT JOIN MYINDAIAV2.DBO.BILLING B (NOLOCK) ON B.ID = BII.BILLIN' +
        'G_ID'
      
        'LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED II (NOLOCK) ON II.ID = BII' +
        '.ITENSINVOICED_ID'
      
        'LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC (NOLOCK) ON CC.ID = ' +
        'II.CUSTOMCLEARANCE_ID'
      'WHERE B.STATUS !='#39'CLOSED'#39' AND CC.CUSTOMID = A.NR_PROCESSO) = 0'
      ''
      ''
      '  AND YEAR(A.DT_ABERTURA) >= YEAR(GETDATE())-2'
      ') AS TABELA -- BY GUILHERME'
      'ORDER BY '
      
        'SUBSTRING(NR_PROCESSO, 13, 2) ASC, SUBSTRING(NR_PROCESSO, 1, 6) ' +
        'ASC, SUBSTRING(NR_PROCESSO, 8, 4) ASC')
    Left = 76
    Top = 457
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
        Value = ''
      end>
    object qry_rel_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO.NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 18
    end
    object qry_rel_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TPROCESSO.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_rel_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TPROCESSO.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_rel_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TPROCESSO.CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_rel_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'DBBROKER.TPROCESSO.CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_rel_processo_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TPROCESSO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_rel_processo_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'DBBROKER.TPROCESSO.IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qry_rel_processo_CD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      Origin = 'DBBROKER.TPROCESSO.CD_CANCELADOR'
      FixedChar = True
      Size = 4
    end
    object qry_rel_processo_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'DBBROKER.TPROCESSO.DT_CANCELAMENTO'
    end
    object qry_rel_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Origin = 'DBBROKER.TPROCESSO.IN_LIBERADO'
      FixedChar = True
      Size = 1
    end
    object qry_rel_processo_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.AP_EMPRESA'
      FixedChar = True
      Size = 10
    end
    object qry_rel_processo_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Origin = 'DBBROKER.TPRODUTO.AP_PRODUTO'
      FixedChar = True
      Size = 10
    end
    object qry_rel_processo_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Origin = 'DBBROKER.TUSUARIO.AP_USUARIO'
      FixedChar = True
      Size = 15
    end
    object qry_rel_processo_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.AP_UNID_NEG'
      FixedChar = True
      Size = 10
    end
    object qry_rel_processo_nr_processo_calc: TStringField
      FieldKind = fkCalculated
      FieldName = 'nr_processo_calc'
      Size = 18
      Calculated = True
    end
  end
  object ds_rel_processo: TDataSource
    DataSet = qry_rel_processo_
    Left = 76
    Top = 513
  end
  object qry_Caixa_Money: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_rel_processo
    SQL.Strings = (
      'SELECT LC.*'
      'FROM MYMONEY.DBO.TB_LANCTO L'
      
        '   INNER JOIN MYMONEY.DBO.TB_LANCTO_CAIXA LC ON LC.ANO_LANCTO = ' +
        'L.ANO_LANCTO'
      '   '
      
        '                                            AND LC.NR_LANCTO = L' +
        '.NR_LANCTO'
      
        '   INNER JOIN MYMONEY.DBO.TB_LANCTO_FUP LF ON LF.ANO_LANCTO = L.' +
        'ANO_LANCTO'
      
        '                                          AND LF.NR_LANCTO = L.N' +
        'R_LANCTO'
      
        '   INNER JOIN MYMONEY.DBO.TB_EMISSAO_DETALHE ED ON ED.ANO_LANCTO' +
        ' = LF.ANO_LANCTO'
      
        '                                               AND ED.NR_LANCTO ' +
        '= LF.NR_LANCTO'
      
        '                                               AND ((ED.NR_LANCT' +
        'O_FUP = LF.NR_LANCTO_FUP) OR (ED.ANO_EMISSAO = LF.ANO_EMISSAO AN' +
        'D ED.NR_EMISSAO = LF.NR_EMISSAO))'
      
        '   INNER JOIN MYMONEY.DBO.TB_EMISSAO E ON E.ANO_EMISSAO = ED.ANO' +
        '_EMISSAO'
      
        '                                      AND E.NR_EMISSAO = ED.NR_E' +
        'MISSAO'
      'WHERE L.NR_PROCESSO = :NR_PROCESSO'
      '  AND L.IN_CANCELADO = '#39'0'#39
      '  AND E.IN_CANCELADO = '#39'0'#39)
    Left = 160
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_Caixa_MoneyNR_LANCTO: TIntegerField
      FieldName = 'NR_LANCTO'
    end
    object qry_Caixa_MoneyANO_LANCTO: TIntegerField
      FieldName = 'ANO_LANCTO'
    end
    object qry_Caixa_MoneyNR_CAIXA: TIntegerField
      FieldName = 'NR_CAIXA'
    end
    object qry_Caixa_MoneyANO_CAIXA: TIntegerField
      FieldName = 'ANO_CAIXA'
    end
    object qry_Caixa_MoneyVL_LANCTO_CAIXA: TFloatField
      FieldName = 'VL_LANCTO_CAIXA'
    end
    object qry_Caixa_MoneyNR_LANCTO_FUP: TIntegerField
      FieldName = 'NR_LANCTO_FUP'
    end
  end
end

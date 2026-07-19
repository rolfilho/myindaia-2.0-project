object datm_gestao_po: Tdatm_gestao_po
  OldCreateOrder = True
  Left = 116
  Top = 63
  Height = 637
  Width = 855
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT UP.CD_UNID_NEG, UP.CD_PRODUTO, UP.IN_ATIVO, '
      '       U.NM_UNID_NEG, P.NM_PRODUTO'
      'FROM   TUNID_NEG_PRODUTO UP, TUNID_NEG U, TPRODUTO P'
      'WHERE  UP.CD_UNID_NEG = U.CD_UNID_NEG AND'
      '       UP.CD_PRODUTO = P.CD_PRODUTO AND'
      '       ( UP.CD_UNID_NEG + UP.CD_PRODUTO ) IN'
      '               ( SELECT ( H.CD_UNID_NEG+H.CD_PRODUTO )'
      '                 FROM   TUSUARIO_HABILITACAO H'
      '                 WHERE  H.CD_USUARIO = :CD_USUARIO AND'
      '                        H.IN_ATIVO = '#39'1'#39' )')
    Left = 184
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
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
    object qry_usuario_habilitacao_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Size = 50
    end
    object qry_usuario_habilitacao_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Size = 40
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_PAIS '
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG'
      '')
    Left = 64
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'TUNID_NEG.CD_PAIS'
      Size = 3
    end
  end
  object qry_unid_neg_produto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT UNP.*'
      'FROM  TUNID_NEG_PRODUTO AS UNP'
      'WHERE CD_UNID_NEG=:CD_UNID_NEG AND'
      'CD_PRODUTO=:CD_PRODUTO'
      '')
    Left = 296
    Top = 176
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
    object qry_unid_neg_produto_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'look_ativo'
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 5
      Lookup = True
    end
    object qry_unid_neg_produto_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG_PRODUTO.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUNID_NEG_PRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_unid_neg_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_NEG_PRODUTO.IN_ATIVO'
      Size = 1
    end
    object qry_unid_neg_produto_NR_ULT_FATURA: TFloatField
      FieldName = 'NR_ULT_FATURA'
      Origin = 'TUNID_NEG_PRODUTO.NR_ULT_FATURA'
    end
    object qry_unid_neg_produto_NR_ULT_NOTA: TFloatField
      FieldName = 'NR_ULT_NOTA'
      Origin = 'TUNID_NEG_PRODUTO.NR_ULT_NOTA'
    end
    object qry_unid_neg_produto_NR_ULT_PROCESSO: TFloatField
      FieldName = 'NR_ULT_PROCESSO'
      Origin = 'TUNID_NEG_PRODUTO.NR_ULT_PROCESSO'
    end
    object qry_unid_neg_produto_NR_ULT_PREVISAO: TStringField
      FieldName = 'NR_ULT_PREVISAO'
      Origin = 'TUNID_NEG_PRODUTO.NR_ULT_PREVISAO'
      Size = 6
    end
    object qry_unid_neg_produto_TX_NUMERARIO_OBS: TMemoField
      FieldName = 'TX_NUMERARIO_OBS'
      Origin = 'TUNID_NEG_PRODUTO.TX_NUMERARIO_OBS'
      BlobType = ftMemo
    end
    object qry_unid_neg_produto_TX_NUMERARIO_ASS: TMemoField
      FieldName = 'TX_NUMERARIO_ASS'
      Origin = 'TUNID_NEG_PRODUTO.TX_NUMERARIO_ASS'
      BlobType = ftMemo
    end
    object qry_unid_neg_produto_look_nm_produto: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'look_nm_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
    object qry_unid_neg_produto_look_ap_produto: TStringField
      DisplayLabel = 'Apelido'
      FieldKind = fkLookup
      FieldName = 'look_ap_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'AP_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Lookup = True
    end
    object qry_unid_neg_produto_look_nm_unid_neg: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_unid_neg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TPRODUTO')
    Left = 184
    Top = 8
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
  object ds_yesno: TDataSource
    DataSet = qry_yes_no
    Left = 440
    Top = 8
  end
  object qry_cliente_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT H.CD_CLIENTE, H.CD_UNID_NEG, H.CD_PRODUTO, H.IN_ATIVO, E.' +
        'IN_RESTRICAO, H.DT_VALID_CRED_RF,'
      '       E.IN_COMPRADOR, E.NM_EMPRESA, E.CD_GRUPO, E.IN_IMPORTADOR'
      'FROM   TEMPRESA_NAC E (NOLOCK), TCLIENTE_HABILITACAO H (NOLOCK)'
      'WHERE  E.CD_EMPRESA *= H.CD_CLIENTE AND'
      '       E.CD_EMPRESA = :CD_CLIENTE'
      '')
    Left = 64
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
    object qry_cliente_habilitacao_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_habilitacao_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object qry_cliente_habilitacao_IN_RESTRICAO: TStringField
      FieldName = 'IN_RESTRICAO'
      Size = 1
    end
    object qry_cliente_habilitacao_DT_VALID_CRED_RF: TDateTimeField
      FieldName = 'DT_VALID_CRED_RF'
    end
    object qry_cliente_habilitacao_IN_COMPRADOR: TBooleanField
      FieldName = 'IN_COMPRADOR'
    end
    object qry_cliente_habilitacao_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object qry_cliente_habilitacao_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
    object qry_cliente_habilitacao_IN_IMPORTADOR: TBooleanField
      FieldName = 'IN_IMPORTADOR'
    end
  end
  object qry_processo_velho_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, CD_GRUP' +
        'O, CD_EXPORTADOR, HR_PEDIDO, DT_PEDIDO,  NR_REFERENCIA, '
      
        '       DT_ABERTURA, CD_USUARIO, CD_SERVICO, NR_PROC_RISC, CD_PAI' +
        'S_DESTINO, CD_PAIS_ORIGEM, CD_CELULA, CD_ANALISTA_COMISSARIA, '
      
        '       CD_STATUS_SDA, IN_LIBERADO, CD_RESTRICAO, NR_CONHECIMENTO' +
        ', NR_CONHECIMENTO_MASTER, CD_AREA, IN_ENTREPOSTO, HR_ABERTURA'
      'FROM   TPROCESSO'
      'WHERE  1 = 0')
    Left = 184
    Top = 176
    object qry_processo_velho_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_velho_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_velho_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_PRODUTO'
      EditMask = '!999;1; '
      Size = 2
    end
    object qry_processo_velho_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      EditMask = '!99999;1; '
      Size = 5
    end
    object qry_processo_velho_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'TPROCESSO.DT_ABERTURA'
    end
    object qry_processo_velho_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TPROCESSO.CD_USUARIO'
      Size = 4
    end
    object qry_processo_velho_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.CD_SERVICO'
      Size = 3
    end
    object qry_processo_velho_NR_PROC_RISC: TStringField
      FieldName = 'NR_PROC_RISC'
      Origin = 'TPROCESSO.NR_PROC_RISC'
      Size = 5
    end
    object qry_processo_velho_CD_STATUS_SDA: TStringField
      FieldName = 'CD_STATUS_SDA'
      Origin = 'TPROCESSO.CD_STATUS_SDA'
      Size = 1
    end
    object qry_processo_velho_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Origin = 'TPROCESSO.IN_LIBERADO'
      Size = 1
    end
    object qry_processo_velho_CD_RESTRICAO: TStringField
      FieldName = 'CD_RESTRICAO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 1
    end
    object qry_processo_velho_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 30
    end
    object qry_processo_velho_NR_CONHECIMENTO_MASTER: TStringField
      FieldName = 'NR_CONHECIMENTO_MASTER'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 30
    end
    object qry_processo_velho_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 2
    end
    object qry_processo_velho_CD_PAIS_DESTINO: TStringField
      FieldName = 'CD_PAIS_DESTINO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 3
    end
    object qry_processo_velho_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 3
    end
    object qry_processo_velho_IN_ENTREPOSTO: TStringField
      FieldName = 'IN_ENTREPOSTO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 1
    end
    object qry_processo_velho_CD_ANALISTA_COMISSARIA: TStringField
      FieldName = 'CD_ANALISTA_COMISSARIA'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 4
    end
    object qry_processo_velho_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 3
    end
    object qry_processo_velho_CD_CELULA: TStringField
      FieldName = 'CD_CELULA'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 2
    end
    object qry_processo_velho_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPROCESSO.NR_PROCESSO'
      EditMask = '!99999;1; '
      Size = 5
    end
    object qry_processo_velho_HR_PEDIDO: TDateTimeField
      FieldName = 'HR_PEDIDO'
      Origin = 'TPROCESSO.NR_PROCESSO'
    end
    object qry_processo_velho_DT_PEDIDO: TDateTimeField
      FieldName = 'DT_PEDIDO'
      Origin = 'TPROCESSO.CD_UNID_NEG'
    end
    object qry_processo_velho_HR_ABERTURA: TDateTimeField
      FieldName = 'HR_ABERTURA'
      Origin = 'TPROCESSO.NR_PROCESSO'
    end
    object qry_processo_velho_NR_REFERENCIA: TStringField
      FieldName = 'NR_REFERENCIA'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
  end
  object qry_ult_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_PROCESSO) ULTIMO'
      'FROM   TPROCESSO'
      'WHERE  CD_UNID_NEG=:CD_UNID_NEG AND'
      '       CD_PRODUTO=:CD_PRODUTO AND'
      
        '       SUBSTRING( NR_PROCESSO,13, 2 ) = SUBSTRING(CAST(DATEPART(' +
        'YEAR,GETDATE()) AS CHAR),3,2) AND'
      '       SUBSTRING( NR_PROCESSO, 5, 2 ) = :CD_PREFIXO')
    Left = 184
    Top = 288
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
        Name = 'CD_PREFIXO'
        ParamType = ptUnknown
      end>
    object qry_ult_processo_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TUSUARIO_HABILITACAO UH'
      'WHERE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39)
    Left = 64
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
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
  end
  object qry_cliente_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT C.CD_CLIENTE, C.CD_UNID_NEG, C.CD_PRODUTO, C.CD_SERVICO, ' +
        'C.CD_PREFIXO, C.IN_ATIVO,'
      '       C.DT_CAPTACAO, C.PZ_PROPOSTA'
      'FROM   TCLIENTE_SERVICO C'
      'WHERE  C.CD_CLIENTE = :CD_CLIENTE AND'
      '       C.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       C.CD_PRODUTO = :CD_PRODUTO AND'
      '       C.CD_SERVICO = :CD_SERVICO')
    Left = 184
    Top = 120
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
      end
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
    object qry_cliente_servico_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_SERVICO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_servico_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_SERVICO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_servico_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_SERVICO.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_servico_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TCLIENTE_SERVICO.CD_SERVICO'
      Size = 3
    end
    object qry_cliente_servico_CD_PREFIXO: TStringField
      FieldName = 'CD_PREFIXO'
      Origin = 'TCLIENTE_SERVICO.CD_PREFIXO'
      Size = 2
    end
    object qry_cliente_servico_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TCLIENTE_SERVICO.IN_ATIVO'
      Size = 1
    end
    object qry_cliente_servico_DT_CAPTACAO: TDateTimeField
      FieldName = 'DT_CAPTACAO'
      Origin = 'TCLIENTE_SERVICO.DT_CAPTACAO'
    end
    object qry_cliente_servico_PZ_PROPOSTA: TIntegerField
      FieldName = 'PZ_PROPOSTA'
      Origin = 'TCLIENTE_SERVICO.PZ_PROPOSTA'
    end
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TSERVICO'
      'WHERE  CD_SERVICO = :CD_SERVICO')
    Left = 64
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
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
  object qry_proc_aux_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_UNID_NEG, CD_PRODUTO, NR_PROCESSO, CD_CLIENTE, CD_SERV' +
        'ICO'
      'FROM  TPROCESSO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 64
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_proc_aux_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_proc_aux_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 2
    end
    object qry_proc_aux_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_proc_aux_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 5
    end
    object qry_proc_aux_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 3
    end
  end
  object sp_atz_evento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_evento'
    Left = 760
    Top = 112
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
        Name = '@cd_evento_txt'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_realizacao'
        ParamType = ptInput
      end>
  end
  object qry_ref_cli_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TREF_CLIENTE WHERE  '
      'CD_REFERENCIA <> '#39#39)
    Left = 296
    Top = 232
    object qry_ref_cli_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TREF_CLIENTE.NR_PROCESSO'
      Size = 18
    end
    object qry_ref_cli_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'TREF_CLIENTE.CD_REFERENCIA'
      Size = 15
    end
    object qry_ref_cli_NR_SEQUENCIA: TStringField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'DBBROKER.TREF_CLIENTE.NR_SEQUENCIA'
      FixedChar = True
      Size = 3
    end
  end
  object qry_ult_ref_cli_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX (NR_SEQUENCIA)  ULTIMO '
      'FROM TREF_CLIENTE'
      'WHERE NR_PROCESSO=:NR_PROCESSO')
    Left = 64
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ult_ref_cli_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TREF_CLIENTE.NR_SEQUENCIA'
      Size = 2
    end
  end
  object qry_doc_instrucao_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TDOCUMENTO_INSTRUCAO WHERE '
      'NR_PROCESSO <> '#39#39'  AND'
      'CD_TIPO_DCTO_INSTR = '#39'01'#39)
    Left = 64
    Top = 456
    object qry_doc_instrucao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDOCUMENTO_INSTRUCAO.NR_PROCESSO'
      Size = 18
    end
    object qry_doc_instrucao_NR_SEQUENCIA: TIntegerField
      FieldName = 'NR_SEQUENCIA'
      Origin = 'TDOCUMENTO_INSTRUCAO.NR_SEQUENCIA'
    end
    object qry_doc_instrucao_CD_TIPO_DCTO_INSTR: TStringField
      FieldName = 'CD_TIPO_DCTO_INSTR'
      Origin = 'TDOCUMENTO_INSTRUCAO.CD_TIPO_DCTO_INSTR'
      Size = 2
    end
    object qry_doc_instrucao_NR_DCTO_INSTRUCAO: TStringField
      FieldName = 'NR_DCTO_INSTRUCAO'
      Origin = 'TDOCUMENTO_INSTRUCAO.NR_DCTO_INSTRUCAO'
      Size = 25
    end
  end
  object sp_ult_sequencia: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_ult_sequencia'
    Left = 760
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@identificador'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@chave'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@nr_sequencia'
        ParamType = ptOutput
      end>
  end
  object qry_ult_processo_por_ano_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_PROCESSO) ULTIMO  FROM TPROCESSO'
      'WHERE CD_UNID_NEG=:CD_UNID_NEG AND '
      'CD_PRODUTO=:CD_PRODUTO AND'
      'SUBSTRING(NR_PROCESSO, 5, 2) = :CD_PREFIXO AND'
      'DT_ABERTURA BETWEEN :INICIO AND :FIM')
    Left = 184
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
        Name = 'CD_PREFIXO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FIM'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
  end
  object qry_parametros_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO_BASF, CD_GRUPO_BSG FROM TPARAMETROS')
    Left = 296
    Top = 288
    object qry_parametros_CD_GRUPO_BASF: TStringField
      FieldName = 'CD_GRUPO_BASF'
      Origin = 'TPARAMETROS.CD_GRUPO_BASF'
      Size = 3
    end
    object qry_parametros_CD_GRUPO_BSG: TStringField
      FieldName = 'CD_GRUPO_BSG'
      Origin = 'TPARAMETROS.CD_GRUPO_BASF'
      Size = 3
    end
  end
  object qry_celula_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT C.CD_CELULA, C.NM_CELULA, C.CD_ANALISTA, U.NM_USUARIO AS ' +
        'NM_ANALISTA'
      'FROM   TCELULA C, TUSUARIO U'
      'WHERE  C.CD_ANALISTA = U.CD_USUARIO AND'
      '       C.CD_CELULA = :CD_CELULA'
      '')
    Left = 296
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CELULA'
        ParamType = ptInput
      end>
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, CD_CELULA, NM_USUARIO'
      'FROM   TUSUARIO (NOLOCK)'
      'WHERE  CD_USUARIO = :CD_USUARIO'
      'AND CD_CARGO <> '#39'040'#39
      '')
    Left = 296
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_CD_CELULA: TStringField
      FieldName = 'CD_CELULA'
      Origin = 'TUSUARIO.CD_CELULA'
      Size = 2
    end
    object qry_usuario_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'TUSUARIO.NM_USUARIO'
      Size = 50
    end
  end
  object qry_exportador_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_EST'
      'WHERE CD_EMPRESA = :CD_EMPRESA'
      '')
    Left = 64
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_exportador_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_EST.NM_EMPRESA'
      Size = 60
    end
    object qry_exportador_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 5
    end
  end
  object qry_via_transp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_VIA_TRANSPORTE'
      'FROM TVIA_TRANSPORTE'
      'WHERE CD_VIA_TRANSPORTE = :CD_VIA_TRANSPORTE'
      '')
    Left = 184
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_VIA_TRANSPORTE'
        ParamType = ptUnknown
      end>
    object qry_via_transp_NM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
      Origin = 'TVIA_TRANSPORTE.NM_VIA_TRANSPORTE'
    end
  end
  object qry_processo_: TQuery
    CachedUpdates = True
    AfterClose = qry_processo_AfterClose
    BeforePost = qry_processo_BeforePost
    AfterPost = qry_processo_AfterPost
    AfterDelete = qry_processo_AfterDelete
    AfterScroll = qry_processo_AfterScroll
    OnCalcFields = qry_processo_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      
        '  NR_PROCESSO, NR_REFERENCIA, CD_UNID_NEG, CD_PRODUTO, CD_CLIENT' +
        'E, CD_SERVICO, CD_USUARIO,'
      
        '  DT_ABERTURA, HR_ABERTURA, DT_PEDIDO, HR_PEDIDO, CD_IMPORTADOR,' +
        ' CD_EXPORTADOR, CD_AREA,'
      
        '  CD_ANALISTA_COMISSARIA, CD_ANALISTA_CLIENTE, CD_INCOTERM, NR_O' +
        'RDEM, NR_VOO, NR_VIAGEM,'
      
        '  CD_LOCAL_DESEMBARQUE, CD_EMBARCACAO, NR_CONHECIMENTO, CD_TP_PE' +
        'DIDO, IN_CANCELADO,'
      
        '  IN_LIBERADO, IN_CONSOLIDADO, IN_SEGURO, IN_URGENTE, IN_DADOS_I' +
        'GUAIS_ITENS'
      'FROM TPROCESSO'
      'WHERE NR_REFERENCIA = :NR_REFERENCIA'
      '  AND CD_UNID_NEG   = :CD_UNID_NEG'
      '  AND CD_PRODUTO    = :CD_PRODUTO'
      '')
    UpdateObject = updProcesso
    Left = 544
    Top = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_REFERENCIA'
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
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.CD_SERVICO'
      Size = 18
    end
    object qry_processo_NR_REFERENCIA: TStringField
      FieldName = 'NR_REFERENCIA'
      Origin = 'TPROCESSO.HR_ENTRADA'
      Size = 18
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 3
    end
    object qry_processo_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TPROCESSO.DT_ABERTURA'
      Size = 4
    end
    object qry_processo_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'TPROCESSO.CD_PRODUTO'
    end
    object qry_processo_HR_ABERTURA: TDateTimeField
      FieldName = 'HR_ABERTURA'
      Origin = 'TPROCESSO.CD_CLIENTE'
    end
    object qry_processo_DT_PEDIDO: TDateTimeField
      FieldName = 'DT_PEDIDO'
      Origin = 'TPROCESSO.NR_REFERENCIA'
      EditMask = '!99/99/0000;1; '
    end
    object qry_processo_HR_PEDIDO: TDateTimeField
      FieldName = 'HR_PEDIDO'
      Origin = 'TPROCESSO.DT_PEDIDO'
      EditMask = '!90:00:00;1; '
    end
    object qry_processo_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPROCESSO.CD_SERVICO'
      Size = 5
    end
    object qry_processo_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPROCESSO.CD_SERVICO'
      Size = 5
    end
    object qry_processo_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 2
    end
    object qry_processo_CD_ANALISTA_COMISSARIA: TStringField
      FieldName = 'CD_ANALISTA_COMISSARIA'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 4
    end
    object qry_processo_CD_ANALISTA_CLIENTE: TStringField
      FieldName = 'CD_ANALISTA_CLIENTE'
      Origin = 'TPROCESSO.CD_ANALISTA_CLIENTE'
      Size = 4
    end
    object qry_processo_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 3
    end
    object qry_processo_NR_ORDEM: TStringField
      FieldName = 'NR_ORDEM'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 30
    end
    object qry_processo_NR_VOO: TStringField
      FieldName = 'NR_VOO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_processo_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      EditMask = '00/00;0;_'
      Size = 15
    end
    object qry_processo_CD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'TPROCESSO.CD_LOCAL_DESEMBARQUE'
      Size = 4
    end
    object qry_processo_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'TPROCESSO.DT_ABERTURA'
      Size = 4
    end
    object qry_processo_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 30
    end
    object qry_processo_CD_TP_PEDIDO: TStringField
      FieldName = 'CD_TP_PEDIDO'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 3
    end
    object qry_processo_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TPROCESSO.CD_SERVICO'
      Size = 1
    end
    object qry_processo_IN_CONSOLIDADO: TStringField
      FieldName = 'IN_CONSOLIDADO'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 1
    end
    object qry_processo_IN_SEGURO: TStringField
      FieldName = 'IN_SEGURO'
      Origin = 'TPROCESSO.DT_ABERTURA'
      Size = 1
    end
    object qry_processo_IN_URGENTE: TStringField
      FieldName = 'IN_URGENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 1
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 1
    end
    object qry_processo_IN_DADOS_IGUAIS_ITENS: TStringField
      FieldName = 'IN_DADOS_IGUAIS_ITENS'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 1
    end
    object qry_processo_calcCancelado: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCancelado'
      Size = 3
      Calculated = True
    end
    object qry_processo_calcNrProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNrProcesso'
      Size = 25
      Calculated = True
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    OnStateChange = ds_processoStateChange
    OnDataChange = ds_processoDataChange
    Left = 440
    Top = 400
  end
  object qry_yes_no: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO'
      'FROM   TYES_NO')
    Left = 544
    Top = 8
    object qry_yes_noCD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Origin = 'TYES_NO.CD_YESNO'
      Size = 1
    end
    object qry_yes_noTX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Origin = 'TYES_NO.TX_YESNO'
      Size = 3
    end
  end
  object qry_tp_pedido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PEDIDO, NM_PEDIDO'
      'FROM   TTP_PEDIDO ( NOLOCK )')
    Left = 544
    Top = 176
  end
  object qry_incoterm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM   TINCOTERMS_VENDA'
      '')
    Left = 544
    Top = 232
  end
  object qry_cliente_contato_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, CD_CONTATO, NM_CONTA' +
        'TO'
      'FROM   TCLIENTE_CONTATO'
      'WHERE  CD_CLIENTE = :CD_CLIENTE'
      '       AND CD_UNID_NEG = :CD_UNID_NEG'
      '      AND  CD_PRODUTO = :CD_PRODUTO'
      '      AND CD_CONTATO = :CD_CONTATO'
      '')
    Left = 64
    Top = 400
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
      end
      item
        DataType = ftString
        Name = 'CD_CONTATO'
        ParamType = ptUnknown
      end>
    object qry_cliente_contato_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'TCLIENTE_CONTATO.NM_CONTATO'
      Size = 50
    end
    object qry_cliente_contato_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_CONTATO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_contato_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_CONTATO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_contato_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_CONTATO.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_contato_CD_CONTATO: TStringField
      FieldName = 'CD_CONTATO'
      Origin = 'TCLIENTE_CONTATO.CD_CONTATO'
      Size = 3
    end
  end
  object qry_porto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM TLOCAL_EMBARQUE'
      'WHERE CODIGO = :CODIGO')
    Left = 184
    Top = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_porto_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TLOCAL_EMBARQUE.CODIGO'
      EditMask = '!9999;1; '
      Size = 4
    end
    object qry_porto_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TLOCAL_EMBARQUE.DESCRICAO'
      Size = 50
    end
  end
  object qry_navio_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMBARCACAO, NM_EMBARCACAO'
      'FROM TEMBARCACAO'
      'WHERE CD_EMBARCACAO = :CD_EMBARCACAO')
    Left = 296
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMBARCACAO'
        ParamType = ptUnknown
      end>
    object qry_navio_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'TEMBARCACAO.CD_EMBARCACAO'
      EditMask = '!9999;1; '
      Size = 4
    end
    object qry_navio_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      Origin = 'TEMBARCACAO.NM_EMBARCACAO'
      Size = 40
    end
  end
  object qry_viagem_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_VIAGEM, CD_LOCAL'
      '  FROM TVIAGEM ( NOLOCK )'
      ' WHERE CD_UNID_NEG   = :CD_UNID_NEG'
      '   AND CD_PRODUTO    = :CD_PRODUTO'
      '   AND CD_EMBARCACAO = :CD_EMBARCACAO'
      '   AND CD_LOCAL      = :CD_LOCAL'
      '   AND NR_VIAGEM     = :NR_VIAGEM'
      '')
    Left = 296
    Top = 400
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
        Name = 'CD_EMBARCACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_LOCAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_VIAGEM'
        ParamType = ptInput
      end>
    object qry_viagem_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'TVIAGEM.NR_VIAGEM'
      EditMask = '00/00;0;_'
      Size = 4
    end
  end
  object dsTipoPedido: TDataSource
    DataSet = qry_tp_pedido_
    Left = 440
    Top = 176
  end
  object dsIncoterm: TDataSource
    DataSet = qry_incoterm_
    Left = 440
    Top = 232
  end
  object qry_nec_li_: TQuery
    BeforePost = qry_nec_li_BeforePost
    AfterScroll = qry_nec_li_AfterScroll
    OnCalcFields = qry_nec_li_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_REFERENCIA, NR_ITEM_CLIENTE, CD_MERCADORI' +
        'A, CD_NCM_SH, IN_NECESSIDADE_LI'
      '  FROM TGESTAO_PO_NEC_LI'
      ' WHERE NR_PROCESSO   = :NR_PROCESSO'
      '   AND NR_REFERENCIA = :NR_REFERENCIA'
      ' ORDER BY NR_ITEM_CLIENTE')
    Left = 544
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'NR_REFERENCIA'
        ParamType = ptInput
        Size = 18
      end>
    object qry_nec_li_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TGESTAO_PO_NEC_LI.NR_PROCESSO'
      Size = 18
    end
    object qry_nec_li_NR_REFERENCIA: TStringField
      FieldName = 'NR_REFERENCIA'
      Origin = 'TGESTAO_PO_NEC_LI.NR_REFERENCIA'
      Size = 18
    end
    object qry_nec_li_NR_ITEM_CLIENTE: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 3
      FieldName = 'NR_ITEM_CLIENTE'
      Origin = 'TGESTAO_PO_NEC_LI.NR_ITEM_CLIENTE'
      Size = 3
    end
    object qry_nec_li_CD_MERCADORIA: TStringField
      DisplayLabel = 'Part Number'
      FieldName = 'CD_MERCADORIA'
      Origin = 'TGESTAO_PO_NEC_LI.CD_MERCADORIA'
      Size = 30
    end
    object qry_nec_li_CD_NCM_SH: TStringField
      DisplayLabel = 'NCM'
      FieldName = 'CD_NCM_SH'
      Origin = 'TGESTAO_PO_NEC_LI.CD_NCM_SH'
      Size = 11
    end
    object qry_nec_li_IN_NECESSIDADE_LI: TStringField
      FieldName = 'IN_NECESSIDADE_LI'
      Origin = 'TGESTAO_PO_NEC_LI.IN_NECESSIDADE_LI'
      Size = 1
    end
    object qry_nec_li_calc_Nec_LI: TStringField
      DisplayLabel = 'Incide L.I.'
      FieldKind = fkCalculated
      FieldName = 'calc_NEC_LI'
      Size = 1
      Calculated = True
    end
    object qry_nec_li_calcApMercadoria: TStringField
      DisplayLabel = 'Mercadoria'
      FieldKind = fkCalculated
      FieldName = 'calc_AP_MERCADORIA'
      Size = 25
      Calculated = True
    end
  end
  object ds_nec_li: TDataSource
    DataSet = qry_nec_li_
    OnStateChange = ds_nec_liStateChange
    Left = 440
    Top = 64
  end
  object qry_mercadoria_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_MERCADORIA, CD_NCM_SH, IN_NECESSITA_LI'
      'FROM   TMERCADORIA'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA')
    Left = 544
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_mercadoria_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 30
    end
    object qry_mercadoria_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TMERCADORIA.CD_NCM_SH'
      Size = 11
    end
    object qry_mercadoria_IN_NECESSITA_LI: TBooleanField
      FieldName = 'IN_NECESSITA_LI'
      Origin = 'TMERCADORIA.IN_NECESSITA_LI'
    end
  end
  object ds_mercadoria: TDataSource
    DataSet = qry_mercadoria_
    Left = 440
    Top = 120
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO'
      'FROM   TEMPRESA_NAC'
      'WHERE  CD_EMPRESA = :CD_EMPRESA')
    Left = 296
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object updProcesso: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_REFERENCIA = :NR_REFERENCIA,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  DT_ABERTURA = :DT_ABERTURA,'
      '  HR_ABERTURA = :HR_ABERTURA,'
      '  DT_PEDIDO = :DT_PEDIDO,'
      '  HR_PEDIDO = :HR_PEDIDO,'
      '  CD_IMPORTADOR = :CD_IMPORTADOR,'
      '  CD_EXPORTADOR = :CD_EXPORTADOR,'
      '  CD_AREA = :CD_AREA,'
      '  CD_ANALISTA_COMISSARIA = :CD_ANALISTA_COMISSARIA,'
      '  CD_ANALISTA_CLIENTE = :CD_ANALISTA_CLIENTE,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  NR_ORDEM = :NR_ORDEM,'
      '  NR_VOO = :NR_VOO,'
      '  NR_VIAGEM = :NR_VIAGEM,'
      '  CD_LOCAL_DESEMBARQUE = :CD_LOCAL_DESEMBARQUE,'
      '  CD_EMBARCACAO = :CD_EMBARCACAO,'
      '  NR_CONHECIMENTO = :NR_CONHECIMENTO,'
      '  CD_TP_PEDIDO = :CD_TP_PEDIDO,'
      '  IN_CANCELADO = :IN_CANCELADO,'
      '  IN_LIBERADO = :IN_LIBERADO,'
      '  IN_CONSOLIDADO = :IN_CONSOLIDADO,'
      '  IN_SEGURO = :IN_SEGURO,'
      '  IN_URGENTE = :IN_URGENTE,'
      '  IN_DADOS_IGUAIS_ITENS = :IN_DADOS_IGUAIS_ITENS'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPROCESSO'
      '  (NR_PROCESSO, NR_REFERENCIA, CD_UNID_NEG, CD_PRODUTO, '
      'CD_CLIENTE, CD_SERVICO, '
      '   CD_USUARIO, DT_ABERTURA, HR_ABERTURA, DT_PEDIDO, HR_PEDIDO, '
      'CD_IMPORTADOR, '
      '   CD_EXPORTADOR, CD_AREA, CD_ANALISTA_COMISSARIA, '
      'CD_ANALISTA_CLIENTE, '
      '   CD_INCOTERM, NR_ORDEM, NR_VOO, NR_VIAGEM, '
      'CD_LOCAL_DESEMBARQUE, CD_EMBARCACAO, '
      '   NR_CONHECIMENTO, CD_TP_PEDIDO, IN_CANCELADO, IN_LIBERADO, '
      'IN_CONSOLIDADO, '
      '   IN_SEGURO, IN_URGENTE, IN_DADOS_IGUAIS_ITENS)'
      'values'
      '  (:NR_PROCESSO, :NR_REFERENCIA, :CD_UNID_NEG, :CD_PRODUTO, '
      ':CD_CLIENTE, '
      '   :CD_SERVICO, :CD_USUARIO, :DT_ABERTURA, :HR_ABERTURA, '
      ':DT_PEDIDO, :HR_PEDIDO, '
      '   :CD_IMPORTADOR, :CD_EXPORTADOR, :CD_AREA, '
      ':CD_ANALISTA_COMISSARIA, :CD_ANALISTA_CLIENTE, '
      '   :CD_INCOTERM, :NR_ORDEM, :NR_VOO, :NR_VIAGEM, '
      ':CD_LOCAL_DESEMBARQUE, '
      
        '   :CD_EMBARCACAO, :NR_CONHECIMENTO, :CD_TP_PEDIDO, :IN_CANCELAD' +
        'O, '
      ':IN_LIBERADO, '
      
        '   :IN_CONSOLIDADO, :IN_SEGURO, :IN_URGENTE, :IN_DADOS_IGUAIS_IT' +
        'ENS)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 632
    Top = 400
  end
  object sp_flp_po: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_flp_po'
    Left = 760
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_servico'
        ParamType = ptInput
      end>
  end
  object sp_flp_po_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_flp_po_item'
    Left = 760
    Top = 56
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
        Name = '@nr_item'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_item_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_servico'
        ParamType = ptInput
      end>
  end
  object qry_po_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MERCADORIA, TX_MERCADORIA, QT_INICIAL, CD_MERC_FORNEC'
      'FROM TPO_ITEM ( NOLOCK )'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'AND NR_ITEM = :NR_ITEM')
    Left = 544
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptUnknown
      end>
    object qry_po_item_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TPO_ITEM.CD_MERCADORIA'
      Size = 30
    end
    object qry_po_item_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TPO_ITEM.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_po_item_QT_INICIAL: TFloatField
      FieldName = 'QT_INICIAL'
      Origin = 'TPO_ITEM.QT_INICIAL'
    end
    object qry_po_item_CD_MERC_FORNEC: TStringField
      FieldName = 'CD_MERC_FORNEC'
      Origin = 'DBBROKER.TPO_ITEM.CD_MERC_FORNEC'
      FixedChar = True
      Size = 15
    end
  end
  object ds_po: TDataSource
    DataSet = qry_po_
    Left = 440
    Top = 288
  end
  object qry_po_: TQuery
    CachedUpdates = True
    AfterPost = qry_po_AfterPost
    AfterDelete = qry_po_AfterDelete
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TPO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 544
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_po_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
    object qry_po_DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
      Origin = 'TPO.DT_ABERTURA'
    end
    object qry_po_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 3
    end
    object qry_po_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 15
    end
    object qry_po_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPO.NR_IDENT_USUARIO'
      Size = 5
    end
    object qry_po_CD_CONSIGNATARIO: TStringField
      FieldName = 'CD_CONSIGNATARIO'
      Origin = 'TPO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_po_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TPO.CD_CONSIGNATARIO'
      Size = 5
    end
    object qry_po_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPO.CD_FABRICANTE'
      Size = 5
    end
    object qry_po_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TPO.CD_EXPORTADOR'
      Size = 2
    end
    object qry_po_CD_REPRESENTANTE: TStringField
      FieldName = 'CD_REPRESENTANTE'
      Origin = 'TPO.CD_VIA_TRANSP'
      Size = 5
    end
    object qry_po_CD_MOD_PAGAMENTO: TStringField
      FieldName = 'CD_MOD_PAGAMENTO'
      Origin = 'TPO.CD_REPRESENTANTE'
      Size = 2
    end
    object qry_po_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TPO.CD_MOD_PAGAMENTO'
      Size = 3
    end
    object qry_po_CD_REGIME_TRIB: TStringField
      FieldName = 'CD_REGIME_TRIB'
      Origin = 'TPO.CD_PAIS_ORIGEM'
      Size = 1
    end
    object qry_po_CD_PAIS_PROCEDENCIA: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'TPO.CD_REGIME_TRIB'
      Size = 3
    end
    object qry_po_CD_MOEDA_NEG: TStringField
      FieldName = 'CD_MOEDA_NEG'
      Origin = 'TPO.CD_PAIS_PROCEDENCIA'
      Size = 3
    end
    object qry_po_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TPO.CD_MOEDA_NEG'
      Size = 3
    end
    object qry_po_CD_TP_DECLARACAO: TStringField
      FieldName = 'CD_TP_DECLARACAO'
      Origin = 'TPO.CD_PAIS_AQUISICAO'
      Size = 2
    end
    object qry_po_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TPO.CD_TP_DECLARACAO'
      Size = 7
    end
    object qry_po_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TPO.CD_URF_DESPACHO'
      Size = 3
    end
    object qry_po_CD_TRANSP_INTERN: TStringField
      FieldName = 'CD_TRANSP_INTERN'
      Origin = 'TPO.CD_INCOTERM'
      Size = 4
    end
    object qry_po_CD_BANDEIRA_VEIC: TStringField
      FieldName = 'CD_BANDEIRA_VEIC'
      Origin = 'TPO.CD_TRANSP_INTERN'
      Size = 3
    end
    object qry_po_CD_SETOR_ARMAZENAGEM: TStringField
      FieldName = 'CD_SETOR_ARMAZENAGEM'
      Origin = 'TPO.CD_BANDEIRA_VEIC'
      Size = 3
    end
    object qry_po_CD_AGENTE_CARGA: TStringField
      FieldName = 'CD_AGENTE_CARGA'
      Origin = 'TPO.CD_LOCAL_EMBARQUE'
      Size = 4
    end
    object qry_po_CD_URF_ENTRADA: TStringField
      FieldName = 'CD_URF_ENTRADA'
      Origin = 'TPO.CD_AGENTE_CARGA'
      Size = 7
    end
    object qry_po_CD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Origin = 'TPO.CD_URF_ENTRADA'
      Size = 7
    end
    object qry_po_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TPO.CD_RECINTO_ALFAND'
      Size = 3
    end
    object qry_po_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'TPO.CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_po_CD_MOEDA_CARGA: TStringField
      FieldName = 'CD_MOEDA_CARGA'
      Origin = 'TPO.CD_MOEDA_SEGURO'
      Size = 3
    end
    object qry_po_CD_LOCAL_INCOTERM: TStringField
      FieldName = 'CD_LOCAL_INCOTERM'
      Origin = 'TPO.CD_MOEDA_CARGA'
      Size = 10
    end
    object qry_po_CD_TX_JUROS: TStringField
      FieldName = 'CD_TX_JUROS'
      Origin = 'TPO.CD_LOCAL_INCOTERM'
      Size = 4
    end
    object qry_po_CD_INSTIT_FINANC: TStringField
      FieldName = 'CD_INSTIT_FINANC'
      Origin = 'TPO.CD_TX_JUROS'
      Size = 2
    end
    object qry_po_CD_MOTIVO_CAMBIO_SEM_COBERT: TStringField
      FieldName = 'CD_MOTIVO_CAMBIO_SEM_COBERT'
      Origin = 'TPO.CD_INSTIT_FINANC'
      Size = 2
    end
    object qry_po_CD_BARRA: TStringField
      FieldName = 'CD_BARRA'
      Origin = 'TPO.CD_MOTIVO_CAMBIO_SEM_COBERT'
      Size = 11
    end
    object qry_po_CD_MET_VALORACAO_ADUAN: TStringField
      FieldName = 'CD_MET_VALORACAO_ADUAN'
      Origin = 'TPO.CD_BARRA'
      Size = 2
    end
    object qry_po_DT_EMISSAO_DOC_CARGA: TDateTimeField
      FieldName = 'DT_EMISSAO_DOC_CARGA'
      Origin = 'TPO.CD_MET_VALORACAO_ADUAN'
    end
    object qry_po_DT_CHEGADA_CARGA: TDateTimeField
      FieldName = 'DT_CHEGADA_CARGA'
      Origin = 'TPO.DT_ABERTURA'
    end
    object qry_po_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TPO.DT_EMISSAO_DOC_CARGA'
    end
    object qry_po_IN_APLICACAO_MERC: TStringField
      FieldName = 'IN_APLICACAO_MERC'
      Origin = 'TPO.DT_CHEGADA_CARGA'
      Size = 1
    end
    object qry_po_IN_COMISSAO: TBooleanField
      FieldName = 'IN_COMISSAO'
      Origin = 'TPO.DT_FATURA'
    end
    object qry_po_IN_DESCONTO: TBooleanField
      FieldName = 'IN_DESCONTO'
      Origin = 'TPO.IN_APLICACAO_MERC'
    end
    object qry_po_IN_TP_COMISSAO: TStringField
      FieldName = 'IN_TP_COMISSAO'
      Origin = 'TPO.IN_COMISSAO'
      Size = 1
    end
    object qry_po_IN_TP_DESCONTO: TStringField
      FieldName = 'IN_TP_DESCONTO'
      Origin = 'TPO.IN_DESCONTO'
      Size = 1
    end
    object qry_po_IN_INDICADOR_CONSIG_IMPORT: TBooleanField
      FieldName = 'IN_INDICADOR_CONSIG_IMPORT'
      Origin = 'TPO.IN_TP_COMISSAO'
    end
    object qry_po_IN_INDICADOR_PROC: TStringField
      FieldName = 'IN_INDICADOR_PROC'
      Origin = 'TPO.IN_TP_DESCONTO'
      Size = 1
    end
    object qry_po_IN_VINC_IMPO_EXPO: TStringField
      FieldName = 'IN_VINC_IMPO_EXPO'
      Origin = 'TPO.IN_INDICADOR_CONSIG_IMPORT'
      Size = 1
    end
    object qry_po_IN_COND_MERCADORIA: TStringField
      FieldName = 'IN_COND_MERCADORIA'
      Origin = 'TPO.IN_INDICADOR_PROC'
      Size = 1
    end
    object qry_po_IN_FABR_EXPOR_IMP: TStringField
      FieldName = 'IN_FABR_EXPOR_IMP'
      Origin = 'TPO.IN_VINC_IMPO_EXPO'
      Size = 1
    end
    object qry_po_IN_INDIC_MULTMODAL: TBooleanField
      FieldName = 'IN_INDIC_MULTMODAL'
      Origin = 'TPO.IN_COND_MERCADORIA'
    end
    object qry_po_IN_FUNDAP: TBooleanField
      FieldName = 'IN_FUNDAP'
      Origin = 'TPO.IN_FABR_EXPOR_IMP'
    end
    object qry_po_IN_UTILIZ_CARGA: TStringField
      FieldName = 'IN_UTILIZ_CARGA'
      Origin = 'TPO.IN_INDIC_MULTMODAL'
      Size = 1
    end
    object qry_po_IN_INDIC_TX_JUROS: TBooleanField
      FieldName = 'IN_INDIC_TX_JUROS'
      Origin = 'TPO.IN_FUNDAP'
    end
    object qry_po_IN_SEGURO: TStringField
      FieldName = 'IN_SEGURO'
      Origin = 'TPO.IN_UTILIZ_CARGA'
      Size = 1
    end
    object qry_po_NR_PLACA_VEICULO: TStringField
      FieldName = 'NR_PLACA_VEICULO'
      Origin = 'TPO.IN_INDIC_TX_JUROS'
      Size = 15
    end
    object qry_po_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'TPO.IN_SEGURO'
      Size = 15
    end
    object qry_po_NR_DOC_MASTER: TStringField
      FieldName = 'NR_DOC_MASTER'
      Origin = 'TPO.NR_PLACA_VEICULO'
      Size = 30
    end
    object qry_po_NR_DOC_HOUSE: TStringField
      FieldName = 'NR_DOC_HOUSE'
      Origin = 'TPO.NR_MANIFESTO'
      Size = 30
    end
    object qry_po_NR_BACEN: TStringField
      FieldName = 'NR_BACEN'
      Origin = 'TPO.NR_DOC_MASTER'
      Size = 8
    end
    object qry_po_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TPO.NR_DOC_HOUSE'
      Size = 15
    end
    object qry_po_NM_IDENT_CRT: TStringField
      FieldName = 'NM_IDENT_CRT'
      Origin = 'TPO.NR_BACEN'
      Size = 11
    end
    object qry_po_NM_VEICULO: TStringField
      FieldName = 'NM_VEICULO'
      Origin = 'TPO.NR_FATURA'
      Size = 30
    end
    object qry_po_PC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'TPO.NM_IDENT_CRT'
    end
    object qry_po_PC_DESCONTO: TFloatField
      FieldName = 'PC_DESCONTO'
      Origin = 'TPO.NM_VEICULO'
    end
    object qry_po_PC_SEGURO: TFloatField
      FieldName = 'PC_SEGURO'
      Origin = 'TPO.PC_COMISSAO'
    end
    object qry_po_PC_COMISSAO_AGENTE: TFloatField
      FieldName = 'PC_COMISSAO_AGENTE'
      Origin = 'TPO.PC_DESCONTO'
    end
    object qry_po_PL_PO: TFloatField
      FieldName = 'PL_PO'
      Origin = 'TPO.PC_SEGURO'
    end
    object qry_po_PB_PO: TFloatField
      FieldName = 'PB_PO'
      Origin = 'TPO.PC_COMISSAO_AGENTE'
    end
    object qry_po_QT_TOTAL_PESO: TFloatField
      FieldName = 'QT_TOTAL_PESO'
      Origin = 'TPO.PL_PO'
    end
    object qry_po_QT_PORC_ICMS: TFloatField
      FieldName = 'QT_PORC_ICMS'
      Origin = 'TPO.PB_PO'
    end
    object qry_po_QT_TOTAL_ITENS: TStringField
      FieldName = 'QT_TOTAL_ITENS'
      Origin = 'TPO.QT_TOTAL_PESO'
      Size = 3
    end
    object qry_po_QT_PORC_RED_ICMS: TFloatField
      FieldName = 'QT_PORC_RED_ICMS'
      Origin = 'TPO.QT_PORC_ICMS'
    end
    object qry_po_QT_PERIODICIDADE: TStringField
      FieldName = 'QT_PERIODICIDADE'
      Origin = 'TPO.QT_TOTAL_ITENS'
      Size = 3
    end
    object qry_po_TP_COBERT_CAMBIO: TStringField
      FieldName = 'TP_COBERT_CAMBIO'
      Origin = 'TPO.QT_PORC_RED_ICMS'
      Size = 1
    end
    object qry_po_TP_CAMBIO: TBooleanField
      FieldName = 'TP_CAMBIO'
      Origin = 'TPO.QT_PERIODICIDADE'
    end
    object qry_po_TP_DOC_CARGA: TStringField
      FieldName = 'TP_DOC_CARGA'
      Origin = 'TPO.TP_COBERT_CAMBIO'
      Size = 2
    end
    object qry_po_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'TPO.TP_CAMBIO'
      Size = 1
    end
    object qry_po_TP_SEGURO: TStringField
      FieldName = 'TP_SEGURO'
      Origin = 'TPO.TP_DOC_CARGA'
      Size = 1
    end
    object qry_po_TP_MOD_DESPACHO: TStringField
      FieldName = 'TP_MOD_DESPACHO'
      Origin = 'TPO.TP_FRETE'
      Size = 1
    end
    object qry_po_TP_MANIFESTO: TStringField
      FieldName = 'TP_MANIFESTO'
      Origin = 'TPO.TP_SEGURO'
      Size = 1
    end
    object qry_po_TX_JUROS: TFloatField
      FieldName = 'TX_JUROS'
      Origin = 'TPO.TP_MOD_DESPACHO'
    end
    object qry_po_TX_OBSERVACAO: TMemoField
      FieldName = 'TX_OBSERVACAO'
      Origin = 'TPO.TP_MANIFESTO'
      BlobType = ftMemo
    end
    object qry_po_VL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
      Origin = 'TPO.TX_JUROS'
    end
    object qry_po_VL_CARGA: TFloatField
      FieldName = 'VL_CARGA'
      Origin = 'TPO.TX_OBSERVACAO'
    end
    object qry_po_VL_CAMBIO: TFloatField
      FieldName = 'VL_CAMBIO'
      Origin = 'TPO.VL_COMISSAO'
    end
    object qry_po_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TPO.VL_CARGA'
    end
    object qry_po_VL_FRETE_PREPAID: TFloatField
      FieldName = 'VL_FRETE_PREPAID'
      Origin = 'TPO.VL_CAMBIO'
    end
    object qry_po_VL_FRETE_COLLECT: TFloatField
      FieldName = 'VL_FRETE_COLLECT'
      Origin = 'TPO.VL_DESCONTO'
    end
    object qry_po_VL_FRETE_TERRIT_NAC: TFloatField
      FieldName = 'VL_FRETE_TERRIT_NAC'
      Origin = 'TPO.VL_FRETE_PREPAID'
    end
    object qry_po_VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'TPO.VL_FRETE_COLLECT'
    end
    object qry_po_VL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      Origin = 'TPO.VL_FRETE_TERRIT_NAC'
    end
    object qry_po_VL_TOTAL_PARCELA: TFloatField
      FieldName = 'VL_TOTAL_PARCELA'
      Origin = 'TPO.VL_SEGURO'
    end
    object qry_po_VL_PAGTO_ANTECIPADO: TFloatField
      FieldName = 'VL_PAGTO_ANTECIPADO'
      Origin = 'TPO.VL_TOTAL'
    end
    object qry_po_VL_PAGTO_VISTA: TFloatField
      FieldName = 'VL_PAGTO_VISTA'
      Origin = 'TPO.VL_TOTAL_PARCELA'
    end
    object qry_po_VL_PERIODIC_MENSAL: TFloatField
      FieldName = 'VL_PERIODIC_MENSAL'
      Origin = 'TPO.VL_PAGTO_ANTECIPADO'
    end
    object qry_po_VL_DESPESAS: TFloatField
      FieldName = 'VL_DESPESAS'
      Origin = 'TPO.VL_PAGTO_VISTA'
    end
    object qry_po_VL_DESCONTOS: TFloatField
      FieldName = 'VL_DESCONTOS'
      Origin = 'TPO.VL_PERIODIC_MENSAL'
    end
    object qry_po_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'TPO.VL_DESPESAS'
      Size = 1
    end
    object qry_po_IN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'TPO.VL_DESCONTOS'
      Size = 1
    end
    object qry_po_IN_IND_COND_MERC: TBooleanField
      FieldName = 'IN_IND_COND_MERC'
      Origin = 'TPO.IN_SELECIONADO'
    end
    object qry_po_IN_IND_CAMBIO_ITENS: TBooleanField
      FieldName = 'IN_IND_CAMBIO_ITENS'
      Origin = 'TPO.IN_MONTADO'
    end
    object qry_po_NR_PARCELAS: TStringField
      FieldName = 'NR_PARCELAS'
      Origin = 'TPO.IN_IND_COND_MERC'
      Size = 3
    end
    object qry_po_IN_PERIODICIDADE: TStringField
      FieldName = 'IN_PERIODICIDADE'
      Origin = 'TPO.IN_IND_CAMBIO_ITENS'
      Size = 1
    end
    object qry_po_QT_TOTAL_DISPONIVEL: TFloatField
      FieldName = 'QT_TOTAL_DISPONIVEL'
      Origin = 'TPO.NR_PARCELAS'
    end
    object qry_po_CD_USUARIO_MONTA: TStringField
      FieldName = 'CD_USUARIO_MONTA'
      Origin = 'TPO.IN_PERIODICIDADE'
      Size = 4
    end
    object qry_po_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TPO.QT_TOTAL_DISPONIVEL'
      Size = 2
    end
    object qry_po_CD_COMPRADOR: TStringField
      FieldName = 'CD_COMPRADOR'
      Origin = 'TPO.CD_USUARIO_MONTA'
      Size = 4
    end
    object qry_po_CD_TERMO_PAGTO: TStringField
      FieldName = 'CD_TERMO_PAGTO'
      Origin = 'TPO.CD_AREA'
      Size = 6
    end
    object qry_po_DT_NECESSIDADE: TDateTimeField
      FieldName = 'DT_NECESSIDADE'
      Origin = 'TPO.CD_COMPRADOR'
    end
    object qry_po_CD_TIPO_FRETE: TStringField
      FieldName = 'CD_TIPO_FRETE'
      Origin = 'TPO.CD_TERMO_PAGTO'
      Size = 1
    end
    object qry_po_CD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'TPO.DT_NECESSIDADE'
      Size = 4
    end
    object qry_po_IN_ENTREPOSTO: TStringField
      FieldName = 'IN_ENTREPOSTO'
      Origin = 'TPO.CD_TIPO_FRETE'
      Size = 1
    end
    object qry_po_IN_FATURADO: TStringField
      FieldName = 'IN_FATURADO'
      Origin = 'TPO.CD_LOCAL_DESEMBARQUE'
      Size = 1
    end
    object qry_po_IN_IMEDIATO: TStringField
      FieldName = 'IN_IMEDIATO'
      Origin = 'TPO.IN_ENTREPOSTO'
      Size = 1
    end
    object qry_po_VL_FRETE_INTERNO: TFloatField
      FieldName = 'VL_FRETE_INTERNO'
      Origin = 'TPO.IN_FATURADO'
    end
    object qry_po_VL_EMBALAGEM: TFloatField
      FieldName = 'VL_EMBALAGEM'
      Origin = 'TPO.IN_IMEDIATO'
    end
    object qry_po_TX_OBS_INTERNO: TMemoField
      FieldName = 'TX_OBS_INTERNO'
      Origin = 'TPO.VL_FRETE_INTERNO'
      BlobType = ftMemo
    end
    object qry_po_VL_PB_EMBALAGEM: TFloatField
      FieldName = 'VL_PB_EMBALAGEM'
      Origin = 'TPO.VL_EMBALAGEM'
    end
    object qry_po_VL_PL_EMBALAGEM: TFloatField
      FieldName = 'VL_PL_EMBALAGEM'
      Origin = 'TPO.TX_OBS_INTERNO'
    end
    object qry_po_NR_DA: TStringField
      FieldName = 'NR_DA'
      Origin = 'TPO.VL_PB_EMBALAGEM'
      Size = 10
    end
    object qry_po_TX_VOLUMES: TMemoField
      FieldName = 'TX_VOLUMES'
      Origin = 'TPO.VL_PL_EMBALAGEM'
      BlobType = ftMemo
    end
    object qry_po_TX_INF_ENTREPOSTO: TMemoField
      FieldName = 'TX_INF_ENTREPOSTO'
      Origin = 'TPO.NR_DA'
      BlobType = ftMemo
    end
    object qry_po_TP_NEGOCIACAO: TStringField
      FieldName = 'TP_NEGOCIACAO'
      Origin = 'TPO.CD_SERVICO'
      Size = 1
    end
    object qry_po_NR_ARTICULO: TStringField
      FieldName = 'NR_ARTICULO'
      Origin = 'TPO.TX_VOLUMES'
      Size = 15
    end
    object qry_po_NR_ORDEM: TStringField
      FieldName = 'NR_ORDEM'
      Origin = 'TPO.TX_INF_ENTREPOSTO'
      Size = 18
    end
    object qry_po_CD_USUARIO_INT: TStringField
      FieldName = 'CD_USUARIO_INT'
      Origin = 'TPO.TP_NEGOCIACAO'
      Size = 4
    end
    object qry_po_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'TPO.NR_ARTICULO'
      Size = 4
    end
    object qry_po_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TPO.NR_ORDEM'
      Size = 5
    end
    object qry_po_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TPO.CD_USUARIO_INT'
      Size = 4
    end
    object qry_po_TX_OBS: TMemoField
      FieldName = 'TX_OBS'
      Origin = 'TPO.CD_AGENTE'
      BlobType = ftMemo
    end
    object qry_po_CD_CANAL: TStringField
      FieldName = 'CD_CANAL'
      Origin = 'TPO.CD_BANCO'
      Size = 1
    end
    object qry_po_IN_CARGA_PERIGOSA: TStringField
      FieldName = 'IN_CARGA_PERIGOSA'
      Origin = 'TPO.CD_USUARIO'
      Size = 1
    end
    object qry_po_VL_M3: TFloatField
      FieldName = 'VL_M3'
      Origin = 'TPO.TX_OBS'
    end
    object qry_po_NM_EMPRESA_BASF: TStringField
      FieldName = 'NM_EMPRESA_BASF'
      Origin = 'TPO.CD_CANAL'
      Size = 4
    end
  end
  object updPO: TUpdateSQL
    ModifySQL.Strings = (
      'update TPO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  DT_ABERTURA = :DT_ABERTURA,'
      '  CD_SERVICO = :CD_SERVICO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPO'
      '  (NR_PROCESSO, DT_ABERTURA, CD_SERVICO)'
      'values'
      '  (:NR_PROCESSO, :DT_ABERTURA, :CD_SERVICO)')
    DeleteSQL.Strings = (
      'delete from TPO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 632
    Top = 288
  end
  object sp_atz_ev_flp_po: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_ev_flp_po'
    Left = 760
    Top = 168
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
      end>
  end
  object sp_atz_ev_flp_po_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_ev_flp_po_item'
    Left = 760
    Top = 216
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
        Name = '@nr_item'
        ParamType = ptInput
      end>
  end
  object ds_gestao_item: TDataSource
    DataSet = qry_gestao_item_
    OnStateChange = ds_gestao_itemStateChange
    Left = 440
    Top = 456
  end
  object qry_gestao_item_: TQuery
    CachedUpdates = True
    AfterPost = qry_gestao_item_AfterPost
    AfterDelete = qry_gestao_item_AfterDelete
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT POI.TX_MERCADORIA, '
      '       POI.CD_MERCADORIA, '
      '       POI.QT_INICIAL,'
      
        '       POI.CD_AREA + '#39' - '#39' + (SELECT NM_AREA FROM TAREA WHERE CD' +
        '_AREA = POI.CD_AREA) AS NM_AREA,'
      '       GI.NR_PROCESSO,'
      '       GI.NR_ITEM,'
      '       GI.CD_LOCAL_DESEMBARQUE,'
      '       GI.CD_EMBARCACAO,'
      '       GI.NR_VIAGEM,'
      '       GI.NR_VOO,'
      '       GI.IN_CONSOLIDADO,'
      '       GI.NR_CONHECIMENTO,'
      '       GI.IN_URGENTE,'
      '       GI.IN_SEGURO'
      'FROM   TGESTAO_ITEM GI,'
      '       TPO_ITEM POI'
      'WHERE  GI.NR_PROCESSO  = :NR_PROCESSO'
      '  AND  POI.NR_PROCESSO = GI.NR_PROCESSO'
      '  AND  POI.NR_ITEM     = GI.NR_ITEM'
      'ORDER BY POI.NR_ITEM')
    UpdateObject = updGestao_Item
    Left = 544
    Top = 456
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_gestao_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TGESTAO_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_gestao_item_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TGESTAO_ITEM.NR_ITEM'
      Size = 3
    end
    object qry_gestao_item_CD_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'CD_LOCAL_DESEMBARQUE'
      Origin = 'DBBROKER.TGESTAO_ITEM.CD_LOCAL_DESEMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_gestao_item_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'TGESTAO_ITEM.CD_EMBARCACAO'
      Size = 4
    end
    object qry_gestao_item_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'TGESTAO_ITEM.NR_VIAGEM'
      EditMask = '00/00;0;_'
      Size = 15
    end
    object qry_gestao_item_NR_VOO: TStringField
      FieldName = 'NR_VOO'
      Origin = 'TGESTAO_ITEM.NR_VOO'
      Size = 18
    end
    object qry_gestao_item_IN_CONSOLIDADO: TStringField
      FieldName = 'IN_CONSOLIDADO'
      Origin = 'TGESTAO_ITEM.IN_CONSOLIDADO'
      Size = 1
    end
    object qry_gestao_item_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      Origin = 'TGESTAO_ITEM.NR_CONHECIMENTO'
      Size = 30
    end
    object qry_gestao_item_IN_URGENTE: TStringField
      FieldName = 'IN_URGENTE'
      Origin = 'TGESTAO_ITEM.IN_URGENTE'
      Size = 1
    end
    object qry_gestao_item_IN_SEGURO: TStringField
      FieldName = 'IN_SEGURO'
      Origin = 'TGESTAO_ITEM.IN_SEGURO'
      Size = 1
    end
    object qry_gestao_item_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TPO_ITEM.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_gestao_item_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TPO_ITEM.CD_MERCADORIA'
      Size = 30
    end
    object qry_gestao_item_QT_INICIAL: TFloatField
      FieldName = 'QT_INICIAL'
      Origin = 'TPO_ITEM.QT_INICIAL'
      DisplayFormat = '#0.,00'
    end
    object qry_gestao_item_NM_AREA: TStringField
      FieldName = 'NM_AREA'
      Origin = 'DBBROKER.TPO_ITEM.CD_AREA'
      FixedChar = True
      Size = 55
    end
  end
  object updGestao_Item: TUpdateSQL
    ModifySQL.Strings = (
      'update TGESTAO_ITEM'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ITEM = :NR_ITEM,'
      '  CD_LOCAL_DESEMBARQUE = :CD_LOCAL_DESEMBARQUE,'
      '  CD_EMBARCACAO = :CD_EMBARCACAO,'
      '  NR_VIAGEM = :NR_VIAGEM,'
      '  NR_VOO = :NR_VOO,'
      '  IN_CONSOLIDADO = :IN_CONSOLIDADO,'
      '  NR_CONHECIMENTO = :NR_CONHECIMENTO,'
      '  IN_URGENTE = :IN_URGENTE,'
      '  IN_SEGURO = :IN_SEGURO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM')
    InsertSQL.Strings = (
      'insert into TGESTAO_ITEM'
      
        '  (NR_PROCESSO, NR_ITEM, CD_LOCAL_DESEMBARQUE, CD_EMBARCACAO, NR' +
        '_VIAGEM, NR_VOO, '
      '   IN_CONSOLIDADO, NR_CONHECIMENTO, IN_URGENTE, IN_SEGURO)'
      'values'
      
        '  (:NR_PROCESSO, :NR_ITEM, :CD_LOCAL_DESEMBARQUE, :CD_EMBARCACAO' +
        ', :NR_VIAGEM, '
      
        '   :NR_VOO, :IN_CONSOLIDADO, :NR_CONHECIMENTO, :IN_URGENTE, :IN_' +
        'SEGURO)')
    DeleteSQL.Strings = (
      'delete from TGESTAO_ITEM'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM')
    Left = 632
    Top = 456
  end
  object ds_po_item: TDataSource
    DataSet = qry_po_item_
    Left = 440
    Top = 344
  end
end

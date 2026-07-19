object datm_repassa_dados: Tdatm_repassa_dados
  OldCreateOrder = True
  Left = 110
  Top = 43
  Height = 606
  Width = 832
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_PRODUTO,'
      '               P.CD_CLIENTE, P.CD_SERVICO, P.IN_LIBERADO,'
      '               P.IN_CANCELADO, P.IN_PRODUCAO,'
      '              C.AP_EMPRESA, S.NM_SERVICO'
      'FROM TPROCESSO P, TEMPRESA_NAC C, TSERVICO S'
      'WHERE (P.CD_CLIENTE *= C.CD_EMPRESA) AND'
      '              (P.CD_SERVICO *= S.CD_SERVICO) AND'
      '              (P.NR_PROCESSO = :NR_PROCESSO)')
    Left = 32
    Top = 12
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
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_processo_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Size = 1
    end
    object qry_processo_IN_PRODUCAO: TStringField
      FieldName = 'IN_PRODUCAO'
      Size = 1
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 32
    Top = 72
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
    Left = 131
    Top = 12
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
    Left = 131
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
    object qry_usuario_habilitacao_LookUnidNeg: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'AP_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_usuario_habilitacao_LookProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'AP_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 50
      Lookup = True
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
    Left = 336
    Top = 12
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
  object qry_empresa_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC E, TPROCESSO P'
      'WHERE (E.CD_EMPRESA = P.CD_CLIENTE) '
      '')
    Left = 525
    Top = 12
    object qry_empresa_nac_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
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
  end
  object qry_servico: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO'
      'FROM TSERVICO')
    Left = 525
    Top = 72
    object qry_servicoCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 3
    end
    object qry_servicoNM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Origin = 'TSERVICO.NM_SERVICO'
      Size = 50
    end
  end
  object qry_tp_canal_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CANAL, ISNULL( NM_CANAL, '#39#39' ) NM_CANAL'
      'FROM TTP_CANAL'
      'ORDER BY'
      'NM_CANAL')
    Left = 614
    Top = 12
    object qry_tp_canal_CD_CANAL: TStringField
      FieldName = 'CD_CANAL'
      Size = 1
    end
    object qry_tp_canal_NM_CANAL: TStringField
      FieldName = 'NM_CANAL'
      Size = 10
    end
  end
  object ds_tp_canal: TDataSource
    DataSet = qry_tp_canal_
    Left = 614
    Top = 72
  end
  object qry_proc_lista_: TQuery
    OnCalcFields = qry_proc_lista_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.NR_PROCESSO, C.AP_EMPRESA, S.NM_SERVICO'
      'FROM TPROCESSO P, TEMPRESA_NAC C, TSERVICO S'
      'WHERE (P.CD_CLIENTE *= C.CD_EMPRESA) AND'
      '              (P.CD_SERVICO *= S.CD_SERVICO)')
    Left = 240
    Top = 12
    object qry_proc_lista_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_proc_lista_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_proc_lista_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Size = 50
    end
    object qry_proc_lista_CalcNr_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNr_processo'
      Size = 14
      Calculated = True
    end
  end
  object ds_proc_lista: TDataSource
    DataSet = qry_proc_lista_
    Left = 240
    Top = 72
  end
  object qry_proc_altera_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_USUARIO_REPASSA, VL_TAXA_FRETE, CD_CANAL,' +
        ' NR_MANIFESTO, CD_ARMAZEM_ATRACACAO, CD_EMBARCACAO, NR_VIAGEM'
      'FROM   TPROCESSO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 336
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_proc_altera_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_proc_altera_CD_USUARIO_REPASSA: TStringField
      FieldName = 'CD_USUARIO_REPASSA'
      Origin = 'TPROCESSO.CD_USUARIO_REPASSA'
      Size = 4
    end
    object qry_proc_altera_VL_TAXA_FRETE: TFloatField
      FieldName = 'VL_TAXA_FRETE'
      Origin = 'TPROCESSO.VL_TAXA_FRETE'
    end
    object qry_proc_altera_CD_CANAL: TStringField
      FieldName = 'CD_CANAL'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 1
    end
    object qry_proc_altera_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 15
    end
    object qry_proc_altera_CD_ARMAZEM_ATRACACAO: TStringField
      FieldName = 'CD_ARMAZEM_ATRACACAO'
      Origin = 'TPROCESSO.CD_USUARIO_REPASSA'
      Size = 4
    end
    object qry_proc_altera_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 4
    end
    object qry_proc_altera_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'TPROCESSO.CD_USUARIO_REPASSA'
      Size = 15
    end
  end
  object qry_proc_limpa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TPROCESSO'
      'SET CD_USUARIO_REPASSA = '#39#39
      'WHERE CD_USUARIO_REPASSA = :CD_USUARIO_REPASSA')
    Left = 432
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO_REPASSA'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object StringField2: TStringField
      FieldName = 'CD_USUARIO_REPASSA'
      Origin = 'TPROCESSO.CD_USUARIO_REPASSA'
      Size = 4
    end
    object FloatField1: TFloatField
      FieldName = 'VL_TAXA_FRETE'
      Origin = 'TPROCESSO.VL_TAXA_FRETE'
    end
    object StringField3: TStringField
      FieldName = 'CD_CANAL'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 1
    end
  end
  object qry_cliente_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO'
      'FROM TCLIENTE_HABILITACAO'
      'WHERE ( CD_UNID_NEG = :CD_UNID_NEG OR :CD_UNID_NEG = '#39#39') AND'
      '( CD_PRODUTO = :CD_PRODUTO OR :CD_PRODUTO = '#39#39') AND'
      '( CD_CLIENTE = :CD_CLIENTE )'
      ''
      '')
    Left = 728
    Top = 215
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
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
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
    object qry_cliente_habilitacao_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_HABILITACAO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_HABILITACAO.CD_PRODUTO'
      Size = 2
    end
  end
  object qry_cliente_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO,  CD_SERVICO'
      'FROM TCLIENTE_SERVICO'
      'WHERE ( CD_UNID_NEG = :CD_UNID_NEG OR :CD_UNID_NEG = '#39#39') AND'
      '( CD_PRODUTO = :CD_PRODUTO OR :CD_PRODUTO = '#39#39') AND'
      'CD_CLIENTE = :CD_CLIENTE AND CD_SERVICO = :CD_SERVICO'
      '')
    Left = 728
    Top = 271
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
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
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
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
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TSERVICO ')
    Left = 352
    Top = 215
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
    Left = 352
    Top = 271
  end
  object qry_pais_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TPAIS')
    Left = 614
    Top = 215
    object qry_pais_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TPAIS.CODIGO'
      Size = 3
    end
    object qry_pais_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TPAIS.DESCRICAO'
      Size = 120
    end
  end
  object ds_pais: TDataSource
    DataSet = qry_pais_
    Left = 614
    Top = 271
  end
  object qry_embarc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TEMBARCACAO')
    Left = 432
    Top = 215
    object qry_embarc_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'TEMBARCACAO.CD_EMBARCACAO'
      Size = 4
    end
    object qry_embarc_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      Origin = 'TEMBARCACAO.NM_EMBARCACAO'
      Size = 40
    end
    object qry_embarc_IN_RORO: TStringField
      FieldName = 'IN_RORO'
      Origin = 'TEMBARCACAO.IN_RORO'
      Size = 1
    end
    object qry_embarc_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TEMBARCACAO.IN_ATIVO'
      Size = 1
    end
  end
  object ds_embarc: TDataSource
    DataSet = qry_embarc_
    Left = 432
    Top = 271
  end
  object qry_local_emb_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TLOCAL_EMBARQUE')
    Left = 525
    Top = 215
    object qry_local_emb_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TLOCAL_EMBARQUE.CODIGO'
      Size = 4
    end
    object qry_local_emb_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TLOCAL_EMBARQUE.DESCRICAO'
      Size = 50
    end
  end
  object ds_local_emb: TDataSource
    DataSet = qry_local_emb_
    Left = 525
    Top = 271
  end
  object qry_pesq_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '#9'P.NR_PROCESSO, P.CD_UNID_NEG,  U.NM_UNID_NEG, '
      '        P.CD_PRODUTO, PR.NM_PRODUTO, '
      '        P.CD_CLIENTE, E.AP_EMPRESA,'
      '        P.CD_SERVICO, S.NM_SERVICO'
      'FROM TPROCESSO P,'
      '     TUNID_NEG U,'
      '     TPRODUTO PR,'
      '     TEMPRESA_NAC E,'
      '     TSERVICO S'
      'WHERE'
      '( P.CD_UNID_NEG = U.CD_UNID_NEG AND'
      '  P.CD_PRODUTO = PR.CD_PRODUTO AND'
      '  P.CD_CLIENTE *= E.CD_EMPRESA AND'
      '  P.CD_SERVICO *= S.CD_SERVICO'
      ')')
    Left = 32
    Top = 215
    object qry_pesq_NR_PROCESSO: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_pesq_CD_UNID_NEG: TStringField
      DisplayLabel = 'Cd Unid. Neg.'
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_pesq_CD_PRODUTO: TStringField
      DisplayLabel = 'Cd. Prod.'
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_pesq_CD_CLIENTE: TStringField
      DisplayLabel = 'Cd. Cli'
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_pesq_AP_EMPRESA: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_pesq_CD_SERVICO: TStringField
      DisplayLabel = 'Cd. Serv.'
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qry_pesq_NM_SERVICO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'NM_SERVICO'
      Size = 50
    end
    object qry_pesq_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Size = 50
    end
    object qry_pesq_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Size = 40
    end
    object qry_pesq_calc_nr_processo: TStringField
      DisplayLabel = 'N'#186' Processo'
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'calc_nr_processo'
      Size = 18
      Calculated = True
    end
  end
  object ds_pesq: TDataSource
    DataSet = qry_pesq_
    Left = 32
    Top = 271
  end
  object qry_transp_rod_: TQuery
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT CD_TRANSP_ROD, NM_TRANSP_ROD'
      'FROM   TTRANSP_ROD'
      'WHERE  IN_ATIVO = '#39'1'#39
      '')
    Left = 131
    Top = 215
    object qry_transp_rod_CD_TRANSP_ROD: TStringField
      FieldName = 'CD_TRANSP_ROD'
      Origin = 'TTRANSP_ROD.CD_TRANSP_ROD'
      Size = 4
    end
    object qry_transp_rod_NM_TRANSP_ROD: TStringField
      FieldName = 'NM_TRANSP_ROD'
      Origin = 'TTRANSP_ROD.NM_TRANSP_ROD'
      Size = 60
    end
  end
  object qry_amz_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ARMAZEM, NM_ARMAZEM'
      'FROM   TARMAZEM'
      'WHERE  IN_ATIVO = '#39'1'#39
      '')
    Left = 131
    Top = 271
    object qry_amz_CD_ARMAZEM: TStringField
      FieldName = 'CD_ARMAZEM'
      Origin = 'TARMAZEM.CD_ARMAZEM'
      Size = 4
    end
    object qry_amz_NM_ARMAZEM: TStringField
      FieldName = 'NM_ARMAZEM'
      Origin = 'TARMAZEM.NM_ARMAZEM'
      Size = 50
    end
  end
  object qry_agente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_AGENTE, NM_AGENTE'
      'FROM   TAGENTE'
      'WHERE  IN_ATIVO = '#39'1'#39
      '')
    Left = 208
    Top = 215
    object qry_agente_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'TAGENTE.CD_AGENTE'
      Size = 4
    end
    object qry_agente_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      Origin = 'TAGENTE.NM_AGENTE'
      Size = 60
    end
  end
  object qry_proc_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_USUARIO_REPASSA'
      'FROM   TPROCESSO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 35
    Top = 372
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_proc_usuario_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_proc_usuario_CD_USUARIO_REPASSA: TStringField
      FieldName = 'CD_USUARIO_REPASSA'
      Origin = 'TPROCESSO.CD_USUARIO_REPASSA'
      Size = 4
    end
    object qry_proc_usuario_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 2
    end
    object qry_proc_usuario_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
  end
  object qry_evento_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EVENTO, NM_EVENTO'
      'FROM TEVENTO')
    Left = 728
    Top = 327
    object qry_evento_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TEVENTO.CD_EVENTO'
      Size = 3
    end
    object qry_evento_NM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      Origin = 'TEVENTO.NM_EVENTO'
      Size = 50
    end
  end
  object qry_di_altera_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_MANIFESTO'
      'FROM   TDECLARACAO_IMPORTACAO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       ( ( NR_DECLARACAO_IMP = "" ) OR'
      '         ( NR_DECLARACAO_IMP IS NULL ) )')
    Left = 336
    Top = 123
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_di_altera_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_di_altera_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_MANIFESTO'
      Size = 15
    end
  end
  object qry_flp_altera_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_EVENTO, IN_APLICAVEL'
      'FROM   TFOLLOWUP'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      'CD_EVENTO = :CD_EVENTO')
    Left = 432
    Top = 125
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EVENTO'
        ParamType = ptUnknown
      end>
    object qry_flp_altera_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 18
    end
    object qry_flp_altera_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TFOLLOWUP.CD_EVENTO'
      Size = 3
    end
    object qry_flp_altera_IN_APLICAVEL: TStringField
      FieldName = 'IN_APLICAVEL'
      Origin = 'TFOLLOWUP.IN_APLICAVEL'
      Size = 1
    end
  end
  object qry_yes_no_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TYES_NO'
      'ORDER BY TX_YESNO')
    Left = 702
    Top = 12
    object qry_yes_no_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Origin = 'TYES_NO.CD_YESNO'
      Size = 1
    end
    object qry_yes_no_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Origin = 'TYES_NO.TX_YESNO'
      Size = 3
    end
    object qry_yes_no_IN_YESNO: TBooleanField
      FieldName = 'IN_YESNO'
      Origin = 'TYES_NO.IN_YESNO'
    end
  end
  object ds_yesno: TDataSource
    DataSet = qry_yes_no_
    Left = 702
    Top = 72
  end
  object qry_tp_canal_filtro_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_CANAL'
      'ORDER BY NM_CANAL')
    Left = 126
    Top = 332
    object qry_tp_canal_filtro_CD_CANAL: TStringField
      FieldName = 'CD_CANAL'
      Origin = 'TTP_CANAL.CD_CANAL'
      Size = 1
    end
    object qry_tp_canal_filtro_NM_CANAL: TStringField
      FieldName = 'NM_CANAL'
      Origin = 'TTP_CANAL.NM_CANAL'
      Size = 10
    end
  end
  object ds_tp_canal_filtro: TDataSource
    DataSet = qry_tp_canal_filtro_
    Left = 126
    Top = 392
  end
  object sp_atualiza_processo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atualiza_processo'
    Left = 727
    Top = 441
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 1
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object qry_viagem_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT NR_VIAGEM'
      'FROM   TVIAGEM'
      'WHERE  CD_UNID_NEG   = :CD_UNID_NEG AND'
      '       CD_PRODUTO    = :CD_PRODUTO AND'
      '       CD_EMBARCACAO = :CD_EMBARCACAO AND'
      '       NR_VIAGEM     = :NR_VIAGEM'
      '')
    Left = 430
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
        Name = 'CD_EMBARCACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_VIAGEM'
        ParamType = ptUnknown
      end>
  end
end

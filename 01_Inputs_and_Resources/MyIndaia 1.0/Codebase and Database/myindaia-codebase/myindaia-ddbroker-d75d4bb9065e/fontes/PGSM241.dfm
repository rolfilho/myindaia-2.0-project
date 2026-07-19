object datm_viagem: Tdatm_viagem
  OldCreateOrder = True
  Left = 380
  Top = 163
  Height = 554
  Width = 342
  object ds_viagem: TDataSource
    DataSet = qry_viagem_
    Left = 136
    Top = 69
  end
  object qry_viagem_: TQuery
    CachedUpdates = True
    AfterOpen = qry_viagem_AfterOpen
    AfterClose = qry_viagem_AfterClose
    AfterPost = qry_viagem_AfterPost
    AfterDelete = qry_viagem_AfterDelete
    AfterScroll = qry_viagem_AfterScroll
    OnCalcFields = qry_viagem_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT V.*, U.NM_USUARIO'
      'FROM   TVIAGEM V (NOLOCK)'
      
        'LEFT JOIN TUSUARIO U (NOLOCK) ON U.CD_USUARIO = V.CD_CRIADOR_VIA' +
        'GEM'
      'WHERE  V.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       V.CD_PRODUTO = :CD_PRODUTO AND'
      '       V.CD_EMBARCACAO = :CD_EMBARCACAO AND'
      '       V.NR_VIAGEM = :NR_VIAGEM AND'
      '       V.CD_LOCAL = :CD_LOCAL      ')
    UpdateObject = upd_viagem_
    Left = 96
    Top = 11
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
      end
      item
        DataType = ftString
        Name = 'CD_LOCAL'
        ParamType = ptUnknown
      end>
    object qry_viagem_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TVIAGEM.CD_UNID_NEG'
      Size = 2
    end
    object qry_viagem_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TVIAGEM.CD_PRODUTO'
      Size = 2
    end
    object qry_viagem_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'TVIAGEM.CD_EMBARCACAO'
      Size = 4
    end
    object qry_viagem_NR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'TVIAGEM.NR_VIAGEM'
      EditMask = '99/99;0;_'
      Size = 4
    end
    object qry_viagem_DT_ESPERADA: TDateTimeField
      FieldName = 'DT_ESPERADA'
      Origin = 'TVIAGEM.DT_ESPERADA'
      OnChange = qry_viagem_DT_ESPERADAChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_viagem_DT_ENT: TDateTimeField
      FieldName = 'DT_ENT'
      Origin = 'TVIAGEM.DT_ENT'
      OnChange = qry_viagem_DT_ESPERADAChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_viagem_CD_ARMAZEM_ATRACACAO: TStringField
      FieldName = 'CD_ARMAZEM_ATRACACAO'
      Origin = 'TVIAGEM.CD_ARMAZEM_ATRACACAO'
      Size = 4
    end
    object qry_viagem_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Origin = 'TVIAGEM.NR_MANIFESTO'
      Size = 15
    end
    object qry_viagem_IN_TRANSBORDO: TStringField
      FieldName = 'IN_TRANSBORDO'
      Origin = 'TVIAGEM.CD_UNID_NEG'
      Size = 1
    end
    object qry_viagem_LookUnidNeg: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookUnidNeg'
      Size = 10
      Calculated = True
    end
    object qry_viagem_LookProduto: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookProduto'
      Size = 10
      Calculated = True
    end
    object qry_viagem_LookEmbarcacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookEmbarcacao'
      Size = 40
      Calculated = True
    end
    object qry_viagem_LookArmazemAtracacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookArmazemAtracacao'
      Size = 50
      Calculated = True
    end
    object qry_viagem_LookTransbordo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTransbordo'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_TRANSBORDO'
      Size = 3
      Lookup = True
    end
    object qry_viagem_LookLocal: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookLocal'
      Calculated = True
    end
    object qry_viagem_CD_LOCAL: TStringField
      FieldName = 'CD_LOCAL'
      Origin = 'TVIAGEM.CD_UNID_NEG'
      Size = 4
    end
    object qry_viagem_DT_DEADLINE_BL: TDateTimeField
      FieldName = 'DT_DEADLINE_BL'
      Origin = 'DBBROKER.TVIAGEM.DT_DEADLINE_BL'
      OnChange = qry_viagem_DT_ESPERADAChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_viagem_DT_DEADLINE_CARGA: TDateTimeField
      FieldName = 'DT_DEADLINE_CARGA'
      Origin = 'DBBROKER.TVIAGEM.DT_DEADLINE_CARGA'
      OnChange = qry_viagem_DT_ESPERADAChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_viagem_NR_TRANSIT_TIME: TFloatField
      FieldName = 'NR_TRANSIT_TIME'
      Origin = 'DBBROKER.TVIAGEM.NR_TRANSIT_TIME'
    end
    object qry_viagem_DT_ABERTURA_GATE: TDateTimeField
      FieldName = 'DT_ABERTURA_GATE'
      Origin = 'DBBROKER.TVIAGEM.DT_ABERTURA_GATE'
      OnChange = qry_viagem_DT_ESPERADAChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_viagem_DT_PREVISTA_ORIGEM_DESTINO: TDateTimeField
      FieldName = 'DT_PREVISTA_ORIGEM_DESTINO'
      Origin = 'DBBROKER.TVIAGEM.DT_PREVISTA_ORIGEM_DESTINO'
      OnChange = qry_viagem_DT_ESPERADAChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_viagem_NR_VIAGEM_ARMADOR: TStringField
      FieldName = 'NR_VIAGEM_ARMADOR'
      Origin = 'DBBROKER.TVIAGEM.NR_VIAGEM_ARMADOR'
      FixedChar = True
      Size = 15
    end
    object qry_viagem_DT_DEADLINE_IMO: TDateTimeField
      FieldName = 'DT_DEADLINE_IMO'
      Origin = 'DBBROKER.TVIAGEM.DT_DEADLINE_IMO'
      OnChange = qry_viagem_DT_ESPERADAChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_viagem_CD_CIDADE: TStringField
      FieldName = 'CD_CIDADE'
      Origin = 'DBBROKER.TVIAGEM.CD_CIDADE'
      FixedChar = True
    end
    object qry_viagem_CD_UF: TStringField
      FieldName = 'CD_UF'
      Origin = 'DBBROKER.TVIAGEM.CD_UF'
      FixedChar = True
      Size = 2
    end
    object qry_viagem_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TVIAGEM.CD_PAIS'
      FixedChar = True
    end
    object qry_viagem_TX_BANDEIRA: TStringField
      FieldName = 'TX_BANDEIRA'
      Origin = 'DBBROKER.TVIAGEM.TX_BANDEIRA'
      FixedChar = True
    end
    object qry_viagem_NR_FONTE: TIntegerField
      FieldName = 'NR_FONTE'
      Origin = 'DBBROKER.TVIAGEM.NR_FONTE'
    end
    object qry_viagem_DT_DEADLINE_CARTA_TEMP: TDateTimeField
      FieldName = 'DT_DEADLINE_CARTA_TEMP'
      Origin = 'DBBROKER.TVIAGEM.DT_DEADLINE_CARTA_TEMP'
      OnChange = qry_viagem_DT_ESPERADAChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_viagem_HR_DEADLINE_CARTA_TEMP: TStringField
      FieldName = 'HR_DEADLINE_CARTA_TEMP'
      Origin = 'DBBROKER.TVIAGEM.HR_DEADLINE_CARTA_TEMP'
      EditMask = '!99:99:99;1;_'
      FixedChar = True
      Size = 10
    end
    object qry_viagem_HR_DEADLINE_BL: TStringField
      FieldName = 'HR_DEADLINE_BL'
      Origin = 'DBBROKER.TVIAGEM.HR_DEADLINE_BL'
      EditMask = '!99:99:99;1;_'
      FixedChar = True
      Size = 10
    end
    object qry_viagem_HR_DEADLINE_CARGA: TStringField
      FieldName = 'HR_DEADLINE_CARGA'
      Origin = 'DBBROKER.TVIAGEM.HR_DEADLINE_CARGA'
      EditMask = '!99:99:99;1;_'
      FixedChar = True
      Size = 10
    end
    object qry_viagem_HR_DEADLINE_IMO: TStringField
      FieldName = 'HR_DEADLINE_IMO'
      Origin = 'DBBROKER.TVIAGEM.HR_DEADLINE_IMO'
      EditMask = '!99:99:99;1;_'
      FixedChar = True
      Size = 10
    end
    object qry_viagem_HR_ABERTURA_GATE: TStringField
      FieldName = 'HR_ABERTURA_GATE'
      Origin = 'DBBROKER.TVIAGEM.HR_ABERTURA_GATE'
      EditMask = '!99:99:99;1;_'
      FixedChar = True
      Size = 10
    end
    object qry_viagem_CD_CRIADOR_VIAGEM: TStringField
      FieldName = 'CD_CRIADOR_VIAGEM'
      Origin = 'DBBROKER.TVIAGEM.CD_CRIADOR_VIAGEM'
      FixedChar = True
      Size = 4
    end
    object qry_viagem_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'DBBROKER.TUSUARIO.NM_USUARIO'
      FixedChar = True
      Size = 50
    end
  end
  object qry_ult_viagem_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL( MAX( SUBSTRING( NR_VIAGEM, 1, 2 ) ), '#39#39' ) ULTIMO'
      'FROM   TVIAGEM (NOLOCK)'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       CD_EMBARCACAO = :CD_EMBARCACAO AND'
      '       SUBSTRING( NR_VIAGEM, 3, 2 ) = :NR_ANO')
    Left = 224
    Top = 132
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
        Name = 'NR_ANO'
        ParamType = ptUnknown
      end>
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_PRODUTO, AP_PRODUTO'
      'FROM   TPRODUTO (NOLOCK)'
      'WHERE  CD_PRODUTO = :CD_PRODUTO')
    Left = 54
    Top = 69
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG '
      'FROM   TUNID_NEG (NOLOCK)'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Left = 38
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UP.CD_UNID_NEG, U.AP_UNID_NEG, UP.CD_PRODUTO, P.AP_PRODUT' +
        'O'
      
        'FROM   TUNID_NEG_PRODUTO UP (NOLOCK), TUNID_NEG U (NOLOCK), TPRO' +
        'DUTO P (NOLOCK)'
      'WHERE  UP.CD_UNID_NEG = U.CD_UNID_NEG AND'
      '       UP.CD_PRODUTO = P.CD_PRODUTO AND'
      '       ( UP.CD_UNID_NEG + UP.CD_PRODUTO ) IN'
      '          ( SELECT ( CD_UNID_NEG + CD_PRODUTO )'
      '            FROM   TUSUARIO_HABILITACAO (NOLOCK)'
      '            WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                   IN_ATIVO = '#39'1'#39' )'
      '')
    Left = 52
    Top = 216
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
    object qry_usuario_habilitacao_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Size = 10
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_usuario_habilitacao_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Size = 10
    end
  end
  object qry_lista_: TQuery
    BeforeOpen = qry_lista_BeforeOpen
    AfterScroll = qry_lista_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT V.CD_UNID_NEG, V.CD_PRODUTO, V.CD_EMBARCACAO, V.NR_VIAGEM' +
        ', V.DT_ESPERADA,'
      
        '       V.DT_ENT, A.NM_ARMAZEM, V.NR_MANIFESTO, V.CD_LOCAL, E.DES' +
        'CRICAO'
      'FROM   TVIAGEM V, TARMAZEM A, TLOCAL_EMBARQUE E'
      'WHERE  V.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       V.CD_PRODUTO = :CD_PRODUTO AND'
      '       V.CD_EMBARCACAO = :CD_EMBARCACAO AND'
      '       V.CD_ARMAZEM_ATRACACAO *= A.CD_ARMAZEM AND'
      '       V.CD_LOCAL *= E.CODIGO  '
      
        'ORDER BY SUBSTRING( NR_VIAGEM, 3, 2 ) DESC, SUBSTRING( NR_VIAGEM' +
        ', 1, 2 ) DESC')
    Left = 224
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
      end>
    object qry_lista_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_lista_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_lista_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Size = 4
    end
    object qry_lista_NR_VIAGEM: TStringField
      DisplayLabel = 'Viagem'
      FieldName = 'NR_VIAGEM'
      EditMask = '99/99;0;_'
      Size = 4
    end
    object qry_lista_DT_ESPERADA: TDateTimeField
      DisplayLabel = 'Dt. Esperada'
      FieldName = 'DT_ESPERADA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_lista_DT_ENT: TDateTimeField
      DisplayLabel = 'Dt. Entrada'
      FieldName = 'DT_ENT'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_lista_NM_ARMAZEM: TStringField
      DisplayLabel = 'Arm. Atraca'#231#227'o'
      FieldName = 'NM_ARMAZEM'
      Size = 50
    end
    object qry_lista_NR_MANIFESTO: TStringField
      DisplayLabel = 'N'#186' Manifesto'
      FieldName = 'NR_MANIFESTO'
      Size = 15
    end
    object qry_lista_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qry_lista_CD_LOCAL: TStringField
      FieldName = 'CD_LOCAL'
      Size = 4
    end
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 224
    Top = 69
  end
  object qry_embarcacao_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_EMBARCACAO, NM_EMBARCACAO'
      'FROM   TEMBARCACAO (NOLOCK)'
      'WHERE  CD_EMBARCACAO = :CD_EMBARCACAO')
    Left = 54
    Top = 117
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMBARCACAO'
        ParamType = ptUnknown
      end>
  end
  object qry_armazem_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_ARMAZEM, NM_ARMAZEM'
      'FROM   TARMAZEM (NOLOCK)'
      'WHERE  CD_ARMAZEM = :CD_ARMAZEM')
    Left = 54
    Top = 165
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ARMAZEM'
        ParamType = ptUnknown
      end>
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_DIAS_ENTRE_VIAGENS'
      'FROM   TPARAMETROS (NOLOCK)')
    Left = 224
    Top = 189
  end
  object qry_ult_dt_esperada_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX( DT_ESPERADA ) DT_ESPERADA'
      'FROM   TVIAGEM (NOLOCK)'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       CD_EMBARCACAO = :CD_EMBARCACAO AND'
      '       NR_VIAGEM <> :NR_VIAGEM AND'
      '       CD_LOCAL = :CD_LOCAL ')
    Left = 224
    Top = 237
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
      end
      item
        DataType = ftString
        Name = 'CD_LOCAL'
        ParamType = ptUnknown
      end>
  end
  object qry_yes_no_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO'
      'FROM   TYES_NO (NOLOCK)')
    Left = 54
    Top = 269
  end
  object sp_ev_prev_fabrica_viagem: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_ev_prev_fabrica_viagem'
    Left = 223
    Top = 287
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
        Name = '@cd_embarcacao'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_viagem'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_local'
        ParamType = ptInput
      end>
  end
  object qry_local_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM   TLOCAL_EMBARQUE (NOLOCK)'
      'WHERE  CODIGO = :CD_LOCAL')
    Left = 56
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_LOCAL'
        ParamType = ptUnknown
      end>
  end
  object ds_viagem_DeadLine: TDataSource
    DataSet = qry_viagem_DeadLine
    Left = 61
    Top = 440
  end
  object qry_viagem_DeadLine: TQuery
    CachedUpdates = True
    AfterInsert = qry_viagem_DeadLineAfterInsert
    AfterPost = qry_viagem_DeadLineAfterPost
    AfterDelete = qry_viagem_DeadLineAfterPost
    OnCalcFields = qry_viagem_DeadLineCalcFields
    OnNewRecord = qry_viagem_DeadLineNewRecord
    DatabaseName = 'DBBROKER'
    DataSource = ds_viagem
    SQL.Strings = (
      'SELECT VD.*, A.NM_AGENTE'
      'FROM   TVIAGEM_DEADLINE VD (NOLOCK), TAGENTE A (NOLOCK)'
      'WHERE  VD.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       VD.CD_PRODUTO = :CD_PRODUTO AND'
      '       VD.CD_EMBARCACAO = :CD_EMBARCACAO AND'
      '       VD.NR_VIAGEM = :NR_VIAGEM AND '
      #9'   A.CD_AGENTE  = VD.CD_AGENTE')
    UpdateObject = updViagem_DeadLine
    Left = 64
    Top = 382
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
        Name = 'CD_EMBARCACAO'
        ParamType = ptUnknown
        Size = 5
      end
      item
        DataType = ftString
        Name = 'NR_VIAGEM'
        ParamType = ptUnknown
        Size = 5
      end>
    object qry_viagem_DeadLineCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.CD_UNID_NEG'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qry_viagem_DeadLineCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.CD_PRODUTO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qry_viagem_DeadLineCD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.CD_EMBARCACAO'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object qry_viagem_DeadLineNR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.NR_VIAGEM'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object qry_viagem_DeadLineCD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.CD_AGENTE'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object qry_viagem_DeadLineNM_AGENTE: TStringField
      DisplayLabel = 'Agente'
      DisplayWidth = 20
      FieldName = 'NM_AGENTE'
      Origin = 'DBBROKER.TAGENTE.NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_viagem_DeadLinecalcEstufagem: TStringField
      DisplayLabel = 'Estufagem'
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'calcEstufagem'
      Calculated = True
    end
    object qry_viagem_DeadLineTP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.TP_ESTUFAGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qry_viagem_DeadLineVIAGEMDOAGENTE: TStringField
      DisplayLabel = 'Viagem do Agente'
      FieldName = 'VIAGEMDOAGENTE'
      Size = 30
    end
    object qry_viagem_DeadLineDT_DEADLINE_BL: TDateTimeField
      FieldName = 'DT_DEADLINE_BL'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.DT_DEADLINE_BL'
      Visible = False
      OnChange = qry_viagem_DT_ESPERADAChange
      EditMask = '99/99/9999;1;_'
    end
    object qry_viagem_DeadLineHR_DEADLINE_BL: TStringField
      FieldName = 'HR_DEADLINE_BL'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.HR_DEADLINE_BL'
      Visible = False
      EditMask = '!99:99:99;1;_'
      FixedChar = True
      Size = 10
    end
    object qry_viagem_DeadLineDT_DEADLINE_CARGA: TDateTimeField
      FieldName = 'DT_DEADLINE_CARGA'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.DT_DEADLINE_CARGA'
      Visible = False
      OnChange = qry_viagem_DT_ESPERADAChange
      EditMask = '99/99/9999;1;_'
    end
    object qry_viagem_DeadLineHR_DEADLINE_CARGA: TStringField
      FieldName = 'HR_DEADLINE_CARGA'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.HR_DEADLINE_CARGA'
      Visible = False
      EditMask = '!99:99:99;1;_'
      FixedChar = True
      Size = 10
    end
    object qry_viagem_DeadLineDT_DEADLINE_IMO: TDateTimeField
      FieldName = 'DT_DEADLINE_IMO'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.DT_DEADLINE_IMO'
      Visible = False
      OnChange = qry_viagem_DT_ESPERADAChange
      EditMask = '99/99/9999;1;_'
    end
    object qry_viagem_DeadLineHR_DEADLINE_IMO: TStringField
      FieldName = 'HR_DEADLINE_IMO'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.HR_DEADLINE_IMO'
      Visible = False
      EditMask = '!99:99:99;1;_'
      FixedChar = True
      Size = 10
    end
    object qry_viagem_DeadLineDT_ABERTURA_GATE: TDateTimeField
      DisplayLabel = 'Date Abertura Gate'
      FieldName = 'DT_ABERTURA_GATE'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.DT_ABERTURA_GATE'
      Visible = False
      OnChange = qry_viagem_DT_ESPERADAChange
      EditMask = '99/99/9999;1;_'
    end
    object qry_viagem_DeadLineHR_ABERTURA_GATE: TStringField
      DisplayLabel = 'Hora Abertura Gate'
      FieldName = 'HR_ABERTURA_GATE'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.HR_ABERTURA_GATE'
      Visible = False
      EditMask = '!99:99:99;1;_'
      FixedChar = True
      Size = 10
    end
    object qry_viagem_DeadLineDT_DEADLINE_CARTA_TEMP: TDateTimeField
      DisplayLabel = 'Data DeadLine TEMP'
      FieldName = 'DT_DEADLINE_CARTA_TEMP'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.DT_DEADLINE_CARTA_TEMP'
      Visible = False
      OnChange = qry_viagem_DT_ESPERADAChange
      EditMask = '99/99/9999;1;_'
    end
    object qry_viagem_DeadLineHR_DEADLINE_CARTA_TEMP: TStringField
      DisplayLabel = 'Hora DeadLine TEMP'
      FieldName = 'HR_DEADLINE_CARTA_TEMP'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.HR_DEADLINE_CARTA_TEMP'
      Visible = False
      EditMask = '!99:99:99;1;_'
      FixedChar = True
      Size = 10
    end
    object qry_viagem_DeadLineDT_DEADLINE_VGM: TDateTimeField
      DisplayLabel = 'Data DeadLine VGM'
      DisplayWidth = 18
      FieldName = 'DT_DEADLINE_VGM'
      Visible = False
      EditMask = '99/99/9999;1;_'
    end
    object qry_viagem_DeadLineHR_DEADLINE_VGM: TStringField
      DisplayLabel = 'Hora DeadLine VGM'
      FieldName = 'HR_DEADLINE_VGM'
      Visible = False
      EditMask = '!99:99:99;1;_'
      FixedChar = True
      Size = 10
    end
    object qry_viagem_DeadLinecalcDtHrBL: TStringField
      DisplayLabel = 'Dead-Line BL Draft'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'calcDtHrBL'
      Size = 25
      Calculated = True
    end
    object qry_viagem_DeadLinecalcDtHrCarga: TStringField
      DisplayLabel = 'Dead-Line Carga'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'calcDtHrCarga'
      Size = 25
      Calculated = True
    end
    object qry_viagem_DeadLinecalcDtHrImo: TStringField
      DisplayLabel = 'Dead-Line IMO'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'calcDtHrImo'
      Size = 25
      Calculated = True
    end
    object qry_viagem_DeadLinecalcDtHrGate: TStringField
      DisplayLabel = 'Abertura Gate'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'calcDtHrGate'
      Size = 25
      Calculated = True
    end
    object qry_viagem_DeadLinecalcDtHrTemp: TStringField
      DisplayLabel = 'Dead-Line Temp.'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'calcDtHrTemp'
      Size = 25
      Calculated = True
    end
    object qry_viagem_DeadLineCD_RESP_ALTERACAO: TStringField
      DisplayLabel = 'Cod Resp Altera'#231#227'o'
      FieldName = 'CD_RESP_ALTERACAO'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.CD_RESP_ALTERACAO'
      FixedChar = True
      Size = 4
    end
    object qry_viagem_DeadLineDT_ALTERACAO: TDateTimeField
      DisplayLabel = 'Data Altera'#231#227'o'
      FieldName = 'DT_ALTERACAO'
      Origin = 'DBBROKER.TVIAGEM_DEADLINE.DT_ALTERACAO'
    end
  end
  object updViagem_DeadLine: TUpdateSQL
    ModifySQL.Strings = (
      'update TVIAGEM_DEADLINE'
      'set'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_EMBARCACAO = :CD_EMBARCACAO,'
      '  NR_VIAGEM = :NR_VIAGEM,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  HR_DEADLINE_BL = :HR_DEADLINE_BL,'
      '  DT_DEADLINE_CARGA = :DT_DEADLINE_CARGA,'
      '  HR_DEADLINE_CARGA = :HR_DEADLINE_CARGA,'
      '  DT_DEADLINE_IMO = :DT_DEADLINE_IMO,'
      '  HR_DEADLINE_IMO = :HR_DEADLINE_IMO,'
      '  DT_ABERTURA_GATE = :DT_ABERTURA_GATE,'
      '  HR_ABERTURA_GATE = :HR_ABERTURA_GATE,'
      '  DT_DEADLINE_CARTA_TEMP = :DT_DEADLINE_CARTA_TEMP,'
      '  HR_DEADLINE_CARTA_TEMP = :HR_DEADLINE_CARTA_TEMP,'
      '  DT_DEADLINE_BL = :DT_DEADLINE_BL,'
      '  CD_RESP_ALTERACAO = :CD_RESP_ALTERACAO,'
      '  DT_ALTERACAO = :DT_ALTERACAO,'
      '  VIAGEMDOAGENTE = :VIAGEMDOAGENTE,'
      '  DT_DEADLINE_VGM = :DT_DEADLINE_VGM,'
      '  HR_DEADLINE_VGM = :HR_DEADLINE_VGM'
      'where'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_EMBARCACAO = :OLD_CD_EMBARCACAO and'
      '  NR_VIAGEM = :OLD_NR_VIAGEM and'
      '  CD_AGENTE = :OLD_CD_AGENTE and'
      '  TP_ESTUFAGEM = :OLD_TP_ESTUFAGEM')
    InsertSQL.Strings = (
      'insert into TVIAGEM_DEADLINE'
      
        '  (CD_UNID_NEG, CD_PRODUTO, CD_EMBARCACAO, NR_VIAGEM, CD_AGENTE,' +
        ' TP_ESTUFAGEM, '
      
        '   HR_DEADLINE_BL, DT_DEADLINE_CARGA, HR_DEADLINE_CARGA, DT_DEAD' +
        'LINE_IMO, '
      
        '   HR_DEADLINE_IMO, DT_ABERTURA_GATE, HR_ABERTURA_GATE, DT_DEADL' +
        'INE_CARTA_TEMP, '
      
        '   HR_DEADLINE_CARTA_TEMP, DT_DEADLINE_BL, CD_RESP_ALTERACAO, DT' +
        '_ALTERACAO,VIAGEMDOAGENTE'
      '   ,DT_DEADLINE_VGM, HR_DEADLINE_VGM)'
      'values'
      
        '  (:CD_UNID_NEG, :CD_PRODUTO, :CD_EMBARCACAO, :NR_VIAGEM, :CD_AG' +
        'ENTE, :TP_ESTUFAGEM, '
      
        '   :HR_DEADLINE_BL, :DT_DEADLINE_CARGA, :HR_DEADLINE_CARGA, :DT_' +
        'DEADLINE_IMO, '
      
        '   :HR_DEADLINE_IMO, :DT_ABERTURA_GATE, :HR_ABERTURA_GATE, :DT_D' +
        'EADLINE_CARTA_TEMP, '
      
        '   :HR_DEADLINE_CARTA_TEMP, :DT_DEADLINE_BL, :CD_RESP_ALTERACAO,' +
        ' :DT_ALTERACAO,:VIAGEMDOAGENTE,'
      '   :DT_DEADLINE_VGM, :HR_DEADLINE_VGM)')
    DeleteSQL.Strings = (
      'delete from TVIAGEM_DEADLINE'
      'where'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_EMBARCACAO = :OLD_CD_EMBARCACAO and'
      '  NR_VIAGEM = :OLD_NR_VIAGEM and'
      '  CD_AGENTE = :OLD_CD_AGENTE and'
      '  TP_ESTUFAGEM = :OLD_TP_ESTUFAGEM')
    Left = 201
    Top = 436
  end
  object upd_viagem_: TUpdateSQL
    ModifySQL.Strings = (
      'update TVIAGEM'
      'set'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_EMBARCACAO = :CD_EMBARCACAO,'
      '  NR_VIAGEM = :NR_VIAGEM,'
      '  DT_ESPERADA = :DT_ESPERADA,'
      '  DT_ENT = :DT_ENT,'
      '  CD_ARMAZEM_ATRACACAO = :CD_ARMAZEM_ATRACACAO,'
      '  NR_MANIFESTO = :NR_MANIFESTO,'
      '  IN_TRANSBORDO = :IN_TRANSBORDO,'
      '  CD_LOCAL = :CD_LOCAL,'
      '  CD_CIDADE = :CD_CIDADE,'
      '  CD_UF = :CD_UF,'
      '  CD_PAIS = :CD_PAIS,'
      '  TX_BANDEIRA = :TX_BANDEIRA,'
      '  NR_FONTE = :NR_FONTE,'
      '  DT_DEADLINE_BL = :DT_DEADLINE_BL,'
      '  DT_DEADLINE_CARGA = :DT_DEADLINE_CARGA,'
      '  NR_TRANSIT_TIME = :NR_TRANSIT_TIME,'
      '  DT_ABERTURA_GATE = :DT_ABERTURA_GATE,'
      '  DT_PREVISTA_ORIGEM_DESTINO = :DT_PREVISTA_ORIGEM_DESTINO,'
      '  NR_VIAGEM_ARMADOR = :NR_VIAGEM_ARMADOR,'
      '  DT_DEADLINE_IMO = :DT_DEADLINE_IMO,'
      '  DT_DEADLINE_CARTA_TEMP = :DT_DEADLINE_CARTA_TEMP,'
      '  HR_DEADLINE_CARTA_TEMP = :HR_DEADLINE_CARTA_TEMP,'
      '  HR_DEADLINE_BL = :HR_DEADLINE_BL,'
      '  HR_DEADLINE_CARGA = :HR_DEADLINE_CARGA,'
      '  HR_DEADLINE_IMO = :HR_DEADLINE_IMO,'
      '  HR_ABERTURA_GATE = :HR_ABERTURA_GATE,'
      '  CD_CRIADOR_VIAGEM = :CD_CRIADOR_VIAGEM  '
      'where'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_EMBARCACAO = :OLD_CD_EMBARCACAO and'
      '  NR_VIAGEM = :OLD_NR_VIAGEM')
    InsertSQL.Strings = (
      'insert into TVIAGEM'
      
        '  (CD_UNID_NEG, CD_PRODUTO, CD_EMBARCACAO, NR_VIAGEM, DT_ESPERAD' +
        'A, DT_ENT, '
      
        '   CD_ARMAZEM_ATRACACAO, NR_MANIFESTO, IN_TRANSBORDO, CD_LOCAL, ' +
        'CD_CIDADE, '
      
        '   CD_UF, CD_PAIS, TX_BANDEIRA, NR_FONTE, DT_DEADLINE_BL, DT_DEA' +
        'DLINE_CARGA, '
      
        '   NR_TRANSIT_TIME, DT_ABERTURA_GATE, DT_PREVISTA_ORIGEM_DESTINO' +
        ', NR_VIAGEM_ARMADOR, '
      
        '   DT_DEADLINE_IMO, DT_DEADLINE_CARTA_TEMP, HR_DEADLINE_CARTA_TE' +
        'MP, HR_DEADLINE_BL, '
      
        '   HR_DEADLINE_CARGA, HR_DEADLINE_IMO, HR_ABERTURA_GATE, CD_CRIA' +
        'DOR_VIAGEM)'
      'values'
      
        '  (:CD_UNID_NEG, :CD_PRODUTO, :CD_EMBARCACAO, :NR_VIAGEM, :DT_ES' +
        'PERADA, '
      
        '   :DT_ENT, :CD_ARMAZEM_ATRACACAO, :NR_MANIFESTO, :IN_TRANSBORDO' +
        ', :CD_LOCAL, '
      
        '   :CD_CIDADE, :CD_UF, :CD_PAIS, :TX_BANDEIRA, :NR_FONTE, :DT_DE' +
        'ADLINE_BL, '
      
        '   :DT_DEADLINE_CARGA, :NR_TRANSIT_TIME, :DT_ABERTURA_GATE, :DT_' +
        'PREVISTA_ORIGEM_DESTINO, '
      
        '   :NR_VIAGEM_ARMADOR, :DT_DEADLINE_IMO, :DT_DEADLINE_CARTA_TEMP' +
        ', :HR_DEADLINE_CARTA_TEMP, '
      
        '   :HR_DEADLINE_BL, :HR_DEADLINE_CARGA, :HR_DEADLINE_IMO, :HR_AB' +
        'ERTURA_GATE, '
      '   :CD_CRIADOR_VIAGEM)')
    DeleteSQL.Strings = (
      'delete from TVIAGEM'
      'where'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_EMBARCACAO = :OLD_CD_EMBARCACAO and'
      '  NR_VIAGEM = :OLD_NR_VIAGEM')
    Left = 162
    Top = 11
  end
end

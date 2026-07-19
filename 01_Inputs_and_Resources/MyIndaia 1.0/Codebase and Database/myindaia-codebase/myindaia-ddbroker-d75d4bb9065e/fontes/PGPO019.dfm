object datm_po_flp: Tdatm_po_flp
  OldCreateOrder = True
  OnCreate = datm_po_flpCreate
  Left = 200
  Top = 143
  Height = 371
  Width = 441
  object ds_po: TDataSource
    DataSet = qry_po_
    Left = 31
    Top = 5
  end
  object qry_po_: TQuery
    AfterOpen = qry_po_AfterOpen
    AfterClose = qry_po_AfterClose
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT '
      '       P.NR_PROCESSO, P.CD_IMPORTADOR, P.CD_SERVICO,'
      '       F.NR_PROCESSO_INDAIA, F.CD_UNID_NEG, F.CD_PRODUTO,'
      '       C.AP_EMPRESA, S.NM_SERVICO, PR.NR_PROCESSO'
      'FROM TPO P ( NOLOCK )'
      
        '     LEFT JOIN TPROCESSO PR    ( NOLOCK ) ON P.NR_PROCESSO   = P' +
        'R.NR_REFERENCIA'
      
        '     LEFT JOIN TFLP_PO F       ( NOLOCK ) ON P.NR_PROCESSO   = F' +
        '.NR_PROCESSO'
      
        '     LEFT JOIN TEMPRESA_NAC C  ( NOLOCK ) ON P.CD_IMPORTADOR = C' +
        '.CD_EMPRESA'
      
        '     LEFT JOIN TSERVICO S      ( NOLOCK ) ON P.CD_SERVICO    = S' +
        '.CD_SERVICO'
      'WHERE ( P.NR_PROCESSO = :NR_PROCESSO )')
    Left = 102
    Top = 5
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_po_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_po_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Size = 5
    end
    object qry_po_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qry_po_NR_PROCESSO_INDAIA: TStringField
      FieldName = 'NR_PROCESSO_INDAIA'
      Size = 18
    end
    object qry_po_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_po_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_po_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_po_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Size = 50
    end
    object qry_po_NR_PROCESSO_1: TStringField
      FieldName = 'NR_PROCESSO_1'
      Size = 18
    end
  end
  object ds_po_item: TDataSource
    DataSet = qry_po_item_
    Left = 31
    Top = 50
  end
  object qry_po_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_ITEM, NR_ITEM_CLIENTE '
      'FROM TPO_ITEM ( NOLOCK )'
      'WHERE ( NR_PROCESSO = :NR_PROCESSO )')
    Left = 102
    Top = 50
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_po_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_po_item_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPO_ITEM.NR_PROCESSO'
      Size = 3
    end
    object qry_po_item_NR_ITEM_CLIENTE: TStringField
      FieldName = 'NR_ITEM_CLIENTE'
      Origin = 'TPO_ITEM.NR_PROCESSO'
      Size = 4
    end
  end
  object ds_flp_po: TDataSource
    DataSet = qry_flp_po_
    Left = 31
    Top = 95
  end
  object qry_flp_po_: TQuery
    CachedUpdates = True
    BeforePost = qry_flp_po_BeforePost
    AfterPost = qry_flp_po_AfterPost
    AfterDelete = qry_flp_po_AfterDelete
    AfterScroll = qry_flp_po_AfterScroll
    OnCalcFields = qry_flp_po_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT F.NR_PROCESSO, F.CD_EVENTO, F.CD_RESP_REALIZACAO, F.DT_RE' +
        'ALIZACAO,'
      '  F.DT_PREVISTA, F.DT_LIMITE, E.NM_EVENTO, U.AP_USUARIO,'
      '  CASE F.IN_APLICAVEL WHEN '#39'1'#39' THEN '#39#252#39' ELSE '#39#39' END IN_APLICAVEL'
      'FROM TFLP_PO F (NOLOCK)'
      '  INNER JOIN TEVENTO E (NOLOCK) ON (E.CD_EVENTO = F.CD_EVENTO)'
      
        '  INNER JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = F.CD_RESP_RE' +
        'ALIZACAO)'
      'WHERE F.NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY F.NR_ORDEM')
    UpdateObject = upd_flp_po
    Left = 102
    Top = 95
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_flp_po_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFLP_PO.NR_PROCESSO'
      Size = 18
    end
    object qry_flp_po_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TFLP_PO.CD_EVENTO'
      Size = 3
    end
    object qry_flp_po_NM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      FixedChar = True
      Size = 50
    end
    object qry_flp_po_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'TFLP_PO.DT_REALIZACAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_flp_po_DT_PREVISTA: TDateTimeField
      FieldName = 'DT_PREVISTA'
      Origin = 'TFLP_PO.DT_PREVISTA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_flp_po_DT_LIMITE: TDateTimeField
      FieldName = 'DT_LIMITE'
      Origin = 'TFLP_PO.DT_LIMITE'
    end
    object qry_flp_po_IN_APLICAVEL: TStringField
      FieldName = 'IN_APLICAVEL'
      Origin = 'TFLP_PO.IN_APLICAVEL'
      Size = 1
    end
    object qry_flp_po_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      FixedChar = True
      Size = 15
    end
    object qry_flp_po_CD_RESP_REALIZACAO: TStringField
      FieldName = 'CD_RESP_REALIZACAO'
      Origin = 'TFLP_PO.CD_RESP_REALIZACAO'
      Size = 4
    end
    object qry_flp_po_CalcAtrazado: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcAtrazado'
      Size = 10
      Calculated = True
    end
    object qry_flp_po_CalcDiferencaDias: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcDiferencaDias'
      Size = 5
      Calculated = True
    end
  end
  object ds_flp_po_item: TDataSource
    DataSet = qry_flp_po_item_
    Left = 31
    Top = 140
  end
  object qry_flp_po_item_: TQuery
    CachedUpdates = True
    BeforePost = qry_flp_po_item_BeforePost
    AfterPost = qry_flp_po_item_AfterPost
    AfterDelete = qry_flp_po_item_AfterDelete
    AfterScroll = qry_flp_po_item_AfterScroll
    OnCalcFields = qry_flp_po_item_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT I.NR_PROCESSO, NR_ITEM, I.CD_EVENTO, I.CD_RESP_REALIZACAO' +
        ', I.DT_REALIZACAO,'
      
        '  I.DT_PREVISTA, I.DT_LIMITE, I.NR_ITEM_CLIENTE, E.NM_EVENTO, U.' +
        'AP_USUARIO,'
      '  CASE I.IN_APLICAVEL WHEN '#39'1'#39' THEN '#39#252#39' ELSE '#39#39' END IN_APLICAVEL'
      'FROM TFLP_PO_ITEM I (NOLOCK)'
      '  INNER JOIN TEVENTO E (NOLOCK) ON (E.CD_EVENTO = I.CD_EVENTO)'
      
        '  INNER JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = I.CD_RESP_RE' +
        'ALIZACAO)'
      'WHERE I.NR_PROCESSO = :NR_PROCESSO'
      '  AND I.NR_ITEM     = :NR_ITEM'
      'ORDER BY I.NR_ORDEM')
    UpdateObject = upd_flp_po_item
    Left = 102
    Top = 140
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
    object qry_flp_po_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFLP_PO_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_flp_po_item_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TFLP_PO_ITEM.NR_PROCESSO'
      Size = 3
    end
    object qry_flp_po_item_NR_ITEM_CLIENTE: TStringField
      FieldName = 'NR_ITEM_CLIENTE'
      Origin = 'TFLP_PO_ITEM.NR_ITEM'
      Size = 4
    end
    object qry_flp_po_item_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TFLP_PO_ITEM.CD_EVENTO'
      Size = 3
    end
    object qry_flp_po_item_NM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      FixedChar = True
      Size = 50
    end
    object qry_flp_po_item_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'TFLP_PO_ITEM.DT_REALIZACAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_flp_po_item_DT_PREVISTA: TDateTimeField
      FieldName = 'DT_PREVISTA'
      Origin = 'TFLP_PO_ITEM.DT_PREVISTA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_flp_po_item_DT_LIMITE: TDateTimeField
      FieldName = 'DT_LIMITE'
      Origin = 'TFLP_PO_ITEM.DT_LIMITE'
    end
    object qry_flp_po_item_IN_APLICAVEL: TStringField
      FieldName = 'IN_APLICAVEL'
      Origin = 'TFLP_PO_ITEM.IN_APLICAVEL'
      Size = 1
    end
    object qry_flp_po_item_CD_RESP_REALIZACAO: TStringField
      FieldName = 'CD_RESP_REALIZACAO'
      Origin = 'TFLP_PO_ITEM.CD_RESP_REALIZACAO'
      Size = 4
    end
    object qry_flp_po_item_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      FixedChar = True
      Size = 15
    end
    object qry_flp_po_item_CalcAtrazado: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcAtrazado'
      Size = 10
      Calculated = True
    end
    object qry_flp_po_item_CalcDiferencaDias: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcDiferencaDias'
      Size = 5
      Calculated = True
    end
  end
  object qry_evento_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EVENTO, NM_EVENTO'
      'FROM TEVENTO ( NOLOCK )')
    Left = 249
    Top = 185
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
  object ds_po_edita_: TDataSource
    DataSet = qry_po_edita_
    Left = 249
    Top = 5
  end
  object qry_po_edita_: TQuery
    BeforeClose = qry_po_edita_BeforeClose
    AfterScroll = qry_po_edita_AfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_po
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO,'
      '       CD_CANAL'
      'FROM TPO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 345
    Top = 5
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_po_edita_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO.NR_PROCESSO'
      Size = 18
    end
    object qry_po_edita_CD_CANAL: TStringField
      FieldName = 'CD_CANAL'
      Origin = 'TPO.CD_CANAL'
      Size = 1
    end
  end
  object sp_atz_flp_po: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_flp_po'
    Left = 31
    Top = 230
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
      end>
  end
  object sp_atz_obs_flp_po: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_obs_flp_po'
    Left = 102
    Top = 243
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
      end>
  end
  object sp_atz_flp_po_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_flp_po_item'
    Left = 31
    Top = 275
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
  object sp_atz_obs_flp_po_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'sp_atz_obs_flp_po_item'
    Left = 102
    Top = 288
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
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG,'
      '       AP_UNID_NEG,'
      '       IN_ATIVO'
      'FROM TUNID_NEG ( NOLOCK )'
      'WHERE CD_UNID_NEG IN '
      '              ( SELECT CD_UNID_NEG '
      '                FROM TUSUARIO_HABILITACAO ( NOLOCK )'
      '                WHERE CD_USUARIO = :CD_USUARIO )')
    Left = 249
    Top = 140
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
      'SELECT CD_USUARIO,'
      '       CD_UNID_NEG,'
      '       CD_PRODUTO,'
      '       IN_ATIVO'
      'FROM TUSUARIO_HABILITACAO ( NOLOCK )'
      'WHERE CD_USUARIO  = :CD_USUARIO'
      '  AND CD_UNID_NEG = :CD_UNID_NEG'
      '  AND CD_PRODUTO  = :CD_PRODUTO')
    Left = 249
    Top = 275
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
  object qry_flp_po_pesq_ev_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_flp_po
    SQL.Strings = (
      'SELECT F.NR_PROCESSO,'
      '       F.CD_EVENTO,'
      '       E.NM_EVENTO'
      'FROM   TFLP_PO F ( NOLOCK ), TEVENTO E ( NOLOCK )'
      'WHERE  ( F.NR_PROCESSO = :NR_PROCESSO )'
      '  AND  ( F.CD_EVENTO   = E.CD_EVENTO )'
      'ORDER BY NR_ORDEM')
    Left = 249
    Top = 230
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_flp_po_pesq_ev_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_flp_po_pesq_ev_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Size = 3
    end
    object qry_flp_po_pesq_ev_NM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      Size = 50
    end
  end
  object qry_status_flp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_STATUS_FLP,'
      '       NM_STATUS_FLP'
      'FROM   TSTATUS_FLP ( NOLOCK )'
      'WHERE  CD_STATUS_FLP = :CD_STATUS_FLP')
    Left = 345
    Top = 275
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_STATUS_FLP'
        ParamType = ptUnknown
      end>
    object qry_status_flp_CD_STATUS_FLP: TStringField
      FieldName = 'CD_STATUS_FLP'
      Origin = 'TSTATUS_FLP.CD_STATUS_FLP'
      Size = 1
    end
    object qry_status_flp_NM_STATUS_FLP: TStringField
      FieldName = 'NM_STATUS_FLP'
      Origin = 'TSTATUS_FLP.NM_STATUS_FLP'
    end
  end
  object qry_flp_po_item_pesq_ev_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_flp_po_item
    SQL.Strings = (
      'SELECT F.NR_PROCESSO,'
      '       F.NR_ITEM,'
      '       F.CD_EVENTO,'
      '       E.NM_EVENTO'
      'FROM TFLP_PO_ITEM F ( NOLOCK ), TEVENTO E ( NOLOCK )'
      'WHERE ( F.NR_PROCESSO = :NR_PROCESSO )'
      '  AND ( F.NR_ITEM     = :NR_ITEM )'
      '  AND ( F.CD_EVENTO   = E.CD_EVENTO )'
      'ORDER BY NR_ORDEM')
    Left = 345
    Top = 230
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
    object qry_flp_po_item_pesq_ev_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_flp_po_item_pesq_ev_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
    object qry_flp_po_item_pesq_ev_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Size = 3
    end
    object qry_flp_po_item_pesq_ev_NM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      Size = 50
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO,'
      '       AP_PRODUTO,'
      '       IN_ATIVO'
      'FROM TPRODUTO ( NOLOCK )'
      'WHERE CD_PRODUTO IN ( SELECT CD_PRODUTO'
      '                      FROM TUSUARIO_HABILITACAO ( NOLOCK )'
      '                      WHERE CD_USUARIO = :CD_USUARIO )')
    Left = 345
    Top = 140
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
  object sp_atz_ev_flp_po: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_ev_flp_po'
    Left = 169
    Top = 230
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
  object qry_atz_obs_po_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT TX_OBS'
      'FROM TFLP_PO'
      'WHERE ( NR_PROCESSO = :NR_PROCESSO )'
      '  AND ( CD_EVENTO   = :CD_EVENTO )')
    Left = 345
    Top = 50
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
    object qry_atz_obs_po_TX_OBS: TMemoField
      FieldName = 'TX_OBS'
      Origin = 'TFLP_PO.TX_OBS'
      BlobType = ftMemo
    end
  end
  object qry_atz_obs_po_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TX_OBS'
      'FROM TFLP_PO_ITEM'
      'WHERE ( NR_PROCESSO = :NR_PROCESSO )'
      '  AND ( NR_ITEM     = :NR_ITEM )'
      '  AND ( CD_EVENTO   = :CD_EVENTO )')
    Left = 345
    Top = 95
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
      end
      item
        DataType = ftString
        Name = 'CD_EVENTO'
        ParamType = ptUnknown
      end>
    object qry_atz_obs_po_item_TX_OBS: TMemoField
      FieldName = 'TX_OBS'
      Origin = 'TFLP_PO_ITEM.TX_OBS'
      BlobType = ftMemo
    end
  end
  object ds_atz_obs_po: TDataSource
    DataSet = qry_atz_obs_po_
    Left = 249
    Top = 50
  end
  object ds_atz_obs_po_item: TDataSource
    DataSet = qry_atz_obs_po_item_
    Left = 249
    Top = 95
  end
  object sp_atz_ev_flp_po_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_ev_flp_po_item'
    Left = 169
    Top = 275
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
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_REFERENCIA'
      'FROM TPROCESSO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 345
    Top = 185
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_REFERENCIA: TStringField
      FieldName = 'NR_REFERENCIA'
      Origin = 'TPROCESSO.NR_REFERENCIA'
      Size = 18
    end
  end
  object dsFlpPoItemEtapa: TDataSource
    DataSet = qryFlpPoItemEtapa
    Left = 31
    Top = 185
  end
  object qryFlpPoItemEtapa: TQuery
    CachedUpdates = True
    AfterPost = qryFlpPoItemEtapaAfterPost
    AfterDelete = qryFlpPoItemEtapaAfterDelete
    DatabaseName = 'DBBROKER'
    DataSource = ds_flp_po_item
    RequestLive = True
    SQL.Strings = (
      'SELECT F.NR_PROCESSO, F.NR_ITEM, F.CD_FLP_PO_ITEM_ETAPA,'
      
        '       F.CD_ETAPA, F.CD_USUARIO, F.DT_ALTERACAO, E.NM_ETAPA, U.A' +
        'P_USUARIO'
      
        '  FROM TFLP_PO_ITEM_ETAPA F (NOLOCK), TETAPA E (NOLOCK), TUSUARI' +
        'O U (NOLOCK)'
      ' WHERE F.NR_PROCESSO = :nr_processo'
      '   AND F.NR_ITEM     = :nr_item'
      '   AND F.CD_ETAPA   *= E.CD_ETAPA'
      '   AND F.CD_USUARIO *= U.CD_USUARIO'
      ' ORDER BY F.CD_FLP_PO_ITEM_ETAPA'
      '')
    UpdateObject = updFlpPoItemEtapa
    Left = 102
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryFlpPoItemEtapaNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryFlpPoItemEtapaNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      FixedChar = True
      Size = 18
    end
    object qryFlpPoItemEtapaCD_FLP_PO_ITEM_ETAPA: TIntegerField
      FieldName = 'CD_FLP_PO_ITEM_ETAPA'
    end
    object qryFlpPoItemEtapaCD_ETAPA: TIntegerField
      FieldName = 'CD_ETAPA'
    end
    object qryFlpPoItemEtapaCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryFlpPoItemEtapaDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
    object qryFlpPoItemEtapaNM_ETAPA: TStringField
      FieldName = 'NM_ETAPA'
      FixedChar = True
      Size = 50
    end
    object qryFlpPoItemEtapaAP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      FixedChar = True
      Size = 15
    end
  end
  object updFlpPoItemEtapa: TUpdateSQL
    ModifySQL.Strings = (
      'update TFLP_PO_ITEM_ETAPA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ITEM = :NR_ITEM,'
      '  CD_FLP_PO_ITEM_ETAPA = :CD_FLP_PO_ITEM_ETAPA,'
      '  CD_ETAPA = :CD_ETAPA,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  DT_ALTERACAO = :DT_ALTERACAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  CD_FLP_PO_ITEM_ETAPA = :OLD_CD_FLP_PO_ITEM_ETAPA')
    InsertSQL.Strings = (
      'insert into TFLP_PO_ITEM_ETAPA'
      
        '  (NR_PROCESSO, NR_ITEM, CD_FLP_PO_ITEM_ETAPA, CD_ETAPA, CD_USUA' +
        'RIO, DT_ALTERACAO)'
      'values'
      
        '  (:NR_PROCESSO, :NR_ITEM, :CD_FLP_PO_ITEM_ETAPA, :CD_ETAPA, :CD' +
        '_USUARIO, '
      '   :DT_ALTERACAO)')
    DeleteSQL.Strings = (
      'delete from TFLP_PO_ITEM_ETAPA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  CD_FLP_PO_ITEM_ETAPA = :OLD_CD_FLP_PO_ITEM_ETAPA')
    Left = 169
    Top = 185
  end
  object upd_flp_po: TUpdateSQL
    Left = 169
    Top = 95
  end
  object upd_flp_po_item: TUpdateSQL
    Left = 169
    Top = 140
  end
end

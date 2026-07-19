object datm_proc_realiza: Tdatm_proc_realiza
  OldCreateOrder = True
  OnCreate = datm_proc_realizaCreate
  Left = 306
  Top = 152
  Height = 388
  Width = 489
  object qry_processo_: TQuery
    AfterOpen = qry_processo_AfterOpen
    AfterClose = qry_processo_AfterClose
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.NR_PROCESSO, P.NR_PROCESSO_VINC, P.CD_UNID_NEG, '
      '               P.CD_PRODUTO, P.CD_CLIENTE, P.CD_SERVICO, '
      
        '               P.IN_LIBERADO, P.IN_CANCELADO, P.IN_PRODUCAO, P.I' +
        'N_IMPORTANTE,'
      '               C.AP_EMPRESA, S.NM_SERVICO'
      'FROM TPROCESSO P, TEMPRESA_NAC C, TSERVICO S'
      'WHERE (P.CD_CLIENTE *= C.CD_EMPRESA) AND'
      '              (P.CD_SERVICO *= S.CD_SERVICO) AND'
      '              (P.NR_PROCESSO = :NR_PROCESSO)')
    Left = 122
    Top = 21
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
    object qry_processo_NR_PROCESSO_VINC: TStringField
      FieldName = 'NR_PROCESSO_VINC'
      Size = 14
    end
    object qry_processo_IN_IMPORTANTE: TStringField
      FieldName = 'IN_IMPORTANTE'
      Size = 1
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 37
    Top = 21
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
    Left = 237
    Top = 21
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
    Left = 237
    Top = 81
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
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO IN '
      '              ( SELECT CD_PRODUTO'
      '                FROM TUSUARIO_HABILITACAO'
      '                WHERE CD_USUARIO = :CD_USUARIO )')
    Left = 341
    Top = 21
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
  object qry_tfollowup_: TQuery
    BeforeOpen = qry_tfollowup_BeforeOpen
    AfterClose = qry_tfollowup_AfterClose
    BeforePost = qry_tfollowup_BeforePost
    AfterPost = qry_tfollowup_AfterPost
    AfterScroll = qry_tfollowup_AfterScroll
    OnCalcFields = qry_tfollowup_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_SERVICO, CD_EVENTO, CD_RESP_REALIZACAO, D' +
        'T_REALIZACAO, IN_APLICAVEL, CD_RESP_INSPECAO, DT_INSPECAO, CD_RE' +
        'SULT_INSPECAO, CD_RESP_APLICACAO, DT_APLICACAO, DT_PREVISTA, DT_' +
        'LIMITE, TX_OBS, IN_BLOQUEADO'
      'FROM TFOLLOWUP'
      'WHERE (NR_PROCESSO = :NR_PROCESSO) AND'
      '               (CD_SERVICO = :CD_SERVICO)'
      'ORDER BY NR_ORDEM'
      '')
    Left = 122
    Top = 81
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
    object qry_tfollowup_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 18
    end
    object qry_tfollowup_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TFOLLOWUP.CD_SERVICO'
      Size = 3
    end
    object qry_tfollowup_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TFOLLOWUP.CD_EVENTO'
      Size = 3
    end
    object qry_tfollowup_DT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      OnChange = qry_tfollowup_DT_REALIZACAOChange
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_tfollowup_IN_APLICAVEL: TStringField
      FieldName = 'IN_APLICAVEL'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      OnChange = qry_tfollowup_IN_APLICAVELChange
      Size = 1
    end
    object qry_tfollowup_Look_Evento: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Evento'
      LookupDataSet = qry_tevento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EVENTO'
      Size = 50
      Lookup = True
    end
    object qry_tfollowup_CD_RESP_INSPECAO: TStringField
      FieldName = 'CD_RESP_INSPECAO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 4
    end
    object qry_tfollowup_DT_INSPECAO: TDateTimeField
      FieldName = 'DT_INSPECAO'
      Origin = 'TFOLLOWUP.CD_SERVICO'
    end
    object qry_tfollowup_CD_RESULT_INSPECAO: TStringField
      FieldName = 'CD_RESULT_INSPECAO'
      Origin = 'TFOLLOWUP.CD_EVENTO'
      Size = 1
    end
    object qry_tfollowup_CD_RESP_REALIZACAO: TStringField
      FieldName = 'CD_RESP_REALIZACAO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 4
    end
    object qry_tfollowup_CD_RESP_APLICACAO: TStringField
      FieldName = 'CD_RESP_APLICACAO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 4
    end
    object qry_tfollowup_DT_APLICACAO: TDateTimeField
      FieldName = 'DT_APLICACAO'
      Origin = 'TFOLLOWUP.CD_SERVICO'
    end
    object qry_tfollowup_CalcAtrazado: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcAtrazado'
      Size = 10
      Calculated = True
    end
    object qry_tfollowup_DT_PREVISTA: TDateTimeField
      FieldName = 'DT_PREVISTA'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
    end
    object qry_tfollowup_DT_LIMITE: TDateTimeField
      FieldName = 'DT_LIMITE'
      Origin = 'TFOLLOWUP.CD_SERVICO'
    end
    object qry_tfollowup_TX_OBS: TMemoField
      FieldName = 'TX_OBS'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      BlobType = ftMemo
    end
    object qry_tfollowup_IN_BLOQUEADO: TStringField
      FieldName = 'IN_BLOQUEADO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 1
    end
    object qry_tfollowup_CalcBloqueado: TStringField
      DisplayLabel = 'CalcBloqueado'
      FieldKind = fkCalculated
      FieldName = 'CAlcBloqueado'
      Size = 1
      Calculated = True
    end
    object qry_tfollowup_IN_EDITA: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_IN_EDITA'
      LookupDataSet = vw_in_edita_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'IN_EDITA'
      KeyFields = 'CD_EVENTO'
      Lookup = True
    end
  end
  object ds_tfollowup: TDataSource
    DataSet = qry_tfollowup_
    Left = 37
    Top = 81
  end
  object qry_tevento_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EVENTO, NM_EVENTO'
      'FROM TEVENTO')
    Left = 341
    Top = 81
    object qry_tevento_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TEVENTO.CD_EVENTO'
      Size = 3
    end
    object qry_tevento_NM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      Origin = 'TEVENTO.NM_EVENTO'
      Size = 50
    end
  end
  object sp_atz_followup: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_followup'
    Left = 237
    Top = 138
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
  object qry_tp_canal_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CANAL, NM_CANAL'
      'FROM TTP_CANAL'
      'WHERE CD_CANAL <> 6'
      'ORDER BY NM_CANAL')
    Left = 341
    Top = 138
    object qry_tp_canal_CD_CANAL: TStringField
      FieldName = 'CD_CANAL'
      Origin = 'TTP_CANAL.CD_CANAL'
      Size = 1
    end
    object qry_tp_canal_NM_CANAL: TStringField
      FieldName = 'NM_CANAL'
      Origin = 'TTP_CANAL.NM_CANAL'
      Size = 10
    end
  end
  object qry_proc_edita_: TQuery
    BeforeClose = qry_proc_edita_BeforeClose
    AfterScroll = qry_proc_edita_AfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_CANAL'
      'FROM   TPROCESSO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 122
    Top = 138
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_proc_edita_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_proc_edita_CD_CANAL: TStringField
      FieldName = 'CD_CANAL'
      Origin = 'TPROCESSO.CD_CANAL'
      Size = 1
    end
    object qry_proc_edita_LookCanal: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCanal'
      LookupDataSet = qry_tp_canal_
      LookupKeyFields = 'CD_CANAL'
      LookupResultField = 'NM_CANAL'
      KeyFields = 'CD_CANAL'
      Size = 10
      Lookup = True
    end
  end
  object ds_proc_edita: TDataSource
    DataSet = qry_proc_edita_
    Left = 37
    Top = 138
  end
  object qry_atz_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TDECLARACAO_IMPORTACAO'
      'SET DT_CHEGADA_CARGA = :DT_CHEGADA'
      'WHERE NR_PROCESSO = :NR_PROCESSO         ')
    Left = 34
    Top = 194
    ParamData = <
      item
        DataType = ftString
        Name = 'DT_CHEGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object StringField2: TStringField
      FieldName = 'CD_CANAL'
      Origin = 'TPROCESSO.CD_CANAL'
      Size = 1
    end
    object StringField3: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCanal'
      LookupDataSet = qry_tp_canal_
      LookupKeyFields = 'CD_CANAL'
      LookupResultField = 'NM_CANAL'
      KeyFields = 'CD_CANAL'
      Size = 10
      Lookup = True
    end
  end
  object sp_atz_obs_followup: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_obs_followup'
    Left = 122
    Top = 194
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
  object qry_flp_pesq_ev_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_tfollowup
    SQL.Strings = (
      'SELECT F.NR_PROCESSO, F.CD_SERVICO, F.CD_EVENTO, E.NM_EVENTO'
      'FROM   TFOLLOWUP F, TEVENTO E'
      'WHERE  ( F.NR_PROCESSO = :NR_PROCESSO ) AND'
      '       ( F.CD_SERVICO = :CD_SERVICO ) AND'
      '       ( F.CD_EVENTO = E.CD_EVENTO )'
      'ORDER BY NR_ORDEM')
    Left = 122
    Top = 249
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end>
    object qry_flp_pesq_ev_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 18
    end
    object qry_flp_pesq_ev_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TFOLLOWUP.CD_SERVICO'
      Size = 3
    end
    object qry_flp_pesq_ev_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TFOLLOWUP.CD_EVENTO'
      Size = 3
    end
    object qry_flp_pesq_ev_NM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      Origin = 'TEVENTO.NM_EVENTO'
      Size = 50
    end
  end
  object vw_in_edita_evento_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM VW_IN_EDITA_EVENTO')
    Left = 240
    Top = 198
    object vw_in_edita_evento_IN_EDITA: TStringField
      FieldName = 'IN_EDITA'
      Origin = 'VW_IN_EDITA_EVENTO.IN_EDITA'
      Size = 1
    end
    object vw_in_edita_evento_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'VW_IN_EDITA_EVENTO.CD_EVENTO'
      Size = 3
    end
  end
  object sp_ev_prev_fabrica: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_ev_prev_fabrica'
    Left = 239
    Top = 250
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
        Name = '@cd_evento'
        ParamType = ptInput
      end>
  end
  object ds_processo_aux: TDataSource
    DataSet = qry_processo_aux_
    Left = 40
    Top = 304
  end
  object qry_processo_aux_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT  *'
      'FROM TPROCESSO P'
      'WHERE NR_PROCESSO =  :NR_PROCESSO')
    Left = 240
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_aux_IN_IMPORTANTE: TStringField
      FieldName = 'IN_IMPORTANTE'
      Size = 1
    end
  end
  object sp_ev_prev_emb: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_ev_prev_emb'
    Left = 344
    Top = 192
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
end

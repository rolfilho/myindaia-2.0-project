object datm_proc_vinc_realiza: Tdatm_proc_vinc_realiza
  Left = 421
  Top = 214
  Height = 172
  Width = 262
  object qry_tfollowup_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_EVENTO, DT_REALIZACAO'
      'FROM TFOLLOWUP'
      'WHERE (NR_PROCESSO = :NR_PROCESSO_VINC) AND'
      '               (CD_SERVICO = :CD_SERVICO)'
      'ORDER BY NR_ORDEM')
    Params.Data = {
      01000200104E525F50524F434553534F5F56494E4300010200300000000A4344
      5F5345525649434F0001020030000000}
    Left = 31
    Top = 69
    object qry_tfollowup_NR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TFOLLOWUP.NR_PROCESSO'
      Size = 18
    end
    object qry_tfollowup_CD_EVENTO: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_EVENTO'
      Origin = 'TFOLLOWUP.CD_EVENTO'
      Size = 3
    end
    object qry_tfollowup_DT_REALIZACAO: TDateTimeField
      DisplayLabel = 'Data Realização'
      FieldName = 'DT_REALIZACAO'
      Origin = 'TFOLLOWUP.DT_REALIZACAO'
      EditMask = '!99/99/0000;1; '
    end
    object qry_tfollowup_LookEvento: TStringField
      DisplayLabel = 'Evento'
      FieldName = 'LookEvento'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EVENTO'
      Size = 50
      Lookup = True
    end
  end
  object ds_tfollowup: TDataSource
    DataSet = qry_tfollowup_
    Left = 103
    Top = 69
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG_VINC, CD_PRODUTO_VINC, '
      '               NR_PROCESSO_VINC'
      'FROM TPROCESSO '
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 31
    Top = 5
    object qry_processo_CD_UNID_NEG_VINC: TStringField
      FieldName = 'CD_UNID_NEG_VINC'
      Origin = 'TPROCESSO.CD_UNID_NEG_VINC'
      Size = 2
    end
    object qry_processo_CD_PRODUTO_VINC: TStringField
      FieldName = 'CD_PRODUTO_VINC'
      Origin = 'TPROCESSO.CD_PRODUTO_VINC'
      Size = 2
    end
    object qry_processo_NR_PROCESSO_VINC: TStringField
      FieldName = 'NR_PROCESSO_VINC'
      Origin = 'TPROCESSO.NR_PROCESSO_VINC'
      Size = 14
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 104
    Top = 6
  end
  object qry_evento_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EVENTO, NM_EVENTO'
      'FROM TEVENTO')
    Left = 175
    Top = 6
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
end

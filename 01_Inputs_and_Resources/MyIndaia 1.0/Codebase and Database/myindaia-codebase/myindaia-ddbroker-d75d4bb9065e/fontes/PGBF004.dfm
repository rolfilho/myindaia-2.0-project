object datm_exp_leitura_nf: Tdatm_exp_leitura_nf
  OldCreateOrder = True
  Left = 328
  Top = 230
  Height = 169
  Width = 349
  object qry_exp_itens_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_PROC_PE, CD_MERCADORIA '
      'FROM  TPROCESSO_EXP_ITEM'
      'WHERE NR_PROC_PE = :NR_PROC_PE'
      '')
    Left = 38
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROC_PE'
        ParamType = ptUnknown
      end>
    object qry_exp_itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_itens_NR_PROC_PE: TStringField
      FieldName = 'NR_PROC_PE'
      Origin = 'TPROCESSO_EXP_ITEM.NR_PROC_PE'
      Size = 18
    end
  end
  object qry_exp_merc_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_MERCADORIA, NR_ITEM'
      'FROM TPROCESSO_EXP_ITEM'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '      CD_MERCADORIA = :CD_MERCADORIA'
      '    ')
    Left = 38
    Top = 82
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_exp_merc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_merc_CD_MERCADORIA: TStringField
      DisplayWidth = 40
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCADORIA_EXP.CD_MERCADORIA'
      Size = 40
    end
    object qry_exp_merc_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPROCESSO_EXP_ITEM.NR_PROCESSO'
      Size = 3
    end
  end
  object qry_exp_nf_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_NF'
      'FROM TPROCESSO_EXP_NF'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '               NR_NF = :NR_NF'
      '  ')
    Left = 133
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_NF'
        ParamType = ptUnknown
      end>
    object qry_exp_nf_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_NF.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_nf_NR_NF: TStringField
      FieldName = 'NR_NF'
      Origin = 'TPROCESSO_EXP_NF.NR_NF'
      Size = 10
    end
  end
  object qry_exp_nf_itens_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_NF, NR_ITEM'
      'FROM TPROCESSO_EXP_NF_ITEM'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '      NR_NF = :NR_NF AND'
      '      NR_ITEM = :NR_ITEM'
      '')
    Left = 232
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_NF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptUnknown
      end>
    object qry_exp_nf_itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO_EXP_NF_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_exp_nf_itens_NR_NF: TStringField
      FieldName = 'NR_NF'
      Origin = 'TPROCESSO_EXP_NF_ITEM.NR_NF'
      Size = 10
    end
    object qry_exp_nf_itens_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPROCESSO_EXP_NF_ITEM.NR_ITEM'
      Size = 3
    end
  end
  object ds_exp_nf: TDataSource
    DataSet = qry_exp_nf_
    Left = 133
    Top = 82
  end
  object ds_exp_nf_itens_: TDataSource
    DataSet = qry_exp_nf_itens_
    Left = 233
    Top = 82
  end
end

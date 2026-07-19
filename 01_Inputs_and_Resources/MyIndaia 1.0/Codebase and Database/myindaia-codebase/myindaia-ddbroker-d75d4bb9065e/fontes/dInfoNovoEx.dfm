object datm_info_novoex: Tdatm_info_novoex
  OldCreateOrder = False
  Left = 316
  Top = 107
  Height = 196
  Width = 119
  object qryREItensNovoEx: TQuery
    CachedUpdates = True
    AfterPost = qryREItensNovoExAfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  * '
      'FROM TPROCESSO_RE_ITENS_NOVOEX'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '')
    UpdateObject = updREItensNovoEx
    Left = 37
    Top = 6
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = '0102ER-000837-14'
      end>
    object qryREItensNovoExNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryREItensNovoExNR_RE: TStringField
      FieldName = 'NR_RE'
      EditMask = '00/0000000-000;0;_'
      FixedChar = True
      Size = 12
    end
    object qryREItensNovoExNR_NCM: TStringField
      FieldName = 'NR_NCM'
      EditMask = '0000.00.00-00;0;_'
      FixedChar = True
      Size = 11
    end
    object qryREItensNovoExTX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qryREItensNovoExVL_COND_VENDA: TFloatField
      FieldName = 'VL_COND_VENDA'
      DisplayFormat = '0.,00'
    end
    object qryREItensNovoExVL_LOCAL_EMB: TFloatField
      FieldName = 'VL_LOCAL_EMB'
      DisplayFormat = '0.,00'
    end
    object qryREItensNovoExQT_UNID_COMERC: TFloatField
      FieldName = 'QT_UNID_COMERC'
      DisplayFormat = '0.,000'
    end
    object qryREItensNovoExTX_UNID_COMERC: TMemoField
      FieldName = 'TX_UNID_COMERC'
      BlobType = ftMemo
    end
    object qryREItensNovoExQT_UNID_ESTAT: TFloatField
      FieldName = 'QT_UNID_ESTAT'
      DisplayFormat = '0.,000'
    end
    object qryREItensNovoExTX_UNID_ESTAT: TMemoField
      FieldName = 'TX_UNID_ESTAT'
      BlobType = ftMemo
    end
    object qryREItensNovoExQT_PESO_LIQ: TFloatField
      FieldName = 'QT_PESO_LIQ'
      DisplayFormat = '0.,00000'
    end
    object qryREItensNovoExTX_ENQUADRAMENTO: TMemoField
      FieldName = 'TX_ENQUADRAMENTO'
      BlobType = ftMemo
    end
    object qryREItensNovoExIN_ITEM_CO: TBooleanField
      FieldName = 'IN_ITEM_CO'
      Origin = 'DBBROKER.TPROCESSO_RE_ITENS_NOVOEX.TX_ENQUADRAMENTO'
    end
    object qryREItensNovoExNR_ITEM: TIntegerField
      FieldName = 'NR_ITEM'
      Origin = 'DBBROKER.TPROCESSO_RE_ITENS_NOVOEX.TX_MERCADORIA'
    end
  end
  object dsREitensNovoEx: TDataSource
    DataSet = qryREItensNovoEx
    Left = 39
    Top = 110
  end
  object updREItensNovoEx: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_RE_ITENS_NOVOEX'
      'set'
      '  IN_ITEM_CO = :IN_ITEM_CO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_RE = :OLD_NR_RE and'
      '  NR_ITEM = :OLD_NR_ITEM')
    InsertSQL.Strings = (
      'insert into TPROCESSO_RE_ITENS_NOVOEX'
      '  (IN_ITEM_CO)'
      'values'
      '  (:IN_ITEM_CO)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_RE_ITENS_NOVOEX'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_RE = :OLD_NR_RE and'
      '  NR_ITEM = :OLD_NR_ITEM')
    Left = 37
    Top = 54
  end
end

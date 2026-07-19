object datm_at_basf: Tdatm_at_basf
  OldCreateOrder = True
  Left = 445
  Top = 183
  Height = 301
  Width = 549
  object ds_at_basf: TDataSource
    DataSet = qry_at_basf_
    Left = 42
    Top = 62
  end
  object qry_at_basf_: TQuery
    CachedUpdates = True
    BeforePost = qry_at_basf_BeforePost
    OnCalcFields = qry_at_basf_CalcFields
    OnUpdateError = qry_at_basf_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TAT_BASF'
      'WHERE  NR_PEDIDO = :NR_PEDIDO')
    UpdateObject = us_at_basf
    Left = 143
    Top = 62
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PEDIDO'
        ParamType = ptUnknown
      end>
    object qry_at_basf_NR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      Origin = 'TAT_BASF.NR_PEDIDO'
      Size = 15
    end
    object qry_at_basf_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TAT_BASF.CD_AREA'
      Size = 2
    end
    object qry_at_basf_TP_AT_BASF: TStringField
      FieldName = 'TP_AT_BASF'
      Origin = 'TAT_BASF.TP_AT_BASF'
      Size = 1
    end
    object qry_at_basf_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TAT_BASF.CD_VIA_TRANSP'
      Size = 2
    end
    object qry_at_basf_DT_PEDIDO: TDateTimeField
      FieldName = 'DT_PEDIDO'
      Origin = 'TAT_BASF.DT_PEDIDO'
    end
    object qry_at_basf_IN_TRANSMISSAO: TStringField
      FieldName = 'IN_TRANSMISSAO'
      Origin = 'TAT_BASF.IN_TRANSMISSAO'
      Size = 1
    end
    object qry_at_basf_IN_FOLLOWUP: TStringField
      FieldName = 'IN_FOLLOWUP'
      Origin = 'TAT_BASF.IN_FOLLOWUP'
      Size = 1
    end
    object qry_at_basf_IN_REVISAO_FAT: TStringField
      FieldName = 'IN_REVISAO_FAT'
      Origin = 'TAT_BASF.NR_PEDIDO'
      Size = 1
    end
    object qry_at_basf_IN_DEMURRAGE: TStringField
      FieldName = 'IN_DEMURRAGE'
      Origin = 'TAT_BASF.CD_AREA'
      Size = 1
    end
    object qry_at_basf_IN_ENT_BASF: TStringField
      FieldName = 'IN_ENT_BASF'
      Origin = 'TAT_BASF.TP_AT_BASF'
      Size = 1
    end
    object qry_at_basf_IN_ENT_BSG: TStringField
      FieldName = 'IN_ENT_BSG'
      Origin = 'TAT_BASF.CD_VIA_TRANSP'
      Size = 1
    end
    object qry_at_basf_IN_CHEC_DOC: TStringField
      FieldName = 'IN_CHEC_DOC'
      Origin = 'TAT_BASF.DT_PEDIDO'
      Size = 1
    end
    object qry_at_basf_VL_TRANSMISSAO: TFloatField
      FieldName = 'VL_TRANSMISSAO'
      Origin = 'TAT_BASF.VL_TRANSMISSAO'
    end
    object qry_at_basf_VL_FOLLOWUP: TFloatField
      FieldName = 'VL_FOLLOWUP'
      Origin = 'TAT_BASF.VL_FOLLOWUP'
    end
    object qry_at_basf_VL_REVISAO_FAT: TFloatField
      FieldName = 'VL_REVISAO_FAT'
      Origin = 'TAT_BASF.IN_TRANSMISSAO'
    end
    object qry_at_basf_VL_DEMURRAGE: TFloatField
      FieldName = 'VL_DEMURRAGE'
      Origin = 'TAT_BASF.IN_FOLLOWUP'
    end
    object qry_at_basf_VL_ENT_BASF: TFloatField
      FieldName = 'VL_ENT_BASF'
      Origin = 'TAT_BASF.VL_TRANSMISSAO'
    end
    object qry_at_basf_VL_ENT_BSG: TFloatField
      FieldName = 'VL_ENT_BSG'
      Origin = 'TAT_BASF.VL_FOLLOWUP'
    end
    object qry_at_basf_VL_CHEC_DOC: TFloatField
      FieldName = 'VL_CHEC_DOC'
      Origin = 'TAT_BASF.IN_REVISAO_FAT'
    end
    object qry_at_basf_LookArea: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookArea'
      Size = 50
      Calculated = True
    end
    object qry_at_basf_CalcVlTransmissao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcVlTransmissao'
      Calculated = True
    end
    object qry_at_basf_CalcVlFollowup: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcVlFollowup'
      Calculated = True
    end
    object qry_at_basf_CalcVlRevisaoFat: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcVlRevisaoFat'
      Calculated = True
    end
    object qry_at_basf_CalcVlDemurrage: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcVlDemurrage'
      Calculated = True
    end
    object qry_at_basf_CalcVlEntBASF: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcVlEntBASF'
      Calculated = True
    end
    object qry_at_basf_CalcVlEntBSG: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcVlEntBSG'
      Calculated = True
    end
    object qry_at_basf_CalcVlChecDoc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcVlChecDoc'
      Calculated = True
    end
  end
  object us_at_basf: TUpdateSQL
    ModifySQL.Strings = (
      'update TAT_BASF'
      'set'
      '  NR_PEDIDO = :NR_PEDIDO,'
      '  CD_AREA = :CD_AREA,'
      '  TP_AT_BASF = :TP_AT_BASF,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  DT_PEDIDO = :DT_PEDIDO,'
      '  IN_TRANSMISSAO = :IN_TRANSMISSAO,'
      '  IN_FOLLOWUP = :IN_FOLLOWUP,'
      '  VL_TRANSMISSAO = :VL_TRANSMISSAO,'
      '  VL_FOLLOWUP = :VL_FOLLOWUP,'
      '  IN_REVISAO_FAT = :IN_REVISAO_FAT,'
      '  IN_DEMURRAGE = :IN_DEMURRAGE,'
      '  IN_ENT_BASF = :IN_ENT_BASF,'
      '  IN_ENT_BSG = :IN_ENT_BSG,'
      '  IN_CHEC_DOC = :IN_CHEC_DOC,'
      '  VL_REVISAO_FAT = :VL_REVISAO_FAT,'
      '  VL_DEMURRAGE = :VL_DEMURRAGE,'
      '  VL_ENT_BASF = :VL_ENT_BASF,'
      '  VL_ENT_BSG = :VL_ENT_BSG,'
      '  VL_CHEC_DOC = :VL_CHEC_DOC'
      'where'
      '  NR_PEDIDO = :OLD_NR_PEDIDO')
    InsertSQL.Strings = (
      'insert into TAT_BASF'
      
        '  (NR_PEDIDO, CD_AREA, TP_AT_BASF, CD_VIA_TRANSP, DT_PEDIDO, IN_' +
        'TRANSMISSAO, '
      
        '   IN_FOLLOWUP, VL_TRANSMISSAO, VL_FOLLOWUP, IN_REVISAO_FAT, IN_' +
        'DEMURRAGE, '
      
        '   IN_ENT_BASF, IN_ENT_BSG, IN_CHEC_DOC, VL_REVISAO_FAT, VL_DEMU' +
        'RRAGE, '
      '   VL_ENT_BASF, VL_ENT_BSG, VL_CHEC_DOC)'
      'values'
      
        '  (:NR_PEDIDO, :CD_AREA, :TP_AT_BASF, :CD_VIA_TRANSP, :DT_PEDIDO' +
        ', :IN_TRANSMISSAO, '
      
        '   :IN_FOLLOWUP, :VL_TRANSMISSAO, :VL_FOLLOWUP, :IN_REVISAO_FAT,' +
        ' :IN_DEMURRAGE, '
      
        '   :IN_ENT_BASF, :IN_ENT_BSG, :IN_CHEC_DOC, :VL_REVISAO_FAT, :VL' +
        '_DEMURRAGE, '
      '   :VL_ENT_BASF, :VL_ENT_BSG, :VL_CHEC_DOC)')
    DeleteSQL.Strings = (
      'delete from TAT_BASF'
      'where'
      '  NR_PEDIDO = :OLD_NR_PEDIDO')
    Left = 235
    Top = 62
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 42
    Top = 12
  end
  object qry_lista_: TQuery
    CachedUpdates = True
    AfterOpen = qry_lista_AfterOpen
    AfterScroll = qry_lista_AfterScroll
    OnCalcFields = qry_lista_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DISTINCT T1.NR_PEDIDO,  T1.NR_PEDIDO, A.NM_AREA, T.NM_TP_' +
        'AT_BASF, V.NM_VIA_TRANSP,'
      
        #9'(SELECT DT_PEDIDO FROM TAT_BASF WHERE NR_PEDIDO = T1.NR_PEDIDO ' +
        'AND IN_TRANSMISSAO = '#39'1'#39') DATA_TRANSMISSAO,'
      
        #9'(SELECT DT_PEDIDO FROM TAT_BASF WHERE NR_PEDIDO = T1.NR_PEDIDO ' +
        'AND IN_FOLLOWUP = '#39'1'#39') '#9' DATA_FOLLOWUP,'
      
        #9'(SELECT DT_PEDIDO FROM TAT_BASF WHERE NR_PEDIDO = T1.NR_PEDIDO ' +
        'AND IN_REVISAO_FAT = '#39'1'#39') DATA_REVISAO_FAT,'
      
        #9'(SELECT DT_PEDIDO FROM TAT_BASF WHERE NR_PEDIDO = T1.NR_PEDIDO ' +
        'AND IN_DEMURRAGE = '#39'1'#39') '#9' DATA_DEMURRAGE,'
      
        #9'(SELECT DT_PEDIDO FROM TAT_BASF WHERE NR_PEDIDO = T1.NR_PEDIDO ' +
        'AND IN_CHEC_DOC = '#39'1'#39') '#9' DATA_CHEC_DOC'
      'FROM '#9'TAT_BASF T1, TAREA A, TVIA_TRANSP_BROKER V, TTP_AT_BASF T'
      '  WHERE A.CD_AREA = T1.CD_AREA'
      '    AND V.CD_VIA_TRANSP = T1.CD_VIA_TRANSP'
      '    AND T.TP_AT_BASF = T1.TP_AT_BASF'
      'ORDER BY'
      'T1.NR_PEDIDO')
    Left = 151
    Top = 12
    object qry_lista_NR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      FixedChar = True
      Size = 15
    end
    object qry_lista_NM_AREA: TStringField
      FieldName = 'NM_AREA'
      FixedChar = True
      Size = 50
    end
    object qry_lista_NM_TP_AT_BASF: TStringField
      FieldName = 'NM_TP_AT_BASF'
      FixedChar = True
      Size = 30
    end
    object qry_lista_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
    end
    object qry_lista_DATA_TRANSMISSAO: TDateTimeField
      FieldName = 'DATA_TRANSMISSAO'
    end
    object qry_lista_DATA_FOLLOWUP: TDateTimeField
      FieldName = 'DATA_FOLLOWUP'
    end
    object qry_lista_DATA_REVISAO_FAT: TDateTimeField
      FieldName = 'DATA_REVISAO_FAT'
    end
    object qry_lista_DATA_DEMURRAGE: TDateTimeField
      FieldName = 'DATA_DEMURRAGE'
    end
    object qry_lista_DATA_CHEC_DOC: TDateTimeField
      FieldName = 'DATA_CHEC_DOC'
    end
  end
  object qry_via_transp_broker_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_VIA_TRANSP, NM_VIA_TRANSP'
      'FROM   TVIA_TRANSP_BROKER')
    Left = 142
    Top = 123
  end
  object ds_via_transp: TDataSource
    DataSet = qry_via_transp_broker_
    Left = 43
    Top = 123
  end
  object qry_tp_at_basf_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TTP_AT_BASF'
      'ORDER BY TP_AT_BASF ')
    Left = 142
    Top = 180
  end
  object ds_tp_at_basf: TDataSource
    DataSet = qry_tp_at_basf_
    Left = 43
    Top = 180
  end
end

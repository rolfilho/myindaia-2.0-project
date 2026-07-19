object datm_duplica_eventos: Tdatm_duplica_eventos
  Left = 213
  Top = 200
  Height = 199
  Width = 321
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO'
      'FROM TSERVICO'
      'WHERE CD_SERVICO = :CD_SERVICO')
    Params.Data = {010001000A43445F5345525649434F0001020030000000}
    Left = 32
    Top = 20
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
  end
  object sp_duplica_eventos: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_duplica_eventos'
    Params.Data = {
      0100030006526573756C7404030400000000000000114063645F736572766963
      6F5F666F6E74650101020030000000134063645F7365727669636F5F64657374
      696E6F0101020030000000}
    Left = 124
    Top = 20
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM'
      'FROM TITEM'
      'WHERE CD_ITEM=:CD_ITEM')
    Params.Data = {010001000743445F4954454D0001020030000000}
    Left = 32
    Top = 104
    object qry_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
  end
  object sp_duplica_item_area: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_duplica_item_area'
    Params.Data = {
      0100030006526573756C74040304000000000000000E4063645F6974656D5F66
      6F6E74650101020030000000104063645F6974656D5F64657374696E6F010102
      0030000000}
    Left = 229
    Top = 107
  end
  object qry_item_area: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_ITEM, CD_AREA'
      'FROM TITEM_AREA'
      'WHERE CD_ITEM =:CD_ITEM AND'
      '              CD_AREA =:CD_AREA')
    Params.Data = {
      010002000743445F4954454D00010200300000000743445F4152454100010200
      30000000}
    Left = 128
    Top = 104
  end
end

object datm_sel_mercadoria: Tdatm_sel_mercadoria
  Left = 117
  Top = 104
  Height = 265
  Width = 366
  object qry_mercadoria_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MERCADORIA, AP_MERCADORIA FROM TMERCADORIA'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA')
    Params.Data = {010001000D43445F4D45524341444F5249410001020030000000}
    Left = 223
    Top = 104
  end
  object sp_rel_po_saldo_mercadoria: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_po_saldo_mercadoria'
    Params.Data = {
      0100040006526573756C74040304000000000000010E4063645F6D6572636164
      6F72696101010200300000000A40696E5F61626572746F010102003000000011
      406E725F6964656E746966696361646F7202030400010000000001}
    Left = 194
    Top = 33
  end
  object qry_limpa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE FROM TREL_PO_SALDO_MERCADORIA'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR'
      '')
    Params.Data = {01000100104E525F4944454E544946494341444F5200030400000000000000}
    Left = 58
    Top = 31
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC '
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Params.Data = {010001000A43445F434C49454E54450001020030000100}
    Left = 59
    Top = 104
    object qry_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_cliente_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
      Size = 10
    end
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO, NM_GRUPO'
      'FROM TGRUPO'
      'WHERE CD_GRUPO = :CD_GRUPO ')
    Params.Data = {010001000843445F475255504F0001020030000000}
    Left = 144
    Top = 104
    object qry_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TGRUPO.CD_GRUPO'
      Size = 3
    end
    object qry_grupo_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'TGRUPO.NM_GRUPO'
      Size = 50
    end
  end
end

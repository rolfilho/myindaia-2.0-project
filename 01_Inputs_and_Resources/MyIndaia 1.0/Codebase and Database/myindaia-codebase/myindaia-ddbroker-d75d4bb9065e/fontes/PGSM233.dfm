object datm_cliente_indicado: Tdatm_cliente_indicado
  Left = 200
  Top = 108
  Height = 286
  Width = 311
  object qry_indicado_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_lista
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TCLIENTE_INDICADO'
      'WHERE CD_CLIENTE_INDICADO = :CD_CLIENTE_INDICADO')
    Params.Data = {
      010001001343445F434C49454E54455F494E44494341444F0001020030000100}
    Left = 40
    Top = 8
    object qry_indicado_CD_CLIENTE_INDICADO: TStringField
      FieldName = 'CD_CLIENTE_INDICADO'
      Origin = 'TCLIENTE_INDICADO.CD_CLIENTE_INDICADO'
      EditMask = '!999;0; '
      Size = 3
    end
    object qry_indicado_NM_CLIENTE_INDICADO: TStringField
      FieldName = 'NM_CLIENTE_INDICADO'
      Origin = 'TCLIENTE_INDICADO.NM_CLIENTE_INDICADO'
      Size = 30
    end
    object qry_indicado_NM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Origin = 'TCLIENTE_INDICADO.NM_EMAIL'
      Size = 30
    end
    object qry_indicado_CD_DEPTO: TStringField
      FieldName = 'CD_DEPTO'
      Origin = 'TCLIENTE_INDICADO.CD_DEPTO'
      EditMask = '!999;0; '
      Size = 3
    end
    object qry_indicado_CD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Origin = 'TCLIENTE_INDICADO.CD_CARGO'
      EditMask = '!999;0; '
      Size = 3
    end
    object qry_indicado_LookDepto: TStringField
      FieldName = 'LookDepto'
      LookupDataSet = qry_depto_
      LookupKeyFields = 'CD_DEPTO'
      LookupResultField = 'NM_DEPTO'
      KeyFields = 'CD_DEPTO'
      Size = 30
      Lookup = True
    end
    object qry_indicado_LookCargo: TStringField
      FieldName = 'LookCargo'
      LookupDataSet = qry_cargo_
      LookupKeyFields = 'CD_DEPTO_CARGO'
      LookupResultField = 'NM_DEPTO_CARGO'
      KeyFields = 'CD_CARGO'
      Size = 30
      Lookup = True
    end
  end
  object ds_indicado: TDataSource
    DataSet = qry_indicado_
    Left = 39
    Top = 61
  end
  object qry_lista_: TQuery
    BeforeClose = qry_lista_BeforeClose
    AfterScroll = qry_lista_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CLIENTE_INDICADO, NM_CLIENTE_INDICADO, NM_EMAIL'
      'FROM TCLIENTE_INDICADO ORDER BY'
      'NM_CLIENTE_INDICADO')
    Left = 112
    Top = 8
    object qry_lista_CD_CLIENTE_INDICADO: TStringField
      FieldName = 'CD_CLIENTE_INDICADO'
      Origin = 'TCLIENTE_INDICADO.CD_CLIENTE_INDICADO'
      Size = 3
    end
    object qry_lista_NM_CLIENTE_INDICADO: TStringField
      FieldName = 'NM_CLIENTE_INDICADO'
      Origin = 'TCLIENTE_INDICADO.NM_CLIENTE_INDICADO'
      Size = 30
    end
    object qry_lista_NM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Origin = 'TCLIENTE_INDICADO.NM_EMAIL'
      Size = 30
    end
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 112
    Top = 61
  end
  object qry_depto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_DEPTO, NM_DEPTO'
      'FROM TDEPTO')
    Left = 184
    Top = 8
    object qry_depto_CD_DEPTO: TStringField
      FieldName = 'CD_DEPTO'
      Origin = 'TDEPTO.CD_DEPTO'
      Size = 3
    end
    object qry_depto_NM_DEPTO: TStringField
      FieldName = 'NM_DEPTO'
      Origin = 'TDEPTO.NM_DEPTO'
      Size = 30
    end
  end
  object qry_cargo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_DEPTO_CARGO, NM_DEPTO_CARGO'
      'FROM TDEPTO_CARGO')
    Left = 185
    Top = 61
    object qry_cargo_CD_DEPTO_CARGO: TStringField
      FieldName = 'CD_DEPTO_CARGO'
      Origin = 'TDEPTO_CARGO.CD_DEPTO_CARGO'
      Size = 3
    end
    object qry_cargo_NM_DEPTO_CARGO: TStringField
      FieldName = 'NM_DEPTO_CARGO'
      Origin = 'TDEPTO_CARGO.NM_DEPTO_CARGO'
      Size = 30
    end
  end
  object qry_ult_indicado_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX( CD_CLIENTE_INDICADO ) AS ULTIMO'
      'FROM TCLIENTE_INDICADO')
    Left = 40
    Top = 120
    object qry_ult_indicado_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TCLIENTE_INDICADO.CD_CLIENTE_INDICADO'
      Size = 3
    end
  end
end

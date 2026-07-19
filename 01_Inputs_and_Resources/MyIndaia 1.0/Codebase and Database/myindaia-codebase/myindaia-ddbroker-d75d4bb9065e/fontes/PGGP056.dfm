object datm_rel_com_ind_por: Tdatm_rel_com_ind_por
  Left = 200
  Top = 108
  Height = 230
  Width = 279
  object qry_indicado_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CLIENTE_INDICADO, NM_CLIENTE_INDICADO, CD_DEPTO'
      'FROM TCLIENTE_INDICADO'
      'WHERE CD_CLIENTE_INDICADO = :CD_CLIENTE_INDICADO')
    Params.Data = {
      010001001343445F434C49454E54455F494E44494341444F0001020030000000}
    Left = 39
    Top = 13
    object qry_indicado_CD_CLIENTE_INDICADO: TStringField
      FieldName = 'CD_CLIENTE_INDICADO'
      Origin = 'TCLIENTE_INDICADO.CD_CLIENTE_INDICADO'
      Size = 3
    end
    object qry_indicado_NM_CLIENTE_INDICADO: TStringField
      FieldName = 'NM_CLIENTE_INDICADO'
      Origin = 'TCLIENTE_INDICADO.NM_CLIENTE_INDICADO'
      Size = 30
    end
    object qry_indicado_CD_DEPTO: TStringField
      FieldName = 'CD_DEPTO'
      Origin = 'TCLIENTE_INDICADO.CD_CLIENTE_INDICADO'
      Size = 3
    end
  end
  object qry_depto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_DEPTO, NM_DEPTO'
      'FROM TDEPTO'
      'WHERE CD_DEPTO = :CD_DEPTO')
    Params.Data = {010001000843445F444550544F0001020030000000}
    Left = 39
    Top = 69
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
  object sp_rel_com_ind_por: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_com_ind_por'
    Params.Data = {
      0100040006526573756C74040304000000000000000C4063645F696E64696361
      646F0101020030000000094063645F646570746F010102003000000011406E72
      5F6964656E746966696361646F7202030400000000000000}
    Left = 136
    Top = 8
  end
end

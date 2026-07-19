object datm_log_erro_calculo: Tdatm_log_erro_calculo
  Left = 452
  Top = 144
  Height = 120
  Width = 279
  object qry_log_erro_calculo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT L.CD_USUARIO, L.NM_STORED_PROCEDURE, L.CD_ERRO,'
      'E.NM_MENSAGEM, L.CD_ITEM, I.NM_ITEM'
      'FROM TLOG_ERRO_CALCULO L, '
      'TITEM I,'
      'TCALCULO_ERRO E'
      'WHERE L.CD_ITEM *= I.CD_ITEM AND'
      'L.NM_STORED_PROCEDURE *= E.NM_STORED_PROCEDURE AND'
      'L.CD_ERRO *= E.CD_ERRO AND'
      'CD_USUARIO = :CD_USUARIO')
    Params.Data = {010001000A43445F5553554152494F0001020030000000}
    Left = 177
    Top = 17
    object qry_log_erro_calculo_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object qry_log_erro_calculo_NM_STORED_PROCEDURE: TStringField
      FieldName = 'NM_STORED_PROCEDURE'
      Size = 30
    end
    object qry_log_erro_calculo_CD_ERRO: TSmallintField
      DisplayLabel = 'Cód.'
      FieldName = 'CD_ERRO'
    end
    object qry_log_erro_calculo_NM_MENSAGEM: TStringField
      DisplayLabel = 'Erro encontrado'
      FieldName = 'NM_MENSAGEM'
      Size = 255
    end
    object qry_log_erro_calculo_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object qry_log_erro_calculo_NM_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'NM_ITEM'
      Size = 30
    end
  end
  object ds_log_erro_calculo: TDataSource
    AutoEdit = False
    DataSet = qry_log_erro_calculo_
    Left = 56
    Top = 17
  end
end

object datm_pesq_pagto: Tdatm_pesq_pagto
  Left = 103
  Top = 193
  Height = 287
  Width = 631
  object qry_pesq_: TQuery
    OnCalcFields = qry_pesq_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT S.NR_PROCESSO, S.CD_ITEM, S.CD_USUARIO_SOLIC, P.CD_UNID_N' +
        'EG,'
      
        '       U.NM_UNID_NEG, P.CD_PRODUTO, PR.NM_PRODUTO, S.CD_CALCULO,' +
        ' S.CD_FAVORECIDO,'
      
        '       S.CD_DESTINO,  S.TP_DESTINO, S.CD_STATUS, S.VL_PAGTO, S.N' +
        'R_DOCTO, S.DT_PAGTO'
      'FROM   TSOLIC_PAGTO S, TPROCESSO P, TUNID_NEG U, TPRODUTO PR'
      'WHERE  S.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_UNID_NEG = U.CD_UNID_NEG AND'
      '       P.CD_PRODUTO  = PR.CD_PRODUTO')
    Left = 53
    Top = 20
    object qry_pesq_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 2
    end
    object qry_pesq_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
      Size = 2
    end
    object qry_pesq_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 18
    end
    object qry_pesq_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
      Size = 3
    end
    object qry_pesq_CD_USUARIO_SOLIC: TStringField
      FieldName = 'CD_USUARIO_SOLIC'
      Origin = 'TSOLIC_PAGTO.CD_USUARIO_SOLIC'
      Size = 4
    end
    object qry_pesq_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
    object qry_pesq_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'TPRODUTO.NM_PRODUTO'
      Size = 40
    end
    object qry_pesq_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TSOLIC_PAGTO.CD_FAVORECIDO'
      Size = 5
    end
    object qry_pesq_TP_DESTINO: TStringField
      FieldName = 'TP_DESTINO'
      Origin = 'TSOLIC_PAGTO.TP_DESTINO'
      Size = 1
    end
    object qry_pesq_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TSOLIC_PAGTO.CD_STATUS'
      Size = 2
    end
    object qry_pesq_CD_CALCULO: TStringField
      FieldName = 'CD_CALCULO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 3
    end
    object qry_pesq_VL_PAGTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_PAGTO'
      Origin = 'TSOLIC_PAGTO.VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pesq_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Origin = 'TSOLIC_PAGTO.NR_DOCTO'
      Size = 10
    end
    object qry_pesq_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
      Origin = 'TSOLIC_PAGTO.DT_PAGTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qry_pesq_CalcNrProcesso: TStringField
      DisplayLabel = 'Nº Processo'
      FieldName = 'CalcNrProcesso'
      Size = 10
      Calculated = True
    end
    object qry_pesq_LookItem: TStringField
      DisplayLabel = 'Item'
      FieldName = 'LookItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_pesq_LookUsuarioSolic: TStringField
      DisplayLabel = 'Usuário Solicitante'
      FieldName = 'LookUsuarioSolic'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'NM_USUARIO'
      KeyFields = 'CD_USUARIO_SOLIC'
      Size = 50
      Lookup = True
    end
    object qry_pesq_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_pesq_LookTpDestino: TStringField
      DisplayLabel = 'Tipo de Destino'
      FieldName = 'LookTpDestino'
      LookupDataSet = qry_tp_destino_
      LookupKeyFields = 'CD_TP_DESTINO'
      LookupResultField = 'NM_TP_DESTINO'
      KeyFields = 'TP_DESTINO'
      Lookup = True
    end
    object qry_pesq_LookStatus: TStringField
      DisplayLabel = 'Status'
      FieldName = 'LookStatus'
      LookupDataSet = qry_status_solic_pagto_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS'
      Size = 30
      Lookup = True
    end
    object qry_pesq_LookCalculo: TStringField
      DisplayLabel = 'Tipo de Cálculo'
      FieldName = 'LookCalculo'
      LookupDataSet = qry_calculo_
      LookupKeyFields = 'CD_CALCULO'
      LookupResultField = 'NM_CALCULO'
      KeyFields = 'CD_CALCULO'
      Size = 40
      Lookup = True
    end
  end
  object ds_pesq: TDataSource
    DataSet = qry_pesq_
    Left = 53
    Top = 74
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 157
    Top = 74
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG'
      'ORDER BY'
      'NM_UNID_NEG')
    Left = 157
    Top = 20
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Size = 50
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 10
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO'
      'ORDER BY'
      'NM_PRODUTO')
    Left = 247
    Top = 20
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_produto_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'TPRODUTO.NM_PRODUTO'
      Size = 40
    end
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 247
    Top = 74
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO'
      'FROM TFAVORECIDO'
      'ORDER BY'
      'NM_FAVORECIDO')
    Left = 336
    Top = 20
    object qry_favorecido_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 5
    end
    object qry_favorecido_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 50
    end
  end
  object ds_favorecido: TDataSource
    DataSet = qry_favorecido_
    Left = 336
    Top = 74
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM'
      'FROM TITEM'
      'ORDER BY'
      'NM_ITEM')
    Left = 440
    Top = 20
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
  object ds_item: TDataSource
    DataSet = qry_item_
    Left = 440
    Top = 74
  end
  object qry_status_solic_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM TSTATUS_SOLIC_PAGTO'
      'ORDER BY'
      'DESCRICAO')
    Left = 440
    Top = 135
    object qry_status_solic_pagto_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TSTATUS_SOLIC_PAGTO.CODIGO'
      Size = 2
    end
    object qry_status_solic_pagto_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TSTATUS_SOLIC_PAGTO.DESCRICAO'
      Size = 30
    end
  end
  object ds_status_solic_pagto: TDataSource
    DataSet = qry_status_solic_pagto_
    Left = 440
    Top = 190
  end
  object qry_tp_destino_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_TP_DESTINO, NM_TP_DESTINO'
      'FROM TTP_DESTINO'
      'ORDER BY'
      'NM_TP_DESTINO')
    Left = 336
    Top = 135
    object qry_tp_destino_CD_TP_DESTINO: TStringField
      FieldName = 'CD_TP_DESTINO'
      Origin = 'TTP_DESTINO.CD_TP_DESTINO'
      Size = 1
    end
    object qry_tp_destino_NM_TP_DESTINO: TStringField
      FieldName = 'NM_TP_DESTINO'
      Origin = 'TTP_DESTINO.NM_TP_DESTINO'
    end
  end
  object ds_tp_destino: TDataSource
    DataSet = qry_tp_destino_
    Left = 336
    Top = 190
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO'
      'FROM TUSUARIO'
      'ORDER BY'
      'NM_USUARIO')
    Left = 157
    Top = 135
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'TUSUARIO.NM_USUARIO'
      Size = 50
    end
  end
  object ds_usuario: TDataSource
    DataSet = qry_usuario_
    Left = 157
    Top = 190
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, CD_PRODUTO '
      'FROM TUNID_NEG_PRODUTO '
      'WHERE (CD_UNID_NEG+CD_PRODUTO) IN '
      '               (SELECT (CD_UNID_NEG+CD_PRODUTO) '
      '               FROM TUSUARIO_HABILITACAO '
      '               WHERE CD_USUARIO=:CD_USUARIO AND'
      '                IN_ATIVO = '#39'1'#39') ')
    Params.Data = {010001000A43445F5553554152494F0001020030000100}
    Left = 53
    Top = 135
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_usuario_habilitacao_look_nm_unid_neg: TStringField
      FieldName = 'look_nm_unid_neg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_usuario_habilitacao_look_nm_produto: TStringField
      FieldName = 'look_nm_produto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
  end
  object ds_usuario_habilitacao_: TDataSource
    DataSet = qry_usuario_habilitacao_
    Left = 53
    Top = 190
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO'
      'FROM TPROCESSO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 538
    Top = 20
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
  end
  object qry_calculo_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CALCULO, NM_CALCULO'
      'FROM TCALCULO'
      'ORDER BY'
      'NM_CALCULO')
    Left = 538
    Top = 135
    object qry_calculo_CD_CALCULO: TStringField
      FieldName = 'CD_CALCULO'
      Origin = 'TCALCULO.CD_CALCULO'
      Size = 3
    end
    object qry_calculo_NM_CALCULO: TStringField
      FieldName = 'NM_CALCULO'
      Origin = 'TCALCULO.NM_CALCULO'
      Size = 40
    end
  end
  object ds_calculo: TDataSource
    DataSet = qry_calculo_
    Left = 538
    Top = 190
  end
end

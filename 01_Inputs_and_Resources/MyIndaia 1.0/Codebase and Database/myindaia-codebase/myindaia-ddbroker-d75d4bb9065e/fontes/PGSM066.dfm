object datm_cliente_contato: Tdatm_cliente_contato
  OldCreateOrder = True
  Left = 200
  Top = 104
  Height = 383
  Width = 340
  object ds_cliente_contato: TDataSource
    DataSet = qry_cliente_contato_
    Left = 38
    Top = 12
  end
  object qry_cliente_contato_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM '
      'TCLIENTE_CONTATO (NOLOCK)'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO'
      'ORDER BY NM_CONTATO')
    Left = 159
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_cliente_contato_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_CONTATO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_contato_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_CONTATO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_contato_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_CONTATO.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_contato_NM_CONTATO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_CONTATO'
      Origin = 'TCLIENTE_CONTATO.NM_CONTATO'
      Size = 50
    end
    object qry_cliente_contato_TX_CARGO: TStringField
      FieldName = 'TX_CARGO'
      Origin = 'TCLIENTE_CONTATO.TX_CARGO'
      Size = 25
    end
    object qry_cliente_contato_TX_DEPARTAMENTO: TStringField
      FieldName = 'TX_DEPARTAMENTO'
      Origin = 'TCLIENTE_CONTATO.TX_DEPARTAMENTO'
      Size = 50
    end
    object qry_cliente_contato_NR_FONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'NR_FONE'
      Origin = 'TCLIENTE_CONTATO.NR_FONE'
      EditMask = '(999)9999-9999;1;_'
      Size = 15
    end
    object qry_cliente_contato_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      Origin = 'TCLIENTE_CONTATO.NR_FAX'
      EditMask = '(999)9999-9999;1;_'
      Size = 15
    end
    object qry_cliente_contato_IN_CONTAS: TBooleanField
      FieldName = 'IN_CONTAS'
      Origin = 'TCLIENTE_CONTATO.IN_CONTAS'
    end
    object qry_cliente_contato_IN_FATURAMENTO: TBooleanField
      FieldName = 'IN_FATURAMENTO'
      Origin = 'TCLIENTE_CONTATO.IN_FATURAMENTO'
    end
    object qry_cliente_contato_IN_NUMERARIO: TBooleanField
      FieldName = 'IN_NUMERARIO'
      Origin = 'TCLIENTE_CONTATO.IN_NUMERARIO'
    end
    object qry_cliente_contato_IN_OPERACIONAL: TBooleanField
      FieldName = 'IN_OPERACIONAL'
      Origin = 'TCLIENTE_CONTATO.IN_OPERACIONAL'
    end
    object qry_cliente_contato_IN_COM_EXTERIOR: TBooleanField
      FieldName = 'IN_COM_EXTERIOR'
      Origin = 'TCLIENTE_CONTATO.CD_CLIENTE'
    end
    object qry_cliente_contato_IN_DRAWBACK: TBooleanField
      FieldName = 'IN_DRAWBACK'
      Origin = 'TCLIENTE_CONTATO.CD_CLIENTE'
    end
    object qry_cliente_contato_IN_DEMURRAGE: TBooleanField
      FieldName = 'IN_DEMURRAGE'
      Origin = 'TCLIENTE_CONTATO.CD_CLIENTE'
    end
    object qry_cliente_contato_LookCliente: TStringField
      DisplayLabel = 'Cliente'
      FieldKind = fkLookup
      FieldName = 'LookCliente'
      LookupDataSet = qry_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_cliente_contato_LookUnidNeg: TStringField
      DisplayLabel = 'Unidade de Neg'#243'cio'
      FieldKind = fkLookup
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_cliente_contato_LookProduto: TStringField
      DisplayLabel = 'Produto'
      FieldKind = fkLookup
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
    object qry_cliente_contato_CD_CONTATO: TStringField
      FieldName = 'CD_CONTATO'
      Origin = 'TCLIENTE_CONTATO.CD_CLIENTE'
      Size = 3
    end
    object qry_cliente_contato_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TCLIENTE_CONTATO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_contato_NM_EMAIL: TStringField
      DisplayLabel = 'End. Correio Eletr'#244'nico'
      FieldName = 'NM_EMAIL'
      Origin = 'TCLIENTE_CONTATO.CD_PRODUTO'
      Size = 50
    end
    object qry_cliente_contato_TP_FOLLOWUP: TStringField
      FieldName = 'TP_FOLLOWUP'
      Origin = 'TCLIENTE_CONTATO.NM_CONTATO'
      Size = 2
    end
    object qry_cliente_contato_IN_DOC: TBooleanField
      FieldName = 'IN_DOC'
      Origin = 'TCLIENTE_CONTATO.TX_CARGO'
    end
    object qry_cliente_contato_IN_XLS: TBooleanField
      FieldName = 'IN_XLS'
      Origin = 'TCLIENTE_CONTATO.TX_DEPARTAMENTO'
    end
    object qry_cliente_contato_IN_HTML: TBooleanField
      FieldName = 'IN_HTML'
      Origin = 'TCLIENTE_CONTATO.NR_FONE'
    end
    object qry_cliente_contato_IN_FAX: TBooleanField
      FieldName = 'IN_FAX'
      Origin = 'TCLIENTE_CONTATO.NR_FAX'
    end
    object qry_cliente_contato_LookArea: TStringField
      FieldKind = fkLookup
      FieldName = 'LookArea'
      LookupDataSet = qry_area_
      LookupKeyFields = 'CD_AREA'
      LookupResultField = 'NM_AREA'
      KeyFields = 'CD_AREA'
      Size = 50
      Lookup = True
    end
    object qry_cliente_contato_LookTpFollowUp: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTpFollowUp'
      LookupDataSet = qry_tp_follow_up_
      LookupKeyFields = 'CD_TP_FOLLOW_UP'
      LookupResultField = 'NM_TP_FOLLOW_UP'
      KeyFields = 'TP_FOLLOWUP'
      Lookup = True
    end
    object qry_cliente_contato_IN_EDI: TBooleanField
      FieldName = 'IN_EDI'
      Origin = 'TCLIENTE_CONTATO.CD_CLIENTE'
    end
    object qry_cliente_contato_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TCLIENTE_CONTATO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = qry_empresa_nac_
    Left = 38
    Top = 60
  end
  object qry_empresa_nac_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC')
    Left = 159
    Top = 60
    object qry_empresa_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 38
    Top = 204
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 159
    Top = 204
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
    object tbl_yesno_IN_YESNO: TBooleanField
      FieldName = 'IN_YESNO'
      Required = True
    end
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 38
    Top = 108
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 38
    Top = 156
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO')
    Left = 159
    Top = 155
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
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG FROM'
      'TUNID_NEG')
    Left = 159
    Top = 108
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object ds_area: TDataSource
    DataSet = qry_area_
    Left = 38
    Top = 256
  end
  object qry_area_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_AREA, NM_AREA'
      'FROM TAREA')
    Left = 159
    Top = 256
    object qry_area_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'TAREA.CD_AREA'
      Size = 2
    end
    object qry_area_NM_AREA: TStringField
      FieldName = 'NM_AREA'
      Origin = 'TAREA.NM_AREA'
      Size = 50
    end
  end
  object ds_tp_follow_up: TDataSource
    DataSet = qry_tp_follow_up_
    Left = 38
    Top = 304
  end
  object qry_tp_follow_up_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_TP_FOLLOW_UP, NM_TP_FOLLOW_UP'
      'FROM TTP_FOLLOW_UP')
    Left = 159
    Top = 304
    object qry_tp_follow_up_CD_TP_FOLLOW_UP: TStringField
      FieldName = 'CD_TP_FOLLOW_UP'
      Origin = 'TTP_FOLLOW_UP.CD_TP_FOLLOW_UP'
      Size = 2
    end
    object qry_tp_follow_up_NM_TP_FOLLOW_UP: TStringField
      FieldName = 'NM_TP_FOLLOW_UP'
      Origin = 'TTP_FOLLOW_UP.NM_TP_FOLLOW_UP'
    end
  end
  object qry_ult_contato_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_CONTATO) AS ULTIMO'
      'FROM   TCLIENTE_CONTATO'
      'WHERE  CD_CLIENTE = :CD_CLIENTE AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO'
      '')
    Left = 260
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_ult_contato_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TCLIENTE_CONTATO.CD_CONTATO'
      Size = 3
    end
  end
end

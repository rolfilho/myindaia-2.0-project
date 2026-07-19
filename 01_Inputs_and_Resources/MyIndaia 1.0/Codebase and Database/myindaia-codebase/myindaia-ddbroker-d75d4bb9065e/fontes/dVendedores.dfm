object datm_vendedores: Tdatm_vendedores
  OldCreateOrder = False
  Left = 99
  Top = 127
  Height = 479
  Width = 741
  object ds_vendedor: TDataSource
    DataSet = qry_vendedor_
    Left = 48
    Top = 24
  end
  object qry_vendedor_: TQuery
    CachedUpdates = True
    BeforePost = qry_vendedor_BeforePost
    AfterPost = qry_vendedor_AfterPost
    AfterDelete = qry_vendedor_AfterDelete
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'select TV.CD_VENDEDOR, TV.NM_VENDEDOR,'
      '  TV.CD_UNID_NEG, TU.NM_UNID_NEG,'
      '  TV.DS_ENDERECO, TV.CD_CIDADE, TV.NM_UF, TV.CD_PAIS,'
      '  TV.DS_EMAIL, TV.DS_HOMEPAGE, TV.DS_TIPO_CALCULO,'
      '  TV.DS_VALOR, TV.NR_FAX, TV.NR_COMPLEM, TV.NM_BAIRRO,'
      '  TV.NR_CEP, TV.TP_CALC_COMIS_IMP_AEREA,'
      '  TV.TP_CALC_COMIS_IMP_MARITIMA,'
      '  TV.TP_CALC_COMIS_EXP_AEREA,'
      '  TV.TP_CALC_COMIS_EXP_MARITIMA,TV.TP_CALC_DESEMBARACO,'
      '  TV.VL_CALC_IMP_AEREA,'
      '  TV.VL_CALC_IMP_MARITIMA,'
      '  TV.VL_CALC_EXP_AEREA,'
      '  TV.VL_CALC_EXP_MARITIMA, TV.VL_CALC_DESEMBARACO'
      'from tvendedor TV'
      'LEFT JOIN TUNID_NEG TU ON(TU.CD_UNID_NEG = TV.CD_UNID_NEG)'
      'WHERE'
      'TV.cd_unid_neg=:cd_unid_neg'
      'order by'
      'TV.cd_vendedor'
      ' '
      ' '
      ' ')
    UpdateObject = upd_vendedor
    Left = 128
    Top = 24
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'cd_unid_neg'
        ParamType = ptUnknown
      end>
    object qry_vendedor_look_nm_cidade: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_cidade'
      LookupDataSet = qry_local_embarque_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_CIDADE'
      Size = 30
      Lookup = True
    end
    object qry_vendedor_look_nm_pais: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_pais'
      LookupDataSet = qry_pais_broker
      LookupKeyFields = 'CD_PAIS'
      LookupResultField = 'NM_PAIS'
      KeyFields = 'CD_PAIS'
      Size = 120
      Lookup = True
    end
    object qry_vendedor_CD_VENDEDOR: TStringField
      Alignment = taCenter
      FieldName = 'CD_VENDEDOR'
      Origin = 'DBBROKER.TVENDEDOR.CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
    object qry_vendedor_NM_VENDEDOR: TStringField
      FieldName = 'NM_VENDEDOR'
      Origin = 'DBBROKER.TVENDEDOR.NM_VENDEDOR'
      FixedChar = True
      Size = 50
    end
    object qry_vendedor_DS_ENDERECO: TStringField
      FieldName = 'DS_ENDERECO'
      Origin = 'DBBROKER.TVENDEDOR.DS_ENDERECO'
      FixedChar = True
      Size = 80
    end
    object qry_vendedor_CD_CIDADE: TStringField
      FieldName = 'CD_CIDADE'
      Origin = 'DBBROKER.TVENDEDOR.CD_CIDADE'
      FixedChar = True
      Size = 4
    end
    object qry_vendedor_NM_UF: TStringField
      FieldName = 'NM_UF'
      Origin = 'DBBROKER.TVENDEDOR.NM_UF'
      FixedChar = True
      Size = 2
    end
    object qry_vendedor_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TVENDEDOR.CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_vendedor_DS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      Origin = 'DBBROKER.TVENDEDOR.DS_EMAIL'
      FixedChar = True
      Size = 40
    end
    object qry_vendedor_DS_HOMEPAGE: TStringField
      FieldName = 'DS_HOMEPAGE'
      Origin = 'DBBROKER.TVENDEDOR.DS_HOMEPAGE'
      FixedChar = True
      Size = 80
    end
    object qry_vendedor_DS_TIPO_CALCULO: TStringField
      FieldName = 'DS_TIPO_CALCULO'
      Origin = 'DBBROKER.TVENDEDOR.DS_TIPO_CALCULO'
      FixedChar = True
    end
    object qry_vendedor_DS_VALOR: TStringField
      FieldName = 'DS_VALOR'
      Origin = 'DBBROKER.TVENDEDOR.DS_VALOR'
      FixedChar = True
    end
    object qry_vendedor_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      Origin = 'DBBROKER.TVENDEDOR.NR_FAX'
      FixedChar = True
    end
    object qry_vendedor_NR_COMPLEM: TStringField
      FieldName = 'NR_COMPLEM'
      Origin = 'DBBROKER.TVENDEDOR.NR_COMPLEM'
      FixedChar = True
      Size = 10
    end
    object qry_vendedor_NM_BAIRRO: TStringField
      FieldName = 'NM_BAIRRO'
      Origin = 'DBBROKER.TVENDEDOR.NM_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_vendedor_NR_CEP: TStringField
      FieldName = 'NR_CEP'
      Origin = 'DBBROKER.TVENDEDOR.NR_CEP'
      FixedChar = True
      Size = 10
    end
    object qry_vendedor_VL_CALC_IMP_AEREA: TFloatField
      FieldName = 'VL_CALC_IMP_AEREA'
      Origin = 'DBBROKER.TVENDEDOR.VL_CALC_IMP_AEREA'
      DisplayFormat = '0.00'
    end
    object qry_vendedor_VL_CALC_IMP_MARITIMA: TFloatField
      FieldName = 'VL_CALC_IMP_MARITIMA'
      Origin = 'DBBROKER.TVENDEDOR.VL_CALC_IMP_MARITIMA'
      DisplayFormat = '0.00'
    end
    object qry_vendedor_VL_CALC_EXP_AEREA: TFloatField
      FieldName = 'VL_CALC_EXP_AEREA'
      Origin = 'DBBROKER.TVENDEDOR.VL_CALC_EXP_AEREA'
      DisplayFormat = '0.00'
    end
    object qry_vendedor_VL_CALC_EXP_MARITIMA: TFloatField
      FieldName = 'VL_CALC_EXP_MARITIMA'
      Origin = 'DBBROKER.TVENDEDOR.VL_CALC_EXP_MARITIMA'
      DisplayFormat = '0.00'
    end
    object qry_vendedor_TP_CALC_COMIS_IMP_AEREA: TStringField
      FieldName = 'TP_CALC_COMIS_IMP_AEREA'
      Origin = 'DBBROKER.TVENDEDOR.TP_CALC_COMIS_IMP_AEREA'
      FixedChar = True
      Size = 2
    end
    object qry_vendedor_TP_CALC_COMIS_IMP_MARITIMA: TStringField
      FieldName = 'TP_CALC_COMIS_IMP_MARITIMA'
      Origin = 'DBBROKER.TVENDEDOR.TP_CALC_COMIS_IMP_MARITIMA'
      FixedChar = True
      Size = 2
    end
    object qry_vendedor_TP_CALC_COMIS_EXP_AEREA: TStringField
      FieldName = 'TP_CALC_COMIS_EXP_AEREA'
      Origin = 'DBBROKER.TVENDEDOR.TP_CALC_COMIS_EXP_AEREA'
      FixedChar = True
      Size = 2
    end
    object qry_vendedor_TP_CALC_COMIS_EXP_MARITIMA: TStringField
      FieldName = 'TP_CALC_COMIS_EXP_MARITIMA'
      Origin = 'DBBROKER.TVENDEDOR.TP_CALC_COMIS_EXP_MARITIMA'
      FixedChar = True
      Size = 2
    end
    object qry_vendedor_Look_nm_tp_imp_aere: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_tp_imp_aere'
      LookupDataSet = qry_base_calc_
      LookupKeyFields = 'CD_TP_BASE_CALC_VEND'
      LookupResultField = 'NM_TP_BSE_CALC_VEND'
      KeyFields = 'TP_CALC_COMIS_IMP_AEREA'
      Size = 15
      Lookup = True
    end
    object qry_vendedor_Look_nm_tp_imp_marit: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_tp_imp_marit'
      LookupDataSet = qry_base_calc_
      LookupKeyFields = 'CD_TP_BASE_CALC_VEND'
      LookupResultField = 'NM_TP_BSE_CALC_VEND'
      KeyFields = 'TP_CALC_COMIS_IMP_MARITIMA'
      Size = 15
      Lookup = True
    end
    object qry_vendedor_Look_nm_tp_exp_aerea: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_tp_exp_aerea'
      LookupDataSet = qry_base_calc_
      LookupKeyFields = 'CD_TP_BASE_CALC_VEND'
      LookupResultField = 'NM_TP_BSE_CALC_VEND'
      KeyFields = 'TP_CALC_COMIS_EXP_AEREA'
      Size = 15
      Lookup = True
    end
    object qry_vendedor_Look_nm_tp_exp_marit: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_tp_exp_marit'
      LookupDataSet = qry_base_calc_
      LookupKeyFields = 'CD_TP_BASE_CALC_VEND'
      LookupResultField = 'NM_TP_BSE_CALC_VEND'
      KeyFields = 'TP_CALC_COMIS_EXP_MARITIMA'
      Size = 15
      Lookup = True
    end
    object qry_vendedor_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TVENDEDOR.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_vendedor_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_vendedor_VL_CALC_DESEMBARACO: TFloatField
      FieldName = 'VL_CALC_DESEMBARACO'
      Origin = 'DBBROKER.tvendedor.VL_CALC_DESEMBARACO'
      DisplayFormat = '0.00'
    end
    object qry_vendedor_TP_CALC_DESEMBARACO: TStringField
      FieldName = 'TP_CALC_DESEMBARACO'
      FixedChar = True
      Size = 2
    end
    object qry_vendedor_Look_nm_tp_desembaraco: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_tp_desembaraco'
      LookupDataSet = qry_base_calc_
      LookupKeyFields = 'CD_TP_BASE_CALC_VEND'
      LookupResultField = 'NM_TP_BSE_CALC_VEND'
      KeyFields = 'TP_CALC_DESEMBARACO'
      Size = 10
      Lookup = True
    end
  end
  object qry_pais_broker: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select *'
      'from tpais_broker;')
    Left = 120
    Top = 104
    object qry_pais_brokerCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TPAIS_BROKER.CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_pais_brokerNM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object qry_pais_brokerNM_PAIS_PORT: TStringField
      FieldName = 'NM_PAIS_PORT'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_PAIS_PORT'
      FixedChar = True
      Size = 50
    end
    object qry_pais_brokerNM_PAIS_ING: TStringField
      FieldName = 'NM_PAIS_ING'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_PAIS_ING'
      FixedChar = True
      Size = 50
    end
    object qry_pais_brokerNM_PAIS_ESP: TStringField
      FieldName = 'NM_PAIS_ESP'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_PAIS_ESP'
      FixedChar = True
      Size = 50
    end
    object qry_pais_brokerCD_SCX_EXP: TStringField
      FieldName = 'CD_SCX_EXP'
      Origin = 'DBBROKER.TPAIS_BROKER.CD_SCX_EXP'
      FixedChar = True
      Size = 4
    end
    object qry_pais_brokerNM_SIGLA_CRT: TStringField
      FieldName = 'NM_SIGLA_CRT'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_SIGLA_CRT'
      FixedChar = True
      Size = 2
    end
  end
  object ds_pais: TDataSource
    DataSet = qry_pais_broker
    Left = 40
    Top = 104
  end
  object qry_ult_vend_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(A.CD_VENDEDOR) ULTIMO'
      'FROM  TVENDEDOR A')
    Left = 200
    Top = 84
    object qry_ult_vend_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TVENDEDOR.CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
  end
  object qry_local_embarque_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TLOCAL_EMBARQUE')
    Left = 256
    Top = 156
    object qry_local_embarque_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.CODIGO'
      FixedChar = True
      Size = 4
    end
    object qry_local_embarque_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.DESCRICAO'
      FixedChar = True
      Size = 50
    end
    object qry_local_embarque_CD_UNID_NEG_LOCAL: TStringField
      FieldName = 'CD_UNID_NEG_LOCAL'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.CD_UNID_NEG_LOCAL'
      FixedChar = True
      Size = 2
    end
    object qry_local_embarque_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_local_embarque_CD_UF: TStringField
      FieldName = 'CD_UF'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.CD_UF'
      FixedChar = True
      Size = 2
    end
  end
  object qry_tp_comissao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CALC_COMISSAO, NM_CALC_COMISSAO'
      'FROM TTP_CALC_COMISSAO')
    Left = 144
    Top = 168
    object qry_tp_comissao_CD_CALC_COMISSAO: TStringField
      FieldName = 'CD_CALC_COMISSAO'
      Origin = 'DBBROKER.TTP_CALC_COMISSAO.CD_CALC_COMISSAO'
      FixedChar = True
      Size = 1
    end
    object qry_tp_comissao_NM_CALC_COMISSAO: TStringField
      FieldName = 'NM_CALC_COMISSAO'
      Origin = 'DBBROKER.TTP_CALC_COMISSAO.NM_CALC_COMISSAO'
      FixedChar = True
      Size = 30
    end
  end
  object ds_tp_comissao: TDataSource
    DataSet = qry_tp_comissao_
    Left = 48
    Top = 176
  end
  object ds_contato: TDataSource
    DataSet = qry_contato_
    Left = 40
    Top = 240
  end
  object qry_contato_: TQuery
    CachedUpdates = True
    AfterPost = qry_contato_AfterPost
    AfterDelete = qry_contato_AfterDelete
    OnNewRecord = qry_contato_NewRecord
    DatabaseName = 'DBBROKER'
    DataSource = ds_vendedor
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTATO'
      'WHERE CD_VENDEDOR=:CD_VENDEDOR'
      'ORDER BY'
      'CD_CONTATO')
    UpdateObject = upd_contato
    Left = 120
    Top = 240
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_VENDEDOR'
        ParamType = ptUnknown
      end>
    object qry_contato_CD_CONTATO: TStringField
      Alignment = taCenter
      FieldName = 'CD_CONTATO'
      Origin = 'DBBROKER.TCONTATO.CD_CONTATO'
      FixedChar = True
      Size = 4
    end
    object qry_contato_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      Origin = 'DBBROKER.TCONTATO.NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qry_contato_NR_FONE_CONTATO: TStringField
      FieldName = 'NR_FONE_CONTATO'
      Origin = 'DBBROKER.TCONTATO.NR_FONE_CONTATO'
      FixedChar = True
    end
    object qry_contato_DS_EMAIL_CONTATO: TStringField
      FieldName = 'DS_EMAIL_CONTATO'
      Origin = 'DBBROKER.TCONTATO.DS_EMAIL_CONTATO'
      FixedChar = True
      Size = 40
    end
    object qry_contato_DS_CARGO_CONTATO: TStringField
      FieldName = 'DS_CARGO_CONTATO'
      Origin = 'DBBROKER.TCONTATO.DS_CARGO_CONTATO'
      FixedChar = True
    end
    object qry_contato_DS_DEPTO_CONTATO: TStringField
      FieldName = 'DS_DEPTO_CONTATO'
      Origin = 'DBBROKER.TCONTATO.DS_DEPTO_CONTATO'
      FixedChar = True
    end
    object qry_contato_CD_VENDEDOR: TStringField
      FieldName = 'CD_VENDEDOR'
      Origin = 'DBBROKER.TCONTATO.CD_VENDEDOR'
      FixedChar = True
      Size = 4
    end
  end
  object upd_vendedor: TUpdateSQL
    ModifySQL.Strings = (
      'update tvendedor'
      'set'
      '  CD_VENDEDOR = :CD_VENDEDOR,'
      '  NM_VENDEDOR = :NM_VENDEDOR,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  DS_ENDERECO = :DS_ENDERECO,'
      '  CD_CIDADE = :CD_CIDADE,'
      '  NM_UF = :NM_UF,'
      '  CD_PAIS = :CD_PAIS,'
      '  DS_EMAIL = :DS_EMAIL,'
      '  DS_HOMEPAGE = :DS_HOMEPAGE,'
      '  DS_TIPO_CALCULO = :DS_TIPO_CALCULO,'
      '  DS_VALOR = :DS_VALOR,'
      '  NR_FAX = :NR_FAX,'
      '  NR_COMPLEM = :NR_COMPLEM,'
      '  NM_BAIRRO = :NM_BAIRRO,'
      '  NR_CEP = :NR_CEP,'
      '  TP_CALC_COMIS_IMP_AEREA = :TP_CALC_COMIS_IMP_AEREA,'
      '  TP_CALC_COMIS_IMP_MARITIMA = :TP_CALC_COMIS_IMP_MARITIMA,'
      '  TP_CALC_COMIS_EXP_AEREA = :TP_CALC_COMIS_EXP_AEREA,'
      '  TP_CALC_COMIS_EXP_MARITIMA = :TP_CALC_COMIS_EXP_MARITIMA,'
      '  TP_CALC_DESEMBARACO = :TP_CALC_DESEMBARACO,'
      '  VL_CALC_IMP_AEREA = :VL_CALC_IMP_AEREA,'
      '  VL_CALC_IMP_MARITIMA = :VL_CALC_IMP_MARITIMA,'
      '  VL_CALC_EXP_AEREA = :VL_CALC_EXP_AEREA,'
      '  VL_CALC_EXP_MARITIMA = :VL_CALC_EXP_MARITIMA,'
      '  VL_CALC_DESEMBARACO = :VL_CALC_DESEMBARACO'
      'where'
      '  CD_VENDEDOR = :OLD_CD_VENDEDOR and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG')
    InsertSQL.Strings = (
      'insert into tvendedor'
      '  (CD_VENDEDOR, NM_VENDEDOR, CD_UNID_NEG, DS_ENDERECO, '
      'CD_CIDADE, NM_UF, '
      '   CD_PAIS, DS_EMAIL, DS_HOMEPAGE, DS_TIPO_CALCULO, DS_VALOR, '
      'NR_FAX, NR_COMPLEM, '
      '   NM_BAIRRO, NR_CEP, TP_CALC_COMIS_IMP_AEREA, '
      'TP_CALC_COMIS_IMP_MARITIMA, '
      '   TP_CALC_COMIS_EXP_AEREA, TP_CALC_COMIS_EXP_MARITIMA, '
      'TP_CALC_DESEMBARACO, '
      '   VL_CALC_IMP_AEREA, VL_CALC_IMP_MARITIMA, VL_CALC_EXP_AEREA, '
      'VL_CALC_EXP_MARITIMA, '
      '   VL_CALC_DESEMBARACO)'
      'values'
      '  (:CD_VENDEDOR, :NM_VENDEDOR, :CD_UNID_NEG, :DS_ENDERECO, '
      ':CD_CIDADE, '
      '   :NM_UF, :CD_PAIS, :DS_EMAIL, :DS_HOMEPAGE, :DS_TIPO_CALCULO, '
      ':DS_VALOR, '
      '   :NR_FAX, :NR_COMPLEM, :NM_BAIRRO, :NR_CEP, '
      ':TP_CALC_COMIS_IMP_AEREA, '
      '   :TP_CALC_COMIS_IMP_MARITIMA, :TP_CALC_COMIS_EXP_AEREA, '
      ':TP_CALC_COMIS_EXP_MARITIMA, '
      
        '   :TP_CALC_DESEMBARACO, :VL_CALC_IMP_AEREA, :VL_CALC_IMP_MARITI' +
        'MA, '
      ':VL_CALC_EXP_AEREA, '
      '   :VL_CALC_EXP_MARITIMA, :VL_CALC_DESEMBARACO)')
    DeleteSQL.Strings = (
      'delete from tvendedor'
      'where'
      '  CD_VENDEDOR = :OLD_CD_VENDEDOR and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG')
    Left = 208
    Top = 24
  end
  object upd_contato: TUpdateSQL
    ModifySQL.Strings = (
      'update TCONTATO'
      'set'
      '  NM_CONTATO = :NM_CONTATO,'
      '  NR_FONE_CONTATO = :NR_FONE_CONTATO,'
      '  DS_EMAIL_CONTATO = :DS_EMAIL_CONTATO,'
      '  DS_CARGO_CONTATO = :DS_CARGO_CONTATO,'
      '  DS_DEPTO_CONTATO = :DS_DEPTO_CONTATO,'
      '  CD_VENDEDOR = :CD_VENDEDOR'
      'where'
      '  CD_CONTATO = :OLD_CD_CONTATO')
    InsertSQL.Strings = (
      'insert into TCONTATO'
      
        '  (CD_CONTATO, NM_CONTATO, NR_FONE_CONTATO, DS_EMAIL_CONTATO, DS' +
        '_CARGO_CONTATO, '
      '   DS_DEPTO_CONTATO, CD_VENDEDOR)'
      'values'
      
        '  (:CD_CONTATO, :NM_CONTATO, :NR_FONE_CONTATO, :DS_EMAIL_CONTATO' +
        ', :DS_CARGO_CONTATO, '
      '   :DS_DEPTO_CONTATO, :CD_VENDEDOR)')
    DeleteSQL.Strings = (
      'delete from TCONTATO'
      'where'
      '  CD_CONTATO = :OLD_CD_CONTATO')
    Left = 200
    Top = 240
  end
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 416
    Top = 176
  end
  object qry_ult_contato_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(A.CD_CONTATO) ULTIMO'
      'FROM  TCONTATO A')
    Left = 72
    Top = 296
    object qry_ult_contato_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TCONTATO.CD_CONTATO'
      FixedChar = True
      Size = 4
    end
  end
  object qry_base_calc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *  FROM TTP_BASE_CALC_VENDEDOR')
    Left = 288
    Top = 224
    object qry_base_calc_CD_TP_BASE_CALC_VEND: TStringField
      FieldName = 'CD_TP_BASE_CALC_VEND'
      Origin = 'DBBROKER.TTP_BASE_CALC_VENDEDOR.CD_TP_BASE_CALC_VEND'
      FixedChar = True
      Size = 2
    end
    object qry_base_calc_NM_TP_BSE_CALC_VEND: TStringField
      FieldName = 'NM_TP_BSE_CALC_VEND'
      Origin = 'DBBROKER.TTP_BASE_CALC_VENDEDOR.NM_TP_BSE_CALC_VEND'
      FixedChar = True
      Size = 15
    end
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UH.CD_USUARIO, UH.CD_UNID_NEG, TU.NM_UNID_NEG FROM TUSUAR' +
        'IO_HABILITACAO UH with(nolock)'
      'LEFT JOIN TUNID_NEG TU  ON (TU.CD_UNID_NEG = UH.CD_UNID_NEG)'
      'WHERE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39
      ' ')
    Left = 192
    Top = 312
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_traz_default_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_traz_default_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
  end
end

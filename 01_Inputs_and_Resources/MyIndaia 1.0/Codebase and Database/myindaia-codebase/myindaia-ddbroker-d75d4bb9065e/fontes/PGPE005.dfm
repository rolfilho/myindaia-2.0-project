object datm_pe_capa: Tdatm_pe_capa
  OldCreateOrder = True
  Left = 170
  Top = 51
  Height = 606
  Width = 640
  object ds_pe: TDataSource
    DataSet = qry_pe_
    Left = 40
    Top = 17
  end
  object qry_pe_: TQuery
    BeforeInsert = qry_pe_BeforeInsert
    BeforeEdit = qry_pe_BeforeEdit
    OnCalcFields = qry_pe_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TPE'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      '               NR_PROCESSO = :NR_PROCESSO')
    Left = 141
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_pe_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPE.NR_PROCESSO'
      Size = 18
    end
    object qry_pe_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPE.CD_EXPORTADOR'
      Size = 5
    end
    object qry_pe_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TPE.CD_IMPORTADOR'
      Size = 5
    end
    object qry_pe_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TPE.CD_DESPACHANTE'
      Size = 3
    end
    object qry_pe_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'TPE.CD_AGENTE'
      Size = 4
    end
    object qry_pe_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TPE.CD_INCOTERM'
      Size = 3
    end
    object qry_pe_CD_PAIS_DESTINO: TStringField
      FieldName = 'CD_PAIS_DESTINO'
      Origin = 'TPE.CD_PAIS_DESTINO'
      Size = 3
    end
    object qry_pe_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TPE.CD_MOEDA'
      Size = 3
    end
    object qry_pe_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TPE.CD_VIA_TRANSPORTE'
      Size = 2
    end
    object qry_pe_CD_SEGURADORA: TStringField
      FieldName = 'CD_SEGURADORA'
      Origin = 'TPE.CD_SEGURADORA'
      Size = 5
    end
    object qry_pe_CD_REPRESENTANTE: TStringField
      FieldName = 'CD_REPRESENTANTE'
      Origin = 'TPE.CD_REPRESENTANTE'
      Size = 5
    end
    object qry_pe_CD_LOCAL_ORIGEM: TStringField
      FieldName = 'CD_LOCAL_ORIGEM'
      Origin = 'TPE.CD_LOCAL_ORIGEM'
      Size = 4
    end
    object qry_pe_CD_LOCAL_DESTINO: TStringField
      FieldName = 'CD_LOCAL_DESTINO'
      Origin = 'TPE.CD_LOCAL_DESTINO'
      Size = 4
    end
    object qry_pe_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TPE.CD_URF_DESPACHO'
      Size = 7
    end
    object qry_pe_CD_URF_DESTINO: TStringField
      FieldName = 'CD_URF_DESTINO'
      Origin = 'TPE.CD_URF_DESTINO'
      Size = 7
    end
    object qry_pe_CD_TERMO_PAGTO: TStringField
      FieldName = 'CD_TERMO_PAGTO'
      Origin = 'TPE.CD_TERMO_PAGTO'
      Size = 6
    end
    object qry_pe_CD_FORMA_PAGTO: TStringField
      FieldName = 'CD_FORMA_PAGTO'
      Origin = 'TPE.CD_FORMA_PAGTO'
      Size = 1
    end
    object qry_pe_CD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      Origin = 'TPE.CD_LINGUA_PEDIDO'
      Size = 1
    end
    object qry_pe_CD_TIPO_FRETE: TStringField
      FieldName = 'CD_TIPO_FRETE'
      Origin = 'TPE.CD_TIPO_FRETE'
      Size = 1
    end
    object qry_pe_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TPE.CD_USUARIO'
      Size = 4
    end
    object qry_pe_CD_CARTA_CREDITO: TStringField
      FieldName = 'CD_CARTA_CREDITO'
      Origin = 'TPE.CD_CARTA_CREDITO'
      Size = 15
    end
    object qry_pe_CD_INST_NEGOC: TStringField
      FieldName = 'CD_INST_NEGOC'
      Origin = 'TPE.CD_INST_NEGOC'
      Size = 5
    end
    object qry_pe_CD_CONSIGNATARIO: TStringField
      FieldName = 'CD_CONSIGNATARIO'
      Origin = 'TPE.CD_CONSIGNATARIO'
      Size = 5
    end
    object qry_pe_CD_NOTIFY1: TStringField
      FieldName = 'CD_NOTIFY1'
      Origin = 'TPE.CD_NOTIFY1'
      Size = 5
    end
    object qry_pe_CD_NOTIFY2: TStringField
      FieldName = 'CD_NOTIFY2'
      Origin = 'TPE.CD_NOTIFY2'
      Size = 5
    end
    object qry_pe_DT_REGISTRO_PEDIDO: TDateTimeField
      FieldName = 'DT_REGISTRO_PEDIDO'
      Origin = 'TPE.DT_REGISTRO_PEDIDO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_pe_DT_FATURA: TDateTimeField
      FieldName = 'DT_FATURA'
      Origin = 'TPE.DT_FATURA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_pe_IN_DRAWBACK: TBooleanField
      FieldName = 'IN_DRAWBACK'
      Origin = 'TPE.IN_DRAWBACK'
    end
    object qry_pe_NR_LI: TStringField
      FieldName = 'NR_LI'
      Origin = 'TPE.NR_LI'
      EditMask = '!99/9999999-9;0;'
      Size = 10
    end
    object qry_pe_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'TPE.NR_FATURA'
      Size = 15
    end
    object qry_pe_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      Origin = 'TPE.VL_FRETE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'TPE.VL_SEGURO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      Origin = 'TPE.VL_PESO_BRUTO'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_pe_VL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      Origin = 'TPE.VL_PESO_LIQUIDO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TPE.VL_DESCONTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_VL_COMISSAO_PERCENT: TFloatField
      FieldName = 'VL_COMISSAO_PERCENT'
      Origin = 'TPE.VL_COMISSAO_PERCENT'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_VL_TOT_ORIGEM: TFloatField
      FieldName = 'VL_TOT_ORIGEM'
      Origin = 'TPE.VL_TOT_ORIGEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_VL_TOT_CUBAGEM: TFloatField
      FieldName = 'VL_TOT_CUBAGEM'
      Origin = 'TPE.VL_TOT_CUBAGEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_VL_TOT_FOB: TFloatField
      FieldName = 'VL_TOT_FOB'
      Origin = 'TPE.VL_TOT_FOB'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_VL_TOT_COM_AGENTE: TFloatField
      FieldName = 'VL_TOT_COM_AGENTE'
      Origin = 'TPE.VL_TOT_COM_AGENTE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_VL_TOT_QTDE_PROD: TFloatField
      FieldName = 'VL_TOT_QTDE_PROD'
      Origin = 'TPE.VL_TOT_QTDE_PROD'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_VL_TOT_QTDE_EMBALAGEM: TFloatField
      FieldName = 'VL_TOT_QTDE_EMBALAGEM'
      Origin = 'TPE.VL_TOT_QTDE_EMBALAGEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_VL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
      Origin = 'TPE.VL_TOT_MCV'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_VL_TX_CAMBIO: TFloatField
      FieldName = 'VL_TX_CAMBIO'
      Origin = 'TPE.VL_TX_CAMBIO'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_pe_VL_TOT_CONTAINER: TFloatField
      FieldName = 'VL_TOT_CONTAINER'
      Origin = 'TPE.VL_TOT_CONTAINER'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_VL_TOT_PALLETS: TFloatField
      FieldName = 'VL_TOT_PALLETS'
      Origin = 'TPE.VL_TOT_PALLETS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_VL_TOT_EXW: TFloatField
      FieldName = 'VL_TOT_EXW'
      Origin = 'TPE.VL_TOT_EXW'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_TX_INF_EMBALAGEM: TMemoField
      FieldName = 'TX_INF_EMBALAGEM'
      Origin = 'TPE.TX_INF_EMBALAGEM'
      BlobType = ftMemo
    end
    object qry_pe_TX_MARCACAO_VOLUME: TMemoField
      FieldName = 'TX_MARCACAO_VOLUME'
      Origin = 'TPE.TX_MARCACAO_VOLUME'
      BlobType = ftMemo
    end
    object qry_pe_TX_DECL_EXPORTADOR: TMemoField
      FieldName = 'TX_DECL_EXPORTADOR'
      Origin = 'TPE.TX_DECL_EXPORTADOR'
      BlobType = ftMemo
    end
    object qry_pe_TX_DECL_ADICIONAL: TMemoField
      FieldName = 'TX_DECL_ADICIONAL'
      Origin = 'TPE.TX_DECL_ADICIONAL'
      BlobType = ftMemo
    end
    object qry_pe_TX_TERMO_PAGTO: TMemoField
      FieldName = 'TX_TERMO_PAGTO'
      Origin = 'TPE.TX_TERMO_PAGTO'
      BlobType = ftMemo
    end
    object qry_pe_CD_TRANSPORTADORA: TStringField
      FieldName = 'CD_TRANSPORTADORA'
      Origin = 'TPE.CD_TRANSPORTADORA'
      Size = 4
    end
    object qry_pe_TP_CONSIGNATARIO: TStringField
      FieldName = 'TP_CONSIGNATARIO'
      Origin = 'TPE.TP_CONSIGNATARIO'
      Size = 1
    end
    object qry_pe_TP_NOTIFY1: TStringField
      FieldName = 'TP_NOTIFY1'
      Origin = 'TPE.TP_NOTIFY1'
      Size = 1
    end
    object qry_pe_TP_NOTIFY2: TStringField
      FieldName = 'TP_NOTIFY2'
      Origin = 'TPE.TP_NOTIFY2'
      Size = 1
    end
    object qry_pe_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPE.NR_PROCESSO'
      Size = 2
    end
    object qry_pe_QT_TOTAL_ITENS: TStringField
      FieldName = 'QT_TOTAL_ITENS'
      Origin = 'TPE.CD_EXPORTADOR'
      Size = 3
    end
    object qry_pe_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'TPE.CD_IMPORTADOR'
      Size = 1
    end
    object qry_pe_IN_MONTADO: TStringField
      FieldName = 'IN_MONTADO'
      Origin = 'TPE.CD_DESPACHANTE'
      Size = 1
    end
    object qry_pe_CalcNmNotify2: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNmNotify2'
      Size = 60
      Calculated = True
    end
    object qry_pe_CalcNmNotify1: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNmNotify1'
      Size = 60
      Calculated = True
    end
    object qry_pe_CalcNmConsignatario: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNmConsignatario'
      Size = 60
      Calculated = True
    end
    object qry_pe_LookNmTermoPagto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmTermoPagto'
      LookupDataSet = qry_termo_pagto_
      LookupKeyFields = 'CD_TERMO_PAGTO'
      LookupResultField = 'NM_TERMO_PAGTO'
      KeyFields = 'CD_TERMO_PAGTO'
      Size = 60
      Lookup = True
    end
    object qry_pe_LookNmInstNeg: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmInstNeg'
      LookupDataSet = qry_inst_negoc_
      LookupKeyFields = 'CD_INST_NEGOC'
      LookupResultField = 'NM_INST_NEGOC'
      KeyFields = 'CD_INST_NEGOC'
      Size = 60
      Lookup = True
    end
    object qry_pe_LookNmTransportadora: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmTransportadora'
      LookupDataSet = qry_transp_itl_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_TRANSPORTADORA'
      Size = 60
      Lookup = True
    end
    object qry_pe_LookNmIncoterm: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmIncoterm'
      LookupDataSet = qry_incoterms_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_INCOTERM'
      Size = 120
      Lookup = True
    end
    object qry_pe_LookNmAgente: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmAgente'
      LookupDataSet = qry_ag_
      LookupKeyFields = 'CD_AGENTE'
      LookupResultField = 'NM_AGENTE'
      KeyFields = 'CD_AGENTE'
      Size = 60
      Lookup = True
    end
    object qry_pe_LookNmDespachante: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmDespachante'
      LookupDataSet = qry_despachante_
      LookupKeyFields = 'CD_DESPACHANTE'
      LookupResultField = 'NM_DESPACHANTE'
      KeyFields = 'CD_DESPACHANTE'
      Size = 60
      Lookup = True
    end
    object qry_pe_LookNmLocalDestino: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmLocalDestino'
      LookupDataSet = qry_local_embarque_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_LOCAL_DESTINO'
      Size = 60
      Lookup = True
    end
    object qry_pe_LookNmLocalOrigem: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmLocalOrigem'
      LookupDataSet = qry_local_embarque_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_LOCAL_ORIGEM'
      Size = 60
      Lookup = True
    end
    object qry_pe_LookNmPais: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmPais'
      LookupDataSet = qry_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_DESTINO'
      Size = 60
      Lookup = True
    end
    object qry_pe_LookNmMoeda: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmMoeda'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOEDA'
      Size = 60
      Lookup = True
    end
    object qry_pe_LookURFEmbarque: TStringField
      FieldKind = fkLookup
      FieldName = 'LookURFEmbarque'
      LookupDataSet = qry_urf_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_URF_DESTINO'
      Size = 60
      Lookup = True
    end
    object qry_pe_LookURFDespacho: TStringField
      FieldKind = fkLookup
      FieldName = 'LookURFDespacho'
      LookupDataSet = qry_urf_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_URF_DESPACHO'
      Size = 60
      Lookup = True
    end
    object qry_pe_LookNmExportador: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmExportador'
      LookupDataSet = qry_emp_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EXPORTADOR'
      Size = 60
      Lookup = True
    end
    object qry_pe_LookNmRepresentante: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmRepresentante'
      LookupDataSet = qry_emp_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_REPRESENTANTE'
      Size = 60
      Lookup = True
    end
    object qry_pe_LookNmSeguradora: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmSeguradora'
      LookupDataSet = qry_emp_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_SEGURADORA'
      Size = 60
      Lookup = True
    end
    object qry_pe_LookNmImportador: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmImportador'
      LookupDataSet = qry_emp_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_IMPORTADOR'
      Size = 60
      Lookup = True
    end
  end
  object qry_pais_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TPAIS')
    Left = 337
    Top = 390
    object qry_pais_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TPAIS.CODIGO'
      Size = 3
    end
    object qry_pais_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TPAIS.DESCRICAO'
      Size = 120
    end
  end
  object qry_urf_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TURF')
    Left = 553
    Top = 141
    object qry_urf_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TURF.CODIGO'
      Size = 7
    end
    object qry_urf_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TURF.DESCRICAO'
      Size = 120
    end
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TMOEDA')
    Left = 460
    Top = 141
    object qry_moeda_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TMOEDA.CODIGO'
      Size = 3
    end
    object qry_moeda_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TMOEDA.DESCRICAO'
      Size = 120
    end
  end
  object ds_via_transporte: TDataSource
    DataSet = qry_via_transporte_
    Left = 40
    Top = 78
  end
  object qry_via_transporte_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM  TVIA_TRANSPORTE'
      'ORDER BY NM_VIA_TRANSPORTE    ')
    Left = 139
    Top = 78
    object qry_via_transporte_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TVIA_TRANSPORTE.CD_VIA_TRANSPORTE'
      Size = 2
    end
    object qry_via_transporte_NM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
      Origin = 'TVIA_TRANSPORTE.NM_VIA_TRANSPORTE'
    end
  end
  object qry_emp_est_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_EST '
      'ORDER BY NM_EMPRESA')
    Left = 337
    Top = 17
    object qry_emp_est_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 5
    end
    object qry_emp_est_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_EST.NM_EMPRESA'
      Size = 60
    end
    object qry_emp_est_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_EST.AP_EMPRESA'
      Size = 10
    end
  end
  object ds_emp_est: TDataSource
    DataSet = qry_emp_est_
    Left = 260
    Top = 17
  end
  object qry_local_embarque_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      '  FROM TLOCAL_EMBARQUE'
      'ORDER BY'
      '  DESCRICAO')
    Left = 460
    Top = 78
    object qry_local_embarque_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TLOCAL_EMBARQUE.CODIGO'
      Size = 4
    end
    object qry_local_embarque_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TLOCAL_EMBARQUE.DESCRICAO'
      Size = 50
    end
    object qry_local_embarque_CD_UNID_NEG_LOCAL: TStringField
      FieldName = 'CD_UNID_NEG_LOCAL'
      Origin = 'TLOCAL_EMBARQUE.CD_UNID_NEG_LOCAL'
      Size = 2
    end
  end
  object qry_despachante_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_DESPACHANTE, NM_DESPACHANTE, AP_DESPACHANTE'
      'FROM TDESPACHANTE'
      'ORDER BY CD_DESPACHANTE')
    Left = 337
    Top = 78
    object qry_despachante_CD_DESPACHANTE: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TDESPACHANTE.CD_DESPACHANTE'
      Size = 3
    end
    object qry_despachante_NM_DESPACHANTE: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_DESPACHANTE'
      Origin = 'TDESPACHANTE.NM_DESPACHANTE'
      Size = 50
    end
    object qry_despachante_AP_DESPACHANTE: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_DESPACHANTE'
      Origin = 'TDESPACHANTE.AP_DESPACHANTE'
      Size = 10
    end
  end
  object ds_despachante: TDataSource
    DataSet = qry_despachante_
    Left = 260
    Top = 78
  end
  object qry_ag_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_AGENTE, NM_AGENTE'
      'FROM TAGENTE'
      'ORDER BY CD_AGENTE')
    Left = 337
    Top = 141
    object qry_ag_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'TAGENTE.CD_AGENTE'
      Size = 4
    end
    object qry_ag_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      Origin = 'TAGENTE.NM_AGENTE'
      Size = 60
    end
  end
  object ds_ag: TDataSource
    DataSet = qry_ag_
    Left = 260
    Top = 141
  end
  object qry_forma_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TFORMA_PAGAR')
    Left = 139
    Top = 141
    object qry_forma_pagto_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TFORMA_PAGAR.CODIGO'
      Size = 1
    end
    object qry_forma_pagto_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TFORMA_PAGAR.DESCRICAO'
      Size = 30
    end
  end
  object qry_lingua_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TIDIOMA')
    Left = 139
    Top = 200
    object qry_lingua_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TIDIOMA.CODIGO'
      Size = 1
    end
    object qry_lingua_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIDIOMA.DESCRICAO'
      Size = 30
    end
  end
  object qry_tp_frete_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TTP_FRETE')
    Left = 139
    Top = 260
    object qry_tp_frete_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TTP_FRETE.CODIGO'
      Size = 1
    end
    object qry_tp_frete_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTP_FRETE.DESCRICAO'
      Size = 30
    end
  end
  object qry_tp_pessoa_exp_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_PESSOA_EXP')
    Left = 139
    Top = 321
    object qry_tp_pessoa_exp_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TTP_PESSOA_EXP.CODIGO'
      Size = 1
    end
    object qry_tp_pessoa_exp_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTP_PESSOA_EXP.DESCRICAO'
      Size = 40
    end
  end
  object ds_tp_frete: TDataSource
    DataSet = qry_tp_frete_
    Left = 40
    Top = 260
  end
  object ds_tp_pessoa_exp: TDataSource
    DataSet = qry_tp_pessoa_exp_
    Left = 40
    Top = 321
  end
  object ds_lingua: TDataSource
    DataSet = qry_lingua_
    Left = 40
    Top = 200
  end
  object ds_forma_pagto: TDataSource
    DataSet = qry_forma_pagto_
    Left = 40
    Top = 141
  end
  object qry_exec_sp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '')
    Left = 260
    Top = 390
  end
  object ds_incoterms: TDataSource
    DataSet = qry_incoterms_
    Left = 260
    Top = 454
  end
  object qry_incoterms_: TQuery
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM  TINCOTERMS_VENDA')
    Left = 337
    Top = 454
    object qry_incoterms_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TINCOTERMS_VENDA.CODIGO'
      Size = 3
    end
    object qry_incoterms_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TINCOTERMS_VENDA.DESCRICAO'
      Size = 60
    end
    object qry_incoterms_SINAL: TStringField
      FieldName = 'SINAL'
      Origin = 'TINCOTERMS_VENDA.SINAL'
      Size = 1
    end
  end
  object qry_transp_itl_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM TTRANSPORTADOR_ITL'
      'ORDER BY DESCRICAO')
    Left = 337
    Top = 260
    object qry_transp_itl_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TTRANSPORTADOR_ITL.CODIGO'
      Size = 4
    end
    object qry_transp_itl_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTRANSPORTADOR_ITL.DESCRICAO'
      Size = 60
    end
  end
  object ds_transp_itl: TDataSource
    DataSet = qry_transp_itl_
    Left = 260
    Top = 260
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM TBANCO'
      'ORDER BY CD_BANCO')
    Left = 337
    Top = 200
    object qry_banco_CD_BANCO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
    object qry_banco_NM_BANCO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_BANCO'
      Origin = 'TBANCO.NM_BANCO'
      Size = 40
    end
  end
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 260
    Top = 200
  end
  object qry_inst_negoc_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_INST_NEGOC, NM_INST_NEGOC'
      'FROM TINST_NEGOC'
      'ORDER BY NM_INST_NEGOC')
    Left = 139
    Top = 517
    object qry_inst_negoc_CD_INST_NEGOC: TStringField
      FieldName = 'CD_INST_NEGOC'
      Origin = 'TINST_NEGOC.CD_INST_NEGOC'
      Size = 5
    end
    object qry_inst_negoc_NM_INST_NEGOC: TStringField
      FieldName = 'NM_INST_NEGOC'
      Origin = 'TINST_NEGOC.NM_INST_NEGOC'
      Size = 60
    end
  end
  object ds_inst_negoc: TDataSource
    DataSet = qry_inst_negoc_
    Left = 40
    Top = 517
  end
  object qry_termo_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_TERMO_PAGTO, NM_TERMO_PAGTO'
      'FROM TTERMO_PAGTO '
      'ORDER BY NM_TERMO_PAGTO'
      '')
    Left = 337
    Top = 517
    object qry_termo_pagto_CD_TERMO_PAGTO: TStringField
      FieldName = 'CD_TERMO_PAGTO'
      Origin = 'TTERMO_PAGTO.CD_TERMO_PAGTO'
      Size = 6
    end
    object qry_termo_pagto_NM_TERMO_PAGTO: TStringField
      FieldName = 'NM_TERMO_PAGTO'
      Origin = 'TTERMO_PAGTO.NM_TERMO_PAGTO'
      Size = 50
    end
  end
  object ds_termo_pagto: TDataSource
    DataSet = qry_termo_pagto_
    Left = 260
    Top = 517
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'ORDER BY CD_EMPRESA'
      '')
    Left = 337
    Top = 321
    object qry_emp_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMP_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_emp_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object ds_emp_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 260
    Top = 321
  end
  object qry_nm_consig_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '#39#39)
    Left = 139
    Top = 390
  end
  object ds_nm_consig: TDataSource
    DataSet = qry_nm_consig_
    Left = 40
    Top = 390
  end
  object qry_nm_notify1_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '#39#39)
    Left = 139
    Top = 454
  end
  object ds_nm_notify1: TDataSource
    DataSet = qry_nm_notify1_
    Left = 40
    Top = 454
  end
  object qry_nm_notify2_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '#39#39)
    Left = 553
    Top = 17
  end
  object ds_nm_notify2: TDataSource
    DataSet = qry_nm_notify2_
    Left = 460
    Top = 17
  end
  object qry_pe_itens_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_ITEM, QT_MERCADORIA, QT_EMBALAGEM, VL_CUB' +
        'AGEM, VL_TOT_PESO_LIQ,'
      '       VL_TOT_ITEM'
      'FROM TPE_ITEM'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND CD_UNID_NEG = :CD_UNID_NEG'
      '')
    Left = 553
    Top = 78
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
  end
end

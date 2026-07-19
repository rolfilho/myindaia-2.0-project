object datm_dde: Tdatm_dde
  OldCreateOrder = False
  Left = 391
  Top = 181
  Height = 498
  Width = 653
  object qry_dde: TQuery
    CachedUpdates = True
    AfterInsert = qry_ddeAfterInsert
    AfterPost = AplicaUpdates
    AfterDelete = qry_ddeAfterDelete
    AfterScroll = qry_ddeAfterScroll
    OnCalcFields = qry_ddeCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_SD, NR_REGISTRO_SD, CD_EXPORTADOR, SUBSTRING(NR_SD, 5,' +
        ' 12) AS NR_SD_REDUZIDO,'
      '       CD_VIA_TRANSPORTE, VL_TOTAL_PESO_LIQUIDO,'
      
        '       VL_TOTAL_PESO_BRUTO, VL_TOTAL_COND_VENDA, QT_ESTAB_DESPAC' +
        'HO, CD_PROPRIETARIO,'
      
        '       TX_REGIMES_ADUANEIROS, IN_INF_REPRESENTANTE_LEGAL, IN_INF' +
        '_DESPACHO_POSTERIOR,'
      
        '       IN_INF_DESP_CARGA_FRACIONADA, IN_OUTROS_DOCS_INF_RECEPCAO' +
        ', IN_INF_PRESENCA_CARGA,'
      
        '       IN_INF_DADOS_EMBARQUE, CD_URF_EMBARQUE, CD_URF_DESPACHO, ' +
        'CD_RECINTO, CD_SETOR,'
      
        '       DT_VALIDADE_EMBARQUE, TX_NACIONALIDADE_EMBARCACAO, CD_REC' +
        'INTO_ALFANDEG,'
      
        '       TX_IDENT_VEIC_TRANSP, TX_NUMERO_ESTABELECIMENTO, DT_DATA_' +
        'SD, TX_LOCAL_NAO_ALFANDEG,'
      
        '       QT_TOTAL_VOLUMES, NR_SUFIXO_CGC, IN_SELECIONADO, CPF_USUA' +
        'RIO, TX_SITUCAO_DDE,IN_FILA'
      'FROM TSD (NOLOCK)'
      'WHERE SUBSTRING(NR_SD,1,2) = :CD_UNID_NEG'
      'ORDER BY'
      'SUBSTRING(NR_SD,13,2) DESC, NR_SD DESC'
      ' '
      ' '
      ' ')
    UpdateObject = upd_dde
    Left = 117
    Top = 16
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_ddeNR_SD: TStringField
      FieldName = 'NR_SD'
      Origin = 'DBBROKER.TSD.NR_SD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 18
    end
    object qry_ddeNR_REGISTRO_SD: TStringField
      FieldName = 'NR_REGISTRO_SD'
      Origin = 'DBBROKER.TSD.NR_REGISTRO_SD'
      FixedChar = True
      Size = 12
    end
    object qry_ddeCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'DBBROKER.TSD.CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_ddeCD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'DBBROKER.TSD.CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_ddeVL_TOTAL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_TOTAL_PESO_LIQUIDO'
      Origin = 'DBBROKER.TSD.VL_TOTAL_PESO_LIQUIDO'
      DisplayFormat = '#0.00000'
      EditFormat = '#0.00000'
    end
    object qry_ddeVL_TOTAL_PESO_BRUTO: TFloatField
      FieldName = 'VL_TOTAL_PESO_BRUTO'
      Origin = 'DBBROKER.TSD.VL_TOTAL_PESO_BRUTO'
      DisplayFormat = '#0.00000'
      EditFormat = '#0.00000'
    end
    object qry_ddeVL_TOTAL_COND_VENDA: TFloatField
      FieldName = 'VL_TOTAL_COND_VENDA'
      Origin = 'DBBROKER.TSD.VL_TOTAL_COND_VENDA'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object qry_ddeQT_ESTAB_DESPACHO: TFloatField
      FieldName = 'QT_ESTAB_DESPACHO'
      Origin = 'DBBROKER.TSD.QT_ESTAB_DESPACHO'
      DisplayFormat = '#00'
      EditFormat = '#00'
    end
    object qry_ddeCD_PROPRIETARIO: TStringField
      FieldName = 'CD_PROPRIETARIO'
      Origin = 'DBBROKER.TSD.CD_PROPRIETARIO'
      FixedChar = True
      Size = 4
    end
    object qry_ddeTX_REGIMES_ADUANEIROS: TStringField
      FieldName = 'TX_REGIMES_ADUANEIROS'
      Origin = 'DBBROKER.TSD.TX_REGIMES_ADUANEIROS'
      FixedChar = True
      Size = 100
    end
    object qry_ddeIN_INF_REPRESENTANTE_LEGAL: TStringField
      FieldName = 'IN_INF_REPRESENTANTE_LEGAL'
      Origin = 'DBBROKER.TSD.IN_INF_REPRESENTANTE_LEGAL'
      FixedChar = True
      Size = 1
    end
    object qry_ddeIN_INF_DESPACHO_POSTERIOR: TStringField
      FieldName = 'IN_INF_DESPACHO_POSTERIOR'
      Origin = 'DBBROKER.TSD.IN_INF_DESPACHO_POSTERIOR'
      FixedChar = True
      Size = 1
    end
    object qry_ddeIN_INF_DESP_CARGA_FRACIONADA: TStringField
      FieldName = 'IN_INF_DESP_CARGA_FRACIONADA'
      Origin = 'DBBROKER.TSD.IN_INF_DESP_CARGA_FRACIONADA'
      FixedChar = True
      Size = 1
    end
    object qry_ddeIN_OUTROS_DOCS_INF_RECEPCAO: TStringField
      FieldName = 'IN_OUTROS_DOCS_INF_RECEPCAO'
      Origin = 'DBBROKER.TSD.IN_OUTROS_DOCS_INF_RECEPCAO'
      FixedChar = True
      Size = 1
    end
    object qry_ddeIN_INF_PRESENCA_CARGA: TStringField
      FieldName = 'IN_INF_PRESENCA_CARGA'
      Origin = 'DBBROKER.TSD.IN_INF_PRESENCA_CARGA'
      FixedChar = True
      Size = 1
    end
    object qry_ddeIN_INF_DADOS_EMBARQUE: TStringField
      FieldName = 'IN_INF_DADOS_EMBARQUE'
      Origin = 'DBBROKER.TSD.IN_INF_DADOS_EMBARQUE'
      FixedChar = True
      Size = 1
    end
    object qry_ddeCD_URF_EMBARQUE: TStringField
      FieldName = 'CD_URF_EMBARQUE'
      Origin = 'DBBROKER.TSD.CD_URF_EMBARQUE'
      FixedChar = True
      Size = 7
    end
    object qry_ddeCD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'DBBROKER.TSD.CD_URF_DESPACHO'
      FixedChar = True
      Size = 7
    end
    object qry_ddeCD_RECINTO: TStringField
      FieldName = 'CD_RECINTO'
      Origin = 'DBBROKER.TSD.CD_RECINTO'
      FixedChar = True
      Size = 10
    end
    object qry_ddeCD_SETOR: TStringField
      FieldName = 'CD_SETOR'
      Origin = 'DBBROKER.TSD.CD_SETOR'
      FixedChar = True
      Size = 5
    end
    object qry_ddeDT_VALIDADE_EMBARQUE: TDateTimeField
      FieldName = 'DT_VALIDADE_EMBARQUE'
      Origin = 'DBBROKER.TSD.DT_VALIDADE_EMBARQUE'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_ddeTX_NACIONALIDADE_EMBARCACAO: TStringField
      FieldName = 'TX_NACIONALIDADE_EMBARCACAO'
      Origin = 'DBBROKER.TSD.TX_NACIONALIDADE_EMBARCACAO'
      FixedChar = True
      Size = 30
    end
    object qry_ddeCD_RECINTO_ALFANDEG: TStringField
      FieldName = 'CD_RECINTO_ALFANDEG'
      Origin = 'DBBROKER.TSD.CD_RECINTO_ALFANDEG'
      FixedChar = True
      Size = 10
    end
    object qry_ddeTX_IDENT_VEIC_TRANSP: TStringField
      FieldName = 'TX_IDENT_VEIC_TRANSP'
      Origin = 'DBBROKER.TSD.TX_IDENT_VEIC_TRANSP'
      FixedChar = True
      Size = 25
    end
    object qry_ddeTX_NUMERO_ESTABELECIMENTO: TStringField
      FieldName = 'TX_NUMERO_ESTABELECIMENTO'
      Origin = 'DBBROKER.TSD.TX_NUMERO_ESTABELECIMENTO'
      FixedChar = True
      Size = 4
    end
    object qry_ddeDT_DATA_SD: TDateTimeField
      FieldName = 'DT_DATA_SD'
      Origin = 'DBBROKER.TSD.DT_DATA_SD'
    end
    object qry_ddeTX_LOCAL_NAO_ALFANDEG: TStringField
      FieldName = 'TX_LOCAL_NAO_ALFANDEG'
      Origin = 'DBBROKER.TSD.TX_LOCAL_NAO_ALFANDEG'
      FixedChar = True
      Size = 11
    end
    object qry_ddeQT_TOTAL_VOLUMES: TFloatField
      FieldName = 'QT_TOTAL_VOLUMES'
      Origin = 'DBBROKER.TSD.QT_TOTAL_VOLUMES'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object qry_ddeNR_SUFIXO_CGC: TStringField
      FieldName = 'NR_SUFIXO_CGC'
      Origin = 'DBBROKER.TSD.NR_SUFIXO_CGC'
      FixedChar = True
      Size = 6
    end
    object qry_ddeNomeExportador: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeExportador'
      Size = 50
      Calculated = True
    end
    object qry_ddeCalcPrefixoCGC: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcPrefixoCGC'
      EditMask = '00.000.000 / ;0;_'
      Size = 12
      Calculated = True
    end
    object qry_ddeNR_SD_REDUZIDO: TStringField
      DisplayWidth = 12
      FieldName = 'NR_SD_REDUZIDO'
      FixedChar = True
      Size = 12
    end
    object qry_ddeIN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_ddeCalc_Status: TStringField
      FieldKind = fkCalculated
      FieldName = 'Calc_Status'
      Size = 1
      Calculated = True
    end
    object qry_ddeCPF_USUARIO: TStringField
      FieldName = 'CPF_USUARIO'
      FixedChar = True
      Size = 11
    end
    object qry_ddeTX_SITUCAO_DDE: TStringField
      FieldName = 'TX_SITUCAO_DDE'
      FixedChar = True
      Size = 60
    end
    object qry_ddeIN_FILA: TStringField
      FieldName = 'IN_FILA'
      FixedChar = True
      Size = 1
    end
  end
  object ds_dde: TDataSource
    DataSet = qry_dde
    OnDataChange = ds_ddeDataChange
    Left = 32
    Top = 18
  end
  object upd_dde: TUpdateSQL
    ModifySQL.Strings = (
      'update TSD'
      'set'
      '  NR_SD = :NR_SD,'
      '  NR_REGISTRO_SD = :NR_REGISTRO_SD,'
      '  CD_EXPORTADOR = :CD_EXPORTADOR,'
      '  CD_VIA_TRANSPORTE = :CD_VIA_TRANSPORTE,'
      '  VL_TOTAL_PESO_LIQUIDO = :VL_TOTAL_PESO_LIQUIDO,'
      '  VL_TOTAL_PESO_BRUTO = :VL_TOTAL_PESO_BRUTO,'
      '  VL_TOTAL_COND_VENDA = :VL_TOTAL_COND_VENDA,'
      '  QT_ESTAB_DESPACHO = :QT_ESTAB_DESPACHO,'
      '  CD_PROPRIETARIO = :CD_PROPRIETARIO,'
      '  TX_REGIMES_ADUANEIROS = :TX_REGIMES_ADUANEIROS,'
      '  IN_INF_REPRESENTANTE_LEGAL = :IN_INF_REPRESENTANTE_LEGAL,'
      '  IN_INF_DESPACHO_POSTERIOR = :IN_INF_DESPACHO_POSTERIOR,'
      '  IN_INF_DESP_CARGA_FRACIONADA = :IN_INF_DESP_CARGA_FRACIONADA,'
      '  IN_OUTROS_DOCS_INF_RECEPCAO = :IN_OUTROS_DOCS_INF_RECEPCAO,'
      '  IN_INF_PRESENCA_CARGA = :IN_INF_PRESENCA_CARGA,'
      '  IN_INF_DADOS_EMBARQUE = :IN_INF_DADOS_EMBARQUE,'
      '  CD_URF_EMBARQUE = :CD_URF_EMBARQUE,'
      '  CD_URF_DESPACHO = :CD_URF_DESPACHO,'
      '  CD_RECINTO = :CD_RECINTO,'
      '  CD_SETOR = :CD_SETOR,'
      '  DT_VALIDADE_EMBARQUE = :DT_VALIDADE_EMBARQUE,'
      '  TX_NACIONALIDADE_EMBARCACAO = :TX_NACIONALIDADE_EMBARCACAO,'
      '  CD_RECINTO_ALFANDEG = :CD_RECINTO_ALFANDEG,'
      '  TX_IDENT_VEIC_TRANSP = :TX_IDENT_VEIC_TRANSP,'
      '  TX_NUMERO_ESTABELECIMENTO = :TX_NUMERO_ESTABELECIMENTO,'
      '  DT_DATA_SD = :DT_DATA_SD,'
      '  TX_LOCAL_NAO_ALFANDEG = :TX_LOCAL_NAO_ALFANDEG,'
      '  QT_TOTAL_VOLUMES = :QT_TOTAL_VOLUMES,'
      '  NR_SUFIXO_CGC = :NR_SUFIXO_CGC,'
      '  IN_SELECIONADO = :IN_SELECIONADO,'
      '  CPF_USUARIO = :CPF_USUARIO,'
      '  IN_FILA = :IN_FILA'
      'where'
      '  NR_SD = :OLD_NR_SD')
    InsertSQL.Strings = (
      'insert into TSD'
      
        '  (NR_SD, NR_REGISTRO_SD, CD_EXPORTADOR, CD_VIA_TRANSPORTE, VL_T' +
        'OTAL_PESO_LIQUIDO, '
      
        '   VL_TOTAL_PESO_BRUTO, VL_TOTAL_COND_VENDA, QT_ESTAB_DESPACHO, ' +
        'CD_PROPRIETARIO, '
      
        '   TX_REGIMES_ADUANEIROS, IN_INF_REPRESENTANTE_LEGAL, IN_INF_DES' +
        'PACHO_POSTERIOR, '
      
        '   IN_INF_DESP_CARGA_FRACIONADA, IN_OUTROS_DOCS_INF_RECEPCAO, IN' +
        '_INF_PRESENCA_CARGA, '
      
        '   IN_INF_DADOS_EMBARQUE, CD_URF_EMBARQUE, CD_URF_DESPACHO, CD_R' +
        'ECINTO, '
      
        '   CD_SETOR, DT_VALIDADE_EMBARQUE, TX_NACIONALIDADE_EMBARCACAO, ' +
        'CD_RECINTO_ALFANDEG, '
      
        '   TX_IDENT_VEIC_TRANSP, TX_NUMERO_ESTABELECIMENTO, DT_DATA_SD, ' +
        'TX_LOCAL_NAO_ALFANDEG, '
      
        '   QT_TOTAL_VOLUMES, NR_SUFIXO_CGC, IN_SELECIONADO, CPF_USUARIO,' +
        ' IN_FILA)'
      'values'
      
        '  (:NR_SD, :NR_REGISTRO_SD, :CD_EXPORTADOR, :CD_VIA_TRANSPORTE, ' +
        ':VL_TOTAL_PESO_LIQUIDO, '
      
        '   :VL_TOTAL_PESO_BRUTO, :VL_TOTAL_COND_VENDA, :QT_ESTAB_DESPACH' +
        'O, :CD_PROPRIETARIO, '
      
        '   :TX_REGIMES_ADUANEIROS, :IN_INF_REPRESENTANTE_LEGAL, :IN_INF_' +
        'DESPACHO_POSTERIOR, '
      
        '   :IN_INF_DESP_CARGA_FRACIONADA, :IN_OUTROS_DOCS_INF_RECEPCAO, ' +
        ':IN_INF_PRESENCA_CARGA, '
      
        '   :IN_INF_DADOS_EMBARQUE, :CD_URF_EMBARQUE, :CD_URF_DESPACHO, :' +
        'CD_RECINTO, '
      
        '   :CD_SETOR, :DT_VALIDADE_EMBARQUE, :TX_NACIONALIDADE_EMBARCACA' +
        'O, :CD_RECINTO_ALFANDEG, '
      
        '   :TX_IDENT_VEIC_TRANSP, :TX_NUMERO_ESTABELECIMENTO, :DT_DATA_S' +
        'D, :TX_LOCAL_NAO_ALFANDEG, '
      
        '   :QT_TOTAL_VOLUMES, :NR_SUFIXO_CGC, :IN_SELECIONADO, :CPF_USUA' +
        'RIO, :IN_FILA)')
    DeleteSQL.Strings = (
      'delete TSD'
      'where'
      '  NR_SD = :OLD_NR_SD')
    Left = 203
    Top = 17
  end
  object qry_dde_re: TQuery
    CachedUpdates = True
    BeforePost = qry_dde_reBeforePost
    AfterPost = qry_dde_reAfterPost
    AfterDelete = qry_dde_reAfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TSD_RE (NOLOCK)'
      'WHERE NR_SD = :SD')
    UpdateObject = upd_dde_re
    Left = 116
    Top = 181
    ParamData = <
      item
        DataType = ftString
        Name = 'SD'
        ParamType = ptInput
      end>
    object qry_dde_reNR_SD: TStringField
      FieldName = 'NR_SD'
      Origin = 'DBBROKER.TSD_RE.NR_SD'
      FixedChar = True
      Size = 18
    end
    object qry_dde_reNR_PROCESSO_RE: TStringField
      FieldName = 'NR_PROCESSO_RE'
      Origin = 'DBBROKER.TSD_RE.NR_PROCESSO_RE'
      FixedChar = True
      Size = 18
    end
    object qry_dde_reNR_RE_SISCOMEX: TStringField
      FieldName = 'NR_RE_SISCOMEX'
      Origin = 'DBBROKER.TSD_RE.NR_RE_SISCOMEX'
      FixedChar = True
      Size = 30
    end
    object qry_dde_reVL_SOMA_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_SOMA_PESO_LIQUIDO'
      Origin = 'DBBROKER.TSD_RE.VL_SOMA_PESO_LIQUIDO'
      DisplayFormat = '#0.00000'
      EditFormat = '#0.00000'
    end
    object qry_dde_reVL_SOMA_COND_VENDA: TFloatField
      FieldName = 'VL_SOMA_COND_VENDA'
      Origin = 'DBBROKER.TSD_RE.VL_SOMA_COND_VENDA'
      DisplayFormat = '#0.00'
    end
    object qry_dde_reNR_ANEXO_INICIAL: TStringField
      FieldName = 'NR_ANEXO_INICIAL'
      Origin = 'DBBROKER.TSD_RE.NR_ANEXO_INICIAL'
      FixedChar = True
      Size = 3
    end
    object qry_dde_reNR_ANEXO_FINAL: TStringField
      FieldName = 'NR_ANEXO_FINAL'
      Origin = 'DBBROKER.TSD_RE.NR_ANEXO_FINAL'
      FixedChar = True
      Size = 3
    end
  end
  object ds_dde_re: TDataSource
    DataSet = qry_dde_re
    OnDataChange = ds_ddeDataChange
    Left = 32
    Top = 181
  end
  object upd_dde_re: TUpdateSQL
    ModifySQL.Strings = (
      'update TSD_RE'
      'set'
      '  NR_SD = :NR_SD,'
      '  NR_PROCESSO_RE = :NR_PROCESSO_RE,'
      '  NR_RE_SISCOMEX = :NR_RE_SISCOMEX,'
      '  VL_SOMA_PESO_LIQUIDO = :VL_SOMA_PESO_LIQUIDO,'
      '  VL_SOMA_COND_VENDA = :VL_SOMA_COND_VENDA,'
      '  NR_ANEXO_INICIAL = :NR_ANEXO_INICIAL,'
      '  NR_ANEXO_FINAL = :NR_ANEXO_FINAL'
      'where'
      '  NR_SD = :OLD_NR_SD and'
      '  NR_RE_SISCOMEX = :OLD_NR_RE_SISCOMEX')
    InsertSQL.Strings = (
      'insert into TSD_RE'
      
        '  (NR_SD, NR_PROCESSO_RE, NR_RE_SISCOMEX, VL_SOMA_PESO_LIQUIDO, ' +
        'VL_SOMA_COND_VENDA, '
      '   NR_ANEXO_INICIAL, NR_ANEXO_FINAL)'
      'values'
      
        '  (:NR_SD, :NR_PROCESSO_RE, :NR_RE_SISCOMEX, :VL_SOMA_PESO_LIQUI' +
        'DO, :VL_SOMA_COND_VENDA, '
      '   :NR_ANEXO_INICIAL, :NR_ANEXO_FINAL)')
    DeleteSQL.Strings = (
      'delete TSD_RE'
      'where'
      '  NR_SD = :OLD_NR_SD and'
      '  NR_RE_SISCOMEX = :OLD_NR_RE_SISCOMEX')
    Left = 201
    Top = 181
  end
  object qry_dde_espec: TQuery
    CachedUpdates = True
    BeforePost = qry_dde_especBeforePost
    AfterPost = qry_dde_especAfterPost
    AfterDelete = qry_dde_especAfterDelete
    OnCalcFields = qry_dde_especCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TSD_ESPEC (NOLOCK)'
      'WHERE NR_SD = :SD')
    UpdateObject = upd_dde_espec
    Left = 117
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'SD'
        ParamType = ptInput
      end>
    object qry_dde_especNR_SD: TStringField
      FieldName = 'NR_SD'
      Origin = 'DBBROKER.TSD_ESPEC.NR_SD'
      FixedChar = True
      Size = 18
    end
    object qry_dde_especNR_SEQ_ESPEC: TAutoIncField
      FieldName = 'NR_SEQ_ESPEC'
      Origin = 'DBBROKER.TSD_ESPEC.NR_SEQ_ESPEC'
    end
    object qry_dde_especQT_ESPECIE: TFloatField
      FieldName = 'QT_ESPECIE'
      Origin = 'DBBROKER.TSD_ESPEC.QT_ESPECIE'
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object qry_dde_especTX_MARCACAO_VOLUME: TStringField
      FieldName = 'TX_MARCACAO_VOLUME'
      Origin = 'DBBROKER.TSD_ESPEC.TX_MARCACAO_VOLUME'
      FixedChar = True
      Size = 60
    end
    object qry_dde_especDT_DATA: TDateTimeField
      FieldName = 'DT_DATA'
      Origin = 'DBBROKER.TSD_ESPEC.DT_DATA'
    end
    object qry_dde_especCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TSD_ESPEC.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_dde_especcalcTipoEmbalagem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcTipoEmbalagem'
      Size = 40
      Calculated = True
    end
    object qry_dde_especCD_ESPECIE: TStringField
      FieldName = 'CD_ESPECIE'
      Origin = 'DBBROKER.TSD_ESPEC.CD_ESPECIE'
      EditMask = '00;1;_'
      FixedChar = True
      Size = 2
    end
  end
  object upd_dde_espec: TUpdateSQL
    ModifySQL.Strings = (
      'update TSD_ESPEC'
      'set'
      '  NR_SD = :NR_SD,'
      '  CD_ESPECIE = :CD_ESPECIE,'
      '  QT_ESPECIE = :QT_ESPECIE,'
      '  TX_MARCACAO_VOLUME = :TX_MARCACAO_VOLUME,'
      '  DT_DATA = :DT_DATA,'
      '  CD_USUARIO = :CD_USUARIO'
      'where'
      '  NR_SD = :OLD_NR_SD and'
      '  CD_ESPECIE = :OLD_CD_ESPECIE')
    InsertSQL.Strings = (
      'insert into TSD_ESPEC'
      
        '  (NR_SD, CD_ESPECIE, QT_ESPECIE, TX_MARCACAO_VOLUME, DT_DATA, C' +
        'D_USUARIO)'
      'values'
      
        '  (:NR_SD, :CD_ESPECIE, :QT_ESPECIE, :TX_MARCACAO_VOLUME, :DT_DA' +
        'TA, :CD_USUARIO)')
    DeleteSQL.Strings = (
      'delete TSD_ESPEC'
      'where'
      '  NR_SD = :OLD_NR_SD and'
      '  CD_ESPECIE = :OLD_CD_ESPECIE')
    Left = 202
    Top = 72
  end
  object ds_dde_espec: TDataSource
    DataSet = qry_dde_espec
    OnStateChange = ds_dde_especStateChange
    Left = 32
    Top = 72
  end
  object qry_dde_nf: TQuery
    CachedUpdates = True
    BeforePost = qry_dde_nfBeforePost
    AfterPost = qry_dde_nfAfterPost
    AfterDelete = qry_ddeAfterDelete
    DatabaseName = 'DBBROKER'
    DataSource = ds_dde_estab
    SQL.Strings = (
      'SELECT * FROM TSD_NF (NOLOCK)'
      'WHERE NR_SD = :NR_PROCESSO'
      'AND NR_ESTABELECIMENTO = :NR_ESTABELECIMENTO'
      'ORDER BY NR_SEQ_NF')
    UpdateObject = upd_dde_nf
    Left = 117
    Top = 237
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end
      item
        DataType = ftFixedChar
        Name = 'NR_ESTABELECIMENTO'
        ParamType = ptUnknown
        Size = 3
      end>
    object qry_dde_nfNR_SD: TStringField
      FieldName = 'NR_SD'
      Origin = 'DBBROKER.TSD_NF.NR_SD'
      FixedChar = True
      Size = 18
    end
    object qry_dde_nfNR_SEQ_NF: TAutoIncField
      FieldName = 'NR_SEQ_NF'
      Origin = 'DBBROKER.TSD_NF.NR_SEQ_NF'
    end
    object qry_dde_nfNR_NF_INICIAL: TStringField
      FieldName = 'NR_NF_INICIAL'
      Origin = 'DBBROKER.TSD_NF.NR_NF_INICIAL'
      FixedChar = True
    end
    object qry_dde_nfNR_NF_FINAL: TStringField
      FieldName = 'NR_NF_FINAL'
      Origin = 'DBBROKER.TSD_NF.NR_NF_FINAL'
      FixedChar = True
    end
    object qry_dde_nfNR_SERIE_NF: TStringField
      FieldName = 'NR_SERIE_NF'
      Origin = 'DBBROKER.TSD_NF.NR_SERIE_NF'
      FixedChar = True
      Size = 5
    end
    object qry_dde_nfDT_DATA: TDateTimeField
      FieldName = 'DT_DATA'
      Origin = 'DBBROKER.TSD_NF.DT_DATA'
    end
    object qry_dde_nfCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TSD_NF.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_dde_nfNR_ESTABELECIMENTO: TStringField
      FieldName = 'NR_ESTABELECIMENTO'
      Origin = 'DBBROKER.TSD_NF.NR_ESTABELECIMENTO'
      FixedChar = True
      Size = 2
    end
  end
  object upd_dde_nf: TUpdateSQL
    ModifySQL.Strings = (
      'update TSD_NF'
      'set'
      '  NR_SD = :NR_SD,'
      '  NR_NF_INICIAL = :NR_NF_INICIAL,'
      '  NR_NF_FINAL = :NR_NF_FINAL,'
      '  NR_SERIE_NF = :NR_SERIE_NF,'
      '  DT_DATA = :DT_DATA,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  NR_ESTABELECIMENTO = :NR_ESTABELECIMENTO'
      'where'
      '  NR_SD = :OLD_NR_SD and'
      '  NR_SEQ_NF = :OLD_NR_SEQ_NF')
    InsertSQL.Strings = (
      'insert into TSD_NF'
      
        '  (NR_SD, NR_NF_INICIAL, NR_NF_FINAL, NR_SERIE_NF, DT_DATA, CD_U' +
        'SUARIO, '
      '   NR_ESTABELECIMENTO)'
      'values'
      
        '  (:NR_SD, :NR_NF_INICIAL, :NR_NF_FINAL, :NR_SERIE_NF, :DT_DATA,' +
        ' :CD_USUARIO, '
      '   :NR_ESTABELECIMENTO)')
    DeleteSQL.Strings = (
      'delete TSD_NF'
      'where'
      '  NR_SD = :OLD_NR_SD and'
      '  NR_SEQ_NF = :OLD_NR_SEQ_NF')
    Left = 201
    Top = 237
  end
  object ds_dde_nf: TDataSource
    DataSet = qry_dde_nf
    OnStateChange = ds_dde_nfStateChange
    Left = 34
    Top = 237
  end
  object qry_dde_estab: TQuery
    CachedUpdates = True
    AfterInsert = qry_dde_estabAfterInsert
    BeforePost = qry_dde_estabBeforePost
    AfterPost = AplicaUpdates
    AfterDelete = qry_ddeAfterDelete
    AfterScroll = qry_dde_estabAfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TSD_ESTAB_NF (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_SD'
      'ORDER BY NR_ESTABELECIMENTO')
    UpdateObject = upd_dde_estab
    Left = 115
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end>
    object qry_dde_estabNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TSD_ESTAB_NF.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_dde_estabNR_ESTABELECIMENTO: TStringField
      FieldName = 'NR_ESTABELECIMENTO'
      Origin = 'DBBROKER.TSD_ESTAB_NF.NR_ESTABELECIMENTO'
      FixedChar = True
      Size = 2
    end
    object qry_dde_estabNR_SUFIXO_CGC: TStringField
      FieldName = 'NR_SUFIXO_CGC'
      Origin = 'DBBROKER.TSD_ESTAB_NF.NR_SUFIXO_CGC'
      EditMask = '0000 - 00;0;_'
      FixedChar = True
      Size = 6
    end
  end
  object upd_dde_estab: TUpdateSQL
    ModifySQL.Strings = (
      'update TSD_ESTAB_NF'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ESTABELECIMENTO = :NR_ESTABELECIMENTO,'
      '  NR_SUFIXO_CGC = :NR_SUFIXO_CGC'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ESTABELECIMENTO = :OLD_NR_ESTABELECIMENTO')
    InsertSQL.Strings = (
      'insert into TSD_ESTAB_NF'
      '  (NR_PROCESSO, NR_ESTABELECIMENTO, NR_SUFIXO_CGC)'
      'values'
      '  (:NR_PROCESSO, :NR_ESTABELECIMENTO, :NR_SUFIXO_CGC)')
    DeleteSQL.Strings = (
      'delete TSD_ESTAB_NF'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ESTABELECIMENTO = :OLD_NR_ESTABELECIMENTO')
    Left = 200
    Top = 128
  end
  object ds_dde_estab: TDataSource
    DataSet = qry_dde_estab
    OnStateChange = ds_dde_estabStateChange
    Left = 32
    Top = 128
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC (NOLOCK)'
      'WHERE IN_ATIVO = ''1''')
    Left = 118
    Top = 290
    object qry_emp_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_emp_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
  end
  object ds_emp_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 32
    Top = 288
  end
  object qry_exec_sp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      '')
    Left = 321
    Top = 181
    object qry_exec_sp_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_exec_sp_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 321
    Top = 236
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, CD_PRODUTO'
      'FROM   TUNID_NEG_PRODUTO (NOLOCK)'
      'WHERE  ( CD_UNID_NEG+CD_PRODUTO ) IN'
      '         ( SELECT ( CD_UNID_NEG+CD_PRODUTO )'
      '           FROM   TUSUARIO_HABILITACAO (NOLOCK)'
      '           WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                  IN_ATIVO = ''1'' AND'
      '                  CD_PRODUTO = :CD_PRODUTO )')
    Left = 316
    Top = 71
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_PRODUTO'
      'FROM   TPRODUTO (NOLOCK)'
      'WHERE  CD_PRODUTO = :CD_PRODUTO')
    Left = 319
    Top = 124
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_produto_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'DBBROKER.TPRODUTO.NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
  end
  object qry_dde_envio: TQuery
    AfterOpen = qry_dde_envioAfterOpen
    AfterClose = qry_dde_envioAfterClose
    AfterScroll = qry_dde_envioAfterScroll
    OnCalcFields = qry_ddeCalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_dde
    SQL.Strings = (
      
        'SELECT NR_SD, NR_REGISTRO_SD, CD_EXPORTADOR, SUBSTRING(NR_SD, 5,' +
        ' 10) AS NR_SD_REDUZIDO,'
      '       CD_VIA_TRANSPORTE, VL_TOTAL_PESO_LIQUIDO,'
      
        '       VL_TOTAL_PESO_BRUTO, VL_TOTAL_COND_VENDA, QT_ESTAB_DESPAC' +
        'HO, CD_PROPRIETARIO,'
      
        '       TX_REGIMES_ADUANEIROS, IN_INF_REPRESENTANTE_LEGAL, IN_INF' +
        '_DESPACHO_POSTERIOR,'
      
        '       IN_INF_DESP_CARGA_FRACIONADA, IN_OUTROS_DOCS_INF_RECEPCAO' +
        ', IN_INF_PRESENCA_CARGA,'
      
        '       IN_INF_DADOS_EMBARQUE, CD_URF_EMBARQUE, CD_URF_DESPACHO, ' +
        'CD_RECINTO, CD_SETOR,'
      
        '       DT_VALIDADE_EMBARQUE, TX_NACIONALIDADE_EMBARCACAO, CD_REC' +
        'INTO_ALFANDEG,'
      
        '       TX_IDENT_VEIC_TRANSP, TX_NUMERO_ESTABELECIMENTO, DT_DATA_' +
        'SD, TX_LOCAL_NAO_ALFANDEG,'
      '       QT_TOTAL_VOLUMES, NR_SUFIXO_CGC'
      'FROM TSD (NOLOCK)'
      'WHERE NR_SD = :NR_SD'
      'ORDER BY'
      'SUBSTRING(NR_SD,13,2) DESC, NR_SD DESC'
      ' '
      ' '
      ' ')
    Left = 316
    Top = 20
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_SD'
        ParamType = ptUnknown
      end>
  end
  object qry_dde_espec_envio: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TSD_ESPEC (NOLOCK)'
      'WHERE NR_SD = :NR_SD')
    Left = 323
    Top = 292
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_SD'
        ParamType = ptUnknown
      end>
  end
  object qry_dde_re_envio: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TSD_RE (NOLOCK)'
      'WHERE NR_SD = :NR_SD')
    Left = 436
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_SD'
        ParamType = ptUnknown
      end>
  end
  object qry_dde_estab_envio: TQuery
    AfterOpen = qry_dde_estab_envioAfterOpen
    AfterClose = qry_dde_estab_envioAfterClose
    AfterScroll = qry_dde_estab_envioAfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TSD_ESTAB_NF (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_SD'
      'ORDER BY NR_ESTABELECIMENTO')
    Left = 436
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end>
  end
  object qry_dde_nf_envio: TQuery
    BeforePost = qry_dde_nfBeforePost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TSD_NF (NOLOCK)'
      'WHERE NR_SD = :NR_PROCESSO'
      'AND NR_ESTABELECIMENTO = :NR_ESTABELECIMENTO'
      'ORDER BY NR_SEQ_NF')
    Left = 436
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_ESTABELECIMENTO'
        ParamType = ptUnknown
      end>
  end
  object ByHLLAPI_DDE: TByHLLAPI
    HLLAPIKind = hkIWW4
    DllName = 'WHLLAPI.DLL'
    DllFunc = 'WINHLLAPI'
    IPAddress = '127.0.0.1'
    IPPort = 4321
    TimeOut = 60000
    Left = 436
    Top = 183
  end
  object qry_fila_exp: TQuery
    CachedUpdates = True
    AfterPost = qry_fila_expAfterPost
    BeforeDelete = qry_fila_expBeforeDelete
    AfterDelete = qry_fila_expAfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '
      '       fre.CD_FILA'
      '      ,fre.CD_USUARIO'
      '      ,fre.NR_PROCESSO'
      '      ,fre.DT_FILA'
      '      ,Convert(varchar,  fre.DT_FILA, 103) DATA_FILA'
      '      ,Convert(varchar,  fre.DT_FILA, 108) HORA_FILA'
      '      ,fre.DT_STATUS'
      '      ,Convert(varchar,  fre.DT_STATUS, 103) DATA_STATUS'
      '      ,Convert(varchar,  fre.DT_STATUS, 108) HORA_STATUS'
      '      ,fre.TX_STATUS'
      '      ,u.NM_USUARIO'
      '      '
      '  FROM TFILA_REG_EXP fre (NOLOCK) '
      '  JOIN TUSUARIO u ON fre.CD_USUARIO = u.CD_USUARIO'
      
        '  where (DT_FILA between getdate()-15 and getdate() ) or ( :ver_' +
        'tudo = ''S'')'
      ''
      '  ORDER BY fre.CD_FILA desc')
    UpdateObject = upd_fila_exp
    Left = 112
    Top = 352
    ParamData = <
      item
        DataType = ftString
        Name = 'ver_tudo'
        ParamType = ptUnknown
      end>
    object qry_fila_expCD_FILA: TAutoIncField
      FieldName = 'CD_FILA'
      Origin = 'DBBROKER.TFILA_REG_EXP.CD_FILA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qry_fila_expCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TFILA_REG_EXP.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_fila_expNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TFILA_REG_EXP.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_fila_expDT_STATUS: TDateTimeField
      FieldName = 'DT_STATUS'
      Origin = 'DBBROKER.TFILA_REG_EXP.DT_STATUS'
    end
    object qry_fila_expTX_STATUS: TStringField
      FieldName = 'TX_STATUS'
      Origin = 'DBBROKER.TFILA_REG_EXP.TX_STATUS'
      FixedChar = True
      Size = 60
    end
    object qry_fila_expNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'DBBROKER.TUSUARIO.NM_USUARIO'
      FixedChar = True
      Size = 50
    end
    object qry_fila_expDT_FILA: TDateTimeField
      FieldName = 'DT_FILA'
      Origin = 'DBBROKER.TFILA_REG_EXP.DT_FILA'
    end
    object qry_fila_expDATA_FILA: TStringField
      FieldName = 'DATA_FILA'
      FixedChar = True
      Size = 30
    end
    object qry_fila_expHORA_FILA: TStringField
      FieldName = 'HORA_FILA'
      FixedChar = True
      Size = 30
    end
    object qry_fila_expDATA_STATUS: TStringField
      FieldName = 'DATA_STATUS'
      FixedChar = True
      Size = 30
    end
    object qry_fila_expHORA_STATUS: TStringField
      FieldName = 'HORA_STATUS'
      FixedChar = True
      Size = 30
    end
  end
  object upd_fila_exp: TUpdateSQL
    ModifySQL.Strings = (
      'update TFILA_REG_EXP'
      'set'
      '  CD_USUARIO = :CD_USUARIO,'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  DT_STATUS = :DT_STATUS,'
      '  TX_STATUS = :TX_STATUS'
      'where'
      '  CD_FILA = :OLD_CD_FILA')
    InsertSQL.Strings = (
      'insert into TFILA_REG_EXP'
      '  (CD_USUARIO, NR_PROCESSO, DT_STATUS, TX_STATUS)'
      'values'
      '  (:CD_USUARIO, :NR_PROCESSO,  :DT_STATUS, :TX_STATUS)')
    DeleteSQL.Strings = (
      'delete TFILA_REG_EXP'
      'where'
      '  CD_FILA = :OLD_CD_FILA')
    Left = 184
    Top = 352
  end
  object ds_fila_exp: TDataSource
    DataSet = qry_fila_exp
    Left = 32
    Top = 352
  end
end

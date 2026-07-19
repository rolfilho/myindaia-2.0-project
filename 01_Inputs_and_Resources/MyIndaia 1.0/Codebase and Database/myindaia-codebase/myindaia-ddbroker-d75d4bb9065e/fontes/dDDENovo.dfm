object datm_dde_novo: Tdatm_dde_novo
  OldCreateOrder = False
  Left = 424
  Top = 60
  Height = 755
  Width = 1155
  object qry_dde: TQuery
    CachedUpdates = True
    AfterOpen = qry_ddeAfterOpen
    AfterInsert = qry_ddeAfterInsert
    BeforePost = qry_ddeBeforePost
    AfterPost = AplicaUpdates
    AfterDelete = qry_ddeAfterDelete
    OnCalcFields = qry_ddeCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_SD, NR_REGISTRO_SD, CD_EXPORTADOR, SUBSTRING(NR_SD, 5,' +
        ' 12) AS NR_SD_REDUZIDO,'
      '       CD_VIA_TRANSPORTE, VL_TOTAL_PESO_LIQUIDO, VL_M3,'
      
        '       VL_TOTAL_PESO_BRUTO, VL_TOTAL_COND_VENDA, QT_ESTAB_DESPAC' +
        'HO, CD_PROPRIETARIO,'
      
        '       TX_REGIMES_ADUANEIROS, IN_INF_REPRESENTANTE_LEGAL, IN_INF' +
        '_DESPACHO_POSTERIOR,'
      
        '       IN_INF_DESP_CARGA_FRACIONADA, IN_OUTROS_DOCS_INF_RECEPCAO' +
        ', IN_INF_PRESENCA_CARGA,'
      
        '       IN_INF_DADOS_EMBARQUE, CD_URF_EMBARQUE, CD_URF_DESPACHO, ' +
        'CD_RECINTO, CD_SETOR,'
      
        '       DT_VALIDADE_EMBARQUE, TX_NACIONALIDADE_EMBARCACAO, CD_REC' +
        'INTO_ALFANDEG, TX_COMPLEMENTAR, IN_PROC_ADM, NR_PROC_ADM, IN_NF_' +
        'DISPENSADA, TX_BASE_LEGAL, DT_CRIACAO_SD, IN_WEB, TX_STATUS_CAPA' +
        ', TX_ERRO, CD_STATUS, IN_URGENTE, IN_EXTERNA, IN_CONSULTA_STATUS' +
        ', '
      
        '       TX_IDENT_VEIC_TRANSP, TX_NUMERO_ESTABELECIMENTO, DT_DATA_' +
        'SD, TX_LOCAL_NAO_ALFANDEG, TP_DETALHE_OPERACAO, TP_OPERACAO, CD_' +
        'TP_SITUACOES_ESPECIAIS, NM_PERIODO_CONFERENCIA, END_CONFERENCIA,' +
        ' NM_JUSTIFICATIVA_CONFERENCIA, TX_OBS_CONFERENCIA,'
      
        '       QT_TOTAL_VOLUMES, NR_SUFIXO_CGC, IN_SELECIONADO, CPF_USUA' +
        'RIO, TX_SITUCAO_DDE,IN_FILA, IN_REALIZA_TRANSITO, (SELECT CONVER' +
        'T(VARCHAR, MAX(NR_IDENT_TRANSMISSAO)) FROM TSD_IDENT_TRANSMISSAO' +
        ' WHERE NR_SD = SD.NR_SD) MAX_IDENT_TRANSMISSAO'
      'FROM TSD SD (NOLOCK)'
      'WHERE SD.NR_SD = :NR_SD'
      'ORDER BY'
      'SUBSTRING(NR_SD,13,2) DESC, NR_SD DESC'
      ' '
      ' '
      ' ')
    UpdateObject = upd_dde
    Left = 125
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
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
    object qry_ddeIN_REALIZA_TRANSITO: TBooleanField
      FieldName = 'IN_REALIZA_TRANSITO'
    end
    object qry_ddeTP_DETALHE_OPERACAO: TIntegerField
      FieldName = 'TP_DETALHE_OPERACAO'
    end
    object qry_ddeTX_COMPLEMENTAR: TStringField
      FieldName = 'TX_COMPLEMENTAR'
      FixedChar = True
      Size = 255
    end
    object qry_ddeIN_PROC_ADM: TBooleanField
      FieldName = 'IN_PROC_ADM'
    end
    object qry_ddeNR_PROC_ADM: TStringField
      FieldName = 'NR_PROC_ADM'
      FixedChar = True
    end
    object qry_ddeIN_NF_DISPENSADA: TBooleanField
      FieldName = 'IN_NF_DISPENSADA'
    end
    object qry_ddeTP_OPERACAO: TIntegerField
      FieldName = 'TP_OPERACAO'
    end
    object qry_ddeCD_TP_SITUACOES_ESPECIAIS: TIntegerField
      FieldName = 'CD_TP_SITUACOES_ESPECIAIS'
    end
    object qry_ddeNM_PERIODO_CONFERENCIA: TStringField
      FieldName = 'NM_PERIODO_CONFERENCIA'
      FixedChar = True
      Size = 255
    end
    object qry_ddeEND_CONFERENCIA: TStringField
      FieldName = 'END_CONFERENCIA'
      FixedChar = True
      Size = 255
    end
    object qry_ddeNM_JUSTIFICATIVA_CONFERENCIA: TStringField
      FieldName = 'NM_JUSTIFICATIVA_CONFERENCIA'
      FixedChar = True
      Size = 255
    end
    object qry_ddeTX_OBS_CONFERENCIA: TStringField
      FieldName = 'TX_OBS_CONFERENCIA'
      FixedChar = True
      Size = 255
    end
    object qry_ddeTX_BASE_LEGAL: TStringField
      FieldName = 'TX_BASE_LEGAL'
      FixedChar = True
      Size = 255
    end
    object qry_ddeMAX_IDENT_TRANSMISSAO: TStringField
      FieldName = 'MAX_IDENT_TRANSMISSAO'
      FixedChar = True
      Size = 33
    end
    object qry_ddeDT_CRIACAO_SD: TDateTimeField
      FieldName = 'DT_CRIACAO_SD'
    end
    object qry_ddeIN_WEB: TBooleanField
      FieldName = 'IN_WEB'
    end
    object qry_ddeTX_ERRO: TStringField
      FieldName = 'TX_ERRO'
      FixedChar = True
      Size = 255
    end
    object qry_ddeCD_STATUS: TIntegerField
      FieldName = 'CD_STATUS'
    end
    object qry_ddeIN_URGENTE: TBooleanField
      FieldName = 'IN_URGENTE'
      DisplayValues = '0'
    end
    object qry_ddeIN_EXTERNA: TBooleanField
      FieldName = 'IN_EXTERNA'
    end
    object qry_ddeIN_CONSULTA_STATUS: TBooleanField
      FieldName = 'IN_CONSULTA_STATUS'
    end
    object qry_ddeVL_M3: TFloatField
      Alignment = taLeftJustify
      FieldName = 'VL_M3'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
  end
  object ds_dde: TDataSource
    DataSet = qry_dde
    OnDataChange = ds_ddeDataChange
    Left = 52
    Top = 9
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
      '  TX_COMPLEMENTAR = :TX_COMPLEMENTAR,'
      '  IN_PROC_ADM = :IN_PROC_ADM,'
      '  NR_PROC_ADM = :NR_PROC_ADM,'
      '  IN_NF_DISPENSADA = :IN_NF_DISPENSADA,'
      '  TX_BASE_LEGAL = :TX_BASE_LEGAL,'
      '  TX_IDENT_VEIC_TRANSP = :TX_IDENT_VEIC_TRANSP,'
      '  TX_NUMERO_ESTABELECIMENTO = :TX_NUMERO_ESTABELECIMENTO,'
      '  DT_DATA_SD = :DT_DATA_SD,'
      '  TX_LOCAL_NAO_ALFANDEG = :TX_LOCAL_NAO_ALFANDEG,'
      '  TP_DETALHE_OPERACAO = :TP_DETALHE_OPERACAO,'
      '  TP_OPERACAO = :TP_OPERACAO,'
      '  CD_TP_SITUACOES_ESPECIAIS = :CD_TP_SITUACOES_ESPECIAIS,'
      '  NM_PERIODO_CONFERENCIA = :NM_PERIODO_CONFERENCIA,'
      '  END_CONFERENCIA = :END_CONFERENCIA,'
      '  NM_JUSTIFICATIVA_CONFERENCIA = :NM_JUSTIFICATIVA_CONFERENCIA,'
      '  TX_OBS_CONFERENCIA = :TX_OBS_CONFERENCIA,'
      '  QT_TOTAL_VOLUMES = :QT_TOTAL_VOLUMES,'
      '  NR_SUFIXO_CGC = :NR_SUFIXO_CGC,'
      '  IN_SELECIONADO = :IN_SELECIONADO,'
      '  CPF_USUARIO = :CPF_USUARIO,'
      '  TX_SITUCAO_DDE = :TX_SITUCAO_DDE,'
      '  IN_FILA = :IN_FILA,'
      '  IN_REALIZA_TRANSITO = :IN_REALIZA_TRANSITO,'
      '  CD_STATUS = :CD_STATUS,'
      '  IN_URGENTE = :IN_URGENTE,'
      '  IN_EXTERNA = :IN_EXTERNA, '
      '  IN_CONSULTA_STATUS = :IN_CONSULTA_STATUS,'
      '  VL_M3 = :VL_M3'
      'where'
      '  NR_SD = :OLD_NR_SD')
    InsertSQL.Strings = (
      'insert into TSD'
      '  (NR_SD, NR_REGISTRO_SD, CD_EXPORTADOR, '
      'CD_VIA_TRANSPORTE, '
      '   VL_TOTAL_PESO_LIQUIDO, VL_TOTAL_PESO_BRUTO, '
      'VL_TOTAL_COND_VENDA, QT_ESTAB_DESPACHO, '
      '   CD_PROPRIETARIO, TX_REGIMES_ADUANEIROS, '
      'IN_INF_REPRESENTANTE_LEGAL, '
      '   IN_INF_DESPACHO_POSTERIOR, IN_INF_DESP_CARGA_FRACIONADA, '
      'IN_OUTROS_DOCS_INF_RECEPCAO, '
      '   IN_INF_PRESENCA_CARGA, IN_INF_DADOS_EMBARQUE, '
      'CD_URF_EMBARQUE, CD_URF_DESPACHO, '
      '   CD_RECINTO, CD_SETOR, DT_VALIDADE_EMBARQUE, '
      'TX_NACIONALIDADE_EMBARCACAO, '
      '   CD_RECINTO_ALFANDEG, TX_COMPLEMENTAR, IN_PROC_ADM, '
      'NR_PROC_ADM, IN_NF_DISPENSADA, '
      '   TX_BASE_LEGAL, TX_IDENT_VEIC_TRANSP, '
      'TX_NUMERO_ESTABELECIMENTO, DT_DATA_SD, '
      '   TX_LOCAL_NAO_ALFANDEG, TP_DETALHE_OPERACAO, TP_OPERACAO, '
      'CD_TP_SITUACOES_ESPECIAIS, '
      '   NM_PERIODO_CONFERENCIA, END_CONFERENCIA, '
      'NM_JUSTIFICATIVA_CONFERENCIA, '
      '   TX_OBS_CONFERENCIA, QT_TOTAL_VOLUMES, NR_SUFIXO_CGC, '
      'IN_SELECIONADO, '
      
        '   CPF_USUARIO, TX_SITUCAO_DDE, IN_FILA, IN_REALIZA_TRANSITO, DT' +
        '_CRIACAO_SD, IN_WEB, CD_STATUS, IN_URGENTE, IN_EXTERNA, IN_CONSU' +
        'LTA_STATUS,'
      'VL_M3)'
      'values'
      '  (:NR_SD, :NR_REGISTRO_SD, :CD_EXPORTADOR, '
      ':CD_VIA_TRANSPORTE, '
      '   :VL_TOTAL_PESO_LIQUIDO, :VL_TOTAL_PESO_BRUTO, '
      ':VL_TOTAL_COND_VENDA, '
      
        '   :QT_ESTAB_DESPACHO, :CD_PROPRIETARIO, :TX_REGIMES_ADUANEIROS,' +
        ' '
      ':IN_INF_REPRESENTANTE_LEGAL, '
      '   :IN_INF_DESPACHO_POSTERIOR, :IN_INF_DESP_CARGA_FRACIONADA, '
      ':IN_OUTROS_DOCS_INF_RECEPCAO, '
      '   :IN_INF_PRESENCA_CARGA, :IN_INF_DADOS_EMBARQUE, '
      ':CD_URF_EMBARQUE, :CD_URF_DESPACHO, '
      '   :CD_RECINTO, :CD_SETOR, :DT_VALIDADE_EMBARQUE, '
      ':TX_NACIONALIDADE_EMBARCACAO, '
      '   :CD_RECINTO_ALFANDEG, :TX_COMPLEMENTAR, :IN_PROC_ADM, '
      ':NR_PROC_ADM, '
      '   :IN_NF_DISPENSADA, :TX_BASE_LEGAL, :TX_IDENT_VEIC_TRANSP, '
      ':TX_NUMERO_ESTABELECIMENTO, '
      '   :DT_DATA_SD, :TX_LOCAL_NAO_ALFANDEG, :TP_DETALHE_OPERACAO, '
      ':TP_OPERACAO, '
      '   :CD_TP_SITUACOES_ESPECIAIS, :NM_PERIODO_CONFERENCIA, '
      ':END_CONFERENCIA, '
      '   :NM_JUSTIFICATIVA_CONFERENCIA, :TX_OBS_CONFERENCIA, '
      ':QT_TOTAL_VOLUMES, '
      
        '   :NR_SUFIXO_CGC, :IN_SELECIONADO, :CPF_USUARIO, :TX_SITUCAO_DD' +
        'E, '
      ':IN_FILA, '
      
        '   :IN_REALIZA_TRANSITO, GETDATE(), 1, :CD_STATUS, :IN_URGENTE, ' +
        ':IN_EXTERNA, :IN_CONSULTA_STATUS,'
      ':VL_M3)')
    DeleteSQL.Strings = (
      'delete from TSD'
      'where'
      '  NR_SD = :OLD_NR_SD')
    Left = 203
    Top = 9
  end
  object qry_dde_re: TQuery
    CachedUpdates = True
    BeforePost = qry_dde_reBeforePost
    AfterPost = qry_dde_reAfterPost
    AfterCancel = AplicaUpdates
    AfterDelete = qry_dde_reAfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TSD_RE (NOLOCK)'
      'WHERE NR_SD = :NR_SD')
    UpdateObject = upd_dde_re
    Left = 124
    Top = 125
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_SD'
        ParamType = ptUnknown
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
    Left = 52
    Top = 124
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
      'delete from TSD_RE'
      'where'
      '  NR_SD = :OLD_NR_SD and'
      '  NR_RE_SISCOMEX = :OLD_NR_RE_SISCOMEX')
    Left = 209
    Top = 125
  end
  object qry_dde_espec: TQuery
    CachedUpdates = True
    AfterOpen = qry_dde_especAfterOpen
    BeforePost = qry_dde_especBeforePost
    AfterPost = qry_dde_especAfterPost
    AfterDelete = qry_dde_especAfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT *, CASE WHEN CD_MERC_PERIGOSA IS NULL THEN 0 ELSE 1 END I' +
        'N_MERC_PERIGOSA'
      'FROM TSD_ESPEC (NOLOCK)'
      'WHERE NR_SD = :NR_SD'
      '  AND ((:TIPO = '#39'2'#39' AND CD_ESPECIE IS NOT NULL)  '
      '           OR  (:TIPO = '#39'1'#39' AND CD_ESPECIE IS NULL))')
    UpdateObject = upd_dde_espec
    Left = 125
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO'
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
    object qry_dde_especCD_ESPECIE: TStringField
      FieldName = 'CD_ESPECIE'
      Origin = 'DBBROKER.TSD_ESPEC.CD_ESPECIE'
      FixedChar = True
      Size = 2
    end
    object qry_dde_especPB_ESPECIE: TFloatField
      FieldName = 'PB_ESPECIE'
      Origin = 'DBBROKER.TSD_ESPEC.PB_ESPECIE'
    end
    object qry_dde_especNR_SEQUENCIAL: TIntegerField
      FieldName = 'NR_SEQUENCIAL'
      Origin = 'DBBROKER.TSD_ESPEC.NR_SEQUENCIAL'
    end
    object qry_dde_especNM_ESPECIE: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_ESPECIE'
      LookupDataSet = qry_embalagem_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'TEXTO'
      KeyFields = 'CD_ESPECIE'
      Size = 50
      Lookup = True
    end
    object qry_dde_especCD_MERC_PERIGOSA: TIntegerField
      FieldName = 'CD_MERC_PERIGOSA'
      Origin = 'DBBROKER.TSD_ESPEC.CD_MERC_PERIGOSA'
    end
    object qry_dde_especIN_MERC_PERIGOSA: TIntegerField
      FieldName = 'IN_MERC_PERIGOSA'
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
      '  CD_USUARIO = :CD_USUARIO,'
      '  PB_ESPECIE = :PB_ESPECIE,'
      '  NR_SEQUENCIAL = :NR_SEQUENCIAL,'
      '  CD_MERC_PERIGOSA = :CD_MERC_PERIGOSA'
      'where'
      '  NR_SD = :OLD_NR_SD and'
      '  NR_SEQUENCIAL = :OLD_NR_SEQUENCIAL')
    InsertSQL.Strings = (
      'insert into TSD_ESPEC'
      '  (NR_SD, CD_ESPECIE, QT_ESPECIE, TX_MARCACAO_VOLUME, DT_DATA, '
      'CD_USUARIO, '
      '   PB_ESPECIE, NR_SEQUENCIAL, CD_MERC_PERIGOSA)'
      'values'
      
        '  (:NR_SD, :CD_ESPECIE, :QT_ESPECIE, :TX_MARCACAO_VOLUME, :DT_DA' +
        'TA, '
      ':CD_USUARIO, '
      '   :PB_ESPECIE, :NR_SEQUENCIAL, :CD_MERC_PERIGOSA)')
    DeleteSQL.Strings = (
      'delete from TSD_ESPEC'
      'where'
      '  NR_SD = :OLD_NR_SD and'
      '  NR_SEQUENCIAL = :OLD_NR_SEQUENCIAL')
    Left = 210
    Top = 64
  end
  object ds_dde_espec: TDataSource
    DataSet = qry_dde_espec
    OnStateChange = ds_dde_especStateChange
    Left = 52
    Top = 63
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC (NOLOCK)'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 126
    Top = 186
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
    Left = 52
    Top = 188
  end
  object qry_xml_capa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT EN.CGC_EMPRESA '#39'cnpj'#39','
      '       SD.TP_OPERACAO '#39'codigo-tipo-operacao'#39','
      '       SD.TP_DETALHE_OPERACAO '#39'codigo-tipo-operacao-detalhe'#39','
      '       SD.CD_URF_DESPACHO '#39'ul-despacho'#39','
      '       SD.CD_URF_EMBARQUE '#39'ul-embarque'#39','
      '       CONVERT(INT, SD.CD_VIA_TRANSPORTE) '#39'via-transporte'#39','
      '       SD.VL_TOTAL_PESO_BRUTO '#39'peso-bruto-despacho'#39','
      '       SD.VL_M3 '#39'cubagem-metro3'#39','
      '       ISNULL(SD.IN_REALIZA_TRANSITO, 0) '#39'realiza-transito'#39','
      '       SD.TX_COMPLEMENTAR '#39'info-complementar'#39','
      '       ISNULL(SD.IN_NF_DISPENSADA, 0) '#39'dispensada'#39','
      
        '       CD_TP_SITUACOES_ESPECIAIS '#39'codigo-tipo-operacao-sub-detal' +
        'he'#39','#9
      '       NM_PERIODO_CONFERENCIA '#39'periodo-proposto'#39','
      '       END_CONFERENCIA '#39'endereco'#39','
      '       NM_JUSTIFICATIVA_CONFERENCIA '#39'justificativa'#39','
      '       TX_OBS_CONFERENCIA '#39'observacao'#39','
      '       TX_BASE_LEGAL '#39'fundamentacao-legal'#39
      'FROM TSD SD  '
      '  INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = SD.CD_EXPORTADOR'
      ' WHERE SD.NR_SD = :NR_SD')
    Left = 1027
    Top = 25
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end>
    object qry_xml_capa_cnpj: TStringField
      FieldName = 'cnpj'
      FixedChar = True
      Size = 14
    end
    object qry_xml_capa_codigotipooperacao: TIntegerField
      FieldName = 'codigo-tipo-operacao'
    end
    object qry_xml_capa_codigotipooperacaodetalhe: TIntegerField
      FieldName = 'codigo-tipo-operacao-detalhe'
    end
    object qry_xml_capa_uldespacho: TStringField
      FieldName = 'ul-despacho'
      FixedChar = True
      Size = 7
    end
    object qry_xml_capa_ulembarque: TStringField
      FieldName = 'ul-embarque'
      FixedChar = True
      Size = 7
    end
    object qry_xml_capa_viatransporte: TIntegerField
      FieldName = 'via-transporte'
    end
    object qry_xml_capa_pesobrutodespacho: TFloatField
      FieldName = 'peso-bruto-despacho'
    end
    object qry_xml_capa_realizatransito: TBooleanField
      FieldName = 'realiza-transito'
    end
    object qry_xml_capa_infocomplementar: TStringField
      FieldName = 'info-complementar'
      FixedChar = True
      Size = 255
    end
    object qry_xml_capa_dispensada: TBooleanField
      FieldName = 'dispensada'
    end
    object qry_xml_capa_codigotipooperacaosubdetal: TIntegerField
      FieldName = 'codigo-tipo-operacao-sub-detal'
    end
    object qry_xml_capa_periodoproposto: TStringField
      FieldName = 'periodo-proposto'
      FixedChar = True
      Size = 255
    end
    object qry_xml_capa_endereco: TStringField
      FieldName = 'endereco'
      FixedChar = True
      Size = 255
    end
    object qry_xml_capa_justificativa: TStringField
      FieldName = 'justificativa'
      FixedChar = True
      Size = 255
    end
    object qry_xml_capa_observacao: TStringField
      FieldName = 'observacao'
      FixedChar = True
      Size = 255
    end
    object qry_xml_capa_fundamentacaolegal: TStringField
      FieldName = 'fundamentacao-legal'
      FixedChar = True
      Size = 255
    end
    object qry_xml_capa_cubagemmetro3: TFloatField
      FieldName = 'cubagem-metro3'
    end
  end
  object ds_xml_capa: TDataSource
    DataSet = qry_xml_capa_
    Left = 915
    Top = 25
  end
  object XML: TXMLDocument
    NodeIndentStr = '    '
    Options = [doNodeAutoCreate, doNodeAutoIndent, doAttrNull, doAutoPrefix, doNamespaceDecl]
    Left = 981
    Top = 448
    DOMVendorDesc = 'MSXML'
  end
  object ds_xml_carga: TDataSource
    DataSet = qry_xml_carga_
    Left = 919
    Top = 265
  end
  object qry_xml_carga_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ' SELECT CD_ESPECIE '#39'tipo-embalagem'#39', '
      '        CONVERT(INT, QT_ESPECIE) '#39'quantidade-embalagem'#39', '
      '        PB_ESPECIE '#39'peso-bruto'#39', '
      '        TX_MARCACAO_VOLUME '#39'marca-embalagem'#39','
      '        CD_MERC_PERIGOSA '#39'codigo-carga-perigosa'#39
      ' FROM TSD_ESPEC ES '
      ' WHERE ES.NR_SD = :NR_SD'
      'ORDER BY ES.CD_ESPECIE')
    Left = 1027
    Top = 265
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end>
    object qry_xml_carga_tipoembalagem: TStringField
      FieldName = 'tipo-embalagem'
      FixedChar = True
      Size = 2
    end
    object qry_xml_carga_quantidadeembalagem: TIntegerField
      FieldName = 'quantidade-embalagem'
    end
    object qry_xml_carga_pesobruto: TFloatField
      FieldName = 'peso-bruto'
    end
    object qry_xml_carga_marcaembalagem: TStringField
      FieldName = 'marca-embalagem'
      FixedChar = True
      Size = 60
    end
    object qry_xml_carga_codigocargaperigosa: TIntegerField
      FieldName = 'codigo-carga-perigosa'
    end
  end
  object ds_xml_nf: TDataSource
    DataSet = qry_xml_nf_
    Left = 916
    Top = 210
  end
  object qry_xml_nf_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NF.CGC_EMPRESA_NF '#39'cnpj'#39','
      'NF.ANO_EMISSAO_NF '#39'ano-emissao'#39','
      'NF.NR_SERIE_NF '#39'serie'#39','
      'NF.NR_NF '#39'numero'#39','
      'REPLACE(NF.NR_CHAVE_ACESSO,'#39' '#39', '#39#39') '#39'chave-acesso'#39','
      'NF.CD_TP_NF '#39'tipo'#39
      'FROM TSD_NF NF'
      'WHERE NR_SD = :NR_SD')
    Left = 1027
    Top = 209
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end>
    object qry_xml_nf_cnpj: TStringField
      FieldName = 'cnpj'
      FixedChar = True
      Size = 14
    end
    object qry_xml_nf_anoemissao: TIntegerField
      FieldName = 'ano-emissao'
    end
    object qry_xml_nf_serie: TStringField
      FieldName = 'serie'
      FixedChar = True
      Size = 5
    end
    object qry_xml_nf_numero: TIntegerField
      FieldName = 'numero'
    end
    object qry_xml_nf_chaveacesso: TStringField
      FieldName = 'chave-acesso'
      FixedChar = True
      Size = 255
    end
    object qry_xml_nf_tipo: TIntegerField
      FieldName = 'tipo'
    end
  end
  object ds_xml_docto: TDataSource
    DataSet = qry_xml_docto_
    Left = 916
    Top = 149
  end
  object qry_xml_docto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TIPO_DOCTO '#39'tipo'#39', NR_DOCTO '#39'identificador'#39
      'FROM TSD_DOCTOS'
      'WHERE NR_SD = :NR_SD')
    Left = 1027
    Top = 148
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end>
    object qry_xml_docto_tipo: TIntegerField
      FieldName = 'tipo'
    end
    object qry_xml_docto_identificador: TStringField
      FieldName = 'identificador'
      FixedChar = True
      Size = 50
    end
  end
  object ds_xml_re: TDataSource
    DataSet = qry_xml_re_
    Left = 916
    Top = 91
  end
  object qry_xml_re_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT REPLACE(REPLACE(NR_RE_SISCOMEX,'#39'-'#39', '#39#39'), '#39'/'#39','#39#39') '#39'numero-' +
        're'#39','
      '       NR_ANEXO_INICIAL '#39'anexo-inicial'#39','
      '       NR_ANEXO_FINAL '#39'anexo-final'#39
      'FROM TSD_RE'
      'WHERE NR_SD = :NR_SD')
    Left = 1027
    Top = 90
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end>
    object qry_xml_re_numerore: TStringField
      FieldName = 'numero-re'
      FixedChar = True
      Size = 255
    end
    object qry_xml_re_anexoinicial: TStringField
      FieldName = 'anexo-inicial'
      FixedChar = True
      Size = 3
    end
    object qry_xml_re_anexofinal: TStringField
      FieldName = 'anexo-final'
      FixedChar = True
      Size = 3
    end
  end
  object ds_urf: TDataSource
    DataSet = qry_urf_
    Left = 390
    Top = 373
  end
  object qry_urf_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, CODIGO + '#39' - '#39' + DESCRICAO AS TEXTO FROM TURF')
    Left = 517
    Top = 366
    object qry_urf_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TURF.CODIGO'
      FixedChar = True
      Size = 7
    end
    object qry_urf_TEXTO: TStringField
      FieldName = 'TEXTO'
      Origin = 'DBBROKER.TURF.CODIGO'
      FixedChar = True
      Size = 130
    end
  end
  object qry_via_transporte_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_VIA_TRANSPORTE CODIGO, CONVERT(VARCHAR, CONVERT(INT, C' +
        'D_VIA_TRANSPORTE)) + '#39' - '#39' + UPPER(NM_VIA_TRANSPORTE) AS TEXTO'
      'FROM TVIA_TRANSPORTE')
    Left = 517
    Top = 318
    object StringField1: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TURF.CODIGO'
      FixedChar = True
      Size = 7
    end
    object StringField2: TStringField
      FieldName = 'TEXTO'
      Origin = 'DBBROKER.TURF.CODIGO'
      FixedChar = True
      Size = 130
    end
  end
  object ds_via_transporte: TDataSource
    DataSet = qry_via_transporte_
    Left = 388
    Top = 319
  end
  object ds_situacoes_especiais: TDataSource
    DataSet = qry_situacoes_especiais_
    Left = 386
    Top = 262
  end
  object qry_situacoes_especiais_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_TP_SITUACOES_ESPECIAIS CODIGO, CONVERT(VARCHAR, CD_TP_' +
        'SITUACOES_ESPECIAIS) + '#39' - '#39' +  UPPER(NM_TP_SITUACOES_ESPECIAIS)' +
        ' TEXTO'
      'FROM TSD_SITUACOES_ESPECIAIS')
    Left = 517
    Top = 262
    object qry_situacoes_especiais_CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TSD_SITUACOES_ESPECIAIS.CD_TP_SITUACOES_ESPECIAIS'
    end
    object qry_situacoes_especiais_TEXTO: TStringField
      FieldName = 'TEXTO'
      Origin = 'DBBROKER.TSD_SITUACOES_ESPECIAIS.NM_TP_SITUACOES_ESPECIAIS'
      FixedChar = True
      Size = 50
    end
  end
  object upd_dde_doctos: TUpdateSQL
    ModifySQL.Strings = (
      'update TSD_DOCTOS'
      'set'
      '  NR_SD = :NR_SD,'
      '  CD_TIPO_DOCTO = :CD_TIPO_DOCTO,'
      '  NR_DOCTO = :NR_DOCTO,'
      '  CD_DOCTO = :CD_DOCTO,'
      '  NM_CAMINHO = :NM_CAMINHO'
      'where'
      '  NR_SD = :OLD_NR_SD and'
      '  CD_DOCTO = :OLD_CD_DOCTO')
    InsertSQL.Strings = (
      'insert into TSD_DOCTOS'
      '  (NR_SD, CD_TIPO_DOCTO, NR_DOCTO, CD_DOCTO, NM_CAMINHO)'
      'values'
      '  (:NR_SD, :CD_TIPO_DOCTO, :NR_DOCTO, :CD_DOCTO, :NM_CAMINHO)')
    DeleteSQL.Strings = (
      'delete from TSD_DOCTOS'
      'where'
      '  NR_SD = :OLD_NR_SD and'
      '  CD_DOCTO = :OLD_CD_DOCTO')
    Left = 201
    Top = 261
  end
  object qry_dde_doctos: TQuery
    CachedUpdates = True
    BeforePost = qry_dde_doctosBeforePost
    AfterPost = qry_dde_doctosAfterPost
    AfterDelete = qry_ddeAfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TSD_DOCTOS (NOLOCK)'
      'WHERE NR_SD = :NR_SD')
    UpdateObject = upd_dde_doctos
    Left = 117
    Top = 261
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end>
    object qry_dde_doctosNR_SD: TStringField
      FieldName = 'NR_SD'
      Origin = 'DBBROKER.TSD_DOCTOS.NR_SD'
      FixedChar = True
      Size = 18
    end
    object qry_dde_doctosCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
      Origin = 'DBBROKER.TSD_DOCTOS.CD_TIPO_DOCTO'
    end
    object qry_dde_doctosNR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Origin = 'DBBROKER.TSD_DOCTOS.NR_DOCTO'
      FixedChar = True
      Size = 50
    end
    object qry_dde_doctosCD_DOCTO: TIntegerField
      FieldName = 'CD_DOCTO'
      Origin = 'DBBROKER.TSD_DOCTOS.NR_DOCTO'
    end
    object qry_dde_doctosNM_TIPO_DOCTO: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_TIPO_DOCTO'
      LookupDataSet = qry_doctos_instrutivos_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'TEXTO'
      KeyFields = 'CD_TIPO_DOCTO'
      Size = 5000
      Lookup = True
    end
    object qry_dde_doctosNM_CAMINHO: TStringField
      FieldName = 'NM_CAMINHO'
      Origin = 'DBBROKER.TSD_DOCTOS.NM_CAMINHO'
      FixedChar = True
      Size = 255
    end
  end
  object ds_dde_doctos: TDataSource
    DataSet = qry_dde_doctos
    OnStateChange = ds_dde_doctosStateChange
    Left = 45
    Top = 260
  end
  object ds_doctos_instrutivos: TDataSource
    DataSet = qry_tipo_docto
    Left = 386
    Top = 201
  end
  object qry_doctos_instrutivos_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_TIPO_DOCTO CODIGO,  CONVERT(VARCHAR, CD_TIPO_DOCTO)  +' +
        ' '#39' - '#39' + UPPER(NM_TIPO_DOCTO) TEXTO '
      'FROM TTP_DOCTO_INSTRUTIVO')
    Left = 517
    Top = 201
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TSD_SITUACOES_ESPECIAIS.CD_TP_SITUACOES_ESPECIAIS'
    end
    object StringField3: TStringField
      FieldName = 'TEXTO'
      Origin = 'DBBROKER.TSD_SITUACOES_ESPECIAIS.NM_TP_SITUACOES_ESPECIAIS'
      FixedChar = True
      Size = 50
    end
  end
  object ds_dde_lista: TDataSource
    DataSet = qry_dde_lista
    OnStateChange = ds_dde_listaStateChange
    Left = 60
    Top = 455
  end
  object qry_dde_lista: TQuery
    AfterOpen = qry_dde_listaAfterOpen
    AfterScroll = qry_dde_listaAfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_SD,   '
      '  SUBSTRING(NR_SD, 5, 12) AS NR_SD_REDUZIDO,         '
      '  NM_EMPRESA AS NM_EXPORTADOR,'
      '  NR_REGISTRO_SD,'
      '  DT_DATA_SD,'
      '  TX_STATUS_CAPA,'
      '  ISNULL(CD_STATUS, 0) as CD_STATUS,'
      '  ISNULL(IN_EXTERNA, 0) as IN_EXTERNA,'
      '  ISNULL(IN_CONSULTA_STATUS, 0) as IN_CONSULTA_STATUS,'
      
        '   (SELECT CONVERT(VARCHAR, MAX(NR_IDENT_TRANSMISSAO)) FROM TSD_' +
        'IDENT_TRANSMISSAO WHERE NR_SD = SD.NR_SD) MAX_IDENT_TRANSMISSAO,'
      '  CPF_USUARIO,'
      '  EN.CD_EMPRESA'
      'FROM TSD SD (NOLOCK)'
      
        '  LEFT JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = SD.CD_EXPORTADOR ' +
        ' '
      'WHERE SD.IN_WEB = '#39'1'#39' AND SUBSTRING(NR_SD,1,2) = :CD_UNID_NEG'
      
        '  AND ((ISNULL(SD.DT_DATA_SD, SD.DT_CRIACAO_SD) >= GETDATE() - 6' +
        '0) '
      '  OR :IN = '#39'1'#39')'
      'ORDER BY'
      'SUBSTRING(NR_SD,13,2) DESC, NR_SD DESC')
    Left = 133
    Top = 455
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN'
        ParamType = ptInput
      end>
    object qry_dde_listaNR_SD: TStringField
      FieldName = 'NR_SD'
      FixedChar = True
      Size = 18
    end
    object qry_dde_listaNR_SD_REDUZIDO: TStringField
      FieldName = 'NR_SD_REDUZIDO'
      FixedChar = True
      Size = 12
    end
    object qry_dde_listaNM_EXPORTADOR: TStringField
      FieldName = 'NM_EXPORTADOR'
      FixedChar = True
      Size = 80
    end
    object qry_dde_listaNR_REGISTRO_SD: TStringField
      FieldName = 'NR_REGISTRO_SD'
      FixedChar = True
      Size = 12
    end
    object qry_dde_listaDT_DATA_SD: TDateTimeField
      FieldName = 'DT_DATA_SD'
    end
    object qry_dde_listaTX_STATUS_CAPA: TStringField
      FieldName = 'TX_STATUS_CAPA'
      FixedChar = True
      Size = 255
    end
    object qry_dde_listaMAX_IDENT_TRANSMISSAO: TStringField
      FieldName = 'MAX_IDENT_TRANSMISSAO'
      FixedChar = True
      Size = 30
    end
    object qry_dde_listaCD_STATUS: TIntegerField
      FieldName = 'CD_STATUS'
    end
    object qry_dde_listaIN_EXTERNA: TBooleanField
      FieldName = 'IN_EXTERNA'
    end
    object qry_dde_listaIN_CONSULTA_STATUS: TBooleanField
      FieldName = 'IN_CONSULTA_STATUS'
    end
    object qry_dde_listaCPF_USUARIO: TStringField
      FieldName = 'CPF_USUARIO'
      Size = 11
    end
    object qry_dde_listaCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Size = 5
    end
  end
  object upd_dde_processos: TUpdateSQL
    ModifySQL.Strings = (
      'update TSD_PROCESSOS'
      'set'
      '  NR_SD = :NR_SD,'
      '  CD_TIPO_PROCESSO = :CD_TIPO_PROCESSO,'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NM_PROCESSO = :NM_PROCESSO'
      'where'
      '  CD_PROCESSO = :OLD_CD_PROCESSO')
    InsertSQL.Strings = (
      'insert into TSD_PROCESSOS'
      '  (NR_SD, CD_TIPO_PROCESSO, NR_PROCESSO, '
      'NM_PROCESSO)'
      'values'
      '  (:NR_SD, :CD_TIPO_PROCESSO, :NR_PROCESSO, '
      ':NM_PROCESSO)')
    DeleteSQL.Strings = (
      'delete from TSD_PROCESSOS'
      'where'
      '  CD_PROCESSO = :OLD_CD_PROCESSO')
    Left = 233
    Top = 325
  end
  object qry_dde_processos: TQuery
    CachedUpdates = True
    BeforePost = qry_dde_processosBeforePost
    AfterPost = qry_dde_processosAfterPost
    AfterDelete = qry_ddeAfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.*'
      'FROM TSD_PROCESSOS P'
      'WHERE NR_SD = :NR_SD')
    UpdateObject = upd_dde_processos
    Left = 133
    Top = 325
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end>
    object qry_dde_processosNR_SD: TStringField
      FieldName = 'NR_SD'
      Origin = 'DBBROKER.TSD_PROCESSOS.NR_SD'
      FixedChar = True
      Size = 18
    end
    object qry_dde_processosCD_TIPO_PROCESSO: TIntegerField
      FieldName = 'CD_TIPO_PROCESSO'
      Origin = 'DBBROKER.TSD_PROCESSOS.CD_TIPO_PROCESSO'
    end
    object qry_dde_processosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TSD_PROCESSOS.NR_PROCESSO'
      FixedChar = True
      Size = 50
    end
    object qry_dde_processosNM_PROCESSO: TStringField
      FieldName = 'NM_PROCESSO'
      Origin = 'DBBROKER.TSD_PROCESSOS.NM_PROCESSO'
      FixedChar = True
      Size = 50
    end
    object qry_dde_processosCD_PROCESSO: TAutoIncField
      FieldName = 'CD_PROCESSO'
      Origin = 'DBBROKER.TSD_PROCESSOS.CD_PROCESSO'
    end
    object qry_dde_processosNM_TIPO_PROCESSO: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_TIPO_PROCESSO'
      LookupDataSet = qry_tipo_processos_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'TEXTO'
      KeyFields = 'CD_TIPO_PROCESSO'
      Size = 50
      Lookup = True
    end
  end
  object ds_dde_processos: TDataSource
    DataSet = qry_dde_processos
    OnStateChange = ds_dde_processosStateChange
    Left = 42
    Top = 325
  end
  object ds_tipo_processos: TDataSource
    DataSet = qry_tipo_processos_
    Left = 391
    Top = 430
  end
  object qry_tipo_processos_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO CODIGO, UPPER(DESCRICAO) TEXTO '
      'FROM TTP_PROCESSO_VINCULADO'
      'WHERE CODIGO IN (1, 2)')
    Left = 517
    Top = 430
    object qry_tipo_processos_CODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 1
    end
    object qry_tipo_processos_TEXTO: TStringField
      FieldName = 'TEXTO'
      FixedChar = True
      Size = 25
    end
  end
  object ds_embalagem: TDataSource
    DataSet = qry_embalagem_
    Left = 390
    Top = 495
  end
  object qry_embalagem_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT Codigo CODIGO, Descricao TEXTO '
      'FROM TTP_EMBALAGEM')
    Left = 517
    Top = 497
    object qry_embalagem_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TTP_EMBALAGEM.Codigo'
      FixedChar = True
      Size = 2
    end
    object qry_embalagem_TEXTO: TStringField
      FieldName = 'TEXTO'
      Origin = 'DBBROKER.TTP_EMBALAGEM.Descricao'
      FixedChar = True
      Size = 120
    end
  end
  object ds_dde_merc_perigosa: TDataSource
    DataSet = qry_dde_merc_perigosa
    Left = 63
    Top = 390
  end
  object qry_dde_merc_perigosa: TQuery
    CachedUpdates = True
    AfterPost = qry_dde_merc_perigosaAfterPost
    AfterDelete = qry_dde_merc_perigosaAfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *  FROM TSD_RE_MERCADORIA_PERIGOSA (NOLOCK)'
      'WHERE NR_SD = :NR_SD')
    UpdateObject = up_dde_merc_perigosa
    Left = 183
    Top = 390
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end>
    object qry_dde_merc_perigosaNR_SD: TStringField
      FieldName = 'NR_SD'
      Origin = 'DBBROKER.TSD_RE_MERCADORIA_PERIGOSA.NR_SD'
      FixedChar = True
      Size = 18
    end
    object qry_dde_merc_perigosaNR_RE_SISCOMEX: TStringField
      FieldName = 'NR_RE_SISCOMEX'
      Origin = 'DBBROKER.TSD_RE_MERCADORIA_PERIGOSA.NR_RE_SISCOMEX'
      FixedChar = True
      Size = 30
    end
    object qry_dde_merc_perigosaNR_ANEXO: TStringField
      FieldName = 'NR_ANEXO'
      Origin = 'DBBROKER.TSD_RE_MERCADORIA_PERIGOSA.NR_ANEXO'
      FixedChar = True
      Size = 3
    end
    object qry_dde_merc_perigosaCD_CLASSE: TIntegerField
      FieldName = 'CD_CLASSE'
      Origin = 'DBBROKER.TSD_RE_MERCADORIA_PERIGOSA.CD_CLASSE'
    end
    object qry_dde_merc_perigosaCD_INDICADOR: TIntegerField
      FieldName = 'CD_INDICADOR'
      Origin = 'DBBROKER.TSD_RE_MERCADORIA_PERIGOSA.CD_INDICADOR'
    end
    object qry_dde_merc_perigosaNM_CLASSE: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_CLASSE'
      LookupDataSet = qry_classe_merc_perigosa
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'TEXTO'
      KeyFields = 'CD_CLASSE'
      Size = 5000
      Lookup = True
    end
    object qry_dde_merc_perigosaNM_INDICADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_INDICADOR'
      LookupDataSet = qry_tipo_merc_perigosa
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'TEXTO'
      KeyFields = 'CD_INDICADOR'
      Size = 5000
      Lookup = True
    end
    object qry_dde_merc_perigosaCD_MERC_PERIGOSA: TIntegerField
      FieldName = 'CD_MERC_PERIGOSA'
      Origin = 'DBBROKER.TSD_RE_MERCADORIA_PERIGOSA.NR_SD'
    end
    object qry_dde_merc_perigosaCD_TIPO_CARGA: TIntegerField
      FieldName = 'CD_TIPO_CARGA'
      Origin = 'DBBROKER.TSD_RE_MERCADORIA_PERIGOSA.CD_TIPO_CARGA'
    end
    object qry_dde_merc_perigosaNM_TIPO_CARGA: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_TIPO_CARGA'
      LookupDataSet = qry_tipo_carga_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'TEXTO'
      KeyFields = 'CD_TIPO_CARGA'
      Size = 5000
      Lookup = True
    end
  end
  object up_dde_merc_perigosa: TUpdateSQL
    ModifySQL.Strings = (
      'update TSD_RE_MERCADORIA_PERIGOSA'
      'set'
      '  NR_SD = :NR_SD,'
      '  NR_RE_SISCOMEX = :NR_RE_SISCOMEX,'
      '  NR_ANEXO = :NR_ANEXO,'
      '  CD_CLASSE = :CD_CLASSE,'
      '  CD_INDICADOR = :CD_INDICADOR,'
      '  CD_MERC_PERIGOSA = :CD_MERC_PERIGOSA,'
      '  CD_TIPO_CARGA = :CD_TIPO_CARGA'
      'where'
      '  NR_SD = :OLD_NR_SD and'
      '  CD_MERC_PERIGOSA = :OLD_CD_MERC_PERIGOSA')
    InsertSQL.Strings = (
      'insert into TSD_RE_MERCADORIA_PERIGOSA'
      '  (NR_SD, NR_RE_SISCOMEX, NR_ANEXO, CD_CLASSE, CD_INDICADOR, '
      'CD_MERC_PERIGOSA, '
      '   CD_TIPO_CARGA)'
      'values'
      
        '  (:NR_SD, :NR_RE_SISCOMEX, :NR_ANEXO, :CD_CLASSE, :CD_INDICADOR' +
        ', '
      ':CD_MERC_PERIGOSA, '
      '   :CD_TIPO_CARGA)')
    DeleteSQL.Strings = (
      'delete from TSD_RE_MERCADORIA_PERIGOSA'
      'where'
      '  NR_SD = :OLD_NR_SD and'
      '  CD_MERC_PERIGOSA = :OLD_CD_MERC_PERIGOSA')
    Left = 303
    Top = 391
  end
  object ds_classe_merc_perigosa: TDataSource
    DataSet = qry_classe_merc_perigosa
    Left = 387
    Top = 14
  end
  object qry_classe_merc_perigosa: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CLASSE CODIGO, NM_CLASSE TEXTO'
      'FROM TCLASSE_MERCADORIA_PERIGOSA')
    Left = 507
    Top = 14
    object qry_classe_merc_perigosaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TCLASSE_MERCADORIA_PERIGOSA.CD_CLASSE'
    end
    object qry_classe_merc_perigosaTEXTO: TStringField
      FieldName = 'TEXTO'
      Origin = 'DBBROKER.TCLASSE_MERCADORIA_PERIGOSA.NM_CLASSE'
      FixedChar = True
      Size = 255
    end
  end
  object ds_tipo_merc_perigosa: TDataSource
    DataSet = qry_tipo_merc_perigosa
    Left = 387
    Top = 77
  end
  object qry_tipo_merc_perigosa: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ID_MERCADORIA CODIGO, NM_ID_MERCADORIA TEXTO '
      'FROM TTP_MERCADORIA_PERIGOSA')
    Left = 507
    Top = 77
    object qry_tipo_merc_perigosaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TTP_MERCADORIA_PERIGOSA.CD_ID_MERCADORIA'
    end
    object qry_tipo_merc_perigosaTEXTO: TStringField
      FieldName = 'TEXTO'
      Origin = 'DBBROKER.TTP_MERCADORIA_PERIGOSA.NM_ID_MERCADORIA'
      FixedChar = True
      Size = 255
    end
  end
  object qry_combo_classe: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_CLASSE CODIGO,  CONVERT(VARCHAR, CD_CLASSE) + '#39' - '#39' + ' +
        'NM_CLASSE TEXTO'
      'FROM TCLASSE_MERCADORIA_PERIGOSA')
    Left = 773
    Top = 78
    object IntegerField5: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TCLASSE_MERCADORIA_PERIGOSA.CD_CLASSE'
    end
    object StringField12: TStringField
      FieldName = 'TEXTO'
      Origin = 'DBBROKER.TCLASSE_MERCADORIA_PERIGOSA.NM_CLASSE'
      FixedChar = True
      Size = 255
    end
  end
  object ds_combo_classe: TDataSource
    DataSet = qry_combo_classe
    Left = 629
    Top = 78
  end
  object qry_combo_indicador: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_ID_MERCADORIA CODIGO, CONVERT(VARCHAR, CD_ID_MERCADORI' +
        'A) + '#39' - '#39' + NM_ID_MERCADORIA TEXTO'
      'FROM TTP_MERCADORIA_PERIGOSA'
      'WHERE CD_CLASSE = :CD_CLASSE')
    Left = 773
    Top = 141
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_CLASSE'
        ParamType = ptInput
      end>
    object IntegerField6: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TTP_MERCADORIA_PERIGOSA.CD_ID_MERCADORIA'
    end
    object StringField13: TStringField
      FieldName = 'TEXTO'
      Origin = 'DBBROKER.TTP_MERCADORIA_PERIGOSA.NM_ID_MERCADORIA'
      FixedChar = True
      Size = 255
    end
  end
  object ds_combo_indicador: TDataSource
    DataSet = qry_combo_indicador
    Left = 629
    Top = 141
  end
  object qry_tipo_carga_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TIPO_CARGA CODIGO, NM_TIPO_CARGA TEXTO'
      'FROM TTP_CARGA')
    Left = 517
    Top = 553
    object qry_tipo_carga_CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TTP_CARGA.CD_TIPO_CARGA'
    end
    object qry_tipo_carga_TEXTO: TStringField
      FieldName = 'TEXTO'
      Origin = 'DBBROKER.TTP_CARGA.NM_TIPO_CARGA'
      FixedChar = True
      Size = 255
    end
  end
  object ds_tipo_carga: TDataSource
    DataSet = qry_tipo_carga_
    Left = 390
    Top = 551
  end
  object qry_combo_carga: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TIPO_CARGA CODIGO, NM_TIPO_CARGA TEXTO'
      'FROM TTP_CARGA')
    Left = 769
    Top = 17
    object IntegerField7: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TTP_CARGA.CD_TIPO_CARGA'
    end
    object StringField14: TStringField
      FieldName = 'TEXTO'
      Origin = 'DBBROKER.TTP_CARGA.NM_TIPO_CARGA'
      FixedChar = True
      Size = 255
    end
  end
  object ds_combo_carga: TDataSource
    DataSet = qry_combo_carga
    Left = 624
    Top = 16
  end
  object ds_dde_nota_fiscal: TDataSource
    DataSet = qry_dde_nota_fiscal
    OnStateChange = ds_dde_nota_fiscalStateChange
    Left = 41
    Top = 535
  end
  object qry_dde_nota_fiscal: TQuery
    CachedUpdates = True
    BeforePost = qry_dde_nota_fiscalBeforePost
    AfterPost = qry_dde_nota_fiscalAfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT RIGHT(RTRIM(CGC_EMPRESA_NF),  6) AS CNPJ_CLIENTE, * FROM ' +
        'TSD_NF'
      'WHERE NR_SD = :NR_SD'
      '  AND CD_TP_NF = :TIPO')
    UpdateObject = upd_dde_nota_fiscal
    Left = 156
    Top = 535
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end>
    object qry_dde_nota_fiscalNR_SD: TStringField
      FieldName = 'NR_SD'
      Origin = 'DBBROKER.TSD_NF.NR_SD'
      FixedChar = True
      Size = 18
    end
    object qry_dde_nota_fiscalNR_SEQ_NF: TAutoIncField
      FieldName = 'NR_SEQ_NF'
      Origin = 'DBBROKER.TSD_NF.NR_SEQ_NF'
    end
    object qry_dde_nota_fiscalNR_NF_INICIAL: TStringField
      FieldName = 'NR_NF_INICIAL'
      Origin = 'DBBROKER.TSD_NF.NR_NF_INICIAL'
      FixedChar = True
    end
    object qry_dde_nota_fiscalNR_NF_FINAL: TStringField
      FieldName = 'NR_NF_FINAL'
      Origin = 'DBBROKER.TSD_NF.NR_NF_FINAL'
      FixedChar = True
    end
    object qry_dde_nota_fiscalNR_SERIE_NF: TStringField
      FieldName = 'NR_SERIE_NF'
      Origin = 'DBBROKER.TSD_NF.NR_SERIE_NF'
      FixedChar = True
      Size = 5
    end
    object qry_dde_nota_fiscalDT_DATA: TDateTimeField
      FieldName = 'DT_DATA'
      Origin = 'DBBROKER.TSD_NF.DT_DATA'
    end
    object qry_dde_nota_fiscalCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TSD_NF.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_dde_nota_fiscalNR_ESTABELECIMENTO: TStringField
      FieldName = 'NR_ESTABELECIMENTO'
      Origin = 'DBBROKER.TSD_NF.NR_ESTABELECIMENTO'
      FixedChar = True
      Size = 2
    end
    object qry_dde_nota_fiscalNR_CHAVE_ACESSO: TStringField
      FieldName = 'NR_CHAVE_ACESSO'
      Origin = 'DBBROKER.TSD_NF.NR_CHAVE_ACESSO'
      FixedChar = True
      Size = 44
    end
    object qry_dde_nota_fiscalCGC_EMPRESA_NF: TStringField
      FieldName = 'CGC_EMPRESA_NF'
      Origin = 'DBBROKER.TSD_NF.CGC_EMPRESA_NF'
      FixedChar = True
      Size = 14
    end
    object qry_dde_nota_fiscalANO_EMISSAO_NF: TIntegerField
      FieldName = 'ANO_EMISSAO_NF'
      Origin = 'DBBROKER.TSD_NF.ANO_EMISSAO_NF'
    end
    object qry_dde_nota_fiscalNR_NF: TIntegerField
      FieldName = 'NR_NF'
      Origin = 'DBBROKER.TSD_NF.NR_NF'
    end
    object qry_dde_nota_fiscalCD_TP_NF: TIntegerField
      FieldName = 'CD_TP_NF'
      Origin = 'DBBROKER.TSD_NF.CD_TP_NF'
    end
    object qry_dde_nota_fiscalNM_TP_NF: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_TP_NF'
      LookupDataSet = qry_tipo_nota
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'TEXTO'
      KeyFields = 'CD_TP_NF'
      Size = 5000
      Lookup = True
    end
    object qry_dde_nota_fiscalCNPJ_CLIENTE: TStringField
      FieldName = 'CNPJ_CLIENTE'
      FixedChar = True
      Size = 6
    end
  end
  object upd_dde_nota_fiscal: TUpdateSQL
    ModifySQL.Strings = (
      'update TSD_NF'
      'set'
      '  NR_SD = :NR_SD,'
      '  NR_NF_INICIAL = :NR_NF_INICIAL,'
      '  NR_NF_FINAL = :NR_NF_FINAL,'
      '  NR_SERIE_NF = :NR_SERIE_NF,'
      '  DT_DATA = :DT_DATA,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  NR_ESTABELECIMENTO = :NR_ESTABELECIMENTO,'
      '  NR_CHAVE_ACESSO = :NR_CHAVE_ACESSO,'
      '  CGC_EMPRESA_NF = :CGC_EMPRESA_NF,'
      '  ANO_EMISSAO_NF = :ANO_EMISSAO_NF,'
      '  NR_NF = :NR_NF,'
      '  CD_TP_NF = :CD_TP_NF'
      'where'
      '  NR_SD = :OLD_NR_SD and'
      '  NR_SEQ_NF = :OLD_NR_SEQ_NF')
    InsertSQL.Strings = (
      'insert into TSD_NF'
      '  (NR_SD, NR_NF_INICIAL, NR_NF_FINAL, NR_SERIE_NF, DT_DATA, '
      'CD_USUARIO, '
      '   NR_ESTABELECIMENTO, NR_CHAVE_ACESSO, CGC_EMPRESA_NF, '
      'ANO_EMISSAO_NF, '
      '   NR_NF, CD_TP_NF)'
      'values'
      
        '  (:NR_SD, :NR_NF_INICIAL, :NR_NF_FINAL, :NR_SERIE_NF, :DT_DATA,' +
        ' '
      ':CD_USUARIO, '
      '   :NR_ESTABELECIMENTO, :NR_CHAVE_ACESSO, :CGC_EMPRESA_NF, '
      ':ANO_EMISSAO_NF, '
      '   :NR_NF, :CD_TP_NF)')
    DeleteSQL.Strings = (
      'delete from TSD_NF'
      'where'
      '  NR_SD = :OLD_NR_SD and'
      '  NR_SEQ_NF = :OLD_NR_SEQ_NF')
    Left = 268
    Top = 535
  end
  object ds_tipo_nota: TDataSource
    DataSet = qry_tipo_nota
    Left = 387
    Top = 133
  end
  object qry_tipo_nota: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TP_NF CODIGO, NM_TP_NF TEXTO FROM TTP_NF')
    Left = 507
    Top = 133
    object qry_tipo_notaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TTP_NF.CD_TP_NF'
    end
    object qry_tipo_notaTEXTO: TStringField
      FieldName = 'TEXTO'
      Origin = 'DBBROKER.TTP_NF.NM_TP_NF'
      FixedChar = True
      Size = 50
    end
  end
  object qry_combo_tipo_documento: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_TIPO_DOCTO CODIGO,  CONVERT(VARCHAR, CD_TIPO_DOCTO)  +' +
        ' '#39' - '#39' + UPPER(NM_TIPO_DOCTO) TEXTO '
      'FROM TTP_DOCTO_INSTRUTIVO'
      '')
    Left = 773
    Top = 197
    object qry_combo_tipo_documentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qry_combo_tipo_documentoTEXTO: TStringField
      FieldName = 'TEXTO'
      FixedChar = True
      Size = 153
    end
  end
  object ds_combo_tipo_documento: TDataSource
    DataSet = qry_combo_tipo_documento
    Left = 629
    Top = 197
  end
  object ds_doctos_digitalizados: TDataSource
    DataSet = qry_doctos_digitalizados
    Left = 372
    Top = 614
  end
  object qry_doctos_digitalizados: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT PD.NM_DESCRICAO, PD.DT_CRIACAO, U.NM_USUARIO,'
      
        'BROKER.DBO.FN_PATH_DIGITALIZACAO(PD.NR_PROCESSO, 1) + '#39'TPROCESSO' +
        '\'#39' + PD.NR_PROCESSO + '#39'\'#39' + PD.NM_ARQUIVO AS NM_CAMINHO'
      'FROM TPROCESSO_DOCTOS PD'
      '  INNER JOIN TUSUARIO U ON U.CD_USUARIO = PD.CD_USUARIO_CRIACAO'
      'WHERE PD.CD_TIPO_DOCTO = :CD_TIPO_DOCTO'
      '  AND PD.NR_PROCESSO = :NR_SD'
      '  AND PD.IN_ATIVO = '#39'1'#39)
    Left = 525
    Top = 616
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_TIPO_DOCTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end>
    object qry_doctos_digitalizadosNM_DESCRICAO: TStringField
      FieldName = 'NM_DESCRICAO'
      Origin = 'DBBROKER.TPROCESSO_DOCTOS.NM_DESCRICAO'
      FixedChar = True
      Size = 200
    end
    object qry_doctos_digitalizadosDT_CRIACAO: TDateTimeField
      FieldName = 'DT_CRIACAO'
      Origin = 'DBBROKER.TPROCESSO_DOCTOS.DT_CRIACAO'
    end
    object qry_doctos_digitalizadosNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'DBBROKER.TUSUARIO.NM_USUARIO'
      FixedChar = True
      Size = 50
    end
    object qry_doctos_digitalizadosNM_CAMINHO: TStringField
      FieldName = 'NM_CAMINHO'
      FixedChar = True
      Size = 255
    end
  end
  object qry_tipo_docto: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_TIPO_DOCTO CODIGO,  CONVERT(VARCHAR, CD_TIPO_DOCTO)  +' +
        ' '#39' - '#39' + UPPER(NM_TIPO_DOCTO) TEXTO '
      'FROM TTP_DOCTO_INSTRUTIVO')
    Left = 773
    Top = 261
    object qry_tipo_doctoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qry_tipo_doctoTEXTO: TStringField
      FieldName = 'TEXTO'
      FixedChar = True
      Size = 153
    end
  end
  object ds_tipo_docto: TDataSource
    DataSet = qry_tipo_docto
    Left = 629
    Top = 261
  end
  object ds_xml_processo: TDataSource
    DataSet = qry_xml_processos_
    Left = 915
    Top = 321
  end
  object qry_xml_processos_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TIPO_PROCESSO '#39'tipo-processo'#39',  '
      '               NR_PROCESSO '#39'numero'#39', '
      '               NM_PROCESSO '#39'descricao'#39' '
      'FROM TSD_PROCESSOS P'
      
        '  INNER JOIN TTP_PROCESSO_VINCULADO TP ON TP.CODIGO = P.CD_TIPO_' +
        'PROCESSO'
      ' WHERE P.NR_SD = :NR_SD')
    Left = 1027
    Top = 321
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end>
    object qry_xml_processos_tipoprocesso: TIntegerField
      FieldName = 'tipo-processo'
    end
    object qry_xml_processos_numero: TStringField
      FieldName = 'numero'
      FixedChar = True
      Size = 50
    end
    object qry_xml_processos_descricao: TStringField
      FieldName = 'descricao'
      FixedChar = True
      Size = 50
    end
  end
  object ds_xml_re_carga_perigosa: TDataSource
    DataSet = qry_xml_re_carga_perigosa_
    Left = 913
    Top = 385
  end
  object qry_xml_re_carga_perigosa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT REPLACE(REPLACE(NR_RE_SISCOMEX,'#39'-'#39', '#39#39'), '#39'/'#39','#39#39') '#39'numero-' +
        're'#39', '
      '       NR_ANEXO '#39'adicao'#39', '
      '       CD_CLASSE '#39'classe'#39', '
      '       CD_INDICADOR '#39'codigo-indicador'#39', '
      '       CD_TIPO_CARGA '#39'tipo-carga'#39','
      '       CD_MERC_PERIGOSA '#39'codigo-carga'#39
      'FROM TSD_RE_MERCADORIA_PERIGOSA'
      'WHERE NR_SD = :NR_SD'
      
        '  AND REPLACE(REPLACE(NR_RE_SISCOMEX,'#39'-'#39', '#39#39'), '#39'/'#39','#39#39') = :NR_RE_' +
        'SISCOMEX'
      '  AND NR_ANEXO = :NR_ANEXO')
    Left = 1051
    Top = 385
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_RE_SISCOMEX'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ANEXO'
        ParamType = ptInput
      end>
    object qry_xml_re_carga_perigosa_numerore: TStringField
      FieldName = 'numero-re'
      FixedChar = True
      Size = 255
    end
    object qry_xml_re_carga_perigosa_adicao: TStringField
      FieldName = 'adicao'
      FixedChar = True
      Size = 3
    end
    object qry_xml_re_carga_perigosa_classe: TIntegerField
      FieldName = 'classe'
    end
    object qry_xml_re_carga_perigosa_codigoindicador: TIntegerField
      FieldName = 'codigo-indicador'
    end
    object qry_xml_re_carga_perigosa_tipocarga: TIntegerField
      FieldName = 'tipo-carga'
    end
    object qry_xml_re_carga_perigosa_codigocarga: TIntegerField
      FieldName = 'codigo-carga'
    end
  end
  object ds_merc_perigosa: TDataSource
    DataSet = qry_merc_perigosa
    Left = 632
    Top = 335
  end
  object qry_merc_perigosa: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ' SELECT CD_MERC_PERIGOSA, NR_RE_SISCOMEX, NR_ANEXO, '
      
        'CONVERT(VARCHAR, CM.CD_CLASSE) + '#39' - '#39' + CM.NM_CLASSE NM_CLASSE,' +
        ' '
      
        'CONVERT(VARCHAR, TM.CD_ID_MERCADORIA) + '#39' - '#39' + TM.NM_ID_MERCADO' +
        'RIA  NM_ID_MERCADORIA'
      ' FROM TSD_RE_MERCADORIA_PERIGOSA SD'
      
        '   INNER JOIN TCLASSE_MERCADORIA_PERIGOSA CM ON CM.CD_CLASSE = S' +
        'D.CD_CLASSE'
      
        '   INNER JOIN TTP_MERCADORIA_PERIGOSA TM ON TM.CD_ID_MERCADORIA ' +
        '= SD.CD_INDICADOR'
      
        '                                        AND TM.CD_CLASSE = CM.CD' +
        '_CLASSE'
      ' WHERE NR_SD = :NR_SD'
      '   AND CD_TIPO_CARGA = :TIPO'
      'ORDER BY CD_MERC_PERIGOSA')
    Left = 759
    Top = 337
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
      end>
    object qry_merc_perigosaCD_MERC_PERIGOSA: TIntegerField
      FieldName = 'CD_MERC_PERIGOSA'
    end
    object qry_merc_perigosaNR_RE_SISCOMEX: TStringField
      FieldName = 'NR_RE_SISCOMEX'
      FixedChar = True
      Size = 30
    end
    object qry_merc_perigosaNR_ANEXO: TStringField
      FieldName = 'NR_ANEXO'
      FixedChar = True
      Size = 3
    end
    object qry_merc_perigosaNM_CLASSE: TStringField
      FieldName = 'NM_CLASSE'
      FixedChar = True
      Size = 255
    end
    object qry_merc_perigosaNM_ID_MERCADORIA: TStringField
      FieldName = 'NM_ID_MERCADORIA'
      FixedChar = True
      Size = 255
    end
  end
  object ds_dde_historico: TDataSource
    DataSet = qry_dde_historico
    OnStateChange = ds_dde_listaStateChange
    Left = 84
    Top = 599
  end
  object qry_dde_historico: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_ESTAGIO_SISCOMEX, DT_CONCLUSAO, '
      'CASE '
      '  WHEN RTRIM(NM_ESTAGIO_SISCOMEX) LIKE '#39'%comprovante%'#39' THEN '
      
        '    (SELECT TOP 1 BROKER.DBO.FN_PATH_DIGITALIZACAO(D.NR_PROCESSO' +
        ', '#39'1'#39') + '#39'TPROCESSO\'#39' + RTRIM(D.NR_PROCESSO) + '#39'\'#39' + D.NM_ARQUIV' +
        'O '
      '     FROM TPROCESSO_DOCTOS D '
      '     WHERE D.NR_PROCESSO = E.NR_PROCESSO '
      '       AND D.CD_TIPO_DOCTO = '#39'101'#39' '
      '       AND D.IN_ATIVO = '#39'1'#39' '
      '     ORDER BY D.DT_CRIACAO DESC) '
      
        '  WHEN RTRIM(NM_ESTAGIO_SISCOMEX) LIKE '#39'%Liberado s/conf.aduanei' +
        'ra%'#39' THEN '
      
        '    (SELECT TOP 1 BROKER.DBO.FN_PATH_DIGITALIZACAO(D.NR_PROCESSO' +
        ', '#39'1'#39') + '#39'TPROCESSO\'#39' + RTRIM(D.NR_PROCESSO) + '#39'\'#39' + D.NM_ARQUIV' +
        'O '
      '     FROM TPROCESSO_DOCTOS D '
      '     WHERE D.NR_PROCESSO = E.NR_PROCESSO '
      '       AND D.CD_TIPO_DOCTO = '#39'65'#39' '
      '       AND D.IN_ATIVO = '#39'1'#39
      '       AND D.NM_DESCRICAO LIKE '#39'%LIBERADO%'#39' '
      '     ORDER BY D.DT_CRIACAO DESC) '
      
        '  ELSE (SELECT TOP 1 BROKER.DBO.FN_PATH_DIGITALIZACAO(D.NR_PROCE' +
        'SSO, '#39'1'#39') + '#39'TPROCESSO\'#39' + RTRIM(D.NR_PROCESSO) + '#39'\'#39' + D.NM_ARQ' +
        'UIVO '
      '     FROM TPROCESSO_DOCTOS D '
      '     WHERE D.NR_PROCESSO = E.NR_PROCESSO '
      '       AND D.CD_TIPO_DOCTO = '#39'65'#39' '
      '       AND D.IN_ATIVO = '#39'1'#39
      
        '       AND D.NM_DESCRICAO LIKE '#39'%'#39' + UPPER(RTRIM(E.NM_ESTAGIO_SI' +
        'SCOMEX)) + '#39'%'#39' '
      '     ORDER BY D.DT_CRIACAO DESC)                  '
      '  END TX_ARQUIVO'
      'FROM TSD_ESTAGIOS E'
      'WHERE E.NR_PROCESSO = :NR_SD ')
    Left = 157
    Top = 599
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SD'
        ParamType = ptInput
      end>
    object qry_dde_historicoNM_ESTAGIO_SISCOMEX: TStringField
      FieldName = 'NM_ESTAGIO_SISCOMEX'
      Origin = 'DBBROKER.TSD_ESTAGIOS.NM_ESTAGIO_SISCOMEX'
      FixedChar = True
      Size = 50
    end
    object qry_dde_historicoDT_CONCLUSAO: TDateTimeField
      FieldName = 'DT_CONCLUSAO'
      Origin = 'DBBROKER.TSD_ESTAGIOS.DT_CONCLUSAO'
    end
    object qry_dde_historicoTX_ARQUIVO: TStringField
      FieldName = 'TX_ARQUIVO'
      FixedChar = True
      Size = 255
    end
  end
  object qry_despachantes: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select distinct   '
      ' d.NM_DESPACHANTE NM_USUARIO  '
      ',d.AP_DESPACHANTE AP_USUARIO  '
      ',d.CPF_DESPACHANTE CPF_USUARIO  '
      'from tdespachante d  '
      
        'join  TDESPACHANTE_CLIENTE dc on dc.CD_DESPACHANTE=d.CD_DESPACHA' +
        'NTE  and d.IN_ATIVO in (1,4)  '
      'WHERE TIPO='#39'DDE'#39' AND CD_EMPRESA = :cd_empresa')
    Left = 915
    Top = 481
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_empresa'
        ParamType = ptUnknown
        Size = 5
      end>
    object qry_despachantesNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Size = 50
    end
    object qry_despachantesAP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Size = 10
    end
    object qry_despachantesCPF_USUARIO: TStringField
      FieldName = 'CPF_USUARIO'
      Size = 11
    end
  end
end

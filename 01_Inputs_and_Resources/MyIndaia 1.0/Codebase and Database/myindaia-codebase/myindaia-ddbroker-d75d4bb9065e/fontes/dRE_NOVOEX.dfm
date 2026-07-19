object datmRE_NOVOEX: TdatmRE_NOVOEX
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 335
  Top = 136
  Height = 625
  Width = 878
  object qry_RE_Capa: TQuery
    CachedUpdates = True
    AfterOpen = qry_RE_CapaAfterOpen
    AfterClose = qry_RE_CapaAfterClose
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT RC.*,'
      '       SUBSTRING(RC.NR_PROCESSO,5,14) AS PROCESSO_REDUZIDO,'
      
        '       (RTRIM(SUBSTRING(RC.NR_PROCESSO,5,14)) + '#39' / '#39' + RC.NR_PR' +
        'OCESSO_COMPLEMENTO) AS PROCESSO_REDUZIDO_COMPLEMENTO'
      'FROM TRE_CAPA RC (NOLOCK)'
      'WHERE RC.NR_PROCESSO = :NR_PROCESSO'
      '  AND RC.NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO'
      
        'ORDER BY SUBSTRING(RC.NR_PROCESSO, 13, 2) DESC, RC.NR_PROCESSO D' +
        'ESC')
    UpdateObject = upd_RE_Capa
    Left = 175
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = '0102JA-1721-10'
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO_COMPLEMENTO'
        ParamType = ptInput
        Value = '001'
      end>
    object qry_RE_CapaNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 18
    end
    object qry_RE_CapaNR_PROCESSO_COMPLEMENTO: TStringField
      FieldName = 'NR_PROCESSO_COMPLEMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object qry_RE_CapaNR_OUTRA_REF: TStringField
      FieldName = 'NR_OUTRA_REF'
      FixedChar = True
      Size = 30
    end
    object qry_RE_CapaNR_RE_SISCOMEX: TStringField
      FieldName = 'NR_RE_SISCOMEX'
      EditMask = '##/#######-###;1;_'
      FixedChar = True
      Size = 30
    end
    object qry_RE_CapaNR_REG_VENDA: TStringField
      FieldName = 'NR_REG_VENDA'
      FixedChar = True
      Size = 9
    end
    object qry_RE_CapaNR_REG_CREDITO: TStringField
      FieldName = 'NR_REG_CREDITO'
      FixedChar = True
      Size = 12
    end
    object qry_RE_CapaNR_RE_VINCULADA: TStringField
      FieldName = 'NR_RE_VINCULADA'
      FixedChar = True
      Size = 13
    end
    object qry_RE_CapaNR_DI_VINCULADA: TStringField
      FieldName = 'NR_DI_VINCULADA'
      FixedChar = True
      Size = 15
    end
    object qry_RE_CapaCD_ENQUAD1: TStringField
      FieldName = 'CD_ENQUAD1'
      OnChange = qry_RE_CapaCD_ENQUAD1Change
      FixedChar = True
      Size = 5
    end
    object qry_RE_CapaCD_ENQUAD2: TStringField
      FieldName = 'CD_ENQUAD2'
      OnChange = qry_RE_CapaCD_ENQUAD1Change
      FixedChar = True
      Size = 5
    end
    object qry_RE_CapaCD_ENQUAD3: TStringField
      FieldName = 'CD_ENQUAD3'
      OnChange = qry_RE_CapaCD_ENQUAD1Change
      FixedChar = True
      Size = 5
    end
    object qry_RE_CapaCD_ENQUAD4: TStringField
      FieldName = 'CD_ENQUAD4'
      OnChange = qry_RE_CapaCD_ENQUAD1Change
      FixedChar = True
      Size = 5
    end
    object qry_RE_CapaCD_ENQUAD5: TStringField
      FieldName = 'CD_ENQUAD5'
      OnChange = qry_RE_CapaCD_ENQUAD1Change
      FixedChar = True
      Size = 5
    end
    object qry_RE_CapaCD_ENQUAD6: TStringField
      FieldName = 'CD_ENQUAD6'
      OnChange = qry_RE_CapaCD_ENQUAD1Change
      FixedChar = True
      Size = 5
    end
    object qry_RE_CapaCD_INST_NEGO: TStringField
      FieldName = 'CD_INST_NEGO'
      FixedChar = True
      Size = 5
    end
    object qry_RE_CapaCD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      FixedChar = True
      Size = 10
    end
    object qry_RE_CapaCD_URF_EMBARQUE: TStringField
      FieldName = 'CD_URF_EMBARQUE'
      FixedChar = True
      Size = 7
    end
    object qry_RE_CapaCD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      FixedChar = True
      Size = 7
    end
    object qry_RE_CapaDT_DATA_RE: TDateTimeField
      FieldName = 'DT_DATA_RE'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_RE_CapaDT_LIMITE_OPERACAO: TDateTimeField
      FieldName = 'DT_LIMITE_OPERACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_RE_CapaVL_MARGEM_NAO_SACADA: TFloatField
      FieldName = 'VL_MARGEM_NAO_SACADA'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaVL_VALOR_CONSIGNACAO: TFloatField
      FieldName = 'VL_VALOR_CONSIGNACAO'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaVL_VALOR_COBER_CAMBIAL: TFloatField
      FieldName = 'VL_VALOR_COBER_CAMBIAL'
      OnChange = qry_RE_CapaVL_VALOR_COBER_CAMBIALChange
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaVL_VALOR_FINANCEIRO_RC: TFloatField
      FieldName = 'VL_VALOR_FINANCEIRO_RC'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaVL_TOTAL_COND_VENDA_ACUM: TFloatField
      FieldName = 'VL_TOTAL_COND_VENDA_ACUM'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaVL_TOTAL_LOCAL_VENDA_ACUM: TFloatField
      FieldName = 'VL_TOTAL_LOCAL_VENDA_ACUM'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaCD_ULTIMO_ANEXO_TRANSMITIDO: TIntegerField
      FieldName = 'CD_ULTIMO_ANEXO_TRANSMITIDO'
    end
    object qry_RE_CapaDT_DATA_TRANSMISSAO: TDateTimeField
      FieldName = 'DT_DATA_TRANSMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_RE_CapaCD_NUMERO_TRANSMISSAO: TIntegerField
      FieldName = 'CD_NUMERO_TRANSMISSAO'
    end
    object qry_RE_CapaVL_ESQUE_PG_TOTAL: TFloatField
      FieldName = 'VL_ESQUE_PG_TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaVL_VALOR_NBM_INCLUIDAS: TFloatField
      FieldName = 'VL_VALOR_NBM_INCLUIDAS'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaCD_STATUS_RE: TStringField
      FieldName = 'CD_STATUS_RE'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaTX_SITUACAO_RE: TStringField
      DisplayWidth = 150
      FieldName = 'TX_SITUACAO_RE'
      FixedChar = True
      Size = 150
    end
    object qry_RE_CapaCD_SUARIO: TStringField
      FieldName = 'CD_SUARIO'
      FixedChar = True
      Size = 6
    end
    object qry_RE_CapaDT_DATA: TDateTimeField
      FieldName = 'DT_DATA'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_RE_CapaTM_HORA: TDateTimeField
      FieldName = 'TM_HORA'
    end
    object qry_RE_CapaCD_PROPRIETARIO: TStringField
      FieldName = 'CD_PROPRIETARIO'
      FixedChar = True
      Size = 6
    end
    object qry_RE_CapaNR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
    end
    object qry_RE_CapaNR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      FixedChar = True
    end
    object qry_RE_CapaDT_DATA_AVERBACAO: TDateTimeField
      FieldName = 'DT_DATA_AVERBACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_RE_CapaDT_DATA_MASTER: TDateTimeField
      FieldName = 'DT_DATA_MASTER'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_RE_CapaCD_PAIS_FINAL: TStringField
      FieldName = 'CD_PAIS_FINAL'
      FixedChar = True
      Size = 3
    end
    object qry_RE_CapaCD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      FixedChar = True
      Size = 3
    end
    object qry_RE_CapaCD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      FixedChar = True
      Size = 6
    end
    object qry_RE_CapaDT_DATA_TRANSP_IBERNAT: TDateTimeField
      FieldName = 'DT_DATA_TRANSP_IBERNAT'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_RE_CapaTM_HORA_TRANSP_IBERNAT: TDateTimeField
      FieldName = 'TM_HORA_TRANSP_IBERNAT'
    end
    object qry_RE_CapaCD_SITUACAO_RE: TStringField
      FieldName = 'CD_SITUACAO_RE'
      FixedChar = True
      Size = 2
    end
    object qry_RE_CapaTX_SITUACAO_SISBACEN: TStringField
      FieldName = 'TX_SITUACAO_SISBACEN'
      FixedChar = True
    end
    object qry_RE_CapaCD_USUARIO_EXTERNO: TStringField
      FieldName = 'CD_USUARIO_EXTERNO'
      FixedChar = True
      Size = 6
    end
    object qry_RE_CapaTX_CPF_SISCOMEX: TStringField
      FieldName = 'TX_CPF_SISCOMEX'
      FixedChar = True
      Size = 11
    end
    object qry_RE_CapaTX_SENHA_SISCOMEX: TStringField
      FieldName = 'TX_SENHA_SISCOMEX'
      FixedChar = True
      Size = 10
    end
    object qry_RE_CapaNM_ARQUIVO_TRANSMISSAO: TStringField
      FieldName = 'NM_ARQUIVO_TRANSMISSAO'
      FixedChar = True
      Size = 100
    end
    object qry_RE_CapaCD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_RE_CapaQT_ANEXOS: TIntegerField
      FieldName = 'QT_ANEXOS'
    end
    object qry_RE_CapaCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_RE_CapaTP_NAO_QUEBRAR_LINHAS_SEPARADO: TStringField
      FieldName = 'TP_NAO_QUEBRAR_LINHAS_SEPARADO'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaNR_PARCELAS: TStringField
      FieldName = 'NR_PARCELAS'
      FixedChar = True
      Size = 3
    end
    object qry_RE_CapaNR_PERIODICIDADE: TStringField
      FieldName = 'NR_PERIODICIDADE'
      FixedChar = True
      Size = 3
    end
    object qry_RE_CapaCD_MODALIDADE_TRANS: TStringField
      FieldName = 'CD_MODALIDADE_TRANS'
      FixedChar = True
      Size = 3
    end
    object qry_RE_CapaVL_CONSIGN: TFloatField
      FieldName = 'VL_CONSIGN'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaVL_SEM_COB_CAMBIAL: TFloatField
      FieldName = 'VL_SEM_COB_CAMBIAL'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaVL_FINANC_RC: TFloatField
      FieldName = 'VL_FINANC_RC'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaVL_PAGT_VISTA: TFloatField
      FieldName = 'VL_PAGT_VISTA'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaVL_PARCELA: TFloatField
      FieldName = 'VL_PARCELA'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaPC_MARGEM_NAO_SACADA: TFloatField
      FieldName = 'PC_MARGEM_NAO_SACADA'
    end
    object qry_RE_CapaVL_ESQ_PAG_TOT: TFloatField
      FieldName = 'VL_ESQ_PAG_TOT'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaVL_PAGTO_ANTEC: TFloatField
      FieldName = 'VL_PAGTO_ANTEC'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_RE_CapaTP_INDICADOR: TStringField
      FieldName = 'TP_INDICADOR'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaIN_ORIGEM_RE: TStringField
      FieldName = 'IN_ORIGEM_RE'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaIN_MARCA_ATUAL_FABRICANTE: TStringField
      FieldName = 'IN_MARCA_ATUAL_FABRICANTE'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaIN_CONTROLE_RATEIO: TStringField
      FieldName = 'IN_CONTROLE_RATEIO'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaIN_CONTROLE_TRANSMISSAO: TStringField
      FieldName = 'IN_CONTROLE_TRANSMISSAO'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaIN_MARCA_TRANSMISSAO: TStringField
      FieldName = 'IN_MARCA_TRANSMISSAO'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaIN_ORIGEM_REG: TStringField
      FieldName = 'IN_ORIGEM_REG'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaIN_TRANSMISSAO_CONCLUIDA: TStringField
      FieldName = 'IN_TRANSMISSAO_CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaIN_AGRUPAR: TStringField
      FieldName = 'IN_AGRUPAR'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaIN_QUEBRA_POR_VALOR: TStringField
      FieldName = 'IN_QUEBRA_POR_VALOR'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaIN_QUEBRA_POR_FABRICANTE: TStringField
      FieldName = 'IN_QUEBRA_POR_FABRICANTE'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaIN_DESC_TIPO_RECOF: TStringField
      FieldName = 'IN_DESC_TIPO_RECOF'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaIN_NAO_QUEBRAR_LINHAS: TStringField
      FieldName = 'IN_NAO_QUEBRAR_LINHAS'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaPESO_LIQUIDO_TOTAL: TFloatField
      FieldName = 'PESO_LIQUIDO_TOTAL'
      DisplayFormat = '0.00000'
    end
    object qry_RE_CapaVL_FRETE_TOTAL: TFloatField
      FieldName = 'VL_FRETE_TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaVL_SEGURO_TOTAL: TFloatField
      FieldName = 'VL_SEGURO_TOTAL'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_CapaPROCESSO_REDUZIDO: TStringField
      FieldName = 'PROCESSO_REDUZIDO'
      FixedChar = True
      Size = 14
    end
    object qry_RE_CapaDT_ULT_CONSULTA: TDateTimeField
      FieldName = 'DT_ULT_CONSULTA'
    end
    object qry_RE_CapaTX_DOCUMENTO_SISCOMEX: TMemoField
      FieldName = 'TX_DOCUMENTO_SISCOMEX'
      BlobType = ftMemo
    end
    object qry_RE_CapaCD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      FixedChar = True
      Size = 3
    end
    object qry_RE_CapaTX_END_IMPORTADOR: TMemoField
      FieldName = 'TX_END_IMPORTADOR'
      BlobType = ftMemo
    end
    object qry_RE_CapaPROCESSO_REDUZIDO_COMPLEMENTO: TStringField
      FieldName = 'PROCESSO_REDUZIDO_COMPLEMENTO'
      FixedChar = True
    end
    object qry_RE_CapaVL_PESO_NBM_INCLUIDAS: TFloatField
      FieldName = 'VL_PESO_NBM_INCLUIDAS'
      DisplayFormat = '0.00000'
    end
    object qry_RE_CapaIN_NOVOEX: TBooleanField
      FieldName = 'IN_NOVOEX'
    end
    object qry_RE_CapaID_ARQUIVO_NOVOEX: TStringField
      FieldName = 'ID_ARQUIVO_NOVOEX'
      FixedChar = True
      Size = 9
    end
    object qry_RE_CapaNR_LOTE: TStringField
      FieldName = 'NR_LOTE'
      FixedChar = True
    end
    object qry_RE_CapaTX_TRANSMISSAO_NOVOEX: TStringField
      FieldName = 'TX_TRANSMISSAO_NOVOEX'
      FixedChar = True
      Size = 255
    end
    object qry_RE_CapaCD_USUARIO_TRANSMISSAO: TStringField
      FieldName = 'CD_USUARIO_TRANSMISSAO'
      FixedChar = True
      Size = 4
    end
    object qry_RE_CapalookupCNPJ_EXPORTADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupCNPJ_EXPORTADOR'
      LookupDataSet = qry_EmpresaNac
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'CGC_EMPRESA'
      KeyFields = 'CD_EXPORTADOR'
      Size = 15
      Lookup = True
    end
    object qry_RE_CapalookupNM_EXPORTADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupNM_EXPORTADOR'
      LookupDataSet = qry_EmpresaNac
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EXPORTADOR'
      Size = 100
      Lookup = True
    end
    object qry_RE_CapalookupNM_HOMEPAGE: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupNM_HOMEPAGE'
      LookupDataSet = qry_EmpresaNac
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_HOMEPAGE'
      KeyFields = 'CD_EXPORTADOR'
      Size = 200
      Lookup = True
    end
    object qry_RE_CapalookupNM_IMPORTADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupNM_IMPORTADOR'
      LookupDataSet = qry_EmpresaEst
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_IMPORTADOR'
      Size = 100
      Lookup = True
    end
    object qry_RE_CapalookupEND_IMPORTADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupEND_IMPORTADOR'
      LookupDataSet = qry_EmpresaEst
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'END_EMPRESA'
      KeyFields = 'CD_IMPORTADOR'
      Size = 300
      Lookup = True
    end
    object qry_RE_CapalookupCD_PAIS_IMPORTADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupCD_PAIS_IMPORTADOR'
      LookupDataSet = qry_EmpresaEst
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'CD_PAIS'
      KeyFields = 'CD_IMPORTADOR'
      Size = 3
      Lookup = True
    end
    object qry_RE_CapalookupNM_PAIS_IMPORTADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupNM_PAIS_IMPORTADOR'
      LookupDataSet = qry_Pais
      LookupKeyFields = 'CD_PAIS'
      LookupResultField = 'NM_PAIS'
      KeyFields = 'lookupCD_PAIS_IMPORTADOR'
      Size = 120
      Lookup = True
    end
    object qry_RE_CapaIN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaIN_DESCRICAO_MERCADORIA: TStringField
      FieldName = 'IN_DESCRICAO_MERCADORIA'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaNR_DSI_VINCULADA: TStringField
      FieldName = 'NR_DSI_VINCULADA'
      FixedChar = True
      Size = 10
    end
    object qry_RE_CapaIN_RE_ENVIADO: TStringField
      FieldName = 'IN_RE_ENVIADO'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaIN_AVERBADO_ENVIADO: TStringField
      FieldName = 'IN_AVERBADO_ENVIADO'
      FixedChar = True
      Size = 1
    end
    object qry_RE_CapaIN_BAIXA_EXTRATO_DEFERIDO: TBooleanField
      FieldName = 'IN_BAIXA_EXTRATO_DEFERIDO'
    end
  end
  object ds_RE_Capa: TDataSource
    DataSet = qry_RE_Capa
    OnStateChange = ds_RE_CapaStateChange
    Left = 40
    Top = 16
  end
  object qry_RE_Anexo: TQuery
    CachedUpdates = True
    AfterOpen = qry_RE_AnexoAfterOpen
    BeforeClose = qry_RE_AnexoBeforeClose
    AfterClose = qry_RE_AnexoAfterClose
    AfterScroll = qry_RE_AnexoAfterScroll
    OnCalcFields = qry_RE_AnexoCalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_RE_Capa
    SQL.Strings = (
      'SELECT *,'
      '       (SELECT COUNT(*)'
      '        FROM TRE_ANEXO RA2 (NOLOCK)'
      '        WHERE RA2.NR_PROCESSO = RA.NR_PROCESSO'
      
        '          AND RA2.NR_PROCESSO_COMPLEMENTO = RA.NR_PROCESSO_COMPL' +
        'EMENTO) AS QTD_ANEXOS'
      'FROM TRE_ANEXO RA (NOLOCK)'
      'WHERE RA.NR_PROCESSO = :NR_PROCESSO'
      '  AND RA.NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO'
      'ORDER BY RA.CD_RE_ANEXO')
    UpdateObject = upd_RE_Anexo
    Left = 175
    Top = 72
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO_COMPLEMENTO'
        ParamType = ptInput
        Size = 4
      end>
    object qry_RE_AnexoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TRE_ANEXO.NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 18
    end
    object qry_RE_AnexoNR_PROCESSO_COMPLEMENTO: TStringField
      FieldName = 'NR_PROCESSO_COMPLEMENTO'
      Origin = 'DBBROKER.TRE_ANEXO.NR_PROCESSO_COMPLEMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object qry_RE_AnexoCD_RE_ANEXO: TIntegerField
      FieldName = 'CD_RE_ANEXO'
      Origin = 'DBBROKER.TRE_ANEXO.CD_RE_ANEXO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qry_RE_AnexoCD_NALADI: TStringField
      FieldName = 'CD_NALADI'
      Origin = 'DBBROKER.TRE_ANEXO.CD_NALADI'
      FixedChar = True
      Size = 8
    end
    object qry_RE_AnexoCD_NCM: TStringField
      FieldName = 'CD_NCM'
      Origin = 'DBBROKER.TRE_ANEXO.CD_NCM'
      FixedChar = True
      Size = 10
    end
    object qry_RE_AnexoCD_NBM: TStringField
      FieldName = 'CD_NBM'
      Origin = 'DBBROKER.TRE_ANEXO.CD_NBM'
      FixedChar = True
      Size = 10
    end
    object qry_RE_AnexoCD_UF_PRODUTOR: TStringField
      FieldName = 'CD_UF_PRODUTOR'
      Origin = 'DBBROKER.TRE_ANEXO.CD_UF_PRODUTOR'
      FixedChar = True
      Size = 2
    end
    object qry_RE_AnexoCD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'DBBROKER.TRE_ANEXO.CD_EMBALAGEM'
      FixedChar = True
      Size = 10
    end
    object qry_RE_AnexoCD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'DBBROKER.TRE_ANEXO.CD_UNID_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qry_RE_AnexoCD_FINALIDADE: TStringField
      FieldName = 'CD_FINALIDADE'
      Origin = 'DBBROKER.TRE_ANEXO.CD_FINALIDADE'
      FixedChar = True
      Size = 3
    end
    object qry_RE_AnexoCD_FORMA_PGTO: TStringField
      FieldName = 'CD_FORMA_PGTO'
      Origin = 'DBBROKER.TRE_ANEXO.CD_FORMA_PGTO'
      FixedChar = True
      Size = 1
    end
    object qry_RE_AnexoTX_CATEGORIA_TEXTIL: TStringField
      FieldName = 'TX_CATEGORIA_TEXTIL'
      Origin = 'DBBROKER.TRE_ANEXO.TX_CATEGORIA_TEXTIL'
      FixedChar = True
      Size = 30
    end
    object qry_RE_AnexoIN_EXPORTADOR_FABRICANTE: TStringField
      FieldName = 'IN_EXPORTADOR_FABRICANTE'
      Origin = 'DBBROKER.TRE_ANEXO.IN_EXPORTADOR_FABRICANTE'
      OnChange = qry_RE_AnexoIN_EXPORTADOR_FABRICANTEChange
      FixedChar = True
      Size = 1
    end
    object qry_RE_AnexoIN_OBS_EXPORTADOR: TStringField
      FieldName = 'IN_OBS_EXPORTADOR'
      Origin = 'DBBROKER.TRE_ANEXO.IN_OBS_EXPORTADOR'
      FixedChar = True
      Size = 1
    end
    object qry_RE_AnexoDT_VALIDADE_EMBARQUE: TDateTimeField
      FieldName = 'DT_VALIDADE_EMBARQUE'
      Origin = 'DBBROKER.TRE_ANEXO.DT_VALIDADE_EMBARQUE'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_RE_AnexoPESO_LIQUIDO: TFloatField
      FieldName = 'PESO_LIQUIDO'
      Origin = 'DBBROKER.TRE_ANEXO.PESO_LIQUIDO'
      OnChange = qry_RE_AnexoVL_COND_VENDAChange
      DisplayFormat = '#,##0.00000'
      EditFormat = '###0.00000'
    end
    object qry_RE_AnexoQT_UNIDADE_COMERCIAL: TFloatField
      FieldName = 'QT_UNIDADE_COMERCIAL'
      Origin = 'DBBROKER.TRE_ANEXO.QT_UNIDADE_COMERCIAL'
      OnChange = qry_RE_AnexoVL_COND_VENDAChange
      DisplayFormat = '#,##0.00000'
    end
    object qry_RE_AnexoQT_MEDIA_NBM: TFloatField
      FieldName = 'QT_MEDIA_NBM'
      Origin = 'DBBROKER.TRE_ANEXO.QT_MEDIA_NBM'
      DisplayFormat = '#,##0.00000'
      EditFormat = '###0.00000'
    end
    object qry_RE_AnexoVL_COND_VENDA: TFloatField
      FieldName = 'VL_COND_VENDA'
      Origin = 'DBBROKER.TRE_ANEXO.VL_COND_VENDA'
      OnChange = qry_RE_AnexoVL_COND_VENDAChange
      DisplayFormat = '#0.00'
    end
    object qry_RE_AnexoVL_LOCAL_VENDA: TFloatField
      FieldName = 'VL_LOCAL_VENDA'
      Origin = 'DBBROKER.TRE_ANEXO.VL_LOCAL_VENDA'
      DisplayFormat = '#0.00'
    end
    object qry_RE_AnexoPC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'DBBROKER.TRE_ANEXO.PC_COMISSAO'
      OnChange = qry_RE_AnexoPC_COMISSAOChange
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_AnexoVL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
      Origin = 'DBBROKER.TRE_ANEXO.VL_COMISSAO'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_AnexoVL_FRETE_RATEADO: TFloatField
      FieldName = 'VL_FRETE_RATEADO'
      Origin = 'DBBROKER.TRE_ANEXO.VL_FRETE_RATEADO'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_AnexoVL_SEGURO_RATEADO: TFloatField
      FieldName = 'VL_SEGURO_RATEADO'
      Origin = 'DBBROKER.TRE_ANEXO.VL_SEGURO_RATEADO'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_AnexoPESO_BRUTO_RATEADO: TFloatField
      FieldName = 'PESO_BRUTO_RATEADO'
      Origin = 'DBBROKER.TRE_ANEXO.PESO_BRUTO_RATEADO'
      DisplayFormat = '#,##0.00000'
    end
    object qry_RE_AnexoCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TRE_ANEXO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_RE_AnexoDT_DATA: TDateTimeField
      FieldName = 'DT_DATA'
      Origin = 'DBBROKER.TRE_ANEXO.DT_DATA'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_RE_AnexoTM_HORA: TDateTimeField
      FieldName = 'TM_HORA'
      Origin = 'DBBROKER.TRE_ANEXO.TM_HORA'
    end
    object qry_RE_AnexoCD_ORIGEM_REGISTRO: TStringField
      FieldName = 'CD_ORIGEM_REGISTRO'
      Origin = 'DBBROKER.TRE_ANEXO.CD_ORIGEM_REGISTRO'
      FixedChar = True
      Size = 1
    end
    object qry_RE_AnexoTX_PENDENCIA: TStringField
      FieldName = 'TX_PENDENCIA'
      Origin = 'DBBROKER.TRE_ANEXO.TX_PENDENCIA'
      FixedChar = True
      Size = 80
    end
    object qry_RE_AnexoTX_OBSERVACOES: TStringField
      FieldName = 'TX_OBSERVACOES'
      FixedChar = True
      Size = 80
    end
    object qry_RE_AnexoTX_MENS_ADVERTENCIA1: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA1'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA1'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_MENS_ADVERTENCIA2: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA2'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA2'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_MENS_ADVERTENCIA3: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA3'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA3'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_MENS_ADVERTENCIA4: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA4'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA4'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_MENS_ADVERTENCIA5: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA5'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA5'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_MENS_ADVERTENCIA6: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA6'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA6'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_MENS_ADVERTENCIA7: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA7'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA7'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_MENS_ADVERTENCIA8: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA8'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA8'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_MENS_ADVERTENCIA9: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA9'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA9'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_MENS_ADVERTENCIA10: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA10'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA10'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_MENS_ADVERTENCIA11: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA11'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA11'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_MENS_ADVERTENCIA12: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA12'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA12'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_MENS_ADVERTENCIA13: TStringField
      FieldName = 'TX_MENS_ADVERTENCIA13'
      Origin = 'DBBROKER.TRE_ANEXO.TX_MENS_ADVERTENCIA13'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_OBSERV_ORG_ANUENT1: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT1'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT1'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_OBSERV_ORG_ANUENT2: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT2'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT2'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_OBSERV_ORG_ANUENT3: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT3'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT3'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_OBSERV_ORG_ANUENT4: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT4'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT4'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_OBSERV_ORG_ANUENT5: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT5'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT5'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_OBSERV_ORG_ANUENT6: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT6'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT6'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_OBSERV_ORG_ANUENT7: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT7'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT7'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_OBSERV_ORG_ANUENT8: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT8'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT8'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_OBSERV_ORG_ANUENT9: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT9'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT9'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_OBSERV_ORG_ANUENT10: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT10'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT10'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_OBSERV_ORG_ANUENT11: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT11'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT11'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_OBSERV_ORG_ANUENT12: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT12'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT12'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_OBSERV_ORG_ANUENT13: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT13'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT13'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoTX_OBSERV_ORG_ANUENT14: TStringField
      FieldName = 'TX_OBSERV_ORG_ANUENT14'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERV_ORG_ANUENT14'
      FixedChar = True
      Size = 75
    end
    object qry_RE_AnexoQT_EMBARCADA: TFloatField
      FieldName = 'QT_EMBARCADA'
      Origin = 'DBBROKER.TRE_ANEXO.QT_EMBARCADA'
      DisplayFormat = '#,##0.00000'
    end
    object qry_RE_AnexoVL_EMBARCADO: TFloatField
      FieldName = 'VL_EMBARCADO'
      Origin = 'DBBROKER.TRE_ANEXO.VL_EMBARCADO'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_AnexoDT_EMBARQUE: TDateTimeField
      FieldName = 'DT_EMBARQUE'
      Origin = 'DBBROKER.TRE_ANEXO.DT_EMBARQUE'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_RE_AnexoVL_CAMB_PROVIS_RE: TFloatField
      FieldName = 'VL_CAMB_PROVIS_RE'
      Origin = 'DBBROKER.TRE_ANEXO.VL_CAMB_PROVIS_RE'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_AnexoDT_PROVIS: TDateTimeField
      FieldName = 'DT_PROVIS'
      Origin = 'DBBROKER.TRE_ANEXO.DT_PROVIS'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_RE_AnexoVL_CAMB_APLIC_RE: TFloatField
      FieldName = 'VL_CAMB_APLIC_RE'
      Origin = 'DBBROKER.TRE_ANEXO.VL_CAMB_APLIC_RE'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_AnexoDT_APLICACAO: TDateTimeField
      FieldName = 'DT_APLICACAO'
      Origin = 'DBBROKER.TRE_ANEXO.DT_APLICACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_RE_AnexoVL_CAMB_LIQ_DESP: TFloatField
      FieldName = 'VL_CAMB_LIQ_DESP'
      Origin = 'DBBROKER.TRE_ANEXO.VL_CAMB_LIQ_DESP'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_AnexoDT_EMB_EF_COB_CAMB: TDateTimeField
      FieldName = 'DT_EMB_EF_COB_CAMB'
      Origin = 'DBBROKER.TRE_ANEXO.DT_EMB_EF_COB_CAMB'
    end
    object qry_RE_AnexoNR_SD_SISCOMEX: TStringField
      FieldName = 'NR_SD_SISCOMEX'
      Origin = 'DBBROKER.TRE_ANEXO.NR_SD_SISCOMEX'
      FixedChar = True
      Size = 12
    end
    object qry_RE_AnexoVL_COM_AG_EFET: TFloatField
      FieldName = 'VL_COM_AG_EFET'
      Origin = 'DBBROKER.TRE_ANEXO.VL_COM_AG_EFET'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_AnexoDT_EMISSAO_CONHEC_EMB: TDateTimeField
      FieldName = 'DT_EMISSAO_CONHEC_EMB'
      Origin = 'DBBROKER.TRE_ANEXO.DT_EMISSAO_CONHEC_EMB'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_RE_AnexoPESO_LIQUIDO_KG_REBATE: TFloatField
      FieldName = 'PESO_LIQUIDO_KG_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.PESO_LIQUIDO_KG_REBATE'
      DisplayFormat = '#,##0.00000'
    end
    object qry_RE_AnexoQT_COMERC_REBATE: TFloatField
      FieldName = 'QT_COMERC_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.QT_COMERC_REBATE'
      DisplayFormat = '#,##0.00000'
    end
    object qry_RE_AnexoCD_UNIDADE_COMERC_REBATE: TStringField
      FieldName = 'CD_UNIDADE_COMERC_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.CD_UNIDADE_COMERC_REBATE'
      FixedChar = True
      Size = 15
    end
    object qry_RE_AnexoQT_NBM_SH_REBATE: TFloatField
      FieldName = 'QT_NBM_SH_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.QT_NBM_SH_REBATE'
      DisplayFormat = '#,##0.00000'
    end
    object qry_RE_AnexoCD_UNIDADE_NBM_SH_REBATE: TStringField
      FieldName = 'CD_UNIDADE_NBM_SH_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.CD_UNIDADE_NBM_SH_REBATE'
      FixedChar = True
      Size = 15
    end
    object qry_RE_AnexoVL_TOTAL_COND_VENDA_REBATE: TFloatField
      FieldName = 'VL_TOTAL_COND_VENDA_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.VL_TOTAL_COND_VENDA_REBATE'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_AnexoVL_TOTAL_LOCAL_EMB_REBATE: TFloatField
      FieldName = 'VL_TOTAL_LOCAL_EMB_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.VL_TOTAL_LOCAL_EMB_REBATE'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_AnexoVL_COMISSAO_AGENTE_REBATE: TFloatField
      FieldName = 'VL_COMISSAO_AGENTE_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.VL_COMISSAO_AGENTE_REBATE'
      DisplayFormat = '#,##0.00'
    end
    object qry_RE_AnexoCD_FORMA_PGTO_REBATE: TStringField
      FieldName = 'CD_FORMA_PGTO_REBATE'
      Origin = 'DBBROKER.TRE_ANEXO.CD_FORMA_PGTO_REBATE'
      FixedChar = True
      Size = 1
    end
    object qry_RE_AnexoDT_AVERBACAO: TDateTimeField
      FieldName = 'DT_AVERBACAO'
      Origin = 'DBBROKER.TRE_ANEXO.DT_AVERBACAO'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_RE_AnexoIN_TRANSMISSAO_CONCLUIDA: TStringField
      FieldName = 'IN_TRANSMISSAO_CONCLUIDA'
      Origin = 'DBBROKER.TRE_ANEXO.IN_TRANSMISSAO_CONCLUIDA'
      FixedChar = True
      Size = 1
    end
    object qry_RE_AnexoTX_DESC_MERCADORIA: TMemoField
      FieldName = 'TX_DESC_MERCADORIA'
      Origin = 'DBBROKER.TRE_ANEXO.TX_DESC_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_RE_AnexoTX_OBSERVACAO_EXPORTADOR: TMemoField
      FieldName = 'TX_OBSERVACAO_EXPORTADOR'
      Origin = 'DBBROKER.TRE_ANEXO.TX_OBSERVACAO_EXPORTADOR'
      BlobType = ftMemo
    end
    object qry_RE_AnexoCD_SULF_NCM: TStringField
      FieldName = 'CD_SULF_NCM'
      Origin = 'DBBROKER.TRE_ANEXO.CD_SULF_NCM'
      FixedChar = True
      Size = 2
    end
    object qry_RE_AnexoQTD_PRAZO_PAGAMENTO: TIntegerField
      FieldName = 'QTD_PRAZO_PAGAMENTO'
      Origin = 'DBBROKER.TRE_ANEXO.QTD_PRAZO_PAGAMENTO'
    end
    object qry_RE_AnexoQTD_ANEXOS: TIntegerField
      FieldName = 'QTD_ANEXOS'
    end
    object qry_RE_AnexoIN_CCPTC: TBooleanField
      FieldName = 'IN_CCPTC'
    end
    object qry_RE_AnexoIN_INSUMO_CCPTC: TBooleanField
      FieldName = 'IN_INSUMO_CCPTC'
    end
    object qry_RE_AnexoIN_CCROM: TBooleanField
      FieldName = 'IN_CCROM'
    end
    object qry_RE_AnexolookupNM_NCM: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupNM_NCM'
      LookupDataSet = qry_NCM
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_NCM'
      Size = 100
      Lookup = True
    end
    object qry_RE_AnexoCD_UNID_MEDIDA_ESTAT: TStringField
      FieldName = 'CD_UNID_MEDIDA_ESTAT'
      FixedChar = True
      Size = 3
    end
    object qry_RE_AnexolookupCD_UNID_MEDIDA_NCM: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupCD_UNID_MEDIDA_NCM'
      LookupDataSet = qry_NCM
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'UNIDADE_MEDIDA'
      KeyFields = 'CD_NCM'
      Size = 3
      Lookup = True
    end
    object qry_RE_AnexolookupSG_UNID_MEDIDA_NCM: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupSG_UNID_MEDIDA_NCM'
      LookupDataSet = qry_UnidadeMedida
      LookupKeyFields = 'CD_UNID_MEDIDA'
      LookupResultField = 'NM_SIGLA'
      KeyFields = 'CD_UNID_MEDIDA_ESTAT'
      Size = 3
      Lookup = True
    end
    object qry_RE_AnexolookupNM_UNID_MEDIDA_NCM: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupNM_UNID_MEDIDA_NCM'
      LookupDataSet = qry_UnidadeMedida
      LookupKeyFields = 'CD_UNID_MEDIDA'
      LookupResultField = 'NM_UNID_MEDIDA'
      KeyFields = 'CD_UNID_MEDIDA_ESTAT'
      Size = 100
      Lookup = True
    end
    object qry_RE_AnexolookupNM_UNID_MEDIDA: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupNM_UNID_MEDIDA'
      LookupDataSet = qry_UnidadeMedida
      LookupKeyFields = 'CD_UNID_MEDIDA'
      LookupResultField = 'NM_UNID_MEDIDA'
      KeyFields = 'CD_UNID_MEDIDA'
      Size = 100
      Lookup = True
    end
    object qry_RE_AnexocalcTX_ANEXO: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcTX_ANEXO'
      Size = 10
      Calculated = True
    end
    object qry_RE_AnexoNR_RE: TStringField
      FieldName = 'NR_RE'
      FixedChar = True
      Size = 15
    end
    object qry_RE_AnexoTX_REGISTRO_NOVOEX: TMemoField
      FieldName = 'TX_REGISTRO_NOVOEX'
      BlobType = ftMemo
    end
    object qry_RE_AnexoIN_RE_AVERBADO: TBooleanField
      FieldName = 'IN_RE_AVERBADO'
    end
    object qry_RE_AnexoVL_SEM_COBERTURA: TFloatField
      FieldName = 'VL_SEM_COBERTURA'
    end
  end
  object ds_RE_Anexo: TDataSource
    DataSet = qry_RE_Anexo
    OnStateChange = ds_RE_AnexoStateChange
    Left = 40
    Top = 72
  end
  object upd_RE_Capa: TUpdateSQL
    ModifySQL.Strings = (
      'update TRE_CAPA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO,'
      '  NR_OUTRA_REF = :NR_OUTRA_REF,'
      '  NR_RE_SISCOMEX = :NR_RE_SISCOMEX,'
      '  NR_REG_VENDA = :NR_REG_VENDA,'
      '  NR_REG_CREDITO = :NR_REG_CREDITO,'
      '  NR_RE_VINCULADA = :NR_RE_VINCULADA,'
      '  NR_DI_VINCULADA = :NR_DI_VINCULADA,'
      '  CD_ENQUAD1 = :CD_ENQUAD1,'
      '  CD_ENQUAD2 = :CD_ENQUAD2,'
      '  CD_ENQUAD3 = :CD_ENQUAD3,'
      '  CD_ENQUAD4 = :CD_ENQUAD4,'
      '  CD_ENQUAD5 = :CD_ENQUAD5,'
      '  CD_ENQUAD6 = :CD_ENQUAD6,'
      '  CD_INST_NEGO = :CD_INST_NEGO,'
      '  CD_ACESSO = :CD_ACESSO,'
      '  CD_URF_EMBARQUE = :CD_URF_EMBARQUE,'
      '  CD_URF_DESPACHO = :CD_URF_DESPACHO,'
      '  IN_MARCA_ATUAL_FABRICANTE = :IN_MARCA_ATUAL_FABRICANTE,'
      '  IN_CONTROLE_RATEIO = :IN_CONTROLE_RATEIO,'
      '  DT_DATA_RE = :DT_DATA_RE,'
      '  DT_LIMITE_OPERACAO = :DT_LIMITE_OPERACAO,'
      '  VL_MARGEM_NAO_SACADA = :VL_MARGEM_NAO_SACADA,'
      '  VL_VALOR_CONSIGNACAO = :VL_VALOR_CONSIGNACAO,'
      '  VL_VALOR_COBER_CAMBIAL = :VL_VALOR_COBER_CAMBIAL,'
      '  VL_VALOR_FINANCEIRO_RC = :VL_VALOR_FINANCEIRO_RC,'
      '  VL_TOTAL_COND_VENDA_ACUM = :VL_TOTAL_COND_VENDA_ACUM,'
      '  VL_TOTAL_LOCAL_VENDA_ACUM = :VL_TOTAL_LOCAL_VENDA_ACUM,'
      '  CD_ULTIMO_ANEXO_TRANSMITIDO = :CD_ULTIMO_ANEXO_TRANSMITIDO,'
      '  IN_CONTROLE_TRANSMISSAO = :IN_CONTROLE_TRANSMISSAO,'
      '  IN_MARCA_TRANSMISSAO = :IN_MARCA_TRANSMISSAO,'
      '  DT_DATA_TRANSMISSAO = :DT_DATA_TRANSMISSAO,'
      '  CD_NUMERO_TRANSMISSAO = :CD_NUMERO_TRANSMISSAO,'
      '  VL_ESQUE_PG_TOTAL = :VL_ESQUE_PG_TOTAL,'
      '  VL_VALOR_NBM_INCLUIDAS = :VL_VALOR_NBM_INCLUIDAS,'
      '  CD_STATUS_RE = :CD_STATUS_RE,'
      '  TX_SITUACAO_RE = :TX_SITUACAO_RE,'
      '  CD_SUARIO = :CD_SUARIO,'
      '  DT_DATA = :DT_DATA,'
      '  TM_HORA = :TM_HORA,'
      '  CD_PROPRIETARIO = :CD_PROPRIETARIO,'
      '  IN_ORIGEM_REG = :IN_ORIGEM_REG,'
      '  NR_MASTER = :NR_MASTER,'
      '  NR_HOUSE = :NR_HOUSE,'
      '  DT_DATA_AVERBACAO = :DT_DATA_AVERBACAO,'
      '  DT_DATA_MASTER = :DT_DATA_MASTER,'
      '  CD_PAIS_FINAL = :CD_PAIS_FINAL,'
      '  CD_TIPO_IMPORTADOR = :CD_TIPO_IMPORTADOR,'
      '  CD_IMPORTADOR = :CD_IMPORTADOR,'
      '  DT_DATA_TRANSP_IBERNAT = :DT_DATA_TRANSP_IBERNAT,'
      '  TM_HORA_TRANSP_IBERNAT = :TM_HORA_TRANSP_IBERNAT,'
      '  CD_SITUACAO_RE = :CD_SITUACAO_RE,'
      '  TX_SITUACAO_SISBACEN = :TX_SITUACAO_SISBACEN,'
      '  CD_USUARIO_EXTERNO = :CD_USUARIO_EXTERNO,'
      '  TX_CPF_SISCOMEX = :TX_CPF_SISCOMEX,'
      '  TX_SENHA_SISCOMEX = :TX_SENHA_SISCOMEX,'
      '  NM_ARQUIVO_TRANSMISSAO = :NM_ARQUIVO_TRANSMISSAO,'
      '  IN_TRANSMISSAO_CONCLUIDA = :IN_TRANSMISSAO_CONCLUIDA,'
      '  CD_EXPORTADOR = :CD_EXPORTADOR,'
      '  IN_ORIGEM_RE = :IN_ORIGEM_RE,'
      '  QT_ANEXOS = :QT_ANEXOS,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  IN_AGRUPAR = :IN_AGRUPAR,'
      '  IN_QUEBRA_POR_VALOR = :IN_QUEBRA_POR_VALOR,'
      '  IN_QUEBRA_POR_FABRICANTE = :IN_QUEBRA_POR_FABRICANTE,'
      '  IN_DESC_TIPO_RECOF = :IN_DESC_TIPO_RECOF,'
      '  IN_NAO_QUEBRAR_LINHAS = :IN_NAO_QUEBRAR_LINHAS,'
      '  NR_PARCELAS = :NR_PARCELAS,'
      '  NR_PERIODICIDADE = :NR_PERIODICIDADE,'
      '  CD_MODALIDADE_TRANS = :CD_MODALIDADE_TRANS,'
      '  VL_CONSIGN = :VL_CONSIGN,'
      '  VL_SEM_COB_CAMBIAL = :VL_SEM_COB_CAMBIAL,'
      '  VL_FINANC_RC = :VL_FINANC_RC,'
      '  VL_PAGT_VISTA = :VL_PAGT_VISTA,'
      '  VL_PARCELA = :VL_PARCELA,'
      '  PC_MARGEM_NAO_SACADA = :PC_MARGEM_NAO_SACADA,'
      '  VL_ESQ_PAG_TOT = :VL_ESQ_PAG_TOT,'
      '  VL_PAGTO_ANTEC = :VL_PAGTO_ANTEC,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  TP_INDICADOR = :TP_INDICADOR,'
      '  PESO_LIQUIDO_TOTAL = :PESO_LIQUIDO_TOTAL,'
      '  VL_FRETE_TOTAL = :VL_FRETE_TOTAL,'
      '  VL_SEGURO_TOTAL = :VL_SEGURO_TOTAL,'
      '  DT_ULT_CONSULTA = :DT_ULT_CONSULTA,'
      '  TX_DOCUMENTO_SISCOMEX = :TX_DOCUMENTO_SISCOMEX,'
      '  TX_END_IMPORTADOR = :TX_END_IMPORTADOR,'
      '  CD_PAIS_IMPORTADOR = :CD_PAIS_IMPORTADOR,'
      '  VL_PESO_NBM_INCLUIDAS = :VL_PESO_NBM_INCLUIDAS,'
      '  IN_NOVOEX = :IN_NOVOEX,'
      '  ID_ARQUIVO_NOVOEX = :ID_ARQUIVO_NOVOEX,'
      '  NR_LOTE = :NR_LOTE,'
      '  TX_TRANSMISSAO_NOVOEX = :TX_TRANSMISSAO_NOVOEX,'
      '  CD_USUARIO_TRANSMISSAO = :CD_USUARIO_TRANSMISSAO,'
      '  NR_DSI_VINCULADA = :NR_DSI_VINCULADA,'
      '  IN_BAIXA_EXTRATO_DEFERIDO = :IN_BAIXA_EXTRATO_DEFERIDO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO')
    InsertSQL.Strings = (
      'insert into TRE_CAPA'
      
        '  (NR_PROCESSO, NR_PROCESSO_COMPLEMENTO, NR_OUTRA_REF, NR_RE_SIS' +
        'COMEX, '
      
        '   NR_REG_VENDA, NR_REG_CREDITO, NR_RE_VINCULADA, NR_DI_VINCULAD' +
        'A, CD_ENQUAD1, '
      
        '   CD_ENQUAD2, CD_ENQUAD3, CD_ENQUAD4, CD_ENQUAD5, CD_ENQUAD6, C' +
        'D_INST_NEGO, '
      
        '   CD_ACESSO, CD_URF_EMBARQUE, CD_URF_DESPACHO, IN_MARCA_ATUAL_F' +
        'ABRICANTE, '
      
        '   IN_CONTROLE_RATEIO, DT_DATA_RE, DT_LIMITE_OPERACAO, VL_MARGEM' +
        '_NAO_SACADA, '
      
        '   VL_VALOR_CONSIGNACAO, VL_VALOR_COBER_CAMBIAL, VL_VALOR_FINANC' +
        'EIRO_RC, '
      
        '   VL_TOTAL_COND_VENDA_ACUM, VL_TOTAL_LOCAL_VENDA_ACUM, CD_ULTIM' +
        'O_ANEXO_TRANSMITIDO, '
      
        '   IN_CONTROLE_TRANSMISSAO, IN_MARCA_TRANSMISSAO, DT_DATA_TRANSM' +
        'ISSAO, '
      
        '   CD_NUMERO_TRANSMISSAO, VL_ESQUE_PG_TOTAL, VL_VALOR_NBM_INCLUI' +
        'DAS, CD_STATUS_RE, '
      
        '   TX_SITUACAO_RE, CD_SUARIO, DT_DATA, TM_HORA, CD_PROPRIETARIO,' +
        ' IN_ORIGEM_REG, '
      
        '   NR_MASTER, NR_HOUSE, DT_DATA_AVERBACAO, DT_DATA_MASTER, CD_PA' +
        'IS_FINAL, '
      
        '   CD_TIPO_IMPORTADOR, CD_IMPORTADOR, DT_DATA_TRANSP_IBERNAT, TM' +
        '_HORA_TRANSP_IBERNAT, '
      
        '   CD_SITUACAO_RE, TX_SITUACAO_SISBACEN, CD_USUARIO_EXTERNO, TX_' +
        'CPF_SISCOMEX, '
      
        '   TX_SENHA_SISCOMEX, NM_ARQUIVO_TRANSMISSAO, IN_TRANSMISSAO_CON' +
        'CLUIDA, '
      
        '   CD_EXPORTADOR, IN_ORIGEM_RE, QT_ANEXOS, CD_MOEDA, IN_AGRUPAR,' +
        ' IN_QUEBRA_POR_VALOR, '
      
        '   IN_QUEBRA_POR_FABRICANTE, IN_DESC_TIPO_RECOF, IN_NAO_QUEBRAR_' +
        'LINHAS, '
      
        '   NR_PARCELAS, NR_PERIODICIDADE, CD_MODALIDADE_TRANS, VL_CONSIG' +
        'N, VL_SEM_COB_CAMBIAL, '
      
        '   VL_FINANC_RC, VL_PAGT_VISTA, VL_PARCELA, PC_MARGEM_NAO_SACADA' +
        ', VL_ESQ_PAG_TOT, '
      
        '   VL_PAGTO_ANTEC, CD_INCOTERM, TP_INDICADOR, PESO_LIQUIDO_TOTAL' +
        ', VL_FRETE_TOTAL, '
      
        '   VL_SEGURO_TOTAL, DT_ULT_CONSULTA, TX_DOCUMENTO_SISCOMEX, TX_E' +
        'ND_IMPORTADOR, '
      
        '   CD_PAIS_IMPORTADOR, VL_PESO_NBM_INCLUIDAS, IN_NOVOEX, ID_ARQU' +
        'IVO_NOVOEX, '
      
        '   NR_LOTE, TX_TRANSMISSAO_NOVOEX, CD_USUARIO_TRANSMISSAO, NR_DS' +
        'I_VINCULADA, '
      '   IN_BAIXA_EXTRATO_DEFERIDO)'
      'values'
      
        '  (:NR_PROCESSO, :NR_PROCESSO_COMPLEMENTO, :NR_OUTRA_REF, :NR_RE' +
        '_SISCOMEX, '
      
        '   :NR_REG_VENDA, :NR_REG_CREDITO, :NR_RE_VINCULADA, :NR_DI_VINC' +
        'ULADA, '
      
        '   :CD_ENQUAD1, :CD_ENQUAD2, :CD_ENQUAD3, :CD_ENQUAD4, :CD_ENQUA' +
        'D5, :CD_ENQUAD6, '
      
        '   :CD_INST_NEGO, :CD_ACESSO, :CD_URF_EMBARQUE, :CD_URF_DESPACHO' +
        ', :IN_MARCA_ATUAL_FABRICANTE, '
      
        '   :IN_CONTROLE_RATEIO, :DT_DATA_RE, :DT_LIMITE_OPERACAO, :VL_MA' +
        'RGEM_NAO_SACADA, '
      
        '   :VL_VALOR_CONSIGNACAO, :VL_VALOR_COBER_CAMBIAL, :VL_VALOR_FIN' +
        'ANCEIRO_RC, '
      
        '   :VL_TOTAL_COND_VENDA_ACUM, :VL_TOTAL_LOCAL_VENDA_ACUM, :CD_UL' +
        'TIMO_ANEXO_TRANSMITIDO, '
      
        '   :IN_CONTROLE_TRANSMISSAO, :IN_MARCA_TRANSMISSAO, :DT_DATA_TRA' +
        'NSMISSAO, '
      
        '   :CD_NUMERO_TRANSMISSAO, :VL_ESQUE_PG_TOTAL, :VL_VALOR_NBM_INC' +
        'LUIDAS, '
      
        '   :CD_STATUS_RE, :TX_SITUACAO_RE, :CD_SUARIO, :DT_DATA, :TM_HOR' +
        'A, :CD_PROPRIETARIO, '
      
        '   :IN_ORIGEM_REG, :NR_MASTER, :NR_HOUSE, :DT_DATA_AVERBACAO, :D' +
        'T_DATA_MASTER, '
      
        '   :CD_PAIS_FINAL, :CD_TIPO_IMPORTADOR, :CD_IMPORTADOR, :DT_DATA' +
        '_TRANSP_IBERNAT, '
      
        '   :TM_HORA_TRANSP_IBERNAT, :CD_SITUACAO_RE, :TX_SITUACAO_SISBAC' +
        'EN, :CD_USUARIO_EXTERNO, '
      
        '   :TX_CPF_SISCOMEX, :TX_SENHA_SISCOMEX, :NM_ARQUIVO_TRANSMISSAO' +
        ', :IN_TRANSMISSAO_CONCLUIDA, '
      
        '   :CD_EXPORTADOR, :IN_ORIGEM_RE, :QT_ANEXOS, :CD_MOEDA, :IN_AGR' +
        'UPAR, :IN_QUEBRA_POR_VALOR, '
      
        '   :IN_QUEBRA_POR_FABRICANTE, :IN_DESC_TIPO_RECOF, :IN_NAO_QUEBR' +
        'AR_LINHAS, '
      
        '   :NR_PARCELAS, :NR_PERIODICIDADE, :CD_MODALIDADE_TRANS, :VL_CO' +
        'NSIGN, '
      
        '   :VL_SEM_COB_CAMBIAL, :VL_FINANC_RC, :VL_PAGT_VISTA, :VL_PARCE' +
        'LA, :PC_MARGEM_NAO_SACADA, '
      
        '   :VL_ESQ_PAG_TOT, :VL_PAGTO_ANTEC, :CD_INCOTERM, :TP_INDICADOR' +
        ', :PESO_LIQUIDO_TOTAL, '
      
        '   :VL_FRETE_TOTAL, :VL_SEGURO_TOTAL, :DT_ULT_CONSULTA, :TX_DOCU' +
        'MENTO_SISCOMEX, '
      
        '   :TX_END_IMPORTADOR, :CD_PAIS_IMPORTADOR, :VL_PESO_NBM_INCLUID' +
        'AS, :IN_NOVOEX, '
      
        '   :ID_ARQUIVO_NOVOEX, :NR_LOTE, :TX_TRANSMISSAO_NOVOEX, :CD_USU' +
        'ARIO_TRANSMISSAO, '
      '   :NR_DSI_VINCULADA, :IN_BAIXA_EXTRATO_DEFERIDO)')
    DeleteSQL.Strings = (
      'delete from TRE_CAPA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO')
    Left = 340
    Top = 8
  end
  object upd_RE_Anexo: TUpdateSQL
    ModifySQL.Strings = (
      'update TRE_ANEXO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO,'
      '  CD_RE_ANEXO = :CD_RE_ANEXO,'
      '  CD_NALADI = :CD_NALADI,'
      '  CD_NCM = :CD_NCM,'
      '  CD_NBM = :CD_NBM,'
      '  CD_UF_PRODUTOR = :CD_UF_PRODUTOR,'
      '  CD_EMBALAGEM = :CD_EMBALAGEM,'
      '  CD_UNID_MEDIDA = :CD_UNID_MEDIDA,'
      '  CD_FINALIDADE = :CD_FINALIDADE,'
      '  CD_FORMA_PGTO = :CD_FORMA_PGTO,'
      '  TX_CATEGORIA_TEXTIL = :TX_CATEGORIA_TEXTIL,'
      '  IN_EXPORTADOR_FABRICANTE = :IN_EXPORTADOR_FABRICANTE,'
      '  IN_OBS_EXPORTADOR = :IN_OBS_EXPORTADOR,'
      '  DT_VALIDADE_EMBARQUE = :DT_VALIDADE_EMBARQUE,'
      '  PESO_LIQUIDO = :PESO_LIQUIDO,'
      '  QT_UNIDADE_COMERCIAL = :QT_UNIDADE_COMERCIAL,'
      '  QT_MEDIA_NBM = :QT_MEDIA_NBM,'
      '  VL_COND_VENDA = :VL_COND_VENDA,'
      '  VL_LOCAL_VENDA = :VL_LOCAL_VENDA,'
      '  PC_COMISSAO = :PC_COMISSAO,'
      '  VL_COMISSAO = :VL_COMISSAO,'
      '  VL_FRETE_RATEADO = :VL_FRETE_RATEADO,'
      '  VL_SEGURO_RATEADO = :VL_SEGURO_RATEADO,'
      '  PESO_BRUTO_RATEADO = :PESO_BRUTO_RATEADO,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  DT_DATA = :DT_DATA,'
      '  TM_HORA = :TM_HORA,'
      '  TX_OBSERVACAO_EXPORTADOR = :TX_OBSERVACAO_EXPORTADOR,'
      '  CD_ORIGEM_REGISTRO = :CD_ORIGEM_REGISTRO,'
      '  TX_PENDENCIA = :TX_PENDENCIA,'
      '  TX_OBSERVACOES = :TX_OBSERVACOES,'
      '  TX_MENS_ADVERTENCIA1 = :TX_MENS_ADVERTENCIA1,'
      '  TX_MENS_ADVERTENCIA2 = :TX_MENS_ADVERTENCIA2,'
      '  TX_MENS_ADVERTENCIA3 = :TX_MENS_ADVERTENCIA3,'
      '  TX_MENS_ADVERTENCIA4 = :TX_MENS_ADVERTENCIA4,'
      '  TX_MENS_ADVERTENCIA5 = :TX_MENS_ADVERTENCIA5,'
      '  TX_MENS_ADVERTENCIA6 = :TX_MENS_ADVERTENCIA6,'
      '  TX_MENS_ADVERTENCIA7 = :TX_MENS_ADVERTENCIA7,'
      '  TX_MENS_ADVERTENCIA8 = :TX_MENS_ADVERTENCIA8,'
      '  TX_MENS_ADVERTENCIA9 = :TX_MENS_ADVERTENCIA9,'
      '  TX_MENS_ADVERTENCIA10 = :TX_MENS_ADVERTENCIA10,'
      '  TX_MENS_ADVERTENCIA11 = :TX_MENS_ADVERTENCIA11,'
      '  TX_MENS_ADVERTENCIA12 = :TX_MENS_ADVERTENCIA12,'
      '  TX_MENS_ADVERTENCIA13 = :TX_MENS_ADVERTENCIA13,'
      '  TX_OBSERV_ORG_ANUENT1 = :TX_OBSERV_ORG_ANUENT1,'
      '  TX_OBSERV_ORG_ANUENT2 = :TX_OBSERV_ORG_ANUENT2,'
      '  TX_OBSERV_ORG_ANUENT3 = :TX_OBSERV_ORG_ANUENT3,'
      '  TX_OBSERV_ORG_ANUENT4 = :TX_OBSERV_ORG_ANUENT4,'
      '  TX_OBSERV_ORG_ANUENT5 = :TX_OBSERV_ORG_ANUENT5,'
      '  TX_OBSERV_ORG_ANUENT6 = :TX_OBSERV_ORG_ANUENT6,'
      '  TX_OBSERV_ORG_ANUENT7 = :TX_OBSERV_ORG_ANUENT7,'
      '  TX_OBSERV_ORG_ANUENT8 = :TX_OBSERV_ORG_ANUENT8,'
      '  TX_OBSERV_ORG_ANUENT9 = :TX_OBSERV_ORG_ANUENT9,'
      '  TX_OBSERV_ORG_ANUENT10 = :TX_OBSERV_ORG_ANUENT10,'
      '  TX_OBSERV_ORG_ANUENT11 = :TX_OBSERV_ORG_ANUENT11,'
      '  TX_OBSERV_ORG_ANUENT12 = :TX_OBSERV_ORG_ANUENT12,'
      '  TX_OBSERV_ORG_ANUENT13 = :TX_OBSERV_ORG_ANUENT13,'
      '  TX_OBSERV_ORG_ANUENT14 = :TX_OBSERV_ORG_ANUENT14,'
      '  QT_EMBARCADA = :QT_EMBARCADA,'
      '  VL_EMBARCADO = :VL_EMBARCADO,'
      '  DT_EMBARQUE = :DT_EMBARQUE,'
      '  VL_CAMB_PROVIS_RE = :VL_CAMB_PROVIS_RE,'
      '  DT_PROVIS = :DT_PROVIS,'
      '  VL_CAMB_APLIC_RE = :VL_CAMB_APLIC_RE,'
      '  DT_APLICACAO = :DT_APLICACAO,'
      '  VL_CAMB_LIQ_DESP = :VL_CAMB_LIQ_DESP,'
      '  DT_EMB_EF_COB_CAMB = :DT_EMB_EF_COB_CAMB,'
      '  NR_SD_SISCOMEX = :NR_SD_SISCOMEX,'
      '  VL_COM_AG_EFET = :VL_COM_AG_EFET,'
      '  DT_EMISSAO_CONHEC_EMB = :DT_EMISSAO_CONHEC_EMB,'
      '  PESO_LIQUIDO_KG_REBATE = :PESO_LIQUIDO_KG_REBATE,'
      '  QT_COMERC_REBATE = :QT_COMERC_REBATE,'
      '  CD_UNIDADE_COMERC_REBATE = :CD_UNIDADE_COMERC_REBATE,'
      '  QT_NBM_SH_REBATE = :QT_NBM_SH_REBATE,'
      '  CD_UNIDADE_NBM_SH_REBATE = :CD_UNIDADE_NBM_SH_REBATE,'
      '  VL_TOTAL_COND_VENDA_REBATE = :VL_TOTAL_COND_VENDA_REBATE,'
      '  VL_TOTAL_LOCAL_EMB_REBATE = :VL_TOTAL_LOCAL_EMB_REBATE,'
      '  VL_COMISSAO_AGENTE_REBATE = :VL_COMISSAO_AGENTE_REBATE,'
      '  CD_FORMA_PGTO_REBATE = :CD_FORMA_PGTO_REBATE,'
      '  DT_AVERBACAO = :DT_AVERBACAO,'
      '  IN_TRANSMISSAO_CONCLUIDA = :IN_TRANSMISSAO_CONCLUIDA,'
      '  TX_DESC_MERCADORIA = :TX_DESC_MERCADORIA,'
      '  CD_SULF_NCM = :CD_SULF_NCM,'
      '  QTD_PRAZO_PAGAMENTO = :QTD_PRAZO_PAGAMENTO,'
      '  IN_CCPTC = :IN_CCPTC,'
      '  IN_INSUMO_CCPTC = :IN_INSUMO_CCPTC,'
      '  IN_CCROM = :IN_CCROM'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO')
    InsertSQL.Strings = (
      'insert into TRE_ANEXO'
      
        '  (NR_PROCESSO, NR_PROCESSO_COMPLEMENTO, CD_RE_ANEXO, CD_NALADI,' +
        ' CD_NCM, '
      
        '   CD_NBM, CD_UF_PRODUTOR, CD_EMBALAGEM, CD_UNID_MEDIDA, CD_FINA' +
        'LIDADE, '
      
        '   CD_FORMA_PGTO, TX_CATEGORIA_TEXTIL, IN_EXPORTADOR_FABRICANTE,' +
        ' IN_OBS_EXPORTADOR, '
      
        '   DT_VALIDADE_EMBARQUE, PESO_LIQUIDO, QT_UNIDADE_COMERCIAL, QT_' +
        'MEDIA_NBM, '
      
        '   VL_COND_VENDA, VL_LOCAL_VENDA, PC_COMISSAO, VL_COMISSAO, VL_F' +
        'RETE_RATEADO, '
      
        '   VL_SEGURO_RATEADO, PESO_BRUTO_RATEADO, CD_USUARIO, DT_DATA, T' +
        'M_HORA, '
      
        '   TX_OBSERVACAO_EXPORTADOR, CD_ORIGEM_REGISTRO, TX_PENDENCIA, T' +
        'X_OBSERVACOES, '
      
        '   TX_MENS_ADVERTENCIA1, TX_MENS_ADVERTENCIA2, TX_MENS_ADVERTENC' +
        'IA3, TX_MENS_ADVERTENCIA4, '
      
        '   TX_MENS_ADVERTENCIA5, TX_MENS_ADVERTENCIA6, TX_MENS_ADVERTENC' +
        'IA7, TX_MENS_ADVERTENCIA8, '
      
        '   TX_MENS_ADVERTENCIA9, TX_MENS_ADVERTENCIA10, TX_MENS_ADVERTEN' +
        'CIA11, '
      
        '   TX_MENS_ADVERTENCIA12, TX_MENS_ADVERTENCIA13, TX_OBSERV_ORG_A' +
        'NUENT1, '
      
        '   TX_OBSERV_ORG_ANUENT2, TX_OBSERV_ORG_ANUENT3, TX_OBSERV_ORG_A' +
        'NUENT4, '
      
        '   TX_OBSERV_ORG_ANUENT5, TX_OBSERV_ORG_ANUENT6, TX_OBSERV_ORG_A' +
        'NUENT7, '
      
        '   TX_OBSERV_ORG_ANUENT8, TX_OBSERV_ORG_ANUENT9, TX_OBSERV_ORG_A' +
        'NUENT10, '
      
        '   TX_OBSERV_ORG_ANUENT11, TX_OBSERV_ORG_ANUENT12, TX_OBSERV_ORG' +
        '_ANUENT13, '
      
        '   TX_OBSERV_ORG_ANUENT14, QT_EMBARCADA, VL_EMBARCADO, DT_EMBARQ' +
        'UE, VL_CAMB_PROVIS_RE, '
      
        '   DT_PROVIS, VL_CAMB_APLIC_RE, DT_APLICACAO, VL_CAMB_LIQ_DESP, ' +
        'DT_EMB_EF_COB_CAMB, '
      
        '   NR_SD_SISCOMEX, VL_COM_AG_EFET, DT_EMISSAO_CONHEC_EMB, PESO_L' +
        'IQUIDO_KG_REBATE, '
      
        '   QT_COMERC_REBATE, CD_UNIDADE_COMERC_REBATE, QT_NBM_SH_REBATE,' +
        ' CD_UNIDADE_NBM_SH_REBATE, '
      
        '   VL_TOTAL_COND_VENDA_REBATE, VL_TOTAL_LOCAL_EMB_REBATE, VL_COM' +
        'ISSAO_AGENTE_REBATE, '
      
        '   CD_FORMA_PGTO_REBATE, DT_AVERBACAO, IN_TRANSMISSAO_CONCLUIDA,' +
        ' TX_DESC_MERCADORIA, '
      
        '   CD_SULF_NCM, QTD_PRAZO_PAGAMENTO, IN_CCPTC, IN_INSUMO_CCPTC, ' +
        'IN_CCROM)'
      'values'
      
        '  (:NR_PROCESSO, :NR_PROCESSO_COMPLEMENTO, :CD_RE_ANEXO, :CD_NAL' +
        'ADI, :CD_NCM, '
      
        '   :CD_NBM, :CD_UF_PRODUTOR, :CD_EMBALAGEM, :CD_UNID_MEDIDA, :CD' +
        '_FINALIDADE, '
      
        '   :CD_FORMA_PGTO, :TX_CATEGORIA_TEXTIL, :IN_EXPORTADOR_FABRICAN' +
        'TE, :IN_OBS_EXPORTADOR, '
      
        '   :DT_VALIDADE_EMBARQUE, :PESO_LIQUIDO, :QT_UNIDADE_COMERCIAL, ' +
        ':QT_MEDIA_NBM, '
      
        '   :VL_COND_VENDA, :VL_LOCAL_VENDA, :PC_COMISSAO, :VL_COMISSAO, ' +
        ':VL_FRETE_RATEADO, '
      
        '   :VL_SEGURO_RATEADO, :PESO_BRUTO_RATEADO, :CD_USUARIO, :DT_DAT' +
        'A, :TM_HORA, '
      
        '   :TX_OBSERVACAO_EXPORTADOR, :CD_ORIGEM_REGISTRO, :TX_PENDENCIA' +
        ', :TX_OBSERVACOES, '
      
        '   :TX_MENS_ADVERTENCIA1, :TX_MENS_ADVERTENCIA2, :TX_MENS_ADVERT' +
        'ENCIA3, '
      
        '   :TX_MENS_ADVERTENCIA4, :TX_MENS_ADVERTENCIA5, :TX_MENS_ADVERT' +
        'ENCIA6, '
      
        '   :TX_MENS_ADVERTENCIA7, :TX_MENS_ADVERTENCIA8, :TX_MENS_ADVERT' +
        'ENCIA9, '
      
        '   :TX_MENS_ADVERTENCIA10, :TX_MENS_ADVERTENCIA11, :TX_MENS_ADVE' +
        'RTENCIA12, '
      
        '   :TX_MENS_ADVERTENCIA13, :TX_OBSERV_ORG_ANUENT1, :TX_OBSERV_OR' +
        'G_ANUENT2, '
      
        '   :TX_OBSERV_ORG_ANUENT3, :TX_OBSERV_ORG_ANUENT4, :TX_OBSERV_OR' +
        'G_ANUENT5, '
      
        '   :TX_OBSERV_ORG_ANUENT6, :TX_OBSERV_ORG_ANUENT7, :TX_OBSERV_OR' +
        'G_ANUENT8, '
      
        '   :TX_OBSERV_ORG_ANUENT9, :TX_OBSERV_ORG_ANUENT10, :TX_OBSERV_O' +
        'RG_ANUENT11, '
      
        '   :TX_OBSERV_ORG_ANUENT12, :TX_OBSERV_ORG_ANUENT13, :TX_OBSERV_' +
        'ORG_ANUENT14, '
      
        '   :QT_EMBARCADA, :VL_EMBARCADO, :DT_EMBARQUE, :VL_CAMB_PROVIS_R' +
        'E, :DT_PROVIS, '
      
        '   :VL_CAMB_APLIC_RE, :DT_APLICACAO, :VL_CAMB_LIQ_DESP, :DT_EMB_' +
        'EF_COB_CAMB, '
      
        '   :NR_SD_SISCOMEX, :VL_COM_AG_EFET, :DT_EMISSAO_CONHEC_EMB, :PE' +
        'SO_LIQUIDO_KG_REBATE, '
      
        '   :QT_COMERC_REBATE, :CD_UNIDADE_COMERC_REBATE, :QT_NBM_SH_REBA' +
        'TE, :CD_UNIDADE_NBM_SH_REBATE, '
      
        '   :VL_TOTAL_COND_VENDA_REBATE, :VL_TOTAL_LOCAL_EMB_REBATE, :VL_' +
        'COMISSAO_AGENTE_REBATE, '
      
        '   :CD_FORMA_PGTO_REBATE, :DT_AVERBACAO, :IN_TRANSMISSAO_CONCLUI' +
        'DA, :TX_DESC_MERCADORIA, '
      
        '   :CD_SULF_NCM, :QTD_PRAZO_PAGAMENTO, :IN_CCPTC, :IN_INSUMO_CCP' +
        'TC, :IN_CCROM)')
    DeleteSQL.Strings = (
      'DELETE TRE_ANEXO'
      'WHERE'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO')
    Left = 340
    Top = 64
  end
  object qry_RE_Anexo_Fabric: TQuery
    CachedUpdates = True
    AfterOpen = qry_RE_Anexo_FabricAfterOpen
    BeforeClose = qry_RE_Anexo_ItensBeforeClose
    BeforeInsert = qry_RE_Anexo_FabricBeforeInsert
    BeforePost = qry_RE_Anexo_FabricBeforePost
    AfterCancel = qry_RE_Anexo_FabricAfterOpen
    AfterDelete = qry_RE_Anexo_FabricAfterOpen
    AfterScroll = qry_RE_Anexo_FabricAfterScroll
    OnNewRecord = qry_RE_Anexo_FabricNewRecord
    DatabaseName = 'DBBROKER'
    DataSource = ds_RE_Anexo
    SQL.Strings = (
      'SELECT NR_PROCESSO,'
      '       NR_PROCESSO_COMPLEMENTO,'
      '       CD_RE_ANEXO,'
      '       CD_FABRICANTE,'
      '       CD_RE_ANEXO_FABRIC,'
      '       UF,'
      '       NR_ATO,'
      '       QT_MERCADORIA,'
      '       VL_TOTAL,'
      '       PL_TOTAL,'
      '       TX_OBSERVACAO,'
      '       NM_UNID_MEDIDA,'
      '       NM_FABRICANTE,'
      '       CNPJ_FABRICANTE'
      'FROM TRE_ANEXO_FABRIC RAF (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO'
      '  AND CD_RE_ANEXO = :CD_RE_ANEXO')
    UpdateObject = upd_RE_Anexo_Fabric
    Left = 176
    Top = 183
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO_COMPLEMENTO'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CD_RE_ANEXO'
        ParamType = ptInput
        Size = 4
      end>
    object qry_RE_Anexo_FabricNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 18
    end
    object qry_RE_Anexo_FabricNR_PROCESSO_COMPLEMENTO: TStringField
      FieldName = 'NR_PROCESSO_COMPLEMENTO'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.NR_PROCESSO_COMPLEMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object qry_RE_Anexo_FabricCD_RE_ANEXO: TIntegerField
      FieldName = 'CD_RE_ANEXO'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.CD_RE_ANEXO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qry_RE_Anexo_FabricCD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.CD_FABRICANTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      OnChange = qry_RE_Anexo_FabricCD_FABRICANTEChange
      FixedChar = True
      Size = 5
    end
    object qry_RE_Anexo_FabricCD_RE_ANEXO_FABRIC: TIntegerField
      FieldName = 'CD_RE_ANEXO_FABRIC'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.CD_RE_ANEXO_FABRIC'
    end
    object qry_RE_Anexo_FabricUF: TStringField
      FieldName = 'UF'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.UF'
      FixedChar = True
      Size = 2
    end
    object qry_RE_Anexo_FabricNR_ATO: TStringField
      FieldName = 'NR_ATO'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.NR_ATO'
      FixedChar = True
      Size = 13
    end
    object qry_RE_Anexo_FabricQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.QT_MERCADORIA'
      OnChange = qry_RE_Anexo_FabricQT_MERCADORIAChange
      DisplayFormat = '#0.00000'
      EditFormat = '#0.00000'
    end
    object qry_RE_Anexo_FabricVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.VL_TOTAL'
      OnChange = qry_RE_Anexo_FabricVL_TOTALChange
      DisplayFormat = '#0.00'
      EditFormat = '#0.00'
    end
    object qry_RE_Anexo_FabricPL_TOTAL: TFloatField
      FieldName = 'PL_TOTAL'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.PL_TOTAL'
      OnChange = qry_RE_Anexo_FabricPL_TOTALChange
      DisplayFormat = '#0.00000'
      EditFormat = '#0.00000'
    end
    object qry_RE_Anexo_FabricTX_OBSERVACAO: TStringField
      FieldName = 'TX_OBSERVACAO'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.TX_OBSERVACAO'
      FixedChar = True
      Size = 200
    end
    object qry_RE_Anexo_FabricNM_UNID_MEDIDA: TStringField
      FieldName = 'NM_UNID_MEDIDA'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.NM_UNID_MEDIDA'
      FixedChar = True
      Size = 100
    end
    object qry_RE_Anexo_FabricNM_FABRICANTE: TStringField
      FieldName = 'NM_FABRICANTE'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.NM_FABRICANTE'
      FixedChar = True
      Size = 80
    end
    object qry_RE_Anexo_FabricCNPJ_FABRICANTE: TStringField
      FieldName = 'CNPJ_FABRICANTE'
      Origin = 'DBBROKER.TRE_ANEXO_FABRIC.CNPJ_FABRICANTE'
      FixedChar = True
      Size = 14
    end
  end
  object ds_RE_Anexo_Fabric: TDataSource
    DataSet = qry_RE_Anexo_Fabric
    OnStateChange = ds_RE_CapaStateChange
    Left = 40
    Top = 184
  end
  object upd_RE_Anexo_Fabric: TUpdateSQL
    ModifySQL.Strings = (
      'update TRE_ANEXO_FABRIC'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO,'
      '  CD_RE_ANEXO = :CD_RE_ANEXO,'
      '  CD_FABRICANTE = :CD_FABRICANTE,'
      '  CD_RE_ANEXO_FABRIC = :CD_RE_ANEXO_FABRIC,'
      '  UF = :UF,'
      '  NR_ATO = :NR_ATO,'
      '  QT_MERCADORIA = :QT_MERCADORIA,'
      '  VL_TOTAL = :VL_TOTAL,'
      '  PL_TOTAL = :PL_TOTAL,'
      '  TX_OBSERVACAO = :TX_OBSERVACAO,'
      '  NM_UNID_MEDIDA = :NM_UNID_MEDIDA,'
      '  NM_FABRICANTE = :NM_FABRICANTE,'
      '  CNPJ_FABRICANTE = :CNPJ_FABRICANTE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO and'
      '  CD_RE_ANEXO_FABRIC = :OLD_CD_RE_ANEXO_FABRIC')
    InsertSQL.Strings = (
      'insert into TRE_ANEXO_FABRIC'
      
        '  (NR_PROCESSO, NR_PROCESSO_COMPLEMENTO, CD_RE_ANEXO, CD_FABRICA' +
        'NTE, CD_RE_ANEXO_FABRIC, '
      
        '   UF, NR_ATO, QT_MERCADORIA, VL_TOTAL, PL_TOTAL, TX_OBSERVACAO,' +
        ' NM_UNID_MEDIDA, '
      '   NM_FABRICANTE, CNPJ_FABRICANTE)'
      'values'
      
        '  (:NR_PROCESSO, :NR_PROCESSO_COMPLEMENTO, :CD_RE_ANEXO, :CD_FAB' +
        'RICANTE, '
      
        '   :CD_RE_ANEXO_FABRIC, :UF, :NR_ATO, :QT_MERCADORIA, :VL_TOTAL,' +
        ' :PL_TOTAL, '
      
        '   :TX_OBSERVACAO, :NM_UNID_MEDIDA, :NM_FABRICANTE, :CNPJ_FABRIC' +
        'ANTE)')
    DeleteSQL.Strings = (
      'DELETE TRE_ANEXO_FABRIC'
      'WHERE'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO and'
      '  CD_RE_ANEXO_FABRIC = :OLD_CD_RE_ANEXO_FABRIC')
    Left = 339
    Top = 174
  end
  object XMLDocument1: TXMLDocument
    NodeIndentStr = '    '
    Options = [doNodeAutoCreate, doNodeAutoIndent, doAttrNull, doAutoPrefix, doNamespaceDecl]
    Left = 344
    Top = 456
    DOMVendorDesc = 'MSXML'
  end
  object qry_RE_Anexo_Itens: TQuery
    CachedUpdates = True
    AfterOpen = qry_RE_Anexo_ItensAfterOpen
    BeforeClose = qry_RE_Anexo_ItensBeforeClose
    DatabaseName = 'DBBROKER'
    DataSource = ds_RE_Anexo
    SQL.Strings = (
      
        'SELECT *, CONVERT(VARCHAR(MAX), TX_MERCADORIA) AS TX_MERCADORIA_' +
        'COMPLETO'
      'FROM TRE_ANEXO_PURO (NOLOCK)'
      'WHERE NR_PROCESSO             = :NR_PROCESSO'
      '  AND NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO'
      '  AND CD_RE_ANEXO = :CD_RE_ANEXO')
    UpdateObject = upd_RE_Anexo_Itens
    Left = 176
    Top = 128
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO_COMPLEMENTO'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CD_RE_ANEXO'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_RE_Anexo_ItensNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 18
    end
    object qry_RE_Anexo_ItensNR_PROCESSO_COMPLEMENTO: TStringField
      FieldName = 'NR_PROCESSO_COMPLEMENTO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.NR_PROCESSO_COMPLEMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object qry_RE_Anexo_ItensID_ANEXO: TAutoIncField
      FieldName = 'ID_ANEXO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.ID_ANEXO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qry_RE_Anexo_ItensCD_RE_ANEXO: TIntegerField
      FieldName = 'CD_RE_ANEXO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_RE_ANEXO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qry_RE_Anexo_ItensNR_PEDIDO_IMP: TStringField
      FieldName = 'NR_PEDIDO_IMP'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.NR_PEDIDO_IMP'
      FixedChar = True
      Size = 15
    end
    object qry_RE_Anexo_ItensCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object qry_RE_Anexo_ItensCD_NCM: TStringField
      FieldName = 'CD_NCM'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_NCM'
      FixedChar = True
      Size = 11
    end
    object qry_RE_Anexo_ItensCD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_NALADI_SH'
      FixedChar = True
      Size = 8
    end
    object qry_RE_Anexo_ItensCD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_UNID_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qry_RE_Anexo_ItensCD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_EMBALAGEM'
      FixedChar = True
      Size = 4
    end
    object qry_RE_Anexo_ItensCD_CLASSIF_EMBALAGEM: TStringField
      FieldName = 'CD_CLASSIF_EMBALAGEM'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_CLASSIF_EMBALAGEM'
      FixedChar = True
      Size = 30
    end
    object qry_RE_Anexo_ItensCD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_FABR_EXPO'
      FixedChar = True
      Size = 1
    end
    object qry_RE_Anexo_ItensQT_POR_EMB: TFloatField
      FieldName = 'QT_POR_EMB'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.QT_POR_EMB'
      DisplayFormat = '#0.00000'
    end
    object qry_RE_Anexo_ItensQT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.QT_EMBALAGEM'
      DisplayFormat = '#0.00000'
    end
    object qry_RE_Anexo_ItensQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.QT_MERCADORIA'
      DisplayFormat = '#0.00000'
    end
    object qry_RE_Anexo_ItensVL_POR_EMB: TFloatField
      FieldName = 'VL_POR_EMB'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_POR_EMB'
    end
    object qry_RE_Anexo_ItensVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_UNITARIO'
    end
    object qry_RE_Anexo_ItensVL_PESO_LIQ_UNIT: TFloatField
      FieldName = 'VL_PESO_LIQ_UNIT'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_PESO_LIQ_UNIT'
      DisplayFormat = '#0.00000'
    end
    object qry_RE_Anexo_ItensVL_COMPRIMENTO_EMB: TFloatField
      FieldName = 'VL_COMPRIMENTO_EMB'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_COMPRIMENTO_EMB'
    end
    object qry_RE_Anexo_ItensVL_LARGURA_EMB: TFloatField
      FieldName = 'VL_LARGURA_EMB'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_LARGURA_EMB'
    end
    object qry_RE_Anexo_ItensVL_ALTURA_EMB: TFloatField
      FieldName = 'VL_ALTURA_EMB'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_ALTURA_EMB'
    end
    object qry_RE_Anexo_ItensVL_PESO_EMB: TFloatField
      FieldName = 'VL_PESO_EMB'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_PESO_EMB'
      DisplayFormat = '#0.00000'
    end
    object qry_RE_Anexo_ItensVL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_TOT_ITEM'
    end
    object qry_RE_Anexo_ItensVL_TOT_PESO_LIQ: TFloatField
      FieldName = 'VL_TOT_PESO_LIQ'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_TOT_PESO_LIQ'
      DisplayFormat = '#0.00000'
    end
    object qry_RE_Anexo_ItensVL_TOT_PESO_BRUTO: TFloatField
      FieldName = 'VL_TOT_PESO_BRUTO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_TOT_PESO_BRUTO'
      DisplayFormat = '#0.00000'
    end
    object qry_RE_Anexo_ItensVL_CUBAGEM: TFloatField
      FieldName = 'VL_CUBAGEM'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_CUBAGEM'
    end
    object qry_RE_Anexo_ItensVL_MLE: TFloatField
      FieldName = 'VL_MLE'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_MLE'
    end
    object qry_RE_Anexo_ItensVL_MCV: TFloatField
      FieldName = 'VL_MCV'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_MCV'
    end
    object qry_RE_Anexo_ItensVL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_SEGURO'
    end
    object qry_RE_Anexo_ItensVL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_FRETE'
    end
    object qry_RE_Anexo_ItensVL_DESPESA: TFloatField
      FieldName = 'VL_DESPESA'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_DESPESA'
    end
    object qry_RE_Anexo_ItensVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_DESCONTO'
    end
    object qry_RE_Anexo_ItensTX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.TX_MERCADORIA'
      BlobType = ftMemo
      Size = 1000
    end
    object qry_RE_Anexo_ItensNR_PROC_PE: TStringField
      FieldName = 'NR_PROC_PE'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.NR_PROC_PE'
      FixedChar = True
      Size = 18
    end
    object qry_RE_Anexo_ItensNR_ITEM_PE: TStringField
      FieldName = 'NR_ITEM_PE'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.NR_ITEM_PE'
      FixedChar = True
      Size = 3
    end
    object qry_RE_Anexo_ItensCD_EMBALAGEM_SUP: TStringField
      FieldName = 'CD_EMBALAGEM_SUP'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_EMBALAGEM_SUP'
      FixedChar = True
      Size = 4
    end
    object qry_RE_Anexo_ItensCD_CLASSIF_EMBALAGEM_SUP: TStringField
      FieldName = 'CD_CLASSIF_EMBALAGEM_SUP'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_CLASSIF_EMBALAGEM_SUP'
      FixedChar = True
      Size = 30
    end
    object qry_RE_Anexo_ItensQT_POR_EMB_SUP: TFloatField
      FieldName = 'QT_POR_EMB_SUP'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.QT_POR_EMB_SUP'
      DisplayFormat = '#0.00000'
    end
    object qry_RE_Anexo_ItensQT_EMBALAGEM_SUP: TFloatField
      FieldName = 'QT_EMBALAGEM_SUP'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.QT_EMBALAGEM_SUP'
      DisplayFormat = '#0.00000'
    end
    object qry_RE_Anexo_ItensVL_POR_EMB_SUP: TFloatField
      FieldName = 'VL_POR_EMB_SUP'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_POR_EMB_SUP'
    end
    object qry_RE_Anexo_ItensCD_EMBALAGEM_CLIENTE: TStringField
      FieldName = 'CD_EMBALAGEM_CLIENTE'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_EMBALAGEM_CLIENTE'
      FixedChar = True
      Size = 10
    end
    object qry_RE_Anexo_ItensCD_RMAS: TStringField
      FieldName = 'CD_RMAS'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_RMAS'
      FixedChar = True
      Size = 10
    end
    object qry_RE_Anexo_ItensIN_ACORDO: TBooleanField
      FieldName = 'IN_ACORDO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.IN_ACORDO'
    end
    object qry_RE_Anexo_ItensNR_SEQ_NALADI: TIntegerField
      FieldName = 'NR_SEQ_NALADI'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.NR_SEQ_NALADI'
    end
    object qry_RE_Anexo_ItensNR_SEQ_NCM: TIntegerField
      FieldName = 'NR_SEQ_NCM'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.NR_SEQ_NCM'
    end
    object qry_RE_Anexo_ItensCD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_RE_Anexo_ItensNR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.NR_PEDIDO'
      FixedChar = True
      Size = 18
    end
    object qry_RE_Anexo_ItensCD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_PAIS_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_RE_Anexo_ItensTP_ACORDO: TStringField
      FieldName = 'TP_ACORDO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.TP_ACORDO'
      FixedChar = True
      Size = 1
    end
    object qry_RE_Anexo_ItensCD_NCM_DOC: TStringField
      FieldName = 'CD_NCM_DOC'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_NCM_DOC'
      FixedChar = True
      Size = 8
    end
    object qry_RE_Anexo_ItensCD_NALADI_DOC: TStringField
      FieldName = 'CD_NALADI_DOC'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_NALADI_DOC'
      FixedChar = True
      Size = 8
    end
    object qry_RE_Anexo_ItensCD_ACORDO: TStringField
      FieldName = 'CD_ACORDO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_ACORDO'
      FixedChar = True
      Size = 10
    end
    object qry_RE_Anexo_ItensNR_SEQ_NCM_DOC: TIntegerField
      FieldName = 'NR_SEQ_NCM_DOC'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.NR_SEQ_NCM_DOC'
    end
    object qry_RE_Anexo_ItensNR_SEQ_NALADI_DOC: TIntegerField
      FieldName = 'NR_SEQ_NALADI_DOC'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.NR_SEQ_NALADI_DOC'
    end
    object qry_RE_Anexo_ItensNR_ORDEM_CERT_ORIGEM: TStringField
      FieldName = 'NR_ORDEM_CERT_ORIGEM'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.NR_ORDEM_CERT_ORIGEM'
      FixedChar = True
      Size = 3
    end
    object qry_RE_Anexo_ItensNR_ATO: TStringField
      FieldName = 'NR_ATO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.NR_ATO'
      FixedChar = True
      Size = 13
    end
    object qry_RE_Anexo_ItensIN_RATEADO: TStringField
      FieldName = 'IN_RATEADO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.IN_RATEADO'
      FixedChar = True
      Size = 1
    end
    object qry_RE_Anexo_ItensCD_UF_PRODUTOR: TStringField
      FieldName = 'CD_UF_PRODUTOR'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_UF_PRODUTOR'
      FixedChar = True
      Size = 2
    end
    object qry_RE_Anexo_ItensCD_FINALIDADE_MERC: TStringField
      FieldName = 'CD_FINALIDADE_MERC'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_FINALIDADE_MERC'
      FixedChar = True
      Size = 3
    end
    object qry_RE_Anexo_ItensPC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.PC_COMISSAO'
    end
    object qry_RE_Anexo_ItensCD_FORMA_PGTO: TStringField
      FieldName = 'CD_FORMA_PGTO'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_FORMA_PGTO'
      FixedChar = True
      Size = 1
    end
    object qry_RE_Anexo_ItensVL_COND_VENDA: TFloatField
      FieldName = 'VL_COND_VENDA'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_COND_VENDA'
    end
    object qry_RE_Anexo_ItensVL_LOCAL_VENDA: TFloatField
      FieldName = 'VL_LOCAL_VENDA'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_LOCAL_VENDA'
    end
    object qry_RE_Anexo_ItensCD_SULF_NCM: TStringField
      FieldName = 'CD_SULF_NCM'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_SULF_NCM'
      FixedChar = True
      Size = 2
    end
    object qry_RE_Anexo_ItensTX_MERCADORIA_ITEM: TStringField
      FieldName = 'TX_MERCADORIA_ITEM'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.TX_MERCADORIA_ITEM'
      FixedChar = True
      Size = 255
    end
    object qry_RE_Anexo_ItensVL_SEM_COBERTURA: TFloatField
      FieldName = 'VL_SEM_COBERTURA'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.VL_SEM_COBERTURA'
    end
    object qry_RE_Anexo_ItensCD_UNID_MEDIDA_ESTAT: TStringField
      FieldName = 'CD_UNID_MEDIDA_ESTAT'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.CD_UNID_MEDIDA_ESTAT'
      FixedChar = True
      Size = 3
    end
    object qry_RE_Anexo_ItensQT_UNID_MEDIDA_ESTAT: TFloatField
      FieldName = 'QT_UNID_MEDIDA_ESTAT'
      Origin = 'DBBROKER.TRE_ANEXO_PURO.QT_UNID_MEDIDA_ESTAT'
    end
  end
  object ds_RE_Anexo_Itens: TDataSource
    DataSet = qry_RE_Anexo_Itens
    OnStateChange = ds_RE_CapaStateChange
    Left = 40
    Top = 128
  end
  object upd_RE_Anexo_Itens: TUpdateSQL
    ModifySQL.Strings = (
      'update TRE_ANEXO_PURO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO,'
      '  NR_PEDIDO_IMP = :NR_PEDIDO_IMP,'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  CD_NCM = :CD_NCM,'
      '  CD_NALADI_SH = :CD_NALADI_SH,'
      '  CD_UNID_MEDIDA = :CD_UNID_MEDIDA,'
      '  CD_EMBALAGEM = :CD_EMBALAGEM,'
      '  CD_CLASSIF_EMBALAGEM = :CD_CLASSIF_EMBALAGEM,'
      '  CD_FABR_EXPO = :CD_FABR_EXPO,'
      '  QT_POR_EMB = :QT_POR_EMB,'
      '  QT_EMBALAGEM = :QT_EMBALAGEM,'
      '  QT_MERCADORIA = :QT_MERCADORIA,'
      '  VL_POR_EMB = :VL_POR_EMB,'
      '  VL_UNITARIO = :VL_UNITARIO,'
      '  VL_PESO_LIQ_UNIT = :VL_PESO_LIQ_UNIT,'
      '  VL_COMPRIMENTO_EMB = :VL_COMPRIMENTO_EMB,'
      '  VL_LARGURA_EMB = :VL_LARGURA_EMB,'
      '  VL_ALTURA_EMB = :VL_ALTURA_EMB,'
      '  VL_PESO_EMB = :VL_PESO_EMB,'
      '  VL_TOT_ITEM = :VL_TOT_ITEM,'
      '  VL_TOT_PESO_LIQ = :VL_TOT_PESO_LIQ,'
      '  VL_TOT_PESO_BRUTO = :VL_TOT_PESO_BRUTO,'
      '  VL_CUBAGEM = :VL_CUBAGEM,'
      '  VL_MLE = :VL_MLE,'
      '  VL_MCV = :VL_MCV,'
      '  VL_SEGURO = :VL_SEGURO,'
      '  VL_FRETE = :VL_FRETE,'
      '  VL_DESPESA = :VL_DESPESA,'
      '  VL_DESCONTO = :VL_DESCONTO,'
      '  TX_MERCADORIA = :TX_MERCADORIA,'
      '  NR_PROC_PE = :NR_PROC_PE,'
      '  NR_ITEM_PE = :NR_ITEM_PE,'
      '  CD_EMBALAGEM_SUP = :CD_EMBALAGEM_SUP,'
      '  CD_CLASSIF_EMBALAGEM_SUP = :CD_CLASSIF_EMBALAGEM_SUP,'
      '  QT_POR_EMB_SUP = :QT_POR_EMB_SUP,'
      '  QT_EMBALAGEM_SUP = :QT_EMBALAGEM_SUP,'
      '  VL_POR_EMB_SUP = :VL_POR_EMB_SUP,'
      '  CD_EMBALAGEM_CLIENTE = :CD_EMBALAGEM_CLIENTE,'
      '  CD_RMAS = :CD_RMAS,'
      '  IN_ACORDO = :IN_ACORDO,'
      '  NR_SEQ_NALADI = :NR_SEQ_NALADI,'
      '  NR_SEQ_NCM = :NR_SEQ_NCM,'
      '  CD_FABRICANTE = :CD_FABRICANTE,'
      '  NR_PEDIDO = :NR_PEDIDO,'
      '  CD_PAIS_ORIGEM = :CD_PAIS_ORIGEM,'
      '  TP_ACORDO = :TP_ACORDO,'
      '  CD_NCM_DOC = :CD_NCM_DOC,'
      '  CD_NALADI_DOC = :CD_NALADI_DOC,'
      '  CD_ACORDO = :CD_ACORDO,'
      '  NR_SEQ_NCM_DOC = :NR_SEQ_NCM_DOC,'
      '  NR_SEQ_NALADI_DOC = :NR_SEQ_NALADI_DOC,'
      '  NR_ORDEM_CERT_ORIGEM = :NR_ORDEM_CERT_ORIGEM,'
      '  NR_ATO = :NR_ATO,'
      '  IN_RATEADO = :IN_RATEADO,'
      '  CD_UF_PRODUTOR = :CD_UF_PRODUTOR,'
      '  CD_FINALIDADE_MERC = :CD_FINALIDADE_MERC,'
      '  PC_COMISSAO = :PC_COMISSAO,'
      '  CD_FORMA_PGTO = :CD_FORMA_PGTO,'
      '  VL_COND_VENDA = :VL_COND_VENDA,'
      '  VL_LOCAL_VENDA = :VL_LOCAL_VENDA,'
      '  CD_SULF_NCM = :CD_SULF_NCM,'
      '  CD_RE_ANEXO = :CD_RE_ANEXO,'
      '  TX_MERCADORIA_ITEM = :TX_MERCADORIA_ITEM'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  ID_ANEXO = :OLD_ID_ANEXO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO')
    InsertSQL.Strings = (
      'insert into TRE_ANEXO_PURO'
      
        '  (NR_PROCESSO, NR_PROCESSO_COMPLEMENTO, NR_PEDIDO_IMP, CD_MERCA' +
        'DORIA, '
      
        '   CD_NCM, CD_NALADI_SH, CD_UNID_MEDIDA, CD_EMBALAGEM, CD_CLASSI' +
        'F_EMBALAGEM, '
      
        '   CD_FABR_EXPO, QT_POR_EMB, QT_EMBALAGEM, QT_MERCADORIA, VL_POR' +
        '_EMB, VL_UNITARIO, '
      
        '   VL_PESO_LIQ_UNIT, VL_COMPRIMENTO_EMB, VL_LARGURA_EMB, VL_ALTU' +
        'RA_EMB, '
      
        '   VL_PESO_EMB, VL_TOT_ITEM, VL_TOT_PESO_LIQ, VL_TOT_PESO_BRUTO,' +
        ' VL_CUBAGEM, '
      
        '   VL_MLE, VL_MCV, VL_SEGURO, VL_FRETE, VL_DESPESA, VL_DESCONTO,' +
        ' TX_MERCADORIA, '
      
        '   NR_PROC_PE, NR_ITEM_PE, CD_EMBALAGEM_SUP, CD_CLASSIF_EMBALAGE' +
        'M_SUP, '
      
        '   QT_POR_EMB_SUP, QT_EMBALAGEM_SUP, VL_POR_EMB_SUP, CD_EMBALAGE' +
        'M_CLIENTE, '
      
        '   CD_RMAS, IN_ACORDO, NR_SEQ_NALADI, NR_SEQ_NCM, CD_FABRICANTE,' +
        ' NR_PEDIDO, '
      
        '   CD_PAIS_ORIGEM, TP_ACORDO, CD_NCM_DOC, CD_NALADI_DOC, CD_ACOR' +
        'DO, NR_SEQ_NCM_DOC, '
      
        '   NR_SEQ_NALADI_DOC, NR_ORDEM_CERT_ORIGEM, NR_ATO, IN_RATEADO, ' +
        'CD_UF_PRODUTOR, '
      
        '   CD_FINALIDADE_MERC, PC_COMISSAO, CD_FORMA_PGTO, VL_COND_VENDA' +
        ', VL_LOCAL_VENDA, '
      '   CD_SULF_NCM, CD_RE_ANEXO, TX_MERCADORIA_ITEM)'
      'values'
      
        '  (:NR_PROCESSO, :NR_PROCESSO_COMPLEMENTO, :NR_PEDIDO_IMP, :CD_M' +
        'ERCADORIA, '
      
        '   :CD_NCM, :CD_NALADI_SH, :CD_UNID_MEDIDA, :CD_EMBALAGEM, :CD_C' +
        'LASSIF_EMBALAGEM, '
      
        '   :CD_FABR_EXPO, :QT_POR_EMB, :QT_EMBALAGEM, :QT_MERCADORIA, :V' +
        'L_POR_EMB, '
      
        '   :VL_UNITARIO, :VL_PESO_LIQ_UNIT, :VL_COMPRIMENTO_EMB, :VL_LAR' +
        'GURA_EMB, '
      
        '   :VL_ALTURA_EMB, :VL_PESO_EMB, :VL_TOT_ITEM, :VL_TOT_PESO_LIQ,' +
        ' :VL_TOT_PESO_BRUTO, '
      
        '   :VL_CUBAGEM, :VL_MLE, :VL_MCV, :VL_SEGURO, :VL_FRETE, :VL_DES' +
        'PESA, :VL_DESCONTO, '
      
        '   :TX_MERCADORIA, :NR_PROC_PE, :NR_ITEM_PE, :CD_EMBALAGEM_SUP, ' +
        ':CD_CLASSIF_EMBALAGEM_SUP, '
      
        '   :QT_POR_EMB_SUP, :QT_EMBALAGEM_SUP, :VL_POR_EMB_SUP, :CD_EMBA' +
        'LAGEM_CLIENTE, '
      
        '   :CD_RMAS, :IN_ACORDO, :NR_SEQ_NALADI, :NR_SEQ_NCM, :CD_FABRIC' +
        'ANTE, :NR_PEDIDO, '
      
        '   :CD_PAIS_ORIGEM, :TP_ACORDO, :CD_NCM_DOC, :CD_NALADI_DOC, :CD' +
        '_ACORDO, '
      
        '   :NR_SEQ_NCM_DOC, :NR_SEQ_NALADI_DOC, :NR_ORDEM_CERT_ORIGEM, :' +
        'NR_ATO, '
      
        '   :IN_RATEADO, :CD_UF_PRODUTOR, :CD_FINALIDADE_MERC, :PC_COMISS' +
        'AO, :CD_FORMA_PGTO, '
      
        '   :VL_COND_VENDA, :VL_LOCAL_VENDA, :CD_SULF_NCM, :CD_RE_ANEXO, ' +
        ':TX_MERCADORIA_ITEM)')
    DeleteSQL.Strings = (
      'DELETE TRE_ANEXO_PURO'
      'WHERE'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  ID_ANEXO = :OLD_ID_ANEXO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO')
    Left = 340
    Top = 120
  end
  object qry_Enquadramentos: TQuery
    Tag = 1
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM VW_ENQUADRAMENTOS')
    Left = 592
    Top = 15
    object qry_EnquadramentosCD_ENQUAD_OP: TStringField
      FieldName = 'CD_ENQUAD_OP'
      Origin = 'DBBROKER.VW_ENQUADRAMENTOS.CD_ENQUAD_OP'
      FixedChar = True
      Size = 5
    end
    object qry_EnquadramentosNM_ENQUAD_OP: TStringField
      FieldName = 'NM_ENQUAD_OP'
      Origin = 'DBBROKER.VW_ENQUADRAMENTOS.NM_ENQUAD_OP'
      FixedChar = True
      Size = 60
    end
  end
  object ds_Enquadramentos: TDataSource
    DataSet = qry_Enquadramentos
    Left = 480
    Top = 16
  end
  object qry_EmpresaNac: TQuery
    Tag = 1
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA,'
      '       NM_EMPRESA,'
      '       AP_EMPRESA,'
      '       END_EMPRESA,'
      '       END_NUMERO,'
      '       END_CIDADE,'
      '       END_BAIRRO,'
      '       END_UF,'
      '       END_CEP,'
      '       CD_PAIS_IMPORTADOR,'
      '       CASE CD_EMPRESA'
      '           WHEN '#39'00000'#39' THEN '#39'99999999999999'#39
      '       ELSE CGC_EMPRESA'
      '       END AS CGC_EMPRESA,'
      '       CPF_EMPRESA,'
      '       IE_EMPRESA,'
      '       NM_HOMEPAGE,'
      '       NR_TELEFONE,'
      '       NR_FAX'
      'FROM TEMPRESA_NAC (NOLOCK)')
    Left = 592
    Top = 71
    object qry_EmpresaNacCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 5
    end
    object qry_EmpresaNacNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object qry_EmpresaNacAP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.AP_EMPRESA'
      FixedChar = True
      Size = 10
    end
    object qry_EmpresaNacEND_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.END_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_EmpresaNacEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Origin = 'DBBROKER.TEMPRESA_NAC.END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_EmpresaNacEND_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'DBBROKER.TEMPRESA_NAC.END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_EmpresaNacEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Origin = 'DBBROKER.TEMPRESA_NAC.END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_EmpresaNacEND_UF: TStringField
      FieldName = 'END_UF'
      Origin = 'DBBROKER.TEMPRESA_NAC.END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_EmpresaNacEND_CEP: TStringField
      FieldName = 'END_CEP'
      Origin = 'DBBROKER.TEMPRESA_NAC.END_CEP'
      FixedChar = True
      Size = 8
    end
    object qry_EmpresaNacCD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_PAIS_IMPORTADOR'
      FixedChar = True
      Size = 3
    end
    object qry_EmpresaNacCGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.CGC_EMPRESA'
      FixedChar = True
      Size = 14
    end
    object qry_EmpresaNacCPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.CPF_EMPRESA'
      FixedChar = True
      Size = 11
    end
    object qry_EmpresaNacIE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.IE_EMPRESA'
      FixedChar = True
    end
    object qry_EmpresaNacNM_HOMEPAGE: TStringField
      FieldName = 'NM_HOMEPAGE'
      Origin = 'DBBROKER.TEMPRESA_NAC.NM_HOMEPAGE'
      FixedChar = True
      Size = 200
    end
    object qry_EmpresaNacNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      Origin = 'DBBROKER.TEMPRESA_NAC.NR_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qry_EmpresaNacNR_FAX: TStringField
      FieldName = 'NR_FAX'
      Origin = 'DBBROKER.TEMPRESA_NAC.NR_FAX'
      FixedChar = True
      Size = 15
    end
  end
  object ds_EmpresaNac: TDataSource
    DataSet = qry_EmpresaNac
    Left = 480
    Top = 72
  end
  object qry_EmpresaEst: TQuery
    Tag = 1
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, END_EMPRESA, END_NUME' +
        'RO, END_CIDADE, END_ESTADO, CD_PAIS, NR_TELEFONE, NR_FAX, CGC_EM' +
        'PRESA'
      'FROM TEMPRESA_EST (NOLOCK)')
    Left = 592
    Top = 127
    object qry_EmpresaEstCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_EST.CD_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 5
    end
    object qry_EmpresaEstNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_EST.NM_EMPRESA'
      FixedChar = True
      Size = 60
    end
    object qry_EmpresaEstAP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_EST.AP_EMPRESA'
      FixedChar = True
      Size = 10
    end
    object qry_EmpresaEstEND_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_EST.END_EMPRESA'
      FixedChar = True
      Size = 60
    end
    object qry_EmpresaEstEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Origin = 'DBBROKER.TEMPRESA_EST.END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_EmpresaEstEND_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'DBBROKER.TEMPRESA_EST.END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_EmpresaEstEND_ESTADO: TStringField
      FieldName = 'END_ESTADO'
      Origin = 'DBBROKER.TEMPRESA_EST.END_ESTADO'
      FixedChar = True
      Size = 30
    end
    object qry_EmpresaEstCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TEMPRESA_EST.CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_EmpresaEstNR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      Origin = 'DBBROKER.TEMPRESA_EST.NR_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qry_EmpresaEstNR_FAX: TStringField
      FieldName = 'NR_FAX'
      Origin = 'DBBROKER.TEMPRESA_EST.NR_FAX'
      FixedChar = True
      Size = 15
    end
    object qry_EmpresaEstCGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_EST.CGC_EMPRESA'
      FixedChar = True
      Size = 14
    end
  end
  object ds_EmpresaEst: TDataSource
    DataSet = qry_EmpresaEst
    Left = 480
    Top = 128
  end
  object qry_Pais: TQuery
    Tag = 1
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_PAIS, NM_PAIS, NM_CONTINENTE'
      'FROM TPAIS_BROKER (NOLOCK)')
    Left = 592
    Top = 183
    object qry_PaisCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TPAIS_BROKER.CD_PAIS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object qry_PaisNM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object qry_PaisNM_CONTINENTE: TStringField
      FieldName = 'NM_CONTINENTE'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_CONTINENTE'
      FixedChar = True
    end
  end
  object ds_Pais: TDataSource
    DataSet = qry_Pais
    Left = 480
    Top = 184
  end
  object qry_RF: TQuery
    Tag = 1
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TURF (NOLOCK)')
    Left = 592
    Top = 239
    object qry_RFCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TURF.CODIGO'
      FixedChar = True
      Size = 7
    end
    object qry_RFDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TURF.DESCRICAO'
      FixedChar = True
      Size = 120
    end
    object qry_RFCD_DIGITO: TStringField
      FieldName = 'CD_DIGITO'
      Origin = 'DBBROKER.TURF.CD_DIGITO'
      FixedChar = True
      Size = 1
    end
    object qry_RFEND_UF: TStringField
      FieldName = 'END_UF'
      Origin = 'DBBROKER.TURF.END_UF'
      FixedChar = True
      Size = 2
    end
  end
  object ds_RF: TDataSource
    DataSet = qry_RF
    Left = 480
    Top = 240
  end
  object qry_InstNegc: TQuery
    Tag = 1
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_INST_NEGOC, NM_INST_NEGOC'
      'FROM TINST_NEGOC (NOLOCK)'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 592
    Top = 295
    object qry_InstNegcCD_INST_NEGOC: TStringField
      FieldName = 'CD_INST_NEGOC'
      Origin = 'DBBROKER.TINST_NEGOC.CD_INST_NEGOC'
      FixedChar = True
      Size = 5
    end
    object qry_InstNegcNM_INST_NEGOC: TStringField
      FieldName = 'NM_INST_NEGOC'
      Origin = 'DBBROKER.TINST_NEGOC.NM_INST_NEGOC'
      FixedChar = True
      Size = 60
    end
  end
  object ds_InstNegoc: TDataSource
    DataSet = qry_InstNegc
    Left = 480
    Top = 296
  end
  object qry_Incoterm: TQuery
    Tag = 1
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM TINCOTERMS_VENDA (NOLOCK)')
    Left = 592
    Top = 343
    object qry_IncotermCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TINCOTERMS_VENDA.CODIGO'
      FixedChar = True
      Size = 3
    end
    object qry_IncotermDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TINCOTERMS_VENDA.DESCRICAO'
      FixedChar = True
      Size = 60
    end
  end
  object ds_Incoterm: TDataSource
    DataSet = qry_Incoterm
    Left = 480
    Top = 344
  end
  object qry_ModPag: TQuery
    Tag = 1
    DatabaseName = 'DBBROKER'
    Filter = 'CD_MODALIDADE <> '#39'6'#39
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM VW_MODALIDADE_PAGAMENTO')
    Left = 592
    Top = 391
    object qry_ModPagCD_MODALIDADE: TStringField
      FieldName = 'CD_MODALIDADE'
      Origin = 'DBBROKER.VW_MODALIDADE_PAGAMENTO.CD_MODALIDADE'
      FixedChar = True
      Size = 1
    end
    object qry_ModPagNM_MODALIDADE: TStringField
      FieldName = 'NM_MODALIDADE'
      Origin = 'DBBROKER.VW_MODALIDADE_PAGAMENTO.NM_MODALIDADE'
      FixedChar = True
    end
  end
  object ds_ModPag: TDataSource
    DataSet = qry_ModPag
    Left = 480
    Top = 392
  end
  object qry_Moeda: TQuery
    Tag = 1
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_MOEDA, NM_MOEDA'
      'FROM TMOEDA_BROKER (NOLOCK)')
    Left = 784
    Top = 15
    object qry_MoedaCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TMOEDA_BROKER.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_MoedaNM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      Origin = 'DBBROKER.TMOEDA_BROKER.NM_MOEDA'
      FixedChar = True
      Size = 30
    end
  end
  object ds_Moeda: TDataSource
    DataSet = qry_Moeda
    Left = 704
    Top = 16
  end
  object qry_NALADI: TQuery
    Tag = 1
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TNALADISH (NOLOCK)')
    Left = 784
    Top = 127
    object qry_NALADICodigo: TStringField
      FieldName = 'Codigo'
      Origin = 'DBBROKER.TNALADISH.Codigo'
      FixedChar = True
      Size = 8
    end
    object qry_NALADIDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'DBBROKER.TNALADISH.Descricao'
      FixedChar = True
      Size = 120
    end
  end
  object ds_NALADI: TDataSource
    DataSet = qry_NALADI
    Left = 704
    Top = 128
  end
  object qry_RE_Anexo_Drawback: TQuery
    CachedUpdates = True
    AfterOpen = qry_RE_Anexo_DrawbackAfterOpen
    BeforeClose = qry_RE_Anexo_ItensBeforeClose
    AfterCancel = qry_RE_Anexo_DrawbackAfterOpen
    AfterDelete = qry_RE_Anexo_DrawbackAfterOpen
    AfterScroll = qry_RE_Anexo_DrawbackAfterScroll
    OnNewRecord = qry_RE_Anexo_FabricNewRecord
    DatabaseName = 'DBBROKER'
    DataSource = ds_RE_Anexo
    SQL.Strings = (
      'SELECT *'
      'FROM TRE_ANEXO_DRAWBACK (NOLOCK)'
      'WHERE NR_PROCESSO             = :NR_PROCESSO'
      '  AND NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO'
      '  AND CD_RE_ANEXO = :CD_RE_ANEXO')
    UpdateObject = upd_RE_Anexo_Drawback
    Left = 176
    Top = 239
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO_COMPLEMENTO'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CD_RE_ANEXO'
        ParamType = ptInput
        Size = 4
      end>
    object qry_RE_Anexo_DrawbackNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_RE_Anexo_DrawbackNR_PROCESSO_COMPLEMENTO: TStringField
      FieldName = 'NR_PROCESSO_COMPLEMENTO'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.NR_PROCESSO_COMPLEMENTO'
      FixedChar = True
      Size = 3
    end
    object qry_RE_Anexo_DrawbackCD_RE_ANEXO: TIntegerField
      FieldName = 'CD_RE_ANEXO'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.CD_RE_ANEXO'
    end
    object qry_RE_Anexo_DrawbackCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.CNPJ'
      EditMask = '00.000.000/0000-00;0;_'
      FixedChar = True
      Size = 14
    end
    object qry_RE_Anexo_DrawbackNCM: TStringField
      FieldName = 'NCM'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.NCM'
      FixedChar = True
      Size = 8
    end
    object qry_RE_Anexo_DrawbackNR_ATO_CONCESSORIO: TStringField
      FieldName = 'NR_ATO_CONCESSORIO'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.NR_ATO_CONCESSORIO'
      FixedChar = True
      Size = 11
    end
    object qry_RE_Anexo_DrawbackNR_ITEM_ATO_CONCESSORIO: TIntegerField
      FieldName = 'NR_ITEM_ATO_CONCESSORIO'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.NR_ITEM_ATO_CONCESSORIO'
    end
    object qry_RE_Anexo_DrawbackVL_MOEDA_RE_COM_COBERTURA: TFloatField
      FieldName = 'VL_MOEDA_RE_COM_COBERTURA'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.VL_MOEDA_RE_COM_COBERTURA'
      DisplayFormat = '0.,00'
      EditFormat = '0.,00'
    end
    object qry_RE_Anexo_DrawbackVL_MOEDA_RE_SEM_COBERTURA: TFloatField
      FieldName = 'VL_MOEDA_RE_SEM_COBERTURA'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.VL_MOEDA_RE_SEM_COBERTURA'
      DisplayFormat = '0.,00'
      EditFormat = '0.,00'
    end
    object qry_RE_Anexo_DrawbackVL_DOLAR_RE_COM_COBERTURA: TFloatField
      FieldName = 'VL_DOLAR_RE_COM_COBERTURA'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.VL_DOLAR_RE_COM_COBERTURA'
      DisplayFormat = '0.,00'
      EditFormat = '0.,00'
    end
    object qry_RE_Anexo_DrawbackVL_DOLAR_RE_SEM_COBERTURA: TFloatField
      FieldName = 'VL_DOLAR_RE_SEM_COBERTURA'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.VL_DOLAR_RE_SEM_COBERTURA'
      DisplayFormat = '0.,00'
      EditFormat = '0.,00'
    end
    object qry_RE_Anexo_DrawbackQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.QT_MERCADORIA'
      DisplayFormat = '0.,00000'
      EditFormat = '0.,00000'
    end
    object qry_RE_Anexo_DrawbackNR_NF: TIntegerField
      FieldName = 'NR_NF'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.NR_NF'
    end
    object qry_RE_Anexo_DrawbackDT_NF: TDateTimeField
      FieldName = 'DT_NF'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.DT_NF'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_RE_Anexo_DrawbackQTD_NF: TFloatField
      FieldName = 'QTD_NF'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.QTD_NF'
      DisplayFormat = '0.,00000'
      EditFormat = '0.,00000'
    end
    object qry_RE_Anexo_DrawbackVL_NF: TFloatField
      FieldName = 'VL_NF'
      Origin = 'DBBROKER.TRE_ANEXO_DRAWBACK.VL_NF'
      DisplayFormat = '0.,00'
      EditFormat = '0.,00'
    end
  end
  object ds_RE_Anexo_Drawback: TDataSource
    DataSet = qry_RE_Anexo_Drawback
    OnStateChange = ds_RE_CapaStateChange
    Left = 40
    Top = 240
  end
  object upd_RE_Anexo_Drawback: TUpdateSQL
    ModifySQL.Strings = (
      'update TRE_ANEXO_DRAWBACK'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO,'
      '  CD_RE_ANEXO = :CD_RE_ANEXO,'
      '  CNPJ = :CNPJ,'
      '  NCM = :NCM,'
      '  NR_ATO_CONCESSORIO = :NR_ATO_CONCESSORIO,'
      '  NR_ITEM_ATO_CONCESSORIO = :NR_ITEM_ATO_CONCESSORIO,'
      '  VL_MOEDA_RE_COM_COBERTURA = :VL_MOEDA_RE_COM_COBERTURA,'
      '  VL_MOEDA_RE_SEM_COBERTURA = :VL_MOEDA_RE_SEM_COBERTURA,'
      '  VL_DOLAR_RE_COM_COBERTURA = :VL_DOLAR_RE_COM_COBERTURA,'
      '  VL_DOLAR_RE_SEM_COBERTURA = :VL_DOLAR_RE_SEM_COBERTURA,'
      '  QT_MERCADORIA = :QT_MERCADORIA,'
      '  NR_NF = :NR_NF,'
      '  DT_NF = :DT_NF,'
      '  QTD_NF = :QTD_NF,'
      '  VL_NF = :VL_NF'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO and'
      '  CNPJ = :OLD_CNPJ and'
      '  NCM = :OLD_NCM')
    InsertSQL.Strings = (
      'insert into TRE_ANEXO_DRAWBACK'
      
        '  (NR_PROCESSO, NR_PROCESSO_COMPLEMENTO, CD_RE_ANEXO, CNPJ, NCM,' +
        ' NR_ATO_CONCESSORIO, '
      
        '   NR_ITEM_ATO_CONCESSORIO, VL_MOEDA_RE_COM_COBERTURA, VL_MOEDA_' +
        'RE_SEM_COBERTURA, '
      
        '   VL_DOLAR_RE_COM_COBERTURA, VL_DOLAR_RE_SEM_COBERTURA, QT_MERC' +
        'ADORIA, '
      '   NR_NF, DT_NF, QTD_NF, VL_NF)'
      'values'
      
        '  (:NR_PROCESSO, :NR_PROCESSO_COMPLEMENTO, :CD_RE_ANEXO, :CNPJ, ' +
        ':NCM, :NR_ATO_CONCESSORIO, '
      
        '   :NR_ITEM_ATO_CONCESSORIO, :VL_MOEDA_RE_COM_COBERTURA, :VL_MOE' +
        'DA_RE_SEM_COBERTURA, '
      
        '   :VL_DOLAR_RE_COM_COBERTURA, :VL_DOLAR_RE_SEM_COBERTURA, :QT_M' +
        'ERCADORIA, '
      '   :NR_NF, :DT_NF, :QTD_NF, :VL_NF)')
    DeleteSQL.Strings = (
      'DELETE TRE_ANEXO_DRAWBACK'
      'WHERE'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO and'
      '  CNPJ = :OLD_CNPJ and'
      '  NCM = :OLD_NCM')
    Left = 339
    Top = 230
  end
  object qry_UnidadeMedida: TQuery
    Tag = 1
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_UNID_MEDIDA, NM_UNID_MEDIDA, NM_SIGLA'
      'FROM TUNID_MEDIDA_BROKER (NOLOCK)')
    Left = 784
    Top = 175
    object qry_UnidadeMedidaCD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'DBBROKER.TUNID_MEDIDA_BROKER.CD_UNID_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qry_UnidadeMedidaNM_UNID_MEDIDA: TStringField
      FieldName = 'NM_UNID_MEDIDA'
      Origin = 'DBBROKER.TUNID_MEDIDA_BROKER.NM_UNID_MEDIDA'
      FixedChar = True
      Size = 50
    end
    object qry_UnidadeMedidaNM_SIGLA: TStringField
      FieldName = 'NM_SIGLA'
      Origin = 'DBBROKER.TUNID_MEDIDA_BROKER.NM_SIGLA'
      FixedChar = True
      Size = 3
    end
  end
  object ds_UnidadeMedida: TDataSource
    DataSet = qry_UnidadeMedida
    Left = 704
    Top = 176
  end
  object qry_NCM: TQuery
    Tag = 1
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO, UNIDADE_MEDIDA'
      'FROM TNCM (NOLOCK)')
    Left = 784
    Top = 71
    object qry_NCMCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TNCM.CODIGO'
      FixedChar = True
      Size = 8
    end
    object qry_NCMDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TNCM.DESCRICAO'
      FixedChar = True
      Size = 120
    end
    object qry_NCMUNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      Origin = 'DBBROKER.TNCM.UNIDADE_MEDIDA'
      FixedChar = True
      Size = 4
    end
  end
  object ds_NCM: TDataSource
    DataSet = qry_NCM
    Left = 704
    Top = 72
  end
  object qry_RE_Anexo_CCPTC: TQuery
    CachedUpdates = True
    BeforeClose = qry_RE_Anexo_ItensBeforeClose
    OnNewRecord = qry_RE_Anexo_FabricNewRecord
    DatabaseName = 'DBBROKER'
    DataSource = ds_RE_Anexo
    SQL.Strings = (
      'SELECT *'
      'FROM TRE_ANEXO_INSUMO_CCPTC (NOLOCK)'
      'WHERE NR_PROCESSO             = :NR_PROCESSO'
      '  AND NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO'
      '  AND CD_RE_ANEXO = :CD_RE_ANEXO')
    UpdateObject = upd_RE_Anexo_CCPTC
    Left = 176
    Top = 295
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO_COMPLEMENTO'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CD_RE_ANEXO'
        ParamType = ptInput
      end>
    object qry_RE_Anexo_CCPTCNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TRE_ANEXO_INSUMO_CCPTC.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_RE_Anexo_CCPTCNR_PROCESSO_COMPLEMENTO: TStringField
      FieldName = 'NR_PROCESSO_COMPLEMENTO'
      Origin = 'DBBROKER.TRE_ANEXO_INSUMO_CCPTC.NR_PROCESSO_COMPLEMENTO'
      FixedChar = True
      Size = 3
    end
    object qry_RE_Anexo_CCPTCCD_RE_ANEXO: TIntegerField
      FieldName = 'CD_RE_ANEXO'
      Origin = 'DBBROKER.TRE_ANEXO_INSUMO_CCPTC.CD_RE_ANEXO'
    end
    object qry_RE_Anexo_CCPTCNM_CERTIFICADO: TStringField
      FieldName = 'NM_CERTIFICADO'
      Origin = 'DBBROKER.TRE_ANEXO_INSUMO_CCPTC.NM_CERTIFICADO'
      FixedChar = True
      Size = 24
    end
    object qry_RE_Anexo_CCPTCQTD_ESTATISTICA: TFloatField
      FieldName = 'QTD_ESTATISTICA'
      Origin = 'DBBROKER.TRE_ANEXO_INSUMO_CCPTC.QTD_ESTATISTICA'
    end
  end
  object ds_RE_Anexo_CCPTC: TDataSource
    DataSet = qry_RE_Anexo_CCPTC
    OnStateChange = ds_RE_CapaStateChange
    Left = 40
    Top = 296
  end
  object upd_RE_Anexo_CCPTC: TUpdateSQL
    ModifySQL.Strings = (
      'update TRE_ANEXO_INSUMO_CCPTC'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO,'
      '  CD_RE_ANEXO = :CD_RE_ANEXO,'
      '  NM_CERTIFICADO = :NM_CERTIFICADO,'
      '  QTD_ESTATISTICA = :QTD_ESTATISTICA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO and'
      '  NM_CERTIFICADO = :OLD_NM_CERTIFICADO')
    InsertSQL.Strings = (
      'insert into TRE_ANEXO_INSUMO_CCPTC'
      
        '  (NR_PROCESSO, NR_PROCESSO_COMPLEMENTO, CD_RE_ANEXO, NM_CERTIFI' +
        'CADO, QTD_ESTATISTICA)'
      'values'
      
        '  (:NR_PROCESSO, :NR_PROCESSO_COMPLEMENTO, :CD_RE_ANEXO, :NM_CER' +
        'TIFICADO, '
      '   :QTD_ESTATISTICA)')
    DeleteSQL.Strings = (
      'DELETE TRE_ANEXO_INSUMO_CCPTC'
      'WHERE'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_PROCESSO_COMPLEMENTO = :OLD_NR_PROCESSO_COMPLEMENTO and'
      '  CD_RE_ANEXO = :OLD_CD_RE_ANEXO and'
      '  NM_CERTIFICADO = :OLD_NM_CERTIFICADO')
    Left = 339
    Top = 286
  end
  object qry_FormaPag: TQuery
    Tag = 1
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM VW_FORMA_PAGAMENTO')
    Left = 592
    Top = 447
    object qry_FormaPagCD_FORMA_PAGAMENTO: TStringField
      FieldName = 'CD_FORMA_PAGAMENTO'
      Origin = 'DBBROKER.VW_FORMA_PAGAMENTO.CD_FORMA_PAGAMENTO'
      FixedChar = True
      Size = 1
    end
    object qry_FormaPagNM_FORMA_PAGAMENTO: TStringField
      FieldName = 'NM_FORMA_PAGAMENTO'
      Origin = 'DBBROKER.VW_FORMA_PAGAMENTO.NM_FORMA_PAGAMENTO'
      FixedChar = True
      Size = 13
    end
  end
  object ds_FormaPag: TDataSource
    DataSet = qry_FormaPag
    Left = 480
    Top = 448
  end
  object SP_RE_CLASSIFICA_ANEXO_NOVOEX: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.SP_RE_CLASSIFICA_ANEXO_NOVOEX'
    Left = 120
    Top = 472
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO_COMPLEMENTO'
        ParamType = ptInput
      end>
  end
  object qry_UF: TQuery
    Tag = 1
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_UF, NM_UF'
      'FROM TUF (NOLOCK)')
    Left = 784
    Top = 231
    object qry_UFCD_UF: TStringField
      FieldName = 'CD_UF'
      Origin = 'DBBROKER.TUF.CD_UF'
      FixedChar = True
      Size = 2
    end
    object qry_UFNM_UF: TStringField
      FieldName = 'NM_UF'
      Origin = 'DBBROKER.TUF.NM_UF'
      FixedChar = True
      Size = 30
    end
  end
  object ds_UF: TDataSource
    DataSet = qry_UF
    Left = 704
    Top = 232
  end
  object SP_GERA_ID_ARQUIVO_RE_NOVOEX: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.SP_GERA_ID_ARQUIVO_RE_NOVOEX'
    Left = 120
    Top = 528
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO_COMPLEMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@ID_ARQUIVO'
        ParamType = ptOutput
      end>
  end
  object qry_Totais: TQuery
    CachedUpdates = True
    AfterOpen = qry_TotaisAfterOpen
    DatabaseName = 'DBBROKER'
    DataSource = ds_RE_Capa
    SQL.Strings = (
      
        'SELECT ISNULL(C.VL_VALOR_COBER_CAMBIAL, 0) + ISNULL(C.VL_SEM_COB' +
        '_CAMBIAL, 0) AS VL_TOTAL_CAPA,'
      
        '       (ISNULL(C.VL_VALOR_COBER_CAMBIAL, 0) + ISNULL(C.VL_SEM_CO' +
        'B_CAMBIAL, 0)) - SUM(A.VL_COND_VENDA) AS VL_SALDO_CAPA,'
      '       ISNULL(SUM(A.VL_COND_VENDA), 0) AS VL_MCV_TOTAL_ADICOES,'
      '       ISNULL(SUM(A.VL_LOCAL_VENDA), 0) AS VL_MLE_TOTAL_ADICOES,'
      '       SUM(A.PESO_LIQUIDO) AS PL_TOTAL_ADICOES,'
      '       SUM(A.QT_UNIDADE_COMERCIAL) AS QT_COMERCIAL_ADICOES,'
      '       SUM(A.QT_MEDIA_NBM) AS QT_ESTATISTICA_ADICOES,'
      '       ISNULL(MAX(A.CD_RE_ANEXO), 0) AS QTD_ANEXOS,'
      '       (SELECT COUNT(*)'
      '        FROM TRE_ANEXO_PURO I (NOLOCK)'
      '        WHERE I.NR_PROCESSO             = C.NR_PROCESSO'
      
        '          AND I.NR_PROCESSO_COMPLEMENTO = C.NR_PROCESSO_COMPLEME' +
        'NTO) AS QTD_ITENS,'
      '       ISNULL((SELECT SUM(ISNULL(F.VL_TOTAL, 0))'
      '               FROM TRE_ANEXO_FABRIC F (NOLOCK)'
      '               WHERE F.NR_PROCESSO             = C.NR_PROCESSO'
      
        '                 AND F.NR_PROCESSO_COMPLEMENTO = C.NR_PROCESSO_C' +
        'OMPLEMENTO), 0) AS VL_TOTAL_FABRICANTES,'
      '       ISNULL((SELECT SUM(ISNULL(F.PL_TOTAL, 0))'
      '               FROM TRE_ANEXO_FABRIC F (NOLOCK)'
      '               WHERE F.NR_PROCESSO             = C.NR_PROCESSO'
      
        '                 AND F.NR_PROCESSO_COMPLEMENTO = C.NR_PROCESSO_C' +
        'OMPLEMENTO), 0) AS PL_TOTAL_FABRICANTES,'
      
        '       ISNULL((SELECT SUM(ISNULL(D.VL_MOEDA_RE_COM_COBERTURA, 0)' +
        ' + ISNULL(D.VL_MOEDA_RE_SEM_COBERTURA, 0))'
      '               FROM TRE_ANEXO_DRAWBACK D (NOLOCK)'
      '               WHERE D.NR_PROCESSO             = C.NR_PROCESSO'
      
        '                 AND D.NR_PROCESSO_COMPLEMENTO = C.NR_PROCESSO_C' +
        'OMPLEMENTO), 0) AS VL_TOTAL_DRAWBACKS,'
      
        '       ISNULL((SELECT SUM(ISNULL(D.VL_MOEDA_RE_COM_COBERTURA, 0)' +
        ')'
      '               FROM TRE_ANEXO_DRAWBACK D (NOLOCK)'
      '               WHERE D.NR_PROCESSO             = C.NR_PROCESSO'
      
        '                 AND D.NR_PROCESSO_COMPLEMENTO = C.NR_PROCESSO_C' +
        'OMPLEMENTO), 0) AS VL_TOTAL_DRAWBACK_COM_COB,'
      
        '       ISNULL((SELECT SUM(ISNULL(D.VL_MOEDA_RE_SEM_COBERTURA, 0)' +
        ')'
      '               FROM TRE_ANEXO_DRAWBACK D (NOLOCK)'
      '               WHERE D.NR_PROCESSO             = C.NR_PROCESSO'
      
        '                 AND D.NR_PROCESSO_COMPLEMENTO = C.NR_PROCESSO_C' +
        'OMPLEMENTO), 0) AS VL_TOTAL_DRAWBACK_SEM_COB'
      'FROM TRE_CAPA          C (NOLOCK)'
      
        '   LEFT JOIN TRE_ANEXO A (NOLOCK) ON A.NR_PROCESSO             =' +
        ' C.NR_PROCESSO'
      
        '                                 AND A.NR_PROCESSO_COMPLEMENTO =' +
        ' C.NR_PROCESSO_COMPLEMENTO'
      'WHERE C.NR_PROCESSO = :NR_PROCESSO'
      '  AND C.NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO'
      
        'GROUP BY C.NR_PROCESSO, C.NR_PROCESSO_COMPLEMENTO, ISNULL(C.VL_V' +
        'ALOR_COBER_CAMBIAL, 0) + ISNULL(C.VL_SEM_COB_CAMBIAL, 0)')
    UpdateObject = upd_Totais
    Left = 160
    Top = 384
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO_COMPLEMENTO'
        ParamType = ptInput
        Size = 4
      end>
    object qry_TotaisVL_TOTAL_CAPA: TFloatField
      FieldName = 'VL_TOTAL_CAPA'
      DisplayFormat = '#0.00 '
    end
    object qry_TotaisVL_SALDO_CAPA: TFloatField
      FieldName = 'VL_SALDO_CAPA'
      DisplayFormat = '#0.00 '
    end
    object qry_TotaisVL_MCV_TOTAL_ADICOES: TFloatField
      FieldName = 'VL_MCV_TOTAL_ADICOES'
      DisplayFormat = '#0.00 '
    end
    object qry_TotaisVL_MLE_TOTAL_ADICOES: TFloatField
      FieldName = 'VL_MLE_TOTAL_ADICOES'
      DisplayFormat = '#0.00 '
    end
    object qry_TotaisPL_TOTAL_ADICOES: TFloatField
      FieldName = 'PL_TOTAL_ADICOES'
      DisplayFormat = '#0.00000 '
    end
    object qry_TotaisQT_COMERCIAL_ADICOES: TFloatField
      FieldName = 'QT_COMERCIAL_ADICOES'
      DisplayFormat = '#0.00000 '
    end
    object qry_TotaisQT_ESTATISTICA_ADICOES: TFloatField
      FieldName = 'QT_ESTATISTICA_ADICOES'
      DisplayFormat = '#0.00000 '
    end
    object qry_TotaisQTD_ANEXOS: TIntegerField
      FieldName = 'QTD_ANEXOS'
      DisplayFormat = '0 '
    end
    object qry_TotaisQTD_ITENS: TIntegerField
      FieldName = 'QTD_ITENS'
      DisplayFormat = '0 '
    end
    object qry_TotaisVL_TOTAL_FABRICANTES: TFloatField
      FieldName = 'VL_TOTAL_FABRICANTES'
      DisplayFormat = '#0.00 '
    end
    object qry_TotaisPL_TOTAL_FABRICANTES: TFloatField
      FieldName = 'PL_TOTAL_FABRICANTES'
      DisplayFormat = '#0.00000 '
    end
    object qry_TotaiscalcVL_TOTAL_FABRICANTE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcVL_TOTAL_FABRICANTE'
      DisplayFormat = '#0.00 '
      Calculated = True
    end
    object qry_TotaiscalcPL_TOTAL_FABRICANTE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcPL_TOTAL_FABRICANTE'
      DisplayFormat = '#0.00000 '
      Calculated = True
    end
    object qry_TotaiscalcQT_TOTAL_FABRICANTE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcQT_TOTAL_FABRICANTE'
      DisplayFormat = '#0.00000 '
      Calculated = True
    end
    object qry_TotaiscalcVL_SALDO_FABRICANTE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcVL_SALDO_FABRICANTE'
      DisplayFormat = '#0.00 '
      Calculated = True
    end
    object qry_TotaiscalcPL_SALDO_FABRICANTE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcPL_SALDO_FABRICANTE'
      DisplayFormat = '#0.00000 '
      Calculated = True
    end
    object qry_TotaiscalcQT_SALDO_FABRICANTE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcQT_SALDO_FABRICANTE'
      DisplayFormat = '#0.00000 '
      Calculated = True
    end
    object qry_TotaiscalcVL_SALDO_TOTAL_FABRICANTES: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcVL_SALDO_TOTAL_FABRICANTES'
      DisplayFormat = '#0.00 '
      Calculated = True
    end
    object qry_TotaiscalcPL_SALDO_TOTAL_FABRICANTES: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcPL_SALDO_TOTAL_FABRICANTES'
      DisplayFormat = '#0.00000 '
      Calculated = True
    end
    object qry_TotaisVL_TOTAL_DRAWBACKS: TFloatField
      FieldName = 'VL_TOTAL_DRAWBACKS'
      DisplayFormat = '#0.00 '
    end
    object qry_TotaisVL_TOTAL_DRAWBACK_COM_COB: TFloatField
      FieldName = 'VL_TOTAL_DRAWBACK_COM_COB'
    end
    object qry_TotaisVL_TOTAL_DRAWBACK_SEM_COB: TFloatField
      FieldName = 'VL_TOTAL_DRAWBACK_SEM_COB'
    end
    object qry_TotaiscalcVL_TOTAL_DRAWBACK_COM_COB: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcVL_TOTAL_DRAWBACK_COM_COB'
      DisplayFormat = '#0.00 '
      Calculated = True
    end
    object qry_TotaiscalcVL_TOTAL_DRAWBACK_SEM_COB: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcVL_TOTAL_DRAWBACK_SEM_COB'
      DisplayFormat = '#0.00 '
      Calculated = True
    end
    object qry_TotaiscalcQT_TOTAL_DRAWBACK: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcQT_TOTAL_DRAWBACK'
      DisplayFormat = '#0.00000 '
      Calculated = True
    end
    object qry_TotaiscalcVL_SALDO_DRAWBACK_COM_COB: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcVL_SALDO_DRAWBACK_COM_COB'
      DisplayFormat = '#0.00 '
      Calculated = True
    end
    object qry_TotaiscalcVL_SALDO_DRAWBACK_SEM_COB: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcVL_SALDO_DRAWBACK_SEM_COB'
      DisplayFormat = '#0.00 '
      Calculated = True
    end
    object qry_TotaiscalcQT_SALDO_DRAWBACK: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcQT_SALDO_DRAWBACK'
      DisplayFormat = '#0.00000 '
      Calculated = True
    end
    object qry_TotaiscalcVL_SALDO_TOTAL_DRAWBACKS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcVL_SALDO_TOTAL_DRAWBACKS'
      DisplayFormat = '#0.00 '
      Calculated = True
    end
  end
  object ds_Totais: TDataSource
    DataSet = qry_Totais
    Left = 88
    Top = 384
  end
  object upd_Totais: TUpdateSQL
    Left = 235
    Top = 382
  end
  object qry_Diagnostico: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_RE_Capa
    SQL.Strings = (
      
        'SELECT CONVERT(VARCHAR, CD_RE_ANEXO) + CHAR(9) + CASE CONVERT(VA' +
        'RCHAR(10), TX_REGISTRO_NOVOEX)'
      
        '                                                     WHEN '#39'OK'#39' T' +
        'HEN '#39' Registrado com n'#250'mero '#39' + NR_RE'
      
        '                                                 ELSE CONVERT(VA' +
        'RCHAR(500), TX_REGISTRO_NOVOEX)'
      '                                                 END AS TX_RE'
      'FROM TRE_ANEXO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND NR_PROCESSO_COMPLEMENTO = :NR_PROCESSO_COMPLEMENTO')
    Left = 328
    Top = 376
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO_COMPLEMENTO'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_DiagnosticoTX_RE: TStringField
      FieldName = 'TX_RE'
      FixedChar = True
      Size = 255
    end
  end
end

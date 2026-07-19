object datm_grupo: Tdatm_grupo
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 450
  Top = 234
  Height = 664
  Width = 766
  object ds_grupo_: TDataSource
    DataSet = qry_grupo_
    Left = 22
    Top = 12
  end
  object qry_grupo_: TQuery
    CachedUpdates = True
    AfterPost = qry_grupo_AfterPost
    AfterDelete = qry_grupo_AfterPost
    OnNewRecord = qry_grupo_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT A.IN_ENVIA_COMO_TI,'
      '       A.CD_GRUPO, '
      '       A.NM_GRUPO, '
      '       A.DT_INCLUSAO, '
      '       A.IN_ATIVO, '
      '       A.CNPJ_GRUPO, '
      '       A.IN_RATEIO, '
      '       A.CD_LAYOUT_BORDERO,'
      '       B.NM_LAYOUT,'
      '       A.IN_OBRIGAR_INVOICE, '
      '       A.IN_MARINHA_MERCANTE_ICMS, '
      '       A.IN_CONFERE_REFERENCIA, '
      '       A.IN_EXIBE_PEDIDO_SITE, '
      '       A.NR_REL_FAT_CONSOLIDADO,'
      '       A.TP_PEDIDO_BUSCA, '
      '       A.TP_PEDIDO_BUSCA_IMP, '
      '       ISNULL(A.IN_EMAIL_CRIACAO,'#39'0'#39') IN_EMAIL_CRIACAO,  '
      '       A.EMAIL_CRIACAO, '
      '       A.EMAIL_AVARIAS,'
      '       ISNULL(A.IN_EMAIL_AUTORIZACAO,'#39'0'#39') IN_EMAIL_AUTORIZACAO, '
      '       A.EMAIL_AUTORIZACAO, '
      
        '       ISNULL(A.IN_EMAIL_PRE_AUTORIZACAO,'#39'0'#39') IN_EMAIL_PRE_AUTOR' +
        'IZACAO,'
      '       A.EMAIL_PRE_AUTORIZACAO, '
      
        '       ISNULL(A.IN_INTEGRA_FORNECIMENTO,'#39'0'#39') IN_INTEGRA_FORNECIM' +
        'ENTO, '
      
        '       ISNULL(A.IN_INTEGRA_PACKING_LIST,'#39'0'#39') IN_INTEGRA_PACKING_' +
        'LIST,'
      '       ISNULL(A.IN_MODO_SIMPLES,'#39'0'#39') IN_MODO_SIMPLES, '
      '       ISNULL(A.IN_RAP_SEQUENCIAL,'#39'0'#39') IN_RAP_SEQUENCIAL,'
      '       ISNULL(A.IN_ENVIA_ARQUIVOS,'#39'0'#39') IN_ENVIA_ARQUIVOS,'
      '       ISNULL(A.IN_MOSTRA_FATURADOS,'#39'0'#39') IN_MOSTRA_FATURADOS, '
      '       ISNULL(A.IN_DIVIDE_EMBARCADOS,'#39'0'#39') IN_DIVIDE_EMBARCADOS, '
      '       ISNULL(A.IN_MOSTRA_FOLLOWUP,'#39'0'#39') IN_MOSTRA_FOLLOWUP,'
      '       ISNULL(A.IN_CONFERENCIA,'#39'0'#39') IN_CONFERENCIA, '
      '       A.IN_ALERTA_E01_NAO_GENERICO, '
      '       A.IN_PREENCHE_EVENTO_387_COM_021, '
      '       A.IN_RATEIA_PEDIDO, '
      '       A.NM_EMAIL_CONTATO_DAILY, '
      '       ISNULL(A.IN_DESBLOQUEIA_DRAFT,'#39'0'#39') IN_DESBLOQUEIA_DRAFT, '
      '       A.TX_LUCRO_ESTIMADO, '
      '       A.DT_NOVO_FOLLOWUP_IMP, '
      '       A.DT_NOVO_FOLLOWUP_EXP, '
      '       A.NM_EMAIL_CONTATO_FOLLOWUP, '
      '       ISNULL(A.IN_PENDENCIAS,'#39'0'#39') IN_PENDENCIAS,'
      '       ISNULL(A.IN_PENDENCIAS_EMAIL,'#39'0'#39') IN_PENDENCIAS_EMAIL,'
      '       A.CD_CC_CONTAS_RECEBER_REDUZIDA,'
      
        '       A.CD_CC_DESPACHOS_ANDAMENTO_REDUZIDA AS ANDAMENTO_REDUZID' +
        'A,'
      '       A.CD_CC_DESPACHOS_FATURAR_REDUZIDA AS FATURAR_REDUZIDA,'
      
        '       ISNULL(A.IN_EXTRATO_AVERBADO_RESUMIDO, 0) IN_EXTRATO_AVER' +
        'BADO_RESUMIDO, '
      '       A.IN_EXIGE_CFOP_EXP,  '
      '       A.IN_PLANILHA_CUSTOS, '
      '       A.NM_EMAIL_CONSULTA_MERCANTE,'
      
        '       ISNULL(A.IC_CONSULTA_MERCANTE_TERCEIROS,0) AS IC_CONSULTA' +
        '_MERCANTE_TERCEIROS,'
      '       NM_EMAIL_CONSULTA_LI,'
      '       NM_EMAIL_CONSULTA_LI_STATUS,'
      '       NM_EMAIL_DRAFT_BL,'
      '      CD_TIPO_BASE_SEGURO_DI,'
      '      PC_SEGURO_MLE_DI,'
      '      CD_COORDENADOR_IMPO,'
      '      CD_COORDENADOR_EXPO ,'
      '      IN_STATUS_LI_INCLUIR_CONTATO,'
      '      ISNULL(A.IN_DI_EXTERNA,'#39'0'#39') AS IN_DI_EXTERNA,'
      
        '      ISNULL(A.IN_PREENCHE_COMPLEMENTAR_AD,'#39'0'#39') AS IN_PREENCHE_C' +
        'OMPLEMENTAR_AD,'
      '      CD_GESTOR_CONTAS,'
      '      IN_CONTRATO,'
      '   DT_VIGENCIA_CONTRATO,'
      '   NM_INDICE_REAJUSTE_ACORDADO,'
      '       VL_INDICE_REAJUSTE_ACORDADO'
      ''
      'FROM TGRUPO A (NOLOCK)'
      
        'LEFT JOIN TTP_BORDERO B (NOLOCK) ON CD_LAYOUT_BORDERO = B.CD_LAY' +
        'OUT'
      'WHERE ( IN_ATIVO='#39'1'#39'  OR ( :IN_ATIVO IS NOT NULL )   )'
      'ORDER BY @orderby@')
    UpdateObject = UpdGrupo
    Left = 86
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'IN_ATIVO'
        ParamType = ptInput
      end>
    object qry_grupo_CD_GRUPO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_GRUPO'
      Origin = 'TGRUPO.CD_GRUPO'
      Size = 3
    end
    object qry_grupo_NM_GRUPO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_GRUPO'
      Origin = 'TGRUPO.NM_GRUPO'
      Size = 50
    end
    object qry_grupo_DT_INCLUSAO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_INCLUSAO'
      Origin = 'TGRUPO.DT_INCLUSAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qry_grupo_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TGRUPO.IN_ATIVO'
      Size = 1
    end
    object qry_grupo_LookAtivo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'LookAtivo'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_grupo_CNPJ_GRUPO: TStringField
      FieldName = 'CNPJ_GRUPO'
      Origin = 'TGRUPO.CD_GRUPO'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object qry_grupo_IN_RATEIO: TStringField
      FieldName = 'IN_RATEIO'
      Origin = 'DBBROKER.TGRUPO.IN_RATEIO'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_CD_LAYOUT_BORDERO: TIntegerField
      FieldName = 'CD_LAYOUT_BORDERO'
    end
    object qry_grupo_NM_LAYOUT: TStringField
      FieldName = 'NM_LAYOUT'
      FixedChar = True
      Size = 30
    end
    object qry_grupo_IN_OBRIGAR_INVOICE: TStringField
      FieldName = 'IN_OBRIGAR_INVOICE'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_MARINHA_MERCANTE_ICMS: TStringField
      FieldName = 'IN_MARINHA_MERCANTE_ICMS'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_CONFERE_REFERENCIA: TStringField
      FieldName = 'IN_CONFERE_REFERENCIA'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_EXIBE_PEDIDO_SITE: TStringField
      FieldName = 'IN_EXIBE_PEDIDO_SITE'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_NR_REL_FAT_CONSOLIDADO: TStringField
      Alignment = taRightJustify
      FieldName = 'NR_REL_FAT_CONSOLIDADO'
      FixedChar = True
      Size = 5
    end
    object qry_grupo_TP_PEDIDO_BUSCA: TStringField
      FieldName = 'TP_PEDIDO_BUSCA'
      FixedChar = True
      Size = 2
    end
    object qry_grupo_IN_EMAIL_CRIACAO: TStringField
      FieldName = 'IN_EMAIL_CRIACAO'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_EMAIL_CRIACAO: TStringField
      FieldName = 'EMAIL_CRIACAO'
      FixedChar = True
      Size = 100
    end
    object qry_grupo_IN_EMAIL_AUTORIZACAO: TStringField
      FieldName = 'IN_EMAIL_AUTORIZACAO'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_EMAIL_AUTORIZACAO: TStringField
      FieldName = 'EMAIL_AUTORIZACAO'
      FixedChar = True
      Size = 100
    end
    object qry_grupo_IN_EMAIL_PRE_AUTORIZACAO: TStringField
      FieldName = 'IN_EMAIL_PRE_AUTORIZACAO'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_EMAIL_PRE_AUTORIZACAO: TStringField
      FieldName = 'EMAIL_PRE_AUTORIZACAO'
      FixedChar = True
      Size = 100
    end
    object qry_grupo_IN_INTEGRA_FORNECIMENTO: TStringField
      FieldName = 'IN_INTEGRA_FORNECIMENTO'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_INTEGRA_PACKING_LIST: TStringField
      FieldName = 'IN_INTEGRA_PACKING_LIST'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_MODO_SIMPLES: TStringField
      FieldName = 'IN_MODO_SIMPLES'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_RAP_SEQUENCIAL: TStringField
      FieldName = 'IN_RAP_SEQUENCIAL'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_ENVIA_ARQUIVOS: TStringField
      FieldName = 'IN_ENVIA_ARQUIVOS'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_MOSTRA_FATURADOS: TStringField
      FieldName = 'IN_MOSTRA_FATURADOS'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_DIVIDE_EMBARCADOS: TStringField
      FieldName = 'IN_DIVIDE_EMBARCADOS'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_MOSTRA_FOLLOWUP: TStringField
      FieldName = 'IN_MOSTRA_FOLLOWUP'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_CONFERENCIA: TStringField
      FieldName = 'IN_CONFERENCIA'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_ALERTA_E01_NAO_GENERICO: TStringField
      FieldName = 'IN_ALERTA_E01_NAO_GENERICO'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_PREENCHE_EVENTO_387_COM_021: TStringField
      FieldName = 'IN_PREENCHE_EVENTO_387_COM_021'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_RATEIA_PEDIDO: TStringField
      FieldName = 'IN_RATEIA_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_ENVIA_COMO_TI: TStringField
      FieldName = 'IN_ENVIA_COMO_TI'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_NM_EMAIL_CONTATO_DAILY: TStringField
      FieldName = 'NM_EMAIL_CONTATO_DAILY'
      FixedChar = True
      Size = 200
    end
    object qry_grupo_IN_DESBLOQUEIA_DRAFT: TStringField
      FieldName = 'IN_DESBLOQUEIA_DRAFT'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_TP_PEDIDO_BUSCA_IMP: TStringField
      FieldName = 'TP_PEDIDO_BUSCA_IMP'
      FixedChar = True
      Size = 2
    end
    object qry_grupo_TX_LUCRO_ESTIMADO: TFloatField
      FieldName = 'TX_LUCRO_ESTIMADO'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object qry_grupo_DT_NOVO_FOLLOWUP_IMP: TDateTimeField
      FieldName = 'DT_NOVO_FOLLOWUP_IMP'
    end
    object qry_grupo_DT_NOVO_FOLLOWUP_EXP: TDateTimeField
      FieldName = 'DT_NOVO_FOLLOWUP_EXP'
    end
    object qry_grupo_NM_EMAIL_CONTATO_FOLLOWUP: TStringField
      FieldName = 'NM_EMAIL_CONTATO_FOLLOWUP'
      FixedChar = True
      Size = 200
    end
    object qry_grupo_IN_PENDENCIAS: TStringField
      FieldName = 'IN_PENDENCIAS'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_EXTRATO_AVERBADO_RESUMIDO: TBooleanField
      FieldName = 'IN_EXTRATO_AVERBADO_RESUMIDO'
    end
    object qry_grupo_CD_CC_CONTAS_RECEBER_REDUZIDA: TStringField
      FieldName = 'CD_CC_CONTAS_RECEBER_REDUZIDA'
      FixedChar = True
      Size = 7
    end
    object qry_grupo_ANDAMENTO_REDUZIDA: TStringField
      FieldName = 'ANDAMENTO_REDUZIDA'
      FixedChar = True
      Size = 7
    end
    object qry_grupo_FATURAR_REDUZIDA: TStringField
      FieldName = 'FATURAR_REDUZIDA'
      FixedChar = True
      Size = 7
    end
    object qry_grupo_IN_EXIGE_CFOP_EXP: TStringField
      FieldName = 'IN_EXIGE_CFOP_EXP'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_IN_PLANILHA_CUSTOS: TStringField
      FieldName = 'IN_PLANILHA_CUSTOS'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_EMAIL_AVARIAS: TStringField
      DisplayLabel = 'Email de Avarias'
      DisplayWidth = 30
      FieldName = 'EMAIL_AVARIAS'
      Size = 100
    end
    object qry_grupo_NM_EMAIL_CONSULTA_MERCANTE: TStringField
      FieldName = 'NM_EMAIL_CONSULTA_MERCANTE'
      Size = 200
    end
    object qry_grupo_IC_CONSULTA_MERCANTE_TERCEIROS: TBooleanField
      FieldName = 'IC_CONSULTA_MERCANTE_TERCEIROS'
    end
    object qry_grupo_NM_EMAIL_CONSULTA_LI: TStringField
      DisplayWidth = 500
      FieldName = 'NM_EMAIL_CONSULTA_LI'
      Size = 500
    end
    object qry_grupo_NM_EMAIL_CONSULTA_LI_STATUS: TMemoField
      FieldName = 'NM_EMAIL_CONSULTA_LI_STATUS'
      BlobType = ftMemo
      Size = 500
    end
    object qry_grupo_CD_TIPO_BASE_SEGURO_DI: TStringField
      FieldName = 'CD_TIPO_BASE_SEGURO_DI'
      Size = 1
    end
    object qry_grupo_PC_SEGURO_MLE_DI: TFloatField
      FieldName = 'PC_SEGURO_MLE_DI'
    end
    object qry_grupo_CD_COORDENADOR_IMPO: TStringField
      FieldName = 'CD_COORDENADOR_IMPO'
      Size = 4
    end
    object qry_grupo_CD_COORDENADOR_EXPO: TStringField
      FieldName = 'CD_COORDENADOR_EXPO'
      Size = 4
    end
    object qry_grupo_IN_STATUS_LI_INCLUIR_CONTATO: TBooleanField
      FieldName = 'IN_STATUS_LI_INCLUIR_CONTATO'
    end
    object qry_grupo_IN_DI_EXTERNA: TStringField
      FieldName = 'IN_DI_EXTERNA'
      FixedChar = True
      Size = 1
    end
    object qry_grupo_NM_EMAIL_DRAFT_BL: TStringField
      FieldName = 'NM_EMAIL_DRAFT_BL'
      FixedChar = True
      Size = 100
    end
    object qry_grupo_IN_PENDENCIAS_EMAIL: TStringField
      FieldName = 'IN_PENDENCIAS_EMAIL'
      Size = 1
    end
    object qry_grupo_IN_PREENCHE_COMPLEMENTAR_AD: TStringField
      FieldName = 'IN_PREENCHE_COMPLEMENTAR_AD'
      Size = 1
    end
    object qry_grupo_CD_GESTOR_CONTAS: TStringField
      FieldName = 'CD_GESTOR_CONTAS'
      Size = 4
    end
    object qry_grupo_IN_CONTRATO: TStringField
      FieldName = 'IN_CONTRATO'
      Size = 1
    end
    object qry_grupo_DT_VIGENCIA_CONTRATO: TDateTimeField
      FieldName = 'DT_VIGENCIA_CONTRATO'
    end
    object qry_grupo_NM_INDICE_REAJUSTE_ACORDADO: TStringField
      FieldName = 'NM_INDICE_REAJUSTE_ACORDADO'
    end
  end
  object ds_yesno: TDataSource
    DataSet = qry_yes_no_
    Left = 22
    Top = 73
  end
  object qry_ult_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_GRUPO) AS ULTIMO'
      'FROM TGRUPO')
    Left = 241
    Top = 76
    object qry_ult_grupo_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TGRUPO.CD_GRUPO'
      Size = 3
    end
  end
  object qry_yes_no_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO'
      'FROM TYES_NO')
    Left = 91
    Top = 73
    object qry_yes_no_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Origin = 'TYES_NO.CD_YESNO'
      Size = 1
    end
    object qry_yes_no_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Origin = 'TYES_NO.TX_YESNO'
      Size = 3
    end
  end
  object dtsGrupoItem: TDataSource
    DataSet = QryGrupoItem
    Left = 363
    Top = 299
  end
  object QryGrupoItem: TQuery
    CachedUpdates = True
    BeforeEdit = QryGrupoItemBeforeEdit
    AfterPost = QryGrupoItemAfterPost
    AfterDelete = QryGrupoItemAfterDelete
    DatabaseName = 'DBBROKER'
    DataSource = ds_grupo_
    SQL.Strings = (
      'select B.NM_ITEM, A.* from TGRUPO_ITEM_NUMERARIO A, TITEM B'
      'where'
      '  B.CD_ITEM = A.CD_ITEM and '
      '  CD_GRUPO =:CD_GRUPO'
      '')
    Left = 525
    Top = 295
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
        Size = 4
      end>
    object QryGrupoItemCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object QryGrupoItemCD_ITEM: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object QryGrupoItemNM_ITEM: TStringField
      DisplayLabel = 'Descri'#231#227'o do Item'
      DisplayWidth = 50
      FieldName = 'NM_ITEM'
      Origin = 'DBBROKER.TGRUPO_ITEM_NUMERARIO.CD_GRUPO'
      FixedChar = True
      Size = 30
    end
  end
  object UpdGrupoItem: TUpdateSQL
    ModifySQL.Strings = (
      'update TGRUPO_ITEM_NUMERARIO'
      'set'
      '  CD_GRUPO = :CD_GRUPO,'
      '  CD_ITEM = :CD_ITEM'
      'where'
      '  CD_GRUPO = :OLD_CD_GRUPO and'
      '  CD_ITEM = :OLD_CD_ITEM')
    InsertSQL.Strings = (
      'insert into TGRUPO_ITEM_NUMERARIO'
      '  (CD_GRUPO, CD_ITEM)'
      'values'
      '  (:CD_GRUPO, :CD_ITEM)')
    DeleteSQL.Strings = (
      'delete from TGRUPO_ITEM_NUMERARIO'
      'where'
      '  CD_GRUPO = :OLD_CD_GRUPO and'
      '  CD_ITEM = :OLD_CD_ITEM')
    Left = 656
    Top = 296
  end
  object dsTpReferencia: TDataSource
    DataSet = qryTpReferencia
    Left = 364
    Top = 357
  end
  object qryTpReferencia: TQuery
    CachedUpdates = True
    AfterPost = qry_grupo_AfterPost
    AfterDelete = qry_grupo_AfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTP_REFERENCIA')
    Left = 530
    Top = 359
    object qryTpReferenciaCD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'DBBROKER.TTP_REFERENCIA.CD_REFERENCIA'
      FixedChar = True
      Size = 2
    end
    object qryTpReferenciaNM_REFERENCIA: TStringField
      FieldName = 'NM_REFERENCIA'
      Origin = 'DBBROKER.TTP_REFERENCIA.NM_REFERENCIA'
      FixedChar = True
    end
  end
  object qry_grupo_banco: TQuery
    CachedUpdates = True
    BeforeEdit = qry_grupo_bancoBeforeEdit
    BeforePost = qry_grupo_bancoBeforePost
    AfterPost = qry_grupo_bancoAfterPost
    AfterDelete = qry_grupo_bancoAfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '
      '  CD_BANCO_ADIANTAMENTO'
      ', CD_BANCO_ICMS'
      ', CD_BANCTO_PAGTO_DESPESAS_INDAIA'
      ', CD_BANCTO_PAGTO_DESPESAS_CLIENTE'
      ', CD_BANCO_PAGTO_IMPOSTOS'
      ', CD_GRUPO'
      ', CD_CLIENTE'
      ', CD_UNID_NEG'
      ', CD_PRODUTO'
      ', CD_SERVICO'
      ', CD_AREA'
      ', ISNULL(ICMS_ATE, 0) AS ICMS_ATE '
      ', CD_BANCO_IMP_CLIENTE'
      ', CD_BANCO_IMP_INDAIA'
      ', CD_BANCO_PGMTO_AFRMM'
      'FROM TCLIENTE_BANCO'
      'where CD_GRUPO = :CD_GRUPO')
    UpdateObject = up_grupo_banco
    Left = 518
    Top = 9
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInputOutput
      end>
    object qry_grupo_bancoCD_BANCO_ADIANTAMENTO: TIntegerField
      FieldName = 'CD_BANCO_ADIANTAMENTO'
    end
    object qry_grupo_bancoCD_BANCO_ICMS: TIntegerField
      FieldName = 'CD_BANCO_ICMS'
    end
    object qry_grupo_bancoCD_BANCTO_PAGTO_DESPESAS_INDAIA: TIntegerField
      FieldName = 'CD_BANCTO_PAGTO_DESPESAS_INDAI'
    end
    object qry_grupo_bancoCD_BANCTO_PAGTO_DESPESAS_CLIENTE: TIntegerField
      FieldName = 'CD_BANCTO_PAGTO_DESPESAS_CLIEN'
    end
    object qry_grupo_bancoCD_BANCO_PAGTO_IMPOSTOS: TIntegerField
      FieldName = 'CD_BANCO_PAGTO_IMPOSTOS'
    end
    object qry_grupo_bancoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_grupo_bancoCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
    end
    object qry_grupo_bancoCD_UNID_NEG: TIntegerField
      FieldName = 'CD_UNID_NEG'
    end
    object qry_grupo_bancoCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
    end
    object qry_grupo_bancoCD_SERVICO: TIntegerField
      FieldName = 'CD_SERVICO'
    end
    object qry_grupo_bancoCD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'DBBROKER.TCLIENTE_BANCO.CD_AREA'
      FixedChar = True
      Size = 3
    end
    object qry_grupo_bancoICMS_ATE: TFloatField
      FieldName = 'ICMS_ATE'
      Origin = 'DBBROKER.TCLIENTE_BANCO.ICMS_ATE'
      DisplayFormat = '##,##0.00'
    end
    object qry_grupo_bancoCD_BANCO_IMP_CLIENTE: TIntegerField
      FieldName = 'CD_BANCO_IMP_CLIENTE'
      Origin = 'DBBROKER.TCLIENTE_BANCO.CD_BANCO_IMP_CLIENTE'
    end
    object qry_grupo_bancoCD_BANCO_IMP_INDAIA: TIntegerField
      FieldName = 'CD_BANCO_IMP_INDAIA'
      Origin = 'DBBROKER.TCLIENTE_BANCO.CD_BANCO_IMP_INDAIA'
    end
    object qry_grupo_bancoCD_BANCO_PGMTO_AFRMM: TIntegerField
      FieldName = 'CD_BANCO_PGMTO_AFRMM'
      Origin = 'DBBROKER.TCLIENTE_BANCO.CD_BANCO_PGMTO_AFRMM'
    end
  end
  object up_grupo_banco: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE TCLIENTE_BANCO'
      'SET'
      '  CD_BANCO_ADIANTAMENTO                = :CD_BANCO_ADIANTAMENTO,'
      '  CD_BANCO_ICMS                        = :CD_BANCO_ICMS,'
      
        '  CD_BANCTO_PAGTO_DESPESAS_INDAIA      = :CD_BANCTO_PAGTO_DESPES' +
        'AS_INDAI,'
      
        '  CD_BANCTO_PAGTO_DESPESAS_CLIENTE     = :CD_BANCTO_PAGTO_DESPES' +
        'AS_CLIEN,'
      
        '  CD_BANCO_PAGTO_IMPOSTOS              = :CD_BANCO_PAGTO_IMPOSTO' +
        'S,'
      '  CD_GRUPO                             = :CD_GRUPO,'
      '  CD_CLIENTE                           = :CD_CLIENTE,'
      '  CD_UNID_NEG                          = :CD_UNID_NEG,'
      '  CD_PRODUTO                           = :CD_PRODUTO,'
      '  CD_SERVICO                           = :CD_SERVICO,'
      '  CD_AREA                              = :CD_AREA,'
      '  ICMS_ATE                             = :ICMS_ATE,'
      '  CD_BANCO_IMP_CLIENTE                 = :CD_BANCO_IMP_CLIENTE,'
      '  CD_BANCO_IMP_INDAIA                  = :CD_BANCO_IMP_INDAIA,'
      '  CD_BANCO_PGMTO_AFRMM                 = :CD_BANCO_PGMTO_AFRMM'
      'WHERE'
      '  CD_GRUPO    = :OLD_CD_GRUPO AND'
      '  CD_CLIENTE  = :OLD_CD_CLIENTE AND'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG AND'
      '  CD_PRODUTO  = :OLD_CD_PRODUTO AND'
      '  CD_SERVICO  = :OLD_CD_SERVICO AND'
      '  CD_AREA     = :OLD_CD_AREA AND'
      '  ICMS_ATE    = :OLD_ICMS_ATE')
    InsertSQL.Strings = (
      'insert into TCLIENTE_BANCO'
      '  (CD_BANCO_ADIANTAMENTO, CD_BANCO_ICMS, '
      'CD_BANCTO_PAGTO_DESPESAS_INDAIA, '
      '   CD_BANCTO_PAGTO_DESPESAS_CLIENTE, CD_BANCO_PAGTO_IMPOSTOS, '
      'CD_GRUPO, CD_CLIENTE, '
      '   CD_UNID_NEG, CD_PRODUTO, CD_SERVICO, CD_AREA, ICMS_ATE, '
      'CD_BANCO_IMP_CLIENTE, '
      '   CD_BANCO_IMP_INDAIA,'
      'CD_BANCO_PGMTO_AFRMM)'
      'values'
      '  (:CD_BANCO_ADIANTAMENTO, :CD_BANCO_ICMS, '
      ':CD_BANCTO_PAGTO_DESPESAS_INDAI, '
      '   :CD_BANCTO_PAGTO_DESPESAS_CLIEN, :CD_BANCO_PAGTO_IMPOSTOS, '
      ':CD_GRUPO, '
      
        '   :CD_CLIENTE, :CD_UNID_NEG, :CD_PRODUTO, :CD_SERVICO, :CD_AREA' +
        ', '
      ':ICMS_ATE, '
      '   :CD_BANCO_IMP_CLIENTE, :CD_BANCO_IMP_INDAIA,'
      ':CD_BANCO_PGMTO_AFRMM)')
    DeleteSQL.Strings = (
      'delete from TCLIENTE_BANCO'
      'where'
      '  CD_GRUPO = :OLD_CD_GRUPO and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_SERVICO = :OLD_CD_SERVICO and'
      '  CD_AREA = :OLD_CD_AREA and'
      '  ICMS_ATE = :OLD_ICMS_ATE')
    Left = 655
    Top = 7
  end
  object ds_grupo_banco: TDataSource
    DataSet = qry_grupo_banco
    OnStateChange = ds_grupo_bancoStateChange
    OnDataChange = ds_grupo_bancoDataChange
    Left = 366
    Top = 3
  end
  object qry_relatorios_mail_aut_: TQuery
    CachedUpdates = True
    AfterPost = qry_relatorios_mail_aut_AfterPost
    AfterDelete = qry_relatorios_mail_aut_AfterDelete
    AfterScroll = qry_relatorios_mail_aut_AfterScroll
    OnCalcFields = qry_relatorios_mail_aut_CalcFields
    OnNewRecord = qry_relatorios_mail_aut_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  '
      '  CD_RELATORIO'
      ' ,NM_RELATORIO'
      ' ,LEFT(TX_RELATORIO,100) AS DESCRICAO'
      ', TX_RELATORIO'
      ', TX_MODELO'
      ' ,CD_TIPO_RELATORIO'
      ' ,TX_CONFIGURACAO'
      ' ,IN_ATIVO'
      ' ,IN_FIMDESEMANA'
      ' ,TP_IDIOMA'
      ' ,CD_VIA_TRANSPORTE'
      
        ' ,CONVERT(VARCHAR(8000),MASTER.DBO.FN_EXTRACT_WORD( TX_CONFIGURA' +
        'CAO,3)) GRUPO'
      
        ' ,CONVERT(VARCHAR(8000),MASTER.DBO.FN_EXTRACT_WORD( TX_CONFIGURA' +
        'CAO,8)) EVENTO'
      ' ,CD_TIPO_DOCTO'
      'FROM TRELATORIOS_MAIL_AUT'
      'WHERE CD_TIPO_RELATORIO = '#39'E01'#39
      'AND MASTER.DBO.FN_EXTRACT_WORD( TX_CONFIGURACAO,3) = :GRUPO'
      
        'AND ( ( :PRODUTO = '#39#39' ) OR  ( MASTER.DBO.FN_EXTRACT_WORD( TX_CON' +
        'FIGURACAO,10) = :PRODUTO ))'
      'AND ( ( :ATIVO = '#39#39' ) OR  ( IN_ATIVO = :ATIVO ))'
      ''
      '/*manter os espa'#231'os*/'
      '')
    UpdateObject = upd_relatorios_mail_aut_
    Left = 523
    Top = 194
    ParamData = <
      item
        DataType = ftString
        Name = 'GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ATIVO'
        ParamType = ptUnknown
      end>
    object qry_relatorios_mail_aut_CD_RELATORIO: TStringField
      FieldName = 'CD_RELATORIO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT.CD_RELATORIO'
      FixedChar = True
      Size = 5
    end
    object qry_relatorios_mail_aut_NM_RELATORIO: TStringField
      FieldName = 'NM_RELATORIO'
      FixedChar = True
      Size = 500
    end
    object qry_relatorios_mail_aut_TX_RELATORIO: TStringField
      FieldName = 'TX_RELATORIO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT.TX_RELATORIO'
      FixedChar = True
      Size = 255
    end
    object qry_relatorios_mail_aut_TX_MODELO: TStringField
      FieldName = 'TX_MODELO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT.TX_MODELO'
      FixedChar = True
      Size = 200
    end
    object qry_relatorios_mail_aut_CD_TIPO_RELATORIO: TStringField
      FieldName = 'CD_TIPO_RELATORIO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT.CD_TIPO_RELATORIO'
      FixedChar = True
      Size = 3
    end
    object qry_relatorios_mail_aut_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_relatorios_mail_aut_calc_ATIVO: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_ATIVO'
      Size = 1
      Calculated = True
    end
    object qry_relatorios_mail_aut_IN_FIMDESEMANA: TStringField
      FieldName = 'IN_FIMDESEMANA'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT.IN_FIMDESEMANA'
      FixedChar = True
      Size = 1
    end
    object qry_relatorios_mail_aut_TX_CONFIGURACAO: TMemoField
      FieldName = 'TX_CONFIGURACAO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT.TX_CONFIGURACAO'
      BlobType = ftMemo
    end
    object qry_relatorios_mail_aut_TP_IDIOMA: TStringField
      FieldName = 'TP_IDIOMA'
      FixedChar = True
      Size = 1
    end
    object qry_relatorios_mail_aut_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_relatorios_mail_aut_GRUPO: TStringField
      FieldName = 'GRUPO'
      FixedChar = True
      Size = 255
    end
    object qry_relatorios_mail_aut_EVENTO: TStringField
      FieldName = 'EVENTO'
      FixedChar = True
      Size = 255
    end
    object qry_relatorios_mail_aut_CD_TIPO_DOCTO: TStringField
      FieldName = 'CD_TIPO_DOCTO'
      Size = 200
    end
    object qry_relatorios_mail_aut_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 100
    end
  end
  object ds_relatorios_mail_aut: TDataSource
    DataSet = qry_relatorios_mail_aut_
    OnDataChange = ds_relatorios_mail_autDataChange
    Left = 364
    Top = 190
  end
  object qry_relatorios_mail_aut_usuarios_: TQuery
    BeforePost = qry_relatorios_mail_aut_usuarios_BeforePost
    AfterScroll = qry_relatorios_mail_aut_usuarios_AfterScroll
    OnCalcFields = qry_relatorios_mail_aut_usuarios_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TRELATORIOS_MAIL_AUT_USUARIOS'
      'WHERE CD_RELATORIO = :CD_RELATORIO')
    Left = 524
    Top = 247
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_RELATORIO'
        ParamType = ptUnknown
      end>
    object qry_relatorios_mail_aut_usuarios_CD_RELATORIO: TStringField
      FieldName = 'CD_RELATORIO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT_USUARIOS.CD_RELATORIO'
      FixedChar = True
      Size = 5
    end
    object qry_relatorios_mail_aut_usuarios_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT_USUARIOS.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_relatorios_mail_aut_usuarios_TX_HORARIOS_ENVIO: TStringField
      FieldName = 'TX_HORARIOS_ENVIO'
      Origin = 'DBBROKER.TRELATORIOS_MAIL_AUT_USUARIOS.TX_HORARIOS_ENVIO'
      FixedChar = True
      Size = 200
    end
    object qry_relatorios_mail_aut_usuarios_calc_NM_USUARIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_NM_USUARIO'
      Size = 50
      Calculated = True
    end
  end
  object ds_relatorios_mail_aut_usuarios: TDataSource
    DataSet = qry_relatorios_mail_aut_usuarios_
    OnDataChange = ds_relatorios_mail_autDataChange
    Left = 364
    Top = 246
  end
  object upd_relatorios_mail_aut_: TUpdateSQL
    ModifySQL.Strings = (
      'update TRELATORIOS_MAIL_AUT'
      'set'
      '  CD_RELATORIO = :CD_RELATORIO,'
      '  NM_RELATORIO = :NM_RELATORIO,'
      '  TX_RELATORIO = :TX_RELATORIO,'
      '  TX_MODELO = :TX_MODELO,'
      '  CD_TIPO_RELATORIO = :CD_TIPO_RELATORIO,'
      '  TX_CONFIGURACAO = :TX_CONFIGURACAO,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  IN_FIMDESEMANA = :IN_FIMDESEMANA,'
      '  TP_IDIOMA = :TP_IDIOMA,'
      '  CD_VIA_TRANSPORTE = :CD_VIA_TRANSPORTE,'
      'CD_TIPO_DOCTO = :CD_TIPO_DOCTO'
      'where'
      '  CD_RELATORIO = :OLD_CD_RELATORIO')
    InsertSQL.Strings = (
      'insert into TRELATORIOS_MAIL_AUT'
      
        '  (CD_RELATORIO, NM_RELATORIO, TX_RELATORIO, TX_MODELO, CD_TIPO_' +
        'RELATORIO, '
      
        '   TX_CONFIGURACAO, IN_ATIVO, IN_FIMDESEMANA, TP_IDIOMA, CD_VIA_' +
        'TRANSPORTE, CD_TIPO_DOCTO)'
      'values'
      
        '  (:CD_RELATORIO, :NM_RELATORIO, :TX_RELATORIO, :TX_MODELO, :CD_' +
        'TIPO_RELATORIO, '
      
        '   :TX_CONFIGURACAO, :IN_ATIVO, :IN_FIMDESEMANA, :TP_IDIOMA, :CD' +
        '_VIA_TRANSPORTE, :CD_TIPO_DOCTO)')
    DeleteSQL.Strings = (
      'delete from TRELATORIOS_MAIL_AUT'
      'where'
      '  CD_RELATORIO = :OLD_CD_RELATORIO')
    Left = 656
    Top = 197
  end
  object qry_produto: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO FROM TPRODUTO WHERE IN_ATIVO = '#39'1'#39)
    Left = 91
    Top = 134
    object qry_produtoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TPRODUTO.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_produtoNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'DBBROKER.TPRODUTO.NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
  end
  object dsProduto: TDataSource
    DataSet = qry_produto
    Left = 17
    Top = 143
  end
  object sp_cria_alerta_grupo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.SP_CRIA_ALERTA_GRUPO'
    Left = 238
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@CD_GRUPO'
        ParamType = ptInput
      end>
  end
  object qryFatores: TQuery
    CachedUpdates = True
    AfterPost = qryFatoresAfterPost
    AfterDelete = qryFatoresAfterPost
    AfterScroll = qryFatoresAfterScroll
    OnNewRecord = qryFatoresNewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TFATORES'
      'WHERE CD_GRUPO IN ('#39'XXX'#39', :CD_GRUPO)')
    UpdateObject = updFatores
    Left = 32
    Top = 211
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end>
    object qryFatoresCD_FATOR: TAutoIncField
      FieldName = 'CD_FATOR'
    end
    object qryFatoresNM_FATOR: TStringField
      FieldName = 'NM_FATOR'
      FixedChar = True
      Size = 1000
    end
    object qryFatoresDS_FATOR: TStringField
      FieldName = 'DS_FATOR'
      FixedChar = True
      Size = 1000
    end
    object qryFatoresCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qryFatoresCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryFatoresIN_OPCIONAL: TStringField
      FieldName = 'IN_OPCIONAL'
      FixedChar = True
      Size = 1
    end
    object qryFatoresCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qryFatoresNM_CAMPO_PROCESSO: TStringField
      FieldName = 'NM_CAMPO_PROCESSO'
      FixedChar = True
      Size = 100
    end
    object qryFatoresNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      FixedChar = True
      Size = 100
    end
    object qryFatoresNM_CAMPO_CHAVE_TABELA: TStringField
      FieldName = 'NM_CAMPO_CHAVE_TABELA'
      FixedChar = True
      Size = 100
    end
    object qryFatoresNM_CAMPO_RETORNO_TABELA: TStringField
      FieldName = 'NM_CAMPO_RETORNO_TABELA'
      FixedChar = True
      Size = 100
    end
    object qryFatoresCD_COMPARADOR: TStringField
      FieldName = 'CD_COMPARADOR'
      FixedChar = True
      Size = 2
    end
    object qryFatoresNM_SQL: TStringField
      FieldName = 'NM_SQL'
      FixedChar = True
      Size = 255
    end
    object qryFatoresNM_RETORNO: TStringField
      FieldName = 'NM_RETORNO'
      FixedChar = True
      Size = 0
    end
    object qryFatoresNM_TABELA_TRIGGER: TStringField
      FieldName = 'NM_TABELA_TRIGGER'
      FixedChar = True
      Size = 255
    end
    object qryFatoresNM_CAMPOS_CHAVE_TRIGGER: TStringField
      FieldName = 'NM_CAMPOS_CHAVE_TRIGGER'
      FixedChar = True
      Size = 255
    end
    object qryFatoresNM_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_PRODUTO'
      LookupDataSet = qryProdutosFatores
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 50
      Lookup = True
    end
    object qryFatoresNM_GRUPO: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_GRUPO'
      LookupDataSet = qryGruposFatores
      LookupKeyFields = 'CD_GRUPO'
      LookupResultField = 'NM_GRUPO'
      KeyFields = 'CD_GRUPO'
      Size = 50
      Lookup = True
    end
  end
  object updFatores: TUpdateSQL
    ModifySQL.Strings = (
      'update TFATORES'
      'set'
      '  CD_FATOR = :CD_FATOR,'
      '  NM_FATOR = :NM_FATOR,'
      '  DS_FATOR = :DS_FATOR,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  IN_OPCIONAL = :IN_OPCIONAL,'
      '  CD_GRUPO = :CD_GRUPO,'
      '  NM_CAMPO_PROCESSO = :NM_CAMPO_PROCESSO,'
      '  NM_TABELA = :NM_TABELA,'
      '  NM_CAMPO_CHAVE_TABELA = :NM_CAMPO_CHAVE_TABELA,'
      '  NM_CAMPO_RETORNO_TABELA = :NM_CAMPO_RETORNO_TABELA,'
      '  CD_COMPARADOR = :CD_COMPARADOR,'
      '  NM_SQL = :NM_SQL,'
      '  NM_RETORNO = :NM_RETORNO,'
      '  NM_TABELA_TRIGGER = :NM_TABELA_TRIGGER,'
      '  NM_CAMPOS_CHAVE_TRIGGER = :NM_CAMPOS_CHAVE_TRIGGER'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR')
    InsertSQL.Strings = (
      'insert into TFATORES'
      
        '  (CD_FATOR, NM_FATOR, DS_FATOR, CD_UNID_NEG, CD_PRODUTO, IN_OPC' +
        'IONAL, '
      
        '   CD_GRUPO, NM_CAMPO_PROCESSO, NM_TABELA, NM_CAMPO_CHAVE_TABELA' +
        ', NM_CAMPO_RETORNO_TABELA, '
      
        '   CD_COMPARADOR, NM_SQL, NM_RETORNO, NM_TABELA_TRIGGER, NM_CAMP' +
        'OS_CHAVE_TRIGGER)'
      'values'
      
        '  (:CD_FATOR, :NM_FATOR, :DS_FATOR, :CD_UNID_NEG, :CD_PRODUTO, :' +
        'IN_OPCIONAL, '
      
        '   :CD_GRUPO, :NM_CAMPO_PROCESSO, :NM_TABELA, :NM_CAMPO_CHAVE_TA' +
        'BELA, :NM_CAMPO_RETORNO_TABELA, '
      
        '   :CD_COMPARADOR, :NM_SQL, :NM_RETORNO, :NM_TABELA_TRIGGER, :NM' +
        '_CAMPOS_CHAVE_TRIGGER)')
    DeleteSQL.Strings = (
      'delete from TFATORES'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR')
    Left = 128
    Top = 211
  end
  object dsFatores: TDataSource
    DataSet = qryFatores
    OnStateChange = dsFatoresStateChange
    OnDataChange = ds_relatorios_mail_autDataChange
    Left = 224
    Top = 211
  end
  object qryFatoresCampos: TQuery
    CachedUpdates = True
    AfterPost = qryFatoresAfterPost
    AfterDelete = qryFatoresAfterPost
    OnNewRecord = qryFatoresCamposNewRecord
    DatabaseName = 'DBBROKER'
    DataSource = dsFatores
    SQL.Strings = (
      'SELECT *'
      'FROM TFATORES_CAMPOS'
      'WHERE CD_FATOR = :CD_FATOR')
    UpdateObject = updFatoresCampos
    Left = 32
    Top = 259
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_FATOR'
        ParamType = ptInput
      end>
    object qryFatoresCamposCD_FATOR: TIntegerField
      FieldName = 'CD_FATOR'
      Origin = 'DBBROKER.TFATORES_CAMPOS.CD_FATOR'
    end
    object qryFatoresCamposNM_CAMPO_PROCESSO: TStringField
      FieldName = 'NM_CAMPO_PROCESSO'
      Origin = 'DBBROKER.TFATORES_CAMPOS.NM_CAMPO_PROCESSO'
      FixedChar = True
      Size = 100
    end
    object qryFatoresCamposNM_FATOR_CAMPO: TStringField
      FieldName = 'NM_FATOR_CAMPO'
      Origin = 'DBBROKER.TFATORES_CAMPOS.NM_FATOR_CAMPO'
      FixedChar = True
      Size = 100
    end
    object qryFatoresCamposNM_LOOKUP_TABELA: TStringField
      FieldName = 'NM_LOOKUP_TABELA'
      Origin = 'DBBROKER.TFATORES_CAMPOS.NM_LOOKUP_TABELA'
      FixedChar = True
      Size = 100
    end
    object qryFatoresCamposNM_LOOKUP_SQL: TStringField
      FieldName = 'NM_LOOKUP_SQL'
      Origin = 'DBBROKER.TFATORES_CAMPOS.NM_LOOKUP_SQL'
      FixedChar = True
      Size = 100
    end
    object qryFatoresCamposNM_LOOKUP_CAMPO_CHAVE: TStringField
      FieldName = 'NM_LOOKUP_CAMPO_CHAVE'
      Origin = 'DBBROKER.TFATORES_CAMPOS.NM_LOOKUP_CAMPO_CHAVE'
      FixedChar = True
      Size = 100
    end
    object qryFatoresCamposNM_LOOKUP_CAMPO_RETORNO: TStringField
      FieldName = 'NM_LOOKUP_CAMPO_RETORNO'
      Origin = 'DBBROKER.TFATORES_CAMPOS.NM_LOOKUP_CAMPO_RETORNO'
      FixedChar = True
      Size = 100
    end
  end
  object updFatoresCampos: TUpdateSQL
    ModifySQL.Strings = (
      'update TFATORES_CAMPOS'
      'set'
      '  CD_FATOR = :CD_FATOR,'
      '  NM_CAMPO_PROCESSO = :NM_CAMPO_PROCESSO,'
      '  NM_FATOR_CAMPO = :NM_FATOR_CAMPO,'
      '  NM_LOOKUP_TABELA = :NM_LOOKUP_TABELA,'
      '  NM_LOOKUP_SQL = :NM_LOOKUP_SQL,'
      '  NM_LOOKUP_CAMPO_CHAVE = :NM_LOOKUP_CAMPO_CHAVE,'
      '  NM_LOOKUP_CAMPO_RETORNO = :NM_LOOKUP_CAMPO_RETORNO'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR and'
      '  NM_CAMPO_PROCESSO = :OLD_NM_CAMPO_PROCESSO')
    InsertSQL.Strings = (
      'insert into TFATORES_CAMPOS'
      
        '  (CD_FATOR, NM_CAMPO_PROCESSO, NM_FATOR_CAMPO, NM_LOOKUP_TABELA' +
        ', NM_LOOKUP_SQL, '
      '   NM_LOOKUP_CAMPO_CHAVE, NM_LOOKUP_CAMPO_RETORNO)'
      'values'
      
        '  (:CD_FATOR, :NM_CAMPO_PROCESSO, :NM_FATOR_CAMPO, :NM_LOOKUP_TA' +
        'BELA, :NM_LOOKUP_SQL, '
      '   :NM_LOOKUP_CAMPO_CHAVE, :NM_LOOKUP_CAMPO_RETORNO)')
    DeleteSQL.Strings = (
      'delete from TFATORES_CAMPOS'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR and'
      '  NM_CAMPO_PROCESSO = :OLD_NM_CAMPO_PROCESSO')
    Left = 128
    Top = 259
  end
  object dsFatoresCampos: TDataSource
    DataSet = qryFatoresCampos
    OnStateChange = dsFatoresStateChange
    OnDataChange = ds_relatorios_mail_autDataChange
    Left = 224
    Top = 259
  end
  object qryFatoresEventos: TQuery
    CachedUpdates = True
    AfterPost = qryFatoresAfterPost
    AfterDelete = qryFatoresAfterPost
    OnNewRecord = qryFatoresEventosNewRecord
    DatabaseName = 'DBBROKER'
    DataSource = dsFatores
    SQL.Strings = (
      'SELECT *'
      'FROM TFATORES_EVENTO'
      'WHERE CD_FATOR = :CD_FATOR'
      'ORDER BY NR_PRIORIDADE')
    UpdateObject = updFatoresEventos
    Left = 32
    Top = 307
    ParamData = <
      item
        DataType = ftAutoInc
        Name = 'CD_FATOR'
        ParamType = ptInput
        Size = 4
      end>
    object qryFatoresEventosCD_FATOR: TIntegerField
      FieldName = 'CD_FATOR'
      Origin = 'DBBROKER.TFATORES_EVENTO.CD_FATOR'
    end
    object qryFatoresEventosCD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'DBBROKER.TFATORES_EVENTO.CD_EVENTO'
      FixedChar = True
      Size = 3
    end
    object qryFatoresEventosCD_EVENTO_ANTERIOR: TStringField
      FieldName = 'CD_EVENTO_ANTERIOR'
      Origin = 'DBBROKER.TFATORES_EVENTO.CD_EVENTO_ANTERIOR'
      FixedChar = True
      Size = 3
    end
    object qryFatoresEventosCD_EVENTO_BASE: TStringField
      FieldName = 'CD_EVENTO_BASE'
      Origin = 'DBBROKER.TFATORES_EVENTO.CD_EVENTO_BASE'
      FixedChar = True
      Size = 3
    end
    object qryFatoresEventosPZ_EVENTO_BASE: TIntegerField
      FieldName = 'PZ_EVENTO_BASE'
      Origin = 'DBBROKER.TFATORES_EVENTO.PZ_EVENTO_BASE'
    end
    object qryFatoresEventosNR_PRIORIDADE: TIntegerField
      FieldName = 'NR_PRIORIDADE'
      Origin = 'DBBROKER.TFATORES_EVENTO.NR_PRIORIDADE'
    end
    object qryFatoresEventosIN_ALTERAR: TStringField
      FieldName = 'IN_ALTERAR'
      Origin = 'DBBROKER.TFATORES_EVENTO.IN_ALTERAR'
      FixedChar = True
      Size = 1
    end
    object qryFatoresEventosIN_EXCLUIR: TStringField
      FieldName = 'IN_EXCLUIR'
      Origin = 'DBBROKER.TFATORES_EVENTO.IN_EXCLUIR'
      FixedChar = True
      Size = 1
    end
    object qryFatoresEventosNM_EVENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_EVENTO'
      LookupDataSet = qryEventos
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EVENTO'
      Size = 50
      Lookup = True
    end
    object qryFatoresEventosNM_EVENTO_ANTERIOR: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_EVENTO_ANTERIOR'
      LookupDataSet = qryEventos
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EVENTO_ANTERIOR'
      Size = 50
      Lookup = True
    end
    object qryFatoresEventosNM_EVENTO_BASE: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_EVENTO_BASE'
      LookupDataSet = qryEventos
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EVENTO_BASE'
      Size = 50
      Lookup = True
    end
  end
  object updFatoresEventos: TUpdateSQL
    ModifySQL.Strings = (
      'update TFATORES_EVENTO'
      'set'
      '  CD_FATOR = :CD_FATOR,'
      '  CD_EVENTO = :CD_EVENTO,'
      '  CD_EVENTO_ANTERIOR = :CD_EVENTO_ANTERIOR,'
      '  CD_EVENTO_BASE = :CD_EVENTO_BASE,'
      '  PZ_EVENTO_BASE = :PZ_EVENTO_BASE,'
      '  NR_PRIORIDADE = :NR_PRIORIDADE,'
      '  IN_ALTERAR = :IN_ALTERAR,'
      '  IN_EXCLUIR = :IN_EXCLUIR'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR and'
      '  CD_EVENTO = :OLD_CD_EVENTO and'
      '  CD_EVENTO_ANTERIOR = :OLD_CD_EVENTO_ANTERIOR and'
      '  CD_EVENTO_BASE = :OLD_CD_EVENTO_BASE and'
      '  PZ_EVENTO_BASE = :OLD_PZ_EVENTO_BASE')
    InsertSQL.Strings = (
      'insert into TFATORES_EVENTO'
      
        '  (CD_FATOR, CD_EVENTO, CD_EVENTO_ANTERIOR, CD_EVENTO_BASE, PZ_E' +
        'VENTO_BASE, '
      '   NR_PRIORIDADE, IN_ALTERAR, IN_EXCLUIR)'
      'values'
      
        '  (:CD_FATOR, :CD_EVENTO, :CD_EVENTO_ANTERIOR, :CD_EVENTO_BASE, ' +
        ':PZ_EVENTO_BASE, '
      '   :NR_PRIORIDADE, :IN_ALTERAR, :IN_EXCLUIR)')
    DeleteSQL.Strings = (
      'delete from TFATORES_EVENTO'
      'where'
      '  CD_FATOR = :OLD_CD_FATOR and'
      '  CD_EVENTO = :OLD_CD_EVENTO and'
      '  CD_EVENTO_ANTERIOR = :OLD_CD_EVENTO_ANTERIOR and'
      '  CD_EVENTO_BASE = :OLD_CD_EVENTO_BASE and'
      '  PZ_EVENTO_BASE = :OLD_PZ_EVENTO_BASE')
    Left = 128
    Top = 307
  end
  object dsFatoresEventos: TDataSource
    DataSet = qryFatoresEventos
    OnStateChange = dsFatoresStateChange
    OnDataChange = ds_relatorios_mail_autDataChange
    Left = 224
    Top = 307
  end
  object qryComparadores: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCOMPARADORES_FATOR')
    Left = 32
    Top = 451
    object qryComparadoresCD_COMPARADOR: TStringField
      FieldName = 'CD_COMPARADOR'
      Origin = 'DBBROKER.TCOMPARADORES_FATOR.CD_COMPARADOR'
      FixedChar = True
      Size = 2
    end
    object qryComparadoresNM_COMPARADOR: TStringField
      FieldName = 'NM_COMPARADOR'
      Origin = 'DBBROKER.TCOMPARADORES_FATOR.NM_COMPARADOR'
      FixedChar = True
      Size = 100
    end
  end
  object dsComparadores: TDataSource
    DataSet = qryComparadores
    OnDataChange = ds_relatorios_mail_autDataChange
    Left = 136
    Top = 443
  end
  object qryProdutosFatores: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM (SELECT CD_PRODUTO, NM_PRODUTO'
      '      FROM TPRODUTO'
      
        '      WHERE CD_PRODUTO IN ('#39'01'#39', '#39'03'#39', '#39'06'#39', '#39'17'#39', '#39'02'#39', '#39'10'#39', '#39 +
        '18'#39')'
      '      UNION ALL'
      '      SELECT '#39'XX'#39' AS CD_PRODUTO, '#39'Todos'#39' AS NM_PRODUTO) AS VW'
      'ORDER BY CASE CD_PRODUTO'
      '             WHEN '#39'XX'#39' THEN '#39'00'#39
      '         ELSE NM_PRODUTO'
      '         END')
    Left = 32
    Top = 355
    object qryProdutosFatoresCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryProdutosFatoresNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
  end
  object qryGruposFatores: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM (SELECT CD_GRUPO, NM_GRUPO'
      '      FROM TGRUPO'
      '      WHERE CD_GRUPO = :CD_GRUPO'
      '      UNION ALL'
      '      SELECT '#39'XXX'#39' AS CD_GRUPO, '#39'Todos'#39' AS NM_GRUPO) AS VW'
      'ORDER BY CASE CD_GRUPO'
      '             WHEN '#39'XXX'#39' THEN '#39'00'#39
      '         ELSE NM_GRUPO'
      '         END')
    Left = 32
    Top = 403
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end>
    object qryGruposFatoresCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qryGruposFatoresNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      FixedChar = True
      Size = 50
    end
  end
  object qryEventos: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EVENTO, NM_EVENTO, AP_EVENTO'
      'FROM TEVENTO')
    Left = 32
    Top = 499
    object qryEventosCD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'DBBROKER.TEVENTO.CD_EVENTO'
      FixedChar = True
      Size = 3
    end
    object qryEventosNM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      Origin = 'DBBROKER.TEVENTO.NM_EVENTO'
      FixedChar = True
      Size = 50
    end
    object qryEventosAP_EVENTO: TStringField
      FieldName = 'AP_EVENTO'
      Origin = 'DBBROKER.TEVENTO.AP_EVENTO'
      FixedChar = True
      Size = 15
    end
  end
  object UpdGrupo: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE TGRUPO'
      'SET'
      '  IN_ENVIA_COMO_TI                   = :IN_ENVIA_COMO_TI,'
      '  CD_GRUPO                           = :CD_GRUPO,'
      '  NM_GRUPO                           = :NM_GRUPO,'
      '  DT_INCLUSAO                        = :DT_INCLUSAO,'
      '  IN_ATIVO                           = :IN_ATIVO,'
      '  CNPJ_GRUPO                         = :CNPJ_GRUPO,'
      '  IN_RATEIO                          = :IN_RATEIO,'
      '  CD_LAYOUT_BORDERO                  = :CD_LAYOUT_BORDERO,'
      '  IN_OBRIGAR_INVOICE                 = :IN_OBRIGAR_INVOICE,'
      
        '  IN_MARINHA_MERCANTE_ICMS           = :IN_MARINHA_MERCANTE_ICMS' +
        ','
      '  IN_CONFERE_REFERENCIA              = :IN_CONFERE_REFERENCIA,'
      '  IN_EXIBE_PEDIDO_SITE               = :IN_EXIBE_PEDIDO_SITE,'
      '  NR_REL_FAT_CONSOLIDADO             = :NR_REL_FAT_CONSOLIDADO,'
      '  TP_PEDIDO_BUSCA                    = :TP_PEDIDO_BUSCA,'
      '  TP_PEDIDO_BUSCA_IMP                = :TP_PEDIDO_BUSCA_IMP,'
      '  IN_EMAIL_CRIACAO                   = :IN_EMAIL_CRIACAO,'
      '  EMAIL_CRIACAO                      = :EMAIL_CRIACAO,'
      '  IN_EMAIL_AUTORIZACAO               = :IN_EMAIL_AUTORIZACAO,'
      '  EMAIL_AUTORIZACAO                  = :EMAIL_AUTORIZACAO,'
      
        '  IN_EMAIL_PRE_AUTORIZACAO           = :IN_EMAIL_PRE_AUTORIZACAO' +
        ','
      '  EMAIL_PRE_AUTORIZACAO              = :EMAIL_PRE_AUTORIZACAO,'
      '  IN_INTEGRA_FORNECIMENTO            = :IN_INTEGRA_FORNECIMENTO,'
      '  IN_INTEGRA_PACKING_LIST            = :IN_INTEGRA_PACKING_LIST,'
      '  IN_MODO_SIMPLES                    = :IN_MODO_SIMPLES,'
      '  IN_RAP_SEQUENCIAL                  = :IN_RAP_SEQUENCIAL,'
      '  IN_ENVIA_ARQUIVOS                  = :IN_ENVIA_ARQUIVOS,'
      '  IN_MOSTRA_FATURADOS                = :IN_MOSTRA_FATURADOS,'
      '  IN_DIVIDE_EMBARCADOS               = :IN_DIVIDE_EMBARCADOS,'
      '  IN_MOSTRA_FOLLOWUP                 = :IN_MOSTRA_FOLLOWUP,'
      '  IN_CONFERENCIA                     = :IN_CONFERENCIA,'
      
        '  IN_ALERTA_E01_NAO_GENERICO         = :IN_ALERTA_E01_NAO_GENERI' +
        'CO,'
      
        '  IN_PREENCHE_EVENTO_387_COM_021     = :IN_PREENCHE_EVENTO_387_C' +
        'OM_021,'
      '  IN_RATEIA_PEDIDO                   = :IN_RATEIA_PEDIDO,'
      '  NM_EMAIL_CONTATO_DAILY             = :NM_EMAIL_CONTATO_DAILY,'
      '  IN_DESBLOQUEIA_DRAFT               = :IN_DESBLOQUEIA_DRAFT,'
      '  TX_LUCRO_ESTIMADO                  = :TX_LUCRO_ESTIMADO,'
      '  DT_NOVO_FOLLOWUP_IMP               = :DT_NOVO_FOLLOWUP_IMP,'
      '  DT_NOVO_FOLLOWUP_EXP               = :DT_NOVO_FOLLOWUP_EXP,'
      
        '  NM_EMAIL_CONTATO_FOLLOWUP          = :NM_EMAIL_CONTATO_FOLLOWU' +
        'P,'
      '  IN_PENDENCIAS                      = :IN_PENDENCIAS,'
      
        '  IN_PENDENCIAS_EMAIL                      = :IN_PENDENCIAS_EMAI' +
        'L,'
      
        '  CD_CC_CONTAS_RECEBER_REDUZIDA      = :CD_CC_CONTAS_RECEBER_RED' +
        'UZIDA,'
      '  CD_CC_DESPACHOS_ANDAMENTO_REDUZIDA = :ANDAMENTO_REDUZIDA,'
      '  CD_CC_DESPACHOS_FATURAR_REDUZIDA   = :FATURAR_REDUZIDA,'
      
        '  IN_EXTRATO_AVERBADO_RESUMIDO       = :IN_EXTRATO_AVERBADO_RESU' +
        'MIDO,'
      '  IN_EXIGE_CFOP_EXP                  = :IN_EXIGE_CFOP_EXP,'
      '  IN_PLANILHA_CUSTOS                 = :IN_PLANILHA_CUSTOS,'
      '  EMAIL_AVARIAS                      = :EMAIL_AVARIAS,'
      
        '  NM_EMAIL_CONSULTA_MERCANTE         = :NM_EMAIL_CONSULTA_MERCAN' +
        'TE,'
      
        '  IC_CONSULTA_MERCANTE_TERCEIROS     = :IC_CONSULTA_MERCANTE_TER' +
        'CEIROS,'
      '  NM_EMAIL_CONSULTA_LI               = :NM_EMAIL_CONSULTA_LI,'
      '  NM_EMAIL_CONSULTA_LI_STATUS = :NM_EMAIL_CONSULTA_LI_STATUS,'
      '  CD_TIPO_BASE_SEGURO_DI = :CD_TIPO_BASE_SEGURO_DI,'
      '  PC_SEGURO_MLE_DI   = :PC_SEGURO_MLE_DI,'
      '  CD_COORDENADOR_IMPO = :CD_COORDENADOR_IMPO,'
      '  CD_COORDENADOR_EXPO = :CD_COORDENADOR_EXPO   ,'
      '  IN_STATUS_LI_INCLUIR_CONTATO = :IN_STATUS_LI_INCLUIR_CONTATO,'
      '  IN_DI_EXTERNA = :IN_DI_EXTERNA,'
      '  NM_EMAIL_DRAFT_BL = :NM_EMAIL_DRAFT_BL,'
      '  IN_PREENCHE_COMPLEMENTAR_AD = :IN_PREENCHE_COMPLEMENTAR_AD,'
      '  CD_GESTOR_CONTAS = :CD_GESTOR_CONTAS,'
      '  IN_CONTRATO = :IN_CONTRATO,'
      '  DT_VIGENCIA_CONTRATO = :DT_VIGENCIA_CONTRATO,'
      '  NM_INDICE_REAJUSTE_ACORDADO = :NM_INDICE_REAJUSTE_ACORDADO'
      'WHERE'
      '  CD_GRUPO                           = :OLD_CD_GRUPO')
    InsertSQL.Strings = (
      'INSERT INTO TGRUPO'
      '  (IN_ENVIA_COMO_TI, '
      '   CD_GRUPO, '
      '   NM_GRUPO, '
      '   DT_INCLUSAO, '
      '   IN_ATIVO, '
      '   CNPJ_GRUPO, '
      '   IN_RATEIO, '
      '   CD_LAYOUT_BORDERO, '
      '   IN_OBRIGAR_INVOICE, '
      '   IN_MARINHA_MERCANTE_ICMS, '
      '   IN_CONFERE_REFERENCIA, '
      '   IN_EXIBE_PEDIDO_SITE, '
      '   NR_REL_FAT_CONSOLIDADO, '
      '   TP_PEDIDO_BUSCA, '
      '   TP_PEDIDO_BUSCA_IMP, '
      '   IN_EMAIL_CRIACAO, '
      '   EMAIL_CRIACAO, '
      '   IN_EMAIL_AUTORIZACAO,'
      '   EMAIL_AUTORIZACAO, '
      '   IN_EMAIL_PRE_AUTORIZACAO,'
      '   EMAIL_PRE_AUTORIZACAO, '
      '   IN_INTEGRA_FORNECIMENTO, '
      '   IN_INTEGRA_PACKING_LIST, '
      '   IN_MODO_SIMPLES, '
      '   IN_RAP_SEQUENCIAL, '
      '   IN_ENVIA_ARQUIVOS, '
      '   IN_MOSTRA_FATURADOS, '
      '   IN_DIVIDE_EMBARCADOS, '
      '   IN_MOSTRA_FOLLOWUP, '
      '   IN_CONFERENCIA, '
      '   IN_ALERTA_E01_NAO_GENERICO, '
      '   IN_PREENCHE_EVENTO_387_COM_021, '
      '   IN_RATEIA_PEDIDO, '
      '   NM_EMAIL_CONTATO_DAILY, '
      '   IN_DESBLOQUEIA_DRAFT, '
      '   TX_LUCRO_ESTIMADO, '
      '   DT_NOVO_FOLLOWUP_IMP, '
      '   DT_NOVO_FOLLOWUP_EXP, '
      '   NM_EMAIL_CONTATO_FOLLOWUP, '
      '   IN_PENDENCIAS, '
      '   IN_PENDENCIAS_EMAIL,'
      '   CD_CC_CONTAS_RECEBER_REDUZIDA, '
      '   CD_CC_DESPACHOS_ANDAMENTO_REDUZIDA, '
      '   CD_CC_DESPACHOS_FATURAR_REDUZIDA, '
      '   IN_EXTRATO_AVERBADO_RESUMIDO,'
      '   IN_EXIGE_CFOP_EXP, '
      '   IN_PLANILHA_CUSTOS,'
      '   EMAIL_AVARIAS, '
      '   NM_EMAIL_CONSULTA_MERCANTE, '
      '   IC_CONSULTA_MERCANTE_TERCEIROS,'
      '   NM_EMAIL_CONSULTA_LI,'
      '   NM_EMAIL_CONSULTA_LI_STATUS,'
      '   CD_TIPO_BASE_SEGURO_DI ,'
      '   PC_SEGURO_MLE_DI ,'
      '   CD_COORDENADOR_IMPO,'
      '   CD_COORDENADOR_EXPO  ,'
      '   IN_STATUS_LI_INCLUIR_CONTATO,'
      '   IN_DI_EXTERNA,'
      '   NM_EMAIL_DRAFT_BL,'
      '   IN_PREENCHE_COMPLEMENTAR_AD, '
      '   CD_GESTOR_CONTAS,'
      '   IN_CONTRATO,'
      '   DT_VIGENCIA_CONTRATO,'
      '   NM_INDICE_REAJUSTE_ACORDADO'
      '   )'
      'VALUES'
      '  (:IN_ENVIA_COMO_TI, '
      '   :CD_GRUPO, '
      '   :NM_GRUPO, '
      '   :DT_INCLUSAO, '
      '   :IN_ATIVO, '
      '   :CNPJ_GRUPO, '
      '   :IN_RATEIO, '
      '   :CD_LAYOUT_BORDERO,'
      '   :IN_OBRIGAR_INVOICE, '
      '   :IN_MARINHA_MERCANTE_ICMS, '
      '   :IN_CONFERE_REFERENCIA, '
      '   :IN_EXIBE_PEDIDO_SITE, '
      '   :NR_REL_FAT_CONSOLIDADO, '
      '   :TP_PEDIDO_BUSCA, '
      '   :TP_PEDIDO_BUSCA_IMP, '
      '   :IN_EMAIL_CRIACAO, '
      '   :EMAIL_CRIACAO, '
      '   :IN_EMAIL_AUTORIZACAO, '
      '   :EMAIL_AUTORIZACAO, '
      '   :IN_EMAIL_PRE_AUTORIZACAO, '
      '   :EMAIL_PRE_AUTORIZACAO, '
      '   :IN_INTEGRA_FORNECIMENTO, '
      '   :IN_INTEGRA_PACKING_LIST, '
      '   :IN_MODO_SIMPLES, '
      '   :IN_RAP_SEQUENCIAL, '
      '   :IN_ENVIA_ARQUIVOS, '
      '   :IN_MOSTRA_FATURADOS, '
      '   :IN_DIVIDE_EMBARCADOS, '
      '   :IN_MOSTRA_FOLLOWUP, '
      '   :IN_CONFERENCIA, '
      '   :IN_ALERTA_E01_NAO_GENERICO, '
      '   :IN_PREENCHE_EVENTO_387_COM_021, '
      '   :IN_RATEIA_PEDIDO, '
      '   :NM_EMAIL_CONTATO_DAILY, '
      '   :IN_DESBLOQUEIA_DRAFT, '
      '   :TX_LUCRO_ESTIMADO, '
      '   :DT_NOVO_FOLLOWUP_IMP, '
      '   :DT_NOVO_FOLLOWUP_EXP, '
      '   :NM_EMAIL_CONTATO_FOLLOWUP, '
      '   :IN_PENDENCIAS, '
      '   :IN_PENDENCIAS_EMAIL,'
      '   :CD_CC_CONTAS_RECEBER_REDUZIDA, '
      '   :ANDAMENTO_REDUZIDA, '
      '   :FATURAR_REDUZIDA, '
      '   :IN_EXTRATO_AVERBADO_RESUMIDO, '
      '   :IN_EXIGE_CFOP_EXP, '
      '   :IN_PLANILHA_CUSTOS,'
      '   :EMAIL_AVARIAS, '
      '   :NM_EMAIL_CONSULTA_MERCANTE,'
      '   :IC_CONSULTA_MERCANTE_TERCEIROS,'
      '   :NM_EMAIL_CONSULTA_LI,'
      '   :NM_EMAIL_CONSULTA_LI_STATUS ,'
      '   :CD_TIPO_BASE_SEGURO_DI ,'
      '   :PC_SEGURO_MLE_DI ,'
      '   :CD_COORDENADOR_IMPO,'
      '   :CD_COORDENADOR_EXPO ,'
      '   :IN_STATUS_LI_INCLUIR_CONTATO,'
      '   :IN_DI_EXTERNA,'
      '   :NM_EMAIL_DRAFT_BL,'
      '   :IN_PREENCHE_COMPLEMENTAR_AD,'
      '   :CD_GESTOR_CONTAS,'
      '   :IN_CONTRATO,'
      '   :DT_VIGENCIA_CONTRATO,'
      '   :NM_INDICE_REAJUSTE_ACORDADO'
      ')')
    DeleteSQL.Strings = (
      'delete from TGRUPO'
      'where'
      '  CD_GRUPO = :OLD_CD_GRUPO')
    Left = 150
    Top = 8
  end
  object qry_Tipo_Referencia: TQuery
    BeforeOpen = qry_Tipo_ReferenciaBeforeOpen
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_REFERENCIA'
      'WHERE CD_REFERENCIA NOT IN (SELECT TP_REFERENCIA'
      '                            FROM TGRUPO_REF_COMPLEM'
      '                            WHERE CD_GRUPO = :CD_GRUPO)'
      'ORDER BY NM_REFERENCIA')
    Left = 524
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
        Size = 3
      end>
    object qry_Tipo_ReferenciaCD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      FixedChar = True
      Size = 2
    end
    object qry_Tipo_ReferenciaNM_REFERENCIA: TStringField
      FieldName = 'NM_REFERENCIA'
      FixedChar = True
      Size = 30
    end
  end
  object ds_Tipo_Referencia: TDataSource
    DataSet = qry_Tipo_Referencia
    Left = 366
    Top = 63
  end
  object ds_Grupo_Ref_Comp_DI: TDataSource
    DataSet = qry_Grupo_Ref_Comp_DI
    Left = 367
    Top = 122
  end
  object qry_Grupo_Ref_Comp_DI: TQuery
    CachedUpdates = True
    BeforeOpen = qry_Tipo_ReferenciaBeforeOpen
    AfterPost = qry_Grupo_Ref_Comp_DIAfterPost
    AfterDelete = qry_Grupo_Ref_Comp_DIAfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT G.*, R.NM_REFERENCIA'
      'FROM TGRUPO_REF_COMPLEM      G'
      
        '   INNER JOIN TTP_REFERENCIA R ON R.CD_REFERENCIA = G.TP_REFEREN' +
        'CIA'
      'WHERE G.CD_GRUPO = :CD_GRUPO'
      'ORDER BY G.NR_ORDEM, R.NM_REFERENCIA')
    UpdateObject = upd_Grupo_Ref_Comp_DI
    Left = 522
    Top = 124
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
        Size = 3
      end>
    object qry_Grupo_Ref_Comp_DICD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TGRUPO_REF_COMPLEM.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_Grupo_Ref_Comp_DITP_REFERENCIA: TStringField
      FieldName = 'TP_REFERENCIA'
      Origin = 'DBBROKER.TGRUPO_REF_COMPLEM.TP_REFERENCIA'
      FixedChar = True
      Size = 2
    end
    object qry_Grupo_Ref_Comp_DINR_ORDEM: TIntegerField
      FieldName = 'NR_ORDEM'
      Origin = 'DBBROKER.TGRUPO_REF_COMPLEM.NR_ORDEM'
    end
    object qry_Grupo_Ref_Comp_DINM_REFERENCIA: TStringField
      FieldName = 'NM_REFERENCIA'
      Origin = 'DBBROKER.TTP_REFERENCIA.NM_REFERENCIA'
      FixedChar = True
      Size = 30
    end
  end
  object upd_Grupo_Ref_Comp_DI: TUpdateSQL
    ModifySQL.Strings = (
      'update TGRUPO_REF_COMPLEM'
      'set'
      '  CD_GRUPO = :CD_GRUPO,'
      '  TP_REFERENCIA = :TP_REFERENCIA,'
      '  NR_ORDEM = :NR_ORDEM'
      'where'
      '  CD_GRUPO = :OLD_CD_GRUPO and'
      '  TP_REFERENCIA = :OLD_TP_REFERENCIA')
    InsertSQL.Strings = (
      'insert into TGRUPO_REF_COMPLEM'
      '  (CD_GRUPO, TP_REFERENCIA, NR_ORDEM)'
      'values'
      '  (:CD_GRUPO, :TP_REFERENCIA, :NR_ORDEM)')
    DeleteSQL.Strings = (
      'delete from TGRUPO_REF_COMPLEM'
      'where'
      '  CD_GRUPO = :OLD_CD_GRUPO and'
      '  TP_REFERENCIA = :OLD_TP_REFERENCIA')
    Left = 655
    Top = 121
  end
  object qry_Despesas: TQuery
    BeforeOpen = qry_Tipo_ReferenciaBeforeOpen
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM'
      'FROM TITEM'
      'WHERE CD_TIPO_ITEM = '#39'D'#39
      '  AND CD_ITEM NOT IN (SELECT CD_ITEM'
      '                      FROM TGRUPO_DESPESAS_BASE_ICMS'
      '                      WHERE CD_GRUPO = :CD_GRUPO)'
      'ORDER BY NM_ITEM')
    Left = 528
    Top = 414
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
        Size = 3
      end>
    object qry_DespesasCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_DespesasNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
  end
  object ds_Despesas: TDataSource
    DataSet = qry_Despesas
    Left = 364
    Top = 417
  end
  object ds_Grupo_Despesas: TDataSource
    DataSet = qry_Grupo_Despesas
    Left = 364
    Top = 476
  end
  object qry_Grupo_Despesas: TQuery
    CachedUpdates = True
    BeforeOpen = qry_Tipo_ReferenciaBeforeOpen
    AfterPost = qry_Grupo_Ref_Comp_DIAfterPost
    AfterDelete = qry_Grupo_Ref_Comp_DIAfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT G.CD_GRUPO, G.CD_ITEM, I.NM_ITEM'
      'FROM TGRUPO_DESPESAS_BASE_ICMS G'
      '   INNER JOIN TITEM I ON I.CD_ITEM = G.CD_ITEM'
      'WHERE G.CD_GRUPO = :CD_GRUPO'
      'ORDER BY I.NM_ITEM')
    UpdateObject = upd_Grupo_Despesas
    Left = 528
    Top = 481
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
        Size = 3
      end>
    object qry_Grupo_DespesasCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TGRUPO_DESPESAS_BASE_ICMS.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_Grupo_DespesasCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TGRUPO_DESPESAS_BASE_ICMS.CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_Grupo_DespesasNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'DBBROKER.TITEM.NM_ITEM'
      FixedChar = True
      Size = 30
    end
  end
  object upd_Grupo_Despesas: TUpdateSQL
    ModifySQL.Strings = (
      'update TGRUPO_DESPESAS_BASE_ICMS'
      'set'
      '  CD_GRUPO = :CD_GRUPO,'
      '  CD_ITEM = :CD_ITEM'
      'where'
      '  CD_GRUPO = :OLD_CD_GRUPO and'
      '  CD_ITEM = :OLD_CD_ITEM')
    InsertSQL.Strings = (
      'insert into TGRUPO_DESPESAS_BASE_ICMS'
      '  (CD_GRUPO, CD_ITEM)'
      'values'
      '  (:CD_GRUPO, :CD_ITEM)')
    DeleteSQL.Strings = (
      'delete from TGRUPO_DESPESAS_BASE_ICMS'
      'where'
      '  CD_GRUPO = :OLD_CD_GRUPO and'
      '  CD_ITEM = :OLD_CD_ITEM')
    Left = 657
    Top = 478
  end
  object dsEmailConsultaLiStatus: TDataSource
    DataSet = cdsEmailConsultaLiStatus
    Left = 660
    Top = 60
  end
  object cdsEmailConsultaLiStatus: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 661
    Top = 60
    object cdsEmailConsultaLiStatusNM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Size = 100
    end
  end
  object dsGrupoReajusteContr: TDataSource
    DataSet = qryGrupoReajusteContr
    Left = 282
    Top = 555
  end
  object updGrupoReajusteContr: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE TGRUPO_REAJUSTE_CONTRATO '
      'SET'
      'DT_PEDIDO_REAJUSTE = :DT_PEDIDO_REAJUSTE,'
      'DT_REAJUSTE_NEGOCIADO = :DT_REAJUSTE_NEGOCIADO,'
      'VL_REAJUSTE_INDICE_APROVADO = :VL_REAJUSTE_INDICE_APROVADO,'
      'DT_REAJUSTE_INICIO_APLICACAO = :DT_REAJUSTE_INICIO_APLICACAO,'
      'DT_VENC_PROXIMO_REAJUSTE = :DT_VENC_PROXIMO_REAJUSTE,'
      'VL_INDICE_REAJUSTE = :VL_INDICE_REAJUSTE'
      'WHERE'
      'CD_REAJUSTE_CONTRATO = :CD_REAJUSTE_CONTRATO AND'
      'CD_GRUPO = :CD_GRUPO')
    InsertSQL.Strings = (
      'INSERT TGRUPO_REAJUSTE_CONTRATO '
      '('
      'CD_GRUPO,'
      'DT_PEDIDO_REAJUSTE,'
      'DT_REAJUSTE_NEGOCIADO,'
      'VL_REAJUSTE_INDICE_APROVADO,'
      'DT_REAJUSTE_INICIO_APLICACAO,'
      'DT_VENC_PROXIMO_REAJUSTE,'
      'VL_INDICE_REAJUSTE'
      ')'
      'VALUES ('
      ':CD_GRUPO,'
      ':DT_PEDIDO_REAJUSTE,'
      ':DT_REAJUSTE_NEGOCIADO,'
      ':VL_REAJUSTE_INDICE_APROVADO,'
      ':DT_REAJUSTE_INICIO_APLICACAO,'
      ':DT_VENC_PROXIMO_REAJUSTE,'
      ':VL_INDICE_REAJUSTE'
      ')')
    DeleteSQL.Strings = (
      'delete from TGRUPO_REAJUSTE_CONTRATO'
      'where'
      '  CD_REAJUSTE_CONTRATO = :OLD_CD_REAJUSTE_CONTRATO AND'
      '  CD_GRUPO = :OLD_CD_GRUPO')
    Left = 162
    Top = 555
  end
  object qryGrupoReajusteContr: TQuery
    CachedUpdates = True
    AfterPost = qryGrupoReajusteContrAfterPost
    AfterDelete = qryGrupoReajusteContrAfterDelete
    OnPostError = qryGrupoReajusteContrPostError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TGRUPO_REAJUSTE_CONTRATO'
      'WHERE CD_GRUPO IN ('#39'XXX'#39', :CD_GRUPO)')
    UpdateObject = updGrupoReajusteContr
    Left = 42
    Top = 555
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_GRUPO'
        ParamType = ptInput
      end>
    object qryGrupoReajusteContrCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
    object qryGrupoReajusteContrDT_PEDIDO_REAJUSTE: TDateTimeField
      DisplayLabel = 'Pedido de Reajuste'
      FieldName = 'DT_PEDIDO_REAJUSTE'
    end
    object qryGrupoReajusteContrDT_REAJUSTE_NEGOCIADO: TDateTimeField
      DisplayLabel = 'Reajuste Negociado'
      FieldName = 'DT_REAJUSTE_NEGOCIADO'
    end
    object qryGrupoReajusteContrVL_INDICE_REAJUSTE: TFloatField
      DisplayLabel = #205'ndice (%)'
      FieldName = 'VL_INDICE_REAJUSTE'
    end
    object qryGrupoReajusteContrVL_REAJUSTE_INDICE_APROVADO: TFloatField
      DisplayLabel = #205'ndice Negociado (%)'
      FieldName = 'VL_REAJUSTE_INDICE_APROVADO'
    end
    object qryGrupoReajusteContrDT_VENC_PROXIMO_REAJUSTE: TDateTimeField
      DisplayLabel = 'Pr'#243'ximo Reajuste'
      FieldName = 'DT_VENC_PROXIMO_REAJUSTE'
    end
    object qryGrupoReajusteContrDT_REAJUSTE_INICIO_APLICACAO: TDateTimeField
      DisplayLabel = 'Aplica'#231#227'o a partir de'
      FieldName = 'DT_REAJUSTE_INICIO_APLICACAO'
    end
    object qryGrupoReajusteContrCD_REAJUSTE_CONTRATO: TIntegerField
      FieldName = 'CD_REAJUSTE_CONTRATO'
    end
  end
end

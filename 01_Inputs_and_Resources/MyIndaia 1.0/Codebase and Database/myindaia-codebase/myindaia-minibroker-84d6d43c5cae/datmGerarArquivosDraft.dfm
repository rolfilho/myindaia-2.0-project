object dtmGerarArquivosDraft: TdtmGerarArquivosDraft
  OldCreateOrder = False
  Height = 702
  Width = 990
  object qryDraftBL_: TFDQuery
    Connection = FireDacMSSQLConnection.Connection
    SQL.Strings = (
      'SET ARITHABORT ON'
      'SET QUOTED_IDENTIFIER ON'
      ''
      'DECLARE @NR_PROCESSO CHAR(18) = :NR_PROCESSO'
      'DECLARE @NR_AMEND INTEGER = :NR_AMEND'
      ''
      'SELECT'
      ' NR_PROCESSO'
      ',NR_AMEND'
      ',DT_CRIACAO'
      ',NM_USUARIO'
      ',DT_ENVIO_DRAFT'
      ',CD_ENVIO_INTTRA'
      ',DS_EMAIL_INDAIA'
      ''
      ',CLIENTE_NOME'
      ',           COALESCE(CLIENTE_ENDERECO, '#39#39') +'
      
        ' '#39' CEP: '#39' + COALESCE(CLIENTE_CEP, '#39#39')      + '#39' - '#39' + COALESCE(CL' +
        'IENTE_CIDADE, '#39#39')+'
      
        '            COALESCE(CLIENTE_ESTADO, '#39#39')   + '#39' - '#39' + COALESCE(CL' +
        'IENTE_PAIS_COD, '#39#39')+'
      
        ' '#39' CNPJ:'#39' + COALESCE(CLIENTE_CNPJ, '#39#39') AS CLIENTE_ENDERECO_COMPL' +
        'ETO'
      ''
      ',AGENTE_NOME'
      ',BOOKING_ARMADOR'
      ''
      ',CONSIG_NOME'
      ',COALESCE(CONSIG_ENDERECO, '#39#39') + '#39' '#39' +'
      ' COALESCE(CONSIG_CEP, '#39#39')      + '#39' '#39' +'
      ' COALESCE(CONSIG_CIDADE, '#39#39')   + '#39' '#39' +'
      ' COALESCE(CONSIG_ESTADO, '#39#39')   + '#39' '#39' +'
      ' COALESCE(CONSIG_PAIS_COD, '#39#39') AS CONSIG_ENDERECO_COMPLETO'
      ''
      ',NOTIFY1_NOME'
      ',COALESCE(NOTIFY1_ENDERECO, '#39#39') + '#39' '#39' +'
      ' COALESCE(NOTIFY1_CEP, '#39#39')      + '#39' '#39' +'
      ' COALESCE(NOTIFY1_CIDADE, '#39#39')   + '#39' '#39' +'
      ' COALESCE(NOTIFY1_ESTADO, '#39#39')   + '#39' '#39' +'
      ' COALESCE(NOTIFY1_PAIS_COD, '#39#39') AS NOTIFY1_ENDERECO_COMPLETO'
      ''
      ',NOTIFY2_NOME'
      ',COALESCE(NOTIFY2_ENDERECO, '#39#39') + '#39' '#39' +'
      ' COALESCE(NOTIFY2_CEP, '#39#39')      + '#39' '#39' +'
      ' COALESCE(NOTIFY2_CIDADE, '#39#39')   + '#39' '#39' +'
      ' COALESCE(NOTIFY2_ESTADO, '#39#39')   + '#39' '#39' +'
      ' COALESCE(NOTIFY2_PAIS_COD, '#39#39') AS NOTIFY2_ENDERECO_COMPLETO'
      ''
      ',CASE WHEN IN_PGMTO_ABROAD = 1'
      '      THEN '#39'Abroad'#39
      '      ELSE FR.DESCRICAO'
      ' END           AS DS_COLLECT_PREPAID'
      ',NM_LOCAL_PGMTO_TAXAS'
      ',TX.DESCRICAO  AS DS_TAXAS'
      ',MOV.DESCRICAO AS DS_MOVIMENTO'
      
        ',COALESCE(NM_NAVIO, '#39#39') + '#39' '#39' + COALESCE(NR_VIAGEM, '#39#39') AS VIAGE' +
        'M_NAVIO'
      ',LOCAL_EMBARQUE'
      
        ',COALESCE(LOCAL_DESEMBARQUE, '#39#39') + '#39' '#39' + COALESCE(LOCAL_DESEMBAR' +
        'QUE_PAIS_COD, '#39#39') AS  LOCAL_DESEMBARQUE'
      ''
      
        ','#39'Forwarder'#39#39's Reference Number : '#39'+ substring(NR_PROCESSO, 5,13' +
        ') AS REFERENCIA_INDAIA'
      
        ','#39'Shipper'#8217's Reference Number  : '#39'+ REFERENCIA_EMBARQUE AS REFERE' +
        'NCIA_EMBARQUE'
      ','#39'Exporter'#8217's Reference Number (RUC Number) : '#39'+ CD_RUC AS CD_RUC'
      ',COMENTARIOS.COMENTARIO'
      ',CNTRS.QT_CNTR'
      ',MERCADORIAS.QT_EMBALAGENS'
      ',MERCADORIAS.QT_PESO'
      ',MERCADORIAS.VL_CUBAGEM'
      'FROM TPROCESSO_DRAFT_BL        BL  (NOLOCK)'
      
        'JOIN TUSUARIO                  U   (NOLOCK) ON U.CD_USUARIO     ' +
        '       = BL.CD_USUARIO_CRIACAO'
      
        'LEFT JOIN TTP_MOVIMENTO_INTTRA MOV (NOLOCK) ON MOV.CD_MOVIMENTO_' +
        'INTTRA = BL.CD_TIPO_MOVIMENTO'
      
        'LEFT JOIN TTP_FRETE            FR  (NOLOCK) ON FR.CODIGO        ' +
        '       = BL.CD_COLLECT_PREPAID'
      
        'LEFT JOIN TTP_TAXAS_INTTRA     TX  (NOLOCK) ON TX.CD_TAXA_INTTRA' +
        '       = BL.CD_TIPO_PGMTO_TAXAS'
      ''
      'OUTER APPLY ('
      'SELECT STUFF(('
      
        #9#9#9'SELECT CHAR(13) + CHAR(10) + LTRIM(RTRIM(CASE WHEN COALESCE(D' +
        'S_COMENTARIO, '#39#39') <> '#39#39
      
        #9#9#9'                                              THEN DS_COMENTA' +
        'RIO'
      
        #9#9#9'                                              ELSE T.DESCRICA' +
        'O'
      #9#9#9'                                          END))'
      #9#9#9'  FROM TPROCESSO_DRAFT_COMENTARIOS C (NOLOCK)'
      
        #9#9#9'  JOIN TTP_COMENTARIOS_INTTRA      T (NOLOCK) ON T.CD_COMENTA' +
        'RIO_INNTRA = C.CD_TP_COMENTARIO'
      
        #9#9#9'/*SEGUNDO O MANUAL, S'#211' PRECISAMOS INFORMAR O TIPO DO COMENTAR' +
        'IO QUANDO QUISERMOS QUE ESSE COMENTARIO SEJA IMPRESSO NO BL'
      
        #9#9#9'  ENT'#195'O, UM JOIN AQUI, SIGNIFICA QUE ESSE COMENTARIO TEM TIPO' +
        ' E VAI APARECER NO BL'
      #9#9#9'  PAGINA 33 DO MANUAL DO INTTRA'
      ''
      
        #9#9#9'  ALEM DISSO, SE INFORMARMOS O TIPO, PODEMOS ESCREVER UM COME' +
        'NTARIO OU USAR A DESCRI'#199#195'O PADRAO.'
      #9#9#9'  POR ISSO O COALESCE.'
      #9#9#9'*/'
      #9#9#9'WHERE C.NR_PROCESSO = BL.NR_PROCESSO'
      #9#9#9'  AND C.NR_AMEND    = BL.NR_AMEND'
      #9#9#9'ORDER BY NR_COMENTARIO'
      #9#9'  FOR XML PATH('#39#39'), TYPE).value('#39'.'#39','#39'varchar(2000)'#39')'
      #9#9',1,2,'#39#39') AS COMENTARIO'
      ') COMENTARIOS'
      ''
      'OUTER APPLY ('
      'SELECT COUNT(*) AS QT_CNTR'
      '  FROM TPROCESSO_DRAFT_CNTR CNTR (NOLOCK)'
      ' WHERE CNTR.NR_PROCESSO = BL.NR_PROCESSO'
      '   AND CNTR.NR_AMEND    = BL.NR_AMEND'
      ') CNTRS'
      ''
      'OUTER APPLY ('
      'SELECT SUM(QT_EMBALAGEM)  AS QT_EMBALAGENS'
      '      ,SUM(QT_PESO_BRUTO) AS QT_PESO'
      '      ,SUM(VL_CUBAGEM)    AS VL_CUBAGEM'
      '  FROM TPROCESSO_DRAFT_MERC CNTR (NOLOCK)'
      ' WHERE CNTR.NR_PROCESSO = BL.NR_PROCESSO'
      '   AND CNTR.NR_AMEND    = BL.NR_AMEND'
      ') MERCADORIAS'
      ''
      'WHERE NR_PROCESSO =@NR_PROCESSO'
      'AND NR_AMEND = @NR_AMEND')
    Left = 32
    Top = 24
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'NR_AMEND'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryDraftBL_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryDraftBL_NR_AMEND: TIntegerField
      FieldName = 'NR_AMEND'
      Origin = 'NR_AMEND'
      Required = True
    end
    object qryDraftBL_DT_CRIACAO: TSQLTimeStampField
      FieldName = 'DT_CRIACAO'
      Origin = 'DT_CRIACAO'
    end
    object qryDraftBL_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'NM_USUARIO'
      Required = True
      FixedChar = True
      Size = 50
    end
    object qryDraftBL_DT_ENVIO_DRAFT: TSQLTimeStampField
      FieldName = 'DT_ENVIO_DRAFT'
      Origin = 'DT_ENVIO_DRAFT'
    end
    object qryDraftBL_CD_ENVIO_INTTRA: TStringField
      FieldName = 'CD_ENVIO_INTTRA'
      Origin = 'CD_ENVIO_INTTRA'
      Size = 15
    end
    object qryDraftBL_DS_EMAIL_INDAIA: TStringField
      FieldName = 'DS_EMAIL_INDAIA'
      Origin = 'DS_EMAIL_INDAIA'
      Size = 100
    end
    object qryDraftBL_CLIENTE_NOME: TStringField
      FieldName = 'CLIENTE_NOME'
      Origin = 'CLIENTE_NOME'
      Size = 80
    end
    object qryDraftBL_CLIENTE_ENDERECO_COMPLETO: TStringField
      FieldName = 'CLIENTE_ENDERECO_COMPLETO'
      Origin = 'CLIENTE_ENDERECO_COMPLETO'
      ReadOnly = True
      Size = 128
    end
    object qryDraftBL_AGENTE_NOME: TStringField
      FieldName = 'AGENTE_NOME'
      Origin = 'AGENTE_NOME'
      Size = 60
    end
    object qryDraftBL_BOOKING_ARMADOR: TStringField
      FieldName = 'BOOKING_ARMADOR'
      Origin = 'BOOKING_ARMADOR'
      Size = 35
    end
    object qryDraftBL_CONSIG_NOME: TStringField
      FieldName = 'CONSIG_NOME'
      Origin = 'CONSIG_NOME'
      Size = 100
    end
    object qryDraftBL_CONSIG_ENDERECO_COMPLETO: TStringField
      FieldName = 'CONSIG_ENDERECO_COMPLETO'
      Origin = 'CONSIG_ENDERECO_COMPLETO'
      ReadOnly = True
      Size = 174
    end
    object qryDraftBL_NOTIFY1_NOME: TStringField
      FieldName = 'NOTIFY1_NOME'
      Origin = 'NOTIFY1_NOME'
      Size = 100
    end
    object qryDraftBL_NOTIFY1_ENDERECO_COMPLETO: TStringField
      FieldName = 'NOTIFY1_ENDERECO_COMPLETO'
      Origin = 'NOTIFY1_ENDERECO_COMPLETO'
      ReadOnly = True
      Size = 174
    end
    object qryDraftBL_NOTIFY2_NOME: TStringField
      FieldName = 'NOTIFY2_NOME'
      Origin = 'NOTIFY2_NOME'
      Size = 100
    end
    object qryDraftBL_NOTIFY2_ENDERECO_COMPLETO: TStringField
      FieldName = 'NOTIFY2_ENDERECO_COMPLETO'
      Origin = 'NOTIFY2_ENDERECO_COMPLETO'
      ReadOnly = True
      Size = 174
    end
    object qryDraftBL_DS_COLLECT_PREPAID: TStringField
      FieldName = 'DS_COLLECT_PREPAID'
      Origin = 'DS_COLLECT_PREPAID'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object qryDraftBL_NM_LOCAL_PGMTO_TAXAS: TStringField
      FieldName = 'NM_LOCAL_PGMTO_TAXAS'
      Origin = 'NM_LOCAL_PGMTO_TAXAS'
      Size = 100
    end
    object qryDraftBL_DS_TAXAS: TStringField
      FieldName = 'DS_TAXAS'
      Origin = 'DS_TAXAS'
      Size = 50
    end
    object qryDraftBL_DS_MOVIMENTO: TStringField
      FieldName = 'DS_MOVIMENTO'
      Origin = 'DS_MOVIMENTO'
      Size = 10
    end
    object qryDraftBL_VIAGEM_NAVIO: TStringField
      FieldName = 'VIAGEM_NAVIO'
      Origin = 'VIAGEM_NAVIO'
      ReadOnly = True
      Size = 56
    end
    object qryDraftBL_LOCAL_EMBARQUE: TStringField
      FieldName = 'LOCAL_EMBARQUE'
      Origin = 'LOCAL_EMBARQUE'
      Size = 50
    end
    object qryDraftBL_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'LOCAL_DESEMBARQUE'
      Origin = 'LOCAL_DESEMBARQUE'
      ReadOnly = True
      Size = 53
    end
    object qryDraftBL_REFERENCIA_INDAIA: TStringField
      FieldName = 'REFERENCIA_INDAIA'
      Origin = 'REFERENCIA_INDAIA'
      ReadOnly = True
      Size = 44
    end
    object qryDraftBL_REFERENCIA_EMBARQUE: TStringField
      FieldName = 'REFERENCIA_EMBARQUE'
      Origin = 'REFERENCIA_EMBARQUE'
      ReadOnly = True
      Size = 65
    end
    object qryDraftBL_CD_RUC: TStringField
      FieldName = 'CD_RUC'
      Origin = 'CD_RUC'
      ReadOnly = True
      Size = 78
    end
    object qryDraftBL_COMENTARIO: TStringField
      FieldName = 'COMENTARIO'
      Origin = 'COMENTARIO'
      ReadOnly = True
      Size = 1999
    end
    object qryDraftBL_QT_CNTR: TIntegerField
      FieldName = 'QT_CNTR'
      Origin = 'QT_CNTR'
      ReadOnly = True
    end
    object qryDraftBL_QT_EMBALAGENS: TIntegerField
      FieldName = 'QT_EMBALAGENS'
      Origin = 'QT_EMBALAGENS'
      ReadOnly = True
    end
    object qryDraftBL_QT_PESO: TFMTBCDField
      FieldName = 'QT_PESO'
      Origin = 'QT_PESO'
      ReadOnly = True
      Precision = 38
      Size = 3
    end
    object qryDraftBL_VL_CUBAGEM: TFMTBCDField
      FieldName = 'VL_CUBAGEM'
      Origin = 'VL_CUBAGEM'
      ReadOnly = True
      Precision = 38
      Size = 4
    end
  end
  object dspDraftBL_: TDataSetProvider
    DataSet = qryDraftBL_
    Left = 32
    Top = 72
  end
  object cdsDraftBL_: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDraftBL'
    Left = 30
    Top = 125
    object cdsDraftBL_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsDraftBL_NR_AMEND: TIntegerField
      FieldName = 'NR_AMEND'
      Required = True
    end
    object cdsDraftBL_DT_CRIACAO: TSQLTimeStampField
      FieldName = 'DT_CRIACAO'
    end
    object cdsDraftBL_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Required = True
      FixedChar = True
      Size = 50
    end
    object cdsDraftBL_DT_ENVIO_DRAFT: TSQLTimeStampField
      FieldName = 'DT_ENVIO_DRAFT'
    end
    object cdsDraftBL_CD_ENVIO_INTTRA: TStringField
      FieldName = 'CD_ENVIO_INTTRA'
      Size = 15
    end
    object cdsDraftBL_DS_EMAIL_INDAIA: TStringField
      FieldName = 'DS_EMAIL_INDAIA'
      Size = 100
    end
    object cdsDraftBL_CLIENTE_NOME: TStringField
      FieldName = 'CLIENTE_NOME'
      Size = 80
    end
    object cdsDraftBL_CLIENTE_ENDERECO_COMPLETO: TStringField
      FieldName = 'CLIENTE_ENDERECO_COMPLETO'
      ReadOnly = True
      Size = 128
    end
    object cdsDraftBL_AGENTE_NOME: TStringField
      FieldName = 'AGENTE_NOME'
      Size = 60
    end
    object cdsDraftBL_BOOKING_ARMADOR: TStringField
      FieldName = 'BOOKING_ARMADOR'
      Size = 35
    end
    object cdsDraftBL_CONSIG_NOME: TStringField
      FieldName = 'CONSIG_NOME'
      Size = 100
    end
    object cdsDraftBL_CONSIG_ENDERECO_COMPLETO: TStringField
      FieldName = 'CONSIG_ENDERECO_COMPLETO'
      ReadOnly = True
      Size = 174
    end
    object cdsDraftBL_NOTIFY1_NOME: TStringField
      FieldName = 'NOTIFY1_NOME'
      Size = 100
    end
    object cdsDraftBL_NOTIFY1_ENDERECO_COMPLETO: TStringField
      FieldName = 'NOTIFY1_ENDERECO_COMPLETO'
      ReadOnly = True
      Size = 174
    end
    object cdsDraftBL_NOTIFY2_NOME: TStringField
      FieldName = 'NOTIFY2_NOME'
      Size = 100
    end
    object cdsDraftBL_NOTIFY2_ENDERECO_COMPLETO: TStringField
      FieldName = 'NOTIFY2_ENDERECO_COMPLETO'
      ReadOnly = True
      Size = 174
    end
    object cdsDraftBL_DS_COLLECT_PREPAID: TStringField
      FieldName = 'DS_COLLECT_PREPAID'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object cdsDraftBL_NM_LOCAL_PGMTO_TAXAS: TStringField
      FieldName = 'NM_LOCAL_PGMTO_TAXAS'
      Size = 100
    end
    object cdsDraftBL_DS_TAXAS: TStringField
      FieldName = 'DS_TAXAS'
      Size = 50
    end
    object cdsDraftBL_DS_MOVIMENTO: TStringField
      FieldName = 'DS_MOVIMENTO'
      Size = 10
    end
    object cdsDraftBL_VIAGEM_NAVIO: TStringField
      FieldName = 'VIAGEM_NAVIO'
      ReadOnly = True
      Size = 56
    end
    object cdsDraftBL_LOCAL_EMBARQUE: TStringField
      FieldName = 'LOCAL_EMBARQUE'
      Size = 50
    end
    object cdsDraftBL_LOCAL_DESEMBARQUE: TStringField
      FieldName = 'LOCAL_DESEMBARQUE'
      ReadOnly = True
      Size = 53
    end
    object cdsDraftBL_REFERENCIA_INDAIA: TStringField
      FieldName = 'REFERENCIA_INDAIA'
      ReadOnly = True
      Size = 44
    end
    object cdsDraftBL_REFERENCIA_EMBARQUE: TStringField
      FieldName = 'REFERENCIA_EMBARQUE'
      ReadOnly = True
      Size = 65
    end
    object cdsDraftBL_CD_RUC: TStringField
      FieldName = 'CD_RUC'
      ReadOnly = True
      Size = 78
    end
    object cdsDraftBL_COMENTARIO: TStringField
      FieldName = 'COMENTARIO'
      ReadOnly = True
      Size = 1999
    end
    object cdsDraftBL_QT_CNTR: TIntegerField
      FieldName = 'QT_CNTR'
      ReadOnly = True
    end
    object cdsDraftBL_QT_EMBALAGENS: TIntegerField
      FieldName = 'QT_EMBALAGENS'
      ReadOnly = True
    end
    object cdsDraftBL_QT_PESO: TFMTBCDField
      FieldName = 'QT_PESO'
      ReadOnly = True
      Precision = 38
      Size = 3
    end
    object cdsDraftBL_VL_CUBAGEM: TFMTBCDField
      FieldName = 'VL_CUBAGEM'
      ReadOnly = True
      Precision = 38
      Size = 4
    end
  end
  object dsDraftBL_: TDataSource
    DataSet = cdsDraftBL_
    Left = 30
    Top = 181
  end
  object dsDraftBLItens_: TDataSource
    DataSet = cdsDraftBLItens_
    Left = 112
    Top = 181
  end
  object cdsDraftBLItens_: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDraftBLItens'
    Left = 112
    Top = 125
    object cdsDraftBLItens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsDraftBLItens_NR_AMEND: TIntegerField
      FieldName = 'NR_AMEND'
      Required = True
    end
    object cdsDraftBLItens_NR_ITEM: TIntegerField
      FieldName = 'NR_ITEM'
      Required = True
    end
    object cdsDraftBLItens_MERCADORIA: TStringField
      FieldName = 'MERCADORIA'
      ReadOnly = True
      Size = 220
    end
    object cdsDraftBLItens_EMBALAGEM: TStringField
      FieldName = 'EMBALAGEM'
      ReadOnly = True
      Size = 73
    end
    object cdsDraftBLItens_TIPO_EMBALAGEM: TStringField
      FieldName = 'TIPO_EMBALAGEM'
      ReadOnly = True
      Size = 28
    end
    object cdsDraftBLItens_MARCACAO_VOLUMES: TStringField
      FieldName = 'MARCACAO_VOLUMES'
      ReadOnly = True
      Size = 1000
    end
    object cdsDraftBLItens_VL_CUBAGEM_MERC: TBCDField
      FieldName = 'VL_CUBAGEM_MERC'
      Precision = 15
    end
    object cdsDraftBLItens_VL_EMBALAGEM_MERC: TIntegerField
      FieldName = 'VL_EMBALAGEM_MERC'
    end
    object cdsDraftBLItens_VL_PESO_BRUTO_MERC: TBCDField
      FieldName = 'VL_PESO_BRUTO_MERC'
      Precision = 15
      Size = 3
    end
    object cdsDraftBLItens_DESCRICAO_CONTRAINER: TStringField
      DisplayWidth = 300
      FieldName = 'DESCRICAO_CONTRAINER'
      ReadOnly = True
      Size = 300
    end
    object cdsDraftBLItens_NR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      ReadOnly = True
    end
  end
  object dspDraftBLItens_: TDataSetProvider
    DataSet = qryDraftBLItens_
    Left = 112
    Top = 72
  end
  object qryDraftBLItens_: TFDQuery
    Connection = FireDacMSSQLConnection.Connection
    SQL.Strings = (
      'SET ARITHABORT ON'
      'SET QUOTED_IDENTIFIER ON '
      ''
      'DECLARE @NR_PROCESSO CHAR(18) = :NR_PROCESSO'
      'DECLARE @NR_AMEND INTEGER = :NR_AMEND'
      ''
      'SELECT'
      ' NR_PROCESSO'
      ',NR_AMEND'
      ',NR_ITEM'
      
        ',CASE WHEN NR_LINHA_MERCADORIA = 1 THEN MERCADORIA      ELSE '#39#39' ' +
        'END AS MERCADORIA /*S'#211' IMPRIMIR A MERCADORIA 1X POR CONTAINER*/'
      
        ',CASE WHEN NR_LINHA_MERCADORIA = 1 THEN EMBALAGEM       ELSE '#39#39' ' +
        'END AS EMBALAGEM /*S'#211' IMPRIMIR A EMBALAGEM 1X POR CONTAINER*/'
      
        ',CASE WHEN NR_LINHA_MERCADORIA = 1 THEN TIPO_EMBALAGEM  ELSE '#39#39' ' +
        'END AS TIPO_EMBALAGEM '
      ',MARCACAO_VOLUMES'
      ',VL_CUBAGEM_MERC'
      ',VL_EMBALAGEM_MERC'
      ',VL_PESO_BRUTO_MERC'
      ''
      ' ,NR_CNTR'
      ',LTRIM(RTRIM('
      ' CNTR_DESCRICAO   + CHAR(13) + CHAR(10) +'
      ' CNTR_REFERENCIAS + CHAR(13) + CHAR(10) +'
      ' CNTR_TEMPERATURA + CHAR(13) + CHAR(10) +'
      ' CNTR_TARA)) AS DESCRICAO_CONTRAINER'
      ''
      ''
      ' FROM ('
      'SELECT '
      
        ' ROW_NUMBER() OVER(PARTITION BY DRAFT.NR_PROCESSO, DRAFT.NR_AMEN' +
        'D, MERC.NR_ITEM ORDER BY MERC.NR_ITEM) AS NR_LINHA_MERCADORIA'
      ',DRAFT.NR_PROCESSO'
      ',DRAFT.NR_AMEND'
      ',MERC.NR_ITEM'
      ''
      
        ',COALESCE(MERC.DS_MERCADORIA, '#39#39') +'#39' '#39'+ CHAR(13) + CHAR(10) +'#39' N' +
        'CM: '#39' + COALESCE(MERC.CD_NCM, '#39#39') AS MERCADORIA'
      
        ',CAST(COALESCE(MERC.QT_EMBALAGEM, 0) AS VARCHAR(20))  +'#39' '#39'+ CHAR' +
        '(13) + CHAR(10) + COALESCE(MERC.DS_EMBALAGEM, '#39#39') AS EMBALAGEM'
      ''
      ',CASE WHEN MERC.NR_ITEM = 1'
      '      THEN DRAFT.MARCACAO_VOLUMES '
      '      ELSE '#39#39' '
      ' END AS MARCACAO_VOLUMES /*imprimir s'#243' no primeiro item*/'
      ',CNTR.NR_CNTR'
      ',CNTR.VL_CUBAGEM_MERC'
      ',CNTR.VL_EMBALAGEM_MERC'
      ',CNTR.VL_PESO_BRUTO_MERC'
      ',CNTR.CNTR_DESCRICAO'
      ',CNTR.CNTR_REFERENCIAS'
      ',CNTR.CNTR_TEMPERATURA'
      ',CNTR.CNTR_TARA'
      
        ','#39'('#39' + CAST(MERC.QT_EMBALAGEM AS VARCHAR(20)) +'#39') Outer'#39' AS TIPO' +
        '_EMBALAGEM'
      ' '
      'FROM TPROCESSO_DRAFT_BL    DRAFT (NOLOCK)'
      
        'JOIN TPROCESSO_DRAFT_MERC  MERC  (NOLOCK) ON MERC.NR_PROCESSO = ' +
        'DRAFT.NR_PROCESSO'
      
        '                                         AND MERC.NR_AMEND    = ' +
        'DRAFT.NR_AMEND'
      'OUTER APPLY ('
      'SELECT  MC.VL_CUBAGEM    AS VL_CUBAGEM_MERC'
      '       ,MC.QT_EMBALAGEM  AS VL_EMBALAGEM_MERC'
      '       ,MC.QT_PESO_BRUTO AS VL_PESO_BRUTO_MERC'
      '       ,RTRIM(MC.NR_CNTR) AS NR_CNTR'
      '      '
      '       ,/*RTRIM(MC.NR_CNTR) + */'
      '        '#39' Container Type '#39' +'
      '        COALESCE(C.NM_TP_CNTR,'#39#39') + '
      '        COALESCE('#39' ('#39'+C.CD_ISO+'#39') '#39','#39#39') AS CNTR_DESCRICAO'
      '       '
      '       ,'#39'Container References Seal Numbers '#39' +              '
      '         CASE WHEN COALESCE(C.NR_LACRE, '#39#39') = '#39#39' '
      '              THEN '#39#39' '
      
        '              ELSE CHAR(13) + CHAR(10) + C.NR_LACRE + '#39' (Carrier' +
        ' Seal #) '#39
      '         END +     '
      '         CASE WHEN COALESCE(C.NR_LACRE_SIF, '#39#39') = '#39#39' '
      '              THEN '#39#39' '
      
        '              ELSE CHAR(13) + CHAR(10) + C.NR_LACRE_SIF + '#39' (Cus' +
        'toms Seal #) '#39' '
      '         END  AS CNTR_REFERENCIAS'
      '        '
      
        '       ,COALESCE('#39'Reefer Details Reefer Temperature :'#39' + C.DS_TE' +
        'MPERATURA + '#39' Centigrade '#39','#39#39') AS CNTR_TEMPERATURA'
      '       '
      
        '       ,COALESCE('#39'Container Tare Weight: '#39' +CAST(CAST(C.TARA_CNT' +
        'R AS DECIMAL(15,3)) AS VARCHAR(18)), '#39#39') AS CNTR_TARA'
      
        '      -- CAST(CAST(C.VL_CUBAGEM AS DECIMAL(15,3)) AS VARCHAR(18)' +
        ') AS CNTR_CUBAGEM'
      '       '
      '  FROM TPROCESSO_DRAFT_MERC_CNTR MC (NOLOCK)'
      
        '  JOIN TPROCESSO_DRAFT_CNTR      C  (NOLOCK) ON C.NR_PROCESSO = ' +
        'MC.NR_PROCESSO'
      
        '                                            AND C.NR_AMEND    = ' +
        'MC.NR_AMEND'
      
        '                                            AND C.NR_CNTR     = ' +
        'MC.NR_CNTR'
      ' WHERE MC.NR_PROCESSO = MERC.NR_PROCESSO'
      '   AND MC.NR_AMEND    = MERC.NR_AMEND '
      
        '   AND MC.NR_ITEM     = MERC.NR_ITEM                            ' +
        '                   '
      ') AS CNTR'
      ''
      'WHERE DRAFT.NR_PROCESSO = @NR_PROCESSO'
      '  AND DRAFT.NR_AMEND    = @NR_AMEND'
      ') MERCS'
      'ORDER BY NR_ITEM')
    Left = 112
    Top = 24
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Name = 'NR_AMEND'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryDraftBLItens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryDraftBLItens_NR_AMEND: TIntegerField
      FieldName = 'NR_AMEND'
      Origin = 'NR_AMEND'
      Required = True
    end
    object qryDraftBLItens_NR_ITEM: TIntegerField
      FieldName = 'NR_ITEM'
      Origin = 'NR_ITEM'
      Required = True
    end
    object qryDraftBLItens_MERCADORIA: TStringField
      FieldName = 'MERCADORIA'
      Origin = 'MERCADORIA'
      ReadOnly = True
      Size = 220
    end
    object qryDraftBLItens_EMBALAGEM: TStringField
      FieldName = 'EMBALAGEM'
      Origin = 'EMBALAGEM'
      ReadOnly = True
      Size = 73
    end
    object qryDraftBLItens_TIPO_EMBALAGEM: TStringField
      FieldName = 'TIPO_EMBALAGEM'
      Origin = 'TIPO_EMBALAGEM'
      ReadOnly = True
      Size = 28
    end
    object qryDraftBLItens_MARCACAO_VOLUMES: TStringField
      FieldName = 'MARCACAO_VOLUMES'
      Origin = 'MARCACAO_VOLUMES'
      ReadOnly = True
      Size = 1000
    end
    object qryDraftBLItens_VL_CUBAGEM_MERC: TBCDField
      FieldName = 'VL_CUBAGEM_MERC'
      Origin = 'VL_CUBAGEM_MERC'
      Precision = 15
    end
    object qryDraftBLItens_VL_EMBALAGEM_MERC: TIntegerField
      FieldName = 'VL_EMBALAGEM_MERC'
      Origin = 'VL_EMBALAGEM_MERC'
    end
    object qryDraftBLItens_VL_PESO_BRUTO_MERC: TBCDField
      FieldName = 'VL_PESO_BRUTO_MERC'
      Origin = 'VL_PESO_BRUTO_MERC'
      Precision = 15
      Size = 3
    end
    object qryDraftBLItens_DESCRICAO_CONTRAINER: TStringField
      DisplayWidth = 300
      FieldName = 'DESCRICAO_CONTRAINER'
      Origin = 'DESCRICAO_CONTRAINER'
      ReadOnly = True
      Size = 300
    end
    object qryDraftBLItens_NR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      Origin = 'NR_CNTR'
      ReadOnly = True
    end
  end
  object qryComentarios: TFDQuery
    Connection = FireDacMSSQLConnection.Connection
    SQL.Strings = (
      'SELECT '
      ' NR_PROCESSO'
      ',NR_AMEND'
      ',NR_COMENTARIO'
      ',CD_TP_COMENTARIO'
      ',CASE WHEN ISNULL(DS_COMENTARIO, '#39#39') <> '#39#39
      '      THEN ISNULL(DS_COMENTARIO, '#39#39')'
      '      ELSE TP.DESCRICAO'
      ' END AS DS_COMENTARIO'
      'FROM TPROCESSO_DRAFT_COMENTARIOS C (NOLOCK)'
      
        'LEFT JOIN TTP_COMENTARIOS_INTTRA TP (NOLOCK) ON TP.CD_COMENTARIO' +
        '_INNTRA = C.CD_TP_COMENTARIO'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND NR_AMEND    = :NR_AMEND'
      'ORDER BY NR_COMENTARIO')
    Left = 315
    Top = 141
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Value = '0102EM-009318-19'
      end
      item
        Name = 'NR_AMEND'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
    object qryComentariosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryComentariosNR_AMEND: TIntegerField
      FieldName = 'NR_AMEND'
      Origin = 'NR_AMEND'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryComentariosNR_COMENTARIO: TIntegerField
      FieldName = 'NR_COMENTARIO'
      Origin = 'NR_COMENTARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryComentariosCD_TP_COMENTARIO: TStringField
      FieldName = 'CD_TP_COMENTARIO'
      Origin = 'CD_TP_COMENTARIO'
      FixedChar = True
      Size = 2
    end
    object qryComentariosDS_COMENTARIO: TStringField
      FieldName = 'DS_COMENTARIO'
      Origin = 'DS_COMENTARIO'
      ReadOnly = True
      Size = 130
    end
  end
  object qryContainer: TFDQuery
    Connection = FireDacMSSQLConnection.Connection
    SQL.Strings = (
      'SELECT   CNTR.NR_PROCESSO'
      '       , RTRIM(CNTR.NR_CNTR) NR_CNTR'
      '       , RTRIM(CNTR.NR_LACRE) NR_LACRE'
      '       , RTRIM(CNTR.NR_LACRE_SIF) NR_LACRE_SIF'
      '       , CNTR.NM_TP_CNTR'
      '       , CNTR.CD_ISO'
      '       , CNTR.DS_TEMPERATURA'
      '       , CNTR.TARA_CNTR'
      '       , CNTR.VL_CUBAGEM'#9'   '
      '       , CNTR.DS_CARGA'
      '       , CNTR.CD_NCM'
      '       , CNTR.CD_EMBALAGEM'
      '       , CNTR.DS_EMBALAGEM'
      '       , CNTR.QT_EMBALAGEM'
      '       , CNTR.QT_PESO_BRUTO'
      'FROM TPROCESSO_DRAFT_CNTR CNTR (NOLOCK)'
      'WHERE CNTR.NR_PROCESSO = :NR_PROCESSO'
      '  AND CNTR.NR_AMEND    = :NR_AMEND')
    Left = 315
    Top = 85
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Value = '0102EM-009318-19'
      end
      item
        Name = 'NR_AMEND'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
    object qryContainerNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryContainerNR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      Origin = 'NR_CNTR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryContainerNR_LACRE: TStringField
      FieldName = 'NR_LACRE'
      Origin = 'NR_LACRE'
      ReadOnly = True
    end
    object qryContainerNR_LACRE_SIF: TStringField
      FieldName = 'NR_LACRE_SIF'
      Origin = 'NR_LACRE_SIF'
      ReadOnly = True
      Size = 11
    end
    object qryContainerNM_TP_CNTR: TStringField
      FieldName = 'NM_TP_CNTR'
      Origin = 'NM_TP_CNTR'
    end
    object qryContainerCD_ISO: TStringField
      FieldName = 'CD_ISO'
      Origin = 'CD_ISO'
      FixedChar = True
      Size = 4
    end
    object qryContainerDS_TEMPERATURA: TStringField
      FieldName = 'DS_TEMPERATURA'
      Origin = 'DS_TEMPERATURA'
      Size = 6
    end
    object qryContainerTARA_CNTR: TBCDField
      FieldName = 'TARA_CNTR'
      Origin = 'TARA_CNTR'
      Precision = 15
      Size = 3
    end
    object qryContainerVL_CUBAGEM: TBCDField
      FieldName = 'VL_CUBAGEM'
      Origin = 'VL_CUBAGEM'
      Precision = 15
    end
    object qryContainerDS_CARGA: TMemoField
      FieldName = 'DS_CARGA'
      Origin = 'DS_CARGA'
      BlobType = ftMemo
      Size = 2147483647
    end
    object qryContainerCD_NCM: TStringField
      FieldName = 'CD_NCM'
      Origin = 'CD_NCM'
      FixedChar = True
      Size = 11
    end
    object qryContainerCD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'CD_EMBALAGEM'
      FixedChar = True
      Size = 3
    end
    object qryContainerDS_EMBALAGEM: TStringField
      FieldName = 'DS_EMBALAGEM'
      Origin = 'DS_EMBALAGEM'
      Size = 50
    end
    object qryContainerQT_EMBALAGEM: TIntegerField
      FieldName = 'QT_EMBALAGEM'
      Origin = 'QT_EMBALAGEM'
    end
    object qryContainerQT_PESO_BRUTO: TBCDField
      FieldName = 'QT_PESO_BRUTO'
      Origin = 'QT_PESO_BRUTO'
      Precision = 15
      Size = 3
    end
  end
  object qryDraft: TFDQuery
    Connection = FireDacMSSQLConnection.Connection
    SQL.Strings = (
      'SELECT   P.NR_PROCESSO'
      '        , REF.CD_REFERENCIA'
      '        , P.NR_AMEND'
      '        , P.CD_RUC'
      '        , P.DS_EMAIL_INDAIA'
      '        , P.CLIENTE_NOME'
      '        , P.CLIENTE_ENDERECO'
      '        , P.CLIENTE_CIDADE'
      '        , P.CLIENTE_CEP'
      '        , P.CLIENTE_ESTADO'
      '        , P.CLIENTE_PAIS_COD'
      '        , P.CLIENTE_CNPJ'
      '        , P.CLIENTE_ENDERECO + '#39' '#39' +'
      #9#9'  P.CLIENTE_CEP + '#39' - '#39' +'
      #9#9'  P.CLIENTE_CIDADE  + '#39' - '#39' +'
      #9#9'  P.CLIENTE_ESTADO  + '#39' - '#39' +'
      #9#9'  P.CLIENTE_PAIS_COD'
      #9#9'  AS CLIENTE_END_COMPLETO'
      '        , P.AGENTE_NOME'
      '        , P.AGENTE_CD_INTTRA'
      '        , P.AGENTE_ENDERECO'
      '        , P.AGENTE_CIDADE'
      '        , P.AGENTE_CEP'
      '        , P.AGENTE_ESTADO'
      '        , P.AGENTE_PAIS_COD       '
      '        , P.CONSIG_NOME'
      '        , P.CONSIG_ENDERECO'
      '        , P.CONSIG_CIDADE'
      '        , P.CONSIG_CEP'
      '        , P.CONSIG_ESTADO'
      '        , P.CONSIG_PAIS_COD'
      '        , P.CONSIG_END_NUMERO'
      '        , P.CONSIG_END_COMPL'
      '        , P.CONSIG_NR_TELEFONE'
      '        , P.CONSIG_NR_FAX'
      '        , P.CONSIG_NR_RUC'
      '        , P.CONSIG_NR_NIT'
      '        , P.CONSIG_NR_CUIT       '
      '        , P.CONSIG_ENDERECO + '#39' '#39' +  P.CONSIG_END_NUMERO + '#39' '#39' +'
      
        '          P.CONSIG_END_COMPL  + '#39' - '#39' + P.CONSIG_CIDADE  + '#39' - '#39 +
        ' +'
      
        '          P.CONSIG_ESTADO  + '#39' - '#39' + P.CONSIG_PAIS_COD  + '#39' - '#39' ' +
        '+'
      
        '          P.CONSIG_NR_TELEFONE  + '#39' - '#39' + P.CONSIG_NR_FAX  + '#39' -' +
        ' '#39' +'
      '          P.CONSIG_NR_RUC  + '#39' - '#39' +'
      '          P.CONSIG_NR_NIT  + '#39' - '#39' + P.CONSIG_NR_CUIT'
      '          AS CONSIG_END_COMPLETO              '
      '        , P.NOTIFY1_NOME'
      '        , P.NOTIFY1_ENDERECO'
      '        , P.NOTIFY1_CIDADE'
      '        , P.NOTIFY1_CEP'
      '        , P.NOTIFY1_ESTADO'
      '        , P.NOTIFY1_PAIS_COD       '
      '        , P.NOTIFY1_END_NUMERO'
      '        , P.NOTIFY1_END_COMPL'
      '        , P.NOTIFY1_NR_TELEFONE'
      '        , P.NOTIFY1_NR_FAX'
      '        , P.NOTIFY1_NR_RUC'
      '        , P.NOTIFY1_NR_NIT'
      '        , P.NOTIFY1_NR_CUIT'
      
        '        , P.NOTIFY1_ENDERECO + '#39' '#39' +  P.NOTIFY1_END_NUMERO + '#39' '#39 +
        ' +'
      
        '          P.NOTIFY1_END_COMPL  + '#39' - '#39' + P.NOTIFY1_CIDADE  + '#39' -' +
        ' '#39' +'
      
        '          P.NOTIFY1_ESTADO  + '#39' - '#39' + P.NOTIFY1_PAIS_COD  + '#39' - ' +
        #39' +'
      
        '          P.NOTIFY1_NR_TELEFONE  + '#39' - '#39' + P.NOTIFY1_NR_FAX  + '#39 +
        ' - '#39' +'
      '          P.NOTIFY1_NR_RUC  + '#39' - '#39' +'
      '          P.NOTIFY1_NR_NIT  + '#39' - '#39' + P.NOTIFY1_NR_CUIT        '
      '          AS NOTIFY1_END_COMPLETO       '
      '        , P.NOTIFY2_NOME'
      '        , P.NOTIFY2_ENDERECO'
      '        , P.NOTIFY2_CIDADE'
      '        , P.NOTIFY2_CEP'
      '        , P.NOTIFY2_ESTADO'
      '        , P.NOTIFY2_PAIS_COD        '
      '        , P.NOTIFY2_END_NUMERO'
      '        , P.NOTIFY2_END_COMPL'
      '        , P.NOTIFY2_NR_TELEFONE'
      '        , P.NOTIFY2_NR_FAX'
      '        , P.NOTIFY2_NR_RUC'
      '        , P.NOTIFY2_NR_NIT'
      '        , P.NOTIFY2_NR_CUIT'
      
        '        , P.NOTIFY2_ENDERECO + '#39' '#39' +  P.NOTIFY2_END_NUMERO + '#39' '#39 +
        ' +'
      
        '          P.NOTIFY2_END_COMPL  + '#39' - '#39' + P.NOTIFY2_CIDADE  + '#39' -' +
        ' '#39' +'
      
        '          P.NOTIFY2_ESTADO  + '#39' - '#39' + P.NOTIFY2_PAIS_COD  + '#39' - ' +
        #39' +'
      
        '          P.NOTIFY2_NR_TELEFONE  + '#39' - '#39' + P.NOTIFY2_NR_FAX  + '#39 +
        ' - '#39' +'
      '          P.NOTIFY2_NR_RUC  + '#39' - '#39' +'
      '          P.NOTIFY2_NR_NIT  + '#39' - '#39' + P.NOTIFY2_NR_CUIT'
      '          AS NOTIFY2_END_COMPLETO'
      '        , P.CD_COLLECT_PREPAID'
      '        , FR.DESCRICAO AS TIPO_FRETE_DESCRICAO'
      '        , P.CD_TIPO_PGMTO_TAXAS'
      '        , TX.DESCRICAO AS PGTO_TAXA_DESCRICAO'
      '        , P.IN_PGMTO_ABROAD'
      '        , P.NM_LOCAL_PGMTO_TAXAS'
      '        , P.CD_TIPO_MOVIMENTO'
      '        , MOV.DESCRICAO AS MOVIMENTO_DESCRICAO'
      '        , P.BOOKING_ARMADOR'
      '        , P.REFERENCIA_EMBARQUE'
      '        , P.NM_NAVIO'
      '        , P.NR_VIAGEM'
      '        , P.LOCAL_EMBARQUE'
      '        , P.LOCAL_EMBARQUE_SIGLA'
      '        , P.LOCAL_DESEMBARQUE'
      '        , P.LOCAL_DESEMBARQUE_SIGLA'
      '        , P.LOCAL_DESEMBARQUE_PAIS_COD'
      '        , P.LOCAL_ENTREGA'
      '        , P.LOCAL_ENTREGA_SIGLA'
      '        , P.LOCAL_ENTREGA_PAIS_COD'
      '        , P.MARCACAO_VOLUMES   '
      '        , LOCAL_LIBERACAO_BL_COD'
      '        , LOCAL_LIBERACAO_BL_NOME'
      '        , LOCAL_LIBERACAO_BL_PAIS'
      '        , LOCAL_LIBERACAO_BL_PAIS + LOCAL_LIBERACAO_BL_COD '
      '          AS LOCAL_LIBERACAO_BL_ID'
      ' FROM TPROCESSO_DRAFT_BL        P   (NOLOCK) '
      
        ' LEFT JOIN TTP_TAXAS_INTTRA     TX  (NOLOCK) ON TX.CD_TAXA_INTTR' +
        'A       = P.CD_TIPO_PGMTO_TAXAS'
      
        ' LEFT JOIN TTP_MOVIMENTO_INTTRA MOV (NOLOCK) ON MOV.CD_MOVIMENTO' +
        '_INTTRA = P.CD_TIPO_MOVIMENTO'
      
        ' LEFT JOIN TTP_FRETE            FR  (NOLOCK) ON FR.CODIGO       ' +
        '        = P.CD_COLLECT_PREPAID'
      
        ' LEFT JOIN TPROCESSO            PR  (NOLOCK) ON PR.NR_PROCESSO  ' +
        '        = P.NR_PROCESSO '
      ' CROSS APPLY (SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE RC'
      '              WHERE RC.NR_PROCESSO = P.NR_PROCESSO '
      
        '              AND TP_REFERENCIA = (CASE WHEN PR.CD_GRUPO = '#39'155'#39 +
        ' THEN '#39'08'#39' '
      
        '                                        WHEN PR.CD_GRUPO = '#39'002'#39 +
        ' THEN '#39'19'#39' '
      '                                        ELSE '#39'01'#39' '
      '                                   END)) REF'
      ' '
      ' '
      ' WHERE P.NR_PROCESSO = :NR_PROCESSO'
      ' AND NR_AMEND = :NR_AMEND')
    Left = 315
    Top = 29
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Value = '0102EM-009318-19'
      end
      item
        Name = 'NR_AMEND'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
    object qryDraftNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryDraftCD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'CD_REFERENCIA'
      Required = True
      FixedChar = True
      Size = 30
    end
    object qryDraftNR_AMEND: TIntegerField
      FieldName = 'NR_AMEND'
      Origin = 'NR_AMEND'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDraftCD_RUC: TStringField
      FieldName = 'CD_RUC'
      Origin = 'CD_RUC'
      FixedChar = True
      Size = 35
    end
    object qryDraftDS_EMAIL_INDAIA: TStringField
      FieldName = 'DS_EMAIL_INDAIA'
      Origin = 'DS_EMAIL_INDAIA'
      Size = 100
    end
    object qryDraftCLIENTE_NOME: TStringField
      FieldName = 'CLIENTE_NOME'
      Origin = 'CLIENTE_NOME'
      Size = 80
    end
    object qryDraftCLIENTE_ENDERECO: TStringField
      FieldName = 'CLIENTE_ENDERECO'
      Origin = 'CLIENTE_ENDERECO'
      Size = 50
    end
    object qryDraftCLIENTE_CIDADE: TStringField
      FieldName = 'CLIENTE_CIDADE'
      Origin = 'CLIENTE_CIDADE'
      Size = 30
    end
    object qryDraftCLIENTE_CEP: TStringField
      FieldName = 'CLIENTE_CEP'
      Origin = 'CLIENTE_CEP'
      Size = 8
    end
    object qryDraftCLIENTE_ESTADO: TStringField
      FieldName = 'CLIENTE_ESTADO'
      Origin = 'CLIENTE_ESTADO'
      FixedChar = True
      Size = 2
    end
    object qryDraftCLIENTE_PAIS_COD: TStringField
      FieldName = 'CLIENTE_PAIS_COD'
      Origin = 'CLIENTE_PAIS_COD'
      FixedChar = True
      Size = 2
    end
    object qryDraftCLIENTE_CNPJ: TStringField
      FieldName = 'CLIENTE_CNPJ'
      Origin = 'CLIENTE_CNPJ'
      FixedChar = True
      Size = 18
    end
    object qryDraftCLIENTE_END_COMPLETO: TStringField
      FieldName = 'CLIENTE_END_COMPLETO'
      Origin = 'CLIENTE_END_COMPLETO'
      ReadOnly = True
      Size = 102
    end
    object qryDraftAGENTE_NOME: TStringField
      FieldName = 'AGENTE_NOME'
      Origin = 'AGENTE_NOME'
      Size = 60
    end
    object qryDraftAGENTE_CD_INTTRA: TStringField
      FieldName = 'AGENTE_CD_INTTRA'
      Origin = 'AGENTE_CD_INTTRA'
    end
    object qryDraftAGENTE_ENDERECO: TStringField
      FieldName = 'AGENTE_ENDERECO'
      Origin = 'AGENTE_ENDERECO'
      Size = 100
    end
    object qryDraftAGENTE_CIDADE: TStringField
      FieldName = 'AGENTE_CIDADE'
      Origin = 'AGENTE_CIDADE'
      Size = 30
    end
    object qryDraftAGENTE_CEP: TStringField
      FieldName = 'AGENTE_CEP'
      Origin = 'AGENTE_CEP'
      Size = 8
    end
    object qryDraftAGENTE_ESTADO: TStringField
      FieldName = 'AGENTE_ESTADO'
      Origin = 'AGENTE_ESTADO'
      Size = 30
    end
    object qryDraftAGENTE_PAIS_COD: TStringField
      FieldName = 'AGENTE_PAIS_COD'
      Origin = 'AGENTE_PAIS_COD'
      FixedChar = True
      Size = 2
    end
    object qryDraftCONSIG_NOME: TStringField
      FieldName = 'CONSIG_NOME'
      Origin = 'CONSIG_NOME'
      Size = 100
    end
    object qryDraftCONSIG_ENDERECO: TStringField
      FieldName = 'CONSIG_ENDERECO'
      Origin = 'CONSIG_ENDERECO'
      Size = 100
    end
    object qryDraftCONSIG_CIDADE: TStringField
      FieldName = 'CONSIG_CIDADE'
      Origin = 'CONSIG_CIDADE'
      Size = 30
    end
    object qryDraftCONSIG_CEP: TStringField
      FieldName = 'CONSIG_CEP'
      Origin = 'CONSIG_CEP'
      Size = 8
    end
    object qryDraftCONSIG_ESTADO: TStringField
      FieldName = 'CONSIG_ESTADO'
      Origin = 'CONSIG_ESTADO'
      Size = 30
    end
    object qryDraftCONSIG_PAIS_COD: TStringField
      FieldName = 'CONSIG_PAIS_COD'
      Origin = 'CONSIG_PAIS_COD'
      FixedChar = True
      Size = 2
    end
    object qryDraftCONSIG_END_NUMERO: TStringField
      FieldName = 'CONSIG_END_NUMERO'
      Origin = 'CONSIG_END_NUMERO'
      Size = 6
    end
    object qryDraftCONSIG_END_COMPL: TStringField
      FieldName = 'CONSIG_END_COMPL'
      Origin = 'CONSIG_END_COMPL'
      Size = 41
    end
    object qryDraftCONSIG_NR_TELEFONE: TStringField
      FieldName = 'CONSIG_NR_TELEFONE'
      Origin = 'CONSIG_NR_TELEFONE'
      Size = 15
    end
    object qryDraftCONSIG_NR_FAX: TStringField
      FieldName = 'CONSIG_NR_FAX'
      Origin = 'CONSIG_NR_FAX'
      Size = 15
    end
    object qryDraftCONSIG_NR_RUC: TStringField
      FieldName = 'CONSIG_NR_RUC'
      Origin = 'CONSIG_NR_RUC'
      Size = 25
    end
    object qryDraftCONSIG_NR_NIT: TStringField
      FieldName = 'CONSIG_NR_NIT'
      Origin = 'CONSIG_NR_NIT'
      Size = 25
    end
    object qryDraftCONSIG_NR_CUIT: TStringField
      FieldName = 'CONSIG_NR_CUIT'
      Origin = 'CONSIG_NR_CUIT'
      Size = 25
    end
    object qryDraftCONSIG_END_COMPLETO: TStringField
      FieldName = 'CONSIG_END_COMPLETO'
      Origin = 'CONSIG_END_COMPLETO'
      ReadOnly = True
      Size = 340
    end
    object qryDraftNOTIFY1_NOME: TStringField
      FieldName = 'NOTIFY1_NOME'
      Origin = 'NOTIFY1_NOME'
      Size = 100
    end
    object qryDraftNOTIFY1_ENDERECO: TStringField
      FieldName = 'NOTIFY1_ENDERECO'
      Origin = 'NOTIFY1_ENDERECO'
      Size = 100
    end
    object qryDraftNOTIFY1_CIDADE: TStringField
      FieldName = 'NOTIFY1_CIDADE'
      Origin = 'NOTIFY1_CIDADE'
      Size = 30
    end
    object qryDraftNOTIFY1_CEP: TStringField
      FieldName = 'NOTIFY1_CEP'
      Origin = 'NOTIFY1_CEP'
      Size = 8
    end
    object qryDraftNOTIFY1_ESTADO: TStringField
      FieldName = 'NOTIFY1_ESTADO'
      Origin = 'NOTIFY1_ESTADO'
      Size = 30
    end
    object qryDraftNOTIFY1_PAIS_COD: TStringField
      FieldName = 'NOTIFY1_PAIS_COD'
      Origin = 'NOTIFY1_PAIS_COD'
      FixedChar = True
      Size = 2
    end
    object qryDraftNOTIFY1_END_NUMERO: TStringField
      FieldName = 'NOTIFY1_END_NUMERO'
      Origin = 'NOTIFY1_END_NUMERO'
      Size = 6
    end
    object qryDraftNOTIFY1_END_COMPL: TStringField
      FieldName = 'NOTIFY1_END_COMPL'
      Origin = 'NOTIFY1_END_COMPL'
      Size = 41
    end
    object qryDraftNOTIFY1_NR_TELEFONE: TStringField
      FieldName = 'NOTIFY1_NR_TELEFONE'
      Origin = 'NOTIFY1_NR_TELEFONE'
      Size = 15
    end
    object qryDraftNOTIFY1_NR_FAX: TStringField
      FieldName = 'NOTIFY1_NR_FAX'
      Origin = 'NOTIFY1_NR_FAX'
      Size = 15
    end
    object qryDraftNOTIFY1_NR_RUC: TStringField
      FieldName = 'NOTIFY1_NR_RUC'
      Origin = 'NOTIFY1_NR_RUC'
      Size = 25
    end
    object qryDraftNOTIFY1_NR_NIT: TStringField
      FieldName = 'NOTIFY1_NR_NIT'
      Origin = 'NOTIFY1_NR_NIT'
      Size = 25
    end
    object qryDraftNOTIFY1_NR_CUIT: TStringField
      FieldName = 'NOTIFY1_NR_CUIT'
      Origin = 'NOTIFY1_NR_CUIT'
      Size = 25
    end
    object qryDraftNOTIFY1_END_COMPLETO: TStringField
      FieldName = 'NOTIFY1_END_COMPLETO'
      Origin = 'NOTIFY1_END_COMPLETO'
      ReadOnly = True
      Size = 340
    end
    object qryDraftNOTIFY2_NOME: TStringField
      FieldName = 'NOTIFY2_NOME'
      Origin = 'NOTIFY2_NOME'
      Size = 100
    end
    object qryDraftNOTIFY2_ENDERECO: TStringField
      FieldName = 'NOTIFY2_ENDERECO'
      Origin = 'NOTIFY2_ENDERECO'
      Size = 100
    end
    object qryDraftNOTIFY2_CIDADE: TStringField
      FieldName = 'NOTIFY2_CIDADE'
      Origin = 'NOTIFY2_CIDADE'
      Size = 30
    end
    object qryDraftNOTIFY2_CEP: TStringField
      FieldName = 'NOTIFY2_CEP'
      Origin = 'NOTIFY2_CEP'
      Size = 8
    end
    object qryDraftNOTIFY2_ESTADO: TStringField
      FieldName = 'NOTIFY2_ESTADO'
      Origin = 'NOTIFY2_ESTADO'
      Size = 30
    end
    object qryDraftNOTIFY2_PAIS_COD: TStringField
      FieldName = 'NOTIFY2_PAIS_COD'
      Origin = 'NOTIFY2_PAIS_COD'
      FixedChar = True
      Size = 2
    end
    object qryDraftNOTIFY2_END_NUMERO: TStringField
      FieldName = 'NOTIFY2_END_NUMERO'
      Origin = 'NOTIFY2_END_NUMERO'
      Size = 6
    end
    object qryDraftNOTIFY2_END_COMPL: TStringField
      FieldName = 'NOTIFY2_END_COMPL'
      Origin = 'NOTIFY2_END_COMPL'
      Size = 41
    end
    object qryDraftNOTIFY2_NR_TELEFONE: TStringField
      FieldName = 'NOTIFY2_NR_TELEFONE'
      Origin = 'NOTIFY2_NR_TELEFONE'
      Size = 15
    end
    object qryDraftNOTIFY2_NR_FAX: TStringField
      FieldName = 'NOTIFY2_NR_FAX'
      Origin = 'NOTIFY2_NR_FAX'
      Size = 15
    end
    object qryDraftNOTIFY2_NR_RUC: TStringField
      FieldName = 'NOTIFY2_NR_RUC'
      Origin = 'NOTIFY2_NR_RUC'
      Size = 25
    end
    object qryDraftNOTIFY2_NR_NIT: TStringField
      FieldName = 'NOTIFY2_NR_NIT'
      Origin = 'NOTIFY2_NR_NIT'
      Size = 25
    end
    object qryDraftNOTIFY2_NR_CUIT: TStringField
      FieldName = 'NOTIFY2_NR_CUIT'
      Origin = 'NOTIFY2_NR_CUIT'
      Size = 25
    end
    object qryDraftNOTIFY2_END_COMPLETO: TStringField
      FieldName = 'NOTIFY2_END_COMPLETO'
      Origin = 'NOTIFY2_END_COMPLETO'
      ReadOnly = True
      Size = 340
    end
    object qryDraftCD_COLLECT_PREPAID: TStringField
      FieldName = 'CD_COLLECT_PREPAID'
      Origin = 'CD_COLLECT_PREPAID'
      FixedChar = True
      Size = 1
    end
    object qryDraftCD_TIPO_PGMTO_TAXAS: TIntegerField
      FieldName = 'CD_TIPO_PGMTO_TAXAS'
      Origin = 'CD_TIPO_PGMTO_TAXAS'
    end
    object qryDraftIN_PGMTO_ABROAD: TStringField
      FieldName = 'IN_PGMTO_ABROAD'
      Origin = 'IN_PGMTO_ABROAD'
      FixedChar = True
      Size = 1
    end
    object qryDraftNM_LOCAL_PGMTO_TAXAS: TStringField
      FieldName = 'NM_LOCAL_PGMTO_TAXAS'
      Origin = 'NM_LOCAL_PGMTO_TAXAS'
      Size = 100
    end
    object qryDraftCD_TIPO_MOVIMENTO: TIntegerField
      FieldName = 'CD_TIPO_MOVIMENTO'
      Origin = 'CD_TIPO_MOVIMENTO'
    end
    object qryDraftBOOKING_ARMADOR: TStringField
      FieldName = 'BOOKING_ARMADOR'
      Origin = 'BOOKING_ARMADOR'
      Size = 35
    end
    object qryDraftREFERENCIA_EMBARQUE: TStringField
      FieldName = 'REFERENCIA_EMBARQUE'
      Origin = 'REFERENCIA_EMBARQUE'
      Size = 35
    end
    object qryDraftNM_NAVIO: TStringField
      FieldName = 'NM_NAVIO'
      Origin = 'NM_NAVIO'
      Size = 40
    end
    object qryDraftNR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Origin = 'NR_VIAGEM'
      Size = 15
    end
    object qryDraftLOCAL_EMBARQUE: TStringField
      FieldName = 'LOCAL_EMBARQUE'
      Origin = 'LOCAL_EMBARQUE'
      Size = 50
    end
    object qryDraftLOCAL_EMBARQUE_SIGLA: TStringField
      FieldName = 'LOCAL_EMBARQUE_SIGLA'
      Origin = 'LOCAL_EMBARQUE_SIGLA'
      FixedChar = True
      Size = 3
    end
    object qryDraftLOCAL_DESEMBARQUE: TStringField
      FieldName = 'LOCAL_DESEMBARQUE'
      Origin = 'LOCAL_DESEMBARQUE'
      Size = 50
    end
    object qryDraftLOCAL_DESEMBARQUE_SIGLA: TStringField
      FieldName = 'LOCAL_DESEMBARQUE_SIGLA'
      Origin = 'LOCAL_DESEMBARQUE_SIGLA'
      FixedChar = True
      Size = 3
    end
    object qryDraftLOCAL_DESEMBARQUE_PAIS_COD: TStringField
      FieldName = 'LOCAL_DESEMBARQUE_PAIS_COD'
      Origin = 'LOCAL_DESEMBARQUE_PAIS_COD'
      FixedChar = True
      Size = 2
    end
    object qryDraftLOCAL_ENTREGA: TStringField
      FieldName = 'LOCAL_ENTREGA'
      Origin = 'LOCAL_ENTREGA'
      Size = 50
    end
    object qryDraftLOCAL_ENTREGA_SIGLA: TStringField
      FieldName = 'LOCAL_ENTREGA_SIGLA'
      Origin = 'LOCAL_ENTREGA_SIGLA'
      Size = 3
    end
    object qryDraftLOCAL_ENTREGA_PAIS_COD: TStringField
      FieldName = 'LOCAL_ENTREGA_PAIS_COD'
      Origin = 'LOCAL_ENTREGA_PAIS_COD'
      Size = 2
    end
    object qryDraftMARCACAO_VOLUMES: TStringField
      FieldName = 'MARCACAO_VOLUMES'
      Origin = 'MARCACAO_VOLUMES'
      Size = 1000
    end
    object qryDraftLOCAL_LIBERACAO_BL_COD: TStringField
      FieldName = 'LOCAL_LIBERACAO_BL_COD'
      Origin = 'LOCAL_LIBERACAO_BL_COD'
      Size = 5
    end
    object qryDraftLOCAL_LIBERACAO_BL_NOME: TStringField
      FieldName = 'LOCAL_LIBERACAO_BL_NOME'
      Origin = 'LOCAL_LIBERACAO_BL_NOME'
      Size = 50
    end
    object qryDraftLOCAL_LIBERACAO_BL_PAIS: TStringField
      FieldName = 'LOCAL_LIBERACAO_BL_PAIS'
      Origin = 'LOCAL_LIBERACAO_BL_PAIS'
      Size = 120
    end
    object qryDraftMOVIMENTO_DESCRICAO: TStringField
      FieldName = 'MOVIMENTO_DESCRICAO'
      Origin = 'MOVIMENTO_DESCRICAO'
      Size = 10
    end
    object qryDraftLOCAL_LIBERACAO_BL_ID: TStringField
      FieldName = 'LOCAL_LIBERACAO_BL_ID'
      Origin = 'LOCAL_LIBERACAO_BL_ID'
      ReadOnly = True
      Size = 125
    end
    object qryDraftTIPO_FRETE_DESCRICAO: TStringField
      FieldName = 'TIPO_FRETE_DESCRICAO'
      Origin = 'TIPO_FRETE_DESCRICAO'
      FixedChar = True
      Size = 30
    end
    object qryDraftPGTO_TAXA_DESCRICAO: TStringField
      FieldName = 'PGTO_TAXA_DESCRICAO'
      Origin = 'PGTO_TAXA_DESCRICAO'
      Size = 50
    end
  end
  object dspDraft: TDataSetProvider
    DataSet = qryDraft
    Left = 402
    Top = 29
  end
  object cdsDraft: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDraft'
    Left = 493
    Top = 29
    object cdsDraftNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsDraftCD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsDraftNR_AMEND: TIntegerField
      FieldName = 'NR_AMEND'
      Required = True
    end
    object cdsDraftCD_RUC: TStringField
      FieldName = 'CD_RUC'
      FixedChar = True
      Size = 35
    end
    object cdsDraftDS_EMAIL_INDAIA: TStringField
      FieldName = 'DS_EMAIL_INDAIA'
      Size = 100
    end
    object cdsDraftCLIENTE_NOME: TStringField
      FieldName = 'CLIENTE_NOME'
      Size = 80
    end
    object cdsDraftCLIENTE_ENDERECO: TStringField
      FieldName = 'CLIENTE_ENDERECO'
      Size = 50
    end
    object cdsDraftCLIENTE_CIDADE: TStringField
      FieldName = 'CLIENTE_CIDADE'
      Size = 30
    end
    object cdsDraftCLIENTE_CEP: TStringField
      FieldName = 'CLIENTE_CEP'
      Size = 8
    end
    object cdsDraftCLIENTE_ESTADO: TStringField
      FieldName = 'CLIENTE_ESTADO'
      FixedChar = True
      Size = 2
    end
    object cdsDraftCLIENTE_PAIS_COD: TStringField
      FieldName = 'CLIENTE_PAIS_COD'
      FixedChar = True
      Size = 2
    end
    object cdsDraftCLIENTE_CNPJ: TStringField
      FieldName = 'CLIENTE_CNPJ'
      FixedChar = True
      Size = 18
    end
    object cdsDraftCLIENTE_END_COMPLETO: TStringField
      FieldName = 'CLIENTE_END_COMPLETO'
      ReadOnly = True
      Size = 102
    end
    object cdsDraftAGENTE_NOME: TStringField
      FieldName = 'AGENTE_NOME'
      Size = 60
    end
    object cdsDraftAGENTE_CD_INTTRA: TStringField
      FieldName = 'AGENTE_CD_INTTRA'
    end
    object cdsDraftAGENTE_ENDERECO: TStringField
      FieldName = 'AGENTE_ENDERECO'
      Size = 100
    end
    object cdsDraftAGENTE_CIDADE: TStringField
      FieldName = 'AGENTE_CIDADE'
      Size = 30
    end
    object cdsDraftAGENTE_CEP: TStringField
      FieldName = 'AGENTE_CEP'
      Size = 8
    end
    object cdsDraftAGENTE_ESTADO: TStringField
      FieldName = 'AGENTE_ESTADO'
      Size = 30
    end
    object cdsDraftAGENTE_PAIS_COD: TStringField
      FieldName = 'AGENTE_PAIS_COD'
      FixedChar = True
      Size = 2
    end
    object cdsDraftCONSIG_NOME: TStringField
      FieldName = 'CONSIG_NOME'
      Size = 100
    end
    object cdsDraftCONSIG_ENDERECO: TStringField
      FieldName = 'CONSIG_ENDERECO'
      Size = 100
    end
    object cdsDraftCONSIG_CIDADE: TStringField
      FieldName = 'CONSIG_CIDADE'
      Size = 30
    end
    object cdsDraftCONSIG_CEP: TStringField
      FieldName = 'CONSIG_CEP'
      Size = 8
    end
    object cdsDraftCONSIG_ESTADO: TStringField
      FieldName = 'CONSIG_ESTADO'
      Size = 30
    end
    object cdsDraftCONSIG_PAIS_COD: TStringField
      FieldName = 'CONSIG_PAIS_COD'
      FixedChar = True
      Size = 2
    end
    object cdsDraftCONSIG_END_NUMERO: TStringField
      FieldName = 'CONSIG_END_NUMERO'
      Size = 6
    end
    object cdsDraftCONSIG_END_COMPL: TStringField
      FieldName = 'CONSIG_END_COMPL'
      Size = 41
    end
    object cdsDraftCONSIG_NR_TELEFONE: TStringField
      FieldName = 'CONSIG_NR_TELEFONE'
      Size = 15
    end
    object cdsDraftCONSIG_NR_FAX: TStringField
      FieldName = 'CONSIG_NR_FAX'
      Size = 15
    end
    object cdsDraftCONSIG_NR_RUC: TStringField
      FieldName = 'CONSIG_NR_RUC'
      Size = 25
    end
    object cdsDraftCONSIG_NR_NIT: TStringField
      FieldName = 'CONSIG_NR_NIT'
      Size = 25
    end
    object cdsDraftCONSIG_NR_CUIT: TStringField
      FieldName = 'CONSIG_NR_CUIT'
      Size = 25
    end
    object cdsDraftCONSIG_END_COMPLETO: TStringField
      FieldName = 'CONSIG_END_COMPLETO'
      ReadOnly = True
      Size = 340
    end
    object cdsDraftNOTIFY1_NOME: TStringField
      FieldName = 'NOTIFY1_NOME'
      Size = 100
    end
    object cdsDraftNOTIFY1_ENDERECO: TStringField
      FieldName = 'NOTIFY1_ENDERECO'
      Size = 100
    end
    object cdsDraftNOTIFY1_CIDADE: TStringField
      FieldName = 'NOTIFY1_CIDADE'
      Size = 30
    end
    object cdsDraftNOTIFY1_CEP: TStringField
      FieldName = 'NOTIFY1_CEP'
      Size = 8
    end
    object cdsDraftNOTIFY1_ESTADO: TStringField
      FieldName = 'NOTIFY1_ESTADO'
      Size = 30
    end
    object cdsDraftNOTIFY1_PAIS_COD: TStringField
      FieldName = 'NOTIFY1_PAIS_COD'
      FixedChar = True
      Size = 2
    end
    object cdsDraftNOTIFY1_END_NUMERO: TStringField
      FieldName = 'NOTIFY1_END_NUMERO'
      Size = 6
    end
    object cdsDraftNOTIFY1_END_COMPL: TStringField
      FieldName = 'NOTIFY1_END_COMPL'
      Size = 41
    end
    object cdsDraftNOTIFY1_NR_TELEFONE: TStringField
      FieldName = 'NOTIFY1_NR_TELEFONE'
      Size = 15
    end
    object cdsDraftNOTIFY1_NR_FAX: TStringField
      FieldName = 'NOTIFY1_NR_FAX'
      Size = 15
    end
    object cdsDraftNOTIFY1_NR_RUC: TStringField
      FieldName = 'NOTIFY1_NR_RUC'
      Size = 25
    end
    object cdsDraftNOTIFY1_NR_NIT: TStringField
      FieldName = 'NOTIFY1_NR_NIT'
      Size = 25
    end
    object cdsDraftNOTIFY1_NR_CUIT: TStringField
      FieldName = 'NOTIFY1_NR_CUIT'
      Size = 25
    end
    object cdsDraftNOTIFY1_END_COMPLETO: TStringField
      FieldName = 'NOTIFY1_END_COMPLETO'
      ReadOnly = True
      Size = 340
    end
    object cdsDraftNOTIFY2_NOME: TStringField
      FieldName = 'NOTIFY2_NOME'
      Size = 100
    end
    object cdsDraftNOTIFY2_ENDERECO: TStringField
      FieldName = 'NOTIFY2_ENDERECO'
      Size = 100
    end
    object cdsDraftNOTIFY2_CIDADE: TStringField
      FieldName = 'NOTIFY2_CIDADE'
      Size = 30
    end
    object cdsDraftNOTIFY2_CEP: TStringField
      FieldName = 'NOTIFY2_CEP'
      Size = 8
    end
    object cdsDraftNOTIFY2_ESTADO: TStringField
      FieldName = 'NOTIFY2_ESTADO'
      Size = 30
    end
    object cdsDraftNOTIFY2_PAIS_COD: TStringField
      FieldName = 'NOTIFY2_PAIS_COD'
      FixedChar = True
      Size = 2
    end
    object cdsDraftNOTIFY2_END_NUMERO: TStringField
      FieldName = 'NOTIFY2_END_NUMERO'
      Size = 6
    end
    object cdsDraftNOTIFY2_END_COMPL: TStringField
      FieldName = 'NOTIFY2_END_COMPL'
      Size = 41
    end
    object cdsDraftNOTIFY2_NR_TELEFONE: TStringField
      FieldName = 'NOTIFY2_NR_TELEFONE'
      Size = 15
    end
    object cdsDraftNOTIFY2_NR_FAX: TStringField
      FieldName = 'NOTIFY2_NR_FAX'
      Size = 15
    end
    object cdsDraftNOTIFY2_NR_RUC: TStringField
      FieldName = 'NOTIFY2_NR_RUC'
      Size = 25
    end
    object cdsDraftNOTIFY2_NR_NIT: TStringField
      FieldName = 'NOTIFY2_NR_NIT'
      Size = 25
    end
    object cdsDraftNOTIFY2_NR_CUIT: TStringField
      FieldName = 'NOTIFY2_NR_CUIT'
      Size = 25
    end
    object cdsDraftNOTIFY2_END_COMPLETO: TStringField
      FieldName = 'NOTIFY2_END_COMPLETO'
      ReadOnly = True
      Size = 340
    end
    object cdsDraftCD_COLLECT_PREPAID: TStringField
      FieldName = 'CD_COLLECT_PREPAID'
      FixedChar = True
      Size = 1
    end
    object cdsDraftCD_TIPO_PGMTO_TAXAS: TIntegerField
      FieldName = 'CD_TIPO_PGMTO_TAXAS'
    end
    object cdsDraftIN_PGMTO_ABROAD: TStringField
      FieldName = 'IN_PGMTO_ABROAD'
      FixedChar = True
      Size = 1
    end
    object cdsDraftNM_LOCAL_PGMTO_TAXAS: TStringField
      FieldName = 'NM_LOCAL_PGMTO_TAXAS'
      Size = 100
    end
    object cdsDraftCD_TIPO_MOVIMENTO: TIntegerField
      FieldName = 'CD_TIPO_MOVIMENTO'
    end
    object cdsDraftBOOKING_ARMADOR: TStringField
      FieldName = 'BOOKING_ARMADOR'
      Size = 35
    end
    object cdsDraftREFERENCIA_EMBARQUE: TStringField
      FieldName = 'REFERENCIA_EMBARQUE'
      Size = 35
    end
    object cdsDraftNM_NAVIO: TStringField
      FieldName = 'NM_NAVIO'
      Size = 40
    end
    object cdsDraftNR_VIAGEM: TStringField
      FieldName = 'NR_VIAGEM'
      Size = 15
    end
    object cdsDraftLOCAL_EMBARQUE: TStringField
      FieldName = 'LOCAL_EMBARQUE'
      Size = 50
    end
    object cdsDraftLOCAL_EMBARQUE_SIGLA: TStringField
      FieldName = 'LOCAL_EMBARQUE_SIGLA'
      FixedChar = True
      Size = 3
    end
    object cdsDraftLOCAL_DESEMBARQUE: TStringField
      FieldName = 'LOCAL_DESEMBARQUE'
      Size = 50
    end
    object cdsDraftLOCAL_DESEMBARQUE_SIGLA: TStringField
      FieldName = 'LOCAL_DESEMBARQUE_SIGLA'
      FixedChar = True
      Size = 3
    end
    object cdsDraftLOCAL_DESEMBARQUE_PAIS_COD: TStringField
      FieldName = 'LOCAL_DESEMBARQUE_PAIS_COD'
      FixedChar = True
      Size = 2
    end
    object cdsDraftLOCAL_ENTREGA: TStringField
      FieldName = 'LOCAL_ENTREGA'
      Size = 50
    end
    object cdsDraftLOCAL_ENTREGA_SIGLA: TStringField
      FieldName = 'LOCAL_ENTREGA_SIGLA'
      Size = 3
    end
    object cdsDraftLOCAL_ENTREGA_PAIS_COD: TStringField
      FieldName = 'LOCAL_ENTREGA_PAIS_COD'
      Size = 2
    end
    object cdsDraftMARCACAO_VOLUMES: TStringField
      FieldName = 'MARCACAO_VOLUMES'
      Size = 1000
    end
    object cdsDraftLOCAL_LIBERACAO_BL_COD: TStringField
      FieldName = 'LOCAL_LIBERACAO_BL_COD'
      Size = 5
    end
    object cdsDraftLOCAL_LIBERACAO_BL_NOME: TStringField
      FieldName = 'LOCAL_LIBERACAO_BL_NOME'
      Size = 50
    end
    object cdsDraftLOCAL_LIBERACAO_BL_PAIS: TStringField
      FieldName = 'LOCAL_LIBERACAO_BL_PAIS'
      Size = 120
    end
    object cdsDraftMOVIMENTO_DESCRICAO: TStringField
      FieldName = 'MOVIMENTO_DESCRICAO'
      Size = 10
    end
    object cdsDraftLOCAL_LIBERACAO_BL_ID: TStringField
      FieldName = 'LOCAL_LIBERACAO_BL_ID'
      ReadOnly = True
      Size = 125
    end
    object cdsDraftTIPO_FRETE_DESCRICAO: TStringField
      FieldName = 'TIPO_FRETE_DESCRICAO'
      FixedChar = True
      Size = 30
    end
    object cdsDraftPGTO_TAXA_DESCRICAO: TStringField
      FieldName = 'PGTO_TAXA_DESCRICAO'
      Size = 50
    end
  end
  object dtsDraft: TDataSource
    DataSet = cdsDraft
    Left = 574
    Top = 29
  end
  object dtsContainer: TDataSource
    DataSet = cdsContainer
    Left = 576
    Top = 85
  end
  object cdsContainer: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContainer'
    Left = 493
    Top = 85
    object cdsContainerNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsContainerNR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      ReadOnly = True
    end
    object cdsContainerNR_LACRE: TStringField
      FieldName = 'NR_LACRE'
      ReadOnly = True
    end
    object cdsContainerNR_LACRE_SIF: TStringField
      FieldName = 'NR_LACRE_SIF'
      ReadOnly = True
      Size = 11
    end
    object cdsContainerNM_TP_CNTR: TStringField
      FieldName = 'NM_TP_CNTR'
    end
    object cdsContainerCD_ISO: TStringField
      FieldName = 'CD_ISO'
      FixedChar = True
      Size = 4
    end
    object cdsContainerDS_TEMPERATURA: TStringField
      FieldName = 'DS_TEMPERATURA'
      Size = 6
    end
    object cdsContainerTARA_CNTR: TBCDField
      FieldName = 'TARA_CNTR'
      Precision = 15
      Size = 3
    end
    object cdsContainerVL_CUBAGEM: TBCDField
      FieldName = 'VL_CUBAGEM'
      Precision = 15
    end
    object cdsContainerDS_CARGA: TMemoField
      FieldName = 'DS_CARGA'
      BlobType = ftMemo
      Size = 2147483647
    end
    object cdsContainerCD_NCM: TStringField
      FieldName = 'CD_NCM'
      FixedChar = True
      Size = 11
    end
    object cdsContainerCD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      FixedChar = True
      Size = 3
    end
    object cdsContainerDS_EMBALAGEM: TStringField
      FieldName = 'DS_EMBALAGEM'
      Size = 50
    end
    object cdsContainerQT_EMBALAGEM: TIntegerField
      FieldName = 'QT_EMBALAGEM'
    end
    object cdsContainerQT_PESO_BRUTO: TBCDField
      FieldName = 'QT_PESO_BRUTO'
      Precision = 15
      Size = 3
    end
  end
  object dspContainer: TDataSetProvider
    DataSet = qryContainer
    Left = 401
    Top = 85
  end
  object cdsComentarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspComentarios'
    Left = 493
    Top = 141
    object cdsComentariosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsComentariosNR_AMEND: TIntegerField
      FieldName = 'NR_AMEND'
      Required = True
    end
    object cdsComentariosNR_COMENTARIO: TIntegerField
      FieldName = 'NR_COMENTARIO'
      Required = True
    end
    object cdsComentariosCD_TP_COMENTARIO: TStringField
      FieldName = 'CD_TP_COMENTARIO'
      FixedChar = True
      Size = 2
    end
    object cdsComentariosDS_COMENTARIO: TStringField
      FieldName = 'DS_COMENTARIO'
      ReadOnly = True
      Size = 130
    end
  end
  object dspComentarios: TDataSetProvider
    DataSet = qryComentarios
    Left = 403
    Top = 141
  end
  object dtsComentarios: TDataSource
    DataSet = cdsContainer
    Left = 576
    Top = 141
  end
end

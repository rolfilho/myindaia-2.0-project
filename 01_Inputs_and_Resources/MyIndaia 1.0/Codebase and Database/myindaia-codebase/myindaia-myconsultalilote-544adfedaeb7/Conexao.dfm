object dtmMyConsultaLiLote: TdtmMyConsultaLiLote
  OldCreateOrder = False
  Height = 534
  Width = 933
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=indaia10'
      'Database=BROKER'
      'User_Name=sa'
      'Password=123'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 56
    Top = 48
  end
  object qryConsultaLI: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evRecordCountMode, evAutoFetchAll]
    FetchOptions.RowsetSize = 10000
    SQL.Strings = (
      'SELECT * FROM ('
      #9'SELECT'
      
        #9'   ROW_NUMBER() OVER(ORDER BY P.CD_UNID_NEG, P.DT_ABERTURA DESC' +
        ', P.NR_PROCESSO, L.NR_LI) AS NR_LINHA,'
      #9'   L.*,'
      #9'   P.CD_UNID_NEG,'
      
        #9'   SUBSTRING(L.NR_LI, 1, 2) + '#39'/'#39' + SUBSTRING(L.NR_LI, 3, 7) + ' +
        #39'-'#39' + SUBSTRING(L.NR_LI, 10, 1) LI_FORMATADA,'
      #9'   U.NM_EMAIL,'
      #9'   E.NM_EMPRESA,'
      #9'   G.NM_EMAIL_CONSULTA_LI '
      #9'FROM'
      #9'   TPROCESSO_LI L (NOLOCK) '
      
        #9'   INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = L.NR_PROC' +
        'ESSO '
      
        #9'   CROSS APPLY (SELECT E1.NM_EMPRESA FROM TEMPRESA_NAC E1 (NOLO' +
        'CK)  WHERE E1.CD_EMPRESA = P.CD_CLIENTE ) E '
      
        #9'   CROSS APPLY (SELECT G1.NM_EMAIL_CONSULTA_LI FROM TGRUPO G1 (' +
        'NOLOCK) WHERE G1.CD_GRUPO = P.CD_GRUPO ) G '
      
        #9'   LEFT JOIN TUSUARIO U (NOLOCK) ON U.CD_USUARIO = P.CD_ANALIST' +
        'A_COMISSARIA'
      ''
      #9'WHERE'
      #9'ISNULL(P.IN_CANCELADO, '#39'0'#39') <> '#39'1'#39' '
      #9'AND ISNULL(L.IN_CANCELADO, '#39'0'#39') <> '#39'1'#39' '
      '        AND ISNULL(L.IN_LPCO, '#39'0'#39') <> '#39'1'#39' '
      #9'AND ISNULL(L.IN_UTILIZADO, '#39'0'#39') <> '#39'1'#39' '
      
        #9'AND CONVERT(INT, REPLACE( SUBSTRING(L.NR_LI, 1, 2), '#39'\'#39','#39'0'#39')) >' +
        ' 10'
      ' '#9#9#9#9#9'-- AND CD_GRUPO IN ('#39'002'#39', '#39'155'#39')'
      #9'AND '
      #9'('
      #9#9#9#9'   /* E PROCESSOS LI QUE N'#195'O TIVEREM STATUS DEFERIDO */'
      #9'  ( '
      #9#9#9'( SELECT COUNT(*) FROM TPROCESSO_LI_STATUS LS (NOLOCK) '
      
        #9#9#9#9#9#9#9'  WHERE LS.NR_PROCESSO = L.NR_PROCESSO AND LS.NR_LI = L.N' +
        'R_LI AND LS.TX_STATUS in ('#39'DEFERIDO'#39', '#39'DEFERIDA'#39')'
      #9#9#9' ) = 0 '
      #9'   ) '
      #9'   '
      
        #9'   OR '#9#9#9#9#9#9'/* OU QUE TIVER STATUS DE DEFERIDO, MAS N'#195'O TIVER S' +
        'TATUS DE UTILIZADO */'
      #9'   ( '
      #9#9#9' ( ( SELECT COUNT(*)  FROM TPROCESSO_LI_STATUS LS (NOLOCK) '
      
        #9#9#9#9#9#9#9#9'  WHERE LS.NR_PROCESSO = L.NR_PROCESSO AND LS.NR_LI = L.' +
        'NR_LI AND LS.TX_STATUS in ('#39'DEFERIDO'#39', '#39'DEFERIDA'#39')'
      #9#9#9'   ) > 0 '
      #9#9#9' ) '
      #9#9#9' AND '
      #9#9#9' ( ( SELECT COUNT(*)  FROM TPROCESSO_LI_STATUS LS (NOLOCK) '
      
        #9#9#9#9#9#9#9#9'  WHERE LS.NR_PROCESSO = L.NR_PROCESSO AND LS.NR_LI = L.' +
        'NR_LI AND LS.TX_STATUS = '#39'UTILIZADO'#39' '
      #9#9#9'   ) = 0'
      #9#9#9' )'
      #9'   ) '
      #9')'
      ') SUB_SELECT')
    Left = 160
    Top = 48
    object qryConsultaLINR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryConsultaLINR_LI: TStringField
      FieldName = 'NR_LI'
      Origin = 'NR_LI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryConsultaLIDT_REGISTRO: TSQLTimeStampField
      FieldName = 'DT_REGISTRO'
      Origin = 'DT_REGISTRO'
    end
    object qryConsultaLIDT_DEFERIMENTO: TSQLTimeStampField
      FieldName = 'DT_DEFERIMENTO'
      Origin = 'DT_DEFERIMENTO'
    end
    object qryConsultaLIDT_VENCTO: TSQLTimeStampField
      FieldName = 'DT_VENCTO'
      Origin = 'DT_VENCTO'
    end
    object qryConsultaLIIN_SUBSTITUIDA: TStringField
      FieldName = 'IN_SUBSTITUIDA'
      Origin = 'IN_SUBSTITUIDA'
      FixedChar = True
      Size = 1
    end
    object qryConsultaLINR_SUBSTITUIDA: TStringField
      FieldName = 'NR_SUBSTITUIDA'
      Origin = 'NR_SUBSTITUIDA'
      FixedChar = True
      Size = 10
    end
    object qryConsultaLIIN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qryConsultaLITX_OBS_CANC: TMemoField
      FieldName = 'TX_OBS_CANC'
      Origin = 'TX_OBS_CANC'
      BlobType = ftMemo
    end
    object qryConsultaLIIN_UTILIZADO: TStringField
      FieldName = 'IN_UTILIZADO'
      Origin = 'IN_UTILIZADO'
      FixedChar = True
      Size = 1
    end
    object qryConsultaLIIN_SEM_REPRESENTACAO: TStringField
      FieldName = 'IN_SEM_REPRESENTACAO'
      Origin = 'IN_SEM_REPRESENTACAO'
      FixedChar = True
      Size = 1
    end
    object qryConsultaLIIN_LI_PRE_JA_EMBARCADO: TStringField
      FieldName = 'IN_LI_PRE_JA_EMBARCADO'
      Origin = 'IN_LI_PRE_JA_EMBARCADO'
      FixedChar = True
      Size = 1
    end
    object qryConsultaLIDT_CONSULTA_SCX: TSQLTimeStampField
      FieldName = 'DT_CONSULTA_SCX'
      Origin = 'DT_CONSULTA_SCX'
    end
    object qryConsultaLIIN_FILA_RECUPERAR: TStringField
      FieldName = 'IN_FILA_RECUPERAR'
      Origin = 'IN_FILA_RECUPERAR'
      FixedChar = True
      Size = 1
    end
    object qryConsultaLINR_INMETRO: TIntegerField
      FieldName = 'NR_INMETRO'
      Origin = 'NR_INMETRO'
    end
    object qryConsultaLINUMERO_IP_BRI: TStringField
      FieldName = 'NUMERO_IP_BRI'
      Origin = 'NUMERO_IP_BRI'
      Size = 30
    end
    object qryConsultaLIDATA_SOLICI_PRORROGACAO: TSQLTimeStampField
      FieldName = 'DATA_SOLICI_PRORROGACAO'
      Origin = 'DATA_SOLICI_PRORROGACAO'
    end
    object qryConsultaLICD_POSTO_ANVISA: TIntegerField
      FieldName = 'CD_POSTO_ANVISA'
      Origin = 'CD_POSTO_ANVISA'
    end
    object qryConsultaLINR_PROCESSO_ANVISA: TStringField
      FieldName = 'NR_PROCESSO_ANVISA'
      Origin = 'NR_PROCESSO_ANVISA'
      FixedChar = True
    end
    object qryConsultaLINR_EXPEDIENTE_ANVISA: TStringField
      FieldName = 'NR_EXPEDIENTE_ANVISA'
      Origin = 'NR_EXPEDIENTE_ANVISA'
      FixedChar = True
      Size = 11
    end
    object qryConsultaLIIN_PRE_EMBARQUE: TStringField
      FieldName = 'IN_PRE_EMBARQUE'
      Origin = 'IN_PRE_EMBARQUE'
      FixedChar = True
      Size = 1
    end
    object qryConsultaLIDT_SOLICITACAO: TSQLTimeStampField
      FieldName = 'DT_SOLICITACAO'
      Origin = 'DT_SOLICITACAO'
    end
    object qryConsultaLINM_EMISSOR: TStringField
      FieldName = 'NM_EMISSOR'
      Origin = 'NM_EMISSOR'
      FixedChar = True
      Size = 60
    end
    object qryConsultaLIQT_ITENS: TIntegerField
      FieldName = 'QT_ITENS'
      Origin = 'QT_ITENS'
    end
    object qryConsultaLIDT_APTO_FIN_DOSSIE: TSQLTimeStampField
      FieldName = 'DT_APTO_FIN_DOSSIE'
      Origin = 'DT_APTO_FIN_DOSSIE'
    end
    object qryConsultaLIDT_FIN_DOSSIE: TSQLTimeStampField
      FieldName = 'DT_FIN_DOSSIE'
      Origin = 'DT_FIN_DOSSIE'
    end
    object qryConsultaLINR_DOSSIE: TStringField
      FieldName = 'NR_DOSSIE'
      Origin = 'NR_DOSSIE'
      FixedChar = True
      Size = 16
    end
    object qryConsultaLIDT_DOCTOS_DOSSIE: TSQLTimeStampField
      FieldName = 'DT_DOCTOS_DOSSIE'
      Origin = 'DT_DOCTOS_DOSSIE'
    end
    object qryConsultaLIDT_EMISSAO_GRU: TSQLTimeStampField
      FieldName = 'DT_EMISSAO_GRU'
      Origin = 'DT_EMISSAO_GRU'
    end
    object qryConsultaLINR_TRANSACAO_GRU: TStringField
      FieldName = 'NR_TRANSACAO_GRU'
      Origin = 'NR_TRANSACAO_GRU'
      FixedChar = True
      Size = 11
    end
    object qryConsultaLIDT_PGMTO_GRU: TSQLTimeStampField
      FieldName = 'DT_PGMTO_GRU'
      Origin = 'DT_PGMTO_GRU'
    end
    object qryConsultaLIDT_PROTOCOLO_GRU: TSQLTimeStampField
      FieldName = 'DT_PROTOCOLO_GRU'
      Origin = 'DT_PROTOCOLO_GRU'
    end
    object qryConsultaLICD_CANAL: TStringField
      FieldName = 'CD_CANAL'
      Origin = 'CD_CANAL'
      FixedChar = True
      Size = 1
    end
    object qryConsultaLICD_USUARIO_EMISSOR: TStringField
      FieldName = 'CD_USUARIO_EMISSOR'
      Origin = 'CD_USUARIO_EMISSOR'
      FixedChar = True
      Size = 4
    end
    object qryConsultaLINR_DOSSIE_POS: TStringField
      FieldName = 'NR_DOSSIE_POS'
      Origin = 'NR_DOSSIE_POS'
      Size = 16
    end
    object qryConsultaLICD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'CD_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryConsultaLILI_FORMATADA: TStringField
      FieldName = 'LI_FORMATADA'
      Origin = 'LI_FORMATADA'
      ReadOnly = True
      Size = 12
    end
    object qryConsultaLINM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Origin = 'NM_EMAIL'
      Size = 2000
    end
    object qryConsultaLINM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'NM_EMPRESA'
      Size = 80
    end
    object qryConsultaLINM_EMAIL_CONSULTA_LI: TStringField
      FieldName = 'NM_EMAIL_CONSULTA_LI'
      Origin = 'NM_EMAIL_CONSULTA_LI'
      Size = 600
    end
  end
  object qryConsultaStatusLi: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evRecordCountMode]
    FetchOptions.RowsetSize = 10000
    SQL.Strings = (
      
        'SELECT *, CONVERT(VARCHAR, DT_STATUS,103) AS DATA_STATUS FROM TP' +
        'ROCESSO_LI_STATUS '
      'WHERE NR_LI = :NR_LI')
    Left = 376
    Top = 48
    ParamData = <
      item
        Name = 'NR_LI'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryConsultaStatusLiNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryConsultaStatusLiNR_LI: TStringField
      FieldName = 'NR_LI'
      Origin = 'NR_LI'
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryConsultaStatusLiDT_STATUS: TSQLTimeStampField
      FieldName = 'DT_STATUS'
      Origin = 'DT_STATUS'
    end
    object qryConsultaStatusLiTX_STATUS: TStringField
      FieldName = 'TX_STATUS'
      Origin = 'TX_STATUS'
      FixedChar = True
      Size = 60
    end
    object qryConsultaStatusLiTX_DIR_EXTRATO: TStringField
      FieldName = 'TX_DIR_EXTRATO'
      Origin = 'TX_DIR_EXTRATO'
      Size = 200
    end
    object qryConsultaStatusLiCD_ORGAO_ANUENTE: TStringField
      FieldName = 'CD_ORGAO_ANUENTE'
      Origin = 'CD_ORGAO_ANUENTE'
      FixedChar = True
      Size = 16
    end
    object qryConsultaStatusLiDT_CONSULTA: TSQLTimeStampField
      FieldName = 'DT_CONSULTA'
      Origin = 'DT_CONSULTA'
    end
    object qryConsultaStatusLiDT_STATUS_EFETIVA: TSQLTimeStampField
      FieldName = 'DT_STATUS_EFETIVA'
      Origin = 'DT_STATUS_EFETIVA'
    end
    object qryConsultaStatusLiTX_OBS: TMemoField
      FieldName = 'TX_OBS'
      Origin = 'TX_OBS'
      BlobType = ftMemo
      Size = 2147483647
    end
    object qryConsultaStatusLiDS_TRATAMENTO_ADM: TMemoField
      FieldName = 'DS_TRATAMENTO_ADM'
      Origin = 'DS_TRATAMENTO_ADM'
      BlobType = ftMemo
      Size = 2147483647
    end
    object qryConsultaStatusLiDS_ANDAMENTO_ANUENCIA: TMemoField
      FieldName = 'DS_ANDAMENTO_ANUENCIA'
      Origin = 'DS_ANDAMENTO_ANUENCIA'
      BlobType = ftMemo
      Size = 2147483647
    end
    object qryConsultaStatusLiDT_VALIDADE_DESPACHO: TSQLTimeStampField
      FieldName = 'DT_VALIDADE_DESPACHO'
      Origin = 'DT_VALIDADE_DESPACHO'
    end
    object qryConsultaStatusLiDT_VALIDADE_EMBARQUE: TSQLTimeStampField
      FieldName = 'DT_VALIDADE_EMBARQUE'
      Origin = 'DT_VALIDADE_EMBARQUE'
    end
    object qryConsultaStatusLiIN_EMAIL_ENVIADO: TStringField
      FieldName = 'IN_EMAIL_ENVIADO'
      Origin = 'IN_EMAIL_ENVIADO'
      FixedChar = True
      Size = 1
    end
    object qryConsultaStatusLiDATA_STATUS: TStringField
      FieldName = 'DATA_STATUS'
      Origin = 'DATA_STATUS'
      ReadOnly = True
      Size = 30
    end
  end
  object qryProcessosStatusLi: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      '   L.NR_PROCESSO AS NR_PROCESSO'
      'FROM'
      '   TPROCESSO_LI L (NOLOCK) '
      
        '   INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = L.NR_PROCE' +
        'SSO '
      ''
      'WHERE'
      'ISNULL(P.IN_CANCELADO, '#39'0'#39') <> '#39'1'#39' '
      'AND ISNULL(L.IN_CANCELADO, '#39'0'#39') <> '#39'1'#39' '
      'AND ISNULL(L.IN_LPCO, '#39'0'#39') <> '#39'1'#39
      'AND ISNULL(L.IN_UTILIZADO, '#39'0'#39') <> '#39'1'#39' '
      
        'AND CONVERT(INT, REPLACE( SUBSTRING(L.NR_LI, 1, 2), '#39'\'#39','#39'0'#39')) > ' +
        '10'
      ' '#9#9#9#9'-- AND CD_GRUPO IN ('#39'002'#39', '#39'155'#39')'
      'AND '
      '('
      
        '               /* E PROCESSOS LI QUE N'#195'O TIVEREM STATUS DEFERIDO' +
        ' */'
      '  ( '
      #9#9'( SELECT COUNT(*) FROM TPROCESSO_LI_STATUS LS (NOLOCK) '
      
        #9#9#9#9#9#9'  WHERE LS.NR_PROCESSO = L.NR_PROCESSO AND LS.NR_LI = L.NR' +
        '_LI AND LS.TX_STATUS in ('#39'DEFERIDO'#39', '#39'DEFERIDA'#39')'
      #9#9' ) = 0 '
      '   ) '
      '   '
      
        '   OR '#9#9#9#9#9#9'/* OU QUE TIVER STATUS DE DEFERIDO, MAS N'#195'O TIVER ST' +
        'ATUS DE UTILIZADO */'
      '   ( '
      #9#9' ( ( SELECT COUNT(*)  FROM TPROCESSO_LI_STATUS LS (NOLOCK) '
      
        #9#9#9#9#9#9#9'  WHERE LS.NR_PROCESSO = L.NR_PROCESSO AND LS.NR_LI = L.N' +
        'R_LI AND LS.TX_STATUS in ('#39'DEFERIDO'#39', '#39'DEFERIDA'#39')'
      #9#9'   ) > 0 '
      #9#9' ) '
      #9#9' AND '
      #9#9' ( ( SELECT COUNT(*)  FROM TPROCESSO_LI_STATUS LS (NOLOCK) '
      
        #9#9#9#9#9#9#9'  WHERE LS.NR_PROCESSO = L.NR_PROCESSO AND LS.NR_LI = L.N' +
        'R_LI AND LS.TX_STATUS = '#39'UTILIZADO'#39' '
      #9#9'   ) = 0'
      #9#9' )'
      '   ) '
      ')'
      'AND NR_LI = :NR_LI')
    Left = 264
    Top = 48
    ParamData = <
      item
        Name = 'NR_LI'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryProcessosStatusLiNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
  end
  object qryUpdateDtNovoStatus: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize, evRecordCountMode]
    FetchOptions.RowsetSize = 10000
    SQL.Strings = (
      
        'UPDATE TPROCESSO_LI SET DT_ULT_MUDANCA_STATUS = GETDATE() WHERE ' +
        'NR_LI = :NR_LI AND NR_PROCESSO = :NR_PROCESSO')
    Left = 488
    Top = 48
    ParamData = <
      item
        Name = 'NR_LI'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end

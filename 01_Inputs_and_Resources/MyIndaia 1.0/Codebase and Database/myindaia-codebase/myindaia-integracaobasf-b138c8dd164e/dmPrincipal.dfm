object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 323
  Width = 360
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=BROKER'
      'User_Name=sa'
      'Password=123'
      'Server=INDAIA10'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 59
    Top = 38
  end
  object qryInsereEventosNaFilaHoje: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 10000
    SQL.Strings = (
      'INSERT INTO TFILA_ATZ_EVENTOS_BASF'
      ''
      '--SELECT *, GETDATE(), null FROM '
      
        'SELECT [MainLeg], [Booking], [CodigoEvento], [ValorEvento], GETD' +
        'ATE(), null, [TransportDocument] FROM'
      '('
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV308.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV308.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV308'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV308.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '308.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV308' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV308.CD_EVENTO='#39'308'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV308.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV347.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV347.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV347'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV347.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '347.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV347' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV347.CD_EVENTO='#39'347'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV347.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      '        EV131.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV131.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV131'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV131.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '131.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV131' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV131.CD_EVENTO='#39'131'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV131.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV314.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV314.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV314'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV314.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '314.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV314' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV314.CD_EVENTO='#39'314'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV314.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV124.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV124.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV124'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV124.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '124.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV124' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV124.CD_EVENTO='#39'124'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV124.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV545.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV545.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV545'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV545.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '545.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV545' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV545.CD_EVENTO='#39'545'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV545.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV491.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV491.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV491'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV491.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '491.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV491' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV491.CD_EVENTO='#39'491'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV491.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV315.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV315.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV315'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV315.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '315.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV315' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV315.CD_EVENTO='#39'315'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV315.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV088.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV088.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV088'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV088.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '088.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV088' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV088.CD_EVENTO='#39'088'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV088.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV132.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV132.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV132'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV132.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '132.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV132' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV132.CD_EVENTO='#39'132'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV132.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV165.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV165.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV165'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV165.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '165.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV165' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV165.CD_EVENTO='#39'165'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV165.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV495.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV495.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV495'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV495.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '495.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV495' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV495.CD_EVENTO='#39'495'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV495.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV139.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV139.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV139'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV139.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '139.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV139' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV139.CD_EVENTO='#39'139'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV139.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV141.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV141.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV141'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV141.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '141.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV141' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV141.CD_EVENTO='#39'141'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV141.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV582.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV582.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV582'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV582.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '582.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV582' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV582.CD_EVENTO='#39'582'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV582.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV583.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV583.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV583'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV583.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '583.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV583' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV583.CD_EVENTO='#39'583'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV583.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV333.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV333.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV333'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV333.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '333.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV333' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV333.CD_EVENTO='#39'333'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV333.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV261.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV261.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV261'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV261.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '261.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV261' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV261.CD_EVENTO='#39'261'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV261.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ''
      #9'UNION ALL'
      ''
      #9'SELECT  '
      #9'ML.CD_REFERENCIA AS [MainLeg],'
      #9'RC.CD_REFERENCIA AS [Booking],'
      #9'EV634.CD_EVENTO AS [CodigoEvento],'
      '        TP.NR_CONHECIMENTO AS [TransportDocument],'
      #9'CONVERT(VARCHAR(19),EV634.DT_REALIZACAO,126) AS [ValorEvento]'
      #9'FROM BROKER.DBO.TFOLLOWUP EV634'
      
        #9'LEFT JOIN BROKER.DBO.TREF_CLIENTE RC (NOLOCK) ON RC.NR_PROCESSO' +
        ' = EV634.NR_PROCESSO AND RC.TP_REFERENCIA='#39'05'#39
      
        #9'JOIN BROKER.DBO.TREF_CLIENTE ML (NOLOCK) ON ML.NR_PROCESSO = EV' +
        '634.NR_PROCESSO AND ML.TP_REFERENCIA='#39'19'#39' '
      
        #9'JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = EV634' +
        '.NR_PROCESSO'
      
        #9'WHERE TP.CD_GRUPO IN ('#39'002'#39','#39'013'#39','#39'559'#39') AND TP.CD_PRODUTO='#39'02'#39 +
        ' AND TP.IN_CANCELADO=0 '
      #9'AND '
      #9'EV634.CD_EVENTO='#39'634'#39' AND '
      
        #9'CONVERT(VARCHAR(10),EV634.DT_REALIZACAO_EFETIVA,21) = CONVERT(V' +
        'ARCHAR(10),getdate()-1,21)'
      ') SUB')
    Left = 60
    Top = 160
  end
  object qryMainLeg: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 10000
    SQL.Strings = (
      'SELECT '
      'MainLeg, '
      'ISNULL(Booking, '#39#39') as Booking, '
      'ISNULL(TransportDocument, '#39#39') as TransportDocument, '
      'CodigoEvento, '
      'ValorEvento '
      ''
      'FROM TFILA_ATZ_EVENTOS_BASF WHERE MainLeg = :MainLeg'
      'ORDER BY TRANSPORTDOCUMENT DESC')
    Left = 192
    Top = 104
    ParamData = <
      item
        Name = 'MAINLEG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryMainLegMainLeg: TStringField
      FieldName = 'MainLeg'
      Origin = 'MainLeg'
      Size = 30
    end
    object qryMainLegBooking: TStringField
      FieldName = 'Booking'
      Origin = 'Booking'
      ReadOnly = True
      Required = True
      Size = 30
    end
    object qryMainLegCodigoEvento: TStringField
      FieldName = 'CodigoEvento'
      Origin = 'CodigoEvento'
      Size = 3
    end
    object qryMainLegValorEvento: TStringField
      FieldName = 'ValorEvento'
      Origin = 'ValorEvento'
      Size = 19
    end
    object qryMainLegTransportDocument: TStringField
      FieldName = 'TransportDocument'
      Origin = 'TransportDocument'
      ReadOnly = True
      Required = True
      Size = 30
    end
  end
  object qryFilaHoje: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 10000
    SQL.Strings = (
      '')
    Left = 60
    Top = 104
  end
  object qryAtzEnvioFila: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 10000
    SQL.Strings = (
      
        'UPDATE TFILA_ATZ_EVENTOS_BASF SET DataEnvio = GETDATE() WHERE Ca' +
        'st(DataConsulta as date) = Cast(GetDate() as date) AND  MainLeg ' +
        '= :MainLeg')
    Left = 192
    Top = 160
    ParamData = <
      item
        Name = 'MAINLEG'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryFilaHojePendente: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 10000
    SQL.Strings = (
      '')
    Left = 58
    Top = 216
  end
  object qryDeleteConsultasAntigas: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 10000
    SQL.Strings = (
      
        'DELETE FROM TFILA_ATZ_EVENTOS_BASF WHERE DataConsulta < (GETDATE' +
        '() - 40)')
    Left = 196
    Top = 216
  end
end

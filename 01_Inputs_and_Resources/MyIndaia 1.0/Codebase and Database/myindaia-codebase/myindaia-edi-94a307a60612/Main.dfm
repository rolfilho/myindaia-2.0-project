object frmMain: TfrmMain
  Left = 248
  Top = 104
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = 
    'MyRob'#244' - Gerenciador de Envio de Alertas [MyIndaiaMail] - v.21.0' +
    '9.18'
  ClientHeight = 515
  ClientWidth = 761
  Color = 7034429
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 41
    Top = 49
    Width = 57
    Height = 41
  end
  object grfBar: TGauge
    Left = 153
    Top = 4
    Width = 216
    Height = 12
    BackColor = clSilver
    BorderStyle = bsNone
    Color = clSilver
    ParentColor = False
    Progress = 0
    ShowText = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 23
    Width = 761
    Height = 446
    Align = alClient
    Style = bsRaised
    ExplicitLeft = -32
    ExplicitWidth = 900
  end
  object Log: TRichEdit
    Left = 368
    Top = 31
    Width = 200
    Height = 200
    BorderWidth = 1
    Color = 7288576
    Font.Charset = ANSI_CHARSET
    Font.Color = 16751415
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    Visible = False
    Zoom = 100
  end
  object stbMain: TStatusBar
    Left = 0
    Top = 497
    Width = 761
    Height = 18
    Panels = <
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Width = 220
      end
      item
        Alignment = taCenter
        Width = 180
      end>
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 469
    Width = 761
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object Button2: TButton
      Left = 284
      Top = 2
      Width = 98
      Height = 25
      Caption = 'Testa Imagem Link'
      TabOrder = 0
      Visible = False
      OnClick = Button2Click
    end
    object btnExecutarRelatorio: TButton
      Left = 127
      Top = 2
      Width = 100
      Height = 25
      Caption = 'Executar Relat'#243'rio'
      TabOrder = 1
      OnClick = btnExecutarRelatorioClick
    end
    object btnEnviaPendentes: TButton
      Left = 11
      Top = 2
      Width = 92
      Height = 25
      Caption = 'Envia Pendentes'
      TabOrder = 2
      OnClick = btnEnviaPendentesClick
    end
    object Philips: TButton
      Left = 772
      Top = 3
      Width = 128
      Height = 25
      Caption = 'prometeon'
      TabOrder = 3
      Visible = False
      OnClick = PhilipsClick
    end
    object chkVisualizarExcel: TCheckBox
      Left = 556
      Top = 6
      Width = 189
      Height = 17
      Caption = 'Visualizar Excel ao gerar relat'#243'rios'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 761
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object pnlAlerta: TPanel
      Left = 0
      Top = 0
      Width = 382
      Height = 23
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 2
        Top = 2
        Width = 42
        Height = 19
        Align = alLeft
        Caption = 'Alerta: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lblAlerta: TLabel
        Left = 44
        Top = 2
        Width = 336
        Height = 19
        Align = alClient
        Caption = '00000'
        Layout = tlCenter
        ExplicitWidth = 30
        ExplicitHeight = 13
      end
    end
    object pnlTipoAlerta: TPanel
      Left = 382
      Top = 0
      Width = 110
      Height = 23
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label2: TLabel
        Left = 2
        Top = 2
        Width = 34
        Height = 19
        Align = alLeft
        Caption = 'Tipo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lblTipoAlerta: TLabel
        Left = 36
        Top = 2
        Width = 72
        Height = 19
        Align = alClient
        Caption = '000'
        Layout = tlCenter
        ExplicitWidth = 18
        ExplicitHeight = 13
      end
    end
    object pnlMensagem: TPanel
      Left = 492
      Top = 0
      Width = 269
      Height = 23
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object lblMensagem: TLabel
        Left = 2
        Top = 2
        Width = 265
        Height = 19
        Align = alClient
        Caption = '-'
        Layout = tlCenter
        ExplicitWidth = 3
        ExplicitHeight = 13
      end
    end
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 384
    Top = 264
    Width = 145
    Height = 21
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 23
    Width = 761
    Height = 446
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    Caption = 'Panel1'
    Color = clWhite
    TabOrder = 5
    object memLog: TRichEdit
      Left = 3
      Top = 3
      Width = 755
      Height = 440
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelKind = bkSoft
      BorderStyle = bsNone
      Color = clHighlightText
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = 16751415
      Font.Height = -12
      Font.Name = 'Terminal'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      Zoom = 100
    end
  end
  object WatchTimer: TTimer
    Enabled = False
    Interval = 4000
    OnTimer = Watch
    Left = 696
    Top = 168
  end
  object popTray: TPopupMenu
    Left = 106
    Top = 159
    object cmdVerLog: TMenuItem
      Caption = 'Log vis'#237'vel'
      Checked = True
      OnClick = VerLog
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Fechar1: TMenuItem
      Caption = 'Fechar'
      OnClick = Fechar
    end
  end
  object db_broker: TDatabase
    DatabaseName = 'BROKER'
    HandleShared = True
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=MYROBO'
      'PASSWORD=123')
    SessionName = 'SES_EDI'
    Left = 592
    Top = 317
  end
  object sesEDI: TSession
    SessionName = 'SES_EDI'
    Left = 596
    Top = 207
  end
  object App: TApplicationEvents
    OnException = TratarErros
    OnIdle = ProcessLoop
    Left = 592
    Top = 259
  end
  object qryProc: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      
        'SELECT DISTINCT PRO.NR_PROCESSO, PRO.NR_EMBARQUE, PRO.ANO_EMBARQ' +
        'UE,DI.DT_CHEGADA_CARGA,TP.NM_CANAL AS CD_CANAL,'
      
        '(SELECT APELIDO FROM TTRANSPORTADOR_ITL ITL (NOLOCK) WHERE ITL.C' +
        'ODIGO = DI.CD_TRANSPORTADOR) AS CD_TRANSPORTADOR,'
      
        '(SELECT CD_SHIP_TO FROM TPO PO (NOLOCK) WHERE PO.NR_PROCESSO = D' +
        'M.NR_PROC_PO) AS SHIP,'
      
        '(SELECT NM_OCORR FROM TOCORRENCIA OC (NOLOCK) WHERE PRO.CD_OCORR' +
        'ENCIA_EMB = OC.CD_OCORR) AS NM_OCORRENCIA,'
      
        '(SELECT SUM(EMB.QT_EMBALAGEM) FROM TPROCESSO_EMBALAGEM EMB (NOLO' +
        'CK) WHERE EMB.NR_PROCESSO = PRO.NR_PROCESSO) AS VOLUME,'
      
        '(SELECT CC.DT_LANCAMENTO FROM TFATURAMENTO_CC_CLIENTE CC (NOLOCK' +
        ') WHERE CC.NR_PROCESSO =* PRO.NR_PROCESSO AND CC.CD_ITEM = '#39'010'#39 +
        ') AS DATA_LANC,'
      
        'DI.NR_DECLARACAO_IMP, DI.DT_REGISTRO_DI, PRO.VL_CIF_DOLAR, PRO.N' +
        'R_CONHECIMENTO, PRO.NR_CONHECIMENTO_MASTER, DI.PB_CARGA, PRO.CD_' +
        'OCORRENCIA_EMB,'
      
        '(SELECT UP.DT_REALIZACAO FROM TFOLLOWUP UP (NOLOCK) WHERE UP.NR_' +
        'PROCESSO = PRO.NR_PROCESSO AND CD_EVENTO = '#39'033'#39') AS DATA_ENVELO' +
        'PE'
      
        '--(SELECT CN.NM_CANAL FROM TTP_CANAL CN (NOLOCK) WHERE CN.CD_CAN' +
        'AL = PRO.CD_CANAL ) AS CD_CANAL'
      
        'FROM TPROCESSO PRO (NOLOCK), TDECLARACAO_IMPORTACAO DI (NOLOCK),' +
        ' TDETALHE_MERCADOR (NOLOCK)IA DM (NOLOCK), TTP_CANAL TP (NOLOCK)'
      'WHERE PRO.NR_PROCESSO = DI.NR_PROCESSO'
      'AND   PRO.NR_PROCESSO = DM.NR_PROCESSO'
      'AND   PRO.IN_CANCELADO = '#39'0'#39
      'AND   PRO.CD_CANAL     *= TP.CD_CANAL'
      
        'AND   ((SELECT UP.DT_REALIZACAO FROM TFOLLOWUP UP (NOLOCK) WHERE' +
        ' UP.NR_PROCESSO = PRO.NR_PROCESSO AND CD_EVENTO = '#39'018'#39') IS NULL' +
        ')'
      '')
    Left = 274
    Top = 43
  end
  object dtsProc: TDataSource
    DataSet = qryProc
    Left = 42
    Top = 101
  end
  object qry_sel_acordo: TQuery
    Tag = 1
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      'SELECT PC_ALIQ_ACOR_TARIF, PC_ALIQ_REDUZIDA, PC_ALIQ_NORM_ADVAL'
      'FROM TRIBUTO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ADICAO = :NR_ADICAO AND'
      'CD_RECEITA_IMPOSTO = '#39'0001'#39
      ' ')
    Left = 280
    Top = 391
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
    object qry_sel_acordoPC_ALIQ_ACOR_TARIF: TFloatField
      FieldName = 'PC_ALIQ_ACOR_TARIF'
      Origin = 'BROKER.TRIBUTO.PC_ALIQ_ACOR_TARIF'
    end
    object qry_sel_acordoPC_ALIQ_REDUZIDA: TFloatField
      FieldName = 'PC_ALIQ_REDUZIDA'
      Origin = 'BROKER.TRIBUTO.PC_ALIQ_REDUZIDA'
    end
    object qry_sel_acordoPC_ALIQ_NORM_ADVAL: TFloatField
      FieldName = 'PC_ALIQ_NORM_ADVAL'
      Origin = 'BROKER.TRIBUTO.PC_ALIQ_NORM_ADVAL'
    end
  end
  object qry_adicao_: TQuery
    Tag = 1
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      'SELECT CD_REGIME_TRIBUTAR, CD_ACORDO_ALADI, IN_IPI_NAO_TRIBUT'
      'FROM TADICAO_DE_IMPORTACAO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'AND NR_ADICAO = :NR_ADICAO'
      'ORDER BY NR_PROCESSO, NR_ADICAO')
    Left = 338
    Top = 159
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
    object qry_adicao_CD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      Origin = 'BROKER.TADICAO_DE_IMPORTACAO.CD_REGIME_TRIBUTAR'
      FixedChar = True
      Size = 1
    end
    object qry_adicao_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Origin = 'BROKER.TADICAO_DE_IMPORTACAO.CD_ACORDO_ALADI'
      FixedChar = True
      Size = 3
    end
    object qry_adicao_IN_IPI_NAO_TRIBUT: TBooleanField
      FieldName = 'IN_IPI_NAO_TRIBUT'
      Origin = 'BROKER.TADICAO_DE_IMPORTACAO.IN_IPI_NAO_TRIBUT'
    end
  end
  object qry_sel_acordo_ipi: TQuery
    Tag = 1
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      'SELECT CD_TIPO_BENEF_IPI, PC_ALIQ_REDUZIDA, PC_ALIQ_NORM_ADVAL'
      'FROM TRIBUTO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_ADICAO = :NR_ADICAO AND'
      'CD_RECEITA_IMPOSTO = '#39'0002'#39)
    Left = 274
    Top = 101
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
    object qry_sel_acordo_ipiCD_TIPO_BENEF_IPI: TStringField
      FieldName = 'CD_TIPO_BENEF_IPI'
      Origin = 'DBBROKER.TRIBUTO.CD_TIPO_BENEF_IPI'
      FixedChar = True
      Size = 1
    end
    object qry_sel_acordo_ipiPC_ALIQ_REDUZIDA: TFloatField
      FieldName = 'PC_ALIQ_REDUZIDA'
      Origin = 'DBBROKER.TRIBUTO.PC_ALIQ_REDUZIDA'
    end
    object qry_sel_acordo_ipiPC_ALIQ_NORM_ADVAL: TFloatField
      FieldName = 'PC_ALIQ_NORM_ADVAL'
      Origin = 'DBBROKER.TRIBUTO.PC_ALIQ_NORM_ADVAL'
    end
  end
  object qrymsg04: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      
        'SELECT  P.NR_PROCESSO, P.NM_EMPRESA_BASF,CONVERT(DATETIME,CONVER' +
        'T(VARCHAR(10),GETDATE(),103),103) AS DT_ARQUIVO,'
      '  '#39'I'#39' AS IN_EDI_BASF,'
      ' E.CGC_EMPRESA AS CNPJ_IMPORTADOR,'
      ' P.NR_PROCESSO,'
      
        ' (SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK) WHERE NR' +
        '_PROCESSO =P.NR_PROCESSO) AS CD_REFERENCIA,'
      '(SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK)'
      ' WHERE NR_PROCESSO = P.NR_PROCESSO'
      
        '  AND CD_EVENTO = (SELECT CD_EV_CHEGADA FROM TPARAMETROS (NOLOCK' +
        '))) AS DT_CHEGADA,'
      '(SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK)'
      ' WHERE NR_PROCESSO = P.NR_PROCESSO'
      
        '  AND CD_EVENTO = (SELECT CD_EV_LIB_BL FROM TPARAMETROS (NOLOCK)' +
        ')) AS DT_LIB_BL,'
      '(SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK)'
      ' WHERE NR_PROCESSO = P.NR_PROCESSO'
      
        '  AND CD_EVENTO = (SELECT CD_EV_CAMBIO_OK FROM TPARAMETROS (NOLO' +
        'CK))) AS DT_CAMBIO_OK ,'
      '(SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK)'
      ' WHERE NR_PROCESSO = P.NR_PROCESSO'
      
        '  AND CD_EVENTO = (SELECT CD_EV_PRES_CARGA FROM TPARAMETROS (NOL' +
        'OCK))) AS DT_PRES_CARGA,'
      ' P.NR_PRESENCA_CARGA,  '
      '(SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK)'
      ' WHERE NR_PROCESSO = P.NR_PROCESSO'
      
        '  AND CD_EVENTO = (SELECT CD_EV_REG_DI FROM TPARAMETROS (NOLOCK)' +
        ')) AS DT_REG_DI,'
      '(SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK)'
      ' WHERE NR_PROCESSO = P.NR_PROCESSO'
      
        '  AND CD_EVENTO = (SELECT CD_EV_CI FROM TPARAMETROS (NOLOCK))) A' +
        'S DT_CI,'
      '(SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK)'
      ' WHERE NR_PROCESSO = P.NR_PROCESSO'
      
        '  AND CD_EVENTO = (SELECT CD_EV_DESEMB FROM TPARAMETROS (NOLOCK)' +
        ')) AS DT_DESEMB,'
      '(SELECT DT_REALIZACAO FROM TFOLLOWUP (NOLOCK)'
      ' WHERE NR_PROCESSO = P.NR_PROCESSO'
      
        '  AND CD_EVENTO = (SELECT CD_EV_DTA_TRANSP FROM TPARAMETROS (NOL' +
        'OCK))) AS DT_DTA_TRANSP,'
      'F.TX_OBS'
      
        'FROM TPROCESSO P (NOLOCK), TEMPRESA_NAC E (NOLOCK), TFOLLOWUP F ' +
        '(NOLOCK)'
      ' WHERE E.CD_GRUPO = '#39'002'#39
      ' AND E.CD_EMPRESA  = P.CD_CLIENTE'
      ' AND P.NR_PROCESSO = F.NR_PROCESSO'
      ' AND CD_EVENTO = '#39'022'#39
      ' AND F.IN_CONTR_EDI_BASF = '#39'1'#39
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 280
    Top = 333
  end
  object qrymsg06: TQuery
    AfterClose = qrymsg06AfterClose
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, P.CD_CLIENTE, P.DT_ABERTURA, SUBSTRING(P.I' +
        'N_EDI_BASF,3,1) AS IN_EDI_BASF,'
      
        ' CONVERT(DATETIME,CONVERT(VARCHAR(10),GETDATE(),103),103) AS DT_' +
        'ARQUIVO, E.CGC_EMPRESA AS CNPJ_IMPORTADOR,'
      
        ' (SELECT N.NM_EMBARCACAO FROM TEMBARCACAO N (NOLOCK) WHERE N.CD_' +
        'EMBARCACAO = P.CD_EMBARCACAO) NM_NAVIO,'
      
        ' (SELECT TOP 1 F.CD_REFERENCIA FROM TREF_CLIENTE F (NOLOCK) WHER' +
        'E F.NR_PROCESSO = P.NR_PROCESSO) NR_REF, P.NM_EMPRESA_BASF'
      ' '
      ' FROM TPROCESSO P (NOLOCK), TEMPRESA_NAC E (NOLOCK)'
      ' WHERE E.CD_GRUPO  = '#39'002'#39
      ' AND E.CD_EMPRESA  = P.CD_CLIENTE'
      ' AND P.IN_EDI_BASF IN('#39'06I'#39', '#39'06A'#39')'
      ' ')
    Left = 280
    Top = 159
    object qrymsg06NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qrymsg06CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qrymsg06DT_ABERTURA: TDateTimeField
      FieldName = 'DT_ABERTURA'
    end
    object qrymsg06IN_EDI_BASF: TStringField
      FieldName = 'IN_EDI_BASF'
      FixedChar = True
      Size = 1
    end
    object qrymsg06DT_ARQUIVO: TDateTimeField
      FieldName = 'DT_ARQUIVO'
    end
    object qrymsg06CNPJ_IMPORTADOR: TStringField
      FieldName = 'CNPJ_IMPORTADOR'
      FixedChar = True
      Size = 14
    end
    object qrymsg06NM_NAVIO: TStringField
      FieldName = 'NM_NAVIO'
      FixedChar = True
      Size = 40
    end
    object qrymsg06NR_REF: TStringField
      FieldName = 'NR_REF'
      FixedChar = True
      Size = 15
    end
    object qrymsg06NM_EMPRESA_BASF: TStringField
      FieldName = 'NM_EMPRESA_BASF'
      FixedChar = True
      Size = 4
    end
  end
  object qrymsg05: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, P.CD_CLIENTE, P.DT_ABERTURA, SUBSTRING(P.I' +
        'N_EDI_BASF,3,1) AS IN_EDI_BASF,'
      
        ' CONVERT(DATETIME,CONVERT(VARCHAR(10),GETDATE(),103),103) AS DT_' +
        'ARQUIVO, E.CGC_EMPRESA AS CNPJ_IMPORTADOR,'
      
        ' (SELECT N.NM_EMBARCACAO FROM TEMBARCACAO N (NOLOCK) WHERE N.CD_' +
        'EMBARCACAO = P.CD_EMBARCACAO) NM_NAVIO,'
      
        ' (SELECT TOP 1 F.CD_REFERENCIA FROM TREF_CLIENTE F (NOLOCK) WHER' +
        'E F.NR_PROCESSO = P.NR_PROCESSO) NR_REF,'
      
        ' P.NR_CONHECIMENTO, P.NR_CONHECIMENTO_MASTER, P.DT_CONHECIMENTO,' +
        ' P.CD_LOCAL_EMBARQUE, P.CD_LOCAL_DESEMBARQUE,'
      
        ' D.CD_TIPO_DCTO_CARGA, D.NR_MANIFESTO, P.CD_ARMAZEM_DESCARGA, P.' +
        'CD_ARMAZEM_ATRACACAO,'
      
        ' (SELECT A.NM_ARMAZEM FROM TARMAZEM A (NOLOCK) WHERE A.CD_ARMAZE' +
        'M = P.CD_ARMAZEM_DESCARGA)NM_ARMAZEM_DESCARGA,'
      
        ' (SELECT A.NM_ARMAZEM FROM TARMAZEM A (NOLOCK) WHERE A.CD_ARMAZE' +
        'M = P.CD_ARMAZEM_ATRACACAO)NM_ARMAZEM_ATRACACAO,'
      
        ' (SELECT I.DESCRICAO FROM TTRANSPORTADOR_ITL I (NOLOCK) WHERE I.' +
        'CODIGO = P.CD_TRANSPORTADOR)NM_TRANSPORTADOR,'
      
        ' (SELECT A.NM_AGENTE FROM TAGENTE A (NOLOCK) WHERE A.CD_AGENTE =' +
        ' P.CD_AGENTE)NM_AGENTE,'
      
        ' (SELECT L.DESCRICAO FROM TLOCAL_EMBARQUE L (NOLOCK) WHERE L.COD' +
        'IGO = P.CD_LOCAL_EMBARQUE)NM_LOCAL_EMBARQUE, '
      
        ' D.PB_CARGA, D.VL_TOTAL_FRETE_MNEG, D.VL_TOTAL_FRETE_MN, ( CASE ' +
        'P.CD_MOEDA_FRETE'
      
        '  WHEN '#39'790'#39' THEN '#39'BRL'#39' WHEN '#39'220'#39' THEN '#39'USD'#39'  WHEN '#39'978'#39' THEN '#39 +
        'EUR'#39'  WHEN '#39'470'#39' THEN '#39'JPY'#39' END  ) AS CD_MOEDA_FRETE,'
      ' CASE '
      ' WHEN P.TP_FRETE = '#39'0'#39' THEN '#39'C'#39
      ' ELSE '#39'P'#39' END TP_FRETE  , P.NM_EMPRESA_BASF'
      ''
      
        ' FROM TPROCESSO P (NOLOCK), TEMPRESA_NAC E (NOLOCK), TDECLARACAO' +
        '_IMPORTACAO D (NOLOCK)'
      ' WHERE E.CD_GRUPO  = '#39'002'#39
      ' AND E.CD_EMPRESA  = P.CD_CLIENTE'
      ' AND P.IN_EDI_BASF IN('#39'05I'#39', '#39'05A'#39')'
      ' AND P.NR_PROCESSO = D.NR_PROCESSO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 216
    Top = 101
  end
  object qrymsg07: TQuery
    AfterClose = qrymsg07AfterClose
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      
        'SELECT  PL.NR_LI,  CONVERT(DATETIME,CONVERT(VARCHAR(10),GETDATE(' +
        '),103),103) AS DT_ARQUIVO,'
      '  '#39'I'#39' AS IN_EDI_BASF,'
      ' E.CGC_EMPRESA AS CNPJ_IMPORTADOR,'
      
        '(SELECT TOP 1 CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK) WHERE NR_' +
        'PROCESSO =P.NR_PROCESSO) AS CD_REFERENCIA,'
      ' P.NR_PROCESSO, P.NM_EMPRESA_BASF'
      
        ' FROM  TPROCESSO_LI PL (NOLOCK),  TPROCESSO P (NOLOCK), TEMPRESA' +
        '_NAC E (NOLOCK)'
      'WHERE E.CD_GRUPO = '#39'002'#39
      ' AND E.CD_EMPRESA  = P.CD_CLIENTE'
      ' AND P.NR_PROCESSO = PL.NR_PROCESSO'
      ' AND PL.IN_EDI_BASF = '#39'1'#39
      ' ')
    Left = 280
    Top = 275
    object qrymsg07NR_LI: TStringField
      FieldName = 'NR_LI'
      FixedChar = True
      Size = 10
    end
    object qrymsg07DT_ARQUIVO: TDateTimeField
      FieldName = 'DT_ARQUIVO'
    end
    object qrymsg07IN_EDI_BASF: TStringField
      FieldName = 'IN_EDI_BASF'
      FixedChar = True
      Size = 1
    end
    object qrymsg07CNPJ_IMPORTADOR: TStringField
      FieldName = 'CNPJ_IMPORTADOR'
      FixedChar = True
      Size = 14
    end
    object qrymsg07CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      FixedChar = True
      Size = 15
    end
    object qrymsg07NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qrymsg07NM_EMPRESA_BASF: TStringField
      FieldName = 'NM_EMPRESA_BASF'
      FixedChar = True
      Size = 4
    end
  end
  object qrymsg08: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, P.CD_CLIENTE, P.DT_ABERTURA, SUBSTRING(P.I' +
        'N_EDI_BASF,3,1) AS IN_EDI_BASF,'
      
        ' CONVERT(DATETIME,CONVERT(VARCHAR(10),GETDATE(),103),103) AS DT_' +
        'ARQUIVO, E.CGC_EMPRESA AS CNPJ_IMPORTADOR,'
      
        ' (SELECT TOP 1 F.CD_REFERENCIA FROM TREF_CLIENTE F (NOLOCK) WHER' +
        'E F.NR_PROCESSO = P.NR_PROCESSO) NR_REF, P.NM_EMPRESA_BASF'
      
        ' FROM TPROCESSO P (NOLOCK), TEMPRESA_NAC E (NOLOCK), TDECLARACAO' +
        '_IMPORTACAO D (NOLOCK)'
      ' WHERE E.CD_GRUPO  = '#39'002'#39
      ' AND E.CD_EMPRESA  = P.CD_CLIENTE'
      ' AND P.IN_EDI_BASF IN('#39'08I'#39', '#39'08A'#39')'
      ' AND P.NR_PROCESSO = D.NR_PROCESSO'
      ' ')
    Left = 280
    Top = 217
  end
  object qrymsg09a: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      'SELECT P.NR_PROCESSO, N.NR_SOLICITACAO, N.DT_SOLICITACAO,'
      
        '  CONVERT(DATETIME,CONVERT(VARCHAR(10),GETDATE(),103),103) AS DT' +
        '_ARQUIVO,'
      
        ' (SELECT TOP 1 F.CD_REFERENCIA FROM TREF_CLIENTE F (NOLOCK) WHER' +
        'E F.NR_PROCESSO = P.NR_PROCESSO) NR_REF,'
      ' E.CGC_EMPRESA AS CNPJ_IMPORTADOR,'
      ' CASE'
      '  WHEN P.CD_PRODUTO = '#39'01'#39' THEN '#39'IMPO'#39
      '  ELSE '#39'EXPO'#39' END AS OPERACAO , P.NM_EMPRESA_BASF'
      
        ' FROM TPROCESSO P (NOLOCK), TNUMERARIO N (NOLOCK), TEMPRESA_NAC ' +
        'E (NOLOCK)'
      ' WHERE E.CD_GRUPO = '#39'002'#39
      '   AND E.CD_EMPRESA = P.CD_CLIENTE'
      '   AND P.NR_PROCESSO = N.NR_PROCESSO'
      '   AND N.CD_STATUS IN ('#39'A'#39', '#39'B'#39')'
      '   AND N.IN_EDI_BASF = '#39'9AD'#39
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 338
    Top = 217
  end
  object qrymsg09b: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, S.NR_SOLICITACAO, S.NR_NF_SERV, E.CGC_EMPR' +
        'ESA AS CNPJ_IMPORTADOR,'
      'S.DT_VENCTO_FATURA, S.DT_NF_SERV,'
      
        'CONVERT(DATETIME,CONVERT(VARCHAR(10),GETDATE(),103),103) AS DT_A' +
        'RQUIVO,'
      
        '(SELECT TOP 1 F.CD_REFERENCIA FROM TREF_CLIENTE F (NOLOCK) WHERE' +
        ' F.NR_PROCESSO = P.NR_PROCESSO) NR_REF,'
      'CASE'
      '  WHEN P.CD_PRODUTO = '#39'01'#39' THEN '#39'IMPO'#39
      '  ELSE '#39'EXPO'#39' END AS OPERACAO , P.NM_EMPRESA_BASF'
      
        'FROM TPROCESSO P (NOLOCK), TEMPRESA_NAC E (NOLOCK), TFATURAMENTO' +
        '_CC F (NOLOCK), TS_FATURA S (NOLOCK)'
      ' WHERE E.CD_GRUPO = '#39'002'#39
      '   AND E.CD_EMPRESA  = P.CD_CLIENTE'
      '   AND P.NR_PROCESSO = F.NR_PROCESSO'
      '   AND F.IN_EDI_BASF = '#39'09I'#39
      '   AND F.NR_SOLIC_FAT= S.NR_SOLICITACAO'
      '   AND F.CD_UNID_NEG = S.CD_UNID_NEG'
      '   AND F.CD_PRODUTO  = S.CD_PRODUTO'
      '   AND S.IN_IMPRESSO = '#39'1'#39
      '   AND S.TP_TIPO_FAT = '#39'F'#39
      ''
      'GROUP BY P.NR_PROCESSO, '
      '         S.NR_SOLICITACAO, '
      '         S.NR_NF_SERV, '
      '         E.CGC_EMPRESA, '
      '         S.DT_VENCTO_FATURA,'
      '         S.DT_NF_SERV,'
      '         P.CD_PRODUTO,'
      '        P.NM_EMPRESA_BASF         '
      ' ')
    Left = 396
    Top = 217
  end
  object qrymsg09c: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, S.NR_SOLICITACAO, S.NR_NOTA_FATURA, E.CGC_' +
        'EMPRESA AS CNPJ_IMPORTADOR,'
      'S.DT_VENCTO_FATURA, S.DT_FATURA,'
      
        'CONVERT(DATETIME,CONVERT(VARCHAR(10),GETDATE(),103),103) AS DT_A' +
        'RQUIVO,'
      
        '(SELECT TOP 1 F.CD_REFERENCIA FROM TREF_CLIENTE F (NOLOCK) WHERE' +
        ' F.NR_PROCESSO = P.NR_PROCESSO) NR_REF,'
      'CASE'
      '  WHEN P.CD_PRODUTO = '#39'01'#39' THEN '#39'IMPO'#39
      '  ELSE '#39'EXPO'#39' END AS OPERACAO, P.NM_EMPRESA_BASF '
      
        'FROM TPROCESSO P (NOLOCK), TEMPRESA_NAC E (NOLOCK), TFATURAMENTO' +
        '_CC F (NOLOCK), TS_FATURA S (NOLOCK)'
      ' WHERE E.CD_GRUPO = '#39'002'#39
      '   AND E.CD_EMPRESA  = P.CD_CLIENTE'
      '   AND P.NR_PROCESSO = F.NR_PROCESSO'
      '   AND F.IN_EDI_BASF = '#39'09I'#39
      '   AND F.NR_SOLIC_FAT= S.NR_SOLICITACAO'
      '   AND F.CD_UNID_NEG = S.CD_UNID_NEG'
      '   AND F.CD_PRODUTO  = S.CD_PRODUTO'
      '   AND S.IN_IMPRESSO = '#39'1'#39
      '   AND S.TP_TIPO_FAT = '#39'N'#39
      ''
      'GROUP BY P.NR_PROCESSO,        '
      '         S.NR_SOLICITACAO, '
      '         S.NR_NOTA_FATURA, '
      '         E.CGC_EMPRESA, '
      '         S.DT_VENCTO_FATURA,'
      '         S.DT_FATURA,'
      '         P.CD_PRODUTO, P.NM_EMPRESA_BASF         '
      ' '
      ' '
      ' ')
    Left = 396
    Top = 159
  end
  object qrymsg13: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    Left = 396
    Top = 333
  end
  object qryMSG02: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, P.CD_CLIENTE, P.DT_ABERTURA, SUBSTRING(P.I' +
        'N_EDI_BASF,3,1) AS IN_EDI_BASF,'
      
        ' CONVERT(DATETIME,CONVERT(VARCHAR(10),GETDATE(),103),103) AS DT_' +
        'ARQUIVO, E.CGC_EMPRESA AS CNPJ_IMPORTADOR,'
      
        ' (SELECT N.NM_EMBARCACAO FROM TEMBARCACAO N (NOLOCK) WHERE N.CD_' +
        'EMBARCACAO = P.CD_EMBARCACAO) NM_NAVIO,'
      '  (CASE S.CD_VIA_TRANSPORTE '
      '  WHEN '#39'01'#39' THEN '#39'MA'#39
      '  WHEN '#39'02'#39' THEN '#39'FL'#39
      '  WHEN '#39'04'#39' THEN '#39'TA'#39
      '  WHEN '#39'05'#39' THEN '#39'PS'#39
      '  WHEN '#39'06'#39' THEN '#39'FR'#39
      '  WHEN '#39'07'#39' THEN '#39'RD'#39' END)  AS CD_VIA_TRANSPORTE'
      ', P.CD_PAIS_ORIGEM , CD_PAIS_DESTINO,'
      
        ' (SELECT F.DT_REALIZACAO FROM TFOLLOWUP F (NOLOCK) WHERE F.NR_PR' +
        'OCESSO = P.NR_PROCESSO AND'
      '       F.CD_EVENTO = '#39'001'#39') DT_RECEB_DOCTO ,P.NM_EMPRESA_BASF'
      
        ' FROM TPROCESSO P (NOLOCK), TEMPRESA_NAC E (NOLOCK), TSERVICO S ' +
        '(NOLOCK)'
      ' WHERE E.CD_GRUPO = '#39'002'#39
      ' AND E.CD_EMPRESA  = P.CD_CLIENTE'
      ' AND P.IN_EDI_BASF IN('#39'02I'#39', '#39'02A'#39')'
      ' AND P.CD_SERVICO  = S.CD_SERVICO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 396
    Top = 275
  end
  object qryITEM02: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    DataSource = ds_msg02
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO,  D.NR_ITEM, O.QT_INICIAL, O.PL_ITEM, O.QT_' +
        'BAIXADA_DI, D.PL_MERCADORIA, O.QT_INICIAL_EST,'
      ' CASE '
      '  WHEN O.IN_NECESSITA_LI = '#39'0'#39' THEN '#39'N'#39
      '  ELSE '#39'S'#39' END AS NECESSITA_LI,'
      '  D.NR_PROC_PO, D.NR_ITEM_PO'
      
        ' FROM TPROCESSO P (NOLOCK), TDECLARACAO_IMPORTACAO I (NOLOCK), T' +
        'DETALHE_MERCADORIA D (NOLOCK), TPO_ITEM O (NOLOCK)'
      ' WHERE P.NR_PROCESSO = :NR_PROCESSO'
      '   AND P.NR_PROCESSO = I.NR_PROCESSO '
      '   AND I.NR_PROCESSO = D.NR_PROCESSO'
      '   AND D.NR_PROC_PO  = O.NR_PROCESSO '
      '   AND D.NR_ITEM_PO  = O.NR_ITEM'
      ' ')
    Left = 332
    Top = 101
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object ds_msg02: TDataSource
    DataSet = qryMSG02
    Left = 48
    Top = 275
  end
  object ds_msg06: TDataSource
    DataSet = qrymsg06
    Left = 48
    Top = 333
  end
  object ds_msg08: TDataSource
    DataSet = qrymsg08
    Left = 48
    Top = 391
  end
  object qryDI01: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    DataSource = ds_msg08
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, D.CD_MOTIVO_TRANS, CD_EMPRESA, E.NM_EMPRES' +
        'A, E.CGC_EMPRESA, D.CD_PAIS_IMPORTADOR,'
      
        ' E.NR_TELEFONE, E.END_EMPRESA, E.END_NUMERO, E.END_BAIRRO, E.END' +
        '_CIDADE, E.END_UF, E.END_CEP,'
      
        ' D.CD_MODALIDADE_DESP, D.IN_OPERACAO_FUNDAP, D.CD_URF_ENTR_CARGA' +
        ', D.CD_URF_DESPACHO, '
      
        ' D.CD_TIPO_CONSIG, D.NM_CONSIGNATARIO, D.CD_PAIS_PROC_CARGA, D.C' +
        'D_VIA_TRANSP_CARG, '
      
        ' D.IN_MULTIMODAL, D.NR_VEICULO_TRANSP, D.NM_VEICULO_TRANSP, D.CD' +
        '_TIPO_DECLARACAO, '
      
        ' (SELECT T.DESCRICAO FROM TTRANSPORTADOR_ITL T (NOLOCK) WHERE T.' +
        'CODIGO = D.CD_TRANSPORTADOR)NM_TRANSPORTADOR,'
      
        ' (SELECT T.CD_PAIS FROM TTRANSPORTADOR_ITL T (NOLOCK) WHERE T.CO' +
        'DIGO = D.CD_TRANSPORTADOR)CD_PAIS_TRANSPORTADOR,'
      
        ' D.CD_TIPO_AG_CARGA, D.CD_TIPO_IMPORTADOR, D.NR_CPF_REPR_LEGAL, ' +
        'D.NR_CONSIGNATARIO'
      
        ' FROM TPROCESSO P (NOLOCK), TEMPRESA_NAC E (NOLOCK), TDECLARACAO' +
        '_IMPORTACAO D (NOLOCK)'
      ' WHERE P.NR_PROCESSO = :NR_PROCESSO'
      '   AND P.CD_CLIENTE  = E.CD_EMPRESA'
      '   AND P.NR_PROCESSO = D.NR_PROCESSO'
      ' ')
    Left = 338
    Top = 333
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object dsdi01: TDataSource
    DataSet = qryDI01
    Left = 48
    Top = 217
  end
  object qryDI03: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    DataSource = ds_msg08
    SQL.Strings = (
      
        'SELECT I.NR_PROCESSO, I.NR_SEQUENCIA, I.CD_TIPO_DCTO_INSTR, I.NR' +
        '_DCTO_INSTRUCAO  '
      ' FROM TDOCUMENTO_INSTRUCAO I (NOLOCK)'
      ' WHERE I.NR_PROCESSO = :NR_PROCESSO')
    Left = 338
    Top = 275
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qryDI05: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    DataSource = ds_msg08
    SQL.Strings = (
      'SELECT A.NR_PROCESSO, A.NR_SEQUENCIA, A.NM_ARMAZEM_CARGA'
      ' FROM TCARGA_ARMAZEM A (NOLOCK)'
      ' WHERE A.NR_PROCESSO = :NR_PROCESSO')
    Left = 332
    Top = 43
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qryDI07: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    DataSource = ds_msg08
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, P.CD_RECEITA_PGTO, P.CD_BANCO_PGTO_TRIB, P' +
        '.NR_AGENC_PGTO_TRIB, '
      ' P.VL_TRIBUTO_PAGO, P.DT_PGTO_TRIBUTO  '
      ' FROM TPAGAMENTO_TRIBUTOS P (NOLOCK)'
      ' WHERE P.NR_PROCESSO = :NR_PROCESSO')
    Left = 338
    Top = 391
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qryDI10: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    DataSource = ds_msg08
    SQL.Strings = (
      
        'SELECT A.NR_PROCESSO, A.NR_ADICAO, A.CD_URF_ENTR_MERC, A.CD_VIA_' +
        'TRANSPORTE,'
      
        ' A.IN_MULTIMODAL, A.NM_FORN_ESTR, A.ED_LOGR_FORN_ESTR, A.ED_NR_F' +
        'ORN_ESTR,'
      
        ' A.ED_COMPL_FORN_ESTR, A.ED_CIDAD_FORN_ESTR, A.ED_ESTAD_FORN_EST' +
        'R, A.CD_PAIS_AQUIS_MERC, '
      
        ' A.CD_MERCADORIA_NCM, A.CD_PAIS_PROC_MERC, A.CD_AUSENCIA_FABRIC,' +
        ' A.NM_FABRICANTE_MERC, A.ED_LOGR_FABRIC, '
      
        ' A.ED_NR_FABRIC, A.ED_COMPL_FABRIC, A.ED_CIDAD_FABRIC, A.ED_ESTA' +
        'DO_FABRIC, A.CD_PAIS_ORIG_MERC, '
      
        ' A.CD_MERC_NBM_SH, A.CD_MERC_NALADI_NCC, A.CD_MERC_NALADI_SH, A.' +
        'PL_MERCADORIA, '
      
        ' A.QT_UN_ESTATISTICA, A.CD_APLICACAO_MERC, A.CD_MOEDA_NEGOCIADA,' +
        ' A.CD_INCOTERMS_VENDA,'
      
        ' (SELECT L.DESCRICAO FROM TLOCAL_EMBARQUE L (NOLOCK) WHERE L.COD' +
        'IGO = A.CD_LOC_COND_VENDA) NM_LOC_COND_VENDA,'
      
        ' A.VL_MERC_COND_VENDA, A.VL_MERC_VENDA_MN, A.VL_FRETE_MERC_MNEG,' +
        ' A.CD_MD_FRETE_MERC, '
      
        ' A.VL_FRETE_MERC_MN, A.VL_SEG_MERC_MNEG, A.CD_MOEDA_SEG_MERC, A.' +
        'VL_SEG_MERC_MN, '
      
        ' A.CD_METOD_VALORACAO, A.CD_VINC_IMPO_EXPO, A.CD_TIPO_ACORDO_TAR' +
        ', A.CD_ACORDO_ALADI,'
      
        ' A.CD_REGIME_TRIBUTAR, A.CD_FUND_LEG_REGIME, A.NR_DCTO_REDUCAO, ' +
        'A.VL_MERC_EMB_MN, '
      
        ' A.VL_DESPESAS_MNEG, A.CD_MOEDAS_DESPESAS, A.VL_DESPESAS_MN, A.P' +
        'C_COEF_REDUC_II, '
      
        ' A.VL_II_CALC_DCR_MN, A.VL_II_DEVIDO_ZFM, A.CD_COBERT_CAMBIAL, A' +
        '.CD_MODALIDADE_PGTO, '
      
        ' A.CD_ORGAO_FIN_INTER, A.CD_MOTIVO_SEM_COB, A.QT_PARC_FINANC_360' +
        ', A.CD_PERIOD_PGTO_360,'
      
        ' A.QT_PERIOD_PGTO_360, A.VL_TOT_FINANC_360, A.PC_TAXA_JUROS, A.C' +
        'D_TAXA_JUROS, A.VL_FINANC_SUP_360, '
      
        ' A.NR_ROF, A.IN_PGTO_VARIAV_360, A.IN_JUROS_ATE_360, A.PC_COMISS' +
        'AO_AG_IMP, '
      
        ' A.VL_COMISSAO_AG_IMP, A.CD_TIPO_AGENTE_IMP, A.NR_AGENTE_IMP, A.' +
        'CD_BANC_AGENTE_IMP, '
      
        ' A.CD_AGENC_AGENT_IMP, A.IN_BEM_ENCOMENDA, A.IN_MATERIAL_USADO, ' +
        'A.TX_COMPL_VL_ADUAN,'
      
        ' A.CD_MOTIVO_ADM_TEMP, A.VL_CALC_DCR_DOLAR, A.VL_II_DEVIDO_ZFM, ' +
        'A.vl_merc_loc_emb_mn,'
      ' A.vl_base_calculo_mn, A.NR_OPER_TRAT_PREV'
      ' FROM TADICAO_DE_IMPORTACAO A (NOLOCK)'
      ' WHERE A.NR_PROCESSO = :NR_PROCESSO'
      ''
      ' '
      ' ')
    Left = 164
    Top = 159
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qryDI12: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    DataSource = ds_msg10
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_ADICAO, NR_SEQUENCIA, IN_PAGAMENTO_MN ,CD' +
        '_BANCO_PAGAMENTO,'
      
        '                               CD_PRACA_PAGAMENTO, NR_OP_CAMBIO,' +
        'VL_VINC_MD_CAMBIO,'
      
        '                               CD_TP_COMPR_CAMBIO,NR_COMPR_CAMBI' +
        'O,CD_FORMA_PAGAMENTO'
      'FROM TPAGAMENTO_VINCULADO (NOLOCK)'
      ' WHERE NR_PROCESSO =:NR_PROCESSO'
      '   AND NR_ADICAO = :NR_ADICAO'
      '  AND CD_FORMA_PAGAMENTO = '#39'2'#39)
    Left = 100
    Top = 43
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
  end
  object ds_msg10: TDataSource
    DataSet = qryDI10
    Left = 42
    Top = 43
  end
  object qryDI13: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    DataSource = ds_msg10
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_ADICAO, NR_SEQUENCIA, IN_PAGAMENTO_MN ,CD' +
        '_BANCO_PAGAMENTO,'
      
        '                               CD_PRACA_PAGAMENTO, NR_OP_CAMBIO,' +
        'VL_VINC_MD_CAMBIO,'
      
        '                               CD_TP_COMPR_CAMBIO,NR_COMPR_CAMBI' +
        'O,CD_FORMA_PAGAMENTO'
      'FROM TPAGAMENTO_VINCULADO (NOLOCK)'
      ' WHERE NR_PROCESSO =:NR_PROCESSO'
      '   AND NR_ADICAO = :NR_ADICAO'
      '  AND CD_FORMA_PAGAMENTO = '#39'1'#39)
    Left = 100
    Top = 101
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
  end
  object qryMSG03: TQuery
    BeforeInsert = qryMSG03BeforeInsert
    AfterPost = qryMSG03AfterPost
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      
        'INSERT INTO TREF_CLIENTE (NR_PROCESSO, NR_SEQUENCIA,CD_REFERENCI' +
        'A)'
      'VALUES (:NR_PROCESSO,:NR_SEQUENCIA, :CD_REFERENCIA)'
      ' '
      'UPDATE TPROCESSO'
      'SET NM_EMPRESA_BASF =:NM_EMPRESA_BASF'
      'WHERE NR_PROCESSO=:NR_PROCESSO'
      ' ')
    Left = 106
    Top = 391
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SEQUENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_REFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NM_EMPRESA_BASF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
  end
  object qryMSG10F: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      
        'UPDATE TS_FATURA SET CD_STATUS_BASF =:CD_STATUS_BASF, VL_BASF=:V' +
        'L_BASF,'
      'DT_GERA_BASF=CONVERT(DATETIME,:DT_GERA_BASF, 103)'
      'FROM TS_FATURA F (NOLOCK), TFATURAMENTO_CC CC (NOLOCK)'
      
        'WHERE F.CD_UNID_NEG = CC.CD_UNID_NEG AND F.CD_PRODUTO = CC.CD_PR' +
        'ODUTO'
      
        'AND F.NR_SOLICITACAO = CC.NR_SOLIC_FAT AND CC.NR_PROCESSO = :NR_' +
        'PROCESSO'
      'AND F.NR_NOTA_FATURA =:NR_NOTA_FATURA'
      ''
      ''
      '')
    Left = 106
    Top = 217
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_STATUS_BASF'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_BASF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_GERA_BASF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_NOTA_FATURA'
        ParamType = ptInput
      end>
  end
  object qryMSG11: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      '')
    Left = 106
    Top = 275
  end
  object qryMSG12: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      '')
    Left = 106
    Top = 333
  end
  object qryFLPPO: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      'UPDATE TFLP_PO'
      'SET DT_REALIZACAO =CONVERT(DATETIME,:DT_REALIZACAO,103)'
      'WHERE NR_PROCESSO =:NR_PROCESSO'
      'AND CD_EVENTO=:CD_EVENTO'
      ''
      ''
      '')
    Left = 222
    Top = 275
    ParamData = <
      item
        DataType = ftString
        Name = 'DT_REALIZACAO'
        ParamType = ptInputOutput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInputOutput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'CD_EVENTO'
        ParamType = ptInputOutput
        Value = ''
      end>
  end
  object qryMSG10N: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      'UPDATE TNUMERARIO'
      'SET CD_STATUS_BASF =:CD_STATUS_BASF,'
      '        VL_BASF=:VL_BASF,'
      '        DT_GERA_BASF=CONVERT(DATETIME,:DT_GERA_BASF, 103)'
      'WHERE  NR_PROCESSO =:NR_PROCESSO'
      'AND NR_SOLICITACAO =:NR_SOLICITACAO'
      ''
      ''
      '')
    Left = 222
    Top = 217
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_STATUS_BASF'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_BASF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_GERA_BASF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end>
  end
  object qryEMB06: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    DataSource = ds_msg06
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, E.QT_EMBALAGEM AS QTDE_EMBALAGEM, E.CD_EMB' +
        'ALAGEM AS TP_EMBALAGEM,'
      'C.NR_CNTR AS NR_CNTR, C.TP_CNTR AS  TP_CNTR,'
      'E.PB_EMBALAGEM AS VL_PESO_BRUTO ,'
      ' C.DT_ENT_ARM AS DT_ENTR_ARMAZEM, C.DT_ENT AS DT_SAIDA_ARMAZEM, '
      
        '(CASE ISNULL(C.DT_DESOVA, '#39#39') WHEN '#39#39' THEN '#39'N'#39' ELSE '#39'S'#39' END) AS ' +
        'IN_DESOVA,'
      'C.DT_DESOVA AS DT_DESOVA, '
      
        '(CASE ISNULL(C.DT_DEVOLUCAO_CNTR, '#39#39') WHEN '#39#39' THEN '#39'N'#39' ELSE '#39'S'#39' ' +
        'END) AS IN_DEVOLVIDO,'
      'C.DT_DEVOLUCAO_CNTR AS DT_DEVOLUCAO'
      
        'FROM TPROCESSO P (NOLOCK), TPROCESSO_EMBALAGEM E (NOLOCK), TPROC' +
        'ESSO_CNTR C (NOLOCK)'
      'WHERE P.NR_PROCESSO *= E.NR_PROCESSO '
      'AND P.NR_PROCESSO *= C.NR_PROCESSO '
      'AND P.NR_PROCESSO =:NR_PROCESSO'
      ' ')
    Left = 222
    Top = 159
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qryEMB06NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryEMB06QTDE_EMBALAGEM: TIntegerField
      FieldName = 'QTDE_EMBALAGEM'
    end
    object qryEMB06TP_EMBALAGEM: TStringField
      FieldName = 'TP_EMBALAGEM'
      FixedChar = True
      Size = 2
    end
    object qryEMB06NR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      FixedChar = True
    end
    object qryEMB06TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qryEMB06VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qryEMB06DT_ENTR_ARMAZEM: TDateTimeField
      FieldName = 'DT_ENTR_ARMAZEM'
    end
    object qryEMB06DT_SAIDA_ARMAZEM: TDateTimeField
      FieldName = 'DT_SAIDA_ARMAZEM'
    end
    object qryEMB06DT_DESOVA: TDateTimeField
      FieldName = 'DT_DESOVA'
    end
    object qryEMB06IN_DEVOLVIDO: TStringField
      FieldName = 'IN_DEVOLVIDO'
      FixedChar = True
      Size = 1
    end
    object qryEMB06DT_DEVOLUCAO: TDateTimeField
      FieldName = 'DT_DEVOLUCAO'
    end
    object qryEMB06IN_DESOVA: TStringField
      FieldName = 'IN_DESOVA'
      FixedChar = True
      Size = 1
    end
  end
  object insNOTAF: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      'INSERT INTO TPROCESSO_NF'
      '(NR_PROCESSO, NR_NOTA, DT_NOTA, VL_NOTA, IN_CANCELADO, NR_SERIE)'
      
        'VALUES (:NR_PROCESSO, :NR_NOTA, CONVERT(DATETIME ,:DT_NOTA, 103)' +
        ', :VL_NOTA,  '#39'0'#39', :NR_SERIE)')
    Left = 216
    Top = 43
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SERIE'
        ParamType = ptInput
      end>
  end
  object updDETMERC: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      'UPDATE TDETALHE_MERCADORIA'
      'SET NR_NOTA =:NR_NOTA'
      'WHERE CD_MERCADORIA =:CD_MERCADORIA'
      'AND NR_ITEM_PO =:NR_ITEM_PO'
      'AND NR_PROC_PO =:NR_PROC_PO'
      'AND NR_PROCESSO =:NR_PROCESSO')
    Left = 222
    Top = 391
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ITEM_PO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROC_PO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
  end
  object qry001: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    DataSource = ds_msg07
    SQL.Strings = (
      'SELECT NR_OPER_TRAT_PREV,  NR_SEQ_PRODUTO,'
      '       QT_MERC_UN_COMERC,  NM_UN_MEDID_COMER,'
      '       VL_UNID_COND_VENDA,    TX_DESC_DET_MERC,'
      '       CD_PRODUTO, NR_ITEM_DRAWBACK, QT_PROD_DRAWBACK,'
      '       VL_PROD_DRAWBACK '
      ' FROM DETALHE_MERC_COM_TRATAMENTO (NOLOCK)'
      'WHERE NR_OPER_TRAT_PREV =:NR_LI')
    Left = 222
    Top = 333
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_LI'
        ParamType = ptUnknown
      end>
  end
  object qry002: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    DataSource = ds_msg07
    SQL.Strings = (
      
        'SELECT NR_DESTAQUE_NCM, QT_MERC_UN_COMERC, NR_PROC_PO,NR_ITEM_PO' +
        ',NR_ITEM_DRAWBACK'
      '  FROM TLICENCA_ITENS (NOLOCK)'
      'WHERE  SUBSTRING (NR_PROCESSO,1,14)=:NR_PROCESSO')
    Left = 164
    Top = 333
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry003: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    DataSource = ds_msg07
    SQL.Strings = (
      'SELECT NR_OPER_TRAT_PREV, NM_IMPORTADOR, CD_URF_ENTR_MERC,'
      'CD_PAIS_PROC_MERC, NM_FABRICANTE_MERC, CD_MERC_NALADI_NCC,'
      'CD_MERC_NALADI_SH, QT_UN_ESTATISTICA, QT_DIA_LIMITE_PGTO,'
      'CD_TIPO_ACORDO_TAR, CD_ACORDO_ALADI, CD_REGIME_TRIBUTAR,'
      'CD_FUND_LEG_REGIME, CD_COBERT_CAMBIAL, CD_MODALIDADE_PGTO,'
      'CD_ORGAO_FIN_INTER, CD_MOTIVO_SEM_COB, CD_AGENCIA_SECEX, '
      'CD_URF_DESPACHO, DT_REG_OPER_TRAT, DT_VALID_OP_TRAT'
      '  FROM OPERACAO_COM_TRATAMENTO (NOLOCK)'
      'WHERE NR_OPER_TRAT_PREV=:NR_LI'
      ' ')
    Left = 164
    Top = 275
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_LI'
        ParamType = ptUnknown
      end>
  end
  object qry004: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    DataSource = ds_msg07
    SQL.Strings = (
      
        'SELECT QT_MERC_UN_COMERC,VL_UNID_COND_VENDA  FROM DETALHE_MERC_C' +
        'OM_TRATAMENTO (NOLOCK)'
      'WHERE NR_OPER_TRAT_PREV =:NR_LI')
    Left = 164
    Top = 217
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_LI'
        ParamType = ptUnknown
      end>
  end
  object ds_msg07: TDataSource
    DataSet = qrymsg07
    Left = 48
    Top = 159
  end
  object qryMSG01: TQuery
    BeforeInsert = qryMSG03BeforeInsert
    AfterPost = qryMSG03AfterPost
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      ''
      ' ')
    Left = 158
    Top = 101
  end
  object qryPO: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      'UPDATE TPO'
      'SET NM_EMPRESA_BASF=:NM_EMPRESA_BASF'
      'WHERE NR_PROCESSO =:NR_PROCESSO'
      ''
      ''
      '')
    Left = 158
    Top = 43
    ParamData = <
      item
        DataType = ftString
        Name = 'NM_EMPRESA_BASF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = ''
      end>
  end
  object qryDeloitte: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      
        'SELECT  DI.NR_PROCESSO, DM.CD_MERCADORIA, (SELECT NR_CLIENTE FRO' +
        'M TEMPRESA_EST WHERE CD_EMPRESA = DM.CD_EXPORTADOR) AS FORNECEDO' +
        'R,'
      
        '        ( SELECT TOP 1 NR_DCTO_INSTRUCAO FROM TDOCUMENTO_INSTRUC' +
        'AO (NOLOCK) WHERE NR_PROCESSO =* DI.NR_PROCESSO AND CD_TIPO_DCTO' +
        '_INSTR = '#39'01'#39' ) NR_DCTO_INSTRUCAO,'
      
        '        (SUBSTRING(DI.DT_EMBARQUE,1,2)+'#39'/'#39'+SUBSTRING(DI.DT_EMBAR' +
        'QUE,3,2)+'#39'/'#39'+SUBSTRING(DI.DT_EMBARQUE,5,4)) DATA_EMBARQUE, DI.NR' +
        '_DECLARACAO_IMP,'
      
        '        (SUBSTRING(DI.DT_REGISTRO_DI,1,2)+'#39'/'#39'+SUBSTRING(DI.DT_RE' +
        'GISTRO_DI,3,2)+'#39'/'#39'+SUBSTRING(DI.DT_REGISTRO_DI,5,4)) DATA_REGIST' +
        'RO_DI,'
      
        '        DM.QT_MERC_UN_COMERC, DM.VL_MLE_ITEM, AI.CD_MOEDA_MLE, D' +
        'M.VL_FRETE_ITEM, DM.VL_SEGURO_ITEM, AI.CD_MD_FRETE_MERC, AI.CD_M' +
        'OEDA_SEG_MERC,'
      
        '        ( ( DM.VL_BASE_CALC_II - DM.VL_ACRESCIMO_ITEM_MN ) / AI.' +
        'TX_DOLAR ) VL_BASE_CALC_II, '#39'220'#39' AS CD_MOEDA_MLE_CIF, DM.VL_II_' +
        'ITEM, DM.VL_ICMS_ITEM, DM.VL_PIS_ITEM, DM.VL_COFINS_ITEM, PNF.NR' +
        '_NOTA, CONVERT(VARCHAR,PNF.DT_NOTA,103) DATA_NOTA,'
      
        '        CASE ISNULL(PNF.CD_CFOP,'#39#39') WHEN '#39#39' THEN '#39#39' ELSE ( SUBST' +
        'RING(PNF.CD_CFOP,1,1) + '#39'.'#39' + SUBSTRING(PNF.CD_CFOP,2,3) ) END C' +
        'D_CFOP, AI.QT_PERIOD_PGTO_360,'
      
        '        (SELECT TOP 1 DT_PREV_PGTO_360 FROM TPAGAMENTO_PREVISTO ' +
        '(NOLOCK) WHERE NR_PROCESSO = DI.NR_PROCESSO) DT_PREV_PGTO_360'
      
        '  FROM  TDECLARACAO_IMPORTACAO DI (NOLOCK), TDETALHE_MERCADORIA ' +
        'DM (NOLOCK), TADICAO_DE_IMPORTACAO AI (NOLOCK), TPROCESSO_NF PNF' +
        ' (NOLOCK)'
      ' WHERE  DM.NR_PROCESSO = DI.NR_PROCESSO'
      '   AND  AI.NR_PROCESSO = DM.NR_PROCESSO'
      '   AND  AI.NR_ADICAO   = DM.NR_ADICAO'
      
        '   AND  DI.CD_IMPORTADOR IN (SELECT CD_EMPRESA FROM TEMPRESA_NAC' +
        ' (NOLOCK) WHERE CD_GRUPO = :GRUPO)'
      '   AND  PNF.NR_PROCESSO =* DI.NR_PROCESSO'
      
        '   AND  PNF.NR_NOTA = ( SELECT MAX(NR_NOTA) FROM TPROCESSO_NF (N' +
        'OLOCK) WHERE NR_PROCESSO = DI.NR_PROCESSO )'
      ''
      '')
    Left = 164
    Top = 391
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'GRUPO'
        ParamType = ptUnknown
      end>
  end
  object qryZYCIT279: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      
        'SELECT  DISTINCT DI.NR_PROCESSO, DM.NR_ITEM, DM.NR_ADICAO, RC.CD' +
        '_REFERENCIA '#39'EBELN'#39', '
      
        #9'SUBSTRING('#39'00000'#39',1,5-LEN(RC.NR_ITEM_PO))+RC.NR_ITEM_PO '#39'EBELP'#39 +
        ', DM.CD_MERCADORIA '#39'MATNR'#39', CONVERT(DECIMAL(14,5),DM.QT_MERC_UN_' +
        'ESTAT) '#39'MENGE'#39','
      
        #9'CONVERT(DECIMAL(17,7),(DM.VL_MCV_ITEM/DM.QT_MERC_UN_COMERC)*DI.' +
        'TX_MLE) '#39'VALOR'#39', SUBSTRING(DM.CD_NCM_SH,1,8) '#39'J_1BNBM'#39','
      #9'DI.NR_DECLARACAO_IMP '#39'NRDI'#39','
      
        '        CONVERT(DATETIME,SUBSTRING(DI.DT_REGISTRO_DI,1,2)+'#39'/'#39'+SU' +
        'BSTRING(DI.DT_REGISTRO_DI,3,2)+'#39'/'#39'+SUBSTRING(DI.DT_REGISTRO_DI,5' +
        ',4),103) '#39'DTDI'#39','
      '        FU.DT_REALIZACAO '#39'DTDESEMB'#39','
      
        #9'ISNULL(DI.CD_MOEDA_MLE,AI.CD_MOEDA_NEGOCIADA) '#39'WAERS'#39', CONVERT(' +
        'DECIMAL(24,2),DM.VL_MCV_ITEM/DM.QT_MERC_UN_COMERC) '#39'NETPR'#39', CONV' +
        'ERT(DECIMAL(24,5),DM.QT_MERC_UN_COMERC) '#39'QTD_ITEN'#39','
      
        #9'CONVERT(DECIMAL(14,3),AI.PL_MERCADORIA) '#39'NTGEW'#39', CONVERT(DECIMA' +
        'L(7,5),AI.TX_MLE) '#39'I_TXMOEDA'#39','
      
        #9'CONVERT(DECIMAL(7,2),II.PC_ALIQ_NORM_ADVAL) '#39'I_TXII'#39', CONVERT(D' +
        'ECIMAL(7,2),IPI.PC_ALIQ_NORM_ADVAL) '#39'I_TXIPI'#39','
      
        ' '#9'CONVERT(DECIMAL(7,2),AI.PC_ICMS) '#39'I_TXICMS'#39', CONVERT(DECIMAL(2' +
        '4,2),AI.VL_FRETE_MERC_MNEG) '#39'VLFRETE'#39', '
      
        #9'CONVERT(DECIMAL(24,2),AI.VL_SEG_MERC_MNEG) '#39'VLSEG'#39', AI.NR_ADICA' +
        'O '#39'ADICAO'#39', DM.NR_OPER_TRAT_PREV '#39'NRLI'#39', '
      
        #9'ISNULL(LI.DT_REGISTRO_LI,(SELECT DT_REGISTRO FROM TPROCESSO_LI ' +
        '(NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND NR_LI = DM.NR_OP' +
        'ER_TRAT_PREV)) '#39'DTREGLI'#39', '
      
        '  FU.DT_REALIZACAO '#39'DATACI'#39', CONVERT(DECIMAL(24,2),II.VL_BASE_CA' +
        'LC_ADVAL) '#39'BASEII'#39','
      
        #9'CONVERT(DECIMAL(24,2),IPI.VL_BASE_CALC_ADVAL) '#39'BASEIPI'#39', CONVER' +
        'T(DECIMAL(24,2),AI.VL_BASE_PIS) '#39'BASEPIS'#39', CONVERT(DECIMAL(24,2)' +
        ',AI.VL_BASE_PIS) '#39'BASECOFINS'#39','
      
        #9'CONVERT(DECIMAL(24,2),AI.VL_BASE_CALC_ICMS) '#39'BASEICMS'#39', AI.NR_A' +
        'TO_DRAWBACK '#39'NRATOC'#39','
      
        '        CONVERT(DECIMAL(14,5),DM.QT_MERC_UN_ESTAT) '#39'SLQTDE'#39', CON' +
        'VERT(DECIMAL(24,2),AI.VL_MERC_COND_VENDA) '#39'VLTOT'#39', CONVERT(DECIM' +
        'AL(24,5),DM.QT_MERC_UN_ESTAT) '#39'QTDE_NCM'#39','
      
        #9'( SELECT TOP 1 CD_EXTERNO FROM TDE_PARA (NOLOCK) WHERE CD_UNID_' +
        'NEG = PR.CD_UNID_NEG AND CD_PRODUTO = '#39'01'#39' AND CD_TABELA = '#39'16'#39' ' +
        'AND CD_DDBROKER = ( SELECT UNIDADE_MEDIDA FROM TNCM (NOLOCK) WHE' +
        'RE CODIGO = SUBSTRING(DM.CD_NCM_SH,1,8) ) ) '#39'UM_NCM'#39','
      
        #9'( SELECT TOP 1 CD_EXTERNO FROM TDE_PARA (NOLOCK) WHERE CD_UNID_' +
        'NEG = PR.CD_UNID_NEG AND CD_PRODUTO = '#39'01'#39' AND CD_TABELA = '#39'16'#39' ' +
        'AND CD_DDBROKER = DM.CD_UN_MED_COMERC ) '#39'UM_BASE'#39', DM.CD_UN_MED_' +
        'COMERC,'
      
        #9'DI.TX_DOLAR '#39'I_TXMOEDA_USD'#39', DI.CD_MOEDA_FRETE '#39'WAERS_FRETE'#39', D' +
        'I.TX_FRETE '#39'I_TXMOEDA_FRET'#39', DI.CD_MOEDA_SEGURO '#39'WAERS_SEGURO'#39','
      #9'DI.TX_SEGURO '#39'I_TXMOEDA_SEG'#39', AI.CD_INCOTERMS_VENDA '#39'INCOTERM'#39','
      
        '  CASE LEN(DM.NR_OPER_TRAT_PREV + ISNULL(CONVERT(VARCHAR,DATEPAR' +
        'T(DAY,ISNULL(LI.DT_REGISTRO_LI,(SELECT DT_REGISTRO FROM TPROCESS' +
        'O_LI (NOLOCK) WHERE NR_PROCESSO = PR.NR_PROCESSO AND NR_LI = DM.' +
        'NR_OPER_TRAT_PREV)))),'#39#39'))'
      '    WHEN 10 THEN '#39#39
      '    ELSE '#39'1'#39
      '  END '#39'CONTROLE1'#39
      'FROM   '#9'TPROCESSO '#9#9#9'  PR (nolock)'
      
        '       '#9'INNER JOIN TREF_CLIENTE           RC (nolock)  ON  RC.NR' +
        '_PROCESSO         = PR.NR_PROCESSO'
      
        '       '#9'INNER JOIN TDECLARACAO_IMPORTACAO DI (nolock)  ON  DI.NR' +
        '_PROCESSO         = PR.NR_PROCESSO'
      
        '       '#9'INNER JOIN TADICAO_DE_IMPORTACAO  AI (nolock)  ON  AI.NR' +
        '_PROCESSO         = DI.NR_PROCESSO'
      
        '       '#9'INNER JOIN TDETALHE_MERCADORIA    DM (nolock)  ON  DM.NR' +
        '_PROCESSO         = DI.NR_PROCESSO'
      
        '                                                       AND DM.NR' +
        '_ADICAO           = AI.NR_ADICAO  '
      #9#9#9#9#9'               AND DM.NR_ITEM_PO          = RC.NR_ITEM_PO'
      
        #9#9#9#9#9'               AND DM.NR_PROC_PO          = RC.CD_REFERENCI' +
        'A'
      
        #9'LEFT  JOIN TRIBUTO'#9'          II (nolock)  ON  II.NR_PROCESSO   ' +
        '      = DI.NR_PROCESSO'
      #9#9#9#9#9'               AND II.NR_ADICAO           = AI.NR_ADICAO'#9
      #9#9#9#9#9'               AND II.CD_RECEITA_IMPOSTO  = '#39'0001'#39
      
        #9'LEFT  JOIN TRIBUTO'#9'          IPI (nolock) ON  IPI.NR_PROCESSO  ' +
        '      = DI.NR_PROCESSO'
      #9#9#9#9#9'               AND IPI.NR_ADICAO          = AI.NR_ADICAO'#9
      #9#9#9#9#9'               AND IPI.CD_RECEITA_IMPOSTO = '#39'0002'#39
      
        #9'LEFT JOIN TLICENCA_IMPORTACAO    LI (nolock)   ON  LI.NR_REGIST' +
        'RO_LI      = DM.NR_OPER_TRAT_PREV'
      
        '                                                       AND SUBST' +
        'RING(LI.NR_PROCESSO,1,14) = PR.NR_PROCESSO'
      
        '                                                       AND ISNUL' +
        'L(LI.NR_REGISTRO_LI,'#39#39') <> '#39#39
      
        #9'INNER JOIN TFOLLOWUP  '#9#9'  FU (nolock)  ON  FU.NR_PROCESSO      ' +
        '   = DI.NR_PROCESSO'
      #9#9#9#9#9'     '#9'       AND FU.CD_EVENTO           = '#39'088'#39
      'WHERE '#9'CONVERT(VARCHAR,FU.DT_REALIZACAO,103) = :DATA'
      '  AND '#9'PR.CD_GRUPO = '#39'002'#39#9#9#9
      '  AND   RC.TP_REFERENCIA = '#39'01'#39
      'ORDER BY DI.NR_PROCESSO, DM.NR_ITEM'
      '')
    Left = 390
    Top = 101
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end>
  end
  object qrySaldoPedido: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      
        'SELECT  ( RTRIM(PI.NR_PROCESSO) + '#39' / '#39' + PI.NR_ITEM_CLIENTE ) N' +
        'R_PROCESSO, round(PI.QT_INICIAL, 2) SALDO_DISPONIVEL,'
      
        #9'       GR.CD_GRUPO, GR.NM_GRUPO, SUBSTRING(PI.TX_MERCADORIA,1,4' +
        '0) TX_MERCADORIA,'
      
        #9'       CASE WHEN ISNULL(F500.DT_REALIZACAO, '#39#39') = '#39#39' THEN CONVE' +
        'RT(VARCHAR, F123.DT_REALIZACAO, 103) ELSE CONVERT(VARCHAR, F500.' +
        'DT_REALIZACAO, 103) END DT_REALIZACAO         '
      '  FROM  TPO_ITEM PI ( NOLOCK)'
      
        #9'INNER JOIN TPROCESSO PR (NOLOCK) ON  PI.NR_PROCESSO = PR.NR_REF' +
        'ERENCIA'
      #9'INNER JOIN TGRUPO GR (NOLOCK) ON    GR.CD_GRUPO = PR.CD_GRUPO'
      
        #9'INNER JOIN TFLP_PO_ITEM FPI (NOLOCK) ON FPI.NR_PROCESSO = PI.NR' +
        '_PROCESSO AND FPI.NR_ITEM_CLIENTE  = PI.NR_ITEM_CLIENTE AND FPI.' +
        'NR_PARCIAL = PI.NR_PARCIAL AND ISNULL(FPI.DT_REALIZACAO, '#39#39') = '#39 +
        #39' AND FPI.DT_PREVISTA < GETDATE() AND FPI.CD_EVENTO = '#39'500'#39' AND ' +
        'FPI.IN_APLICAVEL = '#39'1'#39
      
        ' '#9'LEFT JOIN TFLP_PO_ITEM F500 (NOLOCK) ON F500.NR_PROCESSO = PI.' +
        'NR_PROCESSO AND F500.NR_ITEM_CLIENTE  = PI.NR_ITEM_CLIENTE AND F' +
        '500.NR_PARCIAL = PI.NR_PARCIAL AND F500.CD_EVENTO = '#39'500'#39' AND F5' +
        '00.IN_APLICAVEL = '#39'1'#39
      
        '  LEFT JOIN TFLP_PO_ITEM F123 (NOLOCK) ON F123.NR_PROCESSO = PI.' +
        'NR_PROCESSO AND F123.NR_ITEM_CLIENTE  = PI.NR_ITEM_CLIENTE AND F' +
        '123.NR_PARCIAL = PI.NR_PARCIAL AND F123.CD_EVENTO = '#39'123'#39' AND F1' +
        '23.IN_APLICAVEL = '#39'1'#39
      
        ' WHERE  (  ( PR.CD_TP_PEDIDO    = '#39#39' AND '#39#39' <> '#39#39' ) OR ( '#39#39' = '#39#39 +
        ' ) )'
      '   AND PR.CD_PRODUTO  = '#39'06'#39
      
        '   AND (  ( PR.CD_GRUPO    = :GRUPO_CLIENTE AND :GRUPO_CLIENTE <' +
        '> '#39#39' ) OR ( :GRUPO_CLIENTE = '#39#39' ) )'
      
        '   AND (  ( PR.CD_ANALISTA_COMISSARIA = :CD_ANALISTA_COMISSARIA ' +
        'AND :CD_ANALISTA_COMISSARIA <> '#39#39' ) OR ( :CD_ANALISTA_COMISSARIA' +
        ' = '#39#39' ) )'
      
        '   AND (  ( PR.CD_UNID_NEG = :UNIDADE AND :UNIDADE <> '#39#39' )  OR (' +
        ' :UNIDADE = '#39#39') )'
      '   AND PR.IN_CANCELADO = '#39'0'#39
      '   AND PI.NR_PARCIAL = 0'
      '   AND PI.QT_INICIAL <> 0'
      
        '   AND ((ISNULL(F500.DT_REALIZACAO, '#39#39') <> '#39#39'  AND F500.DT_PREVI' +
        'STA < GETDATE()+7) OR (ISNULL(F123.DT_REALIZACAO, '#39#39') <> '#39#39'  AND' +
        ' F123.DT_PREVISTA < GETDATE()+7))'
      ' ORDER  BY GR.CD_GRUPO')
    Left = 464
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'GRUPO_CLIENTE'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'GRUPO_CLIENTE'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'GRUPO_CLIENTE'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'CD_ANALISTA_COMISSARIA'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'CD_ANALISTA_COMISSARIA'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'CD_ANALISTA_COMISSARIA'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'UNIDADE'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'UNIDADE'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'UNIDADE'
        ParamType = ptInputOutput
      end>
    object qrySaldoPedidoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 25
    end
    object qrySaldoPedidoSALDO_DISPONIVEL: TFloatField
      FieldName = 'SALDO_DISPONIVEL'
    end
    object qrySaldoPedidoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qrySaldoPedidoNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      FixedChar = True
      Size = 50
    end
    object qrySaldoPedidoTX_MERCADORIA: TStringField
      FieldName = 'TX_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object qrySaldoPedidoDT_REALIZACAO: TStringField
      FieldName = 'DT_REALIZACAO'
      FixedChar = True
      Size = 30
    end
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.CharSet = 'ISO-8859-1'
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 568
    Top = 64
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 687
    Top = 64
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    SASLMechanisms = <>
    Left = 623
    Top = 64
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Method = sslvTLSv1_2
    SSLOptions.SSLVersions = [sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 631
    Top = 126
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=BROKER'
      'User_Name=MYROBO'
      'Password=123'
      'Server=INDAIA10'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 704
    Top = 384
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 696
    Top = 296
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 592
    Top = 384
  end
  object qryFilaEdi: TQuery
    DatabaseName = 'BROKER'
    SessionName = 'SES_EDI'
    SQL.Strings = (
      
        'SELECT TOP 50 CONVERT(DATETIME, CONVERT(VARCHAR, F.DT_ULTIMA_EXE' +
        'C, 103) + '#39' '#39' + CONVERT(VARCHAR, F.DT_ULTIMA_EXEC, 8) , 103) AS ' +
        'DATA_ULTIMA_EXEC,'
      
        '       CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(),103)        ' +
        ' + '#39' '#39' + CONVERT(VARCHAR, F.PROXIMA_EXEC, 8), 103)    AS DATA_PR' +
        'OXIMA_EXEC,'
      '       F.*, '
      '       R.IN_DOMINGO, '
      '       R.IN_SABADO, '
      '       R.CD_RELATORIO, '
      '       R.NM_RELATORIO, '
      '       R.CD_TIPO_RELATORIO, '
      
        '       CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(),103)        ' +
        ' + '#39' '#39' + CONVERT(VARCHAR, F.PROXIMA_EXEC, 8), 103),'
      '        U.AP_USUARIO'
      'FROM TFILA_AGENDA                  F (NOLOCK)'
      
        '   INNER JOIN TRELATORIOS_MAIL_AUT R (NOLOCK) ON F.NM_PATH_EDI L' +
        'IKE '#39'%CD_RELATORIO="'#39' +  R.CD_RELATORIO + '#39'"%'#39
      
        '   INNER JOIN TUSUARIO U (NOLOCK) ON F.NM_PATH_EDI LIKE '#39'%CD_USU' +
        'ARIO="'#39' +  U.CD_USUARIO + '#39'"%'#39'      '
      'WHERE '
      ''
      
        '          /*A PROXIMA EXECUCAO '#201' MAIOR QUE O DIA ATUAL (HORA ATU' +
        'AL - QT HORA DIA)*/'
      
        '  ( (    (CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(),103)     ' +
        '    + '#39' '#39' + CONVERT(VARCHAR, F.PROXIMA_EXEC, 8), 103)    >= '
      
        '          CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(),103)     ' +
        '    + '#39' '#39' + CONVERT(VARCHAR,DATEADD(HOUR, (-DATEPART(HOUR, GETDA' +
        'TE())),GETDATE()), 8), 103) )'
      
        '          /* E A PROXIMA EXECUCAO '#201' MENOR OU IGUAL A DATA ATUAL ' +
        '+ 2 MINUTOS  */'
      
        '     AND (CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(),103)     ' +
        '    + '#39' '#39' + CONVERT(VARCHAR, F.PROXIMA_EXEC, 8), 103)    <= '
      
        '          CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(),103)     ' +
        '    + '#39' '#39' + CONVERT(VARCHAR, DATEADD(MINUTE, 2,GETDATE()), 8), 1' +
        '03) )     )'
      
        '   AND    /*E A DATA DA ULTIMA EXECUCAO '#201' MENOR QUE A DATA DA PR' +
        'OXIMA EXECUCAO*/ '
      
        '    (CONVERT(DATETIME, CONVERT(VARCHAR, F.DT_ULTIMA_EXEC, 103) +' +
        ' '#39' '#39' + CONVERT(VARCHAR, F.DT_ULTIMA_EXEC, 8) , 103) <'
      
        '     CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(),103)         +' +
        ' '#39' '#39' + CONVERT(VARCHAR, F.PROXIMA_EXEC, 8), 103))'
      '   )'
      ''
      '--AND  R.CD_RELATORIO = '#39'07185'#39
      ' AND EDI <> '#39'C'#39'   '
      ''
      'ORDER BY PROXIMA_EXEC, SUBSTRING(F.NM_PATH_EDI,15,5)')
    Left = 696
    Top = 231
  end
end

object formIntegracaoDue: TformIntegracaoDue
  Left = 0
  Top = 0
  Caption = 'Integracao Due'
  ClientHeight = 539
  ClientWidth = 908
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 817
    Height = 539
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object SplitterDetail: TSplitter
      Left = 0
      Top = 288
      Width = 817
      Height = 4
      Cursor = crVSplit
      Align = alTop
      Color = 16758122
      ParentColor = False
      ExplicitLeft = 1
      ExplicitTop = 289
      ExplicitWidth = 815
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 817
      Height = 288
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Padding.Left = 20
      Padding.Top = 30
      Padding.Right = 20
      Padding.Bottom = 20
      ParentBackground = False
      TabOrder = 0
      object Label2: TLabel
        Left = 24
        Top = 12
        Width = 23
        Height = 13
        Caption = 'XML:'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clDefault
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object txtXML: TMemo
        Left = 20
        Top = 30
        Width = 777
        Height = 238
        Align = alClient
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        OnDblClick = txtXMLDblClick
        ExplicitLeft = -180
        ExplicitTop = -98
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 292
      Width = 817
      Height = 247
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      Padding.Left = 20
      Padding.Top = 30
      Padding.Right = 20
      Padding.Bottom = 20
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 24
        Top = 11
        Width = 49
        Height = 13
        Caption = 'Resposta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clDefault
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object txtResposta: TMemo
        Left = 20
        Top = 30
        Width = 777
        Height = 197
        Align = alClient
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        OnDblClick = txtRespostaDblClick
      end
    end
  end
  object Panel5: TPanel
    Left = 817
    Top = 0
    Width = 91
    Height = 539
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      91
      539)
    object btnConectar: TButton
      Left = 3
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Conectar'
      TabOrder = 0
      OnClick = btnConectarClick
    end
    object btnEnviar: TButton
      Left = 3
      Top = 42
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Enviar'
      Default = True
      TabOrder = 1
      OnClick = btnEnviarClick
    end
    object Button1: TButton
      Left = 3
      Top = 141
      Width = 75
      Height = 25
      Caption = 'teste'
      TabOrder = 2
      Visible = False
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 6
      Top = 261
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = -14
      Top = 344
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 4
      OnClick = Button3Click
    end
  end
  object idHttp: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 632
    Top = 360
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 2
    Left = 632
    Top = 424
  end
  object XMLDocument1: TXMLDocument
    Left = 721
    Top = 169
  end
  object RESTClient1: TRESTClient
    BaseURL = 
      'https://cebraceisq.apimanagement.br10.hana.ondemand.com/v2/auten' +
      'ticacao/login'
    Params = <>
    HandleRedirects = True
    ProxyPort = 443
    Left = 360
    Top = 380
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Kind = pkHTTPHEADER
        name = 'x-api-key'
        Options = [poDoNotEncode]
        Value = 'FGKaeyXD7DBpwWihOAqSmWeTGe5AV7Rw'
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 208
    Top = 372
  end
  object RESTResponse1: TRESTResponse
    Left = 232
    Top = 444
  end
end

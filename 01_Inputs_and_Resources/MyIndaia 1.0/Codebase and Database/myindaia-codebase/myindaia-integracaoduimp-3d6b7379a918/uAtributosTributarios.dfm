object frmAtributosTributarios: TfrmAtributosTributarios
  Left = 0
  Top = 0
  Caption = 'Atributos Tribut'#225'rios'
  ClientHeight = 749
  ClientWidth = 1196
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panel2: TPanel
    Left = 0
    Top = 0
    Width = 1196
    Height = 749
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlmenu: TPanel
      Left = 0
      Top = 0
      Width = 1196
      Height = 701
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1196
        Height = 57
        Align = alTop
        TabOrder = 0
        object lblAdicao: TLabel
          Left = 248
          Top = 11
          Width = 47
          Height = 21
          Caption = 'Adi'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = cl3DDkShadow
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblProcesso: TLabel
          Left = 32
          Top = 11
          Width = 62
          Height = 21
          Caption = 'Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = cl3DDkShadow
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object pnlConexaoAntiga: TPanel
          Left = 845
          Top = 1
          Width = 350
          Height = 55
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            350
            55)
          object btnConsultar: TPanel
            Left = 135
            Top = 10
            Width = 202
            Height = 34
            Cursor = crHandPoint
            Anchors = [akTop, akRight]
            Caption = 'Tentar consultar novamente'
            Color = clHotLight
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlightText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            OnClick = btnConsultarClick
          end
          object chkConexaoAntiga: TCheckBox
            Left = 22
            Top = 19
            Width = 105
            Height = 17
            Caption = 'Conex'#227'o Antiga'
            TabOrder = 1
          end
        end
      end
      object scrCampos: TScrollBox
        Left = 0
        Top = 57
        Width = 1196
        Height = 487
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 1
      end
      object Panel4: TPanel
        Left = 0
        Top = 544
        Width = 1196
        Height = 157
        Align = alBottom
        Padding.Left = 10
        Padding.Top = 10
        Padding.Right = 10
        Padding.Bottom = 10
        TabOrder = 2
        object Label1: TLabel
          Left = 11
          Top = 6
          Width = 448
          Height = 21
          Caption = 
            'Itens da adi'#231#227'o (Selecione o item para alterar o valor do atribu' +
            'to)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = cl3DDkShadow
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object grdItens: TDBGrid
          Left = 11
          Top = 40
          Width = 1174
          Height = 106
          Align = alBottom
          DataSource = dsAtributosFundamentoItem
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = grdItensCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'NR_ITEM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_MERCADORIA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TX_DESC_DET_MERC'
              Width = 1000
              Visible = True
            end>
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 701
      Width = 1196
      Height = 48
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        1196
        48)
      object btnSair: TPanel
        Left = 956
        Top = 5
        Width = 105
        Height = 32
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = 'Sair'
        Color = clGrayText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = btnSairClick
      end
      object btnSalvar: TPanel
        Left = 1077
        Top = 4
        Width = 105
        Height = 34
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = 'Salvar'
        Color = 4564776
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        OnClick = btnSalvarClick
      end
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
    Left = 1008
    Top = 16
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
    Left = 1008
    Top = 76
  end
  object qryAtributosTributariosItem: TFDQuery
    Connection = dtmDuimp.FDConnection1
    SQL.Strings = (
      
        'SELECT NR_ITEM, CD_MERCADORIA, CAST(TX_DESC_DET_MERC AS VARCHAR(' +
        '200)) AS TX_DESC_DET_MERC  FROM TDETALHE_MERCADORIA'
      'WHERE NR_PROCESSO= :NrProcesso and '
      'NR_ADICAO= :NrAdicao')
    Left = 936
    Top = 201
    ParamData = <
      item
        Name = 'NRPROCESSO'
        DataType = ftString
        ParamType = ptInput
        Size = 16
        Value = '0101IM-005016-24'
      end
      item
        Name = 'NRADICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
        Value = '001'
      end>
    object qryAtributosTributariosItemNR_ITEM: TStringField
      DisplayLabel = 'Nr. Item'
      FieldName = 'NR_ITEM'
      Origin = 'NR_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryAtributosTributariosItemCD_MERCADORIA: TStringField
      DisplayLabel = 'C'#243'd. Mercadoria'
      FieldName = 'CD_MERCADORIA'
      Origin = 'CD_MERCADORIA'
      Size = 30
    end
    object qryAtributosTributariosItemTX_DESC_DET_MERC: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'TX_DESC_DET_MERC'
      Origin = 'TX_DESC_DET_MERC'
      ReadOnly = True
      Size = 200
    end
  end
  object dsAtributosFundamentoItem: TDataSource
    DataSet = qryAtributosTributariosItem
    Left = 976
    Top = 305
  end
end

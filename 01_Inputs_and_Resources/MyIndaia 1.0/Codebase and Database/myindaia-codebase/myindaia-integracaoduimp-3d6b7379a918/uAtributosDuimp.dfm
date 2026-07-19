object frmAtributosDuimp: TfrmAtributosDuimp
  Left = 0
  Top = 0
  Caption = 'Atributos Duimp'
  ClientHeight = 458
  ClientWidth = 1184
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
    Width = 1184
    Height = 458
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 146
      Width = 1182
      Height = 263
      Align = alClient
      TabOrder = 0
      object txtResposta: TMemo
        Left = 1
        Top = 1
        Width = 1180
        Height = 261
        Align = alClient
        TabOrder = 0
      end
    end
    object pnlmenu: TPanel
      Left = 1
      Top = 1
      Width = 1182
      Height = 104
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 18
        Top = 8
        Width = 22
        Height = 13
        Caption = 'NCM'
      end
      object Label2: TLabel
        Left = 20
        Top = 48
        Width = 61
        Height = 13
        Caption = 'Nr. Processo'
      end
      object btnNcm: TBitBtn
        Left = 193
        Top = 16
        Width = 144
        Height = 32
        Cursor = crHandPoint
        Caption = 'Consultar por NCM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnNcmClick
      end
      object edtTexto: TEdit
        Left = 16
        Top = 22
        Width = 153
        Height = 21
        TabOrder = 1
        Text = '52030000'
      end
      object BitBtn1: TBitBtn
        Left = 193
        Top = 57
        Width = 144
        Height = 32
        Cursor = crHandPoint
        Caption = 'Consultar por processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = BitBtn1Click
      end
      object edtNrProcesso: TEdit
        Left = 18
        Top = 62
        Width = 153
        Height = 21
        TabOrder = 3
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 409
      Width = 1182
      Height = 48
      Align = alBottom
      TabOrder = 2
      object BitBtn2: TBitBtn
        Left = 979
        Top = 5
        Width = 144
        Height = 32
        Cursor = crHandPoint
        Caption = 'Fechar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn2Click
      end
    end
    object pnlConexaoAntiga: TPanel
      Left = 1
      Top = 105
      Width = 1182
      Height = 41
      Align = alTop
      TabOrder = 3
      Visible = False
      object chkConexaoAntiga: TCheckBox
        Left = 907
        Top = 11
        Width = 105
        Height = 17
        Caption = 'Conex'#227'o Antiga'
        TabOrder = 0
      end
      object btnTentarNovamente: TBitBtn
        Left = 1023
        Top = 3
        Width = 144
        Height = 32
        Cursor = crHandPoint
        Caption = 'Tentar novamente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnTentarNovamenteClick
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
    Left = 976
    Top = 232
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
    Left = 976
    Top = 292
  end
  object qryNcmItensProcesso: TFDQuery
    Connection = dtmDuimp.FDConnection1
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_ADICAO, NR_ITEM, CD_NCM_SH '
      'FROM TDETALHE_MERCADORIA '
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_ADICAO, NR_ITEM')
    Left = 976
    Top = 173
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = Null
      end>
    object qryNcmItensProcessoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryNcmItensProcessoNR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'NR_ADICAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryNcmItensProcessoNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'NR_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryNcmItensProcessoCD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
  end
end

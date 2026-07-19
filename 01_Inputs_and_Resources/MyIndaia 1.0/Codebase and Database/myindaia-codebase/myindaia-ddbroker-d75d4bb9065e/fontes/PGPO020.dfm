object frm_flp_po_obs: Tfrm_flp_po_obs
  Left = 150
  Top = 90
  Width = 749
  Height = 550
  Caption = 'Observa'#231#245'es Follow-Up PO'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mi_menu
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_dados: TPanel
    Left = 0
    Top = 47
    Width = 741
    Height = 457
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object Shape1: TShape
      Left = 4
      Top = 4
      Width = 733
      Height = 28
      Align = alTop
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object Label1: TLabel
      Left = 13
      Top = 12
      Width = 75
      Height = 13
      Caption = 'Observa'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object SpeedButton1: TSpeedButton
      Left = 607
      Top = 6
      Width = 129
      Height = 24
      Caption = 'Corre'#231#227'o Ortogr'#225'fica'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF999903333
        333333377777FFF33333FF9FFFF9993333333F7F3FF7773FF333009F00F03399
        3333777F7737FF773F33FF9FFFF9933393333F73FFF7733373F300F999903333
        393377377777F33337F3FFFFFFF0333339333FF33337F333373300FFFFF03333
        93337733FFF7F3337333FFF00000333333333F377777FF33FF330FF0FF999339
        93337337F3777FF77F33FFF0F993993993333337F77377F77F33FFF003339939
        93333337733F77377FFFFFF03399933999933FF733777337777F000339933339
        93997773377F3FF77F7733333993993993993333377F77377F77333333999339
        9993333333777337777333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object dbm_obs: TDBMemo
      Left = 4
      Top = 32
      Width = 733
      Height = 421
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkFlat
      Ctl3D = False
      DataField = 'TX_OBS'
      DataSource = dsAtzObsPO
      ParentCtl3D = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnChange = dbm_obsChange
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object pnl_obs: TPanel
      Left = 2
      Top = 2
      Width = 282
      Height = 43
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      DesignSize = (
        282
        43)
      object btn_sair: TSpeedButton
        Left = 241
        Top = 2
        Width = 38
        Height = 39
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
          0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
          0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
          0333337F777FFFFF7F3333000000000003333377777777777333}
        NumGlyphs = 2
        OnClick = btn_sairClick
      end
      object btn_clear: TSpeedButton
        Left = 79
        Top = 2
        Width = 38
        Height = 39
        Hint = 'Limpa todo o registro de observa'#231#245'es'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_clearClick
      end
      object btn_salvar: TSpeedButton
        Left = 3
        Top = 2
        Width = 38
        Height = 39
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
          00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
          00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
          00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
          0003737FFFFFFFFF7F7330099999999900333777777777777733}
        NumGlyphs = 2
        OnClick = btn_salvarClick
      end
      object btn_cancelar: TSpeedButton
        Left = 41
        Top = 2
        Width = 38
        Height = 39
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333FFF33FF333FFF339993370733
          999333777FF37FF377733339993000399933333777F777F77733333399970799
          93333333777F7377733333333999399933333333377737773333333333990993
          3333333333737F73333333333331013333333333333777FF3333333333910193
          333333333337773FF3333333399000993333333337377737FF33333399900099
          93333333773777377FF333399930003999333337773777F777FF339993370733
          9993337773337333777333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = btn_cancelarClick
      end
    end
    object pnl_procs: TPanel
      Left = 284
      Top = 2
      Width = 455
      Height = 43
      Align = alRight
      BevelInner = bvLowered
      ParentColor = True
      TabOrder = 1
      object Label2: TLabel
        Left = 9
        Top = 15
        Width = 61
        Height = 13
        Caption = 'Processo :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_nr_po: TLabel
        Left = 77
        Top = 15
        Width = 97
        Height = 13
        AutoSize = False
        Caption = 'lbl_nr_po'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_evento: TLabel
        Left = 200
        Top = 15
        Width = 243
        Height = 13
        AutoSize = False
        Caption = 'lbl_evento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 184
        Top = 15
        Width = 7
        Height = 13
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape2: TShape
        Left = 72
        Top = 8
        Width = 110
        Height = 28
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape3: TShape
        Left = 194
        Top = 8
        Width = 255
        Height = 28
        Brush.Style = bsClear
        Pen.Color = clGray
      end
    end
  end
  object mi_menu: TMainMenu
    Left = 690
    Top = 407
    object mi_clear: TMenuItem
      Caption = 'Li&mpar'
      OnClick = btn_clearClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      OnClick = btn_cancelarClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object spell: TSpellCheck
    Language = wdEnglishUS
    CompletedMessage = True
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ReplaceDialog = repDefault
    Left = 690
    Top = 438
  end
  object qryAtzObsPO: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT TX_OBS'
      'FROM TFLP_PO'
      'WHERE ( NR_PROCESSO = :NR_PROCESSO )'
      '  AND CD_EMPRESA = :CD_EMPRESA'
      '  AND ( CD_EVENTO   = :CD_EVENTO )')
    Left = 689
    Top = 468
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_EVENTO'
        ParamType = ptUnknown
      end>
    object qryAtzObsPOTX_OBS: TMemoField
      FieldName = 'TX_OBS'
      Origin = 'TFLP_PO.TX_OBS'
      BlobType = ftMemo
    end
  end
  object dsAtzObsPO: TDataSource
    DataSet = qryAtzObsPO
    Left = 659
    Top = 468
  end
end

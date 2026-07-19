inherited formXMLTeste: TformXMLTeste
  Caption = 'Teste XML Draft/Inttra'
  ClientHeight = 539
  ClientWidth = 908
  WindowState = wsNormal
  OnActivate = FormActivate
  ExplicitWidth = 924
  ExplicitHeight = 577
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 817
    Height = 539
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 817
      Height = 539
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      Padding.Left = 20
      Padding.Top = 30
      Padding.Right = 20
      Padding.Bottom = 20
      ParentBackground = False
      TabOrder = 0
      ExplicitHeight = 457
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
        Height = 489
        Align = alClient
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        OnDblClick = txtXMLDblClick
        ExplicitHeight = 238
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
    object Button1: TButton
      Left = 6
      Top = 30
      Width = 75
      Height = 35
      Caption = 'Salvar XML'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 504
    Top = 96
  end
end

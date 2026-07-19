inherited formMyMainBasic: TformMyMainBasic
  Caption = 'Main Basic'
  ClientHeight = 556
  ClientWidth = 714
  FormStyle = fsMDIForm
  Menu = MainMenu
  ExplicitWidth = 730
  ExplicitHeight = 614
  PixelsPerInch = 96
  TextHeight = 16
  object pscShortCuts: TPageScroller
    Left = 0
    Top = 0
    Width = 714
    Height = 24
    Align = alTop
    Color = clBtnFace
    Control = pnlButtons
    ParentColor = False
    TabOrder = 0
    ExplicitWidth = 428
    object pnlButtons: TPanel
      Left = 0
      Top = 0
      Width = 1024
      Height = 24
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      BorderWidth = 4
      Caption = ' '
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 528
    Width = 714
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 213
    ExplicitWidth = 428
  end
  object PageScroller1: TPageScroller
    Left = 0
    Top = 24
    Width = 714
    Height = 28
    Align = alTop
    Color = clBtnFace
    Control = tbrBotoesJanelas
    ParentColor = False
    TabOrder = 2
    ExplicitWidth = 428
    object tbrBotoesJanelas: TToolBar
      Left = 0
      Top = 0
      Width = 786
      Height = 28
      Align = alLeft
      AutoSize = True
      ButtonHeight = 21
      ButtonWidth = 65
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowCaptions = True
      TabOrder = 0
      Wrapable = False
    end
  end
  object MainMenu: TMainMenu
    Left = 64
    Top = 32
    object Cadastro1: TMenuItem
      Caption = 'Cadastros'
    end
    object Movimentos1: TMenuItem
      Caption = 'Movimentos'
    end
    object Relatorios1: TMenuItem
      Caption = 'Relat'#243'rios'
    end
    object Utilitarios1: TMenuItem
      Caption = 'Utilit'#225'rios'
    end
    object Janelas1: TMenuItem
      Caption = 'Janelas'
      object EmCascata1: TMenuItem
        Caption = '&Em Cascata'
      end
      object LadoaLado1: TMenuItem
        Caption = '&Lado a Lado'
      end
      object Empilhar1: TMenuItem
        Caption = '&Empilhar'
      end
      object OrganizarIcones1: TMenuItem
        Caption = '&Organizar Icones'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Janelasativas1: TMenuItem
        Caption = 'Janelas &ativas'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object FecharTodas1: TMenuItem
        Caption = 'Fechar &Todas'
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      object Sobre1: TMenuItem
        Caption = 'Sobre'
      end
    end
  end
  object aevMain: TApplicationEvents
    OnException = aevMainException
    OnMessage = aevMainMessage
    Left = 68
    Top = 64
  end
end

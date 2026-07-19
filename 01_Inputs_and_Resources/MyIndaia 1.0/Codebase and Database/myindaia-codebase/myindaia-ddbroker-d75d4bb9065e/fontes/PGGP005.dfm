object dlg_about: Tdlg_about
  Left = 332
  Top = 253
  BorderStyle = bsNone
  BorderWidth = 2
  Caption = 'Sobre o Sistema'
  ClientHeight = 245
  ClientWidth = 395
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 395
    Height = 245
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    Color = clSilver
    TabOrder = 0
    object Bevel1: TBevel
      Left = 4
      Top = 209
      Width = 387
      Height = 32
      Align = alBottom
      Shape = bsSpacer
    end
    object SpeedButton1: TSpeedButton
      Left = 317
      Top = 215
      Width = 73
      Height = 25
      Caption = '&Ok'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object Panel2: TPanel
      Left = 4
      Top = 4
      Width = 387
      Height = 176
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 2
      Caption = 'Panel1'
      Color = clBlack
      TabOrder = 0
      object Panel5: TPanel
        Left = 2
        Top = 2
        Width = 383
        Height = 172
        Align = alClient
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'Logotipo n'#227'o encontrado no diret'#243'rio.'
        Color = clWhite
        TabOrder = 0
        object Image1: TImage
          Left = 1
          Top = 1
          Width = 381
          Height = 170
          Align = alClient
          Center = True
        end
      end
    end
    object Panel4: TPanel
      Left = 4
      Top = 180
      Width = 387
      Height = 29
      Align = alBottom
      BevelOuter = bvNone
      BorderWidth = 2
      Caption = 'Panel4'
      Color = clBlack
      TabOrder = 1
      object Panel3: TPanel
        Left = 2
        Top = 2
        Width = 383
        Height = 25
        Align = alClient
        BevelOuter = bvNone
        Color = 15263976
        TabOrder = 0
        object Label1: TLabel
          Left = 6
          Top = 7
          Width = 46
          Height = 13
          Caption = 'Server:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 53
          Top = 7
          Width = 133
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 190
          Top = 7
          Width = 63
          Height = 13
          Caption = 'Database:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 253
          Top = 7
          Width = 126
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
end

object frmIntegracaoBSH: TfrmIntegracaoBSH
  Left = 299
  Top = 209
  Width = 389
  Height = 211
  Caption = 'BSH x RE'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 381
    Height = 184
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Shape3: TShape
      Left = 9
      Top = 9
      Width = 363
      Height = 25
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object Shape1: TShape
      Left = 6
      Top = 143
      Width = 369
      Height = 35
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object SpeedButton1: TSpeedButton
      Left = 224
      Top = 148
      Width = 73
      Height = 25
      Caption = 'Integrar'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 298
      Top = 148
      Width = 73
      Height = 25
      Caption = 'Fechar'
      Flat = True
      OnClick = SpeedButton2Click
    end
    object Shape2: TShape
      Left = 6
      Top = 6
      Width = 369
      Height = 136
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label1: TLabel
      Left = 15
      Top = 15
      Width = 265
      Height = 13
      Caption = 'Integra'#231#227'o de arquivos BSH x RE ( Siscomex )'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Shape4: TShape
      Left = 24
      Top = 53
      Width = 333
      Height = 65
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label3: TLabel
      Left = 37
      Top = 68
      Width = 114
      Height = 13
      Caption = 'Arquivo para Integra'#231#227'o'
    end
    object btn_nr_processo: TSpeedButton
      Left = 319
      Top = 82
      Width = 25
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = btn_nr_processoClick
    end
    object Label2: TLabel
      Left = 12
      Top = 146
      Width = 48
      Height = 13
      Caption = 'aguarde...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object edt_nm_file_: TEdit
      Left = 36
      Top = 82
      Width = 282
      Height = 23
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object captura_telas: TMemo
      Left = 10
      Top = 37
      Width = 15
      Height = 15
      TabOrder = 1
      Visible = False
    end
    object pbArquivo: TProgressBar
      Left = 13
      Top = 160
      Width = 203
      Height = 11
      Step = 1
      TabOrder = 2
      Visible = False
    end
  end
  object open_file_: TOpenDialog
    Ctl3D = False
    Left = 288
    Top = 16
  end
  object MyTerminal: TByHLLAPI
    HLLAPIKind = hkIWW4
    DllName = 'WHLLAPI.DLL'
    DllFunc = 'WINHLLAPI'
    IPAddress = '127.0.0.1'
    IPPort = 4321
    TimeOut = 60000
    Left = 328
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    Ctl3D = False
    DefaultExt = 'txt'
    Filter = 'Arquivos Texto|*.txt'
    InitialDir = 'C:\DDBroker'
    Title = 'Salvar capturas de tela do RE como...'
    Left = 248
    Top = 16
  end
end

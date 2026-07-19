object frm_exp_impr_cert_orig: Tfrm_exp_impr_cert_orig
  Left = 200
  Top = 111
  Width = 358
  Height = 247
  Caption = 'Certificados de Origem'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 23
    Top = 38
    Width = 118
    Height = 13
    Caption = 'Numero do Processo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 19
    Top = 68
    Width = 122
    Height = 13
    Caption = 'Modelo de Formul'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 93
    Top = 11
    Width = 48
    Height = 13
    Caption = 'Unidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_proc_new: TSpeedButton
    Left = 273
    Top = 34
    Width = 25
    Height = 21
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
    OnClick = btn_co_proc_newClick
  end
  object btn_cd_unid_neg: TSpeedButton
    Left = 303
    Top = 7
    Width = 25
    Height = 21
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
    OnClick = btn_cd_unid_negClick
  end
  object Label4: TLabel
    Left = 52
    Top = 95
    Width = 89
    Height = 13
    Caption = 'Quebrar a cada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 188
    Top = 95
    Width = 39
    Height = 13
    Caption = 'ordens'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 113
    Top = 119
    Width = 28
    Height = 13
    Caption = 'Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object processo: TMaskEdit
    Left = 153
    Top = 34
    Width = 118
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 18
    TabOrder = 1
    OnKeyDown = processoKeyDown
  end
  object Ok_btn: TBitBtn
    Left = 163
    Top = 174
    Width = 75
    Height = 25
    Caption = '&Imprime'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Ok_btnClick
    NumGlyphs = 2
  end
  object Retorna: TBitBtn
    Left = 253
    Top = 174
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Retorna'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = RetornaClick
  end
  object Modelo: TComboBox
    Left = 153
    Top = 62
    Width = 175
    Height = 21
    Style = csDropDownList
    DropDownCount = 9
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      ''
      'Ace18'
      'Ace18-Fiesp'
      'Ace35'
      'Ace35-Fiesp'
      'Ace36'
      'Ace36-Fiesp'
      'Ace39'
      'Ace43'
      'Ace53'
      'Ace59'
      'Par-04'
      'FormA'
      'Comum')
  end
  object msk_cd_unid_neg: TMaskEdit
    Left = 153
    Top = 7
    Width = 25
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 2
    TabOrder = 0
    OnExit = msk_cd_unid_negExit
    OnKeyDown = processoKeyDown
  end
  object edt_nm_unid_neg: TEdit
    Left = 180
    Top = 7
    Width = 121
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 7
  end
  object msk_nr_ordem: TMaskEdit
    Left = 153
    Top = 91
    Width = 25
    Height = 21
    CharCase = ecUpperCase
    EditMask = '99;0;_'
    MaxLength = 2
    TabOrder = 3
    OnExit = msk_cd_unid_negExit
    OnKeyDown = processoKeyDown
  end
  object msk_data: TMaskEdit
    Left = 153
    Top = 115
    Width = 91
    Height = 21
    CharCase = ecUpperCase
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 4
    Text = '  /  /    '
    OnKeyDown = processoKeyDown
  end
end

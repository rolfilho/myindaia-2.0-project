object frm_exp_impr_cert_seg: Tfrm_exp_impr_cert_seg
  Left = 200
  Top = 108
  Width = 366
  Height = 216
  Caption = 'Certificado de Seguro'
  Color = clBtnFace
  ParentFont = True
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 15
    Top = 48
    Width = 99
    Height = 13
    Caption = 'Nro. do Processo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 14
    Top = 19
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
    Left = 267
    Top = 47
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
    Left = 293
    Top = 15
    Width = 23
    Height = 22
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
  object msk_nr_processo: TMaskEdit
    Left = 120
    Top = 47
    Width = 142
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    OnKeyDown = msk_nr_processoKeyDown
  end
  object msk_cd_unid_neg: TMaskEdit
    Left = 120
    Top = 15
    Width = 25
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 2
    TabOrder = 0
    OnExit = msk_cd_unid_negExit
    OnKeyDown = msk_nr_processoKeyDown
  end
  object Ok_btn: TBitBtn
    Left = 169
    Top = 139
    Width = 75
    Height = 25
    Caption = '&Imprime'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Ok_btnClick
    NumGlyphs = 2
  end
  object Retorna: TBitBtn
    Left = 258
    Top = 139
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
    TabOrder = 3
    OnClick = RetornaClick
  end
  object edt_nm_unid_neg: TEdit
    Left = 148
    Top = 15
    Width = 143
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 4
  end
end

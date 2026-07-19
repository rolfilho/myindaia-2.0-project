object frm_exp_impr_instr_emb: Tfrm_exp_impr_instr_emb
  Left = 478
  Top = 301
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Instru'#231#227'o de Embarque'
  ClientHeight = 197
  ClientWidth = 367
  Color = clBtnFace
  ParentFont = True
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    367
    197)
  PixelsPerInch = 96
  TextHeight = 13
  object shpAux: TShape
    Left = 0
    Top = 139
    Width = 367
    Height = 58
    Align = alClient
    Brush.Style = bsClear
    Pen.Color = clGreen
  end
  object btnImprimir: TSpeedButton
    Tag = 1
    Left = 181
    Top = 151
    Width = 100
    Height = 38
    Anchors = [akRight, akBottom]
    Caption = 'Imprimir'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
    ParentFont = False
    OnClick = btnImprimirClick
  end
  object btnSair: TSpeedButton
    Left = 289
    Top = 151
    Width = 70
    Height = 38
    Anchors = [akRight, akBottom]
    Caption = 'Sair'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
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
    ParentFont = False
    OnClick = btnSairClick
  end
  object pnlAux: TPanel
    Left = 0
    Top = 0
    Width = 367
    Height = 139
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 46
      Width = 74
      Height = 13
      Caption = 'N'#186' do Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 19
      Width = 40
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btn_co_proc_new: TSpeedButton
      Left = 240
      Top = 42
      Width = 25
      Height = 21
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
      OnClick = btn_co_proc_newClick
    end
    object btn_cd_unid_neg: TSpeedButton
      Left = 333
      Top = 14
      Width = 24
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
      OnClick = btn_cd_unid_negClick
    end
    object Destinatario: TRadioGroup
      Left = 171
      Top = 73
      Width = 156
      Height = 56
      Caption = 'Destinat'#225'rio'
      ItemIndex = 0
      Items.Strings = (
        'Despachante'
        'Agente Embarcador')
      TabOrder = 4
      TabStop = True
    end
    object msk_nr_processo: TMaskEdit
      Left = 94
      Top = 42
      Width = 142
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyDown = msk_nr_processoKeyDown
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 94
      Top = 14
      Width = 25
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 1
      OnChange = btn_cd_unid_negClick
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_nr_processoKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 119
      Top = 14
      Width = 211
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
    object Tipo_Descricao: TRadioGroup
      Left = 8
      Top = 73
      Width = 156
      Height = 56
      Caption = 'Modelo'
      ItemIndex = 0
      Items.Strings = (
        'Resumo da Mercadoria'
        'Itens')
      TabOrder = 3
      TabStop = True
    end
  end
end

object frm_exp_impr_packing: Tfrm_exp_impr_packing
  Left = 1082
  Top = 259
  Width = 354
  Height = 321
  Caption = 'Packing List'
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
  object Panel1: TPanel
    Left = 0
    Top = 239
    Width = 338
    Height = 44
    Align = alBottom
    TabOrder = 0
    object Ok_btn: TBitBtn
      Tag = 1
      Left = 23
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Imprime'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Ok_btnClick
      NumGlyphs = 2
    end
    object btn_arquivo: TBitBtn
      Tag = 2
      Left = 131
      Top = 9
      Width = 75
      Height = 26
      Caption = '&Arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Ok_btnClick
      NumGlyphs = 2
    end
    object Retorna: TBitBtn
      Tag = 3
      Left = 240
      Top = 9
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
      TabOrder = 2
      OnClick = RetornaClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 118
    Width = 338
    Height = 121
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 26
      Height = 13
      Caption = 'Tipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbo_tipo: TComboBox
      Left = 110
      Top = 59
      Width = 179
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbo_tipo'
      Items.Strings = (
        'Original'
        'C'#243'pia'
        'Em Branco')
    end
    object Button1: TButton
      Left = 240
      Top = 84
      Width = 75
      Height = 25
      Caption = 'Designer'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Quant: TRadioGroup
      Left = 110
      Top = 12
      Width = 178
      Height = 41
      Caption = 'Quantidade'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Itens'
        'Embalagens')
      ParentFont = False
      TabOrder = 2
      TabStop = True
      Visible = False
    end
  end
  object pnlPedidos: TPanel
    Left = 0
    Top = 73
    Width = 338
    Height = 45
    Align = alTop
    TabOrder = 2
    Visible = False
    object Label5: TLabel
      Left = 15
      Top = 16
      Width = 40
      Height = 13
      Caption = 'Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbo_Pedidos: TComboBox
      Left = 110
      Top = 11
      Width = 179
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 338
    Height = 73
    Align = alTop
    TabOrder = 3
    object Label1: TLabel
      Left = 15
      Top = 44
      Width = 89
      Height = 13
      Caption = 'N'#186' do Processo'
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
      Left = 293
      Top = 40
      Width = 24
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
      Width = 24
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
    object msk_nr_processo: TMaskEdit
      Left = 110
      Top = 40
      Width = 179
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = msk_nr_processoChange
      OnKeyDown = msk_nr_processoKeyDown
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 110
      Top = 15
      Width = 28
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 1
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_nr_processoKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 143
      Top = 15
      Width = 146
      Height = 21
      TabStop = False
      Color = clMenu
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 2
    end
  end
end

object frm_exp_impr_fatura: Tfrm_exp_impr_fatura
  Left = 609
  Top = 342
  Width = 459
  Height = 385
  Caption = 'Fatura Comercial'
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
    Top = 0
    Width = 443
    Height = 89
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 29
      Top = 57
      Width = 53
      Height = 13
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 29
      Top = 30
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
    object btn_nr_processo: TSpeedButton
      Left = 261
      Top = 53
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
      OnClick = btn_nr_processoClick
    end
    object SpeedButton1: TSpeedButton
      Left = 390
      Top = 26
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
      OnClick = SpeedButton1Click
    end
    object msk_nr_processo: TMaskEdit
      Left = 114
      Top = 53
      Width = 142
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = msk_nr_processoChange
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_nr_processoKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 142
      Top = 26
      Width = 240
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 113
      Top = 26
      Width = 27
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 2
      OnChange = msk_cd_unid_negChange
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_nr_processoKeyDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 130
    Width = 443
    Height = 176
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 29
      Top = 91
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
    object Label4: TLabel
      Left = 29
      Top = 148
      Width = 77
      Height = 13
      Caption = 'Espa'#231'amento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Quant: TRadioGroup
      Left = 114
      Top = 6
      Width = 250
      Height = 44
      Caption = 'Modelo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Itens'
        'Embalagens')
      TabOrder = 0
      OnClick = QuantClick
      OnExit = QuantExit
    end
    object chkbox_venda_incoterm: TCheckBox
      Left = 114
      Top = 116
      Width = 152
      Height = 17
      Caption = 'Venda no INCOTERM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object cbo_tipo: TComboBox
      Left = 114
      Top = 88
      Width = 168
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'Original'
        'C'#243'pia'
        'Em Branco')
    end
    object chk_grupo_emb_sup: TCheckBox
      Left = 114
      Top = 61
      Width = 226
      Height = 17
      Caption = 'Agrupar pela Embalagem Superior'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object msk_espaco: TEdit
      Left = 114
      Top = 140
      Width = 38
      Height = 21
      MaxLength = 3
      TabOrder = 4
    end
    object chkbox_remessa: TCheckBox
      Left = 271
      Top = 116
      Width = 152
      Height = 17
      Caption = 'Retirar Remessa '#205'tem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 306
    Width = 443
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Ok_btn: TBitBtn
      Tag = 1
      Left = 220
      Top = 4
      Width = 101
      Height = 29
      Caption = '&Imprime'
      Default = True
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
    object Retorna: TBitBtn
      Tag = 3
      Left = 332
      Top = 4
      Width = 101
      Height = 29
      Cancel = True
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = RetornaClick
    end
  end
  object pnlPedidos: TPanel
    Left = 0
    Top = 89
    Width = 443
    Height = 41
    Align = alTop
    TabOrder = 3
    Visible = False
    object Label5: TLabel
      Left = 29
      Top = 17
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
      Left = 114
      Top = 9
      Width = 168
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
  end
end

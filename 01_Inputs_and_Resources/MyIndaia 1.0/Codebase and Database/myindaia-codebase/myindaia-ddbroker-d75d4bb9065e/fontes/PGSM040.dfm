object frm_recontab_ctaapagar: Tfrm_recontab_ctaapagar
  Left = 177
  Top = 155
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Recontabiliza Contas a Pagar'
  ClientHeight = 142
  ClientWidth = 326
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 326
    Height = 142
    Align = alClient
    BevelWidth = 2
    TabOrder = 0
    object lbl_data: TLabel
      Left = 30
      Top = 52
      Width = 26
      Height = 13
      Caption = 'Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_coligada: TLabel
      Left = 30
      Top = 13
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coligada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_coligada: TSpeedButton
      Left = 271
      Top = 26
      Width = 25
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
      OnClick = btn_co_coligadaClick
    end
    object msk_lote: TMaskEdit
      Left = 30
      Top = 67
      Width = 47
      Height = 21
      EditMask = '9999'
      MaxLength = 4
      TabOrder = 1
      Text = '    '
    end
    object btn_recontab: TButton
      Left = 85
      Top = 102
      Width = 87
      Height = 26
      Caption = '&Recontabilizar'
      TabOrder = 2
      OnClick = btn_recontabClick
    end
    object btn_sair: TButton
      Left = 175
      Top = 102
      Width = 66
      Height = 26
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 3
      OnClick = btn_sairClick
    end
    object msk_cd_coligada: TMaskEdit
      Left = 30
      Top = 27
      Width = 26
      Height = 21
      EditMask = '99;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      Text = '  '
      OnExit = msk_cd_coligadaExit
      OnKeyDown = msk_cd_coligadaKeyDown
    end
    object edt_nm_coligada: TEdit
      Left = 60
      Top = 27
      Width = 207
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
    end
  end
end

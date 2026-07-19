object frm_duplica_ct_contabil_gerencial: Tfrm_duplica_ct_contabil_gerencial
  Left = 104
  Top = 161
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Duplicação de Conta Contábil X Gerencial'
  ClientHeight = 141
  ClientWidth = 480
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_ct_contabil: TLabel
    Left = 117
    Top = 17
    Width = 84
    Height = 13
    Caption = 'Conta Contábil'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_ct_contabil: TSpeedButton
    Left = 427
    Top = 32
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
    OnClick = btn_co_ct_contabilClick
  end
  object lbl_mes: TLabel
    Left = 22
    Top = 56
    Width = 24
    Height = 13
    Caption = 'Mês'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_mes: TSpeedButton
    Left = 197
    Top = 67
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
    OnClick = btn_co_mesClick
  end
  object Label2: TLabel
    Left = 224
    Top = 56
    Width = 23
    Height = 13
    Caption = 'Ano'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_acesso: TLabel
    Left = 22
    Top = 17
    Width = 42
    Height = 13
    Caption = 'Acesso'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_aux: TLabel
    Left = 67
    Top = 17
    Width = 22
    Height = 13
    Caption = 'Aux'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edt_nm_ct_contabil: TEdit
    Left = 224
    Top = 32
    Width = 201
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 7
  end
  object msk_cd_ct_contabil: TMaskEdit
    Left = 117
    Top = 32
    Width = 103
    Height = 21
    EditMask = '999.99.99999;0;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 12
    ParentFont = False
    TabOrder = 2
    OnExit = msk_cd_ct_contabilExit
    OnKeyDown = msk_cd_ct_contabilKeyDown
  end
  object btn_duplicar: TButton
    Left = 146
    Top = 104
    Width = 75
    Height = 25
    Caption = '&Duplicar'
    TabOrder = 5
    OnClick = btn_duplicarClick
  end
  object btn_fechar: TButton
    Left = 234
    Top = 104
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Fechar'
    ModalResult = 2
    TabOrder = 6
    OnClick = btn_fecharClick
  end
  object edt_nm_mes: TEdit
    Left = 67
    Top = 68
    Width = 126
    Height = 21
    TabStop = False
    Color = clMenu
    MaxLength = 10
    ReadOnly = True
    TabOrder = 8
  end
  object msk_cd_mes: TMaskEdit
    Left = 22
    Top = 68
    Width = 39
    Height = 21
    EditMask = '99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 3
    OnExit = msk_cd_mesExit
    OnKeyDown = msk_cd_ct_contabilKeyDown
  end
  object msk_cd_ano: TMaskEdit
    Left = 224
    Top = 68
    Width = 39
    Height = 21
    EditMask = '9999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    TabOrder = 4
    OnExit = msk_cd_ct_contabilExit
  end
  object msk_cd_acesso: TMaskEdit
    Left = 22
    Top = 32
    Width = 39
    Height = 21
    EditMask = '9999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    TabOrder = 0
    OnEnter = msk_cd_acessoEnter
    OnExit = msk_cd_acessoExit
  end
  object msk_cd_aux: TMaskEdit
    Left = 67
    Top = 32
    Width = 39
    Height = 21
    EditMask = '9999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    TabOrder = 1
    OnEnter = msk_cd_auxEnter
    OnExit = msk_cd_auxExit
  end
end

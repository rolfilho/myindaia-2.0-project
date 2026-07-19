object frmMyDigReplicarArquivo: TfrmMyDigReplicarArquivo
  Left = 464
  Top = 292
  BorderStyle = bsDialog
  Caption = 'Replicar arquivo'
  ClientHeight = 297
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 7
    Top = 5
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = 'Unidade'
    FocusControl = msk_cd_unid_neg
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object btn_co_unid_neg: TSpeedButton
    Left = 137
    Top = 20
    Width = 23
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
  end
  object Label9: TLabel
    Left = 7
    Top = 45
    Width = 45
    Height = 13
    Caption = 'Produto'
    FocusControl = msk_cd_produto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object btn_co_produto: TSpeedButton
    Left = 137
    Top = 60
    Width = 23
    Height = 21
    Enabled = False
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
  end
  object Label10: TLabel
    Left = 7
    Top = 89
    Width = 53
    Height = 13
    Caption = 'Processo'
    FocusControl = msk_nr_processo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object btn_co_processo: TSpeedButton
    Left = 106
    Top = 102
    Width = 23
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
  end
  object btnRemoveProcesso: TSpeedButton
    Left = 118
    Top = 84
    Width = 23
    Height = 22
    Hint = 'Remover processo da lista'
    Caption = 't'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Wingdings 3'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
    OnClick = btnRemoveProcessoClick
  end
  object btnAdicionaProcesso: TSpeedButton
    Left = 137
    Top = 101
    Width = 23
    Height = 22
    Hint = 'Adicionar processo a lista'
    Caption = 'u'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Wingdings 3'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = btnAdicionaProcessoClick
  end
  object lbProcessosReplicar0: TListBox
    Left = 13
    Top = 176
    Width = 184
    Height = 100
    Style = lbOwnerDrawVariable
    ItemHeight = 16
    TabOrder = 0
    Visible = False
    OnDrawItem = lbProcessosReplicar0DrawItem
  end
  object msk_cd_unid_neg: TMaskEdit
    Left = 7
    Top = 20
    Width = 28
    Height = 21
    AutoSize = False
    Ctl3D = False
    EditMask = '!99;0; '
    MaxLength = 2
    ParentCtl3D = False
    TabOrder = 1
    Text = '01'
    OnChange = msk_cd_unid_negChange
    OnExit = msk_cd_unid_negExit
    OnKeyPress = msk_cd_unid_negKeyPress
  end
  object edt_nm_unid_neg: TEdit
    Left = 36
    Top = 20
    Width = 100
    Height = 21
    TabStop = False
    AutoSize = False
    Ctl3D = False
    ParentColor = True
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 2
  end
  object msk_cd_produto: TMaskEdit
    Left = 7
    Top = 60
    Width = 28
    Height = 21
    AutoSize = False
    Ctl3D = False
    EditMask = '!99;0; '
    MaxLength = 2
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 3
    Text = '01'
    OnChange = msk_cd_produtoChange
    OnExit = msk_cd_unid_negExit
    OnKeyPress = msk_cd_unid_negKeyPress
  end
  object edt_nm_produto: TEdit
    Left = 36
    Top = 60
    Width = 100
    Height = 21
    TabStop = False
    AutoSize = False
    Ctl3D = False
    ParentColor = True
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 4
  end
  object msk_nr_processo: TMaskEdit
    Left = 7
    Top = 102
    Width = 96
    Height = 21
    AutoSize = False
    CharCase = ecUpperCase
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 5
    OnExit = msk_nr_processoExit
  end
  object btnReplicar: TBitBtn
    Left = 8
    Top = 142
    Width = 75
    Height = 25
    Caption = 'Realizar'
    TabOrder = 6
    OnClick = btnReplicarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnCancelar: TBitBtn
    Left = 92
    Top = 142
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 7
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object mmProcessosReplicar: TMemo
    Left = 180
    Top = 0
    Width = 217
    Height = 297
    Align = alRight
    ScrollBars = ssVertical
    TabOrder = 8
  end
end

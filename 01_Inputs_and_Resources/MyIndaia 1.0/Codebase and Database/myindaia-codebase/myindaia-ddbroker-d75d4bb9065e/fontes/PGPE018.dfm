object frm_exp: Tfrm_exp
  Left = 409
  Top = 145
  Width = 957
  Height = 684
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Processo de Exporta'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 941
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      941
      47)
    object shpPesquisa: TShape
      Left = 654
      Top = 4
      Width = 251
      Height = 39
      Anchors = [akTop, akRight]
      Brush.Color = clBtnFace
      Pen.Color = clGray
    end
    object btn_sair_exp: TSpeedButton
      Left = 908
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Sa'#237'da'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_sair_expClick
    end
    object btn_nova_exp: TSpeedButton
      Left = 5
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Novo Processo de Exp.'
      Enabled = False
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
      Layout = blGlyphBottom
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_nova_expClick
    end
    object btn_capa_exp: TSpeedButton
      Left = 42
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Capa'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_capa_expClick
    end
    object btn_itens_exp: TSpeedButton
      Left = 79
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Itens '
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FF666FFFF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FF6F666FF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FF66F6FFF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_itens_expClick
    end
    object btn_duplica_exp: TSpeedButton
      Left = 161
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Duplica Processo'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_duplica_expClick
    end
    object btn_exclui: TSpeedButton
      Left = 116
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Exclui Processo'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_excluiClick
    end
    object btn_manut_proc: TSpeedButton
      Left = 198
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Manuten'#231#227'o do Processo - <F2>'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
        1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
        1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
        193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
        11155557F755F777777555000755033305555577755F75F77F55555555503335
        0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
        05555757F75F75557F5505000333555505557F777FF755557F55000000355557
        07557777777F55557F5555000005555707555577777FF5557F55553000075557
        0755557F7777FFF5755555335000005555555577577777555555}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_manut_procClick
    end
    object btn_re: TSpeedButton
      Left = 235
      Top = 5
      Width = 37
      Height = 37
      Hint = 'RE'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_reClick
    end
    object lblPesquisar: TLabel
      Left = 658
      Top = 5
      Width = 56
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblOrdem: TLabel
      Left = 781
      Top = 5
      Width = 37
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Ordem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object shpNavigator: TShape
      Left = 552
      Top = 12
      Width = 95
      Height = 24
      Anchors = [akTop, akRight]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object SpeedButton8: TSpeedButton
      Left = 280
      Top = 5
      Width = 37
      Height = 37
      Hint = 'DU-E'
      Flat = True
      Glyph.Data = {
        F6030000424DF603000000000000360000002800000014000000100000000100
        180000000000C0030000120B0000120B00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0377E18377E18377E18377E18377E
        18377E18377E18377E18377E18377E18377E18377E18377E18377E18377E1837
        7E18377E18377E18377E18C0C0C0377E18C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0377E18C0C0C0377E18C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        377E18C0C0C0377E18C0C0C0377E18377E18C0C0C0C0C0C0C0C0C0C0C0C0377E
        18377E18C0C0C0C0C0C0C0C0C0C0C0C0377E18377E18377E18C0C0C0377E18C0
        C0C0377E18C0C0C0377E18C0C0C0377E18C0C0C0C0C0C0377E18C0C0C0C0C0C0
        377E18C0C0C0C0C0C0C0C0C0377E18C0C0C0C0C0C0C0C0C0377E18C0C0C0377E
        18C0C0C0377E18C0C0C0C0C0C0377E18C0C0C0377E18C0C0C0C1BCBC377E18C0
        C0C0C0C0C0C0C0C0377E18C0C0C0C0C0C0C0C0C0377E18C0C0C0377E18C0C0C0
        377E18C0C0C0C0C0C0377E18C0C0C0377E18C0C0C0C1BCBC377E18C0C0C0377E
        18C0C0C0377E18377E18377E18C0C0C0377E18C0C0C0377E18C0C0C0377E18C0
        C0C0C0C0C0377E18C0C0C0377E18C0C0C0C1BCBC377E18C0C0C0C0C0C0C0C0C0
        377E18C0C0C0C0C0C0C0C0C0377E18C0C0C0377E18C0C0C0377E18C0C0C0377E
        18C0C0C0C0C0C0377E18C0C0C0C0C0C0377E18C0C0C0C0C0C0C0C0C0377E18C0
        C0C0C0C0C0C0C0C0377E18C0C0C0377E18C0C0C0377E18377E18C0C0C0C0C0C0
        C0C0C0377E18C0C0C0C0C0C0377E18C0C0C0C0C0C0C0C0C0377E18377E18377E
        18C0C0C0377E18C0C0C0377E18C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        377E18C0C0C0377E18C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0377E18C0
        C0C0377E18377E18377E18377E18377E18377E18377E18377E18377E18377E18
        377E18377E18377E18377E18377E18377E18377E18377E18377E18C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
      ParentShowHint = False
      ShowHint = True
      Spacing = 3
      OnClick = SpeedButton8Click
    end
    object btnDraftBl: TSpeedButton
      Left = 319
      Top = 5
      Width = 37
      Height = 37
      Hint = 'Draft de BL'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        AB8179B3897BB3897BB3897BB3897BB3897BB3897BB3897BB3897BB3897BB389
        7BB3897BB3897BFF00FFFF00FFFF00FFAE837AF8E7CDF7E5C8F6E3C4F6E0BFF5
        DFBAF4DDB6F4DBB2F2D8AEF2D6A9F1D5A6F1D3A3B3897BFF00FFFF00FFFF00FF
        B1867BF8EAD3F8E8CFF7E5CAF6E4C4009900F5DFBCF4DDB7F4DAB3F3D8AEF3D7
        AAF2D5A6B3897BFF00FFFF00FFFF00FFB5887BF9ECD9F8EBD4F7E8CF00990000
        9900009900F6DFBDF4DDB8F3DCB3F3D9AFF3D7ABB3897BFF00FFFF00FFFF00FF
        B98B7CFAEFDEF9EDD90099004993427AA8660099006B9F56F5DFBDF4DDB8F4DB
        B4F3DAB0B3897BFF00FFFF00FFFF00FFBD8F7DFBF2E3FBF0DF009900F3E9D0F8
        E9D0BAC89B009900009900F1DEBBF4DEB9F4DCB5B3897BFF00FFFF00FFFF00FF
        C1917EFBF4E9FBF2E4FAF0DFFAEEDBF9ECD6F8EAD2ECE1C4009900009900F5E0
        BFF5DEBAB3897BFF00FFFF00FFFF00FFC5957EFDF6EDFCF4EAFBF3E5FBF1E1F9
        EEDCFAECD7F8EAD2F8E8CEF7E6C9F7E3C5F6E0BFB3897BFF00FFFF00FFFF00FF
        CA987FFDF9F1DF993EDF993EDF993EDF993EDF993EDF993EDF993EDF993EDF99
        3EF6E3C6B3897BFF00FFFF00FFFF00FFCE9B80FDFAF6FDF9F3FDF7EFFCF5EBFC
        F3E6FAF1E2FAF0DEFAEDD9F9EAD4F8E8D0F7E6CAB3897BFF00FFFF00FFFF00FF
        D19E81FEFCFAFEFBF6FEF9F3FDF7EFFCF5ECFBF3E7FAF1E3FAEFDEF9EEDAF9EB
        D5F8E9D1B3897BFF00FFFF00FFFF00FFD5A081FEFDFCDF993EDF993EDF993EDF
        993EDF993EDF993EDF993EDF993EDF993EF9EBD6B3897BFF00FFFF00FFFF00FF
        D8A282FFFFFFFFFEFDFEFDFBFEFCF7FEFAF4FDF8F1FDF7EDFBF5E9FBF3E4FAF1
        E0FAEFDCB3897BFF00FFFF00FFFF00FFDAA482FFFFFFFFFFFFFFFFFDFFFDFBFE
        FCF8FEFAF4FDF9F2FCF7EEFCF5EAFCF3E5FAF1E1B3897BFF00FFFF00FFFF00FF
        DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA4
        82DAA482DAA482FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDraftBlClick
    end
    object dbnvg: TDBNavigator
      Left = 554
      Top = 13
      Width = 92
      Height = 22
      DataSource = datm_exp.ds_exp
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object edt_chave: TEdit
      Left = 659
      Top = 18
      Width = 118
      Height = 21
      Anchors = [akTop, akRight]
      AutoSize = False
      BevelInner = bvNone
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnChange = edt_chaveChange
    end
    object cmbOrdem: TComboBox
      Left = 781
      Top = 18
      Width = 120
      Height = 21
      BevelInner = bvLowered
      BevelKind = bkFlat
      Style = csDropDownList
      Anchors = [akTop, akRight]
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      OnClick = cmbOrdemClick
    end
  end
  object pnlEspaco: TPanel
    Left = 0
    Top = 47
    Width = 941
    Height = 5
    Align = alTop
    BevelOuter = bvNone
    BevelWidth = 5
    TabOrder = 1
  end
  object pnlProcExp: TPanel
    Left = 0
    Top = 52
    Width = 941
    Height = 574
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object lbl_cd_unid_neg: TLabel
      Left = 8
      Top = 12
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 344
      Top = 8
      Width = 25
      Height = 23
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
      OnClick = btn_co_unid_negClick
    end
    object edt_nm_unid_neg: TEdit
      Left = 92
      Top = 9
      Width = 250
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 63
      Top = 9
      Width = 30
      Height = 21
      EditMask = '!99;0; '
      MaxLength = 2
      TabOrder = 0
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object dbgrd_exp: TDBGrid
      Left = 10
      Top = 37
      Width = 930
      Height = 540
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      Ctl3D = False
      DataSource = datm_exp.ds_exp
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgrd_expDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CalcNrProcesso'
          Title.Caption = 'Processo'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_REGISTRO_PEDIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Dt.Abertura'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_EXPORTADOR'
          Title.Caption = 'C'#243'd.'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_EXPORTADOR'
          Title.Caption = 'Empresa Nacional'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 360
          Visible = True
        end>
    end
    object chkProcessos: TCheckBox
      Left = 548
      Top = 11
      Width = 183
      Height = 17
      Caption = 'Exibir apenas Processos Recentes'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = chkProcessosClick
    end
  end
  object menu_cadastro: TMainMenu
    Left = 671
    Top = 105
    object mi_nova_exp: TMenuItem
      Caption = '&Novo'
      Enabled = False
      Hint = ' '
      RadioItem = True
      OnClick = btn_nova_expClick
    end
    object mi_capa_exp: TMenuItem
      Caption = '&Capa'
      Enabled = False
      Hint = ' '
      RadioItem = True
      OnClick = btn_capa_expClick
    end
    object mi_item_exp: TMenuItem
      Caption = '&Item'
      Enabled = False
      Hint = ' '
      RadioItem = True
      OnClick = btn_itens_expClick
    end
    object mi_exclui: TMenuItem
      Caption = '&Exclui'
      Enabled = False
      OnClick = btn_excluiClick
    end
    object mi_duplica_exp: TMenuItem
      Caption = 'D&uplica'
      Enabled = False
      OnClick = btn_duplica_expClick
    end
    object mi_manut_proc: TMenuItem
      Caption = '&Manuten'#231#227'o do Processo'
      ShortCut = 113
      OnClick = btn_manut_procClick
    end
    object mi_docs: TMenuItem
      Caption = '&Documentos'
      Enabled = False
      object mi_docs_fatura: TMenuItem
        Caption = '&Fatura Comercial - BASF'
        Enabled = False
        OnClick = mi_docs_faturaClick
      end
      object FaturaComercialModelo21: TMenuItem
        Caption = 'Fatura Comercial - Modelo 2'
        OnClick = FaturaComercialModelo21Click
      end
      object mi_docs_cert_orig: TMenuItem
        Caption = '&Certificados de Origem'
        Enabled = False
        OnClick = mi_docs_cert_origClick
      end
      object mi_docs_packing: TMenuItem
        Caption = '&Packing List - BASF  - Air Products'
        Enabled = False
        OnClick = mi_docs_packingClick
      end
      object PackingListModelo21: TMenuItem
        Caption = 'Packing List - Modelo 2'
        Enabled = False
        Visible = False
        OnClick = PackingListModelo21Click
      end
      object miPaletizacao: TMenuItem
        Caption = 'Packing List - Paletiza'#231#227'o'
        OnClick = miPaletizacaoClick
      end
      object mi_docs_cert_seg: TMenuItem
        Caption = 'Certificado de Seguro'
        Enabled = False
        OnClick = mi_docs_cert_segClick
      end
      object mi_docs_instr_emb: TMenuItem
        Caption = '&Instru'#231#227'o de Embarque'
        Enabled = False
        OnClick = mi_docs_instr_embClick
      end
      object mi_PlanilhaFIESP: TMenuItem
        Caption = 'Planilha FIESP'
        OnClick = mi_PlanilhaFIESPClick
      end
      object miCertificadodeOrigemFIESP: TMenuItem
        Caption = 'Certificado de Origem - FIESP'
        OnClick = miCertificadodeOrigemFIESPClick
      end
      object relatrioRiex1: TMenuItem
        Caption = 'Relat'#243'rio Riex'
        OnClick = relatrioRiex1Click
      end
      object Nestl1: TMenuItem
        Caption = 'Nestl'#233
        object ProgramaoRodoviria1: TMenuItem
          Caption = 'Programa'#231#227'o Rodovi'#225'ria'
          OnClick = ProgramaoRodoviria1Click
        end
        object Saque1: TMenuItem
          Caption = 'Saque'
          OnClick = Saque1Click
        end
        object CertificadodeQualidade1: TMenuItem
          Caption = 'Certificado de Aptitud'
          OnClick = CertificadodeQualidade1Click
        end
        object Border1: TMenuItem
          Caption = 'Border'#244
          OnClick = Border1Click
        end
        object CARICOM1: TMenuItem
          Caption = 'CARICOM'
          OnClick = CARICOM1Click
        end
        object PackingList1: TMenuItem
          Caption = 'Packing List'
          OnClick = PackingList1Click
        end
        object FaturaComercial1: TMenuItem
          Caption = 'Fatura Comercial'
          OnClick = FaturaComercial1Click
        end
        object CertificadoVigilnciaSanitria1: TMenuItem
          Caption = 'Certificado - Vigil'#226'ncia Sanit'#225'ria'
          OnClick = CertificadoVigilnciaSanitria1Click
        end
      end
      object Petronas1: TMenuItem
        Caption = 'Petronas'
        object PackingList2: TMenuItem
          Caption = 'Packing List'
          OnClick = PackingList2Click
        end
        object FaturaComercial2: TMenuItem
          Caption = 'Fatura Comercial'
          OnClick = FaturaComercial2Click
        end
      end
      object Apolo1: TMenuItem
        Caption = 'Apolo'
        object PackingList3: TMenuItem
          Caption = 'Packing List'
          OnClick = PackingList3Click
        end
        object FaturaComercial3: TMenuItem
          Caption = 'Fatura Comercial'
          OnClick = FaturaComercial3Click
        end
      end
    end
    object mi_re: TMenuItem
      Caption = '&RE'
      OnClick = btn_reClick
    end
    object validarLotesNestle: TMenuItem
      Caption = 'Validar Lotes (Nestle)'
      OnClick = validarLotesNestleClick
    end
    object mi_saida: TMenuItem
      Caption = '&Sair'
      RadioItem = True
      OnClick = btn_sair_expClick
    end
  end
end

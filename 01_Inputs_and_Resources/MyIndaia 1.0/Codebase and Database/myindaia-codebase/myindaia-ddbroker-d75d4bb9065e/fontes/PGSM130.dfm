object frm_abre_proc: Tfrm_abre_proc
  Left = 379
  Top = 111
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Abertura de Processo'
  ClientHeight = 537
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_manut
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = btn_cancelarClick
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label15: TLabel
    Left = 229
    Top = 196
    Width = 284
    Height = 13
    Caption = 'Pressione o bot'#227'o " Incluir " para a cria'#231#227'o de um processo.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object pnlUnidProd: TPanel
    Left = 0
    Top = 56
    Width = 742
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Shape1: TShape
      Left = 580
      Top = 3
      Width = 161
      Height = 52
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object lbl_cd_unid_neg: TLabel
      Left = 14
      Top = 15
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
      Left = 262
      Top = 28
      Width = 23
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
      OnClick = btn_co_unid_negClick
    end
    object lbl_cd_produto: TLabel
      Left = 298
      Top = 15
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_produto: TSpeedButton
      Left = 545
      Top = 28
      Width = 23
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
      OnClick = btn_co_produtoClick
    end
    object lbl_nr_processo: TLabel
      Left = 585
      Top = 10
      Width = 121
      Height = 13
      Caption = 'Processo(s) Criado(s)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edt_nm_unid_neg: TEdit
      Left = 47
      Top = 28
      Width = 214
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edt_nm_produto: TEdit
      Left = 331
      Top = 28
      Width = 213
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object msk_nr_processo: TMaskEdit
      Left = 585
      Top = 25
      Width = 106
      Height = 23
      TabStop = False
      AutoSize = False
      BevelOuter = bvNone
      BevelKind = bkFlat
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      OnChange = msk_nr_processoChange
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 14
      Top = 28
      Width = 34
      Height = 21
      EditMask = '!99;0; '
      MaxLength = 2
      TabOrder = 3
      OnChange = msk_cd_unid_negChange
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
      OnKeyPress = msk_cd_unid_negKeyPress
    end
    object msk_cd_produto: TMaskEdit
      Left = 298
      Top = 28
      Width = 34
      Height = 21
      EditMask = '!99;0; '
      MaxLength = 2
      TabOrder = 4
      OnChange = msk_cd_produtoChange
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
      OnKeyPress = msk_cd_unid_negKeyPress
    end
    object spin_seq_processo: TSpinButton
      Left = 720
      Top = 26
      Width = 15
      Height = 21
      DownGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000000000000080800000808000008080000080
        8000008080000080800000808000000000000000000000000000008080000080
        8000008080000080800000808000000000000000000000000000000000000000
        0000008080000080800000808000000000000000000000000000000000000000
        0000000000000000000000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      FocusControl = msk_seq_processo
      TabOrder = 5
      UpGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000000000000000000000000000000000000000000000000000000000000080
        8000008080000080800000000000000000000000000000000000000000000080
        8000008080000080800000808000008080000000000000000000000000000080
        8000008080000080800000808000008080000080800000808000000000000080
        8000008080000080800000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      OnDownClick = spin_seq_processoDownClick
      OnUpClick = spin_seq_processoUpClick
    end
    object msk_seq_processo: TMaskEdit
      Left = 690
      Top = 25
      Width = 29
      Height = 23
      TabStop = False
      AutoSize = False
      BevelOuter = bvNone
      BevelKind = bkFlat
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Text = '1'#186
    end
  end
  object pnl_manut_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 56
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    DesignSize = (
      742
      56)
    object btn_salvar: TSpeedButton
      Left = 47
      Top = 4
      Width = 43
      Height = 48
      Hint = 'Salvar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 90
      Top = 4
      Width = 43
      Height = 48
      Hint = 'Cancelar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = btn_cancelarClick
    end
    object btn_sair: TSpeedButton
      Left = 494
      Top = 4
      Width = 42
      Height = 48
      Hint = 'Sair'
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
      NumGlyphs = 2
      OnClick = btn_sairClick
    end
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 4
      Width = 43
      Height = 48
      Hint = 'Incluir'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_incluirClick
    end
    object btn_manut_proc: TSpeedButton
      Left = 141
      Top = 4
      Width = 43
      Height = 48
      Hint = 'Manuten'#231#227'o do Processo - <F2>'
      Enabled = False
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
      Visible = False
      OnClick = btn_manut_procClick
    end
    object btn_proc_realiza: TSpeedButton
      Left = 184
      Top = 4
      Width = 43
      Height = 48
      Hint = 'Realiza'#231#227'o por Processo - <CTRL+F2>'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_proc_realizaClick
    end
    object btn_instr_embarque: TSpeedButton
      Left = 227
      Top = 4
      Width = 43
      Height = 48
      Hint = 'Envio da Instru'#231#227'o'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_instr_embarqueClick
    end
    object btn_pedido: TSpeedButton
      Left = 270
      Top = 4
      Width = 43
      Height = 48
      Hint = 'Pedido de Instru'#231#227'o'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_pedidoClick
    end
    object Bevel1: TBevel
      Left = 542
      Top = 19
      Width = 192
      Height = 29
      Anchors = [akTop, akRight]
      Shape = bsFrame
      Style = bsRaised
    end
    object lbl_nm_usuario: TLabel
      Left = 541
      Top = 6
      Width = 52
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Usu'#225'rio: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edt_nm_usuario: TEdit
      Left = 549
      Top = 26
      Width = 178
      Height = 17
      TabStop = False
      Anchors = [akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object pnl_duplica_proc: TPanel
      Left = 321
      Top = 4
      Width = 165
      Height = 48
      BevelInner = bvLowered
      TabOrder = 1
      TabStop = True
      Visible = False
      object btn_co_processo_fonte: TSpeedButton
        Left = 134
        Top = 20
        Width = 25
        Height = 22
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
        OnClick = btn_co_processo_fonteClick
      end
      object chkbox_dup: TCheckBox
        Left = 7
        Top = 5
        Width = 67
        Height = 17
        Caption = '&Duplicar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = chkbox_dupClick
      end
      object msk_nr_processo_fonte: TMaskEdit
        Left = 7
        Top = 21
        Width = 126
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 18
        ParentFont = False
        TabOrder = 1
        OnExit = msk_nr_processo_fonteExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
    end
  end
  object pnlCliServ: TPanel
    Left = 0
    Top = 111
    Width = 742
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 2
    Visible = False
    object lbl_cd_cliente: TLabel
      Left = 15
      Top = -1
      Width = 40
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_cliente: TSpeedButton
      Left = 338
      Top = 12
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
      OnClick = btn_co_clienteClick
    end
    object lbl_cd_servico: TLabel
      Left = 375
      Top = -1
      Width = 44
      Height = 13
      Caption = 'Servi'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_servico: TSpeedButton
      Left = 707
      Top = 12
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
      OnClick = btn_co_servicoClick
    end
    object Label21: TLabel
      Left = 14
      Top = 44
      Width = 356
      Height = 13
      Alignment = taRightJustify
      Caption = 'Qtd de Processos a serem abertos com as informa'#231#245'es abaixo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_nm_cliente: TEdit
      Left = 77
      Top = 12
      Width = 260
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object edt_nm_servico: TEdit
      Left = 425
      Top = 12
      Width = 281
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
    object msk_cd_cliente: TMaskEdit
      Left = 14
      Top = 12
      Width = 64
      Height = 21
      EditMask = '!99999;0; '
      MaxLength = 5
      TabOrder = 3
      OnChange = msk_cd_clienteChange
      OnExit = msk_cd_clienteExit
      OnKeyDown = msk_cd_unid_negKeyDown
      OnKeyPress = msk_cd_unid_negKeyPress
    end
    object msk_cd_servico: TMaskEdit
      Left = 375
      Top = 12
      Width = 50
      Height = 21
      EditMask = '!999;0; '
      MaxLength = 3
      TabOrder = 4
      OnChange = msk_cd_servicoChange
      OnExit = msk_cd_servicoExit
      OnKeyDown = msk_cd_unid_negKeyDown
      OnKeyPress = msk_cd_unid_negKeyPress
    end
    object eQtdProc: TEdit
      Left = 374
      Top = 41
      Width = 26
      Height = 19
      AutoSize = False
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Text = '1'
      OnExit = eQtdProcExit
      OnKeyPress = eQtdProcKeyPress
    end
  end
  object pgcDadosFatores: TPageControl
    Left = 0
    Top = 176
    Width = 742
    Height = 361
    ActivePage = tsDados
    Align = alClient
    TabOrder = 3
    OnChange = pgcDadosFatoresChange
    object tsDados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      object pnl_exp: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 333
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object btn_co_cotacao: TSpeedButton
          Left = 330
          Top = 155
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
          Visible = False
          OnClick = btn_co_cotacaoClick
        end
        object lb_ag_exp: TLabel
          Left = 368
          Top = 89
          Width = 41
          Height = 13
          Caption = 'Agente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ag_exp: TSpeedButton
          Left = 697
          Top = 101
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
          OnClick = btn_co_ag_expClick
        end
        object lb_cia_amrador_exp: TLabel
          Left = 6
          Top = 89
          Width = 63
          Height = 13
          Caption = 'Companhia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_cia_exp: TSpeedButton
          Left = 330
          Top = 102
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
          Visible = False
          OnClick = btn_co_cia_expClick
        end
        object btn_co_arm_exp: TSpeedButton
          Left = 330
          Top = 102
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
          OnClick = btn_co_arm_expClick
        end
        object Label8: TLabel
          Left = 7
          Top = 51
          Width = 40
          Height = 13
          Caption = 'Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_origem_exp: TSpeedButton
          Left = 330
          Top = 64
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
          OnClick = btn_co_origem_expClick
        end
        object lb_tp_comercial_exp: TLabel
          Left = 201
          Top = 142
          Width = 51
          Height = 13
          Caption = 'Proposta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_prop_exp: TSpeedButton
          Left = 330
          Top = 155
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
          OnClick = btn_prop_expClick
        end
        object btn_co_destino_exp: TSpeedButton
          Left = 698
          Top = 63
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
          OnClick = btn_co_destino_expClick
        end
        object Label10: TLabel
          Left = 367
          Top = 51
          Width = 44
          Height = 13
          Caption = 'Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 367
          Top = 12
          Width = 124
          Height = 13
          Caption = 'Refer'#234'ncia do Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEstufagem3: TLabel
          Left = 6
          Top = 226
          Width = 107
          Height = 13
          Caption = 'Tipo de Estufagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_nm_ag_exp: TEdit
          Left = 417
          Top = 102
          Width = 280
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 0
        end
        object edt_nm_arm_exp: TEdit
          Left = 56
          Top = 102
          Width = 273
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
          Visible = False
        end
        object edt_nm_destino_exp: TEdit
          Left = 409
          Top = 64
          Width = 288
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 2
        end
        object edt_nm_origem_exp: TEdit
          Left = 50
          Top = 64
          Width = 279
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object edt_nm_cia_exp: TEdit
          Left = 56
          Top = 102
          Width = 273
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
        object dgrp_tp_processo: TRadioGroup
          Left = 8
          Top = 9
          Width = 348
          Height = 33
          Columns = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 1
          Items.Strings = (
            'Direto'
            'Consolidado')
          ParentFont = False
          TabOrder = 5
          OnClick = dgrp_tp_processoClick
        end
        object msk_ref_exp: TMaskEdit
          Left = 368
          Top = 25
          Width = 191
          Height = 21
          MaxLength = 20
          TabOrder = 6
        end
        object msk_cd_origem_exp: TMaskEdit
          Left = 7
          Top = 64
          Width = 43
          Height = 21
          EditMask = '!9999;0; '
          MaxLength = 4
          TabOrder = 7
          OnExit = msk_cd_origem_expExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object msk_cd_destino_exp: TMaskEdit
          Left = 368
          Top = 64
          Width = 42
          Height = 21
          EditMask = '!9999;0; '
          MaxLength = 4
          TabOrder = 8
          OnExit = msk_cd_destino_expExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object msk_cd_cia_exp: TMaskEdit
          Left = 7
          Top = 102
          Width = 48
          Height = 21
          EditMask = '!9999;0; '
          MaxLength = 4
          TabOrder = 9
          OnExit = msk_cd_cia_expExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object msk_cd_arm_exp: TMaskEdit
          Left = 7
          Top = 102
          Width = 49
          Height = 21
          EditMask = '!9999;0; '
          MaxLength = 4
          TabOrder = 10
          Visible = False
          OnExit = msk_cd_arm_expExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object msk_cd_ag_exp: TMaskEdit
          Left = 368
          Top = 102
          Width = 50
          Height = 21
          EditMask = '!9999;0; '
          MaxLength = 4
          TabOrder = 11
          OnExit = msk_cd_ag_expExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object rdgroup_tp_comercial: TRadioGroup
          Left = 7
          Top = 136
          Width = 146
          Height = 81
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'Proposta'
            'Cota'#231#227'o')
          ParentFont = False
          TabOrder = 12
          OnClick = rdgroup_tp_comercialClick
        end
        object msk_prop_exp: TMaskEdit
          Left = 201
          Top = 155
          Width = 128
          Height = 21
          TabOrder = 13
          OnExit = msk_prop_expExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object GroupBox1: TGroupBox
          Left = 368
          Top = 136
          Width = 355
          Height = 174
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 14
          object Label7: TLabel
            Left = 15
            Top = 35
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
          object btn_co_unid_vinc_exp: TSpeedButton
            Left = 316
            Top = 47
            Width = 25
            Height = 22
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
            OnClick = btn_co_unid_vinc_expClick
          end
          object Label9: TLabel
            Left = 15
            Top = 79
            Width = 45
            Height = 13
            Caption = 'Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_prod_vinc_exp: TSpeedButton
            Left = 316
            Top = 91
            Width = 25
            Height = 22
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
            OnClick = btn_co_prod_vinc_expClick
          end
          object btn_proc_vinc_exp: TSpeedButton
            Left = 157
            Top = 137
            Width = 25
            Height = 23
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
            OnClick = btn_proc_vinc_expClick
          end
          object Label11: TLabel
            Left = 15
            Top = 124
            Width = 134
            Height = 13
            Caption = 'Processo Desembara'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Shape2: TShape
            Left = 2
            Top = 7
            Width = 350
            Height = 21
            Brush.Color = clSilver
            Pen.Color = clGray
          end
          object edt_nm_unid_vinc: TEdit
            Left = 47
            Top = 48
            Width = 268
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 0
          end
          object edt_nm_prod_vinc: TEdit
            Left = 47
            Top = 92
            Width = 268
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 1
          end
          object msk_cd_unid_vinc: TMaskEdit
            Left = 15
            Top = 48
            Width = 33
            Height = 21
            Enabled = False
            EditMask = '!99;0; '
            MaxLength = 2
            TabOrder = 2
            OnExit = msk_cd_unid_vincExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object msk_cd_prod_vinc: TMaskEdit
            Left = 15
            Top = 92
            Width = 33
            Height = 21
            Enabled = False
            EditMask = '!99;0; '
            MaxLength = 2
            TabOrder = 3
            OnExit = msk_cd_prod_vincExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object msk_proc_vinc_exp: TMaskEdit
            Left = 15
            Top = 137
            Width = 141
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 18
            ParentFont = False
            TabOrder = 4
            OnExit = msk_proc_vinc_expExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object chkbx_proc_vinc_exp: TCheckBox
            Left = 6
            Top = 9
            Width = 232
            Height = 17
            Caption = 'Processo Desembara'#231'o - Vincula'#231#227'o'
            Color = clSilver
            ParentColor = False
            TabOrder = 5
            OnClick = chkbx_proc_vinc_expClick
          end
        end
        object cbbEstufagem3: TComboBox
          Left = 6
          Top = 240
          Width = 125
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 15
          Items.Strings = (
            'FCL'
            'LCL')
        end
      end
      object pnl_imp: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 333
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object shp2: TShape
          Left = 12
          Top = 19
          Width = 186
          Height = 86
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object lb_ag: TLabel
          Left = 12
          Top = 248
          Width = 41
          Height = 13
          Caption = 'Agente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_agente: TSpeedButton
          Left = 341
          Top = 260
          Width = 24
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
          OnClick = btn_co_agenteClick
        end
        object lb_cia_amrador: TLabel
          Left = 12
          Top = 161
          Width = 63
          Height = 13
          Caption = 'Companhia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_cia: TSpeedButton
          Left = 340
          Top = 173
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
          Visible = False
          OnClick = btn_co_ciaClick
        end
        object btn_co_armador: TSpeedButton
          Left = 340
          Top = 173
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
          OnClick = btn_co_armadorClick
        end
        object Label5: TLabel
          Left = 12
          Top = 116
          Width = 40
          Height = 13
          Caption = 'Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_origem: TSpeedButton
          Left = 340
          Top = 128
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
          OnClick = btn_co_origemClick
        end
        object Label6: TLabel
          Left = 12
          Top = 205
          Width = 44
          Height = 13
          Caption = 'Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_destino: TSpeedButton
          Left = 340
          Top = 217
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
          OnClick = btn_co_destinoClick
        end
        object btn_co_cot_imp: TSpeedButton
          Left = 156
          Top = 62
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
          OnClick = btn_co_cot_impClick
        end
        object lblEstufagem2: TLabel
          Left = 213
          Top = 17
          Width = 107
          Height = 13
          Caption = 'Tipo de Estufagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape5: TShape
          Left = 14
          Top = 21
          Width = 182
          Height = 21
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object lbl1: TLabel
          Left = 20
          Top = 25
          Width = 104
          Height = 13
          Caption = 'Digite a Cota'#231#227'o :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Shape6: TShape
          Left = 389
          Top = 11
          Width = 193
          Height = 17
          Brush.Color = clBlack
          Pen.Color = clGray
        end
        object Label19: TLabel
          Left = 393
          Top = 13
          Width = 40
          Height = 13
          Caption = 'Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label20: TLabel
          Left = 521
          Top = 13
          Width = 25
          Height = 13
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object edt_nm_agente: TEdit
          Left = 61
          Top = 261
          Width = 279
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 14
        end
        object edt_nm_cia: TEdit
          Left = 60
          Top = 174
          Width = 279
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 10
        end
        object edt_nm_armador: TEdit
          Left = 60
          Top = 174
          Width = 279
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 9
          Visible = False
        end
        object edt_nm_origem: TEdit
          Left = 56
          Top = 129
          Width = 283
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 6
        end
        object edt_nm_destino: TEdit
          Left = 54
          Top = 218
          Width = 285
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 12
        end
        object rd_group_tp_proc: TRadioGroup
          Left = 213
          Top = 56
          Width = 152
          Height = 49
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 1
          Items.Strings = (
            'Direto'
            'Consolidado')
          ParentFont = False
          TabOrder = 2
          OnClick = rd_group_tp_procClick
        end
        object msk_cd_origem: TMaskEdit
          Left = 12
          Top = 129
          Width = 45
          Height = 21
          EditMask = '!9999;0; '
          MaxLength = 4
          TabOrder = 5
          OnExit = msk_cd_origemExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object msk_cd_destino: TMaskEdit
          Left = 12
          Top = 218
          Width = 43
          Height = 21
          EditMask = '!9999;0; '
          MaxLength = 4
          TabOrder = 11
          OnExit = msk_cd_destinoExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object msk_cd_cia: TMaskEdit
          Left = 12
          Top = 174
          Width = 48
          Height = 21
          EditMask = '!9999;0; '
          MaxLength = 4
          TabOrder = 8
          OnExit = msk_cd_ciaExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object msk_cd_armador: TMaskEdit
          Left = 12
          Top = 174
          Width = 49
          Height = 21
          EditMask = '!9999;0; '
          MaxLength = 4
          TabOrder = 7
          Visible = False
          OnExit = msk_cd_armadorExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object msk_cd_agente: TMaskEdit
          Left = 12
          Top = 261
          Width = 50
          Height = 21
          EditMask = '!9999;0; '
          MaxLength = 4
          TabOrder = 13
          OnExit = msk_cd_agenteExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object GroupBox2: TGroupBox
          Left = 389
          Top = 125
          Width = 309
          Height = 157
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object Label12: TLabel
            Left = 12
            Top = 39
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
          object btn_co_unid_vinc_imp: TSpeedButton
            Left = 272
            Top = 51
            Width = 25
            Height = 22
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
            OnClick = btn_co_unid_vinc_impClick
          end
          object Label13: TLabel
            Left = 12
            Top = 75
            Width = 45
            Height = 13
            Caption = 'Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_prod_vinc_imp: TSpeedButton
            Left = 272
            Top = 87
            Width = 25
            Height = 22
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
            OnClick = btn_co_prod_vinc_impClick
          end
          object btn_proc_vinc_imp: TSpeedButton
            Left = 146
            Top = 124
            Width = 25
            Height = 23
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
            OnClick = btn_proc_vinc_impClick
          end
          object Label14: TLabel
            Left = 12
            Top = 111
            Width = 134
            Height = 13
            Caption = 'Processo Desembara'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object shp1: TShape
            Left = 2
            Top = 7
            Width = 304
            Height = 24
            Brush.Color = clSilver
            Pen.Color = clGray
          end
          object edt_nm_unid_vinc_imp: TEdit
            Left = 44
            Top = 52
            Width = 227
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 2
          end
          object edt_nm_prod_vinc_imp: TEdit
            Left = 44
            Top = 88
            Width = 227
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 4
          end
          object msk_cd_unid_vinc_imp: TMaskEdit
            Left = 12
            Top = 52
            Width = 33
            Height = 21
            Enabled = False
            EditMask = '!99;0; '
            MaxLength = 2
            TabOrder = 1
            OnExit = msk_cd_unid_vinc_impExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object msk_cd_prod_vinc_imp: TMaskEdit
            Left = 12
            Top = 88
            Width = 33
            Height = 21
            Enabled = False
            EditMask = '!99;0; '
            MaxLength = 2
            TabOrder = 3
            OnExit = msk_cd_prod_vinc_impExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object msk_proc_vinc_imp: TMaskEdit
            Left = 12
            Top = 124
            Width = 133
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 18
            ParentFont = False
            TabOrder = 5
            OnExit = msk_proc_vinc_impExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object chkbx_proc_vinc_imp: TCheckBox
            Left = 7
            Top = 10
            Width = 231
            Height = 17
            Caption = 'Processo Desembara'#231'o - Vincula'#231#227'o'
            Color = clSilver
            ParentColor = False
            TabOrder = 0
            OnClick = chkbx_proc_vinc_impClick
          end
        end
        object cbbEstufagem2: TComboBox
          Left = 213
          Top = 31
          Width = 125
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'FCL'
            'LCL')
        end
        object msk_proposta: TMaskEdit
          Left = 28
          Top = 63
          Width = 127
          Height = 21
          TabOrder = 3
          OnExit = msk_propostaExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object grdRefFIImp: TStringGrid
          Left = 390
          Top = 29
          Width = 193
          Height = 89
          ColCount = 3
          Ctl3D = False
          DefaultColWidth = 151
          DefaultRowHeight = 20
          RowCount = 1
          FixedRows = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
          ParentCtl3D = False
          ScrollBars = ssVertical
          TabOrder = 0
          OnExit = grdRefFIImpExit
          OnKeyDown = grdRefFIImpKeyDown
          OnKeyPress = grdRefFIImpKeyPress
          OnSelectCell = grdRefFIImpSelectCell
          OnSetEditText = grdRefFIImpSetEditText
          RowHeights = (
            17)
        end
      end
      object pnl_desembaraco: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 333
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Shape4: TShape
          Left = 568
          Top = 10
          Width = 158
          Height = 17
          Brush.Color = clBlack
          Pen.Color = clGray
        end
        object Shape3: TShape
          Left = 368
          Top = 46
          Width = 194
          Height = 17
          Brush.Color = clBlack
          Pen.Color = clGray
        end
        object Label1: TLabel
          Left = 378
          Top = 48
          Width = 40
          Height = 13
          Caption = 'Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lbl_area: TLabel
          Left = 7
          Top = 9
          Width = 27
          Height = 13
          Caption = #193'rea'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_area: TSpeedButton
          Left = 160
          Top = 22
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
          OnClick = btn_co_areaClick
        end
        object lbl_li: TLabel
          Left = 579
          Top = 12
          Width = 30
          Height = 13
          Caption = 'N'#186' LI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label34: TLabel
          Left = 145
          Top = 45
          Width = 108
          Height = 13
          Caption = 'N'#186' Conhec. Master'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 6
          Top = 45
          Width = 99
          Height = 13
          Caption = 'N'#186' Conhecimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_fat: TLabel
          Left = 367
          Top = 234
          Width = 161
          Height = 13
          Caption = 'N'#186' Documento de Embarque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_entreposto: TLabel
          Left = 293
          Top = 45
          Width = 62
          Height = 13
          Caption = 'Entreposto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 6
          Top = 82
          Width = 147
          Height = 13
          Caption = 'Analista Resp. Comiss'#225'ria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 194
          Top = 9
          Width = 36
          Height = 13
          Caption = 'C'#233'lula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_celula: TSpeedButton
          Left = 331
          Top = 22
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
          OnClick = btn_co_celulaClick
        end
        object Label18: TLabel
          Left = 500
          Top = 48
          Width = 25
          Height = 13
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lblEstufagem1: TLabel
          Left = 6
          Top = 191
          Width = 107
          Height = 13
          Caption = 'Tipo de Estufagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 367
          Top = 9
          Width = 153
          Height = 13
          Caption = 'Instru'#231#227'o de Desembara'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Btn_InstrucaoDesemb: TSpeedButton
          Left = 529
          Top = 22
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
          OnClick = Btn_InstrucaoDesembClick
        end
        object edt_nm_area: TEdit
          Left = 37
          Top = 22
          Width = 122
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 16
        end
        object msk_nr_conhecimento: TMaskEdit
          Left = 6
          Top = 58
          Width = 125
          Height = 21
          MaxLength = 30
          TabOrder = 2
        end
        object msk_nr_conhecimento_master: TMaskEdit
          Left = 145
          Top = 58
          Width = 135
          Height = 21
          MaxLength = 30
          TabOrder = 3
        end
        object grdRef: TStringGrid
          Left = 368
          Top = 65
          Width = 193
          Height = 164
          ColCount = 3
          Ctl3D = False
          DefaultColWidth = 151
          DefaultRowHeight = 20
          RowCount = 1
          FixedRows = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
          ParentCtl3D = False
          ScrollBars = ssVertical
          TabOrder = 13
          OnExit = grdRefExit
          OnKeyDown = grdRefKeyDown
          OnKeyPress = grdRefKeyPress
          OnSelectCell = grdRefSelectCell
          OnSetEditText = grdRefSetEditText
          RowHeights = (
            17)
        end
        object grdLI: TStringGrid
          Left = 568
          Top = 27
          Width = 157
          Height = 201
          ColCount = 2
          Ctl3D = False
          DefaultColWidth = 151
          DefaultRowHeight = 20
          RowCount = 1
          FixedRows = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
          ParentCtl3D = False
          ScrollBars = ssVertical
          TabOrder = 14
          OnKeyDown = grdLIKeyDown
          OnSetEditText = grdLISetEditText
          RowHeights = (
            17)
        end
        object DBGrid_Doc: TDBGrid
          Left = 368
          Top = 247
          Width = 359
          Height = 84
          Ctl3D = False
          DataSource = datm_abre_proc.ds_doc_inst_temp
          ParentCtl3D = False
          TabOrder = 15
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'Look_doc_inst_emb'
              Title.Caption = 'Doc. de embarque'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 123
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_DCTO_INSTRUCAO'
              Title.Caption = 'N'#186' do doc.'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_DOCUMENTO'
              Title.Caption = 'Dt. Fatura'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 83
              Visible = True
            end>
        end
        object dbgrid_conhec_vinc: TDBGrid
          Left = 6
          Top = 247
          Width = 350
          Height = 84
          Color = clMenu
          Ctl3D = False
          DataSource = datm_abre_proc.ds_conhec_vinc
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 11
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NR_PROCESSO'
              Title.Caption = 'Processo'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NM_ORIGEM'
              Title.Caption = 'Origem'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NM_DESTNO'
              Title.Caption = 'Destino'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 110
              Visible = True
            end>
        end
        object checbx_proc_vinc_ag: TCheckBox
          Left = 6
          Top = 230
          Width = 246
          Height = 17
          Caption = 'Processos Agenciamento - Vincula'#231#227'o'
          Ctl3D = True
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 10
          OnClick = checbx_proc_vinc_agClick
        end
        object cbbox_entreposto: TComboBox
          Left = 294
          Top = 58
          Width = 63
          Height = 21
          ItemHeight = 13
          TabOrder = 4
          Text = 'N'#195'O'
          Items.Strings = (
            'N'#195'O'
            'SIM')
        end
        object edt_nm_analrc: TEdit
          Left = 55
          Top = 95
          Width = 301
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 6
        end
        object msk_cd_analrc: TMaskEdit
          Left = 6
          Top = 95
          Width = 50
          Height = 21
          TabStop = False
          Color = clMenu
          EditMask = '!9999;0; '
          MaxLength = 4
          ReadOnly = True
          TabOrder = 5
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object edt_nm_celula: TEdit
          Left = 224
          Top = 22
          Width = 106
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 17
        end
        object msk_cd_celula: TMaskEdit
          Left = 195
          Top = 22
          Width = 30
          Height = 21
          EditMask = '!99;0; '
          MaxLength = 2
          TabOrder = 1
          OnExit = msk_cd_celulaExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object cbbEstufagem1: TComboBox
          Left = 6
          Top = 205
          Width = 125
          Height = 21
          Style = csDropDownList
          BiDiMode = bdLeftToRight
          ItemHeight = 13
          ParentBiDiMode = False
          TabOrder = 9
          Items.Strings = (
            'FCL'
            'LCL')
        end
        object EditInstrucaoDesemb: TMaskEdit
          Left = 367
          Top = 22
          Width = 161
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 13
          TabOrder = 12
          OnExit = EditInstrucaoDesembExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object msk_cd_area: TMaskEdit
          Left = 6
          Top = 22
          Width = 32
          Height = 21
          MaxLength = 2
          TabOrder = 0
          OnExit = msk_cd_areaExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object pnlRepresentante: TPanel
          Left = 3
          Top = 117
          Width = 358
          Height = 37
          BevelOuter = bvNone
          TabOrder = 7
          object Label17: TLabel
            Left = 5
            Top = 1
            Width = 84
            Height = 13
            Caption = 'Representante'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_representante: TSpeedButton
            Left = 328
            Top = 14
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
            OnClick = btn_co_representanteClick
          end
          object msk_cd_representante: TMaskEdit
            Left = 4
            Top = 14
            Width = 49
            Height = 21
            EditMask = '!99999;0; '
            MaxLength = 5
            TabOrder = 0
            OnExit = msk_cd_representanteExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object edt_nm_representante: TEdit
            Left = 53
            Top = 14
            Width = 273
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 1
          end
        end
        object pnlLocalDesembarque: TPanel
          Left = 3
          Top = 153
          Width = 358
          Height = 36
          BevelOuter = bvNone
          TabOrder = 8
          object Label26: TLabel
            Left = 5
            Top = 1
            Width = 131
            Height = 13
            Caption = 'Local de Desembarque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_local_desembarque: TSpeedButton
            Left = 328
            Top = 14
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
            OnClick = btn_co_local_desembarqueClick
          end
          object msk_cd_local_desembarque: TMaskEdit
            Left = 4
            Top = 14
            Width = 47
            Height = 21
            EditMask = '!9999;0; '
            MaxLength = 4
            TabOrder = 0
            OnExit = msk_cd_local_desembarqueExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object edt_nm_local_desembarque: TEdit
            Left = 53
            Top = 14
            Width = 273
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 1
          end
        end
      end
    end
    object tsFatores: TTabSheet
      Caption = 'Fatores'
      object scbFatores: TScrollBox
        Left = 0
        Top = 0
        Width = 734
        Height = 333
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
      end
    end
    object tsFollowup: TTabSheet
      Caption = 'Followup'
      ImageIndex = 2
    end
    object tsBid: TTabSheet
      Caption = 'BID'
      ImageIndex = 3
      object pnlBid: TPanel
        Left = 5
        Top = 0
        Width = 721
        Height = 309
        Caption = 'pnlBid'
        TabOrder = 0
        Visible = False
        object cxGrid1: TcxGrid
          Left = 1
          Top = 72
          Width = 719
          Height = 236
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            OnKeyUp = cxGrid1DBTableView1KeyUp
            DataController.DataSource = datm_abre_proc.ds_BID_Nestle
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.ScrollBars = ssHorizontal
            OptionsView.GroupByBox = False
            object cxGrid1DBTableView1CONTRACT_ID: TcxGridDBColumn
              DataBinding.FieldName = 'CONTRACT_ID'
              Width = 50
            end
            object cxGrid1DBTableView1CD_CARRIER: TcxGridDBColumn
              DataBinding.FieldName = 'CD_CARRIER'
              Width = 50
            end
            object cxGrid1DBTableView1CARRIER: TcxGridDBColumn
              DataBinding.FieldName = 'CARRIER'
              Width = 50
            end
            object cxGrid1DBTableView1COMMODITY: TcxGridDBColumn
              DataBinding.FieldName = 'COMMODITY'
              Width = 50
            end
            object cxGrid1DBTableView1AREA: TcxGridDBColumn
              DataBinding.FieldName = 'AREA'
              Width = 50
            end
            object cxGrid1DBTableView1UNIQUE_IDENTIFIER: TcxGridDBColumn
              DataBinding.FieldName = 'UNIQUE_IDENTIFIER'
              Width = 50
            end
            object cxGrid1DBTableView1ORIGIN_SERVICE: TcxGridDBColumn
              DataBinding.FieldName = 'ORIGIN_SERVICE'
              Width = 50
            end
            object cxGrid1DBTableView1DESTINATION_SERVICE: TcxGridDBColumn
              DataBinding.FieldName = 'DESTINATION_SERVICE'
              Width = 50
            end
            object cxGrid1DBTableView1CD_ORIG_COUNTRY: TcxGridDBColumn
              DataBinding.FieldName = 'CD_ORIG_COUNTRY'
              Width = 50
            end
            object cxGrid1DBTableView1ORIG_COUNTRY: TcxGridDBColumn
              DataBinding.FieldName = 'ORIG_COUNTRY'
              Width = 50
            end
            object cxGrid1DBTableView1CD_DEST_COUNTRY: TcxGridDBColumn
              DataBinding.FieldName = 'CD_DEST_COUNTRY'
              Width = 50
            end
            object cxGrid1DBTableView1DEST_COUNTRY: TcxGridDBColumn
              DataBinding.FieldName = 'DEST_COUNTRY'
              Width = 50
            end
            object cxGrid1DBTableView1CD_ORIGIN_CITY: TcxGridDBColumn
              DataBinding.FieldName = 'CD_ORIGIN_CITY'
              Width = 50
            end
            object cxGrid1DBTableView1ORIGIN_CITY: TcxGridDBColumn
              DataBinding.FieldName = 'ORIGIN_CITY'
              Width = 50
            end
            object cxGrid1DBTableView1CD_DEST_CITY: TcxGridDBColumn
              DataBinding.FieldName = 'CD_DEST_CITY'
              Width = 50
            end
            object cxGrid1DBTableView1DEST_CITY: TcxGridDBColumn
              DataBinding.FieldName = 'DEST_CITY'
              Width = 50
            end
            object cxGrid1DBTableView1CD_PORT_LOAD: TcxGridDBColumn
              DataBinding.FieldName = 'CD_PORT_LOAD'
              Width = 20
            end
            object cxGrid1DBTableView1PORT_LOAD: TcxGridDBColumn
              DataBinding.FieldName = 'PORT_LOAD'
              Width = 20
            end
            object cxGrid1DBTableView1CD_PORT_DISCHARGE: TcxGridDBColumn
              DataBinding.FieldName = 'CD_PORT_DISCHARGE'
              Width = 50
            end
            object cxGrid1DBTableView1PORT_DISCHARGE: TcxGridDBColumn
              DataBinding.FieldName = 'PORT_DISCHARGE'
              Width = 50
            end
            object cxGrid1DBTableView1CD_EQUIPMENT: TcxGridDBColumn
              DataBinding.FieldName = 'CD_EQUIPMENT'
              Width = 50
            end
            object cxGrid1DBTableView1EQUIPMENT: TcxGridDBColumn
              DataBinding.FieldName = 'EQUIPMENT'
              Width = 50
            end
            object cxGrid1DBTableView1TOTAL_PRICE: TcxGridDBColumn
              DataBinding.FieldName = 'TOTAL_PRICE'
              Width = 50
            end
            object cxGrid1DBTableView1PRICE_CURRENCY: TcxGridDBColumn
              DataBinding.FieldName = 'PRICE_CURRENCY'
              Width = 50
            end
            object cxGrid1DBTableView1BASE_RATE: TcxGridDBColumn
              DataBinding.FieldName = 'BASE_RATE'
              Width = 50
            end
            object cxGrid1DBTableView1BASE_RATE_CURRENCY: TcxGridDBColumn
              DataBinding.FieldName = 'BASE_RATE_CURRENCY'
              Width = 50
            end
            object cxGrid1DBTableView1TRANSIT_TIME: TcxGridDBColumn
              DataBinding.FieldName = 'TRANSIT_TIME'
              Width = 50
            end
            object cxGrid1DBTableView1CD_DEST_NEST: TcxGridDBColumn
              DataBinding.FieldName = 'CD_DEST_NEST'
              Width = 50
            end
            object cxGrid1DBTableView1DEST_NEST: TcxGridDBColumn
              DataBinding.FieldName = 'DEST_NEST'
              Width = 50
            end
            object cxGrid1DBTableView1CD_ORIG_NEST: TcxGridDBColumn
              DataBinding.FieldName = 'CD_ORIG_NEST'
              Width = 50
            end
            object cxGrid1DBTableView1ORIG_NEST: TcxGridDBColumn
              DataBinding.FieldName = 'ORIG_NEST'
              Width = 50
            end
            object cxGrid1DBTableView1PRODUCT: TcxGridDBColumn
              DataBinding.FieldName = 'PRODUCT'
              Width = 50
            end
            object cxGrid1DBTableView1SHIPPING_TERMS: TcxGridDBColumn
              DataBinding.FieldName = 'SHIPPING_TERMS'
              Width = 50
            end
            object cxGrid1DBTableView1TRAFFIC_TYPE: TcxGridDBColumn
              DataBinding.FieldName = 'TRAFFIC_TYPE'
              Width = 50
            end
            object cxGrid1DBTableView1CARRIER_AWARD: TcxGridDBColumn
              DataBinding.FieldName = 'CARRIER_AWARD'
              Width = 50
            end
            object cxGrid1DBTableView1CARRIER_ALLOCATION: TcxGridDBColumn
              DataBinding.FieldName = 'CARRIER_ALLOCATION'
              Width = 50
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
        object Panel1: TPanel
          Left = 8
          Top = 5
          Width = 705
          Height = 60
          TabOrder = 1
          object Label22: TLabel
            Left = 8
            Top = 9
            Width = 90
            Height = 13
            Caption = 'Pais de Destino'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label23: TLabel
            Left = 186
            Top = 9
            Width = 131
            Height = 13
            Caption = 'Local de Desembarque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 370
            Top = 9
            Width = 110
            Height = 13
            Caption = 'Local de Embarque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label25: TLabel
            Left = 544
            Top = 9
            Width = 41
            Height = 13
            Caption = 'Agente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbDestNest: TDBEdit
            Left = 38
            Top = 23
            Width = 125
            Height = 21
            Color = clScrollBar
            DataField = 'DEST_NEST'
            DataSource = datm_abre_proc.ds_BID_Nestle
            TabOrder = 0
          end
          object dbCdDestNest: TDBEdit
            Left = 4
            Top = 23
            Width = 33
            Height = 21
            Color = clScrollBar
            DataField = 'CD_DEST_NEST'
            DataSource = datm_abre_proc.ds_BID_Nestle
            TabOrder = 1
          end
          object dbCdPort: TDBEdit
            Left = 185
            Top = 23
            Width = 33
            Height = 21
            Color = clScrollBar
            DataField = 'CD_PORT_DISCHARGE'
            DataSource = datm_abre_proc.ds_BID_Nestle
            TabOrder = 2
          end
          object dbPort: TDBEdit
            Left = 218
            Top = 23
            Width = 125
            Height = 21
            Color = clScrollBar
            DataField = 'PORT_DISCHARGE'
            DataSource = datm_abre_proc.ds_BID_Nestle
            TabOrder = 3
          end
          object dbCdCity: TDBEdit
            Left = 363
            Top = 23
            Width = 33
            Height = 21
            Color = clScrollBar
            DataField = 'CD_ORIGIN_CITY'
            DataSource = datm_abre_proc.ds_BID_Nestle
            TabOrder = 4
          end
          object dbCity: TDBEdit
            Left = 396
            Top = 23
            Width = 125
            Height = 21
            Color = clScrollBar
            DataField = 'ORIGIN_CITY'
            DataSource = datm_abre_proc.ds_BID_Nestle
            TabOrder = 5
          end
          object dbCdAgente: TDBEdit
            Left = 541
            Top = 23
            Width = 33
            Height = 21
            Color = clScrollBar
            DataField = 'CD_CARRIER'
            DataSource = datm_abre_proc.ds_BID_Nestle
            TabOrder = 6
          end
          object dbAgente: TDBEdit
            Left = 575
            Top = 23
            Width = 125
            Height = 21
            Color = clScrollBar
            DataField = 'CARRIER'
            DataSource = datm_abre_proc.ds_BID_Nestle
            TabOrder = 7
          end
        end
      end
    end
  end
  object menu_manut: TMainMenu
    Left = 170
    Top = 6
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      OnClick = btn_incluirClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
    object mi_manut_proc: TMenuItem
      Caption = '&Manuten'#231#227'o do Processo'
      Enabled = False
      Visible = False
      OnClick = btn_manut_procClick
    end
    object mi_proc_realiza: TMenuItem
      Caption = 'Realiza'#231#227'o por &Processo'
      Enabled = False
      Visible = False
      OnClick = btn_proc_realizaClick
    end
    object mi_instr_embarque: TMenuItem
      Caption = 'Envio da Instru'#231#227'o'
      Enabled = False
      OnClick = btn_instr_embarqueClick
    end
    object mi_pedido: TMenuItem
      Caption = '&Pedido de Instru'#231#227'o'
      Enabled = False
      OnClick = btn_pedidoClick
    end
  end
end

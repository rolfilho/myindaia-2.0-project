object frm_gerar_remessa: Tfrm_gerar_remessa
  Left = 171
  Top = 148
  Width = 750
  Height = 550
  Caption = 'Gerar Remessa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_grid: TPanel
    Left = 0
    Top = 113
    Width = 742
    Height = 325
    Align = alClient
    Caption = 'pnl_grid'
    TabOrder = 2
    object grid_remessa: TDBGrid
      Left = 1
      Top = 1
      Width = 740
      Height = 323
      Align = alClient
      Color = clInfoBk
      DataSource = datm_gerar_remessa.ds_processo_faturas
      FixedColor = clWindowFrame
      Options = [dgEditing, dgTitles]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = grid_remessaCellClick
      OnColEnter = grid_remessaColEnter
      OnColExit = grid_remessaColExit
      OnDrawColumnCell = grid_remessaDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'IN_SELECIONADO'
          Title.Caption = 'Sel'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_MASTER'
          Title.Caption = '  Master'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 113
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_HOUSE'
          Title.Caption = ' House'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
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
          FieldName = 'NM_AGENTE'
          Title.Caption = 'Agente'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_EMPRESA'
          Title.Caption = 'Cliente'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'calc_tp_fatura'
          Title.Caption = 'D/C'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 29
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taRightJustify
          Title.Caption = '   Valor  '
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
  end
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 53
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      53)
    object btn_sair: TSpeedButton
      Left = 700
      Top = 4
      Width = 37
      Height = 45
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_sairClick
    end
    object btn_salvar: TSpeedButton
      Left = 47
      Top = 4
      Width = 43
      Height = 45
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
      Height = 45
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
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 4
      Width = 43
      Height = 45
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
    object btn_pesq: TSpeedButton
      Left = 139
      Top = 4
      Width = 41
      Height = 45
      Hint = 'Pesquisar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
        BB0BBBBBBBBBBBBBBF8FBBBBBBBBBBBBB000BBBBBBBBBBBBF888BBBBBBBBBBBB
        000BBBBBBBBBBBBF888BBBBBBBBBBBB000BBBBBBBBBBBBF888BBBBBBBBBBBB00
        0BBBBBBBBFFFBF888BBBBBB80008BB80BBBBBBBF8883F888BBBBBB08888800BB
        BBBBBB887778888BBBBBB08FFFFF80BBBBBBB8F7777778FBBBBB88FFFFFFF88B
        BBBBB8777777783FBBBB08FFFFFFF80BBBBB8F777777778FBBBB08FFFFFFF80B
        BBBB8F777777778FBBBB08FFFFFFF80BBBBB83F77777778BBBBB88FFFFFFF88B
        BBBBB8F7777778FBBBBBB08FFFFF80BBBBBBB83FF777F8BBBBBBBB0888880BBB
        BBBBBB883FF88BBBBBBBBBB80008BBBBBBBBBBBB888BBBBBBBBB}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_pesqClick
    end
    object btn_emissao_fat: TSpeedButton
      Left = 186
      Top = 4
      Width = 41
      Height = 45
      Hint = 'Emiss'#227'o Remessa'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
        0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
        0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
        0005555555575FF7777555555555000555555555555577755555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_emissao_fatClick
    end
    object Label1: TLabel
      Left = 483
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Remessa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_remessa: TEdit
      Left = 484
      Top = 21
      Width = 139
      Height = 21
      TabStop = False
      AutoSize = False
      BevelKind = bkFlat
      BevelOuter = bvNone
      CharCase = ecUpperCase
      Color = clMenu
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
    object rdgrp_tp_processo: TRadioGroup
      Left = 238
      Top = 7
      Width = 235
      Height = 35
      BiDiMode = bdLeftToRight
      Caption = 'Tipo Processo'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel_pesquisa: TPanel
    Left = 0
    Top = 53
    Width = 742
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 1
    object Label4: TLabel
      Left = 12
      Top = 11
      Width = 92
      Height = 13
      Caption = 'Agente Account'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_agente: TSpeedButton
      Left = 314
      Top = 24
      Width = 26
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
    object Label7: TLabel
      Left = 357
      Top = 11
      Width = 39
      Height = 13
      Caption = 'Moeda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_moeda: TSpeedButton
      Left = 455
      Top = 24
      Width = 26
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
      OnClick = btn_co_moedaClick
    end
    object edt_nm_agente: TEdit
      Left = 47
      Top = 25
      Width = 266
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
    object edt_nm_moeda: TEdit
      Left = 392
      Top = 25
      Width = 62
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object msk_cd_agente: TMaskEdit
      Left = 12
      Top = 25
      Width = 36
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 0
      OnChange = msk_cd_agenteChange
      OnExit = msk_cd_agenteExit
      OnKeyDown = msk_cd_moedaKeyDown
    end
    object msk_cd_moeda: TMaskEdit
      Left = 357
      Top = 25
      Width = 36
      Height = 21
      EditMask = '999;0; '
      MaxLength = 3
      TabOrder = 1
      OnChange = msk_cd_moedaChange
      OnExit = msk_cd_moedaExit
      OnKeyDown = msk_cd_moedaKeyDown
    end
    object rdgp_via_transp: TRadioGroup
      Left = 498
      Top = 10
      Width = 169
      Height = 37
      Caption = 'Via de Transporte'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'A'#233'reo'
        'Marit'#237'mo')
      ParentFont = False
      TabOrder = 4
      OnClick = btn_pesqClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 438
    Width = 742
    Height = 66
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Label12: TLabel
      Left = 16
      Top = 15
      Width = 63
      Height = 13
      Caption = 'Valor Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 104
      Top = 15
      Width = 90
      Height = 13
      Caption = 'Valor da Moeda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 211
      Top = 15
      Width = 86
      Height = 13
      Caption = 'Valor em Reais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 689
      Top = 18
      Width = 87
      Height = 13
      Caption = 'Disponibilidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label10: TLabel
      Left = 343
      Top = 15
      Width = 37
      Height = 13
      Caption = 'Banco'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_vl_total: TEdit
      Left = 16
      Top = 29
      Width = 70
      Height = 21
      AutoSize = False
      BevelKind = bkFlat
      BevelOuter = bvNone
      Color = clMenu
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
    object edt_vl_real: TEdit
      Left = 210
      Top = 29
      Width = 115
      Height = 21
      AutoSize = False
      BevelKind = bkFlat
      BevelOuter = bvNone
      Color = clMenu
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object edt_vl_moeda: TMaskEdit
      Left = 104
      Top = 29
      Width = 89
      Height = 21
      EditMask = '0,000000;1;_'
      MaxLength = 8
      TabOrder = 2
      Text = ' ,      '
      OnExit = edt_vl_moedaExit
    end
    object edt_vl_disp: TEdit
      Left = 690
      Top = 32
      Width = 89
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
      Visible = False
    end
    object edt_nm_bco: TEdit
      Left = 375
      Top = 29
      Width = 284
      Height = 21
      TabStop = False
      AutoSize = False
      BevelKind = bkFlat
      BevelOuter = bvNone
      CharCase = ecUpperCase
      Color = clMenu
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
    end
    object edt_cd_bco: TEdit
      Left = 343
      Top = 29
      Width = 33
      Height = 21
      TabStop = False
      AutoSize = False
      BevelKind = bkFlat
      BevelOuter = bvNone
      CharCase = ecUpperCase
      Color = clMenu
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  object MainMenu1: TMainMenu
    Left = 564
    Top = 360
    object mi_incluir: TMenuItem
      Caption = 'Incluir'
      OnClick = btn_incluirClick
    end
    object mi_salvar: TMenuItem
      Caption = 'Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = 'Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_pesquisar: TMenuItem
      Caption = '&Pesquisar'
      OnClick = btn_pesqClick
    end
    object TMenuItem
    end
    object mi_emissao: TMenuItem
      Caption = '&Emiss'#227'o de remessa'
      OnClick = btn_emissao_fatClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end

object FrmRelRetrabalho: TFrmRelRetrabalho
  Left = 486
  Top = 187
  ActiveControl = msk_cd_unid_neg
  BorderStyle = bsDialog
  Caption = 'Rela'#231#227'o de Retrabalhos'
  ClientHeight = 505
  ClientWidth = 383
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlBotoes: TPanel
    Left = 0
    Top = 462
    Width = 383
    Height = 43
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 0
    DesignSize = (
      383
      43)
    object btn_sair: TBitBtn
      Left = 287
      Top = 8
      Width = 88
      Height = 27
      Hint = 'Fecha a tela de relat'#243'rio'
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Sai&r'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btn_sairClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
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
    end
    object BtnGerar: TBitBtn
      Left = 192
      Top = 8
      Width = 88
      Height = 27
      Hint = 'Gera uma planilha em Excel '
      Anchors = [akTop, akRight]
      Caption = '&Gerar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BtnGerarClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 383
    Height = 462
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 1
    object lbl_periodo: TLabel
      Left = 11
      Top = 247
      Width = 120
      Height = 13
      Caption = 'Selecione o per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_a: TLabel
      Left = 117
      Top = 267
      Width = 8
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblGrupo: TLabel
      Left = 11
      Top = 122
      Width = 35
      Height = 13
      Caption = 'Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_grupo: TSpeedButton
      Left = 273
      Top = 138
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
      OnClick = btn_co_grupoClick
    end
    object lbl_unid_neg: TLabel
      Left = 11
      Top = 43
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
      Left = 273
      Top = 56
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
      OnClick = btn_co_unid_negClick
    end
    object btn_co_produto: TSpeedButton
      Left = 273
      Top = 97
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
      OnClick = btn_co_produtoClick
    end
    object lbl1: TLabel
      Left = 11
      Top = 82
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_processo: TLabel
      Left = 11
      Top = 380
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
    object btn_co_processo: TSpeedButton
      Left = 97
      Top = 395
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
      OnClick = btn_co_processoClick
    end
    object LblCarregando: TLabel
      Left = 12
      Top = 426
      Width = 104
      Height = 13
      Caption = 'Carregando relat'#243'rio...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = False
      Visible = False
    end
    object Label1: TLabel
      Left = 11
      Top = 6
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
      Left = 273
      Top = 19
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
    object Label2: TLabel
      Left = 11
      Top = 162
      Width = 41
      Height = 13
      Caption = 'Evento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_evento: TSpeedButton
      Left = 273
      Top = 178
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
      OnClick = btn_co_eventoClick
    end
    object Label3: TLabel
      Left = 11
      Top = 291
      Width = 143
      Height = 13
      Caption = 'Carregamento na F'#225'brica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 117
      Top = 311
      Width = 8
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 11
      Top = 335
      Width = 228
      Height = 13
      Caption = 'Data de Sa'#237'da do Navio/Caminh'#227'o/V'#244'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 117
      Top = 355
      Width = 8
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblModal: TLabel
      Left = 11
      Top = 202
      Width = 35
      Height = 13
      Caption = 'Modal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_modal: TSpeedButton
      Left = 273
      Top = 218
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
      OnClick = btn_co_modalClick
    end
    object msk_dt_inicio: TDateEdit
      Left = 11
      Top = 263
      Width = 93
      Height = 21
      NumGlyphs = 2
      TabOrder = 12
    end
    object msk_dt_fim: TDateEdit
      Left = 137
      Top = 263
      Width = 93
      Height = 21
      NumGlyphs = 2
      TabOrder = 13
    end
    object msk_cd_grupo: TMaskEdit
      Left = 11
      Top = 139
      Width = 30
      Height = 21
      EditMask = '999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 6
      OnChange = btn_co_grupoClick
      OnExit = msk_cd_grupoExit
      OnKeyDown = msk_cd_grupoKeyDown
    end
    object edt_nm_grupo: TEdit
      Left = 43
      Top = 139
      Width = 228
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 7
      Text = 'Todos'
    end
    object PB: TProgressBar
      Left = 119
      Top = 433
      Width = 179
      Height = 12
      Smooth = True
      TabOrder = 15
      Visible = False
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 11
      Top = 57
      Width = 29
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 2
      OnChange = btn_co_unid_negClick
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_grupoKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 41
      Top = 57
      Width = 231
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
      Text = 'Todas'
    end
    object edt_nm_produto: TEdit
      Left = 41
      Top = 98
      Width = 231
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 5
      Text = 'Todos'
    end
    object msk_cd_produto: TMaskEdit
      Left = 11
      Top = 98
      Width = 29
      Height = 21
      MaxLength = 2
      TabOrder = 4
      OnChange = btn_co_produtoClick
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_grupoKeyDown
    end
    object msk_nr_processo: TMaskEdit
      Left = 11
      Top = 395
      Width = 86
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      OnKeyDown = msk_cd_grupoKeyDown
    end
    object msk_cd_celula: TMaskEdit
      Left = 11
      Top = 20
      Width = 29
      Height = 21
      Color = clMenu
      Enabled = False
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      OnChange = btn_co_celulaClick
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_grupoKeyDown
    end
    object edt_nm_celula: TEdit
      Left = 41
      Top = 20
      Width = 231
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
      Text = 'Todas'
    end
    object msk_cd_evento: TMaskEdit
      Left = 11
      Top = 179
      Width = 30
      Height = 21
      Color = clMenu
      Enabled = False
      EditMask = '999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 8
      OnChange = btn_co_eventoClick
      OnKeyDown = msk_cd_grupoKeyDown
    end
    object edt_nm_evento: TEdit
      Left = 43
      Top = 179
      Width = 228
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 9
      Text = 'Todos'
    end
    object msk_dt_inicio_e314: TDateEdit
      Left = 11
      Top = 307
      Width = 93
      Height = 21
      NumGlyphs = 2
      TabOrder = 16
    end
    object msk_dt_fim_e314: TDateEdit
      Left = 137
      Top = 307
      Width = 93
      Height = 21
      NumGlyphs = 2
      TabOrder = 17
    end
    object msk_dt_inicio_e132: TDateEdit
      Left = 11
      Top = 351
      Width = 93
      Height = 21
      NumGlyphs = 2
      TabOrder = 18
    end
    object msk_dt_fim_e132: TDateEdit
      Left = 137
      Top = 351
      Width = 93
      Height = 21
      NumGlyphs = 2
      TabOrder = 19
    end
    object msk_cd_modal: TMaskEdit
      Left = 11
      Top = 219
      Width = 28
      Height = 21
      Color = clMenu
      Enabled = False
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 10
      OnChange = btn_co_modalClick
      OnKeyDown = msk_cd_grupoKeyDown
    end
    object edt_nm_modal: TEdit
      Left = 43
      Top = 219
      Width = 228
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 11
      Text = 'Todos'
    end
  end
end

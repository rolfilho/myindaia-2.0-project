object frm_devolucao: Tfrm_devolucao
  Left = 165
  Top = 84
  Width = 640
  Height = 480
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Devolução de Numerário'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 44
    Width = 629
    Height = 389
  end
  object Bevel2: TBevel
    Left = 4
    Top = 48
    Width = 617
    Height = 181
    Style = bsRaised
  end
  object lbl_nr_processo: TLabel
    Left = 19
    Top = 133
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
  object SpeedButton2: TSpeedButton
    Left = 145
    Top = 129
    Width = 25
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
    OnClick = SpeedButton2Click
  end
  object lbl_cd_unid_neg: TLabel
    Left = 24
    Top = 69
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
  object lbl_cd_cliente: TLabel
    Left = 32
    Top = 164
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
  object lbl_cd_servico: TLabel
    Left = 28
    Top = 196
    Width = 44
    Height = 13
    Caption = 'Serviço'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 27
    Top = 101
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
  object btn_co_unid_neg: TSpeedButton
    Left = 277
    Top = 65
    Width = 25
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
    OnClick = btn_co_unid_negClick
  end
  object SpeedButton1: TSpeedButton
    Left = 277
    Top = 97
    Width = 25
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
    OnClick = SpeedButton1Click
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 629
    Height = 41
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 136
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Volta ao Menu Principal'
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
      OnClick = btn_sairClick
    end
    object btn_nova: TSpeedButton
      Left = 8
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Nova Devolução'
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
      OnClick = btn_novaClick
    end
    object btn_cancelar: TSpeedButton
      Left = 80
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Cancelar Devolução'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00AAAAAAAAAAAA
        AAAA7777777777777777A99A88888888899A7997888888888997A99900000000
        999A7999BBBBBBBB9997AA999FFFFFF999AA7799977777799977AAA999FFFF99
        98AA7779997777999877AAA0999FF99908AA777B99977999B877AAA0F999999F
        08AA777B79999997B877AAA0FF9999FF08AA777B77999977B877AAA0FF9999FF
        0AAA777B77999977B777AAA0F99999900AAA777B7999999BB777AAA0999F0999
        AAAA777B9997B9997777AAA999FF0F999AAA77799977BF999777AA999FFF00A9
        99AA77999777BB799977A99900000AAA999A7999BBBBB7779997A99AAAAAAAAA
        A99A7997777777777997AAAAAAAAAAAAAAAA7777777777777777}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancelarClick
    end
    object btn_abrir: TSpeedButton
      Left = 44
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Mostra Itens da Devolução'
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
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_abrirClick
    end
  end
  object mskedt_nr_processo: TMaskEdit
    Left = 80
    Top = 129
    Width = 61
    Height = 21
    EditMask = '99/9999-9;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 9
    ParentFont = False
    TabOrder = 1
    Text = '0000000'
    OnExit = mskedt_nr_processoExit
  end
  object edt_cd_cliente: TEdit
    Left = 80
    Top = 160
    Width = 37
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 2
  end
  object edt_nm_cliente: TEdit
    Left = 120
    Top = 160
    Width = 337
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 4
  end
  object edt_cd_servico: TEdit
    Left = 80
    Top = 192
    Width = 25
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 3
  end
  object edt_nm_servico: TEdit
    Left = 108
    Top = 192
    Width = 333
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 5
  end
  object mskedt_cd_unid_neg: TMaskEdit
    Left = 80
    Top = 65
    Width = 21
    Height = 21
    EditMask = '99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 6
    OnExit = mskedt_cd_unid_negExit
  end
  object edt_nm_unid_neg: TEdit
    Left = 104
    Top = 65
    Width = 169
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 7
  end
  object mskedt_cd_produto: TMaskEdit
    Left = 80
    Top = 97
    Width = 21
    Height = 21
    EditMask = '99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 8
    OnExit = mskedt_cd_produtoExit
  end
  object edt_nm_produto: TEdit
    Left = 104
    Top = 97
    Width = 169
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 9
  end
  object DBGrid1: TDBGrid
    Left = 4
    Top = 236
    Width = 617
    Height = 189
    DataSource = datm_devolucao.dsq_devolucao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Alignment = taCenter
        FieldName = 'NR_DEVOLUCAO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 100
      end
      item
        Alignment = taCenter
        FieldName = 'DT_DEVOLUCAO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 100
      end
      item
        FieldName = 'VL_DEVOLUCAO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 100
      end
      item
        Alignment = taCenter
        FieldName = 'Look_ap_usuario'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 129
      end
      item
        Alignment = taCenter
        FieldName = 'Look_Cancelado'
        Title.Alignment = taCenter
        Title.Color = clBlack
      end
      item
        Alignment = taCenter
        FieldName = 'DT_CANCELAMENTO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 100
      end
      item
        Alignment = taCenter
        FieldName = 'Look_usuario_Canc'
        Title.Alignment = taCenter
        Title.Color = clBlack
      end>
  end
  object menu_cadastro: TMainMenu
    Left = 568
    Top = 368
    object mi_nova_solinum: TMenuItem
      Caption = '&Nova '
      Hint = ' '
      RadioItem = True
      OnClick = btn_novaClick
    end
    object Itens1: TMenuItem
      Caption = '&Abrir'
      OnClick = btn_abrirClick
    end
    object mi_excluir_solinum: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_saida: TMenuItem
      Caption = '&Saída'
      RadioItem = True
      OnClick = btn_sairClick
    end
  end
  object sp_cancela_devolucao_: TStoredProc
    DatabaseName = 'DBPROCESSO'
    StoredProcName = 'dbo.sp_cancela_devolucao;1'
    Params.Data = {
      0100030006526573756C74040304000000000000000C406E725F70726F636573
      736F01010200300000000D406E725F6465766F6C7563616F0101020030000000}
    Left = 584
    Top = 56
  end
end

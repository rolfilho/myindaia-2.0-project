object frm_LI: Tfrm_LI
  Left = 606
  Top = 284
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Licen'#231'a de Importa'#231#227'o'
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
  object bvl_li: TBevel
    Left = 0
    Top = 49
    Width = 734
    Height = 443
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object lbl_nr_processo: TLabel
    Left = 21
    Top = 125
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
  object btn_nr_processo: TSpeedButton
    Left = 208
    Top = 121
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
  object lbl_cd_unid_neg: TLabel
    Left = 26
    Top = 67
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
    Left = 34
    Top = 160
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
    Left = 30
    Top = 185
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
  object btn_co_unid_neg: TSpeedButton
    Left = 417
    Top = 63
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
    OnClick = btn_co_unid_negClick
  end
  object lbl_produto: TLabel
    Left = 29
    Top = 96
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
    Left = 417
    Top = 92
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
    OnClick = btn_co_produtoClick
  end
  object msk_nr_processo: TMaskEdit
    Left = 81
    Top = 121
    Width = 125
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnChange = msk_nr_processoChange
    OnExit = msk_nr_processoExit
    OnKeyDown = msk_nr_processoKeyDown
  end
  object edt_nm_unid_neg: TEdit
    Left = 115
    Top = 63
    Width = 300
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 2
  end
  object edt_nm_cliente: TEdit
    Left = 121
    Top = 156
    Width = 425
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 8
  end
  object edt_nm_servico: TEdit
    Left = 121
    Top = 182
    Width = 425
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 10
  end
  object edt_nm_produto: TEdit
    Left = 115
    Top = 92
    Width = 300
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 4
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_sair_li: TSpeedButton
      Left = 699
      Top = 5
      Width = 38
      Height = 41
      Hint = 'Sa'#237'da'
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
      OnClick = btn_sair_liClick
    end
    object btn_nova_li: TSpeedButton
      Left = 5
      Top = 5
      Width = 38
      Height = 41
      Hint = 'Nova LI'
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
      OnClick = btn_nova_liClick
    end
    object btn_capa_li: TSpeedButton
      Left = 43
      Top = 5
      Width = 38
      Height = 41
      Hint = 'Capa LI'
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
      OnClick = btn_capa_liClick
    end
    object btn_itens_li: TSpeedButton
      Left = 81
      Top = 5
      Width = 38
      Height = 41
      Hint = 'Itens LI'
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
      OnClick = btn_itens_liClick
    end
    object btn_duplica_li: TSpeedButton
      Left = 130
      Top = 5
      Width = 38
      Height = 41
      Hint = 'Duplica'#231#227'o de LI '
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
    end
    object btn_imprime_li: TSpeedButton
      Left = 179
      Top = 5
      Width = 38
      Height = 41
      Hint = 'Imprime a Capa/Itens da LI'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888880000000
        000077777FFFFFFFFFFF888880EEEEEEEEE077777F777777777F888880EE5EE0
        000077777F77577FFFFF888880E0550EEEE077777F7F55F7777F88880EEE050E
        EEE07777F777F5F7777F8880EE0EE055EEE0777F77F77F55777F880EE0EE0E05
        5EE077F77F77F7F5577F80EE0EE0EEE055E07F77F77F777F557F0EE0EE0EE9EE
        0550F77F77F77B77F55F80EEE0EE9EE055E07F777F77B77F557F880EEEE9EE05
        5EE077F7777B77F5577F8889999EE055EEE0777BBBB77F55777F88980EEE055E
        000077B80777F557FFFF888980E055EE0EE0777B8F7F5577F77F888890EEEEEE
        0E087777BF777777F7F89999800000000088BBBB8FFFFFFFFF88}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_imprime_liClick
    end
    object btn_desmonta_li: TSpeedButton
      Left = 217
      Top = 5
      Width = 38
      Height = 41
      Hint = 'Desmontar LI'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0EEE333377777777777733330FF00FBFB0EE33337F37733F377733330F0BFB0B
        FB0E33337F73FF73337733330FF000BFBFB033337F377733333733330FFF0BFB
        FBF033337FFF733F333733300000BF0FBFB03FF77777F3733F37000FBFB0F0FB
        0BF077733FF7F7FF7337E0FB00000000BF0077F377777777F377E0BFBFBFBFB0
        F0F077F3333FFFF7F737E0FBFB0000000FF077F3337777777337E0BFBFBFBFB0
        FFF077F3333FFFF73FF7E0FBFB00000F000077FF337777737777E00FBFBFB0FF
        0FF07773FFFFF7337F37003000000FFF0F037737777773337F7333330FFFFFFF
        003333337FFFFFFF773333330000000003333333777777777333}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_desmonta_liClick
    end
    object btn_trans_LI: TSpeedButton
      Left = 255
      Top = 5
      Width = 38
      Height = 41
      Hint = 'Transmitir LI'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_trans_LIClick
    end
  end
  object dbgrd_li: TDBGrid
    Left = 9
    Top = 216
    Width = 722
    Height = 277
    Align = alCustom
    DataSource = datm_LI.ds_li
    Enabled = False
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = ppmLI
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrd_liDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'calc_nr_proc'
        ReadOnly = True
        Title.Caption = 'N'#186' Processo LI'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_PROCESSO_LI'
        ReadOnly = True
        Title.Caption = 'Data Abertura'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_REGISTRO_LI'
        ReadOnly = True
        Title.Caption = 'N'#186' Registro'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_REGISTRO_LI'
        ReadOnly = True
        Title.Caption = 'Data Registro'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 197
        Visible = True
      end>
  end
  object msk_cd_unid_neg: TMaskEdit
    Left = 81
    Top = 63
    Width = 35
    Height = 21
    EditMask = '99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 1
    OnExit = msk_cd_unid_negExit
    OnKeyDown = msk_nr_processoKeyDown
  end
  object msk_cd_produto: TMaskEdit
    Left = 81
    Top = 92
    Width = 35
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
    OnExit = msk_cd_produtoExit
    OnKeyDown = msk_nr_processoKeyDown
  end
  object edt_cd_cliente: TEdit
    Left = 81
    Top = 156
    Width = 40
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 7
  end
  object edt_cd_servico: TEdit
    Left = 81
    Top = 182
    Width = 40
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 9
  end
  object chk_ult_processos: TCheckBox
    Left = 237
    Top = 123
    Width = 108
    Height = 17
    Caption = #218'ltimos Processos'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object menu_cadastro: TMainMenu
    Left = 587
    Top = 11
    object mi_nova_li: TMenuItem
      Caption = '&Nova '
      Enabled = False
      Hint = ' '
      RadioItem = True
      OnClick = btn_nova_liClick
    end
    object mi_capa_li: TMenuItem
      Caption = '&Capa'
      Enabled = False
      Hint = ' '
      RadioItem = True
      OnClick = btn_capa_liClick
    end
    object mi_item_li: TMenuItem
      Caption = '&Item'
      Enabled = False
      Hint = ' '
      RadioItem = True
      OnClick = btn_itens_liClick
    end
    object mi_imprime_li: TMenuItem
      Caption = 'Im&primir'
      Enabled = False
      object mi_imprime_li_rasc_compl: TMenuItem
        Caption = 'Rascunho completo'
        OnClick = btn_imprime_liClick
      end
      object mi_imprime_li_rasc_resum: TMenuItem
        Caption = 'Rascunho resumido'
        OnClick = btn_imprime_liClick
      end
    end
    object ImportarItensDI1: TMenuItem
      Caption = 'Importar Itens DI'
      Enabled = False
      OnClick = ImportarItensDI1Click
    end
    object DuplicarLI1: TMenuItem
      Caption = 'Duplicar LI'
      Enabled = False
      OnClick = DuplicarLI1Click
    end
    object IncluirItensPedidos1: TMenuItem
      Caption = 'Incluir Itens Pedidos'
      Enabled = False
      OnClick = IncluirItensPedidos1Click
    end
    object mi_desmonta_li: TMenuItem
      Caption = '&Desmontar'
      Enabled = False
      OnClick = btn_desmonta_liClick
    end
    object mi_saida: TMenuItem
      Caption = '&Sa'#237'da'
      RadioItem = True
      OnClick = btn_sair_liClick
    end
  end
  object crp_li: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 619
    Top = 11
  end
  object ppmLI: TPopupMenu
    Left = 616
    Top = 240
    object miRetificaLI: TMenuItem
      Caption = 'Refitica LI'
      OnClick = miRetificaLIClick
    end
  end
end

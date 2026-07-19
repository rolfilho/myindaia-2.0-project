object frm_recebimento: Tfrm_recebimento
  Left = 188
  Top = 184
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Recebimento de Numer'#225'rio '
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 50
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 36
      Height = 42
      Hint = 'Incluir'
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
      OnClick = btn_incluirClick
    end
    object btn_salvar: TSpeedButton
      Left = 41
      Top = 4
      Width = 37
      Height = 42
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_salvarClick
    end
    object btn_Cancelar: TSpeedButton
      Left = 78
      Top = 4
      Width = 36
      Height = 42
      Hint = 'Cancelar Dados'
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_CancelarClick
    end
    object btn_sair: TSpeedButton
      Left = 701
      Top = 4
      Width = 36
      Height = 42
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
    object btn_cancela_recebimento: TSpeedButton
      Left = 120
      Top = 4
      Width = 36
      Height = 42
      Hint = 'Cancelar Recebimento de Numer'#225'rio'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancela_recebimentoClick
    end
    object btn_imprimir: TSpeedButton
      Left = 156
      Top = 4
      Width = 36
      Height = 42
      Hint = 'Imprimir recibo'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_imprimirClick
    end
  end
  object pnl_selecao: TPanel
    Left = 0
    Top = 50
    Width = 742
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbl_cd_cliente: TLabel
      Left = 287
      Top = 45
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
    object Label1: TLabel
      Left = 11
      Top = 45
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
    object btn_cd_produto: TSpeedButton
      Left = 251
      Top = 57
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
      OnClick = btn_cd_produtoClick
    end
    object lbl_cd_unid_neg: TLabel
      Left = 12
      Top = 7
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
    object btn_cd_unid_neg: TSpeedButton
      Left = 251
      Top = 19
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
      OnClick = btn_cd_unid_negClick
    end
    object btn_co_cliente: TSpeedButton
      Left = 543
      Top = 57
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
    object lbl_vl_rec2: TLabel
      Left = 580
      Top = 45
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor Recebido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_nr_processo: TLabel
      Left = 580
      Top = 7
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_grupo: TLabel
      Left = 287
      Top = 7
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
      Left = 543
      Top = 19
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
    object btn_co_processo: TSpeedButton
      Left = 707
      Top = 19
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
    object edt_nm_produto: TEdit
      Left = 35
      Top = 58
      Width = 215
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 5
    end
    object edt_nm_unid_neg: TEdit
      Left = 36
      Top = 20
      Width = 214
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 6
    end
    object edt_nm_cliente: TEdit
      Left = 331
      Top = 58
      Width = 211
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 7
    end
    object dbedt_vl_rec2: TDBEdit
      Left = 580
      Top = 58
      Width = 121
      Height = 21
      DataField = 'VL_RECEBIMENTO'
      DataSource = datm_recebimento.ds_receb
      MaxLength = 14
      TabOrder = 8
      Visible = False
      OnChange = dbedt_vl_recebimentoChange
      OnExit = dbedt_vl_rec2Exit
    end
    object edt_nm_grupo: TEdit
      Left = 323
      Top = 20
      Width = 219
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 9
    end
    object msk_nr_processo: TMaskEdit
      Left = 580
      Top = 20
      Width = 126
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnEnter = msk_nr_processoEnter
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_produto: TMaskEdit
      Left = 11
      Top = 58
      Width = 25
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
      OnEnter = msk_cd_produtoEnter
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 12
      Top = 20
      Width = 25
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_grupo: TMaskEdit
      Left = 287
      Top = 20
      Width = 37
      Height = 21
      EditMask = '999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 2
      OnChange = msk_cd_grupoChange
      OnEnter = msk_cd_grupoEnter
      OnExit = msk_cd_grupoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_cliente: TMaskEdit
      Left = 287
      Top = 58
      Width = 45
      Height = 21
      EditMask = '99999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 3
      OnChange = msk_cd_clienteChange
      OnEnter = msk_cd_clienteEnter
      OnExit = msk_cd_clienteExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
  end
  object pgctrl_receb: TPageControl
    Left = 0
    Top = 139
    Width = 742
    Height = 365
    ActivePage = ts_processos
    Align = alClient
    TabOrder = 2
    OnChange = pgctrl_recebChange
    OnChanging = pgctrl_recebChanging
    object ts_processos: TTabSheet
      Caption = 'Processos'
      object dbg_processo: TDBGrid
        Left = 5
        Top = 4
        Width = 540
        Height = 325
        DataSource = datm_recebimento.ds_processo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Calc_Nr_Processo'
            Title.Alignment = taCenter
            Title.Caption = 'Processo'
            Title.Color = clBlack
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_SERVICO'
            Title.Color = clBlack
            Width = 303
            Visible = True
          end>
      end
      object dbg_ref_cli: TDBGrid
        Left = 549
        Top = 4
        Width = 180
        Height = 159
        DataSource = datm_recebimento.ds_ref_cli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_REFERENCIA'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia do Cliente'
            Title.Color = clBlack
            Width = 135
            Visible = True
          end>
      end
    end
    object ts_numerario_pendente: TTabSheet
      Caption = 'Numer'#225'rio Pendente'
      object lbl_processo1: TLabel
        Left = 9
        Top = 9
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
      object lbl_servico1: TLabel
        Left = 105
        Top = 9
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
      object lbl_cliente1: TLabel
        Left = 286
        Top = 9
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
      object dbg_numerario: TDBGrid
        Left = 9
        Top = 54
        Width = 719
        Height = 122
        DataSource = datm_recebimento.ds_solinum
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NR_SOLICITACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Solic.'
            Title.Color = clBlack
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_SOLICITACAO'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_SOLICITADO'
            Title.Alignment = taCenter
            Title.Caption = 'V. Solicitado'
            Title.Color = clBlack
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Title.Alignment = taCenter
            Title.Caption = 'V. Recebido'
            Title.Color = clBlack
            Width = 110
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Status'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 229
            Visible = True
          end>
      end
      object dbg_numerario_item: TDBGrid
        Left = 9
        Top = 178
        Width = 720
        Height = 152
        DataSource = datm_recebimento.ds_itens_solinum
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnEnter = dbg_numerario_itemEnter
        OnExit = dbg_numerario_itemExit
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_NM_ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'Item'
            Title.Color = clBlack
            Width = 207
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_SOLICITADO'
            Title.Alignment = taCenter
            Title.Caption = 'V. Solicitado'
            Title.Color = clBlack
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Title.Alignment = taCenter
            Title.Caption = 'V. Recebido'
            Title.Color = clBlack
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CalcVlSaldo'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 84
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'status'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookTpDestino'
            Title.Caption = 'Tipo Destino'
            Title.Color = clBlack
            Visible = True
          end>
      end
      object dbedt_nr_processo1: TDBEdit
        Left = 10
        Top = 22
        Width = 82
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Calc_Nr_Processo'
        DataSource = datm_recebimento.ds_processo
        TabOrder = 2
      end
      object dbedt_nm_servico1: TDBEdit
        Left = 106
        Top = 22
        Width = 168
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_SERVICO'
        DataSource = datm_recebimento.ds_processo
        TabOrder = 3
      end
      object dbedt_nm_cliente1: TDBEdit
        Left = 287
        Top = 22
        Width = 168
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_EMPRESA'
        DataSource = datm_recebimento.ds_processo
        TabOrder = 4
      end
    end
    object ts_receb: TTabSheet
      Caption = 'Recebimentos'
      object lbl_processo2: TLabel
        Left = 10
        Top = 9
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
      object lbl_servico2: TLabel
        Left = 105
        Top = 9
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
      object lbl_cliente2: TLabel
        Left = 288
        Top = 9
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
      object dbg_receb: TDBGrid
        Left = 10
        Top = 52
        Width = 719
        Height = 104
        DataSource = datm_recebimento.ds_receb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_RECEBIMENTO'
            Title.Caption = 'N'#186
            Title.Color = clBlack
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_RECEBIMENTO'
            Title.Caption = 'Data '
            Title.Color = clBlack
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_NM_BANCO'
            Title.Caption = 'Banco'
            Title.Color = clBlack
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIMENTO'
            Title.Caption = 'V. Recebido'
            Title.Color = clBlack
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_NM_USUARIO'
            Title.Caption = 'Recebedor'
            Title.Color = clBlack
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookCancelado'
            Title.Color = clBlack
            Visible = True
          end>
      end
      object dbg_receb_item: TDBGrid
        Left = 10
        Top = 159
        Width = 719
        Height = 172
        DataSource = datm_recebimento.ds_itens_receb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_SOLICITACAO'
            Title.Caption = 'Numer'#225'rio'
            Title.Color = clBlack
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_NM_ITEM'
            Title.Caption = 'Item'
            Title.Color = clBlack
            Width = 233
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Title.Caption = 'V. Recebido'
            Title.Color = clBlack
            Width = 83
            Visible = True
          end>
      end
      object dbedt_nr_processo2: TDBEdit
        Left = 10
        Top = 22
        Width = 82
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Calc_Nr_Processo'
        DataSource = datm_recebimento.ds_processo
        TabOrder = 2
      end
      object dbedt_nm_servico2: TDBEdit
        Left = 106
        Top = 22
        Width = 168
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_SERVICO'
        DataSource = datm_recebimento.ds_processo
        TabOrder = 3
      end
      object dbedt_nm_cliente2: TDBEdit
        Left = 289
        Top = 22
        Width = 168
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_EMPRESA'
        DataSource = datm_recebimento.ds_processo
        TabOrder = 4
      end
    end
    object ts_distribuicao_receb: TTabSheet
      Caption = 'Distribui'#231#227'o do Recebimento'
      object lbl_processo3: TLabel
        Left = 10
        Top = 8
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
      object lbl_servico3: TLabel
        Left = 98
        Top = 8
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
      object lbl_cliente3: TLabel
        Left = 273
        Top = 8
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
      object pnl_recebimento: TPanel
        Left = 9
        Top = 56
        Width = 716
        Height = 50
        BevelInner = bvLowered
        TabOrder = 0
        OnExit = pnl_recebimentoExit
        object Label3: TLabel
          Left = 161
          Top = 7
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 278
          Top = 7
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_banco: TSpeedButton
          Left = 543
          Top = 19
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
          OnClick = btn_co_bancoClick
        end
        object Label7: TLabel
          Left = 10
          Top = 7
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Receb.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 67
          Top = 7
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_fp: TLabel
          Left = 577
          Top = 7
          Width = 16
          Height = 13
          Alignment = taRightJustify
          Caption = 'FP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_recebimento: TDBEdit
          Left = 161
          Top = 20
          Width = 107
          Height = 21
          DataField = 'VL_RECEBIMENTO'
          DataSource = datm_recebimento.ds_receb
          MaxLength = 14
          TabOrder = 0
          OnChange = dbedt_vl_recebimentoChange
        end
        object dbedt_nm_banco: TDBEdit
          Left = 314
          Top = 20
          Width = 227
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LK_NM_BANCO'
          DataSource = datm_recebimento.ds_receb
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nr_recebimento: TDBEdit
          Left = 10
          Top = 20
          Width = 47
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_RECEBIMENTO'
          DataSource = datm_recebimento.ds_receb
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_dt_recebimento: TDBEdit
          Left = 67
          Top = 20
          Width = 84
          Height = 21
          DataField = 'DT_RECEBIMENTO'
          DataSource = datm_recebimento.ds_receb
          TabOrder = 5
          OnExit = dbedt_dt_recebimentoExit
        end
        object dbedt_nm_fp: TDBEdit
          Left = 577
          Top = 20
          Width = 75
          Height = 21
          DataField = 'NR_FP'
          DataSource = datm_recebimento.ds_receb
          TabOrder = 2
          OnChange = dbedt_cd_bancoChange
          OnExit = dbedt_cd_bancoExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_cd_banco: TDBEdit
          Left = 278
          Top = 20
          Width = 37
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_recebimento.ds_receb
          TabOrder = 1
          OnChange = dbedt_cd_bancoChange
          OnExit = dbedt_cd_bancoExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
      end
      object dbg_recebimento: TDBGrid
        Left = 9
        Top = 112
        Width = 717
        Height = 156
        DataSource = datm_recebimento.ds_itens_receb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDblClick = dbg_recebimentoDblClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NR_SOLICITACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Num.'
            Title.Color = clBlack
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'LK_NM_ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'Item'
            Title.Color = clBlack
            Width = 298
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_SOLICITADO'
            Title.Alignment = taCenter
            Title.Caption = 'V. Solicitado'
            Title.Color = clBlack
            Width = 121
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Title.Alignment = taCenter
            Title.Caption = 'V. Recebido'
            Title.Color = clBlack
            Width = 122
            Visible = True
          end>
      end
      object pnl_item_receb: TPanel
        Left = 9
        Top = 276
        Width = 717
        Height = 50
        BevelInner = bvLowered
        TabOrder = 2
        object Label5: TLabel
          Left = 10
          Top = 7
          Width = 30
          Height = 13
          Caption = 'Num.'
          FocusControl = dbedt_nr_lanc_receb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 58
          Top = 7
          Width = 58
          Height = 13
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 354
          Top = 7
          Width = 73
          Height = 13
          Caption = 'V. Solicitado'
          FocusControl = dbedt_vl_solicitado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 478
          Top = 7
          Width = 71
          Height = 13
          Caption = 'V. Recebido'
          FocusControl = dbedt_vl_recebido_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nr_lanc_receb: TDBEdit
          Left = 10
          Top = 20
          Width = 40
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_LANC_RECEB'
          DataSource = datm_recebimento.ds_itens_receb
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_vl_solicitado: TDBEdit
          Left = 355
          Top = 20
          Width = 111
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_SOLICITADO'
          DataSource = datm_recebimento.ds_itens_receb
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_vl_recebido_item: TDBEdit
          Left = 477
          Top = 20
          Width = 117
          Height = 21
          DataField = 'VL_RECEBIDO'
          DataSource = datm_recebimento.ds_itens_receb
          TabOrder = 2
          OnExit = dbedt_vl_recebido_itemExit
        end
        object dbedt_LK_NM_ITEM: TDBEdit
          Left = 59
          Top = 20
          Width = 286
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LK_NM_ITEM'
          DataSource = datm_recebimento.ds_itens_receb
          ReadOnly = True
          TabOrder = 3
        end
      end
      object dbedt_nr_processo3: TDBEdit
        Left = 10
        Top = 22
        Width = 82
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Calc_Nr_Processo'
        DataSource = datm_recebimento.ds_processo
        TabOrder = 3
      end
      object dbedt_nm_servico3: TDBEdit
        Left = 98
        Top = 22
        Width = 168
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_SERVICO'
        DataSource = datm_recebimento.ds_processo
        TabOrder = 4
      end
      object dbedt_nm_cliente3: TDBEdit
        Left = 273
        Top = 22
        Width = 168
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_EMPRESA'
        DataSource = datm_recebimento.ds_processo
        TabOrder = 5
      end
    end
    object ts_receb_autom: TTabSheet
      Caption = 'Recebimento Autom'#225'tico'
      object Label12: TLabel
        Left = 222
        Top = 16
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 61
        Top = 76
        Width = 219
        Height = 13
        Alignment = taRightJustify
        Caption = 'Solicita'#231#245'es de Itens nos favorecendo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 356
        Top = 76
        Width = 176
        Height = 13
        Alignment = taRightJustify
        Caption = 'Reembolso de despesas pagas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbg_receb_autom_s: TDBGrid
        Left = 62
        Top = 91
        Width = 288
        Height = 219
        DataSource = datm_recebimento.ds_autom_s
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDblClick = dbg_receb_autom_sDblClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_SOLICITACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Title.Color = clBlack
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Calc_NR_PROCESSO'
            Title.Caption = 'Processo'
            Title.Color = clBlack
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_SALDO'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Title.Color = clBlack
            Width = 104
            Visible = True
          end>
      end
      object dbcbox_banco: TDBComboBox
        Left = 222
        Top = 29
        Width = 273
        Height = 21
        DataField = 'NM_BANCO'
        DataSource = datm_recebimento.ds_banco_liberado
        ItemHeight = 13
        ReadOnly = True
        TabOrder = 1
      end
      object dbg_receb_autom_d: TDBGrid
        Left = 357
        Top = 91
        Width = 322
        Height = 219
        DataSource = datm_recebimento.ds_autom_d
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDblClick = dbg_receb_autom_dDblClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_LANCAMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Title.Color = clBlack
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Calc_NR_PROCESSO'
            Title.Caption = 'Processo'
            Title.Color = clBlack
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Caption = 'Item'
            Title.Color = clBlack
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_SALDO'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Title.Color = clBlack
            Width = 98
            Visible = True
          end>
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 560
    Top = 4
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      Hint = ' '
      RadioItem = True
      OnClick = btn_incluirClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      OnClick = btn_CancelarClick
    end
    object mi_saida: TMenuItem
      Caption = 'Sai&r'
      RadioItem = True
      OnClick = btn_sairClick
    end
    object mi_recombinar: TMenuItem
      Caption = '&Recombinar'
      OnClick = mi_recombinarClick
    end
    object mi_prioridade: TMenuItem
      Caption = '&Prioridade'
      OnClick = mi_prioridadeClick
    end
    object mi_baixar: TMenuItem
      Caption = '&Baixar'
      OnClick = mi_baixarClick
    end
    object mi_cancela_recebimento: TMenuItem
      Caption = 'C&ancela Recebimento'
      Enabled = False
      OnClick = btn_cancela_recebimentoClick
    end
    object mi_imprimir: TMenuItem
      Caption = 'Imprimir Reci&bo'
      Enabled = False
      Hint = 'Imprimir Recibo'
      OnClick = btn_imprimirClick
    end
  end
end

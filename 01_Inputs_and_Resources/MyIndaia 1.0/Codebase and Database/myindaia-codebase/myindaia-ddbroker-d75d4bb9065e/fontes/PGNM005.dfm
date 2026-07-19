object frm_devolucao: Tfrm_devolucao
  Left = 133
  Top = 88
  Width = 750
  Height = 550
  Caption = 'Devolu'#231#227'o de Numerario'
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
  object pnl_selecao: TPanel
    Left = 0
    Top = 47
    Width = 742
    Height = 93
    Align = alTop
    TabOrder = 0
    object lbl_cd_cliente: TLabel
      Left = 348
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
    object lbl_nr_processo: TLabel
      Left = 205
      Top = 48
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
    object btn_processo: TSpeedButton
      Left = 307
      Top = 61
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
      OnClick = btn_processoClick
    end
    object Label3: TLabel
      Left = 11
      Top = 48
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
      Left = 164
      Top = 60
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
      OnClick = btn_cd_produtoClick
    end
    object lbl_cd_unid_neg: TLabel
      Left = 11
      Top = 10
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
      Left = 164
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
      OnClick = btn_cd_unid_negClick
    end
    object lbl_cd_servico: TLabel
      Left = 348
      Top = 48
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
    object msk_nr_processo: TMaskEdit
      Left = 205
      Top = 61
      Width = 101
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 18
      ParentFont = False
      TabOrder = 0
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 35
      Top = 61
      Width = 128
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object edt_nm_unid_neg: TEdit
      Left = 35
      Top = 23
      Width = 128
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
    end
    object dbedt_nm_cliente: TDBEdit
      Left = 393
      Top = 22
      Width = 231
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'AP_EMPRESA'
      ReadOnly = True
      TabOrder = 7
    end
    object dbedt_nm_servico: TDBEdit
      Left = 393
      Top = 61
      Width = 231
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'NM_SERVICO'
      ReadOnly = True
      TabOrder = 8
    end
    object msk_cd_produto: TMaskEdit
      Left = 11
      Top = 61
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
      TabOrder = 2
      OnChange = msk_cd_unid_negChange
      OnEnter = msk_cd_produtoEnter
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 11
      Top = 23
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
      OnChange = msk_cd_unid_negChange
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object dbedt_cd_servico: TDBEdit
      Left = 349
      Top = 61
      Width = 45
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CD_SERVICO'
      ReadOnly = True
      TabOrder = 6
    end
    object dbedt_cd_cliente: TDBEdit
      Left = 349
      Top = 22
      Width = 45
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CD_CLIENTE'
      ReadOnly = True
      TabOrder = 5
    end
  end
  object pnl_menu: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 4
      Width = 36
      Height = 39
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
    object btn_sair: TSpeedButton
      Left = 701
      Top = 4
      Width = 36
      Height = 39
      Hint = 'Sair'
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
      Left = 40
      Top = 4
      Width = 36
      Height = 39
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
      Left = 76
      Top = 4
      Width = 36
      Height = 39
      Hint = 'Cancelar Opera'#231#227'o'
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
    object btn_cancela_devolucao: TSpeedButton
      Left = 112
      Top = 4
      Width = 36
      Height = 39
      Hint = 'Cancelar Lan'#231'amento'
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
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancela_devolucaoClick
    end
    object dbnvg: TDBNavigator
      Left = 600
      Top = 12
      Width = 88
      Height = 22
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
    end
  end
  object pgctrl_devolucao: TPageControl
    Left = 0
    Top = 140
    Width = 742
    Height = 364
    ActivePage = ts_recebimento
    Align = alClient
    TabOrder = 2
    OnChanging = pgctrl_devolucaoChanging
    object ts_recebimento: TTabSheet
      Caption = 'Recebimentos'
      object dbg_receb: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 129
        Align = alTop
        DataSource = datm_devolucao.ds_receb
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
            Width = 29
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
            Width = 260
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
        Left = 0
        Top = 129
        Width = 734
        Height = 207
        Align = alClient
        DataSource = datm_devolucao.ds_itens_receb
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
            Width = 207
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Title.Caption = 'V. Recebido'
            Title.Color = clBlack
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_DEVOLUCAO'
            Title.Caption = 'V.Devolvido'
            Title.Color = clBlack
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_UTILIZADO'
            Title.Caption = 'V.Utilizado'
            Title.Color = clBlack
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_VL_DISPONIVEL'
            Title.Caption = 'V.Dispon'#237'vel'
            Title.Color = clBlack
            Width = 79
            Visible = True
          end>
      end
    end
    object ts_devolucoes: TTabSheet
      Caption = 'Devolu'#231#245'es'
      object dbg_devolucao: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 129
        Align = alTop
        DataSource = datm_devolucao.ds_devolucao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
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
            FieldName = 'NR_DEVOLUCAO'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186
            Title.Color = clBlack
            Width = 39
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_DEVOLUCAO'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_DEVOLUCAO'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Look_ap_usuario'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 112
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'look_Cancelado'
            Title.Alignment = taCenter
            Title.Caption = 'Cancelado'
            Title.Color = clBlack
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_CANCELAMENTO'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Look_usuario_Canc'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 106
            Visible = True
          end>
      end
      object dbg_devolucao_item: TDBGrid
        Left = 0
        Top = 129
        Width = 734
        Height = 207
        Align = alClient
        DataSource = datm_devolucao.ds_itens_devol_lista
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NR_LANC_DEVOL'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 37
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Look_nm_item'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 234
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_RECEBIMENTO'
            Title.Caption = 'Receb.'
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
            FieldName = 'VL_DISPONIVEL'
            Title.Caption = 'Valor Dispon'#237'vel'
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
            FieldName = 'VL_DEVOLVIDO'
            Title.Alignment = taCenter
            Title.Caption = 'Valor da Devolu'#231#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
    object ts_distribuicao: TTabSheet
      Caption = 'Distribui'#231#227'o'
      object pnl_devolucao: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 57
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object Label4: TLabel
          Left = 150
          Top = 11
          Width = 88
          Height = 13
          Caption = 'Valor Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 13
          Top = 11
          Width = 38
          Height = 13
          Caption = 'Devol.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 63
          Top = 11
          Width = 28
          Height = 13
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 267
          Top = 11
          Width = 83
          Height = 13
          Caption = 'Valor Utilizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 500
          Top = 11
          Width = 113
          Height = 13
          Caption = 'Valor da Devolu'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 384
          Top = 11
          Width = 98
          Height = 13
          Caption = 'Saldo Dispon'#237'vel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nr_recebimento: TDBEdit
          Left = 13
          Top = 24
          Width = 47
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_DEVOLUCAO'
          DataSource = datm_devolucao.ds_devolucao
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_dt_recebimento: TDBEdit
          Left = 63
          Top = 24
          Width = 84
          Height = 21
          DataField = 'DT_DEVOLUCAO'
          DataSource = datm_devolucao.ds_devolucao
          TabOrder = 1
          OnExit = dbedt_dt_recebimentoExit
        end
        object dbedt_vl_devolucao: TDBEdit
          Left = 500
          Top = 24
          Width = 121
          Height = 21
          DataField = 'VL_DEVOLUCAO'
          DataSource = datm_devolucao.ds_devolucao
          MaxLength = 14
          TabOrder = 2
        end
        object msk_vl_recebido: TMaskEdit
          Left = 150
          Top = 24
          Width = 115
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object msk_vl_utilizado: TMaskEdit
          Left = 267
          Top = 24
          Width = 115
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
        object msk_vl_disponivel: TMaskEdit
          Left = 385
          Top = 24
          Width = 111
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_devol_item: TPanel
        Left = 0
        Top = 280
        Width = 734
        Height = 56
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        object Label6: TLabel
          Left = 12
          Top = 10
          Width = 33
          Height = 13
          Caption = 'Lanc.'
          FocusControl = dbedt_nr_lanc_receb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 56
          Top = 10
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
          Left = 289
          Top = 10
          Width = 98
          Height = 13
          Caption = 'Saldo Dispon'#237'vel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 405
          Top = 10
          Width = 113
          Height = 13
          Caption = 'Valor da Devolu'#231#227'o'
          FocusControl = dbedt_vl_devolucao_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 521
          Top = 10
          Width = 95
          Height = 13
          Caption = 'Tot. Distribui'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nr_lanc_receb: TDBEdit
          Left = 13
          Top = 24
          Width = 40
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_LANC_DEVOL'
          DataSource = datm_devolucao.ds_itens_devolucao
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_vl_devolucao_item: TDBEdit
          Left = 406
          Top = 24
          Width = 113
          Height = 21
          DataField = 'VL_DEVOLVIDO'
          DataSource = datm_devolucao.ds_itens_devolucao
          TabOrder = 1
          OnExit = dbedt_vl_devolucao_itemExit
        end
        object dbedt_LK_NM_ITEM: TDBEdit
          Left = 56
          Top = 24
          Width = 231
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Look_nm_item'
          DataSource = datm_devolucao.ds_itens_devolucao
          ReadOnly = True
          TabOrder = 2
        end
        object msk_tot_distr: TMaskEdit
          Left = 523
          Top = 24
          Width = 104
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_vl_disponivel_item: TDBEdit
          Left = 289
          Top = 24
          Width = 113
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_DISPONIVEL'
          DataSource = datm_devolucao.ds_itens_devol_lista
          ReadOnly = True
          TabOrder = 4
        end
      end
      object dbg_distribuicao: TDBGrid
        Left = 0
        Top = 57
        Width = 734
        Height = 223
        Align = alClient
        DataSource = datm_devolucao.ds_itens_devol_lista
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_distribuicaoDblClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NR_LANC_DEVOL'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 37
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Look_nm_item'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 230
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_RECEBIMENTO'
            Title.Caption = 'Receb.'
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
            FieldName = 'VL_DISPONIVEL'
            Title.Caption = 'Valor Dispon'#237'vel'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_DEVOLVIDO'
            Title.Alignment = taCenter
            Title.Caption = 'Valor da Devolu'#231#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 121
            Visible = True
          end>
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 672
    Top = 60
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      Hint = ' '
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
      OnClick = btn_cancelarClick
    end
    object mi_cancela_devolucao: TMenuItem
      Caption = 'C&ancelar Devolu'#231#227'o'
      Enabled = False
      OnClick = btn_cancela_devolucaoClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end

object frm_termo_pagto: Tfrm_termo_pagto
  Left = 223
  Top = 164
  Width = 750
  Height = 550
  Caption = 'Cadastro de Termo de Pagamento'
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
  object pgctrl_termo_pagto: TPageControl
    Left = 0
    Top = 47
    Width = 742
    Height = 457
    ActivePage = ts_dados_basicos
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_termo_pagtoChange
    OnChanging = pgctrl_termo_pagtoChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbgrd_termo_pagto: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        DataSource = datm_termo_pagto.ds_termo_pagto
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrd_termo_pagtoDblClick
        OnKeyPress = dbgrd_termo_pagtoKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_TERMO_PAGTO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_TERMO_PAGTO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 269
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookAtivo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookExportador'
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
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados B'#225'sicos'
      object pnl_cnt: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_ativo: TLabel
          Left = 472
          Top = 18
          Width = 30
          Height = 13
          Caption = 'Ativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 12
          Top = 16
          Width = 40
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_termo_pagto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 72
          Top = 16
          Width = 58
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = dbedt_nm_termo_pagto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_exportador: TLabel
          Left = 12
          Top = 59
          Width = 62
          Height = 13
          Caption = 'Exportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_exportador: TSpeedButton
          Left = 367
          Top = 74
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
          OnClick = btn_co_exportadorClick
        end
        object lbl_periodicidade: TLabel
          Left = 12
          Top = 101
          Width = 78
          Height = 13
          Caption = 'Periodicidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_indicador: TLabel
          Left = 108
          Top = 101
          Width = 54
          Height = 13
          Caption = 'Indicador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 270
          Top = 101
          Width = 68
          Height = 13
          Caption = 'N'#186' Parcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 12
          Top = 141
          Width = 148
          Height = 13
          Caption = 'Modalidade de Transa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_modalidade_trans: TSpeedButton
          Left = 367
          Top = 156
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
          OnClick = btn_co_modalidade_transClick
        end
        object lbl_enquad_op: TLabel
          Left = 12
          Top = 181
          Width = 89
          Height = 13
          Caption = 'Enquadramento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_enquad_op: TSpeedButton
          Left = 367
          Top = 196
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
          OnClick = btn_co_enquad_opClick
        end
        object dblkpcbox_ativo: TDBLookupComboBox
          Left = 472
          Top = 32
          Width = 52
          Height = 21
          DataField = 'IN_ATIVO'
          DataSource = datm_termo_pagto.ds_termo_pagto
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_termo_pagto.ds_yesno
          TabOrder = 1
          OnClick = dbedt_cd_termo_pagtoChange
          OnExit = dblkpcbox_ativoExit
        end
        object dbedt_cd_termo_pagto: TDBEdit
          Left = 12
          Top = 32
          Width = 48
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_TERMO_PAGTO'
          DataSource = datm_termo_pagto.ds_termo_pagto
          ReadOnly = True
          TabOrder = 9
          OnChange = dbedt_cd_termo_pagtoChange
          OnExit = dbedt_cd_termo_pagtoExit
        end
        object dbedt_nm_termo_pagto: TDBEdit
          Left = 72
          Top = 32
          Width = 364
          Height = 21
          DataField = 'NM_TERMO_PAGTO'
          DataSource = datm_termo_pagto.ds_termo_pagto
          TabOrder = 0
          OnChange = dbedt_cd_termo_pagtoChange
          OnExit = dbedt_nm_termo_pagtoExit
        end
        object dbedt_cd_exportador: TDBEdit
          Left = 12
          Top = 74
          Width = 55
          Height = 21
          DataField = 'CD_EXPORTADOR'
          DataSource = datm_termo_pagto.ds_termo_pagto
          TabOrder = 2
          OnChange = dbedt_cd_termo_pagtoChange
          OnExit = dbedt_cd_exportadorExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_exportador: TDBEdit
          Left = 72
          Top = 74
          Width = 289
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookExportador'
          DataSource = datm_termo_pagto.ds_termo_pagto
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_nr_periodicidade: TDBEdit
          Left = 12
          Top = 116
          Width = 78
          Height = 21
          DataField = 'NR_PERIODICIDADE'
          DataSource = datm_termo_pagto.ds_termo_pagto
          MaxLength = 5
          TabOrder = 3
          OnChange = dbedt_cd_termo_pagtoChange
          OnExit = dbedt_cd_termo_pagtoExit
        end
        object dblckpbox_via_transp: TDBLookupComboBox
          Left = 108
          Top = 116
          Width = 145
          Height = 21
          DataField = 'TP_INDICADOR'
          DataSource = datm_termo_pagto.ds_termo_pagto
          KeyField = 'TP_INDICADOR'
          ListField = 'NM_INDICADOR'
          ListSource = datm_termo_pagto.ds_tp_indicador_periodo
          TabOrder = 4
          OnClick = dbedt_cd_termo_pagtoChange
        end
        object dbedt_nr_parcelas: TDBEdit
          Left = 268
          Top = 116
          Width = 78
          Height = 21
          DataField = 'NR_PARCELAS'
          DataSource = datm_termo_pagto.ds_termo_pagto
          MaxLength = 3
          TabOrder = 5
          OnChange = dbedt_cd_termo_pagtoChange
          OnExit = dbedt_cd_termo_pagtoExit
        end
        object dbedt_cd_modalidade_trans: TDBEdit
          Left = 12
          Top = 156
          Width = 55
          Height = 21
          DataField = 'CD_MODALIDADE_TRANS'
          DataSource = datm_termo_pagto.ds_termo_pagto
          TabOrder = 6
          OnChange = dbedt_cd_termo_pagtoChange
          OnExit = dbedt_cd_modalidade_transExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_modalidade_trans: TDBEdit
          Left = 73
          Top = 156
          Width = 289
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookModalidadeTrans'
          DataSource = datm_termo_pagto.ds_termo_pagto
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_cd_enquad_op: TDBEdit
          Left = 12
          Top = 196
          Width = 55
          Height = 21
          DataField = 'CD_ENQUAD_OP'
          DataSource = datm_termo_pagto.ds_termo_pagto
          TabOrder = 7
          OnChange = dbedt_cd_termo_pagtoChange
          OnExit = dbedt_cd_enquad_opExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_enquad_op: TDBEdit
          Left = 73
          Top = 196
          Width = 289
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookEnquadOp'
          DataSource = datm_termo_pagto.ds_termo_pagto
          ReadOnly = True
          TabOrder = 12
        end
        object pgctrl_desc_termo_pagto: TPageControl
          Left = 12
          Top = 236
          Width = 604
          Height = 143
          ActivePage = ts_termo_port
          TabOrder = 8
          OnChange = dbedt_cd_termo_pagtoChange
          object ts_termo_port: TTabSheet
            Caption = 'Portugu'#234's'
            object dbm_termo_port: TDBMemo
              Left = 0
              Top = 0
              Width = 596
              Height = 115
              Align = alClient
              DataField = 'TX_TERMO_PORT'
              DataSource = datm_termo_pagto.ds_termo_pagto
              TabOrder = 0
              OnChange = dbedt_cd_termo_pagtoChange
            end
          end
          object ts_termo_ingles: TTabSheet
            Caption = 'Ingl'#234's'
            object dbm_termo_ingles: TDBMemo
              Left = 0
              Top = 0
              Width = 596
              Height = 115
              Align = alClient
              DataField = 'TX_TERMO_INGLES'
              DataSource = datm_termo_pagto.ds_termo_pagto
              TabOrder = 0
              OnChange = dbedt_cd_termo_pagtoChange
            end
          end
          object ts_termo_esp: TTabSheet
            Caption = 'Espanhol'
            object dbm_termo_esp: TDBMemo
              Left = 0
              Top = 0
              Width = 596
              Height = 115
              Align = alClient
              DataField = 'TX_TERMO_ESP'
              DataSource = datm_termo_pagto.ds_termo_pagto
              TabOrder = 0
              OnChange = dbedt_cd_termo_pagtoChange
            end
          end
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 38
      Height = 41
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
    object btn_excluir: TSpeedButton
      Left = 119
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Excluir'
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
      OnClick = btn_excluirClick
    end
    object btn_sair: TSpeedButton
      Left = 392
      Top = 4
      Width = 38
      Height = 41
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
      Left = 43
      Top = 4
      Width = 38
      Height = 41
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
      Left = 81
      Top = 4
      Width = 38
      Height = 41
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
    object dbnvg: TDBNavigator
      Left = 228
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_enquad_op.ds_enquad_op
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 431
      Top = 2
      Width = 309
      Height = 43
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 12
        Top = 5
        Width = 56
        Height = 13
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 148
        Top = 5
        Width = 37
        Height = 13
        Caption = 'Ordem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_chave: TEdit
        Left = 12
        Top = 20
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
      end
      object cb_ordem: TComboBox
        Left = 148
        Top = 20
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 546
    Top = 177
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
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Enabled = False
      Hint = ' '
      OnClick = btn_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end

object frm_at_basf: Tfrm_at_basf
  Left = 196
  Top = 146
  Width = 750
  Height = 550
  Caption = 'Lan'#231'amento de Pedidos'
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
    Height = 52
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 38
      Height = 44
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
      Height = 44
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
      Left = 390
      Top = 4
      Width = 38
      Height = 44
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
      Height = 44
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
    object btn_cancelar: TSpeedButton
      Left = 81
      Top = 4
      Width = 38
      Height = 44
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancelarClick
    end
    object btn_imp: TSpeedButton
      Left = 162
      Top = 4
      Width = 38
      Height = 44
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_impClick
    end
    object Shape2: TShape
      Left = 296
      Top = 14
      Width = 83
      Height = 23
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object dbnvg: TDBNavigator
      Left = 298
      Top = 15
      Width = 80
      Height = 21
      DataSource = datm_at_basf.ds_lista
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object pnl_pesquisa: TPanel
      Left = 431
      Top = 2
      Width = 309
      Height = 48
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      object lbl_pesquisa: TLabel
        Left = 10
        Top = 7
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
      object lbl_ordem_pesquisa: TLabel
        Left = 146
        Top = 7
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
        Left = 10
        Top = 20
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
        OnKeyDown = edt_chaveKeyDown
      end
      object cb_ordem: TComboBox
        Left = 146
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
  object pgctrl_at_desp: TPageControl
    Left = 0
    Top = 52
    Width = 742
    Height = 452
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_at_despChange
    OnChanging = pgctrl_at_despChanging
    object ts_lista: TTabSheet
      Caption = '    Lista    '
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 424
        Align = alClient
        Color = clWhite
        DataSource = datm_at_basf.ds_lista
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_PEDIDO'
            Title.Caption = 'Nr. do Pedido'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_AREA'
            Title.Caption = #193'rea'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_TP_AT_BASF'
            Title.Caption = 'Tipo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_VIA_TRANSP'
            Title.Caption = 'Via de Transp.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 89
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DATA_TRANSMISSAO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            Title.Caption = 'Transmiss'#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 76
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DATA_FOLLOWUP'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            Title.Caption = 'FollowUp'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 76
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DATA_REVISAO_FAT'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            Title.Caption = 'Revis'#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 76
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DATA_DEMURRAGE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            Title.Caption = 'Demurrage'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 76
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DATA_CHEC_DOC'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = []
            Title.Caption = 'Checagem'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 76
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '   Dados B'#225'sicos   '
      object pnl_at_basf: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 424
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Shape3: TShape
          Left = 17
          Top = 158
          Width = 701
          Height = 207
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape4: TShape
          Left = 26
          Top = 167
          Width = 683
          Height = 31
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape5: TShape
          Left = 605
          Top = 169
          Width = 102
          Height = 27
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape1: TShape
          Left = 17
          Top = 77
          Width = 701
          Height = 68
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object lbl_cd_despesa: TLabel
          Left = 16
          Top = 25
          Width = 58
          Height = 13
          Caption = 'N'#186' Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_in_ativo: TLabel
          Left = 241
          Top = 93
          Width = 26
          Height = 13
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_area: TLabel
          Left = 33
          Top = 93
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
          Left = 202
          Top = 106
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
          OnClick = btn_co_areaClick
        end
        object Label1: TLabel
          Left = 407
          Top = 93
          Width = 102
          Height = 13
          Caption = 'Via de Transporte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 607
          Top = 170
          Width = 24
          Height = 25
          Hint = 'Incluir'
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
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 632
          Top = 170
          Width = 24
          Height = 25
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
          OnClick = SpeedButton2Click
        end
        object SpeedButton3: TSpeedButton
          Left = 657
          Top = 170
          Width = 24
          Height = 25
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
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton3Click
        end
        object SpeedButton4: TSpeedButton
          Left = 682
          Top = 170
          Width = 24
          Height = 25
          Hint = 'Excluir'
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
          OnClick = SpeedButton4Click
        end
        object Label2: TLabel
          Left = 35
          Top = 178
          Width = 334
          Height = 13
          Caption = 'Listagem de datas registradas para esse n'#250'mero de pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label3: TLabel
          Left = 33
          Top = 176
          Width = 334
          Height = 13
          Caption = 'Listagem de datas registradas para esse n'#250'mero de pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object dbedt_nr_pedido: TDBEdit
          Left = 16
          Top = 39
          Width = 151
          Height = 21
          DataField = 'NR_PEDIDO'
          DataSource = dsPedidoAtual
          TabOrder = 0
          OnChange = dbedt_nr_pedidoChange
        end
        object dblckpbox_tp_at_basf: TDBLookupComboBox
          Left = 242
          Top = 107
          Width = 152
          Height = 21
          DataField = 'TP_AT_BASF'
          DataSource = dsPedidoAtual
          DropDownRows = 15
          KeyField = 'TP_AT_BASF'
          ListField = 'NM_TP_AT_BASF'
          ListSource = datm_at_basf.ds_tp_at_basf
          TabOrder = 2
          OnClick = dbedt_nr_pedidoChange
        end
        object dbedt_nm_area: TEdit
          Left = 67
          Top = 107
          Width = 134
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
        object dblckpbox_via_transp: TDBLookupComboBox
          Left = 407
          Top = 107
          Width = 153
          Height = 21
          DataField = 'CD_VIA_TRANSP'
          DataSource = dsPedidoAtual
          DropDownRows = 8
          KeyField = 'CD_VIA_TRANSP'
          ListField = 'NM_VIA_TRANSP'
          ListSource = datm_at_basf.ds_via_transp
          TabOrder = 3
          OnClick = dbedt_nr_pedidoChange
        end
        object dbedt_cd_area: TDBEdit
          Left = 33
          Top = 107
          Width = 35
          Height = 21
          DataField = 'CD_AREA'
          DataSource = dsPedidoAtual
          TabOrder = 1
          OnChange = btn_co_areaClick
          OnExit = dbedt_cd_areaExit
          OnKeyDown = dbedt_cd_areaKeyDown
        end
        object DBCtrlGrid1: TDBCtrlGrid
          Left = 27
          Top = 199
          Width = 682
          Height = 155
          Color = clInfoBk
          DataSource = dsDatas
          PanelBorder = gbNone
          PanelHeight = 31
          PanelWidth = 666
          ParentColor = False
          TabOrder = 5
          RowCount = 5
          object Shape6: TShape
            Left = 2
            Top = 1
            Width = 661
            Height = 29
            Brush.Style = bsClear
            Pen.Color = clSilver
          end
          object DBText1: TDBText
            Left = 9
            Top = 11
            Width = 528
            Height = 17
            DataField = 'TipoData'
            DataSource = dsDatas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEdit1: TDBEdit
            Left = 540
            Top = 4
            Width = 120
            Height = 23
            AutoSize = False
            BevelInner = bvLowered
            BevelOuter = bvNone
            BevelKind = bkSoft
            Ctl3D = False
            DataField = 'DT_PEDIDO'
            DataSource = dsDatas
            ParentCtl3D = False
            TabOrder = 0
          end
        end
        object pnlDatas: TPanel
          Left = 444
          Top = 197
          Width = 265
          Height = 127
          BevelOuter = bvNone
          BorderWidth = 2
          Color = clBlack
          TabOrder = 6
          Visible = False
          object Panel2: TPanel
            Left = 2
            Top = 2
            Width = 261
            Height = 123
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Shape7: TShape
              Left = 5
              Top = 71
              Width = 251
              Height = 47
              Brush.Style = bsClear
              Pen.Color = clGray
            end
            object Label4: TLabel
              Left = 15
              Top = 88
              Width = 93
              Height = 13
              Caption = 'Data do Pedido:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Shape8: TShape
              Left = 5
              Top = 6
              Width = 251
              Height = 61
              Brush.Style = bsClear
              Pen.Color = clGray
            end
            object RadioButton1: TRadioButton
              Left = 12
              Top = 12
              Width = 134
              Height = 17
              Caption = 'Transmiss'#227'o'
              TabOrder = 0
            end
            object RadioButton2: TRadioButton
              Left = 12
              Top = 27
              Width = 134
              Height = 17
              Caption = 'FollowUp'
              TabOrder = 1
            end
            object RadioButton3: TRadioButton
              Left = 12
              Top = 43
              Width = 134
              Height = 17
              Caption = 'Revis'#227'o de Faturas'
              TabOrder = 2
            end
            object RadioButton4: TRadioButton
              Left = 118
              Top = 12
              Width = 134
              Height = 17
              Caption = 'Demurrage'
              TabOrder = 3
            end
            object RadioButton5: TRadioButton
              Left = 118
              Top = 27
              Width = 134
              Height = 17
              Caption = 'Checagem Documental'
              TabOrder = 4
            end
            object DBDateEdit1: TDBDateEdit
              Left = 111
              Top = 84
              Width = 95
              Height = 22
              DataField = 'DT_PEDIDO'
              DataSource = dsPedidoAtual
              NumGlyphs = 2
              TabOrder = 5
              OnChange = dbedt_nr_pedidoChange
            end
          end
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 228
    Top = 6
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
    object mi_imprimir: TMenuItem
      Caption = 'Im&primir'
      OnClick = btn_impClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
  object dsDatas: TDataSource
    DataSet = qryDatas
    Left = 508
    Top = 204
  end
  object qryDatas: TQuery
    OnCalcFields = qryDatasCalcFields
    DatabaseName = 'DBBROKER'
    DataSource = datm_at_basf.ds_lista
    SQL.Strings = (
      
        'SELECT  NR_PEDIDO, DT_PEDIDO, IN_TRANSMISSAO, IN_FOLLOWUP, IN_RE' +
        'VISAO_FAT, IN_DEMURRAGE, IN_CHEC_DOC'
      'FROM '#9'TAT_BASF'
      'WHERE '#9'NR_PEDIDO = :NR_PEDIDO'
      'ORDER BY DT_PEDIDO')
    Left = 444
    Top = 204
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PEDIDO'
        ParamType = ptUnknown
        Size = 16
      end>
    object qryDatasNR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      Origin = 'DBBROKER.TAT_BASF.NR_PEDIDO'
      FixedChar = True
      Size = 15
    end
    object qryDatasDT_PEDIDO: TDateTimeField
      FieldName = 'DT_PEDIDO'
      Origin = 'DBBROKER.TAT_BASF.DT_PEDIDO'
    end
    object qryDatasTipoData: TStringField
      FieldKind = fkCalculated
      FieldName = 'TipoData'
      Size = 40
      Calculated = True
    end
    object qryDatasIN_TRANSMISSAO: TStringField
      FieldName = 'IN_TRANSMISSAO'
      Origin = 'DBBROKER.TAT_BASF.IN_TRANSMISSAO'
      FixedChar = True
      Size = 1
    end
    object qryDatasIN_FOLLOWUP: TStringField
      FieldName = 'IN_FOLLOWUP'
      Origin = 'DBBROKER.TAT_BASF.IN_FOLLOWUP'
      FixedChar = True
      Size = 1
    end
    object qryDatasIN_REVISAO_FAT: TStringField
      FieldName = 'IN_REVISAO_FAT'
      Origin = 'DBBROKER.TAT_BASF.IN_REVISAO_FAT'
      FixedChar = True
      Size = 1
    end
    object qryDatasIN_DEMURRAGE: TStringField
      FieldName = 'IN_DEMURRAGE'
      Origin = 'DBBROKER.TAT_BASF.IN_DEMURRAGE'
      FixedChar = True
      Size = 1
    end
    object qryDatasIN_CHEC_DOC: TStringField
      FieldName = 'IN_CHEC_DOC'
      Origin = 'DBBROKER.TAT_BASF.IN_CHEC_DOC'
      FixedChar = True
      Size = 1
    end
  end
  object dsPedidoAtual: TDataSource
    DataSet = qryPedidoAtual
    Left = 492
    Top = 308
  end
  object qryPedidoAtual: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = datm_at_basf.ds_lista
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TAT_BASF'
      'WHERE NR_PEDIDO = :NR_PEDIDO')
    Left = 316
    Top = 180
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PEDIDO'
        ParamType = ptUnknown
        Size = 16
      end>
    object qryPedidoAtualNR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      Origin = 'DBBROKER.TAT_BASF.NR_PEDIDO'
      FixedChar = True
      Size = 15
    end
    object qryPedidoAtualCD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'DBBROKER.TAT_BASF.CD_AREA'
      FixedChar = True
      Size = 2
    end
    object qryPedidoAtualTP_AT_BASF: TStringField
      FieldName = 'TP_AT_BASF'
      Origin = 'DBBROKER.TAT_BASF.TP_AT_BASF'
      FixedChar = True
      Size = 1
    end
    object qryPedidoAtualCD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'DBBROKER.TAT_BASF.CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qryPedidoAtualDT_PEDIDO: TDateTimeField
      FieldName = 'DT_PEDIDO'
      Origin = 'DBBROKER.TAT_BASF.DT_PEDIDO'
    end
    object qryPedidoAtualIN_TRANSMISSAO: TStringField
      FieldName = 'IN_TRANSMISSAO'
      Origin = 'DBBROKER.TAT_BASF.IN_TRANSMISSAO'
      FixedChar = True
      Size = 1
    end
    object qryPedidoAtualIN_FOLLOWUP: TStringField
      FieldName = 'IN_FOLLOWUP'
      Origin = 'DBBROKER.TAT_BASF.IN_FOLLOWUP'
      FixedChar = True
      Size = 1
    end
    object qryPedidoAtualVL_TRANSMISSAO: TFloatField
      FieldName = 'VL_TRANSMISSAO'
      Origin = 'DBBROKER.TAT_BASF.VL_TRANSMISSAO'
    end
    object qryPedidoAtualVL_FOLLOWUP: TFloatField
      FieldName = 'VL_FOLLOWUP'
      Origin = 'DBBROKER.TAT_BASF.VL_FOLLOWUP'
    end
    object qryPedidoAtualIN_REVISAO_FAT: TStringField
      FieldName = 'IN_REVISAO_FAT'
      Origin = 'DBBROKER.TAT_BASF.IN_REVISAO_FAT'
      FixedChar = True
      Size = 1
    end
    object qryPedidoAtualIN_DEMURRAGE: TStringField
      FieldName = 'IN_DEMURRAGE'
      Origin = 'DBBROKER.TAT_BASF.IN_DEMURRAGE'
      FixedChar = True
      Size = 1
    end
    object qryPedidoAtualIN_ENT_BASF: TStringField
      FieldName = 'IN_ENT_BASF'
      Origin = 'DBBROKER.TAT_BASF.IN_ENT_BASF'
      FixedChar = True
      Size = 1
    end
    object qryPedidoAtualIN_ENT_BSG: TStringField
      FieldName = 'IN_ENT_BSG'
      Origin = 'DBBROKER.TAT_BASF.IN_ENT_BSG'
      FixedChar = True
      Size = 1
    end
    object qryPedidoAtualIN_CHEC_DOC: TStringField
      FieldName = 'IN_CHEC_DOC'
      Origin = 'DBBROKER.TAT_BASF.IN_CHEC_DOC'
      FixedChar = True
      Size = 1
    end
    object qryPedidoAtualVL_REVISAO_FAT: TFloatField
      FieldName = 'VL_REVISAO_FAT'
      Origin = 'DBBROKER.TAT_BASF.VL_REVISAO_FAT'
    end
    object qryPedidoAtualVL_DEMURRAGE: TFloatField
      FieldName = 'VL_DEMURRAGE'
      Origin = 'DBBROKER.TAT_BASF.VL_DEMURRAGE'
    end
    object qryPedidoAtualVL_ENT_BASF: TFloatField
      FieldName = 'VL_ENT_BASF'
      Origin = 'DBBROKER.TAT_BASF.VL_ENT_BASF'
    end
    object qryPedidoAtualVL_ENT_BSG: TFloatField
      FieldName = 'VL_ENT_BSG'
      Origin = 'DBBROKER.TAT_BASF.VL_ENT_BSG'
    end
    object qryPedidoAtualVL_CHEC_DOC: TFloatField
      FieldName = 'VL_CHEC_DOC'
      Origin = 'DBBROKER.TAT_BASF.VL_CHEC_DOC'
    end
  end
end

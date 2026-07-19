object frm_proposta: Tfrm_proposta
  Left = 98
  Top = 229
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Proposta'
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 51
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      51)
    object shp1: TShape
      Left = 507
      Top = 4
      Width = 234
      Height = 42
      Anchors = [akTop, akRight]
      Pen.Color = clGray
    end
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 3
      Width = 45
      Height = 45
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
      Left = 139
      Top = 3
      Width = 45
      Height = 45
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
      Left = 452
      Top = 3
      Width = 45
      Height = 45
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
      Left = 49
      Top = 3
      Width = 45
      Height = 45
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
      Left = 94
      Top = 3
      Width = 45
      Height = 45
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
    object btn_dupl_proposta: TSpeedButton
      Left = 194
      Top = 3
      Width = 45
      Height = 45
      Hint = 'Duplicar Proposta'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
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
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_dupl_propostaClick
    end
    object btn_imprimir: TSpeedButton
      Left = 239
      Top = 3
      Width = 45
      Height = 45
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
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
    object Label1: TLabel
      Left = 512
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
    object Label2: TLabel
      Left = 625
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
    object Shape1: TShape
      Left = 342
      Top = 11
      Width = 102
      Height = 27
      Anchors = [akTop, akRight]
      Pen.Color = clGray
    end
    object dbnvg: TDBNavigator
      Left = 343
      Top = 12
      Width = 100
      Height = 25
      DataSource = datm_proposta.ds_proposta
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      TabOrder = 0
    end
    object edt_chave: TEdit
      Left = 512
      Top = 20
      Width = 110
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnChange = edt_chaveChange
      OnKeyDown = edt_chaveKeyDown
    end
    object cb_ordem: TComboBox
      Left = 625
      Top = 20
      Width = 112
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
      OnChange = cb_ordemChange
    end
  end
  object pgctrl_proposta: TPageControl
    Left = 0
    Top = 51
    Width = 742
    Height = 445
    ActivePage = ts_dados_basicos
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = pgctrl_propostaChange
    OnChanging = pgctrl_propostaChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 49
        Width = 734
        Height = 376
        Align = alClient
        DataSource = datm_proposta.ds_proposta
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_cadastroDblClick
        OnKeyPress = dbg_cadastroKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_PROPOSTA'
            Title.Caption = 'Proposta'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_EMPRESA'
            Title.Caption = 'C'#243'd.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_EMPRESA'
            Title.Caption = 'Cliente'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 196
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CGC_EMPRESA'
            Title.Caption = 'C.N.P.J.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_status'
            Title.Caption = 'Status'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ABERTURA'
            Title.Caption = 'Abertura'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_VALIDADE'
            Title.Caption = 'Vencimento'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_VENDEDOR'
            Title.Caption = 'Vendedor'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end>
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 49
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object btn_co_unid_neg1: TSpeedButton
          Left = 297
          Top = 19
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
          OnClick = btn_co_unid_neg1Click
        end
        object Label19: TLabel
          Left = 5
          Top = 5
          Width = 98
          Height = 13
          Caption = 'Unidade de Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 348
          Top = 5
          Width = 66
          Height = 13
          Caption = 'Data Abertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label131: TLabel
          Left = 455
          Top = 5
          Width = 82
          Height = 13
          Caption = 'Data Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label132: TLabel
          Left = 570
          Top = 5
          Width = 80
          Height = 13
          Caption = 'Dias de Validade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edt_nm_unid_neg: TEdit
          Left = 35
          Top = 19
          Width = 259
          Height = 21
          TabStop = False
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object msk_cd_unid_neg: TMaskEdit
          Left = 3
          Top = 19
          Width = 33
          Height = 21
          EditMask = '99;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 1
          OnChange = btn_co_unid_neg1Click
          OnExit = msk_cd_unid_negExit
          OnKeyDown = dbedt_cd_empresaKeyDown
        end
        object msk_dt_abertura: TMaskEdit
          Left = 348
          Top = 19
          Width = 67
          Height = 21
          EditMask = '!99/99/9999;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 3
          Text = '  /  /    '
          OnExit = msk_cd_unid_negExit
        end
        object msk_vencto: TMaskEdit
          Left = 455
          Top = 19
          Width = 67
          Height = 21
          EditMask = '!99/99/9999;1;_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 4
          Text = '  /  /    '
          OnExit = msk_cd_unid_negExit
        end
        object msk_dias_vencto: TMaskEdit
          Left = 571
          Top = 18
          Width = 59
          Height = 21
          EditMask = '!9999999;0;_'
          MaxLength = 7
          TabOrder = 0
          OnExit = msk_cd_unid_negExit
        end
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 137
        Align = alTop
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label4: TLabel
          Left = 149
          Top = 44
          Width = 40
          Height = 13
          Caption = 'Abertura'
          FocusControl = dbedt_dt_abertura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 8
          Top = 85
          Width = 32
          Height = 13
          Caption = 'Cliente'
          FocusControl = dbedt_cd_empresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btn_co_cd_empresa2: TSpeedButton
          Left = 683
          Top = 99
          Width = 25
          Height = 21
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
            BB0BBBBBBBBBBBBBBF7FBBBBBBBBBBBBB000BBBBBBBBBBBBF777BBBBBBBBBBBB
            000BBBBBBBBBBBBF777BBBBBBBBBBBB000BBBBBBBBBBBBF777BBBBBBBBBBBB00
            0BBBBBBBBFFFBF777BBBBBB70007BB70BBBBBBBF7773F777BBBBBB07777700BB
            BBBBBB778887777BBBBBB07FFFFF70BBBBBBB7F8888887FBBBBB77FFFFFFF77B
            BBBBB7888888873FBBBB07FFFFFFF70BBBBB7F888888887FBBBB07FFFFFFF70B
            BBBB7F888888887FBBBB07FFFFFFF70BBBBB73F88888887BBBBB77FFFFFFF77B
            BBBBB7F8888887FBBBBBB07FFFFF70BBBBBBB73FF888F7BBBBBBBB0777770BBB
            BBBBBB773FF77BBBBBBBBBB70007BBBBBBBBBBBB777BBBBBBBBB}
          NumGlyphs = 2
          Visible = False
          OnClick = btn_co_cd_empresa2Click
        end
        object Label6: TLabel
          Left = 389
          Top = 44
          Width = 62
          Height = 13
          Caption = 'Respons'#225'vel'
          FocusControl = dbedt_nm_responsavel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 8
          Top = 4
          Width = 98
          Height = 13
          Caption = 'Unidade de Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 381
          Top = 4
          Width = 75
          Height = 13
          Caption = 'Status Proposta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btn_co_cd_empresa: TSpeedButton
          Left = 658
          Top = 99
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
          OnClick = btn_co_cd_empresaClick
        end
        object btn_co_cd_unid_neg: TSpeedButton
          Left = 333
          Top = 18
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
          OnClick = btn_co_cd_unid_negClick
        end
        object Label7: TLabel
          Left = 8
          Top = 44
          Width = 59
          Height = 13
          Caption = 'Nr. Proposta'
          FocusControl = dbedt_nr_proposta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 580
          Top = 2
          Width = 56
          Height = 13
          Caption = 'Data Status'
          FocusControl = dbedt_nm_responsavel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 251
          Top = 44
          Width = 41
          Height = 13
          Caption = 'Validade'
          FocusControl = dbedt_nm_responsavel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbedt_dt_abertura: TDBEdit
          Left = 149
          Top = 58
          Width = 96
          Height = 21
          Color = clMenu
          DataField = 'DT_ABERTURA'
          DataSource = datm_proposta.ds_proposta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_cd_empresa: TDBEdit
          Left = 9
          Top = 99
          Width = 44
          Height = 21
          DataField = 'CD_EMPRESA'
          DataSource = datm_proposta.ds_proposta
          TabOrder = 8
          OnChange = dbedt_cd_empresaChange
          OnExit = dbedt_cd_empresaExit
          OnKeyDown = dbedt_cd_empresaKeyDown
        end
        object dbedt_nm_empresa: TDBEdit
          Left = 58
          Top = 99
          Width = 599
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_EMPRESA'
          DataSource = datm_proposta.ds_proposta
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 48
          Top = 18
          Width = 281
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_UNID_NEG'
          DataSource = datm_proposta.ds_proposta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 8
          Top = 18
          Width = 38
          Height = 21
          DataField = 'CD_UNID_NEG'
          DataSource = datm_proposta.ds_proposta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = dbedt_cd_unid_negChange
          OnExit = dbedt_cd_unid_negExit
          OnKeyDown = dbedt_cd_empresaKeyDown
        end
        object dbedt_nm_responsavel: TDBEdit
          Left = 384
          Top = 58
          Width = 297
          Height = 21
          Color = clMenu
          DataField = 'NM_RESPONSAVEL'
          DataSource = datm_proposta.ds_proposta
          ReadOnly = True
          TabOrder = 7
          OnChange = dbedt_cd_unid_negChange
        end
        object dbedt_nr_proposta: TDBEdit
          Left = 8
          Top = 58
          Width = 126
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_PROPOSTA'
          DataSource = datm_proposta.ds_proposta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_cd_unid_negChange
        end
        object rxdbde_dt_validade: TDBDateEdit
          Left = 251
          Top = 58
          Width = 109
          Height = 21
          DataField = 'DT_VALIDADE'
          DataSource = datm_proposta.ds_proposta
          NumGlyphs = 2
          TabOrder = 6
          YearDigits = dyFour
          OnChange = dbedt_cd_unid_negChange
        end
        object dbcbx_cd_status: TRxDBComboBox
          Left = 383
          Top = 18
          Width = 136
          Height = 21
          Style = csDropDownList
          DataField = 'CD_STATUS'
          DataSource = datm_proposta.ds_proposta
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Aprovado'
            'Aguardando Aprova'#231#227'o'
            'Cancelada'
            'Rejeitada')
          TabOrder = 3
          Values.Strings = (
            '0'
            '1'
            '2'
            '3')
          OnChange = dbcbx_cd_statusChange
        end
        object DBEdit1: TDBEdit
          Left = 578
          Top = 17
          Width = 103
          Height = 21
          Color = clMenu
          DataField = 'DT_STATUS'
          DataSource = datm_proposta.ds_proposta
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 137
        Width = 734
        Height = 280
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        Caption = 'Panel1'
        TabOrder = 1
        object Label8: TLabel
          Left = 2
          Top = 2
          Width = 730
          Height = 13
          Align = alTop
          Caption = 'Observa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbmemo_obs: TDBMemo
          Left = 2
          Top = 15
          Width = 730
          Height = 263
          Align = alClient
          DataField = 'TX_OBS'
          DataSource = datm_proposta.ds_proposta
          ScrollBars = ssVertical
          TabOrder = 0
          OnChange = dbedt_cd_unid_negChange
        end
      end
    end
    object ts_itens_proposta: TTabSheet
      Caption = 'Itens da Proposta'
      ImageIndex = 2
      object pgctrl_itens_proposta: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 417
        ActivePage = ts_lista_itens_proposta
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_propostaChange
        OnChanging = pgctrl_propostaChanging
        object ts_lista_itens_proposta: TTabSheet
          Caption = 'Lista'
          object Label30: TLabel
            Left = 0
            Top = 44
            Width = 101
            Height = 13
            Align = alTop
            Caption = 'Itens da Proposta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbg_cadastro_itens_proposta: TDBGrid
            Left = 0
            Top = 57
            Width = 726
            Height = 340
            Align = alClient
            DataSource = datm_proposta.ds_proposta_item
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NR_PROPOSTA'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CD_SERVICO'
                Title.Caption = 'C'#243'd'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 29
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_SERVICO'
                Title.Caption = 'Servi'#231'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 226
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_UNID_NEG'
                Title.Caption = 'C'#243'd'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_UNID_NEG'
                Title.Caption = 'Unidade de Neg'#243'cio'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 173
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_VIA_TRANSP'
                Title.Caption = 'C'#243'd.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_VIA_TRANSP'
                Title.Caption = 'Via de Transporte'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 146
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_ITEM_PROPOSTA'
                Title.Caption = 'Seq.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 36
                Visible = True
              end>
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 44
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label27: TLabel
              Left = 2
              Top = 4
              Width = 59
              Height = 13
              Caption = 'Nr. Proposta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label32: TLabel
              Left = 151
              Top = 4
              Width = 98
              Height = 13
              Caption = 'Unidade de Neg'#243'cio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label85: TLabel
              Left = 418
              Top = 4
              Width = 32
              Height = 13
              Caption = 'Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dbedt_nr_proposta_itprop0: TDBEdit
              Left = 2
              Top = 19
              Width = 103
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NR_PROPOSTA'
              DataSource = datm_proposta.ds_proposta
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object dbedt_nm_unid_neg_itprop0: TDBEdit
              Left = 180
              Top = 19
              Width = 197
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_UNID_NEG'
              DataSource = datm_proposta.ds_proposta
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_cd_unid_neg_itprop0: TDBEdit
              Left = 150
              Top = 19
              Width = 27
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_UNID_NEG'
              DataSource = datm_proposta.ds_proposta
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              OnChange = dbedt_cd_unid_negChange
              OnExit = dbedt_cd_unid_negExit
              OnKeyDown = dbedt_cd_empresaKeyDown
            end
            object DBEdit25: TDBEdit
              Left = 418
              Top = 19
              Width = 263
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_EMPRESA'
              DataSource = datm_proposta.ds_proposta
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
        object ts_dados_basicos_itens_proposta: TTabSheet
          Caption = 'Dados B'#225'sicos'
          ImageIndex = 1
          object pnl_entrada_de_dados2: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 389
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 0
            object shp2: TShape
              Left = 25
              Top = 161
              Width = 401
              Height = 225
              Brush.Style = bsClear
              Pen.Color = clGray
            end
            object btn_co_cd_unid_neg_itprop: TSpeedButton
              Left = 387
              Top = 184
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
              OnClick = btn_co_cd_unid_neg_itpropClick
            end
            object btn_co_cd_servico: TSpeedButton
              Left = 387
              Top = 265
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
              OnClick = btn_co_cd_servicoClick
            end
            object Label15: TLabel
              Left = 40
              Top = 295
              Width = 84
              Height = 13
              Caption = 'Via de Transporte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label16: TLabel
              Left = 40
              Top = 167
              Width = 211
              Height = 13
              Caption = 'Unidade de Neg'#243'cio Realizadora do Servi'#231'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label17: TLabel
              Left = 40
              Top = 248
              Width = 36
              Height = 13
              Caption = 'Servi'#231'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label40: TLabel
              Left = 18
              Top = 144
              Width = 101
              Height = 13
              Caption = 'Itens da Proposta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_via_transp: TSpeedButton
              Left = 387
              Top = 314
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
              Visible = False
              OnClick = btn_co_via_transpClick
            end
            object btn_co_produto: TSpeedButton
              Left = 388
              Top = 225
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
            object Label81: TLabel
              Left = 41
              Top = 208
              Width = 37
              Height = 13
              Caption = 'Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label9: TLabel
              Left = 42
              Top = 337
              Width = 41
              Height = 13
              Caption = 'Incoterm'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label18: TLabel
              Left = 11
              Top = 4
              Width = 59
              Height = 13
              Caption = 'Nr. Proposta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label29: TLabel
              Left = 11
              Top = 44
              Width = 98
              Height = 13
              Caption = 'Unidade de Neg'#243'cio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label92: TLabel
              Left = 11
              Top = 86
              Width = 32
              Height = 13
              Caption = 'Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Shape2: TShape
              Left = 12
              Top = 141
              Width = 382
              Height = 21
              Brush.Style = bsClear
              Pen.Color = clGray
            end
            object dbedt_cd_unid_neg_itprop: TDBEdit
              Left = 40
              Top = 184
              Width = 38
              Height = 21
              DataField = 'CD_UNID_NEG'
              DataSource = datm_proposta.ds_proposta_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnChange = dbedt_cd_unid_neg_itpropChange
              OnExit = dbedt_cd_unid_neg_itpropExit
              OnKeyDown = dbedt_cd_empresaKeyDown
            end
            object dbedt_nm_unid_neg_itprop: TDBEdit
              Left = 80
              Top = 184
              Width = 305
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_UNID_NEG'
              DataSource = datm_proposta.ds_proposta_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
            object dbedt_cd_servico: TDBEdit
              Left = 40
              Top = 265
              Width = 38
              Height = 21
              DataField = 'CD_SERVICO'
              DataSource = datm_proposta.ds_proposta_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              OnChange = dbedt_cd_servicoChange
              OnExit = dbedt_cd_servicoExit
              OnKeyDown = dbedt_cd_empresaKeyDown
            end
            object dbedt_nm_servico: TDBEdit
              Left = 80
              Top = 265
              Width = 305
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_SERVICO'
              DataSource = datm_proposta.ds_proposta_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 9
            end
            object dbedt_nm_via_transp: TDBEdit
              Left = 82
              Top = 313
              Width = 302
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_VIA_TRANSP'
              DataSource = datm_proposta.ds_proposta_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 11
            end
            object dbedt_cd_via_transp: TDBEdit
              Left = 40
              Top = 312
              Width = 38
              Height = 21
              Color = clMenu
              DataField = 'CD_VIA_TRANSP'
              DataSource = datm_proposta.ds_proposta_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 10
              OnChange = dbedt_cd_via_transpChange
              OnKeyDown = dbedt_cd_empresaKeyDown
            end
            object dbedt_nm_produto: TDBEdit
              Left = 81
              Top = 225
              Width = 305
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_PRODUTO'
              DataSource = datm_proposta.ds_proposta_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
            end
            object dbedt_cd_produto: TDBEdit
              Left = 41
              Top = 225
              Width = 38
              Height = 21
              DataField = 'CD_PRODUTO'
              DataSource = datm_proposta.ds_proposta_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              OnChange = dbedt_cd_produtoChange
              OnExit = dbedt_cd_produtoExit
              OnKeyDown = dbedt_cd_empresaKeyDown
            end
            object dblkp_cd_incoterms: TDBLookupComboBox
              Left = 42
              Top = 351
              Width = 345
              Height = 21
              DataField = 'Look_nm_incoterm'
              DataSource = datm_proposta.ds_proposta_item
              ListField = 'DESCRICAO'
              TabOrder = 12
              OnClick = dbedt_cd_unid_neg_itpropChange
            end
            object DBEdit34: TDBEdit
              Left = 11
              Top = 19
              Width = 103
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NR_PROPOSTA'
              DataSource = datm_proposta.ds_proposta
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit36: TDBEdit
              Left = 40
              Top = 59
              Width = 353
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_UNID_NEG'
              DataSource = datm_proposta.ds_proposta
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit37: TDBEdit
              Left = 10
              Top = 59
              Width = 29
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_UNID_NEG'
              DataSource = datm_proposta.ds_proposta
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              OnChange = dbedt_cd_unid_negChange
              OnExit = dbedt_cd_unid_negExit
              OnKeyDown = dbedt_cd_empresaKeyDown
            end
            object DBEdit38: TDBEdit
              Left = 11
              Top = 101
              Width = 382
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_EMPRESA'
              DataSource = datm_proposta.ds_proposta
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
        object ts_fretes: TTabSheet
          Caption = 'Fretes'
          ImageIndex = 5
          object pgctrl_fretes: TPageControl
            Left = 0
            Top = 0
            Width = 726
            Height = 389
            ActivePage = ts_fretes_dados_basicos
            Align = alClient
            TabOrder = 0
            OnChange = pgctrl_propostaChange
            OnChanging = pgctrl_propostaChanging
            object ts_fretes_lista: TTabSheet
              Caption = 'Lista'
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 718
                Height = 369
                Align = alClient
                Alignment = taLeftJustify
                BevelInner = bvLowered
                TabOrder = 0
                object bvl3: TBevel
                  Left = 2
                  Top = 2
                  Width = 714
                  Height = 111
                  Align = alTop
                  Shape = bsSpacer
                end
                object Label41: TLabel
                  Left = 5
                  Top = 96
                  Width = 108
                  Height = 13
                  Caption = 'Fretes da Proposta'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label33: TLabel
                  Left = 251
                  Top = 3
                  Width = 112
                  Height = 13
                  AutoSize = False
                  Caption = 'Nr. Proposta'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label34: TLabel
                  Left = 5
                  Top = 39
                  Width = 181
                  Height = 13
                  Caption = 'Unid. Neg'#243'cio Realizadora do Servi'#231'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label35: TLabel
                  Left = 5
                  Top = 3
                  Width = 36
                  Height = 13
                  Caption = 'Servi'#231'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object dbg_fretes: TDBGrid
                  Left = 2
                  Top = 113
                  Width = 714
                  Height = 254
                  Align = alClient
                  DataSource = datm_proposta.ds_proposta_frete
                  Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
                  ReadOnly = True
                  TabOrder = 5
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'NR_PROPOSTA'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'CD_TAB_FRETE'
                      Title.Caption = 'C'#243'd. '
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DESC_TAB_FRETE'
                      Title.Caption = 'Nome da Tabela'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 149
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NM_PORTO1'
                      Title.Caption = 'Origem'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 151
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NM_PORTO2'
                      Title.Caption = 'Destino'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 210
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NM_AGENTE'
                      Title.Caption = 'Agente'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 150
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DESCRICAO_1'
                      Title.Caption = 'Companhia A'#233'rea'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 135
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NM_ARMADOR'
                      Title.Caption = 'Armador'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 64
                      Visible = True
                    end>
                end
                object dbedt_nr_proposta1: TDBEdit
                  Left = 251
                  Top = 17
                  Width = 125
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NR_PROPOSTA'
                  DataSource = datm_proposta.ds_proposta
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
                object dbedt_cd_unid_neg1: TDBEdit
                  Left = 6
                  Top = 53
                  Width = 30
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'CD_UNID_NEG'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                  OnChange = dbedt_cd_unid_neg_itpropChange
                  OnExit = dbedt_cd_unid_neg_itpropExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object dbedt_nm_unid_neg1: TDBEdit
                  Left = 37
                  Top = 53
                  Width = 204
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_UNID_NEG'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object dbedt_cd_servico1: TDBEdit
                  Left = 5
                  Top = 17
                  Width = 29
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'CD_SERVICO'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  OnChange = dbedt_cd_unid_neg_itpropChange
                  OnExit = dbedt_cd_servicoExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object dbedt_nm_servico1: TDBEdit
                  Left = 36
                  Top = 17
                  Width = 205
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_SERVICO'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
              end
            end
            object ts_fretes_dados_basicos: TTabSheet
              Caption = 'Dados B'#225'sicos'
              ImageIndex = 1
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 718
                Height = 361
                Align = alClient
                Alignment = taLeftJustify
                BevelInner = bvLowered
                TabOrder = 0
                object Label3: TLabel
                  Left = 8
                  Top = 5
                  Width = 33
                  Height = 13
                  Caption = 'Origem'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label11: TLabel
                  Left = 8
                  Top = 41
                  Width = 36
                  Height = 13
                  Caption = 'Destino'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object btn_co_origem: TSpeedButton
                  Left = 315
                  Top = 19
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
                  OnClick = btn_co_origemClick
                end
                object btn_co_destino: TSpeedButton
                  Left = 316
                  Top = 55
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
                  OnClick = btn_co_destinoClick
                end
                object btn_co_tab_frete: TSpeedButton
                  Left = 316
                  Top = 91
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
                  OnClick = btn_co_tab_freteClick
                end
                object Label12: TLabel
                  Left = 8
                  Top = 77
                  Width = 75
                  Height = 13
                  Caption = 'Tabela de Frete'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label21: TLabel
                  Left = 8
                  Top = 114
                  Width = 34
                  Height = 13
                  Caption = 'Agente'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lc_cia_arm: TLabel
                  Left = 8
                  Top = 151
                  Width = 53
                  Height = 13
                  Caption = 'Companhia'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label28: TLabel
                  Left = 8
                  Top = 191
                  Width = 33
                  Height = 13
                  Caption = 'Moeda'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label25: TLabel
                  Left = 8
                  Top = 232
                  Width = 67
                  Height = 13
                  Caption = 'Tipo de Carga'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object dbedt_cd_origem: TDBEdit
                  Left = 8
                  Top = 19
                  Width = 45
                  Height = 21
                  DataField = 'CD_ORIGEM'
                  DataSource = datm_proposta.ds_proposta_frete
                  TabOrder = 0
                  OnChange = dbedt_cd_origemChange
                  OnExit = dbedt_cd_origemExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object dbedt_nm_origem: TDBEdit
                  Left = 53
                  Top = 19
                  Width = 260
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_PORTO1'
                  DataSource = datm_proposta.ds_proposta_frete
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                  OnClick = btn_co_produtoClick
                end
                object dbedt_nm_destino: TDBEdit
                  Left = 53
                  Top = 55
                  Width = 260
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_PORTO2'
                  DataSource = datm_proposta.ds_proposta_frete
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                end
                object dbedt_cd_destino: TDBEdit
                  Left = 8
                  Top = 55
                  Width = 45
                  Height = 21
                  DataField = 'CD_DESTINO'
                  DataSource = datm_proposta.ds_proposta_frete
                  TabOrder = 1
                  OnChange = dbedt_cd_origemChange
                  OnExit = dbedt_cd_destinoExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object dbedt_cd_tab_frete: TDBEdit
                  Left = 8
                  Top = 91
                  Width = 45
                  Height = 21
                  DataField = 'CD_TAB_FRETE'
                  DataSource = datm_proposta.ds_proposta_frete
                  TabOrder = 4
                  OnChange = dbedt_cd_origemChange
                  OnExit = dbedt_cd_tab_freteExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object dbedt_desc_tab_frete: TDBEdit
                  Left = 53
                  Top = 91
                  Width = 260
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'DESC_TAB_FRETE'
                  DataSource = datm_proposta.ds_proposta_frete
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 5
                end
                object DBEdit3: TDBEdit
                  Left = 8
                  Top = 128
                  Width = 45
                  Height = 21
                  Color = clMenu
                  DataField = 'CD_AGENTE'
                  DataSource = datm_proposta.ds_proposta_frete
                  ReadOnly = True
                  TabOrder = 6
                  OnChange = dbedt_cd_origemChange
                  OnExit = dbedt_cd_tab_freteExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object DBEdit5: TDBEdit
                  Left = 53
                  Top = 128
                  Width = 260
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_AGENTE'
                  DataSource = datm_proposta.ds_proposta_frete
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 7
                end
                object dbedt_cd_cia: TDBEdit
                  Left = 8
                  Top = 167
                  Width = 41
                  Height = 21
                  Color = clMenu
                  DataField = 'CD_CIA_TRANSP'
                  DataSource = datm_proposta.ds_proposta_frete
                  ReadOnly = True
                  TabOrder = 10
                  OnChange = dbedt_cd_origemChange
                  OnExit = dbedt_cd_tab_freteExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object dbedt_nm_cia: TDBEdit
                  Left = 53
                  Top = 165
                  Width = 260
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'DESCRICAO'
                  DataSource = datm_proposta.ds_proposta_frete
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 13
                end
                object DBEdit8: TDBEdit
                  Left = 8
                  Top = 205
                  Width = 45
                  Height = 21
                  Color = clMenu
                  DataField = 'CD_MOEDA'
                  DataSource = datm_proposta.ds_proposta_frete
                  ReadOnly = True
                  TabOrder = 8
                  OnChange = dbedt_cd_origemChange
                  OnExit = dbedt_cd_tab_freteExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object DBEdit9: TDBEdit
                  Left = 53
                  Top = 205
                  Width = 260
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_MOEDA'
                  DataSource = datm_proposta.ds_proposta_frete
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 11
                end
                object dbedt_cd_armador: TDBEdit
                  Left = 8
                  Top = 165
                  Width = 45
                  Height = 21
                  Color = clMenu
                  DataField = 'CD_ARMADOR'
                  DataSource = datm_proposta.ds_proposta_frete
                  ReadOnly = True
                  TabOrder = 9
                  OnChange = dbedt_cd_origemChange
                  OnExit = dbedt_cd_tab_freteExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object dbedt_nm_armador: TDBEdit
                  Left = 53
                  Top = 165
                  Width = 260
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_ARMADOR'
                  DataSource = datm_proposta.ds_proposta_frete
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 12
                end
                object rxcombx_tp_carga_cia: TRxDBComboBox
                  Left = 8
                  Top = 246
                  Width = 129
                  Height = 21
                  Style = csDropDownList
                  Color = clMenu
                  DataField = 'TP_CARGA'
                  DataSource = datm_proposta.ds_proposta_frete
                  Enabled = False
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Normal'
                    'Perigosa'
                    'Perec'#237'vel'
                    'Animal Vivo'
                    'Outros'
                    'Todos')
                  ReadOnly = True
                  TabOrder = 14
                  Values.Strings = (
                    '0'
                    '1'
                    '2'
                    '3'
                    '4'
                    '5')
                end
              end
            end
            object ts_tarifa_aerea: TTabSheet
              Caption = 'Tarifas/Receitas'
              ImageIndex = 2
              object Label26: TLabel
                Left = 0
                Top = 159
                Width = 51
                Height = 13
                Align = alTop
                Caption = 'Receitas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label42: TLabel
                Left = 0
                Top = 0
                Width = 40
                Height = 13
                Align = alTop
                Caption = 'Tarifas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object bvl4: TBevel
                Left = 0
                Top = 150
                Width = 718
                Height = 9
                Align = alTop
                Shape = bsSpacer
              end
              object dbgrid_tarifa_aerea: TDBGrid
                Left = 0
                Top = 13
                Width = 718
                Height = 137
                Align = alTop
                DataSource = datm_proposta.ds_prop_frete_item
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'TTIPO_SIMBOLO_TAB_FRETE'
                    ReadOnly = True
                    Title.Caption = 'Simbolo'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 58
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PESO_TAB_FRETE'
                    Title.Caption = 'Peso (Kg)'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 82
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VL_COMPRA_TAB_FRETE'
                    ReadOnly = True
                    Title.Caption = 'Valor Compra'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 98
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VL_VENDA_MINIMA'
                    ReadOnly = True
                    Title.Caption = 'Venda M'#237'nima'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 108
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VL_VENDA_TAB_FRETE'
                    Title.Caption = 'Valor Venda'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 89
                    Visible = True
                  end>
              end
              object dbgrid_receita_aerea: TDBGrid
                Left = 0
                Top = 172
                Width = 718
                Height = 197
                Hint = 
                  '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em Azul abrem consulta' +
                  's OnLine'#13#10'*Ctrl + Delete exclui registro selecionado'
                Align = alClient
                DataSource = datm_proposta.ds_prop_frete_desp
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDblClick = dbgrid_receita_aereaDblClick
                OnEnter = dbgrid_receita_aereaEnter
                OnKeyDown = dbgrid_receita_aereaKeyDown
                OnKeyUp = dbgrid_receita_aereaKeyUp
                Columns = <
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'CD_ITEM'
                    Title.Caption = 'C'#243'd.'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end
                  item
                    Color = 16776176
                    Expanded = False
                    FieldName = 'calcItem'
                    Title.Caption = 'Descri'#231#227'o'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 107
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'CD_MOEDA'
                    Title.Caption = 'C'#243'd.'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 32
                    Visible = True
                  end
                  item
                    Color = 16776176
                    Expanded = False
                    FieldName = 'calcMoeda'
                    Title.Caption = 'Moeda'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 180
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'Look_nm_tp_calc'
                    Title.Caption = 'Tipo Base'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 100
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'VL_INTERVALO_INICIAL'
                    Title.Caption = 'Valor Inicial'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Visible = False
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'VL_INTERVALO_FINAL'
                    Title.Caption = 'Valor Final'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'VL_BASE_AG'
                    ReadOnly = True
                    Title.Caption = 'Compra'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 51
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'VL_VENDA'
                    ReadOnly = True
                    Title.Caption = 'Venda'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 46
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'Look_origem'
                    Title.Caption = 'Origem'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 57
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'Look_in_mencionado'
                    Title.Caption = 'Mencionado no House/Awb'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 171
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'Look_profit'
                    Title.Caption = 'Profit'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 52
                    Visible = True
                  end>
              end
            end
            object ts_tarifas_maritima: TTabSheet
              Caption = 'Tarifas/ Receitas'
              ImageIndex = 3
              object pgctrl_maritima: TPageControl
                Left = 0
                Top = 0
                Width = 718
                Height = 361
                ActivePage = ts_fcl
                Align = alClient
                TabOrder = 0
                OnChange = pgctrl_maritimaChange
                object ts_lcl: TTabSheet
                  Caption = 'LCL'
                  object Label43: TLabel
                    Left = 0
                    Top = 0
                    Width = 138
                    Height = 13
                    Align = alTop
                    Caption = 'Tarifas LCL/ Break Bulk'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label45: TLabel
                    Left = 0
                    Top = 154
                    Width = 149
                    Height = 13
                    Align = alTop
                    Caption = 'Receitas LCL/ Break Bulk'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object bvl1: TBevel
                    Left = 0
                    Top = 145
                    Width = 710
                    Height = 9
                    Align = alTop
                    Shape = bsSpacer
                  end
                  object dbgrid_tarifas_LCL: TDBGrid
                    Left = 0
                    Top = 13
                    Width = 710
                    Height = 132
                    Align = alTop
                    DataSource = datm_proposta.ds_prop_frete_item
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = []
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'calc_tp_simb_maritimo'
                        ReadOnly = True
                        Title.Caption = 'Tarifa'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 83
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VL_COMPRA_TAB_FRETE'
                        ReadOnly = True
                        Title.Caption = 'Compra'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 99
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VL_VENDA_MINIMA'
                        ReadOnly = True
                        Title.Caption = 'Venda Min.'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 144
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VL_VENDA_TAB_FRETE'
                        Title.Caption = 'Venda'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 121
                        Visible = True
                      end>
                  end
                  object dbgrid_despesa_LCL: TDBGrid
                    Left = 0
                    Top = 167
                    Width = 710
                    Height = 174
                    Hint = 
                      '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em Azul abrem consulta' +
                      's OnLine'#13#10'*Ctrl + Delete exclui registro selecionado|*Campos em ' +
                      'amarelo s'#227'o edit'#225'veis'#13#10'*Campos em Azul abrem consultas OnLine'#13#10'*' +
                      'Ctrl + Delete exclui registro selecionado'
                    Align = alClient
                    DataSource = datm_proposta.ds_prop_frete_desp
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = []
                    OnDblClick = dbgrid_receita_aereaDblClick
                    OnEnter = dbgrid_receita_aereaEnter
                    OnKeyDown = dbgrid_receita_aereaKeyDown
                    OnKeyUp = dbgrid_despesa_LCLKeyUp
                    Columns = <
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'CD_ITEM'
                        Title.Caption = 'C'#243'd.'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Visible = True
                      end
                      item
                        Color = 16776176
                        Expanded = False
                        FieldName = 'calcItem'
                        Title.Caption = 'Descri'#231#227'o'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 138
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'CD_MOEDA'
                        Title.Caption = 'C'#243'd.'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 33
                        Visible = True
                      end
                      item
                        Color = 16776176
                        Expanded = False
                        FieldName = 'calcMoeda'
                        Title.Caption = 'Moeda'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 180
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'Look_nm_tp_calc'
                        Title.Caption = 'Tipo Base'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 100
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_INTERVALO_INICIAL'
                        Title.Caption = 'Valor Inicial'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Visible = False
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_INTERVALO_FINAL'
                        Title.Caption = 'Valor Final'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Visible = False
                      end
                      item
                        Expanded = False
                        FieldName = 'VL_BASE_AG'
                        ReadOnly = True
                        Title.Caption = 'Compra'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 60
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_VENDA'
                        Title.Caption = 'Venda'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 62
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'Look_in_mencionado'
                        Title.Caption = 'Mencionado no House/Awb'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 149
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'Look_profit'
                        Title.Caption = 'Profit'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 54
                        Visible = True
                      end>
                  end
                end
                object ts_fcl: TTabSheet
                  Caption = 'FCL'
                  ImageIndex = 1
                  object Label44: TLabel
                    Left = 0
                    Top = 0
                    Width = 66
                    Height = 13
                    Align = alTop
                    Caption = 'Tarifas FCL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label46: TLabel
                    Left = 0
                    Top = 131
                    Width = 77
                    Height = 13
                    Align = alTop
                    Caption = 'Receitas FCL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object bvl2: TBevel
                    Left = 0
                    Top = 122
                    Width = 710
                    Height = 9
                    Align = alTop
                    Shape = bsSpacer
                  end
                  object dbgrid_tarifas_FCL: TDBGrid
                    Left = 0
                    Top = 13
                    Width = 710
                    Height = 109
                    Align = alTop
                    DataSource = datm_proposta.ds_prop_frete_item
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = []
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'VOLUME_TAB_FRETE'
                        Title.Caption = 'C'#243'd.'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 53
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'Look_nm_cntr'
                        Title.Caption = 'Contanier'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 105
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VL_COMPRA_TAB_FRETE'
                        ReadOnly = True
                        Title.Caption = 'Compra'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 101
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VL_VENDA_MINIMA'
                        ReadOnly = True
                        Title.Caption = 'Venda Min.'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 114
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VL_VENDA_TAB_FRETE'
                        Title.Caption = 'Venda'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 130
                        Visible = True
                      end>
                  end
                  object dbgrid_despesa_FCL: TDBGrid
                    Left = 0
                    Top = 144
                    Width = 710
                    Height = 197
                    Hint = 
                      '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em Azul abrem consulta' +
                      's OnLine'#13#10'*Ctrl + Delete exclui registro selecionado'
                    Align = alClient
                    DataSource = datm_proposta.ds_prop_frete_desp
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = []
                    OnDblClick = dbgrid_receita_aereaDblClick
                    OnEnter = dbgrid_receita_aereaEnter
                    OnKeyDown = dbgrid_receita_aereaKeyDown
                    OnKeyUp = dbgrid_despesa_FCLKeyUp
                    Columns = <
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'CD_ITEM'
                        Title.Caption = 'C'#243'd.'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Visible = True
                      end
                      item
                        Color = 16776176
                        Expanded = False
                        FieldName = 'calcItem'
                        Title.Caption = 'Descri'#231#227'o'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 109
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'CD_MOEDA'
                        Title.Caption = 'C'#243'd.'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 33
                        Visible = True
                      end
                      item
                        Color = 16776176
                        Expanded = False
                        FieldName = 'calcMoeda'
                        Title.Caption = 'Moeda'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 180
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'Look_nm_tp_calc'
                        Title.Caption = 'Tipo Base'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 100
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_INTERVALO_INICIAL'
                        Title.Caption = 'Valor Inicial'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Visible = False
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_INTERVALO_FINAL'
                        Title.Caption = 'Valor Final'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Visible = False
                      end
                      item
                        Expanded = False
                        FieldName = 'VL_BASE_AG'
                        ReadOnly = True
                        Title.Caption = 'Compra'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'VL_VENDA'
                        Title.Caption = 'Venda'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 49
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'Look_in_mencionado'
                        Title.Caption = 'Mencionado no House/Awb'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 167
                        Visible = True
                      end
                      item
                        Color = 13303807
                        Expanded = False
                        FieldName = 'Look_profit'
                        Title.Caption = 'Profit'
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clBlack
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 45
                        Visible = True
                      end>
                  end
                end
              end
            end
          end
        end
        object ts_desembaraco: TTabSheet
          Caption = 'Desembara'#231'o'
          ImageIndex = 3
          object pgctrl_desembaraco: TPageControl
            Left = 0
            Top = 0
            Width = 726
            Height = 389
            ActivePage = ts_receita_imp
            Align = alClient
            TabOrder = 0
            OnChange = pgctrl_propostaChange
            OnChanging = pgctrl_propostaChanging
            object ts_lista_desembaraco: TTabSheet
              Caption = 'Lista'
              object DBGrid2: TDBGrid
                Left = 0
                Top = 129
                Width = 718
                Height = 240
                Align = alClient
                DataSource = datm_proposta.ds_item_faturamento
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CD_ITEM'
                    Title.Caption = 'C'#243'digo'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 58
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NM_ITEM'
                    Title.Caption = 'Item'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 407
                    Visible = True
                  end>
              end
              object Panel8: TPanel
                Left = 0
                Top = 0
                Width = 718
                Height = 129
                Align = alTop
                BevelInner = bvLowered
                TabOrder = 0
                object Label82: TLabel
                  Left = 190
                  Top = 5
                  Width = 32
                  Height = 13
                  Caption = 'Cliente'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label83: TLabel
                  Left = 7
                  Top = 44
                  Width = 98
                  Height = 13
                  Caption = 'Unidade de Neg'#243'cio'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label84: TLabel
                  Left = 366
                  Top = 43
                  Width = 37
                  Height = 13
                  Caption = 'Produto'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label86: TLabel
                  Left = 10
                  Top = 82
                  Width = 36
                  Height = 13
                  Caption = 'Servi'#231'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label87: TLabel
                  Left = 8
                  Top = 5
                  Width = 59
                  Height = 13
                  Caption = 'Nr. Proposta'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label89: TLabel
                  Left = 366
                  Top = 81
                  Width = 84
                  Height = 13
                  Caption = 'Via de Transporte'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object DBEdit21: TDBEdit
                  Left = 187
                  Top = 18
                  Width = 41
                  Height = 21
                  Color = clMenu
                  DataField = 'CD_EMPRESA'
                  DataSource = datm_proposta.ds_proposta
                  ReadOnly = True
                  TabOrder = 1
                  OnChange = dbedt_cd_unid_negChange
                  OnExit = dbedt_cd_empresaExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object DBEdit22: TDBEdit
                  Left = 230
                  Top = 18
                  Width = 477
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_EMPRESA'
                  DataSource = datm_proposta.ds_proposta
                  ReadOnly = True
                  TabOrder = 2
                end
                object DBEdit23: TDBEdit
                  Left = 10
                  Top = 58
                  Width = 38
                  Height = 21
                  Color = clMenu
                  DataField = 'CD_UNID_NEG'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                  OnChange = dbedt_cd_unid_neg_itpropChange
                  OnExit = dbedt_cd_unid_neg_itpropExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object DBEdit24: TDBEdit
                  Left = 49
                  Top = 58
                  Width = 302
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_UNID_NEG'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
                object DBEdit26: TDBEdit
                  Left = 366
                  Top = 57
                  Width = 38
                  Height = 21
                  Color = clMenu
                  DataField = 'CD_PRODUTO'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 5
                  OnChange = dbedt_cd_unid_neg_itpropChange
                  OnExit = dbedt_cd_produtoExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object DBEdit270: TDBEdit
                  Left = 405
                  Top = 57
                  Width = 302
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_PRODUTO'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 6
                end
                object DBEdit28: TDBEdit
                  Left = 10
                  Top = 96
                  Width = 38
                  Height = 21
                  Color = clMenu
                  DataField = 'CD_SERVICO'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 7
                  OnChange = dbedt_cd_unid_neg_itpropChange
                  OnExit = dbedt_cd_servicoExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object DBEdit29: TDBEdit
                  Left = 49
                  Top = 96
                  Width = 302
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_SERVICO'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 8
                end
                object DBEdit30: TDBEdit
                  Left = 8
                  Top = 18
                  Width = 169
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NR_PROPOSTA'
                  DataSource = datm_proposta.ds_proposta
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
                object DBEdit32: TDBEdit
                  Left = 406
                  Top = 96
                  Width = 302
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_VIA_TRANSP'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 10
                end
                object DBEdit33: TDBEdit
                  Left = 366
                  Top = 95
                  Width = 38
                  Height = 21
                  Color = clMenu
                  DataField = 'CD_VIA_TRANSP'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 9
                  OnChange = dbedt_cd_unid_neg_itpropChange
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
              end
            end
            object ts_dados_desembaraco: TTabSheet
              Caption = 'Dados  B'#225'sicos'
              ImageIndex = 1
              object Label90: TLabel
                Left = 8
                Top = 35
                Width = 32
                Height = 13
                Caption = 'Cliente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label91: TLabel
                Left = 8
                Top = 72
                Width = 98
                Height = 13
                Caption = 'Unidade de Neg'#243'cio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label93: TLabel
                Left = 8
                Top = 112
                Width = 37
                Height = 13
                Caption = 'Produto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label94: TLabel
                Left = 8
                Top = 148
                Width = 36
                Height = 13
                Caption = 'Servi'#231'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label95: TLabel
                Left = 8
                Top = 1
                Width = 59
                Height = 13
                Caption = 'Nr. Proposta'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label97: TLabel
                Left = 8
                Top = 185
                Width = 84
                Height = 13
                Caption = 'Via de Transporte'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label98: TLabel
                Left = 8
                Top = 229
                Width = 20
                Height = 13
                Caption = 'Item'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object Label99: TLabel
                Left = 8
                Top = 268
                Width = 74
                Height = 13
                Caption = 'Tipo de C'#225'lculo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object btn_item_co: TSpeedButton
                Left = 363
                Top = 247
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
                OnClick = btn_item_coClick
              end
              object btn_co_tp_calculo: TSpeedButton
                Left = 364
                Top = 282
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
                OnClick = btn_co_tp_calculoClick
              end
              object btn_co_sda: TSpeedButton
                Left = 364
                Top = 316
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
                OnClick = btn_co_sdaClick
              end
              object Label129: TLabel
                Left = 8
                Top = 303
                Width = 22
                Height = 13
                Caption = 'SDA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object DBEdit39: TDBEdit
                Left = 8
                Top = 48
                Width = 43
                Height = 21
                Color = clMenu
                DataField = 'CD_EMPRESA'
                DataSource = datm_proposta.ds_proposta
                ReadOnly = True
                TabOrder = 1
                OnChange = dbedt_cd_unid_negChange
                OnExit = dbedt_cd_empresaExit
                OnKeyDown = dbedt_cd_empresaKeyDown
              end
              object DBEdit40: TDBEdit
                Left = 53
                Top = 48
                Width = 308
                Height = 21
                TabStop = False
                Color = clMenu
                DataField = 'NM_EMPRESA'
                DataSource = datm_proposta.ds_proposta
                ReadOnly = True
                TabOrder = 2
              end
              object DBEdit41: TDBEdit
                Left = 8
                Top = 86
                Width = 43
                Height = 21
                Color = clMenu
                DataField = 'CD_UNID_NEG'
                DataSource = datm_proposta.ds_proposta_item
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
                OnChange = dbedt_cd_unid_neg_itpropChange
                OnExit = dbedt_cd_unid_neg_itpropExit
                OnKeyDown = dbedt_cd_empresaKeyDown
              end
              object DBEdit42: TDBEdit
                Left = 53
                Top = 86
                Width = 308
                Height = 21
                TabStop = False
                Color = clMenu
                DataField = 'NM_UNID_NEG'
                DataSource = datm_proposta.ds_proposta_item
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
              end
              object DBEdit43: TDBEdit
                Left = 8
                Top = 126
                Width = 43
                Height = 21
                Color = clMenu
                DataField = 'CD_PRODUTO'
                DataSource = datm_proposta.ds_proposta_item
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 5
                OnChange = dbedt_cd_unid_neg_itpropChange
                OnExit = dbedt_cd_produtoExit
                OnKeyDown = dbedt_cd_empresaKeyDown
              end
              object DBEdit44: TDBEdit
                Left = 53
                Top = 126
                Width = 308
                Height = 21
                TabStop = False
                Color = clMenu
                DataField = 'NM_PRODUTO'
                DataSource = datm_proposta.ds_proposta_item
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 6
              end
              object DBEdit45: TDBEdit
                Left = 8
                Top = 162
                Width = 43
                Height = 21
                Color = clMenu
                DataField = 'CD_SERVICO'
                DataSource = datm_proposta.ds_proposta_item
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 7
                OnChange = dbedt_cd_unid_neg_itpropChange
                OnExit = dbedt_cd_servicoExit
                OnKeyDown = dbedt_cd_empresaKeyDown
              end
              object DBEdit46: TDBEdit
                Left = 53
                Top = 162
                Width = 308
                Height = 21
                TabStop = False
                Color = clMenu
                DataField = 'NM_SERVICO'
                DataSource = datm_proposta.ds_proposta_item
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 8
              end
              object DBEdit47: TDBEdit
                Left = 8
                Top = 14
                Width = 135
                Height = 21
                TabStop = False
                Color = clMenu
                DataField = 'NR_PROPOSTA'
                DataSource = datm_proposta.ds_proposta
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object DBEdit49: TDBEdit
                Left = 53
                Top = 200
                Width = 308
                Height = 21
                TabStop = False
                Color = clMenu
                DataField = 'NM_VIA_TRANSP'
                DataSource = datm_proposta.ds_proposta_item
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 10
              end
              object DBEdit50: TDBEdit
                Left = 8
                Top = 199
                Width = 43
                Height = 21
                Color = clMenu
                DataField = 'CD_VIA_TRANSP'
                DataSource = datm_proposta.ds_proposta_item
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 9
                OnChange = dbedt_cd_unid_neg_itpropChange
                OnKeyDown = dbedt_cd_empresaKeyDown
              end
              object dbedt_cd_item: TDBEdit
                Left = 8
                Top = 245
                Width = 43
                Height = 21
                DataField = 'CD_ITEM'
                DataSource = datm_proposta.ds_item_faturamento
                TabOrder = 11
                OnChange = dbedt_cd_itemChange
                OnExit = dbedt_cd_itemExit
                OnKeyDown = dbedt_cd_empresaKeyDown
              end
              object dbedt_tp_calculo: TDBEdit
                Left = 8
                Top = 281
                Width = 43
                Height = 21
                DataField = 'TP_CALCULO'
                DataSource = datm_proposta.ds_item_faturamento
                TabOrder = 13
                OnChange = dbedt_cd_itemChange
                OnExit = dbedt_tp_calculoExit
                OnKeyDown = dbedt_cd_empresaKeyDown
              end
              object dbedt_nm_item: TDBEdit
                Left = 53
                Top = 246
                Width = 308
                Height = 21
                TabStop = False
                Color = clMenu
                DataField = 'NM_ITEM'
                DataSource = datm_proposta.ds_item_faturamento
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 12
              end
              object dbedt_nm_calculo: TDBEdit
                Left = 53
                Top = 282
                Width = 308
                Height = 21
                TabStop = False
                Color = clMenu
                DataField = 'NM_CALCULO'
                DataSource = datm_proposta.ds_item_faturamento
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 14
              end
              object dbedt_sda: TDBEdit
                Left = 8
                Top = 316
                Width = 43
                Height = 21
                DataField = 'CD_SDA'
                DataSource = datm_proposta.ds_item_faturamento
                TabOrder = 15
                OnChange = dbedt_cd_itemChange
                OnExit = dbedt_sdaExit
                OnKeyDown = dbedt_cd_empresaKeyDown
              end
              object dbedt_nm_sda: TDBEdit
                Left = 53
                Top = 316
                Width = 308
                Height = 21
                TabStop = False
                Color = clMenu
                DataField = 'NM_SDA'
                DataSource = datm_proposta.ds_item_faturamento
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 16
              end
            end
            object ts_receita_imp: TTabSheet
              Caption = 'Receita Importa'#231#227'o'
              ImageIndex = 2
              object bvl5: TBevel
                Left = 0
                Top = 293
                Width = 718
                Height = 7
                Align = alTop
                Shape = bsSpacer
              end
              object bvl6: TBevel
                Left = 0
                Top = 189
                Width = 718
                Height = 7
                Align = alTop
                Shape = bsSpacer
              end
              object v: TBevel
                Left = 0
                Top = 137
                Width = 718
                Height = 7
                Align = alTop
                Shape = bsSpacer
              end
              object bvl7: TBevel
                Left = 0
                Top = 85
                Width = 718
                Height = 7
                Align = alTop
                Shape = bsSpacer
              end
              object bvl8: TBevel
                Left = 0
                Top = 241
                Width = 718
                Height = 7
                Align = alTop
                Shape = bsSpacer
              end
              object pnl_taxa: TPanel
                Left = 0
                Top = 92
                Width = 718
                Height = 45
                Align = alTop
                BevelInner = bvLowered
                TabOrder = 0
                object Label100: TLabel
                  Left = 75
                  Top = 23
                  Width = 7
                  Height = 13
                  Caption = '/'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl_base_calc_taxa: TLabel
                  Left = 219
                  Top = 3
                  Width = 75
                  Height = 13
                  Caption = 'Base C'#225'lculo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl_moeda_taxa: TLabel
                  Left = 346
                  Top = 3
                  Width = 80
                  Height = 13
                  Caption = 'Moeda/'#205'ndice'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl_taxa: TLabel
                  Left = 5
                  Top = 3
                  Width = 29
                  Height = 13
                  Caption = 'Taxa'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btn_co_moeda_taxa: TSpeedButton
                  Left = 571
                  Top = 19
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
                  OnClick = btn_co_moeda_taxaClick
                end
                object dbedt_vl_num_taxa: TDBEdit
                  Left = 5
                  Top = 19
                  Width = 68
                  Height = 21
                  DataField = 'VL_NUM_TAXA'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  TabOrder = 0
                  OnChange = dbedt_vl_num_taxaChange
                end
                object dbedt_vl_den_taxa: TDBEdit
                  Left = 85
                  Top = 19
                  Width = 36
                  Height = 21
                  DataField = 'VL_DEN_TAXA'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  MaxLength = 4
                  TabOrder = 1
                  OnChange = dbedt_vl_num_taxaChange
                end
                object dbedt_calc_taxa: TDBEdit
                  Left = 129
                  Top = 19
                  Width = 80
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'Calc_Taxa'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  MaxLength = 3
                  ReadOnly = True
                  TabOrder = 2
                  OnChange = dbedt_calc_taxaChange
                end
                object dbedt_cd_moeda_taxa: TDBEdit
                  Left = 346
                  Top = 19
                  Width = 33
                  Height = 21
                  TabStop = False
                  Color = clWhite
                  DataField = 'CD_MOEDA_TAXA'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  ReadOnly = True
                  TabOrder = 4
                  OnChange = dbedt_cd_moeda_taxaChange
                  OnExit = dbedt_cd_moeda_taxaExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object dbedt_nm_moeda_taxa: TDBEdit
                  Left = 379
                  Top = 19
                  Width = 190
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'MOEDA_TAXA'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  ReadOnly = True
                  TabOrder = 5
                end
                object rxcombox_bse_calc_taxa: TRxDBComboBox
                  Left = 221
                  Top = 19
                  Width = 117
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TP_BASE_CALC_TAXA'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  Enabled = False
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    ''
                    'Despesas'
                    'Desp + Dir. Isentos'
                    'FOB'
                    'CIF'
                    'Moeda/'#205'ndices'
                    'CIF(Moeda) x TAXA')
                  TabOrder = 3
                  Values.Strings = (
                    '0'
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6')
                  OnChange = rxcombox_bse_calc_taxaChange
                end
              end
              object pnl_acr: TPanel
                Left = 0
                Top = 144
                Width = 718
                Height = 45
                Align = alTop
                BevelInner = bvLowered
                TabOrder = 1
                object Label101: TLabel
                  Left = 75
                  Top = 23
                  Width = 7
                  Height = 13
                  Caption = '/'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl_base_calc_acr: TLabel
                  Left = 219
                  Top = 3
                  Width = 75
                  Height = 13
                  Caption = 'Base C'#225'lculo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl_moeda_acr: TLabel
                  Left = 345
                  Top = 3
                  Width = 80
                  Height = 13
                  Caption = 'Moeda/'#205'ndice'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl_acr: TLabel
                  Left = 5
                  Top = 3
                  Width = 59
                  Height = 13
                  Caption = 'Acr'#233'scimo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btn_co_moeda_acr: TSpeedButton
                  Left = 571
                  Top = 19
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
                  OnClick = btn_co_moeda_acrClick
                end
                object dbedt_vl_num_acr: TDBEdit
                  Left = 5
                  Top = 19
                  Width = 68
                  Height = 21
                  DataField = 'VL_NUM_ACR'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  TabOrder = 0
                  OnChange = dbedt_vl_num_taxaChange
                end
                object dbedt_vl_den_acr: TDBEdit
                  Left = 85
                  Top = 19
                  Width = 36
                  Height = 21
                  DataField = 'VL_DEN_ACR'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  MaxLength = 4
                  TabOrder = 1
                  OnChange = dbedt_vl_num_taxaChange
                end
                object dbedt_calc_acr: TDBEdit
                  Left = 129
                  Top = 19
                  Width = 80
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'Calc_Acr'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  MaxLength = 3
                  ReadOnly = True
                  TabOrder = 2
                  OnChange = dbedt_calc_acrChange
                end
                object dbedt_cd_moeda_acr: TDBEdit
                  Left = 345
                  Top = 19
                  Width = 33
                  Height = 21
                  TabStop = False
                  Color = clWhite
                  DataField = 'CD_MOEDA_ACR'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  ReadOnly = True
                  TabOrder = 4
                  OnChange = dbedt_cd_moeda_taxaChange
                  OnExit = dbedt_cd_moeda_acrExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object dbedt_nm_moeda_acr: TDBEdit
                  Left = 379
                  Top = 19
                  Width = 190
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'MOEDA_ACR'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  ReadOnly = True
                  TabOrder = 5
                end
                object rxcombox_bse_calc_acr: TRxDBComboBox
                  Left = 221
                  Top = 19
                  Width = 117
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TP_BASE_CALC_ACR'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  Enabled = False
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    ''
                    'Despesas'
                    'Desp + Dir. Isentos'
                    'FOB'
                    'CIF'
                    'Moeda/'#205'ndices'
                    'CIF(Moeda) x TAXA')
                  TabOrder = 3
                  Values.Strings = (
                    '0'
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6')
                  OnChange = rxcombox_bse_calc_acrChange
                end
              end
              object pnl_fora_regiao: TPanel
                Left = 0
                Top = 196
                Width = 718
                Height = 45
                Align = alTop
                BevelInner = bvLowered
                TabOrder = 2
                object Label102: TLabel
                  Left = 75
                  Top = 23
                  Width = 7
                  Height = 13
                  Caption = '/'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl_base_calc_fora_regiao: TLabel
                  Left = 219
                  Top = 3
                  Width = 75
                  Height = 13
                  Caption = 'Base C'#225'lculo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl_moeda_fora_regiao: TLabel
                  Left = 347
                  Top = 3
                  Width = 80
                  Height = 13
                  Caption = 'Moeda/'#205'ndice'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl_fora_regiao: TLabel
                  Left = 5
                  Top = 3
                  Width = 88
                  Height = 13
                  Caption = 'Fora da Regi'#227'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btn_co_moeda_fora_regiao: TSpeedButton
                  Left = 571
                  Top = 19
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
                  OnClick = btn_co_moeda_fora_regiaoClick
                end
                object dbedt_vl_num_fora_regiao: TDBEdit
                  Left = 5
                  Top = 19
                  Width = 68
                  Height = 21
                  DataField = 'VL_NUM_FORA_REGIAO'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  TabOrder = 0
                  OnChange = dbedt_vl_num_taxaChange
                end
                object dbedt_vl_den_fora_regiao: TDBEdit
                  Left = 85
                  Top = 19
                  Width = 36
                  Height = 21
                  DataField = 'VL_DEN_FORA_REGIAO'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  MaxLength = 4
                  TabOrder = 1
                  OnChange = dbedt_vl_num_taxaChange
                end
                object dbedt_calc_fora_regiao: TDBEdit
                  Left = 129
                  Top = 19
                  Width = 80
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'Calc_Fora_Regiao'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  MaxLength = 3
                  ReadOnly = True
                  TabOrder = 2
                  OnChange = dbedt_calc_fora_regiaoChange
                end
                object dbedt_cd_moeda_fora_regiao: TDBEdit
                  Left = 347
                  Top = 19
                  Width = 33
                  Height = 21
                  TabStop = False
                  Color = clWhite
                  DataField = 'CD_MOEDA_FORA_REGIAO'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  ReadOnly = True
                  TabOrder = 4
                  OnChange = dbedt_cd_moeda_taxaChange
                  OnExit = dbedt_cd_moeda_fora_regiaoExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object dbedt_nm_moeda_fora_regiao: TDBEdit
                  Left = 379
                  Top = 19
                  Width = 190
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'MOEDA_FORA_REGIAO'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  ReadOnly = True
                  TabOrder = 5
                end
                object rxcombox_bse_calc_fora_regiao: TRxDBComboBox
                  Left = 221
                  Top = 19
                  Width = 117
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TP_BASE_CALC_FORA_REGIAO'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  Enabled = False
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    ''
                    'Despesas'
                    'Desp + Dir. Isentos'
                    'FOB'
                    'CIF'
                    'Moeda/'#205'ndices'
                    'CIF(Moeda) x TAXA')
                  TabOrder = 3
                  Values.Strings = (
                    '0'
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6')
                  OnChange = rxcombox_bse_calc_fora_regiaoChange
                end
              end
              object pnl_min: TPanel
                Left = 0
                Top = 248
                Width = 718
                Height = 45
                Align = alTop
                BevelInner = bvLowered
                TabOrder = 3
                object Label103: TLabel
                  Left = 75
                  Top = 23
                  Width = 7
                  Height = 13
                  Caption = '/'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl_base_calc_min: TLabel
                  Left = 219
                  Top = 3
                  Width = 75
                  Height = 13
                  Caption = 'Base C'#225'lculo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl_moeda_min: TLabel
                  Left = 345
                  Top = 3
                  Width = 80
                  Height = 13
                  Caption = 'Moeda/'#205'ndice'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl_min: TLabel
                  Left = 5
                  Top = 3
                  Width = 42
                  Height = 13
                  Caption = 'M'#237'nimo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btn_co_moeda_min: TSpeedButton
                  Left = 571
                  Top = 19
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
                  OnClick = btn_co_moeda_minClick
                end
                object dbedt_vl_num_min: TDBEdit
                  Left = 5
                  Top = 19
                  Width = 68
                  Height = 21
                  DataField = 'VL_NUM_MIN'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  TabOrder = 0
                  OnChange = dbedt_vl_num_taxaChange
                end
                object dbedt_vl_den_min: TDBEdit
                  Left = 85
                  Top = 19
                  Width = 36
                  Height = 21
                  DataField = 'VL_DEN_MIN'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  MaxLength = 4
                  TabOrder = 1
                  OnChange = dbedt_vl_num_taxaChange
                end
                object dbedt_calc_min: TDBEdit
                  Left = 129
                  Top = 19
                  Width = 80
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'Calc_Min'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  MaxLength = 3
                  ReadOnly = True
                  TabOrder = 2
                  OnChange = dbedt_calc_minChange
                end
                object dbedt_cd_moeda_min: TDBEdit
                  Left = 345
                  Top = 19
                  Width = 33
                  Height = 21
                  TabStop = False
                  Color = clWhite
                  DataField = 'CD_MOEDA_MIN'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  ReadOnly = True
                  TabOrder = 4
                  OnChange = dbedt_cd_moeda_taxaChange
                  OnExit = dbedt_cd_moeda_minExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object dbedt_nm_moeda_min: TDBEdit
                  Left = 379
                  Top = 19
                  Width = 190
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'MOEDA_MIN'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  ReadOnly = True
                  TabOrder = 5
                end
                object rxcombox_bse_calc_min: TRxDBComboBox
                  Left = 221
                  Top = 19
                  Width = 117
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TP_BASE_CALC_MIN'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  Enabled = False
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    ''
                    'Despesas'
                    'Desp + Dir. Isentos'
                    'FOB'
                    'CIF'
                    'Moeda/'#205'ndices'
                    'CIF(Moeda) x TAXA')
                  TabOrder = 3
                  Values.Strings = (
                    '0'
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6')
                  OnChange = rxcombox_bse_calc_minChange
                end
              end
              object pnl_max: TPanel
                Left = 0
                Top = 300
                Width = 718
                Height = 45
                Align = alTop
                BevelInner = bvLowered
                TabOrder = 4
                object Label104: TLabel
                  Left = 75
                  Top = 23
                  Width = 7
                  Height = 13
                  Caption = '/'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl_base_calc_max: TLabel
                  Left = 219
                  Top = 3
                  Width = 75
                  Height = 13
                  Caption = 'Base C'#225'lculo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl_moeda_max: TLabel
                  Left = 347
                  Top = 3
                  Width = 80
                  Height = 13
                  Caption = 'Moeda/'#205'ndice'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbl_max: TLabel
                  Left = 5
                  Top = 3
                  Width = 43
                  Height = 13
                  Caption = 'M'#225'ximo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btn_co_moeda_max: TSpeedButton
                  Left = 571
                  Top = 19
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
                  OnClick = btn_co_moeda_maxClick
                end
                object dbedt_vl_num_max: TDBEdit
                  Left = 5
                  Top = 19
                  Width = 68
                  Height = 21
                  DataField = 'VL_NUM_MAX'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  TabOrder = 0
                  OnChange = dbedt_vl_num_taxaChange
                end
                object dbedt_vl_den_max: TDBEdit
                  Left = 85
                  Top = 19
                  Width = 36
                  Height = 21
                  DataField = 'VL_DEN_MAX'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  MaxLength = 4
                  TabOrder = 1
                  OnChange = dbedt_vl_num_taxaChange
                end
                object dbedt_calc_max: TDBEdit
                  Left = 129
                  Top = 19
                  Width = 80
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'Calc_Max'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  MaxLength = 3
                  ReadOnly = True
                  TabOrder = 2
                  OnChange = dbedt_calc_maxChange
                end
                object dbedt_cd_moeda_max: TDBEdit
                  Left = 347
                  Top = 19
                  Width = 33
                  Height = 21
                  TabStop = False
                  Color = clWhite
                  DataField = 'CD_MOEDA_MAX'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  ReadOnly = True
                  TabOrder = 4
                  OnChange = dbedt_cd_moeda_taxaChange
                  OnExit = dbedt_cd_moeda_maxExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object dbedt_nm_moeda_max: TDBEdit
                  Left = 379
                  Top = 19
                  Width = 190
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'MOEDA_MAX'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  ReadOnly = True
                  TabOrder = 5
                end
                object rxcombox_bse_calc_max: TRxDBComboBox
                  Left = 221
                  Top = 19
                  Width = 117
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TP_BASE_CALC_MAX'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  Enabled = False
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    ''
                    'Despesas'
                    'Desp + Dir. Isentos'
                    'FOB'
                    'CIF'
                    'Moeda/'#205'ndices'
                    'CIF(Moeda) x TAXA')
                  TabOrder = 3
                  Values.Strings = (
                    '0'
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6')
                  OnChange = rxcombox_bse_calc_maxChange
                end
              end
              object Panel9: TPanel
                Left = 0
                Top = 0
                Width = 718
                Height = 85
                Align = alTop
                BevelInner = bvLowered
                TabOrder = 5
                object lbl_dt_base: TLabel
                  Left = 401
                  Top = 38
                  Width = 144
                  Height = 13
                  Caption = 'Data Base para Moeda/'#205'ndice'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label105: TLabel
                  Left = 8
                  Top = 3
                  Width = 59
                  Height = 13
                  Caption = 'Nr. Proposta'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label106: TLabel
                  Left = 119
                  Top = 3
                  Width = 32
                  Height = 13
                  Caption = 'Cliente'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label107: TLabel
                  Left = 8
                  Top = 40
                  Width = 20
                  Height = 13
                  Caption = 'Item'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label108: TLabel
                  Left = 401
                  Top = 2
                  Width = 36
                  Height = 13
                  Caption = 'Servi'#231'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object DBEdit55: TDBEdit
                  Left = 8
                  Top = 16
                  Width = 103
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NR_PROPOSTA'
                  DataSource = datm_proposta.ds_proposta
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
                object DBEdit56: TDBEdit
                  Left = 119
                  Top = 16
                  Width = 41
                  Height = 21
                  Color = clMenu
                  DataField = 'CD_EMPRESA'
                  DataSource = datm_proposta.ds_proposta
                  ReadOnly = True
                  TabOrder = 1
                  OnChange = dbedt_cd_unid_negChange
                  OnExit = dbedt_cd_empresaExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object DBEdit57: TDBEdit
                  Left = 160
                  Top = 16
                  Width = 233
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_EMPRESA'
                  DataSource = datm_proposta.ds_proposta
                  ReadOnly = True
                  TabOrder = 2
                end
                object DBEdit58: TDBEdit
                  Left = 39
                  Top = 53
                  Width = 354
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_ITEM'
                  DataSource = datm_proposta.ds_item_faturamento
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 6
                end
                object DBEdit59: TDBEdit
                  Left = 8
                  Top = 53
                  Width = 30
                  Height = 21
                  Color = clMenu
                  DataField = 'CD_ITEM'
                  DataSource = datm_proposta.ds_item_faturamento
                  ReadOnly = True
                  TabOrder = 5
                end
                object DBEdit60: TDBEdit
                  Left = 401
                  Top = 16
                  Width = 38
                  Height = 21
                  Color = clMenu
                  DataField = 'CD_SERVICO'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                  OnChange = dbedt_cd_unid_neg_itpropChange
                  OnExit = dbedt_cd_servicoExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object DBEdit61: TDBEdit
                  Left = 441
                  Top = 16
                  Width = 262
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_SERVICO'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
                object rxcombox_data_base: TRxDBComboBox
                  Left = 401
                  Top = 51
                  Width = 305
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TP_DT_BASE'
                  DataSource = datm_proposta.ds_prop_rec_imp
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Abertura'
                    'Faturamento'
                    'Embarque')
                  TabOrder = 7
                  Values.Strings = (
                    '1'
                    '2'
                    '3')
                  OnChange = dbedt_vl_num_taxaChange
                end
              end
            end
            object ts_receita_exportacao: TTabSheet
              Caption = 'Receita Exporta'#231#227'o'
              ImageIndex = 3
              object bvl9: TBevel
                Left = 0
                Top = 227
                Width = 718
                Height = 7
                Align = alTop
                Shape = bsSpacer
              end
              object bvl10: TBevel
                Left = 0
                Top = 175
                Width = 718
                Height = 7
                Align = alTop
                Shape = bsSpacer
              end
              object bvl11: TBevel
                Left = 0
                Top = 123
                Width = 718
                Height = 7
                Align = alTop
                Shape = bsSpacer
              end
              object Panel6: TPanel
                Left = 0
                Top = 234
                Width = 718
                Height = 45
                Align = alTop
                BevelInner = bvLowered
                TabOrder = 3
                object Label114: TLabel
                  Left = 75
                  Top = 23
                  Width = 7
                  Height = 13
                  Caption = '/'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label115: TLabel
                  Left = 219
                  Top = 3
                  Width = 75
                  Height = 13
                  Caption = 'Base C'#225'lculo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label116: TLabel
                  Left = 348
                  Top = 3
                  Width = 80
                  Height = 13
                  Caption = 'Moeda/'#205'ndice'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label117: TLabel
                  Left = 5
                  Top = 3
                  Width = 43
                  Height = 13
                  Caption = 'M'#225'ximo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btn_co_moeda_max2: TSpeedButton
                  Left = 571
                  Top = 19
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
                  OnClick = btn_co_moeda_max2Click
                end
                object dbedt_vl_num_max2: TDBEdit
                  Left = 5
                  Top = 19
                  Width = 68
                  Height = 21
                  DataField = 'VL_NUM_MAX'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  TabOrder = 0
                end
                object dbedt_vl_den_max2: TDBEdit
                  Left = 85
                  Top = 19
                  Width = 36
                  Height = 21
                  DataField = 'VL_DEN_MAX'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  MaxLength = 4
                  TabOrder = 1
                  OnChange = dbedt_vl_num_taxa2Change
                  OnExit = dbedt_vl_den_max2Exit
                end
                object dbedt_calc_max2: TDBEdit
                  Left = 129
                  Top = 19
                  Width = 80
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'Calc_Max'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  MaxLength = 3
                  ReadOnly = True
                  TabOrder = 2
                  OnChange = dbedt_calc_max2Change
                end
                object dbedt_cd_moeda_max2: TDBEdit
                  Left = 346
                  Top = 19
                  Width = 33
                  Height = 21
                  TabStop = False
                  Color = clWhite
                  DataField = 'CD_MOEDA_MAX'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  ReadOnly = True
                  TabOrder = 4
                  OnChange = dbedt_vl_num_taxa2Change
                  OnExit = dbedt_cd_moeda_max2Exit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object dbedt_nm_moeda_max2: TDBEdit
                  Left = 379
                  Top = 19
                  Width = 190
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'MOEDA_MAX'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  ReadOnly = True
                  TabOrder = 5
                end
                object rxcombox_bse_calc_max2: TRxDBComboBox
                  Left = 221
                  Top = 19
                  Width = 117
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TP_BASE_CALC_MAX'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  Enabled = False
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    ''
                    'FOB'
                    'Moeda/'#205'ndices')
                  TabOrder = 3
                  Values.Strings = (
                    '0'
                    '3'
                    '5'
                    '')
                  OnChange = rxcombox_bse_calc_max2Change
                end
              end
              object Panel7: TPanel
                Left = 0
                Top = 182
                Width = 718
                Height = 45
                Align = alTop
                BevelInner = bvLowered
                TabOrder = 2
                object Label118: TLabel
                  Left = 75
                  Top = 23
                  Width = 7
                  Height = 13
                  Caption = '/'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label119: TLabel
                  Left = 219
                  Top = 3
                  Width = 75
                  Height = 13
                  Caption = 'Base C'#225'lculo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label120: TLabel
                  Left = 345
                  Top = 3
                  Width = 80
                  Height = 13
                  Caption = 'Moeda/'#205'ndice'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label121: TLabel
                  Left = 5
                  Top = 3
                  Width = 42
                  Height = 13
                  Caption = 'M'#237'nimo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btn_co_moeda_min2: TSpeedButton
                  Left = 571
                  Top = 19
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
                  OnClick = btn_co_moeda_min2Click
                end
                object dbedt_vl_num_min2: TDBEdit
                  Left = 5
                  Top = 19
                  Width = 68
                  Height = 21
                  DataField = 'VL_NUM_MIN'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  TabOrder = 0
                end
                object dbedt_vl_den_min2: TDBEdit
                  Left = 85
                  Top = 19
                  Width = 36
                  Height = 21
                  DataField = 'VL_DEN_MIN'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  MaxLength = 4
                  TabOrder = 1
                  OnChange = dbedt_vl_num_taxa2Change
                  OnExit = dbedt_vl_den_min2Exit
                end
                object dbedt_calc_acr2: TDBEdit
                  Left = 129
                  Top = 19
                  Width = 80
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'Calc_Min'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  MaxLength = 3
                  ReadOnly = True
                  TabOrder = 2
                  OnChange = dbedt_calc_acr2Change
                end
                object dbedt_cd_moeda_min2: TDBEdit
                  Left = 346
                  Top = 19
                  Width = 33
                  Height = 21
                  TabStop = False
                  Color = clWhite
                  DataField = 'CD_MOEDA_MIN'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  ReadOnly = True
                  TabOrder = 4
                  OnChange = dbedt_vl_num_taxa2Change
                  OnExit = dbedt_cd_moeda_min2Exit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object dbedt_nm_moeda_min2: TDBEdit
                  Left = 379
                  Top = 19
                  Width = 190
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'MOEDA_MIN'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  ReadOnly = True
                  TabOrder = 5
                end
                object rxcombox_bse_calc_min2: TRxDBComboBox
                  Left = 221
                  Top = 19
                  Width = 117
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TP_BASE_CALC_MIN'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  Enabled = False
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    ''
                    'FOB'
                    'Moeda/'#205'ndices')
                  TabOrder = 3
                  Values.Strings = (
                    '0'
                    '3'
                    '5'
                    '')
                  OnChange = rxcombox_bse_calc_min2Change
                end
              end
              object pnl_taxa2: TPanel
                Left = 0
                Top = 130
                Width = 718
                Height = 45
                Align = alTop
                BevelInner = bvLowered
                TabOrder = 1
                object Label122: TLabel
                  Left = 75
                  Top = 23
                  Width = 7
                  Height = 13
                  Caption = '/'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label123: TLabel
                  Left = 219
                  Top = 3
                  Width = 75
                  Height = 13
                  Caption = 'Base C'#225'lculo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label124: TLabel
                  Left = 346
                  Top = 3
                  Width = 80
                  Height = 13
                  Caption = 'Moeda/'#205'ndice'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label125: TLabel
                  Left = 5
                  Top = 3
                  Width = 29
                  Height = 13
                  Caption = 'Taxa'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btn_co_moeda_taxa2: TSpeedButton
                  Left = 571
                  Top = 19
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
                  OnClick = btn_co_moeda_taxa2Click
                end
                object dbedt_vl_num_taxa2: TDBEdit
                  Left = 5
                  Top = 19
                  Width = 68
                  Height = 21
                  DataField = 'VL_NUM_TAXA'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  TabOrder = 0
                  OnChange = dbedt_vl_num_taxa2Change
                end
                object dbedt_vl_den_taxa2: TDBEdit
                  Left = 85
                  Top = 19
                  Width = 36
                  Height = 21
                  DataField = 'VL_DEN_TAXA'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  MaxLength = 4
                  TabOrder = 1
                  OnChange = dbedt_vl_num_taxa2Change
                  OnExit = dbedt_vl_den_taxa2Exit
                end
                object dbedt_calc_taxa2: TDBEdit
                  Left = 129
                  Top = 19
                  Width = 80
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'Calc_Taxa'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  MaxLength = 3
                  ReadOnly = True
                  TabOrder = 2
                  OnChange = dbedt_calc_taxa2Change
                end
                object dbedt_cd_moeda_taxa2: TDBEdit
                  Left = 346
                  Top = 19
                  Width = 33
                  Height = 21
                  TabStop = False
                  Color = clWhite
                  DataField = 'CD_MOEDA_TAXA'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  ReadOnly = True
                  TabOrder = 4
                  OnChange = dbedt_cd_moeda_taxa2Change
                  OnExit = dbedt_cd_moeda_taxa2Exit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object dbedt_nm_moeda_taxa2: TDBEdit
                  Left = 379
                  Top = 19
                  Width = 190
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'MOEDA_TAXA'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  ReadOnly = True
                  TabOrder = 5
                end
                object rxcombox_bse_calc_taxa2: TRxDBComboBox
                  Left = 221
                  Top = 19
                  Width = 117
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TP_BASE_CALC_TAXA'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  Enabled = False
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    ''
                    'FOB'
                    'Moeda/'#205'ndices')
                  TabOrder = 3
                  Values.Strings = (
                    '0'
                    '3'
                    '5'
                    '')
                  OnChange = rxcombox_bse_calc_taxa2Change
                end
              end
              object Panel10: TPanel
                Left = 0
                Top = 0
                Width = 718
                Height = 123
                Align = alTop
                BevelInner = bvLowered
                TabOrder = 0
                object Label109: TLabel
                  Left = 415
                  Top = 41
                  Width = 172
                  Height = 13
                  Caption = 'Data Base para Moeda/'#205'ndice'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label110: TLabel
                  Left = 10
                  Top = 3
                  Width = 72
                  Height = 13
                  Caption = 'Nr. Proposta'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label111: TLabel
                  Left = 119
                  Top = 3
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
                object Label112: TLabel
                  Left = 11
                  Top = 39
                  Width = 25
                  Height = 13
                  Caption = 'Item'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label113: TLabel
                  Left = 413
                  Top = 2
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
                object Label126: TLabel
                  Left = 13
                  Top = 76
                  Width = 78
                  Height = 13
                  Caption = 'Tipo de Faixa'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label127: TLabel
                  Left = 205
                  Top = 76
                  Width = 128
                  Height = 13
                  Caption = 'Tipo do valor da Faixa'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label128: TLabel
                  Left = 414
                  Top = 76
                  Width = 86
                  Height = 13
                  Caption = '% Redu'#231#227'o RE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBEdit62: TDBEdit
                  Left = 10
                  Top = 16
                  Width = 103
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NR_PROPOSTA'
                  DataSource = datm_proposta.ds_proposta
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
                object DBEdit63: TDBEdit
                  Left = 119
                  Top = 16
                  Width = 41
                  Height = 21
                  Color = clMenu
                  DataField = 'CD_EMPRESA'
                  DataSource = datm_proposta.ds_proposta
                  ReadOnly = True
                  TabOrder = 1
                  OnChange = dbedt_cd_unid_negChange
                  OnExit = dbedt_cd_empresaExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object DBEdit64: TDBEdit
                  Left = 160
                  Top = 16
                  Width = 241
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_EMPRESA'
                  DataSource = datm_proposta.ds_proposta
                  ReadOnly = True
                  TabOrder = 2
                end
                object DBEdit65: TDBEdit
                  Left = 43
                  Top = 52
                  Width = 359
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_ITEM'
                  DataSource = datm_proposta.ds_item_faturamento
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 6
                end
                object DBEdit66: TDBEdit
                  Left = 11
                  Top = 52
                  Width = 30
                  Height = 21
                  Color = clMenu
                  DataField = 'CD_ITEM'
                  DataSource = datm_proposta.ds_item_faturamento
                  ReadOnly = True
                  TabOrder = 5
                end
                object DBEdit67: TDBEdit
                  Left = 413
                  Top = 16
                  Width = 38
                  Height = 21
                  Color = clMenu
                  DataField = 'CD_SERVICO'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                  OnChange = dbedt_cd_unid_neg_itpropChange
                  OnExit = dbedt_cd_servicoExit
                  OnKeyDown = dbedt_cd_empresaKeyDown
                end
                object DBEdit68: TDBEdit
                  Left = 454
                  Top = 16
                  Width = 227
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  DataField = 'NM_SERVICO'
                  DataSource = datm_proposta.ds_proposta_item
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
                object dbedt_pc_reduc_re_canc: TDBEdit
                  Left = 413
                  Top = 89
                  Width = 108
                  Height = 21
                  DataField = 'PC_REDUC_RE_CANC'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  MaxLength = 4
                  TabOrder = 10
                  OnChange = dbedt_vl_num_taxa2Change
                end
                object dblckbox_tp_faixa: TRxDBComboBox
                  Left = 11
                  Top = 88
                  Width = 176
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TP_FAIXA'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Sem Faixa'
                    'Acumulativa'
                    'Fixa')
                  TabOrder = 8
                  Values.Strings = (
                    '0'
                    '1'
                    '2')
                  OnChange = dblckbox_tp_faixaChange
                end
                object dblckbox_tp_faixa_valor: TRxDBComboBox
                  Left = 206
                  Top = 88
                  Width = 194
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TP_FAIXA_VALOR'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Peso'
                    'FOB'
                    'N'#186' RE')
                  TabOrder = 9
                  Values.Strings = (
                    '0'
                    '1'
                    '2')
                  OnChange = dbedt_vl_num_taxa2Change
                end
                object rxcombox_data_base2: TRxDBComboBox
                  Left = 415
                  Top = 54
                  Width = 194
                  Height = 21
                  Style = csDropDownList
                  DataField = 'TP_DT_BASE'
                  DataSource = datm_proposta.ds_prop_rec_exp
                  EnableValues = True
                  ItemHeight = 13
                  Items.Strings = (
                    'Abertura'
                    'Faturamento'
                    'Embarque')
                  TabOrder = 7
                  Values.Strings = (
                    '1'
                    '2'
                    '3')
                  OnChange = dbedt_vl_num_taxa2Change
                end
              end
            end
          end
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 588
    Top = 44
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
      Caption = '&Sair'
      Hint = ' '
      OnClick = btn_sairClick
    end
    object TMenuItem
    end
    object mi_relatorios: TMenuItem
      Caption = 'Relat'#243'rio'
      OnClick = mi_relatoriosClick
    end
  end
  object pproposta: TppReport
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBroker\proposta.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 252
    Top = 383
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 169069
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 41540
        mmLeft = 529
        mmTop = 24871
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'OCEAN QUOTE IMPORT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5556
        mmLeft = 23813
        mmTop = 3440
        mmWidth = 125677
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0A544A504547496D6167651E1C0000FFD8FFE000104A4649460001020100C800
          C80000FFEE000E41646F626500640000000001FFDB0084000604040405040605
          050609060506090B080606080B0C0A0A0B0A0A0C100C0C0C0C0C0C100C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010707070D0C0D18
          101018140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108005B
          00D103011100021101031101FFDD0004001BFFC401A200000007010101010100
          00000000000000040503020601000708090A0B01000202030101010101000000
          00000000010002030405060708090A0B10000201030302040206070304020602
          73010203110400052112314151061361227181143291A10715B14223C152D1E1
          331662F0247282F12543345392A2B26373C235442793A3B33617546474C3D2E2
          082683090A181984944546A4B456D355281AF2E3F3C4D4E4F465758595A5B5C5
          D5E5F566768696A6B6C6D6E6F637475767778797A7B7C7D7E7F7384858687888
          98A8B8C8D8E8F82939495969798999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACA
          DAEAFA110002020102030505040506040803036D010002110304211231410551
          1361220671819132A1B1F014C1D1E1234215526272F1332434438216925325A2
          63B2C20773D235E2448317549308090A18192636451A2764745537F2A3B3C328
          29D3E3F38494A4B4C4D4E4F465758595A5B5C5D5E5F5465666768696A6B6C6D6
          E6F6475767778797A7B7C7D7E7F738485868788898A8B8C8D8E8F83949596979
          8999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACADAEAFAFFDA000C030100021103
          11003F00F54E2AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D
          8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABFFD0F54E2A926B7E
          71D0F4797D1B994BDC815304439B0AF4E5D97E9CC8C5A59CC58E4E1E7D763C46
          89F57724E3F35341E4434170ABD8F1535FA3965FFC9F3EF0E2FF002C63EE923E
          D3F30FCA972789BBF418F6994A7E3B8CAA5A2C83A37C3B4F0CBAD7F593FB6BCB
          4BA8C496D324C87F6A360C3F0CC79448E61CD84E32160DAAE4593B15762AEC55
          D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8AB
          B157FFD1F54E2AF0CD7219D35EBE8AE09F58DCB8773FE536C7FE04E743888E01
          5DCF1FA88919240F3E27AE693E56D0F4EB68E386D6391828E53C8A1DD8F7249A
          E69726A2723B97A6C3A4C7014004835CF34F92ADE792D1EC12F64889593D3893
          8861B11C8D3F0CC9C3A7CC45DF0B85A8D5E9E2787878FE0910D47F2F65979C02
          EF45B8ED35B96500FB852C3FE1732383381BF0E41E6E1F8BA526C71E23FD14F7
          4DD575D515D3354B4F305B8FF744A443754F9F427FD6198F931C3F8A32C47FD3
          41CCC59B27F04A39C7FA4C8AD71F9ABE4FD36E4597982EC685A870127D56F7E1
          25492392B0AAB2D46512D2CB9C7D63FA2E663D644ED2071CBFA489D27F33BC81
          ABEA10E9DA66BB6B777D704886DE27ABB15058D053C06572C1302C86E8E68134
          0B27CA9B5D8ABB15762AEC55D8AA5BAFF99342F2F592DF6B77D1585A33889669
          8F152EC090BF3A29C942064680B6329888B2C7C7E71FE5712147996C89240003
          F52761DB2DFCB64EE2D7F98877B32041008DC1DC650DCEC55D8ABB1549BCC5E7
          3F2AF96CC035DD4E0D38DCF2FAB89DB8F3E14E54F95464E18E52E42D84F2463C
          CA5B61F9ADF973A85EC16365E60B4B8BCB97115BC08F56776E8A053A9C99D3CC
          0B2188CD0268165794B6A95DDDDB5A5B4B75752AC36D0234934CE42AAA28AB33
          13D001840BD904D311FF0095CBF95B4AFF0089AC69FF00193FB32EFCB64EE2D5
          F98877B27D2358D3758D3E2D434C9D6E6CA6A98674078B006955A8151954A262
          68B6C6408B08CC8A5FFFD2F54E2AC0FF00323CAEF3A7E99B44E5246BC6F2351B
          941D241EE9FB5FE4E6C743A8AF41FF0035D2F6A692FF00791FF3FF00E2936F22
          7991356D2D6DE561F5EB450928EEE8365907CFF6BFCACA7578382563E99395D9
          DAA192147EB8FE389E75E67D21F4AD7A682E01FABC927AD1B8FDA89DAA69EEBB
          AE6D3065E380239BA2D5E1F0F290797D5FE6BD66CB44F2F8B3885B595B9B7640
          50F056AA91506A46F5CD2CF2CEF726DE971E9F1708A8C69057BE45F2C5D9E5F5
          316F2F512DB931303FEC76CB21ABC91EB7EF6AC9D9F865D384FF0047D2F943F3
          96E0BFE626A56BF5A96EE3D38476714B3B727023404AD7FC9766CDA6037106B8
          6DC09C384F0D9970FF003930FC85825FF1D8BE867B7827B1B691E0175511C8F2
          D23E1C87D962A5A8D833806344123FA2884CC6428C632FE9FF0017F45F46C5F9
          A7E55B7BE974BD76F6DF48D5ADE827B69A642B522A28E0D370797C59AD9E94D5
          C7D717638B5809E198E097FB1FF4C9CE99E71F2A6A82E1B4ED5ED2E96D104972
          D14C8C23435A33907E15DBBE512C721CC3923244F22914FF009D3F95B05D7D5A
          4F31DA7A95A12A59D01F775529FF000D960D364EE607510EF65BA7EA361A8D9C
          77B61711DD5A4C39453C2C1D187B32D465241068B6820EE1BBDBFB2B0B57BABD
          B88ED6DA2159279982228F7662062013C949039B10FF0095D7F957F59FAB7F88
          ED7D4AD3955B857FD7E3C3FE1B2EFCAE4EE6AFCC43BDE65FF3943E61B4BBD37C
          B765653A5C5BDCBCD7A258983A32A288D082B507777CCAD0C082497175B3B000
          78E7907481ABF9E341D348AADC5EC3EA7FA91B7A8DFF000A999B965C3027C9C4
          C51B900FB9259A28626966758E2415777215401DC93B0CD08776C3F50FCE2FCB
          1D3E568AE3CC569EA29A32C4C65A1FF9E61B2F1A6C87A349D440755B65F9D1F9
          5D78E121F31DA0726804ACD17E2E146274D907451A881EACC2DEE6DEE604B8B6
          95268241CA396360C8C3C430A8394914DA0DBC53F3CBCA9A3F99FCC764B77E6F
          D37446D3AD8A7D46EC832F295B9973F1A503284A66769721844D44CADC3D4E31
          23F508A47F959F94BA15A79E74ED4ADFCDFA76B4FA717B9FA8DA0AC868A515BE
          DB51519C1E993CFA826047098DB0C1800903C424FA12F6FECAC6DDAE6F6E23B5
          B74FB734CEB1A0F9B310335C013C9CF240E6F19FCE0F39F943CD1A5268363E79
          D3F4CB377E5A8811CB72D305A148F945F088EBF137F3E66E9F1CA06CC4970F51
          923214240311FCB6F21FE4FC7ACA5CEB3E6FB0D6DD08367A7906D612E3F6A513
          1AC9BFD98FECFF00AD97E7CB96B6898B561C58EF79093E99844422410F1F4B88
          F4F8538F1A6DC69B5299AA2EC9762AFF00FFD3F54E2AE2010411507A8C55E75E
          65F2BDFE857E35DF2F82B1212F342BBFA75FB5F0FED44DFB4BFB39B4C1A88E48
          F04FF1FF001E745ABD24B0CBC5C5CBFDCFFC713359F45F3D68FE8B1106A700E4
          17F6A373B721FCF1365353D3CEF9C4B90258F598EBE998FF0063FF001D4BBCB5
          E61BDF2E5E0D035F531C20FF00A35C1355504EDBF788F63FB19767C2328E3838
          FA5D4CB04BC2CBCBF865F8FE17A0B4B1AC4662C3D355E65FB7102B5CD5D3BCB7
          C19AF6A6FAAEBBA8EA6E6AF7D7535C1F948E587E19D0423400747295925EEDFF
          0038C5E5AB1BBD035FBFBFB749E1BAB88ED50482A38C09C9A9FECA4CC1D66531
          90A34E5E970C6713C43883C43CDF716F77E6BD66E2015B77BD9C41525BF768E5
          1373B9F85733E1742F9B866201A1C93FFCBDF20799BCDD61AADB6937696B6086
          237B6FCA8F72CB528AB18A7A8230C5BE23C7E2FE6C8649C624197FA648122088
          EE7F98C4F53D3E4D3B52BAD3E53592D25785C814DD0D3A1E9F2CB18036F78FF9
          C51BBBE27CC367CD8E9F1FD5E548FF0065667E618AF872551CBFD5CD76BC0D8F
          5761A12770F3DFCE5FCC5BFF0037F99EEADD276FD01A74CF0D85AA9A2398CF16
          9DC7ED33B03C6BF6533274D84423FD22D1A8CC672FE8B7F94BF94B73E7EB9BC7
          92ECD869761C566B8440EEF2B8256340C42ECA393B63A8D4787E64AE0C1E27B9
          20F3E79667F2AF9A2F3CB6F74D770E9CC05B48761E9CCA25D92A4213CBE30BFB
          596629F1C78BBDAF2C3865C3DCCCBFE71B749FAEFE652DD32D63D32D269C93D9
          E4A44BFF00126CA35B2AC7EF6ED1C6E7EE7A67E77F92FCD1E63BB8CCDE67D3B4
          5F2CC318F4ECEEE5922F565EAF2494F85E9F6517F6731B4B96311C8CA4E4EA71
          CA5D4462F32F2C7907F2A2CAFA5FF1779D2C6EEDD54082DB4D795416A9E46493
          8741FB2AB9953CD908F4C4FF009CE34316307D52FF004AC23CED67E58B4F335E
          DBF962E9AFB425286D2E1C96279282EB520160ADF0D6997E232311C5F5346411
          12F4F27B2FFCE2A6A1AA33EBDA71919B4A85609A28C9256399CB06E1FCBCD57E
          203F973075E06C7AB99A12771D1E57F9B5AA8D5FF323CC179F6916E9ADA2277F
          82D80847E2873334F1E1800E2E795CCBD2BFE71534657D575ED64A0FDC450D9C
          6DEF2132BFE0A998BAF96C0393A18EE4A37F387F2F7CC9AF6BF3DFEB9E6FD274
          ED291A9A6E9D752C9188A2ECC5294691BABBE474D9A318D0892596A31191B320
          0316F2AF923F256D239C79B7CE16D7D725A9047A7BCB142894EA5B87277AFF00
          B15CBB265CA7E98B5431E21F549E61ACDBE9B16AD7D069D31BAD3639E44B3B87
          1BC9086211C8FF0029732A24D0BE6E2C80BDB93E9AFF009C63D4B54BBF22DD43
          792B4B6D6578F0D897258AC7C158A027F6559BE1CD5EBA204F6767A324C777AF
          E61396FF00FFD4F54E2AEC55C402287A62AC23CC7E47B88AE7F4BF9718DB5EA1
          E6D6E878863DCA7615EE87E06CD860D58238726E1D46ABB3C83E262F4CBF9AA1
          69AEE8DE66B7FD11E62845A6A6878A48470F8FA5509FB0FF00E437DAC94B0CF1
          1E2C7EA8B086A31EA07879470CD2CD762F38796B44D474C8D85E69B756F2C167
          74D5A42F221552D4A94A57A7D9FE5C9C7C3CC41FA66C09CDA5147D78BBFF009A
          F95F52D1F51D267FAB5FC0D0B8FB2C774703BA30D9866716B84C48587D3FF961
          C3CADF909FA5643C1CDA5D6A4C7FCA939327E0133519FD79ABFCD76D87D38ADF
          2A2722A0B6EC7763EE7739B7756FA83F287C99629F94BA7EA72B359EA0C6E351
          8EFA3F864452E4AF2FE65E08BB66B72EA4C7211F547E9E173068E33C625F4CFF
          00866F99EFEF66BFBFBABF99CC935DCD24F2487AB348C589FA6B9B102B670EC9
          E6FA4FFE71B3459A1FCBCD56FE2F86E754B995616E9B43188D3FE1CBE6AF5B2F
          581DCECB471F413DEF9A2786782E2682E1592E2191E39D185195D5886041EF5C
          DA02EB69EC9F929F9C1E54F25795F50D37588EE3EB4F72D7503411FA8250E8AA
          12B51C5815FDACC2D4E9A539021CCD36A2308905E5DE6CF305D798FCCBA96B97
          29E9CB7F3B49E975F4D3ECA27FB040AB9978E1C3103B9C69CF8A44BD9BFE71AA
          DFF47797FCD9E6731191A0558A24037616F134CCA3E6CEB983AD3728C5CCD18A
          1293C4B5EF30EADE64D4E6D5F58B86BABBB93CC9724AA29DD5235E88883650B9
          9D08088A0E14A6646CBD13C8DA47E4545E525D57CDBA9C971ACFC6D2E948D223
          27162123448C0F50B2D1B997FDACC7CB2CBC5511B3918A38B86E477799DF4B6D
          35F5C4B6B07D56D6495DADEDAA5BD38CB1289C8EEDC576AE650E4E31E6FA33FE
          71CA04D1BF2DB5CF30CA0012CD34DC8ED58ECE2A0FF86E79ACD69E2988BB1D20
          A812F9BE5B896E6692E6524CB70ED2B93DDA462C7F139B3AA75B76FA0FF2CEF2
          F3CA1FF38FDAD799AD107D7EE1EE2E2DDD8546CCB6F1B11E094E79AECE04F308
          9E4EC30930C4641F3F5F5D5DDF5D4B797B33DDDE4C4BCB3CCC5DDD8EE49639B1
          000D8380493B97AADB699F905A5792E2BEBABC935EF324B6E0FD4124951BEB2E
          BFDDFA69C42246FB16639886598CAAB862E508E211BFAA4F2515037FA732DC47
          D87F90BA47E8DFCAED22ABC64BD125E480F8CCE4AFFC204CD36AE5790BB7D2C6
          A01E8398CE43FFD5F54E2AEC55D8ABB15487CCBE4FD2F5C8CBC8BE8DE8144BA4
          1BFB071FB6B99383532C7FD570B55A18661BED2FE7318875AF31F9558586BB01
          BFD28FC11CE3E2F87C031EBFF18E4CCB38B1E6F540F0CDD7C73E5D37A720E3C7
          FCEFC7FB9921F5AFCBFF002AF9B74F964D1E489E390132D84BF6031F01F6E16F
          9631D4CF19E1C83FCE49D1E3CBEBC12E13FCDFC7D2E3A8E9F0E823C9BE6ED25A
          DF4930A5A8F47908DA18E814554F2A7C23E246C074FC478F19B2CA3AE30F4668
          F0FF0049BB1FC93FC97D421F56CB4C8A78CF74B89CD3E63D4A8CA27A8CD13476
          73B1E2C33171F533B87CBFA441A02E810C1E9E92B6FF00535B756614878F0E3C
          ABCBECF7AF2CC5333C5C5D5CAE0155D183DD7FCE3DFE573DABC76DA40827E3FB
          A93D69C8561D2A0B9A8F1CC98EB260EE7671F2692241AD8A33C85AE689A3DBC3
          E545B15D25AD5DE18A2466788C85C961C9C9705989A72CB353A627D60F107134
          9AE8DF8721C12FA7FA2A9E6FFC97F20F9AEFDB51D46CDE1D41E9EB5D5A486179
          29B0E74AAB1FF2B8F2CA31EA670143939D934F091B285F2E7E427E5BE857E97F
          158C97B73130685AF6533AA30E85508095FF005970CF57390AB4434B089B549F
          F21BF2B279E49E6D183CD33B492399E7A9672598FDBEE4E01ABC83AA4E9A07A3
          27F2C7947CBDE58D31B4BD12D05AD8BC8D2BC5C99EAEF40C4972C77A6553C929
          9B2D908088A0C2754FF9C73FCB2BFBD92E96DAE6C8CAC59A1B59DA38B9135255
          086E3F25F872F8EB32014D32D2409B44F97FF207F2D745BE8EF52C64BDB88583
          C26F65332AB0DC109B21FF0064AD827ABC921569869611369779DFF2AFF29B43
          D0F56F33DEF97DAECDB2BDD5C471CF32B48CCD56A55C28A96C962CF924444163
          9306300921318353FC9FD234A1E403796F6505E208A4D25A69390FAE0E5E9B49
          53C1A4E7DE4C898E5278FED640E303818E0F24FF00CE367E9A6D0E96BFA55261
          6C6D3EB371CBD6AF1F4C1E7C4BD76E20E5BE2E7ABE8D7E161BAEA9FE8BE74FCA
          FB1F25DB69D74D6DA6E833ADCDBD969F349F59F52D6191A391D82FA84216E5CB
          9FD9FE6CAA58F21958DE4D83240468F261373F971FF38F7279A57435BDBAB6BD
          B98E09EDA18AE1FD061747F72913B07AB302AC16BF619732066CDC374D070E2E
          2A4C3CB1A37E4579674E4D5B508E3B0B9BA96EED2DE4D42E3EB53116EED04AF1
          FA5C953A7DA55E51FF00AD919CB348D065086288B2ADA8F927FE71AB4E4B5FAE
          0B5892F615B8B6617370EAD04868B2725760A8DFCEDF0E08E5CE7924E3C239BD
          7F4AB0B0D3F4DB5B1D3D047636D12456B1A92408D5405009AD76CC29124D972E
          20014115812FFFD6F54E2AEC55D8ABB15762AB27820B889A19E3596271474700
          823DC1C20906C319444851E4C2B55FCBD9ADAE0DFF0096EE5ACEE17716E5885F
          92B761FE4BF25CCFC7AD0470E41C41D4E6ECC313C584F0CBF9A858FCE92464E9
          5E70D3763B194A5411E253A1FF005A33933A5BF5629358D791E8CF1FC7E3F9AB
          CF9274ABD1FA43CADAA1B773B85572CA3DAA0874FF006583F3728FA7246D3F90
          84FD5865C3F8FF004CA6FABFE63687B5DDB8BFB74FF76F1E7B7FAD1D1BFE0972
          431E0C9C8F0962736AF0FD438C7E3F9AA2DF9B17DC4AFE8F8965A53E291A80FF
          00ABC41C3FC9C3BD8FF2CCBF9A2FDEC2EF2F66BABB9AF267FDFCCE65775DA8C4
          D76F0A76CCF8C40000E4EA673329191E65EE1A2CF733E916735D295B89214694
          1D8F22A2B5CE7F2802440E56F5F8244E38997D5483B5F34E9EFA94BA5DE1FA9E
          A113504521F864077568DFA1E43B7DAC9CB4F2E1E21EA8B543591333097A263F
          1E94E72872D2F6D7B4C5D7068864235136E6EC47C1B8FA41B8579D385797ECF2
          E592E0357D18F10BA57BCD534DB2B592EEF2EA2B7B5888592791D5514921402C
          4D01A9A601127609240567B8811433C8AAA4D03330009FA71A4DA4FE73D020F3
          2796350D024BAFAA0D4A2F43D700332D48350A48E5D3278E7C3207B984E3C429
          866A1F93AB77AB5EB47E617834CD4EEED750BFD2C5BC2CD24D682300ACCC7D44
          56685795065C3534396E1A4E0B3CF66331FE5BF9D64F3B471C6823D02DBCC2FA
          D6F716D244A8CECECC1428BBF55CB71E0FFBB4CB7C68F07F4B8785AFC1971797
          1712BF9A7F273CB767E59B27B9F30BC365A3A5C412DC0B55B87617D726415113
          07F85E4E207C4BFB5C7063D4C8CB97D5FEF567A78F0F3E4CA63FCAF306B9A3DF
          E9FE65B8B592C2C6D2C2EE2F4E1796EE0B393D55E4EDF147EA578C9C57EC655E
          3EC411CCB68C3B820F441FFCA9C685ECA4D27CC6D65A9598D417D6FAB4338683
          51B833BA7A521217D366E2AF92FCCF78DB6FF628F03B8F7A51E78FCA0D0E4D32
          6BED43CCCF6F61A5E951D95E48D6F1CCD1C76F52D32AC653D36727F78823C962
          D41BA03996393003B93D1EB7A21B73A3581B697D6B636F17A33538F34E038B53
          B721BE624B997263C823322C9FFFD7F54E2AEC55D8ABB15762AEC55D8AA1B50D
          32C35180C17B024F11FD9715A7C8F51F464E19251360D35E4C5198A90E20C2F5
          0FCB8BBB498DDF97AF5E0946E21762A7E4B20FF8DF33E1AE0456416EA72F65CA
          278B14B84FE3F890B1F9DFCD7A24820D76C4CC836F548E0C7E4EB58DB267498F
          26F02D63B43362359237F8FF004A9BC3E6AF22EAE00BD8A28A56EAB75101BFFA
          F423FE1B283A7CD0E5FEC5C98EB34D97EA007F5C26F63A1F94F9ACF656968ECB
          BABC611A9F757289E5CBC8993958F4F839C4453924015268075394396F25FCC6
          BDB1BCF3029B57593D1844733AEE0B8626951FCA0E6EB4503186FDEF33DA9923
          2CBE9E81997E5EEB32EA3A1FA53B17B8B26F4598EE4A52A84FD1F0FF00B1CC1D
          6E2119D8E5276BD999CCF1D1E70F4B16FCC9FCBEF366BFAC6AD75A54B1A4177A
          17E8EB70F33C645CFD6D26A90A3E11E9A9F8F061CD18800FF39C9CB8E5226BB9
          2AD63F252F65D3BCCDA7E9B6F6F1D9DFC3A74DA5DB4934A6317F6C49B99181E5
          C4CAA78F3F8B964E3A91609E97FE9584B4FB103C903E61FCA2F3A6A3A7E8DE9D
          969B12DA45791CBA341338B789AE240D1C8AF3ACDEA3851477E2ADFC9C70C351
          104F3FEB319E091039277A2FE4CC92EAD6F37991CDCC361A5E9B6F63730DCCA2
          68EF2CD8B48EA76FF2539B7C4E99096A76F4F79671C1BEFDC10FA4FE526BD67A
          9D86B45615D6A2F305D5EDCDE09E424E9937329153A1DD97945865A80411D387
          FD928C041BEBC5FEC522F2E7E4B7E60D9EA53CF3DC5BDA3DC596A36B3DE413B1
          2F2DDA11149C422BF0573FEEC92475FD9CB27A9811F10D50D3CC1F9ABDA7E4FF
          009C93CBBAAD95BE9BA768F757367676A86D2F2E5CDC4B05C24B24F297F810B2
          2B745E7F17DAE380EA23C40D99321825C2455236F3F297CDD2F9DDF528E1B30A
          FAD45AA2F983EB338BC4B442A5AD0434E1C28A53ED71F8B223511E0AFE8F0F0F
          FBE49C12E2BF3FA917A37E51EB3A6DE691ABC0B145AE43AADFDC6A7782795B9D
          8DC09BD18A9D19579C3CA3C8CB500823F8687FA64C701147ADB19D27F24BF302
          DA2D4C4BF5547BED22FAC26E3705966B8B8A189DA91A9E1CBFDF8D23A7F365D2
          D540D7BC35C74F217EE7BB797ECA7B0D074EB29E9EBDADAC30CBC4D579C71856
          A1F0A8CD7CCD925CD88A0023F22C9FFFD0F54E2AEC55D8ABB15762AEC55D8ABB
          15762AB658629A331CA8B246DF6918020FD070824724188228B19D4FF2E7CBB7
          9C9A146B295BF6A13F0D7FD4355CCBC7ADC91E7EA75F97B2F14F97A0FF00458C
          5E7E57EB56EC5B4FBA8E71D812D0BFE155CCB8EBE07EA1FEF9D7CFB27247E920
          FF00B14AAEFCB1E738C149ADAEA54EE164322FE0C72E8EA317421C69E9350398
          97CF890D0F94FCCB2B844D36607C5D4228FA49C99D4E31FC41AE3A3CC7944BD2
          FC93E5A9B43D3E45B960D7772C1E50BBAA8028AA0F7A66A7559C6496DC83D068
          34A70C4DFD5264598AE73B15762AEC55D8ABB15762AEC55D8ABB15762AEC55FF
          D1F54E2AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15
          762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABFFD2F54E2AEC55D8ABB157
          62AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AE
          C55D8ABB15762AEC55D8ABFFD9}
        mmHeight = 14552
        mmLeft = 164307
        mmTop = 529
        mmWidth = 31750
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 6879
        mmLeft = 529
        mmTop = 17727
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Quote No.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3937
        mmLeft = 100542
        mmTop = 19315
        mmWidth = 16849
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 19050
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'From'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 100542
        mmTop = 26194
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 2647
        mmTop = 26458
        mmWidth = 4233
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Company Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2540
        mmTop = 31221
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Contact'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2540
        mmTop = 35454
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'City, State Zip Code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 2540
        mmTop = 47890
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Telephone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 2540
        mmTop = 52123
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Fax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 2540
        mmTop = 56356
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Email'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 2540
        mmTop = 60590
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Address'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 2540
        mmTop = 39158
        mmWidth = 26723
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 25929
        mmLeft = 529
        mmTop = 67469
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'Incoterms'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 68792
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 'Frequency of Sailings'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 73290
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Est. Transit Time-Days'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4234
        mmLeft = 2117
        mmTop = 78052
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'Service Required'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 82815
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Company Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 100277
        mmTop = 31221
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Contact'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 100277
        mmTop = 35454
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Address'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 100277
        mmTop = 39158
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'City, State Zip Code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 100277
        mmTop = 47890
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Telephone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 100277
        mmTop = 52123
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Fax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 100277
        mmTop = 56356
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Email'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 100277
        mmTop = 60590
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 'Eqpt/Cargo Type'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 87577
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = 'Port of Loading'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 100013
        mmTop = 68527
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'Port of DIscharge'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 100013
        mmTop = 73025
        mmWidth = 35190
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 73819
        mmLeft = 529
        mmTop = 94192
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Additional Notes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 98954
        mmTop = 94986
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = 'Crating/Packing'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 99748
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Caption = 'Inland Freight/Drayage'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 103981
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = 'Pier Unloading/Loading'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 108215
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = 'Forwarding/Export Fee'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 112448
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label301'
        AutoSize = False
        Caption = 'Documentation/ Prep Fee'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 116946
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Caption = 'SED/Export Filing Fee'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 121179
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        AutoSize = False
        Caption = 'Letter of Credit/Baking'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 125413
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        AutoSize = False
        Caption = 'Consul/Legalization Fees'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 129646
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        AutoSize = False
        Caption = 'Comm.-Fax/Phone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 134144
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        AutoSize = False
        Caption = 'Courier Service Fee'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 138377
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        AutoSize = False
        Caption = 'Messenger/Delivery Fee'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 142611
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        AutoSize = False
        Caption = 'Ocean Freight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 146844
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        AutoSize = False
        Caption = 'Marine Insurance'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 151342
        mmWidth = 35719
        BandType = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'REMARKS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 66411
        mmLeft = 99219
        mmTop = 99748
        mmWidth = 96309
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 162719
        mmWidth = 26723
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NM_EMPRESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3970
        mmLeft = 30692
        mmTop = 31221
        mmWidth = 67998
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NM_CONTATO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3970
        mmLeft = 30691
        mmTop = 35719
        mmWidth = 67998
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'END_EMPRESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 30692
        mmTop = 39952
        mmWidth = 67998
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'FONE_EMPRESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3970
        mmLeft = 30691
        mmTop = 52652
        mmWidth = 67998
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'END_EMPRESA2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3970
        mmLeft = 30691
        mmTop = 48419
        mmWidth = 67998
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'EMAIL_CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 30692
        mmTop = 61119
        mmWidth = 67998
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'FAX_EMPRESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 30692
        mmTop = 56886
        mmWidth = 67998
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'NM_UNID_NEG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 128323
        mmTop = 30956
        mmWidth = 67998
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'NM_USUARIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 128323
        mmTop = 35454
        mmWidth = 67998
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'END_UNID_NEG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 128323
        mmTop = 39688
        mmWidth = 67998
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'END_UNID_NEG2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 128323
        mmTop = 48154
        mmWidth = 67998
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'FONE_UNID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 128323
        mmTop = 52388
        mmWidth = 67998
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'FAX_UNID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 128323
        mmTop = 56621
        mmWidth = 67998
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'EMAIL_UNID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 128323
        mmTop = 60854
        mmWidth = 67998
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'NR_PROPOSTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 118798
        mmTop = 19315
        mmWidth = 32808
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 11377
        mmTop = 19315
        mmWidth = 22225
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'CD_INCOTERM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 37835
        mmTop = 68792
        mmWidth = 61119
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'NR_FRQUENCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 37835
        mmTop = 73554
        mmWidth = 61119
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'NR_TRANSIT_TIME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 37835
        mmTop = 78317
        mmWidth = 61119
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'TP_ESTUFAGEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 37835
        mmTop = 83079
        mmWidth = 61119
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'CD_INCOTERM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 37835
        mmTop = 87842
        mmWidth = 61119
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'LOCAL_ORIGEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 136261
        mmTop = 68527
        mmWidth = 60061
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'LOCAL_DESTINO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 136261
        mmTop = 73290
        mmWidth = 60061
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0A544A504547496D61676519720000FFD8FFE000104A46494600010201004800
          480000FFE10A2E4578696600004D4D002A000000080007011200030000000100
          010000011A00050000000100000062011B0005000000010000006A0128000300
          0000010003000001310002000000140000007201320002000000140000008687
          690004000000010000009C000000C80000001C000000010000001C0000000141
          646F62652050686F746F73686F7020372E3000323030343A31323A3136203038
          3A35373A35390000000003A001000300000001FFFF0000A00200040000000100
          0001FBA003000400000001000000A20000000000000006010300030000000100
          060000011A00050000000100000116011B0005000000010000011E0128000300
          0000010002000002010004000000010000012602020004000000010000090000
          00000000000048000000010000004800000001FFD8FFE000104A464946000102
          01004800480000FFED000C41646F62655F434D0002FFEE000E41646F62650064
          8000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518
          131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14
          110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0CFFC00011080029008003012200021101031101FFDD
          00040008FFC4013F000001050101010101010000000000000003000102040506
          0708090A0B010001050101010101010000000000000001000203040506070809
          0A0B1000010401030204020507060805030C3301000211030421123105415161
          1322718132061491A1B14223241552C16233347282D14307259253F0E1F16373
          3516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A4
          85B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7
          B7C7D7E7F7110002020102040403040506070706053501000211032131120441
          51617122130532819114A1B14223C152D1F0332462E1728292435315637334F1
          250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F346
          94A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6273747576777
          8797A7B7C7FFDA000C03010002110311003F00F5373DAC6973C86B4724980B36
          EFAC1875B8ED06C630C5960801B0373B9FDD6A9F50E976676554E7DC5B88C1FA
          4A9A48738FE686BDBF41AEFF0008EFE7162E75955F90DAA8603431C2BC6C7600
          379077447D1DAF7B7D4B3FE0BF9C55398CB92263189E194E5C3003D739447CF2
          FF0017F47FE7B2E3844D93A888B9741FD576F37AC538C432B6FAD6182E6CED0D
          075F73A3E97F210B2FAED4CAEB18C03ADB5BBC07FE688DDEE68FCE58D9B4BB0E
          DF4DE4E4E75847A9B7F3AC7FBABC5A03BE8D6DFE72CB5FF4FF009EB7E827C8C6
          B287B712B70B7A85E5ADB6C03DAD79F732AAFF00EEBE2B37E459FE97FC228259
          F9827281202E51C58F87FCF7E96384BF4B87FCB65FF57FABFEA3C4318E1B1D0C
          E57FB9FBD2FF00B88BD174BCD766E28B9C00707398E8E0969DAE2D56D6574ECE
          C1A0B7A6D13E963D448B8910434C5B6BBFACF77F39FE111B1BAC63E465FD998D
          70904D6F3F9DB7E9FB7E9355C867C758E3EE094A77189EB90E3F9E5FF358A509
          7A8F0D56A7FABC5B24EA1D53A7F4CA9B767DECC7ADEED8C73CF2E82EDA3FB2D4
          4C2CDC4CFC66E561DADBA87CEDB1BC183B4AE03FC61F50395D5E9E9D5F186C97
          7FC6DF103FEB74B6BFFB791F27EB0E6FD5BAB07A574EAE97BDD4B6EC83635CE7
          6EB5DB6963057655EFF499F9DFF06ADFB5718D7CD2B3E1C2C1EE6B2BF963A7F8
          4F7E92F3EBBEBE7D60ABA956DB7169AB1DE58E18D0E73CD561F6BFED01FB77EC
          FCEF4BD357FEB17D78CAC6CF774DE914B1F6D702EBAD9203C8DEEAEBAD8E67F3
          4DFE76C7D9FC843DA969B6A38AEF4E14FB91D77D0D6CF4DD47ABF4DE96C63FA8
          643319B692DACBCF240DC6158C7C8A32A8AF231DE2CA6D687D6F1C107505795F
          5DEA7D5BAC66E362753A9B4E4E2CD4E6301009B0B2C759B1C5DB3752DAFF003D
          74FD47AAF5FE8E28E97D3301ADAAAADBEA66DFAD6E7B86F7FA4D63EBDAD638ED
          DF67E7FF0082FF00088CB100222C59049D7D35D10325D9A3434DBD56F62A8752
          EBBD23A5BD8CEA1955E3BEC05CC6BCEA436038E9FD65C9F4AFAEDD60F58AF033
          DB8D93539FE9BEDC69D0C4EFADE1F6576B1BF45EAB75BEA15F57FAD8703EC74D
          F5D3637185D0F174375B9ADB059E9B7664BDECAFF4490C4413C5B08F1E9FBAAF
          7011E9DC9E1D7BBE86D735ED0E6996B84823B854307AFF0048EA193662E1640B
          ADA490FDAD76D969DAED96B9BE959FF5B7AE73AD759EBD55F674AC2E9F563F4F
          634D1EBE66ADB1B1B1CEDCCB6B657539BFBFEFFF0008FF004953FA95D6DD5F54
          FD96EC5C66D6F0E6B6FC60410587DADDC5CF6BF19DFE0FD3D880C7E927435AE8
          764F1FA80D7EC7FFD0F4BEA6FB6BC0B9F54EF0DE47207E7B87F558B3BEAF74F2
          01EA390C2DB2C1B31AB7082CABF78B4FD1B723E9BFF91E9D6B6D251FB5139465
          366423C11FDD8FEF18FF005A4BB8CF0F0F4BB2D738388730671AC1C96B7636C3
          3A03CED1F4777F2D67B3A758CEB46D7D46CA2C6D8E161221A5FB5A58E6FE73BF
          37FA8B6124658E3231246B02651FF0870CBFE920488040FD2D0BCEFEC2CD7E4D
          AC7BC63610326E6906D7B44B9AD6E9B69D93F4DFBFFE0D37487E255D45F6B9CD
          AAB0DF4B15849261C6773899FCC655EFB3E9A275BEA40FAB483FA0A44591F9CE
          E76FF2BFABFBEAE74FE918ECE9A29CAA9AEB6F1BF24FE717BBDCE6EF1EEFD1FF
          0036D5571C01CB58408C708F9A573E3C93F48FD2FD0C7F2FFB565948F0FAC926
          7D07A78623FF00427CFF00171337AA7D693665D3655F69C97BDC1E356B418630
          FF00C5503FE82B35E264F55FAE963F2687D75BEF706B5CDDBFA2A87A35E9F9BF
          ABB37AF49000E125A272937A0171E0FF0005AA31815A9D0F17D5F37AB1B2BA9F
          D777DB9343D959C83B5AF6C7E8E98AAB11F9BFA0AFD454BD3EA9D27EB1DD6D98
          9EBDE2FB1CC16C8ADFBDE5F55FEA37FB162F554B6B4998123828FBC75D051023
          5E015ED0EE77E2B7CCFA161F51CDFACCFC8CEA89C99B2F707B4B5A6C68F6321D
          F42AF6D757BBFC1AA143337233DEFEB3877E766D8E0032E76D68B27DCC78736C
          DB4FF231D9F43D952F5B4B6B677409F1EE97BC75D06A00EA28455ED0D353A127
          ED7CCBEAAE16437AADD95918EF166256FBC501BB4B9CC97FA75307FC28AD8DAD
          37D57C2EA8EBB3F399539DD469C7B2EA43C03BAF7EE33EEF6B9DEABB733FA8BD
          3D240E5278B41EAAFF009BD1431815A9D2FF00E73E43854DF6D961C9C1BB3F3D
          D26A76438B86E0266DAEC0FB2E7EEF77A6CFE73E87E8D8B7BFC5EF4E78CFBF22
          F6398FA580343841F77B67FF003E2EFC35A0920004F2524A594C8114071577E8
          A8E20083774FFFD1F5549249252945DBB69DBA3A0ED27C549240ECA79AE9FD36
          FC9CE6B722A7578F88EDF617823D4B796359BBF9CAD8EFD2BECFF89AD74A924A
          1E57DBF687B7757AF1FCFC5FD7E1FEAFCBFEAD7E5E2E23C55F4D94924929D629
          2492494A4924925292492494A49249253FFFD9FFED180650686F746F73686F70
          20332E30003842494D0425000000000010000000000000000000000000000000
          003842494D03ED00000000001000480000000200020048000000020002384249
          4D042600000000000E000000000000000000003F8000003842494D040D000000
          000004000000783842494D04190000000000040000001E3842494D03F3000000
          000009000000000000000001003842494D040A00000000000100003842494D27
          1000000000000A000100000000000000023842494D03F5000000000048002F66
          660001006C66660006000000000001002F6666000100A1999A00060000000000
          01003200000001005A00000006000000000001003500000001002D0000000600
          00000000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800
          003842494D040000000000000200023842494D04020000000000060000000000
          003842494D040800000000001000000001000002400000024000000000384249
          4D041E000000000004000000003842494D041A00000000034500000006000000
          0000000000000000A2000001FB00000008006D00790069006E00640061006900
          6100000001000000000000000000000000000000000000000100000000000000
          00000001FB000000A20000000000000000000000000000000001000000000000
          0000000000000000000000000010000000010000000000006E756C6C00000002
          00000006626F756E64734F626A63000000010000000000005263743100000004
          00000000546F70206C6F6E6700000000000000004C6566746C6F6E6700000000
          0000000042746F6D6C6F6E67000000A200000000526768746C6F6E67000001FB
          00000006736C69636573566C4C73000000014F626A6300000001000000000005
          736C6963650000001200000007736C69636549446C6F6E670000000000000007
          67726F757049446C6F6E6700000000000000066F726967696E656E756D000000
          0C45536C6963654F726967696E0000000D6175746F47656E6572617465640000
          000054797065656E756D0000000A45536C6963655479706500000000496D6720
          00000006626F756E64734F626A63000000010000000000005263743100000004
          00000000546F70206C6F6E6700000000000000004C6566746C6F6E6700000000
          0000000042746F6D6C6F6E67000000A200000000526768746C6F6E67000001FB
          0000000375726C54455854000000010000000000006E756C6C54455854000000
          010000000000004D7367655445585400000001000000000006616C7454616754
          4558540000000100000000000E63656C6C54657874497348544D4C626F6F6C01
          0000000863656C6C546578745445585400000001000000000009686F727A416C
          69676E656E756D0000000F45536C696365486F727A416C69676E000000076465
          6661756C740000000976657274416C69676E656E756D0000000F45536C696365
          56657274416C69676E0000000764656661756C740000000B6267436F6C6F7254
          797065656E756D0000001145536C6963654247436F6C6F725479706500000000
          4E6F6E6500000009746F704F75747365746C6F6E67000000000000000A6C6566
          744F75747365746C6F6E67000000000000000C626F74746F6D4F75747365746C
          6F6E67000000000000000B72696768744F75747365746C6F6E67000000000038
          42494D041100000000000101003842494D041400000000000400000006384249
          4D040C00000000091C0000000100000080000000290000018000003D80000009
          0000180001FFD8FFE000104A46494600010201004800480000FFED000C41646F
          62655F434D0002FFEE000E41646F626500648000000001FFDB0084000C080808
          09080C09090C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C11
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B
          0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C
          110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000
          11080029008003012200021101031101FFDD00040008FFC4013F000001050101
          0101010100000000000000030001020405060708090A0B010001050101010101
          0100000000000000010002030405060708090A0B100001040103020402050706
          0805030C33010002110304211231054151611322718132061491A1B142232415
          52C16233347282D14307259253F0E1F163733516A2B283264493546445C2A374
          3617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F556
          66768696A6B6C6D6E6F637475767778797A7B7C7D7E7F7110002020102040403
          04050607070605350100021103213112044151617122130532819114A1B14223
          C152D1F0332462E1728292435315637334F1250616A2B283072635C2D2449354
          A317644555367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5
          F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA000C0301000211
          0311003F00F5373DAC6973C86B4724980B36EFAC1875B8ED06C630C5960801B0
          373B9FDD6A9F50E976676554E7DC5B88C1FA4A9A48738FE686BDBF41AEFF0008
          EFE7162E75955F90DAA8603431C2BC6C7600379077447D1DAF7B7D4B3FE0BF9C
          55398CB92263189E194E5C3003D739447CF2FF0017F47FE7B2E3844D93A888B9
          741FD576F37AC538C432B6FAD6182E6CED0D075F73A3E97F210B2FAED4CAEB18
          C03ADB5BBC07FE688DDEE68FCE58D9B4BB0EDF4DE4E4E75847A9B7F3AC7FBABC
          5A03BE8D6DFE72CB5FF4FF009EB7E827C8C6B287B712B70B7A85E5ADB6C03DAD
          79F732AAFF00EEBE2B37E459FE97FC228259F9827281202E51C58F87FCF7E963
          84BF4B87FCB65FF57FABFEA3C4318E1B1D0CE57FB9FBD2FF00B88BD174BCD766
          E28B9C00707398E8E0969DAE2D56D6574ECEC1A0B7A6D13E963D448B8910434C
          5B6BBFACF77F39FE111B1BAC63E465FD998D70904D6F3F9DB7E9FB7E9355C867
          C758E3EE094A77189EB90E3F9E5FF358A5097A8F0D56A7FABC5B24EA1D53A7F4
          CA9B767DECC7ADEED8C73CF2E82EDA3FB2D44C2CDC4CFC66E561DADBA87CEDB1
          BC183B4AE03FC61F50395D5E9E9D5F186C977FC6DF103FEB74B6BFFB791F27EB
          0E6FD5BAB07A574EAE97BDD4B6EC83635CE76EB5DB6963057655EFF499F9DFF0
          6ADFB5718D7CD2B3E1C2C1EE6B2BF963A7F84F7E92F3EBBEBE7D60ABA956DB71
          69AB1DE58E18D0E73CD561F6BFED01FB77ECFCEF4BD357FEB17D78CAC6CF774D
          E914B1F6D702EBAD9203C8DEEAEBAD8E67F34DFE76C7D9FC843DA969B6A38AEF
          4E14FB91D77D0D6CF4DD47ABF4DE96C63FA8643319B692DACBCF240DC6158C7C
          8A32A8AF231DE2CA6D687D6F1C107505795F5DEA7D5BAC66E362753A9B4E4E2C
          D4E6301009B0B2C759B1C5DB3752DAFF003D74FD47AAF5FE8E28E97D3301ADAA
          AADBEA66DFAD6E7B86F7FA4D63EBDAD638EDDF67E7FF0082FF00088CB100222C
          59049D7D35D10325D9A3434DBD56F62A8752EBBD23A5BD8CEA1955E3BEC05CC6
          BCEA436038E9FD65C9F4AFAEDD60F58AF033DB8D93539FE9BEDC69D0C4EFADE1
          F6576B1BF45EAB75BEA15F57FAD8703EC74DF5D3637185D0F174375B9ADB059E
          9B7664BDECAFF4490C4413C5B08F1E9FBAAF7011E9DC9E1D7BBE86D735ED0E69
          96B84823B854307AFF0048EA193662E1640BADA490FDAD76D969DAED96B9BE95
          9FF5B7AE73AD759EBD55F674AC2E9F563F4F634D1EBE66ADB1B1B1CEDCCB6B65
          7539BFBFEFFF0008FF004953FA95D6DD5F54FD96EC5C66D6F0E6B6FC60410587
          DADDC5CF6BF19DFE0FD3D880C7E927435AE8764F1FA80D7EC7FFD0F4BEA6FB6B
          C0B9F54EF0DE47207E7B87F558B3BEAF74F201EA390C2DB2C1B31AB7082CABF7
          8B4FD1B723E9BFF91E9D6B6D251FB5139465366423C11FDD8FEF18FF005A4BB8
          CF0F0F4BB2D738388730671AC1C96B7636C33A03CED1F4777F2D67B3A758CEB4
          6D7D46CA2C6D8E161221A5FB5A58E6FE73BF37FA8B6124658E3231246B02651F
          F0870CBFE920488040FD2D0BCEFEC2CD7E4DAC7BC63610326E6906D7B44B9AD6
          E9B69D93F4DFBFFE0D37487E255D45F6B9CDAAB0DF4B15849261C6773899FCC6
          55EFB3E9A275BEA40FAB483FA0A44591F9CEE76FF2BFABFBEAE74FE918ECE9A2
          9CAA9AEB6F1BF24FE717BBDCE6EF1EEFD1FF0036D5571C01CB58408C708F9A57
          3E3C93F48FD2FD0C7F2FFB565948F0FAC9267D07A78623FF00427CFF00171337
          AA7D693665D3655F69C97BDC1E356B418630FF00C5503FE82B35E264F55FAE96
          3F2687D75BEF706B5CDDBFA2A87A35E9F9BFABB37AF49000E125A272937A0171
          E0FF0005AA31815A9D0F17D5F37AB1B2BA9FD777DB9343D959C83B5AF6C7E8E9
          8AAB11F9BFA0AFD454BD3EA9D27EB1DD6D989EBDE2FB1CC16C8ADFBDE5F55FEA
          37FB162F554B6B4998123828FBC75D0510235E015ED0EE77E2B7CCFA161F51CD
          FACCFC8CEA89C99B2F707B4B5A6C68F6321DF42AF6D757BBFC1AA143337233DE
          FEB3877E766D8E0032E76D68B27DCC78736CDB4FF231D9F43D952F5B4B6B6774
          09F1EE97BC75D06A00EA28455ED0D353A127ED7CCBEAAE16437AADD95918EF16
          6256FBC501BB4B9CC97FA75307FC28AD8DAD37D57C2EA8EBB3F399539DD469C7
          B2EA43C03BAF7EE33EEF6B9DEABB733FA8BD3D240E5278B41EAAFF009BD14318
          15A9D2FF00E73E43854DF6D961C9C1BB3F3DD26A76438B86E0266DAEC0FB2E7E
          EF77A6CFE73E87E8D8B7BFC5EF4E78CFBF22F6398FA580343841F77B67FF003E
          2EFC35A0920004F2524A594C8114071577E8A8E20083774FFFD1F55492492529
          45DBB69DBA3A0ED27C549240ECA79AE9FD36FC9CE6B722A7578F88EDF617823D
          4B796359BBF9CAD8EFD2BECFF89AD74A924A1E57DBF687B7757AF1FCFC5FD7E1
          FEAFCBFEAD7E5E2E23C55F4D94924929D6292492494A4924925292492494A492
          49253FFFD93842494D042100000000005500000001010000000F00410064006F
          00620065002000500068006F0074006F00730068006F00700000001300410064
          006F00620065002000500068006F0074006F00730068006F007000200037002E
          003000000001003842494D0FA00000000008DA6D6F7074000000030000000100
          0000000000000700000000010000000000000000000000000001000000000000
          000001000000640000000000000000000000000000000100000000FFFFFFFF00
          00000004FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF
          0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
          FF000000FF000000000000000000000000000004580000001000000001000000
          00000E54617267657453657474696E6773000000140000000054726E73626F6F
          6C010000000B7A6F6E65644469746865724F626A63000000010000000000095A
          6F6E6564496E666F000000040000000D656D70686173697A6554657874626F6F
          6C0000000010656D70686173697A65566563746F7273626F6F6C000000000566
          6C6F6F726C6F6E6700000000000000096368616E6E656C49446C6F6E67FFFFFF
          FF0000001B7472616E73706172656E6379446974686572416C676F726974686D
          656E756D0000000F446974686572416C676F726974686D000000004E6F6E6500
          000011636F6C6F725461626C65436F6E74726F6C4F626A630000000100000000
          0011436F6C6F725461626C65436F6E74726F6C000000020000000C6C6F636B65
          64436F6C6F7273566C4C73000000000000000C7368696674456E747269657356
          6C4C730000000000000012726564756374696F6E416C676F726974686D656E75
          6D00000012526564756374696F6E416C676F726974686D0000000053656C6500
          00000A696E7465726C61636564626F6F6C000000000F646974686572416C676F
          726974686D656E756D0000000F446974686572416C676F726974686D00000000
          4466736E0000000A6175746F526564756365626F6F6C00000000187472616E73
          706172656E6379446974686572416D6F756E746C6F6E67000000640000001572
          6F6C6C6F7665724D617374657250616C65747465626F6F6C000000000A66696C
          65466F726D6174656E756D0000000A46696C65466F726D617400000003474946
          0000000D64697468657250657263656E746C6F6E67000000640000000C6E6F4D
          61747465436F6C6F72626F6F6C00000000004D7474434F626A63000000010000
          0000000A4E6174697665517561640000000300000000526420206C6F6E670000
          00FF00000000426C20206C6F6E67000000FF0000000047726E206C6F6E670000
          00FF0000000A7A6F6E65644C6F7373794F626A63000000010000000000095A6F
          6E6564496E666F000000040000000D656D70686173697A6554657874626F6F6C
          0000000010656D70686173697A65566563746F7273626F6F6C0000000005666C
          6F6F726C6F6E6700000000000000096368616E6E656C49446C6F6E67FFFFFFFF
          000000056C6F7373796C6F6E6700000000000000147A6F6E6564486973746F67
          72616D5765696768744F626A63000000010000000000095A6F6E6564496E666F
          000000040000000D656D70686173697A6554657874626F6F6C0000000010656D
          70686173697A65566563746F7273626F6F6C0000000005666C6F6F726C6F6E67
          00000000000000096368616E6E656C49446C6F6E67FFFFFFFF0000000F776562
          536869667450657263656E746C6F6E6700000000000000096E756D436F6C6F72
          736C6F6E670000010000000000436C72544F626A630000000100000000000A43
          6F6C6F725461626C65000000020000000769734578616374626F6F6C00000000
          00436C7273566C4C73000000003842494D0FA100000000002D6D736574000000
          10000000010000000000046E756C6C000000010000000756657273696F6E6C6F
          6E6700000000003842494D04060000000000070005000100010100FFE1124868
          7474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F7870
          61636B657420626567696E3D27EFBBBF272069643D2757354D304D7043656869
          487A7265537A4E54637A6B633964273F3E0A3C3F61646F62652D7861702D6669
          6C74657273206573633D224352223F3E0A3C783A7861706D65746120786D6C6E
          733A783D2761646F62653A6E733A6D6574612F2720783A786170746B3D27584D
          5020746F6F6C6B697420322E382E322D33332C206672616D65776F726B20312E
          35273E0A3C7264663A52444620786D6C6E733A7264663D27687474703A2F2F77
          77772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D
          6E73232720786D6C6E733A69583D27687474703A2F2F6E732E61646F62652E63
          6F6D2F69582F312E302F273E0A0A203C7264663A4465736372697074696F6E20
          61626F75743D27757569643A39376230346432352D346635302D313164392D38
          6534382D666261663031663564323132270A2020786D6C6E733A7861704D4D3D
          27687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F
          273E0A20203C7861704D4D3A446F63756D656E7449443E61646F62653A646F63
          69643A70686F746F73686F703A39376230346432302D346635302D313164392D
          386534382D6662616630316635643231323C2F7861704D4D3A446F63756D656E
          7449443E0A203C2F7264663A4465736372697074696F6E3E0A0A3C2F7264663A
          5244463E0A3C2F783A7861706D6574613E0A2020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020200A202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020200A20202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          0A20202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020200A2020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020200A202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020200A20202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020200A2020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020200A202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020200A20
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020200A20202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020200A2020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020200A202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020200A20202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020200A2020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020200A202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          200A202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020200A20202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020200A2020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020200A202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020200A20202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020200A2020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020202020200A
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020200A202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020200A20202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020200A2020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020200A202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020200A20202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020202020200A2020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20200A2020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020200A202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020200A20202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020200A2020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020200A202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020200A20202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          0A20202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020200A2020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020200A202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020200A20202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020200A2020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020200A202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020200A3C3F787061636B657420656E643D
          2777273F3EFFEE000E41646F626500644000000001FFDB008400040303030303
          040303040604030406070504040507080606070606080A0809090909080A0A0C
          0C0C0C0C0A0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010405050807
          080F0A0A0F140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108
          00A201FB03011100021101031101FFDD00040040FFC400AE0001000202030101
          0000000000000000000007080506020304010901010002030101000000000000
          0000000000050602030407011000010303020305040705040904030000010002
          03110405120621310741516122137181140891A13242522315B16272D2248233
          4316C192B2C25363739455D1F193346425181100020201030302040600070003
          0000000001020304111205213113415161223206718191425214A1B1D1622333
          15728224FFDA000C03010002110311003F00BFC8020080200802008020080200
          8020080200802008020080200802008020080200802008020080200802008020
          0802008020080200802008020080200802008020080200802008020080200802
          0080203FFFD0BFC802008020080203A5F756F19A492B5A7B89016A95D08F768C
          D41BEC8ED6BDAF01CD20B4F2216C4D35AA316B43EAFA7C080F3DD5F5AD9335DD
          4AD8DBCFCC405CF7645752D66D23642B94FB23C563B8B1590798E09DBAC1A692
          454FB1726372545EF48CBA9B6CC69C16AD194041150A4CE63EA035DCFEF0C661
          1858E77AB706A031841A1F155EE4B9BA31168DEB22431F0A76FE04737FD41CCD
          D487D32D6421D560A715E7993F7364D92E9A244FD7C6D715D7B9B76D7DEBF1F1
          322BDA367AE927B0957EE079479957CDF54482CEC654CFA7666F2C707B439BC8
          F10ACC469F500401004010040100401004010040100401004010040100401004
          01004010040100401004010040100401004010040100401004010040100407FF
          D1BFC8020080203079BDD38BC1B1E27943AE5B4A403ED1AA85E4398A3113DCFE
          6FE276E3E24ED7D174345BCDED9DCBBFFF00D5B3E12DCF0F509ED54D9F339B9B
          2FFF003C76C7DC975894D0BFE47AB351BFCA651F3BE3B8B973DED77135ED550C
          BC9C85638CE4F54C97A6BADC538AE8CDA76A6F2B8B602DAF64D51820309F157C
          FB5B929DCA55CDEBA7620794C78C34947D495ADA76DC42C9986AD70AABF90461
          B706EAB0C15BB9CF7892E8706C20F1505C9F314E1C1B6F597F13BB1B12773F81
          0EE73705F66EE5D35C487D2AFE5C7D802F21E4392B72E6E527D3D116DC7C68D5
          1D11E0B3BA9AD2E639E2710F61045172E25D3AAD8CA3DD3365D052834C977666
          E71986BA07BAB247C1DED5EFB8F639D7193EED1439AD24D1CB776F2B6C443259
          DABF55F914E1F76AAB3CD73B0C68B841EB3FF224F0B05D8D49F62217BE5BC98C
          F72FF348EA9738F327B979A63625D9B636FF0039162B6E8511D0EA9835AF21BC
          82E6CDAE15D9B60F548DB44A528EACE0DBF7D95CD97A6EA17CD4A787057AFB41
          3D2641F2FDD161F0D299B1D03DDCCB457E85E90578F7A0080200802008020080
          2008020080200802008020080200802008020080200802008020080200802008
          0200802008020080203E1200249A01C49280C1BF7B6CC89EE8E4DC58C648C3A5
          EC75EDB87023B082FE0B6F8A7FC5FE86BF243DD08F7AECD9646C516E2C63E579
          0D631B7B6E5CE71E00001FC4A78A7FC5FE83C90F74670104541A8EF0B51B0FA8
          0FFFD2BFC802031D93CDE37111FA97B3060EC1CCA8FCBE429C65AD92D0E8AA89
          D8F48A23CCB6FBC865B5DAE2C7C340D3E6BA269401516FE73233A5E2C75A7FB8
          9B8615742DD63FC8D0F299EB0B69CBE37BF2B923C093C5B55DF8BF6D272565F2
          7391CF6F24F4DB05A23B7098FDC591D797CA136D61002F8E11E504F60A2B0654
          6BC3C69382DBA223EBDD758B5EA79A579964748EE25C492BC3EDB1D93727DDB2
          EF08A8C524613239298656C71365533BDED7CB4EC1D817A6FDAD81E383B5F791
          59E52FDD2D8BD09E9FB923DB581805C51F7CE60D111F676AB072DCBD7850F797
          A23871712573F811464B213E4EEA6BEBB7805C4BDC49A35A178FCDDD9F7B696B
          2916D5B31E1EC91E589F05C406781E1EC074EA1C89F05239BC4AC5A54A6F49BF
          DA735198EDB348AE82BA4177E104FD0A338FA9D97C62BDCEAC99EDADB32FB5EF
          A7DB78996EEBFD7DE3898DA7EEB4F6AF4DE639758552AE0FE72B58589E696E7D
          8C2E6331158C6FCA65642F92424B195F3C8E54AE338BB73EDDF3FA7D59359595
          0A23B63DCF3E123C85F33FCC396698E0269656DC8781A2B9F296D5C6E3ED82EB
          2E842E2C259366B27D8F638EA713DE792F287ACE5D3BB2D9D228C259BA4CDEF0
          B6B1B6F3436846B2396AED5ECFC0617831D6AB46CA6675DE4B1FB16931709B7B
          18623CDAD015948F3D880200802008020080C6E7F2D0E0B0990CC5C38361B182
          49DE4F2A31A4ACE11DD24BDCC672DA9B3F3AF37D40DD993CBDF6423CE64228EE
          A7925646CBA998D6B5CE240003C000056F8530514B4456656C9B6F56783FCE3B
          BBFF003F92FF00BC9FF9D67E287B2FD0C7C92F764D3D06DD197C7DD5D67B3595
          BCBC8E51F0B6B0DC5C492B35120B886BDC4554172538C5A824B52530549EB26C
          B7D8ABD37F671DCD29AC02A1C963DC80200802008020080200802008088BE62F
          774BB5FA7F3C36772FB6C8E49C2082589C592340A171696904290C1AB7D9D7B2
          38B2ECDB0E9EA527FF0038EEEFFCFE4BFEF27FE7565F143D97E8417925EECF6E
          2771EF1C9E4ED6C199FC956791AC27E327E009E3F7FB96AB235C22E4D2E9F032
          84A72696ACBCBD3DDD2CC8DA5BE2E391F30B48D90BA5792E738B450924F124AA
          8396E6D9668AD124486BE190401004010040101C259190C4F95E68C8DA5CE3DC
          1A2A5103F3DBA8BD4ADC59EDE796C963B337B6D60F98B2DE182E658A311C7E51
          46B5C0762B7518F18C12696A56AEBA529B69B356FF0038EEEFFCFE4BFEF27FE7
          5BFC50F65FA1ABC92F76583E816E7C962AC64C966725757D71967FA56D1DCCF2
          4C1B1C4EA1203DC6952ABBC8D91F26C8A5D099C18CB6B937DCB556539B9B68E6
          3C35005461227A10040573F984EB8330304FB2B6B4F5CCCCD02FAF633FDC31DC
          D8D23EF1FA94C61626EF9E5D88CCBC9DBF2C7B953B196397CE5D982CCBE599DE
          796473C86B413C5CF71E414D5D6C2A8EE93D1111084A6F444CBD3AC660B6EE4A
          19E16BB379F141EBBC6AB784F6FA6D3CCFEF155BBF3E57748F4893946228757D
          596EB6C5C5EDCD9325BC147B85685709DC67901FFFD3BFC80D1B796F6FD2A965
          8FA3AEDC3CEE3C9A0AA4F39CFF00F5BFE3ABEA26B0703C9F34BB114E5332C8E3
          764737747D22496C64D5CE3DC02A7E0F1F91C8CF74DBDA4B5F915E32D22BA982
          B39B706F39DB678B85D6B8A069C38170EF257A86071B562C36C57E6562FC895A
          F564CBB4BA678EC5C0C92ED8249E80B8BB8F152C731E3EA2DFDB5B360C3D910D
          0DF3CA19D94EC2BCDBEEDCE5F2D317F1658F8AA3BCDA235BCBB8AC6D65BB9CD2
          38C57DA7B07BD5378CC19655CA2BB7A92D957AAA1A9C760E39A26B8DE1991C5E
          49B68DDDA7B005EB79797571F8FF0082E88AA534CB22C33199CC4990924C8E4A
          4115B46399FB21A3900BCC1472395BF52CCDD78B59A2C526577D64D98BC4B1D0
          E1D8FF00CD93F181DA4AF4CE3789AB0E1AFAFB959C9CA95CFE06E7776B0634B7
          196B4305A80D0E1DAEA713F4AF34E7B31DF92D27F2C7B166C0A7C75AF767187D
          36D5F20A8EC1DEB2E36C86241DD2EEFE930CA8CAE96C5DBD4E8C8E4ADF1F6AEC
          95FBBF2C54450F6B9C39003B96FE3B8FB791B7C93FA7531C9C8863436C7B98BD
          A5B5723BE72FFAD6601663613AA38CF06868F05EB15535E3D7A25A2455652959
          2EBDCDA3357714D71F0F6834D95BFE5C2C1CB870AAF19E67907977B7AFCABB17
          2C3C755412F535DCC6463C5D84B74F347D0B611DA5E792DDC171F2C8BD3D3E58
          9AB3F215706BD59B4F44F6AB887662E9B59653AAAEE7C57B5C568B429A4F6050
          003905903EA0080200802008020218F998DD51E07A75738A6BA9759B22D582B4
          3E9821CFFA948E057BACD7D8E1CD9EDAF4F728BAB415F0012401CCF2404FFD3A
          C0B9D3E1B114A989A269C0FC721D46BEC54BC9B3C974A45971A1B2B48B898CB6
          169650C2D14D2D0B51D27B10040100401004010040100A8401014DBE6C3740C9
          6E8C76DE85DF938C89CF9403FE2C87FF0040AC5C6D7A45CBDC83CF9EB24BD8AF
          2A5C8D36FE9F5917E4E6C93BEC5944E2DFFA920D2DFF004A87E56DDB56DF591D
          F850DD66BEC5C6E8B610DAE285E483CF2F9AA7C55752D113E4B4BE8080542015
          080200802030BBBADB2779B67296586731992B9B6921B77CA48635D234B6A69D
          D55B2B694937D8C2C4DC5A5DCA3397E8A66B0B2FA57B91B6F57EF0607BB8FB54
          D4B96AD7A321BFF3E7EE8C44BD36BC8985E72109A76063D63FFB15FF00167DFF
          00CF9FBA25AE9360E5BDC9D85A8638DA63D8236B88A026B527DE4A85B27E4B1C
          FDC97AA1B20A3EC5B8B6884303236F26801626C3B501AFEF48B72DC6DFBBB6DA
          93C169979985915D5CEAD3103CDC0341E3DCB6D4E2A5ACBB1AEC5271F97B94CF
          39D11CBE32F9F739ACBB6F9D23CC9726063DD2BDC4D4F17F6952B3E5A315A463
          D48B58126FAB33380D859DCEBA3C563AC8E3B0AC3C5A051D21ED73CF324A849C
          E56CB74DEAC94AEB8D6B48962B6374AF15B6EDE37BE20EB802A5C454D57D3612
          3C71B226863051A390080E480FFFD4BFC80873A878F658CE6FDDA8B40F3002A4
          D150B94FB725916A9C1FE24E63722AB8E8D1166070592DF9B85AFBB8DD1E3617
          698A23C0502B5E061471AA50891575AEC93932CBEDEDAF8FC1DAC7141135AE68
          1C40524683DF9AC8B3138D9EF5D4AC6DAB4779EE5C19F94B1A9958FD0DF455E4
          9A89005EDDC97D772DD4A497CAE2E35F12BC1AFBA5758E6FBC997A84142292F4
          30F71623357D158BC91636C7D5BB77657B02F45E1AA8E062BBACF5EA56F326F2
          2D508FA1B0DDDD40DB6124B4B7C3D98A46CE5AA9DDE2542A8DFCC646AFFEB4CE
          ED61875FFB8D42DF179AEA1E49B040C741858DD46C638022BCCAF4BC2C0AB1A1
          B608ADDD7CAC7AC992E3F138DE9FE05B6D6AC68C94ED001A0AD0F32A23EE0E4D
          62D3B57D523B3031BCB3D5F64686E717B8B9C6AE26A4F895E32DEAF565C743A6
          EAF2DAC6DDF7776FD30462A7BC9EE0A6B8FC29E6DAA2BE9470E45F1A23AFA987
          DB987C8F50B351CF346598A85DF951FDDA2F66C2C386356A11453EDB6564B564
          DD9D6D96D3DB9FA75900CB9940682DEC1DAA0FEE3CF5463B8AFAA477F1F46FB3
          57D91177126A799E24AF1E841D92497765BA52515A9AA476D36F3DD30E3ADC17
          585A3B492391757895ED9C2F1EB1684BD5949CCBDDB3D4B4FB670D0E1B1B0DB4
          6D034B402AC0711907646C593FC33A7609FF00E1970D5F42E67955296C725BBD
          8D8AA969AE9D0F4820F25D26B3EA0080E86DEDA3A5F45B330CBF801155A15F5B
          96D4D6A66E124B5D0EF5BCC020080A67F365B91993DDF8EC1DBBEB162ADDDEB3
          41A8F5A5757EA002B1F1B5E906FDC83CF9EB24BD8AF8A588D329B731E7279AB3
          B5FF000CC8D74BFC0C3A9DF505CD936F8EB94BE06DAA1BA6916CBA3589F8DCAC
          F93733C81D467B07254C8762D3A687B7AF5D68CE74EF218FC46DC6C0EB8963F5
          6E4CC0BC81D80004298C2C48DA9B911D9592EB69221CFF00FAA3A95DD67FFC47
          F9948FFE755F1387FBD6122F497AE9BB774E4AF6F375DC595A6DBC6C2E92EA5D
          3E99D54F28049E3EC5C1978D0AD251D5C99D78F9329B6E5D91E1DF5F362F8E77
          D96C6B26BE361A1C85D8AB5FE2C60A11EF5B69E37A6B36616E7FA4487F21D77E
          A8DFCDEAFEBF3C1C49D10D1ADE27BA8792918E1D4BD0E279563F5331B5BE63BA
          8582B985D90BD7652CC11EB473F17B9B5E343C0556AB302B92E8B4338664E2FA
          F52E1EC6DFB8BDEF84B5CBD89D22E1B5744482E63C7369A772AE5B5BAE4E2C9D
          AEC538EA8DB56A361A5F50BA9FB63A718E3799A9C3EEDC3FA7C7C4419E43E03B
          07895D3463CED7A2345B7C6B5D4ABDBA7E6A37AE5A5923C0431626C4D741A6B9
          E9E2EE4A6EBE3A11FABA9133CE9BEDD0D1A3EB7F5419702E0EE2B97D093E9B88
          D06BE145D5FD4AB4FA4E7FECD9EE4B9D33F99FBE174CC66F8A3EDDC28DBF6F02
          08FC55E6A3B238F5A6B03B68CD7AE92207EA06E17EE8DE196CD39DAE3B8B890C
          27FE5EA3A7EA52B443641223AD9EE9B66B4B79A8963A7B8970C65AC5A7F3F257
          1EA1EFF499403EBAAAAF2566FB947D2289DC18690D7DCBB1B4AC198CC24119A3
          03580B89E0000170122463D49F990DAFB32797138767EB3988C96C9E8B808227
          7EF3BB7DCA4E8C09D8B57D11C1766461D175640F98F9A0EA4649CE16B2418F8B
          8E91033CD4F124A948F1F52EFD48F966D8CD5AE3ADFD51B899D37F98EEA3D5F7
          184068F60A2DEB12A5FB4D2F26C7EA2DFADFD50B7944A7715CC94FB8F20B7F62
          3C3A9FED0B26C5EA6D182F99BEA262E606FA68F216E4F9DB28F353C0AD13E3EB
          7DBA1BA39B35DCB45D32EAD617A8B8A1756E3E1AFE2A36E6D5E41735DDFC3B0A
          81C8C774CB464BD17AB16A891010454725CC74104FCC0758F2DD3C97178BDBA2
          175FDCEB96F3D61AC088001A000452A54A6162AB7572EC47E5643AF448AFD75F
          301BBAF5E64B9B2C7C8F3DA613FCCA41F1957C4E1FEF5867362751F37BCB7359
          626FEC6C22C6177A97D2B222D73616F3A1A9E2572E4E1534D6E5EA6FA32ACB26
          916A767E17070C7F138C8DA01E35680A14973DDBCB7D6DBD898C764F70DE3608
          E87D2841ACB23BB035BCCADD5532B1E9146AB2D8C16ACACDBA3E6DB3B733BE3D
          A98C8ECED79364BBFCD908EFA368029AAF8C8AFA99153CF93FA511DE4BAFFD50
          C8B5EC39992DC3C83F9203694EC15AAEB8E154BD0E679763F530727557A8129D
          52672779EF7683FEEACBFA54FF001463FD9B3DCCB637AE9D44C608C4392D619F
          8DA3CDEDA5160F06AF63259762F5268E9AFCD04D94C94187DE36EC88DC111C77
          90D1AC0F2786A078F151F91C7ED5AC0EEA33757A48B316B7705DC62585C1CC70
          A8238F050A4A9DE80FFFD5BFC80C6E4F0B65958CC772C0E07BD01D189DB58DC4
          71B589AD3E0101994044BD46CFCB717C7130BBFA78802FA7692BCA7EE8E4A53B
          7C317F2A2D3C663251DEFBB34689A1CF15E4AB3C6D509DC9CDF48F52472A6D43
          48F7677C4D898D918C222B4075DCCA799EDE254EDD9177257786BE95A382BAA1
          8B0DF2FA8C3C36979BEB2F1D8D987330F6EEA00393A9DA57A6E061431AA508A2
          B77DCED96ACB01B5B6BD8EDEB16451B1A1CD02AEA2916F434117EF5CABB279A9
          78D638098D9EC0578973F98F2329FB47A175C0A7C752F89ADBDEC8D8E924706B
          1A09738F200285C7A2574D422BAB3AECB1423AB34F863BCDFB9E8F1F641DFA54
          0FA547271AF1257B5711C6C712A4BD7D4A5E5643BA7AFA167B6A6DAB0DB18A65
          1819E9B2AF753B829B9CD422E4FB239126DE888CF76E74E672523A33FD3B0E96
          0EFA76AF12E6B917957BD3E945D70F1FC50EBDCD1F7264FF004DC73845C6EAE3
          F2A1039F1E6548FDB7C779ADF24BB44E4E4B236476AEEC917A2FB3C59D88C95C
          B3F3E5F392471E2BD792D1154378DE1BC62C2C46CEC9C1D7AEE069F715479CE7
          238B1D90EB3FF225B0B05DAF5976228665A7F8F394BA94BA5655EE793DC179CE
          05B6DF991937ACB52C39118D74B5E84A9B0F733B705A9949A81C015EE71EC525
          9B8CB2C7046E965706C6D15738F2A2F939A82D5F44126DE888EF75F50044E759
          61DE1C69474E397B979F733F72ED7E3A1FFF00627F0F8ED7E699A05B65EFE2BD
          6DD89DDEAEAA977B551B1F36E8DCA6A5D75272CA60E0D69D096368EE866603A1
          73B54B1F071F10BDDA89B95716FD51469AD24D1B72DE60755CCF1DADBCB73338
          362858E91EE3C835A2A57D4B53E37A1F9A7BDB3936E3DD998CCCEF2F3757733E
          327B23D6740FA15CE986C825F02AD64B749B302B69ACDE7A77655F8FC891C58D
          6DBC27F7E43534F70505CB59A4630F724F021AC9BF62E7749B0EDC56DF64F20D
          24B75B89F65541A44D94EBAD7B91FB9BA8795BBD7AA081FF000F07706C7C15BB
          12BD95A456B267BA6C8F5759CC7AA2B8BE921FD3E073DD0BDDA8DBC753A9C3B4
          81CCAC1C629EE6649BEC76DDE172D611367BCB396089DC9EF6168FAD610BA127
          A2699F5C24BBA3C0B71804058EE81E66E71D8CB586BA5B35CBC31BDED14E3F4D
          555B917FF3E9F027B07FEB2C27533A8F67D3BD9D26727025C84ADF4AC2DAA2AF
          99C38123F08E6569C6A1DB3D3D0E8BEE55C752816E3DC999DD9969F379DB975D
          642E1DA9EF3C80FC2D1D80772B5D75C60B45D8AE4E6E6F566296C3032D69B673
          D7D6FF00156D6133E0E61FA0D08F0EF5CD3C9AA2F4725A9B6354DAD523192C52
          4123A29986391A68E6385083EC2BA134D6A8D4D68705F41D96F0BEE278A08C55
          F2B9AC681DEE345F24F45A9F52D5967BA65826DD6E1B78236D6DEC18C887755A
          055519C9CE4E4FD596AAE3B6291B27CC775173380C641B376C3268EE6ED95C8D
          DC51B8E9808E0C6B87227B54C6051193DD238332E715B6253D9239DAE2E958F0
          E3C497020D7DEAC29A21343DD84C1DEE76EBE1AD006B58354D3C874C71B3BDC5
          73E4644298EE91B2AAA563D11B95874FB1375236DFF52966949A174515583EB5
          092E5E5E91E849AE3FDD9ADEF2DAB73B472E71970FF50398D9A27D29563C5457
          C54CE264ABE1BBB11D7D4EB9686BEBACD04ABD0BCC5CE27397D244690985A5EE
          F10EA003DB5509CAE9B23F8927C7FD6CBC9B7AFF00E3F170DCB8F36824A8126C
          A17D72DC6FDC9D4BCDDC8935DADB4DF0B6DDC19080D34F69055B70EBD9522B59
          33DD6323A5D87312474D6DA682CEF2F231A67BC962B585DDBA5B573E9EDA855C
          E5ACD65182FC498E3E1DE45C5C15E47B33634998BE63E56DB43EA18D80B9EE75
          38003C4A8CAE1BE49127396D5A947F7EEEADD1BDF3D719ACF898B9CE70B785CC
          73191455F2B5AD23870E6ADD4D70AE3A44AD5B394E5AB353D2EAE9A1D5DDDABA
          0D26E38FD8B58229F35782CDF300E8ED58DF526D27B5C38695097F2B184B6C16
          E246AC19496AFA193CB74CC41B7AE73D8DB89258ECC074D1CACD074134A8EFE6
          B1C6E4DD96284A3A6A657616C8EE4C8E94E9187385EE8E68E467DA6B839B4E75
          06ABE3EC7D45EFE946E39EF2182CAE0FE63628F5347204B4705477F53FC4B543
          E944BA8667FFD6BFC8020080F0666FE2C6636E2F263A58C6915F1228170E764C
          71E994E5E88DF456EC9A8A2BF5DDC3EEAE659DEE2E73DC4D4AF03BAC764DC9FA
          97B8476C523A2A00249A01C493C80094D52B64A31EE7C9CD416ACD7DD7D77BB3
          20DC0E1EA2C98EA4D2B7EF9ED5ED1C2F1B1C5A574F99F72999992ED9BF62C26C
          5D9B6DB76C236E81EB10351EDAAB11C26C79B91D0E26EE48FED3627114E75A2E
          1CF938E3CDAEFA337D0B5B12F895EE47BA491CF7F1738927DA5780C9CA72F8B2
          F8B448D3772646E32B791EDAC492E7C840BA7B78FF006782F53FB738854C3CB3
          5F34BFC0AAF2397E496D5D913D74BF60DB6DDC7452C918F887005C48E3557921
          8CEF5032E71B8736F09A4B39D14FDD2AA5F72E6BA31F6C7BC895E369DF66AFB2
          218E6BC762B57A16F6F4460EC31AEDD1BCA2B6FB56B664369D95078AF71E1711
          518F15EA51F2EDF258D93D6573D65B4716CC75A8FEBCB006329C0022955CDCD7
          350C38B82FAD9BF0F0DDCF57F4914DECB717170EB8BA3AA597CC49F15E41932B
          272DF3EF22DB5A8A5A47D0D6B735F3E1B78F1D6C355D5EB83001CC32BC55D7ED
          6E3DCA5E697A7620F94C8E9B1133EC0B7B5DA5B6A2B9C93FD32E68343CC93E0B
          D0F2B36AC686EB1E8881AA9958F48A305BA37A5E666575BDAB8C566D2400DE05
          C3C579472FCF59952DB0E91FF32D589831A96AFB9AA18DFA7511C1417F4ADD9E
          46BE53B7CF0DDB75EA75BE41146F94F28DA5C7FB22AB2E3A9F2E4463EECF9933
          D95B66D3D17F88B97CF772574BDE48FA57BDD50D904BD8A2C9EAF526F5B4C48C
          7AFDB8DFB6BA6396B981E197577A2CE135E3598F1A7B815DB855EFB51C9953DB
          5B3F3F89A9A9E655B0AE0404D9D3CC339F6D86B00DF3DCBBE2A61FC67CB5F72A
          86759BEF7FEDE85870E1B6BFC4B4BBB32716CDE9BE42FCB846E8AD8B23ECABDC
          2802C2886F9A46FBA7B60D9F9E7733BEEAE25B994D6495EE7B89EF71AAB8A5A2
          2B0DEA75B5A5CE0D68AB89A01E257D3E12AEDAC1DC6361B5B1C5C1AB70DEB43E
          EE770D4E85AEE4C6F770E6AA19B932BAC714FE55FE2583131D423ABEEC95331B
          06EF11D3DCBDFEE19F5B1D012DF578D243C452BDAB4E2D7A5B1713764E9E37A9
          554F3E0AEA564FAD697B835A2AE71000F128C1657A578870CAE2F1D1B785AC6D
          74BFC6EE25526EB3C96CA459F1E1B6091A37CC2EF59772EF7B8C443257198373
          ACE200F95D230D1EEFA5597069D95A7EAC85CCB774F4F44444A44E236FD9987B
          79193E72FA213C16AE115B5BBBECC9391515EF0DEE50BC9E53AD2847BCBFC891
          C3A14DEAFB2273D91D3BDCBB89CCCA5ECCF8A23C591B7CAD0DEC00055BF1AF52
          748DBE6076EDBEDCDDF6D6F1106E26B564B7000028EA903977815567E2DBF168
          FD19039D14A7D08994B91E6CDB12CC5CE75B33DB58ACE375C38F655BC1BF5951
          BC8DBB297F1E875E2437588B7DD11C316DBC99295BE795C5D53E2AAD15A22C64
          85BBB05FAADABC451C7EA50D647B1A481ED2167AB3E34880337B7B6ED848F766
          3358E02A6B192C7380F6059C6AB9FD3A9CF3954BBE868D799BE996343E38AF5F
          346E76A961B488B5AF23C782E9FE8645AD6FF439D64D35FD270775BF1185B716
          FB536F44C91BC05CDD9D67DBA68BBEBE297EE6689F20FF006A22CDCBB9B2BBB3
          29265F312092EA4A0A3469635A39000725315551AE3B63D88DB2C737AB30EB69
          AC947A6D62E8AC3E203489AFA76C71FF00033B7E9559E52CD6C51F626B021D1C
          8B6F95CABB6974AB2B9773B4C96B62F319269F98E6E96FD6571D10DF625F13BE
          E96D8367E7DDC4F2DD4F25CCCED534AE2F7BBBDCE352AE2968559BD4EB5F4161
          3A758033DEE1718D6708218E69C7FCC90079AFB2AA957D9E4BA52F8E859B1E1B
          6B48B770D8C6DC632D1CC6B9A18069700472EE2B59D0437BE367C42E0CD79796
          76103AA409B446081EDA2FAA33976D4D72D8BBE844F966F4E31CF69BDCADACB7
          0C3A9AEB68C48EA8FE10BAA38F94D68B5D0E495942661A2EA374FF000B3BAEAD
          F1D3E62F0F10F9FF002D95F7D4AE8AB8A9FEE7A1AE79F1F446B9BC3AC99EDD38
          F930D05B5BE331121F3C16EDF3B87602FE6A568C0AEA7AF76705B973B169E847
          0A44E332BB6EC4E4735696B4AB0BC3A4F0637895CD93678EB7236D51DD348B7B
          D16B7927BD9EE803E903A5BEC1C15323D8B4A5A13ED1660FFFD7BFC80200808C
          FA939F6BB4622D9F5A126E07EC0BCDBEEAE493D2883FFE458F8BC6FDEFF22355
          E70588D677664DCD8D985B37137D7640706F36B09FF4AF46FB638B69F9A6BF02
          B7C9E527F22262E936C1830B8E8EF2667F50F01C49E752BD2515E259000141C9
          7D075DCC6268248C8A87020858CA2A4B467D4F42BD6FEC06E086796DB0B0E813
          135900E201EE55EA780C6AED7625D59DD3CEB251DAD994E96F4B1F8C9464F28D
          D774E3A8B9DC4D7DEAC318A4B447013A471B636063451A3800B2045DD52B87FC
          5DBDBFDCD21DEF5E63F77D8F7C63E8597888ADAD91CCD27A50CB28E6C639C3DA
          0555478AA15D9318B2572E6E15368D83A29857C92CD949DBE791C5D53E257BC5
          71DB148A337AB37DDF1858AE6686F7D32F919C0D3B940727C3D5953564BBC4EF
          C6CC9D49C57A9165E57E2E469E41C40F62F23CBD2592E3E9BB42D94F4A93F5D0
          E9B7C658DB64CE62F089E76002DA1EC14EF57BB397A78FA15557596840431279
          137397447BF2195BBC951F77268B760EFA31A02A759764F23624F57AFE84D285
          78F1D4D2723BB75CDFA7EDE84DDDD93A4CF43A41E5C15D78DFB62104A56F5922
          13279394BA43B1B2E3B1191C56219365E473EFEF4EB21C7900B47DD36C6AAE35
          4569A9B38BADCA4E6CC66E0B975B62E40CFEF6622260FE2E6A1FED7C556E4393
          FDA767296B8C345EA4CBD25C51B1C0C4F7B68E7804AF5F454C91501527E6E375
          1972B8BDA313FC90442F6E1A0F0D521735B51EC0A7F8CAFA3910D9F3EAA25665
          34451EDC3D93B2394B4B26F39A56B4FB2BC56ABA7B20E5EC8CE11DD248B53D24
          C38BFCF9B9D3F936E1B147DC030515222F5D5FB96A8AD1247A7E6C372B6C76EE
          376D42FA4B7927A92B41FB8C1DAA6F8DAF59391199F3D22915015848533BB3EC
          7E3F3F6AD70AC70933C95E234C7C78FBD7166DBE3A5B3A31E1BA6916A7A35B65
          97F7F366AE59A8B9D56923B15420B44598E1F35DB9198EDB38FDB703B4CB7B2F
          A92301FF000D83B54D71B5EB272F62333E7A45229E2B110866F68D87EA19EB58
          C8AC711F5A4EED31F15C79B6F8EA6CDF8F0DD348B3FB09AEC5EDDCFEEC70FCCB
          7B795F093C388690D553A21BA497B963B1ED8B654DBFBA96F6FAE6F2676A9679
          5F23DDDEE7B892AEF15A2D0AB37ABD4F3AFA7C27BD83B645E37038F6B6B0B98D
          B89683817C9C4D7F62A6654F7DF26FD3A164C58EDAD170711636B88C646C1A62
          8A2655EE34000038925693A8FCF8EAC6EB66F2DF594CD40E73AD5D2186DF57FC
          388968A781570C6AFC75A4562FB37CDB34A5D26824CE9EE35C318660DFCDC8CE
          226F0E3A233C7EB559E56CDD6287B135810D13916BDFB9F09D26D82CCCE5CF9B
          488EDAD9BF6E6988A868FA38AE3A2995B2DA8EEB6D55C75654CDF7D6DDF1BE6E
          A4F5AF9F618BD47D1B1B5718DAD69EF70A1770EF566A712BAD76D59036E4CE6F
          BF423B73E7B878D4E7CB238D05497124AEBE88E6EE6C567B1B353B3D5BC0CC7C
          6685A6E9DA5C41EE68A951B6F254C3A6BBBF03AE18964BD3436487A7786B6DBF
          90CDDEE46495F66CD4D63181B139C7801A8F15C51E4E76D8A108F46744B09420
          E52646A69534E03B02B0116728D8E9246C6D1573C8681E2782F8DE8822C774E7
          0267CB6331C1B565946DD63F7CF13F5AA4D93F25929168A21B6091B67CD46E3F
          D1F6AE2369DBBB4BF265D2CCD07FC2834F3F7952DC6D7AC9CBD8E2CF9E9151F7
          2A1AB09086676A583725B82CAD5E2B16B324B5E5A226979AFD0B9332DF1D3291
          BE886F9A45B2E8A620DD5F5C65E56F9357949EC6854E82E859CD7BACDF321756
          57D71B636148D63ADCBA2BCCB0F31123496B9918E5C3F129FC5C04D6E9FE8446
          46634F6C0ACD93CF66B333BAE3297F3DDCCF24974B239DCFB81340A6A308C7B2
          22A5372EECFB8BC0E5B325C6C2D9F2C6C20493728DB5EF71A05AAEC8AEA5F33D
          0CE154A7F4A368C674E84F751C17F928D9AC80596C0CAF15F6D0289B397825F2
          A6CEE86049F77A18BDF582C6EDBCDBB0F8E95F3B60634CB2C940E2E70AD081C0
          290C2BA7757BE4B4D4E4BEB8C25B51ACAEE39CDE7A79646B7B9223ECB45BC47F
          7A4E74F7282E5ACF9543DC93C086B26FD8B9DD23C28C760E395CDA3DE2A7DEA0
          9136490BE83FFFD0BFC80203CF7B70DB5B49A77BB48631C6A7BC05A2FB1575B9
          3F44675C774922BDE4AF1F7F7D3DDBCD4C8E2578065DEEEB6537EACBED50D914
          8C3663290E1EC24BC978B870899F89E79052BC2F1AF32E49FD2BB9C79B93E187
          4EECECE94ECABBDC39476E0CB34B8BDDA9BABB02F6BA6A8D71515D914D949C9E
          ACB376B6ECB585B0C628D68A2DC627720080E892CEDA576A9230E3DE4203B591
          B231A58001DC101C9011CF52F1725C08AF6269739B46903B950FEE9E3E76C559
          05AB44E71790A0DC591806824B1E3CAE05AE07B8F02BCEB0AE963DF197AA6586
          F82B2B6893FA5CFB56593ADE1A6A61A705EF954B7413F745124B466F97F6CDB9
          B692323896900F714B61BE0D7B88BD1EA40798B19ECF213C7234F079A3BBC2F0
          BCFC0BAABE51717DCBBD17C2504F535EC867B138C693733874A3FC06799C549E
          17DBF7E468E5D11CB7F230AF54BA982B6B5DCDBFEEDB6D6B1BAD3135A686D454
          779EF5E9D81C6558B1D228ACDF913B5EAD939EC8E9662F6FDBB27B98C3A668D4
          E738772976D24739ADEF1C8B2FB2F24508D305B9F4E3039705E29CFE67F6325E
          9DA3D0B9E053E3AD7C4D0AFF00564F3F6187886A11B8492D3BCABD7DB386EAA3
          7BEF220792BB7D9A2F42CEEDDB31658B8210284342B911264DEF6C6C73DC68D6
          82E71F01C501F9CFD59DD07786FECBE64126132FA1057B2387C829F42B86357B
          2B48AC5F3DF36CD29749A0DC3A7D67AF21719370F2D946433FEA4B568FAAAA1B
          95B76D5B7F9121830DD3D7D8B91D18C28B3C38BB91B47C9E627DAABC913C561F
          989DCE370F50EF2189C5D6D8F02DD9C6A2A39AB560D7B6BFC4AEE5CF74C89548
          1C6483D3DB02DB6BBBFA79E72DB68BDE6AE55EE5ACD76C096C0875722E9F4C30
          E319808496D1CE682543930549F98DDCFF00E60EA1DCDBC4E2EB7C6B45BB38D4
          6A1CD5A702BDB5FE257B327BA7F8110A90388DFF00A79605B05E6429E79B4DAC
          3EF3572AFF002D67D30257021D5C8B3D798292CFA33988E28EB23AD1CF70F068
          A951D8DD2C449647FD6CA4479AB89580809A7A65D65C2ED3B5B6B7CF63A6B892
          CDBA209ADCB6A5B5AD1DA8850591C6B9D8E517DC94A335423B5A323D51F993CA
          6F1C7CB80DB56AFC4E1E6686CF33DDFD4C83B5B56F00D2BA31B0156F59756617
          E639AD23D1102A95238FAC6191ED637ED38868F69E0BE37A02C7F4CF6FFAB96C
          56280AC7631B7D4EED6E3A9DF59549B6CF25B29168A21B2091ABFCC8EE9B9CAE
          F3FD018E7371B878DB1C70D7CA6423CCEA2B271F528D7AFAB21B36C729E9EC42
          EA4CE037BE9763ED2FB2D71ADCCFD4A284BB1EC96807AB51C457B40E4A17969C
          D55A47B3EE77E1462E7D49BB09D35C45A5AC99FDF197860859F99299656F2E7C
          1B5A9F72AFD5539748A276538C56AD915F563A8182CCB23DB1B361316DFB47EA
          92E8F94DCBC70069CF48ECAAB2E161F8BE697720F2B27C9D17622A52A4799ED9
          D61F1F9EB60E158A03EBC95E228CE3FB570E75BE3A9B3A31E1BA6916DBA27873
          3CF365256F17B8907C15462B44598823E63B758DCBD46BAB689DAADB0CDF818F
          BB534D5F4F7AB66057B2BFC4AF6659BACFC0889481C46F7D3EC796C57996A55E
          48B383DB271753DCA0396B7A2AFDFA92B815EADCBD8B1F9DC9CFD3FE8DDDDED9
          831E42EE3F42290702D320A12B830EA53B12677E4D9B20D94DDEF7CAF749212E
          7BC9739C789249A92ADC56CF8C0D73DA1C68D24071EE0BE3058AC1EC27E760C7
          5A632EA2836FB6263CB9AF6B439EE035171AF3AF7AA359BE76C9CFBEA5A29518
          C16866773657A6FD29B2922B5963CCEEB0DA436D1383DB1BC8E0E91DC450772E
          EC7C195AFAF4469BF2A305D3AB2B1E42FAE3257B3DFDDBCBEE2E1EE92471E3C5
          C6AAD518A8AD115E936DEACF3AC8F84D7D3EC23BE1F138ED3E7B87FC4CC3F88F
          0FA95433ACF25EFE05870E1B6BFC4BA380B26D8E32085A29468FD8B94ED32680
          FFD1BFC8020313B92D5D7788B985868E2D34F13451DC8E3BBA894577D0E8C7B1
          4269B2BFDF96E303DD7CF6C2D8EBA8B8F72F17AF89C99D9B36BD4B8CB2EB8C75
          D4D3B1F6F75BFF007143040C70C55BBA8DE1C1D43CCFB57AEF13C6C712A51F52
          A39590EE9EA5ACDB383B7C26361B68981A5AD00D14E1C866D004010040100407
          832B8F6E42D9D09E64702BE35A820EDE3B7B3B8D749F010890BABA5F4E22AAB5
          6FDBD8F3B7C9A1231CFB1476EA6CBD21C36531F03A4C8021EF3535F15648C76A
          D111EDEA4B445450F6AC8F8475BE763CD9B6B9F68F31BDC284B5689D109BD5AE
          A66A6D2D11A5EDEE86411DC7C4648995D5AF9B8ADAA291812F6136BE37091363
          B689ADA7680B207B335791E3F1773712100358683BCD17067DEA9A2537EC6FA2
          0E73491004D29BBBA7CCE1A4C8ED447B5786C3FE7BF57D3565DA5FF1D677ED2C
          3E3F179A9B3799B86991EED4C60E269D8BD663CCE2634141CBB153FE9DB63D74
          261B1DEDB7E62206CE19C836BC96EA3EE0C4B1E9B8F93C0B62B5D0C7F55376DB
          ED6E9FE5F34D95A1EE84DBDB1A8E32CE34369E3C6AAD38B056CD69D889C89EC8
          367E7439C5EE2F71AB9C4927C4AB91573E2025AE9E6283B1F696ACF34F919C4B
          2538F91BC1A155391B37DDA7A449EC18690D7DCB7CFBA83666C2BBC8C84462D2
          D5CF04F01A83787D6B96A86E92476592DB16CFCF3CB5FCB94C9DDE46725D2DCC
          AF95C4F7B8D55CE31DA922AF27ABD4F1AC8C49E7A77846CB261F17180ED204D3
          91DAF79AAA66559E4BA4FD8B262C36D68B6195BF836A6CDBCC8C8446CB3B57BE
          A4D06A0DE1F5AC6B8EE9246FB25B62D9F9C999C8CB96CADE64A67174B752BE57
          13FBC6AAE708ED4915693D5EA78564624EDD3BC2B65761F1918D4784F3D3F1BC
          D55372ECF25CDFB164C586DAD16F7F47866DB72E26468F4E781D1387F1368B4C
          5E8F53A5AD5687E7B6FED9794D97B82EF1D7B03DB6CD91DF0D70412C7B09A8F3
          5295A2B7E3DF1B629AEE566EA9D72D19AAAE9341DB6F6D71772886D627CD2BB9
          3236973BE80B1949456ADE87D49BEC6DB7DB320C1ED87E5F3372D194B8788ECA
          C22702E6F225CFA787628CAB3BCD76CAD7CABEA91D73C7F1C374BBBEC8D354A9
          C666F6959477B9DB56CD4F42177AF257B447C69F4AE2CDB7C75367463C37CD22
          DC744B1067B89B2D237FBC712D3E0AA105A22CC431F321B2F2589DF1779F640E
          7E332444BEAB012C6380A10683872568C0BE3286DF5440E654D4F77A32135284
          79CA391F13C3E37163C710E06857C6B50662CF1FB87734EC6B3D6B869F2FAF31
          221681DEF77942E6B2EAA95AB691BA15CEC7D3A9EBDDDB559B564B3B6F8C65EC
          D7117AB24917D869E5A4579AD78997FD84DA5A24677D3E269335A5DC731BE74D
          190BE7C8349689DF1B58C07ED50BB8D14172FAED8FB6A49E069B9970F6BCF69B
          2760DCE76E34B63B480CCE2E341503873EF2A1AB86F928A26272DB16CA1997BF
          972B95BDC94C754B773C93BC9ED3238BBFD2AE918ED4915693D5EA78D64624E3
          D38C207FE8F8A0353DEF377714FC525283DC0054ECCB3C97B7EDD0B1E2436D6B
          E2584EAFECAB8DC3D2E9B138F8C3AF2DC32E2168E0498C569EF59E25AABB137D
          8FB935B9C1A450FB9B6B8B399F6F7513A19E3347C6F05AE0478156D4D35AA2B8
          D35DCEA5F4F87B2D6F329A0D9594D316CBC3D088B8EA3EC0B0928AEACC937D91
          B4633A7B7D758CBBCBE56E1964C82233476B21ADC4847616F36FBD46D9C8D6AC
          508FCCDBFC8EB8E249C5C9F4469669534E5D8A54E239C01A668C3E819A86A279
          52BC57C9763EAEE5B3E9562A0BECE4570CD2E8A28D823D3F66800E4A8DD773D7
          DCB543E945978DA18C6B472028BE999C901FFFD2BFC8020384B18918E61E4451
          01156EFE9547B82EBD4D44464D4B7B160A114F5D0FBAB362D99B031DB5E1688A
          31EA0E669C5667C3761C3820080200802008020080E99AD20B8FEF581DED080F
          B0DBC300A44D0D1E080ED40295E680500E480EB9A68EDE374B2B836368A92561
          39C6117297646518B6F44459BEB77C3916FE9B8F76A8057D47D3995E5FF70F37
          1BD78AAEDEA59B8FC270F9A5DC8D32593B4C45A9BBBB274D74B18DFB4E3DC141
          70FC53CD93EBA24766665AA57BB38E3371BAEE30FB7C5BE5D5C9CFA957EA7ED8
          A23F57CDF89053E4EC7DBA19A7C734D6E2E9D6AEB6941F333B29DE156F9EE123
          8D15654BF12470335D8F6C8CEE3733699485BB772B6F15FC4FA48D86E58D9581
          C0501D2E04542B97DB77CE58A9B6F5D7FD086E46B8F95AD3A1AAEE0E9964AE2F
          1CFC762ACA2B726AD0DB68870FF55595CE6FF73FD5919E287B230EEE94EE2734
          8F80B415ED16F1FF002AF9BA7FCA5FAB1E287B2FD0DABA7FD28C8E3728CBEC88
          1E43E5681400780EC5F3433492EC4ED7D8DB5BDC63EC2EA08EE6DDECD2E86568
          7B1DED69A82B24DAEA8349F7204DD9D32BB9AF1DFA4E22C6282BC036D621FEEA
          FAE763FDCFF5661E287B235993A4FB8A4696FC0DAB6BDADB78C1FA9AB1DD3FE4
          FF00563C70F64483D31E99DE60AEFE37202B2FEC5F1236131E46C6DAFEC25B2B
          A823B8B791BA5D0CAD0F63878B4D415926D7547C693EE405BB7A657535DBBF48
          C458C30578065AC43F6357D94EC7FB9FEACC3C50F646B12749F7148D2DF81B56
          D7B5B6F183F53563BA7FC9FEAC78A1EC8DFF00A65D32BCC1DE7C6E40565F6725
          F12361380680D0DECA517D047BBFB6243B8ADDDF911CFCCFA72B43C57DFC9136
          9EA9E8CC651525A3440595E914904EF31EDF81E6B5D40CA07D01E02DDFD9BD7E
          F7FE1FE868FEAD5FC458F4C7755C3BD1B5B48F1F13B838C0C0C750F6170E3F5A
          D13729FD526CDD1AE31ECB4246C2F4619678DADFC11DE4E012D170C6CA038F70
          702BEC5B8FD2F43ECA2A5DD6A6AF91E96E69D72EF86C6D9B62AF002DA2FE5472
          9FF27FAB31F143D91E26748370DC5C335410C0CA80E30C4D8C91FD9017C7B9F7
          6DFE67D508AEC9160F626DA1B73151DB11478142BE999DBBBF6CC79FB27C2E63
          64A8FB0F68734FB414FC0F8D27DCAEB9FE8FBA2B8716E0A09802685BAD9CCF73
          1CD0B6AC8BD769BFF0343C6A9FED309174CB2919D36BB7EDE3E3505CD749FED9
          72F92BEF9779B3EAC7AD7ED33F8CE8F6E7CA3D91DEBFD0B406BE8C434307B9B4
          0B46DD5EAFAB3724976241BAE8FDB5B629B1B6D61B9B96368D74F1B6423D9A81
          59A6D766D1F1C232EEB53419BA55B83D5768C7DA06D787F4D17F2A6E9FF297EA
          CC7C50F6473C6F4933C32314F2DBC50B5A46AF4A36C7500FEE809AC9F76DFE66
          4A115D922C2D8E0E03B7BF49BF823B981CC0D92099A1F1BA9DED7020AFA9B4F5
          47D693E8C86376F4CEEE6BC77E9388B1860AF00CB58870FF00557D94EC7FB9FE
          ACC3C50F646B12749F7148C2CF80B56D78545BC60FFB2B1DD3FE52FD58F143D9
          1BEF4CBA617984BDF8FC88D52F0A57B17C4B436136CF036680C2791145F4106E
          FEE95372170FBB8F1F05D39D5A97B3CC6BFBC285651B271FA64D1AA55425DD11
          64BD2AB8824FCADB90EA69E04995C3E82F216C79390FF7BFF0FF00435FF56AFE
          27B2CBA67BA5EE0DB3B286C2BF7E18DAD78FED52BF5AD12739FD526CDB1AE11E
          C91206D3E894B6FAAE728F334AF1E7127981AF61057C514BB1B1F531DB93A517
          8CB82DC5E36CDB10FF00F1E2FE559B94DFEE7FAB35F8A1EC8D7A5E936E295858
          6C2D5A0F68B78C1FA9ABE6E9FF00297EAC78A1EC8953A59B1EFB6E1325E0A38F
          8517C3612EAFA0203FFFD3BFC802008020080200802008020080200802008020
          080E12CB1C11BA595C191B455CE3C00584E7182D64F447D49B7A222CDCFBA2EB
          3F249638B263B186BEACDD868BCCF94E52DCF93AA8E908FD522CB8D8D1A16E9F
          76682F6D1E5B5AD0D2AA86EB7BF6FAEA4E6EF975358659BF776EB831B1F9ECAD
          086BA9C8BABC4AF6AE0F07FAF8E93EEFB94BCCBBC9637E8595C16D0C4E3ACA28
          C5BB7535A2A681584E13D398DBD6977652451461AE20D2816AB6A8D917192D53
          328C9C5EA88D305B16FECF727C74D5318341EC58518F0A63B63D8FB39B9BD593
          2471B446D05A0900762E830396867E11F4203E86B47200203EA03E16B4F3683E
          E407CD0CFC23E8407D000E42880FA80F85AD3CDA0FB901F3433F08FA101F4003
          90A203EA01CF9A03ADD6F03FED46D3ED080360859F66368F6040765072A2038E
          867E11F4201A19F847D080E48020383A189FF6980FB420380B5B71CA26FD080E
          C6B18DFB2D03D8101CA80F34071D0CFC23E8403433F08FA101C901F0B5A79B47
          D080F9A19F847D080FA001C85101F501F0B5AEE0E15F6A03ACDADB9E7134FB90
          1F5B042DFB31B47B901D940101F0B5A79807DC80F9A19F847D080FA001C85101
          F500407FFFD4BFC8020080200802008020080200802008020080200808BB7C6E
          39B2179FA263DE596F1D7E2640781F7F82F36E7390B32AE58D4F6FDC58F0B1E3
          543CB3FC8D564BE8E1C7496F6829038E8D7DAF7769587230871D87E28FD53FA8
          F98EE59376F7DA26B790BB658594F7921E11B4E9F171E002ABF0D872C9C84BDB
          A9299B72AEB7F1367E88EDF6C8C7E5A667E64A4BAA7C57B945688A493C014141
          C82C804071F4D80EAD22BDE80E48020080200802008020080200802008020080
          200802008020080200802008020080200802008020080200802008020080203F
          FFD5BFC802008020080200802008020080200802008020358DEBB81B85C63991
          3BFAC9FCB1B7B687B556B9EE496250D47EB97624B031BCB3EBD910F5D4B3CC61
          C5406B90BC3AAE64FBC187B0A8CFB7F0957579A6BE697A9BF90BF74F647B23AE
          F7D38DEDB580FE540340F170E6550F99CC79390DEBD113D874F8EB46A39F99D9
          0C8DA6DEB71A9CF735F3D3B3B82BDFDB3C778ABF23EF220792C8DF2DABD0B25B
          1F0D1E230B042D6E976915FA15E4863684010040100401004010040100401004
          0100401004010040100401004010040100401004010040100401004010040100
          4010040100407FFFD6BFC8020080200802008020080200802008020080E12C8D
          8A374AF34630124F8058CE4A29B7E87D4B57A1086E4CE0C965AEAFEE4D6D6C83
          BD10391D3C9795293E4F91D25F4C7B7E45A1AFEB63F4EECC3E022960B5BADC97
          C7FAABA25B6AD3D80F72B6739991C4C6DB1E8DF622706976D9ABEC63EEAE63B6
          825BCB8348E305EF3DFF00FBAF2DE3F12595728AF7EA5A322E5541B3974930CE
          CFE727CE5D4756BDF565476762F74C6A5555A8AF4451E72DD26CB2B146D898D6
          34500145D2607340100401004010040100401004010040100401004010040100
          4010040100401004010040100401004010040100401004010040100407FFD7BF
          C8020080200802008020080200802008020080D577F6565C6611C22FB5724C55
          F02155FEE4CC963E2F4FDDF2927C752ACB7AFA109DE5BCD746D3131707DCBFD4
          9DDDCC1DEA1FED9C554D4ED9F46CEAE4ED739A8232597B86B9F1594047C2DAB4
          323039569C4AA87399CF2B21E9F4AFA497C1A1555FC59A26E49DF93BEB6DB767
          573E47075CE9ECEE0AEDF6CF1AE987924BAC884E4B27C92DABB22C6F4F76CC38
          1C3C2C6B34C85A2AAF2431B92008020080200802008020080200802008020080
          2008020080200802008020080200802008020080200802008020080200802008
          020080FFD0BFC80200802008020080200802008020080200808D3AA32CE45B44
          7FFAF5A8FE2A2F38FBBE53D22BF6EA58B894BABF5345967B78A332C3E6BB918D
          8CBFF0B473A289CCE59470E34C1F5D3AB3A29C46EE7397630595C9C188B27DEC
          E7CC3844CED73CF251BC371B2CAB53F447566E4AAA1A7A992E8F6D17E52F9F9F
          BF612F95DAC17789AAF6BAE0A114914C6F5658D8A36C4C6C6D140D140B61F0E6
          8020080200802008020080200802008020080200802008020080200802008020
          0802008020080200802008020080200802008020080203FFD1BFC80200802008
          02008020080200802008020080D6379E25B93C7905B52CA914E6A2B93E3E1995
          6C97E47563643A65AA20ACB5E5961DCFF8D974067650971F700BCC65F6C65AB3
          451F97DF5459172756DD75EA6B385C6DFF0051370C4EF4DCCC540E02261E5407
          99F6AF4EE370238B52822B59173B64E4CB4FB6B036F83B08ADA1686E9681C14A
          9CC66D0040100401004010040100401004010040100401004010040100401004
          010040100401004010040100401004010040100401004010040101FFD2BFC802
          0080200802008020080200802008020080E2F63646963855A798406979FE9B61
          73B27A93C42A4F1406476E6CCC5EDC606DA44D691DA020365401004010040100
          4010040100401004010040100401004010040100401004010040100401004010
          040100401004010040100401004010040101FFD3BFC802008020080200802008
          0200802008020080200802008020080200802008020080200802008020080200
          8020080200802008020080200802008020080200802008020080200802008020
          08020080203FFFD9}
        mmHeight = 6879
        mmLeft = 78846
        mmTop = 265
        mmWidth = 31221
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label11'
        Caption = 'www.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 67204
        mmTop = 1588
        mmWidth = 11377
        BandType = 4
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = '.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 110596
        mmTop = 1323
        mmWidth = 14552
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
    end
  end
  object ppDesigner: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pproposta
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 300
    Top = 383
  end
end

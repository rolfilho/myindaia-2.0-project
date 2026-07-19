object frm_local_embarque: Tfrm_local_embarque
  Left = 228
  Top = 172
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Local de Embarque / Desembarque'
  ClientHeight = 504
  ClientWidth = 742
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
  object pgctrl_local_embarque: TPageControl
    Left = 0
    Top = 47
    Width = 742
    Height = 457
    ActivePage = ts_dados_basicos
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_local_embarqueChange
    OnChanging = pgctrl_local_embarqueChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        DataSource = datm_local_embarque.ds_local_embarque
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        TabOrder = 0
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
            FieldName = 'CODIGO'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o ( porto, aeroporto e etc )'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 263
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_SIGLA'
            Title.Alignment = taCenter
            Title.Caption = 'SIGLA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CIDADE'
            Title.Caption = 'CIDADE'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 287
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_UF'
            Title.Alignment = taCenter
            Title.Caption = 'UF'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 38
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Hint = 'Salva os dados'
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label3: TLabel
          Left = 20
          Top = 26
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_local_embarque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 68
          Top = 26
          Width = 261
          Height = 13
          AutoSize = False
          Caption = 'Descri'#231#227'o ( porto, aeroporto e etc )'
          FocusControl = dbedt_nm_local_embarque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 396
          Top = 70
          Width = 161
          Height = 13
          AutoSize = False
          Caption = 'Unidade de Neg'#243'cio Local'
          FocusControl = dbedt_nm_local_embarque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_cd_unid_neg: TSpeedButton
          Left = 582
          Top = 82
          Width = 25
          Height = 22
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
        object Label6: TLabel
          Left = 396
          Top = 26
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Cidade'
          FocusControl = dbNM_CIDADE
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 336
          Top = 26
          Width = 42
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Sigla'
          FocusControl = dbCD_SIGLA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 669
          Top = 28
          Width = 20
          Height = 13
          AutoSize = False
          Caption = 'UF'
          FocusControl = dbNM_CIDADE
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_cd_uf: TSpeedButton
          Left = 695
          Top = 42
          Width = 21
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
          OnClick = btn_cd_ufClick
        end
        object lbl_pais: TLabel
          Left = 19
          Top = 69
          Width = 27
          Height = 13
          Caption = 'Pa'#237's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_pais: TSpeedButton
          Left = 336
          Top = 82
          Width = 21
          Height = 21
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          ParentFont = False
          OnClick = btn_co_paisClick
        end
        object Label9: TLabel
          Left = 614
          Top = 68
          Width = 46
          Height = 13
          Caption = 'Fiesp Id'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton3: TSpeedButton
          Left = 681
          Top = 79
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
          OnClick = SpeedButton3Click
        end
        object dbedt_cd_local_embarque: TDBEdit
          Left = 20
          Top = 41
          Width = 40
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CODIGO'
          DataSource = datm_local_embarque.ds_local_embarque
          ReadOnly = True
          TabOrder = 0
          OnEnter = Status_Botoes
        end
        object dbedt_nm_local_embarque: TDBEdit
          Left = 68
          Top = 41
          Width = 261
          Height = 21
          DataField = 'DESCRICAO'
          DataSource = datm_local_embarque.ds_local_embarque
          TabOrder = 1
          OnEnter = Status_Botoes
        end
        object dbedt_cd_unid_neg_local: TDBEdit
          Left = 396
          Top = 83
          Width = 37
          Height = 21
          DataField = 'CD_UNID_NEG_LOCAL'
          DataSource = datm_local_embarque.ds_local_embarque
          TabOrder = 7
          OnExit = dbedt_cd_unid_neg_localExit
          OnKeyDown = dbedt_cd_unid_neg_localKeyDown
        end
        object dbedt_AP_UNID_NEG: TDBEdit
          Left = 444
          Top = 83
          Width = 133
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LK_AP_UNID_NEG'
          DataSource = datm_local_embarque.ds_local_embarque
          ReadOnly = True
          TabOrder = 8
          OnEnter = Status_Botoes
        end
        object dbNM_CIDADE: TDBEdit
          Left = 396
          Top = 41
          Width = 261
          Height = 21
          DataField = 'NM_CIDADE'
          DataSource = datm_local_embarque.ds_local_embarque
          TabOrder = 3
          OnEnter = Status_Botoes
        end
        object dbCD_SIGLA: TDBEdit
          Left = 335
          Top = 41
          Width = 45
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_SIGLA'
          DataSource = datm_local_embarque.ds_local_embarque
          TabOrder = 2
          OnEnter = Status_Botoes
        end
        object dbUF: TDBEdit
          Left = 665
          Top = 41
          Width = 27
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_UF'
          DataSource = datm_local_embarque.ds_local_embarque
          TabOrder = 4
          OnEnter = Status_Botoes
        end
        object dbedt_cd_pais: TDBEdit
          Left = 19
          Top = 82
          Width = 40
          Height = 21
          DataField = 'CD_PAIS'
          DataSource = datm_local_embarque.ds_local_embarque
          TabOrder = 5
          OnChange = btn_co_paisClick
        end
        object dbedt_nm_pais: TEdit
          Left = 68
          Top = 82
          Width = 261
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_Fiesp: TDBEdit
          Left = 614
          Top = 82
          Width = 59
          Height = 21
          DataField = 'FIESP_Id'
          DataSource = datm_local_embarque.ds_local_embarque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnChange = dbedt_FiespChange
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
      Left = 2
      Top = 4
      Width = 38
      Height = 41
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
      Left = 116
      Top = 4
      Width = 38
      Height = 41
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
      Width = 38
      Height = 41
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
      Left = 78
      Top = 4
      Width = 38
      Height = 41
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
    object pnl_pesquisa: TPanel
      Left = 431
      Top = 2
      Width = 309
      Height = 43
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 0
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
        OnKeyDown = edt_chaveKeyDown
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
    object dbnvg: TDBNavigator
      Left = 228
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_local_embarque.ds_local_embarque
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      TabOrder = 1
    end
  end
  object menu_cadastro: TMainMenu
    Left = 556
    Top = 332
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
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
      Hint = ' '
      OnClick = btn_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end

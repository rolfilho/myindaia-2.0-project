object frm_embal: Tfrm_embal
  Left = 298
  Top = 134
  Width = 750
  Height = 550
  Caption = 'Cadastro de Embalagem'
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
  object pgctrl_embal: TPageControl
    Left = 0
    Top = 47
    Width = 734
    Height = 444
    ActivePage = ts_dados_basicos
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_embalChange
    OnChanging = pgctrl_embalChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_embal: TDBGrid
        Left = 0
        Top = 0
        Width = 726
        Height = 416
        Align = alClient
        DataSource = datm_embal.ds_embal
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_embalDblClick
        OnKeyPress = dbg_embalKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_EMBALAGEM'
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
            FieldName = 'NM_EMBALAGEM_S'
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
            FieldName = 'NM_EMBALAGEM_P'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 191
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'look_ativo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_EMBALAGEM_CLIENTE'
            Title.Caption = 'Cod.Emb.Cliente'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados B'#225'sicos'
      object pnl_embal: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 416
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label3: TLabel
          Left = 17
          Top = 19
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_embal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 73
          Top = 19
          Width = 183
          Height = 13
          AutoSize = False
          Caption = 'Descri'#231#227'o Singular'
          FocusControl = dbedt_nm_embal_s
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 17
          Top = 60
          Width = 137
          Height = 13
          AutoSize = False
          Caption = 'Descri'#231#227'o Plural'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 441
          Top = 61
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
        object lbl_comprimento: TLabel
          Left = 17
          Top = 100
          Width = 108
          Height = 13
          AutoSize = False
          Caption = 'Comprimento'
          FocusControl = dbedt_nr_comprimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_largura: TLabel
          Left = 156
          Top = 100
          Width = 108
          Height = 13
          AutoSize = False
          Caption = 'Largura'
          FocusControl = dbedt_nr_largura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_altura: TLabel
          Left = 297
          Top = 100
          Width = 108
          Height = 13
          AutoSize = False
          Caption = 'Altura'
          FocusControl = dbedt_nr_altura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_peso_embal: TLabel
          Left = 441
          Top = 100
          Width = 115
          Height = 13
          AutoSize = False
          Caption = 'Peso da Embalagem'
          FocusControl = dbedt_nr_peso
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 17
          Top = 142
          Width = 128
          Height = 13
          Caption = 'Classif. da Embalagem'
          FocusControl = dbedt_cd_classif
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 17
          Top = 186
          Width = 134
          Height = 13
          AutoSize = False
          Caption = 'Embalagem Superior'
          FocusControl = dbedt_cd_embal_sup
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_embalagem: TSpeedButton
          Left = 331
          Top = 200
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
          OnClick = btn_co_embalagemClick
        end
        object lbl_qt_por_embalagem: TLabel
          Left = 364
          Top = 186
          Width = 119
          Height = 13
          Caption = 'Qtde Por Embalagem'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 441
          Top = 19
          Width = 155
          Height = 13
          Caption = 'C'#243'd. embalagem no Cliente'
          FocusControl = dbedt_cd_emb_cliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 17
          Top = 233
          Width = 223
          Height = 13
          Caption = 'Descri'#231#227'o Detalhada para Documentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_unid_med: TLabel
          Left = 150
          Top = 142
          Width = 76
          Height = 13
          Caption = 'Unid. Medida'
          FocusControl = dbedt_cd_unid_med_emb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_unid_med_emb: TSpeedButton
          Left = 331
          Top = 157
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
          OnClick = btn_co_unid_med_embClick
        end
        object Label12: TLabel
          Left = 364
          Top = 142
          Width = 142
          Height = 13
          Caption = 'Qtde de Merc. na Embal.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 557
          Top = 197
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
          OnClick = SpeedButton1Click
        end
        object Label10: TLabel
          Left = 490
          Top = 186
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
        object dbedt_cd_embal: TDBEdit
          Left = 17
          Top = 33
          Width = 49
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_EMBALAGEM'
          DataSource = datm_embal.ds_embal
          ReadOnly = True
          TabOrder = 0
          OnChange = dbedt_nm_embal_sChange
        end
        object dbedt_nm_embal_s: TDBEdit
          Left = 74
          Top = 33
          Width = 361
          Height = 21
          DataField = 'NM_EMBALAGEM_S'
          DataSource = datm_embal.ds_embal
          TabOrder = 1
          OnChange = dbedt_nm_embal_sChange
        end
        object dbedt_nm_embal_p: TDBEdit
          Left = 17
          Top = 74
          Width = 418
          Height = 21
          DataField = 'NM_EMBALAGEM_P'
          DataSource = datm_embal.ds_embal
          TabOrder = 3
          OnChange = dbedt_nm_embal_sChange
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 441
          Top = 74
          Width = 145
          Height = 21
          DataField = 'LookTipoEmbal'
          DataSource = datm_embal.ds_embal
          TabOrder = 4
          OnClick = dbedt_nm_embal_sChange
        end
        object dbedt_nr_comprimento: TDBEdit
          Left = 17
          Top = 114
          Width = 131
          Height = 21
          DataField = 'NR_COMPRIMENTO'
          DataSource = datm_embal.ds_embal
          TabOrder = 5
          OnChange = dbedt_nm_embal_sChange
        end
        object dbedt_nr_largura: TDBEdit
          Left = 156
          Top = 114
          Width = 131
          Height = 21
          DataField = 'NR_LARGURA'
          DataSource = datm_embal.ds_embal
          TabOrder = 6
          OnChange = dbedt_nm_embal_sChange
        end
        object dbedt_nr_altura: TDBEdit
          Left = 297
          Top = 114
          Width = 131
          Height = 21
          DataField = 'NR_ALTURA'
          DataSource = datm_embal.ds_embal
          TabOrder = 7
          OnChange = dbedt_nm_embal_sChange
        end
        object dbedt_nr_peso: TDBEdit
          Left = 441
          Top = 114
          Width = 131
          Height = 21
          DataField = 'NR_PESO'
          DataSource = datm_embal.ds_embal
          TabOrder = 8
          OnChange = dbedt_nm_embal_sChange
        end
        object dbedt_cd_classif: TDBEdit
          Left = 17
          Top = 156
          Width = 128
          Height = 21
          DataField = 'CD_CLASSIF'
          DataSource = datm_embal.ds_embal
          TabOrder = 9
          OnChange = dbedt_nm_embal_sChange
        end
        object dbedt_cd_embal_sup: TDBEdit
          Left = 17
          Top = 200
          Width = 49
          Height = 21
          DataField = 'CD_EMBALAGEM_SUP'
          DataSource = datm_embal.ds_embal
          TabOrder = 13
          OnChange = dbedt_nm_embal_sChange
          OnExit = dbedt_cd_embal_supExit
          OnKeyDown = dbedt_cd_embal_supKeyDown
        end
        object dbedt_nm_embalagem: TDBEdit
          Left = 69
          Top = 200
          Width = 259
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NmEmbalagem'
          DataSource = datm_embal.ds_embal
          ReadOnly = True
          TabOrder = 14
          OnChange = dbedt_nm_embal_sChange
        end
        object dbedt_qt_por_embalagem: TDBEdit
          Left = 364
          Top = 200
          Width = 111
          Height = 21
          DataField = 'QT_EMBALAGEM_SUP'
          DataSource = datm_embal.ds_embal
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          OnChange = dbedt_nm_embal_sChange
        end
        object dbedt_cd_emb_cliente: TDBEdit
          Left = 441
          Top = 33
          Width = 124
          Height = 21
          DataField = 'CD_EMBALAGEM_CLIENTE'
          DataSource = datm_embal.ds_embal
          TabOrder = 2
          OnChange = dbedt_nm_embal_sChange
        end
        object PageControl1: TPageControl
          Left = 17
          Top = 253
          Width = 340
          Height = 81
          ActivePage = tbsht_port
          TabOrder = 16
          object tbsht_port: TTabSheet
            Caption = 'Portugu'#234's'
            object dbedt_nm_descricao: TDBEdit
              Left = 11
              Top = 16
              Width = 278
              Height = 21
              DataField = 'NM_DESCR_DETALHADA'
              DataSource = datm_embal.ds_embal
              TabOrder = 0
              OnChange = dbedt_nm_embal_sChange
            end
          end
          object tbsht_ingles: TTabSheet
            Caption = 'Ingl'#234's'
            object dbedt_nm_descricao_i: TDBEdit
              Left = 11
              Top = 16
              Width = 278
              Height = 21
              DataField = 'NM_DESCR_DETALHADA_INGLES'
              DataSource = datm_embal.ds_embal
              TabOrder = 0
              OnChange = dbedt_nm_embal_sChange
            end
          end
          object tbsht_espanhol: TTabSheet
            Caption = 'Espanhol'
            object dbedt_nm_descricao_e: TDBEdit
              Left = 11
              Top = 16
              Width = 278
              Height = 21
              DataField = 'NM_DESCR_DETALHADA_ESPANHOL'
              DataSource = datm_embal.ds_embal
              TabOrder = 0
              OnChange = dbedt_nm_embal_sChange
            end
          end
        end
        object dbedt_cd_unid_med_emb: TDBEdit
          Left = 150
          Top = 156
          Width = 31
          Height = 21
          DataField = 'CD_UNID_MED_EMB'
          DataSource = datm_embal.ds_embal
          TabOrder = 10
          OnChange = dbedt_nm_embal_sChange
          OnExit = dbedt_cd_unid_med_embExit
          OnKeyDown = dbedt_cd_embal_supKeyDown
        end
        object dbedt_nm_sigla_unid_med: TDBEdit
          Left = 185
          Top = 156
          Width = 143
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidMedEmb'
          DataSource = datm_embal.ds_embal
          ReadOnly = True
          TabOrder = 11
          OnChange = dbedt_nm_embal_sChange
        end
        object dbedt_qt_merc_emb: TDBEdit
          Left = 364
          Top = 156
          Width = 111
          Height = 21
          DataField = 'QT_MERC_EMB'
          DataSource = datm_embal.ds_embal
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          OnChange = dbedt_nm_embal_sChange
        end
        object dbedt_Fiesp: TDBEdit
          Left = 490
          Top = 200
          Width = 59
          Height = 21
          DataField = 'FIESP_Id'
          DataSource = datm_embal.ds_embal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 734
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
      Left = 391
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
      Left = 244
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_embal.ds_embal
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
      Left = 423
      Top = 2
      Width = 309
      Height = 43
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      TabStop = True
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
  end
  object menu_cadastro: TMainMenu
    Left = 564
    Top = 20
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

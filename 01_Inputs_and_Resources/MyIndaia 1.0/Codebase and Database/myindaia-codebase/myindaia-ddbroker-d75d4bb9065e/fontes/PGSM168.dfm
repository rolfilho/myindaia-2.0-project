object frm_ct_contabil: Tfrm_ct_contabil
  Left = 303
  Top = 119
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Cadastro de Plano de Contas Cont'#225'beis'
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
  object pgctrl_ct_contabil: TPageControl
    Left = 0
    Top = 47
    Width = 742
    Height = 457
    ActivePage = ts_dados_basicos
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_ct_contabilChange
    OnChanging = pgctrl_ct_contabilChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        DataSource = datm_ct_contabil.ds_ct_contabil
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
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
            FieldName = 'CD_CT_CONTABIL'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_CT_CONTABIL_PAI'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_ACESSO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_AUX'
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
            Expanded = False
            FieldName = 'CD_GRAU'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_CT_CONTABIL'
            Title.Alignment = taCenter
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
      Caption = 'Dados B'#225'sicos'
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_descricao: TLabel
          Left = 15
          Top = 116
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
        object lbl_codigo: TLabel
          Left = 15
          Top = 20
          Width = 82
          Height = 13
          Caption = 'C'#243'd. da Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_acesso: TLabel
          Left = 15
          Top = 70
          Width = 42
          Height = 13
          Caption = 'Acesso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_grau: TLabel
          Left = 122
          Top = 70
          Width = 28
          Height = 13
          Caption = 'Grau'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_aux: TLabel
          Left = 72
          Top = 70
          Width = 26
          Height = 13
          Caption = 'Aux.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblAtivo: TLabel
          Left = 15
          Top = 165
          Width = 126
          Height = 13
          Caption = 'Distribui'#231#227'o Gerencial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 15
          Top = 213
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
        object Label3: TLabel
          Left = 135
          Top = 20
          Width = 104
          Height = 13
          Caption = 'C'#243'd. da Conta Pai'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_in_embarque: TLabel
          Left = 151
          Top = 165
          Width = 80
          Height = 13
          Caption = 'Por Embarque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_contabiliza: TLabel
          Left = 343
          Top = 125
          Width = 149
          Height = 13
          Caption = 'Integra com Contabilidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_reemb: TLabel
          Left = 453
          Top = 165
          Width = 63
          Height = 13
          Caption = 'Reembolso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl1: TLabel
          Left = 263
          Top = 20
          Width = 199
          Height = 13
          Caption = 'C'#243'd. da Conta Pai - Fluxo de Caixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_ct_custo: TLabel
          Left = 15
          Top = 258
          Width = 38
          Height = 13
          Caption = 'Rateio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_rateio: TSpeedButton
          Left = 295
          Top = 271
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
          OnClick = btn_rateioClick
        end
        object Label6: TLabel
          Left = 535
          Top = 20
          Width = 23
          Height = 13
          Caption = 'Ano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_fluxo_caixa: TLabel
          Left = 192
          Top = 213
          Width = 126
          Height = 13
          Caption = 'Fluxo de Caixa (Fluxo)'
        end
        object lbl_fluxo_banco: TLabel
          Left = 323
          Top = 213
          Width = 132
          Height = 13
          Caption = 'Fluxo de Caixa (Banco)'
        end
        object dbedt_nm_ct_contabil: TDBEdit
          Left = 15
          Top = 131
          Width = 362
          Height = 21
          DataField = 'NM_CT_CONTABIL'
          DataSource = datm_ct_contabil.ds_ct_contabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnChange = dbedt_nm_ct_contabilChange
        end
        object dbedt_cd_ct_contabil: TDBEdit
          Left = 15
          Top = 35
          Width = 100
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_CT_CONTABIL'
          DataSource = datm_ct_contabil.ds_ct_contabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnChange = dbedt_nm_ct_contabilChange
          OnExit = dbedt_cd_ct_contabilExit
        end
        object dbedt_cd_acesso: TDBEdit
          Left = 15
          Top = 85
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_ACESSO'
          DataSource = datm_ct_contabil.ds_ct_contabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_nm_ct_contabilChange
          OnExit = dbedt_cd_classifExit
        end
        object dbedt_cd_grau: TDBEdit
          Left = 122
          Top = 85
          Width = 33
          Height = 21
          DataField = 'CD_GRAU'
          DataSource = datm_ct_contabil.ds_ct_contabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnChange = dbedt_nm_ct_contabilChange
          OnExit = dbedt_cd_classifExit
        end
        object dbedt_cd_aux: TDBEdit
          Left = 72
          Top = 85
          Width = 46
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_AUX'
          DataSource = datm_ct_contabil.ds_ct_contabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_nm_ct_contabilChange
          OnExit = dbedt_cd_classifExit
        end
        object dblkpcbox_distribui: TDBLookupComboBox
          Left = 15
          Top = 179
          Width = 68
          Height = 21
          DataField = 'IN_DISTRIBUI'
          DataSource = datm_ct_contabil.ds_ct_contabil
          DropDownRows = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_ct_contabil.ds_yesno
          ParentFont = False
          TabOrder = 7
          OnClick = dbedt_nm_ct_contabilChange
        end
        object dblckp_box_indicador: TDBLookupComboBox
          Left = 15
          Top = 227
          Width = 164
          Height = 21
          DataField = 'CD_IDENTIFICADOR'
          DataSource = datm_ct_contabil.ds_ct_contabil
          DropDownRows = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'TP_INDICADOR'
          ListField = 'NM_INDICADOR'
          ListSource = datm_ct_contabil.ds_tp_indicador
          ParentFont = False
          TabOrder = 11
          OnClick = dbedt_nm_ct_contabilChange
        end
        object dbedt_cd_ct_contabil_pai: TDBEdit
          Left = 135
          Top = 35
          Width = 114
          Height = 21
          DataField = 'CD_CT_CONTABIL_PAI'
          DataSource = datm_ct_contabil.ds_ct_contabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = dbedt_nm_ct_contabilChange
        end
        object dblckpbox_embarque: TDBLookupComboBox
          Left = 151
          Top = 179
          Width = 68
          Height = 21
          DataField = 'IN_EMBARQUE'
          DataSource = datm_ct_contabil.ds_ct_contabil
          DropDownRows = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_ct_contabil.ds_yesno
          ParentFont = False
          TabOrder = 8
          OnClick = dbedt_nm_ct_contabilChange
        end
        object dblckpbox_in_contabiliza: TDBLookupComboBox
          Left = 287
          Top = 179
          Width = 68
          Height = 21
          DataField = 'IN_CONTABILIZA'
          DataSource = datm_ct_contabil.ds_ct_contabil
          DropDownRows = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_ct_contabil.ds_yesno
          ParentFont = False
          TabOrder = 9
          OnClick = dbedt_nm_ct_contabilChange
        end
        object dblckpbox_reembolso: TDBLookupComboBox
          Left = 453
          Top = 179
          Width = 50
          Height = 21
          DataField = 'IN_REEMBOLSO'
          DataSource = datm_ct_contabil.ds_ct_contabil
          DropDownRows = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_ct_contabil.ds_yesno
          ParentFont = False
          TabOrder = 10
          OnClick = dbedt_nm_ct_contabilChange
        end
        object dbedtCtContabilFluxo: TDBEdit
          Left = 263
          Top = 35
          Width = 114
          Height = 21
          DataField = 'CD_CT_CONTABIL_FLUXO'
          DataSource = datm_ct_contabil.ds_ct_contabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_nm_ct_contabilChange
        end
        object dbedt_nm_rateio: TEdit
          Left = 74
          Top = 272
          Width = 218
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 12
        end
        object dbedt_cd_rateio: TDBEdit
          Left = 15
          Top = 272
          Width = 57
          Height = 21
          DataField = 'CD_RATEIO'
          DataSource = datm_ct_contabil.ds_ct_contabil
          TabOrder = 13
          OnChange = btn_rateioClick
          OnKeyDown = dbedt_cd_classifKeyDown
        end
        object dbedt_Ano: TDBEdit
          Left = 535
          Top = 35
          Width = 58
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'ANO_CONTA'
          DataSource = datm_ct_contabil.ds_ct_contabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          OnChange = dbedt_nm_ct_contabilChange
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 192
          Top = 227
          Width = 70
          Height = 21
          DataField = 'IN_FLUXO_CAIXA_FLUXO'
          DataSource = datm_ct_contabil.ds_ct_contabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_ct_contabil.ds_yesno
          ParentFont = False
          TabOrder = 15
          OnClick = DBLookupComboBox1Click
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 323
          Top = 227
          Width = 70
          Height = 21
          DataField = 'IN_FLUXO_CAIXA_BANCO'
          DataSource = datm_ct_contabil.ds_ct_contabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_ct_contabil.ds_yesno
          ParentFont = False
          TabOrder = 16
          OnClick = DBLookupComboBox2Click
        end
        object GroupBox1: TGroupBox
          Left = 536
          Top = 72
          Width = 177
          Height = 129
          Caption = 'Integra'#231#227'o Contabil'
          TabOrder = 17
          object Label7: TLabel
            Left = 17
            Top = 41
            Width = 84
            Height = 13
            Caption = 'Conta Contabil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 17
            Top = 82
            Width = 141
            Height = 13
            Caption = 'Conta Contabil Reduzida'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_incluir_ct_nova: TSpeedButton
            Left = 2
            Top = 12
            Width = 23
            Height = 29
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
            OnClick = btn_incluir_ct_novaClick
          end
          object btn_salva_ct_nova: TSpeedButton
            Left = 25
            Top = 12
            Width = 23
            Height = 29
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
            OnClick = btn_salva_ct_novaClick
          end
          object btn_cancela_ct_nova: TSpeedButton
            Left = 48
            Top = 12
            Width = 23
            Height = 29
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
            OnClick = btn_cancela_ct_novaClick
          end
          object dbedt_ct_old: TDBEdit
            Left = 19
            Top = 56
            Width = 140
            Height = 21
            Color = clScrollBar
            DataField = 'TX_OLD'
            DataSource = datm_ct_contabil.ds_contabil_novo
            Enabled = False
            TabOrder = 0
          end
          object dbedt_ct_new: TDBEdit
            Left = 20
            Top = 97
            Width = 140
            Height = 21
            DataField = 'TX_NEW'
            DataSource = datm_ct_contabil.ds_contabil_novo
            TabOrder = 1
            OnChange = dbedt_ct_newChange
          end
        end
      end
    end
    object ts_ct_contabil_gerencial: TTabSheet
      Caption = 'Conta Cont'#225'bil X Gerencial'
      object pgctrl_ct_contabil_gerencial: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        ActivePage = ts_lista2
        Align = alClient
        HotTrack = True
        TabOrder = 0
        OnChange = pgctrl_ct_contabilChange
        OnChanging = pgctrl_ct_contabil_gerencialChanging
        object ts_lista2: TTabSheet
          Caption = '    Lista    '
          object lbl_ct_contabil: TLabel
            Left = 3
            Top = 6
            Width = 84
            Height = 13
            Caption = 'Conta Cont'#225'bil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbg_ct_gerencial: TDBGrid
            Left = 1
            Top = 44
            Width = 718
            Height = 350
            DataSource = datm_ct_contabil.ds_ct_contabil_gerencial
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
                FieldName = 'LookMes'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 95
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_ANO'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 62
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_CT_GERENCIAL'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 52
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookCtGerencial'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 257
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_PORCENTAGEM'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 88
                Visible = True
              end>
          end
          object dbedt_cd_ct_contabil2: TDBEdit
            Left = 3
            Top = 20
            Width = 97
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_CT_CONTABIL'
            DataSource = datm_ct_contabil.ds_ct_contabil
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_nm_ct_contabil2: TDBEdit
            Left = 104
            Top = 20
            Width = 289
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NM_CT_CONTABIL'
            DataSource = datm_ct_contabil.ds_ct_contabil
            ReadOnly = True
            TabOrder = 2
          end
        end
        object ts_dados_basicos2: TTabSheet
          Caption = '   Dados B'#225'sicos   '
          object pnl_ct_contabil_gerencial: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 401
            Align = alClient
            BevelOuter = bvLowered
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object lbl_ct_gerencial: TLabel
              Left = 13
              Top = 98
              Width = 92
              Height = 13
              Caption = 'Conta Gerencial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_ct_gerencial: TSpeedButton
              Left = 346
              Top = 113
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
              OnClick = btn_co_ct_gerencialClick
            end
            object lbl_ct_contabil2: TLabel
              Left = 13
              Top = 13
              Width = 84
              Height = 13
              Caption = 'Conta Cont'#225'bil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 389
              Top = 98
              Width = 75
              Height = 13
              Caption = 'Porcentagem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_mes2: TLabel
              Left = 13
              Top = 57
              Width = 24
              Height = 13
              Caption = 'M'#234's'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_mes: TSpeedButton
              Left = 185
              Top = 72
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
              OnClick = btn_co_mesClick
            end
            object lbl_ano2: TLabel
              Left = 228
              Top = 57
              Width = 23
              Height = 13
              Caption = 'Ano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_cd_ct_gerencial: TDBEdit
              Left = 13
              Top = 113
              Width = 33
              Height = 21
              DataField = 'CD_CT_GERENCIAL'
              DataSource = datm_ct_contabil.ds_ct_contabil_gerencial
              TabOrder = 2
              OnChange = dbedt_cd_ct_gerencialChange
              OnExit = dbedt_cd_ct_gerencialExit
              OnKeyDown = dbedt_cd_classifKeyDown
            end
            object dbedt_nm_ct_gerencial: TDBEdit
              Left = 50
              Top = 113
              Width = 289
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookCtGerencial'
              DataSource = datm_ct_contabil.ds_ct_contabil_gerencial
              ReadOnly = True
              TabOrder = 4
            end
            object dbedt_cd_ct_contabil3: TDBEdit
              Left = 13
              Top = 31
              Width = 91
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_CT_CONTABIL'
              DataSource = datm_ct_contabil.ds_ct_contabil_gerencial
              ReadOnly = True
              TabOrder = 5
            end
            object dbedt_nm_ct_contabil3: TDBEdit
              Left = 105
              Top = 31
              Width = 289
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookCtContabil'
              DataSource = datm_ct_contabil.ds_ct_contabil_gerencial
              ReadOnly = True
              TabOrder = 6
            end
            object dbedt_vl_porcentagem: TDBEdit
              Left = 389
              Top = 113
              Width = 67
              Height = 21
              DataField = 'VL_PORCENTAGEM'
              DataSource = datm_ct_contabil.ds_ct_contabil_gerencial
              TabOrder = 3
              OnChange = dbedt_cd_ct_gerencialChange
              OnExit = dbedt_cd_ct_gerencialExit
              OnKeyDown = dbedt_cd_classifKeyDown
            end
            object dbedt_cd_mes: TDBEdit
              Left = 13
              Top = 72
              Width = 33
              Height = 21
              DataField = 'CD_MES'
              DataSource = datm_ct_contabil.ds_ct_contabil_gerencial
              TabOrder = 0
              OnChange = dbedt_cd_ct_gerencialChange
              OnExit = dbedt_cd_ct_gerencialExit
              OnKeyDown = dbedt_cd_classifKeyDown
            end
            object dbedt_nm_mes: TDBEdit
              Left = 50
              Top = 72
              Width = 130
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookMes'
              DataSource = datm_ct_contabil.ds_ct_contabil_gerencial
              ReadOnly = True
              TabOrder = 7
            end
            object dbedt_cd_ano: TDBEdit
              Left = 228
              Top = 72
              Width = 53
              Height = 21
              DataField = 'CD_ANO'
              DataSource = datm_ct_contabil.ds_ct_contabil_gerencial
              TabOrder = 1
              OnChange = dbedt_cd_ct_gerencialChange
              OnExit = dbedt_cd_ct_gerencialExit
              OnKeyDown = dbedt_cd_classifKeyDown
            end
          end
        end
      end
    end
    object ts_grafico: TTabSheet
      Caption = '     Gr'#225'fico     '
      TabVisible = False
      object tvw_grafico: TTreeView
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        Indent = 19
        TabOrder = 0
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
      Left = 116
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
      Left = 405
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
      Left = 40
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 78
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancelarClick
    end
    object btn_duplicar: TSpeedButton
      Left = 154
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Duplicar Conta Cont'#225'bil X Gerencial'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFFCCCCCF333333333377777F33FFFFFFFFCC
        CCCF33333333337F337F333FFFFFFFCCCCCF33333333337F337F3333FFFFFFCC
        CCCF33333333337FFF7F33333FFFFFCCCCCF3333333333777773333333FFFFFF
        FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
        00FF33333333333777FF333333333F00000F33FFFFF33777777F3CCCCC333000
        0000377777F3377777773CCCCC33333000FF37F337F3333777F33CCCCC333330
        00FF37F337F3333777F33CCCCC33333000FF37FFF7F333F777333CCCCC333000
        03FF3777773337777333333333333333333F3333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_duplicarClick
    end
    object btn_imprimir: TSpeedButton
      Left = 192
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Imprimir'
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
      OnClick = btn_imprimirClick
    end
    object pnl_pesquisa: TPanel
      Left = 446
      Top = 2
      Width = 294
      Height = 43
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 4
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
        Left = 136
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
        Left = 4
        Top = 20
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
      end
      object cb_ordem: TComboBox
        Left = 136
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
      Left = 279
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_ct_contabil.ds_ct_contabil
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object menu_cadastro: TMainMenu
    Left = 553
    Top = 372
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
    object mi_duplicar: TMenuItem
      Caption = '&Duplicar'
      Enabled = False
      OnClick = btn_duplicarClick
    end
    object mi_imprimir: TMenuItem
      Caption = 'Im&primir'
      OnClick = btn_imprimirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
  object crp_ct_contabil: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 552
    Top = 324
  end
  object Query1: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select *'
      'from  TFAVORECIDO'
      'where'
      '  CD_FAVORECIDO = '#39'00007'#39)
    Left = 268
    Top = 223
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 316
    Top = 207
  end
end

object frm_tx_codesp: Tfrm_tx_codesp
  Left = 140
  Top = 88
  Width = 640
  Height = 480
  Caption = 'Cadastro de Taxas da Codesp'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_codesp: TPageControl
    Left = 0
    Top = 49
    Width = 632
    Height = 384
    ActivePage = ts_dados_basicos
    TabOrder = 0
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados Básicos'
      object pnl_amz: TPanel
        Left = 7
        Top = 7
        Width = 613
        Height = 346
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Bevel6: TBevel
          Left = 68
          Top = 121
          Width = 441
          Height = 29
        end
        object Bevel15: TBevel
          Left = 128
          Top = 60
          Width = 60
          Height = 206
        end
        object Bevel10: TBevel
          Left = 68
          Top = 237
          Width = 441
          Height = 29
        end
        object Bevel8: TBevel
          Left = 68
          Top = 208
          Width = 441
          Height = 29
        end
        object Bevel5: TBevel
          Left = 68
          Top = 179
          Width = 441
          Height = 29
        end
        object Bevel3: TBevel
          Left = 68
          Top = 150
          Width = 441
          Height = 29
        end
        object Bevel4: TBevel
          Left = 68
          Top = 89
          Width = 441
          Height = 32
        end
        object Bevel18: TBevel
          Left = 404
          Top = 60
          Width = 105
          Height = 206
        end
        object Bevel17: TBevel
          Left = 299
          Top = 60
          Width = 105
          Height = 206
        end
        object Bevel2: TBevel
          Left = 68
          Top = 60
          Width = 441
          Height = 29
        end
        object Bevel16: TBevel
          Left = 188
          Top = 60
          Width = 111
          Height = 206
        end
        object Bevel22: TBevel
          Left = 509
          Top = 31
          Width = 104
          Height = 235
        end
        object Label21: TLabel
          Left = 540
          Top = 40
          Width = 28
          Height = 13
          Caption = 'Até 5 '
          FocusControl = dbedt_VL_MOV_ATE_5
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 540
          Top = 80
          Width = 53
          Height = 13
          Caption = 'Acima de 5'
          FocusControl = ebedt_VL_MOV_ACIMA_5
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 531
          Top = 157
          Width = 31
          Height = 13
          Caption = 'Granel'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 531
          Top = 198
          Width = 45
          Height = 13
          Caption = 'Container'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblGranel: TLabel
          Left = 17
          Top = 112
          Width = 31
          Height = 13
          Caption = 'Granel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 76
          Top = 67
          Width = 44
          Height = 13
          Caption = 'Acima de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 146
          Top = 67
          Width = 16
          Height = 13
          Caption = 'Até'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 104
          Top = 39
          Width = 45
          Height = 13
          Caption = 'US$/Ton'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblGeral: TLabel
          Left = 20
          Top = 214
          Width = 25
          Height = 13
          Caption = 'Geral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 439
          Top = 68
          Width = 35
          Height = 13
          Caption = 'Demais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 335
          Top = 68
          Width = 43
          Height = 13
          Caption = 'Segundo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl1: TLabel
          Left = 226
          Top = 66
          Width = 37
          Height = 13
          Caption = 'Primeiro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 153
          Top = 98
          Width = 18
          Height = 13
          Caption = '100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 95
          Top = 125
          Width = 18
          Height = 13
          Caption = '100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 93
          Top = 94
          Width = 18
          Height = 13
          Caption = '___'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label35: TLabel
          Left = 154
          Top = 239
          Width = 18
          Height = 13
          Caption = '___'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 95
          Top = 151
          Width = 18
          Height = 13
          Caption = '___'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 147
          Top = 156
          Width = 24
          Height = 13
          Caption = '5000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label39: TLabel
          Left = 91
          Top = 186
          Width = 24
          Height = 13
          Caption = '5000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label40: TLabel
          Left = 142
          Top = 190
          Width = 30
          Height = 13
          Caption = '10000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 86
          Top = 214
          Width = 30
          Height = 13
          Caption = '10000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label42: TLabel
          Left = 143
          Top = 214
          Width = 30
          Height = 13
          Caption = '15000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 85
          Top = 241
          Width = 30
          Height = 13
          Caption = '15000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 78
          Top = 273
          Width = 94
          Height = 13
          Caption = 'Mínimo por Período'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Bevel1: TBevel
          Left = 0
          Top = 89
          Width = 68
          Height = 61
        end
        object Bevel7: TBevel
          Left = 68
          Top = 31
          Width = 441
          Height = 29
        end
        object Bevel9: TBevel
          Left = 68
          Top = 266
          Width = 441
          Height = 29
        end
        object Bevel11: TBevel
          Left = 0
          Top = 31
          Width = 68
          Height = 264
        end
        object Bevel12: TBevel
          Left = 0
          Top = 150
          Width = 68
          Height = 145
        end
        object Bevel13: TBevel
          Left = 0
          Top = 31
          Width = 68
          Height = 58
        end
        object Label2: TLabel
          Left = 153
          Top = 124
          Width = 18
          Height = 13
          Caption = '___'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Bevel14: TBevel
          Left = 68
          Top = 60
          Width = 60
          Height = 206
        end
        object Bevel19: TBevel
          Left = 68
          Top = 0
          Width = 441
          Height = 31
        end
        object Label3: TLabel
          Left = 244
          Top = 7
          Width = 67
          Height = 13
          Caption = 'Armazenagem'
        end
        object Label4: TLabel
          Left = 285
          Top = 37
          Width = 38
          Height = 13
          Caption = 'Período'
        end
        object Bevel20: TBevel
          Left = 68
          Top = 31
          Width = 120
          Height = 29
        end
        object Bevel21: TBevel
          Left = 188
          Top = 31
          Width = 321
          Height = 29
        end
        object Label1: TLabel
          Left = 369
          Top = 38
          Width = 21
          Height = 13
          Caption = 'Dias'
        end
        object Label5: TLabel
          Left = 525
          Top = 9
          Width = 70
          Height = 13
          Caption = 'Movimentação'
        end
        object Bevel23: TBevel
          Left = 509
          Top = 0
          Width = 104
          Height = 31
        end
        object Bevel24: TBevel
          Left = 0
          Top = 0
          Width = 68
          Height = 31
        end
        object Label6: TLabel
          Left = 523
          Top = 42
          Width = 7
          Height = 13
          Caption = 'V'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 523
          Top = 53
          Width = 6
          Height = 13
          Caption = 'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 525
          Top = 67
          Width = 2
          Height = 13
          Caption = 'l'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 523
          Top = 77
          Width = 6
          Height = 13
          Caption = 'u'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 523
          Top = 89
          Width = 8
          Height = 13
          Caption = 'm'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 524
          Top = 102
          Width = 6
          Height = 13
          Caption = 'e'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 11
          Top = 311
          Width = 44
          Height = 13
          Caption = 'Taxa ISS'
          FocusControl = dbedt_PC_ISS
        end
        object Bevel25: TBevel
          Left = 509
          Top = 266
          Width = 104
          Height = 29
        end
        object Bevel26: TBevel
          Left = 0
          Top = 295
          Width = 613
          Height = 51
        end
        object dbedt_NR_PERIODO: TDBEdit
          Left = 327
          Top = 34
          Width = 39
          Height = 21
          DataField = 'NR_PERIODO'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 0
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GERAL_MIN: TDBEdit
          Left = 189
          Top = 270
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GERAL_MIN'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 24
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_MOV_ATE_5: TDBEdit
          Left = 539
          Top = 52
          Width = 64
          Height = 21
          DataField = 'VL_MOV_ATE_5'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 19
          OnChange = dbedt_NR_PERIODOChange
        end
        object ebedt_VL_MOV_ACIMA_5: TDBEdit
          Left = 539
          Top = 92
          Width = 64
          Height = 21
          DataField = 'VL_MOV_ACIMA_5'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 20
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_MOV_GRANEL: TDBEdit
          Left = 531
          Top = 170
          Width = 64
          Height = 21
          DataField = 'VL_MOV_GRANEL'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 21
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_MOV_CNTR: TDBEdit
          Left = 531
          Top = 210
          Width = 64
          Height = 21
          DataField = 'VL_MOV_CNTR'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 22
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GRANEL_1_1: TDBEdit
          Left = 210
          Top = 95
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GRANEL_1_1'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 1
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GRANEL_1_2: TDBEdit
          Left = 320
          Top = 97
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GRANEL_1_2'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 2
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GRANEL_1_3: TDBEdit
          Left = 424
          Top = 96
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GRANEL_1_3'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 3
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GRANEL_9_1: TDBEdit
          Left = 210
          Top = 124
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GRANEL_9_1'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 4
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GRANEL_9_2: TDBEdit
          Left = 320
          Top = 124
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GRANEL_9_2'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 5
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GRANEL_9_3: TDBEdit
          Left = 425
          Top = 124
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GRANEL_9_3'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 6
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GERAL_05_1: TDBEdit
          Left = 211
          Top = 154
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GERAL_05_1'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 7
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GERAL_05_2: TDBEdit
          Left = 321
          Top = 154
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GERAL_05_2'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 8
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GERAL_05_3: TDBEdit
          Left = 425
          Top = 154
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GERAL_05_3'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 9
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GERAL_10_1: TDBEdit
          Left = 211
          Top = 182
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GERAL_10_1'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 10
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GERAL_10_2: TDBEdit
          Left = 321
          Top = 182
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GERAL_10_2'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 11
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GERAL_10_3: TDBEdit
          Left = 425
          Top = 182
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GERAL_10_3'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 12
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GERAL_15_1: TDBEdit
          Left = 211
          Top = 213
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GERAL_15_1'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 13
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GERAL_15_2: TDBEdit
          Left = 320
          Top = 211
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GERAL_15_2'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 14
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GERAL_15_3: TDBEdit
          Left = 425
          Top = 212
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GERAL_15_3'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 15
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GERAL_99_1: TDBEdit
          Left = 211
          Top = 239
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GERAL_99_1'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 16
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GERAL_99_2: TDBEdit
          Left = 321
          Top = 240
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GERAL_99_2'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 17
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_VL_ARM_GERAL_99_3: TDBEdit
          Left = 425
          Top = 241
          Width = 64
          Height = 21
          DataField = 'VL_ARM_GERAL_99_3'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 18
          OnChange = dbedt_NR_PERIODOChange
        end
        object dbedt_PC_ISS: TDBEdit
          Left = 67
          Top = 309
          Width = 64
          Height = 21
          DataField = 'PC_ISS'
          DataSource = datm_tx_codesp.ds_tx_codesp
          TabOrder = 23
          OnChange = dbedt_NR_PERIODOChange
        end
      end
    end
  end
  object pnl_btn_codesp: TPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 1
    object btn_incluir: TSpeedButton
      Left = 8
      Top = 12
      Width = 25
      Height = 25
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
    end
    object btn_excluir: TSpeedButton
      Left = 92
      Top = 12
      Width = 25
      Height = 25
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
    end
    object btn_sair: TSpeedButton
      Left = 280
      Top = 12
      Width = 25
      Height = 25
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
      Left = 36
      Top = 12
      Width = 25
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
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 64
      Top = 12
      Width = 25
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
      OnClick = btn_cancelarClick
    end
  end
  object menu_cadastro: TMainMenu
    Left = 508
    Top = 12
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      Hint = ' '
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
    end
    object mi_sair: TMenuItem
      Caption = '&Sair'
      OnClick = mi_sairClick
    end
  end
end

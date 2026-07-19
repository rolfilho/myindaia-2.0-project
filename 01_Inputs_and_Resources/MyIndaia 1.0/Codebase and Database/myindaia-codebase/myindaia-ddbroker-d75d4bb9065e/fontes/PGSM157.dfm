object frm_ncm: Tfrm_ncm
  Left = 377
  Top = 226
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Nomenclatura Comum do Mercosul - NCM'
  ClientHeight = 504
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_ncm: TPageControl
    Left = 0
    Top = 47
    Width = 742
    Height = 457
    ActivePage = ts_lista
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_ncmChange
    OnChanging = pgctrl_ncmChanging
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
      end
      object dbgrd_ncm: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        DataSource = datm_ncm.ds_ncm_
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
            FieldName = 'CODIGO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
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
      Caption = 'Dados b'#225'sicos'
      object Bevel2: TBevel
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
      end
      object Bevel4: TBevel
        Left = 340
        Top = 105
        Width = 316
        Height = 54
      end
      object Bevel3: TBevel
        Left = 12
        Top = 105
        Width = 316
        Height = 54
      end
      object Label1: TLabel
        Left = 14
        Top = 7
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbedt_cd_ncm
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 113
        Top = 7
        Width = 58
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbedt_nm_ncm
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 13
        Top = 48
        Width = 110
        Height = 13
        Caption = 'Unidade de medida'
        FocusControl = dbedt_cd_unid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 23
        Top = 113
        Width = 47
        Height = 13
        Caption = 'Aliquota II'
        FocusControl = dbedt_aliq_II
      end
      object Label5: TLabel
        Left = 113
        Top = 113
        Width = 54
        Height = 13
        Caption = 'Inicio vig. II'
        FocusControl = dbedt_ini_II
      end
      object Label6: TLabel
        Left = 204
        Top = 113
        Width = 45
        Height = 13
        Caption = 'Fim vig. II'
        FocusControl = dbedt_fim_II
      end
      object Label7: TLabel
        Left = 350
        Top = 113
        Width = 49
        Height = 13
        Caption = 'Al'#237'quota II'
        FocusControl = dbedt_II_Merc
      end
      object Label8: TLabel
        Left = 439
        Top = 113
        Width = 56
        Height = 13
        Caption = 'In'#237'cio vig. II'
        FocusControl = dbedt_ini_II_Merc
      end
      object Label9: TLabel
        Left = 529
        Top = 113
        Width = 45
        Height = 13
        Caption = 'Fim vig. II'
        FocusControl = dbedt_fim_II_Merc
      end
      object Label13: TLabel
        Left = 12
        Top = 89
        Width = 49
        Height = 13
        Caption = 'Dados II'
        FocusControl = dbedt_cd_unid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 339
        Top = 89
        Width = 112
        Height = 13
        Caption = 'Dados II - Mercosul'
        FocusControl = dbedt_cd_unid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 11
        Top = 173
        Width = 57
        Height = 13
        Caption = 'Dados IPI'
        FocusControl = dbedt_cd_unid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object speed_unidade_: TSpeedButton
        Left = 331
        Top = 63
        Width = 24
        Height = 23
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
        OnClick = speed_unidade_Click
      end
      object Label16: TLabel
        Left = 339
        Top = 173
        Width = 74
        Height = 13
        Caption = 'Dados GATT'
        FocusControl = dbedt_cd_unid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel6: TBevel
        Left = 340
        Top = 190
        Width = 316
        Height = 54
      end
      object Bevel5: TBevel
        Left = 12
        Top = 190
        Width = 316
        Height = 54
      end
      object Label17: TLabel
        Left = 350
        Top = 198
        Width = 72
        Height = 13
        Caption = 'Al'#237'quota GATT'
        FocusControl = dbedt_gatt
      end
      object Label18: TLabel
        Left = 439
        Top = 198
        Width = 79
        Height = 13
        Caption = 'In'#237'cio vig. GATT'
        FocusControl = dbedt_ini_gatt
      end
      object Label19: TLabel
        Left = 529
        Top = 198
        Width = 68
        Height = 13
        Caption = 'Fim vig. GATT'
        FocusControl = dbedt_fim_gatt
      end
      object Label12: TLabel
        Left = 200
        Top = 200
        Width = 52
        Height = 13
        Caption = 'Fim vig. IPI'
        FocusControl = dbedt_fim_IPI
      end
      object Label11: TLabel
        Left = 110
        Top = 200
        Width = 61
        Height = 13
        Caption = 'Inicio vig. IPI'
        FocusControl = dbedt_ini_IPI
      end
      object Label10: TLabel
        Left = 21
        Top = 199
        Width = 56
        Height = 13
        Caption = 'Al'#237'quota IPI'
        FocusControl = dbedt_IPI
      end
      object Bevel7: TBevel
        Left = 12
        Top = 274
        Width = 316
        Height = 54
      end
      object Label20: TLabel
        Left = 21
        Top = 283
        Width = 60
        Height = 13
        Caption = 'Al'#237'quota PIS'
        FocusControl = dbedt_PIS
      end
      object Label21: TLabel
        Left = 110
        Top = 284
        Width = 65
        Height = 13
        Caption = 'Inicio vig. PIS'
        FocusControl = dbedt_ini_PIS
      end
      object Label22: TLabel
        Left = 200
        Top = 284
        Width = 56
        Height = 13
        Caption = 'Fim vig. PIS'
        FocusControl = dbedt_fim_PIS
      end
      object Label23: TLabel
        Left = 11
        Top = 257
        Width = 61
        Height = 13
        Caption = 'Dados PIS'
        FocusControl = dbedt_cd_unid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel8: TBevel
        Left = 340
        Top = 275
        Width = 316
        Height = 54
      end
      object Label24: TLabel
        Left = 529
        Top = 284
        Width = 78
        Height = 13
        Caption = 'Fim vig. COFINS'
        FocusControl = dbedt_fim_COFINS
      end
      object Label25: TLabel
        Left = 439
        Top = 284
        Width = 87
        Height = 13
        Caption = 'Inicio vig. COFINS'
        FocusControl = dbedt_ini_COFINS
      end
      object Label26: TLabel
        Left = 350
        Top = 284
        Width = 82
        Height = 13
        Caption = 'Al'#237'quota COFINS'
        FocusControl = dbedt_COFINS
      end
      object Label27: TLabel
        Left = 339
        Top = 258
        Width = 86
        Height = 13
        Caption = 'Dados COFINS'
        FocusControl = dbedt_cd_unid
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_cd_ncm: TDBEdit
        Left = 14
        Top = 23
        Width = 90
        Height = 21
        DataField = 'CODIGO'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 0
        OnChange = ver_botoes
      end
      object dbedt_nm_ncm: TDBEdit
        Left = 113
        Top = 23
        Width = 491
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 1
        OnChange = ver_botoes
      end
      object dbedt_cd_unid: TDBEdit
        Left = 13
        Top = 64
        Width = 28
        Height = 21
        DataField = 'UNIDADE_MEDIDA'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 2
        OnChange = ver_botoes
      end
      object dbedt_aliq_II: TDBEdit
        Left = 23
        Top = 129
        Width = 76
        Height = 21
        DataField = 'ALIQUOTA_II'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 4
        OnChange = ver_botoes
      end
      object dbedt_ini_II: TDBEdit
        Left = 113
        Top = 129
        Width = 76
        Height = 21
        DataField = 'DATA_INICIO_VIG_II'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 5
        OnChange = ver_botoes
        OnExit = dbedt_ini_IIExit
      end
      object dbedt_fim_II: TDBEdit
        Left = 204
        Top = 129
        Width = 76
        Height = 21
        DataField = 'DATA_FIM_VIG_II'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 6
        OnChange = ver_botoes
        OnExit = dbedt_fim_IIExit
      end
      object dbedt_II_Merc: TDBEdit
        Left = 350
        Top = 129
        Width = 76
        Height = 21
        DataField = 'ALIQUOTA_II_MERCOSUL'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 7
        OnChange = ver_botoes
      end
      object dbedt_ini_II_Merc: TDBEdit
        Left = 439
        Top = 129
        Width = 76
        Height = 21
        DataField = 'DATA_INICIO_VIG_II_MSUL'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 8
        OnChange = ver_botoes
        OnExit = dbedt_ini_II_MercExit
      end
      object dbedt_fim_II_Merc: TDBEdit
        Left = 529
        Top = 129
        Width = 76
        Height = 21
        DataField = 'DATA_FIM_VIG_II_MSUL'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 9
        OnChange = ver_botoes
        OnExit = dbedt_fim_II_MercExit
      end
      object dbedt_IPI: TDBEdit
        Left = 21
        Top = 215
        Width = 76
        Height = 21
        DataField = 'ALIQUOTA_IPI'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 10
        OnChange = ver_botoes
      end
      object dbedt_ini_IPI: TDBEdit
        Left = 110
        Top = 216
        Width = 76
        Height = 21
        DataField = 'DATA_INICIO_VIG_IPI'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 11
        OnChange = ver_botoes
        OnExit = dbedt_ini_IPIExit
      end
      object dbedt_fim_IPI: TDBEdit
        Left = 200
        Top = 216
        Width = 76
        Height = 21
        DataField = 'DATA_FIM_VIG_IPI'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 12
        OnChange = ver_botoes
        OnExit = dbedt_fim_IPIExit
      end
      object dbedt_nm_unid: TDBEdit
        Left = 47
        Top = 64
        Width = 282
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'nm_unid_medida'
        DataSource = datm_ncm.ds_ncm_
        ReadOnly = True
        TabOrder = 3
      end
      object dbchkbx_nec_li: TDBCheckBox
        Left = 12
        Top = 370
        Width = 209
        Height = 17
        Caption = 'Necessidade de LI - SISCOMEX'
        DataField = 'IN_NECESSITA_LI'
        DataSource = datm_ncm.ds_ncm_
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 16
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbedt_gatt: TDBEdit
        Left = 350
        Top = 214
        Width = 76
        Height = 21
        DataField = 'ALIQUOTA_II_MERCOSUL'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 13
        OnChange = ver_botoes
      end
      object dbedt_ini_gatt: TDBEdit
        Left = 439
        Top = 214
        Width = 76
        Height = 21
        DataField = 'DATA_INICIO_VIG_II_MSUL'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 14
        OnChange = ver_botoes
        OnExit = dbedt_ini_II_MercExit
      end
      object dbedt_fim_gatt: TDBEdit
        Left = 529
        Top = 214
        Width = 76
        Height = 21
        DataField = 'DATA_FIM_VIG_II_MSUL'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 15
        OnChange = ver_botoes
        OnExit = dbedt_fim_II_MercExit
      end
      object DBCheckBox1: TDBCheckBox
        Left = 348
        Top = 370
        Width = 246
        Height = 17
        Caption = 'Necessidade de Anu'#234'ncia do Ex'#233'rcito'
        DataField = 'IN_ANUENCIA_EXERCITO'
        DataSource = datm_ncm.ds_ncm_
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 17
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = ver_botoes
      end
      object dbedt_PIS: TDBEdit
        Left = 21
        Top = 299
        Width = 76
        Height = 21
        DataField = 'ALIQUOTA_PIS_ADVAL'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 18
        OnChange = ver_botoes
      end
      object dbedt_ini_PIS: TDBEdit
        Left = 110
        Top = 300
        Width = 76
        Height = 21
        DataField = 'DATA_INI_VIG_PIS_ADVAL'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 19
        OnChange = ver_botoes
        OnExit = dbedt_ini_PISExit
      end
      object dbedt_fim_PIS: TDBEdit
        Left = 200
        Top = 300
        Width = 76
        Height = 21
        DataField = 'DATA_FIM_VIG_PIS_ADVAL'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 20
        OnChange = ver_botoes
        OnExit = dbedt_fim_PISExit
      end
      object dbedt_fim_COFINS: TDBEdit
        Left = 529
        Top = 300
        Width = 76
        Height = 21
        DataField = 'DATA_FIM_VIG_COFINS_ADVAL'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 21
        OnChange = ver_botoes
        OnExit = dbedt_fim_COFINSExit
      end
      object dbedt_ini_COFINS: TDBEdit
        Left = 439
        Top = 300
        Width = 76
        Height = 21
        DataField = 'DATA_INI_VIG_COFINS_ADVAL'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 22
        OnChange = ver_botoes
        OnExit = dbedt_ini_COFINSExit
      end
      object dbedt_COFINS: TDBEdit
        Left = 350
        Top = 300
        Width = 76
        Height = 21
        DataField = 'ALIQUOTA_COFINS_ADVAL'
        DataSource = datm_ncm.ds_ncm_
        TabOrder = 23
        OnChange = ver_botoes
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
      Top = 2
      Width = 38
      Height = 42
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
      Top = 2
      Width = 38
      Height = 42
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
      Left = 393
      Top = 2
      Width = 38
      Height = 42
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
      Top = 2
      Width = 38
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
    object btn_cancelar: TSpeedButton
      Left = 78
      Top = 2
      Width = 38
      Height = 42
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
    object btn_planilha: TSpeedButton
      Left = 154
      Top = 2
      Width = 38
      Height = 42
      Hint = 'Leitura da Planilha SISCOMEX de Necessidade de LI'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
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
      OnClick = btn_planilhaClick
    end
    object dbnvg: TDBNavigator
      Left = 232
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_ncm.ds_ncm_
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
      Height = 43
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      object lbl_pesquisa: TLabel
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
      object lbl_ordem_pesquisa: TLabel
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
  object PB: TProgressBar
    Left = 394
    Top = 50
    Width = 347
    Height = 15
    TabOrder = 2
    Visible = False
  end
  object PnlAtualizando: TPanel
    Left = 211
    Top = 51
    Width = 181
    Height = 13
    BevelOuter = bvNone
    Caption = 'Aguarde, atualizando tabelas...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
  end
  object MainMenu1: TMainMenu
    Left = 578
    Top = 230
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      OnClick = btn_incluirClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      OnClick = btn_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'Arquivos XLS|*.XLS;'
    Left = 376
    Top = 129
  end
end

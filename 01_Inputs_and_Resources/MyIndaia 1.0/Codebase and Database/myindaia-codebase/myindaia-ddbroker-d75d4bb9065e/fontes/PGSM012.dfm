object frm_unid_medida: Tfrm_unid_medida
  Left = 262
  Top = 122
  Width = 750
  Height = 550
  Caption = 'Cadastro de Unidades de Medida'
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
  object pgctrl_unid_medida: TPageControl
    Left = 0
    Top = 47
    Width = 734
    Height = 444
    ActivePage = ts_dados_basicos
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_unid_medidaChange
    OnChanging = pgctrl_unid_medidaChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        DataSource = ds_unid_medida
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
            FieldName = 'CD_UNID_MEDIDA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_UNID_MEDIDA'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 437
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_GIPLITE'
            Title.Caption = 'C'#243'd GIPLITE'
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
            FieldName = 'calcAtivo'
            Font.Charset = SYMBOL_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = 'Wingdings'
            Font.Style = [fsBold]
            Title.Caption = 'Ativo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 59
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 416
        Align = alClient
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_codigo: TLabel
          Left = 12
          Top = 9
          Width = 40
          Height = 13
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nome: TLabel
          Left = 12
          Top = 47
          Width = 139
          Height = 13
          Caption = 'Descri'#231#227'o em Portugu'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 12
          Top = 165
          Width = 79
          Height = 13
          Caption = 'C'#243'd. GIPLITE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_sigla: TLabel
          Left = 364
          Top = 47
          Width = 29
          Height = 13
          Caption = 'Sigla'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 12
          Top = 203
          Width = 89
          Height = 13
          Caption = 'Unid. Scx. Exp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl1: TLabel
          Left = 12
          Top = 87
          Width = 116
          Height = 13
          Caption = 'Descri'#231#227'o em Ingl'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 366
          Top = 87
          Width = 29
          Height = 13
          Caption = 'Sigla'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl3: TLabel
          Left = 12
          Top = 126
          Width = 134
          Height = 13
          Caption = 'Descri'#231#227'o em Espanhol'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 366
          Top = 126
          Width = 29
          Height = 13
          Caption = 'Sigla'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 10
          Top = 244
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
        object SpeedButton1: TSpeedButton
          Left = 77
          Top = 255
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
        object dbedt_cd_unid_medida: TDBEdit
          Left = 12
          Top = 23
          Width = 54
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_UNID_MEDIDA'
          DataSource = ds_unid_medida
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 9
        end
        object dbedt_nm_unid_medida: TDBEdit
          Left = 12
          Top = 62
          Width = 345
          Height = 21
          DataField = 'NM_UNID_MEDIDA'
          DataSource = ds_unid_medida
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_nm_unid_medidaChange
        end
        object dbedt_cd_GIPLITE: TDBEdit
          Left = 12
          Top = 179
          Width = 41
          Height = 21
          DataField = 'CD_GIPLITE'
          DataSource = ds_unid_medida
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnChange = dbedt_nm_unid_medidaChange
        end
        object dbedt_nm_sigla: TDBEdit
          Left = 364
          Top = 62
          Width = 41
          Height = 21
          DataField = 'NM_SIGLA'
          DataSource = ds_unid_medida
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = dbedt_nm_unid_medidaChange
        end
        object dbedt_cd_scx_exp: TDBEdit
          Left = 12
          Top = 218
          Width = 41
          Height = 21
          DataField = 'CD_SCX_EXP'
          DataSource = ds_unid_medida
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnChange = dbedt_nm_unid_medidaChange
        end
        object dbedtDescIng: TDBEdit
          Left = 12
          Top = 101
          Width = 345
          Height = 21
          DataField = 'NM_UNID_MEDIDA_ING'
          DataSource = ds_unid_medida
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_nm_unid_medidaChange
          OnClick = dbedt_nm_unid_medidaChange
        end
        object dbedtSiglaIng: TDBEdit
          Left = 366
          Top = 101
          Width = 41
          Height = 21
          DataField = 'NM_SIGLA_ING'
          DataSource = ds_unid_medida
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = dbedt_nm_unid_medidaChange
          OnClick = dbedt_nm_unid_medidaChange
        end
        object dbedtDescEsp: TDBEdit
          Left = 12
          Top = 140
          Width = 345
          Height = 21
          DataField = 'NM_UNID_MEDIDA_ESP'
          DataSource = ds_unid_medida
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = dbedt_nm_unid_medidaChange
          OnClick = dbedt_nm_unid_medidaChange
        end
        object dbedtSiglaEsp: TDBEdit
          Left = 366
          Top = 140
          Width = 41
          Height = 21
          DataField = 'NM_SIGLA_ESP'
          DataSource = ds_unid_medida
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnChange = dbedt_nm_unid_medidaChange
          OnClick = dbedt_nm_unid_medidaChange
        end
        object dbchkAtivo: TDBCheckBox
          Left = 79
          Top = 21
          Width = 97
          Height = 17
          Caption = 'Ativo'
          DataField = 'IN_ATIVO'
          DataSource = ds_unid_medida
          TabOrder = 10
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_nm_unid_medidaChange
        end
        object dbedt_Fiesp: TDBEdit
          Left = 10
          Top = 258
          Width = 59
          Height = 21
          DataField = 'FIESP_Id'
          DataSource = ds_unid_medida
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
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
    DesignSize = (
      734
      47)
    object btn_incluir: TSpeedButton
      Left = 3
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
      Left = 117
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
      Left = 400
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Sair'
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
      Left = 41
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
      Left = 79
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
    object Label1: TLabel
      Left = 446
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
    end
    object Label2: TLabel
      Left = 582
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
    end
    object dbnvg: TDBNavigator
      Left = 284
      Top = 12
      Width = 104
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
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
    object edt_chave: TEdit
      Left = 446
      Top = 20
      Width = 129
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnChange = edt_chaveChange
      OnKeyDown = edt_chaveKeyDown
    end
    object cb_ordem: TComboBox
      Left = 582
      Top = 20
      Width = 153
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
      OnClick = cb_ordemClick
    end
  end
  object menu_cadastro: TMainMenu
    Left = 552
    Top = 364
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
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
  object qry_unid_medida_: TQuery
    OnCalcFields = qry_unid_medida_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TUNID_MEDIDA_BROKER'
      'ORDER BY'
      'CD_UNID_MEDIDA')
    Left = 548
    Top = 153
    object qry_unid_medida_CD_UNID_MEDIDA: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'TUNID_MEDIDA.CD_UNID_MEDIDA'
      Size = 3
    end
    object qry_unid_medida_NM_UNID_MEDIDA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_UNID_MEDIDA'
      Origin = 'TUNID_MEDIDA.NM_UNID_MEDIDA'
      Size = 50
    end
    object qry_unid_medida_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_MEDIDA.CD_UNID_MEDIDA'
      Size = 1
    end
    object qry_unid_medida_CD_GIPLITE: TStringField
      FieldName = 'CD_GIPLITE'
      Origin = 'TUNID_MEDIDA.CD_UNID_MEDIDA'
      Size = 2
    end
    object qry_unid_medida_NM_SIGLA: TStringField
      FieldName = 'NM_SIGLA'
      Origin = 'TUNID_MEDIDA_BROKER.CD_UNID_MEDIDA'
      Size = 3
    end
    object qry_unid_medida_CD_SCX_EXP: TStringField
      FieldName = 'CD_SCX_EXP'
      Origin = 'TUNID_MEDIDA_BROKER.CD_UNID_MEDIDA'
      Size = 2
    end
    object qry_unid_medida_NM_UNID_MEDIDA_ING: TStringField
      FieldName = 'NM_UNID_MEDIDA_ING'
      Origin = 'DBBROKER.TUNID_MEDIDA_BROKER.NM_UNID_MEDIDA_ING'
      FixedChar = True
      Size = 50
    end
    object qry_unid_medida_NM_UNID_MEDIDA_ESP: TStringField
      FieldName = 'NM_UNID_MEDIDA_ESP'
      Origin = 'DBBROKER.TUNID_MEDIDA_BROKER.NM_UNID_MEDIDA_ESP'
      FixedChar = True
      Size = 50
    end
    object qry_unid_medida_NM_SIGLA_ING: TStringField
      FieldName = 'NM_SIGLA_ING'
      Origin = 'DBBROKER.TUNID_MEDIDA_BROKER.NM_SIGLA_ING'
      FixedChar = True
      Size = 3
    end
    object qry_unid_medida_NM_SIGLA_ESP: TStringField
      FieldName = 'NM_SIGLA_ESP'
      Origin = 'DBBROKER.TUNID_MEDIDA_BROKER.NM_SIGLA_ESP'
      FixedChar = True
      Size = 3
    end
    object qry_unid_medida_calcAtivo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcAtivo'
      Size = 1
      Calculated = True
    end
    object qry_unid_medida_FIESP_Id: TIntegerField
      FieldName = 'FIESP_Id'
      Origin = 'DBBROKER.TUNID_MEDIDA_BROKER.FIESP_Id'
    end
  end
  object ds_unid_medida: TDataSource
    DataSet = qry_unid_medida_
    Left = 508
    Top = 153
  end
end

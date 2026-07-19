object frm_Declaracoes_Fiesp: Tfrm_Declaracoes_Fiesp
  Left = 321
  Top = 102
  Width = 729
  Height = 640
  Caption = 'Declara'#231#245'es de Certificado de Origem - FIESP'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = menu_cadastro
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_fiesp: TPageControl
    Left = 0
    Top = 106
    Width = 721
    Height = 488
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_fiespChange
    OnChanging = pgctrl_fiespChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_declaracoes: TDBGrid
        Left = 0
        Top = 51
        Width = 713
        Height = 409
        Align = alClient
        DataSource = ds_declaracoes
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgAlwaysShowSelection]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_declaracoesDblClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_ACORDO_BROKER'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Acordo '
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 101
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_DECLARACAO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd Declara'#231#227'o'
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
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_NCM_NALADI'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Classifica'#231#227'o'
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
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_VALIDADE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Vencimento'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 83
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_ATUALIZACAO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 7895160
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #218'ltima Atualiza'#231#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 117
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TX_IN_ATIVO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'STATUS'
            Title.Color = 8404992
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 93
            Visible = True
          end
          item
            Alignment = taCenter
            Color = 15859451
            Expanded = False
            FieldName = 'calc_renova_ws'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'RENOVAR'
            Title.Color = clYellow
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 82
            Visible = True
          end>
      end
      object pFiltro: TPanel
        Left = 0
        Top = 0
        Width = 713
        Height = 51
        Align = alTop
        TabOrder = 1
        object Label2: TLabel
          Left = 13
          Top = 6
          Width = 41
          Height = 13
          Caption = 'Acordo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_NCM_NALADI: TLabel
          Left = 179
          Top = 6
          Width = 76
          Height = 13
          Caption = 'Classifica'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 323
          Top = 7
          Width = 37
          Height = 13
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8404992
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_ncm_naladi: TEdit
          Left = 178
          Top = 20
          Width = 118
          Height = 21
          TabOrder = 0
          OnExit = Filtro
          OnKeyPress = Somente_Numeros
          OnKeyUp = edt_ncm_naladiKeyUp
        end
        object cb_acordos: TComboBox
          Left = 14
          Top = 19
          Width = 139
          Height = 22
          BevelOuter = bvRaised
          Style = csOwnerDrawFixed
          CharCase = ecUpperCase
          Ctl3D = True
          DropDownCount = 12
          ItemHeight = 16
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 1
          Text = 'TODOS'
          OnChange = Filtro
          Items.Strings = (
            'TODOS'
            'ACE 18'
            'ACE 35'
            'ACE 36'
            'ACE 53'
            'ACE 58'
            'ACE 59'
            'ACE 62'
            'COMUM'
            'PAR-04')
        end
        object cb_Status: TComboBox
          Left = 324
          Top = 20
          Width = 115
          Height = 22
          BevelOuter = bvRaised
          Style = csOwnerDrawFixed
          CharCase = ecUpperCase
          Ctl3D = True
          DropDownCount = 12
          ItemHeight = 16
          ItemIndex = 1
          ParentCtl3D = False
          TabOrder = 2
          Text = '1 - ATIVOS'
          OnChange = Filtro
          Items.Strings = (
            'TODOS'
            '1 - ATIVOS'
            '0 - N'#194'O ATIVOS')
        end
        object cbVencimento: TCheckBox
          Left = 472
          Top = 24
          Width = 197
          Height = 17
          Caption = 'a vencer nos proximos 30 dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = Filtro
        end
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados B'#225'sicos'
      object Panel1: TPanel
        Left = 24
        Top = 40
        Width = 665
        Height = 105
        BevelWidth = 2
        TabOrder = 0
        object Label4: TLabel
          Left = 25
          Top = 36
          Width = 41
          Height = 13
          Caption = 'Acordo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 180
          Top = 36
          Width = 76
          Height = 13
          Caption = 'Classifica'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 400
          Top = 36
          Width = 50
          Height = 13
          Caption = 'Validade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 275
          Top = 36
          Width = 109
          Height = 13
          Caption = 'C'#243'digo Declara'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object db_classificacao: TDBEdit
          Left = 178
          Top = 49
          Width = 81
          Height = 21
          DataField = 'CD_NCM_NALADI'
          DataSource = ds_declaracoes
          TabOrder = 0
          OnKeyPress = Somente_Numeros
        end
        object db_Acordo: TRxDBComboBox
          Left = 24
          Top = 49
          Width = 138
          Height = 21
          DataField = 'CD_ACORDO_BROKER'
          DataSource = ds_declaracoes
          EnableValues = False
          ItemHeight = 13
          Items.Strings = (
            'ACE 18'
            'ACE 35'
            'ACE 36'
            'ACE 53'
            'ACE 58'
            'ACE 59'
            'ACE 62'
            'COMUM'
            'PAR-04')
          TabOrder = 1
          Values.Strings = (
            'ACE 18'
            'ACE 35'
            'ACE 36'
            'ACE 53'
            'ACE 58'
            'ACE 59'
            'ACE 62'
            'COMUM'
            'PAR-04')
        end
        object db_validade: TDBDateEdit
          Left = 400
          Top = 49
          Width = 121
          Height = 21
          DataField = 'DT_VALIDADE'
          DataSource = ds_declaracoes
          NumGlyphs = 2
          TabOrder = 2
        end
        object db_cd_declaracao: TDBEdit
          Left = 275
          Top = 49
          Width = 108
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_DECLARACAO'
          DataSource = ds_declaracoes
          TabOrder = 3
        end
        object DBCheckBox1: TDBCheckBox
          Left = 549
          Top = 51
          Width = 63
          Height = 17
          Caption = 'ATIVA'
          DataField = 'IN_ATIVO'
          DataSource = ds_declaracoes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
  end
  object pnl_btn_ag: TPanel
    Left = 0
    Top = 0
    Width = 721
    Height = 52
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      721
      52)
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 39
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
      Left = 122
      Top = 4
      Width = 39
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
      Left = 681
      Top = 11
      Width = 27
      Height = 29
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
      Left = 44
      Top = 4
      Width = 39
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
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 83
      Top = 4
      Width = 39
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
      OnClick = btn_cancelarClick
    end
    object nvg_declaracoes: TDBNavigator
      Left = 419
      Top = 12
      Width = 256
      Height = 28
      DataSource = ds_declaracoes
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
    end
  end
  object pnl_Empresa: TPanel
    Left = 0
    Top = 52
    Width = 721
    Height = 54
    Align = alTop
    TabOrder = 2
    object btn_co_exportador: TSpeedButton
      Left = 441
      Top = 24
      Width = 24
      Height = 20
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
      OnClick = edt_cd_exportadorExit
    end
    object Label5: TLabel
      Left = 474
      Top = 7
      Width = 48
      Height = 13
      Caption = 'C.N.P.J.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 71
      Top = 7
      Width = 62
      Height = 13
      Caption = 'Exportador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 12
      Top = 7
      Width = 40
      Height = 13
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_cd_exportador: TEdit
      Left = 12
      Top = 23
      Width = 51
      Height = 21
      TabOrder = 0
      OnExit = edt_cd_exportadorExit
    end
    object edt_nm_exportador: TEdit
      Left = 70
      Top = 23
      Width = 366
      Height = 21
      Color = clSilver
      ReadOnly = True
      TabOrder = 1
      OnChange = Filtro
    end
    object edt_cnpj: TMaskEdit
      Left = 473
      Top = 23
      Width = 117
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clSilver
      EditMask = '99.999.999/9999-99;0; '
      MaxLength = 18
      ReadOnly = True
      TabOrder = 2
    end
  end
  object menu_cadastro: TMainMenu
    Left = 348
    Top = 8
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
  object qry_declaracoes: TQuery
    BeforePost = qry_declaracoesBeforePost
    BeforeDelete = qry_declaracoesBeforeDelete
    OnCalcFields = qry_declaracoesCalcFields
    OnNewRecord = qry_declaracoesNewRecord
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      ' SELECT'
      '  CD_EMPRESA,'
      '  CD_ACORDO_FIESP,'
      '  CD_ACORDO_BROKER,'
      '  CD_DECLARACAO,'
      '  CD_NCM_NALADI,'
      '  DT_VALIDADE,'
      '  DT_ATUALIZACAO,'
      '  IN_ATIVO,'
      '  IN_RENOVA_WS'
      '  FROM TDECLARACOES_FIESP'
      '  where CD_EMPRESA = :CD_EMPRESA'
      '  AND ( CD_ACORDO_BROKER= :CD_ACORDO OR :CD_ACORDO = '#39'TODOS'#39' )'
      
        '  AND ( CD_NCM_NALADI = :CD_NCM_NALADI  OR  :CD_NCM_NALADI = '#39#39' ' +
        '  )'
      '  AND ( IN_ATIVO = :IN_ATIVO   OR  :IN_ATIVO = '#39'TODOS'#39'    ) '
      '  AND ( DT_VALIDADE< :Vencimento or :Vencimento = '#39#39'    )')
    Left = 236
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ACORDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ACORDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_NCM_NALADI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_NCM_NALADI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IN_ATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IN_ATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Vencimento'
        ParamType = ptUnknown
      end>
    object qry_declaracoesCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.Tdeclaracoes_Fiesp.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_declaracoesCD_ACORDO_FIESP: TStringField
      FieldName = 'CD_ACORDO_FIESP'
      Origin = 'DBBROKER.Tdeclaracoes_Fiesp.CD_ACORDO_FIESP'
      FixedChar = True
      Size = 2
    end
    object qry_declaracoesCD_ACORDO_BROKER: TStringField
      FieldName = 'CD_ACORDO_BROKER'
      Origin = 'DBBROKER.Tdeclaracoes_Fiesp.CD_ACORDO_BROKER'
      FixedChar = True
      Size = 10
    end
    object qry_declaracoesCD_DECLARACAO: TStringField
      FieldName = 'CD_DECLARACAO'
      Origin = 'DBBROKER.Tdeclaracoes_Fiesp.CD_DECLARACAO'
      FixedChar = True
      Size = 10
    end
    object qry_declaracoesCD_NCM_NALADI: TStringField
      FieldName = 'CD_NCM_NALADI'
      Origin = 'DBBROKER.Tdeclaracoes_Fiesp.CD_NCM_NALADI'
      FixedChar = True
      Size = 10
    end
    object qry_declaracoesDT_VALIDADE: TDateTimeField
      FieldName = 'DT_VALIDADE'
      Origin = 'DBBROKER.Tdeclaracoes_Fiesp.DT_VALIDADE'
    end
    object qry_declaracoesDT_ATUALIZACAO: TDateTimeField
      FieldName = 'DT_ATUALIZACAO'
      Origin = 'DBBROKER.TDECLARACOES_FIESP.DT_ATUALIZACAO'
    end
    object qry_declaracoesIN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.Tdeclaracoes_Fiesp.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_declaracoesTX_IN_ATIVO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TX_IN_ATIVO'
      ProviderFlags = []
      Calculated = True
    end
    object qry_declaracoesIN_RENOVA_WS: TStringField
      FieldName = 'IN_RENOVA_WS'
      Origin = 'DBBROKER.TDECLARACOES_FIESP.IN_RENOVA_WS'
      FixedChar = True
      Size = 1
    end
    object qry_declaracoescalc_renova_ws: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_renova_ws'
      ProviderFlags = []
      Size = 3
      Calculated = True
    end
  end
  object ds_declaracoes: TDataSource
    DataSet = qry_declaracoes
    OnDataChange = ds_declaracoesDataChange
    Left = 276
    Top = 12
  end
end

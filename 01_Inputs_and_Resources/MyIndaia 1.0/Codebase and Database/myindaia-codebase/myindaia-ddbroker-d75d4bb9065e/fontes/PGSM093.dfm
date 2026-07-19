object frm_conta: Tfrm_conta
  Left = 88
  Top = 82
  Width = 750
  Height = 550
  Caption = 'Conta Caixa'
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
  object pgctrl_conta: TPageControl
    Left = 0
    Top = 47
    Width = 742
    Height = 457
    ActivePage = ts_dados_basicos
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChange = pgctrl_contaChange
    OnChanging = pgctrl_contaChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_conta: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        DataSource = datm_conta.ds_conta
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_contaDblClick
        OnKeyPress = dbg_contaKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_CONTA'
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
            FieldName = 'NM_CONTA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 229
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'look_coligada'
            Title.Caption = 'Coligada'
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
            FieldName = 'look_ativo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 37
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
        object Label3: TLabel
          Left = 10
          Top = 62
          Width = 78
          Height = 13
          AutoSize = False
          Caption = 'Conta Caixa'
          FocusControl = dbedt_cd_conta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 96
          Top = 62
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Descri'#231#227'o'
          FocusControl = dbedt_nm_conta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ativo: TLabel
          Left = 10
          Top = 187
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
        object Label5: TLabel
          Left = 10
          Top = 105
          Width = 46
          Height = 13
          AutoSize = False
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ct_contabil: TLabel
          Left = 106
          Top = 147
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
        object Label8: TLabel
          Left = 117
          Top = 105
          Width = 113
          Height = 13
          AutoSize = False
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_banco: TSpeedButton
          Left = 431
          Top = 118
          Width = 25
          Height = 23
          Enabled = False
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
          OnClick = btn_co_bancoClick
        end
        object Label10: TLabel
          Left = 10
          Top = 21
          Width = 113
          Height = 13
          AutoSize = False
          Caption = 'Coligada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_coligada: TSpeedButton
          Left = 228
          Top = 33
          Width = 25
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
          OnClick = btn_co_coligadaClick
        end
        object lbl_in_baixa_acerto: TLabel
          Left = 89
          Top = 187
          Width = 87
          Height = 13
          Caption = 'Controlar Baixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_acesso: TLabel
          Left = 10
          Top = 147
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
        object lbl_aux: TLabel
          Left = 58
          Top = 147
          Width = 22
          Height = 13
          Caption = 'Aux'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ct_contabil: TSpeedButton
          Left = 579
          Top = 160
          Width = 25
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
          OnClick = btn_co_ct_contabilClick
        end
        object lbl_exibe: TLabel
          Left = 185
          Top = 187
          Width = 32
          Height = 13
          Caption = 'Exibir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 266
          Top = 21
          Width = 113
          Height = 13
          AutoSize = False
          Caption = 'Unid. Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_unid_neg: TSpeedButton
          Left = 479
          Top = 33
          Width = 25
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
          OnClick = btn_co_unid_negClick
        end
        object dbedt_cd_conta: TDBEdit
          Left = 10
          Top = 76
          Width = 38
          Height = 21
          DataField = 'CD_CONTA'
          DataSource = datm_conta.ds_conta
          TabOrder = 2
          OnChange = dbedt_nm_contaChange
          OnExit = dbedt_cd_contaExit
        end
        object dbedt_nm_conta: TDBEdit
          Left = 96
          Top = 76
          Width = 366
          Height = 21
          DataField = 'NM_CONTA'
          DataSource = datm_conta.ds_conta
          TabOrder = 3
          OnChange = dbedt_nm_contaChange
          OnExit = dbedt_nm_contaExit
        end
        object dblkpcbox_ativo_conta: TDBLookupComboBox
          Left = 10
          Top = 201
          Width = 52
          Height = 21
          DataField = 'look_ativo'
          DataSource = datm_conta.ds_conta
          DropDownRows = 3
          TabOrder = 9
          OnClick = dbedt_nm_contaChange
          OnExit = dblkpcbox_ativo_contaExit
        end
        object dblkpcbox_tipo_conta: TDBLookupComboBox
          Left = 10
          Top = 118
          Width = 101
          Height = 21
          DataField = 'TP_CONTA'
          DataSource = datm_conta.ds_conta
          DropDownRows = 3
          KeyField = 'CD_TP_CONTA'
          ListField = 'NM_TP_CONTA'
          ListSource = datm_conta.ds_tp_conta
          TabOrder = 4
          OnClick = dblkpcbox_tipo_contaClick
          OnExit = dblkpcbox_tipo_contaExit
        end
        object dbedt_cd_banco: TDBEdit
          Left = 117
          Top = 118
          Width = 42
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_conta.ds_conta
          Enabled = False
          TabOrder = 5
          OnChange = dbedt_nm_contaChange
          OnExit = dbedt_cd_bancoExit
          OnKeyDown = dbedt_cd_coligadaKeyDown
        end
        object dbedt_nm_banco: TDBEdit
          Left = 166
          Top = 118
          Width = 266
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_banco'
          DataSource = datm_conta.ds_conta
          ReadOnly = True
          TabOrder = 12
          OnChange = dbedt_nm_contaChange
        end
        object dbedt_cd_coligada: TDBEdit
          Left = 10
          Top = 34
          Width = 37
          Height = 21
          DataField = 'CD_COLIGADA'
          DataSource = datm_conta.ds_conta
          TabOrder = 0
          OnClick = dbedt_nm_contaChange
          OnExit = dbedt_cd_coligadaExit
          OnKeyDown = dbedt_cd_coligadaKeyDown
        end
        object dbedt_nm_coligada: TDBEdit
          Left = 53
          Top = 34
          Width = 170
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_coligada'
          DataSource = datm_conta.ds_conta
          ReadOnly = True
          TabOrder = 13
          OnChange = dbedt_nm_contaChange
        end
        object dblkpcbox_in_baixa_acerto: TDBLookupComboBox
          Left = 89
          Top = 201
          Width = 52
          Height = 21
          DataField = 'look_baixa_acerto'
          DataSource = datm_conta.ds_conta
          DropDownRows = 3
          TabOrder = 10
          OnClick = dbedt_nm_contaChange
          OnExit = dblkpcbox_ativo_contaExit
        end
        object dbedt_cd_acesso: TDBEdit
          Left = 10
          Top = 160
          Width = 32
          Height = 21
          DataField = 'CD_ACESSO'
          DataSource = datm_conta.ds_conta
          TabOrder = 6
          OnEnter = dbedt_cd_acessoEnter
          OnExit = dbedt_cd_acessoExit
        end
        object dbedt_cd_aux: TDBEdit
          Left = 58
          Top = 160
          Width = 34
          Height = 21
          DataField = 'CD_AUX'
          DataSource = datm_conta.ds_conta
          TabOrder = 7
          OnEnter = dbedt_cd_auxEnter
          OnExit = dbedt_cd_auxExit
        end
        object dbedt_cd_ct_contabil: TDBEdit
          Left = 106
          Top = 160
          Width = 75
          Height = 21
          DataField = 'CD_CT_CONTABIL'
          DataSource = datm_conta.ds_conta
          TabOrder = 8
          OnChange = dbedt_nm_contaChange
          OnExit = dbedt_cd_ct_contabilExit
          OnKeyDown = dbedt_cd_coligadaKeyDown
        end
        object dbedt_nm_ct_contabil: TDBEdit
          Left = 189
          Top = 160
          Width = 388
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCtContabil'
          DataSource = datm_conta.ds_conta
          ReadOnly = True
          TabOrder = 14
          OnChange = dbedt_nm_contaChange
        end
        object dblckpbox_exibe: TDBLookupComboBox
          Left = 185
          Top = 201
          Width = 52
          Height = 21
          DataField = 'LookExibe'
          DataSource = datm_conta.ds_conta
          DropDownRows = 3
          TabOrder = 11
          OnClick = dbedt_nm_contaChange
          OnExit = dblkpcbox_ativo_contaExit
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 266
          Top = 34
          Width = 37
          Height = 21
          DataField = 'CD_UNID_NEG'
          DataSource = datm_conta.ds_conta
          TabOrder = 1
          OnClick = dbedt_nm_contaChange
          OnExit = dbedt_cd_unid_negExit
          OnKeyDown = dbedt_cd_coligadaKeyDown
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 309
          Top = 34
          Width = 170
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidNeg'
          DataSource = datm_conta.ds_conta
          ReadOnly = True
          TabOrder = 15
          OnChange = dbedt_nm_contaChange
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
      Left = 3
      Top = 3
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
      Top = 3
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
      Left = 393
      Top = 3
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
      Left = 41
      Top = 3
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
      Left = 79
      Top = 3
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
      DataSource = datm_conta.ds_conta
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
    Left = 378
    Top = 353
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

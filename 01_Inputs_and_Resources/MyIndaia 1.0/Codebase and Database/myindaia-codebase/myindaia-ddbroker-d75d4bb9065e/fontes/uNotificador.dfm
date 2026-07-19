object frm_notificador: Tfrm_notificador
  Left = 149
  Top = 130
  Width = 720
  Height = 510
  Caption = 'Notificador'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      712
      49)
    object btn_incluir: TSpeedButton
      Left = 3
      Top = 3
      Width = 37
      Height = 43
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
      Left = 114
      Top = 3
      Width = 37
      Height = 43
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
      Left = 370
      Top = 3
      Width = 37
      Height = 43
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
      Left = 40
      Top = 3
      Width = 37
      Height = 43
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
      Left = 77
      Top = 3
      Width = 37
      Height = 43
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
    object Label1: TLabel
      Left = 415
      Top = 7
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
      Left = 551
      Top = 7
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
      Left = 255
      Top = 13
      Width = 104
      Height = 24
      DataSource = datm_notificador.ds_notificador
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      TabOrder = 0
    end
    object edt_chave: TEdit
      Left = 416
      Top = 20
      Width = 129
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 552
      Top = 20
      Width = 153
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
      OnChange = cb_ordemChange
    end
  end
  object pgctrl_notificador: TPageControl
    Left = 0
    Top = 49
    Width = 712
    Height = 415
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_notificadorChange
    OnChanging = pgctrl_notificadorChanging
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 704
        Height = 387
        Align = alClient
        DataSource = datm_notificador.ds_notificador
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
            FieldName = 'CD_NOTIFICADOR'
            Title.Caption = 'C'#243'd'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_NOTIFICADOR'
            Title.Caption = 'Nome Notificador'
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
            Expanded = False
            FieldName = 'NM_CIDADE'
            Title.Caption = 'Cidade'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_PAIS'
            Title.Caption = 'Pa'#237's'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 128
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      ImageIndex = 1
      object Label3: TLabel
        Left = 15
        Top = 14
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
      object Label4: TLabel
        Left = 69
        Top = 14
        Width = 33
        Height = 13
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 15
        Top = 52
        Width = 55
        Height = 13
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 350
        Top = 52
        Width = 44
        Height = 13
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 606
        Top = 14
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
      object Label8: TLabel
        Left = 430
        Top = 52
        Width = 76
        Height = 13
        Caption = 'Complemento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 15
        Top = 91
        Width = 51
        Height = 13
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 350
        Top = 170
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
      object Label11: TLabel
        Left = 15
        Top = 170
        Width = 40
        Height = 13
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 193
        Top = 91
        Width = 21
        Height = 13
        Caption = 'Fax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 350
        Top = 91
        Width = 45
        Height = 13
        Caption = 'Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 15
        Top = 131
        Width = 35
        Height = 13
        Caption = 'E-mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_inst: TSpeedButton
        Left = 306
        Top = 183
        Width = 25
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
        OnClick = btn_co_instClick
      end
      object btn_co_pais: TSpeedButton
        Left = 662
        Top = 182
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
        OnClick = btn_co_paisClick
      end
      object Label17: TLabel
        Left = 486
        Top = 131
        Width = 32
        Height = 13
        Caption = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 15
        Top = 27
        Width = 41
        Height = 21
        Color = clMenu
        DataField = 'CD_NOTIFICADOR'
        DataSource = datm_notificador.ds_notificador
        ReadOnly = True
        TabOrder = 0
      end
      object dbedt_nm_notificador: TDBEdit
        Left = 66
        Top = 27
        Width = 530
        Height = 21
        DataField = 'NM_NOTIFICADOR'
        DataSource = datm_notificador.ds_notificador
        TabOrder = 1
        OnChange = dbedt_nm_notificadorChange
      end
      object DBEdit3: TDBEdit
        Left = 15
        Top = 65
        Width = 327
        Height = 21
        DataField = 'END_NOTIFICADOR'
        DataSource = datm_notificador.ds_notificador
        TabOrder = 2
        OnChange = dbedt_nm_notificadorChange
      end
      object dbedt_nm_cidade: TDBEdit
        Left = 57
        Top = 183
        Width = 248
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_CIDADE'
        DataSource = datm_notificador.ds_notificador
        ReadOnly = True
        TabOrder = 11
      end
      object DBEdit7: TDBEdit
        Left = 431
        Top = 65
        Width = 255
        Height = 21
        DataField = 'END_COMPL'
        DataSource = datm_notificador.ds_notificador
        TabOrder = 4
        OnChange = dbedt_nm_notificadorChange
      end
      object DBEdit8: TDBEdit
        Left = 350
        Top = 65
        Width = 71
        Height = 21
        DataField = 'END_NUMERO'
        DataSource = datm_notificador.ds_notificador
        TabOrder = 3
        OnChange = dbedt_nm_notificadorChange
      end
      object RxDBComboBox1: TRxDBComboBox
        Left = 606
        Top = 27
        Width = 81
        Height = 21
        Style = csDropDownList
        DataField = 'IN_ATIVO'
        DataSource = datm_notificador.ds_notificador
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'N'#227'o'
          'Sim')
        TabOrder = 14
        Values.Strings = (
          '0'
          '1')
        OnChange = dbedt_nm_notificadorChange
      end
      object dbedt_nm_pais: TDBEdit
        Left = 382
        Top = 182
        Width = 279
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_PAIS'
        DataSource = datm_notificador.ds_notificador
        ReadOnly = True
        TabOrder = 13
      end
      object DBEdit10: TDBEdit
        Left = 15
        Top = 104
        Width = 160
        Height = 21
        DataField = 'END_FONE'
        DataSource = datm_notificador.ds_notificador
        TabOrder = 5
        OnChange = dbedt_nm_notificadorChange
      end
      object DBEdit11: TDBEdit
        Left = 191
        Top = 104
        Width = 150
        Height = 21
        DataField = 'END_FAX'
        DataSource = datm_notificador.ds_notificador
        TabOrder = 6
        OnChange = dbedt_nm_notificadorChange
      end
      object DBEdit12: TDBEdit
        Left = 350
        Top = 104
        Width = 334
        Height = 21
        DataField = 'NM_CONTATO'
        DataSource = datm_notificador.ds_notificador
        TabOrder = 7
        OnChange = dbedt_nm_notificadorChange
      end
      object DBEdit13: TDBEdit
        Left = 15
        Top = 144
        Width = 463
        Height = 21
        DataField = 'END_EMAIL'
        DataSource = datm_notificador.ds_notificador
        TabOrder = 8
        OnChange = dbedt_nm_notificadorChange
      end
      object dbedt_cgc_notificador: TDBEdit
        Left = 486
        Top = 144
        Width = 200
        Height = 21
        DataField = 'CGC_NOTIFICADOR'
        DataSource = datm_notificador.ds_notificador
        TabOrder = 9
        OnChange = dbedt_nm_notificadorChange
        OnExit = dbedt_cgc_notificadorExit
      end
      object dbedt_cd_pais: TDBEdit
        Left = 350
        Top = 182
        Width = 33
        Height = 21
        DataField = 'CD_PAIS'
        DataSource = datm_notificador.ds_notificador
        TabOrder = 12
        OnChange = dbedt_nm_notificadorChange
        OnExit = dbedt_cd_paisExit
        OnKeyDown = dbedt_cd_paisKeyDown
      end
      object dbedt_cd_cidade: TDBEdit
        Left = 15
        Top = 183
        Width = 43
        Height = 21
        DataField = 'CD_CIDADE'
        DataSource = datm_notificador.ds_notificador
        TabOrder = 10
        OnChange = dbedt_nm_notificadorChange
        OnExit = dbedt_cd_cidadeExit
        OnKeyDown = dbedt_cd_paisKeyDown
      end
    end
    object ts_armadores: TTabSheet
      Caption = 'Armadores'
      ImageIndex = 2
      DesignSize = (
        704
        387)
      object btn_co_armador: TSpeedButton
        Left = 629
        Top = 19
        Width = 25
        Height = 20
        Enabled = False
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
        OnClick = btn_co_armadorClick
      end
      object Label15: TLabel
        Left = 5
        Top = 5
        Width = 100
        Height = 13
        Caption = 'Ag'#234'ncia Mar'#237'tima'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 312
        Top = 5
        Width = 47
        Height = 13
        Caption = 'Armador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 46
        Width = 699
        Height = 340
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = datm_notificador.ds_armador
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
            FieldName = 'CD_ARMADOR'
            Title.Caption = 'Cod. Armador'
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
            Expanded = False
            FieldName = 'NM_ARMADOR'
            Title.Caption = 'Nome Armador'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 491
            Visible = True
          end>
      end
      object DBEdit4: TDBEdit
        Left = 48
        Top = 19
        Width = 251
        Height = 21
        Color = clMenu
        DataField = 'NM_NOTIFICADOR'
        DataSource = datm_notificador.ds_notificador
        ReadOnly = True
        TabOrder = 2
      end
      object dbedt_nm_armador: TDBEdit
        Left = 351
        Top = 19
        Width = 277
        Height = 21
        Color = clMenu
        DataField = 'NM_ARMADOR'
        DataSource = datm_notificador.ds_armador
        ReadOnly = True
        TabOrder = 4
      end
      object dbedt_cd_armador: TDBEdit
        Left = 312
        Top = 19
        Width = 40
        Height = 21
        DataField = 'CD_ARMADOR'
        DataSource = datm_notificador.ds_armador
        Enabled = False
        TabOrder = 3
        OnChange = dbedt_cd_armadorChange
        OnExit = dbedt_cd_armadorExit
        OnKeyDown = dbedt_cd_paisKeyDown
      end
      object DBEdit2: TDBEdit
        Left = 5
        Top = 19
        Width = 44
        Height = 21
        Color = clMenu
        DataField = 'CD_NOTIFICADOR'
        DataSource = datm_notificador.ds_notificador
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 588
    Top = 416
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
    object TMenuItem
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end

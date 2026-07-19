object frm_CadUfIcmsOnLine: Tfrm_CadUfIcmsOnLine
  Left = 410
  Top = 198
  Width = 436
  Height = 321
  Caption = 'Cadastro UF ICMS OnLine'
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 394
    Top = 231
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
  end
  object pgctrl_Cadastro: TPageControl
    Left = 0
    Top = 105
    Width = 420
    Height = 158
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_CadastroChange
    OnChanging = pgctrl_CadastroChanging
    object ts_lista: TTabSheet
      Caption = '    Lista    '
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 412
        Height = 130
        Align = alClient
        Color = clWhite
        DataSource = dts_CadFfIcmsOnline
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
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
            FieldName = 'UF_CLIENTE'
            Title.Caption = 'UF Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UF_DESPACHO'
            Title.Caption = 'UF Despacho'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SITE_DESC'
            Title.Caption = 'Site'
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '   Dados B'#225'sicos   '
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 412
        Height = 130
        Align = alClient
        AutoSize = True
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_transp_rod: TLabel
          Left = 14
          Top = 45
          Width = 23
          Height = 13
          Caption = 'Site'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 14
          Top = 5
          Width = 60
          Height = 13
          Caption = 'UF Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 169
          Top = 5
          Width = 78
          Height = 13
          Caption = 'UF Despacho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cmbUfCliente: TDBLookupComboBox
          Left = 14
          Top = 20
          Width = 145
          Height = 21
          DataField = 'UF_CLIENTE'
          DataSource = dts_CadFfIcmsOnline
          KeyField = 'SIGLA'
          ListField = 'SIGLA'
          ListSource = dts_estado_cliente
          TabOrder = 0
        end
        object cmbSite: TDBComboBox
          Left = 14
          Top = 60
          Width = 301
          Height = 21
          DataField = 'SITE_DESC'
          DataSource = dts_CadFfIcmsOnline
          ItemHeight = 13
          Items.Strings = (
            'http://www.gnre.pe.gov.br/gnre/portal/GNRE_Principal.jsp')
          TabOrder = 1
        end
        object cmbUfDespacho: TDBLookupComboBox
          Left = 169
          Top = 20
          Width = 145
          Height = 21
          DataField = 'UF_DESPACHO'
          DataSource = dts_CadFfIcmsOnline
          KeyField = 'SIGLA'
          ListField = 'SIGLA'
          ListSource = dts_estado_despacho
          TabOrder = 2
        end
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 105
    Align = alTop
    BorderWidth = 2
    TabOrder = 1
    object pnl_cadastro: TPanel
      Left = 3
      Top = 3
      Width = 414
      Height = 44
      Align = alTop
      BevelOuter = bvLowered
      BorderWidth = 2
      TabOrder = 0
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
        OnClick = btn_incluirClick
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
        OnClick = btn_excluirClick
      end
      object btn_sair: TSpeedButton
        Left = 276
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
        ParentShowHint = False
        ShowHint = True
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
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_cancelarClick
      end
      object dbnvg: TDBNavigator
        Left = 144
        Top = 12
        Width = 104
        Height = 25
        DataSource = datm_acesso_externo.ds_acesso_externo
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        Hints.Strings = (
          'Primeiro'
          'Anterior'
          'Pr'#243'ximo'
          #218'ltimo')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
    object pnl_pesquisa: TPanel
      Left = 3
      Top = 51
      Width = 414
      Height = 51
      Align = alBottom
      BevelOuter = bvLowered
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
        TabStop = False
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
        TabStop = False
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 556
    Top = 368
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
  object dts_CadFfIcmsOnline: TDataSource
    DataSet = qry_CadUfIcmsOnline
    Left = 323
    Top = 12
  end
  object qry_CadUfIcmsOnline: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM CAD_UF_ICMS_ONLINE')
    Left = 358
    Top = 12
    object qry_CadUfIcmsOnlineUF_CLIENTE: TStringField
      FieldName = 'UF_CLIENTE'
      Size = 2
    end
    object qry_CadUfIcmsOnlineUF_DESPACHO: TStringField
      FieldName = 'UF_DESPACHO'
      Size = 2
    end
    object qry_CadUfIcmsOnlineSITE_DESC: TStringField
      FieldName = 'SITE_DESC'
      Size = 200
    end
  end
  object dts_estado_cliente: TDataSource
    DataSet = qry_estado_cliente
    Left = 323
    Top = 46
  end
  object qry_estado_cliente: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT SIGLA FROM ESTADO ORDER BY SIGLA')
    Left = 358
    Top = 46
  end
  object dts_estado_despacho: TDataSource
    DataSet = qry_estado_despacho
    Left = 323
    Top = 81
  end
  object qry_estado_despacho: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT SIGLA FROM ESTADO ORDER BY SIGLA')
    Left = 358
    Top = 81
  end
end

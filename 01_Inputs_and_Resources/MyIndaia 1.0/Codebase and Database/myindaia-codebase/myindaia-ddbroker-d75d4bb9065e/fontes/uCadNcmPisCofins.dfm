object frm_ncm_pis_cofins: Tfrm_ncm_pis_cofins
  Left = 146
  Top = 101
  Width = 750
  Height = 550
  Caption = 'NCM PIS COFINS'
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 47
    Width = 742
    Height = 457
    ActivePage = TabSheet1
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChanging = PageControl1Changing
    object TabSheet1: TTabSheet
      Caption = '&Lista'
      object dbg_conta: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        DataSource = ds_lista
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
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
            FieldName = 'NCM'
            Title.Caption = 'Ncm'
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
            FieldName = 'CAPITULO'
            Title.Caption = 'Cap'#237'tulo'
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
            FieldName = 'ALIQ_PIS'
            Title.Caption = 'Al'#237'quota PIS'
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
            FieldName = 'ALIQ_COFINS'
            Title.Caption = 'Al'#237'quota COFINS'
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
    object TabSheet2: TTabSheet
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
          Left = 16
          Top = 16
          Width = 26
          Height = 13
          Caption = 'Ncm'
          FocusControl = DBEdit1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 120
          Top = 16
          Width = 49
          Height = 13
          Caption = 'Cap'#237'tulo'
          FocusControl = DBEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 16
          Top = 80
          Width = 82
          Height = 13
          Caption = 'Valor Al'#237'q. Pis'
          FocusControl = DBEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 128
          Top = 80
          Width = 100
          Height = 13
          Caption = 'Valor Al'#237'q. Cofins'
          FocusControl = DBEdit4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label87: TLabel
          Left = 19
          Top = 166
          Width = 166
          Height = 13
          Caption = 'Informa'#231#245'es Complementares'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_obs: TSpeedButton
          Left = 203
          Top = 162
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
          OnClick = btn_co_obsClick
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 32
          Width = 89
          Height = 21
          DataField = 'NCM'
          DataSource = ds_ncm_pis_cofins
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 120
          Top = 32
          Width = 97
          Height = 21
          DataField = 'CAPITULO'
          DataSource = ds_ncm_pis_cofins
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 16
          Top = 96
          Width = 97
          Height = 21
          DataField = 'ALIQ_PIS'
          DataSource = ds_ncm_pis_cofins
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 128
          Top = 96
          Width = 113
          Height = 21
          DataField = 'ALIQ_COFINS'
          DataSource = ds_ncm_pis_cofins
          TabOrder = 3
        end
        object dbmemo_complemento: TDBMemo
          Left = 1
          Top = 216
          Width = 732
          Height = 212
          Align = alBottom
          DataField = 'TX_ARTIGO'
          DataSource = ds_ncm_pis_cofins
          TabOrder = 4
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
    object cmdIncluir: TSpeedButton
      Left = 4
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
      OnClick = cmdIncluirClick
    end
    object cmdExcluir: TSpeedButton
      Left = 118
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
      OnClick = cmdExcluirClick
    end
    object cmdSair: TSpeedButton
      Left = 392
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
      OnClick = cmdSairClick
    end
    object cmdSalvar: TSpeedButton
      Left = 42
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
      OnClick = cmdSalvarClick
    end
    object cmdCancelar: TSpeedButton
      Left = 80
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
      OnClick = cmdCancelarClick
    end
    object dbnvg: TDBNavigator
      Left = 228
      Top = 12
      Width = 104
      Height = 25
      DataSource = ds_lista
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
        Items.Strings = (
          'Ncm'
          'Cap'#237'tulo')
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 554
    Top = 97
    object cmdIncluirM: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      Hint = ' '
      OnClick = cmdIncluirClick
    end
    object cmdSalvarM: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = cmdSalvarClick
    end
    object cmdCancelarM: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      OnClick = cmdCancelarClick
    end
    object cmdExcluirM: TMenuItem
      Caption = '&Excluir'
      Enabled = False
      Hint = ' '
      OnClick = cmdExcluirClick
    end
    object cmdSairM: TMenuItem
      Caption = 'Sai&r'
      OnClick = cmdSairClick
    end
  end
  object qry_ncm_pis_cofins_: TQuery
    BeforePost = qry_ncm_pis_cofins_BeforePost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TNCM_PIS_COFINS')
    Left = 444
    Top = 113
    object qry_ncm_pis_cofins_ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
      Origin = 'TNCM_PIS_COFINS.ALIQ_PIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ncm_pis_cofins_ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
      Origin = 'TNCM_PIS_COFINS.ALIQ_COFINS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ncm_pis_cofins_NCM: TStringField
      FieldName = 'NCM'
      Origin = 'BROKER.TNCM_PIS_COFINS.NCM'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object qry_ncm_pis_cofins_CAPITULO: TStringField
      FieldName = 'CAPITULO'
      Origin = 'BROKER.TNCM_PIS_COFINS.CAPITULO'
      Size = 4
    end
    object qry_ncm_pis_cofins_TX_ARTIGO: TMemoField
      FieldName = 'TX_ARTIGO'
      Origin = 'TNCM_PIS_COFINS.NCM'
      BlobType = ftMemo
    end
  end
  object ds_ncm_pis_cofins: TDataSource
    DataSet = qry_ncm_pis_cofins_
    OnStateChange = ds_ncm_pis_cofinsStateChange
    Left = 480
    Top = 112
  end
  object qrylista: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TNCM_PIS_COFINS')
    Left = 452
    Top = 145
    object FloatField1: TFloatField
      FieldName = 'ALIQ_PIS'
      Origin = 'TNCM_PIS_COFINS.ALIQ_PIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'ALIQ_COFINS'
      Origin = 'TNCM_PIS_COFINS.ALIQ_COFINS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qrylistaNCM: TStringField
      FieldName = 'NCM'
      Origin = 'BROKER.TNCM_PIS_COFINS.NCM'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object qrylistaCAPITULO: TStringField
      FieldName = 'CAPITULO'
      Origin = 'BROKER.TNCM_PIS_COFINS.CAPITULO'
      Size = 4
    end
  end
  object ds_lista: TDataSource
    DataSet = qrylista
    Left = 484
    Top = 145
  end
end

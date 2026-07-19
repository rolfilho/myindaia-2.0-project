object frmCdDeclaracaoOrigem: TfrmCdDeclaracaoOrigem
  Left = 748
  Top = 236
  Width = 750
  Height = 550
  Caption = 'Declara'#231#227'o de Origem'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      734
      49)
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
      ParentShowHint = False
      ShowHint = True
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancelarClick
    end
    object dbnvg: TDBNavigator
      Left = 281
      Top = 11
      Width = 96
      Height = 26
      DataSource = dsMain
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
    object pnl_pesquisa: TPanel
      Left = 423
      Top = 2
      Width = 309
      Height = 45
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
        Top = 17
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
        OnKeyDown = edt_chaveKeyDown
      end
      object cb_ordem: TComboBox
        Left = 148
        Top = 17
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
  end
  object pgctrl_cntr: TPageControl
    Left = 0
    Top = 49
    Width = 734
    Height = 443
    ActivePage = ts_dados_basicos
    Align = alClient
    HotTrack = True
    TabOrder = 1
    OnChange = pgctrl_cntrChange
    OnChanging = pgctrl_cntrChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 726
        Height = 415
        Align = alClient
        DataSource = dsMain
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
            FieldName = 'ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NUMERO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Federacao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FEDERACAO_ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'VENCIMENTO'
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 415
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
        object lbl_nm_pais: TLabel
          Left = 14
          Top = 8
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
        object Label3: TLabel
          Left = 110
          Top = 8
          Width = 61
          Height = 13
          Caption = 'Federa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 224
          Top = 6
          Width = 88
          Height = 13
          Caption = 'Dt. Vencimento'
          FocusControl = dbeDataVencNorma
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl19: TLabel
          Left = 327
          Top = 4
          Width = 40
          Height = 13
          Caption = 'Cliente'
          FocusControl = dbedt_cd_cliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label207: TLabel
          Left = 327
          Top = 43
          Width = 36
          Height = 13
          Caption = 'CNPJ:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_cliente: TSpeedButton
          Left = 641
          Top = 19
          Width = 22
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
          OnClick = btn_co_clienteClick
        end
        object dbedt_Acordo: TDBEdit
          Left = 14
          Top = 22
          Width = 87
          Height = 21
          DataField = 'NUMERO'
          DataSource = dsMain
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_AcordoChange
        end
        object DBLookupComboBox: TDBLookupComboBox
          Left = 110
          Top = 22
          Width = 103
          Height = 21
          DataField = 'FEDERACAO_ID'
          DataSource = dsMain
          KeyField = 'ID'
          ListField = 'NOME'
          ListSource = dsFederacao
          TabOrder = 1
          OnCloseUp = dbedt_AcordoChange
        end
        object dbeDataVencNorma: TDBEdit
          Left = 222
          Top = 21
          Width = 83
          Height = 21
          DataField = 'VENCIMENTO'
          DataSource = dsMain
          TabOrder = 2
        end
        object dbedt_cd_cliente: TDBEdit
          Left = 327
          Top = 19
          Width = 48
          Height = 21
          AutoSize = False
          DataField = 'CD_CLIENTE'
          DataSource = dsMain
          TabOrder = 3
          OnChange = dbedt_cd_clienteChange
          OnKeyDown = edt_chaveKeyDown
        end
        object edt_nm_cliente: TEdit
          Left = 377
          Top = 19
          Width = 260
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
        object msk_CNPJ_Cliente: TMaskEdit
          Left = 369
          Top = 43
          Width = 237
          Height = 19
          BorderStyle = bsNone
          EditMask = '99.999.999/9999-99;0'
          MaxLength = 18
          ParentColor = True
          TabOrder = 5
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 120
          Width = 697
          Height = 289
          Caption = ' Classifica'#231#245'es da Declara'#231#227'o '
          TabOrder = 6
          object DBGrid1: TDBGrid
            Left = 16
            Top = 64
            Width = 665
            Height = 207
            DataSource = dsClassificacao
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'SIGLA'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODIGO'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DENOMINACAO'
                Width = 400
                Visible = True
              end>
          end
          object btnIncluirClassificacao: TBitBtn
            Left = 15
            Top = 24
            Width = 122
            Height = 33
            Caption = 'Incluir / Atualizar'
            TabOrder = 1
            WordWrap = True
            OnClick = btnIncluirClassificacaoClick
            Style = bsNew
          end
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 525
    Top = 356
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
      Caption = '&Sair'
    end
  end
  object dsMain: TDataSource
    DataSet = qryMain
    Left = 228
    Top = 256
  end
  object dsFederacao: TDataSource
    DataSet = QryFederacao
    Left = 228
    Top = 344
  end
  object updMain: TUpdateSQL
    ModifySQL.Strings = (
      'update DECLARACAO_ORIGEM'
      'set'
      '  NUMERO = :NUMERO,'
      '  FEDERACAO_ID = :FEDERACAO_ID,'
      '  VENCIMENTO = :VENCIMENTO,'
      '  CD_CLIENTE = :CD_CLIENTE'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into DECLARACAO_ORIGEM'
      '  (NUMERO, FEDERACAO_ID, VENCIMENTO, CD_CLIENTE)'
      'values'
      '  (:NUMERO, :FEDERACAO_ID, :VENCIMENTO, :CD_CLIENTE)')
    DeleteSQL.Strings = (
      'delete from DECLARACAO_ORIGEM'
      'where'
      '  ID = :OLD_ID')
    Left = 172
    Top = 256
  end
  object qryMain: TQuery
    CachedUpdates = True
    OnUpdateRecord = qryMainUpdateRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT ID, NUMERO, FEDERACAO_ID, VENCIMENTO, CD_CLIENTE FROM DEC' +
        'LARACAO_ORIGEM'
      'ORDER BY'
      'NUMERO')
    UpdateObject = updMain
    Left = 200
    Top = 256
    object qryMainID: TAutoIncField
      Tag = 1
      FieldName = 'ID'
      Origin = 'DBBROKER.DECLARACAO_ORIGEM.ID'
      Visible = False
    end
    object qryMainNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = 'DBBROKER.DECLARACAO_ORIGEM.NUMERO'
    end
    object qryMainFederacao: TStringField
      DisplayLabel = 'Federa'#231#227'o'
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'Federacao'
      LookupDataSet = QryFederacao
      LookupKeyFields = 'ID'
      LookupResultField = 'NOME'
      KeyFields = 'FEDERACAO_ID'
      Size = 50
      Lookup = True
    end
    object qryMainFEDERACAO_ID: TIntegerField
      FieldName = 'FEDERACAO_ID'
      Origin = 'DBBROKER.DECLARACAO_ORIGEM.FEDERACAO_ID'
      Visible = False
    end
    object qryMainVENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCIMENTO'
      Origin = 'DBBROKER.DECLARACAO_ORIGEM.VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qryMainCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
  end
  object QryFederacao: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM FEDERACAO')
    Left = 200
    Top = 344
    object QryFederacaoID: TAutoIncField
      FieldName = 'ID'
      Origin = 'DBBROKER.FEDERACAO.ID'
    end
    object QryFederacaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'DBBROKER.FEDERACAO.NOME'
      FixedChar = True
      Size = 50
    end
  end
  object qryClassificacao: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT * FROM DECLARACAO_ORIGEM_CLASSIFICACAO WHERE ID_DO = :ID_' +
        'DECLARACAO')
    Left = 208
    Top = 384
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_DECLARACAO'
        ParamType = ptInput
      end>
    object qryClassificacaoID: TAutoIncField
      FieldName = 'ID'
      Origin = 'DBBROKER.DECLARACAO_ORIGEM_CLASSIFICACAO.ID'
    end
    object qryClassificacaoID_DO: TIntegerField
      FieldName = 'ID_DO'
      Origin = 'DBBROKER.DECLARACAO_ORIGEM_CLASSIFICACAO.ID_DO'
    end
    object qryClassificacaoSIGLA: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'SIGLA'
      Origin = 'DBBROKER.DECLARACAO_ORIGEM_CLASSIFICACAO.SIGLA'
      FixedChar = True
      Size = 10
    end
    object qryClassificacaoCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.DECLARACAO_ORIGEM_CLASSIFICACAO.CODIGO'
      FixedChar = True
      Size = 8
    end
    object qryClassificacaoDENOMINACAO: TMemoField
      DisplayLabel = 'Denomina'#231#227'o'
      FieldName = 'DENOMINACAO'
      Origin = 'DBBROKER.DECLARACAO_ORIGEM_CLASSIFICACAO.DENOMINACAO'
      BlobType = ftMemo
    end
  end
  object dsClassificacao: TDataSource
    DataSet = qryClassificacao
    Left = 236
    Top = 384
  end
end

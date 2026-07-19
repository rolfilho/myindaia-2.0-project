object frmCadConfigStatus: TfrmCadConfigStatus
  Left = 146
  Top = 120
  Width = 750
  Height = 550
  Caption = 'Cadastro de Configura'#231#245'es de Status'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmCadastro
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSeparador: TBevel
    Left = 0
    Top = 43
    Width = 742
    Height = 5
    Align = alTop
    Shape = bsSpacer
  end
  object pgctrlEtapa: TPageControl
    Left = 0
    Top = 48
    Width = 742
    Height = 456
    ActivePage = tsLista
    Align = alClient
    TabOrder = 0
    OnChange = pgctrlEtapaChange
    object tsLista: TTabSheet
      Caption = 'Lista'
      object dbgrdLista: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 428
        Align = alClient
        Ctl3D = False
        DataSource = dsCadConfigStatus
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_CAD_CONFIG_STATUS'
            Title.Caption = 'C'#243'd. Configura'#231#227'o'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TX_CAD_CONFIG_STATUS'
            Title.Caption = 'Descri'#231#227'o da Configura'#231#227'o'
            Width = 580
            Visible = True
          end>
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Dados B'#225'sicos'
      ImageIndex = 1
      object bvlDadosBasicos: TBevel
        Left = 0
        Top = 0
        Width = 734
        Height = 428
        Align = alClient
        Shape = bsFrame
      end
      object pnlMaster: TPanel
        Left = 7
        Top = 8
        Width = 720
        Height = 89
        BevelInner = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 9
          Width = 88
          Height = 13
          Caption = 'C'#243'd. Configura'#231#227'o'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 8
          Top = 46
          Width = 129
          Height = 13
          Caption = 'Descri'#231#227'o da Configura'#231#227'o'
          FocusControl = DBEdit2
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 22
          Width = 134
          Height = 21
          DataField = 'NR_CAD_CONFIG_STATUS'
          DataSource = dsCadConfigStatus
          Enabled = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 8
          Top = 59
          Width = 704
          Height = 21
          DataField = 'TX_CAD_CONFIG_STATUS'
          DataSource = dsCadConfigStatus
          TabOrder = 1
        end
      end
      object Panel1: TPanel
        Left = 7
        Top = 100
        Width = 720
        Height = 320
        BevelInner = bvLowered
        TabOrder = 1
        object Panel2: TPanel
          Left = 4
          Top = 4
          Width = 712
          Height = 29
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object Label4: TLabel
            Left = 4
            Top = 5
            Width = 356
            Height = 20
            Caption = 'Inclus'#227'o dos status para essa configura'#231#227'o.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object btnIncluirDetail: TSpeedButton
            Left = 610
            Top = 2
            Width = 24
            Height = 24
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
            OnClick = btnIncluirDetailClick
          end
          object btnSalvarDetail: TSpeedButton
            Left = 635
            Top = 2
            Width = 24
            Height = 24
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
            OnClick = btnSalvarDetailClick
          end
          object btnCancelarDetail: TSpeedButton
            Left = 660
            Top = 2
            Width = 24
            Height = 24
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
            OnClick = btnCancelarDetailClick
          end
          object btnExcluirDetail: TSpeedButton
            Left = 685
            Top = 2
            Width = 24
            Height = 24
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
            OnClick = btnExcluirDetailClick
          end
          object Label3: TLabel
            Left = 5
            Top = 4
            Width = 356
            Height = 20
            Caption = 'Inclus'#227'o dos status para essa configura'#231#227'o.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
        end
        object DBGrid1: TDBGrid
          Left = 4
          Top = 34
          Width = 712
          Height = 281
          Ctl3D = False
          DataSource = dsCadConfigStatusDetail
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete]
          ParentCtl3D = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CD_ETAPA'
              Title.Caption = 'Etapa'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'calcEtapa'
              Title.Caption = #160
              Width = 290
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CD_EVENTO'
              Title.Caption = 'Evento'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'calcEvento'
              Title.Caption = #160
              Width = 290
              Visible = True
            end>
        end
      end
    end
  end
  object pnlCadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 43
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      742
      43)
    object btnIncluir: TSpeedButton
      Left = 4
      Top = 4
      Width = 34
      Height = 35
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
      OnClick = btnIncluirClick
    end
    object btnExcluir: TSpeedButton
      Left = 109
      Top = 4
      Width = 34
      Height = 35
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
      OnClick = btnExcluirClick
    end
    object btnSair: TSpeedButton
      Left = 365
      Top = 4
      Width = 34
      Height = 35
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
      OnClick = btnSairClick
    end
    object btnSalvar: TSpeedButton
      Left = 39
      Top = 4
      Width = 34
      Height = 35
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
      OnClick = btnSalvarClick
    end
    object btnCancelar: TSpeedButton
      Left = 74
      Top = 4
      Width = 34
      Height = 35
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
      OnClick = btnCancelarClick
    end
    object pnlPesquisa: TPanel
      Left = 400
      Top = 2
      Width = 340
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      TabStop = True
      object lblChave: TLabel
        Left = 119
        Top = 1
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
      object lblOrdem: TLabel
        Left = 224
        Top = 1
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
      object edtChave: TEdit
        Left = 120
        Top = 14
        Width = 97
        Height = 21
        TabOrder = 0
      end
      object cmbOrdem: TComboBox
        Left = 225
        Top = 14
        Width = 112
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
      end
      object dbnavEtapa: TDBNavigator
        Left = 15
        Top = 9
        Width = 88
        Height = 21
        DataSource = dsCadConfigStatus
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        Hints.Strings = (
          'Primeira'
          'Anterior'
          'Pr'#243'xima'
          #218'ltima')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
  end
  object mmCadastro: TMainMenu
    Left = 243
    Top = 18
    object mniIncluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      Hint = ' '
    end
    object mniSalvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
    end
    object mniCancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
    end
    object mniExcluir: TMenuItem
      Caption = '&Excluir'
      Enabled = False
      Hint = ' '
    end
    object mniSair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
    end
  end
  object dsCadConfigStatus: TDataSource
    DataSet = qryCadConfigStatus
    OnStateChange = dsCadConfigStatusStateChange
    Left = 596
    Top = 298
  end
  object dsCadConfigStatusDetail: TDataSource
    DataSet = qryCadConfigStatusDetail
    OnStateChange = dsCadConfigStatusDetailStateChange
    Left = 596
    Top = 394
  end
  object qryCadConfigStatus: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_CAD_CONFIG_STATUS, TX_CAD_CONFIG_STATUS FROM TCAD_CONF' +
        'IG_STATUS')
    Left = 564
    Top = 274
    object qryCadConfigStatusNR_CAD_CONFIG_STATUS: TAutoIncField
      FieldName = 'NR_CAD_CONFIG_STATUS'
      Origin = 'DBBROKER.TCAD_CONFIG_STATUS.NR_CAD_CONFIG_STATUS'
    end
    object qryCadConfigStatusTX_CAD_CONFIG_STATUS: TStringField
      FieldName = 'TX_CAD_CONFIG_STATUS'
      Origin = 'DBBROKER.TCAD_CONFIG_STATUS.TX_CAD_CONFIG_STATUS'
      FixedChar = True
      Size = 100
    end
  end
  object qryCadConfigStatusDetail: TQuery
    BeforePost = qryCadConfigStatusDetailBeforePost
    OnCalcFields = qryCadConfigStatusDetailCalcFields
    OnPostError = qryCadConfigStatusDetailPostError
    DatabaseName = 'DBBROKER'
    DataSource = dsCadConfigStatus
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_CAD_CONFIG_STATUS, CD_ETAPA, CD_EVENTO '
      'FROM TCAD_CONFIG_STATUS_DETAIL'
      'WHERE NR_CAD_CONFIG_STATUS = :NR_CAD_CONFIG_STATUS')
    Left = 564
    Top = 370
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_CAD_CONFIG_STATUS'
        ParamType = ptUnknown
      end>
    object qryCadConfigStatusDetailNR_CAD_CONFIG_STATUS: TIntegerField
      FieldName = 'NR_CAD_CONFIG_STATUS'
      Origin = 'DBBROKER.TCAD_CONFIG_STATUS_DETAIL.NR_CAD_CONFIG_STATUS'
    end
    object qryCadConfigStatusDetailCD_ETAPA: TIntegerField
      FieldName = 'CD_ETAPA'
      Origin = 'DBBROKER.TCAD_CONFIG_STATUS_DETAIL.CD_ETAPA'
    end
    object qryCadConfigStatusDetailCD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'DBBROKER.TCAD_CONFIG_STATUS_DETAIL.CD_EVENTO'
      FixedChar = True
      Size = 3
    end
    object qryCadConfigStatusDetailcalcEtapa: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcEtapa'
      Size = 200
      Calculated = True
    end
    object qryCadConfigStatusDetailcalcEvento: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcEvento'
      Size = 200
      Calculated = True
    end
  end
end

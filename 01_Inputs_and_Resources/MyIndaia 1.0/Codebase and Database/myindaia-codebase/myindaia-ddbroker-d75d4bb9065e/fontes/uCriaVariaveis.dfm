object frmCriaVariaveis: TfrmCriaVariaveis
  Left = 258
  Top = 112
  Width = 856
  Height = 615
  Caption = 'Cria'#231#227'o de Novas Vari'#225'veis'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 840
    Height = 51
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      840
      51)
    object btn_sair: TSpeedButton
      Left = 804
      Top = 6
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
      Left = 7
      Top = 6
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
      Left = 46
      Top = 6
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
    object btn_excluir: TSpeedButton
      Left = 85
      Top = 6
      Width = 38
      Height = 41
      Hint = 'Excluir'
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 377
    Width = 840
    Height = 200
    Align = alClient
    TabOrder = 1
    object dbgrdVariaveis: TDBGrid
      Left = 1
      Top = 24
      Width = 838
      Height = 175
      Align = alClient
      DataSource = dsCartasConfig
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'TX_CARTAS_CONFIG'
          Title.Caption = 'Descri'#231#227'o'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_CAMPO'
          Title.Caption = 'Campo'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TX_MASCARA'
          Title.Caption = 'M'#225'scara'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_TABELA'
          Title.Caption = 'Tabela'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_JOIN'
          Title.Caption = 'Join'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calcTabela'
          Title.Caption = 'Tabela Join'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calcSQL'
          Title.Caption = 'SQL Manual'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calcDirecao'
          Title.Caption = 'Dire'#231#227'o'
          Width = 100
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 838
      Height = 23
      Align = alTop
      TabOrder = 1
      object lbl1: TLabel
        Left = 4
        Top = 5
        Width = 94
        Height = 13
        Caption = 'Vari'#225'veis Existentes'
        Transparent = True
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 51
    Width = 840
    Height = 326
    Align = alTop
    TabOrder = 2
    object shp2: TShape
      Left = 8
      Top = 5
      Width = 824
      Height = 308
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp8: TShape
      Left = 498
      Top = 112
      Width = 160
      Height = 56
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp6: TShape
      Left = 18
      Top = 112
      Width = 143
      Height = 107
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp5: TShape
      Left = 334
      Top = 112
      Width = 160
      Height = 56
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp7: TShape
      Left = 168
      Top = 112
      Width = 160
      Height = 56
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lbl2: TLabel
      Left = 20
      Top = 70
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object lbl3: TLabel
      Left = 25
      Top = 116
      Width = 33
      Height = 13
      Caption = 'Campo'
    end
    object lbl4: TLabel
      Left = 176
      Top = 116
      Width = 33
      Height = 13
      Caption = 'Tabela'
    end
    object lbl5: TLabel
      Left = 340
      Top = 116
      Width = 117
      Height = 13
      Caption = 'Campo na TPROCESSO'
    end
    object lbl7: TLabel
      Left = 18
      Top = 228
      Width = 355
      Height = 13
      Caption = 
        'SQL Manual ( digite a instru'#231#227'o do SQL, retornando no maximo um ' +
        'campo )'
    end
    object shp4: TShape
      Left = 13
      Top = 9
      Width = 814
      Height = 53
      Brush.Color = clInfoBk
    end
    object lbl8: TLabel
      Left = 18
      Top = 12
      Width = 672
      Height = 44
      Caption = 
        '1. Para campos localizados na TPROCESSO ou TPROPOSTA, digite sim' +
        'plesmente a descri'#231#227'o desejada ( sem barras ou espa'#231'os )  e o no' +
        'me do campo na  tabela'#13#10'2. Campos lozalizados em alguma tabela d' +
        'iretamente ligada a TPROCESSO, preencha todos os campos, menos o' +
        ' SQL Manual'#13#10'3. Para resultados que precisam de mais de 1 JOIN, ' +
        'escreva a em SQL Manual sempre deixando um '#250'nico parametro ( :NR' +
        '_PROCESSO ) ou (:NR_PROPOSTA)'#13#10'4. Em dire'#231#227'o escolha Horizontal ' +
        'para os itens aparecerem na mesma linha ou Vertical para os iten' +
        's apacerem um por linha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lbl6: TLabel
      Left = 506
      Top = 116
      Width = 124
      Height = 13
      Caption = 'Campo na segunda tabela'
    end
    object Shape1: TShape
      Left = 663
      Top = 112
      Width = 160
      Height = 56
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label1: TLabel
      Left = 671
      Top = 116
      Width = 37
      Height = 13
      Caption = 'Dire'#231#227'o'
    end
    object Label2: TLabel
      Left = 25
      Top = 158
      Width = 41
      Height = 13
      Caption = 'M'#225'scara'
    end
    object edtJoin2: TEdit
      Left = 507
      Top = 133
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edtDescricaoChange
    end
    object edtDescricao: TEdit
      Left = 21
      Top = 84
      Width = 460
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = edtDescricaoChange
      OnKeyPress = edtDescricaoKeyPress
    end
    object edtCampo: TEdit
      Left = 26
      Top = 133
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnChange = edtDescricaoChange
    end
    object edtTabela: TEdit
      Left = 177
      Top = 133
      Width = 141
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      OnChange = edtDescricaoChange
    end
    object edtJoin1: TEdit
      Left = 341
      Top = 133
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      OnChange = edtDescricaoChange
    end
    object memSQLManual: TMemo
      Left = 17
      Top = 247
      Width = 811
      Height = 61
      Lines.Strings = (
        '')
      TabOrder = 5
      OnChange = edtDescricaoChange
    end
    object btnEscolheTabela: TSpinButton
      Left = 468
      Top = 119
      Width = 19
      Height = 42
      Hint = 'Escolha da Tabela de Join'
      DownGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000000000000080800000808000008080000080
        8000008080000080800000808000000000000000000000000000008080000080
        8000008080000080800000808000000000000000000000000000000000000000
        0000008080000080800000808000000000000000000000000000000000000000
        0000000000000000000000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      UpGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000000000000000000000000000000000000000000000000000000000000080
        8000008080000080800000000000000000000000000000000000000000000080
        8000008080000080800000808000008080000000000000000000000000000080
        8000008080000080800000808000008080000080800000808000000000000080
        8000008080000080800000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      OnDownClick = btnEscolheTabelaDownClick
      OnUpClick = btnEscolheTabelaDownClick
    end
    object chkVarios: TCheckBox
      Left = 26
      Top = 199
      Width = 131
      Height = 17
      Hint = 'Este campo pode ter v'#225'rios registros para 1 processo'
      Caption = 'Contem v'#225'rios registros'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object rgProduto: TRadioGroup
      Left = 541
      Top = 73
      Width = 284
      Height = 38
      Caption = 'Produto'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Importa'#231#227'o'
        'Exporta'#231#227'o'
        'Ambos')
      TabOrder = 8
    end
    object cboDirecao: TComboBox
      Left = 672
      Top = 133
      Width = 129
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 9
      Text = 'Horizontal'
      Items.Strings = (
        'Horizontal'
        'Vertical')
    end
    object edt_Mascara: TEdit
      Left = 26
      Top = 172
      Width = 121
      Height = 21
      TabOrder = 10
      OnChange = edtDescricaoChange
    end
  end
  object qryCartasConfig: TQuery
    OnCalcFields = qryCartasConfigCalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TCARTAS_CONFIG')
    Left = 617
    Top = 6
    object qryCartasConfigCD_CARTAS_CONFIG: TIntegerField
      FieldName = 'CD_CARTAS_CONFIG'
      Origin = 'DBBROKER.TCARTAS_CONFIG.CD_CARTAS_CONFIG'
    end
    object qryCartasConfigTX_CARTAS_CONFIG: TStringField
      FieldName = 'TX_CARTAS_CONFIG'
      Origin = 'DBBROKER.TCARTAS_CONFIG.TX_CARTAS_CONFIG'
      FixedChar = True
      Size = 50
    end
    object qryCartasConfigNM_CAMPO: TStringField
      FieldName = 'NM_CAMPO'
      Origin = 'DBBROKER.TCARTAS_CONFIG.NM_CAMPO'
      FixedChar = True
      Size = 50
    end
    object qryCartasConfigNM_TABELA: TStringField
      FieldName = 'NM_TABELA'
      Origin = 'DBBROKER.TCARTAS_CONFIG.NM_TABELA'
      FixedChar = True
      Size = 50
    end
    object qryCartasConfigNM_JOIN: TStringField
      FieldName = 'NM_JOIN'
      Origin = 'DBBROKER.TCARTAS_CONFIG.NM_JOIN'
      FixedChar = True
      Size = 80
    end
    object qryCartasConfigIN_TABELA: TStringField
      FieldName = 'IN_TABELA'
      Origin = 'DBBROKER.TCARTAS_CONFIG.IN_TABELA'
      FixedChar = True
      Size = 1
    end
    object qryCartasConfigcalcTabela: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcTabela'
      Calculated = True
    end
    object qryCartasConfigIN_VARIOS_REGISTROS: TStringField
      FieldName = 'IN_VARIOS_REGISTROS'
      Origin = 'DBBROKER.TCARTAS_CONFIG.IN_VARIOS_REGISTROS'
      FixedChar = True
      Size = 1
    end
    object qryCartasConfigTP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      Origin = 'DBBROKER.TCARTAS_CONFIG.TP_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryCartasConfigNM_SQL_MANUAL: TMemoField
      FieldName = 'NM_SQL_MANUAL'
      Origin = 'DBBROKER.TCARTAS_CONFIG.NM_SQL_MANUAL'
      BlobType = ftMemo
    end
    object qryCartasConfigcalcSQL: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcSQL'
      Size = 255
      Calculated = True
    end
    object qryCartasConfigCD_DIRECAO: TStringField
      FieldName = 'CD_DIRECAO'
      Origin = 'DBBROKER.TCARTAS_CONFIG.CD_DIRECAO'
      FixedChar = True
      Size = 1
    end
    object qryCartasConfigcalcDirecao: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcDirecao'
      Size = 10
      Calculated = True
    end
    object qryCartasConfigTX_MASCARA: TStringField
      FieldName = 'TX_MASCARA'
      FixedChar = True
      Size = 50
    end
  end
  object dsCartasConfig: TDataSource
    DataSet = qryCartasConfig
    Left = 731
    Top = 5
  end
end

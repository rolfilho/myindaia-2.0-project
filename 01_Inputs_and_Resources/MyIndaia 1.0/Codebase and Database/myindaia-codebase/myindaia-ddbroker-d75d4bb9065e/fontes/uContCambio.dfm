object frmContCambio: TfrmContCambio
  Left = 191
  Top = 107
  Width = 693
  Height = 471
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Controle de Contratos de C'#226'mbio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    685
    444)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlContratos: TPanel
    Left = 0
    Top = 53
    Width = 685
    Height = 391
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvLowered
    TabOrder = 2
    Visible = False
    DesignSize = (
      685
      391)
    object lblContratos: TLabel
      Left = 9
      Top = 7
      Width = 219
      Height = 13
      Caption = 'Visualiza'#231#227'o de Contratos Dispon'#237'veis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblProcessos: TLabel
      Left = 9
      Top = 196
      Width = 359
      Height = 13
      Caption = 'Processos / Faturas Vinculadas ao contrato selecionado acima'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgrdContratos: TDBGrid
      Left = 9
      Top = 21
      Width = 668
      Height = 169
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      DataSource = dsContCamb
      Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = dbgrdContratosCellClick
      Columns = <
        item
          Color = 15662846
          Expanded = False
          FieldName = 'NR_CONT_CAMB'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 50
          Visible = True
        end
        item
          Color = 15662846
          Expanded = False
          FieldName = 'NR_BANCO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_DISPONIVEL'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_VENC_DOCTO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 110
          Visible = True
        end>
    end
    object dbgrdFaturasVinc: TDBGrid
      Left = 9
      Top = 210
      Width = 668
      Height = 174
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      DataSource = dsProcessoExpContCamb
      Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = 15662846
          Expanded = False
          FieldName = 'calcNrProcesso'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Color = 15662846
          Expanded = False
          FieldName = 'NR_FATURA_CDE'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_VINCULADO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_VINCULADO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 110
          Visible = True
        end>
    end
  end
  object pnlProcesso: TPanel
    Left = 0
    Top = 53
    Width = 685
    Height = 391
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      685
      391)
    object lblProcesso: TLabel
      Left = 179
      Top = 7
      Width = 74
      Height = 13
      Caption = 'Nr. Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnNrProcesso: TSpeedButton
      Left = 282
      Top = 19
      Width = 25
      Height = 23
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
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
      OnClick = btnNrProcessoClick
    end
    object lblUnidade: TLabel
      Left = 10
      Top = 7
      Width = 48
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnUnidade: TSpeedButton
      Left = 143
      Top = 19
      Width = 25
      Height = 23
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
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
      OnClick = btnUnidadeClick
    end
    object lblMoeda: TLabel
      Left = 10
      Top = 43
      Width = 39
      Height = 13
      Caption = 'Moeda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDtVencto: TLabel
      Left = 179
      Top = 43
      Width = 62
      Height = 13
      Caption = 'Dt. Vencto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object shp1: TShape
      Left = 12
      Top = 371
      Width = 13
      Height = 13
      Anchors = [akLeft, akBottom]
      Brush.Color = 15662830
      Pen.Color = clGreen
    end
    object lbl1: TLabel
      Left = 27
      Top = 371
      Width = 308
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Duplo clique na coluna para alterar o contrato/banco.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object mskNrProcesso: TMaskEdit
      Left = 179
      Top = 20
      Width = 100
      Height = 20
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      CharCase = ecUpperCase
      Ctl3D = False
      Enabled = False
      MaxLength = 14
      ParentCtl3D = False
      TabOrder = 2
      OnExit = mskNrProcessoExit
      OnKeyDown = mskNrProcessoKeyDown
    end
    object chkNrProcesso: TCheckBox
      Left = 311
      Top = 22
      Width = 107
      Height = 17
      TabStop = False
      Caption = #218'ltimos Processos'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 3
    end
    object mskUnidade: TMaskEdit
      Left = 10
      Top = 20
      Width = 30
      Height = 20
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 0
      OnChange = btnUnidadeClick
      OnExit = mskUnidadeExit
    end
    object edtUnidade: TEdit
      Left = 40
      Top = 20
      Width = 100
      Height = 20
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Color = clSilver
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtNmMoeda: TEdit
      Left = 10
      Top = 56
      Width = 131
      Height = 20
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtDtVencto: TEdit
      Left = 179
      Top = 56
      Width = 100
      Height = 20
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
    end
    object dbgrdFaturas: TDBGrid
      Left = 10
      Top = 83
      Width = 666
      Height = 283
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      Ctl3D = False
      DataSource = dsFaturas
      Enabled = False
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgrdFaturasDblClick
      Columns = <
        item
          Color = 15662846
          Expanded = False
          FieldName = 'NR_FATURA_CDE'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'calcIN_CAMBIO_PRONTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -15
          Font.Name = 'Wingdings'
          Font.Style = []
          ReadOnly = True
          Title.Caption = 'C'#226'mbio Pronto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_VINCULADO'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_VINCULADO'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 95
          Visible = True
        end
        item
          Color = 15662830
          Expanded = False
          FieldName = 'NR_CONT_CAMB'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 80
          Visible = True
        end
        item
          Color = 15662830
          Expanded = False
          FieldName = 'NR_BANCO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMaroon
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 80
          Visible = True
        end>
    end
    object memInfo: TMemo
      Left = 541
      Top = 88
      Width = 105
      Height = 269
      TabStop = False
      Anchors = [akTop, akRight]
      BorderStyle = bsNone
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      Lines.Strings = (
        #8226' Para vincular contratos '
        '  de c'#226'mbio as faturas do '
        '  processo, clique no '
        '  bot'#227'o incluir;'
        ''
        #8226' Informe o n'#250'mero do '
        '  processo e pressione '
        '  TAB ou ENTER;'
        ''
        #8226' O sistema vai sugerir o '
        '  contrato a ser vinculado '
        '  as faturas do processo;'
        ''
        #8226' Se for necess'#225'rio pode '
        '  alterar o contrato de '
        '  c'#226'mbio;'
        ''
        #8226' Definidos os contratos, '
        '  clique em salvar.')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
    end
  end
  object pnlComandos: TPanel
    Left = 0
    Top = 0
    Width = 685
    Height = 48
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      685
      48)
    object btnIncluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 40
      Height = 40
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
    object btnSalvar: TSpeedButton
      Left = 45
      Top = 4
      Width = 40
      Height = 40
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
      Left = 85
      Top = 4
      Width = 40
      Height = 40
      Hint = 'Cancelar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
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
    object btnSair: TSpeedButton
      Left = 641
      Top = 4
      Width = 40
      Height = 40
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
  end
  object dbWeb: TDatabase
    AliasName = 'MYINDAIA'
    DatabaseName = 'dbWeb'
    HandleShared = True
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SA'
      'PASSWORD=123')
    SessionName = 'ContratoCambio'
    Left = 617
    Top = 307
  end
  object qryContCamb: TQuery
    CachedUpdates = True
    AfterPost = qryContCambAfterPost
    AfterDelete = qryContCambAfterPost
    DatabaseName = 'dbWeb'
    SessionName = 'ContratoCambio'
    SQL.Strings = (
      'SELECT NR_CONT_CAMB, NR_BANCO, VL_NEGOC, VL_ACE,'
      
        '  (VL_NEGOC-ISNULL(VL_ACE, 0)) AS VL_DISPONIVEL, DT_VENC_DOCTO, ' +
        'CD_STATUS_CONT'
      'FROM TCONT_CAMB (NOLOCK)'
      'WHERE CD_STATUS_CONT = '#39'2'#39
      'ORDER BY DT_VENC_DOCTO ASC')
    UpdateObject = updContCamb
    Left = 617
    Top = 337
    object qryContCambNR_CONT_CAMB: TStringField
      DisplayLabel = 'Contrato'
      FieldName = 'NR_CONT_CAMB'
      FixedChar = True
      Size = 6
    end
    object qryContCambNR_BANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'NR_BANCO'
      FixedChar = True
      Size = 8
    end
    object qryContCambVL_NEGOC: TFloatField
      FieldName = 'VL_NEGOC'
    end
    object qryContCambVL_ACE: TFloatField
      FieldName = 'VL_ACE'
    end
    object qryContCambVL_DISPONIVEL: TFloatField
      DisplayLabel = 'Valor Dispon'#237'vel'
      FieldName = 'VL_DISPONIVEL'
      DisplayFormat = '#,#,#.00'
    end
    object qryContCambDT_VENC_DOCTO: TDateTimeField
      DisplayLabel = 'Vencto. Docto.'
      FieldName = 'DT_VENC_DOCTO'
    end
    object qryContCambCD_STATUS_CONT: TStringField
      FieldName = 'CD_STATUS_CONT'
      FixedChar = True
      Size = 1
    end
  end
  object qryProcessoExpContCamb: TQuery
    CachedUpdates = True
    AfterPost = qryContCambAfterPost
    AfterDelete = qryContCambAfterPost
    OnCalcFields = qryProcessoExpContCambCalcFields
    DatabaseName = 'dbWeb'
    SessionName = 'ContratoCambio'
    SQL.Strings = (
      
        'SELECT NR_CONT_CAMB, NR_BANCO, NR_PROCESSO, NR_FATURA_CDE, ISNUL' +
        'L(VL_VINCULADO, 0) AS VL_VINCULADO,'
      '  DT_VINCULADO, CD_USUARIO_VINC, CD_STATUS_VINC'
      'FROM TPROCESSO_EXP_CONT_CAMB P (NOLOCK)'
      'WHERE NR_CONT_CAMB = :NR_CONT_CAMB'
      '  AND NR_BANCO = :NR_BANCO')
    UpdateObject = updProcessoExpContCamb
    Left = 617
    Top = 367
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONT_CAMB'
        ParamType = ptInput
        Size = 6
      end
      item
        DataType = ftString
        Name = 'NR_BANCO'
        ParamType = ptInput
        Size = 8
      end>
    object qryProcessoExpContCambNR_CONT_CAMB: TStringField
      FieldName = 'NR_CONT_CAMB'
      FixedChar = True
      Size = 6
    end
    object qryProcessoExpContCambNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      FixedChar = True
      Size = 8
    end
    object qryProcessoExpContCambNR_PROCESSO: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryProcessoExpContCambNR_FATURA_CDE: TStringField
      DisplayLabel = 'Nr. Fatura'
      FieldName = 'NR_FATURA_CDE'
      FixedChar = True
      Size = 15
    end
    object qryProcessoExpContCambVL_VINCULADO: TFloatField
      DisplayLabel = 'Valor Vinc.'
      FieldName = 'VL_VINCULADO'
      DisplayFormat = '#,#,#.00'
    end
    object qryProcessoExpContCambDT_VINCULADO: TDateTimeField
      DisplayLabel = 'Data Vinc.'
      FieldName = 'DT_VINCULADO'
    end
    object qryProcessoExpContCambCD_USUARIO_VINC: TStringField
      FieldName = 'CD_USUARIO_VINC'
      FixedChar = True
      Size = 4
    end
    object qryProcessoExpContCambcalcNrProcesso: TStringField
      DisplayLabel = 'Nr. Processo'
      FieldKind = fkCalculated
      FieldName = 'calcNrProcesso'
      Size = 10
      Calculated = True
    end
  end
  object dsContCamb: TDataSource
    DataSet = qryContCamb
    Left = 586
    Top = 337
  end
  object dsProcessoExpContCamb: TDataSource
    DataSet = qryProcessoExpContCamb
    Left = 586
    Top = 367
  end
  object mtblFaturas: TMemoryTable
    OnCalcFields = mtblFaturasCalcFields
    SessionName = 'ContratoCambio'
    Left = 617
    Top = 397
    object mtblFaturasNR_CONT_CAMB: TStringField
      DisplayLabel = 'Nr. Contrato'
      FieldName = 'NR_CONT_CAMB'
      Size = 6
    end
    object mtblFaturasNR_BANCO: TStringField
      DisplayLabel = 'Nr. Banco'
      FieldName = 'NR_BANCO'
      Size = 8
    end
    object mtblFaturasNR_FATURA_CDE: TStringField
      DisplayLabel = 'Nr. Fatura'
      FieldName = 'NR_FATURA_CDE'
      Size = 15
    end
    object mtblFaturasVL_VINCULADO: TFloatField
      DisplayLabel = 'Valor Vinculado'
      FieldName = 'VL_VINCULADO'
      DisplayFormat = '#,#,#.00'
    end
    object mtblFaturasDT_VINCULADO: TDateTimeField
      DisplayLabel = 'Dt. Vincula'#231#227'o'
      FieldName = 'DT_VINCULADO'
    end
    object mtblFaturasIN_CAMBIO_PRONTO: TBooleanField
      FieldName = 'IN_CAMBIO_PRONTO'
    end
    object mtblFaturascalcIN_CAMBIO_PRONTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcIN_CAMBIO_PRONTO'
      Size = 1
      Calculated = True
    end
    object mtblFaturasDT_FATURA_CDE: TDateTimeField
      FieldName = 'DT_FATURA_CDE'
    end
  end
  object dsFaturas: TDataSource
    DataSet = mtblFaturas
    Left = 586
    Top = 397
  end
  object updProcessoExpContCamb: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_EXP_CONT_CAMB'
      'set'
      '  VL_VINCULADO = :VL_VINCULADO,'
      '  DT_VINCULADO = :DT_VINCULADO,'
      '  CD_USUARIO_VINC = :CD_USUARIO_VINC'
      'where'
      '  NR_CONT_CAMB = :OLD_NR_CONT_CAMB and'
      '  NR_BANCO = :OLD_NR_BANCO and'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_FATURA_CDE = :OLD_NR_FATURA_CDE')
    InsertSQL.Strings = (
      'insert into TPROCESSO_EXP_CONT_CAMB'
      '  (NR_CONT_CAMB, NR_BANCO, NR_PROCESSO, NR_FATURA_CDE, '
      'VL_VINCULADO, DT_VINCULADO, '
      '   CD_USUARIO_VINC)'
      'values'
      '  (:NR_CONT_CAMB, :NR_BANCO, :NR_PROCESSO, :NR_FATURA_CDE, '
      ':VL_VINCULADO, '
      '   :DT_VINCULADO, :CD_USUARIO_VINC)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_EXP_CONT_CAMB'
      'where'
      '  NR_CONT_CAMB = :OLD_NR_CONT_CAMB and'
      '  NR_BANCO = :OLD_NR_BANCO and'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_FATURA_CDE = :OLD_NR_FATURA_CDE')
    Left = 648
    Top = 367
  end
  object updContCamb: TUpdateSQL
    ModifySQL.Strings = (
      'update TCONT_CAMB'
      'set'
      '  VL_ACE = :VL_ACE,'
      '  CD_STATUS_CONT = :CD_STATUS_CONT'
      'where'
      '  NR_CONT_CAMB = :OLD_NR_CONT_CAMB and'
      '  NR_BANCO = :OLD_NR_BANCO')
    InsertSQL.Strings = (
      'insert into TCONT_CAMB'
      '  (NR_CONT_CAMB, NR_BANCO, VL_DISPONIVEL, VL_ACE, DT_VENC_DOCTO)'
      'values'
      '  (:NR_CONT_CAMB, :NR_BANCO, :VL_DISPONIVEL, :VL_ACE, '
      ':DT_VENC_DOCTO)')
    DeleteSQL.Strings = (
      'delete from TCONT_CAMB'
      'where'
      '  NR_CONT_CAMB = :OLD_NR_CONT_CAMB and'
      '  NR_BANCO = :OLD_NR_BANCO')
    Left = 648
    Top = 337
  end
  object ssnWeb: TSession
    Active = True
    SessionName = 'ContratoCambio'
    Left = 586
    Top = 307
  end
end

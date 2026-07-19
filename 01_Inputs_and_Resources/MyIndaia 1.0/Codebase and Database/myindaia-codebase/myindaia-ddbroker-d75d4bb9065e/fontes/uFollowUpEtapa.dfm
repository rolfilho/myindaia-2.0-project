object frmFollowUpEtapa: TfrmFollowUpEtapa
  Left = 192
  Top = 107
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Controle de Status do Processo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmCadastro
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    742
    504)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMenu: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 53
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      53)
    object btnIncluir: TSpeedButton
      Left = 4
      Top = 5
      Width = 43
      Height = 43
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
      Left = 133
      Top = 5
      Width = 43
      Height = 43
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
      Left = 435
      Top = 5
      Width = 43
      Height = 43
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
      Left = 47
      Top = 5
      Width = 43
      Height = 43
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
      Left = 90
      Top = 5
      Width = 43
      Height = 43
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
    object shpBusca: TShape
      Left = 482
      Top = 10
      Width = 255
      Height = 36
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object shpLabel: TShape
      Left = 585
      Top = 6
      Width = 147
      Height = 15
      Anchors = [akTop, akRight]
      Brush.Color = 15658734
      Pen.Color = clGray
    end
    object lblBusca: TLabel
      Left = 596
      Top = 7
      Width = 134
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'busca r'#225'pida por status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtBuscaEtapa: TEdit
      Left = 488
      Top = 23
      Width = 244
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnChange = edtBuscaEtapaChange
    end
  end
  object dbgrdEtapas: TDBGrid
    Left = 0
    Top = 117
    Width = 742
    Height = 387
    Anchors = [akLeft, akTop, akRight, akBottom]
    Ctl3D = False
    DataSource = dsFollowUpEtapa
    Options = [dgTitles, dgColumnResize, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
    ParentCtl3D = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgrdEtapasDblClick
    OnKeyPress = dbgrdEtapasKeyPress
    Columns = <
      item
        Color = 15663103
        Expanded = False
        FieldName = 'CD_FOLLOWUP_ETAPA'
        Title.Color = clMenu
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_ETAPA'
        Title.Color = clMenu
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 464
        Visible = True
      end
      item
        Color = 15663086
        Expanded = False
        FieldName = 'DT_ALTERACAO'
        Title.Color = clMenu
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Color = 16119285
        Expanded = False
        FieldName = 'AP_USUARIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Color = clMenu
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 90
        Visible = True
      end>
  end
  object pnlProcesso: TPanel
    Left = 2
    Top = 58
    Width = 739
    Height = 54
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      739
      54)
    object shpProcesso: TShape
      Left = 0
      Top = 0
      Width = 738
      Height = 54
      Anchors = [akLeft, akTop, akRight]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lblNrProcesso: TLabel
      Left = 333
      Top = 7
      Width = 53
      Height = 13
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
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
    object lblProduto: TLabel
      Left = 172
      Top = 7
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 460
      Top = 26
      Width = 7
      Height = 13
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNrProcesso: TEdit
      Left = 333
      Top = 22
      Width = 125
      Height = 21
      Color = clMenu
      TabOrder = 2
    end
    object edtNomeUnidade: TEdit
      Left = 10
      Top = 22
      Width = 150
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 0
    end
    object edtNomeProduto: TEdit
      Left = 172
      Top = 22
      Width = 150
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object edtNrItem: TEdit
      Left = 469
      Top = 22
      Width = 44
      Height = 21
      Color = clMenu
      TabOrder = 3
    end
  end
  object pnlCadastroEtapa: TPanel
    Left = 156
    Top = 169
    Width = 430
    Height = 97
    Anchors = [akTop]
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 3
    Visible = False
    object lblCodigo: TLabel
      Left = 12
      Top = 10
      Width = 40
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = dbedtCodigo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEtapa: TLabel
      Left = 12
      Top = 49
      Width = 37
      Height = 13
      Caption = 'Status'
      FocusControl = dbedtCodigoEtapa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnConsultaEtapa: TSpeedButton
      Left = 398
      Top = 62
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
      OnClick = btnConsultaEtapaClick
    end
    object dbedtCodigo: TDBEdit
      Left = 12
      Top = 24
      Width = 50
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'CD_FOLLOWUP_ETAPA'
      DataSource = dsFollowUpEtapa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtNomeEtapa: TEdit
      Left = 62
      Top = 63
      Width = 335
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object btnCancel: TButton
      Left = 405
      Top = 8
      Width = 17
      Height = 15
      Caption = #205
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Wingdings 2'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = False
      OnClick = btnCancelarClick
    end
    object dbedtCodigoEtapa: TDBEdit
      Left = 12
      Top = 63
      Width = 51
      Height = 21
      DataField = 'CD_ETAPA'
      DataSource = dsFollowUpEtapa
      TabOrder = 2
      OnChange = btnConsultaEtapaClick
      OnExit = dbedtCodigoEtapaExit
      OnKeyDown = FormKeyDown
    end
  end
  object mmCadastro: TMainMenu
    Left = 187
    Top = 13
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
  object qryFollowUpEtapa: TQuery
    CachedUpdates = True
    AfterPost = qryFollowUpEtapaAfterPost
    AfterDelete = qryFollowUpEtapaAfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT F.CD_UNID_NEG, F.CD_PRODUTO, F.NR_PROCESSO, F.CD_FOLLOWUP' +
        '_ETAPA,'
      
        '  F.CD_ETAPA, F.CD_USUARIO, F.DT_ALTERACAO, E.NM_ETAPA, U.AP_USU' +
        'ARIO'
      
        'FROM TFOLLOWUP_ETAPA F (NOLOCK), TETAPA E (NOLOCK), TUSUARIO U (' +
        'NOLOCK)'
      'WHERE F.NR_PROCESSO = :nr_processo'
      '  AND F.CD_ETAPA *= E.CD_ETAPA'
      '  AND F.CD_USUARIO *= U.CD_USUARIO'
      'ORDER BY F.CD_FOLLOWUP_ETAPA'
      '')
    UpdateObject = updFollowUpEtapa
    Left = 171
    Top = 416
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_processo'
        ParamType = ptInput
        Size = 18
      end>
    object qryFollowUpEtapaCD_UNID_NEG: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TFOLLOWUP_ETAPA.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qryFollowUpEtapaCD_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TFOLLOWUP_ETAPA.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryFollowUpEtapaNR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TFOLLOWUP_ETAPA.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryFollowUpEtapaCD_FOLLOWUP_ETAPA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_FOLLOWUP_ETAPA'
      Origin = 'DBBROKER.TFOLLOWUP_ETAPA.CD_FOLLOWUP_ETAPA'
    end
    object qryFollowUpEtapaCD_ETAPA: TIntegerField
      DisplayLabel = 'Etapa'
      FieldName = 'CD_ETAPA'
      Origin = 'DBBROKER.TFOLLOWUP_ETAPA.CD_ETAPA'
    end
    object qryFollowUpEtapaCD_USUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TFOLLOWUP_ETAPA.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryFollowUpEtapaDT_ALTERACAO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_ALTERACAO'
      Origin = 'DBBROKER.TFOLLOWUP_ETAPA.DT_ALTERACAO'
      EditMask = '!99/99/0000 90:00;1;_'
    end
    object qryFollowUpEtapaNM_ETAPA: TStringField
      DisplayLabel = 'Status'
      FieldName = 'NM_ETAPA'
      FixedChar = True
      Size = 50
    end
    object qryFollowUpEtapaAP_USUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'AP_USUARIO'
      FixedChar = True
      Size = 15
    end
  end
  object updFollowUpEtapa: TUpdateSQL
    ModifySQL.Strings = (
      'update TFOLLOWUP_ETAPA'
      'set'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_FOLLOWUP_ETAPA = :CD_FOLLOWUP_ETAPA,'
      '  CD_ETAPA = :CD_ETAPA,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  DT_ALTERACAO = :DT_ALTERACAO'
      'where'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_FOLLOWUP_ETAPA = :OLD_CD_FOLLOWUP_ETAPA')
    InsertSQL.Strings = (
      'insert into TFOLLOWUP_ETAPA'
      '  (CD_UNID_NEG, CD_PRODUTO, NR_PROCESSO, CD_FOLLOWUP_ETAPA, '
      '   CD_ETAPA, CD_USUARIO, DT_ALTERACAO)'
      'values'
      '  (:CD_UNID_NEG, :CD_PRODUTO, :NR_PROCESSO, :CD_FOLLOWUP_ETAPA, '
      '   :CD_ETAPA, :CD_USUARIO, :DT_ALTERACAO)')
    DeleteSQL.Strings = (
      'delete from TFOLLOWUP_ETAPA'
      'where'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_FOLLOWUP_ETAPA = :OLD_CD_FOLLOWUP_ETAPA')
    Left = 267
    Top = 416
  end
  object dsFollowUpEtapa: TDataSource
    DataSet = qryFollowUpEtapa
    OnStateChange = dsFollowUpEtapaStateChange
    Left = 80
    Top = 416
  end
  object qryUltimoCodigoEtapa: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_FOLLOWUP_ETAPA) AS ULTIMO'
      'FROM TFOLLOWUP_ETAPA (NOLOCK)'
      '')
    Left = 347
    Top = 318
    object qryUltimoCodigoEtapaULTIMO: TIntegerField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TETAPA.CD_ETAPA'
    end
  end
  object updFlpPoItemEtapa: TUpdateSQL
    ModifySQL.Strings = (
      'update TFLP_PO_ITEM_ETAPA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ITEM = :NR_ITEM,'
      '  CD_FLP_PO_ITEM_ETAPA = :CD_FLP_PO_ITEM_ETAPA,'
      '  CD_ETAPA = :CD_ETAPA,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  DT_ALTERACAO = :DT_ALTERACAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  CD_FLP_PO_ITEM_ETAPA = :OLD_CD_FLP_PO_ITEM_ETAPA')
    InsertSQL.Strings = (
      'insert into TFLP_PO_ITEM_ETAPA'
      
        '  (NR_PROCESSO, NR_ITEM, CD_FLP_PO_ITEM_ETAPA, CD_ETAPA, CD_USUA' +
        'RIO, DT_ALTERACAO)'
      'values'
      
        '  (:NR_PROCESSO, :NR_ITEM, :CD_FLP_PO_ITEM_ETAPA, :CD_ETAPA, :CD' +
        '_USUARIO, '
      '   :DT_ALTERACAO)')
    DeleteSQL.Strings = (
      'delete from TFLP_PO_ITEM_ETAPA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  CD_FLP_PO_ITEM_ETAPA = :OLD_CD_FLP_PO_ITEM_ETAPA')
    Left = 611
    Top = 416
  end
  object qryFlpPoItemEtapa: TQuery
    CachedUpdates = True
    AfterPost = qryFollowUpEtapaAfterPost
    AfterDelete = qryFollowUpEtapaAfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT F.NR_PROCESSO, F.NR_ITEM, F.CD_FLP_PO_ITEM_ETAPA,'
      
        '       F.CD_ETAPA, F.CD_USUARIO, F.DT_ALTERACAO, E.NM_ETAPA, U.A' +
        'P_USUARIO'
      
        'FROM TFLP_PO_ITEM_ETAPA F (NOLOCK), TETAPA E (NOLOCK), TUSUARIO ' +
        'U (NOLOCK)'
      'WHERE F.NR_PROCESSO = :nr_processo'
      '  AND F.NR_ITEM = :nr_item'
      '  AND F.CD_ETAPA *= E.CD_ETAPA'
      '  AND F.CD_USUARIO *= U.CD_USUARIO'
      'ORDER BY F.CD_FLP_PO_ITEM_ETAPA'
      '')
    UpdateObject = updFlpPoItemEtapa
    Left = 516
    Top = 416
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_processo'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'nr_item'
        ParamType = ptInput
        Size = 3
      end>
    object qryFlpPoItemEtapaNR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryFlpPoItemEtapaCD_FLP_PO_ITEM_ETAPA: TIntegerField
      DisplayLabel = 'Sequencia'
      FieldName = 'CD_FLP_PO_ITEM_ETAPA'
    end
    object qryFlpPoItemEtapaCD_ETAPA: TIntegerField
      DisplayLabel = 'C'#243'digo da Etapa'
      FieldName = 'CD_ETAPA'
    end
    object qryFlpPoItemEtapaCD_USUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryFlpPoItemEtapaDT_ALTERACAO: TDateTimeField
      DisplayLabel = 'Dt. Altera'#231#227'o'
      FieldName = 'DT_ALTERACAO'
    end
    object qryFlpPoItemEtapaNM_ETAPA: TStringField
      DisplayLabel = 'Status'
      FieldName = 'NM_ETAPA'
      FixedChar = True
      Size = 50
    end
    object qryFlpPoItemEtapaAP_USUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'AP_USUARIO'
      FixedChar = True
      Size = 15
    end
    object qryFlpPoItemEtapaNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      FixedChar = True
      Size = 18
    end
  end
  object dsFlpPoItemEtapa: TDataSource
    DataSet = qryFlpPoItemEtapa
    OnStateChange = dsFollowUpEtapaStateChange
    Left = 424
    Top = 416
  end
end

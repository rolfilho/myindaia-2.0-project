object FrmDiagnostico: TFrmDiagnostico
  Left = 49
  Top = 111
  BorderStyle = bsSingle
  Caption = 'Diagn'#243'stico da Transfer'#234'ncia de LI'#39's'
  ClientHeight = 451
  ClientWidth = 920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = menu_cadastro
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 920
    Height = 411
    Align = alClient
    TabOrder = 0
    object lbl_cd_unid_neg: TLabel
      Left = 8
      Top = 3
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
    object btn_cd_unid_neg: TSpeedButton
      Left = 154
      Top = 15
      Width = 22
      Height = 22
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
      Visible = False
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 43
      Width = 903
      Height = 367
      DataSource = dtsDiagnostico
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'calcSTATUS'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Wingdings'
          Font.Style = [fsBold]
          Title.Caption = 'Status'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calcNR_PROCESSO'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Width = 650
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calcLiberado'
          Title.Caption = 'Liberado'
          Visible = True
        end>
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 8
      Top = 16
      Width = 21
      Height = 21
      Color = clMenu
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnChange = msk_cd_unid_negChange
    end
    object edt_nm_unid_neg: TEdit
      Left = 32
      Top = 16
      Width = 120
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object btn_liberar: TSpeedButton
      Left = 8
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Liberar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_liberarClick
    end
    object btn_trans_LI: TSpeedButton
      Left = 41
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Transmitir LI'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_trans_LIClick
    end
    object btn_cancelar: TSpeedButton
      Left = 75
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Cancelar'
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
  end
  object dtsDiagnostico: TDataSource
    DataSet = SqlDiagnostico
    Left = 216
    Top = 264
  end
  object SqlDiagnostico: TQuery
    CachedUpdates = True
    OnCalcFields = SqlDiagnosticoCalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'select * from TTEMP_DIAGN_DB_SUSP')
    Left = 216
    Top = 208
    object SqlDiagnosticoCODIGO: TAutoIncField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TTEMP_DIAGN_DB_SUSP.CODIGO'
      Visible = False
    end
    object SqlDiagnosticocalcNR_PROCESSO: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldKind = fkCalculated
      FieldName = 'calcNR_PROCESSO'
      Size = 10
      Calculated = True
    end
    object SqlDiagnosticoNR_PROCESSO: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TTEMP_DIAGN_DB_SUSP.NR_PROCESSO'
      Visible = False
      FixedChar = True
      Size = 18
    end
    object SqlDiagnosticoSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'DBBROKER.TTEMP_DIAGN_DB_SUSP.STATUS'
      FixedChar = True
      Size = 1
    end
    object SqlDiagnosticoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o do Erro'
      DisplayWidth = 200
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TTEMP_DIAGN_DB_SUSP.DESCRICAO'
      FixedChar = True
      Size = 200
    end
    object SqlDiagnosticocalcSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcSTATUS'
      Calculated = True
    end
    object SqlDiagnosticoLIBERADO: TStringField
      FieldName = 'LIBERADO'
      Origin = 'DBBROKER.TTEMP_DIAGN_DB_SUSP.LIBERADO'
      FixedChar = True
      Size = 1
    end
    object SqlDiagnosticocalcLiberado: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcLiberado'
      Size = 3
      Calculated = True
    end
  end
  object menu_cadastro: TMainMenu
    Left = 564
    Top = 348
    object mi_liberar: TMenuItem
      Caption = '&Liberar'
      Hint = ' '
      OnClick = btn_liberarClick
    end
    object ransmitir1: TMenuItem
      Caption = '&Transmitir'
      OnClick = btn_trans_LIClick
    end
    object Sair1: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
  end
  object UpdDiagnostico: TUpdateSQL
    ModifySQL.Strings = (
      'update TTEMP_DIAGN_DB_SUSP'
      'set'
      '  CODIGO = :CODIGO,'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  STATUS = :STATUS,'
      '  DESCRICAO = :DESCRICAO,'
      '  LIBERADO = :LIBERADO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TTEMP_DIAGN_DB_SUSP'
      '  (CODIGO, NR_PROCESSO, STATUS, DESCRICAO, LIBERADO)'
      'values'
      '  (:CODIGO, :NR_PROCESSO, :STATUS, :DESCRICAO, :LIBERADO)')
    DeleteSQL.Strings = (
      'delete from TTEMP_DIAGN_DB_SUSP'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 320
    Top = 240
  end
end

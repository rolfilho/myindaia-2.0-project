object frmRobos: TfrmRobos
  Left = 281
  Top = 101
  Width = 750
  Height = 550
  Caption = 'Rob'#244's'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    742
    523)
  PixelsPerInch = 96
  TextHeight = 13
  object pgcRobos: TPageControl
    Left = 0
    Top = 0
    Width = 742
    Height = 523
    ActivePage = tbsRobos
    Align = alClient
    Style = tsButtons
    TabHeight = 30
    TabOrder = 0
    OnChange = pgcRobosChange
    object tbsRobos: TTabSheet
      Caption = 'Robos'
      object cxgRobos: TcxGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 483
        Align = alClient
        TabOrder = 0
        object cxgdbtvRobos: TcxGridDBTableView
          DataController.DataSource = dsRobos
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.Header = cxsHeader
          object cxgdbtvRobosOpcoes: TcxGridDBColumn
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000015000000100000000100
                  1800000000000004000000000000000000000000000000000000FF00FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF994E03984D02984D02994E
                  03994E03984D02984D02984D02984D02984D02994E03FFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D5206A25808C47E18E49F1CFCB9
                  209C5105FDBC28FCB81DFCB81DFDC0339C51059C5105FFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3580BAC6310F8BA34F6AF1CF7B11FF8B5
                  27A2570AF8B62AF6AC14F8BA35A2570AA2570AFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFA95E0FAD6413F3B843EFAB2AE7A836BF7A20A85D
                  0EA85D0EF1B339F3B943EEA824F1B339AD6210A95E0FFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFAF6414CC8B33E8A83BE4A845AF6414AE6313FFFF
                  FFAF6414F0BD5CAF6414ECB148E8A83BCD8D34AF6414FFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFB66B19DFA751E3A84EC98734B56A19FFFFFFFFFF
                  FFB66B19B66B19B66B19C98734E3A84EE0A851B66B19FFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFBE731FE7B466E5B061BE731FFFFFFFFFFFFFFFFF
                  FFBD721EBD721EFFFFFFBE731FE5B061E7B466BE731FFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFC57A25E9B86FE6B46CC57A25FFFFFFC67B26C67B
                  26FFFFFFFFFFFFFFFFFFC57A25E6B46CE9B86FC57A25FFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFCD822AE8B66CE8B570DA9B48CD822ACD822ACD82
                  2AFFFFFFFFFFFFCE832BDA9B47E8B570E8B66CCD822AFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFD48930E4AA59EDBC76F1C67ED48930F7D38AD489
                  30FFFFFFD58A31D48930EEC075EDBC76E4A958D48930FFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFDA8F34DD9439F7CE84F2C27AF9D48AF7CE84DB90
                  34DB9034E4A54EF3C679F4C57DF8D289DD953ADA8F34FFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE19639E19639FDD88EF9CC82FCD58AE196
                  39FCD489FBD086FACF84FCD88EE49E43E09539FFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFE69B3DE59A3DFFE094FED98DFED98DFFDD91E59A
                  3DFEDA8EF8CB7BF0B760E79F42E59A3DFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFE99E40E99E40E99E40E99E40E99E40E99E40E99E
                  40E99E40E99E40E99E40E89D3FFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
                Kind = bkGlyph
              end>
            Properties.OnButtonClick = cxgdbtvRobosOpcoesPropertiesButtonClick
            Options.Filtering = False
            Options.ShowEditButtons = isebAlways
            Options.Sorting = False
            Width = 28
            IsCaptionAssigned = True
          end
          object cxgdbtvRobosNM_ROBO: TcxGridDBColumn
            Caption = 'Rob'#244
            PropertiesClassName = 'TcxTextEditProperties'
            Width = 300
            DataBinding.FieldName = 'NM_ROBO'
          end
          object cxgdbtvRobosDT_REINICIO: TcxGridDBColumn
            Caption = 'Reiniciado'
            PropertiesClassName = 'TcxTimeEditProperties'
            Width = 150
            DataBinding.FieldName = 'DT_REINICIO'
          end
          object cxgdbtvRobosNM_USUARIO: TcxGridDBColumn
            Caption = 'Usu'#225'rio'
            PropertiesClassName = 'TcxTextEditProperties'
            Width = 500
            DataBinding.FieldName = 'NM_USUARIO'
          end
        end
        object cxglRobos: TcxGridLevel
          GridView = cxgdbtvRobos
        end
      end
    end
    object tbsHistorico: TTabSheet
      Caption = 'Historico'
      ImageIndex = 1
      object cxgHistorico: TcxGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 483
        Align = alClient
        TabOrder = 0
        object cxgdbtvHistorico: TcxGridDBTableView
          DataController.DataSource = dsHistorico
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.Header = cxsHeader
          object cxgdbtvHistoricoDT_REINICIO: TcxGridDBColumn
            Caption = 'Reinicio'
            Width = 250
            DataBinding.FieldName = 'DT_REINICIO'
          end
          object cxgdbtvHistoricoNM_USUARIO: TcxGridDBColumn
            Caption = 'Usu'#225'rio'
            Width = 800
            DataBinding.FieldName = 'NM_USUARIO'
          end
        end
        object cxglHistorico: TcxGridLevel
          GridView = cxgdbtvHistorico
        end
      end
    end
  end
  object pnlBotoes: TPanel
    Left = 704
    Top = 0
    Width = 33
    Height = 32
    Anchors = [akTop, akRight]
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    DesignSize = (
      31
      30)
    object btnSair: TSpeedButton
      Left = 2
      Top = 1
      Width = 28
      Height = 28
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
  object qryRobos: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TROBO'
      'WHERE CD_PRODUTO = '#39'XX'#39
      '   OR CD_PRODUTO IN (SELECT CD_PRODUTO'
      '                     FROM TUSUARIO_HABILITACAO'
      '                     WHERE IN_ATIVO = '#39'1'#39
      '                       AND CD_USUARIO = :CD_USUARIO)')
    UpdateMode = upWhereKeyOnly
    UpdateObject = updRobos
    Left = 120
    Top = 98
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
      end>
    object qryRobosCD_ROBO: TAutoIncField
      FieldName = 'CD_ROBO'
      Origin = 'DBBROKER.TROBO.CD_ROBO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryRobosNM_ROBO: TStringField
      FieldName = 'NM_ROBO'
      Origin = 'DBBROKER.TROBO.NM_ROBO'
      FixedChar = True
      Size = 255
    end
    object qryRobosCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryRobosDT_REINICIO: TDateTimeField
      FieldName = 'DT_REINICIO'
      Origin = 'DBBROKER.TROBO.DT_REINICIO'
    end
    object qryRobosCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TROBO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryRobosNR_INTERVALO: TIntegerField
      FieldName = 'NR_INTERVALO'
      Origin = 'DBBROKER.TROBO.NR_INTERVALO'
    end
    object qryRobosNM_SERVIDOR: TStringField
      FieldName = 'NM_SERVIDOR'
      Origin = 'DBBROKER.TROBO.NM_SERVIDOR'
      FixedChar = True
      Size = 255
    end
    object qryRobosIN_REINICIAR: TStringField
      FieldName = 'IN_REINICIAR'
      Origin = 'DBBROKER.TROBO.CD_ROBO'
      FixedChar = True
      Size = 1
    end
    object qryRobosNM_USUARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_USUARIO'
      LookupDataSet = qryUsuarios
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'NM_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 255
      Lookup = True
    end
  end
  object dsRobos: TDataSource
    DataSet = qryRobos
    Left = 88
    Top = 98
  end
  object qryUsuarios: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, RTRIM(NM_USUARIO) AS NM_USUARIO'
      'FROM TUSUARIO')
    Left = 240
    Top = 98
    object qryUsuariosCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryUsuariosNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 368
    Top = 90
    object cxsHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
  object dsHistorico: TDataSource
    DataSet = qryHistorico
    Left = 88
    Top = 130
  end
  object qryHistorico: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TROBO_HISTORICO'
      'WHERE CD_ROBO = :CD_ROBO')
    Left = 120
    Top = 130
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_ROBO'
        ParamType = ptInput
      end>
    object qryHistoricoCD_ROBO: TIntegerField
      FieldName = 'CD_ROBO'
      Origin = 'DBBROKER.TROBO_HISTORICO.CD_ROBO'
    end
    object qryHistoricoDT_REINICIO: TDateTimeField
      FieldName = 'DT_REINICIO'
      Origin = 'DBBROKER.TROBO_HISTORICO.DT_REINICIO'
    end
    object qryHistoricoCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TROBO_HISTORICO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryHistoricoNM_USUARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_USUARIO'
      LookupDataSet = qryUsuarios
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'NM_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 255
      Lookup = True
    end
  end
  object qryHora: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DT_REINICIO AS HR_ROBO, GETDATE() AS HR_SERVIDOR, IN_REIN' +
        'ICIAR'
      'FROM TROBO'
      'WHERE CD_ROBO = :CD_ROBO')
    Left = 240
    Top = 194
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_ROBO'
        ParamType = ptInput
      end>
    object qryHoraHR_ROBO: TDateTimeField
      FieldName = 'HR_ROBO'
    end
    object qryHoraHR_SERVIDOR: TDateTimeField
      FieldName = 'HR_SERVIDOR'
    end
    object qryHoraIN_REINICIAR: TStringField
      FieldName = 'IN_REINICIAR'
      FixedChar = True
      Size = 1
    end
  end
  object updRobos: TUpdateSQL
    ModifySQL.Strings = (
      'update TROBO'
      'set'
      '  DT_REINICIO = :DT_REINICIO,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  IN_REINICIAR = :IN_REINICIAR'
      'where'
      '  CD_ROBO = :OLD_CD_ROBO')
    InsertSQL.Strings = (
      'insert into TROBO'
      '  (DT_REINICIO, CD_USUARIO, IN_REINICIAR)'
      'values'
      '  (:DT_REINICIO, :CD_USUARIO, :IN_REINICIAR)')
    DeleteSQL.Strings = (
      'delete from TROBO'
      'where'
      '  CD_ROBO = :OLD_CD_ROBO')
    Left = 153
    Top = 98
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 4959
    OnConnect = ClientSocket1Connect
    OnError = ClientSocket1Error
    Left = 132
    Top = 268
  end
end

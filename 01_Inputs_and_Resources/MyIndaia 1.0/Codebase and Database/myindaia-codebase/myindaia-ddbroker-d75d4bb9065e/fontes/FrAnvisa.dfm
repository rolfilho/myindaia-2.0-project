object FormAnvisa: TFormAnvisa
  Left = 253
  Top = 190
  BorderStyle = bsDialog
  Caption = 'Anvisa'
  ClientHeight = 378
  ClientWidth = 825
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 40
    Width = 825
    Height = 338
    Align = alClient
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 40
    Width = 825
    Height = 338
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 8
    Caption = 'Panel3'
    TabOrder = 1
    object cxGrid: TcxGrid
      Left = 8
      Top = 8
      Width = 809
      Height = 322
      Align = alClient
      TabOrder = 0
      object cxGridDBTableView: TcxGridDBTableView
        DataController.DataSource = dsMain
        DataController.KeyFieldNames = 'CD_EMPRESA'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ShowEditButtons = gsebForFocusedRecord
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object cxGridDBTableViewCD_EMPRESA: TcxGridDBColumn
          DataBinding.FieldName = 'CD_EMPRESA'
          Options.Editing = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 47
        end
        object cxGridDBTableViewNM_EMPRESA: TcxGridDBColumn
          DataBinding.FieldName = 'NM_EMPRESA'
          Options.Editing = False
          Width = 227
        end
        object cxGridDBTableViewCGC_EMPRESA: TcxGridDBColumn
          DataBinding.FieldName = 'CGC_EMPRESA'
          Options.Editing = False
          Width = 101
        end
        object cxGridDBTableViewID_REPRESENTANTE: TcxGridDBColumn
          DataBinding.FieldName = 'ID_REPRESENTANTE'
        end
        object cxGridDBTableViewID_REPRESENTADA: TcxGridDBColumn
          DataBinding.FieldName = 'ID_REPRESENTADA'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 825
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object btnCaixaPosta: TSpeedButton
      Left = 116
      Top = 2
      Width = 36
      Height = 38
      Hint = 'Caixa Postal'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00550B30555000
        0000557F57F557777777550B305508888880557F57F575555557550B30508888
        8805557F57F7FFFFFF75550B300000000055557F5777777777F5550300000000
        0055557F7777777777F55500780F0F0F70555F777577F7F7F7F50078880F0F0F
        705577755577F7F7F7F50888880F0F0F70557F555F77F7F7F7F50888080F0F0F
        70557F557F77F7F7F7F50888980F0F0F70557F557F77F7F7F7F5088898007070
        70557F557F77F757575508889880077705557F5F7F5775FF7555089998888000
        55557F777F555777555508999888075555557577755F77555555508888075555
        5555575FFF775555555555000755555555555577775555555555}
      NumGlyphs = 2
      OnClick = btnCaixaPostaClick
    end
    object btnAlterar: TSpeedButton
      Left = 8
      Top = 2
      Width = 36
      Height = 38
      Hint = 'Alterar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAlterarClick
    end
    object btnSalvar: TSpeedButton
      Left = 44
      Top = 2
      Width = 36
      Height = 38
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
      Left = 80
      Top = 2
      Width = 36
      Height = 38
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
  end
  object dsMain: TDataSource
    AutoEdit = False
    DataSet = qryMain
    Left = 188
    Top = 121
  end
  object qryMain: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT'
      'CD_EMPRESA,'
      'NM_EMPRESA,'
      'CGC_EMPRESA, '
      'ID_REPRESENTANTE,'
      'ID_REPRESENTADA'
      'FROM TEMPRESA_NAC')
    UpdateMode = upWhereChanged
    UpdateObject = updMain
    Left = 220
    Top = 120
    object qryMainCD_EMPRESA: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_EMPRESA'
      Size = 5
    end
    object qryMainNM_EMPRESA: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'NM_EMPRESA'
      Size = 80
    end
    object qryMainCGC_EMPRESA: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'CGC_EMPRESA'
      Size = 14
    end
    object qryMainID_REPRESENTANTE: TStringField
      DisplayLabel = 'Chave Representante'
      FieldName = 'ID_REPRESENTANTE'
      Size = 32
    end
    object qryMainID_REPRESENTADA: TStringField
      DisplayLabel = 'Chave Representada'
      FieldName = 'ID_REPRESENTADA'
      Size = 32
    end
  end
  object updMain: TUpdateSQL
    ModifySQL.Strings = (
      'update TEMPRESA_NAC'
      'set'
      '  ID_REPRESENTANTE = :ID_REPRESENTANTE,'
      '  ID_REPRESENTADA = :ID_REPRESENTADA'
      'where'
      '  CD_EMPRESA = :OLD_CD_EMPRESA')
    Left = 250
    Top = 120
  end
end

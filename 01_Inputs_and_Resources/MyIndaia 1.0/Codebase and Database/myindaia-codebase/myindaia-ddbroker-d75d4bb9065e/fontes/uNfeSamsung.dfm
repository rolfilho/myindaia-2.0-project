object frmNfeSamsung: TfrmNfeSamsung
  Left = 310
  Top = 164
  Width = 784
  Height = 402
  Caption = 'Nfe Samsung'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object nbNfe: TNotebook
    Left = 0
    Top = 31
    Width = 768
    Height = 292
    Align = alClient
    PageIndex = 1
    TabOrder = 0
    OnPageChanged = nbNfePageChanged
    object TPage
      Left = 0
      Top = 0
      Caption = 'Nota Fiscal M'#227'e'
      DesignSize = (
        768
        292)
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 52
        Height = 13
        Caption = 'Unidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 41
        Width = 49
        Height = 13
        Caption = 'Produto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 64
        Width = 57
        Height = 13
        Caption = 'Processo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnUNID_NEG: TSpeedButton
        Left = 321
        Top = 14
        Width = 21
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
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
        OnClick = btnUNID_NEGClick
      end
      object btnPRODUTO: TSpeedButton
        Left = 321
        Top = 38
        Width = 21
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
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
        OnClick = btnPRODUTOClick
      end
      object btnPROCESSO: TSpeedButton
        Left = 194
        Top = 62
        Width = 21
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
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
        OnClick = btnPROCESSOClick
      end
      object Label4: TLabel
        Left = 16
        Top = 90
        Width = 37
        Height = 13
        Caption = 'CFOP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnCFOP: TSpeedButton
        Left = 322
        Top = 86
        Width = 21
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
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
        OnClick = btnCFOPClick
      end
      object edtCD_UNID_NEG: TEdit
        Left = 79
        Top = 14
        Width = 25
        Height = 21
        MaxLength = 2
        TabOrder = 0
        OnChange = edtCD_UNID_NEGChange
        OnExit = edtCD_UNID_NEGExit
      end
      object edtNM_UNID_NEG: TEdit
        Left = 104
        Top = 14
        Width = 216
        Height = 21
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
        Text = '-'
      end
      object edtCD_PRODUTO: TEdit
        Left = 79
        Top = 38
        Width = 25
        Height = 21
        MaxLength = 2
        TabOrder = 2
        OnChange = edtCD_PRODUTOChange
        OnExit = edtCD_PRODUTOExit
      end
      object edtNM_PRODUTO: TEdit
        Left = 104
        Top = 38
        Width = 216
        Height = 21
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
        Text = '-'
      end
      object edtNR_PROCESSO: TEdit
        Left = 79
        Top = 62
        Width = 114
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 14
        TabOrder = 4
        OnChange = edtNR_PROCESSOChange
      end
      object chkUltimosProcessos: TCheckBox
        Left = 220
        Top = 64
        Width = 108
        Height = 17
        Caption = #218'ltimos Processos'
        Checked = True
        Ctl3D = True
        ParentCtl3D = False
        State = cbChecked
        TabOrder = 5
      end
      object edtCD_CFOP: TMaskEdit
        Left = 79
        Top = 86
        Width = 35
        Height = 21
        EditMask = '9.999;0;_'
        MaxLength = 5
        TabOrder = 6
        OnChange = edtCD_CFOPChange
      end
      object edtNM_CFOP: TEdit
        Left = 123
        Top = 86
        Width = 198
        Height = 21
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 7
        Text = '-'
      end
      object chkPossuiFilhote: TCheckBox
        Left = 16
        Top = 115
        Width = 105
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = 'Possui Filhote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = chkPossuiFilhoteClick
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Nota Fiscal Filhote'
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 768
        Height = 292
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsItensDI
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Styles.Header = cxsHeader
          object cxGrid1DBTableView1IN_SELECIONADO: TcxGridDBColumn
            DataBinding.FieldName = 'IN_SELECIONADO'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ImmediatePost = True
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            Width = 20
            IsCaptionAssigned = True
          end
          object cxGrid1DBTableView1NR_ADICAO: TcxGridDBColumn
            Caption = 'Adi'#231#227'o'
            DataBinding.FieldName = 'NR_ADICAO'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 50
          end
          object cxGrid1DBTableView1NR_ITEM: TcxGridDBColumn
            Caption = 'Item'
            DataBinding.FieldName = 'NR_ITEM'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 50
          end
          object cxGrid1DBTableView1CD_MERCADORIA: TcxGridDBColumn
            Caption = 'Mercadoria'
            DataBinding.FieldName = 'CD_MERCADORIA'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            Width = 125
          end
          object cxGrid1DBTableView1QT_MERC_UN_COMERC: TcxGridDBColumn
            Caption = 'Quantidade Dispon'#237'vel'
            DataBinding.FieldName = 'QT_MERC_UN_COMERC'
            Width = 150
          end
          object cxGrid1DBTableView1PL_MERCADORIA: TcxGridDBColumn
            Caption = 'Peso Dispon'#237'vel'
            DataBinding.FieldName = 'PL_MERCADORIA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.AssignedValues.EditFormat = True
            Properties.DecimalPlaces = 3
            Properties.DisplayFormat = '0.000'
            Properties.ReadOnly = True
            Visible = False
            Width = 105
          end
          object cxGrid1DBTableView1QT_USAR: TcxGridDBColumn
            Caption = 'Quantidade a Usar'
            DataBinding.FieldName = 'QT_USAR'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.AssignedValues.EditFormat = True
            Properties.DecimalPlaces = 3
            Properties.DisplayFormat = '0.000'
            Width = 120
          end
          object cxGrid1DBTableView1NR_CONTAINER: TcxGridDBColumn
            Caption = 'Container'
            DataBinding.FieldName = 'NR_CONTAINER'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.ImmediatePost = True
            Properties.KeyFieldNames = 'NR_CNTR'
            Properties.ListColumns = <
              item
                FieldName = 'NR_CNTR'
              end>
            Properties.ListSource = dsProcessoCntr
            Width = 130
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Arquivos Gerados'
      object pnlArquivos: TPanel
        Left = 0
        Top = 0
        Width = 768
        Height = 292
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
  end
  object pnlOpcoes: TPanel
    Left = 0
    Top = 323
    Width = 768
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnCancelar: TBitBtn
      Left = 408
      Top = 8
      Width = 100
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 0
    end
    object btnVoltar: TBitBtn
      Left = 536
      Top = 8
      Width = 100
      Height = 25
      Caption = 'Voltar'
      Enabled = False
      TabOrder = 1
      OnClick = btnVoltarClick
    end
    object btnAvancar: TBitBtn
      Left = 664
      Top = 8
      Width = 100
      Height = 25
      Caption = 'Gerar'
      Default = True
      TabOrder = 2
      OnClick = btnAvancarClick
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 768
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lblTituloSombra: TLabel
      Left = 6
      Top = 6
      Width = 91
      Height = 20
      Caption = 'Nota Fiscal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblTitulo: TLabel
      Left = 4
      Top = 5
      Width = 91
      Height = 20
      Caption = 'Nota Fiscal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Bevel1: TBevel
      Left = 0
      Top = 29
      Width = 768
      Height = 2
      Align = alBottom
    end
  end
  object qryNfe: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM DBO.FN_NF_SAMSUNG_MAE(:NR_PROCESSO, :CD_CFOP)'
      'ORDER BY NR_LINHA')
    Left = 168
    Top = 95
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CFOP'
        ParamType = ptInput
      end>
    object qryNfeNR_LINHA: TAutoIncField
      FieldName = 'NR_LINHA'
    end
    object qryNfeNR_PROC_ID: TStringField
      FieldName = 'NR_PROC_ID'
      FixedChar = True
      Size = 15
    end
    object qryNfeTX_LINHA: TMemoField
      FieldName = 'TX_LINHA'
      BlobType = ftMemo
    end
  end
  object qryNfeContainer: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      
        'FROM DBO.FN_NF_SAMSUNG_FILHOTE(:NR_PROCESSO, :NR_ADICAO, :NR_ITE' +
        'M, :QT_USAR, :NR_CNTR)')
    Left = 240
    Top = 95
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'QT_USAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_CNTR'
        ParamType = ptInput
      end>
    object qryNfeContainerNR_LINHA: TAutoIncField
      FieldName = 'NR_LINHA'
    end
    object qryNfeContainerNR_PROC_ID: TStringField
      FieldName = 'NR_PROC_ID'
      FixedChar = True
      Size = 15
    end
    object qryNfeContainerNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qryNfeContainerNR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      FixedChar = True
      Size = 15
    end
    object qryNfeContainerTX_LINHA: TMemoField
      FieldName = 'TX_LINHA'
      BlobType = ftMemo
    end
  end
  object qryProcesso: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_CLIENTE, CD_GRUPO, IN_CANCELADO'
      'FROM TPROCESSO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 416
    Top = 103
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryProcessoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryProcessoCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TPROCESSO.CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qryProcessoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TPROCESSO.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qryProcessoIN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'DBBROKER.TPROCESSO.IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
  end
  object qryItensDI: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_ADICAO, NR_ITEM, CD_MERCADORIA, PL_MERCADORIA, QT_MERC' +
        '_UN_COMERC, '#39'              '#39' AS NR_CONTAINER, CONVERT(FLOAT, 0) ' +
        'AS QT_USAR, 0 AS IN_SELECIONADO'
      'FROM TDETALHE_MERCADORIA'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    UpdateObject = updItensDI
    Left = 344
    Top = 167
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = '0101IM-001000-14'
      end>
    object qryItensDINR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryItensDINR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryItensDICD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object qryItensDIPL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
    end
    object qryItensDIQT_MERC_UN_COMERC: TFloatField
      FieldName = 'QT_MERC_UN_COMERC'
    end
    object qryItensDINR_CONTAINER: TStringField
      FieldName = 'NR_CONTAINER'
      OnChange = qryItensDINR_CONTAINERChange
      Size = 15
    end
    object qryItensDIQT_USAR: TFloatField
      FieldName = 'QT_USAR'
      OnChange = qryItensDINR_CONTAINERChange
    end
    object qryItensDIIN_SELECIONADO: TIntegerField
      FieldName = 'IN_SELECIONADO'
      OnChange = qryItensDIIN_SELECIONADOChange
    end
  end
  object qryProcessoCntr: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_CNTR'
      'FROM TPROCESSO_CNTR'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 512
    Top = 167
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryProcessoCntrNR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      Origin = 'DBBROKER.TPROCESSO_CNTR.NR_CNTR'
      FixedChar = True
    end
  end
  object updItensDI: TUpdateSQL
    ModifySQL.Strings = (
      'update TDETALHE_MERCADORIA'
      'set'
      '  NR_ADICAO = :NR_ADICAO,'
      '  NR_ITEM = :NR_ITEM,'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  PL_MERCADORIA = :PL_MERCADORIA,'
      '  QT_MERC_UN_COMERC = :QT_MERC_UN_COMERC,'
      '  NR_CONTAINER = :NR_CONTAINER,'
      '  QT_USAR = :QT_USAR,'
      '  IN_SELECIONADO = :IN_SELECIONADO'
      'where'
      '  NR_ADICAO = :OLD_NR_ADICAO and'
      '  NR_ITEM = :OLD_NR_ITEM')
    InsertSQL.Strings = (
      'insert into TDETALHE_MERCADORIA'
      
        '  (NR_ADICAO, NR_ITEM, CD_MERCADORIA, PL_MERCADORIA, QT_MERC_UN_' +
        'COMERC, '
      '   NR_CONTAINER, QT_USAR, IN_SELECIONADO)'
      'values'
      
        '  (:NR_ADICAO, :NR_ITEM, :CD_MERCADORIA, :PL_MERCADORIA, :QT_MER' +
        'C_UN_COMERC, '
      '   :NR_CONTAINER, :QT_USAR, :IN_SELECIONADO)')
    DeleteSQL.Strings = (
      'delete from TDETALHE_MERCADORIA'
      'where'
      '  NR_ADICAO = :OLD_NR_ADICAO and'
      '  NR_ITEM = :OLD_NR_ITEM')
    Left = 344
    Top = 199
  end
  object dsItensDI: TDataSource
    DataSet = qryItensDI
    Left = 344
    Top = 135
  end
  object dsProcessoCntr: TDataSource
    DataSet = qryProcessoCntr
    Left = 512
    Top = 135
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 48
    Top = 112
    PixelsPerInch = 96
    object cxsHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
end

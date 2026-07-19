object frmEtapaProdutoEvento: TfrmEtapaProdutoEvento
  Left = 192
  Top = 103
  Width = 928
  Height = 480
  Caption = 'Etapa de Eventos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlOpcoes: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 43
    Align = alTop
    TabOrder = 0
    object btnIncluir: TSpeedButton
      Left = 3
      Top = 2
      Width = 35
      Height = 39
      Hint = 'Novo'
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
      Left = 38
      Top = 2
      Width = 35
      Height = 39
      Hint = 'Salvar'
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
      Left = 73
      Top = 2
      Width = 35
      Height = 39
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
      OnClick = btnCancelarClick
    end
    object btnExcluir: TSpeedButton
      Left = 108
      Top = 2
      Width = 35
      Height = 39
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
      OnClick = btnExcluirClick
    end
  end
  object pgcEtapaEvento: TPageControl
    Left = 0
    Top = 43
    Width = 920
    Height = 410
    ActivePage = tbsEventos
    Align = alClient
    TabOrder = 1
    OnChange = pgcEtapaEventoChange
    OnChanging = pgcEtapaEventoChanging
    object tbsEtapas: TTabSheet
      Caption = 'Etapas'
      object dbgrdEtapaProduto: TDBGrid
        Left = 0
        Top = 82
        Width = 912
        Height = 300
        Align = alClient
        DataSource = dsEtapaProduto
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
            FieldName = 'CD_ETAPA'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ETAPA'
            Title.Caption = 'Nome'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_PRODUTO'
            Title.Caption = 'Produto'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_PRODUTO'
            Title.Caption = 'Nome Produto'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 200
            Visible = True
          end>
      end
      object pnlDadosBasicos: TPanel
        Left = 0
        Top = 0
        Width = 912
        Height = 82
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 11
          Width = 44
          Height = 13
          Caption = 'C'#243'digo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 136
          Top = 11
          Width = 37
          Height = 13
          Caption = 'Nome:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 35
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
        object btnProduto: TSpeedButton
          Left = 345
          Top = 32
          Width = 22
          Height = 21
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
          OnClick = btnProdutoClick
        end
        object dbchkIN_ATIVO: TDBCheckBox
          Left = 8
          Top = 59
          Width = 51
          Height = 17
          Caption = 'Ativo'
          DataField = 'IN_ATIVO'
          DataSource = dsEtapaProduto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbedtCD_ETAPA: TDBEdit
          Left = 64
          Top = 8
          Width = 62
          Height = 21
          Color = clBtnFace
          DataField = 'CD_ETAPA'
          DataSource = dsEtapaProduto
          ReadOnly = True
          TabOrder = 1
        end
        object dbedtNM_ETAPA: TDBEdit
          Left = 176
          Top = 8
          Width = 409
          Height = 21
          DataField = 'NM_ETAPA'
          DataSource = dsEtapaProduto
          TabOrder = 2
        end
        object dbedtCD_PRODUTO: TDBEdit
          Left = 64
          Top = 32
          Width = 25
          Height = 21
          DataField = 'CD_PRODUTO'
          DataSource = dsEtapaProduto
          TabOrder = 3
        end
        object dbedtNM_PRODUTO: TDBEdit
          Left = 90
          Top = 32
          Width = 255
          Height = 21
          DataField = 'NM_PRODUTO'
          DataSource = dsEtapaProduto
          ReadOnly = True
          TabOrder = 4
        end
      end
    end
    object tbsEventos: TTabSheet
      Caption = 'Eventos'
      ImageIndex = 2
      object dbgrdEtapaProdutoEvento: TDBGrid
        Left = 0
        Top = 0
        Width = 912
        Height = 382
        Align = alClient
        DataSource = dsEtapaProdutoEvento
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_EVENTO'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_EVENTO'
            Title.Caption = 'Nome'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 413
            Visible = True
          end>
      end
    end
  end
  object dsEtapaProduto: TDataSource
    DataSet = qryEtapaProduto
    OnStateChange = dsEtapaProdutoStateChange
    Left = 404
    Top = 105
  end
  object qryEtapaProduto: TQuery
    CachedUpdates = True
    AfterPost = qryEtapaProdutoAfterPost
    AfterDelete = qryEtapaProdutoAfterPost
    OnNewRecord = qryEtapaProdutoNewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TETAPA_PRODUTO'
      'ORDER BY CD_ETAPA')
    UpdateObject = updEtapaProduto
    Left = 404
    Top = 137
    object qryEtapaProdutoCD_ETAPA: TAutoIncField
      FieldName = 'CD_ETAPA'
      Origin = 'DBBROKER.TETAPA_PRODUTO.CD_ETAPA'
    end
    object qryEtapaProdutoNM_ETAPA: TStringField
      FieldName = 'NM_ETAPA'
      Origin = 'DBBROKER.TETAPA_PRODUTO.NM_ETAPA'
      FixedChar = True
      Size = 255
    end
    object qryEtapaProdutoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TETAPA_PRODUTO.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryEtapaProdutoIN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TETAPA_PRODUTO.CD_ETAPA'
      FixedChar = True
      Size = 1
    end
    object qryEtapaProdutoNM_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_PRODUTO'
      LookupDataSet = qryProduto
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 100
      Lookup = True
    end
  end
  object updEtapaProduto: TUpdateSQL
    ModifySQL.Strings = (
      'update TETAPA_PRODUTO'
      'set'
      '  NM_ETAPA = :NM_ETAPA,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  IN_ATIVO = :IN_ATIVO'
      'where'
      '  CD_ETAPA = :OLD_CD_ETAPA')
    InsertSQL.Strings = (
      'insert into TETAPA_PRODUTO'
      '  (NM_ETAPA, CD_PRODUTO, IN_ATIVO)'
      'values'
      '  (:NM_ETAPA, :CD_PRODUTO, :IN_ATIVO)')
    DeleteSQL.Strings = (
      'delete from TETAPA_PRODUTO'
      'where'
      '  CD_ETAPA = :OLD_CD_ETAPA')
    Left = 404
    Top = 169
  end
  object qryProduto: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO, AP_PRODUTO'
      'FROM TPRODUTO'
      'WHERE IN_ATIVO = '#39'1'#39
      'ORDER BY CD_PRODUTO')
    Left = 356
    Top = 137
    object qryProdutoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TPRODUTO.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryProdutoNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'DBBROKER.TPRODUTO.NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qryProdutoAP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Origin = 'DBBROKER.TPRODUTO.AP_PRODUTO'
      FixedChar = True
      Size = 10
    end
  end
  object dsEtapaProdutoEvento: TDataSource
    DataSet = qryEtapaProdutoEvento
    OnStateChange = dsEtapaProdutoStateChange
    Left = 460
    Top = 105
  end
  object qryEtapaProdutoEvento: TQuery
    CachedUpdates = True
    AfterPost = qryEtapaProdutoEventoAfterPost
    AfterDelete = qryEtapaProdutoEventoAfterPost
    OnNewRecord = qryEtapaProdutoEventoNewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TETAPA_PRODUTO_EVENTO'
      'WHERE CD_ETAPA = :CD_ETAPA'
      'ORDER BY CD_EVENTO')
    UpdateObject = updEtapaProdutoEvento
    Left = 460
    Top = 137
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_ETAPA'
        ParamType = ptInput
      end>
    object qryEtapaProdutoEventoCD_ETAPA: TIntegerField
      FieldName = 'CD_ETAPA'
      Origin = 'DBBROKER.TETAPA_PRODUTO_EVENTO.CD_ETAPA'
    end
    object qryEtapaProdutoEventoCD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'DBBROKER.TETAPA_PRODUTO_EVENTO.CD_EVENTO'
      FixedChar = True
      Size = 3
    end
    object qryEtapaProdutoEventoNM_EVENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_EVENTO'
      LookupDataSet = qryEvento
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EVENTO'
      Size = 100
      Lookup = True
    end
    object qryEtapaProdutoEventoCD_NM_EVENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'CD_NM_EVENTO'
      LookupDataSet = qryEvento
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'CD_NM_EVENTO'
      KeyFields = 'CD_EVENTO'
      Size = 100
      Lookup = True
    end
  end
  object updEtapaProdutoEvento: TUpdateSQL
    ModifySQL.Strings = (
      'update TETAPA_PRODUTO_EVENTO'
      'set'
      '  CD_ETAPA = :CD_ETAPA,'
      '  CD_EVENTO = :CD_EVENTO'
      'where'
      '  CD_ETAPA = :OLD_CD_ETAPA and'
      '  CD_EVENTO = :OLD_CD_EVENTO')
    InsertSQL.Strings = (
      'insert into TETAPA_PRODUTO_EVENTO'
      '  (CD_ETAPA, CD_EVENTO)'
      'values'
      '  (:CD_ETAPA, :CD_EVENTO)')
    DeleteSQL.Strings = (
      'delete from TETAPA_PRODUTO_EVENTO'
      'where'
      '  CD_ETAPA = :OLD_CD_ETAPA and'
      '  CD_EVENTO = :OLD_CD_EVENTO')
    Left = 460
    Top = 169
  end
  object qryEvento: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_EVENTO, NM_EVENTO, CD_EVENTO + '#39' - '#39' + NM_EVENTO AS CD' +
        '_NM_EVENTO'
      'FROM TEVENTO'
      'WHERE IN_ATIVO = '#39'1'#39
      'ORDER BY CD_EVENTO')
    Left = 356
    Top = 169
    object qryEventoCD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'DBBROKER.TEVENTO.CD_EVENTO'
      FixedChar = True
      Size = 3
    end
    object qryEventoNM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      Origin = 'DBBROKER.TEVENTO.NM_EVENTO'
      FixedChar = True
      Size = 50
    end
    object qryEventoCD_NM_EVENTO: TStringField
      FieldName = 'CD_NM_EVENTO'
      Origin = 'DBBROKER.TEVENTO.CD_EVENTO'
      FixedChar = True
      Size = 56
    end
  end
end

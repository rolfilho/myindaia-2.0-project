object frmBidNestle: TfrmBidNestle
  Left = 275
  Top = 226
  Width = 1014
  Height = 512
  VertScrollBar.Position = 1
  Caption = 'Bid Nestl'#233
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = -1
    Width = 990
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label22: TLabel
      Left = 8
      Top = 9
      Width = 121
      Height = 13
      Caption = 'Pais de Destino Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 250
      Top = 9
      Width = 131
      Height = 13
      Caption = 'Local de Desembarque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 498
      Top = 9
      Width = 110
      Height = 13
      Caption = 'Local de Embarque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_salvar: TSpeedButton
      Left = 935
      Top = 8
      Width = 43
      Height = 48
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
      OnClick = btn_salvarClick
    end
    object btn_co_local_desemb_em: TSpeedButton
      Left = 408
      Top = 24
      Width = 23
      Height = 20
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
      OnClick = btn_co_local_desemb_emClick
    end
    object btn_co_pais_dest_em: TSpeedButton
      Left = 166
      Top = 24
      Width = 23
      Height = 20
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
      OnClick = btn_co_pais_dest_emClick
    end
    object btn_co_local_emb_em: TSpeedButton
      Left = 656
      Top = 24
      Width = 23
      Height = 20
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
      OnClick = btn_co_local_emb_emClick
    end
    object SpeedButton1: TSpeedButton
      Left = 880
      Top = 24
      Width = 23
      Height = 20
      Enabled = False
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
    end
    object Label1: TLabel
      Left = 721
      Top = 9
      Width = 41
      Height = 13
      Caption = 'Agente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbDestFinal: TDBEdit
      Left = 40
      Top = 23
      Width = 125
      Height = 21
      Color = clScrollBar
      DataField = 'DEST_NEST'
      DataSource = datm_abre_proc.ds_BID_Nestle
      TabOrder = 0
    end
    object dbCdDestFinal: TDBEdit
      Left = 8
      Top = 23
      Width = 33
      Height = 21
      Color = clScrollBar
      DataField = 'CD_DEST_NEST'
      DataSource = datm_abre_proc.ds_BID_Nestle
      TabOrder = 1
    end
    object dbCdLocalEmbarque: TDBEdit
      Left = 249
      Top = 23
      Width = 33
      Height = 21
      Color = clScrollBar
      DataField = 'CD_PORT_DISCHARGE'
      DataSource = datm_abre_proc.ds_BID_Nestle
      TabOrder = 2
    end
    object dbLocalEmbarque: TDBEdit
      Left = 282
      Top = 23
      Width = 125
      Height = 21
      Color = clScrollBar
      DataField = 'PORT_DISCHARGE'
      DataSource = datm_abre_proc.ds_BID_Nestle
      TabOrder = 3
    end
    object dbCdCity: TDBEdit
      Left = 497
      Top = 23
      Width = 33
      Height = 21
      Color = clScrollBar
      DataField = 'CD_ORIGIN_CITY'
      DataSource = datm_abre_proc.ds_BID_Nestle
      TabOrder = 4
    end
    object dbCity: TDBEdit
      Left = 530
      Top = 23
      Width = 125
      Height = 21
      Color = clScrollBar
      DataField = 'ORIGIN_CITY'
      DataSource = datm_abre_proc.ds_BID_Nestle
      TabOrder = 5
    end
    object dbCdCarrier: TDBEdit
      Left = 721
      Top = 23
      Width = 33
      Height = 21
      Color = clScrollBar
      DataField = 'CD_ORIGIN_CITY'
      DataSource = datm_abre_proc.ds_BID_Nestle
      TabOrder = 6
    end
    object dbCarrier: TDBEdit
      Left = 754
      Top = 23
      Width = 125
      Height = 21
      Color = clScrollBar
      DataField = 'ORIGIN_CITY'
      DataSource = datm_abre_proc.ds_BID_Nestle
      TabOrder = 7
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 64
    Width = 990
    Height = 423
    Align = alBottom
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = datm_abre_proc.ds_BID_Nestle
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ScrollBars = ssHorizontal
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1CD_CARRIER: TcxGridDBColumn
        DataBinding.FieldName = 'CD_CARRIER'
      end
      object cxGrid1DBTableView1CARRIER: TcxGridDBColumn
        Width = 68
        DataBinding.FieldName = 'CARRIER'
      end
      object cxGrid1DBTableView1COMMODITY: TcxGridDBColumn
        Width = 88
        DataBinding.FieldName = 'COMMODITY'
      end
      object cxGrid1DBTableView1AREA: TcxGridDBColumn
        Width = 59
        DataBinding.FieldName = 'AREA'
      end
      object cxGrid1DBTableView1UNIQUE_IDENTIFIER: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'UNIQUE_IDENTIFIER'
      end
      object cxGrid1DBTableView1ORIGIN_SERVICE: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'ORIGIN_SERVICE'
      end
      object cxGrid1DBTableView1DESTINATION_SERVICE: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'DESTINATION_SERVICE'
      end
      object cxGrid1DBTableView1ORIG_COUNTRY: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'ORIG_COUNTRY'
      end
      object cxGrid1DBTableView1DEST_COUNTRY: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'DEST_COUNTRY'
      end
      object cxGrid1DBTableView1ORIGIN_CITY: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'ORIGIN_CITY'
      end
      object cxGrid1DBTableView1DEST_CITY: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'DEST_CITY'
      end
      object cxGrid1DBTableView1PORT_LOAD: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'PORT_LOAD'
      end
      object cxGrid1DBTableView1PORT_DISCHARGE: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'PORT_DISCHARGE'
      end
      object cxGrid1DBTableView1EQUIPMENT: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'EQUIPMENT'
      end
      object cxGrid1DBTableView1TOTAL_PRICE: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'TOTAL_PRICE'
      end
      object cxGrid1DBTableView1PRICE_CURRENCY: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'PRICE_CURRENCY'
      end
      object cxGrid1DBTableView1BASE_RATE: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'BASE_RATE'
      end
      object cxGrid1DBTableView1BASE_RATE_CURRENCY: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'BASE_RATE_CURRENCY'
      end
      object cxGrid1DBTableView1TRANSIT_TIME: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'TRANSIT_TIME'
      end
      object cxGrid1DBTableView1DEST_NEST: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'DEST_NEST'
      end
      object cxGrid1DBTableView1CD_ORIG_NEST: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'CD_ORIG_NEST'
      end
      object cxGrid1DBTableView1ORIG_NEST: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'ORIG_NEST'
      end
      object cxGrid1DBTableView1PRODUCT: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'PRODUCT'
      end
      object cxGrid1DBTableView1SHIPPING_TERMS: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'SHIPPING_TERMS'
      end
      object cxGrid1DBTableView1TRAFFIC_TYPE: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'TRAFFIC_TYPE'
      end
      object cxGrid1DBTableView1CARRIER_AWARD: TcxGridDBColumn
        Width = 50
        DataBinding.FieldName = 'CARRIER_AWARD'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
end

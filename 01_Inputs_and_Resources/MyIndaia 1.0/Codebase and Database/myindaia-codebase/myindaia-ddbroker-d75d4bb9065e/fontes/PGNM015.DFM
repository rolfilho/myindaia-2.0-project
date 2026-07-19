object frm_devolucao_itens: Tfrm_devolucao_itens
  Left = 159
  Top = 108
  Width = 640
  Height = 480
  BorderIcons = [biSystemMenu, biHelp]
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  Menu = menu_cadastro
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 44
    Width = 629
    Height = 181
    DataSource = qry_itens_receb
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        FieldName = 'NR_RECEBIMENTO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 101
      end
      item
        Alignment = taCenter
        FieldName = 'NR_LANCAMENTO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
      end
      item
        Alignment = taCenter
        FieldName = 'CD_ITEM'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 59
      end
      item
        Alignment = taCenter
        FieldName = 'Look_nm_item'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 201
      end
      item
        FieldName = 'VL_RECEBIDO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 99
      end>
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 629
    Height = 41
    BevelOuter = bvLowered
    TabOrder = 1
    object btn_sair: TSpeedButton
      Left = 100
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Volta ao Menu Principal'
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
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_sairClick
    end
    object btn_novo: TSpeedButton
      Left = 8
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Cancelamento de Adiantamento'
      Enabled = False
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
        0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
        8888880FFFFFF008888888000000008888888888888888888888}
      Layout = blGlyphBottom
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_novoClick
    end
    object btn_cancelar: TSpeedButton
      Left = 44
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Cancelar Solicitação de Numerário'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00AAAAAAAAAAAA
        AAAA7777777777777777A99A88888888899A7997888888888997A99900000000
        999A7999BBBBBBBB9997AA999FFFFFF999AA7799977777799977AAA999FFFF99
        98AA7779997777999877AAA0999FF99908AA777B99977999B877AAA0F999999F
        08AA777B79999997B877AAA0FF9999FF08AA777B77999977B877AAA0FF9999FF
        0AAA777B77999977B777AAA0F99999900AAA777B7999999BB777AAA0999F0999
        AAAA777B9997B9997777AAA999FF0F999AAA77799977BF999777AA999FFF00A9
        99AA77999777BB799977A99900000AAA999A7999BBBBB7779997A99AAAAAAAAA
        A99A7997777777777997AAAAAAAAAAAAAAAA7777777777777777}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancelarClick
    end
  end
  object DBGrid2: TDBGrid
    Left = -1
    Top = 228
    Width = 629
    Height = 205
    DataSource = datm_devolucao.dsq_itens_devolucao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        FieldName = 'NR_DEVOLUCAO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 101
      end
      item
        Alignment = taCenter
        FieldName = 'NR_LANC_DEVOL'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
      end
      item
        Alignment = taCenter
        FieldName = 'CD_ITEM'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 59
      end
      item
        Alignment = taCenter
        FieldName = 'Look_nm_item'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 201
      end
      item
        FieldName = 'VL_DEVOLVIDO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
      end
      item
        Alignment = taCenter
        FieldName = 'Look_cancelado'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
      end>
  end
  object qry_itens_receb: TDataSource
    DataSet = qry_itens_receb_
    OnDataChange = qry_itens_recebDataChange
    Left = 556
    Top = 156
  end
  object qry_itens_receb_: TQuery
    DatabaseName = 'DBPROCESSO'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_RECEBIMENTO ,  NR_LANC_RECEB ,'
      ' NR_SOLICITACAO , NR_LANCAMENTO , CD_ITEM , '
      ' VL_SOLICITADO , VL_RECEBIDO , '
      ' IN_CANCELADO'
      'FROM TRECEBIMENTO_ITEM_RECEB TRECEBIMENTO_ITEM_RECEB'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {
      010001000B4E525F50524F434553534F00010C00303130313937303038313900
      0001}
    Left = 592
    Top = 156
    object qry_itens_receb_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_PROCESSO'
      Size = 11
    end
    object qry_itens_receb_NR_RECEBIMENTO: TStringField
      DisplayLabel = 'Recebimento'
      FieldName = 'NR_RECEBIMENTO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_RECEBIMENTO'
      Size = 6
    end
    object qry_itens_receb_NR_LANC_RECEB: TStringField
      FieldName = 'NR_LANC_RECEB'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_PROCESSO'
      Size = 6
    end
    object qry_itens_receb_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_SOLICITACAO'
      Size = 3
    end
    object qry_itens_receb_NR_LANCAMENTO: TStringField
      DisplayLabel = 'Lanç.'
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_LANCAMENTO'
      Size = 3
    end
    object qry_itens_receb_CD_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'CD_ITEM'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.CD_ITEM'
      Size = 3
    end
    object qry_itens_receb_Look_nm_item: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'Look_nm_item'
      LookupDataSet = datm_devolucao.qry_item_cd
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_itens_receb_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.VL_SOLICITADO'
    end
    object qry_itens_receb_VL_RECEBIDO: TFloatField
      DisplayLabel = 'Recebido'
      FieldName = 'VL_RECEBIDO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.VL_RECEBIDO'
      DisplayFormat = '#0,.00'
    end
    object qry_itens_receb_IN_CANCELADO: TBooleanField
      FieldName = 'IN_CANCELADO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.IN_CANCELADO'
    end
    object qry_itens_receb_look_cancelado: TStringField
      DisplayLabel = 'Cancelado'
      FieldName = 'look_cancelado'
      LookupDataSet = datm_devolucao.tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CANCELADO'
      Size = 3
      Lookup = True
    end
  end
  object menu_cadastro: TMainMenu
    Left = 288
    Top = 8
    object Itens1: TMenuItem
      Caption = '&Novo'
      OnClick = btn_novoClick
    end
    object Cancelar1: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_saida: TMenuItem
      Caption = '&Saída'
      RadioItem = True
      OnClick = btn_sairClick
    end
  end
  object qry_itens_solinum_: TQuery
    OnCalcFields = qry_itens_solinum_CalcFields
    DatabaseName = 'DBPROCESSO'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_SOLICITACAO , '
      ' NR_LANCAMENTO , CD_ITEM , NR_PRIORIDADE , '
      ' CD_TIPO_CALCULO , TP_SOLIC_INFORM , '
      ' VL_ITEM_CALCULADO , VL_SOLICITADO , '
      ' CD_STATUS , VL_RECEBIDO, VL_UTILIZADO'
      'FROM TNUMERARIO_ITEM_SOLIC TNUMERARIO_ITEM_SOLIC'
      ' WHERE ( NR_PROCESSO = :NR_PROCESSO ) AND'
      ' ( NR_SOLICITACAO = :NR_SOLICITACAO ) AND'
      ' ( NR_LANCAMENTO = :NR_LANCAMENTO )')
    Params.Data = {
      010003000B4E525F50524F434553534F00010200300000000E4E525F534F4C49
      4349544143414F00010200300000000D4E525F4C414E43414D454E544F000102
      0030000000}
    Left = 592
    Top = 188
    object qry_itens_solinum_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
      Size = 11
    end
    object qry_itens_solinum_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_SOLICITACAO'
      Size = 3
    end
    object qry_itens_solinum_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_LANCAMENTO'
      Size = 3
    end
    object qry_itens_solinum_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_ITEM'
      Size = 3
    end
    object qry_itens_solinum_NR_PRIORIDADE: TIntegerField
      FieldName = 'NR_PRIORIDADE'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PRIORIDADE'
    end
    object qry_itens_solinum_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_TIPO_CALCULO'
      Size = 3
    end
    object qry_itens_solinum_TP_SOLIC_INFORM: TStringField
      FieldName = 'TP_SOLIC_INFORM'
      Origin = 'TNUMERARIO_ITEM_SOLIC.TP_SOLIC_INFORM'
      Size = 3
    end
    object qry_itens_solinum_VL_ITEM_CALCULADO: TFloatField
      FieldName = 'VL_ITEM_CALCULADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_ITEM_CALCULADO'
    end
    object qry_itens_solinum_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_SOLICITADO'
    end
    object qry_itens_solinum_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TNUMERARIO_ITEM_SOLIC.CD_STATUS'
      Size = 1
    end
    object qry_itens_solinum_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.NR_PROCESSO'
    end
    object qry_itens_solinum_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_UTILIZADO'
    end
    object qry_itens_solinum_Look_vl_Saldo: TFloatField
      FieldName = 'Look_vl_Saldo'
      Calculated = True
    end
  end
  object dsq_itens_solinum: TDataSource
    DataSet = qry_itens_solinum_
    Left = 556
    Top = 188
  end
  object sp_cancela_item_devolucao_: TStoredProc
    DatabaseName = 'DBPROCESSO'
    StoredProcName = 'dbo.sp_cancela_item_devolucao;1'
    Params.Data = {
      0100040006526573756C74040304000000000000000C406E725F70726F636573
      736F01010200300000000D406E725F6465766F6C7563616F0101020030000000
      0E406E725F6C616E635F6465766F6C0101020030000000}
    Left = 596
    Top = 8
  end
end

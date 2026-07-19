object frm_numerario_recebidos: Tfrm_numerario_recebidos
  Left = 141
  Top = 99
  Width = 640
  Height = 480
  BorderIcons = [biSystemMenu, biHelp]
  Caption = 'Recebimentos'
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
    Top = 240
    Width = 629
    Height = 193
    DataSource = dsq_itens_receb
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
        FieldName = 'NR_SOLICITACAO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 86
      end
      item
        Alignment = taCenter
        FieldName = 'NR_LANCAMENTO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 56
      end
      item
        Alignment = taCenter
        FieldName = 'CD_ITEM'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 56
      end
      item
        Alignment = taCenter
        FieldName = 'Look_nm_item'
        Title.Alignment = taCenter
        Title.Color = clBlack
      end
      item
        FieldName = 'VL_SOLICITADO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 110
      end
      item
        FieldName = 'VL_RECEBIDO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 98
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 44
    Width = 629
    Height = 193
    DataSource = qry_recebimento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
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
        Width = 86
      end
      item
        Alignment = taCenter
        FieldName = 'DT_RECEBIMENTO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 92
      end
      item
        FieldName = 'VL_RECEBIMENTO'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 103
      end
      item
        Alignment = taCenter
        FieldName = 'Look_ap_banco'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 137
      end
      item
        Alignment = taCenter
        FieldName = 'Look_ap_usuario'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 106
      end
      item
        Alignment = taCenter
        FieldName = 'Look_cancelado'
        Title.Alignment = taCenter
        Title.Color = clBlack
        Width = 67
      end>
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 629
    Height = 41
    BevelOuter = bvLowered
    TabOrder = 2
    object btn_sair: TSpeedButton
      Left = 60
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
    object btn_cancelar: TSpeedButton
      Left = 12
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Cancelamento de Adiantamento'
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
  object qry_recebimento: TDataSource
    DataSet = qry_recebimento_
    OnDataChange = qry_recebimentoDataChange
    Left = 556
    Top = 132
  end
  object qry_recebimento_: TQuery
    OnCalcFields = qry_recebimento_CalcFields
    DatabaseName = 'DBPROCESSO'
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_RECEBIMENTO , '
      ' CD_CLIENTE , DT_RECEBIMENTO , CD_USUARIO , '
      ' CD_BANCO , VL_RECEBIMENTO, IN_CANCELADO'
      'FROM TRECEBIMENTO TRECEBIMENTO'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_RECEBIMENTO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 592
    Top = 132
    object qry_recebimento_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TADIANTAMENTO.NR_PROCESSO'
      Size = 11
    end
    object qry_recebimento_NR_RECEBIMENTO: TStringField
      DisplayLabel = 'Recebimento'
      FieldName = 'NR_RECEBIMENTO'
      Origin = 'TRECEBIMENTO.NR_PROCESSO'
      Size = 3
    end
    object qry_recebimento_DT_RECEBIMENTO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_RECEBIMENTO'
      Origin = 'TRECEBIMENTO.NR_RECEBIMENTO'
    end
    object qry_recebimento_VL_RECEBIMENTO: TFloatField
      DisplayLabel = 'Recebido'
      FieldName = 'VL_RECEBIMENTO'
      Origin = 'TRECEBIMENTO.CD_CLIENTE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_recebimento_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TADIANTAMENTO.CD_CLIENTE'
      Size = 5
    end
    object qry_recebimento_CD_BANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'CD_BANCO'
      Origin = 'TADIANTAMENTO.CD_BANCO'
      Size = 3
    end
    object qry_recebimento_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TADIANTAMENTO.NR_PROCESSO'
      Size = 4
    end
    object qry_recebimento_IN_CANCELADO: TBooleanField
      FieldName = 'IN_CANCELADO'
      Origin = 'TRECEBIMENTO.DT_RECEBIMENTO'
    end
    object qry_recebimento_Look_ap_banco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'Look_ap_banco'
      LookupDataSet = tbl_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'AP_BANCO'
      KeyFields = 'CD_BANCO'
      Lookup = True
    end
    object qry_recebimento_Look_ap_usuario: TStringField
      DisplayLabel = 'Usuário'
      FieldName = 'Look_ap_usuario'
      LookupDataSet = tbl_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 15
      Lookup = True
    end
    object qry_recebimento_Look_cancelado: TStringField
      DisplayLabel = 'Cancelado'
      FieldName = 'Look_cancelado'
      Size = 3
      Calculated = True
    end
  end
  object dsq_itens_receb: TDataSource
    DataSet = qry_itens_receb_
    Left = 556
    Top = 364
  end
  object qry_itens_receb_: TQuery
    DatabaseName = 'DBPROCESSO'
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_RECEBIMENTO , '
      ' NR_SOLICITACAO , NR_LANCAMENTO , CD_ITEM , '
      ' VL_SOLICITADO , VL_RECEBIDO'
      'FROM TRECEBIMENTO_ITEM_RECEB TRECEBIMENTO_ITEM_RECEB'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      ' NR_RECEBIMENTO = :NR_RECEBIMENTO')
    Params.Data = {
      010002000B4E525F50524F434553534F00010200300000000E4E525F52454345
      42494D454E544F0001020030000000}
    Left = 592
    Top = 364
    object qry_itens_receb_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TADIANTAMENTO_ITEM_RECEB.NR_PROCESSO'
      Size = 11
    end
    object qry_itens_receb_NR_RECEBIMENTO: TStringField
      FieldName = 'NR_RECEBIMENTO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.NR_PROCESSO'
      Size = 6
    end
    object qry_itens_receb_NR_SOLICITACAO: TStringField
      DisplayLabel = 'Solicitacao'
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TADIANTAMENTO_ITEM_RECEB.NR_SOLICITACAO'
      Size = 3
    end
    object qry_itens_receb_NR_LANCAMENTO: TStringField
      DisplayLabel = 'Lançto.'
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TADIANTAMENTO_ITEM_RECEB.NR_LANCAMENTO'
      Size = 3
    end
    object qry_itens_receb_CD_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'CD_ITEM'
      Origin = 'TADIANTAMENTO_ITEM_RECEB.CD_ITEM'
      Size = 3
    end
    object qry_itens_receb_VL_SOLICITADO: TFloatField
      DisplayLabel = 'Saldo Pendente'
      FieldName = 'VL_SOLICITADO'
      Origin = 'TADIANTAMENTO_ITEM_RECEB.VL_SOLICITADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_receb_VL_RECEBIDO: TFloatField
      DisplayLabel = 'Recebido'
      FieldName = 'VL_RECEBIDO'
      Origin = 'TADIANTAMENTO_ITEM_RECEB.VL_RECEBIDO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_receb_Look_nm_item: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'Look_nm_item'
      LookupDataSet = qry_item_cd
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
  end
  object menu_cadastro: TMainMenu
    Left = 596
    Top = 8
    object Itens1: TMenuItem
      Caption = '&Cancelar'
    end
    object mi_saida: TMenuItem
      Caption = '&Saída'
      RadioItem = True
    end
  end
  object ds_banco: TDataSource
    DataSet = tbl_banco_
    Left = 556
    Top = 196
  end
  object tbl_banco_: TTable
    DatabaseName = 'DBCAD'
    TableName = 'TBANCO'
    Left = 592
    Top = 196
    object tbl_banco_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Required = True
      Size = 3
    end
    object tbl_banco_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Required = True
      Size = 40
    end
    object tbl_banco_AP_BANCO: TStringField
      FieldName = 'AP_BANCO'
      Size = 10
    end
    object tbl_banco_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Size = 10
    end
    object tbl_banco_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Size = 5
    end
    object tbl_banco_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Size = 8
    end
  end
  object ds_usuario: TDataSource
    DataSet = tbl_usuario_
    Left = 556
    Top = 164
  end
  object tbl_usuario_: TTable
    DatabaseName = 'DBTABGSM'
    TableName = 'TUSUARIO'
    Left = 592
    Top = 164
    object tbl_usuario_CD_USUARIO: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object tbl_usuario_AP_USUARIO: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_USUARIO'
      Size = 15
    end
    object tbl_usuario_NM_USUARIO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_USUARIO'
      Size = 50
    end
    object tbl_usuario_CD_SENHA: TStringField
      FieldName = 'CD_SENHA'
      Size = 10
    end
    object tbl_usuario_CD_UNID_NEG: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object tbl_usuario_CD_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object tbl_usuario_CD_CARGO: TStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CD_CARGO'
      Size = 3
    end
    object tbl_usuario_IN_ATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object dsq_item_cd: TDataSource
    DataSet = qry_item_cd
    Left = 556
    Top = 396
  end
  object qry_item_cd: TQuery
    DatabaseName = 'DBCAD'
    SQL.Strings = (
      
        'SELECT CD_ITEM , NM_ITEM , CD_TIPO_ITEM, NR_PRIORIDADE, CD_TIPO_' +
        'LANC_FAT'
      'FROM TITEM TITEM'
      'WHERE (CD_TIPO_ITEM = '#39'D'#39') OR (CD_TIPO_ITEM = '#39'R'#39' ) '
      'ORDER BY CD_ITEM')
    Left = 592
    Top = 396
    object qry_item_cdCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_cdNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object qry_item_cdCD_TIPO_ITEM: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Origin = 'TITEM.CD_TIPO_ITEM'
      Size = 1
    end
    object qry_item_cdNR_PRIORIDADE: TIntegerField
      FieldName = 'NR_PRIORIDADE'
      Origin = 'TITEM.CD_ITEM'
    end
    object qry_item_cdCD_TIPO_LANC_FAT: TStringField
      FieldName = 'CD_TIPO_LANC_FAT'
      Origin = 'TITEM.CD_ITEM'
      Size = 1
    end
  end
  object sp_cancela_recebimento_: TStoredProc
    DatabaseName = 'DBPROCESSO'
    StoredProcName = 'dbo.sp_cancela_recebimento;1'
    Params.Data = {
      0100040006526573756C74040304000000000000000C406E725F70726F636573
      736F01010200300000000F406E725F7265636562696D656E746F010102003000
      00000B4063645F7573756172696F0101020030000000}
    Left = 296
    Top = 336
  end
end

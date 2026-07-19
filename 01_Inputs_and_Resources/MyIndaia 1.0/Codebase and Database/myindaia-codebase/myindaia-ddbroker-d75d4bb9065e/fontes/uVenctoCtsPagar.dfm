object frm_ctaapagar_vencto: Tfrm_ctaapagar_vencto
  Left = 409
  Top = 76
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Vencimentos'
  ClientHeight = 563
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -8
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Shape6: TShape
    Left = 0
    Top = 0
    Width = 603
    Height = 18
    Align = alTop
    Brush.Color = clSilver
    Pen.Color = clGray
    Pen.Style = psClear
  end
  object Label19: TLabel
    Left = 4
    Top = 3
    Width = 73
    Height = 13
    Caption = 'Vencimentos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Shape1: TShape
    Left = 0
    Top = 262
    Width = 603
    Height = 18
    Align = alTop
    Brush.Color = clSilver
    Pen.Color = clGray
    Pen.Style = psClear
  end
  object Label3: TLabel
    Left = 4
    Top = 265
    Width = 76
    Height = 13
    Caption = 'Lan'#231'amentos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 18
    Width = 603
    Height = 192
    Align = alTop
    DataSource = datm_ctaapagar_vencto.ds_ctaapagar_vencto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -8
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NR_CTAAPAGAR'
        Title.Caption = 'Lan'#231'amento'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -8
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VENCTO'
        Title.Caption = 'Vencimento'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -8
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 123
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 210
    Width = 603
    Height = 52
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 98
      Top = 7
      Width = 67
      Height = 13
      Caption = 'Vencimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 7
      Width = 70
      Height = 13
      Caption = 'Lan'#231'amento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbedt_dt_vencto: TDBEdit
      Left = 98
      Top = 20
      Width = 90
      Height = 21
      DataField = 'DT_VENCTO'
      DataSource = datm_ctaapagar_vencto.ds_ctaapagar_vencto
      TabOrder = 0
    end
    object dbedt_nr_lanc: TDBEdit
      Left = 10
      Top = 20
      Width = 70
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'NR_CTAAPAGAR'
      DataSource = datm_ctaapagar_vencto.ds_ctaapagar_vencto
      ReadOnly = True
      TabOrder = 1
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 280
    Width = 603
    Height = 138
    Align = alClient
    DataSource = DtsLancamentos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -8
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NR_CTAAPAGAR'
        Title.Caption = 'Lan'#231'amento'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -8
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CD_CT_CONTABIL'
        Title.Caption = 'Nr Ct Contabil'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -8
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LookUpNM_ContaContabil'
        Title.Caption = 'Conta Cont'#225'bil'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -8
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CD_CT_CUSTO'
        Title.Caption = 'Centro de Custo'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -8
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_LANCAMENTO'
        Title.Caption = 'Valor'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -8
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 418
    Width = 603
    Height = 95
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    object Shape2: TShape
      Left = 455
      Top = 21
      Width = 131
      Height = 56
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label4: TLabel
      Left = 309
      Top = 49
      Width = 30
      Height = 13
      Caption = 'Valor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 11
      Top = 8
      Width = 70
      Height = 13
      Caption = 'Lan'#231'amento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 472
      Top = 30
      Width = 95
      Height = 13
      Caption = 'Valor Dispon'#237'vel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 93
      Top = 8
      Width = 101
      Height = 13
      Caption = 'Nr Conta Contabil'
      FocusControl = dbedt_cd_ct_contabil
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_ContaContabil: TSpeedButton
      Left = 377
      Top = 22
      Width = 23
      Height = 22
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
      OnClick = btn_ContaContabilClick
    end
    object lbl_cd_ct_custo: TLabel
      Left = 11
      Top = 49
      Width = 38
      Height = 13
      Caption = 'Rateio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_ct_custo: TSpeedButton
      Left = 272
      Top = 61
      Width = 25
      Height = 22
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
      OnClick = btn_co_ct_custoClick
    end
    object EditValor: TDBEdit
      Left = 310
      Top = 62
      Width = 90
      Height = 21
      DataField = 'VL_LANCAMENTO'
      DataSource = DtsLancamentos
      TabOrder = 6
      OnChange = EditValorChange
      OnExit = EditValorExit
      OnKeyDown = EditValorKeyDown
    end
    object DBEdit2: TDBEdit
      Left = 11
      Top = 22
      Width = 70
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'NR_CTAAPAGAR'
      DataSource = DtsLancamentos
      ReadOnly = True
      TabOrder = 0
    end
    object EditDisponivel: TEdit
      Left = 473
      Top = 44
      Width = 96
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 199
      Top = 22
      Width = 177
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object dbedt_cd_ct_contabil: TDBEdit
      Left = 93
      Top = 22
      Width = 107
      Height = 21
      DataField = 'CD_CT_CONTABIL'
      DataSource = DtsLancamentos
      TabOrder = 2
      OnChange = btn_ContaContabilClick
    end
    object dbedt_nm_rateio: TEdit
      Left = 67
      Top = 62
      Width = 204
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 5
    end
    object dbedt_cd_rateio: TDBEdit
      Left = 11
      Top = 62
      Width = 57
      Height = 21
      DataField = 'CD_RATEIO'
      DataSource = DtsLancamentos
      TabOrder = 4
      OnChange = btn_co_ct_custoClick
      OnExit = dbedt_cd_rateioExit
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 513
    Width = 603
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object btnConfirma: TBitBtn
      Left = 478
      Top = 9
      Width = 119
      Height = 35
      Caption = 'Salva e Finaliza'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnConfirmaClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object SqlLancamentos: TQuery
    AfterOpen = SqlLancamentosAfterOpen
    BeforeClose = SqlLancamentosBeforeClose
    AfterInsert = SqlLancamentosAfterInsert
    AfterEdit = SqlLancamentosAfterEdit
    AfterPost = SqlLancamentosAfterPost
    BeforeScroll = SqlLancamentosBeforeScroll
    AfterScroll = SqlLancamentosAfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TCTAAPAGAR_LANC'
      'WHERE '
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'DT_CTAAPAGAR = :DT_CTAAPAGAR AND'
      'NR_CTAAPAGAR = :NR_CTAAPAGAR '
      ' '
      '')
    Left = 247
    Top = 323
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_CTAAPAGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_CTAAPAGAR'
        ParamType = ptUnknown
      end>
    object SqlLancamentosDT_CTAAPAGAR: TDateTimeField
      FieldName = 'DT_CTAAPAGAR'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.DT_CTAAPAGAR'
    end
    object SqlLancamentosNR_CTAAPAGAR: TStringField
      FieldName = 'NR_CTAAPAGAR'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.NR_CTAAPAGAR'
      FixedChar = True
      Size = 3
    end
    object SqlLancamentosCODIGO: TAutoIncField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CODIGO'
    end
    object SqlLancamentosCD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_CT_CONTABIL'
      FixedChar = True
      Size = 40
    end
    object SqlLancamentosCD_FILIAL: TStringField
      FieldName = 'CD_FILIAL'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_FILIAL'
      FixedChar = True
      Size = 2
    end
    object SqlLancamentosCD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_CT_CUSTO'
      FixedChar = True
      Size = 25
    end
    object SqlLancamentosVL_LANCAMENTO: TFloatField
      FieldName = 'VL_LANCAMENTO'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.VL_LANCAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object SqlLancamentosCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object SqlLancamentosCD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_ACESSO'
      FixedChar = True
      Size = 1
    end
    object SqlLancamentosCD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_AUX'
      FixedChar = True
      Size = 3
    end
    object SqlLancamentosCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object SqlLancamentosNM_HISTORICO: TMemoField
      FieldName = 'NM_HISTORICO'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.NM_HISTORICO'
      BlobType = ftMemo
    end
    object SqlLancamentosNR_LANC_CAIXA: TStringField
      FieldName = 'NR_LANC_CAIXA'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.NR_LANC_CAIXA'
      FixedChar = True
      Size = 6
    end
    object SqlLancamentosLookUpNM_ContaContabil: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUpNM_ContaContabil'
      LookupDataSet = SqlContaContabil
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      LookupCache = True
      Size = 40
      Lookup = True
    end
    object SqlLancamentosDT_MOVIMENTO_CAIXA: TDateTimeField
      FieldName = 'DT_MOVIMENTO_CAIXA'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.DT_MOVIMENTO_CAIXA'
    end
    object SqlLancamentosCD_RATEIO: TStringField
      FieldName = 'CD_RATEIO'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_RATEIO'
      FixedChar = True
      Size = 4
    end
  end
  object DtsLancamentos: TDataSource
    DataSet = SqlLancamentos
    Left = 260
    Top = 352
  end
  object SqlContaContabil: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select * from TCT_CONTABIL')
    Left = 355
    Top = 354
  end
end

object frm_integra_nota_basf: Tfrm_integra_nota_basf
  Left = 397
  Top = 152
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gera'#231#227'o de Nota Fiscal'
  ClientHeight = 520
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object memoNotaFilhote: TMemo
    Left = 112
    Top = 60
    Width = 425
    Height = 42
    TabOrder = 3
    Visible = False
    WordWrap = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 50
    Width = 740
    Height = 359
    DataSource = ds_di_nota_
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object pnlFilhote: TPanel
    Left = 104
    Top = 71
    Width = 533
    Height = 316
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 1
    Visible = False
    DesignSize = (
      533
      316)
    object shp3: TShape
      Left = 2
      Top = 2
      Width = 529
      Height = 312
      Align = alClient
      Brush.Style = bsClear
      Pen.Color = clNavy
    end
    object Shape2: TShape
      Left = 5
      Top = 263
      Width = 518
      Height = 49
      Brush.Color = clBtnFace
      Pen.Color = clTeal
    end
    object shpTopoFilhote: TShape
      Left = 6
      Top = 3
      Width = 516
      Height = 44
      Brush.Color = clBtnFace
      Pen.Color = clTeal
    end
    object lblnrItem: TLabel
      Left = 19
      Top = 7
      Width = 45
      Height = 13
      Caption = 'Nr.Nota'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMercadoria: TLabel
      Left = 80
      Top = 7
      Width = 64
      Height = 13
      Caption = 'Mercadoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblQtdeDisp: TLabel
      Left = 183
      Top = 49
      Width = 97
      Height = 13
      Caption = 'Qtde. Dispon'#237'vel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPesoLiq: TLabel
      Left = 290
      Top = 49
      Width = 94
      Height = 13
      Caption = 'Peso Dispon'#237'vel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNrNota: TLabel
      Left = 23
      Top = 21
      Width = 32
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      Caption = '001'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 48
      Width = 131
      Height = 14
      AutoSize = False
      Caption = 'Natureza da Opera'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_co_natureza_op_filhote: TSpeedButton
      Left = 152
      Top = 61
      Width = 23
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
      OnClick = btn_co_natureza_op_filhoteClick
    end
    object DBText1: TDBText
      Left = 399
      Top = 68
      Width = 47
      Height = 17
      Alignment = taRightJustify
      DataField = 'NR_ADICAO'
      DataSource = ds_nota_filhote
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 405
      Top = 52
      Width = 40
      Height = 13
      Caption = 'Adi'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTipoRel: TLabel
      Left = 337
      Top = 265
      Width = 81
      Height = 16
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '--- TXT ---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object Label8: TLabel
      Left = 461
      Top = 52
      Width = 61
      Height = 13
      Caption = 'CFOP M'#227'e'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 462
      Top = 68
      Width = 56
      Height = 17
      Alignment = taRightJustify
      DataField = 'CD_CFOP'
      DataSource = ds_nota_filhote
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object nbTipoRel: TNotebook
      Left = 8
      Top = 266
      Width = 315
      Height = 42
      TabOrder = 9
      object TPage
        Left = 0
        Top = 0
        Caption = 'TXT'
        object Label4: TLabel
          Left = 5
          Top = 4
          Width = 153
          Height = 14
          AutoSize = False
          Caption = 'Texto Adicional (linha N3)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object edtLinha3Filhote: TEdit
          Left = 5
          Top = 17
          Width = 301
          Height = 21
          TabOrder = 0
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'EXCEL'
        object Label7: TLabel
          Left = 53
          Top = 3
          Width = 50
          Height = 13
          Caption = 'Especie:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 11
          Top = 3
          Width = 25
          Height = 13
          Caption = 'Qtd:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCNTR_FILHOTE: TLabel
          Left = 206
          Top = 3
          Width = 28
          Height = 13
          Caption = 'Cntr:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtEspecie_Filhote: TEdit
          Left = 52
          Top = 16
          Width = 146
          Height = 21
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
        end
        object edtQtd_Filhote: TEdit
          Left = 8
          Top = 16
          Width = 39
          Height = 21
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          Text = 'edtQtd_Filhote'
        end
        object cbCNTR_FILHOTE: TComboBox
          Left = 204
          Top = 16
          Width = 105
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          CharCase = ecUpperCase
          Ctl3D = False
          ItemHeight = 0
          ParentCtl3D = False
          TabOrder = 2
        end
      end
    end
    object btnOk: TBitBtn
      Left = 341
      Top = 281
      Width = 83
      Height = 25
      Caption = 'Gerar Filhote'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancelBaixaEstorno: TBitBtn
      Left = 438
      Top = 281
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelBaixaEstornoClick
    end
    object edt_cd_natureza_op_filhote: TEdit
      Left = 7
      Top = 61
      Width = 48
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      OnChange = btn_co_natureza_op_filhoteClick
    end
    object edt_nm_natureza_op_filhote: TEdit
      Left = 56
      Top = 61
      Width = 96
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
    end
    object dbgrd_filhote: TDBGrid
      Left = 8
      Top = 118
      Width = 515
      Height = 142
      DataSource = ds_nota_filhote
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_ITEM'
          ReadOnly = True
          Title.Caption = 'Item'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_MERCADORIA'
          ReadOnly = True
          Title.Caption = 'C'#243'digo Mercadoria'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AP_MERCADORIA'
          ReadOnly = True
          Title.Caption = 'Mercadoria'
          Width = 163
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDE_DISPONIVEL'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Qtde Dispon'#237'vel'
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDE_BAIXAR'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde a Baixar'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PL_MERC_DISPONIVEL'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Peso L'#237'q. Dispon'#237'vel'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PL_MERC_BAIXAR'
          Title.Alignment = taCenter
          Title.Caption = 'Peso a Baixar'
          Visible = False
        end>
    end
    object dbnav_filhote: TDBNavigator
      Left = 402
      Top = 20
      Width = 104
      Height = 20
      DataSource = ds_nota_filhote
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira adi'#231#227'o'
        'Adi'#231#227'o Anterior'
        'Pr'#243'xima adi'#231#227'o'
        #218'ltima adi'#231#227'o')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object dbedt_qtde: TDBEdit
      Left = 290
      Top = 63
      Width = 104
      Height = 19
      Color = clSilver
      Ctl3D = False
      DataField = 'PL_MERC_DISPONIVEL'
      DataSource = ds_nota_filhote
      ParentCtl3D = False
      TabOrder = 6
    end
    object dbedt_nm_mercadoria: TDBEdit
      Left = 80
      Top = 21
      Width = 313
      Height = 19
      Color = clSilver
      Ctl3D = False
      DataField = 'AP_MERCADORIA'
      DataSource = ds_nota_filhote
      ParentCtl3D = False
      TabOrder = 7
    end
    object dbedt_qtde_disponivel: TDBEdit
      Left = 182
      Top = 63
      Width = 100
      Height = 19
      Color = clSilver
      Ctl3D = False
      DataField = 'QTDE_DISPONIVEL'
      DataSource = ds_nota_filhote
      ParentCtl3D = False
      TabOrder = 8
    end
    object rg_arcor_filhote: TRadioGroup
      Left = 9
      Top = 83
      Width = 288
      Height = 32
      Anchors = [akRight, akBottom]
      Caption = 'Forma de Rateio'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Quantidade'
        'Peso L'#237'quido')
      TabOrder = 10
      OnClick = rg_arcor_filhoteClick
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 743
    Height = 50
    Align = alTop
    TabOrder = 2
    object shTopo: TShape
      Left = 1
      Top = 1
      Width = 741
      Height = 49
      Align = alTop
      Brush.Color = clBtnFace
      Pen.Color = clTeal
    end
    object btn_gera_txt: TSpeedButton
      Left = 7
      Top = 10
      Width = 87
      Height = 29
      Hint = 'Gerar TXT'
      BiDiMode = bdLeftToRight
      Caption = 'Gerar TXT'
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
      ParentBiDiMode = False
      ShowHint = True
      OnClick = btn_gera_txtClick
    end
    object lbl_cd_unid_neg: TLabel
      Left = 101
      Top = 8
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 310
      Top = 21
      Width = 23
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
      OnClick = btn_co_unid_negClick
    end
    object lbl_cd_cliente: TLabel
      Left = 339
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_co_cliente: TSpeedButton
      Left = 566
      Top = 21
      Width = 23
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
      OnClick = btn_co_clienteClick
    end
    object lbl_nr_processo: TLabel
      Left = 595
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_sair: TSpeedButton
      Left = 698
      Top = 5
      Width = 40
      Height = 40
      Hint = 'Sair'
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
      OnClick = btn_sairClick
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 101
      Top = 21
      Width = 29
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      EditMask = '!99;0; '
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 0
      OnChange = btn_co_unid_negClick
      OnExit = msk_cd_unid_negExit
    end
    object edt_nm_unid_neg: TEdit
      Left = 131
      Top = 21
      Width = 178
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object msk_cd_cliente: TMaskEdit
      Left = 339
      Top = 21
      Width = 40
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      EditMask = '!99999;0; '
      MaxLength = 5
      ParentCtl3D = False
      TabOrder = 2
      OnChange = btn_co_clienteClick
      OnExit = msk_cd_clienteExit
    end
    object edt_nm_cliente: TEdit
      Left = 380
      Top = 21
      Width = 184
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
    end
    object msk_nr_processo: TMaskEdit
      Left = 594
      Top = 20
      Width = 94
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 14
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      OnChange = msk_nr_processoChange
    end
  end
  object MemoAdicao: TMemo
    Left = 8
    Top = 344
    Width = 89
    Height = 49
    TabOrder = 4
    Visible = False
  end
  object pnlTXTArcor: TPanel
    Left = 204
    Top = 106
    Width = 297
    Height = 191
    BevelOuter = bvNone
    TabOrder = 5
    Visible = False
    object shpTXTArcor: TShape
      Left = 0
      Top = 0
      Width = 297
      Height = 191
      Align = alClient
      Brush.Style = bsClear
      Pen.Color = clNavy
    end
    object shp2: TShape
      Left = 13
      Top = 7
      Width = 258
      Height = 146
      Brush.Style = bsClear
      Pen.Color = clNavy
    end
    object shp1: TShape
      Left = 13
      Top = 144
      Width = 258
      Height = 54
      Brush.Style = bsClear
      Pen.Color = clNavy
    end
    object lblDataNFe: TLabel
      Left = 158
      Top = 154
      Width = 61
      Height = 13
      Caption = 'Data da NFe'
    end
    object btnFecharPanel: TSpeedButton
      Left = 276
      Top = 3
      Width = 19
      Height = 20
      Caption = 'X'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnFecharPanelClick
    end
    object lbl1: TLabel
      Left = 19
      Top = 136
      Width = 202
      Height = 13
      Caption = 'Informa'#231#245'es Complementares para Filhotes'
    end
    object lbl2: TLabel
      Left = 18
      Top = 3
      Width = 163
      Height = 13
      Caption = 'Informa'#231#245'es B'#225'sicas - Obrigat'#243'rias'
    end
    object lbledtPlacaCavalo: TLabeledEdit
      Left = 24
      Top = 67
      Width = 121
      Height = 21
      EditLabel.Width = 78
      EditLabel.Height = 13
      EditLabel.Caption = 'Placa do Cavalo'
      LabelSpacing = 0
      TabOrder = 1
    end
    object lbledtUFCavalo: TLabeledEdit
      Left = 160
      Top = 67
      Width = 41
      Height = 21
      EditLabel.Width = 65
      EditLabel.Height = 13
      EditLabel.Caption = 'UF do Cavalo'
      LabelSpacing = 0
      TabOrder = 2
    end
    object lbledtPlacaCarreta: TLabeledEdit
      Left = 24
      Top = 107
      Width = 121
      Height = 21
      EditLabel.Width = 79
      EditLabel.Height = 13
      EditLabel.Caption = 'Placa da Carreta'
      LabelSpacing = 0
      TabOrder = 3
    end
    object lbledtUFCarreta: TLabeledEdit
      Left = 160
      Top = 107
      Width = 41
      Height = 21
      EditLabel.Width = 66
      EditLabel.Height = 13
      EditLabel.Caption = 'UF da Carreta'
      LabelSpacing = 0
      TabOrder = 4
    end
    object btnContinuar: TButton
      Left = 111
      Top = 157
      Width = 75
      Height = 25
      Caption = 'Continuar'
      TabOrder = 5
      OnClick = btnContinuarClick
    end
    object lbledtCodigoCompanhia: TLabeledEdit
      Left = 23
      Top = 31
      Width = 205
      Height = 21
      EditLabel.Width = 104
      EditLabel.Height = 13
      EditLabel.Caption = 'C'#243'digo da Companhia'
      LabelSpacing = 0
      TabOrder = 0
    end
    object lbledtCodigoNFE: TLabeledEdit
      Left = 23
      Top = 167
      Width = 66
      Height = 21
      EditLabel.Width = 53
      EditLabel.Height = 13
      EditLabel.Caption = 'Danfe M'#227'e'
      LabelSpacing = 0
      TabOrder = 6
    end
    object lbledtSerieNFe: TLabeledEdit
      Left = 95
      Top = 167
      Width = 42
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = 'S'#233'rie NFe'
      LabelSpacing = 0
      TabOrder = 7
    end
    object medtDataNFe: TMaskEdit
      Left = 157
      Top = 167
      Width = 67
      Height = 21
      TabOrder = 8
    end
    object chk_transp_parcelado: TCheckBox
      Left = 25
      Top = 132
      Width = 145
      Height = 17
      Caption = 'Transporte Parcelado'
      TabOrder = 9
    end
  end
  object mmoTXTArcor: TMemo
    Left = 641
    Top = 353
    Width = 77
    Height = 32
    TabOrder = 6
    Visible = False
  end
  object pnl_Despesas_BASF: TPanel
    Left = 237
    Top = 121
    Width = 218
    Height = 150
    TabOrder = 7
    Visible = False
    object shp_despesas_basf: TShape
      Left = 1
      Top = 1
      Width = 216
      Height = 148
      Align = alClient
      Brush.Style = bsClear
      Pen.Color = clNavy
    end
    object shp_despesas_basf2: TShape
      Left = 8
      Top = 9
      Width = 185
      Height = 133
      Brush.Style = bsClear
      Pen.Color = clNavy
    end
    object lbl_despesas_basf: TLabel
      Left = 17
      Top = 5
      Width = 53
      Height = 13
      Caption = 'Nota BASF'
    end
    object lbl_despesas: TLabel
      Left = 16
      Top = 24
      Width = 81
      Height = 13
      Caption = 'Outras Despesas'
    end
    object btn_fechar_desp_basf: TSpeedButton
      Left = 195
      Top = 4
      Width = 19
      Height = 20
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btn_fechar_desp_basfClick
    end
    object lbl_multa_li: TLabel
      Left = 17
      Top = 69
      Width = 53
      Height = 13
      Caption = 'Multa de LI'
    end
    object Label9: TLabel
      Left = 105
      Top = 69
      Width = 75
      Height = 13
      Caption = 'ICMS Complem.'
    end
    object btn_despesas_basf: TButton
      Left = 62
      Top = 111
      Width = 75
      Height = 25
      Caption = 'Continuar'
      TabOrder = 0
      OnClick = btn_despesas_basfClick
    end
    object medt_despesas_basf: TMaskEdit
      Left = 16
      Top = 40
      Width = 169
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 1
      OnKeyPress = medt_despesas_basfKeyPress
    end
    object medt_multa_li_basf: TMaskEdit
      Left = 17
      Top = 83
      Width = 80
      Height = 21
      TabOrder = 2
      OnChange = medt_multa_li_basfChange
      OnKeyPress = medt_multa_li_basfKeyPress
    end
    object medt_icms_complementar_basf: TMaskEdit
      Left = 105
      Top = 83
      Width = 80
      Height = 21
      TabOrder = 3
      OnKeyPress = medt_multa_li_basfKeyPress
    end
  end
  object pnlPainelInferior: TPanel
    Left = 0
    Top = 408
    Width = 743
    Height = 112
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 8
    DesignSize = (
      743
      112)
    object Shape1: TShape
      Left = 0
      Top = 1
      Width = 740
      Height = 109
      Align = alCustom
      Brush.Color = clBtnFace
      Pen.Color = clTeal
    end
    object Label1: TLabel
      Left = 5
      Top = 69
      Width = 131
      Height = 14
      AutoSize = False
      Caption = 'Natureza da Opera'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_co_natureza_op: TSpeedButton
      Left = 256
      Top = 85
      Width = 20
      Height = 19
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
      OnClick = btn_co_natureza_opClick
    end
    object Label2: TLabel
      Left = 284
      Top = 69
      Width = 275
      Height = 14
      AutoSize = False
      Caption = 'Texto Adicional (linha N3)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object rgDescricao: TRadioGroup
      Left = 572
      Top = 2
      Width = 167
      Height = 37
      Anchors = [akRight, akBottom]
      Caption = 'Descri'#231#227'o Mercadoria'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Resumida'
        'Completa')
      TabOrder = 0
    end
    object chk_filhote: TCheckBox
      Left = 573
      Top = 58
      Width = 130
      Height = 17
      Anchors = [akRight, akBottom]
      Caption = 'Possui Filhote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object chk_entrada: TCheckBox
      Left = 573
      Top = 42
      Width = 130
      Height = 17
      Anchors = [akRight, akBottom]
      Caption = 'CFOP'#39's Diferentes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object chk_exportador: TCheckBox
      Left = 573
      Top = 74
      Width = 165
      Height = 17
      Caption = 'Exportadores diferentes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = chk_exportadorClick
    end
    object edt_cd_natureza_op: TEdit
      Left = 5
      Top = 83
      Width = 48
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      OnChange = btn_co_natureza_opClick
    end
    object edt_nm_natureza_op: TEdit
      Left = 54
      Top = 83
      Width = 202
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
    end
    object Edit1: TEdit
      Left = 284
      Top = 83
      Width = 278
      Height = 21
      TabOrder = 6
    end
    object chkNotaComplementar: TCheckBox
      Left = 573
      Top = 90
      Width = 165
      Height = 17
      Caption = 'Nota Complementar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = chkNotaComplementarClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 48
    Top = 72
    object GerarTxt1: TMenuItem
      Caption = '&Gerar Txt'
      OnClick = GerarTxt1Click
    end
    object GeraExcel1: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF004070
        5000407050003070400030704000307040003068400030684000306840002060
        30002060300020603000205030002050300020503000FF00FF004070500070A8
        800060A0700060A0700060987000609870005098700050987000509060005090
        60005090600040905000409050003090500030905000205030004078500070A8
        8000F0F0F000F0F0F000E0F0E000E0F0E000E0F0E000E0F0E000E0E8E000E0E8
        E000E0E8E000E0E8E000E0E8E000E0E8E00030905000205030004078500070A8
        8000F0F8F000F0F0F000F0F0F000E0F0E000E0F0E000E0F0E000E0F0E000E0E8
        E000E0E8E000E0E8E000E0E8E000E0E8E00040905000205030004080600070B0
        8000F0F8F000F0F8F000F0F0F000F0F0F000F0F0F000E0F0E00080A890003050
        3000305030003050300030503000E0E8E00040905000205030005088600080B8
        9000F0F8F00050A86000305030003050300030503000305030002078200070B8
        7000509060005098500020603000E0E8E00050906000206030005090600080C0
        9000F0F8F000F0F8F00050A8600060B0700050A860002078200080C080005090
        6000509850002060300080A89000E0E8E00050906000206030005098700090B8
        9000F0F8F000F0F8F000F0F8F00050A860003088300080C09000509060005098
        5000206030006098600060986000E0F0E00050906000206030006098700090C8
        A000FFF8FF00F0F8F000F0F8F0003088300090C8A00060A8600050A860003070
        400000680000E0F0E000E0F0E000E0F0E000509870003068400060A0700090C8
        A000FFFFFF00FFF8FF0040904000A0D0A00070B8700060A860004088500050A8
        60003088300000680000E0F0E000E0F0E000509870003068400070A88000A0D0
        A000FFFFFF0050985000B0D8B00070B8800070B88000509060005080600060B0
        700050A860003088300000680000E0F0E000609870003070400070A88000A0D0
        A000FFFFFF0060B0700060B0700060B0700050986000F0F8F000F0F8F0005080
        6000508060005080600050806000F0F0F000609870003070400070B08000B0D8
        B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8FF00FFF8FF00F0F8F000F0F8
        F000F0F8F000F0F8F000F0F8F000F0F0F00060A070004070500080B89000B0D8
        B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8FF00FFF8FF00F0F8
        F000F0F8F000F0F8F000F0F8F000F0F8F00060A070004070500080B89000B0D8
        B000B0D8B000A0D0A000A0D0A00090C8A00090C8A00090C8A00090B8900080C0
        900080B8900070B0800070A8800070A8800070A8800040705000FF00FF0080B8
        900070B0800070A8800070A8800060A070006098700050987000509060005088
        60005088600040806000407850004078500040705000FF00FF00}
      Caption = 'Gerar Excel'
      OnClick = GeraExcel1Click
    end
    object SaintGobain1: TMenuItem
      Bitmap.Data = {
        36090000424D3609000000000000B60000002800000020000000110000000100
        2000000000008008000000000000000000001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080000000FF0000000000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        800080008000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00800080008000800080008000800080008000
        80008000800000000000000000000000FF000000FF000000FF00000000000000
        0000000000000000000000000000800080008000800080008000800080008000
        80007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F00FFFFFF00800080008000800080008000800080008000
        80008000800000000000FFFFFF000000FF000000FF000000FF0000000000FFFF
        FF00FFFFFF00FFFFFF0000000000800080008000800080008000800080008000
        80007F7F7F00FFFFFF0080008000FFFFFF00FFFFFF00FFFFFF00FFFFFF008000
        8000800080007F7F7F00FFFFFF00800080008000800080008000800080008000
        800080008000000000000000FF000000FF000000FF000000FF000000FF000000
        0000FFFFFF00FFFFFF0000000000800080008000800080008000800080008000
        80007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F00800080008000
        8000800080007F7F7F00FFFFFF00800080008000800080008000800080008000
        8000800080000000FF000000FF000000FF000000FF000000FF000000FF000000
        0000FFFFFF00FFFFFF0000000000800080008000800080008000800080008000
        80007F7F7F00FFFFFF0080008000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF007F7F7F00FFFFFF00800080008000800080008000800080008000
        80007F7F7F000000FF000000FF0000000000800080000000FF000000FF000000
        FF0000000000FFFFFF0000000000800080008000800080008000800080008000
        80007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F00800080007F7F7F00FFFFFF00800080008000800080008000800080007F7F
        7F000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
        FF0000000000FFFFFF0000000000800080008000800080008000800080008000
        80007F7F7F00FFFFFF0080008000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF007F7F7F00FFFFFF00800080008000800080008000800080008000
        80008000800000000000FFFFFF000000000000000000000000000000FF000000
        FF000000FF000000000000000000800080008000800080008000800080008000
        80007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F00800080007F7F7F00FFFFFF00800080008000800080008000800080008000
        80008000800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        FF000000FF000000000000000000800080008000800080008000800080008000
        80007F7F7F00FFFFFF0080008000FFFFFF00FFFFFF00FFFFFF00800080008000
        8000800080007F7F7F00FFFFFF00800080008000800080008000800080008000
        80008000800000000000FFFFFF00000000000000000000000000FFFFFF00FFFF
        FF000000FF000000FF0000000000800080008000800080008000800080008000
        80007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F008000800080008000FFFF
        FF00FFFFFF007F7F7F00FFFFFF00800080008000800080008000800080008000
        80008000800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000000000007F7F7F000000FF00000000008000800080008000800080008000
        80007F7F7F00FFFFFF0080008000FFFFFF00FFFFFF00800080007F7F7F007F7F
        7F007F7F7F007F7F7F0080008000800080008000800080008000800080008000
        80008000800000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
        0000FFFFFF00000000007F7F7F000000FF000000000080008000800080008000
        80007F7F7F00FFFFFF007F7F7F007F7F7F0080008000800080007F7F7F00FFFF
        FF007F7F7F008000800080008000800080008000800080008000800080008000
        80008000800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000000000008000800080008000800080000000FF000000FF00000000008000
        80007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F
        7F00800080008000800080008000800080008000800080008000800080008000
        8000800080000000000000000000000000000000000000000000000000000000
        0000800080008000800080008000800080008000800080008000800080008000
        80007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000}
      Caption = 'Saint Gobain'
      Visible = False
      OnClick = SaintGobain1Click
    end
    object Planilhadeacertodenumeraes1: TMenuItem
      Bitmap.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000620B0000620B0000000100000001000018A5C60018A5
        CE0029A5D60031A5D60018ADD60021ADD60029ADD60018ADDE0031B5DE0039BD
        E70052BDE7004AC6E7004AC6EF009CDEEF00ADDEEF006BDEF70073DEF700A5EF
        F700FF00FF0084EFFF008CEFFF0094EFFF008CF7FF0094F7FF00A5F7FF0094FF
        FF009CFFFF00ADFFFF00C6FFFF00D6FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121212121212
        121212121212121212121206080512121212121212121212121212060D130B05
        0000001212121212121212060A1A19101010100B05001212121212060A1B1614
        14141010100C051212121206060E17171414141410100C121212120610061A16
        16161414141010001212120617060E111118141414101009121212061A100600
        00000E1613131010001212061A171010100F060E13131315031212061A171717
        1710100600020202001212061C191A1D1D14151010071212121212050D1C1C0D
        0400000000011212121212120806000012121212121212121212121212121212
        1212121212121212121212121212121212121212121212121212}
      Caption = 'Planilha de acerto das numera'#231#245'es '
      Visible = False
      OnClick = Planilhadeacertodenumeraes1Click
    end
  end
  object qry_di_nota_: TQuery
    AfterScroll = qry_di_nota_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT RTRIM(SUBSTRING(D.NR_PROCESSO,5,14)) '#39'Processo'#39', D.NR_DEC' +
        'LARACAO_IMP '#39'n'#186' DI'#39', EM.NM_EMPRESA '#39'Cliente'#39
      'FROM TDECLARACAO_IMPORTACAO D (NOLOCK)'
      'INNER JOIN TPROCESSO P (NOLOCK) ON D.NR_PROCESSO = P.NR_PROCESSO'
      'INNER JOIN TEMPRESA_NAC EM ON EM.CD_EMPRESA = P.CD_CLIENTE'
      'WHERE  P.CD_UNID_NEG =  :CD_UNID_NEG  AND'
      '       P.CD_CLIENTE = :CD_CLIENTE'
      '        AND D.NR_DECLARACAO_IMP IS NOT NULL '
      '       AND D.NR_DECLARACAO_IMP <> '#39#39
      'ORDER BY P.CD_UNID_NEG, P.CD_PRODUTO, P.NR_PROCESSO DESC')
    Left = 21
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
    object qry_di_nota_Processo: TStringField
      FieldName = 'Processo'
      FixedChar = True
      Size = 18
    end
    object qry_di_nota_nDI: TStringField
      FieldName = 'n'#186' DI'
      FixedChar = True
      Size = 10
    end
    object qry_di_nota_Cliente: TStringField
      FieldName = 'Cliente'
      FixedChar = True
      Size = 50
    end
  end
  object ds_di_nota_: TDataSource
    DataSet = qry_di_nota_
    Left = 69
    Top = 152
  end
  object qry_di_adicao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM DBO.FN_GERA_NOTA_BASF_N1(:NR_PROCESSO)')
    Left = 648
    Top = 36
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_di_adicao_Tipo: TStringField
      FieldName = 'Tipo'
      FixedChar = True
      Size = 2
    end
    object qry_di_adicao_CNPJ_CLIENTE: TStringField
      FieldName = 'CNPJ_CLIENTE'
      FixedChar = True
      Size = 14
    end
    object qry_di_adicao_DT_EMISSAO: TStringField
      FieldName = 'DT_EMISSAO'
      FixedChar = True
      Size = 255
    end
    object qry_di_adicao_PESO_LIQ: TFloatField
      FieldName = 'PESO_LIQ'
    end
    object qry_di_adicao_PESO_BRUTO: TFloatField
      FieldName = 'PESO_BRUTO'
    end
    object qry_di_adicao_NR_DI: TStringField
      FieldName = 'NR_DI'
      FixedChar = True
      Size = 10
    end
    object qry_di_adicao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_di_adicao_NAVIO: TStringField
      FieldName = 'NAVIO'
      FixedChar = True
      Size = 40
    end
    object qry_di_adicao_CNPJ_TRANSP_ROD: TStringField
      FieldName = 'CNPJ_TRANSP_ROD'
      FixedChar = True
      Size = 14
    end
    object qry_di_adicao_BASE_ICMS: TFloatField
      FieldName = 'BASE_ICMS'
    end
    object qry_di_adicao_VL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
    end
    object qry_di_adicao_IPI: TFloatField
      FieldName = 'IPI'
    end
    object qry_di_adicao_CD_TRIBUTACAO_ICMS: TStringField
      FieldName = 'CD_TRIBUTACAO_ICMS'
      FixedChar = True
      Size = 1
    end
    object qry_di_adicao_URF_DESC: TStringField
      FieldName = 'URF_DESC'
      FixedChar = True
      Size = 120
    end
    object qry_di_adicao_URF_UF: TStringField
      FieldName = 'URF_UF'
      FixedChar = True
      Size = 2
    end
    object qry_di_adicao_DT_DESEMB: TStringField
      FieldName = 'DT_DESEMB'
      FixedChar = True
      Size = 30
    end
    object qry_di_adicao_DT_DI: TStringField
      FieldName = 'DT_DI'
      FixedChar = True
      Size = 30
    end
    object qry_di_adicao_FABRICANTE: TStringField
      FieldName = 'FABRICANTE'
      FixedChar = True
      Size = 15
    end
    object qry_di_adicao_EXPORTADOR: TStringField
      FieldName = 'EXPORTADOR'
      FixedChar = True
      Size = 15
    end
    object qry_di_adicao_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      FixedChar = True
      Size = 5
    end
    object qry_di_adicao_NM_TRANSP_ROD: TStringField
      FieldName = 'NM_TRANSP_ROD'
      FixedChar = True
      Size = 60
    end
    object qry_di_adicao_END_TRANSP_ROD: TStringField
      FieldName = 'END_TRANSP_ROD'
      FixedChar = True
      Size = 50
    end
    object qry_di_adicao_IE_TRANSP_ROD: TStringField
      FieldName = 'IE_TRANSP_ROD'
      FixedChar = True
    end
    object qry_di_adicao_ESPECIE: TStringField
      FieldName = 'ESPECIE'
      FixedChar = True
      Size = 120
    end
    object qry_di_adicao_QT_ESPECIE: TStringField
      FieldName = 'QT_ESPECIE'
      FixedChar = True
      Size = 5
    end
    object qry_di_adicao_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qry_di_adicao_NM_AREA: TStringField
      FieldName = 'NM_AREA'
      FixedChar = True
      Size = 50
    end
    object qry_di_adicao_REFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      FixedChar = True
      Size = 255
    end
    object qry_di_adicao_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
    end
    object qry_di_adicao_IN_EMBUT_FRT_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_FRT_ITENS'
    end
    object qry_di_adicao_IN_EMBUT_SEG_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_SEG_ITENS'
    end
    object qry_di_adicao_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_di_adicao_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_di_adicao_QT_ADICOES: TIntegerField
      FieldName = 'QT_ADICOES'
    end
    object qry_di_adicao_QT_ITENS_ADICAO: TIntegerField
      FieldName = 'QT_ITENS_ADICAO'
    end
    object qry_di_adicao_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_di_adicao_CD_CFOP: TStringField
      FieldName = 'CD_CFOP'
      FixedChar = True
      Size = 4
    end
    object qry_di_adicao_PESO_LIQ_XLS: TFloatField
      FieldName = 'PESO_LIQ_XLS'
    end
    object qry_di_adicao_PESO_BRUTO_XLS: TFloatField
      FieldName = 'PESO_BRUTO_XLS'
    end
    object qry_di_adicao_TOT_MARINHA_DI: TFloatField
      FieldName = 'TOT_MARINHA_DI'
    end
    object qry_di_adicao_TOT_MARINHA_MAE: TFloatField
      FieldName = 'TOT_MARINHA_MAE'
    end
    object qry_di_adicao_CD_FUND_LEGAL_ICMS: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS'
      FixedChar = True
      Size = 3
    end
    object qry_di_adicao_CD_TIPO_BENEF_PIS_COFINS: TStringField
      FieldName = 'CD_TIPO_BENEF_PIS_COFINS'
      FixedChar = True
      Size = 1
    end
    object qry_di_adicao_DT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      FixedChar = True
      Size = 8
    end
    object qry_di_adicao_VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
    end
    object qry_di_adicao_VL_PIS: TFloatField
      FieldName = 'VL_PIS'
    end
    object qry_di_adicao_VL_II: TFloatField
      FieldName = 'VL_II'
    end
    object qry_di_adicao_CGC_UNID_NEG: TStringField
      FieldName = 'CGC_UNID_NEG'
      FixedChar = True
      Size = 14
    end
    object qry_di_adicao_DT_CONHECIMENTO: TStringField
      FieldName = 'DT_CONHECIMENTO'
      FixedChar = True
      Size = 255
    end
    object qry_di_adicao_CD_TRANSPORTADOR: TStringField
      FieldName = 'CD_TRANSPORTADOR'
      FixedChar = True
      Size = 4
    end
    object qry_di_adicao_PC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
    end
    object qry_di_adicao_VL_AFRMM_AD: TFloatField
      FieldName = 'VL_AFRMM_AD'
    end
    object qry_di_adicao_QTD_MERCADORIA_TOTAL: TFloatField
      FieldName = 'QTD_MERCADORIA_TOTAL'
    end
    object qry_di_adicao_NR_CLIENTE: TStringField
      FieldName = 'NR_CLIENTE'
      FixedChar = True
      Size = 15
    end
    object qry_di_adicao_TX_SISCOMEX: TFloatField
      FieldName = 'TX_SISCOMEX'
    end
    object qry_di_adicao_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 1
    end
  end
  object qry_di_mercadoria_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '
      '*'
      ' FROM DBO.FN_GERA_NOTA_BASF_N2( :NR_PROCESSO)')
    Left = 648
    Top = 81
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_di_mercadoria_Tipo: TStringField
      FieldName = 'Tipo'
      FixedChar = True
      Size = 2
    end
    object qry_di_mercadoria_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 30
    end
    object qry_di_mercadoria_QTDE: TStringField
      FieldName = 'QTDE'
      FixedChar = True
      Size = 255
    end
    object qry_di_mercadoria_UNID_MEDIDA: TStringField
      FieldName = 'UNID_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qry_di_mercadoria_VL_UNIT: TStringField
      FieldName = 'VL_UNIT'
      FixedChar = True
      Size = 255
    end
    object qry_di_mercadoria_CFOP: TStringField
      FieldName = 'CFOP'
      FixedChar = True
      Size = 4
    end
    object qry_di_mercadoria_BASE_ICMS: TFloatField
      FieldName = 'BASE_ICMS'
    end
    object qry_di_mercadoria_ALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
    end
    object qry_di_mercadoria_VL_ICMS_ITEM: TFloatField
      FieldName = 'VL_ICMS_ITEM'
    end
    object qry_di_mercadoria_VL_BASE_IPI: TFloatField
      FieldName = 'VL_BASE_IPI'
    end
    object qry_di_mercadoria_ALIQ_IPI: TStringField
      FieldName = 'ALIQ_IPI'
      FixedChar = True
      Size = 30
    end
    object qry_di_mercadoria_VL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object qry_di_mercadoria_VL_MERCADORIA: TFloatField
      FieldName = 'VL_MERCADORIA'
    end
    object qry_di_mercadoria_NCM: TStringField
      FieldName = 'NCM'
      FixedChar = True
      Size = 11
    end
    object qry_di_mercadoria_PO: TStringField
      FieldName = 'PO'
      FixedChar = True
      Size = 18
    end
    object qry_di_mercadoria_ITEM_PO: TStringField
      FieldName = 'ITEM_PO'
      FixedChar = True
      Size = 4
    end
    object qry_di_mercadoria_CD_TRIBUTACAO_ICMS: TStringField
      FieldName = 'CD_TRIBUTACAO_ICMS'
      FixedChar = True
      Size = 1
    end
    object qry_di_mercadoria_NR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
    object qry_di_mercadoria_VL_DESCONTO_MERC: TFloatField
      FieldName = 'VL_DESCONTO_MERC'
    end
    object qry_di_mercadoria_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      FixedChar = True
      Size = 3
    end
    object qry_di_mercadoria_NR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
    end
    object qry_di_mercadoria_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_di_mercadoria_VL_BASE_IPI_UNITARIO: TFloatField
      FieldName = 'VL_BASE_IPI_UNITARIO'
    end
    object qry_di_mercadoria_VL_BASE_ICMS_UNITARIO: TFloatField
      FieldName = 'VL_BASE_ICMS_UNITARIO'
    end
    object qry_di_mercadoria_QT_MERC_UN_COMERC: TFloatField
      FieldName = 'QT_MERC_UN_COMERC'
    end
    object qry_di_mercadoria_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      FixedChar = True
      Size = 25
    end
    object qry_di_mercadoria_VL_BASE_CALC_II: TFloatField
      FieldName = 'VL_BASE_CALC_II'
    end
    object qry_di_mercadoria_VL_II_ITEM: TFloatField
      FieldName = 'VL_II_ITEM'
    end
    object qry_di_mercadoria_VL_PIS_ITEM: TFloatField
      FieldName = 'VL_PIS_ITEM'
    end
    object qry_di_mercadoria_VL_COFINS_ITEM: TFloatField
      FieldName = 'VL_COFINS_ITEM'
    end
    object qry_di_mercadoria_ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object qry_di_mercadoria_VL_TX_SCX_ITEM: TFloatField
      FieldName = 'VL_TX_SCX_ITEM'
    end
    object qry_di_mercadoria_VL_SEGURO_ITEM_MN: TFloatField
      FieldName = 'VL_SEGURO_ITEM_MN'
    end
    object qry_di_mercadoria_VL_FRETE_ITEM_MN: TFloatField
      FieldName = 'VL_FRETE_ITEM_MN'
    end
    object qry_di_mercadoria_VL_ACRESCIMO_ITEM_MN: TFloatField
      FieldName = 'VL_ACRESCIMO_ITEM_MN'
    end
    object qry_di_mercadoria_VL_DEDUCAO_ITEM_MN: TFloatField
      FieldName = 'VL_DEDUCAO_ITEM_MN'
    end
    object qry_di_mercadoria_VL_MLE_ITEM_MN: TFloatField
      FieldName = 'VL_MLE_ITEM_MN'
    end
    object qry_di_mercadoria_MERCADORIA_DI: TMemoField
      FieldName = 'MERCADORIA_DI'
      BlobType = ftMemo
    end
    object qry_di_mercadoria_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_di_mercadoria_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      FixedChar = True
      Size = 5
    end
    object qry_di_mercadoria_CD_CFOP: TStringField
      FieldName = 'CD_CFOP'
      FixedChar = True
      Size = 4
    end
    object qry_di_mercadoria_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
    end
    object qry_di_mercadoria_VL_ICMS_A_RECOLHER: TFloatField
      FieldName = 'VL_ICMS_A_RECOLHER'
    end
    object qry_di_mercadoria_CD_FUND_LEGAL_ICMS: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS'
      FixedChar = True
      Size = 3
    end
    object qry_di_mercadoria_CD_TIPO_BENEF_PIS_COFINS: TStringField
      FieldName = 'CD_TIPO_BENEF_PIS_COFINS'
      FixedChar = True
      Size = 1
    end
    object qry_di_mercadoria_IN_IPI_NAO_TRIBUT: TBooleanField
      FieldName = 'IN_IPI_NAO_TRIBUT'
    end
    object qry_di_mercadoria_CD_TIPO_BENEF_IPI: TStringField
      FieldName = 'CD_TIPO_BENEF_IPI'
      FixedChar = True
      Size = 1
    end
    object qry_di_mercadoria_NCM_DM: TStringField
      FieldName = 'NCM_DM'
      FixedChar = True
      Size = 11
    end
    object qry_di_mercadoria_CD_DIREITO_FISCAL_ICMS: TStringField
      FieldName = 'CD_DIREITO_FISCAL_ICMS'
      FixedChar = True
      Size = 3
    end
    object qry_di_mercadoria_CD_DIREITO_FISCAL_IPI: TStringField
      FieldName = 'CD_DIREITO_FISCAL_IPI'
      FixedChar = True
      Size = 3
    end
    object qry_di_mercadoria_CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      FixedChar = True
      Size = 2
    end
    object qry_di_mercadoria_CST_PIS: TStringField
      FieldName = 'CST_PIS'
      FixedChar = True
      Size = 2
    end
    object qry_di_mercadoria_VL_IOF: TIntegerField
      FieldName = 'VL_IOF'
    end
    object qry_di_mercadoria_VL_BASE_PIS: TFloatField
      FieldName = 'VL_BASE_PIS'
    end
    object qry_di_mercadoria_VL_BASE_COFINS: TFloatField
      FieldName = 'VL_BASE_COFINS'
    end
    object qry_di_mercadoria_ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object qry_di_mercadoria_VL_DESP_ADUANEIRA: TIntegerField
      FieldName = 'VL_DESP_ADUANEIRA'
    end
    object qry_di_mercadoria_ALIQ_II: TFloatField
      FieldName = 'ALIQ_II'
    end
    object qry_di_mercadoria_PB_MERCADORIA: TFloatField
      FieldName = 'PB_MERCADORIA'
    end
    object qry_di_mercadoria_CD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      FixedChar = True
      Size = 1
    end
    object qry_di_mercadoria_VL_BASE_PIS_COFINS_ITEM: TFloatField
      FieldName = 'VL_BASE_PIS_COFINS_ITEM'
    end
    object fltfld_di_mercadoria_VL_TOTAL_NF: TFloatField
      FieldName = 'VL_TOTAL_NF'
    end
    object fltfld_di_mercadoria_VL_BASE_CALC_ICMS_AFRMM: TFloatField
      FieldName = 'VL_BASE_CALC_ICMS_AFRMM'
    end
    object qry_di_mercadoria_VL_UNIT_APENAS_CIF: TStringField
      FieldName = 'VL_UNIT_APENAS_CIF'
      FixedChar = True
      Size = 255
    end
    object qry_di_mercadoria_VL_BASE_IPI_ITEM: TFloatField
      FieldName = 'VL_BASE_IPI_ITEM'
    end
    object qry_di_mercadoria_PL_MERCADORIA_ADICAO: TFloatField
      FieldName = 'PL_MERCADORIA_ADICAO'
    end
    object qry_di_mercadoria_VL_CIF_NORMAL: TFloatField
      FieldName = 'VL_CIF_NORMAL'
    end
    object qry_di_mercadoria_VL_UNITARIO_NORMAL: TFloatField
      FieldName = 'VL_UNITARIO_NORMAL'
    end
    object qry_di_mercadoria_NR_CLIENTE: TStringField
      FieldName = 'NR_CLIENTE'
      FixedChar = True
      Size = 15
    end
    object qry_di_mercadoria_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      FixedChar = True
      Size = 13
    end
    object qry_di_mercadoria_VL_AFRMM_ITEM: TFloatField
      FieldName = 'VL_AFRMM_ITEM'
    end
    object qry_di_mercadoria_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
    object qry_di_mercadoria_NR_PROC_PO: TStringField
      DisplayWidth = 50
      FieldName = 'NR_PROC_PO'
      FixedChar = True
      Size = 50
    end
    object qry_di_mercadoria_PC_REDUCAO_ICMS: TFloatField
      FieldName = 'PC_REDUCAO_ICMS'
    end
    object qry_di_mercadoria_ICMS_DESONERADO: TFloatField
      FieldName = 'ICMS_DESONERADO'
    end
    object qry_di_mercadoria_VL_ICMS_A_RECOLHER_DES: TFloatField
      FieldName = 'VL_ICMS_A_RECOLHER_DES'
    end
    object strngfld_di_mercadoria_ATO_DRAWBACK: TStringField
      FieldName = 'ATO_DRAWBACK'
    end
    object qry_di_mercadoria_ALIQ_CBS: TFloatField
      FieldName = 'ALIQ_CBS'
    end
    object qry_di_mercadoria_ALIQ_IBS_UF: TFloatField
      FieldName = 'ALIQ_IBS_UF'
    end
    object qry_di_mercadoria_ALIQ_IBS_MUN: TFloatField
      FieldName = 'ALIQ_IBS_MUN'
    end
    object qry_di_mercadoria_VL_CBS: TFloatField
      FieldName = 'VL_CBS'
    end
    object qry_di_mercadoria_VL_IBS_UF: TFloatField
      FieldName = 'VL_IBS_UF'
    end
    object qry_di_mercadoria_VL_IBS_MUN: TFloatField
      FieldName = 'VL_IBS_MUN'
    end
    object qry_di_mercadoria_BASE_IBS_CBS: TFloatField
      FieldName = 'BASE_IBS_CBS'
    end
    object qry_di_mercadoria_VL_TOTAL_IBS: TFloatField
      FieldName = 'VL_TOTAL_IBS'
    end
    object qry_di_mercadoria_TAX_SIT_CATALISADORES: TStringField
      FieldName = 'TAX_SIT_CATALISADORES'
      Size = 3
    end
    object qry_di_mercadoria_OUTRAS_BASE_IBS_CBS_CAT: TFloatField
      FieldName = 'OUTRAS_BASE_IBS_CBS_CAT'
    end
    object qry_di_mercadoria_BASE_IBS_CBS_CAT: TFloatField
      FieldName = 'BASE_IBS_CBS_CAT'
    end
  end
  object qry_di_embalagem_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT EC.NR_PROCESSO, EC.CD_TIPO_EMBALAGEM, EC.QT_VOLUME_CARGA,' +
        ' E.DESCRICAO '
      'FROM TEMBALAGEM_CARGA EC'
      'INNER JOIN TTP_EMBALAGEM E ON EC.CD_TIPO_EMBALAGEM = E.CODIGO'
      'WHERE EC.NR_PROCESSO = :NR_PROCESSO')
    Left = 640
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_di_embalagem_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_di_embalagem_CD_TIPO_EMBALAGEM: TStringField
      FieldName = 'CD_TIPO_EMBALAGEM'
      FixedChar = True
      Size = 2
    end
    object qry_di_embalagem_QT_VOLUME_CARGA: TStringField
      FieldName = 'QT_VOLUME_CARGA'
      FixedChar = True
      Size = 5
    end
    object qry_di_embalagem_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 120
    end
  end
  object ds_di_mercadoria_: TDataSource
    DataSet = qry_di_mercadoria_
    Left = 675
    Top = 82
  end
  object qry_mercadoria_filhote_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ' SELECT CASE P.CD_GRUPO'
      '           WHEN '#39'A83'#39' THEN LEFT(DM.CD_MERCADORIA, 11)'
      '       ELSE DM.CD_MERCADORIA'
      
        '       END AS CD_MERCADORIA, M.AP_MERCADORIA, CONVERT(VARCHAR, M' +
        '.NM_MERCADORIA,30) NM_MERCADORIA,'
      
        'ROUND(DM.QT_MERC_UN_COMERC,3) QTDE_COMERC, ROUND(DM.PL_MERCADORI' +
        'A,3) PL_MERCADORIA, UM.NM_UNID_MEDIDA, DM.NR_PROC_PO, DM.NR_ITEM' +
        '_PO,'
      
        'DM.VL_DESCONTO_MERC * 100 VL_DESCONTO_MERC, DM.NR_ADICAO, DM.NR_' +
        'PARCIAL, DM.NR_PROCESSO, AD.CD_CFOP'
      'FROM TDETALHE_MERCADORIA DM'
      'INNER JOIN TPROCESSO P ON P.NR_PROCESSO = DM.NR_PROCESSO'
      
        'INNER JOIN TMERCADORIA M ON M.CD_MERCADORIA = DM.CD_MERCADORIA A' +
        'ND ISNULL(M.CD_GRUPO, '#39#39') IN ('#39#39', P.CD_GRUPO)'
      
        'INNER JOIN TUNID_MEDIDA_BROKER UM ON UM.CD_UNID_MEDIDA = DM.CD_U' +
        'N_MED_COMERC'
      
        'LEFT JOIN TADICAO_DE_IMPORTACAO ad ON ad.NR_PROCESSO=dm.NR_PROCE' +
        'SSO and ad.NR_ADICAO=dm.NR_ADICAO'
      'WHERE DM.NR_PROCESSO = :NR_PROCESSO')
    Left = 643
    Top = 212
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_mercadoria_filhote_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 30
    end
    object qry_mercadoria_filhote_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      FixedChar = True
      Size = 25
    end
    object qry_mercadoria_filhote_NM_MERCADORIA: TStringField
      FieldName = 'NM_MERCADORIA'
      FixedChar = True
      Size = 30
    end
    object qry_mercadoria_filhote_QTDE_COMERC: TFloatField
      FieldName = 'QTDE_COMERC'
    end
    object qry_mercadoria_filhote_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
    end
    object qry_mercadoria_filhote_NM_UNID_MEDIDA: TStringField
      FieldName = 'NM_UNID_MEDIDA'
      FixedChar = True
      Size = 50
    end
    object qry_mercadoria_filhote_NR_PROC_PO: TStringField
      FieldName = 'NR_PROC_PO'
      FixedChar = True
      Size = 18
    end
    object qry_mercadoria_filhote_NR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
    object qry_mercadoria_filhote_VL_DESCONTO_MERC: TFloatField
      FieldName = 'VL_DESCONTO_MERC'
    end
    object qry_mercadoria_filhote_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      FixedChar = True
      Size = 3
    end
    object qry_mercadoria_filhote_NR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
    end
    object qry_mercadoria_filhote_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_mercadoria_filhote_CD_CFOP: TStringField
      FieldName = 'CD_CFOP'
      FixedChar = True
      Size = 4
    end
  end
  object ds_nota_filhote: TDataSource
    DataSet = cds_nota_filhote_
    Left = 169
    Top = 301
  end
  object qry_nota_filhote_: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT F.NR_PROCESSO, CD_CFOP, CD_ITEM,'
      '       CASE P.CD_GRUPO'
      '           WHEN '#39'A83'#39' THEN LEFT(F.CD_MERCADORIA, 11)'
      '       ELSE F.CD_MERCADORIA'
      '       END AS CD_MERCADORIA, '
      '       AP_MERCADORIA, '
      '       PL_MERCADORIA,'
      '       QTDE_COMERC, '
      '       QTDE_BAIXADA, '
      '       NM_UNID_MEDIDA, '
      '       LTRIM(RTRIM(NR_PROC_PO)) AS NR_PROC_PO, '
      '       NR_ITEM_PO,'
      '       NR_ADICAO, '
      '       NR_PARCIAL, '
      '       PL_BAIXADA'
      'FROM TNOTA_FILHOTE F'
      '   INNER JOIN TPROCESSO P ON P.NR_PROCESSO = F.NR_PROCESSO'
      'WHERE QTDE_BAIXADA <> QTDE_COMERC'
      '  AND F.NR_PROCESSO = :NR_PROCESSO')
    UpdateObject = upd_nota_filhote
    Left = 133
    Top = 301
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qry_nota_filhote_CD_ITEM: TIntegerField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TNOTA_FILHOTE.CD_ITEM'
    end
    object qry_nota_filhote_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TNOTA_FILHOTE.CD_MERCADORIA'
      FixedChar = True
      Size = 30
    end
    object qry_nota_filhote_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      Origin = 'DBBROKER.TNOTA_FILHOTE.AP_MERCADORIA'
      FixedChar = True
      Size = 25
    end
    object qry_nota_filhote_QTDE_BAIXADA: TFloatField
      FieldName = 'QTDE_BAIXADA'
      Origin = 'DBBROKER.TNOTA_FILHOTE.QTDE_BAIXADA'
    end
    object qry_nota_filhote_NM_UNID_MEDIDA: TStringField
      FieldName = 'NM_UNID_MEDIDA'
      Origin = 'DBBROKER.TNOTA_FILHOTE.NM_UNID_MEDIDA'
      FixedChar = True
      Size = 50
    end
    object qry_nota_filhote_NR_PROC_PO: TStringField
      FieldName = 'NR_PROC_PO'
      Origin = 'DBBROKER.TNOTA_FILHOTE.NR_PROC_PO'
      FixedChar = True
      Size = 18
    end
    object qry_nota_filhote_NR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      Origin = 'DBBROKER.TNOTA_FILHOTE.NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
    object qry_nota_filhote_QTDE_COMERC: TFloatField
      FieldName = 'QTDE_COMERC'
      Origin = 'DBBROKER.TNOTA_FILHOTE.QTDE_COMERC'
    end
    object qry_nota_filhote_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'DBBROKER.TNOTA_FILHOTE.PL_MERCADORIA'
    end
    object qry_nota_filhote_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'DBBROKER.TNOTA_FILHOTE.NR_ADICAO'
      FixedChar = True
      Size = 3
    end
    object qry_nota_filhote_NR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
      Origin = 'DBBROKER.TNOTA_FILHOTE.NR_PARCIAL'
    end
    object qry_nota_filhote_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TNOTA_FILHOTE.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_nota_filhote_CD_CFOP: TStringField
      FieldName = 'CD_CFOP'
      Origin = 'DBBROKER.TNOTA_FILHOTE.CD_CFOP'
      FixedChar = True
      Size = 10
    end
    object qry_nota_filhote_PL_BAIXADA: TFloatField
      FieldName = 'PL_BAIXADA'
      Origin = 'DBBROKER.TNOTA_FILHOTE.PL_BAIXADA'
    end
  end
  object cds_nota_filhote_: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cds_nota_filhote_CalcFields
    Left = 132
    Top = 255
    object cds_nota_filhote_CD_ITEM: TIntegerField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TNOTA_FILHOTE.CD_ITEM'
    end
    object cds_nota_filhote_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'DBBROKER.TNOTA_FILHOTE.CD_MERCADORIA'
      FixedChar = True
      Size = 30
    end
    object cds_nota_filhote_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      Origin = 'DBBROKER.TNOTA_FILHOTE.AP_MERCADORIA'
      FixedChar = True
      Size = 25
    end
    object cds_nota_filhote_QTDE_BAIXADA: TFloatField
      FieldName = 'QTDE_BAIXADA'
      Origin = 'DBBROKER.TNOTA_FILHOTE.QTDE_BAIXADA'
    end
    object cds_nota_filhote_NM_UNID_MEDIDA: TStringField
      FieldName = 'NM_UNID_MEDIDA'
      Origin = 'DBBROKER.TNOTA_FILHOTE.NM_UNID_MEDIDA'
      FixedChar = True
      Size = 50
    end
    object cds_nota_filhote_NR_PROC_PO: TStringField
      DisplayWidth = 50
      FieldName = 'NR_PROC_PO'
      Origin = 'DBBROKER.TNOTA_FILHOTE.NR_PROC_PO'
      FixedChar = True
      Size = 50
    end
    object cds_nota_filhote_NR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      Origin = 'DBBROKER.TNOTA_FILHOTE.NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
    object cds_nota_filhote_QTDE_COMERC: TFloatField
      FieldName = 'QTDE_COMERC'
      Origin = 'DBBROKER.TNOTA_FILHOTE.QTDE_COMERC'
    end
    object cds_nota_filhote_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'DBBROKER.TNOTA_FILHOTE.PL_MERCADORIA'
    end
    object cds_nota_filhote_QTDE_BAIXAR: TFloatField
      FieldName = 'QTDE_BAIXAR'
      DisplayFormat = '#,##0.000'
      EditFormat = '#,##0.000'
    end
    object cds_nota_filhote_QTDE_DISPONIVEL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'QTDE_DISPONIVEL'
      DisplayFormat = '#,##0.000'
      EditFormat = '#,##0.000'
      Calculated = True
    end
    object cds_nota_filhote_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'DBBROKER.TNOTA_FILHOTE.NR_ADICAO'
      FixedChar = True
      Size = 3
    end
    object cds_nota_filhote_NR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
      Origin = 'DBBROKER.TNOTA_FILHOTE.NR_PARCIAL'
    end
    object cds_nota_filhote_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TNOTA_FILHOTE.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object cds_nota_filhote_CD_CFOP: TStringField
      FieldName = 'CD_CFOP'
      FixedChar = True
      Size = 10
    end
    object cds_nota_filhote_PL_MERC_DISPONIVEL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PL_MERC_DISPONIVEL'
      DisplayFormat = '#,##0.000'
      EditFormat = '#,##0.000'
      Calculated = True
    end
    object cds_nota_filhote_PL_MERC_BAIXAR: TFloatField
      FieldName = 'PL_MERC_BAIXAR'
      DisplayFormat = '#,##0.000'
      EditFormat = '#,##0.000'
    end
    object cds_nota_filhote_PL_BAIXADA: TFloatField
      FieldName = 'PL_BAIXADA'
      Origin = 'DBBROKER.TNOTA_FILHOTE.PL_BAIXADA'
    end
  end
  object qry_adicao_desconto: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_ADICAO, VL_DEDUCAO_MN'
      'FROM TDEDUCAO_VALORACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '  AND :NR_ADICAO IN (NR_ADICAO, '#39'000'#39')')
    Left = 643
    Top = 260
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptInputOutput
      end>
  end
  object AbreXLS: TOpenDialog
    Filter = 'Excel|*.xls'
    InitialDir = 'C:\DDBROKER\NOTA FISCAL\CRODA'
    Left = 556
    Top = 63
  end
  object qry_di_exportadores_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT '#39'N2'#39'                                         '#9#9#9#9' '#9'AS TIP' +
        'O,'
      '       CASE P.CD_GRUPO'
      '           WHEN '#39'A83'#39' '
      '           THEN LEFT(DM.CD_MERCADORIA, 11)'
      '           ELSE DM.CD_MERCADORIA'
      
        '       END                                          '#9#9#9#9' '#9'AS CD_' +
        'MERCADORIA,'
      '       --UTILIZADOS NAS CELULAS OCULTAS (EXCEL)'
      
        '       ROUND(DM.VL_SEGURO_ITEM_MN, 2)    '#9#9#9#9#9#9#9' '#9'AS VL_SEGURO_I' +
        'TEM_MN,'
      
        '       ROUND(DM.VL_FRETE_ITEM_MN, 2)     '#9#9#9#9#9#9#9' '#9'AS VL_FRETE_IT' +
        'EM_MN,'
      
        '       ROUND(DM.VL_ACRESCIMO_ITEM_MN, 2) '#9#9'    '#9#9#9#9' '#9'AS VL_ACRES' +
        'CIMO_ITEM_MN,'
      
        '       ROUND(ISNULL(DM.VL_DEDUCAO_ITEM_MN, 0), 2)   '#9#9#9#9' '#9'AS VL_' +
        'DEDUCAO_ITEM_MN,'
      '       ROUND(DM.VL_MLE_ITEM_MN + '
      
        '             ISNULL(DM.VL_DESPESA_ITEM_MN, 0), 2)   '#9#9#9#9' '#9'AS VL_' +
        'MLE_ITEM_MN,'
      '       --FIM'
      '       CASE ISNULL(DM.CD_FABRICANTE,'#39#39')'
      '            WHEN '#39#39' '
      '            THEN DM.CD_EXPORTADOR'
      '            ELSE DM.CD_FABRICANTE'
      '       END                     '#9#9#9#9#9#9#9#9#9#9' '#9'AS CD_FABRICANTE,'
      '       DM.CD_EXPORTADOR        '#9#9#9#9#9#9#9#9#9#9' '#9'AS CD_FORNECEDOR,'
      '       AD.CD_CFOP              '#9#9#9#9#9#9#9#9#9#9' '#9'AS CD_CFOP,'
      '       AD.ALIQ_PIS             '#9#9#9#9#9#9#9#9#9#9' '#9'AS ALIQ_PIS,'
      
        '       AD.CD_REGIME_TRIBUTAR   '#9#9#9#9#9#9#9#9#9#9' '#9'AS CD_REGIME_TRIBUTAR' +
        ','
      '       M.AP_MERCADORIA         '#9#9#9#9#9#9#9#9#9#9' '#9'AS AP_MERCADORIA,'
      '       DM.TX_DESC_DET_MERC MERCADORIA_DI,'
      '       REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(28, 3), '
      
        '               DM.QT_MERC_UN_COMERC, 3)), '#39'.'#39', '#39#39')   '#9#9#9#9' '#9'AS QT' +
        'DE, --ROUND(DM.QT_MERC_UN_COMERC,3) * 1000 QTDE,'
      
        '       UM.NM_SIGLA                                   '#9#9#9#9' '#9'AS UN' +
        'ID_MEDIDA,'
      '       REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(28, 6), '
      '              (ROUND((DM.VL_BASE_CALC_II + DM.VL_II_ITEM)'
      
        '             / ROUND(DM.QT_MERC_UN_COMERC,3), 9)), 9)), '#39'.'#39', '#39#39')' +
        '     '#9'AS VL_UNIT,'
      
        '       '#39'CFOP'#39'                                                   ' +
        '     '#9'AS CFOP,'
      
        '       ROUND(DM.VL_BASE_ICMS_ITEM,2) * 100                      ' +
        '     '#9'AS BASE_ICMS,'
      '            (AD.PC_ICMS + CASE ISNULL(AD.IN_FUNDO_POBREZA, '#39'0'#39')'
      '                              WHEN '#39'0'#39
      '                              THEN 0'
      '                              ELSE PA.PC_FUNDO_POBREZA_RJ'
      
        '                          END) * 100                            ' +
        '     '#9'AS ALIQ_ICMS,'
      
        '       ROUND(DM.VL_BASE_ICMS_ITEM * (AD.PC_ICMS/100),2) * 100   ' +
        '     '#9'AS VL_ICMS_ITEM,'
      
        '       ROUND((DM.VL_BASE_CALC_II + DM.VL_II_ITEM), 2) * 100     ' +
        '     '#9'AS VL_BASE_IPI,'
      '       CASE WHEN (TRIB.PC_ALIQ_NORM_ADVAL * 100) = 0'
      '            THEN '#39'000'#39
      '            ELSE CONVERT(VARCHAR, TRIB.PC_ALIQ_NORM_ADVAL * 100)'
      
        '       END                                                      ' +
        '     '#9'AS ALIQ_IPI,'
      '       CASE WHEN (ROUND(DM.VL_IPI_ITEM,2) * 100) = 0 '
      '            THEN 0'
      '            ELSE ROUND(DM.VL_IPI_ITEM,2) * 100'
      
        '       END                                                      ' +
        '     '#9'AS VL_IPI,'
      
        '       ROUND((DM.VL_BASE_CALC_II + DM.VL_II_ITEM), 2) * 100     ' +
        '     '#9'AS VL_MERCADORIA,'
      
        '       DM.CD_NCM_SH   '#9#9#9#9#9#9#9#9#9#9#9#9#9'AS NCM /*M.CD_NCM ALTERADO PO' +
        'R AGATHA NIGRO 22/02/2018*/,'
      '       DM.CD_NCM_SH   '#9#9#9#9#9#9#9#9#9#9#9#9#9'AS NCM_DM,'
      '       DM.NR_PROC_PO  '#9#9#9#9#9#9#9#9#9#9#9#9#9'AS PO,'
      '       SUBSTRING(DM.NR_ITEM_PO, 2,3)'#9#9'    '#9#9#9#9#9#9'AS ITEM_PO,'
      '       DM.NR_ITEM_PO                '#9#9'    '#9#9#9#9#9#9'AS NR_ITEM_PO,'
      
        '       AD.CD_TRIBUTACAO_ICMS        '#9#9'    '#9#9#9#9#9#9'AS CD_TRIBUTACAO' +
        '_ICMS,'
      
        '       AD.CD_FUND_LEGAL_ICMS        '#9#9'    '#9#9#9#9#9#9'AS CD_FUND_LEGAL' +
        '_ICMS,'
      
        '       AD.CD_TIPO_BENEF_PIS_COFINS  '#9#9'    '#9#9#9#9#9#9'AS CD_TIPO_BENEF' +
        '_PIS_COFINS,'
      
        '       ROUND(DM.VL_BASE_CALC_II, 2) '#9#9'    '#9#9#9#9#9#9'AS VL_BASE_CALC_' +
        'II,'
      '       ROUND(DM.VL_II_ITEM, 2)      '#9#9'    '#9#9#9#9#9#9'AS VL_II_ITEM,'
      
        '       DM.QT_MERC_UN_COMERC         '#9#9'    '#9#9#9#9#9#9'AS QT_MERC_UN_CO' +
        'MERC,'
      
        '       ROUND(DM.VL_DESCONTO_MERC * 100, 2)      '#9#9#9#9#9#9'AS VL_DESC' +
        'ONTO_MERC,'
      
        '       ROUND(DM.VL_TX_SCX_ITEM, 2)'#9#9#9'    '#9#9#9#9#9#9'AS VL_TX_SCX_ITEM' +
        ','
      '       ROUND(DM.VL_PIS_ITEM, 2)   '#9#9#9'    '#9#9#9#9#9#9'AS VL_PIS_ITEM,'
      
        '       ROUND(DM.VL_COFINS_ITEM, 2)'#9#9#9'    '#9#9#9#9#9#9'AS VL_COFINS_ITEM' +
        ','
      '       DM.NR_ADICAO           '#9#9#9#9#9#9#9#9#9#9#9'AS NR_ADICAO,'
      '       DM.NR_PARCIAL          '#9#9#9#9#9#9#9#9#9#9#9'AS NR_PARCIAL,'
      '       DM.PL_MERCADORIA       '#9#9#9#9#9#9#9#9#9#9#9'AS PL_MERCADORIA,'
      
        '       AD.IN_IPI_NAO_TRIBUT   '#9#9#9#9#9#9#9#9#9#9#9'AS IN_IPI_NAO_TRIBUT,  ' +
        '     '
      '       TRIB.CD_TIPO_BENEF_IPI '#9#9#9#9#9#9#9#9#9#9#9'AS CD_TIPO_BENEF_IPI,'
      '       DI.NR_PROCESSO         '#9#9#9#9#9#9#9#9#9#9#9'AS NR_PROCESSO,'
      
        '      (DM.VL_BASE_CALC_II + DM.VL_II_ITEM) / DM.QT_MERC_UN_COMER' +
        'C       AS VL_BASE_IPI_UNITARIO,'
      '       CASE WHEN AD.PC_ICMS = 0 '
      '            THEN 0'
      '            ELSE (ROUND(DM.VL_BASE_CALC_II, 2) + '
      '                  ROUND(DM.VL_II_ITEM, 2) + '
      '                  ROUND(DM.VL_IPI_ITEM, 2) + '
      '                  ROUND(DM.VL_TX_SCX_ITEM, 2) + '
      '                  ROUND(DM.VL_PIS_ITEM, 2) +'
      
        '                  ROUND(DM.VL_COFINS_ITEM, 2)) / ((100 - AD.PC_I' +
        'CMS - '
      '                  CASE ISNULL(AD.IN_FUNDO_POBREZA, '#39'0'#39')'
      '                       WHEN '#39'0'#39' '
      '                       THEN 0'
      '                       ELSE PA.PC_FUNDO_POBREZA_RJ'
      '                  END) / 100) * '
      
        '                  ((AD.PC_ICMS + CASE ISNULL(AD.IN_FUNDO_POBREZA' +
        ', '#39'0'#39')'
      '                                      WHEN '#39'0'#39
      '                                      THEN 0'
      
        '                                      ELSE PA.PC_FUNDO_POBREZA_R' +
        'J'
      
        '                                 END) / 100) * 100 / (AD.PC_ICMS' +
        ' + '
      
        '                                 CASE ISNULL(AD.IN_FUNDO_POBREZA' +
        ', '#39'0'#39')'
      '                                      WHEN '#39'0'#39' '
      '                                      THEN 0'
      
        '                                      ELSE PA.PC_FUNDO_POBREZA_R' +
        'J'
      '                                 END) / DM.QT_MERC_UN_COMERC '
      
        '       END                                                      ' +
        '        AS VL_BASE_ICMS_UNITARIO,'
      
        '       AD.VL_ICMS_A_RECOLHER                                    ' +
        '        AS VL_ICMS_A_RECOLHER,'
      '       CASE AD.CD_TRIBUTACAO_ICMS '
      '            WHEN '#39'1'#39' THEN '#39'C23'#39' '
      '            WHEN '#39'7'#39' THEN '#39'D66'#39' '
      '            WHEN '#39'5'#39' THEN '#39'D04'#39' '
      '            WHEN '#39'3'#39' THEN '#39'D06'#39' '
      
        '       END                                                      ' +
        '        AS CD_DIREITO_FISCAL_ICMS, '
      '       CASE IN_IPI_NAO_TRIBUT  '
      '            WHEN '#39'1'#39' '
      '            THEN '#39'P15'#39' '
      '            ELSE CASE WHEN CD_TIPO_BENEF_IPI = '#39'4'#39' '
      '                      THEN '#39'P14'#39' '
      '                      ELSE '#39'P16'#39' '
      '                 END '
      
        '       END                                                      ' +
        '        AS CD_DIREITO_FISCAL_IPI,'
      
        '       CASE WHEN ((AD.ALIQ_PIS = 0) AND (AD.CD_TIPO_BENEF_PIS_CO' +
        'FINS = 7)) '
      '            THEN '#39'04'#39' '
      '            ELSE CD_CST_PISCOFINS '
      
        '       END                                                      ' +
        '        AS CST_COFINS,'
      
        '       AD.CD_TIPO_BENEF_PIS_COFINS                              ' +
        '        AS CD_TIPO_BENEF_PIS_COFINS,'
      
        '       CASE WHEN ((AD.ALIQ_PIS = 0) AND (AD.CD_TIPO_BENEF_PIS_CO' +
        'FINS = 7)) '
      '            THEN '#39'04'#39' '
      '            ELSE CD_CST_PISCOFINS '
      
        '       END                                                      ' +
        '        AS CST_PIS,'
      
        '       0                                                        ' +
        '        AS VL_IOF,'
      '       CONVERT(DECIMAL(15, 2), '
      '               CASE WHEN AD.ALIQ_PIS > 0    '
      
        '                    THEN (DM.VL_PIS_ITEM * 100 / AD.ALIQ_PIS) * ' +
        '100 '
      '                    ELSE 0 '
      '               END) VL_BASE_PIS,'
      '       CONVERT(DECIMAL(15, 2), '
      '               CASE WHEN AD.ALIQ_COFINS > 0 '
      
        '                    THEN (DM.VL_COFINS_ITEM * 100 / AD.ALIQ_COFI' +
        'NS) * 100 '
      '                    ELSE 0 '
      
        '               END)                                     '#9#9#9#9'AS V' +
        'L_BASE_COFINS,'
      '       AD.ALIQ_COFINS * 100 '#9#9#9#9#9#9' '#9#9#9#9#9'AS ALIQ_COFINS,'
      '       0                    '#9#9#9#9#9#9' '#9#9#9#9#9'AS VL_DESP_ADUANEIRA, '
      '      (SELECT PC_ALIQ_NORM_ADVAL '
      '         FROM TRIBUTO TRIB (NOLOCK)'
      '        WHERE TRIB.NR_PROCESSO   = AD.NR_PROCESSO '
      '          AND TRIB.NR_ADICAO     = AD.NR_ADICAO '
      
        '          AND CD_RECEITA_IMPOSTO = '#39'0001'#39')          '#9#9#9#9#9'AS ALIQ' +
        '_II,'
      
        '       DM.PB_MERCADORIA                             '#9#9#9#9#9'AS PB_M' +
        'ERCADORIA,'
      '       ROUND(((AD.VL_BASE_PIS / AD.VL_MERC_COND_VENDA) '
      
        '       * DM.VL_MLE_ITEM) * 100, 4)                      '#9#9#9#9'AS V' +
        'L_BASE_PIS_COFINS_ITEM,'
      
        '       DM.NR_ADICAO                                             ' +
        '        AS NR_ADICAO,'
      
        '       DM.NR_ITEM                                               ' +
        '        AS NR_ITEM,'
      '       DM.NR_PROC_PO'
      'FROM TDECLARACAO_IMPORTACAO         DI  (NOLOCK)'
      
        '   INNER JOIN TADICAO_DE_IMPORTACAO AD  (NOLOCK) ON AD.NR_PROCES' +
        'SO     '#9#9#9#9'= DI.NR_PROCESSO'
      
        '   INNER JOIN TDETALHE_MERCADORIA   DM  (NOLOCK) ON DM.NR_PROCES' +
        'SO     '#9#9#9#9'= AD.NR_PROCESSO '
      
        '                                                AND DM.NR_ADICAO' +
        '       '#9#9#9#9'= AD.NR_ADICAO'
      
        '   INNER JOIN TMERCADORIA           M   (NOLOCK) ON M.CD_MERCADO' +
        'RIA    '#9#9#9#9'= DM.CD_MERCADORIA'
      
        '   LEFT  JOIN TRIBUTO               TRIB(NOLOCK) ON TRIB.NR_PROC' +
        'ESSO   '#9#9#9#9'= AD.NR_PROCESSO '
      
        '                                                AND TRIB.NR_ADIC' +
        'AO     '#9#9#9#9'= AD.NR_ADICAO '
      
        '                                                AND CD_RECEITA_I' +
        'MPOSTO '#9#9#9#9'= '#39'0002'#39
      
        '   LEFT  JOIN TCST_PISCOFINS        CST (NOLOCK) ON CST.CD_TIPO_' +
        'BENEF_PIS_COFINS    = AD.CD_TIPO_BENEF_PIS_COFINS'
      
        '   INNER JOIN TPROCESSO             P   (NOLOCK) ON P.NR_PROCESS' +
        'O                   = DI.NR_PROCESSO'
      
        '   INNER JOIN TUNID_MEDIDA_BROKER   UM  (NOLOCK) ON UM.CD_UNID_M' +
        'EDIDA               = DM.CD_UN_MED_COMERC'
      '   ,TPARAMETROS PA'
      'WHERE AD.NR_PROCESSO = :NR_PROCESSO'
      '  AND DM.NR_ADICAO   = :NR_ADICAO'
      '  '
      '  ')
    Left = 640
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
    object qry_di_exportadores_Tipo: TStringField
      FieldName = 'Tipo'
      FixedChar = True
      Size = 2
    end
    object qry_di_exportadores_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 30
    end
    object qry_di_exportadores_VL_SEGURO_ITEM_MN: TFloatField
      FieldName = 'VL_SEGURO_ITEM_MN'
    end
    object qry_di_exportadores_VL_FRETE_ITEM_MN: TFloatField
      FieldName = 'VL_FRETE_ITEM_MN'
    end
    object qry_di_exportadores_VL_ACRESCIMO_ITEM_MN: TFloatField
      FieldName = 'VL_ACRESCIMO_ITEM_MN'
    end
    object qry_di_exportadores_VL_DEDUCAO_ITEM_MN: TFloatField
      FieldName = 'VL_DEDUCAO_ITEM_MN'
    end
    object qry_di_exportadores_VL_MLE_ITEM_MN: TFloatField
      FieldName = 'VL_MLE_ITEM_MN'
    end
    object qry_di_exportadores_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      FixedChar = True
      Size = 5
    end
    object qry_di_exportadores_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      FixedChar = True
      Size = 5
    end
    object qry_di_exportadores_CD_CFOP: TStringField
      FieldName = 'CD_CFOP'
      FixedChar = True
      Size = 4
    end
    object qry_di_exportadores_ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
    end
    object qry_di_exportadores_CD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      FixedChar = True
      Size = 1
    end
    object qry_di_exportadores_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      FixedChar = True
      Size = 25
    end
    object qry_di_exportadores_MERCADORIA_DI: TMemoField
      FieldName = 'MERCADORIA_DI'
      BlobType = ftMemo
    end
    object qry_di_exportadores_QTDE: TStringField
      FieldName = 'QTDE'
      FixedChar = True
      Size = 255
    end
    object qry_di_exportadores_UNID_MEDIDA: TStringField
      FieldName = 'UNID_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qry_di_exportadores_VL_UNIT: TStringField
      FieldName = 'VL_UNIT'
      FixedChar = True
      Size = 255
    end
    object qry_di_exportadores_CFOP: TStringField
      FieldName = 'CFOP'
      FixedChar = True
      Size = 4
    end
    object qry_di_exportadores_BASE_ICMS: TFloatField
      FieldName = 'BASE_ICMS'
    end
    object qry_di_exportadores_ALIQ_ICMS: TFloatField
      FieldName = 'ALIQ_ICMS'
    end
    object qry_di_exportadores_VL_ICMS_ITEM: TFloatField
      FieldName = 'VL_ICMS_ITEM'
    end
    object qry_di_exportadores_VL_BASE_IPI: TFloatField
      FieldName = 'VL_BASE_IPI'
    end
    object qry_di_exportadores_ALIQ_IPI: TStringField
      FieldName = 'ALIQ_IPI'
      FixedChar = True
      Size = 30
    end
    object qry_di_exportadores_VL_IPI: TFloatField
      FieldName = 'VL_IPI'
    end
    object qry_di_exportadores_VL_MERCADORIA: TFloatField
      FieldName = 'VL_MERCADORIA'
    end
    object qry_di_exportadores_NCM: TStringField
      FieldName = 'NCM'
      FixedChar = True
      Size = 11
    end
    object qry_di_exportadores_NCM_DM: TStringField
      FieldName = 'NCM_DM'
      FixedChar = True
      Size = 11
    end
    object qry_di_exportadores_PO: TStringField
      FieldName = 'PO'
      FixedChar = True
      Size = 18
    end
    object qry_di_exportadores_ITEM_PO: TStringField
      FieldName = 'ITEM_PO'
      FixedChar = True
      Size = 3
    end
    object qry_di_exportadores_NR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
    object qry_di_exportadores_CD_TRIBUTACAO_ICMS: TStringField
      FieldName = 'CD_TRIBUTACAO_ICMS'
      FixedChar = True
      Size = 1
    end
    object qry_di_exportadores_CD_FUND_LEGAL_ICMS: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS'
      FixedChar = True
      Size = 3
    end
    object qry_di_exportadores_CD_TIPO_BENEF_PIS_COFINS: TStringField
      FieldName = 'CD_TIPO_BENEF_PIS_COFINS'
      FixedChar = True
      Size = 1
    end
    object qry_di_exportadores_VL_BASE_CALC_II: TFloatField
      FieldName = 'VL_BASE_CALC_II'
    end
    object qry_di_exportadores_VL_II_ITEM: TFloatField
      FieldName = 'VL_II_ITEM'
    end
    object qry_di_exportadores_QT_MERC_UN_COMERC: TFloatField
      FieldName = 'QT_MERC_UN_COMERC'
    end
    object qry_di_exportadores_VL_DESCONTO_MERC: TFloatField
      FieldName = 'VL_DESCONTO_MERC'
    end
    object qry_di_exportadores_VL_TX_SCX_ITEM: TFloatField
      FieldName = 'VL_TX_SCX_ITEM'
    end
    object qry_di_exportadores_VL_PIS_ITEM: TFloatField
      FieldName = 'VL_PIS_ITEM'
    end
    object qry_di_exportadores_VL_COFINS_ITEM: TFloatField
      FieldName = 'VL_COFINS_ITEM'
    end
    object qry_di_exportadores_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      FixedChar = True
      Size = 3
    end
    object qry_di_exportadores_NR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
    end
    object qry_di_exportadores_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
    end
    object qry_di_exportadores_IN_IPI_NAO_TRIBUT: TBooleanField
      FieldName = 'IN_IPI_NAO_TRIBUT'
    end
    object qry_di_exportadores_CD_TIPO_BENEF_IPI: TStringField
      FieldName = 'CD_TIPO_BENEF_IPI'
      FixedChar = True
      Size = 1
    end
    object qry_di_exportadores_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_di_exportadores_VL_BASE_IPI_UNITARIO: TFloatField
      FieldName = 'VL_BASE_IPI_UNITARIO'
    end
    object qry_di_exportadores_VL_BASE_ICMS_UNITARIO: TFloatField
      FieldName = 'VL_BASE_ICMS_UNITARIO'
    end
    object qry_di_exportadores_VL_ICMS_A_RECOLHER: TFloatField
      FieldName = 'VL_ICMS_A_RECOLHER'
    end
    object qry_di_exportadores_CD_DIREITO_FISCAL_ICMS: TStringField
      FieldName = 'CD_DIREITO_FISCAL_ICMS'
      FixedChar = True
      Size = 3
    end
    object qry_di_exportadores_CD_DIREITO_FISCAL_IPI: TStringField
      FieldName = 'CD_DIREITO_FISCAL_IPI'
      FixedChar = True
      Size = 3
    end
    object qry_di_exportadores_CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      FixedChar = True
      Size = 2
    end
    object qry_di_exportadores_CD_TIPO_BENEF_PIS_COFINS_1: TStringField
      FieldName = 'CD_TIPO_BENEF_PIS_COFINS_1'
      FixedChar = True
      Size = 1
    end
    object qry_di_exportadores_CST_PIS: TStringField
      FieldName = 'CST_PIS'
      FixedChar = True
      Size = 2
    end
    object qry_di_exportadores_VL_IOF: TIntegerField
      FieldName = 'VL_IOF'
    end
    object qry_di_exportadores_VL_BASE_PIS: TFloatField
      FieldName = 'VL_BASE_PIS'
    end
    object qry_di_exportadores_VL_BASE_COFINS: TFloatField
      FieldName = 'VL_BASE_COFINS'
    end
    object qry_di_exportadores_ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
    end
    object qry_di_exportadores_VL_DESP_ADUANEIRA: TIntegerField
      FieldName = 'VL_DESP_ADUANEIRA'
    end
    object qry_di_exportadores_ALIQ_II: TFloatField
      FieldName = 'ALIQ_II'
    end
    object qry_di_exportadores_PB_MERCADORIA: TFloatField
      FieldName = 'PB_MERCADORIA'
    end
    object qry_di_exportadores_VL_BASE_PIS_COFINS_ITEM: TFloatField
      FieldName = 'VL_BASE_PIS_COFINS_ITEM'
    end
    object qry_di_exportadores_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
    object qry_di_exportadores_NR_PROC_PO: TStringField
      FieldName = 'NR_PROC_PO'
      FixedChar = True
      Size = 30
    end
  end
  object qry_di_exportador_adicao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '#39'N2'#39' Tipo,'
      '       DM.CD_MERCADORIA,'
      '       --utilizados nas celulas ocultas (EXCEL)'
      '       ROUND(DM.VL_SEGURO_ITEM_MN, 2) AS VL_SEGURO_ITEM_MN,'
      '       ROUND(DM.VL_FRETE_ITEM_MN, 2) AS VL_FRETE_ITEM_MN,'
      
        '       ROUND(DM.VL_ACRESCIMO_ITEM_MN, 2) AS VL_ACRESCIMO_ITEM_MN' +
        ','
      
        '       ROUND(ISNULL(DM.VL_DEDUCAO_ITEM_MN, 0), 2) AS VL_DEDUCAO_' +
        'ITEM_MN,'
      
        '       ROUND(DM.VL_MLE_ITEM_MN + ISNULL(DM.VL_DESPESA_ITEM_MN, 0' +
        '), 2) AS VL_MLE_ITEM_MN,'
      '       --fim'
      '       case isnull(dm.cd_fabricante,'#39#39')'
      '            when '#39#39' then dm.cd_exportador'
      '            else dm.cd_fabricante'
      '       end CD_FABRICANTE,'
      '       dm.CD_EXPORTADOR CD_FORNECEDOR,'
      '       ad.CD_CFOP,'
      '       ad.ALIQ_PIS, ad.CD_REGIME_TRIBUTAR,'
      '       M.AP_MERCADORIA,'
      '       DM.TX_DESC_DET_MERC MERCADORIA_DI,'
      
        '       REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(28, 3), DM.QT_ME' +
        'RC_UN_COMERC, 3)), '#39'.'#39', '#39#39') AS QTDE, --ROUND(DM.QT_MERC_UN_COMER' +
        'C,3) * 1000 QTDE,'
      '       UM.NM_SIGLA AS UNID_MEDIDA,'
      
        '       REPLACE(CONVERT(VARCHAR, CONVERT(DECIMAL(28, 6), (ROUND((' +
        'DM.VL_BASE_CALC_II + DM.VL_II_ITEM) / ROUND(DM.QT_MERC_UN_COMERC' +
        ',3), 9)), 9)), '#39'.'#39', '#39#39') AS VL_UNIT,'
      '       '#39'CFOP'#39' AS CFOP,'
      '       ROUND(DM.VL_BASE_ICMS_ITEM,2) * 100 AS BASE_ICMS,'
      '       (AD.PC_ICMS + CASE ISNULL(AD.IN_FUNDO_POBREZA, '#39'0'#39')'
      '                         WHEN '#39'0'#39' THEN 0'
      '                     ELSE PA.PC_FUNDO_POBREZA_RJ'
      '                     END) * 100 AS ALIQ_ICMS,'
      
        '       ROUND(DM.VL_BASE_ICMS_ITEM * (AD.PC_ICMS/100),2) * 100 AS' +
        ' VL_ICMS_ITEM,'
      
        '       ROUND((DM.VL_BASE_CALC_II + DM.VL_II_ITEM), 2) * 100 AS V' +
        'L_BASE_IPI,'
      '       CASE WHEN (TRIB.PC_ALIQ_NORM_ADVAL * 100) = 0 THEN '#39'000'#39
      '       ELSE CONVERT(VARCHAR, TRIB.PC_ALIQ_NORM_ADVAL * 100)'
      '       END AS ALIQ_IPI,'
      '       CASE WHEN (ROUND(DM.VL_IPI_ITEM,2) * 100) = 0 THEN 0'
      '       ELSE ROUND(DM.VL_IPI_ITEM,2) * 100'
      '       END AS VL_IPI,'
      
        '       ROUND((DM.VL_BASE_CALC_II + DM.VL_II_ITEM), 2) * 100 AS V' +
        'L_MERCADORIA,'
      '       M.CD_NCM_SH AS NCM,'
      '       DM.CD_NCM_SH AS NCM_DM,'
      '       DM.NR_PROC_PO AS PO,'
      '       SUBSTRING(DM.NR_ITEM_PO, 2,3) AS ITEM_PO,'
      '       DM.NR_ITEM_PO,'
      '       AD.CD_TRIBUTACAO_ICMS,'
      '       AD.CD_FUND_LEGAL_ICMS,'
      '       AD.CD_TIPO_BENEF_PIS_COFINS,'
      '       ROUND(DM.VL_BASE_CALC_II, 2) AS VL_BASE_CALC_II,'
      '       ROUND(DM.VL_II_ITEM, 2) AS VL_II_ITEM,'
      '       DM.QT_MERC_UN_COMERC,'
      '       ROUND(DM.VL_DESCONTO_MERC * 100, 2) AS VL_DESCONTO_MERC,'
      '       ROUND(DM.VL_TX_SCX_ITEM, 2) AS VL_TX_SCX_ITEM,'
      '       ROUND(DM.VL_PIS_ITEM, 2) AS VL_PIS_ITEM,'
      '       ROUND(DM.VL_COFINS_ITEM, 2) AS VL_COFINS_ITEM,'
      '       DM.NR_ADICAO,'
      '       DM.NR_PARCIAL,'
      '       DM.PL_MERCADORIA,'
      '       AD.IN_IPI_NAO_TRIBUT,       '
      '       TRIB.CD_TIPO_BENEF_IPI,'
      '       DI.NR_PROCESSO,'
      
        '       (DM.VL_BASE_CALC_II + DM.VL_II_ITEM) / DM.QT_MERC_UN_COME' +
        'RC AS VL_BASE_IPI_UNITARIO,'
      '       CASE WHEN AD.PC_ICMS = 0 THEN 0 ELSE'
      
        '       (ROUND(DM.VL_BASE_CALC_II, 2) + ROUND(DM.VL_II_ITEM, 2) +' +
        ' ROUND(DM.VL_IPI_ITEM, 2) + ROUND(DM.VL_TX_SCX_ITEM, 2) + ROUND(' +
        'DM.VL_PIS_ITEM, 2) +'
      
        '          ROUND(DM.VL_COFINS_ITEM, 2)) / ((100 - AD.PC_ICMS - CA' +
        'SE ISNULL(AD.IN_FUNDO_POBREZA, '#39'0'#39')'
      
        '                                                                ' +
        '  WHEN '#39'0'#39' THEN 0'
      
        '                                                              EL' +
        'SE PA.PC_FUNDO_POBREZA_RJ'
      
        '                                                              EN' +
        'D) / 100) * ((AD.PC_ICMS + CASE ISNULL(AD.IN_FUNDO_POBREZA, '#39'0'#39')'
      
        '                                                                ' +
        '                               WHEN '#39'0'#39' THEN 0'
      
        '                                                                ' +
        '                           ELSE PA.PC_FUNDO_POBREZA_RJ'
      
        '                                                                ' +
        '                           END) / 100) * 100 / (AD.PC_ICMS + CAS' +
        'E ISNULL(AD.IN_FUNDO_POBREZA, '#39'0'#39')'
      
        '                                                                ' +
        '                                                                ' +
        ' WHEN '#39'0'#39' THEN 0'
      
        '                                                                ' +
        '                                                             ELS' +
        'E PA.PC_FUNDO_POBREZA_RJ'
      
        '                                                                ' +
        '                                                             END' +
        ') / DM.QT_MERC_UN_COMERC END AS VL_BASE_ICMS_UNITARIO,'
      '    AD.VL_ICMS_A_RECOLHER,'
      
        '    CASE AD.CD_TRIBUTACAO_ICMS WHEN '#39'1'#39' THEN '#39'C23'#39' WHEN '#39'7'#39' THEN' +
        ' '#39'D66'#39' WHEN '#39'5'#39' THEN '#39'D04'#39' WHEN '#39'3'#39' THEN '#39'D06'#39' END CD_DIREITO_FI' +
        'SCAL_ICMS, '
      
        '    CASE IN_IPI_NAO_TRIBUT  WHEN '#39'1'#39' THEN '#39'P15'#39' ELSE CASE WHEN C' +
        'D_TIPO_BENEF_IPI = '#39'4'#39' THEN '#39'P14'#39' ELSE '#39'P16'#39' END END CD_DIREITO_' +
        'FISCAL_IPI,'
      
        '    CASE WHEN ((AD.ALIQ_PIS = 0) AND (AD.CD_TIPO_BENEF_PIS_COFIN' +
        'S = 7)) THEN '#39'04'#39' ELSE CD_CST_PISCOFINS END CST_COFINS, AD.CD_TI' +
        'PO_BENEF_PIS_COFINS,'
      
        '    CASE WHEN ((AD.ALIQ_PIS = 0) AND (AD.CD_TIPO_BENEF_PIS_COFIN' +
        'S = 7)) THEN '#39'04'#39' ELSE CD_CST_PISCOFINS END CST_PIS,'
      '    0 VL_IOF,'
      
        '    CONVERT(DECIMAL(15, 2), CASE WHEN AD.ALIQ_PIS > 0 THEN (DM.V' +
        'L_PIS_ITEM * 100 / AD.ALIQ_PIS) * 100 ELSE 0 END) VL_BASE_PIS,'
      
        '    CONVERT(DECIMAL(15, 2), CASE WHEN AD.ALIQ_COFINS > 0 THEN (D' +
        'M.VL_COFINS_ITEM * 100 / AD.ALIQ_COFINS) * 100 ELSE 0 END) VL_BA' +
        'SE_COFINS,'
      '    AD.ALIQ_COFINS * 100 ALIQ_COFINS,'
      
        '    0 VL_DESP_ADUANEIRA, (SELECT PC_ALIQ_NORM_ADVAL FROM TRIBUTO' +
        ' TRIB WHERE TRIB.NR_PROCESSO = AD.NR_PROCESSO AND TRIB.NR_ADICAO' +
        ' = AD.NR_ADICAO AND CD_RECEITA_IMPOSTO = '#39'0001'#39') ALIQ_II,'
      '    DM.PB_MERCADORIA,'
      
        '    ROUND(((AD.VL_BASE_PIS / AD.VL_MERC_COND_VENDA) * DM.VL_MLE_' +
        'ITEM) * 100, 4) AS VL_BASE_PIS_COFINS_ITEM'
      'FROM TDECLARACAO_IMPORTACAO DI'
      
        '   INNER JOIN TADICAO_DE_IMPORTACAO AD ON AD.NR_PROCESSO = DI.NR' +
        '_PROCESSO'
      
        '   INNER JOIN TDETALHE_MERCADORIA DM ON DM.NR_PROCESSO = AD.NR_P' +
        'ROCESSO AND DM.NR_ADICAO = AD.NR_ADICAO'
      
        '   INNER JOIN TMERCADORIA M ON M.CD_MERCADORIA = DM.CD_MERCADORI' +
        'A'
      
        '   LEFT JOIN TRIBUTO TRIB ON TRIB.NR_PROCESSO = AD.NR_PROCESSO A' +
        'ND TRIB.NR_ADICAO = AD.NR_ADICAO AND CD_RECEITA_IMPOSTO = '#39'0002'#39
      
        '   LEFT JOIN TCST_PISCOFINS CST ON CST.CD_TIPO_BENEF_PIS_COFINS ' +
        '= AD.CD_TIPO_BENEF_PIS_COFINS'
      
        '   INNER JOIN TUNID_MEDIDA_BROKER UM ON UM.CD_UNID_MEDIDA = DM.C' +
        'D_UN_MED_COMERC,'
      '   TPARAMETROS PA'
      'WHERE AD.NR_PROCESSO = :NR_PROCESSO')
    Left = 643
    Top = 298
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
  end
  object qry_di_arcor: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DI.NR_DECLARACAO_IMP,'
      '       E.NM_EMPRESA,'
      '       DI.DT_REGISTRO_DI,'
      
        '       ISNULL(REPLACE(CONVERT(VARCHAR, FUP.DT_REALIZACAO, 103),'#39 +
        '/'#39','#39#39'), '#39#39') AS DT_REALIZACAO,'
      '       URF.DESCRICAO,'
      '       URF.END_UF,'
      '       DI.VL_TOT_MLE_MNEG,'
      '       SUM(AD.VL_BASE_CALC_ICMS) AS VL_BASE_CALC_ICMS,'
      
        '       SUM(AD.VL_BASE_CALC_ICMS_AFRMM) AS VL_BASE_CALC_ICMS_AFRM' +
        'M,'
      '       DI.CD_APLICACAO_MERC      '
      'FROM TDECLARACAO_IMPORTACAO DI'
      '   INNER JOIN TPROCESSO P ON P.NR_PROCESSO = DI.NR_PROCESSO'
      '   INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_CLIENTE'
      '   INNER JOIN TURF URF ON URF.CODIGO = DI.CD_URF_DESPACHO'
      '   INNER JOIN TFOLLOWUP FUP ON FUP.NR_PROCESSO = DI.NR_PROCESSO'
      
        '   INNER JOIN TADICAO_DE_IMPORTACAO AD ON AD.NR_PROCESSO = DI.NR' +
        '_PROCESSO'
      'WHERE DI.NR_PROCESSO = :NR_PROCESSO'
      '  AND FUP.CD_EVENTO = '#39'088'#39
      'GROUP BY DI.NR_DECLARACAO_IMP,'
      '         E.NM_EMPRESA,'
      '         DI.DT_REGISTRO_DI,'
      
        '         ISNULL(REPLACE(CONVERT(VARCHAR, FUP.DT_REALIZACAO, 103)' +
        ','#39'/'#39','#39#39'), '#39#39'),'
      '         URF.DESCRICAO,'
      '         URF.END_UF,'
      '         DI.VL_TOT_MLE_MNEG,'
      '         DI.CD_APLICACAO_MERC ')
    Left = 72
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_di_itens_arcor: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DM.NR_PROCESSO,'
      #9'   DM.NR_FATURA,'
      '       LEFT(DM.CD_MERCADORIA, 11) AS CD_MERCADORIA,'
      #9'   CONVERT(VARCHAR(500), DM.TX_DESC_DET_MERC) TX_DESC_DET_MERC,'
      #9'   DM.CD_NCM_SH,'
      '       SUM(DM.QT_MERC_UN_COMERC) '#39'QT_MERC_UN_COMERC'#39','
      
        #9'   SUM(DM.VL_MLE_ITEM_MN + ISNULL(DM.VL_DESPESA_ITEM_MN, 0)) VL' +
        '_MLE_ITEM_MN,'
      #9'   SUM(DM.VL_FRETE_ITEM_MN) VL_FRETE_ITEM_MN,'
      #9'   SUM(DM.VL_SEGURO_ITEM_MN) VL_SEGURO_ITEM_MN,'
      #9'   SUM(DM.VL_ACRESCIMO_ITEM_MN) VL_ACRESCIMO_ITEM_MN,'
      #9'   SUM(DM.VL_DEDUCAO_ITEM_MN) VL_DEDUCAO_ITEM_MN,'
      #9'   SUM(DM.VL_II_ITEM) VL_II_ITEM,'
      #9'   (AD.PC_ICMS + CASE ISNULL(AD.IN_FUNDO_POBREZA, '#39'0'#39')'
      '                     WHEN '#39'0'#39' THEN 0'
      '                     ELSE PA.PC_FUNDO_POBREZA_RJ'
      '                     END) AS ALIQ_ICMS,'
      '       SUM(DM.VL_ICMS_ITEM) VL_ICMS_ITEM,                    '
      
        '       ISNULL(CASE WHEN (TRIB.PC_ALIQ_NORM_ADVAL * 100) = 0 THEN' +
        ' '#39'000'#39
      
        '              ELSE CONVERT(VARCHAR, TRIB.PC_ALIQ_NORM_ADVAL * 10' +
        '0)'
      '              END, 0) AS ALIQ_IPI,'
      
        '       ISNULL(TRIB2.PC_ALIQ_NORM_ADVAL, 0) AS PC_ALIQ_NORM_ADVAL' +
        ','
      
        '       ISNULL(TRIB2.PC_ALIQ_ACOR_TARIF, 0) AS PC_ALIQ_ACOR_TARIF' +
        ','
      '       ISNULL(TRIB2.PC_ALIQ_REDUZIDA, 0) AS PC_ALIQ_REDUZIDA,'
      '       AD.CD_REGIME_TRIBUTAR,'
      '       SUM(DM.VL_IPI_ITEM) VL_IPI_ITEM,'
      '       DI.TX_MLE,'
      '       DI.TX_DOLAR,'
      
        '       SUM(DM.VL_MLE_ITEM + ISNULL(DM.VL_DESPESA_ITEM, 0)) VL_ML' +
        'E_ITEM,'
      '       DI.CD_TRIBUTACAO_ICMS,'
      '       ISNULL(DI.CD_REG_TRIB_IPI, '#39#39') AS CD_REG_TRIB_IPI,'
      '       DI.CD_REG_TRIB_II,'
      '       SUM(DM.PL_MERCADORIA) AS PL_MERCADORIA_ITEM,'
      '       SUM(DM.PB_MERCADORIA) PB_MERCADORIA,'
      '       ROUND(DM.VL_UNITARIO, 3) AS VL_UNITARIO,'
      '       ISNULL(AD.CD_FUND_LEGAL_ICMS, 0) AS CD_FUND_LEGAL_ICMS,'
      '       SUM(DM.VL_BASE_CALC_II) VL_BASE_CALC_II,'
      '       SUM(DM.VL_TX_SCX_ITEM) VL_TX_SCX_ITEM,'
      '       SUM(DM.VL_PIS_ITEM) VL_PIS_ITEM,'
      '       AD.ALIQ_PIS,'
      '       AD.VL_BASE_PIS VL_BASE_PIS,'
      '       SUM(DM.VL_COFINS_ITEM) VL_COFINS_ITEM,'
      '       AD.ALIQ_COFINS,'
      '       ISNULL(AV.NR_EX_ATO_VINCUL, '#39#39') AS NR_EX_ATO_VINCUL,'
      '       SUM(DM.VL_DESCONTO_MERC) VL_DESCONTO_MERC,'
      '       SUM(DM.VL_BASE_ICMS_ITEM) VL_BASE_ICMS_ITEM,'
      '       DM.CD_UN_MED_COMERC,'
      '       AD.PL_MERCADORIA AS PL_MERCADORIA_ADICAO,'
      '       AD.VL_BASE_CALC_ICMS VL_BASE_CALC_ICMS,'
      '       AD.VL_BASE_CALC_IPI VL_BASE_CALC_IPI,'
      '       AD.VL_BASE_CALC_ICMS_AFRMM VL_BASE_CALC_ICMS_AFRMM,'
      
        '       SUM(ROUND(((DM.PL_MERCADORIA/AD.PL_MERCADORIA)*AD.VL_BASE' +
        '_CALC_IPI), 2)) AS BASE_IPI_ITEM,'
      
        '       SUM(ROUND(((DM.PL_MERCADORIA/AD.PL_MERCADORIA)*AD.VL_BASE' +
        '_CALC_ICMS_AFRMM), 2)) AS VL_BASE_ICMS_ITEM_AFRMM,'
      
        '       SUM(ROUND((((DM.PL_MERCADORIA/AD.PL_MERCADORIA)*AD.VL_BAS' +
        'E_CALC_ICMS_AFRMM)*((AD.PC_ICMS + CASE ISNULL(AD.IN_FUNDO_POBREZ' +
        'A, '#39'0'#39')'
      #9#9#9#9#9#9#9#9' '#9'                   WHEN '#39'0'#39' THEN 0'
      #9#9#9#9#9#9#9#9#9#9'ELSE PA.PC_FUNDO_POBREZA_RJ'
      #9#9#9#9#9#9#9#9#9#9'END)/100)), 2)) AS VL_ICMS_ITEM_AFRMM,'
      
        '       (SELECT SUM(PL_MERCADORIA) FROM TADICAO_DE_IMPORTACAO WHE' +
        'RE NR_PROCESSO = :NR_PROCESSO) AS PL_MERCADORIA_TOTAL,'
      '       ROUND(CASE ISNULL(AD.VL_ALIQUOTA_ESPECIFICA_PIS, 0)'
      
        '                 WHEN 0 THEN (AD.VL_BASE_PIS / AD.VL_MERC_LOC_EM' +
        'B_MN) * SUM(DM.VL_MLE_ITEM_MN)'
      
        '             ELSE ((AD.VL_ALIQUOTA_ESPECIFICA_PIS * AD.QTD_UNID_' +
        'ESPECIFICA_PIS) / AD.VL_MERC_LOC_EMB_MN) * SUM(DM.VL_MLE_ITEM_MN' +
        ')'
      '             END, 2) AS VL_BASE_PIS_ITEM'
      #9'   FROM TDETALHE_MERCADORIA DM'
      
        'INNER JOIN TDECLARACAO_IMPORTACAO DI ON DI.NR_PROCESSO = DM.NR_P' +
        'ROCESSO'
      
        'LEFT JOIN TATO_VINCULADO AV ON AV.NR_PROCESSO = DM.NR_PROCESSO A' +
        'ND AV.NR_ADICAO = DM.NR_ADICAO'
      
        'INNER JOIN TADICAO_DE_IMPORTACAO AD ON AD.NR_PROCESSO = DM.NR_PR' +
        'OCESSO AND DM.NR_ADICAO = AD.NR_ADICAO'
      
        'LEFT  JOIN TRIBUTO TRIB ON TRIB.NR_PROCESSO = DM.NR_PROCESSO AND' +
        ' DM.NR_ADICAO = TRIB.NR_ADICAO AND TRIB.CD_RECEITA_IMPOSTO = '#39'00' +
        '02'#39
      
        'LEFT  JOIN TRIBUTO TRIB2 ON TRIB2.NR_PROCESSO = DM.NR_PROCESSO A' +
        'ND DM.NR_ADICAO = TRIB2.NR_ADICAO AND TRIB2.CD_RECEITA_IMPOSTO =' +
        ' '#39'0001'#39','
      'TPARAMETROS PA'
      'WHERE DM.NR_PROCESSO = :NR_PROCESSO'
      'GROUP BY DM.NR_PROCESSO,'
      #9'   DM.NR_FATURA,'
      '       DM.CD_MERCADORIA,'
      #9'   CONVERT(VARCHAR(500), DM.TX_DESC_DET_MERC),'
      #9'   DM.CD_NCM_SH,'
      '       TRIB.PC_ALIQ_NORM_ADVAL,'
      '       TRIB2.PC_ALIQ_NORM_ADVAL,'
      '       TRIB2.PC_ALIQ_ACOR_TARIF,'
      '       TRIB2.PC_ALIQ_REDUZIDA,'
      '       AD.CD_REGIME_TRIBUTAR,'
      '       DI.TX_MLE,'
      '       DI.TX_DOLAR,'
      '       DI.CD_TRIBUTACAO_ICMS,'
      '       DI.CD_REG_TRIB_IPI,'
      '       DI.CD_REG_TRIB_II,'
      '       AD.CD_FUND_LEGAL_ICMS,'
      '       AD.ALIQ_PIS,'
      '       AD.ALIQ_COFINS,'
      '       AV.NR_EX_ATO_VINCUL,'
      '       DM.CD_UN_MED_COMERC,'
      '       AD.PC_ICMS,'
      '       AD.IN_FUNDO_POBREZA,'
      '       PA.PC_FUNDO_POBREZA_RJ,'
      '       ROUND(DM.VL_UNITARIO, 3),'
      '       AD.VL_BASE_PIS,'
      '       AD.VL_BASE_CALC_ICMS,'
      '       AD.VL_BASE_CALC_IPI,'
      '       AD.VL_BASE_CALC_ICMS_AFRMM,'
      '       AD.PL_MERCADORIA,'
      '       ISNULL(AD.VL_ALIQUOTA_ESPECIFICA_PIS, 0),'
      '       AD.VL_MERC_LOC_EMB_MN,'
      '       AD.VL_ALIQUOTA_ESPECIFICA_PIS,'
      '       AD.QTD_UNID_ESPECIFICA_PIS')
    Left = 16
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_vw_resumo_di: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM VW_RESUMO_DI'
      'WHERE NR_PROCESSO_COMPLETO = :NR_PROCESSO')
    Left = 40
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qry_di_itens_arcor_filhote: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DM.NR_PROCESSO,'
      #9'   DM.NR_FATURA,'
      '       LEFT(DM.CD_MERCADORIA, 11) AS CD_MERCADORIA,'
      #9'   DM.TX_DESC_DET_MERC,'
      #9'   DM.CD_NCM_SH,'
      '       DM.QT_MERC_UN_COMERC,'
      
        #9'   DM.VL_MLE_ITEM_MN + ISNULL(DM.VL_DESPESA_ITEM_MN, 0) AS VL_M' +
        'LE_ITEM_MN,'
      #9'   DM.VL_FRETE_ITEM_MN,'
      #9'   DM.VL_SEGURO_ITEM_MN,'
      #9'   DM.VL_ACRESCIMO_ITEM_MN,'
      #9'   DM.VL_DEDUCAO_ITEM_MN,'
      #9'   DM.VL_II_ITEM,'
      #9'   (AD.PC_ICMS + CASE ISNULL(AD.IN_FUNDO_POBREZA, '#39'0'#39')'
      '                     WHEN '#39'0'#39' THEN 0'
      '                     ELSE PA.PC_FUNDO_POBREZA_RJ'
      '                     END) AS ALIQ_ICMS,'
      '       DM.VL_ICMS_ITEM,                    '
      '       CASE WHEN (TRIB.PC_ALIQ_NORM_ADVAL * 100) = 0 THEN '#39'000'#39
      '       ELSE CONVERT(VARCHAR, TRIB.PC_ALIQ_NORM_ADVAL * 100)'
      '       END AS ALIQ_IPI,'
      '       TRIB2.PC_ALIQ_NORM_ADVAL,'
      '       TRIB2.PC_ALIQ_ACOR_TARIF,'
      '       TRIB2.PC_ALIQ_REDUZIDA,'
      '       AD.CD_REGIME_TRIBUTAR,'
      '       DM.VL_IPI_ITEM,'
      '       DI.TX_MLE,'
      '       DI.TX_DOLAR,'
      
        '       DM.VL_MLE_ITEM + ISNULL(DM.VL_DESPESA_ITEM, 0) AS VL_MLE_' +
        'ITEM,'
      '       DI.CD_TRIBUTACAO_ICMS,'
      '       DI.CD_REG_TRIB_IPI,'
      '       DI.CD_REG_TRIB_II,'
      '       DM.PL_MERCADORIA AS PL_MERCADORIA_ITEM,'
      '       DM.PB_MERCADORIA,'
      '       DM.VL_UNITARIO,'
      '       ISNULL(AD.CD_FUND_LEGAL_ICMS, 0) AS CD_FUND_LEGAL_ICMS,'
      '       DM.VL_BASE_CALC_II,'
      '       DM.VL_TX_SCX_ITEM,'
      '       DM.VL_PIS_ITEM,'
      '       AD.ALIQ_PIS,'
      '       AD.VL_BASE_PIS,'
      '       DM.VL_COFINS_ITEM,'
      '       AD.ALIQ_COFINS,'
      '       ISNULL(AV.NR_EX_ATO_VINCUL, '#39#39') AS NR_EX_ATO_VINCUL,'
      '       DM.VL_DESCONTO_MERC,'
      '       DM.VL_BASE_ICMS_ITEM,'
      '       DM.CD_UN_MED_COMERC,'
      '       AD.PL_MERCADORIA AS PL_MERCADORIA_ADICAO,'
      '       AD.VL_BASE_CALC_ICMS,'
      '       AD.VL_BASE_CALC_IPI,'
      '       AD.VL_BASE_CALC_ICMS_AFRMM,'
      '       AD.VL_BASE_CALC_ICMS_AFRMM,'
      
        '       ROUND(((DM.PL_MERCADORIA/AD.PL_MERCADORIA)*AD.VL_BASE_CAL' +
        'C_IPI), 2) AS BASE_IPI_ITEM,'
      
        '       ROUND(((DM.PL_MERCADORIA/AD.PL_MERCADORIA)*AD.VL_BASE_CAL' +
        'C_ICMS_AFRMM), 2) AS VL_BASE_ICMS_ITEM_AFRMM,'
      
        '       ROUND((((DM.PL_MERCADORIA/AD.PL_MERCADORIA)*AD.VL_BASE_CA' +
        'LC_ICMS_AFRMM)*((AD.PC_ICMS + CASE ISNULL(AD.IN_FUNDO_POBREZA, '#39 +
        '0'#39')'
      #9#9#9#9#9#9#9#9' '#9'                   WHEN '#39'0'#39' THEN 0'
      #9#9#9#9#9#9#9#9#9#9'ELSE PA.PC_FUNDO_POBREZA_RJ'
      #9#9#9#9#9#9#9#9#9#9'END)/100)), 2) AS VL_ICMS_ITEM_AFRMM'
      #9'   FROM TDETALHE_MERCADORIA DM'
      
        'INNER JOIN TDECLARACAO_IMPORTACAO DI ON DI.NR_PROCESSO = DM.NR_P' +
        'ROCESSO'
      
        'LEFT JOIN TATO_VINCULADO AV ON AV.NR_PROCESSO = DM.NR_PROCESSO A' +
        'ND AV.NR_ADICAO = DM.NR_ADICAO'
      
        'INNER JOIN TADICAO_DE_IMPORTACAO AD ON AD.NR_PROCESSO = DM.NR_PR' +
        'OCESSO AND DM.NR_ADICAO = AD.NR_ADICAO'
      
        'INNER JOIN TRIBUTO TRIB ON TRIB.NR_PROCESSO = DM.NR_PROCESSO AND' +
        ' DM.NR_ADICAO = TRIB.NR_ADICAO AND TRIB.CD_RECEITA_IMPOSTO = '#39'00' +
        '02'#39
      
        'INNER JOIN TRIBUTO TRIB2 ON TRIB2.NR_PROCESSO = DM.NR_PROCESSO A' +
        'ND DM.NR_ADICAO = TRIB2.NR_ADICAO AND TRIB2.CD_RECEITA_IMPOSTO =' +
        ' '#39'0001'#39','
      'TPARAMETROS PA'
      'WHERE DM.NR_PROCESSO = :NR_PROCESSO'
      'AND DM.NR_PROC_PO = :NR_PROC_PO'
      'AND DM.NR_ITEM_PO = :NR_ITEM_PO'
      'AND DM.NR_ADICAO = :NR_ADICAO'
      'AND DM.NR_PARCIAL = :NR_PARCIAL')
    Left = 40
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_PROC_PO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ITEM_PO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_PARCIAL'
        ParamType = ptUnknown
      end>
  end
  object qryItemComplementar: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DM.NR_PROC_PO, DM.NR_ITEM_PO, DM.NR_ADICAO, RTRIM(DM.CD_M' +
        'ERCADORIA) AS CD_MERCADORIA, SUM(DM.PL_MERCADORIA) VL_RATEIO, UM' +
        '.NM_SIGLA AS UNID_MEDIDA'
      'FROM TDETALHE_MERCADORIA DM'
      
        '   INNER JOIN TUNID_MEDIDA_BROKER UM ON UM.CD_UNID_MEDIDA = DM.C' +
        'D_UN_MED_COMERC'
      'WHERE DM.NR_PROCESSO = :NR_PROCESSO'
      
        'GROUP BY DM.NR_PROC_PO, DM.NR_ITEM_PO, DM.NR_ADICAO, DM.CD_MERCA' +
        'DORIA, UM.NM_SIGLA')
    Left = 32
    Top = 368
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
  end
  object qryFunctionTxt: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM FN_NF_DYSTAR(:NR_PROCESSO)'
      'ORDER BY /*CD_TRIBUTACAO_ICMS, NR_TIPO, */NR_ORDEM')
    Left = 336
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = '0101IM-5415-13'
      end>
    object qryFunctionTxtNR_TIPO: TIntegerField
      FieldName = 'NR_TIPO'
    end
    object qryFunctionTxtNR_ORDEM: TIntegerField
      FieldName = 'NR_ORDEM'
    end
    object qryFunctionTxtTX_LINHA: TMemoField
      FieldName = 'TX_LINHA'
      BlobType = ftMemo
    end
  end
  object upd_nota_filhote: TUpdateSQL
    ModifySQL.Strings = (
      'update TNOTA_FILHOTE'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_CFOP = :CD_CFOP,'
      '  CD_ITEM = :CD_ITEM,'
      '  CD_MERCADORIA = :CD_MERCADORIA,'
      '  AP_MERCADORIA = :AP_MERCADORIA,'
      '  PL_MERCADORIA = :PL_MERCADORIA,'
      '  QTDE_COMERC = :QTDE_COMERC,'
      '  QTDE_BAIXADA = :QTDE_BAIXADA,'
      '  NM_UNID_MEDIDA = :NM_UNID_MEDIDA,'
      '  NR_PROC_PO = :NR_PROC_PO,'
      '  NR_ITEM_PO = :NR_ITEM_PO,'
      '  NR_ADICAO = :NR_ADICAO,'
      '  NR_PARCIAL = :NR_PARCIAL,'
      '  PL_BAIXADA = :PL_BAIXADA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_CFOP = :OLD_CD_CFOP and'
      '  CD_ITEM = :OLD_CD_ITEM')
    InsertSQL.Strings = (
      'insert into TNOTA_FILHOTE'
      
        '  (NR_PROCESSO, CD_CFOP, CD_ITEM, CD_MERCADORIA, AP_MERCADORIA, ' +
        'PL_MERCADORIA, '
      
        '   QTDE_COMERC, QTDE_BAIXADA, NM_UNID_MEDIDA, NR_PROC_PO, NR_ITE' +
        'M_PO, NR_ADICAO, '
      '   NR_PARCIAL, PL_BAIXADA)'
      'values'
      
        '  (:NR_PROCESSO, :CD_CFOP, :CD_ITEM, :CD_MERCADORIA, :AP_MERCADO' +
        'RIA, :PL_MERCADORIA, '
      
        '   :QTDE_COMERC, :QTDE_BAIXADA, :NM_UNID_MEDIDA, :NR_PROC_PO, :N' +
        'R_ITEM_PO, '
      '   :NR_ADICAO, :NR_PARCIAL, :PL_BAIXADA)')
    DeleteSQL.Strings = (
      'delete from TNOTA_FILHOTE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_CFOP = :OLD_CD_CFOP and'
      '  CD_ITEM = :OLD_CD_ITEM')
    Left = 126
    Top = 206
  end
  object qry_di_container: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DECLARE @NR_PROCESSO VARCHAR(18)'
      'SET @NR_PROCESSO = :NR_PROCESSO'
      ''
      'SELECT B.NR_CNTR'
      'FROM TPROCESSO      A WITH(NOLOCK)'
      
        'JOIN TPROCESSO_CNTR B WITH(NOLOCK) ON B.NR_PROCESSO = A.NR_PROCE' +
        'SSO'
      'WHERE A.CD_CLIENTE = '#39'00500'#39
      'AND  A.NR_PROCESSO = @NR_PROCESSO')
    Left = 512
    Top = 408
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 18
      end>
  end
end

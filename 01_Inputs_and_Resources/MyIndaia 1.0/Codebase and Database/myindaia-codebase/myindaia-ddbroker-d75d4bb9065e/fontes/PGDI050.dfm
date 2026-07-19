object frm_di_libera: Tfrm_di_libera
  Left = 247
  Top = 159
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Libera'#231#227'o de DI'#180's - Valores Altos'
  ClientHeight = 434
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_libarar: TPanel
    Left = 2
    Top = 1
    Width = 316
    Height = 43
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 40
      Top = 9
      Width = 25
      Height = 25
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
    object btn_liberar: TSpeedButton
      Left = 10
      Top = 9
      Width = 25
      Height = 25
      Hint = 'Liberar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
        333333333F777773FF333333008888800333333377333F3773F3333077870787
        7033333733337F33373F3308888707888803337F33337F33337F330777880887
        7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
        7703337F33377733337FB3088888888888033373FFFFFFFFFF733B3000000000
        0033333777777777773333BBBB3333080333333333F3337F7F33BBBB707BB308
        03333333373F337F7F3333BB08033308033333337F7F337F7F333B3B08033308
        033333337F73FF737F33B33B778000877333333373F777337333333B30888880
        33333333373FFFF73333333B3300000333333333337777733333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_liberarClick
    end
    object pnlLegenda: TPanel
      Left = 167
      Top = 2
      Width = 147
      Height = 39
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object lblLegenda1: TLabel
        Left = 23
        Top = 4
        Width = 61
        Height = 13
        Caption = 'Valores Altos'
      end
      object lblLegenda2: TLabel
        Left = 23
        Top = 21
        Width = 120
        Height = 13
        Caption = 'Numer'#225'rio N'#227'o Recebido'
      end
      object pnlLegenda1: TPanel
        Left = 3
        Top = 3
        Width = 16
        Height = 16
        BevelInner = bvLowered
        Color = 14089981
        TabOrder = 0
      end
      object pnlLegenda2: TPanel
        Left = 3
        Top = 20
        Width = 16
        Height = 16
        BevelInner = bvLowered
        Color = 14605219
        TabOrder = 1
      end
    end
  end
  object pnl_unid_prod: TPanel
    Left = 2
    Top = 47
    Width = 627
    Height = 38
    BevelOuter = bvLowered
    TabOrder = 1
    object btn_co_unid_neg: TSpeedButton
      Left = 280
      Top = 8
      Width = 25
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
      OnClick = btn_co_unid_negClick
    end
    object Label1: TLabel
      Left = 7
      Top = 12
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
    object Label2: TLabel
      Left = 322
      Top = 13
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_produto: TSpeedButton
      Left = 594
      Top = 9
      Width = 25
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
      OnClick = btn_co_produtoClick
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 58
      Top = 8
      Width = 24
      Height = 21
      EditMask = '99;0; '
      MaxLength = 2
      TabOrder = 0
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_unidade: TEdit
      Left = 85
      Top = 8
      Width = 191
      Height = 21
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 2
    end
    object msk_cd_produto: TMaskEdit
      Left = 372
      Top = 9
      Width = 24
      Height = 21
      EditMask = '99;0; '
      MaxLength = 2
      TabOrder = 1
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 399
      Top = 9
      Width = 191
      Height = 21
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 2
    Top = 89
    Width = 627
    Height = 343
    TabOrder = 2
    object dbgrid_Libera: TDBGrid
      Left = 3
      Top = 4
      Width = 620
      Height = 335
      BorderStyle = bsNone
      Ctl3D = True
      DataSource = datm_di_libera.ds_lista_
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrid_LiberaDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'calc_nr_processo'
          Title.Caption = 'N'#186' Processo'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_SERVICO'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 209
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_CIF_DOLAR'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_MIN_DI'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 127
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 320
    Top = 0
    Width = 309
    Height = 43
    BevelOuter = bvLowered
    TabOrder = 3
    object Label3: TLabel
      Left = 12
      Top = 4
      Width = 56
      Height = 13
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 148
      Top = 4
      Width = 37
      Height = 13
      Caption = 'Ordem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_chave: TEdit
      Left = 12
      Top = 19
      Width = 129
      Height = 21
      TabOrder = 0
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 148
      Top = 19
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnClick = cb_ordemClick
    end
  end
  object menu_: TMainMenu
    Left = 560
    Top = 360
    object mi_liberar: TMenuItem
      Caption = '&Liberar'
      Enabled = False
      OnClick = btn_liberarClick
    end
    object mi_sair: TMenuItem
      Caption = '&Sair'
      OnClick = btn_sairClick
    end
  end
end

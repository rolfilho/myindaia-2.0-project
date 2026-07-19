object frm_sda_emissao: Tfrm_sda_emissao
  Left = 484
  Top = 146
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Guias de SDA'
  ClientHeight = 624
  ClientWidth = 968
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  KeyPreview = True
  Menu = mi_menu
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 246
    Width = 968
    Height = 104
    Align = alClient
    Brush.Color = clBtnFace
    Pen.Color = clGray
  end
  object Shape2: TShape
    Left = 0
    Top = 0
    Width = 968
    Height = 44
    Align = alTop
    Brush.Color = clBtnFace
    Pen.Color = clGray
  end
  object Shape3: TShape
    Left = 0
    Top = 46
    Width = 968
    Height = 90
    Align = alTop
    Brush.Color = clBtnFace
    Pen.Color = clTeal
  end
  object lbl_cd_unid_neg: TLabel
    Left = 11
    Top = 54
    Width = 48
    Height = 13
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
    Left = 278
    Top = 67
    Width = 20
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
  object btn_co_celula: TSpeedButton
    Left = 278
    Top = 102
    Width = 20
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
    OnClick = btn_co_celulaClick
  end
  object Label6: TLabel
    Left = 426
    Top = 91
    Width = 59
    Height = 13
    Caption = 'Data Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 314
    Top = 54
    Width = 45
    Height = 13
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl_mod_sda: TLabel
    Left = 538
    Top = 91
    Width = 89
    Height = 13
    Caption = 'Modelo de SDA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object btn_co_produto: TSpeedButton
    Left = 583
    Top = 67
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
    OnClick = btn_co_produtoClick
  end
  object lblCelula: TLabel
    Left = 11
    Top = 90
    Width = 36
    Height = 13
    Caption = 'C'#233'lula'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object btn_sair: TSpeedButton
    Left = 833
    Top = 8
    Width = 30
    Height = 30
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
  object btn_emitir: TSpeedButton
    Left = 9
    Top = 9
    Width = 164
    Height = 30
    Cursor = crHandPoint
    Hint = 
      'Enviar processos de Santos para o robo MyProcessaSDA'#13#10'ou'#13#10'Confir' +
      'mar transmiss'#227'o de processos do Rio de Janeiro'
    Caption = 'Confirmar Emiss'#227'o'
    Flat = True
    Glyph.Data = {
      C6070000424DC607000000000000360000002800000016000000160000000100
      2000000000009007000076030000760300000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0023000000530000005300000053000000530000005300000053000000530000
      005300000053000000530000004D00000016FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000053FDFDFDFFFBFB
      FBFFFCFCFCFFFDFDFDFFFDFDFDFFFEFEFEFFFEFEFEFFFFFFFFFFFEFEFEFFFAFA
      FAFFF0F0F0F9858585A600000017FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000053FBFBFBFFF7F7F7FFF9F9F9FFFAFA
      FAFFFBFBFBFFFCFCFCFFFDFDFDFFFEFEFEFFFBFBFBFFF4F4F4FFEAEAEAFFD2D2
      D2FE8D8D8CB100000017FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000053FBFBFBFFF7F7F7FFF9F9F9FFFAFAFAFFFBFBFBFFFCFC
      FCFFFDFDFDFFFEFEFEFFFCFCFCFFF5F5F5FFECECECFFD3D3D3FFDDDDDDFF9292
      92BA00000017FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0053FBFBFBFFF6F6F6FFF8F8F8FFFAFAFAFFFBFBFBFFFCFCFCFFFDFDFDFFFEFE
      FEFFFEFEFEFFF8F8F8FFF0F0F0FFD3D2D2FFFEFEFEFFDBDBDBFF8B8B8BB10000
      0017FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000053FBFBFBFFF6F6
      F6FFF8F8F8FFFAFAFAFFFBFBFBFFFCFCFCFFFCFCFCFFFDFDFDFFFEFEFEFFFBFB
      FBFFF5F5F5FFEAEAEAFFCFCFCFFFD6D6D6FFD2D2D2FE868686A600000015FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000053FBFBFAFFF5F5F5FFF7F7F7FFF9F9
      F9FFFAFAFAFFFBFBFBFFFCFCFCFFFDFDFDFFFEFEFEFFFEFEFEFFFBFBFBFFF6F6
      F6FFF1F1F1FFEEEEEEFFECECECFFEEEEEEF82121215C00000001FFFFFF00FFFF
      FF00FFFFFF0000000053FAFAFAFFF5F5F5FFF7F7F6FFF8F8F8FFE3D6F6FFD0B7
      F4FFF4EFFAFF965BE9FFF9F7FCFFFEFEFEFFCFB3F5FFE2D3F7FFF9F9F9FFF7F7
      F7FFF6F6F6FFFAFAFAFF3939396C00000002FFFFFF00FFFFFF00FFFFFF000000
      0053FAFAFAFFF4F4F4FFF3F2F5FFC7A9F0FFA06BEBFFD5BFF4FFFBFBFBFFA775
      EDFFE4D6F8FFFDFDFDFFD6C0F6FF9961EAFFC4A3F2FFFAF8FCFFFCFCFCFFFEFE
      FEFF3939396C00000002FFFFFF00FFFFFF00FFFFFF0000000053F9F9F9FFF3F3
      F3FFAB7DECFFB289EEFFE8DFF6FFFAFAFAFFFAFAFAFFBF9BF1FFD0B6F3FFFCFC
      FCFFFDFDFDFFEDE3FAFFB286EFFFA573ECFFFEFEFEFFFEFEFEFF3939396C0000
      0002FFFFFF00FFFFFF00FFFFFF0000000053F9F9F9FFF2F2F2FFAB7CECFFB288
      EEFFE7DDF5FFF9F9F8FFFAFAFAFFD4BDF4FFBE9AF1FFFCFCFCFFFCFCFCFFEBE0
      F9FFB48AEFFFA979EDFFFDFDFDFFFEFEFEFF3939396C00000002FFFFFF00FFFF
      FF00FFFFFF0000000053F8F8F8FFF1F1F0FFF0EFF1FFC3A5EFFF9E68EBFFD2BC
      F2FFF8F8F8FFE8DDF7FFAE81EEFFFBFBFBFFD8C2F6FFA572EDFFCAACF3FFF9F8
      FBFFFCFCFCFFFDFDFDFF3939396C00000002FFFFFF00FFFFFF00FFFFFF000000
      0053F8F8F8FFF0F0EFFFF1F1F1FFF3F3F2FFDED0F2FFCBB1F1FFF7F7F7FFF5F4
      F7FFAD7EEEFFF2ECF9FFD5BFF4FFE7DAF8FFFBFBFBFFFBFBFBFFFBFBFBFFFDFD
      FDFF3939396C00000002FFFFFF00FFFFFF00FFFFFF0000000053F8F8F7FFEFEF
      EEFFF0F0EFFFF1F1F1FFF3F3F2FFF4F4F4FFF5F5F5FFF7F7F6FFF8F8F7FFF8F8
      F8FFF9F9F9FFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFCFCFCFF3939396C0000
      0002FFFFFF00FFFFFF00FFFFFF0000000053F7F7F7FFEDEDECFFEFEFEEFFF0F0
      EFFFF1F1F1FFF3F3F2FFF4F4F3FFF5F5F5FFF6F6F6FFF7F7F6FFF7F7F7FFF8F8
      F8FFF8F8F8FFF9F9F9FFF9F9F9FFFCFCFCFF3939396C00000002FFFFFF00FFFF
      FF00FFFFFF0000000053F6F6F6FFECECEBFFEDEDECFFEFEFEEFFF0F0EFFFF1F1
      F0FFF2F2F2FFF3F3F3FFF4F4F4FFF5F5F4FFF5F5F5FFF6F6F6FFF6F6F6FFF7F7
      F6FFF7F7F6FFFBFBFAFF3939396C00000002FFFFFF00FFFFFF00FFFFFF000000
      0053F6F6F5FFEAEAE9FFECECEBFFEDEDECFFEEEEEDFFEFEFEFFFF0F0F0FFF1F1
      F1FFF2F2F2FFF3F3F2FFF4F4F3FFF4F4F4FFF4F4F4FFF5F5F4FFF5F5F4FFFAFA
      F9FF3939396C00000002FFFFFF00FFFFFF00FFFFFF0000000053F5F5F4FFE8E8
      E7FFEAEAE9FFEBEBEAFFEDEDECFFEEEEEDFFEFEFEEFFF0F0EFFFF0F0F0FFF1F1
      F0FFF2F2F1FFF2F2F2FFF2F2F2FFF3F3F2FFF3F3F2FFF9F9F8FF3939396C0000
      0002FFFFFF00FFFFFF00FFFFFF0000000053FCFCFCFFF8F8F7FFF9F8F8FFF9F9
      F9FFF9F9F9FFFAFAF9FFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFBFBFAFFFBFB
      FAFFFBFBFBFFFBFBFBFFFBFBFBFFFDFDFDFF3939396C00000002FFFFFF00FFFF
      FF00FFFFFF000000002300000053000000530000005300000053000000530000
      0053000000530000005300000053000000530000005300000053000000530000
      005300000053000000530000002600000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00}
    ParentShowHint = False
    ShowHint = True
    OnClick = btn_emitirClick
  end
  object btn_desmarca_todas: TSpeedButton
    Left = 211
    Top = 8
    Width = 30
    Height = 30
    Hint = 'Desmarcar Todos'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
      33333333373F33333333333330B03333333333337F7F33333333333330F03333
      333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
      333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
      333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
      3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
      33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
      33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
      03333337777777F7F33333330000000003333337777777773333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    Visible = False
    OnClick = btn_desmarca_todasClick
  end
  object btn_marca_todas: TSpeedButton
    Left = 242
    Top = 8
    Width = 30
    Height = 30
    Hint = 'Marcar Todos'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      333333777777777F33333330B00000003333337F7777777F3333333000000000
      333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
      333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
      03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
      03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
      3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
      333333333377F7F33333333333330F03333333333337F7F33333333333330B03
      3333333333373733333333333333303333333333333373333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btn_marca_todasClick
  end
  object lbl_pesquisa: TLabel
    Left = 524
    Top = 3
    Width = 56
    Height = 13
    Caption = 'Pesquisar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl_ordem_pesquisa: TLabel
    Left = 666
    Top = 3
    Width = 37
    Height = 13
    Caption = 'Ordem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object btnCalcular: TSpeedButton
    Left = 282
    Top = 8
    Width = 30
    Height = 30
    Hint = 'Calcular'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337444444444
      73333337777777773F333348888888884333337F3F3F3FFF7F33334848489998
      4333337F737377737F333348888888884333337F3F3F3F3F7F33334848484848
      4333337F737373737F333348888888884333337F3F3F3F3F7F33334848484848
      4333337F737373737F333348888888884333337F3F3F3F3F7F33334848484848
      4333337F737373737F333348888888884333337F3FFFFFFF7F33334844444448
      4333337F7777777F7F333348444E4E484333337F7FFFFF7F7F33334844444448
      4333337F777777737F333348888888884333337F333333337F33334888888888
      43333373FFFFFFFF733333744444444473333337777777773333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btnCalcularClick
  end
  object Label2: TLabel
    Left = 102
    Top = 252
    Width = 12
    Height = 15
    Caption = #252
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 33023
    Font.Height = -14
    Font.Name = 'Wingdings'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 14
    Top = 252
    Width = 24
    Height = 15
    Caption = #252#252
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -14
    Font.Name = 'Wingdings'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label4: TLabel
    Left = 43
    Top = 252
    Width = 46
    Height = 13
    Caption = '- Na fila'
  end
  object Label5: TLabel
    Left = 120
    Top = 252
    Width = 116
    Height = 13
    Caption = '- Pendente de envio'
  end
  object Label7: TLabel
    Left = 532
    Top = 254
    Width = 331
    Height = 13
    Caption = 'Aten'#231#227'o ao valor para o local de embarque/desembarque '
  end
  object Label8: TLabel
    Left = 314
    Top = 91
    Width = 66
    Height = 13
    Caption = 'Data Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object cbValorValido: TCheckBox
    Left = 635
    Top = 69
    Width = 206
    Height = 17
    Caption = 'Exibir somente com valor valido'
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 15
    OnClick = cbValorValidoClick
  end
  object Mensagem: TStatusBar
    Left = 0
    Top = 605
    Width = 968
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object dbgrd_sda: TDBGrid
    Left = 0
    Top = 350
    Width = 968
    Height = 255
    Align = alBottom
    DataSource = datm_sda_emissao.ds_processo_sda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = dbgrd_sdaDrawColumnCell
    OnDblClick = dbgrd_sdaDblClick
    OnKeyPress = dbgrd_sdaKeyPress
    Columns = <
      item
        Alignment = taCenter
        Color = clInfoBk
        Expanded = False
        FieldName = 'CalcSelecao'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clGreen
        Font.Height = -15
        Font.Name = 'Wingdings'
        Font.Style = [fsBold]
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CalcProcesso'
        Title.Caption = 'Processo'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AP_EMPRESA'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 115
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
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_BASE_CALCULO'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_SDA'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_CONTR_ASSIST'
        Title.Caption = 'Valor Contr.'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOMA'
        Title.Caption = 'Valor Total'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 69
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'LOCAL'
        Title.Caption = 'Embarque/Desembarque'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_DISTRIBUICAO'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end>
  end
  object dbgrd_desp: TDBGrid
    Left = 0
    Top = 138
    Width = 968
    Height = 108
    Align = alTop
    DataSource = datm_sda_emissao.ds_desp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_DESPACHANTE'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_DESPACHANTE'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 405
        Visible = True
      end>
  end
  object Panel5: TPanel
    Left = 0
    Top = 44
    Width = 968
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 136
    Width = 968
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
  end
  object msk_cd_unid_neg: TMaskEdit
    Left = 11
    Top = 67
    Width = 24
    Height = 21
    EditMask = '99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 4
    OnEnter = msk_cd_unid_negEnter
    OnExit = msk_cd_unid_negExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_unid_neg: TEdit
    Left = 40
    Top = 67
    Width = 234
    Height = 21
    TabStop = False
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object msk_cd_celula: TMaskEdit
    Left = 11
    Top = 103
    Width = 24
    Height = 21
    EditMask = '99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 6
    OnEnter = msk_cd_celulaEnter
    OnExit = msk_cd_celulaExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_celula: TEdit
    Left = 40
    Top = 103
    Width = 237
    Height = 21
    TabStop = False
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object msk_dt_final_base: TDateEdit
    Left = 426
    Top = 104
    Width = 100
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 8
    OnEnter = msk_dt_final_baseEnter
    OnExit = msk_dt_final_baseExit
  end
  object msk_cd_produto: TMaskEdit
    Left = 314
    Top = 67
    Width = 22
    Height = 21
    EditMask = '99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 9
    OnEnter = msk_cd_produtoEnter
    OnExit = msk_cd_produtoExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_produto: TEdit
    Left = 341
    Top = 67
    Width = 239
    Height = 21
    TabStop = False
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
  end
  object dblkpcbox_mod_sda: TDBLookupComboBox
    Left = 538
    Top = 104
    Width = 123
    Height = 21
    DropDownRows = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'CD_MOD_SDA'
    ListField = 'NM_MOD_SDA'
    ListSource = datm_sda_emissao.ds_mod_sda
    ParentFont = False
    TabOrder = 11
  end
  object edt_chave: TEdit
    Left = 524
    Top = 17
    Width = 139
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnChange = edt_chaveChange
  end
  object cb_ordem: TComboBox
    Left = 666
    Top = 17
    Width = 155
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 13
    OnClick = cb_ordemClick
    Items.Strings = (
      'Processo LI'
      'Cod.Importador + Processo LI'
      'Cod.Importador + Dt. Vencimernto + Processo LI')
  end
  object Panel2: TPanel
    Left = 512
    Top = 252
    Width = 15
    Height = 15
    Color = 8454143
    TabOrder = 16
  end
  object msk_dt_inicial_base: TDateEdit
    Left = 314
    Top = 104
    Width = 100
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 17
    OnEnter = msk_dt_inicial_baseEnter
    OnExit = msk_dt_inicial_baseExit
  end
  object mi_menu: TMainMenu
    Left = 522
    Top = 145
    object mi_emitir: TMenuItem
      Caption = '&Emitir Guias'
      OnClick = btn_emitirClick
    end
    object mi_desmarca: TMenuItem
      Caption = '&Desmarca'
      Visible = False
      OnClick = btn_desmarca_todasClick
    end
    object mi_marca: TMenuItem
      Caption = 'M&arca'
      OnClick = btn_marca_todasClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end

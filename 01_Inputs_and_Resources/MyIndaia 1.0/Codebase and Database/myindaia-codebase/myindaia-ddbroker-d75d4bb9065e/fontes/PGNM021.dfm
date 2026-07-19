object frm_Impressao_Numerario: Tfrm_Impressao_Numerario
  Left = 225
  Top = 160
  Width = 640
  Height = 480
  Caption = 'Emiss'#227'o de Solicita'#231#245'es de Numer'#225'rio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 631
    Height = 40
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_imprime: TSpeedButton
      Left = 17
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Imprimir'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_imprimeClick
    end
    object btn_sair: TSpeedButton
      Left = 224
      Top = 8
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
    object btn_salvar: TSpeedButton
      Left = 47
      Top = 8
      Width = 25
      Height = 25
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
      Visible = False
      OnClick = btn_salvarClick
    end
    object dbnvg: TDBNavigator
      Left = 94
      Top = 8
      Width = 104
      Height = 25
      DataSource = datm_Impressao_Numerario.ds_processo
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object pnl_emissao: TPanel
    Left = 0
    Top = 40
    Width = 631
    Height = 375
    BevelOuter = bvLowered
    TabOrder = 1
    object lbl_nr_solic: TLabel
      Left = 181
      Top = 228
      Width = 86
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'N'#186' Solic.'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_dt_solic: TLabel
      Left = 270
      Top = 228
      Width = 101
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Data'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_emitir: TLabel
      Left = 139
      Top = 228
      Width = 38
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_cd_unid_neg: TLabel
      Left = 7
      Top = 5
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
    object lbl_produto: TLabel
      Left = 311
      Top = 5
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
    object lblCliente: TLabel
      Left = 7
      Top = 44
      Width = 40
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 275
      Top = 18
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
    object btn_co_produto: TSpeedButton
      Left = 568
      Top = 18
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
    object btn_co_cliente: TSpeedButton
      Left = 275
      Top = 57
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
      OnClick = btn_co_clienteClick
    end
    object Label8: TLabel
      Left = 7
      Top = 161
      Width = 101
      Height = 13
      AutoSize = False
      Caption = 'Ass. Numer'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 7
      Top = 82
      Width = 117
      Height = 13
      AutoSize = False
      Caption = 'Obs. Numer'#225'rio '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_Valor: TLabel
      Left = 374
      Top = 228
      Width = 131
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Valor'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_dt_solic_ch: TLabel
      Left = 312
      Top = 45
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 7
      Top = 229
      Width = 95
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Processo'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbctrlgrd_numerario: TDBCtrlGrid
      Left = 139
      Top = 246
      Width = 383
      Height = 126
      DataSource = datm_Impressao_Numerario.ds_numerario
      PanelHeight = 18
      PanelWidth = 367
      TabOrder = 8
      RowCount = 7
      SelectedColor = clTeal
      object dbtxt_nr_solic: TDBText
        Left = 40
        Top = 1
        Width = 89
        Height = 17
        Alignment = taCenter
        DataField = 'NR_SOLICITACAO'
        DataSource = datm_Impressao_Numerario.ds_numerario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxt_vl_solic_: TDBText
        Left = 238
        Top = 1
        Width = 123
        Height = 17
        Alignment = taRightJustify
        DataField = 'VL_SOLICITADO'
        DataSource = datm_Impressao_Numerario.ds_numerario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxt_dt_solic: TDBText
        Left = 138
        Top = 1
        Width = 92
        Height = 17
        DataField = 'DT_SOLICITACAO'
        DataSource = datm_Impressao_Numerario.ds_numerario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbchkbox_emitir: TDBCheckBox
        Left = 11
        Top = 1
        Width = 14
        Height = 17
        Caption = 'dbchkbox_emitir'
        DataField = 'IN_EMITIDO'
        DataSource = datm_Impressao_Numerario.ds_numerario
        TabOrder = 0
        ValueChecked = '0'
        ValueUnchecked = '1'
      end
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 7
      Top = 19
      Width = 26
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 34
      Top = 19
      Width = 238
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 9
    end
    object msk_cd_produto: TMaskEdit
      Left = 311
      Top = 19
      Width = 29
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      OnEnter = msk_cd_produtoEnter
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 341
      Top = 19
      Width = 223
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 10
    end
    object msk_cd_cliente: TMaskEdit
      Left = 7
      Top = 58
      Width = 43
      Height = 21
      EditMask = '99999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 2
      OnEnter = msk_cd_clienteEnter
      OnExit = msk_cd_clienteExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_cliente: TEdit
      Left = 55
      Top = 58
      Width = 216
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 11
    end
    object mem_obs: TMemo
      Left = 7
      Top = 96
      Width = 457
      Height = 60
      OEMConvert = True
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object mem_ass: TMemo
      Left = 7
      Top = 175
      Width = 457
      Height = 48
      OEMConvert = True
      ScrollBars = ssVertical
      TabOrder = 5
    end
    object grpbox_tp_solic: TGroupBox
      Left = 488
      Top = 93
      Width = 129
      Height = 124
      Caption = 'Tipo de Solicita'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object rbtn_normal: TRadioButton
        Left = 8
        Top = 25
        Width = 91
        Height = 17
        Caption = 'Normal'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbtn_totais: TRadioButton
        Left = 8
        Top = 47
        Width = 113
        Height = 17
        Caption = 'Total por Banco'
        TabOrder = 1
      end
      object rbtn_item: TRadioButton
        Left = 8
        Top = 70
        Width = 103
        Height = 17
        Caption = 'Total por Item'
        TabOrder = 2
      end
      object rbtn_JJ: TRadioButton
        Left = 8
        Top = 94
        Width = 103
        Height = 17
        Caption = 'Arquivo J&&J'
        TabOrder = 3
        Visible = False
      end
    end
    object msk_dt_movimento: TMaskEdit
      Left = 312
      Top = 58
      Width = 73
      Height = 21
      EditMask = '00/00/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      Text = '  /  /    '
      OnEnter = msk_dt_movimentoEnter
      OnExit = msk_dt_movimentoExit
    end
    object DBCtrlGrid1: TDBCtrlGrid
      Left = 7
      Top = 246
      Width = 112
      Height = 126
      DataSource = datm_Impressao_Numerario.ds_processo
      PanelHeight = 18
      PanelWidth = 96
      TabOrder = 7
      RowCount = 7
      SelectedColor = clTeal
      object dbtxt_nr_processo: TDBText
        Left = 8
        Top = 1
        Width = 81
        Height = 17
        DataField = 'calc_nr_processo'
        DataSource = datm_Impressao_Numerario.ds_processo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object dbmem_obs: TDBMemo
      Left = 7
      Top = 96
      Width = 458
      Height = 60
      DataField = 'TX_NUMERARIO_OBS'
      DataSource = datm_Impressao_Numerario.ds_numerario
      TabOrder = 12
      OnChange = dbmem_obsChange
    end
  end
  object Mensagem: TStatusBar
    Left = 0
    Top = 415
    Width = 632
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object menu_cadastro: TMainMenu
    Left = 575
    Top = 351
    object mi_imprime: TMenuItem
      Caption = '&Imprimir'
      OnClick = btn_imprimeClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      Visible = False
      OnClick = btn_salvarClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
  object crp_Numerario: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 574
    Top = 287
  end
end

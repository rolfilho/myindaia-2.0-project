object frm_sel_unid_prod_via: Tfrm_sel_unid_prod_via
  Left = 391
  Top = 296
  Width = 336
  Height = 256
  BorderIcons = [biSystemMenu]
  Caption = 'frm_sel_unid_prod_via'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 328
    Height = 229
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object lbl_unid_neg: TLabel
      Left = 12
      Top = 13
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
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 292
      Top = 25
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
      OnClick = btn_co_unid_negClick
    end
    object lbl_via_transp: TLabel
      Left = 12
      Top = 87
      Width = 102
      Height = 13
      Alignment = taRightJustify
      Caption = 'Via de Transporte'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 12
      Top = 49
      Width = 36
      Height = 13
      Caption = 'C'#233'lula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnCelula: TSpeedButton
      Left = 292
      Top = 62
      Width = 25
      Height = 23
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
      OnClick = btnCelulaClick
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 12
      Top = 27
      Width = 31
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
      OnChange = btn_co_unid_negClick
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 45
      Top = 27
      Width = 243
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object dblckpbox_via_transporte: TDBLookupComboBox
      Left = 12
      Top = 103
      Width = 170
      Height = 21
      KeyField = 'CD_VIA_TRANSP'
      ListField = 'NM_VIA_TRANSP'
      ListSource = datm_sel_unid_prod_via.ds_via_transp_broker
      TabOrder = 4
    end
    object btn_imprimir: TButton
      Left = 174
      Top = 193
      Width = 70
      Height = 26
      Caption = '&Imprimir'
      TabOrder = 6
      Visible = False
      OnClick = btn_imprimirClick
    end
    object btn_sair: TButton
      Left = 249
      Top = 193
      Width = 70
      Height = 26
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 8
      OnClick = btn_sairClick
    end
    object chk_proc: TCheckBox
      Left = 193
      Top = 104
      Width = 123
      Height = 17
      Caption = 'Exibir Processos'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 5
    end
    object medtCelula: TMaskEdit
      Left = 12
      Top = 62
      Width = 31
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 2
      OnChange = btnCelulaClick
      OnExit = medtCelulaExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_celula: TEdit
      Left = 45
      Top = 62
      Width = 243
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object btn_imprimirExp: TButton
      Left = 174
      Top = 193
      Width = 70
      Height = 26
      Caption = '&Imprimir'
      TabOrder = 7
      OnClick = btn_imprimirExpClick
    end
    object Panel2: TPanel
      Left = 12
      Top = 192
      Width = 149
      Height = 29
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 9
      object rbDetalhado: TRadioButton
        Left = 8
        Top = 6
        Width = 70
        Height = 17
        Caption = 'Detalhado'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbSimples: TRadioButton
        Left = 80
        Top = 6
        Width = 57
        Height = 17
        Caption = 'Simples'
        TabOrder = 1
      end
    end
    object gbPeriodo: TGroupBox
      Left = 12
      Top = 128
      Width = 307
      Height = 61
      Caption = 'Per'#237'odo Previsto para '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      object lblDataInicial: TLabel
        Left = 12
        Top = 16
        Width = 17
        Height = 13
        Alignment = taRightJustify
        Caption = 'De'
        FocusControl = dteInicial
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDataFinal: TLabel
        Left = 156
        Top = 16
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = 'At'#233
        FocusControl = dteFinal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dteInicial: TDateEdit
        Left = 12
        Top = 32
        Width = 125
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
      end
      object dteFinal: TDateEdit
        Left = 156
        Top = 32
        Width = 117
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object crp_unid_prod_via: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 240
    Top = 7
  end
end

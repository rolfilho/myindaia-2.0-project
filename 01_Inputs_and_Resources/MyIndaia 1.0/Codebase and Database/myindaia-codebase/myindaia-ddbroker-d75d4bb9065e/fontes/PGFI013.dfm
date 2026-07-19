object frm_sel_moeda_periodo: Tfrm_sel_moeda_periodo
  Left = 318
  Top = 112
  Width = 380
  Height = 242
  BorderIcons = [biSystemMenu]
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
    Width = 372
    Height = 215
    Align = alClient
    BevelWidth = 2
    TabOrder = 0
    object lbl_periodo: TLabel
      Left = 21
      Top = 82
      Width = 120
      Height = 13
      Caption = 'Selecione o per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_a: TLabel
      Left = 125
      Top = 100
      Width = 8
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_cd_moeda: TLabel
      Left = 21
      Top = 27
      Width = 92
      Height = 13
      Caption = 'Tabela de Juros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_cd_moeda: TSpeedButton
      Left = 298
      Top = 39
      Width = 23
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
      OnClick = btn_cd_moedaClick
    end
    object msk_dt_inicio: TMaskEdit
      Left = 19
      Top = 96
      Width = 73
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnExit = msk_dt_inicioExit
    end
    object btn_imprimir: TButton
      Left = 92
      Top = 161
      Width = 66
      Height = 26
      Caption = '&Imprimir'
      TabOrder = 3
      OnClick = btn_imprimirClick
    end
    object btn_sair: TButton
      Left = 188
      Top = 161
      Width = 66
      Height = 26
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 4
      OnClick = btn_sairClick
    end
    object msk_dt_fim: TMaskEdit
      Left = 163
      Top = 96
      Width = 73
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
      OnExit = msk_dt_fimExit
    end
    object msk_cd_moeda: TMaskEdit
      Left = 21
      Top = 40
      Width = 34
      Height = 21
      EditMask = '999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 0
      OnExit = msk_cd_moedaExit
      OnKeyDown = msk_cd_moedaKeyDown
    end
    object edt_nm_moeda: TEdit
      Left = 60
      Top = 40
      Width = 232
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 5
    end
  end
  object crp_moeda_periodo: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 310
    Top = 138
  end
end

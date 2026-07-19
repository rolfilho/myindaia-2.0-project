object frm_sel_data_proc: Tfrm_sel_data_proc
  Left = 177
  Top = 155
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Minuta de Transporte'
  ClientHeight = 124
  ClientWidth = 257
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
    Width = 257
    Height = 124
    Align = alClient
    BevelWidth = 2
    TabOrder = 0
    object lbl_data: TLabel
      Left = 43
      Top = 13
      Width = 173
      Height = 13
      Caption = 'Selecione a Data ou Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_processo: TSpeedButton
      Left = 211
      Top = 39
      Width = 26
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
      OnClick = btn_co_processoClick
    end
    object btn_imprimir: TButton
      Left = 39
      Top = 74
      Width = 66
      Height = 26
      Caption = '&Imprimir'
      Default = True
      TabOrder = 1
      OnClick = btn_imprimirClick
    end
    object btn_sair: TButton
      Left = 124
      Top = 74
      Width = 66
      Height = 26
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 3
      OnClick = btn_sairClick
    end
    object msk_nr_processo: TMaskEdit
      Left = 106
      Top = 39
      Width = 102
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 18
      ParentFont = False
      TabOrder = 0
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_nr_processoKeyDown
    end
    object msk_data: TDateTimePicker
      Left = 8
      Top = 39
      Width = 93
      Height = 21
      Date = 37431.000000000000000000
      Time = 37431.000000000000000000
      TabOrder = 2
      OnChange = DateTimePicker1Change
    end
  end
  object crp_Relacao: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 209
    Top = 71
  end
end

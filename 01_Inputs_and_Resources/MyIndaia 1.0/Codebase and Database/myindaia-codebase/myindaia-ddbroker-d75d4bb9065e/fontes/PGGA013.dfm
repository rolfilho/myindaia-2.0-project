object frm_rel_proc_pend: Tfrm_rel_proc_pend
  Left = 127
  Top = 227
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Posi'#231#227'o de Processos Pendentes de Inspe'#231#227'o'
  ClientHeight = 267
  ClientWidth = 480
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
  object lbl_cd_unid_neg: TLabel
    Left = 16
    Top = 8
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
  object btn_cd_unid_neg: TSpeedButton
    Left = 162
    Top = 22
    Width = 25
    Height = 25
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
    OnClick = btn_cd_unid_negClick
  end
  object lbl_cd_cliente: TLabel
    Left = 16
    Top = 136
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
  object btn_co_cliente: TSpeedButton
    Left = 396
    Top = 152
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
  object Label1: TLabel
    Left = 16
    Top = 52
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
  object btn_cd_produto: TSpeedButton
    Left = 162
    Top = 66
    Width = 25
    Height = 25
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
    OnClick = btn_cd_produtoClick
  end
  object Label2: TLabel
    Left = 16
    Top = 181
    Width = 59
    Height = 13
    Caption = 'Data base'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_grupo: TLabel
    Left = 16
    Top = 94
    Width = 35
    Height = 13
    Caption = 'Grupo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_grupo: TSpeedButton
    Left = 396
    Top = 110
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
    OnClick = btn_co_grupoClick
  end
  object msk_cd_unid_neg: TMaskEdit
    Left = 16
    Top = 24
    Width = 21
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
    OnExit = msk_cd_unid_negExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_unid_neg: TEdit
    Left = 40
    Top = 24
    Width = 120
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 7
  end
  object edt_nm_cliente: TEdit
    Left = 56
    Top = 152
    Width = 337
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 9
  end
  object msk_cd_cliente: TMaskEdit
    Left = 16
    Top = 152
    Width = 39
    Height = 21
    EditMask = '99999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 3
    OnChange = msk_cd_clienteChange
    OnExit = msk_cd_clienteExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object btn_iniciar: TButton
    Left = 144
    Top = 236
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    TabOrder = 5
    OnClick = btn_iniciarClick
  end
  object btn_fechar: TButton
    Left = 256
    Top = 236
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Fechar'
    ModalResult = 2
    TabOrder = 6
    OnClick = btn_fecharClick
  end
  object msk_cd_produto: TMaskEdit
    Left = 16
    Top = 68
    Width = 21
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
    OnExit = msk_cd_produtoExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_produto: TEdit
    Left = 40
    Top = 68
    Width = 120
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 8
  end
  object msk_data_base: TMaskEdit
    Left = 16
    Top = 197
    Width = 97
    Height = 21
    EditMask = '!99/99/9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 4
    Text = '  /  /    '
    OnExit = msk_data_baseExit
  end
  object edt_nm_grupo: TEdit
    Left = 56
    Top = 110
    Width = 337
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 10
  end
  object msk_cd_grupo: TMaskEdit
    Left = 16
    Top = 110
    Width = 39
    Height = 21
    EditMask = '999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 2
    OnChange = msk_cd_grupoChange
    OnExit = msk_cd_grupoExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object crp_rel_proc_pend: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = True
    Left = 248
    Top = 24
  end
end

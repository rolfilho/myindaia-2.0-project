object frm_po_imp: Tfrm_po_imp
  Left = 264
  Top = 107
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rela'#231#227'o de Eventos n'#227'o Realizados'
  ClientHeight = 418
  ClientWidth = 348
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
  object lbl_unid_neg: TLabel
    Left = 8
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
  end
  object btn_co_unid_neg: TSpeedButton
    Left = 296
    Top = 22
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
  object lbl_cd_cliente: TLabel
    Left = 8
    Top = 88
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
    Left = 296
    Top = 101
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
    Left = 8
    Top = 165
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'Evento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_evento: TSpeedButton
    Left = 296
    Top = 178
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
    OnClick = btn_co_eventoClick
  end
  object lbl_periodo_de: TLabel
    Left = 208
    Top = 291
    Width = 68
    Height = 13
    Alignment = taRightJustify
    Caption = 'Per'#237'odo de:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_periodo_a: TLabel
    Left = 210
    Top = 331
    Width = 8
    Height = 13
    Alignment = taRightJustify
    Caption = 'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_produto: TLabel
    Left = 8
    Top = 205
    Width = 27
    Height = 13
    Caption = #193'rea'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_area: TSpeedButton
    Left = 296
    Top = 218
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
    OnClick = btn_co_areaClick
  end
  object lblGrupo: TLabel
    Left = 8
    Top = 49
    Width = 39
    Height = 13
    Caption = 'Grupo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_grupo: TSpeedButton
    Left = 296
    Top = 63
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
  object lbl_status: TLabel
    Left = 8
    Top = 242
    Width = 37
    Height = 13
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_servico: TLabel
    Left = 8
    Top = 125
    Width = 44
    Height = 13
    Alignment = taRightJustify
    Caption = 'Servi'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_servico: TSpeedButton
    Left = 296
    Top = 138
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
    OnClick = btn_co_servicoClick
  end
  object msk_cd_unid_neg: TMaskEdit
    Left = 8
    Top = 23
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
    OnExit = msk_cd_unid_negExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_unid_neg: TEdit
    Left = 38
    Top = 23
    Width = 255
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 12
  end
  object edt_nm_cliente: TEdit
    Left = 50
    Top = 102
    Width = 243
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 13
  end
  object msk_cd_cliente: TMaskEdit
    Left = 8
    Top = 102
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
    TabOrder = 2
    OnChange = msk_cd_clienteChange
    OnExit = msk_cd_clienteExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object msk_cd_evento: TMaskEdit
    Left = 8
    Top = 179
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
    TabOrder = 4
    OnExit = msk_cd_eventoExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_evento: TEdit
    Left = 51
    Top = 179
    Width = 242
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 14
  end
  object rdgrp_resp: TRadioGroup
    Left = 8
    Top = 283
    Width = 185
    Height = 89
    Caption = '&Respons'#225'vel'
    ItemIndex = 0
    Items.Strings = (
      'Cliente'
      'Comiss'#225'ria'
      'Ambos')
    TabOrder = 7
  end
  object btn_iniciar: TButton
    Left = 92
    Top = 377
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    Default = True
    TabOrder = 10
    OnClick = btn_iniciarClick
  end
  object btn_fechar: TButton
    Left = 180
    Top = 377
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Fechar'
    ModalResult = 2
    TabOrder = 11
    OnClick = btn_fecharClick
  end
  object msk_dt_inicio: TMaskEdit
    Left = 208
    Top = 307
    Width = 73
    Height = 21
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 8
    Text = '  /  /    '
  end
  object msk_dt_fim: TMaskEdit
    Left = 208
    Top = 347
    Width = 73
    Height = 21
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 9
    Text = '  /  /    '
  end
  object msk_cd_area: TMaskEdit
    Left = 8
    Top = 219
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
    TabOrder = 5
    OnExit = msk_cd_areaExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_area: TEdit
    Left = 38
    Top = 219
    Width = 255
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 15
  end
  object edt_nm_grupo: TEdit
    Left = 52
    Top = 64
    Width = 241
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 16
  end
  object msk_cd_grupo: TMaskEdit
    Left = 8
    Top = 64
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
    TabOrder = 1
    OnChange = msk_cd_grupoChange
    OnExit = msk_cd_grupoExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object cbbox_status: TComboBox
    Left = 8
    Top = 258
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 6
  end
  object msk_cd_servico: TMaskEdit
    Left = 8
    Top = 139
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
    TabOrder = 3
    OnExit = msk_cd_servicoExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_servico: TEdit
    Left = 51
    Top = 139
    Width = 242
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 17
  end
  object chk_arquivo: TCheckBox
    Left = 208
    Top = 262
    Width = 90
    Height = 17
    Caption = 'Em Arquivo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
    Visible = False
  end
  object crp_po_imp: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 296
    Top = 363
  end
end

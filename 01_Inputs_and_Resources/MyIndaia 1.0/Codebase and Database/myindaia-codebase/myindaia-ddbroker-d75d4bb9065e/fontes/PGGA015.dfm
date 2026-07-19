object frm_imp_eventos_nao_realizados: Tfrm_imp_eventos_nao_realizados
  Left = 296
  Top = 150
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rela'#231#227'o de Eventos n'#227'o Realizados'
  ClientHeight = 464
  ClientWidth = 344
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
    Top = 24
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
    OnClick = btn_co_unid_negClick
  end
  object lbl_produto: TLabel
    Left = 8
    Top = 48
    Width = 45
    Height = 13
    Alignment = taRightJustify
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_produto: TSpeedButton
    Left = 296
    Top = 64
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
    OnClick = btn_co_produtoClick
  end
  object lbl_cd_cliente: TLabel
    Left = 8
    Top = 127
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
    Top = 143
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
    OnClick = btn_co_clienteClick
  end
  object lbl_evento: TLabel
    Left = 8
    Top = 167
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
    Top = 180
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
    OnClick = btn_co_eventoClick
  end
  object lbl_dt_referencia: TLabel
    Left = 8
    Top = 385
    Width = 112
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data de Refer'#234'ncia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_periodo_de: TLabel
    Left = 208
    Top = 302
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
    Top = 342
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
  object lbl_analista_com: TLabel
    Left = 8
    Top = 247
    Width = 187
    Height = 13
    Alignment = taRightJustify
    Caption = 'Analista Respons'#225'vel Comiss'#225'ria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object btn_co_analista_com: TSpeedButton
    Left = 296
    Top = 261
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
    Visible = False
    OnClick = btn_co_analista_comClick
  end
  object lbl_area: TLabel
    Left = 8
    Top = 207
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = #193'rea'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object btn_co_area: TSpeedButton
    Left = 296
    Top = 221
    Width = 26
    Height = 22
    Glyph.Data = {
      E6000000424DE60000000000000076000000280000000E0000000E0000000100
      0400000000007000000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33003333333333333300300000000333330000B7B7B7B03333000B0B7B7B7B03
      33000BB0B7B7B7B033000FBB0000000033000BFB0B0B0B0333000FBFBFBFB003
      33000BFBFBF00033330030BFBF03333333003800008333333300333333333333
      33003333333333333300}
    Visible = False
    OnClick = btn_co_areaClick
  end
  object Label2: TLabel
    Left = 8
    Top = 89
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
    Left = 296
    Top = 103
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
    OnClick = btn_co_grupoClick
  end
  object msk_cd_unid_neg: TMaskEdit
    Left = 8
    Top = 25
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
    Top = 25
    Width = 255
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 13
  end
  object msk_cd_produto: TMaskEdit
    Left = 8
    Top = 65
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
    TabOrder = 1
    OnExit = msk_cd_produtoExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_produto: TEdit
    Left = 38
    Top = 65
    Width = 255
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 14
  end
  object edt_nm_cliente: TEdit
    Left = 50
    Top = 144
    Width = 243
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 15
  end
  object msk_cd_cliente: TMaskEdit
    Left = 8
    Top = 144
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
  object msk_cd_evento: TMaskEdit
    Left = 8
    Top = 181
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
    Top = 181
    Width = 242
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 16
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 294
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
  object msk_dt_referencia: TMaskEdit
    Left = 8
    Top = 401
    Width = 121
    Height = 21
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 8
    Text = '  /  /    '
    OnExit = msk_dt_referenciaExit
  end
  object btn_iniciar: TButton
    Left = 92
    Top = 431
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    TabOrder = 11
    OnClick = btn_iniciarClick
  end
  object btn_fechar: TButton
    Left = 180
    Top = 431
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Fechar'
    ModalResult = 2
    TabOrder = 12
    OnClick = btn_fecharClick
  end
  object msk_dt_inicio: TMaskEdit
    Left = 208
    Top = 318
    Width = 73
    Height = 21
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 9
    Text = '  /  /    '
    OnExit = msk_dt_referenciaExit
  end
  object msk_dt_fim: TMaskEdit
    Left = 208
    Top = 358
    Width = 73
    Height = 21
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 10
    Text = '  /  /    '
    OnExit = msk_dt_referenciaExit
  end
  object msk_cd_analista_com: TMaskEdit
    Left = 8
    Top = 261
    Width = 39
    Height = 21
    EditMask = '9999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    TabOrder = 6
    Visible = False
    OnExit = msk_cd_analista_comExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_analista_com: TEdit
    Left = 51
    Top = 261
    Width = 242
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 17
    Visible = False
  end
  object msk_cd_area: TMaskEdit
    Left = 8
    Top = 221
    Width = 26
    Height = 21
    EditMask = '99;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 5
    Visible = False
    OnExit = msk_cd_areaExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object edt_nm_area: TEdit
    Left = 41
    Top = 221
    Width = 252
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 18
    Visible = False
  end
  object edt_nm_grupo: TEdit
    Left = 50
    Top = 104
    Width = 243
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 19
  end
  object msk_cd_grupo: TMaskEdit
    Left = 8
    Top = 104
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
  object crp_rel_eventos_nao_realizados: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 248
    Top = 380
  end
end

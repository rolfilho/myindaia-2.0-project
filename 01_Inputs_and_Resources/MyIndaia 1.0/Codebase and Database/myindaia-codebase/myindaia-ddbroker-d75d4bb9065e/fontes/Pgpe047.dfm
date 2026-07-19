object frm_sel_unid_cli_serv_anal: Tfrm_sel_unid_cli_serv_anal
  Left = 352
  Top = 216
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rio de Andamento de Processos'
  ClientHeight = 282
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_cd_unid_neg: TLabel
    Left = 16
    Top = 17
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
    Left = 407
    Top = 32
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
    OnClick = btn_cd_unid_negClick
  end
  object lblGrupo: TLabel
    Left = 16
    Top = 58
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
    Left = 407
    Top = 70
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
  object lbl_cd_cliente: TLabel
    Left = 16
    Top = 98
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
    Left = 407
    Top = 110
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
  object Label5: TLabel
    Left = 16
    Top = 180
    Width = 44
    Height = 13
    Caption = 'Servi'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_servico: TSpeedButton
    Left = 407
    Top = 194
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
    OnClick = btn_co_servicoClick
  end
  object lbl_analista_comissaria: TLabel
    Left = 17
    Top = 138
    Width = 110
    Height = 13
    Caption = 'Analista Comiss'#225'ria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_analista_comissaria: TSpeedButton
    Left = 406
    Top = 152
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
    OnClick = btn_co_analista_comissariaClick
  end
  object msk_cd_unid_neg: TMaskEdit
    Left = 16
    Top = 33
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
    Text = 'msk cd unid neg'
    OnExit = msk_cd_unid_negExit
    OnKeyDown = msk_cd_servicoKeyDown
  end
  object edt_nm_unid_neg: TEdit
    Left = 45
    Top = 33
    Width = 358
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
    TabOrder = 8
    Text = 'edt_nm_unid_neg'
  end
  object edt_nm_grupo: TEdit
    Left = 58
    Top = 71
    Width = 345
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
    TabOrder = 9
    Text = 'edt_nm_grupo'
  end
  object msk_cd_grupo: TMaskEdit
    Left = 16
    Top = 71
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
    Text = 'msk cd grupo'
    OnChange = msk_cd_grupoChange
    OnExit = msk_cd_grupoExit
    OnKeyDown = msk_cd_servicoKeyDown
  end
  object edt_nm_cliente: TEdit
    Left = 58
    Top = 111
    Width = 345
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
    Text = 'edt_nm_cliente'
  end
  object msk_cd_cliente: TMaskEdit
    Left = 16
    Top = 111
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
    Text = 'msk cd cliente'
    OnChange = msk_cd_clienteChange
    OnExit = msk_cd_clienteExit
    OnKeyDown = msk_cd_servicoKeyDown
  end
  object msk_cd_servico: TMaskEdit
    Left = 16
    Top = 194
    Width = 39
    Height = 21
    EditMask = '!999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 4
    Text = 'msk cd servico'
    OnExit = msk_cd_servicoExit
    OnKeyDown = msk_cd_servicoKeyDown
  end
  object edt_nm_servico: TEdit
    Left = 58
    Top = 194
    Width = 345
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
    TabOrder = 12
    Text = 'edt_nm_servico'
  end
  object OKBtn: TButton
    Left = 141
    Top = 251
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    TabOrder = 7
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 221
    Top = 251
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    TabOrder = 13
    OnClick = CancelBtnClick
  end
  object msk_cd_analista_comissaria: TMaskEdit
    Left = 17
    Top = 152
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
    TabOrder = 3
    Text = 'msk cd analista comissaria'
    OnExit = msk_cd_analista_comissariaExit
    OnKeyDown = msk_cd_servicoKeyDown
  end
  object edt_nm_analista_comissaria: TEdit
    Left = 58
    Top = 152
    Width = 345
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
    TabOrder = 11
    Text = 'edt_nm_analista_comissaria'
  end
  object chk_so_ult_obs: TCheckBox
    Left = 44
    Top = 219
    Width = 177
    Height = 17
    Caption = 'Apenas '#218'ltima Observa'#231#227'o'
    TabOrder = 5
  end
  object chk_pend_averb: TCheckBox
    Left = 245
    Top = 219
    Width = 167
    Height = 17
    Caption = 'Pendentes de Averba'#231#227'o'
    TabOrder = 6
  end
  object crp_relat: TCRPE
    WindowShowPrintSetupBtn = False
    WindowShowProgressCtls = False
    WindowState = wsNormal
    LoadEngineOnUse = False
    Left = 392
  end
end

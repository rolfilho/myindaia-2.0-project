object frm_duplica_eventos: Tfrm_duplica_eventos
  Left = 104
  Top = 161
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Duplicação de Eventos'
  ClientHeight = 140
  ClientWidth = 456
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_servico: TLabel
    Left = 21
    Top = 17
    Width = 44
    Height = 13
    Caption = 'Serviço'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_servico: TSpeedButton
    Left = 410
    Top = 32
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
  object lbl_destino: TLabel
    Left = 23
    Top = 64
    Width = 62
    Height = 13
    Caption = 'lbl_destino'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edt_nm_servico: TEdit
    Left = 64
    Top = 32
    Width = 343
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 3
  end
  object msk_cd_servico: TMaskEdit
    Left = 21
    Top = 32
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
    TabOrder = 0
    OnExit = msk_cd_servicoExit
    OnKeyDown = msk_cd_unid_negKeyDown
  end
  object btn_duplicar: TButton
    Left = 136
    Top = 109
    Width = 75
    Height = 25
    Caption = '&Duplicar'
    TabOrder = 1
    OnClick = btn_duplicarClick
  end
  object btn_fechar: TButton
    Left = 244
    Top = 109
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Fechar'
    ModalResult = 2
    TabOrder = 2
    OnClick = btn_fecharClick
  end
end

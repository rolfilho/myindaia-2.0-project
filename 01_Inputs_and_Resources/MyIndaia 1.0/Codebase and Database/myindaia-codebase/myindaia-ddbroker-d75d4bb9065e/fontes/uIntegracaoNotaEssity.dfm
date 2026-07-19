object frm_integracao_nota_essity: Tfrm_integracao_nota_essity
  Left = 466
  Top = 303
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 154
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 493
    Height = 154
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      493
      154)
    object shpTitulo: TShape
      Left = 8
      Top = 10
      Width = 473
      Height = 25
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shpConteudo: TShape
      Left = 8
      Top = 40
      Width = 473
      Height = 69
      Anchors = [akLeft, akTop, akBottom]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lbl_cd_unid_neg: TLabel
      Left = 16
      Top = 48
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
      Left = 208
      Top = 64
      Width = 23
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
      OnClick = btn_cd_unid_negClick
    end
    object lblTitulo: TLabel
      Left = 16
      Top = 15
      Width = 281
      Height = 16
      Caption = 'Relat'#243'rio Integra'#231#227'o Draft DANFE Essity'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblProcesso: TLabel
      Left = 241
      Top = 48
      Width = 53
      Height = 13
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TButton
      Left = 329
      Top = 118
      Width = 70
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Gerar'
      TabOrder = 2
      OnClick = btn_geraplanilhaClick
    end
    object btn_fechar: TButton
      Left = 407
      Top = 118
      Width = 70
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 3
      OnClick = btn_fecharClick
    end
    object mskedt_cd_unid_neg: TMaskEdit
      Left = 16
      Top = 64
      Width = 32
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
      OnExit = mskedt_cd_unid_negExit
      OnKeyDown = mskedt_cd_unid_negKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 48
      Top = 64
      Width = 153
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
    end
    object edtNrProcesso: TEdit
      Left = 243
      Top = 64
      Width = 214
      Height = 21
      TabOrder = 1
    end
  end
end

object frm_sel_data: Tfrm_sel_data
  Left = 339
  Top = 235
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 185
  ClientWidth = 334
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
    Width = 334
    Height = 185
    Align = alClient
    TabOrder = 0
    object lbl_data: TLabel
      Left = 117
      Top = 55
      Width = 101
      Height = 13
      Caption = 'Selecione a data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_unid_neg: TLabel
      Left = 9
      Top = 13
      Width = 48
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_produto: TLabel
      Left = 9
      Top = 56
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btn_co_unid: TSpeedButton
      Left = 300
      Top = 30
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
      Visible = False
      OnClick = btn_co_unidClick
    end
    object btn_co_prod: TSpeedButton
      Left = 300
      Top = 72
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
      Visible = False
      OnClick = btn_co_prodClick
    end
    object btn_imprimir: TButton
      Left = 92
      Top = 148
      Width = 66
      Height = 26
      Caption = '&Imprimir'
      Default = True
      TabOrder = 2
      OnClick = btn_imprimirClick
    end
    object btn_sair: TButton
      Left = 177
      Top = 148
      Width = 66
      Height = 26
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 3
      OnClick = btn_sairClick
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 9
      Top = 30
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
      Visible = False
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_produto: TMaskEdit
      Left = 9
      Top = 73
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
      TabOrder = 1
      Visible = False
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 44
      Top = 73
      Width = 249
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
      Visible = False
    end
    object edt_nm_unid_neg: TEdit
      Left = 44
      Top = 30
      Width = 249
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 6
      Visible = False
    end
    object msk_data: TDateTimePicker
      Left = 120
      Top = 73
      Width = 89
      Height = 21
      Date = 37431.000000000000000000
      Time = 37431.000000000000000000
      TabOrder = 5
    end
  end
  object crp_Relacao: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 295
    Top = 135
  end
  object qry_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 248
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unidade_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_PRODUTO '
      'FROM TPRODUTO '
      'WHERE CD_PRODUTO = :CD_PRODUTO')
    Left = 184
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_produto_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'TPRODUTO.NM_PRODUTO'
      Size = 40
    end
  end
end

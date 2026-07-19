object frm_sel_unid_cli_grupo_item: Tfrm_sel_unid_cli_grupo_item
  Left = 501
  Top = 184
  Width = 374
  Height = 394
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 366
    Height = 367
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object pnlUnidade: TPanel
      Left = 2
      Top = 2
      Width = 362
      Height = 45
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lbl_unid_neg: TLabel
        Left = 10
        Top = 6
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
        Top = 19
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
      object msk_cd_unid_neg: TMaskEdit
        Left = 11
        Top = 20
        Width = 29
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
        Top = 20
        Width = 255
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 1
      end
    end
    object pnlProduto: TPanel
      Left = 2
      Top = 47
      Width = 362
      Height = 43
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lbl1: TLabel
        Left = 13
        Top = 1
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
        Top = 16
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
        OnClick = btn_co_produtoClick
      end
      object msk_cd_produto: TMaskEdit
        Left = 12
        Top = 17
        Width = 29
        Height = 21
        MaxLength = 2
        TabOrder = 0
        OnExit = msk_cd_produtoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_produto: TEdit
        Left = 41
        Top = 17
        Width = 255
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 1
      end
    end
    object pnlOutros: TPanel
      Left = 2
      Top = 90
      Width = 362
      Height = 270
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object lbl_grupo_item: TLabel
        Left = 11
        Top = 112
        Width = 63
        Height = 13
        Caption = 'Grupo Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_grupo_item: TSpeedButton
        Left = 296
        Top = 125
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
        OnClick = btn_co_grupo_itemClick
      end
      object lbl_periodo: TLabel
        Left = 11
        Top = 152
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
        Left = 117
        Top = 171
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
      object lbl_cd_cliente: TLabel
        Left = 11
        Top = 34
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
        Top = 48
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
        OnClick = btn_co_clienteClick
      end
      object lblGrupo: TLabel
        Left = 11
        Top = -2
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
        Top = 10
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
        OnClick = btn_co_grupoClick
      end
      object lbl_analista_comissaria: TLabel
        Left = 11
        Top = 73
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
        Left = 296
        Top = 85
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
        OnClick = btn_co_analista_comissariaClick
      end
      object btn_imprimir: TButton
        Left = 108
        Top = 243
        Width = 58
        Height = 26
        Caption = '&Imprimir'
        TabOrder = 11
        OnClick = btn_imprimirClick
      end
      object btn_sair: TButton
        Left = 212
        Top = 243
        Width = 58
        Height = 26
        Cancel = True
        Caption = '&Sair'
        ModalResult = 2
        TabOrder = 12
        OnClick = btn_sairClick
      end
      object msk_cd_grupo_item: TMaskEdit
        Left = 11
        Top = 126
        Width = 24
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
        OnExit = msk_cd_grupo_itemExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_grupo_item: TEdit
        Left = 36
        Top = 126
        Width = 259
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 13
      end
      object msk_cd_cliente: TMaskEdit
        Left = 11
        Top = 48
        Width = 38
        Height = 21
        EditMask = '99999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 1
        OnChange = msk_cd_clienteChange
        OnExit = msk_cd_clienteExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_cliente: TEdit
        Left = 50
        Top = 48
        Width = 244
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 14
      end
      object edt_nm_grupo: TEdit
        Left = 43
        Top = 11
        Width = 252
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 15
      end
      object msk_cd_grupo: TMaskEdit
        Left = 11
        Top = 11
        Width = 30
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
        OnChange = msk_cd_grupoChange
        OnExit = msk_cd_grupoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_analista_comissaria: TMaskEdit
        Left = 11
        Top = 86
        Width = 42
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
        OnExit = msk_cd_analista_comissariaExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_analista_comissaria: TEdit
        Left = 54
        Top = 86
        Width = 242
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 16
      end
      object msk_dt_inicio: TDateEdit
        Left = 11
        Top = 167
        Width = 93
        Height = 21
        NumGlyphs = 2
        TabOrder = 4
      end
      object msk_dt_fim: TDateEdit
        Left = 137
        Top = 167
        Width = 93
        Height = 21
        NumGlyphs = 2
        TabOrder = 5
      end
      object chk_pendentes: TCheckBox
        Left = 11
        Top = 194
        Width = 137
        Height = 13
        Caption = 'Pendentes at'#233' Hoje'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        Visible = False
      end
      object chk_refcli: TCheckBox
        Left = 11
        Top = 213
        Width = 137
        Height = 13
        Caption = 'Refer'#234'ncias Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        Visible = False
      end
      object chk_desemb: TCheckBox
        Left = 150
        Top = 193
        Width = 123
        Height = 13
        Caption = 'Desembara'#231'ados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        Visible = False
      end
      object chk_despesas: TCheckBox
        Left = 150
        Top = 212
        Width = 137
        Height = 13
        Caption = 'Ocultar Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        Visible = False
      end
      object btn_itens_erro: TButton
        Left = 237
        Top = 163
        Width = 113
        Height = 26
        Caption = 'Exibir Itens sem Grupo'
        TabOrder = 10
        Visible = False
        OnClick = btn_itens_erroClick
      end
      object chk_resumido: TCheckBox
        Left = 275
        Top = 193
        Width = 82
        Height = 13
        Caption = 'Resumido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 17
        Visible = False
      end
      object chkFaturados: TCheckBox
        Left = 275
        Top = 212
        Width = 82
        Height = 13
        Caption = 'Faturados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 18
      end
    end
  end
  object crp_unid_prod: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 335
    Top = 334
  end
end

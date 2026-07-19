object frm_DI_NVE: Tfrm_DI_NVE
  Left = 151
  Top = 202
  Width = 474
  Height = 260
  Caption = 'Nomenclatura de Valor Aduaneiro e Estat'#237'stica'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 4
    Top = 8
    Width = 457
    Height = 181
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 0
    object Label2: TLabel
      Left = 63
      Top = 32
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#237'vel'
    end
    object Label3: TLabel
      Left = 14
      Top = 136
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = 'Especifica'#231#227'o'
      FocusControl = dbedt_cd_especif_ncm
    end
    object Label1: TLabel
      Left = 50
      Top = 84
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Atributo'
      FocusControl = dbedt_cd_atributo_ncm
    end
    object btn_co_atributo_nve: TSpeedButton
      Left = 416
      Top = 80
      Width = 25
      Height = 21
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
      OnClick = btn_co_atributo_nveClick
    end
    object btn_co_espec_nve: TSpeedButton
      Left = 416
      Top = 132
      Width = 25
      Height = 21
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
      OnClick = btn_co_espec_nveClick
    end
    object btn_co_nivel: TSpeedButton
      Left = 416
      Top = 29
      Width = 25
      Height = 21
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
      OnClick = btn_co_nivelClick
    end
    object dbedt_cd_especif_ncm: TDBEdit
      Left = 108
      Top = 132
      Width = 37
      Height = 21
      DataField = 'CD_ESPECIF_NCM'
      DataSource = datm_DI_Adicao.ds_nve
      TabOrder = 2
      OnChange = dbedt_cd_especif_ncmChange
      OnExit = dbedt_cd_especif_ncmExit
      OnKeyDown = dbedt_cd_atributo_ncmKeyDown
    end
    object dbedt_cd_atributo_ncm: TDBEdit
      Left = 108
      Top = 80
      Width = 29
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CD_ATRIBUTO_NCM'
      DataSource = datm_DI_Adicao.ds_nve
      TabOrder = 1
      OnChange = dbedt_cd_especif_ncmChange
      OnExit = dbedt_cd_atributo_ncmExit
      OnKeyDown = dbedt_cd_atributo_ncmKeyDown
    end
    object dbedt_desc_atributo: TDBEdit
      Left = 140
      Top = 80
      Width = 273
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'LookAtributo'
      DataSource = datm_DI_Adicao.ds_nve
      ReadOnly = True
      TabOrder = 3
      OnChange = dbedt_cd_especif_ncmChange
    end
    object dbedt_desc_especif: TDBEdit
      Left = 148
      Top = 132
      Width = 265
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CD_ESPECIF_NCM'
      DataSource = datm_DI_Adicao.ds_espec_nve
      ReadOnly = True
      TabOrder = 4
      OnChange = dbedt_cd_especif_ncmChange
    end
    object dbedt_cd_nivel: TDBEdit
      Left = 108
      Top = 29
      Width = 29
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CD_NIVEL_NVE'
      DataSource = datm_DI_Adicao.ds_nve
      TabOrder = 0
      OnChange = dbedt_cd_especif_ncmChange
      OnExit = dbedt_cd_atributo_ncmExit
      OnKeyDown = dbedt_cd_atributo_ncmKeyDown
    end
    object dbedt_nm_nivel: TDBEdit
      Left = 140
      Top = 29
      Width = 273
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'LookNivel'
      DataSource = datm_DI_Adicao.ds_nve
      ReadOnly = True
      TabOrder = 5
      OnChange = dbedt_cd_especif_ncmChange
    end
  end
  object btn_salvar: TButton
    Left = 133
    Top = 200
    Width = 73
    Height = 21
    Caption = '&Salvar'
    Enabled = False
    TabOrder = 1
    OnClick = btn_salvarClick
  end
  object btn_cancelar: TButton
    Left = 233
    Top = 200
    Width = 73
    Height = 21
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
    OnClick = btn_cancelarClick
  end
end

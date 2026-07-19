object frm_gerar_consolidada: Tfrm_gerar_consolidada
  Left = 190
  Top = 109
  Width = 720
  Height = 510
  Caption = 'Gerar Conhecimento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_exp_aerea: TPanel
    Left = 0
    Top = 52
    Width = 712
    Height = 190
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 12
      Width = 117
      Height = 13
      Caption = 'Unidade de Neg'#243'cio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 348
      Top = 12
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
    object Label3: TLabel
      Left = 14
      Top = 55
      Width = 41
      Height = 13
      Caption = 'Agente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lb_cia_arm: TLabel
      Left = 348
      Top = 55
      Width = 63
      Height = 13
      Caption = 'Companhia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 14
      Top = 99
      Width = 40
      Height = 13
      Caption = 'Origem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 348
      Top = 99
      Width = 44
      Height = 13
      Caption = 'Destino'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 14
      Top = 143
      Width = 39
      Height = 13
      Caption = 'Moeda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_unid: TSpeedButton
      Left = 307
      Top = 69
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
      Visible = False
    end
    object SpeedButton1: TSpeedButton
      Left = 307
      Top = 112
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
      Visible = False
    end
    object SpeedButton3: TSpeedButton
      Left = 658
      Top = 68
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
      Visible = False
    end
    object SpeedButton4: TSpeedButton
      Left = 658
      Top = 110
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
      Visible = False
    end
    object lb_voo: TLabel
      Left = 110
      Top = 142
      Width = 40
      Height = 13
      Caption = 'Nr V'#244'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lb_dt_voo: TLabel
      Left = 250
      Top = 142
      Width = 72
      Height = 13
      Caption = 'Data do V'#244'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lb_navio: TLabel
      Left = 348
      Top = 143
      Width = 34
      Height = 13
      Caption = 'Navio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_navio: TSpeedButton
      Left = 658
      Top = 155
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
      OnClick = btn_co_navioClick
    end
    object edt_nm_unid_aerea: TEdit
      Left = 43
      Top = 25
      Width = 289
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 7
    end
    object edt_nm_agente_aerea: TEdit
      Left = 56
      Top = 69
      Width = 250
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 8
    end
    object edt_nm_prod_aerea: TEdit
      Left = 374
      Top = 25
      Width = 309
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 9
    end
    object edt_nm_cia_aerea: TEdit
      Left = 387
      Top = 69
      Width = 270
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 10
    end
    object edt_nm_orig_aerea: TEdit
      Left = 57
      Top = 112
      Width = 249
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 11
    end
    object edt_nm_dest_aerea: TEdit
      Left = 387
      Top = 112
      Width = 270
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 12
    end
    object edt_nm_moeda_aerea: TEdit
      Left = 42
      Top = 156
      Width = 56
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 13
    end
    object edt_nr_voo: TEdit
      Left = 111
      Top = 156
      Width = 128
      Height = 21
      MaxLength = 14
      TabOrder = 14
    end
    object msk_dt_voo: TMaskEdit
      Left = 251
      Top = 156
      Width = 82
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 15
      Text = '  /  /    '
    end
    object edt_nm_navio: TEdit
      Left = 389
      Top = 156
      Width = 268
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 17
    end
    object msk_cd_unid_aerea: TMaskEdit
      Left = 14
      Top = 25
      Width = 30
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 0
    end
    object msk_cd_agente_aerea: TMaskEdit
      Left = 14
      Top = 69
      Width = 43
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
    object msk_cd_orig_aerea: TMaskEdit
      Left = 14
      Top = 112
      Width = 44
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
    end
    object msk_cd_moeda_aerea: TMaskEdit
      Left = 14
      Top = 156
      Width = 29
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 6
    end
    object msk_cd_navio: TMaskEdit
      Left = 348
      Top = 156
      Width = 42
      Height = 21
      EditMask = '9999;1;_'
      MaxLength = 4
      TabOrder = 16
      Text = '    '
      OnExit = msk_cd_navioExit
    end
    object msk_cd_dest_aerea: TMaskEdit
      Left = 348
      Top = 112
      Width = 40
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 5
    end
    object msk_cd_cia_aerea: TMaskEdit
      Left = 348
      Top = 69
      Width = 40
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object msk_cd_prod_aerea: TMaskEdit
      Left = 348
      Top = 25
      Width = 27
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnl_lista_marit: TPanel
    Left = 0
    Top = 242
    Width = 712
    Height = 222
    Align = alClient
    TabOrder = 2
    object Label4: TLabel
      Left = 3
      Top = 2
      Width = 20
      Height = 17
      AutoSize = False
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label9: TLabel
      Left = 25
      Top = 2
      Width = 79
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Processos'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label10: TLabel
      Left = 108
      Top = 2
      Width = 243
      Height = 17
      AutoSize = False
      Caption = 'Cliente'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label11: TLabel
      Left = 356
      Top = 2
      Width = 215
      Height = 17
      AutoSize = False
      Caption = 'Importador'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label18: TLabel
      Left = 575
      Top = 2
      Width = 68
      Height = 17
      AutoSize = False
      Caption = 'Estufagem'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbgrid_maritimo: TDBGrid
      Left = 1
      Top = -17
      Width = 710
      Height = 238
      Align = alBottom
      Color = clMenu
      DataSource = datm_gerar_consolidada.ds_lista_proc
      Options = [dgEditing, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = dbgrid_maritimoCellClick
      OnColEnter = dbgrid_maritimoColEnter
      OnColExit = dbgrid_maritimoColExit
      OnDrawColumnCell = dbgrid_maritimoDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'IN_SELECIONADO'
          Width = 18
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_processo'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_CLIENTE'
          Width = 245
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_IMP'
          Width = 218
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_estufagem'
          Width = 60
          Visible = True
        end>
    end
  end
  object pnl_master: TPanel
    Left = 0
    Top = 242
    Width = 712
    Height = 222
    Align = alClient
    TabOrder = 3
    object DBCtrlGrid2: TDBCtrlGrid
      Left = 1
      Top = 23
      Width = 710
      Height = 228
      DataSource = datm_gerar_consolidada.ds_proc_conhec
      PanelHeight = 19
      PanelWidth = 694
      TabOrder = 0
      RowCount = 12
      SelectedColor = clTeal
      object DBText4: TDBText
        Left = 9
        Top = 3
        Width = 97
        Height = 16
        DataField = 'NR_HOUSE'
        DataSource = datm_gerar_consolidada.ds_proc_conhec
      end
      object DBText5: TDBText
        Left = 116
        Top = 18
        Width = 285
        Height = 17
        DataField = 'NM_CLIENTE'
        DataSource = datm_gerar_consolidada.ds_proc_conhec
      end
      object DBText6: TDBText
        Left = 454
        Top = 3
        Width = 181
        Height = 17
        DataField = 'NM_IMP'
        DataSource = datm_gerar_consolidada.ds_proc_conhec
      end
      object DBText7: TDBText
        Left = 202
        Top = 3
        Width = 210
        Height = 16
        DataField = 'NM_CLIENTE'
        DataSource = datm_gerar_consolidada.ds_proc_conhec
      end
      object DBText8: TDBText
        Left = 111
        Top = 3
        Width = 83
        Height = 17
        DataField = 'calc_processo'
        DataSource = datm_gerar_consolidada.ds_proc_conhec
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 694
      Height = 22
      Caption = 'Panel1'
      TabOrder = 1
      object Label15: TLabel
        Left = 3
        Top = 2
        Width = 105
        Height = 17
        AutoSize = False
        Caption = 'N'#186' House'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label16: TLabel
        Left = 110
        Top = 2
        Width = 87
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Processos'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label8: TLabel
        Left = 202
        Top = 2
        Width = 245
        Height = 17
        AutoSize = False
        Caption = ' Cliente'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 451
        Top = 1
        Width = 240
        Height = 17
        AutoSize = False
        Caption = 'Importador'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
  end
  object pnl_selecao: TPanel
    Left = 0
    Top = 242
    Width = 712
    Height = 222
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object Label19: TLabel
      Left = 0
      Top = 0
      Width = 712
      Height = 17
      Align = alTop
      AutoSize = False
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label12: TLabel
      Left = 21
      Top = 3
      Width = 89
      Height = 13
      AutoSize = False
      Caption = 'Processos'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label13: TLabel
      Left = 109
      Top = 3
      Width = 296
      Height = 13
      AutoSize = False
      Caption = 'Cliente'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label14: TLabel
      Left = 405
      Top = 3
      Width = 289
      Height = 13
      AutoSize = False
      Caption = 'Importador'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object dbgrid_aereo: TDBGrid
      Left = 0
      Top = 17
      Width = 712
      Height = 205
      Align = alClient
      Color = clMenu
      Ctl3D = False
      DataSource = datm_gerar_consolidada.ds_lista_proc
      Options = [dgEditing, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = dbgrid_aereoCellClick
      OnColEnter = dbgrid_aereoColEnter
      OnColExit = dbgrid_aereoColExit
      OnDrawColumnCell = dbgrid_aereoDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'IN_SELECIONADO'
          Width = 18
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calc_processo'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_CLIENTE'
          Width = 295
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_IMP'
          Width = 230
          Visible = True
        end>
    end
  end
  object pnl_manut_proc: TPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 52
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      712
      52)
    object btn_sair: TSpeedButton
      Left = 662
      Top = 4
      Width = 45
      Height = 44
      Hint = 'Sair'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_sairClick
    end
    object btn_liberar: TSpeedButton
      Left = 4
      Top = 4
      Width = 43
      Height = 44
      Hint = 'Gerar Consolidada'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_liberarClick
    end
    object btn_marcar: TSpeedButton
      Left = 95
      Top = 4
      Width = 43
      Height = 44
      Hint = 'Marcar todos'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_marcarClick
    end
    object lb_master_book: TLabel
      Left = 166
      Top = 7
      Width = 39
      Height = 13
      Caption = 'Master'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_inclir_house: TSpeedButton
      Left = 47
      Top = 4
      Width = 43
      Height = 44
      Hint = 'Incluir House'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_inclir_houseClick
    end
    object edt_master: TEdit
      Left = 168
      Top = 21
      Width = 134
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 0
    end
    object edt_nr_book: TEdit
      Left = 167
      Top = 21
      Width = 136
      Height = 21
      MaxLength = 14
      TabOrder = 1
      OnExit = edt_nr_bookExit
    end
    object rdgroup_estufagem: TRadioGroup
      Left = 321
      Top = 5
      Width = 151
      Height = 39
      Caption = 'Estufagem'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'LCL'
        'FCL')
      ParentFont = False
      TabOrder = 2
    end
  end
  object MainMenu1: TMainMenu
    Left = 584
    Top = 393
    object mi_gera_conso: TMenuItem
      Caption = '&Gerar Consolidada'
      OnClick = btn_liberarClick
    end
    object mi_incl_house: TMenuItem
      Caption = 'Incluir House'
      Visible = False
      OnClick = btn_inclir_houseClick
    end
    object mi_marca: TMenuItem
      Caption = 'Marcar Todos'
      Hint = 'Marcar Todos'
      OnClick = btn_marcarClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end

object frm_po_flp: Tfrm_po_flp
  Left = 80
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Realiza'#231#227'o de Pedido/Gest'#227'o'
  ClientHeight = 526
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_manut
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    742
    526)
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_ev_comum: TPanel
    Left = 0
    Top = 153
    Width = 742
    Height = 116
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = False
    ParentColor = True
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    DesignSize = (
      742
      116)
    object shp12: TShape
      Left = 4
      Top = 7
      Width = 734
      Height = 105
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object shp5: TShape
      Left = 10
      Top = 15
      Width = 723
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object lblTituloComum: TLabel
      Left = 7
      Top = 0
      Width = 78
      Height = 13
      Caption = ' Comum - PO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
    end
    object lbl_02: TLabel
      Left = 13
      Top = 17
      Width = 41
      Height = 13
      Caption = 'Evento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_01: TLabel
      Left = 319
      Top = 17
      Width = 44
      Height = 13
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_04: TLabel
      Left = 401
      Top = 17
      Width = 40
      Height = 13
      Caption = 'Aplicar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_05: TLabel
      Left = 539
      Top = 17
      Width = 47
      Height = 13
      Caption = 'Previsto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lbl_07: TLabel
      Left = 447
      Top = 17
      Width = 57
      Height = 13
      Caption = 'Realizada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_06: TLabel
      Left = 631
      Top = 17
      Width = 51
      Height = 13
      Caption = 'Varia'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object dbgrdEventoComum: TDBGrid
      Left = 10
      Top = 31
      Width = 723
      Height = 76
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsFollowupPO
      Options = [dgEditing, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawDataCell = dbgrdEventoComumDrawDataCell
      OnDrawColumnCell = dbgrdEventoComumDrawColumnCell
      OnDblClick = dbgrdEventoComumDblClick
      OnKeyDown = dbgrdEventoEspecKeyDown
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CD_EVENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_EVENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 275
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AP_USUARIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5197647
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clInfoBk
          Expanded = False
          FieldName = 'IN_APLICAVEL'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clTeal
          Font.Height = -15
          Font.Name = 'Wingdings'
          Font.Style = [fsBold]
          Width = 50
          Visible = True
        end
        item
          Color = 16119285
          Expanded = False
          FieldName = 'DT_PREVISTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DT_REALIZACAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calcAtrazo'
          ReadOnly = True
          Visible = False
        end>
    end
  end
  object pnl_selecao: TPanel
    Left = 0
    Top = 50
    Width = 742
    Height = 103
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    DesignSize = (
      742
      103)
    object shp3: TShape
      Left = 4
      Top = 4
      Width = 734
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp4: TShape
      Left = 4
      Top = 55
      Width = 734
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lbl_nr_processo_po: TLabel
      Left = 360
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Nr. Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btn_po: TSpeedButton
      Left = 462
      Top = 21
      Width = 25
      Height = 23
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
      OnClick = btn_poClick
    end
    object lbl_produto: TLabel
      Left = 186
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btn_cd_produto: TSpeedButton
      Left = 327
      Top = 21
      Width = 25
      Height = 23
      Enabled = False
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
      OnClick = btn_cd_produtoClick
    end
    object lbl_unidade: TLabel
      Left = 12
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btn_cd_unid_neg: TSpeedButton
      Left = 153
      Top = 21
      Width = 25
      Height = 23
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
    object btn_processo: TSpeedButton
      Left = 597
      Top = 21
      Width = 25
      Height = 23
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
      OnClick = btn_processoClick
    end
    object lbl_nr_processo: TLabel
      Left = 495
      Top = 8
      Width = 61
      Height = 13
      Caption = 'Nr. Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl_importador: TLabel
      Left = 251
      Top = 60
      Width = 50
      Height = 13
      Caption = 'Importador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lbl_cd_servico: TLabel
      Left = 494
      Top = 60
      Width = 36
      Height = 13
      Caption = 'Servi'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 8
      Top = 60
      Width = 32
      Height = 13
      Caption = 'Cliente'
      Transparent = True
    end
    object msk_nr_po: TMaskEdit
      Left = 360
      Top = 22
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnEnter = msk_nr_poEnter
      OnExit = msk_nr_poExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 210
      Top = 22
      Width = 115
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object edt_nm_unid_neg: TEdit
      Left = 36
      Top = 22
      Width = 115
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object msk_nr_processo: TMaskEdit
      Left = 495
      Top = 22
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnEnter = msk_nr_processoEnter
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 12
      Top = 22
      Width = 25
      Height = 21
      EditMask = '!99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      OnChange = btn_cd_unid_negClick
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_produto: TMaskEdit
      Left = 186
      Top = 22
      Width = 25
      Height = 21
      TabStop = False
      Enabled = False
      EditMask = '!99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 2
      OnChange = btn_cd_produtoClick
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object chkUltimosProcessos: TCheckBox
      Left = 628
      Top = 24
      Width = 102
      Height = 17
      TabStop = False
      Caption = #250'ltimos processos'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object dbedt_cd_cliente: TDBEdit
      Left = 251
      Top = 74
      Width = 37
      Height = 19
      TabStop = False
      AutoSize = False
      BevelKind = bkSoft
      BorderStyle = bsNone
      Ctl3D = False
      DataField = 'CD_IMPORTADOR'
      DataSource = dsPo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object dbedt_ap_empresa: TDBEdit
      Left = 290
      Top = 74
      Width = 200
      Height = 19
      TabStop = False
      AutoSize = False
      BevelKind = bkSoft
      BorderStyle = bsNone
      Ctl3D = False
      DataField = 'NM_IMPORTADOR'
      DataSource = dsPo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object dbedt_cd_servico: TDBEdit
      Left = 494
      Top = 74
      Width = 38
      Height = 19
      TabStop = False
      AutoSize = False
      BevelKind = bkSoft
      BorderStyle = bsNone
      Ctl3D = False
      DataField = 'CD_SERVICO'
      DataSource = dsPo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object dbedt_nm_servico: TDBEdit
      Left = 534
      Top = 74
      Width = 200
      Height = 19
      TabStop = False
      AutoSize = False
      BevelKind = bkSoft
      BorderStyle = bsNone
      Ctl3D = False
      DataField = 'NM_SERVICO'
      DataSource = dsPo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object edt_cd_cliente: TEdit
      Left = 8
      Top = 74
      Width = 37
      Height = 19
      AutoSize = False
      BevelKind = bkSoft
      BorderStyle = bsNone
      Color = clBtnFace
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 11
      OnChange = edt_cd_clienteChange
    end
    object edt_nm_cliente: TEdit
      Left = 47
      Top = 74
      Width = 200
      Height = 19
      AutoSize = False
      BevelKind = bkSoft
      BorderStyle = bsNone
      Color = clBtnFace
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 12
    end
  end
  object pnl_ev_espec: TPanel
    Left = 0
    Top = 269
    Width = 742
    Height = 257
    Align = alClient
    BevelOuter = bvNone
    Ctl3D = False
    ParentColor = True
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    DesignSize = (
      742
      257)
    object shp13: TShape
      Left = 4
      Top = 33
      Width = 734
      Height = 177
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object shp9: TShape
      Left = 10
      Top = 42
      Width = 723
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object lblTituloEspec: TLabel
      Left = 8
      Top = 26
      Width = 76
      Height = 13
      Caption = 'Itens da PO  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
    end
    object lbl_08: TLabel
      Left = 319
      Top = 44
      Width = 44
      Height = 13
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_09: TLabel
      Left = 13
      Top = 44
      Width = 41
      Height = 13
      Caption = 'Evento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_11: TLabel
      Left = 401
      Top = 44
      Width = 40
      Height = 13
      Caption = 'Aplicar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lbl_12: TLabel
      Left = 532
      Top = 44
      Width = 46
      Height = 13
      Caption = 'Desvios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lbl_13: TLabel
      Left = 631
      Top = 44
      Width = 51
      Height = 13
      Caption = 'Varia'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lbl_14: TLabel
      Left = 448
      Top = 44
      Width = 57
      Height = 13
      Caption = 'Realizada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dbgrdEventoEspec: TDBGrid
      Left = 10
      Top = 58
      Width = 723
      Height = 150
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsFollowupPOItem
      Options = [dgEditing, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawDataCell = dbgrdEventoEspecDrawDataCell
      OnDrawColumnCell = dbgrdEventoEspecDrawColumnCell
      OnDblClick = dbgrdEventoEspecDblClick
      OnKeyDown = dbgrdEventoEspecKeyDown
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CD_EVENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_EVENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 275
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AP_USUARIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5197647
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clInfoBk
          Expanded = False
          FieldName = 'IN_APLICAVEL'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clTeal
          Font.Height = -15
          Font.Name = 'Wingdings'
          Font.Style = [fsBold]
          Width = 50
          Visible = True
        end
        item
          Color = 16119285
          Expanded = False
          FieldName = 'DT_PREVISTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DT_REALIZACAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calcAtrazo'
          ReadOnly = True
          Visible = False
        end>
    end
    object pnlEtapaItem: TPanel
      Left = 83
      Top = 2
      Width = 656
      Height = 38
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      DesignSize = (
        656
        38)
      object shp8: TShape
        Left = 1
        Top = 0
        Width = 654
        Height = 38
        Brush.Color = 14342874
        Pen.Color = clGray
      end
      object lbl_nr_item_cliente: TLabel
        Left = 360
        Top = 3
        Width = 68
        Height = 13
        Caption = 'Item Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblUltimaEtapa: TLabel
        Left = 3
        Top = 3
        Width = 70
        Height = 13
        Caption = 'Status Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object btnIncluirEtapa: TSpeedButton
        Left = 211
        Top = 6
        Width = 27
        Height = 27
        Hint = 'Incluir um novo status'
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
          0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
          33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btnIncluirEtapaClick
      end
      object btnFollowupEtapa: TSpeedButton
        Left = 239
        Top = 6
        Width = 27
        Height = 27
        Hint = 'Visualizar hist'#243'rico de status'
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
          333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
          C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
          F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
          F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
          00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
          3333333373FF7333333333333000333333333333377733333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btnFollowupEtapaClick
      end
      object Label1: TLabel
        Left = 407
        Top = 19
        Width = 7
        Height = 13
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel
        Left = 457
        Top = 3
        Width = 101
        Height = 13
        Caption = 'N'#186' Processo Des.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object shp14: TShape
        Left = 268
        Top = 2
        Width = 385
        Height = 35
        Anchors = [akLeft, akTop, akRight]
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label3: TLabel
        Left = 576
        Top = 3
        Width = 43
        Height = 13
        Caption = 'Invoice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object SpeedButton1: TSpeedButton
        Left = 555
        Top = 15
        Width = 18
        Height = 19
        Hint = 
          'Atalho para '#13#10'Tela de Manuten'#231#227'o de Processos ou Followup Desemb' +
          'ara'#231'o'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555FFFFFFFFFF55555000000000055555577777777775FFFF00B8B8B8B8B0
          0000775F5555555777770B0B8B8B8B8B0FF07F75F555555575F70FB0B8B8B8B8
          B0F07F575FFFFFFFF7F70BFB0000000000F07F557777777777570FBFBF0FFFFF
          FFF07F55557F5FFFFFF70BFBFB0F000000F07F55557F777777570FBFBF0FFFFF
          FFF075F5557F5FFFFFF750FBFB0F000000F0575FFF7F777777575700000FFFFF
          FFF05577777F5FF55FF75555550F00FF00005555557F775577775555550FFFFF
          0F055555557F55557F755555550FFFFF00555555557FFFFF7755555555000000
          0555555555777777755555555555555555555555555555555555}
        NumGlyphs = 2
        PopupMenu = ppmAtalhos
        OnClick = SpeedButton1Click
      end
      object msk_item_cliente: TMaskEdit
        Left = 362
        Top = 15
        Width = 40
        Height = 17
        TabStop = False
        BevelKind = bkFlat
        BorderStyle = bsNone
        Ctl3D = False
        EditMask = '9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 4
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnExit = msk_item_clienteExit
      end
      object edtUltimaEtapa: TEdit
        Left = 4
        Top = 16
        Width = 204
        Height = 17
        AutoSize = False
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object CmbParciais: TComboBox
        Left = 419
        Top = 14
        Width = 36
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = '1'
        OnChange = CmbParciaisChange
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          'S')
      end
      object EditNR_PROCESSO_DES: TEdit
        Left = 459
        Top = 16
        Width = 94
        Height = 17
        AutoSize = False
        Color = clBtnFace
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object dbnav_item_po: TDBNavigator
        Left = 270
        Top = 8
        Width = 84
        Height = 23
        DataSource = dsPoItem
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Enabled = False
        Flat = True
        Hints.Strings = (
          'Primeiro item'
          'Item Anterior'
          'Pr'#243'ximo item'
          #218'ltimo item')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = dbnav_item_poClick
      end
      object DBEdit1: TDBEdit
        Left = 576
        Top = 16
        Width = 72
        Height = 19
        TabStop = False
        AutoSize = False
        BevelKind = bkSoft
        BorderStyle = bsNone
        Ctl3D = False
        DataField = 'NR_FATURA'
        DataSource = dsPoItem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
    end
  end
  object pnlComandos: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 50
    Align = alTop
    BevelInner = bvLowered
    ParentColor = True
    TabOrder = 0
    DesignSize = (
      742
      50)
    object shp1: TShape
      Left = 476
      Top = 9
      Width = 261
      Height = 36
      Anchors = [akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object shp2: TShape
      Left = 481
      Top = 5
      Width = 150
      Height = 15
      Anchors = [akTop, akRight]
      Brush.Color = 15658734
      Pen.Color = clGray
    end
    object btnManutPedido: TSpeedButton
      Left = 5
      Top = 5
      Width = 41
      Height = 41
      Hint = 'Manuten'#231#227'o do PO'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FF555FFFFFFF5FF0075500000005000775F57777777F7770B0550CC0090
        50E07F7F57FF77F7F7F70B055000000050E07F75F7777777F7F70B7750CC0090
        50E075F7F7F577F7F7F777B050CC009050E057F7F7F577F7F7F750B050CC0090
        50E057F757F577F7F7F750B770CC009050E0575F77F577F7F7F7577B00CC0090
        50E0557F77F577F7F7F7550B30CC00905000557F57FF77F7F777550B30000090
        50E05575F77777F7F7F7557000CC00905000555777FF77F7F777555550000090
        55555555577777F7F5555555555550005555555555555777F555555555555090
        55555555555557F7F55555555555500055555555555557775555}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnManutPedidoClick
    end
    object btnGestaoPedido: TSpeedButton
      Left = 48
      Top = 5
      Width = 41
      Height = 41
      Hint = 'Gest'#227'o do PO'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300033300000
        00003777FF377777777707070330FFFFFFF077777F37F3FF3FF707370330F00F
        00F077F77F37F773773707370330FFFFFFF077F77F37F3FFFF3707070330F000
        0FF077777337F777733730003330FFFFFFF037773337F3FF3FF733033330F00F
        0000337FFF37F773777733000330FFFF0FF033777FF7F3FF7F3733007030F08F
        0F03337777F7F7737F7330703700FFFF003337773777FFFF7733307333700000
        0333377FF37777777FFF33073070333000033377F777FF37777F333077000307
        7770333777777F7777773333003300003300333377337777FF77333333333307
        7770333333333377777733333333333000033333333333377773}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnGestaoPedidoClick
    end
    object btnAtzFup: TSpeedButton
      Left = 192
      Top = 5
      Width = 41
      Height = 41
      Hint = 'Atualiza Datas Previstas'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btnAtzFupClick
    end
    object btn_sair: TSpeedButton
      Left = 431
      Top = 5
      Width = 41
      Height = 41
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
      OnClick = btn_sairClick
    end
    object lbl_proc_evento: TLabel
      Left = 485
      Top = 6
      Width = 139
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'busca r'#225'pida por evento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_obs_po: TSpeedButton
      Left = 91
      Top = 5
      Width = 99
      Height = 41
      Hint = 
        'Para ativar este controle, clique sobre o evento '#39'022 - Observa'#231 +
        #245'es'#39
      Caption = '&Observa'#231#245'es'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
        055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
        88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
        F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
        F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
        0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
        00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
        0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
        05555575FF777777755555500055555555555557775555555555}
      NumGlyphs = 2
      Spacing = 10
      OnClick = btn_obs_poClick
    end
    object lbl_item: TLabel
      Left = 290
      Top = 8
      Width = 25
      Height = 13
      Caption = 'Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lbl_00: TLabel
      Left = 322
      Top = 8
      Width = 7
      Height = 13
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object rbTipoBuscaComum: TRadioButton
      Left = 664
      Top = 13
      Width = 55
      Height = 12
      Anchors = [akTop, akRight]
      Caption = 'comum'
      Enabled = False
      TabOrder = 0
      OnClick = rbTipoBuscaComumClick
    end
    object rbTipoBuscaEspec: TRadioButton
      Left = 664
      Top = 28
      Width = 70
      Height = 12
      Anchors = [akTop, akRight]
      Caption = 'espec'#237'fico'
      Checked = True
      Enabled = False
      TabOrder = 1
      TabStop = True
      OnClick = rbTipoBuscaEspecClick
    end
    object edtBuscaEvento: TEdit
      Left = 481
      Top = 21
      Width = 180
      Height = 19
      TabStop = False
      Anchors = [akTop, akRight]
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      OnChange = edtBuscaEventoChange
    end
    object msk_item: TMaskEdit
      Left = 291
      Top = 23
      Width = 29
      Height = 17
      TabStop = False
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = False
      EditMask = '999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Visible = False
    end
    object msk_total_item: TMaskEdit
      Left = 334
      Top = 23
      Width = 28
      Height = 17
      TabStop = False
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = False
      EditMask = '999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Visible = False
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 478
    Width = 742
    Height = 26
    Anchors = [akLeft, akRight, akBottom]
    BevelInner = bvLowered
    TabOrder = 5
    DesignSize = (
      742
      26)
    object chkRealizaLote: TCheckBox
      Left = 487
      Top = 5
      Width = 250
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Efetuar as altera'#231#245'es em todos os itens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnlEtapa: TPanel
    Left = 155
    Top = 358
    Width = 431
    Height = 86
    Anchors = [akTop]
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 4
    Visible = False
    DesignSize = (
      431
      86)
    object shp10: TShape
      Left = 7
      Top = 7
      Width = 417
      Height = 19
      Anchors = [akTop, akRight]
      Brush.Color = 15658734
      Pen.Color = clGray
    end
    object shp11: TShape
      Left = 364
      Top = 10
      Width = 57
      Height = 30
      Anchors = [akTop, akRight]
      Brush.Color = 13290186
      Pen.Color = clGray
    end
    object lblCodigo: TLabel
      Left = 14
      Top = 35
      Width = 40
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = dbedtCodigo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEtapa: TLabel
      Left = 76
      Top = 35
      Width = 37
      Height = 13
      Caption = 'Status'
      FocusControl = dbedtCodigoEtapa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnConsultaEtapa: TSpeedButton
      Left = 391
      Top = 49
      Width = 24
      Height = 21
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
      OnClick = btnConsultaEtapaClick
    end
    object btnSalvarEtapa: TSpeedButton
      Left = 369
      Top = 14
      Width = 23
      Height = 22
      Hint = 'Salvar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSalvarEtapaClick
    end
    object btnCancelarEtapa: TSpeedButton
      Left = 394
      Top = 14
      Width = 23
      Height = 22
      Hint = 'Cancelar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelarEtapaClick
    end
    object lbl35: TLabel
      Left = 10
      Top = 10
      Width = 180
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Cadastro de status do processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dbedtCodigo: TDBEdit
      Left = 15
      Top = 49
      Width = 50
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'CD_FLP_PO_ITEM_ETAPA'
      DataSource = dsFlpPoItemEtapa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtNomeEtapa: TEdit
      Left = 127
      Top = 49
      Width = 263
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
    object dbedtCodigoEtapa: TDBEdit
      Left = 77
      Top = 49
      Width = 51
      Height = 21
      DataField = 'CD_ETAPA'
      DataSource = dsFlpPoItemEtapa
      TabOrder = 1
      OnChange = btnConsultaEtapaClick
    end
  end
  object pnlAguarde: TPanel
    Left = 271
    Top = 214
    Width = 199
    Height = 41
    Anchors = [akTop]
    BevelInner = bvLowered
    Caption = '        aguarde processamento...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Visible = False
    DesignSize = (
      199
      41)
    object shp7: TShape
      Left = 36
      Top = 5
      Width = 158
      Height = 31
      Anchors = [akLeft, akTop, akRight]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lbl20: TLabel
      Left = 14
      Top = 10
      Width = 12
      Height = 21
      Caption = '6'
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Wingdings'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object shp6: TShape
      Left = 5
      Top = 5
      Width = 30
      Height = 31
      Brush.Style = bsClear
      Pen.Color = clGray
    end
  end
  object pnl_info_pendencias: TPanel
    Left = 0
    Top = 508
    Width = 742
    Height = 20
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 7
    object lbl_pendencias1: TLabel
      Left = 49
      Top = 0
      Width = 71
      Height = 20
      Cursor = crHandPoint
      Align = alRight
      BiDiMode = bdLeftToRight
      Caption = ' Pend'#234'ncias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 206
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Visible = False
      OnClick = lbl_pendencias1Click
    end
    object dbtxt_pendencias_total: TDBText
      Left = 273
      Top = 0
      Width = 133
      Height = 20
      Cursor = crHandPoint
      Align = alRight
      AutoSize = True
      DataField = 'CONTADOR_TOTAL'
      DataSource = dsPendencias
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 206
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = lbl_pendencias1Click
    end
    object lbl_pendencias3: TLabel
      Left = 129
      Top = 0
      Width = 71
      Height = 20
      Cursor = crHandPoint
      Align = alRight
      BiDiMode = bdLeftToRight
      Caption = ' solicitadas/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 206
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Visible = False
      OnClick = lbl_pendencias1Click
    end
    object dbtxt_pendencias_solicitadas: TDBText
      Left = 406
      Top = 0
      Width = 168
      Height = 20
      Cursor = crHandPoint
      Align = alRight
      AutoSize = True
      DataField = 'CONTADOR_ANDAMENTO'
      DataSource = dsPendencias
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 206
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = lbl_pendencias1Click
    end
    object lbl_pendencias2: TLabel
      Left = 120
      Top = 0
      Width = 9
      Height = 20
      Cursor = crHandPoint
      Align = alRight
      BiDiMode = bdLeftToRight
      Caption = ' ('
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 206
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Visible = False
      OnClick = lbl_pendencias1Click
    end
    object dbtxt_pendencias_finalizadas: TDBText
      Left = 574
      Top = 0
      Width = 168
      Height = 20
      Cursor = crHandPoint
      Align = alRight
      AutoSize = True
      DataField = 'CONTADOR_FINALIZADA'
      DataSource = dsPendencias
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 206
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = lbl_pendencias1Click
    end
    object lbl_pendencias4: TLabel
      Left = 200
      Top = 0
      Width = 73
      Height = 20
      Cursor = crHandPoint
      Align = alRight
      BiDiMode = bdLeftToRight
      Caption = ' finalizadas) '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 206
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Visible = False
      OnClick = lbl_pendencias1Click
    end
  end
  object menu_manut: TMainMenu
    Left = 627
    Top = 336
    object mniManutPedido: TMenuItem
      Caption = 'Manuten'#231#227'o'
      OnClick = btnManutPedidoClick
    end
    object mniGestaoPedido: TMenuItem
      Caption = 'Gest'#227'o'
    end
    object mi_sair: TMenuItem
      Caption = '&Sair'
      OnClick = btn_sairClick
    end
  end
  object dsFollowupPO: TDataSource
    DataSet = qryFollowupPO
    Left = 656
    Top = 394
  end
  object qryFollowupPO: TQuery
    CachedUpdates = True
    AfterOpen = qryFollowupPOAfterOpen
    BeforeClose = qryFollowupPOBeforeClose
    AfterClose = qryFollowupPOAfterClose
    AfterEdit = qryFollowupPOAfterEdit
    BeforePost = qryFollowupPOBeforePost
    AfterPost = qryFollowupPOAfterPost
    AfterDelete = qryFollowupPOAfterDelete
    AfterScroll = qryFollowupPOAfterScroll
    OnCalcFields = qryFollowupPOCalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT F.NR_PROCESSO, F.CD_EVENTO, F.CD_RESP_REALIZACAO, F.DT_RE' +
        'ALIZACAO,'
      '  F.DT_PREVISTA, F.DT_LIMITE, E.NM_EVENTO, U.AP_USUARIO,'
      
        '  CASE F.IN_APLICAVEL WHEN '#39'1'#39' THEN '#39#252#39' ELSE '#39#39' END IN_APLICAVEL' +
        ', F.CD_EMPRESA'
      'FROM TFLP_PO F (NOLOCK)'
      '  LEFT JOIN TEVENTO E (NOLOCK) ON (E.CD_EVENTO = F.CD_EVENTO)'
      
        '  LEFT JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = F.CD_RESP_REA' +
        'LIZACAO)'
      'WHERE F.NR_PROCESSO = :NR_PROCESSO'
      '  AND F.CD_EMPRESA = :CD_EMPRESA'
      'ORDER BY F.NR_ORDEM')
    UpdateObject = updFollowupPO
    Left = 685
    Top = 394
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
      end>
    object qryFollowupPONR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFLP_PO.NR_PROCESSO'
      Size = 18
    end
    object qryFollowupPOCD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TFLP_PO.CD_EVENTO'
      Size = 3
    end
    object qryFollowupPOCD_RESP_REALIZACAO: TStringField
      FieldName = 'CD_RESP_REALIZACAO'
      Origin = 'TFLP_PO.CD_RESP_REALIZACAO'
      Size = 4
    end
    object qryFollowupPODT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'TFLP_PO.DT_REALIZACAO'
      OnSetText = qryFollowupPODT_REALIZACAOSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryFollowupPODT_PREVISTA: TDateTimeField
      FieldName = 'DT_PREVISTA'
      Origin = 'TFLP_PO.DT_PREVISTA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryFollowupPOIN_APLICAVEL: TStringField
      FieldName = 'IN_APLICAVEL'
      FixedChar = True
      Size = 1
    end
    object qryFollowupPONM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      FixedChar = True
      Size = 50
    end
    object qryFollowupPOAP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      FixedChar = True
      Size = 15
    end
    object qryFollowupPOcalcAtraso: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcAtraso'
      Size = 10
      Calculated = True
    end
    object qryFollowupPODT_LIMITE: TDateTimeField
      FieldName = 'DT_LIMITE'
    end
    object qryFollowupPOCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
  end
  object dsFollowupPOItem: TDataSource
    DataSet = qryFollowupPOItem
    Left = 656
    Top = 423
  end
  object qryFollowupPOItem: TQuery
    CachedUpdates = True
    AfterOpen = qryFollowupPOItemAfterOpen
    BeforeClose = qryFollowupPOItemBeforeClose
    AfterClose = qryFollowupPOItemAfterClose
    AfterEdit = qryFollowupPOItemAfterEdit
    BeforePost = qryFollowupPOItemBeforePost
    AfterPost = qryFollowupPOItemAfterPost
    AfterDelete = qryFollowupPOItemAfterDelete
    AfterScroll = qryFollowupPOItemAfterScroll
    OnCalcFields = qryFollowupPOItemCalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        ' SELECT I.NR_PROCESSO, NR_ITEM, I.CD_EVENTO, I.CD_RESP_REALIZACA' +
        'O, I.DT_REALIZACAO,'
      
        '  I.DT_PREVISTA, I.DT_LIMITE, I.NR_ITEM_CLIENTE, E.NM_EVENTO, U.' +
        'AP_USUARIO, I.NR_PARCIAL, '
      
        '  CASE I.IN_APLICAVEL WHEN '#39'1'#39' THEN '#39#252#39' ELSE '#39#39' END IN_APLICAVEL' +
        ','
      '  (select QT_INICIAL from TPO_ITEM '
      '   where NR_PROCESSO = I.NR_PROCESSO'
      '     AND CD_EMPRESA = I.CD_EMPRESA'
      '     AND NR_ITEM_CLIENTE = I.NR_ITEM_CLIENTE'
      '     AND NR_PARCIAL = I.NR_PARCIAL) QT_DISP, I.CD_EMPRESA'
      'FROM TFLP_PO_ITEM I (NOLOCK)'
      '  LEFT JOIN TEVENTO E (NOLOCK) ON (E.CD_EVENTO = I.CD_EVENTO)'
      
        '  LEFT JOIN TUSUARIO U (NOLOCK) ON (U.CD_USUARIO = I.CD_RESP_REA' +
        'LIZACAO)'
      'WHERE I.NR_PROCESSO =:NR_PROCESSO'
      '  AND I.CD_EMPRESA = :CD_EMPRESA'
      '  AND I.NR_ITEM_CLIENTE =:NR_ITEM_CLIENTE'
      '  AND I.NR_PARCIAL =:NR_PARCIAL'
      'ORDER BY I.NR_ORDEM, I.NR_ITEM_CLIENTE, I.NR_PARCIAL')
    UpdateObject = updFollowupPOItem
    Left = 685
    Top = 423
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_ITEM_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PARCIAL'
        ParamType = ptUnknown
      end>
    object qryFollowupPOItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFLP_PO_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qryFollowupPOItemNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TFLP_PO_ITEM.NR_PROCESSO'
      Size = 3
    end
    object qryFollowupPOItemCD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TFLP_PO_ITEM.CD_EVENTO'
      Size = 3
    end
    object qryFollowupPOItemCD_RESP_REALIZACAO: TStringField
      FieldName = 'CD_RESP_REALIZACAO'
      Origin = 'TFLP_PO_ITEM.CD_RESP_REALIZACAO'
      Size = 4
    end
    object qryFollowupPOItemDT_REALIZACAO: TDateTimeField
      FieldName = 'DT_REALIZACAO'
      Origin = 'TFLP_PO_ITEM.DT_REALIZACAO'
      OnSetText = qryFollowupPOItemDT_REALIZACAOSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryFollowupPOItemDT_PREVISTA: TDateTimeField
      FieldName = 'DT_PREVISTA'
      Origin = 'TFLP_PO_ITEM.DT_PREVISTA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qryFollowupPOItemIN_APLICAVEL: TStringField
      FieldName = 'IN_APLICAVEL'
      Origin = 'TFLP_PO_ITEM.IN_APLICAVEL'
      Size = 1
    end
    object qryFollowupPOItemNR_ITEM_CLIENTE: TStringField
      FieldName = 'NR_ITEM_CLIENTE'
      Origin = 'TFLP_PO_ITEM.NR_ITEM'
      Size = 4
    end
    object qryFollowupPOItemNM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      FixedChar = True
      Size = 50
    end
    object qryFollowupPOItemAP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      FixedChar = True
      Size = 15
    end
    object qryFollowupPOItemcalcAtraso: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcAtraso'
      Size = 10
      Calculated = True
    end
    object qryFollowupPOItemDT_LIMITE: TDateTimeField
      FieldName = 'DT_LIMITE'
    end
    object qryFollowupPOItemQT_DISP: TFloatField
      FieldName = 'QT_DISP'
    end
    object qryFollowupPOItemCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qryFollowupPOItemNR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
    end
  end
  object dsFlpPoItemEtapa: TDataSource
    DataSet = qryFlpPoItemEtapa
    Left = 656
    Top = 452
  end
  object qryFlpPoItemEtapa: TQuery
    CachedUpdates = True
    AfterPost = qryFlpPoItemEtapaAfterPost
    AfterDelete = qryFlpPoItemEtapaAfterDelete
    DatabaseName = 'DBBROKER'
    DataSource = dsFollowupPOItem
    RequestLive = True
    SQL.Strings = (
      'SELECT F.NR_PROCESSO, F.NR_ITEM, F.CD_FLP_PO_ITEM_ETAPA,'
      
        '       F.CD_ETAPA, F.CD_USUARIO, F.DT_ALTERACAO, E.NM_ETAPA, U.A' +
        'P_USUARIO, F.CD_EMPRESA'
      
        'FROM TFLP_PO_ITEM_ETAPA F (NOLOCK), TETAPA E (NOLOCK), TUSUARIO ' +
        'U (NOLOCK)'
      'WHERE F.NR_PROCESSO = :nr_processo'
      '  AND F.CD_EMPRESA = :CD_EMPRESA'
      '   AND F.NR_ITEM     = :nr_item'
      '   AND F.CD_ETAPA   *= E.CD_ETAPA'
      '   AND F.CD_USUARIO *= U.CD_USUARIO'
      ' ORDER BY F.CD_FLP_PO_ITEM_ETAPA'
      '')
    UpdateObject = updFlpPoItemEtapa
    Left = 685
    Top = 452
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 19
      end
      item
        DataType = ftFixedChar
        Name = 'CD_EMPRESA'
        ParamType = ptInput
        Size = 6
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptUnknown
        Size = 4
      end>
    object qryFlpPoItemEtapaNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryFlpPoItemEtapaNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      FixedChar = True
      Size = 18
    end
    object qryFlpPoItemEtapaCD_FLP_PO_ITEM_ETAPA: TIntegerField
      FieldName = 'CD_FLP_PO_ITEM_ETAPA'
    end
    object qryFlpPoItemEtapaCD_ETAPA: TIntegerField
      FieldName = 'CD_ETAPA'
    end
    object qryFlpPoItemEtapaCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryFlpPoItemEtapaDT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
    end
    object qryFlpPoItemEtapaNM_ETAPA: TStringField
      FieldName = 'NM_ETAPA'
      FixedChar = True
      Size = 50
    end
    object qryFlpPoItemEtapaAP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      FixedChar = True
      Size = 15
    end
    object qryFlpPoItemEtapaCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
  end
  object updFlpPoItemEtapa: TUpdateSQL
    ModifySQL.Strings = (
      'update TFLP_PO_ITEM_ETAPA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_EMPRESA = :CD_EMPRESA,'
      '  NR_ITEM = :NR_ITEM,'
      '  CD_FLP_PO_ITEM_ETAPA = :CD_FLP_PO_ITEM_ETAPA,'
      '  CD_ETAPA = :CD_ETAPA,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  DT_ALTERACAO = :DT_ALTERACAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  CD_FLP_PO_ITEM_ETAPA = :OLD_CD_FLP_PO_ITEM_ETAPA')
    InsertSQL.Strings = (
      'insert into TFLP_PO_ITEM_ETAPA'
      
        '  (NR_PROCESSO, CD_EMPRESA, NR_ITEM, CD_FLP_PO_ITEM_ETAPA, CD_ET' +
        'APA, CD_USUARIO, DT_ALTERACAO)'
      'values'
      
        '  (:NR_PROCESSO, :CD_EMPRESA, :NR_ITEM, :CD_FLP_PO_ITEM_ETAPA, :' +
        'CD_ETAPA, :CD_USUARIO, '
      '   :DT_ALTERACAO)')
    DeleteSQL.Strings = (
      'delete from TFLP_PO_ITEM_ETAPA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  CD_FLP_PO_ITEM_ETAPA = :OLD_CD_FLP_PO_ITEM_ETAPA')
    Left = 698
    Top = 468
  end
  object updFollowupPO: TUpdateSQL
    ModifySQL.Strings = (
      'update TFLP_PO'
      'set'
      '  CD_RESP_REALIZACAO = :CD_RESP_REALIZACAO,'
      '  DT_REALIZACAO = :DT_REALIZACAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA and'
      '  CD_EVENTO = :OLD_CD_EVENTO')
    InsertSQL.Strings = (
      'insert into TFLP_PO'
      '  (CD_RESP_REALIZACAO, DT_REALIZACAO)'
      'values'
      '  (:CD_RESP_REALIZACAO, :DT_REALIZACAO)')
    DeleteSQL.Strings = (
      'delete from TFLP_PO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA and'
      '  CD_EVENTO = :OLD_CD_EVENTO')
    Left = 714
    Top = 394
  end
  object updFollowupPOItem: TUpdateSQL
    ModifySQL.Strings = (
      'update TFLP_PO_ITEM'
      'set'
      '  CD_RESP_REALIZACAO = :CD_RESP_REALIZACAO,'
      '  DT_REALIZACAO = :DT_REALIZACAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  CD_EVENTO = :OLD_CD_EVENTO')
    InsertSQL.Strings = (
      'insert into TFLP_PO_ITEM'
      '  (CD_RESP_REALIZACAO, DT_REALIZACAO'
      'values'
      '  (:CD_RESP_REALIZACAO,   :DT_REALIZACAO)')
    DeleteSQL.Strings = (
      'delete from TFLP_PO_ITEM'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_EMPRESA = :OLD_CD_EMPRESA and'
      '  NR_ITEM = :OLD_NR_ITEM and'
      '  CD_EVENTO = :OLD_CD_EVENTO')
    Left = 714
    Top = 423
  end
  object dsPoItem: TDataSource
    DataSet = qryPoItem
    Left = 656
    Top = 365
  end
  object qryPoItem: TQuery
    AfterScroll = qryPoItemAfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_ITEM, NR_ITEM_CLIENTE, NR_PARCIAL, NR_FAT' +
        'URA, CD_EMPRESA'
      'FROM TPO_ITEM (NOLOCK)'
      'WHERE (NR_PROCESSO = :NR_PROCESSO)'
      '  AND CD_EMPRESA = :CD_EMPRESA'
      'order by NR_ITEM_CLIENTE, NR_PARCIAL')
    Left = 685
    Top = 365
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
      end>
    object qryPoItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPO_ITEM.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryPoItemNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'DBBROKER.TPO_ITEM.NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryPoItemNR_ITEM_CLIENTE: TStringField
      FieldName = 'NR_ITEM_CLIENTE'
      Origin = 'DBBROKER.TPO_ITEM.NR_ITEM_CLIENTE'
      FixedChar = True
      Size = 4
    end
    object qryPoItemNR_PARCIAL: TIntegerField
      FieldName = 'NR_PARCIAL'
      Origin = 'DBBROKER.TPO_ITEM.NR_PARCIAL'
    end
    object qryPoItemNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Origin = 'DBBROKER.TPO_ITEM.NR_FATURA'
      FixedChar = True
      Size = 50
    end
    object qryPoItemCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'DBBROKER.TPO_ITEM.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
  end
  object dsPo: TDataSource
    DataSet = qryPo
    Left = 656
    Top = 336
  end
  object qryPo: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.CD_IMPORTADOR, P.CD_SERVICO, (E.NM_EMPRESA +'#39' ('#39'+ E.AP_' +
        'EMPRESA +'#39')'#39') AS NM_IMPORTADOR, S.NM_SERVICO, P.CD_EMPRESA'
      'FROM TPO P (NOLOCK)'
      
        '  LEFT JOIN TEMPRESA_NAC E (NOLOCK) ON (E.CD_EMPRESA = P.CD_IMPO' +
        'RTADOR)'
      '  LEFT JOIN TSERVICO S (NOLOCK) ON (S.CD_SERVICO = P.CD_SERVICO)'
      'WHERE P.NR_PROCESSO = :NR_PROCESSO'
      '  AND P.CD_EMPRESA = :CD_EMPRESA')
    Left = 685
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptInput
      end>
    object qryPoCD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qryPoCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qryPoNM_IMPORTADOR: TStringField
      FieldName = 'NM_IMPORTADOR'
      FixedChar = True
      Size = 63
    end
    object qryPoNM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      FixedChar = True
      Size = 50
    end
    object qryPoCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
  end
  object ppmAtalhos: TPopupMenu
    Images = ImageList1
    Left = 552
    Top = 191
    object ManutenodosProcessos1: TMenuItem
      Caption = 'Manuten'#231#227'o dos Processos'
      Enabled = False
      Hint = 'Abre tela de manuten'#231#227'o dos processos'
      ImageIndex = 0
      OnClick = ManutenodosProcessos1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object FollowupDesembarao1: TMenuItem
      Caption = 'Followup Desembara'#231'o'
      Enabled = False
      Hint = 'Abre tela de Followup de Desembara'#231'o'
      ImageIndex = 1
      OnClick = FollowupDesembarao1Click
    end
  end
  object ImageList1: TImageList
    Left = 614
    Top = 195
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF00000080000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF00000080000000FF0000000000008080000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000080000000FF0000808000008080000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000080000000FF0000808000008080000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      FF00000080000000FF0000808000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
      000000000000FFFFFF00000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      0000FFFFFF00000000007F7F7F00000000000000000000000000000080000000
      8000000080000000800000008000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F0000000000000000000000000000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00000000000000000000000000FFFFFF00000000007F7F7F000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000007F7F7F000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000808000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000000000000000007F7F
      7F00000000007F7F7F0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00000000007F7F7F00000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      00000000000000000000000000007F7F7F000000000000000000000000007F7F
      7F00000000007F7F7F0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F86280030000000080E0800300000000
      01E080030000000001E080030000000031E180030000000031C1800300000000
      C181800300000000C307800300000000FE17800300000000CC37800300000000
      A87780030000000040F780030000000001E3800300000000C1E3800700000000
      C0E3800F00000000C83F801F0000000000000000000000000000000000000000
      000000000000}
  end
  object dsPendencias: TDataSource
    DataSet = qryPendencias
    Left = 19
    Top = 451
  end
  object qryPendencias: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT (*) CONTADOR_TOTAL, '
      
        '(SELECT COUNT(*) FROM MYINDAIA.DBO.TPROCESSO_PENDENCIAS WHERE NR' +
        '_PROCESSO = :NR_PROCESSO AND NR_REFERENCIA = :NR_REFERENCIA AND ' +
        'NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE AND NR_PARCIAL = :NR_PARCIAL ' +
        'AND CD_EMPRESA = :CD_EMPRESA AND CD_STATUS <> '#39'4'#39'  AND IN_ATIVO ' +
        '= '#39'1'#39') AS CONTADOR_ANDAMENTO,'
      
        '(SELECT COUNT(*) FROM MYINDAIA.DBO.TPROCESSO_PENDENCIAS WHERE NR' +
        '_PROCESSO = :NR_PROCESSO AND NR_REFERENCIA = :NR_REFERENCIA AND ' +
        'NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE AND NR_PARCIAL = :NR_PARCIAL ' +
        'AND CD_EMPRESA = :CD_EMPRESA AND CD_STATUS = '#39'4'#39'  AND IN_ATIVO =' +
        ' '#39'1'#39') AS CONTADOR_FINALIZADA'
      'FROM MYINDAIA.DBO.TPROCESSO_PENDENCIAS '
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      ' AND NR_REFERENCIA = :NR_REFERENCIA'
      ' AND NR_ITEM_CLIENTE = :NR_ITEM_CLIENTE'
      ' AND NR_PARCIAL = :NR_PARCIAL '
      ' AND CD_EMPRESA = :CD_EMPRESA'
      ' AND IN_ATIVO = '#39'1'#39)
    Left = 51
    Top = 451
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_processo'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftUnknown
        Name = 'NR_REFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ITEM_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_PARCIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NR_REFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ITEM_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_PARCIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NR_REFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_ITEM_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_PARCIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qryPendenciasCONTADOR_TOTAL: TIntegerField
      FieldName = 'CONTADOR_TOTAL'
    end
    object qryPendenciasCONTADOR_ANDAMENTO: TIntegerField
      FieldName = 'CONTADOR_ANDAMENTO'
    end
    object qryPendenciasCONTADOR_FINALIZADA: TIntegerField
      FieldName = 'CONTADOR_FINALIZADA'
    end
  end
end

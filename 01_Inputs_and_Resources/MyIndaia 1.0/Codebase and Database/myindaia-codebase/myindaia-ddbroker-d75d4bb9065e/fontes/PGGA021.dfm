object frm_bloqueio_evento: Tfrm_bloqueio_evento
  Left = 117
  Top = 86
  Width = 640
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Bloqueio de Eventos'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_manut
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvl_nm_usuario: TBevel
    Left = 198
    Top = 1
    Width = 427
    Height = 41
  end
  object lbl_nm_usuario: TLabel
    Left = 208
    Top = 4
    Width = 48
    Height = 13
    Caption = 'Usuário:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnl_entrada_de_dados: TPanel
    Left = 0
    Top = 128
    Width = 625
    Height = 305
    BevelOuter = bvLowered
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object bvl_cabecalho_grid: TBevel
      Left = 8
      Top = 8
      Width = 609
      Height = 24
      Style = bsRaised
    end
    object lbl_cd_evento: TLabel
      Left = 10
      Top = 9
      Width = 79
      Height = 21
      AutoSize = False
      Caption = 'Código'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_Evento: TLabel
      Left = 75
      Top = 9
      Width = 334
      Height = 21
      AutoSize = False
      Caption = 'Evento'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_bloqueio: TLabel
      Left = 532
      Top = 9
      Width = 70
      Height = 21
      AutoSize = False
      Caption = ' Bloqueado '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 399
      Top = 9
      Width = 133
      Height = 21
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
    object dbg_evento_aplicavel: TDBCtrlGrid
      Left = 8
      Top = 30
      Width = 609
      Height = 250
      ColCount = 1
      DataSource = datm_bloqueio_evento.ds_tfollowup
      PanelHeight = 25
      PanelWidth = 593
      TabOrder = 0
      RowCount = 10
      SelectedColor = clTeal
      object DBText1: TDBText
        Left = 8
        Top = 4
        Width = 73
        Height = 17
        DataField = 'CD_EVENTO'
        DataSource = datm_bloqueio_evento.ds_tfollowup
      end
      object DBText2: TDBText
        Left = 67
        Top = 4
        Width = 317
        Height = 17
        DataField = 'Look_Evento'
        DataSource = datm_bloqueio_evento.ds_tfollowup
      end
      object dbchk_aplic: TDBCheckBox
        Left = 552
        Top = 4
        Width = 16
        Height = 17
        DataField = 'IN_BLOQUEADO'
        DataSource = datm_bloqueio_evento.ds_tfollowup
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
  end
  object pnl_manut_cadastro: TPanel
    Left = 0
    Top = 1
    Width = 196
    Height = 41
    BevelOuter = bvLowered
    TabOrder = 1
    object btn_sair: TSpeedButton
      Left = 16
      Top = 8
      Width = 25
      Height = 25
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
  end
  object pnl_selecao: TPanel
    Left = 0
    Top = 44
    Width = 625
    Height = 81
    BevelOuter = bvLowered
    TabOrder = 2
    object lbl_cd_cliente: TLabel
      Left = 340
      Top = 3
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
    object lbl_nr_processo: TLabel
      Left = 196
      Top = 41
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
    object btn_processo: TSpeedButton
      Left = 307
      Top = 54
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
      OnClick = btn_processoClick
    end
    object Label3: TLabel
      Left = 14
      Top = 41
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
    object btn_cd_produto: TSpeedButton
      Left = 156
      Top = 53
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
      OnClick = btn_cd_produtoClick
    end
    object lbl_cd_unid_neg: TLabel
      Left = 14
      Top = 3
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
      Left = 156
      Top = 15
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
      OnClick = btn_cd_unid_negClick
    end
    object lbl_cd_servico: TLabel
      Left = 340
      Top = 41
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
    object msk_nr_processo: TMaskEdit
      Left = 194
      Top = 54
      Width = 111
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_produto: TMaskEdit
      Left = 14
      Top = 54
      Width = 21
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
      OnEnter = msk_cd_produtoEnter
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 38
      Top = 54
      Width = 115
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 14
      Top = 16
      Width = 21
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
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 38
      Top = 16
      Width = 115
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
    end
    object dbedt_cd_cliente: TDBEdit
      Left = 340
      Top = 15
      Width = 39
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CD_CLIENTE'
      DataSource = datm_bloqueio_evento.ds_processo
      ReadOnly = True
      TabOrder = 5
    end
    object dbedt_cd_servico: TDBEdit
      Left = 340
      Top = 54
      Width = 39
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CD_SERVICO'
      DataSource = datm_bloqueio_evento.ds_processo
      ReadOnly = True
      TabOrder = 6
    end
    object dbedt_nm_cliente: TDBEdit
      Left = 384
      Top = 15
      Width = 231
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'AP_EMPRESA'
      DataSource = datm_bloqueio_evento.ds_processo
      ReadOnly = True
      TabOrder = 7
    end
    object dbedt_nm_servico: TDBEdit
      Left = 384
      Top = 54
      Width = 231
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'NM_SERVICO'
      DataSource = datm_bloqueio_evento.ds_processo
      ReadOnly = True
      TabOrder = 8
    end
  end
  object edt_nm_usuario: TEdit
    Left = 208
    Top = 17
    Width = 211
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 3
    Text = 'edt_nm_usuario'
  end
  object menu_manut: TMainMenu
    Left = 576
    Top = 8
    object mi_sair: TMenuItem
      Caption = '&Sair'
      OnClick = btn_sairClick
    end
  end
end

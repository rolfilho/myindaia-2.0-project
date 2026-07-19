object frm_proc_comerc_agend_visita: Tfrm_proc_comerc_agend_visita
  Left = 232
  Top = 146
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Agendamento de Visita'
  ClientHeight = 442
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_entrada_de_dados: TPanel
    Left = 0
    Top = 51
    Width = 591
    Height = 391
    Align = alClient
    BevelInner = bvLowered
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object Label19: TLabel
      Left = 19
      Top = 16
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
    object Label1: TLabel
      Left = 467
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label2: TLabel
      Left = 19
      Top = 56
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
    object Label4: TLabel
      Left = 19
      Top = 135
      Width = 45
      Height = 13
      Caption = 'Contato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 19
      Top = 273
      Width = 69
      Height = 13
      Caption = 'Observa'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 370
      Top = 186
      Width = 28
      Height = 13
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 371
      Top = 229
      Width = 28
      Height = 13
      Caption = 'Hora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 20
      Top = 95
      Width = 55
      Height = 13
      Caption = 'Vendedor'
      FocusControl = dbedt_cd_vendedor
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_cd_vendedor: TSpeedButton
      Left = 395
      Top = 108
      Width = 26
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
      OnClick = btn_co_cd_vendedorClick
    end
    object Label29: TLabel
      Left = 396
      Top = 135
      Width = 94
      Height = 13
      Caption = 'Meio de Contato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbmemo_obs_agenda: TDBMemo
      Left = 20
      Top = 286
      Width = 553
      Height = 87
      DataField = 'OBS_AGENDA'
      DataSource = datm_proc_comerc.ds_agenda_comerc
      TabOrder = 3
    end
    object dbrg_in_periodo: TDBRadioGroup
      Left = 20
      Top = 182
      Width = 341
      Height = 81
      BiDiMode = bdLeftToRight
      Caption = ' Per'#237'odo Visita '
      Columns = 2
      DataField = 'IN_PERIODO'
      DataSource = datm_proc_comerc.ds_agenda_comerc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        '  8:00 '#224's 10:00'
        '10:00 '#224's 12:00'
        '14:00 '#224's 16:00'
        '16:00 '#224's 18:00')
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      Values.Strings = (
        '1'
        '2'
        '3'
        '4')
      OnClick = dbrg_in_periodoClick
    end
    object stt_nr_proc_comerc: TStaticText
      Left = 468
      Top = 29
      Width = 105
      Height = 20
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'stt_nr_proc_comerc'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
    object stt_look_nm_cliente: TStaticText
      Left = 20
      Top = 69
      Width = 553
      Height = 20
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'StaticText2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object stt_cd_unid_neg: TStaticText
      Left = 20
      Top = 29
      Width = 45
      Height = 20
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'StaticText2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object stt_look_nm_unid_neg: TStaticText
      Left = 65
      Top = 29
      Width = 396
      Height = 20
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'StaticText2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object dtpick_dt_agenda: TDateTimePicker
      Left = 371
      Top = 199
      Width = 89
      Height = 21
      Date = 37467.000000000000000000
      Time = 37467.000000000000000000
      TabOrder = 2
      OnExit = dtpick_dt_agendaExit
    end
    object edt_contato: TEdit
      Left = 20
      Top = 148
      Width = 365
      Height = 21
      TabOrder = 0
    end
    object msk_hora: TMaskEdit
      Left = 371
      Top = 242
      Width = 57
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 8
      Text = '  :  '
      OnExit = msk_horaExit
    end
    object dbedt_look_nm_vendedor: TDBEdit
      Left = 61
      Top = 108
      Width = 333
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'look_nm_vendedor'
      DataSource = datm_proc_comerc.ds_agenda_comerc
      ReadOnly = True
      TabOrder = 10
    end
    object dbedt_cd_vendedor: TDBEdit
      Left = 20
      Top = 108
      Width = 42
      Height = 21
      DataField = 'CD_VENDEDOR'
      DataSource = datm_proc_comerc.ds_agenda_comerc
      TabOrder = 9
      OnExit = dbedt_cd_vendedorExit
      OnKeyDown = dbedt_cd_vendedorKeyDown
    end
    object dbedt_nm_historico: TRxDBComboBox
      Left = 397
      Top = 148
      Width = 177
      Height = 21
      Style = csDropDownList
      DataField = 'TP_AGENDA'
      DataSource = datm_proc_comerc.ds_agenda_comerc
      EnableValues = True
      ItemHeight = 13
      Items.Strings = (
        'Visita'
        'Telefone'
        'E-mail'
        'Fax'
        'Postagem')
      TabOrder = 11
      Values.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4')
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 591
    Height = 51
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 4
      Width = 41
      Height = 43
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
      OnClick = btn_incluirClick
    end
    object btn_sair: TSpeedButton
      Left = 253
      Top = 4
      Width = 41
      Height = 43
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
    object btn_salvar: TSpeedButton
      Left = 45
      Top = 4
      Width = 41
      Height = 43
      Enabled = False
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
      OnClick = btn_salvarClick
    end
    object btn_cons_agenda: TSpeedButton
      Left = 91
      Top = 4
      Width = 41
      Height = 43
      Hint = 'Agenda Comercial'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
        777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
        79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
        777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
        79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
        CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cons_agendaClick
    end
    object Bevel1: TBevel
      Left = 299
      Top = 7
      Width = 286
      Height = 37
      Shape = bsFrame
      Style = bsRaised
    end
    object stt_nm_usuario: TStaticText
      Left = 308
      Top = 19
      Width = 258
      Height = 17
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Usu'#225'rio: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
    end
  end
end

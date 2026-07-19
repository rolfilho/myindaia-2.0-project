object frm_evento_critico: Tfrm_evento_critico
  Left = 169
  Top = 166
  Width = 640
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Evento Crítico'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 3
    Top = 176
    Width = 626
    Height = 257
    DataSource = datm_evento_critico.ds_verifica_evento
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        FieldName = 'nr_processo_calc'
        Title.Caption = 'Processo'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
      end
      item
        FieldName = 'LookCliente'
        Title.Caption = 'Cliente'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 250
      end
      item
        FieldName = 'LookServico'
        Title.Caption = 'Serviço'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 240
      end>
  end
  object Panel1: TPanel
    Left = 2
    Top = 0
    Width = 225
    Height = 41
    BevelOuter = bvLowered
    TabOrder = 1
    object btn_sair: TSpeedButton
      Left = 8
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
  object Panel2: TPanel
    Left = 231
    Top = 0
    Width = 397
    Height = 41
    BevelOuter = bvLowered
    TabOrder = 2
    object lbl_nm_usuario: TLabel
      Left = 16
      Top = 14
      Width = 39
      Height = 13
      Caption = 'Usuário:'
    end
    object edt_nm_usuario: TEdit
      Left = 72
      Top = 8
      Width = 277
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 0
    end
  end
  object pnl_selecao: TPanel
    Left = 3
    Top = 45
    Width = 625
    Height = 124
    BevelOuter = bvLowered
    TabOrder = 3
    object lbl_cd_cliente: TLabel
      Left = 9
      Top = 79
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
    object Label6: TLabel
      Left = 9
      Top = 39
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
      Left = 162
      Top = 51
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
    object Label7: TLabel
      Left = 8
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
      Left = 161
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
      Left = 321
      Top = 79
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
    object Label8: TLabel
      Left = 219
      Top = 3
      Width = 41
      Height = 13
      Caption = 'Evento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton3: TSpeedButton
      Left = 540
      Top = 16
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
      OnClick = SpeedButton3Click
    end
    object Label2: TLabel
      Left = 218
      Top = 39
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
    object msk_dt_realizacao: TMaskEdit
      Left = 218
      Top = 52
      Width = 65
      Height = 21
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      Text = '  /  /    '
      OnExit = msk_dt_realizacaoExit
    end
    object msk_cd_produto: TMaskEdit
      Left = 9
      Top = 52
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
    end
    object edt_nm_produto: TEdit
      Left = 33
      Top = 52
      Width = 125
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 8
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
      Left = 32
      Top = 16
      Width = 125
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 5
    end
    object dbedt_cd_cliente: TDBEdit
      Left = 9
      Top = 91
      Width = 39
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CD_CLIENTE'
      DataSource = datm_evento_critico.ds_processo
      ReadOnly = True
      TabOrder = 6
    end
    object dbedt_cd_servico: TDBEdit
      Left = 321
      Top = 91
      Width = 39
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CD_SERVICO'
      DataSource = datm_evento_critico.ds_processo
      ReadOnly = True
      TabOrder = 7
    end
    object dbedt_nm_cliente: TDBEdit
      Left = 53
      Top = 91
      Width = 252
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'AP_EMPRESA'
      DataSource = datm_evento_critico.ds_processo
      ReadOnly = True
      TabOrder = 8
    end
    object dbedt_nm_servico: TDBEdit
      Left = 365
      Top = 91
      Width = 236
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'NM_SERVICO'
      DataSource = datm_evento_critico.ds_processo
      ReadOnly = True
      TabOrder = 9
    end
    object msk_cd_evento: TMaskEdit
      Left = 218
      Top = 16
      Width = 44
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnEnter = msk_cd_eventoEnter
      OnExit = msk_cd_eventoExit
    end
    object edt_nm_evento: TEdit
      Left = 266
      Top = 16
      Width = 268
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 10
    end
  end
  object MainMenu1: TMainMenu
    Left = 656
    Top = 80
    object men_sair: TMenuItem
      Caption = '&Sair'
      OnClick = men_sairClick
    end
  end
end

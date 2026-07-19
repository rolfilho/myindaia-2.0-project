object frm_BSH_Integracao_DI: Tfrm_BSH_Integracao_DI
  Left = 265
  Top = 168
  Width = 490
  Height = 442
  Caption = 'Integra'#231#227'o DI BSH x MyIndai'#225
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 482
    Height = 44
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_importar_remessa: TSpeedButton
      Left = 5
      Top = 6
      Width = 34
      Height = 32
      Hint = 'Importar para Broker'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_importar_remessaClick
    end
    object btn_sair: TSpeedButton
      Left = 443
      Top = 4
      Width = 34
      Height = 36
      Hint = 'Sair'
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
  end
  object pnl2: TPanel
    Left = 0
    Top = 44
    Width = 482
    Height = 371
    Align = alClient
    TabOrder = 1
    object lbl1: TLabel
      Left = 20
      Top = 66
      Width = 197
      Height = 13
      Caption = 'Informe um nome para o arquivo a ser lido'
    end
    object btn_file_remessa: TSpeedButton
      Left = 439
      Top = 79
      Width = 24
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
      OnClick = btn_file_remessaClick
    end
    object lbl_nr_processo: TLabel
      Left = 19
      Top = 149
      Width = 44
      Height = 13
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btn_nr_processo: TSpeedButton
      Left = 148
      Top = 163
      Width = 24
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
      OnClick = btn_nr_processoClick
    end
    object shp1: TShape
      Left = 21
      Top = 202
      Width = 442
      Height = 55
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lbl2: TLabel
      Left = 128
      Top = 251
      Width = 330
      Height = 13
      Caption = 
        ' Os campos acima ser'#227'o utilizados caso n'#227'o venha preenchido na D' +
        'I '
    end
    object lbl3: TLabel
      Left = 35
      Top = 211
      Width = 66
      Height = 13
      Caption = 'N'#250'mero da DI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 171
      Top = 211
      Width = 109
      Height = 13
      Caption = 'Data de Registro da DI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbl_cd_unid_neg: TLabel
      Left = 20
      Top = 109
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
    object btn_co_unid_neg: TSpeedButton
      Left = 220
      Top = 122
      Width = 25
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
      OnClick = btn_co_unid_negClick
    end
    object Label1: TLabel
      Left = 60
      Top = 18
      Width = 352
      Height = 26
      Alignment = taCenter
      Caption = 
        'Antes de prosseguir com a integra'#231#227'o, tenha certeza de que foi a' +
        'berto um '#13#10'novo processo, que ainda n'#227'o tenha uma DI criada.'
    end
    object Shape1: TShape
      Left = 21
      Top = 10
      Width = 442
      Height = 43
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Shape2: TShape
      Left = 21
      Top = 274
      Width = 442
      Height = 55
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label2: TLabel
      Left = 360
      Top = 320
      Width = 95
      Height = 13
      Caption = ' Campos Adicionais '
    end
    object lbl_bl: TLabel
      Left = 35
      Top = 280
      Width = 83
      Height = 13
      Caption = 'N'#186' Conhecimento'
    end
    object Label3: TLabel
      Left = 164
      Top = 280
      Width = 77
      Height = 13
      Caption = 'N'#186' Ident. Master'
    end
    object edt_nm_file_remessa: TEdit
      Left = 20
      Top = 80
      Width = 418
      Height = 21
      TabOrder = 0
      Text = 'C:\'
      OnExit = edt_nm_file_remessaExit
    end
    object pnl_status_remessa: TPanel
      Left = 1
      Top = 335
      Width = 480
      Height = 35
      Align = alBottom
      BevelInner = bvLowered
      Caption = 'Informe um nome do arquivo a ser lido e clique em importar ...'
      TabOrder = 7
    end
    object medt_nr_processo: TMaskEdit
      Left = 20
      Top = 163
      Width = 127
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 3
    end
    object chkProcessos: TCheckBox
      Left = 178
      Top = 165
      Width = 108
      Height = 17
      Caption = #218'ltimos Processos'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object medt1: TMaskEdit
      Left = 171
      Top = 225
      Width = 116
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 6
      Text = '  /  /    '
    end
    object edt_nm_unid_neg: TEdit
      Left = 44
      Top = 122
      Width = 175
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
    object medt_cd_unid_neg: TMaskEdit
      Left = 20
      Top = 122
      Width = 25
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
      OnChange = btn_co_unid_negClick
    end
    object medt2: TMaskEdit
      Left = 35
      Top = 225
      Width = 116
      Height = 21
      EditMask = '!99/9999999-9;0;_'
      MaxLength = 12
      TabOrder = 5
    end
    object edt_bl: TEdit
      Left = 35
      Top = 296
      Width = 121
      Height = 21
      TabOrder = 8
    end
    object edt_bl_master: TEdit
      Left = 164
      Top = 296
      Width = 121
      Height = 21
      TabOrder = 9
    end
  end
  object dlgOpenOpenFile: TOpenDialog
    Filter = 'Arquivos texto|*.TXT;*.OUT|Todos os arquivos|*.*'
    InitialDir = 'C:\DDBroker'
    Left = 400
    Top = 121
  end
end

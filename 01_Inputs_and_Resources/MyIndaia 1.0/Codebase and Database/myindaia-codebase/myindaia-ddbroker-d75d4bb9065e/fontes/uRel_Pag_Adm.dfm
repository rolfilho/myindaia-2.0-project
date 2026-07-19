object frm_Rel_Pag_Adm: Tfrm_Rel_Pag_Adm
  Left = 332
  Top = 138
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rio de Pagamentos Administrativos'
  ClientHeight = 235
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAndamento: TPanel
    Left = 0
    Top = 0
    Width = 338
    Height = 235
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 1
    DesignSize = (
      338
      235)
    object ggAndamento: TGauge
      Left = 8
      Top = 111
      Width = 321
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      ForeColor = clBlue
      Progress = 0
    end
    object Label2: TLabel
      Left = 8
      Top = 83
      Width = 321
      Height = 24
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = ' Progresso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 82
      Width = 321
      Height = 24
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Progresso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 338
    Height = 235
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 2
    TabOrder = 0
    object lbl_periodo: TLabel
      Left = 17
      Top = 99
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
      Left = 131
      Top = 119
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
    object Label1: TLabel
      Left = 17
      Top = 11
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
    object Label3: TLabel
      Left = 17
      Top = 54
      Width = 37
      Height = 13
      Caption = 'Banco'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_unid: TSpeedButton
      Left = 302
      Top = 28
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
      OnClick = btn_co_unidClick
    end
    object btn_co_banco: TSpeedButton
      Left = 303
      Top = 70
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
      OnClick = btn_co_bancoClick
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 17
      Top = 28
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
      OnChange = btn_co_unidClick
    end
    object edt_nm_unid_neg: TEdit
      Left = 52
      Top = 28
      Width = 249
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
      Text = 'Todas'
    end
    object msk_cd_banco: TMaskEdit
      Left = 17
      Top = 71
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
      TabOrder = 2
      OnChange = btn_co_bancoClick
    end
    object edt_nm_banco: TEdit
      Left = 52
      Top = 71
      Width = 249
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
      Text = 'Todos'
    end
    object dteInicio: TDateEdit
      Left = 17
      Top = 116
      Width = 106
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 4
    end
    object dteFim: TDateEdit
      Left = 145
      Top = 116
      Width = 106
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 5
    end
    object gpbTipoPeriodo: TGroupBox
      Left = 16
      Top = 144
      Width = 305
      Height = 51
      Caption = 'Tipo do Per'#237'odo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object rdbEmissao: TRadioButton
        Left = 8
        Top = 24
        Width = 60
        Height = 17
        Caption = 'Emiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object rdbVencimento: TRadioButton
        Left = 104
        Top = 24
        Width = 77
        Height = 17
        Caption = 'Vencimento'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = True
      end
      object rdbPagamento: TRadioButton
        Left = 216
        Top = 24
        Width = 76
        Height = 17
        Caption = 'Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    object btn_imprimir: TButton
      Left = 79
      Top = 202
      Width = 66
      Height = 26
      Caption = '&Gerar'
      TabOrder = 7
      OnClick = btn_imprimirClick
    end
    object btn_sair: TButton
      Left = 191
      Top = 202
      Width = 66
      Height = 26
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 8
      OnClick = btn_sairClick
    end
  end
end

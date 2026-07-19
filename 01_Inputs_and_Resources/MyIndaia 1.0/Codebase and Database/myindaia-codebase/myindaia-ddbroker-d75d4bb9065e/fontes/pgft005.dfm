object frm_sel_fat: Tfrm_sel_fat
  Left = 155
  Top = 123
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frm_sel_fat'
  ClientHeight = 504
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
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
    Top = 50
    Width = 742
    Height = 454
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object lbl_data: TLabel
      Left = 16
      Top = 61
      Width = 63
      Height = 13
      Caption = 'Data Inicio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_unid_neg: TLabel
      Left = 15
      Top = 15
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
      Left = 343
      Top = 27
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
    object lbl_produto: TLabel
      Left = 383
      Top = 15
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
      Left = 694
      Top = 27
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
    object Label2: TLabel
      Left = 225
      Top = 61
      Width = 53
      Height = 13
      Caption = 'N'#186' Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_tipo_nf_serv: TLabel
      Left = 223
      Top = 103
      Width = 109
      Height = 13
      Caption = 'Tipo de  Impress'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_nr_solicitacao: TLabel
      Left = 348
      Top = 61
      Width = 82
      Height = 13
      Caption = 'N'#186' Solicita'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_nr_nf: TLabel
      Left = 455
      Top = 61
      Width = 43
      Height = 13
      Caption = 'N'#186' N.F.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_nr_ndc: TLabel
      Left = 564
      Top = 61
      Width = 113
      Height = 13
      Caption = 'N'#186' Nota Deb./Cred.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_nr_processo: TLabel
      Left = 348
      Top = 105
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
    object lbl_cd_referencia: TLabel
      Left = 455
      Top = 105
      Width = 63
      Height = 13
      Caption = 'Refer'#234'ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 121
      Top = 61
      Width = 59
      Height = 13
      Caption = 'Data Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object msk_data: TMaskEdit
      Left = 16
      Top = 74
      Width = 99
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
      OnEnter = msk_dataEnter
      OnExit = msk_dataExit
    end
    object edt_nm_unid_neg: TEdit
      Left = 43
      Top = 28
      Width = 299
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 13
    end
    object edt_nm_produto: TEdit
      Left = 411
      Top = 28
      Width = 282
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 14
    end
    object msk_nr_fat: TMaskEdit
      Left = 223
      Top = 74
      Width = 70
      Height = 21
      TabStop = False
      Color = clMenu
      EditMask = '999999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      OnChange = msk_nr_fatChange
      OnEnter = msk_cd_produtoEnter
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object cbo_tipo_nf_serv: TComboBox
      Left = 223
      Top = 118
      Width = 120
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Visible = False
      OnChange = cbo_tipo_nf_servChange
      Items.Strings = (
        'Fatura/Nota Op.'
        'Nota de D'#233'bito Adm.')
    end
    object pgctrl_sel_fat: TPageControl
      Left = 2
      Top = 144
      Width = 738
      Height = 308
      ActivePage = ts_sol
      Align = alBottom
      TabOrder = 12
      object ts_sol: TTabSheet
        Caption = 'Solicita'#231#245'es'
        object dbgrdSol: TDBGrid
          Left = 0
          Top = 0
          Width = 730
          Height = 182
          Align = alClient
          DataSource = datm_sel_fat.ds_grd_sol
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnKeyDown = dbgrdSolKeyDown
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TX_YESNO'
              Title.Alignment = taCenter
              Title.Color = clBlack
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CalcNrSolicitacao'
              Title.Color = clBlack
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_NOTA_FATURA'
              Title.Color = clBlack
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_NF_SERV'
              Title.Color = clBlack
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CalcStatus'
              Title.Color = clBlack
              Width = 136
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_FATURA'
              Title.Color = clBlack
              Width = 78
              Visible = True
            end>
        end
        object dbgrd_proc: TDBGrid
          Left = 0
          Top = 182
          Width = 730
          Height = 98
          Align = alBottom
          DataSource = datm_sel_fat.ds_fat_proc
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'CalcNrProcesso'
              Title.Caption = 'N'#186' Processo'
              Title.Color = clBlack
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AP_EMPRESA'
              Title.Color = clBlack
              Width = 222
              Visible = True
            end>
        end
      end
      object ts_adm: TTabSheet
        Caption = 'Notas Adm.'
        object dbgrd_adm: TDBGrid
          Left = 0
          Top = 5
          Width = 617
          Height = 244
          DataSource = datm_sel_fat.ds_grd_adm
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'TX_YESNO'
              Title.Color = clBlack
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_DOCTO'
              Title.Color = clBlack
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_NF_SERV'
              Title.Color = clBlack
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NM_FAVORECIDO'
              Title.Color = clBlack
              Visible = True
            end>
        end
      end
    end
    object msk_nr_solicitacao: TMaskEdit
      Left = 348
      Top = 74
      Width = 91
      Height = 21
      EditMask = '99/9999;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 6
      OnEnter = msk_nr_solicitacaoEnter
      OnExit = msk_nr_solicitacaoExit
    end
    object msk_nr_nf: TMaskEdit
      Left = 455
      Top = 74
      Width = 93
      Height = 21
      EditMask = '999999;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 7
      OnEnter = msk_nr_nfEnter
      OnExit = msk_nr_nfExit
    end
    object msk_nr_ndc: TMaskEdit
      Left = 564
      Top = 74
      Width = 114
      Height = 21
      EditMask = '999999;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 8
      OnEnter = msk_nr_ndcEnter
      OnExit = msk_nr_ndcExit
    end
    object msk_nr_processo: TMaskEdit
      Left = 348
      Top = 118
      Width = 93
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 9
      OnEnter = msk_nr_processoEnter
      OnExit = msk_nr_processoExit
    end
    object msk_cd_referencia: TMaskEdit
      Left = 455
      Top = 118
      Width = 93
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 15
      ParentFont = False
      TabOrder = 10
      OnEnter = msk_cd_referenciaEnter
      OnExit = msk_cd_referenciaExit
    end
    object chk_inc_canc: TCheckBox
      Left = 566
      Top = 119
      Width = 125
      Height = 17
      Caption = 'Incluir &Canceladas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = chk_inc_cancClick
      OnExit = chk_inc_cancExit
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 16
      Top = 28
      Width = 28
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
    object msk_cd_produto: TMaskEdit
      Left = 384
      Top = 28
      Width = 28
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
    object msk_data_fim: TMaskEdit
      Left = 120
      Top = 74
      Width = 99
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
      OnEnter = msk_dataEnter
      OnExit = msk_dataExit
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 50
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object btn_imprimir: TSpeedButton
      Left = 3
      Top = 5
      Width = 37
      Height = 40
      Hint = 'Imprimir'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_imprimirClick
    end
    object btn_sair: TSpeedButton
      Left = 700
      Top = 4
      Width = 37
      Height = 41
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
    object btn_desmarca_todas: TSpeedButton
      Left = 101
      Top = 11
      Width = 27
      Height = 27
      Hint = 'Desmarcar Todas'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
        33333333373F33333333333330B03333333333337F7F33333333333330F03333
        333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
        333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
        333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
        3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
        33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
        33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
        03333337777777F7F33333330000000003333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_desmarca_todasClick
    end
    object btn_marca_todas: TSpeedButton
      Left = 128
      Top = 11
      Width = 27
      Height = 27
      Hint = 'Marcar Todas'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      OnClick = btn_marca_todasClick
    end
    object btn_preview_rateio_desp: TSpeedButton
      Left = 41
      Top = 4
      Width = 36
      Height = 41
      Hint = 'Preview Rateio de Despesas'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_preview_rateio_despClick
    end
    object btnGeratxt: TSpeedButton
      Left = 159
      Top = 5
      Width = 93
      Height = 40
      Hint = 'Gerar TXT'
      BiDiMode = bdLeftToRight
      Caption = 'Gerar TXT'
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
      ParentBiDiMode = False
      ShowHint = True
      Visible = False
      OnClick = btnGeratxtClick
    end
    object mmNf: TMemo
      Left = 576
      Top = 7
      Width = 113
      Height = 42
      TabOrder = 0
      Visible = False
      WordWrap = False
    end
  end
  object pnlResumo: TPanel
    Left = 92
    Top = 152
    Width = 553
    Height = 329
    BevelInner = bvLowered
    TabOrder = 2
    Visible = False
    object mmResumo: TMemo
      Left = 2
      Top = 2
      Width = 549
      Height = 286
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 2
      Top = 288
      Width = 549
      Height = 39
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 1
      object BitBtn3: TBitBtn
        Left = 399
        Top = 2
        Width = 75
        Height = 35
        Caption = 'OK'
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn3Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object BitBtn1: TBitBtn
        Left = 474
        Top = 2
        Width = 75
        Height = 35
        Cancel = True
        Caption = 'Cancel'
        TabOrder = 1
        OnClick = BitBtn1Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 193
    Top = 12
    object mi_imprime: TMenuItem
      Caption = '&Imprimir'
      OnClick = btn_imprimirClick
    end
    object mi_preview_rateio_desp: TMenuItem
      Caption = '&Preview - Rateio de Despesas'
      OnClick = btn_preview_rateio_despClick
    end
    object mi_marca_todas: TMenuItem
      Caption = '&Marcar Todas'
      OnClick = btn_marca_todasClick
    end
    object mi_desmarca_todas: TMenuItem
      Caption = '&Desmarcar Todas'
      Visible = False
      OnClick = btn_desmarca_todasClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
  object crp_fat: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 241
    Top = 9
  end
  object qry_nf2: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT 20 C1, 0 C2, '#39#39' C3, F.NR_NOTA_FATURA C4, CONVERT(VARCHAR,' +
        ' GETDATE(), 112) C5, 1 C6, 2 C7, LTRIM(RTRIM(E.CGC_EMPRESA)) C8,' +
        ' LTRIM(RTRIM(E.IM_EMPRESA)) C9,'
      
        '  LTRIM(RTRIM(E.IE_EMPRESA)) C10, LTRIM(RTRIM(E.NM_EMPRESA)) C11' +
        ', LTRIM(RTRIM(E.END_EMPRESA)) C12, LTRIM(RTRIM(E.END_EMPRESA)) C' +
        '13,'
      
        '  LTRIM(RTRIM(E.END_NUMERO)) C14, '#39#39' C15, LTRIM(RTRIM(E.END_BAIR' +
        'RO)) C16, LTRIM(RTRIM(E.END_CIDADE)) C17, LTRIM(RTRIM(E.END_UF))' +
        ' C18, RTRIM(LTRIM(E.END_CEP)) C19,'
      
        '  '#39#39' C20, '#39#39' C21, '#39'01'#39' C22, '#39'RIO DE JANEIRO'#39' C23, '#39'RJ'#39' C24, '#39'00'#39 +
        ' C25, '#39'0'#39' C26, '#39'0'#39' C27, '#39'3301'#39' C28, '#39'00000000000000330104'#39' C29, ' +
        #39'00500'#39' C30,'
      
        '  CONVERT(DECIMAL(28,2), NF.VL_TOT_TRIBUTAVEL) C31, 0 C32, 0 C33' +
        ', 0 C34,'
      
        '  CONVERT(DECIMAL(28,2), ROUND((NF.VL_TOT_TRIBUTAVEL * 0.03),2))' +
        ' C35, CONVERT(DECIMAL(28,2), ROUND((NF.VL_TOT_TRIBUTAVEL * 0.01)' +
        ',2)) C36, 0 C37, CONVERT(DECIMAL(28,2), NF.VL_IR) C38, CONVERT(D' +
        'ECIMAL(28,2), ROUND((NF.VL_TOT_TRIBUTAVEL * 0.0065),2)) C39,'
      '  0 C40, 0.00 C41, 0 C42, '
      
        '  CASE WHEN FAT.VL_ITEM > 0 THEN CONVERT(VARCHAR, F.DT_VENCTO_FA' +
        'TURA, 112) ELSE CONVERT(VARCHAR, GETDATE(), 112) END C43,'
      '  '#39#39' C44, '#39#39' C45, '#39#39' C46, '#39#39' C47, '#39#39' C48,'
      
        '  '#39'PROCESSO: '#39'+SUBSTRING(P.NR_PROCESSO,5,10)+'#39' NOTA: '#39'+F.NR_NOTA' +
        '_FATURA+ '#39' REF. CLIENTE: '#39'+NF.NM_REFERENCIA C49'
      'FROM TPROCESSO P'
      'INNER JOIN TNF_SERV_OP NF ON NF.NR_PROCESSO = P.NR_PROCESSO'
      'INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_CLIENTE'
      
        'INNER JOIN TS_FATURA F ON F.CD_UNID_NEG = NF.CD_UNID_NEG AND F.C' +
        'D_PRODUTO = NF.CD_PRODUTO AND F.NR_SOLICITACAO = NF.NR_SOLICITAC' +
        'AO'
      
        'LEFT JOIN TFATURAMENTO_CC FAT ON FAT.NR_PROCESSO = P.NR_PROCESSO' +
        ' AND FAT.NR_SOLIC_FAT = F.NR_SOLICITACAO AND FAT.CD_ITEM = '#39'394'#39 +
        ' AND FAT.IN_CANCELADO = '#39'0'#39' '
      
        'WHERE :CD_UNID_NEG IN (NF.CD_UNID_NEG) AND :CD_PRODUTO IN (NF.CD' +
        '_PRODUTO) AND :NR_SOLICITACAO IN (NF.NR_SOLICITACAO)')
    Left = 624
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end>
    object qry_nf2C1: TIntegerField
      FieldName = 'C1'
    end
    object qry_nf2C2: TIntegerField
      FieldName = 'C2'
    end
    object qry_nf2C3: TStringField
      FieldName = 'C3'
      FixedChar = True
      Size = 1
    end
    object qry_nf2C4: TStringField
      FieldName = 'C4'
      FixedChar = True
      Size = 6
    end
    object qry_nf2C5: TStringField
      FieldName = 'C5'
      FixedChar = True
      Size = 30
    end
    object qry_nf2C6: TIntegerField
      FieldName = 'C6'
    end
    object qry_nf2C7: TIntegerField
      FieldName = 'C7'
    end
    object qry_nf2C8: TStringField
      FieldName = 'C8'
      FixedChar = True
      Size = 14
    end
    object qry_nf2C9: TStringField
      FieldName = 'C9'
      FixedChar = True
    end
    object qry_nf2C10: TStringField
      FieldName = 'C10'
      FixedChar = True
    end
    object qry_nf2C11: TStringField
      FieldName = 'C11'
      FixedChar = True
      Size = 80
    end
    object qry_nf2C12: TStringField
      FieldName = 'C12'
      FixedChar = True
      Size = 50
    end
    object qry_nf2C13: TStringField
      FieldName = 'C13'
      FixedChar = True
      Size = 50
    end
    object qry_nf2C14: TStringField
      FieldName = 'C14'
      FixedChar = True
      Size = 6
    end
    object qry_nf2C15: TStringField
      FieldName = 'C15'
      FixedChar = True
      Size = 1
    end
    object qry_nf2C16: TStringField
      FieldName = 'C16'
      FixedChar = True
      Size = 30
    end
    object qry_nf2C17: TStringField
      FieldName = 'C17'
      FixedChar = True
      Size = 30
    end
    object qry_nf2C18: TStringField
      FieldName = 'C18'
      FixedChar = True
      Size = 2
    end
    object qry_nf2C19: TStringField
      FieldName = 'C19'
      FixedChar = True
      Size = 8
    end
    object qry_nf2C20: TStringField
      FieldName = 'C20'
      FixedChar = True
      Size = 1
    end
    object qry_nf2C21: TStringField
      FieldName = 'C21'
      FixedChar = True
      Size = 1
    end
    object qry_nf2C22: TStringField
      FieldName = 'C22'
      FixedChar = True
      Size = 2
    end
    object qry_nf2C23: TStringField
      FieldName = 'C23'
      FixedChar = True
      Size = 14
    end
    object qry_nf2C24: TStringField
      FieldName = 'C24'
      FixedChar = True
      Size = 2
    end
    object qry_nf2C25: TStringField
      FieldName = 'C25'
      FixedChar = True
      Size = 2
    end
    object qry_nf2C26: TStringField
      FieldName = 'C26'
      FixedChar = True
      Size = 1
    end
    object qry_nf2C27: TStringField
      FieldName = 'C27'
      FixedChar = True
      Size = 1
    end
    object qry_nf2C28: TStringField
      FieldName = 'C28'
      FixedChar = True
      Size = 4
    end
    object qry_nf2C29: TStringField
      FieldName = 'C29'
      FixedChar = True
    end
    object qry_nf2C30: TStringField
      FieldName = 'C30'
      FixedChar = True
      Size = 5
    end
    object qry_nf2C31: TFloatField
      FieldName = 'C31'
    end
    object qry_nf2C32: TIntegerField
      FieldName = 'C32'
    end
    object qry_nf2C33: TIntegerField
      FieldName = 'C33'
    end
    object qry_nf2C34: TIntegerField
      FieldName = 'C34'
    end
    object qry_nf2C35: TFloatField
      FieldName = 'C35'
    end
    object qry_nf2C36: TFloatField
      FieldName = 'C36'
    end
    object qry_nf2C37: TIntegerField
      FieldName = 'C37'
    end
    object qry_nf2C38: TFloatField
      FieldName = 'C38'
    end
    object qry_nf2C39: TFloatField
      FieldName = 'C39'
    end
    object qry_nf2C40: TIntegerField
      FieldName = 'C40'
    end
    object qry_nf2C41: TFloatField
      FieldName = 'C41'
    end
    object qry_nf2C42: TIntegerField
      FieldName = 'C42'
    end
    object qry_nf2C43: TStringField
      FieldName = 'C43'
      FixedChar = True
      Size = 4
    end
    object qry_nf2C44: TStringField
      FieldName = 'C44'
      FixedChar = True
      Size = 15
    end
    object qry_nf2C45: TStringField
      FieldName = 'C45'
      FixedChar = True
      Size = 15
    end
    object qry_nf2C46: TStringField
      FieldName = 'C46'
      FixedChar = True
      Size = 5
    end
    object qry_nf2C47: TStringField
      FieldName = 'C47'
      FixedChar = True
      Size = 15
    end
    object qry_nf2C48: TStringField
      FieldName = 'C48'
      FixedChar = True
      Size = 30
    end
    object qry_nf2C49: TStringField
      FieldName = 'C49'
      FixedChar = True
      Size = 248
    end
  end
  object qry_nf1: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT 10 C1, '#39'003'#39' C2, '#39'2'#39' C3, LTRIM(RTRIM(CGC_UNID_NEG)) C4, L' +
        'TRIM(RTRIM(IM_UNID_NEG)) C5, CONVERT(VARCHAR, GETDATE(), 112) C6' +
        ', CONVERT(VARCHAR, GETDATE(), 112) C7'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 592
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end>
    object qry_nf1C1: TIntegerField
      FieldName = 'C1'
    end
    object qry_nf1C2: TStringField
      FieldName = 'C2'
      FixedChar = True
      Size = 3
    end
    object qry_nf1C3: TStringField
      FieldName = 'C3'
      FixedChar = True
      Size = 1
    end
    object qry_nf1C4: TStringField
      FieldName = 'C4'
      FixedChar = True
      Size = 14
    end
    object qry_nf1C5: TStringField
      FieldName = 'C5'
      FixedChar = True
    end
    object qry_nf1C6: TStringField
      FieldName = 'C6'
      FixedChar = True
      Size = 30
    end
    object qry_nf1C7: TStringField
      FieldName = 'C7'
      FixedChar = True
      Size = 30
    end
  end
end

object frm_nf_serv: Tfrm_nf_serv
  Left = 330
  Top = 170
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o da Nota Fiscal de Servi'#231'o / Fatura'
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
    Top = 51
    Width = 742
    Height = 453
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object pgctrl_nf_serv: TPageControl
      Left = 2
      Top = 121
      Width = 738
      Height = 330
      ActivePage = ts_sol
      Align = alClient
      TabOrder = 0
      OnChange = pgctrl_nf_servChange
      OnChanging = pgctrl_nf_servChanging
      object ts_sol: TTabSheet
        Caption = 'Solicita'#231#245'es'
        object dbgrdSol: TDBGrid
          Left = 0
          Top = 0
          Width = 730
          Height = 190
          Align = alClient
          Ctl3D = False
          DataSource = datm_nf_serv.ds_grd_sol
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentCtl3D = False
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
              Expanded = False
              FieldName = 'CalcNrSolicitacao'
              Title.Color = clBlack
              Width = 71
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
              FieldName = 'DT_FATURA'
              Title.Color = clBlack
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CalcStatus'
              Title.Color = clBlack
              Width = 136
              Visible = True
            end>
        end
        object dbgrd_proc: TDBGrid
          Left = 0
          Top = 190
          Width = 730
          Height = 112
          Align = alBottom
          Ctl3D = False
          DataSource = datm_nf_serv.ds_fat_proc
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentCtl3D = False
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
          Top = 0
          Width = 730
          Height = 302
          Align = alClient
          Ctl3D = False
          DataSource = datm_nf_serv.ds_grd_adm
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnKeyDown = dbgrd_admKeyDown
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
      object ts_obs: TTabSheet
        Caption = 'Observa'#231#227'o'
        DesignSize = (
          730
          302)
        object btn_co_obs: TSpeedButton
          Left = 696
          Top = 6
          Width = 24
          Height = 22
          Anchors = [akTop, akRight]
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
          OnClick = btn_co_obsClick
        end
        object mem_obs: TMemo
          Left = 0
          Top = 1
          Width = 689
          Height = 290
          Anchors = [akLeft, akTop, akRight, akBottom]
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnChange = mem_obsChange
        end
      end
    end
    object pnl: TPanel
      Left = 2
      Top = 2
      Width = 738
      Height = 119
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lbl_data: TLabel
        Left = 7
        Top = 41
        Width = 101
        Height = 13
        Caption = 'Selecione a data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_unid_neg: TLabel
        Left = 7
        Top = 5
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
        Left = 285
        Top = 17
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
        Left = 326
        Top = 5
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
        Left = 622
        Top = 15
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
        OnClick = btn_co_produtoClick
      end
      object lbl_nr_nf_ini: TLabel
        Left = 115
        Top = 41
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
        Left = 194
        Top = 41
        Width = 109
        Height = 13
        Caption = 'Tipo de  Impress'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_nr_solicitacao: TLabel
        Left = 326
        Top = 41
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
        Left = 421
        Top = 41
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
      object lbl_nr_processo: TLabel
        Left = 326
        Top = 79
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
        Left = 421
        Top = 79
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
      object lbl_nr_ndc: TLabel
        Left = 517
        Top = 42
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
      object msk_data: TMaskEdit
        Left = 7
        Top = 56
        Width = 67
        Height = 19
        Ctl3D = False
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 2
        Text = '  /  /    '
        OnEnter = msk_dataEnter
        OnExit = msk_dataExit
      end
      object msk_cd_unid_neg: TMaskEdit
        Left = 7
        Top = 18
        Width = 23
        Height = 19
        Ctl3D = False
        EditMask = '99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 2
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnChange = msk_cd_unid_negChange
        OnEnter = msk_cd_unid_negEnter
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_unid_neg: TEdit
        Left = 32
        Top = 18
        Width = 251
        Height = 19
        TabStop = False
        Color = clMenu
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 10
      end
      object msk_cd_produto: TMaskEdit
        Left = 326
        Top = 18
        Width = 25
        Height = 19
        Ctl3D = False
        EditMask = '99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 2
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnEnter = msk_cd_produtoEnter
        OnExit = msk_cd_produtoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_produto: TEdit
        Left = 353
        Top = 18
        Width = 267
        Height = 19
        TabStop = False
        Color = clMenu
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 11
      end
      object msk_nr_nf_ini: TMaskEdit
        Left = 115
        Top = 56
        Width = 67
        Height = 19
        TabStop = False
        Color = clMenu
        Ctl3D = False
        EditMask = '999999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 6
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        OnChange = msk_nr_nf_iniChange
        OnEnter = msk_cd_produtoEnter
        OnExit = msk_cd_produtoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object cbo_tipo_nf_serv: TComboBox
        Left = 194
        Top = 56
        Width = 117
        Height = 21
        Style = csDropDownList
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 3
        Visible = False
        OnChange = cbo_tipo_nf_servChange
        Items.Strings = (
          'Fatura'
          'Nota Op.')
      end
      object msk_nr_solicitacao: TMaskEdit
        Left = 326
        Top = 56
        Width = 89
        Height = 19
        Ctl3D = False
        EditMask = '99/9999;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 7
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnEnter = msk_nr_solicitacaoEnter
        OnExit = msk_nr_solicitacaoExit
      end
      object msk_nr_nf: TMaskEdit
        Left = 421
        Top = 56
        Width = 92
        Height = 19
        Ctl3D = False
        EditMask = '999999;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 6
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnEnter = msk_nr_nfEnter
        OnExit = msk_nr_nfExit
      end
      object msk_nr_processo: TMaskEdit
        Left = 326
        Top = 92
        Width = 92
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 14
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnEnter = msk_nr_processoEnter
        OnExit = msk_nr_processoExit
      end
      object msk_cd_referencia: TMaskEdit
        Left = 421
        Top = 92
        Width = 92
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 15
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
        OnEnter = msk_cd_referenciaEnter
        OnExit = msk_cd_referenciaExit
      end
      object chk_inc_canc: TCheckBox
        Left = 517
        Top = 94
        Width = 124
        Height = 17
        Caption = 'Incluir &Canceladas'
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
        OnClick = chk_inc_cancClick
        OnExit = chk_inc_cancExit
      end
      object msk_nr_ndc: TMaskEdit
        Left = 517
        Top = 56
        Width = 93
        Height = 19
        Ctl3D = False
        EditMask = '999999;0;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 6
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnEnter = msk_nr_ndcEnter
        OnExit = msk_nr_ndcExit
      end
      object Panel2: TPanel
        Left = 8
        Top = 41
        Width = 697
        Height = 72
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        Visible = False
        object Label2: TLabel
          Left = 1
          Top = 1
          Width = 695
          Height = 70
          Align = alClient
          Alignment = taCenter
          Caption = 
            'QRYNF DO FORM ALTERADO PARA IMPRESSAO DE NOTAS DA SG (SILVIO)'#13#10'P' +
            'ROCURE UMA OUTRA VERS'#195'O DO MESMO'#13#10'DATA 27/02/2010 - ANDR'#201
          Visible = False
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 51
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Shape1: TShape
      Left = 397
      Top = 2
      Width = 343
      Height = 48
      Brush.Color = clBtnFace
      Pen.Color = clTeal
      Pen.Width = 2
      Visible = False
    end
    object btn_imprimir: TSpeedButton
      Left = 697
      Top = 4
      Width = 45
      Height = 45
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
      Visible = False
      OnClick = btn_imprimirClick
    end
    object btnImp: TSpeedButton
      Left = 48
      Top = 3
      Width = 42
      Height = 45
      Hint = 'Imprimir'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnImpClick
    end
    object btnPrev: TSpeedButton
      Left = 3
      Top = 3
      Width = 45
      Height = 45
      Hint = 'Preview'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
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
      OnClick = btnPrevClick
    end
    object btn_sair: TSpeedButton
      Left = 261
      Top = 3
      Width = 45
      Height = 45
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
      Left = 306
      Top = 3
      Width = 45
      Height = 45
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
      Left = 352
      Top = 3
      Width = 45
      Height = 45
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
    object btn_salvar: TSpeedButton
      Left = 158
      Top = 3
      Width = 45
      Height = 45
      Hint = 'Imprimir'
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 203
      Top = 3
      Width = 45
      Height = 45
      Hint = 'Cancelar'
      Enabled = False
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
      OnClick = btn_cancelarClick
    end
    object btn_preview: TSpeedButton
      Left = 674
      Top = 4
      Width = 45
      Height = 45
      Hint = 'Preview'
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
      Visible = False
      OnClick = btn_previewClick
    end
    object btn_preview_rateio_desp: TSpeedButton
      Left = 103
      Top = 3
      Width = 45
      Height = 45
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
    object SpeedButton1: TSpeedButton
      Left = 401
      Top = 6
      Width = 38
      Height = 41
      Hint = 'Imprimir'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = SpeedButton1Click
    end
    object Label1: TLabel
      Left = 601
      Top = 12
      Width = 27
      Height = 13
      Caption = 'Ano:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblStatus: TLabel
      Left = 443
      Top = 31
      Width = 292
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 445
      Top = 12
      Width = 28
      Height = 13
      Caption = 'M'#234's:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object edtAnoNotaSG: TEdit
      Left = 632
      Top = 8
      Width = 35
      Height = 19
      Ctl3D = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 0
      Visible = False
    end
    object ComboBox1: TComboBox
      Left = 475
      Top = 8
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'ComboBox1'
      Visible = False
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
  end
  object menu_cadastro: TMainMenu
    Left = 605
    Top = 248
    object mi_preview: TMenuItem
      Caption = '&Preview'
      object NotaFiscal1: TMenuItem
        Caption = 'Nota Fiscal'
        OnClick = btn_previewClick
      end
      object RateiodeDespesas1: TMenuItem
        Caption = 'Rateio de Despesas'
        OnClick = btn_preview_rateio_despClick
      end
    end
    object mi_imprime: TMenuItem
      Caption = '&Imprimir'
      OnClick = btn_imprimirClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
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
  object crp_nf_serv: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 677
    Top = 239
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = BDENF
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBROKER\relNF.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 628
    Top = 213
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'BDENF'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'CALCITEM'
        DataPipeline = BDENF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDENF'
        mmHeight = 3440
        mmLeft = 6085
        mmTop = 0
        mmWidth = 72496
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        BlankWhenZero = True
        DataField = 'VLCLIENTE'
        DataPipeline = BDENF
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDENF'
        mmHeight = 3440
        mmLeft = 82550
        mmTop = 0
        mmWidth = 38629
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        BlankWhenZero = True
        DataField = 'VLINDAIA'
        DataPipeline = BDENF
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDENF'
        mmHeight = 3440
        mmLeft = 123825
        mmTop = 0
        mmWidth = 40481
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        BlankWhenZero = True
        DataField = 'VLSERVICO'
        DataPipeline = BDENF
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDENF'
        mmHeight = 3440
        mmLeft = 166423
        mmTop = 0
        mmWidth = 33602
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 66411
      mmPrintPosition = 0
      object SubNumerario: TppSubReport
        UserName = 'SubNumerario'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'BDENumerario'
        mmHeight = 20638
        mmLeft = 0
        mmTop = 0
        mmWidth = 210000
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = BDENumerario
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 0
          PrinterSetup.mmMarginLeft = 0
          PrinterSetup.mmMarginRight = 0
          PrinterSetup.mmMarginTop = 0
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'BDENumerario'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppDBText52: TppDBText
              UserName = 'DBText52'
              DataField = 'FP'
              DataPipeline = BDENumerario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'BDENumerario'
              mmHeight = 3429
              mmLeft = 32544
              mmTop = 265
              mmWidth = 30163
              BandType = 4
            end
            object ppLabel47: TppLabel
              UserName = 'Label47'
              Caption = 'R$'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3387
              mmLeft = 63765
              mmTop = 265
              mmWidth = 3810
              BandType = 4
            end
            object ppDBText53: TppDBText
              UserName = 'DBText53'
              DataField = 'VL_NUM'
              DataPipeline = BDENumerario
              DisplayFormat = '#0.,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDENumerario'
              mmHeight = 3387
              mmLeft = 68263
              mmTop = 529
              mmWidth = 20373
              BandType = 4
            end
            object ppDBText54: TppDBText
              UserName = 'DBText54'
              DataField = 'DT_NUM'
              DataPipeline = BDENumerario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'BDENumerario'
              mmHeight = 3387
              mmLeft = 97367
              mmTop = 529
              mmWidth = 25135
              BandType = 4
            end
          end
          object ppFooterBand2: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppDBText38: TppDBText
        UserName = 'DBText302'
        DataField = 'VL_SUB_TOT_TRIBUTAVEL'
        DataPipeline = BDENF
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDENF'
        mmHeight = 3440
        mmLeft = 172773
        mmTop = 8202
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'VL_COMISSAO'
        DataPipeline = BDENF
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDENF'
        mmHeight = 3440
        mmLeft = 172773
        mmTop = 15875
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'VL_TOT_NAO_TRIBUTAVEL'
        DataPipeline = BDENF
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDENF'
        mmHeight = 3440
        mmLeft = 133615
        mmTop = 8202
        mmWidth = 30956
        BandType = 8
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        DataField = 'VL_TOT_GERAL'
        DataPipeline = BDENF
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDENF'
        mmHeight = 3704
        mmLeft = 172773
        mmTop = 21960
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'VL_IR'
        DataPipeline = BDENF
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDENF'
        mmHeight = 3440
        mmLeft = 172773
        mmTop = 41275
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'VL_ISS'
        DataPipeline = BDENF
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDENF'
        mmHeight = 3440
        mmLeft = 172773
        mmTop = 35719
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'VL_TOT_TRIBUTAVEL'
        DataPipeline = BDENF
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDENF'
        mmHeight = 3440
        mmLeft = 172773
        mmTop = 29369
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        DataField = 'CALC_RETENCAO'
        DataPipeline = BDENF
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDENF'
        mmHeight = 3440
        mmLeft = 172773
        mmTop = 47361
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        DataField = 'calcCol1'
        DataPipeline = BDENF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDENF'
        mmHeight = 3440
        mmLeft = 124884
        mmTop = 2381
        mmWidth = 39423
        BandType = 8
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        DataField = 'calcCol2'
        DataPipeline = BDENF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDENF'
        mmHeight = 3440
        mmLeft = 167746
        mmTop = 2381
        mmWidth = 33338
        BandType = 8
      end
      object ppOBS: TppDBMemo
        UserName = 'OBS'
        CharWrap = False
        DataField = 'TX_OBS'
        DataPipeline = BDENF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        Visible = False
        DataPipelineName = 'BDENF'
        mmHeight = 46038
        mmLeft = 6350
        mmTop = 5556
        mmWidth = 112713
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object RegSoma1: TppRegion
        UserName = 'RegSoma1'
        Brush.Style = bsClear
        Caption = 'RegSoma1'
        Pen.Style = psClear
        ShiftRelativeTo = SubNumerario
        Stretch = True
        Transparent = True
        mmHeight = 15346
        mmLeft = 6879
        mmTop = 20373
        mmWidth = 112184
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel56: TppLabel
          UserName = 'Label28'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 7938
          mmTop = 21696
          mmWidth = 6615
          BandType = 8
        end
        object ppDBText48: TppDBText
          UserName = 'DBText37'
          DataField = 'NM_IR'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 4233
          mmLeft = 7938
          mmTop = 26194
          mmWidth = 53446
          BandType = 8
        end
        object ppDBText49: TppDBText
          UserName = 'DBText38'
          DataField = 'NM_RETENCAO'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 4233
          mmLeft = 7938
          mmTop = 30692
          mmWidth = 53446
          BandType = 8
        end
        object ppDBText50: TppDBText
          UserName = 'DBText50'
          DataField = 'VL_IR_RETIDO'
          DataPipeline = BDENF
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 68792
          mmTop = 26194
          mmWidth = 20373
          BandType = 8
        end
        object ppDBText51: TppDBText
          UserName = 'DBText501'
          DataField = 'VL_COFINS_RETIDO'
          DataPipeline = BDENF
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 68792
          mmTop = 30692
          mmWidth = 20373
          BandType = 8
        end
        object ppDBText55: TppDBText
          UserName = 'DBText502'
          DataField = 'VL_TOT_NUM'
          DataPipeline = BDENF
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 68792
          mmTop = 21696
          mmWidth = 20373
          BandType = 8
        end
      end
      object RegISS: TppRegion
        UserName = 'RegISS'
        Brush.Style = bsClear
        Caption = 'RegISS'
        Pen.Style = psClear
        ShiftRelativeTo = RegSoma1
        Stretch = True
        Transparent = True
        Visible = False
        mmHeight = 4763
        mmLeft = 6879
        mmTop = 34660
        mmWidth = 112184
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel60: TppLabel
          UserName = 'Label60'
          Caption = 'I.S.S. retido na fonte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 7938
          mmTop = 34925
          mmWidth = 26458
          BandType = 8
        end
        object ppDBText60: TppDBText
          UserName = 'DBText60'
          BlankWhenZero = True
          DataField = 'VL_ISS'
          DataPipeline = BDENF
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 68792
          mmTop = 34925
          mmWidth = 20373
          BandType = 8
        end
      end
      object RegSoma2: TppRegion
        UserName = 'RegSoma2'
        Brush.Style = bsClear
        Caption = 'RegSoma2'
        Pen.Style = psClear
        ShiftRelativeTo = RegISS
        Stretch = True
        Transparent = True
        mmHeight = 11377
        mmLeft = 6879
        mmTop = 38365
        mmWidth = 112184
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel64: TppLabel
          UserName = 'Label64'
          Caption = 'N/Fat.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 7938
          mmTop = 39159
          mmWidth = 7938
          BandType = 8
        end
        object ppDBText61: TppDBText
          UserName = 'DBText61'
          DataField = 'NM_SALDO'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 4233
          mmLeft = 7938
          mmTop = 44451
          mmWidth = 54240
          BandType = 8
        end
        object ppDBText63: TppDBText
          UserName = 'DBText504'
          DataField = 'TOTAL'
          DataPipeline = BDENF
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 68792
          mmTop = 44451
          mmWidth = 20373
          BandType = 8
        end
        object ppDBText65: TppDBText
          UserName = 'DBText65'
          DataField = 'VL_TOT_GERAL'
          DataPipeline = BDENF
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 68792
          mmTop = 39159
          mmWidth = 20373
          BandType = 8
        end
        object ppLine47: TppLine
          UserName = 'Line19'
          Pen.Width = 2
          Weight = 1.500000000000000000
          mmHeight = 1323
          mmLeft = 7672
          mmTop = 43392
          mmWidth = 110331
          BandType = 8
        end
      end
    end
    object ppPageStyle1: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 296599
      mmPrintPosition = 0
      object ppImage3: TppImage
        UserName = 'Image3'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D6170FE670000424DFE6700000000000036000000280000001800
          0000710100000100180000000000C86700000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000
          00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFF0000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000
          00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFF000000000000000000FFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFF0000000000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000000000000000000000000000000000000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000000000000000000000000000000000000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000000000000000000000000000000000000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000000000000000000000000000000000000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFF000000000000000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
          000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000000000000000FFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
          FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFF0000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000000000000000000000000000000000000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000
          000000000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          0000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
          000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF000000000000FFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000000000000000000000000000000000000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
          000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF0000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000
          FFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF0000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000
          000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFF000000FFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000000000000000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000000000000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000000000000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000000000FFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000
          FFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000000000000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000000000000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000
          000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000
          000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
          FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000
          000000000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
          000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
          000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
          000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF0000
          00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000
          FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFF
          FFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
          FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFF0000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF000000000000
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF00000000
          0000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00FFFFFFFFFFFFFFFFFF000000000000FFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000
          000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000
          000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000000000000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000000000000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000000000000000000000000000000000000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          0000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF000000000000FFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
          000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
          FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000000000000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000000000000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        mmHeight = 104246
        mmLeft = 201613
        mmTop = 125677
        mmWidth = 6085
        BandType = 9
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 107421
        mmLeft = 82000
        mmTop = 122238
        mmWidth = 2381
        BandType = 9
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 161132
        mmLeft = 123031
        mmTop = 122238
        mmWidth = 2117
        BandType = 9
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 160867
        mmLeft = 165100
        mmTop = 122238
        mmWidth = 2381
        BandType = 9
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'EMISS'#195'O:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3725
        mmLeft = 124619
        mmTop = 33602
        mmWidth = 48419
        BandType = 9
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'VENCIMENTO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3725
        mmLeft = 174890
        mmTop = 33602
        mmWidth = 26458
        BandType = 9
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'N/REFER'#202'NCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3725
        mmLeft = 124619
        mmTop = 47096
        mmWidth = 25135
        BandType = 9
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        mmHeight = 18521
        mmLeft = 8731
        mmTop = 8996
        mmWidth = 44715
        BandType = 9
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D61708EBD0000424D8EBD0000000000003600000028000000DD00
          000049000000010018000000000058BD0000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7
          FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF6F7F7FFFFF7FFFFEFFFFFEFFFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFEEF7F7F7FFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFF7F7F7
          FFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F7FFFFF7FFFFF7FFFFEEF7F7F7FFFFF7FFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7F7F7F7F7F7FFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
          FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFFFF
          F7FFFFEEF7F7EEF7F7FFFFFFFFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFF7FF
          FFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFF7FFFFF7
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F7F7F7F7F7F7F7F7F7F7F7
          FFFFFFEEF7F7F7FFFFF7FFFFF7FFFFF7FFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FF
          FFF7FFFFEEF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFF
          F7FFFFF7F7F7FFFFFFFFFFFFFFFFFFFFF6F7FFF6F7FFFFF7F4F8EFF7FFFFF7FF
          FFF7F7F7F7F7F7FFFFFFFFF6F7F7FFFFF7FFFFF7FFFFF7FFFFFFF6F7FFFFFFFF
          FFFFFFFFFFF7FFFFEEF7F7F7FFFFF7F7F7FFFFFFFFF6F7FFFFFFFFFFFFFFFFFF
          FFFFFFF7FFFFEEF7F7EEF7F7FFFFFFFFFFFFFFFFFFFFFFFFF8EDEFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7F7F7F7F7F7FFFFFFFF
          FFFFFAD8DEA48485A48485C9ABB0E2CBCFF9E4E7FFEFEEFFFFFFFFFFFFF7F7F7
          F7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFF6
          F7FFF6F7FFF6F7FFF6F7FFF6F7FFF6F7FFF6F7EEF7F7EEF7F7FFFFFFFFFFFFFF
          FFFFFFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFFFF6F7FFF6F7FFF6F7F7FFF7
          F7FFF7F7FFF7FFFFFFFFFFFFFFF6F7FFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFF6F7FFF6F7FFF6F7FFF6F7FFF6F7FF
          F6F7FFF6F7FFF6F7FFF6F7FFF6F7FFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF7FFFFF7FFFFF7FFFFF7F7F7FFFFFFFFFFFFDEC2C18F6964733741
          763F4878474F845557795758977D7DD6C4C5FFFFFFFFFFFFF7F7F7F7FFFFF7FF
          FFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFE0D7D688717588717588
          7175977D7DF0DBD9FFFFFFE7E7E786787A887175887175887175F0DBD9FFFFFF
          FFFFFFFFFFFFFFF6F79F8A8D8D6B6C7F636386787AE7E7E7F7FFFFF7FFFFF4F8
          EFAC94928D6B6C8D6B6C8D6B6CD6C4C5FFF6F7F7FFFFF7FFFFE3E0DB8871757F
          6363887175977D7DF9E4E7FFFFFFFFFFFFFFFFFFFFEFEE9D86848D6B6C8D6B6C
          86787AF8EDEFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEFEECFBDBE67454B7337417B3742883C487B3742732B
          376A313A78474F8D6B6CCFBDBEFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7
          FFFFF7FFFFF7FFFFFFFFFFFFFFFFF0DBD94B30343D1B1C43252A43252AD5BEBC
          FFFFFFF4F8EF6666664021204A20214A2021AD898FE2CBCFE2CBCFE2CBCFCFBD
          BE5A3B3A53282B4A20216D5654FFF7F0EEF7F7F7FFFFF7F7F78871753D1B1C4A
          20214A20219F8A8DFFFFFFF7F7F7FFFFFFF8EDEF7F636343252A43252A3D1B1C
          AC9492F0DBD9E2CBCFF0DBD9D5BEBC5843463D1B1C40212059484BFFEFEEFFF6
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFF
          FFFFF6F7956F755B29297B37428536438536437A2E3A6A282D7B374286414C78
          474F977D7DF9E4E7FFF7FFFFF7FFFFF7FFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFEFEE795758592D34592D3453282BBCA3A1FFFFF7FFFFF7CCB7
          B6523330592D34592D34592D345A3B3A5A3B3A5A3B3A5A3B3A592D34592D344A
          20218D6B6CFFF6F7FFFFFFF7F7F7FFFFFFAC94924A2021592D344A20218D6B6C
          FFFFFFFFFFFFFFFFFFFFFFFFCCB7B64B303453282B53282B592D345843465A3B
          3A5A3B3A52333052333053282B53282B887175FFF6F7FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7B6A19F66333373
          374186414C853643853643732B377A2E3A853643853643884953763F48C9ABB0
          FFF7FFFFF7FFFFF7FFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFA4716F522220732B37582824977D7DFFFFF7FFFFF7FFFFF7947A743D1B1C6A
          313A6633334A20214A20214A20214A20216633336633334A2021AF9A9DFFFFFF
          FFFFFFFFFFFFFFFFFFBEA9AC48292A592D345222208F6964F9E4E7FFFFFFFFFF
          FFFFFFFFFFF6F77F63634A202166333358282453282B3D1B1C53282B53282B53
          282B6633334A2021B7999EFFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFFFFFFFE2CBCF763F486A313A883C48883C487B3742
          7B3742732B37732B37853643853643853643793D478D6B6CF9E4E7FFFFFFFFFF
          FFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7
          FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFF7B79A9563282C73
          2B376A282D795758FFEFEEFFFFFFFFFFFFD5BEBC592D345828245B29296B4344
          AD8285AD8285855B5C5828245B292953282BD5BEBCFFFFFFFFFFFFF7F7FFF7F7
          FFD6C4C55A3B3A53282B5B29296B4344FAD8DEFFFFF7FFFFFFFFFFFFFFFFFFCF
          BDBE52333063282C63282C693A42AD898FAD898F78474F5B29295B292953282B
          D5BEBCFFFFF7FFFFF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFF7FFFF
          F7FFFFFFFFFFA4848563282C853643883C487B37427B3742763F48A4716F7337
          417A2E3A8536437A2E3A88495378474FC9ABB0FFFFFFF7F7F7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFF
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFF7FFFFFFFFF7D5BEBC66333363282C63282C5A3B3A
          E3E0DBFFFFF7FFFFF7FFFFF78D6B6C5222205B29296B4344F0DBD9FFF7F0A484
          8553282B592D345A3B3AF0DBD9FFFFFFFFFFFFFFFFFFFFFFFFF0DBD95A3B3A53
          282B66333353282BE6DBC8FFFFFFFFFFFFFFFFFFFFFFFFFFEFEE7F6363582824
          58282472524DFAD8DEFFF7F08D6B6C5B29295B29295A3B3AF0DBD9FFFFF7FFFF
          F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFF
          EEF7F7F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E4E77847
          4F732B37853643853643853643733741733741D7ADAE8B58606A282D85364385
          36437B37426A313A9F8A8DFFFFFFF7F7F7F7FFFFF7FFFFF7F7F7FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F7FFFFF7FFFFF7FFFFF0DBD9693A425B29295B2929523330D2CDBDFFFFFFF7F7
          F7FFFFFFCCB7B6592D34522220522220B79A95FFFFF78F69644A202153282B6D
          5654F9E4E7FFFFFFFFFFFFEEF7F7FFFFFFFFEFEE67454B53282B53282B53282B
          D5BEBCFFFFF7FFFFF7F7F7F7F7F7F7FFFFFFCCB7B652333052333048292AB79A
          95FFFFF7855B5C4A20214A2021766456FFEFEEFFFFF7FFFFF7F7FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFE2CBCF693A427B37427B374285
          3643883C48793D4778474FCC99998B58606A282D733741733741793D4778474F
          7F6363F9E4E7FFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDFFF7F7FF
          FFFFF7F07957585B29295B292948292AAF9A9DFFFFFFF7FFF7FFFFFFFFF6F78D
          6B6C4A2021592D3478474FFAD8DE6B43445828244A2021887175FFF6F7FFFFFF
          FFFFFFFFFFFFFFFFFFFFF7F07F636348292A48292A48292AAC9492FFFFFFFFFF
          FFEEF7F7F7FFFFFFFFFFFFF6F76D565448292A48292A855B5CFAD8DE84555753
          282B53282B977D7DFFF6F7FFF6F7FFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDFFF7EFFF
          FFEFFFFFEFFFFFEFFFFFEFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFF
          FFFFEEF7F7FFFFFFFFFFFFB6A19F53282B7B3742883C48853643732B378B5860
          D7ADAEC9ABB08D6B6C956F75AD8285733741763F48693A42855B5CFAD8DEFFFF
          FFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF7F7FFFFFF88717552
          2220663333522220947A74FFF6F7F7FFF7F7F7F7FFFFFFCFBDBE48292A582824
          663333B68C8D78474F6633334A20219F8A8DFFFFFFF7F7F7FFFFFFFFFFFFFFFF
          FFFFFFFFA484854A202153282B53282B977D7DFFFFFFFFFFFFFFFFFFFFFFFFF7
          F7F7FFFFFFCCB7B648292A48292A5A3B3AAD8285763F485B292948292AB6A19F
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFEFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF6F7BCA3A16A313A732B378536438536437337418455578D6B6C7F63635A3B
          3A67454BAD898FAD82858455576A313A855B5CF9E4E7FFEFEEFFEFEEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFE0D7D6D6C4C5D6C4C5D6C4C5EFE5E5FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5
          F8EDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFB79A95522220663333582824
          855B5CFFF6F7FFFFFFF7F7F7F7F7F7F7F7F77F63635222206633337337416A31
          3A6A282D582824CCB7B6FFFFFFF7FFF7F7FFF7FFF6F7FFF6F7FFF6F7CC99995B
          29295828245828248F6964FFF6F7FFF6F7FFF6F7FFF6F7FFF6F7FFFFFFFFEFEE
          6E585A4A20216633337B37426A313A5B2929523330D5BEBCFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7F9E4E7F0DBD9
          DEC2C1DEC2C1E2CBCFCFBDBEE0D7D6EFE5E5F8EDEFD8D6D6AF9A9D7F6363693A
          427B3742853643853643853643693A424021202E1A192E1A1920181940212067
          454B4B30345A3B3A795758DEC2C1AD828572524D9D8684CFBDBEF9E4E7FFF7FF
          FFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E5A4848572
          524D5828245828245828245828245828245828246633338D6B6CCFBDBEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF582824582824582824582824582824582824582824582824582824855B5CFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF582824582824582824582824582824
          582824855B5CFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824A48485FFFFFFFFFF
          FFFFFFFFFFFFFFAC949258282458282458282458282458282458282458282458
          2824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F7D5BEBC592D345B29295B29296B4344EFE5E5F7F7
          F7F7F7F7F7F7F7F7FFF7BFB7A866333363282C63282C63282C6A282D6A313AE3
          E0DBF7FFFFF7FFFFE3E0DB86787A7F63638D6B6C84555763282C663333663333
          6633338D6B6C947A74786F62BEA9ACFFFFFFFFFFFFFFFFFFBEA9AC53282B6633
          3363282C63282C63282C693A42F0DBD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF6F7F0DBD9B6A19F956F757F6363855B5C855B5C8B58608B58
          607957586D56548871759F8A8DAF9A9D86787A67454B763F488536438536437A
          2E3A7B3742763F48763F4843252A33282A33282A2E1A192E1A1940212048292A
          5A3B3A8D6B6C8D6B6C693A42693A4278474F887175AF9A9DD8D6D6FFFFFFF7FF
          FFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8EDEFA48485582824582824582824663333A48485
          CFBDBED6C4C5D6C4C5B6A19F72524D5828245828246B4344D6C4C5FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5BEA9AC72
          524D582824582824582824582824947A74BEA9ACE0D7D6FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFD6C4C5BEA9AC6B434458282472524DBEA9ACE0D7D6FFFF
          FFFFFFFFFFFFFFFFFFFF855B5C582824663333F8EDEFFFFFFFFFFFFFFFFFFFEF
          E5E5D6C4C5A4848558282458282458282458282472524DBEA9ACD6C4C5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFF
          FFFFFFFFE3E0DB5A3B3A592D345B2929663333D6C4C5FFFFFFF7F7F7EFFFFFEF
          FFFFF7F7F77F636353282B592D34592D3463282C795758F8EDEFF7FFFFEEF7F7
          E7E7E759484B3D1B1C52222058282463282C6633336633335B29295B29294829
          2A402120887175FFF6F7FFF6F7FFFFFFFFEFEE79575853282B66333358282453
          282B795758FFF7F0FFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEEAC94
          926B43445B29295B29296A282D793D47793D47793D4786414C73374167454B6D
          5654BCA3A1D6C4C55843465A3B3A8849537B37428536438536437A2E3A884953
          AA7F7C8D6B6C4021205A3B3A7F6363977D7D6D56545345476D56548D6B6CC9AB
          B0956F7573374186414C88495378474F795758BEA9ACFFF6F7FFF6F7FFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F8EDEF72524D582824582824582824947A74F8EDEFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFB6A19F582824582824582824BEA9ACFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824582824
          582824582824F8EDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFA48485582824CFBDBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF
          E5E5582824582824582824B6A19FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEF
          582824582824582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFF7F7FFF7F7FFF76D
          56544021204A20214A2021AF9A9DFFFFFFFFFFFFFFFFFFEEF7F7FFFFFFC9ABB0
          48292A43252A43252A3D1B1C8D6B6CFFFFFFEDFFF7F7F7F7FFFFFF8871752E1A
          1948292A48292A5B292952222052222053282B53282B40212040212059484BFF
          EFEEFFFFFFFFFFFFFFF6F7C9ABB03D1B1C4A202153282B3D1B1C86787AFFFFFF
          F4F8EFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFE2CBCF592D344A202163282C63
          282C732B377A2E3A8536437A2E3A85364373374178474FC9ABB0FFF6F7887175
          20181967454B8B5860733741733741733741793D47733741AA7F7CDEAFB18D6B
          6C592D34956F75E2CBCFF0DBD9CFBDBECFBDBEE0D7D6FFEFEE9C7063732B3785
          36438536438536438849538F6964956F75E2CBCFFFF6F7FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C5828245828
          24582824855B5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFB6A19F582824582824582824BEA9ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEA9AC582824582824582824582824FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC
          9492582824D6C4C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF947A74582824582824
          5828246B4344FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5828245828245828
          24582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFEEF7F7EFFFFFEDFFF7F4F8EFB0A8A99386849D8684
          9D8684CFBDBEFFF6F7FFF6F7FFFFFFF7FFFFFFFFFFFFF6F7AF9A9D9386849386
          84938684CFBDBEEEF7F7EEF7F7FFFFFFFFFFFFBEA9AC86787A86787A977D7D94
          7A74977D7D977D7D977D7D9D86849D868486787A86787AE7E7E7F7FFFFEEF7F7
          FFFFFFEFE5E5B6A19F9D86849D86849D8684CCB7B6FFFFFFF7FFFFF7FFFFF7FF
          FFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7
          FFFFF7FFFFFFFFFFFFFFFFFAD8DE693A424A202163282C6A282D732B377A2E3A
          7A2E3A86414C7B37426A313AB79A95FFF7FFCFBDBE2A1F212A1F216D5654977D
          7D592D346A313AAD8285D7ADAE763F48AD8285FFF7FFB7999E592D346A313A95
          6F75FAD8DEDEC2C1977D7DFFEFEEDEAFB1733741733741883C48853643853643
          853643793D478849538B5860C9ABB0FFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFB6A19F582824582824582824582824EFE5E5FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF72524D
          582824582824663333EFE5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5
          FFFFFFFFFFFFFFFFFFFFFFFFEFE5E5582824582824582824582824582824BEA9
          ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF582824582824582824582824AC9492FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFF
          EFFFFFEFFFFFEFFFFFEEF7F7F7FFFFFFFFF7FFFFF7FFFFF7FFF7F0FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFF6F7FFFFFFF7
          FFFFF7FFFFF7F7F7FFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
          FFF7F0FFF7F0FFF7F0FFFFFFFFF6F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFF
          F7FFFFF7FFFFF7FFFFF7FFFFF7EEF7F7EFFFFFEFFFFFEFFFFFF7FFFFF7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFF
          FFFFFFE2CBCF6B434463282C63282C63282C63282C5828246A313A63282C6328
          2C8F6964FFEFEEE2CBCF59484B2A1F212A1F215843466D56546D5654B79A95FA
          D8DEFAD8DE693A4278474FF0DBD9E2CBCF855B5C845557592D348D6B6CE2CBCF
          F0DBD9F9E4E7956F756A313A6A313A8536438536438536438536438536437B37
          42884953855B5CB6A19FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF6B4344582824582824582824947A74FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEA9AC5828245828245828
          24947A74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6
          C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5FFFFFFFFFFFFFFFF
          FFFFFFFFAC949258282458282458282458282466333372524DFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF582824582824582824582824AC9492FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFEEF7F7F7FF
          FFF7FFFFF7FFFFFFFFF7FFFFF7FFEFEEFFF6F7FFEFEEFFEFEEFFF6F7FFF6F7FF
          F6F7FFF6F7FFEFEEFFF6F7FFF6F7FFF6F7FFFFFFF7F7F7F7F7F7F7FFFFFFF7FF
          FFF7FFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFEF
          EEFFF7F0FFF7F0FFF7F0FFF7F0F7F7F7F6F3E6F6F3E6FFF6F7FFF6F7FFEFEEFF
          EFEEFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFF0DBD94B30
          343D1B1C592D34592D34693A42855B5C8D6B6C79575878474FA48485BCA3A159
          484B2E1A194B30346D5654938684AC9492DEC2C1F0DBD9FFF6F7D7ADAE5A3B3A
          67454BD6C4C5FFFFFFE2CBCFDEC2C18D6B6C592D348D6B6CB7999E9D86846745
          4B67454B763F48763F48732B37732B377B37427B37427B37427B37426B43446D
          5654AF9A9DF0DBD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBDBE582824
          582824582824582824CFBDBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E5582824582824582824582824F8EDEFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824
          582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFAC9492582824D6C4C5FFFFFFFFFFFFFFFFFFF8EDEF66333358
          2824582824582824855B5CAC9492582824D6C4C5FFFFFFFFFFFFFFFFFFFFFFFF
          582824582824582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F7F7F7F7F7E0D7D69D
          86846E585A6D56546E585A7F63637664566E585A6E585A795758795758795758
          7957586E585A86787ACCB7B6F8EDEFFFFFFFF7F7F7FFFFFFFFF6F7F7FFFFEEF7
          F7F7FFFFEEF7F7F7F7F7FFFFFFEFE5E5C9ABB07F63637F636379575879575879
          57587957586E585A7F63637F63637F63637957587F63637F6363977D7DE0D7D6
          FFFFFFFFFFFFF7FFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0D7D667454B67454BBEA9ACE2
          CBCFE2CBCFFFF6F7FFEFEEF9E4E7A484856E585A43252A2E1A1958434667454B
          6E585AE2CBCFFFF7FFDEC2C1855B5CFAD8DEB7999E795758DEC2C1E0D7D6CCB7
          B6AC9492956F755A3B3A52333043252A43252A43252A40212048292A48292A53
          282B763F4888495363282C63282C53282B53282B592D3452333043252A86787A
          FFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC94925828245828245828245828
          24FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF663333582824582824582824BEA9ACFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC
          9492582824D6C4C5FFFFFFFFFFFFFFFFFFAC9492582824582824582824582824
          CFBDBEF8EDEF663333855B5CFFFFFFFFFFFFFFFFFFFFFFFF5828245828245828
          24582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFF7F7F7FFFFFFD6C4C567454B2E1A193D1B1C53282B
          4A20214021204021204021204021204A20215828245828245828245828244A20
          214A202186787AEFE5E5FFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFF
          FFFFEFE5E5947A744B30344A20215B29295222205222205222205222203D1B1C
          4A20214A20214A20214A20213D1B1C4A20213D1B1C584346E2CBCFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8EDEFCFBDBED8D6D6FFF6F7FFFFFFFFFFFFF7F7F7
          FFFFFFF9E4E772524D43252A48292A67454BD7ADAEDEAFB1693A426B4344AD89
          8FF0DBD9FAD8DEFFEFEEAA7F7C78474F956F756D56544B30342E1A192E1A192A
          1F212A1F212A1F212A1F212018192A1F212A1F212A1F214B30347F6363A48485
          5A3B3A693A42956F75C9ABB0D5BEBCC9ABB0938684AF9A9DEFE5E5FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF8D6B6C5828245828245828246B4344FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          855B5C582824582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5
          FFFFFFFFFFFFF8EDEF6633335828245828245828246B4344FFFFFFFFFFFFA484
          85582824D6C4C5FFFFFFFFFFFFFFFFFF582824582824582824582824AC9492FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7
          F7F7F7FFFFFFFFFFFFBEA9AC8F6964AD8285AA7F7CAA7F7C956F75AA7F7C937A
          6DAA7F7CAA7F7CAA7F7C8455575B292966333366333366333353282B48292A86
          787AF8EDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7887175402120
          53282B66333363282C6633336633338B5860A4716FAA7F7CAA7F7CAA7F7CAA7F
          7CAA7F7CAA7F7CAA7F7CAA7F7C956F75B7999EFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F7F7F7F7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFCFBDBE5A3B
          3A592D34693A42693A42DEAFB1FFEFEE956F75592D34763F48956F75DEAFB1AD
          8285884953693A42693A42693A423D1B1C2A1F212A1F212A1F212A1F21201819
          2018192018192018192018192A1F214B30344B3034AC9492D6C4C5CFBDBEFFF7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF855B5C582824582824582824855B5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C5828245828
          24582824855B5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6
          C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5FFFFFFFFFFFFBEA9
          AC582824582824582824582824BEA9ACFFFFFFFFFFFFEFE5E5582824947A74FF
          FFFFFFFFFFFFFFFF582824582824582824582824AC9492FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFF8EDEFBEA9
          ACAD898FB68C8DB68C8DB68C8DB68C8DB68C8DB68C8DB68C8DB68C8DB68C8DB6
          8C8D9C706366333363282C66333366333353282B48292A6E585AEFE5E5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E76E585A4A202158282463282C6328
          2C63282C5B29298F6964B68C8DB79A95B68C8DB68C8DB68C8DB68C8DB68C8DB6
          8C8DB68C8DB68C8DB68C8DC9ABB0F9E4E7FFFFFFFFFFFFFFF6F7FFF6F7F7FFFF
          F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFEEF7F7F7FF
          FFF7FFFFFFFFFFFFF6F7FFFFFFFFFFFFFFF6F7977D7D592D346A313A793D476A
          313A8B5860F9E4E7E2CBCF78474F592D34733741733741733741793D47793D47
          793D478B58607957584021202018192018192A1F214A444586787A86787A3333
          3333282A33333333282A4B30347F6363FFEFEEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C582824
          582824582824855B5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C582824582824582824855B5CFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824
          582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFAC9492582824D6C4C5FFFFFFFFFFFF6B434458282458282458
          28246B4344FFFFFFFFFFFFFFFFFFFFFFFF947A74582824EFE5E5FFFFFFFFFFFF
          582824582824582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF7F7F7FFFFFFFFFFFFFFFFFFF4F8EFD7CFC45C544948292A4A20214A20214A
          20214A20214A20214A202140212053282B52222052222052222058282463282C
          66333366333352222072524DBEA9ACF9E4E7FFF6F7FFFFFFF7F7F7FFFFFFFFFF
          FFEEF7F7F7FFFFFFFFF7F9E4E7CC999978474F5222205B29295B292966333358
          2824582824301E083D1B1C4A20214A20214A20214A20214A20214A20214A2021
          4021204021207F6363E0D7D6FFEFEEFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFF
          FFFFFFFFFFF8EDEF9F8A8D6E585A6B4344845557D7ADAE8B5860663333CC9999
          FAD8DE8D6B6CA4716FA4716F763F4873374186414C86414C7B3742793D47D7AD
          AE947A744B303433282A5C5449CCCCCCE0D7D6B0A8A9CFBDBE99999959484B2A
          1F212A1F216E585AFFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C582824582824582824855B
          5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF855B5C582824582824582824855B5CFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC
          9492582824D6C4C5FFFFFFBEA9AC582824582824582824582824BEA9ACFFFFFF
          FFFFFFFFFFFFFFFFFFEFE5E5582824947A74FFFFFFFFFFFF5828245828245828
          24582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFEEF7F7FF
          FFFFFFFFFFFFFFFF86787A59484B59484B72524D6B43446B43446B43446B4344
          6B43446B43446B43446B43446B4344592D34592D3453282B53282B48292A9D86
          84EFE5E5FFFFFFFFF6F7FFF6F7FFF6F7E7E7E7FFFFF7FFFFF7E7E7E7E7E7E7FF
          FFFFFFFFFFFFFFFFF0DBD9977D7D52333052333058282458282463282C72524D
          72524D6B43446B43446B434472524D67454B72524D67454B67454B67454B5345
          47938684FFF6F7FFF6F7F7FFFFEEF7F7F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFF7FFFFF7FFB7999E
          5A3B3ACCB7B6FAD8DEDEC2C1D7ADAEA484857957585843467F6363BEA9ACFFF6
          F7CDA7A5763F4886414C7B374286414C853643793D47B68C8DFFEFEE99999986
          787AD8D6D6B0A8A95C54495C544986787A6E585A3333332A1F212A1F21666666
          E7E7E7F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFAC949258282458282458282472524DFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          6633335828245828245828248D6B6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5
          FFFFFF6B43445828245828245828246B4344FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF947A74582824EFE5E5FFFFFF582824582824582824582824AC9492FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFEFFFFFEEF7F7F7FFFFF7F7F7F7F7F7F8EDEFCFBDBE
          BEA9ACBCA3A1CDA7A5D7ADAED7ADAED7ADAED7ADAED7ADAECDA7A5CDA7A5CDA7
          A5D7ADAECC9999693A4253282B53282B523330BEA9ACFFF6F7FFFFFFFFFFFFF0
          DBD99386846E585ABFB7A8E2CBCFCFBDBECCB7B66E585A9F8A8DE3E0DBFFFFF7
          FFFFF7FFFFF7AF9A9D5233306633336A282D6A313ACC9999CDA7A5CDA7A5CDA7
          A5CDA7A5CDA7A5CDA7A5CDA7A5CDA7A5CDA7A5CDA7A5BCA3A1BEA9ACCFBDBEFF
          F6F7FFFFFFF7F7F7F7F7F7F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7FFFFF7FFFFF7FFFFF7F7F7FFF7FFE2CBCF78474F693A42CC9999FFF7
          FFE2CBCF947A74D6C4C5AC94926E585A9F8A8DEFE5E5FFFFFFF9E4E784555773
          374186414C883C48883C487B37428B5860FAD8DEB0A8A93333335C54494A4445
          33282A20181953454786787A4A44452018192A1F215C5449F7F7F7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFCFBDBE582824582824582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEF5828245828245828
          24582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6
          C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5BEA9AC5828245828
          24582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0D7D658
          2824947A74FFFFFF582824582824582824582824AC9492FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFEEF7F7EEF7F7FFFFFFFFFFFFE0D7D67F63635233305233305233306633
          33663333663333663333663333663333663333663333733741732B376A282D6A
          282D5828245A3B3ABEA9ACFFFFF7FFFFF7F8EDEF9386844B303443252AB6A19F
          947A74977D7D9D8684956F75B7999E48292A5A3B3A9F8A8DFFF7F0FFF7F0FFFF
          F7BCA3A166333363282C6A282D6A313A6A313A66333366333366333366333366
          3333663333663333663333592D34693A425A3B3A5233307F6363F0DBD9FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF7F7F7F7F7F7F9E4E78D6B6C6A313A7337418B5860FAD8DEFFEFEEF0DBD9AF
          9A9D86787AB0A8A9FFF6F7FFF6F7FFF6F7FFFFFFAD898F6A313A86414C853643
          883C48883C48733741BCA3A1FFFFFFCFBDBE6666662A1F212A1F212018193328
          2A4A444533282A2A1F212A1F21666666E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEF663333
          582824582824582824E0D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFBEA9AC582824582824582824582824E0D7D6FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824
          582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFAC9492582824D6C4C572524D582824582824582824663333F8
          EDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C663333F8EDEF
          582824582824582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF7F7F7FF
          FFF7F7F7FFEFEE7F63633D1B1C5A3B3A5B29295B29296633335B29295B292966
          333366333366333366333363282C63282C6A282D6A282D6A282D5B29299F8A8D
          FFFFFFFFFFFFFFEFEED5BEBC67454B2E1A19938684BCA3A13D1B1CA48485A484
          8553282BCDA7A5A4716F40212067454BD6C4C5F8EDEFFFF6F7FFF6F7B68C8D52
          22205B29295B29295B29295B29295B29295B29295B29295B29295B2929663333
          6633336633335B29295B2929592D343D1B1C7F6363F9E4E7FFF6F7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF
          9A9D53282B7B37427B37426A313AAD8285FFEFEE86787A5C5449D8D6D6FFF6F7
          FFFFFFEEF7F7F7FFFFFFFFFFE2CBCF78474F7B3742883C48883C48883C486A31
          3A8D6B6CE0D7D6999999B0A8A986787A4A444566666633282A20181920181933
          282A33282A86787AFFF6F7FFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA484855828245828245828
          24A48485FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF855B5C5828245828245828246B4344FFFFFFFFFFFFEFE5E5AC9492
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E5AC9492FFFFFFFFFFFFFFFFFFFFFFFFAC
          9492582824AC9492582824582824582824582824AC9492FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824AC94925828245828245828
          24582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFEEF7F7FFFFFFEFE5E5CC
          B7B6CDA7A5D7ADAED7ADAED7ADAED7ADAED7ADAED7ADAED7ADAED7ADAEDEAFB1
          DEAFB1DEAFB1DEAFB184555763282C522220795758F8EDEFFFFFFFF9E4E78F69
          648B5860DEAFB1B79A95D5BEBC6B43443D1B1CA48485977D7D3D1B1C67454BDE
          C2C1B79A95CCB7B66E585A786F62FFEFEEFFEFEEFFEFEE78474F53282B663333
          845557D7ADAED7ADAED7ADAED7ADAED7ADAED7ADAED7ADAED7ADAED7ADAEDEAF
          B1CDA7A5D7ADAED7ADAEBEA9ACFFEFEEFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E572524D6A313A853643
          883C487B374278474F7F63634B30344B3034BFB7A8FFF7FFFFFFFFF7FFFFEEF7
          F7FFFFFFFFEFEE956F75793D47883C48883C48883C4886414C6B4344B7999E6E
          585A86787AE7E7E7B0A8A986787A786F6233282A2A1F2120181933282ABEA9AC
          FFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEF6B4344582824582824663333F8EDEFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824
          582824582824582824D6C4C5FFFFFFFFFFFFD6C4C5582824FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFD6C4C5582824FFFFFFFFFFFFFFFFFFFFFFFFAC9492582824663333
          582824582824582824663333F8EDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF72524D663333582824582824582824582824AC9492FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E593868467454B795758855B5C795758
          855B5C855B5C855B5C795758845557845557845557855B5C845557855B5C7957
          586A313A5B2929592D34C9ABB0FFFFF7FFFFF7AD898F52222063282C63282CDE
          C2C1F0DBD9CC9999CC9999DEC2C1CCB7B6BCA3A1C9ABB0E2CBCFD5BEBC523330
          402120402120AD898FFFFFFFFFF6F7C9ABB040212053282B693A427957587957
          58795758795758795758845557845557845557845557845557855B5C72524D7F
          63636E585A5C5449938684F8EDEFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F7BEA9AC6A313A7B37428536438536437B3742693A
          4248292A2E1A192018194A4445999999FFFFFFF7FFFFF7FFFFF7FFFFFFFFFFCC
          B7B6693A42793D47883C48883C48883C48763F486B43449F8A8D86787ACCCCCC
          86787A33282A86787A4A44452A1F212A1F21584346C9ABB0FFF6F7FFFFFFF7FF
          FFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE0D7D666333358282458282472524DF8EDEFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEF6B4344582824582824582824AC94
          92FFFFFFFFFFFFFFFFFFD6C4C5582824D6C4C5FFFFFFFFFFFFFFFFFFFFFFFFD6
          C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6A19F
          582824E0D7D6FFFFFFFFFFFFFFFFFFAC94925828245828245828245828245828
          24947A74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFBEA9AC582824582824582824582824582824AC9492FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFEFEE6E585A2E1A194021204A20214A20214A20214A20214A20214A20
          214A20214A20214A20214A20214A20214A20214A20214A20215B292952222069
          3A42F0DBD9FFFFFFD8D6D658434653282B663333663333B6A19F5C544972524D
          8F6964C9ABB0C9ABB07F636372524D6B4344D7ADAE6B434453282B53282B5843
          46E0D7D6FFFFFFEFE5E54B303448292A48292A4A20214A20214A20214A20214A
          20214A20215222205222205222205222205222204A20214A2021402120402120
          2E1A19666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFF
          FFFFF6F7956F756633337B3742883C48883C486A313A592D3440212040212033
          282A20181933282A999999E7E7E7F7FFFFF7FFFFFFFFFFFFF6F78D6B6C6A313A
          793D47883C48883C48883C48693A42BEA9ACFFF6F7F8EDEFB0A8A93333334A44
          456E585A48292A43252A6D5654855B5CD5BEBCFFFFFFFFFFFFFFFFFFF7F7F7F7
          FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE0D7D66B434458282458282472524DCFBDBEFFFFFFFFFFFFFFFFFFFFFF
          FFF8EDEFBEA9AC663333582824582824582824B6A19FFFFFFFFFFFFFFFFFFFFF
          FFFFD6C4C558282472524DA48485AC9492AC9492AC9492947A74582824582824
          582824582824A48485AC9492AC9492AC9492947A746B4344582824D6C4C5FFFF
          FFFFFFFFFFFFFF947A74582824582824582824582824582824EFE5E5FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6B4344
          582824582824582824582824947A74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C59F8A
          8D977D7DA48485A48485A48485A48485A484859D86849D86849D86849D86849D
          8684A48485A48485A48485A48485A48485A48485A48485B7999EFFF6F7FFF6F7
          9F8A8D402120592D3463282C845557CDA7A548292A48292A3D1B1CA48485947A
          743D1B1C48292A5B2929CDA7A5855B5C5B29295B292948292A9D8684FFFFF7FF
          FFF7AF9A9DA48485A48485A48485A48485A48485A48485A48485A48485AD8285
          AD8285AD8285AD8285AD8285A48485A48485A48485A48485938684938684F7F7
          F7FFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFF7FFFFEFEE78474F63
          282C86414C8536437A2E3A693A42B7999E956F752E1A192A1F212A1F212A1F21
          201819666666B0A8A9F7F7F7F7F7F7FFFFFFCFBDBE67454B73374186414C8536
          43883C48883C488B5860FAD8DEFFFFFFFFFFFFCFBDBE4A444543252A43252A53
          282B763F4878474F8D6B6CE0D7D6FFFFFFF7F7F7F7F7F7F7FFFFF7FFFFF7FFFF
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8ED
          EFAC9492663333582824582824663333855B5C855B5C72524D58282458282458
          28245828248D6B6CE0D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6A19F582824
          5828245828245828245828245828245828245828245828245828245828245828
          24582824582824582824582824582824582824BEA9ACFFFFFF855B5C6B434458
          28245828245828245828245828248D6B6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC94925828245828245828
          245828245828246B4344855B5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEFFFFFFFFFFFFFFF
          F6F7FFFFFFFFFFFFFFF6F7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFEFEE79575853282B6633
          33522220AD8285AD82854A2021663333582824AD8285AD828552222066333358
          2824AA7F7CAA7F7C5828245828245828247F6363FFEFEEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFF6F7FF
          FFFFFFFFFFF7FFFFEEF7F7FFFFFFFFFFFFDEC2C1693A426A313A883C48883C48
          6A282D8D6B6CFFEFEEFAD8DE5A3B3A2E1A192A1F212A1F212A1F212018196666
          66E7E7E7FFFFFFF7F7F7F7F7F7AD898F5A3B3A86414C883C48883C48883C486A
          313AB68C8DFFF6F7FFFFFFFFFFFFE0D7D6977D7D7957586B43446B4344793D47
          845557AF9A9DFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6
          C4C5AC9492947A74855B5C855B5C855B5C855B5CAC9492BEA9ACEFE5E5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5AC9492AC9492CFBDBED6C4
          C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6
          C4C5B6A19FAC9492AC9492D6C4C5FFFFFFAC9492AC9492AC9492AC9492AC9492
          AC9492AC9492E0D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEFAC9492AC9492AC9492AC9492AC9492AC
          9492AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFF7F7FF
          F7F7FFF7F7FFF7FFFFFFFFF6F7F0DBD95A3B3A4A20214A2021582824CC999985
          5B5C522220522220522220AA7F7CAA7F7C5222205828244A2021855B5CAA7F7C
          4A20214A20214A20216B4344F0DBD9FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F7FF
          FFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF7FFFF
          F7FFFFF7FFFFFFFFFFCCB7B6592D347337417337417B3742733741D5BEBCFFF7
          FFFFF7FFAC94924B30342E1A1920181933282A201819333333938684F4F8EFFF
          FFFFFFFFFFF0DBD97957586A313A793D47853643883C487B37426A313AC9ABB0
          FFFFFFFFFFFFFFFFFFD5BEBC693A426A313A6A313A7B374278474F8D6B6CF0DB
          D9FFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF6F7FFF6F7FFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7
          FFFFFFFFFFFFEFEE9F8A8DAD898FA48485A48485DFCFBFBCA3A1AA7F7CAA7F7C
          AA7F7CDEC2C1CCB7B6AA7F7CAA7F7CAA7F7CCDA7A5DFCFBFA69080AC9492A484
          85977D7DF9E4E7FFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFF
          FFF0DBD96D565453282B793D477A2E3A884953CC9999B68C8D8D6B6C8D6B6C69
          3A424B303443252A201819333333786F62333333B0A8A9FFFFFFF7F7F7FFFFFF
          C9ABB0693A42693A42883C488536438536436A313A795758DEC2C1FFF6F7E2CB
          CF956F7567454B592D34793D47853643853643845557A48485F9E4E7FFF6F7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFF7F7F7F0DBD9
          A48485977D7D977D7D977D7DDFCFBFBCA3A1947A74AA7F7C977D7DC9ABB0CCB7
          B6947A74AA7F7C977D7DB79A95DEC2C1947A74977D7DA48485A48485F9E4E7FF
          F6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9ABB048
          292A6633337B374286414C763F4878474F78474F78474F763F48693A42592D34
          48292A59484BAF9A9D2A1F2186787AFFFFFFFFFFFFFFFFFFFFF6F7A484856A31
          3A7B374285364385364386414C663333845557BEA9AC956F75AD898FAD898F53
          282B733741883C487A2E3A763F48763F48D5BEBCFFF7FFFFF7FFFFF7FFF7FFFF
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7
          FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFF
          F7FFFFFFF6F7FFFFFFFFFFFFEEF7F7EFFFFFF7FFFFF0DBD95A3B3A5222205222
          20522220B79A958F69644A20215828243D1B1CAA7F7CA484853D1B1C4A20214A
          20218F6964AC94924A20214A20214A20215A3B3AF0DBD9FFFFFFFFFFFFEFFFFF
          EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF8EDEF947A74592D346A282D
          6A282D85364385364386414C7A2E3A853643883C48733741693A4259484B786F
          62201819887175FFF7FFFFF7FFFFF7FFFFF7FFEFE5E58D6B6C73374185364385
          36437A2E3A7B3742763F4878474F956F75AD898FDEC2C178474F63282C853643
          853643793D47693A42B68C8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFEFFFFFEEF7F7FFF7F07957585B2929663333522220AD8285AA
          7F7C5828245B29295B2929AD8285AA7F7C53282B592D344A2021AD8285AD8285
          4A2021592D3453282B7F6363FFF6F7FFFFFFEFFFFFEFFFFFEFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7F7F7FFFFFFFFFFFFFFF6F7F9E4E7855B5C3D1B1C732B37883C488536
          438536438536438536437B3742763F48592D344B303453454743252A59484BC9
          ABB0E2CBCFFFF6F7F8EDEFFFF6F7D5BEBC8849536A282D853643883C487B3742
          7B374288495378474F956F75FAD8DEB68C8D63282C7A2E3A883C487B37427847
          4F8D6B6CFFEFEEFFEFEEFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFF7FFFFFF9F8A8D4A20215B29295B29298F6964CC9999522220592D34
          3D1B1CAA7F7CAA7F7C3D1B1C53282B53282BCDA7A5855B5C53282B53282B5328
          2BAC9492FFFFFFFFFFFFF7F7F7F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF6F7FFFFFFD6C4C567454B4A20216A282D7B3742732B37732B3773
          2B3753282B53282B584346BEA9ACEFE5E5D6C4C57F636359484B6E585A7F6363
          7F63637F63637F636378474F5828247A2E3A7A2E3A853643853643883C487B37
          42884953A4716FA4716F66333366333373374173374173374178474FF9E4E7FF
          F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E2CBCF5A3B3A53282B53282B592D34CDA7A572524D72524D8D6B6CD7ADAED7AD
          AE8D6B6C79575872524DD7ADAE53282B5A3B3A523330584346F0DBD9FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F7F7FFFFFFFFFFFFFF
          FFFFFFFFFFD6C4C57F6363592D34693A42693A42592D3467454B8D6B6CBCA3A1
          EFE5E5FFF6F7FFFFFFFFFFFFF8EDEFEFE5E5E2CBCFBCA3A19F8A8DAC9492C9AB
          B0E2CBCF8D6B6C5222206A313A86414C7B37427B37427A2E3A86414C86414C88
          4953793D476A313A5B292963282C4A20218B5860F9E4E7FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D86844829
          2A4A20216B4344DEC2C1DEC2C1BCA3A1AC9492CCB7B6CCB7B6A48485BCA3A1FA
          D8DEDEC2C172524D402120402120AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FFF6F7FFFFFF
          EFE5E5E2CBCFDEC2C1D5BEBCE2CBCFF9E4E7FFF6F7FFF6F7FFF6F7FFFFFFF7F7
          F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E5AD
          898F4A2021592D34733741793D4786414C7B37427B374286414C86414C884953
          793D474A202178474FCCB7B6FFF6F7FFFFFFFFFFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7F7F7F7FFFFF7FFFFF7F7F7FFFFFFFFEFEE7F63638D6B6CD7ADAEB6
          8C8DDEC2C172524D2E1A19977D7D9D86843D1B1C67454BDEC2C1B68C8DD5BEBC
          7F6363887175FFEFEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF7F7EEF7F7F7FFFFF7FFFFF7
          F7F7F7F7F7FFFFFFF7F7F7F7FFFFEEF7F7F7FFFFFFFFFFFFFFFFBEA9AC67454B
          53282B53282B6A313A6A313A7B37427337417337417337416A313A855B5CD5BE
          BCFFF7FFFFF7FFFFF7FFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF6F7FFF6F7D5BEBC67454B2E1A19AD898FBCA3A1
          43252A9D8684977D7D402120C9ABB0977D7D2E1A1959484BE2CBCFF8EDEFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFEEF7F7F7FFFFF7FFFFEEF7F7FFFFFFFFFFFFF9E4E7B7999E7957584A20
          21592D346A313A592D34592D344A2021795758E2CBCFFFFFFFFFFFFFF7F7F7FF
          FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFF
          FFFFFFFFFFFFFFFFFFF9E4E79F8A8D4B303433282AAC94929386849386849F8A
          8D977D7D9F8A8D2E1A195843469F8A8DF8EDEFFFFFFFF7F7F7F7F7F7F7F7F7FF
          FFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFF
          F7FFFFF7FFFFF7FFFFF7FFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FF
          FFF7FFFFF7FFFFF7F7F7F7F7F7FFFFFFFFFFFFF0DBD9BCA3A1B7999EBEA9ACBE
          A9ACBEA9ACBEA9ACF9E4E7FFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFF7FFFF
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7F7F7FFFF
          F7FFFFF7FFFFF7E0D7D69F8A8D6E585ACCB7B6E2CBCFE2CBCFCCB7B66E585AAF
          9A9DE0D7D6FFF7FFFFF6F7F8EDEFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7
          F7F7FFFFFFF7F7F7FFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFF6F7FFF6F7FFFFFF
          F7F7F7F7F7F7F7F7F7FFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFF7FFFFF7F7F7FFFFFFFFFFFFF8EDEFFF
          FFFFFFFFFFFFF6F7EFE5E5FFFFFFFFFFFFEFE5E5FFF6F7FFF6F7FFFFFFF7F7F7
          FFFFFFFFFFFFF7F7F7F7F7F7F7FFFFEEF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF7F7FFFF
          FFFFFFFFEEF7F7F7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FF
          FFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFF
          F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FF
          FFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFF
          F7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
        mmHeight = 10583
        mmLeft = 60061
        mmTop = 9525
        mmWidth = 42598
        BandType = 9
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5292
        mmTop = 56356
        mmWidth = 196850
        BandType = 9
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5292
        mmTop = 80169
        mmWidth = 196586
        BandType = 9
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5027
        mmTop = 99484
        mmWidth = 196850
        BandType = 9
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5292
        mmTop = 126471
        mmWidth = 196586
        BandType = 9
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123296
        mmTop = 243417
        mmWidth = 78581
        BandType = 9
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123296
        mmTop = 250032
        mmWidth = 78581
        BandType = 9
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123296
        mmTop = 263261
        mmWidth = 78581
        BandType = 9
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123296
        mmTop = 256646
        mmWidth = 78581
        BandType = 9
      end
      object ppLine12: TppLine
        UserName = 'Line101'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123296
        mmTop = 276490
        mmWidth = 78581
        BandType = 9
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123296
        mmTop = 269876
        mmWidth = 78581
        BandType = 9
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123296
        mmTop = 283105
        mmWidth = 78846
        BandType = 9
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 160867
        mmLeft = 201877
        mmTop = 122238
        mmWidth = 2381
        BandType = 9
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123561
        mmTop = 45773
        mmWidth = 78317
        BandType = 9
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123561
        mmTop = 32808
        mmWidth = 78581
        BandType = 9
      end
      object ppLine19: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12171
        mmLeft = 123561
        mmTop = 32808
        mmWidth = 1323
        BandType = 9
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12171
        mmLeft = 201877
        mmTop = 32808
        mmWidth = 1058
        BandType = 9
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5027
        mmTop = 229659
        mmWidth = 196850
        BandType = 9
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5027
        mmTop = 122238
        mmWidth = 196850
        BandType = 9
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5292
        mmTop = 52652
        mmWidth = 196850
        BandType = 9
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 5292
        mmTop = 75406
        mmWidth = 196850
        BandType = 9
      end
      object ppLine27: TppLine
        UserName = 'Line27'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 23019
        mmLeft = 5027
        mmTop = 52652
        mmWidth = 2381
        BandType = 9
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 107421
        mmLeft = 5027
        mmTop = 122238
        mmWidth = 2381
        BandType = 9
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'OBSERVA'#199#213'ES:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4106
        mmLeft = 5821
        mmTop = 230982
        mmWidth = 27771
        BandType = 9
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 123561
        mmTop = 44979
        mmWidth = 78581
        BandType = 9
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123561
        mmTop = 51858
        mmWidth = 78581
        BandType = 9
      end
      object ppLine29: TppLine
        UserName = 'Line201'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 22754
        mmLeft = 201877
        mmTop = 52652
        mmWidth = 1058
        BandType = 9
      end
      object ppLine22: TppLine
        UserName = 'Line202'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 201877
        mmTop = 45773
        mmWidth = 1058
        BandType = 9
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 123561
        mmTop = 45773
        mmWidth = 1058
        BandType = 9
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'DADOS DO CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5556
        mmTop = 52917
        mmWidth = 39158
        BandType = 9
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'DADOS DO PROCESSO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5556
        mmTop = 76465
        mmWidth = 41010
        BandType = 9
      end
      object ppLine31: TppLine
        UserName = 'Line31'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 52917
        mmLeft = 5027
        mmTop = 230453
        mmWidth = 2117
        BandType = 9
      end
      object ppLine32: TppLine
        UserName = 'Line32'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5292
        mmTop = 230453
        mmWidth = 117211
        BandType = 9
      end
      object ppLine33: TppLine
        UserName = 'Line33'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 52917
        mmLeft = 122238
        mmTop = 230453
        mmWidth = 529
        BandType = 9
      end
      object ppLine34: TppLine
        UserName = 'Line34'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5292
        mmTop = 283105
        mmWidth = 117211
        BandType = 9
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 23019
        mmLeft = 123561
        mmTop = 8996
        mmWidth = 1588
        BandType = 9
      end
      object ppLine36: TppLine
        UserName = 'Line203'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 23019
        mmLeft = 201877
        mmTop = 8996
        mmWidth = 1058
        BandType = 9
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123561
        mmTop = 32015
        mmWidth = 78581
        BandType = 9
      end
      object ppLine38: TppLine
        UserName = 'Line38'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 123561
        mmTop = 8996
        mmWidth = 78581
        BandType = 9
      end
      object ppLine39: TppLine
        UserName = 'Line39'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5027
        mmTop = 8996
        mmWidth = 117740
        BandType = 9
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 5027
        mmTop = 44979
        mmWidth = 118004
        BandType = 9
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 35983
        mmLeft = 5027
        mmTop = 8996
        mmWidth = 2381
        BandType = 9
      end
      object ppLine42: TppLine
        UserName = 'Line42'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 35983
        mmLeft = 122767
        mmTop = 8996
        mmWidth = 794
        BandType = 9
      end
      object ppLine43: TppLine
        UserName = 'Line43'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5027
        mmTop = 76200
        mmWidth = 196850
        BandType = 9
      end
      object ppLine44: TppLine
        UserName = 'Line44'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5027
        mmTop = 121444
        mmWidth = 197115
        BandType = 9
      end
      object ppLine45: TppLine
        UserName = 'Line45'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 45244
        mmLeft = 5027
        mmTop = 76200
        mmWidth = 2381
        BandType = 9
      end
      object ppLine46: TppLine
        UserName = 'Line46'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 45244
        mmLeft = 201877
        mmTop = 76200
        mmWidth = 2381
        BandType = 9
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'INDAI'#193' LOG'#205'STICA INTERNACIONAL LTDA.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 28840
        mmWidth = 97367
        BandType = 9
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'NATUREZA DA OPERA'#199#195'O: PRESTA'#199#195'O DE SERVI'#199'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4106
        mmLeft = 5027
        mmTop = 47096
        mmWidth = 115888
        BandType = 9
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'NOTA FISCAL FATURA DE PRESTA'#199#195'O DE SERVI'#199'O DE LOG'#205'STICA/DESPACHO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 10583
        mmLeft = 124090
        mmTop = 10319
        mmWidth = 77258
        BandType = 9
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 174096
        mmTop = 24077
        mmWidth = 5027
        BandType = 9
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'RAZ'#195'O SOCIAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 57679
        mmWidth = 26988
        BandType = 9
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'ENDERE'#199'O:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 61913
        mmWidth = 26988
        BandType = 9
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'MUNIC'#205'PIO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 66411
        mmWidth = 26988
        BandType = 9
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'C.N.P.J.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 70908
        mmWidth = 26988
        BandType = 9
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'C'#211'DIGO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 147902
        mmTop = 57679
        mmWidth = 15346
        BandType = 9
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'BAIRRO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 114565
        mmTop = 66411
        mmWidth = 14817
        BandType = 9
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 147638
        mmTop = 70908
        mmWidth = 6615
        BandType = 9
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'INSCR. EST:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 100806
        mmTop = 70908
        mmWidth = 19579
        BandType = 9
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 170657
        mmTop = 70908
        mmWidth = 8996
        BandType = 9
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = #193'REA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 81492
        mmWidth = 26988
        BandType = 9
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 'S/REFER'#202'NCIA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 85725
        mmWidth = 26988
        BandType = 9
      end
      object ppLabel22: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = 'ANALISTA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 122502
        mmTop = 81492
        mmWidth = 17463
        BandType = 9
      end
      object ppLabel24: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'NATUREZA DO DESPACHO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 100277
        mmWidth = 43127
        BandType = 9
      end
      object ppLabel25: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 'VE'#205'CULOS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 104511
        mmWidth = 26988
        BandType = 9
      end
      object ppLabel26: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = 'VOLUMES:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 108744
        mmWidth = 26988
        BandType = 9
      end
      object ppLabel27: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'VALOR FOB:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 112977
        mmWidth = 26988
        BandType = 9
      end
      object ppLabel28: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'N'#186' DA/DI/RE/DT:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3344
        mmLeft = 6615
        mmTop = 117211
        mmWidth = 26988
        BandType = 9
      end
      object ppLabel29: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'DESTINO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 147638
        mmTop = 104511
        mmWidth = 22754
        BandType = 9
      end
      object ppLabel30: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'PESO L'#205'QUIDO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 147638
        mmTop = 108744
        mmWidth = 22754
        BandType = 9
      end
      object ppLabel31: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = 'MODAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 82286
        mmTop = 100277
        mmWidth = 20108
        BandType = 9
      end
      object ppLabel32: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Caption = 'ORIGEM:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 82286
        mmTop = 104511
        mmWidth = 20108
        BandType = 9
      end
      object ppLabel33: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = 'PESO BRUTO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 82286
        mmTop = 108744
        mmWidth = 20108
        BandType = 9
      end
      object ppLabel34: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = 'VALOR CIF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 82286
        mmTop = 112977
        mmWidth = 20108
        BandType = 9
      end
      object ppLabel35: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 'DESCRI'#199#195'O DA DESPESA OU DO SERVI'#199'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 5556
        mmTop = 122767
        mmWidth = 75671
        BandType = 9
      end
      object ppLabel36: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Caption = 'CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 82286
        mmTop = 122767
        mmWidth = 40746
        BandType = 9
      end
      object ppLabel37: TppLabel
        UserName = 'Label36'
        AutoSize = False
        Caption = 'INDAI'#193
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 123561
        mmTop = 122767
        mmWidth = 41010
        BandType = 9
      end
      object ppLabel38: TppLabel
        UserName = 'Label37'
        AutoSize = False
        Caption = 'VALOR DOS SERVI'#199'OS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 122767
        mmWidth = 35454
        BandType = 9
      end
      object ppLabel39: TppLabel
        UserName = 'Label38'
        AutoSize = False
        Caption = '3) COMISS'#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 245005
        mmWidth = 41010
        BandType = 9
      end
      object ppLabel40: TppLabel
        UserName = 'Label39'
        AutoSize = False
        Caption = 'TOTAL GERAL (1+2+3)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3725
        mmLeft = 123825
        mmTop = 251355
        mmWidth = 41010
        BandType = 9
      end
      object ppLabel41: TppLabel
        UserName = 'Label40'
        AutoSize = False
        Caption = 'VALOR TRIBUT'#193'VEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 257969
        mmWidth = 41010
        BandType = 9
      end
      object ppLabel42: TppLabel
        UserName = 'Label401'
        AutoSize = False
        Caption = 'ISS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 264848
        mmWidth = 41010
        BandType = 9
      end
      object ppLabel43: TppLabel
        UserName = 'Label42'
        AutoSize = False
        Caption = 'IRRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 271463
        mmWidth = 41010
        BandType = 9
      end
      object ppLabel44: TppLabel
        UserName = 'Label43'
        AutoSize = False
        Caption = 'COFINS / PIS / CSLL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 278078
        mmWidth = 41010
        BandType = 9
      end
      object ppLabel45: TppLabel
        UserName = 'Label44'
        AutoSize = False
        Caption = 'www.myindaia.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 5027
        mmTop = 283634
        mmWidth = 117475
        BandType = 9
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 167482
        mmTop = 237596
        mmWidth = 3704
        BandType = 9
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 124619
        mmTop = 237596
        mmWidth = 3704
        BandType = 9
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 167482
        mmTop = 245005
        mmWidth = 3704
        BandType = 9
      end
      object ppLabel51: TppLabel
        UserName = 'Label501'
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 167482
        mmTop = 251355
        mmWidth = 3704
        BandType = 9
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 167482
        mmTop = 257969
        mmWidth = 3704
        BandType = 9
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 167482
        mmTop = 264848
        mmWidth = 3704
        BandType = 9
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 167482
        mmTop = 271463
        mmWidth = 3704
        BandType = 9
      end
      object ppLabel55: TppLabel
        UserName = 'Label55'
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 167482
        mmTop = 278078
        mmWidth = 3704
        BandType = 9
      end
      object ppDBText56: TppDBText
        UserName = 'DBText48'
        DataField = 'PREVIEW'
        DataPipeline = BDENF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'BDENF'
        mmHeight = 4498
        mmLeft = 124354
        mmTop = 18785
        mmWidth = 77258
        BandType = 9
      end
      object ppImage5: TppImage
        UserName = 'Image5'
        AutoSize = True
        MaintainAspectRatio = False
        Picture.Data = {
          07544269746D61708E180000424D8E1800000000000036000000280000003200
          0000290000000100180000000000581800000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFEFFFFFEFFFFFE
          FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFF
          FEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFF
          FFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFE
          FFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFF0D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62
          F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D
          62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F2
          0D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62
          F20D62F2FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF0D62F20D62F20D62
          F20C62F10D63F10D63F10D63F10D63F10D63F10D63F10D63F10D63F10D63F10D
          63F10D63F10D63F10D63F10D63F10D63F10D63F10D63F10D63F10D63F10D63F1
          0D63F10D63F10D63F10D63F10D63F10D63F10D63F10D63F10D63F10D63F10D63
          F10D63F10D63F10D63F10D63F10D63F10D63F10C62F10A60F00D62F20D62F2FF
          FFFFFFFFFFFFFFFF0000FFFFFF0D62F20D62F20D62F02170F22170F32170F321
          70F32170F32170F32170F32170F32170F32170F32170F32170F32170F32170F3
          2170F32170F32170F32170F32170F32170F32170F32170F32170F32170F32170
          F32170F32170F32170F32170F32170F32170F32170F32170F32170F32170F321
          70F32170F32170F32170F32170F3206FF20E64F10D62F20D62F2FFFFFFFFFFFF
          0000FFFFFE0D62F2085FEF2171F32170F32170F3206FF2216FF2216FF22170F2
          2170F22170F22170F22170F22170F22170F22170F22170F22170F22170F22170
          F32170F32170F2216FF2206FF2206FF2206FF2206FF2206FF2206FF2206FF220
          6FF2206FF2206FF2206FF2206FF2206FF2206FF2206FF2206FF2206FF2206FF2
          206FF22170F22170F32271F30961F10D62F20D62F2FFFFFF0000FCFDFE0D62F2
          0E64F12270F32170F3216FF2206FF3216FF3206EF0206FF0206FF0206EF0206E
          F0206EF0206EF0206EF0206EF0206EF0206EF0206EF0206FF1206FF1206EF021
          6EF12070F32070F42070F42070F32172F62172F82172F82172F82173FA2274FC
          2274FC2274FC2274FC2275FD2277FF2277FF2277FF2277FF2174FB206FF02170
          F32170F31B6AF2216FF10D62F2FFFFFF0000FCFDFF0D62F20F65F22170F32170
          F22070F52175FF2177FF2480FF237CFF237BFF247DFF247DFF247DFF247DFF24
          7DFF247DFF247DFF247DFF237DFF2379FF2379FF247EFF2480FF2177FF2074FF
          2073FF1D71FF1C69FA1A67F31B67F41A67F8185EE91557DB1659DD1659DD1658
          DF1350D3124AC2124CC4124BC4124CC11C62D12172FC206FF12170F31D6DF314
          67F20D62F2FFFFFF0000FCFDFF0D62F20F64F22170F22170F52170F300000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000247EFF206FF12170F31C6CF3176AF20D62F2FFFFFF
          0000FFFFFE0D62F20D62F22170F22172F81A63E00000004B91044B920D498F06
          498D05438002417D01407C003978003E7B00427D033A79003B79003876003572
          003A74003C79003D7D03428F0450A30F4B9B0B48980B4D9C114B9A1148990D49
          970D43920B408F0843920D4D98184D97194A92184A931A4A931A4C971B488B06
          000000237CFF206FF02170F31C6CF3176AF20D62F2FFFFFF0000FFFFFE0D62F2
          0D62F22170F22173F81A61DD000000468A1144891C44881C45891C478B1D468C
          1B498D207EAF60468C1C2F7C006AA2465999397AAD60FFFFFF4F91265F9D3C48
          8D1D7AAA5B528F2D60973D5D95384C8B2544861B5892414788228BB272FFFFFF
          6FA35142861842841844861B44861B43861B478B1C417E05000000227CFF216F
          F22170F31C6CF3176AF20D62F2FFFFFF0000FFFFFE0D62F20D62F22170F22173
          F91960DA00000045871144881B44871B44871B44871B41841747871FFFFFFFB8
          D2A993B97CFFFFFFA4C58FFFFFFF99BD8DFFFFFFFFFFFFC3D7B3FFFFFF5A9537
          FFFFFFFFFFFF639B40C3D7B5FFFFFFA2C399FFFFFFFFFFFFD9E6D3377F0A4286
          1745881B45881B44871B478C1C417E05000000237CFF216FF22170F31C6CF317
          6AF20D62F2FFFFFF0000FFFFFE0D62F20D62F22170F22173FA185ED000000046
          891245871B45881B45881B45881B44871A377E0AA1C28CFFFFFFFFFFFFFFFFFF
          81AE61FFFFFFFFFFFF6BA159FFFFFFFFFFFFCFE0C2367F0AFFFFFFFFFFFFB6D0
          A5FFFFFFFFFFFFFFFFFF508E29408514FFFFFF3D821441861645881B45881B44
          871B468B1C428006000000227BFF216FF22170F31C6CF3176AF20D62F2FFFFFF
          0000FFFFFE0D62F20D62F22170F22173FA195FD0000000488E1445861B45881B
          45881B45881B45881B3D82114D8D26FFFFFF89B175FFFFFF6EA15FFFFFFF5693
          33FFFFFFFFFFFF4F8D36FFFFFF6DA044FFFFFFFFFFFFFFFFFF297601FFFFFFFF
          FFFF95BA7F5B9535FFFFFF337B0644871A45881B45881B45871B45881B488E0A
          000000227AFF216FF02170F31C6CF3176AF20D62F2FFFFFF0000FFFFFE0D62F2
          0D62F22170F22174FF0F52C800000048901445871B45881B45881B45881B4588
          1B44871A307A00B9D2B0FFFFFF72A55772A44EFFFFFFFFFFFF75A656FFFFFFFF
          FFFFB7D0A7408414FFFFFFFFFFFF57943447881CFFFFFF5E983BFFFFFFFFFFFF
          5894343A810E46881C45881B45881B45881B45881B498F0E000000237DFF216F
          F02170F31C6CF3176AF20D62F2FFFFFF0000FFFFFE0D62F20D62F12271F41D6C
          F136549500000041861345891B44871A40851544871945881B45881C337D055D
          973699BC80387F143D83103A7F0D3C810F2C77002F7A0138800E327B033B8110
          3B800E357D083A800D377F0A2C7800367E09337B053B811039800D4287184286
          1739800C42851845881B45881B4A900F0000002480FF216FF12170F31C6CF317
          6AF20D62F2FFFFFF0000FFFFFE0D62F20D62F02273F81662E20000000000002B
          531946901941841645881C45861A44871A377F0B46881C3C82102D780047881C
          3D8312357D06387E0A4E8E27649B43377E0A3F8313408516377E0A4084142874
          00FFFFFF6EA24C357E08428417317B033B8210418518387E0B71A351367E0A3C
          8211468A1D4290070000000E66FD2172FA216FF11C6CF3176AF20D62F2FFFFFF
          0000FFFFFE0D62F20D62F02477FF000000000000B4ACB6000000000000538E2D
          FFFFFF53902D347E0679A85BFFFFFFF9FBF944861BFFFFFF418417FFFFFF6D9F
          4DFFFFFFFFFFFFD7E5CF8AB371C3D8B545861BA7C69398BE7CFFFFFFFFFFFFBF
          D5ADDEE9D652902C96BB80A7C694FFFFFFFFFFFFFFFFFF4A8A213A840A4A6B36
          000000606D841A67E12171F71C6CF2176AF20D62F2FFFFFF0000FFFFFE0D62F2
          0D62F02479FF000000605440ABA8AF2B2B33000000538F2BFFFFFF689D4B347C
          0DFFFFFF478924FFFFFF6B9E47FFFFFFFFFFFFFFFFFF7FAB61FFFFFF45871FFF
          FFFF85B16BFFFFFFFFFFFFFFFFFFFFFFFF519028357C13689E47FFFFFFFFFFFF
          FFFFFFFFFFFFAAC8940B6300FFFFFF81AF66327E02000000786F75000000185D
          C62073FA1C6CF2176AF20D62F2FFFFFF0000FFFFFE0D62F20D62F0237BFF0000
          008476649391964E5C46000000518F2BFFFFFFFFFFFF498A27FFFFFF5B9645FF
          FFFF6B9F47FFFFFFFFFFFFFFFFFF76A758FFFFFF42861BFFFFFF71A351AFCC9E
          A5C59186B16CFFFFFF5593322B7812639B406DA24DD1E0CC80AD68FFFFFFB1CC
          9E086100FFFFFF8DB57A347F04000000A29CA3817A6D0000001E72FD1C6CF117
          6AF20D62F2FFFFFF0000FFFFFE0D62F20D62F02277FF0000006A635C675F6C00
          00000000004F8E28FFFFFF73A4544A8C20FFFFFF60984EFFFFFF86AF69FFFFFF
          589434FFFFFF97BC80FFFFFFFFFFFFC6DAB93C8210659B43FFFFFF86B16A74A5
          5DFFFFFFFFFFFF97BC7E206F00FFFFFFB5D0A7418516FFFFFFFFFFFFB6CFA744
          871D3F8A0E000000B7B3BC8F86740000001E73FF1C6CF1176AF20D62F2FFFFFF
          0000FFFFFE0D62F20D62F2206FF12279FF00000000000042891C408513599434
          FFFFFFFFFFFFFFFFFF3F84143A810E518F2A4C8C243F8313367D084A89235390
          2D508E274E8E27357E093F84134386175B97343F84152D78006CA15E70A44C37
          7E0A3B800EFFFFFFFFFFFF327B0457943379A858347D063F83144B931E000000
          4A3C4D7F6F560000001D6FFB1C6DF3176AF20D62F2FFFFFF0000FFFFFE0D62F2
          0D62F22170F12173FD195BC7000000498D1545881C3E8414307A032E7800357D
          063F841444871940831440851542851846871C4085163E83123D83123E841446
          8C1C488B15000000367003468B1746891C387F0838800C4387194085164E8D27
          4F8E2845881D3A8210377F0A44871A45881B46891A4388160000000000002172
          F72070F51C6CF2176AF20D62F2FFFFFF0000FFFFFE0D62F20D63F2216FF12173
          FF144BAD000000488D1845881B44881A44871A44871A44871A45881B45881B45
          881B45881B45881B44871B45871B45891C49901D4A8D1000000000000021715E
          000000396602488E1944871C45871B45881B44871A3E84133F84134487194588
          1B45881B45881B45881B438519509F19000000125FEB2176FD216FF11C6CF317
          6AF20D62F2FFFFFF0000FFFFFE0D62F20D63F2226FF12074FF1246A000000048
          8E1B45881B45881B45881B45881B45881B45881B45881B44871B45881B43861B
          468A1C49901A49890B000000000000258D8732D4D038F3FE33E5F5000000375D
          004B951C44871B45881B45881B45881B45881B45881B45881B45881B45881B45
          881B4385194E99160000001964F02172F92170F21C6CF3176AF20D62F2FFFFFF
          0000FFFFFE0D62F20D63F2226FF12175FF103F98000000488E1B45871B45881B
          45881B45881B44871B44871B45871B458A1B468919498C134378000000000000
          0015A9B91FE1FB21E7FA1EDEED20DDED30FBFF37FFFF0000003555004A8F1644
          871B45871B45881B45881B45881B45881B45881B45881B45881B4386194D9616
          0000001862F02173F92170F21C6CF3176AF20D62F2FFFFFF0000FFFFFE0D62F2
          0D63F2226FF12175FF103C91000000488F1B44871B45871B45881B44871B4487
          1B478C1C478A14427A083B6E0C0000000000001EBED300000000000000000000
          00000000000000000000000000002EFFFF00000032600D48881044881B44871B
          44871B44871B44871B44871B44871B45871B4385194C9817000000185FE72173
          FA2170F21C6CF3176AF20D62F2FFFFFF0000FFFFFE0D62F20D63F2226FF12073
          FF10387800000048901D45881B45881B44871B44861B46891A3C720E2C590F00
          000000000030E1F62EFCFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE6D6DA0000001FDAE1000000305D0F48890E468A1C468A1C468A1C468A
          1C468A1C468A1C478D1C478C1C51A11B000000185BD92276FD2170F21C6CF317
          6AF20D62F2FFFFFF0000FFFFFE0D62F20D63F2226FF12175FF143E780000004B
          9417498F174992164C95194E9D1C43841300000000000036EDFA39F7FF38FBFF
          000000000000FFFFFF000000000000000000000000000000000000F6F6F5FFEE
          EE00000039FFFF00000029530E48890D4485064483054483054584054483043D
          77033C7202458401000000124CB82276FF216FF21C6CF3176AF20D62F2FFFFFF
          0000FFFFFE0D62F20D62F12273F92170F32170F3000000070E000C1700132600
          172B001421001D2E000B0D000000003CFAF53BF5FE2AE5EE000000EFE3E2D2D2
          D2000000FFFFFFF6F6F6F6F6F6F9F9F9C3C3C3000000FFFFFF0000001FD1DB3D
          FFFF000000000000000000000000000000000000000000000000000000000000
          0000000E36782173FD2170F31C6CF3176AF20D62F2FFFFFF0000FFFFFE0D62F2
          0D62F12170F22071F7247DFF2380FF227CFF2179FF2077FF1E75FF1E76FF1E76
          FF2178FF113AAB00000035DFDF37FFFF000000D2D0D2FFFFFFC6C6C6FFFFFFFF
          FFFFFFFFFFFFFFFFFCFCFCEDEDEDFFFFFF0000001FD3DC3AF0FA3FFFFF000000
          124099237BFF237CFF227AFF227AFF227CFF237CFF247DFF237CFF2071F92170
          F52170F21C6CF3176AF20D62F2FFFFFF0000FFFFFE0D62F20D62F22170F22170
          F2216FF4216FF3216FF3216FF32170F32170F42170F42170F42170F6247CFF19
          53D300000034DED021EAEF000000FFFFFFFFFFFFE0E0E0000000F4F4F4000000
          FFFFFFFFFFFFE8D6D500000038FDFF37EAF336E7F13CFFFF0000001651AA2070
          F7216FF2216FF1216FF1216FF1206FF12170F42170F4216FF22170F31C6CF317
          6AF20D62F2FFFFFF0000FFFFFE0D62F20D62F22170F32170F32170F22170F221
          70F22170F22170F22170F22170F22170F2216FF2206FF12275FF1D62DC000000
          28C3BE27BEC2000000FFFFFFE5E6E6000000F8F8F8000000FFFFFFBCB2B20000
          0024CCD53AF7FF37EBF53BFCFF3CFFFE2EC6B90000001C63E22171F62170F221
          70F32170F32170F3216FF2216FF22170F32170F31C6CF3176AF20D62F2FFFFFF
          0000FFFFFE0D62F20D62F22170F32170F32170F32170F32170F32170F32170F3
          2170F32170F32170F32170F32170F3206EF12275FD1C60E300000023C1BA1EB7
          BA000000FFFFFFFFFFFFFFFFFFFFFFFFAF95930000001B9DA53FFFFF3BFAFE3C
          FFF729B7A60000000000001958CF216FF42170F32170F22170F32170F32170F3
          2170F32170F32170F32170F31C6CF3176AF20D62F2FFFFFF0000FFFFFE0D62F2
          0D62F22170F32170F32170F32170F32170F32170F32170F32170F32170F32170
          F32170F32170F32170F3206EF12174FA2173FF00000023A2A910C9C900000000
          000000000000000000000031F5F83DFFFF31D1D428ACBB0000000000002069FF
          2274FF2174FB2170F32170F22170F32170F32170F32170F32170F32170F32170
          F32170F31C6CF31769F10D62F2FFFFFF0000FFFFFE0D62F20D62F22170F32170
          F32170F32170F32170F32170F32170F32170F32170F32170F32170F32170F321
          70F32170F3206EF12273F82172FF000000208A9331E9E02CDFE02FECF23FFFFF
          38F0E727A6AD1B7195000000000000216FFF2276FF2170F3216FF1216EF12170
          F32170F32170F32170F32170F32170F32170F32170F32170F32170F3186AF328
          74F20D62F2FFFFFF0000FFFFFE0D62F20C62F12170F32170F32170F32170F321
          70F32170F32170F32170F32170F32170F32170F32170F32170F32170F32170F3
          206FF22170F52376FF000000165C832BB3A531D4C11C78831556940000000000
          00206FFC2273FB2170F3216FF1216FF22170F32170F32170F32170F32170F321
          70F32170F32170F32170F32170F32170F32170F31367F10D62F20D62F2FFFFFF
          0000FFFFFF0D62F20960EF216FF32170F32170F32170F32170F32170F32170F3
          2170F32170F32170F32170F32170F32170F32170F32170F32170F3216FF22170
          F12173FD0000000F35820D30700000000000002171FC2171F62170F3206FF221
          70F22170F32170F32170F32170F32170F32170F32170F32170F32170F32170F3
          2170F32170F32170F32270F30E63F20D62F20D62F2FFFFFF0000FFFFFFFFFFFF
          327AF20B61F0206FF32170F22170F32170F32170F32170F32170F32170F32170
          F32170F32170F32170F32170F32170F32170F32170F32170F32170F12170F500
          00000000002172F62170F32170F12170F32170F32170F32170F32170F32170F3
          2170F32170F32170F32170F32170F32170F32170F32170F32170F32170F31F6F
          F21667F00D62F20D62F2FFFFFFFFFFFF0000FFFFFFFFFFFFBAD2F92E78F10A61
          F00D62F00D63F10D63F10D63F10D63F10D63F10D63F10D63F10D63F10D63F10D
          63F10D63F10D63F10D63F10D63F10D63F10D63F10D63F10D62EF0D62EF0D63F0
          0D63F10D63F10D63F10D63F10D63F10D63F10D63F10D63F10D63F10D63F10D63
          F10D63F10D63F10D63F10D63F10D63F10D63F10C63F10E63F00D62F20D62F2FF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF0D62F20D62F20D62F20D
          62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F2
          0D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62
          F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D62F20D
          62F20D62F20D62F20D62F20D62F20D62F20D62F2FFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFEFFFFFE
          FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFF
          FEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFF
          FFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFE
          FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        mmHeight = 10848
        mmLeft = 105304
        mmTop = 24342
        mmWidth = 13229
        BandType = 9
      end
      object ppImage4: TppImage
        UserName = 'Image4'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0A544A504547496D616765B0740000FFD8FFE000104A46494600010101012C01
          2C0000FFDB0043000302020302020303030304030304050805050404050A0707
          06080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F17
          1816141812141514FFDB00430103040405040509050509140D0B0D1414141414
          1414141414141414141414141414141414141414141414141414141414141414
          14141414141414141414141414FFC000110801CF01CF03012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FD4D
          A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
          A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
          A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
          A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
          A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
          A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
          A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
          A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
          A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
          A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
          A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
          A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
          A28A2800A28A6BBAC48CECC1100C924E001400EA2BCD7C5BFB46FC39F05974D4
          3C55652CEB9060B16374E0FA11186DA7FDEC57907893F6FCF0E59174D0BC37A9
          6A6C380F792A5B21F718DE71F80FC295C0FAA68AF82B5DFDBCBC737E5974DD2B
          47D2A33D18C524D20FC59829FF00BE6B84D57F6ACF8A5AB961278AE6B743FC16
          96F0C38FC5501FCCD2E643B1FA61457E58B7C4CF895E23276F89FC4F7C18FDC8
          6F6765CFD14E2A9EAFFF0009FD9589BFD53FE124B7B2DC17ED579F6858F71E83
          73719E3A5170B1FAB5457E51683A178EFC5368F7BA2E9FE22D5EDA390C6F7161
          0CF3A23800ED2C80E0E194E0F3C8A9F518BE22784EDFED37E9E27D1A0071E75C
          0B88141F4CB639A2E163F55A8AFCABD3BE31FC42B0567B5F18F880471FDE1FDA
          133A2FD416207E35D4E91FB5A7C53D20803C4ED7718FE0BBB5864CFE25377E46
          8E61D8FD2BA2BE12D07F6F7F1859155D5B42D23538C75307996EE7F1DCC3F25A
          F51F0CFEDEBE10D48AC7AD68BAA68D237578B6DCC4BF5236B7E4A69DD0AC7D39
          4570DE10F8DFE04F1D98D345F1469F733BF0B6D249E4CC7FED9C9B5BF4AEE698
          828A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A2BCC3E2AFED11E0EF8491BC3A9DF7DB356C6
          574AB2C4939E38DDCE107FBC467B03401E9F5E7FF10FE3BF827E182BA6B9ADC2
          B7CA3234FB5FDF5C93DBE45FBBF56C0F7AF8A7E28FED81E36F88065B5D366FF8
          45F496C81069EE7CE71FEDCDC37E0BB41F435E61E00F02EABF147C616BA06972
          C0352BC2CCAF7936C53B54B3127924E01380093E9537EC3B1F45F8FBF6F6D5AF
          8C96FE10D0E1D361390B7BA91F3A623B111AFCAA7EA585782EBDF103C7BF1735
          15B4BED5356F10DC4CDF25841B9909FF006618C6D07E82BD6FE277EC63AAFC3C
          F86D3F8860D5D75BD42C8896F6D2080AA470E0EE7424E58A9C12481F2E4E0639
          F54FD87357B0D3BE10F892EAE238A27B0D42596E2E0200FE47931BF27A900873
          834B56F519F13EB3A2DFF87B54B9D3752B496C6FAD9B64B6F3AED74381C11D8E
          08354ABEA2FDBBBC01FD91E35D2FC596D162DF5787ECF70CA3813C40004FBB46
          540FFAE66BE5DA97A0CFB425F867F0DBF66DF85DA3F883C5FE1D3E2BD6EFDA28
          A459409144AE85CAAA31D81542919209271EB81CA7ED53F0CFC0B0782341F1B7
          83A3B3D29AF444D269F032C62586542C9208B3F2B2F0085C0C373D2BBFFDA7D7
          FE138FD95FC35E21886EF24D86A0EC39C092231907FE052AFE22BE3CD0BE1F78
          9BC4FA5DD6A7A5683A85FE9B6AAEF35E436EC618C28DCD97E8081CE3AE3B5531
          23EDBF835E31BFF0CFEC6D0EBBA6AC32EA3A4D9DE488970A5A3252E242010082
          46DC7715F317C4CFDA3BC75F153C2D2697AD43671E90D2A4A4DAD9B200CA495F
          9C938FEB5F4AFEC9BE219B4DFD99755BD8224B89F4A96F9E389FEEBB2A09429F
          63B80E2BE77F8B3FB56F893E2DF8565F0FEA1A469365632CB1CA5EDD643282A7
          2304B918FC287B023DE7F634BC9345FD9E3C57A8C4409A0D42F2E10B0C8052D6
          123EA32B5D3FECDBF12F56F8EDF0F3C463C6B69697166929B469843E5C5346D1
          E5D5874C8041C8C70C3D33581FB256A9FF0008C7ECCDE20D63C95B8FB1CF7D79
          E539C2C9E5C2A707D8EDC56C782BC6B1FED3FF00057C476D6D15C7832E21325B
          48BA74C0A3131EF1CED1F2364865E0919E79A6B611F2A7C11F8F973F026F75CF
          B06916BACC1A9346AED712323058CBEDC119C67792720F415F61FC64F137817C
          09E06D1FC45E2DF03E9FAA9D4658A07B64B282596377899C9CB819DBB48CE472
          457E7B785B493AF789F48D3002C6F6F21B6C0EE5DC2E3F5AFAE7FE0A09AB795A
          6F82F4B438124B7370CA3B6D11AAFF00E86DF9525B0D9E5DE1BF0CF837E3EFED
          136B61E1FD1E7D0FC212DBB492DB46AB0C89B21259B0A5802642A38C8C7E55C9
          7C77F861A5FC3CF8AF2F84BC3735E6A015605C5DB2B4BE6C80304CAAA8C6193B
          679AF63FD803C37E7F897C55AF3A7FC7ADAC5651B11C1323976C7D3CA5CFD6B9
          FF0086B65FF0B7FF006C6BED51879F6369A95C6A45BAE2281B6C07FEFA10D007
          31E30FD8FBE25784C3C9169516BD6CA09F374997CC6C7A796DB5C9FA035CF786
          FE31FC4AF8457A2C60D5F53D38C380DA66A685D147A795283B7A632B83EF5F46
          7ED47F13BE28780FE21C177E178F53B1F0E5AD922C972B67E75A4D212CCC58B2
          95070557B1F94E2B80F829657BFB52FC729F5EF195ADBDE5869D603ED36F1215
          81BE5F2E34C6490492EFD7AAB74E947A01DAFC3FFDBDE194C56DE33D04C04E01
          BFD24965CFBC4E72077C8627DABE97F047C4BF0BFC47B2FB578735BB5D511402
          F1C4F8963FF7E33865FC40AFCE1F8FFA1F86FC37F1675BD1BC276CF6FA5D9482
          DCC66569479C07EF002D9380C4AE0E4E54F359FF00F0AFBE20782EDA1F10AE81
          AFE8B14204A9A8A5B4B098B8FBC5C01B463B9C5176163F5568AF847E15FEDC3E
          20F0E186CBC636DFF09169E30BF6D8408EED07A9E8B271D8ED3DF71AFB07E1F7
          C52F0C7C4FD33EDBE1CD561BE5503CC833B6687D9E33CAFD7A1EC4D527724EB6
          8A28A60145145001451450014514500145145001451450014514500145145001
          4514500145145001451450014514500145145001451450014514500145145001
          589E2EF1968BE03D166D5B5FD460D32C22EB2CCDCB1FEEA8EACDC741927D2BCE
          FE39FED21E1FF83366D6A4AEABE2491330E9913E366470F29FE05EF8EA7B0EA4
          7C07F103E25789FE2F78896FB5BBB92FAE5DB65B59C2A4451027848A31D39C0E
          E4F724D26EC3B1ED7F1A3F6D3D6FC56D3E97E0C12E81A49CAB5F1205E4E3D88F
          F543FDDCB7FB43915E01E15F0DEA3E3FF165868D67346DA9EA73F96925DCC114
          B9C9F998F7CFD493C004902BE93F81FF00B155E6B5F67D67C7C24D3EC4E1E3D1
          A362B712FF00D756FF009663FD91F37BA915E77FB4978D3C3B79E3FB2B3F08F8
          75FC2F2F86C9B2370AA20791E37CA9118FBA558310C7E63BB2718150EFD467AB
          0F82FF000CBF666D2ECB59F88B72FE29D767DCD6BA6C5093033AE32150F0C016
          0374842F23E506BE73FF0085831695F16078C7C3FA6FF63C116A42FE0D3D64DC
          B1AEF0C63CE07CA4161800000E074AFB7B46B2F0DFED77F06B43BAD704897369
          329BB6B3216586E5001228E0E15D483819E197B815F2E7C7AF883F0EB56D16C3
          C2BE03F0B0B1B6D32E0C9FDAEEBE5C929C1565C365D81C29DCE41CA81814D81F
          6F788FE21D8E97A6F86FC4124893784F5931DBDC4CE32B12CEA0C12B760993B1
          BFEBA29E8A6B8AF873F055BE1D6B5F12B40B48CFFC235AFDB25C69DDC4459664
          96127FD9DC98CF552BC920D70DFB335FDBFC68FD9D75FF0000EA3206B9B0492C
          D59F9291C997824FF80B86007611AD5CF80DFB4EE93A3F82AF342F887AA2E93A
          E7875CDA34970199EE51495000504B3A952A40049C29E4938A10C981FDA23F63
          FC9FF48D7B48839CF2FF006AB61CFF00C0A48FFF004657C2F5ED1F0EBF68FD47
          E0DDE78BE0F0EDA5BEA3A7EA978D35A7DB7704870CF87D83049652B9191F7457
          8EDDDC1BBBA9A7291C465767F2E25DAAB924E00EC39C63D2A18CFB07F67DF8A1
          E10F1EFC12BBF867E31D5EDF479E38A4B58A5BB95625961662D1B23B7CBBD18E
          36FA2AF5E717E4F15F80BF66FF00823E20F0AE95E2FB6F176B1A97DA1A34B364
          72259635886E08CC11542A9219B279C7515F1FE85E12D6FC512F97A368D7FAAB
          F4DB636AF360FF00C041C57A2E89FB297C52D702B2785A5B48CFF1DECF14247F
          C059B77E94EE0775FB37FED1BE14F84DF0EB57F0FF0088ECB53BE3797F24E23B
          1851D4C6F0C68549675C7DC3C547E28F8DDF06AE7C33ABE9FA1FC3016D797569
          35BDBDE4F0401E07642AB2039620A920E47391D6934DFD83FE205D80D73A8685
          620F557B995D87FDF3191FAD6F5BFF00C13F75E603CFF1669D11FF00A676D238
          FD48A350D0E2FE1E7ED2563E09F81FAD780E4D12E2E2E6FEDEF225BE49942234
          D19404AE3A0C827D6A7FD9C7F68DD1FE0D78635BD2355D26F6FC5FDC79CB2D9B
          202A360520EE23D33C576FFF000EF8D471FF0023A5AE7FEC1EDFFC72AA5D7FC1
          3F75F407ECFE2BD3653E92DBC883F4CD1A8687807C24D6B4BF0D7C4DF0CEAFAC
          C8D1699617D1DD4CE885D86C2181C0EBC81D2BD23F6B9F8AFA17C55F1A68B73E
          1CBE6BFD32D34E086430BC4565691CB2E1C03D0273D3DEB5753FD853E21D9026
          DAEF43D407658AE64563FF007DC607EB5C46BBFB2F7C50F0F8669FC25777283F
          8AC5D2E49F7023627F02334B503E89FD98EF2DFE1EFECBDE27F12A4D19BD6FB6
          5F6158175289E5C6A476CB21233FDEACFF00D843C350E91E1AF1678CEF888A36
          7168933F1B23897CC94FB825979FF62BE42D5345D57C3970D6FA9585E6993904
          18AEA16858FB6180E2BA6F0F7C66F18785BC237FE17D3B5978741BD864826B26
          8D1976C80872A48DCA48279045170DCF488FF6D3F8856D7DAB14B8B4BBB1BB92
          636F0DD5B00D6A8E4ED08C9B4E57231BB774AF6AFD9EACE1F81FFB33EB1E37BF
          8D56F7508DF510B2705D40D96D1E7D198E47FD75AF8834D8EDA5D46D52F65682
          CDA54134B1AEE644DDF3103B903271DEBEA2FDAA7E38F863C51F0E7C33E17F04
          EA11DD698CC249D2256430C50A858A2656008E493823F80534C2C45FB187C2EF
          F84E3C5DA978FB5E8FED7069F39FB3B4E3225BC6F99A43EA501079FE2753DABD
          07C2BFB526A7E3DFDA2E0F0D697269D0F8337CD6FE65C603DCEC46C48AE4F259
          C00AA072A7919C90BAD6A63E117EC53A6BE8DF2DCEA7A740BE7A75592E806958
          9F5019803D885F4AF90F50F853E2DD2BC1D63E2AB8D0EE9340BC4F322BE550C8
          1776D0CE072809E858004104139A3603B3FDABFC39A3F85FE36EB367A2431DAD
          BBC714F2DB4230914AE819801DB390D8E8377181C5799681AF6ABE18D4A2D534
          7BDB8D3AF606CA5CDB39465FC47638C60F047045753F0C7E177897E3778B3EC3
          A7F99311B5AF352BA62C96F1F40CEDDCF180B9C9C7A0247DE9F0D7E19F807C25
          A5EA7F0F74FB3835978A08A5D6A4B9896432BBE7CB129E818ED66541F740CF04
          8255AE173C83E0A7EDB96F7C60D27E2022DACE7089AD5BA62273FF004D507DD3
          FED28C7B0C66BEB2B3BDB7D4AD22BAB49E3B9B6994491CD0B064753D0823823D
          C57E5878DF40B3D53E2B6B5A378334E9A5B36D464B5D3ECE12D2B3856DA36E72
          4838279E83A9E2BA9F83DFB40F8ABE066ACFA7B2CB79A324A56EB44BC2CBE5B6
          7E6D99E637CE73D89EA0F043B858FD2EA2B8EF869F157C3DF163405D5740BC13
          28C2CF6B20DB35BB91F7645EDDF9E87B135D8D59214514500145145001451450
          0145145001451450014514500145145001451450014514500145145001451450
          0145145001451450015F327ED23FB595BF810DCF867C212C777E21E63B9BE187
          8AC8F751D9A4F63C2F7C9C818DFB52FED507446BAF06F832EFFE2623316A1AAC
          2DFF001EFEB1447FBFD8B0FBBD07CD92BF1D69FA06A7AD5A6A57B67653DDDBE9
          F10B8BC9A352CB0A160BB98F6E48F7EA7A0244B63B1B3E12F07F89FE3078B8D9
          69914FAC6B176CD34F3CCE4E067E692576E839EA7A9200C9201F5DF157ECB7E3
          EF823A75BF8DF4FD4ACAFA6D21D6EE53605FCCB7DA73BC0651BD077EF8ED8CE3
          D27F61D8AC750F86FE34D3F4EBB4D3FC573CCCA6E82832C51342161703B857F3
          0E3D7AF51555FF0065FF008C7E24D09BC39AFF008FAD24D056E0CFE5BDCCF72D
          237627720257BED2D807271DE90CF35F0CFED7DE318FE2AD9F8935DBD69F4724
          DBDC6916C0AC090311931A679752030624938C13838AF4AFDB0FE115A78A743B
          6F8A1E17D97713411B6A06DC644F0903CBB81EB81853EDB4F1B4D7917C66FD95
          FC4DF07F481AC3DCDBEB5A2865496E6D9595A024E01743D14920641233C1C646
          7D0BF649F8FDA6689A45FF0081BC6779043A1986596CEE2F587948A4132C0D9E
          0AB02CC0773B8739028BF461E8721FB1E7C5AFF857DF115746BE9F668BAF15B7
          7DC70B15C7FCB27F6049287FDE07B57B47C4DF007C15F85BE39D5BC5BE2D9CEA
          3A85ECBF6A83C35190E048402CDE50C64336E6CC84272460F15F1DF8ED74183C
          67AB7FC22B3CF36802E18D8C970BB1FCBCE47BE07201382400481920757F0DFE
          07F8E3E366A2F77636B2BDAC921371AD6A2CCB0939E7E73932367B2E4FAE3AD1
          E4033C55F19EFA4F1DF8835DF0524FE09B5D5D16296D74F9B692A31C82A06D24
          AE7E5C609233C9CE77827E11F8DBE2B5E3CDA2E8D79A9891C996FE6F921DC4F2
          5A57C027A9C6493E86BED4F85FFB1B782FC0CB0DDEB319F15EAAB825EF5316CA
          7FD9879047FBE5BF0AF7A8208AD6148A18D628900558E35C2A81D001D853B770
          B9F1DF81BF6047611CFE2FF1184E85ACF484C9FF00BFAE3AF6C043F5AF79F097
          ECD1F0DFC1811ACFC316B7970BFF002F1A90374E4FA8DF9553FEE815EA1453B0
          AE4505BC56B0AC50C490C4830A91A85551E800A968A298828A28A0028A28A002
          8A28A00ABA869B69AB5ABDB5F5A437B6EDF7A2B88C3A1FA82315E4FE31FD933E
          1AF8C048E7421A2DCBFF00CB7D21FC8C7D23E63FFC76BD8A8A00F87BC77FB05E
          BDA6892E3C29AD5BEB310C91697CBF679B1E81B9463EE768AF9CFC5BE04F1078
          0EFF00EC5E20D1EEF49B8C9DA2E622AAFEEADD187BA922BF5B6B3F5BD074EF12
          69D2D86AB636DA8D949F7EDEEA25911BEA08A9B0EE7E7C7C20FDA9350F87FE1D
          FF00845FC41A3DBF8B3C2DD12D2E480F12939DA3706565CF3B58707A11D2BD0B
          55F8A9A87ED71ACE9DF0FB418ADFC1DE1B189EF1AE274334E919042A20C6E0BC
          108B9E4024802BADF8A9FB0CE8DACACD7DE09BC3A25E7DEFECEBB6692D5CFA2B
          72E9FF008F0ED802BE44F19780BC4FF0B35D4B4D734EBAD1EF91B7C1367E57C1
          1F3C722F0DDB953C1EB834B5433F40340BCF01FC3AB79BE16F853C4365E1EF12
          9B73E53CC82590CEC301DC9C2BCBD0EC2738C718C0AC0D07C377BFB357C04F19
          6ABABDFC77FE239A4B9BC96FD5D9BCD9DC88A03B98027928C41E859BAF5AF805
          263A86A625BDBB9034F2EE9EEA42CEE327E673DD8F24FA9AFAE7F6BEF8A5A1EA
          7F09FC27A1F85F558F53D3EFE412B4D14A5DBCA8102AAC99E431675386C1CA74
          A77B8AC7CDFF00083C53E23F09FC44D22FBC2B02DE6BAF28821B79221209F7F0
          508EC0824641040C9C8AFB93E367ECEDA1FC62B1B5B8B8369E1EF1D4B6FB9678
          1C32CCCAA37A38C0322AE40DE006036F6F94F09FB347C23D3BE0C7826EFE25F8
          D7659DF35B196249C7CD656E47A7FCF5932063AE085EA48AF9AFE2AFC72D7BE2
          47C47FF84A22BBB8D2FEC6F8D2E28242AD6918271823F88F5623A938E8000B65
          A8CAE25F1A7ECE5F119915DF48D72CC8DCA1B7C37119E79ECE8D8CFF00830E3E
          F1F811FB4268BF1AF4711AEDD3FC456E80DDE9ACDF4FDE467F8933F8A9E0F627
          C13E1DFECDCDF107C2DAFF00C40F8B1AADCD9DCEA7035C413CAFE5BDBAE322E2
          41C00300058F8017B7231F30E9DAD5D783BC4E9A8E81A9CB15C594E5AD6FE253
          1B300701B69E8187F09CF0483919A360DCFD72A2BC5BF675FDA2AC3E33691F63
          BCF2EC7C556880DCDA03F2CEA31FBD887A67A8EAA7D4104FB4D5921451450014
          5145001451450014514500145145001451450014514500145145001451450014
          5145001451450015F307ED65FB499F055B4FE0EF0C5D635F9D317B7911E6CA32
          3EE29ED230E73D541C8E4823B9FDA5BE3BC3F06FC27E5593A4BE26D454A58C2D
          83E52F43330F45CF00F56E39C1C7E77DA58EAFE33D74C56B05DEB3ABDEC8D214
          895A69A6724966E3249CE493F89A96C69167C29E09D7FC7B7F3DA681A55D6AF7
          714467923B752C5547527F138C75278E4D7D3FFB196AF677565E30F85FE21D3C
          5ACF791BCC629E1F2A6950A88E589F201CA82A403C8058F6AF2EF87BF15BC7BF
          B305F4BA75DF8756DADAF584F2D9EAB64619250001949400C40E9CEE5049E324
          E7E8BF05FED47F0B3E22EB1A65FEBF649E1AF125A1CDBDDDFA8223241042DCAE
          30A412087DA0F70690D9F1DEB10F887E08FC47D52C6C351B9D2F57D2EE1EDC5D
          5B394674CF07DD5976B60E4104715EEBF0E74CF8E3F1D7C1BA96BB6BE3DB9B2B
          7B7CC5691C773E43DD4CB8DC998B6EC183D5BA9DBC60961D4FED8BF03AEFC5E2
          0F885E1844D4512D156FE2B53BDA58941297098FBE029C1C7F08523201C7CB7E
          02F8ABE2BF8653CF2F8675A9B4B338FDEC6AA9246E47009470573CF52323D68D
          981F6078BB5DD63E17FECB5A9E93F133548F52F13EA905C5959DBC9309A73BC6
          1773FF00198F25CBE481F28C938CFC47A1683A9789F56B6D3349B29F50BFB860
          B15BC09B9D8FF418E72780393C57A0F84FC25E3CFDA6FC6EC65BB9F53B850A2E
          B53BD6FDCDA4793E9C2F7C22E3273C63247DE9F07FE077873E0D68FF0067D2A0
          FB46A32A8175AA4EA0CD39F4FF006573D1471EB93CD1B86C78BFC13FD89EC345
          58356F1EF97A9EA030E9A446D9B788F6F3187FAC3EC3E5EA0EE15F535ADAC161
          6D15BDB431DBDBC4A11228942AA28E8001D07B54F4555AC48514514C028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002B1FC53E12D1BC6
          BA3CDA5EBBA741A9D84BF7A19D7201EC41EAADE841047AD6C51401F09FC71FD8
          C753F0A2DC6B3E09F3B5AD2572F269ADF35D403BEDC7FAC5F60370F46E4D7CEF
          E18D6FFE116F12E9DAABD85BEA26C6E1673677AA4C721520ED603191C74FD0F4
          AFD74AF9F7F681FD94B49F8A11DC6B5A02C3A478A7059881B60BD3E9201F75BF
          DB1FF02078221AEC3B9F337ED11FB4B5DFC6A8F4ED3AC6D66D2742B745965B47
          70CD2DC6392C47555C90BD33C9201200EDFF00652FD9BA3D77C9F1DF8C2058F4
          3B7CCD63677236ADC6DE7CE933D235C6403C31193F28F9BE6DD7341D53C19AFC
          FA6EAD62F63A959C9896DAE533820E7A1E1948C1CF208E79CD7B2FC56FDAC75B
          F891E01D37C3369631E85118826A6D68D85B9C70A918FE08F0012BCE4FCB9C0E
          55FB8CE87E3F7C69D63F680F16C3E04F02C33DE68A27D8AB0021B50954E77B1E
          D12F519C0E371ED8EAB47FD85F45D33C3D14DE2EF18B586A936157ECC634B78E
          43D13327321FA6DCFA77AED7C23A0F85FF0063CF84A35ED6A35BAF145F46AB36
          DC79B3CC46E16F19FE145C727BE09393B56BE6FB48BC77FB5EFC4C0279585B46
          417600FD934C809EC3B938C63EF311C9C0243F5030FE217C3EF157ECDBF10ED0
          8BB686E626FB4E9BAB5A8DAB328E3383D0F386439EB8E54827EE6FD9F7E3B587
          C6AF0BF9ADE5DAF882CC2ADFD883C03DA44F546C7D41E0F627C37F6E6D5B47D2
          FC2FE0DF084531BBD5AC48977C8E1A58E058FCB1BCFAB900FBEC27D2BE61F87D
          E3DD5BE1A78B2CB5FD1A7F2AEED9B946CEC990E3746E3BAB74C76E08C1008366
          1B9FACF45725F0C3E24695F15BC1D65E20D25F11CC36CD6ECC0BDBCA3EF46DEE
          3D7B820F422BADAB2428A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A002B9FF1DF8D74DF879E13D47C43AB4BE5D95944
          5C85C6E91BA2A2FAB312001EA6BA0AF80FF6CBF8D07C71E30FF84574C9F7689A
          24856628D959EEF1863EE132547BEE3C822937603C5FE23F8FF54F89DE31D43C
          43AB3E6E2E5BE48949290463EE46BECA38F73927926BEA8FD9F740B9F85FFB38
          EA5F10BC3BA2A7883C5DA8873142519CAC293F95B005F9881B5A421704E00CF0
          31F18D7B57C0BFDA8B5CF82F632E94D631EBBA13B9952CE498C4F0B9EA637C36
          01EA41046791824E613D4A3D03C61A2FC5EFDAC7FB204FE1A8FC33A458A13BAF
          59E082499BEF480303211800000301CF3C9AF2EF8B1FB3378CBE1069ABA9EA71
          5AEA3A5160AF7BA6C8CE9092780E19559413C67046703392057B5587ED23F157
          E3BDEDEE95F0EF43B3D0FECD019E6B87904D228E70A2475081988C005739EE00
          2475D7BE25F15F867F659F1549F160C6757BC8E7B1B1866F2FCE904918588304
          E0B06DCDC721573DA9DAE07CF3F06FF6A6F127C24F0F5F68AB126B160D131B08
          AE9C816729EE3D63C924A7193C82327391F073E0CEBDF1FBC6373203F65D304C
          66D4B531105442CDB8AA28C02E7270A3000F41591F063E10EABF197C61169160
          0C1671E24BEBE2B94B68B3D7DD8F2157B9F40091FA5BE08F04691F0EFC3567A1
          6896AB6B616CB803AB48DDDDCFF1313C93FCB0284AE0F4D86F81BC09A2FC39F0
          E5B689A0D9AD9D943C9C72F2B719776FE263DCFE0300003A2A28AB2428A28A00
          28A28A0028A2A09EE23B581E599D628D0659DCE001EA4D26D2D586FA13D15E6B
          E25F8FBE13D00BC70DD3EAF70BC6CB11B97FEFB242FE44D79AEB5FB4FEB17259
          74BD2AD6C50F01AE19A67FD3681F8E6BE531BC5394E05B8CEB294BB47DEFCB4F
          BD9F4984E1DCCB16B9A149A5DE5A7E7AFE07D29457C6FA8FC69F19EA44F99AEC
          D0AFF76D9122C7E2A01FCCD605CF8C75FBC24CFADEA339F592EE46FE66BE56AF
          885834FF0075424FD5A5FE67D153E09C535FBCAB15E977FE47DCF457C1FF00DB
          DA9EEDDFDA375BBFBDE73E7F9D5AB6F196BF664791AE6A301FFA677722FF0023
          5CF1F10E8B7EF619FF00E05FF00DDF0455B7BB5D7FE02FFCCFB9A8AF8DF4DF8D
          3E33D348F2F5C9E65FEEDCAA4B9FC5813F91AED344FDA8357B62ABAA6956B7A8
          382F6ECD0BE3DF3B81FD2BD9C371DE5559DAAA943D55D7FE4ADBFC0F2ABF07E6
          3495E9F2CFD1D9FE36FCCFA528AF35F0D7C7DF09F88592396E9F49B83C6CBE1B
          54FF00C0C657F322BD0E1B88EEA059617596371957439047A835F6B84C7E171D
          1E7C2D4535E4FF0035D3E67C9E270789C1CB93114DC5F9AFCBB93D14515E81C6
          1451450014514500795FC75F807A37C6AD0CACA12C75FB643F63D4D5795FF624
          FEF213DBA83C8EE0FE72F8CBC1BABFC3FF0011DDE89ADDA3D9EA36CD8643C861
          D994FF001291C823AD7EB75794FC7EF813A6FC6BF0C98F0969E20B4563617E47
          43FF003CDFB946FCC1E477065AB8D33C7AC358F037ED7DE0DF0F59F8A35E7F0F
          78AB45C89A259A38FCFDC1448E9BF860DB14F1CA9CE4118275BC6FF1BFC05FB3
          67834F85FE1F25A6A5AD60E160712C71C87832DC483EFBF1F741CF007CA315F1
          37883C3FA878575BBCD2755B592CB50B490C534120C1523F98C6082382082383
          5F47FECCDE05F86365E0EBAF885E32D5ADEEA6D3A731B69D76B88ED9FAA1F2F9
          333301950011F7860907093199DF0A3F66CF167C79D69FC5DE33BCBAB0D26F24
          F3A4BB9C62EAF7FEB929FBAB800062300630081C7A97ED45F043C0DE1DF82905
          EE9705AE833E8ECA2CA48C65AF3CC2018D9B92ECD8DC18E48DA790B9AD6F04FC
          48D67F69CF18DC436304DA1FC33D2181BBC9DB36A4FD561761F7508E59173F2F
          0C4EE18E63C7BE17F11FED6FE3D48B4B91B4AF86DA2C8D045AA48A765DC80E24
          9225E3CC3C6D53F74019C82482FA08F0DFD9B7E37CFF0006FC6C86EA477F0E6A
          2562D4211C84FEECCA3FBCB927DD4B0EB8C7E93DB5CC57B6F14F048B3412A874
          91082AEA464107B83D735F9C5FB4DFC38F04FC35F12E9DA6784756375711DBF9
          7A8D93C86578655E8ECFD0330272831B48CE00200F73FD893E3536B3A5BF80B5
          69F75E58A1974C790F32403EF45EE533903FBA48E36525D86CFAC28A28AB2428
          A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00F2
          5FDA63E2C8F84DF0D2EEEAD6609ADEA04D9E9E01F995C8F9A41FEE2E4E7A6EDA
          0F5AFCD1662EC598966249258E4935ECDFB587C503F127E2A5DC36D2F99A3E8A
          5AC6D429F95D81FDEC9EFB986323AAAAD78BD66DDD94828A28A433B8F85FF19F
          C53F082F679BC3D7AB1C3718FB459DC27990CA46704AF623279520F6CE2B57C4
          DE3DF1DFED27E32D274CBB945F5ECB279365616CBE5C1113F79B1CE06064BB64
          80393815E655F797EC69F040783BC303C63AB418D6B578BFD15241CDBDA9C107
          D99F01BFDDDBD324535AE82D8F5CF839F09F4CF83DE0BB6D16C0096E5B12DEDE
          6DC35CCC472DECA3A01D87BE49EF28A2B42428A28A0028A28A002A2924482367
          76091A8CB331C002B1BC5BE2FD2FC17A53EA1AA5C79310C8445E5E56ECAA3B9F
          F2715F2E7C47F8C1ABF8FA678031B0D201F92CE26FBE3D643FC47BE3A0FAF27E
          4F3CE24C264B0E59FBD51ED15FABE8BF17D11F479464589CDA5787BB05BC9FE9
          DDFF00573D73C79FB45E97A234969A046BABDE0E0DC3122DD0FD472FF8607BD7
          8278A7C79AEF8CE7F3356D465B88C1CAC00ED893D30838CFBF5F53585457E0D9
          AF10E619BB6ABCED0FE55A2FF83F3B9FB265B9260B2C49D285E5FCCF57FF0003
          E41451457CC9EF051451400514514005145140056F7857C7BAEF82E70FA4EA12
          DBA672D013BA27FAA1E33EE39F43583456F46BD5C3CD54A327192EA9D99955A5
          4EBC1D3AB1524FA35747D33E02FDA2B4BD71A3B4D7A35D22F0F02E0126DD8FD4
          F29F8E47BD7AFC7224F1ABA30746190C0E4115F03D779F0E3E30EAFE01952DCB
          1D434827E6B395B9419EB19FE13EDD0FD79AFD5F24E399C1AA19A2BAFE75BAF5
          5D7D56BE4CFCDF36E1084D3AD97E8FF95EDF27D3D1FDE8FB068AC2F09F8BB4BF
          19E949A869571E744701D0F0F1377561D8FF00919ADDAFDA2955A75E0AAD2927
          17AA6B667E57529CE94DD3A8ACD6E98514515A99851451401F3C7ED63FB3F2FC
          4AF0FBF89344B707C51A6C44B471AF37B00E4C7EEEA3254F53CAF718FCFE51F3
          0562546403C671EF5FB115F05FED95F03C782FC443C61A3DBECD1756948BA8A3
          5C2DBDC9E49F657E4FB3061C0205435D468FA9BC03A1F827C11F046C6DEDEFED
          8F849AC84D3EA32C9E525C8719777390416C9054F3FC3DB15F32FC6EFDB0E7D5
          6D9FC37F0F15B46D1235F24EA51A79534A8380B0A8FF005498EFC3631F77907E
          71B8F14EAF75E1FB5D0A5D4AEA4D1AD6469A1B132930A3B75217A67393ED938E
          A73974AE3B0E662EC598966249258E4935A7E16F12DFF83FC45A76B7A5CC61BF
          B1996789FB64763EA08C823B824565514867EB27C39F1C58FC49F05693E22D3C
          8105F421DA3CE4C4E38743EEAC08FC3DEBA6AF87BF617F8A6748F11DEF822FA6
          C5A6A60DD58EE3F72E147CE83FDE419FAC7EF5F70D689DC80A28A29805145140
          05145140051451400514514005145140051451400579A7ED15F114FC31F84FAC
          EAB0CBE56A3320B3B120E0F9F264061EEA373FFC02BD2EBE1BFDBCBC7A753F18
          68FE13824CC1A5C3F6AB85078334BF7411EAA8011FF5D0D27A0D1F2D1249249C
          93DE928A2B32828A28A00F5BFD99BE119F8B3F12ADA0BB88BE87A70177A8123E
          57507E588FBBB0C63AED0C7B57E96A22C48154055030001C015E3BFB2AFC2F1F
          0D3E15589B98BCBD63570B7F7991F32EE1FBB8CF7F9571C76666AF64AD12B12C
          28A28A620A28A2800AE57C7DE3DD3BC01A235F5EB79933FCB6F6AA70F33FA0F4
          03A93DBDCE01D0F15789ACBC1FA15CEA97F26C8205FBA3EF3B7655F526BE39F1
          AF8CAFFC75AECDA95FBE0B1DB142A4ED8533C28FEA7B9E6BE1B89F88E39351F6
          5475AD2DBC97F33FD3BB3EBB87F23966B57DA55D29477F37D97EA37C61E32D4F
          C6FAC3EA1A9CC647E91C4BC244B9FBAA3B0FD4F5E6B128A2BF9CEB56A988A92A
          B564E527AB6F767EE74A9428C153A6AD15B24145145626814514500145145001
          4514500145145001451450014514B0C324F2A451234923B055445CB31278007E
          98A695F441A2D59BBE09F166ADE0FD7A0BAD1DD8CEEC236B600B2CE09FB85475
          EBDB907A735F68697773DEE9D6D35CDB3595CC91ABC96ECC18C448E464707078
          AF30F833F06A2F08C11EB1AC46B2EB522E6388F2B6AA7B7BBFA9EDD07727D759
          73D383DABFA2783F2AC665B8472C549AE7D543F97CFC9BECBE7AEDF87F146638
          5C7E25470F14F97472EFE5E6977FBB4168A6AB6E1E87BFB53ABF413E2828A28A
          002B0BC6DE0FD3FC7DE15D4F40D523F32CAFE1313E07287AABAFA32B00C0FA81
          5BB45007E49F8EBC1B7FF0FF00C5DAA787B534DB79613344CC0101D7AAB8F660
          5587B1AC1AFB57F6EBF8582F748B0F1D58C3FE916656CF50DA3EF44C7F7521FF
          0075CEDF5F9D7B0AF8AAB36505145148668681AE5DF8675CB0D5EC2530DED8CE
          9710B8ECEA411F5191D3B8E2BF573C0BE2DB4F1E783F48F1058F16FA85B24E17
          392848F990FBAB6E53EE2BF24EBEDBFD82FC7E750F0E6B5E10B99732E9D27DB6
          D158F3E54871201ECAF83F592AA2267D5F451455921451450014514500145145
          00145145001451450014514500472CA96F13C923848D14B3331C00077AFC9FF8
          97E2F93C7BE3FD7FC4121246A17724B183D562CE235FC1028FC2BF45BF692F15
          1F077C13F155EA3ED9E6B63670E0E0EE9888F23DC062DF857E61D43290514515
          230AF4BFD9D7E1E0F897F16F44D2E68BCDD3E0737B7A08C830C78254FB31DA9F
          F03AF34AFB6FF607F038B2F0D6BDE2B9E3C4D7D38B1B7661C88E31B9C8F66660
          3EB1D3407D5F45145684051451400521214124E07A9A5AF2AF8FDE3A3E16F0A7
          F66DAC9B750D4C344083CA45FC6DF5390BF89F4AF3B30C752CBB0B53155768AB
          FAF65F37A1DB82C254C7622186A5BC9FDDDDFC96A78EFC6CF88EDE37F109B5B4
          949D1AC58A4201E257E8D27F41EDF535E734515FCA98EC6D6CC3113C55777949
          DFFC92F25B23FA370985A582A10C3D1568C57F4FE6145145701D614514500145
          1450014514500145145001451450014514B0C324F2A451234923B055445CB312
          78007E98A695F441A2D58430C93CA91448D248EC1551172CC49E001FA62BE9EF
          833F06A2F08C11EB1AC46B2EB522E6388F2B6AA7B7BBFA9EDD07724F833F06A2
          F08C11EB1AC46B2EB522E6388F2B6AA7B7BBFA9EDD07727D7ABF73E15E14FAAF
          2E3F1F1FDE6F18BFB3E6FCFB2E9EBB7E43C47C46F13CD83C1BF73ED4BBF92F2F
          CFD3728A28AFD5CFCE06B7CA777E74EA298BF292BDBB52D807D14514C028A28A
          00C9F15786ECFC61E1BD4F44D4137D95FDBBDBCA0750186323DC6720F62057E5
          078ABC3977E0FF0012EA9A25F2EDBBD3EE1EDA4C0C02CA71B87B1C673DC1AFD7
          5AF837F6EAF027F617C45D3FC49047B6DF5BB7DB2B01FF002DE2014E7D32863F
          A90D5321A3E67A28A2A0A0AF51FD9A3C6E7C07F19FC3B78F26CB4BB9BFB3EE72
          700A4BF2827E8E51BFE035E5D4E4768DD5D095652082A7047A7D0D007EC4515C
          C7C31F158F1CFC3CF0EEBDB817BFB18A5971D049B40907E0C187E15D3D6A4051
          4514005145140051451400514514005145140051451401F2BFEDF9E23367E09F
          0DE88ADB4DF5F3DCB00792B1263F2CCAA7F0AF876BE9BFDBDB5B379F13B45D31
          5B31D9696B211E8F248F9FFC7514D7CC959BDCA414514521857EA87C0FF090F0
          3FC25F0B68E63F2E686C52499718C4B27EF24FFC79DABF34FE1BF87478B7E20F
          86F4665DF1DF6A104120EBF2348A18FD36E4D7EB30000C0E9551130A28A2AC90
          A28A2800AF8C7E2CF8B8F8CBC71A85E23EFB489BECF6DCE4796A48C8FF0078EE
          6FF8157D39F16FC47FF08B780356BB46DB70F1FD9E120F21DFE5C8F70096FC2B
          E34AFC6BC40CC5FEEB2F83FEF4BF28FEAFEE3F52E0AC12FDE6364BFBABF37FA7
          E21451457E327EA614514500145145001456C7857C257DE31BFB8B2D382BDD47
          6EF3AC64E0C9B71951E8707BF19E2B22686482578A5468E4462AC8EB86520F20
          8FD315B4A8D48D38D5717CAEE93E8EDB99C6AD394DD24FDE56BAEBAEC2514515
          89A05145140051452C30C93CA91448D248EC1551172CC49E001FA629A57D1068
          B5610C324F2A451234923B055445CB31278007E98AFA7BE0CFC1A8BC23047AC6
          B11ACBAD48B98E23CADAA9EDEEFEA7B741DC93E0CFC1A8BC23047AC6B11ACBAD
          48B98E23CADAA9EDEEFEA7B741DC9F5EAFDCF857853EABCB8FC7C7F79BC62FEC
          F9BF3ECBA7AEDF90F11F11BC4F360F06FDCFB52EFE4BCBF3F4DCA28A2BF573F3
          80A28ACBD735CB1F0DE953EA1A84EB6D6902EE676EFE800EE4FA544E71A71739
          BB25AB6FA1518CA725082BB7B06B9AE58F86F4A9F50D4275B6B4817733B77F40
          07727D2BE7AB3F8F77DA9FC4ED3EFA576B3D0039B6FB296E044E71BDFD5810AD
          ED8C0EE4F1FF0013BE275F7C45D53736EB6D2A16FF0046B4CF007F79BD58FE40
          7E24F175F8367DC615B13898C700ED4E9B4EFF00CCD3EBFDDF2EBBBECBF63C9B
          85E961F0F296355EA4D35FE14FB79F9F4E9DDFDFB4571DF09FC467C53E01D26F
          1DB75C2C5E44C4F52E9F2927DCE01FC6BB1AFDCF0B88862E843114FE1924D7CD
          5CFC871146586AD3A33DE2DA7F20A28A2BA4C02BC2BF6CBF078F147C14BFBB44
          DF75A34F1DFC781CEDCEC93F0DAE5BFE022BDD6B2FC51A145E28F0D6ADA3CF8F
          2750B496D5F233C3A1527F5A00FC89A2A5BAB696CAE65B7990A4D13B46E87A86
          0483FCAA2AC8B0A28A2803F40BF61BF131D67E0E49A63BE64D22FE581549E91B
          E2507FEFA771F857D115F147FC13F75E30F893C5BA2B3645CDA4378AA7B796E5
          0FFE8D5FD2BED7AD16C4B0A28A298828A28A0028A28A0028A28A0028A28A0028
          A28A00FCDAFDAF7533A97C7FF12007296CB6F6EBEC040848FF00BE8B578D57A1
          7ED07766F7E36F8D64CEE23549A2FF00BE0ED1FF00A0D79ED64CB0A28A2803D9
          FF0063FD1C6AFF001F7C3ECCBBA3B349EE987B88582FFE3CCA6BF48EBE09FD82
          EC45C7C5BD5AE58656DF469307D19A6847F20D5F7B55AD89614514550828A28A
          00F06FDA97592965A1E928DC4B23DCB8FF00746D5FFD09BF2AF9EEBD53F692BF
          377F114419E2D6D238B1D8124BFE78615E575FCC1C5588789CE2BCBA45F2FF00
          E02ADF9DCFE82E1DA0B0F95D15DD5FEFD7F2B0514515F267D185145140051451
          401EA5FB36FF00C9481FF5E72FF35AF4DF8CDF06A2F174126B1A3C6B16B51AE6
          48870B74A3B7B3FA1EFD0F623CCBF66DFF0092903FEBCE5FE6B5F55D7EEBC2B9
          761F34C86586C4C6F17397AA765AAECD1F90F11E3ABE5F9CC6BD0766A2BD1AD7
          47E47C073432412BC52A347223156475C329079047E98A4AFA7FE337C1A8BC5D
          049AC68F1AC5AD46B99221C2DD28EDECFE87BF43D88F986686482578A5468E44
          62AC8EB86520F208FD315F966779262324C47B2ABAC5FC32E8D7E8D755FA1FA2
          6539B50CDA87B4A7A496EBAA7FE5D9894514B0C324F2A451234923B055445CB3
          1278007E98AF9E4AFA23DAD16AC218649E548A246924760AA88B96624F000FD3
          15F4F7C19F8351784608F58D6235975A91731C4795B553DBDDFD4F6E83B927C1
          9F8351784608F58D6235975A91731C4795B553DBDDFD4F6E83B93EBD5FB9F0AF
          0A7D57971F8F8FEF378C5FD9F37E7D974F5DBF21E23E23789E6C1E0DFB9F6A5D
          FC9797E7E9B9451457EAE7E701451597AE6B963E1BD2A7D43509D6DAD205DCCE
          DDFD001DC9F4A89CE34E2E73764B56DF42A3194E4A10576F60D735CB1F0DE953
          EA1A84EB6D6902EE676EFE800EE4FA57C95F13BE275F7C45D53736EB6D2A16FF
          0046B4CF007F79BD58FE407E249F13BE275F7C45D53736EB6D2A16FF0046B4CF
          007F79BD58FE407E24F175FCF9C51C512CD24F0B8576A2BFF26F37E5D97CDF44
          BF6BE1EE1E8E5D1589C4ABD57FF92FFC1EEFE4BCCA28A2BF3A3EE0FA17F65BD6
          7CDB0D6F4963C452A5CA03FED0DADFFA0AFE75EF15F2B7ECDB7FF64F886D067E
          5BAB3923C7B82ADFC94D7D535FD25C1788788C9E9A7BC1B8FE375F833F09E2AA
          0A8E6936BED24FF0B7E6828A28AFB93E4028A28A00FCB3F8F7A18F0EFC68F195
          905D89FDA52CC8BD30B21F3147D30E2B81AF75FDB474D161F1EB53980C7DB2D2
          DA7CFAE2311FFED3AF0AACD96145145203DDBF62BD58E9DF1E34E801C0BFB4B9
          B623D404F37F9C75FA295F981FB35DF1D3BE3A78365071BAF843FF007DAB263F
          F1EAFD3FAB8EC4B0A28A2A841451450014514500145145001451450014514500
          7E52FC6490CBF17BC70E7A9D72F4E3D3F7EF5C7D7EBF3E916323B33D9DBB3939
          2C625249F5E947F62E9FFF003E16BFF7E57FC2A794773F2068AFD7C6D1F4E404
          9B1B503D4C2BFE1542E27F0DDA0FDFC9A5C1FF005D1A35FE759CA5182BCA4917
          18CA7A455CF8F7FE09FD103E33F154B8E574F8D7F393FF00AD5F6FD62E8BA9E8
          7A84B3AE8F75A7DCC9181E68B29118AE7A6EDA7D8F5ADAAAA738D48F341DD790
          A51941F2CD598514515A10145145007C73F1BA7FB4FC52D79F39DAF1A7FDF312
          0C7E95C45761F18811F137C400F5FB467FF1D5AE3EBF92B366E598E21BFE797F
          E94CFE94CB52581A097F247F241451457927A214514500145145007A97ECDBFF
          0025207FD79CBFCD6BEABAF953F66DFF0092903FEBCE5FE6B5F55D7F43F027FC
          8A5FF8E5FA1F897187FC8CBFEDD5FA85790FC66F835178BA09358D1E358B5A8D
          73244385BA51DBD9FD0F7E87B11EBD457D96639761F34C3CB0D898DE2FEF4FBA
          ECD1F2D81C757CBEBAAF41D9AFB9AECFC8F81BEC73FDAFECBE449F69F33CAF27
          69DFBF38DB8EB9CF18EB9AFA6FE0CFC1A8BC23047AC6B11ACBAD48B98E23CADA
          A9EDEEFEA7B741DC9EF7FE105D0FFE129FF848BEC11FF6B6CD9E7638CFF7F1D3
          7638DDD715D0D7C3E43C1D4F2CC44B1389929C93F73B25DDFF007BF2EEFA7D76
          73C535330A0A861D7226BDEEEFC9797E7F99451457E947C10514565EB9AE58F8
          6F4A9F50D4275B6B4817733B77F4007727D2A2738D38B9CDD92D5B7D0A8C6539
          28415DBD835CD72C7C37A54FA86A13ADB5A40BB99DBBFA003B93E95F257C4EF8
          9D7DF11754DCDBADB4A85BFD1AD33C01FDE6F563F901F8927C4EF89D7DF11754
          DCDBADB4A85BFD1AD33C01FDE6F563F901F893C5D7F3E7147144B3493C2E15DA
          8AFF00C9BCDF9765F37D12FDAF87B87A3974562712AF55FF00E4BFF07BBF92F3
          28A28AFCE8FB80A28A2803B9F81D39B7F8A7A137F79E44FCE2715F6257C67F07
          14B7C4EF0F81CFFA413F86D6FF000AFB32BF7BF0FDB797555FDF7FFA4C4FC6F8
          D52FAF537FDC5F9B0A28A2BF503F3E0A28A2803E09FDBDAD845F17748940C097
          458B27D489E7FE98AF9AEBE9FF00DBEC0FF8595E1E38E7FB200CFF00DB693FC6
          BE60ACDEE5051451486765F062736DF17FC11267006B76409F633A66BF562BF2
          83E137FC955F06FF00D86ACBFF0047A57EAFD5C44C28A28AA2428A28A0028A28
          A0028A28A0028A28A0028A28A00F923E227C40F14D878D75DB28B5EBF82DE1BC
          95638E298A044DC768E31C6302B8FB8F17EBD78713EB7A8CE4FF00CF4BA91B3F
          99AFB464F0C68F2DCC970FA4D93DC48773CCD6C85D8FA938C9351E9DAAE8726A
          2FA7D85D58B5EC685DEDAD9D0BA282012557A7247E75F92627843155EB4A55B1
          CD293765ABDDDEDAC97E07E9587E27C3D1A518D2C1DDC52BBD17CF48B3E2D5D3
          757D50822D2F6ECFA88DDC9ABD6FF0F7C51758F2FC3BAA30F5367201F9915F66
          EB3AC59E83A65C6A17F70B6D6B02EF9247E807F539E00EE6BC5F56FDA96D62BA
          64D3B4296E6007025B8B811330FF00742B63F135E263B85F29CADAFED0C6B4DF
          451D7D6CB99D8F5B07C43996629FD4B089A5FDED3EF7644BFB3C78435DF0B6A9
          ABB6A9A64F6105C429B1A60065831E3F535EE95E7FF0DFE2EE97F110C904713D
          86A51AEF6B491B76E5FEF2371B80C8EC0FB77AF40AFD4F87A8E12865D0A781A9
          ED29ABD9FABBBE8ADE963F3CCEAAE26B63A73C5D3E49E975F2B2EF7F5B851451
          5F46784145145007C81F1DED4DB7C54D6B8E24F25D73DF312FF506B81AF5FF00
          DA6F4C36DE35B1BC03097566067D591D81FD0AD79057F2A7105174336C4C1FF3
          B7F7BBFEA7F4664B5556CB70F25FCA97DCADFA0514515F3E7B21451450014514
          5007A97ECDBFF25207FD79CBFCD6BEABAF8A3E1C78D4F807C556FAA9805CC214
          C52C60FCDB1BA953EBC03EFD3DEBEC3D0F5CB1F1269506A1A7CEB73693AEE575
          EDEA08EC47A57EF7C058BA32C04B0AA5EFC64DB5E4EDAF99F8DF1961AAC7191C
          438FB8D257F357D0D4A28A2BF503F3E0A28A2800A28ACBD735CB1F0DE953EA1A
          84EB6D6902EE676EFE800EE4FA544E71A71739BB25AB6FA1518CA725082BB7B0
          6B9AE58F86F4A9F50D4275B6B4817733B77F4007727D2BE4AF89DF13AFBE22EA
          9B9B75B6950B7FA35A67803FBCDEAC7F203F124F89DF13AFBE22EA9B9B75B695
          0B7FA35A67803FBCDEAC7F203F1278BAFE7CE28E2896692785C2BB515FF9379B
          F2ECBE6FA25FB5F0F70F472E8AC4E255EABFFC97FE0F77F25E6514515F9D1F70
          145145001451450077DF01AD4DCFC53D1CE32B109A43ED889FFA915F5FD7CC5F
          B31E986E7C677F7A4652DACCA83E8CEE31FA06AFA76BFA1B8128BA794B9BFB53
          6FF04BF43F12E30AAA79928AFB314BF37FA8514515FA29F0E145145007C2BFB7
          E7FC949F0EFF00D827FF006B495F2FD7D41FB7E7FC949F0EFF00D827FF006B49
          5F2FD66F72828A28A433ABF84DFF002557C1BFF61AB2FF00D1E95FABF5F941F0
          9BFE4AAF837FEC3565FF00A3D2BF57EAE24B0A28A2A841451450014514500145
          145001451450014514500785FED27E35BED262B0D0ACA67B64BA8DA6B978CE19
          D33B5573E9D73EBC0F5CF21FB3DE83AE43E31B4D5E2D3A63A43C72432DD30DA9
          82A718CE377CE14719ADFF00DA9748713E87AAA82632B25AB9F420865FCF2FF9
          56F781FE38F8574AF01E9905E5CBDBDED95AAC0F6890B333941805481B7E6C67
          A8EBCE2BF1AAF1A55789EA54CC711ECD52E5942ED24EC93B26F4F54B57A9FA95
          1954A7C3D4E9E068F3BA978CAC9B6AF75776D7D3A239BFDA73C58F2EA161E1D8
          24222897ED57014F058E4203F4009FF810AC2F851F03C78F3497D5B52BC96CAC
          99CC702C00179083CB64F00678EE4907A639E0BC4DAE5DF8DFC5777A8346CD73
          7D3011C2BC900E15107AE0051EF5F52EB76D7FF0FBE10C9168EE91DF69966989
          0A0652410656C1F5F9CD79D81850E20CD31799E2E2E7469A6D2EE97C2BA744DD
          AFBEE7763275724CBB0D97E164A356A349BED7DDF5EAD2BF63E7DBBD3A6F83FF
          00156DA34B9334767711C825C60BC2C3907DF6B303F9D7D835F12691A7EB1F13
          7C61144F24B7D7D792833CEDCEC4CF2C7D15476E9D07A0AFB6EBE9781A5CEB17
          2A3171A2E69C13E9BDD7C972DCF0B8BE3C8F0D1AB252AAA2F99AF959FCDF3051
          4515FA89F9E051451401E2FF00B4E6846F7C29A7EA6AB96B1B9D8C7D1241827F
          EFA551F8D7CD55F7078CFC3E9E2BF0B6A9A5363375032A13D03F543F83006BE2
          09A17B799E2950A4A8C55948C104751F5E2BF01E3CC13A1984714969517E31D3
          F2B1FB3F06E2D56C14B0EDEB07F83D7F3B89451457E647DF0514514005145140
          05769F0C7E275F7C3AD5372EEB9D2A66FF0049B4CF047F797D187E447E047174
          575E17155B055A388C3CB9651D9FF5F8A39F1187A58BA52A35E378BDD1F74E87
          AE58F8934A8350D3E75B9B49D772BAF6F5047623D2B52BE36F863F13AFBE1D6A
          9B9775CE95337FA4DA67823FBCBE8C3F223F023EB5D0F5CB1F1269506A1A7CEB
          73693AEE575EDEA08EC47A57F4970F710D1CEE8FF2D58FC51FD5797E5B3E8DFE
          0F9DE495728ABDE9BD9FE8FCFF003DD796A514565EB9AE58F86F4A9F50D4275B
          6B4817733B77F4007727D2BEAE738D38B9CDD92D5B7D0F9C8C653928415DBD83
          5CD72C7C37A54FA86A13ADB5A40BB99DBBFA003B93E95F257C4EF89D7DF11754
          DCDBADB4A85BFD1AD33C01FDE6F563F901F8927C4EF89D7DF11754DCDBADB4A8
          5BFD1AD33C01FDE6F563F901F893C5D7F3E7147144B3493C2E15DA8AFF00C9BC
          DF9765F37D12FDAF87B87A3974562712AF55FF00E4BFF07BBF92F328A28AFCE8
          FB80A28A2800A28A2800A28A74103DCCD1C31219259182AA8192493C0FAF34D2
          6DD906CAECFA57F663D0FEC5E13BFD4D976BDF5CEC53EA918C03FF007D338FC2
          BD9AB0FC1DE1F4F0B785B4CD29304DAC0A8E47467C65DBF1624FE35B95FD6393
          60BFB3F2FA3867BC62AFEAF57F8B67F376698AFAEE36AE216D26EDE9B2FC028A
          28AF64F2C28A28A00F857F6FCFF9293E1DFF00B04FFED692BE5FAFA83F6FCFF9
          293E1DFF00B04FFED692BE5FACDEE5051451486757F09BFE4AAF837FEC3565FF
          00A3D2BF57EBF283E137FC955F06FF00D86ACBFF0047A57EAFD5C49614514550
          828A28A0028A28A0028A28A0028A28A0028A28A00E7FC67E12B3F1BF87AE74AB
          D0CB1CA0149147CD1B8FBAC3FCF2323BD7CF17FF00B3678AEDEEDA3B77B1BB83
          3F2CC2629C7A904707D867EA6BEA7ACDD675AB2F0FE9971A86A172B6B6902EE7
          95FA0F6F73E82BE5738E1FCBB356ABE32E9C57C49DB4F3E9647D0E579D63B2D4
          E8E1B5527B357D7CBA9E57F0BBE022F84B528B57D6AE62BDD422398208413144
          DFDF24E0B37A7031D79E31EA1E22BCD2AD34AB85D66E2DE0B0991A293ED32045
          652305724F715E01E35FDA4F52D42492DFC3B00D3ADB381753A879987A81F757
          E8727E95E58CDAE78DB55E4DEEB57EFDBE699F1FAE07E82BE1BFD65CAB27A5F5
          1C9E8BA97FB9BFC5CBB6C976D0FB0FEC0CC734A9F5CCD2AF25BEF4BF25F7DFBE
          A7D29A6FC54F869E13CDA699736F6919E1CDA5949827D4B05F9BEBCD7A168DAF
          58788EC52F34CBC8AF6D9F81244D900FA1F43EC79AF9834BFD9DBC61A8DBF9B2
          C1696071911DD4FF0031FF00BE4363E87149F0C35DD47E177C481A4EA41ADE19
          E65B4BC809CA827EE3FA719073FDD27D6BA703C4998E12AD286658554A8CDF2A
          6A2E366F6DDEDF73EBE473E3321C0E269D49E0312EA558ABB4DA95FEE5FE7D17
          99F59514515FAD1F9B05145140057CA1FB417838F873C68FA8429B6CB5506704
          0E04BD241F5CE1BFE05ED5F57D71DF143C129E3CF08DCE9E368BC8FF007D6AE7
          8C483A0FA1E47E35F27C4F957F6B65D2A705EFC7DE8FAAE9F35A7AD8FA4C8332
          FECCC746A4DFB92D25E8FAFC9EA7C67453AE2092D67920990C52C4C51D1860AB
          0E083E873C536BF985A69D99FD029A6AE828A28A40145145001451450015DA7C
          31F89D7DF0EB54DCBBAE74A99BFD26D33C11FDE5F461F911F811C5D15D785C55
          6C1568E230F2E594767FD7E28E7C461E962E94A8D78DE2F747DB9FF09D687FF0
          8B7FC245F6F8FF00B2766FF3B3CE7FB98EBBB3C6DEB9AF95FE277C4EBEF88BAA
          6E6DD6DA542DFE8D699E00FEF37AB1FC80FC49E3FED93FD93ECBE7C9F66F33CD
          F2771D9BF18DD8E99C719EB8A8EBEBB3BE2BC5671461874B92365CC97DA7FE5D
          97DF7D0F9ACA786F0F95D5957BF3CAFEEB7D17F9F761451457C31F5A14514500
          145145001451450015EA1FB3DF834F88FC68BA8CC99B2D2809C9238329FB83EB
          C16FF80FBD7995BDBCB777114102349348C1111464B127000F7E715F657C30F0
          4A7813C256DA79DA6F1FF7D7520FE2908E7EA07007D2BEEF83F29798E60AACD7
          EEE959BF5E8BEFD7D1799F21C4F99AC0609D28BF7EA68BD3ABFBB4F567614514
          57F481F8485145140051451401F0AFEDF9FF002527C3BFF609FF00DAD257CBF5
          F507EDF9FF002527C3BFF609FF00DAD257CBF59BDCA0A28A290CEAFE137FC955
          F06FFD86ACBFF47A57EAFD7E507C26FF0092ABE0DFFB0D597FE8F4AFD5FAB892
          C28A28AA10514514005145140051451400514514005145140057827ED4DA95C4
          76FE1FB1562B6B2B4D33A8E8CCBB40FC8337E75EF75E61F1F3C1B2F8ABC1A6E6
          D23F36F74D7FB42228CB3A630EA3F0C1FF0080D7CBF1361EAE2728AF4E8FC56B
          FAA4D36BE691F419056A787CCE8D4ABB5EDE974D27F7B3CF7E107C0BB4F12695
          6FAE6BB2BC96B364C165136DDE01C6E76EB8E0F0307BE7B57BFE8DA0E9FE1FB4
          FB369B65058C03F82040A09F53EA7DCD7CBBE05F8EBABF823415D252D2DEFEDE
          224C2662434609248E3A8C9271D79EB8AA5E26F8E1E2DF132B46D7E34EB66E0C
          360A631FF7D72DF866BF3DCAB88722C9B0507469B75ADEF69ADFAFBCFA5F6B7D
          C7DB66391E739AE2E6AAD44A95F4D74B74D175B77FBCFA53C61F137C3DE0889F
          FB46FD0DD0195B384EF998FA6DEDF56C0F7AF94BC59E23BBF885E359B508ADFC
          AB8BC9638E082339231B55067D781F8D27863C01E21F1A4D9D374E9EE23663BA
          E641B631CF3973C13EC327DABE83F85DF032D3C15711EA7A9CA9A86AEA331EC0
          7CA80E39DB9FBC7DC818F4EF5855A99BF194E14FD97B3C3A77BFEB77F13B5EC9
          2B77EE6D4E19670AC253F69ED2BB56B7E965B2DAF77E87AB20210063938E4FAD
          3A8A2BF713F230A28A2800A28A2803E79FDA1FE1918A57F1569B16637205F468
          3EE9E825FC7807DF07B9AF08AFBD6E2DE2BCB79219A35962914A3A3804329182
          08EE2BE52F8C3F09E6F01EA26F6C91A5D0AE18F96DC936EC7F81BDBD09EBD3A8
          E7F0DE32E1D742A4B32C2C7DC7F125D1FF0037A3EBD9F93D3F5CE15CF15582CB
          F12FDE5F0BEEBB7AAE9DD7A1E6F451457E4C7E92145145001451450014514500
          1451450014514500145145001451450014515E91F073E13CDE3BD485F5F2345A
          15BB0DEDD0CEC3F817DBD48E838EFC77E07035F31C4470D878DE52FC3CDF9238
          F198BA381A32AF5DDA2BFAB2F36761FB3C7C3267917C55A945F22E458C4E3A9E
          865FE607E27B035F42D57B6823B48238618D628A350AA8830140E0003D2AC57F
          50E4F9552C9F091C2D2D7AB7DDF57FE5D91FCF999E635734C4CB11534ECBB2E8
          BFCFCC28A28AF6CF2428A28A0028A28A00F857F6FCFF009293E1DFFB04FF00ED
          692BE5FAFA83F6FCFF009293E1DFFB04FF00ED692BE5FACDEE5051451486757F
          09BFE4AAF837FEC3565FFA3D2BF57EBF283E137FC955F06FFD86ACBFF47A57EA
          FD5C49614514550828A28A0028A28A0028A28A0028A28A0028A28A0028A28A00
          F38F10FC07F09F886FA4BB6B59AC6690EE93EC726C563EBB48207E00559D07E0
          8F83FC3EE244D2D6F265E925EB197FF1D3F2FE95DF515E2AC972D555D6587873
          77E55BF7F53D579AE3DD3F64EBCB97B5D91C512448A88A111460281800549457
          CFDF1BBE335ED86A53F877419DAD7C9F92EAF233F3EEC7DC43FC38E848E73C0C
          639335CD70F93619E2311B6C92DDBEC832DCB6BE695FD850DF76DEC97767B46A
          5E2DD134598417FAC58594E7A47717288DF9135A56F7315DC093412A4D138CAC
          88772B0F50457C77E0DF853E24F8821EEACE158ED8924DEDEB15476EF838258F
          B80467BD75DF0ABC4DAA7C32F880DE14D5A4FF00449E716EF106DC914ADF71D3
          D036541E990727A57C66078BB1156AD396330CE9D1A8F9632D77E97BA574FBAF
          5E8CFA9C5F0CD1A74E71C2E214EAC15E51D36EBD5D9F91F4ED14515FA69F0214
          514500154B52D3ADB57B19ACEF214B8B5990A491483E561E95768A99454D38C9
          5D31A6E2D4A2ECD1F26FC57F83379E0699EFEC04979A139FBF8CBDB93FC2FEDE
          8DD3E9C67CD2BEF79614B889A3915648DC6195864107D6BC27E257ECECB70D2E
          A3E150B1C87E67D318E14FFD7327A7FBA78F423815F89710F064E93962B2C578
          F58755FE1EEBCB75D2E7EB392715C6A2587CC1D9F49747EBD9F9EDDEC7CFD454
          D7D6173A65DCB6B7704B6D7319DAF0CABB594FB83D2A1AFC9651716E325668FD
          29352574EE828A28A91851451400514514005145140051451400515358585CEA
          9771DAD9C125D5C4876A4512EE663EC075AF7CF86BFB3B25BB45A8F8A82CB20F
          9934D539553FF4D08EBFEE8E3D49E457BB9564D8CCE2AFB3C3474EB27F0AF57F
          A2D4F2731CD70B95D3E7C44B5E896EFD17EBB1C4FC27F83179E399E3D4350592
          CF42439DFD1EE307A27A0EC5BF0E79C7D49A6E9B6DA4594367670A5BDAC2BB23
          8A318551E95622892DE258E35548D46155460003B54B5FD1191E4386C928F252
          D66FE293DDFF0092F2FBCFC3B36CE2BE6F579AA6915B47A2FF0037E61451457D
          31E08514514005145140051451401F0AFEDF9FF2527C3BFF00609FFDAD257CBF
          5F507EDF9FF2527C3BFF00609FFDAD257CBF59BDCA0A28A290CEAFE137FC955F
          06FF00D86ACBFF0047A57EAFD7E507C26FF92ABE0DFF00B0D597FE8F4AFD5FAB
          892C28A28AA10514514005145140051451400514514005145140051451400564
          F88F5EB6F0C6877BAADE92B6F6B199182F53D801EE49007D6B5AB98F88DE1B93
          C5BE09D5B49870279E2062C9C02EAC1D47E25457262E556187A93A0AF351765D
          DDB45F79D3868D39D7846B3B41B577E57D7F0393F84BF1913E20DEDFD8DEC31D
          8DF23196DE246243C3E993D597BFA83D3835E35F15FC273784FE245C5EEA36D2
          DC68F7B79F6B122E409519B73A67FBC32C31D7183D0D1F06BC5BA3F803C4D7D3
          EBF6922CC233145308F73C0E0FCC36F624719EBC63A1357FE27FC75BBF1A5BCB
          A669909B1D21CE1CCA019A6FAF651EC39F7ED5F8862F34C3E6591C1E635AF888
          49B492BBF492D159F7ED6DDDD1FAD61B2EAF80CDE4B034AD4251576DD97AC5EA
          EFE5DEFB2D4EF3C49FB45E81A3E9290786AD5AEEE3CB0B12BC4628601D811C13
          8F41C7BD795FC3AD1755F891F11EDEF27679CA5CADE5EDD30E1543038CF6271B
          40EDF406A1F087C30B9D6AC1F5AD6271A1F86E11BA4BE9C61A41E91AFF00113D
          33D33D33D29BE24F8841B4F3A1786617D1BC3EA486553FBFBB3FDE95C7527FBA
          381D39C0C79F8BCCB158C952C6670ED4E3AC29A5672B765D23DE4EFA691BF4EE
          C36030F855530B95ABD47A4A6F5E5F9F57FDD5EB2B1F5CC1ADE9D7972F6B05F5
          B4F709F7A28E65671F500E6B42BE333F0C7C57A37878789BEC72595BC244A184
          9B2745CF0FB7A81D39E08EB8C735EFDF047E2549E3CD125B5BF39D5AC42895C0
          C79C87857C7AF04103D8F7C0FD4327E25963B10B098CA0E8CE4AF1BDED25F34B
          FE09F9EE6790470745E270B5955845DA56B68FE4DFFC03D3A8A28AFBA3E4028A
          28A0028A28A00E6BC5BE00D0FC6D6DE56AD64B2C80612E13E5963FA30E71EC78
          F6AF09F187ECD9AC696CF3E8570BAB5B0C910B911CE07FE82DF5E0FB57D37457
          CD669C3B97E6FEF5785A7FCCB47FE4FE699EF65D9E63B2CF768CEF1FE57AAFF8
          1F2B1F066A7A45F68B746DB50B39ECA71D639E328DF5E7A8F7AAB5F786A5A4D9
          6B36E6DEFECE0BD80F58EE235917F222BCFF005BFD9EFC1FAB96686D67D3243C
          93673103FEF96DC07E0057E618DE00C5536DE12AA92ECF47FAAFC8FD070BC6B8
          79A4B154DC5F75AAFD1FE67C9F457BEEA3FB2BF25AC3C41C768EE6DBFF006656
          FE958373FB30F89A33986FF4B987A1964527FF001CAF95ABC299CD17AE1DBF46
          9FE4CFA2A7C479555575592F54D7E68F20A2BD57FE19A7C5BFF3D74DFF00BFED
          FF00C455AB6FD987C4D21CCD7FA5C23D04B2311FF8E7F5AE78F0DE6F27658697
          DC6EF3ECB22AEEBC7EF3C828AF7DD37F6571906FFC41C774B6B6C1FF00BE8B7F
          4AED345FD9F3C1FA432B4B6B36A720E775E4A48FFBE57683F420D7B186E09CDE
          BBF7E2A0BCDAFF00DB6E7955F8B32CA2BDC939BF24FF005B1F2C697A45F6B774
          2DB4FB39EF673FF2CEDE32ED8F5E3A0F735EB3E0FF00D9B357D50A4FAEDC2E93
          6FC6608C892723FF00415FAF27D457D1BA669365A45B8B7B1B482CE01D228230
          8BF901576BEF72EE02C1D06A78D9BA8FB2D17F9BFBD7A1F1D8EE32C5574E3858
          A82EFBBFF25F73F539AF08F80B43F04DA98B49B2585C8C3DC3FCD2C9F563CFE0
          38F6AE968A2BF4AA342961A0A9518A8C56C92B23E0AAD5A95E6EA5593949F57A
          8514515B99051451400514514005145140051451401F31FED4DFB3C78AFE3178
          C349D4F406B016D6B61F6693ED7398DB7F98CDC00A7B30AF16FF008619F891FD
          FD17FF00031BFF0088AFD05A2958773F3EBFE1867E247F7F45FF00C0C6FF00E2
          28FF008619F891FDFD17FF00031BFF0088AFD05A29582E7C2DE05FD8D3E20787
          3C71E1DD56EDB4936B63A8DB5D4DE5DDB16D8922B3606CEB8078CD7DD34514D2
          B0828A28A6014514500145145001451450014514500145145001451450014514
          50079CF8E7E08E81E37BD6BF93CED3EFDFFD64D6A4012FBB291C9F718F7CD66E
          97F05BC1BE01B49B57D4849A82DAA195E5BF60D1A63B840003F439E6BD62BC9B
          F6937BA5F87718837792D7B18B8DBFDCC3633EDB827E38AF8FCD72FCBB054AB6
          69F568CAA45396DBBEED6DBEADDAE7D365D8DC762EA52CBFDBCA30934B7E9DAF
          BFA2D8F10F88FF0011F50F88FACA468AF169B1BEDB3B1419F60481D58F4E3A74
          1EFEB7F083E0747A12C5AD7886259351037C166FCADBFF00B4DEADEDD07D7A60
          7ECEFA1E8105A5FF0089353BAB61796727968B70E145B2601F3307B9C900FB1F
          5359FF00177E394BE241368FA03BC1A51CACD743E57B8F503BAA7EA7BE0707F3
          8C17D57094BFB7F389FB4AB3D610DFE6D7974E915E764BEEF16F1189A9FD8B95
          C3D9D3869397E9F3EBD65E9765FF008E1F19A2D5609FC39A1C824B5276DDDE29
          C8931FF2CD3FD9C8E4F7E838CE66F803636FE0DD1B52F15EB7751E9B637205BD
          BB4C71E60049620756C9000032786AE17C1DE03B74D21FC53E272F69E1E808F2
          A11C4B7EFCE113D8E393E99F424656BBAF6AFF0012FC436D0C7012491058E9D6
          E311C29D9547D07278E99E00E3CF79AE2638C866F8C8F35597F0A1AECEE936B7
          E5D5D96F27AEDA9DAB2EC3CB0B2CB30B2B535FC49F9AD5A5D2FDFA4569BE87D4
          DE1DF8ADE16F155E8B3D3B568E4BA27E48A546899FFDDDC067E839AEC2BE4DF1
          DFC14BCF87DE17B5D665D5229AE3CC549A08D4AEC63D36367E6C63D07AD7B17C
          07F1E5DF8CBC2F345A83996FB4F9044D39E4CA847CA4FF00B5C3027D81EA6BF4
          BC9F3FC5D6C5FF0066E694953ACD732B6CD6FDDD9DBCFA3DBAFC0E679361A961
          7EBD975473A49D9DF74FEE575F2FBCF50A28A2BEF0F8F0A28A2800A28A2800A2
          8A2800A28A2800A28A2800A28A2800A28A2800A28A2800A2B9CD7BE237853C2F
          298B58F12E93A64A3AC5777B1C6FFF007C96CD62C3F1E3E1CDC4A113C6DA1063
          C7CF7D1A8FCC902803BDA2A9E99ABD86B768B75A75E5BEA16CDD26B5996443F8
          A922AE500145155751D4ECF48B56B9BEBB82CAD93EF4D71208D07D49C0A00B54
          570973F1DFE1D5AC9E5BF8DB422C0E3E4BF8DC0FC4135B9A078FBC31E2C6D9A2
          F8874BD564C67659DE472B0FA85248A00DFA28A2800A28AE6B5CF899E11F0CCC
          D0EADE27D1F4E9D78315CDF468E3FE025B3401D2D15C1DBFC78F87575208D3C6
          DA1063C7CF7F1A0FCC915D969DAA59EB16A973617705EDB37DD9ADE51221FA15
          2450072FE38F195CF85F58F0BD9C10452A6AD7C2D6469339452546571C67E6EF
          5D95797FC60FF91ABE1DFF00D8613FF424AF50AF1B075AA54C662A9C9E9171B7
          95E29BFC4F53134A10C2E1EA456B252BF9DA4D7E41451457B279614514500145
          145001451450014514500145145001451450014514500159FAC68F69AFE9973A
          7DF4227B5B8431C887B8FAF63EF5A14544E11A917092BA65464E12528BB347CB
          BE26FD9BFC4361A8B8D1BCAD4EC598946695639107A306C0FC4673E83A574FE0
          7FD9E6DB45CEABE2EB88654B75329B38DBF74A00CE646EE063381C7B91C57BDD
          79E7C77B8B9B6F861AB9B6CFCE6349197A8432283F9F4FC6BF3DAFC2D94E571A
          B98AA6E5C89C945BBC7457DBFCDB47DB51E21CCF30953C0BA8A3CCD45C92B3D5
          DB7FF248F9E7E2778FE7F885E2055B6568F4AB63E4D8DA20C719C6768FE26E38
          EC303B73EE5F07FE18C1F0F7459358D5FCB4D5A58B7CAF21016D63C64AE7B1C7
          2C7F0ED93E75FB37F86F4DD4F5CBFD5AF6489A6D3515A085C818273990E7FBB8
          C03D89CF1814EF8E1F1817C49249A0E8B3674B46C5C5C21E2E18761FEC03DFB9
          FA73F1D9655A382A12E23CCE4A7566DFB38F9AD2F6E96D9748AF368FA8C7D3AB
          8BAB1C8700B929C12E79796FF3BEFE6FC9339DF8C3F139FE206B420B42CBA35A
          122DD08E653DE423DFA007A0F726BD1FC25A9D97C06F02594BACC32CBAAEAF2F
          9ED69163CC450A300E718C0C67BE5C8ED58DF017E131D42783C4DAC438B48C86
          B28241FEB587FCB43FEC8EDEA79E839F43F8AFE14F090B0BAF12F88AD24BB96D
          E211C6BF6991379E76C6A0360649FE67D6BBF2CC0E653A55B882ACA2AB497BAE
          7A28C7ACAD67D348AEDA9C598633011AB4B25A716E945FBCA3BCA5D23BAEBAC9
          F7D0E56E3F6A5B059E210E8572F0EEFDE33CCAAC07A8001C9F6C8AF58F0A78BB
          4BF1AE982FF4AB9F3E1CED75236BC6DFDD61D8FF00915F16E97A5DCF88B5A82C
          2C2DC1B8BA942450A125549FAE4E075C9CE00CE6BECEF03F84ED7C13E1CB4D26
          D46444B9965C60C921FBCC7EA7B7A6076AF5784B38CDB36AF52589929528F5B2
          5AF44AD6F577BF43CEE26CB32DCB68D38D04D547D2F7D3BBBDFD15BF43A1A28A
          2BF523F3D0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2801AEC114
          B310AA06492718AF80BF685FDAB75BF1BEB579A2F85AFE5D2BC3103B45E7DAB1
          49AF70705CB8E421ECA3191CB67381F5CFED0FAECDE1DF827E2FBE81CA4C2C5A
          0565382A65222C8F71BF35F97752D8D0ACC598B312493924F24FBD257D6BFB0B
          FC32D13C41FDBBE27D52CE0D42EECA68EDACE3B840EB092BB9A40A463772A01E
          A30DEB5F4E7C5EF867A57C4CF02EA9A55ED94325C7D9DCD9DC141BE0982E5194
          F51C81903A8C83D6A6C3B9F999E0EF1D6BDF0FF578F53F0FEA93E99768412616
          C2B807EEBAF475F66C8AFD20F803F1861F8CDE03875731A5BEA96EFF0066BFB6
          43F2A4A003B97BED604119E9C8C9C66BF306BEB0FF00827F6A92C7E28F1669A1
          8F93359457057D191CA8FD24342067BCFED1DF1EEDFE0A786A216B1C777E23D4
          372D95BC8728806374AF8FE119000E371E3B123F3D3C63E3BD7FE206AAFA8F88
          755B9D52E892419DFE54C9E88BF7507B2802BB9FDA83C692F8D7E35F88A53216
          B6D3E6FECDB75CE42A45956C7B17DEDFF02AE53E14F81DFE24FC44D07C36ACD1
          A5FDC0595D3EF244A0BC847B84563CF7A6DDC2C7274F8A67B7952589DA391086
          574620820F63D8E6BF5B3C37E0DD13C21A243A4E91A65BD8E9F1204104518C30
          FF006BFBC4F72724F7AF8DBF6DEF849A47846FF46F13E8965169D1EA32496F79
          6F6E8122328019640A380586ECE319DA0F52491AB05C97F669FDABF55B0D6ECB
          C2FE34BE7D434CBA7582D754B96CCD6F21202AC8E7EF213C65B95CE49C74FB66
          EAE62B1B696E27916182243249239C2A281924FA0C66BF1EEBEF7F881F112EF5
          2FD8AD75C32B1BFD434CB7B29A52797669161949FF007807FCE84C4CF01F8F5F
          B53EBFF12757BBD3F42BDB8D1BC2A8E5238EDD8C72DD28FE39187383D760C003
          1904F35E0D457D95FB0B7C32D1352F0F6ADE2ED42C60BED492F8D8DB1B840E2D
          D55118B283D198C8067A80BC63272B71EC7C6B5D17823E217887E1CEB09A9787
          B54B8D3AE1482CB1B131CA07F0BA7471EC73EDCD7E90FC72F85BA4FC4DF87FAB
          D9DD5942FA8C36D24B6377B079B0CAAA4AE1BA85240047420D7E5E50D580FBDF
          4AF8B56DF1974BF865ADA46B6D7D1EB4B6D7D6C84E22994C79C77DAC0AB0F638
          E706BE93AFCE1FD96B509878EF4FB1DC4C0DA959CFB0F40C1CAFF23FA0AFD1EA
          F0B01FEFF8CF587FE908F6719FEE585F497FE96C28A28AFA13C40A28A2800A28
          A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800AA9A8585BEA
          B633D9DD44B3DB4E8639237190CA4608356E8A99454938C95D31A6E2D34F53E6
          4F197ECE1AD69F7D249E1D2BA958C872B1492AC7347EC4B6030F7C827D2B5BE1
          DFECE53A5E477DE2A31AC319DCBA7C4FBB79FF006D8718F619CFA8EFF42D15F1
          14F83729A789FACA837ADF95BF77EEB5FE4DB47D6CF8A7329E1FD83925D3992F
          7BEFBDBE76B91C512411AC71A848D4615546028F4AF957E3BFC44FF84BFC43FD
          9B672EED274E62AA54F12CBD19FDF1D07E27BD7AD7C77F889FF088787BFB36CE
          5DBAB6A2A554A9E628BA33FB13D07BE4F6AF0CF847F0FDFC7DE288E1951BFB32
          D712DDB8E015CF09F56C7E5B8F6AF9DE2DCC6AE36BC322C0EB2935CDF9A5E8BE
          27E56F33DCE19C0D3C2519E718BD2314F97F57FA2F3F91EB1FB3AFC3AFECCD38
          F896FA2C5D5DAEDB456EA90F76C762DFCBEB5D4FC57F8AF1FC363A6C696CB7D7
          772E59E02FB76C43A9CE0F24E31C6386F4AF408A24B789638D55234185551800
          0EC2B90F1DFC2BD0FE202892FA2786F913647790362451C9C11D08C93C11F957
          D6FF0065E272DCA3EA794B4AA2B6AFABDE4F67ABE97D0F9959850C7E67F5ACC9
          3707D1745D174D175B156E3E2ADAB7C349FC5B6D69308C2958A09D705A4DDB40
          E0FDDDDDC7606BE74B6F1378E3E206BC52CB50D4AEEFDC190456B33468807700
          10AA39033C76EF5F5D697A45B68DA4DB69D6D1ECB5B78961443CFCA0639AC1D4
          22F0AFC374BED764B7B4D20CCA12478902B4D82485551D493CF039EFD2BCDCE3
          26C5E611A13C4E2B929C12E7B7BBAF5927B792BECB5EA77E579AE1B04EAC30F8
          6E79C9FB97D74E8ADBFADB73C4BC1FF1BBC47E0BD6FF00B2BC5426BBB68E4F2E
          6172BFE9107FB59FE21CE707391D0D7D2325FDBC567F6A9278D2D82EF3333808
          07AE7D3DEBE2EF14EB173F10FC71757B0DB9371A8DC2A4302FDEC60222FD7014
          67D6BA8F8D5E2B9EE754B7F0CC3705B4ED1628EDD82B1C4B32A80CE47B7DDE7A
          60FAD7C8655C4F532DC3625D593AB4E124A9B7BBBDF77DACAFE5B7547D3E65C3
          D4F1F88C3AA7154A728B734B656B6CBBDDDBCF7E87D3DA7F89348D5DCA58EAB6
          37AFFDCB7B8473F92935AB5F21788FE0E6AFE12F06DAF88E7BA846446D25B2EE
          1243BF1B79EE7240206307D6BD57E00FC44BAD6740D56DB5ABB328D295651773
          125BC921B3B9BBEDDA793CE0E3B57D8E59C4D56B632380CC287B29C9732D6E9A
          B37AF6D13FBB5B1F2F8FC869D1C2CB1982ADED211767A59A774BE7AB5FA5CF68
          A2BE6BD7FF00699D667D4644D12C6D61B30C4466E519E571D89018019F4C1C7A
          9AD0F08FED31712EA315B7886C2DE2B791C21BBB4DCBE57BB2B1391EB823F1E9
          5BC38CB279D6F63ED1AD6D7B3E5FBFF5B194B85B34852F6BC8B6BDAFAFDC7D09
          4572DE3BF1EE9DE00D13FB46F8B4A646D9041160B4AD8CF1D80F53FE201F1C9B
          F6A6BF33662D02D921CFDD79D99B1F5C0FE55E9E63C4396E575151C555B4B7B2
          4DBF9D96879D81C931F98C3DAE1E9DE3DDB4BF367D1945701F0CBE2CD87C478A
          789606B0D4605DF25B33860CB9C6E56E323240E83191EB5DFD7B184C650C7D18
          E230D2E683D99E66270D5B0755D0AF1E592DD0514515D8731C17C78F0BCFE32F
          83DE2BD26D11A4BA96C9A48635192EF19122A8F72500FC6BF2CABF62ABE1EFDA
          8BF659BED1B53BEF17F842CDAEB49B8669EF74EB7425ED589CB3A28EB19E4903
          EEFA6DE92D0D1E79FB33FC7BFF00852BE24BA8F508A4B9F0EEA7B16ED6219785
          D49DB2A8EF80CC08E323DC015FA19E18F15E8FE36D1A2D5343D460D534F9BEEC
          D6EDB87B823AA9E7A1C115F91B5D1F823E21F88BE1CEAA351F0EEAB71A65C71B
          C44D94940E81D0E5587B107DA92761D8FD26FF00867DF86DFF0042568DFF0080
          8B5B5E15F867E15F045DCD73A068161A45C4C9E5C925A42119D739C1C76C815E
          21F03BF6C9D2BC75716DA2F8B628742D6E42122BB46C5A5CB76193FEAD8FA124
          1F504815F49CA76C4E4750A4D52B127E436BB7EDAAEB7A85EB9CB5CDC493127B
          967273FAD7B8FEC4362B77F1CA2958026D74EB8997D89DA9FC9C8AF00AFA37F6
          0FFF0092CD7FFF006059BFF474350B7299F7ED70FF0015FE10E87F18F45B4D2F
          5E7BB4B6B6B8FB4A1B394236FDACBC92A78C31E2AEFC4BF88DA67C2BF09DC788
          7588AE65B181D2364B4457932EC14603328EA7D6BC73FE1BC3E1E7FD03FC43FF
          0080B0FF00F1EAB76249FF00E185BE1C7FCF7D73FF000313FF008DD6A7C65F84
          B6FA57ECC5ABF84B4159E6874BB61736CB336F918472899C1200C9C6F007D2B1
          3FE1BC3E1E7FD03FC43FF80B0FFF001EAF6DF02F8CEC3E22F8434EF10E9B1CC9
          617E8CD125D28593018A9DC0123AA9EE692B0CFC96AF77FD973F6868BE0E6AD7
          7A5EB2B249E1AD4A45792489773DACA063CD0BFC4A46030EB80A467183BBFB4C
          FECB77DE09D46F7C4DE16B47BBF0CCCCD2CD6B029692C09E48C778B3C823EE8E
          0F404FCD753B0CFD76D0B5ED2BC5DA445A86957B6FA9E9D70BF24F6EE1D18771
          F5EC4751DEB92FF867DF86DFF42568DFF808B5F9BFE00F8A1E26F863A9FDB7C3
          BAB4F60E4E64801DD0CDECF19F95B8E32791D8835F6D7C0CFDAF346F895716DA
          2F88638B40F1149848C86FF45BA6F44279463FDC6273C618938AABA62B1A5E34
          F873E17F03F8C3C092F87F42B2D1E4B8D5A3595ED21085C074C038FA9AF75AF2
          FF008C1FF2357C3BFF00B0C27FE8495EA15E0E03FDFF0019EB0FFD211ECE33FD
          CB0BE92FFD2D8514515F4078A145145001451450014514500145145001451450
          01451450014514500145145001451450014514500735E31F00E8DE3AB1FB3EA9
          682475188AE53E5962FF0075BFA1C83E9517803C0965F0FB421A7DA3B4CCCE64
          96E1D406918F4CFD0607FF00ACD75545707D470DF59FAE7B35ED2D6E6B6B63AF
          EB788F61F55E77ECEF7B74B9E75F147E2CDBFC369B4D84DAFDBAE2E58B4912C9
          B4A4438DDD0F24F03E86BA9F0AF8A6CFC5FA05BEAF66B2C76D30240B85DAC304
          839EDD41E46456078FBE11689F105C5C5D79B6BA8AA045BB85B9DA3A02A78239
          3E87DEB03E3659DF691F0D6DF45D034FB896DB290CA6D90B18E041DF1CF242E4
          F719CF5AF9FAD88CCF015B158BC45A54231BC22B76FEEBAF3DD6BA6CCF6A950C
          0632961F0D46F1AD276949EC97E4FCB67A6BD087E217ED09A5F877CDB2D0826A
          DA80F94CD9FF00478CFD47DFFA2F1EF5E09777DE24F89FAFA87373AC6A126764
          6832A8BEC3A22FBF03DEB33417D2E2D5613AD45752D803FBC4B460B21FFBEBF9
          71F515F54FC34F14F80E5B24B2F0D4B6B61236336D28F2E773EFBB973EF935F9
          9E1EB6238C311C98DC5469534F4827ABF44F7F56DDBB1F7F5A950E17A1CD84C3
          BA936BE37B2F56B65E492F530BE1C7C25B5F867A6DCF8875968EEB55B7B77970
          BCA5B28524E0F76C704F6E83B93E11E10B097C69F1034E82E3F7AD7D7C24B8EF
          952DBA4FD031AFA77E37EA474CF861ADBA9C3CA8900F70EEAA7FF1D26BC5BF66
          AD1C5F78F25BC6195B1B47753E8CC420FF00C74B57A39D65D87A79960325C346
          D05EF3F3BBD5BEEED17FF0C716558EAF3C063335C44AF37A2F2B2D12ECAF23D0
          FF0069AD5859F832CEC54E24BCBB5C8F544049FD4A5791F84279348F857E34BD
          5250DE496D611B0EF9666907FDF271F8D743FB4D6B7F6DF1858E9A8D94B1B60C
          C3D1E4393FA2A1ACEF1069E744F809E1F8C8DB2EA5A9B5E38F5011D57FF1D086
          BCFCE6BCB139D632BC76A34E4BEF5C9FFA54D9DB95515432AC2D192D6ACD3FC7
          9BF28A34BF663D263BBF17EA17D22073676B88C91F759DB191E870187E26B9FF
          008F70C50FC50D5044A132B133ED1C1631AF3FCABD0BF656B4DB67E22B923EFC
          90C60FD039FF00D9857987C69BBFB6FC50D7E4CFDD9963FF00BE6355FF00D96B
          97194E34784F0DA6B3A8DFFE94BF447461672ABC4B8877D2304BFF00497F9DCD
          9F8D1AACD7BA77816095F7634382E0F3FC520009FF00C7057A47C36F05695AA7
          C10FDED8DBC9737B05CBB4ED182E1833AA107AE4055C7D2BCD7E3AD99B1D43C2
          D0118F2B42B68BE8559C57B6FC0DC5C7C22D263EA48B84FF00C8D257B993518E
          27887154EBAE67ECEDAFFDB8BF23C8CD6ABA19261EA51765CF7D3FEDF7F99E07
          F037537D33E2768E4310970CF6EE3D4323607E614FE15F60D7C4DF0D2430FC43
          F0D91DEFE15FCDC0FEB5F6CD7ADE1FD46F01569BD94FF34BFC8F378D60963294
          D758FE4D8514515FA91F9E0515E45FB507C45D6FE17FC331AD787E58E0BFFB74
          50179621228460D9E0F1D40E6BE47FF86D2F8A3FF414B1FF00C008FF00C295C6
          7D3DF18FF647F0AFC4D69F51D342F86F5F7CB1B9B640609DBFE9A45C0C9EECB8
          3EBBBA57C3DF137E11F897E126B02C3C4162625727C8BC88EF82E00EE8FEBEC7
          04770322BF403F665F88BAB7C4FF0085B06B5ADCD1CFA91BA9A091A28C20C291
          8E0703822BB2F885E02D2FE25F84750D03568565B6BA43B24DB96864FE1917D1
          94F3F98E848A56B86C7E4DD7DEFF00B18FC61BAF1F784EF3C31AC5C3DC6A7A2A
          A7933C8D979AD5B800FA94236E7B865EE0D7C173446099E324128C54EDE4120D
          7D09FB0BCF2C5F1AA5442764BA54EB263A11BE33FCC2D4ADC6CF9EA4431BB230
          C1524115F44FEC27204F8D1760F57D1E751FF7F213FD2BC47C75A5B687E36F10
          69CE0AB59EA1716E54F6DB2B2FF4AF51FD8DF574D2FE3D68D1BB045BD82E2DB3
          D064C65C0FCD00FAD1D419F5E7ED5BE1AD57C5BF06353D3746B09F53D424B8B7
          64B7B64DEEC048A4F1F419AFCFBF14FC32F15F822CE2BAD7FC3F7FA45B4D2795
          1CB77094566C13819EA7009C57EB257CC1FB7E7FC937F0EFFD8587FE8992A9A1
          23E14AFD34FD95FF00E480783FFEB84BFF00A3E4AFCCBAFB1EE3E28EBFF09FF6
          45F877AAF87268ADEEE7BB6B691E688480A16B86C60F7CA8E6A50D9F619008C1
          E457CF7F18BF63AF0CFC4033EA3A014F0CEBAF963E4A7FA2CEDD7E78C7DD27FB
          C98EE4826BE6EFF86D2F8A3FF414B1FF00C008FF00C2BECDFD9E7C71A8FC47F8
          43A1EBFABCD1CDA9DC99D67689022E527910600E9F2AAD56E2D8FCE7F889F0CB
          C45F0B35B3A5F88B4F7B495B261997E686751FC51BF461C8E3A8E840E95CB025
          482090C0F6E08AFD50F8CDF0F74CF895F0F757D27528519840F35B5C30F9ADE6
          55252407B73C1F5048EF5F95D52D586B53EBEF83FF0018AEBE26E9FE04D37569
          CDC6B9A26B514324EE72D3C2C57CB763DDBE56527BED049C935F6657E6C7ECB7
          FF00253F4CFF00AFDB5FFD1A2BF49EBC2C07FBFE33D61FFA423D9C67FB9E17D2
          5FFA5B0A28A2BE84F1028A28A0028A28A0028A28A0028A28A0028A28A0028A28
          A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E53C53F0CFC37
          E300CDA8E99135C37FCBCC23CB97FEFA1D7F1CD791EBBFB2FCC9771BE8FAB2C9
          6AD200F1DE2E2445CF2432F0C7D8815F43D15F398FE1ECB7327CD5E92E6EEB47
          F36B7F9DCF73059DE3F00B968D57CBD9EABEE7B7C8E13E29784E5D73E1ADF691
          A6C65E68628DA0881C96F2D94EDF7242903DF15F3F7C23F8910FC32D4B5237B6
          335CA5CA2A308C857465278C1EDC9EFC57D795CBF883E1C786BC51299B52D1AD
          AE2E0FDE99418E46FAB2904FE26BCACE721C4627174B31CBEA2855A6ACAEAEAD
          AFAF77D1FE07A395E71470F85A981C6D373A7377D1EB7D3D3B2EA7CA6CBA97C5
          8F880ED14645D6A571B8819610C7C75F655039F6AF5CFDA47498F4CF05F86E0B
          652B696737D9D47A011E17F4535EB1E1BF03E85E0F0E348D321B22E3E675CB39
          1E85989247B6693C6BE11B3F1BF876E74ABCDC8926192541968DC7461FE1DC12
          3BD79343856B51CB7174EA4D4EBD6D5BE974EE95DF77BBB2FC0F46AF11D2AB8F
          C354841C68D2D12EBAAB37A765B2FF0033CD3F65F9615F09EB19601D2F373E4F
          45D8B83FA37E55E217D9F1AFC43B81065BFB5353611E3FBB24871F860D76F79F
          B3D78CB499A68F4F9E0BAB794142F05CF95BD7D194E3F2C915DCFC23F8193F84
          F554D6B5B9A192F62045BDBC2772C648237313D4E09000E075FA7CBACBB34CCE
          96132AAB869538526F9A4F66AFD3E57DAF7B9F44F1D97E5F531398D3C429CAA2
          5CB15BA76EBF3B6F6B1CEFED49A798757D06EC2E237B792118EDB581FF00D9EB
          BBFD9EB508DFE184396005A5C4CAE73D39DFFC9AB73E2A78013E227864D924AB
          0DEC0FE75B4AE3E50F8C60FB1071EDC1E718AF0183E1B7C4AF0FC577A6D9DA5E
          C36D73F2CAB6B72BE54A3A64E1BA60FB1C57B98DA78BC933FA99953A12A94EA4
          6DEEABD9D96F6F35F73D0F23093C366D93430152B469CE12BFBCEDA5DEBF73FB
          D1CE7C32B76BBF88BE1D441C8BF8A4C0EC15B71FE46BED7AF94FC01FD95F097C
          633CFE2DF3E2D5AD63022B4B741288F7A64B160719DAD8C0CF535EB1FF000D25
          E0FF005BFF00FC071FFC55470862B0794612A431B5A30A9293F75BB356D355D1
          DEFA17C4F87C56678984F0949CE0A3BA574EFAE8FAAB5B53D528AF2BFF008692
          F07FADFF00FE038FFE2A8FF8692F07FADFFF00E038FF00E2ABEF3FD61CA7FE82
          61F7A3E3BFB1333FFA0797DC2FED35E0C9FC73F057C4561691996F608D6F6045
          192CD13072A077254301EE457E6457E9B7FC349783FD6FFF00F01C7FF155F287
          C6CF871E0CF12EAB71ADF822EE6D36E2E18C93E95756FB602E7AB44CA4ECC9E7
          690467A10302A1F10E53FF004130FBCA592665FF0040F2FB8A5FB34FED30BF05
          22BED2357B19F50D02EE5FB40FB215F3A0976852CA1880C182AF1918DB9CF507
          D6FE23FEDD7A1CDE19BBB5F08E9BA936AF7313471DD5F22451DBE4637801D8B3
          0EA070338E4F43F2C7FC2B0D6FD2DBFEFE7FF5A8FF008561ADFA5B7FDFCFFEB5
          1FEB1653FF004130FBC3FB1332FF009F12FB8E46BEBDFD81BC0971FDA1E20F18
          4F115B6108D32D59870EC583C847D36C633FED11D8D78E7803E0F69575A8A4BE
          30D625B1D391816B6D36132CD28F4DCD8541EFF31F61D6BEC8F0D7C6CF87BE10
          D0ACF46D22D6EEC74EB34F2E1823B6E1477E77724E49279249249C9A1710653F
          F4130FBC3FB1332FFA0797DC7CB1FB657C3C9FC1FF0016EEB57485974CD797ED
          714807CA25002CAB9F5CE1BFE062BC57C39AFDEF8575FD3B59D3E5F2AFAC674B
          885C8C80CA4119F51C631DC715F7EFC44F897F0CFE28F86A7D0F5FB6BFB8B490
          878E44802CB038CE248DB3C30E7D46320820915F1E78B7E0F4761A83FF00C23D
          ABAEAB60C7E4375118265F661F329F4C83CFA0A1F10653FF004130FBC1649997
          FD03CBEE3EABF0D7EDD7E07D474B89F59B3D4F49D4368F3A28E11347BBBEC607
          247D403FCEBC67F6A3FDA47C3DF19740D3346D0AC6FE25B3BCFB53DCDEA2C61F
          E465C2AAB31FE2CE4E3A74AF1DFF008561ADFA5B7FDFCFFEB51FF0AC35BF4B6F
          FBF9FF00D6A3FD62CABFE8261F787F61E65FF3E25F71C8D7D97AAF8327F19FEC
          27A1FD96369AE74B53A924606490934AB27E51BB9FC2BE68B4F853ABDC4C1259
          ECED90F5791DC803FE02A6BECEF841F15FC2FF000EBE1A689E19BE9EE6F67B18
          9E396586D4F96E59D9B0327247CD8A1710E53FF4130FBC3FB1332FF9F12FB8FC
          FDAFA23F66CFDA961F83FA45C787F5DD3EE6FF004592637104D6654CD0337DE5
          DAC40653807A820EEEB9E28FC61F85BE11D53559F55F025ECD6693B179349BD8
          364719279F29C67039FB8C303B1C600F33FF008561ADFA5B7FDFCFFEB52FF587
          295FF3130FBC3FB1332FF9F12FB8FA67E2F7EDB9A3EB5E10D4348F0869FA82DF
          5F42D6EF7B7C8912C08C30C542B3166C12067183CF38C57C715D77FC2B0D6FD2
          DBFEFE7FF5ABB5F871F07F4093518AE7C6BAB4F058A3026C74C84BC92F3D1A43
          8083E809C7420F20FF00587297FF003130FBC3FB1332FF009F12FB8E93F665F0
          55DD85F787BC4F708D1DBEA1AE41696B918DEB1B8323FD3732AE7D55857E81D7
          CCFE27F895E127B8F04C1A0DB4D67A668578921B7106C091295C0519E7EE9FA9
          EB5E89FF000D25E0FF005BFF00FC071FFC5579182CF32CA78CC54E5888A5271B
          3BEF6824FF0013D5C5651984F0B8684684AF152BE9B5E4DFE47AA515E57FF0D2
          5E0FF5BFFF00C071FF00C5569F85FE367873C5FAE5B693A79BBFB5CFB8A79B0E
          D5F954B1C9CFA035EFD3CF72CAD38D3A7888B949D92BEEDEC8F16A64F985283A
          93A12496ADDBA1E83451457BA78E145145001451450014514500145145001451
          4500145145001451450014514500145145001451450014514500145145001451
          4500145145001451450014514500145145001451450014514500145145001451
          45001451450014514500145145001451450014514500797FC60FF91ABE1DFF00
          D8613FF424AF50AE2FC71E0EBAF13EB3E18BCB79A28934ABE5BA9564CE5D4153
          85C0EBC57695E2E0E8D4A78CC55492B2938DBCED049FE27AB89AB09E170F08BD
          62A57F2BC9BFC828A28AF68F2828A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00FFD9}
        mmHeight = 15875
        mmLeft = 101865
        mmTop = 9260
        mmWidth = 18785
        BandType = 9
      end
      object ppLabel23: TppLabel
        UserName = 'Label301'
        AutoSize = False
        Caption = 'AGENTE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 125148
        mmTop = 100277
        mmWidth = 20108
        BandType = 9
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NM_VIA'
      DataPipeline = BDENF
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDENF'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NR_SOLICITACAO'
      DataPipeline = BDENF
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDENF'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 131234
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'calcUNEnd'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 2910
          mmLeft = 7408
          mmTop = 33867
          mmWidth = 59002
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'CNPJ_UNID'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 2910
          mmLeft = 7408
          mmTop = 37042
          mmWidth = 58738
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'FONE_UNID'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 2910
          mmLeft = 7408
          mmTop = 40217
          mmWidth = 58738
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'calcUNBairro'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 2910
          mmLeft = 66940
          mmTop = 34131
          mmWidth = 54240
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'calcUNIE'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 2910
          mmLeft = 66940
          mmTop = 37306
          mmWidth = 54240
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'calcUNFax'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 2910
          mmLeft = 66940
          mmTop = 40481
          mmWidth = 54240
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'NM_VIA'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 5027
          mmLeft = 126736
          mmTop = 24077
          mmWidth = 40746
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'DT_VENCIMENTO'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 174890
          mmTop = 38894
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'calcEmissao'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3704
          mmLeft = 124884
          mmTop = 38894
          mmWidth = 37571
          BandType = 3
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'NR_PROC'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3704
          mmLeft = 155046
          mmTop = 47361
          mmWidth = 43392
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'CLI'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 34660
          mmTop = 57679
          mmWidth = 110331
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'calcENEnd'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 34660
          mmTop = 62442
          mmWidth = 165365
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'CNPJ_EMP'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 34660
          mmTop = 71438
          mmWidth = 64294
          BandType = 3
          GroupNo = 0
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          DataField = 'CLI_CID'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 34660
          mmTop = 66940
          mmWidth = 76200
          BandType = 3
          GroupNo = 0
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          DataField = 'AREA'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 34925
          mmTop = 81492
          mmWidth = 85196
          BandType = 3
          GroupNo = 0
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          DataField = 'NM_REFERENCIA'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          WordWrap = True
          DataPipelineName = 'BDENF'
          mmHeight = 10319
          mmLeft = 35190
          mmTop = 86784
          mmWidth = 164836
          BandType = 3
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          DataField = 'CLI_BAIRRO'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 129911
          mmTop = 66940
          mmWidth = 70115
          BandType = 3
          GroupNo = 0
        end
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          DataField = 'calcENIE'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 120915
          mmTop = 71438
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'CLI_UF'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 155046
          mmTop = 71438
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppDBText20: TppDBText
          UserName = 'DBText20'
          DataField = 'CLI_CEP'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 179917
          mmTop = 71438
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppDBText21: TppDBText
          UserName = 'DBText21'
          DataField = 'NM_CONTATO'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 142611
          mmTop = 81492
          mmWidth = 57415
          BandType = 3
          GroupNo = 0
        end
        object ppDBText22: TppDBText
          UserName = 'DBText22'
          DataField = 'NM_NAT_DESPACHO'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 51065
          mmTop = 100277
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'DBText23'
          DataField = 'NM_VEICULO'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 34925
          mmTop = 105304
          mmWidth = 45508
          BandType = 3
          GroupNo = 0
        end
        object ppDBText24: TppDBText
          UserName = 'DBText24'
          BlankWhenZero = True
          DataField = 'VOLUME'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 34925
          mmTop = 109538
          mmWidth = 45508
          BandType = 3
          GroupNo = 0
        end
        object ppDBText25: TppDBText
          UserName = 'DBText25'
          DataField = 'VL_FOB'
          DataPipeline = BDENF
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 40217
          mmTop = 113771
          mmWidth = 40217
          BandType = 3
          GroupNo = 0
        end
        object ppDBText26: TppDBText
          UserName = 'DBText26'
          DataField = 'calcNrDocto'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 34925
          mmTop = 117740
          mmWidth = 45508
          BandType = 3
          GroupNo = 0
        end
        object ppDBText27: TppDBText
          UserName = 'DBText27'
          DataField = 'NM_VIA_TRANSP'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 102394
          mmTop = 100277
          mmWidth = 42598
          BandType = 3
          GroupNo = 0
        end
        object ppDBText28: TppDBText
          UserName = 'DBText28'
          DataField = 'ORIGEM'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 102394
          mmTop = 105304
          mmWidth = 42598
          BandType = 3
          GroupNo = 0
        end
        object ppDBText29: TppDBText
          UserName = 'DBText29'
          DataField = 'VL_PESO_BRUTO'
          DataPipeline = BDENF
          DisplayFormat = '#0.,000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 102394
          mmTop = 109538
          mmWidth = 42598
          BandType = 3
          GroupNo = 0
        end
        object ppDBText30: TppDBText
          UserName = 'DBText30'
          DataField = 'VL_CIF'
          DataPipeline = BDENF
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 107156
          mmTop = 113771
          mmWidth = 37835
          BandType = 3
          GroupNo = 0
        end
        object ppDBText31: TppDBText
          UserName = 'DBText31'
          DataField = 'DESTINO'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 171715
          mmTop = 105304
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object ppDBText32: TppDBText
          UserName = 'DBText32'
          DataField = 'VL_PESO_LIQUIDO'
          DataPipeline = BDENF
          DisplayFormat = '#0.,000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 171715
          mmTop = 109538
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo1: TppDBMemo
          UserName = 'DBMemo1'
          CharWrap = False
          DataField = 'TX_HISTORICO'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 5027
          mmLeft = 5821
          mmTop = 122767
          mmWidth = 73025
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText37: TppDBText
          UserName = 'DBText301'
          DataPipeline = BDENF
          DisplayFormat = 'R$   #0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 78846
          mmTop = 121444
          mmWidth = 129646
          BandType = 3
          GroupNo = 0
        end
        object ppLabel46: TppLabel
          UserName = 'Label22'
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 35454
          mmTop = 113771
          mmWidth = 3704
          BandType = 3
          GroupNo = 0
        end
        object ppLabel57: TppLabel
          UserName = 'Label46'
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 102394
          mmTop = 113771
          mmWidth = 3704
          BandType = 3
          GroupNo = 0
        end
        object ppDBText57: TppDBText
          UserName = 'DBText57'
          DataField = 'NR_NF_SERV'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 14
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 5842
          mmLeft = 182034
          mmTop = 23813
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
        object ppDBText58: TppDBText
          UserName = 'DBText58'
          DataField = 'VL_COMISSAO'
          DataPipeline = BDENF
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 171980
          mmTop = 127794
          mmWidth = 28046
          BandType = 3
          GroupNo = 1
        end
        object ppLabel58: TppLabel
          UserName = 'Label41'
          Caption = 'COMISS'#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 6085
          mmTop = 127794
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText59: TppDBText
          UserName = 'DBText49'
          DataField = 'NM_AGENTE'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 171715
          mmTop = 100277
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppDBText62: TppDBText
          UserName = 'DBText51'
          DataField = 'LBL_EXPORTADOR'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 102129
          mmTop = 117740
          mmWidth = 27517
          BandType = 3
          GroupNo = 1
        end
        object ppDBText64: TppDBText
          UserName = 'DBText64'
          DataField = 'NM_EXPORTADOR'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 131498
          mmTop = 117740
          mmWidth = 68792
          BandType = 3
          GroupNo = 1
        end
        object ppDBText66: TppDBText
          UserName = 'DBText66'
          DataField = 'DT_DESEMBARACAO'
          DataPipeline = BDENF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'BDENF'
          mmHeight = 3440
          mmLeft = 171715
          mmTop = 113771
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 230000
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qryNF: TQuery
    OnCalcFields = qryNFCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NF.CD_UNID_NEG,'
      '       NF.CD_PRODUTO,'
      '       NF.NR_SOLICITACAO,'
      
        '       NF.NR_PROCESSO, SUBSTRING(NF.NR_PROCESSO, 5, 10) AS NR_PR' +
        'OC,'
      '       ISNULL(NF.DT_EMISSAO, '#39#39') AS DT_EMISSAO,'
      '       ISNULL(NF.DT_VENCIMENTO, '#39#39') AS DT_VENCIMENTO,'
      '       ISNULL(NF.NR_RELATORIO, '#39#39') AS NR_RELATORIO,'
      '       ISNULL(NF.NR_ANO, '#39#39') AS NR_ANO,'
      '       ISNULL(NF.NM_REFERENCIA, '#39#39') AS NM_REFERENCIA,'
      '       ISNULL(NF.NM_NAT_DESPACHO, '#39#39') AS NM_NAT_DESPACHO,'
      '       ISNULL(NF.NM_VEICULO, '#39#39') AS NM_VEICULO,'
      '       ISNULL(NF.QT_EMBALAGEM, 0) AS QT_EMBALAGEM,'
      '       ISNULL(NF.NR_DI, '#39#39') AS NR_DI,'
      '       ISNULL(NF.CD_EMISSOR, '#39#39') AS CD_EMISSOR,'
      '       NF.IN_QUADRO_TOTAL,'
      
        '       (SELECT ISNULL(TX_HISTORICO, '#39#39') FROM TNF_SERV_OP WHERE C' +
        'D_UNID_NEG = NF.CD_UNID_NEG AND CD_PRODUTO = NF.CD_PRODUTO AND N' +
        'R_SOLICITACAO = NF.NR_SOLICITACAO) AS TX_HISTORICO,'
      '       ISNULL(NF.NM_ESPECIE, '#39#39') AS NM_ESPECIE,'
      
        #9#9#9' (SELECT ISNULL(TX_OBS, '#39#39') FROM TNF_SERV_OP WHERE CD_UNID_NE' +
        'G = NF.CD_UNID_NEG AND CD_PRODUTO = NF.CD_PRODUTO AND NR_SOLICIT' +
        'ACAO = NF.NR_SOLICITACAO) AS TX_OBS,'
      
        '       '#39'C.N.P.J.: '#39' + SUBSTRING(UN.CGC_UNID_NEG,1,2) + '#39'.'#39' + SUB' +
        'STRING(UN.CGC_UNID_NEG,3,3) + '#39'.'#39' + SUBSTRING(UN.CGC_UNID_NEG,6,' +
        '3) + '#39'/'#39' + SUBSTRING(UN.CGC_UNID_NEG,9,4) + '#39'-'#39' + SUBSTRING(UN.C' +
        'GC_UNID_NEG,13,2) AS CNPJ_UNID,'
      '       ISNULL(UN.END_UNID_NEG, '#39#39') AS END_UNID_NEG,'
      '       ISNULL(UN.END_NUMERO, '#39#39') AS END_NUMERO,'
      '       ISNULL(UN.END_BAIRRO, '#39#39') AS END_BAIRRO,'
      '       ISNULL(UN.END_CIDADE, '#39#39') AS END_CIDADE,'
      '       ISNULL(UN.END_UF, '#39#39') AS END_UF,'
      '       ISNULL(UN.IE_UNID_NEG, '#39#39') AS IE_UNID_NEG,'
      '       ISNULL(UN.IM_UNID_NEG, '#39#39') AS IM_UNID_NEG,'
      '       '#39'TEL.: '#39' + UN.NR_FONE AS FONE_UNID,'
      '       ISNULL(UN.END_CEP, '#39#39') AS END_CEP,'
      '       ISNULL(UN.NR_FAX1, '#39#39') AS NR_FAX1,'
      '       ISNULL(UN.NR_FAX2, '#39#39') AS NR_FAX2,'
      '       ISNULL(EN.NM_EMPRESA, '#39#39') AS CLI,'
      '       ISNULL(EN.END_EMPRESA, '#39#39') AS CLI_END,'
      '       ISNULL(EN.END_NUMERO, '#39#39') AS CLI_NUM,'
      '       ISNULL(EN.END_CIDADE, '#39#39') AS CLI_CID,'
      '       ISNULL(EN.END_BAIRRO, '#39#39') AS CLI_BAIRRO,'
      '       ISNULL(EN.END_UF, '#39#39') AS CLI_UF,'
      
        '       SUBSTRING(EN.END_CEP, 1, 5) + '#39'-'#39' + SUBSTRING(EN.END_CEP,' +
        ' 6, 3) AS CLI_CEP,'
      
        '       SUBSTRING(EN.CGC_EMPRESA,1,2) + '#39'.'#39' + SUBSTRING(EN.CGC_EM' +
        'PRESA,3,3) + '#39'.'#39' + SUBSTRING(EN.CGC_EMPRESA,6,3) + '#39'/'#39' + SUBSTRI' +
        'NG(EN.CGC_EMPRESA,9,4) + '#39'-'#39' + SUBSTRING(EN.CGC_EMPRESA,13,2) AS' +
        ' CNPJ_EMP,'
      '       ISNULL(EN.IE_EMPRESA, '#39#39') AS IE_EMPRESA,'
      '       A.NM_AREA,'
      '       CC.NM_CONTATO,'
      '       VT.NM_VIA_TRANSP,'
      '       RTRIM(LTRIM(O.DESCRICAO)) AS ORIGEM,'
      '       RTRIM(LTRIM(D.DESCRICAO)) AS DESTINO,'
      '       FAT.TP_TIPO_FAT,'
      '       FAT.NR_NF_SERV,'
      '       EE.NM_EMPRESA,'
      '       CH.IN_EXP_NF,'
      
        '       CASE ISNULL(CH.IN_EXP_NF, '#39#39') WHEN '#39'1'#39' THEN EE.NM_EMPRESA' +
        ' ELSE A.NM_AREA END AS AREA, '
      
        '       CASE ISNULL(NF.QT_EMBALAGEM, '#39'0'#39') WHEN '#39'0'#39' THEN '#39#39' ELSE C' +
        'ONVERT(VARCHAR, NF.QT_EMBALAGEM) + '#39' '#39' + NF.NM_ESPECIE END AS VO' +
        'LUME,'
      
        '       SUM(CASE WHEN (CH.IN_CALCULA_IRRF_VL_MIN = '#39'1'#39') THEN NF.V' +
        'L_RETENCAO ELSE 0 END) AS CALC_RETENCAO,'
      '       V.NM_VIA, V.TP_VIA,       '
      '       NFI.CD_ITEM,'
      '       NFI.NM_ITEM,'
      '       NFI.IN_COLUNA,'
      '       NFI.NR_ORDEM_FAT,'
      
        '       CASE WHEN (NFI.NR_ORDEM_FAT <> '#39'1003'#39') AND (NFI.CD_ITEM <' +
        '> '#39'867'#39') THEN NFI.NM_ITEM ELSE '#39#39' END  AS CALCITEM,'
      '       CASE IN_COLUNA WHEN '#39'1'#39' '
      
        '         THEN (SELECT SUM(VL_ITEM) FROM TNF_SERV_OP_ITEM I WHERE' +
        ' NFI.CD_UNID_NEG = I.CD_UNID_NEG AND NFI.CD_PRODUTO = I.CD_PRODU' +
        'TO AND NFI.NR_SOLICITACAO = I.NR_SOLICITACAO AND I.IN_COLUNA = '#39 +
        '1'#39' AND NFI.CD_ITEM = I.CD_ITEM'
      '              GROUP BY CD_UNID_NEG, CD_PRODUTO, NR_SOLICITACAO)'
      '         ELSE 0 END AS VLCLIENTE,'
      '       CASE WHEN (IN_COLUNA = '#39'2'#39') AND (NFI.CD_ITEM <> '#39'867'#39')'
      
        '         THEN (SELECT SUM(VL_ITEM) FROM TNF_SERV_OP_ITEM I WHERE' +
        ' NFI.CD_UNID_NEG = I.CD_UNID_NEG AND NFI.CD_PRODUTO = I.CD_PRODU' +
        'TO AND NFI.NR_SOLICITACAO = I.NR_SOLICITACAO AND I.IN_COLUNA = '#39 +
        '2'#39' AND NFI.CD_ITEM = I.CD_ITEM'
      '              GROUP BY CD_UNID_NEG, CD_PRODUTO, NR_SOLICITACAO)'
      '         ELSE 0 END AS VLINDAIA,'
      '       CASE IN_COLUNA WHEN '#39'3'#39
      
        '         THEN (SELECT SUM(VL_ITEM) FROM TNF_SERV_OP_ITEM I WHERE' +
        ' NFI.CD_UNID_NEG = I.CD_UNID_NEG AND NFI.CD_PRODUTO = I.CD_PRODU' +
        'TO AND NFI.NR_SOLICITACAO = I.NR_SOLICITACAO AND I.IN_COLUNA = '#39 +
        '3'#39' AND NFI.CD_ITEM = I.CD_ITEM'
      '              GROUP BY CD_UNID_NEG, CD_PRODUTO, NR_SOLICITACAO)'
      '         ELSE 0 END AS VLSERVICO,'
      '       ISNULL(NF.NM_IR, '#39#39') AS NM_IR,'
      '       CASE WHEN (ROUND(ISNULL(NF.VL_TOT_GERAL, 0) -'
      
        '       ISNULL((SELECT SUM(ISNULL(VL_COFINS_RETIDO, 0)) FROM TRET' +
        'ENCAO_COFINS WHERE CD_UNID_NEG = NF.CD_UNID_NEG AND CD_PRODUTO =' +
        ' NF.CD_PRODUTO AND NR_SOLICITACAO = NF.NR_SOLICITACAO), 0) -'
      
        '       ISNULL((SELECT SUM(ISNULL(VL_IR_RETIDO, 0)) FROM TRETENCA' +
        'O_IR WHERE CD_UNID_NEG = NF.CD_UNID_NEG AND CD_PRODUTO = NF.CD_P' +
        'RODUTO AND NR_SOLICITACAO = NF.NR_SOLICITACAO), 0) -'
      
        '       ISNULL(NF.VL_TOT_NUM, 0), 2)) < 0 THEN '#39'S/FAVOR'#39' ELSE '#39'N/' +
        'FAVOR'#39' END AS NM_SALDO,'
      '       ISNULL(NF.NM_RETENCAO, '#39#39') AS NM_RETENCAO,'
      '       NF.NM_COFINS_PREVIEW,'
      
        '       CASE ISNULL(FAT.IN_PREVIEW, '#39'0'#39') WHEN '#39'1'#39' THEN '#39'(ESTIMATI' +
        'VA DE CUSTOS)'#39' ELSE '#39#39' END AS PREVIEW,'
      '       ISNULL(NF.VL_PESO_BRUTO, 0) AS VL_PESO_BRUTO,'
      '       ISNULL(NF.VL_PESO_LIQUIDO, 0) AS VL_PESO_LIQUIDO,'
      '       ISNULL(NF.VL_FOB, 0) AS VL_FOB,'
      '       ISNULL(NF.VL_CIF, 0) AS VL_CIF,'
      
        '       ISNULL(NF.VL_TOT_NAO_TRIBUTAVEL, 0) AS VL_TOT_NAO_TRIBUTA' +
        'VEL,'
      
        '       ISNULL(NF.VL_SUB_TOT_TRIBUTAVEL, 0) AS VL_SUB_TOT_TRIBUTA' +
        'VEL,'
      '       ISNULL(NF.VL_COMISSAO, 0) AS VL_COMISSAO,'
      '       ISNULL(NF.VL_TOT_GERAL, 0) AS VL_TOT_GERAL,'
      '       ISNULL(NF.VL_TOT_TRIBUTAVEL, 0) AS VL_TOT_TRIBUTAVEL,'
      '       CASE WHEN (CH.IN_TP_RETENCAO_IR <> '#39'0'#39')'
      
        '         THEN (SELECT ISNULL(SUM(VL_IR), 0) FROM TRETENCAO_IR WH' +
        'ERE CD_UNID_NEG = NF.CD_UNID_NEG AND CD_PRODUTO = NF.CD_PRODUTO ' +
        'AND NR_SOLICITACAO = NF.NR_SOLICITACAO) ELSE 0 END AS VL_IR,'
      '       CASE WHEN (CH.IN_TP_RETENCAO_IR <> '#39'0'#39')'
      
        #9#9#9#9' THEN (SELECT ISNULL(SUM(VL_IR_RETIDO), 0) FROM TRETENCAO_IR' +
        ' WHERE CD_UNID_NEG = NF.CD_UNID_NEG AND CD_PRODUTO = NF.CD_PRODU' +
        'TO AND NR_SOLICITACAO = NF.NR_SOLICITACAO) ELSE 0 END AS VL_IR_R' +
        'ETIDO,'
      
        '       CASE CH.IN_REMESSA WHEN '#39'1'#39' THEN NF.VL_RETENCAO ELSE 0 EN' +
        'D AS CALC_RETENCAO2,'
      '       ISNULL(NF.VL_ISS, 0) AS VL_ISS,'
      '       CASE WHEN (CH.IN_TP_RETENCAO_COFINS <> '#39'0'#39')'
      
        '         THEN (SELECT ISNULL(SUM(VL_COFINS), 0) FROM TRETENCAO_C' +
        'OFINS WHERE CD_UNID_NEG = NF.CD_UNID_NEG AND CD_PRODUTO = NF.CD_' +
        'PRODUTO AND NR_SOLICITACAO = NF.NR_SOLICITACAO) ELSE 0 END AS VL' +
        '_RETENCAO,'
      '       CASE WHEN (CH.IN_TP_RETENCAO_COFINS <> '#39'0'#39')'
      
        '         THEN (SELECT ISNULL(SUM(VL_COFINS_RETIDO), 0) FROM TRET' +
        'ENCAO_COFINS WHERE CD_UNID_NEG = NF.CD_UNID_NEG AND CD_PRODUTO =' +
        ' NF.CD_PRODUTO AND NR_SOLICITACAO = NF.NR_SOLICITACAO) ELSE 0 EN' +
        'D AS VL_COFINS_RETIDO,'
      '       SUM(NFI.VL_ITEM) VL_ITEM,'
      '       ISNULL(NF.VL_TOT_NUM, 0) AS VL_TOT_NUM,'
      '       ISNULL(NF.VL_SALDO, 0) AS VL_SALDO,'
      '       CASE WHEN EN.END_CIDADE = '#39'SANTOS'#39' THEN'
      '         ((ROUND(ISNULL(NF.VL_TOT_GERAL, 0) - VL_ISS -'
      
        '         ISNULL((SELECT SUM(ISNULL(VL_COFINS_RETIDO, 0)) FROM TR' +
        'ETENCAO_COFINS WHERE CD_UNID_NEG = NF.CD_UNID_NEG AND CD_PRODUTO' +
        ' = NF.CD_PRODUTO AND NR_SOLICITACAO = NF.NR_SOLICITACAO), 0) -'
      
        '         ISNULL((SELECT SUM(ISNULL(VL_IR_RETIDO, 0)) FROM TRETEN' +
        'CAO_IR WHERE CD_UNID_NEG = NF.CD_UNID_NEG AND CD_PRODUTO = NF.CD' +
        '_PRODUTO AND NR_SOLICITACAO = NF.NR_SOLICITACAO), 0) -'
      '         ISNULL(NF.VL_TOT_NUM, 0), 2)) * - 1)'
      '       ELSE'
      '         ((ROUND(ISNULL(NF.VL_TOT_GERAL, 0) + VL_ISS -'
      
        '         ISNULL((SELECT SUM(ISNULL(VL_COFINS_RETIDO, 0)) FROM TR' +
        'ETENCAO_COFINS WHERE CD_UNID_NEG = NF.CD_UNID_NEG AND CD_PRODUTO' +
        ' = NF.CD_PRODUTO AND NR_SOLICITACAO = NF.NR_SOLICITACAO), 0) -'
      
        '         ISNULL((SELECT SUM(ISNULL(VL_IR_RETIDO, 0)) FROM TRETEN' +
        'CAO_IR WHERE CD_UNID_NEG = NF.CD_UNID_NEG AND CD_PRODUTO = NF.CD' +
        '_PRODUTO AND NR_SOLICITACAO = NF.NR_SOLICITACAO), 0) -'
      
        '         ISNULL(NF.VL_TOT_NUM, 0), 2)) * - 1) END TOTAL, AG.NM_A' +
        'GENTE,'
      
        '       CASE WHEN NF.CD_PRODUTO = '#39'01'#39' THEN '#39'EXPORTADOR'#39' ELSE '#39#39' ' +
        'END LBL_EXPORTADOR,'
      
        '       CASE WHEN NF.CD_PRODUTO = '#39'01'#39' THEN (SELECT TOP 1 NM_EMPR' +
        'ESA FROM TEMPRESA_EST WHERE CD_EMPRESA IN (SELECT CD_FORNECEDOR ' +
        'FROM TADICAO_DE_IMPORTACAO WHERE NR_PROCESSO = NF.NR_PROCESSO) )'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'ELSE '#39#39' END NM_EXPORTADOR,'
      
        '       CONVERT(VARCHAR, DT_REALIZACAO, 103) DT_DESEMBARACAO     ' +
        '                          '
      '  FROM TVIA_NF V (NOLOCK), TNF_SERV_OP NF (NOLOCK)'
      
        '  LEFT JOIN TNF_SERV_OP_ITEM NFI (NOLOCK) ON NFI.CD_UNID_NEG = N' +
        'F.CD_UNID_NEG AND'
      
        '                                              NFI.CD_PRODUTO = N' +
        'F.CD_PRODUTO AND'
      
        '                                              NFI.NR_SOLICITACAO' +
        ' = NF.NR_SOLICITACAO'
      
        '  INNER JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA =  NF.CD_' +
        'CLIENTE'
      '  INNER JOIN TPROCESSO P ON P.NR_PROCESSO = NF.NR_PROCESSO'
      '  LEFT JOIN TAGENTE AG ON AG.CD_AGENTE = P.CD_AGENTE'
      
        '  LEFT JOIN TUNID_NEG UN (NOLOCK) ON UN.CD_UNID_NEG = CASE NF.CD' +
        '_UNID_NEG WHEN '#39'07'#39' THEN '#39'01'#39' ELSE NF.CD_UNID_NEG END '
      '  LEFT JOIN TAREA A (NOLOCK) ON A.CD_AREA = NF.CD_AREA'
      
        '  LEFT JOIN TCLIENTE_CONTATO CC (NOLOCK) ON CC.CD_CLIENTE = NF.C' +
        'D_CLIENTE AND'
      
        '                                            CC.CD_UNID_NEG = NF.' +
        'CD_UNID_NEG AND'
      
        '                                            CC.CD_PRODUTO = NF.C' +
        'D_PRODUTO AND'
      
        '                                            CC.CD_CONTATO = NF.C' +
        'D_ANALISTA'
      
        '  LEFT JOIN TVIA_TRANSP_BROKER VT (NOLOCK) ON VT.CD_VIA_TRANSP =' +
        ' NF.CD_VIA_TRANSP'
      
        '  LEFT JOIN TLOCAL_EMBARQUE O (NOLOCK) ON O.CODIGO = NF.CD_LOCAL' +
        '_ORIGEM'
      
        '  LEFT JOIN TLOCAL_EMBARQUE D (NOLOCK) ON D.CODIGO = NF.CD_LOCAL' +
        '_DESTINO'
      
        '  LEFT JOIN TS_FATURA FAT (NOLOCK) ON FAT.CD_UNID_NEG = NF.CD_UN' +
        'ID_NEG AND'
      
        '                                      FAT.CD_PRODUTO = NF.CD_PRO' +
        'DUTO AND'
      
        '                                      FAT.NR_SOLICITACAO = NF.NR' +
        '_SOLICITACAO'
      
        '  LEFT JOIN TEMPRESA_EST EE (NOLOCK) ON EE.CD_EMPRESA = NF.CD_EM' +
        'P_EST'
      
        '  LEFT JOIN TCLIENTE_HABILITACAO CH (NOLOCK) ON CH.CD_CLIENTE = ' +
        'NF.CD_CLIENTE AND'
      
        '                                                CH.CD_UNID_NEG =' +
        ' NF.CD_UNID_NEG AND'
      
        '                                                CH.CD_PRODUTO = ' +
        'NF.CD_PRODUTO'
      
        '  LEFT JOIN TRETENCAO_IR RET_IR (NOLOCK) ON RET_IR.CD_UNID_NEG =' +
        ' NF.CD_UNID_NEG AND RET_IR.CD_PRODUTO = NF.CD_PRODUTO AND RET_IR' +
        '.NR_SOLICITACAO = NF.NR_SOLICITACAO'
      
        '  LEFT JOIN TRETENCAO_COFINS RET_COF (NOLOCK) ON RET_COF.CD_UNID' +
        '_NEG = NF.CD_UNID_NEG AND RET_COF.CD_PRODUTO = NF.CD_PRODUTO AND' +
        ' RET_COF.NR_SOLICITACAO = NF.NR_SOLICITACAO'
      
        '  LEFT JOIN TFOLLOWUP F ON F.NR_PROCESSO = NF.NR_PROCESSO AND F.' +
        'CD_EVENTO = '#39'088'#39
      '  WHERE ISNULL(NF.CD_EMISSOR, '#39#39') = :USUARIO'
      '    AND V.TP_VIA = :VIA'
      ''
      
        'GROUP BY NF.CD_UNID_NEG, NF.CD_PRODUTO, NF.NR_SOLICITACAO, NF.NR' +
        '_PROCESSO, NFI.CD_UNID_NEG, NFI.CD_PRODUTO, NFI.NR_SOLICITACAO,'
      
        'NF.DT_EMISSAO, NF.DT_VENCIMENTO, NF.NR_RELATORIO, NF.NR_ANO, NF.' +
        'NM_REFERENCIA, NF.NM_NAT_DESPACHO, NF.NM_VEICULO, NF.QT_EMBALAGE' +
        'M, NF.NR_DI,'
      
        'CH.IN_TP_RETENCAO_IR, CH.IN_TP_RETENCAO_IR, RET_IR.VL_IR_RETIDO,' +
        ' NF.CD_EMISSOR, NF.IN_QUADRO_TOTAL, NF.NM_ESPECIE, CH.IN_TP_RETE' +
        'NCAO_COFINS,'
      
        'CH.IN_TP_RETENCAO_COFINS, V.NM_VIA, V.TP_VIA, UN.CGC_UNID_NEG, U' +
        'N.END_UNID_NEG, UN.END_NUMERO, UN.END_BAIRRO, UN.END_CIDADE, UN.' +
        'END_UF,'
      
        'UN.IE_UNID_NEG, UN.IM_UNID_NEG, UN.NR_FONE, UN.END_CEP, UN.NR_FA' +
        'X1, UN.NR_FAX2, EN.NM_EMPRESA, EN.END_EMPRESA, EN.END_NUMERO, EN' +
        '.END_CIDADE,'
      
        'EN.END_BAIRRO, EN.END_UF, EN.END_CEP, EN.CGC_EMPRESA, EN.IE_EMPR' +
        'ESA, A.NM_AREA, CC.NM_CONTATO, VT.NM_VIA_TRANSP, O.DESCRICAO, D.' +
        'DESCRICAO,'
      
        'FAT.TP_TIPO_FAT, FAT.NR_NF_SERV, EE.NM_EMPRESA, CH.IN_EXP_NF, CH' +
        '.IN_EXP_NF, CH.IN_CALCULA_IRRF_VL_MIN, NFI.CD_ITEM, NFI.NM_ITEM,' +
        ' NFI.IN_COLUNA,'
      
        'NFI.NR_ORDEM_FAT, NF.NM_IR, NF.NM_SALDO, NF.NM_RETENCAO, CH.IN_R' +
        'EMESSA, NF.NM_COFINS_PREVIEW, FAT.IN_PREVIEW, NF.VL_PESO_BRUTO, ' +
        'NF.VL_PESO_LIQUIDO,'
      
        'NF.VL_FOB, NF.VL_CIF, NF.VL_TOT_NAO_TRIBUTAVEL, NF.VL_SUB_TOT_TR' +
        'IBUTAVEL, NF.VL_COMISSAO, NF.VL_TOT_GERAL, NF.VL_TOT_TRIBUTAVEL,' +
        ' RET_IR.VL_IR,'
      
        'NF.VL_RETENCAO, NF.VL_ISS, RET_COF.VL_COFINS, RET_COF.VL_COFINS_' +
        'RETIDO, NF.VL_TOT_NUM, NF.VL_SALDO, AG.NM_AGENTE, F.DT_REALIZACA' +
        'O'
      
        'ORDER BY  V.NM_VIA ASC, NF.CD_UNID_NEG ASC, NF.CD_PRODUTO ASC, N' +
        'F.NR_SOLICITACAO ASC, NFI.NR_ORDEM_FAT ASC')
    Left = 516
    Top = 278
    ParamData = <
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VIA'
        ParamType = ptInput
      end>
    object qryNFcalcUNEnd: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcUNEnd'
      Size = 150
      Calculated = True
    end
    object qryNFcalcUNBairro: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcUNBairro'
      Size = 100
      Calculated = True
    end
    object qryNFcalcUNIE: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcUNIE'
      Size = 100
      Calculated = True
    end
    object qryNFcalcUNFax: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcUNFax'
      Size = 100
      Calculated = True
    end
    object qryNFcalcEmissao: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcEmissao'
      Size = 50
      Calculated = True
    end
    object qryNFcalcENEnd: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcENEnd'
      Size = 150
      Calculated = True
    end
    object qryNFcalcENIE: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcENIE'
      Size = 50
      Calculated = True
    end
    object qryNFcalcNrDocto: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNrDocto'
      Size = 50
      Calculated = True
    end
    object qryNFcalcCol1: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCol1'
      Size = 50
      Calculated = True
    end
    object qryNFcalcCol2: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCol2'
      Size = 50
      Calculated = True
    end
    object qryNFCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qryNFCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryNFNR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      FixedChar = True
      Size = 6
    end
    object qryNFNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryNFNR_PROC: TStringField
      FieldName = 'NR_PROC'
      FixedChar = True
      Size = 10
    end
    object qryNFDT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
    end
    object qryNFDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
    end
    object qryNFNR_RELATORIO: TStringField
      FieldName = 'NR_RELATORIO'
      FixedChar = True
      Size = 3
    end
    object qryNFNR_ANO: TStringField
      FieldName = 'NR_ANO'
      FixedChar = True
      Size = 4
    end
    object qryNFNM_REFERENCIA: TStringField
      FieldName = 'NM_REFERENCIA'
      FixedChar = True
      Size = 200
    end
    object qryNFNM_NAT_DESPACHO: TStringField
      FieldName = 'NM_NAT_DESPACHO'
      FixedChar = True
      Size = 15
    end
    object qryNFNM_VEICULO: TStringField
      FieldName = 'NM_VEICULO'
      FixedChar = True
      Size = 40
    end
    object qryNFQT_EMBALAGEM: TIntegerField
      FieldName = 'QT_EMBALAGEM'
    end
    object qryNFVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qryNFVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
    end
    object qryNFVL_FOB: TFloatField
      FieldName = 'VL_FOB'
    end
    object qryNFVL_CIF: TFloatField
      FieldName = 'VL_CIF'
    end
    object qryNFNR_DI: TStringField
      FieldName = 'NR_DI'
      FixedChar = True
      Size = 15
    end
    object qryNFVL_TOT_NAO_TRIBUTAVEL: TFloatField
      FieldName = 'VL_TOT_NAO_TRIBUTAVEL'
    end
    object qryNFVL_SUB_TOT_TRIBUTAVEL: TFloatField
      FieldName = 'VL_SUB_TOT_TRIBUTAVEL'
    end
    object qryNFVL_COMISSAO: TFloatField
      FieldName = 'VL_COMISSAO'
    end
    object qryNFVL_TOT_GERAL: TFloatField
      FieldName = 'VL_TOT_GERAL'
    end
    object qryNFVL_TOT_TRIBUTAVEL: TFloatField
      FieldName = 'VL_TOT_TRIBUTAVEL'
    end
    object qryNFVL_IR: TFloatField
      FieldName = 'VL_IR'
    end
    object qryNFVL_ISS: TFloatField
      FieldName = 'VL_ISS'
    end
    object qryNFCD_EMISSOR: TStringField
      FieldName = 'CD_EMISSOR'
      FixedChar = True
      Size = 4
    end
    object qryNFIN_QUADRO_TOTAL: TStringField
      FieldName = 'IN_QUADRO_TOTAL'
      FixedChar = True
      Size = 1
    end
    object qryNFTX_HISTORICO: TMemoField
      FieldName = 'TX_HISTORICO'
      BlobType = ftMemo
    end
    object qryNFNM_ESPECIE: TStringField
      FieldName = 'NM_ESPECIE'
      FixedChar = True
      Size = 100
    end
    object qryNFTX_OBS: TMemoField
      FieldName = 'TX_OBS'
      BlobType = ftMemo
    end
    object qryNFVL_RETENCAO: TFloatField
      FieldName = 'VL_RETENCAO'
    end
    object qryNFNM_VIA: TStringField
      FieldName = 'NM_VIA'
      FixedChar = True
      Size = 30
    end
    object qryNFCNPJ_UNID: TStringField
      FieldName = 'CNPJ_UNID'
      FixedChar = True
      Size = 28
    end
    object qryNFEND_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qryNFEND_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qryNFEND_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qryNFEND_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qryNFEND_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qryNFIE_UNID_NEG: TStringField
      FieldName = 'IE_UNID_NEG'
      FixedChar = True
    end
    object qryNFIM_UNID_NEG: TStringField
      FieldName = 'IM_UNID_NEG'
      FixedChar = True
    end
    object qryNFFONE_UNID: TStringField
      FieldName = 'FONE_UNID'
      FixedChar = True
      Size = 26
    end
    object qryNFEND_CEP: TStringField
      FieldName = 'END_CEP'
      FixedChar = True
      Size = 8
    end
    object qryNFNR_FAX1: TStringField
      FieldName = 'NR_FAX1'
      FixedChar = True
    end
    object qryNFNR_FAX2: TStringField
      FieldName = 'NR_FAX2'
      FixedChar = True
    end
    object qryNFCLI: TStringField
      FieldName = 'CLI'
      FixedChar = True
      Size = 50
    end
    object qryNFCLI_END: TStringField
      FieldName = 'CLI_END'
      FixedChar = True
      Size = 50
    end
    object qryNFCLI_NUM: TStringField
      FieldName = 'CLI_NUM'
      FixedChar = True
      Size = 6
    end
    object qryNFCLI_CID: TStringField
      FieldName = 'CLI_CID'
      FixedChar = True
      Size = 30
    end
    object qryNFCLI_BAIRRO: TStringField
      FieldName = 'CLI_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qryNFCLI_UF: TStringField
      FieldName = 'CLI_UF'
      FixedChar = True
      Size = 2
    end
    object qryNFCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      FixedChar = True
      Size = 9
    end
    object qryNFCNPJ_EMP: TStringField
      FieldName = 'CNPJ_EMP'
      FixedChar = True
      Size = 28
    end
    object qryNFIE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
      FixedChar = True
    end
    object qryNFNM_AREA: TStringField
      FieldName = 'NM_AREA'
      FixedChar = True
      Size = 50
    end
    object qryNFNM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qryNFNM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
    end
    object qryNFORIGEM: TStringField
      FieldName = 'ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qryNFDESTINO: TStringField
      FieldName = 'DESTINO'
      FixedChar = True
      Size = 50
    end
    object qryNFTP_TIPO_FAT: TStringField
      FieldName = 'TP_TIPO_FAT'
      FixedChar = True
      Size = 1
    end
    object qryNFNR_NF_SERV: TStringField
      FieldName = 'NR_NF_SERV'
      FixedChar = True
      Size = 6
    end
    object qryNFNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 60
    end
    object qryNFIN_EXP_NF: TStringField
      FieldName = 'IN_EXP_NF'
      FixedChar = True
      Size = 1
    end
    object qryNFAREA: TStringField
      FieldName = 'AREA'
      FixedChar = True
      Size = 60
    end
    object qryNFCALC_RETENCAO: TFloatField
      FieldName = 'CALC_RETENCAO'
    end
    object qryNFTP_VIA: TStringField
      FieldName = 'TP_VIA'
      FixedChar = True
      Size = 1
    end
    object qryNFCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryNFNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 50
    end
    object qryNFVL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
    end
    object qryNFIN_COLUNA: TStringField
      FieldName = 'IN_COLUNA'
      FixedChar = True
      Size = 1
    end
    object qryNFNR_ORDEM_FAT: TIntegerField
      FieldName = 'NR_ORDEM_FAT'
    end
    object qryNFCALCITEM: TStringField
      FieldName = 'CALCITEM'
      FixedChar = True
      Size = 50
    end
    object qryNFVLCLIENTE: TFloatField
      FieldName = 'VLCLIENTE'
    end
    object qryNFVLINDAIA: TFloatField
      FieldName = 'VLINDAIA'
    end
    object qryNFVLSERVICO: TFloatField
      FieldName = 'VLSERVICO'
    end
    object qryNFVOLUME: TStringField
      FieldName = 'VOLUME'
      FixedChar = True
      Size = 131
    end
    object qryNFVL_TOT_NUM: TFloatField
      FieldName = 'VL_TOT_NUM'
    end
    object qryNFNM_IR: TStringField
      FieldName = 'NM_IR'
      FixedChar = True
      Size = 25
    end
    object qryNFNM_SALDO: TStringField
      FieldName = 'NM_SALDO'
      FixedChar = True
      Size = 10
    end
    object qryNFVL_SALDO: TFloatField
      FieldName = 'VL_SALDO'
    end
    object qryNFNM_RETENCAO: TStringField
      FieldName = 'NM_RETENCAO'
      FixedChar = True
      Size = 30
    end
    object qryNFCALC_RETENCAO2: TFloatField
      FieldName = 'CALC_RETENCAO2'
    end
    object qryNFNM_COFINS_PREVIEW: TStringField
      FieldName = 'NM_COFINS_PREVIEW'
      FixedChar = True
      Size = 50
    end
    object qryNFPREVIEW: TStringField
      FieldName = 'PREVIEW'
      FixedChar = True
    end
    object qryNFVL_IR_RETIDO: TFloatField
      FieldName = 'VL_IR_RETIDO'
    end
    object qryNFVL_COFINS_RETIDO: TFloatField
      FieldName = 'VL_COFINS_RETIDO'
    end
    object qryNFTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object qryNFNM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qryNFLBL_EXPORTADOR: TStringField
      FieldName = 'LBL_EXPORTADOR'
      FixedChar = True
      Size = 10
    end
    object qryNFNM_EXPORTADOR: TStringField
      FieldName = 'NM_EXPORTADOR'
      FixedChar = True
      Size = 100
    end
    object qryNFDT_DESEMBARACAO: TStringField
      FieldName = 'DT_DESEMBARACAO'
      FixedChar = True
      Size = 30
    end
  end
  object dsNF: TDataSource
    DataSet = qryNF
    Left = 637
    Top = 312
  end
  object BDENF: TppBDEPipeline
    DataSource = dsNF
    UserName = 'BDENF'
    Left = 639
    Top = 346
    object BDENFppField1: TppField
      FieldAlias = 'calcUNEnd'
      FieldName = 'calcUNEnd'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object BDENFppField2: TppField
      FieldAlias = 'calcUNBairro'
      FieldName = 'calcUNBairro'
      FieldLength = 100
      DisplayWidth = 100
      Position = 1
    end
    object BDENFppField3: TppField
      FieldAlias = 'calcUNIE'
      FieldName = 'calcUNIE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object BDENFppField4: TppField
      FieldAlias = 'calcUNFax'
      FieldName = 'calcUNFax'
      FieldLength = 100
      DisplayWidth = 100
      Position = 3
    end
    object BDENFppField5: TppField
      FieldAlias = 'calcEmissao'
      FieldName = 'calcEmissao'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object BDENFppField6: TppField
      FieldAlias = 'calcENEnd'
      FieldName = 'calcENEnd'
      FieldLength = 150
      DisplayWidth = 150
      Position = 5
    end
    object BDENFppField7: TppField
      FieldAlias = 'calcENIE'
      FieldName = 'calcENIE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object BDENFppField8: TppField
      FieldAlias = 'calcNrDocto'
      FieldName = 'calcNrDocto'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object BDENFppField9: TppField
      FieldAlias = 'calcCol1'
      FieldName = 'calcCol1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
    object BDENFppField10: TppField
      FieldAlias = 'calcCol2'
      FieldName = 'calcCol2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 9
    end
    object BDENFppField11: TppField
      FieldAlias = 'CD_UNID_NEG'
      FieldName = 'CD_UNID_NEG'
      FieldLength = 2
      DisplayWidth = 2
      Position = 10
    end
    object BDENFppField12: TppField
      FieldAlias = 'CD_PRODUTO'
      FieldName = 'CD_PRODUTO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 11
    end
    object BDENFppField13: TppField
      FieldAlias = 'NR_SOLICITACAO'
      FieldName = 'NR_SOLICITACAO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 12
    end
    object BDENFppField14: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 13
    end
    object BDENFppField15: TppField
      FieldAlias = 'NR_PROC'
      FieldName = 'NR_PROC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
    object BDENFppField16: TppField
      FieldAlias = 'DT_EMISSAO'
      FieldName = 'DT_EMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 15
    end
    object BDENFppField17: TppField
      FieldAlias = 'DT_VENCIMENTO'
      FieldName = 'DT_VENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 16
    end
    object BDENFppField18: TppField
      FieldAlias = 'NR_RELATORIO'
      FieldName = 'NR_RELATORIO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 17
    end
    object BDENFppField19: TppField
      FieldAlias = 'NR_ANO'
      FieldName = 'NR_ANO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 18
    end
    object BDENFppField20: TppField
      FieldAlias = 'NM_REFERENCIA'
      FieldName = 'NM_REFERENCIA'
      FieldLength = 200
      DisplayWidth = 200
      Position = 19
    end
    object BDENFppField21: TppField
      FieldAlias = 'NM_NAT_DESPACHO'
      FieldName = 'NM_NAT_DESPACHO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 20
    end
    object BDENFppField22: TppField
      FieldAlias = 'NM_VEICULO'
      FieldName = 'NM_VEICULO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 21
    end
    object BDENFppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'QT_EMBALAGEM'
      FieldName = 'QT_EMBALAGEM'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 22
    end
    object BDENFppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_BRUTO'
      FieldName = 'VL_PESO_BRUTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object BDENFppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PESO_LIQUIDO'
      FieldName = 'VL_PESO_LIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object BDENFppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_FOB'
      FieldName = 'VL_FOB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object BDENFppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_CIF'
      FieldName = 'VL_CIF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object BDENFppField28: TppField
      FieldAlias = 'NR_DI'
      FieldName = 'NR_DI'
      FieldLength = 15
      DisplayWidth = 15
      Position = 27
    end
    object BDENFppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_NAO_TRIBUTAVEL'
      FieldName = 'VL_TOT_NAO_TRIBUTAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object BDENFppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_SUB_TOT_TRIBUTAVEL'
      FieldName = 'VL_SUB_TOT_TRIBUTAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object BDENFppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_COMISSAO'
      FieldName = 'VL_COMISSAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object BDENFppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_GERAL'
      FieldName = 'VL_TOT_GERAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object BDENFppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_TRIBUTAVEL'
      FieldName = 'VL_TOT_TRIBUTAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object BDENFppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_IR'
      FieldName = 'VL_IR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object BDENFppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_ISS'
      FieldName = 'VL_ISS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object BDENFppField36: TppField
      FieldAlias = 'CD_EMISSOR'
      FieldName = 'CD_EMISSOR'
      FieldLength = 4
      DisplayWidth = 4
      Position = 35
    end
    object BDENFppField37: TppField
      FieldAlias = 'IN_QUADRO_TOTAL'
      FieldName = 'IN_QUADRO_TOTAL'
      FieldLength = 1
      DisplayWidth = 1
      Position = 36
    end
    object BDENFppField38: TppField
      FieldAlias = 'TX_HISTORICO'
      FieldName = 'TX_HISTORICO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 37
      Searchable = False
      Sortable = False
    end
    object BDENFppField39: TppField
      FieldAlias = 'NM_ESPECIE'
      FieldName = 'NM_ESPECIE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 38
    end
    object BDENFppField40: TppField
      FieldAlias = 'TX_OBS'
      FieldName = 'TX_OBS'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 39
      Searchable = False
      Sortable = False
    end
    object BDENFppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_RETENCAO'
      FieldName = 'VL_RETENCAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object BDENFppField42: TppField
      FieldAlias = 'NM_VIA'
      FieldName = 'NM_VIA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 41
    end
    object BDENFppField43: TppField
      FieldAlias = 'CNPJ_UNID'
      FieldName = 'CNPJ_UNID'
      FieldLength = 28
      DisplayWidth = 28
      Position = 42
    end
    object BDENFppField44: TppField
      FieldAlias = 'END_UNID_NEG'
      FieldName = 'END_UNID_NEG'
      FieldLength = 50
      DisplayWidth = 50
      Position = 43
    end
    object BDENFppField45: TppField
      FieldAlias = 'END_NUMERO'
      FieldName = 'END_NUMERO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 44
    end
    object BDENFppField46: TppField
      FieldAlias = 'END_BAIRRO'
      FieldName = 'END_BAIRRO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 45
    end
    object BDENFppField47: TppField
      FieldAlias = 'END_CIDADE'
      FieldName = 'END_CIDADE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 46
    end
    object BDENFppField48: TppField
      FieldAlias = 'END_UF'
      FieldName = 'END_UF'
      FieldLength = 2
      DisplayWidth = 2
      Position = 47
    end
    object BDENFppField49: TppField
      FieldAlias = 'IE_UNID_NEG'
      FieldName = 'IE_UNID_NEG'
      FieldLength = 20
      DisplayWidth = 20
      Position = 48
    end
    object BDENFppField50: TppField
      FieldAlias = 'IM_UNID_NEG'
      FieldName = 'IM_UNID_NEG'
      FieldLength = 20
      DisplayWidth = 20
      Position = 49
    end
    object BDENFppField51: TppField
      FieldAlias = 'FONE_UNID'
      FieldName = 'FONE_UNID'
      FieldLength = 26
      DisplayWidth = 26
      Position = 50
    end
    object BDENFppField52: TppField
      FieldAlias = 'END_CEP'
      FieldName = 'END_CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 51
    end
    object BDENFppField53: TppField
      FieldAlias = 'NR_FAX1'
      FieldName = 'NR_FAX1'
      FieldLength = 20
      DisplayWidth = 20
      Position = 52
    end
    object BDENFppField54: TppField
      FieldAlias = 'NR_FAX2'
      FieldName = 'NR_FAX2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 53
    end
    object BDENFppField55: TppField
      FieldAlias = 'CLI'
      FieldName = 'CLI'
      FieldLength = 50
      DisplayWidth = 50
      Position = 54
    end
    object BDENFppField56: TppField
      FieldAlias = 'CLI_END'
      FieldName = 'CLI_END'
      FieldLength = 50
      DisplayWidth = 50
      Position = 55
    end
    object BDENFppField57: TppField
      FieldAlias = 'CLI_NUM'
      FieldName = 'CLI_NUM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 56
    end
    object BDENFppField58: TppField
      FieldAlias = 'CLI_CID'
      FieldName = 'CLI_CID'
      FieldLength = 30
      DisplayWidth = 30
      Position = 57
    end
    object BDENFppField59: TppField
      FieldAlias = 'CLI_BAIRRO'
      FieldName = 'CLI_BAIRRO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 58
    end
    object BDENFppField60: TppField
      FieldAlias = 'CLI_UF'
      FieldName = 'CLI_UF'
      FieldLength = 2
      DisplayWidth = 2
      Position = 59
    end
    object BDENFppField61: TppField
      FieldAlias = 'CLI_CEP'
      FieldName = 'CLI_CEP'
      FieldLength = 9
      DisplayWidth = 9
      Position = 60
    end
    object BDENFppField62: TppField
      FieldAlias = 'CNPJ_EMP'
      FieldName = 'CNPJ_EMP'
      FieldLength = 28
      DisplayWidth = 28
      Position = 61
    end
    object BDENFppField63: TppField
      FieldAlias = 'IE_EMPRESA'
      FieldName = 'IE_EMPRESA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 62
    end
    object BDENFppField64: TppField
      FieldAlias = 'NM_AREA'
      FieldName = 'NM_AREA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 63
    end
    object BDENFppField65: TppField
      FieldAlias = 'NM_CONTATO'
      FieldName = 'NM_CONTATO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 64
    end
    object BDENFppField66: TppField
      FieldAlias = 'NM_VIA_TRANSP'
      FieldName = 'NM_VIA_TRANSP'
      FieldLength = 20
      DisplayWidth = 20
      Position = 65
    end
    object BDENFppField67: TppField
      FieldAlias = 'ORIGEM'
      FieldName = 'ORIGEM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 66
    end
    object BDENFppField68: TppField
      FieldAlias = 'DESTINO'
      FieldName = 'DESTINO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 67
    end
    object BDENFppField69: TppField
      FieldAlias = 'TP_TIPO_FAT'
      FieldName = 'TP_TIPO_FAT'
      FieldLength = 1
      DisplayWidth = 1
      Position = 68
    end
    object BDENFppField70: TppField
      FieldAlias = 'NR_NF_SERV'
      FieldName = 'NR_NF_SERV'
      FieldLength = 6
      DisplayWidth = 6
      Position = 69
    end
    object BDENFppField71: TppField
      FieldAlias = 'NM_EMPRESA'
      FieldName = 'NM_EMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 70
    end
    object BDENFppField72: TppField
      FieldAlias = 'IN_EXP_NF'
      FieldName = 'IN_EXP_NF'
      FieldLength = 1
      DisplayWidth = 1
      Position = 71
    end
    object BDENFppField73: TppField
      FieldAlias = 'AREA'
      FieldName = 'AREA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 72
    end
    object BDENFppField74: TppField
      Alignment = taRightJustify
      FieldAlias = 'CALC_RETENCAO'
      FieldName = 'CALC_RETENCAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 73
    end
    object BDENFppField75: TppField
      FieldAlias = 'TP_VIA'
      FieldName = 'TP_VIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 74
    end
    object BDENFppField76: TppField
      FieldAlias = 'CD_ITEM'
      FieldName = 'CD_ITEM'
      FieldLength = 3
      DisplayWidth = 3
      Position = 75
    end
    object BDENFppField77: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 76
    end
    object BDENFppField78: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_ITEM'
      FieldName = 'VL_ITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 77
    end
    object BDENFppField79: TppField
      FieldAlias = 'IN_COLUNA'
      FieldName = 'IN_COLUNA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 78
    end
    object BDENFppField80: TppField
      Alignment = taRightJustify
      FieldAlias = 'NR_ORDEM_FAT'
      FieldName = 'NR_ORDEM_FAT'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 79
    end
    object BDENFppField81: TppField
      FieldAlias = 'CALCITEM'
      FieldName = 'CALCITEM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 80
    end
    object BDENFppField82: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLCLIENTE'
      FieldName = 'VLCLIENTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 81
    end
    object BDENFppField83: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLINDAIA'
      FieldName = 'VLINDAIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 82
    end
    object BDENFppField84: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLSERVICO'
      FieldName = 'VLSERVICO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 83
    end
    object BDENFppField85: TppField
      FieldAlias = 'VOLUME'
      FieldName = 'VOLUME'
      FieldLength = 131
      DisplayWidth = 131
      Position = 84
    end
    object BDENFppField86: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_TOT_NUM'
      FieldName = 'VL_TOT_NUM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 85
    end
    object BDENFppField87: TppField
      FieldAlias = 'NM_IR'
      FieldName = 'NM_IR'
      FieldLength = 25
      DisplayWidth = 25
      Position = 86
    end
    object BDENFppField88: TppField
      FieldAlias = 'NM_SALDO'
      FieldName = 'NM_SALDO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 87
    end
    object BDENFppField89: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_SALDO'
      FieldName = 'VL_SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 88
    end
    object BDENFppField90: TppField
      FieldAlias = 'NM_RETENCAO'
      FieldName = 'NM_RETENCAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 89
    end
    object BDENFppField91: TppField
      Alignment = taRightJustify
      FieldAlias = 'CALC_RETENCAO2'
      FieldName = 'CALC_RETENCAO2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 90
    end
    object BDENFppField92: TppField
      FieldAlias = 'NM_COFINS_PREVIEW'
      FieldName = 'NM_COFINS_PREVIEW'
      FieldLength = 50
      DisplayWidth = 50
      Position = 91
    end
    object BDENFppField93: TppField
      FieldAlias = 'PREVIEW'
      FieldName = 'PREVIEW'
      FieldLength = 20
      DisplayWidth = 20
      Position = 92
    end
    object BDENFppField94: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_IR_RETIDO'
      FieldName = 'VL_IR_RETIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 93
    end
    object BDENFppField95: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_COFINS_RETIDO'
      FieldName = 'VL_COFINS_RETIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 94
    end
    object BDENFppField96: TppField
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 95
    end
    object BDENFppField97: TppField
      FieldAlias = 'NM_AGENTE'
      FieldName = 'NM_AGENTE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 96
    end
    object BDENFppField98: TppField
      FieldAlias = 'LBL_EXPORTADOR'
      FieldName = 'LBL_EXPORTADOR'
      FieldLength = 20
      DisplayWidth = 20
      Position = 97
    end
    object BDENFppField99: TppField
      FieldAlias = 'NM_EXPORTADOR'
      FieldName = 'NM_EXPORTADOR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 98
    end
    object BDENFppField100: TppField
      FieldAlias = 'DT_DESEMBARACAO'
      FieldName = 'DT_DESEMBARACAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 99
    end
  end
  object BDENumerario: TppBDEPipeline
    DataSource = dsNumerario
    SkipWhenNoRecords = False
    UserName = 'BDENumerario'
    Left = 678
    Top = 347
    MasterDataPipelineName = 'BDENF'
    object BDENFItemppField1: TppField
      FieldAlias = 'CD_UNID_NEG'
      FieldName = 'CD_UNID_NEG'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object BDENFItemppField2: TppField
      FieldAlias = 'CD_PRODUTO'
      FieldName = 'CD_PRODUTO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object BDENFItemppField3: TppField
      FieldAlias = 'NR_SOLICITACAO'
      FieldName = 'NR_SOLICITACAO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 2
    end
    object BDENFItemppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_NUM'
      FieldName = 'VL_NUM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object BDENFItemppField5: TppField
      FieldAlias = 'DT_NUM'
      FieldName = 'DT_NUM'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object BDENFItemppField6: TppField
      FieldAlias = 'NR_FP'
      FieldName = 'NR_FP'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object BDENFItemppField7: TppField
      FieldAlias = 'FP'
      FieldName = 'FP'
      FieldLength = 16
      DisplayWidth = 16
      Position = 6
    end
  end
  object dsNumerario: TDataSource
    DataSet = qryNumerario
    Left = 678
    Top = 315
  end
  object qryNumerario: TQuery
    OnCalcFields = qryNFCalcFields
    DatabaseName = 'DBBROKER'
    DataSource = dsNF
    SQL.Strings = (
      'SELECT N.CD_UNID_NEG, '
      '       N.CD_PRODUTO,'
      '       N.NR_SOLICITACAO,'
      '       N.VL_NUM,'
      '       N.DT_NUM,'
      '       N.NR_FP,'
      '       CASE ISNULL(N.NR_FP, '#39#39')'
      '         WHEN '#39#39' THEN '#39#39
      '         ELSE '#39'F.P.: '#39' + RTRIM(LTRIM(N.NR_FP))'
      '       END AS FP  '
      '  FROM TNF_SERV_OP_NUM N (NOLOCK)'
      ' WHERE N.CD_UNID_NEG    = :CD_UNID_NEG AND'
      '       N.CD_PRODUTO     = :CD_PRODUTO AND'
      '       N.NR_SOLICITACAO = :NR_SOLICITACAO'
      ' ORDER BY N.DT_NUM')
    Left = 676
    Top = 280
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptInput
        Size = 3
      end
      item
        DataType = ftFixedChar
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
        Size = 7
      end>
    object qryNumerarioCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qryNumerarioCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryNumerarioNR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      FixedChar = True
      Size = 6
    end
    object qryNumerarioVL_NUM: TFloatField
      FieldName = 'VL_NUM'
    end
    object qryNumerarioDT_NUM: TDateTimeField
      FieldName = 'DT_NUM'
    end
    object qryNumerarioNR_FP: TStringField
      FieldName = 'NR_FP'
      FixedChar = True
      Size = 10
    end
    object qryNumerarioFP: TStringField
      FieldName = 'FP'
      FixedChar = True
      Size = 16
    end
  end
  object qryNotasSG: TQuery
    OnCalcFields = qryNFCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT F.NR_SOLICITACAO, F.CD_UNID_NEG, F.CD_PRODUTO '
      'FROM TS_FATURA F'
      
        'INNER JOIN TS_FATURA_PROCESSO FP ON F.CD_UNID_NEG = FP.CD_UNID_N' +
        'EG AND F.CD_PRODUTO = FP.CD_PRODUTO AND F.NR_SOLICITACAO = FP.NR' +
        '_SOLICITACAO'
      'INNER JOIN TPROCESSO P ON P.NR_PROCESSO = FP.NR_PROCESSO'
      'WHERE F.TP_TIPO_FAT = '#39'F'#39
      'AND YEAR(F.DT_NF_SERV) = :DATA '
      'AND MONTH(F.DT_NF_SERV) IN (10,11,12)'
      'AND F.IN_CANCELADO = '#39'0'#39
      'AND P.CD_GRUPO IN ('#39'028'#39', '#39'906'#39', '#39'923'#39')')
    Left = 516
    Top = 334
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DATA'
        ParamType = ptInput
      end>
    object qryNotasSGNR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      FixedChar = True
      Size = 6
    end
    object qryNotasSGCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qryNotasSGCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
  end
  object qry_processos: TQuery
    OnCalcFields = qryNFCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO'
      'FROM TS_FATURA_PROCESSO'
      'WHERE NR_SOLICITACAO = :NR_SOLICITACAO'
      '    AND CD_UNID_NEG = :CD_UNID_NEG'
      '    AND CD_PRODUTO  = :CD_PRODUTO')
    Left = 428
    Top = 310
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
    object qry_processosNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TS_FATURA_PROCESSO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
  end
end

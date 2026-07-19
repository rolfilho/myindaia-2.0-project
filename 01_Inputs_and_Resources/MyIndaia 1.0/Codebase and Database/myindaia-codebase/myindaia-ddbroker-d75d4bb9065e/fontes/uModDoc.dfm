object frm_mod_doc: Tfrm_mod_doc
  Left = 345
  Top = 106
  Width = 750
  Height = 645
  Caption = 'Modelos de Documentos'
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
  object pnl_btn_ag: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      734
      49)
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 3
      Width = 40
      Height = 43
      Hint = 'Incluir'
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
    object btn_excluir: TSpeedButton
      Left = 124
      Top = 3
      Width = 40
      Height = 43
      Hint = 'Excluir'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_excluirClick
    end
    object btn_sair: TSpeedButton
      Left = 398
      Top = 3
      Width = 40
      Height = 43
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
    object btn_salvar: TSpeedButton
      Left = 44
      Top = 3
      Width = 40
      Height = 43
      Hint = 'Salvar'
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
    object btn_cancelar: TSpeedButton
      Left = 84
      Top = 3
      Width = 40
      Height = 43
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
      OnClick = btn_cancelarClick
    end
    object Label1: TLabel
      Left = 444
      Top = 7
      Width = 56
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 580
      Top = 7
      Width = 37
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Ordem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbnvg: TDBNavigator
      Left = 282
      Top = 11
      Width = 104
      Height = 26
      DataSource = datm_mod_doc.ds_modelo_doc
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
    end
    object edt_chave: TEdit
      Left = 445
      Top = 20
      Width = 129
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object cb_ordem: TComboBox
      Left = 581
      Top = 20
      Width = 153
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
    end
  end
  object pgctrl_documento: TPageControl
    Left = 0
    Top = 49
    Width = 734
    Height = 538
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_documentoChange
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 52
        Width = 726
        Height = 458
        Align = alClient
        DataSource = datm_mod_doc.ds_modelo_doc
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_MODULO'
            Title.Caption = 'Modulo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIAO'
            Title.Caption = 'Documento'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_PATH'
            Title.Caption = 'Path'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 242
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_DOCUMENTO'
            Title.Caption = 'Data'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 70
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 52
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label55: TLabel
          Left = 10
          Top = 9
          Width = 56
          Height = 13
          AutoSize = False
          Caption = 'Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_unid_neg: TSpeedButton
          Left = 494
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
          OnClick = btn_co_unid_negClick
        end
        object edt_nm_unid_neg: TEdit
          Left = 40
          Top = 22
          Width = 453
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object msk_cd_unid_neg: TMaskEdit
          Left = 11
          Top = 22
          Width = 30
          Height = 21
          EditMask = '99;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 0
          OnChange = btn_co_unid_negClick
          OnExit = msk_cd_unid_negExit
        end
      end
    end
    object ts_dados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      object Label3: TLabel
        Left = 16
        Top = 13
        Width = 56
        Height = 13
        AutoSize = False
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 16
        Top = 51
        Width = 56
        Height = 13
        AutoSize = False
        Caption = 'Modulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_modulo: TSpeedButton
        Left = 337
        Top = 64
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
        OnClick = btn_co_moduloClick
      end
      object Label5: TLabel
        Left = 16
        Top = 91
        Width = 71
        Height = 13
        AutoSize = False
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 380
        Top = 91
        Width = 71
        Height = 13
        AutoSize = False
        Caption = 'Path'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 380
        Top = 51
        Width = 109
        Height = 13
        AutoSize = False
        Caption = 'Via de Transporte'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 692
        Top = 64
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
        OnClick = SpeedButton1Click
      end
      object Label8: TLabel
        Left = 380
        Top = 13
        Width = 56
        Height = 13
        AutoSize = False
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton2: TSpeedButton
        Left = 692
        Top = 25
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
        OnClick = SpeedButton2Click
      end
      object Label9: TLabel
        Left = 16
        Top = 128
        Width = 188
        Height = 13
        AutoSize = False
        Caption = 'Tipo de Documento Digitalizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaTipoDocto: TSpeedButton
        Left = 336
        Top = 141
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
        OnClick = btnConsultaTipoDoctoClick
      end
      object DBEdit15: TDBEdit
        Left = 49
        Top = 26
        Width = 313
        Height = 21
        Color = clMenu
        DataField = 'NM_UNID_NEG'
        DataSource = datm_mod_doc.ds_modelo_doc
        ReadOnly = True
        TabOrder = 7
      end
      object dbedt_nm_rotina: TDBEdit
        Left = 60
        Top = 65
        Width = 276
        Height = 21
        Color = clMenu
        DataField = 'NM_ROTINA'
        DataSource = datm_mod_doc.ds_modelo_doc
        ReadOnly = True
        TabOrder = 8
      end
      object dbedt_cd_modulo: TDBEdit
        Left = 16
        Top = 65
        Width = 45
        Height = 21
        DataField = 'CD_MODULO'
        DataSource = datm_mod_doc.ds_modelo_doc
        TabOrder = 1
        OnChange = dbedt_descricaoChange
        OnExit = dbedt_cd_moduloExit
        OnKeyDown = dbedt_cd_moduloKeyDown
      end
      object dbedt_descricao: TDBEdit
        Left = 16
        Top = 104
        Width = 347
        Height = 21
        DataField = 'DESCRIAO'
        DataSource = datm_mod_doc.ds_modelo_doc
        TabOrder = 3
        OnChange = dbedt_descricaoChange
      end
      object file_path: TFilenameEdit
        Left = 380
        Top = 104
        Width = 338
        Height = 21
        Filter = 'Rtm (*.rtm)|*.rtm'
        NumGlyphs = 1
        TabOrder = 4
        OnClick = file_pathClick
        OnEnter = file_pathEnter
        OnExit = file_pathExit
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 167
        Width = 703
        Height = 279
        Caption = 'Fitros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object btn_co_emp_nac: TSpeedButton
          Left = 665
          Top = 88
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
          OnClick = btn_co_emp_nacClick
        end
        object btn_co_emp_est: TSpeedButton
          Left = 665
          Top = 115
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
          OnClick = btn_co_emp_estClick
        end
        object btn_co_agente: TSpeedButton
          Left = 665
          Top = 142
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
          OnClick = btn_co_agenteClick
        end
        object btn_co_cia: TSpeedButton
          Left = 665
          Top = 169
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
          OnClick = btn_co_ciaClick
        end
        object btn_co_armador: TSpeedButton
          Left = 665
          Top = 196
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
          OnClick = btn_co_armadorClick
        end
        object btn_co_comissaria: TSpeedButton
          Left = 665
          Top = 223
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
          OnClick = btn_co_comissariaClick
        end
        object btnConsGrupo: TSpeedButton
          Left = 665
          Top = 61
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
          OnClick = btnConsGrupoClick
        end
        object btn_co_estufagem: TSpeedButton
          Left = 665
          Top = 252
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
          OnClick = btn_co_estufagemClick
        end
        object dbedt_nm_emp_nac: TDBEdit
          Left = 228
          Top = 89
          Width = 435
          Height = 22
          AutoSize = False
          Color = clMenu
          Ctl3D = False
          DataField = 'NM_EMP_NAC'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_nm_emp_est: TDBEdit
          Left = 228
          Top = 116
          Width = 435
          Height = 22
          AutoSize = False
          Color = clMenu
          Ctl3D = False
          DataField = 'NM_EMP_EST'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_nm_agente: TDBEdit
          Left = 228
          Top = 143
          Width = 435
          Height = 22
          AutoSize = False
          Color = clMenu
          Ctl3D = False
          DataField = 'NM_AGENTE'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nm_cia: TDBEdit
          Left = 228
          Top = 170
          Width = 435
          Height = 22
          AutoSize = False
          Color = clMenu
          Ctl3D = False
          DataField = 'NM_CIA'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_nm_armador: TDBEdit
          Left = 228
          Top = 197
          Width = 435
          Height = 22
          AutoSize = False
          Color = clMenu
          Ctl3D = False
          DataField = 'NM_ARMADOR'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_nm_comissaria: TDBEdit
          Left = 228
          Top = 224
          Width = 435
          Height = 22
          AutoSize = False
          Color = clMenu
          Ctl3D = False
          DataField = 'NM_COMISSARIA'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 6
        end
        object check_emp_nac: TDBCheckBox
          Left = 17
          Top = 98
          Width = 161
          Height = 17
          Caption = 'Empresa Nacional'
          DataField = 'IN_EMP_NAC'
          DataSource = datm_mod_doc.ds_modelo_doc
          TabOrder = 9
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = check_emp_nacClick
        end
        object dbedt_cd_emp_nac: TDBEdit
          Left = 179
          Top = 88
          Width = 48
          Height = 24
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          DataField = 'CD_EMP_NAC'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          TabOrder = 10
          OnChange = dbedt_descricaoChange
          OnExit = dbedt_cd_emp_nacExit
          OnKeyDown = dbedt_cd_moduloKeyDown
        end
        object check_emp_est: TDBCheckBox
          Left = 17
          Top = 124
          Width = 161
          Height = 17
          Caption = 'Empresa Estrangeira'
          DataField = 'IN_EMP_EST'
          DataSource = datm_mod_doc.ds_modelo_doc
          TabOrder = 11
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = check_emp_estClick
        end
        object dbedt_cd_emp_est: TDBEdit
          Left = 179
          Top = 115
          Width = 48
          Height = 24
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          DataField = 'CD_EMP_EST'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          TabOrder = 12
          OnChange = dbedt_descricaoChange
          OnExit = dbedt_cd_emp_estExit
          OnKeyDown = dbedt_cd_moduloKeyDown
        end
        object check_agente: TDBCheckBox
          Left = 17
          Top = 151
          Width = 161
          Height = 17
          Caption = 'Agente'
          DataField = 'IN_AGENTE'
          DataSource = datm_mod_doc.ds_modelo_doc
          TabOrder = 13
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = check_agenteClick
        end
        object dbedt_cd_agente: TDBEdit
          Left = 179
          Top = 142
          Width = 48
          Height = 24
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          DataField = 'CD_AGENTE'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          TabOrder = 14
          OnChange = dbedt_descricaoChange
          OnExit = dbedt_cd_agenteExit
          OnKeyDown = dbedt_cd_moduloKeyDown
        end
        object check_cia: TDBCheckBox
          Left = 17
          Top = 177
          Width = 161
          Height = 17
          Caption = 'Companhia Aerea'
          DataField = 'IN_CIA'
          DataSource = datm_mod_doc.ds_modelo_doc
          TabOrder = 15
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = check_ciaClick
        end
        object dbedt_cd_cia: TDBEdit
          Left = 179
          Top = 169
          Width = 48
          Height = 24
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          DataField = 'CD_CIA'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          TabOrder = 16
          OnChange = dbedt_descricaoChange
          OnExit = dbedt_cd_ciaExit
          OnKeyDown = dbedt_cd_moduloKeyDown
        end
        object check_armador: TDBCheckBox
          Left = 17
          Top = 203
          Width = 161
          Height = 17
          Caption = 'Armador'
          DataField = 'IN_ARMADOR'
          DataSource = datm_mod_doc.ds_modelo_doc
          TabOrder = 17
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = check_armadorClick
        end
        object dbedt_cd_armador: TDBEdit
          Left = 179
          Top = 196
          Width = 48
          Height = 24
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          DataField = 'CD_ARMADOR'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          TabOrder = 18
          OnChange = dbedt_descricaoChange
          OnExit = dbedt_cd_armadorExit
          OnKeyDown = dbedt_cd_moduloKeyDown
        end
        object check_comissaria: TDBCheckBox
          Left = 17
          Top = 229
          Width = 161
          Height = 17
          Caption = 'Comissaria'
          DataField = 'IN_COMISSARIA'
          DataSource = datm_mod_doc.ds_modelo_doc
          TabOrder = 19
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = check_comissariaClick
        end
        object dbedt_cd_comissaria: TDBEdit
          Left = 179
          Top = 223
          Width = 48
          Height = 24
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          DataField = 'CD_COMISSARIA'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          TabOrder = 20
          OnChange = dbedt_descricaoChange
          OnExit = dbedt_cd_comissariaExit
          OnKeyDown = dbedt_cd_moduloKeyDown
        end
        object DBCheckBox7: TDBCheckBox
          Left = 17
          Top = 43
          Width = 161
          Height = 17
          Caption = 'Default'
          DataField = 'IN_DAFAULT'
          DataSource = datm_mod_doc.ds_modelo_doc
          TabOrder = 21
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_descricaoChange
        end
        object DBCheckBox1: TDBCheckBox
          Left = 17
          Top = 17
          Width = 161
          Height = 17
          Caption = 'Por Processo'
          Ctl3D = True
          DataField = 'IN_PROCESSO'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          TabOrder = 22
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_descricaoChange
        end
        object dbchkGrupo: TDBCheckBox
          Left = 17
          Top = 71
          Width = 161
          Height = 17
          Caption = 'Grupo de Empresa'
          DataField = 'IN_GRUPO'
          DataSource = datm_mod_doc.ds_modelo_doc
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchkGrupoClick
        end
        object dbedtCodGrupo: TDBEdit
          Left = 179
          Top = 61
          Width = 48
          Height = 24
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          DataField = 'CD_GRUPO'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          TabOrder = 8
          OnChange = dbedt_descricaoChange
          OnExit = dbedtCodGrupoExit
          OnKeyDown = dbedt_cd_moduloKeyDown
        end
        object dbedtNomeGrupo: TDBEdit
          Left = 228
          Top = 62
          Width = 435
          Height = 22
          AutoSize = False
          Color = clMenu
          Ctl3D = False
          DataField = 'NM_GRUPO'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
        end
        object check_estufagem: TDBCheckBox
          Left = 18
          Top = 255
          Width = 161
          Height = 17
          Caption = 'Estufagem'
          DataField = 'IN_ESTUFAGEM'
          DataSource = datm_mod_doc.ds_modelo_doc
          TabOrder = 23
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = check_estufagemClick
        end
        object dbedt_cd_estufagem: TDBEdit
          Left = 179
          Top = 251
          Width = 48
          Height = 24
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkSoft
          Ctl3D = False
          DataField = 'CD_ESTUFAGEM'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          TabOrder = 24
          OnChange = dbedt_descricaoChange
          OnExit = dbedt_cd_estufagemExit
          OnKeyDown = dbedt_cd_moduloKeyDown
        end
        object dbedt_nm_estufagem: TDBEdit
          Left = 228
          Top = 252
          Width = 435
          Height = 22
          AutoSize = False
          Color = clMenu
          Ctl3D = False
          DataField = 'NM_ESTUFAGEM'
          DataSource = datm_mod_doc.ds_modelo_doc
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 25
        end
      end
      object dbedt_nm_via_transp: TDBEdit
        Left = 413
        Top = 65
        Width = 278
        Height = 21
        Color = clMenu
        DataField = 'NM_VIA_TRANSP'
        DataSource = datm_mod_doc.ds_modelo_doc
        ReadOnly = True
        TabOrder = 9
      end
      object dbedt_nm_produto: TDBEdit
        Left = 413
        Top = 26
        Width = 278
        Height = 21
        Color = clMenu
        DataField = 'NM_PRODUTO'
        DataSource = datm_mod_doc.ds_modelo_doc
        ReadOnly = True
        TabOrder = 10
      end
      object dbedt_cd_produto: TDBEdit
        Left = 380
        Top = 26
        Width = 34
        Height = 21
        DataField = 'CD_PRODUTO'
        DataSource = datm_mod_doc.ds_modelo_doc
        TabOrder = 0
        OnChange = dbedt_descricaoChange
        OnExit = dbedt_cd_produtoExit
        OnKeyDown = dbedt_cd_moduloKeyDown
      end
      object dbedt_cd_unid_neg: TDBEdit
        Left = 16
        Top = 26
        Width = 34
        Height = 21
        Color = clMenu
        DataField = 'CD_UNID_NEG'
        DataSource = datm_mod_doc.ds_modelo_doc
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_cd_via_transp: TDBEdit
        Left = 380
        Top = 65
        Width = 34
        Height = 21
        DataField = 'CD_VIA_TRANSP'
        DataSource = datm_mod_doc.ds_modelo_doc
        TabOrder = 2
        OnChange = dbedt_descricaoChange
        OnExit = dbedt_cd_via_transpExit
        OnKeyDown = dbedt_cd_moduloKeyDown
      end
      object dbedt_cd_tipo_docto: TDBEdit
        Left = 16
        Top = 142
        Width = 34
        Height = 21
        DataField = 'CD_TIPO_DOCTO'
        DataSource = datm_mod_doc.ds_modelo_doc
        TabOrder = 11
        OnChange = dbedt_cd_tipo_doctoChange
        OnExit = dbedt_cd_tipo_doctoExit
        OnKeyDown = dbedt_cd_moduloKeyDown
      end
      object edt_nm_tipo_docto: TEdit
        Left = 50
        Top = 142
        Width = 285
        Height = 21
        Color = clMenu
        ReadOnly = True
        TabOrder = 12
        Text = 'edt_nm_tipo_docto'
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 557
    Top = 381
    object mi_Incluir: TMenuItem
      Caption = '&Incluir'
    end
    object mi_Salvar: TMenuItem
      Caption = '&Salvar'
    end
    object mi_Cancelar: TMenuItem
      Caption = '&Cancelar'
    end
    object mi_Excluir: TMenuItem
      Caption = '&Excluir'
    end
    object TMenuItem
    end
    object mi_Sair: TMenuItem
      Caption = 'Sai&r'
    end
  end
end

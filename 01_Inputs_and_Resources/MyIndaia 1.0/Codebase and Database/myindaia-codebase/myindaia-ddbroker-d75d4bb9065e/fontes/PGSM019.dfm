object frm_Transportador_itl: Tfrm_Transportador_itl
  Left = 143
  Top = 114
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Transportador Internacional'
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 24
    Top = 235
    Width = 58
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Apelido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 51
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      742
      51)
    object btn_novo: TSpeedButton
      Left = 5
      Top = 4
      Width = 38
      Height = 43
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
      OnClick = btn_novoClick
    end
    object btn_excluir: TSpeedButton
      Left = 119
      Top = 4
      Width = 38
      Height = 43
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
      Top = 4
      Width = 38
      Height = 43
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
      Left = 43
      Top = 4
      Width = 38
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
    object btn_cancelar: TSpeedButton
      Left = 81
      Top = 4
      Width = 38
      Height = 43
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
      Left = 445
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
      Left = 581
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
      Top = 13
      Width = 104
      Height = 25
      DataSource = datm_transportador_itl.ds_transp_itl
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      TabOrder = 0
    end
    object edt_chave: TEdit
      Left = 445
      Top = 20
      Width = 129
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnChange = edt_chaveChange
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
      TabStop = False
      OnClick = cb_ordemClick
    end
  end
  object pgctrl: TPageControl
    Left = 0
    Top = 51
    Width = 742
    Height = 453
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 1
    OnChange = pgctrlChange
    OnChanging = pgctrlChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 425
        Align = alClient
        DataSource = datm_transportador_itl.ds_transp_itl
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_cadastroDblClick
        OnKeyPress = dbg_cadastroKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Alignment = taCenter
            Title.Caption = 'Nome'
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
            FieldName = 'APELIDO'
            Title.Alignment = taCenter
            Title.Caption = 'Apelido'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'calc_tp_transportador'
            Title.Caption = 'Tipo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 44
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 425
        Hint = 'Salva os dados'
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label3: TLabel
          Left = 18
          Top = 16
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_local_embarque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 63
          Top = 16
          Width = 58
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_pais: TSpeedButton
          Left = 290
          Top = 210
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
          OnClick = btn_paisClick
        end
        object Label7: TLabel
          Left = 17
          Top = 62
          Width = 77
          Height = 13
          AutoSize = False
          Caption = 'Short Name'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb_sigla: TLabel
          Left = 361
          Top = 62
          Width = 29
          Height = 13
          Caption = 'Sigla'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb_sigla_iata: TLabel
          Left = 447
          Top = 61
          Width = 72
          Height = 13
          Caption = 'C'#243'digo IATA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 18
          Top = 104
          Width = 55
          Height = 13
          Caption = 'Endere'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 17
          Top = 150
          Width = 76
          Height = 13
          Caption = 'Complemento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 275
          Top = 150
          Width = 25
          Height = 13
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 371
          Top = 150
          Width = 40
          Height = 13
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 18
          Top = 196
          Width = 27
          Height = 13
          Caption = 'Pa'#237's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_cd_pais: TSpeedButton
          Left = 635
          Top = 165
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
          OnClick = btn_co_cd_paisClick
        end
        object Label15: TLabel
          Left = 18
          Top = 245
          Width = 66
          Height = 13
          Caption = 'Home Page'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 332
          Top = 197
          Width = 25
          Height = 13
          Caption = 'U.F.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 397
          Top = 197
          Width = 34
          Height = 13
          Caption = 'C.G.C'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 548
          Top = 197
          Width = 95
          Height = 13
          Caption = 'Account Number'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_look_nm_pais: TDBEdit
          Left = 56
          Top = 210
          Width = 233
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_PAIS'
          DataSource = datm_transportador_itl.ds_transp_itl
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_look_nm_cidade: TDBEdit
          Left = 412
          Top = 165
          Width = 222
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_CIDADE'
          DataSource = datm_transportador_itl.ds_transp_itl
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_nm_local_embarque: TDBEdit
          Left = 63
          Top = 30
          Width = 597
          Height = 21
          DataField = 'DESCRICAO'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 3
          OnChange = dbedt_nm_local_embarqueChange
        end
        object dbedt_apelido: TDBEdit
          Left = 18
          Top = 76
          Width = 326
          Height = 21
          DataField = 'APELIDO'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 4
          OnChange = dbedt_nm_local_embarqueChange
        end
        object dbedt_sigla: TDBEdit
          Left = 362
          Top = 76
          Width = 70
          Height = 21
          DataField = 'SIGLA_CIA_TRANSP'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 5
          OnChange = dbedt_nm_local_embarqueChange
        end
        object dbedt_cd_iata: TDBEdit
          Left = 448
          Top = 75
          Width = 80
          Height = 21
          DataField = 'CD_IATA_CIA_TRANSP'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 6
          OnChange = dbedt_nm_local_embarqueChange
        end
        object dbgoup_tp_transp: TDBRadioGroup
          Left = 546
          Top = 61
          Width = 114
          Height = 89
          Caption = 'Transportador'
          DataField = 'TP_TRANSPORTADOR'
          DataSource = datm_transportador_itl.ds_transp_itl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'A'#233'reo'
            'Mar'#237'timo'
            'Terrestre')
          ParentFont = False
          TabOrder = 7
          Values.Strings = (
            '0'
            '1'
            '2')
          OnChange = dbgoup_tp_transpChange
        end
        object dbedt_endereco: TDBEdit
          Left = 18
          Top = 118
          Width = 509
          Height = 21
          DataField = 'END_CIA_TRANSP'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 8
          OnChange = dbedt_nm_local_embarqueChange
        end
        object dbedt_endereco_compl: TDBEdit
          Left = 18
          Top = 165
          Width = 248
          Height = 21
          DataField = 'END_COMPL_CIA_TRANSP'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 9
          OnChange = dbedt_nm_local_embarqueChange
        end
        object dbedt_cep: TDBEdit
          Left = 276
          Top = 165
          Width = 84
          Height = 21
          DataField = 'CEP_END_VIA_TRANSP'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 10
          OnChange = dbedt_nm_local_embarqueChange
        end
        object dbedt_cd_cidade: TDBEdit
          Left = 372
          Top = 165
          Width = 41
          Height = 21
          DataField = 'CD_CIDADE'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 11
          OnChange = dbedt_nm_local_embarqueChange
          OnExit = dbedt_cd_cidadeExit
          OnKeyDown = dbedt_fabr_cd_paisKeyDown
        end
        object dbedt_fabr_cd_pais: TDBEdit
          Left = 18
          Top = 210
          Width = 38
          Height = 21
          DataField = 'CD_PAIS'
          DataSource = datm_transportador_itl.ds_transp_itl
          MaxLength = 5
          TabOrder = 12
          OnChange = dbedt_nm_local_embarqueChange
          OnExit = dbedt_fabr_cd_paisExit
          OnKeyDown = dbedt_fabr_cd_paisKeyDown
        end
        object DBEdit16: TDBEdit
          Left = 333
          Top = 211
          Width = 49
          Height = 21
          DataField = 'UF'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 13
          OnChange = dbedt_nm_local_embarqueChange
        end
        object dbedt_cnpj_transp: TDBEdit
          Left = 398
          Top = 211
          Width = 131
          Height = 21
          DataField = 'CGC_TRANSPORTADOR'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 14
          OnChange = dbedt_nm_local_embarqueChange
          OnExit = dbedt_cnpj_transpExit
        end
        object dbedt_nr_account: TDBEdit
          Left = 547
          Top = 211
          Width = 113
          Height = 21
          DataField = 'NR_ACCOUNT'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 15
          OnChange = dbedt_nm_local_embarqueChange
        end
        object dbedt_nm_home_page: TDBEdit
          Left = 18
          Top = 260
          Width = 511
          Height = 21
          DataField = 'NM_HOME_PAGE_CIA_TRANSP'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 16
          OnChange = dbedt_nm_local_embarqueChange
        end
        object pnl_demurrage: TGroupBox
          Left = 18
          Top = 304
          Width = 699
          Height = 69
          Caption = 'Demurrage'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 17
          object Label19: TLabel
            Left = 15
            Top = 19
            Width = 57
            Height = 13
            Caption = 'Free Time'
            FocusControl = DBEdit14
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label36: TLabel
            Left = 94
            Top = 37
            Width = 26
            Height = 13
            Caption = 'Dias'
            FocusControl = DBEdit14
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label37: TLabel
            Left = 149
            Top = 18
            Width = 75
            Height = 13
            Caption = 'Valor por Dia'
            FocusControl = DBEdit15
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label38: TLabel
            Left = 271
            Top = 19
            Width = 39
            Height = 13
            Caption = 'Moeda'
            FocusControl = dbedt_cd_moeda
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_moeda: TSpeedButton
            Left = 524
            Top = 33
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
            OnClick = btn_co_moedaClick
          end
          object DBEdit14: TDBEdit
            Left = 15
            Top = 33
            Width = 73
            Height = 21
            DataField = 'DIAS_DEMURRAGE'
            DataSource = datm_transportador_itl.ds_transp_itl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = dbedt_nm_local_embarqueChange
          end
          object DBEdit15: TDBEdit
            Left = 149
            Top = 33
            Width = 93
            Height = 21
            DataField = 'VL_DEMURRAGE'
            DataSource = datm_transportador_itl.ds_transp_itl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = dbedt_nm_local_embarqueChange
          end
          object dbedt_nm_moeda: TDBEdit
            Left = 312
            Top = 33
            Width = 211
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NM_MOEDA'
            DataSource = datm_transportador_itl.ds_transp_itl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object dbedt_cd_moeda: TDBEdit
            Left = 271
            Top = 33
            Width = 42
            Height = 21
            DataField = 'CD_MOEDA_DEMURRAGE'
            DataSource = datm_transportador_itl.ds_transp_itl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnChange = dbedt_nm_local_embarqueChange
            OnExit = dbedt_cd_moedaExit
            OnKeyDown = dbedt_fabr_cd_paisKeyDown
          end
        end
        object dbedt_cd_local_embarque: TDBEdit
          Left = 18
          Top = 30
          Width = 45
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CODIGO'
          DataSource = datm_transportador_itl.ds_transp_itl
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object ts_conhececimentos: TTabSheet
      Caption = 'Numeros de Conhecimentos'
      ImageIndex = 2
      object pgtrl_conhecimento: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 425
        ActivePage = ts_lista_conhec
        Align = alClient
        TabOrder = 0
        OnChanging = pgctrlChanging
        object ts_lista_conhec: TTabSheet
          Caption = 'Lista'
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 726
            Height = 397
            Align = alClient
            DataSource = datm_transportador_itl.ds_serie_conec
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
                FieldName = 'CD_SERIE'
                Title.Caption = 'Serie'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 43
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONHEC_INICIAL'
                Title.Caption = 'Conhecimento Inicial'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 137
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONHEC_FINAL'
                Title.Caption = 'Conhecimento Final'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 123
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTDE_CONHEC'
                Title.Caption = 'Qtde'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_ABERTURA'
                Title.Caption = 'Abertura'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Visible = True
              end>
          end
        end
        object ts_dados_conhec: TTabSheet
          Caption = 'Dados B'#225'sicos'
          ImageIndex = 1
          object Label12: TLabel
            Left = 17
            Top = 16
            Width = 66
            Height = 13
            AutoSize = False
            Caption = 'Companhia'
            FocusControl = DBEdit2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 374
            Top = 16
            Width = 29
            Height = 13
            Caption = 'Sigla'
            FocusControl = DBEdit3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label22: TLabel
            Left = 446
            Top = 15
            Width = 59
            Height = 13
            Caption = 'C'#243'd. IATA'
            FocusControl = DBEdit4
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label23: TLabel
            Left = 517
            Top = 15
            Width = 158
            Height = 13
            Caption = 'Conhecimentos Dispon'#237'veis'
            FocusControl = DBEdit5
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 424
            Top = 74
            Width = 101
            Height = 13
            AutoSize = False
            Caption = 'Data de Abertura'
            FocusControl = dbedt_dt_abertura
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label28: TLabel
            Left = 270
            Top = 74
            Width = 77
            Height = 13
            AutoSize = False
            Caption = 'C'#225'lculo IATA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 124
            Top = 141
            Width = 13
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = ' - '
            FocusControl = dbedt_conhec_final
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 285
            Top = 141
            Width = 13
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = ' - '
            FocusControl = dbedt_conhec_final
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label25: TLabel
            Left = 176
            Top = 128
            Width = 125
            Height = 13
            AutoSize = False
            Caption = 'Conhecimento Final'
            FocusControl = dbedt_conhec_final
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 17
            Top = 128
            Width = 125
            Height = 13
            AutoSize = False
            Caption = 'Conhecimento Inicial'
            FocusControl = dbedt_conhec_inicial
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label26: TLabel
            Left = 328
            Top = 128
            Width = 29
            Height = 13
            AutoSize = False
            Caption = 'Qtde'
            FocusControl = dbedt_qtde
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEdit2: TDBEdit
            Left = 62
            Top = 30
            Width = 303
            Height = 21
            Color = clMenu
            DataField = 'DESCRICAO'
            DataSource = datm_transportador_itl.ds_transp_itl
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit3: TDBEdit
            Left = 375
            Top = 30
            Width = 62
            Height = 21
            Color = clMenu
            DataField = 'SIGLA_CIA_TRANSP'
            DataSource = datm_transportador_itl.ds_transp_itl
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 447
            Top = 29
            Width = 62
            Height = 21
            Color = clMenu
            DataField = 'CD_IATA_CIA_TRANSP'
            DataSource = datm_transportador_itl.ds_transp_itl
            ReadOnly = True
            TabOrder = 3
          end
          object DBEdit5: TDBEdit
            Left = 519
            Top = 29
            Width = 127
            Height = 21
            Color = clMenu
            DataField = 'CONHEC_DISP'
            DataSource = datm_transportador_itl.ds_serie_conec
            ReadOnly = True
            TabOrder = 4
          end
          object dbedt_dt_abertura: TDBEdit
            Left = 425
            Top = 88
            Width = 128
            Height = 21
            Color = clMenu
            DataField = 'DT_ABERTURA'
            DataSource = datm_transportador_itl.ds_serie_conec
            ReadOnly = True
            TabOrder = 5
          end
          object dbradiogrp_inclusao: TDBRadioGroup
            Left = 18
            Top = 65
            Width = 233
            Height = 52
            Caption = 'M'#243'dulo de Inser'#231#227'o'
            Columns = 2
            DataField = 'IN_INCLUSAO'
            DataSource = datm_transportador_itl.ds_serie_conec
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Items.Strings = (
              'Sequencial'
              'Intervalo')
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            Values.Strings = (
              '0'
              '1')
            OnChange = dbradiogrp_inclusaoChange
          end
          object rxcbx_iata: TRxDBComboBox
            Left = 271
            Top = 88
            Width = 73
            Height = 21
            Style = csDropDownList
            Color = clMenu
            DataField = 'IN_IATA'
            DataSource = datm_transportador_itl.ds_serie_conec
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'N'#227'o'
              'Sim')
            ReadOnly = True
            TabOrder = 7
            Values.Strings = (
              '0'
              '1')
            OnChange = rxcbx_iataChange
          end
          object DBEdit7: TDBEdit
            Left = 135
            Top = 141
            Width = 16
            Height = 21
            Color = clMenu
            DataField = 'DIG_INICIAL'
            DataSource = datm_transportador_itl.ds_serie_conec
            ReadOnly = True
            TabOrder = 8
          end
          object DBEdit8: TDBEdit
            Left = 296
            Top = 141
            Width = 16
            Height = 21
            Color = clMenu
            DataField = 'DIG_FINAL'
            DataSource = datm_transportador_itl.ds_serie_conec
            ReadOnly = True
            TabOrder = 9
          end
          object dbedt_conhec_inicial: TDBEdit
            Left = 18
            Top = 141
            Width = 104
            Height = 21
            Color = clMenu
            DataField = 'CONHEC_INICIAL'
            DataSource = datm_transportador_itl.ds_serie_conec
            ReadOnly = True
            TabOrder = 10
            OnExit = dbedt_conhec_inicialExit
          end
          object dbedt_conhec_final: TDBEdit
            Left = 177
            Top = 141
            Width = 104
            Height = 21
            Color = clMenu
            DataField = 'CONHEC_FINAL'
            DataSource = datm_transportador_itl.ds_serie_conec
            ReadOnly = True
            TabOrder = 11
            OnExit = dbedt_conhec_inicialExit
          end
          object dbedt_qtde: TDBEdit
            Left = 329
            Top = 141
            Width = 56
            Height = 21
            Color = clMenu
            DataField = 'QTDE_CONHEC'
            DataSource = datm_transportador_itl.ds_serie_conec
            ReadOnly = True
            TabOrder = 12
            OnExit = dbedt_qtdeExit
          end
          object DBEdit1: TDBEdit
            Left = 18
            Top = 30
            Width = 45
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CODIGO'
            DataSource = datm_transportador_itl.ds_transp_itl
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
    object ts_calculos: TTabSheet
      Caption = 'Calculos'
      ImageIndex = 3
      object Label45: TLabel
        Left = 322
        Top = 202
        Width = 99
        Height = 13
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'Observa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 192
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Shape1: TShape
          Left = 10
          Top = 6
          Width = 718
          Height = 101
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object Label29: TLabel
          Left = 19
          Top = 53
          Width = 179
          Height = 13
          AutoSize = False
          Caption = 'Formula para o Calculo OVER - '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label32: TLabel
          Left = 97
          Top = 110
          Width = 120
          Height = 13
          AutoSize = False
          Caption = 'Porcentagem sobre:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 9
          Top = 111
          Width = 80
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Comiss'#227'o Iata'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 9
          Top = 148
          Width = 142
          Height = 13
          AutoSize = False
          Caption = 'Tarifa do Transportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 148
          Top = 148
          Width = 30
          Height = 13
          AutoSize = False
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Shape2: TShape
          Left = 430
          Top = 106
          Width = 298
          Height = 80
          Brush.Color = clSilver
          Pen.Color = clGray
        end
        object lblStatus: TLabel
          Left = 200
          Top = 53
          Width = 227
          Height = 13
          AutoSize = False
          Caption = 'Utilize os simbolos acima e as variaveis ao lado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Panel8: TPanel
          Left = 431
          Top = 105
          Width = 296
          Height = 4
          BevelOuter = bvNone
          Color = clSilver
          TabOrder = 8
        end
        object dbedt_formula: TDBEdit
          Left = 19
          Top = 70
          Width = 409
          Height = 28
          AutoSize = False
          BevelOuter = bvNone
          BevelKind = bkFlat
          Ctl3D = False
          DataField = 'ST_CALCULO_IATA'
          DataSource = datm_transportador_itl.ds_transp_itl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_nm_local_embarqueChange
          OnDragDrop = dbedt_formulaDragDrop
          OnDragOver = dbedt_formulaDragOver
          OnExit = dbedt_formulaExit
        end
        object Panel2: TPanel
          Left = 16
          Top = 11
          Width = 705
          Height = 31
          BevelInner = bvLowered
          TabOrder = 1
          object Label30: TLabel
            Left = 8
            Top = 9
            Width = 80
            Height = 13
            AutoSize = False
            Caption = 'Usar apenas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label48: TLabel
            Left = 90
            Top = 6
            Width = 27
            Height = 16
            Caption = '(    )'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label49: TLabel
            Left = 125
            Top = 6
            Width = 27
            Height = 16
            Caption = '(    )'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label50: TLabel
            Left = 160
            Top = 6
            Width = 27
            Height = 16
            Caption = '(    )'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label51: TLabel
            Left = 195
            Top = 6
            Width = 27
            Height = 16
            Caption = '(    )'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label31: TLabel
            Left = 230
            Top = 6
            Width = 27
            Height = 16
            Caption = '(    )'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label52: TLabel
            Left = 265
            Top = 6
            Width = 27
            Height = 16
            Caption = '(    )'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label55: TLabel
            Left = 94
            Top = 6
            Width = 17
            Height = 16
            Caption = ' + '
            DragMode = dmAutomatic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label56: TLabel
            Left = 131
            Top = 6
            Width = 14
            Height = 16
            Caption = ' - '
            DragMode = dmAutomatic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label57: TLabel
            Left = 201
            Top = 6
            Width = 14
            Height = 16
            Caption = ' / '
            DragMode = dmAutomatic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label58: TLabel
            Left = 165
            Top = 6
            Width = 15
            Height = 16
            Caption = ' * '
            DragMode = dmAutomatic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label59: TLabel
            Left = 234
            Top = 6
            Width = 14
            Height = 16
            Caption = ' ( '
            DragMode = dmAutomatic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label60: TLabel
            Left = 271
            Top = 6
            Width = 14
            Height = 16
            Caption = ' ) '
            DragMode = dmAutomatic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object DBEdit6: TDBEdit
          Left = 10
          Top = 124
          Width = 76
          Height = 21
          Color = clMenu
          DataField = 'PERC_COMISSAO_CIA_TRANSP'
          DataSource = datm_transportador_itl.ds_transp_itl
          ReadOnly = True
          TabOrder = 2
        end
        object RxCombox_tp_comissao: TRxDBComboBox
          Left = 97
          Top = 123
          Width = 120
          Height = 21
          Style = csDropDownList
          DataField = 'TP_COMISSAO'
          DataSource = datm_transportador_itl.ds_transp_itl
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Conhecimento'
            'Tarifa NET')
          TabOrder = 3
          Values.Strings = (
            '0'
            '1')
          OnChange = dbedt_nm_local_embarqueChange
        end
        object RxDBComboBox1: TRxDBComboBox
          Left = 10
          Top = 161
          Width = 130
          Height = 21
          Style = csDropDownList
          DataField = 'TP_TARIFA'
          DataSource = datm_transportador_itl.ds_transp_itl
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'NET'
            'NET/ NET')
          TabOrder = 4
          Values.Strings = (
            '0'
            '1')
          OnChange = dbedt_nm_local_embarqueChange
        end
        object DBEdit13: TDBEdit
          Left = 149
          Top = 161
          Width = 36
          Height = 21
          DataField = 'PERC_TARIFA'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 5
          Visible = False
          OnChange = dbedt_nm_local_embarqueChange
        end
        object DBRadioGroup2: TDBRadioGroup
          Left = 224
          Top = 119
          Width = 201
          Height = 63
          Caption = 'Dt. p/ Convers'#227'o do Relat IATA'
          DataField = 'IN_CONVERSAO_IATA'
          DataSource = datm_transportador_itl.ds_transp_itl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Data Emiss'#227'o Conhecimento'
            'Data Embarque')
          ParentFont = False
          TabOrder = 6
          Values.Strings = (
            '0'
            '1')
        end
        object Panel5: TPanel
          Left = 436
          Top = 11
          Width = 287
          Height = 170
          BevelInner = bvLowered
          TabOrder = 7
          object Panel6: TPanel
            Left = 2
            Top = 2
            Width = 283
            Height = 166
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 8
            Caption = 'Panel6'
            TabOrder = 0
            object Panel4: TPanel
              Left = 8
              Top = 8
              Width = 267
              Height = 22
              Align = alTop
              BevelInner = bvLowered
              TabOrder = 0
              object Label46: TLabel
                Left = 5
                Top = 5
                Width = 47
                Height = 13
                Caption = 'Variavel'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label47: TLabel
                Left = 75
                Top = 5
                Width = 45
                Height = 13
                Caption = 'Campos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
            object DBCtrlGrid1: TDBCtrlGrid
              Left = 8
              Top = 30
              Width = 267
              Height = 126
              Align = alClient
              AllowDelete = False
              AllowInsert = False
              Color = clWhite
              DataSource = datm_transportador_itl.ds_var_iata
              PanelHeight = 21
              PanelWidth = 251
              ParentColor = False
              TabOrder = 1
              RowCount = 6
              SelectedColor = clTeal
              object Shape3: TShape
                Left = -1
                Top = -1
                Width = 75
                Height = 23
                Brush.Style = bsClear
                Pen.Color = clGray
              end
              object DBText1: TDBText
                Left = 4
                Top = 5
                Width = 65
                Height = 17
                DataField = 'NM_VARIAVEL'
                DataSource = datm_transportador_itl.ds_var_iata
                DragMode = dmAutomatic
                Transparent = True
              end
              object DBText2: TDBText
                Left = 76
                Top = 5
                Width = 193
                Height = 17
                DataField = 'NM_CAMPO'
                DataSource = datm_transportador_itl.ds_var_iata
                Transparent = True
              end
            end
          end
          object Panel7: TPanel
            Left = -10
            Top = 2
            Width = 14
            Height = 28
            BevelOuter = bvNone
            TabOrder = 1
          end
        end
      end
      object Panel3: TPanel
        Left = 9
        Top = 204
        Width = 299
        Height = 207
        BevelInner = bvLowered
        TabOrder = 1
        object Label5: TLabel
          Left = 13
          Top = 17
          Width = 93
          Height = 13
          AutoSize = False
          Caption = 'IRRF na Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 13
          Top = 43
          Width = 99
          Height = 13
          AutoSize = False
          Caption = 'IRRF abaixo Min'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 13
          Top = 67
          Width = 118
          Height = 13
          AutoSize = False
          Caption = 'Calcular sobre IATA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Left = 13
          Top = 94
          Width = 123
          Height = 13
          AutoSize = False
          Caption = 'Calcular sobre OVER'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 156
          Top = 14
          Width = 131
          Height = 21
          DataField = 'Look_ir_fatura'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 0
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 156
          Top = 40
          Width = 131
          Height = 21
          DataField = 'look_ir_min'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 1
        end
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 156
          Top = 66
          Width = 131
          Height = 21
          DataField = 'calc_in_ir_iata'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 2
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 14
          Top = 119
          Width = 273
          Height = 75
          Caption = 'Faturamento Por'
          DataField = 'TP_FATURA'
          DataSource = datm_transportador_itl.ds_transp_itl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'IATA e OVER juntos'
            'IATA e OVER separados'
            'Apenas IATA')
          ParentFont = False
          TabOrder = 3
          Values.Strings = (
            '0'
            '1'
            '2')
        end
        object DBLookupComboBox4: TDBLookupComboBox
          Left = 156
          Top = 93
          Width = 131
          Height = 21
          DataField = 'calc_in_ir_over'
          DataSource = datm_transportador_itl.ds_transp_itl
          TabOrder = 4
        end
      end
      object DBMemo1: TDBMemo
        Left = 323
        Top = 216
        Width = 401
        Height = 195
        DataField = 'TX_OBS'
        DataSource = datm_transportador_itl.ds_transp_itl
        TabOrder = 2
        OnChange = dbedt_nm_local_embarqueChange
      end
    end
    object ts_agencias: TTabSheet
      Caption = 'Ag'#234'ncias'
      ImageIndex = 4
      object pnl_agencia: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 204
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 5
        Caption = 'pnl_agencia'
        Color = clMenu
        TabOrder = 0
        OnEnter = pnl_agenciaEnter
        OnExit = pnl_agenciaExit
        object label100: TLabel
          Left = 5
          Top = 6
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Armador'
          FocusControl = DBEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 358
          Top = 6
          Width = 149
          Height = 13
          AutoSize = False
          Caption = 'Ag'#234'ncia / Notificador'
          FocusControl = DBEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_agencia: TSpeedButton
          Left = 702
          Top = 19
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
          OnClick = btn_co_agenciaClick
        end
        object DBEdit10: TDBEdit
          Left = 49
          Top = 19
          Width = 304
          Height = 21
          Color = clMenu
          DataField = 'DESCRICAO'
          DataSource = datm_transportador_itl.ds_transp_itl
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_nm_notificador: TDBEdit
          Left = 402
          Top = 19
          Width = 299
          Height = 21
          Color = clMenu
          DataField = 'NM_NOTIFICADOR'
          DataSource = datm_transportador_itl.ds_notificador
          ReadOnly = True
          TabOrder = 4
        end
        object DBGrid3: TDBGrid
          Left = 5
          Top = 44
          Width = 724
          Height = 155
          Align = alBottom
          DataSource = datm_transportador_itl.ds_notificador
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_NOTIFICADOR'
              Title.Caption = 'C'#243'd.'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NM_NOTIFICADOR'
              Title.Caption = 'Ag'#234'ncia/ Notificador'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 245
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NM_CIDADE'
              Title.Caption = 'Cidade'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NM_CONTATO'
              Title.Caption = 'Contato'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 115
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'END_FONE'
              Title.Caption = 'Fone'
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
        object DBEdit9: TDBEdit
          Left = 5
          Top = 19
          Width = 45
          Height = 21
          Color = clMenu
          DataField = 'CODIGO'
          DataSource = datm_transportador_itl.ds_transp_itl
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_cd_notificador: TDBEdit
          Left = 358
          Top = 19
          Width = 45
          Height = 21
          DataField = 'CD_NOTIFICADOR'
          DataSource = datm_transportador_itl.ds_notificador
          TabOrder = 3
          OnChange = dbedt_cd_notificadorChange
          OnExit = dbedt_cd_notificadorExit
          OnKeyDown = dbedt_fabr_cd_paisKeyDown
        end
      end
      object pnl_navio: TPanel
        Left = 0
        Top = 204
        Width = 734
        Height = 221
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 5
        Caption = 'pnl_navio'
        TabOrder = 1
        OnEnter = pnl_navioEnter
        OnExit = pnl_navioExit
        object Label34: TLabel
          Left = 5
          Top = 5
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Armador'
          FocusControl = DBEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 358
          Top = 5
          Width = 56
          Height = 13
          AutoSize = False
          Caption = 'Navio'
          FocusControl = DBEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_navio: TSpeedButton
          Left = 702
          Top = 18
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
          OnClick = btn_co_navioClick
        end
        object DBEdit12: TDBEdit
          Left = 49
          Top = 18
          Width = 305
          Height = 21
          Color = clMenu
          DataField = 'DESCRICAO'
          DataSource = datm_transportador_itl.ds_transp_itl
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_nm_navio: TDBEdit
          Left = 403
          Top = 18
          Width = 298
          Height = 21
          Color = clMenu
          DataField = 'NM_EMBARCACAO'
          DataSource = datm_transportador_itl.ds_navio
          ReadOnly = True
          TabOrder = 4
        end
        object DBGrid4: TDBGrid
          Left = 5
          Top = 43
          Width = 724
          Height = 173
          Align = alBottom
          DataSource = datm_transportador_itl.ds_navio
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_VEICULO'
              Title.Caption = 'C'#243'd.'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NM_EMBARCACAO'
              Title.Caption = 'Navio'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 228
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_BANDEIRA'
              Title.Caption = 'C'#243'd.'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NM_BANDEIRA'
              Title.Caption = 'Bandeira'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 251
              Visible = True
            end>
        end
        object DBEdit11: TDBEdit
          Left = 5
          Top = 18
          Width = 45
          Height = 21
          Color = clMenu
          DataField = 'CODIGO'
          DataSource = datm_transportador_itl.ds_transp_itl
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_cd_navio: TDBEdit
          Left = 359
          Top = 18
          Width = 45
          Height = 21
          DataField = 'CD_VEICULO'
          DataSource = datm_transportador_itl.ds_navio
          TabOrder = 3
          OnChange = dbedt_cd_navioChange
          OnExit = dbedt_cd_navioExit
          OnKeyDown = dbedt_fabr_cd_paisKeyDown
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 596
    Top = 316
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Hint = ' '
      OnClick = btn_novoClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      OnClick = btn_cancelarClick
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Hint = ' '
      OnClick = btn_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = '&Sair'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end

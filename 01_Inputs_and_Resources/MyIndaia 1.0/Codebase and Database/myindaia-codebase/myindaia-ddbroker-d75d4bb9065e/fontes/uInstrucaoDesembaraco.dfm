object Frm_InstrucaoDesembaraco: TFrm_InstrucaoDesembaraco
  Left = 310
  Top = 176
  Width = 750
  Height = 550
  Caption = 'Instru'#231#227'o de Desembara'#231'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  DesignSize = (
    742
    504)
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 3
      Top = 4
      Width = 38
      Height = 41
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
      Left = 117
      Top = 4
      Width = 38
      Height = 41
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
      Left = 385
      Top = 4
      Width = 38
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
    object btn_salvar: TSpeedButton
      Left = 41
      Top = 4
      Width = 38
      Height = 41
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 79
      Top = 4
      Width = 38
      Height = 41
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
    object BtnImprimir: TSpeedButton
      Left = 155
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Gerar em Excel'
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
      OnClick = BtnImprimirClick
    end
    object BtnDatas: TSpeedButton
      Left = 193
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Digita'#231#227'o das datas para o FollowUp de Itens'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnDatasClick
    end
    object Panel1: TPanel
      Left = 431
      Top = 2
      Width = 309
      Height = 43
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 0
      TabStop = True
      object Label1: TLabel
        Left = 12
        Top = 5
        Width = 56
        Height = 13
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 148
        Top = 5
        Width = 37
        Height = 13
        Caption = 'Ordem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edt_chave: TEdit
        Left = 12
        Top = 20
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
      end
      object cb_ordem: TComboBox
        Left = 148
        Top = 20
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = cb_ordemChange
        Items.Strings = (
          'C'#243'digo Instr.Desemb.'
          'Cliente'
          'Data')
      end
    end
    object dbnvg: TDBNavigator
      Left = 268
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_grupo.ds_grupo_
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object pgctrl_Instr: TPageControl
    Left = 0
    Top = 47
    Width = 742
    Height = 457
    ActivePage = ts_Itens
    Align = alClient
    TabOrder = 1
    OnChanging = pgctrl_InstrChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        DataSource = Datm_InstrDesemb.dts_InstrucaoDesemb
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbg_cadastroDrawColumnCell
        OnDblClick = dbg_cadastroDblClick
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 429
        Align = alClient
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object BvlProcesso: TBevel
          Left = 529
          Top = 6
          Width = 137
          Height = 50
          Visible = False
        end
        object Label3: TLabel
          Left = 12
          Top = 6
          Width = 156
          Height = 13
          Caption = 'Nr. Instru'#231#227'o Desembara'#231'o'
          FocusControl = dbedt_cd_grupo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_dt_inclusao: TLabel
          Left = 12
          Top = 157
          Width = 93
          Height = 13
          Caption = 'Data da Cria'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 12
          Top = 194
          Width = 99
          Height = 13
          Caption = 'Data Autoriza'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 140
          Top = 158
          Width = 44
          Height = 13
          Caption = 'Usu'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 140
          Top = 194
          Width = 83
          Height = 13
          Caption = 'Autorizado por'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_cliente: TSpeedButton
          Left = 338
          Top = 57
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
          OnClick = btn_co_clienteClick
        end
        object lbl_cd_cliente: TLabel
          Left = 12
          Top = 43
          Width = 61
          Height = 13
          Caption = 'Importador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LblProcesso: TLabel
          Left = 542
          Top = 14
          Width = 113
          Height = 13
          Caption = 'Processo Vinculado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText5: TDBText
          Left = 542
          Top = 32
          Width = 65
          Height = 17
          DataField = 'calcNR_PROCESSO'
          DataSource = Datm_InstrDesemb.dts_InstrucaoDesemb
        end
        object lblAnalista: TLabel
          Left = 12
          Top = 81
          Width = 183
          Height = 13
          Caption = 'Respons'#225'vel pelo Desembara'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnConsultaAnalista: TSpeedButton
          Left = 338
          Top = 94
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
          OnClick = btnConsultaAnalistaClick
        end
        object Label13: TLabel
          Left = 12
          Top = 119
          Width = 34
          Height = 13
          Caption = 'Navio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BtnConsultaEmbarcacaoItemParcial: TSpeedButton
          Left = 338
          Top = 132
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
          OnClick = BtnConsultaEmbarcacaoItemParcialClick
        end
        object Label14: TLabel
          Left = 371
          Top = 119
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nr. do BL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 12
          Top = 234
          Width = 75
          Height = 13
          Caption = 'Observa'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_grupo: TDBEdit
          Left = 12
          Top = 20
          Width = 155
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'ID_CODIGO'
          DataSource = Datm_InstrDesemb.dts_InstrucaoDesemb
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_dt_inclusao: TDBEdit
          Left = 12
          Top = 171
          Width = 115
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_CRIACAO'
          DataSource = Datm_InstrDesemb.dts_InstrucaoDesemb
          ReadOnly = True
          TabOrder = 3
        end
        object ChkAutorizado: TDBCheckBox
          Left = 419
          Top = 209
          Width = 95
          Height = 17
          Caption = 'Autorizado'
          DataField = 'IN_AUTORIZADO'
          DataSource = Datm_InstrDesemb.dts_InstrucaoDesemb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = ChkAutorizadoClick
        end
        object EditDtAutorizacao: TDBEdit
          Left = 12
          Top = 208
          Width = 115
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_AUTORIZACAO'
          DataSource = Datm_InstrDesemb.dts_InstrucaoDesemb
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit2: TDBEdit
          Left = 140
          Top = 171
          Width = 269
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_USUARIO'
          DataSource = Datm_InstrDesemb.dts_InstrucaoDesemb
          ReadOnly = True
          TabOrder = 4
        end
        object edt_nm_cliente: TEdit
          Left = 76
          Top = 57
          Width = 260
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_cd_cliente: TDBEdit
          Left = 12
          Top = 57
          Width = 62
          Height = 21
          DataField = 'CD_CLIENTE'
          DataSource = Datm_InstrDesemb.dts_InstrucaoDesemb
          TabOrder = 0
          OnChange = btn_co_clienteClick
          OnExit = dbedt_cd_clienteExit
          OnKeyDown = dbedt_cd_clienteKeyDown
        end
        object EditUsuarioAutorizou: TEdit
          Left = 140
          Top = 208
          Width = 269
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 6
        end
        object dbedtCodigoAnalista: TDBEdit
          Left = 12
          Top = 95
          Width = 62
          Height = 21
          DataField = 'CD_RESPONSAVEL'
          DataSource = Datm_InstrDesemb.dts_InstrucaoDesemb
          TabOrder = 1
          OnChange = btnConsultaAnalistaClick
          OnKeyDown = dbedtCodigoAnalistaKeyDown
        end
        object edtNomeAnalista: TEdit
          Left = 76
          Top = 95
          Width = 260
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 10
        end
        object EditNavioParcial: TDBEdit
          Left = 12
          Top = 133
          Width = 62
          Height = 21
          DataField = 'CD_EMBARCACAO'
          DataSource = Datm_InstrDesemb.dts_InstrucaoDesemb
          TabOrder = 2
          OnChange = BtnConsultaEmbarcacaoItemParcialClick
          OnExit = EditNavioParcialExit
          OnKeyDown = dbedtCodigoAnalistaKeyDown
          OnKeyPress = EditNavioParcialKeyPress
        end
        object EditNavioParcialDesc: TEdit
          Left = 76
          Top = 133
          Width = 260
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 11
        end
        object EditNumBL: TDBEdit
          Left = 371
          Top = 133
          Width = 125
          Height = 21
          Ctl3D = True
          DataField = 'NR_CONHECIMENTO'
          DataSource = Datm_InstrDesemb.dts_InstrucaoDesemb
          ParentCtl3D = False
          TabOrder = 12
        end
        object pnlDespesas: TPanel
          Left = 339
          Top = 240
          Width = 385
          Height = 182
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 13
          object Label12: TLabel
            Left = 2
            Top = 2
            Width = 381
            Height = 19
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = 'Itens de despesa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object DBGrid1: TDBGrid
            Left = 8
            Top = 22
            Width = 369
            Height = 152
            DataSource = Datm_InstrDesemb.dsDespesas
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NM_ITEM'
                Title.Caption = 'Item'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 143
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LUP_NR_FATURA'
                Title.Caption = 'Invoice'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 86
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_ITEM'
                Title.Caption = 'Valor'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 100
                Visible = True
              end>
          end
        end
        object dbmemObservacoes: TDBMemo
          Left = 13
          Top = 248
          Width = 316
          Height = 173
          DataField = 'TX_OBSERVACOES'
          DataSource = Datm_InstrDesemb.dts_InstrucaoDesemb
          TabOrder = 14
        end
      end
    end
    object ts_Itens: TTabSheet
      Caption = 'Pedidos/Itens/Parciais'
      ImageIndex = 2
      DesignSize = (
        734
        429)
      object DBCtrlGrid1: TDBCtrlGrid
        Left = 0
        Top = 18
        Width = 734
        Height = 411
        Align = alClient
        Color = clBtnFace
        DataSource = Datm_InstrDesemb.dts_ItensInstrucaoDesemb
        PanelBorder = gbNone
        PanelHeight = 20
        PanelWidth = 718
        ParentColor = False
        TabOrder = 0
        RowCount = 20
        object DBText1: TDBText
          Left = 133
          Top = 2
          Width = 107
          Height = 14
          DataField = 'NR_ITEM_PO'
          DataSource = Datm_InstrDesemb.dts_ItensInstrucaoDesemb
          Transparent = True
        end
        object Shape3: TShape
          Left = 0
          Top = 19
          Width = 718
          Height = 1
          Align = alBottom
          Pen.Color = clGray
        end
        object DBText2: TDBText
          Left = 10
          Top = 2
          Width = 107
          Height = 14
          DataField = 'NR_REFERENCIA'
          DataSource = Datm_InstrDesemb.dts_ItensInstrucaoDesemb
          Transparent = True
        end
        object DBText4: TDBText
          Left = 255
          Top = 2
          Width = 107
          Height = 14
          DataField = 'NR_PARCIAL'
          DataSource = Datm_InstrDesemb.dts_ItensInstrucaoDesemb
          Transparent = True
        end
        object DBText3: TDBText
          Left = 471
          Top = 2
          Width = 107
          Height = 14
          DataField = 'DT_INCLUSAO'
          DataSource = Datm_InstrDesemb.dts_ItensInstrucaoDesemb
          Transparent = True
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 18
        Align = alTop
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label5: TLabel
          Left = 10
          Top = 3
          Width = 84
          Height = 13
          Caption = 'Nr. Refer'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 133
          Top = 3
          Width = 46
          Height = 13
          Caption = 'Nr. Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 255
          Top = 3
          Width = 61
          Height = 13
          Caption = 'Nr. Parcial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 471
          Top = 3
          Width = 70
          Height = 13
          Caption = 'Dt. Inclus'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object PnlIncItens: TPanel
        Left = 63
        Top = 26
        Width = 615
        Height = 376
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        BorderWidth = 2
        Color = clTeal
        TabOrder = 2
        Visible = False
        object panel33: TPanel
          Left = 2
          Top = 2
          Width = 611
          Height = 372
          Align = alClient
          BevelOuter = bvNone
          Caption = 'panel33'
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object Panel3: TPanel
            Left = 0
            Top = 41
            Width = 611
            Height = 296
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 5
            Caption = 'Panel3'
            TabOrder = 0
            object GridItens: TDBGrid
              Left = 5
              Top = 5
              Width = 601
              Height = 286
              Align = alClient
              DataSource = Datm_InstrDesemb.dtsItensPedido
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = GridItensCellClick
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 337
            Width = 611
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 1
            DesignSize = (
              611
              35)
            object btnSalvarPedido: TSpeedButton
              Left = 444
              Top = 2
              Width = 77
              Height = 26
              Hint = 'Salvar'
              Anchors = [akTop, akRight]
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
              OnClick = btnSalvarPedidoClick
            end
            object btnCancelarPedido: TSpeedButton
              Left = 527
              Top = 2
              Width = 77
              Height = 26
              Hint = 'Cancelar'
              Anchors = [akTop, akRight]
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
              OnClick = btnCancelarPedidoClick
            end
            object ChkTodos: TCheckBox
              Left = 7
              Top = 6
              Width = 97
              Height = 17
              Caption = 'Todos os itens'
              Enabled = False
              TabOrder = 0
              OnClick = ChkTodosClick
            end
          end
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 611
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 2
            object Label4: TLabel
              Left = 15
              Top = 15
              Width = 48
              Height = 13
              Caption = 'N'#186' Pedido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object EditNrPedido: TEdit
              Left = 77
              Top = 13
              Width = 136
              Height = 19
              Ctl3D = False
              MaxLength = 16
              ParentCtl3D = False
              TabOrder = 0
              OnExit = EditNrPedidoExit
              OnKeyDown = EditNrPedidoKeyDown
            end
          end
        end
      end
    end
  end
  object pnlOpcoes: TPanel
    Left = 519
    Top = 47
    Width = 223
    Height = 20
    Anchors = [akTop, akRight]
    BevelInner = bvLowered
    TabOrder = 2
    object chkUltimos30Dias: TCheckBox
      Left = 4
      Top = 2
      Width = 93
      Height = 15
      Caption = 'Ultimos 30 dias'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = chkUltimos30DiasClick
    end
    object chkExibeAutorizados: TCheckBox
      Left = 115
      Top = 2
      Width = 106
      Height = 15
      Caption = 'Exibir autorizados'
      TabOrder = 1
      OnClick = chkExibeAutorizadosClick
    end
  end
  object menu_cadastro: TMainMenu
    Left = 513
    Top = 233
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      Hint = ' '
      OnClick = btn_incluirClick
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
      Enabled = False
      Hint = ' '
      OnClick = btn_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end

object frm_viagem: Tfrm_viagem
  Left = 519
  Top = 130
  Width = 750
  Height = 602
  Caption = 'Cadastro de Viagens'
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
  object pgctrl_viagem: TPageControl
    Left = 0
    Top = 47
    Width = 734
    Height = 497
    ActivePage = ts_dados_basicos
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_viagemChange
    OnChanging = pgctrl_viagemChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_viagem: TDBGrid
        Left = 0
        Top = 107
        Width = 726
        Height = 362
        Align = alClient
        Color = clWhite
        DataSource = datm_viagem.ds_lista
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_viagemDblClick
        OnKeyPress = dbg_viagemKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_VIAGEM'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ESPERADA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ENT'
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
            FieldName = 'DESCRICAO'
            Title.Caption = 'Local Desemb.'
            Title.Color = clWindowText
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindow
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ARMAZEM'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 227
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_MANIFESTO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 113
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 107
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lbl_cd_unid_neg: TLabel
          Left = 16
          Top = 12
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
          Left = 327
          Top = 24
          Width = 23
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
        object lbl_cd_produto: TLabel
          Left = 384
          Top = 14
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
        object btn_co_produto: TSpeedButton
          Left = 694
          Top = 27
          Width = 23
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
        object Label6: TLabel
          Left = 16
          Top = 56
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'Embarca'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_embarcacao: TSpeedButton
          Left = 327
          Top = 68
          Width = 23
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
          OnClick = btn_co_embarcacaoClick
        end
        object msk_cd_unid_neg: TMaskEdit
          Left = 17
          Top = 25
          Width = 36
          Height = 21
          EditMask = '!99;0; '
          MaxLength = 2
          TabOrder = 0
          OnEnter = msk_cd_unid_negEnter
          OnExit = msk_cd_unid_negExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object edt_nm_unid_neg: TEdit
          Left = 53
          Top = 25
          Width = 273
          Height = 21
          TabStop = False
          ParentColor = True
          ReadOnly = True
          TabOrder = 1
        end
        object msk_cd_produto: TMaskEdit
          Left = 385
          Top = 27
          Width = 35
          Height = 21
          EditMask = '!99;0; '
          MaxLength = 2
          TabOrder = 2
          OnEnter = msk_cd_produtoEnter
          OnExit = msk_cd_produtoExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object edt_nm_produto: TEdit
          Left = 420
          Top = 27
          Width = 273
          Height = 21
          TabStop = False
          ParentColor = True
          ReadOnly = True
          TabOrder = 3
        end
        object msk_cd_embarcacao: TMaskEdit
          Left = 17
          Top = 69
          Width = 46
          Height = 21
          EditMask = '!9999;0; '
          MaxLength = 4
          TabOrder = 4
          OnEnter = msk_cd_embarcacaoEnter
          OnExit = msk_cd_embarcacaoExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object edt_nm_embarcacao: TEdit
          Left = 63
          Top = 69
          Width = 263
          Height = 21
          TabStop = False
          ParentColor = True
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados B'#225'sicos'
      object pnl_ag: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 469
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_nr_viagem: TLabel
          Left = 14
          Top = 136
          Width = 60
          Height = 13
          Caption = 'N'#186' Viagem'
          FocusControl = dbedt_nr_viagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_armazem_atracacao: TLabel
          Left = 14
          Top = 219
          Width = 131
          Height = 13
          Caption = 'Armaz'#233'm de Atraca'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 14
          Top = 12
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
        object btn_co_armazem_atracacao: TSpeedButton
          Left = 446
          Top = 231
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
          OnClick = btn_co_armazem_atracacaoClick
        end
        object lbl_nr_manifesto: TLabel
          Left = 15
          Top = 298
          Width = 74
          Height = 13
          Caption = 'N'#186' Manifesto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 14
          Top = 52
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
        object Label2: TLabel
          Left = 14
          Top = 94
          Width = 71
          Height = 13
          Caption = 'Embarca'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_esperada: TLabel
          Left = 13
          Top = 177
          Width = 71
          Height = 13
          Caption = 'Dt.Esperada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ent: TLabel
          Left = 144
          Top = 177
          Width = 66
          Height = 13
          Caption = 'Dt. Entrada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_transbordo: TLabel
          Left = 146
          Top = 299
          Width = 65
          Height = 13
          Caption = 'Transbordo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lbl_tipo_produto: TLabel
          Left = 15
          Top = 256
          Width = 131
          Height = 13
          Caption = 'Local de Desembarque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_local: TSpeedButton
          Left = 446
          Top = 271
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
          OnClick = btn_co_localClick
        end
        object lbl3: TLabel
          Left = 227
          Top = 299
          Width = 71
          Height = 13
          Caption = 'Transit Time'
          FocusControl = dbedt_transit_time
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPrevOrigem: TLabel
          Left = 276
          Top = 136
          Width = 169
          Height = 13
          Caption = 'Dt. Prev. de Sa'#237'da na Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 143
          Top = 136
          Width = 110
          Height = 13
          Caption = 'N'#186' Viagem Armador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblAberturaGate: TLabel
          Left = 277
          Top = 177
          Width = 119
          Height = 13
          Caption = 'Dt. Abertura do Gate'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 15
          Top = 337
          Width = 151
          Height = 13
          Caption = 'Usu'#225'rio Criador da Viagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 401
          Top = 177
          Width = 28
          Height = 13
          Caption = 'Hora'
          FocusControl = dbedt_hr_abertura_gate
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nr_viagem: TDBEdit
          Left = 14
          Top = 150
          Width = 115
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_VIAGEM'
          DataSource = datm_viagem.ds_viagem
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 52
          Top = 25
          Width = 388
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidNeg'
          DataSource = datm_viagem.ds_viagem
          ReadOnly = True
          TabOrder = 1
          OnChange = dbedt_nr_viagemChange
        end
        object dbedt_nm_armazem_atracacao: TDBEdit
          Left = 73
          Top = 232
          Width = 372
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookArmazemAtracacao'
          DataSource = datm_viagem.ds_viagem
          ReadOnly = True
          TabOrder = 16
          OnChange = dbedt_nr_viagemChange
        end
        object dbedt_nr_manifesto: TDBEdit
          Left = 15
          Top = 312
          Width = 117
          Height = 21
          DataField = 'NR_MANIFESTO'
          DataSource = datm_viagem.ds_viagem
          TabOrder = 13
          OnChange = dbedt_nr_viagemChange
        end
        object dbedt_nm_produto: TDBEdit
          Left = 52
          Top = 65
          Width = 388
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookProduto'
          DataSource = datm_viagem.ds_viagem
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_nr_viagemChange
        end
        object dbedt_nm_embarcacao: TDBEdit
          Left = 73
          Top = 107
          Width = 366
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookEmbarcacao'
          DataSource = datm_viagem.ds_viagem
          ReadOnly = True
          TabOrder = 5
          OnChange = dbedt_nr_viagemChange
        end
        object dbedt_dt_esperada: TDBEdit
          Left = 14
          Top = 191
          Width = 116
          Height = 21
          DataField = 'DT_ESPERADA'
          DataSource = datm_viagem.ds_viagem
          TabOrder = 9
          OnChange = dbedt_dt_esperadaChange
          OnExit = dbedt_dt_esperadaExit
        end
        object dbedt_dt_ent: TDBEdit
          Left = 144
          Top = 191
          Width = 117
          Height = 21
          DataField = 'DT_ENT'
          DataSource = datm_viagem.ds_viagem
          TabOrder = 10
          OnChange = dbedt_dt_entChange
          OnExit = dbedt_dt_entExit
        end
        object dblckpbox_transbordo: TDBLookupComboBox
          Left = 146
          Top = 312
          Width = 66
          Height = 21
          DataField = 'LookTransbordo'
          DataSource = datm_viagem.ds_viagem
          TabOrder = 14
          OnClick = dbedt_nr_viagemChange
        end
        object dbedt_nm_local: TDBEdit
          Left = 73
          Top = 271
          Width = 372
          Height = 21
          Color = clMenu
          DataField = 'LookLocal'
          DataSource = datm_viagem.ds_viagem
          ReadOnly = True
          TabOrder = 17
        end
        object dbedt_transit_time: TDBEdit
          Left = 227
          Top = 313
          Width = 66
          Height = 21
          DataField = 'NR_TRANSIT_TIME'
          DataSource = datm_viagem.ds_viagem
          TabOrder = 15
          OnChange = dbedt_transit_timeChange
        end
        object dbedtPrevOrigemDestino: TDBEdit
          Left = 277
          Top = 150
          Width = 117
          Height = 21
          DataField = 'DT_PREVISTA_ORIGEM_DESTINO'
          DataSource = datm_viagem.ds_viagem
          TabOrder = 8
          OnChange = dbedtPrevOrigemDestinoChange
          OnExit = dbedt_dt_esperadaExit
        end
        object dbedtNrViagemArmador: TDBEdit
          Left = 144
          Top = 150
          Width = 117
          Height = 21
          DataField = 'NR_VIAGEM_ARMADOR'
          DataSource = datm_viagem.ds_viagem
          TabOrder = 7
          OnChange = dbedt_nr_viagemChange
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 14
          Top = 25
          Width = 39
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_UNID_NEG'
          DataSource = datm_viagem.ds_viagem
          MaxLength = 4
          ReadOnly = True
          TabOrder = 0
          OnChange = dbedt_nr_viagemChange
        end
        object dbedt_cd_produto: TDBEdit
          Left = 14
          Top = 65
          Width = 39
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_PRODUTO'
          DataSource = datm_viagem.ds_viagem
          MaxLength = 4
          ReadOnly = True
          TabOrder = 2
          OnChange = dbedt_nr_viagemChange
        end
        object dbedt_cd_embarcacao: TDBEdit
          Left = 14
          Top = 107
          Width = 60
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_EMBARCACAO'
          DataSource = datm_viagem.ds_viagem
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_nr_viagemChange
        end
        object dbedt_cd_armazem_atracacao: TDBEdit
          Left = 14
          Top = 232
          Width = 60
          Height = 21
          DataField = 'CD_ARMAZEM_ATRACACAO'
          DataSource = datm_viagem.ds_viagem
          TabOrder = 11
          OnChange = dbedt_nr_viagemChange
          OnExit = dbedt_cd_armazem_atracacaoExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_cd_local: TDBEdit
          Left = 14
          Top = 271
          Width = 60
          Height = 21
          DataField = 'CD_LOCAL'
          DataSource = datm_viagem.ds_viagem
          TabOrder = 12
          OnChange = dbedt_nr_viagemChange
          OnExit = dbedt_cd_localExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_DT_ABERTURA_GATE: TDBEdit
          Left = 277
          Top = 191
          Width = 117
          Height = 21
          DataField = 'DT_ABERTURA_GATE'
          DataSource = datm_viagem.ds_viagem
          TabOrder = 18
          OnChange = dbedt_dt_entChange
          OnExit = dbedt_dt_entExit
        end
        object DBEdit1: TDBEdit
          Left = 14
          Top = 352
          Width = 372
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NM_USUARIO'
          DataSource = datm_viagem.ds_viagem
          Enabled = False
          ReadOnly = True
          TabOrder = 19
          OnChange = dbedt_nr_viagemChange
        end
        object dbedt_hr_abertura_gate: TDBEdit
          Left = 401
          Top = 191
          Width = 90
          Height = 21
          DataField = 'HR_ABERTURA_GATE'
          DataSource = datm_viagem.ds_viagem
          MaxLength = 8
          TabOrder = 20
          OnChange = dbedt_hr_abertura_gateChange
        end
      end
    end
    object ts_DeadLines: TTabSheet
      Caption = 'DeadLine'#39's'
      ImageIndex = 2
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 198
        Align = alTop
        BevelInner = bvLowered
        ParentBackground = False
        TabOrder = 0
        object lbl1: TLabel
          Left = 15
          Top = 50
          Width = 110
          Height = 13
          Caption = 'Dead-Line BL Draft'
          FocusControl = dbedt_deadline_bl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 253
          Top = 50
          Width = 96
          Height = 13
          Caption = 'Dead-Line Carga'
          FocusControl = dbedt_deadline_carga
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 253
          Top = 99
          Width = 80
          Height = 13
          Caption = 'Abertura Gate'
          FocusControl = dbedtAbreGate
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 15
          Top = 99
          Width = 86
          Height = 13
          Caption = 'Dead-Line IMO'
          FocusControl = dbedt_deadline_imo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 253
          Top = 147
          Width = 98
          Height = 13
          Caption = 'Dead-Line Temp.'
          FocusControl = dbedtDeadLineTemp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 133
          Top = 50
          Width = 28
          Height = 13
          Caption = 'Hora'
          FocusControl = DBEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 374
          Top = 50
          Width = 28
          Height = 13
          Caption = 'Hora'
          FocusControl = DBEdit4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 133
          Top = 99
          Width = 28
          Height = 13
          Caption = 'Hora'
          FocusControl = DBEdit5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 374
          Top = 99
          Width = 28
          Height = 13
          Caption = 'Hora'
          FocusControl = dbehrAbreGate
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl7: TLabel
          Left = 374
          Top = 4
          Width = 60
          Height = 13
          Caption = 'Estufagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 15
          Top = 4
          Width = 41
          Height = 13
          Caption = 'Agente'
          FocusControl = dbedt_cd_agente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_agente: TSpeedButton
          Left = 344
          Top = 20
          Width = 23
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
          OnClick = btn_agenteClick
        end
        object Label7: TLabel
          Left = 374
          Top = 147
          Width = 28
          Height = 13
          Caption = 'Hora'
          FocusControl = DBEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 584
          Top = 69
          Width = 122
          Height = 16
          DataField = 'DT_ALTERACAO'
          DataSource = datm_viagem.ds_viagem_DeadLine
        end
        object lbl_usuario: TLabel
          Left = 499
          Top = 69
          Width = 3
          Height = 13
        end
        object lbl_alteracao: TLabel
          Left = 497
          Top = 50
          Width = 102
          Height = 13
          Caption = #218'ltima Altera'#231#227'o :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Label14: TLabel
          Left = 458
          Top = 4
          Width = 104
          Height = 13
          Caption = 'Viagem do Agente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 15
          Top = 148
          Width = 90
          Height = 13
          Caption = 'Dead-Line VGM'
          FocusControl = dbedtDT_DEADLINE_VGM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 133
          Top = 148
          Width = 28
          Height = 13
          Caption = 'Hora'
          FocusControl = dbedtHR_DEADLINE_VGM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_deadline_bl: TDBEdit
          Left = 15
          Top = 67
          Width = 90
          Height = 21
          DataField = 'DT_DEADLINE_BL'
          DataSource = datm_viagem.ds_viagem_DeadLine
          MaxLength = 10
          TabOrder = 3
          OnChange = dbedt_deadline_blChange
        end
        object dbedt_deadline_carga: TDBEdit
          Left = 253
          Top = 67
          Width = 110
          Height = 21
          DataField = 'DT_DEADLINE_CARGA'
          DataSource = datm_viagem.ds_viagem_DeadLine
          MaxLength = 10
          TabOrder = 5
          OnChange = dbedt_deadline_cargaChange
        end
        object dbedtAbreGate: TDBEdit
          Left = 253
          Top = 116
          Width = 110
          Height = 21
          DataField = 'DT_ABERTURA_GATE'
          DataSource = datm_viagem.ds_viagem_DeadLine
          MaxLength = 10
          ReadOnly = True
          TabOrder = 9
          OnChange = dbedtAbreGateChange
        end
        object dbedt_deadline_imo: TDBEdit
          Left = 15
          Top = 116
          Width = 110
          Height = 21
          DataField = 'DT_DEADLINE_IMO'
          DataSource = datm_viagem.ds_viagem_DeadLine
          MaxLength = 10
          TabOrder = 7
          OnChange = dbedt_deadline_imoChange
        end
        object dbedtDeadLineTemp: TDBEdit
          Left = 253
          Top = 164
          Width = 110
          Height = 21
          DataField = 'DT_DEADLINE_CARTA_TEMP'
          DataSource = datm_viagem.ds_viagem_DeadLine
          MaxLength = 10
          TabOrder = 11
          OnChange = dbedtDeadLineTempChange
        end
        object DBEdit3: TDBEdit
          Left = 133
          Top = 67
          Width = 90
          Height = 21
          DataField = 'HR_DEADLINE_BL'
          DataSource = datm_viagem.ds_viagem_DeadLine
          MaxLength = 8
          TabOrder = 4
          OnChange = rxdbcbEstufagemChange
          OnExit = DBEdit3Exit
        end
        object DBEdit4: TDBEdit
          Left = 374
          Top = 67
          Width = 90
          Height = 21
          DataField = 'HR_DEADLINE_CARGA'
          DataSource = datm_viagem.ds_viagem_DeadLine
          MaxLength = 8
          TabOrder = 6
          OnChange = rxdbcbEstufagemChange
        end
        object DBEdit5: TDBEdit
          Left = 133
          Top = 116
          Width = 90
          Height = 21
          DataField = 'HR_DEADLINE_IMO'
          DataSource = datm_viagem.ds_viagem_DeadLine
          MaxLength = 8
          TabOrder = 8
          OnChange = rxdbcbEstufagemChange
        end
        object dbehrAbreGate: TDBEdit
          Left = 374
          Top = 116
          Width = 90
          Height = 21
          DataField = 'HR_ABERTURA_GATE'
          DataSource = datm_viagem.ds_viagem_DeadLine
          MaxLength = 8
          ReadOnly = True
          TabOrder = 10
          OnChange = rxdbcbEstufagemChange
        end
        object rxdbcbEstufagem: TRxDBComboBox
          Left = 374
          Top = 19
          Width = 69
          Height = 21
          Style = csDropDownList
          DataField = 'TP_ESTUFAGEM'
          DataSource = datm_viagem.ds_viagem_DeadLine
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'FCL'
            'LCL')
          TabOrder = 1
          Values.Strings = (
            '1'
            '0')
          OnChange = rxdbcbEstufagemChange
        end
        object dbedt_cd_agente: TDBEdit
          Left = 15
          Top = 21
          Width = 48
          Height = 21
          DataField = 'CD_AGENTE'
          DataSource = datm_viagem.ds_viagem_DeadLine
          TabOrder = 0
          OnChange = btn_agenteClick
          OnExit = dbedt_cd_agenteExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_agente: TEdit
          Left = 64
          Top = 21
          Width = 280
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 13
        end
        object DBEdit2: TDBEdit
          Left = 374
          Top = 164
          Width = 90
          Height = 21
          DataField = 'HR_DEADLINE_CARTA_TEMP'
          DataSource = datm_viagem.ds_viagem_DeadLine
          MaxLength = 8
          TabOrder = 12
          OnChange = rxdbcbEstufagemChange
        end
        object DBEdit7: TDBEdit
          Left = 459
          Top = 21
          Width = 180
          Height = 21
          DataField = 'VIAGEMDOAGENTE'
          DataSource = datm_viagem.ds_viagem_DeadLine
          TabOrder = 2
        end
        object dbedtDT_DEADLINE_VGM: TDBEdit
          Left = 15
          Top = 164
          Width = 110
          Height = 21
          DataField = 'DT_DEADLINE_VGM'
          DataSource = datm_viagem.ds_viagem_DeadLine
          MaxLength = 10
          TabOrder = 14
          OnChange = dbedtDeadLineTempChange
        end
        object dbedtHR_DEADLINE_VGM: TDBEdit
          Left = 133
          Top = 164
          Width = 90
          Height = 21
          DataField = 'HR_DEADLINE_VGM'
          DataSource = datm_viagem.ds_viagem_DeadLine
          MaxLength = 8
          TabOrder = 15
          OnChange = rxdbcbEstufagemChange
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 198
        Width = 726
        Height = 271
        Align = alClient
        Color = clWhite
        DataSource = datm_viagem.ds_viagem_DeadLine
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_viagemDblClick
        OnKeyPress = dbg_viagemKeyPress
      end
    end
  end
  object pnl_btn_ag: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      734
      47)
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 4
      Width = 37
      Height = 39
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
      Left = 115
      Top = 4
      Width = 37
      Height = 39
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
      Left = 700
      Top = 4
      Width = 37
      Height = 39
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
      Left = 41
      Top = 4
      Width = 37
      Height = 39
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
      Left = 78
      Top = 4
      Width = 37
      Height = 39
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
    object Shape3: TShape
      Left = 579
      Top = 11
      Width = 107
      Height = 26
      Anchors = [akTop, akRight]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object dbnvg: TDBNavigator
      Left = 581
      Top = 13
      Width = 104
      Height = 23
      DataSource = datm_viagem.ds_lista
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
  end
  object pnlAguarde: TPanel
    Left = 563
    Top = 74
    Width = 173
    Height = 48
    BevelOuter = bvNone
    BorderWidth = 2
    Color = clTeal
    TabOrder = 2
    Visible = False
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 169
      Height = 44
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object lbl5: TLabel
        Left = 7
        Top = 5
        Width = 129
        Height = 13
        Caption = 'atualizando followup...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pb1: TProgressBar
        Left = 8
        Top = 19
        Width = 153
        Height = 17
        Max = 0
        Step = 1
        TabOrder = 0
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 522
    Top = 393
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
      OnClick = btn_sairClick
    end
  end
end

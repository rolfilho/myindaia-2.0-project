object frm_ag: Tfrm_ag
  Left = 346
  Top = 162
  Width = 750
  Height = 563
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Agente'
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgctrl_ag: TPageControl
    Left = 0
    Top = 52
    Width = 734
    Height = 453
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_agChange
    OnChanging = pgctrl_agChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_ag: TDBGrid
        Left = 0
        Top = 0
        Width = 726
        Height = 425
        Align = alClient
        DataSource = datm_ag.ds_ag
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_agDblClick
        OnKeyPress = dbg_agKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_AGENTE'
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
            FieldName = 'NM_AGENTE'
            Title.Caption = 'Nome'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 546
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_Ativo'
            Title.Caption = 'Ativo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 61
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados B'#225'sicos'
      object pnl_ag: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 425
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label3: TLabel
          Left = 6
          Top = 3
          Width = 44
          Height = 13
          AutoSize = False
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_ag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 51
          Top = 3
          Width = 36
          Height = 13
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ativo: TLabel
          Left = 657
          Top = 3
          Width = 30
          Height = 13
          Caption = 'Ativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 403
          Top = 3
          Width = 90
          Height = 13
          AutoSize = False
          Caption = 'Nome Reduzido'
          FocusControl = dbedt_cd_ag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 540
          Top = 38
          Width = 34
          Height = 13
          AutoSize = False
          Caption = 'Sigla'
          FocusControl = dbedt_cd_ag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 6
          Top = 37
          Width = 250
          Height = 13
          AutoSize = False
          Caption = 'Endere'#231'o para Emiss'#227'o do Conhecimento'
          FocusControl = dbedt_cd_ag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 269
          Top = 38
          Width = 50
          Height = 13
          AutoSize = False
          Caption = 'Local'
          FocusControl = dbedt_cd_ag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 270
          Top = 73
          Width = 42
          Height = 13
          AutoSize = False
          Caption = 'Pa'#237's'
          FocusControl = dbedt_cd_ag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 540
          Top = 73
          Width = 54
          Height = 13
          AutoSize = False
          Caption = 'Zip Code'
          FocusControl = dbedt_cd_ag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_cidade: TSpeedButton
          Left = 507
          Top = 50
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
          OnClick = btn_cidadeClick
        end
        object btn_pais: TSpeedButton
          Left = 507
          Top = 85
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
          OnClick = btn_paisClick
        end
        object Label16: TLabel
          Left = 625
          Top = 38
          Width = 27
          Height = 13
          AutoSize = False
          Caption = 'U.F.'
          FocusControl = dbedt_cd_ag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cnpj_empresa: TLabel
          Left = 540
          Top = 3
          Width = 48
          Height = 13
          Caption = 'C.N.P.J.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 625
          Top = 73
          Width = 85
          Height = 13
          AutoSize = False
          Caption = 'SCAC Code'
          FocusControl = dbedt_cd_ag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_ag: TDBEdit
          Left = 7
          Top = 16
          Width = 41
          Height = 21
          TabStop = False
          DataField = 'CD_AGENTE'
          DataSource = datm_ag.ds_ag
          ParentColor = True
          TabOrder = 0
        end
        object dbedt_nr_sigla: TDBEdit
          Left = 540
          Top = 50
          Width = 79
          Height = 21
          DataField = 'CD_SIGLA'
          DataSource = datm_ag.ds_ag
          ParentColor = True
          ReadOnly = True
          TabOrder = 5
          OnChange = dbedt_nm_agChange
          OnKeyDown = dbedt_cd_cidadeKeyDown
        end
        object dbedt_look_nm_pais: TDBEdit
          Left = 308
          Top = 86
          Width = 198
          Height = 21
          TabStop = False
          DataField = 'NM_PAIS'
          DataSource = datm_ag.ds_ag
          ParentColor = True
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_look_nm_cidade: TDBEdit
          Left = 309
          Top = 51
          Width = 197
          Height = 21
          TabStop = False
          DataField = 'DESCRICAO'
          DataSource = datm_ag.ds_ag
          ParentColor = True
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_nm_ag: TDBEdit
          Left = 51
          Top = 16
          Width = 349
          Height = 21
          DataField = 'NM_AGENTE'
          DataSource = datm_ag.ds_ag
          TabOrder = 1
          OnChange = dbedt_nm_agChange
        end
        object dbedt_nm_agente_reduzido: TDBEdit
          Left = 404
          Top = 16
          Width = 132
          Height = 21
          DataField = 'NM_AGENTE_REDUZIDO'
          DataSource = datm_ag.ds_ag
          TabOrder = 2
          OnChange = dbedt_nm_agChange
        end
        object RxDBCboBox_Ativp_Ag: TRxDBComboBox
          Left = 656
          Top = 16
          Width = 64
          Height = 21
          Style = csDropDownList
          DataField = 'IN_ATIVO'
          DataSource = datm_ag.ds_ag
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Sim'
            'N'#227'o')
          TabOrder = 4
          Values.Strings = (
            '1'
            '0')
          OnChange = dbedt_nm_agChange
        end
        object dbmemo_ds_endereco: TDBMemo
          Left = 6
          Top = 50
          Width = 256
          Height = 56
          DataField = 'DS_ENDERECO'
          DataSource = datm_ag.ds_ag
          TabOrder = 7
          OnChange = dbedt_nm_agChange
        end
        object dbedt_cd_cidade: TDBEdit
          Left = 270
          Top = 51
          Width = 40
          Height = 21
          DataField = 'CD_CIDADE'
          DataSource = datm_ag.ds_ag
          TabOrder = 8
          OnChange = dbedt_nm_agChange
          OnExit = dbedt_cd_cidadeExit
          OnKeyDown = dbedt_cd_cidadeKeyDown
        end
        object DBEdit4: TDBEdit
          Left = 625
          Top = 50
          Width = 30
          Height = 21
          DataField = 'END_UF'
          DataSource = datm_ag.ds_ag
          TabOrder = 6
          OnChange = dbedt_nm_agChange
        end
        object dbedt_cd_pais: TDBEdit
          Left = 271
          Top = 86
          Width = 38
          Height = 21
          DataField = 'CD_PAIS'
          DataSource = datm_ag.ds_ag
          TabOrder = 10
          OnChange = dbedt_nm_agChange
          OnExit = dbedt_cd_paisExit
          OnKeyDown = dbedt_cd_cidadeKeyDown
        end
        object dbedt_nr_zip_code: TDBEdit
          Left = 540
          Top = 85
          Width = 79
          Height = 21
          DataField = 'NR_ZIP_CODE'
          DataSource = datm_ag.ds_ag
          TabOrder = 12
          OnChange = dbedt_nm_agChange
        end
        object Panel2: TPanel
          Left = 2
          Top = 112
          Width = 722
          Height = 311
          Align = alBottom
          BevelInner = bvLowered
          TabOrder = 13
          object Label26: TLabel
            Left = 8
            Top = 258
            Width = 82
            Height = 13
            AutoSize = False
            Caption = 'OBS:'
            FocusControl = dbedt_cd_ag
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel3: TPanel
            Left = 2
            Top = 128
            Width = 718
            Height = 121
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 0
            object Label32: TLabel
              Left = 10
              Top = 8
              Width = 191
              Height = 13
              Caption = 'Banco Internacional (Secund'#225'rio)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_cd_bco_2: TSpeedButton
              Left = 292
              Top = 21
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
              OnClick = btn_cd_bco_2Click
            end
            object Label33: TLabel
              Left = 11
              Top = 42
              Width = 39
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_cd_moeda_3: TSpeedButton
              Left = 122
              Top = 55
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
              OnClick = btn_cd_moeda_3Click
            end
            object Label34: TLabel
              Left = 158
              Top = 42
              Width = 76
              Height = 13
              AutoSize = False
              Caption = 'N'#186' de Conta'
              FocusControl = dbedt_cd_ag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label35: TLabel
              Left = 332
              Top = 42
              Width = 173
              Height = 13
              AutoSize = False
              Caption = 'Routing Information/IBAN'
              FocusControl = dbedt_cd_ag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label36: TLabel
              Left = 10
              Top = 77
              Width = 39
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_cd_moeda_4: TSpeedButton
              Left = 122
              Top = 90
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
              OnClick = btn_cd_moeda_4Click
            end
            object Label37: TLabel
              Left = 158
              Top = 77
              Width = 76
              Height = 13
              AutoSize = False
              Caption = 'N'#186' de Conta'
              FocusControl = dbedt_cd_ag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl2: TLabel
              Left = 331
              Top = 77
              Width = 174
              Height = 13
              AutoSize = False
              Caption = 'Swift Code/ ABA'
              FocusControl = dbedt_cd_ag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_look_nm_banco_2: TDBEdit
              Left = 46
              Top = 21
              Width = 247
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_BCO_ITL_2'
              DataSource = datm_ag.ds_ag
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_nm_moeda_3: TDBEdit
              Left = 46
              Top = 55
              Width = 75
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'MOEDA_CONTA_3'
              DataSource = datm_ag.ds_ag
              ReadOnly = True
              TabOrder = 3
            end
            object dbedt_nm_moeda_4: TDBEdit
              Left = 46
              Top = 90
              Width = 75
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'MOEDA_CONTA_4'
              DataSource = datm_ag.ds_ag
              ReadOnly = True
              TabOrder = 7
            end
            object dbedt_cd_bco_2: TDBEdit
              Left = 11
              Top = 21
              Width = 35
              Height = 21
              DataField = 'CD_BCO_2'
              DataSource = datm_ag.ds_ag
              TabOrder = 0
              OnChange = dbedt_nm_agChange
              OnExit = dbedt_cd_bco_2Exit
              OnKeyDown = dbedt_cd_cidadeKeyDown
            end
            object dbedt_cd_moeda_3: TDBEdit
              Left = 11
              Top = 55
              Width = 35
              Height = 21
              DataField = 'CD_MOEDA_CONTA_3'
              DataSource = datm_ag.ds_ag
              TabOrder = 2
              OnChange = dbedt_nm_agChange
              OnExit = dbedt_cd_moeda_3Exit
              OnKeyDown = dbedt_cd_cidadeKeyDown
            end
            object DBEdit12: TDBEdit
              Left = 158
              Top = 55
              Width = 161
              Height = 21
              DataField = 'NR_CONTA_3'
              DataSource = datm_ag.ds_ag
              TabOrder = 4
              OnChange = dbedt_nm_agChange
            end
            object dbedt_cd_moeda_4: TDBEdit
              Left = 11
              Top = 90
              Width = 35
              Height = 21
              DataField = 'CD_MOEDA_CONTA_4'
              DataSource = datm_ag.ds_ag
              TabOrder = 6
              OnChange = dbedt_nm_agChange
              OnExit = dbedt_cd_moeda_4Exit
              OnKeyDown = dbedt_cd_cidadeKeyDown
            end
            object DBEdit15: TDBEdit
              Left = 158
              Top = 90
              Width = 161
              Height = 21
              DataField = 'NR_CONTA_4'
              DataSource = datm_ag.ds_ag
              TabOrder = 8
              OnChange = dbedt_nm_agChange
            end
            object DBEdit16: TDBEdit
              Left = 332
              Top = 55
              Width = 174
              Height = 21
              DataField = 'ST_ROUTING_INF_2'
              DataSource = datm_ag.ds_ag
              TabOrder = 5
              OnChange = dbedt_nm_agChange
            end
            object dbedtSwift2: TDBEdit
              Left = 332
              Top = 91
              Width = 174
              Height = 21
              DataField = 'ST_SWIFT_2'
              DataSource = datm_ag.ds_ag
              TabOrder = 9
              OnChange = dbedt_nm_agChange
            end
          end
          object DBMemo1: TDBMemo
            Left = 40
            Top = 258
            Width = 681
            Height = 45
            DataField = 'TX_OBX'
            DataSource = datm_ag.ds_ag
            TabOrder = 1
            OnChange = dbedt_nm_agChange
          end
          object pnl1: TPanel
            Left = 2
            Top = 2
            Width = 718
            Height = 126
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 2
            object Label18: TLabel
              Left = 156
              Top = 11
              Width = 52
              Height = 13
              Caption = 'Profit (%)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 331
              Top = 10
              Width = 115
              Height = 13
              Caption = 'Banco Internacional'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_banco: TSpeedButton
              Left = 625
              Top = 22
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
              OnClick = btn_co_bancoClick
            end
            object Label19: TLabel
              Left = 11
              Top = 47
              Width = 39
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_moeda_ct_1: TSpeedButton
              Left = 122
              Top = 60
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
              OnClick = btn_co_moeda_ct_1Click
            end
            object btn_co_moeda_ct_2: TSpeedButton
              Left = 122
              Top = 97
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
              OnClick = btn_co_moeda_ct_2Click
            end
            object Label20: TLabel
              Left = 12
              Top = 84
              Width = 39
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label21: TLabel
              Left = 157
              Top = 48
              Width = 73
              Height = 13
              AutoSize = False
              Caption = 'N'#186' de Conta'
              FocusControl = dbedt_cd_ag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label23: TLabel
              Left = 159
              Top = 84
              Width = 73
              Height = 13
              AutoSize = False
              Caption = 'N'#186' de Conta'
              FocusControl = dbedt_cd_ag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label25: TLabel
              Left = 331
              Top = 48
              Width = 174
              Height = 13
              AutoSize = False
              Caption = 'Routing Information/IBAN'
              FocusControl = dbedt_cd_ag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label13: TLabel
              Left = 11
              Top = 11
              Width = 66
              Height = 13
              AutoSize = False
              Caption = 'IATA Code'
              FocusControl = dbedt_cd_ag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label31: TLabel
              Left = 227
              Top = 11
              Width = 87
              Height = 13
              Caption = 'Prazo p/ Pagto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl1: TLabel
              Left = 331
              Top = 84
              Width = 174
              Height = 13
              AutoSize = False
              Caption = 'Swift Code/ ABA'
              FocusControl = dbedt_cd_ag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_cd_moeda_ct_1: TDBEdit
              Left = 11
              Top = 61
              Width = 35
              Height = 21
              DataField = 'CD_MOEDA_CONTA_1'
              DataSource = datm_ag.ds_ag
              TabOrder = 5
              OnChange = dbedt_nm_agChange
              OnExit = dbedt_cd_moeda_ct_1Exit
              OnKeyDown = dbedt_cd_cidadeKeyDown
            end
            object dbedt_look_nm_banco: TDBEdit
              Left = 370
              Top = 23
              Width = 255
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'NM_BCO_ITL'
              DataSource = datm_ag.ds_ag
              ReadOnly = True
              TabOrder = 4
            end
            object dbedt_nm_moeda_ct_1: TDBEdit
              Left = 46
              Top = 61
              Width = 75
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'MOEDA_CONTA_1'
              DataSource = datm_ag.ds_ag
              ReadOnly = True
              TabOrder = 6
            end
            object dbedt_nm_moeda_ct_2: TDBEdit
              Left = 46
              Top = 98
              Width = 74
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'MOEDA_CONTA_2'
              DataSource = datm_ag.ds_ag
              ReadOnly = True
              TabOrder = 10
            end
            object dbedt_nr_iata: TDBEdit
              Left = 12
              Top = 24
              Width = 133
              Height = 21
              DataField = 'NR_IATA'
              DataSource = datm_ag.ds_ag
              TabOrder = 0
              OnChange = dbedt_nm_agChange
            end
            object dbedt_ds_profit: TDBEdit
              Left = 157
              Top = 24
              Width = 56
              Height = 21
              DataField = 'DS_PROFIT'
              DataSource = datm_ag.ds_ag
              TabOrder = 1
              OnChange = dbedt_nm_agChange
            end
            object DBEdit2: TDBEdit
              Left = 228
              Top = 24
              Width = 42
              Height = 21
              DataField = 'NR_PRAZO_PAGTO'
              DataSource = datm_ag.ds_ag
              TabOrder = 2
              OnChange = dbedt_nm_agChange
            end
            object dbedt_cd_banco: TDBEdit
              Left = 332
              Top = 23
              Width = 39
              Height = 21
              DataField = 'CD_BCO'
              DataSource = datm_ag.ds_ag
              TabOrder = 3
              OnChange = dbedt_nm_agChange
              OnExit = dbedt_cd_bancoExit
              OnKeyDown = dbedt_cd_cidadeKeyDown
            end
            object DBEdit9: TDBEdit
              Left = 158
              Top = 61
              Width = 161
              Height = 21
              DataField = 'NR_CONTA_1'
              DataSource = datm_ag.ds_ag
              TabOrder = 7
              OnChange = dbedt_nm_agChange
            end
            object dbedt_cd_moeda_ct_2: TDBEdit
              Left = 12
              Top = 98
              Width = 35
              Height = 21
              DataField = 'CD_MOEDA_CONTA_2'
              DataSource = datm_ag.ds_ag
              TabOrder = 9
              OnChange = dbedt_nm_agChange
              OnExit = dbedt_cd_moeda_ct_2Exit
              OnKeyDown = dbedt_cd_cidadeKeyDown
            end
            object DBEdit10: TDBEdit
              Left = 158
              Top = 98
              Width = 161
              Height = 21
              DataField = 'NR_CONTA_2'
              DataSource = datm_ag.ds_ag
              TabOrder = 11
              OnChange = dbedt_nm_agChange
            end
            object DBEdit11: TDBEdit
              Left = 332
              Top = 61
              Width = 174
              Height = 21
              DataField = 'ST_ROUTING_INF'
              DataSource = datm_ag.ds_ag
              TabOrder = 8
              OnChange = dbedt_nm_agChange
            end
            object dbedtswift: TDBEdit
              Left = 332
              Top = 98
              Width = 174
              Height = 21
              DataField = 'ST_SWIFT_1'
              DataSource = datm_ag.ds_ag
              TabOrder = 12
              OnChange = dbedt_nm_agChange
            end
          end
        end
        object dbedt_cnpj_agente: TDBEdit
          Left = 540
          Top = 16
          Width = 111
          Height = 21
          DataField = 'NR_CGC_AGENTE'
          DataSource = datm_ag.ds_ag
          MaxLength = 18
          TabOrder = 3
          OnChange = dbedt_nm_agChange
        end
        object dbedtScacCode: TDBEdit
          Left = 625
          Top = 85
          Width = 79
          Height = 21
          DataField = 'DS_SCAC_CODE'
          DataSource = datm_ag.ds_ag
          TabOrder = 14
          OnChange = dbedt_nm_agChange
        end
      end
    end
    object ts_contato: TTabSheet
      Caption = '&Contato'
      ImageIndex = 2
      object Label24: TLabel
        Left = 15
        Top = 256
        Width = 95
        Height = 17
        AutoSize = False
        Caption = 'Nome Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label27: TLabel
        Left = 239
        Top = 295
        Width = 55
        Height = 17
        AutoSize = False
        Caption = 'Telefone Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 364
        Top = 295
        Width = 103
        Height = 14
        AutoSize = False
        Caption = 'E-Mail '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label29: TLabel
        Left = 14
        Top = 295
        Width = 122
        Height = 15
        AutoSize = False
        Caption = 'Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label30: TLabel
        Left = 315
        Top = 256
        Width = 91
        Height = 17
        AutoSize = False
        Caption = 'Depto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 14
        Top = 10
        Width = 21
        Height = 13
        Caption = 'Fax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 159
        Top = 10
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
      object dbg_contato: TDBGrid
        Left = 15
        Top = 58
        Width = 706
        Height = 188
        DataSource = datm_ag.ds_contato
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_contatoDblClick
        OnKeyPress = dbg_contatoKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_CONTATO'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Contato'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 244
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DS_DEPTO_CONTATO'
            Title.Alignment = taCenter
            Title.Caption = 'Departamento'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 174
            Visible = True
          end>
      end
      object dbedt_nr_fax: TDBEdit
        Left = 15
        Top = 23
        Width = 138
        Height = 21
        DataField = 'NR_FAX'
        DataSource = datm_ag.ds_ag
        TabOrder = 0
        OnChange = dbedt_nm_agChange
      end
      object dbedt_ds_homepage: TDBEdit
        Left = 159
        Top = 23
        Width = 562
        Height = 21
        DataField = 'DS_HOMEPAGE'
        DataSource = datm_ag.ds_ag
        TabOrder = 1
        OnChange = dbedt_nm_agChange
      end
      object dbedt_nm_contato: TDBEdit
        Left = 15
        Top = 269
        Width = 287
        Height = 21
        DataField = 'NM_CONTATO'
        DataSource = datm_ag.ds_contato
        TabOrder = 3
        OnChange = dbedt_cd_contatoChange
      end
      object dbedt_ds_depto_contato: TDBEdit
        Left = 316
        Top = 269
        Width = 307
        Height = 21
        DataField = 'DS_DEPTO_CONTATO'
        DataSource = datm_ag.ds_contato
        TabOrder = 4
        OnChange = dbedt_cd_contatoChange
      end
      object dbedt_ds_cargo_contato: TDBEdit
        Left = 15
        Top = 308
        Width = 213
        Height = 21
        DataField = 'DS_CARGO_CONTATO'
        DataSource = datm_ag.ds_contato
        TabOrder = 5
        OnChange = dbedt_cd_contatoChange
      end
      object dbedt_nr_fone_contato: TDBEdit
        Left = 241
        Top = 308
        Width = 111
        Height = 21
        DataField = 'NR_FONE_CONTATO'
        DataSource = datm_ag.ds_contato
        TabOrder = 6
        OnChange = dbedt_cd_contatoChange
      end
      object dbedt_ds_email_contato: TDBEdit
        Left = 364
        Top = 308
        Width = 268
        Height = 21
        DataField = 'DS_EMAIL_CONTATO'
        DataSource = datm_ag.ds_contato
        TabOrder = 7
        OnChange = dbedt_cd_contatoChange
      end
    end
    object ts_dados_desemb: TTabSheet
      Caption = 'Dados B'#225'sicos'
      ImageIndex = 3
      object Label5: TLabel
        Left = 23
        Top = 16
        Width = 44
        Height = 13
        AutoSize = False
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 24
        Top = 55
        Width = 36
        Height = 13
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 24
        Top = 97
        Width = 90
        Height = 13
        AutoSize = False
        Caption = 'Nome Reduzido'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 24
        Top = 29
        Width = 53
        Height = 21
        TabStop = False
        DataField = 'CD_AGENTE'
        DataSource = datm_ag.ds_ag
        ParentColor = True
        TabOrder = 0
      end
      object dbedt_agente: TDBEdit
        Left = 24
        Top = 68
        Width = 537
        Height = 21
        DataField = 'NM_AGENTE'
        DataSource = datm_ag.ds_ag
        TabOrder = 1
        OnChange = dbedt_nm_agChange
      end
      object DBEdit3: TDBEdit
        Left = 24
        Top = 110
        Width = 309
        Height = 21
        DataField = 'NM_AGENTE_REDUZIDO'
        DataSource = datm_ag.ds_ag
        TabOrder = 2
        OnChange = dbedt_nm_agChange
      end
    end
  end
  object pnl_btn_ag: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 52
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      734
      52)
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 39
      Height = 44
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
      Left = 122
      Top = 4
      Width = 39
      Height = 44
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
      Left = 372
      Top = 4
      Width = 39
      Height = 44
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
      Top = 4
      Width = 39
      Height = 44
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
      Left = 83
      Top = 4
      Width = 39
      Height = 44
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
    object dbnvg: TDBNavigator
      Left = 255
      Top = 13
      Width = 104
      Height = 26
      DataSource = datm_ag.ds_ag
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
    object Panel1: TPanel
      Left = 423
      Top = 2
      Width = 309
      Height = 48
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
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
        OnKeyDown = edt_chaveKeyDown
      end
      object cb_ordem: TComboBox
        Left = 148
        Top = 20
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 588
    Top = 392
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

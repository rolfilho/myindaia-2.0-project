object frm_servico: Tfrm_servico
  Left = 251
  Top = 170
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Tabela de Servi'#231'os'
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
  DesignSize = (
    742
    504)
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 303
    Top = 329
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
  object Label8: TLabel
    Left = 88
    Top = 250
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
  object pgctrl_servico: TPageControl
    Left = 0
    Top = 53
    Width = 742
    Height = 451
    ActivePage = ts_dados_basicos
    Align = alClient
    TabOrder = 0
    OnChange = pgctrl_servicoChange
    OnChanging = pgctrl_servicoChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 423
        Align = alClient
        DataSource = datm_servico.ds_servico
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
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
            FieldName = 'CD_SERVICO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_SERVICO'
            Title.Caption = 'Servi'#231'o'
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
            FieldName = 'NM_CLASSIFICACAO'
            Title.Caption = 'Classifica'#231#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 136
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_VIA_TRANSP'
            Title.Caption = 'Via de Transporte'
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
            FieldName = 'LookAtivo'
            Title.Alignment = taCenter
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
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 423
        Align = alClient
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_codigo: TLabel
          Left = 27
          Top = 21
          Width = 40
          Height = 13
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nome: TLabel
          Left = 72
          Top = 21
          Width = 33
          Height = 13
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_via_transp: TLabel
          Left = 27
          Top = 103
          Width = 84
          Height = 13
          Caption = 'Via Transporte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_classif: TSpeedButton
          Left = 305
          Top = 76
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
          OnClick = btn_co_classifClick
        end
        object lbl_calssif: TLabel
          Left = 27
          Top = 62
          Width = 76
          Height = 13
          Caption = 'Classifica'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_via_transp: TSpeedButton
          Left = 305
          Top = 117
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
          OnClick = btn_co_via_transpClick
        end
        object lblAtivo: TLabel
          Left = 90
          Top = 269
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
        object Label4: TLabel
          Left = 27
          Top = 144
          Width = 160
          Height = 13
          Caption = 'Prazo para Conclus'#227'o (dias)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 202
          Top = 145
          Width = 101
          Height = 13
          Caption = 'Evento Conclusor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ev_conclusor: TSpeedButton
          Left = 531
          Top = 159
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
          OnClick = btn_co_ev_conclusorClick
        end
        object Label6: TLabel
          Left = 26
          Top = 269
          Width = 51
          Height = 13
          Caption = 'Followup'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_adm_temp: TLabel
          Left = 216
          Top = 269
          Width = 96
          Height = 13
          Caption = 'Adm. Tempor'#225'ria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 154
          Top = 269
          Width = 37
          Height = 13
          Caption = 'Indent'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 26
          Top = 309
          Width = 79
          Height = 13
          Caption = 'Evento Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 322
          Top = 309
          Width = 72
          Height = 13
          Caption = 'Evento Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ev_inicial: TSpeedButton
          Left = 283
          Top = 323
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
          OnClick = btn_co_ev_inicialClick
        end
        object btn_co_ev_final: TSpeedButton
          Left = 593
          Top = 323
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
          OnClick = btn_co_ev_finalClick
        end
        object btn_co_grupo_servico: TSpeedButton
          Left = 304
          Top = 240
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
          OnClick = btn_co_grupo_servicoClick
        end
        object Label12: TLabel
          Left = 26
          Top = 226
          Width = 35
          Height = 13
          Caption = 'Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 321
          Top = 269
          Width = 136
          Height = 13
          Caption = 'Controle de Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 479
          Top = 269
          Width = 29
          Height = 13
          Caption = 'Aladi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 565
          Top = 269
          Width = 62
          Height = 13
          Caption = 'Fumiga'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 26
          Top = 186
          Width = 134
          Height = 13
          Caption = 'Configura'#231#227'o de Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnConfigStatus: TSpeedButton
          Left = 355
          Top = 200
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
          OnClick = btnConfigStatusClick
        end
        object lblInSubstitui: TLabel
          Left = 339
          Top = 362
          Width = 378
          Height = 39
          Caption = 
            'Permitir que os processos(DT, IE e IN) sejam ignorados pelo aler' +
            'ta'#13#10'quando existir um desembara'#231'o mais recente utilizando a mesm' +
            'a'#13#10'refer'#234'ncia/item?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_descricao: TDBEdit
          Left = 72
          Top = 36
          Width = 309
          Height = 21
          DataField = 'NM_SERVICO'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = dbedt_descricaoChange
        end
        object dbedt_nm_classif: TDBEdit
          Left = 64
          Top = 76
          Width = 239
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookClassif'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_nm_via_transp: TDBEdit
          Left = 64
          Top = 117
          Width = 239
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookViaTransp'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
        end
        object dblkpcbox_ativo: TDBLookupComboBox
          Left = 89
          Top = 283
          Width = 50
          Height = 21
          DataField = 'IN_ATIVO'
          DataSource = datm_servico.ds_servico
          DropDownRows = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_servico.ds_yesno
          ParentFont = False
          TabOrder = 8
          OnClick = dbedt_descricaoChange
        end
        object dbedt_nr_dias_conclusao: TDBEdit
          Left = 26
          Top = 159
          Width = 33
          Height = 21
          DataField = 'NR_DIAS_CONCLUSAO'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 4
          OnChange = dbedt_descricaoChange
          OnExit = dbedt_cd_classifExit
        end
        object dbedt_nm_ev_conclusor: TDBEdit
          Left = 240
          Top = 159
          Width = 289
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookEventoConclusor'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
        end
        object dblkpcbox_followup: TDBLookupComboBox
          Left = 26
          Top = 283
          Width = 50
          Height = 21
          DataField = 'IN_FOLLOWUP'
          DataSource = datm_servico.ds_servico
          DropDownRows = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_servico.ds_yesno
          ParentFont = False
          TabOrder = 7
          OnClick = dbedt_descricaoChange
        end
        object dblckpbox_adm_temp: TDBLookupComboBox
          Left = 216
          Top = 283
          Width = 48
          Height = 21
          DataField = 'LookAdmTemp'
          DataSource = datm_servico.ds_servico
          DropDownRows = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ListField = 'TX_YESNO'
          ParentFont = False
          TabOrder = 10
          OnClick = dbedt_descricaoChange
        end
        object dblckpbox_indent: TDBLookupComboBox
          Left = 152
          Top = 283
          Width = 50
          Height = 21
          DataField = 'IN_INDENT'
          DataSource = datm_servico.ds_servico
          DropDownRows = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_servico.ds_yesno
          ParentFont = False
          TabOrder = 9
          OnClick = dbedt_descricaoChange
        end
        object dbedt_nm_ev_inicial: TDBEdit
          Left = 64
          Top = 323
          Width = 217
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookInicial'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
          ParentFont = False
          ReadOnly = True
          TabOrder = 17
        end
        object dbedt_nm_ev_final: TDBEdit
          Left = 358
          Top = 323
          Width = 233
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookFim'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
          ParentFont = False
          ReadOnly = True
          TabOrder = 18
        end
        object dbedt_nm_grupo_servico: TDBEdit
          Left = 64
          Top = 240
          Width = 238
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookServico'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 60
          ParentFont = False
          ReadOnly = True
          TabOrder = 19
        end
        object dblckpbox_cont_venc: TDBLookupComboBox
          Left = 321
          Top = 283
          Width = 122
          Height = 21
          DataField = 'LookContVenc'
          DataSource = datm_servico.ds_servico
          DropDownRows = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          OnClick = dblckpbox_cont_vencClick
        end
        object dbedt_cd_servico: TDBEdit
          Left = 27
          Top = 36
          Width = 41
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_SERVICO'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_cd_classif: TDBEdit
          Left = 26
          Top = 76
          Width = 39
          Height = 21
          DataField = 'CD_CLASSIFICACAO'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_descricaoChange
          OnExit = dbedt_cd_classifExit
          OnKeyDown = dbedt_cd_classifKeyDown
        end
        object dbedt_cd_via_transp: TDBEdit
          Left = 26
          Top = 117
          Width = 39
          Height = 21
          DataField = 'CD_VIA_TRANSPORTE'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = dbedt_descricaoChange
          OnExit = dbedt_cd_via_transpExit
          OnKeyDown = dbedt_cd_classifKeyDown
        end
        object dbedt_cd_ev_conclusor: TDBEdit
          Left = 202
          Top = 159
          Width = 39
          Height = 21
          DataField = 'CD_EVENTO_CONCLUSOR'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnChange = dbedt_descricaoChange
          OnExit = dbedt_cd_ev_basicoExit
          OnKeyDown = dbedt_cd_classifKeyDown
        end
        object dbedt_cd_grupo_servico: TDBEdit
          Left = 26
          Top = 240
          Width = 39
          Height = 21
          DataField = 'CD_GRUPO'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnChange = dbedt_cd_grupo_servicoChange
          OnExit = dbedt_cd_grupo_servicoExit
          OnKeyDown = dbedt_cd_grupo_servicoKeyDown
        end
        object dbedt_cd_ev_inicial: TDBEdit
          Left = 26
          Top = 323
          Width = 39
          Height = 21
          DataField = 'CD_EV_INI'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          OnChange = dbedt_cd_ev_inicialChange
          OnExit = dbedt_cd_ev_inicialExit
          OnKeyDown = dbedt_cd_ev_inicialKeyDown
        end
        object dbedt_cd_ev_final: TDBEdit
          Left = 322
          Top = 323
          Width = 37
          Height = 21
          DataField = 'CD_EV_FIM'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          OnChange = dbedt_cd_ev_finalChange
          OnExit = dbedt_cd_ev_finalExit
          OnKeyDown = dbedt_cd_ev_finalKeyDown
        end
        object dbradgrp_servico: TDBRadioGroup
          Left = 26
          Top = 357
          Width = 283
          Height = 45
          Caption = 'Tipo do Servi'#231'o'
          Columns = 2
          DataField = 'TP_SERVICO'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Desembara'#231'o'
            'Agenciamento')
          ParentFont = False
          TabOrder = 20
          Values.Strings = (
            '0'
            '1'
            '2')
          OnChange = dbedt_cd_grupo_servicoChange
        end
        object dblckpbox_aladi: TDBLookupComboBox
          Left = 479
          Top = 283
          Width = 60
          Height = 21
          DataField = 'LookAladi'
          DataSource = datm_servico.ds_servico
          DropDownRows = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ListField = 'TX_YESNO'
          ParentFont = False
          TabOrder = 21
          OnClick = dbedt_descricaoChange
        end
        object dblckpbox_fumigacao: TDBLookupComboBox
          Left = 565
          Top = 283
          Width = 60
          Height = 21
          DataField = 'LookFumigacao'
          DataSource = datm_servico.ds_servico
          DropDownRows = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ListField = 'TX_YESNO'
          ParentFont = False
          TabOrder = 22
          OnClick = dbedt_descricaoChange
        end
        object edtNomeConfig: TEdit
          Left = 64
          Top = 200
          Width = 289
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 24
        end
        object dbedtConfigStatus: TDBEdit
          Left = 26
          Top = 200
          Width = 39
          Height = 21
          DataField = 'NR_CAD_CONFIG_STATUS'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 23
          OnChange = btnConfigStatusClick
          OnExit = dbedt_cd_ev_basicoExit
          OnKeyDown = dbedt_cd_classifKeyDown
        end
        object dbchkInSubstitui: TDBCheckBox
          Left = 323
          Top = 362
          Width = 13
          Height = 15
          DataField = 'IN_SUBSTITUI'
          DataSource = datm_servico.ds_servico
          TabOrder = 25
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbedt_cd_ev_finalChange
        end
        object DBCheckBox1: TDBCheckBox
          Left = 384
          Top = 243
          Width = 97
          Height = 17
          Caption = 'Necessita LI'
          DataField = 'IN_LI'
          DataSource = datm_servico.ds_servico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 26
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dblckpbox_cont_vencClick
        end
      end
    end
    object ts_servico_evento: TTabSheet
      Caption = 'Servi'#231'o X Evento'
      object pgctrl_servico_evento: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 423
        ActivePage = ts_lista2
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_servicoChange
        OnChanging = pgctrl_servicoChanging
        object ts_lista2: TTabSheet
          Caption = '    Lista    '
          object Label3: TLabel
            Left = 11
            Top = 7
            Width = 44
            Height = 13
            Caption = 'Servi'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbg_contatos: TDBGrid
            Left = 1
            Top = 53
            Width = 724
            Height = 340
            DataSource = datm_servico.ds_servico_evento
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
                FieldName = 'NR_ORDEM'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 41
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_EVENTO'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LookEvento'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 216
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_ev_basico'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 124
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PZ_DO_EV_BASICO'
                Title.Caption = 'Prazo '
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Look_ev_futuro'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 118
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PZ_ATE_EV_FUTURO'
                Title.Caption = 'Prazo '
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 35
                Visible = True
              end>
          end
          object dbedt_nm_servico2: TDBEdit
            Left = 49
            Top = 20
            Width = 289
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NM_SERVICO'
            DataSource = datm_servico.ds_servico
            ReadOnly = True
            TabOrder = 2
          end
          object dbedt_cd_servico2: TDBEdit
            Left = 11
            Top = 20
            Width = 39
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_SERVICO'
            DataSource = datm_servico.ds_servico
            ReadOnly = True
            TabOrder = 1
          end
        end
        object ts_dados_basicos2: TTabSheet
          Caption = '   Dados B'#225'sicos   '
          object pnl_servico_evento: TPanel
            Left = 0
            Top = 0
            Width = 726
            Height = 395
            Align = alClient
            BevelInner = bvLowered
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object lbl_evento: TLabel
              Left = 28
              Top = 73
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
            object lbl_pz_ev_basico: TLabel
              Left = 400
              Top = 130
              Width = 115
              Height = 13
              Caption = 'Prazo ap'#243's Ev.Base'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_pz_ev_futuro: TLabel
              Left = 400
              Top = 189
              Width = 127
              Height = 13
              Caption = 'Prazo antes Ev.Futuro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_ordem: TLabel
              Left = 400
              Top = 73
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
            object btn_co_evento: TSpeedButton
              Left = 356
              Top = 86
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
              OnClick = btn_co_eventoClick
            end
            object lbl_ev_basico: TLabel
              Left = 28
              Top = 130
              Width = 72
              Height = 13
              Caption = 'Evento base'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_ev_basico: TSpeedButton
              Left = 356
              Top = 144
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
              OnClick = btn_co_ev_basicoClick
            end
            object lbl_ev_futuro: TLabel
              Left = 28
              Top = 186
              Width = 81
              Height = 13
              Caption = 'Evento Futuro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_ev_futuro: TSpeedButton
              Left = 356
              Top = 201
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
              OnClick = btn_co_ev_futuroClick
            end
            object lbl_servico: TLabel
              Left = 28
              Top = 20
              Width = 44
              Height = 13
              Caption = 'Servi'#231'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 448
              Top = 73
              Width = 70
              Height = 13
              Caption = 'Tipo Evento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 461
              Top = 148
              Width = 34
              Height = 13
              Caption = 'Horas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label19: TLabel
              Left = 461
              Top = 205
              Width = 34
              Height = 13
              Caption = 'Horas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_pz_do_ev_basico: TDBEdit
              Left = 400
              Top = 144
              Width = 57
              Height = 21
              DataField = 'PZ_DO_EV_BASICO'
              DataSource = datm_servico.ds_servico_evento
              TabOrder = 4
              OnChange = dbedt_cd_eventoChange
            end
            object dbedt_pz_ate_ev_futuro: TDBEdit
              Left = 400
              Top = 201
              Width = 57
              Height = 21
              DataField = 'PZ_ATE_EV_FUTURO'
              DataSource = datm_servico.ds_servico_evento
              TabOrder = 6
              OnChange = dbedt_cd_eventoChange
            end
            object dbedt_ordem: TDBEdit
              Left = 400
              Top = 86
              Width = 33
              Height = 21
              DataField = 'NR_ORDEM'
              DataSource = datm_servico.ds_servico_evento
              TabOrder = 1
              OnChange = dbedt_cd_eventoChange
              OnExit = dbedt_ordemExit
            end
            object dbedt_nm_evento: TDBEdit
              Left = 66
              Top = 86
              Width = 289
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookEvento'
              DataSource = datm_servico.ds_servico_evento
              ReadOnly = True
              TabOrder = 7
            end
            object dbedt_nm_ev_basico: TDBEdit
              Left = 66
              Top = 144
              Width = 289
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'Look_ev_basico'
              DataSource = datm_servico.ds_servico_evento
              ReadOnly = True
              TabOrder = 8
            end
            object dbedt_nm_ev_futuro: TDBEdit
              Left = 66
              Top = 201
              Width = 289
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'Look_ev_futuro'
              DataSource = datm_servico.ds_servico_evento
              ReadOnly = True
              TabOrder = 9
            end
            object dbedt_nm_servico: TDBEdit
              Left = 66
              Top = 33
              Width = 289
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookServico'
              DataSource = datm_servico.ds_servico_evento
              ReadOnly = True
              TabOrder = 11
            end
            object dblckpbox_tipo_evento: TDBLookupComboBox
              Left = 448
              Top = 86
              Width = 140
              Height = 21
              DataField = 'CD_TIPO_EVENTO'
              DataSource = datm_servico.ds_servico_evento
              KeyField = 'CD_TIPO_EVENTO'
              ListField = 'NM_TIPO_EVENTO'
              ListSource = datm_servico.ds_ttp_tipo_evento
              TabOrder = 2
              OnClick = dbedt_cd_eventoChange
            end
            object dbedt_cd_evento: TDBEdit
              Left = 28
              Top = 86
              Width = 39
              Height = 21
              DataField = 'CD_EVENTO'
              DataSource = datm_servico.ds_servico_evento
              TabOrder = 0
              OnChange = dbedt_cd_eventoChange
              OnExit = dbedt_cd_eventoExit
              OnKeyDown = dbedt_cd_classifKeyDown
            end
            object dbedt_cd_ev_basico: TDBEdit
              Left = 28
              Top = 144
              Width = 39
              Height = 21
              DataField = 'CD_EV_BASICO'
              DataSource = datm_servico.ds_servico_evento
              TabOrder = 3
              OnChange = dbedt_cd_eventoChange
              OnExit = dbedt_cd_ev_basicoExit
              OnKeyDown = dbedt_cd_classifKeyDown
            end
            object dbedt_cd_ev_futuro: TDBEdit
              Left = 28
              Top = 201
              Width = 39
              Height = 21
              DataField = 'CD_EV_FUTURO'
              DataSource = datm_servico.ds_servico_evento
              TabOrder = 5
              OnChange = dbedt_cd_eventoChange
              OnExit = dbedt_cd_ev_futuroExit
              OnKeyDown = dbedt_cd_classifKeyDown
            end
            object dbedt_cd_servico3: TDBEdit
              Left = 28
              Top = 33
              Width = 39
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'CD_SERVICO'
              DataSource = datm_servico.ds_servico_evento
              ReadOnly = True
              TabOrder = 10
            end
            object dbchkIN_PRAZO_UTIL: TDBCheckBox
              Left = 400
              Top = 235
              Width = 179
              Height = 17
              Caption = 'Descontar Final de Semana'
              DataField = 'IN_PRAZO_UTIL'
              DataSource = datm_servico.ds_servico_evento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 12
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbchkIN_PRAZO_UTILClick
            end
            object dbchkIN_PRAZO_FERIADO: TDBCheckBox
              Left = 400
              Top = 259
              Width = 133
              Height = 17
              Caption = 'Descontar Feriados'
              DataField = 'IN_PRAZO_FERIADO'
              DataSource = datm_servico.ds_servico_evento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 13
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbchkIN_PRAZO_UTILClick
            end
          end
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 53
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object btn_incluir: TSpeedButton
      Left = 4
      Top = 4
      Width = 38
      Height = 45
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
      Left = 118
      Top = 4
      Width = 38
      Height = 45
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
      Left = 396
      Top = 4
      Width = 36
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
    object btn_salvar: TSpeedButton
      Left = 42
      Top = 4
      Width = 38
      Height = 45
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
      Left = 80
      Top = 4
      Width = 38
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
    object btn_duplicar: TSpeedButton
      Left = 156
      Top = 4
      Width = 38
      Height = 45
      Hint = 'Duplicar Servi'#231'o X Evento'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFFCCCCCF333333333377777F33FFFFFFFFCC
        CCCF33333333337F337F333FFFFFFFCCCCCF33333333337F337F3333FFFFFFCC
        CCCF33333333337FFF7F33333FFFFFCCCCCF3333333333777773333333FFFFFF
        FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
        00FF33333333333777FF333333333F00000F33FFFFF33777777F3CCCCC333000
        0000377777F3377777773CCCCC33333000FF37F337F3333777F33CCCCC333330
        00FF37F337F3333777F33CCCCC33333000FF37FFF7F333F777333CCCCC333000
        03FF3777773337777333333333333333333F3333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_duplicarClick
    end
    object btn_atualiza_processo: TSpeedButton
      Left = 200
      Top = 4
      Width = 38
      Height = 45
      Cursor = crHandPoint
      Hint = 
        'Atualiza as modifica'#231#245'es do servi'#231'o selecionado '#13#10'              ' +
        '    em todos os processos'
      Flat = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000EE0E0000EE0E00000001000000010000CE630000FFD6
        AD00FFE7C600FFEFD600FFF7E700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
        0505050505050505050505050505000000000000000000000005050505050006
        0404040403020101000505050505000606060604040302010005050500000006
        0606060606040302000505050006000606060606060604030005050500060006
        0606060606060604000500000006000606060606060606040005000600060000
        0000000000000000000500060006060000000000000000000505000600060606
        0606060606040005050500060000000000000000000000050505000606000000
        0000000000000505050500060606060606060604000505050505000000000000
        0000000000050505050505000000000000000000050505050505}
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_atualiza_processoClick
    end
    object btnAtualizaFollowup: TSpeedButton
      Left = 243
      Top = 4
      Width = 38
      Height = 45
      Hint = 'Atualizar todos os processos do servi'#231'o'
      Flat = True
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF908E8E908E8E908E8E908E
        8E908E8E908E8EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8F8F8F
        8F8F8F8F8F8F8F8F8F8F8F8F8F8F8FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90
        8E8E908E8E9F9C9CA4A4A4A9A9A9ABABABA9A9A99C9C9C9C9C9C9C9C9CFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF8F8F8F8F8F8F9D9D9DA4A4A4A9A9A9ABABABA9A9A99C9C9C9C
        9C9C9C9C9CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF908E8E919090B4ACAAD0C6C5D0C6C5C5BCBDBBBBBCBBBB
        BCC8C7C8D7D6D7D1D1D2B2B1B19190909C9C9CFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF8F8F8F909090AFAFAFCACACACACACA
        C0C0C0BBBBBBBBBBBBC7C7C7D6D6D6D1D1D1B1B1B19090909C9C9CFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF908E8EAA9F9FDAC6C5D6
        C3C49F9493867E74958A789D96829D968288867C8A8883B6B6B6E3E4E5DAD9D9
        A3A3A39C9C9CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8F8F
        8FA4A4A4CFCFCFCCCCCC9999997D7D7D8686868F8F8F8F8F8F828282868686B6
        B6B6E4E4E4D9D9D9A3A3A39C9C9CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF908E8EB3A5A5EBCFCFB6A3A37D746BB0AA95E6E3D2FCF8EA849AF5C8CF
        F0FCF5E3D9D5BDA29B888D8C87D7D6D7EEEDEDABABAB9C9C9CFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF8F8F8FACACACDDDDDDACACAC747474A2A2A2DCDCDC
        F3F3F3BCBCBCDCDCDCEFEFEFCBCBCB9595958A8A8AD6D6D6EDEDEDABABAB9C9C
        9CFF00FFFF00FFFF00FFFF00FFFF00FF908E8EAA9F9FF0CFCFA99595827D6FE6
        E3D2FFFFFFFFFBF2FAE6CEAC9FBED3BEBCFAE3C6FCF5E3FFFFECCCCAB18D8B84
        D7D7D8EEEDEDA4A3A39C9C9CFF00FFFF00FFFF00FFFF00FF8F8F8FA4A4A4DFDF
        DF9F9F9F787878DCDCDCFFFFFFF8F8F8E4E4E4AEAEAEC7C7C7E0E0E0EFEFEFF5
        F5F5BEBEBE888888DCDCDCEDEDEDA3A3A39C9C9CFF00FFFF00FFFF00FFFF00FF
        949090E7C6C7BCA2A180786AF0F0E5FFFFFFFBF5DFF6D7AAEFBC85F8BF80F4C1
        87F1C591F4D1A2FAE6C7FFFFECD9D5BD477F4747944AD8DDD89C9C9CFF00FFFF
        00FFFF00FFFF00FF929292D6D6D6AEAEAE757575EAEAEAFFFFFFEDEDEDD0D0D0
        BABABABCBCBCBDBDBDC1C1C1CBCBCBE0E0E0F5F5F5D3D3D3777777818181DADA
        DA9C9C9CFF00FFFF00FFFF00FF908E8EBFABABE8C2C3776B61E4DECEFFFFFFFD
        F4D2F8E2B5F3CD9BF0C18EF2C997F6D7AAF8E2B5FAE9BDFCEDC2FDF4D29DC694
        249C3932AD4D68A76AB6B6B69C9C9CFF00FFFF00FF8F8F8FB5B5B5D5D5D56C6C
        6CD9D9D9FFFFFFE7E7E7D6D6D6C7C7C7BFBFBFC4C4C4D0D0D0D6D6D6DBDBDBDF
        DFDFE7E7E7BCBCBC7474748383839B9B9BB6B6B69C9C9CFF00FFFF00FF908E8E
        EAC7C6A58D8CA29B88FFFFFFFAE3C6F7D19DF3CD9BF2C997F4D1A2F9E5B8FBF4
        CBFEFCD5FFFFD8FFFFD8B4D39A1F8E2D54DA805CE58C249C3983B3849C9C9CFF
        00FFFF00FF8F8F8FD8D8D8989898959595FFFFFFE0E0E0CACACAC7C7C7C4C4C4
        CBCBCBD8D8D8E3E3E3E9E9E9EBEBEBEBEBEBB6B6B6686868ABABABB3B3B37474
        749B9B9B9C9C9CFF00FFA59A9BA89C9CEEC8C87D7067DBD8C4FFF6E9F0C18EEF
        BC85F1C591F5D5A5FCEDC2FFFFDAFFFFDDFFFFDAFFFFDAD8E9B9268F2F52DA7E
        5CE58C52DA7E45D06B148A225386559C9C9C9F9F9FA2A2A2DBDBDB727272CFCF
        CFF4F4F4BFBFBFBABABAC1C1C1CDCDCDDFDFDFECECECEEEEEEECECECECECECD1
        D1D16E6E6EAAAAAAB3B3B3AAAAAA9E9E9E6363638080809C9C9CA59A9BB9A7A7
        E5BFBE7D7067FFFEE9FEE2C3EEB77FFBC58EFFDAA7FBF4CBFEFCD5CCCAB1E6E7
        C8FFFFDAD8E9B93693384ED5785DE9904ED57842CE673AC95C2CBB4714881C9C
        9C9C9F9F9FB0B0B0D1D1D1727272F4F4F4E0E0E0B6B6B6C4C4C4D3D3D3E3E3E3
        E9E9E9BEBEBED7D7D7F0F0F0D1D1D1787878A5A5A5B6B6B6A5A5A59C9C9C9595
        958787876262629C9C9CA59A9BC1ACACE0BABA867E72ABB9F2D4BAB4EEB77F9C
        8468958A789D9C8A76766B66666988867CEAECCA398B381C8C262CA7452CA745
        42CE6735C3542BBA451CA52E12981E05730B9F9F9FB6B6B6CDCDCD7C7C7CCECE
        CEC4C4C4B6B6B6828282868686939393707070676767828282DBDBDB75757568
        68687D7D7D7D7D7D9C9C9C909090868686747474696969505050A59A9BC1ACAC
        E0BABA867E74768FEEBFAAB6EFBC85605A4F51514C51514C2727297272758D8B
        84E2EBC2B4D39AB9D7ACB2D1B227882C35C3542CBD471EAB312484294E8E5105
        730B9F9F9FB6B6B6CDCDCD7D7D7DB2B2B2B4B4B4BABABA6B6B6B626262626262
        3C3C3C737373888888D6D6D6B6B6B6C1C1C1C1C1C16B6B6B9090908888887878
        78686868828282505050A59A9BB7A5A5E8C2C381796FFBF5DFF7DDB6F0C08BFA
        DDAEFBF4CB6D6C61414241A9A996E6E7C8FFFFDAFFFFE6FFFFFEFFFFFF409545
        26B33D1FB43412981E74AF77AFAFAF9C9C9C9F9F9FAEAEAED5D5D5787878EDED
        EDD6D6D6BDBDBDDCDCDCE9E9E97B7B7B5555559F9F9FD7D7D7ECECECF2F2F2FE
        FEFEFFFFFF7E7E7E8080807D7D7D696969919191AFAFAF9C9C9CA59A9BA59A9B
        EEC8C88A7D7AD9D5BDFEEED4F7D19DF7DDB66D6C61414241D6D6BBFFFFE2FFFF
        DDFFFEE9FFFFFEFFFFFFF5F9F5288A2E1CAC2F12AA220A8B13B2D1B29C9C9C9C
        9C9C9F9F9F9F9F9FDBDBDB828282CBCBCBE9E9E9D3D3D3DEDEDE7B7B7B555555
        D1D1D1F0F0F0EEEEEEF4F4F4FEFEFEFFFFFFF8F8F86D6D6D7878787272725E5E
        5EC1C1C19C9C9C9C9C9CFF00FFA59A9BE6C4C3B79E9FA4A28FFFFEE9E0CAA954
        4D444A4A47E3E3C5FFFFE2FFFFE2FFFFF4FFFFFFFFFFFFFFFFFFA9CDAB0D8817
        12AA220DA11A27882CD6D9D5979696FF00FFFF00FF9F9F9FD4D4D4AAAAAA9999
        99F4F4F4CECECE6060605C5C5CDCDCDCF4F4F4F0F0F0F9F9F9FFFFFFFFFFFFFF
        FFFFC6C6C65E5E5E7272726B6B6B6B6B6BD7D7D7969696FF00FFFF00FFA59A9B
        B9A7A7EEC8C88C8380E6E4C5C0BDB0565650E6E4C5FFFFEEFFFFF3FFFFFDFFFF
        FFFFFFFFFFFFFFE4EADD288A2E0E9D190FA91D0A8C1383B384B2B1B1979696FF
        00FFFF00FF9F9F9FB0B0B0DBDBDB868686D5D5D5B8B8B8676767DDDDDDF8F8F8
        F9F9F9FEFEFEFFFFFFFFFFFFFFFFFFE8E8E86D6D6D6969697070705F5F5F9B9B
        9BB1B1B1969696FF00FFFF00FFFF00FF908E8EE1C2C2CFB4B496938AEAECCAFE
        FBDCFFFFECFFFFFFFFFFFFFCFDFCF5F9F5CCE1CD7AB27C228A280E9D190FA91D
        0B931647944AD0D6D0979696FF00FFFF00FFFF00FFFF00FF8F8F8FD1D1D1C1C1
        C1909090DBDBDBF2F2F2F7F7F7FFFFFFFFFFFFFCFCFCF8F8F8DDDDDDA5A5A56A
        6A6A696969707070636363818181D3D3D3969696FF00FFFF00FFFF00FFFF00FF
        979696A29A9AEACAC9C5AFB0A09D94E6E7C8FFFFF3FFFFFE4C994F2383341B84
        210D85160E941A0EA31B0DA11A0A8B133D8E41D8DDD89C9C9C979696FF00FFFF
        00FFFF00FFFF00FF9696969E9E9ED9D9D9BABABA9A9A9AD7D7D7F9F9F9FEFEFE
        8686866767676363635D5D5D6565656C6C6C6B6B6B5E5E5E797979DADADA9C9C
        9C969696FF00FFFF00FFFF00FFFF00FFFF00FF979696AA9F9FE5C9C8CFBABBA5
        9F9BC4C3B2E4EADD93BF8D4092532C8B321C8C2614881C1B8421398B387DAE80
        D8DDD8A3A3A3979696FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF969696A4A4
        A4D6D6D6C4C4C4A0A0A0BBBBBBE3E3E3A6A6A67D7D7D6F6F6F68686862626263
        6363757575A5A5A5E0E0E0A3A3A3969696FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF979696A29A9AD3BEBCDBC8C9C1B5B6B4ACAABDB6AECDC1B0C8BD
        AFBDB6AEBCB8B6D1D1D2E3E4E5D1D0D09A9A9A979696FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF9696969E9E9EC7C7C7D1D1D1BBBBBBAFAFAF
        B5B5B5BEBEBEBBBBBBB5B5B5B9B9B9D1D1D1E9E9E9D8D8D89A9A9A969696FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF979696979696A9
        A5A5C5BCBDD0C6C5C8C2C3C2C2C3C5C6C8CCCCCDD3D2D3C8C7C8A9A9A9979696
        979696FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF969696969696A7A7A7C0C0C0CACACAC5C5C5C2C2C2C6C6C6CCCCCCD2D2D2C7
        C7C7A9A9A9969696969696FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF979696979696979696A19F9FA3A3A3A4A4
        A4A0A0A0979696979696979696FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF969696969696969696
        A0A0A0A3A3A3A4A4A4A0A0A0969696969696969696FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF908E8E908E8E908E8E908E8E908E8E908E8EFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8FFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAtualizaFollowupClick
    end
    object dbnvg: TDBNavigator
      Left = 289
      Top = 12
      Width = 104
      Height = 27
      DataSource = datm_servico.ds_servico
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object pnl_pesquisa: TPanel
      Left = 433
      Top = 2
      Width = 307
      Height = 49
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 9
        Top = 6
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
        Left = 145
        Top = 6
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
        Left = 9
        Top = 20
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
        OnExit = edt_chaveExit
        OnKeyDown = edt_chaveKeyDown
      end
      object cb_ordem: TComboBox
        Left = 145
        Top = 20
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = edt_chaveChange
        OnExit = edt_chaveExit
      end
    end
  end
  object Panel1: TPanel
    Left = 632
    Top = 53
    Width = 110
    Height = 20
    Anchors = [akTop, akRight]
    TabOrder = 2
    object chkServicoNovo: TCheckBox
      Left = 5
      Top = 2
      Width = 100
      Height = 17
      Caption = 'Servi'#231'o Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = chkServicoNovoClick
    end
  end
  object menu_cadastro: TMainMenu
    Left = 545
    Top = 156
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
    object mi_duplicar: TMenuItem
      Caption = '&Duplicar'
      Enabled = False
      Hint = 'Duplicar Eventos'
      OnClick = btn_duplicarClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
